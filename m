Return-Path: <sona.sarmadi@enea.com>
Received: from smtp-out11.electric.net (smtp-out11.electric.net
	[185.38.181.40])
	by mail.openembedded.org (Postfix) with ESMTP id 80D6571A71
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2016 09:49:16 +0000 (UTC)
Received: from 1c58SS-0000uG-W8 by out11b.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1c58ST-0000ur-UN
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Nov 2016 01:49:17 -0800
Received: by emcmailer; Fri, 11 Nov 2016 01:49:17 -0800
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out11b.electric.net with esmtps (TLSv1:AES128-SHA:128) (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1c58SS-0000uG-W8
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Nov 2016 01:49:16 -0800
Received: from sestofb11.enea.se (172.21.3.152) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 11 Nov 2016 10:49:16 +0100
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 11 Nov 2016 10:49:05 +0100
Message-ID: <1478857754-61379-3-git-send-email-sona.sarmadi@enea.com>
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
Subject: [PATCH][krogoth 03/12] curl: CVE-2016-8617
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
X-List-Received-Date: Fri, 11 Nov 2016 09:49:18 -0000
Content-Type: text/plain

OOB write via unchecked multiplication

Affected versions: curl 7.1 to and including 7.50.3

Reference:
https://curl.haxx.se/docs/adv_20161102C.html

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
---
 meta/recipes-support/curl/curl/CVE-2016-8617.patch | 28 ++++++++++++++++++++++
 meta/recipes-support/curl/curl_7.47.1.bb           |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-8617.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2016-8617.patch b/meta/recipes-support/curl/curl/CVE-2016-8617.patch
new file mode 100644
index 0000000..d16c2f5
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2016-8617.patch
@@ -0,0 +1,28 @@
+From efd24d57426bd77c9b5860e6b297904703750412 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 28 Sep 2016 00:05:12 +0200
+Subject: [PATCH] base64: check for integer overflow on large input
+
+CVE: CVE-2016-8617
+Upstream-Status: Backport
+
+Bug: https://curl.haxx.se/docs/adv_20161102C.html
+Reported-by: Cure53
+
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+---
+diff -ruN a/lib/base64.c b/lib/base64.c
+--- a/lib/base64.c	2016-02-03 00:02:43.000000000 +0100
++++ b/lib/base64.c	2016-11-07 09:22:07.918167530 +0100
+@@ -190,6 +190,11 @@
+   if(0 == insize)
+     insize = strlen(indata);
+ 
++#if SIZEOF_SIZE_T == 4
++  if(insize > UINT_MAX/4)
++    return CURLE_OUT_OF_MEMORY;
++#endif
++
+   base64data = output = malloc(insize*4/3+4);
+   if(NULL == output)
+     return CURLE_OUT_OF_MEMORY;
diff --git a/meta/recipes-support/curl/curl_7.47.1.bb b/meta/recipes-support/curl/curl_7.47.1.bb
index 20c3721..3724411 100644
--- a/meta/recipes-support/curl/curl_7.47.1.bb
+++ b/meta/recipes-support/curl/curl_7.47.1.bb
@@ -17,6 +17,7 @@ SRC_URI += " file://configure_ac.patch \
              file://CVE-2016-7141.patch \
              file://CVE-2016-8615.patch \
              file://CVE-2016-8616.patch \
+             file://CVE-2016-8617.patch \
            "
 
 SRC_URI[md5sum] = "9ea3123449439bbd960cd25cf98796fb"
-- 
1.9.1


