Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
 by mx.groups.io with SMTP id smtpd.web10.9678.1625830374033107928
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 09 Jul 2021 04:32:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hjZBjcQl;
 spf=pass (domain: gmail.com, ip: 209.85.166.52, mailfrom: uvv.mail@gmail.com)
Received: by mail-io1-f52.google.com with SMTP id b1so12092899ioz.8
        for <Openembedded-core@lists.openembedded.org>; Fri, 09 Jul 2021 04:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hqgLnmlIRgyGDdl3N56xUa/TdHs3EqBm1/gkjR9mWpo=;
        b=hjZBjcQl0/uqqS/JMHTSKHXeQRKD3SxchhlV5GLaP27mlLqQ/P55WkmiuqJ9aP8Yv6
         VtSEhvNVYEihF1pQvqZWMus+Yc3reWSmKDQrByL2z0BK8FWdd/3FfegNqeVSyQBa3UM8
         TtNZ8cyVcIJaMvZauc7sqwfszbZ8C+JxPpM42LQvwfr9Uss3yZkYOssVE4TDbqbThYda
         UiVWfwKimc+fVd3JZzmPv9nZGPL9sAG753iH0rENjCRZuPiTXCnAYS+SMM+uJVzM5t7J
         gFaRm25rxmcLM/xoT7kn/ENBmXSsVWdq4InVyta9J52qLfyd4cDxugu+2NDKXERTEl7c
         yD0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hqgLnmlIRgyGDdl3N56xUa/TdHs3EqBm1/gkjR9mWpo=;
        b=EExCKoT0DkRB5HAbwbZRfsrThxzTU3elwTqX6/mshAbB/cOZbAanVf2IXBjGKzTMf2
         6RGI3hGYuxY2RO/1NrAE2TiqMAr0xy7l9eVlfL9JR0snbHZ9pTeQaj2qNnCLN63bhVqG
         kJMO2QCDkGAoDaxzhOefpZAyt2IXOPvA5zcEqYMjYgHfnK99ZUmj0wLF0I4BxM472wMg
         AlPPEkRRuNhIFVCDEZF8DPBBRTKwoDY6f6WNQ+dWOjAO04GUGaeE+/FD0ri2RN58gh0g
         N4JULsrEREFLMXTCdt6KNz3mzAqznrh4xJqrUNJbr9R8wdoozydvPlh+LLREg+OML7oJ
         zVaA==
X-Gm-Message-State: AOAM532dIFo48TpEU4etxP6ncCS7P64hNONARGWVX0k6J3Qn3+ZD5IuR
	CqBecahdo7Z2Kt7jP82ubnrinfXd+2l9eg==
X-Google-Smtp-Source: ABdhPJwAyNiHsNJeZFmi3EeClSDIA+KTqmiLBvU+i7Te40WtMWNVcSJF7Vw86RBX5va2j5pXqgDvLA==
X-Received: by 2002:a02:cace:: with SMTP id f14mr13440686jap.5.1625830373329;
        Fri, 09 Jul 2021 04:32:53 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from slackware.local ([37.120.205.173])
        by smtp.gmail.com with ESMTPSA id q7sm2570463ilv.17.2021.07.09.04.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 04:32:53 -0700 (PDT)
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v2 7/8] oeqa/selftest: overlayfs unit tests
Date: Fri,  9 Jul 2021 13:31:45 +0200
Message-Id: <20210709113146.69020-7-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210709113146.69020-1-uvv.mail@gmail.com>
References: <20210709113146.69020-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unit tests for overlayfs.bbclass

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/lib/oeqa/selftest/cases/overlayfs.py | 126 ++++++++++++++++++++++
 1 file changed, 126 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/overlayfs.py

diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/selftest/cases/overlayfs.py
new file mode 100644
index 0000000000..74bf1c4167
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
@@ -0,0 +1,126 @@
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
+    def test_distro_features_missing(self):
+        """
+        Summary:   Check that required DISTRO_FEATURES are set
+        Expected:  Fail when either systemd or overlayfs are not in DISTRO_FEATURES
+        Author:    Vyacheslav Yurkov <uvv.mail@gmail.com>
+        """
+
+        config = """
+OVERLAYFS_MOUNT_POINT[mnt-overlay] = "/mnt/overlay"
+IMAGE_INSTALL_append = "overlayfs-user"
+"""
+        self.write_config(config)
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
+OVERLAYFS_MOUNT_POINT[mnt-overlay] = "/mnt/overlay"
+IMAGE_INSTALL_append = "overlayfs-user"
+DISTRO_FEATURES += "systemd overlayfs"
+"""
+        self.write_config(config)
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
+IMAGE_INSTALL_append = "overlayfs-user"
+DISTRO_FEATURES += "systemd overlayfs"
+"""
+        self.write_config(config)
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
+OVERLAYFS_MOUNT_POINT[usr-share-overlay] = "/usr/share/overlay"
+IMAGE_INSTALL_append = "overlayfs-user"
+DISTRO_FEATURES += "systemd overlayfs"
+"""
+        self.write_config(config)
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
+OVERLAYFS_MOUNT_POINT[mnt-overlay] = "/mnt/overlay"
+IMAGE_INSTALL_append = "overlayfs-user systemd-machine-units"
+DISTRO_FEATURES += "systemd overlayfs"
+"""
+
+        systemd_machine_unit_append = """
+SYSTEMD_SERVICE_${PN} += " \
+    mnt-overlay.mount \
+"
+
+do_install() {
+    install -d ${D}${systemd_unitdir}/system
+    cat <<EOT > ${D}${systemd_unitdir}/system/mnt-overlay.mount
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
+        self.write_config(config)
+        self.write_recipeinc('systemd-machine-units', systemd_machine_unit_append)
+        bitbake('core-image-minimal')
-- 
2.28.0

