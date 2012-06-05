Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Sbpj1-0007Vj-MH
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jun 2012 11:06:51 +0200
Received: by bkcjm2 with SMTP id jm2so4535521bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jun 2012 01:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=hb7d8d+HUpl+OAQTqzPcDQB6uOzFeaZIX55gCWOCKRk=;
	b=qz+VjnKdRkbdVZuss7oRk52gHDo5lEpkX0ZaIe/IzAF7YlvSpAHH0onjffmFop2Pa5
	oN2LIWgnVX5MgkrIvbBkLuPZIdAmVkAgOhF/2u4YZ9vxB5E3tBVJECnX9pQ//tuf9tw7
	SlSuj4uGpZcMKJbkZcF/geFudm5jV/MCMe83D02zw2Gh1xSB67SuomLT9QmYJY06lkuD
	Et9zvESHpAAoOeBukynD6uHoIBeOhFJIKWp9sCXXV/bf5uzawWbEq167xWj1/V6ZPLBn
	cLNLRzJ5C4SHrpKrPknPBIkZQHBlsR9JzQfEoI1UXCD91pBoMK7vxTq+GdGb+fs0hYuz
	R7+w==
Received: by 10.204.152.22 with SMTP id e22mr8718951bkw.8.1338886585999;
	Tue, 05 Jun 2012 01:56:25 -0700 (PDT)
Received: from localhost.localdomain (ip-178-202-232-153.unitymediagroup.de.
	[178.202.232.153])
	by mx.google.com with ESMTPS id x23sm996688bkw.12.2012.06.05.01.56.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Jun 2012 01:56:25 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jun 2012 10:56:14 +0200
Message-Id: <1338886574-19330-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [PATCH] systemtap: Unbreak build for systems with nss headers installed
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Jun 2012 09:06:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* discussed on [1]
* patch sent to systemtap [2]

[1] http://lists.linuxtogo.org/pipermail/openembedded-core/2012-June/023377.html
[2] http://sourceware.org/ml/systemtap/2012-q2/msg00202.html

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...prun-configure.ac-support-without-nss-for.patch |   50 ++++++++++++++++++++
 meta/recipes-kernel/systemtap/systemtap_git.bb     |   10 +---
 meta/recipes-kernel/systemtap/systemtap_git.inc    |    1 +
 3 files changed, 54 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/runtime-staprun-configure.ac-support-without-nss-for.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/runtime-staprun-configure.ac-support-without-nss-for.patch b/meta/recipes-kernel/systemtap/systemtap/runtime-staprun-configure.ac-support-without-nss-for.patch
new file mode 100644
index 0000000..fbe7b70
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/runtime-staprun-configure.ac-support-without-nss-for.patch
@@ -0,0 +1,50 @@
+From fa81ccd4f92e5cb15a11a81a7e656bfe01745afb Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Tue, 5 Jun 2012 10:22:23 +0200
+Subject: [PATCH] runtime/staprun/configure.ac: support --without-nss for
+ staprun
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream status: pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ runtime/staprun/configure.ac |   20 +++++++++++++++-----
+ 1 files changed, 15 insertions(+), 5 deletions(-)
+
+diff --git a/runtime/staprun/configure.ac b/runtime/staprun/configure.ac
+index 8fd1b42..7b05f73 100644
+--- a/runtime/staprun/configure.ac
++++ b/runtime/staprun/configure.ac
+@@ -67,11 +67,21 @@ AS_IF([test "x$enable_sdt_probes" != xno], [
+             [Define to 1 to enable process.mark probes in staprun, stapio.])
+ ])
+ 
+-PKG_CHECK_MODULES([nss], [nss >= 3], [have_nss=yes], [have_nss=no])
+-AM_CONDITIONAL([HAVE_NSS], [test $have_nss = yes])
+-AS_IF([test $have_nss = yes], [
+-  AC_DEFINE([HAVE_NSS], [1], [Define to 1 if you have the nss libraries.])
+-])
++dnl See if we have the nss/nspr headers and libraries
++AC_ARG_WITH([nss],
++  AS_HELP_STRING([--without-nss],
++    [Do not use NSS even if present]))
++
++AS_IF([test "x$with_nss" != "xno"], [
++  PKG_CHECK_MODULES([nss], [nss >= 3],
++    [have_nss=yes
++     AC_DEFINE([HAVE_NSS], [1], [Define to 1 if you have the nss libraries.])
++    ], [have_nss=no])
++], [have_nss=no])
++
++AM_CONDITIONAL([HAVE_NSS], [test "${have_nss}" = "yes"])
++
++
+ AC_ARG_ENABLE([nls], [AS_HELP_STRING([--enable-nls], [enable translating program messages])])
+ AS_IF([test "x$enable_nls" != xno], [
+ AC_DEFINE([ENABLE_NLS], [1], [Define to 1 if program messages should be translated.])
+-- 
+1.7.6.5
+
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index 4d340fc..7ed5fcd 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -6,19 +6,15 @@ DEPENDS = "elfutils sqlite3 systemtap-native"
 DEPENDS_virtclass-native = "elfutils-native sqlite3-native gettext-native"
 DEPENDS_virtclass-nativesdk = "elfutils-nativesdk sqlite3-nativesdk gettext-nativesdk"
 
-PR = "r4"
+PR = "r5"
 
 export CC_FOR_BUILD = "${BUILD_CC}"
 export CFLAGS_FOR_BUILD = "${BUILD_CFLAGS}"
 export LDFLAGS_FOR_BUILD = "${BUILD_LDFLAGS}"
 
 EXTRA_OECONF += "--with-libelf=${STAGING_DIR_TARGET} --without-rpm \
-	     ac_cv_file__usr_include_nss=no \
-	     ac_cv_file__usr_include_nss3=no \
-	     ac_cv_file__usr_include_nspr=no \
-	     ac_cv_file__usr_include_nspr4=no \
-	     ac_cv_file__usr_include_avahi_client=no \
-	     ac_cv_file__usr_include_avahi_common=no "
+            --without-nss --without-avahi \
+            --disable-server --disable-grapher "
 
 STAP_DOCS ?= "--disable-docs --disable-publican --disable-refdocs"
 
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index 9f4feee..5f2987b 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -7,6 +7,7 @@ PV = "1.7+git${SRCPV}"
 SRC_URI = "git://sources.redhat.com/git/systemtap.git;protocol=git \
            file://docproc-build-fix.patch \
            file://systemtap_fix_for_automake_1.12.patch \
+           file://runtime-staprun-configure.ac-support-without-nss-for.patch \
           "
 
 FILESPATH = "${FILE_DIRNAME}/systemtap"
-- 
1.7.6.5



