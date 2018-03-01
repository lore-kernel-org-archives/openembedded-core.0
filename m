Return-Path: <maxin.john@intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 32DF271D97
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 08:25:01 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Mar 2018 00:25:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,407,1515484800"; d="scan'208";a="33785933"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by fmsmga004.fm.intel.com with ESMTP; 01 Mar 2018 00:25:00 -0800
Date: Thu, 1 Mar 2018 10:28:03 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <20180301082802.GA16294@mbabyjoh-desk.ger.corp.intel.com>
References: <1519845645-21713-1-git-send-email-bruce.ashfield@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1519845645-21713-1-git-send-email-bruce.ashfield@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Thu, 01 Mar 2018 08:25:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Feb 28, 2018 at 02:20:45PM -0500, Bruce Ashfield wrote:
> The existing kernel-devsrc package starts with a full copy of the kernel
> source and then starts to strip out elements that are not required.
>=20
> This results in extra time (I/O) and extra space being taken up in the
> final package. The main purpose of the kernel-devsrc package has been to
> build modules against the running kernel, not to include a full copy of
> the source code for re-building the kernel. The end result was a
> 600M kernel-devsrc package.
>=20
> This restructuring of the package uses an approach similar to other
> distros, where the kernel-devsrc package is for building against the
> running kernel and uses a curated set of copied infrastructure, versus
> a mass copy of the entire kernel.
>=20
> The differences in this approach versus other is largely due to the
> architecture support and the split build/source directory of the
> kernel.
>=20
> The result is a kernel-devsrc package of about 10M, which is capable
> of running "make scripts" and compiling kernel modules against the
> running kernel.
>=20
> Along with the changes to the copying of the infrascture, we also
> have the following changes:
>=20
>  - a better/more explicit listing of dependencies for on-target
>    builds of "make scripts" or "make modules_prepare"
>=20
>  - The kernel source is installed into /lib/modules/<version>/build
>    and a symlink created from /usr/src/kernel to the new location.
>    This aligns with the standard location for module support
>    code
>=20
>  - There is also a symlink from /lib/modules/<version>/source -> build
>    to reserve a spot for a new package that is simply the kernel
>    source. That package is not part of this update.
>=20
> [YOCTO #12535]
>=20
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>=20
>  v2: fix arch/arm devsrc builds

Noticed one kernel-devsrc build failure in autobuilder (qemuarm) :

https://autobuilder.yocto.io/builders/nightly-arm/builds/876/steps/BuildIma=
ges/logs/stdio

ERROR: kernel-devsrc-1.0-r0 do_install: Function failed: do_install (log fi=
le is located at /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm=
/build/build/tmp/work/qemuarm-poky-linux-gnueabi/kernel-devsrc/1.0-r0/temp/=
log.do_install.25822)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-autobuilder/yoct=
o-worker/nightly-arm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/kernel=
-devsrc/1.0-r0/temp/log.do_install.25822
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-autobuilder/yocto-w=
orker/nightly-arm/build/meta/recipes-devtools/binutils/binutils-cross_2.30.=
bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-autobuilder/=
yocto-worker/nightly-arm/build/meta/recipes-extended/xz/xz_5.2.3.bb:do_popu=
late_sysroot', 'virtual:native:/home/pokybuild/yocto-autobuilder/yocto-work=
er/nightly-arm/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_po=
pulate_sysroot', 'virtual:native:/home/pokybuild/yocto-autobuilder/yocto-wo=
rker/nightly-arm/build/meta/recipes-support/lzop/lzop_1.03.bb:do_populate_s=
ysroot', '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/=
meta/recipes-kernel/kern-tools/kern-tools-native_git.bb:do_populate_sysroot=
', '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/meta/r=
ecipes-devtools/gcc/gcc-runtime_7.3.bb:do_populate_sysroot', '/home/pokybui=
ld/yocto-autobuilder/yocto-worker/nightly-arm/build/meta/recipes-devtools/g=
cc/gcc-cross_7.3.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/y=
octo-autobuilder/yocto-worker/nightly-arm/build/meta/recipes-devtools/bison=
/bison_3.0.4.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto=
-autobuilder/yocto-worker/nightly-arm/build/meta/recipes-devtools/pseudo/ps=
eudo_1.8.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-autobuilder/yoct=
o-worker/nightly-arm/build/meta/recipes-core/glibc/glibc_2.26.bb:do_populat=
e_sysroot', '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/bui=
ld/meta/recipes-kernel/kmod/kmod-native_git.bb:do_populate_sysroot', 'virtu=
al:native:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/=
meta/recipes-extended/bc/bc_1.06.bb:do_populate_sysroot', '/home/pokybuild/=
yocto-autobuilder/yocto-worker/nightly-arm/build/meta/recipes-devtools/quil=
t/quilt-native_0.65.bb:do_populate_sysroot', 'virtual:native:/home/pokybuil=
d/yocto-autobuilder/yocto-worker/nightly-arm/build/meta/recipes-connectivit=
y/openssl/openssl_1.0.2n.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: ['pkgconfig-native', 'lzop-native', 'kern-t=
ools-native', 'pseudo-native', 'kmod-native', 'bc-native', 'openssl-native'=
, 'gtk-doc-native', 'lzo-native', 'makedepend-native', 'cryptodev-linux-nat=
ive', 'util-macros-native', 'xproto-native']
| NOTE: Skipping as already exists in sysroot: ['binutils-cross-arm', 'xz-n=
ative', 'gcc-runtime', 'gcc-cross-arm', 'bison-native', 'glibc', 'quilt-nat=
ive', 'gettext-minimal-native', 'gnu-config-native', 'automake-native', 'au=
toconf-native', 'libtool-native', 'linux-libc-headers', 'libgcc', 'zlib-nat=
ive', 'texinfo-dummy-native', 'flex-native', 'libmpc-native', 'gmp-native',=
 'mpfr-native', 'm4-native']
| DEBUG: sed -e 's:^[^/]*/:/home/pokybuild/yocto-autobuilder/yocto-worker/n=
ightly-arm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/kernel-devsrc/1.=
0-r0/recipe-sysroot-native/:g' /home/pokybuild/yocto-autobuilder/yocto-work=
er/nightly-arm/build/build/tmp/sysroots-components/x86_64/pkgconfig-native/=
fixmepath /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/=
build/tmp/sysroots-components/x86_64/openssl-native/fixmepath /home/pokybui=
ld/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/sysroots-comp=
onents/x86_64/gtk-doc-native/fixmepath | xargs sed -i -e 's:FIXMESTAGINGDIR=
TARGET:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/bui=
ld/tmp/work/qemuarm-poky-linux-gnueabi/kernel-devsrc/1.0-r0/recipe-sysroot:=
g; s:FIXMESTAGINGDIRHOST:/home/pokybuild/yocto-autobuilder/yocto-worker/nig=
htly-arm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/kernel-devsrc/1.0-=
r0/recipe-sysroot-native:g' -e 's:FIXME_COMPONENTS_DIR:/home/pokybuild/yoct=
o-autobuilder/yocto-worker/nightly-arm/build/build/tmp/sysroots-components:=
g' -e 's:FIXME_HOSTTOOLS_DIR:/home/pokybuild/yocto-autobuilder/yocto-worker=
/nightly-arm/build/build/tmp/hosttools:g' -e 's:FIXME_PKGDATA_DIR:/home/pok=
ybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/pkgdata/q=
emuarm:g' -e 's:FIXME_PSEUDO_LOCALSTATEDIR:/home/pokybuild/yocto-autobuilde=
r/yocto-worker/nightly-arm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/=
kernel-devsrc/1.0-r0/pseudo/:g' -e 's:FIXME_LOGFIFO:/home/pokybuild/yocto-a=
utobuilder/yocto-worker/nightly-arm/build/build/tmp/work/qemuarm-poky-linux=
-gnueabi/kernel-devsrc/1.0-r0/temp/fifo.25822:g'
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_install
| cp: with --parents, the destination must be a directory
| Try 'cp --help' for more information.
| WARNING: /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build=
/build/tmp/work/qemuarm-poky-linux-gnueabi/kernel-devsrc/1.0-r0/temp/run.do=
_install.25822:1 exit 1 from 'rm -rf $kerneldir/build/include'
| ERROR: Function failed: do_install (log file is located at /home/pokybuil=
d/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/work/qemuarm-p=
oky-linux-gnueabi/kernel-devsrc/1.0-r0/temp/log.do_install.25822)
NOTE: recipe kernel-devsrc-1.0-r0: task do_install: Failed
ERROR: Task (/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/bui=
ld/meta/recipes-kernel/linux/kernel-devsrc.bb:do_install) failed with exit =
code '1'

Best Regards,
Maxin

