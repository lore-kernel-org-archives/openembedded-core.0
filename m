Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1D5CC2D0CD
	for <webhook@archiver.kernel.org>; Tue, 13 Dec 2022 11:11:36 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.70919.1670929888813782307
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Dec 2022 03:11:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bWJRwPBR;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id i7so595417wrv.8
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 03:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m473/0vjUO/UULzPdLG6oAH6+vv27cmu14QlJc449ks=;
        b=bWJRwPBRtYFkqkR3R4zNSv9r+nXjCghvtys6VOdh0eOED1M61YNHDOpl+MKwGDlRt/
         am9pntsvUPoUB7rgvrfyVn/96X3Y4Sf8f52hQLqjpUuJDKDFg6FGOBuW110ab3LqsCuz
         9E+r1VeNBxyAw/vXrcfUVwPTcmCwclSoDr8Ic5GDZJmTRrbS72IA9d2DFORA/TwChmbM
         9mIdISwVgF2n/xeUL2aed1H6QgZpFZciQHEGIue/pqqpRzLzAhypeA3iZTXmwz3uW0bD
         jo7OooyIVEWtL7989g9PYxf2QGyTZzxS8MDoV7d8gBzXhbwq8N2dmx0C4neX6hvy0hDR
         uTPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m473/0vjUO/UULzPdLG6oAH6+vv27cmu14QlJc449ks=;
        b=IZFDyH4QphdxmFjxZbzcZ49b7QfU350mvyHtZQE//dw4r18+piB6iXdaHrvYajMRuz
         saQY0k6HGESh2MNx7FAgHWo7nBq6FBiDL8ZVrjI6IW00bcy4yUxQ1uorg8tn5eyG1YM9
         5iZoQT1Os5h4Y/HehousQFHNXKVCX65tDrEy9sDy3r+bvrfuFRHSsv5+2fGl+rmPPWs6
         mAGoou5e2aM0TzXS494Mjmdr43/6J+1RlPAfY/1KL+Ph9eoln2hBT4Vrn7sgLtu+rwFx
         fNQLP6g3mKL0qWI3i2wcSZJyOUFyrobxAsD9EXEIFzA4ZC2MnZBNRWAWSByteHKMhu1l
         wE2g==
X-Gm-Message-State: ANoB5pmhUNZTyOnQ6z5jzc2bw96Wl4K7FL4YTEcE5ysDutDZrD9prdTt
	mTR4L58Sh3nTo61lcuRMSOHIAd0hPSI=
X-Google-Smtp-Source: AA0mqf7mAcrXPA75NOwSkcYlbtAvGxDS6qjw0XATj3/IAhAoC5c40N01B6R+FpUFvAmFZnVNs5HQXg==
X-Received: by 2002:adf:efc8:0:b0:242:137d:9ce8 with SMTP id i8-20020adfefc8000000b00242137d9ce8mr12742786wrp.9.1670929887178;
        Tue, 13 Dec 2022 03:11:27 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m8-20020a056000008800b002366c3eefccsm11362665wrx.109.2022.12.13.03.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 03:11:26 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/24] tcl: update 8.6.12 -> 8.6.13
Date: Tue, 13 Dec 2022 12:11:01 +0100
Message-Id: <20221213111118.149697-7-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221213111118.149697-1-alex@linutronix.de>
References: <20221213111118.149697-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 11:11:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174518

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../tcltk/tcl/alter-includedir.patch           | 18 ++++++++----------
 .../tcltk/tcl/fix_non_native_build_issue.patch | 11 +++++++----
 .../tcltk/{tcl_8.6.12.bb => tcl_8.6.13.bb}     |  2 +-
 3 files changed, 16 insertions(+), 15 deletions(-)
 rename meta/recipes-devtools/tcltk/{tcl_8.6.12.bb => tcl_8.6.13.bb} (97%)

diff --git a/meta/recipes-devtools/tcltk/tcl/alter-includedir.patch b/meta/recipes-devtools/tcltk/tcl/alter-includedir.patch
index 26c9b0d7fa..96d0ab2ad4 100644
--- a/meta/recipes-devtools/tcltk/tcl/alter-includedir.patch
+++ b/meta/recipes-devtools/tcltk/tcl/alter-includedir.patch
@@ -1,4 +1,4 @@
-From c6960f4ca82a153416d138221dd2426475aed683 Mon Sep 17 00:00:00 2001
+From 27e5595c065ce3af687818555a882ab5e1dfbc2b Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Tue, 22 Nov 2022 18:48:27 +0800
 Subject: [PATCH] tcl: update the header location
@@ -19,6 +19,7 @@ to detect tcl doesn't find the header.
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+
 ---
  unix/Makefile.in  | 2 +-
  unix/configure.in | 4 ++--
@@ -26,7 +27,7 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  3 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/unix/Makefile.in b/unix/Makefile.in
-index 0ebac43..b0c3ee0 100644
+index 0b8179f..4824b28 100644
 --- a/unix/Makefile.in
 +++ b/unix/Makefile.in
 @@ -57,7 +57,7 @@ SCRIPT_INSTALL_DIR	= $(INSTALL_ROOT)$(TCL_LIBRARY)
@@ -39,10 +40,10 @@ index 0ebac43..b0c3ee0 100644
  # Path to the private tcl header dir:
  PRIVATE_INCLUDE_DIR	= @PRIVATE_INCLUDE_DIR@
 diff --git a/unix/configure.in b/unix/configure.in
-index 9f96e2b..e323e02 100644
+index 0354a0b..2d0c00f 100644
 --- a/unix/configure.in
 +++ b/unix/configure.in
-@@ -773,7 +773,7 @@ eval "TCL_LIB_FILE=libtcl${LIB_SUFFIX}"
+@@ -774,7 +774,7 @@ eval "TCL_LIB_FILE=libtcl${LIB_SUFFIX}"
  eval "TCL_LIB_FILE=${TCL_LIB_FILE}"
  
  test -z "$TCL_LIBRARY" && TCL_LIBRARY='$(libdir)/tcl$(VERSION)'
@@ -51,7 +52,7 @@ index 9f96e2b..e323e02 100644
  HTML_DIR='$(DISTDIR)/html'
  
  # Note:  in the following variable, it's important to use the absolute
-@@ -894,7 +894,7 @@ TCL_BUILD_STUB_LIB_PATH="`pwd`/${TCL_STUB_LIB_FILE}"
+@@ -895,7 +895,7 @@ TCL_BUILD_STUB_LIB_PATH="`pwd`/${TCL_STUB_LIB_FILE}"
  TCL_STUB_LIB_PATH="${TCL_STUB_LIB_DIR}/${TCL_STUB_LIB_FILE}"
  
  # Install time header dir can be set via --includedir
@@ -61,7 +62,7 @@ index 9f96e2b..e323e02 100644
  #------------------------------------------------------------------------
  # tclConfig.sh refers to this by a different name
 diff --git a/unix/tcl.pc.in b/unix/tcl.pc.in
-index 846cb11..72ca44b 100644
+index 93b5e69..dcd51d7 100644
 --- a/unix/tcl.pc.in
 +++ b/unix/tcl.pc.in
 @@ -3,7 +3,7 @@
@@ -70,9 +71,6 @@ index 846cb11..72ca44b 100644
  libdir=@libdir@
 -includedir=@includedir@
 +includedir=@includedir@/tcl@PACKAGE_VERSION@
+ libfile=@TCL_LIB_FILE@
  
  Name: Tool Command Language
- Description: Tcl is a powerful, easy-to-learn dynamic programming language, suitable for a wide range of uses.
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch b/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch
index 41aefd1deb..6dbef7077f 100644
--- a/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch
+++ b/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch
@@ -1,4 +1,4 @@
-From 34c3a1adc1bfd13fb877179c37ef74a108f2a749 Mon Sep 17 00:00:00 2001
+From 8a6c77cdd265fe7ce35929f58f1ade0c6bc4025b Mon Sep 17 00:00:00 2001
 From: Nitin A Kamble <nitin.a.kamble@intel.com>
 Date: Fri, 13 Aug 2010 12:24:00 -0700
 Subject: [PATCH] tcl: fix a build issue
@@ -10,10 +10,10 @@ Upstream-Status: Inappropriate [upstream does not support installed tests]
  1 file changed, 10 insertions(+), 10 deletions(-)
 
 diff --git a/unix/Makefile.in b/unix/Makefile.in
-index 804532e..a9cb339 100644
+index b110fe9..d7b35a8 100644
 --- a/unix/Makefile.in
 +++ b/unix/Makefile.in
-@@ -810,23 +810,23 @@ tcltest-real:
+@@ -814,23 +814,23 @@ tcltest-real:
  test: test-tcl test-packages
  
  test-tcl: ${TCLTEST_EXE}
@@ -41,7 +41,7 @@ index 804532e..a9cb339 100644
  
  # The following target generates the shared libraries in dltest/ that are used
  # for testing; they are included as part of the "tcltest" target (via the
-@@ -844,25 +844,25 @@ dltest.marker: ${STUB_LIB_FILE}
+@@ -848,28 +848,28 @@ dltest.marker: ${STUB_LIB_FILE}
  # This target can be used to run tclsh from the build directory
  # via `make shell SCRIPT=/tmp/foo.tcl`
  shell: ${TCL_EXE}
@@ -53,6 +53,9 @@ index 804532e..a9cb339 100644
 -	$(SHELL_ENV) $(GDB) ./${TCL_EXE}
 +	$(SHELL_ENV) $(GDB) ${TCL_EXE}
  
+ lldb: ${TCL_EXE}
+ 	$(SHELL_ENV) $(LLDB) ./${TCL_EXE}
+ 
  valgrind: ${TCL_EXE} ${TCLTEST_EXE}
 -	$(SHELL_ENV) $(VALGRIND) $(VALGRINDARGS) ./${TCLTEST_EXE} \
 +	$(SHELL_ENV) $(VALGRIND) $(VALGRINDARGS) ${TCLTEST_EXE} \
diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.12.bb b/meta/recipes-devtools/tcltk/tcl_8.6.13.bb
similarity index 97%
rename from meta/recipes-devtools/tcltk/tcl_8.6.12.bb
rename to meta/recipes-devtools/tcltk/tcl_8.6.13.bb
index 824c0286c6..982f370edb 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.12.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.13.bb
@@ -25,7 +25,7 @@ SRC_URI = "${BASE_SRC_URI} \
            file://interp.patch \
            file://run-ptest \
 "
-SRC_URI[sha256sum] = "186748f1131cef3d637421a18d70892f808e526a29c694bebfeb1c540f98727c"
+SRC_URI[sha256sum] = "c61f0d6699e2bc7691f119b41963aaa8dc980f23532c4e937739832a5f4a6642"
 
 SRC_URI:class-native = "${BASE_SRC_URI}"
 
-- 
2.30.2


