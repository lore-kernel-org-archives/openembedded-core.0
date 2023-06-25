Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 684CBEB64DC
	for <webhook@archiver.kernel.org>; Sun, 25 Jun 2023 21:22:57 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.20341.1687728167241705869
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jun 2023 14:22:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=E2w95/PA;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3113675d582so2165041f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 14:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687728165; x=1690320165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aXuKZ2WxVUqDWhb6D+NBdP4VnUYM1bc0Jh0JsuqDRcI=;
        b=E2w95/PAcxFxocd8dMqaclPYYZO/PkJ3mqwO+X0lWcB2DQRBZlyqc6svcUTwuoNdEP
         4JIPCWJ+8jbJdMcMrn3FtDxknkTC5WMiYdG2AKs07aq/sEt9LbExG338cXUsrOglP5Z6
         yn6LM2xdOMsFEE4WYLZ93LND4u2XcHMPYtYAg0fn7hVn0GJBBMy30qHMxYxmIEqDhqbS
         YA/g3v4v76misCF07k0HMEr1NpEyIbzv4/nry5wUs+MOvyxeMlX6EgC+CGEVcILrGK2s
         UKlYoobWc03hco1SeyNeX6oOV9D+SI8mf+lg3/ONSwyUKHe28QUg5ZvIdplzmDVg8054
         ljUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687728165; x=1690320165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aXuKZ2WxVUqDWhb6D+NBdP4VnUYM1bc0Jh0JsuqDRcI=;
        b=OU+0cjMBEnbHfhEWmzUs90r7P4aUmKqnPfAYzOFtegOhik8CkH9VMvTa2YaSRJMfFD
         h41NzZOaJTz5tkDp3benrA+uimlswkzLnYmxaGNAY9HEhqtClnpCEvBribTdHVV13VkH
         jo7J09fcfx1YYAu6Hk04SDYYeXZM1x2g/pMvdvPvL3QNNMxgOQIALlDyioZk+MTwSflO
         tVnHYjrlmavbOfVjI2Mmzp1N6YP7tsxwHqVmmZeIjh1ubpilME9sK/7BQeaJWom1vBrB
         iO+p3/4aq1/qpLi1IQI0bGTGN6ZbWDZv+SvD5YsrWs+oA5yvl8suQpUunFjbH9mCxUtz
         86XQ==
X-Gm-Message-State: AC+VfDzDDy51s055GCpoNiF9SZDuMBQAP3VBZR9R3+e2m8PY9QmfqUY7
	LpL1D9uhFdpQci8hAK1mBYCo9yjctYabSw==
X-Google-Smtp-Source: ACHHUZ4AMt1Me6x4LKyKU4N+ZzkUVjwNT1BWDlkOQiAHZdaTkiCfBAcLolgJ2S2n0P31qcyQgHWq4w==
X-Received: by 2002:a5d:608f:0:b0:313:f157:7d56 with SMTP id w15-20020a5d608f000000b00313f1577d56mr489498wrt.30.1687728165487;
        Sun, 25 Jun 2023 14:22:45 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id q9-20020a056000136900b0030f9c3219aasm5426736wrz.47.2023.06.25.14.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 14:22:45 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/21] libxml2: update 2.10.4 -> 2.11.4
Date: Sun, 25 Jun 2023 23:22:22 +0200
Message-Id: <20230625212241.915739-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230625212241.915739-1-alex@linutronix.de>
References: <20230625212241.915739-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 21:22:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183377

Drop backports.

Drop libxml-64bit.patch
(no longer necessary).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libxml/libxml2/fix-tests.patch            | 222 ------------------
 .../libxml/libxml2/install-tests.patch        |  17 +-
 .../libxml/libxml2/libxml-64bit.patch         |  28 ---
 .../libxml2/libxml-m4-use-pkgconfig.patch     | 212 -----------------
 .../{libxml2_2.10.4.bb => libxml2_2.11.4.bb}  |   5 +-
 5 files changed, 8 insertions(+), 476 deletions(-)
 delete mode 100644 meta/recipes-core/libxml/libxml2/fix-tests.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/libxml-64bit.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch
 rename meta/recipes-core/libxml/{libxml2_2.10.4.bb => libxml2_2.11.4.bb} (95%)

diff --git a/meta/recipes-core/libxml/libxml2/fix-tests.patch b/meta/recipes-core/libxml/libxml2/fix-tests.patch
deleted file mode 100644
index 80678efcfee..00000000000
--- a/meta/recipes-core/libxml/libxml2/fix-tests.patch
+++ /dev/null
@@ -1,222 +0,0 @@
-Backport the following patches to fix the reader2 and runsuite test cases:
-
-b92768cd tests: Enable "runsuite" test
-0ac8c15e python/tests/reader2: use absolute paths everywhere
-b9ba5e1d python/tests/reader2: always exit(1) if a test fails
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-diff --git a/python/tests/reader2.py b/python/tests/reader2.py
-index 65cecd47..6e6353b4 100755
---- a/python/tests/reader2.py
-+++ b/python/tests/reader2.py
-@@ -6,7 +6,6 @@
- import sys
- import glob
- import os
--import string
- import libxml2
- try:
-     import StringIO
-@@ -20,103 +19,104 @@ libxml2.debugMemory(1)
- 
- err = ""
- basedir = os.path.dirname(os.path.realpath(__file__))
--dir_prefix = os.path.join(basedir, "../../test/valid/")
-+dir_prefix = os.path.realpath(os.path.join(basedir, "..", "..", "test", "valid"))
-+
- # This dictionary reflects the contents of the files
- # ../../test/valid/*.xml.err that are not empty, except that
- # the file paths in the messages start with ../../test/
- 
- expect = {
-     '766956':
--"""../../test/valid/dtds/766956.dtd:2: parser error : PEReference: expecting ';'
-+"""{0}/dtds/766956.dtd:2: parser error : PEReference: expecting ';'
- %ä%ent;
-    ^
--../../test/valid/dtds/766956.dtd:2: parser error : Content error in the external subset
-+{0}/dtds/766956.dtd:2: parser error : Content error in the external subset
- %ä%ent;
-         ^
- Entity: line 1: 
- value
- ^
--""",
-+""".format(dir_prefix),
-     '781333':
--"""../../test/valid/781333.xml:4: element a: validity error : Element a content does not follow the DTD, expecting ( ..., got 
-+"""{0}/781333.xml:4: element a: validity error : Element a content does not follow the DTD, expecting ( ..., got 
- <a/>
-     ^
--../../test/valid/781333.xml:5: element a: validity error : Element a content does not follow the DTD, Expecting more child
-+{0}/781333.xml:5: element a: validity error : Element a content does not follow the DTD, Expecting more child
- 
- ^
--""",
-+""".format(dir_prefix),
-     'cond_sect2':
--"""../../test/valid/dtds/cond_sect2.dtd:15: parser error : All markup of the conditional section is not in the same entity
-+"""{0}/dtds/cond_sect2.dtd:15: parser error : All markup of the conditional section is not in the same entity
-     %ent;
-          ^
- Entity: line 1: 
- ]]>
- ^
--../../test/valid/dtds/cond_sect2.dtd:17: parser error : Content error in the external subset
-+{0}/dtds/cond_sect2.dtd:17: parser error : Content error in the external subset
- 
- ^
--""",
-+""".format(dir_prefix),
-     'rss':
--"""../../test/valid/rss.xml:177: element rss: validity error : Element rss does not carry attribute version
-+"""{0}/rss.xml:177: element rss: validity error : Element rss does not carry attribute version
- </rss>
-       ^
--""",
-+""".format(dir_prefix),
-     't8':
--"""../../test/valid/t8.xml:6: parser error : internal error: xmlParseInternalSubset: error detected in Markup declaration
-+"""{0}/t8.xml:6: parser error : internal error: xmlParseInternalSubset: error detected in Markup declaration
- 
- %defroot; %defmiddle; %deftest;
-          ^
- Entity: line 1: 
- &lt;!ELEMENT root (middle) >
- ^
--../../test/valid/t8.xml:6: parser error : internal error: xmlParseInternalSubset: error detected in Markup declaration
-+{0}/t8.xml:6: parser error : internal error: xmlParseInternalSubset: error detected in Markup declaration
- 
- %defroot; %defmiddle; %deftest;
-                      ^
- Entity: line 1: 
- &lt;!ELEMENT middle (test) >
- ^
--../../test/valid/t8.xml:6: parser error : internal error: xmlParseInternalSubset: error detected in Markup declaration
-+{0}/t8.xml:6: parser error : internal error: xmlParseInternalSubset: error detected in Markup declaration
- 
- %defroot; %defmiddle; %deftest;
-                                ^
- Entity: line 1: 
- &lt;!ELEMENT test (#PCDATA) >
- ^
--""",
-+""".format(dir_prefix),
-     't8a':
--"""../../test/valid/t8a.xml:6: parser error : internal error: xmlParseInternalSubset: error detected in Markup declaration
-+"""{0}/t8a.xml:6: parser error : internal error: xmlParseInternalSubset: error detected in Markup declaration
- 
- %defroot;%defmiddle;%deftest;
-          ^
- Entity: line 1: 
- &lt;!ELEMENT root (middle) >
- ^
--../../test/valid/t8a.xml:6: parser error : internal error: xmlParseInternalSubset: error detected in Markup declaration
-+{0}/t8a.xml:6: parser error : internal error: xmlParseInternalSubset: error detected in Markup declaration
- 
- %defroot;%defmiddle;%deftest;
-                     ^
- Entity: line 1: 
- &lt;!ELEMENT middle (test) >
- ^
--../../test/valid/t8a.xml:6: parser error : internal error: xmlParseInternalSubset: error detected in Markup declaration
-+{0}/t8a.xml:6: parser error : internal error: xmlParseInternalSubset: error detected in Markup declaration
- 
- %defroot;%defmiddle;%deftest;
-                              ^
- Entity: line 1: 
- &lt;!ELEMENT test (#PCDATA) >
- ^
--""",
-+""".format(dir_prefix),
-     'xlink':
--"""../../test/valid/xlink.xml:450: element termdef: validity error : ID dt-arc already defined
-+"""{0}/xlink.xml:450: element termdef: validity error : ID dt-arc already defined
- 	<p><termdef id="dt-arc" term="Arc">An <ter
- 	                                  ^
- validity error : attribute def line 199 references an unknown ID "dt-xlg"
--""",
-+""".format(dir_prefix),
- }
- 
- # Add prefix_dir and extension to the keys
--expect = {"{}{}.xml".format(dir_prefix, key): val for key, val in expect.items()}
-+expect = {os.path.join(dir_prefix, key + ".xml"): val for key, val in expect.items()}
- 
- def callback(ctx, str):
-     global err
-@@ -124,11 +124,12 @@ def callback(ctx, str):
- libxml2.registerErrorHandler(callback, "")
- 
- parsing_error_files = ["766956", "cond_sect2", "t8", "t8a"]
--expect_parsing_error = ["{}{}.xml".format(dir_prefix, f) for f in parsing_error_files]
-+expect_parsing_error = [os.path.join(dir_prefix, f + ".xml") for f in parsing_error_files]
- 
--valid_files = glob.glob(dir_prefix + "*.x*")
-+valid_files = glob.glob(os.path.join(dir_prefix, "*.x*"))
- assert valid_files, "found no valid files in '{}'".format(dir_prefix)
- valid_files.sort()
-+failures = 0
- for file in valid_files:
-     err = ""
-     reader = libxml2.newTextReaderFilename(file)
-@@ -142,9 +143,15 @@ for file in valid_files:
-         #sys.exit(1)
-     if (err):
-         if not(file in expect and err == expect[file]):
-+            failures += 1
-             print("Error: ", err)
-             if file in expect:
-                 print("Expected: ", expect[file])
-+
-+if failures:
-+    print("Failed %d tests" % failures)
-+    sys.exit(1)
-+
- #
- # another separate test based on Stephane Bidoul one
- #
-@@ -337,9 +344,11 @@ while reader.Read() == 1:
- if res != expect:
-     print("test5 failed: unexpected output")
-     print(res)
-+    sys.exit(1)
- if err != "":
-     print("test5 failed: validation error found")
-     print(err)
-+    sys.exit(1)
- 
- #
- # cleanup
-diff --git a/runsuite.c b/runsuite.c
-index 483490a2..a522d24b 100644
---- a/runsuite.c
-+++ b/runsuite.c
-@@ -1054,13 +1054,18 @@ main(int argc ATTRIBUTE_UNUSED, char **argv ATTRIBUTE_UNUSED) {
-     old_tests = nb_tests;
-     old_leaks = nb_leaks;
-     xsdTest();
--    if ((nb_errors == old_errors) && (nb_leaks == old_leaks))
--	printf("Ran %d tests, no errors\n", nb_tests - old_tests);
--    else
--	printf("Ran %d tests, %d errors, %d leaks\n",
--	       nb_tests - old_tests,
--	       nb_errors - old_errors,
--	       nb_leaks - old_leaks);
-+    printf("Ran %d tests, %d errors, %d leaks\n",
-+           nb_tests - old_tests,
-+           nb_errors - old_errors,
-+           nb_leaks - old_leaks);
-+    if (nb_errors - old_errors == 10) {
-+        printf("10 errors were expected\n");
-+        nb_errors = old_errors;
-+    } else {
-+        printf("10 errors were expected, got %d errors\n",
-+               nb_errors - old_errors);
-+        nb_errors = old_errors + 1;
-+    }
-     old_errors = nb_errors;
-     old_tests = nb_tests;
-     old_leaks = nb_leaks;
diff --git a/meta/recipes-core/libxml/libxml2/install-tests.patch b/meta/recipes-core/libxml/libxml2/install-tests.patch
index b770afbeb49..14ccce5873b 100644
--- a/meta/recipes-core/libxml/libxml2/install-tests.patch
+++ b/meta/recipes-core/libxml/libxml2/install-tests.patch
@@ -1,19 +1,19 @@
+From 3fc716357ce1372d9418dc86f24315b34d9808de Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Mon, 5 Dec 2022 17:02:32 +0000
+Subject: [PATCH] add yocto-specific install-ptest target
+
 Add a target to install the test suite.
 
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 
-From c7809dc6947324ea506a0c2bf132ecd37156f211 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Mon, 5 Dec 2022 17:02:32 +0000
-Subject: [PATCH] add yocto-specific install-ptest target
-
 ---
  Makefile.am | 10 ++++++++++
  1 file changed, 10 insertions(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index 316109b1..15e100be 100644
+index 5bc4018..57d27af 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -26,6 +26,16 @@ check_PROGRAMS = \
@@ -32,7 +32,4 @@ index 316109b1..15e100be 100644
 +
  bin_PROGRAMS = xmllint xmlcatalog
  
- nodist_bin_SCRIPTS = xml2-config
--- 
-2.34.1
-
+ bin_SCRIPTS = xml2-config
diff --git a/meta/recipes-core/libxml/libxml2/libxml-64bit.patch b/meta/recipes-core/libxml/libxml2/libxml-64bit.patch
deleted file mode 100644
index fd8e469dd31..00000000000
--- a/meta/recipes-core/libxml/libxml2/libxml-64bit.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 056b14345b1abd76a761ab14538f1bc21302781a Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Sat, 11 May 2019 20:26:51 +0800
-Subject: [PATCH] libxml 64bit
-
-Upstream-Status: Backport [from debian: bugs.debian.org/439843]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- libxml.h | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/libxml.h b/libxml.h
-index 64e30f7..4e80d90 100644
---- a/libxml.h
-+++ b/libxml.h
-@@ -15,6 +15,9 @@
- #ifndef _LARGEFILE_SOURCE
- #define _LARGEFILE_SOURCE
- #endif
-+#ifndef _LARGEFILE64_SOURCE
-+#define _LARGEFILE64_SOURCE
-+#endif
- #ifndef _FILE_OFFSET_BITS
- #define _FILE_OFFSET_BITS 64
- #endif
--- 
-2.7.4
-
diff --git a/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch b/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch
deleted file mode 100644
index 639c80bd6ce..00000000000
--- a/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch
+++ /dev/null
@@ -1,212 +0,0 @@
-Change the AM_PATH_XML2 macros to use pkg-config instead of xml2-config.
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/d598d8af0913b6e3d4e61ffa62397a275b669dca]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
- libxml.m4 | 189 ++----------------------------------------------------
- 1 file changed, 5 insertions(+), 184 deletions(-)
-
-diff --git a/libxml.m4 b/libxml.m4
-index fc7790c..1c53585 100644
---- a/libxml.m4
-+++ b/libxml.m4
-@@ -1,191 +1,12 @@
--# Configure paths for LIBXML2
--# Simon Josefsson 2020-02-12
--# Fix autoconf 2.70+ warnings
--# Mike Hommey 2004-06-19
--# use CPPFLAGS instead of CFLAGS
--# Toshio Kuratomi 2001-04-21
--# Adapted from:
--# Configure paths for GLIB
--# Owen Taylor     97-11-3
--
- dnl AM_PATH_XML2([MINIMUM-VERSION, [ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND]]])
- dnl Test for XML, and define XML_CPPFLAGS and XML_LIBS
- dnl
--AC_DEFUN([AM_PATH_XML2],[ 
--AC_ARG_WITH(xml-prefix,
--            [  --with-xml-prefix=PFX   Prefix where libxml is installed (optional)],
--            xml_config_prefix="$withval", xml_config_prefix="")
--AC_ARG_WITH(xml-exec-prefix,
--            [  --with-xml-exec-prefix=PFX Exec prefix where libxml is installed (optional)],
--            xml_config_exec_prefix="$withval", xml_config_exec_prefix="")
--AC_ARG_ENABLE(xmltest,
--              [  --disable-xmltest       Do not try to compile and run a test LIBXML program],,
--              enable_xmltest=yes)
--
--  if test x$xml_config_exec_prefix != x ; then
--     xml_config_args="$xml_config_args"
--     if test x${XML2_CONFIG+set} != xset ; then
--        XML2_CONFIG=$xml_config_exec_prefix/bin/xml2-config
--     fi
--  fi
--  if test x$xml_config_prefix != x ; then
--     xml_config_args="$xml_config_args --prefix=$xml_config_prefix"
--     if test x${XML2_CONFIG+set} != xset ; then
--        XML2_CONFIG=$xml_config_prefix/bin/xml2-config
--     fi
--  fi
--
--  AC_PATH_PROG(XML2_CONFIG, xml2-config, no)
--  min_xml_version=ifelse([$1], ,2.0.0,[$1])
--  AC_MSG_CHECKING(for libxml - version >= $min_xml_version)
--  no_xml=""
--  if test "$XML2_CONFIG" = "no" ; then
--    no_xml=yes
--  else
--    XML_CPPFLAGS=`$XML2_CONFIG $xml_config_args --cflags`
--    XML_LIBS=`$XML2_CONFIG $xml_config_args --libs`
--    xml_config_major_version=`$XML2_CONFIG $xml_config_args --version | \
--           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\1/'`
--    xml_config_minor_version=`$XML2_CONFIG $xml_config_args --version | \
--           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\2/'`
--    xml_config_micro_version=`$XML2_CONFIG $xml_config_args --version | \
--           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\3/'`
--    if test "x$enable_xmltest" = "xyes" ; then
--      ac_save_CPPFLAGS="$CPPFLAGS"
--      ac_save_LIBS="$LIBS"
--      CPPFLAGS="$CPPFLAGS $XML_CPPFLAGS"
--      LIBS="$XML_LIBS $LIBS"
--dnl
--dnl Now check if the installed libxml is sufficiently new.
--dnl (Also sanity checks the results of xml2-config to some extent)
--dnl
--      rm -f conf.xmltest
--      AC_RUN_IFELSE(
--            [AC_LANG_SOURCE([[
--#include <stdlib.h>
--#include <stdio.h>
--#include <string.h>
--#include <libxml/xmlversion.h>
--
--int 
--main()
--{
--  int xml_major_version, xml_minor_version, xml_micro_version;
--  int major, minor, micro;
--  char *tmp_version;
--
--  system("touch conf.xmltest");
--
--  /* Capture xml2-config output via autoconf/configure variables */
--  /* HP/UX 9 (%@#!) writes to sscanf strings */
--  tmp_version = (char *)strdup("$min_xml_version");
--  if (sscanf(tmp_version, "%d.%d.%d", &major, &minor, &micro) != 3) {
--     printf("%s, bad version string from xml2-config\n", "$min_xml_version");
--     exit(1);
--   }
--   free(tmp_version);
--
--   /* Capture the version information from the header files */
--   tmp_version = (char *)strdup(LIBXML_DOTTED_VERSION);
--   if (sscanf(tmp_version, "%d.%d.%d", &xml_major_version, &xml_minor_version, &xml_micro_version) != 3) {
--     printf("%s, bad version string from libxml includes\n", "LIBXML_DOTTED_VERSION");
--     exit(1);
--   }
--   free(tmp_version);
--
-- /* Compare xml2-config output to the libxml headers */
--  if ((xml_major_version != $xml_config_major_version) ||
--      (xml_minor_version != $xml_config_minor_version) ||
--      (xml_micro_version != $xml_config_micro_version))
--    {
--      printf("*** libxml header files (version %d.%d.%d) do not match\n",
--         xml_major_version, xml_minor_version, xml_micro_version);
--      printf("*** xml2-config (version %d.%d.%d)\n",
--         $xml_config_major_version, $xml_config_minor_version, $xml_config_micro_version);
--      return 1;
--    } 
--/* Compare the headers to the library to make sure we match */
--  /* Less than ideal -- doesn't provide us with return value feedback, 
--   * only exits if there's a serious mismatch between header and library.
--   */
--    LIBXML_TEST_VERSION;
--
--    /* Test that the library is greater than our minimum version */
--    if ((xml_major_version > major) ||
--        ((xml_major_version == major) && (xml_minor_version > minor)) ||
--        ((xml_major_version == major) && (xml_minor_version == minor) &&
--        (xml_micro_version >= micro)))
--      {
--        return 0;
--       }
--     else
--      {
--        printf("\n*** An old version of libxml (%d.%d.%d) was found.\n",
--               xml_major_version, xml_minor_version, xml_micro_version);
--        printf("*** You need a version of libxml newer than %d.%d.%d.\n",
--           major, minor, micro);
--        printf("***\n");
--        printf("*** If you have already installed a sufficiently new version, this error\n");
--        printf("*** probably means that the wrong copy of the xml2-config shell script is\n");
--        printf("*** being found. The easiest way to fix this is to remove the old version\n");
--        printf("*** of LIBXML, but you can also set the XML2_CONFIG environment to point to the\n");
--        printf("*** correct copy of xml2-config. (In this case, you will have to\n");
--        printf("*** modify your LD_LIBRARY_PATH environment variable, or edit /etc/ld.so.conf\n");
--        printf("*** so that the correct libraries are found at run-time))\n");
--    }
--  return 1;
--}
--]])],, no_xml=yes,[echo $ac_n "cross compiling; assumed OK... $ac_c"])
--       CPPFLAGS="$ac_save_CPPFLAGS"
--       LIBS="$ac_save_LIBS"
--     fi
--  fi
-+AC_DEFUN([AM_PATH_XML2],[
-+  AC_REQUIRE([PKG_PROG_PKG_CONFIG])
- 
--  if test "x$no_xml" = x ; then
--     AC_MSG_RESULT(yes (version $xml_config_major_version.$xml_config_minor_version.$xml_config_micro_version))
--     ifelse([$2], , :, [$2])     
--  else
--     AC_MSG_RESULT(no)
--     if test "$XML2_CONFIG" = "no" ; then
--       echo "*** The xml2-config script installed by LIBXML could not be found"
--       echo "*** If libxml was installed in PREFIX, make sure PREFIX/bin is in"
--       echo "*** your path, or set the XML2_CONFIG environment variable to the"
--       echo "*** full path to xml2-config."
--     else
--       if test -f conf.xmltest ; then
--        :
--       else
--          echo "*** Could not run libxml test program, checking why..."
--          CPPFLAGS="$CPPFLAGS $XML_CPPFLAGS"
--          LIBS="$LIBS $XML_LIBS"
--	  AC_LINK_IFELSE(
--            [AC_LANG_PROGRAM([[
--#include <libxml/xmlversion.h>
--#include <stdio.h>
--]],    [[ LIBXML_TEST_VERSION; return 0;]])],
--        [ echo "*** The test program compiled, but did not run. This usually means"
--          echo "*** that the run-time linker is not finding LIBXML or finding the wrong"
--          echo "*** version of LIBXML. If it is not finding LIBXML, you'll need to set your"
--          echo "*** LD_LIBRARY_PATH environment variable, or edit /etc/ld.so.conf to point"
--          echo "*** to the installed location  Also, make sure you have run ldconfig if that"
--          echo "*** is required on your system"
--          echo "***"
--          echo "*** If you have an old version installed, it is best to remove it, although"
--          echo "*** you may also be able to get things to work by modifying LD_LIBRARY_PATH" ],
--        [ echo "*** The test program failed to compile or link. See the file config.log for the"
--          echo "*** exact error that occurred. This usually means LIBXML was incorrectly installed"
--          echo "*** or that you have moved LIBXML since it was installed. In the latter case, you"
--          echo "*** may want to edit the xml2-config script: $XML2_CONFIG" ])
--          CPPFLAGS="$ac_save_CPPFLAGS"
--          LIBS="$ac_save_LIBS"
--       fi
--     fi
-+  verdep=ifelse([$1], [], [], [">= $1"])
-+  PKG_CHECK_MODULES(XML, [libxml-2.0 $verdep], [$2], [$3])
- 
--     XML_CPPFLAGS=""
--     XML_LIBS=""
--     ifelse([$3], , :, [$3])
--  fi
-+  XML_CPPFLAGS=$XML_CFLAGS
-   AC_SUBST(XML_CPPFLAGS)
--  AC_SUBST(XML_LIBS)
--  rm -f conf.xmltest
- ])
--- 
-2.34.1
-
diff --git a/meta/recipes-core/libxml/libxml2_2.10.4.bb b/meta/recipes-core/libxml/libxml2_2.11.4.bb
similarity index 95%
rename from meta/recipes-core/libxml/libxml2_2.10.4.bb
rename to meta/recipes-core/libxml/libxml2_2.11.4.bb
index 4f3b17093e4..713d0baf6cc 100644
--- a/meta/recipes-core/libxml/libxml2_2.10.4.bb
+++ b/meta/recipes-core/libxml/libxml2_2.11.4.bb
@@ -15,13 +15,10 @@ inherit gnomebase
 
 SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testtar \
            file://run-ptest \
-           file://libxml-64bit.patch \
-           file://fix-tests.patch \
            file://install-tests.patch \
-           file://libxml-m4-use-pkgconfig.patch \
            "
 
-SRC_URI[archive.sha256sum] = "ed0c91c5845008f1936739e4eee2035531c1c94742c6541f44ee66d885948d45"
+SRC_URI[archive.sha256sum] = "737e1d7f8ab3f139729ca13a2494fd17bf30ddb4b7a427cf336252cab57f57f7"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 BINCONFIG = "${bindir}/xml2-config"
-- 
2.30.2


