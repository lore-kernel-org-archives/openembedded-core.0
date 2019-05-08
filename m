Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id 3ECB37DEE9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 22:00:24 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id m20so2804412wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2019 15:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=sTiXdLzEkxJopHKMQbDV+Q8m00Mf0V6XrvwvnA1Rkos=;
	b=clrxLxeeVcKYhSrWTHeslrAgx35DshlcD8wE2scg+rsOO2X0IilN9EvZO3V5bOzIjy
	RBeQcummuSmoLE2gSY8qqjAwSGEX0JOrrMsqx3On3FY2h6UWT39urS0wQCaHxqvWzjbc
	2+qwm1UhVcDbA2zAf9NtBjzNn5VRvzGDieqfISDfRFtX0MppDJ1r96wzs/HF0ZYujP2+
	F3YZ0T8rA52fMKcPyNsAvDZ0xkkd1i6eKuFC5AT0u93GRApI3pnSgxREnY8DdkAENzEf
	yqJQ7+uMdZUhUehK8mlikxVd+kPNdP6auSlvw+t5LXYSW6kR2GNwafbzl5wofZog+jbr
	0K1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=sTiXdLzEkxJopHKMQbDV+Q8m00Mf0V6XrvwvnA1Rkos=;
	b=Co4/Z0YUftykCCYZyl+Dq81Ug2Nul0M8yOMmax/QtiD7XBQd5ie86S6EZepnR/qbNo
	TS29M0LRj4ya/V+/WrGvJtYrkxrntpDrRITpJj/iUVZZ3D6mjohl1t46fcyUN39goqkj
	igQGZBad8RZ4Wvmx5mKJZ5ah//Y3wp3vOdlYY5phJOGSl5BUlz5Q+/j4wveYJLWa9z+q
	wOmI43RhjL+xw1fthRQGyQ7jfhEI3Qlbudz7KGlQXlmLbAqT7UA84aHlbX7rgCvhX8Ma
	wktfRD+Tl8vw+KMJwq2+xktqNLtKRtpCIKfkHS5YPLNQ43waWrBS5ycK0vpwN1ORN5DV
	z/oQ==
X-Gm-Message-State: APjAAAXejp59akeEzYXY7MFZ6kUz5UlkcWSuKFy7PDEZGjZj/erBG0qv
	jfYXL/L1sRP9pjKs0eSLSPMu8hXW
X-Google-Smtp-Source: APXvYqz9xuAShtu38BCgrrZwMJHsUhgmnFwtjYcs9ziukE92ybn17bHI0PU6NMHyk5ofXtZRbRFMSg==
X-Received: by 2002:a7b:c7d4:: with SMTP id z20mr341845wmk.66.1557352824598;
	Wed, 08 May 2019 15:00:24 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246])
	by smtp.gmail.com with ESMTPSA id z5sm200325wre.70.2019.05.08.15.00.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 May 2019 15:00:23 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2019 23:00:21 +0100
Message-Id: <20190508220021.113542-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] shadow: Backport last change reproducibility
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
X-List-Received-Date: Wed, 08 May 2019 22:00:24 -0000

The third field in the /etc/shadow file (sp_lstchg) contains the date of
the last password change expressed as the number of days since Jan 1,
1970.

Backport the upstream changes to honour SOURCE_DATE_EPOCH for build
reproducibility.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 ...chg-shadow-field-reproducible-re.-71.patch | 89 +++++++++++++++++++
 ...ettime-Use-secure_getenv-over-getenv.patch | 71 +++++++++++++++
 meta/recipes-extended/shadow/shadow.inc       |  2 +
 3 files changed, 162 insertions(+)
 create mode 100644 meta/recipes-extended/shadow/files/0001-Make-the-sp_lstchg-shadow-field-reproducible-re.-71.patch
 create mode 100644 meta/recipes-extended/shadow/files/0002-gettime-Use-secure_getenv-over-getenv.patch

diff --git a/meta/recipes-extended/shadow/files/0001-Make-the-sp_lstchg-shadow-field-reproducible-re.-71.patch b/meta/recipes-extended/shadow/files/0001-Make-the-sp_lstchg-shadow-field-reproducible-re.-71.patch
new file mode 100644
index 000000000000..de0ba3ebb422
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
index 000000000000..8c8234d038ea
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
index 4de21acb7745..831751d6dea9 100644
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
2.17.1


