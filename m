Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77E7DCD6E55
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 13:35:40 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.58])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28667.1780320903828367963
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 06:35:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=M2E73/ra;
 spf=pass (domain: est.tech, ip: 40.107.159.58, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q05HfV1iNo5T5AOWzryOPM1biLOUO5WDJr/OiN5GRmhf6sZ+kYHUdZej0ZB34Lpq3AA0Uden8xsHT9IpG27HqWyQavQosLW3AsgnIhIpvtB9WGO+u2tuC/yfrQkpTE759wKHxJEMfA9J1tuC2DfiODYlcGB/RbxaJilPrCS0ooTMZTPsmwUT6+CqNNZ8JFcxx8o13zvHwU0Dn/vm8dTZfLClM2ZsZA6TPy5X57x4u6UX+DoVybYU7+rc/OURgCRAhRPEi1k0RzDAJ+5UKXMOGC73DaWFZzTRjph4Kl1CRoWAqAJYes77vgCMT2ZM9P3m6jOa99dxW8jGT1A0j3MwBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fU0nblp5l/t9YaUw8JlzUHrtHIywlXhT4Ug4As3D9EM=;
 b=GCTw//oYQhkV4qig7SELlGezKHkJVQeDAqBdVD9zssD6r2c10iVdDNGaARXVTYDpHF/ShlesBUBAESRdSFtYV5S7C+2ZEOyeiazmO31fq72FKY6Sg8sVimJPBCLd6w0Jd+49wy9221xk9rdG+argVc+qVTk96+Lb99KJHSogJ3vsJCi9ak90M+A/8QEoxRZcmxU9tEL9CgJP8YHtrOUZBjL37l5qsJPuOwnmcWNVU+jsP4/NcbwGssiD+3whGj/fXdXVDkW/SD6Ao5o4wuY6fOjBpq22uCm7KzUEHkKj1ACxgDitm8UIvQHdLg3M3sHucSiekmagdz2A3N94hhYNkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fU0nblp5l/t9YaUw8JlzUHrtHIywlXhT4Ug4As3D9EM=;
 b=M2E73/raMSnxHespZgctSJtYeH0oJEcDDVSoQoDKkZW0IvQJNgszm8OtX/0/8Qx/b7ngV+UR60pDCTqhUyOaaJEiEhy0TlTpAd4JN9bapPpd2WCFhzLetryUzo1wAHm/C5J0BecCthg7UWlwL38VSjPTO+6ibe1jPmcV83e1fDT7MZXf4ycsl0CgyWesTvS0NvPVvZFTVsox25oQ5ogyMBTu7xJr3pnbdwIzBxyJNwucSOQQk+6dqzGh+SbpxK2iABFuvK+NRa7V6MRJIEFhIxQVqx50+GGVuUR3BQVfOrKPxx5WT+djwddnXDS2aAvbuyhgX+4SFNP+bDMVAJYFQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by DB8P189MB0952.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:162::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Mon, 1 Jun 2026
 13:34:59 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%6]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 13:34:59 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [OE-core][scarthgap][PATCH] curl: fix CVE-2026-6276
Date: Mon,  1 Jun 2026 15:34:51 +0200
Message-ID: <20260601133454.586549-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: DU7P250CA0022.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:54f::6) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|DB8P189MB0952:EE_
X-MS-Office365-Filtering-Correlation-Id: 480b04e6-1127-4932-e470-08debfe29390
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|13003099007|56012099006|18002099003|3023799007|11063799006;
X-Microsoft-Antispam-Message-Info: 
	8gqw1p+fZBs7o3HqhHWfnayKFXi36zkHVqsE5fJczkfzfwyBdSrn92sV7Auw9g7G9vtc5P99gMePtjx9huXh4ZXs+zzz4tYOyVarII85D9q5FWhFV0vwIIO5JYqyFR7VkcvpLR9AZ/b8zunFQynur+2id1hZILVtm0TuN/Hm8rdKcqs8ZgBESaeUp5KHqUO3efhx8Kto7lprhYMw8FKlj2euilCJHIpohill4cVFHMOMk9yXHKFmUAQ1yRZi70IZAce5si00THmqA2K+53XamScGDSlSjk5pi7pwyod70PzagVgSEFEiHmogbAz8jWdeLby/2VgQRi5RJCCb3ldCmZ9AJWv9JMKbAN8g1mash3GgRPvR58tNuu83SxfYZ6FHGCtQg4TwDIkQOe9EDwdZlD+PHwPA70ybXOZSMwGR4PObs26vA/gWb3g/FoqoFD0/m9e2SRdBA0VsEgXfc9YOyUPe92QLSMzONaBRdPOg0fgZBgvPAh8bJxj+14ptJ9r0N3skM5vXanL9kDwLvTNR9cgGx8+7mQO6uZ8qbj5rEOV/54K18fYv5wh24RRpzAaX4QXo9ZZUek6RUnsSx4qBCyGC9e68bmTgcnHrG9lCWmVWIy5TbQiS9N+i//AEPiE7rNRyH4uPjyKzdhee4ksy+hizOdHU5JhRnD/j1iabv82aCMn9RVIZUDkSnT5u5bADAJwS9lRpq9G0V7qG0eP5Jw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007)(56012099006)(18002099003)(3023799007)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zyvmr8KPnRl8zA7+d0QWL+G5oDLpx0ccYQz8zhDeN1a677BZ7jZ7MaTJSwwM?=
 =?us-ascii?Q?F8H8JHZln/zuujvdAs6QbuGz4v6lzD3DGFzEvbLnOu1ltcROcrr1IssXSaA6?=
 =?us-ascii?Q?h9tMdAJSCKNlkO+4Zb9fxo87VHg1uUdCPd/GIqdYw+gVFWccZcVgJwZ91dpj?=
 =?us-ascii?Q?AaRm5Jv8XhX0GLbHxnuNLaSNszo5jg0/QYiQriAx4FXGTKQdBK9bLa9P5rVO?=
 =?us-ascii?Q?vHA3xYacLE4DmZ/R/aYsdL6jEbjSV6yp/Gb3PStk3DQStMAyK/St4Jyc5YiJ?=
 =?us-ascii?Q?9iaLZk10RfrGYtfOr3KJ8Ftk/iaG9gRkzZXWy1PxrpPCppZNFLgR2+MM4/+H?=
 =?us-ascii?Q?eNQrE7D8+bj5A11oLxVMROgWhy8KWmU0Vx1J00I05Zaczw8Fpj1/hnf8BBYH?=
 =?us-ascii?Q?4eSc3ffPz0tdMcDq8CQJmNxx6MOEgep3v8tsnsdEKy5+na0aRsFX5qqFsSnU?=
 =?us-ascii?Q?6DkdyCAXsdCKCpBq3UiW7epgglQWeCUfZX4urXUzhzfVBxBeOLUBvjrb4Yen?=
 =?us-ascii?Q?lf/aLx3Rw9xqQazBJLMJo3kaYJeVEcsq3KbKckG9t7NBBksePR4nxYJJG/NC?=
 =?us-ascii?Q?hdSVnB6ZVHtMV1A7dWVdLPQzYCWyP2Q7niSwlepFUbBD+25fF0IezbtDqxqY?=
 =?us-ascii?Q?Gxx+Ld4x/tgxJ6bxUkJlfG1zHcsKoMUSbrWZnjcsQoUtqGgzQYr3IO6WJOB/?=
 =?us-ascii?Q?oKQghDM/JQeqnWIopg/OZeAOWZSVi11JWnqwZD6RkXJ0zaAoDyBv2Z1as7PA?=
 =?us-ascii?Q?8AyvFVGfuzbWFcyyaZzbsKvVPvJyTtnYQYH5RuhDasW/zKvRNortSEFPs/4/?=
 =?us-ascii?Q?GlatL0h9RzalnLCv2ot5G3xEPoVPCH8NaOlfW588WMPtv5XXH9tsK8hC0whY?=
 =?us-ascii?Q?R4dc4ibR+Drb8Sof6Uu5DXapdMm2HXewAkq4LC6bi9oihNW+GZCAa7/G3j/4?=
 =?us-ascii?Q?8ohl5ICg4f88U7iIqbsU14Yf9EXa5T6FHIMK8Z+BJ/xGyaauD1+sdzPXPrYZ?=
 =?us-ascii?Q?TE4sJm00H6HVB57pHxlVhQqmZj8CqCgKk8Jf7BgbVaQQNjTveB9O+APZr8R9?=
 =?us-ascii?Q?ewnWYA6Zb/aZrV3Vz4adqaWX8WgsuGwQynQ8wjG3EXu0LhIWGM989Hdg+qNy?=
 =?us-ascii?Q?iCl80h38A9RPklsKj9oZliYG0zAuHlEuLIeSG4HuWuny+hx9rrV+zD+Xb2Ek?=
 =?us-ascii?Q?lGSzpJZYNkflSFLahFYFoQiMw59U0u4c/AFGaDR4QsfbBmljCA448IdtGVio?=
 =?us-ascii?Q?pIXc44feMa7UUnl/k4TkHaY/C9seqKwfOF8NLzMUc2WJpXs/8Ko5bq/fXZ2h?=
 =?us-ascii?Q?QKu4MFwtUjEkTeWvjMiAcBcXFRbAr8oGZ7XkqRDoUNfhhf+Rid+GMHaFABXw?=
 =?us-ascii?Q?Ni4nHp/nXV6qx44gTOSxZBCCZCWVfpKDMwCt88gljWwEKeLJgKDkB2/I/sVI?=
 =?us-ascii?Q?tBOHS5iI5YCs0R70IWMQLhtBvPyALN8Czon/61ViyImaB3sU1xbwEbk7VJz8?=
 =?us-ascii?Q?4Jsam8H5Z1kxypLw1m9z/jndfOu4IA1S8DSvZyu45Fqby64iIE+CFxm2MTek?=
 =?us-ascii?Q?g5NI3cI6c+lIRs0hgP1DN2ib7CG+bBvYxC6ssG7kuj7GKFuheo3UB+LmEYYt?=
 =?us-ascii?Q?X51DXCZFrWCCUjejltWRoQKVhHAGpC11Fw3t7uo5PvEzwg2Wzyc14tm3M+l+?=
 =?us-ascii?Q?E0SCcBPgRQloMjzXIkJrTSwxnu15khBks6+oaGBUH/Zbzutfd/EitpFFGvfw?=
 =?us-ascii?Q?JKngfr4VQZshkjPzBfFA0jnms1ndzpI=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 480b04e6-1127-4932-e470-08debfe29390
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 13:34:59.3867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MfniFDVaFTpm69Z9NWSkcmznF+vgZHyCQ97ApLRJl65BrdARFKgWu6OFVYmiY1Cl+pGdzGsISS9DA/bhQwt6xcEx8wMPf3o/yp3Y+tisDVA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0952
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 13:35:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237831

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Backport patch to fix CVE-2026-6276.
https://nvd.nist.gov/vuln/detail/CVE-2026-6276

The upstream fix moves cookiehost from the connection-scoped aptr struct
to the per-request SingleRequest struct, preventing cookie data from
leaking across reused handles.

Adapted for curl 8.7.1:
- Use Curl_safefree (renamed to curlx_safefree in later versions)
- Use conn->host.name (changed to data->conn->host.name upstream)
- Keep existing header parsing structure (refactored upstream)

Upstream fix:
  https://github.com/curl/curl/commit/3a19987a87f393d9394fe5acc7643f6c263c9=
2db

Tested with ptest:
Before: PASSED: 857, FAILED: 0, SKIPPED: 0
After: PASSED: 857, FAILED: 0, SKIPPED: 0

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../curl/curl/CVE-2026-6276.patch             | 129 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |   1 +
 2 files changed, 130 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-6276.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-6276.patch b/meta/reci=
pes-support/curl/curl/CVE-2026-6276.patch
new file mode 100644
index 0000000000..495d5e5dea
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-6276.patch
@@ -0,0 +1,129 @@
+From ee81b4f4b2f8e7d1a49c92d8a470294ef7088045 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Tue, 14 Apr 2026 08:51:44 +0200
+Subject: [PATCH] urldata: move cookiehost to struct SingleRequest
+
+To make it scoped for the single request appropriately.
+
+Reported-by: Muhamad Arga Reksapati
+
+Verify with libtest 2504: a custom Host *disabled* on reused handle
+
+Closes #21312
+
+CVE: CVE-2026-6276
+Upstream-Status: Backport [https://github.com/curl/curl/commit/3a19987a87f=
393d9394fe5acc7643f6c263c92db]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ lib/http.c    | 16 ++++++++++------
+ lib/request.c |  3 +++
+ lib/request.h |  3 +++
+ lib/url.c     |  4 +++-
+ lib/urldata.h |  1 -
+ 5 files changed, 19 insertions(+), 8 deletions(-)
+
+diff --git a/lib/http.c b/lib/http.c
+index b80bebf..b1f6040 100644
+--- a/lib/http.c
++++ b/lib/http.c
+@@ -1747,7 +1747,11 @@ CURLcode Curl_http_host(struct Curl_easy *data, str=
uct connectdata *conn)
+     data->state.first_remote_port =3D conn->remote_port;
+     data->state.first_remote_protocol =3D conn->handler->protocol;
+   }
++
+   Curl_safefree(aptr->host);
++#ifndef CURL_DISABLE_COOKIES
++  Curl_safefree(data->req.cookiehost);
++#endif
+=20
+   ptr =3D Curl_checkheaders(data, STRCONST("Host"));
+   if(ptr && (!data->state.this_is_a_follow ||
+@@ -1782,8 +1786,8 @@ CURLcode Curl_http_host(struct Curl_easy *data, stru=
ct connectdata *conn)
+         if(colon)
+           *colon =3D 0; /* The host must not include an embedded port num=
ber */
+       }
+-      Curl_safefree(aptr->cookiehost);
+-      aptr->cookiehost =3D cookiehost;
++      Curl_safefree(data->req.cookiehost);
++      data->req.cookiehost =3D cookiehost;
+     }
+ #endif
+=20
+@@ -2302,8 +2306,8 @@ CURLcode Curl_http_cookies(struct Curl_easy *data,
+     int count =3D 0;
+=20
+     if(data->cookies && data->state.cookie_engine) {
+-      const char *host =3D data->state.aptr.cookiehost ?
+-        data->state.aptr.cookiehost : conn->host.name;
++      const char *host =3D data->req.cookiehost ?
++        data->req.cookiehost : conn->host.name;
+       const bool secure_context =3D
+         conn->handler->protocol&(CURLPROTO_HTTPS|CURLPROTO_WSS) ||
+         strcasecompare("localhost", host) ||
+@@ -3121,8 +3125,8 @@ CURLcode Curl_http_header(struct Curl_easy *data, st=
ruct connectdata *conn,
+     if(v) {
+       /* If there is a custom-set Host: name, use it here, or else use
+        * real peer host name. */
+-      const char *host =3D data->state.aptr.cookiehost?
+-        data->state.aptr.cookiehost:conn->host.name;
++      const char *host =3D data->req.cookiehost?
++        data->req.cookiehost:conn->host.name;
+       const bool secure_context =3D
+         conn->handler->protocol&(CURLPROTO_HTTPS|CURLPROTO_WSS) ||
+         strcasecompare("localhost", host) ||
+diff --git a/lib/request.c b/lib/request.c
+index b3b0582..9bede2e 100644
+--- a/lib/request.c
++++ b/lib/request.c
+@@ -111,6 +111,9 @@ void Curl_req_hard_reset(struct SingleRequest *req, st=
ruct Curl_easy *data)
+    * free this safely without leaks. */
+   Curl_safefree(req->p.http);
+   Curl_safefree(req->newurl);
++#ifndef CURL_DISABLE_COOKIES
++  Curl_safefree(req->cookiehost);
++#endif
+   Curl_client_reset(data);
+   if(req->sendbuf_init)
+     Curl_bufq_reset(&req->sendbuf);
+diff --git a/lib/request.h b/lib/request.h
+index 488fbdd..17d50a3 100644
+--- a/lib/request.h
++++ b/lib/request.h
+@@ -118,6 +118,9 @@ struct SingleRequest {
+ #ifndef CURL_DISABLE_DOH
+   struct dohdata *doh; /* DoH specific data for this request */
+ #endif
++#ifndef CURL_DISABLE_COOKIES
++  char *cookiehost;
++#endif
+ #ifndef CURL_DISABLE_COOKIES
+   unsigned char setcookies;
+ #endif
+diff --git a/lib/url.c b/lib/url.c
+index 76360c8..30f215f 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -313,7 +313,9 @@ CURLcode Curl_close(struct Curl_easy **datap)
+   Curl_safefree(data->state.aptr.rangeline);
+   Curl_safefree(data->state.aptr.ref);
+   Curl_safefree(data->state.aptr.host);
+-  Curl_safefree(data->state.aptr.cookiehost);
++#ifndef CURL_DISABLE_COOKIES
++  Curl_safefree(data->req.cookiehost);
++#endif
+   Curl_safefree(data->state.aptr.rtsp_transport);
+   Curl_safefree(data->state.aptr.user);
+   Curl_safefree(data->state.aptr.passwd);
+diff --git a/lib/urldata.h b/lib/urldata.h
+index b68d023..4fc595a 100644
+--- a/lib/urldata.h
++++ b/lib/urldata.h
+@@ -1339,7 +1339,6 @@ struct UrlState {
+     char *rangeline;
+     char *ref;
+     char *host;
+-    char *cookiehost;
+     char *rtsp_transport;
+     char *te; /* TE: request header */
+=20
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support=
/curl/curl_8.7.1.bb
index 14d63d6373..4c2f0b4c5a 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -36,6 +36,7 @@ SRC_URI =3D " \
     file://CVE-2026-1965-2.patch \
     file://CVE-2026-3783.patch \
     file://CVE-2026-3784.patch \
+    file://CVE-2026-6276.patch \
 "
=20
 SRC_URI:append:class-nativesdk =3D " \
--=20
2.34.1


