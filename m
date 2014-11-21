Return-Path: <tom.zanussi@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3FD5A72160
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Nov 2014 16:08:26 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 21 Nov 2014 08:08:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,432,1413270000"; d="scan'208";a="626255484"
Received: from smoffitt-mobl.ger.corp.intel.com (HELO localhost)
	([10.255.13.176])
	by fmsmga001.fm.intel.com with ESMTP; 21 Nov 2014 08:08:06 -0800
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Fri, 21 Nov 2014 10:07:52 -0600
Message-Id: <60ba279d74f8f1d0feec1781907ebc4e7747fe10.1416585198.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <db14e81d99065b4381af1878a856f4933a0aa9c5.1416585198.git.tom.zanussi@linux.intel.com>
References: <db14e81d99065b4381af1878a856f4933a0aa9c5.1416585198.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1416585198.git.tom.zanussi@linux.intel.com>
References: <cover.1416585198.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 6/6][dizzy] wic: Update bootimg-partition to use bootimg_dir
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
X-List-Received-Date: Fri, 21 Nov 2014 16:08:27 -0000

Update bootimg-partition to use bootimg_dir instead of img_deploy_dir,
to match similar usage in other plugins.

As mentioned elsewhere, plugins should use the passed-in value for
bootimg_dir directly if non-null, which corresponds to a user-assigned
value specified via a -b command-line param, and only fetch the value
from bitbake if that value is null.

(From OE-Core rev: 3822f8a7b33da56ecd9144b4bcae50734fb1af81)

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/wic/plugins/source/bootimg-partition.py | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py b/scripts/lib/wic/plugins/source/bootimg-partition.py
index cc72b2f..abf2494 100644
--- a/scripts/lib/wic/plugins/source/bootimg-partition.py
+++ b/scripts/lib/wic/plugins/source/bootimg-partition.py
@@ -71,8 +71,13 @@ class BootimgPartitionPlugin(SourcePlugin):
         install_cmd = "install -d %s" % hdddir
         exec_cmd(install_cmd)
 
+        if not bootimg_dir:
+            bootimg_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
+            if not bootimg_dir:
+                msger.error("Couldn't find DEPLOY_DIR_IMAGE, exiting\n")
+
         msger.debug('Bootimg dir: %s' % bootimg_dir)
-        img_deploy_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
+
         boot_files = get_bitbake_var("IMAGE_BOOT_FILES")
 
         if not boot_files:
@@ -93,7 +98,7 @@ class BootimgPartitionPlugin(SourcePlugin):
 
         for deploy_entry in deploy_files:
             src, dst = deploy_entry
-            src_path = os.path.join(img_deploy_dir, src)
+            src_path = os.path.join(bootimg_dir, src)
             dst_path = os.path.join(hdddir, dst)
 
             msger.debug('Install %s as %s' % (os.path.basename(src_path),
-- 
1.9.3


