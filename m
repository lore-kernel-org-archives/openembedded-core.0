Return-Path: <denis@denix.org>
X-Greylist: delayed 317 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 13 Feb 2020 06:29:05 UTC
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.openembedded.org (Postfix) with ESMTP id 7417F6073C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 06:29:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DF4BD40C0A;
	Thu, 13 Feb 2020 06:23:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id rMBrDOFhYn9Q; Thu, 13 Feb 2020 06:23:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C0303409E1;
	Thu, 13 Feb 2020 06:23:48 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 735531743FC;
	Thu, 13 Feb 2020 01:23:48 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Feb 2020 01:23:44 -0500
Message-Id: <1581575024-31531-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] wayland: upgrade 1.17.0 -> 1.18.0
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
X-List-Received-Date: Thu, 13 Feb 2020 06:29:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Denys Dmytriyenko <denys@ti.com>

This is the official release for Wayland 1.18. The main new features in
this release are:

- Add support for the Meson build system (autotools is still supported
  but will be removed in a future release)
- Add API to tag proxy objects to allow applications and toolkits to
  share the same Wayland connection
- Track wayland-server timers in user-space to prevent creating too
  many FDs
- Add wl_global_remove, a new function to mitigate race conditions with
  globals
https://lists.freedesktop.org/archives/wayland-devel/2020-February/041207.html

2 upstreamed patches are dropped.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...1-scanner-Add-configure-check-for-strndup.patch |  50 -------
 ...l_priv_signal-to-wayland-server-private.h.patch | 166 ---------------------
 .../{wayland_1.17.0.bb => wayland_1.18.0.bb}       |   8 +-
 3 files changed, 3 insertions(+), 221 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/wayland/0001-scanner-Add-configure-check-for-strndup.patch
 delete mode 100644 meta/recipes-graphics/wayland/wayland/0002-Move-wl_priv_signal-to-wayland-server-private.h.patch
 rename meta/recipes-graphics/wayland/{wayland_1.17.0.bb => wayland_1.18.0.bb} (84%)

diff --git a/meta/recipes-graphics/wayland/wayland/0001-scanner-Add-configure-check-for-strndup.patch b/meta/recipes-graphics/wayland/wayland/0001-scanner-Add-configure-check-for-strndup.patch
deleted file mode 100644
index c443587..0000000
--- a/meta/recipes-graphics/wayland/wayland/0001-scanner-Add-configure-check-for-strndup.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 3c8b4467a1ca229e72fb5223787ed400a19c65c0 Mon Sep 17 00:00:00 2001
-From: Joshua Watt <JPEWhacker@gmail.com>
-Date: Fri, 25 Oct 2019 21:03:23 -0500
-Subject: [PATCH] scanner: Add configure check for strndup
-
-Some platforms may not have strndup() (e.g. MinGW), so provide a
-equivalent implementation if it's not found.
-
-Upstream-Status: Accepted [4a1f348c20157db7bd7c759fdeb23fbe8729c571]
-Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
----
- configure.ac  |  2 +-
- src/scanner.c | 11 +++++++++++
- 2 files changed, 12 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 8d56f2b..1c99e21 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -63,7 +63,7 @@ fi
- AC_SUBST(GCC_CFLAGS)
- 
- AC_CHECK_HEADERS([sys/prctl.h])
--AC_CHECK_FUNCS([accept4 mkostemp posix_fallocate prctl])
-+AC_CHECK_FUNCS([accept4 mkostemp posix_fallocate prctl strndup])
- 
- AC_ARG_ENABLE([libraries],
- 	      [AC_HELP_STRING([--disable-libraries],
-diff --git a/src/scanner.c b/src/scanner.c
-index a94be5d..27004bc 100644
---- a/src/scanner.c
-+++ b/src/scanner.c
-@@ -916,6 +916,17 @@ verify_arguments(struct parse_context *ctx,
- 
- }
- 
-+#ifndef HAVE_STRNDUP
-+char *
-+strndup(const char *s, size_t size)
-+{
-+	char *r = malloc(size + 1);
-+	strncpy(r, s, size);
-+	r[size] = '\0';
-+	return r;
-+}
-+#endif
-+
- static void
- end_element(void *data, const XML_Char *name)
- {
diff --git a/meta/recipes-graphics/wayland/wayland/0002-Move-wl_priv_signal-to-wayland-server-private.h.patch b/meta/recipes-graphics/wayland/wayland/0002-Move-wl_priv_signal-to-wayland-server-private.h.patch
deleted file mode 100644
index b05b875..0000000
--- a/meta/recipes-graphics/wayland/wayland/0002-Move-wl_priv_signal-to-wayland-server-private.h.patch
+++ /dev/null
@@ -1,166 +0,0 @@
-From e746f3bf7c8bb2f5dcf9e93edffc23b56eff12d0 Mon Sep 17 00:00:00 2001
-From: Joshua Watt <JPEWhacker@gmail.com>
-Date: Tue, 5 Nov 2019 09:09:50 -0600
-Subject: [PATCH] Move wl_priv_signal to wayland-server-private.h
-
-Including wayland-server-core.h in wayland-private.h is problematic
-because wayland-private.h is included by wayland-scanner which should be
-able to build against non-POSIX platforms (e.g. MinGW). The only reason
-that wayland-server-core.h was included in wayland-private.h was for the
-wl_private_signal definitions, so move those to a
-wayland-server-private.h file that can be included by both
-wayland-server.c and the tests.
-
-Upstream-Status: Accepted [e7d88f35eb89cf0cc77cbddd834cacc63683a9cc]
-Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
----
- Makefile.am                  |  3 +-
- src/wayland-private.h        | 22 +--------------
- src/wayland-server-private.h | 53 ++++++++++++++++++++++++++++++++++++
- src/wayland-server.c         |  1 +
- tests/newsignal-test.c       |  2 +-
- 5 files changed, 58 insertions(+), 23 deletions(-)
- create mode 100644 src/wayland-server-private.h
-
-diff --git a/Makefile.am b/Makefile.am
-index f47d055..026d981 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -56,7 +56,8 @@ libwayland_private_la_SOURCES =			\
- 	src/connection.c			\
- 	src/wayland-os.c			\
- 	src/wayland-os.h			\
--	src/wayland-private.h
-+	src/wayland-private.h			\
-+	src/wayland-server-private.h
- 
- include_HEADERS =				\
- 	src/wayland-util.h			\
-diff --git a/src/wayland-private.h b/src/wayland-private.h
-index 29516ec..dc7d12f 100644
---- a/src/wayland-private.h
-+++ b/src/wayland-private.h
-@@ -31,11 +31,11 @@
- #include <stdarg.h>
- #include <stdlib.h>
- #include <stdint.h>
-+#include <stdbool.h>
- 
- #define WL_HIDE_DEPRECATED 1
- 
- #include "wayland-util.h"
--#include "wayland-server-core.h"
- 
- /* Invalid memory address */
- #define WL_ARRAY_POISON_PTR (void *) 4
-@@ -236,26 +236,6 @@ zalloc(size_t s)
- 	return calloc(1, s);
- }
- 
--struct wl_priv_signal {
--	struct wl_list listener_list;
--	struct wl_list emit_list;
--};
--
--void
--wl_priv_signal_init(struct wl_priv_signal *signal);
--
--void
--wl_priv_signal_add(struct wl_priv_signal *signal, struct wl_listener *listener);
--
--struct wl_listener *
--wl_priv_signal_get(struct wl_priv_signal *signal, wl_notify_func_t notify);
--
--void
--wl_priv_signal_emit(struct wl_priv_signal *signal, void *data);
--
--void
--wl_priv_signal_final_emit(struct wl_priv_signal *signal, void *data);
--
- void
- wl_connection_close_fds_in(struct wl_connection *connection, int max);
- 
-diff --git a/src/wayland-server-private.h b/src/wayland-server-private.h
-new file mode 100644
-index 0000000..23fa458
---- /dev/null
-+++ b/src/wayland-server-private.h
-@@ -0,0 +1,53 @@
-+/*
-+ * Copyright © 2008-2011 Kristian Høgsberg
-+ * Copyright © 2011 Intel Corporation
-+ * Copyright © 2013 Jason Ekstrand
-+ *
-+ * Permission is hereby granted, free of charge, to any person obtaining
-+ * a copy of this software and associated documentation files (the
-+ * "Software"), to deal in the Software without restriction, including
-+ * without limitation the rights to use, copy, modify, merge, publish,
-+ * distribute, sublicense, and/or sell copies of the Software, and to
-+ * permit persons to whom the Software is furnished to do so, subject to
-+ * the following conditions:
-+ *
-+ * The above copyright notice and this permission notice (including the
-+ * next paragraph) shall be included in all copies or substantial
-+ * portions of the Software.
-+ *
-+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
-+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-+ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
-+ * NONINFRINGEMENT.  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
-+ * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
-+ * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
-+ * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-+ * SOFTWARE.
-+ */
-+
-+#ifndef WAYLAND_SERVER_PRIVATE_H
-+#define WAYLAND_SERVER_PRIVATE_H
-+
-+#include "wayland-server-core.h"
-+
-+struct wl_priv_signal {
-+	struct wl_list listener_list;
-+	struct wl_list emit_list;
-+};
-+
-+void
-+wl_priv_signal_init(struct wl_priv_signal *signal);
-+
-+void
-+wl_priv_signal_add(struct wl_priv_signal *signal, struct wl_listener *listener);
-+
-+struct wl_listener *
-+wl_priv_signal_get(struct wl_priv_signal *signal, wl_notify_func_t notify);
-+
-+void
-+wl_priv_signal_emit(struct wl_priv_signal *signal, void *data);
-+
-+void
-+wl_priv_signal_final_emit(struct wl_priv_signal *signal, void *data);
-+
-+#endif
-diff --git a/src/wayland-server.c b/src/wayland-server.c
-index 19f6a76..d6f0206 100644
---- a/src/wayland-server.c
-+++ b/src/wayland-server.c
-@@ -45,6 +45,7 @@
- 
- #include "wayland-util.h"
- #include "wayland-private.h"
-+#include "wayland-server-private.h"
- #include "wayland-server.h"
- #include "wayland-os.h"
- 
-diff --git a/tests/newsignal-test.c b/tests/newsignal-test.c
-index 47c429b..f3a7bd9 100644
---- a/tests/newsignal-test.c
-+++ b/tests/newsignal-test.c
-@@ -26,7 +26,7 @@
- #include <assert.h>
- 
- #include "test-runner.h"
--#include "wayland-private.h"
-+#include "wayland-server-private.h"
- 
- static void
- signal_notify(struct wl_listener *listener, void *data)
diff --git a/meta/recipes-graphics/wayland/wayland_1.17.0.bb b/meta/recipes-graphics/wayland/wayland_1.18.0.bb
similarity index 84%
rename from meta/recipes-graphics/wayland/wayland_1.17.0.bb
rename to meta/recipes-graphics/wayland/wayland_1.18.0.bb
index 12916a0..7a3f075 100644
--- a/meta/recipes-graphics/wayland/wayland_1.17.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.18.0.bb
@@ -13,12 +13,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b31d8f53b6aaf2b4985d7dd7810a70d1 \
 DEPENDS = "expat libffi wayland-native"
 
 SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
-	   file://fixpathinpcfiles.patch \
-           file://0001-scanner-Add-configure-check-for-strndup.patch \
-           file://0002-Move-wl_priv_signal-to-wayland-server-private.h.patch \
+           file://fixpathinpcfiles.patch \
            "
-SRC_URI[md5sum] = "d91f970aea11fd549eae023d06f91af3"
-SRC_URI[sha256sum] = "72aa11b8ac6e22f4777302c9251e8fec7655dc22f9d94ee676c6b276f95f91a4"
+SRC_URI[md5sum] = "23317697b6e3ff2e1ac8c5ba3ed57b65"
+SRC_URI[sha256sum] = "4675a79f091020817a98fd0484e7208c8762242266967f55a67776936c2e294d"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 
-- 
2.7.4


