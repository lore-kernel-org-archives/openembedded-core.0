Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web08.2401.1609185892762996776
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 12:04:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GMsihpVq;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id cm17so10764852edb.4
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Dec 2020 12:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V4Fy0vcd43h5w1jYYoLcZQCSvZSiiN+1gGDSO1C6hdM=;
        b=GMsihpVqvlfxCChPw4YdWKagZLOeJm5x94HN3oGujjzeGvl8Oy/ddchPSFkyhljhXI
         tc56GQvJw670iT6gxBMAsI5mK7+nmMueSK4akktMzyoH/nlSXQLQ2dwj+AEEZiE8E5bW
         YP784oy0LSitPGyFpdJWuI+G6q6GE1K/AhBTsvU+zaCBD9xke8K0sF5sRldMjS2Ti3lu
         qyXL/G8lzj9Z8X1/2ejbb4ueP+qijbJbhFtiNE6phM5X9+K+qPtvPPVyZ30zUGQ6EWPa
         9ccwzQNihGCVZN1ka2YbGQNvJIzZSPPkjBogKhqBUEdY67r1cUiq4lNmLro/iacaeBSh
         NUqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V4Fy0vcd43h5w1jYYoLcZQCSvZSiiN+1gGDSO1C6hdM=;
        b=Y5PDovx0rT9Nxy0wTbBoDUBkgAJYHiMmFO6bIp5x6W1OCd259RKsrfkk/jyLcwszp+
         Qmsaun9YHyF2zr1nP2OUnDKqWD/Mq4zEc1YtWOawKfwd+hu3KdoYFGOTY4M8xmyFrS9z
         qgi41/LN7ms3hCk2YreeJC+biv9EbCAByLrqRBzOBj9nrMiSq4N0C5rONZk2e/h5D+c7
         zm+nMG+8UDsLzVBmM6iCTiNE3Vjyze1rUsUCK757v3DHAnp+Sl/Gg7fiFH8IQz227iiR
         rGz8cYw9Gc0y2xGd+vCrS6VMWbreXK9c6c/FMY9/xTO+ZUQrQXqq47aQwQwbY6KuT0LM
         6rQw==
X-Gm-Message-State: AOAM53134xhI1P9OgEwCwn+rm5R1EQQyfwv8QdjMvDjr/ThwVj4GTBXX
	CkSkLx2ac0d8ORmp+GNV88sNca3x8tU=
X-Google-Smtp-Source: ABdhPJxm2Wqv/D0zM0zzUTBVd3A8P2zS0syuTGPbPxbp1lHAo2T2Gyqwpxf00F+HmhbVdIzVHZyq7w==
X-Received: by 2002:a05:6402:697:: with SMTP id f23mr44482639edy.318.1609185891126;
        Mon, 28 Dec 2020 12:04:51 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id a10sm17447476ejk.92.2020.12.28.12.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 12:04:50 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 11/22] libpam: update 1.3.1 -> 1.5.1
Date: Mon, 28 Dec 2020 21:04:25 +0100
Message-Id: <20201228200436.78130-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201228200436.78130-1-alex.kanavin@gmail.com>
References: <20201228200436.78130-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove crypt_configure.patch, issue fixed upstream.

Remove pam-security-abstract-securetty-handling.patch and
pam-unix-nullok-secure.patch, patches coming from debian,
difficult to rebase, and their purpose is unclear.

Disable doc generation, as libpam messes up native and target
compiler options.

Adjust dependencies and packaging.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...space-Makefile.am-correctly-install-.patch |  28 +++
 .../pam/libpam/crypt_configure.patch          |  40 ----
 ...security-abstract-securetty-handling.patch | 203 ------------------
 .../pam/libpam/pam-unix-nullok-secure.patch   | 195 -----------------
 .../pam/{libpam_1.3.1.bb => libpam_1.5.1.bb}  |  17 +-
 5 files changed, 35 insertions(+), 448 deletions(-)
 create mode 100644 meta/recipes-extended/pam/libpam/0001-modules-pam_namespace-Makefile.am-correctly-install-.patch
 delete mode 100644 meta/recipes-extended/pam/libpam/crypt_configure.patch
 delete mode 100644 meta/recipes-extended/pam/libpam/pam-security-abstract-securetty-handling.patch
 delete mode 100644 meta/recipes-extended/pam/libpam/pam-unix-nullok-secure.patch
 rename meta/recipes-extended/pam/{libpam_1.3.1.bb => libpam_1.5.1.bb} (93%)

diff --git a/meta/recipes-extended/pam/libpam/0001-modules-pam_namespace-Makefile.am-correctly-install-.patch b/meta/recipes-extended/pam/libpam/0001-modules-pam_namespace-Makefile.am-correctly-install-.patch
new file mode 100644
index 0000000000..b41d1e5962
--- /dev/null
+++ b/meta/recipes-extended/pam/libpam/0001-modules-pam_namespace-Makefile.am-correctly-install-.patch
@@ -0,0 +1,28 @@
+From e2db4082f6b988f1d5803028e9e47aee5f3519ac Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Sun, 27 Dec 2020 00:30:45 +0100
+Subject: [PATCH] modules/pam_namespace/Makefile.am: correctly install systemd
+ unit file
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ modules/pam_namespace/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/modules/pam_namespace/Makefile.am b/modules/pam_namespace/Makefile.am
+index 21e1b33..ddd5fc0 100644
+--- a/modules/pam_namespace/Makefile.am
++++ b/modules/pam_namespace/Makefile.am
+@@ -18,7 +18,7 @@ TESTS = $(dist_check_SCRIPTS)
+ securelibdir = $(SECUREDIR)
+ secureconfdir = $(SCONFIGDIR)
+ namespaceddir = $(SCONFIGDIR)/namespace.d
+-servicedir = $(prefix)/lib/systemd/system
++servicedir = /lib/systemd/system
+ 
+ AM_CFLAGS = -I$(top_srcdir)/libpam/include -I$(top_srcdir)/libpamc/include \
+         -DSECURECONF_DIR=\"$(SCONFIGDIR)/\" $(WARN_CFLAGS)
+-- 
+2.24.0
+
diff --git a/meta/recipes-extended/pam/libpam/crypt_configure.patch b/meta/recipes-extended/pam/libpam/crypt_configure.patch
deleted file mode 100644
index 917a8af64d..0000000000
--- a/meta/recipes-extended/pam/libpam/crypt_configure.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From b86575ab4a0df07da160283459da270e1c0372a0 Mon Sep 17 00:00:00 2001
-From: "Maxin B. John" <maxin.john@intel.com>
-Date: Tue, 24 May 2016 14:11:09 +0300
-Subject: [PATCH] crypt_configure
-
-This patch fixes a case where it find crypt defined in libc (musl) but
-not in specified libraries then it ends up assigning
-LIBCRYPT="-l" which then goes into makefile cause all sort of problems
-e.g.
-
-ld: cannot find -l-m32
-| collect2: error: ld returned 1 exit status
-The reason is that -l appears on commandline with
-out any library and compiler treats the next argument as library name
-whatever it is.
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index df39d07..e68d856 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -401,7 +401,7 @@ AS_IF([test "x$ac_cv_header_xcrypt_h" = "xyes"],
-   [crypt_libs="crypt"])
- 
- BACKUP_LIBS=$LIBS
--AC_SEARCH_LIBS([crypt],[$crypt_libs], LIBCRYPT="${ac_lib:+-l$ac_lib}", LIBCRYPT="")
-+AC_SEARCH_LIBS([crypt],[$crypt_libs], [test "$ac_cv_search_crypt" = "none required" || LIBCRYPT="$ac_cv_search_crypt"])
- AC_CHECK_FUNCS(crypt_r crypt_gensalt_r)
- LIBS=$BACKUP_LIBS
- AC_SUBST(LIBCRYPT)
--- 
-2.4.0
-
diff --git a/meta/recipes-extended/pam/libpam/pam-security-abstract-securetty-handling.patch b/meta/recipes-extended/pam/libpam/pam-security-abstract-securetty-handling.patch
deleted file mode 100644
index 9b8d4c2975..0000000000
--- a/meta/recipes-extended/pam/libpam/pam-security-abstract-securetty-handling.patch
+++ /dev/null
@@ -1,203 +0,0 @@
-Description: extract the securetty logic for use with the "nullok_secure" option
- introduced in the "055_pam_unix_nullok_secure" patch.
-
-Upstream-Status: Pending
-
-Signed-off-by: Ming Liu <ming.liu@windriver.com>
-===================================================================
-Index: Linux-PAM-1.3.0/modules/pam_securetty/Makefile.am
-===================================================================
---- Linux-PAM-1.3.0.orig/modules/pam_securetty/Makefile.am
-+++ Linux-PAM-1.3.0/modules/pam_securetty/Makefile.am
-@@ -24,6 +24,10 @@ endif
- securelib_LTLIBRARIES = pam_securetty.la
- pam_securetty_la_LIBADD = $(top_builddir)/libpam/libpam.la
- 
-+pam_securetty_la_SOURCES =	\
-+	pam_securetty.c		\
-+	tty_secure.c
-+
- if ENABLE_REGENERATE_MAN
- noinst_DATA = README
- README: pam_securetty.8.xml
-Index: Linux-PAM-1.3.0/modules/pam_securetty/pam_securetty.c
-===================================================================
---- Linux-PAM-1.3.0.orig/modules/pam_securetty/pam_securetty.c
-+++ Linux-PAM-1.3.0/modules/pam_securetty/pam_securetty.c
-@@ -1,7 +1,5 @@
- /* pam_securetty module */
- 
--#define SECURETTY_FILE "/etc/securetty"
--#define TTY_PREFIX     "/dev/"
- #define CMDLINE_FILE   "/proc/cmdline"
- #define CONSOLEACTIVE_FILE	"/sys/class/tty/console/active"
- 
-@@ -40,6 +38,9 @@
- #include <security/pam_modutil.h>
- #include <security/pam_ext.h>
- 
-+extern int _pammodutil_tty_secure(const pam_handle_t *pamh,
-+                                  const char *uttyname);
-+
- #define PAM_DEBUG_ARG       0x0001
- #define PAM_NOCONSOLE_ARG   0x0002
- 
-@@ -73,11 +74,7 @@ securetty_perform_check (pam_handle_t *p
-     const char *username;
-     const char *uttyname;
-     const void *void_uttyname;
--    char ttyfileline[256];
--    char ptname[256];
--    struct stat ttyfileinfo;
-     struct passwd *user_pwd;
--    FILE *ttyfile;
- 
-     /* log a trail for debugging */
-     if (ctrl & PAM_DEBUG_ARG) {
-@@ -105,50 +102,7 @@ securetty_perform_check (pam_handle_t *p
- 	return PAM_SERVICE_ERR;
-     }
- 
--    /* The PAM_TTY item may be prefixed with "/dev/" - skip that */
--    if (strncmp(TTY_PREFIX, uttyname, sizeof(TTY_PREFIX)-1) == 0) {
--	uttyname += sizeof(TTY_PREFIX)-1;
--    }
--
--    if (stat(SECURETTY_FILE, &ttyfileinfo)) {
--	pam_syslog(pamh, LOG_NOTICE, "Couldn't open %s: %m", SECURETTY_FILE);
--	return PAM_SUCCESS; /* for compatibility with old securetty handling,
--			       this needs to succeed.  But we still log the
--			       error. */
--    }
--
--    if ((ttyfileinfo.st_mode & S_IWOTH) || !S_ISREG(ttyfileinfo.st_mode)) {
--	/* If the file is world writable or is not a
--	   normal file, return error */
--	pam_syslog(pamh, LOG_ERR,
--		   "%s is either world writable or not a normal file",
--		   SECURETTY_FILE);
--	return PAM_AUTH_ERR;
--    }
--
--    ttyfile = fopen(SECURETTY_FILE,"r");
--    if (ttyfile == NULL) { /* Check that we opened it successfully */
--	pam_syslog(pamh, LOG_ERR, "Error opening %s: %m", SECURETTY_FILE);
--	return PAM_SERVICE_ERR;
--    }
--
--    if (isdigit(uttyname[0])) {
--	snprintf(ptname, sizeof(ptname), "pts/%s", uttyname);
--    } else {
--	ptname[0] = '\0';
--    }
--
--    retval = 1;
--
--    while ((fgets(ttyfileline, sizeof(ttyfileline)-1, ttyfile) != NULL)
--	   && retval) {
--	if (ttyfileline[strlen(ttyfileline) - 1] == '\n')
--	    ttyfileline[strlen(ttyfileline) - 1] = '\0';
--
--	retval = ( strcmp(ttyfileline, uttyname)
--		   && (!ptname[0] || strcmp(ptname, uttyname)) );
--    }
--    fclose(ttyfile);
-+    retval = _pammodutil_tty_secure(pamh, uttyname);
- 
-     if (retval && !(ctrl & PAM_NOCONSOLE_ARG)) {
-         FILE *cmdlinefile;
-Index: Linux-PAM-1.3.0/modules/pam_securetty/tty_secure.c
-===================================================================
---- /dev/null
-+++ Linux-PAM-1.3.0/modules/pam_securetty/tty_secure.c
-@@ -0,0 +1,90 @@
-+/*
-+ * A function to determine if a particular line is in /etc/securetty
-+ */
-+
-+
-+#define SECURETTY_FILE "/etc/securetty"
-+#define TTY_PREFIX     "/dev/"
-+
-+/* This function taken out of pam_securetty by Sam Hartman
-+ * <hartmans@debian.org>*/
-+/*
-+ * by Elliot Lee <sopwith@redhat.com>, Red Hat Software.
-+ * July 25, 1996.
-+ * Slight modifications AGM. 1996/12/3
-+ */
-+
-+#include <unistd.h>
-+#include <sys/types.h>
-+#include <sys/stat.h>
-+#include <security/pam_modules.h>
-+#include <stdarg.h>
-+#include <syslog.h>
-+#include <sys/syslog.h>
-+#include <stdio.h>
-+#include <string.h>
-+#include <stdlib.h>
-+#include <ctype.h>
-+#include <security/pam_modutil.h>
-+#include <security/pam_ext.h>
-+
-+extern int _pammodutil_tty_secure(const pam_handle_t *pamh,
-+                                  const char *uttyname);
-+
-+int _pammodutil_tty_secure(const pam_handle_t *pamh, const char *uttyname)
-+{
-+    int retval = PAM_AUTH_ERR;
-+    char ttyfileline[256];
-+    char ptname[256];
-+    struct stat ttyfileinfo;
-+    FILE *ttyfile;
-+    /* The PAM_TTY item may be prefixed with "/dev/" - skip that */
-+    if (strncmp(TTY_PREFIX, uttyname, sizeof(TTY_PREFIX)-1) == 0)
-+	uttyname += sizeof(TTY_PREFIX)-1;
-+
-+    if (stat(SECURETTY_FILE, &ttyfileinfo)) {
-+	pam_syslog(pamh, LOG_NOTICE, "Couldn't open %s: %m",
-+	           SECURETTY_FILE);
-+	return PAM_SUCCESS; /* for compatibility with old securetty handling,
-+			       this needs to succeed.  But we still log the
-+			       error. */
-+    }
-+
-+    if ((ttyfileinfo.st_mode & S_IWOTH) || !S_ISREG(ttyfileinfo.st_mode)) {
-+	/* If the file is world writable or is not a
-+	   normal file, return error */
-+	pam_syslog(pamh, LOG_ERR,
-+	           "%s is either world writable or not a normal file",
-+	           SECURETTY_FILE);
-+	return PAM_AUTH_ERR;
-+    }
-+
-+    ttyfile = fopen(SECURETTY_FILE,"r");
-+    if(ttyfile == NULL) { /* Check that we opened it successfully */
-+	pam_syslog(pamh, LOG_ERR, "Error opening %s: %m", SECURETTY_FILE);
-+	return PAM_SERVICE_ERR;
-+    }
-+
-+    if (isdigit(uttyname[0])) {
-+	snprintf(ptname, sizeof(ptname), "pts/%s", uttyname);
-+    } else {
-+	ptname[0] = '\0';
-+    }
-+
-+    retval = 1;
-+
-+    while ((fgets(ttyfileline,sizeof(ttyfileline)-1, ttyfile) != NULL) 
-+	   && retval) {
-+	if(ttyfileline[strlen(ttyfileline) - 1] == '\n')
-+	    ttyfileline[strlen(ttyfileline) - 1] = '\0';
-+	retval = ( strcmp(ttyfileline,uttyname)
-+	           && (!ptname[0] || strcmp(ptname, uttyname)) );
-+    }
-+    fclose(ttyfile);
-+
-+    if(retval) {
-+	retval = PAM_AUTH_ERR;
-+    }
-+
-+    return retval;
-+}
diff --git a/meta/recipes-extended/pam/libpam/pam-unix-nullok-secure.patch b/meta/recipes-extended/pam/libpam/pam-unix-nullok-secure.patch
deleted file mode 100644
index d2cc66882e..0000000000
--- a/meta/recipes-extended/pam/libpam/pam-unix-nullok-secure.patch
+++ /dev/null
@@ -1,195 +0,0 @@
-From b6545b83f94c5fb7aec1478b8d458a1393f479c8 Mon Sep 17 00:00:00 2001
-From: "Maxin B. John" <maxin.john@intel.com>
-Date: Wed, 25 May 2016 14:12:25 +0300
-Subject: [PATCH] pam_unix: support 'nullok_secure' option
-
-Debian patch to add a new 'nullok_secure' option to pam_unix,
-which accepts users with null passwords only when the applicant is
-connected from a tty listed in /etc/securetty.
-
-Authors: Sam Hartman <hartmans@debian.org>,
-         Steve Langasek <vorlon@debian.org>
-
-Upstream-Status: Pending
-
-Signed-off-by: Ming Liu <ming.liu@windriver.com>
-Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
- modules/pam_unix/Makefile.am    |  3 ++-
- modules/pam_unix/pam_unix.8.xml | 19 ++++++++++++++++++-
- modules/pam_unix/support.c      | 40 +++++++++++++++++++++++++++++++++++-----
- modules/pam_unix/support.h      |  8 ++++++--
- 4 files changed, 61 insertions(+), 9 deletions(-)
-
-diff --git a/modules/pam_unix/Makefile.am b/modules/pam_unix/Makefile.am
-index 56df178..2bba460 100644
---- a/modules/pam_unix/Makefile.am
-+++ b/modules/pam_unix/Makefile.am
-@@ -30,7 +30,8 @@ if HAVE_VERSIONING
-   pam_unix_la_LDFLAGS += -Wl,--version-script=$(srcdir)/../modules.map
- endif
- pam_unix_la_LIBADD = $(top_builddir)/libpam/libpam.la \
--	@LIBCRYPT@ @LIBSELINUX@ @TIRPC_LIBS@ @NSL_LIBS@
-+	@LIBCRYPT@ @LIBSELINUX@ @TIRPC_LIBS@ @NSL_LIBS@ \
-+	../pam_securetty/tty_secure.lo
- 
- securelib_LTLIBRARIES = pam_unix.la
- 
-diff --git a/modules/pam_unix/pam_unix.8.xml b/modules/pam_unix/pam_unix.8.xml
-index 1b318f1..be0330e 100644
---- a/modules/pam_unix/pam_unix.8.xml
-+++ b/modules/pam_unix/pam_unix.8.xml
-@@ -159,7 +159,24 @@
-           <para>
-             The default action of this module is to not permit the
-             user access to a service if their official password is blank.
--            The <option>nullok</option> argument overrides this default.
-+            The <option>nullok</option> argument overrides this default
-+            and allows any user with a blank password to access the
-+            service.
-+          </para>
-+        </listitem>
-+      </varlistentry>
-+      <varlistentry>
-+        <term>
-+          <option>nullok_secure</option>
-+        </term>
-+        <listitem>
-+          <para>
-+            The default action of this module is to not permit the
-+            user access to a service if their official password is blank.
-+            The <option>nullok_secure</option> argument overrides this
-+            default and allows any user with a blank password to access
-+            the service as long as the value of PAM_TTY is set to one of
-+            the values found in /etc/securetty.
-           </para>
-         </listitem>
-       </varlistentry>
-diff --git a/modules/pam_unix/support.c b/modules/pam_unix/support.c
-index fc8595e..29e3341 100644
---- a/modules/pam_unix/support.c
-+++ b/modules/pam_unix/support.c
-@@ -183,13 +183,22 @@ int _set_ctrl(pam_handle_t *pamh, int flags, int *remember, int *rounds,
- 	/* now parse the arguments to this module */
- 
- 	for (; argc-- > 0; ++argv) {
-+		int sl;
- 
- 		D(("pam_unix arg: %s", *argv));
- 
- 		for (j = 0; j < UNIX_CTRLS_; ++j) {
--			if (unix_args[j].token
--			    && !strncmp(*argv, unix_args[j].token, strlen(unix_args[j].token))) {
--				break;
-+			if (unix_args[j].token) {
-+				sl = strlen(unix_args[j].token);
-+				if (unix_args[j].token[sl-1] == '=') {
-+					/* exclude argument from comparison */
-+					if (!strncmp(*argv, unix_args[j].token, sl))
-+						break;
-+				} else {
-+				/* compare full strings */
-+					if (!strcmp(*argv, unix_args[j].token))
-+						break;
-+				}
- 			}
- 		}
- 
-@@ -560,6 +569,7 @@ static int _unix_run_helper_binary(pam_handle_t *pamh, const char *passwd,
-     if (child == 0) {
- 	static char *envp[] = { NULL };
- 	const char *args[] = { NULL, NULL, NULL, NULL };
-+	int nullok = off(UNIX__NONULL, ctrl);
- 
- 	/* XXX - should really tidy up PAM here too */
- 
-@@ -587,7 +597,16 @@ static int _unix_run_helper_binary(pam_handle_t *pamh, const char *passwd,
- 	/* exec binary helper */
- 	args[0] = CHKPWD_HELPER;
- 	args[1] = user;
--	if (off(UNIX__NONULL, ctrl)) {	/* this means we've succeeded */
-+	if (on(UNIX_NULLOK_SECURE, ctrl)) {
-+		const void *uttyname;
-+		retval = pam_get_item(pamh, PAM_TTY, &uttyname);
-+		if (retval != PAM_SUCCESS || uttyname == NULL
-+			|| _pammodutil_tty_secure(pamh, (const char *)uttyname) != PAM_SUCCESS) {
-+			nullok = 0;
-+		}
-+	}
-+
-+	if (nullok) {
- 	  args[2]="nullok";
- 	} else {
- 	  args[2]="nonull";
-@@ -672,6 +691,17 @@ _unix_blankpasswd (pam_handle_t *pamh, unsigned int ctrl, const char *name)
- 	if (on(UNIX__NONULL, ctrl))
- 		return 0;	/* will fail but don't let on yet */
- 
-+	if (on(UNIX_NULLOK_SECURE, ctrl)) {
-+		int retval2;
-+		const void *uttyname;
-+		retval2 = pam_get_item(pamh, PAM_TTY, &uttyname);
-+		if (retval2 != PAM_SUCCESS || uttyname == NULL)
-+			return 0;
-+
-+		if (_pammodutil_tty_secure(pamh, (const char *)uttyname) != PAM_SUCCESS)
-+			return 0;
-+	}
-+
- 	/* UNIX passwords area */
- 
- 	retval = get_pwd_hash(pamh, name, &pwd, &salt);
-@@ -758,7 +788,7 @@ int _unix_verify_password(pam_handle_t * pamh, const char *name
- 			}
- 		}
- 	} else {
--		retval = verify_pwd_hash(p, salt, off(UNIX__NONULL, ctrl));
-+		retval = verify_pwd_hash(p, salt, _unix_blankpasswd(pamh, ctrl, name));
- 	}
- 
- 	if (retval == PAM_SUCCESS) {
-diff --git a/modules/pam_unix/support.h b/modules/pam_unix/support.h
-index b4c279c..8da4a8e 100644
---- a/modules/pam_unix/support.h
-+++ b/modules/pam_unix/support.h
-@@ -98,8 +98,9 @@ typedef struct {
- #define UNIX_QUIET		 28	/* Don't print informational messages */
- #define UNIX_NO_PASS_EXPIRY      29     /* Don't check for password expiration if not used for authentication */
- #define UNIX_DES                 30     /* DES, default */
-+#define UNIX_NULLOK_SECURE       31     /* NULL passwords allowed only on secure ttys */
- /* -------------- */
--#define UNIX_CTRLS_              31	/* number of ctrl arguments defined */
-+#define UNIX_CTRLS_              32	/* number of ctrl arguments defined */
- 
- #define UNIX_DES_CRYPT(ctrl)	(off(UNIX_MD5_PASS,ctrl)&&off(UNIX_BIGCRYPT,ctrl)&&off(UNIX_SHA256_PASS,ctrl)&&off(UNIX_SHA512_PASS,ctrl)&&off(UNIX_BLOWFISH_PASS,ctrl))
- 
-@@ -117,7 +118,7 @@ static const UNIX_Ctrls unix_args[UNIX_CTRLS_] =
- /* UNIX_AUTHTOK_TYPE */    {"authtok_type=",   _ALL_ON_,                0100, 0},
- /* UNIX__PRELIM */         {NULL,              _ALL_ON_^(0600),         0200, 0},
- /* UNIX__UPDATE */         {NULL,              _ALL_ON_^(0600),         0400, 0},
--/* UNIX__NONULL */         {NULL,              _ALL_ON_,               01000, 0},
-+/* UNIX__NONULL */         {NULL,              _ALL_ON_^(02000000000), 01000, 0},
- /* UNIX__QUIET */          {NULL,              _ALL_ON_,               02000, 0},
- /* UNIX_USE_AUTHTOK */     {"use_authtok",     _ALL_ON_,               04000, 0},
- /* UNIX_SHADOW */          {"shadow",          _ALL_ON_,              010000, 0},
-@@ -139,6 +140,7 @@ static const UNIX_Ctrls unix_args[UNIX_CTRLS_] =
- /* UNIX_QUIET */           {"quiet",           _ALL_ON_,         01000000000, 0},
- /* UNIX_NO_PASS_EXPIRY */  {"no_pass_expiry",  _ALL_ON_,         02000000000, 0},
- /* UNIX_DES */             {"des",             _ALL_ON_^(0260420000),      0, 1},
-+/* UNIX_NULLOK_SECURE */   {"nullok_secure",   _ALL_ON_^(01000), 02000000000, 0},
- };
- 
- #define UNIX_DEFAULTS  (unix_args[UNIX__NONULL].flag)
-@@ -172,6 +174,8 @@ extern int _unix_read_password(pam_handle_t * pamh
- 			,const char *data_name
- 			,const void **pass);
- 
-+extern int _pammodutil_tty_secure(const pam_handle_t *pamh, const char *uttyname);
-+
- extern int _unix_run_verify_binary(pam_handle_t *pamh,
- 			unsigned int ctrl, const char *user, int *daysleft);
- #endif /* _PAM_UNIX_SUPPORT_H */
--- 
-2.4.0
-
diff --git a/meta/recipes-extended/pam/libpam_1.3.1.bb b/meta/recipes-extended/pam/libpam_1.5.1.bb
similarity index 93%
rename from meta/recipes-extended/pam/libpam_1.3.1.bb
rename to meta/recipes-extended/pam/libpam_1.5.1.bb
index bc72afe6ad..6af1d43c60 100644
--- a/meta/recipes-extended/pam/libpam_1.3.1.bb
+++ b/meta/recipes-extended/pam/libpam_1.5.1.bb
@@ -21,13 +21,10 @@ SRC_URI = "https://github.com/linux-pam/linux-pam/releases/download/v${PV}/Linux
            file://pam.d/common-session-noninteractive \
            file://pam.d/other \
            file://libpam-xtests.patch \
-           file://pam-security-abstract-securetty-handling.patch \
-           file://pam-unix-nullok-secure.patch \
-           file://crypt_configure.patch \
-          "
+           file://0001-modules-pam_namespace-Makefile.am-correctly-install-.patch \
+           "
 
-SRC_URI[md5sum] = "558ff53b0fc0563ca97f79e911822165"
-SRC_URI[sha256sum] = "eff47a4ecd833fbf18de9686632a70ee8d0794b79aecb217ebd0ce11db4cd0db"
+SRC_URI[sha256sum] = "201d40730b1135b1b3cdea09f2c28ac634d73181ccd0172ceddee3649c5792fc"
 
 SRC_URI_append_libc-musl = " file://0001-Add-support-for-defining-missing-funcitonality.patch \
                              file://include_paths_header.patch \
@@ -39,13 +36,14 @@ EXTRA_OECONF = "--includedir=${includedir}/security \
                 --libdir=${base_libdir} \
                 --disable-nis \
                 --disable-regenerate-docu \
+                --disable-doc \
 		--disable-prelude"
 
 CFLAGS_append = " -fPIC "
 
 S = "${WORKDIR}/Linux-PAM-${PV}"
 
-inherit autotools gettext pkgconfig
+inherit autotools gettext pkgconfig systemd
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[audit] = "--enable-audit,--disable-audit,audit,"
@@ -54,7 +52,7 @@ PACKAGECONFIG[userdb] = "--enable-db=db,--enable-db=no,db,"
 PACKAGES += "${PN}-runtime ${PN}-xtests"
 FILES_${PN} = "${base_libdir}/lib*${SOLIBS}"
 FILES_${PN}-dev += "${base_libdir}/security/*.la ${base_libdir}/*.la ${base_libdir}/lib*${SOLIBSDEV}"
-FILES_${PN}-runtime = "${sysconfdir}"
+FILES_${PN}-runtime = "${sysconfdir} ${sbindir} ${systemd_system_unitdir}"
 FILES_${PN}-xtests = "${datadir}/Linux-PAM/xtests"
 
 PACKAGES_DYNAMIC += "^${MLPREFIX}pam-plugin-.*"
@@ -77,11 +75,10 @@ RDEPENDS_${PN}-runtime = "${PN}-${libpam_suffix} \
 RDEPENDS_${PN}-xtests = "${PN}-${libpam_suffix} \
     ${MLPREFIX}pam-plugin-access-${libpam_suffix} \
     ${MLPREFIX}pam-plugin-debug-${libpam_suffix} \
-    ${MLPREFIX}pam-plugin-cracklib-${libpam_suffix} \
     ${MLPREFIX}pam-plugin-pwhistory-${libpam_suffix} \
     ${MLPREFIX}pam-plugin-succeed-if-${libpam_suffix} \
     ${MLPREFIX}pam-plugin-time-${libpam_suffix} \
-    coreutils"
+    bash coreutils"
 
 # FIXME: Native suffix breaks here, disable it for now
 RRECOMMENDS_${PN} = "${PN}-runtime-${libpam_suffix}"
-- 
2.29.2

