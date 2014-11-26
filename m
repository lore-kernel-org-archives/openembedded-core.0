Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id EC1027210C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 16:22:28 +0000 (UTC)
Received: by mail-pd0-f170.google.com with SMTP id fp1so3077230pdb.15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 08:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=51QS2n3dqLm3SKjN2Ysr97vNnbxglwqKRTrmCpt4daI=;
	b=GC/YVG0sWTZtDaXe1m1F8ov02kOanVgspjCCTdxYhZRKShkjNjFm6glNaOmG59r09R
	toz3DW4hfOlcPfA8B3rmbc0CEImy/i/liwNRBSHYXx9ftKVlWdEl5e1nWLYQI6wOYyYg
	uUn31yZwEP04DDsa8xohtGrPSOLgVVrQv7OmChLAIiFUg8mHricsrCcKKoY5ZzJGOo0h
	sGJF0+2Jeim7N+NMXVNoxX8Nj3rRtCg96sR67DRCTtTQoz2DKilHBvk6N2dW/hqzVbYc
	Fb71IrdXCy9JAW6GdKJ7Kmi22yGU2WuK1Neef9NP6Hx8C7zYrKs5wb/xU+f/qvQyo3Q9
	84tQ==
X-Received: by 10.70.98.141 with SMTP id ei13mr55058370pdb.65.1417018949594;
	Wed, 26 Nov 2014 08:22:29 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id qn1sm4736673pdb.42.2014.11.26.08.22.27
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 26 Nov 2014 08:22:28 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Nov 2014 08:22:07 -0800
Message-Id: <e7a9547c3aee307a3188f6a17fff4620e285f9bd.1417018567.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <2446d3e01b365793ce2886985212bf800d14846e.1417018567.git.akuster808@gmail.com>
References: <2446d3e01b365793ce2886985212bf800d14846e.1417018567.git.akuster808@gmail.com>
In-Reply-To: <cover.1417018567.git.akuster808@gmail.com>
References: <cover.1417018567.git.akuster808@gmail.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 03/11] Revert "wic: set bootimg_dir when using image-name artifacts"
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Nov 2014 16:22:29 -0000

From: Tom Zanussi <tom.zanussi@linux.intel.com>

This reverts commit 7ce1dc13f91df70e8a2f420e7c3eba51cbc4bd48.

This patch broke the assumption that a non-null boot_dir means a
user-assigned (-b command-line param) value.

Reverting doesn't break anything, since the case it was added for
doesn't use the boot_dir for anything except debugging anyhow.

Fixes [YOCTO #6290]

(From OE-Core rev: db90f10bf31dec8d7d7bb2d3680d50e133662850)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 scripts/lib/image/engine.py | 9 ++-------
 scripts/wic                 | 7 +++----
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/scripts/lib/image/engine.py b/scripts/lib/image/engine.py
index 3813fec..f1df8b4 100644
--- a/scripts/lib/image/engine.py
+++ b/scripts/lib/image/engine.py
@@ -67,8 +67,7 @@ def find_artifacts(image_name):
     """
     bitbake_env_lines = get_bitbake_env_lines()
 
-    rootfs_dir = kernel_dir = bootimg_dir = ""
-    hdddir = staging_data_dir = native_sysroot = ""
+    rootfs_dir = kernel_dir = hdddir = staging_data_dir = native_sysroot = ""
 
     for line in bitbake_env_lines.split('\n'):
         if (get_line_val(line, "IMAGE_ROOTFS")):
@@ -86,12 +85,8 @@ def find_artifacts(image_name):
         if (get_line_val(line, "STAGING_DIR_NATIVE")):
             native_sysroot = get_line_val(line, "STAGING_DIR_NATIVE")
             continue
-        if (get_line_val(line, "DEPLOY_DIR_IMAGE")):
-            bootimg_dir = get_line_val(line, "DEPLOY_DIR_IMAGE")
-            continue
 
-    return (rootfs_dir, kernel_dir, bootimg_dir, hdddir, staging_data_dir, \
-            native_sysroot)
+    return (rootfs_dir, kernel_dir, hdddir, staging_data_dir, native_sysroot)
 
 
 CANNED_IMAGE_DIR = "lib/image/canned-wks" # relative to scripts
diff --git a/scripts/wic b/scripts/wic
index 7314810..15cc9b3 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -134,8 +134,8 @@ def wic_create_subcommand(args, usage_str):
     bootimg_dir = staging_data_dir = hdddir = ""
 
     if options.image_name:
-        (rootfs_dir, kernel_dir, bootimg_dir, hdddir, \
-         staging_data_dir, native_sysroot) = find_artifacts(options.image_name)
+        (rootfs_dir, kernel_dir, hdddir, staging_data_dir, native_sysroot) = \
+            find_artifacts(options.image_name)
 
     wks_file = args[0]
 
@@ -172,8 +172,7 @@ def wic_create_subcommand(args, usage_str):
         not_found = not_found_dir = ""
         if not os.path.isdir(rootfs_dir):
             (not_found, not_found_dir) = ("rootfs-dir", rootfs_dir)
-        elif not os.path.isdir(bootimg_dir) and not os.path.isdir(hdddir) \
-             and not os.path.isdir(staging_data_dir):
+        elif not os.path.isdir(hdddir) and not os.path.isdir(staging_data_dir):
             (not_found, not_found_dir) = ("bootimg-dir", bootimg_dir)
         elif not os.path.isdir(kernel_dir):
             (not_found, not_found_dir) = ("kernel-dir", kernel_dir)
-- 
1.9.1


