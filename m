Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QlyuW-00028l-LS
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 09:52:09 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 27 Jul 2011 00:47:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,275,1309762800"; d="scan'208";a="31949333"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.61])
	by azsmga001.ch.intel.com with ESMTP; 27 Jul 2011 00:47:32 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2011 00:47:08 -0700
Message-Id: <a86073e72f19b972187491495f192bebc66e1744.1311752531.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311752531.git.sgw@linux.intel.com>
References: <cover.1311752531.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311752531.git.sgw@linux.intel.com>
References: <cover.1311752531.git.sgw@linux.intel.com>
Subject: [Consolidated & Tested 18/35] shadow: update pam related configure files
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
X-List-Received-Date: Wed, 27 Jul 2011 07:52:09 -0000

From: Kang Kai <kai.kang@windriver.com>

add shadow-update-pam-conf.patch to update the pam related configure files
in oe way rather than Fedora.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../shadow/files/shadow-update-pam-conf.patch      |   91 ++++++++++++++++++++
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |    5 +-
 2 files changed, 94 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch

diff --git a/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch b/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
new file mode 100644
index 0000000..15f8044
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
@@ -0,0 +1,91 @@
+The system-auth in the configure files is from Fedora which put all the 4 pam type rules
+in one file.
+In yocto it obey the way with Debian/Ubuntu, and the names are common-auth, common-account,
+common-password and common-session.
+So update them with oe way.
+
+Upstream-Status: Pending
+
+Signed-off-by: Kang Kai <kai.kang@windriver.com>
+
+diff -Nur shadow-4.1.4.3/etc/pam.d.orig/chage shadow-4.1.4.3/etc/pam.d/chage
+--- shadow-4.1.4.3/etc/pam.d.orig/chage	2011-07-20 19:02:27.384844958 +0800
++++ shadow-4.1.4.3/etc/pam.d/chage	2011-07-20 19:03:08.964844958 +0800
+@@ -1,4 +1,4 @@
+ #%PAM-1.0
+ auth		sufficient	pam_rootok.so
+ account		required	pam_permit.so
+-password	include		system-auth
++password	include		common-password
+diff -Nur shadow-4.1.4.3/etc/pam.d.orig/chgpasswd shadow-4.1.4.3/etc/pam.d/chgpasswd
+--- shadow-4.1.4.3/etc/pam.d.orig/chgpasswd	2011-07-20 19:02:27.384844958 +0800
++++ shadow-4.1.4.3/etc/pam.d/chgpasswd	2011-07-20 19:03:26.544844958 +0800
+@@ -1,4 +1,4 @@
+ #%PAM-1.0
+ auth		sufficient	pam_rootok.so
+ account		required	pam_permit.so
+-password	include		system-auth
++password	include		common-password
+diff -Nur shadow-4.1.4.3/etc/pam.d.orig/groupadd shadow-4.1.4.3/etc/pam.d/groupadd
+--- shadow-4.1.4.3/etc/pam.d.orig/groupadd	2011-07-20 19:02:27.384844958 +0800
++++ shadow-4.1.4.3/etc/pam.d/groupadd	2011-07-20 19:04:08.124844958 +0800
+@@ -1,4 +1,4 @@
+ #%PAM-1.0
+ auth		sufficient	pam_rootok.so
+ account		required	pam_permit.so
+-password	include		system-auth
++password	include		common-password
+diff -Nur shadow-4.1.4.3/etc/pam.d.orig/groupdel shadow-4.1.4.3/etc/pam.d/groupdel
+--- shadow-4.1.4.3/etc/pam.d.orig/groupdel	2011-07-20 19:02:27.384844958 +0800
++++ shadow-4.1.4.3/etc/pam.d/groupdel	2011-07-20 19:04:26.114844958 +0800
+@@ -1,4 +1,4 @@
+ #%PAM-1.0
+ auth		sufficient	pam_rootok.so
+ account		required	pam_permit.so
+-password	include		system-auth
++password	include		common-password
+diff -Nur shadow-4.1.4.3/etc/pam.d.orig/groupmems shadow-4.1.4.3/etc/pam.d/groupmems
+--- shadow-4.1.4.3/etc/pam.d.orig/groupmems	2011-07-20 19:02:27.384844958 +0800
++++ shadow-4.1.4.3/etc/pam.d/groupmems	2011-07-20 19:04:35.074844958 +0800
+@@ -1,4 +1,4 @@
+ #%PAM-1.0
+ auth		sufficient	pam_rootok.so
+ account		required	pam_permit.so
+-password	include		system-auth
++password	include		common-password
+diff -Nur shadow-4.1.4.3/etc/pam.d.orig/groupmod shadow-4.1.4.3/etc/pam.d/groupmod
+--- shadow-4.1.4.3/etc/pam.d.orig/groupmod	2011-07-20 19:02:27.384844958 +0800
++++ shadow-4.1.4.3/etc/pam.d/groupmod	2011-07-20 19:04:44.864844958 +0800
+@@ -1,4 +1,4 @@
+ #%PAM-1.0
+ auth		sufficient	pam_rootok.so
+ account		required	pam_permit.so
+-password	include		system-auth
++password	include		common-password
+diff -Nur shadow-4.1.4.3/etc/pam.d.orig/useradd shadow-4.1.4.3/etc/pam.d/useradd
+--- shadow-4.1.4.3/etc/pam.d.orig/useradd	2011-07-20 19:02:27.384844958 +0800
++++ shadow-4.1.4.3/etc/pam.d/useradd	2011-07-20 19:07:26.244844958 +0800
+@@ -1,4 +1,4 @@
+ #%PAM-1.0
+ auth		sufficient	pam_rootok.so
+ account		required	pam_permit.so
+-password	include		system-auth
++password	include		common-password
+diff -Nur shadow-4.1.4.3/etc/pam.d.orig/userdel shadow-4.1.4.3/etc/pam.d/userdel
+--- shadow-4.1.4.3/etc/pam.d.orig/userdel	2011-07-20 19:02:27.384844958 +0800
++++ shadow-4.1.4.3/etc/pam.d/userdel	2011-07-20 19:07:35.734844958 +0800
+@@ -1,4 +1,4 @@
+ #%PAM-1.0
+ auth		sufficient	pam_rootok.so
+ account		required	pam_permit.so
+-password	include		system-auth
++password	include		common-password
+diff -Nur shadow-4.1.4.3/etc/pam.d.orig/usermod shadow-4.1.4.3/etc/pam.d/usermod
+--- shadow-4.1.4.3/etc/pam.d.orig/usermod	2011-07-20 19:02:27.384844958 +0800
++++ shadow-4.1.4.3/etc/pam.d/usermod	2011-07-20 19:07:42.024844958 +0800
+@@ -1,4 +1,4 @@
+ #%PAM-1.0
+ auth		sufficient	pam_rootok.so
+ account		required	pam_permit.so
+-password	include		system-auth
++password	include		common-password
diff --git a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
index 5731a26..70d4cbb 100644
--- a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
+++ b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=08c553a87d4e51bbed50b20e0adcaede \
 
 DEPENDS = "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} = "${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_PLUGINS}', '', d)}"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "ftp://pkg-shadow.alioth.debian.org/pub/pkg-shadow/shadow-${PV}.tar.bz2 \
            file://login_defs_pam.sed \
@@ -19,7 +19,8 @@ SRC_URI = "ftp://pkg-shadow.alioth.debian.org/pub/pkg-shadow/shadow-${PV}.tar.bz
            file://shadow-4.1.3-dots-in-usernames.patch \
            file://shadow-4.1.4.2-env-reset-keep-locale.patch \
            file://shadow-4.1.4.2-groupmod-pam-check.patch \
-           file://shadow-4.1.4.2-su_no_sanitize_env.patch"
+           file://shadow-4.1.4.2-su_no_sanitize_env.patch \
+           file://shadow-update-pam-conf.patch"
 
 SRC_URI[md5sum] = "b8608d8294ac88974f27b20f991c0e79"
 SRC_URI[sha256sum] = "633f5bb4ea0c88c55f3642c97f9d25cbef74f82e0b4cf8d54e7ad6f9f9caa778"
-- 
1.7.3.4



