Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web12.3803.1628251614743151818
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 06 Aug 2021 05:06:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eQ0t0GEz;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id n12-20020a05600c3b8cb029025a67bbd40aso8800339wms.0
        for <Openembedded-core@lists.openembedded.org>; Fri, 06 Aug 2021 05:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n6BeJAelrfEvpE5+89TG1kBXbfqW2QUZ/H6BOkKgtCg=;
        b=eQ0t0GEz0jDbg+GDgdhVYR8pRHEb4q6RVlFrs7rQbg5177MJFM0H3uxi+fZqwcQ4tx
         kPm85oo2MSQN025IkMiUBIFxsh2ky7nfj+GA6lTr8q9+qQLu86KsQXGyd2sqCxciWT0P
         Aaie5DHSBBLpE0p6az6ZXnEftqd4MEo+H3j8pjE+KxjDDC+pydwNESs0gh7VJtEZcq2s
         wi1tad1B94p/dJ/riJmRKG8uoXRjwTo8X7j03SXy3Do2jG+GGKqiVu5obUdrANRpYDog
         WYSHtac3XAJQ3kN9rGZJqzMhwNZqhCAzF4lNdf7BSDUVvfDZ5tHizXWiHFvSbCsDzVgm
         TC1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n6BeJAelrfEvpE5+89TG1kBXbfqW2QUZ/H6BOkKgtCg=;
        b=q/7ndUITdZ2bgpgB2KZjxXP/6IdjoLa7NX4WIoKyHZa0BLITgWxCpAsra1g8C/Wu5z
         JrxJM6VMRnGM1qWPTaagevomkXSHbpjOk1yzn1irnGoUqdADiJbYFQDnMqtGmtSXx4AQ
         2MqxG43H9vsbWLT92kIVXph1NN1qRfpTOuZPF1uLdImFpmj//MvQAp6KkMaUgNpSrfwM
         vpML54pHI27D9xUh5esw4sKKkWBWAoBd87kgFO7y4HAneUtit2+8rID8yjX6cNTfozLf
         dabGVNYY6VRl7Lw7YqwB4ENRu3M7KPSjkxkLLRaeH+XEWUhCIEhD0LGfF5ec1OdGGIKL
         K4wQ==
X-Gm-Message-State: AOAM530JwidUB/TQICCsETjsNJ6i38GaKVF7asKYNS8LOjoqvegQRPoX
	pgHfy9kQnqy4avjtxFDzqCmzRuyvpXtPKeKH
X-Google-Smtp-Source: ABdhPJyHiEpofhYlY7E0sbgazGUc2kWfahz7RpY/Ehl7kDoxqPX3Rkb8MBppEH179mpo9DCY8q/tKg==
X-Received: by 2002:a1c:6a0c:: with SMTP id f12mr2973387wmc.82.1628251612966;
        Fri, 06 Aug 2021 05:06:52 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from slackware.local ([194.99.105.70])
        by smtp.gmail.com with ESMTPSA id n11sm11093049wrs.81.2021.08.06.05.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Aug 2021 05:06:52 -0700 (PDT)
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v4 6/7] oeqa/selftest: overlayfs unit tests
Date: Fri,  6 Aug 2021 14:06:10 +0200
Message-Id: <20210806120611.124246-6-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210806120611.124246-1-uvv.mail@gmail.com>
References: <20210806120611.124246-1-uvv.mail@gmail.com>
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
index 0000000000..0184d52494
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
+IMAGE_INSTALL:append = " overlayfs-user"
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
+IMAGE_INSTALL:append = " overlayfs-user"
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
+IMAGE_INSTALL:append = " overlayfs-user"
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
+IMAGE_INSTALL:append = " overlayfs-user"
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
+IMAGE_INSTALL:append = " overlayfs-user systemd-machine-units"
+DISTRO_FEATURES += "systemd overlayfs"
+
+# Use systemd as init manager
+VIRTUAL-RUNTIME_init_manager = "systemd"
+
+# enable overlayfs in the kernel
+KERNEL_EXTRA_FEATURES:append = " features/overlayfs/overlayfs.scc"
+"""
+
+        systemd_machine_unit_append = """
+SYSTEMD_SERVICE:${PN} += " \
+    mnt-overlay.mount \
+"
+
+do_install:append() {
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

