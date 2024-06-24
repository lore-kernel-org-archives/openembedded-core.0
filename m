Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A048C3065A
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 19:32:20 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web10.151218.1719257532755967539
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jun 2024 12:32:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Jk7Z24qK;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3d220039bc6so2669017b6e.2
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 12:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719257531; x=1719862331; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=khHxRJVMbMMvDrTAoWlgenn68nERkfMFAWI+z6DiI0w=;
        b=Jk7Z24qK9tqJLmHJ/norRR7rCQSjep3QsNQPimBU4JJS6VqRPPTcCyrnKOXJswe6Wp
         RSBkAju7x/9mxDCOZn+EDHMy0jFT3exq8hB2+aklobqujyqrWyHbLEZZvNwwMH3RfqTC
         kOoJrGDBr7GxZZ8FgZbnQKmEzaDgDfNP8cjdIv5/8UF2PWSZylg7hpJ5AUORfKYG1KCO
         VZ9UCEjYSjZ/vynEyFP2Gs4qkmfGII+sifTEgnx1ZGg/0kqzJM4s8x00Y2575MwUl74N
         y8zLEK60SmtcuPbAj4RxNvJZ5t6Zr2+Y3f1lCtq5nyUG2k8vVDA8zC+IoTZoXd+WnIuF
         NPHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719257531; x=1719862331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=khHxRJVMbMMvDrTAoWlgenn68nERkfMFAWI+z6DiI0w=;
        b=Trp6Xjxmg0cBSGJpIq0WaevrworeGbcbzduN19j+RZq2d2RSAI5TvWW8NxaS36zrFQ
         DFdY6ojimPi4mA8lRSSB4rGTMSc3N5dlKax2OAeWvaDjLTjpxguvekxPmmOQMbjO67Vn
         esIfVFcx3Db9gLxZjwfRoskM+pO3n1LHZB7NPcagziBJhpNic6dxJNuhQRM1OmiR3FYa
         /ZXmMx9oLO0Dk5wha6TVPHL3SGq2NBBfdQQPVGmaDXHGPuf7c7QxXAFjZhqQn2r2suoI
         ocaGCzI07lvyUvo3EpkFrSqqIo3VK4h+ov8/AePFeMC3A62EoMU4ra7EMTr+hmcWu7dq
         zP8w==
X-Gm-Message-State: AOJu0Yyp3VwNsSFCnZhCUbK4yBI0vK9iBZN71Kj8eL2gUN03pEDR73W1
	af9HDqwOadSiVQxPMWk9axr6FKiXTbhr2J8+th667PDFbAs0kBxJ5tyCww==
X-Google-Smtp-Source: AGHT+IFnoauGX1tn1s2cKXHRa7+20ffNEQ/Dx4HDt6mzP6kJZ9KAFe/JC7AwoMP8FXBD9abji1RPTg==
X-Received: by 2002:a05:6808:188c:b0:3d2:ebf:c0da with SMTP id 5614622812f47-3d543afbb0cmr6934937b6e.31.1719257530783;
        Mon, 24 Jun 2024 12:32:10 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::80e1])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d5344fa91csm1586711b6e.19.2024.06.24.12.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 12:32:10 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v4 07/10] selftest: spdx: Add SPDX 3.0 test cases
Date: Mon, 24 Jun 2024 13:10:57 -0600
Message-ID: <20240624193151.1645802-8-JPEWhacker@gmail.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201109

Adds test cases for SPDX 3.0. Reworks the SPDX 2.2 test setup so it can
also be run even if the default is SPDX 3.0

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oeqa/selftest/cases/spdx.py | 119 +++++++++++++++++++++++++--
 1 file changed, 110 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftest/cases/spdx.py
index 7685a81e7fb..0ae49aec333 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -6,21 +6,26 @@
 
 import json
 import os
+import textwrap
+from pathlib import Path
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import bitbake, get_bb_var, runCmd
+from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars, runCmd
 
-class SPDXCheck(OESelftestTestCase):
 
+class SPDX22Check(OESelftestTestCase):
     @classmethod
     def setUpClass(cls):
-        super(SPDXCheck, cls).setUpClass()
+        super().setUpClass()
         bitbake("python3-spdx-tools-native")
         bitbake("-c addto_recipe_sysroot python3-spdx-tools-native")
 
     def check_recipe_spdx(self, high_level_dir, spdx_file, target_name):
-        config = """
-INHERIT += "create-spdx"
-"""
+        config = textwrap.dedent(
+            """\
+            INHERIT:remove = "create-spdx"
+            INHERIT += "create-spdx-2.2"
+            """
+        )
         self.write_config(config)
 
         deploy_dir = get_bb_var("DEPLOY_DIR")
@@ -29,7 +34,9 @@ INHERIT += "create-spdx"
         # qemux86-64 creates the directory qemux86_64
         machine_dir = machine_var.replace("-", "_")
 
-        full_file_path = os.path.join(deploy_dir, "spdx", spdx_version, machine_dir, high_level_dir, spdx_file)
+        full_file_path = os.path.join(
+            deploy_dir, "spdx", spdx_version, machine_dir, high_level_dir, spdx_file
+        )
 
         try:
             os.remove(full_file_path)
@@ -44,8 +51,13 @@ INHERIT += "create-spdx"
                 self.assertNotEqual(report, None)
                 self.assertNotEqual(report["SPDXID"], None)
 
-            python = os.path.join(get_bb_var('STAGING_BINDIR', 'python3-spdx-tools-native'), 'nativepython3')
-            validator = os.path.join(get_bb_var('STAGING_BINDIR', 'python3-spdx-tools-native'), 'pyspdxtools')
+            python = os.path.join(
+                get_bb_var("STAGING_BINDIR", "python3-spdx-tools-native"),
+                "nativepython3",
+            )
+            validator = os.path.join(
+                get_bb_var("STAGING_BINDIR", "python3-spdx-tools-native"), "pyspdxtools"
+            )
             result = runCmd("{} {} -i {}".format(python, validator, filename))
 
         self.assertExists(full_file_path)
@@ -53,3 +65,92 @@ INHERIT += "create-spdx"
 
     def test_spdx_base_files(self):
         self.check_recipe_spdx("packages", "base-files.spdx.json", "base-files")
+
+
+class SPDX3CheckBase(object):
+    """
+    Base class for checking SPDX 3 based tests
+    """
+
+    def check_spdx_file(self, filename):
+        import oe.spdx30
+
+        self.assertExists(filename)
+
+        # Read the file
+        objset = oe.spdx30.SHACLObjectSet()
+        with open(filename, "r") as f:
+            d = oe.spdx30.JSONLDDeserializer()
+            d.read(f, objset)
+
+        return objset
+
+    def check_recipe_spdx(self, target_name, spdx_path, *, task=None):
+        config = textwrap.dedent(
+            f"""\
+            INHERIT:remove = "create-spdx"
+            INHERIT += "{self.SPDX_CLASS}"
+            """
+        )
+        self.write_config(config)
+
+        if task:
+            bitbake(f"-c {task} {target_name}")
+        else:
+            bitbake(target_name)
+
+        filename = spdx_path.format(
+            **get_bb_vars(
+                [
+                    "DEPLOY_DIR_IMAGE",
+                    "DEPLOY_DIR_SPDX",
+                    "MACHINE",
+                    "MACHINE_ARCH",
+                    "SDKMACHINE",
+                    "SDK_DEPLOY",
+                    "SPDX_VERSION",
+                    "TOOLCHAIN_OUTPUTNAME",
+                ],
+                target_name,
+            )
+        )
+
+        return self.check_spdx_file(filename)
+
+    def check_objset_missing_ids(self, objset):
+        if objset.missing_ids:
+            self.assertTrue(
+                False,
+                "The following SPDXIDs are unresolved:\n  "
+                + "\n  ".join(objset.missing_ids),
+            )
+
+
+class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
+    SPDX_CLASS = "create-spdx-3.0"
+    SCHEMA_URL = "https://spdx.org/schema/3.0.0/spdx-json-schema.json"
+
+    def test_base_files(self):
+        self.check_recipe_spdx(
+            "base-files",
+            "{DEPLOY_DIR_SPDX}/{MACHINE_ARCH}/packages/base-files.spdx.json",
+        )
+
+    def test_core_image_minimal(self):
+        objset = self.check_recipe_spdx(
+            "core-image-minimal",
+            "{DEPLOY_DIR_IMAGE}/core-image-minimal-{MACHINE}.rootfs.spdx.json",
+        )
+
+        # Document should be fully linked
+        self.check_objset_missing_ids(objset)
+
+    def test_core_image_minimal_sdk(self):
+        objset = self.check_recipe_spdx(
+            "core-image-minimal",
+            "{SDK_DEPLOY}/{TOOLCHAIN_OUTPUTNAME}.spdx.json",
+            task="populate_sdk",
+        )
+
+        # Document should be fully linked
+        self.check_objset_missing_ids(objset)
-- 
2.43.2


