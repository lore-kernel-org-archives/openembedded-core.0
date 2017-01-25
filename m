Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 7DBA671D31
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 17:29:03 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga104.fm.intel.com with ESMTP; 25 Jan 2017 09:29:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,285,1477983600"; d="scan'208";a="52358340"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 25 Jan 2017 09:29:04 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 4E10F6A4080;
	Wed, 25 Jan 2017 09:28:06 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jan 2017 19:06:37 +0200
Message-Id: <1485363997-26897-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH v2] wic: change location of .env files
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
X-List-Received-Date: Wed, 25 Jan 2017 17:29:05 -0000

Current location of .env files $STAGING_DIR/imagedata. It doesn't
depend on machine and be rewritten by the builds for different
machines.

Changed location to $STAGING_DIR/$MACHINE/imagedata to avoid .env
files to be rewritten.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image.bbclass          | 2 +-
 meta/classes/image_types.bbclass    | 2 +-
 meta/lib/oeqa/selftest/wic.py       | 3 ++-
 meta/recipes-core/meta/wic-tools.bb | 2 +-
 4 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index fb0cce3..2c58f4b 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -343,7 +343,7 @@ python do_rootfs_wicenv () {
         return
 
     stdir = d.getVar('STAGING_DIR')
-    outdir = os.path.join(stdir, 'imgdata')
+    outdir = os.path.join(stdir, d.getVar('MACHINE'), 'imgdata')
     bb.utils.mkdirhier(outdir)
     basename = d.getVar('IMAGE_BASENAME')
     with open(os.path.join(outdir, basename) + '.env', 'w') as envf:
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index ddd52f1..e391f8b 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -216,7 +216,7 @@ IMAGE_CMD_wic () {
 		bbfatal "No kickstart files from WKS_FILES were found: ${WKS_FILES}. Please set WKS_FILE or WKS_FILES appropriately."
 	fi
 
-	BUILDDIR="${TOPDIR}" wic create "$wks" --vars "${STAGING_DIR}/imgdata/" -e "${IMAGE_BASENAME}" -o "$out/" ${WIC_CREATE_EXTRA_ARGS}
+	BUILDDIR="${TOPDIR}" wic create "$wks" --vars "${STAGING_DIR}/${MACHINE/imgdata/" -e "${IMAGE_BASENAME}" -o "$out/" ${WIC_CREATE_EXTRA_ARGS}
 	mv "$out/$(basename "${wks%.wks}")"*.direct "$out${IMAGE_NAME_SUFFIX}.wic"
 	rm -rf "$out/"
 }
diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 8295b40..8864af6 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -344,7 +344,8 @@ class Wic(oeSelfTest):
         if image not in self.wicenv_cache:
             self.assertEqual(0, bitbake('%s -c do_rootfs_wicenv' % image).status)
             stdir = get_bb_var('STAGING_DIR', image)
-            self.wicenv_cache[image] = os.path.join(stdir, 'imgdata')
+            machine = get_bb_var('MACHINE', image)
+            self.wicenv_cache[image] = os.path.join(stdir, machine, 'imgdata')
         return self.wicenv_cache[image]
 
     @testcase(1347)
diff --git a/meta/recipes-core/meta/wic-tools.bb b/meta/recipes-core/meta/wic-tools.bb
index 0a53b73..aa09c82 100644
--- a/meta/recipes-core/meta/wic-tools.bb
+++ b/meta/recipes-core/meta/wic-tools.bb
@@ -14,7 +14,7 @@ python do_build_sysroot () {
 
     # Write environment variables used by wic
     # to tmp/sysroots/<machine>/imgdata/wictools.env
-    outdir = os.path.join(d.getVar('STAGING_DIR'), 'imgdata')
+    outdir = os.path.join(d.getVar('STAGING_DIR'), d.getVar('MACHINE'), 'imgdata')
     bb.utils.mkdirhier(outdir)
     with open(os.path.join(outdir, "wic-tools.env"), 'w') as envf:
         for var in ('RECIPE_SYSROOT_NATIVE', 'STAGING_DATADIR', 'STAGING_LIBDIR'):
-- 
2.1.4


