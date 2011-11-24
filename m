Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RTQ9o-0005nk-Me
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2011 04:39:28 +0100
Received: by faat2 with SMTP id t2so2507974faa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2011 19:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=KLGIzv0tguoA8fXJJ2bqCDcvETMKo+dCo3Yf8Nw2uuQ=;
	b=xFTt+4vodd42PlCFbACbuyS7IptbYaWtm2u2Lrz4P6cvL2OhwYv/PS9ROIQ3prFESr
	RYVrz0jA1cx86ZxH7zBaN2IIf/xDLiw2vuj9mlOzrAU4+xXMgYJbwTONAyW4lg2EwCmp
	5eZTppgZDA7sEF6HtD6zBiw/rPmZt16EKLrXk=
Received: by 10.152.134.77 with SMTP id pi13mr16524063lab.21.1322105576079;
	Wed, 23 Nov 2011 19:32:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Wed, 23 Nov 2011 19:32:25 -0800 (PST)
In-Reply-To: <689a6fbace429988bf14f144e9a93dc828a7e7bf.1321391467.git.julian.pidancet@gmail.com>
References: <689a6fbace429988bf14f144e9a93dc828a7e7bf.1321391467.git.julian.pidancet@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Nov 2011 19:32:25 -0800
Message-ID: <CAMKF1srTUc=V9-AV-+3bw3QrR747cK-kfYU4sYq+A04ASD06wA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: B29882@freescale.com, Julian Pidancet <julian.pidancet@gmail.com>
Subject: Re: [PATCH v2] Introduce multiarch DISTRO_FEATURE
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
X-List-Received-Date: Thu, 24 Nov 2011 03:39:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 15, 2011 at 5:01 PM, Julian Pidancet
<julian.pidancet@gmail.com> wrote:
> This patch introduces a distro feature which enables gcc to produce
> both 32bit and 64bit code, and enables binutils to operate on both
> 32bit and 64bit binaries. It differs from multilib toolchains in
> that it does not require to compile a version of the libc for each
> architecture variant. However, the code produced for the secondary
> architecture will not be linkable against the libc.
>
> v2: - Renamed the feature name from "biarch" to "multiarch". The GCC
> installation manual claims that the mips-linux can be made a tri-arch
> compiler (http://gcc.gnu.org/install/configure.html)
> =C2=A0 =C2=A0- For x86_64, the compiler is made bi-arch by default, so no=
thing
> has to be done in particular.
> =C2=A0 =C2=A0- I analyzed the gcc/config.gcc from GCC sources and added i=
n this
> patch all the architectures that could be made biarch with the version
> of gcc currently used in OE, which are powerpc, and sparc, in addition
> to x86. mips and s390 will probably be supported in future versions of
> gcc. For x86 and sparc, only the --enable-targets=3Dall option is valid
> to make this work (this option doesn't have any other side effects than
> making the compiler bi-arch). For powerpc, I used the
> --enable-targets=3Dpowerpc64 option (although 'all' also works).
>
> Note: - Untested on powerpc and sparc. But I believe it works the same
> as with x86.
> =C2=A0 =C2=A0 =C2=A0- gcc in meta-toolchain is also made multiarch.
>
> Signed-off-by: Julian Pidancet <julian.pidancet@gmail.com>
> ---
> =C2=A0meta/recipes-devtools/binutils/binutils-cross.inc =C2=A0| =C2=A0 =
=C2=A03 ++-
> =C2=A0meta/recipes-devtools/binutils/binutils.inc =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 =C2=A03 ++-
> =C2=A0meta/recipes-devtools/gcc/gcc-common.inc =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 10 ++++++++++
> =C2=A0meta/recipes-devtools/gcc/gcc-configure-common.inc | =C2=A0 =C2=A03=
 ++-
> =C2=A04 files changed, 16 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-devtools/binutils/binutils-cross.inc b/meta/rec=
ipes-devtools/binutils/binutils-cross.inc
> index 982224f..f07907e 100644
> --- a/meta/recipes-devtools/binutils/binutils-cross.inc
> +++ b/meta/recipes-devtools/binutils/binutils-cross.inc
> @@ -10,7 +10,8 @@ EXTRA_OECONF =3D "--with-sysroot=3D${STAGING_DIR_TARGET=
} \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-werror =
\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-nls \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --enable-poison-s=
ystem-directories \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@base_contains('DIST=
RO_FEATURES', 'ld-is-gold', '--enable-gold=3Ddefault', '', d)}"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@base_contains=
('DISTRO_FEATURES', 'ld-is-gold', '--enable-gold=3Ddefault', '', d)} \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@base_contains=
('DISTRO_FEATURES', 'multiarch', '--enable-64-bit-bfd', '', d)}"
>
> =C2=A0do_install () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake 'DESTDIR=3D${D}' install
> diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-d=
evtools/binutils/binutils.inc
> index 58fee85..51e4257 100644
> --- a/meta/recipes-devtools/binutils/binutils.inc
> +++ b/meta/recipes-devtools/binutils/binutils.inc
> @@ -49,7 +49,8 @@ B =3D "${S}/build.${HOST_SYS}.${TARGET_SYS}"
>
> =C2=A0EXTRA_OECONF =3D "--program-prefix=3D${TARGET_PREFIX} \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --enable-install-=
libbfd \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-shared"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-shared =
\
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@base_contains=
('DISTRO_FEATURES', 'multiarch', '--enable-64-bit-bfd', '', d)}"
>
> =C2=A0EXTRA_OECONF_virtclass-native =3D "--enable-target=3Dall --enable-6=
4-bit-bfd --enable-install-libbfd"
>
> diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devt=
ools/gcc/gcc-common.inc
> index 69e0213..7ec2f7e 100644
> --- a/meta/recipes-devtools/gcc/gcc-common.inc
> +++ b/meta/recipes-devtools/gcc/gcc-common.inc
> @@ -21,6 +21,16 @@ def get_gcc_mips_plt_setting(bb, d):
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 return "--with-mips-plt"
> =C2=A0 =C2=A0 return ""
>
> +def get_gcc_multiarch_setting(bb, d):
> + =C2=A0 =C2=A0if 'multiarch' in bb.data.getVar('DISTRO_FEATURES',d,1).sp=
lit() :
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0if bb.data.getVar('TARGET_ARCH', d, 1) in [ =
'i586', 'i686' ] :
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return "--enable-targets=3Dall=
"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0if bb.data.getVar('TARGET_ARCH', d, 1) in [ =
'powerpc' ] :
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return "--enable-targets=3Dpow=
erpc64"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0if bb.data.getVar('TARGET_ARCH', d, 1) in [ =
'sparc' ] :
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return "--enable-targets=3Dall=
"
> + =C2=A0 =C2=A0return ""


you forgot mips here

> +
> =C2=A0# We really need HOST_SYS here for some packages and TARGET_SYS for=
 others.
> =C2=A0# For now, libgcc is most important so we fix for that - RP.
> =C2=A0SHLIBSDIR =3D "${STAGING_DIR_TARGET}/shlibs"
> diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/re=
cipes-devtools/gcc/gcc-configure-common.inc
> index ae23e8e..d014980 100644
> --- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
> +++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> @@ -42,7 +42,8 @@ EXTRA_OECONF =3D "${@['--enable-clocale=3Dgeneric', '']=
[d.getVar('USE_NLS', 1) !=3D 'n
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${EXTRA_OECONF_BA=
SE} \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${EXTRA_OECONF_FP=
U} \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${EXTRA_OECONF_PA=
THS} \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@get_gcc_mips_=
plt_setting(bb, d)}"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@get_gcc_mips_=
plt_setting(bb, d)} \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@get_gcc_multi=
arch_setting(bb, d)}"
>
> =C2=A0# Build uclibc compilers without cxa_atexit support
> =C2=A0EXTRA_OECONF_append_linux =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =3D " --enable-__cxa_atexit"
> --
> Julian Pidancet
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


