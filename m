Return-Path: <sona.sarmadi@enea.com>
Received: from smtp-out11.electric.net (smtp-out11.electric.net
	[185.38.181.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9555371A9B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2016 09:49:16 +0000 (UTC)
Received: from 1c58ST-0005ty-Vw by out11c.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1c58SU-0005uW-T2
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Nov 2016 01:49:17 -0800
Received: by emcmailer; Fri, 11 Nov 2016 01:49:17 -0800
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out11c.electric.net with esmtps (TLSv1:AES128-SHA:128) (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1c58ST-0005ty-Vw
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Nov 2016 01:49:17 -0800
Received: from sestofb11.enea.se (172.21.3.152) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 11 Nov 2016 10:49:17 +0100
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 11 Nov 2016 10:49:09 +0100
Message-ID: <1478857754-61379-7-git-send-email-sona.sarmadi@enea.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1478857754-61379-1-git-send-email-sona.sarmadi@enea.com>
References: <1478857754-61379-1-git-send-email-sona.sarmadi@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: sona.sarmadi@enea.com does not
	designate permitted sender hosts)
X-Outbound-IP: 192.36.1.72
X-Env-From: sona.sarmadi@enea.com
X-Proto: esmtps
X-Revdns: mx-3.enea.com
X-HELO: mx-3.enea.com
X-TLS: TLSv1:AES128-SHA:128
X-Authenticated_ID: 
X-PolicySMART: 6551647
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (s)
Cc: sona@enea.se
Subject: [PATCH][krogoth 07/12] curl: CVE-2016-8621
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
X-List-Received-Date: Fri, 11 Nov 2016 09:49:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

curl_getdate read out of bounds

Affected versions: curl 7.12.2 to and including 7.50.3
Reference:
https://curl.haxx.se/docs/adv_20161102G.html

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
---
 meta/recipes-support/curl/curl/CVE-2016-8621.patch | 120 +++++++++++++++++++++
 meta/recipes-support/curl/curl_7.47.1.bb           |   1 +
 2 files changed, 121 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-8621.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2016-8621.patch b/meta/recipes-support/curl/curl/CVE-2016-8621.patch
new file mode 100644
index 0000000..7345838
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2016-8621.patch
@@ -0,0 +1,120 @@
+From 8a6d9ded5f02f0294ae63a007e26087316c1998e Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Tue, 4 Oct 2016 16:59:38 +0200
+Subject: [PATCH] parsedate: handle cut off numbers better
+
+... and don't read outside of the given buffer!
+
+CVE: CVE-2016-8621
+Upstream-Status: Backport
+
+bug: https://curl.haxx.se/docs/adv_20161102G.html
+Reported-by: Luật Nguyễn
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+---
+ lib/parsedate.c        | 12 +++++++-----
+ tests/data/test517     |  6 ++++++
+ tests/libtest/lib517.c |  8 +++++++-
+ 3 files changed, 20 insertions(+), 6 deletions(-)
+
+diff --git a/lib/parsedate.c b/lib/parsedate.c
+index dfcf855..8e932f4 100644
+--- a/lib/parsedate.c
++++ b/lib/parsedate.c
+@@ -3,11 +3,11 @@
+  *  Project                     ___| | | |  _ \| |
+  *                             / __| | | | |_) | |
+  *                            | (__| |_| |  _ <| |___
+  *                             \___|\___/|_| \_\_____|
+  *
+- * Copyright (C) 1998 - 2014, Daniel Stenberg, <daniel@haxx.se>, et al.
++ * Copyright (C) 1998 - 2016, Daniel Stenberg, <daniel@haxx.se>, et al.
+  *
+  * This software is licensed as described in the file COPYING, which
+  * you should have received as part of this distribution. The terms
+  * are also available at https://curl.haxx.se/docs/copyright.html.
+  *
+@@ -384,19 +384,21 @@ static int parsedate(const char *date, time_t *output)
+     }
+     else if(ISDIGIT(*date)) {
+       /* a digit */
+       int val;
+       char *end;
++      int len=0;
+       if((secnum == -1) &&
+-         (3 == sscanf(date, "%02d:%02d:%02d", &hournum, &minnum, &secnum))) {
++         (3 == sscanf(date, "%02d:%02d:%02d%n",
++                      &hournum, &minnum, &secnum, &len))) {
+         /* time stamp! */
+-        date += 8;
++        date += len;
+       }
+       else if((secnum == -1) &&
+-              (2 == sscanf(date, "%02d:%02d", &hournum, &minnum))) {
++              (2 == sscanf(date, "%02d:%02d%n", &hournum, &minnum, &len))) {
+         /* time stamp without seconds */
+-        date += 5;
++        date += len;
+         secnum = 0;
+       }
+       else {
+         long lval;
+         int error;
+diff --git a/tests/data/test517 b/tests/data/test517
+index c81a45e..513634f 100644
+--- a/tests/data/test517
++++ b/tests/data/test517
+@@ -114,10 +114,16 @@ nothing
+ 79: 20110632 12:34:56 => -1
+ 80: 20110623 56:34:56 => -1
+ 81: 20111323 12:34:56 => -1
+ 82: 20110623 12:34:79 => -1
+ 83: Wed, 31 Dec 2008 23:59:60 GMT => 1230768000
++84: 20110623 12:3 => 1308830580
++85: 20110623 1:3 => 1308790980
++86: 20110623 1:30 => 1308792600
++87: 20110623 12:12:3 => 1308831123
++88: 20110623 01:12:3 => 1308791523
++89: 20110623 01:99:30 => -1
+ </stdout>
+ 
+ # This test case previously tested an overflow case ("2094 Nov 6 =>
+ # 2147483647") for 32bit time_t, but since some systems have 64bit time_t and
+ # handles this (returning 3939840000), and some 64bit-time_t systems don't
+diff --git a/tests/libtest/lib517.c b/tests/libtest/lib517.c
+index 2f68ebd..22162ff 100644
+--- a/tests/libtest/lib517.c
++++ b/tests/libtest/lib517.c
+@@ -3,11 +3,11 @@
+  *  Project                     ___| | | |  _ \| |
+  *                             / __| | | | |_) | |
+  *                            | (__| |_| |  _ <| |___
+  *                             \___|\___/|_| \_\_____|
+  *
+- * Copyright (C) 1998 - 2011, Daniel Stenberg, <daniel@haxx.se>, et al.
++ * Copyright (C) 1998 - 2016, Daniel Stenberg, <daniel@haxx.se>, et al.
+  *
+  * This software is licensed as described in the file COPYING, which
+  * you should have received as part of this distribution. The terms
+  * are also available at https://curl.haxx.se/docs/copyright.html.
+  *
+@@ -114,10 +114,16 @@ static const char * const dates[]={
+   "20110632 12:34:56",
+   "20110623 56:34:56",
+   "20111323 12:34:56",
+   "20110623 12:34:79",
+   "Wed, 31 Dec 2008 23:59:60 GMT", /* leap second */
++  "20110623 12:3",
++  "20110623 1:3",
++  "20110623 1:30",
++  "20110623 12:12:3",
++  "20110623 01:12:3",
++  "20110623 01:99:30",
+   NULL
+ };
+ 
+ int test(char *URL)
+ {
+-- 
+2.9.3
+
diff --git a/meta/recipes-support/curl/curl_7.47.1.bb b/meta/recipes-support/curl/curl_7.47.1.bb
index e6ad03f..67b07da 100644
--- a/meta/recipes-support/curl/curl_7.47.1.bb
+++ b/meta/recipes-support/curl/curl_7.47.1.bb
@@ -21,6 +21,7 @@ SRC_URI += " file://configure_ac.patch \
              file://CVE-2016-8618.patch \
              file://CVE-2016-8619.patch \
              file://CVE-2016-8620.patch \
+             file://CVE-2016-8621.patch \
            "
 
 SRC_URI[md5sum] = "9ea3123449439bbd960cd25cf98796fb"
-- 
1.9.1


