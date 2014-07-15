Return-Path: <valentin.popa@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 71A2E7028C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 08:01:41 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Jul 2014 01:01:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,663,1400050800"; d="scan'208";a="569954742"
Received: from vpopa-desktop.rb.intel.com ([10.237.105.85])
	by fmsmga002.fm.intel.com with ESMTP; 15 Jul 2014 01:01:25 -0700
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jul 2014 11:00:45 +0300
Message-Id: <1405411250-10594-2-git-send-email-valentin.popa@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1405411250-10594-1-git-send-email-valentin.popa@intel.com>
References: <1405411250-10594-1-git-send-email-valentin.popa@intel.com>
Subject: [PATCH 2/9] user-session-units: added to oe-core
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
X-List-Received-Date: Tue, 15 Jul 2014 08:01:49 -0000

systemd needs this to launch user sessions.

Signed-off-by: Valentin Popa <valentin.popa@intel.com>
---
 ...temd-login-lib-was-merged-into-libsystemd.patch | 26 ++++++++++++++++++++++
 .../user-session-units/user-session-units_9.bb     | 25 +++++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-support/user-session-units/user-session-units/0001-systemd-login-lib-was-merged-into-libsystemd.patch
 create mode 100644 meta/recipes-support/user-session-units/user-session-units_9.bb

diff --git a/meta/recipes-support/user-session-units/user-session-units/0001-systemd-login-lib-was-merged-into-libsystemd.patch b/meta/recipes-support/user-session-units/user-session-units/0001-systemd-login-lib-was-merged-into-libsystemd.patch
new file mode 100644
index 0000000..9284eb2
--- /dev/null
+++ b/meta/recipes-support/user-session-units/user-session-units/0001-systemd-login-lib-was-merged-into-libsystemd.patch
@@ -0,0 +1,26 @@
+From f80245dbdc5b29fe8dbe9b39482d41fbca044fe6 Mon Sep 17 00:00:00 2001
+From: Valentin Popa <valentin.popa@intel.com>
+Date: Mon, 26 May 2014 10:04:13 +0300
+Subject: [PATCH] systemd-login lib was merged into libsystemd
+
+Signed-off-by: Valentin Popa <valentin.popa@intel.com>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index a2f960c..7186b10 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -21,7 +21,7 @@ user_session_launch_SOURCES = \
+ 
+ # FIXME: add pkgconfig checks for these instead
+ user_session_launch_LDADD = \
+-	-lsystemd-login \
++	-lsystemd \
+ 	-lpam \
+ 	-lpam_misc
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-support/user-session-units/user-session-units_9.bb b/meta/recipes-support/user-session-units/user-session-units_9.bb
new file mode 100644
index 0000000..ad2f683
--- /dev/null
+++ b/meta/recipes-support/user-session-units/user-session-units_9.bb
@@ -0,0 +1,25 @@
+SUMMARY = "systemd units to start a user session"
+
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+SRC_URI = "http://foo-projects.org/~sofar/${BPN}/${BPN}-${PV}.tar.gz \
+           file://0001-systemd-login-lib-was-merged-into-libsystemd.patch "
+
+SRC_URI[md5sum] = "30d26fec6e3e221072c59554c93ecde0"
+SRC_URI[sha256sum] = "edfc0df890981708e1a09e8488bb91384b6739d76867d3fe2417b03265361717"
+
+DEPENDS = "systemd dbus libpam"
+
+inherit autotools pkgconfig
+
+# Seed configure so it doesn't look on the host host for gnome/xfce/etc.
+EXTRA_OECONF = "ac_cv_prog_E_PROG= \
+ ac_cv_prog_XFCE_PROG= \
+ ac_cv_prog_XFWM_PROG= \
+ ac_cv_prog_XBMC_PROG= \
+ ac_cv_prog_GNOME_PROG= \
+ ac_cv_prog_KDE_PROG= \
+ ac_cv_prog_MYTH_PROG="
+
+FILES_${PN} = "${systemd_unitdir}/ ${libdir}/systemd/user/ ${bindir}/"
-- 
1.9.1


