Return-Path: <nathan@nathanrossi.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52417C433FE
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 08:17:48 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.3322.1668413866729481408
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Nov 2022 00:17:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nathanrossi.com header.s=google header.b=iKUSAe0g;
 spf=pass (domain: nathanrossi.com, ip: 209.85.214.171, mailfrom: nathan@nathanrossi.com)
Received: by mail-pl1-f171.google.com with SMTP id w23so2959569ply.12
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 00:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nathanrossi.com; s=google;
        h=mime-version:content-transfer-encoding:subject:cc:to:from
         :references:in-reply-to:message-id:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WkswO2YP8PCN/C7p5/C85ie00YIW3dLhkfH9lHLBedc=;
        b=iKUSAe0gtVjOUb/HTQDa+OFQ0ZyCDJc5Lz2kjdWkmgJi9phdWoOgEOyPB76IoN5HG8
         /iycxf/p0ADB7VpObmjKAn692elNfgY5aMbqQxuaA7Mdnwl2ZP6ChOjWBF28/YaUI7b/
         Eb1HlKLKlgDus5xdLj4WSxmDTHauwqzDmbJvDiGiXyo8J1Y67N2X4+zq6d+iAVOch7cu
         xWozvZ5r5AJ9JkKZnQgrO/11wbXUIQdvqQiCw1C/r0Eu52E63mmdSQDEIaA2/1YoJoyI
         WarIcU1UEMcK/72tGoaJ0Xxk6IajaF+zyad7AGiE0FX9Ob3JAwdKZ17/0B4cy3esImpG
         mKKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:content-transfer-encoding:subject:cc:to:from
         :references:in-reply-to:message-id:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WkswO2YP8PCN/C7p5/C85ie00YIW3dLhkfH9lHLBedc=;
        b=ziKa8wxVYhKSYCmBlYFFqCTteSk5+y3ltjZegTbutuPunJTiyIZozmFB5NCVeDFf1p
         65Pgygj2TzjoHeNiMoappU4ajoX9gjyVEUW/U5uh1NH5NFlIJhz9yIrdaTKJMHdE+H9b
         ZvFpQG4N0QTqDpzOA90sXWENrRrcZ3y5LIvJ9mAmT3lB0NDbjMvLJTWcz0XdyNW2448k
         7lPpEy+hvx95synCHPikY+Zyo3cujUDUBJ09p9+R2WuUH6y5ReGfRqyX05/4uRQbk8Lj
         kg+UnS58EyQA9vI9MugYLf8y1O7tzZAfbyJUwr5qxKJy1kKO44WfZZXQCE5M0tA9JYTE
         NVOQ==
X-Gm-Message-State: ANoB5pl9EPOZkmxbJ6L13Mjsov0dHHZ8/fm64zxsAaVT9EvXVVVLUt0c
	KmoopZwYFNy3JoXhxsHS4kF5MrPSfbPmzA==
X-Google-Smtp-Source: AA0mqf4CrF2rhtA3IyX0L5KlN4U2ctkKoOug2ZMgyOB4g9X8sUuszLhUh3VilFEwbvLJ6KvmGnGkUA==
X-Received: by 2002:a17:903:210a:b0:186:9f20:e7e2 with SMTP id o10-20020a170903210a00b001869f20e7e2mr12244552ple.174.1668413865821;
        Mon, 14 Nov 2022 00:17:45 -0800 (PST)
Received: from [127.0.1.1] (117-20-68-146.751444.bne.nbn.aussiebb.net. [117.20.68.146])
        by smtp.gmail.com with UTF8SMTPSA id jb1-20020a170903258100b00183c67844aesm6722885plb.22.2022.11.14.00.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 00:17:44 -0800 (PST)
Date: Mon, 14 Nov 2022 08:17:18 +0000
Message-Id: <20221114081718.50468-3-nathan@nathanrossi.com>
In-Reply-To: <20221114081718.50468-1-nathan@nathanrossi.com>
References: <20221114081718.50468-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
Cc: Nathan Rossi <nathan@nathanrossi.com>,
 Nathan Rossi <nathan.rossi@digi.com>, Steve Sakoman <steve@sakoman.com>
Subject: [kirkstone][PATCH 3/4] glibc-locale: Do not INHIBIT_DEFAULT_DEPS
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 08:17:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173230

From: Nathan Rossi <nathan.rossi@digi.com>

The glibc-locale recipe already partially depends on the base depends in
order to satisfy the do_package dependency on binutils. However since
commit d6ffd683bf6 NM has defaulted to gcc-nm, meaning do_package
depends on gcc (for minidebuginfo).

Whilst the do_package task could handle having the dependencies
explicitly defined (either in glibc-locale or in package.bbclass),
setting these would require some amount of conditional dependency
configuration (cross/crosssdk/etc.). Since both binutils and gcc are
already dependencies of virtual/libc (although compilerlibs is not),
having glibc-locale not inhibit the default depends simplifies the
handling of this situation for both glibc-locale and package.bbclass.

Signed-off-by: Nathan Rossi <nathan.rossi@digi.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 8a40d0a6039e87a5b4b26a0e84dd797fe5c75cba)
---
 meta/recipes-core/glibc/glibc-locale.inc | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core/glibc/glibc-locale.inc
index 7c14abfe99..7f70b3ca4f 100644
--- a/meta/recipes-core/glibc/glibc-locale.inc
+++ b/meta/recipes-core/glibc/glibc-locale.inc
@@ -5,14 +5,9 @@ SUMMARY = "Locale data from glibc"
 BPN = "glibc"
 LOCALEBASEPN = "${MLPREFIX}glibc"
 
-# glibc-collateral.inc inhibits all default deps, but do_package needs objcopy
-# ERROR: objcopy failed with exit code 127 (cmd was 'i586-webos-linux-objcopy' --only-keep-debug 'glibc-locale/2.17-r0/package/usr/lib/gconv/IBM1166.so' 'glibc-locale/2.17-r0/package/usr/lib/gconv/.debug/IBM1166.so')
-# ERROR: Function failed: split_and_strip_files
-BINUTILSDEP = "virtual/${MLPREFIX}${TARGET_PREFIX}binutils:do_populate_sysroot"
-BINUTILSDEP:class-nativesdk = "virtual/${TARGET_PREFIX}binutils-crosssdk:do_populate_sysroot"
-do_package[depends] += "${BINUTILSDEP}"
-
-DEPENDS += "virtual/libc"
+# Do not inhibit default deps, do_package requires binutils/gcc for
+# objcopy/gcc-nm and glibc-locale depends on virtual/libc directly.
+INHIBIT_DEFAULT_DEPS = ""
 
 # Binary locales are generated at build time if ENABLE_BINARY_LOCALE_GENERATION
 # is set. The idea is to avoid running localedef on the target (at first boot)
---
2.38.1

