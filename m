Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08BF5F357CF
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:33:02 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21460.1771943574223745688
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:32:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=sOjSMcB+;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4398913af88so496345f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943572; x=1772548372; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SCYUtnILXn/BjKtUAcVexQJ2McOdC26vwXUO7aOpb0Y=;
        b=sOjSMcB+XCukxtXzum8TZOAfA+Y89vDBddlnrRKSF27wxAcnTz7dbVxa9AQRxAvr3L
         E9TGK20Ij+oBT3gBwUjrRgFwBS9F19xv87cFsRMDdRYk8DpIeeJbBTi6GgUsk85FX9/s
         8ttI3aMBWcmOB0czVMn7bD2ReHgv2uW0apjNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943572; x=1772548372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SCYUtnILXn/BjKtUAcVexQJ2McOdC26vwXUO7aOpb0Y=;
        b=kwGiM+g1Dux1ryFqPRYA5OwOjvpVBaDD73NI2jHUzUM05TQ9ZS2JTScQxBlFaAeVmw
         an5l6X7A/QDdxfH6Fy8u/rvqjfo0Ahb69aXtN0fFUEyr297bpGBAQfbyjJf/QO3+V6oS
         pfV8es35DNHTDt4dkvRjtqrrcdY8tosRPAl5ALcO2FIMW8UDsbRlEKzrQWI/IcuNyp37
         Jbs25qEEFeGD6UmJ325LyaOltAgwY3Rl/L0Zp4xN61o0bFg4pDQ/fiQPeadtcIrplvx4
         hU2r2LLHDgIluPLhLrykeqrcCzdzMHip6e2RjMXA2kBjvHseKBMjEGssM64XNJVBmcEU
         tKwA==
X-Gm-Message-State: AOJu0Yxj+MbWNhBjZFrlRYIS5CV7GVuLPsD0NRIjZnNuE5Iqn5Op8b8z
	V+sXeRNIaphI4xcBRkgMWXq/1/6QPfll7dJRcc//1bm/rmcnJrJt6HRhaFIe3UNso38Obq7DPvB
	WHb2u
X-Gm-Gg: AZuq6aJv883a9mAAUC+NU/MPZ+M9/+hs7qtDPSWC+RUPwxp51AOlWCKH26Za0iioMaX
	v/1GZDFMyqKfk535Ij4xwdAWwPBZg5V18heITuG8QKS2ZeTluBBMPVf1GXz1W+d66auNlIc7Lf1
	nOEqQkab9yjTvnPwJLws6zMmYWO2jY8KjZs9UJ1iEE1isbNDX+RW6XoXnVx44LgOfmnkqamxpGr
	+qyZ+qlOSt+8EeX+laOVYpx/WHiYpqhuVPoJ5+75Cub51s4Q3KtHEKl3WCStomKKzpGRWeJMCKm
	j5C4w5eIDugmRZ4ri2YD9qKmN3B9YpJ6G8F0R+v3GwKjgdmZngPwq1+gUuumlnnRB+rrU8U1kg1
	jotG9GEnJ7iedbRp+3TJ2mJ4Qe0ve6aGAF8s+HcX58CbaZY0L1Br4Uaol/cNSga4QRaa8kPKSDn
	S0PiNV0TgN+biUjVp4lcsni5wqO/53J+wdH7CVI0j9CRNvzJzoWDCVWN4HnqN6D7bzjhk947RqK
	hEFT76RknR5xoQ2lBiac2qiJBqJDj92VQ==
X-Received: by 2002:a05:600d:8446:20b0:480:4b5d:9ec with SMTP id 5b1f17b1804b1-483a960eeccmr149791705e9.33.1771943572279;
        Tue, 24 Feb 2026 06:32:52 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b88f950esm19819895e9.15.2026.02.24.06.32.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:32:51 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/44] oeqa/selftest/wic: test recursive dir copy on ext partitions
Date: Tue, 24 Feb 2026 15:31:38 +0100
Message-ID: <009da1fda0f4c04c87deced4a5f667bc39b9e26c.1771943404.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771943404.git.yoann.congal@smile.fr>
References: <cover.1771943404.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:33:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231815

From: Dragomir, Daniel <daniel.dragomir@windriver.com>

Extend the wic selftests to cover recursive directory copying
into ext partitions.

Previously, copying a directory into an ext partition could
appear to succeed, but attempting to access the directory
contents would fail with:

  -l: Ext2 inode is not a directory

This was fixed in commit 4fc3b42774 ("wic/engine: fix copying
directories into wic image with ext* partition").

This test now verifies that directories copied with "wic cp"
into an ext4 partition:
  - are created with correct inode types
  - can be listed recursively with "wic ls"
  - preserve files and subdirectories
  - can be copied back out of the image without data loss

A simple directory structure is used in this test:

wic-test-cp-ext-dir/
├── topfile.txt
└── subdir/
    └── subfile.txt

Signed-off-by: Daniel Dragomir <daniel.dragomir@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6de3d2602f4f4a8192d6a6040e89e814187dcf93)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/selftest/cases/wic.py | 65 +++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index b616759209a..1ba180ff0ec 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -12,6 +12,7 @@ import os
 import sys
 import unittest
 import hashlib
+import filecmp
 
 from glob import glob
 from shutil import rmtree, copy
@@ -1662,6 +1663,70 @@ class ModifyTests(WicTestCase):
             runCmd("wic cp %s:2/etc/fstab %s -n %s" % (images[0], testfile.name, sysroot))
             self.assertTrue(os.stat(testfile.name).st_size > 0, msg="Filesize not as expected %s" % os.stat(testfile.name).st_size)
 
+            # prepare directory structure
+            testdir = os.path.join(self.resultdir, "wic-test-cp-ext-dir")
+            testsubdir = os.path.join(testdir, "subdir")
+            os.makedirs(testsubdir)
+
+            # add a file in the top-level of the directory
+            src_file = os.path.join(testdir, "topfile.txt")
+            with open(src_file, "w") as f:
+                f.write("top-level\n")
+
+            # add file in the subdir
+            src_subfile = os.path.join(testsubdir, "subfile.txt")
+            with open(src_subfile, "w") as f:
+                f.write("sub-level\n")
+
+            # copy directory to the partition root
+            runCmd("wic cp %s %s:2/ -n %s" % (testdir, images[0], sysroot))
+            basedir = os.path.basename(testdir)
+
+            # check if directory is there at partition root
+            result = runCmd("wic ls %s:2/ -n %s" % (images[0], sysroot))
+            root_entries = set(line.split()[-1] for line in result.output.split('\n') if line)
+            self.assertIn(basedir, root_entries, msg="Expected directory not present at root: %s" % root_entries)
+
+            # list INSIDE the copied directory
+            result = runCmd("wic ls %s:2/%s/ -n %s" % (images[0], basedir, sysroot))
+            self.assertEqual(0, result.status,
+                             msg="wic ls inside copied directory failed. Output:\n%s" % result.output)
+            self.assertNotIn("Ext2 inode is not a directory", result.output,
+                             msg="Regression detected (inode not a directory). Output:\n%s" % result.output)
+
+            inside_entries = set(line.split()[-1] for line in result.output.split('\n') if line)
+            self.assertTrue(set(["subdir", "topfile.txt"]).issubset(inside_entries),
+                            msg="Expected entries missing inside dir: %s" % inside_entries)
+
+            # list inside the subdir
+            result = runCmd("wic ls %s:2/%s/subdir/ -n %s" % (images[0], basedir, sysroot))
+            self.assertEqual(0, result.status,
+                             msg="wic ls inside copied subdir failed. Output:\n%s" % result.output)
+            self.assertNotIn("Ext2 inode is not a directory", result.output,
+                             msg="Regression detected (inode not a directory). Output:\n%s" % result.output)
+
+            sub_entries = set(line.split()[-1] for line in result.output.split('\n') if line)
+            self.assertIn("subfile.txt", sub_entries, msg="Expected file missing in subdir: %s" % sub_entries)
+
+            # copy directory from the partition and compare with original
+            outparent = os.path.join(self.resultdir, "wic-test-cp-ext-out")
+            os.makedirs(outparent)
+            runCmd("wic cp %s:2/%s %s -n %s" % (images[0], basedir, outparent, sysroot))
+
+            copied_dir = os.path.join(outparent, basedir)
+            self.assertTrue(os.path.isdir(copied_dir), msg="Copied-back directory not created: %s" % copied_dir)
+
+            copied_file = os.path.join(copied_dir, "topfile.txt")
+            copied_subfile = os.path.join(copied_dir, "subdir", "subfile.txt")
+
+            self.assertTrue(os.path.isfile(copied_file), msg="Missing copied-back file: %s" % copied_file)
+            self.assertTrue(os.path.isfile(copied_subfile), msg="Missing copied-back subfile: %s" % copied_subfile)
+
+            self.assertTrue(filecmp.cmp(src_file, copied_file, shallow=False),
+                            msg="topfile.txt differs after round-trip copy")
+            self.assertTrue(filecmp.cmp(src_subfile, copied_subfile, shallow=False),
+                            msg="subfile.txt differs after round-trip copy")
+
 
     def test_wic_rm_ext(self):
         """Test removing files from the ext partition."""

