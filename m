Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TQIhi-0003iJ-Ks for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 16:10:48 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9MDufU3005779;
	Mon, 22 Oct 2012 14:56:41 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05302-04; Mon, 22 Oct 2012 14:56:37 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9MDuXSj005773
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 22 Oct 2012 14:56:34 +0100
Message-ID: <1350914194.2520.91.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 22 Oct 2012 14:56:34 +0100
In-Reply-To: <20121022131705.GH3269@jama.jama.net>
References: <1350658135.2520.29.camel@ted>
	<20121022104442.GD3269@jama.jama.net> <1350903508.2520.77.camel@ted>
	<20121022110809.GF3269@jama.jama.net> <1350906171.2520.82.camel@ted>
	<20121022120234.GG3269@jama.jama.net>
	<20121022131705.GH3269@jama.jama.net>
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
X-List-Received-Date: Mon, 22 Oct 2012 14:11:02 -0000
X-List-Received-Date: Mon, 22 Oct 2012 14:11:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-10-22 at 15:17 +0200, Martin Jansa wrote:
> On Mon, Oct 22, 2012 at 02:02:34PM +0200, Martin Jansa wrote:
> > On Mon, Oct 22, 2012 at 12:42:51PM +0100, Richard Purdie wrote:
> > > On Mon, 2012-10-22 at 13:08 +0200, Martin Jansa wrote:
> > > > On Mon, Oct 22, 2012 at 11:58:28AM +0100, Richard Purdie wrote:
> > > > > On Mon, 2012-10-22 at 12:44 +0200, Martin Jansa wrote:
> > > > > > On Fri, Oct 19, 2012 at 03:48:55PM +0100, Richard Purdie wrote:
> > > > > > > Now do_package isn't machine specific, we're only left with do_populate_sysroot as a
> > > > > > > machine specific task. This change marks only the machine specific manifests as machine
> > > > > > > specific, defaulting to PACKAGE_ARCH for everything else.
> > > > > > > 
> > > > > > > This means we do less work where there are multiple machines using the same
> > > > > > > core package architecture and we can start to clean up the sstate duplicate files
> > > > > > > whitelist.
> > > > > > > 
> > > > > > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > > > > > ---
> > > > > > > diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> > > > > > > index d2a120b..dee84bf 100644
> > > > > > > --- a/meta/classes/sstate.bbclass
> > > > > > > +++ b/meta/classes/sstate.bbclass
> > > > > > > @@ -17,10 +17,7 @@ SSTATE_EXTRAPATH   = ""
> > > > > > >  SSTATE_EXTRAPATHWILDCARD = ""
> > > > > > >  SSTATE_PATHSPEC   = "${SSTATE_DIR}/${SSTATE_EXTRAPATHWILDCARD}*/${SSTATE_PKGSPEC}"
> > > > > > >  
> > > > > > > -# In theory we should be using:
> > > > > > > -# SSTATE_DUPWHITELIST = "${DEPLOY_DIR_IMAGE}/ ${DEPLOY_DIR}/licenses/ ${DEPLOY_DIR_IPK}/all/ ${DEPLOY_DIR_RPM}/all ${DEPLOY_DIR_DEB}/all/ ${TMPDIR}/pkgdata/all${TARGET_VENDOR}-${TARGET_OS}"
> > > > > > > -# However until do_package is not machine specific, we'll have to make do with all of deploy/pkgdata.
> > > > > > > -SSTATE_DUPWHITELIST = "${DEPLOY_DIR}/ ${TMPDIR}/pkgdata/"
> > > > > > > +SSTATE_DUPWHITELIST = "${DEPLOY_DIR_IMAGE}/ ${DEPLOY_DIR}/licenses/"
> > > > > > 
> > > > > > Looks like warnings are back :/
> > > > > > 
> > > > > > WARNING: The recipe attr is trying to install files into a shared area when those files already exist. Those files are:
> > > > > >    /OE/jansa-test/shr-core/tmp-eglibc/deploy/ipk/armv7a-vfp-neon/attr-locale-de_2.4.46-r4_armv7a-vfp-neon.ipk
> > > > > >    /OE/jansa-test/shr-core/tmp-eglibc/deploy/ipk/armv7a-vfp-neon/attr-dbg_2.4.46-r4_armv7a-vfp-neon.ipk
> > > > > >    /OE/jansa-test/shr-core/tmp-eglibc/deploy/ipk/armv7a-vfp-neon/attr-locale-sv_2.4.46-r4_armv7a-vfp-neon.ipk
> > > > > > ...
> > > > > > 
> > > > > > and new warnings from pkgdata
> > > > > > WARNING: The recipe bison is trying to install files into a shared area when those files already exist. Those files are:
> > > > > >    /OE/jansa-test/shr-core/tmp-eglibc/pkgdata/armv7a-vfp-neon-oe-linux-gnueabi/bison
> > > > > >    /OE/jansa-test/shr-core/tmp-eglibc/pkgdata/armv7a-vfp-neon-oe-linux-gnueabi/runtime/bison-locale-nl.packaged
> > > > > >    /OE/jansa-test/shr-core/tmp-eglibc/pkgdata/armv7a-vfp-neon-oe-linux-gnueabi/runtime/bison-dbg.packaged
> > > > > >    /OE/jansa-test/shr-core/tmp-eglibc/pkgdata/armv7a-vfp-neon-oe-linux-gnueabi/runtime/bison-doc
> > > > > >    /OE/jansa-test/shr-core/tmp-eglibc/pkgdata/armv7a-vfp-neon-oe-linux-gnueabi/runtime/bison-locale-th.packaged
> > > > > > ...
> > > > > 
> > > > > The question is why as they shouldn't be, these changes were meant to
> > > > > fix this properly. Initially I wondered if this was another
> > > > > manifestation of https://bugzilla.yoctoproject.org/show_bug.cgi?id=3219
> > > > > but I'm not so sure.
> > > > 
> > ]> > Probably not as this happens on builder with 2 machines using the same
> > > > tune and the same CCARGS.
> > > > 
> > > > > Can you figure out which two recipes are trying to install these sets of
> > > > > files?
> > > > 
> > > > I'll try to compare them with scripts/sstate-diff.sh again to see if
> > > > checksums are the same between those 2 machines, but those warnings are
> > > > shown already when building 1 machine.
> 
> Hmm, checksums are different not only for target recipes but also for native now:
> 
> OE @ ~/jansa-test/shr-core $ ls */*/*/zlib-native*do_package.sigdata*
> stamps.1350908965/nokia900/x86_64-linux/zlib-native-1.2.7-r0.do_package.sigdata.f8ca8403df4a25b68553291341717a29
> stamps.1350908965/om-gta02/x86_64-linux/zlib-native-1.2.7-r0.do_package.sigdata.af2b16d88415c39245731409c8e15f70
> stamps.1350908965/tuna/x86_64-linux/zlib-native-1.2.7-r0.do_package.sigdata.815e9385589d3ffe41099fca79c3d8e7
> OE @ ~/jansa-test/shr-core $ ls */*/*/zlib-1*do_package.sigdata*
> stamps.1350908965/nokia900/armv7a-vfp-neon-oe-linux-gnueabi/zlib-1.2.7-r0.do_package.sigdata.3c23b95f321e5430b3d21d7288acea89
> stamps.1350908965/om-gta02/armv4t-oe-linux-gnueabi/zlib-1.2.7-r0.do_package.sigdata.bcfc3d562d4dc6d85b2d8bf0aa7f0b89
> stamps.1350908965/tuna/armv7a-vfp-neon-oe-linux-gnueabi/zlib-1.2.7-r0.do_package.sigdata.0b50fd9e90c6c922877f637378280163
> 
> OE om-gta02@shr ~/jansa-test/shr-core $ bitbake-diffsigs stamps.1350908965/nokia900/armv7a-vfp-neon-oe-linux-gnueabi/zlib-1.2.7-r0.do_package.sigdata.3c23b95f321e5430b3d21d7288acea89 stamps.1350908965/tuna/armv7a-vfp-neon-oe-linux-gnueabi/zlib-1.2.7-r0.do_package.sigdata.0b50fd9e90c6c922877f637378280163
> basehash changed from ff270729884d94ba712e579e19e9989f to b01c64c65799d2a3febcf7ec164a8b14
> Variable PKGTRIPLETS value changed from nokia900-oe-linux-gnueabi armv7a-vfp-neon-oe-linux-gnueabi armv7a-vfp-oe-linux-gnueabi armv7a-oe-linux-gnueabi armv6-vfp-oe-linux-gnueabi armv5e-vfp-oe-linux-gnueabi armv5e-oe-linux-gnueabi armv5-vfp-oe-linux-gnueabi armv5-oe-linux-gnueabi armv4-oe-linux-gnueabi arm-oe-linux-gnueabi noarch-oe-linux-gnueabi any-oe-linux-gnueabi all-oe-linux-gnueabi to tuna-oe-linux-gnueabi armv7a-vfp-neon-oe-linux-gnueabi armv7a-vfp-oe-linux-gnueabi armv7a-oe-linux-gnueabi armv6-vfp-oe-linux-gnueabi armv5e-vfp-oe-linux-gnueabi armv5e-oe-linux-gnueabi armv5-vfp-oe-linux-gnueabi armv5-oe-linux-gnueabi armv4-oe-linux-gnueabi arm-oe-linux-gnueabi noarch-oe-linux-gnueabi any-oe-linux-gnueabi all-oe-linux-gnueabi
> Hash for dependent task eglibc_2.16.bb.do_package changed from 44e54b452f831141f15d7fa61a637997 to 31b9950443659def02296d4b2aed43a5
> Hash for dependent task gcc-runtime_4.7.bb.do_package changed from 7db515c51f06c6db5a77e8f089aedf64 to 6e1ee054521f3a41fcc6e17aa0d8acbc

Ah, thanks, this explains a few things. I'll exclude that from the
checksums as this isn't the way it was intended to work.

I'm not sure how my tests locally didn't show this up :/.

Cheers,

Richard



