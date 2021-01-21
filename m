Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.1397.1611246150445140456
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 08:22:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: QGsfxBJvPAcmjr3IMkeSaDlHjnG1R4DPUw82k7v6HNbBylYQQuT4YYEUcz68vPqoe/pPyoH2sb
 C/X/59OaHWjw==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="166392481"
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; 
   d="scan'208";a="166392481"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 08:22:33 -0800
IronPort-SDR: 6KsBy5mTP5uIB92ZUbkhaIhC0AaWSm//1tagRMkrUSItsRiP6FtgkP3ehOW9ZewNFUfzSZroNy
 DaBVZ2r4r7YQ==
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; 
   d="scan'208";a="427413773"
Received: from yonshuta-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.145.18])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 08:22:32 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 13/20] wic: Allow exec_native_cmd to run HOSTTOOLS
Date: Fri, 22 Jan 2021 00:21:58 +0800
Message-Id: <00474d990174c3c4af6e0a6058871f925380750a.1611245974.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1611245974.git.anuj.mittal@intel.com>
References: <cover.1611245974.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Barker <pbarker@konsulko.com>

This allows programs from HOSTTOOLS (e.g. 'install', 'rm', 'mv', etc) to
be more easily executed by wic. Without this change only programs from
an actual *-native recipe built by bitbake can be executed by wic.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8eb186acdecfbb3151c9a0ab148358e3fe5cce39)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/image_types_wic.bbclass | 2 +-
 scripts/lib/wic/misc.py              | 7 +++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index 286e0f5d54..000ee4249f 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -3,7 +3,7 @@
 WICVARS ?= "\
            BBLAYERS IMGDEPLOYDIR DEPLOY_DIR_IMAGE FAKEROOTCMD IMAGE_BASENAME IMAGE_EFI_BOOT_FILES IMAGE_BOOT_FILES \
            IMAGE_LINK_NAME IMAGE_ROOTFS INITRAMFS_FSTYPES INITRD INITRD_LIVE ISODIR RECIPE_SYSROOT_NATIVE \
-           ROOTFS_SIZE STAGING_DATADIR STAGING_DIR STAGING_LIBDIR TARGET_SYS \
+           ROOTFS_SIZE STAGING_DATADIR STAGING_DIR STAGING_LIBDIR TARGET_SYS HOSTTOOLS_DIR \
            KERNEL_IMAGETYPE MACHINE INITRAMFS_IMAGE INITRAMFS_IMAGE_BUNDLE INITRAMFS_LINK_NAME APPEND \
            ASSUME_PROVIDED PSEUDO_IGNORE_PATHS"
 
diff --git a/scripts/lib/wic/misc.py b/scripts/lib/wic/misc.py
index 4b08d649c6..75b219cd3f 100644
--- a/scripts/lib/wic/misc.py
+++ b/scripts/lib/wic/misc.py
@@ -138,9 +138,12 @@ def exec_native_cmd(cmd_and_args, native_sysroot, pseudo=""):
     if pseudo:
         cmd_and_args = pseudo + cmd_and_args
 
-    native_paths = "%s/sbin:%s/usr/sbin:%s/usr/bin:%s/bin" % \
+    hosttools_dir = get_bitbake_var("HOSTTOOLS_DIR")
+
+    native_paths = "%s/sbin:%s/usr/sbin:%s/usr/bin:%s/bin:%s" % \
                    (native_sysroot, native_sysroot,
-                    native_sysroot, native_sysroot)
+                    native_sysroot, native_sysroot,
+                    hosttools_dir)
 
     native_cmd_and_args = "export PATH=%s:$PATH;%s" % \
                    (native_paths, cmd_and_args)
-- 
2.29.2

