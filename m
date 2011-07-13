Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qh6nb-00084W-Fq
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 23:16:52 +0200
Received: by pzk36 with SMTP id 36so5078170pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2011 14:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=9wZyn2m2HfI+98s2oIY2UwuXMvby/x1RLdrwUWB5mTo=;
	b=kBwfR6ldCN9vCfbjLvD4yDVS7kHMx4hmVwELpAhcb708CQBq1UCoVFY9MSQFqmb3y0
	bhVlqnpvRsTel/blrZILhUPQRCP7PtZoKQheFutCVcP3WyJpj9P9yFe3Hl2mDe2BmqOR
	ysLyRsurHaHTyOgXjd+6nVolAF8H0DdknnGF8=
Received: by 10.68.10.103 with SMTP id h7mr1897241pbb.211.1310591571212; Wed,
	13 Jul 2011 14:12:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.62.36 with HTTP; Wed, 13 Jul 2011 14:12:21 -0700 (PDT)
In-Reply-To: <6220e9316f6033364724b5d7a86917848dadf6be.1310561877.git.nitin.a.kamble@intel.com>
References: <cover.1310561877.git.nitin.a.kamble@intel.com>
	<6220e9316f6033364724b5d7a86917848dadf6be.1310561877.git.nitin.a.kamble@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Jul 2011 14:12:21 -0700
Message-ID: <CAMKF1sq4LABrt1an2GfYm=yGP-Mf7bGrw7WAPJAD38tcHNszRg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] bitbake.conf, bbclasses: define *_LD_ARCH & *AS_ARCH vars
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
X-List-Received-Date: Wed, 13 Jul 2011 21:16:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 13, 2011 at 5:59 AM,  <nitin.a.kamble@intel.com> wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>
> Just like TARGET_CC_ARCH, HOST_CC_ARCH, BUILD_CC_ARCH, SDK_CC_ARCH
> define similar variables for LD & AS.
>
> This is needed because for x32 need special parameters to be passed
> to the "gcc" as well as "ld" & "as".


IMO this ties to multilib work that we have been discussing and doing.
I dont know if we are trying to get rid of *_CC_ARCH variables in favor
of some generic way of conveying ABI information to toolchain and build
system but that would be a nicer approach.

>
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
> =C2=A0meta/classes/allarch.bbclass =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
=C2=A0 =C2=A02 ++
> =C2=A0meta/classes/cross-canadian.bbclass =C2=A0 =C2=A0| =C2=A0 =C2=A02 +=
+
> =C2=A0meta/classes/cross.bbclass =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 =C2=A02 ++
> =C2=A0meta/classes/crosssdk.bbclass =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
=C2=A0 =C2=A02 ++
> =C2=A0meta/classes/kernel.bbclass =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| =C2=A0 =C2=A04 ++++
> =C2=A0meta/classes/native.bbclass =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| =C2=A0 10 +++++++---
> =C2=A0meta/classes/nativesdk.bbclass =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0=
 =C2=A04 ++++
> =C2=A0meta/classes/toolchain-scripts.bbclass | =C2=A0 =C2=A05 +++--
> =C2=A0meta/conf/bitbake.conf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 21 +++++++++++++++------
> =C2=A0meta/conf/documentation.conf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
=C2=A0 =C2=A02 ++
> =C2=A010 files changed, 43 insertions(+), 11 deletions(-)
>
> diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
> index e3ac392..2d25850 100644
> --- a/meta/classes/allarch.bbclass
> +++ b/meta/classes/allarch.bbclass
> @@ -13,4 +13,6 @@ INHIBIT_DEFAULT_DEPS =3D "1"
> =C2=A0TARGET_ARCH =3D "allarch"
> =C2=A0TARGET_OS =3D "linux"
> =C2=A0TARGET_CC_ARCH =3D "none"
> +TARGET_LD_ARCH =3D "none"
> +TARGET_AS_ARCH =3D "none"
> =C2=A0PACKAGE_EXTRA_ARCHS =3D ""
> diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-can=
adian.bbclass
> index edd51da..5669fe0 100644
> --- a/meta/classes/cross-canadian.bbclass
> +++ b/meta/classes/cross-canadian.bbclass
> @@ -42,6 +42,8 @@ HOST_VENDOR =3D "${SDK_VENDOR}"
> =C2=A0HOST_OS =3D "${SDK_OS}"
> =C2=A0HOST_PREFIX =3D "${SDK_PREFIX}"
> =C2=A0HOST_CC_ARCH =3D "${SDK_CC_ARCH}"
> +HOST_LD_ARCH =3D "${SDK_LD_ARCH}"
> +HOST_AS_ARCH =3D "${SDK_AS_ARCH}"
>
> =C2=A0#assign DPKG_ARCH
> =C2=A0DPKG_ARCH =3D "${SDK_ARCH}"
> diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
> index f9fd07a..86049c8 100644
> --- a/meta/classes/cross.bbclass
> +++ b/meta/classes/cross.bbclass
> @@ -19,6 +19,8 @@ HOST_VENDOR =3D "${BUILD_VENDOR}"
> =C2=A0HOST_OS =3D "${BUILD_OS}"
> =C2=A0HOST_PREFIX =3D "${BUILD_PREFIX}"
> =C2=A0HOST_CC_ARCH =3D "${BUILD_CC_ARCH}"
> +HOST_LD_ARCH =3D "${BUILD_LD_ARCH}"
> +HOST_AS_ARCH =3D "${BUILD_AS_ARCH}"
>
> =C2=A0STAGING_DIR_HOST =3D "${STAGING_DIR}/${BASEPKG_HOST_SYS}"
>
> diff --git a/meta/classes/crosssdk.bbclass b/meta/classes/crosssdk.bbclas=
s
> index 3952ebd..5016762 100644
> --- a/meta/classes/crosssdk.bbclass
> +++ b/meta/classes/crosssdk.bbclass
> @@ -9,6 +9,8 @@ TARGET_VENDOR =3D "${SDK_VENDOR}"
> =C2=A0TARGET_OS =3D "${SDK_OS}"
> =C2=A0TARGET_PREFIX =3D "${SDK_PREFIX}"
> =C2=A0TARGET_CC_ARCH =3D "${SDK_CC_ARCH}"
> +TARGET_LD_ARCH =3D "${SDK_LD_ARCH}"
> +TARGET_AS_ARCH =3D "${SDK_AS_ARCH}"
> =C2=A0TARGET_FPU =3D ""
>
> =C2=A0target_libdir =3D "${SDKPATHNATIVE}${libdir_nativesdk}"
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index b71a650..5a4e097 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -37,6 +37,7 @@ KERNEL_RELEASE ?=3D "${KERNEL_VERSION}"
>
> =C2=A0KERNEL_CCSUFFIX ?=3D ""
> =C2=A0KERNEL_LDSUFFIX ?=3D ""
> +KERNEL_ASSUFFIX ?=3D ""
>
> =C2=A0# Set TARGET_??_KERNEL_ARCH in the machine .conf to set architectur=
e
> =C2=A0# specific options necessary for building the kernel and modules.
> @@ -45,9 +46,12 @@ TARGET_CC_KERNEL_ARCH ?=3D ""
> =C2=A0HOST_CC_KERNEL_ARCH ?=3D "${TARGET_CC_KERNEL_ARCH}"
> =C2=A0TARGET_LD_KERNEL_ARCH ?=3D ""
> =C2=A0HOST_LD_KERNEL_ARCH ?=3D "${TARGET_LD_KERNEL_ARCH}"
> +TARGET_AS_KERNEL_ARCH ?=3D ""
> +HOST_AS_KERNEL_ARCH ?=3D "${TARGET_LD_KERNEL_ARCH}"
>
> =C2=A0KERNEL_CC =3D "${CCACHE}${HOST_PREFIX}gcc${KERNEL_CCSUFFIX} ${HOST_=
CC_KERNEL_ARCH}${TOOLCHAIN_OPTIONS}"
> =C2=A0KERNEL_LD =3D "${LD}${KERNEL_LDSUFFIX} ${HOST_LD_KERNEL_ARCH}${TOOL=
CHAIN_OPTIONS}"
> +KERNEL_AS =3D "${AS}${KERNEL_ASSUFFIX} ${HOST_AS_KERNEL_ARCH}${TOOLCHAIN=
_OPTIONS}"
>
> =C2=A0# Where built kernel lies in the kernel tree
> =C2=A0KERNEL_OUTPUT ?=3D "arch/${ARCH}/boot/${KERNEL_IMAGETYPE}"
> diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
> index 1e8de95..1f3b4ef 100644
> --- a/meta/classes/native.bbclass
> +++ b/meta/classes/native.bbclass
> @@ -28,6 +28,8 @@ TARGET_OS =3D "${BUILD_OS}"
> =C2=A0TARGET_VENDOR =3D "${BUILD_VENDOR}"
> =C2=A0TARGET_PREFIX =3D "${BUILD_PREFIX}"
> =C2=A0TARGET_CC_ARCH =3D "${BUILD_CC_ARCH}"
> +TARGET_LD_ARCH =3D "${BUILD_LD_ARCH}"
> +TARGET_AS_ARCH =3D "${BUILD_AS_ARCH}"
> =C2=A0TARGET_FPU =3D ""
>
> =C2=A0HOST_ARCH =3D "${BUILD_ARCH}"
> @@ -35,6 +37,8 @@ HOST_OS =3D "${BUILD_OS}"
> =C2=A0HOST_VENDOR =3D "${BUILD_VENDOR}"
> =C2=A0HOST_PREFIX =3D "${BUILD_PREFIX}"
> =C2=A0HOST_CC_ARCH =3D "${BUILD_CC_ARCH}"
> +HOST_LD_ARCH =3D "${BUILD_LD_ARCH}"
> +HOST_AS_ARCH =3D "${BUILD_AS_ARCH}"
>
> =C2=A0CPPFLAGS =3D "${BUILD_CPPFLAGS}"
> =C2=A0CFLAGS =3D "${BUILD_CFLAGS}"
> @@ -54,11 +58,11 @@ export CONFIG_SITE =3D ""
> =C2=A0export CC =3D "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_ARCH}"
> =C2=A0export CXX =3D "${CCACHE}${HOST_PREFIX}g++ ${HOST_CC_ARCH}"
> =C2=A0export F77 =3D "${CCACHE}${HOST_PREFIX}g77 ${HOST_CC_ARCH}"
> -export CPP =3D "${HOST_PREFIX}gcc -E"
> -export LD =3D "${HOST_PREFIX}ld"
> +export CPP =3D "${HOST_PREFIX}gcc -E ${HOST_CC_ARCH}"
> +export LD =3D "${HOST_PREFIX}ld ${HOST_LD_ARCH}"
> =C2=A0export CCLD =3D "${CC}"
> =C2=A0export AR =3D "${HOST_PREFIX}ar"
> -export AS =3D "${HOST_PREFIX}as"
> +export AS =3D "${HOST_PREFIX}as ${HOST_AS_ARCH}"
> =C2=A0export RANLIB =3D "${HOST_PREFIX}ranlib"
> =C2=A0export STRIP =3D "${HOST_PREFIX}strip"
>
> diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbcl=
ass
> index 3fe4bf9..39e6f76 100644
> --- a/meta/classes/nativesdk.bbclass
> +++ b/meta/classes/nativesdk.bbclass
> @@ -27,6 +27,8 @@ HOST_VENDOR =3D "${SDK_VENDOR}"
> =C2=A0HOST_OS =3D "${SDK_OS}"
> =C2=A0HOST_PREFIX =3D "${SDK_PREFIX}"
> =C2=A0HOST_CC_ARCH =3D "${SDK_CC_ARCH}"
> +HOST_LD_ARCH =3D "${SDK_LD_ARCH}"
> +HOST_AS_ARCH =3D "${SDK_AS_ARCH}"
> =C2=A0#HOST_SYS =3D "${HOST_ARCH}${TARGET_VENDOR}-${HOST_OS}"
>
> =C2=A0TARGET_ARCH =3D "${SDK_ARCH}"
> @@ -34,6 +36,8 @@ TARGET_VENDOR =3D "${SDK_VENDOR}"
> =C2=A0TARGET_OS =3D "${SDK_OS}"
> =C2=A0TARGET_PREFIX =3D "${SDK_PREFIX}"
> =C2=A0TARGET_CC_ARCH =3D "${SDK_CC_ARCH}"
> +TARGET_LD_ARCH =3D "${SDK_LD_ARCH}"
> +TARGET_AS_ARCH =3D "${SDK_AS_ARCH}"
> =C2=A0TARGET_FPU =3D ""
>
> =C2=A0CPPFLAGS =3D "${BUILDSDK_CPPFLAGS}"
> diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolch=
ain-scripts.bbclass
> index 3301319..0f6c653 100644
> --- a/meta/classes/toolchain-scripts.bbclass
> +++ b/meta/classes/toolchain-scripts.bbclass
> @@ -24,7 +24,7 @@ toolchain_create_sdk_env_script () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
> =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 'export CFLAGS=3D"${TARGET_CC_ARCH} --sys=
root=3D${SDKTARGETSYSROOT}"' >> $script
> =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 'export CXXFLAGS=3D"${TARGET_CC_ARCH} --s=
ysroot=3D${SDKTARGETSYSROOT}"' >> $script
> - =C2=A0 =C2=A0 =C2=A0 echo 'export LDFLAGS=3D"--sysroot=3D${SDKTARGETSYS=
ROOT}"' >> $script
> + =C2=A0 =C2=A0 =C2=A0 echo 'export LDFLAGS=3D"${TARGET_LD_ARCH} --sysroo=
t=3D${SDKTARGETSYSROOT}"' >> $script
> =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 'export CPPFLAGS=3D"--sysroot=3D${SDKTARG=
ETSYSROOT}"' >> $script
> =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 'export OECORE_NATIVE_SYSROOT=3D"${SDKPAT=
HNATIVE}"' >> $script
> =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 'export OECORE_TARGET_SYSROOT=3D"${SDKTAR=
GETSYSROOT}"' >> $script
> @@ -58,6 +58,7 @@ toolchain_create_tree_env_script () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
> =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 'export CFLAGS=3D"${TARGET_CC_ARCH}"' >> =
$script
> =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 'export CXXFLAGS=3D"${TARGET_CC_ARCH}"' >=
> $script
> + =C2=A0 =C2=A0 =C2=A0 echo 'export LDFLAGS=3D"${TARGET_LD_ARCH}"' >> $sc=
ript
> =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 'export OECORE_NATIVE_SYSROOT=3D"${STAGIN=
G_DIR_NATIVE}"' >> $script
> =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 'export OECORE_TARGET_SYSROOT=3D"${STAGIN=
G_DIR_TARGET}"' >> $script
> =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 'export OECORE_ACLOCAL_OPTS=3D"-I ${STAGI=
NG_DIR_NATIVE}/usr/share/aclocal"' >> $script
> @@ -87,7 +88,7 @@ toolchain_create_sdk_env_script_for_installer () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
> =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 'export CFLAGS=3D"${TARGET_CC_ARCH} --sys=
root=3D##SDKTARGETSYSROOT##"' >> $script
> =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 'export CXXFLAGS=3D"${TARGET_CC_ARCH} --s=
ysroot=3D##SDKTARGETSYSROOT##"' >> $script
> - =C2=A0 =C2=A0 =C2=A0 echo 'export LDFLAGS=3D"--sysroot=3D##SDKTARGETSYS=
ROOT##"' >> $script
> + =C2=A0 =C2=A0 =C2=A0 echo 'export LDFLAGS=3D"${TARGET_LD_ARCH} --sysroo=
t=3D##SDKTARGETSYSROOT##"' >> $script
> =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 'export CPPFLAGS=3D"--sysroot=3D##SDKTARG=
ETSYSROOT##"' >> $script
> =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 'export OECORE_NATIVE_SYSROOT=3D"${SDKPAT=
HNATIVE}"' >> $script
> =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 'export OECORE_TARGET_SYSROOT=3D"##SDKTAR=
GETSYSROOT##"' >> $script
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 463991d..a74f629 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -66,6 +66,8 @@ BUILD_VENDOR =3D ""
> =C2=A0BUILD_SYS =3D "${BUILD_ARCH}${BUILD_VENDOR}-${BUILD_OS}"
> =C2=A0BUILD_PREFIX =3D ""
> =C2=A0BUILD_CC_ARCH =3D ""
> +BUILD_LD_ARCH =3D ""
> +BUILD_AS_ARCH =3D ""
> =C2=A0BUILD_EXEEXT =3D ""
>
> =C2=A0HOST_ARCH =3D "${TARGET_ARCH}"
> @@ -74,6 +76,8 @@ HOST_VENDOR =3D "${TARGET_VENDOR}"
> =C2=A0HOST_SYS =3D "${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}"
> =C2=A0HOST_PREFIX =3D "${TARGET_PREFIX}"
> =C2=A0HOST_CC_ARCH =3D "${TARGET_CC_ARCH}"
> +HOST_LD_ARCH =3D "${TARGET_LD_ARCH}"
> +HOST_AS_ARCH =3D "${TARGET_AS_ARCH}"
> =C2=A0HOST_EXEEXT =3D ""
>
> =C2=A0TARGET_ARCH =3D "INVALID"
> @@ -82,6 +86,8 @@ TARGET_VENDOR =3D "-oe"
> =C2=A0TARGET_SYS =3D "${TARGET_ARCH}${TARGET_VENDOR}${@['-' + bb.data.get=
Var('TARGET_OS', d, 1), ''][bb.data.getVar('TARGET_OS', d, 1) =3D=3D ('' or=
 'custom')]}"
> =C2=A0TARGET_PREFIX =3D "${TARGET_SYS}-"
> =C2=A0TARGET_CC_ARCH =3D ""
> +TARGET_LD_ARCH =3D ""
> +TARGET_AS_ARCH =3D ""
>
> =C2=A0SDK_ARCH =3D "${BUILD_ARCH}"
> =C2=A0SDK_OS =3D "${BUILD_OS}"
> @@ -89,6 +95,8 @@ SDK_VENDOR =3D "-oesdk"
> =C2=A0SDK_SYS =3D "${SDK_ARCH}${SDK_VENDOR}${@['-' + bb.data.getVar('SDK_=
OS', d, 1), ''][bb.data.getVar('SDK_OS', d, 1) =3D=3D ('' or 'custom')]}"
> =C2=A0SDK_PREFIX =3D "${SDK_SYS}-"
> =C2=A0SDK_CC_ARCH =3D "${BUILD_CC_ARCH}"
> +SDK_LD_ARCH =3D "${BUILD_LD_ARCH}"
> +SDK_AS_ARCH =3D "${BUILD_AS_ARCH}"
>
> =C2=A0BASE_PACKAGE_ARCH =3D "${HOST_ARCH}"
> =C2=A0PACKAGE_ARCH =3D "${BASE_PACKAGE_ARCH}"
> @@ -390,11 +398,11 @@ export CCACHE_DIR =3D "${TMPDIR}/ccache/${HOST_SYS}=
/${PN}"
> =C2=A0export CC =3D "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_ARCH}${TOOLCHAI=
N_OPTIONS}"
> =C2=A0export CXX =3D "${CCACHE}${HOST_PREFIX}g++ ${HOST_CC_ARCH}${TOOLCHA=
IN_OPTIONS}"
> =C2=A0export F77 =3D "${CCACHE}${HOST_PREFIX}g77 ${HOST_CC_ARCH}${TOOLCHA=
IN_OPTIONS}"
> -export CPP =3D "${HOST_PREFIX}gcc -E${TOOLCHAIN_OPTIONS}"
> -export LD =3D "${HOST_PREFIX}ld${TOOLCHAIN_OPTIONS}"
> +export CPP =3D "${HOST_PREFIX}gcc ${HOST_CC_ARCH} -E${TOOLCHAIN_OPTIONS}=
"
> +export LD =3D "${HOST_PREFIX}ld ${HOST_LD_ARCH}${TOOLCHAIN_OPTIONS}"
> =C2=A0export CCLD =3D "${CC}"
> =C2=A0export AR =3D "${HOST_PREFIX}ar"
> -export AS =3D "${HOST_PREFIX}as"
> +export AS =3D "${HOST_PREFIX}as ${HOST_AS_ARCH}"
> =C2=A0export RANLIB =3D "${HOST_PREFIX}ranlib"
> =C2=A0export STRIP =3D "${HOST_PREFIX}strip"
> =C2=A0export OBJCOPY =3D "${HOST_PREFIX}objcopy"
> @@ -405,10 +413,11 @@ PYTHON =3D "${@sys.executable}"
> =C2=A0export BUILD_CC =3D "${CCACHE}${BUILD_PREFIX}gcc ${BUILD_CC_ARCH}"
> =C2=A0export BUILD_CXX =3D "${CCACHE}${BUILD_PREFIX}g++ ${BUILD_CC_ARCH}"
> =C2=A0export BUILD_F77 =3D "${CCACHE}${BUILD_PREFIX}g77 ${BUILD_CC_ARCH}"
> -export BUILD_CPP =3D "${BUILD_PREFIX}cpp"
> -export BUILD_LD =3D "${BUILD_PREFIX}ld"
> -export BUILD_CCLD =3D "${BUILD_PREFIX}gcc"
> +export BUILD_CPP =3D "${BUILD_PREFIX}cpp ${BUILD_CC_ARCH}"
> +export BUILD_LD =3D "${BUILD_PREFIX}ld ${BUILD_LD_ARCH}"
> +export BUILD_CCLD =3D "${BUILD_CC}"
> =C2=A0export BUILD_AR =3D "${BUILD_PREFIX}ar"
> +export BUILD_AS =3D "${BUILD_PREFIX}as ${HOST_AS_ARCH}"
> =C2=A0export BUILD_RANLIB =3D "${BUILD_PREFIX}ranlib"
> =C2=A0export BUILD_STRIP =3D "${BUILD_PREFIX}strip"
> =C2=A0export BUILD_NM =3D "${BUILD_PREFIX}nm"
> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
> index d984d0d..3aeba8d 100644
> --- a/meta/conf/documentation.conf
> +++ b/meta/conf/documentation.conf
> @@ -13,6 +13,7 @@ BUILD_VENDOR[doc] =3D "FIXME"
> =C2=A0BUILD_SYS[doc] =3D "FIXME"
> =C2=A0BUILD_PREFIX[doc] =3D "FIXME"
> =C2=A0BUILD_CC_ARCH[doc] =3D "FIXME"
> +BUILD_LD_ARCH[doc] =3D "FIXME"
>
> =C2=A0HOST_ARCH[doc] =3D "The name of the target architecture. Normally s=
ame as the TARGET_ARCH. @see TARGET_ARCH @group base"
> =C2=A0HOST_OS[doc] =3D "The name of the target operating system. Normally=
 the same as the TARGET_OS. \
> @@ -21,6 +22,7 @@ HOST_VENDOR[doc] =3D "The name of the vendor. Normally =
same as the TARGET_VENDOR.
> =C2=A0HOST_SYS[doc] =3D "FIXME"
> =C2=A0HOST_PREFIX[doc] =3D "Normally same as the TARGET_PREFIX. @see TARG=
ET_PREFIX @group base"
> =C2=A0HOST_CC_ARCH[doc] =3D "Normally same as the TARGET_CC_ARCH. @see TA=
RGET_CC_ARCH @group base"
> +HOST_LD_ARCH[doc] =3D "Normally same as the TARGET_LD_ARCH. @see TARGET_=
LD_ARCH @group base"
> =C2=A0HOST_NONSYSV[doc] =3D 'This flag can be set to "1" if the host syst=
em is not SysV compatible. E.g.\
> =C2=A0fakeroot-native will be build with tcp as IPC implementation.'
>
> --
> 1.7.5.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


