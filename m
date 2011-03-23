Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q2N6w-00005u-Uu for openembedded-core@lists.openembedded.org;
	Wed, 23 Mar 2011 13:24:27 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2NCMaNS028005
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2011 12:22:36 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26374-08 for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2011 12:22:32 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2NCMTx2027997
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2011 12:22:30 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4D87C5EA.1040602@mentor.com>
References: <cover.1300731672.git.raj.khem@gmail.com>
	<c9c4958668d457bef286c0c1e4038db23fc099c2.1300731672.git.raj.khem@gmail.com>
	<4D87C5EA.1040602@mentor.com>
Date: Wed, 23 Mar 2011 12:22:28 +0000
Message-ID: <1300882948.3018.0.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] perl-native_5.12.2.bb: Fix compliation on ubuntu 11.04-alpha
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Mar 2011 12:24:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-03-21 at 14:40 -0700, Tom Rini wrote:
> On 03/21/2011 11:23 AM, Khem Raj wrote:
> > Ubuntu has moved eglibc to /usr/lib/${arch}-linux-gnu and
> > /lib/${arch}-linux-gnu so we need that to be added to glibpth in
> > Configure.
> >
> > Currently we set LD=ld in environment for recipes inheriting native
> > class. This overrides the LD settings in the Makefiles of perl and
> > it tries to link by calling ld which does not work since its using
> > -l<x>  on commandline and ubuntu linker seems not to look into
> > the new location for these libraries. Its better to use gcc for linking
> > here anyway
> >
> > Signed-off-by: Khem Raj<raj.khem@gmail.com>
> > ---
> >   .../perl/files/Configure-multilib.patch            |   10 +++++++---
> >   meta/recipes-devtools/perl/perl-native_5.12.2.bb   |    4 +++-
> >   2 files changed, 10 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/perl/files/Configure-multilib.patch b/meta/recipes-devtools/perl/files/Configure-multilib.patch
> > index d3948a9..b561b6a 100644
> > --- a/meta/recipes-devtools/perl/files/Configure-multilib.patch
> > +++ b/meta/recipes-devtools/perl/files/Configure-multilib.patch
> > @@ -1,11 +1,15 @@
> > ---- perl-5.8.7/Configure.orig	2006-01-30 10:50:04.000000000 +0000
> > -+++ perl-5.8.7/Configure	2006-01-30 10:51:18.000000000 +0000
> > -@@ -1240,7 +1240,7 @@
> > +Index: perl-5.12.2/Configure
> > +===================================================================
> > +--- perl-5.12.2.orig/Configure
> > ++++ perl-5.12.2/Configure
> > @@ -28,6 +28,8 @@ S = "${WORKDIR}/perl-${PV}"
> >
> >   inherit native
> >
> > +export LD="${CC}"
> 
> We have CCLD for when we want to use CC as our LD (and yes, this usually 
> just ends up as CC, but lets be clear please).

Agreed, I've merged this patch but with the tweak from Tom.

Cheers,

Richard





