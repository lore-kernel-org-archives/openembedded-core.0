Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QODkc-0000sw-40
	for openembedded-core@lists.openembedded.org;
	Sun, 22 May 2011 20:51:42 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 22 May 2011 11:48:43 -0700
X-ExtLoop1: 1
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.133])
	by orsmga002.jf.intel.com with ESMTP; 22 May 2011 11:48:43 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 22 May 2011 11:48:30 -0700
Message-Id: <d3471c33d4c9cc96b3ac3165f9d0bed854050549.1306089781.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1306089781.git.sgw@linux.intel.com>
References: <cover.1306089781.git.sgw@linux.intel.com>
In-Reply-To: <cover.1306089781.git.sgw@linux.intel.com>
References: <cover.1306089781.git.sgw@linux.intel.com>
Subject: [PATCH 6/9] opkg_svn.bb: Install rcS.d into $D instead of $IMAGE_ROOTFS
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
X-List-Received-Date: Sun, 22 May 2011 18:51:42 -0000

From: Khem Raj <raj.khem@gmail.com>

Remove headerfix.patch, its already applied upstream

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/opkg/opkg/headerfix.patch |   19 -------------------
 meta/recipes-devtools/opkg/opkg_svn.bb          |    3 +--
 2 files changed, 1 insertions(+), 21 deletions(-)
 delete mode 100644 meta/recipes-devtools/opkg/opkg/headerfix.patch

diff --git a/meta/recipes-devtools/opkg/opkg/headerfix.patch b/meta/recipes-devtools/opkg/opkg/headerfix.patch
deleted file mode 100644
index b3515a0..0000000
--- a/meta/recipes-devtools/opkg/opkg/headerfix.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Without this, the FILE reference in this header can cause compile issues.
-
-RP - 29/1/10
-
-Upstream-Status: Pending
-
-Index: trunk/libopkg/pkg_dest.h
-===================================================================
---- trunk.orig/libopkg/pkg_dest.h	2010-01-29 09:37:22.000000000 +0000
-+++ trunk/libopkg/pkg_dest.h	2010-01-29 09:37:33.000000000 +0000
-@@ -18,6 +18,8 @@
- #ifndef PKG_DEST_H
- #define PKG_DEST_H
- 
-+#include <stdio.h>
-+
- typedef struct pkg_dest pkg_dest_t;
- struct pkg_dest
- {
diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtools/opkg/opkg_svn.bb
index 5964a47..5f07c17 100644
--- a/meta/recipes-devtools/opkg/opkg_svn.bb
+++ b/meta/recipes-devtools/opkg/opkg_svn.bb
@@ -11,7 +11,6 @@ RREPLACES_${PN} = "opkg-nogpg"
 
 SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;proto=http \
            file://add_vercmp.patch \
-           file://headerfix.patch \
 "
 
 S = "${WORKDIR}/trunk"
@@ -34,7 +33,7 @@ do_install_append() {
 pkg_postinst_${PN} () {
 #!/bin/sh
 if [ "x$D" != "x" ]; then
-	install -d ${IMAGE_ROOTFS}/${sysconfdir}/rcS.d
+	install -d $D${sysconfdir}/rcS.d
 	# this happens at S98 where our good 'ole packages script used to run
 	echo "#!/bin/sh
 opkg-cl configure
-- 
1.7.3.4



