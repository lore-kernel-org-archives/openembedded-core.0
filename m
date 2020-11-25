Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.6635.1606311051089131960
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2020 05:30:56 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=YMivMyj6;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=axis.com; l=1754; q=dns/txt; s=axis-central1;
  t=1606311051; x=1637847051;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=XXAJEKHkTmg7YPeJeOV0v3dEVieAS1na0t8CIFcdEaU=;
  b=YMivMyj6/r/apJm9WF6p1Pgu80bqMzWrazYrhvNRzNlSOf85N8UllEzF
   C+ayrHzqfpIypOpX94NhUqRrpgbqHW7Mtg/GmRUcEKWl5NJ35Q4bHtVa/
   4lF7zvw0o/PHUd/0cv64wkmqqIP+zD34vq/Y0ibJd9cP2r0S4hbWER6/F
   iFHZqNd8uawqmF4s6Gpt4U8iqC2gdgPktAMI5UHmqosgn1CVXJGjknZEU
   X9+MthiehovxisgzR2At2ytDoOTr1Ch1d2gzvwKX65LYl4kBYofYpcItz
   AlnBPVquWhK6CqfEG9H4ePMIf08UpM5HJALUwaUwExHH5ah/OI+rM5Xx9
   A==;
IronPort-SDR: /KGk3joL0Ldnz5Hw213YC0sRkSrfvUVG8PvvN+oHpdRl3UnTxMYQHbGwncZjhqRwi+A3xnofeb
 wo4ILhtLv6pvzyp2EB1poGAPYoZNLuVysgiKBPFQF7USz+DqaokC5PaWhLW1cIT89C2wBIWzcC
 8Jda1Q3Sxkt02Y6GeY1ZdsSlQbW2/TmOR4RS2+GrPg2UObvStzfzdkp5WR/SFouKWymo7BCMAX
 M112i7gsMo+TsAyw5KqMKUHoy1VYq/gzzE+MHvaIdhO2BfMlz1LMOEFWxLQXFNU7ohmTZxR7Yb
 j8A=
X-IronPort-AV: E=Sophos;i="5.78,368,1599516000"; 
   d="scan'208";a="14881538"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 4/4] wic: Pass canonicalized paths in PSEUDO_IGNORE_PATHS
Date: Wed, 25 Nov 2020 14:30:40 +0100
Message-ID: <b24b59382e74ed6e9a4d21063a7b729215f4fa59.1606310940.git.pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <cover.1606310940.git.pkj@axis.com>
References: <cover.1606310940.git.pkj@axis.com>
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/image_types_wic.bbclass | 2 +-
 scripts/lib/wic/partition.py         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index 286e0f5d54..9c1605c29c 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -5,7 +5,7 @@ WICVARS ?= "\
            IMAGE_LINK_NAME IMAGE_ROOTFS INITRAMFS_FSTYPES INITRD INITRD_LIVE ISODIR RECIPE_SYSROOT_NATIVE \
            ROOTFS_SIZE STAGING_DATADIR STAGING_DIR STAGING_LIBDIR TARGET_SYS \
            KERNEL_IMAGETYPE MACHINE INITRAMFS_IMAGE INITRAMFS_IMAGE_BUNDLE INITRAMFS_LINK_NAME APPEND \
-           ASSUME_PROVIDED PSEUDO_IGNORE_PATHS"
+           ASSUME_PROVIDED PSEUDO_IGNORE_REAL_PATHS"
 
 inherit ${@bb.utils.contains('INITRAMFS_IMAGE_BUNDLE', '1', 'kernel-artifact-names', '', d)}
 
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index ebe250b00d..e910fd3fa0 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -211,7 +211,7 @@ class Partition():
             pseudo += "export PSEUDO_LOCALSTATEDIR=%s;" % pseudo_dir
             pseudo += "export PSEUDO_PASSWD=%s;" % rootfs_dir
             pseudo += "export PSEUDO_NOSYMLINKEXP=1;"
-            pseudo += "export PSEUDO_IGNORE_PATHS=%s;" % (rootfs + "," + (get_bitbake_var("PSEUDO_IGNORE_PATHS") or ""))
+            pseudo += "export PSEUDO_IGNORE_PATHS=%s;" % (os.path.realpath(rootfs) + "," + (get_bitbake_var("PSEUDO_IGNORE_REAL_PATHS") or ""))
             pseudo += "%s " % get_bitbake_var("FAKEROOTCMD")
         else:
             pseudo = None
