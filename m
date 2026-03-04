Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B6C1EF9008
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 16:48:46 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23107.1772642922380092326
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 08:48:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fvJJj+/m;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-409de4132b5so1500656fac.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 08:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772642921; x=1773247721; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+wYSZS61IRGHmLD9OmiNc9hgO2b0xZj5mQwHOFCwfH8=;
        b=fvJJj+/mkP6kGilcFZQhFieFeReT+9n1ZzWIgvphrjxpO8L+NqCaE4ExlEWF9hkkQB
         C5ea7pSv8lROn/jyqGZU/vJ7x5vkPaxsbr4z+6sMbHB/MFC8GuYAliJJgFUSgT9TkAHg
         3s1H2tEWCD985JpljKQskgfQh+UKShQu4vSrPctuMtemjw1KpvwASgrLc1At5ArfNf0H
         5YmgEw2MQmQ7iQRlsnUmq/3Svo8JDQv351jPVoWGDUefoDqbomJqKxTBA1fA9sv1Pu3B
         +I073/hL79e+XWmBC+wpUcbRVgPV3FOq9sj7CFcU3XPV9NUe3CS/OItOXygzwa6rFuhC
         5eQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772642921; x=1773247721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+wYSZS61IRGHmLD9OmiNc9hgO2b0xZj5mQwHOFCwfH8=;
        b=VkWBDiFDHLyo+HWbDp9vkbCnLM/hgkx9vZdRIUwTt1QEuD8Ngb0G8Zve1IZon970kS
         hMsM+PvGsSBxMK9ldyF9QcQEUwdlo3FcitrBAwb/GW3LKHPW7W2iokkGUb6AP0aeo4zb
         l5w7olK1hjlhb27dFBGhT4kAOv5NKbdOqdscE5H3NvXQb9hPn2C1AFAPQOL2YXLNfiEr
         pFDjpuMmKUjH8mR5nUF2lhAhG6cIdv+TeaJA8ESGnOuTi6qJp82pMkXm210o5mBmRSSq
         ZyWxNbZ3lTwgWtvMXOIGOZCvfws6lWbrNK44zPryIO80oZGmuTMfKRUEDo8GvFehmbuF
         OWkw==
X-Gm-Message-State: AOJu0YzDgil5HhovrBn1lfmcPU97u6hDng8FdBEbr6GzbENo0x4yNutF
	CVQwwy+SGTWuPK5nMNpSAgDn3FSxXlZQhiFBUA4pKKYnxnLAgTvA+ABuBgB2Fw==
X-Gm-Gg: ATEYQzwfzJOFlMuPTZn4sBCrVtcjBJtQQKkc7qaaVjA+CQ2emaH7K7xWfXpVhAaNqwa
	wgJ4SbuckRT09H2bhPl0K0HUkLPDjSPBb54ClCExUCa1jCp3/rKR6Mj8bxQbVM05Pby8aXYZpUs
	HFfCGz3zrV9u5z+5GlJR4ygicZ+RmxQRXZrmgJ9mZSGL0GOloem7SLHI5pvAE0oRqu9U/z9DO0W
	GpOCXifXp/CN3UeF7BAMowxy9f/uE0KYuZg22IHxUP9auXM+IdJVEoFZc4nh07YyK15vK1Tm8WX
	sDsN1dNE2MjHasXsIr6bQBSBw6kWFGGbfEZ5DPObsVbHBNNGGs+bFzBEqSXnt04TtBnNSj6//qj
	J5MNICZZjQzfPj9M75rrhs0Wk8E9eNSrQkfwSlR60CkYD7mIWGuJzNHZodi4Iznbpze3DIPghOu
	/zeYF57xnsFpSX8nA+tpHY
X-Received: by 2002:a05:6870:4510:b0:40e:dfb7:d1a8 with SMTP id 586e51a60fabf-416abb66fa5mr1551372fac.33.1772642921362;
        Wed, 04 Mar 2026 08:48:41 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4200:11c0::f681])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4160d2c9fc2sm18466442fac.18.2026.03.04.08.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 08:48:40 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v5 05/13] spdx3: Add is-native property
Date: Wed,  4 Mar 2026 09:44:16 -0700
Message-ID: <20260304164835.3072507-6-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304164835.3072507-1-JPEWhacker@gmail.com>
References: <20260303004550.650726-1-JPEWhacker@gmail.com>
 <20260304164835.3072507-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 16:48:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232394

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


