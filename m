Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QaPAI-0003Ti-Us
	for openembedded-core@lists.openembedded.org;
	Sat, 25 Jun 2011 11:28:35 +0200
Received: by mail-wy0-f175.google.com with SMTP id 30so354922wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jun 2011 02:24:59 -0700 (PDT)
Received: by 10.227.206.133 with SMTP id fu5mr3800223wbb.31.1308993898348;
	Sat, 25 Jun 2011 02:24:58 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id ex2sm2585434wbb.65.2011.06.25.02.24.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 25 Jun 2011 02:24:57 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sat, 25 Jun 2011 11:24:45 +0200
Message-Id: <1308993885-14753-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <1308993885-14753-1-git-send-email-koen@dominion.thruhere.net>
References: <1308993885-14753-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 2/2] consolekit 0.4.5: remove patch that forcibly disables consolekit
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
X-List-Received-Date: Sat, 25 Jun 2011 09:28:35 -0000

Polkit support is actually needed for consolekit to function properly, without you get things like:

	** (gnome-panel:547): WARNING **: Could not ask session manager if shut down is available: Timeout was reached

Various applications will timeout and less well written ones will crash (e.g. the clock applet).

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../recipes-support/consolekit/consolekit_0.4.5.bb |    7 +++----
 .../consolekit/files/nopolkit.patch                |   18 ------------------
 2 files changed, 3 insertions(+), 22 deletions(-)
 delete mode 100644 meta/recipes-support/consolekit/files/nopolkit.patch

diff --git a/meta/recipes-support/consolekit/consolekit_0.4.5.bb b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
index 2b85455..c934d0f 100644
--- a/meta/recipes-support/consolekit/consolekit_0.4.5.bb
+++ b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
@@ -2,18 +2,17 @@ DESCRIPTION = "ConsoleKit is a framework for defining and tracking users, login
 HOMEPAGE="http://www.freedesktop.org/wiki/Software/ConsoleKit"
 BUGTRACKER="https://bugs.freedesktop.org/buglist.cgi?query_format=specific&product=ConsoleKit"
 
-PR = "r2"
+PR = "r3"
 
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://src/main.c;endline=21;md5=0a994e09769780220163255d8f9071c3"
 
-DEPENDS = "dbus ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+DEPENDS = "dbus polkit ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 inherit gnome
 
-SRC_URI = "http://www.freedesktop.org/software/ConsoleKit/dist/ConsoleKit-${PV}.tar.bz2 \
-           file://nopolkit.patch"
+SRC_URI = "http://www.freedesktop.org/software/ConsoleKit/dist/ConsoleKit-${PV}.tar.bz2"
 SRC_URI[md5sum] = "f2657f93761206922d558471a936fbc3"
 SRC_URI[sha256sum] = "43e0780c53078e125efcec3f847e484dc3533e49b408ce6a0ab1b223686b9c38"
 
diff --git a/meta/recipes-support/consolekit/files/nopolkit.patch b/meta/recipes-support/consolekit/files/nopolkit.patch
deleted file mode 100644
index a0d9d06..0000000
--- a/meta/recipes-support/consolekit/files/nopolkit.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Index: ConsoleKit-0.4.3/configure.ac
-===================================================================
---- ConsoleKit-0.4.3.orig/configure.ac	2010-10-26 22:34:03.000000000 +0800
-+++ ConsoleKit-0.4.3/configure.ac	2010-11-28 15:28:26.000000000 +0800
-@@ -55,10 +55,7 @@
-   gthread-2.0 >= $GLIB_REQUIRED_VERSION
- )
- 
--PKG_CHECK_MODULES(POLKIT,
--  polkit-gobject-1 >= $POLKIT_REQUIRED_VERSION,
--  have_polkit=yes,
--  have_polkit=no)
-+have_polkit=no
- if test "x$have_polkit" = "xyes" ; then
-        AC_DEFINE(HAVE_POLKIT, [], [Define if we have polkit])
- fi
-- 
1.6.6.1



