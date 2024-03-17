Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A142C54E67
	for <webhook@archiver.kernel.org>; Sun, 17 Mar 2024 19:33:58 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.26272.1710704037846596138
 for <Openembedded-core@lists.openembedded.org>;
 Sun, 17 Mar 2024 12:33:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gbzoj2tL;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-41411421113so507935e9.1
        for <Openembedded-core@lists.openembedded.org>; Sun, 17 Mar 2024 12:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710704036; x=1711308836; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jn/Hsocnc3WjY/W45tgK7wHa6F7mtZOQwkONwUqBMqU=;
        b=gbzoj2tLf6TuaRxKlbhBdqePAfyHblPfRFc40cSLn3thsxjYK18o/sowx18TgGdAnM
         /MQ8RCm6pASR+l+vEG68K+x5855LDL4jFdt4hbfCOlmNRBDvfvEUKbT3k9wPx8+US0y6
         LYpXsBdki/M8iQ8uapEhsLqfUbxdXz6EWwzxVDQkCMSLlA5ttCqar1k2r69vyiNVNvim
         p8J4rUSVngyPhgwbmyoo8az+8aw1uqHkqZt4/r7EeR5IvjYfwxfxPVLqYtvIdB60HJq3
         JXTtVwof3qcbLIfAkNWCKD8p+Lw+EEcUCnajGB30cGP/JWNQIJbVGDAp+Y4RhRM768XE
         VgXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710704036; x=1711308836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jn/Hsocnc3WjY/W45tgK7wHa6F7mtZOQwkONwUqBMqU=;
        b=GdxxwUBNVmZYn4/b9qQPm5S9z78Z9QOizGMe8JzyCyK1mTgFjSpCK8ql8nSXmKnE0P
         nO2BZschCRzujdtGlJWNZ9844ixKWlhoLnRnBCamJYm20i+WaXjJ818wswxesDSxD/uE
         Dk0CRDVcFwfRj7+VTimbmJ6vPWNdvodyY8BYKSfQj1KruhRK4PzSkiT9h3kWgCotbvgF
         MgM2Y6cGg/ZwoJYfqSRFCBZGNxR1vflVKSqAjkB4+CM/1JhSNbqpVJf40H3U0k1Knwtt
         gDYdgfDb3qFIKfhe/61dy73FeMyqyluqHcU5flsF10HBTeqqtLY5MRUI8H9Qx7va8GQ3
         JSfA==
X-Gm-Message-State: AOJu0YyOfNw1XvjWowQQ0qKq0QoQzQobTlB1z6LNiwPrZV5uhg7tpaeZ
	24ZpYYpfqDcnsFXMR3GSnRpfZKmxqCe/XF8g+6lc+ccUyXyxCNNLJMVgKrHxiEE=
X-Google-Smtp-Source: AGHT+IGAtSrgfDEZaAiYsiBDfBOl7Hs8O4i7hgOOPCP+bhpssmTZ/8tXx4oT0zgtfyX36L+/eGcxCg==
X-Received: by 2002:a05:600c:198a:b0:414:726:87d9 with SMTP id t10-20020a05600c198a00b00414072687d9mr3625468wmq.12.1710704035700;
        Sun, 17 Mar 2024 12:33:55 -0700 (PDT)
Received: from uvv-2004-vm.localdomain (dslb-002-205-242-072.002.205.pools.vodafone-ip.de. [2.205.242.72])
        by smtp.gmail.com with ESMTPSA id p10-20020a05600c1d8a00b004140a7cde17sm3647230wms.26.2024.03.17.12.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 12:33:55 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Baruch Siach <baruch@tkos.co.il>,
	Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH] oeqa/selftest/overlayfs: test read-only rootfs
Date: Sun, 17 Mar 2024 20:33:25 +0100
Message-Id: <20240317193325.3709968-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Mar 2024 19:33:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197270

From: Baruch Siach <baruch@tkos.co.il>

Use the read-only squashfs filesystem to test the read-only case.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta-selftest/wic/overlayfs_etc.wks.in    |  4 +--
 meta/lib/oeqa/selftest/cases/overlayfs.py | 34 +++++++++++++++++++----
 2 files changed, 30 insertions(+), 8 deletions(-)

diff --git a/meta-selftest/wic/overlayfs_etc.wks.in b/meta-selftest/wic/overlayfs_etc.wks.in
index 1e1e5836e7..066cd35b15 100644
--- a/meta-selftest/wic/overlayfs_etc.wks.in
+++ b/meta-selftest/wic/overlayfs_etc.wks.in
@@ -1,4 +1,4 @@
 part /boot --active --source bootimg-biosplusefi --ondisk sda --sourceparams="loader=grub-efi" --align 1024
-part / --source rootfs --ondisk sda --fstype=ext4 --use-uuid --align 1024
+part / --source rootfs --ondisk sda --fstype=${OVERLAYFS_ROOTFS_TYPE} --use-uuid --align 1024
 part --ondisk sda --fstype=ext4 --size=5 --align 1024
-bootloader --ptable gpt --timeout=1 --append="rootfstype=ext4 console=ttyS0,115200 console=tty0 ${OVERLAYFS_INIT_OPTION}"
+bootloader --ptable gpt --timeout=1 --append="rootfstype=${OVERLAYFS_ROOTFS_TYPE} console=ttyS0,115200 console=tty0 ${OVERLAYFS_INIT_OPTION}"
diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/selftest/cases/overlayfs.py
index cd0dc60c64..e31063567b 100644
--- a/meta/lib/oeqa/selftest/cases/overlayfs.py
+++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
@@ -353,6 +353,7 @@ EXTRA_IMAGE_FEATURES += "read-only-rootfs"
 # Image configuration for overlayfs-etc
 OVERLAYFS_ETC_MOUNT_POINT = "/data"
 OVERLAYFS_ETC_DEVICE = "/dev/sda3"
+OVERLAYFS_ROOTFS_TYPE = "ext4"
 """
 
         self.write_config(config)
@@ -367,13 +368,17 @@ OVERLAYFS_ETC_DEVICE = "/dev/sda3"
 
     @skipIfNotMachine("qemux86-64", "tests are qemux86-64 specific currently")
     def test_sbin_init_preinit(self):
-        self.run_sbin_init(False)
+        self.run_sbin_init(False, "ext4")
 
     @skipIfNotMachine("qemux86-64", "tests are qemux86-64 specific currently")
     def test_sbin_init_original(self):
-        self.run_sbin_init(True)
+        self.run_sbin_init(True, "ext4")
 
-    def run_sbin_init(self, origInit):
+    @skipIfNotMachine("qemux86-64", "tests are qemux86-64 specific currently")
+    def test_sbin_init_read_only(self):
+        self.run_sbin_init(True, "squashfs")
+
+    def run_sbin_init(self, origInit, rootfsType):
         """
         Summary:   Confirm we can replace original init and mount overlay on top of /etc
         Expected:  Image is created successfully and /etc is mounted as an overlay
@@ -384,7 +389,9 @@ OVERLAYFS_ETC_DEVICE = "/dev/sda3"
 
         args = {
             'OVERLAYFS_INIT_OPTION': "" if origInit else "init=/sbin/preinit",
-            'OVERLAYFS_ETC_USE_ORIG_INIT_NAME': int(origInit == True)
+            'OVERLAYFS_ETC_USE_ORIG_INIT_NAME': int(origInit == True),
+            'OVERLAYFS_ROOTFS_TYPE': rootfsType,
+            'OVERLAYFS_ETC_CREATE_MOUNT_DIRS': int(rootfsType == "ext4")
         }
 
         self.write_config(config.format(**args))
@@ -437,7 +444,9 @@ IMAGE_INSTALL:append = " overlayfs-user"
 
         args = {
             'OVERLAYFS_INIT_OPTION': "",
-            'OVERLAYFS_ETC_USE_ORIG_INIT_NAME': 1
+            'OVERLAYFS_ETC_USE_ORIG_INIT_NAME': 1,
+            'OVERLAYFS_ROOTFS_TYPE': "ext4",
+            'OVERLAYFS_ETC_CREATE_MOUNT_DIRS': 1
         }
 
         self.write_config(config.format(**args))
@@ -463,10 +472,14 @@ IMAGE_INSTALL:append = " overlayfs-user"
 INIT_MANAGER = "systemd"
 
 # enable overlayfs in the kernel
-KERNEL_EXTRA_FEATURES:append = " features/overlayfs/overlayfs.scc"
+KERNEL_EXTRA_FEATURES:append = " \
+    features/overlayfs/overlayfs.scc \
+    cfg/fs/squashfs.scc"
 
 IMAGE_FSTYPES += "wic"
 OVERLAYFS_INIT_OPTION = "{OVERLAYFS_INIT_OPTION}"
+OVERLAYFS_ROOTFS_TYPE = "{OVERLAYFS_ROOTFS_TYPE}"
+OVERLAYFS_ETC_CREATE_MOUNT_DIRS = "{OVERLAYFS_ETC_CREATE_MOUNT_DIRS}"
 WKS_FILE = "overlayfs_etc.wks.in"
 
 EXTRA_IMAGE_FEATURES += "read-only-rootfs"
@@ -477,4 +490,13 @@ OVERLAYFS_ETC_MOUNT_POINT = "/data"
 OVERLAYFS_ETC_FSTYPE = "ext4"
 OVERLAYFS_ETC_DEVICE = "/dev/sda3"
 OVERLAYFS_ETC_USE_ORIG_INIT_NAME = "{OVERLAYFS_ETC_USE_ORIG_INIT_NAME}"
+
+ROOTFS_POSTPROCESS_COMMAND += "{OVERLAYFS_ROOTFS_TYPE}_rootfs"
+
+ext4_rootfs() {{
+}}
+
+squashfs_rootfs() {{
+    mkdir -p ${{IMAGE_ROOTFS}}/data
+}}
 """
-- 
2.25.1


