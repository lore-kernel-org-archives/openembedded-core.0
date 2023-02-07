Return-Path: <zarkakareem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F9B3C636D3
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 19:04:06 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.775.1675796637727450161
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 11:03:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oANRZkn7;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: zarkakareem@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id ud5so45200138ejc.4
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 11:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hdtb6ljPfhFAUrljhc7M//vGpew4eGNJau3dcZorSuI=;
        b=oANRZkn7TwsbElK1M1HsnyorC6z15fwW1O6/eNFMgSwRCMCAKPt1otveI/LiSEOQ4a
         OCngeIAOf1/UQfzCxUJK1DRI6LfBvS9WQ9dJrAH0YGLVpTAxTe04Zek2pThOSAilmVFR
         iFgcGRkeyU2rYvY1iiWYIuLrPhdd+XLaURRSAzCR7D7NPcwdNCK0PzreQpr+8o6hxJbf
         T1aTcXGPud6c8hp0mThNd0+k0df83kR74605jgfbX0Q9KmyOzjqyABx73WPwgi2XZXTu
         fvb5ksJD9QEBujwcoZ6Xbphgk4tBH6Q24wW8SUOUYFR02GSUID80tZNKoZR/YUJDAgKa
         Yo9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hdtb6ljPfhFAUrljhc7M//vGpew4eGNJau3dcZorSuI=;
        b=QyuqvHiNSjZvbpTsc/36jtanwsX2UdI5sjvvfNzWWXB0Wk+L4IzPbErnQW72RUBg5u
         nNdUZIyBj/9vPrrQwqeu5Rb/AP/MbEAA73GKhEPQsFJGkxD06kvY7p3ooQ7XQa+MmCJb
         EGkL1D9D3ejM4awUvHJwlATctj4/e31gc4pYvZ8A8ICLS6l7ukT9sSToSyDkES8W6zbv
         bYiIefrqv4TLjR5bKRrlUymjGJJJE2EtY15IM8rLYaLoKRv1dm6ZNokxEoKddZnib4iQ
         39PjfccRoZrKjifeoDP+tFiLh0tEVe6258d5ZNN7JqCbZowH/7LPMp8IxNKQG9kVazNt
         Ut/Q==
X-Gm-Message-State: AO0yUKXvRCtNk1FswadA8HuHccW7mpOSLsg/Xm77aAh4OTpc/LowteR8
	IeYAxEjy0Pne+TxpEPN2IFbKBeOYv8i7LlU8
X-Google-Smtp-Source: AK7set/RM3/MgsItHnyTX4vj7nqVDyquExT1pcmwu1i16pfFWOslev6mwR1B41UGRrsxg2KxTuJNIA==
X-Received: by 2002:a17:906:5856:b0:86f:d0c9:4bdd with SMTP id h22-20020a170906585600b0086fd0c94bddmr4232987ejs.27.1675796635885;
        Tue, 07 Feb 2023 11:03:55 -0800 (PST)
Received: from kareem-XPS-13-9370.wind3.hub ([151.60.13.132])
        by smtp.gmail.com with ESMTPSA id gu19-20020a170906f29300b008a9e585786dsm1107751ejb.64.2023.02.07.11.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 11:03:55 -0800 (PST)
From: Kareem Zarka <zarkakareem@gmail.com>
X-Google-Original-From: Kareem Zarka <kareem.zarka@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: Kareem Zarka <zarkakareem@gmail.com>,
	Stefan Schmidt <stefan.schmidt@huawei.com>,
	Kareem Zarka <kareem.zarka@huawei.com>
Subject: [PATCH] meta/lib/oeqa/selftest/cases/wic: Add tests for kernel
Date: Tue,  7 Feb 2023 20:03:05 +0100
Message-Id: <20230207190305.3071923-2-kareem.zarka@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230207190305.3071923-1-kareem.zarka@huawei.com>
References: <20230207190305.3071923-1-kareem.zarka@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 19:04:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176830

This commit adds two tests for the WIC plugin:

- test_skip_kernel_install: This test verifies that the kernel is not
installed in the boot partition when the 'install-kernel-into-boot-dir'
parameter is set to false.

- test_kernel_install: This test verifies that the kernel is installed
in the boot partition when the 'install-kernel-into-boot-dir' parameter
is set to true.

Both tests use a WKS (Kickstart) file to specify the desired
configuration, build a disk image using WIC,
and extract the disk image to a temporary directory to verify the
results.

Signed-off-by: Kareem Zarka <kareem.zarka@huawei.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 67 +++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index ca1abb970a..251b61fa67 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -16,6 +16,7 @@ import hashlib
 from glob import glob
 from shutil import rmtree, copy
 from tempfile import NamedTemporaryFile
+from tempfile import TemporaryDirectory
 
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.core.decorator import OETestTag
@@ -228,6 +229,72 @@ class Wic(WicTestCase):
         runCmd(cmd)
         self.assertEqual(1, len(glob(os.path.join(self.resultdir, "sdimage-bootpart-*direct"))))
 
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
+                            "The kernel image '{}' was found in\
+                                    the partition".format(kimgtype)
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
+                    found, "The kernel image was not found in the boot partition"
+                )
+
     # TODO this doesn't have to be x86-specific
     @skipIfNotArch(['i586', 'i686', 'x86_64'])
     def test_default_output_dir(self):
-- 
2.25.1


