Return-Path: <Li.Zhou@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 89BB4607F8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Oct 2017 07:45:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v9N7jkwt003400
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Oct 2017 00:45:46 -0700
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 23 Oct 2017 00:45:45 -0700
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 23 Oct 2017 15:44:53 +0800
Message-ID: <1508744693-248151-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.75]
Subject: [PATCH] curl: Security Advisory - curl - CVE-2017-1000254
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
X-List-Received-Date: Mon, 23 Oct 2017 07:45:45 -0000
Content-Type: text/plain

Porting patch from <https://github.com/curl/curl/commit/
5ff2c5ff25750aba1a8f64fbcad8e5b891512584> to solve CVE-2017-1000254.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 .../curl/curl/CVE-2017-1000254.patch               | 138 +++++++++++++++++++++
 meta/recipes-support/curl/curl_7.54.1.bb           |   1 +
 2 files changed, 139 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2017-1000254.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2017-1000254.patch b/meta/recipes-support/curl/curl/CVE-2017-1000254.patch
new file mode 100644
index 0000000..2b0798b
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2017-1000254.patch
@@ -0,0 +1,138 @@
+From 1b2eba6f9745c064f7283e0ada8f46df9d9d6e42 Mon Sep 17 00:00:00 2001
+From: Li Zhou <li.zhou@windriver.com>
+Date: Mon, 23 Oct 2017 00:26:50 -0700
+Subject: [PATCH] FTP: zero terminate the entry path even on bad input
+
+... a single double quote could leave the entry path buffer without a zero
+terminating byte. CVE-2017-1000254
+
+Test 1152 added to verify.
+
+Reported-by: Max Dymond
+Bug: https://curl.haxx.se/docs/adv_20171004.html
+
+Upstream-Status: Backport
+CVE: CVE-2017-1000254
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ lib/ftp.c               |  7 ++++--
+ tests/data/Makefile.inc |  2 ++
+ tests/data/test1152     | 61 +++++++++++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 68 insertions(+), 2 deletions(-)
+ create mode 100644 tests/data/test1152
+
+diff --git a/lib/ftp.c b/lib/ftp.c
+index 5edec37..493dbf9 100644
+--- a/lib/ftp.c
++++ b/lib/ftp.c
+@@ -2826,6 +2826,7 @@ static CURLcode ftp_statemach_act(struct connectdata *conn)
+         const size_t buf_size = data->set.buffer_size;
+         char *dir;
+         char *store;
++        bool entry_extracted = FALSE;
+ 
+         dir = malloc(nread + 1);
+         if(!dir)
+@@ -2857,7 +2858,7 @@ static CURLcode ftp_statemach_act(struct connectdata *conn)
+               }
+               else {
+                 /* end of path */
+-                *store = '\0'; /* zero terminate */
++                entry_extracted = TRUE;
+                 break; /* get out of this loop */
+               }
+             }
+@@ -2866,7 +2867,9 @@ static CURLcode ftp_statemach_act(struct connectdata *conn)
+             store++;
+             ptr++;
+           }
+-
++          *store = '\0'; /* zero terminate */
++        }
++        if(entry_extracted) {
+           /* If the path name does not look like an absolute path (i.e.: it
+              does not start with a '/'), we probably need some server-dependent
+              adjustments. For example, this is the case when connecting to
+diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
+index 7adbee6..5284654 100644
+--- a/tests/data/Makefile.inc
++++ b/tests/data/Makefile.inc
+@@ -121,6 +121,8 @@ test1120 test1121 test1122 test1123 test1124 test1125 test1126 test1127 \
+ test1128 test1129 test1130 test1131 test1132 test1133 test1134 test1135 \
+ test1136 test1137 test1138 test1139 test1140 test1141 test1142 test1143 \
+ test1144 test1145 test1146 \
++test1152 \
++\
+ test1200 test1201 test1202 test1203 test1204 test1205 test1206 test1207 \
+ test1208 test1209 test1210 test1211 test1212 test1213 test1214 test1215 \
+ test1216 test1217 test1218 test1219 \
+diff --git a/tests/data/test1152 b/tests/data/test1152
+new file mode 100644
+index 0000000..aa8c0a7
+--- /dev/null
++++ b/tests/data/test1152
+@@ -0,0 +1,61 @@
++<testcase>
++<info>
++<keywords>
++FTP
++PASV
++LIST
++</keywords>
++</info>
++#
++# Server-side
++<reply>
++<servercmd>
++REPLY PWD 257 "just one
++</servercmd>
++
++# When doing LIST, we get the default list output hard-coded in the test
++# FTP server
++<data mode="text">
++total 20
++drwxr-xr-x   8 98       98           512 Oct 22 13:06 .
++drwxr-xr-x   8 98       98           512 Oct 22 13:06 ..
++drwxr-xr-x   2 98       98           512 May  2  1996 curl-releases
++-r--r--r--   1 0        1             35 Jul 16  1996 README
++lrwxrwxrwx   1 0        1              7 Dec  9  1999 bin -> usr/bin
++dr-xr-xr-x   2 0        1            512 Oct  1  1997 dev
++drwxrwxrwx   2 98       98           512 May 29 16:04 download.html
++dr-xr-xr-x   2 0        1            512 Nov 30  1995 etc
++drwxrwxrwx   2 98       1            512 Oct 30 14:33 pub
++dr-xr-xr-x   5 0        1            512 Oct  1  1997 usr
++</data>
++</reply>
++
++#
++# Client-side
++<client>
++<server>
++ftp
++</server>
++ <name>
++FTP with uneven quote in PWD response
++ </name>
++ <command>
++ftp://%HOSTIP:%FTPPORT/test-1152/
++</command>
++</client>
++
++#
++# Verify data after the test has been "shot"
++<verify>
++<protocol>
++USER anonymous
++PASS ftp@example.com
++PWD
++CWD test-1152
++EPSV
++TYPE A
++LIST
++QUIT
++</protocol>
++</verify>
++</testcase>
+-- 
+2.11.0
+
diff --git a/meta/recipes-support/curl/curl_7.54.1.bb b/meta/recipes-support/curl/curl_7.54.1.bb
index 04aeee7..838c482 100644
--- a/meta/recipes-support/curl/curl_7.54.1.bb
+++ b/meta/recipes-support/curl/curl_7.54.1.bb
@@ -10,6 +10,7 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://CVE-2017-1000099.patch \
            file://CVE-2017-1000100.patch \
            file://CVE-2017-1000101.patch \
+           file://CVE-2017-1000254.patch \
 "
 
 # curl likes to set -g0 in CFLAGS, so we stop it
-- 
1.9.1


