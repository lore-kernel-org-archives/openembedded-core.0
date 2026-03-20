Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39CE01099B50
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 23:07:33 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1975.1774048051966573127
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 16:07:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=NVWbSVFH;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439b97a8a8cso1161601f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 16:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774048050; x=1774652850; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JiFuCrH/ysYLpeCMVsa0eypVfC+x4PMX1M3U2Vkfqck=;
        b=NVWbSVFHQO6pnErHHO+9WlO6luOOC7yXRyQXp56f9k2RnBxeEzChN3lN1aFhFUswGw
         WXwP7y/UNyZUWF0u2PQP+N3WD+JJgqqpc07oj2nLwrPsbyIHqVI9DhwTtMxD5GvCVwBg
         UIkiRwJbMYxKO//dRB+yc2+kabAxCJbJcYrb4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774048050; x=1774652850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JiFuCrH/ysYLpeCMVsa0eypVfC+x4PMX1M3U2Vkfqck=;
        b=qt9+EsGxPO53RaIfzwMS8zVuFnuBk0CwwwaufEIa3QSHW8dRBg8JWMaT26ofv7Sa+D
         NnSCNaHH5FsWn9dCayj8/YmhH326vmecb6W2dlHIcnsRZjHDJsN/4ZaOGgZ/XJnk0PbF
         +y209rkreJGPx4qUvtY8d9/a/U3AJjxAs16klhC4y0IWckaW1HgCp0/PUA7HkdpnAkxa
         J8d5heX7a56/oax/lLSPS7tZf0JGfqmlkKwp/UdFJFHK5PBsW4B1UNGAMGRRNcEa5bPN
         tJdkP17XEsTJ1ReFlalK3KOUDCIJHEEfSw1nzCvwLFHfw4fo3QRQ/9NH2O+Qth0THoqs
         4n0Q==
X-Gm-Message-State: AOJu0YzVxS6dBX5i+UBMpFxV+/Kv01K/979NyRnTdCO+LebMvm97qFZa
	CwcVOasSs9vvCKuxRO8XDbgpxM/nWqq1KFB9GS1CsAB3/R9J2kDaZA5srRl9SJHTF6iQKw5uZub
	3nWrB
X-Gm-Gg: ATEYQzz1pzstsJrnar28I7OmfH6oBq/J7zFGhPU0mO7ILTWSIgYHiOHLYt4QTNGfNL4
	35XyxeBroAOfd7pTYgCwsVOg7SZkQaRPMcuFmgu19GJ1NH1Xq+9jBSvN1Ng9+dGktX4oZ4xo1mu
	jmnJaVcAUd2ItVhvC45qWy/bt8ewoWbb/RH1/67b0j7dhYUw4UbgfGLORy9XwpHunneQB4lCePC
	ugdJ8IsZawgmEg5cX/L+2X8OSurBbavJCt7T0T+mLL58cLFLsOhPH+vsNBdaqUkCcDLlf8cVsD1
	raq22Ac+qIUYGJFCFwYQ5LXBaURU7BRwOTVTxhDRyfyqeGK9VNKo/IXteBCgZbq8T+asA9qpEGc
	nDwZ7S2XQgKWcqJFGXgyRpdp3i0B+OgMl9r5j7V+Hy1TeotcAtbw1viMYVNbI4Wkd/xQEFXEWJX
	SVPj+4dtqBA0WdpDhkuw6Qjtk5HY009nXnMmNhTlfRmk8HRRp0Ikfez+Mwo9hxQJ0jqdrs2pyVj
	DVXIFvVZGvnoPpUFQpwHHHMBmc=
X-Received: by 2002:a5d:5d13:0:b0:43b:4489:d44f with SMTP id ffacd0b85a97d-43b64263f4emr7466767f8f.32.1774048050008;
        Fri, 20 Mar 2026 16:07:30 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6425eeb4sm9238332f8f.0.2026.03.20.16.07.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 16:07:29 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 7/7] curl: patch CVE-2026-3805
Date: Sat, 21 Mar 2026 00:07:22 +0100
Message-ID: <2d6383491f4246a93e1a49a9fe258d873adf8b76.1774047909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774047909.git.yoann.congal@smile.fr>
References: <cover.1774047909.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 23:07:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233643

From: Peter Marko <peter.marko@siemens.com>

Pick patch from [1].

[1] https://curl.se/docs/CVE-2026-3805.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2026-3805.patch             | 67 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.17.0.bb      |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-3805.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-3805.patch b/meta/recipes-support/curl/curl/CVE-2026-3805.patch
new file mode 100644
index 00000000000..f3b3285a3ab
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
index 7211c43afd2..24af8613ab9 100644
--- a/meta/recipes-support/curl/curl_8.17.0.bb
+++ b/meta/recipes-support/curl/curl_8.17.0.bb
@@ -25,6 +25,7 @@ SRC_URI = " \
     file://CVE-2026-3783.patch \
     file://0001-build-fix-Wunused-macros-warnings-and-related-tidy-u.patch \
     file://CVE-2026-3784-02.patch \
+    file://CVE-2026-3805.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

