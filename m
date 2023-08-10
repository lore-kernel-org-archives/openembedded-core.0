Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 156AEC001B0
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 15:01:27 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.19436.1691679676812121253
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 08:01:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cXn+IFJS;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6B60660004;
	Thu, 10 Aug 2023 15:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691679674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UE7pAupl/U8mJjYLsZurFH0m72z7GU7sz/+8o2TQMi0=;
	b=cXn+IFJSQiXzQ0pAkuA53SQoSlVdCQeBNAfWPUfMmjyYvY8KPDm03RorjKT6W4fOZAVnOz
	0nkznmoA/e0SVpRI70PJwpskePtb5fDC90lPAqcrMJYO5VZr2ky/WcagvnnZvyyo9wGZQS
	8PyLu4yQRswG3ZF3izz4gBeEGr6pn+Y3k8Mn1Azi2FOrOt2b/cZ2QAeFb1X70VWdFE+mAO
	Qk3au9mKbI6pVufUDDQvSRrT+2I8T9WZkvEbiIYzn7aeTD8SG7ZD7Ci5UOXxb7FIjx1YlA
	ECI+AnoK6k3mSDQlvttspOT/eGQx0Mhq8YLkYvy3RgxNA3+a0UUEEfXWqlRKmA==
Date: Thu, 10 Aug 2023 17:01:14 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] systemd-boot: Fix build on musl
Message-ID: <202308101501147a222eb2@mail.local>
References: <20230809210227.2723296-1-raj.khem@gmail.com>
 <202308101305271063afd1@mail.local>
 <CAMKF1spTEw_xWVHwjbxV+fHTeqz-nvJjGYQU6Jn239ft3Aky0A@mail.gmail.com>
 <CAMKF1sr3M5H9YyRMaeER-EVD95LW4K3brt-30hpDLdX4rLXgSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMKF1sr3M5H9YyRMaeER-EVD95LW4K3brt-30hpDLdX4rLXgSA@mail.gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 15:01:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185759

On 10/08/2023 07:45:16-0700, Khem Raj wrote:
> On Thu, Aug 10, 2023 at 7:36 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> >
> >
> > On Thu, Aug 10, 2023 at 6:05 AM Alexandre Belloni <alexandre.belloni@bootlin.com> wrote:
> >>
> >> Hello,
> >>
> >> I tested this with the meson/systemd series from Ross and it actually
> >> breaks the build:
> >>
> >> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/7581/steps/12/logs/stdio
> >
> >
> > Patch applies only to musl builds did you test a musl + systemd
> 
> ah 32bit, let me try to reproduce.

It also happened on qemux86-64:

https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/7604/steps/11/logs/stdio

> 
> >>
> >>
> >>
> >> On 09/08/2023 14:02:27-0700, Khem Raj wrote:
> >> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> > ---
> >> >  .../0001-efi-Use-char16_t-on-musl.patch       | 79 +++++++++++++++++++
> >> >  meta/recipes-core/systemd/systemd-boot_254.bb |  2 +
> >> >  2 files changed, 81 insertions(+)
> >> >  create mode 100644 meta/recipes-core/systemd/systemd-boot/0001-efi-Use-char16_t-on-musl.patch
> >> >
> >> > diff --git a/meta/recipes-core/systemd/systemd-boot/0001-efi-Use-char16_t-on-musl.patch b/meta/recipes-core/systemd/systemd-boot/0001-efi-Use-char16_t-on-musl.patch
> >> > new file mode 100644
> >> > index 00000000000..1988d50ac90
> >> > --- /dev/null
> >> > +++ b/meta/recipes-core/systemd/systemd-boot/0001-efi-Use-char16_t-on-musl.patch
> >> > @@ -0,0 +1,79 @@
> >> > +From efe1720de61534c814580fec61fe0025308482b2 Mon Sep 17 00:00:00 2001
> >> > +From: Khem Raj <raj.khem@gmail.com>
> >> > +Date: Tue, 8 Aug 2023 00:57:12 -0700
> >> > +Subject: [PATCH] efi: Use char16_t on musl
> >> > +
> >> > +musl does not support configurations with under-sized definitions of
> >> > +types like 16-bit wchar_t or 32-bit off_t. Only the sizes that can
> >> > +represent the full range of values are supported. musl does however
> >> > +have the C11 uchar.h functions which can operate on char16_t, so you
> >> > +could use char16_t and the corresponding c16 conversion functions
> >> > +instead of the wc versions
> >> > +
> >> > +Upstream-Status: Inappropriate [Musl specific]
> >> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> > +---
> >> > + src/boot/efi/efi-string.c                 | 2 +-
> >> > + src/boot/efi/efi.h                        | 2 ++
> >> > + src/boot/efi/meson.build                  | 1 -
> >> > + src/fundamental/string-util-fundamental.h | 4 ++++
> >> > + 4 files changed, 7 insertions(+), 2 deletions(-)
> >> > +
> >> > +diff --git a/src/boot/efi/efi-string.c b/src/boot/efi/efi-string.c
> >> > +index 4400591255..421b2c262d 100644
> >> > +--- a/src/boot/efi/efi-string.c
> >> > ++++ b/src/boot/efi/efi-string.c
> >> > +@@ -735,7 +735,7 @@ static bool handle_format_specifier(FormatContext *ctx, SpecifierContext *sp) {
> >> > +         case 's':
> >> > +                 if (sp->long_arg) {
> >> > +                         sp->wstr = va_arg(ctx->ap, const wchar_t *) ?: L"(null)";
> >> > +-                        sp->len = wcsnlen(sp->wstr, sp->len);
> >> > ++                        sp->len = wcsnlen((char16_t*)sp->wstr, sp->len);
> >> > +                 } else {
> >> > +                         sp->str = va_arg(ctx->ap, const char *) ?: "(null)";
> >> > +                         sp->len = strnlen8(sp->str, sp->len);
> >> > +diff --git a/src/boot/efi/efi.h b/src/boot/efi/efi.h
> >> > +index 5c34668383..459f675ea5 100644
> >> > +--- a/src/boot/efi/efi.h
> >> > ++++ b/src/boot/efi/efi.h
> >> > +@@ -21,7 +21,9 @@ assert_cc(sizeof(uint8_t) == 1);
> >> > + assert_cc(sizeof(uint16_t) == 2);
> >> > + assert_cc(sizeof(uint32_t) == 4);
> >> > + assert_cc(sizeof(uint64_t) == 8);
> >> > ++#if defined(__linux__) && defined(__GLIBC__)
> >> > + assert_cc(sizeof(wchar_t) == 2);
> >> > ++#endif
> >> > + assert_cc(sizeof(char16_t) == 2);
> >> > + assert_cc(sizeof(char32_t) == 4);
> >> > + assert_cc(sizeof(size_t) == sizeof(void *));
> >> > +diff --git a/src/boot/efi/meson.build b/src/boot/efi/meson.build
> >> > +index 1c52629651..4a64838295 100644
> >> > +--- a/src/boot/efi/meson.build
> >> > ++++ b/src/boot/efi/meson.build
> >> > +@@ -132,7 +132,6 @@ efi_c_args = [
> >> > +         '-DSD_BOOT=1',
> >> > +         '-ffreestanding',
> >> > +         '-fno-strict-aliasing',
> >> > +-        '-fshort-wchar',
> >> > +         '-include', 'efi_config.h',
> >> > + ]
> >> > +
> >> > +diff --git a/src/fundamental/string-util-fundamental.h b/src/fundamental/string-util-fundamental.h
> >> > +index 9019542b16..1b46f42995 100644
> >> > +--- a/src/fundamental/string-util-fundamental.h
> >> > ++++ b/src/fundamental/string-util-fundamental.h
> >> > +@@ -16,7 +16,11 @@
> >> > + #  define strncmp strncmp16
> >> > + #  define strcasecmp strcasecmp16
> >> > + #  define strncasecmp strncasecmp16
> >> > ++#if defined (__linux__) && !defined(__GLIBC__)
> >> > ++#  define STR_C(str)       (u ## str)
> >> > ++#else
> >> > + #  define STR_C(str)       (L ## str)
> >> > ++#endif
> >> > + typedef char16_t sd_char;
> >> > + #else
> >> > + #  define STR_C(str)       (str)
> >> > +--
> >> > +2.41.0
> >> > +
> >> > diff --git a/meta/recipes-core/systemd/systemd-boot_254.bb b/meta/recipes-core/systemd/systemd-boot_254.bb
> >> > index 5d69cf83abc..ae86450d2a6 100644
> >> > --- a/meta/recipes-core/systemd/systemd-boot_254.bb
> >> > +++ b/meta/recipes-core/systemd/systemd-boot_254.bb
> >> > @@ -1,6 +1,8 @@
> >> >  require systemd.inc
> >> >  FILESEXTRAPATHS =. "${FILE_DIRNAME}/systemd:"
> >> >
> >> > +SRC_URI:append:libc-musl = " file://0001-efi-Use-char16_t-on-musl.patch "
> >> > +
> >> >  require conf/image-uefi.conf
> >> >
> >> >  DEPENDS = "intltool-native libcap util-linux gperf-native python3-jinja2-native python3-pyelftools-native"
> >> > --
> >> > 2.41.0
> >> >
> >>
> >> >
> >> > -=-=-=-=-=-=-=-=-=-=-=-
> >> > Links: You receive all messages sent to this group.
> >> > View/Reply Online (#185718): https://lists.openembedded.org/g/openembedded-core/message/185718
> >> > Mute This Topic: https://lists.openembedded.org/mt/100652047/3617179
> >> > Group Owner: openembedded-core+owner@lists.openembedded.org
> >> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> >> > -=-=-=-=-=-=-=-=-=-=-=-
> >> >
> >>
> >>
> >> --
> >> Alexandre Belloni, co-owner and COO, Bootlin
> >> Embedded Linux and Kernel engineering
> >> https://bootlin.com

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

