Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4450FCC6B38
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 13:40:32 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21970.1792158027179807712
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 06:40:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=mZuSWusT;
 spf=pass (domain: est.tech, ip: 52.101.69.56, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XhoiAsTorTbVBtgNu2InwgLW7Pv5A5YotSSPXFO/RyZ7/R5sm2tiqzIYqPukclN9axJIuNAHOUSee8zdWtglnR1jBT+209KfVBLh5YxA6H698kHnZgYoD3rZr8orcXU+IuLqCj/Ls/f7XXxIpmPy+k6n2mxH336VYva4op8cF+ZBBNIccIOrysJu8bxYLIET78yI6eOG8/6QlpWB++846BO2fsjTZjs71kZahITS3efkIESP0hYCqCf0yTty3UtnfyZYVRvyyW0/+SnDlhIoWSxbGXmtpGUfp9s+mkBi10LfPotzBq5RejVLC7dLqZgtKIMz9Qdu+BbEFWxm5/E5Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zKdRNCWSThPcjTwR1aWvGstmaFMGiTpAj/j4P7AyCMk=;
 b=omEGfH9za1MNsCPLCPHFCQaXiJ/01RGBBRC6f4zLK8hbdnW1BAF0OYrbruuGvoLN5woPC9Ek8EkkdhSmVQDOWtPoqM7UapgaL9oxbETK/dt/krFQ7+rnj/WrFHhcNmOYGlWC/SuoWtRG4AGYvVlFjYJw/g/budzcpORhA8iSTAo587N74ejG8ugb43TyY85n0GZcv16yPM+fDvWFfJgaonruj5yUenmId6a170Ut8G+q5sAOcXZgwhROEuzB+b/uiArtWA1fJn/wSdJwF7y1Bqltg7UFQy/cMu8hZxozXnFxgbBgMVBoce+VRmMjHopGnRkBgiMZCqVeWF4wg0Pg1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zKdRNCWSThPcjTwR1aWvGstmaFMGiTpAj/j4P7AyCMk=;
 b=mZuSWusTXBngi4bZ9rG0C3RkzpujELjWuHa098t7T/0e0U2kuBB6e92BUxKD6bQAnME4IC0vFfnATBCTs0gYc3QOJKhja81Yoi0RVgQsTwePc/3+bAHFVqZpq3wTJ4dedivd68Y7wCOVo1ZIkhitsY7hO35IU4bJkY8paW3US5totPp8BfqOV1XawRpQqL2twMQ+iQCgz0on2m8L1v11NK2QqjTambH1eIyP8DfwhxL5BWpnYv8y6gQHUPwE88qs84Ij+5Fx+FXLG6CB93k4F86+3I8PjbFzUrXimZqBLYINRGDh7b5UKfApq8mMicDEBF4IhLaVHDMeL18LAHL2Pw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from VI0P189MB3116.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2cd::21)
 by AS1P189MB1837.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:4ad::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.15; Fri, 16 Oct
 2026 13:40:22 +0000
Received: from VI0P189MB3116.EURP189.PROD.OUTLOOK.COM
 ([fe80::2d33:bb97:b0f8:8167]) by VI0P189MB3116.EURP189.PROD.OUTLOOK.COM
 ([fe80::2d33:bb97:b0f8:8167%3]) with mapi id 15.21.0522.012; Fri, 16 Oct 2026
 13:40:21 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH] curl: fix CVE-2026-80230
Date: Fri, 16 Oct 2026 15:40:19 +0200
Message-ID: <20261016134019.52968-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB8PR06CA0039.eurprd06.prod.outlook.com
 (2603:10a6:10:120::13) To VI0P189MB3116.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:800:2cd::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0P189MB3116:EE_|AS1P189MB1837:EE_
X-MS-Office365-Filtering-Correlation-Id: 3086b38c-1291-4529-078a-08df2b8b0658
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|18002099003|260925021911599003|260925021311599003|260925022911599003|10067099003|12006099003|13003099007|56012099006|261009223027099003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	Pi3gel2dceG6lphRpII5qbnA1g/NC+xPQp2dxsGP+74ivZp+2ktAKRGhlAm381Skt1mxyeRUcMV4Fy+SOcGtj53T49TR1xoVOVw7EzZkHAjA94PYfTHG6txYz5BDdhwXZZED3kVZSb9We21dyD30aLq/YZGUecitWRqod2XJyQCx1LXn6ojaRzmMBu0skDTqKWASMr6F0w8aJnSDh0GtIu7fBMEeBGdOIU8LdQVqPhhgzlBRrz5q0iU/gTVunTUDB5EoW8UkEaoD4ln7ipmhDFQsBOuiTYdBlCUqagf0/dy/RVfu4ctpPSq7XVBaSwVqBYBSzH4351QRIPHvFECn657onvqpSrcqYKiF4B4Oh/rqHCtkaPcyh/8PrCRKHbh16+Kjz+cY1tknC/++pTpOGqtp84zKYchbjUStRh8hr9KQAG8/CmOqVyggRPaTa2Z34H6LKLpgqAB7QMfckDEIkmlxJnErIktcBmPTuvj8yBJ/4GoZVRPhYJZMAl+g6efB3HmlvxzT2BwZ+AzTuq0njt9+w2BeRldMX3Tz+oSsgiERqxxQuau8a0B6VhrKjoOECzwb6717AjgacwGY6I4WTvRxX/BOgG4lbxEhM/d+/z2v38tLpf+EbYkYeHPuNbtI
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0P189MB3116.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(260925021911599003)(260925021311599003)(260925022911599003)(10067099003)(12006099003)(13003099007)(56012099006)(261009223027099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?S0kPleOk9OeYXl8v+YmCZSyYQD0/zm3ORy3iJ+KjP3hcvvNZhMJGsVpzReBQ?=
 =?us-ascii?Q?V23en7K4NQXxPZ2gGt0Djul2GrvmtHFL6JGq60bG5J4LienPDLKhkyDNnBt5?=
 =?us-ascii?Q?kyl0VIA/kX4OD7hnuW1pHWAFsTEbtz92NUrUpPLqMgBfns066zvkIvdMKK72?=
 =?us-ascii?Q?+J1G1MHVwoRuJh5PmZxZmwseVUNUNkoupJrtHhdjFjvIIiirW7n/U0wpTMnv?=
 =?us-ascii?Q?k2dRiEYzc7RLOhhSuzSrTU3JTTbUwYsT+b5U7IqRtZjJ4ED/DVZ3p69p6pJZ?=
 =?us-ascii?Q?X/tb9Or3W5ziHUj3HqmWNBChuauKfNK3w79g4cc/IeKZpZqgp940S4ml/Wu0?=
 =?us-ascii?Q?Bmd+apfxS9Vrq5yCK8YDwsx+BCcM1hH2iQybVdw7wMHr8X7WRbAhWPwagOcO?=
 =?us-ascii?Q?/aFiLEd57k4t5/7jvua1V1g4B7PJofsy68Y6GoDFlBj7Kv+ZIfyJrOfMXIUg?=
 =?us-ascii?Q?EZMNi4hn4QvZqBeeKk2gYvST5sw5Z53Y39zjogRvXSw9j2vUo2PzDJD6Z6P9?=
 =?us-ascii?Q?0oUfdEZBG9Z1+m40dzLk/FYcnXgPQMeIyg8aEvhI2tqAG7j8KZu16TWpUIvR?=
 =?us-ascii?Q?ImYNz+myDLfbzkKAV/DJFJjv35WL30Ih62YJyCXdbvK1xfVZHYdgMn52WZfC?=
 =?us-ascii?Q?DF5cv9A/Byh+i766M8khvlnJv+ccEDLXqMt+hHx8tEiX8Rjg/WA6RG8LvMdC?=
 =?us-ascii?Q?xlqc6cF/ZucGaYj5si1XhYM3fJivC+6TJfUEKZwT227uIv5HVdf7AkGtNIcy?=
 =?us-ascii?Q?P2DDUHao9VvfDngRdA7lK9dvZyNs15nqyDbEnzZUEY6LaUYaA1ZQ+iXb44mD?=
 =?us-ascii?Q?/dHr990uow+cNwqiPKSYqSqu7OHRp3mvqkdQzS2vrkxjqeIeoRUApZshl0Tv?=
 =?us-ascii?Q?GB3Orr9+8gvG7M8SMJtdQVBUnWLGYPaU9J9lHeszUwrAyAvRe4h961ut0Wre?=
 =?us-ascii?Q?s61IETZw+AInmNtaO/NCXulXwNgLvS/qcQhbN0NeM7UT5tggO9VW6UK7OZsq?=
 =?us-ascii?Q?rccW1JFTsWzTXOp50sU20tQhGzPQxojCVF4o6/piXVUfi/FLNFLsvDWsMkPQ?=
 =?us-ascii?Q?WAMDxXsWU8kEuh8GtjLpPXujaZ8g6E03sJOA6aCXeT23fC/qa68vx3UrZnZS?=
 =?us-ascii?Q?ImsdH2e4J6F0TMUD7r6szp+fVp6r3bvd+nRAr/jkmnx4QQdteyf2oiQmg5QF?=
 =?us-ascii?Q?ZWgOMLtQOFjRUF76PmpH6VwAiRMUmGBcHWAaqI/kExBbvxvxpcVhGHDOkhqU?=
 =?us-ascii?Q?7BRLcvyYJqqLH5um9f9cygxMSJiHbddSGbpyjQ/wnZnajYlo6TSiuuj4K22Q?=
 =?us-ascii?Q?rBzWkPrJsT541koaCIWz2DOMnf2H3Kw1LDlTk8U+s8r1uRt8RYkk2VMXqQax?=
 =?us-ascii?Q?uOoEOawT4l3QT2b3AYHVLzgOvTeJ4NWFMsKrhwLxfbrUifypTGUXAaMpBAqv?=
 =?us-ascii?Q?OMb22HvfSCi0SSHJEat01N3F1Rv2r927sZQClPxCUvtuMXpojjMBvA9n0JsB?=
 =?us-ascii?Q?zQAY8Pdbx89UEz9fnAUA0NbrywJ4aMdrkK5NZcddBoXSV/5xax7UdNaLhJkC?=
 =?us-ascii?Q?YR070oIbHjG3ncAUUlFhgwpyNr1afWCM8pBgAzV81DD6uG1rsa92Kg0fq7v2?=
 =?us-ascii?Q?l1ZLSyTAW8toiPJOtMJojLnB976x0WymW+FghB7PNU4LUl9IMZQwMleic5yB?=
 =?us-ascii?Q?QImzZCQCryYYQOqwMRBsvgvSPkiKNvgMPfFfeJlnpdE5Dseb5A4FL/wCcHq7?=
 =?us-ascii?Q?I0Q1S9MEAg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 3086b38c-1291-4529-078a-08df2b8b0658
X-MS-Exchange-CrossTenant-AuthSource: VI0P189MB3116.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 13:40:21.8881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RZ4CHaCiAEH5aV6CqSYRCffezB6xQiaX6ve6F+40X8x7LwldLPlJBJy80/eoC+pjgCB7VF/f9ISAT33+Jr3iY90El/MC2Qw3prER2DtYCIg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1P189MB1837
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 13:40:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248025

Backport the upstream fix [1] as mentioned in [2]

[1] https://github.com/curl/curl/commit/5267ed859d545534d0c21
[2] https://curl.se/docs/CVE-2026-80230.html

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
Note: SRC_URI indentation is corrected by devtool

 .../curl/curl/CVE-2026-80230.patch            | 68 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      | 62 ++++++++---------
 2 files changed, 99 insertions(+), 31 deletions(-)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-80230.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-80230.patch b/meta/rec=
ipes-support/curl/curl/CVE-2026-80230.patch
new file mode 100644
index 0000000000..5a6bb35986
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-80230.patch
@@ -0,0 +1,68 @@
+From 7d34e6397166b10600c2ced93f95641d5e7c1575 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 24 Aug 2026 23:37:49 +0200
+Subject: [PATCH] openssl: no server cert is only okay if also not pinned
+
+Reported-by: Stanislav Fort
+Closes #22660
+
+CVE: CVE-2026-80230
+Upstream-Status: Backport [https://github.com/curl/curl/commit/5267ed859d5=
45534d0c21675a2b70af5a3b6e3ef]
+
+Note: CURL_EASY_STR() macro does not exist in 8.19.0, so the pinned()
+accesses data->set.str[] directly instead.
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ lib/vtls/openssl.c | 26 +++++++++++++++-----------
+ 1 file changed, 15 insertions(+), 11 deletions(-)
+
+diff --git a/lib/vtls/openssl.c b/lib/vtls/openssl.c
+index 1cf357c..cb6fcc4 100644
+--- a/lib/vtls/openssl.c
++++ b/lib/vtls/openssl.c
+@@ -4607,21 +4607,24 @@ out:
+   return result;
+ }
+=20
+-static CURLcode ossl_check_pinned_key(struct Curl_cfilter *cf,
+-                                      struct Curl_easy *data,
+-                                      X509 *server_cert)
++static const char *pinned(struct Curl_cfilter *cf,
++                          struct Curl_easy *data)
+ {
+-  const char *ptr;
+-  CURLcode result =3D CURLE_OK;
+-
+   (void)cf;
++  return
+ #ifndef CURL_DISABLE_PROXY
+-  ptr =3D Curl_ssl_cf_is_proxy(cf) ?
++    Curl_ssl_cf_is_proxy(cf) ?
+     data->set.str[STRING_SSL_PINNEDPUBLICKEY_PROXY] :
+-    data->set.str[STRING_SSL_PINNEDPUBLICKEY];
+-#else
+-  ptr =3D data->set.str[STRING_SSL_PINNEDPUBLICKEY];
+ #endif
++    data->set.str[STRING_SSL_PINNEDPUBLICKEY];
++}
++
++static CURLcode ossl_check_pinned_key(struct Curl_cfilter *cf,
++                                      struct Curl_easy *data,
++                                      X509 *server_cert)
++{
++  CURLcode result =3D CURLE_OK;
++  const char *ptr =3D pinned(cf, data);
+   if(ptr) {
+     result =3D ossl_pkp_pin_peer_pubkey(data, server_cert, ptr);
+     if(result)
+@@ -4803,7 +4806,8 @@ CURLcode Curl_ossl_check_peer_cert(struct Curl_cfilt=
er *cf,
+   server_cert =3D SSL_get1_peer_certificate(octx->ssl);
+   if(!server_cert) {
+     /* no verification at all, this maybe acceptable */
+-    if(!(conn_config->verifypeer || conn_config->verifyhost))
++    if(!(conn_config->verifypeer || conn_config->verifyhost) &&
++       !pinned(cf, data))
+       goto out;
+=20
+     failf(data, "SSL: could not get peer certificate");
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-suppor=
t/curl/curl_8.19.0.bb
index 0573e08ea4..c2697d6dd8 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -9,37 +9,37 @@ SECTION =3D "console/network"
 LICENSE =3D "curl"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0515352b285b9c3f66464b135c9c0fd=
c"
=20
-SRC_URI =3D " \
-    https://curl.se/download/${BP}.tar.xz \
-    file://run-ptest \
-    file://disable-tests \
-    file://no-test-timeout.patch \
-    file://CVE-2026-6276.patch \
-    file://CVE-2026-5773.patch \
-    file://mbedtls.patch \
-    file://CVE-2026-5545.patch \
-    file://CVE-2026-6253.patch \
-    file://CVE-2026-6429-dependent.patch \
-    file://CVE-2026-6429.patch \
-    file://CVE-2026-7168.patch \
-    file://CVE-2026-4873.patch \
-    file://CVE-2026-8286.patch \
-    file://CVE-2026-8927.patch \
-    file://CVE-2026-8932-dependent.patch \
-    file://CVE-2026-8932.patch \
-    file://CVE-2026-11352.patch \
-    file://CVE-2026-11586.patch \
-    file://CVE-2026-7009.patch \
-    file://CVE-2026-8925.patch \
-    file://CVE-2026-9080.patch \
-    file://CVE-2026-9545-01.patch \
-    file://CVE-2026-9545-02.patch \
-    file://CVE-2026-9079.patch \
-    file://CVE-2026-13608.patch \
-    file://CVE-2026-80229.patch \
-    file://CVE-2026-9546-01.patch \
-    file://CVE-2026-9546-02.patch \
-"
+SRC_URI =3D "https://curl.se/download/${BP}.tar.xz \
+           file://run-ptest \
+           file://disable-tests \
+           file://no-test-timeout.patch \
+           file://CVE-2026-6276.patch \
+           file://CVE-2026-5773.patch \
+           file://mbedtls.patch \
+           file://CVE-2026-5545.patch \
+           file://CVE-2026-6253.patch \
+           file://CVE-2026-6429-dependent.patch \
+           file://CVE-2026-6429.patch \
+           file://CVE-2026-7168.patch \
+           file://CVE-2026-4873.patch \
+           file://CVE-2026-8286.patch \
+           file://CVE-2026-8927.patch \
+           file://CVE-2026-8932-dependent.patch \
+           file://CVE-2026-8932.patch \
+           file://CVE-2026-11352.patch \
+           file://CVE-2026-11586.patch \
+           file://CVE-2026-7009.patch \
+           file://CVE-2026-8925.patch \
+           file://CVE-2026-9080.patch \
+           file://CVE-2026-9545-01.patch \
+           file://CVE-2026-9545-02.patch \
+           file://CVE-2026-9079.patch \
+           file://CVE-2026-13608.patch \
+           file://CVE-2026-80229.patch \
+           file://CVE-2026-9546-01.patch \
+           file://CVE-2026-9546-02.patch \
+           file://CVE-2026-80230.patch \
+           "
=20
 SRC_URI:append:class-nativesdk =3D " \
     file://environment.d-curl.sh \

