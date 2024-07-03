Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6718DC41513
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 14:01:26 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web11.51791.1720015282119278457
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jul 2024 07:01:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QWUP5Oi5;
 spf=pass (domain: gmail.com, ip: 209.85.166.54, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-7eeea388a8eso210672339f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 07:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720015281; x=1720620081; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eH/eCSiti6j3SN/dayvJvxY3TEZG94Qfnju8TXLySzw=;
        b=QWUP5Oi5lO167uIJ9ZSa8l/91liE/CrCQpel3hrWXWkMBEZrU/tnhYoBBWaxr9N4sI
         LFhJfH32mOKlE/FHt3nG41DUU+5+UpXGILCHPZVM5BfJ/DbpVsu6AbhMUEFwZWLx4d6r
         MILZpjTjw13ic/eoOA0KUbAQimXTgWDy8+qXu2lEUiOc59W3XfA10zYnLlUWOWjUHizG
         +y0q7iYO4IVH/yqYZ7R2r6jcHxVMcXSAEublDYvYHThN2A+gF/OwC2oSrb0slEf4gSjI
         vvX6g4Lt8dsBuoA4Onn2eZwI19Hr8xLcCJjVimZsXzzNL8mzlBFvloMsp43YDK0h3eWg
         udqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720015281; x=1720620081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eH/eCSiti6j3SN/dayvJvxY3TEZG94Qfnju8TXLySzw=;
        b=G6D01B2/Jh+dfQE/y+bfy0dbZNrw5KGckmRdwf2J1nLpsp/3IHvR1vLcJKjt3yb4O3
         7SUWJ8TE6pJZhbleir8av8UMBi8ZRL9KslosMcG972GjwzAIHKAVr2idA0SmRVth97fI
         Mvw0hulUGAY+iEY4/uORCbFXYD2YfiR0KQnjAmI5xU3Iu+CMF7N7QPU/cLcGT6WPx3rq
         14Yc4loKUAllL3mQ1sfYYb47Xt/VuQblLyg3BDPSQwVjdLbHIYEuTDMC8+eb4D3/NclH
         H2rOs8mhYYUq6aepgXEmZoYJ7EuMJT8VnxTUjKk6xPhxB/dW9Z6tRpj4Sy32/P88qPGe
         O+bA==
X-Gm-Message-State: AOJu0YxZutf2YnYMmGYxUVXbvdNTcBO9w1sLn+BB34Uco9vv6ltXipmQ
	ui6Edx+9FsYm4oS5HUGWJ+isQr/btngrARtxy28hnRxw1ahMeS34GDeIzA==
X-Google-Smtp-Source: AGHT+IEajdFDFnbTetU+oZnLDbMRC4db8l6i7/vNUdRci/kUGKHxBrF54UybyPKHbR9DVa3o76kTbw==
X-Received: by 2002:a6b:4f05:0:b0:7f6:22a0:e8fc with SMTP id ca18e2360f4ac-7f62eeb0eecmr1121129739f.21.1720015279248;
        Wed, 03 Jul 2024 07:01:19 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::f949])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4bb742f1e77sm3407500173.179.2024.07.03.07.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 07:01:17 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v5 7/8] classes-recipe: nospdx: Add class
Date: Wed,  3 Jul 2024 07:59:22 -0600
Message-ID: <20240703140059.4096394-8-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240703140059.4096394-1-JPEWhacker@gmail.com>
References: <20240624193151.1645802-1-JPEWhacker@gmail.com>
 <20240703140059.4096394-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 14:01:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201488

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


