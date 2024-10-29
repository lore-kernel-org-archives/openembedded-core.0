Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42379D2AB1A
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 10:20:41 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.15820.1730197239333488380
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Oct 2024 03:20:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ohz+Fasl;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4315c1c7392so53037055e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 03:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730197237; x=1730802037; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RSj4z+ZRmz8qX6GOOKUMnW0tG/0Qj4L4ifxWRcbtWFQ=;
        b=Ohz+FaslvHSigua4Fo0qV37HhnvsbrMomek/f7S4sdR7MBTTUpjpHukJzXlkQPzk7o
         6nLMMnIPtRibkW1KAr/e7qiv+dteYSsS/hA0kFPn9b/oquKk6Sfj/ug7s7z5K9fUKB2X
         xabvbw/Ae9Qt23P7fj1RPKfVWUK/oCLGJshHc7K4kWvtTqtp0hH1pPyNYAMYudm3mM1n
         NaOkEbBWl/Q+/JnMiYmhnrQAJ2Oq2vOucocvZ/eLC8Yw/XOobuBGfF74FBfmojNkpD/5
         GZThytyjkapzVqoE+GTwxqXoQ5eVod0MQSrBm3MUO/+A6niLqHqpvPdqb0ojG+rpm5N+
         5Mog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730197237; x=1730802037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RSj4z+ZRmz8qX6GOOKUMnW0tG/0Qj4L4ifxWRcbtWFQ=;
        b=bvsbp5JvdXSha1A8nzjefhq8MFHMoB+k1H9fDZ+uIvh1+LDZdV3xbdBYwLqLGcxPaN
         ug/1P2RAqChejzXUWbqZU2SQ5OE2wKof3ohfd1kTKU44F86zsFxDHkXaOUmi0gYoQrec
         i1RWr/cGre9924g+0E/OmqniZQiw9enQf4TNu04BEx6rO1rzrG3bPXvkb3UwOYZ0TPLW
         sh0ZlW+OXt/e+dQPOyoeeyhVRF4AMFcgoYKoGwhWWYiengm7I0nEtwM17dviDHaRi5Q7
         GkKcWBvYS5e6wBnRy4K/L5yxZWeQNkRudyAQPVc56Z56hwJaIKHdsY/9eBECFC2+8IdV
         nzwQ==
X-Gm-Message-State: AOJu0YzxuajtFShB8natPkWfA7Ckxggfi8xwamZPV7lxPD91XNK3Yz39
	+4d14CLilkZhSdTlPyxImVthmdB6Fh28QWSSmBpmXO5Kc7O7NGGodu7m9Q==
X-Google-Smtp-Source: AGHT+IEiwJBM5cLC5+xCYSyrzWlIg0AbJXlCKo8LDy/yo2Qsdax5y326bnwRmqtv2DUMroVOJngMTA==
X-Received: by 2002:a05:600c:35d2:b0:42e:8d0d:bca5 with SMTP id 5b1f17b1804b1-4319ac6ea1dmr100108645e9.2.1730197236937;
        Tue, 29 Oct 2024 03:20:36 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b55f484sm169614695e9.13.2024.10.29.03.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 03:20:36 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] tcl8: re-add tcl 8 to support building expect
Date: Tue, 29 Oct 2024 11:20:33 +0100
Message-Id: <20241029102033.737934-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241029102033.737934-1-alex.kanavin@gmail.com>
References: <20241029102033.737934-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 10:20:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206490

From: Alexander Kanavin <alex@linutronix.de>

I'd be happy to remove expect from core as it has been unmaintained for years,
but sadly gcc/binutils test suites are basically written in it (via dejagnu),
and ltp makes use of it as well.

I attempted porting expect to tcl 9, but it's a tcl extension and makes
extensive use of features that have been deprecated in tcl 8 and removed
in tcl 9, and even pokes into tcl internals.

At some point hopefully the GNU toolchain upstreams are going to notice;
for now we'll carry tcl (latest) and tcl8 recipes.

tcl and tcl8 packages can be co-installed, the latter is adjusted
to contain tclsh8.

tcl-dev and tcl8-dev packages cannot be co-installed, and tcl
in this situation supersedes tcl8.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
v2: add missing s-o-b to patches
---
 meta/conf/distro/include/maintainers.inc      |   1 +
 .../distro/include/ptest-packagelists.inc     |   1 +
 meta/recipes-devtools/expect/expect/run-ptest |   2 +-
 meta/recipes-devtools/expect/expect_5.45.4.bb |   4 +-
 meta/recipes-devtools/tcltk/tcl_9.0.0.bb      |   4 +
 .../tcltk8/tcl8/alter-includedir.patch        |  75 ++++++++++++
 .../tcl8/fix_non_native_build_issue.patch     |  80 +++++++++++++
 .../recipes-devtools/tcltk8/tcl8/interp.patch |  40 +++++++
 meta/recipes-devtools/tcltk8/tcl8/run-ptest   |  31 +++++
 .../tcltk8/tcl8/tcl-add-soname.patch          |  42 +++++++
 .../tcl-remove-hardcoded-install-path.patch   |  31 +++++
 meta/recipes-devtools/tcltk8/tcl8_8.6.15.bb   | 110 ++++++++++++++++++
 12 files changed, 418 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch
 create mode 100644 meta/recipes-devtools/tcltk8/tcl8/fix_non_native_build_issue.patch
 create mode 100644 meta/recipes-devtools/tcltk8/tcl8/interp.patch
 create mode 100644 meta/recipes-devtools/tcltk8/tcl8/run-ptest
 create mode 100644 meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch
 create mode 100644 meta/recipes-devtools/tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch
 create mode 100644 meta/recipes-devtools/tcltk8/tcl8_8.6.15.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 7aafa7a2d14..d61b88f7de6 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -808,6 +808,7 @@ RECIPE_MAINTAINER:pn-tar = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-target-sdk-provides-dummy = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-tcf-agent = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-tcl = "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER:pn-tcl8 = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-tcp-wrappers = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-testexport-tarball = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-texinfo = "Anuj Mittal <anuj.mittal@intel.com>"
diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 4a48188562b..2a4acb02b0d 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -125,6 +125,7 @@ PTESTS_SLOW = "\
     strace \
     tar \
     tcl \
+    tcl8 \
     util-linux \
     valgrind \
 "
diff --git a/meta/recipes-devtools/expect/expect/run-ptest b/meta/recipes-devtools/expect/expect/run-ptest
index 856c314eafa..1d35ba79d37 100755
--- a/meta/recipes-devtools/expect/expect/run-ptest
+++ b/meta/recipes-devtools/expect/expect/run-ptest
@@ -1,6 +1,6 @@
 #!/bin/sh
 
-out_put=`tclsh tests/all.tcl -verbose bpse`
+out_put=`tclsh8 tests/all.tcl -verbose bpse`
 echo
 echo "${out_put}" | awk '/PASSED|FAILED|SKIPPED/{gsub(/PASSED/,"PASS"); gsub(/FAILED/,"FAIL"); gsub(/SKIPPED/,"SKIP"); if ($NF=="PASS"){print $NF": "$(NF-1)}else{print $NF": "$2}}' | uniq
 
diff --git a/meta/recipes-devtools/expect/expect_5.45.4.bb b/meta/recipes-devtools/expect/expect_5.45.4.bb
index 461a2c093aa..3d50a8f25a1 100644
--- a/meta/recipes-devtools/expect/expect_5.45.4.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
@@ -13,8 +13,8 @@ SECTION = "devel"
 
 LIC_FILES_CHKSUM = "file://license.terms;md5=fbf2de7e9102505b1439db06fc36ce5c"
 
-DEPENDS += "tcl"
-RDEPENDS:${PN} = "tcl"
+DEPENDS += "tcl8"
+RDEPENDS:${PN} = "tcl8"
 
 inherit autotools update-alternatives ptest
 
diff --git a/meta/recipes-devtools/tcltk/tcl_9.0.0.bb b/meta/recipes-devtools/tcltk/tcl_9.0.0.bb
index b3968b5be14..50834d1f85a 100644
--- a/meta/recipes-devtools/tcltk/tcl_9.0.0.bb
+++ b/meta/recipes-devtools/tcltk/tcl_9.0.0.bb
@@ -70,6 +70,10 @@ FILES:${PN}-dev += "${libdir}/tclConfig.sh ${libdir}/tclooConfig.sh"
 RDEPENDS:${PN} += "tcl-lib"
 RDEPENDS:${PN}-ptest += "libgcc locale-base-en-us tzdata"
 
+RREPLACES:${PN}-dev = "tcl8-dev"
+RPROVIDES:${PN}-dev = "tcl8-dev"
+RCONFLICTS:${PN}-dev = "tcl8-dev"
+
 BBCLASSEXTEND = "native nativesdk"
 
 do_compile_ptest() {
diff --git a/meta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch b/meta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch
new file mode 100644
index 00000000000..bfc718cfd3c
--- /dev/null
+++ b/meta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch
@@ -0,0 +1,75 @@
+From 3130dca60636dc12d0d12df75b002fd123349e21 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Tue, 22 Nov 2022 18:48:27 +0800
+Subject: [PATCH] tcl: update the header location
+
+Lets install the include header and private header files into
+usr/include/tcl8.6 when version of tcl is 8.6.x
+
+Upstream-Status: Inappropriate [Configuration Specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmai.com>
+
+Fixed the TCL_INCLUDE_SPEC
+
+Also update the header location in tcl.pc to correct the header
+location in case some package such python3 which use pkg-config
+to detect tcl doesn't find the header.
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ unix/Makefile.in  | 2 +-
+ unix/configure.in | 4 ++--
+ unix/tcl.pc.in    | 2 +-
+ 3 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/unix/Makefile.in b/unix/Makefile.in
+index a3b7d69..969ddb8 100644
+--- a/unix/Makefile.in
++++ b/unix/Makefile.in
+@@ -57,7 +57,7 @@ SCRIPT_INSTALL_DIR	= $(INSTALL_ROOT)$(TCL_LIBRARY)
+ MODULE_INSTALL_DIR	= $(SCRIPT_INSTALL_DIR)/../tcl8
+ 
+ # Directory in which to install the include file tcl.h:
+-INCLUDE_INSTALL_DIR	= $(INSTALL_ROOT)$(includedir)
++INCLUDE_INSTALL_DIR	= $(INSTALL_ROOT)$(includedir)/tcl$(VERSION)
+ 
+ # Path to the private tcl header dir:
+ PRIVATE_INCLUDE_DIR	= @PRIVATE_INCLUDE_DIR@
+diff --git a/unix/configure.in b/unix/configure.in
+index 4974fb6..a72934f 100644
+--- a/unix/configure.in
++++ b/unix/configure.in
+@@ -776,7 +776,7 @@ eval "TCL_LIB_FILE=libtcl${LIB_SUFFIX}"
+ eval "TCL_LIB_FILE=${TCL_LIB_FILE}"
+ 
+ test -z "$TCL_LIBRARY" && TCL_LIBRARY='$(libdir)/tcl$(VERSION)'
+-PRIVATE_INCLUDE_DIR='$(includedir)'
++PRIVATE_INCLUDE_DIR='$(includedir)/tcl$(VERSION)'
+ HTML_DIR='$(DISTDIR)/html'
+ 
+ # Note:  in the following variable, it's important to use the absolute
+@@ -897,7 +897,7 @@ TCL_BUILD_STUB_LIB_PATH="`pwd`/${TCL_STUB_LIB_FILE}"
+ TCL_STUB_LIB_PATH="${TCL_STUB_LIB_DIR}/${TCL_STUB_LIB_FILE}"
+ 
+ # Install time header dir can be set via --includedir
+-eval "TCL_INCLUDE_SPEC=\"-I${includedir}\""
++eval "TCL_INCLUDE_SPEC=\"-I${includedir}/tcl${VERSION}\""
+ 
+ #------------------------------------------------------------------------
+ # tclConfig.sh refers to this by a different name
+diff --git a/unix/tcl.pc.in b/unix/tcl.pc.in
+index 93b5e69..dcd51d7 100644
+--- a/unix/tcl.pc.in
++++ b/unix/tcl.pc.in
+@@ -3,7 +3,7 @@
+ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+ libdir=@libdir@
+-includedir=@includedir@
++includedir=@includedir@/tcl@PACKAGE_VERSION@
+ libfile=@TCL_LIB_FILE@
+ 
+ Name: Tool Command Language
diff --git a/meta/recipes-devtools/tcltk8/tcl8/fix_non_native_build_issue.patch b/meta/recipes-devtools/tcltk8/tcl8/fix_non_native_build_issue.patch
new file mode 100644
index 00000000000..7480156ce01
--- /dev/null
+++ b/meta/recipes-devtools/tcltk8/tcl8/fix_non_native_build_issue.patch
@@ -0,0 +1,80 @@
+From bd512547fc002fdb20808bf5b8b9feeb848b6512 Mon Sep 17 00:00:00 2001
+From: Nitin A Kamble <nitin.a.kamble@intel.com>
+Date: Fri, 13 Aug 2010 12:24:00 -0700
+Subject: [PATCH] tcl: fix a build issue
+
+Upstream-Status: Inappropriate [upstream does not support installed tests]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ unix/Makefile.in | 20 ++++++++++----------
+ 1 file changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/unix/Makefile.in b/unix/Makefile.in
+index 965f6da..a0bd63f 100644
+--- a/unix/Makefile.in
++++ b/unix/Makefile.in
+@@ -723,7 +723,7 @@ tcltest-real:
+ test: test-tcl test-packages
+ 
+ test-tcl: ${TCLTEST_EXE}
+-	$(SHELL_ENV) ./${TCLTEST_EXE} $(TOP_DIR)/tests/all.tcl $(TESTFLAGS)
++	$(SHELL_ENV) ${TCLTEST_EXE} $(TOP_DIR)/tests/all.tcl $(TESTFLAGS)
+ 
+ gdb-test: ${TCLTEST_EXE}
+ 	@printf '%s ' set env @LD_LIBRARY_PATH_VAR@=\"`pwd`$${@LD_LIBRARY_PATH_VAR@:+:$${@LD_LIBRARY_PATH_VAR}}\" > gdb.run
+@@ -732,17 +732,17 @@ gdb-test: ${TCLTEST_EXE}
+ 	@printf '\n' >>gdb.run
+ 	@printf '%s ' set args $(call shquotequote,$(TOP_DIR))/tests/all.tcl\
+ 		$(call shquotequote,$(TESTFLAGS)) -singleproc 1 >> gdb.run
+-	$(GDB) ./${TCLTEST_EXE} --command=gdb.run
++	$(GDB) ${TCLTEST_EXE} --command=gdb.run
+ 	rm gdb.run
+ 
+ # Useful target to launch a built tcltest with the proper path,...
+ runtest: ${TCLTEST_EXE}
+-	$(SHELL_ENV) ./${TCLTEST_EXE}
++	$(SHELL_ENV) ${TCLTEST_EXE}
+ 
+ # Useful target for running the test suite with an unwritable current
+ # directory...
+ ro-test: ${TCLTEST_EXE}
+-	echo 'exec chmod -w .;package require tcltest;tcltest::temporaryDirectory /tmp;source -encoding utf-8 ../tests/all.tcl;exec chmod +w .' | $(SHELL_ENV) ./${TCLTEST_EXE}
++	echo 'exec chmod -w .;package require tcltest;tcltest::temporaryDirectory /tmp;source -encoding utf-8 ../tests/all.tcl;exec chmod +w .' | $(SHELL_ENV) ${TCLTEST_EXE}
+ 
+ # The following target generates the shared libraries in dltest/ that are used
+ # for testing; they are included as part of the "tcltest" target (via the
+@@ -760,28 +760,28 @@ dltest.marker: ${STUB_LIB_FILE}
+ # This target can be used to run tclsh from the build directory
+ # via `make shell SCRIPT=/tmp/foo.tcl`
+ shell: ${TCL_EXE}
+-	$(SHELL_ENV) ./${TCL_EXE} $(SCRIPT)
++	$(SHELL_ENV) ${TCL_EXE} $(SCRIPT)
+ 
+ # This target can be used to run tclsh inside either gdb or insight
+ gdb: ${TCL_EXE}
+-	$(SHELL_ENV) $(GDB) ./${TCL_EXE}
++	$(SHELL_ENV) $(GDB) ${TCL_EXE}
+ 
+ lldb: ${TCL_EXE}
+ 	$(SHELL_ENV) $(LLDB) ./${TCL_EXE}
+ 
+ valgrind: ${TCL_EXE} ${TCLTEST_EXE}
+-	$(SHELL_ENV) $(VALGRIND) $(VALGRINDARGS) ./${TCLTEST_EXE} \
++	$(SHELL_ENV) $(VALGRIND) $(VALGRINDARGS) ${TCLTEST_EXE} \
+ 		$(TOP_DIR)/tests/all.tcl -singleproc 1 -constraints valgrind \
+ 		$(TESTFLAGS)
+ 
+ valgrindshell: ${TCL_EXE}
+-	$(SHELL_ENV) $(VALGRIND) $(VALGRINDARGS) ./${TCL_EXE} $(SCRIPT)
++	$(SHELL_ENV) $(VALGRIND) $(VALGRINDARGS) ${TCL_EXE} $(SCRIPT)
+ 
+ trace-shell: ${TCL_EXE}
+-	$(SHELL_ENV) ${TRACE} $(TRACE_OPTS) ./${TCL_EXE} $(SCRIPT)
++	$(SHELL_ENV) ${TRACE} $(TRACE_OPTS) ${TCL_EXE} $(SCRIPT)
+ 
+ trace-test: ${TCLTEST_EXE}
+-	$(SHELL_ENV) ${TRACE} $(TRACE_OPTS) ./${TCLTEST_EXE} $(TOP_DIR)/tests/all.tcl -singleproc 1 $(TESTFLAGS)
++	$(SHELL_ENV) ${TRACE} $(TRACE_OPTS) ${TCLTEST_EXE} $(TOP_DIR)/tests/all.tcl -singleproc 1 $(TESTFLAGS)
+ 
+ #--------------------------------------------------------------------------
+ # Installation rules
diff --git a/meta/recipes-devtools/tcltk8/tcl8/interp.patch b/meta/recipes-devtools/tcltk8/tcl8/interp.patch
new file mode 100644
index 00000000000..2e0dc94cff1
--- /dev/null
+++ b/meta/recipes-devtools/tcltk8/tcl8/interp.patch
@@ -0,0 +1,40 @@
+From 426aa2ff62dda77fd011e8f630b9d4ea17984817 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Mon, 12 Jul 2021 14:50:13 +0100
+Subject: [PATCH] tcl: fix race in interp.test
+
+The interp-36.7 patch has race conditions and is missing cleanup.  This patch by
+a Tcl maintainer should improve matters.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ tests/interp.test | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/tests/interp.test b/tests/interp.test
+index d742484..fc90990 100644
+--- a/tests/interp.test
++++ b/tests/interp.test
+@@ -3595,17 +3595,18 @@ test interp-36.7 {ChildBgerror sets error handler of child [1999035]} -setup {
+         variable result
+         set result [lindex $args 0]
+     }
++    set tout [after 5000 {set result timeout}]
+ } -body {
+     child eval {
+         variable done {}
+         after 0 error foo
+-        after 10 [list ::set [namespace which -variable done] {}]
+-        vwait [namespace which -variable done]
+     }
++    vwait result
+     set result
+ } -cleanup {
++    after cancel $tout
+     variable result {}
+-    unset -nocomplain result
++    unset -nocomplain result tout
+     interp delete child
+ } -result foo
+ 
diff --git a/meta/recipes-devtools/tcltk8/tcl8/run-ptest b/meta/recipes-devtools/tcltk8/tcl8/run-ptest
new file mode 100644
index 00000000000..c485e535c71
--- /dev/null
+++ b/meta/recipes-devtools/tcltk8/tcl8/run-ptest
@@ -0,0 +1,31 @@
+#!/bin/sh
+
+# clock.test needs a timezone to be set
+export TZ="Europe/London"
+export TCL_LIBRARY=library
+export ERROR_ON_FAILURES=1
+
+# Some tests are overly strict with timings and fail on loaded systems.
+SKIP=""
+# 15321
+SKIP="$SKIP async-\* event-\*"
+# 14882
+SKIP="$SKIP cmdMZ-6.6"
+# 15081
+SKIP="$SKIP exit-1.\*"
+# 15407 15421
+SKIP="$SKIP \*io-46.1"
+# io-13.6 explicitly says it can fail on slow/loaded machines
+SKIP="$SKIP io-13.6"
+# 14825
+SKIP="$SKIP socket-\* socket_inet-\*"
+
+for i in tests/*.test; do
+    i=$(basename $i)
+    ./tcltest tests/all.tcl -file $i -skip "$SKIP"
+    if [ $? -eq 0 ]; then
+        echo "PASS: $i"
+    else
+        echo "FAIL: $i"
+    fi
+done
diff --git a/meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch b/meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch
new file mode 100644
index 00000000000..1cd4d76283f
--- /dev/null
+++ b/meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch
@@ -0,0 +1,42 @@
+From b89fd73daf9b3eb2f889f65baba5f90d8a930c82 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <rpurdie@linux.intel.com>
+Date: Wed, 9 Dec 2009 23:59:44 +0000
+Subject: [PATCH] tcl: Add tcltk from OE.dev but with legacy staging function
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ unix/Makefile.in | 5 ++++-
+ unix/tcl.m4      | 3 +++
+ 2 files changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/unix/Makefile.in b/unix/Makefile.in
+index 7619afc..9dd053d 100644
+--- a/unix/Makefile.in
++++ b/unix/Makefile.in
+@@ -904,7 +904,10 @@ install-binaries: binaries
+ 	done
+ 	@echo "Installing $(LIB_FILE) to $(DLL_INSTALL_DIR)/"
+ 	@@INSTALL_LIB@
+-	@chmod 555 "$(DLL_INSTALL_DIR)/$(LIB_FILE)"
++	mv "$(DLL_INSTALL_DIR)"/$(LIB_FILE) "$(DLL_INSTALL_DIR)"/$(LIB_FILE).0
++	ln -sf $(LIB_FILE).0 "$(DLL_INSTALL_DIR)"/$(LIB_FILE)
++	ln -sf "$(DLL_INSTALL_DIR)"/$(LIB_FILE).0 ./
++	@chmod 555 "$(DLL_INSTALL_DIR)"/$(LIB_FILE).0
+ 	@echo "Installing ${TCL_EXE} as $(BIN_INSTALL_DIR)/tclsh$(VERSION)${EXE_SUFFIX}"
+ 	@$(INSTALL_PROGRAM) ${TCL_EXE} "$(BIN_INSTALL_DIR)/tclsh$(VERSION)${EXE_SUFFIX}"
+ 	@echo "Installing tclConfig.sh to $(CONFIG_INSTALL_DIR)/"
+diff --git a/unix/tcl.m4 b/unix/tcl.m4
+index 0307a06..37c4d67 100644
+--- a/unix/tcl.m4
++++ b/unix/tcl.m4
+@@ -1378,6 +1378,9 @@ AC_DEFUN([SC_CONFIG_CFLAGS], [
+ 	    # get rid of the warnings.
+ 	    #CFLAGS_OPTIMIZE="${CFLAGS_OPTIMIZE} -D__NO_STRING_INLINES -D__NO_MATH_INLINES"
+ 
++	    # following line added by CW for Debian GNU/Linux
++	    TCL_SHLIB_LD_EXTRAS="-Wl,-soname,\${TCL_LIB_FILE}.0"
++
+ 	    SHLIB_LD='${CC} ${CFLAGS} ${LDFLAGS} -shared'
+ 	    DL_OBJS="tclLoadDl.o"
+ 	    DL_LIBS="-ldl"
diff --git a/meta/recipes-devtools/tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch b/meta/recipes-devtools/tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch
new file mode 100644
index 00000000000..93e7877256b
--- /dev/null
+++ b/meta/recipes-devtools/tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch
@@ -0,0 +1,31 @@
+From 050fc597fbfa4da2c31bd0df58c871892a490470 Mon Sep 17 00:00:00 2001
+From: "Song.Li" <Song.Li@windriver.com>
+Date: Wed, 1 Aug 2012 19:05:51 +0800
+Subject: [PATCH] tcl:install tcl to lib64 instead of lib on 64bit target
+
+Remove hardcoded library install path. Change $(prefix)/lib/ to ${libdir}.
+
+[YOCTO #2876]
+
+Upstream-Status: Pending
+
+Signed-off-by: Song.Li <Song.Li@windriver.com>
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ unix/configure.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/unix/configure.in b/unix/configure.in
+index 4f62510..4974fb6 100644
+--- a/unix/configure.in
++++ b/unix/configure.in
+@@ -775,7 +775,7 @@ eval "TCL_LIB_FILE=libtcl${LIB_SUFFIX}"
+ 
+ eval "TCL_LIB_FILE=${TCL_LIB_FILE}"
+ 
+-test -z "$TCL_LIBRARY" && TCL_LIBRARY='$(prefix)/lib/tcl$(VERSION)'
++test -z "$TCL_LIBRARY" && TCL_LIBRARY='$(libdir)/tcl$(VERSION)'
+ PRIVATE_INCLUDE_DIR='$(includedir)'
+ HTML_DIR='$(DISTDIR)/html'
+ 
diff --git a/meta/recipes-devtools/tcltk8/tcl8_8.6.15.bb b/meta/recipes-devtools/tcltk8/tcl8_8.6.15.bb
new file mode 100644
index 00000000000..9e04ab84b24
--- /dev/null
+++ b/meta/recipes-devtools/tcltk8/tcl8_8.6.15.bb
@@ -0,0 +1,110 @@
+SUMMARY = "Tool Command Language"
+HOMEPAGE = "http://tcl.sourceforge.net"
+DESCRIPTION = "Tool Command Language, is an open-source multi-purpose C library which includes a powerful dynamic scripting language. Together they provide ideal cross-platform development environment for any programming project."
+SECTION = "devel/tcltk"
+
+# http://www.tcl.tk/software/tcltk/license.html
+LICENSE = "TCL & BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://license.terms;md5=058f6229798281bbcac4239c788cfa38 \
+    file://compat/license.terms;md5=058f6229798281bbcac4239c788cfa38 \
+    file://library/license.terms;md5=058f6229798281bbcac4239c788cfa38 \
+    file://macosx/license.terms;md5=058f6229798281bbcac4239c788cfa38 \
+    file://tests/license.terms;md5=058f6229798281bbcac4239c788cfa38 \
+    file://win/license.terms;md5=058f6229798281bbcac4239c788cfa38 \
+"
+
+DEPENDS = "tcl8-native zlib"
+
+BASE_SRC_URI = "${SOURCEFORGE_MIRROR}/tcl/tcl-core${PV}-src.tar.gz \
+                file://tcl-add-soname.patch"
+SRC_URI = "${BASE_SRC_URI} \
+           file://fix_non_native_build_issue.patch \
+           file://tcl-remove-hardcoded-install-path.patch \
+           file://alter-includedir.patch \
+           file://interp.patch \
+           file://run-ptest \
+           "
+SRC_URI[sha256sum] = "844775491e435e34d83d6ccfbadd1342f1855f1705253233a86152df0765e78d"
+
+SRC_URI:class-native = "${BASE_SRC_URI}"
+
+UPSTREAM_CHECK_URI = "https://www.tcl.tk/software/tcltk/download.html"
+UPSTREAM_CHECK_REGEX = "tcl(?P<pver>8(\.\d+)+)-src"
+
+S = "${WORKDIR}/tcl${PV}"
+
+VER = "${PV}"
+
+inherit autotools ptest binconfig
+
+AUTOTOOLS_SCRIPT_PATH = "${S}/unix"
+EXTRA_OECONF = "--enable-threads --disable-rpath --enable-man-suffix"
+
+# Prevent installing copy of tzdata based on tzdata installation on the build host
+# It doesn't install tzdata if one of the following files exist on the host:
+# /usr/share/zoneinfo/UTC /usr/share/zoneinfo/GMT /usr/share/lib/zoneinfo/UTC /usr/share/lib/zoneinfo/GMT /usr/lib/zoneinfo/UTC /usr/lib/zoneinfo/GMT
+# otherwise "/usr/lib/tcl8.6/tzdata" is included in tcl package
+EXTRA_OECONF += "--with-tzdata=no"
+
+do_install() {
+	autotools_do_install
+	oe_runmake 'DESTDIR=${D}' install-private-headers
+	ln -sf ./tclsh${VER} ${D}${bindir}/tclsh8
+	ln -sf tclsh8.6 ${D}${bindir}/tclsh${VER}
+	sed -i "s;-L${B};-L${STAGING_LIBDIR};g" tclConfig.sh
+	sed -i "s;'${WORKDIR};'${STAGING_INCDIR};g" tclConfig.sh
+	install -d ${D}${bindir_crossscripts}
+	install -m 0755 tclConfig.sh ${D}${bindir_crossscripts}
+	install -m 0755 tclConfig.sh ${D}${libdir}
+	for dir in compat generic unix; do
+		install -d ${D}${includedir}/${BPN}${VER}/$dir
+		install -m 0644 ${S}/$dir/*.h ${D}${includedir}/${BPN}${VER}/$dir/
+	done
+}
+
+SYSROOT_DIRS += "${bindir_crossscripts}"
+
+PACKAGES =+ "tcl8-lib"
+FILES:tcl8-lib = "${libdir}/libtcl8.6.so.*"
+FILES:${PN} += "${libdir}/tcl${VER} ${libdir}/tcl8.6 ${libdir}/tcl8"
+FILES:${PN}-dev += "${libdir}/tclConfig.sh ${libdir}/tclooConfig.sh"
+
+# isn't getting picked up by shlibs code
+RDEPENDS:${PN} += "tcl8-lib"
+RDEPENDS:${PN}-ptest += "libgcc"
+
+BBCLASSEXTEND = "native nativesdk"
+
+do_compile_ptest() {
+	oe_runmake tcltest
+}
+
+do_install_ptest() {
+	cp ${B}/tcltest ${D}${PTEST_PATH}
+	cp -r ${S}/library ${D}${PTEST_PATH}
+	cp -r ${S}/tests ${D}${PTEST_PATH}
+}
+
+do_install_ptest:append:libc-musl () {
+	# Assumes locales other than provided by musl-locales
+	sed -i '/SKIP="$SKIP socket.*$/a # unixInit-3* is suppressed due to hardcoded locale assumptions\nSKIP="$SKIP unixInit-3\\\*"' ${D}${PTEST_PATH}/run-ptest
+}
+
+# Fix some paths that might be used by Tcl extensions
+BINCONFIG_GLOB = "*Config.sh"
+
+# Fix the path in sstate
+SSTATE_SCAN_FILES += "*Config.sh"
+
+# Cleanup host path from ${libdir}/tclConfig.sh and remove the
+# ${bindir_crossscripts}/tclConfig.sh from target
+PACKAGE_PREPROCESS_FUNCS += "tcl_package_preprocess"
+tcl_package_preprocess() {
+	sed -i -e "s;${DEBUG_PREFIX_MAP};;g" \
+	       -e "s;-L${STAGING_LIBDIR};-L${libdir};g" \
+	       -e "s;${STAGING_INCDIR};${includedir};g" \
+	       -e "s;--sysroot=${RECIPE_SYSROOT};;g" \
+	       ${PKGD}${libdir}/tclConfig.sh
+
+	rm -f ${PKGD}${bindir_crossscripts}/tclConfig.sh
+}
-- 
2.39.5


