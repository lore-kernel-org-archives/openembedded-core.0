Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A3D2077EA6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Feb 2018 06:17:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w116HF6B014376
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 31 Jan 2018 22:17:15 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 31 Jan 2018 22:17:14 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Thu, 1 Feb 2018 01:17:10 -0500
Message-ID: <1517465830-176531-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <CAJTo0LZo4a195YP24GeLY_wGj4uUEBtu2-QDXj=L594KExZV7Q@mail.gmail.com>
References: <CAJTo0LZo4a195YP24GeLY_wGj4uUEBtu2-QDXj=L594KExZV7Q@mail.gmail.com>
MIME-Version: 1.0
Subject: [PATCH V2] gpgme: 1.9.0 -> 1.10.0
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
X-List-Received-Date: Thu, 01 Feb 2018 06:17:14 -0000
Content-Type: text/plain

1. Disable test at build time to workaround corss-compile
   Add 0007 to add option to disable python test and submit
   it to upstream

2. Rework patch 0002, since the following commit of upstream.
   https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gpgme.git;a=commit;h=7309ce6f5f7c86570953a141965d4f54cd9ad9a0

3. Add patch 0006 to fix build path issue to improve reproducibility
   and submit it to upstream

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../gpgme/gpgme/0001-pkgconfig.patch               | 10 +--
 ...python-gpg-error-config-should-not-be-use.patch | 66 ++++++++----------
 .../0003-Correctly-install-python-modules.patch    | 27 ++++----
 .../gpgme/gpgme/0004-python-import.patch           |  6 +-
 ...g-skip-all-lib-or-usr-lib-directories-in-.patch |  6 +-
 .../gpgme/gpgme/0006-fix-build-path-issue.patch    | 37 ++++++++++
 .../0007-qt-python-Add-variables-to-tests.patch    | 78 ++++++++++++++++++++++
 .../gpgme/{gpgme_1.9.0.bb => gpgme_1.10.0.bb}      | 15 ++++-
 8 files changed, 179 insertions(+), 66 deletions(-)
 create mode 100644 meta/recipes-support/gpgme/gpgme/0006-fix-build-path-issue.patch
 create mode 100644 meta/recipes-support/gpgme/gpgme/0007-qt-python-Add-variables-to-tests.patch
 rename meta/recipes-support/gpgme/{gpgme_1.9.0.bb => gpgme_1.10.0.bb} (84%)

diff --git a/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch b/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
index 14a43ee..f1997e1 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
@@ -1,7 +1,7 @@
-From 8ae149035c97d27cd2c624704d1651806c53577e Mon Sep 17 00:00:00 2001
+From 265faf8fe0acaca2043a248a4df02b0868ffa6de Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 16 Aug 2017 02:00:08 -0400
-Subject: [PATCH 1/5] pkgconfig
+Subject: [PATCH 1/4] pkgconfig
 
 Update gpgme to use pkgconfig instead of -config files since its
 simpler and less error prone when cross compiling.
@@ -25,10 +25,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  create mode 100644 src/gpgme.pc.in
 
 diff --git a/configure.ac b/configure.ac
-index 0dac6ce..6a9e507 100644
+index 6ea4bcd..2a0d528 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -866,6 +866,7 @@ AC_CONFIG_FILES(Makefile src/Makefile
+@@ -887,6 +887,7 @@ AC_CONFIG_FILES(Makefile src/Makefile
                  src/versioninfo.rc
                  src/gpgme.h)
  AC_CONFIG_FILES(src/gpgme-config, chmod +x src/gpgme-config)
@@ -299,5 +299,5 @@ index 0000000..b69539f
 +Requires: libassuan gpg-error
 \ No newline at end of file
 -- 
-2.8.1
+1.8.3.1
 
diff --git a/meta/recipes-support/gpgme/gpgme/0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch b/meta/recipes-support/gpgme/gpgme/0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch
index f1f8c91..d20271e 100644
--- a/meta/recipes-support/gpgme/gpgme/0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch
+++ b/meta/recipes-support/gpgme/gpgme/0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch
@@ -1,29 +1,28 @@
-From fb165c9bd96aca8c9ee3e4509c9b6e35d238ad2e Mon Sep 17 00:00:00 2001
-From: Mark Hatle <mark.hatle@windriver.com>
-Date: Wed, 16 Aug 2017 02:02:47 -0400
-Subject: [PATCH 2/5] gpgme/lang/python: gpg-error-config should not be used.
+From 30f7a694cc4568ecb24f77c83a6123ed3f4075fa Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 31 Jan 2018 10:44:19 +0800
+Subject: [PATCH] gpgme/lang/python: gpg-error-config should not be used
 
-gpg-error-config was modified by OE to always return an error.  So we want
-to find an alternative way to retrieve whatever it is we need.  It turns
-out that the system is just trying to find the path to the gpg-error.h, which
-we can pull in from the STAGING_INC environment.
+gpg-error-config was modified by OE to always return an error.
+So we want to find an alternative way to retrieve whatever it
+is we need.
 
 Upstream-Status: Inappropriate [changes are specific to OE]
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
-Rebase to 1.9.0
+Rework to 1.10.0
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- lang/python/setup.py.in | 15 ++-------------
- 1 file changed, 2 insertions(+), 13 deletions(-)
+ lang/python/setup.py.in | 10 +---------
+ 1 file changed, 1 insertion(+), 9 deletions(-)
 
 diff --git a/lang/python/setup.py.in b/lang/python/setup.py.in
-index bf4efa3..7c34487 100755
+index f9dda20..9f5d61f 100755
 --- a/lang/python/setup.py.in
 +++ b/lang/python/setup.py.in
-@@ -24,7 +24,6 @@ import glob
+@@ -26,7 +26,6 @@ import shutil
  import subprocess
  
  # Out-of-tree build of the gpg bindings.
@@ -31,35 +30,22 @@ index bf4efa3..7c34487 100755
  gpgme_config_flags = ["--thread=pthread"]
  gpgme_config = ["gpgme-config"] + gpgme_config_flags
  gpgme_h = ""
-@@ -52,13 +51,6 @@ else:
-     devnull = open(os.devnull, "w")
+@@ -174,14 +173,7 @@ class BuildExtFirstHack(build):
  
- try:
--    subprocess.check_call(gpg_error_config + ['--version'],
--                          stdout=devnull)
--except:
--    sys.exit("Could not find gpg-error-config.  " +
--             "Please install the libgpg-error development package.")
--
--try:
-     subprocess.check_call(gpgme_config + ['--version'],
-                           stdout=devnull)
- except:
-@@ -81,12 +73,9 @@ if not (major > 1 or (major == 1 and minor >= 7)):
- if not gpgme_h:
-     gpgme_h = os.path.join(getconfig("prefix")[0], "include", "gpgme.h")
- 
--gpg_error_prefix = getconfig("prefix", config=gpg_error_config)[0]
--gpg_error_h = os.path.join(gpg_error_prefix, "include", "gpg-error.h")
-+gpg_error_h = os.path.join(os.getenv('STAGING_INCDIR'), "gpg-error.h")
- if not os.path.exists(gpg_error_h):
--    gpg_error_h = \
--        glob.glob(os.path.join(gpg_error_prefix, "include",
--                               "*", "gpg-error.h"))[0]
-+    sys.exit("gpg_error_h not found: %s" % gpg_error_h)
+     def _generate_errors_i(self):
  
- print("Building python gpg module using {} and {}.".format(gpgme_h, gpg_error_h))
+-        try:
+-            subprocess.check_call(gpg_error_config + ['--version'],
+-                                  stdout=devnull)
+-        except:
+-            sys.exit("Could not find gpg-error-config.  " +
+-                     "Please install the libgpg-error development package.")
+-
+-        gpg_error_content = self._read_header("gpg-error.h", getconfig("cflags", config=gpg_error_config))
++        gpg_error_content = self._read_header("gpg-error.h", os.environ.get('CFLAGS').split())
  
+         filter_re = re.compile(r'GPG_ERR_[^ ]* =')
+         rewrite_re = re.compile(r' *(.*) = .*')
 -- 
-2.8.1
+1.8.3.1
 
diff --git a/meta/recipes-support/gpgme/gpgme/0003-Correctly-install-python-modules.patch b/meta/recipes-support/gpgme/gpgme/0003-Correctly-install-python-modules.patch
index d383311..7c9cccc 100644
--- a/meta/recipes-support/gpgme/gpgme/0003-Correctly-install-python-modules.patch
+++ b/meta/recipes-support/gpgme/gpgme/0003-Correctly-install-python-modules.patch
@@ -1,7 +1,7 @@
-From 62332eec752dd790f4dd071dfb0dbe86be377203 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 16 Aug 2017 02:05:34 -0400
-Subject: [PATCH 3/5] Correctly install python modules
+From 93aae34ee70b8d50b31a19a65d6ac8290cb148ae Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 30 Jan 2018 15:28:49 +0800
+Subject: [PATCH 2/4] Correctly install python modules
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
@@ -9,22 +9,25 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 Rebase to 1.9.0
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+Rebase to 1.10.0
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  lang/python/Makefile.am | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/lang/python/Makefile.am b/lang/python/Makefile.am
-index d91ead9..67f7cdc 100644
+index 8d74cbd..ce4f0a5 100644
 --- a/lang/python/Makefile.am
 +++ b/lang/python/Makefile.am
-@@ -106,6 +106,7 @@ install-exec-local:
- 	  cd python$${VERSION}-gpg ; \
- 	  $$PYTHON setup.py install \
- 	  --prefix $(DESTDIR)$(prefix) \
+@@ -91,6 +91,7 @@ install-exec-local:
+ 	  --build-base="$$(basename "$${PYTHON}")-gpg" \
+ 	  install \
+ 	  --prefix "$(DESTDIR)$(prefix)" \
 +	  --install-lib=$(DESTDIR)${pythondir} \
- 	  --record files.txt \
  	  --verbose ; \
- 	  cat files.txt >> ../install_files.txt ; \
+ 	done
+ 
 -- 
-2.8.1
+1.8.3.1
 
diff --git a/meta/recipes-support/gpgme/gpgme/0004-python-import.patch b/meta/recipes-support/gpgme/gpgme/0004-python-import.patch
index 9307103..d2b039d 100644
--- a/meta/recipes-support/gpgme/gpgme/0004-python-import.patch
+++ b/meta/recipes-support/gpgme/gpgme/0004-python-import.patch
@@ -1,7 +1,7 @@
-From ccbf028eea8815d3b16d6c34b527253a6b108ec3 Mon Sep 17 00:00:00 2001
+From 32ecc3f058307060e40af86127cd226248a73c41 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 16 Aug 2017 02:06:45 -0400
-Subject: [PATCH 4/5] python import
+Subject: [PATCH 3/4] python import
 
 Don't check for output on stderr to know if an import worked, host inputrc and
 sysroot readline can cause warnings on stderr.
@@ -30,5 +30,5 @@ index b990d5b..318b089 100644
  	else
  		AC_MSG_RESULT([no])
 -- 
-2.8.1
+1.8.3.1
 
diff --git a/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch b/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch
index 7a6cc7b..963ae87 100644
--- a/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch
+++ b/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch
@@ -1,7 +1,7 @@
-From 064ae4441e2c11329748a18157988f9e953f9752 Mon Sep 17 00:00:00 2001
+From 6dcedc4dd055af902719b1a1cb10daa935a27f58 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 13 Apr 2017 16:40:27 +0300
-Subject: [PATCH 5/5] gpgme-config: skip all /lib* or /usr/lib* directories in
+Subject: [PATCH 4/4] gpgme-config: skip all /lib* or /usr/lib* directories in
  output
 
 The logic was not working in multilib setups which use other
@@ -27,5 +27,5 @@ index a4d152e..8342865 100644
                        ;;
                    -L*|-l*)
 -- 
-2.8.1
+1.8.3.1
 
diff --git a/meta/recipes-support/gpgme/gpgme/0006-fix-build-path-issue.patch b/meta/recipes-support/gpgme/gpgme/0006-fix-build-path-issue.patch
new file mode 100644
index 0000000..8cc8983
--- /dev/null
+++ b/meta/recipes-support/gpgme/gpgme/0006-fix-build-path-issue.patch
@@ -0,0 +1,37 @@
+From 180a5669e4a13a550b1b0dcef1689b6c0470fe54 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 31 Jan 2018 11:01:09 +0800
+Subject: [PATCH] fix build path issue
+
+Get the "--root" directory supplied to the "install" command,
+and use it as a prefix to strip off the purported filename
+encoded in bytecode files.
+
+Since --root added, we need to tweak --prefix and --install-lib
+to use relative path.
+
+Upstream-Status: Submitted [gnupg-devel@gnupg.org]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ lang/python/Makefile.am | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/lang/python/Makefile.am b/lang/python/Makefile.am
+index ce4f0a5..5a468f1 100644
+--- a/lang/python/Makefile.am
++++ b/lang/python/Makefile.am
+@@ -90,8 +90,9 @@ install-exec-local:
+ 	  build \
+ 	  --build-base="$$(basename "$${PYTHON}")-gpg" \
+ 	  install \
+-	  --prefix "$(DESTDIR)$(prefix)" \
+-	  --install-lib=$(DESTDIR)${pythondir} \
++	  --root=${DESTDIR} \
++	  --prefix "$(prefix)" \
++	  --install-lib=${pythondir} \
+ 	  --verbose ; \
+ 	done
+ 
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-support/gpgme/gpgme/0007-qt-python-Add-variables-to-tests.patch b/meta/recipes-support/gpgme/gpgme/0007-qt-python-Add-variables-to-tests.patch
new file mode 100644
index 0000000..ce3745c
--- /dev/null
+++ b/meta/recipes-support/gpgme/gpgme/0007-qt-python-Add-variables-to-tests.patch
@@ -0,0 +1,78 @@
+From f47e8c6f9e461803468a64581d3640d873352eaa Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 1 Feb 2018 10:14:30 +0800
+Subject: [PATCH] qt/python: Add variables to tests
+
+* configure.ac, lang/python/Makefile.am:
+  New variable to `lang/python', set to `lang/python' if RUN_LANG_PYTHON_TESTS
+
+* configure.ac, lang/qt/Makefile.am:
+  New variable to `lang/qt', set to `lang/qt' if RUN_LANG_QT_TESTS
+
+Upstream-Status: Submitted [gnupg-devel@gnupg.org]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ configure.ac            | 11 +++++++++++
+ lang/python/Makefile.am |  3 +++
+ lang/qt/Makefile.am     |  8 +++++++-
+ 3 files changed, 21 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 608c376..fad7467 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -536,6 +536,17 @@ AC_ARG_ENABLE(g13-test,
+          run_g13_test=$enableval)
+ AM_CONDITIONAL(RUN_G13_TESTS, test "$run_g13_test" = "yes")
+ 
++run_lang_python_test="yes"
++AC_ARG_ENABLE(lang-python-test,
++  AC_HELP_STRING([--disable-lang-python-test], [disable Python regression test]),
++         run_lang_python_test=$enableval)
++AM_CONDITIONAL(RUN_LANG_PYTHON_TESTS, test "$run_lang_python_test" = "yes")
++
++run_lang_qt_test="yes"
++AC_ARG_ENABLE(lang-qt-test,
++  AC_HELP_STRING([--disable-lang-qt-test], [disable Qt regression test]),
++         run_lang_qt_test=$enableval)
++AM_CONDITIONAL(RUN_LANG_QT_TESTS, test "$run_lang_qt_test" = "yes")
+ 
+ # Checks for header files.
+ AC_CHECK_HEADERS_ONCE([locale.h sys/select.h sys/uio.h argp.h
+diff --git a/lang/python/Makefile.am b/lang/python/Makefile.am
+index 8d74cbd..43b5d1e 100644
+--- a/lang/python/Makefile.am
++++ b/lang/python/Makefile.am
+@@ -24,7 +24,10 @@ EXTRA_DIST = \
+ 	examples \
+ 	src
+ 
++if RUN_LANG_PYTHON_TESTS
+ SUBDIRS = . tests
++endif
++
+ 
+ .PHONY: prepare
+ prepare: copystamp
+diff --git a/lang/qt/Makefile.am b/lang/qt/Makefile.am
+index ab85960..a244ede 100644
+--- a/lang/qt/Makefile.am
++++ b/lang/qt/Makefile.am
+@@ -19,6 +19,12 @@
+ # Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
+ # 02111-1307, USA
+ 
+-SUBDIRS = src tests doc
++if RUN_LANG_QT_TESTS
++qttests = tests
++else
++qttests =
++endif
++
++SUBDIRS = src ${qttests} doc
+ 
+ EXTRA_DIST = README
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-support/gpgme/gpgme_1.9.0.bb b/meta/recipes-support/gpgme/gpgme_1.10.0.bb
similarity index 84%
rename from meta/recipes-support/gpgme/gpgme_1.9.0.bb
rename to meta/recipes-support/gpgme/gpgme_1.10.0.bb
index 065c346..f015f3a 100644
--- a/meta/recipes-support/gpgme/gpgme_1.9.0.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.10.0.bb
@@ -16,10 +16,12 @@ SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
            file://0003-Correctly-install-python-modules.patch \
            file://0004-python-import.patch \
            file://0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch \
+           file://0006-fix-build-path-issue.patch \
+           file://0007-qt-python-Add-variables-to-tests.patch \
           "
 
-SRC_URI[md5sum] = "1e00bb8ef04d1d05d5a0f19e143854c3"
-SRC_URI[sha256sum] = "1b29fedb8bfad775e70eafac5b0590621683b2d9869db994568e6401f4034ceb"
+SRC_URI[md5sum] = "78b1533c593478982ee2fc548260c563"
+SRC_URI[sha256sum] = "1a8fed1197c3b99c35f403066bb344a26224d292afc048cfdfc4ccd5690a0693"
 
 DEPENDS = "libgpg-error libassuan"
 RDEPENDS_${PN}-cpp += "libstdc++"
@@ -49,7 +51,14 @@ LANGUAGES .= "${@bb.utils.contains('PACKAGECONFIG', 'python3', ' python3', '', d
 PYTHON_INHERIT = "${@bb.utils.contains('PACKAGECONFIG', 'python2', 'pythonnative', '', d)}"
 PYTHON_INHERIT .= "${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3native', '', d)}"
 
-EXTRA_OECONF += '--enable-languages="${LANGUAGES}"'
+EXTRA_OECONF += '--enable-languages="${LANGUAGES}" \
+                 --disable-gpgconf-test \
+                 --disable-gpg-test \
+                 --disable-gpgsm-test \
+                 --disable-g13-test \
+                 --disable-lang-qt-test \
+                 --disable-lang-python-test \
+'
 
 inherit autotools texinfo binconfig-disabled pkgconfig ${PYTHON_INHERIT}
 
-- 
2.8.1


