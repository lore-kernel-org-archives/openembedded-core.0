Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 406F4C369D5
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 15:13:50 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web10.51055.1745853220575811457
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 08:13:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PhfPdId3;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-476ab588f32so84565981cf.2
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 08:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745853219; x=1746458019; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=bQ2LBnBfZr2mYLntgCg00ykcq40b/h3Y5+frvO8tUT0=;
        b=PhfPdId34nDPe5tN+eypD2intRWyIDOvggfEATXhFHErUcY18bDZfEX6OrKVAA7gCO
         XxHAQqLP9ktZ6gokpdBlZ4e0l6+zeVqeDLqKITNX0cCaReNP55LVjcYGD8wZudC1at4U
         Jdvzt/mKhmxo5ZsiLeQN4ugAtqqsr2C4XDF414QBpcytvPR+gHofyQN97yGKWfR26Vsg
         YpotSf8F5eQY242E0mOY5lw6dYRoiXoGHHkvnoEiI3jYZTxVDGgCNKeF5/6CMWkpUF1A
         cpJ/e4rHG8SN9oyH3b9mwQsOUYPpR9osn8srKvU2vc4FiOkMh5F3Cz1nvhAmRk+9rH8v
         4KNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745853219; x=1746458019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bQ2LBnBfZr2mYLntgCg00ykcq40b/h3Y5+frvO8tUT0=;
        b=pMoKVoOZxlhLsi1Vl6Fk5iTzeeqyyiE/s4adLHNSnQ9uCcMTKm+5u/zFpauTX7OZ6f
         maOtJ++LPykibrF+ayKHjeCZWiVdAWf0X4Vd1IzUhH9OuE0W8oQq82Fw8lnwQ57HN7IK
         7xk6g2br1X50SDhmAkZzdXtHQV+SO8Z4fwioFfkFNyzCQhPpnnQverjjrIF8gziiKo4Q
         hTTjLYoRtpJrc516vBT9pXCvx7OWrM1IuXyFt+Ce6cywasrMfK+DKf/wjBVvQSJh3xeA
         l7hHRmhvcGn6hwdXTlWcv6qnky+q84y4ZaD2aFBvWGxcZ0yWw50vYOsx/33HqyzQ92Z0
         Hssw==
X-Gm-Message-State: AOJu0YzD+JZWdNp1gBVv6x6Kl77X/LkxAI5dISY1vcpUGiidp9Z4gSZR
	BhY+P0yXUvci0i6QcptZ+uWPRt8LHf+KC81vgmqJyKR3HILbTm0CrR5HnQ==
X-Gm-Gg: ASbGncuLEu/WiYZWEjVfLg/GpwvN7kACDng6gg28k1Aq4Aini+gOFsVYwgRltb2IL3o
	IXMTWS+4IRs5Ht3Gl4G/NJGdi8Y3AfdjNWLO1MNzJvJGKMoY7jmOYV0suiE4w8eezJ4I8pjIUTv
	jiPJteI0DqsFCbI8Xnceus9DZuG3MXmBscJ+EGLTjYNH4ENeKivqI5AJnc0gZvSkTtz7C/osM+u
	C8ysotBLeEq/t3E3DGGWl4SqHBKMf7xl0RDdfxiXE4aZEMTCPZjlKn2ZhUHN/sGdcN1xzMuaEBF
	z8to0WRgpOExg3dBe43CJ6qfqckg1DTLU0Bbw2q4ofk8uWBgS5Tw6d47tLyZqjmgb+BhtBlQamN
	qWloQUubv
X-Google-Smtp-Source: AGHT+IEgPdmwE5DY/y4pEhVzCdYmir+voO6LUz+LoAPvo7USPagonZqBc/ZEWBNm/w2pIJNXKUIpCQ==
X-Received: by 2002:a05:620a:1787:b0:7c7:56ac:1e89 with SMTP id af79cd13be357-7c96685c2e3mr1388260785a.3.1745853218758;
        Mon, 28 Apr 2025 08:13:38 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c958cbe3bfsm633494185a.33.2025.04.28.08.13.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 08:13:37 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oe-selftest.wic: add PATH handling
Date: Mon, 28 Apr 2025 11:13:35 -0400
Message-ID: <20250428151335.35671-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.44.0.501.g19981daefd7c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 15:13:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215616

The wic test_exclude_path_with_extra_space test succeeds on non-debian AB
workers. Add PATH handling so parted from the wic-tools can be found on
debian-based AB workers.

Fixes [YOCTO #15838]

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 63 ++++++++++++++++-------------
 1 file changed, 35 insertions(+), 28 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index d98af8713a19..60dce33911e9 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -538,35 +538,42 @@ part /mnt --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/whoa
     def test_exclude_path_with_extra_space(self):
         """Test having --exclude-path with IMAGE_ROOTFS_EXTRA_SPACE. [Yocto #15555]"""
 
-        with NamedTemporaryFile("w", suffix=".wks") as wks:
-            wks.writelines(
-                ['bootloader --ptable gpt\n',
-                 'part /boot --size=100M --active --fstype=ext4 --label boot\n',
-                 'part /     --source rootfs      --fstype=ext4 --label root --exclude-path boot/\n'])
-            wks.flush()
-            config = 'IMAGE_ROOTFS_EXTRA_SPACE = "500000"\n'\
-                     'DEPENDS:pn-core-image-minimal += "wic-tools"\n'\
-                     'IMAGE_FSTYPES += "wic"\n'\
-                     'WKS_FILE = "%s"\n' % wks.name
-            self.append_config(config)
-            bitbake('core-image-minimal')
+        oldpath = os.environ['PATH']
+        os.environ['PATH'] = get_bb_var("PATH", "wic-tools")
 
-        """
-        the output of "wic ls <image>.wic" will look something like:
-            Num     Start        End          Size      Fstype
-             1         17408    136332287    136314880  ext4
-             2     136332288    171464703     35132416  ext4
-        we are looking for the size of partition 2
-        i.e. in this case the number 35,132,416
-        without the fix the size will be around 85,403,648
-        with the fix the size should be around 799,960,064
-        """
-        bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'MACHINE'], 'core-image-minimal')
-        deploy_dir = bb_vars['DEPLOY_DIR_IMAGE']
-        machine = bb_vars['MACHINE']
-        wicout = glob(os.path.join(deploy_dir, "core-image-minimal-%s.rootfs-*.wic" % machine))[0]
-        size_of_root_partition = int(runCmd("wic ls %s" % wicout).output.split('\n')[2].split()[3])
-        self.assertGreater(size_of_root_partition, 500000000)
+        try:
+            with NamedTemporaryFile("w", suffix=".wks") as wks:
+                wks.writelines(
+                    ['bootloader --ptable gpt\n',
+                     'part /boot --size=100M --active --fstype=ext4 --label boot\n',
+                     'part /     --source rootfs      --fstype=ext4 --label root --exclude-path boot/\n'])
+                wks.flush()
+                config = 'IMAGE_ROOTFS_EXTRA_SPACE = "500000"\n'\
+                         'DEPENDS:pn-core-image-minimal += "wic-tools"\n'\
+                         'IMAGE_FSTYPES += "wic"\n'\
+                         'WKS_FILE = "%s"\n' % wks.name
+                self.append_config(config)
+                bitbake('core-image-minimal')
+
+            """
+            the output of "wic ls <image>.wic" will look something like:
+                Num     Start        End          Size      Fstype
+                 1         17408    136332287    136314880  ext4
+                 2     136332288    171464703     35132416  ext4
+            we are looking for the size of partition 2
+            i.e. in this case the number 35,132,416
+            without the fix the size will be around 85,403,648
+            with the fix the size should be around 799,960,064
+            """
+            bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'MACHINE'], 'core-image-minimal')
+            deploy_dir = bb_vars['DEPLOY_DIR_IMAGE']
+            machine = bb_vars['MACHINE']
+            wicout = glob(os.path.join(deploy_dir, "core-image-minimal-%s.rootfs-*.wic" % machine))[0]
+            size_of_root_partition = int(runCmd("wic ls %s" % wicout).output.split('\n')[2].split()[3])
+            self.assertGreater(size_of_root_partition, 500000000)
+
+        finally:
+            os.environ['PATH'] = oldpath
 
     def test_include_path(self):
         """Test --include-path wks option."""
-- 
2.44.0.501.g19981daefd7c


