Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AB84E68971
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 10:16:06 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.9222.1730369764582016142
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Oct 2024 03:16:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iVDr5M/A;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43159c9f617so5764355e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 03:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730369763; x=1730974563; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pv4W7vb3Iv+keZa7yDjekUoBCzPS/RqpovxpGtxLs44=;
        b=iVDr5M/A1UQqSfH2B5P/v1eB+akF/OoVnAc4nJysw1muooA8HDvKV/A7RL2JGg17w7
         THiCAjMlc7oAuNPSRkLCTtXRXG7uiOs1FJ5nTtRZ8ld1IS4LuBcwPBqI9HzdKzMEQguq
         U+YL0/+IVRRlLFDwZ5FmiBd5fgX/t/FT8INWxBmhXMhiFIpGNJokkI4cLozdFn5B5GPv
         p66zFjlPMem0j0pcboSqiix4Qzl63TNI4uTaBLloVmDryWivsFY3za/zwbD9cicqCZqg
         aAEUgbtWmyzgEHQJmAyjtMMjoBH8dW02PyD67VJ5K6lPOuv6+1S0Cc3Kw/+S8VJPXDb2
         benw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730369763; x=1730974563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pv4W7vb3Iv+keZa7yDjekUoBCzPS/RqpovxpGtxLs44=;
        b=ftUij4851gEudNBUOEE00Jt8ZyeP9WkTdE3vjzfJgZNz+vjCCCGgzkl7qGVkzWFEV4
         VFN24xO7YGBFgDUPBvvQGXnrzJubeluGX+mEu1g3tk53vlTUTaUtXgZdl5kZMW3H9VmL
         ejHILcNTJt4gH1HFzbL3Gs2KsVkDaHp5DrV1iBPdiBaD+rpUhtNwSIT0jdEP4hkdUGfz
         RRWU6C6pKYOpVUQh8o+nxGrrfh5gjtOpFGv3gIHYOb8p9dYWNvSEz6A5lo0qb69kShKK
         bkFJjVDeJJ1VBGdDZ76HLmjrNafG9Dc8avKhaG4rwK9rsCSrAlZ8nJfM+78L/cLhR9JU
         WmHg==
X-Gm-Message-State: AOJu0YyG5eVe2ZbYjzD7ACfUusDFnAAsIA7XalAhAJ48awgH8qhsGyYu
	Uv5SrkHDski9ern6w8EM47ISYuwvHzwWdDAzEvDtteITxdhF+tuSibudRg==
X-Google-Smtp-Source: AGHT+IFqSfNQ3VvkUugAsh3fEKVH0r7xjX0KpWsNwgX9XMTsLJnudplc8JmPTEB0nRJzxEBl2O43zg==
X-Received: by 2002:a05:600c:19c8:b0:430:54a4:5b03 with SMTP id 5b1f17b1804b1-4319ac6fad6mr142712145e9.6.1730369762654;
        Thu, 31 Oct 2024 03:16:02 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10d4d1fsm1664707f8f.38.2024.10.31.03.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 03:16:02 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v3 1/2] tcl: update 8.6.15 -> 9.0.0
Date: Thu, 31 Oct 2024 11:15:55 +0100
Message-Id: <20241031101556.1913400-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 10:16:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206575

From: Alexander Kanavin <alex@linutronix.de>

Make adjustments needed for ptests: among others,
the binary.test needs 4G of RAM.

Apply all patches unconditionally for ease of future upgrades.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/images/core-image-ptest.bb  |  1 +
 ...m-OE.dev-but-with-legacy-staging-fu.patch} | 16 +++++---
 ...patch => 0002-tcl-fix-a-build-issue.patch} | 37 ++++++++++---------
 ...o-lib64-instead-of-lib-on-64bit-tar.patch} | 19 ++++++----
 ...0004-tcl-update-the-header-location.patch} | 27 ++++++++------
 ...=> 0005-tcl-fix-race-in-interp.test.patch} | 11 ++++--
 meta/recipes-devtools/tcltk/tcl/run-ptest     |  7 ++--
 .../tcltk/{tcl_8.6.15.bb => tcl_9.0.0.bb}     | 25 ++++++-------
 8 files changed, 79 insertions(+), 64 deletions(-)
 rename meta/recipes-devtools/tcltk/tcl/{tcl-add-soname.patch => 0001-tcl-Add-tcltk-from-OE.dev-but-with-legacy-staging-fu.patch} (80%)
 rename meta/recipes-devtools/tcltk/tcl/{fix_non_native_build_issue.patch => 0002-tcl-fix-a-build-issue.patch} (71%)
 rename meta/recipes-devtools/tcltk/tcl/{tcl-remove-hardcoded-install-path.patch => 0003-tcl-install-tcl-to-lib64-instead-of-lib-on-64bit-tar.patch} (63%)
 rename meta/recipes-devtools/tcltk/tcl/{alter-includedir.patch => 0004-tcl-update-the-header-location.patch} (80%)
 rename meta/recipes-devtools/tcltk/tcl/{interp.patch => 0005-tcl-fix-race-in-interp.test.patch} (82%)
 rename meta/recipes-devtools/tcltk/{tcl_8.6.15.bb => tcl_9.0.0.bb} (82%)

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
similarity index 82%
rename from meta/recipes-devtools/tcltk/tcl_8.6.15.bb
rename to meta/recipes-devtools/tcltk/tcl_9.0.0.bb
index 340854056eb..b3968b5be14 100644
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


