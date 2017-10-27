Return-Path: <fan.xin@jp.fujitsu.com>
X-Greylist: delayed 675 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 27 Oct 2017 02:11:36 UTC
Received: from mgwkm01.jp.fujitsu.com (mgwkm01.jp.fujitsu.com [202.219.69.168])
	by mail.openembedded.org (Postfix) with ESMTP id B15D06E650
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Oct 2017 02:11:36 +0000 (UTC)
Received: from kw-mxauth.gw.nic.fujitsu.com (unknown [192.168.231.132]) by
	mgwkm01.jp.fujitsu.com with smtp
	id 7184_66da_facc71df_d9db_4992_8187_d59888e31077;
	Fri, 27 Oct 2017 11:00:19 +0900
Received: from g01jpfmpwyt01.exch.g01.fujitsu.local
	(g01jpfmpwyt01.exch.g01.fujitsu.local [10.128.193.38])
	by kw-mxauth.gw.nic.fujitsu.com (Postfix) with ESMTP id 494AEAC013B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Oct 2017 11:00:18 +0900 (JST)
Received: from g01jpexchyt33.g01.fujitsu.local (unknown [10.128.193.4])
	by g01jpfmpwyt01.exch.g01.fujitsu.local (Postfix) with ESMTP id
	418F86D6871 for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Oct 2017 11:00:17 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	g01jpexchyt33.g01.fujitsu.local (10.128.193.36) with Microsoft SMTP
	Server id 14.3.352.0; Fri, 27 Oct 2017 11:00:17 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Oct 2017 11:00:13 +0900
Message-ID: <1509069613-5005-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] curl: update to 7.56.1
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
X-List-Received-Date: Fri, 27 Oct 2017 02:11:37 -0000
Content-Type: text/plain

1. Update the md5sum and sha256sum for curl 7.56.1
2. Delete the following patchs which have been applied in curl 7.56.1
	CVE-2017-1000099.patch
	CVE-2017-1000100.patch
	CVE-2017-1000101.patch
3. Delete the do_install_append() due to the curl/curlbuild.h have been removed.

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 .../curl/curl/CVE-2017-1000099.patch               | 41 ---------
 .../curl/curl/CVE-2017-1000100.patch               | 51 -----------
 .../curl/curl/CVE-2017-1000101.patch               | 99 ----------------------
 .../curl/{curl_7.54.1.bb => curl_7.56.1.bb}        | 11 +--
 4 files changed, 2 insertions(+), 200 deletions(-)
 delete mode 100644 meta/recipes-support/curl/curl/CVE-2017-1000099.patch
 delete mode 100644 meta/recipes-support/curl/curl/CVE-2017-1000100.patch
 delete mode 100644 meta/recipes-support/curl/curl/CVE-2017-1000101.patch
 rename meta/recipes-support/curl/{curl_7.54.1.bb => curl_7.56.1.bb} (89%)

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
diff --git a/meta/recipes-support/curl/curl_7.54.1.bb b/meta/recipes-support/curl/curl_7.56.1.bb
similarity index 89%
rename from meta/recipes-support/curl/curl_7.54.1.bb
rename to meta/recipes-support/curl/curl_7.56.1.bb
index 04aeee7..b949cc3 100644
--- a/meta/recipes-support/curl/curl_7.54.1.bb
+++ b/meta/recipes-support/curl/curl_7.56.1.bb
@@ -7,9 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=8;md5=3a34942f4ae3fbf1a303160714e66
 
 SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
-           file://CVE-2017-1000099.patch \
-           file://CVE-2017-1000100.patch \
-           file://CVE-2017-1000101.patch \
 "
 
 # curl likes to set -g0 in CFLAGS, so we stop it
@@ -17,8 +14,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
 #
 SRC_URI += " file://configure_ac.patch"
 
-SRC_URI[md5sum] = "6b6eb722f512e7a24855ff084f54fe55"
-SRC_URI[sha256sum] = "fdfc4df2d001ee0c44ec071186e770046249263c491fcae48df0e1a3ca8f25a0"
+SRC_URI[md5sum] = "428de25834ef8c04076906d6d5c0498e"
+SRC_URI[sha256sum] = "2594670367875e7d87b0f129b5e4690150780884d90244ba0fe3e74a778b5f90"
 
 CVE_PRODUCT = "libcurl"
 inherit autotools pkgconfig binconfig multilib_header
@@ -57,10 +54,6 @@ EXTRA_OECONF = " \
     --without-libpsl \
 "
 
-do_install_append() {
-	oe_multilib_header curl/curlbuild.h
-}
-
 do_install_append_class-target() {
 	# cleanup buildpaths from curl-config
 	sed -i -e 's,${STAGING_DIR_HOST},,g' ${D}${bindir}/curl-config
-- 
2.7.4



