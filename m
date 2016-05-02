Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2BFF565C5C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 May 2016 14:42:48 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 02 May 2016 07:42:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,567,1455004800"; d="scan'208";a="695583029"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 02 May 2016 07:42:49 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 2C9ED6A4007
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 May 2016 08:30:23 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 May 2016 15:22:32 +0300
Message-Id: <286773771f649e9899343992021d80809794cf5b.1462191317.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1462191317.git.ed.bartosh@linux.intel.com>
References: <cover.1462191317.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1462191317.git.ed.bartosh@linux.intel.com>
References: <cover.1462191317.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v3 1/6] bmap-tools: initial commit, version 3.2
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
X-List-Received-Date: Mon, 02 May 2016 14:42:49 -0000

Bmap-tools - tools to generate block map (AKA bmap) and flash images
using bmap. Bmaptool is a generic tool for creating the block map
(bmap) for a file and copying files using the block map.

The idea is that large file containing unused blocks, like raw system
image files, can be copied or flashed a lot faster with bmaptool than
with traditional tools like "dd" or "cp".

[YOCTO #9414]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/recipes-support/bmap-tools/bmap-tools_3.2.bb | 24 +++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta/recipes-support/bmap-tools/bmap-tools_3.2.bb

diff --git a/meta/recipes-support/bmap-tools/bmap-tools_3.2.bb b/meta/recipes-support/bmap-tools/bmap-tools_3.2.bb
new file mode 100644
index 0000000..e10f5fd
--- /dev/null
+++ b/meta/recipes-support/bmap-tools/bmap-tools_3.2.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Tools to generate block map (AKA bmap) and flash images using bmap"
+DESCRIPTION = "Bmap-tools - tools to generate block map (AKA bmap) and flash images using \
+bmap. Bmaptool is a generic tool for creating the block map (bmap) for a file, \
+and copying files using the block map. The idea is that large file containing \
+unused blocks, like raw system image files, can be copied or flashed a lot \
+faster with bmaptool than with traditional tools like "dd" or "cp"."
+HOMEPAGE = "http://git.infradead.org/users/dedekind/bmap-tools.git"
+SECTION = "console/utils"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "ftp://ftp.infradead.org/pub/${BPN}/${BPN}-${PV}.tgz"
+SRC_URI[md5sum] = "92cdad1cb4dfa0cca7176c8e22752616"
+SRC_URI[sha256sum] = "cc6c7f7dc0a37e2a32deb127308e24e6c4b80bfb54f3803c308efab02bf2d434"
+
+RDEPENDS_${PN} = "python-core python-compression"
+
+inherit setuptools
+
+BBCLASSEXTEND = "native"
+
+do_install_append_class-native() {
+    sed -i -e 's|^#!.*/usr/bin/env python|#! /usr/bin/env nativepython|' ${D}${bindir}/bmaptool
+}
-- 
2.1.4


