Return-Path: <ppjadhav456@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBCC7C3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 11:23:05 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.76351.1705317779127698979
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 03:22:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TNo7luPx;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: ppjadhav456@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d5d736cdcdso1642405ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 03:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705317778; x=1705922578; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1WllAdYL5DIXa94kB0t3cGybpPpN8Qc8ke+J5mtYato=;
        b=TNo7luPx/PXadbLdYxNh0lgP4I6hmeM+o/xSGQeyLDI98Ke3nYDZQZnzpKzRyIzQLQ
         0lADD8sKqOMQ+0FUArrc92hQp0ZFqkSxh3k83WOS6idmRzZmFrkwZ3/OxMp1x+bGPKRd
         NHKDLjdHvDaMsOACChZAI52kuxh5iEOrX3fRBQzL9VTB49kE7j4yhLyJoYI61mfUL/nw
         2BfNExRtkrdBxhSWCM8U+uo91YVA9xmrnxgD/sCaN4tGVYoLN/nBwUjYHGQGJjGDdXk9
         SyNvqd7GDy0AazUyDcUukf0EGrtc1522ADXhlZlNpXF+H++hMehSRiPVQEXkbMHIclp3
         euWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705317778; x=1705922578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1WllAdYL5DIXa94kB0t3cGybpPpN8Qc8ke+J5mtYato=;
        b=RgSmvlA/pq5JS08TlWtmwB5VlpHBzbn22Zwqq8kjfh5WDtZhzQk7hnd9tHRTvMa1+z
         zAxyLApHdQA4XsPgAoVU189Z66ntFbmui7AHI0ogCL82kzrQv8mybRo2sDstk0/BgJwr
         hKDBxzNc4m2N5B2byoWna39W5emuxTNuPOd7q3I16LheEMveJ4PozyZDMdFNqHhMlorJ
         A7FEko5PvP/Lu9hS12cruoSRuF2mq9ctqLSpjR9WuDVGq5+fGlVY2cqFq+O9KrdQhocq
         Q0ZoXUqLiFycdUvGOCM/iDKWBrXYFdK/unfmhxbMJ4eU9nL0qR1OUye/YNINFjXJGMh0
         9klw==
X-Gm-Message-State: AOJu0Yzf2Xp8WO5ssreXl/89JN746ywawEG0RYT/d8hS7blBPWAPlbSJ
	oFkyBOj/U2QmXoRWJ5gTqEXY2UVbEr0w0Q==
X-Google-Smtp-Source: AGHT+IFmxBY92JI0DzkbD1MnZZmBcQtfaE0CvfArqM88HozIAofWwJeH/wcNtbEA07cu2SSYkMXwFA==
X-Received: by 2002:a17:902:7806:b0:1d5:7cb:7761 with SMTP id p6-20020a170902780600b001d507cb7761mr2232634pll.51.1705317777748;
        Mon, 15 Jan 2024 03:22:57 -0800 (PST)
Received: from L-14805.kpit.com ([43.231.237.211])
        by smtp.gmail.com with ESMTPSA id p16-20020a170902b09000b001d3b258e036sm7393329plr.176.2024.01.15.03.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 03:22:57 -0800 (PST)
From: Poonam Jadhav <ppjadhav456@gmail.com>
To: openembedded-core@lists.openembedded.org,
	bindu.bhabu@kpit.com
Cc: akash.hadke@kpit.com,
	Poonam Jadhav <ppjadhav456@gmail.com>,
	Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [OE-core][dunfell][PATCH] dbus: Add patches to clear cache on policy reload
Date: Mon, 15 Jan 2024 16:52:35 +0530
Message-Id: <20240115112235.185409-1-ppjadhav456@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 11:23:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193670

See discussion at https://marc.info/?l=selinux&m=152173501930182&w=2
Link: https://gitlab.freedesktop.org/dbus/dbus/-/merge_requests/31

Support patches added:
1. "Add-_dbus_clear_loop-and-_dbus_clear_watch.patch"
   Where '_dbus_clear_loop' and '_dbus_clear_watch'
   functions are available.
2. "Add-utility-functions-to-emit-TAP-diagnostics-and-fa.patch"
   Where 'dbus/dbus-test-tap.h' header file is available

Patches to resolve issue as provided in above link:
3. "Stop-using-avc_init-which-is-deprecated.patch"
   To stop using avc_init() which is deprecated and use avc_open()
   instead.With this commit dbus-daemon will stop using a thread
   to monitor the avc netlink and will poll it instead.
4. "Use-SELINUX_CB_POLICYLOAD-instead-of-AVC_CALLBACK_RE"
    Use SELINUX_CB_POLICYLOAD instead of AVC_CALLBACK_RESET callback
    as this only seems necessary on policy reload and not if the
    enforcing mode is changing.

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Bhabu Bindu <bindu.bhabu@kpit.com>
---
 meta/recipes-core/dbus/dbus.inc               |   4 +
 ...bus_clear_loop-and-_dbus_clear_watch.patch |  56 +++
 ...tions-to-emit-TAP-diagnostics-and-fa.patch | 192 ++++++++
 ...p-using-avc_init-which-is-deprecated.patch | 439 ++++++++++++++++++
 ...OLICYLOAD-instead-of-AVC_CALLBACK_RE.patch |  63 +++
 5 files changed, 754 insertions(+)
 create mode 100644 meta/recipes-core/dbus/dbus/0001-Add-_dbus_clear_loop-and-_dbus_clear_watch.patch
 create mode 100644 meta/recipes-core/dbus/dbus/0001-Add-utility-functions-to-emit-TAP-diagnostics-and-fa.patch
 create mode 100644 meta/recipes-core/dbus/dbus/0001-Stop-using-avc_init-which-is-deprecated.patch
 create mode 100644 meta/recipes-core/dbus/dbus/0002-Use-SELINUX_CB_POLICYLOAD-instead-of-AVC_CALLBACK_RE.patch

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 9b5cc53d92..12be2c0ea6 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -9,6 +9,10 @@ SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://dbus-1.init \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
            file://CVE-2023-34969.patch \
+           file://0001-Add-utility-functions-to-emit-TAP-diagnostics-and-fa.patch \
+           file://0001-Add-_dbus_clear_loop-and-_dbus_clear_watch.patch \
+           file://0001-Stop-using-avc_init-which-is-deprecated.patch \
+           file://0002-Use-SELINUX_CB_POLICYLOAD-instead-of-AVC_CALLBACK_RE.patch \
 "
 
 SRC_URI[sha256sum] = "bc42d196c1756ac520d61bf3ccd6f42013617def45dd1e591a6091abf51dca38"
diff --git a/meta/recipes-core/dbus/dbus/0001-Add-_dbus_clear_loop-and-_dbus_clear_watch.patch b/meta/recipes-core/dbus/dbus/0001-Add-_dbus_clear_loop-and-_dbus_clear_watch.patch
new file mode 100644
index 0000000000..f684f2a1f9
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus/0001-Add-_dbus_clear_loop-and-_dbus_clear_watch.patch
@@ -0,0 +1,56 @@
+From 8a4e07925c54eac83878c39313f44fe87d6c3538 Mon Sep 17 00:00:00 2001
+From: Laurent Bigonville <bigon@bigon.be>
+Date: Mon, 5 Mar 2018 22:30:44 +0100
+Subject: [PATCH] Add _dbus_clear_loop and _dbus_clear_watch
+
+Bug: https://bugs.freedesktop.org/show_bug.cgi?id=92831
+[smcv: Fix variable names]
+Reviewed-by: Simon McVittie <smcv@collabora.com>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/dbus/dbus/-/commit/8a4e07925c54eac83878c39313f44fe87d6c3538]
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+
+---
+ dbus/dbus-mainloop.h | 7 +++++++
+ dbus/dbus-watch.h    | 7 +++++++
+ 2 files changed, 14 insertions(+)
+
+diff --git a/dbus/dbus-mainloop.h b/dbus/dbus-mainloop.h
+index a76cb6f0..19a7c0d5 100644
+--- a/dbus/dbus-mainloop.h
++++ b/dbus/dbus-mainloop.h
+@@ -60,6 +60,13 @@ dbus_bool_t _dbus_loop_dispatch       (DBusLoop            *loop);
+ int  _dbus_get_oom_wait    (void);
+ void _dbus_wait_for_memory (void);
+ 
++static inline void
++_dbus_clear_loop (DBusLoop **pointer_to_loop)
++{
++  _dbus_clear_pointer_impl (DBusLoop, pointer_to_loop,
++                            _dbus_loop_unref);
++}
++
+ #endif /* !DOXYGEN_SHOULD_SKIP_THIS */
+ 
+ #endif /* DBUS_MAINLOOP_H */
+diff --git a/dbus/dbus-watch.h b/dbus/dbus-watch.h
+index 8d8bbf2b..05d9b20e 100644
+--- a/dbus/dbus-watch.h
++++ b/dbus/dbus-watch.h
+@@ -99,6 +99,13 @@ DBusSocket     _dbus_watch_get_socket         (DBusWatch               *watch);
+ DBUS_PRIVATE_EXPORT
+ DBusPollable   _dbus_watch_get_pollable       (DBusWatch               *watch);
+ 
++static inline void
++_dbus_clear_watch (DBusWatch **pointer_to_watch)
++{
++  _dbus_clear_pointer_impl (DBusWatch, pointer_to_watch,
++                            _dbus_watch_unref);
++}
++
+ /** @} */
+ 
+ DBUS_END_DECLS
+-- 
+2.17.1
+
diff --git a/meta/recipes-core/dbus/dbus/0001-Add-utility-functions-to-emit-TAP-diagnostics-and-fa.patch b/meta/recipes-core/dbus/dbus/0001-Add-utility-functions-to-emit-TAP-diagnostics-and-fa.patch
new file mode 100644
index 0000000000..12e8d3752c
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus/0001-Add-utility-functions-to-emit-TAP-diagnostics-and-fa.patch
@@ -0,0 +1,192 @@
+From 5ffb709b42783b0d13a49b8c9a84c75f556c88a2 Mon Sep 17 00:00:00 2001
+From: Simon McVittie <smcv@collabora.com>
+Date: Tue, 14 Nov 2017 14:01:56 +0000
+Subject: [PATCH] Add utility functions to emit TAP diagnostics and fatal
+ errors
+
+Reviewed-by: Philip Withnall <withnall@endlessm.com>
+[smcv: Add an explanatory comment as suggested]
+Signed-off-by: Simon McVittie <smcv@collabora.com>
+Bug: https://bugs.freedesktop.org/show_bug.cgi?id=103601
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/dbus/dbus/-/commit/5ffb709b42783b0d13a49b8c9a84c75f556c88a2]
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+
+---
+ cmake/dbus/CMakeLists.txt |  2 +
+ dbus/Makefile.am          |  2 +
+ dbus/dbus-test-tap.c      | 77 +++++++++++++++++++++++++++++++++++++++
+ dbus/dbus-test-tap.h      | 44 ++++++++++++++++++++++
+ 4 files changed, 125 insertions(+)
+ create mode 100644 dbus/dbus-test-tap.c
+ create mode 100644 dbus/dbus-test-tap.h
+
+diff --git a/cmake/dbus/CMakeLists.txt b/cmake/dbus/CMakeLists.txt
+index 8a01d918..2fdd1128 100644
+--- a/cmake/dbus/CMakeLists.txt
++++ b/cmake/dbus/CMakeLists.txt
+@@ -127,6 +127,7 @@ set (DBUS_SHARED_SOURCES
+ 	${DBUS_DIR}/dbus-string.c
+ 	${DBUS_DIR}/dbus-sysdeps.c
+ 	${DBUS_DIR}/dbus-pipe.c
++	${DBUS_DIR}/dbus-test-tap.c
+ )
+ 
+ set (DBUS_SHARED_HEADERS
+@@ -141,6 +142,7 @@ set (DBUS_SHARED_HEADERS
+ 	${DBUS_DIR}/dbus-string-private.h
+ 	${DBUS_DIR}/dbus-pipe.h
+ 	${DBUS_DIR}/dbus-sysdeps.h
++	${DBUS_DIR}/dbus-test-tap.h
+ )
+ 
+ ### source code that is generic utility functionality used
+diff --git a/dbus/Makefile.am b/dbus/Makefile.am
+index b2913ef0..d4fe09f8 100644
+--- a/dbus/Makefile.am
++++ b/dbus/Makefile.am
+@@ -231,6 +231,8 @@ DBUS_SHARED_SOURCES=				\
+ 	$(DBUS_SHARED_arch_sources)		\
+ 	dbus-sysdeps.c				\
+ 	dbus-sysdeps.h				\
++	dbus-test-tap.c				\
++	dbus-test-tap.h				\
+ 	dbus-valgrind-internal.h
+ 
+ ### source code that is generic utility functionality used
+diff --git a/dbus/dbus-test-tap.c b/dbus/dbus-test-tap.c
+new file mode 100644
+index 00000000..a6f99b54
+--- /dev/null
++++ b/dbus/dbus-test-tap.c
+@@ -0,0 +1,77 @@
++/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- */
++/* dbus-test-tap — TAP helpers for "embedded tests"
++ *
++ * Copyright © 2017 Collabora Ltd.
++ *
++ * Permission is hereby granted, free of charge, to any person
++ * obtaining a copy of this software and associated documentation files
++ * (the "Software"), to deal in the Software without restriction,
++ * including without limitation the rights to use, copy, modify, merge,
++ * publish, distribute, sublicense, and/or sell copies of the Software,
++ * and to permit persons to whom the Software is furnished to do so,
++ * subject to the following conditions:
++ *
++ * The above copyright notice and this permission notice shall be
++ * included in all copies or substantial portions of the Software.
++ *
++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
++ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
++ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
++ * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
++ * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
++ * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
++ * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
++ * SOFTWARE.
++ */
++
++#include <config.h>
++#include "dbus/dbus-test-tap.h"
++
++/*
++ * TAP, the Test Anything Protocol, is a text-based syntax for test-cases
++ * to report results to test harnesses.
++ *
++ * See <http://testanything.org/> for details of the syntax, which
++ * will not be explained here.
++ */
++
++#ifdef DBUS_ENABLE_EMBEDDED_TESTS
++
++#include <stdio.h>
++#include <stdlib.h>
++
++/*
++ * Output TAP indicating a fatal error, and exit unsuccessfully.
++ */
++void
++_dbus_test_fatal (const char *format,
++    ...)
++{
++  va_list ap;
++
++  printf ("Bail out! ");
++  va_start (ap, format);
++  vprintf (format, ap);
++  va_end (ap);
++  printf ("\n");
++  fflush (stdout);
++  exit (1);
++}
++
++/*
++ * Output TAP indicating a diagnostic (informational message).
++ */
++void
++_dbus_test_diag (const char *format,
++    ...)
++{
++  va_list ap;
++
++  printf ("# ");
++  va_start (ap, format);
++  vprintf (format, ap);
++  va_end (ap);
++  printf ("\n");
++}
++
++#endif
+diff --git a/dbus/dbus-test-tap.h b/dbus/dbus-test-tap.h
+new file mode 100644
+index 00000000..706475bd
+--- /dev/null
++++ b/dbus/dbus-test-tap.h
+@@ -0,0 +1,44 @@
++/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- */
++/* dbus-test-tap — TAP helpers for "embedded tests"
++ *
++ * Copyright © 2017 Collabora Ltd.
++ *
++ * Permission is hereby granted, free of charge, to any person
++ * obtaining a copy of this software and associated documentation files
++ * (the "Software"), to deal in the Software without restriction,
++ * including without limitation the rights to use, copy, modify, merge,
++ * publish, distribute, sublicense, and/or sell copies of the Software,
++ * and to permit persons to whom the Software is furnished to do so,
++ * subject to the following conditions:
++ *
++ * The above copyright notice and this permission notice shall be
++ * included in all copies or substantial portions of the Software.
++ *
++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
++ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
++ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
++ * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
++ * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
++ * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
++ * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
++ * SOFTWARE.
++ */
++
++#ifndef DBUS_TEST_TAP_H
++#define DBUS_TEST_TAP_H
++
++#include <dbus/dbus-internals.h>
++
++#ifdef DBUS_ENABLE_EMBEDDED_TESTS
++
++DBUS_PRIVATE_EXPORT
++void _dbus_test_fatal (const char *format,
++    ...) _DBUS_GNUC_NORETURN _DBUS_GNUC_PRINTF (1, 2);
++
++DBUS_PRIVATE_EXPORT
++void _dbus_test_diag (const char *format,
++    ...) _DBUS_GNUC_PRINTF (1, 2);
++
++#endif
++
++#endif
+-- 
+2.17.1
+
diff --git a/meta/recipes-core/dbus/dbus/0001-Stop-using-avc_init-which-is-deprecated.patch b/meta/recipes-core/dbus/dbus/0001-Stop-using-avc_init-which-is-deprecated.patch
new file mode 100644
index 0000000000..c1e1de37b8
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus/0001-Stop-using-avc_init-which-is-deprecated.patch
@@ -0,0 +1,439 @@
+From 67f7bdf8c2e1df01781a117511517e55292f80c0 Mon Sep 17 00:00:00 2001
+From: Laurent Bigonville <bigon@bigon.be>
+Date: Sat, 3 Mar 2018 13:15:17 +0100
+Subject: [PATCH 1/2] Stop using avc_init() which is deprecated
+
+Stop using avc_init() and use avc_open() instead. With this commit
+dbus-daemon will stop using a thread to monitor the avc netlink and will
+poll it instead.
+
+https://gitlab.freedesktop.org/dbus/dbus/issues/134
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/dbus/dbus/-/commit/67f7bdf8c2e1df01781a117511517e55292f80c0]
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+
+---
+ bus/bus.c       |  15 ++--
+ bus/selinux.c   | 219 ++++++++++++++++++++++++------------------------
+ bus/selinux.h   |   2 +-
+ bus/test-main.c |   6 --
+ bus/test.c      |   9 ++
+ 5 files changed, 128 insertions(+), 123 deletions(-)
+
+diff --git a/bus/bus.c b/bus/bus.c
+index 22b7d0b8..ca48b4bb 100644
+--- a/bus/bus.c
++++ b/bus/bus.c
+@@ -995,12 +995,10 @@ bus_context_new (const DBusString *config_file,
+    */
+   bus_audit_init (context);
+ 
+-  if (!bus_selinux_full_init ())
++  if (!bus_selinux_full_init (context, error))
+     {
+-      bus_context_log (context, DBUS_SYSTEM_LOG_ERROR,
+-                       "SELinux enabled but D-Bus initialization failed; "
+-                       "check system log");
+-      exit (1);
++      _DBUS_ASSERT_ERROR_IS_SET (error);
++      goto failed;
+     }
+ 
+   if (!bus_apparmor_full_init (error))
+@@ -1009,6 +1007,13 @@ bus_context_new (const DBusString *config_file,
+       goto failed;
+     }
+ 
++  if (bus_selinux_enabled ())
++    {
++      if (context->syslog)
++        bus_context_log (context, DBUS_SYSTEM_LOG_INFO,
++                         "SELinux support is enabled\n");
++    }
++
+   if (bus_apparmor_enabled ())
+     {
+       /* Only print AppArmor mediation message when syslog support is enabled */
+diff --git a/bus/selinux.c b/bus/selinux.c
+index d09afb4b..c764794c 100644
+--- a/bus/selinux.c
++++ b/bus/selinux.c
+@@ -49,6 +49,7 @@
+ #include <stdarg.h>
+ #include <stdio.h>
+ #include <grp.h>
++#include <dbus/dbus-watch.h>
+ #endif /* HAVE_SELINUX */
+ #ifdef HAVE_LIBAUDIT
+ #include <libaudit.h>
+@@ -64,45 +65,20 @@ static dbus_bool_t selinux_enabled = FALSE;
+ /* Store an avc_entry_ref to speed AVC decisions. */
+ static struct avc_entry_ref aeref;
+ 
++/* Store the avc netlink fd. */
++static int avc_netlink_fd = -1;
++
++/* Watch to listen for SELinux status changes via netlink. */
++static DBusWatch *avc_netlink_watch_obj = NULL;
++static DBusLoop *avc_netlink_loop_obj = NULL;
++
+ /* Store the SID of the bus itself to use as the default. */
+ static security_id_t bus_sid = SECSID_WILD;
+ 
+-/* Thread to listen for SELinux status changes via netlink. */
+-static pthread_t avc_notify_thread;
+-
+ /* Prototypes for AVC callback functions.  */
+-static void log_callback (const char *fmt, ...) _DBUS_GNUC_PRINTF (1, 2);
+-static void log_audit_callback (void *data, security_class_t class, char *buf, size_t bufleft);
+-static void *avc_create_thread (void (*run) (void));
+-static void avc_stop_thread (void *thread);
+-static void *avc_alloc_lock (void);
+-static void avc_get_lock (void *lock);
+-static void avc_release_lock (void *lock);
+-static void avc_free_lock (void *lock);
+-
+-/* AVC callback structures for use in avc_init.  */
+-static const struct avc_memory_callback mem_cb =
+-{
+-  .func_malloc = dbus_malloc,
+-  .func_free = dbus_free
+-};
+-static const struct avc_log_callback log_cb =
+-{
+-  .func_log = log_callback,
+-  .func_audit = log_audit_callback
+-};
+-static const struct avc_thread_callback thread_cb =
+-{
+-  .func_create_thread = avc_create_thread,
+-  .func_stop_thread = avc_stop_thread
+-};
+-static const struct avc_lock_callback lock_cb =
+-{
+-  .func_alloc_lock = avc_alloc_lock,
+-  .func_get_lock = avc_get_lock,
+-  .func_release_lock = avc_release_lock,
+-  .func_free_lock = avc_free_lock
+-};
++static int log_callback (int type, const char *fmt, ...) _DBUS_GNUC_PRINTF (2, 3);
++static int log_audit_callback (void *data, security_class_t class, char *buf, size_t bufleft);
++
+ #endif /* HAVE_SELINUX */
+ 
+ /**
+@@ -115,8 +91,8 @@ static const struct avc_lock_callback lock_cb =
+  */
+ #ifdef HAVE_SELINUX
+ 
+-static void 
+-log_callback (const char *fmt, ...) 
++static int
++log_callback (int type, const char *fmt, ...)
+ {
+   va_list ap;
+ #ifdef HAVE_LIBAUDIT
+@@ -150,6 +126,8 @@ log_callback (const char *fmt, ...)
+ out:
+ #endif
+   va_end(ap);
++
++  return 0;
+ }
+ 
+ /**
+@@ -170,7 +148,7 @@ policy_reload_callback (u_int32_t event, security_id_t ssid,
+ /**
+  * Log any auxiliary data 
+  */
+-static void
++static int
+ log_audit_callback (void *data, security_class_t class, char *buf, size_t bufleft)
+ {
+   DBusString *audmsg = data;
+@@ -188,73 +166,20 @@ log_audit_callback (void *data, security_class_t class, char *buf, size_t buflef
+       if (bufleft > (size_t) _dbus_string_get_length(&s))
+         _dbus_string_copy_to_buffer_with_nul (&s, buf, bufleft);
+     }
+-}
+-
+-/**
+- * Create thread to notify the AVC of enforcing and policy reload
+- * changes via netlink.
+- *
+- * @param run the thread run function
+- * @return pointer to the thread
+- */
+-static void *
+-avc_create_thread (void (*run) (void))
+-{
+-  int rc;
+-
+-  rc = pthread_create (&avc_notify_thread, NULL, (void *(*) (void *)) run, NULL);
+-  if (rc != 0)
+-    {
+-      _dbus_warn ("Failed to start AVC thread: %s", _dbus_strerror (rc));
+-      exit (1);
+-    }
+-  return &avc_notify_thread;
+-}
+ 
+-/* Stop AVC netlink thread.  */
+-static void
+-avc_stop_thread (void *thread)
+-{
+-  pthread_cancel (*(pthread_t *) thread);
++  return 0;
+ }
+ 
+-/* Allocate a new AVC lock.  */
+-static void *
+-avc_alloc_lock (void)
++static dbus_bool_t
++handle_avc_netlink_watch (DBusWatch *passed_watch, unsigned int flags, void *data)
+ {
+-  pthread_mutex_t *avc_mutex;
+-
+-  avc_mutex = dbus_new (pthread_mutex_t, 1);
+-  if (avc_mutex == NULL)
++  if (avc_netlink_check_nb () < 0)
+     {
+-      _dbus_warn ("Could not create mutex: %s", _dbus_strerror (errno));
+-      exit (1);
++      _dbus_warn ("Failed to check the netlink socket for pending messages and process them: %s", _dbus_strerror (errno));
++      return FALSE;
+     }
+-  pthread_mutex_init (avc_mutex, NULL);
+-
+-  return avc_mutex;
+-}
+-
+-/* Acquire an AVC lock.  */
+-static void
+-avc_get_lock (void *lock)
+-{
+-  pthread_mutex_lock (lock);
+-}
+ 
+-/* Release an AVC lock.  */
+-static void
+-avc_release_lock (void *lock)
+-{
+-  pthread_mutex_unlock (lock);
+-}
+-
+-/* Free an AVC lock.  */
+-static void
+-avc_free_lock (void *lock)
+-{
+-  pthread_mutex_destroy (lock);
+-  dbus_free (lock);
++  return TRUE;
+ }
+ #endif /* HAVE_SELINUX */
+ 
+@@ -335,7 +260,7 @@ static struct security_class_mapping dbus_map[] = {
+  * logging callbacks.
+  */
+ dbus_bool_t
+-bus_selinux_full_init (void)
++bus_selinux_full_init (BusContext *context, DBusError *error)
+ {
+ #ifdef HAVE_SELINUX
+   char *bus_context;
+@@ -358,9 +283,11 @@ bus_selinux_full_init (void)
+     }
+ 
+   avc_entry_ref_init (&aeref);
+-  if (avc_init ("avc", &mem_cb, &log_cb, &thread_cb, &lock_cb) < 0)
++  if (avc_open (NULL, 0) < 0)
+     {
+-      _dbus_warn ("Failed to start Access Vector Cache (AVC).");
++      dbus_set_error (error, DBUS_ERROR_FAILED,
++                      "Failed to start Access Vector Cache (AVC): %s",
++                      _dbus_strerror (errno));
+       return FALSE;
+     }
+   else
+@@ -368,34 +295,90 @@ bus_selinux_full_init (void)
+       _dbus_verbose ("Access Vector Cache (AVC) started.\n");
+     }
+ 
++  avc_netlink_fd = avc_netlink_acquire_fd ();
++  if (avc_netlink_fd < 0)
++    {
++       dbus_set_error (error, DBUS_ERROR_FAILED,
++                      "Cannot acquire AVC netlink fd: %s",
++                      _dbus_strerror (errno));
++       goto error;
++    }
++
++  _dbus_fd_set_close_on_exec (avc_netlink_fd);
++
++  avc_netlink_loop_obj = bus_context_get_loop (context);
++  /* avc_netlink_loop_obj is a global variable */
++  _dbus_loop_ref (avc_netlink_loop_obj);
++
++  avc_netlink_watch_obj = _dbus_watch_new (avc_netlink_fd, DBUS_WATCH_READABLE, TRUE,
++                                           handle_avc_netlink_watch, NULL, NULL);
++  if (avc_netlink_watch_obj == NULL)
++    {
++      BUS_SET_OOM (error);
++      goto error;
++    }
++
++  if (!_dbus_loop_add_watch (avc_netlink_loop_obj, avc_netlink_watch_obj))
++    {
++      _dbus_watch_invalidate (avc_netlink_watch_obj);
++      _dbus_clear_watch (&avc_netlink_watch_obj);
++      avc_netlink_watch_obj = NULL;
++      BUS_SET_OOM (error);
++      goto error;
++    }
++
+   if (avc_add_callback (policy_reload_callback, AVC_CALLBACK_RESET,
+                        NULL, NULL, 0, 0) < 0)
+     {
+-      _dbus_warn ("Failed to add policy reload callback: %s",
+-                  _dbus_strerror (errno));
+-      avc_destroy ();
+-      return FALSE;
++      dbus_set_error (error, DBUS_ERROR_FAILED,
++                      "Failed to add policy reload callback: %s",
++                      _dbus_strerror (errno));
++      goto error;
+     }
+ 
++  selinux_set_callback (SELINUX_CB_AUDIT, (union selinux_callback) log_audit_callback);
++  selinux_set_callback (SELINUX_CB_LOG, (union selinux_callback) log_callback);
++
+   bus_context = NULL;
+   bus_sid = SECSID_WILD;
+ 
+   if (getcon (&bus_context) < 0)
+     {
+-      _dbus_verbose ("Error getting context of bus: %s\n",
+-                     _dbus_strerror (errno));
+-      return FALSE;
++      dbus_set_error (error, DBUS_ERROR_FAILED,
++                      "Error getting context of bus: %s",
++                      _dbus_strerror (errno));
++      goto error;
+     }
+       
+   if (avc_context_to_sid (bus_context, &bus_sid) < 0)
+     {
+-      _dbus_verbose ("Error getting SID from bus context: %s\n",
+-                     _dbus_strerror (errno));
++      dbus_set_error (error, DBUS_ERROR_FAILED,
++                      "Error getting SID from bus context: %s",
++                      _dbus_strerror (errno));
+       freecon (bus_context);
+-      return FALSE;
++      goto error;
+     }
+ 
+   freecon (bus_context);
++
++  return TRUE;
++
++error:
++  if (avc_netlink_watch_obj)
++    {
++      _dbus_loop_remove_watch (avc_netlink_loop_obj, avc_netlink_watch_obj);
++      _dbus_watch_invalidate (avc_netlink_watch_obj);
++      _dbus_clear_watch (&avc_netlink_watch_obj);
++    }
++  _dbus_clear_loop (&avc_netlink_loop_obj);
++  if (avc_netlink_fd >= 0)
++    {
++      avc_netlink_release_fd ();
++      avc_netlink_fd = -1;
++    }
++  avc_destroy ();
++  _DBUS_ASSERT_ERROR_IS_SET (error);
++  return FALSE;
+   
+ #endif /* HAVE_SELINUX */
+   return TRUE;
+@@ -976,6 +959,20 @@ bus_selinux_shutdown (void)
+ 
+   _dbus_verbose ("AVC shutdown\n");
+ 
++  if (avc_netlink_watch_obj)
++    {
++      _dbus_loop_remove_watch (avc_netlink_loop_obj, avc_netlink_watch_obj);
++      _dbus_watch_invalidate (avc_netlink_watch_obj);
++      _dbus_clear_watch (&avc_netlink_watch_obj);
++    }
++  _dbus_clear_loop (&avc_netlink_loop_obj);
++
++  if (avc_netlink_fd >= 0)
++    {
++      avc_netlink_release_fd ();
++      avc_netlink_fd = -1;
++    }
++
+   if (bus_sid != SECSID_WILD)
+     {
+       bus_sid = SECSID_WILD;
+diff --git a/bus/selinux.h b/bus/selinux.h
+index a0383cdd..53de1a84 100644
+--- a/bus/selinux.h
++++ b/bus/selinux.h
+@@ -28,7 +28,7 @@
+ #include "services.h"
+ 
+ dbus_bool_t bus_selinux_pre_init (void);
+-dbus_bool_t bus_selinux_full_init(void);
++dbus_bool_t bus_selinux_full_init(BusContext *context, DBusError *error);
+ void        bus_selinux_shutdown (void);
+ 
+ dbus_bool_t bus_selinux_enabled  (void);
+diff --git a/bus/test-main.c b/bus/test-main.c
+index 400ea423..ba73a1b4 100644
+--- a/bus/test-main.c
++++ b/bus/test-main.c
+@@ -67,12 +67,6 @@ static DBusInitialFDs *initial_fds = NUL
+ static void
+ test_pre_hook (void)
+ {
+-  
+-  if (_dbus_getenv ("DBUS_TEST_SELINUX")
+-      && (!bus_selinux_pre_init ()
+-	  || !bus_selinux_full_init ()))
+-    die ("could not init selinux support");
+-
+   initial_fds = _dbus_check_fdleaks_enter ();
+ }
+ 
+diff --git a/bus/test.c b/bus/test.c
+index 76960a30..730cd64a 100644
+--- a/bus/test.c
++++ b/bus/test.c
+@@ -28,6 +28,8 @@
+ #include <dbus/dbus-internals.h>
+ #include <dbus/dbus-list.h>
+ #include <dbus/dbus-sysdeps.h>
++#include <dbus/dbus-test-tap.h>
++#include "selinux.h"
+ 
+ /* The "debug client" watch/timeout handlers don't dispatch messages,
+  * as we manually pull them in order to verify them. This is why they
+@@ -307,6 +309,13 @@ bus_context_new_test (const DBusString *test_data_dir,
+       return NULL;
+     }
+ 
++    if (_dbus_getenv ("DBUS_TEST_SELINUX")
++      && (!bus_selinux_pre_init ()
++	  || !bus_selinux_full_init (context, &error)))
++    _dbus_test_fatal ("Could not init selinux support");
++
++  dbus_error_free (&error);
++
+   _dbus_string_free (&config_file);
+ 
+   return context;
+-- 
+2.17.1
+
diff --git a/meta/recipes-core/dbus/dbus/0002-Use-SELINUX_CB_POLICYLOAD-instead-of-AVC_CALLBACK_RE.patch b/meta/recipes-core/dbus/dbus/0002-Use-SELINUX_CB_POLICYLOAD-instead-of-AVC_CALLBACK_RE.patch
new file mode 100644
index 0000000000..3c7421ddae
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus/0002-Use-SELINUX_CB_POLICYLOAD-instead-of-AVC_CALLBACK_RE.patch
@@ -0,0 +1,63 @@
+From a442601cb2e14f6ff3111fe5a86ebdf4d0dee436 Mon Sep 17 00:00:00 2001
+From: Laurent Bigonville <bigon@bigon.be>
+Date: Wed, 30 May 2018 18:18:15 +0200
+Subject: [PATCH 2/2] Use SELINUX_CB_POLICYLOAD instead of AVC_CALLBACK_RESET
+ callback
+
+Use SELINUX_CB_POLICYLOAD instead of AVC_CALLBACK_RESET callback as this
+only seems necessary on policy reload and not if the enforcing mode is
+changing.
+
+See discussion at https://marc.info/?l=selinux&m=152173501930182&w=2
+
+https://gitlab.freedesktop.org/dbus/dbus/issues/134
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/dbus/dbus/-/commit/a442601cb2e14f6ff3111fe5a86ebdf4d0dee436]
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+
+---
+ bus/selinux.c | 20 ++++----------------
+ 1 file changed, 4 insertions(+), 16 deletions(-)
+
+diff --git a/bus/selinux.c b/bus/selinux.c
+index c764794c..52cb9866 100644
+--- a/bus/selinux.c
++++ b/bus/selinux.c
+@@ -135,14 +135,10 @@ out:
+  * this could have changed.  Send a SIGHUP to reload all configs.
+  */
+ static int
+-policy_reload_callback (u_int32_t event, security_id_t ssid, 
+-                        security_id_t tsid, security_class_t tclass, 
+-                        access_vector_t perms, access_vector_t *out_retained)
++policy_reload_callback (int seqno)
+ {
+-  if (event == AVC_CALLBACK_RESET)
+-    return raise (SIGHUP);
+-  
+-  return 0;
++  _dbus_verbose ("SELinux policy reload callback called, sending SIGHUP\n");
++  return raise (SIGHUP);
+ }
+ 
+ /**
+@@ -327,15 +323,7 @@ bus_selinux_full_init (BusContext *context, DBusError *error)
+       goto error;
+     }
+ 
+-  if (avc_add_callback (policy_reload_callback, AVC_CALLBACK_RESET,
+-                       NULL, NULL, 0, 0) < 0)
+-    {
+-      dbus_set_error (error, DBUS_ERROR_FAILED,
+-                      "Failed to add policy reload callback: %s",
+-                      _dbus_strerror (errno));
+-      goto error;
+-    }
+-
++  selinux_set_callback (SELINUX_CB_POLICYLOAD, (union selinux_callback) policy_reload_callback);
+   selinux_set_callback (SELINUX_CB_AUDIT, (union selinux_callback) log_audit_callback);
+   selinux_set_callback (SELINUX_CB_LOG, (union selinux_callback) log_callback);
+ 
+-- 
+2.17.1
+
-- 
2.25.1


