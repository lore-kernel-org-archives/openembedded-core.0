Return-Path: <zarkakareem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEF21C64ED6
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 06:56:06 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.17704.1677567361498187761
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Feb 2023 22:56:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LdBc7EL9;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: zarkakareem@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id i34so35694695eda.7
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 22:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H3A1q24O38F1YiG+2zuFt587GtjU5FDrobl34RDPaYc=;
        b=LdBc7EL9M6sQ014KiqjKhLPzi41V5DDZoRA2T5cxPMIRFRUQg8KOXYx2ubY8sd4y6C
         YE6+xM1esg3CkiUhQNsa1BlVTmzfm+VUjDuCPos4wDxDHAv2uU5Cnqai2Aj5yhq5SX1/
         jD9ArJIIQmycTD42jITo7a4Bhx9wfyimm/7XWvdhwC5EYYLIYfwCBSlmYQ4rUFPo8Qec
         8tXJ3BowBpQxfUzQRHyQ4wtAsZ4vkwmSzbRDS4OTlQQNWJS0aKhjOYZX/KKTJaKSfzi5
         Ic4er9nPqyAbwVfXG3FvBPy+sNXC59xFnRqfkKj/zFhYvdXjj5PR1PyJ9DiMJR8BQSjF
         27Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H3A1q24O38F1YiG+2zuFt587GtjU5FDrobl34RDPaYc=;
        b=hRXRM9oLxLE31BAMkU4RmmueRecrHz9M7/GU8RLmtbPPV9ISGFvghVyORNTSvH9KXB
         pYhzUQDQij3XKi6DyqN7wxvQZ+vM8zmHmFNdx5p5bLZDMktFwhWWifRlyZDWnU7VozAw
         atFUg7y80FEJwczNxs+t0CkUNyQR0+9EOopnnsjZY4XoYqQV4dhoTkQCihyj9Svtfcyj
         cEeiHjD6Fke/YbFWELnK2syeNoPmU+a/dhu6cPkxJ/o83TChtr6TeOAljczaN//k/so4
         R2+DihE2UTdwnOayPfXCrUum3Uhhw8OwZo+xlEdQj29Rq5NH9RHLmAxprvuhE7j7hIO8
         pjrA==
X-Gm-Message-State: AO0yUKXMxvZEQi7uNpRBYnrMqm1ccggUe2pxfpff2j8kX56oUHgFn8cU
	Tk0VFjhw/YnUzsyw+Qricdl+saYNPGPs6jiF
X-Google-Smtp-Source: AK7set95viTWGLPzC/BI5oIXF7Mx8xUL6YNFaoHtFarfsx0bNsA0DNjx9DvK0AyFI0tyafobS11oRg==
X-Received: by 2002:a17:906:33d0:b0:883:3c6e:23eb with SMTP id w16-20020a17090633d000b008833c6e23ebmr1608659eja.42.1677567359552;
        Mon, 27 Feb 2023 22:55:59 -0800 (PST)
Received: from kareem-XPS-13-9370.wind3.hub ([151.60.13.132])
        by smtp.gmail.com with ESMTPSA id ss24-20020a170907039800b008de50990fa7sm4099168ejb.21.2023.02.27.22.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 22:55:59 -0800 (PST)
From: Kareem Zarka <zarkakareem@gmail.com>
X-Google-Original-From: Kareem Zarka <kareem.zarka@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: Kareem Zarka <zarkakareem@gmail.com>,
	Stefan Schmidt <stefan.schmidt@huawei.com>,
	Kareem Zarka <kareem.zarka@huawei.com>
Subject: [PATCH] meta/lib/oeqa/selftest/cases/wic: Add tests for configuring kernel image install into boot partition.
Date: Tue, 28 Feb 2023 07:55:35 +0100
Message-Id: <20230228065535.6174-2-kareem.zarka@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230228065535.6174-1-kareem.zarka@huawei.com>
References: <20230228065535.6174-1-kareem.zarka@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 06:56:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177821

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
+        # Build the mtools-native package to support FAT filesystem handling
+        bitbake("mtools-native") 
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
+        # Build the mtools-native package to support FAT filesystem handling
+        bitbake("mtools-native") 
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


