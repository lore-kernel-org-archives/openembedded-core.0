Return-Path: <tom.zanussi@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id EABEB70EF1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Oct 2014 22:05:29 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Oct 2014 15:05:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,280,1413270000"; d="scan'208";a="623067096"
Received: from enewy-mobl1.amr.corp.intel.com (HELO localhost) ([10.254.56.8])
	by fmsmga002.fm.intel.com with ESMTP; 29 Oct 2014 15:04:47 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: philip@balister.org, maciej.borzecki@open-rnd.pl,
	openembedded-core@lists.openembedded.org
Date: Wed, 29 Oct 2014 17:04:24 -0500
Message-Id: <464ab2ede090e850c4fba52900543d19d7300879.1414618765.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <92a50f084bc31cb2824d01435737b85be99f0d1d.1414618765.git.tom.zanussi@linux.intel.com>
References: <92a50f084bc31cb2824d01435737b85be99f0d1d.1414618765.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1414618765.git.tom.zanussi@linux.intel.com>
References: <cover.1414618765.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 6/6] wic: Update bootimg-partition to use bootimg_dir
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
X-List-Received-Date: Wed, 29 Oct 2014 22:05:31 -0000

Update bootimg-partition to use bootimg_dir instead of img_deploy_dir,
to match similar usage in other plugins.

As mentioned elsewhere, plugins should use the passed-in value for
bootimg_dir directly if non-null, which corresponds to a user-assigned
value specified via a -b command-line param, and only fetch the value
from bitbake if that value is null.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
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


