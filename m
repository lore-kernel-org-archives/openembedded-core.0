Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QskDR-0005Pm-SH
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 01:35:38 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 Aug 2011 16:30:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="38387547"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.242])
	by orsmga001.jf.intel.com with ESMTP; 14 Aug 2011 16:30:51 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 14 Aug 2011 16:30:45 -0700
Message-Id: <880259fc6657f602012032a4a8682c56db251ceb.1313363644.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313363644.git.sgw@linux.intel.com>
References: <cover.1313363644.git.sgw@linux.intel.com>
In-Reply-To: <cover.1313363644.git.sgw@linux.intel.com>
References: <cover.1313363644.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 11/12] dbus: only use x11 if DISTRO_FEATURES has selected it
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
X-List-Received-Date: Sun, 14 Aug 2011 23:35:38 -0000

From: Phil Blundell <philb@gnu.org>

This makes it possible to include dbus in a non-X11-equipped DISTRO.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-core/dbus/dbus.inc |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 6b76cba..a8ecda8 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -5,7 +5,8 @@ SECTION = "base"
 LICENSE = "AFL-2 | GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
                     file://dbus/dbus.h;firstline=6;endline=20;md5=6eea2e0c7750dd8e620dcb1437312fa5"
-DEPENDS = "expat virtual/libintl virtual/libx11 libsm"
+X11DEPENDS = "virtual/libx11 libsm"
+DEPENDS = "expat virtual/libintl ${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
 DEPENDS_virtclass-native = "expat-native virtual/libintl-native"
 DEPENDS_virtclass-nativesdk = "expat-nativesdk virtual/libintl-nativesdk virtual/libx11"
 
@@ -22,7 +23,7 @@ CONFFILES_${PN} = "${sysconfdir}/dbus-1/system.conf ${sysconfdir}/dbus-1/session
 
 DEBIANNAME_${PN} = "dbus-1"
 
-PACKAGES =+ "${PN}-lib ${PN}-x11 ${PN}-systemd"
+PACKAGES =+ "${PN}-lib ${PN}-systemd ${@base_contains('DISTRO_FEATURES', 'x11', '${PN}-x11', '', d)}"
 
 FILES_${PN}-x11 = "${bindir}/dbus-launch"
 RDEPENDS_${PN}-x11 = "${PN}"
@@ -73,7 +74,7 @@ pkg_postinst_dbus() {
 	fi
 }
 
-EXTRA_OECONF_X = "--with-x"
+EXTRA_OECONF_X = "${@base_contains('DISTRO_FEATURES', 'x11', '--with-x', '--without-x', d)}"
 EXTRA_OECONF_X_virtclass-native = "--without-x"
 
 EXTRA_OECONF = "--disable-tests \
-- 
1.7.6



