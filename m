Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02FB9C3DA4A
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 08:42:50 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.14686.1736325765010691093
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 00:42:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=drKz746u;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aa68b513abcso3043028766b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 00:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736325763; x=1736930563; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+cUZ8FtS/Wcj4OtFZ7Bf9FWZWajO8c8IWrNVgRVXLF0=;
        b=drKz746u2FqxGTHAogh1Fy8LQxk0z7qiR8NGUyb8ek3l5i8ZG5CDGZ+ARvOFkDDrUS
         vb3f1a1CWLeAWNZK++HXcGkj8qh17uu5IveJ42QURBFTaaXdPoJaLoYjhZ7povYbSkJj
         5V6l94lHVDGwl50/g8l1S8fRVrlKaUHxpO1VVdg3ROw7Bo/+yaVtIsq3CDQPQgEWkVCF
         w3IfI5FYceIth85zpoAGUZ93RlDoWSIjQWNM/0QU0HMLV55Oy4cswfbXNhPbXK9d00hQ
         dMzUYlGLinsMAOM/A4iMlfgP0cA/aPUa1pQTKxGXRZY1EENp/OedySS6Okfl5IhMiifZ
         ALmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736325763; x=1736930563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+cUZ8FtS/Wcj4OtFZ7Bf9FWZWajO8c8IWrNVgRVXLF0=;
        b=ZV6X7Crus3jryTF6bF2cpPadb3YwxTXwGV/BiRwolqmPgwK3+Z/QU0RMTsMGegs4gc
         jWzXBof6cUNsRwicLEz6Ry8EXBRoMLt4M/lXe2bZSMboy/pPmtI3jFiVOygXWHLJMiGY
         5dqgUByEpky2BtdT22f+Nr96wsc1YaVCYXlJrMm/6LpdeRIx8Hzn3RFIUualP1lJlQyC
         CDFaCUzwR3PONZ/ByYQp/DW3ysEtJRM6XCANTwJFI/oQ+2ZYVNp898IgFHvmBI5StRIf
         NKvFg3vg0ts+AKxOlsdTxHbTJwJjbh8Ti9Zf+5bCc+4A852Lua9U5FWIJZ5N9DYWa6jP
         3osg==
X-Gm-Message-State: AOJu0YxU7qP1IIQKpQSUGqBHSr2l7UZHD0fNj3tJHlOl61120PcvLYqu
	KzDpGoxwsMHvEnkCbGJxgNTYf7oiabQ1S2BtHpGPEeu6/eo3ZCA64rRTAA==
X-Gm-Gg: ASbGncttjkWVwcgP7oTorG5kCQcXB8YDy0GtqU/WmmpU3a8MKdCZaDJZ+HrbA5nFZWS
	tqlFHSl2R1XTlZV49lkWDjI3IRkBFTKvtaZZbQix7gQt/snN1U69Wp15z1FbuB4z/QYFADfaUQe
	BolyDXnkkR61qaUj8XJE4hdnrgEBuJi1NwQheyf78CaTL+vOfWlpwh2K52was3baIVzBedTsYki
	KYhBgkAWWu2mf6zFhtkp1KVIWlTBLuKdfVlp73fxD8CMapoHk16jnFh8W4CsQ71fiIW8Gkox4H8
	4HkzU0040mcw36yNpw==
X-Google-Smtp-Source: AGHT+IHkWZcBfaT73RNp1G1UXBO0BoqOkjr7NeONmZKIZG68gG8xlOVeSOtlgQkJh3K5KAcoJLoL8A==
X-Received: by 2002:a17:907:1c22:b0:aa5:43c4:da78 with SMTP id a640c23a62f3a-ab2abdbfe39mr154629466b.51.1736325763063;
        Wed, 08 Jan 2025 00:42:43 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f06c7c2sm2499661766b.188.2025.01.08.00.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 00:42:42 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 19/20] tcl8: upgrade 8.6.15 -> 8.6.16
Date: Wed,  8 Jan 2025 09:42:25 +0100
Message-Id: <20250108084226.117178-19-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250108084226.117178-1-alex.kanavin@gmail.com>
References: <20250108084226.117178-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 08:42:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209540

From: Alexander Kanavin <alex@linutronix.de>

Adjust run-ptest to use the absolute ptest library location
(tcl 9.x already does this) to avoid clock.test failures.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../tcltk8/tcl8/alter-includedir.patch                 | 10 +++++-----
 .../tcltk8/tcl8/fix_non_native_build_issue.patch       |  4 ++--
 meta/recipes-devtools/tcltk8/tcl8/interp.patch         |  6 +++---
 meta/recipes-devtools/tcltk8/tcl8/run-ptest            |  2 +-
 meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch |  8 ++++----
 .../tcl8/tcl-remove-hardcoded-install-path.patch       |  6 +++---
 .../tcltk8/{tcl8_8.6.15.bb => tcl8_8.6.16.bb}          |  3 ++-
 7 files changed, 20 insertions(+), 19 deletions(-)
 rename meta/recipes-devtools/tcltk8/{tcl8_8.6.15.bb => tcl8_8.6.16.bb} (96%)

diff --git a/meta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch b/meta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch
index bfc718cfd3c..6ceb297cea8 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch
@@ -1,4 +1,4 @@
-From 3130dca60636dc12d0d12df75b002fd123349e21 Mon Sep 17 00:00:00 2001
+From 8bb8174e13c1c0e3b27fdf96a393f9fb1b7e14be Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Tue, 22 Nov 2022 18:48:27 +0800
 Subject: [PATCH] tcl: update the header location
@@ -26,7 +26,7 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  3 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/unix/Makefile.in b/unix/Makefile.in
-index a3b7d69..969ddb8 100644
+index c3b75e3..60ed93e 100644
 --- a/unix/Makefile.in
 +++ b/unix/Makefile.in
 @@ -57,7 +57,7 @@ SCRIPT_INSTALL_DIR	= $(INSTALL_ROOT)$(TCL_LIBRARY)
@@ -39,10 +39,10 @@ index a3b7d69..969ddb8 100644
  # Path to the private tcl header dir:
  PRIVATE_INCLUDE_DIR	= @PRIVATE_INCLUDE_DIR@
 diff --git a/unix/configure.in b/unix/configure.in
-index 4974fb6..a72934f 100644
+index 8e6726b..2345689 100644
 --- a/unix/configure.in
 +++ b/unix/configure.in
-@@ -776,7 +776,7 @@ eval "TCL_LIB_FILE=libtcl${LIB_SUFFIX}"
+@@ -775,7 +775,7 @@ eval "TCL_LIB_FILE=libtcl${LIB_SUFFIX}"
  eval "TCL_LIB_FILE=${TCL_LIB_FILE}"
  
  test -z "$TCL_LIBRARY" && TCL_LIBRARY='$(libdir)/tcl$(VERSION)'
@@ -51,7 +51,7 @@ index 4974fb6..a72934f 100644
  HTML_DIR='$(DISTDIR)/html'
  
  # Note:  in the following variable, it's important to use the absolute
-@@ -897,7 +897,7 @@ TCL_BUILD_STUB_LIB_PATH="`pwd`/${TCL_STUB_LIB_FILE}"
+@@ -898,7 +898,7 @@ TCL_BUILD_STUB_LIB_PATH="`pwd`/${TCL_STUB_LIB_FILE}"
  TCL_STUB_LIB_PATH="${TCL_STUB_LIB_DIR}/${TCL_STUB_LIB_FILE}"
  
  # Install time header dir can be set via --includedir
diff --git a/meta/recipes-devtools/tcltk8/tcl8/fix_non_native_build_issue.patch b/meta/recipes-devtools/tcltk8/tcl8/fix_non_native_build_issue.patch
index 7480156ce01..61153878fef 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/fix_non_native_build_issue.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/fix_non_native_build_issue.patch
@@ -1,4 +1,4 @@
-From bd512547fc002fdb20808bf5b8b9feeb848b6512 Mon Sep 17 00:00:00 2001
+From 3d11e7fd9aba6251974d990286347c06582e87b9 Mon Sep 17 00:00:00 2001
 From: Nitin A Kamble <nitin.a.kamble@intel.com>
 Date: Fri, 13 Aug 2010 12:24:00 -0700
 Subject: [PATCH] tcl: fix a build issue
@@ -10,7 +10,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 10 insertions(+), 10 deletions(-)
 
 diff --git a/unix/Makefile.in b/unix/Makefile.in
-index 965f6da..a0bd63f 100644
+index a2f9e21..c3b75e3 100644
 --- a/unix/Makefile.in
 +++ b/unix/Makefile.in
 @@ -723,7 +723,7 @@ tcltest-real:
diff --git a/meta/recipes-devtools/tcltk8/tcl8/interp.patch b/meta/recipes-devtools/tcltk8/tcl8/interp.patch
index 2e0dc94cff1..a4fb0c5a9d4 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/interp.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/interp.patch
@@ -1,4 +1,4 @@
-From 426aa2ff62dda77fd011e8f630b9d4ea17984817 Mon Sep 17 00:00:00 2001
+From 09049beed723243d092ffaa37939dfe0f2ed6828 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Mon, 12 Jul 2021 14:50:13 +0100
 Subject: [PATCH] tcl: fix race in interp.test
@@ -13,10 +13,10 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 4 insertions(+), 3 deletions(-)
 
 diff --git a/tests/interp.test b/tests/interp.test
-index d742484..fc90990 100644
+index 24ffb1b..c6460ad 100644
 --- a/tests/interp.test
 +++ b/tests/interp.test
-@@ -3595,17 +3595,18 @@ test interp-36.7 {ChildBgerror sets error handler of child [1999035]} -setup {
+@@ -3614,17 +3614,18 @@ test interp-36.7 {ChildBgerror sets error handler of child [1999035]} -setup {
          variable result
          set result [lindex $args 0]
      }
diff --git a/meta/recipes-devtools/tcltk8/tcl8/run-ptest b/meta/recipes-devtools/tcltk8/tcl8/run-ptest
index c485e535c71..bea9d9ccfd0 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/run-ptest
+++ b/meta/recipes-devtools/tcltk8/tcl8/run-ptest
@@ -2,7 +2,7 @@
 
 # clock.test needs a timezone to be set
 export TZ="Europe/London"
-export TCL_LIBRARY=library
+export TCL_LIBRARY=@libdir@/tcl8/ptest/library
 export ERROR_ON_FAILURES=1
 
 # Some tests are overly strict with timings and fail on loaded systems.
diff --git a/meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch b/meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch
index 1cd4d76283f..88faf8ac730 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch
@@ -1,4 +1,4 @@
-From b89fd73daf9b3eb2f889f65baba5f90d8a930c82 Mon Sep 17 00:00:00 2001
+From 0d8e567d132e050c5d4a8d8d9257417e0679483c Mon Sep 17 00:00:00 2001
 From: Richard Purdie <rpurdie@linux.intel.com>
 Date: Wed, 9 Dec 2009 23:59:44 +0000
 Subject: [PATCH] tcl: Add tcltk from OE.dev but with legacy staging function
@@ -11,10 +11,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  2 files changed, 7 insertions(+), 1 deletion(-)
 
 diff --git a/unix/Makefile.in b/unix/Makefile.in
-index 7619afc..9dd053d 100644
+index bc743b3..a2f9e21 100644
 --- a/unix/Makefile.in
 +++ b/unix/Makefile.in
-@@ -904,7 +904,10 @@ install-binaries: binaries
+@@ -812,7 +812,10 @@ install-binaries: binaries
  	done
  	@echo "Installing $(LIB_FILE) to $(DLL_INSTALL_DIR)/"
  	@@INSTALL_LIB@
@@ -27,7 +27,7 @@ index 7619afc..9dd053d 100644
  	@$(INSTALL_PROGRAM) ${TCL_EXE} "$(BIN_INSTALL_DIR)/tclsh$(VERSION)${EXE_SUFFIX}"
  	@echo "Installing tclConfig.sh to $(CONFIG_INSTALL_DIR)/"
 diff --git a/unix/tcl.m4 b/unix/tcl.m4
-index 0307a06..37c4d67 100644
+index 7f5464e..cd8d929 100644
 --- a/unix/tcl.m4
 +++ b/unix/tcl.m4
 @@ -1378,6 +1378,9 @@ AC_DEFUN([SC_CONFIG_CFLAGS], [
diff --git a/meta/recipes-devtools/tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch b/meta/recipes-devtools/tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch
index 93e7877256b..0a0c1173a22 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch
@@ -1,4 +1,4 @@
-From 050fc597fbfa4da2c31bd0df58c871892a490470 Mon Sep 17 00:00:00 2001
+From 6e3cbc3600ac474776e92eb9a88abcb74299c321 Mon Sep 17 00:00:00 2001
 From: "Song.Li" <Song.Li@windriver.com>
 Date: Wed, 1 Aug 2012 19:05:51 +0800
 Subject: [PATCH] tcl:install tcl to lib64 instead of lib on 64bit target
@@ -17,10 +17,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/unix/configure.in b/unix/configure.in
-index 4f62510..4974fb6 100644
+index e88ec3c..8e6726b 100644
 --- a/unix/configure.in
 +++ b/unix/configure.in
-@@ -775,7 +775,7 @@ eval "TCL_LIB_FILE=libtcl${LIB_SUFFIX}"
+@@ -774,7 +774,7 @@ eval "TCL_LIB_FILE=libtcl${LIB_SUFFIX}"
  
  eval "TCL_LIB_FILE=${TCL_LIB_FILE}"
  
diff --git a/meta/recipes-devtools/tcltk8/tcl8_8.6.15.bb b/meta/recipes-devtools/tcltk8/tcl8_8.6.16.bb
similarity index 96%
rename from meta/recipes-devtools/tcltk8/tcl8_8.6.15.bb
rename to meta/recipes-devtools/tcltk8/tcl8_8.6.16.bb
index b13102dd7af..c8f4b5df2aa 100644
--- a/meta/recipes-devtools/tcltk8/tcl8_8.6.15.bb
+++ b/meta/recipes-devtools/tcltk8/tcl8_8.6.16.bb
@@ -24,7 +24,7 @@ SRC_URI = "${BASE_SRC_URI} \
            file://interp.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "844775491e435e34d83d6ccfbadd1342f1855f1705253233a86152df0765e78d"
+SRC_URI[sha256sum] = "3b371386a9a928eecdbf263bcab7d6a531e620ca3fbab4fdeeb3d6a9a56f38e9"
 
 SRC_URI:class-native = "${BASE_SRC_URI}"
 
@@ -85,6 +85,7 @@ do_install_ptest() {
 	cp ${B}/tcltest ${D}${PTEST_PATH}
 	cp -r ${S}/library ${D}${PTEST_PATH}
 	cp -r ${S}/tests ${D}${PTEST_PATH}
+	sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest
 }
 
 do_install_ptest:append:libc-musl () {
-- 
2.39.5


