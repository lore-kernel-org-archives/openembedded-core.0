Received: from co1ehsobe005.messaging.microsoft.com ([216.32.180.188]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1T9NZ2-0004Mb-BY
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Sep 2012 23:55:12 +0200
Received: from mail69-co1-R.bigfish.com (10.243.78.244) by
	CO1EHSOBE015.bigfish.com (10.243.66.78) with Microsoft SMTP Server id
	14.1.225.23; Wed, 5 Sep 2012 21:42:48 +0000
Received: from mail69-co1 (localhost [127.0.0.1])	by mail69-co1-R.bigfish.com
	(Postfix) with ESMTP id DD084CC01AC;
	Wed,  5 Sep 2012 21:42:47 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202hzz8275ch8275bh8275dhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2hbe9i1155h)
Received: from mail69-co1 (localhost.localdomain [127.0.0.1]) by mail69-co1
	(MessageSwitch) id 1346881365819932_7031;
	Wed,  5 Sep 2012 21:42:45 +0000 (UTC)
Received: from CO1EHSMHS029.bigfish.com (unknown [10.243.78.239])	by
	mail69-co1.bigfish.com (Postfix) with ESMTP id C3449C0045;
	Wed,  5 Sep 2012 21:42:45 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS029.bigfish.com
	(10.243.66.39) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 5 Sep 2012 21:42:43 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.57]) by
	039-SN1MMR1-004.039d.mgd.msft.net ([::1]) with mapi id 14.02.0309.003;
	Wed, 5 Sep 2012 16:42:43 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Thread-Topic: [OE-core] [for-denzil][meta-oe][PATCH 09/11] kernel: Add
	kernel headers to kernel-dev package
Thread-Index: AQHNi69g16iWHsp3Yk2zmlOC8q56rg==
Date: Wed, 5 Sep 2012 21:42:41 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A64E50F@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1346136108-13062-1-git-send-email-koen@dominion.thruhere.net>
	<1346136108-13062-9-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1346136108-13062-9-git-send-email-koen@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Darren Hart <dvhart@linux.intel.com>,
	Scott Garman <scott.a.garman@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [for-denzil][meta-oe][PATCH 09/11] kernel: Add kernel headers to kernel-dev package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Sep 2012 21:55:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <F31829FDD407D545897E1A27825FECBD@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 28, 2012 at 1:41 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
> From: Darren Hart <dvhart@linux.intel.com>
>
> [YOCTO #1614]
>
> Add the kernel headers to the kernel-dev package. This packages what was
> already built and kept in sysroots for building modules with bitbake.
> Making this available on the target requires removing some additional
> host binaries.
>
> Move the location to /usr/src/kernel
>
> Before use on the target, the user will need to:
>
>     # cd /usr/src/kernel
>     # make scripts
>
> This renders the kernel-misc recipe empty, so remove it.
>
> As we use /usr/src/kernel in several places (and I missed one in the
> previous version), add a KERNEL_SRC_DIR variable and use that throughout
> the class to avoid update errors in the future.
>
> Now that we package the kernel headers, drop the
> kernel_package_preprocess function which removed them from PKGD.
>
> All *-sdk image recipes include dev-pkgs, so the kernel-dev package will
> be installed by default on all such images.
>
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> CC: Bruce Ashfield <bruce.ashfield@windriver.com>
> CC: Tom Zanussi <tom.zanussi@intel.com>
> CC: Khem Raj <raj.khem@gmail.com>
>
> ---
>  meta/classes/kernel.bbclass |   25 +++++++++++--------------
>  meta/conf/bitbake.conf      |    2 +-
>  2 files changed, 12 insertions(+), 15 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 3ccd753..d79ba9f 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -77,6 +77,10 @@ EXTRA_OEMAKE =3D ""
>
>  KERNEL_ALT_IMAGETYPE ??=3D ""
>
> +# Define where the kernel headers are installed on the target as well as=
 where
> +# they are staged.
> +KERNEL_SRC_PATH =3D "/usr/src/kernel"
> +
>  KERNEL_IMAGETYPE_FOR_MAKE =3D "${@(lambda s: s[:-3] if s[-3:] =3D=3D ".g=
z" else s)(d.getVar('KERNEL_IMAGETYPE', True))}"
>
>  kernel_do_compile() {
> @@ -130,7 +134,7 @@ kernel_do_install() {
>         # Support for external module building - create a minimal copy of=
 the
>         # kernel source tree.
>         #
> -       kerneldir=3D${D}/kernel
> +       kerneldir=3D${D}${KERNEL_SRC_PATH}
>         install -d $kerneldir
>
>         #
> @@ -191,20 +195,15 @@ kernel_do_install() {
>         # Remove the following binaries which cause strip errors
>         # during do_package for cross-compiled platforms
>         bin_files=3D"arch/powerpc/boot/addnote arch/powerpc/boot/hack-cof=
f \
> -                  arch/powerpc/boot/mktree"
> +                  arch/powerpc/boot/mktree scripts/kconfig/zconf.tab.o \
> +                  scripts/kconfig/conf.o"
>         for entry in $bin_files; do
>                 rm -f $kerneldir/$entry
>         done
>  }
>
> -PACKAGE_PREPROCESS_FUNCS +=3D "kernel_package_preprocess"
> -
> -kernel_package_preprocess () {
> -       rm -rf ${PKGD}/kernel
> -}
> -
>  sysroot_stage_all_append() {
> -       sysroot_stage_dir ${D}/kernel ${SYSROOT_DESTDIR}/kernel
> +       sysroot_stage_dir ${D}${KERNEL_SRC_PATH} ${SYSROOT_DESTDIR}${KERN=
EL_SRC_PATH}
>  }
>
>  kernel_do_configure() {
> @@ -252,13 +251,11 @@ EXPORT_FUNCTIONS do_compile do_install do_configure
>
>  # kernel-base becomes kernel-${KERNEL_VERSION}
>  # kernel-image becomes kernel-image-${KERNEL_VERISON}
> -PACKAGES =3D "kernel kernel-base kernel-image kernel-dev kernel-vmlinux =
kernel-misc"
> +PACKAGES =3D "kernel kernel-base kernel-vmlinux kernel-image kernel-dev"
>  FILES =3D ""
>  FILES_kernel-image =3D "/boot/${KERNEL_IMAGETYPE}*"
> -FILES_kernel-dev =3D "/boot/System.map* /boot/Module.symvers* /boot/conf=
ig*"
> +FILES_kernel-dev =3D "/boot/System.map* /boot/Module.symvers* /boot/conf=
ig* ${KERNEL_SRC_PATH}"

This patch is causing the following on denzil (which Scott applied to
his denzil-next branch)

ERROR: QA Issue: non debug package contains .debug directory:
kernel-dev path
/work/p5020ds_64b-poky-linux/linux-qoriq-sdk-3.0.34-r4/packages-split/kerne=
l-dev/usr/src/kernel/tools/perf/.debug/perf
ERROR: QA run found fatal errors. Please consider fixing them.
ERROR: Function failed: do_package_qa
ERROR: Logfile of failure stored in:
/local/home/mattsm/git/poky/build-denzil/tmp/work/p5020ds_64b-poky-linux/li=
nux-qoriq-sdk-3.0.34-r4/temp/log.do_package.26851
NOTE: package linux-qoriq-sdk-3.0.34-r4: task do_package: Failed
ERROR: Task 13 (/local/home/mattsm/git/poky/build-denzil/../meta-fsl-ppc/re=
cipes-kernel/linux/linux-qoriq-sdk.bb,
do_package) failed with exit code '1'

At first glance, it looks like we should:

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 7ae2a53..511b22b 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -546,4 +546,5 @@ EXPORT_FUNCTIONS do_deploy
 PACKAGES =3D+ "perf-dbg perf"
 FILES_perf =3D "${bindir}/* \
               ${libexecdir}"
-FILES_perf-dbg =3D "${FILES_${PN}-dbg}"
+FILES_perf-dbg =3D "${FILES_${PN}-dbg} \
+                 ${KERNEL_SRC_PATH}/tools/perf/.debug"

Thoughts?

-M


>  FILES_kernel-vmlinux =3D "/boot/vmlinux*"
> -# misc is a package to contain files we need in staging
> -FILES_kernel-misc =3D "/kernel/include/config /kernel/scripts /kernel/dr=
ivers/crypto /kernel/drivers/media"
>  RDEPENDS_kernel =3D "kernel-base"
>  # Allow machines to override this dependency if kernel image files are
>  # not wanted in images as standard
> @@ -475,7 +472,7 @@ python populate_packages_prepend () {
>         metapkg =3D "kernel-modules"
>         d.setVar('ALLOW_EMPTY_' + metapkg, "1")
>         d.setVar('FILES_' + metapkg, "")
> -       blacklist =3D [ 'kernel-dev', 'kernel-image', 'kernel-base', 'ker=
nel-vmlinux', 'perf', 'perf-dbg', 'kernel-misc' ]
> +       blacklist =3D [ 'kernel-dev', 'kernel-image', 'kernel-base', 'ker=
nel-vmlinux', 'perf', 'perf-dbg' ]
>         for l in module_deps.values():
>                 for i in l:
>                         pkg =3D module_pattern % legitimize_package_name(=
re.match(module_regex, os.path.basename(i)).group(1))
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 618780c..85ba108 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -376,7 +376,7 @@ SDKPATHNATIVE =3D "${SDKPATH}/sysroots/${SDK_SYS}"
>  ##################################################################
>
>  OLDEST_KERNEL =3D "2.6.16"
> -STAGING_KERNEL_DIR =3D "${STAGING_DIR_HOST}/kernel"
> +STAGING_KERNEL_DIR =3D "${STAGING_DIR_HOST}/usr/src/kernel"
>
>  ##################################################################
>  # Specific image creation and rootfs population info.
> --
> 1.7.7.6
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



