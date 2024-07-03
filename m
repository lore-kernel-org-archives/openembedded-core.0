Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48FE9C31D97
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 14:01:26 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web10.51061.1720015278954813315
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jul 2024 07:01:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CYrtM/a7;
 spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-7ec0385de1fso198859439f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 07:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720015277; x=1720620077; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7QSvScLtmuKlN/Y+7jXYFqpBBxz107cDy/mulibfnRA=;
        b=CYrtM/a7TAdCqL1qfpaiUqtAgA4+yumnPNrPP7TSSFUdd37iHhuP2iEgoryNJ8oeln
         P6mKLD4+SEDRN6K39n+iEMHF3V44x7W5oRQW5GgWbHDzcA1huWi6wZMq7TtmhipeeO8q
         A10sE7Eo7S1Vn5uLvT0zlAuoxcfCNieidv6Glz3cHmNrTEMMg5NkJm3wsBIJKo4tnqyH
         QswX0nJjYzhhrdGKQGw6tBAkeptpOdDDzogkiKt8+qfYIpyFFC6ZBzXsFSVdiiXsvDNA
         XjuxKnSNaDQLlHMR/cXhG+3/7LqIvxDCbscxTja0I7emlWDCl0BU0/IkaVRVAAeMJMz3
         eyMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720015277; x=1720620077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7QSvScLtmuKlN/Y+7jXYFqpBBxz107cDy/mulibfnRA=;
        b=K6itYJQhkVy/szQO6v6LRtU2UsW9i1kAsCgWgRB0v/NrwEA4m5RieFO5/s9Qswuv6c
         5m2OcDmX2/wHihNz94boOcdyyw6Ea+pIHnyzJaZ8J/j8AVlS++raPvPysZkNBiJx7uP8
         V2ZWtOQSCgwVKLkZ3iWuDh1+RfhT2KQBWvu5tRiGdpvWPXrxp/wfVDyoqGtedLJgHAo4
         hdJL57UWnbLNbR312P0TdxXA9dIEBCFjpQbKO1ws9AZ9L4sPMkG362VeeLLsH1ikMd5q
         qkM/KM4i3KP3ULN5P93740q5U17vK8YXXxgrjlb76ZOIxs+jWPUn178zqpVOxI/MwZwJ
         kp3Q==
X-Gm-Message-State: AOJu0YyL9xHEAbzpIYSKnU0xaFEbNPy9sT4EBGKX9gOgRFdMGYtZgrcr
	CAMGRpQBZ8zrl7CAT/32d0ji8k3KWMVIeYaCChUlQ6aPc6cYTtXPEUJOFw==
X-Google-Smtp-Source: AGHT+IFrjcdyq8ZkZxw4t6wMNt0tx9J/81/URACnEBAmzzkShm5rrUJCl8ZTPmBt9rtcGpg5tVGAaQ==
X-Received: by 2002:a5e:8b48:0:b0:7f3:cb66:1fa4 with SMTP id ca18e2360f4ac-7f62ee7488bmr1313050139f.19.1720015277340;
        Wed, 03 Jul 2024 07:01:17 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::f949])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4bb742f1e77sm3407500173.179.2024.07.03.07.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 07:01:15 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v5 6/8] selftest: spdx: Add SPDX 3.0 test cases
Date: Wed,  3 Jul 2024 07:59:21 -0600
Message-ID: <20240703140059.4096394-7-JPEWhacker@gmail.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201487

Adds test cases for SPDX 3.0. Reworks the SPDX 2.2 test setup so it can
also be run even if the default is SPDX 3.0

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oeqa/selftest/cases/spdx.py | 118 +++++++++++++++++++++++++--
 1 file changed, 109 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftest/cases/spdx.py
index 7685a81e7fb..4a507633cfe 100644
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
@@ -53,3 +65,91 @@ INHERIT += "create-spdx"
 
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
2.45.2


