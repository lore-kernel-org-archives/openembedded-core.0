Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D180C072A2
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 18:28:08 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.web11.21027.1700072880640150602
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 10:28:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=MqWfK9Hw;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=9201; q=dns/txt; s=iport;
  t=1700072880; x=1701282480;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hFlDO1hqZpY4+W8jT9S2wKqUKcTJErOOolj5gjvPevs=;
  b=MqWfK9HwuZnmP3tT0/E4oF9B2dffH7J4wrgkQJkFOc51lokX1Mm7t41T
   lRfZJ/SBFnAuc8M8uOOyP+RVMAMr8ZO2dr83nqKpvWUhVeG7oYJEcJ5yQ
   Cx6LuSwE3ttt2iTk7uC4Fal7CQcvv9BbUCYPkWusCB0wwzrPtxlfgr3yF
   g=;
X-CSE-ConnectionGUID: D0TjQOxGTreJTy2TiLJEIA==
X-CSE-MsgGUID: iDK8L4E5R5mhGT96FCiX0A==
X-IronPort-AV: E=Sophos;i="6.03,305,1694736000"; 
   d="scan'208";a="194125626"
Received: from alln-core-3.cisco.com ([173.36.13.136])
  by alln-iport-1.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 18:28:00 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	by alln-core-3.cisco.com (8.15.2/8.15.2) with ESMTPS id 3AFIRxLX032137
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 15 Nov 2023 18:27:59 GMT
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 46270CC1280; Wed, 15 Nov 2023 10:27:59 -0800 (PST)
From: Deepak Rathore <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: deeratho@cisco.com
Subject: [OE-core] [mickledore] [PATCH] curl 8.0.1: Fix CVE-2023-38039
Date: Wed, 15 Nov 2023 10:27:55 -0800
Message-Id: <20231115182755.2395463-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: alln-core-3.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 18:28:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190741

Upstream Repository: https://github.com/curl/curl.git

Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2023-38039
Type: Security Fix
CVE: CVE-2023-38039
Score: 7.5
Patch: https://github.com/curl/curl/commit/3ee79c1674fd6f9

Signed-off-by: Deepak Rathore <deeratho@cisco.com>

diff --git a/meta/recipes-support/curl/curl/CVE-2023-38039.patch b/meta/recipes-support/curl/curl/CVE-2023-38039.patch
new file mode 100644
index 0000000000..cdf8612274
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-38039.patch
@@ -0,0 +1,204 @@
+From d942d0a479c428a2aa6981d576307568042c3a97 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 2 Aug 2023 23:34:48 +0200
+Subject: [PATCH] http: return error when receiving too large header set
+
+To avoid abuse. The limit is set to 300 KB for the accumulated size of
+all received HTTP headers for a single response. Incomplete research
+suggests that Chrome uses a 256-300 KB limit, while Firefox allows up to
+1MB.
+
+Closes #11582
+
+CVE: CVE-2023-38039
+Upstream-Status: Backport
+[https://github.com/curl/curl/commit/3ee79c1674fd6f9]
+
+Backport Changes:
+Dropped the changes of lib/cf-h1-proxy.c file as this file is not
+present in current version of curl and added in curl from curl-8_1_0
+version with below commit:
+https://github.com/curl/curl/commit/4ae2d9f24
+
+(cherry picked from commit 3ee79c1674fd6f99e8efca52cd7510e08b766770)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+
+diff --git a/lib/c-hyper.c b/lib/c-hyper.c
+index 9c7632d35..28f64ef97 100644
+--- a/lib/c-hyper.c
++++ b/lib/c-hyper.c
+@@ -174,8 +174,11 @@ static int hyper_each_header(void *userdata,
+     }
+   }
+ 
+-  data->info.header_size += (curl_off_t)len;
+-  data->req.headerbytecount += (curl_off_t)len;
++  result = Curl_bump_headersize(data, len, FALSE);
++  if(result) {
++    data->state.hresult = result;
++    return HYPER_ITER_BREAK;
++  }
+   return HYPER_ITER_CONTINUE;
+ }
+ 
+@@ -305,9 +308,8 @@ static CURLcode status_line(struct Curl_easy *data,
+     if(result)
+       return result;
+   }
+-  data->info.header_size += (curl_off_t)len;
+-  data->req.headerbytecount += (curl_off_t)len;
+-  return CURLE_OK;
++  result = Curl_bump_headersize(data, len, FALSE);
++  return result;
+ }
+ 
+ /*
+diff --git a/lib/http.c b/lib/http.c
+index 400d2b081..d8c3e1eda 100644
+--- a/lib/http.c
++++ b/lib/http.c
+@@ -3760,6 +3760,29 @@ static CURLcode verify_header(struct Curl_easy *data)
+   return CURLE_OK;
+ }
+ 
++CURLcode Curl_bump_headersize(struct Curl_easy *data,
++                              size_t delta,
++                              bool connect_only)
++{
++  size_t bad = 0;
++  if(delta < MAX_HTTP_RESP_HEADER_SIZE) {
++    if(!connect_only)
++      data->req.headerbytecount += (unsigned int)delta;
++    data->info.header_size += (unsigned int)delta;
++    if(data->info.header_size > MAX_HTTP_RESP_HEADER_SIZE)
++      bad = data->info.header_size;
++  }
++  else
++    bad = data->info.header_size + delta;
++  if(bad) {
++    failf(data, "Too large response headers: %zu > %zu",
++          bad, MAX_HTTP_RESP_HEADER_SIZE);
++    return CURLE_RECV_ERROR;
++  }
++  return CURLE_OK;
++}
++
++
+ /*
+  * Read any HTTP header lines from the server and pass them to the client app.
+  */
+@@ -4007,8 +4030,9 @@ CURLcode Curl_http_readwrite_headers(struct Curl_easy *data,
+       if(result)
+         return result;
+ 
+-      data->info.header_size += (long)headerlen;
+-      data->req.headerbytecount += (long)headerlen;
++      result = Curl_bump_headersize(data, headerlen, FALSE);
++      if(result)
++        return result;
+ 
+       /*
+        * When all the headers have been parsed, see if we should give
+@@ -4330,8 +4354,10 @@ CURLcode Curl_http_readwrite_headers(struct Curl_easy *data,
+     if(result)
+       return result;
+ 
+-    data->info.header_size += Curl_dyn_len(&data->state.headerb);
+-    data->req.headerbytecount += Curl_dyn_len(&data->state.headerb);
++    result = Curl_bump_headersize(data, Curl_dyn_len(&data->state.headerb),
++                                  FALSE);
++    if(result)
++      return result;
+ 
+     Curl_dyn_reset(&data->state.headerb);
+   }
+diff --git a/lib/http.h b/lib/http.h
+index 444abc0be..b29f3b84f 100644
+--- a/lib/http.h
++++ b/lib/http.h
+@@ -61,6 +61,10 @@ extern const struct Curl_handler Curl_handler_wss;
+ #endif /* websockets */
+ 
+ 
++CURLcode Curl_bump_headersize(struct Curl_easy *data,
++                              size_t delta,
++                              bool connect_only);
++
+ /* Header specific functions */
+ bool Curl_compareheader(const char *headerline,  /* line to check */
+                         const char *header,   /* header keyword _with_ colon */
+@@ -176,6 +180,11 @@ CURLcode Curl_http_auth_act(struct Curl_easy *data);
+ #define EXPECT_100_THRESHOLD (1024*1024)
+ #endif
+ 
++/* MAX_HTTP_RESP_HEADER_SIZE is the maximum size of all response headers
++   combined that libcurl allows for a single HTTP response, any HTTP
++   version. This count includes CONNECT response headers. */
++#define MAX_HTTP_RESP_HEADER_SIZE (300*1024)
++
+ #endif /* CURL_DISABLE_HTTP */
+ 
+ #ifdef USE_NGHTTP3
+diff --git a/lib/pingpong.c b/lib/pingpong.c
+index 2f4aa1c34..189a0b68e 100644
+--- a/lib/pingpong.c
++++ b/lib/pingpong.c
+@@ -341,7 +341,9 @@ CURLcode Curl_pp_readresp(struct Curl_easy *data,
+       ssize_t clipamount = 0;
+       bool restart = FALSE;
+ 
+-      data->req.headerbytecount += (long)gotbytes;
++      result = Curl_bump_headersize(data, gotbytes, FALSE);
++      if(result)
++        return result;
+ 
+       pp->nread_resp += gotbytes;
+       for(i = 0; i < gotbytes; ptr++, i++) {
+diff --git a/lib/urldata.h b/lib/urldata.h
+index f3e782ad3..390c611e2 100644
+--- a/lib/urldata.h
++++ b/lib/urldata.h
+@@ -619,17 +619,16 @@ struct SingleRequest {
+   curl_off_t bytecount;         /* total number of bytes read */
+   curl_off_t writebytecount;    /* number of bytes written */
+ 
+-  curl_off_t headerbytecount;   /* only count received headers */
+-  curl_off_t deductheadercount; /* this amount of bytes doesn't count when we
+-                                   check if anything has been transferred at
+-                                   the end of a connection. We use this
+-                                   counter to make only a 100 reply (without a
+-                                   following second response code) result in a
+-                                   CURLE_GOT_NOTHING error code */
+-
+   curl_off_t pendingheader;      /* this many bytes left to send is actually
+                                     header and not body */
+   struct curltime start;         /* transfer started at this time */
++  unsigned int headerbytecount;  /* only count received headers */
++  unsigned int deductheadercount; /* this amount of bytes doesn't count when
++                                     we check if anything has been transferred
++                                     at the end of a connection. We use this
++                                     counter to make only a 100 reply (without
++                                     a following second response code) result
++                                     in a CURLE_GOT_NOTHING error code */
+   enum {
+     HEADER_NORMAL,              /* no bad header at all */
+     HEADER_PARTHEADER,          /* part of the chunk is a bad header, the rest
+@@ -1076,7 +1075,6 @@ struct PureInfo {
+   int httpversion; /* the http version number X.Y = X*10+Y */
+   time_t filetime; /* If requested, this is might get set. Set to -1 if the
+                       time was unretrievable. */
+-  curl_off_t header_size;  /* size of read header(s) in bytes */
+   curl_off_t request_size; /* the amount of bytes sent in the request(s) */
+   unsigned long proxyauthavail; /* what proxy auth types were announced */
+   unsigned long httpauthavail;  /* what host auth types were announced */
+@@ -1084,6 +1082,7 @@ struct PureInfo {
+   char *contenttype; /* the content type of the object */
+   char *wouldredirect; /* URL this would've been redirected to if asked to */
+   curl_off_t retry_after; /* info from Retry-After: header */
++  unsigned int header_size;  /* size of read header(s) in bytes */
+ 
+   /* PureInfo members 'conn_primary_ip', 'conn_primary_port', 'conn_local_ip'
+      and, 'conn_local_port' are copied over from the connectdata struct in
+-- 
+2.33.0
+
diff --git a/meta/recipes-support/curl/curl_8.0.1.bb b/meta/recipes-support/curl/curl_8.0.1.bb
index 375b4d2f93..04da092ee9 100644
--- a/meta/recipes-support/curl/curl_8.0.1.bb
+++ b/meta/recipes-support/curl/curl_8.0.1.bb
@@ -21,6 +21,7 @@ SRC_URI = " \
     file://CVE-2023-28320-fol1.patch \
     file://CVE-2023-38545.patch \
     file://CVE-2023-38546.patch \
+    file://CVE-2023-38039.patch \
 "
 SRC_URI[sha256sum] = "0a381cd82f4d00a9a334438b8ca239afea5bfefcfa9a1025f2bf118e79e0b5f0"
 
-- 
2.35.6


