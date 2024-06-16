Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7CC1C27C53
	for <webhook@archiver.kernel.org>; Sun, 16 Jun 2024 22:39:00 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web10.44147.1718577538328110406
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jun 2024 15:38:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IzBMUSKh;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5bdbbc37664so1460845eaf.2
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Jun 2024 15:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718577537; x=1719182337; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQJpqICdOXaq0pJt3eKpkRpCLGZFtQv44wIjNr4A7cc=;
        b=IzBMUSKhCGof/Ocrd/dDgP9Io2gtlgPRFj5kiEtc8AhlpQ6xBSHop98N5wI6Ne/0Gi
         IP7RWVHp2tPGzrJ1RCZ8dV0TO6pei9NnsXuTyWwMCBHD/NATeWrwnwp+leoIEaVvIypy
         WomCX0Ai/S8LZDuSujh6/cHi+T4qH8QbZZ+ZKTh0M2A4INpGKDjgvn+wmzQggi1fjMFF
         4zNlfwqAZL5AUxXf8T+7cYhSoTF9LnwQl0B/p8L+Vwzi0lYu45DjN6di7yIU3P7V1IeM
         P5J6U7LO6dhTrchIeHQoTHRea+HUmzsgEz4dG2o5z1upCfPTRgWqRJ/mYbkukkZMb1rq
         TJ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718577537; x=1719182337;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CQJpqICdOXaq0pJt3eKpkRpCLGZFtQv44wIjNr4A7cc=;
        b=Ga366bRyMMtKEgQshdNLKJS/oMkZrKF4KSxh1DStrlPmpSqv1tnXYPk598dOFYO+Tn
         9Z6PHRIVlB37zJi0cZ8aZ1f8a2tkaRJ/iQkNMQLpzhdLbvLX3tqFnFlbgT0ZfiMcIZj5
         ASVjhIXpNtD05qGPY7CXMMBOYgvKIqSYuQdsOqifZZvO2h5Oq8EuVa9O2mP/TgBh4dyl
         HwXYetofejOieM1O1uyFqlOZlv4kDgAls0QhVCFgLhzCZFT9Uu/hRz8+vXkhhu9o+WDH
         9a02pzDOkwBTxeEDwHteJlmsYxYMgk/t75Eyb98EaxsdkWB7CwLrB05E0O+e/kCuqfig
         Wj2Q==
X-Gm-Message-State: AOJu0YzI3eh+VsNTxN5EAm94kCGKJnHt/daDjNpyQ7NqYw4Py9DV9qMD
	/8PnPaGbCHAvP1Y5iUtjBUFJ/PMWqx5f5UtzamvCE6GmgL8wV57m5T31pZ8hufH1LR56bd/awZg
	6R0Tb+jryTtldFl1QTyLHatg8txo=
X-Google-Smtp-Source: AGHT+IH9hc9vmbpttkCD/9AW1BurB4E5QEtuVR3fLZcwBUWzJnrM+evLJfjCSdM2D7tByCW4tm8F14q6lmodz73RFb0=
X-Received: by 2002:a05:6870:6391:b0:24f:f45e:5541 with SMTP id
 586e51a60fabf-2584298e6d6mr9261462fac.24.1718577537258; Sun, 16 Jun 2024
 15:38:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240613202152.1032014-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20240613202152.1032014-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 16 Jun 2024 15:38:31 -0700
Message-ID: <CAMKF1srkZqbp2eiLyw4R13PVAUvh-fEsyxJ9yyX7btaXDYECeg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] native/nativesdk: Stop overriding unprefixed
 *FLAGS variables
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Jun 2024 22:39:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200783

I have narrowed down python3-bcrypt build failure to this change on
qemuriscv64 see

https://errors.yoctoproject.org/Errors/Details/786877/



On Thu, Jun 13, 2024 at 1:22=E2=80=AFPM Richard Purdie via
lists.openembedded.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
>
> We're currently encouraging an "arms race" with the FLAGS variables since
> a recipe might want to set a specific flag for all variants but to do so,
> +=3D won't work due to the assignment in the native/nativesdk class files=
. This
> means recipes are using append.
>
> Since the default variables are constructed out of TARGET_XXX variables a=
nd
> we redefine these, there is no need to re-define the un-prefixed variable=
s. If
> we drop that, the +=3D appends and similar work and recipes don't have to=
 resort
> to append.
>
> Change the classes and cleanup a number of recipes to adapt to the change=
. This
> change will result in some flags appearing to some native/nativesdk varia=
nts
> but that is probably what was originally expected anyway.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes-recipe/native.bbclass                     | 5 -----
>  meta/classes-recipe/nativesdk.bbclass                  | 5 -----
>  meta/recipes-connectivity/bind/bind_9.18.27.bb         | 2 +-
>  meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb | 2 +-
>  meta/recipes-core/systemd/systemd-boot_255.6.bb        | 4 ++--
>  meta/recipes-devtools/python/python3-bcrypt_4.1.3.bb   | 2 +-
>  meta/recipes-devtools/python/python3-maturin_1.6.0.bb  | 2 +-
>  meta/recipes-devtools/python/python3_3.12.4.bb         | 2 +-
>  meta/recipes-devtools/qemu/qemu-native.inc             | 2 +-
>  meta/recipes-devtools/rust/libstd-rs_1.75.0.bb         | 2 +-
>  meta/recipes-devtools/rust/rust_1.75.0.bb              | 2 +-
>  meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb   | 2 +-
>  meta/recipes-extended/bzip2/bzip2_1.0.8.bb             | 2 +-
>  meta/recipes-extended/ltp/ltp_20240524.bb              | 4 ++--
>  meta/recipes-extended/pam/libpam_1.6.1.bb              | 2 +-
>  meta/recipes-gnome/gtk+/gtk4_4.14.4.bb                 | 2 +-
>  meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb         | 2 +-
>  meta/recipes-kernel/powertop/powertop_2.15.bb          | 2 +-
>  meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc        | 2 +-
>  meta/recipes-support/sqlite/sqlite3.inc                | 6 +++---
>  20 files changed, 22 insertions(+), 32 deletions(-)
>
> diff --git a/meta/classes-recipe/native.bbclass b/meta/classes-recipe/nat=
ive.bbclass
> index 84a3ec65da0..d9651a7f22d 100644
> --- a/meta/classes-recipe/native.bbclass
> +++ b/meta/classes-recipe/native.bbclass
> @@ -40,11 +40,6 @@ HOST_CC_ARCH =3D "${BUILD_CC_ARCH}"
>  HOST_LD_ARCH =3D "${BUILD_LD_ARCH}"
>  HOST_AS_ARCH =3D "${BUILD_AS_ARCH}"
>
> -CPPFLAGS =3D "${BUILD_CPPFLAGS}"
> -CFLAGS =3D "${BUILD_CFLAGS}"
> -CXXFLAGS =3D "${BUILD_CXXFLAGS}"
> -LDFLAGS =3D "${BUILD_LDFLAGS}"
> -
>  STAGING_BINDIR =3D "${STAGING_BINDIR_NATIVE}"
>  STAGING_BINDIR_CROSS =3D "${STAGING_BINDIR_NATIVE}"
>
> diff --git a/meta/classes-recipe/nativesdk.bbclass b/meta/classes-recipe/=
nativesdk.bbclass
> index de6debda93c..b0634de5829 100644
> --- a/meta/classes-recipe/nativesdk.bbclass
> +++ b/meta/classes-recipe/nativesdk.bbclass
> @@ -66,11 +66,6 @@ TARGET_FPU =3D ""
>  EXTRA_OECONF_GCC_FLOAT =3D ""
>  TUNE_FEATURES =3D ""
>
> -CPPFLAGS =3D "${BUILDSDK_CPPFLAGS}"
> -CFLAGS =3D "${BUILDSDK_CFLAGS}"
> -CXXFLAGS =3D "${BUILDSDK_CXXFLAGS}"
> -LDFLAGS =3D "${BUILDSDK_LDFLAGS}"
> -
>  # Change to place files in SDKPATH
>  base_prefix =3D "${SDKPATHNATIVE}"
>  prefix =3D "${SDKPATHNATIVE}${prefix_nativesdk}"
> diff --git a/meta/recipes-connectivity/bind/bind_9.18.27.bb b/meta/recipe=
s-connectivity/bind/bind_9.18.27.bb
> index 98b8bb5513a..0d22bace6f3 100644
> --- a/meta/recipes-connectivity/bind/bind_9.18.27.bb
> +++ b/meta/recipes-connectivity/bind/bind_9.18.27.bb
> @@ -44,7 +44,7 @@ EXTRA_OECONF =3D " --disable-auto-validation \
>                   --sysconfdir=3D${sysconfdir}/bind \
>                   --with-openssl=3D${STAGING_DIR_HOST}${prefix} \
>                 "
> -LDFLAGS:append =3D " -lz"
> +LDFLAGS +=3D "-lz"
>
>  # dhcp needs .la so keep them
>  REMOVE_LIBTOOL_LA =3D "0"
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb b/met=
a/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb
> index af7a74a5fb0..9aa8bc4eabf 100644
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb
> @@ -62,7 +62,7 @@ EXTRA_OECONF =3D "--with-statduser=3Drpcuser \
>                  --with-rpcgen=3D${HOSTTOOLS_DIR}/rpcgen \
>                 "
>
> -LDFLAGS:append =3D " -lsqlite3 -levent"
> +LDFLAGS +=3D "-lsqlite3 -levent"
>
>  PACKAGECONFIG ??=3D "tcp-wrappers \
>      ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
> diff --git a/meta/recipes-core/systemd/systemd-boot_255.6.bb b/meta/recip=
es-core/systemd/systemd-boot_255.6.bb
> index 4ee25ee72f8..9a6d8e9d6e3 100644
> --- a/meta/recipes-core/systemd/systemd-boot_255.6.bb
> +++ b/meta/recipes-core/systemd/systemd-boot_255.6.bb
> @@ -8,10 +8,10 @@ DEPENDS =3D "intltool-native libcap util-linux gperf-na=
tive python3-jinja2-native
>  inherit meson pkgconfig gettext
>  inherit deploy
>
> -LDFLAGS:prepend =3D "${@ " ".join(d.getVar('LD').split()[1:])} "
> +LDFLAGS =3D+ "${@ " ".join(d.getVar('LD').split()[1:])} "
>
>  EFI_LD =3D "bfd"
> -LDFLAGS:append =3D " -fuse-ld=3D${EFI_LD}"
> +LDFLAGS +=3D "-fuse-ld=3D${EFI_LD}"
>
>  do_write_config[vardeps] +=3D "EFI_LD"
>  do_write_config:append() {
> diff --git a/meta/recipes-devtools/python/python3-bcrypt_4.1.3.bb b/meta/=
recipes-devtools/python/python3-bcrypt_4.1.3.bb
> index deb5cbdee3d..9bed5ee148e 100644
> --- a/meta/recipes-devtools/python/python3-bcrypt_4.1.3.bb
> +++ b/meta/recipes-devtools/python/python3-bcrypt_4.1.3.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8f7bb094c7232b=
058c7e9f2e431f389c"
>  HOMEPAGE =3D "https://pypi.org/project/bcrypt/"
>
>  DEPENDS +=3D "python3-cffi-native"
> -LDFLAGS:append =3D "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', ' -=
fuse-ld=3Dbfd', '', d)}"
> +LDFLAGS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '-fuse-ld=
=3Dbfd', '', d)}"
>
>  SRC_URI[sha256sum] =3D "2ee15dd749f5952fe3f0430d0ff6b74082e159c50332a141=
3d51b5689cf06623"
>
> diff --git a/meta/recipes-devtools/python/python3-maturin_1.6.0.bb b/meta=
/recipes-devtools/python/python3-maturin_1.6.0.bb
> index 1d62671bb90..ea8cf468ff0 100644
> --- a/meta/recipes-devtools/python/python3-maturin_1.6.0.bb
> +++ b/meta/recipes-devtools/python/python3-maturin_1.6.0.bb
> @@ -9,7 +9,7 @@ SRC_URI[sha256sum] =3D "b955025c24c8babc808db49e0ff90db8b=
4b1320dcc16b14eb261328417
>
>  S =3D "${WORKDIR}/maturin-${PV}"
>
> -CFLAGS:append =3D " -fdebug-prefix-map=3D${CARGO_HOME}=3D${TARGET_DBGSRC=
_DIR}/cargo_home"
> +CFLAGS +=3D "-fdebug-prefix-map=3D${CARGO_HOME}=3D${TARGET_DBGSRC_DIR}/c=
argo_home"
>
>  DEPENDS +=3D "\
>      python3-setuptools-rust-native \
> diff --git a/meta/recipes-devtools/python/python3_3.12.4.bb b/meta/recipe=
s-devtools/python/python3_3.12.4.bb
> index 64cd5d0bc07..901f88b079e 100644
> --- a/meta/recipes-devtools/python/python3_3.12.4.bb
> +++ b/meta/recipes-devtools/python/python3_3.12.4.bb
> @@ -118,7 +118,7 @@ ${@bb.utils.contains('PACKAGECONFIG', 'tk', '', '_tki=
nter', d)}
>  EOF
>  }
>
> -CPPFLAGS:append =3D " -I${STAGING_INCDIR}/ncursesw -I${STAGING_INCDIR}/u=
uid"
> +CPPFLAGS +=3D "-I${STAGING_INCDIR}/ncursesw -I${STAGING_INCDIR}/uuid"
>
>  # COMPILEALL_OPTS=3D ensures that .pyc are not compiled in parallel
>  # This was found to lock up builds, break reproducibility, and produce s=
trange file ownership
> diff --git a/meta/recipes-devtools/qemu/qemu-native.inc b/meta/recipes-de=
vtools/qemu/qemu-native.inc
> index 891dc5e2a10..d074d7d1818 100644
> --- a/meta/recipes-devtools/qemu/qemu-native.inc
> +++ b/meta/recipes-devtools/qemu/qemu-native.inc
> @@ -4,4 +4,4 @@ inherit_defer native
>
>  EXTRA_OEMAKE:append =3D " LD=3D'${LD}' AR=3D'${AR}' OBJCOPY=3D'${OBJCOPY=
}' LDFLAGS=3D'${LDFLAGS}'"
>
> -LDFLAGS:append =3D " -fuse-ld=3Dbfd"
> +LDFLAGS +=3D "-fuse-ld=3Dbfd"
> diff --git a/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb b/meta/recipe=
s-devtools/rust/libstd-rs_1.75.0.bb
> index d2bf266f9dd..5fc6fb97bb2 100644
> --- a/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb
> +++ b/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb
> @@ -50,4 +50,4 @@ BBCLASSEXTEND =3D "nativesdk"
>  # Since 1.70.0 upgrade this fails to build with gold:
>  # http://errors.yoctoproject.org/Errors/Details/708194/
>  # ld: error: version script assignment of  to symbol __rust_alloc_error_=
handler_should_panic failed: symbol not defined
> -LDFLAGS:append =3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold'=
, ' -fuse-ld=3Dbfd', '', d)}"
> +LDFLAGS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '-fu=
se-ld=3Dbfd', '', d)}"
> diff --git a/meta/recipes-devtools/rust/rust_1.75.0.bb b/meta/recipes-dev=
tools/rust/rust_1.75.0.bb
> index c66c14cc5a5..bb10c852b4d 100644
> --- a/meta/recipes-devtools/rust/rust_1.75.0.bb
> +++ b/meta/recipes-devtools/rust/rust_1.75.0.bb
> @@ -365,4 +365,4 @@ BBCLASSEXTEND =3D "native nativesdk"
>  # Since 1.70.0 upgrade this fails to build with gold:
>  # http://errors.yoctoproject.org/Errors/Details/708196/
>  # ld: error: version script assignment of  to symbol __rust_alloc_error_=
handler_should_panic failed: symbol not defined
> -LDFLAGS:append =3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold'=
, ' -fuse-ld=3Dbfd', '', d)}"
> +LDFLAGS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '-fu=
se-ld=3Dbfd', '', d)}"
> diff --git a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb b/meta/=
recipes-devtools/syslinux/syslinux_6.04-pre2.bb
> index c8e7f25d2b0..d75aa95c1fd 100644
> --- a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
> +++ b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
> @@ -48,7 +48,7 @@ TARGET_LDFLAGS =3D ""
>  SECURITY_LDFLAGS =3D ""
>  LDFLAGS_SECTION_REMOVAL =3D ""
>
> -CFLAGS:append =3D " -DNO_INLINE_FUNCS -Wno-error=3Dimplicit-function-dec=
laration"
> +CFLAGS +=3D "-DNO_INLINE_FUNCS -Wno-error=3Dimplicit-function-declaratio=
n"
>
>  EXTRA_OEMAKE =3D " \
>         BINDIR=3D${bindir} SBINDIR=3D${sbindir} LIBDIR=3D${libdir} \
> diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb b/meta/recipes-ex=
tended/bzip2/bzip2_1.0.8.bb
> index 7d7ab3856b4..adb6ded5812 100644
> --- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
> +++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
> @@ -36,7 +36,7 @@ UPSTREAM_CHECK_URI =3D "https://www.sourceware.org/pub/=
bzip2/"
>
>  PACKAGES =3D+ "libbz2"
>
> -CFLAGS:append =3D " -fPIC -fpic -Winline -fno-strength-reduce -D_FILE_OF=
FSET_BITS=3D64"
> +CFLAGS +=3D "-fPIC -fpic -Winline -fno-strength-reduce -D_FILE_OFFSET_BI=
TS=3D64"
>
>  inherit autotools update-alternatives ptest relative_symlinks
>
> diff --git a/meta/recipes-extended/ltp/ltp_20240524.bb b/meta/recipes-ext=
ended/ltp/ltp_20240524.bb
> index 7105154712f..6b46723478d 100644
> --- a/meta/recipes-extended/ltp/ltp_20240524.bb
> +++ b/meta/recipes-extended/ltp/ltp_20240524.bb
> @@ -39,8 +39,8 @@ inherit autotools-brokensep pkgconfig
>  # SORT_NONE in linker script which isn't supported by gold:
>  # https://sourceware.org/bugzilla/show_bug.cgi?id=3D18097
>  # https://github.com/linux-test-project/ltp/commit/3fce2064b54843218d085=
aae326c8f7ecf3a8c41#diff-39268f0855c634ca48c8993fcd2c95b12a65b79e8d9fa5ccd6=
b0f5a8785c0dd6R36
> -LDFLAGS:append =3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold'=
, ' -fuse-ld=3Dbfd', '', d)}"
> -LDFLAGS:append =3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld',=
 ' -fuse-ld=3Dbfd', '', d)}"
> +LDFLAGS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '-fu=
se-ld=3Dbfd', '', d)}"
> +LDFLAGS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', '-fus=
e-ld=3Dbfd', '', d)}"
>
>  # After 0002-kvm-use-LD-instead-of-hardcoding-ld.patch
>  # https://github.com/linux-test-project/ltp/commit/f94e0ef3b7280f8863847=
03ef9019aaf2f2dfebb
> diff --git a/meta/recipes-extended/pam/libpam_1.6.1.bb b/meta/recipes-ext=
ended/pam/libpam_1.6.1.bb
> index 9f2106ea730..b9ef564f564 100644
> --- a/meta/recipes-extended/pam/libpam_1.6.1.bb
> +++ b/meta/recipes-extended/pam/libpam_1.6.1.bb
> @@ -37,7 +37,7 @@ EXTRA_OECONF =3D "--includedir=3D${includedir}/security=
 \
>                  --disable-doc \
>                 --disable-prelude"
>
> -CFLAGS:append =3D " -fPIC "
> +CFLAGS +=3D "-fPIC "
>
>  S =3D "${WORKDIR}/Linux-PAM-${PV}"
>
> diff --git a/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb b/meta/recipes-gnome/=
gtk+/gtk4_4.14.4.bb
> index cda0552f7cf..fdeb5eb1ec7 100644
> --- a/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb
> +++ b/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb
> @@ -78,7 +78,7 @@ PACKAGECONFIG[vulkan] =3D "-Dvulkan=3Denabled,-Dvulkan=
=3Ddisabled, vulkan-loader vulka
>
>  # Disable int-conversion warning as error until [1] is fixed
>  # [1] https://gitlab.gnome.org/GNOME/gtk/-/issues/6033
> -CFLAGS:append =3D " -Wno-error=3Dint-conversion"
> +CFLAGS +=3D "-Wno-error=3Dint-conversion"
>
>  LIBV =3D "4.0.0"
>
> diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb b/meta/recipe=
s-kernel/lttng/babeltrace2_2.0.6.bb
> index d6c75d75801..a50ba8fcdf1 100644
> --- a/meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb
> +++ b/meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb
> @@ -28,7 +28,7 @@ FILES:${PN}-staticdev +=3D "${libdir}/babeltrace2/plugi=
ns/*.a"
>  FILES:${PN} +=3D "${libdir}/babeltrace2/plugins/*.so"
>
>  ASNEEDED =3D ""
> -LDFLAGS:append =3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld p=
test', ' -fuse-ld=3Dbfd ', '', d)}"
> +LDFLAGS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld ptest',=
 '-fuse-ld=3Dbfd ', '', d)}"
>
>  # coreutils since we need full mktemp
>  RDEPENDS:${PN}-ptest +=3D "bash gawk python3 make grep coreutils finduti=
ls"
> diff --git a/meta/recipes-kernel/powertop/powertop_2.15.bb b/meta/recipes=
-kernel/powertop/powertop_2.15.bb
> index 65c6d0fcd37..ec81d546a86 100644
> --- a/meta/recipes-kernel/powertop/powertop_2.15.bb
> +++ b/meta/recipes-kernel/powertop/powertop_2.15.bb
> @@ -13,7 +13,7 @@ SRCREV =3D "d51ad395436d4d1dcc3ca46e1519ffeb475bf651"
>
>  S =3D "${WORKDIR}/git"
>
> -LDFLAGS:append =3D " -pthread"
> +LDFLAGS +=3D "-pthread"
>
>  inherit autotools gettext pkgconfig bash-completion
>
> diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc b/meta/recip=
es-sato/rxvt-unicode/rxvt-unicode.inc
> index 95cc140e9ea..5193eebb0bc 100644
> --- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
> +++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
> @@ -19,7 +19,7 @@ PROVIDES =3D "virtual/x-terminal-emulator"
>  ALTERNATIVE:${PN} =3D "x-terminal-emulator"
>  ALTERNATIVE_TARGET[x-terminal-emulator] =3D "${bindir}/rxvt"
>
> -CFLAGS:append =3D " -fpermissive"
> +CFLAGS +=3D "-fpermissive"
>
>  EXTRA_OECONF =3D "--enable-xim \
>                 --with-term=3Drxvt --enable-keepscrolling \
> diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-suppo=
rt/sqlite/sqlite3.inc
> index 9a0de085533..d093ec5859e 100644
> --- a/meta/recipes-support/sqlite/sqlite3.inc
> +++ b/meta/recipes-support/sqlite/sqlite3.inc
> @@ -45,14 +45,14 @@ EXTRA_OECONF =3D " \
>  "
>
>  # pread() is in POSIX.1-2001 so any reasonable system must surely suppor=
t it
> -CFLAGS:append =3D " -DUSE_PREAD"
> +CFLAGS +=3D "-DUSE_PREAD"
>
>  # Provide column meta-data API
> -CFLAGS:append =3D " -DSQLITE_ENABLE_COLUMN_METADATA"
> +CFLAGS +=3D "-DSQLITE_ENABLE_COLUMN_METADATA"
>
>  # Unless SQLITE_BYTEORDER is predefined, the code falls back to build ti=
me
>  # huristics, which are not always correct
> -CFLAGS:append =3D " ${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le',=
 '-DSQLITE_BYTEORDER=3D1234', '-DSQLITE_BYTEORDER=3D4321', d)}"
> +CFLAGS +=3D "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', '-DSQL=
ITE_BYTEORDER=3D1234', '-DSQLITE_BYTEORDER=3D4321', d)}"
>
>  PACKAGES =3D "lib${BPN} lib${BPN}-dev lib${BPN}-doc ${PN}-dbg lib${BPN}-=
staticdev ${PN}"
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200637): https://lists.openembedded.org/g/openembedde=
d-core/message/200637
> Mute This Topic: https://lists.openembedded.org/mt/106659253/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

