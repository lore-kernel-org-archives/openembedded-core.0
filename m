Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RI2rI-0005ws-6A
	for openembedded-core@lists.openembedded.org;
	Sun, 23 Oct 2011 20:33:20 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Oct 2011 11:27:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="66250230"
Received: from unknown (HELO swold-mobl.lan) ([10.255.14.219])
	by orsmga001.jf.intel.com with ESMTP; 23 Oct 2011 11:27:23 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Oct 2011 11:26:48 -0700
Message-Id: <98ff8ac0d10505b28a3673120d5c0777e4d7fc80.1319394187.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1319394187.git.sgw@linux.intel.com>
References: <cover.1319394187.git.sgw@linux.intel.com>
In-Reply-To: <cover.1319394187.git.sgw@linux.intel.com>
References: <cover.1319394187.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 10/27] squashfs-tools: add recipe
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
X-List-Received-Date: Sun, 23 Oct 2011 18:33:20 -0000

From: Cliff Brake <cbrake@bec-systems.com>

added xz compression option, general cleanup
---
 .../squashfs-tools/squashfs-tools_4.2.bb           |   40 ++++++++++++++++++++
 1 files changed, 40 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb

diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb
new file mode 100644
index 0000000..6691797
--- /dev/null
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb
@@ -0,0 +1,40 @@
+# Note, we can probably remove the lzma option as it has be replaced with xz,
+# and I don't think the kernel supports it any more.
+DESCRIPTION = "Tools to manipulate Squashfs filesystems."
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
+ARM_INSTRUCTION_SET = "arm"
+
+BBCLASSEXTEND = "native"
-- 
1.7.6.4



