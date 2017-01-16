Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5738771C1A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 16:10:50 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP; 16 Jan 2017 08:10:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,239,1477983600"; d="scan'208";a="53630801"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 16 Jan 2017 08:10:50 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id F15D26A4082;
	Mon, 16 Jan 2017 08:09:54 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jan 2017 17:46:37 +0200
Message-Id: <61338f8343c9696b6f9fcd155acb2adaf7d2e924.1484581112.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1484581112.git.ed.bartosh@linux.intel.com>
References: <cover.1484581112.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 08/14] image-wic: add task do_build_iso
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
X-List-Received-Date: Mon, 16 Jan 2017 16:10:50 -0000

This task is needed to provide iso artifacts for isoimage-isohybrid
wic plugin. Currently this pluing uses hddimg, which is going to be
dropped from the codebase soon.

[YOCTO #10835]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image-wic.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes/image-wic.bbclass b/meta/classes/image-wic.bbclass
index ba6d8ae..370eba8 100644
--- a/meta/classes/image-wic.bbclass
+++ b/meta/classes/image-wic.bbclass
@@ -131,3 +131,12 @@ python do_efi_populate() {
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


