Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41075C433EF
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 11:50:38 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web09.6028.1639137037153415655
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 03:50:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PcEWlacU;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id i12so6607527wmq.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 03:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3UJuFGvbVcponM0v30fZJsSx0M5YKuiVTs5mv4eTRt4=;
        b=PcEWlacUjfwKfiaiuGuGhHGUk00BWZamyxq1T6To34qFeUwK+LKsHRkfd4p1bNQwzW
         33x62fXZaHDaMAbOEhSIlMQSPkQJiuXiDNc1X6KdWViSKs84XuR270vKVWZ19NFT4Kx7
         //r0euuUqAfripv+4jAYwmPfXjtFEN5QHk1iEWT0D8wTAup5oU7hUME9bE762WAcDsqO
         1P4+YUcL+VG2hXtnxYeQRr4cLxAVt6mPdyZFC9/Me27e6BDsAucqH+MOCi6VGlT4Oyio
         MusCZVceW/5OVpROFglRmuh+LKOsO3mJJ17oZRbks1UmOB8jefWwhUabRDFtYu5M54O+
         1Raw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3UJuFGvbVcponM0v30fZJsSx0M5YKuiVTs5mv4eTRt4=;
        b=AuknOyScLAnSW7is4HenKRKdxpT+Tk2+KH1YoJszRV9x2iEw6lviovFkD6TBsOOXBe
         +g84c0Kcdh6OXCbcy+uk0/NvjTPxp0KsUZa8L9bmbfuPRkbErqK88UlLMig91PNJ8112
         8TdQOiaomNrt7yCPUFYYAQg0aYb3Kd63Fk/++LcThtg+SCUYpsewUY49m3FRecsIDW+8
         lgozB9JC9yVc0NvcrC8Gho+AwMrETYpOryeAp8aaZtGaK9jnED5Kl4tG0kuSXCGhsI26
         yi3A8TjL6QzjAEwLsD13r7VJcw6MXhNQn94BQRHI/acS9hZ4YQv9mFBCi3Zj6dhTd5mQ
         sFvw==
X-Gm-Message-State: AOAM533QLrmuGvPDwnnCUIeF93lDMiEy7/xlsu0HUC2DYzTviEKawTS8
	Y0H1Ouc0bgrxweSTneB9uWVxr8LMNA6iFA==
X-Google-Smtp-Source: 
 ABdhPJwnx2b1+2H8aajxGtjw64sfl+XztSdUC+stiosZhlfe6yvBj2TSw+aA6fxRhiqB4Xc76e7mqA==
X-Received: by 2002:a7b:ce16:: with SMTP id m22mr15967618wmc.39.1639137035134;
        Fri, 10 Dec 2021 03:50:35 -0800 (PST)
Received: from slackware.local
 (dslb-002-205-007-123.002.205.pools.vodafone-ip.de. [2.205.7.123])
        by smtp.gmail.com with ESMTPSA id
 y6sm11496662wma.37.2021.12.10.03.50.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 03:50:34 -0800 (PST)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/8] oeqa/selftest: overlayfs helper function
Date: Fri, 10 Dec 2021 12:50:24 +0100
Message-Id: 
 <b1ef9929375e1454d5fafa0791aaca720d32bbe2.1639136706.git.uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1639136706.git.uvv.mail@gmail.com>
References: <cover.1639136706.git.uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 11:50:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159503

Move helper functions out of class scope so they can be used in other tests

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/lib/oeqa/selftest/cases/overlayfs.py | 32 +++++++++++------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/selftest/cases/overlayfs.py
index 84242a1605..43415778ce 100644
--- a/meta/lib/oeqa/selftest/cases/overlayfs.py
+++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
@@ -5,16 +5,16 @@
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, runqemu
 
-class OverlayFSTests(OESelftestTestCase):
-    """Overlayfs class usage tests"""
+def getline_qemu(out, line):
+    for l in out.split('\n'):
+        if line in l:
+            return l
 
-    def getline_qemu(self, out, line):
-        for l in out.split('\n'):
-            if line in l:
-                return l
+def getline(res, line):
+    return getline_qemu(res.output, line)
 
-    def getline(self, res, line):
-        return self.getline_qemu(res.output, line)
+class OverlayFSTests(OESelftestTestCase):
+    """Overlayfs class usage tests"""
 
     def add_overlay_conf_to_machine(self):
         machine_inc = """
@@ -40,7 +40,7 @@ inherit overlayfs
         self.write_recipeinc('overlayfs-user', overlayfs_recipe_append)
 
         res = bitbake('core-image-minimal', ignore_status=True)
-        line = self.getline(res, "overlayfs-user was skipped: missing required distro features")
+        line = getline(res, "overlayfs-user was skipped: missing required distro features")
         self.assertTrue("overlayfs" in res.output, msg=res.output)
         self.assertTrue("systemd" in res.output, msg=res.output)
         self.assertTrue("ERROR: Required build target 'core-image-minimal' has no buildable providers." in res.output, msg=res.output)
@@ -61,9 +61,9 @@ DISTRO_FEATURES += "systemd overlayfs"
         self.add_overlay_conf_to_machine()
 
         res = bitbake('core-image-minimal', ignore_status=True)
-        line = self.getline(res, "Unit name mnt-overlay.mount not found in systemd unit directories")
+        line = getline(res, "Unit name mnt-overlay.mount not found in systemd unit directories")
         self.assertTrue(line and line.startswith("WARNING:"), msg=res.output)
-        line = self.getline(res, "Not all mount units are installed by the BSP")
+        line = getline(res, "Not all mount units are installed by the BSP")
         self.assertTrue(line and line.startswith("ERROR:"), msg=res.output)
 
     def test_mount_unit_not_set(self):
@@ -81,7 +81,7 @@ DISTRO_FEATURES += "systemd overlayfs"
         self.write_config(config)
 
         res = bitbake('core-image-minimal', ignore_status=True)
-        line = self.getline(res, "A recipe uses overlayfs class but there is no OVERLAYFS_MOUNT_POINT set in your MACHINE configuration")
+        line = getline(res, "A recipe uses overlayfs class but there is no OVERLAYFS_MOUNT_POINT set in your MACHINE configuration")
         self.assertTrue(line and line.startswith("Parsing recipes...ERROR:"), msg=res.output)
 
     def test_wrong_mount_unit_set(self):
@@ -104,7 +104,7 @@ OVERLAYFS_MOUNT_POINT[usr-share-overlay] = "/usr/share/overlay"
         self.set_machine_config(wrong_machine_config)
 
         res = bitbake('core-image-minimal', ignore_status=True)
-        line = self.getline(res, "Missing required mount point for OVERLAYFS_MOUNT_POINT[mnt-overlay] in your MACHINE configuration")
+        line = getline(res, "Missing required mount point for OVERLAYFS_MOUNT_POINT[mnt-overlay] in your MACHINE configuration")
         self.assertTrue(line and line.startswith("Parsing recipes...ERROR:"), msg=res.output)
 
     def test_correct_image(self):
@@ -201,11 +201,11 @@ EOT
             # /usr/share/my-application as an overlay (see overlayfs-user recipe)
             status, output = qemu.run_serial("/bin/mount -t tmpfs,overlay")
 
-            line = self.getline_qemu(output, "on /mnt/overlay")
+            line = getline_qemu(output, "on /mnt/overlay")
             self.assertTrue(line and line.startswith("tmpfs"), msg=output)
 
-            line = self.getline_qemu(output, "upperdir=/mnt/overlay/upper/usr/share/my-application")
+            line = getline_qemu(output, "upperdir=/mnt/overlay/upper/usr/share/my-application")
             self.assertTrue(line and line.startswith("overlay"), msg=output)
 
-            line = self.getline_qemu(output, "upperdir=/mnt/overlay/upper/usr/share/another-overlay-mount")
+            line = getline_qemu(output, "upperdir=/mnt/overlay/upper/usr/share/another-overlay-mount")
             self.assertTrue(line and line.startswith("overlay"), msg=output)
-- 
2.28.0


