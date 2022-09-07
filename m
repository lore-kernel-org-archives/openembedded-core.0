Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C12ADC6FA82
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 19:52:54 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.242.1662580371277252684
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 12:52:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PCOw+ML3;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id bp20so21722510wrb.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 12:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=hX3spU7bUoIUrLIi87WiArTBiWPQppwZk7xIoaa1mNk=;
        b=PCOw+ML3xai2y0s9gKfXotTBZXpglN2O0EGIHsQOlPyDrMqSNln0bHBiOFAHh9jQZC
         9p9t+VY2vRjATBWylL7N+oS5glbHKIpV9wUtKLmgyuiOtOijuDifAdAniGIIMeoIia2Q
         D+uvPcQEqe9IFfUm2FwoENP+PxdnaDXQxRmeAGYTocpIWh422DAa31AVY65TIsBP8Hpg
         j3fyZWc18LEjuO9xrCWXgF54VSSul9UE1XNEl+RSHtI6cGkYPssOA6q99iPVIPU9y8C2
         II78GDs8cojjv9ALOTBMoISp/Q0QFwKmdxA3HqqCjjLdbnSc+4ExupbG268kk7LEclUM
         I2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=hX3spU7bUoIUrLIi87WiArTBiWPQppwZk7xIoaa1mNk=;
        b=kiS7cJGHTU6eZ7l0qjnoKtm4FnFfvf9Phng39/+cTodBBaBS+frv9TQboLNLapAy8M
         y2+gSmOojgmkjfcfDAszoTVqHtbikkf+gd7GhJzEsz2z9UUvHKBQyvOks7QZjCDDyLTD
         eoK6qyfRE4pk8NF3Lav0ATDMVpIGLFu3Iv0WCjlOSeNSkHZ40D3INFKfJpjSK+bC2//5
         CuCiUDJKOiGROO/B0hxD6EAlo3/kJfUB2Elw3x+yrUrNPBwwWjgkAriuKVcQOtr0+jiP
         TY00BEPJqR4V+HEtEbF2nKziU1A8Q3+e3IeAODQhXsgC7eBFWhHVh4D8aSj7W0xGK0p6
         LeWg==
X-Gm-Message-State: ACgBeo3a4SF0RxTye2GIME/HxEaVufv3zxFOYOyGlukB5D5lMJBkZ3Ku
	WikjY7jbXfmcKeWk/h3lkeDXwtDuU2QZ3w==
X-Google-Smtp-Source: 
 AA6agR6iaz/uN8xgSvCmje7oxxtMEzOf93mgujDMqgFdK4cq34amJs6hI9eG/5jmzKg81oV6Kg1V4g==
X-Received: by 2002:adf:d1c7:0:b0:226:eb3b:29b0 with SMTP id
 b7-20020adfd1c7000000b00226eb3b29b0mr3057399wrd.365.1662580369581;
        Wed, 07 Sep 2022 12:52:49 -0700 (PDT)
Received: from developer.localdomain
 (dslb-002-205-007-019.002.205.pools.vodafone-ip.de. [2.205.7.19])
        by smtp.gmail.com with ESMTPSA id
 r9-20020adff709000000b0022862fd933asm15030361wrp.96.2022.09.07.12.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 12:52:49 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <v.yurkov@precitec.de>
Subject: [PATCH 5/5] oeqa/selftest: Add lower layer test for overlayfs-etc
Date: Wed,  7 Sep 2022 21:51:39 +0200
Message-Id: <20220907195139.814465-5-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220907195139.814465-1-uvv.mail@gmail.com>
References: <20220907195139.814465-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 19:52:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170430

From: Vyacheslav Yurkov <v.yurkov@precitec.de>

Place a test file on the /etc by means of overlayfs-user recipe.
Perform QA checks to make sure that:
- When lower layer is exposed, that it's read-only to avoid undefined behavior
- By default lower layer is not exposed

Signed-off-by: Vyacheslav Yurkov <v.yurkov@precitec.de>
---
 .../overlayfs-user/overlayfs-user.bb          |  7 +-
 meta/lib/oeqa/selftest/cases/overlayfs.py     | 90 ++++++++++++++-----
 2 files changed, 74 insertions(+), 23 deletions(-)

diff --git a/meta-selftest/recipes-test/overlayfs-user/overlayfs-user.bb b/meta-selftest/recipes-test/overlayfs-user/overlayfs-user.bb
index 913a4d1fdb..50cba9514b 100644
--- a/meta-selftest/recipes-test/overlayfs-user/overlayfs-user.bb
+++ b/meta-selftest/recipes-test/overlayfs-user/overlayfs-user.bb
@@ -12,6 +12,11 @@ OVERLAYFS_WRITABLE_PATHS[mnt-overlay] += "/usr/share/my-application"
 
 do_install() {
     install -d ${D}/usr/share/my-application
+    install -d ${D}${sysconfdir}
+    echo "Original file in /etc" >> ${D}${sysconfdir}/lower-layer-test.txt
 }
 
-FILES:${PN} += "/usr"
+FILES:${PN} += "\
+    ${exec_prefix} \
+    ${sysconfdir \
+"
diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/selftest/cases/overlayfs.py
index f550015b4b..57a8c8bdb6 100644
--- a/meta/lib/oeqa/selftest/cases/overlayfs.py
+++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
@@ -381,28 +381,7 @@ OVERLAYFS_ETC_DEVICE = "/dev/sda3"
         Author:    Vyacheslav Yurkov <uvv.mail@gmail.com>
         """
 
-        config = """
-DISTRO_FEATURES:append = " systemd"
-
-# Use systemd as init manager
-VIRTUAL-RUNTIME_init_manager = "systemd"
-
-# enable overlayfs in the kernel
-KERNEL_EXTRA_FEATURES:append = " features/overlayfs/overlayfs.scc"
-
-IMAGE_FSTYPES += "wic"
-OVERLAYFS_INIT_OPTION = "{OVERLAYFS_INIT_OPTION}"
-WKS_FILE = "overlayfs_etc.wks.in"
-
-EXTRA_IMAGE_FEATURES += "read-only-rootfs"
-# Image configuration for overlayfs-etc
-EXTRA_IMAGE_FEATURES += "overlayfs-etc"
-IMAGE_FEATURES:remove = "package-management"
-OVERLAYFS_ETC_MOUNT_POINT = "/data"
-OVERLAYFS_ETC_FSTYPE = "ext4"
-OVERLAYFS_ETC_DEVICE = "/dev/sda3"
-OVERLAYFS_ETC_USE_ORIG_INIT_NAME = "{OVERLAYFS_ETC_USE_ORIG_INIT_NAME}"
-"""
+        config = self.get_working_config()
 
         args = {
             'OVERLAYFS_INIT_OPTION': "" if origInit else "init=/sbin/preinit",
@@ -423,6 +402,11 @@ OVERLAYFS_ETC_USE_ORIG_INIT_NAME = "{OVERLAYFS_ETC_USE_ORIG_INIT_NAME}"
             line = getline_qemu(output, "upperdir=/data/overlay-etc/upper")
             self.assertTrue(line and line.startswith("/data/overlay-etc/upper on /etc type overlay"), msg=output)
 
+            # check that lower layer is not available
+            status, output = qemu.run_serial("ls -1 /data/overlay-etc/lower")
+            line = getline_qemu(output, "No such file or directory")
+            self.assertTrue(line, msg=output)
+
             status, output = qemu.run_serial("touch " + testFile)
             status, output = qemu.run_serial("sync")
             status, output = qemu.run_serial("ls -1 " + testFile)
@@ -434,3 +418,65 @@ OVERLAYFS_ETC_USE_ORIG_INIT_NAME = "{OVERLAYFS_ETC_USE_ORIG_INIT_NAME}"
             status, output = qemu.run_serial("ls -1 " + testFile)
             line = getline_qemu(output, testFile)
             self.assertTrue(line and line.startswith(testFile), msg=output)
+
+    def test_lower_layer_access(self):
+        """
+        Summary:   Test that lower layer of /etc is available read-only when configured
+        Expected:  Can't write to lower layer. The files on lower and upper different after
+                   modification
+        Author:    Vyacheslav Yurkov <uvv.mail@gmail.com>
+        """
+
+        config = self.get_working_config()
+
+        configLower = """
+OVERLAYFS_ETC_EXPOSE_LOWER = "1"
+IMAGE_INSTALL:append = " overlayfs-user"
+"""
+        testFile = "lower-layer-test.txt"
+
+        args = {
+            'OVERLAYFS_INIT_OPTION': "",
+            'OVERLAYFS_ETC_USE_ORIG_INIT_NAME': 1
+        }
+
+        self.write_config(config.format(**args))
+
+        self.append_config(configLower)
+        bitbake('core-image-minimal')
+
+        with runqemu('core-image-minimal', image_fstype='wic') as qemu:
+            status, output = qemu.run_serial("echo \"Modified in upper\" > /etc/" + testFile)
+            status, output = qemu.run_serial("diff /etc/" + testFile + " /data/overlay-etc/lower/" + testFile)
+            line = getline_qemu(output, "Modified in upper")
+            self.assertTrue(line, msg=output)
+            line = getline_qemu(output, "Original file")
+            self.assertTrue(line, msg=output)
+
+            status, output = qemu.run_serial("touch /data/overlay-etc/lower/ro-test.txt")
+            line = getline_qemu(output, "Read-only file system")
+            self.assertTrue(line, msg=output)
+
+    def get_working_config(self):
+        return """
+DISTRO_FEATURES:append = " systemd"
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
-- 
2.30.2


