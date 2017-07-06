Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 5F39B77BBE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 08:09:33 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga105.jf.intel.com with ESMTP; 06 Jul 2017 01:09:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,316,1496127600"; d="scan'208";a="123460468"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 06 Jul 2017 01:09:35 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 60631580571
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 01:09:34 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 10:56:47 +0300
Message-Id: <c1ab5f6f84e705b6d17e1aa7b03a2cc0aa0cdcf4.1499326977.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1499326977.git.ed.bartosh@linux.intel.com>
References: <cover.1499326977.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 6/8] image_types_wic: set default WKS_FILE_DEPENDS
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
X-List-Received-Date: Thu, 06 Jul 2017 08:09:33 -0000

The default set of dependencies used via wic-tools is not used
anymore as wic images don't depend on wic-tools.

Set of packages required to produce wic image depends on the content
of the .wks file, so WKS_FILE_DEPENDS variable should be used to
provide correct list of dependencies when WKS_FILE variable is set.

As WKS_FILE_DEPENDS is not used in many existing recipes yet we need
to provide default value for it to ensure that removal of wic-tool
dependency doesn't cause image build failures.

Initialized WKS_FILE_DEPENDS with the set of dependencies previously
brought by wic-tool. This is done to provide compatibility and to
avoid breakages of existing image recipes that rely on current set
of dependencies.

Note: This is a temporary solution for transition period.
After some time the list will be either reduced or removed.
Recommended solution is to use WKS_FILE_DEPENDS in image recipes
together with WKS_FILE to specify dependencies.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image_types_wic.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index 05ee68d..e9750b5 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -40,7 +40,10 @@ USING_WIC = "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + ' '.join('wic.%s
 WKS_FILE_CHECKSUM = "${@'${WKS_FULL_PATH}:%s' % os.path.exists('${WKS_FULL_PATH}') if '${USING_WIC}' else ''}"
 do_image_wic[file-checksums] += "${WKS_FILE_CHECKSUM}"
 do_image_wic[depends] += "${@' '.join('%s-native:do_populate_sysroot' % r for r in ('parted', 'gptfdisk', 'dosfstools', 'mtools'))}"
-WKS_FILE_DEPENDS ??= ''
+WKS_FILE_DEPENDS ??= 'syslinux-native bmap-tools-native cdrtools-native btrfs-tools-native squashfs-tools-native'
+WKS_FILE_DEPENDS_append_x86 = " syslinux grub-efi systemd-boot"
+WKS_FILE_DEPENDS_append_x86-64 = " syslinux grub-efi systemd-boot"
+
 DEPENDS += "${@ '${WKS_FILE_DEPENDS}' if d.getVar('USING_WIC') else '' }"
 
 python () {
-- 
2.1.4


