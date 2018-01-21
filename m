Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BD6D778761
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jan 2018 06:19:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w0L6JK52017749
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Jan 2018 22:19:20 -0800 (PST)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Sat, 20 Jan 2018 22:19:02 -0800
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 20 Jan 2018 22:18:57 -0800
Message-ID: <20180121061857.29976-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] mesa: link mesautil with pthreads
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
X-List-Received-Date: Sun, 21 Jan 2018 06:19:19 -0000
Content-Type: text/plain

Cherry-pick fix from mesa upstream:
   23ce168048 link mesautil with pthreads

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../files/0001-link-mesautil-with-pthreads.patch   | 51 ++++++++++++++++++++++
 meta/recipes-graphics/mesa/mesa_17.3.2.bb          |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-link-mesautil-with-pthreads.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-link-mesautil-with-pthreads.patch b/meta/recipes-graphics/mesa/files/0001-link-mesautil-with-pthreads.patch
new file mode 100644
index 0000000000..193c54661b
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-link-mesautil-with-pthreads.patch
@@ -0,0 +1,51 @@
+From 23ce168048698eeea3df6bb8c9de5be3ca4784cd Mon Sep 17 00:00:00 2001
+From: Igor Gnatenko <ignatenko@redhat.com>
+Date: Mon, 1 Jan 2018 22:49:00 +0100
+Subject: [PATCH] link mesautil with pthreads
+
+../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In function `u_thread_setname':
+/builddir/build/BUILD/mesa-17.3.1/src/util/../../src/util/u_thread.h:66: undefined reference to `pthread_setname_np'
+../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In function `thrd_join':
+/builddir/build/BUILD/mesa-17.3.1/src/util/../../include/c11/threads_posix.h:336: undefined reference to `pthread_join'
+../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In function `u_thread_create':
+/builddir/build/BUILD/mesa-17.3.1/src/util/../../src/util/u_thread.h:48: undefined reference to `pthread_sigmask'
+../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In function `thrd_create':
+/builddir/build/BUILD/mesa-17.3.1/src/util/../../include/c11/threads_posix.h:296: undefined reference to `pthread_create'
+../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In function `u_thread_create':
+/builddir/build/BUILD/mesa-17.3.1/src/util/../../src/util/u_thread.h:50: undefined reference to `pthread_sigmask'
+/builddir/build/BUILD/mesa-17.3.1/src/util/../../src/util/u_thread.h:50: undefined reference to `pthread_sigmask'
+../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In function `call_once':
+/builddir/build/BUILD/mesa-17.3.1/src/util/../../include/c11/threads_posix.h:96: undefined reference to `pthread_once'
+../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In function `u_thread_get_time_nano':
+/builddir/build/BUILD/mesa-17.3.1/src/util/../../src/util/u_thread.h:84: undefined reference to `pthread_getcpuclockid'
+collect2: error: ld returned 1 exit status
+
+Reviewed-by: Adam Jackson <ajax@redhat.com>
+Signed-off-by: Igor Gnatenko <ignatenko@redhat.com>
+---
+ src/util/Makefile.am | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/util/Makefile.am b/src/util/Makefile.am
+index a5241ad27b..633907b9fd 100644
+--- a/src/util/Makefile.am
++++ b/src/util/Makefile.am
+@@ -31,6 +31,7 @@ noinst_LTLIBRARIES = \
+ 	libxmlconfig.la
+ 
+ AM_CPPFLAGS = \
++	$(PTHREAD_CFLAGS) \
+ 	-I$(top_srcdir)/include
+ 
+ libmesautil_la_CPPFLAGS = \
+@@ -50,6 +51,7 @@ libmesautil_la_SOURCES = \
+ 	$(MESA_UTIL_GENERATED_FILES)
+ 
+ libmesautil_la_LIBADD = \
++	$(PTHREAD_LIBS) \
+ 	$(CLOCK_LIB) \
+ 	$(ZLIB_LIBS) \
+ 	$(LIBATOMIC_LIBS)
+-- 
+2.14.3
+
diff --git a/meta/recipes-graphics/mesa/mesa_17.3.2.bb b/meta/recipes-graphics/mesa/mesa_17.3.2.bb
index 9e9b23322a..8cdcf6c84f 100644
--- a/meta/recipes-graphics/mesa/mesa_17.3.2.bb
+++ b/meta/recipes-graphics/mesa/mesa_17.3.2.bb
@@ -9,6 +9,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://llvm-config-version.patch \
            file://0001-winsys-svga-drm-Include-sys-types.h.patch \
            file://0001-Makefile.vulkan.am-explictly-add-lib-expat-to-intel-.patch \
+           file://0001-link-mesautil-with-pthreads.patch \
            "
 
 SRC_URI[md5sum] = "5c59b779925f504ffd0f13c7dcd29ac6"
-- 
2.11.0


