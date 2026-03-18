Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F560103E183
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 13:47:10 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14407.1773841621896179765
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 06:47:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eb/DR3iE;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-4042905015cso4354524fac.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 06:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773841621; x=1774446421; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+wYSZS61IRGHmLD9OmiNc9hgO2b0xZj5mQwHOFCwfH8=;
        b=eb/DR3iENbNVwlUcPmJS/sTyr7cAhpFV5h3V5QaSJTyk+cRg6OPtTnZYQ54CTb8rZW
         e2JSVAupujiWHUTHEZ/iofwfTPpUNniwqnioRyhjHJvQrIyBOXBVOPLzF4CGakUErkEL
         yg1jsoLDnJoe9R5wx4saV+19tjpVJEzFZP36fCH2sQn0Be+kRNMf+nJMpcR5Gz2BMBz0
         vsf5zh6OwAI2rPp0IXvFYfp1a+jG2/16q9SszaZpCmhu0z5tX1fOJa9m5TYkYrc1mgDm
         I3k+hGUV/SWPLOOfTKdEl6SAj1YqA6KSauG57pzenEmfRLhg/IjUfeOIxCd/wtfyoUUk
         /LfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773841621; x=1774446421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+wYSZS61IRGHmLD9OmiNc9hgO2b0xZj5mQwHOFCwfH8=;
        b=gm0cYPncreYucVc11Jdzro9nLNPpcNWbyGIqsEG+qxFgRixHComBOgB2Ch8Zt24OeY
         88a9fb2nPvz2OZH0WA01X71al/uWWQmWWCyFT/SGXZMSBlR8bfxtT5k87SUEIBwJOzBX
         u6kytSgLNBLH1mazZmL94dAxspRPi8qOEOjSVOudYm9hYZEfaBjsiSTlkIarVPxAvMMI
         kD7D6sCnKnWaWXw0MfHtjfy1hI+2gXVIxTMb4Pp5//65rjN9pBtTWSD/WyLaXunG0yGH
         as9YYPYcaIdn+IC3fY8tLpd13zBZTPYmmpXzg2ey4dryhr20zs3XV1ccMh0Cpo8Aemx6
         L4lw==
X-Gm-Message-State: AOJu0Yys+OEuUOXqB/EyQIK0e5oRuhy9bh8Ch4Zaer8apyfkp9ZIMjnh
	yeNLT+5OYFJ7KzIdXzDA6C/9D2hFuq3m+bIjX+oyIK0tWvBUpoExPHTyPTEJZw==
X-Gm-Gg: ATEYQzwcu1QRLxD9Hm1eMINSTDvlRWHqflCiNxrj8+pbga8QKAfhArRynCN6XQvRon7
	KITVHeoDQbATan+5YrQpZ3X/WfeGsJwX3Y2fnbNUbrmd/OwItGni4V1wk3bhS7DGE2XaSrOXsCc
	Yi24fF1oZFlHaq7feUyfIbkmz1Sj2jDj6REEUT/hn/li/n/62AftDp9GjH5q2ouXQgL6tSaEWUD
	emOfDRbis3qwuh+grgkUTv39iLJWzlpdrLpJ+gvMFy9fP+shH4406WwBC0HoIfUK0PB815+kzfm
	Ilk4xQpuhN8AGeFboNCCs0A8vquT3VE+jRA5jMUpSvR8rIdCtiKbCUODauLmQSGo+sg9wEDDHM1
	dWEKJ5bnL3modW0WnCkM6JknHe5TrwKYq1Oez/yLPOQmyoYJj4lSi4uPHdCsIo0Glyo76Wv6TRj
	EPP01aEuidElYsIq0A4ORl
X-Received: by 2002:a05:6820:2014:b0:67b:a77a:e678 with SMTP id 006d021491bc7-67c0db1c763mr2499051eaf.54.1773841620991;
        Wed, 18 Mar 2026 06:47:00 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4200:11c0::8279])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67c0d89c739sm1763625eaf.13.2026.03.18.06.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 06:47:00 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v7 03/12] spdx3: Add is-native property
Date: Wed, 18 Mar 2026 07:44:31 -0600
Message-ID: <20260318134655.953233-4-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260318134655.953233-1-JPEWhacker@gmail.com>
References: <20260310184058.533343-1-JPEWhacker@gmail.com>
 <20260318134655.953233-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 13:47:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233393

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


