Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AEC5060720
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Nov 2018 08:57:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wA98vKp8032427
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 9 Nov 2018 00:57:30 -0800
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Fri, 9 Nov 2018 00:57:08 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Fri, 9 Nov 2018 17:07:07 +0800
Message-ID: <01d623e8e6a6160cba4fd42c1f1816a4cfed87c3.1541754319.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1541754319.git.hongxu.jia@windriver.com>
References: <cover.1541754319.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/6] gpgme: 1.11.1 -> 1.12.0
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
X-List-Received-Date: Fri, 09 Nov 2018 08:57:55 -0000
Content-Type: text/plain

Rebase 0007-qt-python-Add-variables-to-tests.patch

Rework 0007-qt-python-Add-variables-to-tests.patch -> 0007-python-Add-variables-to-tests.patch

Drop newly added option --disable-lang-qt-test which is merged to --disable-gpg-test by
upstream commit [26820ba qt: Respect --disable-gpg-test for tests]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../gpgme/gpgme/0001-pkgconfig.patch               |  8 ++--
 ...python-gpg-error-config-should-not-be-use.patch | 30 +++++++------
 .../0003-Correctly-install-python-modules.patch    |  6 +--
 .../gpgme/gpgme/0004-python-import.patch           |  2 +-
 ...g-skip-all-lib-or-usr-lib-directories-in-.patch |  2 +-
 .../gpgme/gpgme/0006-fix-build-path-issue.patch    |  6 +--
 ...ch => 0007-python-Add-variables-to-tests.patch} | 52 +++++-----------------
 .../gpgme/{gpgme_1.11.1.bb => gpgme_1.12.0.bb}     |  7 ++-
 8 files changed, 43 insertions(+), 70 deletions(-)
 rename meta/recipes-support/gpgme/gpgme/{0007-qt-python-Add-variables-to-tests.patch => 0007-python-Add-variables-to-tests.patch} (43%)
 rename meta/recipes-support/gpgme/{gpgme_1.11.1.bb => gpgme_1.12.0.bb} (93%)

diff --git a/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch b/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
index ae9a46e..176723c 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
@@ -1,4 +1,4 @@
-From c452ba58dd2f99d6e624421697417cc018f9a67a Mon Sep 17 00:00:00 2001
+From 6492c952d61bb93a8bf8200c093d7e491456aa5a Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 29 Jun 2018 14:35:41 +0800
 Subject: [PATCH 1/7] pkgconfig
@@ -25,10 +25,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  create mode 100644 src/gpgme.pc.in
 
 diff --git a/configure.ac b/configure.ac
-index 2a35404..7485cdf 100644
+index af569ac..865bd10 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -886,6 +886,7 @@ AC_CONFIG_FILES(Makefile src/Makefile
+@@ -895,6 +895,7 @@ AC_CONFIG_FILES(Makefile src/Makefile
                  src/versioninfo.rc
                  src/gpgme.h)
  AC_CONFIG_FILES(src/gpgme-config, chmod +x src/gpgme-config)
@@ -37,7 +37,7 @@ index 2a35404..7485cdf 100644
  AC_CONFIG_FILES(lang/cpp/src/GpgmeppConfig-w32.cmake.in)
  AC_CONFIG_FILES(lang/cpp/src/GpgmeppConfig.cmake.in)
 diff --git a/src/Makefile.am b/src/Makefile.am
-index 0a196e0..cecaf8f 100644
+index 1394c02..8451c3a 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
 @@ -19,12 +19,14 @@
diff --git a/meta/recipes-support/gpgme/gpgme/0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch b/meta/recipes-support/gpgme/gpgme/0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch
index 4f5ceda..0d0d0c6 100644
--- a/meta/recipes-support/gpgme/gpgme/0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch
+++ b/meta/recipes-support/gpgme/gpgme/0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch
@@ -1,6 +1,6 @@
-From 45d828356efc140a1492befb1e6dc59a9f4e16b5 Mon Sep 17 00:00:00 2001
+From 03819ad1270a279223219c0e70ba631bfe517714 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Wed, 31 Jan 2018 10:44:19 +0800
+Date: Wed, 17 Oct 2018 23:32:19 +0800
 Subject: [PATCH 2/7] gpgme/lang/python: gpg-error-config should not be used
 
 gpg-error-config was modified by OE to always return an error.
@@ -11,38 +11,40 @@ Upstream-Status: Inappropriate [changes are specific to OE]
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
-Rework to 1.10.0
+Rebase to 1.12.0
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- lang/python/setup.py.in | 10 +---------
- 1 file changed, 1 insertion(+), 9 deletions(-)
+ lang/python/setup.py.in | 11 +----------
+ 1 file changed, 1 insertion(+), 10 deletions(-)
 
 diff --git a/lang/python/setup.py.in b/lang/python/setup.py.in
-index 2595073..60b5257 100755
+index 65a4be0..11b8413 100755
 --- a/lang/python/setup.py.in
 +++ b/lang/python/setup.py.in
-@@ -26,7 +26,6 @@ import shutil
- import subprocess
+@@ -30,7 +30,6 @@ import subprocess
+ import sys
  
  # Out-of-tree build of the gpg bindings.
 -gpg_error_config = ["gpg-error-config"]
  gpgme_config_flags = ["--thread=pthread"]
  gpgme_config = ["gpgme-config"] + gpgme_config_flags
  gpgme_h = ""
-@@ -157,14 +156,7 @@ class BuildExtFirstHack(build):
+@@ -181,16 +180,8 @@ class BuildExtFirstHack(build):
+         shutil.copy2(source_name, sink_name)
  
      def _generate_errors_i(self):
- 
+-
 -        try:
--            subprocess.check_call(gpg_error_config + ['--version'],
--                                  stdout=devnull)
+-            subprocess.check_call(
+-                gpg_error_config + ['--version'], stdout=devnull)
 -        except:
 -            sys.exit("Could not find gpg-error-config.  " +
 -                     "Please install the libgpg-error development package.")
 -
--        gpg_error_content = self._read_header("gpg-error.h", getconfig("cflags", config=gpg_error_config))
-+        gpg_error_content = self._read_header("gpg-error.h", os.environ.get('CFLAGS').split())
+         gpg_error_content = self._read_header(
+-            "gpg-error.h", getconfig("cflags", config=gpg_error_config))
++            "gpg-error.h", os.environ.get('CFLAGS').split())
  
          filter_re = re.compile(r'GPG_ERR_[^ ]* =')
          rewrite_re = re.compile(r' *(.*) = .*')
diff --git a/meta/recipes-support/gpgme/gpgme/0003-Correctly-install-python-modules.patch b/meta/recipes-support/gpgme/gpgme/0003-Correctly-install-python-modules.patch
index 330bec6..de1689e 100644
--- a/meta/recipes-support/gpgme/gpgme/0003-Correctly-install-python-modules.patch
+++ b/meta/recipes-support/gpgme/gpgme/0003-Correctly-install-python-modules.patch
@@ -1,4 +1,4 @@
-From 60baf9ebf30bed0e2ee3c7c5a74d5b6d50035862 Mon Sep 17 00:00:00 2001
+From f632148fcc8757bb9a9601a6dab275e88cd309d2 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 30 Jan 2018 15:28:49 +0800
 Subject: [PATCH 3/7] Correctly install python modules
@@ -17,10 +17,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/lang/python/Makefile.am b/lang/python/Makefile.am
-index 8d74cbd..ce4f0a5 100644
+index 6988faf..36c6f7b 100644
 --- a/lang/python/Makefile.am
 +++ b/lang/python/Makefile.am
-@@ -91,6 +91,7 @@ install-exec-local:
+@@ -93,6 +93,7 @@ install-exec-local:
  	  --build-base="$$(basename "$${PYTHON}")-gpg" \
  	  install \
  	  --prefix "$(DESTDIR)$(prefix)" \
diff --git a/meta/recipes-support/gpgme/gpgme/0004-python-import.patch b/meta/recipes-support/gpgme/gpgme/0004-python-import.patch
index 1a60f79..fa0eccf 100644
--- a/meta/recipes-support/gpgme/gpgme/0004-python-import.patch
+++ b/meta/recipes-support/gpgme/gpgme/0004-python-import.patch
@@ -1,4 +1,4 @@
-From fd7dcceeee439eb479edbb418bab635343414ee6 Mon Sep 17 00:00:00 2001
+From f51bf1114bee6d56a950dcc6ebb46d6138b3faed Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 16 Aug 2017 02:06:45 -0400
 Subject: [PATCH 4/7] python import
diff --git a/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch b/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch
index 2da7904..50bf214 100644
--- a/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch
+++ b/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch
@@ -1,4 +1,4 @@
-From a58d90632a9907be3e8001800a143ac19075241a Mon Sep 17 00:00:00 2001
+From 8d9613c34ae495bbcbd725a2e7ac48138ba53c30 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 13 Apr 2017 16:40:27 +0300
 Subject: [PATCH 5/7] gpgme-config: skip all /lib* or /usr/lib* directories in
diff --git a/meta/recipes-support/gpgme/gpgme/0006-fix-build-path-issue.patch b/meta/recipes-support/gpgme/gpgme/0006-fix-build-path-issue.patch
index 26ff472..1471184 100644
--- a/meta/recipes-support/gpgme/gpgme/0006-fix-build-path-issue.patch
+++ b/meta/recipes-support/gpgme/gpgme/0006-fix-build-path-issue.patch
@@ -1,4 +1,4 @@
-From 4f83750ce402b65d16cc09f8a0274a7ec76fc634 Mon Sep 17 00:00:00 2001
+From ef920688bfe1c7328c9e97229d62ccd35304ad84 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 31 Jan 2018 11:01:09 +0800
 Subject: [PATCH 6/7] fix build path issue
@@ -17,10 +17,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/lang/python/Makefile.am b/lang/python/Makefile.am
-index ce4f0a5..5a468f1 100644
+index 36c6f7b..ce9a108 100644
 --- a/lang/python/Makefile.am
 +++ b/lang/python/Makefile.am
-@@ -90,8 +90,9 @@ install-exec-local:
+@@ -92,8 +92,9 @@ install-exec-local:
  	  build \
  	  --build-base="$$(basename "$${PYTHON}")-gpg" \
  	  install \
diff --git a/meta/recipes-support/gpgme/gpgme/0007-qt-python-Add-variables-to-tests.patch b/meta/recipes-support/gpgme/gpgme/0007-python-Add-variables-to-tests.patch
similarity index 43%
rename from meta/recipes-support/gpgme/gpgme/0007-qt-python-Add-variables-to-tests.patch
rename to meta/recipes-support/gpgme/gpgme/0007-python-Add-variables-to-tests.patch
index 63eeacf..af9ddbf 100644
--- a/meta/recipes-support/gpgme/gpgme/0007-qt-python-Add-variables-to-tests.patch
+++ b/meta/recipes-support/gpgme/gpgme/0007-python-Add-variables-to-tests.patch
@@ -1,28 +1,24 @@
-From d3087348348b4a7fcfb05bf2a75b4a63453e1c77 Mon Sep 17 00:00:00 2001
+From 317cdf60165d760572a26db317e3d6edb159b04e Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Thu, 1 Feb 2018 10:14:30 +0800
-Subject: [PATCH 7/7] qt/python: Add variables to tests
+Date: Wed, 17 Oct 2018 23:41:09 +0800
+Subject: [PATCH 7/7] python: Add variables to tests
 
 * configure.ac, lang/python/Makefile.am:
   New variable to `lang/python', set to `lang/python' if RUN_LANG_PYTHON_TESTS
 
-* configure.ac, lang/qt/Makefile.am:
-  New variable to `lang/qt', set to `lang/qt' if RUN_LANG_QT_TESTS
-
 Upstream-Status: Submitted [gnupg-devel@gnupg.org]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- configure.ac            | 11 +++++++++++
- lang/python/Makefile.am |  3 +++
- lang/qt/Makefile.am     |  8 +++++++-
- 3 files changed, 21 insertions(+), 1 deletion(-)
+ configure.ac            | 5 +++++
+ lang/python/Makefile.am | 3 +++
+ 2 files changed, 8 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 7485cdf..4aa216d 100644
+index 865bd10..035555a 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -535,6 +535,17 @@ AC_ARG_ENABLE(g13-test,
+@@ -535,6 +535,11 @@ AC_ARG_ENABLE(g13-test,
           run_g13_test=$enableval)
  AM_CONDITIONAL(RUN_G13_TESTS, test "$run_g13_test" = "yes")
  
@@ -31,21 +27,15 @@ index 7485cdf..4aa216d 100644
 +  AC_HELP_STRING([--disable-lang-python-test], [disable Python regression test]),
 +         run_lang_python_test=$enableval)
 +AM_CONDITIONAL(RUN_LANG_PYTHON_TESTS, test "$run_lang_python_test" = "yes")
-+
-+run_lang_qt_test="yes"
-+AC_ARG_ENABLE(lang-qt-test,
-+  AC_HELP_STRING([--disable-lang-qt-test], [disable Qt regression test]),
-+         run_lang_qt_test=$enableval)
-+AM_CONDITIONAL(RUN_LANG_QT_TESTS, test "$run_lang_qt_test" = "yes")
  
  # Checks for header files.
- AC_CHECK_HEADERS_ONCE([locale.h sys/select.h sys/uio.h argp.h
+ AC_CHECK_HEADERS_ONCE([locale.h sys/select.h sys/uio.h argp.h stdint.h
 diff --git a/lang/python/Makefile.am b/lang/python/Makefile.am
-index 5a468f1..43b9788 100644
+index ce9a108..0c8cfdc 100644
 --- a/lang/python/Makefile.am
 +++ b/lang/python/Makefile.am
-@@ -24,7 +24,10 @@ EXTRA_DIST = \
- 	examples \
+@@ -25,7 +25,10 @@ EXTRA_DIST = \
+ 	doc \
  	src
  
 +if RUN_LANG_PYTHON_TESTS
@@ -55,24 +45,6 @@ index 5a468f1..43b9788 100644
  
  .PHONY: prepare
  prepare: copystamp
-diff --git a/lang/qt/Makefile.am b/lang/qt/Makefile.am
-index ab85960..a244ede 100644
---- a/lang/qt/Makefile.am
-+++ b/lang/qt/Makefile.am
-@@ -19,6 +19,12 @@
- # Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
- # 02111-1307, USA
- 
--SUBDIRS = src tests doc
-+if RUN_LANG_QT_TESTS
-+qttests = tests
-+else
-+qttests =
-+endif
-+
-+SUBDIRS = src ${qttests} doc
- 
- EXTRA_DIST = README
 -- 
 2.7.4
 
diff --git a/meta/recipes-support/gpgme/gpgme_1.11.1.bb b/meta/recipes-support/gpgme/gpgme_1.12.0.bb
similarity index 93%
rename from meta/recipes-support/gpgme/gpgme_1.11.1.bb
rename to meta/recipes-support/gpgme/gpgme_1.12.0.bb
index 86fae94..b46c5fc 100644
--- a/meta/recipes-support/gpgme/gpgme_1.11.1.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.12.0.bb
@@ -17,11 +17,11 @@ SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
            file://0004-python-import.patch \
            file://0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch \
            file://0006-fix-build-path-issue.patch \
-           file://0007-qt-python-Add-variables-to-tests.patch \
+           file://0007-python-Add-variables-to-tests.patch \
           "
 
-SRC_URI[md5sum] = "129c46fb85a7ffa41e43345e48aee884"
-SRC_URI[sha256sum] = "2d1b111774d2e3dd26dcd7c251819ce4ef774ec5e566251eb9308fa7542fbd6f"
+SRC_URI[md5sum] = "902fca3a94907efe4e929b2ade545a7c"
+SRC_URI[sha256sum] = "b4dc951c3743a60e2e120a77892e9e864fb936b2e58e7c77e8581f4d050e8cd8"
 
 DEPENDS = "libgpg-error libassuan"
 RDEPENDS_${PN}-cpp += "libstdc++"
@@ -56,7 +56,6 @@ EXTRA_OECONF += '--enable-languages="${LANGUAGES}" \
                  --disable-gpg-test \
                  --disable-gpgsm-test \
                  --disable-g13-test \
-                 --disable-lang-qt-test \
                  --disable-lang-python-test \
 '
 
-- 
2.7.4


