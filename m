Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80C6DC41513
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 22:18:36 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web10.34265.1718835506506994667
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jun 2024 15:18:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hPL6EU5c;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3d227b1f4f0so109923b6e.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 15:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718835505; x=1719440305; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9BX3JFyWRrOq5y8Kk3XhFgQtn8A2teoTxGHGkYJnwV8=;
        b=hPL6EU5cxSw+p5Qsvr4kIG3AOqLyWRrh+tO/2jiNXPrCu9Yp6IEpSPrz71fTQaB9gF
         cus7FhwKNEqVsnEZVHV/s6LRHjIrpeoNhciVT67LkhDjybzdeELUoSnAc8IhZeoZXwjc
         +wrP5GtxHrmNq7Wa+rmXObxKbqC4uuouUdvnSD/6CxBuEbEi9HSpKirgje75Axpwmgta
         KAvSRpQR9QVW45OfHLW+OIy/tfkFJFn510YIsX2fjvkaLPjUdpY4cW2neMeDVuOPoYf4
         KN6///rdYd7/H5ybw8RkQEoWAF+bX41HuMJ46+SiFjRAtcTrliZwO1UfiyzTi2JW9HzZ
         OgGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718835505; x=1719440305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9BX3JFyWRrOq5y8Kk3XhFgQtn8A2teoTxGHGkYJnwV8=;
        b=gF8wrt1oqaNhLJYcy0XxQrhnbjowqoBRRJpdMRF0CYTcuH1Vv7ipvz20msadPdXvtw
         7eH5992EE5gCc+UYWhVDhXit/cCGOnxXXOSoPL3pvVPlzdO/xOExqcLs8Od6KBLyHegI
         UwNLM7/3WWAKgfvU5nLXshbTSpn32UE3Nci9zco5z7BC6JoaABPX7Xw5FNwo908S0b8C
         VDccR0QXyufBwcMl2xzi+kMGE+RTEsDD51keKBLl6K0dT5hKnq2CB50P8E25KgC5DbQL
         w3PeKxXkbORX7QbSfPaRkr0yjnISPGqUpiSbkeScqW7QYwYb1Oqr00UuOtKKaEAAkq+W
         wy7g==
X-Gm-Message-State: AOJu0YxJVM517j3q4z09rZBLLAWxkLaEI5CzbQKiIr5F88T5AAwTaL/X
	5NjORSoOoY60GQC9nNXfZ+XnkM/y5+qfMC42IITAnHns5mhiu59j/zECrQ==
X-Google-Smtp-Source: AGHT+IHlG4/J15S6IlMr6Yw5VAmUV7hBINEiAB6kQ62l7RmQSGPtECZ948vjaX2nRK83+d7M8/tyfw==
X-Received: by 2002:a05:6808:1828:b0:3d2:1f88:3e7a with SMTP id 5614622812f47-3d51bad84e5mr3861522b6e.39.1718835505052;
        Wed, 19 Jun 2024 15:18:25 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::4189])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d2475e5359sm2321190b6e.3.2024.06.19.15.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 15:18:23 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2 5/7] classes-recipe: nospdx: Add class
Date: Wed, 19 Jun 2024 16:13:27 -0600
Message-ID: <20240619221805.3038528-6-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240619221805.3038528-1-JPEWhacker@gmail.com>
References: <20240610214456.2757397-1-JPEWhacker@gmail.com>
 <20240619221805.3038528-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 22:18:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200934

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
2.43.2


