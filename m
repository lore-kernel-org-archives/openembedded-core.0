Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TvWad-0008U0-6u
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 18:15:52 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jan 2013 09:00:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,480,1355126400"; d="scan'208";a="277677159"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.117])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jan 2013 09:00:15 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jan 2013 17:00:11 +0000
Message-Id: <39e2899078ea495dc39d7bdd2c081a7964e73dd9.1358355580.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1358355580.git.paul.eggleton@linux.intel.com>
References: <cover.1358355580.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1358355580.git.paul.eggleton@linux.intel.com>
References: <cover.1358355580.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v3 1/2] dropbear: allow configuring blank password option at runtime
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
X-List-Received-Date: Wed, 16 Jan 2013 17:16:01 -0000

Instead of using IMAGE_FEATURES to control something within a recipe,
allow this to be set at runtime, avoiding the need to rebuild dropbear
when we want to change this option.

First half of the fix for [YOCTO #2578].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/dropbear/dropbear.inc            |    6 +-
 .../dropbear/dropbear/allow-nopw.patch             |   19 ----
 .../dropbear/dropbear/nopw-option.patch            |  106 ++++++++++++++++++++
 3 files changed, 108 insertions(+), 23 deletions(-)
 delete mode 100644 meta/recipes-core/dropbear/dropbear/allow-nopw.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/nopw-option.patch

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



