Return-Path: <sona.sarmadi@enea.com>
Received: from smtp-out10.electric.net (smtp-out10.electric.net
	[185.38.180.39])
	by mail.openembedded.org (Postfix) with ESMTP id 8ED8871A99
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2016 09:49:18 +0000 (UTC)
Received: from 1c58SU-0002Px-Uz by out10d.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1c58SU-0002QT-W4
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Nov 2016 01:49:18 -0800
Received: by emcmailer; Fri, 11 Nov 2016 01:49:18 -0800
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out10d.electric.net with esmtps (TLSv1:AES128-SHA:128) (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1c58SU-0002Px-Uz
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Nov 2016 01:49:18 -0800
Received: from sestofb11.enea.se (172.21.3.152) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 11 Nov 2016 10:49:18 +0100
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 11 Nov 2016 10:49:12 +0100
Message-ID: <1478857754-61379-10-git-send-email-sona.sarmadi@enea.com>
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
Subject: [PATCH][krogoth 10/12] curl: CVE-2016-8624
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

invalid URL parsing with '#'

Affected versions: curl 7.1 to and including 7.50.3
Reference:
https://curl.haxx.se/docs/adv_20161102J.html

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
---
 meta/recipes-support/curl/curl/CVE-2016-8624.patch | 51 ++++++++++++++++++++++
 meta/recipes-support/curl/curl_7.47.1.bb           |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-8624.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2016-8624.patch b/meta/recipes-support/curl/curl/CVE-2016-8624.patch
new file mode 100644
index 0000000..009f7d0
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2016-8624.patch
@@ -0,0 +1,51 @@
+From 3bb273db7e40ebc284cff45f3ce3f0475c8339c2 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Tue, 11 Oct 2016 00:48:35 +0200
+Subject: [PATCH] urlparse: accept '#' as end of host name
+
+'http://example.com#@127.0.0.1/x.txt' equals a request to example.com
+for the '/' document with the rest of the URL being a fragment.
+
+CVE: CVE-2016-8624
+Upstream-Status: Backport
+
+Bug: https://curl.haxx.se/docs/adv_20161102J.html
+Reported-by: Fernando Muñoz
+
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+
+diff -ruN a/lib/url.c b/lib/url.c
+--- a/lib/url.c	2016-11-07 08:50:23.030126833 +0100
++++ b/lib/url.c	2016-11-07 10:16:13.562089428 +0100
+@@ -4086,7 +4086,7 @@
+     path[0]=0;
+ 
+     if(2 > sscanf(data->change.url,
+-                   "%15[^\n:]://%[^\n/?]%[^\n]",
++                   "%15[^\n:]://%[^\n/?#]%[^\n]",
+                    protobuf,
+                    conn->host.name, path)) {
+ 
+@@ -4094,7 +4094,7 @@
+        * The URL was badly formatted, let's try the browser-style _without_
+        * protocol specified like 'http://'.
+        */
+-      rc = sscanf(data->change.url, "%[^\n/?]%[^\n]", conn->host.name, path);
++      rc = sscanf(data->change.url, "%[^\n/?#]%[^\n]", conn->host.name, path);
+       if(1 > rc) {
+         /*
+          * We couldn't even get this format.
+@@ -4184,10 +4184,10 @@
+   }
+ 
+   /* If the URL is malformatted (missing a '/' after hostname before path) we
+-   * insert a slash here. The only letter except '/' we accept to start a path
+-   * is '?'.
++   * insert a slash here. The only letters except '/' that can start a path is
++   * '?' and '#' - as controlled by the two sscanf() patterns above.
+    */
+-  if(path[0] == '?') {
++  if(path[0] != '/') {
+     /* We need this function to deal with overlapping memory areas. We know
+        that the memory area 'path' points to is 'urllen' bytes big and that
+        is bigger than the path. Use +1 to move the zero byte too. */
diff --git a/meta/recipes-support/curl/curl_7.47.1.bb b/meta/recipes-support/curl/curl_7.47.1.bb
index 0f8fa3a..3c877e4 100644
--- a/meta/recipes-support/curl/curl_7.47.1.bb
+++ b/meta/recipes-support/curl/curl_7.47.1.bb
@@ -24,6 +24,7 @@ SRC_URI += " file://configure_ac.patch \
              file://CVE-2016-8621.patch \
              file://CVE-2016-8622.patch \
              file://CVE-2016-8623.patch \
+             file://CVE-2016-8624.patch \
            "
 
 SRC_URI[md5sum] = "9ea3123449439bbd960cd25cf98796fb"
-- 
1.9.1


