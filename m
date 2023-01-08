Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0444C54EBD
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 17:56:32 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.50514.1673200590661288285
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jan 2023 09:56:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@redrectangle.org header.s=gm1 header.b=kClMSktY;
 spf=none, err=permanent DNS error (domain: redrectangle.org, ip: 217.70.183.201, mailfrom: robert.joslyn@redrectangle.org)
Received: (Authenticated sender: robert.joslyn@redrectangle.org)
	by mail.gandi.net (Postfix) with ESMTPSA id 3A2141BF203;
	Sun,  8 Jan 2023 17:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redrectangle.org;
	s=gm1; t=1673200588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nw//jRDfsno3bPc1reuDOlHIKjwHTJwxGAgLMIoE2ao=;
	b=kClMSktYhiahZvM2iIN2BMPtTV/od5+ROEipE6FxynC9tt4NGOuiSJ9Tgk5KlYBqzIEw2t
	YzmGfptk7z2aFo8BHtepgxv4e0aGg2sWISQPb2ffacGK6tVx535V/vR63XuJY/mHdIn3TO
	kvSGX0jmT6cUhP0csq67YqsX77PQfQui9/wpU3EaH9W8hLFdvcBZoa4+OcsYil5eDI0WPw
	51H87Egz7c4Um7+xRdBRkWgIC+4CVM4HTxJAVBDp4sNc1gA9JaSVnoE3cUb9Dg1px9t/7s
	72hnE6zheB7k9oiZkWVvmisobaszedsvIWM2LIWbH7KNxmBb92sbcz9yTw9fIA==
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [langdale][PATCH] curl: Fix CVE-2022-43551 and CVE-2022-43552
Date: Sun,  8 Jan 2023 09:55:21 -0800
Message-Id: <20230108175521.878510-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.38.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Jan 2023 17:56:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175635

Backport patches to address these CVEs.
 * https://curl.se/docs/CVE-2022-43551.html
 * https://curl.se/docs/CVE-2022-43552.html

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 .../curl/curl/CVE-2022-43551.patch            | 32 ++++++++
 .../curl/curl/CVE-2022-43552.patch            | 78 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.85.0.bb      |  2 +
 3 files changed, 112 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-43551.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-43552.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2022-43551.patch b/meta/recipes-support/curl/curl/CVE-2022-43551.patch
new file mode 100644
index 0000000000..7c617ef1db
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2022-43551.patch
@@ -0,0 +1,32 @@
+From 08aa76b7b24454a89866aaef661ea90ae3d57900 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 19 Dec 2022 08:36:55 +0100
+Subject: [PATCH] http: use the IDN decoded name in HSTS checks
+
+Otherwise it stores the info HSTS into the persistent cache for the IDN
+name which will not match when the HSTS status is later checked for
+using the decoded name.
+
+Reported-by: Hiroki Kurosawa
+
+Closes #10111
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/9e71901634e276dd]
+Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
+---
+ lib/http.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/http.c b/lib/http.c
+index b0ad28e..8b18e8d 100644
+--- a/lib/http.c
++++ b/lib/http.c
+@@ -3654,7 +3654,7 @@ CURLcode Curl_http_header(struct Curl_easy *data, struct connectdata *conn,
+   else if(data->hsts && checkprefix("Strict-Transport-Security:", headp) &&
+           (conn->handler->flags & PROTOPT_SSL)) {
+     CURLcode check =
+-      Curl_hsts_parse(data->hsts, data->state.up.hostname,
++      Curl_hsts_parse(data->hsts, conn->host.name,
+                       headp + strlen("Strict-Transport-Security:"));
+     if(check)
+       infof(data, "Illegal STS header skipped");
diff --git a/meta/recipes-support/curl/curl/CVE-2022-43552.patch b/meta/recipes-support/curl/curl/CVE-2022-43552.patch
new file mode 100644
index 0000000000..059dad17d8
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2022-43552.patch
@@ -0,0 +1,78 @@
+From 6ae56c9c47b02106373c9482f09c510fd5c50a84 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 19 Dec 2022 08:38:37 +0100
+Subject: [PATCH] smb/telnet: do not free the protocol struct in *_done()
+
+It is managed by the generic layer.
+
+Reported-by: Trail of Bits
+
+Closes #10112
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/4f20188ac644afe1]
+Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
+---
+ lib/smb.c    | 14 ++------------
+ lib/telnet.c |  3 ---
+ 2 files changed, 2 insertions(+), 15 deletions(-)
+
+diff --git a/lib/smb.c b/lib/smb.c
+index 039d680..f682c1f 100644
+--- a/lib/smb.c
++++ b/lib/smb.c
+@@ -62,8 +62,6 @@ static CURLcode smb_connect(struct Curl_easy *data, bool *done);
+ static CURLcode smb_connection_state(struct Curl_easy *data, bool *done);
+ static CURLcode smb_do(struct Curl_easy *data, bool *done);
+ static CURLcode smb_request_state(struct Curl_easy *data, bool *done);
+-static CURLcode smb_done(struct Curl_easy *data, CURLcode status,
+-                         bool premature);
+ static CURLcode smb_disconnect(struct Curl_easy *data,
+                                struct connectdata *conn, bool dead);
+ static int smb_getsock(struct Curl_easy *data, struct connectdata *conn,
+@@ -78,7 +76,7 @@ const struct Curl_handler Curl_handler_smb = {
+   "SMB",                                /* scheme */
+   smb_setup_connection,                 /* setup_connection */
+   smb_do,                               /* do_it */
+-  smb_done,                             /* done */
++  ZERO_NULL,                            /* done */
+   ZERO_NULL,                            /* do_more */
+   smb_connect,                          /* connect_it */
+   smb_connection_state,                 /* connecting */
+@@ -105,7 +103,7 @@ const struct Curl_handler Curl_handler_smbs = {
+   "SMBS",                               /* scheme */
+   smb_setup_connection,                 /* setup_connection */
+   smb_do,                               /* do_it */
+-  smb_done,                             /* done */
++  ZERO_NULL,                            /* done */
+   ZERO_NULL,                            /* do_more */
+   smb_connect,                          /* connect_it */
+   smb_connection_state,                 /* connecting */
+@@ -941,14 +939,6 @@ static CURLcode smb_request_state(struct Curl_easy *data, bool *done)
+   return CURLE_OK;
+ }
+ 
+-static CURLcode smb_done(struct Curl_easy *data, CURLcode status,
+-                         bool premature)
+-{
+-  (void) premature;
+-  Curl_safefree(data->req.p.smb);
+-  return status;
+-}
+-
+ static CURLcode smb_disconnect(struct Curl_easy *data,
+                                struct connectdata *conn, bool dead)
+ {
+diff --git a/lib/telnet.c b/lib/telnet.c
+index 923c7f8..48cd0d7 100644
+--- a/lib/telnet.c
++++ b/lib/telnet.c
+@@ -1248,9 +1248,6 @@ static CURLcode telnet_done(struct Curl_easy *data,
+ 
+   curl_slist_free_all(tn->telnet_vars);
+   tn->telnet_vars = NULL;
+-
+-  Curl_safefree(data->req.p.telnet);
+-
+   return CURLE_OK;
+ }
+ 
diff --git a/meta/recipes-support/curl/curl_7.85.0.bb b/meta/recipes-support/curl/curl_7.85.0.bb
index a4561494d1..1e47e9fac5 100644
--- a/meta/recipes-support/curl/curl_7.85.0.bb
+++ b/meta/recipes-support/curl/curl_7.85.0.bb
@@ -17,6 +17,8 @@ SRC_URI = " \
     file://CVE-2022-35260.patch \
     file://CVE-2022-42915.patch \
     file://CVE-2022-42916.patch \
+    file://CVE-2022-43551.patch \
+    file://CVE-2022-43552.patch \
 "
 SRC_URI[sha256sum] = "88b54a6d4b9a48cb4d873c7056dcba997ddd5b7be5a2d537a4acb55c20b04be6"
 
-- 
2.38.2


