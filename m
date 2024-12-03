Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A8A8E64AA3
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 13:38:04 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.19592.1733233077551795160
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 05:37:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=SXCoLdOA;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-211fb27cc6bso44544915ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 05:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733233077; x=1733837877; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BBGfNT3q3EOpwM6LB3o9HKtIYE6zkIUNBtcGwXfdh/o=;
        b=SXCoLdOAmPdcD86AXXBXCeTwQ+MFqEIFgeiZ/oa4LjKreMk53sG1/8EZh8aT+r90MK
         FWxX78RZAq7q7NAQoBLD0puCVg+NmLyHZTmSY7ztJiNYhlLxERTiRLwKak2xjzAw/qzI
         a9GQR7F1txcd8JBFgwJH4nLo2NboYFBpcM/c8Jjc6ODlQkidiBdi8yOaJiB3rcLc35Qx
         LwhS6C2yAcqoieN9qfD2bOCIdNkOxpI/hnCOOAOALX0ibK88mr9jjc9vHxCwf7z5P+6u
         r0qFbnsNoHcOZoluWkpvU1oqHa9xhTMhs/qwNMeh0OYABecBLWwqKBkdyIesbkPkSb7z
         pwJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733233077; x=1733837877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BBGfNT3q3EOpwM6LB3o9HKtIYE6zkIUNBtcGwXfdh/o=;
        b=rg74fyzyTouTlbYTZNXnFQ5zQdlYr6ZvAGNBVaidk1RmngLwY+90DFUlU5hab9w4sc
         fOrg42uTgbuvIBGVoq8vlFbUe1pgkWYjxiXbfrCE/TTwST3Gb1OhC51A5BElq8Ov4eSX
         eKX57J9FK62MYTGozXrvwCl8WTTxMOLMMgSl73k3AhHGxjCJfCkNS1HDoKr19jImd8mg
         ZJ+Upj4tGP1p808+77VLsNhoV+XSr9bZeGH9vUGNLpL/MgzAFAxqyemAZjrEHYl4Vfzc
         ac9RFE/vVE/PcYg+LJSvwvaBxki8IQk6fdjLidNlCNdmHFSWYQtVl3k5rhCh1nKstt41
         lu2A==
X-Gm-Message-State: AOJu0YzqHbG1BVYfW6vDLHRjDSA63KxBE2wBVYIn5SLdyKFfNV7yemXU
	22nVNJQsgiaizkjIeB/HSbpBrB6uig9Ri2DWw/HXDWpOKwKdnkWcCDuX8IaAYPtA5q8nOUcxk5C
	7
X-Gm-Gg: ASbGncvXRnGKKNxcJU9SJpIAw2povDYAlaU+juS0rCRccxCkV0kl4IxFg7J92I34ISy
	+f0tW3fzE0fz6T3PeRoU7dhmQwCoDs+S3iwOHNyFNq2nSMt4ZmZIazPIDZD8fHrPoErIQlFrhLW
	z1lG7LlTkZSH5nDYtvKhxfh4WVjvj2sgqUBJ746h+/OYmVumptg22Cg2xjx3ZhIzkzLBZaqNjAG
	FwyQ79bArnatEKAlT0W6fZXWaTjSBCZpQ0dhM8=
X-Google-Smtp-Source: AGHT+IGAIhz+70SHPjsdvZ/v3CImyrAw6sUDYBWyy36u+4HEekSODwtKs88uePLUJBg0EKImRkeFAA==
X-Received: by 2002:a17:902:f542:b0:215:5d8c:7e47 with SMTP id d9443c01a7336-215d00b97c9mr3069545ad.36.1733233076804;
        Tue, 03 Dec 2024 05:37:56 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2153540d792sm84560225ad.66.2024.12.03.05.37.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 05:37:56 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 16/16] rootfs: Ensure run-postinsts is not uninstalled for read-only-rootfs-delayed-postinsts
Date: Tue,  3 Dec 2024 05:37:20 -0800
Message-Id: <e0c4f2f69723f64a29ba35c4de5fb1a7c79ef718.1733232895.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733232895.git.steve@sakoman.com>
References: <cover.1733232895.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 13:38:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208205

From: "Gassner, Tobias.ext" <tobias.gassner.ext@karlstorz.com>

This patch ensures that pkg_postinst_ontarget task is executed for read only rootfs when
read-only-rootfs-delayed-postinsts is set as IMAGE_FEATURES. The issue was that run-postinsts
could be uninstalled at the end of rootfs construction and that shouldn't happen for
the delayed usecase.

In addition to the fix, a test in meta/lib/oeqa/selftest/cases/overlayfs.py testing
the fix has been implemented.

Signed-off-by: Gassner, Tobias.ext <tobias.gassner.ext@karlstorz.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 60f587475dda99eaa07848880058b69286b8900e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/rootfs.py                     |  4 +++
 meta/lib/oeqa/selftest/cases/overlayfs.py | 41 ++++++++++++++++++++++-
 2 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 8cd48f9450..5abce4ad7d 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -269,7 +269,11 @@ class Rootfs(object, metaclass=ABCMeta):
                 self.pm.remove(["run-postinsts"])
 
         image_rorfs = bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs",
+                                        True, False, self.d) and \
+                      not bb.utils.contains("IMAGE_FEATURES",
+                                        "read-only-rootfs-delayed-postinsts",
                                         True, False, self.d)
+
         image_rorfs_force = self.d.getVar('FORCE_RO_REMOVE')
 
         if image_rorfs or image_rorfs_force == "1":
diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/selftest/cases/overlayfs.py
index e31063567b..580fbdcb9c 100644
--- a/meta/lib/oeqa/selftest/cases/overlayfs.py
+++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
@@ -5,7 +5,7 @@
 #
 
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import bitbake, runqemu
+from oeqa.utils.commands import bitbake, runqemu, get_bb_vars
 from oeqa.core.decorator import OETestTag
 from oeqa.core.decorator.data import skipIfNotMachine
 
@@ -466,6 +466,45 @@ IMAGE_INSTALL:append = " overlayfs-user"
             line = getline_qemu(output, "Read-only file system")
             self.assertTrue(line, msg=output)
 
+    @skipIfNotMachine("qemux86-64", "tests are qemux86-64 specific currently")
+    def test_postinst_on_target_for_read_only_rootfs(self):
+        """
+        Summary:  The purpose of this test case is to verify that post-installation
+                  on target scripts are executed even if using read-only rootfs when
+                  read-only-rootfs-delayed-postinsts is set
+        Expected: The test files are created on first boot
+        """
+
+        import oe.path
+
+        vars = get_bb_vars(("IMAGE_ROOTFS", "sysconfdir"), "core-image-minimal")
+        sysconfdir = vars["sysconfdir"]
+        self.assertIsNotNone(sysconfdir)
+        # Need to use oe.path here as sysconfdir starts with /
+        targettestdir = os.path.join(sysconfdir, "postinst-test")
+
+        config = self.get_working_config()
+
+        args = {
+            'OVERLAYFS_INIT_OPTION': "",
+            'OVERLAYFS_ETC_USE_ORIG_INIT_NAME': 1,
+            'OVERLAYFS_ROOTFS_TYPE': "ext4",
+            'OVERLAYFS_ETC_CREATE_MOUNT_DIRS': 1
+        }
+
+        # read-only-rootfs is already set in get_working_config()
+        config += 'EXTRA_IMAGE_FEATURES += "read-only-rootfs-delayed-postinsts"\n'
+        config += 'CORE_IMAGE_EXTRA_INSTALL = "postinst-delayed-b"\n'
+
+        self.write_config(config.format(**args))
+
+        res = bitbake('core-image-minimal')
+
+        with runqemu('core-image-minimal', image_fstype='wic') as qemu:
+            for filename in ("rootfs", "delayed-a", "delayed-b"):
+                status, output = qemu.run_serial("test -f %s && echo found" % os.path.join(targettestdir, filename))
+                self.assertIn("found", output, "%s was not present on boot" % filename)
+
     def get_working_config(self):
         return """
 # Use systemd as init manager
-- 
2.34.1


