Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9AA8EF48F6
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 08:10:30 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67223.1770970225346440042
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 00:10:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=j7PDkApb;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43770c94dfaso751875f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 00:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770970223; x=1771575023; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7KrpNZYi/pscTewrxLVAulfk2ogJloqQveuVffknLrE=;
        b=j7PDkApbuwuzvHZCZ/Jx78pluqSB5O4S2g6IlBc7PPBNbUC9z/swzk41Yz0easLgos
         67bFU9pJJ002WEvHhXbzfGWO+xpMorNu0vRNcND+tFAj3OLwSQezTHIEHQqTfAHApZrE
         Wbrb+E20FerKBLF6T98O2rtkBYGK9mXP2WXbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770970223; x=1771575023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7KrpNZYi/pscTewrxLVAulfk2ogJloqQveuVffknLrE=;
        b=SmBqGOzkTo4+1X5Zuzg5FyinXnAJEwBPh1GRapRaHAaXQJlkAMnzVwUMsTrYxZJNOr
         o32y1UT4U37h+W0AdzIf9T21gAqTVckDjC2xQV6a6lRzApG7Zoix7UCgeCgoFVK7mniA
         WA6fwuh7WYebOIBMBJuIEtF5FR+bPhOyccDjkf5fYhdk8WRsDGuXrlhwjGC9ziwCxcV6
         yiv262J7CVxaiWfmA6I+IhY0HTjPU12ScZ9QcLMOF5Gg2KwjUKplGBHEGa/Sy7xzQgIg
         BgEg+GyFYtJ44M5hc15xxN+0mlYPqXPkmirjqtdaoPWCt5TxevOs1391wT7m+II7t1+P
         EGLQ==
X-Gm-Message-State: AOJu0Yyv153YZxK7n6jQu1holdfthCYJAdgU+hI1jS32J/Z5rTBk5/eG
	nl+cS38K9YS8k7clKy97cpEs2qhTEk5PMluEoui0dWahrPh/WQi8x3pBat56IZJF43vIl2nakS3
	8Wg55
X-Gm-Gg: AZuq6aIgh7JN5O1Tvyqf5OrdKm4B1sjTppAbSB82DHKHCgJpnDdjLAPeIKcUGbIWE3D
	La9yMqTxQV/tSewSxQSgwzqqRdhMLsYXEb2xjvDJbebGN9KhKPvlPGtJ8E0Eo1Fw5HfC8Qy/JVI
	Zn0VAu4Qu6Mq6xm9pp2FThdC+kb7XPBs0c4EmQC/C5Wh6PP98Suz+N8SOJKpIuMWLFanrLgEem2
	HQ8OeXkA3E+S3veh897sl2S0rxf6d/hNDVrrDBggDYhbaKPq2HCzKwbJ2sgWzoLMaLO+6l+3eCD
	CjXUf5IbWkIFhI2/tZMfU3YhURHAsR/2YRUVyL2RZ/olUIG6brWDd4QZ8+7aV2YUjmfal5aCQvm
	MwERfCAf0H9tls254Mu6BY/awmV8mdfU3H6jAOvF7oZamTu4Z+LyZswuglR+j8X3C6Xm4H6ye3X
	KaSDoL3fZQTd+SkynjJmdhfUoGZCEACz85rHLQ+al4ghZrtdJrYSvDxLiwi3PcySgV2SsHQfDmK
	O3UbV7n/jYu68mPcubUOAZkGsg=
X-Received: by 2002:a05:6000:40ca:b0:437:8f37:887 with SMTP id ffacd0b85a97d-43797917e2emr1780921f8f.36.1770970223401;
        Fri, 13 Feb 2026 00:10:23 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00d6f202ec534aee64.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:d6f2:2ec:534a:ee64])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-437969fd36dsm3590815f8f.0.2026.02.13.00.10.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 00:10:22 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 07/19] oeqa/selftest/wic: test recursive dir copy on ext partitions
Date: Fri, 13 Feb 2026 09:08:25 +0100
Message-ID: <9885466f61175b33414b512952c882d3c7439b7d.1770968514.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770968514.git.yoann.congal@smile.fr>
References: <cover.1770968514.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 08:10:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231090

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
index d7a9b146584..958f1d084fd 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -13,6 +13,7 @@ import sys
 import unittest
 import hashlib
 import subprocess
+import filecmp
 
 from glob import glob
 from shutil import rmtree, copy
@@ -2084,6 +2085,70 @@ class ModifyTests(WicTestCase):
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

