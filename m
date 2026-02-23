Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3841DEEC28E
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 21:50:35 +0000 (UTC)
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6363.1771883434612333677
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 13:50:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z1c7/El4;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id af79cd13be357-8cb40030be5so476535885a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 13:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771883433; x=1772488233; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nAVKkGzqrZxomZbwKbD9gtEZA4l0KtJcNPiQ2/98/VY=;
        b=Z1c7/El4xauowY3tbB1/C++jUQd2UIEMAftyMShZlTt1nniLGYzG9haxSUL2zq2s3m
         iU3NDZSO5xHKd4VfNdcSlvJJNCbcweiXIqTRL17bc3i45w8aPu24jD8KVg1eqA5Gj0+N
         oDuwvK0g91bksYuPUODYIkHOad9Q7/SPVma/ISjwuMAoAy8VKaXqB+f23LYiErVxkbaH
         jlQ27MYSHRe7EMrEubyv4FFquEI7pbJ3x4v1NGqLK6Au4QY3J2h9vVRgC87IzRses8oK
         c6utGE5tl5JtGllm2Ak49zHT1H+2UdlwRjoH6ddsrfvyTtmBf9bYXFXBfAoCqMN+GhaG
         wPeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771883433; x=1772488233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nAVKkGzqrZxomZbwKbD9gtEZA4l0KtJcNPiQ2/98/VY=;
        b=tVTeNPgZfiySbA+GXW0QFYgEZ8s8+nvJHvlmpMg3t0xNmf3lP76OASwdjsYKXX+6tS
         kfJe5OHk/E18bDcre20VdkJ6wdqFr8NpOj4hVNp0dOAaEYUAxrISCH95vpVQ+qYWCzFM
         NYT3oFDvSfNAmYKsI54QH+x3RiPUTraG5aQyDizYtRpxvJW2C0f0y0x3j35sUUWqgZR3
         AaZQFvyJJQdS501nVZpZvtYHtEVlM/77uhhLmop9GRt5Fgz0N7FmUd9d5ILZGgrobtsJ
         ZBzXWjlolDtyXyNJBA6uML7XFLdAvC8CIBdpX1MiAa3rlDRIUem1rM6nGREpZPZpXbyz
         unyw==
X-Gm-Message-State: AOJu0YwNgycG9EqFkisgOFUlpWyALKWQHMKDb8gjP1Ne00hf3HgkQtOd
	r1O+8vOarPg7tgTYPqlYJd946uVn2sUtDLspk4ysE7N0by1RJsxMR2QKKaw6p/vVSFw=
X-Gm-Gg: AZuq6aIH8/i0kE2nscvyjUCZqzrF4CWVA0uDq7Josi4m4l04FffVkX6OO0tzwAzBHiL
	VdHSIubCDkNGHHmvv9GyKPE1Gbmb9MrThNbnh6FPz9BTSJMwoIHKQ43ofeW0Tq7NcnQT0CO6emv
	nidJh7Z0vVsKTipUCjjWOHzLCbrTvq2HcPZuFv7gM7gWMuQt2CvkIXXJO0IT3aaPVUgni1ZNXff
	7WDgDLNX/Br/YfdNdclElvM1am4OsqILFkdbZoXB0tU1eMtI5Wao7uxcjZ9htgNtcezGJEbwFDu
	E0fJtkyhuGkNH3YrNXpSMzjO1+Vf86JsuNHF0pguCyvKWXb5lN0ucR10WQJbMr6OayRWodp0TkG
	3sMXyP4vjqx2RAzke2YlpI4zGdFBOn4gTH8LpfjGaLFFJ5jP4LmcSTpalA6OCRhObr4KejsK+oB
	O0Bh3LNaS38F2I5PgDz5suhbZ3JhI7STzN7wnfcgpUNP9IihjIt30++aX6SFoddhcClA==
X-Received: by 2002:a05:620a:1aa9:b0:8b2:ea2b:923c with SMTP id af79cd13be357-8cb8c9e680bmr1281698585a.14.1771883432896;
        Mon, 23 Feb 2026 13:50:32 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8997c691113sm93811606d6.1.2026.02.23.13.50.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 13:50:32 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v5 08/10] oe-selftest/cases/wic.py: oe-selftest -r wic.ModifyTests -> PASS
Date: Mon, 23 Feb 2026 16:50:06 -0500
Message-ID: <20260223215008.2062721-9-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260223215008.2062721-1-twoerner@gmail.com>
References: <20260223215008.2062721-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 21:50:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231709

Changes for the wic.ModifyTests oe-selftests to pass now that wic is a
stand-alone app and no longer part of oe-core.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
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
 meta/lib/oeqa/selftest/cases/wic.py | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

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


