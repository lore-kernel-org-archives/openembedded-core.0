Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1ROokW-00048e-EL
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Nov 2011 11:54:20 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pABAm2jp023955
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2011 02:48:02 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Fri, 11 Nov 2011 02:48:02 -0800
Message-ID: <916a101607fa80d75dc37e833a792f4373f03890.1321006415.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1321006415.git.xiaofeng.yan@windriver.com>
References: <cover.1321006415.git.xiaofeng.yan@windriver.com>
Old-Date: Fri, 11 Nov 2011 17:54:14 +0800
Date: Fri, 11 Nov 2011 18:56:20 +0800
To: <openembedded-core@lists.openembedded.org>
CC: 
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] diretfb: update to 1.4.15
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
X-List-Received-Date: Fri, 11 Nov 2011 10:54:20 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

The newest version for directfb is 1.5.3 but it's instruction set base on armv6.
Current qemuarm don't have some instructions for armv6 because some codes of \
the new version of directfb more than 1.5 are realized with assemble language,for example the lock. \
I update this recipe to 1.4.15 for directfb running more platform.

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 .../{directfb_1.4.12.bb => directfb_1.4.15.bb}     |    9 ++++-
 .../directfb-1.2.x-fix-pkgconfig-cflags.patch      |   36 +++++++++----------
 2 files changed, 24 insertions(+), 21 deletions(-)
 rename meta/recipes-graphics/directfb/{directfb_1.4.12.bb => directfb_1.4.15.bb} (63%)

diff --git a/meta/recipes-graphics/directfb/directfb_1.4.12.bb b/meta/recipes-graphics/directfb/directfb_1.4.15.bb
similarity index 63%
rename from meta/recipes-graphics/directfb/directfb_1.4.12.bb
rename to meta/recipes-graphics/directfb/directfb_1.4.15.bb
index 4e8203b..71c0876 100644
--- a/meta/recipes-graphics/directfb/directfb_1.4.12.bb
+++ b/meta/recipes-graphics/directfb/directfb_1.4.15.bb
@@ -1,10 +1,15 @@
 require directfb.inc
 
-RV = "1.4-5"
+RV = "1.4-6"
 PR = "r0"
 
 DEPENDS += "sysfsutils"
 
+SRC_URI = " \
+    http://directfb.org/downloads/Core/DirectFB-1.4/DirectFB-${PV}.tar.gz \
+    file://directfb-1.2.x-fix-pkgconfig-cflags.patch \
+    "
+
 EXTRA_OECONF = "\
   --enable-freetype=yes \
   --enable-zlib \
@@ -14,7 +19,7 @@ EXTRA_OECONF = "\
   --disable-x11 \
 "
 
-LEAD_SONAME = "libdirectfb-1.4.so.5"
+LEAD_SONAME = "libdirectfb-1.4.so.6"
 
 SRC_URI[md5sum] = "2c779c9a8456790c6c29ad85459b2600"
 SRC_URI[sha256sum] = "b119ab9c5c0c505c23e32d41ae54bd04cb474c5e58900ec0f1cf9482f892f9b2"
diff --git a/meta/recipes-graphics/directfb/files/directfb-1.2.x-fix-pkgconfig-cflags.patch b/meta/recipes-graphics/directfb/files/directfb-1.2.x-fix-pkgconfig-cflags.patch
index 274ad50..ee60718 100644
--- a/meta/recipes-graphics/directfb/files/directfb-1.2.x-fix-pkgconfig-cflags.patch
+++ b/meta/recipes-graphics/directfb/files/directfb-1.2.x-fix-pkgconfig-cflags.patch
@@ -1,9 +1,11 @@
+directfb: Get this patch from Openembedded
+
 Upstream-Status: Inappropriate [configuration]
+Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
 
-Index: DirectFB-1.4.11/directfb-internal.pc.in
-===================================================================
---- DirectFB-1.4.11.orig/directfb-internal.pc.in	2010-10-08 05:43:46.000000000 -0700
-+++ DirectFB-1.4.11/directfb-internal.pc.in	2011-04-06 13:48:23.120923997 -0700
+diff -Nur DirectFB-1.4.15/directfb-internal.pc.in DirectFB-1.4.15.new//directfb-internal.pc.in
+--- DirectFB-1.4.15/directfb-internal.pc.in	2011-09-29 17:51:21.000000000 +0800
++++ DirectFB-1.4.15.new//directfb-internal.pc.in	2011-11-03 15:14:37.000000000 +0800
 @@ -2,10 +2,10 @@
  exec_prefix=@exec_prefix@
  moduledir=@MODULEDIR@
@@ -17,31 +19,27 @@ Index: DirectFB-1.4.11/directfb-internal.pc.in
  Requires: directfb = @VERSION@
 -Cflags: @DFB_INTERNAL_CFLAGS@ -I@INTERNALINCLUDEDIR@
 +Cflags: @DFB_INTERNAL_CFLAGS@ -I${includedir}/directfb -I${includedir}
-Index: DirectFB-1.4.11/directfb.pc.in
-===================================================================
---- DirectFB-1.4.11.orig/directfb.pc.in	2010-11-15 13:13:59.000000000 -0800
-+++ DirectFB-1.4.11/directfb.pc.in	2011-04-06 14:09:33.528923998 -0700
-@@ -9,4 +9,5 @@
+diff -Nur DirectFB-1.4.15/directfb.pc.in DirectFB-1.4.15.new//directfb.pc.in
+--- DirectFB-1.4.15/directfb.pc.in	2011-09-29 17:51:21.000000000 +0800
++++ DirectFB-1.4.15.new//directfb.pc.in	2011-11-03 15:15:55.000000000 +0800
+@@ -9,4 +9,4 @@
  Requires: @DEP_VOODOO@ fusion direct
  Libs: -L${libdir} -ldirectfb @THREADLIB@ @OSX_LIBS@
- Libs.private: -L${libdir} @MEDIALIB@ @DYNLIB@ @ZLIB_LIBS@
+ Libs.private: -L${libdir} @LIBM@ @DYNLIB@ @ZLIB_LIBS@
 -Cflags: @THREADFLAGS@ -I@INCLUDEDIR@
 +Cflags: @THREADFLAGS@ -I${includedir}/directfb
-+
-Index: DirectFB-1.4.11/lib/fusion/fusion.pc.in
-===================================================================
---- DirectFB-1.4.11.orig/lib/fusion/fusion.pc.in	2010-10-08 05:43:46.000000000 -0700
-+++ DirectFB-1.4.11/lib/fusion/fusion.pc.in	2011-04-06 13:48:23.120923997 -0700
+diff -Nur DirectFB-1.4.15/lib/fusion/fusion.pc.in DirectFB-1.4.15.new//lib/fusion/fusion.pc.in
+--- DirectFB-1.4.15/lib/fusion/fusion.pc.in	2011-09-29 17:51:21.000000000 +0800
++++ DirectFB-1.4.15.new//lib/fusion/fusion.pc.in	2011-11-03 15:16:46.000000000 +0800
 @@ -8,4 +8,4 @@
  Version: @VERSION@
  Requires: direct
  Libs: -L${libdir} -lfusion
 -Cflags: -I@INCLUDEDIR@
 +Cflags: -I${includedir}/directfb -I${includedir}
-Index: DirectFB-1.4.11/lib/voodoo/voodoo.pc.in
-===================================================================
---- DirectFB-1.4.11.orig/lib/voodoo/voodoo.pc.in	2010-10-08 05:43:46.000000000 -0700
-+++ DirectFB-1.4.11/lib/voodoo/voodoo.pc.in	2011-04-06 13:48:23.120923997 -0700
+diff -Nur DirectFB-1.4.15/lib/voodoo/voodoo.pc.in DirectFB-1.4.15.new//lib/voodoo/voodoo.pc.in
+--- DirectFB-1.4.15/lib/voodoo/voodoo.pc.in	2011-09-29 17:51:21.000000000 +0800
++++ DirectFB-1.4.15.new//lib/voodoo/voodoo.pc.in	2011-11-03 15:17:34.000000000 +0800
 @@ -8,4 +8,4 @@
  Version: @VERSION@
  Requires: direct
-- 
1.7.0.4



