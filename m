Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACFAFE7719D
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 08:42:39 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.14678.1736325755177956302
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 00:42:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FR2lt5VH;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d3f65844deso27961313a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 00:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736325753; x=1736930553; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sju3WWOp+S7J+Pdv65i+Apfd9yHMCRYv/cv5TOAysZk=;
        b=FR2lt5VH8QsVAVcPfAWs5ThR8M/jCxqHTPvNIP+Xx+TBxuK0J9KrKR+drb4m4bcAWC
         DrOeJngYNHPVhi8B+ek9mTJvmq+JIX+322Xh0WA9gsNG+UH6Lj2z6mm6FiW+oxalarmj
         6gDMao62EBmDNvAKJ4AzGIyaXL4eJDDPPgB2m8RC3c7nlrLRZbIKqQC608A+DsUCGtKK
         Au6BOZO0hVVqCeMJWNeCoC27s0E8mabyeHz7PJajrbYUuxqzOh3k1ZAnsHqn5vYQAa3t
         SGF9q/suAjmK9XTK5PkjIYszad/zYxXh/YjiJCOj1+Xir+ujtBfhIC3JUtwMFL/J1mnS
         GMIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736325753; x=1736930553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sju3WWOp+S7J+Pdv65i+Apfd9yHMCRYv/cv5TOAysZk=;
        b=SfRTXMbXCO1bK5zOa2sdX9jGK58PNcVJWtpi1tr+5SvDwI9OOa7aPb90dQ9tJt7/JS
         ppDeDDiDKglguiRHwS0DfW1ffGOOUdDJMJT4fDiFbnJQnabnbJpIj+67ZnAC7HHvxhsd
         15kUxhbLxG1ZWK8DoKO8oALkjDr9h1xPGCFnYVWZ+P+nGC9ZaMr957Qs0ptTzDq/znT4
         k4jSIKBZ6UVjSHhti/JORYt9D6bE2+tTINVunZtqNWhuK9TrfZ4eD1KlbrOgo9ViCvgX
         12ffJY48OOhrQ2FY53snSrGdE7dluhbUHTwIEXdJ8PBHTkzRFvK1ognj6/HSxGeR1NOu
         +jMQ==
X-Gm-Message-State: AOJu0Ywkw9WnvZpOcC+1zp6CDufB6Iy2vx97pcSy2ljIrON9+sM5d0UY
	m2/ur3o50w4Rn41o/0tplIZsVN7I++8jlDYJysR5W2SK1WdzkcLgH1SZiw==
X-Gm-Gg: ASbGncui/fZZ20F+9I4PW20mj3NN0DmuAtoGqWYRPLwlCCtY1TGvD1ToZLDf2+e/NKs
	B1CcjGI8UBdw00lderkrRL/SBgERplreTf0vP6Ht0lJB2CpR3N/0iCppPkxJCqaokOrVw8gBQ7a
	KMGLNEfGPNg6+JcNuF3amP1RbiSogfErcuA0cbtZUYxm2AqIw5o2uly3PQ/ELas1GIHaZy6Lzk1
	9HHVGGgmPQrDbhYTTXIhbStSQ6qDFnrxB7kI3H0vmvSEqv8eRRTz4m95gWInzmdCyk0UsrfsC1b
	cRa01Ln9UlALUpGs5A==
X-Google-Smtp-Source: AGHT+IEbd0Anl41xJ+DWdL/MpRiop3K3120xg8+q+txOm4xZXVn7PiuDgA8+/n0CiorbWE4ikp0dVg==
X-Received: by 2002:a17:907:9490:b0:aa6:6885:e2f0 with SMTP id a640c23a62f3a-ab2abc78dd7mr171222366b.46.1736325753174;
        Wed, 08 Jan 2025 00:42:33 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f06c7c2sm2499661766b.188.2025.01.08.00.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 00:42:32 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/20] tcl: update 9.0.0 -> 9.0.1
Date: Wed,  8 Jan 2025 09:42:11 +0100
Message-Id: <20250108084226.117178-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250108084226.117178-1-alex.kanavin@gmail.com>
References: <20250108084226.117178-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 08:42:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209527

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...om-OE.dev-but-with-legacy-staging-fu.patch | 14 +++++--------
 .../tcl/0002-tcl-fix-a-build-issue.patch      | 17 +++++++--------
 ...to-lib64-instead-of-lib-on-64bit-tar.patch | 11 ++++------
 .../0004-tcl-update-the-header-location.patch | 15 ++++++-------
 .../0005-tcl-fix-race-in-interp.test.patch    | 21 ++++++++-----------
 .../tcltk/{tcl_9.0.0.bb => tcl_9.0.1.bb}      |  2 +-
 6 files changed, 32 insertions(+), 48 deletions(-)
 rename meta/recipes-devtools/tcltk/{tcl_9.0.0.bb => tcl_9.0.1.bb} (97%)

diff --git a/meta/recipes-devtools/tcltk/tcl/0001-tcl-Add-tcltk-from-OE.dev-but-with-legacy-staging-fu.patch b/meta/recipes-devtools/tcltk/tcl/0001-tcl-Add-tcltk-from-OE.dev-but-with-legacy-staging-fu.patch
index 9472591a55f..343209ececc 100644
--- a/meta/recipes-devtools/tcltk/tcl/0001-tcl-Add-tcltk-from-OE.dev-but-with-legacy-staging-fu.patch
+++ b/meta/recipes-devtools/tcltk/tcl/0001-tcl-Add-tcltk-from-OE.dev-but-with-legacy-staging-fu.patch
@@ -1,8 +1,7 @@
-From f69a01c5932af2d5ece6141e4424b14a2d645fd7 Mon Sep 17 00:00:00 2001
+From 822a73a5dec13549cb20e6c7338b059ece2ea95a Mon Sep 17 00:00:00 2001
 From: Richard Purdie <rpurdie@linux.intel.com>
 Date: Wed, 9 Dec 2009 23:59:44 +0000
-Subject: [PATCH 1/5] tcl: Add tcltk from OE.dev but with legacy staging
- function
+Subject: [PATCH] tcl: Add tcltk from OE.dev but with legacy staging function
 
 Upstream-Status: Pending
 ---
@@ -11,10 +10,10 @@ Upstream-Status: Pending
  2 files changed, 7 insertions(+), 1 deletion(-)
 
 diff --git a/unix/Makefile.in b/unix/Makefile.in
-index 0ff1258..6e74458 100644
+index b72b0da..2de7b2f 100644
 --- a/unix/Makefile.in
 +++ b/unix/Makefile.in
-@@ -1027,7 +1027,10 @@ install-binaries: binaries
+@@ -1021,7 +1021,10 @@ install-binaries: binaries
  	done
  	@echo "Installing $(LIB_FILE) to $(DLL_INSTALL_DIR)/"
  	@@INSTALL_LIB@
@@ -27,7 +26,7 @@ index 0ff1258..6e74458 100644
  	@$(INSTALL_PROGRAM) ${TCL_EXE} "$(BIN_INSTALL_DIR)/tclsh$(VERSION)${EXE_SUFFIX}"
  	@echo "Installing tclConfig.sh to $(CONFIG_INSTALL_DIR)/"
 diff --git a/unix/tcl.m4 b/unix/tcl.m4
-index 99bc8bf..7e6e0da 100644
+index 4265832..49ad5ab 100644
 --- a/unix/tcl.m4
 +++ b/unix/tcl.m4
 @@ -1269,6 +1269,9 @@ AC_DEFUN([SC_CONFIG_CFLAGS], [
@@ -40,6 +39,3 @@ index 99bc8bf..7e6e0da 100644
  	    SHLIB_LD='${CC} ${CFLAGS} ${LDFLAGS} -shared'
  	    DL_OBJS="tclLoadDl.o"
  	    DL_LIBS="-ldl"
--- 
-2.39.5
-
diff --git a/meta/recipes-devtools/tcltk/tcl/0002-tcl-fix-a-build-issue.patch b/meta/recipes-devtools/tcltk/tcl/0002-tcl-fix-a-build-issue.patch
index 53cfd8927db..a2d56225285 100644
--- a/meta/recipes-devtools/tcltk/tcl/0002-tcl-fix-a-build-issue.patch
+++ b/meta/recipes-devtools/tcltk/tcl/0002-tcl-fix-a-build-issue.patch
@@ -1,7 +1,7 @@
-From 61ef40f2bc418ce072828ad1939eaa40f981e76e Mon Sep 17 00:00:00 2001
+From 363d9d8fb329b26d1e59ece7f269a7a28e6722c5 Mon Sep 17 00:00:00 2001
 From: Nitin A Kamble <nitin.a.kamble@intel.com>
 Date: Fri, 13 Aug 2010 12:24:00 -0700
-Subject: [PATCH 2/5] tcl: fix a build issue
+Subject: [PATCH] tcl: fix a build issue
 
 Upstream-Status: Inappropriate [upstream does not support installed tests]
 ---
@@ -9,10 +9,10 @@ Upstream-Status: Inappropriate [upstream does not support installed tests]
  1 file changed, 9 insertions(+), 10 deletions(-)
 
 diff --git a/unix/Makefile.in b/unix/Makefile.in
-index 6e74458..bd0b818 100644
+index 2de7b2f..b5f9ab7 100644
 --- a/unix/Makefile.in
 +++ b/unix/Makefile.in
-@@ -918,7 +918,7 @@ tcltest-real:
+@@ -912,7 +912,7 @@ tcltest-real:
  test: test-tcl test-packages
  
  test-tcl: ${TCLTEST_EXE}
@@ -21,7 +21,7 @@ index 6e74458..bd0b818 100644
  
  gdb-test: ${TCLTEST_EXE}
  	$(SHELL_ENV) $(GDB) --args ./${TCLTEST_EXE} $(TOP_DIR)/tests/all.tcl \
-@@ -928,15 +928,14 @@ lldb-test: ${TCLTEST_EXE}
+@@ -922,15 +922,14 @@ lldb-test: ${TCLTEST_EXE}
  	$(SHELL_ENV) $(LLDB) -- ./${TCLTEST_EXE} $(TOP_DIR)/tests/all.tcl \
  		$(TESTFLAGS) -singleproc 1
  
@@ -39,7 +39,7 @@ index 6e74458..bd0b818 100644
  
  # The following target generates the shared libraries in dltest/ that are used
  # for testing; they are included as part of the "tcltest" target (via the
-@@ -954,17 +953,17 @@ dltest.marker: ${STUB_LIB_FILE}
+@@ -948,17 +947,17 @@ dltest.marker: ${STUB_LIB_FILE}
  # This target can be used to run tclsh from the build directory
  # via `make shell SCRIPT=/tmp/foo.tcl`
  shell: ${TCL_EXE}
@@ -60,7 +60,7 @@ index 6e74458..bd0b818 100644
  		$(TOP_DIR)/tests/all.tcl -singleproc 1 -constraints valgrind \
  		$(TESTFLAGS)
  
-@@ -990,13 +989,13 @@ valgrind_each: $(addprefix testresults/valgrind/,$(addsuffix .success,$(notdir\
+@@ -984,13 +983,13 @@ valgrind_each: $(addprefix testresults/valgrind/,$(addsuffix .success,$(notdir\
  
  
  valgrindshell: ${TCL_EXE}
@@ -77,6 +77,3 @@ index 6e74458..bd0b818 100644
  
  #--------------------------------------------------------------------------
  # Installation rules
--- 
-2.39.5
-
diff --git a/meta/recipes-devtools/tcltk/tcl/0003-tcl-install-tcl-to-lib64-instead-of-lib-on-64bit-tar.patch b/meta/recipes-devtools/tcltk/tcl/0003-tcl-install-tcl-to-lib64-instead-of-lib-on-64bit-tar.patch
index fb534044988..8a425637c6e 100644
--- a/meta/recipes-devtools/tcltk/tcl/0003-tcl-install-tcl-to-lib64-instead-of-lib-on-64bit-tar.patch
+++ b/meta/recipes-devtools/tcltk/tcl/0003-tcl-install-tcl-to-lib64-instead-of-lib-on-64bit-tar.patch
@@ -1,7 +1,7 @@
-From 8af08b6f1e566af239e36864823a96c2c283e4ea Mon Sep 17 00:00:00 2001
+From 964b9649f8d044d38fdc8c4201075692e5f537a0 Mon Sep 17 00:00:00 2001
 From: "Song.Li" <Song.Li@windriver.com>
 Date: Wed, 1 Aug 2012 19:05:51 +0800
-Subject: [PATCH 3/5] tcl:install tcl to lib64 instead of lib on 64bit target
+Subject: [PATCH] tcl:install tcl to lib64 instead of lib on 64bit target
 
 Remove hardcoded library install path. Change $(prefix)/lib/ to ${libdir}.
 
@@ -17,10 +17,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/unix/configure.ac b/unix/configure.ac
-index 461b394..b6d2506 100644
+index 7f012d4..43ec7e4 100644
 --- a/unix/configure.ac
 +++ b/unix/configure.ac
-@@ -753,7 +753,7 @@ eval "TCL_LIB_FILE=libtcl${LIB_SUFFIX}"
+@@ -725,7 +725,7 @@ eval "TCL_LIB_FILE=libtcl${LIB_SUFFIX}"
  
  eval "TCL_LIB_FILE=${TCL_LIB_FILE}"
  
@@ -29,6 +29,3 @@ index 461b394..b6d2506 100644
  PRIVATE_INCLUDE_DIR='$(includedir)'
  HTML_DIR='$(DISTDIR)/html'
  
--- 
-2.39.5
-
diff --git a/meta/recipes-devtools/tcltk/tcl/0004-tcl-update-the-header-location.patch b/meta/recipes-devtools/tcltk/tcl/0004-tcl-update-the-header-location.patch
index 7953dcecff1..50a4a272564 100644
--- a/meta/recipes-devtools/tcltk/tcl/0004-tcl-update-the-header-location.patch
+++ b/meta/recipes-devtools/tcltk/tcl/0004-tcl-update-the-header-location.patch
@@ -1,7 +1,7 @@
-From 20870e9cd4f5a211fe94f484f707269ee1abd947 Mon Sep 17 00:00:00 2001
+From d2fa5a1efa5e4f07b294660c2513766c168137ce Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Tue, 22 Nov 2022 18:48:27 +0800
-Subject: [PATCH 4/5] tcl: update the header location
+Subject: [PATCH] tcl: update the header location
 
 Lets install the include header and private header files into
 usr/include/tcl8.6 when version of tcl is 8.6.x
@@ -26,7 +26,7 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  3 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/unix/Makefile.in b/unix/Makefile.in
-index bd0b818..ddf2b67 100644
+index b5f9ab7..fbc87a2 100644
 --- a/unix/Makefile.in
 +++ b/unix/Makefile.in
 @@ -57,7 +57,7 @@ SCRIPT_INSTALL_DIR	= $(INSTALL_ROOT)$(TCL_LIBRARY)
@@ -39,10 +39,10 @@ index bd0b818..ddf2b67 100644
  # Path to the private tcl header dir:
  PRIVATE_INCLUDE_DIR	= @PRIVATE_INCLUDE_DIR@
 diff --git a/unix/configure.ac b/unix/configure.ac
-index b6d2506..72a8b0d 100644
+index 43ec7e4..19524d1 100644
 --- a/unix/configure.ac
 +++ b/unix/configure.ac
-@@ -754,7 +754,7 @@ eval "TCL_LIB_FILE=libtcl${LIB_SUFFIX}"
+@@ -726,7 +726,7 @@ eval "TCL_LIB_FILE=libtcl${LIB_SUFFIX}"
  eval "TCL_LIB_FILE=${TCL_LIB_FILE}"
  
  test -z "$TCL_LIBRARY" && TCL_LIBRARY='$(libdir)/tcl$(VERSION)'
@@ -51,7 +51,7 @@ index b6d2506..72a8b0d 100644
  HTML_DIR='$(DISTDIR)/html'
  
  # Note:  in the following variable, it's important to use the absolute
-@@ -921,7 +921,7 @@ TCL_BUILD_STUB_LIB_PATH="`pwd`/${TCL_STUB_LIB_FILE}"
+@@ -893,7 +893,7 @@ TCL_BUILD_STUB_LIB_PATH="`pwd`/${TCL_STUB_LIB_FILE}"
  TCL_STUB_LIB_PATH="${TCL_STUB_LIB_DIR}/${TCL_STUB_LIB_FILE}"
  
  # Install time header dir can be set via --includedir
@@ -73,6 +73,3 @@ index 9c6da82..8aa5ae8 100644
  libfile=@TCL_LIB_FILE@
  
  Name: Tool Command Language
--- 
-2.39.5
-
diff --git a/meta/recipes-devtools/tcltk/tcl/0005-tcl-fix-race-in-interp.test.patch b/meta/recipes-devtools/tcltk/tcl/0005-tcl-fix-race-in-interp.test.patch
index dfb0b63a0e0..07912da5b38 100644
--- a/meta/recipes-devtools/tcltk/tcl/0005-tcl-fix-race-in-interp.test.patch
+++ b/meta/recipes-devtools/tcltk/tcl/0005-tcl-fix-race-in-interp.test.patch
@@ -1,7 +1,7 @@
-From 8a96171a33c886d1d9aab40e40f8aae2f621ca08 Mon Sep 17 00:00:00 2001
+From fd75e3613613726786c54a25ee611c5176b33510 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Mon, 12 Jul 2021 14:50:13 +0100
-Subject: [PATCH 5/5] tcl: fix race in interp.test
+Subject: [PATCH] tcl: fix race in interp.test
 
 The interp-36.7 patch has race conditions and is missing cleanup.  This patch by
 a Tcl maintainer should improve matters.
@@ -13,20 +13,20 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 4 insertions(+), 3 deletions(-)
 
 diff --git a/tests/interp.test b/tests/interp.test
-index 30dc659..e7cd0ee 100644
+index 0092a03..eecfd3b 100644
 --- a/tests/interp.test
 +++ b/tests/interp.test
 @@ -3614,17 +3614,18 @@ test interp-36.7 {ChildBgerror sets error handler of child [1999035]} -setup {
-         variable result
-         set result [lindex $args 0]
+ 	variable result
+ 	set result [lindex $args 0]
      }
 +    set tout [after 5000 {set result timeout}]
  } -body {
      child eval {
-         variable done {}
-         after 0 error foo
--        after 10 [list ::set [namespace which -variable done] {}]
--        vwait [namespace which -variable done]
+ 	variable done {}
+ 	after 0 error foo
+-	after 10 [list ::set [namespace which -variable done] {}]
+-	vwait [namespace which -variable done]
      }
 +    vwait result
      set result
@@ -38,6 +38,3 @@ index 30dc659..e7cd0ee 100644
      interp delete child
  } -result foo
  
--- 
-2.39.5
-
diff --git a/meta/recipes-devtools/tcltk/tcl_9.0.0.bb b/meta/recipes-devtools/tcltk/tcl_9.0.1.bb
similarity index 97%
rename from meta/recipes-devtools/tcltk/tcl_9.0.0.bb
rename to meta/recipes-devtools/tcltk/tcl_9.0.1.bb
index 0d2efa44aab..0ba7288a600 100644
--- a/meta/recipes-devtools/tcltk/tcl_9.0.0.bb
+++ b/meta/recipes-devtools/tcltk/tcl_9.0.1.bb
@@ -23,7 +23,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/tcl/tcl-core${PV}-src.tar.gz \
            file://0004-tcl-update-the-header-location.patch \
            file://0005-tcl-fix-race-in-interp.test.patch \
            "
-SRC_URI[sha256sum] = "3186e23c7417359d90e3c46f531d442c76d3c05a2dba1081c02b75e32908b2b7"
+SRC_URI[sha256sum] = "488fcb6c875a1762e9e8478319b20fbad9a31de475f056aeed94cc54b44cf221"
 
 UPSTREAM_CHECK_URI = "https://www.tcl.tk/software/tcltk/download.html"
 UPSTREAM_CHECK_REGEX = "tcl(?P<pver>\d+(\.\d+)+)-src"
-- 
2.39.5


