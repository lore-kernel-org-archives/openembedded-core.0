Return-Path: <rpjday@crashcourse.ca>
Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
	by mail.openembedded.org (Postfix) with ESMTP id 1B62860FFB
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Mar 2020 20:29:38 +0000 (UTC)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com
	([174.114.57.56]:35786 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa (TLS1.2) tls
	TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>) id 1j8VDW-00684e-DW
	for openembedded-core@lists.openembedded.org;
	Sun, 01 Mar 2020 15:29:39 -0500
Date: Sun, 1 Mar 2020 15:29:35 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.21.2003011506510.93328@localhost.localdomain>
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
Subject: best practises: how to properly "steal" recipes from a newer layer?
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
X-List-Received-Date: Sun, 01 Mar 2020 20:29:38 -0000
Content-Type: text/plain; charset=US-ASCII


  looking for a "best practises" suggestion ... currently working with
a layer based on morty (2.2), migrating it to thud (2.6) and i notice
that there are a *lot* of .bb recipe files in the morty layer that
did not exist in any of the official OE/YP layers in morty, so they
were added by either:

  1) writing the recipe from scratch, compatible with morty, or
  2) flat-out stealing that recipe from a *newer* layer, as long as
     it was compatible (this was done frequently)

all of this introduces a bit of complexity.

  when i peruse the recipe (.bb) files in the vendor's morty-based
layer, it's not at all obvious whether a given recipe file was written
from scratch because it did not exist, or whether it was "stolen" from
a newer layer (thud, warrior, etc...) as long as it was compatible.
there is nothing in the log to identify how that recipe file came into
existence, and that makes it messy since it requires examining each
recipe file individually and checking whether there is *now* (or at
least in a newer layer) such a recipe that can be appropriated (and
possibly customized by a simple .bbappend file).

  actual example -- in the vendor's morty-based layer, there is a full
recipe file for "cloc", for counting lines of code. such a recipe did
not exist in any OE/YP layer back in morty ... or thud ... or warrior
... or zeus ... but it was introduced in jan of 2020 in master, ikn
meta-oe/recipes-devtools.

  so, apparently, the vendor wrote a cloc recipe file from scratch as
it simply did not exist anywhere in the OE/YP universe *at that time*.
and something that simple (perl-based program to count lines of code)
is probably going to work fine with any layer.

  so in the midst of migration from morty to thud, that cloc recipe is
*still* not going to exist in thud but, based on my diligent research,
i now know it *will* exist in a newer layer/branch. so what is the
best way to use recipes in that circumstance?

  if i just blindly copy the recipe file forward, i'm going to have to
go through this all again at the next migration. is there a reasonable
way to add recipes to my (thud-based) layer that clearly shows those
recipes are being scarfed from a newer layer? and i don't mean
mentioning that in the commit msg as that will still require perusing
all those commit messages.

  is there a clean way to do this? it may sound trivial, but in this
case, i'm looking at a couple hundred recipes that eventually show up
in newer layers that i could steal, and i really want to hang onto
that information for the next migration.

  thoughts?

rday


