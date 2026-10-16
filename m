Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 455D1CC6B38
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 13:41:12 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.69])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21983.1792158065277650064
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 06:41:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=iLDpV1t5;
 spf=pass (domain: est.tech, ip: 52.101.84.69, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d/ccIIOUntihHr9kKoDGdBMtYfgswcBPApuM5HyBvqA6SU0s82iNR7cxCyL/wWEvuJyg2qOYniqMM4gpdJSCBZGssezOAycz4w5JroaKCdzMECABhAqQwueLRDtRcXvbSJkmsKcvInFjL0v/9HVdQv2ACJ/wqp6M7EopwCv7WPD/4u7G4NVMilbBhL0vVUUMuzHWXq19tCNNFjGoCSmBPCcmCC22qrDvNGztweVt0lYjkQfEcjHuvjPzdrH/viwQbaCgOSAbloUKT/pL+MFhJnCLFwmIDfML7kWl3ZAxukayhCK89MmKjps2xSsZtY5FTFJbB0g2GLPtIhNZ/e7+mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D3aapmJdpHthFGepZCnvm5j6E2TOWaQLAlb5XJHUD1Y=;
 b=MUEDCrA+2cv0CXTjw3T80KhEMgL2NbpKduSEzYCQ08LeA9mmO45vlwAdXVdHAG+UwUTsTWH75zDISJlrHt0rg5w4Mmfy4V3mGIiTpLJxQ1zZyrRwY633V+i0GqmeJ2nj+Rjygm42JSEFCmdiuY5yytW4Bm3sLie3XWv9CeOycSytNyyBwTJwA1QrbTX1msHVD/XObf8EzRhoLy9hCDg9Xj93wiVEYaq0MfkWSZKBVNOW2yxiKaxO6czRRL9alYmcREv9RmEgwzWGsqU65ywBu6izCVAzxdmu4FyM7z/PcfWgbf9B67BTXT7wQanfQj/r+BspClPNXJ+uGyTXDgGQTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D3aapmJdpHthFGepZCnvm5j6E2TOWaQLAlb5XJHUD1Y=;
 b=iLDpV1t5Q/MC0/u9Q32gLKFDyIAPu641Bh6qGz92Jb4lhudgTFQjh3cUalVJ4kNiY2KW5f0TBw8S2REEZgonDYApS0+EWnjrv51yX0ub7rLPXUnW3+uFP6sR6FlVy8lmzekTpDLVri4i44MWE3PgMYSxgJUCZ5AID665PO2MXWjn8VWUbC8/Vi3yC9LpsDcz+B/1xPkvrmslFaTSArTvuE37ivyvZeIBNO6C3+aSdKb6UzP00teKZisbflBaxE9+erfBTPdw8QJ1Nx1PbUc06kX+B8PdkOeh+LGxY/HGnPcoSf+rdQxg5CVmvSHzj/rYtm0Ok05mTzd0dun51NcaBA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from VI0P189MB3116.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2cd::21)
 by AM0P189MB0675.EURP189.PROD.OUTLOOK.COM (2603:10a6:208:1a2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.15; Fri, 16 Oct
 2026 13:41:01 +0000
Received: from VI0P189MB3116.EURP189.PROD.OUTLOOK.COM
 ([fe80::2d33:bb97:b0f8:8167]) by VI0P189MB3116.EURP189.PROD.OUTLOOK.COM
 ([fe80::2d33:bb97:b0f8:8167%3]) with mapi id 15.21.0522.012; Fri, 16 Oct 2026
 13:41:01 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH] curl: fix CVE-2026-80230
Date: Fri, 16 Oct 2026 15:40:59 +0200
Message-ID: <20261016134059.53065-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P302CA0017.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::8) To VI0P189MB3116.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:800:2cd::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0P189MB3116:EE_|AM0P189MB0675:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d8c5b75-fad0-433a-81e1-08df2b8b1dc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|56012099006|261009223027099003|11063799006|261009221227099003|260925022911599003|260925021911599003|260925021311599003|10067099003|18002099003|12006099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	m+79He6Tmuok7eh1pbe3naROTkLhezJPUBD+zqMe4oB2E0/m7wzet5LRXTb8wNhFZjQPpG57tocApQRRkhlaJ+YLmL3UelPpaDOTsu81Vj5j6thaLcMZv05FBCKwxC7NDyV8KwNvlvvTEESPQE7jpqWRpjr32e2evQWv0b/jzaxQ+kntOUGdAQ8EX+0G7WAiYo4KyF7T2DGxHHY7EIf1Tc+I98flg75q7xAETxAoDrXFQ5Ed1aUuA9DSaZG8ikxvb1ZbI4B5j0II6Kcsm5hBH5FNJ1YTfFndZg9qbGx1wfWG6OXA1y5KNVy9P7QKqgn3NeN+wsQjC+a8VRh081Vw0g87rZW2WqrC511ZHaLsS8eik9N1VnJgcFfjPnUJ30iPH8bcckW2sQedLhytjw5acatjNDDjzwR4HV95fueObikgE6HwCr+GhBEw0PUMORR6LPOSgJR1eJyv8WELiNSoKczRi9VBoVRC3hRPc+2aNn6Iu0Ju/TjcGheO14Xx1C32Hf8zznIXplvgZtgP3uQtFOhY5lk1pbhd0A3imKIUgO0gc5r9V1ekaRNY+rqV/oiMLRWWu1PXy/2ZUEi4+SWHzJ13DmoRY8vMuC2M/5v7CptvTdZXbHU5I2ZpuZcE0mbl
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0P189MB3116.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(56012099006)(261009223027099003)(11063799006)(261009221227099003)(260925022911599003)(260925021911599003)(260925021311599003)(10067099003)(18002099003)(12006099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Qa88raNF3fM2A8vJEQLbtM24efS3mmIErRNI0g/YusynTqvyblumqTT0N26a?=
 =?us-ascii?Q?qAiAnS1jp8ZC8b3UO3WIB3Slm3e9giyhk9Nsbb7Bwl4R6l+RqccHj7KbLE9C?=
 =?us-ascii?Q?VhjPSvQS8nw/rygh2V2yLfTTSBTEgk+9dZMc5cgJNs+9+P1IkPRdb/yo9RlE?=
 =?us-ascii?Q?Fxy5jUv3ecrrSP9EWAA+NZ9DgF/WtdmFoQe0QP59MIPySKfzR0hcHORbGZK5?=
 =?us-ascii?Q?KxJzNcJlmxgf4klrE6XxNxCeTy+J6Y6pbcMZx7QVwi5PcmYXhllBLyYRfb88?=
 =?us-ascii?Q?+RCa7HGZJLVlU1g+4iidGkhGxDrbPBqNPGSBLLbUFbYFxj6twSfDzLmtVOer?=
 =?us-ascii?Q?KEgXI71lDt00c0IZd4qy9iXh4fjiYHi9XMWFSMBNVwPDaF8zQUjFPTccnM9i?=
 =?us-ascii?Q?4QgVIcjltqI+WNu2f0mG4isYxBzGncpSeAbvvWyiKIlRhBMwPvv1ctvUE2Jv?=
 =?us-ascii?Q?5MrnDQuPqIx3wKQV8YGnvXZ5PpJapxXT3tgJpxLr6z2quKXIKjIMeC7OLKlA?=
 =?us-ascii?Q?0jYU7Yj2uzVRTiHOI6gestD7e5Uxml/MQXLIHCz9f9Tm9SwodU8VvICmyM5T?=
 =?us-ascii?Q?iOeJrDy18pJDu7QbfexNvVa0eAhopjbGUsUY2pfXuQhAetWq7klk1N5jZTjc?=
 =?us-ascii?Q?28/Y1BA31bNG1LInu4O/hQx5s8Qp8efjy4vX06j32ChWkFYorGZ56egxSXv8?=
 =?us-ascii?Q?ibXq8qcHqjv9rrkO2Av+EDY8mbRpVBMx9kkDKRnQ846fZjoaAdV0qdFy8ugx?=
 =?us-ascii?Q?oyD5eWPk6XCrGiB1ILjAEdEejQpwkr/95ZdnWA2qdXWT+jxFmRy4SNMdmfAu?=
 =?us-ascii?Q?FmYWfQbG87bCVNOwBy82wBzev1b9g6vEezOF2dNsc8hn2DiOvqPbaYcg3N6w?=
 =?us-ascii?Q?DW0oCIkBZT3C+AkqlGxBPf6n0CmKPeOzswsmSB7Bj3sNCxsHLhztr+SHFF/M?=
 =?us-ascii?Q?kLmE+z416UeYCiWgP2I7+bqiL9j9jbAAlWsI1WZmQIpvoyj4k7XJm/7yGnfw?=
 =?us-ascii?Q?hvU+NiORYpmf/AWi/9tDrotdYBsdWa/bM9d+wNBjbRV7JsG3esRjC715zyG1?=
 =?us-ascii?Q?UQPlWZ+3lp118vO/OqCtA7hqq1K6i/IDpLQ2dKKUbnf63Pq2DRUmQ0nJ96R3?=
 =?us-ascii?Q?32Zv4FI5hQufLFbEywH1FR9O3ff/H36KVW50USBfHbtopk51kxVzJ44hIaNt?=
 =?us-ascii?Q?Ty/M8gEqjG6y6wapTkXmTwIAc32jRezhc7lxOAEZRDxmMekF8GZ7RRVFrwMK?=
 =?us-ascii?Q?6Tl6DLeMcR+YEL96GHtQfYY+dVKY2XvDsZ/k3mtfmiQiKJt8w+w4lLfEXoP4?=
 =?us-ascii?Q?4JNVgmjaQBBkF3H4pDb1RWsRaaZheGX7qgRQAkHSQeFt1tqsnovpV05WHkS/?=
 =?us-ascii?Q?J7uhO8Y4YvPSECSPXyUuU06qj8REaQpwcxPSvahgJQl6B4d4ViwUMVekACGQ?=
 =?us-ascii?Q?gFGo5ZEJZZPj+q5I5q0Ebe1v2JDRxZ9HlvVzAjIaglyVEZpog3o0rwSPl2Be?=
 =?us-ascii?Q?FR7oMi1yZ+40Bg4eptOLnVbrNhdk070mibMR3T0QmW8KH24oG2FtIH8ksAo+?=
 =?us-ascii?Q?Ej7yHz0AUtkFnXjHFNntF9FMls3ZHGq2dw7AeYlnXKV3eszosGK1qKCnQtkO?=
 =?us-ascii?Q?d3oBCm2WjYOpAq/XoAwfrObv30haGNo/sdWH07cKMT06EZYjPC4OkepANju5?=
 =?us-ascii?Q?TCeUBqV74YRuD5RykbSn0Z6u7yRZWNzkO65JRYq1CD34lF9oQopZyaIwQsp7?=
 =?us-ascii?Q?lb3yPAc4Ow=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d8c5b75-fad0-433a-81e1-08df2b8b1dc0
X-MS-Exchange-CrossTenant-AuthSource: VI0P189MB3116.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 13:41:01.1037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pwj8JloeTrb6dZNjW5n+T/BXBbq9tFQ2lLOxpvWJUrL+hJtzP35YAhzwAl6uCVWPzUlwI/oviGPokE+YZrrhO22m4SyV9hIh/bOgBuaW6CM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P189MB0675
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 13:41:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248026

Backport the upstream fix [1] as mentioned in [2]

[1] https://github.com/curl/curl/commit/5267ed859d545534d0c21
[2] https://curl.se/docs/CVE-2026-80230.html

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
Note: SRC_URI indentation is corrected by devtool

 .../curl/curl/CVE-2026-80230.patch            | 63 +++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       | 68 +++++++++----------
 2 files changed, 97 insertions(+), 34 deletions(-)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-80230.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-80230.patch b/meta/rec=
ipes-support/curl/curl/CVE-2026-80230.patch
new file mode 100644
index 0000000000..0473c0922d
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-80230.patch
@@ -0,0 +1,63 @@
+From c14852aaf58042b71f98cf5aebea8d7821f6e5e1 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 24 Aug 2026 23:37:49 +0200
+Subject: [PATCH] openssl: no server cert is only okay if also not pinned
+
+Reported-by: Stanislav Fort
+Closes #22660
+
+CVE: CVE-2026-80230
+Upstream-Status: Backport [https://github.com/curl/curl/commit/5267ed859d5=
45534d0c21]
+
+Note: logic lives in servercert() in 8.7.1, not in ossl_check_pinned_key
+Macro CURL_EASY_STR is not available in 8.7.1 used direct data struct
+strict is set based on verifypeer and verifyhost by calling function
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ lib/vtls/openssl.c | 18 ++++++++++++++----
+ 1 file changed, 14 insertions(+), 4 deletions(-)
+
+diff --git a/lib/vtls/openssl.c b/lib/vtls/openssl.c
+index 3e130c5..481528b 100644
+--- a/lib/vtls/openssl.c
++++ b/lib/vtls/openssl.c
+@@ -4202,6 +4202,18 @@ static void infof_certstack(struct Curl_easy *data,=
 const SSL *ssl)
+ #define infof_certstack(data, ssl)
+ #endif
+=20
++static const char *pinned(struct Curl_cfilter *cf,
++                          struct Curl_easy *data)
++{
++  (void)cf;
++  return
++#ifndef CURL_DISABLE_PROXY
++    Curl_ssl_cf_is_proxy(cf) ?
++    data->set.str[STRING_SSL_PINNEDPUBLICKEY_PROXY] :
++#endif
++    data->set.str[STRING_SSL_PINNEDPUBLICKEY];
++}
++
+ /*
+  * Get the server cert, verify it and show it, etc., only call failf() if=
 the
+  * 'strict' argument is TRUE as otherwise all this is for informational
+@@ -4248,7 +4260,7 @@ static CURLcode servercert(struct Curl_cfilter *cf,
+   backend->server_cert =3D SSL_get1_peer_certificate(backend->handle);
+   if(!backend->server_cert) {
+     BIO_free(mem);
+-    if(!strict)
++    if(!strict && !pinned(cf, data))
+       return CURLE_OK;
+=20
+     failf(data, "SSL: couldn't get peer certificate");
+@@ -4424,9 +4436,7 @@ static CURLcode servercert(struct Curl_cfilter *cf,
+     /* when not strict, we don't bother about the verify cert problems */
+     result =3D CURLE_OK;
+=20
+-  ptr =3D Curl_ssl_cf_is_proxy(cf)?
+-    data->set.str[STRING_SSL_PINNEDPUBLICKEY_PROXY]:
+-    data->set.str[STRING_SSL_PINNEDPUBLICKEY];
++  ptr =3D pinned(cf, data);
+   if(!result && ptr) {
+     result =3D ossl_pkp_pin_peer_pubkey(data, backend->server_cert, ptr);
+     if(result)
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support=
/curl/curl_8.7.1.bb
index ade637adf3..dac2da3c25 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -9,40 +9,40 @@ SECTION =3D "console/network"
 LICENSE =3D "curl"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deed2e5088e1ac619c9a1c747da291d7=
5"
=20
-SRC_URI =3D " \
-    https://curl.se/download/${BP}.tar.xz \
-    file://721941aadf4adf4f6aeb3f4c0ab489bb89610c36.patch \
-    file://run-ptest \
-    file://disable-tests \
-    file://no-test-timeout.patch \
-    file://CVE-2024-6197.patch \
-    file://CVE-2024-7264-1.patch \
-    file://CVE-2024-7264-2.patch \
-    file://CVE-2024-8096.patch \
-    file://CVE-2024-9681.patch \
-    file://CVE-2024-11053-0001.patch \
-    file://CVE-2024-11053-0002.patch \
-    file://CVE-2024-11053-0003.patch \
-    file://CVE-2025-0167.patch \
-    file://CVE-2025-9086.patch \
-    file://CVE-2025-10148.patch \
-    file://CVE-2025-14017.patch \
-    file://CVE-2025-14524.patch \
-    file://0001-build-enable-Wcast-qual-fix-or-silence-compiler-warn.patch=
 \
-    file://CVE-2025-14819.patch \
-    file://CVE-2025-15079.patch \
-    file://CVE-2025-15224.patch \
-    file://CVE-2026-1965-1.patch \
-    file://CVE-2026-1965-2.patch \
-    file://CVE-2026-3783.patch \
-    file://CVE-2026-3784.patch \
-    file://CVE-2026-5773.patch \
-    file://CVE-2026-6276.patch \
-    file://CVE-2026-5545.patch \
-    file://CVE-2026-6253.patch \
-    file://CVE-2026-4873.patch \
-    file://CVE-2026-13608.patch \
-"
+SRC_URI =3D "https://curl.se/download/${BP}.tar.xz \
+           file://721941aadf4adf4f6aeb3f4c0ab489bb89610c36.patch \
+           file://run-ptest \
+           file://disable-tests \
+           file://no-test-timeout.patch \
+           file://CVE-2024-6197.patch \
+           file://CVE-2024-7264-1.patch \
+           file://CVE-2024-7264-2.patch \
+           file://CVE-2024-8096.patch \
+           file://CVE-2024-9681.patch \
+           file://CVE-2024-11053-0001.patch \
+           file://CVE-2024-11053-0002.patch \
+           file://CVE-2024-11053-0003.patch \
+           file://CVE-2025-0167.patch \
+           file://CVE-2025-9086.patch \
+           file://CVE-2025-10148.patch \
+           file://CVE-2025-14017.patch \
+           file://CVE-2025-14524.patch \
+           file://0001-build-enable-Wcast-qual-fix-or-silence-compiler-war=
n.patch \
+           file://CVE-2025-14819.patch \
+           file://CVE-2025-15079.patch \
+           file://CVE-2025-15224.patch \
+           file://CVE-2026-1965-1.patch \
+           file://CVE-2026-1965-2.patch \
+           file://CVE-2026-3783.patch \
+           file://CVE-2026-3784.patch \
+           file://CVE-2026-5773.patch \
+           file://CVE-2026-6276.patch \
+           file://CVE-2026-5545.patch \
+           file://CVE-2026-6253.patch \
+           file://CVE-2026-4873.patch \
+           file://CVE-2026-13608.patch \
+           file://CVE-2026-80230.patch \
+           "
=20
 SRC_URI:append:class-nativesdk =3D " \
            file://environment.d-curl.sh \

