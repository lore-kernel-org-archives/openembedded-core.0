Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7EDAE7952D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 08:06:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8686gnD021226
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Sep 2018 01:06:42 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 6 Sep 2018 01:06:35 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 6 Sep 2018 16:06:33 +0800
Message-ID: <1536221193-96122-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] dropbear: Fix CVE-2018-15599
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
X-List-Received-Date: Thu, 06 Sep 2018 08:06:41 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Wait to fail invalid usernames to fix
CVE-2018-15599

Rework 0006-dropbear-configuration-file.patch
to fix fuzz warnings

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta/recipes-core/dropbear/dropbear.inc            |   1 +
 .../0006-dropbear-configuration-file.patch         |  23 +-
 .../dropbear/dropbear/CVE-2018-15599.patch         | 236 +++++++++++++++++++++
 3 files changed, 254 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2018-15599.patch

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index b634e0e..dc24ea7 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -13,6 +13,7 @@ RPROVIDES_${PN} = "ssh sshd"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
+           file://CVE-2018-15599.patch \
            file://0001-urandom-xauth-changes-to-options.h.patch \
            file://0007-fix-localoptions-search-path.patch \
            file://init \
diff --git a/meta/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch b/meta/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch
index fa4c8d0..deed78f 100644
--- a/meta/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch
+++ b/meta/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch
@@ -1,4 +1,7 @@
-Subject: [PATCH 6/6] dropbear configuration file
+From e3a5db1b6d3f6382a15b2266458c26c645a10f18 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <Mingli.Yu@windriver.com>
+Date: Thu, 6 Sep 2018 15:54:00 +0800
+Subject: [PATCH] dropbear configuration file
 
 dropbear: Change the path ("/etc/pam.d/sshd" as default) to find a pam configuration file \
 to "/etc/pam.d/dropbear for dropbear when enabling pam supporting"
@@ -7,12 +10,17 @@ Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Maxin B. John <maxin.john@enea.com>
 Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
+Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
 ---
-diff -Naur dropbear-2013.60-orig/svr-authpam.c dropbear-2013.60/svr-authpam.c
---- dropbear-2013.60-orig/svr-authpam.c	2013-10-16 16:34:53.000000000 +0200
-+++ dropbear-2013.60/svr-authpam.c	2013-10-21 17:04:04.969416055 +0200
-@@ -211,7 +211,7 @@
- 	userData.passwd = password;
+ svr-authpam.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/svr-authpam.c b/svr-authpam.c
+index d201bc9..165ec5c 100644
+--- a/svr-authpam.c
++++ b/svr-authpam.c
+@@ -223,7 +223,7 @@ void svr_auth_pam(int valid_user) {
+ 	}
  
  	/* Init pam */
 -	if ((rc = pam_start("sshd", NULL, &pamConv, &pamHandlep)) != PAM_SUCCESS) {
@@ -20,3 +28,6 @@ diff -Naur dropbear-2013.60-orig/svr-authpam.c dropbear-2013.60/svr-authpam.c
  		dropbear_log(LOG_WARNING, "pam_start() failed, rc=%d, %s", 
  				rc, pam_strerror(pamHandlep, rc));
  		goto cleanup;
+-- 
+2.7.4
+
diff --git a/meta/recipes-core/dropbear/dropbear/CVE-2018-15599.patch b/meta/recipes-core/dropbear/dropbear/CVE-2018-15599.patch
new file mode 100644
index 0000000..912545c
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/CVE-2018-15599.patch
@@ -0,0 +1,236 @@
+From 256e2abb8150f9fea33cd026597dbe70f0379296 Mon Sep 17 00:00:00 2001
+From: Matt Johnston <matt@ucc.asn.au>
+Date: Thu, 23 Aug 2018 23:43:12 +0800
+Subject: [PATCH] Wait to fail invalid usernames
+
+Wait to fail invalid usernames
+
+Upstream-Status: Backport [https://secure.ucc.asn.au/hg/dropbear/rev/5d2d1021ca00]
+CVE: CVE-2018-15599
+Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
+---
+ auth.h           |  6 +++---
+ svr-auth.c       | 19 +++++--------------
+ svr-authpam.c    | 26 ++++++++++++++++++++++----
+ svr-authpasswd.c | 27 ++++++++++++++-------------
+ svr-authpubkey.c | 11 ++++++++++-
+ 5 files changed, 54 insertions(+), 35 deletions(-)
+
+diff --git a/auth.h b/auth.h
+index da498f5..98f5468 100644
+--- a/auth.h
++++ b/auth.h
+@@ -37,9 +37,9 @@ void recv_msg_userauth_request(void);
+ void send_msg_userauth_failure(int partial, int incrfail);
+ void send_msg_userauth_success(void);
+ void send_msg_userauth_banner(const buffer *msg);
+-void svr_auth_password(void);
+-void svr_auth_pubkey(void);
+-void svr_auth_pam(void);
++void svr_auth_password(int valid_user);
++void svr_auth_pubkey(int valid_user);
++void svr_auth_pam(int valid_user);
+ 
+ #if DROPBEAR_SVR_PUBKEY_OPTIONS_BUILT
+ int svr_pubkey_allows_agentfwd(void);
+diff --git a/svr-auth.c b/svr-auth.c
+index 64d97aa..1f364ca 100644
+--- a/svr-auth.c
++++ b/svr-auth.c
+@@ -149,10 +149,8 @@ void recv_msg_userauth_request() {
+ 		if (methodlen == AUTH_METHOD_PASSWORD_LEN &&
+ 				strncmp(methodname, AUTH_METHOD_PASSWORD,
+ 					AUTH_METHOD_PASSWORD_LEN) == 0) {
+-			if (valid_user) {
+-				svr_auth_password();
+-				goto out;
+-			}
++			svr_auth_password(valid_user);
++			goto out;
+ 		}
+ 	}
+ #endif
+@@ -164,10 +162,8 @@ void recv_msg_userauth_request() {
+ 		if (methodlen == AUTH_METHOD_PASSWORD_LEN &&
+ 				strncmp(methodname, AUTH_METHOD_PASSWORD,
+ 					AUTH_METHOD_PASSWORD_LEN) == 0) {
+-			if (valid_user) {
+-				svr_auth_pam();
+-				goto out;
+-			}
++			svr_auth_pam(valid_user);
++			goto out;
+ 		}
+ 	}
+ #endif
+@@ -177,12 +173,7 @@ void recv_msg_userauth_request() {
+ 	if (methodlen == AUTH_METHOD_PUBKEY_LEN &&
+ 			strncmp(methodname, AUTH_METHOD_PUBKEY,
+ 				AUTH_METHOD_PUBKEY_LEN) == 0) {
+-		if (valid_user) {
+-			svr_auth_pubkey();
+-		} else {
+-			/* pubkey has no failure delay */
+-			send_msg_userauth_failure(0, 0);
+-		}
++		svr_auth_pubkey(valid_user);
+ 		goto out;
+ 	}
+ #endif
+diff --git a/svr-authpam.c b/svr-authpam.c
+index 05e4f3e..d201bc9 100644
+--- a/svr-authpam.c
++++ b/svr-authpam.c
+@@ -178,13 +178,14 @@ pamConvFunc(int num_msg,
+  * Keyboard interactive would be a lot nicer, but since PAM is synchronous, it
+  * gets very messy trying to send the interactive challenges, and read the
+  * interactive responses, over the network. */
+-void svr_auth_pam() {
++void svr_auth_pam(int valid_user) {
+ 
+ 	struct UserDataS userData = {NULL, NULL};
+ 	struct pam_conv pamConv = {
+ 		pamConvFunc,
+ 		&userData /* submitted to pamvConvFunc as appdata_ptr */ 
+ 	};
++	const char* printable_user = NULL;
+ 
+ 	pam_handle_t* pamHandlep = NULL;
+ 
+@@ -204,12 +205,23 @@ void svr_auth_pam() {
+ 
+ 	password = buf_getstring(ses.payload, &passwordlen);
+ 
++	/* We run the PAM conversation regardless of whether the username is valid
++	in case the conversation function has an inherent delay.
++	Use ses.authstate.username rather than ses.authstate.pw_name.
++	After PAM succeeds we then check the valid_user flag too */
++
+ 	/* used to pass data to the PAM conversation function - don't bother with
+ 	 * strdup() etc since these are touched only by our own conversation
+ 	 * function (above) which takes care of it */
+-	userData.user = ses.authstate.pw_name;
++	userData.user = ses.authstate.username;
+ 	userData.passwd = password;
+ 
++	if (ses.authstate.pw_name) {
++		printable_user = ses.authstate.pw_name;
++	} else {
++		printable_user = "<invalid username>";
++	}
++
+ 	/* Init pam */
+ 	if ((rc = pam_start("sshd", NULL, &pamConv, &pamHandlep)) != PAM_SUCCESS) {
+ 		dropbear_log(LOG_WARNING, "pam_start() failed, rc=%d, %s", 
+@@ -242,7 +254,7 @@ void svr_auth_pam() {
+ 				rc, pam_strerror(pamHandlep, rc));
+ 		dropbear_log(LOG_WARNING,
+ 				"Bad PAM password attempt for '%s' from %s",
+-				ses.authstate.pw_name,
++				printable_user,
+ 				svr_ses.addrstring);
+ 		send_msg_userauth_failure(0, 1);
+ 		goto cleanup;
+@@ -253,12 +265,18 @@ void svr_auth_pam() {
+ 				rc, pam_strerror(pamHandlep, rc));
+ 		dropbear_log(LOG_WARNING,
+ 				"Bad PAM password attempt for '%s' from %s",
+-				ses.authstate.pw_name,
++				printable_user,
+ 				svr_ses.addrstring);
+ 		send_msg_userauth_failure(0, 1);
+ 		goto cleanup;
+ 	}
+ 
++	if (!valid_user) {
++		/* PAM auth succeeded but the username isn't allowed in for another reason
++		(checkusername() failed) */
++		send_msg_userauth_failure(0, 1);
++	}
++
+ 	/* successful authentication */
+ 	dropbear_log(LOG_NOTICE, "PAM password auth succeeded for '%s' from %s",
+ 			ses.authstate.pw_name,
+diff --git a/svr-authpasswd.c b/svr-authpasswd.c
+index bdee2aa..69c7d8a 100644
+--- a/svr-authpasswd.c
++++ b/svr-authpasswd.c
+@@ -48,22 +48,14 @@ static int constant_time_strcmp(const char* a, const char* b) {
+ 
+ /* Process a password auth request, sending success or failure messages as
+  * appropriate */
+-void svr_auth_password() {
++void svr_auth_password(int valid_user) {
+ 	
+ 	char * passwdcrypt = NULL; /* the crypt from /etc/passwd or /etc/shadow */
+ 	char * testcrypt = NULL; /* crypt generated from the user's password sent */
+-	char * password;
++	char * password = NULL;
+ 	unsigned int passwordlen;
+-
+ 	unsigned int changepw;
+ 
+-	passwdcrypt = ses.authstate.pw_passwd;
+-
+-#ifdef DEBUG_HACKCRYPT
+-	/* debugging crypt for non-root testing with shadows */
+-	passwdcrypt = DEBUG_HACKCRYPT;
+-#endif
+-
+ 	/* check if client wants to change password */
+ 	changepw = buf_getbool(ses.payload);
+ 	if (changepw) {
+@@ -73,12 +65,21 @@ void svr_auth_password() {
+ 	}
+ 
+ 	password = buf_getstring(ses.payload, &passwordlen);
+-
+-	/* the first bytes of passwdcrypt are the salt */
+-	testcrypt = crypt(password, passwdcrypt);
++	if (valid_user) {
++		/* the first bytes of passwdcrypt are the salt */
++		passwdcrypt = ses.authstate.pw_passwd;
++		testcrypt = crypt(password, passwdcrypt);
++	}
+ 	m_burn(password, passwordlen);
+ 	m_free(password);
+ 
++	/* After we have got the payload contents we can exit if the username
++	is invalid. Invalid users have already been logged. */
++	if (!valid_user) {
++		send_msg_userauth_failure(0, 1);
++		return;
++	}
++
+ 	if (testcrypt == NULL) {
+ 		/* crypt() with an invalid salt like "!!" */
+ 		dropbear_log(LOG_WARNING, "User account '%s' is locked",
+diff --git a/svr-authpubkey.c b/svr-authpubkey.c
+index aa6087c..ff481c8 100644
+--- a/svr-authpubkey.c
++++ b/svr-authpubkey.c
+@@ -79,7 +79,7 @@ static int checkfileperm(char * filename);
+ 
+ /* process a pubkey auth request, sending success or failure message as
+  * appropriate */
+-void svr_auth_pubkey() {
++void svr_auth_pubkey(int valid_user) {
+ 
+ 	unsigned char testkey; /* whether we're just checking if a key is usable */
+ 	char* algo = NULL; /* pubkey algo */
+@@ -102,6 +102,15 @@ void svr_auth_pubkey() {
+ 	keybloblen = buf_getint(ses.payload);
+ 	keyblob = buf_getptr(ses.payload, keybloblen);
+ 
++	if (!valid_user) {
++		/* Return failure once we have read the contents of the packet
++		required to validate a public key. 
++		Avoids blind user enumeration though it isn't possible to prevent
++		testing for user existence if the public key is known */
++		send_msg_userauth_failure(0, 0);
++		goto out;
++	}
++
+ 	/* check if the key is valid */
+ 	if (checkpubkey(algo, algolen, keyblob, keybloblen) == DROPBEAR_FAILURE) {
+ 		send_msg_userauth_failure(0, 0);
-- 
2.7.4


