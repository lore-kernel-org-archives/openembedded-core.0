Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85781CD6E60
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 15:04:29 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.58])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26237.1780409195772503496
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 07:06:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=og9TsxgL;
 spf=pass (domain: est.tech, ip: 40.107.130.58, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y+LFH7aJOo1mPTAYYMujMRQGeqc8Zw+YC3G1/72NLOt5F60wDvUnysZZaL5ehj/yJQwrf6B505H8S7eNvh/w1sZwc0XC4l2CgvEWFnNL5HQh1pDuzhskIc7LpghuOG6GrHNLKoTtJawjyoP69PhtZwbuo8y672VzEFNW+8SS6n5QN/OodDyR9xi2vusbvdjJ7pu1/r5wgz+bGWBeDHzVjzyP3Uq8Go0oEuZM53JSBQo0nNzuYhH3eGOcFhpk3zljXiQwhsA3vHi53PDrn5tvAVkRIQ0f1zrYETUomKZEqcPbOBda4G+R/GCion31baCuCBGLjVl94ZZ3bGnI8wuHBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GPe1B9NDqZP/gsSK5gKjfyzbU5iHSMuag/i+SP8wgBY=;
 b=xJrUpLL+m8NNr1d3BAlFti/avVAte8IlEsglL0iPlFAZHOTyP76/RIrNeyV9nekVVea/kxCpkPTMRVf02I1Y8t8SnKx3VCCmu5E6W8M4Qq+lSEJDS/1kJJYxXhTxH4yU6hI8yrkv7FmmWkKpwzbx7nHHnqVUO7ac4YX62TlT/Y71jiHArCrH0lI94m8Og6KdA1eJnHs7F5KRjpPcsH1untW6WZ13SgMxCSeG95/xF0WDNmkGSpLlD4MGdbrA/0sDF6ty+FRtwf0syuY6YU0qff0JvD8qPcrPgFY50FG1OXv0oIrF9s/NUCXOce6wxiJqSeSHc9GVtU/Yd1qfTwJquQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GPe1B9NDqZP/gsSK5gKjfyzbU5iHSMuag/i+SP8wgBY=;
 b=og9TsxgLn4/7Tirg4T7Z67KHb+XzeQW/xRR+1lwW6PW6lxlcgO+5esBX3y+gnRETe/uaZ4dBikrJ1BaSMN3OMvOnlIkqxugat3a8AdCoKhuKJpRCjJ4gJ6OqMZuYl5l5lfS1421KR0RRHA5iuB4KJKNY0SFUMm8Nr71tBKc8afM9tTowoRdKRX3okRea/9jClI5zY2t2ByDqxPFPlX2ecYc733b7EhjQkXyo1LYglSs027dJapfeJpQzrVUkt6kAkL0N62NmKvHzGp7QyMX0Hq0bWj/IHYaHLbVPWH8KYYulZcWM6ffn00Clw9kReHAV3sTkqZJFZTLFCU/P/nVwEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by GV1P189MB2809.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:1f3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 14:06:27 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%6]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 14:06:27 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [OE-core][wrynose][PATCH] curl: fix CVE-2026-6276
Date: Tue,  2 Jun 2026 16:06:20 +0200
Message-ID: <20260602140623.762455-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: LO4P123CA0217.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::6) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|GV1P189MB2809:EE_
X-MS-Office365-Filtering-Correlation-Id: e9a95f30-127a-4347-c9a4-08dec0b0237c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|13003099007|6133799003|11063799006|3023799007|56012099006|20052099010;
X-Microsoft-Antispam-Message-Info: 
	VamrLWz3ZN8+UI3h5xWvFaUafun3yjDzLtGSJFYWiPh5u9OH3rYUzcYhwV1dWMUz3GqGlDdOwJqDJ1U34NeTIU5gtgg2AzURrPU6ygym+92Q1VKjq45EPURUAunnNLqxnRO3OIl8Plib9zSIUgJelgdhLlcT3v2TMJxrvhK1LW0nGDKLYKPX3s98B3pMaWXqgRzYOZUZeO8uCfcRdO45zgYUZLollEe6voxBrkM7RGEJ35QfB//60w5lcN+ziU9yn8TcIp9keWxZ5UML3IPXAtWR/3C4wZ6g8Ow1pYXU84KgQ62GjLoG6RaUT+yF7wbZdm+dU220uiTVPSPcPxtKGf6ZsRfTZyzRVeXswVgk29xNUp6ZEryxAeCXnCCkkT/gbIUOkHkITKyFw8glMJbL/ILEudZnVgs6/dWZFIGikvsDbp1Du81634F2lf1+MdSd3FYHpzN1DcFtcPKgRb2DaXFBa9a2PgFwFuuezTIWp3vswqPwYoKlp2J64TK14us2Vkl8QkGmO762F/PyxlaB2Qpxm08wzRFv3QbMlLrT1ynwYL013QE905t9th15AdWXUjSBrUVDX5kliCx3p7pl/DehwbbFQcMP6n0MirVoeD83WT/T7aAdP1A6mmQpKjryNcdFkdsYuj8gdfqoJbfYIA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(13003099007)(6133799003)(11063799006)(3023799007)(56012099006)(20052099010);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?L8KHf9LnnoJ56xzBs95saT4gigCdoB3XsVAf8JjkZTGZR59XaLNepo7xYR9e?=
 =?us-ascii?Q?QL/J4TaDr8kVtDLkgRQ0GCkSK2E/EkZWriPC6yG4SvOI2rUabUZssD5dOxD/?=
 =?us-ascii?Q?B0YNuxd7lPqtk3qatfxzLx4dmegq7NplLAMG0jL6erxquro8B0yFmmrBu2DS?=
 =?us-ascii?Q?TDQG85GwdkmmP27IwxsuE6BBz6B6PQZR/sdy3EcA03SN2hsvdXYYTQ/aK/Gz?=
 =?us-ascii?Q?GRl30LlIgrh+Nbhbb3JSzZGe3ot0ipkt+K+XgMuVauDzyNZWXfOjHs5aLjNI?=
 =?us-ascii?Q?t5/PFCg1DdAvKTEux417YWzYM982Z+UKr5cQK90FitPiuRlQEoCzk91GBxiD?=
 =?us-ascii?Q?Gqrm7PjoOTxS5Tl3t4drCxgrtgriyS7sxFx8ScNwe6t1lwt49G2VS69Ew7yE?=
 =?us-ascii?Q?zqxpqILXFFFhXe6TgwssVLV6Q5PKXeI38RtmFXMuTM5ZZ+Rbjx/vfcWoQljr?=
 =?us-ascii?Q?cMeSxbN7j3shA2WkP611p3AB4qS1h4Z8YF+kMXcn/qI0edXLdI3Fg1rLT8i9?=
 =?us-ascii?Q?kkmctpp7tYlhlqCE/08pTj5yvlDzAvP/6qHsMRWeUtf9dmpQ/WVmSfaRBASY?=
 =?us-ascii?Q?kfgyS9yfdvSGzqxYNBemaRdjbPIi1FKnkFnOrwKCCMNfBszgL+LHzvqLdPoN?=
 =?us-ascii?Q?9Zx5qszENZIRGUip+v0M3IdXoo284iaYvuPJpwFeH9kuvf6Z4PlWBxCNWBo4?=
 =?us-ascii?Q?+E+Jr3VQ40C2+2nI4Ouj31yGzb1qNtqiSVtDzRJILi/ezKZIXhSlu9KU1RQZ?=
 =?us-ascii?Q?nfyHN+tX5tQ9Br/cRdDBcHkuvLjX1CvBrfJhr/u/5xWqPtNEB+GS4ifhx8Js?=
 =?us-ascii?Q?lGPI7gz3mz5tgd3gSYr6TXh2yxDn9lfkdhMiLt1rfRxyPh8kDpxl3wzBqQvY?=
 =?us-ascii?Q?5am7uhAJ+Zq3iKNG6KsEgvhNTXrbmrGyYmSx1FWkbnLZVh2i2N3fr8Bc6eWf?=
 =?us-ascii?Q?C4cddP80d2j892SodsHvwcJGyRtI3+lLg2legXvASdT8Xv476nrZtq3rASbp?=
 =?us-ascii?Q?MUzHBDtBNxG0uubHB536M2gtR+Qg0w+XnNe5QftMubd/WJVZ/CBDrsHnf7sO?=
 =?us-ascii?Q?iLTwgUSj2S0RhVIRGXZoQZTK2Ex9i41wzOaFz9Vk5Nwmjkr/CFaaO0TVxILa?=
 =?us-ascii?Q?9yiJFmRjx1q+bF0jHK7i/1mUyPrvHWO7zPca5JfvbJatv7R5nHDPpFjlJZ5Y?=
 =?us-ascii?Q?qsiUVmBZub2LwmfyG+AIP1SJgu7rdLEnhFoTv5BJNCj/pexNsOzY7vyYJ6Ra?=
 =?us-ascii?Q?lGp5YbxHFhZgSTFqYMKUcAViBxhpoG4r4ZE9+JGnBzLLKvdnxOVN1jve5I6V?=
 =?us-ascii?Q?3Q/sB1nB7/RZ2JagCi0HsuEaMSdN9NTl9ki3a9cWDbqWRj12m0+iw/sF2keV?=
 =?us-ascii?Q?qVW4wBTieL0UyYT1if32p/NfYZFDvzbWg6YYFqPItXFdX7FgPxcHr3cG+q7a?=
 =?us-ascii?Q?pehVNf6/v3nDxVmm4vzG0kqBSNjAYGZ9QbXW6dkmrD2xASTrX55JZx/mWsh+?=
 =?us-ascii?Q?zfwHu1fe9JwhrAlhlhjLV2chQXUs2b/dz/AOdUjcjBbMzydZmyaUMCapsVaC?=
 =?us-ascii?Q?y/pfB69/gyzE99Ug+UJaNfT+cszXvFwc7M5iQnZOfs5KehfXmOzMPL9YApLe?=
 =?us-ascii?Q?27P0+CVNzKKgq/ZvE1/S9h00RVvukMiWFO5HLSlA6RAlOe381P83uqNSNmJ2?=
 =?us-ascii?Q?bQ/0HTzrUGv5FHdna3COG2IqY73OFUuv+8ABc8/UB6p8T7Vvbz9diLqpOP+f?=
 =?us-ascii?Q?TlKSdDguJrJadagA/8+CBg6kwJuFxHg=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: e9a95f30-127a-4347-c9a4-08dec0b0237c
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 14:06:27.7196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g8iS/RnNJw+EfEzb8LR7QwEnvFL7bIoUerpaaqQ7ubduUCRbGAL+7qBswXoSEUBnLLF//X2M2HP3X6z60kM3t7apwgv9JM2xW3ZH6usoNWw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2809
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 15:04:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238059

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Backport patch to fix CVE-2026-6276.
https://nvd.nist.gov/vuln/detail/CVE-2026-6276

Upstream fix:
  https://github.com/curl/curl/commit/3a19987a87f393d9394fe5acc7643f6c263c9=
2db

Adapted for curl 8.19.0:
- Use Curl_safefree (upstream uses curlx_safefree, renamed in later version=
s)
- Drop req->userpwd/req->proxyuserpwd context (not yet moved to
  SingleRequest in this version)

Tested with ptest:
Before: PASSED: 1000, FAILED: 0, SKIPPED: 0
After: PASSED: 1001, FAILED: 0, SKIPPED: 0

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../curl/curl/CVE-2026-6276.patch             | 315 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |   1 +
 2 files changed, 316 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-6276.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-6276.patch b/meta/reci=
pes-support/curl/curl/CVE-2026-6276.patch
new file mode 100644
index 0000000000..68bec24e94
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-6276.patch
@@ -0,0 +1,315 @@
+From 48d71bc976572aaf09c63ab86b5165762450a507 Mon Sep 17 00:00:00 2001
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
+ lib/http.c                 | 14 +++---
+ lib/request.c              |  3 ++
+ lib/request.h              |  3 ++
+ lib/url.c                  |  2 +-
+ lib/urldata.h              |  3 --
+ tests/data/Makefile.am     |  2 +-
+ tests/data/test2504        | 52 +++++++++++++++++++++
+ tests/libtest/Makefile.inc |  2 +-
+ tests/libtest/lib2504.c    | 93 ++++++++++++++++++++++++++++++++++++++
+ 9 files changed, 162 insertions(+), 12 deletions(-)
+ create mode 100644 tests/data/test2504
+ create mode 100644 tests/libtest/lib2504.c
+
+diff --git a/lib/http.c b/lib/http.c
+index 188da5fd83..7ebbdfa551 100644
+--- a/lib/http.c
++++ b/lib/http.c
+@@ -2002,6 +2002,9 @@ static CURLcode http_set_aptr_host(struct Curl_easy =
*data)
+     data->state.first_remote_protocol =3D conn->scheme->protocol;
+   }
+   Curl_safefree(aptr->host);
++#ifndef CURL_DISABLE_COOKIES
++  Curl_safefree(data->req.cookiehost);
++#endif
+=20
+   ptr =3D Curl_checkheaders(data, STRCONST("Host"));
+   if(ptr && (!data->state.this_is_a_follow ||
+@@ -2037,8 +2040,7 @@ static CURLcode http_set_aptr_host(struct Curl_easy =
*data)
+         if(colon)
+           *colon =3D 0; /* The host must not include an embedded port num=
ber */
+       }
+-      curlx_free(aptr->cookiehost);
+-      aptr->cookiehost =3D cookiehost;
++      data->req.cookiehost =3D cookiehost;
+     }
+ #endif
+=20
+@@ -2538,8 +2540,8 @@ static CURLcode http_cookies(struct Curl_easy *data,
+=20
+     if(data->cookies && data->state.cookie_engine) {
+       bool okay;
+-      const char *host =3D data->state.aptr.cookiehost ?
+-        data->state.aptr.cookiehost : data->conn->host.name;
++      const char *host =3D data->req.cookiehost ?
++        data->req.cookiehost : data->conn->host.name;
+       Curl_share_lock(data, CURL_LOCK_DATA_COOKIE, CURL_LOCK_ACCESS_SINGL=
E);
+       result =3D Curl_cookie_getlist(data, data->conn, &okay, host, &list=
);
+       if(!result && okay) {
+@@ -3545,8 +3547,8 @@ static CURLcode http_header_s(struct Curl_easy *data=
,
+   if(v) {
+     /* If there is a custom-set Host: name, use it here, or else use
+      * real peer hostname. */
+-    const char *host =3D data->state.aptr.cookiehost ?
+-      data->state.aptr.cookiehost : conn->host.name;
++    const char *host =3D data->req.cookiehost ?
++      data->req.cookiehost : conn->host.name;
+     const bool secure_context =3D Curl_secure_context(conn, host);
+     CURLcode result;
+     Curl_share_lock(data, CURL_LOCK_DATA_COOKIE, CURL_LOCK_ACCESS_SINGLE)=
;
+diff --git a/lib/request.c b/lib/request.c
+index 66077530d7..765dbac058 100644
+--- a/lib/request.c
++++ b/lib/request.c
+@@ -113,6 +113,9 @@ void Curl_req_hard_reset(struct SingleRequest *req, st=
ruct Curl_easy *data)
+   struct curltime t0 =3D { 0, 0 };
+=20
+   Curl_safefree(req->newurl);
++#ifndef CURL_DISABLE_COOKIES
++  Curl_safefree(req->cookiehost);
++#endif
+   Curl_client_reset(data);
+   if(req->sendbuf_init)
+     Curl_bufq_reset(&req->sendbuf);
+diff --git a/lib/request.h b/lib/request.h
+index 5332d48538..6e4bd0fb6e 100644
+--- a/lib/request.h
++++ b/lib/request.h
+@@ -95,6 +95,9 @@ struct SingleRequest {
+   char *newurl;     /* Set to the new URL to use when a redirect or a ret=
ry is
+                        wanted */
+=20
++#ifndef CURL_DISABLE_COOKIES
++  char *cookiehost;
++#endif
+ #ifndef CURL_DISABLE_COOKIES
+   unsigned char setcookies;
+ #endif
+diff --git a/lib/url.c b/lib/url.c
+index ec0457bcdd..b9e308add2 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -304,7 +304,7 @@ CURLcode Curl_close(struct Curl_easy **datap)
+   Curl_safefree(data->state.aptr.ref);
+   Curl_safefree(data->state.aptr.host);
+ #ifndef CURL_DISABLE_COOKIES
+-  Curl_safefree(data->state.aptr.cookiehost);
++  Curl_safefree(data->req.cookiehost);
+ #endif
+ #ifndef CURL_DISABLE_RTSP
+   Curl_safefree(data->state.aptr.rtsp_transport);
+diff --git a/lib/urldata.h b/lib/urldata.h
+index 5ae148054b..d71337c8f6 100644
+--- a/lib/urldata.h
++++ b/lib/urldata.h
+@@ -1052,9 +1052,6 @@ struct UrlState {
+     char *rangeline;
+     char *ref;
+     char *host;
+-#ifndef CURL_DISABLE_COOKIES
+-    char *cookiehost;
+-#endif
+ #ifndef CURL_DISABLE_RTSP
+     char *rtsp_transport;
+ #endif
+diff --git a/tests/data/Makefile.am b/tests/data/Makefile.am
+index 53abf60901..da0f8f55d4 100644
+--- a/tests/data/Makefile.am
++++ b/tests/data/Makefile.am
+@@ -264,7 +264,7 @@ test2309 \
+ \
+ test2400 test2401 test2402 test2403 test2404 test2405 test2406 test2407 \
+ \
+-test2500 test2501 test2502 test2503 \
++test2500 test2501 test2502 test2503 test2504 \
+ \
+ test2600 test2601 test2602 test2603 test2604 test2605 \
+ \
+diff --git a/tests/data/test2504 b/tests/data/test2504
+new file mode 100644
+index 0000000000..8cec1c8210
+--- /dev/null
++++ b/tests/data/test2504
+@@ -0,0 +1,52 @@
++<?xml version=3D"1.0" encoding=3D"US-ASCII"?>
++<testcase>
++<info>
++<keywords>
++HTTP
++cookies
++</keywords>
++</info>
++
++# Server-side
++<reply>
++<data crlf=3D"headers" nocheck=3D"yes">
++HTTP/1.1 200 OK
++Date: Tue, 09 Nov 2010 14:49:00 GMT
++Server: server.example.com
++Content-Length: 47
++Set-Cookie: sid=3DSECRET123; Path=3D/
++
++file contents should appear once for each file
++</data>
++</reply>
++
++# Client-side
++<client>
++<server>
++http
++</server>
++<tool>
++lib%TESTNUMBER
++</tool>
++<name>
++custom Host with cookie, handle reuse, no custom Host:
++</name>
++<command>
++http://%HOSTIP:%HTTPPORT
++</command>
++</client>
++
++# Verify data after the test has been "shot"
++<verify>
++<protocol crlf=3D"headers">
++GET / HTTP/1.1
++Host: victim.internal
++Accept: */*
++
++GET / HTTP/1.1
++Host: %HOSTIP:%HTTPPORT
++Accept: */*
++
++</protocol>
++</verify>
++</testcase>
+diff --git a/tests/libtest/Makefile.inc b/tests/libtest/Makefile.inc
+index e3202804a9..2319bafe72 100644
+--- a/tests/libtest/Makefile.inc
++++ b/tests/libtest/Makefile.inc
+@@ -113,7 +113,7 @@ TESTS_C =3D \
+   lib2023.c lib2032.c lib2082.c \
+   lib2301.c lib2302.c lib2304.c           lib2306.c lib2308.c lib2309.c \
+   lib2402.c           lib2404.c lib2405.c \
+-  lib2502.c \
++  lib2502.c lib2504.c \
+   lib2700.c \
+   lib3010.c lib3025.c lib3026.c lib3027.c lib3033.c lib3034.c \
+   lib3100.c lib3101.c lib3102.c lib3103.c lib3104.c lib3105.c \
+diff --git a/tests/libtest/lib2504.c b/tests/libtest/lib2504.c
+new file mode 100644
+index 0000000000..72b965d6e6
+--- /dev/null
++++ b/tests/libtest/lib2504.c
+@@ -0,0 +1,93 @@
++/************************************************************************=
***
++ *                                  _   _ ____  _
++ *  Project                     ___| | | |  _ \| |
++ *                             / __| | | | |_) | |
++ *                            | (__| |_| |  _ <| |___
++ *                             \___|\___/|_| \_\_____|
++ *
++ * Copyright (C) Linus Nielsen Feltzing <linus@haxx.se>
++ *
++ * This software is licensed as described in the file COPYING, which
++ * you should have received as part of this distribution. The terms
++ * are also available at https://curl.se/docs/copyright.html.
++ *
++ * You may opt to use, copy, modify, merge, publish, distribute and/or se=
ll
++ * copies of the Software, and permit persons to whom the Software is
++ * furnished to do so, under the terms of the COPYING file.
++ *
++ * This software is distributed on an "AS IS" basis, WITHOUT WARRANTY OF =
ANY
++ * KIND, either express or implied.
++ *
++ * SPDX-License-Identifier: curl
++ *
++ ************************************************************************=
***/
++#include "first.h"
++
++#include "testtrace.h"
++
++static size_t sink2504(char *ptr, size_t size, size_t nmemb, void *ud)
++{
++  (void)ptr;
++  (void)ud;
++  return size * nmemb;
++}
++
++static void dump_cookies2504(CURL *h, const char *tag)
++{
++  struct curl_slist *cookies =3D NULL;
++  struct curl_slist *nc;
++  CURLcode rc =3D curl_easy_getinfo(h, CURLINFO_COOKIELIST, &cookies);
++
++  curl_mprintf("=3D=3D %s =3D=3D\n", tag);
++  if(rc) {
++    curl_mprintf("getinfo error: %d\n", (int)rc);
++    return;
++  }
++  for(nc =3D cookies; nc; nc =3D nc->next)
++    puts(nc->data);
++  curl_slist_free_all(cookies);
++}
++
++static CURLcode test_lib2504(const char *URL)
++{
++  CURL *curl;
++  CURLcode result =3D CURLE_OUT_OF_MEMORY;
++  struct curl_slist *hdrs =3D NULL;
++
++  if(curl_global_init(CURL_GLOBAL_ALL) !=3D CURLE_OK) {
++    curl_mfprintf(stderr, "curl_global_init() failed\n");
++    return TEST_ERR_MAJOR_BAD;
++  }
++
++  curl =3D curl_easy_init();
++  if(!curl) {
++    curl_mfprintf(stderr, "curl_easy_init() failed\n");
++    curl_global_cleanup();
++    return TEST_ERR_MAJOR_BAD;
++  }
++
++  hdrs =3D curl_slist_append(hdrs, "Host: victim.internal");
++  if(hdrs) {
++    test_setopt(curl, CURLOPT_WRITEFUNCTION, sink2504);
++    test_setopt(curl, CURLOPT_COOKIEFILE, "");
++    test_setopt(curl, CURLOPT_HTTPHEADER, hdrs);
++    test_setopt(curl, CURLOPT_URL, URL);
++
++    result =3D curl_easy_perform(curl);
++    curl_mprintf("req1=3D%d\n", (int)result);
++    dump_cookies2504(curl, "after request 1");
++
++    test_setopt(curl, CURLOPT_HTTPHEADER, NULL);
++    test_setopt(curl, CURLOPT_URL, URL);
++
++    result =3D curl_easy_perform(curl);
++    curl_mprintf("req2=3D%d\n", (int)result);
++    dump_cookies2504(curl, "after request 2");
++  }
++test_cleanup:
++  curl_slist_free_all(hdrs);
++  curl_easy_cleanup(curl);
++  curl_global_cleanup();
++
++  return result;
++}
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-suppor=
t/curl/curl_8.19.0.bb
index b9251336b8..9bbbb5e36f 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -161,6 +161,7 @@ RDEPENDS:${PN}-ptest +=3D " \
 	perl-module-memoize \
 	perl-module-storable \
 	perl-module-time-hires \
+    file://CVE-2026-6276.patch \
 "
=20
 PACKAGES =3D+ "lib${BPN}"
--=20
2.34.1


