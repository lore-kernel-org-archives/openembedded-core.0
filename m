Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 235036FF72
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 12:12:51 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga104.jf.intel.com with ESMTP; 12 Oct 2016 05:12:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,482,1473145200"; d="scan'208";a="18776137"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 12 Oct 2016 05:12:52 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id 60F2C6A4006;
	Wed, 12 Oct 2016 05:12:21 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Oct 2016 14:47:16 +0300
Message-Id: <1476272836-18250-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <CABcZANkSRxXwBRcC_2Jrqq-X61Vhx3OJj6fzgE0ThOF8gL+-FA@mail.gmail.com>
References: <CABcZANkSRxXwBRcC_2Jrqq-X61Vhx3OJj6fzgE0ThOF8gL+-FA@mail.gmail.com>
Cc: Christopher Larson <clarson@kergoth.com>
Subject: [PATCH] image_types.bbclass: add dependency do_image_wic -> do_bootimg
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
X-List-Received-Date: Wed, 12 Oct 2016 12:12:52 -0000

To produce certain types of images wic uses do_bootimg results
to assemble final image. For example, it copies BOOT/EFI directory
produced by do_bootimg to boot partition for every EFI image.

The tricky part of this is that do_bootimg task is not always run,
so we can't always make do_image_wic depend on do_bootimg. We only
need to do it if do_bootimg present in task graph.

Thank to Cristopher Larson for this fix.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image_types.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 5ef6f60..a7fffbc 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -219,6 +219,11 @@ USING_WIC = "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + ' '.join('wic.%s
 WKS_FILE_CHECKSUM = "${@'${WKS_FULL_PATH}:%s' % os.path.exists('${WKS_FULL_PATH}') if '${USING_WIC}' else ''}"
 do_image_wic[file-checksums] += "${WKS_FILE_CHECKSUM}"
 
+python () {
+    if d.getVar('USING_WIC', True) and 'do_bootimg' in d:
+        bb.build.addtask('do_image_wic', '', 'do_bootimg', d)
+}
+
 python do_write_wks_template () {
     """Write out expanded template contents to WKS_FULL_PATH."""
     import re
-- 
2.1.4


