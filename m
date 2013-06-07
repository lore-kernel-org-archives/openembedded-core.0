Return-Path: <andrei.adrianx.dinu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7AA5661EEB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 14:51:57 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 07 Jun 2013 07:49:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,822,1363158000"; d="scan'208";a="325828161"
Received: from adinu-vostro-460.rb.intel.com ([10.237.105.42])
	by orsmga001.jf.intel.com with ESMTP; 07 Jun 2013 07:51:57 -0700
From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Jun 2013 17:52:53 +0300
Message-Id: <1370616773-12603-1-git-send-email-andrei.adrianx.dinu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] sudo : upgrade to 1.8.6p8
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
X-List-Received-Date: Fri, 07 Jun 2013 14:51:58 -0000

upgrade from 1.8.6p7 -> 1.8.6p8

 - removed crypt.patch because it was contained upstream

Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
---
 meta/recipes-extended/sudo/files/crypt.patch       |  100 --------------------
 .../sudo/{sudo_1.8.6p7.bb => sudo_1.8.6p8.bb}      |    5 +-
 2 files changed, 2 insertions(+), 103 deletions(-)
 delete mode 100644 meta/recipes-extended/sudo/files/crypt.patch
 rename meta/recipes-extended/sudo/{sudo_1.8.6p7.bb => sudo_1.8.6p8.bb} (81%)

diff --git a/meta/recipes-extended/sudo/files/crypt.patch b/meta/recipes-extended/sudo/files/crypt.patch
deleted file mode 100644
index d0622d3..0000000
--- a/meta/recipes-extended/sudo/files/crypt.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-# HG changeset patch
-# User Todd C. Miller <Todd.Miller@courtesan.com>
-# Date 1365700240 14400
-# Node ID 887b9df243df5254e56c467a016f1b0a7a8507dd
-# Parent  fd7eda53cdd76aaf8336800c61005ae93de95ac7
-Check for crypt() returning NULL.  Traditionally, crypt() never returned
-NULL but newer versions of eglibc have a crypt() that does.  Bug #598
-
-diff -r fd7eda53cdd7 -r 887b9df243df plugins/sudoers/auth/passwd.c
---- a/plugins/sudoers/auth/passwd.c	Thu Apr 11 09:09:53 2013 -0400
-+++ b/plugins/sudoers/auth/passwd.c	Thu Apr 11 13:10:40 2013 -0400
-@@ -68,15 +68,15 @@
-     char sav, *epass;
-     char *pw_epasswd = auth->data;
-     size_t pw_len;
--    int error;
-+    int matched = 0;
-     debug_decl(sudo_passwd_verify, SUDO_DEBUG_AUTH)
- 
-     pw_len = strlen(pw_epasswd);
- 
- #ifdef HAVE_GETAUTHUID
-     /* Ultrix shadow passwords may use crypt16() */
--    error = strcmp(pw_epasswd, (char *) crypt16(pass, pw_epasswd));
--    if (!error)
-+    epass = (char *) crypt16(pass, pw_epasswd);
-+    if (epass != NULL && strcmp(pw_epasswd, epass) == 0)
- 	debug_return_int(AUTH_SUCCESS);
- #endif /* HAVE_GETAUTHUID */
- 
-@@ -95,12 +95,14 @@
-      */
-     epass = (char *) crypt(pass, pw_epasswd);
-     pass[8] = sav;
--    if (HAS_AGEINFO(pw_epasswd, pw_len) && strlen(epass) == DESLEN)
--	error = strncmp(pw_epasswd, epass, DESLEN);
--    else
--	error = strcmp(pw_epasswd, epass);
-+    if (epass != NULL) {
-+	if (HAS_AGEINFO(pw_epasswd, pw_len) && strlen(epass) == DESLEN)
-+	    matched = !strncmp(pw_epasswd, epass, DESLEN);
-+	else
-+	    matched = !strcmp(pw_epasswd, epass);
-+    }
- 
--    debug_return_int(error ? AUTH_FAILURE : AUTH_SUCCESS);
-+    debug_return_int(matched ? AUTH_SUCCESS : AUTH_FAILURE);
- }
- 
- int
-diff -r fd7eda53cdd7 -r 887b9df243df plugins/sudoers/auth/secureware.c
---- a/plugins/sudoers/auth/secureware.c	Thu Apr 11 09:09:53 2013 -0400
-+++ b/plugins/sudoers/auth/secureware.c	Thu Apr 11 13:10:40 2013 -0400
-@@ -73,30 +73,28 @@
- sudo_secureware_verify(struct passwd *pw, char *pass, sudo_auth *auth)
- {
-     char *pw_epasswd = auth->data;
-+    char *epass = NULL;
-     debug_decl(sudo_secureware_verify, SUDO_DEBUG_AUTH)
- #ifdef __alpha
-     {
- 	extern int crypt_type;
- 
--#  ifdef HAVE_DISPCRYPT
--	if (strcmp(pw_epasswd, dispcrypt(pass, pw_epasswd, crypt_type)) == 0)
--	    debug_return_int(AUTH_SUCCESS);
--#  else
--	if (crypt_type == AUTH_CRYPT_BIGCRYPT) {
--	    if (strcmp(pw_epasswd, bigcrypt(pass, pw_epasswd)) == 0)
--		debug_return_int(AUTH_SUCCESS);
--	} else if (crypt_type == AUTH_CRYPT_CRYPT16) {
--	    if (strcmp(pw_epasswd, crypt(pass, pw_epasswd)) == 0)
--		debug_return_int(AUTH_SUCCESS);
--	}
-+# ifdef HAVE_DISPCRYPT
-+	epass = dispcrypt(pass, pw_epasswd, crypt_type);
-+# else
-+	if (crypt_type == AUTH_CRYPT_BIGCRYPT)
-+	    epass = bigcrypt(pass, pw_epasswd);
-+	else if (crypt_type == AUTH_CRYPT_CRYPT16)
-+	    epass = crypt(pass, pw_epasswd);
-     }
--#  endif /* HAVE_DISPCRYPT */
-+# endif /* HAVE_DISPCRYPT */
- #elif defined(HAVE_BIGCRYPT)
--    if (strcmp(pw_epasswd, bigcrypt(pass, pw_epasswd)) == 0)
--	debug_return_int(AUTH_SUCCESS);
-+    epass = bigcrypt(pass, pw_epasswd);
- #endif /* __alpha */
- 
--	debug_return_int(AUTH_FAILURE);
-+    if (epass != NULL && strcmp(pw_epasswd, epass) == 0)
-+	debug_return_int(AUTH_SUCCESS);
-+    debug_return_int(AUTH_FAILURE);
- }
- 
- int
diff --git a/meta/recipes-extended/sudo/sudo_1.8.6p7.bb b/meta/recipes-extended/sudo/sudo_1.8.6p8.bb
similarity index 81%
rename from meta/recipes-extended/sudo/sudo_1.8.6p7.bb
rename to meta/recipes-extended/sudo/sudo_1.8.6p8.bb
index 7198fd3..00602c0 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.6p7.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.6p8.bb
@@ -4,13 +4,12 @@ PR = "r0"
 
 SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
            file://libtool.patch \
-           file://crypt.patch \
            ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[md5sum] = "126abfa2e841139e774d4c67d80f0e5b"
-SRC_URI[sha256sum] = "301089edb22356f59d097f6abbe1303f03927a38691b02959d618546c2125036"
+SRC_URI[md5sum] = "6dac48c73c8e0932980efcddafa569af"
+SRC_URI[sha256sum] = "c0baaa87f59153967b650a0dde2f7d4147d358fa15f3fdabb47e84d0282fe625"
 
 DEPENDS += " ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += " ${@base_contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
1.7.9.5


