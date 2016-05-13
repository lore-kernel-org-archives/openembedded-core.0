Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id BFF8070101
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 19:49:03 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 13 May 2016 12:49:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,615,1455004800"; d="scan'208";a="980017471"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.164])
	by fmsmga002.fm.intel.com with ESMTP; 13 May 2016 12:49:04 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 May 2016 14:49:27 -0500
Message-Id: <1463168968-29526-4-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1463168968-29526-1-git-send-email-anibal.limon@linux.intel.com>
References: <1463168968-29526-1-git-send-email-anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: joshua.g.lock@intel.com, edwin.plauchu.camacho@intel.com
Subject: [PATCH 3/4] leafpad: Fix security formating issues.
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
X-List-Received-Date: Fri, 13 May 2016 19:49:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

[YOCTO #9546]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 ...gtkprint-.c-Fix-security-formatting-issue.patch | 81 ++++++++++++++++++++++
 meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb      |  4 +-
 2 files changed, 84 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-sato/leafpad/files/src-dialog-gtkprint-.c-Fix-security-formatting-issue.patch

diff --git a/meta/recipes-sato/leafpad/files/src-dialog-gtkprint-.c-Fix-security-formatting-issue.patch b/meta/recipes-sato/leafpad/files/src-dialog-gtkprint-.c-Fix-security-formatting-issue.patch
new file mode 100644
index 0000000..cf2687f
--- /dev/null
+++ b/meta/recipes-sato/leafpad/files/src-dialog-gtkprint-.c-Fix-security-formatting-issue.patch
@@ -0,0 +1,81 @@
+From 316ccb1733a6da726c0e7f0748e3e88ec459ca54 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
+Date: Fri, 13 May 2016 14:36:51 -0500
+Subject: [PATCH] src/{dialog,gtkprint}.c: Fix security formatting issues
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+../../../../../../../workspace/sources/leafpad/src/dialog.c: In
+unction
+'run_dialog_message':
+../../../../../../../workspace/sources/leafpad/src/dialog.c:39:3:
+rror:
+format not a string literal and no format arguments
+[-Werror=format-security]
+   str);
+   ^
+../../../../../../../workspace/sources/leafpad/src/dialog.c: In
+unction
+'create_dialog_message_question':
+../../../../../../../workspace/sources/leafpad/src/dialog.c:64:3:
+rror:
+format not a string literal and no format arguments
+[-Werror=format-security]
+   str);
+
+../../../../../../../workspace/sources/leafpad/src/gtkprint.c: In
+function 'create_error_dialog':
+../../../../../../../workspace/sources/leafpad/src/gtkprint.c:168:3:
+error: format not a string literal and no format arguments
+[-Werror=format-security]
+   message);
+
+[YOCTO #9546]
+
+Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
+
+Upstream-status: Pending
+---
+ src/dialog.c   | 4 ++--
+ src/gtkprint.c | 2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/dialog.c b/src/dialog.c
+index 14b69d7..8c8f2da 100644
+--- a/src/dialog.c
++++ b/src/dialog.c
+@@ -36,7 +36,7 @@ void run_dialog_message(GtkWidget *window,
+ 		GTK_DIALOG_DESTROY_WITH_PARENT,
+ 		type,
+ 		GTK_BUTTONS_NONE,
+-		str);
++		str, NULL);
+ 	gtk_window_set_resizable(GTK_WINDOW(dialog), FALSE);
+ 	gtk_dialog_add_buttons(GTK_DIALOG(dialog),
+ 		GTK_STOCK_OK, GTK_RESPONSE_CANCEL, NULL);
+@@ -61,7 +61,7 @@ GtkWidget *create_dialog_message_question(GtkWidget *window, gchar *message, ...
+ 		GTK_DIALOG_DESTROY_WITH_PARENT,
+ 		GTK_MESSAGE_QUESTION,
+ 		GTK_BUTTONS_NONE,
+-		str);
++		str, NULL);
+ 	gtk_window_set_resizable(GTK_WINDOW(dialog), FALSE);
+ 	gtk_dialog_add_buttons(GTK_DIALOG(dialog),
+ 		GTK_STOCK_NO, GTK_RESPONSE_NO,
+diff --git a/src/gtkprint.c b/src/gtkprint.c
+index 3f39384..e2bb83a 100644
+--- a/src/gtkprint.c
++++ b/src/gtkprint.c
+@@ -165,7 +165,7 @@ static void create_error_dialog(GtkTextView *text_view, gchar *message)
+ 		GTK_DIALOG_DESTROY_WITH_PARENT,
+ 		GTK_MESSAGE_ERROR,
+ 		GTK_BUTTONS_NONE,
+-		message);
++		message, NULL);
+ 	gtk_window_set_resizable(GTK_WINDOW(dialog), FALSE);
+ 	gtk_dialog_add_buttons(GTK_DIALOG(dialog),
+ 		GTK_STOCK_OK, GTK_RESPONSE_CANCEL, NULL);
+-- 
+2.1.4
+
diff --git a/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb b/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb
index 093b89f..e6a4b56 100644
--- a/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb
+++ b/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb
@@ -11,7 +11,9 @@ DEPENDS = "gtk+ intltool-native libowl gettext-native"
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
-	   file://leafpad.desktop"
+           file://leafpad.desktop \
+           file://src-dialog-gtkprint-.c-Fix-security-formatting-issue.patch \
+           "
 
 SRC_URI[md5sum] = "254a72fc67505e3aa52884c729cd7b97"
 SRC_URI[sha256sum] = "959d22ae07f22803bc66ff40d373a854532a6e4732680bf8a96a3fbcb9f80a2c"
-- 
2.1.4


