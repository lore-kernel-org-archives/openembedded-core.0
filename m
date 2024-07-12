Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0774BC3DA45
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 16:03:23 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web10.11476.1720800201801790492
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jul 2024 09:03:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OAYd3Cob;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5c690949977so1112369eaf.1
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 09:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720800200; x=1721405000; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eH/eCSiti6j3SN/dayvJvxY3TEZG94Qfnju8TXLySzw=;
        b=OAYd3CobrF1dgzbk6yswic4Coi8YbWB81fAJ6GzXKbl6ZzXC4a1WYC+ZiintOh2DuQ
         dvxvjT5FbAKb49lo2DdIQDe0W9eSyxIfgxVTKcSCsdBB27JhE/WgSkU9AD48zmI0kt2K
         sb5WzVFFmMbImjohlVGqPxiNcv0XNysigKPIvsHkUhQTv7ZjjH3dlqyORJVvR2V5IPjv
         ZKejHFP1nMa5RX87h52QdAIN511ONccHLbFYWFwGusESR2uAAOmGJdPPBkyxl8ACxnv3
         K6sA1hIjtGfErV57btOLC6o0Z3IW/SuQHK89/VckBzFUPWYx42mW0Vg06mSyiJiBp6zr
         mAsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720800200; x=1721405000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eH/eCSiti6j3SN/dayvJvxY3TEZG94Qfnju8TXLySzw=;
        b=CIl/OCTsJFtPho5d9/q66ldekMi3GqDd9uFE1EY2/mRv3vZP00pGDF475tQHaf+V9Q
         Td4gKpCnuYrE/DALRB40Y+AqOZFaajDFR1cP7TgHXUoc4/PPJDrHhV9rDs9Pg3Gc6yab
         UvJrNgpT6NIzjAuehXRf+SqSC8cQtWt67ZVhUWQAD08FccK7BdRa92NMq402v3YQow5+
         JTw3AieO3JpyqvgDORK6i3Ti6iVQK0DKv3tNKa9SIX45dOdB4+n1Wew8lS2r3DyIqXao
         1GG7NIg/8HR8AWubIeGvFNSAXQ7DvqYFFzTps2fsf88Zw1tM/mFUkDVB2zlpIk9wcZY1
         GVOg==
X-Gm-Message-State: AOJu0YxvtB+Yla5ypQJUNCKGaIipnfFbrsJ+PakZtV20vYMCMDL5JOvW
	5e3RdW6aduxTSHHRxN6S1R1HV8xo0UT4bqySEiJxYfGwhhugDZ7TKck/+A==
X-Google-Smtp-Source: AGHT+IH04zKum3I7gf6HpO02xvZoEMUJg5Zx/uRwcnU1R4SlmYXmuSyRlsw0l0W2ik46NB7/r6tO7Q==
X-Received: by 2002:a05:6870:c1cb:b0:25d:f654:9cd6 with SMTP id 586e51a60fabf-25eaec168d6mr9816084fac.38.1720800200491;
        Fri, 12 Jul 2024 09:03:20 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::4a71])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25eaa29d16dsm2267694fac.53.2024.07.12.09.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 09:03:19 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v6 07/12] classes-recipe: nospdx: Add class
Date: Fri, 12 Jul 2024 09:58:17 -0600
Message-ID: <20240712160304.3514496-8-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240712160304.3514496-1-JPEWhacker@gmail.com>
References: <20240703140059.4096394-1-JPEWhacker@gmail.com>
 <20240712160304.3514496-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 16:03:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201841

Adds a class that allows recipes to opt out of generating SPDX

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes-recipe/nospdx.bbclass           | 13 +++++++++++++
 meta/recipes-core/meta/build-sysroots.bb     |  5 +----
 meta/recipes-core/meta/meta-world-pkgdata.bb |  3 +--
 3 files changed, 15 insertions(+), 6 deletions(-)
 create mode 100644 meta/classes-recipe/nospdx.bbclass

diff --git a/meta/classes-recipe/nospdx.bbclass b/meta/classes-recipe/nospdx.bbclass
new file mode 100644
index 00000000000..b20e28218be
--- /dev/null
+++ b/meta/classes-recipe/nospdx.bbclass
@@ -0,0 +1,13 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+deltask do_collect_spdx_deps
+deltask do_create_spdx
+deltask do_create_spdx_runtime
+deltask do_create_package_spdx
+deltask do_create_rootfs_spdx
+deltask do_create_image_spdx
+deltask do_create_image_sbom
diff --git a/meta/recipes-core/meta/build-sysroots.bb b/meta/recipes-core/meta/build-sysroots.bb
index db05c111ab2..b0b8fb3c79a 100644
--- a/meta/recipes-core/meta/build-sysroots.bb
+++ b/meta/recipes-core/meta/build-sysroots.bb
@@ -7,7 +7,7 @@ STANDALONE_SYSROOT_NATIVE = "${STAGING_DIR}/${BUILD_ARCH}"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 EXCLUDE_FROM_WORLD = "1"
 
-inherit nopackages
+inherit nopackages nospdx
 deltask fetch
 deltask unpack
 deltask patch
@@ -17,9 +17,6 @@ deltask configure
 deltask compile
 deltask install
 deltask populate_sysroot
-deltask create_spdx
-deltask collect_spdx_deps
-deltask create_runtime_spdx
 deltask recipe_qa
 
 do_build_warn () {
diff --git a/meta/recipes-core/meta/meta-world-pkgdata.bb b/meta/recipes-core/meta/meta-world-pkgdata.bb
index 0438bf61387..244175ddd44 100644
--- a/meta/recipes-core/meta/meta-world-pkgdata.bb
+++ b/meta/recipes-core/meta/meta-world-pkgdata.bb
@@ -27,14 +27,13 @@ python do_collect_packagedata() {
     oe.copy_buildsystem.generate_locked_sigs(sigfile, d)
 }
 
+inherit nospdx
 deltask do_fetch
 deltask do_unpack
 deltask do_patch
 deltask do_configure
 deltask do_compile
 deltask do_install
-deltask do_create_spdx
-deltask do_create_spdx_runtime
 
 do_prepare_recipe_sysroot[deptask] = ""
 
-- 
2.45.2


