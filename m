Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by mail.openembedded.org (Postfix) with ESMTP id CC7B965DED
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Apr 2014 18:33:21 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N4L002AINJLNF20@vms173025.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Fri, 25 Apr 2014 13:33:21 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 690B7200A9; Fri,
	25 Apr 2014 14:33:20 -0400 (EDT)
Date: Fri, 25 Apr 2014 14:33:20 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-id: <20140425183320.GY11339@denix.org>
References: <cover.1398443925.git.Martin.Jansa@gmail.com>
	<394b5e1da57b3bf0d90c1c5185f394d865a394bf.1398443925.git.Martin.Jansa@gmail.com>
	<1398445474.16672.201.camel@ted>
MIME-version: 1.0
In-reply-to: <1398445474.16672.201.camel@ted>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/5] WIP: feature-arm-thumb.inc: respect ARM_INSTRUCTION_SET when adding thumb suffix
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
X-List-Received-Date: Fri, 25 Apr 2014 18:33:29 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Apr 25, 2014 at 06:04:34PM +0100, Richard Purdie wrote:
> On Fri, 2014-04-25 at 18:40 +0200, Martin Jansa wrote:
> > * this means that recipes with ARM_INSTRUCTION_SET explicitly changed
> >   to arm will be built in feed without thumb suffix
> > * It looks like the rest of system doesn't correctly support different
> >   TUNE_PKGARCHs for different recipes (e.g. eglibc-initial fails)
> >   so this needs a bit more work
> > 
> >   config.log:
> >   configure:2768: arm-oe-linux-gnueabi-gcc  -march=armv5e -marm -mthumb-interwork --sysroot=/OE/build/oe-core/tmp-eglibc/sysroots/qemuarm -c  -O2 -pipe -g -feliminate-unused-debug-types  conftest.c >&5
> >   /OE/build/oe-core/tmp-eglibc/work/armv5e-oe-linux-gnueabi/eglibc-initial/2.18-r0/eglibc-2.18/libc/configure: line 2770: arm-oe-linux-gnueabi-gcc: command not found
> >   configure:2772: $? = 127
> > 
> >   and the problem is basically that STAGING_BINDIR_TOOLCHAIN points to
> >   different directory when building recipe with thumb enabled and
> >   disabled, in this case gcc was built with thumb enabled and is installed
> >   in:
> > 
> >   sysroots/x86_64-linux/usr/bin/armv5te-oe-linux-gnueabi
> > 
> >   OE qemuarm@ ~/build/oe-core $ ls /OE/build/oe-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/armv5te-oe-linux-gnueabi
> >   arm-oe-linux-gnueabi-addr2line  arm-oe-linux-gnueabi-elfedit
> >   arm-oe-linux-gnueabi-nm       arm-oe-linux-gnueabi-readelf
> >   arm-oe-linux-gnueabi-ar         arm-oe-linux-gnueabi-gprof
> >   arm-oe-linux-gnueabi-objcopy  arm-oe-linux-gnueabi-size
> >   arm-oe-linux-gnueabi-as         arm-oe-linux-gnueabi-ld
> >   arm-oe-linux-gnueabi-objdump  arm-oe-linux-gnueabi-strings
> >   arm-oe-linux-gnueabi-c++filt    arm-oe-linux-gnueabi-ld.bfd
> >   arm-oe-linux-gnueabi-ranlib   arm-oe-linux-gnueabi-strip
> > 
> >   but when building eglibc-initial with thumb disalbed, TUNE_PKGARCH
> >   becames armv5e and STAGING_BINDIR_TOOLCHAIN in PATH points to wrong dir:
> > 
> >   $STAGING_BINDIR_TOOLCHAIN
> >     set conf/bitbake.conf:354
> >      "${STAGING_DIR_NATIVE}${bindir_native}/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}"
> >   STAGING_BINDIR_TOOLCHAIN="/OE/build/oe-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/armv5e-oe-linux-gnueabi"
> > 
> >   OE qemuarm@ ~/build/oe-core $ ls /OE/build/oe-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/armv5e-oe-linux-gnueabi
> >   ls: cannot access /OE/build/oe-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/armv5e-oe-linux-gnueabi: No such file or directory
> > 
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/conf/machine/include/arm/feature-arm-thumb.inc | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> You might find my WIP gcc changes happen to fix some of the issues
> you're running into here since there is one compiler for all of arm
> regardless of tune.
> 
> Half of this merged to master, the other half is roughly what is on the
> top of:
> 
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rpurdie/t222
> 
> although this is still WIP too.

Heh, and I was also looking into STAGING_BINDIR_TOOLCHAIN and TUNE_PKGARCH 
issues lately, although for slightly different reason. I'll be sure to check 
your WIP fixes soon...


> > diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/conf/machine/include/arm/feature-arm-thumb.inc
> > index 8a38665..6c5d1d6 100644
> > --- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
> > +++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
> > @@ -28,7 +28,8 @@ python () {
> >  TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ' -m${ARM_M_OPT}', '', d)}"
> >  OVERRIDES .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ':thumb', '', d)}"
> >  
> > -ARMPKGSFX_THUMB .= "${ARM_THUMB_SUFFIX}"
> > +# Add suffix from ARM_THUMB_SUFFIX only if after all this we still set ARM_M_OPT to thumb
> > +ARMPKGSFX_THUMB .= "${@ d.getVar('ARM_THUMB_SUFFIX', True) if d.getVar('ARM_M_OPT', True) == 'thumb' else ''}"
> >  
> >  # Whether to compile with code to allow interworking between the two
> >  # instruction sets. This allows thumb code to be executed on a primarily
> > -- 
> > 1.9.1
> > 
> 
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

