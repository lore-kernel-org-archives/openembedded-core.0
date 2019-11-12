Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
	[209.85.166.45])
	by mail.openembedded.org (Postfix) with ESMTP id 7EBA37CECE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2019 19:33:57 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id x21so1801697ior.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2019 11:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=KqaXNa2kM3GIn7TntEXWpzt+ylNDioJFaozszY01a+g=;
	b=htdtWZ3Y6hT7g3dPWlKaUSU5nev4C7vkIgIAiqybsX69etpHXLwvbfXSL1OB6PPMez
	RZLyyDolEsc+U4gqWB/Y9TMfHPolw+QCHDpLgD6byQ6W8SbzsKOfSqxpYpQkOOAsep0T
	pt0SEGaB3Py1pIqTgWi7f3BTJM9IJ9D7+YKPSp5gQfXlx/+wILGclRCfsswtQ7KbBxoJ
	CfUN3duHl1ggeV/9L8wi4+tcdRTmn49oxyLJ97GmC8nrw4zcfNzjy1gOISGKmj9+94Mb
	9kf9mpybBau8rsxJItKQLtg2mu6rC4fvscdwRM3ofvq/coUnpJiISwiPHxu/7nhjxEvG
	5pPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=KqaXNa2kM3GIn7TntEXWpzt+ylNDioJFaozszY01a+g=;
	b=qso7fa8cJ5kZBHIRY7K8eLrJSfST5Ym9/WvOr1SifojJQ6qDrCBwVu4NveAI0fH2Pa
	K9jPkL229Ca67f9RWN70ybEgqK/ZIZezEvqvsEWAqfcXDnGP6qQd1L94gYncnARiDiy5
	SiilVGIt4pE+BA2V5U8owCbbeaiKAnhM/mt8aHe1AE4x6aSKfNSnwyWB5unAi6OJ5r5I
	H9JG0nXU/vvUR2vBkOMcZX24K2jnU1f9QoM8/sQKayGrF7UHiZJrePXoKpsw88CXtKV5
	UY7lvrNZ+iR/WUiAE0Ne5KmZfK41fDOD8cjTGi+RgirRbK+dCAGQRib4ALDFYDkLQ9HX
	cF4g==
X-Gm-Message-State: APjAAAVK2O/iMFzYo00x2LqdMEBTtJwqOivOcaxx8Q63UGBp62GUYIfD
	+t8ViOKBkniqtBZLBkj93ITRhp3uX3o=
X-Google-Smtp-Source: APXvYqynUoI79mQp2RmYDTeBMDDTeXLQb0eI8dTAfcQQpK1gpD16NzE9h3219axb+D7ouIq6ccatTQ==
X-Received: by 2002:a02:c05a:: with SMTP id u26mr7285986jam.58.1573587237871; 
	Tue, 12 Nov 2019 11:33:57 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id p20sm525531iob.1.2019.11.12.11.33.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 12 Nov 2019 11:33:57 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Nov 2019 13:33:51 -0600
Message-Id: <20191112193351.1280266-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] wayland: Fix wayland-scanner build for MinGW
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
X-List-Received-Date: Tue, 12 Nov 2019 19:33:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Applies 2 patches to fix the wayland-scanner build for MinGW (e.g.
nativesdk-wayland)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 ...nner-Add-configure-check-for-strndup.patch |  50 ++++++
 ...v_signal-to-wayland-server-private.h.patch | 166 ++++++++++++++++++
 .../wayland/wayland_1.17.0.bb                 |   2 +
 3 files changed, 218 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/wayland/0001-scanner-Add-configure-check-for-strndup.patch
 create mode 100644 meta/recipes-graphics/wayland/wayland/0002-Move-wl_priv_signal-to-wayland-server-private.h.patch

diff --git a/meta/recipes-graphics/wayland/wayland/0001-scanner-Add-configure-check-for-strndup.patch b/meta/recipes-graphics/wayland/wayland/0001-scanner-Add-configure-check-for-strndup.patch
new file mode 100644
index 00000000000..c4435875ad4
--- /dev/null
+++ b/meta/recipes-graphics/wayland/wayland/0001-scanner-Add-configure-check-for-strndup.patch
@@ -0,0 +1,50 @@
+From 3c8b4467a1ca229e72fb5223787ed400a19c65c0 Mon Sep 17 00:00:00 2001
+From: Joshua Watt <JPEWhacker@gmail.com>
+Date: Fri, 25 Oct 2019 21:03:23 -0500
+Subject: [PATCH] scanner: Add configure check for strndup
+
+Some platforms may not have strndup() (e.g. MinGW), so provide a
+equivalent implementation if it's not found.
+
+Upstream-Status: Accepted [4a1f348c20157db7bd7c759fdeb23fbe8729c571]
+Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
+---
+ configure.ac  |  2 +-
+ src/scanner.c | 11 +++++++++++
+ 2 files changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 8d56f2b..1c99e21 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -63,7 +63,7 @@ fi
+ AC_SUBST(GCC_CFLAGS)
+ 
+ AC_CHECK_HEADERS([sys/prctl.h])
+-AC_CHECK_FUNCS([accept4 mkostemp posix_fallocate prctl])
++AC_CHECK_FUNCS([accept4 mkostemp posix_fallocate prctl strndup])
+ 
+ AC_ARG_ENABLE([libraries],
+ 	      [AC_HELP_STRING([--disable-libraries],
+diff --git a/src/scanner.c b/src/scanner.c
+index a94be5d..27004bc 100644
+--- a/src/scanner.c
++++ b/src/scanner.c
+@@ -916,6 +916,17 @@ verify_arguments(struct parse_context *ctx,
+ 
+ }
+ 
++#ifndef HAVE_STRNDUP
++char *
++strndup(const char *s, size_t size)
++{
++	char *r = malloc(size + 1);
++	strncpy(r, s, size);
++	r[size] = '\0';
++	return r;
++}
++#endif
++
+ static void
+ end_element(void *data, const XML_Char *name)
+ {
diff --git a/meta/recipes-graphics/wayland/wayland/0002-Move-wl_priv_signal-to-wayland-server-private.h.patch b/meta/recipes-graphics/wayland/wayland/0002-Move-wl_priv_signal-to-wayland-server-private.h.patch
new file mode 100644
index 00000000000..b05b875abb5
--- /dev/null
+++ b/meta/recipes-graphics/wayland/wayland/0002-Move-wl_priv_signal-to-wayland-server-private.h.patch
@@ -0,0 +1,166 @@
+From e746f3bf7c8bb2f5dcf9e93edffc23b56eff12d0 Mon Sep 17 00:00:00 2001
+From: Joshua Watt <JPEWhacker@gmail.com>
+Date: Tue, 5 Nov 2019 09:09:50 -0600
+Subject: [PATCH] Move wl_priv_signal to wayland-server-private.h
+
+Including wayland-server-core.h in wayland-private.h is problematic
+because wayland-private.h is included by wayland-scanner which should be
+able to build against non-POSIX platforms (e.g. MinGW). The only reason
+that wayland-server-core.h was included in wayland-private.h was for the
+wl_private_signal definitions, so move those to a
+wayland-server-private.h file that can be included by both
+wayland-server.c and the tests.
+
+Upstream-Status: Accepted [e7d88f35eb89cf0cc77cbddd834cacc63683a9cc]
+Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
+---
+ Makefile.am                  |  3 +-
+ src/wayland-private.h        | 22 +--------------
+ src/wayland-server-private.h | 53 ++++++++++++++++++++++++++++++++++++
+ src/wayland-server.c         |  1 +
+ tests/newsignal-test.c       |  2 +-
+ 5 files changed, 58 insertions(+), 23 deletions(-)
+ create mode 100644 src/wayland-server-private.h
+
+diff --git a/Makefile.am b/Makefile.am
+index f47d055..026d981 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -56,7 +56,8 @@ libwayland_private_la_SOURCES =			\
+ 	src/connection.c			\
+ 	src/wayland-os.c			\
+ 	src/wayland-os.h			\
+-	src/wayland-private.h
++	src/wayland-private.h			\
++	src/wayland-server-private.h
+ 
+ include_HEADERS =				\
+ 	src/wayland-util.h			\
+diff --git a/src/wayland-private.h b/src/wayland-private.h
+index 29516ec..dc7d12f 100644
+--- a/src/wayland-private.h
++++ b/src/wayland-private.h
+@@ -31,11 +31,11 @@
+ #include <stdarg.h>
+ #include <stdlib.h>
+ #include <stdint.h>
++#include <stdbool.h>
+ 
+ #define WL_HIDE_DEPRECATED 1
+ 
+ #include "wayland-util.h"
+-#include "wayland-server-core.h"
+ 
+ /* Invalid memory address */
+ #define WL_ARRAY_POISON_PTR (void *) 4
+@@ -236,26 +236,6 @@ zalloc(size_t s)
+ 	return calloc(1, s);
+ }
+ 
+-struct wl_priv_signal {
+-	struct wl_list listener_list;
+-	struct wl_list emit_list;
+-};
+-
+-void
+-wl_priv_signal_init(struct wl_priv_signal *signal);
+-
+-void
+-wl_priv_signal_add(struct wl_priv_signal *signal, struct wl_listener *listener);
+-
+-struct wl_listener *
+-wl_priv_signal_get(struct wl_priv_signal *signal, wl_notify_func_t notify);
+-
+-void
+-wl_priv_signal_emit(struct wl_priv_signal *signal, void *data);
+-
+-void
+-wl_priv_signal_final_emit(struct wl_priv_signal *signal, void *data);
+-
+ void
+ wl_connection_close_fds_in(struct wl_connection *connection, int max);
+ 
+diff --git a/src/wayland-server-private.h b/src/wayland-server-private.h
+new file mode 100644
+index 0000000..23fa458
+--- /dev/null
++++ b/src/wayland-server-private.h
+@@ -0,0 +1,53 @@
++/*
++ * Copyright © 2008-2011 Kristian Høgsberg
++ * Copyright © 2011 Intel Corporation
++ * Copyright © 2013 Jason Ekstrand
++ *
++ * Permission is hereby granted, free of charge, to any person obtaining
++ * a copy of this software and associated documentation files (the
++ * "Software"), to deal in the Software without restriction, including
++ * without limitation the rights to use, copy, modify, merge, publish,
++ * distribute, sublicense, and/or sell copies of the Software, and to
++ * permit persons to whom the Software is furnished to do so, subject to
++ * the following conditions:
++ *
++ * The above copyright notice and this permission notice (including the
++ * next paragraph) shall be included in all copies or substantial
++ * portions of the Software.
++ *
++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
++ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
++ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
++ * NONINFRINGEMENT.  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
++ * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
++ * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
++ * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
++ * SOFTWARE.
++ */
++
++#ifndef WAYLAND_SERVER_PRIVATE_H
++#define WAYLAND_SERVER_PRIVATE_H
++
++#include "wayland-server-core.h"
++
++struct wl_priv_signal {
++	struct wl_list listener_list;
++	struct wl_list emit_list;
++};
++
++void
++wl_priv_signal_init(struct wl_priv_signal *signal);
++
++void
++wl_priv_signal_add(struct wl_priv_signal *signal, struct wl_listener *listener);
++
++struct wl_listener *
++wl_priv_signal_get(struct wl_priv_signal *signal, wl_notify_func_t notify);
++
++void
++wl_priv_signal_emit(struct wl_priv_signal *signal, void *data);
++
++void
++wl_priv_signal_final_emit(struct wl_priv_signal *signal, void *data);
++
++#endif
+diff --git a/src/wayland-server.c b/src/wayland-server.c
+index 19f6a76..d6f0206 100644
+--- a/src/wayland-server.c
++++ b/src/wayland-server.c
+@@ -45,6 +45,7 @@
+ 
+ #include "wayland-util.h"
+ #include "wayland-private.h"
++#include "wayland-server-private.h"
+ #include "wayland-server.h"
+ #include "wayland-os.h"
+ 
+diff --git a/tests/newsignal-test.c b/tests/newsignal-test.c
+index 47c429b..f3a7bd9 100644
+--- a/tests/newsignal-test.c
++++ b/tests/newsignal-test.c
+@@ -26,7 +26,7 @@
+ #include <assert.h>
+ 
+ #include "test-runner.h"
+-#include "wayland-private.h"
++#include "wayland-server-private.h"
+ 
+ static void
+ signal_notify(struct wl_listener *listener, void *data)
diff --git a/meta/recipes-graphics/wayland/wayland_1.17.0.bb b/meta/recipes-graphics/wayland/wayland_1.17.0.bb
index d34bb39747e..2b5a8f94540 100644
--- a/meta/recipes-graphics/wayland/wayland_1.17.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.17.0.bb
@@ -14,6 +14,8 @@ DEPENDS = "expat libxml2 libffi wayland-native"
 
 SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
 	   file://fixpathinpcfiles.patch \
+           file://0001-scanner-Add-configure-check-for-strndup.patch \
+           file://0002-Move-wl_priv_signal-to-wayland-server-private.h.patch \
            "
 SRC_URI[md5sum] = "d91f970aea11fd549eae023d06f91af3"
 SRC_URI[sha256sum] = "72aa11b8ac6e22f4777302c9251e8fec7655dc22f9d94ee676c6b276f95f91a4"
-- 
2.23.0


