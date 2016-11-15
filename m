Return-Path: <sona.sarmadi@enea.com>
Received: from smtp-out10.electric.net (smtp-out10.electric.net
	[185.38.180.32])
	by mail.openembedded.org (Postfix) with ESMTP id B20416080F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 09:08:22 +0000 (UTC)
Received: from 1c6Zj5-0007xf-Te by out10d.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1c6Zj5-0007y9-UK
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2016 01:08:23 -0800
Received: by emcmailer; Tue, 15 Nov 2016 01:08:23 -0800
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out10d.electric.net with esmtps (TLSv1:AES128-SHA:128) (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1c6Zj5-0007xf-Te
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2016 01:08:23 -0800
Received: from sestofb11.enea.se (172.21.3.152) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 15 Nov 2016 10:08:22 +0100
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Nov 2016 10:08:10 +0100
Message-ID: <1479200900-39007-1-git-send-email-sona.sarmadi@enea.com>
X-Mailer: git-send-email 1.9.1
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
Subject: [PATCHv5][krogoth 01/11] curl: CVE-2016-8615
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

cookie injection for other servers

Affected versions: curl 7.1 to and including 7.50.3

Reference:
https://curl.haxx.se/docs/adv_20161102A.html

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
---
 meta/recipes-support/curl/curl/CVE-2016-8615.patch | 77 ++++++++++++++++++++++
 meta/recipes-support/curl/curl_7.47.1.bb           |  1 +
 2 files changed, 78 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-8615.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2016-8615.patch b/meta/recipes-support/curl/curl/CVE-2016-8615.patch
new file mode 100644
index 0000000..5faa423
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2016-8615.patch
@@ -0,0 +1,77 @@
+From 1620f552a277ed5b23a48b9c27dbf07663cac068 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Tue, 27 Sep 2016 17:36:19 +0200
+Subject: [PATCH] cookie: replace use of fgets() with custom version
+
+... that will ignore lines that are too long to fit in the buffer.
+
+CVE: CVE-2016-8615
+Upstream-Status: Backport
+
+Bug: https://curl.haxx.se/docs/adv_20161102A.html
+Reported-by: Cure53
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+---
+ lib/cookie.c | 31 ++++++++++++++++++++++++++++++-
+ 1 file changed, 30 insertions(+), 1 deletion(-)
+
+diff --git a/lib/cookie.c b/lib/cookie.c
+index 0f05da2..e5097d3 100644
+--- a/lib/cookie.c
++++ b/lib/cookie.c
+@@ -901,10 +901,39 @@ Curl_cookie_add(struct Curl_easy *data,
+   }
+ 
+   return co;
+ }
+ 
++/*
++ * get_line() makes sure to only return complete whole lines that fit in 'len'
++ * bytes and end with a newline.
++ */
++static char *get_line(char *buf, int len, FILE *input)
++{
++  bool partial = FALSE;
++  while(1) {
++    char *b = fgets(buf, len, input);
++    if(b) {
++      size_t rlen = strlen(b);
++      if(rlen && (b[rlen-1] == '\n')) {
++        if(partial) {
++          partial = FALSE;
++          continue;
++        }
++        return b;
++      }
++      else
++        /* read a partial, discard the next piece that ends with newline */
++        partial = TRUE;
++    }
++    else
++      break;
++  }
++  return NULL;
++}
++
++
+ /*****************************************************************************
+  *
+  * Curl_cookie_init()
+  *
+  * Inits a cookie struct to read data from a local file. This is always
+@@ -957,11 +986,11 @@ struct CookieInfo *Curl_cookie_init(struct Curl_easy *data,
+     bool headerline;
+ 
+     line = malloc(MAX_COOKIE_LINE);
+     if(!line)
+       goto fail;
+-    while(fgets(line, MAX_COOKIE_LINE, fp)) {
++    while(get_line(line, MAX_COOKIE_LINE, fp)) {
+       if(checkprefix("Set-Cookie:", line)) {
+         /* This is a cookie line, get it! */
+         lineptr=&line[11];
+         headerline=TRUE;
+       }
+-- 
+2.9.3
+
diff --git a/meta/recipes-support/curl/curl_7.47.1.bb b/meta/recipes-support/curl/curl_7.47.1.bb
index 3670a11..1f2758c 100644
--- a/meta/recipes-support/curl/curl_7.47.1.bb
+++ b/meta/recipes-support/curl/curl_7.47.1.bb
@@ -15,6 +15,7 @@ SRC_URI += " file://configure_ac.patch \
              file://CVE-2016-5420.patch \
              file://CVE-2016-5421.patch \
              file://CVE-2016-7141.patch \
+             file://CVE-2016-8615.patch \
            "
 
 SRC_URI[md5sum] = "9ea3123449439bbd960cd25cf98796fb"
-- 
1.9.1


