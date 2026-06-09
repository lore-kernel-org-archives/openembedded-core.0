Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA281CD8CA7
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 07:20:09 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.74048.1780989536303450927
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2026 00:18:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=EzxI+vmc;
 spf=pass (domain: est.tech, ip: 52.101.69.57, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oz7/N39PwZHiO+rSxpGSfDRE3RYbIYY0pPMqcnbOMEsynWPmL3TF8lfdhLIfdQ4CWQXc1NLJdzHrlN8oRh3ybNLD3q942Pl5PAaVobXUNIuGFpkgI80uzSZTYf1pHUr/7c/wjIy084PztzjIE3JhhLgXenWyN1Pq/c2ieip3JHDXZApIofm9jIcmwPXA+lPHCzXoMBKGBgZMIqYP8whWnUJKoYZAdHrE4MLaAD0XD1jcbOXWQrw9CCIV+NaMxxp45y7GmIOW6ZXH3ciRf23sLOwzJKfV+rUnMJJvnuu++yomR6zy9/EQLWt3h85QZGFe34vLvbaOupmv78ERX++Mjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/1AmJOL2orjmoLMs9slcRDzpLbduraTYjN+hU9aKRgM=;
 b=sqH7GnzPjI8n7IdChq0WZeQRP4xEdQnFCjOAAid9JgRv2B/Wj81lAGlIGZRq6FP/jOeAbWeNE+f+acSF+8q2XzXvAzHj1wR6AA/jHboh/6k6IUlImf8FkNhi9dzGnc2FiQrVbsAa09/NCbx5jOLE8czIxWuLnLoxrhV1GXMWKcinBERKnsHS9v9FqGQ68tCmI5gVUUXHCU2YMvwp8r6y2VD4zuZKWWjOrFYS1mELdatZWU6U/eoEvABgQOrrNi00yXhW5h/d4IflP4ZA5ypvKnkFVtei2FIxOqUOEgRyxWeUsBo3QeGzUe/17IcvpNPnT82jZVzpWxMuo6y7D5oA+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/1AmJOL2orjmoLMs9slcRDzpLbduraTYjN+hU9aKRgM=;
 b=EzxI+vmcD+TWNECtL3cL3Rc5ipcVmjxv4XpuB3VCqDW0icDFBwsrqCO1cpwIkfov5yBCp5Di8AzOz2yraueO6EXfwWugNkw7NW0b8SW1o4kXP0aHbjJAbhR5E8vyQGc/FikrDXMk2TVsaK1cuhyI4dPilMJMgNHbNRWLec6E3oK/LdotS0kUBEQpr92JUzm2Y+A78ZXN6VDYF4fF+TOt4nrnDjWBAWSwliZfkTJsGEvlIWVK7eAgz7Wjrfn0UvoS0vGUat1WTsv9sgkwg5nGjs4h4sLId/poQh4iSdun21XDEC5x2BGAos08CzbLwMkSupRoYFaNh49nsPSoNME+jQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by AS8P189MB1304.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:2a0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Tue, 9 Jun 2026
 07:18:49 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%6]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 07:18:49 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [OE-core][wrynose][PATCH v2] curl: fix CVE-2026-6276
Date: Tue,  9 Jun 2026 09:18:39 +0200
Message-ID: <20260609071845.1235527-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: LO4P265CA0150.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::10) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|AS8P189MB1304:EE_
X-MS-Office365-Filtering-Correlation-Id: 98db2044-5128-4bb2-69d1-08dec5f75a32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|13003099007|18002099003|6133799003|20052099010|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	sL1xrHfvFFPGAp9IZFqvIb8Wj6vYxMlnZawZvp++OprEao278RMCTjFsQMT6jJMMU2RiqyUoQOppzXQVbJcCm5qFMZRAxaSaDwjB4GgEcAMnGBNxNM2pzUKAlAb+6uhTV1ELmnU83BJA17M937dQhY4usekuTk1rjxTSbHwUe4PfDF/J5VQVxDbnVi7DLLgazm7F4MajVWTBFFbpFk1FL3ACFPcgtdGVhvYQok36E/YG1BlhziICGem62UvfsnTUxUtM4lAYaxnKh4ET9Wlc6XTjl4KAwE9MejoIvJKX/oE+TqJWhj811kNPs1jmKz83W7PAJ7sSQzolSdlNTZNhZJTHA/Y4pFXH5FpYbttIrBdi0kA1OJ2jb4LQKZes9w3DSQr033ipZpRFDR7Hq5FA53K2IT2vmEkBDr19ONV39CAyHvbBnBJLQIsZG/kN+StcE1ajESm2ReZiWBi0lr64wp3LjjYwJ4xDMuZMLrhiaXOd/lgQCTztJu1HrE6QhSANABVeJNCywe6rL5PBKZrcTfvB6sc1vqRjb08G4qWQ9VZEXGcuel8G89luSOjWyUAyJCGacCDE/BM+7rmVK6o7KCDwuuHmhZ3EVA5Zcoh2Bwldq9bw7M272YhAB5Hfbt/HIubLvxfZqeVG+D6kVN3H1A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007)(18002099003)(6133799003)(20052099010)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JrUGB6cClQILw41eS7yzuKrcNPGZdVLIwObW5D4RhGWwZdcVRh0BQwkbcRWT?=
 =?us-ascii?Q?dTZ/WnKY277upg0mgNQKRgxGxTCYiGp58ddl0/opxCemo64x136Ups38BiOL?=
 =?us-ascii?Q?D+3TLYl+M9W8b8ZOp07LtgdRL8RkI/w4BUyVUpssPOOJOwla9Jm5LLPy5VRa?=
 =?us-ascii?Q?hdVqxkgp9YRDOlhRn4MKJv82xmhbpOLOWjdyz7Ix6EfYC/xeTxgkyw/PemrU?=
 =?us-ascii?Q?LJ/3mrr6A5vX/HEk4QCLopS0BqfWOq6JucAWj4KZCSYwJaNDQ79QaT0FWITU?=
 =?us-ascii?Q?l3m/csYxsM/Clh2/91c6vhaZnfUDu4Jw7+mXJXNu0FZjPuQx/mTfUXrTlAos?=
 =?us-ascii?Q?wYfbscvUlu8irqy+FEKM87xcgvkFpBMRl/Bl//SBnZM798ZFBy+4IszJVMo6?=
 =?us-ascii?Q?H47Hu9U8tZl9+DWI5J/cn2V7vrD0x6vCXJxnxQdUaW7NbPANzhf4WOj7cBOW?=
 =?us-ascii?Q?s8yTFRgwaUoJzwUTcuVM3JV43oAEcA/cMn1dtVvALx7f7JPrWnv2vTaFcTFE?=
 =?us-ascii?Q?mIuou0H2KdrQUuE7ZF3yDEYveKcQ70hH+X4tAiZBXqahb0K0pdjof1xSBOGk?=
 =?us-ascii?Q?ekx95hD24sZc6JYGSN9Ju2AR+dw0jvk4PRtpdIhyBwwxi4jzIeiKQ9EfCOBM?=
 =?us-ascii?Q?AzdXosd3Gr/9ORxZgUg27troMDtbdN4H7wMJkHz1TB3v1oYBdjTLaUu0JVhN?=
 =?us-ascii?Q?rDQFHub6HKjFYLWYglpez3tLP3CkVlHZYsZe2riaf20T4aSB0hSn9fQUjjgo?=
 =?us-ascii?Q?MnpcH7zpbFyMr4st7fn899Q1BeXHdS/EFC03e4noTGr64hRbCHprj+avdY+z?=
 =?us-ascii?Q?mrodO6nQ3xT3nmxlHTJZ3a9EMAW5ZoDetD9El7CSFNTwhzr0clvQco0gTwGV?=
 =?us-ascii?Q?RIx9NtEi0Ig8eW0TqFOPCkH27fvv4OSbpixKWlMNSNBwzU0acziH7ypm3JVr?=
 =?us-ascii?Q?H3dQUKNjnBI3LvHWsxXIphpubVCicDq1Cg+wf/vPdblFCRni9EeWNygFRRVt?=
 =?us-ascii?Q?Z0/AG0GFTzzaBOHYwqlVhUPKBePpRML83dUJPU96AFnQjM0v3aTz6hDe/5fg?=
 =?us-ascii?Q?2Yme+al3fCRsZOO1VNn5BIK9gq5uXGTT92D9PwXUB9ogIuyo/I6gB7i4aNoa?=
 =?us-ascii?Q?qUCbEj9T5BJ/9J2/nFgs9qSQKC+TR1wTHuQDOJCG31+QKSz5hXtGdh+vYutj?=
 =?us-ascii?Q?fJT0Hi0JBY5/hIouqmwf21PLwTjZIdzSdevcNp9VO3zknP6d0gm1iJagVl1z?=
 =?us-ascii?Q?5wkjCwKlg9fShSSbJu+6Q7+GbvhCg2/ne7dX76nur7jN25+s8DiwT1T0lV4i?=
 =?us-ascii?Q?qAPEptuHoVasss5eOJwzvw9MtJmD1mcc4xWqdUzH4AvdGfwpLh8CgTeDu2EZ?=
 =?us-ascii?Q?DhV+Kq5U6li6nsrYeY7bAi/lvAkK/V1PNYKnWRgCnV5Xtxtd7Ez2YO8nA/lp?=
 =?us-ascii?Q?1+dzMAGQIA9ECwY8uYDRZUF3WtGSeRo3IkmzjzuiclPgo6rq+R5sz0CGVACW?=
 =?us-ascii?Q?OWYpR7iFk6Lq8P+Tc+LEfZ0IjJg28HoEQaljoubpHw64fXCfnsBo5p6U6+LX?=
 =?us-ascii?Q?Cg6I2o3F2Ct/whd7id64fMeMCVcJ5usQah+aLXSHz04nTat65/eY8JiWmhfb?=
 =?us-ascii?Q?i3+ByIR4vRg4ZvOZnor5NapbLFvmGc63BLExfiRzvo8XZt/MaWCLxLsESZqj?=
 =?us-ascii?Q?75xlOtYw3h1EIe6wXoe2keGn0XOXnhDSPSqdp/801UtPyYb2J3q97KDcJ61+?=
 =?us-ascii?Q?xbHd1brqk6OV9GEM1oJiHyBraSfyPHc=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 98db2044-5128-4bb2-69d1-08dec5f75a32
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 07:18:49.5250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ImpdZL+0u8m6eKEgt2LAcDBgXuF/4+7qBZDAWasx+pBkFmu+W7U9jTeNPHsVQR5L0+ffaO/fAUyfs0hSiKJIir1g5R/u3k2cbKQib04RdQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB1304
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 07:20:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238268

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
index b9251336b8..69f37e2197 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -14,6 +14,7 @@ SRC_URI =3D " \
     file://run-ptest \
     file://disable-tests \
     file://no-test-timeout.patch \
+	file://CVE-2026-6276.patch \
 "
=20
 SRC_URI:append:class-nativesdk =3D " \
--=20
2.34.1


