Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C968CC001E0
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 14:45:46 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.19041.1691678743476095240
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 07:45:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=YL7T3Vdc;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1bed90ee8b7so786083fac.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 07:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691678743; x=1692283543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WrIUIGNXcTGKnTWfimgVjqVAQwsxP31OxL9lJLyZhfY=;
        b=YL7T3VdcfTGfAtMMaASEWG0n8P+Up7Z3U750GYS20ytDfUwBvQE9liAYAZnV+GgNNx
         FMWpS61LmgntcrzYuxoG9ncz9kBk/sbNqGWV3nUpu9AE0UeP78620QsixStA8+e6c4Dt
         HgQHompbnV/ZQhweWu92h994RNUODUMrb/R6wee8qvT/Sh1CV1Jw9OSfpkz9U9IEI70W
         gAc9Q+isSfDWoyGSr87Av0CirQxJw3zqsIeo+qQHh5OgwinKWR2a/tV50Z7PJTKPC/LM
         QEYAdwTHfc8X0Be880ZQ3ocGKn8n6eklfY0X7xOAToQ+4FX3cbrHO1ouFbeBHgHvWdkU
         77wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691678743; x=1692283543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WrIUIGNXcTGKnTWfimgVjqVAQwsxP31OxL9lJLyZhfY=;
        b=GpTljNeSIa2BsjJwTwFHr9D0ZRVc28QfFThbJhtz7Fy2/2eD1Zbo9qZCfmrZejadYa
         wktjbTxhIs8i3SXtg7LAAWOFcJIYEbItY5Hy3p4eFyXW26fTdWkx/Pe4u/vB/VmDpa00
         kEi0BmaAP5srG9KGEKUWAaNumKEHHkf5QVa2s1jEAJp4/q0XuBJvYSXGT7YaGguHayVQ
         A+rTrvMYknCB8Nsyyi7kdJU5+63O9400Qh6LSvE3dkbk3OhkACav6IGUyazDzwPCZU/o
         prFf2D6G3mjfOsMFQ1PU8Ou4RJjZXUTv66J2UysFparbdKgM+pXv/T+yJ3v6eLpStSq/
         pszw==
X-Gm-Message-State: AOJu0YxW88fIg7fyDANBFNR4OQcrDLqrsHef+KxceYs+q+Fume7WgvHp
	pvDGqcqYlsBM/4EhSnHGV022FCllEsdYD/eygrAKR5M0+t0=
X-Google-Smtp-Source: AGHT+IHqqP4YhmPsUEzN749Y+gEsx26rYO6iDqerMDsJo4TjR0BEhMl7td4j3pC5q3Fq0R/nkaBUG8f5j2up30rCsvE=
X-Received: by 2002:a05:6870:2d0:b0:1bb:51e4:9483 with SMTP id
 r16-20020a05687002d000b001bb51e49483mr2840817oaf.45.1691678742615; Thu, 10
 Aug 2023 07:45:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230809210227.2723296-1-raj.khem@gmail.com> <202308101305271063afd1@mail.local>
 <CAMKF1spTEw_xWVHwjbxV+fHTeqz-nvJjGYQU6Jn239ft3Aky0A@mail.gmail.com>
In-Reply-To: <CAMKF1spTEw_xWVHwjbxV+fHTeqz-nvJjGYQU6Jn239ft3Aky0A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 Aug 2023 07:45:16 -0700
Message-ID: <CAMKF1sr3M5H9YyRMaeER-EVD95LW4K3brt-30hpDLdX4rLXgSA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd-boot: Fix build on musl
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 14:45:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185757

On Thu, Aug 10, 2023 at 7:36=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
>
>
> On Thu, Aug 10, 2023 at 6:05 AM Alexandre Belloni <alexandre.belloni@boot=
lin.com> wrote:
>>
>> Hello,
>>
>> I tested this with the meson/systemd series from Ross and it actually
>> breaks the build:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/7581/s=
teps/12/logs/stdio
>
>
> Patch applies only to musl builds did you test a musl + systemd

ah 32bit, let me try to reproduce.

>>
>>
>>
>> On 09/08/2023 14:02:27-0700, Khem Raj wrote:
>> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > ---
>> >  .../0001-efi-Use-char16_t-on-musl.patch       | 79 ++++++++++++++++++=
+
>> >  meta/recipes-core/systemd/systemd-boot_254.bb |  2 +
>> >  2 files changed, 81 insertions(+)
>> >  create mode 100644 meta/recipes-core/systemd/systemd-boot/0001-efi-Us=
e-char16_t-on-musl.patch
>> >
>> > diff --git a/meta/recipes-core/systemd/systemd-boot/0001-efi-Use-char1=
6_t-on-musl.patch b/meta/recipes-core/systemd/systemd-boot/0001-efi-Use-cha=
r16_t-on-musl.patch
>> > new file mode 100644
>> > index 00000000000..1988d50ac90
>> > --- /dev/null
>> > +++ b/meta/recipes-core/systemd/systemd-boot/0001-efi-Use-char16_t-on-=
musl.patch
>> > @@ -0,0 +1,79 @@
>> > +From efe1720de61534c814580fec61fe0025308482b2 Mon Sep 17 00:00:00 200=
1
>> > +From: Khem Raj <raj.khem@gmail.com>
>> > +Date: Tue, 8 Aug 2023 00:57:12 -0700
>> > +Subject: [PATCH] efi: Use char16_t on musl
>> > +
>> > +musl does not support configurations with under-sized definitions of
>> > +types like 16-bit wchar_t or 32-bit off_t. Only the sizes that can
>> > +represent the full range of values are supported. musl does however
>> > +have the C11 uchar.h functions which can operate on char16_t, so you
>> > +could use char16_t and the corresponding c16 conversion functions
>> > +instead of the wc versions
>> > +
>> > +Upstream-Status: Inappropriate [Musl specific]
>> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > +---
>> > + src/boot/efi/efi-string.c                 | 2 +-
>> > + src/boot/efi/efi.h                        | 2 ++
>> > + src/boot/efi/meson.build                  | 1 -
>> > + src/fundamental/string-util-fundamental.h | 4 ++++
>> > + 4 files changed, 7 insertions(+), 2 deletions(-)
>> > +
>> > +diff --git a/src/boot/efi/efi-string.c b/src/boot/efi/efi-string.c
>> > +index 4400591255..421b2c262d 100644
>> > +--- a/src/boot/efi/efi-string.c
>> > ++++ b/src/boot/efi/efi-string.c
>> > +@@ -735,7 +735,7 @@ static bool handle_format_specifier(FormatContext=
 *ctx, SpecifierContext *sp) {
>> > +         case 's':
>> > +                 if (sp->long_arg) {
>> > +                         sp->wstr =3D va_arg(ctx->ap, const wchar_t *=
) ?: L"(null)";
>> > +-                        sp->len =3D wcsnlen(sp->wstr, sp->len);
>> > ++                        sp->len =3D wcsnlen((char16_t*)sp->wstr, sp-=
>len);
>> > +                 } else {
>> > +                         sp->str =3D va_arg(ctx->ap, const char *) ?:=
 "(null)";
>> > +                         sp->len =3D strnlen8(sp->str, sp->len);
>> > +diff --git a/src/boot/efi/efi.h b/src/boot/efi/efi.h
>> > +index 5c34668383..459f675ea5 100644
>> > +--- a/src/boot/efi/efi.h
>> > ++++ b/src/boot/efi/efi.h
>> > +@@ -21,7 +21,9 @@ assert_cc(sizeof(uint8_t) =3D=3D 1);
>> > + assert_cc(sizeof(uint16_t) =3D=3D 2);
>> > + assert_cc(sizeof(uint32_t) =3D=3D 4);
>> > + assert_cc(sizeof(uint64_t) =3D=3D 8);
>> > ++#if defined(__linux__) && defined(__GLIBC__)
>> > + assert_cc(sizeof(wchar_t) =3D=3D 2);
>> > ++#endif
>> > + assert_cc(sizeof(char16_t) =3D=3D 2);
>> > + assert_cc(sizeof(char32_t) =3D=3D 4);
>> > + assert_cc(sizeof(size_t) =3D=3D sizeof(void *));
>> > +diff --git a/src/boot/efi/meson.build b/src/boot/efi/meson.build
>> > +index 1c52629651..4a64838295 100644
>> > +--- a/src/boot/efi/meson.build
>> > ++++ b/src/boot/efi/meson.build
>> > +@@ -132,7 +132,6 @@ efi_c_args =3D [
>> > +         '-DSD_BOOT=3D1',
>> > +         '-ffreestanding',
>> > +         '-fno-strict-aliasing',
>> > +-        '-fshort-wchar',
>> > +         '-include', 'efi_config.h',
>> > + ]
>> > +
>> > +diff --git a/src/fundamental/string-util-fundamental.h b/src/fundamen=
tal/string-util-fundamental.h
>> > +index 9019542b16..1b46f42995 100644
>> > +--- a/src/fundamental/string-util-fundamental.h
>> > ++++ b/src/fundamental/string-util-fundamental.h
>> > +@@ -16,7 +16,11 @@
>> > + #  define strncmp strncmp16
>> > + #  define strcasecmp strcasecmp16
>> > + #  define strncasecmp strncasecmp16
>> > ++#if defined (__linux__) && !defined(__GLIBC__)
>> > ++#  define STR_C(str)       (u ## str)
>> > ++#else
>> > + #  define STR_C(str)       (L ## str)
>> > ++#endif
>> > + typedef char16_t sd_char;
>> > + #else
>> > + #  define STR_C(str)       (str)
>> > +--
>> > +2.41.0
>> > +
>> > diff --git a/meta/recipes-core/systemd/systemd-boot_254.bb b/meta/reci=
pes-core/systemd/systemd-boot_254.bb
>> > index 5d69cf83abc..ae86450d2a6 100644
>> > --- a/meta/recipes-core/systemd/systemd-boot_254.bb
>> > +++ b/meta/recipes-core/systemd/systemd-boot_254.bb
>> > @@ -1,6 +1,8 @@
>> >  require systemd.inc
>> >  FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/systemd:"
>> >
>> > +SRC_URI:append:libc-musl =3D " file://0001-efi-Use-char16_t-on-musl.p=
atch "
>> > +
>> >  require conf/image-uefi.conf
>> >
>> >  DEPENDS =3D "intltool-native libcap util-linux gperf-native python3-j=
inja2-native python3-pyelftools-native"
>> > --
>> > 2.41.0
>> >
>>
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#185718): https://lists.openembedded.org/g/openembe=
dded-core/message/185718
>> > Mute This Topic: https://lists.openembedded.org/mt/100652047/3617179
>> > Group Owner: openembedded-core+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[alexandre.belloni@bootlin.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >
>>
>>
>> --
>> Alexandre Belloni, co-owner and COO, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com

