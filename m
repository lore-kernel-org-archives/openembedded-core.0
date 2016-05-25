Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 14135606BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 14:09:06 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 25 May 2016 07:06:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,364,1459839600"; d="scan'208";a="708737252"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 25 May 2016 07:06:57 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 2564B6A4006
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 07:54:25 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 May 2016 17:07:39 +0300
Message-Id: <1464185260-892-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/2] libpam: update to 1.3.0
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
X-List-Received-Date: Wed, 25 May 2016 14:09:07 -0000

1.2.1 -> 1.3.0

Remove upstreamed patch:
        a) pam-no-innetgr.patch

Refreshed the following patches for 1.3.0:
        a) crypt_configure.patch
        b) pam-unix-nullok-secure.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../pam/libpam/crypt_configure.patch               |  37 ++++---
 .../pam/libpam/pam-no-innetgr.patch                |  97 -----------------
 .../pam/libpam/pam-unix-nullok-secure.patch        | 119 +++++++--------------
 .../pam/{libpam_1.2.1.bb => libpam_1.3.0.bb}       |  10 +-
 4 files changed, 64 insertions(+), 199 deletions(-)
 delete mode 100644 meta/recipes-extended/pam/libpam/pam-no-innetgr.patch
 rename meta/recipes-extended/pam/{libpam_1.2.1.bb => libpam_1.3.0.bb} (94%)

diff --git a/meta/recipes-extended/pam/libpam/crypt_configure.patch b/meta/recipes-extended/pam/libpam/crypt_configure.patch
index bec82a5..917a8af 100644
--- a/meta/recipes-extended/pam/libpam/crypt_configure.patch
+++ b/meta/recipes-extended/pam/libpam/crypt_configure.patch
@@ -1,31 +1,40 @@
+From b86575ab4a0df07da160283459da270e1c0372a0 Mon Sep 17 00:00:00 2001
+From: "Maxin B. John" <maxin.john@intel.com>
+Date: Tue, 24 May 2016 14:11:09 +0300
+Subject: [PATCH] crypt_configure
+
 This patch fixes a case where it find crypt defined in libc (musl) but
 not in specified libraries then it ends up assigning
-
 LIBCRYPT="-l" which then goes into makefile cause all sort of problems
 e.g.
 
 ld: cannot find -l-m32
 | collect2: error: ld returned 1 exit status
-
-The reason is that -l appears on commandline with out any library and
-compiler treats the next argument as library name whatever it is.
-
+The reason is that -l appears on commandline with
+out any library and compiler treats the next argument as library name
+whatever it is.
 
 Upstream-Status: Pending
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: Linux-PAM-1.1.6/configure.in
-===================================================================
---- Linux-PAM-1.1.6.org/configure.ac
-+++ Linux-PAM-1.1.6/configure.ac
-@@ -400,7 +400,9 @@ AS_IF([test "x$ac_cv_header_xcrypt_h" =
+diff --git a/configure.ac b/configure.ac
+index df39d07..e68d856 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -401,7 +401,7 @@ AS_IF([test "x$ac_cv_header_xcrypt_h" = "xyes"],
    [crypt_libs="crypt"])
  
  BACKUP_LIBS=$LIBS
--AC_SEARCH_LIBS([crypt],[$crypt_libs], LIBCRYPT="-l$ac_lib", LIBCRYPT="")
-+AC_SEARCH_LIBS([crypt],[$crypt_libs],
-+	       [test "$ac_cv_search_crypt" = "none required" ||
-+		LIBCRYPT="$ac_cv_search_crypt"])
+-AC_SEARCH_LIBS([crypt],[$crypt_libs], LIBCRYPT="${ac_lib:+-l$ac_lib}", LIBCRYPT="")
++AC_SEARCH_LIBS([crypt],[$crypt_libs], [test "$ac_cv_search_crypt" = "none required" || LIBCRYPT="$ac_cv_search_crypt"])
  AC_CHECK_FUNCS(crypt_r crypt_gensalt_r)
  LIBS=$BACKUP_LIBS
  AC_SUBST(LIBCRYPT)
+-- 
+2.4.0
+
diff --git a/meta/recipes-extended/pam/libpam/pam-no-innetgr.patch b/meta/recipes-extended/pam/libpam/pam-no-innetgr.patch
deleted file mode 100644
index 5e551ac..0000000
--- a/meta/recipes-extended/pam/libpam/pam-no-innetgr.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-innetgr may not be there so make sure that when innetgr is not present
-then we inform about it and not use it.
-
--Khem
-
-Upstream-Status: Pending
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
-Index: Linux-PAM-1.1.3/modules/pam_group/pam_group.c
-===================================================================
---- Linux-PAM-1.1.3.orig/modules/pam_group/pam_group.c
-+++ Linux-PAM-1.1.3/modules/pam_group/pam_group.c
-@@ -659,7 +659,11 @@ static int check_account(pam_handle_t *p
- 	}
- 	/* If buffer starts with @, we are using netgroups */
- 	if (buffer[0] == '@')
--	  good &= innetgr (&buffer[1], NULL, user, NULL);
-+#ifdef HAVE_INNETGR
-+           good &= innetgr (&buffer[1], NULL, user, NULL);
-+#else
-+           pam_syslog (pamh, LOG_ERR, "pam_group does not have netgroup support");
-+#endif
- 	/* otherwise, if the buffer starts with %, it's a UNIX group */
- 	else if (buffer[0] == '%')
-           good &= pam_modutil_user_in_group_nam_nam(pamh, user, &buffer[1]);
-Index: Linux-PAM-1.1.3/modules/pam_time/pam_time.c
-===================================================================
---- Linux-PAM-1.1.3.orig/modules/pam_time/pam_time.c
-+++ Linux-PAM-1.1.3/modules/pam_time/pam_time.c
-@@ -555,9 +555,13 @@ check_account(pam_handle_t *pamh, const
- 	  }
- 	  /* If buffer starts with @, we are using netgroups */
- 	  if (buffer[0] == '@')
--	    good &= innetgr (&buffer[1], NULL, user, NULL);
-+#ifdef HAVE_INNETGR
-+	       good &= innetgr (&buffer[1], NULL, user, NULL);
-+#else
-+	       pam_syslog (pamh, LOG_ERR, "pam_time does not have netgroup support");
-+#endif
- 	  else
--	    good &= logic_field(pamh, user, buffer, count, is_same);
-+	       good &= logic_field(pamh, user, buffer, count, is_same);
- 	  D(("with user: %s", good ? "passes":"fails" ));
- 
- 	  /* here we get the time field */
-Index: Linux-PAM-1.1.3/modules/pam_succeed_if/pam_succeed_if.c
-===================================================================
---- Linux-PAM-1.1.3.orig/modules/pam_succeed_if/pam_succeed_if.c
-+++ Linux-PAM-1.1.3/modules/pam_succeed_if/pam_succeed_if.c
-@@ -231,18 +231,27 @@ evaluate_notingroup(pam_handle_t *pamh,
- }
- /* Return PAM_SUCCESS if the (host,user) is in the netgroup. */
- static int
--evaluate_innetgr(const char *host, const char *user, const char *group)
-+evaluate_innetgr(const pam_handle_t* pamh, const char *host, const char *user, const char *group)
- {
-+#ifdef HAVE_INNETGR
- 	if (innetgr(group, host, user, NULL) == 1)
- 		return PAM_SUCCESS;
-+#else
-+        pam_syslog (pamh, LOG_ERR, "pam_succeed_if does not have netgroup support");
-+#endif
-+
- 	return PAM_AUTH_ERR;
- }
- /* Return PAM_SUCCESS if the (host,user) is NOT in the netgroup. */
- static int
--evaluate_notinnetgr(const char *host, const char *user, const char *group)
-+evaluate_notinnetgr(const pam_handle_t* pamh, const char *host, const char *user, const char *group)
- {
-+#ifdef HAVE_INNETGR
- 	if (innetgr(group, host, user, NULL) == 0)
- 		return PAM_SUCCESS;
-+#else
-+	pam_syslog (pamh, LOG_ERR, "pam_succeed_if does not have netgroup support");
-+#endif
- 	return PAM_AUTH_ERR;
- }
- 
-@@ -361,14 +370,14 @@ evaluate(pam_handle_t *pamh, int debug,
- 		const void *rhost;
- 		if (pam_get_item(pamh, PAM_RHOST, &rhost) != PAM_SUCCESS)
- 			rhost = NULL;
--		return evaluate_innetgr(rhost, user, right);
-+		return evaluate_innetgr(pamh, rhost, user, right);
- 	}
- 	/* (Rhost, user) is not in this group. */
- 	if (strcasecmp(qual, "notinnetgr") == 0) {
- 		const void *rhost;
- 		if (pam_get_item(pamh, PAM_RHOST, &rhost) != PAM_SUCCESS)
- 			rhost = NULL;
--		return evaluate_notinnetgr(rhost, user, right);
-+		return evaluate_notinnetgr(pamh, rhost, user, right);
- 	}
- 	/* Fail closed. */
- 	return PAM_SERVICE_ERR;
diff --git a/meta/recipes-extended/pam/libpam/pam-unix-nullok-secure.patch b/meta/recipes-extended/pam/libpam/pam-unix-nullok-secure.patch
index 3241e82..d2cc668 100644
--- a/meta/recipes-extended/pam/libpam/pam-unix-nullok-secure.patch
+++ b/meta/recipes-extended/pam/libpam/pam-unix-nullok-secure.patch
@@ -1,9 +1,11 @@
-From 9bdc197474795f2d000c2bc04f58f7cef8898f21 Mon Sep 17 00:00:00 2001
-From: Amarnath Valluri <amarnath.valluri@intel.com>
-Date: Wed, 15 Jul 2015 13:07:20 +0300
-Subject: [PATCH] Debian patch to add a new 'nullok_secure' option to pam_unix,
- which accepts users with null passwords only when the applicant is connected
- from a tty listed in /etc/securetty.
+From b6545b83f94c5fb7aec1478b8d458a1393f479c8 Mon Sep 17 00:00:00 2001
+From: "Maxin B. John" <maxin.john@intel.com>
+Date: Wed, 25 May 2016 14:12:25 +0300
+Subject: [PATCH] pam_unix: support 'nullok_secure' option
+
+Debian patch to add a new 'nullok_secure' option to pam_unix,
+which accepts users with null passwords only when the applicant is
+connected from a tty listed in /etc/securetty.
 
 Authors: Sam Hartman <hartmans@debian.org>,
          Steve Langasek <vorlon@debian.org>
@@ -11,78 +13,31 @@ Authors: Sam Hartman <hartmans@debian.org>,
 Upstream-Status: Pending
 
 Signed-off-by: Ming Liu <ming.liu@windriver.com>
-
-v2:
-	- Forward ported from v1.1.6 to v1.2.1
-
 Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
 ---
  modules/pam_unix/Makefile.am    |  3 ++-
- modules/pam_unix/README         | 11 ++++++++++-
- modules/pam_unix/pam_unix.8     |  9 ++++++++-
  modules/pam_unix/pam_unix.8.xml | 19 ++++++++++++++++++-
  modules/pam_unix/support.c      | 40 +++++++++++++++++++++++++++++++++++-----
  modules/pam_unix/support.h      |  8 ++++++--
- 6 files changed, 79 insertions(+), 11 deletions(-)
+ 4 files changed, 61 insertions(+), 9 deletions(-)
 
 diff --git a/modules/pam_unix/Makefile.am b/modules/pam_unix/Makefile.am
-index 56ed591..9a372ac 100644
+index 56df178..2bba460 100644
 --- a/modules/pam_unix/Makefile.am
 +++ b/modules/pam_unix/Makefile.am
 @@ -30,7 +30,8 @@ if HAVE_VERSIONING
    pam_unix_la_LDFLAGS += -Wl,--version-script=$(srcdir)/../modules.map
  endif
  pam_unix_la_LIBADD = $(top_builddir)/libpam/libpam.la \
--	@LIBCRYPT@ @LIBSELINUX@ $(NIS_LIBS)
-+	@LIBCRYPT@ @LIBSELINUX@ $(NIS_LIBS) \
+-	@LIBCRYPT@ @LIBSELINUX@ @TIRPC_LIBS@ @NSL_LIBS@
++	@LIBCRYPT@ @LIBSELINUX@ @TIRPC_LIBS@ @NSL_LIBS@ \
 +	../pam_securetty/tty_secure.lo
  
  securelib_LTLIBRARIES = pam_unix.la
  
-diff --git a/modules/pam_unix/README b/modules/pam_unix/README
-index 3935dba..7880d91 100644
---- a/modules/pam_unix/README
-+++ b/modules/pam_unix/README
-@@ -67,7 +67,16 @@ nullok
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
-diff --git a/modules/pam_unix/pam_unix.8 b/modules/pam_unix/pam_unix.8
-index 339178b..a4bd906 100644
---- a/modules/pam_unix/pam_unix.8
-+++ b/modules/pam_unix/pam_unix.8
-@@ -92,7 +92,14 @@ Turns off informational messages namely messages about session open and close vi
- .RS 4
- The default action of this module is to not permit the user access to a service if their official password is blank\&. The
- \fBnullok\fR
--argument overrides this default\&.
-+argument overrides this default and allows any user with a blank password to access the service\&.
-+.RE
-+.PP
-+\fBnullok_secure\fR
-+.RS 4
-+The default action of this module is to not permit the user access to a service if their official password is blank\&. The
-+\fBnullok_secure\fR
-+argument overrides this default and allows any user with a blank password to access the service as long as the value of PAM_TTY is set to one of the values found in /etc/securetty\&.
- .RE
- .PP
- \fBtry_first_pass\fR
 diff --git a/modules/pam_unix/pam_unix.8.xml b/modules/pam_unix/pam_unix.8.xml
-index a8b64bb..1ced6f4 100644
+index 1b318f1..be0330e 100644
 --- a/modules/pam_unix/pam_unix.8.xml
 +++ b/modules/pam_unix/pam_unix.8.xml
 @@ -159,7 +159,24 @@
@@ -112,10 +67,10 @@ index a8b64bb..1ced6f4 100644
          </listitem>
        </varlistentry>
 diff --git a/modules/pam_unix/support.c b/modules/pam_unix/support.c
-index abccd82..2361957 100644
+index fc8595e..29e3341 100644
 --- a/modules/pam_unix/support.c
 +++ b/modules/pam_unix/support.c
-@@ -189,13 +189,22 @@ int _set_ctrl(pam_handle_t *pamh, int flags, int *remember, int *rounds,
+@@ -183,13 +183,22 @@ int _set_ctrl(pam_handle_t *pamh, int flags, int *remember, int *rounds,
  	/* now parse the arguments to this module */
  
  	for (; argc-- > 0; ++argv) {
@@ -141,7 +96,7 @@ index abccd82..2361957 100644
  			}
  		}
  
-@@ -566,6 +575,7 @@ static int _unix_run_helper_binary(pam_handle_t *pamh, const char *passwd,
+@@ -560,6 +569,7 @@ static int _unix_run_helper_binary(pam_handle_t *pamh, const char *passwd,
      if (child == 0) {
  	static char *envp[] = { NULL };
  	const char *args[] = { NULL, NULL, NULL, NULL };
@@ -149,7 +104,7 @@ index abccd82..2361957 100644
  
  	/* XXX - should really tidy up PAM here too */
  
-@@ -593,7 +603,16 @@ static int _unix_run_helper_binary(pam_handle_t *pamh, const char *passwd,
+@@ -587,7 +597,16 @@ static int _unix_run_helper_binary(pam_handle_t *pamh, const char *passwd,
  	/* exec binary helper */
  	args[0] = CHKPWD_HELPER;
  	args[1] = user;
@@ -167,7 +122,7 @@ index abccd82..2361957 100644
  	  args[2]="nullok";
  	} else {
  	  args[2]="nonull";
-@@ -678,6 +697,17 @@ _unix_blankpasswd (pam_handle_t *pamh, unsigned int ctrl, const char *name)
+@@ -672,6 +691,17 @@ _unix_blankpasswd (pam_handle_t *pamh, unsigned int ctrl, const char *name)
  	if (on(UNIX__NONULL, ctrl))
  		return 0;	/* will fail but don't let on yet */
  
@@ -185,7 +140,7 @@ index abccd82..2361957 100644
  	/* UNIX passwords area */
  
  	retval = get_pwd_hash(pamh, name, &pwd, &salt);
-@@ -764,7 +794,7 @@ int _unix_verify_password(pam_handle_t * pamh, const char *name
+@@ -758,7 +788,7 @@ int _unix_verify_password(pam_handle_t * pamh, const char *name
  			}
  		}
  	} else {
@@ -195,46 +150,46 @@ index abccd82..2361957 100644
  
  	if (retval == PAM_SUCCESS) {
 diff --git a/modules/pam_unix/support.h b/modules/pam_unix/support.h
-index 3729ce0..43cdbea 100644
+index b4c279c..8da4a8e 100644
 --- a/modules/pam_unix/support.h
 +++ b/modules/pam_unix/support.h
-@@ -99,8 +99,9 @@ typedef struct {
- #define UNIX_MIN_PASS_LEN        27	/* min length for password */
+@@ -98,8 +98,9 @@ typedef struct {
  #define UNIX_QUIET		 28	/* Don't print informational messages */
- #define UNIX_DES                 29     /* DES, default */
-+#define UNIX_NULLOK_SECURE       30     /* NULL passwords allowed only on secure ttys */
+ #define UNIX_NO_PASS_EXPIRY      29     /* Don't check for password expiration if not used for authentication */
+ #define UNIX_DES                 30     /* DES, default */
++#define UNIX_NULLOK_SECURE       31     /* NULL passwords allowed only on secure ttys */
  /* -------------- */
--#define UNIX_CTRLS_              30	/* number of ctrl arguments defined */
-+#define UNIX_CTRLS_              31	/* number of ctrl arguments defined */
+-#define UNIX_CTRLS_              31	/* number of ctrl arguments defined */
++#define UNIX_CTRLS_              32	/* number of ctrl arguments defined */
  
  #define UNIX_DES_CRYPT(ctrl)	(off(UNIX_MD5_PASS,ctrl)&&off(UNIX_BIGCRYPT,ctrl)&&off(UNIX_SHA256_PASS,ctrl)&&off(UNIX_SHA512_PASS,ctrl)&&off(UNIX_BLOWFISH_PASS,ctrl))
  
-@@ -118,7 +119,7 @@ static const UNIX_Ctrls unix_args[UNIX_CTRLS_] =
- /* UNIX_NOT_SET_PASS */    {"not_set_pass",    _ALL_ON_,                0100, 0},
+@@ -117,7 +118,7 @@ static const UNIX_Ctrls unix_args[UNIX_CTRLS_] =
+ /* UNIX_AUTHTOK_TYPE */    {"authtok_type=",   _ALL_ON_,                0100, 0},
  /* UNIX__PRELIM */         {NULL,              _ALL_ON_^(0600),         0200, 0},
  /* UNIX__UPDATE */         {NULL,              _ALL_ON_^(0600),         0400, 0},
 -/* UNIX__NONULL */         {NULL,              _ALL_ON_,               01000, 0},
-+/* UNIX__NONULL */         {NULL,              _ALL_ON_^(02000000000),   01000, 0},
++/* UNIX__NONULL */         {NULL,              _ALL_ON_^(02000000000), 01000, 0},
  /* UNIX__QUIET */          {NULL,              _ALL_ON_,               02000, 0},
  /* UNIX_USE_AUTHTOK */     {"use_authtok",     _ALL_ON_,               04000, 0},
  /* UNIX_SHADOW */          {"shadow",          _ALL_ON_,              010000, 0},
 @@ -139,6 +140,7 @@ static const UNIX_Ctrls unix_args[UNIX_CTRLS_] =
- /* UNIX_MIN_PASS_LEN */    {"minlen=",		_ALL_ON_,         0400000000, 0},
  /* UNIX_QUIET */           {"quiet",           _ALL_ON_,         01000000000, 0},
+ /* UNIX_NO_PASS_EXPIRY */  {"no_pass_expiry",  _ALL_ON_,         02000000000, 0},
  /* UNIX_DES */             {"des",             _ALL_ON_^(0260420000),      0, 1},
-+/* UNIX_NULLOK_SECURE */   {"nullok_secure",   _ALL_ON_^(01000),  02000000000, 0},
++/* UNIX_NULLOK_SECURE */   {"nullok_secure",   _ALL_ON_^(01000), 02000000000, 0},
  };
  
  #define UNIX_DEFAULTS  (unix_args[UNIX__NONULL].flag)
-@@ -171,6 +173,8 @@ extern int _unix_read_password(pam_handle_t * pamh
- 			,const char *prompt2
+@@ -172,6 +174,8 @@ extern int _unix_read_password(pam_handle_t * pamh
  			,const char *data_name
  			,const void **pass);
-+extern int _pammodutil_tty_secure(const pam_handle_t *pamh,
-+         const char *uttyname);
  
++extern int _pammodutil_tty_secure(const pam_handle_t *pamh, const char *uttyname);
++
  extern int _unix_run_verify_binary(pam_handle_t *pamh,
  			unsigned int ctrl, const char *user, int *daysleft);
+ #endif /* _PAM_UNIX_SUPPORT_H */
 -- 
-2.1.4
+2.4.0
 
diff --git a/meta/recipes-extended/pam/libpam_1.2.1.bb b/meta/recipes-extended/pam/libpam_1.3.0.bb
similarity index 94%
rename from meta/recipes-extended/pam/libpam_1.2.1.bb
rename to meta/recipes-extended/pam/libpam_1.3.0.bb
index 341ea24..966947c 100644
--- a/meta/recipes-extended/pam/libpam_1.2.1.bb
+++ b/meta/recipes-extended/pam/libpam_1.3.0.bb
@@ -25,14 +25,12 @@ SRC_URI = "http://linux-pam.org/library/Linux-PAM-${PV}.tar.bz2 \
            file://crypt_configure.patch \
           "
 
-SRC_URI[md5sum] = "9dc53067556d2dd567808fd509519dd6"
-SRC_URI[sha256sum] = "342b1211c0d3b203a7df2540a5b03a428a087bd8a48c17e49ae268f992b334d9"
+SRC_URI[md5sum] = "da4b2289b7cfb19583d54e9eaaef1c3a"
+SRC_URI[sha256sum] = "241aed1ef522f66ed672719ecf2205ec513fd0075ed80cda8e086a5b1a01d1bb"
 
-SRC_URI_append_libc-uclibc = " file://pam-no-innetgr.patch \
-                               file://use-utmpx.patch"
+SRC_URI_append_libc-uclibc = " file://use-utmpx.patch"
 
-SRC_URI_append_libc-musl = " file://pam-no-innetgr.patch \
-                             file://0001-Add-support-for-defining-missing-funcitonality.patch \
+SRC_URI_append_libc-musl = " file://0001-Add-support-for-defining-missing-funcitonality.patch \
                              file://include_paths_header.patch \
                            "
 
-- 
2.4.0


