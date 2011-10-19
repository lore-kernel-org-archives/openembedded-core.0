Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cbrake@hq.bec-systems.com>) id 1RGVao-00077S-A9
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Oct 2011 14:49:58 +0200
Received: from cbrake by happy.bec-systems.com with local (Exim 4.72)
	(envelope-from <cbrake@hq.bec-systems.com>)
	id 1RGVV8-0007BC-1x; Wed, 19 Oct 2011 08:44:06 -0400
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Oct 2011 08:43:34 -0400
Message-Id: <1319028214-27568-1-git-send-email-cliff.brake@gmail.com>
X-Mailer: git-send-email 1.7.1
Cc: Cliff Brake <cbrake@bec-systems.com>
Subject: [PATCH] squashfs-tools: add recipe (2nd try)
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
X-List-Received-Date: Wed, 19 Oct 2011 12:49:58 -0000

From: Cliff Brake <cbrake@bec-systems.com>

added xz compression option, general cleanup
---
 .../squashfs-tools/squashfs-tools_4.2.bb           |   38 ++++++++++++++++++++
 1 files changed, 38 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb

diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb
new file mode 100644
index 0000000..3a9f12a
--- /dev/null
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb
@@ -0,0 +1,38 @@
+# Note, we can probably remove the lzma option as it has be replaced with xz,
+# and I don't think the kernel supports it any more.
+DESCRIPTION = "Squashfs is a highly compressed read-only filesystem for Linux."
+SECTION = "base"
+LICENSE = "GPLv2 & Public Domain"
+LIC_FILES_CHKSUM = "file://../COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
+                    file://../../7zC.txt;beginline=12;endline=16;md5=2056cd6d919ebc3807602143c7449a7c \
+                   "
+DEPENDS = "attr zlib xz"
+PR = "0"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/squashfs/squashfs${PV}.tar.gz;name=squashfs \
+           http://downloads.sourceforge.net/sevenzip/lzma465.tar.bz2;name=lzma \
+          "
+SRC_URI[squashfs.md5sum] = "1b7a781fb4cf8938842279bd3e8ee852"
+SRC_URI[squashfs.sha256sum] = "d9e0195aa922dbb665ed322b9aaa96e04a476ee650f39bbeadb0d00b24022e96"
+SRC_URI[lzma.md5sum] = "29d5ffd03a5a3e51aef6a74e9eafb759"
+SRC_URI[lzma.sha256sum] = "c935fd04dd8e0e8c688a3078f3675d699679a90be81c12686837e0880aa0fa1e"
+
+S = "${WORKDIR}/squashfs${PV}/squashfs-tools"
+
+# EXTRA_OEMAKE is typically: -e MAKEFLAGS=
+# the -e causes problems as CFLAGS is modified in the Makefile, so
+# we redefine EXTRA_OEMAKE here
+EXTRA_OEMAKE = "MAKEFLAGS= LZMA_SUPPORT=1 LZMA_DIR=../.. XZ_SUPPORT=1"
+
+do_compile() {
+        oe_runmake mksquashfs
+}
+do_install () {
+        install -d ${D}${sbindir}
+        install -m 0755 mksquashfs ${D}${sbindir}/
+}
+
+# required to share same place with -lzma specific packages
+FILESPATHPKG =. "squashfs-tools-${PV}:"
+
+BBCLASSEXTEND = "native"
-- 
1.7.1



