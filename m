Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10C76C02181
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 04:20:48 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web11.35291.1737519638933888244
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jan 2025 20:20:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FjgPR1o+;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3eba347aa6fso4110880b6e.3
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 20:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737519638; x=1738124438; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VdW/DQMNNLOJPk+aLmgUQfAhp7NS9TZuPci66O4yKvU=;
        b=FjgPR1o+SPoS4GuWW5mdoEevt3kq226/OSUkDSRSX/nP9eRpbls3R+I2YZNDlYQyhj
         FitB4sp+oMESId/nbjeDBe8I0PveAVwlC4WWyofZ5cmW80s+YwDQBOJTFF7N2QtMLY8u
         Pn6VXzD/izTlDCxsOMOO0Txwoar/zRRwkEbXDA6Je/xMTyK7vRkJzcg1fQnoynZQNaFO
         07qTLOA3YoCNxwx8ZUmy/nIhRUr6TJ6BhU10p2aH4IASFTwoVDOnanXQhQ1mOPvt4Z6z
         UY8ociOhvc1JO6dPGojfzF3zD5XjRZ2cEIhOARS4IV0pP6uDrisS6rdMefg4JrosGKnt
         o0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737519638; x=1738124438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VdW/DQMNNLOJPk+aLmgUQfAhp7NS9TZuPci66O4yKvU=;
        b=LUfIwJYILmhOX3SfjTJqVef1oWWwEemSjOuALF70B31oBQPnJRxqDm3XvLYUYHmBPo
         Fn67wJwFixrEt2mg6Un2Nd5UTNbtROC+VviLw3ekxK+uKQ4D2aHNCaYBy5mtKAleQg/9
         CG97oHyN/on4VY9weopw05Dfa++jAl8qz3Sk4Dl6n+p8W1prMDLCV/5LmpvK1PPKM7X6
         Zx3QOpeQTjHFH4c5Nb2Yi+hRP1QBqNv/qeYFfRLWTICUIdk9zRGL4KwLrWRXZ4cJkEC/
         DOBMAH8ey7yszbww0jvRvXTM/F7j9RfkTPoY5dCuk3LnZc8V3ULO+gL7Gymk0mVlckB7
         dTXw==
X-Gm-Message-State: AOJu0Ywa67AbGtfjkMpEgyQni+7uyYnXzdeJo4qoVDH7eQaUAeorphNm
	iY72bJgavDjKkcn/5iYMEKPRGU8N7eDvrdNwiyaZF1BWhKao1ERYetyoG35MpYPIYXXpIoSzTX1
	OgipAwojnaIbWBppblec/PJF0xpcLqVzI
X-Gm-Gg: ASbGncvH+0EWW4cCk+4eAvzoxNjvv2xl4sB9Ap6nvl50t2Ca7Q8QPQ3gM2H77hNoObD
	+RF151Wtjo1t/ZnwlGjDIUpzlKqNNuEAZJ72UuU/kpPI7a+tQxw==
X-Google-Smtp-Source: AGHT+IF/ZHJPMATtvCmVK0pI9N0VNc64CG/nHk/4WdGor+77fipDe6qu8h+/vaBd1wGX0QIOkXsrujUezY1ds20YGXA=
X-Received: by 2002:a05:6871:aa13:b0:29e:3345:74ff with SMTP id
 586e51a60fabf-2b1c0ae2172mr10879705fac.23.1737519638070; Tue, 21 Jan 2025
 20:20:38 -0800 (PST)
MIME-Version: 1.0
References: <20250121085526.1370937-1-hongxu.jia@windriver.com> <20250121085526.1370937-7-hongxu.jia@windriver.com>
In-Reply-To: <20250121085526.1370937-7-hongxu.jia@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Jan 2025 20:20:11 -0800
X-Gm-Features: AbW1kvYTkugBzVPrnrE0aychj7k2i__wxlOP_mMXZY8hwO7k5hqDDVndC2axt1A
Message-ID: <CAMKF1sqf-Dc=Tz1tnFgqEw-dM8Vc8toWJwr5=LqgN=QEmCNb8w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 7/9] gcc-configure-common.inc: add multlib
 support for i686/i586/x86_64 nativesdk gcc
To: hongxu.jia@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 04:20:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210130

seems ok to me.

On Tue, Jan 21, 2025 at 12:55=E2=80=AFAM hongxu via lists.openembedded.org
<hongxu.jia=3Deng.windriver.com@lists.openembedded.org> wrote:
>
> We have patch 0016-handle-sysroot-support-for-nativesdk-gcc.patch to hand=
le
> sysroot support for nativesdk-gcc, and add %r target_relocatable_prefix
> into spec file for nativesdk-gcc relocation. It was used for injected
> paths SYSTEMLIBS_DIR
>
> Due to the supported SDKMACHINE includes:
>
>   aarch64, i586, i686, loongarch64, ppc64, ppc64le, riscv64, x86_64
>
> Only i586 and x86_64, i686 and x86_64 have multilib relationship,
> for i586,i686 and x86_64, this commit:
>
> - Tweak target_relocatable_prefix, set ${root_prefix} to it, and tweak
> libdir32 and libdir64 based on ${root_prefix} prefix with "/lib" and
> "/lib64" suffix.
>
> - Harcode dirnames ['m64', 'm32'] and osdirnames ['../lib64', '../lib']
>
> Above setting also covers gcc-nativesdk without multilib
>
> For other situation, the configuration is the same as usual
>
> [ YOCTO #15722 ]
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/recipes-devtools/gcc/gcc-configure-common.inc       | 9 +++++++++
>  meta/recipes-devtools/gcc/gcc-multilib-config.inc        | 5 +++++
>  .../0016-handle-sysroot-support-for-nativesdk-gcc.patch  | 2 +-
>  3 files changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/re=
cipes-devtools/gcc/gcc-configure-common.inc
> index 5c79936242..bd5c953334 100644
> --- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
> +++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> @@ -73,6 +73,14 @@ SYSTEMHEADERS =3D "${target_includedir}"
>  SYSTEMLIBS =3D "${target_base_libdir}/"
>  SYSTEMLIBS1 =3D "${target_libdir}/"
>
> +def tune_target_relocatable_prefix(d):
> +    if d.getVar("SDK_ARCH") in ["x86_64", "i686", "i586"]:
> +        return d.getVar("root_prefix")
> +    else:
> +        return d.getVar("SYSTEMLIBS")
> +TARGET_RELOCATE_PREFIX =3D "${SYSTEMLIBS}"
> +TARGET_RELOCATE_PREFIX:class-nativesdk =3D "${@tune_target_relocatable_p=
refix(d)}"
> +
>  do_configure:prepend () {
>         # teach gcc to find correct target includedir when checking libc =
ssp support
>         mkdir -p ${B}/gcc
> @@ -83,6 +91,7 @@ do_configure:prepend () {
>  #define STANDARD_STARTFILE_PREFIX_1 "${SYSTEMLIBS}"
>  #define STANDARD_STARTFILE_PREFIX_2 "${SYSTEMLIBS1}"
>  #define SYSTEMLIBS_DIR "${SYSTEMLIBS}"
> +#define TARGET_RELOCATE_PREFIX "${TARGET_RELOCATE_PREFIX}"
>  #endif /* ! GCC_DEFAULTS_H */
>  _EOF
>         mv ${B}/gcc/defaults.h.new ${B}/gcc/defaults.h
> diff --git a/meta/recipes-devtools/gcc/gcc-multilib-config.inc b/meta/rec=
ipes-devtools/gcc/gcc-multilib-config.inc
> index 2dbbc23c94..31336f75eb 100644
> --- a/meta/recipes-devtools/gcc/gcc-multilib-config.inc
> +++ b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
> @@ -172,6 +172,11 @@ python gcc_multilib_setup() {
>      target_arch =3D (d.getVar('TARGET_ARCH_MULTILIB_ORIGINAL') if mlpref=
ix
>                      else d.getVar('TARGET_ARCH'))
>      if pn =3D=3D "nativesdk-gcc":
> +        if d.getVar('SDK_ARCH') in ['x86_64', 'i686', 'i586']:
> +            libdir32 =3D '%r/lib'
> +            libdir64 =3D '%r/lib64'
> +            target_config_files =3D gcc_target_config_files[d.getVar("SD=
K_ARCH")]
> +            write_config(builddir, target_config_files, ['m64', 'm32'], =
['64', '32'], ['../lib64', '../lib'])
>          header_config_files =3D gcc_header_config_files[d.getVar("SDK_AR=
CH")]
>          write_headers(builddir, header_config_files, libdir32, libdir64,=
 libdirx32, libdirn32)
>          return
> diff --git a/meta/recipes-devtools/gcc/gcc/0016-handle-sysroot-support-fo=
r-nativesdk-gcc.patch b/meta/recipes-devtools/gcc/gcc/0016-handle-sysroot-s=
upport-for-nativesdk-gcc.patch
> index edd100ee46..7d96a42027 100644
> --- a/meta/recipes-devtools/gcc/gcc/0016-handle-sysroot-support-for-nativ=
esdk-gcc.patch
> +++ b/meta/recipes-devtools/gcc/gcc/0016-handle-sysroot-support-for-nativ=
esdk-gcc.patch
> @@ -389,7 +389,7 @@ index e3e9374d1cc..b080609341b 100644
>   #endif
>   static const char *target_system_root =3D DEFAULT_TARGET_SYSTEM_ROOT;
>
> -+static char target_relocatable_prefix[4096] __attribute__ ((section (".=
gccrelocprefix"))) =3D SYSTEMLIBS_DIR;
> ++static char target_relocatable_prefix[4096] __attribute__ ((section (".=
gccrelocprefix"))) =3D TARGET_RELOCATE_PREFIX;
>  +
>   /* Nonzero means pass the updated target_system_root to the compiler.  =
*/
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#210079): https://lists.openembedded.org/g/openembedde=
d-core/message/210079
> Mute This Topic: https://lists.openembedded.org/mt/110730425/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

