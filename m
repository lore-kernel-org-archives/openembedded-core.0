Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.26210.1605005280120074540
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2020 02:48:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 559A511D4
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2020 02:47:57 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 01D3D3F6CF
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2020 02:47:56 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libical: backport a patch to fix build with ICU 68.1
Date: Tue, 10 Nov 2020 10:47:53 +0000
Message-Id: <20201110104753.250322-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../0001-Fix-build-with-icu-68.1.patch        | 81 +++++++++++++++++++
 meta/recipes-support/libical/libical_3.0.8.bb |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta/recipes-support/libical/libical/0001-Fix-build-w=
ith-icu-68.1.patch

diff --git a/meta/recipes-support/libical/libical/0001-Fix-build-with-icu=
-68.1.patch b/meta/recipes-support/libical/libical/0001-Fix-build-with-ic=
u-68.1.patch
new file mode 100644
index 00000000000..79e1475c6c5
--- /dev/null
+++ b/meta/recipes-support/libical/libical/0001-Fix-build-with-icu-68.1.p=
atch
@@ -0,0 +1,81 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 52d603212173d4502800bf746436a93f806a8898 Mon Sep 17 00:00:00 2001
+From: Allen Winter <allen.winter@kdab.com>
+Date: Sat, 31 Oct 2020 17:38:01 -0400
+Subject: [PATCH] Fix build with icu-68.1
+
+Use stdbool.h to define true and false when possible
+
+Issue#448
+---
+ ConfigureChecks.cmake   |  1 +
+ config.h.cmake          |  3 +++
+ src/libical/icalrecur.c | 10 ++++++++--
+ 3 files changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/ConfigureChecks.cmake b/ConfigureChecks.cmake
+index e4d0e2ec..bba33fa9 100644
+--- a/ConfigureChecks.cmake
++++ b/ConfigureChecks.cmake
+@@ -10,6 +10,7 @@ check_include_files(sys/utsname.h HAVE_SYS_UTSNAME_H)
+ check_include_files(fcntl.h HAVE_FCNTL_H)
+ check_include_files(unistd.h HAVE_UNISTD_H)
+ check_include_files(wctype.h HAVE_WCTYPE_H)
++check_include_files(stdbool.h HAVE_STDBOOL_H)
+=20
+ include(CheckFunctionExists)
+ if(WIN32 AND MSVC)
+diff --git a/config.h.cmake b/config.h.cmake
+index 8fd3421b..c8008692 100644
+--- a/config.h.cmake
++++ b/config.h.cmake
+@@ -39,6 +39,9 @@
+ /* Define to 1 if you have the <dirent.h> header file. */
+ #cmakedefine HAVE_DIRENT_H 1
+=20
++/* Define to 1 if you have the <stdbool.h> header file. */
++#cmakedefine HAVE_STDBOOL_H 1
++
+ /* Define if we have pthread. */
+ #cmakedefine HAVE_PTHREAD_ATTR_GET_NP 1
+ #cmakedefine HAVE_PTHREAD_GETATTR_NP 1
+diff --git a/src/libical/icalrecur.c b/src/libical/icalrecur.c
+index 73178450..b3f054b8 100644
+--- a/src/libical/icalrecur.c
++++ b/src/libical/icalrecur.c
+@@ -145,6 +145,12 @@
+ #if defined(HAVE_LIBICU)
+ #include <unicode/ucal.h>
+ #include <unicode/ustring.h>
++#if defined(HAVE_STDBOOL_H)
++#include <stdbool.h>
++#else
++#define false 0
++#define true 1
++#endif
+ #define RSCALE_IS_SUPPORTED 1
+ #else
+ #define RSCALE_IS_SUPPORTED 0
+@@ -1018,7 +1024,7 @@ icalarray *icalrecurrencetype_rscale_supported_cal=
endars(void)
+=20
+     calendars =3D icalarray_new(sizeof(const char **), 20);
+=20
+-    en =3D ucal_getKeywordValuesForLocale("calendar", NULL, FALSE, &sta=
tus);
++    en =3D ucal_getKeywordValuesForLocale("calendar", NULL, false, &sta=
tus);
+     while ((cal =3D uenum_next(en, NULL, &status))) {
+         cal =3D icalmemory_tmp_copy(cal);
+         icalarray_append(calendars, &cal);
+@@ -1411,7 +1417,7 @@ static int initialize_rscale(icalrecur_iterator *i=
mpl)
+         }
+=20
+         /* Check if specified calendar is supported */
+-        en =3D ucal_getKeywordValuesForLocale("calendar", NULL, FALSE, =
&status);
++        en =3D ucal_getKeywordValuesForLocale("calendar", NULL, false, =
&status);
+         while ((cal =3D uenum_next(en, NULL, &status))) {
+             if (!strcmp(cal, rule.rscale)) {
+                 is_hebrew =3D !strcmp(rule.rscale, "hebrew");
+--=20
+2.25.1
+
diff --git a/meta/recipes-support/libical/libical_3.0.8.bb b/meta/recipes=
-support/libical/libical_3.0.8.bb
index efb9433412f..6230f09eca1 100644
--- a/meta/recipes-support/libical/libical_3.0.8.bb
+++ b/meta/recipes-support/libical/libical_3.0.8.bb
@@ -11,6 +11,7 @@ SECTION =3D "libs"
 SRC_URI =3D " \
     https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.=
gz \
     file://0001-Use-our-hand-build-native-src-generator.patch \
+    file://0001-Fix-build-with-icu-68.1.patch \
 "
 SRC_URI[md5sum] =3D "41bd1f1fcdcb4779cea478bb55cf07bf"
 SRC_URI[sha256sum] =3D "09fecacaf75ba5a242159e3a9758a5446b5ce4d0ab684f98=
a7040864e1d1286f"
--=20
2.25.1

