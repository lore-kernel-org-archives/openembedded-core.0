Return-Path: <anuj.mittal@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 14BF97F117
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 04:47:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Jul 2019 21:47:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,309,1559545200"; d="scan'208";a="172069566"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga007.fm.intel.com with ESMTP; 25 Jul 2019 21:47:42 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Jul 2019 12:47:29 +0800
Message-Id: <1564116449-69248-7-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564116449-69248-1-git-send-email-anuj.mittal@intel.com>
References: <1564116449-69248-1-git-send-email-anuj.mittal@intel.com>
Subject: [warrior][PATCH 7/7] curl: fix CVE-2019-5435 CVE-2019-5436
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
X-List-Received-Date: Fri, 26 Jul 2019 04:47:42 -0000

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/curl/curl/CVE-2019-5435.patch | 266 +++++++++++++++++++++
 meta/recipes-support/curl/curl/CVE-2019-5436.patch |  30 +++
 meta/recipes-support/curl/curl_7.64.1.bb           |   2 +
 3 files changed, 298 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2019-5435.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2019-5436.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2019-5435.patch b/meta/recipes-support/curl/curl/CVE-2019-5435.patch
new file mode 100644
index 0000000..f72435f
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2019-5435.patch
@@ -0,0 +1,266 @@
+From 756380f74d58d5a877b26dc21be7b1316b617213 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 29 Apr 2019 08:00:49 +0200
+Subject: [PATCH] CURL_MAX_INPUT_LENGTH: largest acceptable string input size
+
+This limits all accepted input strings passed to libcurl to be less than
+CURL_MAX_INPUT_LENGTH (8000000) bytes, for these API calls:
+curl_easy_setopt() and curl_url_set().
+
+The 8000000 number is arbitrary picked and is meant to detect mistakes
+or abuse, not to limit actual practical use cases. By limiting the
+acceptable string lengths we also reduce the risk of integer overflows
+all over.
+
+NOTE: This does not apply to `CURLOPT_POSTFIELDS`.
+
+Test 1559 verifies.
+
+Closes #3805
+
+Upstream-Status: Backport
+CVE: CVE-2019-5435
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+
+---
+ lib/setopt.c               |  7 +++++
+ lib/urlapi.c               |  8 +++++
+ lib/urldata.h              |  4 +++
+ tests/data/Makefile.inc    |  2 +-
+ tests/data/test1559        | 44 ++++++++++++++++++++++++++
+ tests/libtest/Makefile.inc |  6 ++--
+ tests/libtest/lib1559.c    | 78 ++++++++++++++++++++++++++++++++++++++++++++++
+ 7 files changed, 146 insertions(+), 3 deletions(-)
+ create mode 100644 tests/data/test1559
+ create mode 100644 tests/libtest/lib1559.c
+
+diff --git a/lib/setopt.c b/lib/setopt.c
+index b5f74a9..edf7165 100644
+--- a/lib/setopt.c
++++ b/lib/setopt.c
+@@ -61,6 +61,13 @@ CURLcode Curl_setstropt(char **charp, const char *s)
+   if(s) {
+     char *str = strdup(s);
+ 
++    if(str) {
++      size_t len = strlen(str);
++      if(len > CURL_MAX_INPUT_LENGTH) {
++        free(str);
++        return CURLE_BAD_FUNCTION_ARGUMENT;
++      }
++    }
+     if(!str)
+       return CURLE_OUT_OF_MEMORY;
+ 
+diff --git a/lib/urlapi.c b/lib/urlapi.c
+index a19867e..822e4b3 100644
+--- a/lib/urlapi.c
++++ b/lib/urlapi.c
+@@ -642,6 +642,10 @@ static CURLUcode seturl(const char *url, CURLU *u, unsigned int flags)
+    ************************************************************/
+   /* allocate scratch area */
+   urllen = strlen(url);
++  if(urllen > CURL_MAX_INPUT_LENGTH)
++    /* excessive input length */
++    return CURLUE_MALFORMED_INPUT;
++
+   path = u->scratch = malloc(urllen * 2 + 2);
+   if(!path)
+     return CURLUE_OUT_OF_MEMORY;
+@@ -1272,6 +1276,10 @@ CURLUcode curl_url_set(CURLU *u, CURLUPart what,
+     const char *newp = part;
+     size_t nalloc = strlen(part);
+ 
++    if(nalloc > CURL_MAX_INPUT_LENGTH)
++      /* excessive input length */
++      return CURLUE_MALFORMED_INPUT;
++
+     if(urlencode) {
+       const char *i;
+       char *o;
+diff --git a/lib/urldata.h b/lib/urldata.h
+index 24187a4..049a34d 100644
+--- a/lib/urldata.h
++++ b/lib/urldata.h
+@@ -79,6 +79,10 @@
+ */
+ #define RESP_TIMEOUT (120*1000)
+ 
++/* Max string intput length is a precaution against abuse and to detect junk
++   input easier and better. */
++#define CURL_MAX_INPUT_LENGTH 8000000
++
+ #include "cookie.h"
+ #include "psl.h"
+ #include "formdata.h"
+diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
+index 2eca9c6..3dd234f 100644
+--- a/tests/data/Makefile.inc
++++ b/tests/data/Makefile.inc
+@@ -176,7 +176,7 @@ test1525 test1526 test1527 test1528 test1529 test1530 test1531 test1532 \
+ test1533 test1534 test1535 test1536 test1537 test1538 \
+ test1540 test1541 \
+ test1550 test1551 test1552 test1553 test1554 test1555 test1556 test1557 \
+-test1558          test1560 test1561 test1562 \
++test1558 test1559 test1560 test1561 test1562 \
+ \
+ test1590 test1591 test1592 \
+ \
+diff --git a/tests/data/test1559 b/tests/data/test1559
+new file mode 100644
+index 0000000..cbed6fb
+--- /dev/null
++++ b/tests/data/test1559
+@@ -0,0 +1,44 @@
++<testcase>
++<info>
++<keywords>
++CURLOPT_URL
++</keywords>
++</info>
++
++<reply>
++</reply>
++
++<client>
++<server>
++none
++</server>
++
++# require HTTP so that CURLOPT_POSTFIELDS works as assumed
++<features>
++http
++</features>
++<tool>
++lib1559
++</tool>
++
++<name>
++Set excessive URL lengths
++</name>
++</client>
++
++#
++# Verify that the test runs to completion without crashing
++<verify>
++<errorcode>
++0
++</errorcode>
++<stdout>
++CURLOPT_URL 10000000 bytes URL == 43
++CURLOPT_POSTFIELDS 10000000 bytes data == 0
++CURLUPART_URL 10000000 bytes URL == 3
++CURLUPART_SCHEME 10000000 bytes scheme == 3
++CURLUPART_USER 10000000 bytes user == 3
++</stdout>
++</verify>
++
++</testcase>
+diff --git a/tests/libtest/Makefile.inc b/tests/libtest/Makefile.inc
+index e38f481..52b51c5 100644
+--- a/tests/libtest/Makefile.inc
++++ b/tests/libtest/Makefile.inc
+@@ -31,8 +31,7 @@ noinst_PROGRAMS = chkhostname libauthretry libntlmconnect                \
+  lib1534 lib1535 lib1536 lib1537 lib1538 \
+  lib1540 lib1541 \
+  lib1550 lib1551 lib1552 lib1553 lib1554 lib1555 lib1556 lib1557 \
+- lib1558 \
+- lib1560 \
++ lib1558 lib1559 lib1560 \
+  lib1591 lib1592 \
+  lib1900 lib1905 \
+  lib2033
+@@ -529,6 +528,9 @@ lib1557_CPPFLAGS = $(AM_CPPFLAGS) -DLIB1557
+ lib1558_SOURCES = lib1558.c $(SUPPORTFILES) $(TESTUTIL) $(WARNLESS)
+ lib1558_LDADD = $(TESTUTIL_LIBS)
+ 
++lib1559_SOURCES = lib1559.c $(SUPPORTFILES) $(TESTUTIL) $(WARNLESS)
++lib1559_LDADD = $(TESTUTIL_LIBS)
++
+ lib1560_SOURCES = lib1560.c $(SUPPORTFILES) $(TESTUTIL) $(WARNLESS)
+ lib1560_LDADD = $(TESTUTIL_LIBS)
+ 
+diff --git a/tests/libtest/lib1559.c b/tests/libtest/lib1559.c
+new file mode 100644
+index 0000000..2aa3615
+--- /dev/null
++++ b/tests/libtest/lib1559.c
+@@ -0,0 +1,78 @@
++/***************************************************************************
++ *                                  _   _ ____  _
++ *  Project                     ___| | | |  _ \| |
++ *                             / __| | | | |_) | |
++ *                            | (__| |_| |  _ <| |___
++ *                             \___|\___/|_| \_\_____|
++ *
++ * Copyright (C) 1998 - 2019, Daniel Stenberg, <daniel@haxx.se>, et al.
++ *
++ * This software is licensed as described in the file COPYING, which
++ * you should have received as part of this distribution. The terms
++ * are also available at https://curl.haxx.se/docs/copyright.html.
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
++#define EXCESSIVE 10*1000*1000
++int test(char *URL)
++{
++  CURLcode res = 0;
++  CURL *curl = NULL;
++  char *longurl = malloc(EXCESSIVE);
++  CURLU *u;
++  (void)URL;
++
++  memset(longurl, 'a', EXCESSIVE);
++  longurl[EXCESSIVE-1] = 0;
++
++  global_init(CURL_GLOBAL_ALL);
++  easy_init(curl);
++
++  res = curl_easy_setopt(curl, CURLOPT_URL, longurl);
++  printf("CURLOPT_URL %d bytes URL == %d\n",
++         EXCESSIVE, (int)res);
++
++  res = curl_easy_setopt(curl, CURLOPT_POSTFIELDS, longurl);
++  printf("CURLOPT_POSTFIELDS %d bytes data == %d\n",
++         EXCESSIVE, (int)res);
++
++  u = curl_url();
++  if(u) {
++    CURLUcode uc = curl_url_set(u, CURLUPART_URL, longurl, 0);
++    printf("CURLUPART_URL %d bytes URL == %d\n",
++           EXCESSIVE, (int)uc);
++    uc = curl_url_set(u, CURLUPART_SCHEME, longurl, CURLU_NON_SUPPORT_SCHEME);
++    printf("CURLUPART_SCHEME %d bytes scheme == %d\n",
++           EXCESSIVE, (int)uc);
++    uc = curl_url_set(u, CURLUPART_USER, longurl, 0);
++    printf("CURLUPART_USER %d bytes user == %d\n",
++           EXCESSIVE, (int)uc);
++    curl_url_cleanup(u);
++  }
++
++  free(longurl);
++
++  curl_easy_cleanup(curl);
++  curl_global_cleanup();
++
++  return 0;
++
++test_cleanup:
++
++  curl_easy_cleanup(curl);
++  curl_global_cleanup();
++
++  return res; /* return the final return code */
++}
diff --git a/meta/recipes-support/curl/curl/CVE-2019-5436.patch b/meta/recipes-support/curl/curl/CVE-2019-5436.patch
new file mode 100644
index 0000000..eee26ce
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2019-5436.patch
@@ -0,0 +1,30 @@
+From 2da531b3068e22cf714f001b493a704b2e9b923f Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Fri, 3 May 2019 22:20:37 +0200
+Subject: [PATCH] tftp: use the current blksize for recvfrom()
+
+bug: https://curl.haxx.se/docs/CVE-2019-5436.html
+Reported-by: l00p3r on hackerone
+CVE-2019-5436
+
+Upstream-Status: Backport
+CVE: CVE-2019-5436
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+
+---
+ lib/tftp.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/tftp.c b/lib/tftp.c
+index 8b92b7b..289cda2 100644
+--- a/lib/tftp.c
++++ b/lib/tftp.c
+@@ -1009,7 +1009,7 @@ static CURLcode tftp_connect(struct connectdata *conn, bool *done)
+   state->sockfd = state->conn->sock[FIRSTSOCKET];
+   state->state = TFTP_STATE_START;
+   state->error = TFTP_ERR_NONE;
+-  state->blksize = TFTP_BLKSIZE_DEFAULT;
++  state->blksize = blksize;
+   state->requested_blksize = blksize;
+ 
+   ((struct sockaddr *)&state->local_addr)->sa_family =
diff --git a/meta/recipes-support/curl/curl_7.64.1.bb b/meta/recipes-support/curl/curl_7.64.1.bb
index 47c28be..00c8c5a 100644
--- a/meta/recipes-support/curl/curl_7.64.1.bb
+++ b/meta/recipes-support/curl/curl_7.64.1.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=be5d9e1419c4363f4b32037a2d3b7ffa"
 
 SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
+           file://CVE-2019-5435.patch \
+           file://CVE-2019-5436.patch \
 "
 
 SRC_URI[md5sum] = "790c101927845208a9d7e8c429ddd1b2"
-- 
2.7.4


