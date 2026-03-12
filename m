Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6073106ACF8
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 23:05:37 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3876.1773356735751236918
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 16:05:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=JRNi/ivS;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-2026031223053371f0cbe0ac000207fa-ndtmqz@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2026031223053371f0cbe0ac000207fa
        for <openembedded-core@lists.openembedded.org>;
        Fri, 13 Mar 2026 00:05:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=wSoWfRtiKUae1TdK47ZOFqTq54jHgvyUyd/+6ZKPyC8=;
 b=JRNi/ivSusuiz6HMSvQ26rko1nIOMtiz+IoTT8pvY9CbC6GUUq0oyOIlfwOag1fjgR8HfG
 qCVE+1yf1SdrjXz1YegpVcIov4kWciv5D5tKWiu63/NkyLNbGP82JmAa+poXuRaKSa/mWuzV
 vkcRKbvL82VXlszeUoCXTE9YITCMBf1nRFT9+ZxvvyRZOvkgpdNML+x6ffVlEG1DTZTWELem
 Oazb/d9Nm7qSc4T+RLkpbjG9JYUkKCWQpY1x0GruhFQuQCg0CWjma0h9nE8bf2Xz8C2/LfzN
 trSU5l7yayA5sX8plcGs6zj+57z2a7D+FdWQfi/MIt5apYMYNQhwRINg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][whinlatter][PATCH 4/4] curl: patch CVE-2026-3805
Date: Fri, 13 Mar 2026 00:05:04 +0100
Message-Id: <20260312230504.76461-4-peter.marko@siemens.com>
In-Reply-To: <20260312230504.76461-1-peter.marko@siemens.com>
References: <20260312230504.76461-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 23:05:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233009

From: Peter Marko <peter.marko@siemens.com>

Pick patch from [1].

[1] https://curl.se/docs/CVE-2026-3805.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../curl/curl/CVE-2026-3805.patch             | 67 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.17.0.bb      |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-3805.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-3805.patch b/meta/recipes-support/curl/curl/CVE-2026-3805.patch
new file mode 100644
index 0000000000..f3b3285a3a
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-3805.patch
@@ -0,0 +1,67 @@
+From e090be9f73a7a71459ef678c7cc4b1f75e3ea883 Mon Sep 17 00:00:00 2001
+From: Stefan Eissing <stefan@eissing.org>
+Date: Sun, 8 Mar 2026 14:30:00 +0100
+Subject: [PATCH] smb: free the path in the request struct properly
+
+Closes #20854
+
+CVE: CVE-2026-3805
+Upstream-Status: Backport [https://github.com/curl/curl/commit/e090be9f73a7a71459ef678c7cc4b1f75e3ea883]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/smb.c | 20 +++++++++++---------
+ 1 file changed, 11 insertions(+), 9 deletions(-)
+
+diff --git a/lib/smb.c b/lib/smb.c
+index 41ba48fe89..00297adee7 100644
+--- a/lib/smb.c
++++ b/lib/smb.c
+@@ -448,9 +448,7 @@ static void smb_easy_dtor(void *key, size_t klen, void *entry)
+   struct smb_request *req = entry;
+   (void)key;
+   (void)klen;
+-  /* `req->path` points to somewhere in `struct smb_conn` which is
+-   * kept at the connection meta. If the connection is destroyed first,
+-   * req->path points to free'd memory. */
++  Curl_safefree(req->path);
+   free(req);
+ }
+ 
+@@ -1240,7 +1238,7 @@ static CURLcode smb_parse_url_path(struct Curl_easy *data,
+                                    struct smb_request *req)
+ {
+   char *path;
+-  char *slash;
++  char *slash, *s;
+   CURLcode result;
+ 
+   /* URL decode the path */
+@@ -1249,6 +1247,7 @@ static CURLcode smb_parse_url_path(struct Curl_easy *data,
+     return result;
+ 
+   /* Parse the path for the share */
++  Curl_safefree(smbc->share);
+   smbc->share = strdup((*path == '/' || *path == '\\') ? path + 1 : path);
+   free(path);
+   if(!smbc->share)
+@@ -1268,12 +1267,15 @@ static CURLcode smb_parse_url_path(struct Curl_easy *data,
+   /* Parse the path for the file path converting any forward slashes into
+      backslashes */
+   *slash++ = 0;
+-  req->path = slash;
+-
+-  for(; *slash; slash++) {
+-    if(*slash == '/')
+-      *slash = '\\';
++  for(s = slash; *s; s++) {
++    if(*s == '/')
++      *s = '\\';
+   }
++  /* keep a copy at easy struct to not share this with connection state */
++  req->path = curlx_strdup(slash);
++  if(!req->path)
++    return CURLE_OUT_OF_MEMORY;
++
+   return CURLE_OK;
+ }
+ 
diff --git a/meta/recipes-support/curl/curl_8.17.0.bb b/meta/recipes-support/curl/curl_8.17.0.bb
index 7211c43afd..24af8613ab 100644
--- a/meta/recipes-support/curl/curl_8.17.0.bb
+++ b/meta/recipes-support/curl/curl_8.17.0.bb
@@ -25,6 +25,7 @@ SRC_URI = " \
     file://CVE-2026-3783.patch \
     file://0001-build-fix-Wunused-macros-warnings-and-related-tidy-u.patch \
     file://CVE-2026-3784-02.patch \
+    file://CVE-2026-3805.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

