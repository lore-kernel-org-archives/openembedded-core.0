Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EEB726FF80
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Dec 2015 07:14:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tBS7Eno2013828
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Dec 2015 23:14:49 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 27 Dec 2015 23:14:49 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 27 Dec 2015 23:14:09 -0800
Message-ID: <175397f8ca2e9d311965ebe040b253830a98e409.1451286789.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1451286789.git.liezhi.yang@windriver.com>
References: <cover.1451286789.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 01/40] libxcb: Add a workaround for gcc5 bug on mips
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
X-List-Received-Date: Mon, 28 Dec 2015 07:14:52 -0000
Content-Type: text/plain

From: Khem Raj <raj.khem@gmail.com>

This fixes build failure for libxcb on mips

(From OE-Core master rev: cad52140997e86c6fee4938369dfce21767f1a63)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-graphics/xorg-lib/libxcb.inc          |    4 +++-
 .../libxcb/gcc-mips-pr68302-mips-workaround.patch  |   22 ++++++++++++++++++++
 2 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxcb/gcc-mips-pr68302-mips-workaround.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxcb.inc b/meta/recipes-graphics/xorg-lib/libxcb.inc
index fe31f20..e40ae77 100644
--- a/meta/recipes-graphics/xorg-lib/libxcb.inc
+++ b/meta/recipes-graphics/xorg-lib/libxcb.inc
@@ -14,7 +14,9 @@ DEPENDS = "xcb-proto xproto libxau xcb-proto-native libpthread-stubs"
 
 SRC_URI = "http://xcb.freedesktop.org/dist/libxcb-${PV}.tar.bz2 \
            file://xcbincludedir.patch \
-           file://disable-check.patch"
+           file://disable-check.patch \
+           file://gcc-mips-pr68302-mips-workaround.patch \
+          "
 
 PACKAGES_DYNAMIC = "^libxcb-.*"
 
diff --git a/meta/recipes-graphics/xorg-lib/libxcb/gcc-mips-pr68302-mips-workaround.patch b/meta/recipes-graphics/xorg-lib/libxcb/gcc-mips-pr68302-mips-workaround.patch
new file mode 100644
index 0000000..698d038
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxcb/gcc-mips-pr68302-mips-workaround.patch
@@ -0,0 +1,22 @@
+Reduce debug info for xcb.c since on mips we run into a gcc5 bug
+
+https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68302
+
+This patch is a workaround to get past the gcc bug until its resolved.
+it should have minimal impact on libxcb while make it work.
+
+Upstream-Status: Inappropriate [OE-Specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: libxcb-1.11.1/src/Makefile.am
+===================================================================
+--- libxcb-1.11.1.orig/src/Makefile.am
++++ libxcb-1.11.1/src/Makefile.am
+@@ -188,6 +188,7 @@ EXTSOURCES += xkb.c
+ if BUILD_XKB
+ lib_LTLIBRARIES += libxcb-xkb.la
+ libxcb_xkb_la_LDFLAGS = -version-info 1:0:0 -no-undefined
++CFLAGS += -g1
+ libxcb_xkb_la_LIBADD = $(XCB_LIBS)
+ nodist_libxcb_xkb_la_SOURCES = xkb.c xkb.h
+ endif
-- 
1.7.9.5


