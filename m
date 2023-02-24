Return-Path: <zarkakareem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AC58C61DA4
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 14:37:50 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.18886.1677249463730357483
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Feb 2023 06:37:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N8Oe2HVY;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: zarkakareem@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id p8so14262182wrt.12
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 06:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jPrCN/oClluzzk8D2SFislZF/DT+IETmPHDbiNyI++0=;
        b=N8Oe2HVYHGa7dfSDKfTzL01zIrhg6YYG8qP/jMmXGGNcwkV36YqXYCyhuBZoU9Ks2g
         rvO6GzfJ/4k2WckUhk9d39+AH/7KS/0rodP8O5tUu2Oe81Z8G0Fs7MZUG6LB6ni8F4vs
         uoAXpT4w5OWQgRrbMcCwZ00j6kOtkcHrcCe+3aZJjtWObO/zKz/30PuQNyPtKlt5EQdr
         Zi89gGXiNKaVYOl8KAKjbLOEFql9TIRgrcI5YGDtza4M4RxDDD3rKcX4Ceeoxjpg6S8s
         qSuTcLWEFrMf/7JOjMyh9alcyQOKWBoilKwue+6gwreivLdeGgxgoW/+QuuQwSA6TR/F
         7H7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jPrCN/oClluzzk8D2SFislZF/DT+IETmPHDbiNyI++0=;
        b=P/n7Kh78XIU+dBBXSg315Gm+6EN8t1YlS0Gw85HsJRVIlY4zB19ddP4hhv4QuWf89v
         ZqQpPUlEGa6VElQXtnEg7RnqUOHc8bGHAG8CxHfpB0Of6VEHLNLF430gNe+JrqlJ8jzj
         BmYNMTcO5F9lMj3jP/zYZtwQ24pGGnd361msDldYWAC+blddIgnPTX2gUJ+qNyF96pnO
         BRoNow2sfsOmGx1waGw2fP+rXtlvvMdWEOOGJmpG7xIcVg32kbqiZO3ebEpNEzUtoWCQ
         0vuGNKlMGFUBYKUaPGATll3kbTPwNfenuVkUZNpmuc4feFbPj7axqgcP7sVo76zCoQbT
         oz6Q==
X-Gm-Message-State: AO0yUKW2hokx15fVP7svOvuqeK+9jY4cccF5jgy9NDBbMy4NJAjXUBAC
	Ep9tO8uQWbn4r8g1lFC/QN+BjviNZuNiZkPi
X-Google-Smtp-Source: AK7set9q5jicKqP9Wls0WYkrMk19mmmUt8TvfQ8FHbgUQfTyGRZ2MEvzodHEXPC+juEYnUiWkN0ODA==
X-Received: by 2002:a5d:404d:0:b0:2c5:a07e:55e1 with SMTP id w13-20020a5d404d000000b002c5a07e55e1mr14509770wrp.17.1677249461799;
        Fri, 24 Feb 2023 06:37:41 -0800 (PST)
Received: from kareem-XPS-13-9370.wtcombo.net (93-46-174-218.ip108.fastwebnet.it. [93.46.174.218])
        by smtp.gmail.com with ESMTPSA id i16-20020adfefd0000000b002c552c6c8c2sm10907813wrp.87.2023.02.24.06.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 06:37:41 -0800 (PST)
From: Kareem Zarka <zarkakareem@gmail.com>
X-Google-Original-From: Kareem Zarka <kareem.zarka@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: Kareem Zarka <zarkakareem@gmail.com>,
	Stefan Schmidt <stefan.schmidt@huawei.com>,
	Kareem Zarka <kareem.zarka@huawei.com>
Subject: [PATCH] meta/lib/oeqa/selftest/cases/wic: Add tests for configuring kernel image install into boot partition.
Date: Fri, 24 Feb 2023 15:37:16 +0100
Message-Id: <20230224143717.2669400-2-kareem.zarka@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230224143717.2669400-1-kareem.zarka@huawei.com>
References: <20230224143717.2669400-1-kareem.zarka@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 14:37:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177687

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
 meta/lib/oeqa/selftest/cases/wic.py | 66 +++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index ca1abb970a..b46dccc144 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -16,6 +16,7 @@ import hashlib
 from glob import glob
 from shutil import rmtree, copy
 from tempfile import NamedTemporaryFile
+from tempfile import TemporaryDirectory
 
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.core.decorator import OETestTag
@@ -146,6 +147,71 @@ class CLITests(OESelftestTestCase):
         self.assertEqual(1, runCmd('wic', ignore_status=True).status)
 
 class Wic(WicTestCase):
+    def test_skip_kernel_install(self):
+        """Test the functionality of not installing the kernel in the boot directory using the wic plugin"""
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


