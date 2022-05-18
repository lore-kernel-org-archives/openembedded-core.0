Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8127C433FE
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 02:31:02 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web08.330.1652841059887177632
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 19:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=QM/VFHu9;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id
 nr2-20020a17090b240200b001df2b1bfc40so4265803pjb.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 19:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=I/I8Bgtv4ZgFDTWbUvbXxw77Q2ZH/dYACXJD0FkEqBA=;
        b=QM/VFHu9/1YagI/wb9V8/qL4SxfYTo6gJ3y1q2iDD4uKgsrgxnae/pTqm5g2RKtH8F
         nP+Jrch3b3cV8Q2PjSX/ZqFvr069EoG9W6q0I7avPKXG0Ey15i3Jz5ri97UXDHAGvRes
         lSdXI0vfWphseZKyPHQ/dBx3p46kf1SxwFydbj4ZDjNK+2sLm53xunaSr6uHH7tp6zGy
         jy3LTh8cHpFXm46B7v6VU3614UWDs2c6oHvvS8mPaiEf48A1zms6pebrGbUO/Ex6YeI0
         +VAiHEbRNmwSneeSUD9Faqh4sbhTS8BDn7ZMhP+bQpaxkKtS8B3ae2NnpUK/mp0N0m10
         DEYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I/I8Bgtv4ZgFDTWbUvbXxw77Q2ZH/dYACXJD0FkEqBA=;
        b=awRNOXtYY1tFfmD3D4qzct2bK3K62OULqJIyOYjtM11aTOK32dwGxQ9sEdVLjfoQD2
         cyGIhWiiMLMHr0oVugT3kMQui24Ss4ik3cItm7PjBEIUOaNcg4GlaTkpxjJt2B1/KbBo
         /swU7daTPcCrOXJJBw0SOWWhgKVGEQE189+01UW+71yACuwmA+d5XNKwlDCWSaH6ee3w
         DJv638fZhUl2a1mu8UKYByJ+W+BEUzr0DLorSAeO6vzFUECUxnV2yIvdAkgcGOtPAPGh
         VXZ2C5ASdOdQzG3Irwn911ND7SOuZamsNiJ3SmWmWxNVA4eFSO8HQLS0q7HtZIvd4AFU
         R0Pw==
X-Gm-Message-State: AOAM533uyGpsYGAQiVAF8dlvd8PVY+ENKWOySyauNMLjAh3f+TgM9V5X
	DyxECtkgbhj/FRGcZMnYHVw7k2JppeaZxJts
X-Google-Smtp-Source: 
 ABdhPJwu6DROZPQClsjhofI92eD4n5DfqcI62oqu8aIYx+jBmjSHzery4r42Bhe2mAsFo1oswB+3JQ==
X-Received: by 2002:a17:90b:1809:b0:1dc:1597:20c with SMTP id
 lw9-20020a17090b180900b001dc1597020cmr28110322pjb.36.1652841058228;
        Tue, 17 May 2022 19:30:58 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 p25-20020a62b819000000b00512ead539casm438926pfe.113.2022.05.17.19.30.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 19:30:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/9] curl: Fix CVEs for curl
Date: Tue, 17 May 2022 16:30:30 -1000
Message-Id: 
 <bbbd258a1c56d75ccb7e07ddc3bc1beb11d48a3a.1652840866.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652840866.git.steve@sakoman.com>
References: <cover.1652840866.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 02:31:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165784

From: Sana Kazi <Sana.Kazi@kpit.com>

Fix below listed CVEs:
CVE-2022-22576
Link: https://github.com/curl/curl/commit/852aa5ad351ea53e5f01d2f44b5b4370c2bf5425.patch

CVE-2022-27775
Link: https://github.com/curl/curl/commit/058f98dc3fe595f21dc26a5b9b1699e519ba5705.patch

CVE-2022-27776
Link: https://github.com/curl/curl/commit/6e659993952aa5f90f48864be84a1bbb047fc258.patch

Signed-off-by: Sana.Kazi <Sana.Kazi@kpit.com>
Signed-off-by: Sana Kazi <sanakazisk19@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../curl/curl/CVE-2022-22576.patch            | 148 ++++++++++++++++++
 .../curl/curl/CVE-2022-27775.patch            |  39 +++++
 .../curl/curl/CVE-2022-27776.patch            | 114 ++++++++++++++
 meta/recipes-support/curl/curl_7.69.1.bb      |   3 +
 4 files changed, 304 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-22576.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-27775.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-27776.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2022-22576.patch b/meta/recipes-support/curl/curl/CVE-2022-22576.patch
new file mode 100644
index 0000000000..13479e7f0e
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2022-22576.patch
@@ -0,0 +1,148 @@
+From 852aa5ad351ea53e5f01d2f44b5b4370c2bf5425 Mon Sep 17 00:00:00 2001
+From: Patrick Monnerat <patrick@monnerat.net>
+Date: Mon, 25 Apr 2022 11:44:05 +0200
+Subject: [PATCH] url: check sasl additional parameters for connection reuse.
+
+Also move static function safecmp() as non-static Curl_safecmp() since
+its purpose is needed at several places.
+
+Bug: https://curl.se/docs/CVE-2022-22576.html
+
+CVE-2022-22576
+
+Closes #8746
+---
+ lib/strcase.c   | 10 ++++++++++
+ lib/strcase.h   |  2 ++
+ lib/url.c       | 13 ++++++++++++-
+ lib/urldata.h   |  1 +
+ lib/vtls/vtls.c | 21 ++++++---------------
+ 5 files changed, 31 insertions(+), 16 deletions(-)
+
+CVE: CVE-2022-22576
+Upstream-Status: Backport [https://github.com/curl/curl/commit/852aa5ad351ea53e5f01d2f44b5b4370c2bf5425.patch]
+Comment: Refreshed patch
+Signed-off-by: Sana.Kazi <Sana.Kazi@kpit.com>
+
+diff --git a/lib/strcase.c b/lib/strcase.c
+index dd46ca1ba0e5..692a3f14aee7 100644
+--- a/lib/strcase.c
++++ b/lib/strcase.c
+@@ -251,6 +251,16 @@
+   } while(*src++ && --n);
+ }
+ 
++/* Compare case-sensitive NUL-terminated strings, taking care of possible
++ * null pointers. Return true if arguments match.
++ */
++bool Curl_safecmp(char *a, char *b)
++{
++  if(a && b)
++    return !strcmp(a, b);
++  return !a && !b;
++}
++
+ /* --- public functions --- */
+ 
+ int curl_strequal(const char *first, const char *second)
+diff --git a/lib/strcase.h b/lib/strcase.h
+index b234d3815220..2635f5117e99 100644
+--- a/lib/strcase.h
++++ b/lib/strcase.h
+@@ -48,4 +48,6 @@
+ void Curl_strntoupper(char *dest, const char *src, size_t n);
+ void Curl_strntolower(char *dest, const char *src, size_t n);
+ 
++bool Curl_safecmp(char *a, char *b);
++
+ #endif /* HEADER_CURL_STRCASE_H */
+diff --git a/lib/url.c b/lib/url.c
+index 9a988b4d58d8..e1647b133854 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -730,6 +730,7 @@
+   Curl_safefree(conn->allocptr.host);
+   Curl_safefree(conn->allocptr.cookiehost);
+   Curl_safefree(conn->allocptr.rtsp_transport);
++  Curl_safefree(conn->oauth_bearer);  
+   Curl_safefree(conn->trailer);
+   Curl_safefree(conn->host.rawalloc); /* host name buffer */
+   Curl_safefree(conn->conn_to_host.rawalloc); /* host name buffer */
+@@ -1251,7 +1252,9 @@
+         /* This protocol requires credentials per connection,
+            so verify that we're using the same name and password as well */
+         if(strcmp(needle->user, check->user) ||
+-           strcmp(needle->passwd, check->passwd)) {
++           strcmp(needle->passwd, check->passwd) ||
++           !Curl_safecmp(needle->sasl_authzid, check->sasl_authzid) ||
++           !Curl_safecmp(needle->oauth_bearer, check->oauth_bearer)) {			
+           /* one of them was different */
+           continue;
+         }
+@@ -3392,6 +3395,14 @@
+       result = CURLE_OUT_OF_MEMORY;
+       goto out;
+     }
++  }
++
++  if(data->set.str[STRING_BEARER]) {
++    conn->oauth_bearer = strdup(data->set.str[STRING_BEARER]);
++    if(!conn->oauth_bearer) {
++      result = CURLE_OUT_OF_MEMORY;
++      goto out;
++    }
+   }
+ 
+ #ifdef USE_UNIX_SOCKETS
+diff --git a/lib/urldata.h b/lib/urldata.h
+index 07eb19b87034..1d89b8d7fa68 100644
+--- a/lib/urldata.h
++++ b/lib/urldata.h
+@@ -949,6 +949,8 @@
+ 
+   char *sasl_authzid;     /* authorisation identity string, allocated */
+ 
++  char *oauth_bearer; /* OAUTH2 bearer, allocated */
++
+   int httpversion;        /* the HTTP version*10 reported by the server */
+   int rtspversion;        /* the RTSP version*10 reported by the server */
+ 
+diff --git a/lib/vtls/vtls.c b/lib/vtls/vtls.c
+index 03b85ba065e5..a40ac06f684f 100644
+--- a/lib/vtls/vtls.c
++++ b/lib/vtls/vtls.c
+@@ -82,15 +82,6 @@
+   else                                       \
+     dest->var = NULL;
+ 
+-static bool safecmp(char *a, char *b)
+-{
+-  if(a && b)
+-    return !strcmp(a, b);
+-  else if(!a && !b)
+-    return TRUE; /* match */
+-  return FALSE; /* no match */
+-}
+-
+ 
+ bool
+ Curl_ssl_config_matches(struct ssl_primary_config* data,
+@@ -101,12 +101,12 @@
+      (data->verifypeer == needle->verifypeer) &&
+      (data->verifyhost == needle->verifyhost) &&
+      (data->verifystatus == needle->verifystatus) &&
+-     safecmp(data->CApath, needle->CApath) &&
+-     safecmp(data->CAfile, needle->CAfile) &&
+-     safecmp(data->issuercert, needle->issuercert) &&
+-     safecmp(data->clientcert, needle->clientcert) &&
+-     safecmp(data->random_file, needle->random_file) &&
+-     safecmp(data->egdsocket, needle->egdsocket) &&
++     Curl_safecmp(data->CApath, needle->CApath) &&
++     Curl_safecmp(data->CAfile, needle->CAfile) &&
++     Curl_safecmp(data->issuercert, needle->issuercert) &&
++     Curl_safecmp(data->clientcert, needle->clientcert) &&
++     Curl_safecmp(data->random_file, needle->random_file) &&
++     Curl_safecmp(data->egdsocket, needle->egdsocket) &&     
+      Curl_safe_strcasecompare(data->cipher_list, needle->cipher_list) &&
+      Curl_safe_strcasecompare(data->cipher_list13, needle->cipher_list13) &&
+      Curl_safe_strcasecompare(data->pinned_key, needle->pinned_key))
diff --git a/meta/recipes-support/curl/curl/CVE-2022-27775.patch b/meta/recipes-support/curl/curl/CVE-2022-27775.patch
new file mode 100644
index 0000000000..b3fe7b4494
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2022-27775.patch
@@ -0,0 +1,39 @@
+From 058f98dc3fe595f21dc26a5b9b1699e519ba5705 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 25 Apr 2022 11:48:00 +0200
+Subject: [PATCH] conncache: include the zone id in the "bundle" hashkey
+
+Make connections to two separate IPv6 zone ids create separate
+connections.
+
+Reported-by: Harry Sintonen
+Bug: https://curl.se/docs/CVE-2022-27775.html
+Closes #8747
+---
+ lib/conncache.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+CVE: CVE-2022-27775
+Upstream-Status: Backport [https://github.com/curl/curl/commit/058f98dc3fe595f21dc26a5b9b1699e519ba5705.patch]
+Comment: Refreshed patch
+Signed-off-by: Sana.Kazi <Sana.Kazi@kpit.com>
+
+diff --git a/lib/conncache.c b/lib/conncache.c
+index ec669b971dc3..8948b53fa500 100644
+--- a/lib/conncache.c
++++ b/lib/conncache.c
+@@ -156,8 +156,12 @@
+     /* report back which name we used */
+     *hostp = hostname;
+ 
+-  /* put the number first so that the hostname gets cut off if too long */
+-  msnprintf(buf, len, "%ld%s", port, hostname);
++  /* put the numbers first so that the hostname gets cut off if too long */
++#ifdef ENABLE_IPV6
++  msnprintf(buf, len, "%u/%ld/%s", conn->scope_id, port, hostname);
++#else
++  msnprintf(buf, len, "%ld/%s", port, hostname);
++#endif
+ }
+ 
+ /* Returns number of connections currently held in the connection cache.
diff --git a/meta/recipes-support/curl/curl/CVE-2022-27776.patch b/meta/recipes-support/curl/curl/CVE-2022-27776.patch
new file mode 100644
index 0000000000..1a13df2d95
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2022-27776.patch
@@ -0,0 +1,114 @@
+From 6e659993952aa5f90f48864be84a1bbb047fc258 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 25 Apr 2022 13:05:40 +0200
+Subject: [PATCH] http: avoid auth/cookie on redirects same host diff port
+
+CVE-2022-27776
+
+Reported-by: Harry Sintonen
+Bug: https://curl.se/docs/CVE-2022-27776.html
+Closes #8749
+---
+ lib/http.c    | 34 ++++++++++++++++++++++------------
+ lib/urldata.h | 16 +++++++++-------
+ 2 files changed, 31 insertions(+), 19 deletions(-)
+
+CVE: CVE-2022-27776
+Upstream-Status: Backport [https://github.com/curl/curl/commit/6e659993952aa5f90f48864be84a1bbb047fc258.patch]
+Comment: Refreshed patch
+Signed-off-by: Sana.Kazi <Sana.Kazi@kpit.com>
+
+diff --git a/lib/http.c b/lib/http.c
+index ce79fc4e31c8..f0476f3b9272 100644
+--- a/lib/http.c
++++ b/lib/http.c
+@@ -731,6 +731,21 @@
+   return CURLE_OK;
+ }
+ 
++/*
++ * allow_auth_to_host() tells if autentication, cookies or other "sensitive
++ * data" can (still) be sent to this host.
++ */
++static bool allow_auth_to_host(struct Curl_easy *data)
++{
++  struct connectdata *conn = data->conn;
++  return (!data->state.this_is_a_follow ||
++          data->set.allow_auth_to_other_hosts ||
++          (data->state.first_host &&
++           strcasecompare(data->state.first_host, conn->host.name) &&
++           (data->state.first_remote_port == conn->remote_port) &&
++           (data->state.first_remote_protocol == conn->handler->protocol)));
++}
++
+ /**
+  * Curl_http_output_auth() setups the authentication headers for the
+  * host/proxy and the correct authentication
+@@ -799,15 +799,12 @@
+        with it */
+     authproxy->done = TRUE;
+ 
+-  /* To prevent the user+password to get sent to other than the original
+-     host due to a location-follow, we do some weirdo checks here */
+-  if(!data->state.this_is_a_follow ||
+-     conn->bits.netrc ||
+-     !data->state.first_host ||
+-     data->set.allow_auth_to_other_hosts ||
+-     strcasecompare(data->state.first_host, conn->host.name)) {
++  /* To prevent the user+password to get sent to other than the original host
++     due to a location-follow */
++  if(allow_auth_to_host(data)
++     || conn->bits.netrc
++    )
+     result = output_auth_headers(conn, authhost, request, path, FALSE);
+-  }
+   else
+     authhost->done = TRUE;
+ 
+@@ -1879,10 +1891,7 @@
+                    checkprefix("Cookie:", compare)) &&
+                   /* be careful of sending this potentially sensitive header to
+                      other hosts */
+-                  (data->state.this_is_a_follow &&
+-                   data->state.first_host &&
+-                   !data->set.allow_auth_to_other_hosts &&
+-                   !strcasecompare(data->state.first_host, conn->host.name)))
++                  !allow_auth_to_host(data))			  
+             ;
+           else {
+             result = Curl_add_bufferf(&req_buffer, "%s\r\n", compare);
+@@ -2065,6 +2074,7 @@
+       return CURLE_OUT_OF_MEMORY;
+ 
+     data->state.first_remote_port = conn->remote_port;
++    data->state.first_remote_protocol = conn->handler->protocol;    
+   }
+ 
+   if((conn->handler->protocol&(PROTO_FAMILY_HTTP|CURLPROTO_FTP)) &&
+diff --git a/lib/urldata.h b/lib/urldata.h
+index 1d89b8d7fa68..ef2174d9e727 100644
+--- a/lib/urldata.h
++++ b/lib/urldata.h
+@@ -1342,13 +1342,15 @@
+   char *ulbuf; /* allocated upload buffer or NULL */
+   curl_off_t current_speed;  /* the ProgressShow() function sets this,
+                                 bytes / second */
+-  char *first_host; /* host name of the first (not followed) request.
+-                       if set, this should be the host name that we will
+-                       sent authorization to, no else. Used to make Location:
+-                       following not keep sending user+password... This is
+-                       strdup() data.
+-                    */
+-  int first_remote_port; /* remote port of the first (not followed) request */
++
++  /* host name, port number and protocol of the first (not followed) request.
++     if set, this should be the host name that we will sent authorization to,
++     no else. Used to make Location: following not keep sending user+password.
++     This is strdup()ed data. */
++  char *first_host;
++  int first_remote_port;
++  unsigned int first_remote_protocol;
++
+   struct curl_ssl_session *session; /* array of 'max_ssl_sessions' size */
+   long sessionage;                  /* number of the most recent session */
+   unsigned int tempcount; /* number of entries in use in tempwrite, 0 - 3 */
diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-support/curl/curl_7.69.1.bb
index bc1b993e9e..e850376ff8 100644
--- a/meta/recipes-support/curl/curl_7.69.1.bb
+++ b/meta/recipes-support/curl/curl_7.69.1.bb
@@ -25,6 +25,9 @@ SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://CVE-2021-22946-pre1.patch \
            file://CVE-2021-22946.patch \
            file://CVE-2021-22947.patch \
+           file://CVE-2022-27776.patch \
+           file://CVE-2022-27775.patch \
+           file://CVE-2022-22576.patch \
 "
 
 SRC_URI[md5sum] = "ec5fc263f898a3dfef08e805f1ecca42"
-- 
2.25.1


