Received: from smtp2.axis.com (smtp2.axis.com [])
 by mx.groups.io with SMTP id smtpd.web12.6954.1606312098403602466
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2020 05:48:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=oEbq3+e4;
 spf=fail (domain: axis.com, ip: <nil>, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=axis.com; l=1754; q=dns/txt; s=axis-central1;
  t=1606312100; x=1637848100;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=XXAJEKHkTmg7YPeJeOV0v3dEVieAS1na0t8CIFcdEaU=;
  b=oEbq3+e4nRaQl5tkiugwdBLb9guwlaZHCGpxfcFHcc2aDrzf/P4+vJ3p
   tGNlzerwAZ81WQf6qgilAdjKBILTzUCzCWt0N7PSCdyxqhOjPM80wGe7m
   Su0e647Hj9C6z9f3htirTN24sJXGGWHbCJfE+wbjSldpu/sB+ZkiOt/3g
   MWJeupDajLiukHr1STcCzntygjjEzlFiiNBTViRPenvPhg+6DCX5AmgJE
   Twn3NyjXIs73O3gl1GuXwOZKc+icBjiA5pbIW1+7RjnRmKzcVoeiZWazA
   iKt7JvhT881tJ8Tnv/ycg+JK4nczgqYCXBjmWuoW/6rfTzFWEUJvET05p
   A==;
IronPort-SDR: LUi58Nd2zFjNX+1pcrg6zZnPuP3CXgSJgFNICNU09cCBJk+LEcMXTstsaRAln/HWL1vPhNmaSP
 0P7neo8gpiTAIr1yWac5kwgMbTtFksKuk7nEEaXKk0ZnqKBRulFtYj/P5OKNkgjLS4dmek/OWZ
 haBzoR6VVhcjDSTTXf2GSATEqFjGOdTfXicraExhNubaflgQMekZieB43mWQeguOmkL+c/l/AD
 bve4EwonIeicy22wBgr9LHCajfyO0r78KaC/RNVW1kLI9FH/ueX/3MDjH024l6NmEje/Y6SqOT
 lok=
X-IronPort-AV: E=Sophos;i="5.78,368,1599516000"; 
   d="scan'208";a="14882343"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 4/4] wic: Pass canonicalized paths in PSEUDO_IGNORE_PATHS
Date: Wed, 25 Nov 2020 14:48:13 +0100
Message-ID: <ef917f0a73aa7142722db2800cc21606469d1900.1606312002.git.pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <cover.1606312002.git.pkj@axis.com>
References: <cover.1606312002.git.pkj@axis.com>
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
