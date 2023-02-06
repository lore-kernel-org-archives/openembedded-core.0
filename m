Return-Path: <zarkakareem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FB00C636D3
	for <webhook@archiver.kernel.org>; Mon,  6 Feb 2023 19:17:06 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.63165.1675711015929216792
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Feb 2023 11:16:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=j+gJ/EPH;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: zarkakareem@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id ml19so37340117ejb.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Feb 2023 11:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZjM9T6P1UEKmwjktMB+V9ZIEji+pYtXD5j1m40UgU60=;
        b=j+gJ/EPHt755weJqhkVof93Jv2GTmCz+MMr07S3ktwn51TYPcnvbjXNSbkA/x38HJF
         HnzvJDn864ZLJB36h5wtchlFXKEFVW8K1DsTf8ZykKpMTLzJgNEhc7kn7H+MLhMFSDPR
         sSSiL+m0EQplaMn3baTb8gGJ/gkGelXaudDZDFZZg9mc5TgEJ3vbSPLvi6unKkoZJKa/
         sxYyspToQEihcHMFqiig/AS7EcRWCKvvBekEyH5DiFhbXrCvDnAQExAV8x+Utd4ncbsk
         QYI0bhnsj4TmClgWD3hz0H35vCVH3JBwADQgNKhBWk/1sNXFDSZ8hif5Ujs7iqVzVDYP
         T8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZjM9T6P1UEKmwjktMB+V9ZIEji+pYtXD5j1m40UgU60=;
        b=OIxI7G3EHXkWiH+2do+R8B/7s18/anBPFSZz3e72/3ye3F5uRHcfbj1NuVs8UP18TM
         HX8HiAu16d6otveUG/SO/XS4I+CY7AQYz6dkE7FhS/KjB/GGONwfElKngPqML34LE5Ez
         TVvdPaO1RoS09my96TonMl7GiSY2nw0zIlD4jTiQL0JKQtgnKqngOzWJqU+4YQHYOwf/
         HXB6W3e6ymy1Xq34fPma0zCmknWENfQMw137En3GseDIUdo3u51mff/1sRAuKqTNzfxW
         VyGQsw4AHqB1ogbETjofDa+yv7LQnX85gyVYt46zSVNmmYQi+Ti7hG1/B0b9GCn/axMw
         Kavw==
X-Gm-Message-State: AO0yUKVLyJWNnGDS3LVntsktL77VSzkAPiMvUxmPLqA3qPUZf4ELUEZR
	Pi4GNMPI2l0Cvbh3hnU+y0pZZTFjqDprkGkN
X-Google-Smtp-Source: AK7set/bhza9+vXDEYlk/eL86KhVSPlF92pzTE8qLE+Pqy9zGtg5cgKyCdtoOD8r1216AOACRviofA==
X-Received: by 2002:a17:906:a106:b0:878:7650:469c with SMTP id t6-20020a170906a10600b008787650469cmr458740ejy.52.1675711014165;
        Mon, 06 Feb 2023 11:16:54 -0800 (PST)
Received: from kareem-XPS-13-9370.wind3.hub ([151.60.13.132])
        by smtp.gmail.com with ESMTPSA id o15-20020a170906600f00b00857c2c29553sm5816200ejj.197.2023.02.06.11.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 11:16:53 -0800 (PST)
From: Kareem Zarka <zarkakareem@gmail.com>
X-Google-Original-From: Kareem Zarka <kareem.zarka@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: Kareem Zarka <zarkakareem@gmail.com>,
	Stefan Schmidt <stefan.schmidt@huawei.com>,
	Kareem Zarka <kareem.zarka@huawei.com>
Subject: [PATCH] meta/lib/oeqa/selftest/cases/wic: Add tests for kernel installation and skip-kernel-install in wic plugin.
Date: Mon,  6 Feb 2023 20:16:15 +0100
Message-Id: <20230206191615.2675373-2-kareem.zarka@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230206191615.2675373-1-kareem.zarka@huawei.com>
References: <20230206191615.2675373-1-kareem.zarka@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Feb 2023 19:17:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176795

This commit adds two tests to the wic plugin to verify that the kernel
is installed correctly when `skip-kernel-install` is not provided
and not installed when `skip-kernel-install=true`.
These tests ensure that the wic plugin is working correctly and will
help catch any future issues with kernel installation.

Signed-off-by: Kareem Zarka <kareem.zarka@huawei.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 71 +++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index ca1abb970a..40188a866a 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -16,6 +16,7 @@ import hashlib
 from glob import glob
 from shutil import rmtree, copy
 from tempfile import NamedTemporaryFile
+from tempfile import TemporaryDirectory
 
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.core.decorator import OETestTag
@@ -220,6 +221,76 @@ class Wic(WicTestCase):
         result = runCmd("wic ls %s:1/ -n %s" % (images[0], sysroot))       
         self.assertIn("kernel",result.output)
 
+    def test_skip_kernel_install(self):
+        """Test skip_kernel_install in wic plugin"""
+        # create a temporary file for the WKS content
+        with NamedTemporaryFile("w", suffix=".wks") as wks:
+            # write the WKS content to the temporary file
+            wks.writelines([
+                'part --source bootimg-efi \
+                --sourceparams="loader=grub-efi,skip-kernal-install=true"\
+                --label boot --active'
+                ])
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
+
+                # extract the content of the disk image to the temporary directory                
+                cmd = "wic cp %s:1 %s" % (out[0], tmpdir)
+                runCmd(cmd)
+                
+                # check if the kernel is installed or not
+                kimgtype = get_bb_var('KERNEL_IMAGETYPE', 'core-image-minimal')
+                for file in os.listdir(tmpdir):
+                        if file == kimgtype :
+                            raise AssertionError(
+                                "The kernel image '{}' was found in\
+                                the partition".format(kimgtype)
+                                )
+
+    def test_kernel_installation(self):
+        """Test kernel installation in wic plugin"""
+        # create a temporary file for the WKS content
+        with NamedTemporaryFile("w", suffix=".wks") as wks:
+            # write the WKS content to the temporary file
+            wks.writelines([
+                'part --source bootimg-efi \
+                --sourceparams="loader=grub-efi"\
+                --label boot --active\n'
+                ])
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
+
+                # extract the content of the disk image to the temporary directory                
+                cmd = "wic cp %s:1 %s" % (out[0], tmpdir)
+                runCmd(cmd)
+                
+                # check if the kernel is installed or not
+                kimgtype = get_bb_var('KERNEL_IMAGETYPE', 'core-image-minimal')
+                for file in os.listdir(tmpdir):
+                    if file == kimgtype :
+                        found = True
+                        break
+                self.assertTrue(
+                    found,"The kernel image was not found\
+                    in the boot prtition".format(kimgtype)
+                    )
+
     def test_sdimage_bootpart(self):
         """Test creation of sdimage-bootpart image"""
         cmd = "wic create sdimage-bootpart -e core-image-minimal -o %s" % self.resultdir
-- 
2.25.1


