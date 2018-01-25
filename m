Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4478A786C6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jan 2018 08:13:29 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="35916992"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Jan 2018 16:13:27 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 4136B48AEA1E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jan 2018 16:13:23 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Thu, 25 Jan 2018 16:13:22 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Jan 2018 16:13:37 +0800
Message-ID: <1516868017-13845-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 4136B48AEA1E.A8445
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] gzip: 1.8 -> 1.9
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
X-List-Received-Date: Thu, 25 Jan 2018 08:13:31 -0000
Content-Type: text/plain

1.Upgrade gzip from 1.8 to 1.9.
2.Delete 0001-gzip-port-zdiff-zless-to-Busybox.patch, since it is integrated upstream.
3.Modify wrong-path-fix.patch, since it is changed upstream.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../0001-gzip-port-zdiff-zless-to-Busybox.patch    | 59 ----------------------
 .../{gzip-1.8 => gzip-1.9}/wrong-path-fix.patch    | 23 ++++++---
 .../gzip/{gzip_1.8.bb => gzip_1.9.bb}              |  5 +-
 3 files changed, 17 insertions(+), 70 deletions(-)
 delete mode 100644 meta/recipes-extended/gzip/files/0001-gzip-port-zdiff-zless-to-Busybox.patch
 rename meta/recipes-extended/gzip/{gzip-1.8 => gzip-1.9}/wrong-path-fix.patch (70%)
 rename meta/recipes-extended/gzip/{gzip_1.8.bb => gzip_1.9.bb} (86%)

diff --git a/meta/recipes-extended/gzip/files/0001-gzip-port-zdiff-zless-to-Busybox.patch b/meta/recipes-extended/gzip/files/0001-gzip-port-zdiff-zless-to-Busybox.patch
deleted file mode 100644
index 20d5a19..0000000
--- a/meta/recipes-extended/gzip/files/0001-gzip-port-zdiff-zless-to-Busybox.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 5f712621829ed81a758077431226a86df37fbc3b Mon Sep 17 00:00:00 2001
-From: Denys Zagorui <denys.zagorui@globallogic.com>
-Date: Thu, 8 Jun 2017 16:05:50 +0300
-Subject: [PATCH] gzip: port zdiff, zless to Busybox
-
-Problem reported by Denys Zagorui (Bug#26088).
-* tests/zdiff: Check that diff uses POSIX-format output.
-* zless.in (less_version): Don't exit merely because 'less -V'
-fails; instead, assume 'less' is compatible with an old version of
-the original 'less'.  Busybox 'less -V' fails, but apparently its
-'less' works anyway somehow.
-
-Signed-off-by: Denys Zagorui <denys.zagorui@globallogic.com>
-
-Upstream-Status: Accepted
----
- tests/zdiff | 4 +++-
- zless.in    | 2 +-
- 2 files changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/tests/zdiff b/tests/zdiff
-index 0bb7c7d..9cd4fd4 100755
---- a/tests/zdiff
-+++ b/tests/zdiff
-@@ -22,7 +22,6 @@
- 
- echo a > a || framework_failure_
- echo b > b || framework_failure_
--gzip a b || framework_failure_
- 
- cat <<EOF > exp
- 1c1
-@@ -31,7 +30,10 @@ cat <<EOF > exp
- > b
- EOF
- 
-+diff a b | diff exp - || skip_ "diff output format is incompatible with POSIX"
-+
- fail=0
-+gzip a b || fail=1
- zdiff a.gz b.gz > out 2>&1
- test $? = 1 || fail=1
- 
-diff --git a/zless.in b/zless.in
-index e634af6..9759ae6 100644
---- a/zless.in
-+++ b/zless.in
-@@ -47,7 +47,7 @@ if test "${LESSMETACHARS+set}" != set; then
-   export LESSMETACHARS
- fi
- 
--less_version=`less -V` || exit
-+less_version=`less -V 2>/dev/null`
- case $less_version in
- less' '45[1-9]* | \
- less' '4[6-9][0-9]* | \
--- 
-1.9.1
-
diff --git a/meta/recipes-extended/gzip/gzip-1.8/wrong-path-fix.patch b/meta/recipes-extended/gzip/gzip-1.9/wrong-path-fix.patch
similarity index 70%
rename from meta/recipes-extended/gzip/gzip-1.8/wrong-path-fix.patch
rename to meta/recipes-extended/gzip/gzip-1.9/wrong-path-fix.patch
index 4dc1000..7c37bc8 100644
--- a/meta/recipes-extended/gzip/gzip-1.8/wrong-path-fix.patch
+++ b/meta/recipes-extended/gzip/gzip-1.9/wrong-path-fix.patch
@@ -13,17 +13,24 @@ Signed-off-by: Ming Liu <ming.liu@windriver.com>
 
 Upstream-Status: Pending
 
-Index: gzip-1.8/Makefile.am
-===================================================================
---- gzip-1.8.orig/Makefile.am
-+++ gzip-1.8/Makefile.am
-@@ -81,8 +81,7 @@ gzip.doc.gz: gzip.doc $(bin_PROGRAMS)
- SUFFIXES = .in
+---
+ Makefile.am | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index d4ecc3f..e4657d2 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -82,8 +82,7 @@ SUFFIXES = .in
  .in:
- 	$(AM_V_GEN)sed \
+ 	$(AM_V_GEN)rm -f $@-t $@ \
+           && sed \
 -		-e 's|/bin/sh|$(SHELL)|g' \
 -		-e 's|[@]GREP@|$(GREP)|g' \
 +		-e 's|[@]GREP@|$(base_bindir)/grep|g' \
  		-e 's|[@]VERSION@|$(VERSION)|g' \
  		$(srcdir)/$@.in >$@-t \
- 	  && chmod a+x $@-t \
+ 	  && chmod a=rx $@-t \
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/gzip/gzip_1.8.bb b/meta/recipes-extended/gzip/gzip_1.9.bb
similarity index 86%
rename from meta/recipes-extended/gzip/gzip_1.8.bb
rename to meta/recipes-extended/gzip/gzip_1.9.bb
index d093207..a8eeba1 100644
--- a/meta/recipes-extended/gzip/gzip_1.8.bb
+++ b/meta/recipes-extended/gzip/gzip_1.9.bb
@@ -3,7 +3,6 @@ require gzip.inc
 LICENSE = "GPLv3+"
 
 SRC_URI = "${GNU_MIRROR}/gzip/${BP}.tar.gz \
-            file://0001-gzip-port-zdiff-zless-to-Busybox.patch \
             file://run-ptest"
 SRC_URI_append_class-target = " file://wrong-path-fix.patch"
 
@@ -34,6 +33,6 @@ do_install_ptest() {
             ${B}/tests/Makefile > ${D}${PTEST_PATH}/src/tests/Makefile
 }
 
-SRC_URI[md5sum] = "732553152814b22dc35aa0267df5286c"
-SRC_URI[sha256sum] = "1ff7aedb3d66a0d73f442f6261e4b3860df6fd6c94025c2cb31a202c9c60fe0e"
+SRC_URI[md5sum] = "929d6a6b832f75b28e3eeeafb30c1d9b"
+SRC_URI[sha256sum] = "5d2d3a3432ef32f24cdb060d278834507b481a75adeca18850c73592f778f6ad"
 
-- 
2.7.4




