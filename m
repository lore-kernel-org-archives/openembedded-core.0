Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 77EC96F1A8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 20:20:22 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.5])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1WIkxo-0008NU-4s; Wed, 26 Feb 2014 21:20:20 +0100
Message-ID: <1393446014.2453.38.camel@e130.pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 26 Feb 2014 20:20:14 +0000
In-Reply-To: <CAJTo0LZ2hUW9TLGAZChNrE=5gSqbqxEsrSBJ4ewdGzrF4tpcng@mail.gmail.com>
References: <1393253881.31769.6.camel@ted> <20140224152753.GG26981@jama>
	<CAJTo0LYBuZv5NDyM1gsQEL5KQfOvMsRpvOn5kjFaYBi5XL8wCw@mail.gmail.com>
	<20140224160954.GI26981@jama> <1393259224.31769.15.camel@ted>
	<20140226191152.GS26981@jama>
	<CAJTo0LZ2hUW9TLGAZChNrE=5gSqbqxEsrSBJ4ewdGzrF4tpcng@mail.gmail.com>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.8.5-2+b1 
Mime-Version: 1.0
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -
X-Spam_report: Spam detection software,
	running on the system "hetzner.pbcl.net", has
	identified this incoming email as possible spam. The original message
	has been attached to this so you can view it (if it isn't spam) or
	label similar future email.  If you have any questions, see
	@@CONTACT_ADDRESS@@ for details.
	Content preview:  On Wed, 2014-02-26 at 19:54 +0000, Burton,
	Ross wrote: > Unless, of course,
	you work out where configure is looking to bail on > this test, 
	and if we can safely remove it on rebuilds. I don't think there's any
	safe
	way of defeating that configure check other than to properly clean
	${S}. You could add something like: [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: Separate build dir for autotools
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
X-List-Received-Date: Wed, 26 Feb 2014 20:20:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-02-26 at 19:54 +0000, Burton, Ross wrote:
> Unless, of course, you work out where configure is looking to bail on
> this test, and if we can safely remove it on rebuilds.

I don't think there's any safe way of defeating that configure check
other than to properly clean ${S}.  You could add something like:

if [ -f ${S}/config.status ]; then
  ( cd ${S} ; make distclean || true )
fi

to autotools.bbclass, which would probably take care of most of the
simple cases.

If you just remove config.status (and maybe config.h) then that'd
probably be enough to fool configure, but then you'd be running the risk
that the vpaths would pick up stale copies of generated files from ${S}
rather than rebuilding them in ${B}.

p.



