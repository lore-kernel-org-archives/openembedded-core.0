Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1R9YMl-0007ID-0c
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 10:22:43 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 30 Sep 2011 01:16:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,465,1312182000"; d="scan'208";a="57288681"
Received: from daocaoren-desktop.sh.intel.com (HELO localhost.localdomain)
	([10.239.47.21])
	by azsmga001.ch.intel.com with ESMTP; 30 Sep 2011 01:16:10 -0700
From: Mei Lei <lei.mei@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Sep 2011 16:16:07 +0800
Message-Id: <b330ace43e380c0f199e00ef2e5069ac42330dfc.1317370299.git.lei.mei@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1317370299.git.lei.mei@intel.com>
References: <cover.1317370299.git.lei.mei@intel.com>
In-Reply-To: <cover.1317370299.git.lei.mei@intel.com>
References: <cover.1317370299.git.lei.mei@intel.com>
Subject: [PATCH 3/4] dropbear: Upgrade from 0.52 to 0.53.1
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
X-List-Received-Date: Fri, 30 Sep 2011 08:22:43 -0000

Signed-off-by: Mei Lei <lei.mei@intel.com>
---
 .../configure.patch                                |    0
 meta/recipes-core/dropbear/dropbear.inc            |    1 +
 .../dropbear/dropbear/allow-nopw.patch             |   14 +++++-----
 .../dropbear-0.53.1-static_build_fix.patch         |   29 ++++++++++++++++++++
 .../urandom-xauth-changes-to-options.h.patch       |   11 ++++---
 meta/recipes-core/dropbear/dropbear_0.52.bb        |    6 ----
 meta/recipes-core/dropbear/dropbear_0.53.1.bb      |    6 ++++
 7 files changed, 49 insertions(+), 18 deletions(-)
 rename meta/recipes-core/dropbear/{dropbear-0.52 => dropbear-0.53.1}/configure.patch (100%)
 create mode 100644 meta/recipes-core/dropbear/dropbear/dropbear-0.53.1-static_build_fix.patch
 delete mode 100644 meta/recipes-core/dropbear/dropbear_0.52.bb
 create mode 100644 meta/recipes-core/dropbear/dropbear_0.53.1.bb

diff --git a/meta/recipes-core/dropbear/dropbear-0.52/configure.patch b/meta/recipes-core/dropbear/dropbear-0.53.1/configure.patch
similarity index 100%
rename from meta/recipes-core/dropbear/dropbear-0.52/configure.patch
rename to meta/recipes-core/dropbear/dropbear-0.53.1/configure.patch
diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index 1582f2e..1894715 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -13,6 +13,7 @@ DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.gz \
 	         file://urandom-xauth-changes-to-options.h.patch \
+		 file://dropbear-0.53.1-static_build_fix.patch \
 	         file://configure.patch \
 	         file://fix-2kb-keys.patch \
 	         file://allow-nopw.patch;apply=no \
diff --git a/meta/recipes-core/dropbear/dropbear/allow-nopw.patch b/meta/recipes-core/dropbear/dropbear/allow-nopw.patch
index add69cd..3909ef2 100644
--- a/meta/recipes-core/dropbear/dropbear/allow-nopw.patch
+++ b/meta/recipes-core/dropbear/dropbear/allow-nopw.patch
@@ -1,18 +1,18 @@
 Upstream-Status: Inappropriate [embedded specific]
 
 diff --git a/svr-auth.c b/svr-auth.c
-index 5da0aa7..4de4964 100644
+index 87e3c5e..3e78c1a 100644
 --- a/svr-auth.c
 +++ b/svr-auth.c
-@@ -249,6 +249,7 @@ static int checkusername(unsigned char *username, unsigned int userlen) {
+@@ -250,6 +250,7 @@ static int checkusername(unsigned char *username, unsigned int userlen) {
  	}
  
  	/* check for an empty password */
 +#ifdef DISALLOW_EMPTY_PW
  	if (ses.authstate.pw_passwd[0] == '\0') {
  		TRACE(("leave checkusername: empty pword"))
- 		dropbear_log(LOG_WARNING, "user '%s' has blank password, rejected",
-@@ -256,6 +257,7 @@ static int checkusername(unsigned char *username, unsigned int userlen) {
+ 		dropbear_log(LOG_WARNING, "User '%s' has blank password, rejected",
+@@ -257,6 +258,7 @@ static int checkusername(unsigned char *username, unsigned int userlen) {
  		send_msg_userauth_failure(0, 1);
  		return DROPBEAR_FAILURE;
  	}
@@ -21,7 +21,7 @@ index 5da0aa7..4de4964 100644
  	TRACE(("shell is %s", ses.authstate.pw_shell))
  
 diff --git a/svr-authpasswd.c b/svr-authpasswd.c
-index 53550a2..7b896bd 100644
+index a29fd63..6a3c7e9 100644
 --- a/svr-authpasswd.c
 +++ b/svr-authpasswd.c
 @@ -64,9 +64,13 @@ void svr_auth_password() {
@@ -29,11 +29,11 @@ index 53550a2..7b896bd 100644
  	 * in auth.c */
  	if (passwdcrypt[0] == '\0') {
 +#ifdef DISALLOW_EMPTY_PASSWD
- 		dropbear_log(LOG_WARNING, "user '%s' has blank password, rejected",
+ 		dropbear_log(LOG_WARNING, "User '%s' has blank password, rejected",
  				ses.authstate.pw_name);
  		send_msg_userauth_failure(0, 1);
 +#else
-+		send_msg_userauth_success();
++               send_msg_userauth_success();
 +#endif
  		return;
  	}
diff --git a/meta/recipes-core/dropbear/dropbear/dropbear-0.53.1-static_build_fix.patch b/meta/recipes-core/dropbear/dropbear/dropbear-0.53.1-static_build_fix.patch
new file mode 100644
index 0000000..14a8770
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/dropbear-0.53.1-static_build_fix.patch
@@ -0,0 +1,29 @@
+Upstream-Status: Inappropriate [Pending]
+Get this patch from  buildroot maillist.
+
+dropbear: fix static build
+
+The latest release 0.53.1 change: lcrypt needs to be before object files for static linking
+
+the -lcrypt is missing during the link
+
+svr-authpasswd.o: In function `svr_auth_password':
+svr-authpasswd.c:(.text+0xfc): undefined reference to `crypt'
+collect2: ld returned 1 exit status
+
+Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj at jcrosoft.com>
+Signed-off-by: Mei Lei <lei.mei@intel.com>
+
+diff --git a/Makefile.in b/Makefile.in
+index 8d81647..0b9b769 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -77,7 +77,7 @@ STRIP=@STRIP@
+ INSTALL=@INSTALL@
+ CPPFLAGS=@CPPFLAGS@
+ CFLAGS+=-I. -I$(srcdir) $(CPPFLAGS) @CFLAGS@
+-LIBS+=@LIBS@
++LIBS+=@CRYPTLIB@ @LIBS@
+ LDFLAGS=@LDFLAGS@
+ 
+ EXEEXT=@EXEEXT@
diff --git a/meta/recipes-core/dropbear/dropbear/urandom-xauth-changes-to-options.h.patch b/meta/recipes-core/dropbear/dropbear/urandom-xauth-changes-to-options.h.patch
index 668824a..4acc397 100644
--- a/meta/recipes-core/dropbear/dropbear/urandom-xauth-changes-to-options.h.patch
+++ b/meta/recipes-core/dropbear/dropbear/urandom-xauth-changes-to-options.h.patch
@@ -1,13 +1,14 @@
 Upstream-Status: Inappropriate [configuration]
 
-diff -Nurd dropbear-0.45/options.h dropbear-0.45.patched/options.h
---- dropbear-0.45/options.h	2005-03-06 20:27:02.000000000 -0800
-+++ dropbear-0.45.patched/options.h	2005-03-08 15:25:09.368742090 -0800
-@@ -167,7 +167,7 @@
+diff --git a/options.h b/options.h
+index d309ab4..7fbe97b 100644
+--- a/options.h
++++ b/options.h
+@@ -236,7 +236,7 @@ much traffic. */
  /* The command to invoke for xauth when using X11 forwarding.
   * "-q" for quiet */
  #ifndef XAUTH_COMMAND
--#define XAUTH_COMMAND "/usr/X11R6/bin/xauth -q"
+-#define XAUTH_COMMAND "/usr/bin/X11/xauth -q"
 +#define XAUTH_COMMAND "xauth -q"
  #endif
  
diff --git a/meta/recipes-core/dropbear/dropbear_0.52.bb b/meta/recipes-core/dropbear/dropbear_0.52.bb
deleted file mode 100644
index 4013c65..0000000
--- a/meta/recipes-core/dropbear/dropbear_0.52.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require dropbear.inc
-
-SRC_URI[md5sum] = "1c69ec674481d7745452f68f2ea5597e"
-SRC_URI[sha256sum] = "e3a2ca49ed85ce562240c0ac06e2f72826d7e52a83e80d91c067c8b97bf5c108"
-
-PR = "r3"
diff --git a/meta/recipes-core/dropbear/dropbear_0.53.1.bb b/meta/recipes-core/dropbear/dropbear_0.53.1.bb
new file mode 100644
index 0000000..54f86e8
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear_0.53.1.bb
@@ -0,0 +1,6 @@
+require dropbear.inc
+
+SRC_URI[md5sum] = "6b8d901859d9b8a18e2f6bfe0a892a03"
+SRC_URI[sha256sum] = "192538ca2a9ee778f12a2e8ddb6f098fa85dcb6457adc1cb40dd94b3c28f4df6"
+
+PR = "r0"
-- 
1.7.0.4



