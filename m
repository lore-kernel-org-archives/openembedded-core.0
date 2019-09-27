Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4065A7F282
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 07:32:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8R7WCZc029617
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 00:32:22 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Fri, 27 Sep 2019 00:32:01 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Sep 2019 15:32:04 +0800
Message-ID: <240614c649cb0804b49efc464106399a6a9c7086.1569569493.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569569493.git.liezhi.yang@windriver.com>
References: <cover.1569569493.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] apr: Check for libtoolize rather than libtool
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
X-List-Received-Date: Fri, 27 Sep 2019 07:32:31 -0000
Content-Type: text/plain

Backport a patch from debian to make it check libtoolize rather than libtool.

https://sources.debian.org/data/main/a/apr/1.6.5-1/debian/patches/libtoolize_check.patch

This can also fix:
$ bitbake nativesdk-apr
buildconf: libtool not found.
           You need libtool version 1.4 or newer installed

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...d-buildcheck.sh-improve-libtool-detection.patch | 32 ----------------------
 .../recipes-support/apr/apr/libtoolize_check.patch | 28 +++++++++++++++++++
 meta/recipes-support/apr/apr_1.7.0.bb              |  4 +--
 3 files changed, 30 insertions(+), 34 deletions(-)
 delete mode 100644 meta/recipes-support/apr/apr/0001-build-buildcheck.sh-improve-libtool-detection.patch
 create mode 100644 meta/recipes-support/apr/apr/libtoolize_check.patch

diff --git a/meta/recipes-support/apr/apr/0001-build-buildcheck.sh-improve-libtool-detection.patch b/meta/recipes-support/apr/apr/0001-build-buildcheck.sh-improve-libtool-detection.patch
deleted file mode 100644
index 097c195..0000000
--- a/meta/recipes-support/apr/apr/0001-build-buildcheck.sh-improve-libtool-detection.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 4efdc06fb17b8a00a9eca923caa176be741d1e04 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Thu, 1 Feb 2018 14:56:13 +0800
-Subject: [PATCH 1/7] build/buildcheck.sh: improve libtool detection
-
-Support customize libtool by variable assigning, it is helpful
-for cross compileing (such as libtool=aarch64-linux-libtool)
-
-Upstream-Status: Submitted [https://github.com/apache/apr/pull/8]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- build/buildcheck.sh | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/build/buildcheck.sh b/build/buildcheck.sh
-index ab5df44..f191a41 100755
---- a/build/buildcheck.sh
-+++ b/build/buildcheck.sh
-@@ -40,7 +40,9 @@ fi
- # output is multiline from 1.5 onwards
- 
- # Require libtool 1.4 or newer
--libtool=`build/PrintPath glibtool1 glibtool libtool libtool15 libtool14`
-+if test -z "$libtool"; then
-+  libtool=`build/PrintPath glibtool1 glibtool libtool libtool15 libtool14`
-+fi
- lt_pversion=`$libtool --version 2>/dev/null|sed -e 's/([^)]*)//g;s/^[^0-9]*//;s/[- ].*//g;q'`
- if test -z "$lt_pversion"; then
-   echo "buildconf: libtool not found."
--- 
-1.8.3.1
-
diff --git a/meta/recipes-support/apr/apr/libtoolize_check.patch b/meta/recipes-support/apr/apr/libtoolize_check.patch
new file mode 100644
index 0000000..740792e
--- /dev/null
+++ b/meta/recipes-support/apr/apr/libtoolize_check.patch
@@ -0,0 +1,28 @@
+From: Helmut Grohne <helmut@subdivi.de>
+Subject: check for libtoolize rather than libtool
+Last-Update: 2014-09-19
+
+libtool is now in package libtool-bin, but apr only needs libtoolize.
+
+Upstream-Status: Pending [ from debian: https://sources.debian.org/data/main/a/apr/1.6.5-1/debian/patches/libtoolize_check.patch ]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
+--- apr.orig/build/buildcheck.sh
++++ apr/build/buildcheck.sh
+@@ -39,11 +39,11 @@ fi
+ # ltmain.sh (GNU libtool 1.1361 2004/01/02 23:10:52) 1.5a
+ # output is multiline from 1.5 onwards
+ 
+-# Require libtool 1.4 or newer
+-libtool=`build/PrintPath glibtool1 glibtool libtool libtool15 libtool14`
+-lt_pversion=`$libtool --version 2>/dev/null|sed -e 's/([^)]*)//g;s/^[^0-9]*//;s/[- ].*//g;q'`
++# Require libtoolize 1.4 or newer
++libtoolize=`build/PrintPath glibtoolize1 glibtoolize libtoolize libtoolize15 libtoolize14`
++lt_pversion=`$libtoolize --version 2>/dev/null|sed -e 's/([^)]*)//g;s/^[^0-9]*//;s/[- ].*//g;q'`
+ if test -z "$lt_pversion"; then
+-  echo "buildconf: libtool not found."
++  echo "buildconf: libtoolize not found."
+   echo "           You need libtool version 1.4 or newer installed"
+   echo "           to build APR from SVN."
+   res=1
diff --git a/meta/recipes-support/apr/apr_1.7.0.bb b/meta/recipes-support/apr/apr_1.7.0.bb
index 09a65bf..c0c76c1 100644
--- a/meta/recipes-support/apr/apr_1.7.0.bb
+++ b/meta/recipes-support/apr/apr_1.7.0.bb
@@ -11,13 +11,13 @@ BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
            file://run-ptest \
-           file://0001-build-buildcheck.sh-improve-libtool-detection.patch \
            file://0002-apr-Remove-workdir-path-references-from-installed-ap.patch \
            file://0003-Makefile.in-configure.in-support-cross-compiling.patch \
            file://0004-Fix-packet-discards-HTTP-redirect.patch \
            file://0005-configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch \
            file://0006-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch \
            file://0007-explicitly-link-libapr-against-phtread-to-make-gold-.patch \
+           file://libtoolize_check.patch \
            "
 
 SRC_URI[md5sum] = "7a14a83d664e87599ea25ff4432e48a7"
@@ -47,7 +47,7 @@ do_configure_prepend() {
 	export GREP="grep"
 
 	cd ${S}
-	libtool='${HOST_SYS}-libtool' ./buildconf
+	./buildconf 2
 }
 
 FILES_${PN}-dev += "${libdir}/apr.exp ${datadir}/build-1/*"
-- 
2.7.4


