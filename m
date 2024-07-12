Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F040CC41513
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 16:03:22 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web10.11475.1720800200216514242
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jul 2024 09:03:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WIGaaGD6;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-25e0c0df558so982286fac.0
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 09:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720800199; x=1721404999; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eYjnaAH+9QgnRkIiZyxDssup1XuZFHF3jTuz5G3k7Kw=;
        b=WIGaaGD6+SgBbztfipGjni1YD1TReOANLGcszeFUjcqpj54KHhamPpChqSHWzfip0b
         AxyJAKbgBgdmkZvBeoIIoydc++g5NJDWyyzlcf/TdG22XzM8zUanpqedF/aaJaLZeCZB
         0pd4ZPC7vQ2jq3ctFTD19bRjKk/Czz/ZxGkZTI763rr1uckKfDu1akeA5owq89oW6QH2
         MXZnkwNmpNpBYMYbN2znsSztcrPkA3Rc0iPAe1xVL1WgZdtYZi7acFlr+bY6OPnP2cTi
         4Rhfh3BT6v3LMuUXIMyhxENptzM9g6mHoywjYY+T5ZzDz1hqyjXJAw/z/bEuzpwWfm/E
         6DwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720800199; x=1721404999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eYjnaAH+9QgnRkIiZyxDssup1XuZFHF3jTuz5G3k7Kw=;
        b=RTyBA2toGf4sMMjJ9x+mZAqwSIEshvIrlY/IuFhEGmzXRdfeJn1gF/QkcDAbsGseKA
         2ur+nYu9fU+U7Td7tpMWjmr9gnIhal9AJuXUaFeW52/pzzgaoS5Ofhlc77gex3S9BYHc
         O3qBZpZsq1exHvQE9Dya2ZfSIYW4xTd5MQrPnmlryFeh2fsUjA1x7SnsjlQEl35jY5dW
         c19c46NsTHbeQufmGnmDxLj5HtD3EtSFy6cLhYKRTcv1TAMvkecG2u17bjRPvl9P3RY4
         XZ5IoLV87vFxlnf6WAphtDaOdVO5Rh/A9ghF3+xlR6Vz55xdC+/oXMrwaITgev7b+fQG
         fv/Q==
X-Gm-Message-State: AOJu0YyLEu8/BSPnr5pA59Sbbd7cAiK7NYyc3wErtpDqC//HHw8oKp8D
	eqy7E5mYIl6fzYTxdcWh9VI507jqqxOyffOvxwFuNf5EdXBq7l6dGq/sow==
X-Google-Smtp-Source: AGHT+IE3L77oaLBtBmae1iLmuKlaPj8Rzlk0NijMXVbLodMbyFkoPXud0tst+G+NELCC+a9vemOjdg==
X-Received: by 2002:a05:6871:5c9:b0:25e:128e:609f with SMTP id 586e51a60fabf-25eae822e35mr10019308fac.28.1720800198658;
        Fri, 12 Jul 2024 09:03:18 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::4a71])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25eaa29d16dsm2267694fac.53.2024.07.12.09.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 09:03:17 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v6 06/12] selftest: spdx: Add SPDX 3.0 test cases
Date: Fri, 12 Jul 2024 09:58:16 -0600
Message-ID: <20240712160304.3514496-7-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240712160304.3514496-1-JPEWhacker@gmail.com>
References: <20240703140059.4096394-1-JPEWhacker@gmail.com>
 <20240712160304.3514496-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 16:03:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201840

Adds test cases for SPDX 3.0. Reworks the SPDX 2.2 test setup so it can
also be run even if the default is SPDX 3.0

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oeqa/selftest/cases/spdx.py | 133 +++++++++++++++++++++++++--
 1 file changed, 124 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftest/cases/spdx.py
index 7685a81e7fb..be595babb35 100644
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
@@ -53,3 +65,106 @@ INHERIT += "create-spdx"
 
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
+    def check_recipe_spdx(self, target_name, spdx_path, *, task=None, extraconf=""):
+        config = textwrap.dedent(
+            f"""\
+            INHERIT:remove = "create-spdx"
+            INHERIT += "{self.SPDX_CLASS}"
+            {extraconf}
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
+
+    def test_baremetal_helloworld(self):
+        objset = self.check_recipe_spdx(
+            "baremetal-helloworld",
+            "{DEPLOY_DIR_IMAGE}/baremetal-helloworld-image-{MACHINE}.spdx.json",
+            extraconf=textwrap.dedent(
+                """\
+                TCLIBC = "baremetal"
+                """
+            ),
+        )
+
+        # Document should be fully linked
+        self.check_objset_missing_ids(objset)
-- 
2.45.2


