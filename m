Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 0B42D763F0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 13:04:24 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 26 Jan 2017 05:04:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,289,1477983600"; d="scan'208";a="57478012"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 26 Jan 2017 05:04:24 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 2E96F6A4006
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 05:03:26 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jan 2017 14:40:36 +0200
Message-Id: <fbac3d9419e4f18550c4bc854ac41ff80c8e01c6.1485434085.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485434085.git.ed.bartosh@linux.intel.com>
References: <cover.1485434085.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v2 08/14] image-wic: add task do_build_iso
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
X-List-Received-Date: Thu, 26 Jan 2017 13:04:24 -0000

This task is needed to provide iso artifacts for isoimage-isohybrid
wic plugin. Currently this pluing uses hddimg, which is going to be
dropped from the codebase soon.

[YOCTO #10835]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image-wic.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes/image-wic.bbclass b/meta/classes/image-wic.bbclass
index 41b406d..bde17a3 100644
--- a/meta/classes/image-wic.bbclass
+++ b/meta/classes/image-wic.bbclass
@@ -138,3 +138,12 @@ python do_efi_populate() {
 }
 
 addtask do_efi_populate after do_rootfs before do_image
+
+# Build iso artifacts
+
+python do_build_iso() {
+    # do_bootimage calls build_iso, check to avoid building twice
+    if 'do_bootimg' not in d and d.getVar('IMG_LIVE_CLASS'):
+        bb.build.exec_func('build_iso', d)
+}
+addtask do_build_iso after do_image before do_image_wic
-- 
2.1.4


