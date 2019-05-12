Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6E1447E097
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 May 2019 08:17:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4C8HI58008555
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 12 May 2019 01:17:29 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Sun, 12 May 2019 01:17:08 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Sun, 12 May 2019 16:16:24 +0800
Message-ID: <6dbeb5070ef6a86368ebcf1934ff543e963ba0fc.1557628550.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
In-Reply-To: <cover.1557628550.git.hongxu.jia@windriver.com>
References: <cover.1557628550.git.hongxu.jia@windriver.com>
Subject: [PATCH 04/10] bash: upgrade 4.4.18 -> 5.0
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
X-List-Received-Date: Sun, 12 May 2019 08:17:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

- Rebase build-tests.patch and execute_cmd.patch to 5.0

- Drop 0001-help-fix-printf-format-security-warning.patch
  and pathexp-dep.patch, upstream has fixed them in commit
  [d233b48 bash-5.0 distribution sources and documentation]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...1-help-fix-printf-format-security-warning.patch | 35 -----------------
 meta/recipes-extended/bash/bash/build-tests.patch  |  7 +++-
 meta/recipes-extended/bash/bash/execute_cmd.patch  | 19 ++++++---
 meta/recipes-extended/bash/bash/pathexp-dep.patch  | 13 -------
 meta/recipes-extended/bash/bash_4.4.18.bb          | 41 --------------------
 meta/recipes-extended/bash/bash_5.0.bb             | 45 ++++++++++++++++++++++
 6 files changed, 64 insertions(+), 96 deletions(-)
 delete mode 100644 meta/recipes-extended/bash/bash/0001-help-fix-printf-format-security-warning.patch
 delete mode 100644 meta/recipes-extended/bash/bash/pathexp-dep.patch
 delete mode 100644 meta/recipes-extended/bash/bash_4.4.18.bb
 create mode 100644 meta/recipes-extended/bash/bash_5.0.bb

diff --git a/meta/recipes-extended/bash/bash/0001-help-fix-printf-format-security-warning.patch b/meta/recipes-extended/bash/bash/0001-help-fix-printf-format-security-warning.patch
deleted file mode 100644
index 5405c84..0000000
--- a/meta/recipes-extended/bash/bash/0001-help-fix-printf-format-security-warning.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From e5837a42f8f48a6a721805ff8f7fcd32861d09ca Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <adraszik@tycoint.com>
-Date: Tue, 26 Jul 2016 13:09:47 +0100
-Subject: [PATCH] help: fix printf() format security warning
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-| ../../bash-4.3.30/builtins/../../bash-4.3.30/builtins/help.def: In function 'help_builtin':
-| ../../bash-4.3.30/builtins/../../bash-4.3.30/builtins/help.def:130:7: error: format not a string literal and no format arguments [-Werror=format-security]
-|        printf (ngettext ("Shell commands matching keyword `", "Shell commands matching keywords `", (list->next ? 2 : 1)));
-|        ^~~~~~
-
-Signed-off-by: André Draszik <adraszik@tycoint.com>
----
-Upstream-Status: Pending
- builtins/help.def | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/builtins/help.def b/builtins/help.def
-index 1894f17..cf624c6 100644
---- a/builtins/help.def
-+++ b/builtins/help.def
-@@ -127,7 +127,7 @@ help_builtin (list)
- 
-   if (glob_pattern_p (list->word->word))
-     {
--      printf (ngettext ("Shell commands matching keyword `", "Shell commands matching keywords `", (list->next ? 2 : 1)));
-+      printf ("%s", ngettext ("Shell commands matching keyword `", "Shell commands matching keywords `", (list->next ? 2 : 1)));
-       print_word_list (list, ", ");
-       printf ("'\n\n");
-     }
--- 
-2.8.1
-
diff --git a/meta/recipes-extended/bash/bash/build-tests.patch b/meta/recipes-extended/bash/bash/build-tests.patch
index 73a81b6..5f2dae9 100644
--- a/meta/recipes-extended/bash/bash/build-tests.patch
+++ b/meta/recipes-extended/bash/bash/build-tests.patch
@@ -2,15 +2,18 @@ Add 'ptest' target to Makefile, to run tests without checking dependencies.
 
 Upstream-Status: Pending
 Signed-off-by: Anders Roxell <anders.roxell@enea.com>
+
+Rebase to 5.0
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  Makefile.in | 24 +++++++++++++++++++-----
  1 file changed, 19 insertions(+), 5 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
+index 5fcb44b..de1c255 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -848,20 +848,34 @@ maybe-clean:
+@@ -932,20 +932,34 @@ maybe-clean:
  	fi
  
  recho$(EXEEXT):		$(SUPPORT_SRC)recho.c
@@ -51,5 +54,5 @@ diff --git a/Makefile.in b/Makefile.in
  		PATH=$(BUILD_DIR)/tests:$$PATH THIS_SH=$(THIS_SH) $(SHELL) ${TESTSCRIPT} )
  
 -- 
-1.8.1.2
+2.7.4
 
diff --git a/meta/recipes-extended/bash/bash/execute_cmd.patch b/meta/recipes-extended/bash/bash/execute_cmd.patch
index 9970b4d..7a9e9a9 100644
--- a/meta/recipes-extended/bash/bash/execute_cmd.patch
+++ b/meta/recipes-extended/bash/bash/execute_cmd.patch
@@ -1,10 +1,16 @@
 Upstream-Status: Inappropriate [embedded specific]
 
-Index: execute_cmd.c
-===================================================================
---- execute_cmd.c.orig
-+++ execute_cmd.c
-@@ -2459,7 +2459,11 @@ execute_pipeline (command, asynchronous,
+Rebase to 5.0
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ execute_cmd.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/execute_cmd.c b/execute_cmd.c
+index f1d74bf..31674b4 100644
+--- a/execute_cmd.c
++++ b/execute_cmd.c
+@@ -2567,7 +2567,11 @@ execute_pipeline (command, asynchronous, pipe_in, pipe_out, fds_to_close)
    /* If the `lastpipe' option is set with shopt, and job control is not
       enabled, execute the last element of non-async pipelines in the
       current shell environment. */
@@ -17,3 +23,6 @@ Index: execute_cmd.c
      {
        lstdin = move_to_high_fd (0, 1, -1);
        if (lstdin > 0)
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/bash/bash/pathexp-dep.patch b/meta/recipes-extended/bash/bash/pathexp-dep.patch
deleted file mode 100644
index e05bbda..0000000
--- a/meta/recipes-extended/bash/bash/pathexp-dep.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-pathexp includes libintl.h but doesn't depend on it, thus a build race can occur.
-
-Upstream-Status: Submitted (https://savannah.gnu.org/patch/index.php?9503)
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/Makefile.in b/Makefile.in
-index c7b62bc0..241cbf12 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -1281,2 +1281,3 @@ nojobs.o: bashintl.h ${LIBINTL_H} $(BASHINCDIR)/gettext.h
- y.tab.o: bashintl.h ${LIBINTL_H} $(BASHINCDIR)/gettext.h
-+pathexp.o: bashintl.h ${LIBINTL_H} $(BASHINCDIR)/gettext.h
- pcomplete.o: bashintl.h ${LIBINTL_H} $(BASHINCDIR)/gettext.h
diff --git a/meta/recipes-extended/bash/bash_4.4.18.bb b/meta/recipes-extended/bash/bash_4.4.18.bb
deleted file mode 100644
index 8fa0978..0000000
--- a/meta/recipes-extended/bash/bash_4.4.18.bb
+++ /dev/null
@@ -1,41 +0,0 @@
-require bash.inc
-
-# GPLv2+ (< 4.0), GPLv3+ (>= 4.0)
-LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-
-SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
-           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-019;apply=yes;striplevel=0;name=patch019 \
-           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-020;apply=yes;striplevel=0;name=patch020 \
-           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-021;apply=yes;striplevel=0;name=patch021 \
-           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-022;apply=yes;striplevel=0;name=patch022 \
-           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-023;apply=yes;striplevel=0;name=patch023 \
-           file://execute_cmd.patch;striplevel=0 \
-           file://mkbuiltins_have_stringize.patch \
-           file://build-tests.patch \
-           file://test-output.patch \
-           file://fix-run-coproc-run-heredoc-run-execscript-run-test-f.patch \
-           file://run-ptest \
-           file://fix-run-builtins.patch \
-           file://0001-help-fix-printf-format-security-warning.patch \
-           file://pathexp-dep.patch \
-           "
-
-SRC_URI[tarball.md5sum] = "518e2c187cc11a17040f0915dddce54e"
-SRC_URI[tarball.sha256sum] = "604d9eec5e4ed5fd2180ee44dd756ddca92e0b6aa4217bbab2b6227380317f23"
-
-SRC_URI[patch019.md5sum] = "8f43e1d277b02f3319a34c1cd4a4ff3e"
-SRC_URI[patch019.sha256sum] = "27170d6edfe8819835407fdc08b401d2e161b1400fe9d0c5317a51104c89c11e"
-SRC_URI[patch020.md5sum] = "5217ff08c444446ec306dce60437c288"
-SRC_URI[patch020.sha256sum] = "1840e2cbf26ba822913662f74037594ed562361485390c52813b38156c99522c"
-SRC_URI[patch021.md5sum] = "282c7d9b38da8005d25b4f816328a2f4"
-SRC_URI[patch021.sha256sum] = "bd8f59054a763ec1c64179ad5cb607f558708a317c2bdb22b814e3da456374c1"
-SRC_URI[patch022.md5sum] = "0b709c9d7f8e6cf267a8b863efb899f7"
-SRC_URI[patch022.sha256sum] = "45331f0936e36ab91bfe44b936e33ed8a1b1848fa896e8a1d0f2ef74f297cb79"
-SRC_URI[patch023.md5sum] = "fe2e0ca4cf9409ff0e9428e1236f983e"
-SRC_URI[patch023.sha256sum] = "4fec236f3fbd3d0c47b893fdfa9122142a474f6ef66c20ffb6c0f4864dd591b6"
-
-DEBUG_OPTIMIZATION_append_armv4 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
-DEBUG_OPTIMIZATION_append_armv5 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
-
-BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-extended/bash/bash_5.0.bb b/meta/recipes-extended/bash/bash_5.0.bb
new file mode 100644
index 0000000..e60e530
--- /dev/null
+++ b/meta/recipes-extended/bash/bash_5.0.bb
@@ -0,0 +1,45 @@
+require bash.inc
+
+# GPLv2+ (< 4.0), GPLv3+ (>= 4.0)
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
+           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-001;apply=yes;striplevel=0;name=patch001 \
+           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-002;apply=yes;striplevel=0;name=patch002 \
+           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-003;apply=yes;striplevel=0;name=patch003 \
+           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-004;apply=yes;striplevel=0;name=patch004 \
+           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-005;apply=yes;striplevel=0;name=patch005 \
+           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-006;apply=yes;striplevel=0;name=patch006 \
+           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-007;apply=yes;striplevel=0;name=patch007 \
+           file://execute_cmd.patch \
+           file://mkbuiltins_have_stringize.patch \
+           file://build-tests.patch \
+           file://test-output.patch \
+           file://fix-run-coproc-run-heredoc-run-execscript-run-test-f.patch \
+           file://run-ptest \
+           file://fix-run-builtins.patch \
+           "
+
+SRC_URI[tarball.md5sum] = "2b44b47b905be16f45709648f671820b"
+SRC_URI[tarball.sha256sum] = "b4a80f2ac66170b2913efbfb9f2594f1f76c7b1afd11f799e22035d63077fb4d"
+
+SRC_URI[patch001.md5sum] = "b026862ab596a5883bb4f0d1077a3819"
+SRC_URI[patch001.sha256sum] = "f2fe9e1f0faddf14ab9bfa88d450a75e5d028fedafad23b88716bd657c737289"
+SRC_URI[patch002.md5sum] = "2f4a7787365790ae57f36b311701ea7e"
+SRC_URI[patch002.sha256sum] = "87e87d3542e598799adb3e7e01c8165bc743e136a400ed0de015845f7ff68707"
+SRC_URI[patch003.md5sum] = "af7f2dd93fd5429fb5e9a642ff74f87d"
+SRC_URI[patch003.sha256sum] = "4eebcdc37b13793a232c5f2f498a5fcbf7da0ecb3da2059391c096db620ec85b"
+SRC_URI[patch004.md5sum] = "b60545b273bfa4e00a760f2c648bed9c"
+SRC_URI[patch004.sha256sum] = "14447ad832add8ecfafdce5384badd933697b559c4688d6b9e3d36ff36c62f08"
+SRC_URI[patch005.md5sum] = "875a0bedf48b74e453e3997c84b5d8a4"
+SRC_URI[patch005.sha256sum] = "5bf54dd9bd2c211d2bfb34a49e2c741f2ed5e338767e9ce9f4d41254bf9f8276"
+SRC_URI[patch006.md5sum] = "4a8ee95adb72c3aba03d9e8c9f96ece6"
+SRC_URI[patch006.sha256sum] = "d68529a6ff201b6ff5915318ab12fc16b8a0ebb77fda3308303fcc1e13398420"
+SRC_URI[patch007.md5sum] = "411560d81fde2dc5b17b83c3f3b58c6f"
+SRC_URI[patch007.sha256sum] = "17b41e7ee3673d8887dd25992417a398677533ab8827938aa41fad70df19af9b"
+
+DEBUG_OPTIMIZATION_append_armv4 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
+DEBUG_OPTIMIZATION_append_armv5 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
+
+BBCLASSEXTEND = "nativesdk"
-- 
2.7.4


