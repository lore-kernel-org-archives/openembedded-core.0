Return-Path: <alexandre.belloni@free-electrons.com>
Received: from mail.free-electrons.com (top.free-electrons.com [176.31.233.9])
	by mail.openembedded.org (Postfix) with ESMTP id 860BD6D16E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 12:50:03 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 106)
	id 831F96E7; Mon, 17 Feb 2014 13:50:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT
	shortcircuit=ham autolearn=disabled version=3.3.2
Received: from localhost (128-79-216-6.hfc.dyn.abo.bbox.fr [128.79.216.6])
	by mail.free-electrons.com (Postfix) with ESMTPSA id 2F5FC61B;
	Mon, 17 Feb 2014 13:50:17 +0100 (CET)
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: ross.burton@intel.com
Date: Mon, 17 Feb 2014 13:49:59 +0100
Message-Id: <1392641399-8643-1-git-send-email-alexandre.belloni@free-electrons.com>
X-Mailer: git-send-email 1.8.3.2
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v3] matchbox-keyboard: daemonize launch
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
X-List-Received-Date: Mon, 17 Feb 2014 12:50:04 -0000

The .shbg extension is not properly supported by the Xsession script
provided by xserver-common.

See discussion here:
https://lists.yoctoproject.org/pipermail/poky/2013-December/009463.html

Bug here:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=5546

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 .../matchbox-keyboard/files/80matchboxkeyboard.sh  | 21 ++++++++++++++++++++
 .../files/80matchboxkeyboard.shbg                  | 23 ----------------------
 .../matchbox-keyboard/matchbox-keyboard_git.bb     |  4 ++--
 3 files changed, 23 insertions(+), 25 deletions(-)
 create mode 100755 meta/recipes-sato/matchbox-keyboard/files/80matchboxkeyboard.sh
 delete mode 100755 meta/recipes-sato/matchbox-keyboard/files/80matchboxkeyboard.shbg

diff --git a/meta/recipes-sato/matchbox-keyboard/files/80matchboxkeyboard.sh b/meta/recipes-sato/matchbox-keyboard/files/80matchboxkeyboard.sh
new file mode 100755
index 000000000000..6cf188b2d006
--- /dev/null
+++ b/meta/recipes-sato/matchbox-keyboard/files/80matchboxkeyboard.sh
@@ -0,0 +1,21 @@
+#!/bin/sh
+
+. /etc/formfactor/config
+
+CMD=""
+
+if [ "$HAVE_KEYBOARD" = "0" ]; then
+    CMD="matchbox-keyboard -d"
+elif [ "$DISPLAY_CAN_ROTATE" = "1" ]; then
+    if [ "$HAVE_KEYBOARD_PORTRAIT" = "1" -a "$HAVE_KEYBOARD_LANDSCAPE" = "0" ]; then
+        CMD="matchbox-keyboard -d -o landscape"
+    elif [ "$HAVE_KEYBOARD_LANDSCAPE" = "1" -a "$HAVE_KEYBOARD_PORTRAIT" = "0" ]; then
+        CMD="matchbox-keyboard -d -o portrait"
+    fi
+fi
+
+if [ "$CMD" ]; then
+    # Delay to make sure the window manager is active
+    # by waiting for the desktop to say its finished loading
+    dbus-wait org.matchbox_project.desktop Loaded && $CMD &
+fi
diff --git a/meta/recipes-sato/matchbox-keyboard/files/80matchboxkeyboard.shbg b/meta/recipes-sato/matchbox-keyboard/files/80matchboxkeyboard.shbg
deleted file mode 100755
index 43c5d3ed6a32..000000000000
--- a/meta/recipes-sato/matchbox-keyboard/files/80matchboxkeyboard.shbg
+++ /dev/null
@@ -1,23 +0,0 @@
-#!/bin/sh
-
-. /etc/formfactor/config
-
-CMD=""
-
-if [ "$HAVE_KEYBOARD" = "0" ]; then
-    CMD="matchbox-keyboard -d"
-elif [ "$DISPLAY_CAN_ROTATE" = "1" ]; then
-    if [ "$HAVE_KEYBOARD_PORTRAIT" = "1" -a "$HAVE_KEYBOARD_LANDSCAPE" = "0" ]; then
-        CMD="matchbox-keyboard -d -o landscape"
-    elif [ "$HAVE_KEYBOARD_LANDSCAPE" = "1" -a "$HAVE_KEYBOARD_PORTRAIT" = "0" ]; then
-        CMD="matchbox-keyboard -d -o portrait"
-    fi
-fi
-					
-
-if [ "$CMD" ]; then
-    # Delay to make sure the window manager is active
-    # by waiting for the desktop to say its finished loading
-    dbus-wait org.matchbox_project.desktop Loaded
-    exec $CMD
-fi
diff --git a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
index ffcabcad2215..70caf6fc0222 100644
--- a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
+++ b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
@@ -17,7 +17,7 @@ PR = "r4"
 SRC_URI = "git://git.yoctoproject.org/${BPN} \
            file://configure_fix.patch;maxrev=1819 \
            file://single-instance.patch \
-           file://80matchboxkeyboard.shbg \
+           file://80matchboxkeyboard.sh \
            file://png-fix.patch"
 
 S = "${WORKDIR}/git"
@@ -43,7 +43,7 @@ FILES_${PN}-applet = "${libdir}/matchbox-panel/*.so"
 
 do_install_append () {
 	install -d ${D}/${sysconfdir}/X11/Xsession.d/
-	install -m 755 ${WORKDIR}/80matchboxkeyboard.shbg ${D}/${sysconfdir}/X11/Xsession.d/
+	install -m 755 ${WORKDIR}/80matchboxkeyboard.sh ${D}/${sysconfdir}/X11/Xsession.d/
 
 	rm -f ${D}${libdir}/gtk-2.0/*/immodules/*.la
 	rm -f ${D}${libdir}/matchbox-panel/*.la
-- 
1.8.3.2


