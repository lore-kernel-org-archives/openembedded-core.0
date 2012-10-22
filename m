Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TQFvQ-0006TP-4C for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 13:12:04 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9MAwa3H004140;
	Mon, 22 Oct 2012 11:58:36 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02610-08; Mon, 22 Oct 2012 11:58:31 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9MAwS5j004134
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 22 Oct 2012 11:58:29 +0100
Message-ID: <1350903508.2520.77.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 22 Oct 2012 11:58:28 +0100
In-Reply-To: <20121022104442.GD3269@jama.jama.net>
References: <1350658135.2520.29.camel@ted>
	<20121022104442.GD3269@jama.jama.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sstate: Improve handling of machine specific manifests
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Oct 2012 11:12:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-10-22 at 12:44 +0200, Martin Jansa wrote:
> On Fri, Oct 19, 2012 at 03:48:55PM +0100, Richard Purdie wrote:
> > Now do_package isn't machine specific, we're only left with do_populate_sysroot as a
> > machine specific task. This change marks only the machine specific manifests as machine
> > specific, defaulting to PACKAGE_ARCH for everything else.
> > 
> > This means we do less work where there are multiple machines using the same
> > core package architecture and we can start to clean up the sstate duplicate files
> > whitelist.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> > index d2a120b..dee84bf 100644
> > --- a/meta/classes/sstate.bbclass
> > +++ b/meta/classes/sstate.bbclass
> > @@ -17,10 +17,7 @@ SSTATE_EXTRAPATH   = ""
> >  SSTATE_EXTRAPATHWILDCARD = ""
> >  SSTATE_PATHSPEC   = "${SSTATE_DIR}/${SSTATE_EXTRAPATHWILDCARD}*/${SSTATE_PKGSPEC}"
> >  
> > -# In theory we should be using:
> > -# SSTATE_DUPWHITELIST = "${DEPLOY_DIR_IMAGE}/ ${DEPLOY_DIR}/licenses/ ${DEPLOY_DIR_IPK}/all/ ${DEPLOY_DIR_RPM}/all ${DEPLOY_DIR_DEB}/all/ ${TMPDIR}/pkgdata/all${TARGET_VENDOR}-${TARGET_OS}"
> > -# However until do_package is not machine specific, we'll have to make do with all of deploy/pkgdata.
> > -SSTATE_DUPWHITELIST = "${DEPLOY_DIR}/ ${TMPDIR}/pkgdata/"
> > +SSTATE_DUPWHITELIST = "${DEPLOY_DIR_IMAGE}/ ${DEPLOY_DIR}/licenses/"
> 
> Looks like warnings are back :/
> 
> WARNING: The recipe attr is trying to install files into a shared area when those files already exist. Those files are:
>    /OE/jansa-test/shr-core/tmp-eglibc/deploy/ipk/armv7a-vfp-neon/attr-locale-de_2.4.46-r4_armv7a-vfp-neon.ipk
>    /OE/jansa-test/shr-core/tmp-eglibc/deploy/ipk/armv7a-vfp-neon/attr-dbg_2.4.46-r4_armv7a-vfp-neon.ipk
>    /OE/jansa-test/shr-core/tmp-eglibc/deploy/ipk/armv7a-vfp-neon/attr-locale-sv_2.4.46-r4_armv7a-vfp-neon.ipk
> ...
> 
> and new warnings from pkgdata
> WARNING: The recipe bison is trying to install files into a shared area when those files already exist. Those files are:
>    /OE/jansa-test/shr-core/tmp-eglibc/pkgdata/armv7a-vfp-neon-oe-linux-gnueabi/bison
>    /OE/jansa-test/shr-core/tmp-eglibc/pkgdata/armv7a-vfp-neon-oe-linux-gnueabi/runtime/bison-locale-nl.packaged
>    /OE/jansa-test/shr-core/tmp-eglibc/pkgdata/armv7a-vfp-neon-oe-linux-gnueabi/runtime/bison-dbg.packaged
>    /OE/jansa-test/shr-core/tmp-eglibc/pkgdata/armv7a-vfp-neon-oe-linux-gnueabi/runtime/bison-doc
>    /OE/jansa-test/shr-core/tmp-eglibc/pkgdata/armv7a-vfp-neon-oe-linux-gnueabi/runtime/bison-locale-th.packaged
> ...

The question is why as they shouldn't be, these changes were meant to
fix this properly. Initially I wondered if this was another
manifestation of https://bugzilla.yoctoproject.org/show_bug.cgi?id=3219
but I'm not so sure.

Can you figure out which two recipes are trying to install these sets of
files?

Or perhaps this is a one off transition issue I didn't see here when
testing this? Does a build from a clean tmp do this?

Cheers,

Richard









