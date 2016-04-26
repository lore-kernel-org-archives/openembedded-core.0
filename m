Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 04CEB700EB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 12:46:38 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 26 Apr 2016 05:46:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,536,1455004800"; d="scan'208";a="962981586"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 26 Apr 2016 05:46:39 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 5F3C16A4002
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 06:34:15 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Apr 2016 13:26:23 +0300
Message-Id: <a840fa4f0ff8af6f54891f0c9af068f337b5f53d.1461664163.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1461664163.git.ed.bartosh@linux.intel.com>
References: <cover.1461664163.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1461664163.git.ed.bartosh@linux.intel.com>
References: <cover.1461664163.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 1/3] bmap-tools: utility to create block map files
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
X-List-Received-Date: Tue, 26 Apr 2016 12:46:39 -0000

From: "Alexander D. Kanevskiy" <kad@kad.name>

Bmap-tools - tools to generate block map (AKA bmap) and
flash images using bmap. Bmaptool is a generic tool for
creating the block map (bmap) for a file and copying files
using the block map.

The idea is that large file containing unused blocks, like
raw system image files, can be copied or flashed a lot
faster with bmaptool than with traditional tools like
"dd" or "cp".

Standalone version of the tool provided in deploy/tools
directory and can be easily used on any Linux system with
Python 2.7+ installed.

[YOCTO #9414]

Signed-off-by: Alexander D. Kanevskiy <kad@kad.name>
Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/recipes-support/bmap-tools/bmap-tools_3.2.bb | 41 +++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 meta/recipes-support/bmap-tools/bmap-tools_3.2.bb

diff --git a/meta/recipes-support/bmap-tools/bmap-tools_3.2.bb b/meta/recipes-support/bmap-tools/bmap-tools_3.2.bb
new file mode 100644
index 0000000..4640820
--- /dev/null
+++ b/meta/recipes-support/bmap-tools/bmap-tools_3.2.bb
@@ -0,0 +1,41 @@
+SUMMARY = "Tools to generate block map (AKA bmap) and flash images using bmap"
+DESCRIPTION = "Bmap-tools - tools to generate block map (AKA bmap) and flash images using \
+bmap. Bmaptool is a generic tool for creating the block map (bmap) for a file, \
+and copying files using the block map. The idea is that large file containing \
+unused blocks, like raw system image files, can be copied or flashed a lot \
+faster with bmaptool than with traditional tools like "dd" or "cp"."
+HOMEPAGE = "http://git.infradead.org/users/dedekind/bmap-tools.git"
+SECTION = "devel/python"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "ftp://ftp.infradead.org/pub/bmap-tools/bmap-tools-${PV}.tgz"
+SRC_URI[md5sum] = "92cdad1cb4dfa0cca7176c8e22752616"
+SRC_URI[sha256sum] = "cc6c7f7dc0a37e2a32deb127308e24e6c4b80bfb54f3803c308efab02bf2d434"
+
+inherit setuptools deploy
+
+RDEPENDS_${PN} += "python-compression python-core python-unittest"
+
+BBCLASSEXTEND = "nativesdk native"
+
+do_install_append_class-native() {
+    sed -i -e 's|^#!.*/usr/bin/env python|#! /usr/bin/env nativepython|' ${D}${bindir}/bmaptool
+}
+
+do_deploy[sstate-outputdirs] = "${DEPLOY_DIR_TOOLS}"
+do_deploy_class-native() {
+    cp bmaptool __main__.py
+    python -m zipfile -c bmaptool.zip bmaptools __main__.py
+    echo '#!/usr/bin/env python' | cat - bmaptool.zip > bmaptool-standalone
+    install -d ${DEPLOYDIR}
+    install -m 0755 bmaptool-standalone ${DEPLOYDIR}/bmaptool-${PV}
+    rm -f ${DEPLOYDIR}/bmaptool
+    ln -sf ./bmaptool-${PV} ${DEPLOYDIR}/bmaptool
+}
+
+do_deploy() {
+        :
+}
+
+addtask deploy before do_package after do_install
-- 
2.1.4


