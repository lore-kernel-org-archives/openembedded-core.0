Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web12.8120.1626016644200616138
 for <Openembedded-core@lists.openembedded.org>;
 Sun, 11 Jul 2021 08:17:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SP+Dwqqv;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: uvv.mail@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id f13so36195540lfh.6
        for <Openembedded-core@lists.openembedded.org>; Sun, 11 Jul 2021 08:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LwjRag3OHNLcZ/p/cuzZo42vq7INJeT3Vh3AWZv4XFo=;
        b=SP+Dwqqv0PjYUFOe90AuQhfBZOsjgxhrW5Ew8iiVTSzqNUH/Vxb+O6cypCZY0SHPAm
         QtVqcw+yLXV1ji3hqwQ6dkQ1HyJzK4wtHg+VvykhflivRc3+o/qzP2bp+kTSktecVgJH
         3fTwpvaFbRGnakpDENgAdyeL4Ed3RQ3zdr2gIk6Hd07mDaoneUdjJyNUQhx8ACbAZxqj
         zW4yriuL4z8zUF+XWeFEEUh5rGnXFitxhUIhCRLQY8TuUNaQKCbK3jP/ZwJkXpaUfHKz
         ul86kG6qvkYq4uC3uARKUkgC9J+KA+00Sd74DtdVDhoG4ly9WLaRAFB6CX8T2zcfJ17w
         WRHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LwjRag3OHNLcZ/p/cuzZo42vq7INJeT3Vh3AWZv4XFo=;
        b=p8jkiUmCFd6t5BmoBSGVe0TZH9+ReXdVmxy3wqJpIjQV02B9DtoDViADhGe7/74tDg
         nLyoZbfwc/x3QWyba4UIeC0L34TnRjTvlHolXvn3RGINB+sYEsVp+WrRmNU5yP9G/g6T
         4Bjggf0J5C3ryaY4G1Pb/Z4/HFSYBg5CDL7OCSGsicTSUyA8P0C3bQ4UxyQ/9KUJeuJX
         UOugsfIpSFOjPp6Zv0sN8lqrTkMdnfoKAN9Nw/TIvnUW4FGm4aJFHXchbiYvSQr7+OqB
         YCmfwVkFlnZ9v7033ekvVT4XSXhSWPortY0AvUST6noTlUsy//aB/EZTDdXZpjmkGBaK
         tpxQ==
X-Gm-Message-State: AOAM533qnl0Isr4ahvs2f8fmJSOJ9XuiTi2e8/BcoV9uLbUmcZD5CoNV
	d/vp6y0eQc2kDuT/zU30qWWnFYL0Cs7L42I0
X-Google-Smtp-Source: ABdhPJyMJjbMVqjR8k/XUkb5baKLy6PV8cX12RkEONFIedhVo8TgZrgUEhOZI33ba15gscpjpaqevA==
X-Received: by 2002:ac2:569a:: with SMTP id 26mr36034252lfr.19.1626016642064;
        Sun, 11 Jul 2021 08:17:22 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from slackware.local ([185.253.97.14])
        by smtp.gmail.com with ESMTPSA id z12sm163367lfu.53.2021.07.11.08.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 08:17:21 -0700 (PDT)
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v2 7/8] oeqa/selftest: overlayfs unit tests
Date: Sun, 11 Jul 2021 17:16:29 +0200
Message-Id: <20210711151629.40035-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <YOnVwpvuj3OFT5Ti@piout.net>
References: <YOnVwpvuj3OFT5Ti@piout.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unit tests for overlayfs.bbclass

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/lib/oeqa/selftest/cases/overlayfs.py | 167 ++++++++++++++++++++++
 1 file changed, 167 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/overlayfs.py

diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/selftest/cases/overlayfs.py
new file mode 100644
index 0000000000..a5a4792eb0
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
@@ -0,0 +1,167 @@
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
+        self.write_config(config)
+        self.add_overlay_conf_to_machine()
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

