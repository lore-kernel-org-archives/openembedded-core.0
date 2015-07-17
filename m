Return-Path: <amarnath.valluri@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5DE70758E6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 08:52:57 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 17 Jul 2015 01:52:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,494,1432623600"; d="scan'208";a="766220975"
Received: from theory.fi.intel.com ([10.237.72.51])
	by orsmga002.jf.intel.com with ESMTP; 17 Jul 2015 01:52:56 -0700
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jul 2015 11:53:24 +0300
Message-Id: <1437123204-3096-1-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCH] libpam: Upgrade v1.1.6 -> v1.2.1
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
X-List-Received-Date: Fri, 17 Jul 2015 08:52:59 -0000

Dropped upstreamed patches(commit-id):
- add-checks-for-crypt-returning-NULL.patch(8dc056c)
- destdirfix.patch(d7e6b92)
- libpam-fix-for-CVE-2010-4708.patch(4c430f6)

Dropped backported patches(commit-id):
- pam_timestamp-fix-potential-directory-traversal-issu.patch(9dcead8)
- reflect-the-enforce_for_root-semantics-change-in-pam.patch(bd07ad3)

Forward ported patches:
- pam-unix-nullok-secure.patch
- crypt_configure.patch

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 .../add-checks-for-crypt-returning-NULL.patch      |  63 ------
 .../pam/libpam/crypt_configure.patch               |   4 +-
 meta/recipes-extended/pam/libpam/destdirfix.patch  |  24 ---
 .../pam/libpam/libpam-fix-for-CVE-2010-4708.patch  |  41 ----
 .../pam/libpam/pam-unix-nullok-secure.patch        | 226 +++++++++++----------
 ...mp-fix-potential-directory-traversal-issu.patch |  63 ------
 ...-enforce_for_root-semantics-change-in-pam.patch |  35 ----
 .../pam/{libpam_1.1.6.bb => libpam_1.2.1.bb}       |  10 +-
 8 files changed, 127 insertions(+), 339 deletions(-)
 delete mode 100644 meta/recipes-extended/pam/libpam/add-checks-for-crypt-returning-NULL.patch
 delete mode 100644 meta/recipes-extended/pam/libpam/destdirfix.patch
 delete mode 100644 meta/recipes-extended/pam/libpam/libpam-fix-for-CVE-2010-4708.patch
 delete mode 100644 meta/recipes-extended/pam/libpam/pam_timestamp-fix-potential-directory-traversal-issu.patch
 delete mode 100644 meta/recipes-extended/pam/libpam/reflect-the-enforce_for_root-semantics-change-in-pam.patch
 rename meta/recipes-extended/pam/{libpam_1.1.6.bb => libpam_1.2.1.bb} (93%)

diff --git a/meta/recipes-extended/pam/libpam/add-checks-for-crypt-returning-NULL.patch b/meta/recipes-extended/pam/libpam/add-checks-for-crypt-returning-NULL.patch
deleted file mode 100644
index d364cea..0000000
--- a/meta/recipes-extended/pam/libpam/add-checks-for-crypt-returning-NULL.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-Backport from linux-pam git repo.
-
-[YOCTO #4107]
-
-Upstream-Status: Backport
-
-Signed-off-by: Kang Kai <kai.kang@windriver.com>
-
-From 8dc056c1c8bc7acb66c4decc49add2c3a24e6310 Mon Sep 17 00:00:00 2001
-From: Tomas Mraz <tmraz@fedoraproject.org>
-Date: Fri, 8 Feb 2013 15:04:26 +0100
-Subject: [PATCH] Add checks for crypt() returning NULL.
-
-modules/pam_pwhistory/opasswd.c (compare_password): Add check for crypt() NULL return.
-modules/pam_unix/bigcrypt.c (bigcrypt): Likewise.
----
- modules/pam_pwhistory/opasswd.c |    2 +-
- modules/pam_unix/bigcrypt.c     |    9 +++++++++
- 2 files changed, 10 insertions(+), 1 deletions(-)
-
-diff --git a/modules/pam_pwhistory/opasswd.c b/modules/pam_pwhistory/opasswd.c
-index 274fdb9..836d713 100644
---- a/modules/pam_pwhistory/opasswd.c
-+++ b/modules/pam_pwhistory/opasswd.c
-@@ -108,7 +108,7 @@ compare_password(const char *newpass, const char *oldpass)
-   outval = crypt (newpass, oldpass);
- #endif
- 
--  return strcmp(outval, oldpass) == 0;
-+  return outval != NULL && strcmp(outval, oldpass) == 0;
- }
- 
- /* Check, if the new password is already in the opasswd file.  */
-diff --git a/modules/pam_unix/bigcrypt.c b/modules/pam_unix/bigcrypt.c
-index e10d1c5..e1d57a0 100644
---- a/modules/pam_unix/bigcrypt.c
-+++ b/modules/pam_unix/bigcrypt.c
-@@ -109,6 +109,10 @@ char *bigcrypt(const char *key, const char *salt)
- #else
- 	tmp_ptr = crypt(plaintext_ptr, salt);	/* libc crypt() */
- #endif
-+	if (tmp_ptr == NULL) {
-+		free(dec_c2_cryptbuf);
-+		return NULL;
-+	}
- 	/* and place in the static area */
- 	strncpy(cipher_ptr, tmp_ptr, 13);
- 	cipher_ptr += ESEGMENT_SIZE + SALT_SIZE;
-@@ -130,6 +134,11 @@ char *bigcrypt(const char *key, const char *salt)
- #else
- 			tmp_ptr = crypt(plaintext_ptr, salt_ptr);
- #endif
-+			if (tmp_ptr == NULL) {
-+				_pam_overwrite(dec_c2_cryptbuf);
-+				free(dec_c2_cryptbuf);
-+				return NULL;
-+			}
- 
- 			/* skip the salt for seg!=0 */
- 			strncpy(cipher_ptr, (tmp_ptr + SALT_SIZE), ESEGMENT_SIZE);
--- 
-1.7.5.4
-
diff --git a/meta/recipes-extended/pam/libpam/crypt_configure.patch b/meta/recipes-extended/pam/libpam/crypt_configure.patch
index efa82fb..bec82a5 100644
--- a/meta/recipes-extended/pam/libpam/crypt_configure.patch
+++ b/meta/recipes-extended/pam/libpam/crypt_configure.patch
@@ -16,8 +16,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Index: Linux-PAM-1.1.6/configure.in
 ===================================================================
---- Linux-PAM-1.1.6.org/configure.in
-+++ Linux-PAM-1.1.6/configure.in
+--- Linux-PAM-1.1.6.org/configure.ac
++++ Linux-PAM-1.1.6/configure.ac
 @@ -400,7 +400,9 @@ AS_IF([test "x$ac_cv_header_xcrypt_h" =
    [crypt_libs="crypt"])
  
diff --git a/meta/recipes-extended/pam/libpam/destdirfix.patch b/meta/recipes-extended/pam/libpam/destdirfix.patch
deleted file mode 100644
index 52145ec..0000000
--- a/meta/recipes-extended/pam/libpam/destdirfix.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Avoid the failure:
-
-| mkdir -p /etc/security/namespace.d
-| mkdir: cannot create directory `/etc/security/namespace.d': Permission denied
-
-if /etc/security/namespace.d doesn't exist. The DESTDIR prefix is missing.
-
-RP 2012/8/19
-
-Upstream-Status: Pending
-
-Index: Linux-PAM-1.1.6/modules/pam_namespace/Makefile.am
-===================================================================
---- Linux-PAM-1.1.6.orig/modules/pam_namespace/Makefile.am	2012-08-15 11:08:43.000000000 +0000
-+++ Linux-PAM-1.1.6/modules/pam_namespace/Makefile.am	2012-08-19 12:25:32.311038943 +0000
-@@ -40,7 +40,7 @@
-   secureconf_SCRIPTS = namespace.init
- 
- install-data-local:
--	mkdir -p $(namespaceddir)
-+	mkdir -p $(DESTDIR)$(namespaceddir)
- endif
- 
- 
diff --git a/meta/recipes-extended/pam/libpam/libpam-fix-for-CVE-2010-4708.patch b/meta/recipes-extended/pam/libpam/libpam-fix-for-CVE-2010-4708.patch
deleted file mode 100644
index 5d2b69a..0000000
--- a/meta/recipes-extended/pam/libpam/libpam-fix-for-CVE-2010-4708.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-Upstream-Status: Backport
-
-Fix for CVE-2010-4708
-
-Change default for user_readenv to 0 and document the 
-new default for user_readenv.
-
-This fix is got from:
-http://pam.cvs.sourceforge.net/viewvc/pam/Linux-PAM/modules/pam_env
-/pam_env.c?r1=1.22&r2=1.23&view=patch
-http://pam.cvs.sourceforge.net/viewvc/pam/Linux-PAM/modules/pam_env
-/pam_env.8.xml?r1=1.7&r2=1.8&view=patch
-
-Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
-
----
---- a/modules/pam_env/pam_env.c	2012-09-05 13:57:47.000000000 +0800
-+++ b/modules/pam_env/pam_env.c	2012-09-05 13:58:05.000000000 +0800
-@@ -10,7 +10,7 @@
- #define DEFAULT_READ_ENVFILE    1
- 
- #define DEFAULT_USER_ENVFILE    ".pam_environment"
--#define DEFAULT_USER_READ_ENVFILE 1
-+#define DEFAULT_USER_READ_ENVFILE 0
- 
- #include "config.h"
- 
---- a/modules/pam_env/pam_env.8.xml	2012-09-05 13:58:24.000000000 +0800
-+++ b/modules/pam_env/pam_env.8.xml	2012-09-05 13:59:36.000000000 +0800
-@@ -147,7 +147,10 @@
-         <listitem>
-           <para>
-             Turns on or off the reading of the user specific environment
--            file. 0 is off, 1 is on. By default this option is on.
-+            file. 0 is off, 1 is on. By default this option is off as user
-+            supplied environment variables in the PAM environment could affect
-+            behavior of subsequent modules in the stack without the consent
-+            of the system administrator.
-           </para>
-         </listitem>
-       </varlistentry>
diff --git a/meta/recipes-extended/pam/libpam/pam-unix-nullok-secure.patch b/meta/recipes-extended/pam/libpam/pam-unix-nullok-secure.patch
index b285e96..423267f 100644
--- a/meta/recipes-extended/pam/libpam/pam-unix-nullok-secure.patch
+++ b/meta/recipes-extended/pam/libpam/pam-unix-nullok-secure.patch
@@ -1,6 +1,9 @@
-Debian patch to add a new 'nullok_secure' option to pam_unix, which
-accepts users with null passwords only when the applicant is connected
-from a tty listed in /etc/securetty.
+From 9bdc197474795f2d000c2bc04f58f7cef8898f21 Mon Sep 17 00:00:00 2001
+From: Amarnath Valluri <amarnath.valluri@intel.com>
+Date: Wed, 15 Jul 2015 13:07:20 +0300
+Subject: [PATCH] Debian patch to add a new 'nullok_secure' option to pam_unix,
+ which accepts users with null passwords only when the applicant is connected
+ from a tty listed in /etc/securetty.
 
 Authors: Sam Hartman <hartmans@debian.org>,
          Steve Langasek <vorlon@debian.org>
@@ -8,10 +11,24 @@ Authors: Sam Hartman <hartmans@debian.org>,
 Upstream-Status: Pending
 
 Signed-off-by: Ming Liu <ming.liu@windriver.com>
-===================================================================
-diff -urpN a/modules/pam_unix/Makefile.am b/modules/pam_unix/Makefile.am
---- a/modules/pam_unix/Makefile.am	2013-07-05 09:51:31.014483164 +0800
-+++ b/modules/pam_unix/Makefile.am	2013-07-05 10:26:12.884484000 +0800
+
+v2:
+	- Forward ported from v1.1.6 to v1.2.1
+
+Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
+---
+ modules/pam_unix/Makefile.am    |  3 ++-
+ modules/pam_unix/README         | 11 ++++++++++-
+ modules/pam_unix/pam_unix.8     |  9 ++++++++-
+ modules/pam_unix/pam_unix.8.xml | 19 ++++++++++++++++++-
+ modules/pam_unix/support.c      | 40 +++++++++++++++++++++++++++++++++++-----
+ modules/pam_unix/support.h      |  8 ++++++--
+ 6 files changed, 79 insertions(+), 11 deletions(-)
+
+diff --git a/modules/pam_unix/Makefile.am b/modules/pam_unix/Makefile.am
+index 56ed591..9a372ac 100644
+--- a/modules/pam_unix/Makefile.am
++++ b/modules/pam_unix/Makefile.am
 @@ -30,7 +30,8 @@ if HAVE_VERSIONING
    pam_unix_la_LDFLAGS += -Wl,--version-script=$(srcdir)/../modules.map
  endif
@@ -22,10 +39,33 @@ diff -urpN a/modules/pam_unix/Makefile.am b/modules/pam_unix/Makefile.am
  
  securelib_LTLIBRARIES = pam_unix.la
  
-diff -urpN a/modules/pam_unix/pam_unix.8 b/modules/pam_unix/pam_unix.8
---- a/modules/pam_unix/pam_unix.8	2013-07-05 09:52:16.825108201 +0800
-+++ b/modules/pam_unix/pam_unix.8	2013-07-05 10:28:34.724483774 +0800
-@@ -220,7 +220,14 @@ A little more extreme than debug\&.
+diff --git a/modules/pam_unix/README b/modules/pam_unix/README
+index 3935dba..7880d91 100644
+--- a/modules/pam_unix/README
++++ b/modules/pam_unix/README
+@@ -67,7 +67,16 @@ nullok
+ 
+     The default action of this module is to not permit the user access to a
+     service if their official password is blank. The nullok argument overrides
+-    this default.
++    this default and allows any user with a blank password to access the
++    service.
++
++nullok_secure
++
++    The default action of this module is to not permit the user access to a
++    service if their official password is blank. The nullok_secure argument
++    overrides this default and allows any user with a blank password to access
++    the service as long as the value of PAM_TTY is set to one of the values
++    found in /etc/securetty.
+ 
+ try_first_pass
+ 
+diff --git a/modules/pam_unix/pam_unix.8 b/modules/pam_unix/pam_unix.8
+index 339178b..a4bd906 100644
+--- a/modules/pam_unix/pam_unix.8
++++ b/modules/pam_unix/pam_unix.8
+@@ -92,7 +92,14 @@ Turns off informational messages namely messages about session open and close vi
  .RS 4
  The default action of this module is to not permit the user access to a service if their official password is blank\&. The
  \fBnullok\fR
@@ -41,10 +81,11 @@ diff -urpN a/modules/pam_unix/pam_unix.8 b/modules/pam_unix/pam_unix.8
  .RE
  .PP
  \fBtry_first_pass\fR
-diff -urpN a/modules/pam_unix/pam_unix.8.xml b/modules/pam_unix/pam_unix.8.xml
---- a/modules/pam_unix/pam_unix.8.xml	2013-07-05 09:52:38.775108523 +0800
-+++ b/modules/pam_unix/pam_unix.8.xml	2013-07-05 10:30:23.084483630 +0800
-@@ -135,7 +135,24 @@
+diff --git a/modules/pam_unix/pam_unix.8.xml b/modules/pam_unix/pam_unix.8.xml
+index a8b64bb..1ced6f4 100644
+--- a/modules/pam_unix/pam_unix.8.xml
++++ b/modules/pam_unix/pam_unix.8.xml
+@@ -159,7 +159,24 @@
            <para>
              The default action of this module is to not permit the
              user access to a service if their official password is blank.
@@ -70,36 +111,15 @@ diff -urpN a/modules/pam_unix/pam_unix.8.xml b/modules/pam_unix/pam_unix.8.xml
            </para>
          </listitem>
        </varlistentry>
-diff -urpN a/modules/pam_unix/README b/modules/pam_unix/README
---- a/modules/pam_unix/README	2013-07-05 09:51:52.205107846 +0800
-+++ b/modules/pam_unix/README	2013-07-05 10:27:10.774484537 +0800
-@@ -57,7 +57,16 @@ nullok
- 
-     The default action of this module is to not permit the user access to a
-     service if their official password is blank. The nullok argument overrides
--    this default.
-+    this default and allows any user with a blank password to access the
-+    service.
-+
-+nullok_secure
-+
-+    The default action of this module is to not permit the user access to a
-+    service if their official password is blank. The nullok_secure argument
-+    overrides this default and allows any user with a blank password to access
-+    the service as long as the value of PAM_TTY is set to one of the values
-+    found in /etc/securetty.
- 
- try_first_pass
- 
-diff -urpN a/modules/pam_unix/support.c b/modules/pam_unix/support.c
---- a/modules/pam_unix/support.c	2013-07-05 09:50:49.134482523 +0800
-+++ b/modules/pam_unix/support.c	2013-07-05 09:56:26.924484267 +0800
-@@ -84,14 +84,22 @@ int _set_ctrl(pam_handle_t *pamh, int fl
+diff --git a/modules/pam_unix/support.c b/modules/pam_unix/support.c
+index abccd82..2361957 100644
+--- a/modules/pam_unix/support.c
++++ b/modules/pam_unix/support.c
+@@ -189,13 +189,22 @@ int _set_ctrl(pam_handle_t *pamh, int flags, int *remember, int *rounds,
  	/* now parse the arguments to this module */
  
  	for (; argc-- > 0; ++argv) {
--		int j;
-+		int j, sl;
++		int sl;
  
  		D(("pam_unix arg: %s", *argv));
  
@@ -108,48 +128,46 @@ diff -urpN a/modules/pam_unix/support.c b/modules/pam_unix/support.c
 -			    && !strncmp(*argv, unix_args[j].token, strlen(unix_args[j].token))) {
 -				break;
 +			if (unix_args[j].token) {
-+			    sl = strlen(unix_args[j].token);
-+			    if (unix_args[j].token[sl-1] == '=') {
-+				/* exclude argument from comparison */
-+				if (!strncmp(*argv, unix_args[j].token, sl))
-+				    break;
-+			    } else {
++				sl = strlen(unix_args[j].token);
++				if (unix_args[j].token[sl-1] == '=') {
++					/* exclude argument from comparison */
++					if (!strncmp(*argv, unix_args[j].token, sl))
++						break;
++				} else {
 +				/* compare full strings */
-+				if (!strcmp(*argv, unix_args[j].token))
-+				    break;
-+			    }
++					if (!strcmp(*argv, unix_args[j].token))
++						break;
++				}
  			}
  		}
  
-@@ -461,6 +469,7 @@ static int _unix_run_helper_binary(pam_h
-     child = fork();
+@@ -566,6 +575,7 @@ static int _unix_run_helper_binary(pam_handle_t *pamh, const char *passwd,
      if (child == 0) {
-         int i=0;
-+        int nullok = off(UNIX__NONULL, ctrl);
-         struct rlimit rlim;
  	static char *envp[] = { NULL };
- 	char *args[] = { NULL, NULL, NULL, NULL };
-@@ -488,7 +497,18 @@ static int _unix_run_helper_binary(pam_h
+ 	const char *args[] = { NULL, NULL, NULL, NULL };
++	int nullok = off(UNIX__NONULL, ctrl);
+ 
+ 	/* XXX - should really tidy up PAM here too */
+ 
+@@ -593,7 +603,16 @@ static int _unix_run_helper_binary(pam_handle_t *pamh, const char *passwd,
  	/* exec binary helper */
- 	args[0] = strdup(CHKPWD_HELPER);
- 	args[1] = x_strdup(user);
+ 	args[0] = CHKPWD_HELPER;
+ 	args[1] = user;
 -	if (off(UNIX__NONULL, ctrl)) {	/* this means we've succeeded */
-+
 +	if (on(UNIX_NULLOK_SECURE, ctrl)) {
-+	    const void *uttyname;
-+	    retval = pam_get_item(pamh, PAM_TTY, &uttyname);
-+	    if (retval != PAM_SUCCESS || uttyname == NULL
-+	        || _pammodutil_tty_secure(pamh, (const char *)uttyname) != PAM_SUCCESS)
-+	    {
-+	        nullok = 0;
-+	    }
++		const void *uttyname;
++		retval = pam_get_item(pamh, PAM_TTY, &uttyname);
++		if (retval != PAM_SUCCESS || uttyname == NULL
++			|| _pammodutil_tty_secure(pamh, (const char *)uttyname) != PAM_SUCCESS) {
++			nullok = 0;
++		}
 +	}
 +
 +	if (nullok) {
- 	  args[2]=strdup("nullok");
+ 	  args[2]="nullok";
  	} else {
- 	  args[2]=strdup("nonull");
-@@ -567,6 +587,17 @@ _unix_blankpasswd (pam_handle_t *pamh, u
+ 	  args[2]="nonull";
+@@ -678,6 +697,17 @@ _unix_blankpasswd (pam_handle_t *pamh, unsigned int ctrl, const char *name)
  	if (on(UNIX__NONULL, ctrl))
  		return 0;	/* will fail but don't let on yet */
  
@@ -167,56 +185,56 @@ diff -urpN a/modules/pam_unix/support.c b/modules/pam_unix/support.c
  	/* UNIX passwords area */
  
  	retval = get_pwd_hash(pamh, name, &pwd, &salt);
-@@ -653,7 +684,8 @@ int _unix_verify_password(pam_handle_t *
+@@ -764,7 +794,7 @@ int _unix_verify_password(pam_handle_t * pamh, const char *name
  			}
  		}
  	} else {
 -		retval = verify_pwd_hash(p, salt, off(UNIX__NONULL, ctrl));
-+		retval = verify_pwd_hash(p, salt,
-+		                         _unix_blankpasswd(pamh, ctrl, name));
++		retval = verify_pwd_hash(p, salt, _unix_blankpasswd(pamh, ctrl, name));
  	}
  
  	if (retval == PAM_SUCCESS) {
-diff -urpN a/modules/pam_unix/support.h b/modules/pam_unix/support.h
---- a/modules/pam_unix/support.h	2013-07-05 09:51:10.385107934 +0800
-+++ b/modules/pam_unix/support.h	2013-07-05 10:23:54.815107842 +0800
-@@ -90,8 +90,9 @@ typedef struct {
- 					   password hash algorithms */
- #define UNIX_BLOWFISH_PASS       26	/* new password hashes will use blowfish */
+diff --git a/modules/pam_unix/support.h b/modules/pam_unix/support.h
+index 3729ce0..43cdbea 100644
+--- a/modules/pam_unix/support.h
++++ b/modules/pam_unix/support.h
+@@ -99,8 +99,9 @@ typedef struct {
  #define UNIX_MIN_PASS_LEN        27	/* min length for password */
-+#define UNIX_NULLOK_SECURE       28	/* NULL passwords allowed only on secure ttys */
+ #define UNIX_QUIET		 28	/* Don't print informational messages */
+ #define UNIX_DES                 29     /* DES, default */
++#define UNIX_NULLOK_SECURE       30     /* NULL passwords allowed only on secure ttys */
  /* -------------- */
--#define UNIX_CTRLS_              28	/* number of ctrl arguments defined */
-+#define UNIX_CTRLS_              29	/* number of ctrl arguments defined */
+-#define UNIX_CTRLS_              30	/* number of ctrl arguments defined */
++#define UNIX_CTRLS_              31	/* number of ctrl arguments defined */
  
  #define UNIX_DES_CRYPT(ctrl)	(off(UNIX_MD5_PASS,ctrl)&&off(UNIX_BIGCRYPT,ctrl)&&off(UNIX_SHA256_PASS,ctrl)&&off(UNIX_SHA512_PASS,ctrl)&&off(UNIX_BLOWFISH_PASS,ctrl))
  
-@@ -109,7 +110,7 @@ static const UNIX_Ctrls unix_args[UNIX_C
- /* UNIX_NOT_SET_PASS */    {"not_set_pass",    _ALL_ON_,                0100},
- /* UNIX__PRELIM */         {NULL,              _ALL_ON_^(0600),         0200},
- /* UNIX__UPDATE */         {NULL,              _ALL_ON_^(0600),         0400},
--/* UNIX__NONULL */         {NULL,              _ALL_ON_,               01000},
-+/* UNIX__NONULL */         {NULL,              _ALL_ON_^(0x10000000),  0x200},
- /* UNIX__QUIET */          {NULL,              _ALL_ON_,               02000},
- /* UNIX_USE_AUTHTOK */     {"use_authtok",     _ALL_ON_,               04000},
- /* UNIX_SHADOW */          {"shadow",          _ALL_ON_,              010000},
-@@ -127,7 +128,8 @@ static const UNIX_Ctrls unix_args[UNIX_C
- /* UNIX_SHA512_PASS */     {"sha512",       _ALL_ON_^(0260420000), 040000000},
- /* UNIX_ALGO_ROUNDS */     {"rounds=",         _ALL_ON_,          0100000000},
- /* UNIX_BLOWFISH_PASS */   {"blowfish",    _ALL_ON_^(0260420000), 0200000000},
--/* UNIX_MIN_PASS_LEN */    {"minlen=",		_ALL_ON_,          0400000000},
-+/* UNIX_MIN_PASS_LEN */    {"minlen=",	        _ALL_ON_,          0400000000},
-+/* UNIX_NULLOK_SECURE */   {"nullok_secure",   _ALL_ON_^(0x200),  0x10000000},
+@@ -118,7 +119,7 @@ static const UNIX_Ctrls unix_args[UNIX_CTRLS_] =
+ /* UNIX_NOT_SET_PASS */    {"not_set_pass",    _ALL_ON_,                0100, 0},
+ /* UNIX__PRELIM */         {NULL,              _ALL_ON_^(0600),         0200, 0},
+ /* UNIX__UPDATE */         {NULL,              _ALL_ON_^(0600),         0400, 0},
+-/* UNIX__NONULL */         {NULL,              _ALL_ON_,               01000, 0},
++/* UNIX__NONULL */         {NULL,              _ALL_ON_^(0x10000000),   0200, 0},
+ /* UNIX__QUIET */          {NULL,              _ALL_ON_,               02000, 0},
+ /* UNIX_USE_AUTHTOK */     {"use_authtok",     _ALL_ON_,               04000, 0},
+ /* UNIX_SHADOW */          {"shadow",          _ALL_ON_,              010000, 0},
+@@ -139,6 +140,7 @@ static const UNIX_Ctrls unix_args[UNIX_CTRLS_] =
+ /* UNIX_MIN_PASS_LEN */    {"minlen=",		_ALL_ON_,         0400000000, 0},
+ /* UNIX_QUIET */           {"quiet",           _ALL_ON_,         01000000000, 0},
+ /* UNIX_DES */             {"des",             _ALL_ON_^(0260420000),      0, 1},
++/* UNIX_NULLOK_SECURE */   {"nullok_secure",   _ALL_ON_^(0x200),  0x10000000, 0},
  };
  
  #define UNIX_DEFAULTS  (unix_args[UNIX__NONULL].flag)
-@@ -163,6 +165,9 @@ extern int _unix_read_password(pam_handl
+@@ -171,6 +173,8 @@ extern int _unix_read_password(pam_handle_t * pamh
+ 			,const char *prompt2
  			,const char *data_name
  			,const void **pass);
- 
 +extern int _pammodutil_tty_secure(const pam_handle_t *pamh,
-+				  const char *uttyname);
-+
++         const char *uttyname);
+ 
  extern int _unix_run_verify_binary(pam_handle_t *pamh,
  			unsigned int ctrl, const char *user, int *daysleft);
- #endif /* _PAM_UNIX_SUPPORT_H */
+-- 
+2.1.4
+
diff --git a/meta/recipes-extended/pam/libpam/pam_timestamp-fix-potential-directory-traversal-issu.patch b/meta/recipes-extended/pam/libpam/pam_timestamp-fix-potential-directory-traversal-issu.patch
deleted file mode 100644
index 06cca13..0000000
--- a/meta/recipes-extended/pam/libpam/pam_timestamp-fix-potential-directory-traversal-issu.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 9dcead87e6d7f66d34e7a56d11a30daca367dffb Mon Sep 17 00:00:00 2001
-From: "Dmitry V. Levin" <ldv@altlinux.org>
-Date: Wed, 26 Mar 2014 22:17:23 +0000
-Subject: [PATCH] pam_timestamp: fix potential directory traversal issue
- (ticket #27)
-
-commit 9dcead87e6d7f66d34e7a56d11a30daca367dffb upstream
-
-pam_timestamp uses values of PAM_RUSER and PAM_TTY as components of
-the timestamp pathname it creates, so extra care should be taken to
-avoid potential directory traversal issues.
-
-* modules/pam_timestamp/pam_timestamp.c (check_tty): Treat
-"." and ".." tty values as invalid.
-(get_ruser): Treat "." and ".." ruser values, as well as any ruser
-value containing '/', as invalid.
-
-Fixes CVE-2014-2583.
-
-Reported-by: Sebastian Krahmer <krahmer@suse.de>
-
-Upstream-Status: Backport
-
-Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
-Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
----
- modules/pam_timestamp/pam_timestamp.c |   13 ++++++++++++-
- 1 files changed, 12 insertions(+), 1 deletions(-)
-
-diff --git a/modules/pam_timestamp/pam_timestamp.c b/modules/pam_timestamp/pam_timestamp.c
-index 5193733..b3f08b1 100644
---- a/modules/pam_timestamp/pam_timestamp.c
-+++ b/modules/pam_timestamp/pam_timestamp.c
-@@ -158,7 +158,7 @@ check_tty(const char *tty)
- 		tty = strrchr(tty, '/') + 1;
- 	}
- 	/* Make sure the tty wasn't actually a directory (no basename). */
--	if (strlen(tty) == 0) {
-+	if (!strlen(tty) || !strcmp(tty, ".") || !strcmp(tty, "..")) {
- 		return NULL;
- 	}
- 	return tty;
-@@ -243,6 +243,17 @@ get_ruser(pam_handle_t *pamh, char *ruserbuf, size_t ruserbuflen)
- 		if (pwd != NULL) {
- 			ruser = pwd->pw_name;
- 		}
-+	} else {
-+		/*
-+		 * This ruser is used by format_timestamp_name as a component
-+		 * of constructed timestamp pathname, so ".", "..", and '/'
-+		 * are disallowed to avoid potential path traversal issues.
-+		 */
-+		if (!strcmp(ruser, ".") ||
-+		    !strcmp(ruser, "..") ||
-+		    strchr(ruser, '/')) {
-+			ruser = NULL;
-+		}
- 	}
- 	if (ruser == NULL || strlen(ruser) >= ruserbuflen) {
- 		*ruserbuf = '\0';
--- 
-1.7.5.4
-
diff --git a/meta/recipes-extended/pam/libpam/reflect-the-enforce_for_root-semantics-change-in-pam.patch b/meta/recipes-extended/pam/libpam/reflect-the-enforce_for_root-semantics-change-in-pam.patch
deleted file mode 100644
index c13535e..0000000
--- a/meta/recipes-extended/pam/libpam/reflect-the-enforce_for_root-semantics-change-in-pam.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-Backport from linux-pam git repo.
-
-[YOCTO #4107]
-
-Upstream-Status: Backport
-
-Signed-off-by: Kang Kai <kai.kang@windriver.com>
-
-From bd07ad3adc626f842a4391d256541883426fd389 Mon Sep 17 00:00:00 2001
-From: Tomas Mraz <tmraz@fedoraproject.org>
-Date: Tue, 13 Nov 2012 09:19:05 +0100
-Subject: [PATCH] Reflect the enforce_for_root semantics change in
- pam_pwhistory xtest.
-
-xtests/tst-pam_pwhistory1.pamd: Use enforce_for_root as the test is
-running with real uid == 0.
----
- xtests/tst-pam_pwhistory1.pamd | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/xtests/tst-pam_pwhistory1.pamd b/xtests/tst-pam_pwhistory1.pamd
-index 68e1b94..d60db7c 100644
---- a/xtests/tst-pam_pwhistory1.pamd
-+++ b/xtests/tst-pam_pwhistory1.pamd
-@@ -1,6 +1,6 @@
- #%PAM-1.0
- auth     required       pam_permit.so
- account  required       pam_permit.so
--password required	pam_pwhistory.so remember=10 retry=1
-+password required	pam_pwhistory.so remember=10 retry=1 enforce_for_root
- password required	pam_unix.so	use_authtok md5
- session  required       pam_permit.so
--- 
-1.7.11.7
-
diff --git a/meta/recipes-extended/pam/libpam_1.1.6.bb b/meta/recipes-extended/pam/libpam_1.2.1.bb
similarity index 93%
rename from meta/recipes-extended/pam/libpam_1.1.6.bb
rename to meta/recipes-extended/pam/libpam_1.2.1.bb
index d347bdc..ac3097e 100644
--- a/meta/recipes-extended/pam/libpam_1.1.6.bb
+++ b/meta/recipes-extended/pam/libpam_1.2.1.bb
@@ -18,19 +18,15 @@ SRC_URI = "http://linux-pam.org/library/Linux-PAM-${PV}.tar.bz2 \
            file://pam.d/common-session-noninteractive \
            file://pam.d/other \
            file://libpam-xtests.patch \
-           file://destdirfix.patch \
            file://fixsepbuild.patch \
-           file://reflect-the-enforce_for_root-semantics-change-in-pam.patch \
-           file://add-checks-for-crypt-returning-NULL.patch \
-           file://libpam-fix-for-CVE-2010-4708.patch \
            file://pam-security-abstract-securetty-handling.patch \
            file://pam-unix-nullok-secure.patch \
-           file://pam_timestamp-fix-potential-directory-traversal-issu.patch \
            file://libpam-xtests-remove-bash-dependency.patch \
            file://crypt_configure.patch \
           "
-SRC_URI[md5sum] = "7b73e58b7ce79ffa321d408de06db2c4"
-SRC_URI[sha256sum] = "bab887d6280f47fc3963df3b95735a27a16f0f663636163ddf3acab5f1149fc2"
+
+SRC_URI[md5sum] = "9dc53067556d2dd567808fd509519dd6"
+SRC_URI[sha256sum] = "342b1211c0d3b203a7df2540a5b03a428a087bd8a48c17e49ae268f992b334d9"
 
 SRC_URI_append_libc-uclibc = " file://pam-no-innetgr.patch"
 SRC_URI_append_libc-musl = " file://pam-no-innetgr.patch"
-- 
2.1.4

---------------------------------------------------------------------
Intel Finland Oy
Registered Address: PL 281, 00181 Helsinki 
Business Identity Code: 0357606 - 4 
Domiciled in Helsinki 

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


