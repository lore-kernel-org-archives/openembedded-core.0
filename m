Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37A79C433FE
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 13:01:57 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web08.6835.1639141316384587179
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 05:01:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HNr5Hvym;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id p18so6744500wmq.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 05:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3UJuFGvbVcponM0v30fZJsSx0M5YKuiVTs5mv4eTRt4=;
        b=HNr5HvymMoy9nqiANHdIvqGgP59qfftDx87ju8U9y125SR3DllbkAo2DEg7EDIE9XZ
         N6YSqGi6nn1NzntOe8dhLWPrxSW0rcuVHtcLMU0HiMhmpOUbBTOmXsKbCo91LrrDYv7Z
         Sgy5FVNCgGqyJPQRVckAjmtaMbSkO6Q+NWBAFn1myLI7XW+yhGOPSiYxHgz2qlxa5nEy
         SYXIeWyoLgVlWuMBuFQuWSaCx7vfbL/cFY28GdkZWXvYVFiI8wSdHTiGK0kjNIrfvDZ6
         KU5PZc5Fb2ctO3Z/iZBtRTuE/y2T1JN8iveR9RV+ng5d5sEaXHvzCCZTjORvPA6T92KT
         9u6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3UJuFGvbVcponM0v30fZJsSx0M5YKuiVTs5mv4eTRt4=;
        b=JIwh7LKSCS2s6TGrJgh2lTYByrvnhz/c+lc2PrST292V9TIRj0ZPF8neklo39HudK1
         q9wPDbzvDsfeI845Jo2v5tTIb9WeKbcHaJJm+sqYiobVeSFQOxhhrdwPm91LAx7sUPH+
         JpBsAkLB/3mCzk0Dy4xxUN48vYywfus/MnLQvr75jaOHsiCZQB2aFVttmrejzvsBJMm2
         s5uarzhL4MjJ4N8gXH9bpupuNPiC7D+kYVo4tyAcYqsJAJD8V3fdduJ6tcYdzR+gPZR5
         czJf3hFQT9C1kYoVwso4Hw//I4g1jWPhKeVE4PeoSWKoVRqe7IlQsBN8l0aFFC6gvcor
         sXyA==
X-Gm-Message-State: AOAM532WsBRytKoh1boqoVTS28qsBlkwC28DaGD2ZTtZIKprL5PFPIIN
	Y4DeOXYdam8JqWzvifS0H2HVYjXmpoTwUg==
X-Google-Smtp-Source: 
 ABdhPJxVClZolEBWUbJPUZevD8V1lcJ6TuOCSiXOWd92cau32y/17n5QuClPx2/UAu4WzNBK1+pbYw==
X-Received: by 2002:a05:600c:202:: with SMTP id
 2mr16139696wmi.134.1639141314425;
        Fri, 10 Dec 2021 05:01:54 -0800 (PST)
Received: from slackware.local
 (dslb-002-205-007-123.002.205.pools.vodafone-ip.de. [2.205.7.123])
        by smtp.gmail.com with ESMTPSA id
 d2sm2899653wmb.31.2021.12.10.05.01.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 05:01:53 -0800 (PST)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/8] oeqa/selftest: overlayfs helper function
Date: Fri, 10 Dec 2021 14:01:42 +0100
Message-Id: 
 <65c0ce9cfa72ecdc08cafbc1681b9c57c81c5452.1639141237.git.uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1639141237.git.uvv.mail@gmail.com>
References: <cover.1639141237.git.uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 13:01:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159514

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


