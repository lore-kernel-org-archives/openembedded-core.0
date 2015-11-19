Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 7351B62136
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 17:11:10 +0000 (UTC)
Received: by qkao63 with SMTP id o63so27736877qka.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 09:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=d2FOsGo4HsjWe6+FTbK7H7CG3JGBOu/uVagbRaxRwOo=;
	b=AgFyx21OsiZJ/bKjYJctGbk7sBycS/FhkPEH8mkdJ52jtNt8p2Z5j35OTCuwFLsiY8
	AujCO/IHbAnGmHDVDt2sN7TxAZXeeF8uAB05oeNRy+ifu3e+ryBYNrphMx38dtk09irH
	f8lcKE8Rmx4YyJ1ebHhPDbTxv5bU8VHkBPXCct3FPC2rAMOrKHpZ71hygcss7oH5Li5c
	MNOUECmi4rRT8kf8f6skmCuV3epv9FrUGQBUenXFV6Scn2R+85+8nju15g0fasxkrhFq
	6yOSUua8ZWcqpBywC8FKhlc4cGi/ZW/QZ0J1N2tdEtE8+ACTHNcXCfEjptRlHRxgN47N
	ljUQ==
X-Received: by 10.55.75.21 with SMTP id y21mr8206844qka.2.1447953071785;
	Thu, 19 Nov 2015 09:11:11 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	v138sm2586127qka.6.2015.11.19.09.11.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 19 Nov 2015 09:11:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Nov 2015 17:10:59 +0000
Message-Id: <f5062d6e93c5895cd76440eb39f9aa25473cf660.1447952784.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <a13855998ddc7628c374b810079d9c1e1ee7a213.1447952784.git.raj.khem@gmail.com>
References: <a13855998ddc7628c374b810079d9c1e1ee7a213.1447952784.git.raj.khem@gmail.com>
In-Reply-To: <cover.1447952784.git.raj.khem@gmail.com>
References: <cover.1447952784.git.raj.khem@gmail.com>
Subject: [PATCH 12/13] libpam: Fix build with musl
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
X-List-Received-Date: Thu, 19 Nov 2015 17:11:11 -0000

Define strndupa if not available in libc additionally fix headers
to explicitly needed include files which glibc was including indirectly

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...upport-for-defining-missing-funcitonality.patch | 68 ++++++++++++++++++++++
 .../pam/libpam/include_paths_header.patch          | 59 +++++++++++++++++++
 meta/recipes-extended/pam/libpam_1.2.1.bb          |  5 +-
 3 files changed, 131 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/pam/libpam/0001-Add-support-for-defining-missing-funcitonality.patch
 create mode 100644 meta/recipes-extended/pam/libpam/include_paths_header.patch

diff --git a/meta/recipes-extended/pam/libpam/0001-Add-support-for-defining-missing-funcitonality.patch b/meta/recipes-extended/pam/libpam/0001-Add-support-for-defining-missing-funcitonality.patch
new file mode 100644
index 0000000..c55b648
--- /dev/null
+++ b/meta/recipes-extended/pam/libpam/0001-Add-support-for-defining-missing-funcitonality.patch
@@ -0,0 +1,68 @@
+From 45d1ed58927593968faead7dbb295f3922f41a2f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 8 Aug 2015 14:16:43 -0700
+Subject: [PATCH] Add support for defining missing funcitonality
+
+In order to support alternative libc on linux ( musl, bioninc ) etc we
+need to check for glibc-only features and provide alternatives, in this
+list strndupa is first one, when configure detects that its not included
+in system C library then the altrnative implementation from missing.h is
+used
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ configure.ac                |  3 +++
+ libpam/include/missing.h    | 12 ++++++++++++
+ modules/pam_exec/pam_exec.c |  1 +
+ 3 files changed, 16 insertions(+)
+ create mode 100644 libpam/include/missing.h
+
+diff --git a/configure.ac b/configure.ac
+index 9e1257f..cbed979 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -599,6 +599,9 @@ dnl
+ AC_CHECK_DECL(__NR_keyctl, [have_key_syscalls=1],[have_key_syscalls=0],[#include <sys/syscall.h>])
+ AC_CHECK_DECL(ENOKEY, [have_key_errors=1],[have_key_errors=0],[#include <errno.h>])
+ 
++# musl and bionic don't have strndupa
++AC_CHECK_DECLS_ONCE([strndupa])
++
+ HAVE_KEY_MANAGEMENT=0
+ if test $have_key_syscalls$have_key_errors = 11
+ then
+diff --git a/libpam/include/missing.h b/libpam/include/missing.h
+new file mode 100644
+index 0000000..3cf011c
+--- /dev/null
++++ b/libpam/include/missing.h
+@@ -0,0 +1,12 @@
++#pragma once
++
++#if !HAVE_DECL_STRNDUPA
++#define strndupa(s, n)                                                  \
++        ({                                                              \
++                const char *__old = (s);                                \
++                size_t __len = strnlen(__old, (n));                     \
++                char *__new = alloca(__len + 1);                        \
++                __new[__len] = '\0';                                    \
++                memcpy(__new, __old, __len);                            \
++         })
++#endif
+diff --git a/modules/pam_exec/pam_exec.c b/modules/pam_exec/pam_exec.c
+index 17ba6ca..3aa2694 100644
+--- a/modules/pam_exec/pam_exec.c
++++ b/modules/pam_exec/pam_exec.c
+@@ -59,6 +59,7 @@
+ #include <security/pam_modutil.h>
+ #include <security/pam_ext.h>
+ #include <security/_pam_macros.h>
++#include <missing.h>
+ 
+ #define ENV_ITEM(n) { (n), #n }
+ static struct {
+-- 
+2.1.4
+
diff --git a/meta/recipes-extended/pam/libpam/include_paths_header.patch b/meta/recipes-extended/pam/libpam/include_paths_header.patch
new file mode 100644
index 0000000..e4eb956
--- /dev/null
+++ b/meta/recipes-extended/pam/libpam/include_paths_header.patch
@@ -0,0 +1,59 @@
+This patch adds missing include for paths.h which should provide
+_PATH_LASTLOG definition
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Index: Linux-PAM-1.1.6/modules/pam_lastlog/pam_lastlog.c
+===================================================================
+--- Linux-PAM-1.1.6.orig/modules/pam_lastlog/pam_lastlog.c
++++ Linux-PAM-1.1.6/modules/pam_lastlog/pam_lastlog.c
+@@ -23,9 +23,11 @@
+ #include <stdarg.h>
+ #include <stdio.h>
+ #include <string.h>
++#include <sys/file.h>
+ #include <sys/types.h>
+ #include <syslog.h>
+ #include <unistd.h>
++#include <paths.h>
+ 
+ #if defined(hpux) || defined(sunos) || defined(solaris)
+ # ifndef _PATH_LASTLOG
+@@ -332,6 +334,23 @@ last_login_read(pam_handle_t *pamh, int
+     return retval;
+ }
+ 
++#ifndef __GLIBC__
++static void logwtmp(const char * line, const char * name, const char * host)
++{
++    struct utmp u;
++    memset(&u, 0, sizeof(u));
++
++    u.ut_pid = getpid();
++    u.ut_type = name[0] ? USER_PROCESS : DEAD_PROCESS;
++    strncpy(u.ut_line, line, sizeof(u.ut_line));
++    strncpy(u.ut_name, name, sizeof(u.ut_name));
++    strncpy(u.ut_host, host, sizeof(u.ut_host));
++    gettimeofday(&(u.ut_tv), NULL);
++
++    updwtmp(_PATH_WTMP, &u);
++}
++#endif /* __GLIBC__ */
++
+ static int
+ last_login_write(pam_handle_t *pamh, int announce, int last_fd,
+ 		 uid_t uid, const char *user)
+Index: Linux-PAM-1.1.6/modules/Makefile.am
+===================================================================
+--- Linux-PAM-1.1.6.orig/modules/Makefile.am
++++ Linux-PAM-1.1.6/modules/Makefile.am
+@@ -7,7 +7,7 @@ SUBDIRS = pam_access pam_cracklib pam_de
+ 	pam_group pam_issue pam_keyinit pam_lastlog pam_limits \
+ 	pam_listfile pam_localuser pam_loginuid pam_mail \
+ 	pam_mkhomedir pam_motd pam_namespace pam_nologin \
+-	pam_permit pam_pwhistory pam_rhosts pam_rootok pam_securetty \
++	pam_permit pam_pwhistory pam_rootok pam_securetty \
+ 	pam_selinux pam_sepermit pam_shells pam_stress \
+ 	pam_succeed_if pam_tally pam_tally2 pam_time pam_timestamp \
+ 	pam_tty_audit pam_umask \
diff --git a/meta/recipes-extended/pam/libpam_1.2.1.bb b/meta/recipes-extended/pam/libpam_1.2.1.bb
index 0353356..7e81e72 100644
--- a/meta/recipes-extended/pam/libpam_1.2.1.bb
+++ b/meta/recipes-extended/pam/libpam_1.2.1.bb
@@ -31,7 +31,10 @@ SRC_URI[sha256sum] = "342b1211c0d3b203a7df2540a5b03a428a087bd8a48c17e49ae268f992
 SRC_URI_append_libc-uclibc = " file://pam-no-innetgr.patch \
                                file://use-utmpx.patch"
 
-SRC_URI_append_libc-musl = " file://pam-no-innetgr.patch"
+SRC_URI_append_libc-musl = " file://pam-no-innetgr.patch \
+                             file://0001-Add-support-for-defining-missing-funcitonality.patch \
+                             file://include_paths_header.patch \
+                           "
 
 DEPENDS = "bison flex flex-native cracklib"
 
-- 
2.6.3


