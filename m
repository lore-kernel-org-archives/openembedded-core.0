Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id E343E6B2E6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 13:31:44 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id w62so3147048wes.38
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 05:31:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=WCbJngcZwNAJKwj+EuBbAm5d+j9PZsoE0UULG/ZpEDM=;
	b=TV1fx5NRWWDmpm5PIM9VLnHW+W46s2yZEQjB6Zf+yUnC7X+WIGFL0DghvK1uroleB1
	/ZL6Q4BqbL7Hq22kgZhk/NwE0MEPjKh5ib0FwncvQibxQSiPT9BMr2Ym2Qy/GZP64zLb
	/YiiiKPT8B+ZEESiZtRtIK6ZgcUHkPL8bWb6W921g7UUoRwwfOQoUEQpNPovLWmYUIKk
	h73N0Gnx4Yj+M9GxGRz6+NIxhdE6HW/wMo9eMfzaUNNVJAdd0MF90YXQCGYleZZeCB+H
	pohKgW73ASUR1LpBegqGvd1OLm05pAHN5mYqiSTpLej54fMQMueChhdYQOsH3XeFGpkj
	8AAA==
X-Gm-Message-State: ALoCoQkztSwAb5bTGLF0oYMEXajR9DK3aV6O0yxrJKPMEh8RvA9c2ER/psOK056W7yNo2QoAZ4jV
X-Received: by 10.195.13.130 with SMTP id ey2mr8406039wjd.7.1389879105417;
	Thu, 16 Jan 2014 05:31:45 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id ux5sm6220322wjc.6.2014.01.16.05.31.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Jan 2014 05:31:44 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Jan 2014 13:31:38 +0000
Message-Id: <1389879099-27498-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/2] glib-2.0: fix the dbus-appinfo test when running outside of X
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
X-List-Received-Date: Thu, 16 Jan 2014 13:31:46 -0000

This test was attempting to connect to a session bus and hanging if it couldn't.
Take a patch from upstream to correctly use a private bus.

[ YOCTO #5696 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../glib-2.0/glib-2.0/ptest-dbus.patch             |   65 ++++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.38.2.bb      |    1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/ptest-dbus.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/ptest-dbus.patch b/meta/recipes-core/glib-2.0/glib-2.0/ptest-dbus.patch
new file mode 100644
index 0000000..0db8fd1
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/ptest-dbus.patch
@@ -0,0 +1,65 @@
+Fix dbus-appinfo from attempting to use the session's bus, and hanging if there
+isn't one present.
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 940fa98290812789d095d93ff1c550cd86fb2428 Mon Sep 17 00:00:00 2001
+From: Xavier Claessens <xavier.claessens@collabora.co.uk>
+Date: Mon, 28 Oct 2013 21:18:54 +0000
+Subject: Tests: add session_bus_run() and use it where possible
+
+This is to avoid having again the subtil bug in dbus-appinfo.c:
+session_bus_down() was called before g_test_run() so the test was
+running on the user's dbus session.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=697348
+---
+diff --git a/gio/tests/dbus-appinfo.c b/gio/tests/dbus-appinfo.c
+index ca11e98..7698429 100644
+--- a/gio/tests/dbus-appinfo.c
++++ b/gio/tests/dbus-appinfo.c
+@@ -280,11 +280,7 @@ main (int argc, char **argv)
+ {
+   g_test_init (&argc, &argv, NULL);
+ 
+-  session_bus_up ();
+-
+   g_test_add_func ("/appinfo/dbusappinfo", test_dbus_appinfo);
+ 
+-  session_bus_down ();
+-
+-  return g_test_run ();
++  return session_bus_run ();
+ }
+diff --git a/gio/tests/gdbus-sessionbus.c b/gio/tests/gdbus-sessionbus.c
+index 68c4449..13c2edb 100644
+--- a/gio/tests/gdbus-sessionbus.c
++++ b/gio/tests/gdbus-sessionbus.c
+@@ -47,3 +47,14 @@ session_bus_down (void)
+   g_clear_object (&singleton);
+ }
+ 
++gint
++session_bus_run (void)
++{
++  gint ret;
++
++  session_bus_up ();
++  ret = g_test_run ();
++  session_bus_down ();
++
++  return ret;
++}
+diff --git a/gio/tests/gdbus-sessionbus.h b/gio/tests/gdbus-sessionbus.h
+index 7ef3abd..284cd00 100644
+--- a/gio/tests/gdbus-sessionbus.h
++++ b/gio/tests/gdbus-sessionbus.h
+@@ -30,6 +30,7 @@ G_BEGIN_DECLS
+ void session_bus_up   (void);
+ void session_bus_stop (void);
+ void session_bus_down (void);
++gint session_bus_run (void);
+ 
+ G_END_DECLS
+ 
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.38.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.38.2.bb
index 02730f1..a5bfc70 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.38.2.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.38.2.bb
@@ -11,6 +11,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://glib-2.0-configure-readlink.patch \
            file://run-ptest \
            file://0001-gio-Fix-Werror-format-string-errors-from-mismatched-.patch \
+           file://ptest-dbus.patch \
           "
 
 SRC_URI_append_class-native = " file://glib-gettextize-dir.patch"
-- 
1.7.10.4


