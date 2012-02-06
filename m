Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RuIOt-0004D6-Vs
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 07:50:08 +0100
Received: by mail-pz0-f47.google.com with SMTP id n34so1809173dal.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Feb 2012 22:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=tDBNkl2Imd6CfHVWlhHEFgjY5AodTZeylAx0t/iFpHw=;
	b=jvHdYH6r7aJgIW8fGBBfTm552eJ6YncMiWw06KlH5U2bF5J42WSYSJ++xTjTU+CX4D
	y1x90H12OU1Fhzn5ptxyY3annm6wMpSTRhpJ4TqPZURW8usMMJdd0Dwon0KP9lKtw8Ey
	R2XPaariLoNPameo/0mNahIohxiilUEHEBJBg=
Received: by 10.68.222.194 with SMTP id qo2mr45070563pbc.20.1328510528919;
	Sun, 05 Feb 2012 22:42:08 -0800 (PST)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168]) by mx.google.com with ESMTPS id
	li19sm37030710pbb.17.2012.02.05.22.42.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Feb 2012 22:42:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 Feb 2012 22:40:40 -0800
Message-Id: <e3a71d4e08c4f40a7e0ff40769c46590c8d3581e.1328510189.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <04705556464a6e41642962da40f0e17847ee3483.1328510188.git.raj.khem@gmail.com>
References: <04705556464a6e41642962da40f0e17847ee3483.1328510188.git.raj.khem@gmail.com>
In-Reply-To: <cover.1328510187.git.raj.khem@gmail.com>
References: <cover.1328510187.git.raj.khem@gmail.com>
Subject: [PATCH 14/20] gconf, consolekit: Avoid polkit when compiling with uclibc
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
X-List-Received-Date: Mon, 06 Feb 2012 06:50:12 -0000

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



