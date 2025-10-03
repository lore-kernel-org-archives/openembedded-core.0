Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB41DCCA471
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 21:13:25 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.1517.1759525997102333970
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Oct 2025 14:13:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Rjb7o8K9;
 spf=pass (domain: smile.fr, ip: 209.85.167.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-579363a4602so3067710e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 14:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1759525995; x=1760130795; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rc0XCps5B1s0XG2Avi159tsyyRp3Zc9rAppmgEoq4S8=;
        b=Rjb7o8K9KqasWRwIsImOyRuKthUrzqnSyojtQncpEuQv9o2iZRlF/nerZ69atUwFag
         C1KJdTDz+YSZL0z44XMy0Qq63GfIBVvhWxSDPG9Woh2e/I44pIZcVxeGNDK2dFlYBNL3
         RbFVhuRo3OBDsphhPI8oyjCcu9E68soGQVQ+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759525995; x=1760130795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rc0XCps5B1s0XG2Avi159tsyyRp3Zc9rAppmgEoq4S8=;
        b=trW3ufqpfOW6+32sAD6/qxvCPEA9gfkG4yGUWFH1BHAQOUnfnGGJLBxEjrWJBdh4xs
         s6J0sjbxc+ARAddL71S7q0ShNUGcO3N3noEqIZ20QW6Nds3i2+yxjaMPsXockNKBpvIx
         6kegMc9i760gGS0eLGDqElucgFzQapaDNpWH8uPp3wuI+RMkKrTQPOF9OAehT7FHk3wy
         ir+L3fFGoTYt0kL/aGvebjOZ3+h8LeUGXrofeRnIAPtn7d2GGYACUVestODCLOCMYNzG
         X5tcPsK8K+/F+VyQIrso+yN7guboR/a3PGrKvdblTfv8XSfPjxxdwqo+TZFMZZsxp5nq
         jjmQ==
X-Gm-Message-State: AOJu0YyVDHyaEVh6G79nm/vx8YNNBYvbPIWbeI/JFzNjMJ9ScE6utyL3
	Zj+luxM/YPC4KFGp0DNy4jQiOEPfw2LAFuLobjC/iV+FlFUFeVIP3osYSaQ7IRlTdKpPgLvuyuP
	A298J+9Y=
X-Gm-Gg: ASbGncs4HP+0aFECDMV6Gayucr8+b3DnpClh2lyRxKYrYGFUBUpBtV7bS6gwFIrg7M6
	EV+2ds/eWnY4Cy4qOOAfhS8mgCB3HSqPDTzgo6T4a0TDKFlce98qLqIRcnVamm7rcWsFtbWeGIG
	1f6XUI2Rz3l7O3Q/AEfhu/rwK456VaWCGbcNfVfAuIdVseNpeTjTg/9cWjre7sop7kpaeAjm2rG
	tV833+GeUHCcb9NgMvCfqDCwKgBGqKKV4jWQ5O45EbDQGc/YoN/Ovth9mJOCr+XTnXUAyO5L9vi
	xRXeGZOn/Z10sL7/fBBT0Sqtvyrj3cQwp+RmhuoZ1tdUvOYzLV5DacwNcQsPwSlKm//qrqKBXos
	4w/mx2mRs2PJnsU1VZqhSFne3r5G7wCTY1nSQ1eGLw9a4bzNNlcM8BlF0cywQhIK1mO51rFHlD5
	RsuiXM32djt78vQYgHLzNFLYRGi66zF9TBzcVxEpWhkkv2nZ1tNsgBwA==
X-Google-Smtp-Source: AGHT+IFFXYhO1Krhft9purPGTG/8bG0rNnnrz0I5NQIvD2lNu3UFEWuLUZeccPt5kFxh1tTY9njA2w==
X-Received: by 2002:a05:6512:3c91:b0:57a:7467:8898 with SMTP id 2adb3069b0e04-58cbb90de23mr1380588e87.38.1759525994879;
        Fri, 03 Oct 2025 14:13:14 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local (2a01cb001331aa0036c6349435ab0707.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:36c6:3494:35ab:707])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0119e878sm2168290e87.99.2025.10.03.14.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 14:13:14 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH 2/2 master-next] oeqa/selftest/wic: fix PATH for wic.Wic2.test_extra_partition_plugin
Date: Fri,  3 Oct 2025 23:12:48 +0200
Message-Id: <20251003211248.1660154-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251003211248.1660154-1-yoann.congal@smile.fr>
References: <20251003211248.1660154-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 21:13:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224424

From: Yoann Congal <yoann.congal@smile.fr>

Without importing PATH from the wic-tools recipes, the build host PATH
is used and this test may fail depending on tools (parted, dumpe2fs,
...) availability. This triggers build faillure on AB (e.g. [0])

To fix this, import PATH from wic-tools and ensure the original
environment is restored after.

Since this indent a block of code into a try/finally block, here is the
diff ignoring white spaces change:
  diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
  index bff3842305..bc99673d0d 100644
  --- a/meta/lib/oeqa/selftest/cases/wic.py
  +++ b/meta/lib/oeqa/selftest/cases/wic.py
  @@ -1680,0 +1681,4 @@ INITRAMFS_IMAGE = "core-image-initramfs-boot"
  +        oldpath = os.environ['PATH']
  +        os.environ['PATH'] = get_bb_var("PATH", "wic-tools")
  +
  +        try:
  @@ -1696,0 +1701,3 @@ INITRAMFS_IMAGE = "core-image-initramfs-boot"
  +        finally:
  +            os.environ['PATH'] = oldpath
  +

[0]: https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2456

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/selftest/cases/wic.py | 31 ++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index bff3842305..bc99673d0d 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1678,21 +1678,28 @@ INITRAMFS_IMAGE = "core-image-initramfs-boot"
         testfile.write("test")
         testfile.close()
 
-        with NamedTemporaryFile("w", suffix=".wks") as wks:
-            wks.writelines(['part / --source extra_partition --ondisk sda --fstype=ext4 --label foo --align 4 --size 5M\n',
-                            'part / --source extra_partition --ondisk sda --fstype=ext4 --uuid e7d0824e-cda3-4bed-9f54-9ef5312d105d --align 4 --size 5M\n',
-                            'part / --source extra_partition --ondisk sda --fstype=ext4 --label bar --align 4 --size 5M\n'])
-            wks.flush()
-            _, wicimg = self._get_wic(wks.name)
+        oldpath = os.environ['PATH']
+        os.environ['PATH'] = get_bb_var("PATH", "wic-tools")
+
+        try:
+            with NamedTemporaryFile("w", suffix=".wks") as wks:
+                wks.writelines(['part / --source extra_partition --ondisk sda --fstype=ext4 --label foo --align 4 --size 5M\n',
+                                'part / --source extra_partition --ondisk sda --fstype=ext4 --uuid e7d0824e-cda3-4bed-9f54-9ef5312d105d --align 4 --size 5M\n',
+                                'part / --source extra_partition --ondisk sda --fstype=ext4 --label bar --align 4 --size 5M\n'])
+                wks.flush()
+                _, wicimg = self._get_wic(wks.name)
 
-            result = runCmd("wic ls %s | wc -l" % wicimg)
-            self.assertEqual('4', result.output, msg="Expect 3 partitions, not %s" % result.output)
+                result = runCmd("wic ls %s | wc -l" % wicimg)
+                self.assertEqual('4', result.output, msg="Expect 3 partitions, not %s" % result.output)
 
-            for part, file in enumerate(["foo.conf", "foobar.conf", "bar.conf"]):
-                result = runCmd("wic ls %s:%d | grep -q \"%s\"" % (wicimg, part + 1, file))
-                self.assertEqual(0, result.status, msg="File '%s' not found in the partition #%d" % (file, part))
+                for part, file in enumerate(["foo.conf", "foobar.conf", "bar.conf"]):
+                    result = runCmd("wic ls %s:%d | grep -q \"%s\"" % (wicimg, part + 1, file))
+                    self.assertEqual(0, result.status, msg="File '%s' not found in the partition #%d" % (file, part))
 
-        self.remove_config(config)
+            self.remove_config(config)
+
+        finally:
+            os.environ['PATH'] = oldpath
 
     def test_fs_types(self):
         """Test filesystem types for empty and not empty partitions"""

