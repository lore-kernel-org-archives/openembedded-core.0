Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web12.1771.1605301911915734846
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2020 13:11:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=npmTwvGZ;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id m13so11884114oih.8
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2020 13:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=svZQagf6iLmwwni0nU9T94vAnOqMuxeO+k8fmQpTe8w=;
        b=npmTwvGZ1cZ6GWAsQnmlfft2SAetx3MPCxmfpuyRMZZqoGUowNCLaQpxaWzue8mDhg
         bAW3WUuJ+dhDxTSo9S3GACWlnzgcB3NvZTtltjw4kMviFn4WI/kXXVYIJWlFcqU15dbw
         JkE4Rj3XlSSaMRj0pObjrTojT6gwRZg+IXCW024RXE1M1hmEtVwtQdPgLitIuZmIsuzT
         7OxZroVkz2vqPdMSfCCAqI1c2H5tBPu+Yyjds+l298WawkHQOK14vGImEcNsXgi/Sx/9
         zysuIVxPtDUDD1zYCCy7V7hyRtsvuDEzRQ2y7xgGRvN/it+PfD7N2yA7ZwxndYlcTuiM
         iyBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=svZQagf6iLmwwni0nU9T94vAnOqMuxeO+k8fmQpTe8w=;
        b=awb23vm6kQeb1dBlOtVxeudFfIVem5EVWRxUhV37BkEIeE2jMHHG4WpYreyeZWqIz3
         vXfpwT75+MS1zO1W/O/cKDSo3TqLozJ2hco0j/qykwmOzdl+OY+BXrRUUHYvIkjkgwsM
         xTku8U/LCJKVdAxa/Ey3ZJG4+yB+UKmwWh19rOkRiDMsmaeTiB9Or8/Hely/KtQIk6xv
         8jRkdAI70zt9CnHglKL/VUi1UM/o4Xn90TjLCcjsYvweKkBAA+LqNW2gw74KsdMSK+ct
         YR6dx/jxyDRD6OReVH15pXbIHf7xxJQsOI0OzFiDftwwWPyI43H61ZomOLs38D3X8eW5
         wJ9g==
X-Gm-Message-State: AOAM533u2QVHTDtPPG6r28MgQz5NnhWaLYqE/1xJj89/6NZMItY7+FSa
	PfJ+gs6fBzg9FEj2N48SHtPo0rgBvIviow==
X-Google-Smtp-Source: ABdhPJwp0NtF70SCHWbV6o/v5Hyi30IQGn8LMTkcfZF1qdVOAwypNE14pmWryyh/UdDtnTOIy4wPWw==
X-Received: by 2002:aca:afd3:: with SMTP id y202mr2672355oie.135.1605301910930;
        Fri, 13 Nov 2020 13:11:50 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id w18sm2239632otl.38.2020.11.13.13.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 13:11:50 -0800 (PST)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] systemd: Re-enable chvt as non-root user without polkit
Date: Fri, 13 Nov 2020 15:11:43 -0600
Message-Id: <20201113211143.30425-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

systemd 245 introduced a regression in behavior where they removed
support for non-root users to chvt from a service file. This prevents
running compositors (e.g. weston) as any user other than root. The
intention is for polkit to be used to allow this (and in fact the
default polkit rules that ship with systemd allow this). However, polkit
is a huge dependency to bring in for an embedded system, and isn't
support by OE-core.

The patch has been proposed upstream to restore the previous behavior of
allowing a non-root user to chvt to unbreak the regression without
requiring polkit.

Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/17494]
Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 ...chvt-as-non-root-user-without-polkit.patch | 227 ++++++++++++++++++
 meta/recipes-core/systemd/systemd_246.6.bb    |   1 +
 2 files changed, 228 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-logind-Restore-chvt-as-non-root-user-without-polkit.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-logind-Restore-chvt-as-non-root-user-without-polkit.patch b/meta/recipes-core/systemd/systemd/0001-logind-Restore-chvt-as-non-root-user-without-polkit.patch
new file mode 100644
index 0000000000..89ef39bc3e
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-logind-Restore-chvt-as-non-root-user-without-polkit.patch
@@ -0,0 +1,227 @@
+From 150d9cade6d475570395cb418b824524dead9577 Mon Sep 17 00:00:00 2001
+From: Joshua Watt <JPEWhacker@gmail.com>
+Date: Fri, 30 Oct 2020 08:15:43 -0500
+Subject: [PATCH] logind: Restore chvt as non-root user without polkit
+
+4acf0cfd2f ("logind: check PolicyKit before allowing VT switch") broke
+the ability to write user sessions that run graphical sessions (e.g.
+weston/X11). This was partially amended in 19bb87fbfa ("login: allow
+non-console sessions to change vt") by changing the default PolicyKit
+policy so that non-root users are again allowed to switch the VT. This
+makes the policy when PolKit is not enabled (as on many embedded
+systems) match the default PolKit policy and allows launching graphical
+sessions as a non-root user.
+
+Closes #17473
+---
+ src/login/logind-dbus.c         | 11 ++-------
+ src/login/logind-polkit.c       | 26 +++++++++++++++++++++
+ src/login/logind-polkit.h       | 10 ++++++++
+ src/login/logind-seat-dbus.c    | 41 ++++-----------------------------
+ src/login/logind-session-dbus.c | 11 ++-------
+ src/login/meson.build           |  1 +
+ 6 files changed, 46 insertions(+), 54 deletions(-)
+ create mode 100644 src/login/logind-polkit.c
+ create mode 100644 src/login/logind-polkit.h
+
+diff --git a/src/login/logind-dbus.c b/src/login/logind-dbus.c
+index 0f83ed99bc..a3765d88ba 100644
+--- a/src/login/logind-dbus.c
++++ b/src/login/logind-dbus.c
+@@ -30,6 +30,7 @@
+ #include "format-util.h"
+ #include "fs-util.h"
+ #include "logind-dbus.h"
++#include "logind-polkit.h"
+ #include "logind-seat-dbus.h"
+ #include "logind-session-dbus.h"
+ #include "logind-user-dbus.h"
+@@ -1047,15 +1048,7 @@ static int method_activate_session_on_seat(sd_bus_message *message, void *userda
+                 return sd_bus_error_setf(error, BUS_ERROR_SESSION_NOT_ON_SEAT,
+                                          "Session %s not on seat %s", session_name, seat_name);
+ 
+-        r = bus_verify_polkit_async(
+-                        message,
+-                        CAP_SYS_ADMIN,
+-                        "org.freedesktop.login1.chvt",
+-                        NULL,
+-                        false,
+-                        UID_INVALID,
+-                        &m->polkit_registry,
+-                        error);
++        r = check_polkit_chvt(message, m, error);
+         if (r < 0)
+                 return r;
+         if (r == 0)
+diff --git a/src/login/logind-polkit.c b/src/login/logind-polkit.c
+new file mode 100644
+index 0000000000..9072570cc6
+--- /dev/null
++++ b/src/login/logind-polkit.c
+@@ -0,0 +1,26 @@
++/* SPDX-License-Identifier: LGPL-2.1+ */
++
++#include "bus-polkit.h"
++#include "logind-polkit.h"
++#include "missing_capability.h"
++#include "user-util.h"
++
++int check_polkit_chvt(sd_bus_message *message, Manager *manager, sd_bus_error *error) {
++#if ENABLE_POLKIT
++        return bus_verify_polkit_async(
++                        message,
++                        CAP_SYS_ADMIN,
++                        "org.freedesktop.login1.chvt",
++                        NULL,
++                        false,
++                        UID_INVALID,
++                        &manager->polkit_registry,
++                        error);
++#else
++        /* Allow chvt when polkit is not present. This allows a service to start a graphical session as a
++         * non-root user when polkit is not compiled in, matching the default polkit policy */
++        return 1;
++#endif
++}
++
++
+diff --git a/src/login/logind-polkit.h b/src/login/logind-polkit.h
+new file mode 100644
+index 0000000000..476c077a8a
+--- /dev/null
++++ b/src/login/logind-polkit.h
+@@ -0,0 +1,10 @@
++/* SPDX-License-Identifier: LGPL-2.1+ */
++#pragma once
++
++#include "sd-bus.h"
++
++#include "bus-object.h"
++#include "logind.h"
++
++int check_polkit_chvt(sd_bus_message *message, Manager *manager, sd_bus_error *error);
++
+diff --git a/src/login/logind-seat-dbus.c b/src/login/logind-seat-dbus.c
+index a945132284..f22e9e2734 100644
+--- a/src/login/logind-seat-dbus.c
++++ b/src/login/logind-seat-dbus.c
+@@ -9,6 +9,7 @@
+ #include "bus-polkit.h"
+ #include "bus-util.h"
+ #include "logind-dbus.h"
++#include "logind-polkit.h"
+ #include "logind-seat-dbus.h"
+ #include "logind-seat.h"
+ #include "logind-session-dbus.h"
+@@ -179,15 +180,7 @@ static int method_activate_session(sd_bus_message *message, void *userdata, sd_b
+         if (session->seat != s)
+                 return sd_bus_error_setf(error, BUS_ERROR_SESSION_NOT_ON_SEAT, "Session %s not on seat %s", name, s->id);
+ 
+-        r = bus_verify_polkit_async(
+-                        message,
+-                        CAP_SYS_ADMIN,
+-                        "org.freedesktop.login1.chvt",
+-                        NULL,
+-                        false,
+-                        UID_INVALID,
+-                        &s->manager->polkit_registry,
+-                        error);
++        r = check_polkit_chvt(message, s->manager, error);
+         if (r < 0)
+                 return r;
+         if (r == 0)
+@@ -215,15 +208,7 @@ static int method_switch_to(sd_bus_message *message, void *userdata, sd_bus_erro
+         if (to <= 0)
+                 return sd_bus_error_setf(error, SD_BUS_ERROR_INVALID_ARGS, "Invalid virtual terminal");
+ 
+-        r = bus_verify_polkit_async(
+-                        message,
+-                        CAP_SYS_ADMIN,
+-                        "org.freedesktop.login1.chvt",
+-                        NULL,
+-                        false,
+-                        UID_INVALID,
+-                        &s->manager->polkit_registry,
+-                        error);
++        r = check_polkit_chvt(message, s->manager, error);
+         if (r < 0)
+                 return r;
+         if (r == 0)
+@@ -243,15 +228,7 @@ static int method_switch_to_next(sd_bus_message *message, void *userdata, sd_bus
+         assert(message);
+         assert(s);
+ 
+-        r = bus_verify_polkit_async(
+-                        message,
+-                        CAP_SYS_ADMIN,
+-                        "org.freedesktop.login1.chvt",
+-                        NULL,
+-                        false,
+-                        UID_INVALID,
+-                        &s->manager->polkit_registry,
+-                        error);
++        r = check_polkit_chvt(message, s->manager, error);
+         if (r < 0)
+                 return r;
+         if (r == 0)
+@@ -271,15 +248,7 @@ static int method_switch_to_previous(sd_bus_message *message, void *userdata, sd
+         assert(message);
+         assert(s);
+ 
+-        r = bus_verify_polkit_async(
+-                        message,
+-                        CAP_SYS_ADMIN,
+-                        "org.freedesktop.login1.chvt",
+-                        NULL,
+-                        false,
+-                        UID_INVALID,
+-                        &s->manager->polkit_registry,
+-                        error);
++        r = check_polkit_chvt(message, s->manager, error);
+         if (r < 0)
+                 return r;
+         if (r == 0)
+diff --git a/src/login/logind-session-dbus.c b/src/login/logind-session-dbus.c
+index ccc5ac8df2..57c8a4e900 100644
+--- a/src/login/logind-session-dbus.c
++++ b/src/login/logind-session-dbus.c
+@@ -11,6 +11,7 @@
+ #include "fd-util.h"
+ #include "logind-brightness.h"
+ #include "logind-dbus.h"
++#include "logind-polkit.h"
+ #include "logind-seat-dbus.h"
+ #include "logind-session-dbus.h"
+ #include "logind-session-device.h"
+@@ -192,15 +193,7 @@ int bus_session_method_activate(sd_bus_message *message, void *userdata, sd_bus_
+         assert(message);
+         assert(s);
+ 
+-        r = bus_verify_polkit_async(
+-                        message,
+-                        CAP_SYS_ADMIN,
+-                        "org.freedesktop.login1.chvt",
+-                        NULL,
+-                        false,
+-                        UID_INVALID,
+-                        &s->manager->polkit_registry,
+-                        error);
++        r = check_polkit_chvt(message, s->manager, error);
+         if (r < 0)
+                 return r;
+         if (r == 0)
+diff --git a/src/login/meson.build b/src/login/meson.build
+index 0a7d3d5440..7e46be2add 100644
+--- a/src/login/meson.build
++++ b/src/login/meson.build
+@@ -26,6 +26,7 @@ liblogind_core_sources = files('''
+         logind-device.h
+         logind-inhibit.c
+         logind-inhibit.h
++        logind-polkit.c
+         logind-seat-dbus.c
+         logind-seat-dbus.h
+         logind-seat.c
+-- 
+2.28.0
+
diff --git a/meta/recipes-core/systemd/systemd_246.6.bb b/meta/recipes-core/systemd/systemd_246.6.bb
index 9215adf8dc..a7004d67c0 100644
--- a/meta/recipes-core/systemd/systemd_246.6.bb
+++ b/meta/recipes-core/systemd/systemd_246.6.bb
@@ -21,6 +21,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
            file://0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch \
+           file://0001-logind-Restore-chvt-as-non-root-user-without-polkit.patch \
            "
 
 # patches needed by musl
-- 
2.29.2

