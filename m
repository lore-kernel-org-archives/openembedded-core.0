Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 93D7B7570D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 11:56:59 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 27 Apr 2016 04:57:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,541,1455004800"; d="scan'208";a="953979552"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 27 Apr 2016 04:56:57 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id DED7D6A4006
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 05:44:29 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Apr 2016 12:36:30 +0300
Message-Id: <c32880f5e89776d3515079d6c8ebe86111cb10ed.1461749328.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1461749328.git.ed.bartosh@linux.intel.com>
References: <cover.1461749328.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1461749328.git.ed.bartosh@linux.intel.com>
References: <cover.1461749328.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v2 1/3] bmap-tools: initial commit, version 3.2
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
X-List-Received-Date: Wed, 27 Apr 2016 11:56:59 -0000

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


