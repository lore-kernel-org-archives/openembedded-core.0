Return-Path: <rpjday@crashcourse.ca>
Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
	by mail.openembedded.org (Postfix) with ESMTP id 58D8A61148
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 12:01:41 +0000 (UTC)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com
	([174.114.57.56]:43760 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92)
	(envelope-from <rpjday@crashcourse.ca>) id 1j3f5m-0047AO-0g
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Feb 2020 07:01:42 -0500
Date: Mon, 17 Feb 2020 07:01:34 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.21.2002170642560.2319307@localhost.localdomain>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel7.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel7.indieserve.net: authenticated_id:
	rpjday+crashcourse.ca/only user confirmed/virtual account not
	confirmed
X-Authenticated-Sender: cpanel7.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: how does "PREFERRED_PROVIDER" interact with layer priorities?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Feb 2020 12:01:41 -0000
Content-Type: text/plain; charset=US-ASCII


  (note: when i finally learn python, i'll be able to RTFS and figure
out stuff like this without assistance. until then ...)

  was going to enhance the explanation of PREFERRED_PROVIDER in the
docs, until i realized i don't understand it completely.

  first, if there is a recipe named, say, "foo", then even if there
are other recipes (with different names) that include:

  PROVIDES = "foo"

by default (and ignoring layer priority complications), if there is a
dependency on "foo", it is the "foo" recipe that will be selected as
the provider, correct? that is, if there is a recipe that *exactly*
matches the name requested, that's the selected provider?

  conversely, if one wants to override that default selection, one
would need to:

  PREFERRED_PROVIDER_foo = "foo_experimental"

in short, if the above is true, then there would seem to be no value
in ever stating:

  PREFERRED_PROVIDER_foo = "foo"

but i just noticed that that's done a fair bit in oe-core's
default-providers.inc, as in (just a few examples):

  PREFERRED_PROVIDER_opkg ?= "opkg"
  PREFERRED_PROVIDER_pkgconfig ?= "pkgconfig"
  PREFERRED_PROVIDER_openssl ?= "openssl"

that puzzled me until i saw this snippet from the same file:

  # Alternative is ltp-ddt in meta-oe: meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb
  PREFERRED_PROVIDER_ltp ?= "ltp"

which inspired the conclusion that if there is a higher priority layer
that provides that recipe name, *that* recipe would be used instead.
and since prio of oe-core is 5 and prio of meta-oe is 6, if you want
the *regular* oe-core recipe of "ltp", you need to explicitly ask for
it. is that what's going on here? because if it isn't, then i'm
unclear on the purpose of lines like the above.

rday

p.s. ironically, i was just going to see what meta-oe's recipe of
"ltp-ddt" was doing, but that recipe was deleted so, at the very
least, that comment should be removed.

