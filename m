Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 3CC206E64A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 08:14:31 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 12 Apr 2016 01:14:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,473,1455004800"; d="scan'208";a="684848353"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 12 Apr 2016 01:14:31 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Apr 2016 11:14:22 +0300
Message-Id: <1460448862-16134-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] matchbox-keyboard: Hide desktop launcher
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
X-List-Received-Date: Tue, 12 Apr 2016 08:14:32 -0000

Add patch that hides the keyboard desktop launcher, remove patch that
tries and fails to make the keyboard a single-instance application.

The desktop launcher of matchbox-keyboard is a source of far more
problems than solutions: As an example there's supposed to be only
one instance running at a time but we give the user several ways to
start multiple instances (and the Matchbox WM Single-Instance
implementation is broken by both design and implementation).

After this patch the only instance of matchbox-keyboard is the
daemonized one that can be shown/hidden with the panel applet (when
there is not hardware keyboard). If an additional matchbox-keyboard
needs to be started for debug reasons, it can still be done from
command line.

Fixes [YOCTO #3093].

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 
This change would have been nice to have much before release to give
people time to react (in the unlikely case that someone actually has a
reasonable use case for the launcher). Unfortunately I only thought of
this solution now.

Also available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/hide-matchbox-keyboard
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/hide-matchbox-keyboard

Cheers,
  Jussi


 ...ktop-file-Hide-the-keyboard-from-app-list.patch | 33 ++++++++++++++++++++++
 .../matchbox-keyboard/files/single-instance.patch  | 23 ---------------
 .../matchbox-keyboard/matchbox-keyboard_git.bb     |  2 +-
 3 files changed, 34 insertions(+), 24 deletions(-)
 create mode 100644 meta/recipes-sato/matchbox-keyboard/files/0001-desktop-file-Hide-the-keyboard-from-app-list.patch
 delete mode 100644 meta/recipes-sato/matchbox-keyboard/files/single-instance.patch

diff --git a/meta/recipes-sato/matchbox-keyboard/files/0001-desktop-file-Hide-the-keyboard-from-app-list.patch b/meta/recipes-sato/matchbox-keyboard/files/0001-desktop-file-Hide-the-keyboard-from-app-list.patch
new file mode 100644
index 0000000..6b7a5cf
--- /dev/null
+++ b/meta/recipes-sato/matchbox-keyboard/files/0001-desktop-file-Hide-the-keyboard-from-app-list.patch
@@ -0,0 +1,33 @@
+From 38da4cd575edb7463cfff241afff64c2f66ea09a Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Tue, 12 Apr 2016 09:40:37 +0300
+Subject: [PATCH] desktop file: Hide the keyboard from app list
+
+matchbox-keyboard is not a normal app and there's no need to start
+it via the desktop app grid when using Sato desktop:
+* when there's no hardware keyboard, the panel applet can be used to
+  show/hide the daemonized matchbox-keyboard
+* when there is a hardware keyboard, matchbox-keyboard can still be
+  started for debug purposes from command line or the applet can be
+  enabled by editing /etc/formfactor/machconfig
+
+So hide the keyboard from the desktop app list.
+
+Upstream-Status: Inappropriate [configuration]
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ matchbox-keyboard.desktop | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/matchbox-keyboard.desktop b/matchbox-keyboard.desktop
+index c092bfe..613d349 100644
+--- a/matchbox-keyboard.desktop
++++ b/matchbox-keyboard.desktop
+@@ -6,3 +6,4 @@ Type=Application
+ Icon=matchbox-keyboard.png
+ Categories=Panel;Utility;MB
+ X-MB-INPUT-MECHANSIM=True
++NoDisplay=true
+-- 
+2.1.4
+
diff --git a/meta/recipes-sato/matchbox-keyboard/files/single-instance.patch b/meta/recipes-sato/matchbox-keyboard/files/single-instance.patch
deleted file mode 100644
index 18b6c41..0000000
--- a/meta/recipes-sato/matchbox-keyboard/files/single-instance.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Multiple matchbox-keyboard instances would occupy whole screen and cause X
-window segfault(Bug 509). Making matchbox-keyboard singleton is one work
-around.
-
-This patch allow only one instance of matchbox-keyboard based on some mechanism
-in matchbox-desktop. In future, an applet and GTK-IM modules in
-matchbox-keyboard can be used to automatically map/unmap the virtual keyboard
-on demand.
-
-Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
-
-Upstream-Status: Inappropriate [configuration]
-
-Index: matchbox-keyboard/matchbox-keyboard.desktop
-===================================================================
---- matchbox-keyboard.orig/matchbox-keyboard.desktop	2010-12-22 20:41:40.000000000 +0800
-+++ matchbox-keyboard/matchbox-keyboard.desktop	2010-12-22 20:42:12.000000000 +0800
-@@ -6,3 +6,5 @@
- Icon=matchbox-keyboard.png
- Categories=Panel;Utility;MB
- X-MB-INPUT-MECHANSIM=True
-+X-MB-SingleInstance=true
-+StartupNotify=true
diff --git a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
index 183cba2..eba1970 100644
--- a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
+++ b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
@@ -15,7 +15,7 @@ PV = "0.0+git${SRCPV}"
 PR = "r4"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};branch=matchbox-keyboard-0-1 \
-           file://single-instance.patch \
+           file://0001-desktop-file-Hide-the-keyboard-from-app-list.patch \
            file://80matchboxkeyboard.sh"
 
 S = "${WORKDIR}/git"
-- 
2.1.4


