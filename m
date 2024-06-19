Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EF4FC41513
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 22:18:26 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web10.34264.1718835504801029348
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jun 2024 15:18:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bpUdUV/l;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3d51e7557faso65228b6e.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 15:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718835503; x=1719440303; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=khHxRJVMbMMvDrTAoWlgenn68nERkfMFAWI+z6DiI0w=;
        b=bpUdUV/l8GhDulX+wUFl4LWqbKcli84nsnCBPPbfhr/2hTcQk3oc9GxMw44LhMTHPO
         rBzAFnEPctg1HCt/Ke2q7r40kSCcJYqP8srXbZPABsI33gCg06P4xFq5scmyU63+PQVC
         W9iNd/NoWCpCoxCVDg9vLSE3mOOh5E+7LhS5yRajEN3g01d8YvG0oawIWVFAQL07AVaJ
         qwVsBR90rR1gKKshqQV/DpLjV/cKm5lsXYbIQ4S3+RWq9E1KtPPdjiQCk/R7y/1CbJVr
         Z5cXFHwiJGUIj3SSobnPXx53+FSQEeoY69+ytEEZ9r80Mt4tnzb7ojolBIbx3/64TcHH
         Ncwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718835503; x=1719440303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=khHxRJVMbMMvDrTAoWlgenn68nERkfMFAWI+z6DiI0w=;
        b=PbznXeVToZjbhhos76tUvfBPip4O8va3yVZBk7xxjlXErN2RkNvU72ydwaH3QisXTb
         csqLpu5KhCMcxbfTS2Fdn5EsIfLAFHsnzi8NizHdNLqOyA7TUUnazFR2fiuUiZy+gcfa
         CQTwfawhs5z0oiKCiVI6+VMvxvxRZ30uLCYCXjGdysYU03k50cnR98CvM+TngMDLYa6l
         0FlBze1NAfOxLDVvgnqRqqemWI1SQICLQzVU9MyBkTDRUmRNMllWNvJM1cXt7WG4w7fC
         IicvT0Tc4RVQXbz14OP+JBqSQ9H9idbQoV4qohIQPzdEJZjK2za1FbBqj5xyp/upeV/z
         YP1w==
X-Gm-Message-State: AOJu0Yyz2O+5ya+UkSvhE1FMi60bEZ1byStIfoIU8iT8Sag/2Qgsue07
	gUYqDcanIqLAx/rts4J1c1AJqFD8us3u4oXi25ZfUgwOlmLg/1/n5mlkig==
X-Google-Smtp-Source: AGHT+IHHsk1QXCARdLRmqTR59vdcAVnScM+uYnp9xNqX3+DyvCvK6bBNs5tM1QWjjVmDJl0xKXDsKw==
X-Received: by 2002:a05:6808:2f17:b0:3d5:1aa1:de6e with SMTP id 5614622812f47-3d51ba3625emr5210887b6e.28.1718835502853;
        Wed, 19 Jun 2024 15:18:22 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::4189])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d2475e5359sm2321190b6e.3.2024.06.19.15.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 15:18:20 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2 4/7] selftest: spdx: Add SPDX 3.0 test cases
Date: Wed, 19 Jun 2024 16:13:26 -0600
Message-ID: <20240619221805.3038528-5-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240619221805.3038528-1-JPEWhacker@gmail.com>
References: <20240610214456.2757397-1-JPEWhacker@gmail.com>
 <20240619221805.3038528-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 22:18:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200933

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


