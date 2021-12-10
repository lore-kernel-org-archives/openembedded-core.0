Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FFE8C433F5
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 11:50:39 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.6287.1639137037717720631
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 03:50:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aEBcrWGO;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id
 r9-20020a7bc089000000b00332f4abf43fso7023960wmh.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 03:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Er9qZlz51L4Iq/e4cfETjfAR1P0weozeGbbZy9LuMpk=;
        b=aEBcrWGOLP/NANv2F5AMO4qm5OiZ5YqpjxVjq+bSqGXQ1ALOKNcb87ahuoFe4HOqgR
         BCv6n6CsEO8gRdz4ilUXhBST8SEZ0yuiko9jTRbhSd7LfnTuBmrk5dNSUjOltzeuM7nF
         TZRjjDsp7kfiPZ7x4whQCkJU6k/CrIbWFS1ZKVeY7+I1jxh7nvZO1PC6pUK0bZanSrQt
         dghDwq2jAih7/EFrBC2fO7Ap20t1lYMiByg4EkFyVUTI1OtLEazm6PJ7/qE2Xhsgy74m
         xXuirRqqpphcZKf6EDlKsh9eFfREiIcOtRfyMEnJTdYWnb8Uwj+ZmMuGDMWTI1D1R0i/
         HJqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Er9qZlz51L4Iq/e4cfETjfAR1P0weozeGbbZy9LuMpk=;
        b=FiF1ncftwLOBapD8g+yGZquaaU2Ai1cj6H/LLhdJ7oXVXHGsLPLFyyXnlF6T8lawlK
         kmVpz9xEOqEpNGE9MRusRqBMCUoOrsOn0aejfPPdont9+PQ2Y8WNLXsgV40VP8+B995I
         DAfEKIhpwH/tr5UYeEatHHadwB5vNF8Hd3jg1oNXHE7piG5qq9tRBGuNNW3RjQbASngn
         vs+gqRokinNUUFxg06BZZWGkl+YXHN4ispxl5jMk0Eij+Egdd0/8XsiyONFn5l6xHu2f
         +7kDOjDS1eOnDPIBmwHHPbgvDqmm+V7CC9+c53plEvc1XeyN8yPr6nck57FUReDJtKi4
         /lSw==
X-Gm-Message-State: AOAM533svWqhdhof4uYJpEZMfW7H4kvQrLySgJqkgtVyA5KA80SVmwZc
	J1pRHB28IZLTbzficd9f4GzxyedCF0N+og==
X-Google-Smtp-Source: 
 ABdhPJzxwCh/sqG6oscC0YZpVW/6n1KiVk5tSqzP0s9+JGqEex0nmSH7697cWLZoys0YdFtRaI5SrQ==
X-Received: by 2002:a7b:c3c6:: with SMTP id t6mr15897924wmj.119.1639137035810;
        Fri, 10 Dec 2021 03:50:35 -0800 (PST)
Received: from slackware.local
 (dslb-002-205-007-123.002.205.pools.vodafone-ip.de. [2.205.7.123])
        by smtp.gmail.com with ESMTPSA id
 y6sm11496662wma.37.2021.12.10.03.50.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 03:50:35 -0800 (PST)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/8] oeqa/selftest: unit tests for overlayfs-etc
Date: Fri, 10 Dec 2021 12:50:25 +0100
Message-Id: 
 <83c3860c58f9c621bd76166365fd0be107bd762f.1639136706.git.uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1639136706.git.uvv.mail@gmail.com>
References: <cover.1639136706.git.uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 11:50:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159504

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/lib/oeqa/selftest/cases/overlayfs.py | 184 ++++++++++++++++++++++
 1 file changed, 184 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/selftest/cases/overlayfs.py
index 43415778ce..82007fade7 100644
--- a/meta/lib/oeqa/selftest/cases/overlayfs.py
+++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
@@ -209,3 +209,187 @@ EOT
 
             line = getline_qemu(output, "upperdir=/mnt/overlay/upper/usr/share/another-overlay-mount")
             self.assertTrue(line and line.startswith("overlay"), msg=output)
+
+class OverlayFSEtcRunTimeTests(OESelftestTestCase):
+    """overlayfs-etc class tests"""
+
+    def test_all_required_variables_set(self):
+        """
+        Summary:   Check that required variables are set
+        Expected:  Fail when any of required variables is missing
+        Author:    Vyacheslav Yurkov <uvv.mail@gmail.com>
+        """
+
+        configBase = """
+DISTRO_FEATURES += "systemd"
+
+# Use systemd as init manager
+VIRTUAL-RUNTIME_init_manager = "systemd"
+
+# enable overlayfs in the kernel
+KERNEL_EXTRA_FEATURES:append = " features/overlayfs/overlayfs.scc"
+
+# Image configuration for overlayfs-etc
+EXTRA_IMAGE_FEATURES += "overlayfs-etc"
+IMAGE_FEATURES:remove = "package-management"
+"""
+        configMountPoint = """
+OVERLAYFS_ETC_MOUNT_POINT = "/data"
+"""
+        configDevice = """
+OVERLAYFS_ETC_DEVICE = "/dev/mmcblk0p1"
+"""
+
+        self.write_config(configBase)
+        res = bitbake('core-image-minimal', ignore_status=True)
+        line = getline(res, "OVERLAYFS_ETC_MOUNT_POINT must be set in your MACHINE configuration")
+        self.assertTrue(line, msg=res.output)
+
+        self.append_config(configMountPoint)
+        res = bitbake('core-image-minimal', ignore_status=True)
+        line = getline(res, "OVERLAYFS_ETC_DEVICE must be set in your MACHINE configuration")
+        self.assertTrue(line, msg=res.output)
+
+        self.append_config(configDevice)
+        res = bitbake('core-image-minimal', ignore_status=True)
+        line = getline(res, "OVERLAYFS_ETC_FSTYPE should contain a valid file system type on /dev/mmcblk0p1")
+        self.assertTrue(line, msg=res.output)
+
+    def test_image_feature_conflict(self):
+        """
+        Summary:   Overlayfs-etc is not allowed to be used with package-management
+        Expected:  Feature conflict
+        Author:    Vyacheslav Yurkov <uvv.mail@gmail.com>
+        """
+
+        config = """
+DISTRO_FEATURES += "systemd"
+
+# Use systemd as init manager
+VIRTUAL-RUNTIME_init_manager = "systemd"
+
+# enable overlayfs in the kernel
+KERNEL_EXTRA_FEATURES:append = " features/overlayfs/overlayfs.scc"
+EXTRA_IMAGE_FEATURES += "overlayfs-etc"
+EXTRA_IMAGE_FEATURES += "package-management"
+"""
+
+        self.write_config(config)
+
+        res = bitbake('core-image-minimal', ignore_status=True)
+        line = getline(res, "contains conflicting IMAGE_FEATURES")
+        self.assertTrue("overlayfs-etc" in res.output, msg=res.output)
+        self.assertTrue("package-management" in res.output, msg=res.output)
+
+    def test_image_feature_is_missing_class_included(self):
+        configAppend = """
+INHERIT += "overlayfs-etc"
+"""
+        self.run_check_image_feature(configAppend)
+
+    def test_image_feature_is_missing(self):
+        self.run_check_image_feature()
+
+    def run_check_image_feature(self, appendToConfig=""):
+        """
+        Summary:   Overlayfs-etc class is not applied when image feature is not set
+                   even if we inherit it directly,
+        Expected:  Image is created successfully but /etc is not an overlay
+        Author:    Vyacheslav Yurkov <uvv.mail@gmail.com>
+        """
+
+        config = f"""
+DISTRO_FEATURES += "systemd"
+
+# Use systemd as init manager
+VIRTUAL-RUNTIME_init_manager = "systemd"
+
+# enable overlayfs in the kernel
+KERNEL_EXTRA_FEATURES:append = " features/overlayfs/overlayfs.scc"
+
+IMAGE_FSTYPES += "wic"
+WKS_FILE = "overlayfs_etc.wks.in"
+
+EXTRA_IMAGE_FEATURES += "read-only-rootfs"
+# Image configuration for overlayfs-etc
+OVERLAYFS_ETC_MOUNT_POINT = "/data"
+OVERLAYFS_ETC_DEVICE = "/dev/sda3"
+{appendToConfig}
+"""
+
+        self.write_config(config)
+
+        bitbake('core-image-minimal')
+
+        with runqemu('core-image-minimal', image_fstype='wic') as qemu:
+            status, output = qemu.run_serial("/bin/mount")
+
+            line = getline_qemu(output, "upperdir=/data/overlay-etc/upper")
+            self.assertFalse(line, msg=output)
+
+    def test_sbin_init_preinit(self):
+        self.run_sbin_init(False)
+
+    def test_sbin_init_original(self):
+        self.run_sbin_init(True)
+
+    def run_sbin_init(self, origInit):
+        """
+        Summary:   Confirm we can replace original init and mount overlay on top of /etc
+        Expected:  Image is created successfully and /etc is mounted as an overlay
+        Author:    Vyacheslav Yurkov <uvv.mail@gmail.com>
+        """
+
+        config = """
+DISTRO_FEATURES += "systemd"
+
+# Use systemd as init manager
+VIRTUAL-RUNTIME_init_manager = "systemd"
+
+# enable overlayfs in the kernel
+KERNEL_EXTRA_FEATURES:append = " features/overlayfs/overlayfs.scc"
+
+IMAGE_FSTYPES += "wic"
+OVERLAYFS_INIT_OPTION = "{OVERLAYFS_INIT_OPTION}"
+WKS_FILE = "overlayfs_etc.wks.in"
+
+EXTRA_IMAGE_FEATURES += "read-only-rootfs"
+# Image configuration for overlayfs-etc
+EXTRA_IMAGE_FEATURES += "overlayfs-etc"
+IMAGE_FEATURES:remove = "package-management"
+OVERLAYFS_ETC_MOUNT_POINT = "/data"
+OVERLAYFS_ETC_FSTYPE = "ext4"
+OVERLAYFS_ETC_DEVICE = "/dev/sda3"
+OVERLAYFS_ETC_USE_ORIG_INIT_NAME = "{OVERLAYFS_ETC_USE_ORIG_INIT_NAME}"
+"""
+
+        args = {
+            'OVERLAYFS_INIT_OPTION': "" if origInit else "init=/sbin/preinit",
+            'OVERLAYFS_ETC_USE_ORIG_INIT_NAME': int(origInit == True)
+        }
+
+        self.write_config(config.format(**args))
+
+        bitbake('core-image-minimal')
+        testFile = "/etc/my-test-data"
+
+        with runqemu('core-image-minimal', image_fstype='wic', discard_writes=False) as qemu:
+            status, output = qemu.run_serial("/bin/mount")
+
+            line = getline_qemu(output, "/dev/sda3")
+            self.assertTrue("/data" in output, msg=output)
+
+            line = getline_qemu(output, "upperdir=/data/overlay-etc/upper")
+            self.assertTrue(line and line.startswith("/data/overlay-etc/upper on /etc type overlay"), msg=output)
+
+            status, output = qemu.run_serial("touch " + testFile)
+            status, output = qemu.run_serial("sync")
+            status, output = qemu.run_serial("ls -1 " + testFile)
+            line = getline_qemu(output, testFile)
+            self.assertTrue(line and line.startswith(testFile), msg=output)
+
+        # Check that file exists in /etc after reboot
+        with runqemu('core-image-minimal', image_fstype='wic') as qemu:
+            status, output = qemu.run_serial("ls -1 " + testFile)
+            line = getline_qemu(output, testFile)
+            self.assertTrue(line and line.startswith(testFile), msg=output)
-- 
2.28.0


