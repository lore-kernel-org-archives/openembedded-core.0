Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0D2BC5AC7C
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 15:41:48 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.321.1771602103010341097
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 07:41:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JGh8IdYZ;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6799774d0fcso1238273eaf.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 07:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771602102; x=1772206902; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B26QEFGZ1BfU8osvAqsZdiqlbAEmeNAht5QsWjTxO+M=;
        b=JGh8IdYZV8mLUblrcQV0t0bJoJfGOYOptStL+kzh/RNi1cvAlbyXOyAcGnPZBRlfkE
         Ks42DDIenAi+/BHNilt7lZOy04GFyzMGDYe0ngZFnJY3u9eXDpQLblT9IAjPgX99S/Xk
         4C+us7AvN/HlmIvDHVM8ynwCGLdMprMUz/SiWzoLZraqOl62PkPmCeCa3D2m51OQYRUp
         FH4ceMzOboFDrVYUp4Gv0oAWxE8xP2tGEt+vVTejJ3/WxKvg4QrBK44zUUAfHefAW0NA
         1zj4fYMpq4J3YGTzYF8bI06n5ibgYsDTtv2Ua4tjivxOgeYUc4rfxCjeKBx/JDJPhaut
         95xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771602102; x=1772206902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B26QEFGZ1BfU8osvAqsZdiqlbAEmeNAht5QsWjTxO+M=;
        b=CDxdsvZRaJrUQpZevMd2yerP9PgoNrt7GLcAE2xjDzUH1GrejZ+SjmnvKKsZyKNXVB
         qgX/vvRCwrh5hQRNtpXvHZ7tgma4QKgVTNy000awkDdSdum7z5eBX8ESFufvW+zBzlr+
         LlnBR8TJFP2GuWrCdnaZ5dCzdQt5NDJZTyaA9wLFMFLq4vBoSIwL7w4LNMYJLzK2LMsy
         dZbED/IZdNLd624xfUBvz5sOLeiEA8r3jKO5bEQcADvzZbw2/a9N89RuML2hxVkBXzAL
         IpJAqwRLOj8xBece6qCzBgvNWGRyvJiphd2XnCeZPvbvTkm1BtNP+pjywc6fPmpvO5nk
         JZrA==
X-Gm-Message-State: AOJu0YxeLNntquvpPS7EQYwMYMHbfi2PHb8axLB2EAm9+T6Zri2kGXwh
	2UdZjr+blzdyshfjdIChsArIz1nvfirZejnNPSYsVRD0X8EOpZltQm4+DhJDFw==
X-Gm-Gg: AZuq6aIrXd/ZNgv8KzqfrYyiWoCWbpPSS6GM6DwxTcCQ/CSBj51P+eNCpuhhUf8zjOr
	rTAzwQPgnDfoWCYkSqBLc/0KBv8AOtDNu5NgGCaCPs3AElU55UrO2M535+JsRL+ovcnAKLQ6puu
	6gGpAprqkqS5gJJfVlZxEBoqKDp+W5D2vUdco2T/uQkasv3Ai7m0xUPpwti06Zq546AJbRy5fmI
	bFQR1GNR3kYH7IL8XXMl96xa0B3pwGhXgLYtE/eTGi/H9wHtRkIj4LqJmXwzgTD16BvdBvhyqJh
	KvS4CVqbrnW/O8AFLhywoyfkrQzW95bDxvCJSSN+qGDzGDFuHOdQbMamwqLLR7JuIomPGcINGwI
	l9Y8yAgAtl8bcfOhbp1bZZohJP17u2oGAjWjokD87OkhgctqyTRx4Tx0UR+kXGikRuB5Hc0nQ56
	4R+TrQJBXoATbqOXgsAYMw
X-Received: by 2002:a05:6820:16a3:b0:679:94ff:6ea7 with SMTP id 006d021491bc7-679c4251e3dmr178380eaf.15.1771602102096;
        Fri, 20 Feb 2026 07:41:42 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4200:11c0::6492])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6772583294bsm15127188eaf.14.2026.02.20.07.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 07:41:41 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: benjamin.robin@bootlin.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 5/9] spdx3: Add is-native property
Date: Fri, 20 Feb 2026 08:40:40 -0700
Message-ID: <20260220154123.376880-6-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260220154123.376880-1-JPEWhacker@gmail.com>
References: <20260220154123.376880-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 15:41:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231524

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
index 9a312a870d..fff1ca6bea 100644
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


