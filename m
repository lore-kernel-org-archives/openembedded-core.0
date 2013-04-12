Received: from mail-wi0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UQbOR-0004jG-GS
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Apr 2013 12:39:44 +0200
Received: by mail-wi0-f172.google.com with SMTP id hr17so1417885wib.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2013 03:22:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=Zj0iyst4yMLNN7selQn7WnHI11iz8YZ2EoFquK5/ZUk=;
	b=DCOr3xPQUBtiyw9tBIRGHEMO4kIK7yn9omKF7/unK26n331YJXCzcfyUPSt/CZo7rs
	DBkeRtYtWUec2q2oYlUAS2oDS8Ncs6AIG+dzuWweAAyZCpAHB+lEzUFCgV9czVvLnFe/
	dEIJcGO0AdJdVQS2ODGnPDdXLSiCl8dUdFEgjMCgdvs1TZr64p6VEmAAIPCuyQks6r38
	zFQZUAGDq9bM2igfBKQdhGzbT7hd6omQbER1zyq/nkPHhdGISD80T8HVGlLzjigxubLn
	rwkEhOV+BO6742pBFahqe0rFv7yjPjbm74JF2cV4FtNwAYKywNkQ8046Dr1eVsrCATdL
	AhtQ==
X-Received: by 10.194.104.137 with SMTP id ge9mr10728166wjb.52.1365762139442; 
	Fri, 12 Apr 2013 03:22:19 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id o5sm2720057wix.3.2013.04.12.03.22.18
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 12 Apr 2013 03:22:18 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Apr 2013 11:19:31 +0100
Message-Id: <1365761971-18730-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQksdBB+lV3IYhSTeDGWBOOxiWVrEkX+/BZXZc5RJ889PMncEXRaTXmRi6+2fH0M3j4jMc5t
Subject: [PATCH] sudo: update crypt.patch to use backport from upstream
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
X-List-Received-Date: Fri, 12 Apr 2013 10:39:46 -0000

Upstream closed my bug and rewrote the patch, so update our patch with a
backport from upstream.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/sudo/files/crypt.patch |  112 +++++++++++++++++++++-----
 1 file changed, 94 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-extended/sudo/files/crypt.patch b/meta/recipes-extended/sudo/files/crypt.patch
index 53a257f..d0622d3 100644
--- a/meta/recipes-extended/sudo/files/crypt.patch
+++ b/meta/recipes-extended/sudo/files/crypt.patch
@@ -1,24 +1,100 @@
-Staring from glibc 2.17 the crypt() function will error out and return NULL if
-the seed or "correct" is invalid. The failure case for this is the sudo user
-having a locked account in /etc/shadow, so their password is "!", which is an
-invalid hash.  crypt() never returned NULL previously so this is crashing in
-strcmp().
-
-Upstream-Status: Pending
+Upstream-Status: Backport
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
-Index: sudo-1.8.6p7/plugins/sudoers/auth/passwd.c
-===================================================================
---- sudo-1.8.6p7.orig/plugins/sudoers/auth/passwd.c	2013-04-11 15:26:28.456416867 +0100
-+++ sudo-1.8.6p7/plugins/sudoers/auth/passwd.c	2013-04-11 15:31:31.156421718 +0100
-@@ -96,7 +96,9 @@
+# HG changeset patch
+# User Todd C. Miller <Todd.Miller@courtesan.com>
+# Date 1365700240 14400
+# Node ID 887b9df243df5254e56c467a016f1b0a7a8507dd
+# Parent  fd7eda53cdd76aaf8336800c61005ae93de95ac7
+Check for crypt() returning NULL.  Traditionally, crypt() never returned
+NULL but newer versions of eglibc have a crypt() that does.  Bug #598
+
+diff -r fd7eda53cdd7 -r 887b9df243df plugins/sudoers/auth/passwd.c
+--- a/plugins/sudoers/auth/passwd.c	Thu Apr 11 09:09:53 2013 -0400
++++ b/plugins/sudoers/auth/passwd.c	Thu Apr 11 13:10:40 2013 -0400
+@@ -68,15 +68,15 @@
+     char sav, *epass;
+     char *pw_epasswd = auth->data;
+     size_t pw_len;
+-    int error;
++    int matched = 0;
+     debug_decl(sudo_passwd_verify, SUDO_DEBUG_AUTH)
+ 
+     pw_len = strlen(pw_epasswd);
+ 
+ #ifdef HAVE_GETAUTHUID
+     /* Ultrix shadow passwords may use crypt16() */
+-    error = strcmp(pw_epasswd, (char *) crypt16(pass, pw_epasswd));
+-    if (!error)
++    epass = (char *) crypt16(pass, pw_epasswd);
++    if (epass != NULL && strcmp(pw_epasswd, epass) == 0)
+ 	debug_return_int(AUTH_SUCCESS);
+ #endif /* HAVE_GETAUTHUID */
+ 
+@@ -95,12 +95,14 @@
       */
      epass = (char *) crypt(pass, pw_epasswd);
      pass[8] = sav;
 -    if (HAS_AGEINFO(pw_epasswd, pw_len) && strlen(epass) == DESLEN)
-+    if (epass == NULL)
-+	error = AUTH_FAILURE;
-+    else if (HAS_AGEINFO(pw_epasswd, pw_len) && strlen(epass) == DESLEN)
- 	error = strncmp(pw_epasswd, epass, DESLEN);
-     else
- 	error = strcmp(pw_epasswd, epass);
+-	error = strncmp(pw_epasswd, epass, DESLEN);
+-    else
+-	error = strcmp(pw_epasswd, epass);
++    if (epass != NULL) {
++	if (HAS_AGEINFO(pw_epasswd, pw_len) && strlen(epass) == DESLEN)
++	    matched = !strncmp(pw_epasswd, epass, DESLEN);
++	else
++	    matched = !strcmp(pw_epasswd, epass);
++    }
+ 
+-    debug_return_int(error ? AUTH_FAILURE : AUTH_SUCCESS);
++    debug_return_int(matched ? AUTH_SUCCESS : AUTH_FAILURE);
+ }
+ 
+ int
+diff -r fd7eda53cdd7 -r 887b9df243df plugins/sudoers/auth/secureware.c
+--- a/plugins/sudoers/auth/secureware.c	Thu Apr 11 09:09:53 2013 -0400
++++ b/plugins/sudoers/auth/secureware.c	Thu Apr 11 13:10:40 2013 -0400
+@@ -73,30 +73,28 @@
+ sudo_secureware_verify(struct passwd *pw, char *pass, sudo_auth *auth)
+ {
+     char *pw_epasswd = auth->data;
++    char *epass = NULL;
+     debug_decl(sudo_secureware_verify, SUDO_DEBUG_AUTH)
+ #ifdef __alpha
+     {
+ 	extern int crypt_type;
+ 
+-#  ifdef HAVE_DISPCRYPT
+-	if (strcmp(pw_epasswd, dispcrypt(pass, pw_epasswd, crypt_type)) == 0)
+-	    debug_return_int(AUTH_SUCCESS);
+-#  else
+-	if (crypt_type == AUTH_CRYPT_BIGCRYPT) {
+-	    if (strcmp(pw_epasswd, bigcrypt(pass, pw_epasswd)) == 0)
+-		debug_return_int(AUTH_SUCCESS);
+-	} else if (crypt_type == AUTH_CRYPT_CRYPT16) {
+-	    if (strcmp(pw_epasswd, crypt(pass, pw_epasswd)) == 0)
+-		debug_return_int(AUTH_SUCCESS);
+-	}
++# ifdef HAVE_DISPCRYPT
++	epass = dispcrypt(pass, pw_epasswd, crypt_type);
++# else
++	if (crypt_type == AUTH_CRYPT_BIGCRYPT)
++	    epass = bigcrypt(pass, pw_epasswd);
++	else if (crypt_type == AUTH_CRYPT_CRYPT16)
++	    epass = crypt(pass, pw_epasswd);
+     }
+-#  endif /* HAVE_DISPCRYPT */
++# endif /* HAVE_DISPCRYPT */
+ #elif defined(HAVE_BIGCRYPT)
+-    if (strcmp(pw_epasswd, bigcrypt(pass, pw_epasswd)) == 0)
+-	debug_return_int(AUTH_SUCCESS);
++    epass = bigcrypt(pass, pw_epasswd);
+ #endif /* __alpha */
+ 
+-	debug_return_int(AUTH_FAILURE);
++    if (epass != NULL && strcmp(pw_epasswd, epass) == 0)
++	debug_return_int(AUTH_SUCCESS);
++    debug_return_int(AUTH_FAILURE);
+ }
+ 
+ int
-- 
1.7.10.4



