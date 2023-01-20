Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07744C38159
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 18:11:20 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.82148.1674238273975308392
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 10:11:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=YleQHis5;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id v3so4749762pgh.4
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 10:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TqgUwesgIwVhJ2vm0KYPb0WDMl7a9GOKKheaLWyx4FI=;
        b=YleQHis5PsMyh0MidosG5p9nfOH7r0ygQqR5TE2sSx2Cc+kiPudS2WeYM1rTR6Infa
         KmNGccyKTeMcB6uCQhA+e5NTN4f5L/OEU995Er0wsm5+t3CjYbFJPlaVIKdlaRtF0hiN
         CbQUncRsJ7r5ahZfWOnEjb15yLc/qPF3zYNObh3Y+AACTrcs7+L9vc7RbG69f9Fuopta
         DXDU5jXrdLx9Y8IWLjeS8Ht3QYVxAbQRn8BtGaCVyPYJRXjJwZJ6w5pFPHBeMCHCpyzL
         9BKNK14eYauLHQES9StEDINQbqfXO0ugFncoOI3yb0oEOeg7kRxuEfHbyhBsGpq0BhRV
         rsJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TqgUwesgIwVhJ2vm0KYPb0WDMl7a9GOKKheaLWyx4FI=;
        b=yRCGvNpuiLkFspp7exF3B5G+btCTFEUed77QvdUvKIB2O5aFhScoieZfrHQVVZbDUI
         49H8o0sf2Ejsu7o8/6MFeTOQX2ZDe0JvkHlhGKgB0yFaF2xxOXDnSR2sNEBhNARWIaKi
         o6wUFVr3t7wnCwhnPEvWNQZ6595WRVx0lYyaUZUs+C9KPIddy7PfUpSZ+L68NyNr0g72
         /ZfFLTVIf+8U9gQvpSBfqBth5zOLI2txnHkfklyaFF+p2xDNfGSkrsxKL3XB7dldDLBu
         VwQRoF/yseAJ55lYYH4rffvkb96x9JB4TJLf/f1SXOZp1Pzodm7TctxiAjlrDbwdJpdD
         rZcw==
X-Gm-Message-State: AFqh2koaIfG1vdq+/fB3x3xayaXLIsOz8RvSlkvLFqTFGt9s3VNQV+4D
	mlmAME+7I23lNAJBRSMJxjGHENvRd3tCF2mXqiY=
X-Google-Smtp-Source: AMrXdXuFU78aUjXvHc5lDfHpoRPfMyMqiETyynf5TwcQBqHMlYWMjB/6kwTLnJ0TIHGjQOYHxm/PLw==
X-Received: by 2002:aa7:8493:0:b0:58d:98e0:79a9 with SMTP id u19-20020aa78493000000b0058d98e079a9mr14914539pfn.34.1674238273022;
        Fri, 20 Jan 2023 10:11:13 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id i128-20020a626d86000000b0058db8f8bce8sm8990396pfc.166.2023.01.20.10.11.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 10:11:12 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 05/41] curl: Fix CVE-2022-43551 and CVE-2022-43552
Date: Fri, 20 Jan 2023 08:10:22 -1000
Message-Id: <514561e323a8f63d42af9baa226ac53955c40cff.1674238148.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674238148.git.steve@sakoman.com>
References: <cover.1674238148.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 18:11:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176211

From: Robert Joslyn <robert.joslyn@redrectangle.org>

Backport patches to address these CVEs.
 * https://curl.se/docs/CVE-2022-43551.html
 * https://curl.se/docs/CVE-2022-43552.html

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


