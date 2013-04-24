Received: from smtp12.smtpout.orange.fr ([80.12.242.134]
	helo=smtp.smtpout.orange.fr) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1UV8sy-0005zz-Ic
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 01:14:01 +0200
Received: from localhost.localdomain ([10.163.22.217]) by mwinf5d35 with ME
	id TywH1l0054h1lPN03ywHja; Thu, 25 Apr 2013 00:56:18 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Apr 2013 00:56:13 +0200
Message-Id: <1366844173-16573-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.11.7
MIME-Version: 1.0
Subject: [PATCH to test] dropbear: update to 2013.58
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
X-List-Received-Date: Wed, 24 Apr 2013 23:14:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

- patches updated
- nopw-option.patch dropped as the option is integrated since 2013.56
- compile tested for ARMv5 target

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
needs runtime test with -B option (blank password) and with PAM

 .../0001-urandom-xauth-changes-to-options.h.patch} |  12 ++-
 .../0002-static_build_fix.patch}                   |  22 +++--
 .../0003-configure.patch}                          |  25 +++--
 .../dropbear-2013.58/0004-fix-2kb-keys.patch       |  22 +++++
 .../0005-dropbear-enable-pam.patch}                |  21 ++--
 .../0006-dropbear-configuration-file.patch}        |  16 +++-
 meta/recipes-core/dropbear/dropbear.inc            |  23 +++--
 .../dropbear/dropbear/fix-2kb-keys.patch           |  13 ---
 .../dropbear/dropbear/nopw-option.patch            | 106 ---------------------
 meta/recipes-core/dropbear/dropbear_2012.55.bb     |   7 --
 meta/recipes-core/dropbear/dropbear_2013.58.bb     |   6 ++
 11 files changed, 109 insertions(+), 164 deletions(-)
 rename meta/recipes-core/dropbear/{dropbear/urandom-xauth-changes-to-options.h.patch => dropbear-2013.58/0001-urandom-xauth-changes-to-options.h.patch} (65%)
 rename meta/recipes-core/dropbear/{dropbear/dropbear-0.53.1-static_build_fix.patch => dropbear-2013.58/0002-static_build_fix.patch} (80%)
 rename meta/recipes-core/dropbear/{dropbear-2012.55/configure.patch => dropbear-2013.58/0003-configure.patch} (54%)
 create mode 100644 meta/recipes-core/dropbear/dropbear-2013.58/0004-fix-2kb-keys.patch
 rename meta/recipes-core/dropbear/{dropbear/dropbear-enable-pam.patch => dropbear-2013.58/0005-dropbear-enable-pam.patch} (53%)
 rename meta/recipes-core/dropbear/{dropbear/dropbear-configuration-file.patch => dropbear-2013.58/0006-dropbear-configuration-file.patch} (67%)
 delete mode 100644 meta/recipes-core/dropbear/dropbear/fix-2kb-keys.patch
 delete mode 100644 meta/recipes-core/dropbear/dropbear/nopw-option.patch
 delete mode 100644 meta/recipes-core/dropbear/dropbear_2012.55.bb
 create mode 100644 meta/recipes-core/dropbear/dropbear_2013.58.bb

diff --git a/meta/recipes-core/dropbear/dropbear/urandom-xauth-changes-to-options.h.patch b/meta/recipes-core/dropbear/dropbear-2013.58/0001-urandom-xauth-changes-to-options.h.patch
similarity index 65%
rename from meta/recipes-core/dropbear/dropbear/urandom-xauth-changes-to-options.h.patch
rename to meta/recipes-core/dropbear/dropbear-2013.58/0001-urandom-xauth-changes-to-options.h.patch
index 4acc397..71a4666 100644
--- a/meta/recipes-core/dropbear/dropbear/urandom-xauth-changes-to-options.h.patch
+++ b/meta/recipes-core/dropbear/dropbear-2013.58/0001-urandom-xauth-changes-to-options.h.patch
@@ -1,10 +1,15 @@
+Subject: [PATCH 1/6] urandom-xauth-changes-to-options.h
+
 Upstream-Status: Inappropriate [configuration]
+---
+ options.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/options.h b/options.h
-index d309ab4..7fbe97b 100644
+index 7d06322..71a21c2 100644
 --- a/options.h
 +++ b/options.h
-@@ -236,7 +236,7 @@ much traffic. */
+@@ -247,7 +247,7 @@ much traffic. */
  /* The command to invoke for xauth when using X11 forwarding.
   * "-q" for quiet */
  #ifndef XAUTH_COMMAND
@@ -13,3 +18,6 @@ index d309ab4..7fbe97b 100644
  #endif
  
  /* if you want to enable running an sftp server (such as the one included with
+-- 
+1.7.11.7
+
diff --git a/meta/recipes-core/dropbear/dropbear/dropbear-0.53.1-static_build_fix.patch b/meta/recipes-core/dropbear/dropbear-2013.58/0002-static_build_fix.patch
similarity index 80%
rename from meta/recipes-core/dropbear/dropbear/dropbear-0.53.1-static_build_fix.patch
rename to meta/recipes-core/dropbear/dropbear-2013.58/0002-static_build_fix.patch
index d125616..552bee8 100644
--- a/meta/recipes-core/dropbear/dropbear/dropbear-0.53.1-static_build_fix.patch
+++ b/meta/recipes-core/dropbear/dropbear-2013.58/0002-static_build_fix.patch
@@ -1,6 +1,6 @@
+Subject: [PATCH 2/6] static_build_fix
 Upstream-Status: Submitted
 
-
 dropbear: fix static build
 
 A more appropriate fix is to remove @CRYPTLIB@ from the objs
@@ -13,12 +13,15 @@ svr-authpasswd.c:(.text+0xfc): undefined reference to `crypt'
 collect2: ld returned 1 exit status
 
 Signed-off-by: Saul Wold <sgw@linux.intel.com>
+---
+ Makefile.in | 11 +++++++----
+ 1 file changed, 7 insertions(+), 4 deletions(-)
 
-Index: dropbear-2011.54/Makefile.in
-===================================================================
---- dropbear-2011.54.orig/Makefile.in	2011-11-08 04:48:15.000000000 -0800
-+++ dropbear-2011.54/Makefile.in	2011-12-27 13:44:41.644354442 -0800
-@@ -56,7 +56,7 @@
+diff --git a/Makefile.in b/Makefile.in
+index 4bdd845..e82e561 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -56,7 +56,7 @@ HEADERS=options.h dbutil.h session.h packet.h algo.h ssh.h buffer.h kex.h \
  		loginrec.h atomicio.h x11fwd.h agentfwd.h tcpfwd.h compat.h \
  		listener.h fake-rfc2553.h
  
@@ -27,7 +30,7 @@ Index: dropbear-2011.54/Makefile.in
  dbclientobjs=$(COMMONOBJS) $(CLISVROBJS) $(CLIOBJS)
  dropbearkeyobjs=$(COMMONOBJS) $(KEYOBJS)
  dropbearconvertobjs=$(COMMONOBJS) $(CONVERTOBJS)
-@@ -158,7 +158,10 @@
+@@ -158,7 +158,10 @@ dbclient: $(dbclientobjs)
  dropbearkey: $(dropbearkeyobjs)
  dropbearconvert: $(dropbearconvertobjs)
  
@@ -39,7 +42,7 @@ Index: dropbear-2011.54/Makefile.in
  	$(CC) $(LDFLAGS) -o $@$(EXEEXT) $($@objs) $(LIBS)
  
  # scp doesn't use the libs so is special.
-@@ -169,14 +172,14 @@
+@@ -169,14 +172,14 @@ scp: $(SCPOBJS)  $(HEADERS) Makefile
  # multi-binary compilation.
  MULTIOBJS=
  ifeq ($(MULTI),1)
@@ -56,3 +59,6 @@ Index: dropbear-2011.54/Makefile.in
  
  multilink: multibinary $(addprefix link, $(PROGRAMS))
  
+-- 
+1.7.11.7
+
diff --git a/meta/recipes-core/dropbear/dropbear-2012.55/configure.patch b/meta/recipes-core/dropbear/dropbear-2013.58/0003-configure.patch
similarity index 54%
rename from meta/recipes-core/dropbear/dropbear-2012.55/configure.patch
rename to meta/recipes-core/dropbear/dropbear-2013.58/0003-configure.patch
index aeb7c0a..2baf665 100644
--- a/meta/recipes-core/dropbear/dropbear-2012.55/configure.patch
+++ b/meta/recipes-core/dropbear/dropbear-2013.58/0003-configure.patch
@@ -1,10 +1,17 @@
-Upstream-Status: Pending
+From c5f5c5054c1b15539dccf866e2c3faba7ed68456 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
+Date: Thu, 25 Apr 2013 00:27:25 +0200
+Subject: [PATCH 3/6] configure
 
-Index: dropbear-0.49/configure.in
-===================================================================
---- dropbear-0.49.orig/configure.in
-+++ dropbear-0.49/configure.in
-@@ -164,14 +164,20 @@ AC_ARG_ENABLE(openpty,
+---
+ configure.ac | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 05461f3..9c16d90 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -166,15 +166,20 @@ AC_ARG_ENABLE(openpty,
  			AC_MSG_NOTICE(Not using openpty)
  		else
  			AC_MSG_NOTICE(Using openpty if available)
@@ -18,12 +25,16 @@ Index: dropbear-0.49/configure.in
 +		AC_SEARCH_LIBS(openpty, util, [dropbear_cv_func_have_openpty=yes])
  	]
  )
+-		
 +
 +if test "x$dropbear_cv_func_have_openpty" = "xyes"; then
 +	AC_DEFINE(HAVE_OPENPTY,,Have openpty() function)
 +	no_ptc_check=yes
 +	no_ptmx_check=yes
 +fi
- 		
  
  AC_ARG_ENABLE(syslog,
+ 	[  --disable-syslog        Don't include syslog support],
+-- 
+1.7.11.7
+
diff --git a/meta/recipes-core/dropbear/dropbear-2013.58/0004-fix-2kb-keys.patch b/meta/recipes-core/dropbear/dropbear-2013.58/0004-fix-2kb-keys.patch
new file mode 100644
index 0000000..7539d20
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear-2013.58/0004-fix-2kb-keys.patch
@@ -0,0 +1,22 @@
+Subject: [PATCH 4/6] fix 2kb keys
+
+Upstream-Status: Inappropriate [configuration]
+---
+ kex.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/kex.h b/kex.h
+index 72430e9..375c677 100644
+--- a/kex.h
++++ b/kex.h
+@@ -67,6 +67,6 @@ struct KEXState {
+ };
+ 
+ 
+-#define MAX_KEXHASHBUF 2000
++#define MAX_KEXHASHBUF 3000
+ 
+ #endif /* _KEX_H_ */
+-- 
+1.7.11.7
+
diff --git a/meta/recipes-core/dropbear/dropbear/dropbear-enable-pam.patch b/meta/recipes-core/dropbear/dropbear-2013.58/0005-dropbear-enable-pam.patch
similarity index 53%
rename from meta/recipes-core/dropbear/dropbear/dropbear-enable-pam.patch
rename to meta/recipes-core/dropbear/dropbear-2013.58/0005-dropbear-enable-pam.patch
index 004d773..e930733 100644
--- a/meta/recipes-core/dropbear/dropbear/dropbear-enable-pam.patch
+++ b/meta/recipes-core/dropbear/dropbear-2013.58/0005-dropbear-enable-pam.patch
@@ -1,22 +1,31 @@
+Subject: [PATCH 5/6] dropbear enable pam
+
 dropbear: We need modify file option.h besides enabling pam in \
 configure if we want dropbear to support pam.
 
 Upstream-Status: Pending
 
 Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
+---
+ options.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
---- a/options.h	2011-07-12 13:27:39.008819183 +0800
-+++ b/options.h.new	2011-07-12 13:37:37.780819308 +0800
-@@ -149,9 +149,9 @@
-  * but there's an interface via a PAM module - don't bother using it otherwise.
+diff --git a/options.h b/options.h
+index 71a21c2..305f789 100644
+--- a/options.h
++++ b/options.h
+@@ -174,9 +174,9 @@ much traffic. */
+  * PAM challenge/response.
   * You can't enable both PASSWORD and PAM. */
  
 -#define ENABLE_SVR_PASSWORD_AUTH
 +//#define ENABLE_SVR_PASSWORD_AUTH
  /* PAM requires ./configure --enable-pam */
--/*#define ENABLE_SVR_PAM_AUTH*/
+-//#define ENABLE_SVR_PAM_AUTH
 +#define ENABLE_SVR_PAM_AUTH
  #define ENABLE_SVR_PUBKEY_AUTH
  
- /* Wether to ake public key options in authorized_keys file into account */
+ /* Whether to take public key options in 
+-- 
+1.7.11.7
 
diff --git a/meta/recipes-core/dropbear/dropbear/dropbear-configuration-file.patch b/meta/recipes-core/dropbear/dropbear-2013.58/0006-dropbear-configuration-file.patch
similarity index 67%
rename from meta/recipes-core/dropbear/dropbear/dropbear-configuration-file.patch
rename to meta/recipes-core/dropbear/dropbear-2013.58/0006-dropbear-configuration-file.patch
index 5e94553..7e38663 100644
--- a/meta/recipes-core/dropbear/dropbear/dropbear-configuration-file.patch
+++ b/meta/recipes-core/dropbear/dropbear-2013.58/0006-dropbear-configuration-file.patch
@@ -1,13 +1,20 @@
+Subject: [PATCH 6/6] dropbear configuration file
+
 dropbear: Change the path ("/etc/pam.d/sshd" as default) to find a pam configuration file \
 to "/etc/pam.d/dropbear for dropbear when enabling pam supporting" 
 
 Upstream-Status: Inappropriate [configuration] 
 
 Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
+---
+ svr-authpam.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
---- a/svr-authpam.c	2008-11-11 22:09:03.000000000 +0800
-+++ b/svr-authpam.c.new	2011-08-29 09:53:24.000000000 +0800
-@@ -199,7 +199,7 @@
+diff --git a/svr-authpam.c b/svr-authpam.c
+index e84f076..e28be7d 100644
+--- a/svr-authpam.c
++++ b/svr-authpam.c
+@@ -195,7 +195,7 @@ void svr_auth_pam() {
  	userData.passwd = password;
  
  	/* Init pam */
@@ -16,3 +23,6 @@ Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
  		dropbear_log(LOG_WARNING, "pam_start() failed, rc=%d, %s\n", 
  				rc, pam_strerror(pamHandlep, rc));
  		goto cleanup;
+-- 
+1.7.11.7
+
diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index 8d94e5b..9864ae8 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Dropbear is a lightweight SSH and SCP implementation"
 HOMEPAGE = "http://matt.ucc.asn.au/dropbear/dropbear.html"
 SECTION = "console/network"
 
-INC_PR = "r2"
+INC_PR = "r0"
 
 # some files are from other projects and have others license terms:
 #   public domain, OpenSSH 3.5p1, OpenSSH3.6.1p2, PuTTY
@@ -14,17 +14,16 @@ RPROVIDES_${PN} = "ssh sshd"
 
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
-SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.gz \
-	         file://urandom-xauth-changes-to-options.h.patch \
-		 file://dropbear-0.53.1-static_build_fix.patch \
-	         file://configure.patch \
-	         file://fix-2kb-keys.patch \
-	         file://nopw-option.patch \
-	         file://init \
-                 ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} "
-
-PAM_SRC_URI = "file://dropbear-enable-pam.patch \
-               file://dropbear-configuration-file.patch \
+SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
+           file://0001-urandom-xauth-changes-to-options.h.patch \
+           file://0002-static_build_fix.patch \
+           file://0003-configure.patch \
+           file://0004-fix-2kb-keys.patch \
+           file://init \
+           ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} "
+
+PAM_SRC_URI = "file://0005-dropbear-enable-pam.patch \
+               file://0006-dropbear-configuration-file.patch \
                file://dropbear"
 
 inherit autotools update-rc.d
diff --git a/meta/recipes-core/dropbear/dropbear/fix-2kb-keys.patch b/meta/recipes-core/dropbear/dropbear/fix-2kb-keys.patch
deleted file mode 100644
index 3b919f6..0000000
--- a/meta/recipes-core/dropbear/dropbear/fix-2kb-keys.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-diff -Nurd dropbear-0.45/kex.h dropbear-0.45.patched/kex.h
---- dropbear-0.45/kex.h	2005-03-06 20:27:02.000000000 -0800
-+++ dropbear-0.45.patched/kex.h	2005-03-08 15:22:44.064583279 -0800
-@@ -64,6 +64,6 @@
- 
- };
- 
--#define MAX_KEXHASHBUF 2000
-+#define MAX_KEXHASHBUF 3000
- 
- #endif /* _KEX_H_ */
diff --git a/meta/recipes-core/dropbear/dropbear/nopw-option.patch b/meta/recipes-core/dropbear/dropbear/nopw-option.patch
deleted file mode 100644
index 2ff84d2..0000000
--- a/meta/recipes-core/dropbear/dropbear/nopw-option.patch
+++ /dev/null
@@ -1,106 +0,0 @@
-Allow configuring "allow blank password option" at runtime
-
-Changes this from a compile-time switch to a command-line option.
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-
-Upstream-Status: Accepted [expected in next release after 2012.55]
-
-diff --git a/options.h b/options.h
-index 00f6179..b8d0ccb 100644
---- a/options.h
-+++ b/options.h
-@@ -176,12 +176,6 @@ much traffic. */
- #define ENABLE_SVR_PUBKEY_OPTIONS
- #endif
- 
--/* Define this to allow logging in to accounts that have no password specified.
-- * Public key logins are allowed for blank-password accounts regardless of this
-- * setting.  PAM is not affected by this setting, it uses the normal pam.d
-- * settings ('nullok' option) */
--/* #define ALLOW_BLANK_PASSWORD */
--
- #define ENABLE_CLI_PASSWORD_AUTH
- #define ENABLE_CLI_PUBKEY_AUTH
- #define ENABLE_CLI_INTERACT_AUTH
-diff --git a/runopts.h b/runopts.h
-index 83b5861..126585b 100644
---- a/runopts.h
-+++ b/runopts.h
-@@ -85,6 +85,7 @@ typedef struct svr_runopts {
- 
- 	int noauthpass;
- 	int norootpass;
-+	int allowblankpass;
- 
- #ifdef ENABLE_SVR_REMOTETCPFWD
- 	int noremotetcp;
-diff --git a/svr-authpasswd.c b/svr-authpasswd.c
-index 54b4889..d9b7928 100644
---- a/svr-authpasswd.c
-+++ b/svr-authpasswd.c
-@@ -29,6 +29,7 @@
- #include "buffer.h"
- #include "dbutil.h"
- #include "auth.h"
-+#include "runopts.h"
- 
- #ifdef ENABLE_SVR_PASSWORD_AUTH
- 
-@@ -78,16 +79,17 @@ void svr_auth_password() {
- 
- 	/* check for empty password */
- 	if (passwdcrypt[0] == '\0') {
--#ifdef ALLOW_BLANK_PASSWORD
--		if (passwordlen == 0) {
--			success_blank = 1;
-+		if (svr_opts.allowblankpass) {
-+			if (passwordlen == 0) {
-+				success_blank = 1;
-+			}
-+		}
-+		else {
-+			dropbear_log(LOG_WARNING, "User '%s' has blank password, rejected",
-+					ses.authstate.pw_name);
-+			send_msg_userauth_failure(0, 1);
-+			return;
- 		}
--#else
--		dropbear_log(LOG_WARNING, "User '%s' has blank password, rejected",
--				ses.authstate.pw_name);
--		send_msg_userauth_failure(0, 1);
--		return;
--#endif
- 	}
- 
- 	if (success_blank || strcmp(testcrypt, passwdcrypt) == 0) {
-diff --git a/svr-runopts.c b/svr-runopts.c
-index c6e3508..b39ffb2 100644
---- a/svr-runopts.c
-+++ b/svr-runopts.c
-@@ -63,6 +63,7 @@ static void printhelp(const char * progname) {
- #if defined(ENABLE_SVR_PASSWORD_AUTH) || defined(ENABLE_SVR_PAM_AUTH)
- 					"-s		Disable password logins\n"
- 					"-g		Disable password logins for root\n"
-+					"-B		Allow blank password logins\n"
- #endif
- #ifdef ENABLE_SVR_LOCALTCPFWD
- 					"-j		Disable local port forwarding\n"
-@@ -115,6 +116,7 @@ void svr_getopts(int argc, char ** argv) {
- 	svr_opts.norootlogin = 0;
- 	svr_opts.noauthpass = 0;
- 	svr_opts.norootpass = 0;
-+	svr_opts.allowblankpass = 0;
- 	svr_opts.inetdmode = 0;
- 	svr_opts.portcount = 0;
- 	svr_opts.hostkey = NULL;
-@@ -234,6 +236,9 @@ void svr_getopts(int argc, char ** argv) {
- 				case 'g':
- 					svr_opts.norootpass = 1;
- 					break;
-+				case 'B':
-+					svr_opts.allowblankpass = 1;
-+					break;
- #endif
- 				case 'h':
- 					printhelp(argv[0]);
diff --git a/meta/recipes-core/dropbear/dropbear_2012.55.bb b/meta/recipes-core/dropbear/dropbear_2012.55.bb
deleted file mode 100644
index 99163ab..0000000
--- a/meta/recipes-core/dropbear/dropbear_2012.55.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require dropbear.inc
-
-SRC_URI[md5sum] = "44836e5a0419ba12557f9ea46880077e"
-SRC_URI[sha256sum] = "808df243c61bb60f2f18fa64bca628cbba0918b2a14139f10e6d59d4ac5a17ce"
-
-PR = "${INC_PR}.1"
-
diff --git a/meta/recipes-core/dropbear/dropbear_2013.58.bb b/meta/recipes-core/dropbear/dropbear_2013.58.bb
new file mode 100644
index 0000000..99a24a7
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear_2013.58.bb
@@ -0,0 +1,6 @@
+require dropbear.inc
+
+SRC_URI[md5sum] = "8d3579bbbfcea48404a3219643076450"
+SRC_URI[sha256sum] = "d866189b1d14e15353aeb4feb616f6132a63ea7c25ca8aa12b63a3a397822e55"
+
+PR = "${INC_PR}.0"
-- 
1.7.11.7



