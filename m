Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CBE6C4321E
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 14:27:52 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.44915.1669904863309351416
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 06:27:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=rq7PJmA8;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id w129so2019425pfb.5
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 06:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=atEdE0WNYJjUc9GqCVbi2mWqEu6ABkpg+LX7x4cflKQ=;
        b=rq7PJmA8bb900nWj3ZI6iOZmr/ZiJj5VlI1z6GmPWDsjvCJ4E+aG0nRZ3xVWRu/nCe
         XYNfsefnLmTbyhY95/mm9/4Ec2vnxA0ETyDQK04x1mwMIe8RFgi5mJH5hyYUcJawRGyh
         QYHg85vLamKBfsEd9FOIBjIPR6I5GgcC/fcbXqT5ND5duVxybOPU5YnB5GNmS+fbwJ0n
         UB+V/B12soEykPzVk6IvUqgOLTrQ5YH8if1sJ+MjtH1Uh4KQLUatsVS1CiAmKi2Nqyuf
         GmZaqbzA/wGoJNFpAhQUTb0JhyupdSGiiUlF8dPWbZhJ5wCzGfzaqWn7bAc1HVPLWRNl
         Yd6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=atEdE0WNYJjUc9GqCVbi2mWqEu6ABkpg+LX7x4cflKQ=;
        b=FURobUYUgYmk0rzOHYrpgInkXdGbhlBI+kjZjFBVWT4VsNlkLpygpMMg4J0iRVCoQH
         /eY9durSGOc1INqL0OS5MU510oDLd+Bl1AiVUwX4l57D7+OqJZm53r/zdfNbYDJ5zFii
         TcTPTXWLabcq/XJtVERgpvkQpWTizpAj3Iu2NedsJ0WuA6csTYCgWtosymt8bYVLk1Lh
         nqKSnnNaS4Vb5XGtX4Saz/6ri811v/72qYU73kGgh0DKMGdcicIWOPr7WCYnrRp04eZk
         0TmXjdq2HAW3nmzsnXdeg82WWfu6mWOWNcO4oCfI/7bNxz06OgBAFnxC6/A0skG6LrNW
         z0aA==
X-Gm-Message-State: ANoB5pmdTZzooL+hNPncQh2NRMW8ls4zN0GlugHff4F7kpjzsk4UacZW
	ir/UIiJGw8yodyTC9+Q6JfFcub1SbqUuRPPMhp0=
X-Google-Smtp-Source: AA0mqf6DvMV9Rp/34KpUPo8Lyc7CFcPlvHYL/MC/JYIHR6i9s60YJzV7w5gp3GWR3whKAgDGkKEImA==
X-Received: by 2002:aa7:8054:0:b0:56c:4303:a93d with SMTP id y20-20020aa78054000000b0056c4303a93dmr51449657pfm.73.1669904862195;
        Thu, 01 Dec 2022 06:27:42 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id b14-20020a17090a6ace00b00218e8a0d7f0sm4908308pjm.22.2022.12.01.06.27.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 06:27:41 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/23] curl: Fix CVE-2022-42916
Date: Thu,  1 Dec 2022 04:27:01 -1000
Message-Id: <e6796b426503477620e0e5c5c9da50352269a593.1669904703.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669904703.git.steve@sakoman.com>
References: <cover.1669904703.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 14:27:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174093

From: Bhabu Bindu <bhabu.bindu@kpit.com>

HSTS bypass via IDN

Link: https://security-tracker.debian.org/tracker/CVE-2022-42916

Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
index e0099f7453..a3e29a583d 100644
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
2.25.1


