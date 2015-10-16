Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id BAC237714A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 08:00:09 +0000 (UTC)
Received: by pabrc13 with SMTP id rc13so113592746pab.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 01:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=V/UPFjRX6TGQxlRN0lpT9+pHe6NqUp569Edc5D62pWw=;
	b=XAgrpdvz518DvR/GSg7ypLyqjicfQhIfKHCuENkN+qbF5aDN7A7onoH4IOwYrwgoez
	NMx6TuM2WfLk64jeBg1fJ+gJ2chfS5MEYmZWCxYVBdmAk88oFt8UlHkJgVF1ehPVDmU9
	q7DIvxb63maB1C7duqOyvm3yfY+vEXvlCJMSPKGD830a9Z7QccX5vCkTHoSMU0okn/Kx
	shhZTCdiOig3/xc/KRhWI30QCAz6uCeUd9vupJuuJWphxRb9o2/H/Kz+botHww9OHjBW
	WUHx0mV8mWLH08jq/79KBPPuJ1ZbqJePdUAmee7jwGiaZHliQi3jqPshLcAVIsnrId2K
	VEXA==
X-Received: by 10.66.65.228 with SMTP id a4mr14975243pat.19.1444982409755;
	Fri, 16 Oct 2015 01:00:09 -0700 (PDT)
Received: from imac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169]) by smtp.gmail.com with ESMTPSA id
	ln10sm19671535pab.29.2015.10.16.01.00.09
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Oct 2015 01:00:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Oct 2015 01:00:00 -0700
Message-Id: <5954522962ed83ab3435292920899d258f7a76f4.1444982178.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <10ea250a6d2383cde4f6c3f72e0f527c3b82de42.1444982178.git.raj.khem@gmail.com>
References: <10ea250a6d2383cde4f6c3f72e0f527c3b82de42.1444982178.git.raj.khem@gmail.com>
In-Reply-To: <cover.1444982178.git.raj.khem@gmail.com>
References: <cover.1444982178.git.raj.khem@gmail.com>
Subject: [PATCH 6/9] libpam: Fix build with uclibc
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
X-List-Received-Date: Fri, 16 Oct 2015 08:00:09 -0000

libpam needs to adjust for posix utmpx
uclibc now disables utmp

Change-Id: Ibcb7cb621527f318eb8b6e2741647ccb4c6bb39c
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/pam/libpam/use-utmpx.patch | 233 +++++++++++++++++++++++
 meta/recipes-extended/pam/libpam_1.2.1.bb        |   4 +-
 2 files changed, 236 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/pam/libpam/use-utmpx.patch

diff --git a/meta/recipes-extended/pam/libpam/use-utmpx.patch b/meta/recipes-extended/pam/libpam/use-utmpx.patch
new file mode 100644
index 0000000..dd04bbb
--- /dev/null
+++ b/meta/recipes-extended/pam/libpam/use-utmpx.patch
@@ -0,0 +1,233 @@
+utmp() may not be configured in and use posix compliant utmpx always
+UTMP is SVID legacy, UTMPX is mandated by POSIX
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Index: Linux-PAM-1.2.1/libpam/pam_modutil_getlogin.c
+===================================================================
+--- Linux-PAM-1.2.1.orig/libpam/pam_modutil_getlogin.c
++++ Linux-PAM-1.2.1/libpam/pam_modutil_getlogin.c
+@@ -10,8 +10,7 @@
+ 
+ #include <stdlib.h>
+ #include <unistd.h>
+-#include <utmp.h>
+-
++#include <utmpx.h>
+ #define _PAMMODUTIL_GETLOGIN "_pammodutil_getlogin"
+ 
+ const char *
+@@ -22,7 +21,7 @@ pam_modutil_getlogin(pam_handle_t *pamh)
+     const void *void_curr_tty;
+     const char *curr_tty;
+     char *curr_user;
+-    struct utmp *ut, line;
++    struct utmpx *ut, line;
+ 
+     status = pam_get_data(pamh, _PAMMODUTIL_GETLOGIN, &logname);
+     if (status == PAM_SUCCESS) {
+@@ -48,10 +47,10 @@ pam_modutil_getlogin(pam_handle_t *pamh)
+     }
+     logname = NULL;
+ 
+-    setutent();
++    setutxent();
+     strncpy(line.ut_line, curr_tty, sizeof(line.ut_line));
+ 
+-    if ((ut = getutline(&line)) == NULL) {
++    if ((ut = getutxline(&line)) == NULL) {
+ 	goto clean_up_and_go_home;
+     }
+ 
+@@ -74,7 +73,7 @@ pam_modutil_getlogin(pam_handle_t *pamh)
+ 
+ clean_up_and_go_home:
+ 
+-    endutent();
++    endutxent();
+ 
+     return logname;
+ }
+Index: Linux-PAM-1.2.1/modules/pam_issue/pam_issue.c
+===================================================================
+--- Linux-PAM-1.2.1.orig/modules/pam_issue/pam_issue.c
++++ Linux-PAM-1.2.1/modules/pam_issue/pam_issue.c
+@@ -25,7 +25,7 @@
+ #include <string.h>
+ #include <unistd.h>
+ #include <sys/utsname.h>
+-#include <utmp.h>
++#include <utmpx.h>
+ #include <time.h>
+ #include <syslog.h>
+ 
+@@ -246,13 +246,13 @@ read_issue_quoted(pam_handle_t *pamh, FI
+ 	      case 'U':
+ 		{
+ 		    unsigned int users = 0;
+-		    struct utmp *ut;
+-		    setutent();
+-		    while ((ut = getutent())) {
++		    struct utmpx *ut;
++		    setutxent();
++		    while ((ut = getutxent())) {
+ 			if (ut->ut_type == USER_PROCESS)
+ 			    ++users;
+ 		    }
+-		    endutent();
++		    endutxent();
+ 		    if (c == 'U')
+ 			snprintf (buf, sizeof buf, "%u %s", users,
+ 			          (users == 1) ? "user" : "users");
+Index: Linux-PAM-1.2.1/modules/pam_lastlog/pam_lastlog.c
+===================================================================
+--- Linux-PAM-1.2.1.orig/modules/pam_lastlog/pam_lastlog.c
++++ Linux-PAM-1.2.1/modules/pam_lastlog/pam_lastlog.c
+@@ -15,8 +15,9 @@
+ #include <errno.h>
+ #ifdef HAVE_UTMP_H
+ # include <utmp.h>
+-#else
+-# include <lastlog.h>
++#endif
++#ifdef HAVE_UTMPX_H
++# include <utmpx.h>
+ #endif
+ #include <pwd.h>
+ #include <stdlib.h>
+@@ -27,6 +28,12 @@
+ #include <syslog.h>
+ #include <unistd.h>
+ 
++#ifndef HAVE_UTMP_H
++#define UT_LINESIZE 32
++#define UT_HOSTSIZE 32
++#define UT_NAMESIZE 256
++#endif
++
+ #if defined(hpux) || defined(sunos) || defined(solaris)
+ # ifndef _PATH_LASTLOG
+ #  define _PATH_LASTLOG "/usr/adm/lastlog"
+@@ -38,7 +45,7 @@
+ #  define UT_LINESIZE 12
+ # endif /* UT_LINESIZE */
+ #endif
+-#if defined(hpux)
++#if defined(hpux) || !defined HAVE_UTMP_H
+ struct lastlog {
+     time_t  ll_time;
+     char    ll_line[UT_LINESIZE];
+@@ -447,8 +454,8 @@ last_login_failed(pam_handle_t *pamh, in
+ {
+     int retval;
+     int fd;
+-    struct utmp ut;
+-    struct utmp utuser;
++    struct utmpx ut;
++    struct utmpx utuser;
+     int failed = 0;
+     char the_time[256];
+     char *date = NULL;
+Index: Linux-PAM-1.2.1/modules/pam_limits/pam_limits.c
+===================================================================
+--- Linux-PAM-1.2.1.orig/modules/pam_limits/pam_limits.c
++++ Linux-PAM-1.2.1/modules/pam_limits/pam_limits.c
+@@ -33,7 +33,7 @@
+ #include <sys/resource.h>
+ #include <limits.h>
+ #include <glob.h>
+-#include <utmp.h>
++#include <utmpx.h>
+ #ifndef UT_USER  /* some systems have ut_name instead of ut_user */
+ #define UT_USER ut_user
+ #endif
+@@ -227,7 +227,7 @@ static int
+ check_logins (pam_handle_t *pamh, const char *name, int limit, int ctrl,
+               struct pam_limit_s *pl)
+ {
+-    struct utmp *ut;
++    struct utmpx *ut;
+     int count;
+ 
+     if (ctrl & PAM_DEBUG_ARG) {
+@@ -242,7 +242,7 @@ check_logins (pam_handle_t *pamh, const
+         return LOGIN_ERR;
+     }
+ 
+-    setutent();
++    setutxent();
+ 
+     /* Because there is no definition about when an application
+        actually adds a utmp entry, some applications bizarrely do the
+@@ -260,7 +260,7 @@ check_logins (pam_handle_t *pamh, const
+ 	count = 1;
+     }
+ 
+-    while((ut = getutent())) {
++    while((ut = getutxent())) {
+ #ifdef USER_PROCESS
+         if (ut->ut_type != USER_PROCESS) {
+             continue;
+@@ -296,7 +296,7 @@ check_logins (pam_handle_t *pamh, const
+ 	    break;
+ 	}
+     }
+-    endutent();
++    endutxent();
+     if (count > limit) {
+ 	if (name) {
+ 	    pam_syslog(pamh, LOG_WARNING,
+Index: Linux-PAM-1.2.1/modules/pam_timestamp/pam_timestamp.c
+===================================================================
+--- Linux-PAM-1.2.1.orig/modules/pam_timestamp/pam_timestamp.c
++++ Linux-PAM-1.2.1/modules/pam_timestamp/pam_timestamp.c
+@@ -56,7 +56,7 @@
+ #include <time.h>
+ #include <sys/time.h>
+ #include <unistd.h>
+-#include <utmp.h>
++#include <utmpx.h>
+ #include <syslog.h>
+ #include <paths.h>
+ #include "hmacsha1.h"
+@@ -197,15 +197,15 @@ timestamp_good(time_t then, time_t now,
+ static int
+ check_login_time(const char *ruser, time_t timestamp)
+ {
+-	struct utmp utbuf, *ut;
++	struct utmpx utbuf, *ut;
+ 	time_t oldest_login = 0;
+ 
+-	setutent();
++	setutxent();
+ 	while(
+ #ifdef HAVE_GETUTENT_R
+-	      !getutent_r(&utbuf, &ut)
++	      !getutxent_r(&utbuf, &ut)
+ #else
+-	      (ut = getutent()) != NULL
++	      (ut = getutxent()) != NULL
+ #endif
+ 	      ) {
+ 		if (ut->ut_type != USER_PROCESS) {
+@@ -218,7 +218,7 @@ check_login_time(const char *ruser, time
+ 			oldest_login = ut->ut_tv.tv_sec;
+ 		}
+ 	}
+-	endutent();
++	endutxent();
+ 	if(oldest_login == 0 || timestamp < oldest_login) {
+ 		return PAM_AUTH_ERR;
+ 	}
+Index: Linux-PAM-1.2.1/modules/pam_unix/support.c
+===================================================================
+--- Linux-PAM-1.2.1.orig/modules/pam_unix/support.c
++++ Linux-PAM-1.2.1/modules/pam_unix/support.c
+@@ -13,7 +13,6 @@
+ #include <pwd.h>
+ #include <shadow.h>
+ #include <limits.h>
+-#include <utmp.h>
+ #include <errno.h>
+ #include <signal.h>
+ #include <ctype.h>
diff --git a/meta/recipes-extended/pam/libpam_1.2.1.bb b/meta/recipes-extended/pam/libpam_1.2.1.bb
index ac3097e..0353356 100644
--- a/meta/recipes-extended/pam/libpam_1.2.1.bb
+++ b/meta/recipes-extended/pam/libpam_1.2.1.bb
@@ -28,7 +28,9 @@ SRC_URI = "http://linux-pam.org/library/Linux-PAM-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "9dc53067556d2dd567808fd509519dd6"
 SRC_URI[sha256sum] = "342b1211c0d3b203a7df2540a5b03a428a087bd8a48c17e49ae268f992b334d9"
 
-SRC_URI_append_libc-uclibc = " file://pam-no-innetgr.patch"
+SRC_URI_append_libc-uclibc = " file://pam-no-innetgr.patch \
+                               file://use-utmpx.patch"
+
 SRC_URI_append_libc-musl = " file://pam-no-innetgr.patch"
 
 DEPENDS = "bison flex flex-native cracklib"
-- 
2.6.1


