Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7658D71BD4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 16:16:03 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Jun 2017 09:15:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,315,1493708400"; d="scan'208";a="271866078"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 08 Jun 2017 09:15:35 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id D5F8958029B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 09:15:33 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Jun 2017 19:13:03 +0300
Message-Id: <1de22a24d434b511c6593029ab7b95815e9b2c22.1496938139.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1496938139.git.ed.bartosh@linux.intel.com>
References: <cover.1496938139.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 21/25] wic: add help and usage content for 'wic rm'
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
X-List-Received-Date: Thu, 08 Jun 2017 16:16:03 -0000

Added wic_rm_help and wic_rm_usage variables to help.py.
These variables contain help content that will be used in
'wic rm help' and 'wic rm --help' output.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/help.py | 59 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 58 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index e93ac4b..23d943c 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -395,7 +395,7 @@ DESCRIPTION
     The second form of the command copies file or directory to the specified directory
     on the vfat partition:
        $ wic cp test tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1/efi/
-       $ wic ls tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1/eti/
+       $ wic ls tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1/efi/
        Volume in drive : is boot
         Volume Serial Number is DB4C-FD4C
        Directory for ::/efi
@@ -411,6 +411,63 @@ DESCRIPTION
     containing the tools(parted and mtools) to use.
 """
 
+wic_rm_usage = """
+
+ Remove files or directories from the vfat partitions
+
+ usage: wic rm <image>:<vfat partition><path> [--native-sysroot <path>]
+
+ This command  removes files or directories from the vfat partitions of partitioned
+ image.
+
+ See 'wic help rm' for more detailed instructions.
+
+"""
+
+wic_rm_help = """
+
+NAME
+    wic rm - remove files or directories from the vfat partitions
+
+SYNOPSIS
+    wic rm <src> <image>:<vfat partition><path>
+    wic rm <src> <image>:<vfat partition><path> --native-sysroot <path>
+
+DESCRIPTION
+    This command removes files or directories from the vfat partition of the
+    wic image:
+
+        $ wic ls ./tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1
+        Volume in drive : is boot
+         Volume Serial Number is 11D0-DE21
+        Directory for ::/
+
+        libcom32 c32    186500 2017-06-02  15:15
+        libutil  c32     24148 2017-06-02  15:15
+        syslinux cfg       209 2017-06-02  15:15
+        vesamenu c32     27104 2017-06-02  15:15
+        vmlinuz        6926384 2017-06-02  15:15
+                5 files           7 164 345 bytes
+                                 16 582 656 bytes free
+
+        $ wic rm ./tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1/libutil.c32
+
+        $ wic ls ./tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1
+        Volume in drive : is boot
+         Volume Serial Number is 11D0-DE21
+        Directory for ::/
+
+        libcom32 c32    186500 2017-06-02  15:15
+        syslinux cfg       209 2017-06-02  15:15
+        vesamenu c32     27104 2017-06-02  15:15
+        vmlinuz        6926384 2017-06-02  15:15
+                4 files           7 140 197 bytes
+                                 16 607 232 bytes free
+
+    The -n option is used to specify the path to the native sysroot
+    containing the tools(parted and mtools) to use.
+"""
+
 wic_plugins_help = """
 
 NAME
-- 
2.1.4


