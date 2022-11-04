Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CF50C4332F
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 05:26:38 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web08.7996.1667539588764489115
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 22:26:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=OvCB9ONa;
 spf=pass (domain: mvista.com, ip: 209.85.210.179, mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f179.google.com with SMTP id b29so3560255pfp.13
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 22:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gFU4oGyiTYcjYHQos7YIo4hSIYOK+Uae3YWX7hO8vgA=;
        b=OvCB9ONaVFM6fhSxFsY9wf1b3Y6ik8BdOfRcUzWc0WEpkaoasKFUP0GzOMMi0P1moC
         0GKDjqB/Dj0MY8T3oO7uPTOQth3LpsYBvPwlvhr9D2SVCmij/+NL+oJWQa7ZInpI7+YS
         UQ9Kc9pOaQ2JrghzQWJQq62uO+ioOc57Rscco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gFU4oGyiTYcjYHQos7YIo4hSIYOK+Uae3YWX7hO8vgA=;
        b=2y1kSCuIBv6mYmM9RmTX25Vqn4aAmtOV+cZeF46sW/GUUoffjbwb3dfMPR0cuOSg/o
         beCHm9/2qrWeTrZAjS+SvdgMtRAwZUDHkmRmvP9naFPpgx8QRGJagYJmSRTCEtXCREKa
         BKiWl3VRLFFdO3hefYttKOFUvBuAfgZkfjdwO1X8h3Kf4/wAhgbfUCWqn1gNvJiWkqda
         SC7S/+l7rPWFSVW8yd2y2hLGUBQM+DjqNOqadmCWKijKbYHVxem2hX3ahEwICkaAnWTo
         McYkjBCv0Ro63+q9V8mx7sGInXgKtyL7nhOSX0votmSPwG4I6ggCPtg7y9PqFVLb0+3C
         pHzA==
X-Gm-Message-State: ACrzQf0xiFsDYgFx6Tsk8PSp7U5wJOA2ka6TwGdDVWx1FAN/JM+CVMex
	Gn6B+HPnW/Z6wLb6pSbfiytui6ExgDtLUg==
X-Google-Smtp-Source: AMsMyM5wiDDTDgh5SUK6wXx3rtSgjeX9YxJRYeCK0PFrG+SAER5e5GEGhDWvAEh3Xcx9rYSJDBpUvg==
X-Received: by 2002:a63:fe58:0:b0:46f:dc58:b23c with SMTP id x24-20020a63fe58000000b0046fdc58b23cmr17495262pgj.205.1667539586861;
        Thu, 03 Nov 2022 22:26:26 -0700 (PDT)
Received: from MVIN00024 ([43.249.234.213])
        by smtp.gmail.com with ESMTPSA id y18-20020a170902b49200b001806445887asm1572259plr.223.2022.11.03.22.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 22:26:26 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Fri, 04 Nov 2022 10:56:21 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] curl: Fix multiple CVEs
Date: Fri,  4 Nov 2022 10:56:19 +0530
Message-Id: <20221104052619.107569-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 05:26:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172693

Backport fixes for:
 * CVE-2022-32221 - Upstream-Status: Backport from https://github.com/curl/curl/commit/a64e3e59938abd7d6
 * CVE-2022-42915 - Upstream-Status: Backport from https://github.com/curl/curl/commit/55e1875729f9d9fc7315ce
 * CVE-2022-42916 - Upstream-Status: Backport from https://github.com/curl/curl/commit/53bcf55b4538067e6

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../curl/curl/CVE-2022-32221.patch            |  29 ++++
 .../curl/curl/CVE-2022-42915.patch            |  55 +++++++
 .../curl/curl/CVE-2022-42916.patch            | 136 ++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |   3 +
 4 files changed, 223 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-32221.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-42915.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-42916.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2022-32221.patch b/meta/recipes-support/curl/curl/CVE-2022-32221.patch
new file mode 100644
index 0000000000..caf4bac2cb
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2022-32221.patch
@@ -0,0 +1,29 @@
+From 84bbc1b45962cee04758b41251a5aeb452b3ec54 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Fri, 4 Nov 2022 10:05:36 +0530
+Subject: [PATCH] CVE-2022-32221
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/a64e3e59938abd7d6]
+CVE: CVE-2022-32221
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+
+setopt: when POST is set, reset the 'upload' field
+---
+ lib/setopt.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/setopt.c b/lib/setopt.c
+index 7aa6fdb..7f5999e 100644
+--- a/lib/setopt.c
++++ b/lib/setopt.c
+@@ -625,6 +625,7 @@ CURLcode Curl_vsetopt(struct Curl_easy *data, CURLoption option, va_list param)
+     }
+     else
+       data->set.method = HTTPREQ_GET;
++      data->set.upload = FALSE;
+     break;
+ 
+   case CURLOPT_HTTPPOST:
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/curl/curl/CVE-2022-42915.patch b/meta/recipes-support/curl/curl/CVE-2022-42915.patch
new file mode 100644
index 0000000000..8b71a4d61c
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2022-42915.patch
@@ -0,0 +1,55 @@
+From b82afc7231a23a27a671f54712e0c8b2df6be144 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Fri, 4 Nov 2022 10:08:06 +0530
+Subject: [PATCH] CVE-2022-42915
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/55e1875729f9d9fc7315ce]
+CVE: CVE-2022-42915
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+
+http_proxy: restore the protocol pointer on error
+---
+ lib/http_proxy.c | 6 ++----
+ lib/url.c        | 9 ---------
+ 2 files changed, 2 insertions(+), 13 deletions(-)
+
+diff --git a/lib/http_proxy.c b/lib/http_proxy.c
+index 5d5ffc0..e902a2a 100644
+--- a/lib/http_proxy.c
++++ b/lib/http_proxy.c
+@@ -210,10 +210,8 @@ void Curl_connect_done(struct Curl_easy *data)
+     Curl_dyn_free(&s->rcvbuf);
+     Curl_dyn_free(&s->req);
+ 
+-    /* restore the protocol pointer, if not already done */
+-    if(s->prot_save)
+-      data->req.p.http = s->prot_save;
+-    s->prot_save = NULL;
++    /* restore the protocol pointer */
++    data->req.p.http = s->prot_save;
+     data->info.httpcode = 0; /* clear it as it might've been used for the
+                                 proxy */
+     data->req.ignorebody = FALSE;
+diff --git a/lib/url.c b/lib/url.c
+index c713e54..4ae6091 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -728,15 +728,6 @@ static void conn_shutdown(struct Curl_easy *data, struct connectdata *conn)
+   DEBUGASSERT(data);
+   infof(data, "Closing connection %ld", conn->connection_id);
+ 
+-#ifndef USE_HYPER
+-  if(conn->connect_state && conn->connect_state->prot_save) {
+-    /* If this was closed with a CONNECT in progress, cleanup this temporary
+-       struct arrangement */
+-    data->req.p.http = NULL;
+-    Curl_safefree(conn->connect_state->prot_save);
+-  }
+-#endif
+-
+   /* possible left-overs from the async name resolvers */
+   Curl_resolver_cancel(data);
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/curl/curl/CVE-2022-42916.patch b/meta/recipes-support/curl/curl/CVE-2022-42916.patch
new file mode 100644
index 0000000000..402f31d727
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2022-42916.patch
@@ -0,0 +1,136 @@
+From 099afdea12483391d56d3bfb8e6e7510bdc957fa Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Fri, 4 Nov 2022 10:10:49 +0530
+Subject: [PATCH] CVE-2022-42916
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/53bcf55b4538067e6]
+CVE: CVE-2022-42916
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+
+url: use IDN decoded names for HSTS checks
+---
+ lib/url.c | 91 ++++++++++++++++++++++++++++---------------------------
+ 1 file changed, 47 insertions(+), 44 deletions(-)
+
+diff --git a/lib/url.c b/lib/url.c
+index 4ae6091..4707fe6 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -2003,10 +2003,56 @@ static CURLcode parseurlandfillconn(struct Curl_easy *data,
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
++    /* This MUST use the IDN decoded name */
++    if(Curl_hsts(data->hsts, conn->host.name, TRUE)) {
+       char *url;
+       Curl_safefree(data->state.up.scheme);
+       uc = curl_url_set(uh, CURLUPART_SCHEME, "https", 0);
+@@ -2111,26 +2157,6 @@ static CURLcode parseurlandfillconn(struct Curl_easy *data,
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
+@@ -3705,29 +3731,6 @@ static CURLcode create_conn(struct Curl_easy *data,
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
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index 5368c91f5c..8270003f62 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -29,6 +29,9 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2022-32207.patch \
            file://CVE-2022-32208.patch \
            file://CVE-2022-35252.patch \
+           file://CVE-2022-32221.patch \
+           file://CVE-2022-42915.patch \
+           file://CVE-2022-42916.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 
-- 
2.25.1


