Return-Path: <nathan@nathanrossi.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A686BC4332F
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 07:56:30 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.16672.1667462183553149098
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 00:56:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nathanrossi.com header.s=google header.b=ToYfurkR;
 spf=pass (domain: nathanrossi.com, ip: 209.85.215.176, mailfrom: nathan@nathanrossi.com)
Received: by mail-pg1-f176.google.com with SMTP id 78so969095pgb.13
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 00:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nathanrossi.com; s=google;
        h=mime-version:content-transfer-encoding:subject:cc:to:from
         :references:in-reply-to:message-id:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zpd5o1FVJjHYRjv3pSV2PHApDZsncNwYDzW/m69RX1g=;
        b=ToYfurkRCqN4dr5Q4aE/xAviHZgfh3uDJ1fj72Nn+Iw2CWGmgPKxKmKMiSHJqVd5bL
         0BvH075IrGnVZP4WLrf7VG6NbONvzPOiXDyk5vU5dd/a4l71ov74uYjEIcSyPJLTKy70
         vtsZ+AXK/fUcmRDKUgRm9THbq6V70W9faEea4t4EmFPQiYESdLkPVXctF9FNJrj6FXEI
         +JFn7Ly7oF8BAfvkVbbsL+ynKsGwnIuVt7efZD6ihcI7o/bXI/dvh4Msdxk4m/wcCRNP
         FFPtH6oas3UuCAWIPq367n+JB0Gm5zhliX82KC9Gwxacne/Ne/U3XhXSLwPLTRuXTVtG
         6Gdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:content-transfer-encoding:subject:cc:to:from
         :references:in-reply-to:message-id:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zpd5o1FVJjHYRjv3pSV2PHApDZsncNwYDzW/m69RX1g=;
        b=YYfSHSyeRqr6zP3nB8LEk0BoC12XeDK0Vace81jl0/N4o4OeDG/I/tR3era8V9EzuX
         07pDcB9VWoE/1tdqkO6KYcJ35/18ihef4ZdvlkTCmoJSU2FeYKh5sfbZOPjIZd2G5LdM
         IHYEy5OH5LHMHUSFVOe/4eXg0pVy4CXb3tjTu/WuJBrt1GGpZRgnAuCwz+a496TlF59C
         /tbBHpYP+BLLg1jVgSAgTl/+qqmMkVd89M1jyjrKw//ehg1vkDhCdeJjVD/1RkysYvJ6
         J1TLUyyT3gq420CQei91BSLKUvdvN5MzzrWx8pzZTwaTG2mMWqkj40kwG2vGvLHW2yp+
         dvqw==
X-Gm-Message-State: ACrzQf3yn1SfI/+vT8xtVWeierSzTB5F+DU3uOJbVhhqJWdpO3uiJXkc
	l7NZGskkzIqc7htDv/AFZNAzSg==
X-Google-Smtp-Source: AMsMyM7wfejsG2XQlxHUIbt5rA+1Izd23pqHIgM2txetWtLsYAT9+H/Sq7JpEA200sDBTh9GzcEoDA==
X-Received: by 2002:aa7:8687:0:b0:560:3299:a6c0 with SMTP id d7-20020aa78687000000b005603299a6c0mr29259763pfo.81.1667462183035;
        Thu, 03 Nov 2022 00:56:23 -0700 (PDT)
Received: from [127.0.1.1] (117-20-68-146.751444.bne.nbn.aussiebb.net. [117.20.68.146])
        by smtp.gmail.com with UTF8SMTPSA id h3-20020a63f903000000b00458a0649474sm226843pgi.11.2022.11.03.00.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 00:56:21 -0700 (PDT)
Date: Thu, 03 Nov 2022 07:56:06 +0000
Message-Id: <20221103075606.208982-2-nathan@nathanrossi.com>
In-Reply-To: <20221103075606.208982-1-nathan@nathanrossi.com>
References: <20221103075606.208982-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
Cc: 
 Nathan Rossi <nathan@nathanrossi.com>, Nathan Rossi <nathan.rossi@digi.com>
Subject: [PATCH 2/3] glibc-locale: Do not INHIBIT_DEFAULT_DEPS
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 07:56:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172616

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
2.37.2

