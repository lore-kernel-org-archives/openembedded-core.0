Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 92F4E77D9F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 03:31:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v843VAex018170
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 3 Sep 2017 20:31:10 -0700 (PDT)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Sun, 3 Sep 2017 20:31:09 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 3 Sep 2017 20:31:10 -0700
Message-ID: <20170904033110.27134-1-wenzong.fan@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [PATCH] curl: fix CVE-2017-1000099, 1000100, 1000101
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
X-List-Received-Date: Mon, 04 Sep 2017 03:31:11 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Backport upstream commits to fix:
- CVE-2017-1000099
  https://curl.haxx.se/docs/adv_20170809C.html
  https://curl.haxx.se/CVE-2017-1000099.patch

- CVE-2017-1000100
  https://curl.haxx.se/docs/adv_20170809B.html
  https://curl.haxx.se/CVE-2017-1000100.patch

- CVE-2017-1000101
  https://curl.haxx.se/docs/adv_20170809A.html
  https://curl.haxx.se/CVE-2017-1000101.patch

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../curl/curl/CVE-2017-1000099.patch               | 41 +++++++++
 .../curl/curl/CVE-2017-1000100.patch               | 51 +++++++++++
 .../curl/curl/CVE-2017-1000101.patch               | 99 ++++++++++++++++++++++
 meta/recipes-support/curl/curl_7.54.1.bb           |  3 +
 4 files changed, 194 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2017-1000099.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2017-1000100.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2017-1000101.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2017-1000099.patch b/meta/recipes-support/curl/curl/CVE-2017-1000099.patch
new file mode 100644
index 0000000000..96ff1b064b
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2017-1000099.patch
@@ -0,0 +1,41 @@
+From c9332fa5e84f24da300b42b1a931ade929d3e27d Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Tue, 1 Aug 2017 17:17:06 +0200
+Subject: [PATCH] file: output the correct buffer to the user
+
+Regression brought by 7c312f84ea930d8 (April 2017)
+
+CVE: CVE-2017-1000099
+
+Bug: https://curl.haxx.se/docs/adv_20170809C.html
+
+Credit to OSS-Fuzz for the discovery
+
+Upstream-Status: Backport
+https://github.com/curl/curl/commit/c9332fa5e84f24da300b42b1a931ade929d3e27d
+
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+---
+ lib/file.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/file.c b/lib/file.c
+index bd426eac2..666cbe75b 100644
+--- a/lib/file.c
++++ b/lib/file.c
+@@ -499,11 +499,11 @@ static CURLcode file_do(struct connectdata *conn, bool *done)
+              Curl_month[tm->tm_mon],
+              tm->tm_year + 1900,
+              tm->tm_hour,
+              tm->tm_min,
+              tm->tm_sec);
+-    result = Curl_client_write(conn, CLIENTWRITE_BOTH, buf, 0);
++    result = Curl_client_write(conn, CLIENTWRITE_BOTH, header, 0);
+     if(!result)
+       /* set the file size to make it available post transfer */
+       Curl_pgrsSetDownloadSize(data, expected_size);
+     return result;
+   }
+-- 
+2.13.3
+
diff --git a/meta/recipes-support/curl/curl/CVE-2017-1000100.patch b/meta/recipes-support/curl/curl/CVE-2017-1000100.patch
new file mode 100644
index 0000000000..f74f1dd896
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2017-1000100.patch
@@ -0,0 +1,51 @@
+From 358b2b131ad6c095696f20dcfa62b8305263f898 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Tue, 1 Aug 2017 17:16:46 +0200
+Subject: [PATCH] tftp: reject file name lengths that don't fit
+
+... and thereby avoid telling send() to send off more bytes than the
+size of the buffer!
+
+CVE: CVE-2017-1000100
+
+Bug: https://curl.haxx.se/docs/adv_20170809B.html
+Reported-by: Even Rouault
+
+Credit to OSS-Fuzz for the discovery
+
+Upstream-Status: Backport
+https://github.com/curl/curl/commit/358b2b131ad6c095696f20dcfa62b8305263f898
+
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+---
+ lib/tftp.c |    7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/lib/tftp.c b/lib/tftp.c
+index 02bd842..f6f4bce 100644
+--- a/lib/tftp.c
++++ b/lib/tftp.c
+@@ -5,7 +5,7 @@
+  *                            | (__| |_| |  _ <| |___
+  *                             \___|\___/|_| \_\_____|
+  *
+- * Copyright (C) 1998 - 2016, Daniel Stenberg, <daniel@haxx.se>, et al.
++ * Copyright (C) 1998 - 2017, Daniel Stenberg, <daniel@haxx.se>, et al.
+  *
+  * This software is licensed as described in the file COPYING, which
+  * you should have received as part of this distribution. The terms
+@@ -491,6 +491,11 @@ static CURLcode tftp_send_first(tftp_state_data_t *state, tftp_event_t event)
+     if(result)
+       return result;
+ 
++    if(strlen(filename) > (state->blksize - strlen(mode) - 4)) {
++      failf(data, "TFTP file name too long\n");
++      return CURLE_TFTP_ILLEGAL; /* too long file name field */
++    }
++
+     snprintf((char *)state->spacket.data+2,
+              state->blksize,
+              "%s%c%s%c", filename, '\0',  mode, '\0');
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-support/curl/curl/CVE-2017-1000101.patch b/meta/recipes-support/curl/curl/CVE-2017-1000101.patch
new file mode 100644
index 0000000000..c300fff00c
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2017-1000101.patch
@@ -0,0 +1,99 @@
+From 453e7a7a03a2cec749abd3878a48e728c515cca7 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Tue, 1 Aug 2017 17:16:07 +0200
+Subject: [PATCH] glob: do not continue parsing after a strtoul() overflow
+ range
+
+Added test 1289 to verify.
+
+CVE: CVE-2017-1000101
+
+Bug: https://curl.haxx.se/docs/adv_20170809A.html
+Reported-by: Brian Carpenter
+
+Upstream-Status: Backport
+https://github.com/curl/curl/commit/453e7a7a03a2cec749abd3878a48e728c515cca7
+
+Rebase the tests/data/Makefile.inc changes for curl 7.54.1.
+
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+---
+ src/tool_urlglob.c      |  5 ++++-
+ tests/data/Makefile.inc |  2 +-
+ tests/data/test1289     | 35 +++++++++++++++++++++++++++++++++++
+ 3 files changed, 40 insertions(+), 2 deletions(-)
+ create mode 100644 tests/data/test1289
+
+diff --git a/src/tool_urlglob.c b/src/tool_urlglob.c
+index 6b1ece0..d56dcd9 100644
+--- a/src/tool_urlglob.c
++++ b/src/tool_urlglob.c
+@@ -273,7 +273,10 @@ static CURLcode glob_range(URLGlob *glob, char **patternp,
+         }
+         errno = 0;
+         max_n = strtoul(pattern, &endp, 10);
+-        if(errno || (*endp == ':')) {
++        if(errno)
++          /* overflow */
++          endp = NULL;
++        else if(*endp == ':') {
+           pattern = endp+1;
+           errno = 0;
+           step_n = strtoul(pattern, &endp, 10);
+diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
+index 155320a..7adbee6 100644
+--- a/tests/data/Makefile.inc
++++ b/tests/data/Makefile.inc
+@@ -132,7 +132,7 @@ test1252 test1253 test1254 test1255 test1256 test1257 test1258 test1259 \
+ test1260 test1261 test1262 \
+ \
+ test1280 test1281 test1282 test1283 test1284 test1285 test1286 test1287 \
+-test1288 \
++test1288 test1289 \
+ \
+ test1300 test1301 test1302 test1303 test1304 test1305 test1306 test1307 \
+ test1308 test1309 test1310 test1311 test1312 test1313 test1314 test1315 \
+diff --git a/tests/data/test1289 b/tests/data/test1289
+new file mode 100644
+index 0000000..d679cc0
+--- /dev/null
++++ b/tests/data/test1289
+@@ -0,0 +1,35 @@
++<testcase>
++<info>
++<keywords>
++HTTP
++HTTP GET
++globbing
++</keywords>
++</info>
++
++#
++# Server-side
++<reply>
++</reply>
++
++# Client-side
++<client>
++<server>
++http
++</server>
++<name>
++globbing with overflow and bad syntxx
++</name>
++<command>
++http://ur%20[0-60000000000000000000
++</command>
++</client>
++
++# Verify data after the test has been "shot"
++<verify>
++# curl: (3) [globbing] bad range in column 
++<errorcode>
++3
++</errorcode>
++</verify>
++</testcase>
+-- 
+2.11.0
+
diff --git a/meta/recipes-support/curl/curl_7.54.1.bb b/meta/recipes-support/curl/curl_7.54.1.bb
index f42582a9f0..a2d2b4115d 100644
--- a/meta/recipes-support/curl/curl_7.54.1.bb
+++ b/meta/recipes-support/curl/curl_7.54.1.bb
@@ -7,6 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=8;md5=3a34942f4ae3fbf1a303160714e66
 
 SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
+           file://CVE-2017-1000099.patch \
+           file://CVE-2017-1000100.patch \
+           file://CVE-2017-1000101.patch \
 "
 
 # curl likes to set -g0 in CFLAGS, so we stop it
-- 
2.13.0


