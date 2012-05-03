Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SPlPs-0006eX-Be
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 04:05:12 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 02 May 2012 18:55:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="136400484"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.179])
	by orsmga001.jf.intel.com with ESMTP; 02 May 2012 18:55:25 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 May 2012 18:55:25 -0700
Message-Id: <1336010125-16381-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH] builder: Add Please Wait Dialog Box [1.3/1.2.1]
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 May 2012 02:05:12 -0000

Add dialog box while bitbake starts hob to inform user
to please wait for the hob screen to become visible.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-graphics/builder/builder_0.1.bb       |    7 +++-
 .../builder/files/builder_hob_start.sh             |    2 +
 .../builder/files/please_wait_dialog.py            |   28 ++++++++++++++++++++
 3 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/builder/files/please_wait_dialog.py

diff --git a/meta/recipes-graphics/builder/builder_0.1.bb b/meta/recipes-graphics/builder/builder_0.1.bb
index af6ba51..cb5f440 100644
--- a/meta/recipes-graphics/builder/builder_0.1.bb
+++ b/meta/recipes-graphics/builder/builder_0.1.bb
@@ -1,11 +1,13 @@
 SUMMARY = "New user to do specific job"
 DESCRIPTION = "This recipe create a new user named ${PN}, who is used for specific jobs like building. The task can be auto started via mini X"
 SECTION = "x11"
-PR = "r2"
+PR = "r3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://builder_hob_start.sh;endline=5;md5=84796c3c41785d86100fdabcbdade00e"
 
-SRC_URI = "file://builder_hob_start.sh"
+SRC_URI = "file://builder_hob_start.sh \
+           file://please_wait_dialog.py \
+          "
 
 S = "${WORKDIR}"
 
@@ -23,5 +25,6 @@ do_install () {
 	install -p -m 755 builder_hob_start.sh ${D}/etc/mini_x/session.d/
 
 	chown  ${PN}.${PN} ${D}/etc/mini_x/session.d/builder_hob_start.sh
+        install -p -m 755 please_wait_dialog.py ${D}/etc/mini_x
 }
 
diff --git a/meta/recipes-graphics/builder/files/builder_hob_start.sh b/meta/recipes-graphics/builder/files/builder_hob_start.sh
index 98b2adb..883535b 100644
--- a/meta/recipes-graphics/builder/files/builder_hob_start.sh
+++ b/meta/recipes-graphics/builder/files/builder_hob_start.sh
@@ -18,3 +18,5 @@ sed -i 's/^#PARALLEL_MAKE =/PARALLEL_MAKE =/g' conf/local.conf
 hob &
 
 matchbox-terminal&
+
+/etc/mini_x/please_wait_dialog.py &
diff --git a/meta/recipes-graphics/builder/files/please_wait_dialog.py b/meta/recipes-graphics/builder/files/please_wait_dialog.py
new file mode 100644
index 0000000..fd2381b
--- /dev/null
+++ b/meta/recipes-graphics/builder/files/please_wait_dialog.py
@@ -0,0 +1,28 @@
+#!/usr/bin/env python
+import glib
+import gtk
+ 
+def destroy_window_cb(widget, event):
+    gtk.main_quit()
+ 
+def all_done_cb():
+    gtk.main_quit()
+ 
+def dialogue_ui():
+    window = gtk.Window()
+    window.set_title("Please wait...")
+    window.connect("delete-event", destroy_window_cb)
+    window.show()
+    window.set_border_width(12)
+ 
+    msg = "Please wait while BitBake initializes Hob"
+    label = gtk.Label(msg)
+    label.show()
+    window.add(label)
+ 
+    glib.timeout_add_seconds(10, all_done_cb)
+ 
+if __name__ == "__main__":
+    dialogue_ui()
+    gtk.main()
+
-- 
1.7.7.6



