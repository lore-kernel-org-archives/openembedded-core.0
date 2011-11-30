Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1RVdJV-0007g3-2S
	for openembedded-core@openembedded.org; Wed, 30 Nov 2011 07:06:37 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 29 Nov 2011 21:58:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,595,1315206000"; d="scan'208";a="90460129"
Received: from daocaoren-desktop.sh.intel.com (HELO localhost.localdomain)
	([10.239.47.21])
	by fmsmga001.fm.intel.com with ESMTP; 29 Nov 2011 21:58:45 -0800
From: Mei Lei <lei.mei@intel.com>
To: openembedded-core@openembedded.org
Date: Wed, 30 Nov 2011 13:57:53 +0800
Message-Id: <d2556a3bcd208b2d6a8c02332b26b6e808632d7c.1322619553.git.lei.mei@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1322619553.git.lei.mei@intel.com>
References: <cover.1322619553.git.lei.mei@intel.com>
In-Reply-To: <cover.1322619553.git.lei.mei@intel.com>
References: <cover.1322619553.git.lei.mei@intel.com>
Subject: [PATCH 2/3] dropbear: Upgrade from 0.53.1 to 2011.54
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
X-List-Received-Date: Wed, 30 Nov 2011 06:06:37 -0000

Signed-off-by: Mei Lei <lei.mei@intel.com>
---
 .../configure.patch                                |    0
 meta/recipes-core/dropbear/dropbear.inc            |    8 ----
 .../dropbear/dropbear/allow-nopw.patch             |   40 --------------------
 meta/recipes-core/dropbear/dropbear_0.53.1.bb      |    6 ---
 meta/recipes-core/dropbear/dropbear_2011.54.bb     |    6 +++
 5 files changed, 6 insertions(+), 54 deletions(-)
 rename meta/recipes-core/dropbear/{dropbear-0.53.1 => dropbear-2011.54}/configure.patch (100%)
 delete mode 100644 meta/recipes-core/dropbear/dropbear/allow-nopw.patch
 delete mode 100644 meta/recipes-core/dropbear/dropbear_0.53.1.bb
 create mode 100644 meta/recipes-core/dropbear/dropbear_2011.54.bb

diff --git a/meta/recipes-core/dropbear/dropbear-0.53.1/configure.patch b/meta/recipes-core/dropbear/dropbear-2011.54/configure.patch
similarity index 100%
rename from meta/recipes-core/dropbear/dropbear-0.53.1/configure.patch
rename to meta/recipes-core/dropbear/dropbear-2011.54/configure.patch
diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index 1894715..9de13f0 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -16,7 +16,6 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.gz \
 		 file://dropbear-0.53.1-static_build_fix.patch \
 	         file://configure.patch \
 	         file://fix-2kb-keys.patch \
-	         file://allow-nopw.patch;apply=no \
 	         file://init \
                  ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} "
 
@@ -40,13 +39,6 @@ EXTRA_OECONF += "\
 
 DISTRO_TYPE ?= "${@base_contains("IMAGE_FEATURES", "debug-tweaks", "debug", "",d)}"
 
-do_debug_patch() {
-	if [ "${DISTRO_TYPE}" = "debug" ]; then
-		bbnote "WARNING: applying allow-nopw.patch which allows password-less logins!"
-		patch -p1 < ${WORKDIR}/allow-nopw.patch
-	fi
-}
-
 addtask do_debug_patch after do_patch before do_configure
 
 do_install() {
diff --git a/meta/recipes-core/dropbear/dropbear/allow-nopw.patch b/meta/recipes-core/dropbear/dropbear/allow-nopw.patch
deleted file mode 100644
index 3909ef2..0000000
--- a/meta/recipes-core/dropbear/dropbear/allow-nopw.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-diff --git a/svr-auth.c b/svr-auth.c
-index 87e3c5e..3e78c1a 100644
---- a/svr-auth.c
-+++ b/svr-auth.c
-@@ -250,6 +250,7 @@ static int checkusername(unsigned char *username, unsigned int userlen) {
- 	}
- 
- 	/* check for an empty password */
-+#ifdef DISALLOW_EMPTY_PW
- 	if (ses.authstate.pw_passwd[0] == '\0') {
- 		TRACE(("leave checkusername: empty pword"))
- 		dropbear_log(LOG_WARNING, "User '%s' has blank password, rejected",
-@@ -257,6 +258,7 @@ static int checkusername(unsigned char *username, unsigned int userlen) {
- 		send_msg_userauth_failure(0, 1);
- 		return DROPBEAR_FAILURE;
- 	}
-+#endif
- 
- 	TRACE(("shell is %s", ses.authstate.pw_shell))
- 
-diff --git a/svr-authpasswd.c b/svr-authpasswd.c
-index a29fd63..6a3c7e9 100644
---- a/svr-authpasswd.c
-+++ b/svr-authpasswd.c
-@@ -64,9 +64,13 @@ void svr_auth_password() {
- 	 * since the shadow password may differ to that tested
- 	 * in auth.c */
- 	if (passwdcrypt[0] == '\0') {
-+#ifdef DISALLOW_EMPTY_PASSWD
- 		dropbear_log(LOG_WARNING, "User '%s' has blank password, rejected",
- 				ses.authstate.pw_name);
- 		send_msg_userauth_failure(0, 1);
-+#else
-+               send_msg_userauth_success();
-+#endif
- 		return;
- 	}
- 
diff --git a/meta/recipes-core/dropbear/dropbear_0.53.1.bb b/meta/recipes-core/dropbear/dropbear_0.53.1.bb
deleted file mode 100644
index 54f86e8..0000000
--- a/meta/recipes-core/dropbear/dropbear_0.53.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require dropbear.inc
-
-SRC_URI[md5sum] = "6b8d901859d9b8a18e2f6bfe0a892a03"
-SRC_URI[sha256sum] = "192538ca2a9ee778f12a2e8ddb6f098fa85dcb6457adc1cb40dd94b3c28f4df6"
-
-PR = "r0"
diff --git a/meta/recipes-core/dropbear/dropbear_2011.54.bb b/meta/recipes-core/dropbear/dropbear_2011.54.bb
new file mode 100644
index 0000000..b7b4b83
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear_2011.54.bb
@@ -0,0 +1,6 @@
+require dropbear.inc
+
+SRC_URI[md5sum] = "ce1e236c4a8df0cb95253defee6716b5"
+SRC_URI[sha256sum] = "a5fe60fa9c11e7b0f6a21ef6e86a53ce3d55236548901905070ff1c1716fbf47"
+
+PR = "r0"
-- 
1.7.0.4



