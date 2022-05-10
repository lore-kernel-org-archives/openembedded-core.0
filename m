Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DF38C4332F
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 14:38:05 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.10768.1652193481140300481
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:38:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=LdVGuJnr;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id a11so15112449pff.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5HWxEdxc3KGcoGEaCkUJ1LVFNIvPcZ2xhsc6ykEn384=;
        b=LdVGuJnrOGnhQ44/t3MYiHY/NXkhMF9ucvigpu3N0/430T84jBU4BJMD+wIqtaatdr
         W7nVCEtZ396rtvIZZKsY6OeKOpb8TDbmbTefOYJj73RUR2yyCjas338XpMK4B/Mm7J77
         2mqZqQQkW5MfdfiY7SEjMfhcgdJgWWI0gVqa4mLmKcD6D2D4SCicN3yFC44G7CYkf+CH
         pme+mhClf/jkbCfv82PIASmkJDh/Uxw2hLp8l1VqELlKSkXe619E34HtMziIoMJ15J3q
         VXvFOzKGDBzRgWY33J4P6ZxRO9KiP7TQzXxhKfRSZzCGX1uIe+s+WWYgHBLpeSZ8IkUq
         e+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5HWxEdxc3KGcoGEaCkUJ1LVFNIvPcZ2xhsc6ykEn384=;
        b=qTQx8QLR6IvPFPYEZmOyoxLNJv6y/n6Ptug4aaf+faAR5luNhO7TTNnBr2bf2J/J/f
         WBessL9LOGGdGTcMVgwnt9s/QA++ytw3t0TY5yfZRI40SuPAV1JptXMr8aG1+90kCJVq
         i1ufcWl5UQWa66HnymTQMLAEHlUPibghrIpj/yH2PgYHT76dgfylo1PGw32HzDjh0mT0
         WpI7QR3ZgKOopvxirgzvaacvymRXSBWAFCgCpRpd+raQdQ16UmCB51Xj37B5OIekhjJO
         iLhovhxTj/3iVkL1G0jB3g8A3NZZ5rRI8BrwzGQb5+bhyUmXeqU6zHxvnLCiZSGdVxlQ
         QZ2g==
X-Gm-Message-State: AOAM531bKZ1Fhogeb6q161YVZwcmCHqTxC48FsGSH2Siv1Ki0OgcFBQC
	OM+lYOg9XnKE94arNRF2NneBocEZ5m9oXh3+
X-Google-Smtp-Source: 
 ABdhPJzvt5QmIMyDjMANfSbJaCZv/TQasNYAuANVEoFCSkZiDG9twz/Vy0NTB0Ok88/UyXfzIPEA+w==
X-Received: by 2002:a05:6a00:ad0:b0:4f7:a357:6899 with SMTP id
 c16-20020a056a000ad000b004f7a3576899mr20645205pfl.80.1652193479996;
        Tue, 10 May 2022 07:37:59 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 fv18-20020a17090b0e9200b001cd4989feb7sm1973161pjb.3.2022.05.10.07.37.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 07:37:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/40] powerpc: Remove invalid GLIBC_EXTRA_OECONF
Date: Tue, 10 May 2022 04:36:47 -1000
Message-Id: 
 <76ccd9914c47aebf2c4c211abc089d9b8acc6c66.1652192957.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652192957.git.steve@sakoman.com>
References: <cover.1652192957.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 14:38:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165425

From: Robert Joslyn <robert.joslyn@redrectangle.org>

OE-core previously carried patches to glibc that added optimized sqrt
implementations for various PowerPC chips. These were recently removed,
which now results in errors when compiling glibc with certian PowerPC
machine tunes:

	checking sysdep dirs... configure: error: The 603e subspecies of powerpc is not supported.

Remove setting GLIBC_EXTRA_OECONF with parameters that are no longer
valid. Also remove a commented out setting of the variable that probably
isn't vaild anyway.

Fixes: 2511e937f445 ("glibc: Drop ppc sqrt optimisations")

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 40f15066c24720aae36713c9856ffb4fae146a45)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/machine/include/powerpc/tune-ppc603e.inc   | 3 ---
 meta/conf/machine/include/powerpc/tune-ppc7400.inc   | 3 ---
 meta/conf/machine/include/powerpc/tune-ppce300c3.inc | 3 ---
 meta/conf/machine/include/powerpc/tune-ppce500mc.inc | 3 ---
 meta/conf/machine/include/powerpc/tune-ppce5500.inc  | 3 ---
 meta/conf/machine/include/powerpc/tune-ppce6500.inc  | 4 ----
 6 files changed, 19 deletions(-)

diff --git a/meta/conf/machine/include/powerpc/tune-ppc603e.inc b/meta/conf/machine/include/powerpc/tune-ppc603e.inc
index 8beec00f24..28680bdb3c 100644
--- a/meta/conf/machine/include/powerpc/tune-ppc603e.inc
+++ b/meta/conf/machine/include/powerpc/tune-ppc603e.inc
@@ -9,6 +9,3 @@ AVAILTUNES += "ppc603e"
 TUNE_FEATURES:tune-ppc603e = "m32 fpu-hard ppc603e bigendian"
 TUNE_PKGARCH:tune-ppc603e = "ppc603e"
 PACKAGE_EXTRA_ARCHS:tune-ppc603e = "${PACKAGE_EXTRA_ARCHS:tune-powerpc} ppc603e"
-
-# glibc configure options to get 603e specific library (for sqrt)
-GLIBC_EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'ppc603e', '-with-cpu=603e', '', d)}"
diff --git a/meta/conf/machine/include/powerpc/tune-ppc7400.inc b/meta/conf/machine/include/powerpc/tune-ppc7400.inc
index 1e2c9fc2ce..49b94f5ee1 100644
--- a/meta/conf/machine/include/powerpc/tune-ppc7400.inc
+++ b/meta/conf/machine/include/powerpc/tune-ppc7400.inc
@@ -9,6 +9,3 @@ AVAILTUNES += "ppc7400"
 TUNE_FEATURES:tune-ppc7400 = "m32 fpu-hard ppc7400 altivec bigendian"
 TUNE_PKGARCH:tune-ppc7400 = "ppc7400"
 PACKAGE_EXTRA_ARCHS:tune-ppc7400 = "${PACKAGE_EXTRA_ARCHS:tune-powerpc} ppc7400"
-
-# glibc configure options to get 7400 specific library (for sqrt)
-#GLIBC_EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'ppc7400', '--with-cpu=power4', '', d)}"
diff --git a/meta/conf/machine/include/powerpc/tune-ppce300c3.inc b/meta/conf/machine/include/powerpc/tune-ppce300c3.inc
index b74b6ad976..31aff51af3 100644
--- a/meta/conf/machine/include/powerpc/tune-ppce300c3.inc
+++ b/meta/conf/machine/include/powerpc/tune-ppce300c3.inc
@@ -11,9 +11,6 @@ TUNE_PKGARCH:tune-ppce300c3 = "ppce300c3"
 PACKAGE_EXTRA_ARCHS:tune-ppce300c3 = "${PACKAGE_EXTRA_ARCHS:tune-powerpc} ppce300c3"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'ppce300c3', ' -mcpu=e300c3', '', d)}"
 
-# glibc config options to make use of e300c3 (603e) specific sqrt/sqrtf routines
-GLIBC_EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'ppce300c3', '--with-cpu=e300c3', '', d)}"
-
 # soft-float
 TUNEVALID[ppce300c3-nf] = "Enable ppce300c3 specific processor optimizations (no fpu)"
 TUNE_FEATURES:tune-ppce300c3-nf = "${TUNE_FEATURES:tune-powerpc-nf} ppce300c3-nf"
diff --git a/meta/conf/machine/include/powerpc/tune-ppce500mc.inc b/meta/conf/machine/include/powerpc/tune-ppce500mc.inc
index e3524a10ca..036f8b2631 100644
--- a/meta/conf/machine/include/powerpc/tune-ppce500mc.inc
+++ b/meta/conf/machine/include/powerpc/tune-ppce500mc.inc
@@ -10,8 +10,5 @@ TUNE_FEATURES:tune-ppce500mc = "m32 fpu-hard ppce500mc bigendian"
 TUNE_PKGARCH:tune-ppce500mc = "ppce500mc"
 PACKAGE_EXTRA_ARCHS:tune-ppce500mc = "${PACKAGE_EXTRA_ARCHS:tune-powerpc} ppce500mc"
 
-# glibc configure options to get e500mc specific library (for sqrt)
-GLIBC_EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'ppce500mc', '-with-cpu=e500mc', '', d)}"
-
 # pass -mcpu=e500mc for ppce500mc kernel cross compile
 TARGET_CC_KERNEL_ARCH = "-mcpu=e500mc"
diff --git a/meta/conf/machine/include/powerpc/tune-ppce5500.inc b/meta/conf/machine/include/powerpc/tune-ppce5500.inc
index 2cf7b1737c..4915b81ee4 100644
--- a/meta/conf/machine/include/powerpc/tune-ppce5500.inc
+++ b/meta/conf/machine/include/powerpc/tune-ppce5500.inc
@@ -16,8 +16,5 @@ BASE_LIB:tune-ppc64e5500 = "lib64"
 TUNE_PKGARCH:tune-ppc64e5500 = "ppc64e5500"
 PACKAGE_EXTRA_ARCHS:tune-ppc64e5500 = "${PACKAGE_EXTRA_ARCHS:tune-powerpc64} ppc64e5500"
 
-# glibc configure options to get e5500 specific library (for sqrt)
-GLIBC_EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'e5500', '--with-cpu=e5500', '', d)}"
-
 # QEMU usermode fails with invalid instruction error (YOCTO: #10304)
 MACHINE_FEATURES_BACKFILL_CONSIDERED:append = "${@bb.utils.contains('TUNE_FEATURES', 'e5500', ' qemu-usermode', '', d)}"
diff --git a/meta/conf/machine/include/powerpc/tune-ppce6500.inc b/meta/conf/machine/include/powerpc/tune-ppce6500.inc
index e78de350ad..f6310ab4c4 100644
--- a/meta/conf/machine/include/powerpc/tune-ppce6500.inc
+++ b/meta/conf/machine/include/powerpc/tune-ppce6500.inc
@@ -16,9 +16,5 @@ BASE_LIB:tune-ppc64e6500 = "lib64"
 TUNE_PKGARCH:tune-ppc64e6500 = "ppc64e6500"
 PACKAGE_EXTRA_ARCHS:tune-ppc64e6500 = "${PACKAGE_EXTRA_ARCHS:tune-powerpc64} ppc64e6500"
 
-# glibc configure options to get e6500 specific library
-GLIBC_EXTRA_OECONF:powerpc64 += "${@bb.utils.contains('TUNE_FEATURES', 'e6500', '--with-cpu=e6500', '', d)}"
-GLIBC_EXTRA_OECONF:powerpc += "${@bb.utils.contains('TUNE_FEATURES', 'e6500', '--with-cpu=e6500', '', d)}"
-
 # QEMU usermode fails with invalid instruction error (YOCTO: #10304)
 MACHINE_FEATURES_BACKFILL_CONSIDERED:append = "${@bb.utils.contains('TUNE_FEATURES', 'e6500', ' qemu-usermode', '', d)}"
-- 
2.25.1


