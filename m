Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9261C7871D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jan 2018 03:01:31 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="35796239"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Jan 2018 11:01:29 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 19E6148AE82D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jan 2018 11:01:28 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Wed, 24 Jan 2018 11:01:26 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 24 Jan 2018 11:01:36 +0800
Message-ID: <1516762897-11869-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 19E6148AE82D.AAD7E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] curl: 7.54.1 -> 7.57.0
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
X-List-Received-Date: Wed, 24 Jan 2018 03:01:33 -0000
Content-Type: text/plain

1.Upgrade curl from 7.54.1 to 7.57.0.
2.Delete CVE-2017-1000099.patch, CVE-2017-1000100.patch, CVE-2017-1000101.patch, CVE-2017-1000254.patch, reproducible-mkhelp.patch, since it is integrated upstream.
3.Remove "do_install_append()" from curl_7.57.0.bb, since curl/curlbuild.h has been removed.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../curl/curl/CVE-2017-1000099.patch               |  41 ------
 .../curl/curl/CVE-2017-1000100.patch               |  51 --------
 .../curl/curl/CVE-2017-1000101.patch               |  99 ---------------
 .../curl/curl/CVE-2017-1000254.patch               | 138 ---------------------
 .../curl/curl/reproducible-mkhelp.patch            |  32 -----
 .../curl/{curl_7.54.1.bb => curl_7.57.0.bb}        |  14 +--
 6 files changed, 2 insertions(+), 373 deletions(-)
 delete mode 100644 meta/recipes-support/curl/curl/CVE-2017-1000099.patch
 delete mode 100644 meta/recipes-support/curl/curl/CVE-2017-1000100.patch
 delete mode 100644 meta/recipes-support/curl/curl/CVE-2017-1000101.patch
 delete mode 100644 meta/recipes-support/curl/curl/CVE-2017-1000254.patch
 delete mode 100644 meta/recipes-support/curl/curl/reproducible-mkhelp.patch
 rename meta/recipes-support/curl/{curl_7.54.1.bb => curl_7.57.0.bb} (86%)

diff --git a/meta/recipes-support/curl/curl/CVE-2017-1000099.patch b/meta/recipes-support/curl/curl/CVE-2017-1000099.patch
deleted file mode 100644
index 96ff1b0..0000000
--- a/meta/recipes-support/curl/curl/CVE-2017-1000099.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From c9332fa5e84f24da300b42b1a931ade929d3e27d Mon Sep 17 00:00:00 2001
-From: Even Rouault <even.rouault@spatialys.com>
-Date: Tue, 1 Aug 2017 17:17:06 +0200
-Subject: [PATCH] file: output the correct buffer to the user
-
-Regression brought by 7c312f84ea930d8 (April 2017)
-
-CVE: CVE-2017-1000099
-
-Bug: https://curl.haxx.se/docs/adv_20170809C.html
-
-Credit to OSS-Fuzz for the discovery
-
-Upstream-Status: Backport
-https://github.com/curl/curl/commit/c9332fa5e84f24da300b42b1a931ade929d3e27d
-
-Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
----
- lib/file.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/file.c b/lib/file.c
-index bd426eac2..666cbe75b 100644
---- a/lib/file.c
-+++ b/lib/file.c
-@@ -499,11 +499,11 @@ static CURLcode file_do(struct connectdata *conn, bool *done)
-              Curl_month[tm->tm_mon],
-              tm->tm_year + 1900,
-              tm->tm_hour,
-              tm->tm_min,
-              tm->tm_sec);
--    result = Curl_client_write(conn, CLIENTWRITE_BOTH, buf, 0);
-+    result = Curl_client_write(conn, CLIENTWRITE_BOTH, header, 0);
-     if(!result)
-       /* set the file size to make it available post transfer */
-       Curl_pgrsSetDownloadSize(data, expected_size);
-     return result;
-   }
--- 
-2.13.3
-
diff --git a/meta/recipes-support/curl/curl/CVE-2017-1000100.patch b/meta/recipes-support/curl/curl/CVE-2017-1000100.patch
deleted file mode 100644
index f74f1dd..0000000
--- a/meta/recipes-support/curl/curl/CVE-2017-1000100.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 358b2b131ad6c095696f20dcfa62b8305263f898 Mon Sep 17 00:00:00 2001
-From: Daniel Stenberg <daniel@haxx.se>
-Date: Tue, 1 Aug 2017 17:16:46 +0200
-Subject: [PATCH] tftp: reject file name lengths that don't fit
-
-... and thereby avoid telling send() to send off more bytes than the
-size of the buffer!
-
-CVE: CVE-2017-1000100
-
-Bug: https://curl.haxx.se/docs/adv_20170809B.html
-Reported-by: Even Rouault
-
-Credit to OSS-Fuzz for the discovery
-
-Upstream-Status: Backport
-https://github.com/curl/curl/commit/358b2b131ad6c095696f20dcfa62b8305263f898
-
-Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
----
- lib/tftp.c |    7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/lib/tftp.c b/lib/tftp.c
-index 02bd842..f6f4bce 100644
---- a/lib/tftp.c
-+++ b/lib/tftp.c
-@@ -5,7 +5,7 @@
-  *                            | (__| |_| |  _ <| |___
-  *                             \___|\___/|_| \_\_____|
-  *
-- * Copyright (C) 1998 - 2016, Daniel Stenberg, <daniel@haxx.se>, et al.
-+ * Copyright (C) 1998 - 2017, Daniel Stenberg, <daniel@haxx.se>, et al.
-  *
-  * This software is licensed as described in the file COPYING, which
-  * you should have received as part of this distribution. The terms
-@@ -491,6 +491,11 @@ static CURLcode tftp_send_first(tftp_state_data_t *state, tftp_event_t event)
-     if(result)
-       return result;
- 
-+    if(strlen(filename) > (state->blksize - strlen(mode) - 4)) {
-+      failf(data, "TFTP file name too long\n");
-+      return CURLE_TFTP_ILLEGAL; /* too long file name field */
-+    }
-+
-     snprintf((char *)state->spacket.data+2,
-              state->blksize,
-              "%s%c%s%c", filename, '\0',  mode, '\0');
--- 
-1.7.9.5
-
diff --git a/meta/recipes-support/curl/curl/CVE-2017-1000101.patch b/meta/recipes-support/curl/curl/CVE-2017-1000101.patch
deleted file mode 100644
index c300fff..0000000
--- a/meta/recipes-support/curl/curl/CVE-2017-1000101.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From 453e7a7a03a2cec749abd3878a48e728c515cca7 Mon Sep 17 00:00:00 2001
-From: Daniel Stenberg <daniel@haxx.se>
-Date: Tue, 1 Aug 2017 17:16:07 +0200
-Subject: [PATCH] glob: do not continue parsing after a strtoul() overflow
- range
-
-Added test 1289 to verify.
-
-CVE: CVE-2017-1000101
-
-Bug: https://curl.haxx.se/docs/adv_20170809A.html
-Reported-by: Brian Carpenter
-
-Upstream-Status: Backport
-https://github.com/curl/curl/commit/453e7a7a03a2cec749abd3878a48e728c515cca7
-
-Rebase the tests/data/Makefile.inc changes for curl 7.54.1.
-
-Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
----
- src/tool_urlglob.c      |  5 ++++-
- tests/data/Makefile.inc |  2 +-
- tests/data/test1289     | 35 +++++++++++++++++++++++++++++++++++
- 3 files changed, 40 insertions(+), 2 deletions(-)
- create mode 100644 tests/data/test1289
-
-diff --git a/src/tool_urlglob.c b/src/tool_urlglob.c
-index 6b1ece0..d56dcd9 100644
---- a/src/tool_urlglob.c
-+++ b/src/tool_urlglob.c
-@@ -273,7 +273,10 @@ static CURLcode glob_range(URLGlob *glob, char **patternp,
-         }
-         errno = 0;
-         max_n = strtoul(pattern, &endp, 10);
--        if(errno || (*endp == ':')) {
-+        if(errno)
-+          /* overflow */
-+          endp = NULL;
-+        else if(*endp == ':') {
-           pattern = endp+1;
-           errno = 0;
-           step_n = strtoul(pattern, &endp, 10);
-diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
-index 155320a..7adbee6 100644
---- a/tests/data/Makefile.inc
-+++ b/tests/data/Makefile.inc
-@@ -132,7 +132,7 @@ test1252 test1253 test1254 test1255 test1256 test1257 test1258 test1259 \
- test1260 test1261 test1262 \
- \
- test1280 test1281 test1282 test1283 test1284 test1285 test1286 test1287 \
--test1288 \
-+test1288 test1289 \
- \
- test1300 test1301 test1302 test1303 test1304 test1305 test1306 test1307 \
- test1308 test1309 test1310 test1311 test1312 test1313 test1314 test1315 \
-diff --git a/tests/data/test1289 b/tests/data/test1289
-new file mode 100644
-index 0000000..d679cc0
---- /dev/null
-+++ b/tests/data/test1289
-@@ -0,0 +1,35 @@
-+<testcase>
-+<info>
-+<keywords>
-+HTTP
-+HTTP GET
-+globbing
-+</keywords>
-+</info>
-+
-+#
-+# Server-side
-+<reply>
-+</reply>
-+
-+# Client-side
-+<client>
-+<server>
-+http
-+</server>
-+<name>
-+globbing with overflow and bad syntxx
-+</name>
-+<command>
-+http://ur%20[0-60000000000000000000
-+</command>
-+</client>
-+
-+# Verify data after the test has been "shot"
-+<verify>
-+# curl: (3) [globbing] bad range in column 
-+<errorcode>
-+3
-+</errorcode>
-+</verify>
-+</testcase>
--- 
-2.11.0
-
diff --git a/meta/recipes-support/curl/curl/CVE-2017-1000254.patch b/meta/recipes-support/curl/curl/CVE-2017-1000254.patch
deleted file mode 100644
index 2b0798b..0000000
--- a/meta/recipes-support/curl/curl/CVE-2017-1000254.patch
+++ /dev/null
@@ -1,138 +0,0 @@
-From 1b2eba6f9745c064f7283e0ada8f46df9d9d6e42 Mon Sep 17 00:00:00 2001
-From: Li Zhou <li.zhou@windriver.com>
-Date: Mon, 23 Oct 2017 00:26:50 -0700
-Subject: [PATCH] FTP: zero terminate the entry path even on bad input
-
-... a single double quote could leave the entry path buffer without a zero
-terminating byte. CVE-2017-1000254
-
-Test 1152 added to verify.
-
-Reported-by: Max Dymond
-Bug: https://curl.haxx.se/docs/adv_20171004.html
-
-Upstream-Status: Backport
-CVE: CVE-2017-1000254
-Signed-off-by: Li Zhou <li.zhou@windriver.com>
----
- lib/ftp.c               |  7 ++++--
- tests/data/Makefile.inc |  2 ++
- tests/data/test1152     | 61 +++++++++++++++++++++++++++++++++++++++++++++++++
- 3 files changed, 68 insertions(+), 2 deletions(-)
- create mode 100644 tests/data/test1152
-
-diff --git a/lib/ftp.c b/lib/ftp.c
-index 5edec37..493dbf9 100644
---- a/lib/ftp.c
-+++ b/lib/ftp.c
-@@ -2826,6 +2826,7 @@ static CURLcode ftp_statemach_act(struct connectdata *conn)
-         const size_t buf_size = data->set.buffer_size;
-         char *dir;
-         char *store;
-+        bool entry_extracted = FALSE;
- 
-         dir = malloc(nread + 1);
-         if(!dir)
-@@ -2857,7 +2858,7 @@ static CURLcode ftp_statemach_act(struct connectdata *conn)
-               }
-               else {
-                 /* end of path */
--                *store = '\0'; /* zero terminate */
-+                entry_extracted = TRUE;
-                 break; /* get out of this loop */
-               }
-             }
-@@ -2866,7 +2867,9 @@ static CURLcode ftp_statemach_act(struct connectdata *conn)
-             store++;
-             ptr++;
-           }
--
-+          *store = '\0'; /* zero terminate */
-+        }
-+        if(entry_extracted) {
-           /* If the path name does not look like an absolute path (i.e.: it
-              does not start with a '/'), we probably need some server-dependent
-              adjustments. For example, this is the case when connecting to
-diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
-index 7adbee6..5284654 100644
---- a/tests/data/Makefile.inc
-+++ b/tests/data/Makefile.inc
-@@ -121,6 +121,8 @@ test1120 test1121 test1122 test1123 test1124 test1125 test1126 test1127 \
- test1128 test1129 test1130 test1131 test1132 test1133 test1134 test1135 \
- test1136 test1137 test1138 test1139 test1140 test1141 test1142 test1143 \
- test1144 test1145 test1146 \
-+test1152 \
-+\
- test1200 test1201 test1202 test1203 test1204 test1205 test1206 test1207 \
- test1208 test1209 test1210 test1211 test1212 test1213 test1214 test1215 \
- test1216 test1217 test1218 test1219 \
-diff --git a/tests/data/test1152 b/tests/data/test1152
-new file mode 100644
-index 0000000..aa8c0a7
---- /dev/null
-+++ b/tests/data/test1152
-@@ -0,0 +1,61 @@
-+<testcase>
-+<info>
-+<keywords>
-+FTP
-+PASV
-+LIST
-+</keywords>
-+</info>
-+#
-+# Server-side
-+<reply>
-+<servercmd>
-+REPLY PWD 257 "just one
-+</servercmd>
-+
-+# When doing LIST, we get the default list output hard-coded in the test
-+# FTP server
-+<data mode="text">
-+total 20
-+drwxr-xr-x   8 98       98           512 Oct 22 13:06 .
-+drwxr-xr-x   8 98       98           512 Oct 22 13:06 ..
-+drwxr-xr-x   2 98       98           512 May  2  1996 curl-releases
-+-r--r--r--   1 0        1             35 Jul 16  1996 README
-+lrwxrwxrwx   1 0        1              7 Dec  9  1999 bin -> usr/bin
-+dr-xr-xr-x   2 0        1            512 Oct  1  1997 dev
-+drwxrwxrwx   2 98       98           512 May 29 16:04 download.html
-+dr-xr-xr-x   2 0        1            512 Nov 30  1995 etc
-+drwxrwxrwx   2 98       1            512 Oct 30 14:33 pub
-+dr-xr-xr-x   5 0        1            512 Oct  1  1997 usr
-+</data>
-+</reply>
-+
-+#
-+# Client-side
-+<client>
-+<server>
-+ftp
-+</server>
-+ <name>
-+FTP with uneven quote in PWD response
-+ </name>
-+ <command>
-+ftp://%HOSTIP:%FTPPORT/test-1152/
-+</command>
-+</client>
-+
-+#
-+# Verify data after the test has been "shot"
-+<verify>
-+<protocol>
-+USER anonymous
-+PASS ftp@example.com
-+PWD
-+CWD test-1152
-+EPSV
-+TYPE A
-+LIST
-+QUIT
-+</protocol>
-+</verify>
-+</testcase>
--- 
-2.11.0
-
diff --git a/meta/recipes-support/curl/curl/reproducible-mkhelp.patch b/meta/recipes-support/curl/curl/reproducible-mkhelp.patch
deleted file mode 100644
index 268bbeb..0000000
--- a/meta/recipes-support/curl/curl/reproducible-mkhelp.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 1fe92fd3dd64c7228f6ff41e3fc16c4f2392471a Mon Sep 17 00:00:00 2001
-From: Juro Bystricky <juro.bystricky@intel.com>
-Date: Fri, 27 Oct 2017 08:28:25 -0700
-Subject: mkhelp.pl: support reproducible build
-
-Do not generate line with the current date, such as:
-
-* Generation time: Tue Oct-24 18:01:41 2017
-
-This will improve reproducibility. The generated string is only
-part of a comment, so there should be no adverse consequences.
-
-Upstream-Status: Submitted [ https://github.com/curl/curl/pull/2026 ]
-
-Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
-
-diff --git a/src/mkhelp.pl b/src/mkhelp.pl
-index 270daa2..757f024 100755
---- a/src/mkhelp.pl
-+++ b/src/mkhelp.pl
-@@ -102,11 +102,9 @@ while(<READ>) {
- }
- close(READ);
- 
--$now = localtime;
- print <<HEAD
- /*
-  * NEVER EVER edit this manually, fix the mkhelp.pl script instead!
-- * Generation time: $now
-  */
- #ifdef USE_MANUAL
- #include "tool_hugehelp.h"
diff --git a/meta/recipes-support/curl/curl_7.54.1.bb b/meta/recipes-support/curl/curl_7.57.0.bb
similarity index 86%
rename from meta/recipes-support/curl/curl_7.54.1.bb
rename to meta/recipes-support/curl/curl_7.57.0.bb
index 58f0531..47e3d45 100644
--- a/meta/recipes-support/curl/curl_7.54.1.bb
+++ b/meta/recipes-support/curl/curl_7.57.0.bb
@@ -7,23 +7,16 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=8;md5=3a34942f4ae3fbf1a303160714e66
 
 SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
-           file://CVE-2017-1000099.patch \
-           file://CVE-2017-1000100.patch \
-           file://CVE-2017-1000101.patch \
-           file://CVE-2017-1000254.patch \
 "
 
-SRC_URI_append_class-target = " \
-           file://reproducible-mkhelp.patch \
-"
 
 # curl likes to set -g0 in CFLAGS, so we stop it
 # from mucking around with debug options
 #
 SRC_URI += " file://configure_ac.patch"
 
-SRC_URI[md5sum] = "6b6eb722f512e7a24855ff084f54fe55"
-SRC_URI[sha256sum] = "fdfc4df2d001ee0c44ec071186e770046249263c491fcae48df0e1a3ca8f25a0"
+SRC_URI[md5sum] = "dd3e22e923be17663e67f721c2aec054"
+SRC_URI[sha256sum] = "c92fe31a348eae079121b73884065e600c533493eb50f1f6cee9c48a3f454826"
 
 CVE_PRODUCT = "libcurl"
 inherit autotools pkgconfig binconfig multilib_header
@@ -64,9 +57,6 @@ EXTRA_OECONF = " \
     --without-libpsl \
 "
 
-do_install_append() {
-	oe_multilib_header curl/curlbuild.h
-}
 
 do_install_append_class-target() {
 	# cleanup buildpaths from curl-config
-- 
2.7.4




