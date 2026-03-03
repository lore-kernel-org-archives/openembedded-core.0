Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1BD3EB364A
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 00:46:03 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7690.1772498758917666909
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 16:45:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GxXeN2zh;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-463a94f8475so4161298b6e.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 16:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772498758; x=1773103558; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+wYSZS61IRGHmLD9OmiNc9hgO2b0xZj5mQwHOFCwfH8=;
        b=GxXeN2zhYUanMH4PMpgqfjmznqJ4WXNlbawysJk8jSh90Ra1PkrJTpAl8o6IEhRqB6
         /L3vhESiwHq9NOhqCYPq/3nnouUCnuNu2aZed2QsD4u2xrl15VN4pUkuP+PeQ4mTG1jB
         gxj6ywNqfDC4T/cWnDg+4VdY5WFTTfupZjzw2ZKU4WDtTt42VXWFRgA0WRa/bTxefVRN
         cKxsI7hZqdze9zDSjxpq8sl1wncQnUntXLMcRdidYJIe4JMGctXi2xVYylb3V2pFK437
         qzq7xT0uFhPjpBXZRiZhsMc441zxWoABT45OzK2br/apQtc2CaHWfxuE5c/pTEoJLvb6
         qKxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772498758; x=1773103558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+wYSZS61IRGHmLD9OmiNc9hgO2b0xZj5mQwHOFCwfH8=;
        b=CRdgFoJNwbI2Var6CPqZRwPR/PnmnJAkw1EviRhOltwRscoTQNDUyPafWSVp5ppL9I
         /Si7doEwwDI9fdRVnHq2wN24+DRbP/k6kttQlirrrygjoIoFK1JwHT8NLlNqjCHwz4Zm
         Iq8ldVAgJq8QrDKXZY4zHYb1Xc1uDdWlZmlGZmkO09Wf06ZiubVKkiasK72cbd5apbx5
         aQKpChEggQRFVSKnYCBOF2guSbUywfdfCljk6ZYteRhX822M4TOj8CHNS7rJdwp4C+Lg
         eY97m3Gxysqpyf4uQx1eI9x/TCZ22sgka1bCQHQHxDroTa4DrFlzK0wFBg2Zdlhn+1v2
         EM7A==
X-Gm-Message-State: AOJu0YyRTcZ8kNnpI3MNCPvDgWr8cfey7yCPBKv9pKbsm8e/WO0sr+Mj
	MZo25Y8kXh80WBYntaDxaFDg93kQLcBLmk+oFjQhkmnAcHq7al5TIVdjwZPF2g==
X-Gm-Gg: ATEYQzwhLcsrUFD3x1+smELkLYBlkzeFpzKqdbNWEBH9qnFYbt49RYek5O4GoZ6hOzB
	KERP9Ft/QPqD44QjWUeY9/otypIS60R/PU8aSlCiToLZgL9ikQqFQPmaPkmOH2of27bkloWxYUC
	15+ETdj1JgNS05D1gE5sloVIVAiqqQo1BQisgYegDjPx89XJ9wyohuB7wSkuEq+S/AHuzelqIuT
	QDx+9g3SfPMdUOFGvL7yYnCPcfBMefHJyvtOw5at/keMwifRiW9a8a9mnvEIfqUmECuI1VhFSMO
	k+uSjgxXt+tBMa1R//q/FYXLHQVpwiYRQHPFp0UFe6lj0UAEl6RdiqewHln/eXrxYkbzfBa0Z7J
	5S/AJMmP4vQbVoA77XatPkdctmN+M6MftvRzbO9MMhOpTbZLt/ND1MYzLSUj6aQfz6AxsZnWss6
	VAHkRbDLmHpOqz2S2SaDfv
X-Received: by 2002:a05:6808:1388:b0:45f:7ac:12d9 with SMTP id 5614622812f47-4650c626decmr239628b6e.6.1772498758030;
        Mon, 02 Mar 2026 16:45:58 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4200:11c0::ba6c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-464bb59b66fsm8637446b6e.10.2026.03.02.16.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 16:45:57 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: benjamin.robin@bootlin.com,
	ross.burton@arm.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v4 5/9] spdx3: Add is-native property
Date: Mon,  2 Mar 2026 17:43:52 -0700
Message-ID: <20260303004550.650726-6-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303004550.650726-1-JPEWhacker@gmail.com>
References: <20260226173930.2847872-1-JPEWhacker@gmail.com>
 <20260303004550.650726-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 00:46:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232228

Adds a custom is-native property to the recipe package to indicate if it
is a native recipe

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/sbom30.py       | 20 ++++++++++++++++++++
 meta/lib/oe/spdx30_tasks.py | 18 +++++++++++-------
 2 files changed, 31 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index 227ac51877..50a72fce39 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -118,6 +118,26 @@ class OEDocumentExtension(oe.spdx30.extension_Extension):
         )
 
 
+@oe.spdx30.register(OE_SPDX_BASE + "recipe-extension")
+class OERecipeExtension(oe.spdx30.extension_Extension):
+    """
+    This extension is added to recipe software_Packages to indicate various
+    useful bits of information about the recipe
+    """
+
+    CLOSED = True
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        cls._add_property(
+            "is_native",
+            oe.spdx30.BooleanProp(),
+            OE_SPDX_BASE + "is-native",
+            max_count=1,
+        )
+
+
 def spdxid_hash(*items):
     h = hashlib.md5()
     for i in items:
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index b6c917045e..a8fffbb085 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -477,6 +477,10 @@ def set_purls(spdx_package, purls):
         )
 
 
+def get_is_native(d):
+    return bb.data.inherits_class("native", d) or bb.data.inherits_class("cross", d)
+
+
 def create_recipe_spdx(d):
     deploydir = Path(d.getVar("SPDXRECIPEDEPLOY"))
     deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
@@ -507,6 +511,11 @@ def create_recipe_spdx(d):
         )
     )
 
+    if get_is_native(d):
+        ext = oe.sbom30.OERecipeExtension()
+        ext.is_native = True
+        recipe.extension.append(ext)
+
     set_purls(recipe, (d.getVar("SPDX_PACKAGE_URLS") or "").split())
 
     # TODO: This doesn't work before do_unpack because the license text has to
@@ -668,9 +677,7 @@ def create_spdx(d):
     spdx_workdir = Path(d.getVar("SPDXWORK"))
     include_sources = d.getVar("SPDX_INCLUDE_SOURCES") == "1"
     pkg_arch = d.getVar("SSTATE_PKGARCH")
-    is_native = bb.data.inherits_class("native", d) or bb.data.inherits_class(
-        "cross", d
-    )
+    is_native = get_is_native(d)
 
     recipe, recipe_objset = load_recipe_spdx(d)
 
@@ -1021,14 +1028,11 @@ def create_spdx(d):
 def create_package_spdx(d):
     deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
     deploydir = Path(d.getVar("SPDXRUNTIMEDEPLOY"))
-    is_native = bb.data.inherits_class("native", d) or bb.data.inherits_class(
-        "cross", d
-    )
 
     providers = oe.spdx_common.collect_package_providers(d)
     pkg_arch = d.getVar("SSTATE_PKGARCH")
 
-    if is_native:
+    if get_is_native(d):
         return
 
     bb.build.exec_func("read_subpackage_metadata", d)
-- 
2.53.0


