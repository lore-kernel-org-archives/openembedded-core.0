Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SOI0S-00074w-UZ
	for openembedded-core@lists.openembedded.org;
	Sun, 29 Apr 2012 02:28:53 +0200
Received: by lagw12 with SMTP id w12so1240739lag.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Apr 2012 17:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=hvfHQcz0ANEB3cul1IHV2D1TeMK6K6Tbmeih0F959Vs=;
	b=itkA9/JoCNQVUUdfWpLPBYRIb+1fX3z9P+YMeJ/FOT70vhGzvsgOSxpK7XP1uB2GlT
	baGGSQZVLk5Ol1X7QRbixnd4u93mi+AqRqWY0Ap5p5kJbTlBmLBntj1DNOQs5EZhpyTA
	w6bYHhUM5zLYYdu1/fBPDfw7bIQCUxyTm9g+2F+0MSBlbwJ61XhVXXKNqcn24ROA0+US
	3yyN4VCyJCEpedv1x3D73NxOSruWSJrIHMXT3mMgWTAwAMjWut1X6VpPUza/5hIV0tPL
	5rys8f6+ZcSFvSZMriJSKY0nlMO/fTQGt3XpzyFr2LMI13r3tBw6UY3O49U3wDK0Rjmr
	SXxQ==
Received: by 10.152.133.144 with SMTP id pc16mr15669692lab.0.1335658752939;
	Sat, 28 Apr 2012 17:19:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Sat, 28 Apr 2012 17:18:42 -0700 (PDT)
In-Reply-To: <1335447947.20130.15.camel@ted>
References: <1335447947.20130.15.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 28 Apr 2012 17:18:42 -0700
Message-ID: <CAMKF1srM-6UqKmM307aJXUXOahzdxxx6SmjCrOY0DmWPYpz_kQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes: Add recipe class to overrides
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
X-List-Received-Date: Sun, 29 Apr 2012 00:28:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 26, 2012 at 6:45 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> [This is a tweaked version of one of Khem's patches. The idea here would
> be to deprecate and ultimately remove the virtclass-native and
> virtclass-nativesdk overrides]
>
> We have currently no override to detect a recipe being build cross, cross=
sdk
> or for target at times we can use virtclass-native and virtclass-nativesd=
k to
> override stuff in recipes but we dont have way to modify a variables
> based on recipe type always.
>
> This patch adds in such an override and in particular makes a target over=
ride
> class available.
>
> With this change now we can say:
>
> EXTRA_OECONF_class-target =3D "...."
> EXTRA_OECONF_class-native =3D "..."
> EXTRA_OECONF_class-nativesdk =3D "..."
> EXTRA_OECONF_class-crosssdk=3D "..."
>
> Based of an original patch by Khem Raj
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Looks ok to me.

> ---
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index 02e1ff5..a984eae 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -1,4 +1,5 @@
> =C2=A0BB_DEFAULT_TASK ?=3D "build"
> +CLASSOVERRIDE ?=3D "class-target"
>
> =C2=A0inherit patch
> =C2=A0inherit staging
> diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-can=
adian.bbclass
> index bbf8f16..ed53118 100644
> --- a/meta/classes/cross-canadian.bbclass
> +++ b/meta/classes/cross-canadian.bbclass
> @@ -8,7 +8,7 @@
> =C2=A0# SDK packages are built either explicitly by the user,
> =C2=A0# or indirectly via dependency. =C2=A0No need to be in 'world'.
> =C2=A0EXCLUDE_FROM_WORLD =3D "1"
> -
> +CLASSOVERRIDE =3D "class-cross-canadian"
> =C2=A0STAGING_BINDIR_TOOLCHAIN =3D "${STAGING_DIR_NATIVE}${bindir_native}=
/${SDK_ARCH}${SDK_VENDOR}-${SDK_OS}:${STAGING_DIR_NATIVE}${bindir_native}/$=
{TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}"
>
> =C2=A0#
> diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
> index 8da3048..e998307 100644
> --- a/meta/classes/cross.bbclass
> +++ b/meta/classes/cross.bbclass
> @@ -4,6 +4,7 @@ inherit relocatable
> =C2=A0# no need for them to be a direct target of 'world'
> =C2=A0EXCLUDE_FROM_WORLD =3D "1"
>
> +CLASSOVERRIDE =3D "class-cross"
> =C2=A0PACKAGES =3D ""
> =C2=A0PACKAGES_DYNAMIC =3D ""
> =C2=A0PACKAGES_DYNAMIC_virtclass-native =3D ""
> diff --git a/meta/classes/crosssdk.bbclass b/meta/classes/crosssdk.bbclas=
s
> index 67df236..93aba70 100644
> --- a/meta/classes/crosssdk.bbclass
> +++ b/meta/classes/crosssdk.bbclass
> @@ -1,5 +1,6 @@
> =C2=A0inherit cross
>
> +CLASSOVERRIDE =3D "class-crosssdk"
> =C2=A0PACKAGE_ARCH =3D "${SDK_ARCH}"
> =C2=A0python () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0# set TUNE_PKGARCH to SDK_ARCH
> diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
> index ffab971..bca48d4 100644
> --- a/meta/classes/native.bbclass
> +++ b/meta/classes/native.bbclass
> @@ -97,6 +97,7 @@ PKG_CONFIG_SYSROOT_DIR =3D ""
>
> =C2=A0# we dont want libc-uclibc or libc-glibc to kick in for native reci=
pes
> =C2=A0LIBCOVERRIDE =3D ""
> +CLASSOVERRIDE =3D "class-native"
>
> =C2=A0PATH =3D. "${COREBASE}/scripts/native-intercept:"
>
> diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbcl=
ass
> index 9e20834..a58fce2 100644
> --- a/meta/classes/nativesdk.bbclass
> +++ b/meta/classes/nativesdk.bbclass
> @@ -8,6 +8,7 @@ STAGING_BINDIR_TOOLCHAIN =3D "${STAGING_DIR_NATIVE}${bind=
ir_native}/${SDK_ARCH}${S
>
> =C2=A0# we dont want libc-uclibc or libc-glibc to kick in for nativesdk r=
ecipes
> =C2=A0LIBCOVERRIDE =3D ""
> +CLASSOVERRIDE =3D "class-nativesdk"
>
> =C2=A0#
> =C2=A0# Update PACKAGE_ARCH and PACKAGE_ARCHS
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 91fe070..9f4e4d4 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -637,7 +637,8 @@ AUTO_LIBNAME_PKGS =3D "${PACKAGES}"
> =C2=A0#
> =C2=A0# This works for =C2=A0functions as well, they are really just envi=
ronment variables.
> =C2=A0# Default OVERRIDES to make compilation fail fast in case of build =
system misconfiguration.
> -OVERRIDES =3D "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:build-${BUILD_OS}:=
pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:forcevariable"
> +OVERRIDES =3D "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:build-${BUILD_OS}:=
pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}:forcevaria=
ble"
> +CLASSOVERRIDE ?=3D "class-target"
> =C2=A0DISTROOVERRIDES ?=3D "${@d.getVar('DISTRO', True) or ''}"
> =C2=A0MACHINEOVERRIDES ?=3D "${MACHINE}"
> =C2=A0MACHINEOVERRIDES[vardepsexclude] =3D "MACHINE"
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


