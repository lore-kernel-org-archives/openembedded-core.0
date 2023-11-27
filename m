Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69815C07D5B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 10:18:07 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.91590.1701080283052440936
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 02:18:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N70Rz1jQ;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a02cc476581so533312066b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 02:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701080281; x=1701685081; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BneVUPYP2EGt8QfnmZpcFFlCTmrwjpZ2AFGqU/EkK+s=;
        b=N70Rz1jQYV845enAEszcjv/pENJOjgtFZcsYl+QruNpdPbLeW/fif/tCMLiST9KEKV
         qF1cJUOom80VPGhedrdMheRHUppHcc+QILLB6iF7VqU+Ead6DGoUzPBpeARBDt0sg/79
         ey8dhktKSemge1yr6m413/Cwo6fkgQxjaqwls+VeAiER9AaCZNc4p+nssg5ShYvlMg8R
         dUsO2Vh3jcFZa0Va5LWt6nmjwPGVxJ1zWvAfB0yk4Wr47WuOcMjX265En7ihFaACu2JC
         Wors1IaneMXcbHKHrzZKasexetAIUUJgI9jgkMxWxzndUdAiWV4ad7oMsDHlQA3H+rNP
         OQdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701080281; x=1701685081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BneVUPYP2EGt8QfnmZpcFFlCTmrwjpZ2AFGqU/EkK+s=;
        b=m1VstiFLiNjLsC2cZTCy5VDhuoLg1LmDExGmrYOfrsUT77sLw09vLth5gDAjOqgQ4+
         VDIe1zpPvmsXpbhLOAwELiZpy0lchfrHw69tm4ta+RdiKaLdhCAvG7ZiFsTM+9qYQGG7
         HAyMOaS3NG6cBKI2DKv5sdxK7b0xE57ZsogmPWXG0yPDGnEW2WwpNz9QMLeW2ssS3GYM
         tgD81QYgRqBmBwcfMGicfEwKfUJXvYe8XE1A8r623giGNqd+m8/QzLD6qE5kKXMs4MzV
         CZkSv4qglmcHkMRhx3S9RVrt+o4XhaFRcxdP6Yf+PDLHcSwbh+iuC+NG1z3VdWqx7FB4
         lSvA==
X-Gm-Message-State: AOJu0Yw5lXyXt3FAc0PXvd4D73rp7iYc64+sNiYqtZzsmxSyLGK3HcdU
	pmgiDL1IJMhlckxfAT6YD2NwKQuUj7w=
X-Google-Smtp-Source: AGHT+IFW6k5ErGTH3A/ww8dm/pe2vGm5i8nUIv4G9zLUL52zj7f0lqTdagvNvyHw7sclgjt3p8ry8g==
X-Received: by 2002:a17:906:c0a:b0:a04:45c6:c261 with SMTP id s10-20020a1709060c0a00b00a0445c6c261mr7955637ejf.66.1701080281140;
        Mon, 27 Nov 2023 02:18:01 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h26-20020a170906585a00b00a0bf09c9483sm2757203ejs.35.2023.11.27.02.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 02:18:00 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/19] shadow: update 4.13 -> 4.14.2
Date: Mon, 27 Nov 2023 11:17:35 +0100
Message-Id: <20231127101751.3187950-3-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231127101751.3187950-1-alex@linutronix.de>
References: <20231127101751.3187950-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 10:18:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191270

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
 meta/recipes-extended/shadow/shadow.inc       | 19 ++----
 .../{shadow_4.13.bb => shadow_4.14.2.bb}      |  0
 7 files changed, 16 insertions(+), 230 deletions(-)
 delete mode 100644 meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch
 delete mode 100644 meta/recipes-extended/shadow/files/0001-Fix-can-not-print-full-login.patch
 delete mode 100644 meta/recipes-extended/shadow/files/0001-Overhaul-valid_field.patch
 delete mode 100644 meta/recipes-extended/shadow/files/CVE-2023-29383.patch
 rename meta/recipes-extended/shadow/{shadow_4.13.bb => shadow_4.14.2.bb} (100%)

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
index 89f9c05c8d3..00000000000
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
-Upstream-Status: Backport [https://github.com/shadow-maint/shadow/commit/670cae834827a8f794e6f7464fa57790d911b63c]
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
index 83e1a847693..c024746d4ff 100644
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
@@ -25,14 +22,9 @@ SRC_URI:append:class-target = " \
            "
 
 SRC_URI:append:class-native = " \
-           file://0001-Disable-use-of-syslog-for-sysroot.patch \
            file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
            "
-SRC_URI:append:class-nativesdk = " \
-           file://0001-Disable-use-of-syslog-for-sysroot.patch \
-           "
-SRC_URI[sha256sum] = "813057047499c7fe81108adcf0cffa3ad4ec75e19a80151f9cbaa458ff2e86cd"
-
+SRC_URI[sha256sum] = "a305edf5d19bddbdf5e836d2d609fa8bff2d35458819de4d9f06306a1cf24342"
 
 # Additional Policy files for PAM
 PAM_SRC_URI = "file://pam.d/chfn \
@@ -43,7 +35,7 @@ PAM_SRC_URI = "file://pam.d/chfn \
                file://pam.d/passwd \
                file://pam.d/su"
 
-inherit autotools gettext github-releases
+inherit autotools gettext github-releases pkgconfig
 
 export CONFIG_SHELL="/bin/sh"
 
@@ -53,6 +45,8 @@ EXTRA_OECONF += "--without-libcrack \
                  --without-sssd \
                  ${NSCDOPT}"
 
+CFLAGS:append:libc-musl = " -DLIBBSD_OVERLAY"
+
 NSCDOPT = ""
 NSCDOPT:class-native = "--without-nscd"
 NSCDOPT:class-nativesdk = "--without-nscd"
@@ -72,13 +66,14 @@ PAM_PLUGINS = "libpam-runtime \
 
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
diff --git a/meta/recipes-extended/shadow/shadow_4.13.bb b/meta/recipes-extended/shadow/shadow_4.14.2.bb
similarity index 100%
rename from meta/recipes-extended/shadow/shadow_4.13.bb
rename to meta/recipes-extended/shadow/shadow_4.14.2.bb
-- 
2.39.2


