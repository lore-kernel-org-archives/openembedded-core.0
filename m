Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D38D0E9D834
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 13:21:56 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.54744.1775481713534951941
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2026 06:21:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=aG5xcN71;
 spf=pass (domain: mvista.com, ip: 209.85.216.50, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-35da9c0c007so3679525a91.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 06:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1775481712; x=1776086512; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iCFamo/p8PyQyN/CjAf01Vmi2/FNRteDRGnF88EQD0M=;
        b=aG5xcN71X4xvIWk921/o4hXqnbyc4jGdngFxuQMo40cFNgeqFrCRMgJZExbnRx6bnc
         uZnnoGmW3T/tjptrCWxV4elb20YrF32Y6j6U24RXym+qIMAJ73lWIjVyMOnbYucwPa1h
         /kwsT7O/xhqWmnUfhBOulLNjl+FEGwmpOim84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775481712; x=1776086512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iCFamo/p8PyQyN/CjAf01Vmi2/FNRteDRGnF88EQD0M=;
        b=jWPMLRTe/nvkSQeZi+HExcKt1rtR9QiHSiQUrCoVaZ2s1/sh4442rOcwrnVZZHCyw1
         aNPXbbXYrit3dnx+VIAg4IEBucmV+FNupcEq2SI2qs0ibFiqUwNruQm9ya9I4Apo2fVq
         NrIqrgVLYKCB4NdsGx093TWXtBfKbgYC9BztR6FhFhsFaTPbDb/dTsRFENYPri/LDOLE
         zI6JnPcFmZDI9MgBVDhcEoGBsVlnjfoCWqrliL2A1spxTrfSKoM14CNYazuWph1HdD8S
         mGgMcnX5LZnbyImxj4KB7CT5z1Qkb4PrhBtgQd7kSNnvNJa1SsUjkF/8r2CNfN0wWTT9
         LK3w==
X-Gm-Message-State: AOJu0YyCzkRSnXK7QEzmA6y4Go1WVuADgNZdnFi2x+dHeZKI6QSOyz4g
	QGAwTiBFefAWd19BV/3lbR50aYGUwECGODTQY8eQmODxP2xEfKZRLJezGwSNf0alXwP77a23eD3
	Ym8xrw9M=
X-Gm-Gg: AeBDiet4snmtC7qJn0aXxjtUcz1LM1v/bjKSlmCP/IbgDFiAPnyty+2h3H9cQVcTGXF
	qXC0YRBW1Xa5p4Henr3A6jkr2EdX8hJ85N/5wmJOGIbGgLpt1jSxhpplb+61gkkjw7fl2EjiqNJ
	2R7FhZgL8rd2yPjZICJJg4zGunmdx5ADiKeiOL/CpVm9qPkStqImrFgkXZldDsweOjiqAkZNUVq
	tF7A9d6TwrD6LzDZgCfcxs7K7qTQKoC+pQAhQzLQLGDdvPXeLB91TQGMEvNTd5cZH7xT1XfdAdm
	8yCV+JeEacdzdwwl/uj+5cK5rv1Gt5Jh3ZkhKSBN5Pyc/mOSzRpMIkPjLkCqKTpPvdaAl2pQhXM
	Ua/Mo45el5FQtCicRVVqR33W0V5JlfljCc4hIVnWfpGBM05ftQQTLdL+BKDfiMmEuDGn5fjLriC
	g8DMkmWYtsEe7kyFGBE+CFIUqNEpxCzJG6OqHbGmIUdsZqMVk5FA==
X-Received: by 2002:a17:90b:134f:b0:356:2c7b:c026 with SMTP id 98e67ed59e1d1-35de691a6bamr12572945a91.23.1775481712436;
        Mon, 06 Apr 2026 06:21:52 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1f28:2171:fb10:85f3:b262:eebf])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dd35f50e9sm13848829a91.6.2026.04.06.06.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 06:21:51 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][patch 3/3] curl: patch CVE-2026-3784
Date: Mon,  6 Apr 2026 18:51:29 +0530
Message-ID: <20260406132129.440817-3-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260406132129.440817-1-vanusuri@mvista.com>
References: <20260406132129.440817-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 13:21:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234681

pick patch from ubuntu per [1]

[1] http://archive.ubuntu.com/ubuntu/pool/main/c/curl/curl_8.5.0-2ubuntu10.8.debian.tar.xz
[2] https://ubuntu.com/security/CVE-2026-3784
[3] https://curl.se/docs/CVE-2026-3784.html

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../curl/curl/CVE-2026-3784.patch             | 77 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
 2 files changed, 78 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-3784.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-3784.patch b/meta/recipes-support/curl/curl/CVE-2026-3784.patch
new file mode 100644
index 0000000000..c3bdb67247
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-3784.patch
@@ -0,0 +1,77 @@
+From 5f13a7645e565c5c1a06f3ef86e97afb856fb364 Mon Sep 17 00:00:00 2001
+From: Stefan Eissing <stefan@eissing.org>
+Date: Fri, 6 Mar 2026 14:54:09 +0100
+Subject: [PATCH] proxy-auth: additional tests
+
+Also eliminate the special handling for socks proxy match.
+
+Closes #20837
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/5f13a7645e565c5c1a06f3]
+Backported by Ubuntu team http://archive.ubuntu.com/ubuntu/pool/main/c/curl/curl_8.5.0-2ubuntu10.8.debian.tar.xz
+
+CVE: CVE-2026-3784
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ lib/url.c | 35 ++++++++---------------------------
+ 1 file changed, 8 insertions(+), 27 deletions(-)
+
+diff --git a/lib/url.c b/lib/url.c
+index 22ed0be..76360c8 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -703,34 +703,15 @@ proxy_info_matches(const struct proxy_info *data,
+ {
+   if((data->proxytype == needle->proxytype) &&
+      (data->port == needle->port) &&
+-     strcasecompare(data->host.name, needle->host.name))
+-    return TRUE;
++     curl_strequal(data->host.name, needle->host.name)) {
+ 
++    if(Curl_timestrcmp(data->user, needle->user) ||
++       Curl_timestrcmp(data->passwd, needle->passwd))
++      return FALSE;
++    return TRUE;
++  }
+   return FALSE;
+ }
+-
+-static bool
+-socks_proxy_info_matches(const struct proxy_info *data,
+-                         const struct proxy_info *needle)
+-{
+-  if(!proxy_info_matches(data, needle))
+-    return FALSE;
+-
+-  /* the user information is case-sensitive
+-     or at least it is not defined as case-insensitive
+-     see https://datatracker.ietf.org/doc/html/rfc3986#section-3.2.1 */
+-
+-  /* curl_strequal does a case insensitive comparison,
+-     so do not use it here! */
+-  if(Curl_timestrcmp(data->user, needle->user) ||
+-     Curl_timestrcmp(data->passwd, needle->passwd))
+-    return FALSE;
+-  return TRUE;
+-}
+-#else
+-/* disabled, won't get called */
+-#define proxy_info_matches(x,y) FALSE
+-#define socks_proxy_info_matches(x,y) FALSE
+ #endif
+ 
+ /* A connection has to have been idle for a shorter time than 'maxage_conn'
+@@ -1085,8 +1066,8 @@ ConnectionExists(struct Curl_easy *data,
+       continue;
+ 
+     if(needle->bits.socksproxy &&
+-      !socks_proxy_info_matches(&needle->socks_proxy,
+-                                &check->socks_proxy))
++      !proxy_info_matches(&needle->socks_proxy,
++                          &check->socks_proxy))
+       continue;
+ 
+     if(needle->bits.httpproxy) {
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index ff4524e1bd..14d63d6373 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -35,6 +35,7 @@ SRC_URI = " \
     file://CVE-2026-1965-1.patch \
     file://CVE-2026-1965-2.patch \
     file://CVE-2026-3783.patch \
+    file://CVE-2026-3784.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.43.0


