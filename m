Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8D94178682
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 19:17:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w0MJHSKT004266
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 11:17:30 -0800
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 22 Jan 2018 11:17:26 -0800
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 22 Jan 2018 11:17:26 -0800
Message-ID: <20180122191726.45710-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH v2] mesa: link mesautil with pthreads
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
X-List-Received-Date: Mon, 22 Jan 2018 19:17:30 -0000
Content-Type: text/plain

Cherry-pick fix from mesa upstream:
   23ce168048 link mesautil with pthreads

link mesautil with pthreads to avoid:

../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In function `u_thread_setname':
/builddir/build/BUILD/mesa-17.3.1/src/util/../../src/util/u_thread.h:66: undefined reference to `pthread_setname_np'
../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In function `thrd_join':
/builddir/build/BUILD/mesa-17.3.1/src/util/../../include/c11/threads_posix.h:336: undefined reference to `pthread_join'
../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In function `u_thread_create':
/builddir/build/BUILD/mesa-17.3.1/src/util/../../src/util/u_thread.h:48: undefined reference to `pthread_sigmask'
../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In function `thrd_create':
/builddir/build/BUILD/mesa-17.3.1/src/util/../../include/c11/threads_posix.h:296: undefined reference to `pthread_create'
../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In function `u_thread_create':
/builddir/build/BUILD/mesa-17.3.1/src/util/../../src/util/u_thread.h:50: undefined reference to `pthread_sigmask'
/builddir/build/BUILD/mesa-17.3.1/src/util/../../src/util/u_thread.h:50: undefined reference to `pthread_sigmask'
../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In function `call_once':
/builddir/build/BUILD/mesa-17.3.1/src/util/../../include/c11/threads_posix.h:96: undefined reference to `pthread_once'
../../src/util/.libs/libmesautil.a(libmesautil_la-u_queue.o): In function `u_thread_get_time_nano':
/builddir/build/BUILD/mesa-17.3.1/src/util/../../src/util/u_thread.h:84: undefined reference to `pthread_getcpuclockid'
collect2: error: ld returned 1 exit status

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../files/0001-link-mesautil-with-pthreads.patch   | 54 ++++++++++++++++++++++
 meta/recipes-graphics/mesa/mesa_17.3.3.bb          |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-link-mesautil-with-pthreads.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-link-mesautil-with-pthreads.patch b/meta/recipes-graphics/mesa/files/0001-link-mesautil-with-pthreads.patch
new file mode 100644
index 0000000000..38ddf49af6
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-link-mesautil-with-pthreads.patch
@@ -0,0 +1,54 @@
+Upstream-Status: Backport
+Signed-off-by: Randy MacLeod <randy.macleod@windriver.com>
+
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
diff --git a/meta/recipes-graphics/mesa/mesa_17.3.3.bb b/meta/recipes-graphics/mesa/mesa_17.3.3.bb
index 6e3f29a2c4..623046e116 100644
--- a/meta/recipes-graphics/mesa/mesa_17.3.3.bb
+++ b/meta/recipes-graphics/mesa/mesa_17.3.3.bb
@@ -10,6 +10,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-winsys-svga-drm-Include-sys-types.h.patch \
            file://0001-Makefile.vulkan.am-explictly-add-lib-expat-to-intel-.patch \
            file://0001-anv_icd.py-improve-reproducible-builds.patch \
+           file://0001-link-mesautil-with-pthreads.patch \
            "
 
 SRC_URI[md5sum] = "139b5f608b371c0d4395596162f88791"
-- 
2.11.0


