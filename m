Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.6873.1589245862189171171
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2020 18:11:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,381,1583164800"; 
   d="scan'208";a="91928562"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 12 May 2020 09:10:51 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 833E54BCC8A2
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2020 09:10:45 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 12 May 2020 09:10:44 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] nettle: upgrade 3.5.1 -> 3.6
Date: Tue, 12 May 2020 18:10:34 +0800
Message-ID: <1589278234-92831-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 833E54BCC8A2.A4FBE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

refresh the following patches:
Add-target-to-only-build-tests-not-run-them.patch
dlopen-test.patch

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...get-to-only-build-tests-not-run-them.patch | 31 ++++++++++++-------
 ...der-files-of-openssl-only-if-enable_.patch |  0
 .../dlopen-test.patch                         | 16 +++++++---
 .../{nettle-3.5.1 => nettle-3.6}/run-ptest    |  0
 .../nettle/{nettle_3.5.1.bb => nettle_3.6.bb} |  4 +--
 5 files changed, 33 insertions(+), 18 deletions(-)
 rename meta/recipes-support/nettle/{nettle-3.5.1 => nettle-3.6}/Add-target-to-only-build-tests-not-run-them.patch (53%)
 rename meta/recipes-support/nettle/{nettle-3.5.1 => nettle-3.6}/check-header-files-of-openssl-only-if-enable_.patch (100%)
 rename meta/recipes-support/nettle/{nettle-3.5.1 => nettle-3.6}/dlopen-test.patch (61%)
 rename meta/recipes-support/nettle/{nettle-3.5.1 => nettle-3.6}/run-ptest (100%)
 rename meta/recipes-support/nettle/{nettle_3.5.1.bb => nettle_3.6.bb} (92%)

diff --git a/meta/recipes-support/nettle/nettle-3.5.1/Add-target-to-only-build-tests-not-run-them.patch b/meta/recipes-support/nettle/nettle-3.6/Add-target-to-only-build-tests-not-run-them.patch
similarity index 53%
rename from meta/recipes-support/nettle/nettle-3.5.1/Add-target-to-only-build-tests-not-run-them.patch
rename to meta/recipes-support/nettle/nettle-3.6/Add-target-to-only-build-tests-not-run-them.patch
index c007060ee6..e3f5c6de7d 100644
--- a/meta/recipes-support/nettle/nettle-3.5.1/Add-target-to-only-build-tests-not-run-them.patch
+++ b/meta/recipes-support/nettle/nettle-3.6/Add-target-to-only-build-tests-not-run-them.patch
@@ -8,12 +8,16 @@ Upstream-Status: Inappropriate [not a complete solution]
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Refactored for 3.4
 Signed-off-by: Armin Kuster <akuster@mvista.com>
+---
+ Makefile.in           | 3 +++
+ testsuite/Makefile.in | 2 ++
+ 2 files changed, 5 insertions(+)
 
-Index: nettle-3.4/Makefile.in
-===================================================================
---- nettle-3.4.orig/Makefile.in
-+++ nettle-3.4/Makefile.in
-@@ -55,6 +55,9 @@ clean distclean mostlyclean maintainer-c
+diff --git a/Makefile.in b/Makefile.in
+index e5ccfc7..15c9275 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -52,6 +52,9 @@ clean distclean mostlyclean maintainer-clean tags:
  	  echo "Making $@ in $$d" ; (cd $$d && $(MAKE) $@); done
  	$(MAKE) $@-here
  
@@ -23,16 +27,19 @@ Index: nettle-3.4/Makefile.in
  check-here:
  	true
  
-Index: nettle-3.4/testsuite/Makefile.in
-===================================================================
---- nettle-3.4.orig/testsuite/Makefile.in
-+++ nettle-3.4/testsuite/Makefile.in
-@@ -131,6 +131,8 @@ $(TARGETS) $(EXTRA_TARGETS): testutils.$
+diff --git a/testsuite/Makefile.in b/testsuite/Makefile.in
+index 3f5e5f6..8fd68a3 100644
+--- a/testsuite/Makefile.in
++++ b/testsuite/Makefile.in
+@@ -122,6 +122,8 @@ $(TARGETS) $(EXTRA_TARGETS): testutils.$(OBJEXT) ../nettle-internal.$(OBJEXT) \
  # data.
  VALGRIND = valgrind --error-exitcode=1 --leak-check=full --show-reachable=yes @IF_ASM@ --partial-loads-ok=yes
  
 +buildtest: $(TS_ALL)
 +
- # The PATH update is for windows dlls, DYLD_LIBRARY_PATH is for OSX.
  check: $(TS_ALL)
- 	LD_LIBRARY_PATH=../.lib PATH="../.lib:$$PATH" DYLD_LIBRARY_PATH=../.lib \
+ 	TEST_SHLIB_DIR="$(TEST_SHLIB_DIR)" \
+ 	  srcdir="$(srcdir)" \
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/nettle/nettle-3.5.1/check-header-files-of-openssl-only-if-enable_.patch b/meta/recipes-support/nettle/nettle-3.6/check-header-files-of-openssl-only-if-enable_.patch
similarity index 100%
rename from meta/recipes-support/nettle/nettle-3.5.1/check-header-files-of-openssl-only-if-enable_.patch
rename to meta/recipes-support/nettle/nettle-3.6/check-header-files-of-openssl-only-if-enable_.patch
diff --git a/meta/recipes-support/nettle/nettle-3.5.1/dlopen-test.patch b/meta/recipes-support/nettle/nettle-3.6/dlopen-test.patch
similarity index 61%
rename from meta/recipes-support/nettle/nettle-3.5.1/dlopen-test.patch
rename to meta/recipes-support/nettle/nettle-3.6/dlopen-test.patch
index fea5774206..ab9b91f88b 100644
--- a/meta/recipes-support/nettle/nettle-3.5.1/dlopen-test.patch
+++ b/meta/recipes-support/nettle/nettle-3.6/dlopen-test.patch
@@ -7,15 +7,23 @@ Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ testsuite/dlopen-test.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
---- a/testsuite/dlopen-test.c	2016-10-01 00:28:38.000000000 -0700
-+++ b/testsuite/dlopen-test.c	2017-10-13 11:08:57.227572860 -0700
-@@ -9,7 +9,7 @@
+diff --git a/testsuite/dlopen-test.c b/testsuite/dlopen-test.c
+index 4265bf7..1a25d17 100644
+--- a/testsuite/dlopen-test.c
++++ b/testsuite/dlopen-test.c
+@@ -15,7 +15,7 @@ int
  main (int argc UNUSED, char **argv UNUSED)
  {
  #if HAVE_LIBDL
--  void *handle = dlopen ("../libnettle.so", RTLD_NOW);
+-  void *handle = dlopen ("../libnettle." SO_EXT, RTLD_NOW);
 +  void *handle = dlopen ("libnettle.so", RTLD_NOW);
    int (*get_version)(void);
    if (!handle)
      {
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/nettle/nettle-3.5.1/run-ptest b/meta/recipes-support/nettle/nettle-3.6/run-ptest
similarity index 100%
rename from meta/recipes-support/nettle/nettle-3.5.1/run-ptest
rename to meta/recipes-support/nettle/nettle-3.6/run-ptest
diff --git a/meta/recipes-support/nettle/nettle_3.5.1.bb b/meta/recipes-support/nettle/nettle_3.6.bb
similarity index 92%
rename from meta/recipes-support/nettle/nettle_3.5.1.bb
rename to meta/recipes-support/nettle/nettle_3.6.bb
index d92db0ef95..b71f56d83d 100644
--- a/meta/recipes-support/nettle/nettle_3.5.1.bb
+++ b/meta/recipes-support/nettle/nettle_3.6.bb
@@ -20,8 +20,8 @@ SRC_URI_append_class-target = "\
             file://dlopen-test.patch \
             "
 
-SRC_URI[md5sum] = "0e5707b418c3826768d41130fbe4ee86"
-SRC_URI[sha256sum] = "75cca1998761b02e16f2db56da52992aef622bf55a3b45ec538bc2eedadc9419"
+SRC_URI[md5sum] = "c45ee24ed7361dcda152a035d396fe8a"
+SRC_URI[sha256sum] = "d24c0d0f2abffbc8f4f34dcf114b0f131ec3774895f3555922fe2f40f3d5e3f1"
 
 UPSTREAM_CHECK_REGEX = "nettle-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.17.1



