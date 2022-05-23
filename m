Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3366C433F5
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 14:00:44 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web09.28092.1653314435332714805
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 07:00:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=V7ss1MJb;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id j21so13553026pga.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 07:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ykNbNEJzrSwEUg/Xpn6mc9XPFaAJpV/S6Eo0bRlI9Uc=;
        b=V7ss1MJb1jnFty16Pyo/BwCheDnSQkbUuqFZNhKIgwJT8YzaK9lTKj0Stk4qpvMPUC
         IaMgC2qkdKdDb3+rDQ8Ts7eFrNa4zJCkrQX3GX0EyneGGfj8rnplrj1/w3ELgBB4YKVe
         fGcea5Q/4ob3OM0J28WofO9zV7ZhkiijfkCu7wUCp7+yALXM9ihpcIaSQUCXWeas5pNm
         +IVhpbEFptXlGViwP2wDNL4jOKpko2a17S01U/7IU4OnrUEhN4+sGJL+GBmoKORxRmNG
         pLLHRcLiP7eRgT6/PBdL8s9pFTSSJ6hbP4Yjeu1lirvbMjmicmii1nsADy/lB7fwUDht
         ikNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ykNbNEJzrSwEUg/Xpn6mc9XPFaAJpV/S6Eo0bRlI9Uc=;
        b=fyOtYdYLMl8nuGPCsuoOpeZLz45T9ZSElg/TBHndLTCQOrcwQbKhxdyGDAi7TspNfQ
         IjIWwyOu7lmEDTF0IFhOnXD+O5Bhk4ONaltUxbTnmnF/nxqkyMVoq6opNiUbD0vTXqw4
         uHbHsFDqye8Yjq5n7yj0F5IaEH7SJekfhro6BtD1obxhbUTNrMZgO9kRD/N0Gl+MzHJL
         Cy9VUDBia84WHOkbw/GCJP8TFei88aAXOPg+dmX4Mg3NTdYBMGz+C/NaSyeeXkFcw2tD
         Zg8VGamLmPKKPSFqC1zUPBah2RkriwiQXwAWXjKNZ3FbeO23FC7t4IRyRPaS7N+TSBzR
         elPQ==
X-Gm-Message-State: AOAM533+K2z/1nuq3/4jm39QaZQ+gXGLMOOepdi8Uk9RF4ZVfYauCtz5
	iMfPBnWDCPCwKFuEtCEIS1lLoJnCnouqQEG6
X-Google-Smtp-Source: 
 ABdhPJyT4/ndcE1m2sqzgGkWVs219KpfrZ54ET9zrHVmtdCxpuDN46mIc2pJdfas0I4Ire/OiIz4jw==
X-Received: by 2002:a62:ea17:0:b0:50d:8d25:a17 with SMTP id
 t23-20020a62ea17000000b0050d8d250a17mr23744440pfh.67.1653314434045;
        Mon, 23 May 2022 07:00:34 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 m10-20020a637d4a000000b003c14af505fcsm4778952pgn.20.2022.05.23.07.00.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 07:00:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 7/9] classes: rootfs-postcommands: add skip
 option to overlayfs_qa_check
Date: Mon, 23 May 2022 03:59:46 -1000
Message-Id: 
 <34b6d6b5f078c6948e53815af3c7b61de43d851c.1653313955.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1653313955.git.steve@sakoman.com>
References: <cover.1653313955.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 May 2022 14:00:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166030

From: Claudius Heine <ch@denx.de>

The overlayfs_qa_check checks if the current root file system has a
mount configured for each overlayfs, when the overlayfs class is used.

However there are certain instances where this mount point is created at
runtime and not static in a fstab entry or systemd mount unit.

One such case would be if overlayfs-etc is used, where the device is
mounted in the preinit script and not via a mount unit or fstab entry.

However there are other possibilities for this as well, like startup
scripts that support a dynamic partition layout. For instance when
systemd-repart is used.

This adds the `OVERLAYFS_QA_SKIP` variable, which allows to define QA
skips via its flags. In principle it supports multiple QA skip flags
separated by whitespace, but only one (`mount-configured`) is
implemented here. To skip this QA check simply add `mount-configured` to
the flag of `OVERLAYFS_QA_SKIP` with the same name. For instance if a
overlayfs is configured as:

	OVERLAYFS_MOUNT_POINT[data] = "/data"

Skipping this QA check can be done by setting:

	OVERLAYFS_QA_SKIP[data] = "mount-configured"

Also add a testcase and fix a typo (fstat -> fstab).

Signed-off-by: Claudius Heine <ch@denx.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2ce9173169a2a86392c4a85fe9be7fbbd7353b7f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/rootfs-postcommands.bbclass  | 10 ++++++++--
 meta/lib/oeqa/selftest/cases/overlayfs.py | 20 +++++++++++++++++++-
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index 63e716c955..d302c23cf4 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -400,6 +400,10 @@ python overlayfs_qa_check() {
 
     allUnitExist = True;
     for mountPoint in overlayMountPoints:
+        qaSkip = (d.getVarFlag("OVERLAYFS_QA_SKIP", mountPoint) or "").split()
+        if "mount-configured" in qaSkip:
+            continue
+
         mountPath = d.getVarFlag('OVERLAYFS_MOUNT_POINT', mountPoint)
         if mountPath in fstabDevices:
             continue
@@ -409,8 +413,10 @@ python overlayfs_qa_check() {
                for dirpath in searchpaths):
             continue
 
-        bb.warn('Mount path %s not found in fstat and unit %s not found '
-                'in systemd unit directories' % (mountPath, mountUnit))
+        bb.warn(f'Mount path {mountPath} not found in fstab and unit '
+                f'{mountUnit} not found in systemd unit directories.')
+        bb.warn(f'Skip this check by setting OVERLAYFS_QA_SKIP[{mountPoint}] = '
+                '"mount-configured"')
         allUnitExist = False;
 
     if not allUnitExist:
diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/selftest/cases/overlayfs.py
index 472746a64f..ce1d2f1ec3 100644
--- a/meta/lib/oeqa/selftest/cases/overlayfs.py
+++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
@@ -62,11 +62,29 @@ DISTRO_FEATURES += "systemd overlayfs"
         self.add_overlay_conf_to_machine()
 
         res = bitbake('core-image-minimal', ignore_status=True)
-        line = getline(res, " Mount path /mnt/overlay not found in fstat and unit mnt-overlay.mount not found in systemd unit directories")
+        line = getline(res, " Mount path /mnt/overlay not found in fstab and unit mnt-overlay.mount not found in systemd unit directories")
         self.assertTrue(line and line.startswith("WARNING:"), msg=res.output)
         line = getline(res, "Not all mount paths and units are installed in the image")
         self.assertTrue(line and line.startswith("ERROR:"), msg=res.output)
 
+    def test_not_all_units_installed_but_qa_skipped(self):
+        """
+        Summary:   Test skipping the QA check
+        Expected:  Image is created successfully
+        Author:    Claudius Heine <ch@denx.de>
+        """
+
+        config = """
+IMAGE_INSTALL:append = " overlayfs-user"
+DISTRO_FEATURES += "systemd overlayfs"
+OVERLAYFS_QA_SKIP[mnt-overlay] = "mount-configured"
+"""
+
+        self.write_config(config)
+        self.add_overlay_conf_to_machine()
+
+        bitbake('core-image-minimal')
+
     def test_mount_unit_not_set(self):
         """
         Summary:   Test whether mount unit was set properly
-- 
2.25.1


