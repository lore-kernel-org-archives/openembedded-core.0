Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1QjoFb-0002HN-6l
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 10:04:55 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6L80ldH017556
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 Jul 2011 01:00:47 -0700 (PDT)
Received: from localhost (128.224.162.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 21 Jul 2011 01:00:46 -0700
Message-ID: <9405a37200fcbc535469cc97f091bfb873944919.1311234759.git.kai.kang@windriver.com>
In-Reply-To: <cover.1311234759.git.kai.kang@windriver.com>
References: <cover.1311234759.git.kai.kang@windriver.com>
Old-Date: Wed, 20 Jul 2011 19:18:14 +0800
Date: Thu, 21 Jul 2011 16:00:53 +0800
To: <scott.a.garman@intel.com>
From: Kang Kai <kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.154]
Cc: Wenzong, openembedded-core@lists.openembedded.org
Subject: [PATCH 09/10] shadow: update pam related configure files
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
X-List-Received-Date: Thu, 21 Jul 2011 08:04:55 -0000
Content-Type: text/plain

From: Kang Kai <kai.kang@windriver.com>

add shadow-update-pam-conf.patch to update the pam related configure files
in Yocto way rather than Fedora.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../shadow/files/shadow-update-pam-conf.patch      |  175 ++++++++++++++++++++
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |    5 +-
 2 files changed, 178 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch

diff --git a/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch b/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
new file mode 100644
index 0000000..33789f5
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
@@ -0,0 +1,175 @@
+The system-auth in the configure files is from Fedora which put all the 4 pam type rules
+in one file. 
+In yocto it obey the way with Debian/Ubuntu, and the names are common-auth, common-account,
+common-password and common-session.
+So update them in Yocto way.
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
+diff -Nur shadow-4.1.4.3/etc/pam.d.orig/chfn shadow-4.1.4.3/etc/pam.d/chfn
+--- shadow-4.1.4.3/etc/pam.d.orig/chfn	2011-07-20 19:02:27.384844958 +0800
++++ shadow-4.1.4.3/etc/pam.d/chfn	2011-07-20 19:03:17.804844958 +0800
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
+diff -Nur shadow-4.1.4.3/etc/pam.d.orig/chpasswd shadow-4.1.4.3/etc/pam.d/chpasswd
+--- shadow-4.1.4.3/etc/pam.d.orig/chpasswd	2011-07-20 19:02:27.384844958 +0800
++++ shadow-4.1.4.3/etc/pam.d/chpasswd	2011-07-20 19:03:42.724844958 +0800
+@@ -1,4 +1,4 @@
+ #%PAM-1.0
+ auth		sufficient	pam_rootok.so
+ account		required	pam_permit.so
+-password	include		system-auth
++password	include		common-password
+diff -Nur shadow-4.1.4.3/etc/pam.d.orig/chsh shadow-4.1.4.3/etc/pam.d/chsh
+--- shadow-4.1.4.3/etc/pam.d.orig/chsh	2011-07-20 19:02:27.384844958 +0800
++++ shadow-4.1.4.3/etc/pam.d/chsh	2011-07-20 19:03:51.524844958 +0800
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
+diff -Nur shadow-4.1.4.3/etc/pam.d.orig/login shadow-4.1.4.3/etc/pam.d/login
+--- shadow-4.1.4.3/etc/pam.d.orig/login	2011-07-20 19:02:27.384844958 +0800
++++ shadow-4.1.4.3/etc/pam.d/login	2011-07-20 19:05:36.924844958 +0800
+@@ -1,11 +1,11 @@
+ #%PAM-1.0
+ auth		required	pam_securetty.so
+-auth		include		system-auth
++auth		include		common-auth
+ account		required	pam_nologin.so
+-account		include		system-auth
+-password	include		system-auth
++account		include		common-account
++password	include		common-password
+ session		required	pam_selinux.so close
+-session		include		system-auth
++session		include		common-session
+ session		required	pam_loginuid.so
+ session		optional	pam_console.so
+ session		required	pam_selinux.so open
+diff -Nur shadow-4.1.4.3/etc/pam.d.orig/newusers shadow-4.1.4.3/etc/pam.d/newusers
+--- shadow-4.1.4.3/etc/pam.d.orig/newusers	2011-07-20 19:02:27.384844958 +0800
++++ shadow-4.1.4.3/etc/pam.d/newusers	2011-07-20 19:05:49.344844958 +0800
+@@ -1,4 +1,4 @@
+ #%PAM-1.0
+ auth		sufficient	pam_rootok.so
+ account		required	pam_permit.so
+-password	include		system-auth
++password	include		common-password
+diff -Nur shadow-4.1.4.3/etc/pam.d.orig/passwd shadow-4.1.4.3/etc/pam.d/passwd
+--- shadow-4.1.4.3/etc/pam.d.orig/passwd	2011-07-20 19:02:27.384844958 +0800
++++ shadow-4.1.4.3/etc/pam.d/passwd	2011-07-20 19:06:29.014844958 +0800
+@@ -1,4 +1,4 @@
+ #%PAM-1.0
+-auth		include		system-auth
+-account		include		system-auth
+-password	include		system-auth
++auth		include		common-auth
++account		include		common-account
++password	include		common-password
+diff -Nur shadow-4.1.4.3/etc/pam.d.orig/su shadow-4.1.4.3/etc/pam.d/su
+--- shadow-4.1.4.3/etc/pam.d.orig/su	2011-07-20 19:02:27.384844958 +0800
++++ shadow-4.1.4.3/etc/pam.d/su	2011-07-20 19:07:07.584844958 +0800
+@@ -4,10 +4,10 @@
+ #auth		sufficient	pam_wheel.so trust use_uid
+ # Uncomment the following line to require a user to be in the "wheel" group.
+ auth		required	pam_wheel.so use_uid
+-auth		include		system-auth
+-account		include		system-auth
+-password	include		system-auth
++auth		include		common-auth
++account		include		common-account
++password	include		common-password
+ session		required	pam_selinux.so close
+-session		include		system-auth
++session		include		common-session
+ session		required	pam_selinux.so open multiple
+ session		optional	pam_xauth.so
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
index 5731a26..0e6ba871 100644
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
+		   file://shadow-update-pam-conf.patch"
 
 SRC_URI[md5sum] = "b8608d8294ac88974f27b20f991c0e79"
 SRC_URI[sha256sum] = "633f5bb4ea0c88c55f3642c97f9d25cbef74f82e0b4cf8d54e7ad6f9f9caa778"
-- 
1.7.5.1.300.gc565c



