Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 787486B215
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 03:15:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6H3FHKs014603
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 20:15:17 -0700 (PDT)
Received: from pek-lpgbuild1.wrs.com (128.224.153.21) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Tue, 16 Jul 2013 20:15:16 -0700
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Jul 2013 11:15:12 +0800
Message-ID: <1374030912-19587-1-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH] libpam: add a new 'nullok_secure' option support to pam_unix
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
X-List-Received-Date: Wed, 17 Jul 2013 03:15:16 -0000
Content-Type: text/plain

Debian patch to add a new 'nullok_secure' option to pam_unix, which
accepts users with null passwords only when the applicant is connected
from a tty listed in /etc/securetty.

The original pam_unix.so was configured with nullok_secure in
meta/recipes-extended/pam/libpam/pam.d/common-auth, but no such code
exists actually.

The patch set comes from:
http://patch-tracker.debian.org/patch/series/view/pam/1.1.3-7.1/054_pam_security_abstract_securetty_handling
http://patch-tracker.debian.org/patch/series/view/pam/1.1.3-7.1/055_pam_unix_nullok_secure

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 .../pam-security-abstract-securetty-handling.patch |  196 +++++++++++++++++
 .../pam/libpam/pam-unix-nullok-secure.patch        |  220 ++++++++++++++++++++
 meta/recipes-extended/pam/libpam_1.1.6.bb          |    4 +-
 3 files changed, 419 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-extended/pam/libpam/pam-security-abstract-securetty-handling.patch
 create mode 100644 meta/recipes-extended/pam/libpam/pam-unix-nullok-secure.patch

diff --git a/meta/recipes-extended/pam/libpam/pam-security-abstract-securetty-handling.patch b/meta/recipes-extended/pam/libpam/pam-security-abstract-securetty-handling.patch
new file mode 100644
index 0000000..a537b33
--- /dev/null
+++ b/meta/recipes-extended/pam/libpam/pam-security-abstract-securetty-handling.patch
@@ -0,0 +1,196 @@
+Description: extract the securetty logic for use with the "nullok_secure" option
+ introduced in the "055_pam_unix_nullok_secure" patch.
+
+diff -urpN a/modules/pam_securetty/Makefile.am b/modules/pam_securetty/Makefile.am
+--- a/modules/pam_securetty/Makefile.am	2013-07-05 11:08:23.224483237 +0800
++++ b/modules/pam_securetty/Makefile.am	2013-07-05 11:15:21.304486456 +0800
+@@ -24,6 +24,10 @@ endif
+ securelib_LTLIBRARIES = pam_securetty.la
+ pam_securetty_la_LIBADD = -L$(top_builddir)/libpam -lpam
+ 
++pam_securetty_la_SOURCES =	\
++	pam_securetty.c		\
++	tty_secure.c
++
+ if ENABLE_REGENERATE_MAN
+ noinst_DATA = README
+ README: pam_securetty.8.xml
+diff -urpN a/modules/pam_securetty/pam_securetty.c b/modules/pam_securetty/pam_securetty.c
+--- a/modules/pam_securetty/pam_securetty.c	2013-07-05 11:07:50.064483568 +0800
++++ b/modules/pam_securetty/pam_securetty.c	2013-07-05 11:12:23.994483344 +0800
+@@ -1,7 +1,5 @@
+ /* pam_securetty module */
+ 
+-#define SECURETTY_FILE "/etc/securetty"
+-#define TTY_PREFIX     "/dev/"
+ #define CMDLINE_FILE   "/proc/cmdline"
+ #define CONSOLEACTIVE_FILE	"/sys/class/tty/console/active"
+ 
+@@ -40,6 +38,9 @@
+ #include <security/pam_modutil.h>
+ #include <security/pam_ext.h>
+ 
++extern int _pammodutil_tty_secure(const pam_handle_t *pamh,
++                                  const char *uttyname);
++
+ #define PAM_DEBUG_ARG       0x0001
+ #define PAM_NOCONSOLE_ARG   0x0002
+ 
+@@ -73,11 +74,7 @@ securetty_perform_check (pam_handle_t *p
+     const char *username;
+     const char *uttyname;
+     const void *void_uttyname;
+-    char ttyfileline[256];
+-    char ptname[256];
+-    struct stat ttyfileinfo;
+     struct passwd *user_pwd;
+-    FILE *ttyfile;
+ 
+     /* log a trail for debugging */
+     if (ctrl & PAM_DEBUG_ARG) {
+@@ -105,50 +102,7 @@ securetty_perform_check (pam_handle_t *p
+ 	return PAM_SERVICE_ERR;
+     }
+ 
+-    /* The PAM_TTY item may be prefixed with "/dev/" - skip that */
+-    if (strncmp(TTY_PREFIX, uttyname, sizeof(TTY_PREFIX)-1) == 0) {
+-	uttyname += sizeof(TTY_PREFIX)-1;
+-    }
+-
+-    if (stat(SECURETTY_FILE, &ttyfileinfo)) {
+-	pam_syslog(pamh, LOG_NOTICE, "Couldn't open %s: %m", SECURETTY_FILE);
+-	return PAM_SUCCESS; /* for compatibility with old securetty handling,
+-			       this needs to succeed.  But we still log the
+-			       error. */
+-    }
+-
+-    if ((ttyfileinfo.st_mode & S_IWOTH) || !S_ISREG(ttyfileinfo.st_mode)) {
+-	/* If the file is world writable or is not a
+-	   normal file, return error */
+-	pam_syslog(pamh, LOG_ERR,
+-		   "%s is either world writable or not a normal file",
+-		   SECURETTY_FILE);
+-	return PAM_AUTH_ERR;
+-    }
+-
+-    ttyfile = fopen(SECURETTY_FILE,"r");
+-    if (ttyfile == NULL) { /* Check that we opened it successfully */
+-	pam_syslog(pamh, LOG_ERR, "Error opening %s: %m", SECURETTY_FILE);
+-	return PAM_SERVICE_ERR;
+-    }
+-
+-    if (isdigit(uttyname[0])) {
+-	snprintf(ptname, sizeof(ptname), "pts/%s", uttyname);
+-    } else {
+-	ptname[0] = '\0';
+-    }
+-
+-    retval = 1;
+-
+-    while ((fgets(ttyfileline, sizeof(ttyfileline)-1, ttyfile) != NULL)
+-	   && retval) {
+-	if (ttyfileline[strlen(ttyfileline) - 1] == '\n')
+-	    ttyfileline[strlen(ttyfileline) - 1] = '\0';
+-
+-	retval = ( strcmp(ttyfileline, uttyname)
+-		   && (!ptname[0] || strcmp(ptname, uttyname)) );
+-    }
+-    fclose(ttyfile);
++    retval = _pammodutil_tty_secure(pamh, uttyname);
+ 
+     if (retval && !(ctrl & PAM_NOCONSOLE_ARG)) {
+         FILE *cmdlinefile;
+diff -urpN a/modules/pam_securetty/tty_secure.c b/modules/pam_securetty/tty_secure.c
+--- a/modules/pam_securetty/tty_secure.c	1970-01-01 08:30:00.000000000 +0830
++++ b/modules/pam_securetty/tty_secure.c	2013-07-05 11:14:21.534482900 +0800
+@@ -0,0 +1,90 @@
++/*
++ * A function to determine if a particular line is in /etc/securetty
++ */
++
++
++#define SECURETTY_FILE "/etc/securetty"
++#define TTY_PREFIX     "/dev/"
++
++/* This function taken out of pam_securetty by Sam Hartman
++ * <hartmans@debian.org>*/
++/*
++ * by Elliot Lee <sopwith@redhat.com>, Red Hat Software.
++ * July 25, 1996.
++ * Slight modifications AGM. 1996/12/3
++ */
++
++#include <unistd.h>
++#include <sys/types.h>
++#include <sys/stat.h>
++#include <security/pam_modules.h>
++#include <stdarg.h>
++#include <syslog.h>
++#include <sys/syslog.h>
++#include <stdio.h>
++#include <string.h>
++#include <stdlib.h>
++#include <ctype.h>
++#include <security/pam_modutil.h>
++#include <security/pam_ext.h>
++
++extern int _pammodutil_tty_secure(const pam_handle_t *pamh,
++                                  const char *uttyname);
++
++int _pammodutil_tty_secure(const pam_handle_t *pamh, const char *uttyname)
++{
++    int retval = PAM_AUTH_ERR;
++    char ttyfileline[256];
++    char ptname[256];
++    struct stat ttyfileinfo;
++    FILE *ttyfile;
++    /* The PAM_TTY item may be prefixed with "/dev/" - skip that */
++    if (strncmp(TTY_PREFIX, uttyname, sizeof(TTY_PREFIX)-1) == 0)
++	uttyname += sizeof(TTY_PREFIX)-1;
++
++    if (stat(SECURETTY_FILE, &ttyfileinfo)) {
++	pam_syslog(pamh, LOG_NOTICE, "Couldn't open %s: %m",
++	           SECURETTY_FILE);
++	return PAM_SUCCESS; /* for compatibility with old securetty handling,
++			       this needs to succeed.  But we still log the
++			       error. */
++    }
++
++    if ((ttyfileinfo.st_mode & S_IWOTH) || !S_ISREG(ttyfileinfo.st_mode)) {
++	/* If the file is world writable or is not a
++	   normal file, return error */
++	pam_syslog(pamh, LOG_ERR,
++	           "%s is either world writable or not a normal file",
++	           SECURETTY_FILE);
++	return PAM_AUTH_ERR;
++    }
++
++    ttyfile = fopen(SECURETTY_FILE,"r");
++    if(ttyfile == NULL) { /* Check that we opened it successfully */
++	pam_syslog(pamh, LOG_ERR, "Error opening %s: %m", SECURETTY_FILE);
++	return PAM_SERVICE_ERR;
++    }
++
++    if (isdigit(uttyname[0])) {
++	snprintf(ptname, sizeof(ptname), "pts/%s", uttyname);
++    } else {
++	ptname[0] = '\0';
++    }
++
++    retval = 1;
++
++    while ((fgets(ttyfileline,sizeof(ttyfileline)-1, ttyfile) != NULL) 
++	   && retval) {
++	if(ttyfileline[strlen(ttyfileline) - 1] == '\n')
++	    ttyfileline[strlen(ttyfileline) - 1] = '\0';
++	retval = ( strcmp(ttyfileline,uttyname)
++	           && (!ptname[0] || strcmp(ptname, uttyname)) );
++    }
++    fclose(ttyfile);
++
++    if(retval) {
++	retval = PAM_AUTH_ERR;
++    }
++
++    return retval;
++}
diff --git a/meta/recipes-extended/pam/libpam/pam-unix-nullok-secure.patch b/meta/recipes-extended/pam/libpam/pam-unix-nullok-secure.patch
new file mode 100644
index 0000000..09cffe3
--- /dev/null
+++ b/meta/recipes-extended/pam/libpam/pam-unix-nullok-secure.patch
@@ -0,0 +1,220 @@
+Debian patch to add a new 'nullok_secure' option to pam_unix, which
+accepts users with null passwords only when the applicant is connected
+from a tty listed in /etc/securetty.
+
+Authors: Sam Hartman <hartmans@debian.org>,
+         Steve Langasek <vorlon@debian.org>
+
+Upstream status: not yet submitted
+===================================================================
+diff -urpN a/modules/pam_unix/Makefile.am b/modules/pam_unix/Makefile.am
+--- a/modules/pam_unix/Makefile.am	2013-07-05 09:51:31.014483164 +0800
++++ b/modules/pam_unix/Makefile.am	2013-07-05 10:26:12.884484000 +0800
+@@ -30,7 +30,8 @@ if HAVE_VERSIONING
+   pam_unix_la_LDFLAGS += -Wl,--version-script=$(srcdir)/../modules.map
+ endif
+ pam_unix_la_LIBADD = $(top_builddir)/libpam/libpam.la \
+-	@LIBCRYPT@ @LIBSELINUX@ $(NIS_LIBS)
++	@LIBCRYPT@ @LIBSELINUX@ $(NIS_LIBS) \
++	../pam_securetty/tty_secure.lo
+ 
+ securelib_LTLIBRARIES = pam_unix.la
+ 
+diff -urpN a/modules/pam_unix/pam_unix.8 b/modules/pam_unix/pam_unix.8
+--- a/modules/pam_unix/pam_unix.8	2013-07-05 09:52:16.825108201 +0800
++++ b/modules/pam_unix/pam_unix.8	2013-07-05 10:28:34.724483774 +0800
+@@ -220,7 +220,14 @@ A little more extreme than debug\&.
+ .RS 4
+ The default action of this module is to not permit the user access to a service if their official password is blank\&. The
+ \fBnullok\fR
+-argument overrides this default\&.
++argument overrides this default and allows any user with a blank password to access the service\&.
++.RE
++.PP
++\fBnullok_secure\fR
++.RS 4
++The default action of this module is to not permit the user access to a service if their official password is blank\&. The
++\fBnullok_secure\fR
++argument overrides this default and allows any user with a blank password to access the service as long as the value of PAM_TTY is set to one of the values found in /etc/securetty\&.
+ .RE
+ .PP
+ \fBtry_first_pass\fR
+diff -urpN a/modules/pam_unix/pam_unix.8.xml b/modules/pam_unix/pam_unix.8.xml
+--- a/modules/pam_unix/pam_unix.8.xml	2013-07-05 09:52:38.775108523 +0800
++++ b/modules/pam_unix/pam_unix.8.xml	2013-07-05 10:30:23.084483630 +0800
+@@ -135,7 +135,24 @@
+           <para>
+             The default action of this module is to not permit the
+             user access to a service if their official password is blank.
+-            The <option>nullok</option> argument overrides this default.
++            The <option>nullok</option> argument overrides this default
++            and allows any user with a blank password to access the
++            service.
++          </para>
++        </listitem>
++      </varlistentry>
++      <varlistentry>
++        <term>
++          <option>nullok_secure</option>
++        </term>
++        <listitem>
++          <para>
++            The default action of this module is to not permit the
++            user access to a service if their official password is blank.
++            The <option>nullok_secure</option> argument overrides this
++            default and allows any user with a blank password to access
++            the service as long as the value of PAM_TTY is set to one of
++            the values found in /etc/securetty.
+           </para>
+         </listitem>
+       </varlistentry>
+diff -urpN a/modules/pam_unix/README b/modules/pam_unix/README
+--- a/modules/pam_unix/README	2013-07-05 09:51:52.205107846 +0800
++++ b/modules/pam_unix/README	2013-07-05 10:27:10.774484537 +0800
+@@ -57,7 +57,16 @@ nullok
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
+diff -urpN a/modules/pam_unix/support.c b/modules/pam_unix/support.c
+--- a/modules/pam_unix/support.c	2013-07-05 09:50:49.134482523 +0800
++++ b/modules/pam_unix/support.c	2013-07-05 09:56:26.924484267 +0800
+@@ -84,14 +84,22 @@ int _set_ctrl(pam_handle_t *pamh, int fl
+ 	/* now parse the arguments to this module */
+ 
+ 	for (; argc-- > 0; ++argv) {
+-		int j;
++		int j, sl;
+ 
+ 		D(("pam_unix arg: %s", *argv));
+ 
+ 		for (j = 0; j < UNIX_CTRLS_; ++j) {
+-			if (unix_args[j].token
+-			    && !strncmp(*argv, unix_args[j].token, strlen(unix_args[j].token))) {
+-				break;
++			if (unix_args[j].token) {
++			    sl = strlen(unix_args[j].token);
++			    if (unix_args[j].token[sl-1] == '=') {
++				/* exclude argument from comparison */
++				if (!strncmp(*argv, unix_args[j].token, sl))
++				    break;
++			    } else {
++				/* compare full strings */
++				if (!strcmp(*argv, unix_args[j].token))
++				    break;
++			    }
+ 			}
+ 		}
+ 
+@@ -461,6 +469,7 @@ static int _unix_run_helper_binary(pam_h
+     child = fork();
+     if (child == 0) {
+         int i=0;
++        int nullok = off(UNIX__NONULL, ctrl);
+         struct rlimit rlim;
+ 	static char *envp[] = { NULL };
+ 	char *args[] = { NULL, NULL, NULL, NULL };
+@@ -488,7 +497,18 @@ static int _unix_run_helper_binary(pam_h
+ 	/* exec binary helper */
+ 	args[0] = strdup(CHKPWD_HELPER);
+ 	args[1] = x_strdup(user);
+-	if (off(UNIX__NONULL, ctrl)) {	/* this means we've succeeded */
++
++	if (on(UNIX_NULLOK_SECURE, ctrl)) {
++	    const void *uttyname;
++	    retval = pam_get_item(pamh, PAM_TTY, &uttyname);
++	    if (retval != PAM_SUCCESS || uttyname == NULL
++	        || _pammodutil_tty_secure(pamh, (const char *)uttyname) != PAM_SUCCESS)
++	    {
++	        nullok = 0;
++	    }
++	}
++
++	if (nullok) {
+ 	  args[2]=strdup("nullok");
+ 	} else {
+ 	  args[2]=strdup("nonull");
+@@ -567,6 +587,17 @@ _unix_blankpasswd (pam_handle_t *pamh, u
+ 	if (on(UNIX__NONULL, ctrl))
+ 		return 0;	/* will fail but don't let on yet */
+ 
++	if (on(UNIX_NULLOK_SECURE, ctrl)) {
++		int retval2;
++		const void *uttyname;
++		retval2 = pam_get_item(pamh, PAM_TTY, &uttyname);
++		if (retval2 != PAM_SUCCESS || uttyname == NULL)
++			return 0;
++
++		if (_pammodutil_tty_secure(pamh, (const char *)uttyname) != PAM_SUCCESS)
++			return 0;
++	}
++
+ 	/* UNIX passwords area */
+ 
+ 	retval = get_pwd_hash(pamh, name, &pwd, &salt);
+@@ -653,7 +684,8 @@ int _unix_verify_password(pam_handle_t *
+ 			}
+ 		}
+ 	} else {
+-		retval = verify_pwd_hash(p, salt, off(UNIX__NONULL, ctrl));
++		retval = verify_pwd_hash(p, salt,
++		                         _unix_blankpasswd(pamh, ctrl, name));
+ 	}
+ 
+ 	if (retval == PAM_SUCCESS) {
+diff -urpN a/modules/pam_unix/support.h b/modules/pam_unix/support.h
+--- a/modules/pam_unix/support.h	2013-07-05 09:51:10.385107934 +0800
++++ b/modules/pam_unix/support.h	2013-07-05 10:23:54.815107842 +0800
+@@ -90,8 +90,9 @@ typedef struct {
+ 					   password hash algorithms */
+ #define UNIX_BLOWFISH_PASS       26	/* new password hashes will use blowfish */
+ #define UNIX_MIN_PASS_LEN        27	/* min length for password */
++#define UNIX_NULLOK_SECURE       28	/* NULL passwords allowed only on secure ttys */
+ /* -------------- */
+-#define UNIX_CTRLS_              28	/* number of ctrl arguments defined */
++#define UNIX_CTRLS_              29	/* number of ctrl arguments defined */
+ 
+ #define UNIX_DES_CRYPT(ctrl)	(off(UNIX_MD5_PASS,ctrl)&&off(UNIX_BIGCRYPT,ctrl)&&off(UNIX_SHA256_PASS,ctrl)&&off(UNIX_SHA512_PASS,ctrl)&&off(UNIX_BLOWFISH_PASS,ctrl))
+ 
+@@ -109,7 +110,7 @@ static const UNIX_Ctrls unix_args[UNIX_C
+ /* UNIX_NOT_SET_PASS */    {"not_set_pass",    _ALL_ON_,                0100},
+ /* UNIX__PRELIM */         {NULL,              _ALL_ON_^(0600),         0200},
+ /* UNIX__UPDATE */         {NULL,              _ALL_ON_^(0600),         0400},
+-/* UNIX__NONULL */         {NULL,              _ALL_ON_,               01000},
++/* UNIX__NONULL */         {NULL,              _ALL_ON_^(0x10000000),  0x200},
+ /* UNIX__QUIET */          {NULL,              _ALL_ON_,               02000},
+ /* UNIX_USE_AUTHTOK */     {"use_authtok",     _ALL_ON_,               04000},
+ /* UNIX_SHADOW */          {"shadow",          _ALL_ON_,              010000},
+@@ -127,7 +128,8 @@ static const UNIX_Ctrls unix_args[UNIX_C
+ /* UNIX_SHA512_PASS */     {"sha512",       _ALL_ON_^(0260420000), 040000000},
+ /* UNIX_ALGO_ROUNDS */     {"rounds=",         _ALL_ON_,          0100000000},
+ /* UNIX_BLOWFISH_PASS */   {"blowfish",    _ALL_ON_^(0260420000), 0200000000},
+-/* UNIX_MIN_PASS_LEN */    {"minlen=",		_ALL_ON_,          0400000000},
++/* UNIX_MIN_PASS_LEN */    {"minlen=",	        _ALL_ON_,          0400000000},
++/* UNIX_NULLOK_SECURE */   {"nullok_secure",   _ALL_ON_^(0x200),  0x10000000},
+ };
+ 
+ #define UNIX_DEFAULTS  (unix_args[UNIX__NONULL].flag)
+@@ -163,6 +165,9 @@ extern int _unix_read_password(pam_handl
+ 			,const char *data_name
+ 			,const void **pass);
+ 
++extern int _pammodutil_tty_secure(const pam_handle_t *pamh,
++				  const char *uttyname);
++
+ extern int _unix_run_verify_binary(pam_handle_t *pamh,
+ 			unsigned int ctrl, const char *user, int *daysleft);
+ #endif /* _PAM_UNIX_SUPPORT_H */
diff --git a/meta/recipes-extended/pam/libpam_1.1.6.bb b/meta/recipes-extended/pam/libpam_1.1.6.bb
index 62ad7b1..3d8999d 100644
--- a/meta/recipes-extended/pam/libpam_1.1.6.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.6.bb
@@ -23,6 +23,8 @@ SRC_URI = "http://linux-pam.org/library/Linux-PAM-${PV}.tar.bz2 \
            file://reflect-the-enforce_for_root-semantics-change-in-pam.patch \
            file://add-checks-for-crypt-returning-NULL.patch \
            file://libpam-fix-for-CVE-2010-4708.patch \
+           file://pam-security-abstract-securetty-handling.patch \
+           file://pam-unix-nullok-secure.patch \
           "
 SRC_URI[md5sum] = "7b73e58b7ce79ffa321d408de06db2c4"
 SRC_URI[sha256sum] = "bab887d6280f47fc3963df3b95735a27a16f0f663636163ddf3acab5f1149fc2"
@@ -39,7 +41,7 @@ EXTRA_OECONF = "--with-db-uniquename=_pam \
 
 CFLAGS_append = " -fPIC "
 
-PR = "r2"
+PR = "r3"
 
 S = "${WORKDIR}/Linux-PAM-${PV}"
 
-- 
1.7.1


