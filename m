Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EADECD13D1
	for <webhook@archiver.kernel.org>; Sun, 17 Sep 2023 09:39:16 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.27134.1694943549099218495
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Sep 2023 02:39:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j9mkOsqQ;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-9a9d82d73f9so430721866b.3
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 02:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694943547; x=1695548347; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LQsNPJYYQbYfILYgW3KrAFG7KOteveEW6K0ZATtRAn8=;
        b=j9mkOsqQWaRd5cLQEAQmIK8tBAzMU0PKtK8EfVaie4kLANzW6LIhL4nqAyvGN/4K7b
         FU3t5w7DlaOGNa3o9A9kdWPIRBIYaOQm4FCKejsmphDYh1ZsN3ve+Mb6RxQaehsyCxxS
         sctiaoS50iY5kMiO8yE20J0h329jiyIRbt0Oog7FkFDbnCfgdzOVu/Ws7Yzc/SCXiAF6
         KUGPl1Gw2yIr0lHVZr3tU9mx1t3xKixj+L8SrPRjiINEct2+gNhSCaHrBNNGps5w8ksL
         VtB5s91sXftGM7Tx/23T0trIJBYT9bE3vMtsqOOta8zzjNTj4bwwTlrMOVv5HAbBUS9y
         g3XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694943547; x=1695548347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LQsNPJYYQbYfILYgW3KrAFG7KOteveEW6K0ZATtRAn8=;
        b=WS81FSMReYNCuLxUfKk1VNE/GFk356JibU3NgTI6Y43StZosQaUxjcHddTfgNgnCRo
         h50EGHMb6rYvJcDTZCt608FsdBqqzxo2MQlsPwfY4hxSGidUyMbgF8v1AfwZ6LwIWFLE
         hJXwNKvMYwInzmi9lpGUeTMD+RmQSO5lk/yzQ3W3My/Lzydm3ys1EE25C04K03MqRC+x
         JiOjozFwn3yyF/Unw15zVCtSQrpFGWqvUvAj6RxiTUDxYAlTGV37Szn7Fyp4TrJcsRLS
         /PERS6W5giezdf2fg0jXXGtZGqiUJSIPhW9WXWB2dPb78E07sugnm5adwC+KqP+uNUla
         9yLA==
X-Gm-Message-State: AOJu0YzZKRfyB/dYVNnlUbE+s9RvCs2aZoPY3w5/ilvJkrIJhdipkCNb
	P9rmBVtSNY/MzEFYOUB+qGAaBxwCUaU=
X-Google-Smtp-Source: AGHT+IFAkg93/aHE6q/ernnRgscV03HsV2dJu+KVpgIqM1D09iT8z67vugGI6PzYcwc0aJWuqypQcg==
X-Received: by 2002:a17:906:8a61:b0:9a2:185b:5375 with SMTP id hy1-20020a1709068a6100b009a2185b5375mr5221206ejc.18.1694943547033;
        Sun, 17 Sep 2023 02:39:07 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d8-20020a17090694c800b0099ce188be7fsm4779683ejy.3.2023.09.17.02.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 02:39:06 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/29] shadow: update 4.13 -> 4.14.0
Date: Sun, 17 Sep 2023 11:38:35 +0200
Message-Id: <20230917093901.428214-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230917093901.428214-1-alex@linutronix.de>
References: <20230917093901.428214-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 09:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187776

License-Update: formatting, spdx conversion

Drop:
0001-Disable-use-of-syslog-for-sysroot.patch
(issue fixed upstream)

0001-Fix-can-not-print-full-login.patch
0001-Overhaul-valid_field.patch
CVE-2023-29383.patch
(backports)

libbsd is a new native dependency, as otherwise glibc >= 2.38
is needed.

A similar fix is added to musl in order to define non-standard __BEGIN_DECLS/__END_DECLS.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...01-Disable-use-of-syslog-for-sysroot.patch | 52 ---------------
 .../0001-Fix-can-not-print-full-login.patch   | 41 ------------
 .../files/0001-Overhaul-valid_field.patch     | 65 -------------------
 .../shadow/files/CVE-2023-29383.patch         | 53 ---------------
 ...nexpected-open-failure-in-chroot-env.patch | 16 +++--
 meta/recipes-extended/shadow/shadow.inc       | 18 ++---
 .../{shadow_4.13.bb => shadow_4.14.0.bb}      |  0
 7 files changed, 16 insertions(+), 229 deletions(-)
 delete mode 100644 meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch
 delete mode 100644 meta/recipes-extended/shadow/files/0001-Fix-can-not-print-full-login.patch
 delete mode 100644 meta/recipes-extended/shadow/files/0001-Overhaul-valid_field.patch
 delete mode 100644 meta/recipes-extended/shadow/files/CVE-2023-29383.patch
 rename meta/recipes-extended/shadow/{shadow_4.13.bb => shadow_4.14.0.bb} (100%)

diff --git a/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch b/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch
deleted file mode 100644
index fa1532c8317..00000000000
--- a/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 85d0444229ee3d14fefcf10d093f49c862826f82 Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Thu, 14 Apr 2022 23:11:53 +0000
-Subject: [PATCH] Disable use of syslog for shadow-native tools
-
-Disable use of syslog to prevent sysroot user and group additions from
-writing entries to the host's syslog. This patch should only be used
-with the shadow-native recipe.
-
-Upstream-Status: Inappropriate [OE specific configuration]
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
-
----
- configure.ac      | 2 +-
- src/login_nopam.c | 3 ++-
- 2 files changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 924254a..603af81 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -191,7 +191,7 @@ AC_DEFINE_UNQUOTED(PASSWD_PROGRAM, "$shadow_cv_passwd_dir/passwd",
- 	[Path to passwd program.])
- 
- dnl XXX - quick hack, should disappear before anyone notices :).
--AC_DEFINE(USE_SYSLOG, 1, [Define to use syslog().])
-+#AC_DEFINE(USE_SYSLOG, 1, [Define to use syslog().])
- if test "$ac_cv_func_ruserok" = "yes"; then
- 	AC_DEFINE(RLOGIN, 1, [Define if login should support the -r flag for rlogind.])
- 	AC_DEFINE(RUSEROK, 0, [Define to the ruserok() "success" return value (0 or 1).])
-diff --git a/src/login_nopam.c b/src/login_nopam.c
-index df6ba88..fc24e13 100644
---- a/src/login_nopam.c
-+++ b/src/login_nopam.c
-@@ -29,7 +29,6 @@
- #ifndef USE_PAM
- #ident "$Id$"
- 
--#include "prototypes.h"
-     /*
-      * This module implements a simple but effective form of login access
-      * control based on login names and on host (or domain) names, internet
-@@ -57,6 +56,8 @@
- #include <netinet/in.h>
- #include <arpa/inet.h>		/* for inet_ntoa() */
- 
-+#include "prototypes.h"
-+
- #if !defined(MAXHOSTNAMELEN) || (MAXHOSTNAMELEN < 64)
- #undef MAXHOSTNAMELEN
- #define MAXHOSTNAMELEN 256
diff --git a/meta/recipes-extended/shadow/files/0001-Fix-can-not-print-full-login.patch b/meta/recipes-extended/shadow/files/0001-Fix-can-not-print-full-login.patch
deleted file mode 100644
index 37ba5f3dc21..00000000000
--- a/meta/recipes-extended/shadow/files/0001-Fix-can-not-print-full-login.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-commit 670cae834827a8f794e6f7464fa57790d911b63c
-Author: SoumyaWind <121475834+SoumyaWind@users.noreply.github.com>
-Date:   Tue Dec 27 17:40:17 2022 +0530
-
-    shadow: Fix can not print full login timeout message
-    
-    Login timed out message prints only first few bytes when write is immediately followed by exit.
-    Calling exit from new handler provides enough time to display full message.
-
-Upstream-Status: Accepted [https://github.com/shadow-maint/shadow/commit/670cae834827a8f794e6f7464fa57790d911b63c]
-
-diff --git a/src/login.c b/src/login.c
-index 116e2cb3..c55f4de0 100644
---- a/src/login.c
-+++ b/src/login.c
-@@ -120,6 +120,7 @@ static void get_pam_user (char **ptr_pam_user);
- 
- static void init_env (void);
- static void alarm_handler (int);
-+static void exit_handler (int);
- 
- /*
-  * usage - print login command usage and exit
-@@ -391,11 +392,16 @@ static void init_env (void)
- #endif				/* !USE_PAM */
- }
- 
-+static void exit_handler (unused int sig)
-+{
-+	_exit (0);
-+}
- 
- static void alarm_handler (unused int sig)
- {
- 	write (STDERR_FILENO, tmsg, strlen (tmsg));
--	_exit (0);
-+	signal(SIGALRM, exit_handler);
-+	alarm(2);
- }
- 
- #ifdef USE_PAM
diff --git a/meta/recipes-extended/shadow/files/0001-Overhaul-valid_field.patch b/meta/recipes-extended/shadow/files/0001-Overhaul-valid_field.patch
deleted file mode 100644
index ac08be515bf..00000000000
--- a/meta/recipes-extended/shadow/files/0001-Overhaul-valid_field.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 2eaea70111f65b16d55998386e4ceb4273c19eb4 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
-Date: Fri, 31 Mar 2023 14:46:50 +0200
-Subject: [PATCH] Overhaul valid_field()
-
-e5905c4b ("Added control character check") introduced checking for
-control characters but had the logic inverted, so it rejects all
-characters that are not control ones.
-
-Cast the character to `unsigned char` before passing to the character
-checking functions to avoid UB.
-
-Use strpbrk(3) for the illegal character test and return early.
-
-Upstream-Status: Backport [https://github.com/shadow-maint/shadow/commit/2eaea70111f65b16d55998386e4ceb4273c19eb4]
-
-Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
----
- lib/fields.c | 24 ++++++++++--------------
- 1 file changed, 10 insertions(+), 14 deletions(-)
-
-diff --git a/lib/fields.c b/lib/fields.c
-index fb51b582..53929248 100644
---- a/lib/fields.c
-+++ b/lib/fields.c
-@@ -37,26 +37,22 @@ int valid_field (const char *field, const char *illegal)
- 
- 	/* For each character of field, search if it appears in the list
- 	 * of illegal characters. */
-+	if (illegal && NULL != strpbrk (field, illegal)) {
-+		return -1;
-+	}
-+
-+	/* Search if there are non-printable or control characters */
- 	for (cp = field; '\0' != *cp; cp++) {
--		if (strchr (illegal, *cp) != NULL) {
-+		unsigned char c = *cp;
-+		if (!isprint (c)) {
-+			err = 1;
-+		}
-+		if (iscntrl (c)) {
- 			err = -1;
- 			break;
- 		}
- 	}
- 
--	if (0 == err) {
--		/* Search if there are non-printable or control characters */
--		for (cp = field; '\0' != *cp; cp++) {
--			if (!isprint (*cp)) {
--				err = 1;
--			}
--			if (!iscntrl (*cp)) {
--				err = -1;
--				break;
--			}
--		}
--	}
--
- 	return err;
- }
- 
--- 
-2.34.1
-
diff --git a/meta/recipes-extended/shadow/files/CVE-2023-29383.patch b/meta/recipes-extended/shadow/files/CVE-2023-29383.patch
deleted file mode 100644
index f53341d3fc2..00000000000
--- a/meta/recipes-extended/shadow/files/CVE-2023-29383.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From e5905c4b84d4fb90aefcd96ee618411ebfac663d Mon Sep 17 00:00:00 2001
-From: tomspiderlabs <128755403+tomspiderlabs@users.noreply.github.com>
-Date: Thu, 23 Mar 2023 23:39:38 +0000
-Subject: [PATCH] Added control character check
-
-Added control character check, returning -1 (to "err") if control characters are present.
-
-CVE: CVE-2023-29383
-Upstream-Status: Backport
-
-Reference to upstream:
-https://github.com/shadow-maint/shadow/commit/e5905c4b84d4fb90aefcd96ee618411ebfac663d
-
-Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
----
- lib/fields.c | 11 +++++++----
- 1 file changed, 7 insertions(+), 4 deletions(-)
-
-diff --git a/lib/fields.c b/lib/fields.c
-index 640be931..fb51b582 100644
---- a/lib/fields.c
-+++ b/lib/fields.c
-@@ -21,9 +21,9 @@
-  *
-  * The supplied field is scanned for non-printable and other illegal
-  * characters.
-- *  + -1 is returned if an illegal character is present.
-- *  +  1 is returned if no illegal characters are present, but the field
-- *       contains a non-printable character.
-+ *  + -1 is returned if an illegal or control character is present.
-+ *  +  1 is returned if no illegal or control characters are present,
-+ *       but the field contains a non-printable character.
-  *  +  0 is returned otherwise.
-  */
- int valid_field (const char *field, const char *illegal)
-@@ -45,10 +45,13 @@ int valid_field (const char *field, const char *illegal)
- 	}
- 
- 	if (0 == err) {
--		/* Search if there are some non-printable characters */
-+		/* Search if there are non-printable or control characters */
- 		for (cp = field; '\0' != *cp; cp++) {
- 			if (!isprint (*cp)) {
- 				err = 1;
-+			}
-+			if (!iscntrl (*cp)) {
-+				err = -1;
- 				break;
- 			}
- 		}
--- 
-2.34.1
-
diff --git a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
index 85d91751056..4a932d2dbb1 100644
--- a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
+++ b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
@@ -1,4 +1,4 @@
-From 21583da072aa66901d859ac00ce209bac87ddecc Mon Sep 17 00:00:00 2001
+From a773c6b240d27e23d6be41decef0edf24fcee523 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 17 Jul 2014 15:53:34 +0800
 Subject: [PATCH] commonio.c-fix-unexpected-open-failure-in-chroot-env
@@ -15,35 +15,37 @@ Note that this patch doesn't change the logic in the code, it just expands
 the codes.
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-
 ---
  lib/commonio.c | 16 ++++++++++++----
  1 file changed, 12 insertions(+), 4 deletions(-)
 
 diff --git a/lib/commonio.c b/lib/commonio.c
-index 9a02ce1..61384ec 100644
+index 73fdb3a..d1231e9 100644
 --- a/lib/commonio.c
 +++ b/lib/commonio.c
-@@ -616,10 +616,18 @@ int commonio_open (struct commonio_db *db, int mode)
+@@ -606,10 +606,18 @@ int commonio_open (struct commonio_db *db, int mode)
  	db->cursor = NULL;
  	db->changed = false;
  
 -	fd = open (db->filename,
 -	             (db->readonly ? O_RDONLY : O_RDWR)
--	           | O_NOCTTY | O_NONBLOCK | O_NOFOLLOW);
+-	           | O_NOCTTY | O_NONBLOCK | O_NOFOLLOW | O_CLOEXEC);
 -	saved_errno = errno;
 +	if (db->readonly) {
 +		fd = open (db->filename,
 +			   (true ? O_RDONLY : O_RDWR)
-+			   | O_NOCTTY | O_NONBLOCK | O_NOFOLLOW);
++			   | O_NOCTTY | O_NONBLOCK | O_NOFOLLOW | O_CLOEXEC);
 +		saved_errno = errno;
 +	} else {
 +		fd = open (db->filename,
 +			   (false ? O_RDONLY : O_RDWR)
-+			   | O_NOCTTY | O_NONBLOCK | O_NOFOLLOW);
++			   | O_NOCTTY | O_NONBLOCK | O_NOFOLLOW| O_CLOEXEC);
 +		saved_errno = errno;
 +	}
 +
  	db->fp = NULL;
  	if (fd >= 0) {
  #ifdef WITH_TCB
+-- 
+2.30.2
+
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 83e1a847693..bba69d523c3 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -5,7 +5,7 @@ BUGTRACKER = "http://github.com/shadow-maint/shadow/issues"
 SECTION = "base/utils"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c9a450b7be84eac23e6353efecb60b5b \
-                    file://src/passwd.c;beginline=2;endline=30;md5=758c26751513b6795395275969dd3be1 \
+                    file://src/passwd.c;beginline=2;endline=7;md5=67bcf314687820b2f010d4863fce3fc5 \
                     "
 
 DEPENDS = "virtual/crypt"
@@ -14,9 +14,6 @@ GITHUB_BASE_URI = "https://github.com/shadow-maint/shadow/releases"
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://useradd \
-	   file://0001-Fix-can-not-print-full-login.patch \
-           file://CVE-2023-29383.patch \
-           file://0001-Overhaul-valid_field.patch \
            "
 
 SRC_URI:append:class-target = " \
@@ -25,13 +22,9 @@ SRC_URI:append:class-target = " \
            "
 
 SRC_URI:append:class-native = " \
-           file://0001-Disable-use-of-syslog-for-sysroot.patch \
            file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
            "
-SRC_URI:append:class-nativesdk = " \
-           file://0001-Disable-use-of-syslog-for-sysroot.patch \
-           "
-SRC_URI[sha256sum] = "813057047499c7fe81108adcf0cffa3ad4ec75e19a80151f9cbaa458ff2e86cd"
+SRC_URI[sha256sum] = "51833444e3b183e023eb12da0cc1cecfcb839ba77f12f4ad551b2e3a9e950597"
 
 
 # Additional Policy files for PAM
@@ -43,7 +36,7 @@ PAM_SRC_URI = "file://pam.d/chfn \
                file://pam.d/passwd \
                file://pam.d/su"
 
-inherit autotools gettext github-releases
+inherit autotools gettext github-releases pkgconfig
 
 export CONFIG_SHELL="/bin/sh"
 
@@ -53,6 +46,8 @@ EXTRA_OECONF += "--without-libcrack \
                  --without-sssd \
                  ${NSCDOPT}"
 
+CFLAGS:append:libc-musl = " -DLIBBSD_OVERLAY"
+
 NSCDOPT = ""
 NSCDOPT:class-native = "--without-nscd"
 NSCDOPT:class-nativesdk = "--without-nscd"
@@ -72,13 +67,14 @@ PAM_PLUGINS = "libpam-runtime \
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)}"
-PACKAGECONFIG:class-native ??= "${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)}"
+PACKAGECONFIG:class-native ??= "${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)} libbsd"
 PACKAGECONFIG:class-nativesdk = ""
 PACKAGECONFIG[pam] = "--with-libpam,--without-libpam,libpam,${PAM_PLUGINS}"
 PACKAGECONFIG[attr] = "--with-attr,--without-attr,attr"
 PACKAGECONFIG[acl] = "--with-acl,--without-acl,acl"
 PACKAGECONFIG[audit] = "--with-audit,--without-audit,audit"
 PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux libsemanage"
+PACKAGECONFIG[libbsd] = "--with-libbsd,--without-libbsd,libbsd"
 
 RDEPENDS:${PN} = "shadow-securetty \
                   base-passwd \
diff --git a/meta/recipes-extended/shadow/shadow_4.13.bb b/meta/recipes-extended/shadow/shadow_4.14.0.bb
similarity index 100%
rename from meta/recipes-extended/shadow/shadow_4.13.bb
rename to meta/recipes-extended/shadow/shadow_4.14.0.bb
-- 
2.30.2


