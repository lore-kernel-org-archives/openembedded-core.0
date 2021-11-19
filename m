Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFE2CC433F5
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 06:15:30 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web08.5082.1637302530115232481
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Nov 2021 22:15:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=X9qwGlsT;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so6638421wmd.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Nov 2021 22:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3UJuFGvbVcponM0v30fZJsSx0M5YKuiVTs5mv4eTRt4=;
        b=X9qwGlsTqqtTDW+f1ZSFnXEToFaMfqmtXDZglvwRGUTOwQPXKl3IYUO9htfq+b6sr5
         9Zy/V8NFgEqDgacKe5vRd/jJQhOVR1AQU5liDuF/amrdEanri/orVEJhvyK8JDij9jnX
         cF0be9jxxtfl/us3iPli2L68T+jbmeDJjqfifTeKX4qoSMynedc7HFJSRWQCtVnDHUMe
         3RxttZotyETrk5JSTtkfTccBAr/twAvPwpzmUuENNaCDqMAmzMhKRrM+At557aAc0uIx
         PgUP9flASsRQNrmFSzeBB8GkVUKlU/9mGj52EVZQsnKRQfJhs4RmVh8+vFqF0g9uvvzW
         pD5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3UJuFGvbVcponM0v30fZJsSx0M5YKuiVTs5mv4eTRt4=;
        b=LzM8lARHwPPoW9CtPm4l73XrjC5NEvW92SkauQyvEbecX6qVDvLthaFWRBKK5qDgf3
         yk+/gnwVeOl9qeyZUVpyZkunyTS3JsupFBX9xJFDHWxt2KlDB0VQswsmwbVOSK+MjjLk
         Hm6WYoDIFdHx2VDxI7TcRGfWZeUvKz4nKff0NQrsu5Ow/3U002bHH9hqpY0Hk+hiyvnm
         lPEUA0FBYxtegHb5c+NGzMTyPLwMuZSCA9lik8Z3OW7aCbxg2ONjPv+Lt/20/J99quK6
         osY+M/SSj0fru7cjxLs9fdOALjUDkvlnSkVDKCPK9HnT4hU9Um2e1Ijbzf07J6f5G+Fm
         Ly6w==
X-Gm-Message-State: AOAM532e2UhOPtQGmWk3B5YKiW5W9+Xj6LkX8sAVKR6hNArDcirSMdCt
	QhRLpBup58O99DWJC9eieLAw+K6+Kpyypw==
X-Google-Smtp-Source: 
 ABdhPJwZ3Opn5x6OFMN4ikyq3PDUG3TG7Hh+cDqD7mSPq6wwPExkN4UkWHmtwH41z77/ROAIq+bVnA==
X-Received: by 2002:a05:600c:6006:: with SMTP id
 az6mr3915304wmb.5.1637302528437;
        Thu, 18 Nov 2021 22:15:28 -0800 (PST)
Received: from slackware.local
 (dslb-002-205-007-197.002.205.pools.vodafone-ip.de. [2.205.7.197])
        by smtp.gmail.com with ESMTPSA id
 z14sm2039249wrp.70.2021.11.18.22.15.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 22:15:28 -0800 (PST)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] oeqa/selftest: overlayfs helper function
Date: Fri, 19 Nov 2021 07:15:05 +0100
Message-Id: 
 <203b7bf770d9e77ca870d943113cd7066cbb0a3e.1637301667.git.uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1637301667.git.uvv.mail@gmail.com>
References: <cover.1637301667.git.uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Nov 2021 06:15:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158496

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


