Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pwe5j-0000iy-VC
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Mar 2011 18:19:33 +0100
Received: by fxm8 with SMTP id 8so4290936fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Mar 2011 09:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=eAiZUZjf3XSUKzumOFUhLNdGJmbclKM5dFN99YD0rls=;
	b=hHcO/dQpOaW+hvG2NiJYQSjNKMkMCuZrhdKk+W24bVsUuefasAvlQ3LaXHqYGmCSBq
	X1Rmfq8FdQAfHXYBB4GDZgJbNCq+1bc0XBttnjLYf2KT4BHXkTaqEm4e+onYz9J60t6i
	ozDENX6Nrhc9LZghj3JDMe0J4N/3hClvCBWkg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=mMbI9/d7jUZieneO5AB7fF2VVXdZ8j6KlsheJ+oCUciRJphdIWumHShpL6Vv1j0Ph9
	c4eKciLYXAQ+X/kcLL6Dnhx/STyZXPg9INx+fPlSxgxOMpfE8X5L8nVssprugkSoI9U9
	1ZcphPGV1/odwfBmru4gPWlJaaLah9+ajxmh4=
Received: by 10.223.143.86 with SMTP id t22mr5018618fau.74.1299518218253; Mon,
	07 Mar 2011 09:16:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Mon, 7 Mar 2011 09:14:26 -0800 (PST)
In-Reply-To: <0cfc1314469e2fe9412ec0285a9bbe577a195258.1299516806.git.nitin.a.kamble@intel.com>
References: <cover.1299516806.git.nitin.a.kamble@intel.com>
	<0cfc1314469e2fe9412ec0285a9bbe577a195258.1299516806.git.nitin.a.kamble@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Mar 2011 09:14:26 -0800
Message-ID: <AANLkTi=ug_MBMiLEWpfYd0=tgMstJVE4r5oVNW6JDA_+@mail.gmail.com>
To: Nitin A Kamble <nitin.a.kamble@intel.com>
Cc: poky@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [poky] [PATCH 1/1] gcc-runtime: fix LSB library checks for libstdc++.so.6
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
X-List-Received-Date: Mon, 07 Mar 2011 17:19:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 7, 2011 at 8:55 AM, Nitin A Kamble <nitin.a.kamble@intel.com> w=
rote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>
> [YOCTO #795]
>
> When we run library check of LSB on qemux86 and qemuppc, we got some fail=
ures
> about 'libstdc++.so.6'.
>
> Test environment:
> Platform: Qemu-x86, Qemu-ppc
> lsb image: poky-image-lsb-qemux86-test.ext3(Feb 26th, auto-build server)
> Library check of LSB: 4.1.0-1
>
> The error log:
> Did not find _ZNKSt5ctypeIcE8do_widenEPKcS2_Pc (GLIBCXX_3.4) in libstdc++=
.so.6
> Unmangled symbol name: std::ctype<char>::do_widen(char const*, char const=
*,
> char*) const
> ...
>
> =C2=A0found that some weak symbols ('W') change into local ('t') during l=
ink time
> and be stripped. According to compiling log, the option
> "-fvisibility-inlines-hidden" is used for gcc. And this option caused som=
e weak
> symbols change into local.
>


you could use oe_filter_out functionality to strip out a given option
and you wont need to touch so many parts. Just do something like

CXXFLAGS =3D "${@oe_filter_out('-fvisibility-inlines-hidden',
'${CXXFLAGS}', d)}" in gcc runtime recipe and you should be set

Thanks

-Khem

> see http://bugzilla.pokylinux.org/show_bug.cgi?id=3D795 for more informat=
ion on the bug.
>
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> Signed-off-by: Jingdong Lu <jingdong.lu@windriver.com>
> ---
> =C2=A0meta/conf/bitbake.conf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A02 +-
> =C2=A0meta/conf/distro/include/poky-eglibc.inc =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 =C2=A02 +-
> =C2=A0meta/conf/distro/include/poky-glibc.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
> =C2=A0meta/conf/distro/include/poky-uclibc.inc =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 =C2=A02 +-
> =C2=A0.../recipes-devtools/gcc/gcc-configure-runtime.inc | =C2=A0 =C2=A01=
 +
> =C2=A0meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb =C2=A0 =C2=A0 | =C2=
=A0 =C2=A02 +-
> =C2=A06 files changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index cf99a81..473306a 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -463,7 +463,7 @@ export CFLAGS =3D "${TARGET_CFLAGS}"
> =C2=A0export TARGET_CFLAGS =3D "${TARGET_CPPFLAGS} ${SELECTED_OPTIMIZATIO=
N}"
>
> =C2=A0export BUILD_CXXFLAGS =3D "${BUILD_CFLAGS} -fpermissive"
> -export CXXFLAGS =3D "${TARGET_CXXFLAGS}"
> +export CXXFLAGS =3D "${TARGET_CXXFLAGS} ${CXXFLAGS_EXTRA}"
> =C2=A0export TARGET_CXXFLAGS =3D "${TARGET_CFLAGS} -fpermissive"
>
> =C2=A0export BUILD_LDFLAGS =3D "-L${STAGING_LIBDIR_NATIVE} \
> diff --git a/meta/conf/distro/include/poky-eglibc.inc b/meta/conf/distro/=
include/poky-eglibc.inc
> index 3d2c362..44a0146 100644
> --- a/meta/conf/distro/include/poky-eglibc.inc
> +++ b/meta/conf/distro/include/poky-eglibc.inc
> @@ -19,7 +19,7 @@ PREFERRED_PROVIDER_virtual/${SDK_PREFIX}libc-initial-na=
tivesdk ?=3D "eglibc-initia
>
> =C2=A0TARGET_OS =3D "${GLIBCTARGETOS}"
>
> -CXXFLAGS +=3D "-fvisibility-inlines-hidden"
> +CXXFLAGS_EXTRA +=3D "-fvisibility-inlines-hidden"
>
> =C2=A0LIBC_DEPENDENCIES =3D "libsegfault \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 egl=
ibc \
> diff --git a/meta/conf/distro/include/poky-glibc.inc b/meta/conf/distro/i=
nclude/poky-glibc.inc
> index 4be7122..d3f28c0 100644
> --- a/meta/conf/distro/include/poky-glibc.inc
> +++ b/meta/conf/distro/include/poky-glibc.inc
> @@ -18,7 +18,7 @@ PREFERRED_PROVIDER_virtual/${SDK_PREFIX}libc-initial-na=
tivesdk ?=3D "glibc-initial
>
> =C2=A0TARGET_OS =3D "${GLIBCTARGETOS}"
>
> -CXXFLAGS +=3D "-fvisibility-inlines-hidden"
> +CXXFLAGS_EXTRA +=3D "-fvisibility-inlines-hidden"
>
> =C2=A0LIBC_DEPENDENCIES =3D "\
> =C2=A0 =C2=A0 libsegfault \
> diff --git a/meta/conf/distro/include/poky-uclibc.inc b/meta/conf/distro/=
include/poky-uclibc.inc
> index def9dfe..13c17f9 100644
> --- a/meta/conf/distro/include/poky-uclibc.inc
> +++ b/meta/conf/distro/include/poky-uclibc.inc
> @@ -15,7 +15,7 @@ USE_NLS_glib-2.0 =3D "yes"
>
> =C2=A0TARGET_OS =3D "${UCLIBCTARGETOS}"
>
> -CXXFLAGS +=3D "-fvisibility-inlines-hidden"
> +CXXFLAGS_EXTRA +=3D "-fvisibility-inlines-hidden"
>
> =C2=A0IMAGE_LINGUAS =3D ""
>
> diff --git a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc b/meta/r=
ecipes-devtools/gcc/gcc-configure-runtime.inc
> index 6cc11e2..d4dfbc2 100644
> --- a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
> @@ -1,5 +1,6 @@
> =C2=A0require gcc-configure-common.inc
>
> +CXXFLAGS_EXTA =3D ""
> =C2=A0EXTRA_OECONF_PATHS =3D " \
> =C2=A0 =C2=A0 --with-local-prefix=3D${STAGING_DIR_TARGET}${prefix} \
> =C2=A0 =C2=A0 --with-gxx-include-dir=3D${includedir}/c++/ \
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb b/meta/recipe=
s-devtools/gcc/gcc-runtime_4.5.1.bb
> index 093f9bf..c1e680d 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb
> +++ b/meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb
> @@ -1,4 +1,4 @@
> -PR =3D "r2"
> +PR =3D "r3"
>
> =C2=A0require gcc-${PV}.inc
> =C2=A0require gcc-configure-runtime.inc
> --
> 1.7.3.4
>
> _______________________________________________
> poky mailing list
> poky@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/poky
>


