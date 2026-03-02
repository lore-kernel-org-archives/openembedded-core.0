Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6456FD58E40
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 00:38:50 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.150264.1772411923371435049
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Mar 2026 16:38:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J0exkcrH;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-899e43ae2e1so9918546d6.2
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Mar 2026 16:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772411922; x=1773016722; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EXimZcjAM1zOc3fDX7BBIbP3cBep8UcDrM6tB6AurI4=;
        b=J0exkcrHj696fHg3BSrhPVMHiHcE7NXn7U4Rl4hg8y0YcE1FHXq0w+jqRcCHVVxunH
         Zl7eKNDBIUBXkucTcmFkul22izU9+dC07QGg4ESA+r6odjgxPQhYQBJJ4rwoBHVL/q17
         f09oZ5Bk3jLnXgqns4BJ0M3nnTHa/uIaKr+6uR6q1aZ64Ei6gZ5rT/OHt/gOQsyUWEvf
         TdBePwxXIC9uYhw91ZcV6qk8RNtFjgTwgjtHaiQ0qTdvCOkaozZJBaQcuwJfEfJyMv/v
         SnG4XqyHnj6ezfroS+Maj4T/kMyf3Y+1RyoAOOeII1GMKvD1IVHUGIMorNMbd+ryamY6
         D6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772411922; x=1773016722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EXimZcjAM1zOc3fDX7BBIbP3cBep8UcDrM6tB6AurI4=;
        b=T9USNgQp3U4jQDD/woWUvIy7f6q3Pdit0scJzPQ+VtHn5JWcfHYe9etnxNLPNsB4tD
         3sxXqG+3U9fNC8jrzAMs2jWHVjor7bUOTSMrEWU0sWZwnpyCq27G0EOwikZwuiE7/4NN
         3tvILHA9zQ0XMfDZltML8kTCX1g1bzhl6S1GeEdAR56Rxb+5y9BWJAbsVDcKZZJjHDS/
         0lrzmKkrNNy7aDROpa7hZ5DWlAhGyjLO/+zoCQbf+I3oqeiCyznmbspcwxbFLOAlscDU
         rn+1i6YydMCrTMzamTHjjY1+5D7VxqZYjdJXoZqmZ+S21zpgZFIcXLKzJd9Yz5Dwjss6
         x2tQ==
X-Gm-Message-State: AOJu0YzU2PaL52NY9c4gp61N6P2+3Stm2MhZsPs+DBCx13KfVBfJo51G
	IAtfPZcwStTbTApq85scGQOWeHY5J7qUdZkJVmil/Lcxelz36VzFPyW8T7OXQKEv
X-Gm-Gg: ATEYQzwrgNncQQPKpkl896wC3cds3QF96m++e43vwBhV7yZgjJOQ/lzIqHzExS4amZB
	y1YCl6YkTKeH8LxMoldTf884Pmn+Oz82Ef2SFRiO9VtlWPBKBtvmVyRNGIIie9JSuT6VzpnUd9y
	mu4Sv/1O+RhXIC3/q9vgBJea5jTsAZvSifYFLnkJ2rxIuj+Q3L0LdMsu+wIMg4CiQ8716X07kHO
	KhxVP3DQ8SjsNqGxWAHO3yzIP4MJU/N//oz9qDupsLpYDpwMOp0DjBH3tKV1Sgi2dJwg2HOSmLw
	Os6Lc6tZubB4tZypsZcClJble7Rv56VIv0AxzWYaCpX76V/bRz3kJ+KLqgCs6ZqpaE+VEdlerCD
	HkuRnFjeWQXqqk9qHXfJTNQdRhS8bF9OWsb9D6Q4g3TcgV3kBKIRIbtWIsg1qtKv9Zl3BjFXp2/
	S6VgYrTt8pNG449HtG+RctnNesTbQw32JpE8bc69GPsrC/Hwhx8phla7+kIykTKRT0Mg==
X-Received: by 2002:ad4:5be1:0:b0:895:3bfa:216b with SMTP id 6a1803df08f44-899d1d8444fmr154056556d6.12.1772411921753;
        Sun, 01 Mar 2026 16:38:41 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899ebb09772sm33710356d6.12.2026.03.01.16.38.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 16:38:39 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v7 7/9] oe-selftest/cases/wic.py: oe-selftest -r wic.ModifyTests -> PASS
Date: Sun,  1 Mar 2026 19:38:24 -0500
Message-ID: <20260302003826.3995222-8-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260302003826.3995222-1-twoerner@gmail.com>
References: <20260302003826.3995222-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 00:38:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232153

Changes for the wic.ModifyTests oe-selftests to pass now that wic is a
stand-alone app and no longer part of oe-core.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v7:
- update the test wks file to fix wic.ModifyTests.test_wic_cp_ext

changes in v6:
- none

changes in v5:
- rebase with master
- re-split out in to individual, smaller patches
- now that the sector-size re-implementation is ahead of this patch,
  various wic subcommands (ls, cp, rm) no longer need a --vars file

v4: skipped to align/combine with other patch set

changes in v3:
- squashed into 1 large patch

changes in v2:
- none
---
 meta-selftest/wic/wictestdisk.wks   |  4 ++--
 meta/lib/oeqa/selftest/cases/wic.py | 24 ++++++++++++------------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta-selftest/wic/wictestdisk.wks b/meta-selftest/wic/wictestdisk.wks
index d4de24d83097..ba2bc1956645 100644
--- a/meta-selftest/wic/wictestdisk.wks
+++ b/meta-selftest/wic/wictestdisk.wks
@@ -1,7 +1,7 @@
 # short-description: image for use in machine agnostic wic test cases
 
 # /boot is intentionally an empty partition
-part /boot --ondisk sda --label boot --active --align 1024 --size 16
-part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024 --use-uuid
+part /boot --ondisk sda --label boot --active --size 16
+part / --source rootfs --ondisk sda --fstype=ext4 --label platform --use-uuid
 
 # bootloader is intentionally left out
diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 22163ccdb3e2..8a6e51abb968 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1962,9 +1962,9 @@ INITRAMFS_IMAGE = "core-image-initramfs-boot"
 class ModifyTests(WicTestCase):
     def test_wic_ls(self):
         """Test listing image content using 'wic ls'"""
-        runCmd("wic create wictestdisk "
+        runCmd("wic create wictestdisk -v %s "
                                    "--image-name=core-image-minimal "
-                                   "-D -o %s" % self.resultdir)
+                                   "-D -o %s" % (self.envfile, self.resultdir))
         images = glob(os.path.join(self.resultdir, "wictestdisk-*.direct"))
         self.assertEqual(1, len(images))
 
@@ -1980,9 +1980,9 @@ class ModifyTests(WicTestCase):
 
     def test_wic_cp(self):
         """Test copy files and directories to the the wic image."""
-        runCmd("wic create wictestdisk "
+        runCmd("wic create wictestdisk -v %s "
                                    "--image-name=core-image-minimal "
-                                   "-D -o %s" % self.resultdir)
+                                   "-D -o %s" % (self.envfile, self.resultdir))
         images = glob(os.path.join(self.resultdir, "wictestdisk-*.direct"))
         self.assertEqual(1, len(images))
 
@@ -2026,9 +2026,9 @@ class ModifyTests(WicTestCase):
 
     def test_wic_rm(self):
         """Test removing files and directories from the the wic image."""
-        runCmd("wic create mkefidisk "
+        runCmd("wic create mkefidisk -v %s "
                                    "--image-name=core-image-minimal "
-                                   "-D -o %s" % self.resultdir)
+                                   "-D -o %s" % (self.envfile, self.resultdir))
         images = glob(os.path.join(self.resultdir, "mkefidisk-*.direct"))
         self.assertEqual(1, len(images))
 
@@ -2054,9 +2054,9 @@ class ModifyTests(WicTestCase):
 
     def test_wic_ls_ext(self):
         """Test listing content of the ext partition using 'wic ls'"""
-        runCmd("wic create wictestdisk "
+        runCmd("wic create wictestdisk -v %s "
                                    "--image-name=core-image-minimal "
-                                   "-D -o %s" % self.resultdir)
+                                   "-D -o %s" % (self.envfile, self.resultdir))
         images = glob(os.path.join(self.resultdir, "wictestdisk-*.direct"))
         self.assertEqual(1, len(images))
 
@@ -2069,9 +2069,9 @@ class ModifyTests(WicTestCase):
 
     def test_wic_cp_ext(self):
         """Test copy files and directories to the ext partition."""
-        runCmd("wic create wictestdisk "
+        runCmd("wic create wictestdisk -v %s "
                                    "--image-name=core-image-minimal "
-                                   "-D -o %s" % self.resultdir)
+                                   "-D -o %s" % (self.envfile, self.resultdir))
         images = glob(os.path.join(self.resultdir, "wictestdisk-*.direct"))
         self.assertEqual(1, len(images))
 
@@ -2169,9 +2169,9 @@ class ModifyTests(WicTestCase):
 
     def test_wic_rm_ext(self):
         """Test removing files from the ext partition."""
-        runCmd("wic create mkefidisk "
+        runCmd("wic create mkefidisk -v %s "
                                    "--image-name=core-image-minimal "
-                                   "-D -o %s" % self.resultdir)
+                                   "-D -o %s" % (self.envfile, self.resultdir))
         images = glob(os.path.join(self.resultdir, "mkefidisk-*.direct"))
         self.assertEqual(1, len(images))
 
-- 
2.51.0


