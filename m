Return-Path: <bindudaniel1996@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE91EC4332F
	for <webhook@archiver.kernel.org>; Tue, 29 Nov 2022 03:58:44 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.140793.1669694315242888149
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Nov 2022 19:58:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LlJZc0jl;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: bindudaniel1996@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id w4-20020a17090ac98400b002186f5d7a4cso16128687pjt.0
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 19:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eGJOQ07YOJcJvHcjw5LFxK/627NusHqu2hMUOrP2B0w=;
        b=LlJZc0jlWtyuuimhIUWTET2dCzPJHn6PHULdkDFtjHfkzb/A2JaHDlx8ejePBORhSs
         b5kavCU8as0634J0D59WSv5ic7Karxyl8KkA/c39/OBzPHRCaUsyOAlKGBfByH3hqus4
         E+ZnASXwKcoE+Oi/GgAGUYVpV1+woqPQ+2lYoA/xVr3s6Rp/OOgWv/RT+ZpRh3LGbFcJ
         D1kusHIlpQAK0zwDLlVCuxWXvNgMdjx22l2ePkHLpXv5KlnzQHiqCYnoOuQKpLuJ5Yq7
         Dt7iwcd/i4Swfb+EJGXDd5h5PKZP0hVha4N83eHCfEp1lxV9/pB4it1oDJvAfGJXz/6E
         q/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eGJOQ07YOJcJvHcjw5LFxK/627NusHqu2hMUOrP2B0w=;
        b=UT9mrq7U/spDJdNhRYzFVdnhe8ks5xS+lti9TCWm+ZaKchUE+Dqp+Gh0lARKMg9P9s
         zFjtWuef+HgIIWqmBDGextG4LEkFqNXOCcG2+6NkgG5KdJi/T4N85dhSSAO2HMjJYSpH
         sSxFKEAryeroQPMRyb4D+GNNjKh9m1TmSRUaTExMJl5lQH5LwtUlGaFjk+Vw5xY9lqNu
         28MwwS9H/efq86P7LrsFVIBaDCLuAmonTyESt4JJQsXmeguDgWqUsYSIWEf9vbvWavlY
         7Gw1s5QjIWfq+8YUrUcBF2hwdhLJFOAaClqDv7edR2gF6w+crxzwVV/P3NZcuhciFOcj
         QwZg==
X-Gm-Message-State: ANoB5pmflcCqUNVlwXh9uIDmxakRtqFvKwtJ+7RjUpZPsmnajDRuiz7s
	lCtPlp/9qZJNupWX5B5EzBQyRLXoBSI=
X-Google-Smtp-Source: AA0mqf6ecdilGxMPVzHsoL7zQVPkm+bR8XgGYjmdKz3MwGyN2jadbJKB/XwG+gfzfu4gQqvcxVUAFg==
X-Received: by 2002:a17:902:d550:b0:189:7bfe:1eb5 with SMTP id z16-20020a170902d55000b001897bfe1eb5mr13014366plf.9.1669694314435;
        Mon, 28 Nov 2022 19:58:34 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1f26:1387:97d:de1f:a2d:f4b0])
        by smtp.gmail.com with ESMTPSA id x8-20020aa79568000000b005633a06ad67sm8783651pfq.64.2022.11.28.19.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 19:58:34 -0800 (PST)
From: Bhabu Bindu <bindudaniel1996@gmail.com>
To: openembedded-core@lists.openembedded.org,
	bhabu.bindu@kpit.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [OE-core][kirkstone][PATCH 2/3] curl: Fix CVE-2022-42916
Date: Tue, 29 Nov 2022 09:27:18 +0530
Message-Id: <20221129035719.9207-2-bindudaniel1996@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221129035719.9207-1-bindudaniel1996@gmail.com>
References: <20221129035719.9207-1-bindudaniel1996@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Nov 2022 03:58:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173956

From: Bhabu Bindu <bhabu.bindu@kpit.com>

HSTS bypass via IDN

Link: https://security-tracker.debian.org/tracker/CVE-2022-42916

Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
---
 .../curl/curl/CVE-2022-42916.patch            | 136 ++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |   1 +
 2 files changed, 137 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-42916.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2022-42916.patch b/meta/recipes-support/curl/curl/CVE-2022-42916.patch
new file mode 100644
index 0000000000..fbc592280a
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2022-42916.patch
@@ -0,0 +1,136 @@
+From 53bcf55b4538067e6dc36242168866becb987bb7 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 12 Oct 2022 10:47:59 +0200
+Subject: [PATCH] url: use IDN decoded names for HSTS checks
+
+Reported-by: Hiroki Kurosawa
+
+Closes #9791
+
+CVE: CVE-2022-42916
+Upstream-Status: Backport [https://github.com/curl/curl/commit/53bcf55b4538067e6dc36242168866becb987bb7]
+Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
+Comments: Refreshed hunk
+---
+ lib/url.c | 91 ++++++++++++++++++++++++++++---------------------------
+ 1 file changed, 47 insertions(+), 44 deletions(-)
+
+diff --git a/lib/url.c b/lib/url.c
+index a3be56bced9de..690c53c81a3c1 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -2012,10 +2012,56 @@
+     if(!strcasecompare("file", data->state.up.scheme))
+       return CURLE_OUT_OF_MEMORY;
+   }
++  hostname = data->state.up.hostname;
++
++  if(hostname && hostname[0] == '[') {
++    /* This looks like an IPv6 address literal. See if there is an address
++       scope. */
++    size_t hlen;
++    conn->bits.ipv6_ip = TRUE;
++    /* cut off the brackets! */
++    hostname++;
++    hlen = strlen(hostname);
++    hostname[hlen - 1] = 0;
++
++    zonefrom_url(uh, data, conn);
++  }
++
++  /* make sure the connect struct gets its own copy of the host name */
++  conn->host.rawalloc = strdup(hostname ? hostname : "");
++  if(!conn->host.rawalloc)
++    return CURLE_OUT_OF_MEMORY;
++  conn->host.name = conn->host.rawalloc;
++
++  /*************************************************************
++   * IDN-convert the hostnames
++   *************************************************************/
++  result = Curl_idnconvert_hostname(data, &conn->host);
++  if(result)
++    return result;
++  if(conn->bits.conn_to_host) {
++    result = Curl_idnconvert_hostname(data, &conn->conn_to_host);
++    if(result)
++      return result;
++  }
++#ifndef CURL_DISABLE_PROXY
++  if(conn->bits.httpproxy) {
++    result = Curl_idnconvert_hostname(data, &conn->http_proxy.host);
++    if(result)
++      return result;
++  }
++  if(conn->bits.socksproxy) {
++    result = Curl_idnconvert_hostname(data, &conn->socks_proxy.host);
++    if(result)
++      return result;
++  }
++#endif
+
+ #ifndef CURL_DISABLE_HSTS
++  /* HSTS upgrade */
+   if(data->hsts && strcasecompare("http", data->state.up.scheme)) {
+-    if(Curl_hsts(data->hsts, data->state.up.hostname, TRUE)) {
++   /* This MUST use the IDN decoded name */
++   if(Curl_hsts(data->hsts, conn->host.name, TRUE)) {
+       char *url;
+       Curl_safefree(data->state.up.scheme);
+       uc = curl_url_set(uh, CURLUPART_SCHEME, "https", 0);
+@@ -2145,26 +2191,6 @@ static CURLcode parseurlandfillconn(struct Curl_easy *data,
+ 
+   (void)curl_url_get(uh, CURLUPART_QUERY, &data->state.up.query, 0);
+ 
+-  hostname = data->state.up.hostname;
+-  if(hostname && hostname[0] == '[') {
+-    /* This looks like an IPv6 address literal. See if there is an address
+-       scope. */
+-    size_t hlen;
+-    conn->bits.ipv6_ip = TRUE;
+-    /* cut off the brackets! */
+-    hostname++;
+-    hlen = strlen(hostname);
+-    hostname[hlen - 1] = 0;
+-
+-    zonefrom_url(uh, data, conn);
+-  }
+-
+-  /* make sure the connect struct gets its own copy of the host name */
+-  conn->host.rawalloc = strdup(hostname ? hostname : "");
+-  if(!conn->host.rawalloc)
+-    return CURLE_OUT_OF_MEMORY;
+-  conn->host.name = conn->host.rawalloc;
+-
+ #ifdef ENABLE_IPV6
+   if(data->set.scope_id)
+     /* Override any scope that was set above.  */
+@@ -3713,29 +3739,6 @@ static CURLcode create_conn(struct Curl_easy *data,
+   if(result)
+     goto out;
+ 
+-  /*************************************************************
+-   * IDN-convert the hostnames
+-   *************************************************************/
+-  result = Curl_idnconvert_hostname(data, &conn->host);
+-  if(result)
+-    goto out;
+-  if(conn->bits.conn_to_host) {
+-    result = Curl_idnconvert_hostname(data, &conn->conn_to_host);
+-    if(result)
+-      goto out;
+-  }
+-#ifndef CURL_DISABLE_PROXY
+-  if(conn->bits.httpproxy) {
+-    result = Curl_idnconvert_hostname(data, &conn->http_proxy.host);
+-    if(result)
+-      goto out;
+-  }
+-  if(conn->bits.socksproxy) {
+-    result = Curl_idnconvert_hostname(data, &conn->socks_proxy.host);
+-    if(result)
+-      goto out;
+-  }
+-#endif
+ 
+   /*************************************************************
+    * Check whether the host and the "connect to host" are equal.
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index 641614fb0d..4d49ac33eb 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -30,6 +30,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2022-32208.patch \
            file://CVE-2022-35252.patch \
            file://CVE-2022-32221.patch \
+           file://CVE-2022-42916.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 
-- 
2.17.1


