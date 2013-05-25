Return-Path: <andrea.adami@gmail.com>
Received: from smtp209.alice.it (smtp209.alice.it [82.57.200.105])
	by mail.openembedded.org (Postfix) with ESMTP id C71C660420
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 May 2013 23:23:15 +0000 (UTC)
Received: from mizar.localdomain (79.20.230.17) by smtp209.alice.it
	(8.6.060.15) id 511CF61A0FE2AB15; Sun, 26 May 2013 01:23:15 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 May 2013 01:23:02 +0200
Message-Id: <1369524182-994-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [PATCH] cramfs: import recipe from meta-oe
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
X-List-Received-Date: Sat, 25 May 2013 23:23:16 -0000

* though listed in IMAGE_FSTYPES the helper is missing so
* make oe-core autosufficient importing the recipe.
* Fix PN -> BPN to avoid fetch errors with cramfs-native

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta/recipes-support/cramfs/cramfs_1.1.bb | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta/recipes-support/cramfs/cramfs_1.1.bb

diff --git a/meta/recipes-support/cramfs/cramfs_1.1.bb b/meta/recipes-support/cramfs/cramfs_1.1.bb
new file mode 100644
index 0000000..0bca0e1
--- /dev/null
+++ b/meta/recipes-support/cramfs/cramfs_1.1.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "Builds cramfs filesystems for embedded systems"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
+DEPENDS = "zlib"
+
+PE = "1"
+
+SRC_URI = "http://sourceforge.net/projects/cramfs/files/cramfs/1.1/${BPN}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "d3912b9f7bf745fbfea68f6a9b9de30f"
+SRC_URI[sha256sum] = "133caca2c4e7c64106555154ee0ff693f5cf5beb9421ce2eb86baee997d22368"
+
+EXTRA_OEMAKE = "\
+    'CC=${CC}' \
+    'CFLAGS=${CFLAGS}' \
+    'LDFLAGS=${LDFLAGS}' \
+"
+
+do_compile_prepend() {
+    ln -sf GNUmakefile Makefile
+}
+
+do_install() {
+    install -d ${D}${bindir}
+    install mkcramfs ${D}${bindir}
+    install cramfsck ${D}${bindir}
+}
+
+BBCLASSEXTEND = "native"
-- 
1.8.1.5


