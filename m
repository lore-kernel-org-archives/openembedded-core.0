Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DED7AC001B0
	for <webhook@archiver.kernel.org>; Wed,  9 Aug 2023 21:02:31 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.2836.1691614951162760401
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Aug 2023 14:02:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Wq6k9OvH;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-686efb9ee3cso193981b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 14:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691614950; x=1692219750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zZ59V5+HiL+EkpUI2VF+GpdcOKSsykFmf8zE0PZ9oKw=;
        b=Wq6k9OvHDwI2+SHG7m4ZkOyZWzpRiOPqVoijCHZh48mrEhXkPS2vyul2LurIK0IGCi
         qlzQGin71bkfjhBE/tHF+tE/j5Qg4+xwH7+6AGpJnk29VoqFzxc3E4vf7fr/KoAKUHlA
         QjStZfGtg5Dvp7rps2plM52kilrdZ1mfcSM0l3C1hiOmeotKb6Q3/HBYjqrLmcHX+fj0
         hLC8ELfo9/GBuw7Oic3hPQECnTQ01VydF4WtTdRe97MgMrKo5IUBuWhoYKbbwLp/4elJ
         E0/k3W9yQbG3qtcIZBYHIvIEAg/7ATY+Sft/PG9NHNcWDKQUDj9GiLSrP8eblMy/BS+o
         hQVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691614950; x=1692219750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zZ59V5+HiL+EkpUI2VF+GpdcOKSsykFmf8zE0PZ9oKw=;
        b=TRcMv8hJPbHI9qdzwNjLjGsptsCuTCEctJR5g5Xir9iLmWuS0D9rjVVyDGRBHMA9zc
         JA+QA0NHT13546SHLch2KVcS7REOsdia67KCmezWgaGQRhWrqA8qjxRXc/VALT+zLXGF
         nm4uuRzHIhCrPdDv/tNcQATwwlMOmIUpGZUdR3nXSagxERegPl0+urPOHGCPYhJd2mlm
         78+1WAIrVYozYseTz9PoLCcSrUwNR8050AKHvTTvdYZRvNW2YqB3O1FQQBTrQ/uuUfx3
         WhzeARp/i0FLhFGYPgFGgZF6Kw4X4Jep+H47pz4U7SeW0l2hyfXBwR9RoAF7A5regucJ
         vcHg==
X-Gm-Message-State: AOJu0YxMQ87VvH3hhf9jFqa8KBjmBv7XUaOiqUw4G3zZPWIsRHi8A3G0
	Z/22DRnnWfuR/eW+H2RtF0I3BkiafYPx1w==
X-Google-Smtp-Source: AGHT+IF+/+rhnUPy8ZHbfHxyFpguZqxvoPRqycIFvhZmI/Ucso043mNRH6zqkC2Vj3HmDVNRf/b7GQ==
X-Received: by 2002:a05:6a20:7349:b0:131:5b6f:ccb6 with SMTP id v9-20020a056a20734900b001315b6fccb6mr483173pzc.19.1691614950253;
        Wed, 09 Aug 2023 14:02:30 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::61c9])
        by smtp.gmail.com with ESMTPSA id ca20-20020a056a02069400b00563bee47a79sm27020pgb.80.2023.08.09.14.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 14:02:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] systemd-boot: Fix build on musl
Date: Wed,  9 Aug 2023 14:02:27 -0700
Message-ID: <20230809210227.2723296-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 21:02:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185718

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-efi-Use-char16_t-on-musl.patch       | 79 +++++++++++++++++++
 meta/recipes-core/systemd/systemd-boot_254.bb |  2 +
 2 files changed, 81 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd-boot/0001-efi-Use-char16_t-on-musl.patch

diff --git a/meta/recipes-core/systemd/systemd-boot/0001-efi-Use-char16_t-on-musl.patch b/meta/recipes-core/systemd/systemd-boot/0001-efi-Use-char16_t-on-musl.patch
new file mode 100644
index 00000000000..1988d50ac90
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd-boot/0001-efi-Use-char16_t-on-musl.patch
@@ -0,0 +1,79 @@
+From efe1720de61534c814580fec61fe0025308482b2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 8 Aug 2023 00:57:12 -0700
+Subject: [PATCH] efi: Use char16_t on musl
+
+musl does not support configurations with under-sized definitions of
+types like 16-bit wchar_t or 32-bit off_t. Only the sizes that can
+represent the full range of values are supported. musl does however
+have the C11 uchar.h functions which can operate on char16_t, so you
+could use char16_t and the corresponding c16 conversion functions
+instead of the wc versions
+
+Upstream-Status: Inappropriate [Musl specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/boot/efi/efi-string.c                 | 2 +-
+ src/boot/efi/efi.h                        | 2 ++
+ src/boot/efi/meson.build                  | 1 -
+ src/fundamental/string-util-fundamental.h | 4 ++++
+ 4 files changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/src/boot/efi/efi-string.c b/src/boot/efi/efi-string.c
+index 4400591255..421b2c262d 100644
+--- a/src/boot/efi/efi-string.c
++++ b/src/boot/efi/efi-string.c
+@@ -735,7 +735,7 @@ static bool handle_format_specifier(FormatContext *ctx, SpecifierContext *sp) {
+         case 's':
+                 if (sp->long_arg) {
+                         sp->wstr = va_arg(ctx->ap, const wchar_t *) ?: L"(null)";
+-                        sp->len = wcsnlen(sp->wstr, sp->len);
++                        sp->len = wcsnlen((char16_t*)sp->wstr, sp->len);
+                 } else {
+                         sp->str = va_arg(ctx->ap, const char *) ?: "(null)";
+                         sp->len = strnlen8(sp->str, sp->len);
+diff --git a/src/boot/efi/efi.h b/src/boot/efi/efi.h
+index 5c34668383..459f675ea5 100644
+--- a/src/boot/efi/efi.h
++++ b/src/boot/efi/efi.h
+@@ -21,7 +21,9 @@ assert_cc(sizeof(uint8_t) == 1);
+ assert_cc(sizeof(uint16_t) == 2);
+ assert_cc(sizeof(uint32_t) == 4);
+ assert_cc(sizeof(uint64_t) == 8);
++#if defined(__linux__) && defined(__GLIBC__)
+ assert_cc(sizeof(wchar_t) == 2);
++#endif
+ assert_cc(sizeof(char16_t) == 2);
+ assert_cc(sizeof(char32_t) == 4);
+ assert_cc(sizeof(size_t) == sizeof(void *));
+diff --git a/src/boot/efi/meson.build b/src/boot/efi/meson.build
+index 1c52629651..4a64838295 100644
+--- a/src/boot/efi/meson.build
++++ b/src/boot/efi/meson.build
+@@ -132,7 +132,6 @@ efi_c_args = [
+         '-DSD_BOOT=1',
+         '-ffreestanding',
+         '-fno-strict-aliasing',
+-        '-fshort-wchar',
+         '-include', 'efi_config.h',
+ ]
+ 
+diff --git a/src/fundamental/string-util-fundamental.h b/src/fundamental/string-util-fundamental.h
+index 9019542b16..1b46f42995 100644
+--- a/src/fundamental/string-util-fundamental.h
++++ b/src/fundamental/string-util-fundamental.h
+@@ -16,7 +16,11 @@
+ #  define strncmp strncmp16
+ #  define strcasecmp strcasecmp16
+ #  define strncasecmp strncasecmp16
++#if defined (__linux__) && !defined(__GLIBC__)
++#  define STR_C(str)       (u ## str)
++#else
+ #  define STR_C(str)       (L ## str)
++#endif
+ typedef char16_t sd_char;
+ #else
+ #  define STR_C(str)       (str)
+-- 
+2.41.0
+
diff --git a/meta/recipes-core/systemd/systemd-boot_254.bb b/meta/recipes-core/systemd/systemd-boot_254.bb
index 5d69cf83abc..ae86450d2a6 100644
--- a/meta/recipes-core/systemd/systemd-boot_254.bb
+++ b/meta/recipes-core/systemd/systemd-boot_254.bb
@@ -1,6 +1,8 @@
 require systemd.inc
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/systemd:"
 
+SRC_URI:append:libc-musl = " file://0001-efi-Use-char16_t-on-musl.patch "
+
 require conf/image-uefi.conf
 
 DEPENDS = "intltool-native libcap util-linux gperf-native python3-jinja2-native python3-pyelftools-native"
-- 
2.41.0


