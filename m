Return-Path: <sanakazisk19@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11508C433EF
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 10:33:59 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web08.27058.1652697233071774811
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 03:33:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HPU43A7O;
 spf=pass (domain: gmail.com, ip: 209.85.214.180,
 mailfrom: sanakazisk19@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id bh5so2214465plb.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 03:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id;
        bh=+ySAONQ+IlvNAqjCdK8jxXMTmNP650iYd98vsuZa8ww=;
        b=HPU43A7Obv2Zib226AiNGyLJNQ/7C9mz/Oq6uwCfpLmBsNgaMbGiHcEYXcCXTPt55n
         lBsS5orUiQc88JyQoUUqUabennPlJzYFGW6JJlp7WyUFruN0UcT5602bqdTzdKiKazh5
         Du9t+b09/fXCB2PMnOHE4Cp0gtdjDVU/6aeSrbSzOkhcMFGppTtIt3GCqDb9ti5rL3MV
         syoZRTQIJ4STMgZN6uhl6AbDlpWM4NZxMIAXpnsExng8uFy5aO89+dFs4xduGVIMJ7zR
         0GywkVxiQSD969f6fW2Q5KX99JpYx7j4261u3hXnu/5oV6z/zpzsLul+KN79LF6P0/AO
         EP1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=+ySAONQ+IlvNAqjCdK8jxXMTmNP650iYd98vsuZa8ww=;
        b=J+/Mp2PC7rAbaAgJ9ya0O2nMTbeb8F84l6AdVfGryVXV4JWsOLqgszmzq+kx0BD73L
         cMnLThBe+u2xt1a38sPfqLhI08ZybjAjhGACOKYWdRCPmI+rz9FqrptNqbXcM+SM0EGS
         d1xi3F9LN9zqq24W8wFfBYtMAPK40bRtcdyvJ3wVO3NSvogw8N1VnyrbVzbEtwDf1bZ+
         vVQxaTFAQNY9V1oItXzRtZA/CT6aeQN5d8pQmity361VyYT+7K/j3VMb6z5PXK04wV8S
         fd3p2zviVNsroIup7HB9RMRPKdbXxIdY3oPZtCsn7ZDKr/V2lq36tEc9U0WT0fxfAN7l
         PFPw==
X-Gm-Message-State: AOAM531xDarorxL5eUFQVeIVjLuQU9U3rDsO5qNeyuqlgy88MgU9aIYS
	TLX5hO9cMATSspfYTg1qAQ8glEU3eVkR0A==
X-Google-Smtp-Source: 
 ABdhPJzm/oEpiqJ3ShCxr4yIe8XPd3VQIqweBicY4X4XN0LAzNRMkFsJ37qfo5XuTzHm8oIu1I236g==
X-Received: by 2002:a17:903:2609:b0:161:58c6:77e7 with SMTP id
 jd9-20020a170903260900b0016158c677e7mr9233298plb.36.1652697232011;
        Mon, 16 May 2022 03:33:52 -0700 (PDT)
Received: from localhost.localdomain ([103.115.128.22])
        by smtp.gmail.com with ESMTPSA id
 q16-20020a170902dad000b0015e8d4eb26fsm7032247plx.185.2022.05.16.03.33.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 03:33:51 -0700 (PDT)
From: Sana <sanakazisk19@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [poky][dunfell][PATCH] curl: Fix CVEs for curl
Date: Mon, 16 May 2022 16:03:32 +0530
Message-Id: <20220516103332.6554-1-sanakazisk19@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 May 2022 10:33:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165673

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
2.17.1


