Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web12.55.1626378005220523272
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 12:40:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GTAQQmPu;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id u8-20020a7bcb080000b02901e44e9caa2aso4352280wmj.4
        for <Openembedded-core@lists.openembedded.org>; Thu, 15 Jul 2021 12:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=36XJMgPpHrUN0WWLD7YWYVFSPm8vMNSeYK+pQVCOFMQ=;
        b=GTAQQmPu6lZok82Oqe4SDd8HMG3w/TVe3r/QGFwOXxc0gxtu641xFNqUdGR+DMlLS+
         j3AEAlOvuxsi0i9raHfepm8L10zo+BX+zYqSMaWSZMwaJjoxOl2cFqVEDUKSvJCnUJnV
         B2PzLpjJ5E51eO4pivrhj1o1y3mu5PxWaBhKZYaireYuwg8PmqDdHRPWg8hpaLORjdc5
         62+9AwsEJk9k5hl9OwWiKwIZWh2sdITKlSMorEtgq+KpCZFu3DlTUemyRm3scP0x+iFL
         XD+qJid9pxB88ZZQHN7y+KlIJU3GBfy5garQ5gNJfAtGjPftn/VTvCd86l5shWMWi/us
         4ndw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=36XJMgPpHrUN0WWLD7YWYVFSPm8vMNSeYK+pQVCOFMQ=;
        b=kdLpHsdSUEltArPwPnyi7/osHzf+AzD1JCvMiTRcjHr7DRbx1EmqFFBgf47dA30MJy
         TjfRF434BR4M40oMIxOMaU2OOwfm/nKfUnGgXLgE1Uq2pzAGAJyDzlwuCtAXsocK8wBe
         c3NefBCFuAEq/QuHpDrfLTdDaa46uu5xE1UL4l1ixflVDckewPb2TIfjI3ThaheNHeG9
         4HnmepCyFChXRdq/YfGzjpE7Pm6MDIatrZ93wG5z/TuUbsTMiyfU6gDLTMt3YQNK7zeb
         JoHjoCw/O2k9KL7J3Q5oZr3elQUrM4flGb4XK4Ffy3TL34rO12bei3yioiyDdfvzV6o1
         /oOQ==
X-Gm-Message-State: AOAM531MbCvwpIvJq/Z7ajTi75iD1dQzISAsUlTog6zX/UJqWqkVFviS
	law8gOWzWtEqkO5c/8scxv47/i43YMUzfA==
X-Google-Smtp-Source: ABdhPJwdEV16vTyfs6DdZ20M7i0SdqTa3GGFF5x20vfy5iEsRLvKeWA0PldsPIoRDZ3BfXOqi2iy+A==
X-Received: by 2002:a1c:494:: with SMTP id 142mr6380949wme.60.1626378003550;
        Thu, 15 Jul 2021 12:40:03 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from slackware.local ([194.99.105.68])
        by smtp.gmail.com with ESMTPSA id p11sm7533809wrw.53.2021.07.15.12.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 12:40:03 -0700 (PDT)
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v3 7/8] oeqa/selftest: overlayfs unit tests
Date: Thu, 15 Jul 2021 21:39:32 +0200
Message-Id: <20210715193933.66120-7-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210715193933.66120-1-uvv.mail@gmail.com>
References: <20210715193933.66120-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unit tests for overlayfs.bbclass

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/lib/oeqa/selftest/cases/overlayfs.py | 171 ++++++++++++++++++++++
 1 file changed, 171 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/overlayfs.py

diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/selftest/cases/overlayfs.py
new file mode 100644
index 0000000000..f679a71182
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
@@ -0,0 +1,171 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var, runqemu
+
+class OverlayFSTests(OESelftestTestCase):
+    """Overlayfs class usage tests"""
+
+    def getline(self, res, line):
+        for l in res.output.split('\n'):
+            if line in l:
+                return l
+
+    def add_overlay_conf_to_machine(self):
+        machine_inc = """
+OVERLAYFS_MOUNT_POINT[mnt-overlay] = "/mnt/overlay"
+"""
+        self.set_machine_config(machine_inc)
+
+    def test_distro_features_missing(self):
+        """
+        Summary:   Check that required DISTRO_FEATURES are set
+        Expected:  Fail when either systemd or overlayfs are not in DISTRO_FEATURES
+        Author:    Vyacheslav Yurkov <uvv.mail@gmail.com>
+        """
+
+        config = """
+IMAGE_INSTALL_append = " overlayfs-user"
+"""
+        overlayfs_recipe_append = """
+inherit overlayfs
+"""
+        self.write_config(config)
+        self.add_overlay_conf_to_machine()
+        self.write_recipeinc('overlayfs-user', overlayfs_recipe_append)
+
+        res = bitbake('core-image-minimal', ignore_status=True)
+        line = self.getline(res, "overlayfs-user was skipped: missing required distro features")
+        self.assertTrue("overlayfs" in res.output, msg=res.output)
+        self.assertTrue("systemd" in res.output, msg=res.output)
+        self.assertTrue("ERROR: Required build target 'core-image-minimal' has no buildable providers." in res.output, msg=res.output)
+
+    def test_not_all_units_installed(self):
+        """
+        Summary:   Test QA check that we have required mount units in the image
+        Expected:  Fail because mount unit for overlay partition is not installed
+        Author:    Vyacheslav Yurkov <uvv.mail@gmail.com>
+        """
+
+        config = """
+IMAGE_INSTALL_append = " overlayfs-user"
+DISTRO_FEATURES += "systemd overlayfs"
+"""
+
+        self.write_config(config)
+        self.add_overlay_conf_to_machine()
+
+        res = bitbake('core-image-minimal', ignore_status=True)
+        line = self.getline(res, "Unit name mnt-overlay.mount not found in systemd unit directories")
+        self.assertTrue(line and line.startswith("WARNING:"), msg=res.output)
+        line = self.getline(res, "Not all mount units are installed by the BSP")
+        self.assertTrue(line and line.startswith("ERROR:"), msg=res.output)
+
+    def test_mount_unit_not_set(self):
+        """
+        Summary:   Test whether mount unit was set properly
+        Expected:  Fail because mount unit was not set
+        Author:    Vyacheslav Yurkov <uvv.mail@gmail.com>
+        """
+
+        config = """
+IMAGE_INSTALL_append = " overlayfs-user"
+DISTRO_FEATURES += "systemd overlayfs"
+"""
+
+        self.write_config(config)
+
+        res = bitbake('core-image-minimal', ignore_status=True)
+        line = self.getline(res, "A recipe uses overlayfs class but there is no OVERLAYFS_MOUNT_POINT set in your MACHINE configuration")
+        self.assertTrue(line and line.startswith("Parsing recipes...ERROR:"), msg=res.output)
+
+    def test_wrong_mount_unit_set(self):
+        """
+        Summary:   Test whether mount unit was set properly
+        Expected:  Fail because not the correct flag used for mount unit
+        Author:    Vyacheslav Yurkov <uvv.mail@gmail.com>
+        """
+
+        config = """
+IMAGE_INSTALL_append = " overlayfs-user"
+DISTRO_FEATURES += "systemd overlayfs"
+"""
+
+        wrong_machine_config = """
+OVERLAYFS_MOUNT_POINT[usr-share-overlay] = "/usr/share/overlay"
+"""
+
+        self.write_config(config)
+        self.set_machine_config(wrong_machine_config)
+
+        res = bitbake('core-image-minimal', ignore_status=True)
+        line = self.getline(res, "Missing required mount point for OVERLAYFS_MOUNT_POINT[mnt-overlay] in your MACHINE configuration")
+        self.assertTrue(line and line.startswith("Parsing recipes...ERROR:"), msg=res.output)
+
+    def test_correct_image(self):
+        """
+        Summary:   Check that we can create an image when all parameters are
+                   set correctly
+        Expected:  Image is created successfully
+        Author:    Vyacheslav Yurkov <uvv.mail@gmail.com>
+        """
+
+        config = """
+IMAGE_INSTALL_append = " overlayfs-user systemd-machine-units"
+DISTRO_FEATURES += "systemd overlayfs"
+
+# Use systemd as init manager
+VIRTUAL-RUNTIME_init_manager = "systemd"
+
+# enable overlayfs in the kernel
+KERNEL_EXTRA_FEATURES_append = " features/overlayfs/overlayfs.scc"
+"""
+
+        systemd_machine_unit_append = """
+SYSTEMD_SERVICE_${PN} += " \
+    mnt-overlay.mount \
+"
+
+do_install_append() {
+    install -d ${D}${systemd_system_unitdir}
+    cat <<EOT > ${D}${systemd_system_unitdir}/mnt-overlay.mount
+[Unit]
+Description=Tmpfs directory
+DefaultDependencies=no
+
+[Mount]
+What=tmpfs
+Where=/mnt/overlay
+Type=tmpfs
+Options=mode=1777,strictatime,nosuid,nodev
+
+[Install]
+WantedBy=multi-user.target
+EOT
+}
+
+"""
+
+        self.write_config(config)
+        self.add_overlay_conf_to_machine()
+        self.write_recipeinc('systemd-machine-units', systemd_machine_unit_append)
+
+        bitbake('core-image-minimal')
+
+        def getline_qemu(out, line):
+            for l in out.split('\n'):
+                if line in l:
+                    return l
+
+        with runqemu('core-image-minimal') as qemu:
+            # Check that we have /mnt/overlay fs mounted as tmpfs and
+            # /usr/share/my-application as an overlay (see overlayfs-user recipe)
+            status, output = qemu.run_serial("/bin/mount -t tmpfs,overlay")
+
+            line = getline_qemu(output, "on /mnt/overlay")
+            self.assertTrue(line and line.startswith("tmpfs"), msg=output)
+
+            line = getline_qemu(output, "upperdir=/mnt/overlay/upper/usr/share/my-application")
+            self.assertTrue(line and line.startswith("overlay"), msg=output)
-- 
2.28.0

