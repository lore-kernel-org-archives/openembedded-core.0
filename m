Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFA3FC4332F
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 06:15:31 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.5177.1637302530891536442
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Nov 2021 22:15:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OZn//D8E;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id s13so16206502wrb.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Nov 2021 22:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=fWboX58baEUT6E0sAVqxpg4pDLBLCns5vd1QI1g+wsA=;
        b=OZn//D8EKcsbwOfKLqIhHMDGC7YusQQAgx6W5r1WQOmXVUWELuRvL3F6LMbCrOMrhe
         RYH5j+Ue0LqLdzDwiZDeSnIah+q+FH1Yps8j2KnYl2gIpfw/kRLqxNWdB5dgkrCizL4w
         iS5XTDtPKOX+QCKJbTXPRqoffklpAzTGfD4Eqv1CQjANkz/F+rLrqAzfAAI/NfCJi8Y9
         /WQlIJgC8JRDfaDL4oljOtOf7itme2JEYdDyXVBlfnQhSzvZaQD2N7SSdcSCSzMiue8s
         R+nV1UB0j7g7ymfm30Yfz2pFV+X7LbjXcjs7TkYOEM0iTyOVQFJ0KTqA+RQlO7BaeovL
         i4tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fWboX58baEUT6E0sAVqxpg4pDLBLCns5vd1QI1g+wsA=;
        b=A5wDwP8GPhsl4Dk99H9sZQpt70/e2t32mwvmL1hntRnOROnyj0nWKoIgqpW+9syI1x
         cKnQBMxtCpftEwr5/aDhs056l3Qabh+v2Q8zKG0QBt7OeP92DZ6ppL6qdV0Hb2D9XbZ/
         UGE7UcjB0SG/ojHlWAPvhvBjMN/S8r1OMRTE9/+FDgtEFgJaAtX918yF1bQDBPy2a98V
         CAC9zeeJWQHxgbWJTl6hCkDcUqAiD75CLdN2O2Vmu+8p0dyUXNmgZQ9BEWfTR2eOT9F8
         gKrgF/D6G1nezENRoww8Tvg5Wf6/TtUsd7ppRA+g1mKxWqhZXX+EXQOZdeuajsOTOuIR
         bk5A==
X-Gm-Message-State: AOAM5339DCdN1E6XlcJcwE3jGW3dXb+iFhC5R4JhEICFOeuU0LpH2mnQ
	mGbJrsU7bSqROqyhrTQArk4YJDRBFKDHXQ==
X-Google-Smtp-Source: 
 ABdhPJw0orZQlSFav6dJJkilq/iIXWw2w3iUqpJ9pr0OWvUQ/kgn2nQJwHQtgJI58JWm8fpLm4oXkQ==
X-Received: by 2002:a05:6000:1acd:: with SMTP id
 i13mr4421745wry.398.1637302529230;
        Thu, 18 Nov 2021 22:15:29 -0800 (PST)
Received: from slackware.local
 (dslb-002-205-007-197.002.205.pools.vodafone-ip.de. [2.205.7.197])
        by smtp.gmail.com with ESMTPSA id
 z14sm2039249wrp.70.2021.11.18.22.15.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 22:15:28 -0800 (PST)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] oeqa/selftest: unit tests for overlayfs-etc
Date: Fri, 19 Nov 2021 07:15:06 +0100
Message-Id: 
 <6ba6a5dc23e5224d5b3f23938c8bb8aad5fef9fe.1637301667.git.uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1637301667.git.uvv.mail@gmail.com>
References: <cover.1637301667.git.uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Nov 2021 06:15:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158497

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/lib/oeqa/selftest/cases/overlayfs.py | 141 ++++++++++++++++++++++
 1 file changed, 141 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/selftest/cases/overlayfs.py
index 43415778ce..4623215a47 100644
--- a/meta/lib/oeqa/selftest/cases/overlayfs.py
+++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
@@ -209,3 +209,144 @@ EOT
 
             line = getline_qemu(output, "upperdir=/mnt/overlay/upper/usr/share/another-overlay-mount")
             self.assertTrue(line and line.startswith("overlay"), msg=output)
+
+class OverlayFSEtcRunTimeTests(OESelftestTestCase):
+    """overlayfs-etc class tests"""
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


