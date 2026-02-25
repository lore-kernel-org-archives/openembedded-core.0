Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48BE4EFD202
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 07:50:00 +0000 (UTC)
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40955.1772005790530558423
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 23:49:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nqa5iEsW;
 spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id d75a77b69052e-5069df1de6fso59732691cf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 23:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772005789; x=1772610589; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L6i9oMr0BT7gEUJ5QGITGlNrewuW9+CVyWhl+fqV/Dw=;
        b=Nqa5iEsWrTs37MXXF1EAlc3oC+mzFTmQdhzmjHBOT81t+9ZHaQS+2uHfKH6/mgbyJ+
         FcL8i0TvfwW/XxeJKALxIDngaZjXMCNeyppU+/DjQ0eE3LZgf+tpNO38898DTs4xihZc
         sGIpPY/4p/70t/y7q8n6kjjuVDAxOQyx8FFihy6ReF1OCiqN63ia/VNjj1elZYkA8w8M
         v7Ttfl3avcy8x0COd/DVfra35qUc1YCGul0jUq1bLb6gW+o1FvrwSmWVAnSDhs+4gIUe
         ke5XZylfcGjetVAqxq1LXfDi0+x7NHdak6wkmZAQ8DXHQ3Hdu2r3FdvxUNgFtUwpEiL/
         8zjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772005789; x=1772610589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L6i9oMr0BT7gEUJ5QGITGlNrewuW9+CVyWhl+fqV/Dw=;
        b=poNIvSKBuD//0rhYcvD2QgJc2aMWQoN085fwe3Eng0+jrw4yHfQK6876k24LPuQkrF
         qPRozqdHXL0EmMJiLopU5wLKg4/O/bh0uRhYbK/b+31sJ+xdGIkYYOq9mS8tmwhVEPwK
         qmLjSC9DKFNn85tA3vHb2TpXx7ml+JLbsQyBVHlPh9yH5EpB/TmLXkB6XvJUBRpcXOoF
         WwIXqArrHjZT7SArcbSHrB/0kS1ZQN2UOyJLB9UEDgWE5YtTBc7u6EYK4lxG1yBQo/tt
         7jfCRs2JXS+ssb1Z+/uC4O8er0ghRkxjoBKjaegEpEJywqhOQcBUecde8L0jAPXdxhJU
         4Vzw==
X-Gm-Message-State: AOJu0Yw0p710RoJwAx7Ikpw2foi6A5NRKDY+dh9VwAyFZBwlfJME2xB8
	uXcQ0PmYaueM+SoQ/j+pOqYcySyVtwu9CyVFkGyNsC9oh7FypgAyvg8VTOk0Ck334OI=
X-Gm-Gg: ATEYQzwLNPEBImgmY0oxAb0/YLOTGzWjpk4mHh8q+si/ai/W8iCMYFsUK5lJT/9XjQG
	5SEPEkuQZ0PcohY6XQMINh02X4ljsmHG3x+qMgRKIuxfeo3fiwqBJ5jtkK6mtHLXlsdWDFWQTPj
	AJ5KhvEruHkIS3JvP5o4KH8xorp9qke/0rV1lFoj0AiCjvvggX40NLa63ZQbGfWS/t0M6sW8rPD
	XeA0I405qOFKsOsHmDQ+2oF0ybIJDnBUgk5UJcIkSssdaisNYw4LTQoUo4pecH5xG+Jn+S3gdUc
	nDYbcVSenG7L30/VxrUg11nsnkhiDHG1imeLz+pHMSNhf65c3IWGZNGCpX1EMHMAmmn/RSAIH/W
	W3KpmDc3/ECckTsS7+/3KtmRJ1V49r2tLt43wmrdnkIVu72Dm54Tua98kMh+Gi113fTIdWYyaKa
	+R8gZXvN6fQ+fS3gRmzNpzm9Q3k2VlyjaYb7qcyNv3hEtRN3iuRnF55Re4TUiy3ox8pQ==
X-Received: by 2002:ac8:5fc7:0:b0:4ec:f628:ea6c with SMTP id d75a77b69052e-5073a2d6432mr19358631cf.48.1772005788921;
        Tue, 24 Feb 2026 23:49:48 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb8d0614fbsm1390089785a.17.2026.02.24.23.49.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 23:49:47 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v6 7/9] oe-selftest/cases/wic.py: oe-selftest -r wic.ModifyTests -> PASS
Date: Wed, 25 Feb 2026 02:49:29 -0500
Message-ID: <20260225074931.1661345-8-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260225074931.1661345-1-twoerner@gmail.com>
References: <20260225074931.1661345-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 07:50:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231936

Changes for the wic.ModifyTests oe-selftests to pass now that wic is a
stand-alone app and no longer part of oe-core.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
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


