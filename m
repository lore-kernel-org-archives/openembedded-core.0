Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9A89576419
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Aug 2015 13:52:07 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 03 Aug 2015 06:52:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,601,1432623600"; d="scan'208";a="775711750"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 03 Aug 2015 06:52:06 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id C636C6A4005;
	Mon,  3 Aug 2015 06:51:20 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Aug 2015 16:51:48 +0300
Message-Id: <81dd452765558535e12dc6a25811e008ea87aaaa.1438609723.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <de1bbbaa8743b765d169fb233b6485e86f5904c0.1438609723.git.ed.bartosh@linux.intel.com>
References: <de1bbbaa8743b765d169fb233b6485e86f5904c0.1438609723.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1438609723.git.ed.bartosh@linux.intel.com>
References: <cover.1438609723.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 3/6] wic: Report recipe name for native commands
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
X-List-Received-Date: Mon, 03 Aug 2015 13:52:13 -0000

exec_native_cmd was modified to report recipe to build
native programs.

Pairs executable->recipe are hardcoded as it's not possible
to obtain this information automatically.

[YOCTO #7631]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/utils/oe/misc.py | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/utils/oe/misc.py b/scripts/lib/wic/utils/oe/misc.py
index 4978745..af831d3 100644
--- a/scripts/lib/wic/utils/oe/misc.py
+++ b/scripts/lib/wic/utils/oe/misc.py
@@ -30,6 +30,21 @@ from collections import defaultdict
 from wic import msger
 from wic.utils import runner
 
+# executable -> recipe pairs for exec_native_cmd
+NATIVE_RECIPES = {"mcopy": "mtools",
+                  "mkdosfs": "dosfstools",
+                  "mkfs.btrfs": "btrfs-tools",
+                  "mkfs.ext2": "e2fsprogs",
+                  "mkfs.ext3": "e2fsprogs",
+                  "mkfs.ext4": "e2fsprogs",
+                  "mkfs.vfat": "dosfstools",
+                  "mksquashfs": "squashfs-tools",
+                  "mkswqp": "util-linux",
+                  "parted": "parted",
+                  "sgdisk": "gptfdisk",
+                  "syslinux": "syslinux"
+                 }
+
 def __exec_cmd(cmd_and_args, as_shell=False, catch=3):
     """
     Execute command, catching stderr, stdout
@@ -85,9 +100,17 @@ def exec_native_cmd(cmd_and_args, native_sysroot, catch=3):
     rc, out = __exec_cmd(native_cmd_and_args, True, catch)
 
     if rc == 127: # shell command-not-found
-        msger.error("A native program %s required to build the image "
-                    "was not found (see details above). Please make sure "
-                    "it's installed and try again." % args[0])
+        prog = args[0]
+        msg = "A native program %s required to build the image "\
+              "was not found (see details above).\n\n" % prog
+        recipe = NATIVE_RECIPES.get(prog)
+        if recipe:
+            msg += "Please bake it with 'bitbake %s-native' "\
+                   "and try again.\n" % recipe
+        else:
+            msg += "Wic failed to find a recipe to build native %s. Please "\
+                   "file a bug against wic.\n" % prog
+        msger.error(msg)
     if out:
         msger.debug('"%s" output: %s' % (args[0], out))
 
-- 
2.1.4


