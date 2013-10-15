Return-Path: <riku.voipio@linaro.org>
Received: from afflict.kos.to (afflict.kos.to [92.243.29.197])
	by mail.openembedded.org (Postfix) with ESMTP id 1BA4660EED
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 11:51:45 +0000 (UTC)
Received: from localhost.localdomain (91-157-208-114.elisa-laajakaista.fi
	[91.157.208.114])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by afflict.kos.to (Postfix) with ESMTPSA id 441BA26551;
	Tue, 15 Oct 2013 13:51:44 +0200 (CEST)
From: Riku Voipio <riku.voipio@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Oct 2013 14:51:05 +0300
Message-Id: <1381837865-24381-1-git-send-email-riku.voipio@linaro.org>
X-Mailer: git-send-email 1.8.3.1
Cc: patches@linaro.org
Subject: [PATCH] glib-2.0: fix build on Aarch64
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
X-List-Received-Date: Tue, 15 Oct 2013 11:51:45 -0000

Backported patch from upstream

Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
---
 ...ror-format-string-errors-from-mismatched-.patch | 56 ++++++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.38.0.bb      |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-gio-Fix-Werror-format-string-errors-from-mismatched-.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-Fix-Werror-format-string-errors-from-mismatched-.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-Fix-Werror-format-string-errors-from-mismatched-.patch
new file mode 100644
index 0000000..9b87d9d
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-Fix-Werror-format-string-errors-from-mismatched-.patch
@@ -0,0 +1,56 @@
+From 0167c3340d8201dca8e9031b61703bbc5ed6ce33 Mon Sep 17 00:00:00 2001
+From: Jan Schmidt <thaytan@noraisin.net>
+Date: Wed, 25 Sep 2013 19:22:26 +1000
+Subject: [PATCH] gio: Fix -Werror format string errors from mismatched ints.
+
+Upstream-Status: Backport
+
+---
+ gio/gdbusmessage.c | 8 ++++----
+ gio/gdbusprivate.c | 4 ++--
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/gio/gdbusmessage.c b/gio/gdbusmessage.c
+index ac233a3..ad77aa6 100644
+--- a/gio/gdbusmessage.c
++++ b/gio/gdbusmessage.c
+@@ -3468,10 +3468,10 @@ g_dbus_message_print (GDBusMessage *message,
+                                           statbuf.st_mode);
+                   g_string_append_printf (fs, "%s" "ino=%" G_GUINT64_FORMAT, fs->len > 0 ? "," : "",
+                                           (guint64) statbuf.st_ino);
+-                  g_string_append_printf (fs, "%s" "uid=%d", fs->len > 0 ? "," : "",
+-                                          statbuf.st_uid);
+-                  g_string_append_printf (fs, "%s" "gid=%d", fs->len > 0 ? "," : "",
+-                                          statbuf.st_gid);
++                  g_string_append_printf (fs, "%s" "uid=%u", fs->len > 0 ? "," : "",
++                                          (guint) statbuf.st_uid);
++                  g_string_append_printf (fs, "%s" "gid=%u", fs->len > 0 ? "," : "",
++                                          (guint) statbuf.st_gid);
+                   g_string_append_printf (fs, "%s" "rdev=%d:%d", fs->len > 0 ? "," : "",
+                                           major (statbuf.st_rdev), minor (statbuf.st_rdev));
+                   g_string_append_printf (fs, "%s" "size=%" G_GUINT64_FORMAT, fs->len > 0 ? "," : "",
+diff --git a/gio/gdbusprivate.c b/gio/gdbusprivate.c
+index 0e5bef2..785a0c0 100644
+--- a/gio/gdbusprivate.c
++++ b/gio/gdbusprivate.c
+@@ -2155,7 +2155,7 @@ write_message_print_transport_debug (gssize bytes_written,
+   _g_dbus_debug_print_lock ();
+   g_print ("========================================================================\n"
+            "GDBus-debug:Transport:\n"
+-           "  >>>> WROTE %" G_GSIZE_FORMAT " bytes of message with serial %d and\n"
++           "  >>>> WROTE %" G_GSSIZE_FORMAT " bytes of message with serial %d and\n"
+            "       size %" G_GSIZE_FORMAT " from offset %" G_GSIZE_FORMAT " on a %s\n",
+            bytes_written,
+            g_dbus_message_get_serial (data->message),
+@@ -2206,7 +2206,7 @@ read_message_print_transport_debug (gssize bytes_read,
+     _g_dbus_debug_print_lock ();
+   g_print ("========================================================================\n"
+            "GDBus-debug:Transport:\n"
+-           "  <<<< READ %" G_GSIZE_FORMAT " bytes of message with serial %d and\n"
++           "  <<<< READ %" G_GSSIZE_FORMAT " bytes of message with serial %d and\n"
+            "       size %d to offset %" G_GSIZE_FORMAT " from a %s\n",
+            bytes_read,
+            serial,
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.38.0.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.38.0.bb
index 4b9b112..5717bd2 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.38.0.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.38.0.bb
@@ -14,6 +14,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://add-march-i486-into-CFLAGS-automatically.patch \
            file://glib-2.0-configure-readlink.patch \
            file://run-ptest \
+           file://0001-gio-Fix-Werror-format-string-errors-from-mismatched-.patch \
           "
 
 SRC_URI_append_class-native = " file://glib-gettextize-dir.patch"
-- 
1.8.3.1


