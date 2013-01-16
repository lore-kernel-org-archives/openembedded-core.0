Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TvUd6-0004dJ-PT
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 16:10:18 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 16 Jan 2013 06:54:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,479,1355126400"; d="scan'208";a="244640280"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.117])
	by azsmga001.ch.intel.com with ESMTP; 16 Jan 2013 06:54:21 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jan 2013 14:54:17 +0000
Message-Id: <92e9abc7bc28eced054b0cbd6f9eaa74eb4af670.1358347974.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1358347974.git.paul.eggleton@linux.intel.com>
References: <cover.1358347974.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1358347974.git.paul.eggleton@linux.intel.com>
References: <cover.1358347974.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] dropbear: allow configuring blank password option at runtime
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Jan 2013 15:10:19 -0000

Instead of using IMAGE_FEATURES to control something within a recipe,
allow this to be set at runtime and set it during postprocessing.
Additionally, use one postprocessing function for both openssh and
dropbear and run it regardless of whether ssh-server-* are in
IMAGE_FEATURES so that it still takes effect if these are installed by
adding dropbear/openssh to IMAGE_INSTALL.

Fixes [YOCTO #2578].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/core-image.bbclass                    |    5 +-
 meta/classes/image.bbclass                         |    8 +-
 meta/recipes-core/dropbear/dropbear.inc            |    6 +-
 .../dropbear/dropbear/allow-nopw.patch             |   19 ----
 .../dropbear/dropbear/nopw-option.patch            |  106 ++++++++++++++++++++
 5 files changed, 116 insertions(+), 28 deletions(-)
 delete mode 100644 meta/recipes-core/dropbear/dropbear/allow-nopw.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/nopw-option.patch

diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
index 2e67018..04059fe 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -76,6 +76,5 @@ ROOTFS_POSTPROCESS_COMMAND += "rootfs_update_timestamp ; "
 
 # Zap the root password if debug-tweaks feature is not enabled
 ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("IMAGE_FEATURES", "debug-tweaks", "", "zap_root_password ; ",d)}'
-# Allow openssh accept empty password login if both debug-tweaks and ssh-server-openssh are enabled
-ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("IMAGE_FEATURES", "debug-tweaks ssh-server-openssh", "openssh_allow_empty_password; ", "",d)}'
-
+# Allow dropbear/openssh to accept logins from accounts with an empty password string if debug-tweaks is enabled
+ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("IMAGE_FEATURES", "debug-tweaks", "ssh_allow_empty_password; ", "",d)}'
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index e494689..661299e 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -396,12 +396,16 @@ zap_root_password () {
 	mv ${IMAGE_ROOTFS}/etc/passwd.new ${IMAGE_ROOTFS}/etc/passwd
 } 
 
-# allow openssh accept login with empty password string
-openssh_allow_empty_password () {
+# allow dropbear/openssh to accept root logins and logins from accounts with an empty password string
+ssh_allow_empty_password () {
 	if [ -e ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config ]; then
 		sed -i 's#.*PermitRootLogin.*#PermitRootLogin yes#' ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config
 		sed -i 's#.*PermitEmptyPasswords.*#PermitEmptyPasswords yes#' ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config
 	fi
+
+	if [ -e ${IMAGE_ROOTFS}${sbindir}/dropbear ] ; then
+		echo 'DROPBEAR_EXTRA_ARGS="-B"' > ${IMAGE_ROOTFS}${sysconfdir}/default/dropbear
+	fi
 }
 
 # Turn any symbolic /sbin/init link into a file
diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index aa313df..3e430f2 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Dropbear is a lightweight SSH and SCP implementation"
 HOMEPAGE = "http://matt.ucc.asn.au/dropbear/dropbear.html"
 SECTION = "console/network"
 
-INC_PR = "r0"
+INC_PR = "r1"
 
 # some files are from other projects and have others license terms:
 #   public domain, OpenSSH 3.5p1, OpenSSH3.6.1p2, PuTTY
@@ -18,7 +18,7 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.gz \
 		 file://dropbear-0.53.1-static_build_fix.patch \
 	         file://configure.patch \
 	         file://fix-2kb-keys.patch \
-	         ${@base_contains("DISTRO_TYPE", "debug", "file://allow-nopw.patch", "",d)} \
+	         file://nopw-option.patch \
 	         file://init \
                  ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} "
 
@@ -40,8 +40,6 @@ EXTRA_OEMAKE = 'MULTI=1 SCPPROGRESS=1 PROGRAMS="${SBINCOMMANDS} ${BINCOMMANDS}"'
 EXTRA_OECONF += "\
  ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)}"
 
-DISTRO_TYPE ?= "${@base_contains("IMAGE_FEATURES", "debug-tweaks", "debug", "",d)}"
-
 do_install() {
 	install -d ${D}${sysconfdir} \
 		   ${D}${sysconfdir}/init.d \
diff --git a/meta/recipes-core/dropbear/dropbear/allow-nopw.patch b/meta/recipes-core/dropbear/dropbear/allow-nopw.patch
deleted file mode 100644
index a175ee1..0000000
--- a/meta/recipes-core/dropbear/dropbear/allow-nopw.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Enable blank password login function for new release dropbear.
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Mei Lei <lei.mei@intel.com>
-
-diff --git a/options.h b/options.h
-index 73689ad..041ddaa 100644
---- a/options.h
-+++ b/options.h
-@@ -180,7 +180,7 @@ much traffic. */
-  * Public key logins are allowed for blank-password accounts regardless of this
-  * setting.  PAM is not affected by this setting, it uses the normal pam.d
-  * settings ('nullok' option) */
--/* #define ALLOW_BLANK_PASSWORD */
-+#define ALLOW_BLANK_PASSWORD
- 
- #define ENABLE_CLI_PASSWORD_AUTH
- #define ENABLE_CLI_PUBKEY_AUTH
diff --git a/meta/recipes-core/dropbear/dropbear/nopw-option.patch b/meta/recipes-core/dropbear/dropbear/nopw-option.patch
new file mode 100644
index 0000000..e7fcbb3
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/nopw-option.patch
@@ -0,0 +1,106 @@
+Allow configuring "allow blank password option" at runtime
+
+Changes this from a compile-time switch to a command-line option.
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+Upstream-Status: Pending
+
+diff --git a/options.h b/options.h
+index 00f6179..b8d0ccb 100644
+--- a/options.h
++++ b/options.h
+@@ -176,12 +176,6 @@ much traffic. */
+ #define ENABLE_SVR_PUBKEY_OPTIONS
+ #endif
+ 
+-/* Define this to allow logging in to accounts that have no password specified.
+- * Public key logins are allowed for blank-password accounts regardless of this
+- * setting.  PAM is not affected by this setting, it uses the normal pam.d
+- * settings ('nullok' option) */
+-/* #define ALLOW_BLANK_PASSWORD */
+-
+ #define ENABLE_CLI_PASSWORD_AUTH
+ #define ENABLE_CLI_PUBKEY_AUTH
+ #define ENABLE_CLI_INTERACT_AUTH
+diff --git a/runopts.h b/runopts.h
+index 83b5861..126585b 100644
+--- a/runopts.h
++++ b/runopts.h
+@@ -85,6 +85,7 @@ typedef struct svr_runopts {
+ 
+ 	int noauthpass;
+ 	int norootpass;
++	int allowblankpass;
+ 
+ #ifdef ENABLE_SVR_REMOTETCPFWD
+ 	int noremotetcp;
+diff --git a/svr-authpasswd.c b/svr-authpasswd.c
+index 54b4889..d9b7928 100644
+--- a/svr-authpasswd.c
++++ b/svr-authpasswd.c
+@@ -29,6 +29,7 @@
+ #include "buffer.h"
+ #include "dbutil.h"
+ #include "auth.h"
++#include "runopts.h"
+ 
+ #ifdef ENABLE_SVR_PASSWORD_AUTH
+ 
+@@ -78,16 +79,17 @@ void svr_auth_password() {
+ 
+ 	/* check for empty password */
+ 	if (passwdcrypt[0] == '\0') {
+-#ifdef ALLOW_BLANK_PASSWORD
+-		if (passwordlen == 0) {
+-			success_blank = 1;
++		if (svr_opts.allowblankpass) {
++			if (passwordlen == 0) {
++				success_blank = 1;
++			}
++		}
++		else {
++			dropbear_log(LOG_WARNING, "User '%s' has blank password, rejected",
++					ses.authstate.pw_name);
++			send_msg_userauth_failure(0, 1);
++			return;
+ 		}
+-#else
+-		dropbear_log(LOG_WARNING, "User '%s' has blank password, rejected",
+-				ses.authstate.pw_name);
+-		send_msg_userauth_failure(0, 1);
+-		return;
+-#endif
+ 	}
+ 
+ 	if (success_blank || strcmp(testcrypt, passwdcrypt) == 0) {
+diff --git a/svr-runopts.c b/svr-runopts.c
+index c6e3508..b39ffb2 100644
+--- a/svr-runopts.c
++++ b/svr-runopts.c
+@@ -63,6 +63,7 @@ static void printhelp(const char * progname) {
+ #if defined(ENABLE_SVR_PASSWORD_AUTH) || defined(ENABLE_SVR_PAM_AUTH)
+ 					"-s		Disable password logins\n"
+ 					"-g		Disable password logins for root\n"
++					"-B		Allow blank password logins\n"
+ #endif
+ #ifdef ENABLE_SVR_LOCALTCPFWD
+ 					"-j		Disable local port forwarding\n"
+@@ -115,6 +116,7 @@ void svr_getopts(int argc, char ** argv) {
+ 	svr_opts.norootlogin = 0;
+ 	svr_opts.noauthpass = 0;
+ 	svr_opts.norootpass = 0;
++	svr_opts.allowblankpass = 0;
+ 	svr_opts.inetdmode = 0;
+ 	svr_opts.portcount = 0;
+ 	svr_opts.hostkey = NULL;
+@@ -234,6 +236,9 @@ void svr_getopts(int argc, char ** argv) {
+ 				case 'g':
+ 					svr_opts.norootpass = 1;
+ 					break;
++				case 'B':
++					svr_opts.allowblankpass = 1;
++					break;
+ #endif
+ 				case 'h':
+ 					printhelp(argv[0]);
-- 
1.7.10.4



