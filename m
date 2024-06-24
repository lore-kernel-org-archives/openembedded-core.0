Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C08BC30658
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 19:32:20 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web10.151220.1719257533302010488
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jun 2024 12:32:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eJe9zCzE;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3d24724514eso2821745b6e.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 12:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719257532; x=1719862332; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9BX3JFyWRrOq5y8Kk3XhFgQtn8A2teoTxGHGkYJnwV8=;
        b=eJe9zCzE/FWOieVOyGSxNFSkxajgrBr+0bqoGDS8LjCAKogvvkFAIew/pUpVowonrx
         2V7XNElF7f5IjGHGEhfJj8ABtJ/ZG2APpWEVRhCllRxtkfh2ucoD3PZBcFL3P7GLpdrM
         3Jg83L/ESwlSqu9xbAWtvzXO42aiyUdEyKTwaoPmUn+40GdfOW5QI/JOj82JmJSi9ifJ
         lMuvMk8RlwnDPLEoKGDqYNlfEbZXhHRD0pTFP06EuZeXGN8t6UFoQ5GQnpzOjykxbLqP
         kYQUStlg1OrbCTa182ZuwFMNJ78BK/OjvN0fX9FtgjEXRvbwb3FgNYGYC7yDOGkAJ3QK
         KTmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719257532; x=1719862332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9BX3JFyWRrOq5y8Kk3XhFgQtn8A2teoTxGHGkYJnwV8=;
        b=JXrMhkZUN1WnHVH5hMR3ZJWuPvpLZiQpOQmU4DXNBElCKw1P8uaEQ+sYYoZB+fWIsB
         vXvwtAm4cdT8qj5BBwcvgoRP8FV7c/3BNoA7m02YG0dNTUSQHxYSeAh3uramLjy1FVje
         9LxCytFa00N7k0+FaJdYiXPxfKn+Y9xv9LfcviM+kLVdLOj27eqptTGpW5pY8rUomrM6
         hSzwS+TrhW7Sn6VhNuwJfvqS5xyFQRqSjWGQu0uuu8pZmuXMgqbWgJecBEg8GSpYbx58
         Nk/exRt9zDDJezeuvBfjtu/j/a0oJS4pLkWVJ8FZc/mEj5OeXV8QPQ10W6tv0kSwz3XL
         8/OA==
X-Gm-Message-State: AOJu0Ywo46XOHB82lbmB2PNzQ4EmAtT07QfOnoZ3dz3vBdA/PJ8I68DD
	d2O+KEaISg/HPWL/0fGlgPpycOVMDVjFcaW9ZSNiZe3dYfwBCRkrupbiuA==
X-Google-Smtp-Source: AGHT+IF/bbgPcbewqk+dcH1oJJd5W9wHe6K+UpzIoyEH4XLTxBNZU7OpC3lyD26mqSfgaX5dS3XxoQ==
X-Received: by 2002:a05:6808:1309:b0:3d5:1eba:10b7 with SMTP id 5614622812f47-3d545963c7amr7183910b6e.23.1719257531939;
        Mon, 24 Jun 2024 12:32:11 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::80e1])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d5344fa91csm1586711b6e.19.2024.06.24.12.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 12:32:11 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v4 08/10] classes-recipe: nospdx: Add class
Date: Mon, 24 Jun 2024 13:10:58 -0600
Message-ID: <20240624193151.1645802-9-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240624193151.1645802-1-JPEWhacker@gmail.com>
References: <20240619221805.3038528-1-JPEWhacker@gmail.com>
 <20240624193151.1645802-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 19:32:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201110

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


