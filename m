Return-Path: <anuj.mittal@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4BA1178A51
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 08:08:04 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Mar 2018 00:08:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,426,1515484800"; d="scan'208";a="35517684"
Received: from anmitta2-mobl1.png.intel.com ([10.221.16.248])
	by fmsmga001.fm.intel.com with ESMTP; 05 Mar 2018 00:08:05 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Mar 2018 16:07:58 +0800
Message-Id: <1520237278-18943-1-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] buildhistory: remove duplicate renames
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
X-List-Received-Date: Mon, 05 Mar 2018 08:08:05 -0000

In cases when a package like qemu might have files with same names
in multiple directories, the rename logic might go wrong and create
multiple rename pair for a single directory.

Make sure that we process each rename pair once. Also, don't print
FILELIST as part of PKGSIZE to ensure that it gets printed only once
when reporting package changes.

Fixes [YOCTO #12559]

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oe/buildhistory_analysis.py | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index 6c0bca8..bf2a9d3 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -36,7 +36,6 @@ related_fields = {}
 related_fields['RDEPENDS'] = ['DEPENDS']
 related_fields['RRECOMMENDS'] = ['DEPENDS']
 related_fields['FILELIST'] = ['FILES']
-related_fields['PKGSIZE'] = ['FILELIST']
 related_fields['files-in-image.txt'] = ['installed-package-names.txt', 'USER_CLASSES', 'IMAGE_CLASSES', 'ROOTFS_POSTPROCESS_COMMAND', 'IMAGE_POSTPROCESS_COMMAND']
 related_fields['installed-package-names.txt'] = ['IMAGE_FEATURES', 'IMAGE_LINGUAS', 'IMAGE_INSTALL', 'BAD_RECOMMENDATIONS', 'NO_RECOMMENDATIONS', 'PACKAGE_EXCLUDE']
 
@@ -99,7 +98,17 @@ class ChangeRecord:
                                 for name in adirs - bdirs]
             files_ba = [(name, sorted(os.path.basename(item) for item in bitems if os.path.dirname(item) == name)) \
                                 for name in bdirs - adirs]
-            renamed_dirs = [(dir1, dir2) for dir1, files1 in files_ab for dir2, files2 in files_ba if files1 == files2]
+            renamed_dirs = []
+            for dir1, files1 in files_ab:
+                rename = False
+                for dir2, files2 in files_ba:
+                    if files1 == files2 and not rename:
+                        renamed_dirs.append((dir1,dir2))
+                        # Make sure that we don't use this (dir, files) pair again.
+                        files_ba.remove((dir2,files2))
+                        # If a dir has already been found to have a rename, stop and go no further.
+                        rename = True
+
             # remove files that belong to renamed dirs from aitems and bitems
             for dir1, dir2 in renamed_dirs:
                 aitems = [item for item in aitems if os.path.dirname(item) not in (dir1, dir2)]
-- 
2.7.4


