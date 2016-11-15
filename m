Return-Path: <sona.sarmadi@enea.com>
Received: from smtp-out10.electric.net (smtp-out10.electric.net
	[185.38.180.36])
	by mail.openembedded.org (Postfix) with ESMTP id 4B46B719E3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 09:08:23 +0000 (UTC)
Received: from 1c6Zj6-0004Q6-TW by out10a.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1c6Zj6-0004Rb-VG
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2016 01:08:24 -0800
Received: by emcmailer; Tue, 15 Nov 2016 01:08:24 -0800
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out10a.electric.net with esmtps (TLSv1:AES128-SHA:128) (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1c6Zj6-0004Q6-TW
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2016 01:08:24 -0800
Received: from sestofb11.enea.se (172.21.3.152) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 15 Nov 2016 10:08:23 +0100
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Nov 2016 10:08:14 +0100
Message-ID: <1479200900-39007-5-git-send-email-sona.sarmadi@enea.com>
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
Subject: [PATCHv5][krogoth 05/11] curl: CVE-2016-8619
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

double-free in krb5 code

Affected versions: curl 7.3 to and including 7.50.3
Reference:
https://curl.haxx.se/docs/adv_20161102E.html

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
---
 meta/recipes-support/curl/curl/CVE-2016-8619.patch | 52 ++++++++++++++++++++++
 meta/recipes-support/curl/curl_7.47.1.bb           |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-8619.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2016-8619.patch b/meta/recipes-support/curl/curl/CVE-2016-8619.patch
new file mode 100644
index 0000000..fb21cf6
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2016-8619.patch
@@ -0,0 +1,52 @@
+From 91239f7040b1f026d4d15765e7e3f58e92e93761 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 28 Sep 2016 12:56:02 +0200
+Subject: [PATCH] krb5: avoid realloc(0)
+
+If the requested size is zero, bail out with error instead of doing a
+realloc() that would cause a double-free: realloc(0) acts as a free()
+and then there's a second free in the cleanup path.
+
+CVE: CVE-2016-8619
+Upstream-Status: Backport
+
+Bug: https://curl.haxx.se/docs/adv_20161102E.html
+Reported-by: Cure53
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+---
+ lib/security.c | 9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/lib/security.c b/lib/security.c
+index a268d4a..4cef8f8 100644
+--- a/lib/security.c
++++ b/lib/security.c
+@@ -190,19 +190,22 @@ socket_write(struct connectdata *conn, curl_socket_t fd, const void *to,
+ static CURLcode read_data(struct connectdata *conn,
+                           curl_socket_t fd,
+                           struct krb5buffer *buf)
+ {
+   int len;
+-  void* tmp;
++  void *tmp = NULL;
+   CURLcode result;
+ 
+   result = socket_read(fd, &len, sizeof(len));
+   if(result)
+     return result;
+ 
+-  len = ntohl(len);
+-  tmp = realloc(buf->data, len);
++  if(len) {
++    /* only realloc if there was a length */
++    len = ntohl(len);
++    tmp = realloc(buf->data, len);
++  }
+   if(tmp == NULL)
+     return CURLE_OUT_OF_MEMORY;
+ 
+   buf->data = tmp;
+   result = socket_read(fd, buf->data, len);
+-- 
+2.9.3
+
diff --git a/meta/recipes-support/curl/curl_7.47.1.bb b/meta/recipes-support/curl/curl_7.47.1.bb
index 27a999e..9ef5718 100644
--- a/meta/recipes-support/curl/curl_7.47.1.bb
+++ b/meta/recipes-support/curl/curl_7.47.1.bb
@@ -19,6 +19,7 @@ SRC_URI += " file://configure_ac.patch \
              file://CVE-2016-8616.patch \
              file://CVE-2016-8617.patch \
              file://CVE-2016-8618.patch \
+             file://CVE-2016-8619.patch \
            "
 
 SRC_URI[md5sum] = "9ea3123449439bbd960cd25cf98796fb"
-- 
1.9.1


