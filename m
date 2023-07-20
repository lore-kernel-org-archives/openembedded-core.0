Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F272EB64DD
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 10:20:35 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.9713.1689848425075734604
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jul 2023 03:20:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=dHoT9x2t;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3fbf1b82d9cso4677285e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 03:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689848423; x=1690453223;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RWhhiObnZladReoRp+tgOtB5eE84bX4EI9ocX1MnUyw=;
        b=dHoT9x2tCBLXegVq1KlvIhR5MMcd/1TMfFAHwIEAzmv2/vRZhM/CF5RB+yiLGc5Ml4
         oSIrXd54pACNbzaY7tfC0HyJX4wsWL1ZQltekJBIKzM3FclB7tKAMQveV6OB22T4xpZ/
         T4rLALORPa4DXQ7O5Jn7yLN7TjJpxw7C0j8ENVp2XTZh4Y4wHjd6wRlyf6K60wkZVr8g
         7uaeIMt5P6y6Tu5vLJWFNmWOX8nyUgtcwmlhQ1jqSNHh4zJqkkppVKe53kbY3Mne2OCt
         E1/hh130CI0WsIlSKeL2wk1RSn65X4A3BVe2s1B0wmBep9adupxZUw3+BByRdhkYTvtw
         PQfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689848423; x=1690453223;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RWhhiObnZladReoRp+tgOtB5eE84bX4EI9ocX1MnUyw=;
        b=YHU3F4Kg/NgYrJSjFDbJhY6bGBCFxJKLxECEDMiJN18FcKaRTgsdRToizXyfYEyRYR
         GHNuEbhI64QMwK7iimJjtV+VR07XNKIEnARIGFG+6yGNZhZQANwpec+qz8Kz7mIz7G0b
         6LynpP+WVwEJoX2XXS7ZfuV1a31ljMJJFGyPlLvOwTnoes0n9JUfQeZzcFkNk2TXk1M0
         nrwYbjwTEFuI0aK2olDjyElVAsfq9lEoMOMaMEoAnn1zIXkK8dl5lCBpCAz6jgpo1AJY
         z8vr712vHZAUOZwq1shAk6Cxcvb29bL009nSHPA9rsawPuSC/r7cauv62BdGVU2cN1eR
         gZ9g==
X-Gm-Message-State: ABy/qLZ7te2aoE70fTIWqXp/PRVMaiH0fFI7mbl7hlSu1he9biqnhasE
	napbd8rhKuqKM4sThjGRHw0lpT/+dMw=
X-Google-Smtp-Source: APBJJlGy5F/fTA5NxdgfuP16iByqzZmAMoJS3Y4L3ZfAdD5mhEbQ2dgxiMJB3MuB2jpm+XBF6j1RGg==
X-Received: by 2002:a7b:c84c:0:b0:3f7:678c:74b0 with SMTP id c12-20020a7bc84c000000b003f7678c74b0mr4012624wml.12.1689848422776;
        Thu, 20 Jul 2023 03:20:22 -0700 (PDT)
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id f12-20020a7bcc0c000000b003fc0062f0f8sm841604wmh.9.2023.07.20.03.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 03:20:22 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v2 1/3] rootfs: Add debugfs package db file copy and cleanup
Date: Thu, 20 Jul 2023 11:20:12 +0100
Message-Id: <20230720102014.11236-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 10:20:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184628

When copying the package database files for the debugfs, add individual
file copy as well as tree copying. After the debug rootfs has been
created, cleanup the package files.

This then allows us to avoid a problem where (for rpm at least)
extraneous files in the debug rootfs would cause failures during
oe-selftest because some files existed in both regular and debugfs
images.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v2:
- New in v2

 meta/lib/oe/rootfs.py | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 890ba5f03984..1a48ed10b3f6 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -106,7 +106,7 @@ class Rootfs(object, metaclass=ABCMeta):
     def _cleanup(self):
         pass
 
-    def _setup_dbg_rootfs(self, dirs):
+    def _setup_dbg_rootfs(self, package_paths):
         gen_debugfs = self.d.getVar('IMAGE_GEN_DEBUGFS') or '0'
         if gen_debugfs != '1':
            return
@@ -122,11 +122,12 @@ class Rootfs(object, metaclass=ABCMeta):
         bb.utils.mkdirhier(self.image_rootfs)
 
         bb.note("  Copying back package database...")
-        for dir in dirs:
-            if not os.path.isdir(self.image_rootfs + '-orig' + dir):
-                continue
-            bb.utils.mkdirhier(self.image_rootfs + os.path.dirname(dir))
-            shutil.copytree(self.image_rootfs + '-orig' + dir, self.image_rootfs + dir, symlinks=True)
+        for path in package_paths:
+            bb.utils.mkdirhier(self.image_rootfs + os.path.dirname(path))
+            if os.path.isdir(self.image_rootfs + '-orig' + path):
+                shutil.copytree(self.image_rootfs + '-orig' + path, self.image_rootfs + path, symlinks=True)
+            elif os.path.isfile(self.image_rootfs + '-orig' + path):
+                shutil.copyfile(self.image_rootfs + '-orig' + path, self.image_rootfs + path)
 
         # Copy files located in /usr/lib/debug or /usr/src/debug
         for dir in ["/usr/lib/debug", "/usr/src/debug"]:
@@ -162,6 +163,13 @@ class Rootfs(object, metaclass=ABCMeta):
             bb.note("  Install extra debug packages...")
             self.pm.install(extra_debug_pkgs.split(), True)
 
+        bb.note("  Removing package database...")
+        for path in package_paths:
+            if os.path.isdir(self.image_rootfs + path):
+                shutil.rmtree(self.image_rootfs + path)
+            elif os.path.isfile(self.image_rootfs + path):
+                os.remove(self.image_rootfs + path)
+
         bb.note("  Rename debug rootfs...")
         try:
             shutil.rmtree(self.image_rootfs + '-dbg')
-- 
2.39.0


