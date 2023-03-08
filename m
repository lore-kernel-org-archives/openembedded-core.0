Return-Path: <zarkakareem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 637DBC6FD1F
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 10:35:20 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.3802.1678271712841836251
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Mar 2023 02:35:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J9IqBUAt;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: zarkakareem@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id a25so63995046edb.0
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 02:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678271711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zIZdSIsJ7P4KQUBiI3XG17Rt9LQGlyqZvBF7xdXsWaE=;
        b=J9IqBUAtVRE9xuPMJN/eMd0+EoC2s1XVgJzQpRhJ90tTq97GX01mxDhjYc/X/CPjAA
         cxnMB00Dy5FSrK4dr5WDzgPprsZ5p/HhLnOIWOjMmRagKVOl3kYc01ToZBziURDr5BgT
         dXuA1hCVviA/wxJ+tqWHoJp6BfNUJ67CXoV8g7Zbq2EXGI342hIXmQF+hwCRQrRl0WGl
         JoUT4RGMrPfFChYJINavCpg4IVzSgilppcy60gCGl2Er3LLSivquEMo/12QOAWE/djPm
         QQ644U5usknEZdhSj/CgueUZAMab0o5MJ8bMPfErjCIRVSG8IE+yvBukHyHaJ5zeeyRn
         DhRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678271711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zIZdSIsJ7P4KQUBiI3XG17Rt9LQGlyqZvBF7xdXsWaE=;
        b=w4fTlSAQiL2Q6kkOgdKljUlk22WDna6jqEpG46FHwvC5JC8wxFRdEV8L/agUaks7Cv
         X9raoghAu5Hwt8xMo898GUGtUCe0mScbHuX1qwXZG1sHSjJNP1z55Vp99MUFdtfHH6yG
         Z+em2FEpWqslQ5nN+Rr7iUGfJjMAaVAAUE0kNgApyJRB/iX1M6LGI4uStb37Ea+qdjGD
         /vTXVtiLP96wbkeELDm5Fttq6gG4uVeDnRw0gbtA7UBgcHWG907kNp4gKhtYMhn2CEmN
         GfcMq5/+bi6pa5y1u0olZhtH4Wb9QRKTH8i8Ti8HdXuWTNNrSYVhakAyM7rOUakZfQY7
         zNBA==
X-Gm-Message-State: AO0yUKVdneAOUpVZS7W/UoFj9MnqSTtqw1IUe1j+4xt+sAUMneBYRbbf
	KSl8cRz+/OdMH24kTV7dvtCKn2LWS3R+yqjM
X-Google-Smtp-Source: AK7set9f0/PbRnplS2k7jBtDUK19rHFN4IWf+64lMW1+6yoqaugCLFg5JFbvn4Ky+/T1JTttJkyiVQ==
X-Received: by 2002:a17:906:6a0f:b0:889:d998:1576 with SMTP id qw15-20020a1709066a0f00b00889d9981576mr23551435ejc.66.1678271710860;
        Wed, 08 Mar 2023 02:35:10 -0800 (PST)
Received: from kareem-XPS-13-9370.wind3.hub ([151.60.13.132])
        by smtp.gmail.com with ESMTPSA id n24-20020a1709062bd800b008b17aa6afc8sm7301490ejg.30.2023.03.08.02.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 02:35:10 -0800 (PST)
From: Kareem Zarka <zarkakareem@gmail.com>
X-Google-Original-From: Kareem Zarka <kareem.zarka@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: Kareem Zarka <zarkakareem@gmail.com>,
	Stefan Schmidt <stefan.schmidt@huawei.com>,
	Kareem Zarka <kareem.zarka@huawei.com>
Subject: [PATCH] meta/lib/oeqa/selftest/cases/wic: Add tests for configuring kernel image install into boot partition.
Date: Wed,  8 Mar 2023 11:34:48 +0100
Message-Id: <20230308103448.2134894-2-kareem.zarka@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230308103448.2134894-1-kareem.zarka@huawei.com>
References: <20230308103448.2134894-1-kareem.zarka@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 10:35:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178165

- test_skip_kernel_install: This test verifies that the kernel is not
installed in the boot partition when the 'install-kernel-into-boot-dir'
parameter is set to false.
- test_kernel_install: This test verifies that the kernel is installed
in the boot partition when the 'install-kernel-into-boot-dir' parameter
is set to true .
Both tests use a WKS (Kickstart) file to specify the desired
configuration, build a disk image using WIC, and extract the disk image
to a temporary directory to verify the results.

Signed-off-by: Kareem Zarka <kareem.zarka@huawei.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 70 +++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index b9430cdb3b..7f5db1dc73 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -16,6 +16,7 @@ import hashlib
 from glob import glob
 from shutil import rmtree, copy
 from tempfile import NamedTemporaryFile
+from tempfile import TemporaryDirectory
 
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.core.decorator import OETestTag
@@ -146,6 +147,75 @@ class CLITests(OESelftestTestCase):
         self.assertEqual(1, runCmd('wic', ignore_status=True).status)
 
 class Wic(WicTestCase):
+    def test_skip_kernel_install(self):
+        """Test the functionality of not installing the kernel in the boot directory using the wic plugin"""
+        # Build the mtools package to support FAT filesystem handling
+        bitbake("mtools") 
+        # create a temporary file for the WKS content
+        with NamedTemporaryFile("w", suffix=".wks") as wks:
+            wks.write(
+                'part --source bootimg-efi '
+                '--sourceparams="loader=grub-efi,install-kernel-into-boot-dir=false" '
+                '--label boot --active\n'
+            )
+            wks.flush()
+            # create a temporary directory to extract the disk image to
+            with TemporaryDirectory() as tmpdir:
+                img = 'core-image-minimal'
+                # build the image using the WKS file
+                cmd = "wic create %s -e %s -o %s" % (
+                    wks.name, img, self.resultdir)
+                runCmd(cmd)
+                wksname = os.path.splitext(os.path.basename(wks.name))[0]
+                out = glob(os.path.join(
+                    self.resultdir, "%s-*.direct" % wksname))
+                self.assertEqual(1, len(out))
+                # extract the content of the disk image to the temporary directory
+                cmd = "wic cp %s:1 %s" % (out[0], tmpdir)
+                runCmd(cmd)
+                # check if the kernel is installed or not
+                kimgtype = get_bb_var('KERNEL_IMAGETYPE', img)
+                for file in os.listdir(tmpdir):
+                    if file == kimgtype:
+                        raise AssertionError(
+                            "The kernel image '{}' was found in the partition".format(kimgtype)
+                        )
+
+    def test_kernel_install(self):
+        """Test the installation of the kernel to the boot directory in the wic plugin"""
+        # Build the mtools package to support FAT filesystem handling
+        bitbake("mtools") 
+        # create a temporary file for the WKS content
+        with NamedTemporaryFile("w", suffix=".wks") as wks:
+            wks.write(
+                'part --source bootimg-efi '
+                '--sourceparams="loader=grub-efi,install-kernel-into-boot-dir=true" '
+                '--label boot --active\n'
+            )
+            wks.flush()
+            # create a temporary directory to extract the disk image to
+            with TemporaryDirectory() as tmpdir:
+                img = 'core-image-minimal'
+                # build the image using the WKS file
+                cmd = "wic create %s -e %s -o %s" % (wks.name, img, self.resultdir)
+                runCmd(cmd)
+                wksname = os.path.splitext(os.path.basename(wks.name))[0]
+                out = glob(os.path.join(self.resultdir, "%s-*.direct" % wksname))
+                self.assertEqual(1, len(out))
+                # extract the content of the disk image to the temporary directory
+                cmd = "wic cp %s:1 %s" % (out[0], tmpdir)
+                runCmd(cmd)
+                # check if the kernel is installed or not
+                kimgtype = get_bb_var('KERNEL_IMAGETYPE', img)
+                found = False
+                for file in os.listdir(tmpdir):
+                    if file == kimgtype:
+                        found = True
+                        break
+                self.assertTrue(
+                    found, "The kernel image '{}' was not found in the boot partition".format(kimgtype)
+                )
+
     def test_build_image_name(self):
         """Test wic create wictestdisk --image-name=core-image-minimal"""
         cmd = "wic create wictestdisk --image-name=core-image-minimal -o %s" % self.resultdir
-- 
2.25.1


