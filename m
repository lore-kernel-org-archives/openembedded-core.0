Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SAnc9-0004sQ-1d
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 20:24:01 +0100
Received: by wgbdr12 with SMTP id dr12so1429656wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 12:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=Tz9axCzRzEwj5JlvHuhiep0Ic62Tb471ZSrqsMKarIA=;
	b=q1Vbxg1rgQhBg4yIJ4iTUI6gBDpeyy4J/c8TkWJNCxV5LgkJLDmb9XdL3RIJ1W7hOk
	76K1ev8/CBOZ1IY+MAAPcTgRM0Vq3r5vF91wXRbaufM1Jz/v6z2JfINBZtXCwX/AGLlx
	lnEj0vUWhi8yfJcpt/nbXNyJf+QOsXx05wxVv/MxTJZEYBoE+9eqnvJDDwyyGe1hsAAc
	hvZqmJKkiV4LH9gtJ40uerRxiiOtTtWwKOmDxNVxSzcoHGy6SFWezrTTgJIArb6s/66b
	OFdlL9Y6Zfb40EEGRSttv+2NVy5VlrpQMtAIwjI3Y+VMSz7713vDOwjpKYriUtzjYUU/
	WfSQ==
Received: by 10.216.133.139 with SMTP id q11mr5315278wei.44.1332443705485;
	Thu, 22 Mar 2012 12:15:05 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-83.unitymediagroup.de.
	[95.222.156.83])
	by mx.google.com with ESMTPS id ff2sm12254757wib.9.2012.03.22.12.15.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Mar 2012 12:15:04 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Mar 2012 20:15:01 +0100
Message-Id: <1332443701-24282-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [PATCH] gtk-icon-cache.bbclass: Fix multiple rebuilds of the icon cache on first boot
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
X-List-Received-Date: Thu, 22 Mar 2012 19:24:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Before this patch every inheritance of this class rebuilt the full icon cache at the first boot.
* With this patch the icon cache will only be build once at the first boot and on pkg installations that require it.
* This patch reduces the time needed for the first boot from 96 minutes to 5 minutes on the test machine.
* Build-tested incremental (BB_SIGNATURE_HANDLER = "OEBasicHash") & from scratch
* Run-tested with systemd and opkg

Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/classes/gtk-icon-cache.bbclass                |   19 +++++++++-------
 .../gtk+/gtk-update-icon-cache-runonce.bb          |   23 ++++++++++++++++++++
 .../gtk-update-icon-cache-runonce.in               |   16 +++++++++++++
 3 files changed, 50 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-gnome/gtk+/gtk-update-icon-cache-runonce.bb
 create mode 100644 meta/recipes-gnome/gtk+/gtk-update-icon-cache-runonce/gtk-update-icon-cache-runonce.in

diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
index 60e3401..b48aabe 100644
--- a/meta/classes/gtk-icon-cache.bbclass
+++ b/meta/classes/gtk-icon-cache.bbclass
@@ -9,14 +9,16 @@ if [ "x$D" != "x" ]; then
         exit 1
 fi
 
-# Update the pixbuf loaders in case they haven't been registered yet
-GDK_PIXBUF_MODULEDIR=${libdir}/gdk-pixbuf-2.0/2.10.0/loaders gdk-pixbuf-query-loaders --update-cache
-
-for icondir in /usr/share/icons/* ; do
-    if [ -d $icondir ] ; then
-        gtk-update-icon-cache -fqt  $icondir
-    fi
-done
+# do not execute in case a final run-once is waiting
+if [ ! -e ${sysconfdir}/init.d/gtk-update-icon-cache-runonce ]; then
+    # Update the pixbuf loaders in case they haven't been registered yet
+    GDK_PIXBUF_MODULEDIR=${libdir}/gdk-pixbuf-2.0/2.10.0/loaders gdk-pixbuf-query-loaders --update-cache
+    for icondir in /usr/share/icons/* ; do
+        if [ -d $icondir ] ; then
+            gtk-update-icon-cache -fqt  $icondir
+        fi
+    done
+fi
 }
 
 gtk_icon_cache_postrm() {
@@ -56,3 +58,4 @@ python populate_packages_append () {
 		d.setVar('pkg_postrm_%s' % pkg, postrm)
 }
 
+RDEPENDS += "gtk-update-icon-cache-runonce"
diff --git a/meta/recipes-gnome/gtk+/gtk-update-icon-cache-runonce.bb b/meta/recipes-gnome/gtk+/gtk-update-icon-cache-runonce.bb
new file mode 100644
index 0000000..55bec67
--- /dev/null
+++ b/meta/recipes-gnome/gtk+/gtk-update-icon-cache-runonce.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "Init script calling gtk-update-icon-cache once"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+
+SRC_URI = "file://gtk-update-icon-cache-runonce.in"
+
+INIT_SEQ_NUM = "99"
+
+inherit update-rc.d
+
+do_install() {
+	install -d ${D}${sysconfdir}/init.d
+	sed -e 's,@libdir@,${libdir},g' \
+            -e 's,@datadir@,${datadir},g' \
+            -e 's,@sysconfdir@,${sysconfdir},g' \
+            -e 's,@INIT_SEQ_NUM@,${INIT_SEQ_NUM},g' \
+             < ${WORKDIR}/gtk-update-icon-cache-runonce.in \
+             > ${D}${sysconfdir}/init.d/gtk-update-icon-cache-runonce
+	chmod 755 ${D}${sysconfdir}/init.d/gtk-update-icon-cache-runonce
+}
+
+INITSCRIPT_NAME = "gtk-update-icon-cache-runonce"
+INITSCRIPT_PARAMS = "start ${INIT_SEQ_NUM} S ."
diff --git a/meta/recipes-gnome/gtk+/gtk-update-icon-cache-runonce/gtk-update-icon-cache-runonce.in b/meta/recipes-gnome/gtk+/gtk-update-icon-cache-runonce/gtk-update-icon-cache-runonce.in
new file mode 100644
index 0000000..8952e1a
--- /dev/null
+++ b/meta/recipes-gnome/gtk+/gtk-update-icon-cache-runonce/gtk-update-icon-cache-runonce.in
@@ -0,0 +1,16 @@
+#!/bin/sh
+
+echo 'Updating the GTK icon cache...'
+
+# Update the pixbuf loaders in case they haven't been registered yet
+GDK_PIXBUF_MODULEDIR=@libdir@/gdk-pixbuf-2.0/2.10.0/loaders gdk-pixbuf-query-loaders --update-cache
+
+for icondir in @datadir@/icons/* ; do
+    if [ -d $icondir ] ; then
+        gtk-update-icon-cache -fqt $icondir
+    fi
+done
+
+# This script should only run once at the first boot of the machine
+rm -f @sysconfdir@/rcS.d/S@INIT_SEQ_NUM@gtk-update-icon-cache-runonce
+rm -f @sysconfdir@/init.d/gtk-update-icon-cache-runonce
-- 
1.7.6.5



