Received: from mail-ea0-f180.google.com ([209.85.215.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UOEcM-0006VF-C3
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Apr 2013 23:56:18 +0200
Received: by mail-ea0-f180.google.com with SMTP id d10so1419915eaj.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Apr 2013 14:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=k5o5TfDKRcpYrKDBzKaGkga1k7vT5M1cUkMa6d7SHfg=;
	b=Z4SDuv3PuouE8fLmkKX2eWuup9aibSM4lE/MmQe1PkADTGyk/JUSGlTORa/Jvdw9Br
	cRlTdO79oyAXC3WnXKXyGk49oVmpB5mK1knvy8RGQ299gCCf1vElqbJkkCQn+7xLysOb
	kE9wf75wqRbGQTleQmb+ayp44mxSJf/LVVHdyV79DedcV/wlhFd7UAGbRzLt891/phqa
	fpqbSxgzvAoX0JNGEMMcDmBoFmSMH5+BCANFhUCZHakxx/MWbtqHpGytTEmjoWfeM4ei
	Pw4nlcXAUBrpyJlyabuzoN+ZbbIWiaEJ17E1t41KNf82IjmrglV8tH5j1NagEeVTHyga
	Eh+g==
X-Received: by 10.14.0.73 with SMTP id 49mr23330508eea.21.1365197943649;
	Fri, 05 Apr 2013 14:39:03 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id d47sm17696642eem.9.2013.04.05.14.39.02
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 05 Apr 2013 14:39:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Apr 2013 23:39:00 +0200
Message-Id: <1365197940-3345-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [PATCH] curl: backport patch to fix segfaults
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Apr 2013 21:56:19 -0000

* e.g. ecore, efreet segfault a lot without this patch

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...inter-reference-when-closing-an-unused-mu.patch | 170 +++++++++++++++++++++
 meta/recipes-support/curl/curl_7.29.0.bb           |   3 +-
 2 files changed, 172 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/curl/curl/0001-Fix-NULL-pointer-reference-when-closing-an-unused-mu.patch

diff --git a/meta/recipes-support/curl/curl/0001-Fix-NULL-pointer-reference-when-closing-an-unused-mu.patch b/meta/recipes-support/curl/curl/0001-Fix-NULL-pointer-reference-when-closing-an-unused-mu.patch
new file mode 100644
index 0000000..914024e
--- /dev/null
+++ b/meta/recipes-support/curl/curl/0001-Fix-NULL-pointer-reference-when-closing-an-unused-mu.patch
@@ -0,0 +1,170 @@
+From 5887472e49ce6c14590760f0650775653045abb5 Mon Sep 17 00:00:00 2001
+From: Linus Nielsen Feltzing <linus@haxx.se>
+Date: Sun, 10 Feb 2013 22:57:58 +0100
+Subject: [PATCH] Fix NULL pointer reference when closing an unused multi
+ handle.
+
+Upstream-Status: Backport
+https://github.com/bagder/curl/commit/da3fc1ee91de656a30f3a12de394bcba55119872
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+---
+ lib/multi.c                |  8 +++++---
+ tests/data/Makefile.am     |  2 +-
+ tests/data/test1508        | 31 +++++++++++++++++++++++++++++
+ tests/libtest/Makefile.inc |  6 +++++-
+ tests/libtest/lib1508.c    | 49 ++++++++++++++++++++++++++++++++++++++++++++++
+ 5 files changed, 91 insertions(+), 5 deletions(-)
+ create mode 100644 tests/data/test1508
+ create mode 100644 tests/libtest/lib1508.c
+
+diff --git a/lib/multi.c b/lib/multi.c
+index fa0afb9..706df23 100644
+--- a/lib/multi.c
++++ b/lib/multi.c
+@@ -1773,10 +1773,12 @@ CURLMcode curl_multi_cleanup(CURLM *multi_handle)
+     /* Close all the connections in the connection cache */
+     close_all_connections(multi);
+ 
+-    multi->closure_handle->dns.hostcache = multi->hostcache;
+-    Curl_hostcache_clean(multi->closure_handle);
++    if(multi->closure_handle) {
++      multi->closure_handle->dns.hostcache = multi->hostcache;
++      Curl_hostcache_clean(multi->closure_handle);
+ 
+-    Curl_close(multi->closure_handle);
++      Curl_close(multi->closure_handle);
++    }
+     multi->closure_handle = NULL;
+ 
+     Curl_hash_destroy(multi->sockhash);
+diff --git a/tests/data/Makefile.am b/tests/data/Makefile.am
+index d82534d..9f569a3 100644
+--- a/tests/data/Makefile.am
++++ b/tests/data/Makefile.am
+@@ -93,7 +93,7 @@ test1379 test1380 test1381 test1382 test1383 test1384 test1385 test1386 \
+ test1387 test1388 test1389 test1390 test1391 test1392 test1393 \
+ test1400 test1401 test1402 test1403 test1404 test1405 test1406 test1407 \
+ test1408 test1409 test1410 test1411 test1412 test1413 \
+-test1500 test1501 test1502 test1503 test1504 test1505 test1506 \
++test1500 test1501 test1502 test1503 test1504 test1505 test1506 test1508 \
+ test2000 test2001 test2002 test2003 test2004 test2005 test2006 test2007 \
+ test2008 test2009 test2010 test2011 test2012 test2013 test2014 test2015 \
+ test2016 test2017 test2018 test2019 test2020 test2021 test2022 \
+diff --git a/tests/data/test1508 b/tests/data/test1508
+new file mode 100644
+index 0000000..f8607e5
+--- /dev/null
++++ b/tests/data/test1508
+@@ -0,0 +1,31 @@
++<testcase>
++<info>
++<keywords>
++HTTP
++multi
++</keywords>
++</info>
++
++# Client-side
++<client>
++<server>
++none
++</server>
++<tool>
++lib1508
++</tool>
++ <name>
++Close a multi handle without using it
++ </name>
++ <command>
++http://%HOSTIP:%HTTPPORT/path/1508
++</command>
++</client>
++
++# Verify data after the test has been "shot"
++<verify>
++<file name="log/stdout1508" mode="text">
++We are done
++</file>
++</verify>
++</testcase>
+diff --git a/tests/libtest/Makefile.inc b/tests/libtest/Makefile.inc
+index 82c265d..8bf2be4 100644
+--- a/tests/libtest/Makefile.inc
++++ b/tests/libtest/Makefile.inc
+@@ -23,7 +23,7 @@ noinst_PROGRAMS = chkhostname libauthretry libntlmconnect \
+                 lib582 lib583        lib585 lib586 lib587               \
+   lib590 lib591                                    lib597 lib598 lib599 \
+   \
+-  lib1500 lib1501 lib1502 lib1503 lib1504 lib1505 lib1506
++  lib1500 lib1501 lib1502 lib1503 lib1504 lib1505 lib1506 lib1508
+ 
+ chkhostname_SOURCES = chkhostname.c ../../lib/curl_gethostname.c
+ chkhostname_LDADD = @CURL_NETWORK_LIBS@
+@@ -312,3 +312,7 @@ lib1505_CPPFLAGS = $(AM_CPPFLAGS) -DLIB1505
+ lib1506_SOURCES = lib1506.c $(SUPPORTFILES) $(TESTUTIL) $(WARNLESS)
+ lib1506_LDADD = $(TESTUTIL_LIBS)
+ lib1506_CPPFLAGS = $(AM_CPPFLAGS) -DLIB1506
++
++lib1508_SOURCES = lib1508.c $(SUPPORTFILES) $(TESTUTIL) $(WARNLESS)
++lib1508_LDADD = $(TESTUTIL_LIBS)
++lib1508_CPPFLAGS = $(AM_CPPFLAGS) -DLIB1508
+diff --git a/tests/libtest/lib1508.c b/tests/libtest/lib1508.c
+new file mode 100644
+index 0000000..72f26d1
+--- /dev/null
++++ b/tests/libtest/lib1508.c
+@@ -0,0 +1,49 @@
++/***************************************************************************
++ *                                  _   _ ____  _
++ *  Project                     ___| | | |  _ \| |
++ *                             / __| | | | |_) | |
++ *                            | (__| |_| |  _ <| |___
++ *                             \___|\___/|_| \_\_____|
++ *
++ * Copyright (C) 2013, Linus Nielsen Feltzing <linus@haxx.se>
++ *
++ * This software is licensed as described in the file COPYING, which
++ * you should have received as part of this distribution. The terms
++ * are also available at http://curl.haxx.se/docs/copyright.html.
++ *
++ * You may opt to use, copy, modify, merge, publish, distribute and/or sell
++ * copies of the Software, and permit persons to whom the Software is
++ * furnished to do so, under the terms of the COPYING file.
++ *
++ * This software is distributed on an "AS IS" basis, WITHOUT WARRANTY OF ANY
++ * KIND, either express or implied.
++ *
++ ***************************************************************************/
++#include "test.h"
++
++#include "testutil.h"
++#include "warnless.h"
++#include "memdebug.h"
++
++int test(char *URL)
++{
++  int res = 0;
++  CURLM *m = NULL;
++
++  (void)URL;
++
++  global_init(CURL_GLOBAL_ALL);
++
++  multi_init(m);
++
++test_cleanup:
++
++  /* proper cleanup sequence - type PB */
++
++  curl_multi_cleanup(m);
++  curl_global_cleanup();
++
++  printf("We are done\n");
++
++  return res;
++}
+-- 
+1.8.1.5
+
diff --git a/meta/recipes-support/curl/curl_7.29.0.bb b/meta/recipes-support/curl/curl_7.29.0.bb
index 01ffeca..3669cb8 100644
--- a/meta/recipes-support/curl/curl_7.29.0.bb
+++ b/meta/recipes-support/curl/curl_7.29.0.bb
@@ -8,10 +8,11 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=7;md5=3a34942f4ae3fbf1a303160714e66
 DEPENDS = "zlib gnutls"
 DEPENDS_class-native = "zlib-native openssl-native"
 DEPENDS_class-nativesdk = "nativesdk-zlib"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://pkgconfig_fix.patch \
+           file://0001-Fix-NULL-pointer-reference-when-closing-an-unused-mu.patch \
 "
 
 # curl likes to set -g0 in CFLAGS, so we stop it
-- 
1.8.1.5



