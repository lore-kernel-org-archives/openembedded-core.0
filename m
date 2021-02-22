Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.36807.1614009685491576194
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 08:01:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 5mJRo23TWNmsyjGtKaU+ZzxNiVUSQPh1yAcqcz6KwAVLH6uiyg1nxsYuffopZaqR8BXS2p+CO8
 NRXdl7ALuBgw==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="163706227"
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="163706227"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:01:23 -0800
IronPort-SDR: vebNZYrdO01tzU+JLrpu3spMO43DvU4IQlVxeC71Ba4OxAvbVX+kFfJjyHtz1RxHJ6sFBESKHP
 dmvRcUwsqKxw==
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="430302140"
Received: from yrajendx-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.39])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:01:19 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 28/30] systemd: Re-enable chvt as non-root user without polkit
Date: Tue, 23 Feb 2021 00:00:31 +0800
Message-Id: <e42dd9cff98f2149904e104f08bc3f19ee7b6fc0.1614009417.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614009417.git.anuj.mittal@intel.com>
References: <cover.1614009417.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joshua Watt <JPEWhacker@gmail.com>

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ef8cf581b680f8b8ee35d50c75891b4fd8b91f2f)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...chvt-as-non-root-user-without-polkit.patch | 227 ++++++++++++++++++
 meta/recipes-core/systemd/systemd_246.9.bb    |   1 +
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
diff --git a/meta/recipes-core/systemd/systemd_246.9.bb b/meta/recipes-core/systemd/systemd_246.9.bb
index 2f460e9bee..daee795cc2 100644
--- a/meta/recipes-core/systemd/systemd_246.9.bb
+++ b/meta/recipes-core/systemd/systemd_246.9.bb
@@ -21,6 +21,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
            file://0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch \
+           file://0001-logind-Restore-chvt-as-non-root-user-without-polkit.patch \
            "
 
 # patches needed by musl
-- 
2.29.2

