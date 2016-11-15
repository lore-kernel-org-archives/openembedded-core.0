Return-Path: <sona.sarmadi@enea.com>
Received: from smtp-out11.electric.net (smtp-out11.electric.net
	[185.38.181.32])
	by mail.openembedded.org (Postfix) with ESMTP id 8C71D719EA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 09:08:24 +0000 (UTC)
Received: from 1c6Zj6-0001lc-W6 by out11c.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1c6Zj7-0001m1-TY
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2016 01:08:25 -0800
Received: by emcmailer; Tue, 15 Nov 2016 01:08:25 -0800
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out11c.electric.net with esmtps (TLSv1:AES128-SHA:128) (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1c6Zj6-0001lc-W6
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2016 01:08:24 -0800
Received: from sestofb11.enea.se (172.21.3.152) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 15 Nov 2016 10:08:24 +0100
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Nov 2016 10:08:17 +0100
Message-ID: <1479200900-39007-8-git-send-email-sona.sarmadi@enea.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1479200900-39007-1-git-send-email-sona.sarmadi@enea.com>
References: <1479200900-39007-1-git-send-email-sona.sarmadi@enea.com>
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
Subject: [PATCHv5][krogoth 08/11] curl: CVE-2016-8622
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
X-List-Received-Date: Tue, 15 Nov 2016 09:08:24 -0000
Content-Type: text/plain

URL unescape heap overflow via integer truncation

Affected versions: curl 7.24.0 to and including 7.50.3
Reference:
https://curl.haxx.se/docs/adv_20161102H.html

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
---
 meta/recipes-support/curl/curl/CVE-2016-8622.patch | 94 ++++++++++++++++++++++
 meta/recipes-support/curl/curl_7.47.1.bb           |  1 +
 2 files changed, 95 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-8622.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2016-8622.patch b/meta/recipes-support/curl/curl/CVE-2016-8622.patch
new file mode 100644
index 0000000..8edad01
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2016-8622.patch
@@ -0,0 +1,94 @@
+From 53e71e47d6b81650d26ec33a58d0dca24c7ffb2c Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Tue, 4 Oct 2016 18:56:45 +0200
+Subject: [PATCH] unescape: avoid integer overflow
+
+CVE: CVE-2016-8622
+Upstream-Status: Backport
+
+Bug: https://curl.haxx.se/docs/adv_20161102H.html
+Reported-by: Cure53
+
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+
+diff -ruN a/docs/libcurl/curl_easy_unescape.3 b/docs/libcurl/curl_easy_unescape.3
+--- a/docs/libcurl/curl_easy_unescape.3	2016-02-03 00:08:02.000000000 +0100
++++ b/docs/libcurl/curl_easy_unescape.3	2016-11-07 09:25:45.999933275 +0100
+@@ -5,7 +5,7 @@
+ .\" *                            | (__| |_| |  _ <| |___
+ .\" *                             \___|\___/|_| \_\_____|
+ .\" *
+-.\" * Copyright (C) 1998 - 2015, Daniel Stenberg, <daniel@haxx.se>, et al.
++.\" * Copyright (C) 1998 - 2016, Daniel Stenberg, <daniel@haxx.se>, et al.
+ .\" *
+ .\" * This software is licensed as described in the file COPYING, which
+ .\" * you should have received as part of this distribution. The terms
+@@ -40,7 +40,10 @@
+ 
+ If \fBoutlength\fP is non-NULL, the function will write the length of the
+ returned string in the integer it points to. This allows an escaped string
+-containing %00 to still get used properly after unescaping.
++containing %00 to still get used properly after unescaping. Since this is a
++pointer to an \fIint\fP type, it can only return a value up to INT_MAX so no
++longer string can be unescaped if the string length is returned in this
++parameter.
+ 
+ You must \fIcurl_free(3)\fP the returned string when you're done with it.
+ .SH AVAILABILITY
+diff -ruN a/lib/dict.c b/lib/dict.c
+--- a/lib/dict.c	2016-02-03 00:02:44.000000000 +0100
++++ b/lib/dict.c	2016-11-07 09:25:45.999933275 +0100
+@@ -5,7 +5,7 @@
+  *                            | (__| |_| |  _ <| |___
+  *                             \___|\___/|_| \_\_____|
+  *
+- * Copyright (C) 1998 - 2015, Daniel Stenberg, <daniel@haxx.se>, et al.
++ * Copyright (C) 1998 - 2016, Daniel Stenberg, <daniel@haxx.se>, et al.
+  *
+  * This software is licensed as described in the file COPYING, which
+  * you should have received as part of this distribution. The terms
+@@ -52,7 +52,7 @@
+ #include <curl/curl.h>
+ #include "transfer.h"
+ #include "sendf.h"
+-
++#include "escape.h"
+ #include "progress.h"
+ #include "strequal.h"
+ #include "dict.h"
+@@ -96,12 +96,12 @@
+   char *newp;
+   char *dictp;
+   char *ptr;
+-  int len;
++  size_t len;
+   char ch;
+   int olen=0;
+ 
+-  newp = curl_easy_unescape(data, inputbuff, 0, &len);
+-  if(!newp)
++  CURLcode result = Curl_urldecode(data, inputbuff, 0, &newp, &len, FALSE);
++  if(!newp || result)
+     return NULL;
+ 
+   dictp = malloc(((size_t)len)*2 + 1); /* add one for terminating zero */
+diff -ruN a/lib/escape.c b/lib/escape.c
+--- a/lib/escape.c	2016-02-05 10:02:03.000000000 +0100
++++ b/lib/escape.c	2016-11-07 09:29:43.073671606 +0100
+@@ -217,8 +217,14 @@
+                                 FALSE);
+   if(res)
+     return NULL;
+-  if(olen)
+-    *olen = curlx_uztosi(outputlen);
++
++    if(olen) {
++      if(outputlen <= (size_t) INT_MAX)
++        *olen = curlx_uztosi(outputlen);
++      else
++        /* too large to return in an int, fail! */
++        Curl_safefree(str);
++    }
+   return str;
+ }
+ 
diff --git a/meta/recipes-support/curl/curl_7.47.1.bb b/meta/recipes-support/curl/curl_7.47.1.bb
index 67b07da..4bff34e 100644
--- a/meta/recipes-support/curl/curl_7.47.1.bb
+++ b/meta/recipes-support/curl/curl_7.47.1.bb
@@ -22,6 +22,7 @@ SRC_URI += " file://configure_ac.patch \
              file://CVE-2016-8619.patch \
              file://CVE-2016-8620.patch \
              file://CVE-2016-8621.patch \
+             file://CVE-2016-8622.patch \
            "
 
 SRC_URI[md5sum] = "9ea3123449439bbd960cd25cf98796fb"
-- 
1.9.1


