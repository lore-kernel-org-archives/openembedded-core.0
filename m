Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B67DCD12699
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 12:02:08 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.16035.1730808125542407418
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 04:02:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PbBsdB1P;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4319399a411so45941995e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 04:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730808123; x=1731412923; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bN8qKv18UK+EWdWV1nS5cLgy03TJmjkdP9nPcioTkyw=;
        b=PbBsdB1PVrYSbEMD/Dwr4a1IoD+mnQGLyxRi5l0V2XsdBUlQJa3X/biZwSgyF0qcPX
         1MSn7eyP2I5pNDbRoqJmoqm+45IQBtshaaT6/tB0xk9VUUwybgyoiagB78PxROwPVECc
         dw3zRhzzS97v9hfeRj2ywhiIoKH7FglmoTj0wJr9M9qaN9PUuVkTJu85pSuPVM4Ka9sq
         qopkxzLM9hllqnLDo9j9KEsyNA7dyQYKmBRCK4gkSOt/UE9Vri+Ko3jw852IS5C6RIib
         fLp0hzjfhlq/iUogy9A6yVIAd1iIxnbm8pFC3CK9hVh6sf/ahcWFPo8ZvJgDXSWvXUsv
         37aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730808123; x=1731412923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bN8qKv18UK+EWdWV1nS5cLgy03TJmjkdP9nPcioTkyw=;
        b=kL6MXWjj3F25gJWNofc+X/iw+zju4EKlJwa0g0gZklJlm+jknY0rOv1n3wPP/zJ9wd
         ByOM7trrlfl2yduR4BxtQRRDOnkwpSGf2DvIIJVe3bIhYB1P2GZxzb3JptUNrAvJblGf
         Aj/0FFuMNkJ4RNTu2z/MfC5+Z+DvwFPACbKJ8FcMgX1hbhjh+mbVg8firxq9rCL2D50Y
         4CXhQyAhbApX9vEEvkeWd89X8l8TKuhbKEJQSzcSQFtLsClBH3dgPHPPYa/fPyTMgam6
         fhp7atkhQS7HMBNwsgFgHQXBhYqlJQfKiU6joMbqdqsKlkdfeLZt+2QTqTqjL96B6dk6
         0W1w==
X-Gm-Message-State: AOJu0Yy+/lF5vTgYv+0rbS8UceyDA2PClkLaY9CMMEna/87EVZQFquhb
	aeANwaYeqeCHksm4ePWDZ9Vvnk/yY3UwWJoWnOwu6U0cSFZCy62NScz+SQ==
X-Google-Smtp-Source: AGHT+IGW6OPaTDyKMO0629OCDN/ovWo1xyCUht+zT7k6yM/MFWSJrQRqgSk0k3w8HZvK4JXz/T03tg==
X-Received: by 2002:adf:ea06:0:b0:37d:45f0:dd08 with SMTP id ffacd0b85a97d-380610f212emr25076480f8f.11.1730808123126;
        Tue, 05 Nov 2024 04:02:03 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c113e595sm16009963f8f.77.2024.11.05.04.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 04:02:02 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v4 1/2] tcl: update 8.6.15 -> 9.0.0
Date: Tue,  5 Nov 2024 13:01:57 +0100
Message-Id: <20241105120158.696018-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 12:02:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206706

From: Alexander Kanavin <alex@linutronix.de>

Make adjustments needed for ptests: among others,
the binary.test needs 4G of RAM.

Apply all patches unconditionally for ease of future upgrades.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
v4: correctly create tclsh symlink (was previousy linking to tclsh8.6)
---
 meta/recipes-core/images/core-image-ptest.bb  |  1 +
 ...m-OE.dev-but-with-legacy-staging-fu.patch} | 16 +++++---
 ...patch => 0002-tcl-fix-a-build-issue.patch} | 37 ++++++++++---------
 ...o-lib64-instead-of-lib-on-64bit-tar.patch} | 19 ++++++----
 ...0004-tcl-update-the-header-location.patch} | 27 ++++++++------
 ...=> 0005-tcl-fix-race-in-interp.test.patch} | 11 ++++--
 meta/recipes-devtools/tcltk/tcl/run-ptest     |  7 ++--
 .../tcltk/{tcl_8.6.15.bb => tcl_9.0.0.bb}     | 27 ++++++--------
 8 files changed, 80 insertions(+), 65 deletions(-)
 rename meta/recipes-devtools/tcltk/tcl/{tcl-add-soname.patch => 0001-tcl-Add-tcltk-from-OE.dev-but-with-legacy-staging-fu.patch} (80%)
 rename meta/recipes-devtools/tcltk/tcl/{fix_non_native_build_issue.patch => 0002-tcl-fix-a-build-issue.patch} (71%)
 rename meta/recipes-devtools/tcltk/tcl/{tcl-remove-hardcoded-install-path.patch => 0003-tcl-install-tcl-to-lib64-instead-of-lib-on-64bit-tar.patch} (63%)
 rename meta/recipes-devtools/tcltk/tcl/{alter-includedir.patch => 0004-tcl-update-the-header-location.patch} (80%)
 rename meta/recipes-devtools/tcltk/tcl/{interp.patch => 0005-tcl-fix-race-in-interp.test.patch} (82%)
 rename meta/recipes-devtools/tcltk/{tcl_8.6.15.bb => tcl_9.0.0.bb} (81%)

diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-core/images/core-image-ptest.bb
index 72081f938de..a0ff8d9528e 100644
--- a/meta/recipes-core/images/core-image-ptest.bb
+++ b/meta/recipes-core/images/core-image-ptest.bb
@@ -32,6 +32,7 @@ QB_MEM = "-m 1024"
 QB_MEM:virtclass-mcextend-lttng-tools = "-m 4096"
 QB_MEM:virtclass-mcextend-python3 = "-m 2048"
 QB_MEM:virtclass-mcextend-python3-cryptography = "-m 5100"
+QB_MEM:virtclass-mcextend-tcl = "-m 5100"
 
 TEST_SUITES = "ping ssh parselogs ptest"
 
diff --git a/meta/recipes-devtools/tcltk/tcl/tcl-add-soname.patch b/meta/recipes-devtools/tcltk/tcl/0001-tcl-Add-tcltk-from-OE.dev-but-with-legacy-staging-fu.patch
similarity index 80%
rename from meta/recipes-devtools/tcltk/tcl/tcl-add-soname.patch
rename to meta/recipes-devtools/tcltk/tcl/0001-tcl-Add-tcltk-from-OE.dev-but-with-legacy-staging-fu.patch
index a0195e263c1..9472591a55f 100644
--- a/meta/recipes-devtools/tcltk/tcl/tcl-add-soname.patch
+++ b/meta/recipes-devtools/tcltk/tcl/0001-tcl-Add-tcltk-from-OE.dev-but-with-legacy-staging-fu.patch
@@ -1,7 +1,8 @@
-From b89fd73daf9b3eb2f889f65baba5f90d8a930c82 Mon Sep 17 00:00:00 2001
+From f69a01c5932af2d5ece6141e4424b14a2d645fd7 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <rpurdie@linux.intel.com>
 Date: Wed, 9 Dec 2009 23:59:44 +0000
-Subject: [PATCH] tcl: Add tcltk from OE.dev but with legacy staging function
+Subject: [PATCH 1/5] tcl: Add tcltk from OE.dev but with legacy staging
+ function
 
 Upstream-Status: Pending
 ---
@@ -10,10 +11,10 @@ Upstream-Status: Pending
  2 files changed, 7 insertions(+), 1 deletion(-)
 
 diff --git a/unix/Makefile.in b/unix/Makefile.in
-index 7619afc..9dd053d 100644
+index 0ff1258..6e74458 100644
 --- a/unix/Makefile.in
 +++ b/unix/Makefile.in
-@@ -904,7 +904,10 @@ install-binaries: binaries
+@@ -1027,7 +1027,10 @@ install-binaries: binaries
  	done
  	@echo "Installing $(LIB_FILE) to $(DLL_INSTALL_DIR)/"
  	@@INSTALL_LIB@
@@ -26,10 +27,10 @@ index 7619afc..9dd053d 100644
  	@$(INSTALL_PROGRAM) ${TCL_EXE} "$(BIN_INSTALL_DIR)/tclsh$(VERSION)${EXE_SUFFIX}"
  	@echo "Installing tclConfig.sh to $(CONFIG_INSTALL_DIR)/"
 diff --git a/unix/tcl.m4 b/unix/tcl.m4
-index 0307a06..37c4d67 100644
+index 99bc8bf..7e6e0da 100644
 --- a/unix/tcl.m4
 +++ b/unix/tcl.m4
-@@ -1378,6 +1378,9 @@ AC_DEFUN([SC_CONFIG_CFLAGS], [
+@@ -1269,6 +1269,9 @@ AC_DEFUN([SC_CONFIG_CFLAGS], [
  	    # get rid of the warnings.
  	    #CFLAGS_OPTIMIZE="${CFLAGS_OPTIMIZE} -D__NO_STRING_INLINES -D__NO_MATH_INLINES"
  
@@ -39,3 +40,6 @@ index 0307a06..37c4d67 100644
  	    SHLIB_LD='${CC} ${CFLAGS} ${LDFLAGS} -shared'
  	    DL_OBJS="tclLoadDl.o"
  	    DL_LIBS="-ldl"
+-- 
+2.39.5
+
diff --git a/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch b/meta/recipes-devtools/tcltk/tcl/0002-tcl-fix-a-build-issue.patch
similarity index 71%
rename from meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch
rename to meta/recipes-devtools/tcltk/tcl/0002-tcl-fix-a-build-issue.patch
index fac7ed7e281..53cfd8927db 100644
--- a/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch
+++ b/meta/recipes-devtools/tcltk/tcl/0002-tcl-fix-a-build-issue.patch
@@ -1,18 +1,18 @@
-From bd512547fc002fdb20808bf5b8b9feeb848b6512 Mon Sep 17 00:00:00 2001
+From 61ef40f2bc418ce072828ad1939eaa40f981e76e Mon Sep 17 00:00:00 2001
 From: Nitin A Kamble <nitin.a.kamble@intel.com>
 Date: Fri, 13 Aug 2010 12:24:00 -0700
-Subject: [PATCH] tcl: fix a build issue
+Subject: [PATCH 2/5] tcl: fix a build issue
 
 Upstream-Status: Inappropriate [upstream does not support installed tests]
 ---
- unix/Makefile.in | 20 ++++++++++----------
- 1 file changed, 10 insertions(+), 10 deletions(-)
+ unix/Makefile.in | 19 +++++++++----------
+ 1 file changed, 9 insertions(+), 10 deletions(-)
 
 diff --git a/unix/Makefile.in b/unix/Makefile.in
-index 965f6da..a0bd63f 100644
+index 6e74458..bd0b818 100644
 --- a/unix/Makefile.in
 +++ b/unix/Makefile.in
-@@ -723,7 +723,7 @@ tcltest-real:
+@@ -918,7 +918,7 @@ tcltest-real:
  test: test-tcl test-packages
  
  test-tcl: ${TCLTEST_EXE}
@@ -20,15 +20,12 @@ index 965f6da..a0bd63f 100644
 +	$(SHELL_ENV) ${TCLTEST_EXE} $(TOP_DIR)/tests/all.tcl $(TESTFLAGS)
  
  gdb-test: ${TCLTEST_EXE}
- 	@printf '%s ' set env @LD_LIBRARY_PATH_VAR@=\"`pwd`$${@LD_LIBRARY_PATH_VAR@:+:$${@LD_LIBRARY_PATH_VAR}}\" > gdb.run
-@@ -732,17 +732,17 @@ gdb-test: ${TCLTEST_EXE}
- 	@printf '\n' >>gdb.run
- 	@printf '%s ' set args $(call shquotequote,$(TOP_DIR))/tests/all.tcl\
- 		$(call shquotequote,$(TESTFLAGS)) -singleproc 1 >> gdb.run
--	$(GDB) ./${TCLTEST_EXE} --command=gdb.run
-+	$(GDB) ${TCLTEST_EXE} --command=gdb.run
- 	rm gdb.run
+ 	$(SHELL_ENV) $(GDB) --args ./${TCLTEST_EXE} $(TOP_DIR)/tests/all.tcl \
+@@ -928,15 +928,14 @@ lldb-test: ${TCLTEST_EXE}
+ 	$(SHELL_ENV) $(LLDB) -- ./${TCLTEST_EXE} $(TOP_DIR)/tests/all.tcl \
+ 		$(TESTFLAGS) -singleproc 1
  
+-
  # Useful target to launch a built tcltest with the proper path,...
  runtest: ${TCLTEST_EXE}
 -	$(SHELL_ENV) ./${TCLTEST_EXE}
@@ -37,12 +34,12 @@ index 965f6da..a0bd63f 100644
  # Useful target for running the test suite with an unwritable current
  # directory...
  ro-test: ${TCLTEST_EXE}
--	echo 'exec chmod -w .;package require tcltest;tcltest::temporaryDirectory /tmp;source -encoding utf-8 ../tests/all.tcl;exec chmod +w .' | $(SHELL_ENV) ./${TCLTEST_EXE}
-+	echo 'exec chmod -w .;package require tcltest;tcltest::temporaryDirectory /tmp;source -encoding utf-8 ../tests/all.tcl;exec chmod +w .' | $(SHELL_ENV) ${TCLTEST_EXE}
+-	echo 'exec chmod -w .;package require tcltest;tcltest::temporaryDirectory /tmp;source ../tests/all.tcl;exec chmod +w .' | $(SHELL_ENV) ./${TCLTEST_EXE}
++	echo 'exec chmod -w .;package require tcltest;tcltest::temporaryDirectory /tmp;source ../tests/all.tcl;exec chmod +w .' | $(SHELL_ENV) ${TCLTEST_EXE}
  
  # The following target generates the shared libraries in dltest/ that are used
  # for testing; they are included as part of the "tcltest" target (via the
-@@ -760,28 +760,28 @@ dltest.marker: ${STUB_LIB_FILE}
+@@ -954,17 +953,17 @@ dltest.marker: ${STUB_LIB_FILE}
  # This target can be used to run tclsh from the build directory
  # via `make shell SCRIPT=/tmp/foo.tcl`
  shell: ${TCL_EXE}
@@ -63,6 +60,9 @@ index 965f6da..a0bd63f 100644
  		$(TOP_DIR)/tests/all.tcl -singleproc 1 -constraints valgrind \
  		$(TESTFLAGS)
  
+@@ -990,13 +989,13 @@ valgrind_each: $(addprefix testresults/valgrind/,$(addsuffix .success,$(notdir\
+ 
+ 
  valgrindshell: ${TCL_EXE}
 -	$(SHELL_ENV) $(VALGRIND) $(VALGRINDARGS) ./${TCL_EXE} $(SCRIPT)
 +	$(SHELL_ENV) $(VALGRIND) $(VALGRINDARGS) ${TCL_EXE} $(SCRIPT)
@@ -77,3 +77,6 @@ index 965f6da..a0bd63f 100644
  
  #--------------------------------------------------------------------------
  # Installation rules
+-- 
+2.39.5
+
diff --git a/meta/recipes-devtools/tcltk/tcl/tcl-remove-hardcoded-install-path.patch b/meta/recipes-devtools/tcltk/tcl/0003-tcl-install-tcl-to-lib64-instead-of-lib-on-64bit-tar.patch
similarity index 63%
rename from meta/recipes-devtools/tcltk/tcl/tcl-remove-hardcoded-install-path.patch
rename to meta/recipes-devtools/tcltk/tcl/0003-tcl-install-tcl-to-lib64-instead-of-lib-on-64bit-tar.patch
index 93e7877256b..fb534044988 100644
--- a/meta/recipes-devtools/tcltk/tcl/tcl-remove-hardcoded-install-path.patch
+++ b/meta/recipes-devtools/tcltk/tcl/0003-tcl-install-tcl-to-lib64-instead-of-lib-on-64bit-tar.patch
@@ -1,7 +1,7 @@
-From 050fc597fbfa4da2c31bd0df58c871892a490470 Mon Sep 17 00:00:00 2001
+From 8af08b6f1e566af239e36864823a96c2c283e4ea Mon Sep 17 00:00:00 2001
 From: "Song.Li" <Song.Li@windriver.com>
 Date: Wed, 1 Aug 2012 19:05:51 +0800
-Subject: [PATCH] tcl:install tcl to lib64 instead of lib on 64bit target
+Subject: [PATCH 3/5] tcl:install tcl to lib64 instead of lib on 64bit target
 
 Remove hardcoded library install path. Change $(prefix)/lib/ to ${libdir}.
 
@@ -13,14 +13,14 @@ Signed-off-by: Song.Li <Song.Li@windriver.com>
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 ---
- unix/configure.in | 2 +-
+ unix/configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/unix/configure.in b/unix/configure.in
-index 4f62510..4974fb6 100644
---- a/unix/configure.in
-+++ b/unix/configure.in
-@@ -775,7 +775,7 @@ eval "TCL_LIB_FILE=libtcl${LIB_SUFFIX}"
+diff --git a/unix/configure.ac b/unix/configure.ac
+index 461b394..b6d2506 100644
+--- a/unix/configure.ac
++++ b/unix/configure.ac
+@@ -753,7 +753,7 @@ eval "TCL_LIB_FILE=libtcl${LIB_SUFFIX}"
  
  eval "TCL_LIB_FILE=${TCL_LIB_FILE}"
  
@@ -29,3 +29,6 @@ index 4f62510..4974fb6 100644
  PRIVATE_INCLUDE_DIR='$(includedir)'
  HTML_DIR='$(DISTDIR)/html'
  
+-- 
+2.39.5
+
diff --git a/meta/recipes-devtools/tcltk/tcl/alter-includedir.patch b/meta/recipes-devtools/tcltk/tcl/0004-tcl-update-the-header-location.patch
similarity index 80%
rename from meta/recipes-devtools/tcltk/tcl/alter-includedir.patch
rename to meta/recipes-devtools/tcltk/tcl/0004-tcl-update-the-header-location.patch
index bfc718cfd3c..7953dcecff1 100644
--- a/meta/recipes-devtools/tcltk/tcl/alter-includedir.patch
+++ b/meta/recipes-devtools/tcltk/tcl/0004-tcl-update-the-header-location.patch
@@ -1,7 +1,7 @@
-From 3130dca60636dc12d0d12df75b002fd123349e21 Mon Sep 17 00:00:00 2001
+From 20870e9cd4f5a211fe94f484f707269ee1abd947 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Tue, 22 Nov 2022 18:48:27 +0800
-Subject: [PATCH] tcl: update the header location
+Subject: [PATCH 4/5] tcl: update the header location
 
 Lets install the include header and private header files into
 usr/include/tcl8.6 when version of tcl is 8.6.x
@@ -21,16 +21,16 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 ---
  unix/Makefile.in  | 2 +-
- unix/configure.in | 4 ++--
+ unix/configure.ac | 4 ++--
  unix/tcl.pc.in    | 2 +-
  3 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/unix/Makefile.in b/unix/Makefile.in
-index a3b7d69..969ddb8 100644
+index bd0b818..ddf2b67 100644
 --- a/unix/Makefile.in
 +++ b/unix/Makefile.in
 @@ -57,7 +57,7 @@ SCRIPT_INSTALL_DIR	= $(INSTALL_ROOT)$(TCL_LIBRARY)
- MODULE_INSTALL_DIR	= $(SCRIPT_INSTALL_DIR)/../tcl8
+ MODULE_INSTALL_DIR	= $(SCRIPT_INSTALL_DIR)/../tcl9
  
  # Directory in which to install the include file tcl.h:
 -INCLUDE_INSTALL_DIR	= $(INSTALL_ROOT)$(includedir)
@@ -38,11 +38,11 @@ index a3b7d69..969ddb8 100644
  
  # Path to the private tcl header dir:
  PRIVATE_INCLUDE_DIR	= @PRIVATE_INCLUDE_DIR@
-diff --git a/unix/configure.in b/unix/configure.in
-index 4974fb6..a72934f 100644
---- a/unix/configure.in
-+++ b/unix/configure.in
-@@ -776,7 +776,7 @@ eval "TCL_LIB_FILE=libtcl${LIB_SUFFIX}"
+diff --git a/unix/configure.ac b/unix/configure.ac
+index b6d2506..72a8b0d 100644
+--- a/unix/configure.ac
++++ b/unix/configure.ac
+@@ -754,7 +754,7 @@ eval "TCL_LIB_FILE=libtcl${LIB_SUFFIX}"
  eval "TCL_LIB_FILE=${TCL_LIB_FILE}"
  
  test -z "$TCL_LIBRARY" && TCL_LIBRARY='$(libdir)/tcl$(VERSION)'
@@ -51,7 +51,7 @@ index 4974fb6..a72934f 100644
  HTML_DIR='$(DISTDIR)/html'
  
  # Note:  in the following variable, it's important to use the absolute
-@@ -897,7 +897,7 @@ TCL_BUILD_STUB_LIB_PATH="`pwd`/${TCL_STUB_LIB_FILE}"
+@@ -921,7 +921,7 @@ TCL_BUILD_STUB_LIB_PATH="`pwd`/${TCL_STUB_LIB_FILE}"
  TCL_STUB_LIB_PATH="${TCL_STUB_LIB_DIR}/${TCL_STUB_LIB_FILE}"
  
  # Install time header dir can be set via --includedir
@@ -61,7 +61,7 @@ index 4974fb6..a72934f 100644
  #------------------------------------------------------------------------
  # tclConfig.sh refers to this by a different name
 diff --git a/unix/tcl.pc.in b/unix/tcl.pc.in
-index 93b5e69..dcd51d7 100644
+index 9c6da82..8aa5ae8 100644
 --- a/unix/tcl.pc.in
 +++ b/unix/tcl.pc.in
 @@ -3,7 +3,7 @@
@@ -73,3 +73,6 @@ index 93b5e69..dcd51d7 100644
  libfile=@TCL_LIB_FILE@
  
  Name: Tool Command Language
+-- 
+2.39.5
+
diff --git a/meta/recipes-devtools/tcltk/tcl/interp.patch b/meta/recipes-devtools/tcltk/tcl/0005-tcl-fix-race-in-interp.test.patch
similarity index 82%
rename from meta/recipes-devtools/tcltk/tcl/interp.patch
rename to meta/recipes-devtools/tcltk/tcl/0005-tcl-fix-race-in-interp.test.patch
index 2e0dc94cff1..dfb0b63a0e0 100644
--- a/meta/recipes-devtools/tcltk/tcl/interp.patch
+++ b/meta/recipes-devtools/tcltk/tcl/0005-tcl-fix-race-in-interp.test.patch
@@ -1,7 +1,7 @@
-From 426aa2ff62dda77fd011e8f630b9d4ea17984817 Mon Sep 17 00:00:00 2001
+From 8a96171a33c886d1d9aab40e40f8aae2f621ca08 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Mon, 12 Jul 2021 14:50:13 +0100
-Subject: [PATCH] tcl: fix race in interp.test
+Subject: [PATCH 5/5] tcl: fix race in interp.test
 
 The interp-36.7 patch has race conditions and is missing cleanup.  This patch by
 a Tcl maintainer should improve matters.
@@ -13,10 +13,10 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 4 insertions(+), 3 deletions(-)
 
 diff --git a/tests/interp.test b/tests/interp.test
-index d742484..fc90990 100644
+index 30dc659..e7cd0ee 100644
 --- a/tests/interp.test
 +++ b/tests/interp.test
-@@ -3595,17 +3595,18 @@ test interp-36.7 {ChildBgerror sets error handler of child [1999035]} -setup {
+@@ -3614,17 +3614,18 @@ test interp-36.7 {ChildBgerror sets error handler of child [1999035]} -setup {
          variable result
          set result [lindex $args 0]
      }
@@ -38,3 +38,6 @@ index d742484..fc90990 100644
      interp delete child
  } -result foo
  
+-- 
+2.39.5
+
diff --git a/meta/recipes-devtools/tcltk/tcl/run-ptest b/meta/recipes-devtools/tcltk/tcl/run-ptest
index c485e535c71..8a9f611b0f7 100644
--- a/meta/recipes-devtools/tcltk/tcl/run-ptest
+++ b/meta/recipes-devtools/tcltk/tcl/run-ptest
@@ -1,9 +1,8 @@
 #!/bin/sh
 
-# clock.test needs a timezone to be set
-export TZ="Europe/London"
-export TCL_LIBRARY=library
+export TCL_LIBRARY=/usr/lib/tcl/ptest/library
 export ERROR_ON_FAILURES=1
+export LANG=en-US.UTF-8
 
 # Some tests are overly strict with timings and fail on loaded systems.
 SKIP=""
@@ -19,6 +18,8 @@ SKIP="$SKIP \*io-46.1"
 SKIP="$SKIP io-13.6"
 # 14825
 SKIP="$SKIP socket-\* socket_inet-\*"
+# tries to access google.com
+SKIP="$SKIP httpProxy-\*"
 
 for i in tests/*.test; do
     i=$(basename $i)
diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.15.bb b/meta/recipes-devtools/tcltk/tcl_9.0.0.bb
similarity index 81%
rename from meta/recipes-devtools/tcltk/tcl_8.6.15.bb
rename to meta/recipes-devtools/tcltk/tcl_9.0.0.bb
index 340854056eb..a6e1dfbb5be 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.15.bb
+++ b/meta/recipes-devtools/tcltk/tcl_9.0.0.bb
@@ -15,18 +15,15 @@ LIC_FILES_CHKSUM = "file://license.terms;md5=058f6229798281bbcac4239c788cfa38 \
 
 DEPENDS = "tcl-native zlib"
 
-BASE_SRC_URI = "${SOURCEFORGE_MIRROR}/tcl/tcl-core${PV}-src.tar.gz \
-                file://tcl-add-soname.patch"
-SRC_URI = "${BASE_SRC_URI} \
-           file://fix_non_native_build_issue.patch \
-           file://tcl-remove-hardcoded-install-path.patch \
-           file://alter-includedir.patch \
-           file://interp.patch \
+SRC_URI = "${SOURCEFORGE_MIRROR}/tcl/tcl-core${PV}-src.tar.gz \
            file://run-ptest \
+           file://0001-tcl-Add-tcltk-from-OE.dev-but-with-legacy-staging-fu.patch \
+           file://0002-tcl-fix-a-build-issue.patch \
+           file://0003-tcl-install-tcl-to-lib64-instead-of-lib-on-64bit-tar.patch \
+           file://0004-tcl-update-the-header-location.patch \
+           file://0005-tcl-fix-race-in-interp.test.patch \
            "
-SRC_URI[sha256sum] = "844775491e435e34d83d6ccfbadd1342f1855f1705253233a86152df0765e78d"
-
-SRC_URI:class-native = "${BASE_SRC_URI}"
+SRC_URI[sha256sum] = "3186e23c7417359d90e3c46f531d442c76d3c05a2dba1081c02b75e32908b2b7"
 
 UPSTREAM_CHECK_URI = "https://www.tcl.tk/software/tcltk/download.html"
 UPSTREAM_CHECK_REGEX = "tcl(?P<pver>\d+(\.\d+)+)-src"
@@ -38,7 +35,7 @@ VER = "${PV}"
 inherit autotools ptest binconfig
 
 AUTOTOOLS_SCRIPT_PATH = "${S}/unix"
-EXTRA_OECONF = "--enable-threads --disable-rpath --enable-man-suffix"
+EXTRA_OECONF = "--disable-rpath --enable-man-suffix"
 
 # Prevent installing copy of tzdata based on tzdata installation on the build host
 # It doesn't install tzdata if one of the following files exist on the host:
@@ -50,7 +47,7 @@ do_install() {
 	autotools_do_install
 	oe_runmake 'DESTDIR=${D}' install-private-headers
 	ln -sf ./tclsh${VER} ${D}${bindir}/tclsh
-	ln -sf tclsh8.6 ${D}${bindir}/tclsh${VER}
+	ln -sf tclsh9.0 ${D}${bindir}/tclsh${VER}
 	sed -i "s;-L${B};-L${STAGING_LIBDIR};g" tclConfig.sh
 	sed -i "s;'${WORKDIR};'${STAGING_INCDIR};g" tclConfig.sh
 	install -d ${D}${bindir_crossscripts}
@@ -65,13 +62,13 @@ do_install() {
 SYSROOT_DIRS += "${bindir_crossscripts}"
 
 PACKAGES =+ "tcl-lib"
-FILES:tcl-lib = "${libdir}/libtcl8.6.so.*"
-FILES:${PN} += "${libdir}/tcl${VER} ${libdir}/tcl8.6 ${libdir}/tcl8"
+FILES:tcl-lib = "${libdir}/libtcl9.0.so.*"
+FILES:${PN} += "${libdir}/tcl${VER} ${libdir}/tcl9.0 ${libdir}/tcl9"
 FILES:${PN}-dev += "${libdir}/tclConfig.sh ${libdir}/tclooConfig.sh"
 
 # isn't getting picked up by shlibs code
 RDEPENDS:${PN} += "tcl-lib"
-RDEPENDS:${PN}-ptest += "libgcc"
+RDEPENDS:${PN}-ptest += "libgcc locale-base-en-us tzdata"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.39.5


