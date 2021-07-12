Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web09.12293.1626102036206068045
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 12 Jul 2021 08:00:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=r+Uy4xq4;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: uvv.mail@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id t17so43949234lfq.0
        for <Openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 08:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=36XJMgPpHrUN0WWLD7YWYVFSPm8vMNSeYK+pQVCOFMQ=;
        b=r+Uy4xq4TbNMTUFX4RuDL+wy5Q71y4Z8aUe9RW+3ey8NtaY6bFW7d4W1WMqDSOuiRk
         cAXjDVCJTSKCwe0gDPCurnc/Dw16kf+b7080N4U4c6HpL9feVIk0tVO/XODBdG747cw3
         7lCk1Of7OSGXxRmonyxLOlAT0Cuav/L7GFqH/OAlIpb0VEyKofV6gT/KC3ImNIH2KOYZ
         6TGy8qQQHkZpFf2A4XkxnI3r4eGV/36zsF44HE25BlhfKQCJ/kc14QkDbc2IMJ2IutJb
         /J36qqaxCQMSYpFIplyDxLToKGD2QyfejPO3EIsYUhJ78L6bVyNwzgGYieWGVr6YwS3G
         9E4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=36XJMgPpHrUN0WWLD7YWYVFSPm8vMNSeYK+pQVCOFMQ=;
        b=r1LtCG/rlx0anYc0wToCa+ipBXYQkttGJCbHD2QsPBHHtAUsWfA3rrGkYz6jq9HAC4
         /xHG+lYghKCxha2LYkQ0UoysA6y6o7m969QKsoGGT14dYRHVXWh2v41JzKkjrWZRJy4G
         NWUh2tNFLaXzdJzU13PyF5JUpjhTMf6QYQDi+PJ3w4zfu9WDDsoNGNcR+iSEpNwmeAI2
         p7JXUx1xdRYWURlLYm0DqAp7BzepYvRwxfOVuqCUI1lsbYNTZDauzeeIp7tGu8xuYe0X
         HgV8Bh7M6tAmHTBKTAgHcKC9aJJAzQoNYwJ365h3ZUCDiXL9WTuBfchiIr0cHoKJyTDc
         HhCQ==
X-Gm-Message-State: AOAM532bnkE9YdlVIYDdU1hyTYhkMuFSHuDypeaMMqvB5YpDJbZg6nzL
	qK8mdMKsH8fuUFTkC81p6dE/oPy5gl7QXg==
X-Google-Smtp-Source: ABdhPJyIiy7K5fePQJ3fNRVHbc3Fw/Is15q+d5/GkOx0356TxfwrZLYgVmLNKGhTRDEvQeBAn/EaLA==
X-Received: by 2002:a05:6512:3138:: with SMTP id p24mr15350232lfd.214.1626102034243;
        Mon, 12 Jul 2021 08:00:34 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from slackware.local ([185.253.97.13])
        by smtp.gmail.com with ESMTPSA id b6sm650061lfe.173.2021.07.12.08.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 08:00:32 -0700 (PDT)
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v2 7/8] oeqa/selftest: overlayfs unit tests
Date: Mon, 12 Jul 2021 17:00:22 +0200
Message-Id: <20210712150022.120478-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <169101D2B14E1B11.4752@lists.openembedded.org>
References: <169101D2B14E1B11.4752@lists.openembedded.org>
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

