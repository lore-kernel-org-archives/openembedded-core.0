Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 972A6C2BD09
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 15:23:02 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web11.143623.1719242581646745488
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jun 2024 08:23:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KvBLnhYP;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3d229826727so2643114b6e.1
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 08:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719242580; x=1719847380; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=khHxRJVMbMMvDrTAoWlgenn68nERkfMFAWI+z6DiI0w=;
        b=KvBLnhYP+L3aIPLxr3ZIy2W+2sS+eMjk+ACCmnGpIxPRndtNxzzpSL5TVYq6hfeiIw
         716siPGm0MclCMFv1CJgw/VCi8RspJW4B1uZqX5xAd7Nx2tbMCCizMgMS/CKjgbNFoGm
         rVzOPxhUFpl2BiAhmzO4DE0D+7NjWcF7KKxfgpZNBdYyQ6QUHMCFaZOPgDPUrwAPI8VX
         NMK/FZgbNEXwGlE7mfKfwcNX2EoyRTjPa8MaGM9qAMTUoXUs3SiTnPIRROTqKivl0Kzn
         Wq9SMpwSEc/acpVFPpPgA3yUyn77b5DqbklmczpN7lt3T6sR3Y3a/k7E6f6HCim70fAB
         NJfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719242580; x=1719847380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=khHxRJVMbMMvDrTAoWlgenn68nERkfMFAWI+z6DiI0w=;
        b=YgNk/odbIgWrprNM5qM26HSFeFQ0QoNIst+4iZOtJy7sORtC6RKNnHNruU4Izks+7s
         2gdYTzcmcVvZzT9Mpa6aBCP4jHIxiykt9qAhmvclkZGht+GVaFhJMIStYAPdm8oGB510
         VgjwCpf5oRrYBFlmeVP4U7edY4KTpW18oMTEuwOLgLN0Oq4RLgZIKLktOHD3/D6dn4YS
         B6E5j5QqsNnNX89TMymkJfTzQ/xrK/IsKZy5ANF4ETqzxS/HoI2bfzDwa+OlGaNIxMGH
         3g4Kv/AdORXncCh6nYJMd5D0xAK2WYvFrQMGwgbzgSzjJADzr8PC4hyMc/NoisTr17XQ
         FLbg==
X-Gm-Message-State: AOJu0YxrmVznm1IHAweNGn4DKdPaWA5yCNKrwRMOM3IzruhAJCOKjMGT
	162Sp6xqB3aEk4CzbOFlxlTRGFDZh6irfWYuzuW9tx67yBFe6PcsBsdOeQ==
X-Google-Smtp-Source: AGHT+IGWLAGD91Aqx2PAUrVihIz5fjtpbFS7tlpCcrx7RV/pNA6KRS8+y1sP1Vk5SmOUCb1By+Gasw==
X-Received: by 2002:a05:6871:721:b0:259:8b7d:1544 with SMTP id 586e51a60fabf-25d016c1b49mr5323669fac.15.1719242580325;
        Mon, 24 Jun 2024 08:23:00 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::80e1])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25cd4b80c47sm1890279fac.39.2024.06.24.08.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 08:22:59 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v3 07/10] selftest: spdx: Add SPDX 3.0 test cases
Date: Mon, 24 Jun 2024 09:20:36 -0600
Message-ID: <20240624152236.1019980-8-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240624152236.1019980-1-JPEWhacker@gmail.com>
References: <20240619221805.3038528-1-JPEWhacker@gmail.com>
 <20240624152236.1019980-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 15:23:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201097

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


