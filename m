Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E5F61786BF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2018 14:23:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w22ENfLL029546
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 2 Mar 2018 06:23:41 -0800 (PST)
Received: from server.local (128.224.20.107) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 2 Mar 2018 06:23:13 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <1519845645-21713-1-git-send-email-bruce.ashfield@windriver.com>
	<20180301082802.GA16294@mbabyjoh-desk.ger.corp.intel.com>
	<CAJTo0LYxPA=4=qQZSm0_AbWHCCG+=0j0+2pzmFrV76nxG7DRww@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <2e0d78eb-cce0-ffe0-867d-fea4f6d189e6@windriver.com>
Date: Fri, 2 Mar 2018 09:23:40 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYxPA=4=qQZSm0_AbWHCCG+=0j0+2pzmFrV76nxG7DRww@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] kernel-devsrc: restructure for out of tree (and on target) module builds
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
X-List-Received-Date: Fri, 02 Mar 2018 14:23:42 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

I worked through some problems to test with musl:

   - uprev'd linux-libc-headers --> refresh / change of the musl ethhdr
     patch

   - worked around the binutils link issue and libsystemd

So I was able to assemble kernel-devsrc on an image with musl, and now
I'm back to the problem that lead me to add glibc-utils to the RDEPENDS
of kernel-devsrc:

---------

root@qemux86-64:/lib/modules/4.14.19-yocto-standard/build# make ARCH=x86 
scripts
make: getconf: Command not found
make: getconf: Command not found
make: getconf: Command not found
   HOSTCC  scripts/basic/fixdep
   HOSTCC  scripts/basic/bin2c
make[1]: getconf: Command not found
make[1]: getconf: Command not found
make[1]: getconf: Command not found
   HOSTCC  scripts/kconfig/conf.o
   SHIPPED scripts/kconfig/zconf.tab.c
   SHIPPED scripts/kconfig/zconf.lex.c
   HOSTCC  scripts/kconfig/zconf.tab.o
   HOSTLD  scripts/kconfig/conf
scripts/kconfig/conf  --silentoldconfig Kconfig
   WRAP    arch/x86/include/generated/asm/clkdev.h
   WRAP    arch/x86/include/generated/asm/dma-contiguous.h
   WRAP    arch/x86/include/generated/asm/early_ioremap.h
   WRAP    arch/x86/include/generated/asm/mcs_spinlock.h
   WRAP    arch/x86/include/generated/asm/mm-arch-hooks.h
   CC      scripts/mod/empty.o
   HOSTCC  scripts/mod/mk_elfconfig
   MKELF   scripts/mod/elfconfig.h
   HOSTCC  scripts/mod/modpost.o
   CC      scripts/mod/devicetable-offsets.s
   CHK     scripts/mod/devicetable-offsets.h
   UPD     scripts/mod/devicetable-offsets.h
   HOSTCC  scripts/mod/file2alias.o
   HOSTCC  scripts/mod/sumversion.o
   HOSTLD  scripts/mod/modpost
   HOSTCC  scripts/kallsyms
   HOSTCC  scripts/conmakehash
   HOSTCC  scripts/recordmcount
   HOSTCC  scripts/sortextable
root@qemux86-64:/lib/modules/4.14.19-yocto-standard/build#

----------------

I've added Khem to the cc .. Khem: what in the muslc world would
provide 'getconf' ? I didn't see it when glancing through the packaging.

Bruce

On 2018-03-01 4:37 AM, Burton, Ross wrote:
> Also fails on musl:
> 
> ERROR: Nothing RPROVIDES 'glibc-utils' (but 
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl/build/meta/recipes-kernel/linux/kernel-devsrc.bb 
> <http://kernel-devsrc.bb> RDEPENDS on or otherwise requires it)
> 
> Ross
> 
> On 1 March 2018 at 08:28, Maxin B. John <maxin.john@intel.com 
> <mailto:maxin.john@intel.com>> wrote:
> 
>     Hi,
> 
>     On Wed, Feb 28, 2018 at 02:20:45PM -0500, Bruce Ashfield wrote:
>      > The existing kernel-devsrc package starts with a full copy of the
>     kernel
>      > source and then starts to strip out elements that are not required.
>      >
>      > This results in extra time (I/O) and extra space being taken up
>     in the
>      > final package. The main purpose of the kernel-devsrc package has
>     been to
>      > build modules against the running kernel, not to include a full
>     copy of
>      > the source code for re-building the kernel. The end result was a
>      > 600M kernel-devsrc package.
>      >
>      > This restructuring of the package uses an approach similar to other
>      > distros, where the kernel-devsrc package is for building against the
>      > running kernel and uses a curated set of copied infrastructure,
>     versus
>      > a mass copy of the entire kernel.
>      >
>      > The differences in this approach versus other is largely due to the
>      > architecture support and the split build/source directory of the
>      > kernel.
>      >
>      > The result is a kernel-devsrc package of about 10M, which is capable
>      > of running "make scripts" and compiling kernel modules against the
>      > running kernel.
>      >
>      > Along with the changes to the copying of the infrascture, we also
>      > have the following changes:
>      >
>      >  - a better/more explicit listing of dependencies for on-target
>      >    builds of "make scripts" or "make modules_prepare"
>      >
>      >  - The kernel source is installed into /lib/modules/<version>/build
>      >    and a symlink created from /usr/src/kernel to the new location.
>      >    This aligns with the standard location for module support
>      >    code
>      >
>      >  - There is also a symlink from /lib/modules/<version>/source ->
>     build
>      >    to reserve a spot for a new package that is simply the kernel
>      >    source. That package is not part of this update.
>      >
>      > [YOCTO #12535]
>      >
>      > Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com
>     <mailto:bruce.ashfield@windriver.com>>
>      > ---
>      >
>      >  v2: fix arch/arm devsrc builds
> 
>     Noticed one kernel-devsrc build failure in autobuilder (qemuarm) :
> 
>     https://autobuilder.yocto.io/builders/nightly-arm/builds/876/steps/BuildImages/logs/stdio
>     <https://autobuilder.yocto.io/builders/nightly-arm/builds/876/steps/BuildImages/logs/stdio>
> 
>     ERROR: kernel-devsrc-1.0-r0 do_install: Function failed: do_install
>     (log file is located at
>     /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/kernel-devsrc/1.0-r0/temp/log.do_install.25822)
>     ERROR: Logfile of failure stored in:
>     /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/kernel-devsrc/1.0-r0/temp/log.do_install.25822
>     Log data follows:
>     | DEBUG: Executing python function extend_recipe_sysroot
>     | NOTE: Direct dependencies are
>     ['/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/meta/recipes-devtools/binutils/binutils-cross_2.30.bb:do_populate_sysroot',
>     'virtual:native:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/meta/recipes-extended/xz/xz_5.2.3.bb:do_populate_sysroot',
>     'virtual:native:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot',
>     'virtual:native:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/meta/recipes-support/lzop/lzop_1.03.bb:do_populate_sysroot',
>     '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb:do_populate_sysroot',
>     '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/meta/recipes-devtools/gcc/gcc-runtime_7.3.bb:do_populate_sysroot',
>     '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/meta/recipes-devtools/gcc/gcc-cross_7.
>       3.bb:do_populate_sysroot',
>     'virtual:native:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/meta/recipes-devtools/bison/bison_3.0.4.bb:do_populate_sysroot',
>     'virtual:native:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/meta/recipes-devtools/pseudo/pseudo_1.8.2.bb:do_populate_sysroot',
>     '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/meta/recipes-core/glibc/glibc_2.26.bb:do_populate_sysroot',
>     '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/meta/recipes-kernel/kmod/kmod-native_git.bb:do_populate_sysroot',
>     'virtual:native:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/meta/recipes-extended/bc/bc_1.06.bb:do_populate_sysroot',
>     '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do_populate_sysroot',
>     'virtual:native:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/meta/recipes-connectivity/openssl/openssl_1.0.2n.bb:d
>       o_populate_sysroot']
>     | NOTE: Installed into sysroot: ['pkgconfig-native', 'lzop-native',
>     'kern-tools-native', 'pseudo-native', 'kmod-native', 'bc-native',
>     'openssl-native', 'gtk-doc-native', 'lzo-native',
>     'makedepend-native', 'cryptodev-linux-native', 'util-macros-native',
>     'xproto-native']
>     | NOTE: Skipping as already exists in sysroot:
>     ['binutils-cross-arm', 'xz-native', 'gcc-runtime', 'gcc-cross-arm',
>     'bison-native', 'glibc', 'quilt-native', 'gettext-minimal-native',
>     'gnu-config-native', 'automake-native', 'autoconf-native',
>     'libtool-native', 'linux-libc-headers', 'libgcc', 'zlib-native',
>     'texinfo-dummy-native', 'flex-native', 'libmpc-native',
>     'gmp-native', 'mpfr-native', 'm4-native']
>     | DEBUG: sed -e
>     's:^[^/]*/:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/kernel-devsrc/1.0-r0/recipe-sysroot-native/:g'
>     /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/sysroots-components/x86_64/pkgconfig-native/fixmepath
>     /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/sysroots-components/x86_64/openssl-native/fixmepath
>     /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/sysroots-components/x86_64/gtk-doc-native/fixmepath
>     | xargs sed -i -e
>     's:FIXMESTAGINGDIRTARGET:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/kernel-devsrc/1.0-r0/recipe-sysroot:g;
>     s:FIXMESTAGINGDIRHOST:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/kernel-devsrc/1.0-r0/recipe-sysroot-native:g'
>     -e 's:FIXME_COMPONENTS_DIR:/home/pokybuild/yocto-autobuilder/y
>       octo-worker/nightly-arm/build/build/tmp/sysroots-components:g' -e
>     's:FIXME_HOSTTOOLS_DIR:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/hosttools:g'
>     -e
>     's:FIXME_PKGDATA_DIR:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/pkgdata/qemuarm:g'
>     -e
>     's:FIXME_PSEUDO_LOCALSTATEDIR:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/kernel-devsrc/1.0-r0/pseudo/:g'
>     -e
>     's:FIXME_LOGFIFO:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/kernel-devsrc/1.0-r0/temp/fifo.25822:g'
>     | DEBUG: Python function extend_recipe_sysroot finished
>     | DEBUG: Executing shell function do_install
>     | cp: with --parents, the destination must be a directory
>     | Try 'cp --help' for more information.
>     | WARNING:
>     /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/kernel-devsrc/1.0-r0/temp/run.do_install.25822:1
>     exit 1 from 'rm -rf $kerneldir/build/include'
>     | ERROR: Function failed: do_install (log file is located at
>     /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/kernel-devsrc/1.0-r0/temp/log.do_install.25822)
>     NOTE: recipe kernel-devsrc-1.0-r0: task do_install: Failed
>     ERROR: Task
>     (/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/meta/recipes-kernel/linux/kernel-devsrc.bb:do_install)
>     failed with exit code '1'
> 
>     Best Regards,
>     Maxin
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
> 
> 


