Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8845C41513
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 15:23:12 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web10.143799.1719242583237174835
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jun 2024 08:23:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ksiWnvd6;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2598ae41389so2460516fac.3
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 08:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719242582; x=1719847382; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9BX3JFyWRrOq5y8Kk3XhFgQtn8A2teoTxGHGkYJnwV8=;
        b=ksiWnvd6Kn5KnOw/2vyOT26m1FI0buArbV2S1Aln4hrf8daYB8iSVTGMnLc4lR8kxa
         I+rIZqx9zQLWg+5594k58L+7zUxyfClRnJD6zCsL+Mu6eRYqUa3MQeBoEzIlQRQLwQyX
         jovOgEIEzf8z+l02HA5P1yx7iTKfiPmZ6xZ4QguLs4RXtEnO3VEBRS89kop7A1pRy3fi
         Cy6XmouJ2cITCPGjLI5qkpiBoxQYn6Zb1WrRvI37381Aku3FkwqFIYTrs89vprzpJ4l5
         XT7ChhO7FUO+Uw0AnMsWO+zwMIsuPYTnvJ573K+WYmmsrLovlE+UIJwVoktEkLVxU2Ee
         oDhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719242582; x=1719847382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9BX3JFyWRrOq5y8Kk3XhFgQtn8A2teoTxGHGkYJnwV8=;
        b=NSOFft2dZgdvAc/28GDmij/EdrBZenlw1phFoSSKlRrPT7zma1K7h+PlNZ0XB3pS4S
         5zBahyP2dNZaWdfBHHeftXnehJQk1vv6qHhqOqjFtbpSo6RtOE4Rnk4+d2wLwiYBpNJP
         ZlN0pgDHKhvYjpRHHIr2gbooDCLqTUPRPhf62alMrk0C2YMN8ARk21iFFxATbo08ECHC
         IPX5k3NB47zkT1RZ7U7qOEUt0kU5kS8zP4NvjINsoH3t1tVq9+Tq8hp0frfTzMKHFKwJ
         6dRnVhmt8A9PGaJdo6BqXh/Izd7zypkncBHZwdnmqce+ucmt/VikzrVVVIGfju3LpGG8
         FytA==
X-Gm-Message-State: AOJu0YyaNSUnlYqLhgTdoCt+7DtV6Oj+1CysWD93DbXTrGJtyufxa8Bg
	1LaNSbMZpqaXw7ALmsbUA7qmisuLf3nHSRs8yim1qxsocAJGYIq2D61Dug==
X-Google-Smtp-Source: AGHT+IGluRXOmOvUSyZietVM9QZOucWJuP+0/Wt2RD91Be/0qtquQFSfNV9kLlJEpTrIuY919m6XzA==
X-Received: by 2002:a05:6871:614:b0:254:963e:cc3f with SMTP id 586e51a60fabf-25d06bc8062mr5028690fac.1.1719242581900;
        Mon, 24 Jun 2024 08:23:01 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::80e1])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25cd4b80c47sm1890279fac.39.2024.06.24.08.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 08:23:00 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v3 08/10] classes-recipe: nospdx: Add class
Date: Mon, 24 Jun 2024 09:20:37 -0600
Message-ID: <20240624152236.1019980-9-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240624152236.1019980-1-JPEWhacker@gmail.com>
References: <20240619221805.3038528-1-JPEWhacker@gmail.com>
 <20240624152236.1019980-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 15:23:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201098

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


