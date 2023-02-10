Return-Path: <zarkakareem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEE1BC636CD
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 10:12:54 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.11149.1676023968611449796
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Feb 2023 02:12:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nlPQxNat;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: zarkakareem@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id lu11so14505248ejb.3
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Feb 2023 02:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Ou5HeekhF6p2Xe1l4Bd/awDMzWIWrZZawzFpB5+zY8=;
        b=nlPQxNat+13rpFeiudsqAjoZk/geS33b6yfp256Z26PtV16OJpletS2JBNoQefyxNg
         L/F+7aNKrz1gf0Sn9pq/UF0JBnACqZ98QXXtEmocW1KS2+dnxVnSbD5fea1BrGaxlaST
         I2BDc70kwvCeFzF2CQmNutT7yNEZNxZ/G06GXQcvptdZOXOwfHKQS+FISrpIHyT2DuaH
         dT5FOw1FIGgzoB7W7ph2eYYnjEsP3uePYVa3AQ53NbrDTAs78LhcMXh/f8F+vWlkEZoA
         9oqMTyxLklinDguj1ZYC0yRCfxJdq1bSEFgMvoRaD6YydMV/qqneX1O36ltI1AI//St6
         aA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Ou5HeekhF6p2Xe1l4Bd/awDMzWIWrZZawzFpB5+zY8=;
        b=WfDtZ0o1M9PyR3bDqmn0QqZ3qRxGNZcLoP1QnHCnE7hrKi+KDvZzIFAQNVZ0LBzlpi
         rZvZqYaTykvG7KYuZcF+EzfcftDlQHZHXVhnG3/ILnC9v06Ks9tobTMg0A7qV4jVWues
         ARMTJ1RrodyFJlDxCsrUeT6hdeJH4n3l1TrJRyrWWRBUy1QhHVdsG8mecgd18wQ+RSy9
         yEo9E773+qTjX0892BmznB1iayIhyKqTY3Rf6BB1J5Q0wlP5khaK21hzFRkUymrcvgcE
         bPkEC7UxLK03skMBQDPm6mXSeICTh2RSD3iAM2shZ+yAC4KDYkDZXUgNeK4FxOSNibHX
         6l0A==
X-Gm-Message-State: AO0yUKWQf6foyBhgkvZbhjhhOTX8b6FwbeQ+DzQOJTwhsgU/lh9aZoQg
	1X4D0P1iKJ0ejzNx3P+uPc2tDcJZ/iYjhGUl
X-Google-Smtp-Source: AK7set+NkbnOwys5fR606r8Q9F/rRozk0nLJXuk08Rmdc5Qk4S8eu8j25v2KzntIxZkFsmdrGvDjXw==
X-Received: by 2002:a17:906:5952:b0:885:dd71:89b5 with SMTP id g18-20020a170906595200b00885dd7189b5mr15237361ejr.41.1676023966744;
        Fri, 10 Feb 2023 02:12:46 -0800 (PST)
Received: from kareem-XPS-13-9370.wind3.hub ([151.60.13.132])
        by smtp.gmail.com with ESMTPSA id q7-20020a170906770700b008af42f87da2sm1732969ejm.79.2023.02.10.02.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 02:12:46 -0800 (PST)
From: Kareem Zarka <zarkakareem@gmail.com>
X-Google-Original-From: Kareem Zarka <kareem.zarka@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: Kareem Zarka <zarkakareem@gmail.com>,
	Stefan Schmidt <stefan.schmidt@huawei.com>,
	Kareem Zarka <kareem.zarka@huawei.com>
Subject: [PATCH] meta/lib/oeqa/selftest/cases/wic: Add tests for configuring kernel image install into boot partition.
Date: Fri, 10 Feb 2023 11:12:20 +0100
Message-Id: <20230210101220.1525869-2-kareem.zarka@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230210101220.1525869-1-kareem.zarka@huawei.com>
References: <20230210101220.1525869-1-kareem.zarka@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Feb 2023 10:12:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176988

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


