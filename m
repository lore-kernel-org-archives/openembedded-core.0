Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 05AF67E079
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 01:43:21 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id a5so7552237pls.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 18:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=xggMSyb60c2BwtzA3A1RbJHAS3Xs4Y2QiOre/FbEOCk=;
	b=R7jgKDDz4crNfXvA1BTibVfsjEYlo4cMUKUCbEnvfOxFdXLbsNV59CBNqr56hab24D
	2yT7uU6b1tEjpeEtrcDtipz19Kn+zRY9YR5A2t0l4UZR6T24gZpACvAo4r5Pn1ijGPtV
	B6lWYpw73fZK0lZufMjIQB5qbn+GBITFzBPJj9UR169own63sM0CWeuagI8xdg4gahR4
	uMsp4b6oIuQ8pTT8iJxL0Dzf4OlDngv82URK1HSRxR5oNjN/ofcZ4uBb7nizFVVJWmVI
	lg1RgR5SH0wypSFfP/jX0MlShg4YmSFHvHFkKOotF5O/yAhhxYXxb+re7+xfjXaBF6Jm
	FBig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=xggMSyb60c2BwtzA3A1RbJHAS3Xs4Y2QiOre/FbEOCk=;
	b=f5s27BRh71Pu4iThp0WKsIuLZdr8eznzbamAwyNiJ01o3sjjhXISMcNMEWHZW8H1hv
	nPWlBy1WrwFdJHIX0B1ZdLTQMy8KqA4HybCf7KIWdrKteFx8Ip5Bvu2GGpD2pGTBECqT
	gHWI4zPuqz5iNHlOGPrNgHjFCzksk9YT9x1heEVvK5cM2HLf6pexs95zW08Cs48Lizke
	MA0rayTHOaJ+CYRVjacpn/oXzR/S7WUnyeGZf7V82Itw8Mbc33Xd9a/hGVaDKFix0h4Y
	SvlZ+3hS3s510TvDMJ5cSrG0OsfDPr2VpGtZqsCQYvwyWGTipoKPAaXo0Ew9jLN6rQPm
	/PTw==
X-Gm-Message-State: APjAAAUJ+ICcVnFFYvr4M1iuwussCBd2IGZ8u+cgahqSYyppiqcj4CLA
	rdI6HKdw8EcP8OSg7jbZMYZY1iH9
X-Google-Smtp-Source: APXvYqx9FJLtUZWFv5NqK5aJ3MY5xEocbb2jD7vJOhROB5H2hZ+OYsILY5Vj8fohEpboGn1v7aQv5g==
X-Received: by 2002:a17:902:7082:: with SMTP id
	z2mr56265523plk.176.1558403003046; 
	Mon, 20 May 2019 18:43:23 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:503:adbf:6ea3:61d2])
	by smtp.gmail.com with ESMTPSA id
	q5sm23079547pfb.51.2019.05.20.18.43.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 May 2019 18:43:22 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 18:43:04 -0700
Message-Id: <d7dac4925b2fcdacac2758a556ebdefaae4af1ee.1558402534.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1558402534.git.akuster808@gmail.com>
References: <cover.1558402534.git.akuster808@gmail.com>
Subject: [PATCH 02/15] shadow: Backport last change reproducibility
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
X-List-Received-Date: Tue, 21 May 2019 01:43:22 -0000

From: Alex Kiernan <alex.kiernan@gmail.com>

The third field in the /etc/shadow file (sp_lstchg) contains the date of
the last password change expressed as the number of days since Jan 1,
1970.

Backport the upstream changes to honour SOURCE_DATE_EPOCH for build
reproducibility.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...p_lstchg-shadow-field-reproducible-re.-71.patch | 89 ++++++++++++++++++++++
 ...002-gettime-Use-secure_getenv-over-getenv.patch | 71 +++++++++++++++++
 meta/recipes-extended/shadow/shadow.inc            |  2 +
 3 files changed, 162 insertions(+)
 create mode 100644 meta/recipes-extended/shadow/files/0001-Make-the-sp_lstchg-shadow-field-reproducible-re.-71.patch
 create mode 100644 meta/recipes-extended/shadow/files/0002-gettime-Use-secure_getenv-over-getenv.patch

diff --git a/meta/recipes-extended/shadow/files/0001-Make-the-sp_lstchg-shadow-field-reproducible-re.-71.patch b/meta/recipes-extended/shadow/files/0001-Make-the-sp_lstchg-shadow-field-reproducible-re.-71.patch
new file mode 100644
index 0000000..de0ba3e
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/0001-Make-the-sp_lstchg-shadow-field-reproducible-re.-71.patch
@@ -0,0 +1,89 @@
+From fe34a2a0e44bc80ff213bfd185046a5f10c94997 Mon Sep 17 00:00:00 2001
+From: Chris Lamb <chris@chris-lamb.co.uk>
+Date: Wed, 2 Jan 2019 18:06:16 +0000
+Subject: [PATCH 1/2] Make the sp_lstchg shadow field reproducible (re. #71)
+
+From <https://github.com/shadow-maint/shadow/pull/71>:
+
+```
+The third field in the /etc/shadow file (sp_lstchg) contains the date of
+the last password change expressed as the number of days since Jan 1, 1970.
+As this is a relative time, creating a user today will result in:
+
+username:17238:0:99999:7:::
+whilst creating the same user tomorrow will result in:
+
+username:17239:0:99999:7:::
+This has an impact for the Reproducible Builds[0] project where we aim to
+be independent of as many elements the build environment as possible,
+including the current date.
+
+This patch changes the behaviour to use the SOURCE_DATE_EPOCH[1]
+environment variable (instead of Jan 1, 1970) if valid.
+```
+
+This updated PR adds some missing calls to gettime (). This was originally
+filed by Johannes Schauer in Debian as #917773 [2].
+
+[0] https://reproducible-builds.org/
+[1] https://reproducible-builds.org/specs/source-date-epoch/
+[2] https://bugs.debian.org/917773
+
+Upstream-Status: Backport
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ libmisc/pwd2spwd.c | 3 +--
+ src/pwck.c         | 2 +-
+ src/pwconv.c       | 2 +-
+ 3 files changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/libmisc/pwd2spwd.c b/libmisc/pwd2spwd.c
+index c1b9b29ac873..6799dd50d490 100644
+--- a/libmisc/pwd2spwd.c
++++ b/libmisc/pwd2spwd.c
+@@ -40,7 +40,6 @@
+ #include "prototypes.h"
+ #include "defines.h"
+ #include <pwd.h>
+-extern time_t time (time_t *);
+ 
+ /*
+  * pwd_to_spwd - create entries for new spwd structure
+@@ -66,7 +65,7 @@ struct spwd *pwd_to_spwd (const struct passwd *pw)
+ 		 */
+ 		sp.sp_min = 0;
+ 		sp.sp_max = (10000L * DAY) / SCALE;
+-		sp.sp_lstchg = (long) time ((time_t *) 0) / SCALE;
++		sp.sp_lstchg = (long) gettime () / SCALE;
+ 		if (0 == sp.sp_lstchg) {
+ 			/* Better disable aging than requiring a password
+ 			 * change */
+diff --git a/src/pwck.c b/src/pwck.c
+index 0ffb711efb13..f70071b12500 100644
+--- a/src/pwck.c
++++ b/src/pwck.c
+@@ -609,7 +609,7 @@ static void check_pw_file (int *errors, bool *changed)
+ 					sp.sp_inact  = -1;
+ 					sp.sp_expire = -1;
+ 					sp.sp_flag   = SHADOW_SP_FLAG_UNSET;
+-					sp.sp_lstchg = (long) time ((time_t *) 0) / SCALE;
++					sp.sp_lstchg = (long) gettime () / SCALE;
+ 					if (0 == sp.sp_lstchg) {
+ 						/* Better disable aging than
+ 						 * requiring a password change
+diff --git a/src/pwconv.c b/src/pwconv.c
+index 9c69fa131d8e..f932f266c59c 100644
+--- a/src/pwconv.c
++++ b/src/pwconv.c
+@@ -267,7 +267,7 @@ int main (int argc, char **argv)
+ 			spent.sp_flag   = SHADOW_SP_FLAG_UNSET;
+ 		}
+ 		spent.sp_pwdp = pw->pw_passwd;
+-		spent.sp_lstchg = (long) time ((time_t *) 0) / SCALE;
++		spent.sp_lstchg = (long) gettime () / SCALE;
+ 		if (0 == spent.sp_lstchg) {
+ 			/* Better disable aging than requiring a password
+ 			 * change */
+-- 
+2.17.1
+
diff --git a/meta/recipes-extended/shadow/files/0002-gettime-Use-secure_getenv-over-getenv.patch b/meta/recipes-extended/shadow/files/0002-gettime-Use-secure_getenv-over-getenv.patch
new file mode 100644
index 0000000..8c8234d
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/0002-gettime-Use-secure_getenv-over-getenv.patch
@@ -0,0 +1,71 @@
+From 3d921155e0a761f61c8f1ec37328724aee1e2eda Mon Sep 17 00:00:00 2001
+From: Chris Lamb <chris@chris-lamb.co.uk>
+Date: Sun, 31 Mar 2019 15:59:45 +0100
+Subject: [PATCH 2/2] gettime: Use secure_getenv over getenv.
+
+Upstream-Status: Backport
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ README            | 1 +
+ configure.ac      | 3 +++
+ lib/defines.h     | 6 ++++++
+ libmisc/gettime.c | 2 +-
+ 4 files changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/README b/README
+index 952ac5787f06..26cfff1e8fa8 100644
+--- a/README
++++ b/README
+@@ -51,6 +51,7 @@ Brian R. Gaeke <brg@dgate.org>
+ Calle Karlsson <ckn@kash.se>
+ Chip Rosenthal <chip@unicom.com>
+ Chris Evans <lady0110@sable.ox.ac.uk>
++Chris Lamb <chris@chris-lamb.co.uk>
+ Cristian Gafton <gafton@sorosis.ro>
+ Dan Walsh <dwalsh@redhat.com>
+ Darcy Boese <possum@chardonnay.niagara.com>
+diff --git a/configure.ac b/configure.ac
+index da236722766b..a738ad662cc3 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -110,6 +110,9 @@ AC_REPLACE_FUNCS(sgetgrent sgetpwent sgetspent)
+ AC_REPLACE_FUNCS(snprintf strcasecmp strdup strerror strstr)
+ 
+ AC_CHECK_FUNC(setpgrp)
++AC_CHECK_FUNC(secure_getenv, [AC_DEFINE(HAS_SECURE_GETENV,
++                                        1,
++                                        [Defined to 1 if you have the declaration of 'secure_getenv'])])
+ 
+ if test "$ac_cv_header_shadow_h" = "yes"; then
+ 	AC_CACHE_CHECK(for working shadow group support,
+diff --git a/lib/defines.h b/lib/defines.h
+index cded1417fd12..2fb1b56eca6b 100644
+--- a/lib/defines.h
++++ b/lib/defines.h
+@@ -382,4 +382,10 @@ extern char *strerror ();
+ # endif
+ #endif
+ 
++#ifdef HAVE_SECURE_GETENV
++#  define shadow_getenv(name) secure_getenv(name)
++# else
++#  define shadow_getenv(name) getenv(name)
++#endif
++
+ #endif				/* _DEFINES_H_ */
+diff --git a/libmisc/gettime.c b/libmisc/gettime.c
+index 53eaf51670bb..0e25a4b75061 100644
+--- a/libmisc/gettime.c
++++ b/libmisc/gettime.c
+@@ -52,7 +52,7 @@
+ 	unsigned long long epoch;
+ 
+ 	fallback = time (NULL);
+-	source_date_epoch = getenv ("SOURCE_DATE_EPOCH");
++	source_date_epoch = shadow_getenv ("SOURCE_DATE_EPOCH");
+ 
+ 	if (!source_date_epoch)
+ 		return fallback;
+-- 
+2.17.1
+
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 4de21ac..831751d 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -11,6 +11,8 @@ DEPENDS = "virtual/crypt"
 UPSTREAM_CHECK_URI = "https://github.com/shadow-maint/shadow/releases"
 SRC_URI = "https://github.com/shadow-maint/shadow/releases/download/${PV}/${BP}.tar.gz \
            file://shadow-4.1.3-dots-in-usernames.patch \
+           file://0001-Make-the-sp_lstchg-shadow-field-reproducible-re.-71.patch  \
+           file://0002-gettime-Use-secure_getenv-over-getenv.patch \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
            "
 
-- 
2.7.4


