Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D2CCC4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 08:46:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.26222.1698914770203447352
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Nov 2023 01:46:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=OKkfoJJ+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9670e035af=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3A26fMBG028764
	for <openembedded-core@lists.openembedded.org>; Thu, 2 Nov 2023 08:46:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=LD+ei
	oRnxDo12czJ7r0iLXjSQMuBdbeehScOJcpMRno=; b=OKkfoJJ+qrubTDI+wRprL
	Dy+pTZ84A9YzM63OBo+RhobcOsENTzjGlu6hJ27AhuHBfAxTP/ozLA93Fb0EzWbh
	q7EF8EWWbIrPQcoTGVrTjBRmMlFWQk9eM+jDf5M1Zwo3ere+nqt+UxpLRMP6n8yK
	ifBpL4Vjl9UE6NU5NLeEVz/+Q6C/zlr/Pzx/MR47kHY/U4XqOK0jEq90DYjJfJFZ
	F98On1AONo+GaH67k6nqofTcq1Ds0oRXGPKBFlHWb78YWJScFG7xS75e1FUrOS0k
	NkhIPwy3xkJAUCXR1MLISkDfKGpce0Q/ldpbbX95F5YmbajkxwJuAUmO4IqCC41p
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u434yg7gk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 08:46:09 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 2 Nov 2023 01:46:10 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.34 via Frontend Transport; Thu, 2 Nov 2023 01:46:09 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [mickledore][PATCH] curl: Fix CVE-2023-38039
Date: Thu, 2 Nov 2023 16:46:06 +0800
Message-ID: <20231102084606.1784481-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: HvJJdYcunoNYnTMtgVxDQ_dKlLNZhXkZ
X-Proofpoint-ORIG-GUID: HvJJdYcunoNYnTMtgVxDQ_dKlLNZhXkZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-01_23,2023-11-01_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2310240000 definitions=main-2311020069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 08:46:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190069

From: Mingli Yu <mingli.yu@windriver.com>

Backport patch [1] to fix CVE-2023-38039 and reference [2] and [3] to fix
the build error.

[1] https://github.com/curl/curl/commit/3ee79c1674fd6f9
[2] https://github.com/curl/curl/commit/2cb0d346aaa
[3] https://github.com/curl/curl/commit/83319e027179

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../curl/curl/CVE-2023-38039.patch            | 209 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.0.1.bb       |   1 +
 2 files changed, 210 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-38039.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-38039.patch b/meta/recipes-support/curl/curl/CVE-2023-38039.patch
new file mode 100644
index 0000000000..ef8b600413
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-38039.patch
@@ -0,0 +1,209 @@
+From daa73dbfa9d4dbaf5415cc14dcbf31e45ed77468 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Thu, 2 Nov 2023 15:57:39 +0800
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
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/3ee79c1674fd6f9]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ lib/c-hyper.c  | 12 +++++++-----
+ lib/http.c     | 39 +++++++++++++++++++++++++++++++++++----
+ lib/http.h     |  9 +++++++++
+ lib/pingpong.c |  2 +-
+ lib/urldata.h  | 18 ++++++++++--------
+ 5 files changed, 62 insertions(+), 18 deletions(-)
+
+diff --git a/lib/c-hyper.c b/lib/c-hyper.c
+index 9c7632d..28f64ef 100644
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
+index 400d2b0..d3efd60 100644
+--- a/lib/http.c
++++ b/lib/http.c
+@@ -3760,6 +3760,34 @@ static CURLcode verify_header(struct Curl_easy *data)
+   return CURLE_OK;
+ }
+ 
++CURLcode Curl_bump_headersize(struct Curl_easy *data,
++                              size_t delta,
++                              bool connect_only)
++{
++  size_t bad = 0;
++  unsigned int max = MAX_HTTP_RESP_HEADER_SIZE;
++  if(delta < MAX_HTTP_RESP_HEADER_SIZE) {
++    data->info.header_size += (unsigned int)delta;
++    data->req.allheadercount += (unsigned int)delta;
++    if(!connect_only)
++      data->req.headerbytecount += (unsigned int)delta;
++    if(data->req.allheadercount > max)
++      bad = data->req.allheadercount;
++    else if(data->info.header_size > (max * 20)) {
++      bad = data->info.header_size;
++      max *= 20;
++    }
++  }
++  else
++    bad = data->req.allheadercount + delta;
++  if(bad) {
++    failf(data, "Too large response headers: %zu > %u", bad, max);
++    return CURLE_RECV_ERROR;
++  }
++  return CURLE_OK;
++}
++
++
+ /*
+  * Read any HTTP header lines from the server and pass them to the client app.
+  */
+@@ -4007,8 +4035,9 @@ CURLcode Curl_http_readwrite_headers(struct Curl_easy *data,
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
+@@ -4330,8 +4359,10 @@ CURLcode Curl_http_readwrite_headers(struct Curl_easy *data,
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
+index 444abc0..ea3b37e 100644
+--- a/lib/http.h
++++ b/lib/http.h
+@@ -60,6 +60,10 @@ extern const struct Curl_handler Curl_handler_wss;
+ #endif
+ #endif /* websockets */
+ 
++CURLcode Curl_bump_headersize(struct Curl_easy *data,
++                              size_t delta,
++                              bool connect_only);
++
+ 
+ /* Header specific functions */
+ bool Curl_compareheader(const char *headerline,  /* line to check */
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
+index 2f4aa1c..e53a506 100644
+--- a/lib/pingpong.c
++++ b/lib/pingpong.c
+@@ -341,7 +341,7 @@ CURLcode Curl_pp_readresp(struct Curl_easy *data,
+       ssize_t clipamount = 0;
+       bool restart = FALSE;
+ 
+-      data->req.headerbytecount += (long)gotbytes;
++      data->req.headerbytecount += (unsigned int)gotbytes;
+ 
+       pp->nread_resp += gotbytes;
+       for(i = 0; i < gotbytes; ptr++, i++) {
+diff --git a/lib/urldata.h b/lib/urldata.h
+index f3e782a..748660f 100644
+--- a/lib/urldata.h
++++ b/lib/urldata.h
+@@ -619,17 +619,19 @@ struct SingleRequest {
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
+ 
+   curl_off_t pendingheader;      /* this many bytes left to send is actually
+                                     header and not body */
+   struct curltime start;         /* transfer started at this time */
++  unsigned int headerbytecount;  /* received server headers (not CONNECT
++                                    headers) */
++  unsigned int allheadercount;   /* all received headers (server + CONNECT) */
++  unsigned int deductheadercount; /* this amount of bytes doesn't count when
++                                     we check if anything has been transferred
++                                     at the end of a connection. We use this
++                                     counter to make only a 100 reply (without
++                                     a following second response code) result
++                                     in a CURLE_GOT_NOTHING error code */
+   enum {
+     HEADER_NORMAL,              /* no bad header at all */
+     HEADER_PARTHEADER,          /* part of the chunk is a bad header, the rest
+@@ -1076,7 +1078,6 @@ struct PureInfo {
+   int httpversion; /* the http version number X.Y = X*10+Y */
+   time_t filetime; /* If requested, this is might get set. Set to -1 if the
+                       time was unretrievable. */
+-  curl_off_t header_size;  /* size of read header(s) in bytes */
+   curl_off_t request_size; /* the amount of bytes sent in the request(s) */
+   unsigned long proxyauthavail; /* what proxy auth types were announced */
+   unsigned long httpauthavail;  /* what host auth types were announced */
+@@ -1084,6 +1085,7 @@ struct PureInfo {
+   char *contenttype; /* the content type of the object */
+   char *wouldredirect; /* URL this would've been redirected to if asked to */
+   curl_off_t retry_after; /* info from Retry-After: header */
++  unsigned int header_size;  /* size of read header(s) in bytes */
+ 
+   /* PureInfo members 'conn_primary_ip', 'conn_primary_port', 'conn_local_ip'
+      and, 'conn_local_port' are copied over from the connectdata struct in
+-- 
+2.25.1
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
2.25.1


