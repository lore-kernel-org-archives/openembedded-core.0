Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cbrake@hq.bec-systems.com>) id 1RGFkm-00081y-VO
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Oct 2011 21:55:13 +0200
Received: from cbrake by happy.bec-systems.com with local (Exim 4.72)
	(envelope-from <cbrake@hq.bec-systems.com>)
	id 1RGFP3-0002Oi-4c; Tue, 18 Oct 2011 15:32:45 -0400
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Oct 2011 15:32:34 -0400
Message-Id: <1318966354-9188-1-git-send-email-cliff.brake@gmail.com>
X-Mailer: git-send-email 1.7.1
Cc: Cliff Brake <cbrake@bec-systems.com>
Subject: [PATCH] squashfs-tools: add recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Oct 2011 19:55:13 -0000

From: Cliff Brake <cbrake@bec-systems.com>

---
 .../squashfs-tools/squashfs-tools_4.2.bb           |   42 ++++++++++++++++++++
 1 files changed, 42 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb

diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb
new file mode 100644
index 0000000..18a6a66
--- /dev/null
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb
@@ -0,0 +1,42 @@
+DESCRIPTION = "Squashfs is a highly compressed read-only filesystem for Linux."
+SECTION = "base"
+LICENSE = "GPLv2 & Public Domain"
+DEPENDS = "attr zlib"
+
+PR = "0"
+
+BBCLASSEXTEND = "native"
+NATIVE_INSTALL_WORKS = "1"
+
+# required to share same place with -lzma specific packages
+FILESPATHPKG =. "squashfs-tools-${PV}:"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/squashfs/squashfs${PV}.tar.gz;name=squashfs \
+           http://downloads.sourceforge.net/sevenzip/lzma465.tar.bz2;name=lzma \
+          "
+
+LIC_FILES_CHKSUM = "file://../COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
+                    file://../../7zC.txt;beginline=12;endline=16;md5=2056cd6d919ebc3807602143c7449a7c \
+                   "
+
+S = "${WORKDIR}/squashfs${PV}/squashfs-tools"
+
+do_compile() {
+	oe_runmake mksquashfs
+}
+
+do_install () {
+	install -d ${D}${sbindir}
+	install -m 0755 mksquashfs ${D}${sbindir}/
+}
+
+# EXTRA_OEMAKE is typically: -e MAKEFLAGS=
+# the -e causes problems as CFLAGS is modified in the Makefile, so 
+# we redefine EXTRA_OEMAKE here
+EXTRA_OEMAKE = "MAKEFLAGS= LZMA_SUPPORT=1 LZMA_DIR=../.."
+
+SRC_URI[squashfs.md5sum] = "1b7a781fb4cf8938842279bd3e8ee852"
+SRC_URI[squashfs.sha256sum] = "d9e0195aa922dbb665ed322b9aaa96e04a476ee650f39bbeadb0d00b24022e96"
+SRC_URI[lzma.md5sum] = "29d5ffd03a5a3e51aef6a74e9eafb759"
+SRC_URI[lzma.sha256sum] = "c935fd04dd8e0e8c688a3078f3675d699679a90be81c12686837e0880aa0fa1e"
+
-- 
1.7.1



