Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A95E360118
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Dec 2015 14:57:16 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 30 Dec 2015 06:57:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,501,1444719600"; d="scan'208";a="625743369"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Dec 2015 06:57:18 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Dec 2015 06:52:54 +0000
Message-Id: <75df2cf72d8739b620744ab04a5c44c1fa8d633c.1451458093.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1451458093.git.mariano.lopez@linux.intel.com>
References: <cover.1451458093.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1451458093.git.mariano.lopez@linux.intel.com>
References: <cover.1451458093.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/1] image_types.bbclass: Rebuild when WICVARS change
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
X-List-Received-Date: Wed, 30 Dec 2015 14:57:16 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

The procces to do a wic image is to save a file with
variables required by wic and then call wic using this
file. Because this is external to bitbake if the vars
change, the image won't be rebuild; an example of such
is IMAGE_BOOT_FILES.

This patch adds these variables to vardeps of do_rootfs
when a wic image is build. This will rebuild the image
if a variable needed by wic changes.

[YOCTO #8693]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/image_types.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index afe8d0c..dea3bb0 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -198,9 +198,10 @@ IMAGE_CMD_wic () {
 }
 IMAGE_CMD_wic[vardepsexclude] = "WKS_FULL_PATH WKS_FILES"
 
-# Rebuild when the wks file changes
+# Rebuild when the wks file or vars in WICVARS change
 USING_WIC = "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + ' '.join('wic.%s' % c for c in '${COMPRESSIONTYPES}'.split()), '1', '', d)}"
 do_rootfs[file-checksums] += "${@'${WKS_FULL_PATH}:%s' % os.path.exists('${WKS_FULL_PATH}') if '${USING_WIC}' else ''}"
+do_rootfs[vardeps] += "${@bb.utils.contains("USING_WIC", "1", "${WICVARS}", "", d)}"
 
 EXTRA_IMAGECMD = ""
 
-- 
1.8.4.5


