Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 06CFA75C95
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 08:53:08 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 30 Jun 2015 01:53:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,376,1432623600"; d="scan'208";a="516463058"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Jun 2015 01:53:10 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id D489E6A4005;
	Tue, 30 Jun 2015 01:52:30 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jun 2015 11:51:50 +0300
Message-Id: <1435654312-18177-19-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1435654312-18177-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1435654312-18177-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [wic][PATCH v2 18/20] wic: Fix confusing error message
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
X-List-Received-Date: Tue, 30 Jun 2015 08:53:09 -0000

Wic throws this message when any of the build artifacts are
not provided:
  Build artifacts not completely specified, exiting.
    (Use 'wic -e' or 'wic -r -b -k -n' to specify artifacts)
It was not clear which artifact was not specified.

Reworked the code to specify list of missed artifacts.
Now the message looks like this:
  The following build artifacts are not specified:
    bootimg-dir, kernel-dir, native-sysroot

[YOCTO #7912]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

diff --git a/scripts/wic b/scripts/wic
index b75d122..ac272c6 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -122,13 +122,18 @@ def wic_create_subcommand(args, usage_str):
         logging.error("Can't build roofs as bitbake is not in the $PATH")
         sys.exit(1)
 
-    if not options.image_name and not (options.rootfs_dir and
-                                       options.bootimg_dir and
-                                       options.kernel_dir and
-                                       options.native_sysroot):
-        print "Build artifacts not completely specified, exiting."
-        print "  (Use 'wic -e' or 'wic -r -b -k -n' to specify artifacts)"
-        sys.exit(1)
+    if not options.image_name:
+        missed = []
+        for val, opt in [(options.rootfs_dir, 'rootfs-dir'),
+                         (options.bootimg_dir, 'bootimg-dir'),
+                         (options.kernel_dir, 'kernel-dir'),
+                         (options.native_sysroot, 'native-sysroot')]:
+            if not val:
+                missed.append(opt)
+        if missed:
+            print "The following build artifacts are not specified:"
+            print "  " + ", ".join(missed)
+            sys.exit(1)
 
     if not options.image_name:
         options.build_check = False
-- 
2.1.4


