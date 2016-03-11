Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6838E65C5C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 12:13:38 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 11 Mar 2016 04:13:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,320,1455004800"; d="scan'208";a="931715560"
Received: from jlock-mobl1.gar.corp.intel.com (HELO
	jlock-mobl.gar.corp.intel.com) ([10.252.4.28])
	by orsmga002.jf.intel.com with ESMTP; 11 Mar 2016 04:13:38 -0800
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Mar 2016 12:13:31 +0000
Message-Id: <1457698412-11233-1-git-send-email-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 1/2] builder: remove hob from autostart
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
X-List-Received-Date: Fri, 11 Mar 2016 12:13:39 -0000

hob has been removed so don't try and autostart it with the mini-x
session in the build appliance.

Remove the please_wait_dialog program which informed the user to
wait for Hob to start.

Rename the mini-x autostart file to reflect the removal of hob, we
now just start a matchbox-terminal with the environment configured.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/recipes-graphics/builder/builder_0.1.bb       | 10 +++---
 .../builder/files/builder_hob_start.sh             | 37 ----------------------
 .../builder/files/builder_session.sh               | 33 +++++++++++++++++++
 .../builder/files/please_wait_dialog.py            | 28 ----------------
 4 files changed, 37 insertions(+), 71 deletions(-)
 delete mode 100644 meta/recipes-graphics/builder/files/builder_hob_start.sh
 create mode 100644 meta/recipes-graphics/builder/files/builder_session.sh
 delete mode 100644 meta/recipes-graphics/builder/files/please_wait_dialog.py

diff --git a/meta/recipes-graphics/builder/builder_0.1.bb b/meta/recipes-graphics/builder/builder_0.1.bb
index bb729fc..0a64c31 100644
--- a/meta/recipes-graphics/builder/builder_0.1.bb
+++ b/meta/recipes-graphics/builder/builder_0.1.bb
@@ -3,10 +3,9 @@ DESCRIPTION = "This recipe create a new user named ${PN}, who is used for specif
 SECTION = "x11"
 PR = "r6"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://builder_hob_start.sh;endline=5;md5=84796c3c41785d86100fdabcbdade00e"
+LIC_FILES_CHKSUM = "file://builder_session.sh;endline=5;md5=84796c3c41785d86100fdabcbdade00e"
 
-SRC_URI = "file://builder_hob_start.sh \
-           file://please_wait_dialog.py \
+SRC_URI = "file://builder_session.sh \
           "
 
 S = "${WORKDIR}"
@@ -25,9 +24,8 @@ USERADD_PARAM_${PN} = "--system --create-home \
 
 do_install () {
 	install -d -m 755 ${D}${sysconfdir}/mini_x/session.d
-	install -p -m 755 builder_hob_start.sh ${D}${sysconfdir}/mini_x/session.d/
+	install -p -m 755 builder_session.sh ${D}${sysconfdir}/mini_x/session.d/
 
-	chown  builder.builder ${D}${sysconfdir}/mini_x/session.d/builder_hob_start.sh
-        install -p -m 755 please_wait_dialog.py ${D}${sysconfdir}/mini_x
+	chown  builder.builder ${D}${sysconfdir}/mini_x/session.d/builder_session.sh
 }
 
diff --git a/meta/recipes-graphics/builder/files/builder_hob_start.sh b/meta/recipes-graphics/builder/files/builder_hob_start.sh
deleted file mode 100644
index b394b09..0000000
--- a/meta/recipes-graphics/builder/files/builder_hob_start.sh
+++ /dev/null
@@ -1,37 +0,0 @@
-#!/bin/sh
-#This script will be called via mini X session on behalf of file owner, after
-#installed in /etc/mini_x/session.d/. Any auto start jobs including X apps can
-#be put here
-
-# start hob here
-export PSEUDO_PREFIX=/usr
-export PSEUDO_LOCALSTATEDIR=/home/builder/pseudo
-export PSEUDO_LIBDIR=/usr/lib/pseudo/lib64
-export GIT_PROXY_COMMAND=/home/builder/poky/scripts/oe-git-proxy
-
-#start pcmanfm in daemon mode to allow asynchronous launch
-pcmanfm -d&
-
-#register handlers for some file types
-if [ ! -d /home/builder/.local/share/applications ]; then
-    mkdir -p /home/builder/.local/share/applications/
-    #register folders to open with PCManFM filemanager
-    xdg-mime default pcmanfm.desktop inode/directory
-
-    #register html links and files with epiphany
-    xdg-mime default epiphany.desktop x-scheme-handler/http
-    xdg-mime default epiphany.desktop x-scheme-handler/https
-    xdg-mime default epiphany.desktop text/html
-
-    #register text files with leafpad text editor
-    xdg-mime default leafpad.desktop text/plain
-fi
-
-cd /home/builder/poky
-. ./oe-init-build-env
-
-hob &
-
-matchbox-terminal&
-
-/etc/mini_x/please_wait_dialog.py &
diff --git a/meta/recipes-graphics/builder/files/builder_session.sh b/meta/recipes-graphics/builder/files/builder_session.sh
new file mode 100644
index 0000000..001a033
--- /dev/null
+++ b/meta/recipes-graphics/builder/files/builder_session.sh
@@ -0,0 +1,33 @@
+#!/bin/sh
+#This script will be called via mini X session on behalf of file owner, after
+#installed in /etc/mini_x/session.d/. Any auto start jobs including X apps can
+#be put here
+
+# start hob here
+export PSEUDO_PREFIX=/usr
+export PSEUDO_LOCALSTATEDIR=/home/builder/pseudo
+export PSEUDO_LIBDIR=/usr/lib/pseudo/lib64
+export GIT_PROXY_COMMAND=/home/builder/poky/scripts/oe-git-proxy
+
+#start pcmanfm in daemon mode to allow asynchronous launch
+pcmanfm -d&
+
+#register handlers for some file types
+if [ ! -d /home/builder/.local/share/applications ]; then
+    mkdir -p /home/builder/.local/share/applications/
+    #register folders to open with PCManFM filemanager
+    xdg-mime default pcmanfm.desktop inode/directory
+
+    #register html links and files with epiphany
+    xdg-mime default epiphany.desktop x-scheme-handler/http
+    xdg-mime default epiphany.desktop x-scheme-handler/https
+    xdg-mime default epiphany.desktop text/html
+
+    #register text files with leafpad text editor
+    xdg-mime default leafpad.desktop text/plain
+fi
+
+cd /home/builder/poky
+. ./oe-init-build-env
+
+matchbox-terminal&
diff --git a/meta/recipes-graphics/builder/files/please_wait_dialog.py b/meta/recipes-graphics/builder/files/please_wait_dialog.py
deleted file mode 100644
index fd2381b..0000000
--- a/meta/recipes-graphics/builder/files/please_wait_dialog.py
+++ /dev/null
@@ -1,28 +0,0 @@
-#!/usr/bin/env python
-import glib
-import gtk
- 
-def destroy_window_cb(widget, event):
-    gtk.main_quit()
- 
-def all_done_cb():
-    gtk.main_quit()
- 
-def dialogue_ui():
-    window = gtk.Window()
-    window.set_title("Please wait...")
-    window.connect("delete-event", destroy_window_cb)
-    window.show()
-    window.set_border_width(12)
- 
-    msg = "Please wait while BitBake initializes Hob"
-    label = gtk.Label(msg)
-    label.show()
-    window.add(label)
- 
-    glib.timeout_add_seconds(10, all_done_cb)
- 
-if __name__ == "__main__":
-    dialogue_ui()
-    gtk.main()
-
-- 
2.5.0


