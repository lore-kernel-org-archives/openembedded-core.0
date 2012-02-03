Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RtElz-0000tT-2k
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 09:45:35 +0100
Received: by mail-pz0-f47.google.com with SMTP id n34so83755dal.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Feb 2012 00:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=tDBNkl2Imd6CfHVWlhHEFgjY5AodTZeylAx0t/iFpHw=;
	b=vACpJDTpXZkqrVspSy3FYjLCOvrZEXjq0/+6x8j8C/HLh5iwOkZe4amK+TJwTVYPWt
	6VBf1Gmz6dymP4/MA3Mo72XiXOb0Yvx8WbGtiHXiHgMoeOv4OyS4V1HakxrJ1U6B4d+g
	ty6+cCpe3/yjOieC2XAYWQ0+afsk4gAV8sqPk=
Received: by 10.68.212.164 with SMTP id nl4mr16079331pbc.36.1328258256427;
	Fri, 03 Feb 2012 00:37:36 -0800 (PST)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id z5sm11478262pbc.5.2012.02.03.00.37.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Feb 2012 00:37:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Feb 2012 00:36:19 -0800
Message-Id: <031b5b645af89ef44353b7a627d4dc3ed6a1efcf.1328257913.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <a6d38499fa7010e3e96d9a36d9b88231d911a3c8.1328257913.git.raj.khem@gmail.com>
References: <a6d38499fa7010e3e96d9a36d9b88231d911a3c8.1328257913.git.raj.khem@gmail.com>
In-Reply-To: <cover.1328257913.git.raj.khem@gmail.com>
References: <cover.1328257913.git.raj.khem@gmail.com>
Subject: [PATCH 14/14] gconf, consolekit: Avoid polkit when compiling with uclibc
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
X-List-Received-Date: Fri, 03 Feb 2012 08:45:35 -0000

polkit uses netdb functionality from glibc which is not
available in uclibc therefore we avoid polkit when compiling
for uclibc systems.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-gnome/gnome/gconf_3.2.3.bb            |    9 +++++++--
 .../recipes-support/consolekit/consolekit_0.4.5.bb |   11 ++++++++---
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gconf_3.2.3.bb b/meta/recipes-gnome/gnome/gconf_3.2.3.bb
index 412f01c..a0b8d0c 100644
--- a/meta/recipes-gnome/gnome/gconf_3.2.3.bb
+++ b/meta/recipes-gnome/gnome/gconf_3.2.3.bb
@@ -3,10 +3,13 @@ SECTION = "x11/gnome"
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 
-DEPENDS = "glib-2.0 gtk+ dbus dbus-glib libxml2 intltool-native polkit"
+POLKIT = "polkit"
+POLKIT_libc-uclibc = ""
+
+DEPENDS = "glib-2.0 gtk+ dbus dbus-glib libxml2 intltool-native ${POLKIT}"
 DEPENDS_virtclass-native = "glib-2.0-native dbus-native dbus-glib-native libxml2-native intltool-native gnome-common-native"
 
-PR = "r5"
+PR = "r6"
 
 inherit gnomebase
 
@@ -21,6 +24,8 @@ S = "${WORKDIR}/GConf-${PV}"
 
 POLKIT_OECONF = "--enable-defaults-service"
 POLKIT_OECONF_virtclass-native = "--disable-defaults-service"
+POLKIT_OECONF_libc-uclibc = "--disable-default-service"
+
 GTKOECONF = "--with-gtk=2.0 --enable-gtk"
 GTKOECONF_virtclass-native = "--disable-gtk"
 EXTRA_OECONF = "--disable-gtk-doc --enable-shared --disable-static --enable-debug=yes \
diff --git a/meta/recipes-support/consolekit/consolekit_0.4.5.bb b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
index 45f6ad3..3ded6df 100644
--- a/meta/recipes-support/consolekit/consolekit_0.4.5.bb
+++ b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
@@ -2,13 +2,18 @@ DESCRIPTION = "ConsoleKit is a framework for defining and tracking users, login
 HOMEPAGE="http://www.freedesktop.org/wiki/Software/ConsoleKit"
 BUGTRACKER="https://bugs.freedesktop.org/buglist.cgi?query_format=specific&product=ConsoleKit"
 
-PR = "r7"
+PR = "r8"
 
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://src/main.c;endline=21;md5=0a994e09769780220163255d8f9071c3"
 
-DEPENDS = "glib-2.0 dbus polkit ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+POLKIT = "polkit"
+POLKIT_libc-uclibc = ""
+POLKITCONF = ""
+POLKITCONF_libc-uclibc = "--disable-policykit"
+
+DEPENDS = "glib-2.0 dbus ${POLKIT} ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += "base-files"
 
 inherit gnome
@@ -20,7 +25,7 @@ SRC_URI[sha256sum] = "43e0780c53078e125efcec3f847e484dc3533e49b408ce6a0ab1b22368
 
 S = "${WORKDIR}/ConsoleKit-${PV}"
 
-EXTRA_OECONF = "--with-systemdsystemunitdir=${base_libdir}/systemd/system/ \
+EXTRA_OECONF = "${POLKITCONF} --with-systemdsystemunitdir=${base_libdir}/systemd/system/ \
                 ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam-module --with-pam-module-dir=${base_libdir}/security', '--disable-pam-module', d)} \
                "
 
-- 
1.7.5.4



