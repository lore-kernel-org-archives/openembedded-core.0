Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 825EFD72344
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 07:38:16 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.109])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.62852.1769153884309212761
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jan 2026 23:38:05 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@witekio.com header.s=selector1 header.b=iTMS9Ew8;
 spf=pass (domain: witekio.com, ip: 40.107.159.109, mailfrom: hsimeliere@witekio.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ymy6og4zVW7Musw6b8bQrMwQ40Vd0xMV8/qQ9vK+UTr9YpDe8uSlql+XXytco0kJSRXzoCWN1TrDi5ZMQszeFJMWKW5z3AEkedSJCCwPM00Ano3H/wrHtIdXruOfYOundM4rJrBizX4iYk2CQ8SyV7JabdEORi2ayilTx9AM+aRrGc+9qnA8e5zibiBPjguSdnJib9CJ+DpZ4QKq+61LXsadRdbxdDkUvY/PhNn7dPZmKy1Lw3TlpBHdvKBb3ZCtUz+Gdgx7sB0pE7toO8txw1JzlDW/W/M/LX4b7f4k8r550EtR/24sq+TtlAhKZuYUqvK6kk+BLP2gpEO269hPiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3n/mM+J5VKLWEYhnToEfJnNxpTRymZdD2cYsppS1fN8=;
 b=tscjd/dFGGtHyDUBgse6hh+iA4ydi9hVlI0pRMveDWq2XUlsVv7PeQCdDFwgXQ9SJnSkpb+zaAWUdSZcRh/npmx7qH64Vyge3JOaI0+92zf8jBoM61e5AnHsmPo+OHxx3BUkuonyRpXEQcOEg/I9uh3KWsJkpASPIYVKBQhY12EG6dSkyI7Ngwj822FfOTYIs+LLO2hfZZ2z9d74Jei6AeQIXkMcXMgNkXpmEVmfawdynlUEJyxmV7FH8j63eHwMqWYGlhG1u8a9+L/hFWadAoNlAjH06DzbJ25ff4+Ygb6Af8SzKWGZdDZyXj+kIzhdt7qCN5DKC0s0zW0Ch0vJDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3n/mM+J5VKLWEYhnToEfJnNxpTRymZdD2cYsppS1fN8=;
 b=iTMS9Ew8e9ndaWo+7lyHAHO0IR65IFPZGHj076J1v8RBH27RG90+5uv6JdqpJJ8nxnrvWsSCgjkjKrIqsDNY7OznE5gFdtO9jIyHVgrlIQRGrY+O52afSDPyCKc/Ps2fpanGjawclUpjBFEi885Xr4i42lhwIzvpATGwEoYBsI1XnLAxyH3qiAD9Wvkje8LK04Gq8jZGevD6LZOgY7CeJZVHX0V36qxB4l/SjW2Ur8EZv0o3B9Ap2jxVVwKohADzIyNfaWa3k6lfKtA2dIMsOcjKs6zwIjhfO5G4Vzjs2/HDMFKgT09vWwg0KsdwOwdWmGSwukG3Wd3pyAXmaCD/ow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM (2603:10a6:501:87::6) by
 DU0P192MB1721.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:3bf::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.11; Fri, 23 Jan 2026 07:37:59 +0000
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::7e78:af5f:27db:d020]) by MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::7e78:af5f:27db:d020%4]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 07:37:59 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
CC: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>,
	Bruno VERNAY <bruno.vernay@se.com>
Subject: [OE-core][whinlatter][PATCH] libtasn1: Fix CVE-2025-13151
Date: Fri, 23 Jan 2026 08:37:51 +0100
Message-ID: <20260123073751.2351933-1-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0695.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::20) To MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:501:87::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWP192MB3504:EE_|DU0P192MB1721:EE_
X-MS-Office365-Filtering-Correlation-Id: f0e7bc3c-09f6-44ac-a46b-08de5a525531
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|10070799003|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6wnzHBuBBCcw/a5x/RaZ/qMxX8DsbPcvnxwLaEyJT0FjlJNpF8vHm+1zZ3pE?=
 =?us-ascii?Q?2Z5uU2X3j11EgiMHiOPVhCdn+sQ8kjWQb2WF9x7aIo/eHwT/N2I842oNyRzQ?=
 =?us-ascii?Q?TpbmmXMGU8M92R6usE0VWiD1nUZk5LSq8NCIM8d1R6/vEsv37gFmd7k/X58V?=
 =?us-ascii?Q?2v1mJyhVUuGVt7EXrJQW7caEArgRbHz973Flzgz00bpxSscfbgGvfUpwXGJI?=
 =?us-ascii?Q?YSa9kXMyFA7KmgFU+2zhSXvbt7TyWa4nSoYxhoNmROvjHY0FAWWuX+kdFol1?=
 =?us-ascii?Q?M+Auz2XLXI4sgrOXs9iNP85uJRAW14gO5K9owa00xt267UTlsxlQlnLPgJTr?=
 =?us-ascii?Q?m8Nbqn429gdffsRHM0TKjTd5KdvtrW4hreNJA1fZMS2zolVvdSpYcR6NM85T?=
 =?us-ascii?Q?duDA450ay1NxppUua3pMbR+CAihCm7bOI2X7NHehFAwxG6twQxQd1xQNJimX?=
 =?us-ascii?Q?uK0GskqDXjGDf+4QDO/NP1njucKW3lNQjI5XRaaFSguwKobEXdIFoECAW4s4?=
 =?us-ascii?Q?2U8G4br9ZZQke4MizXB9BKeeeD4u7KxH85wVllU+SolTTC94mZhlkZkh/rq6?=
 =?us-ascii?Q?L40qFN5b7ymWNC9C18ad/eoOb7ing1s7kYXaOT5tw4JS9wOu/3UGWlEnj/FH?=
 =?us-ascii?Q?n5bHYJ3TAQT1FSwlT7lPVB9niaz8w2Hz7akIkeVUxEtIzbYYL1tRwT+c4jhi?=
 =?us-ascii?Q?i+fBRj5I4sxzrwELV3jireCAGfSAGRWI0gyzoHlG6gP3P+diFNMDKsLUQRMf?=
 =?us-ascii?Q?3rggK49HxjyN9P7cx+qxHwe4KeSo/IpvGb7g/epM9CUu5qnIgTMCMwkiDOfg?=
 =?us-ascii?Q?eir8xeCAWWkvwfLCyPVPl+UVoFLb9GADF8meVnqPnMBD9f2/ZwCspkm5fomE?=
 =?us-ascii?Q?hKYiUACV+KuOSETqqau+BBKerzNQqapTT93tFEscIL3y1YcmRndFyek3Pwg1?=
 =?us-ascii?Q?323tuFy1+/to4dj1HFfcUFYFsT5KXDew3u//ue54P/k1Z8YNHdOn9WALIfse?=
 =?us-ascii?Q?vtXJhxQa38h3Ej/MiLZnjdkrfSms1JUYvsqfTPkrBTYwq/bJJwYW5YuBqFqe?=
 =?us-ascii?Q?gcKGF4l9KfwsHKrVKimVpBN3E7Cq+AdobE5XV3VC1ah9UmsX8gCcYTKgwCcu?=
 =?us-ascii?Q?wAzxwZpryK5BAkEZSG+sgHWuYN3oHF43jIzN1Whj3f3XB5rRHltkStYw0aGL?=
 =?us-ascii?Q?ULE+F0zkay3HlMCqmM+3zDo3LXJ+CYO/nK4La1xsoF7xkDj0uEozZuE8fq0m?=
 =?us-ascii?Q?xwoT3nrRANT3fP8pC1/K8CrbiGBaFEDQ9NKiSKyO7DcBWEVtBBK81dm2dJ6Z?=
 =?us-ascii?Q?nTTF0AysGecRU2/ymzlW3xESA7UU64CUcOlaALJ4LMbLofb0jj2Dh9QhE5QQ?=
 =?us-ascii?Q?kJ4dI8f98S9QzlQUl10aodIMj629SRzss+JbZjNZOfCYrl0QcL/ozAbjQirB?=
 =?us-ascii?Q?5vvua6fRXxx3EEfekVhYylOD1AOPw37B48nk02lAqIj3L6/X/zZMWyTfbfOV?=
 =?us-ascii?Q?f3gvvtEuCiW4Kti9TnrioOv7loKLkhkGUOIqAKG4x18jJW14Auoe5mlALMdw?=
 =?us-ascii?Q?BZ8pMcEMIFRJQ6mrZTw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWP192MB3504.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(10070799003)(1800799024)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vXgCCReGIajnBz2iJdEsVR1vgg1uvEYHKgfFyLSSNJFHca2QCFj1mktbM4u2?=
 =?us-ascii?Q?Kxo1bg799gNixCgbnUs82Bx3kNjp72BtDkfovSu0U/zLyoHHgSOqXP9R+itT?=
 =?us-ascii?Q?ixYvMpQXGCs9T9nWxXRmm79bmRt3R91MryO8povIM2k97usa9KdQB419kBpB?=
 =?us-ascii?Q?4pJUoGCrcJfJ46xzXo086dTXzu+EId8IAHlfXyf446YW0Jb0/1h5lmY5v0Bm?=
 =?us-ascii?Q?eY7LOqQ7EJuiOFHczF5vBBeDx7KPyuib6cxnr7yt8YirLQRPenGdtcqd6h4Z?=
 =?us-ascii?Q?t5rykY94C+CXj92RqllUalOjVlu7agjGJx4ZgLz/yjx3ZtlBI0C+ZJNtJSio?=
 =?us-ascii?Q?Yd2wrRELm44mAYlqAr2F73ceNb1A6s2PBUyXkFuGpDT7UPPLBDnZshkh4mSX?=
 =?us-ascii?Q?b/Z+pVYJ4l56l9hUHMzOJWT+dp1kv3unorPqU1zglsNyD/rFZHoaPj8Mf18L?=
 =?us-ascii?Q?YqmefekwJItDfQ5gcLUAjeCEEfOGWy0dstMR2H+jwCBfnaMw4bLVUE+AJ7N+?=
 =?us-ascii?Q?iOEAwKhFW+8jOOu5sJiuJO/YbHYtBBNqvS/uxfRLjPptjBxZn9djEXm2pvQl?=
 =?us-ascii?Q?CWpyUKm7mqyxDyC4PXkTMITsrf/3gSuUemrCzrbeuK7gNnMbxXnb+pEjWhdP?=
 =?us-ascii?Q?QADUf0WvEDbNVHxWIPDukOmAD5kePFDB+5q8uvUXAieIizc0G672R86gFipb?=
 =?us-ascii?Q?HBAF7qNYV0e4C4jpdeSRBeQSQluy3KAeugpjxBEX3luA7PyEpepr5/387Zo5?=
 =?us-ascii?Q?t+hwjeHB4UoRHO+BayDhm0giADdkUSCKVO96UMPfhQ05zphluZApUgeAknYT?=
 =?us-ascii?Q?Awpj+Q7D7lYSz0QHp2moJFPKS3e+uowA1XDUBGzLH72iNYHPZ3k5a4JH06ZU?=
 =?us-ascii?Q?QOE6P0S3Ll4jSsVOmEk0oIFSBkOE+6diHbZWLwCqP0HA9oQPdHMh0sv3d7kQ?=
 =?us-ascii?Q?/NYJHtB4wZc1TD4kzOhisDfI+V4ZyYkLqNAIMJWpiTMLOLmpnsbuJcRJqSnb?=
 =?us-ascii?Q?RQwDIMOgwRrYamkguh9hrdaaOvqsSQN9fBDSuqVW9B/QLOtdWBp0GA+7IBSI?=
 =?us-ascii?Q?iyGPrHwGLGlXaMuPrFGjKHCLUHZyeKhp/+buCnvsG23mPkqsjpKdY0pOixFv?=
 =?us-ascii?Q?/xW+OqffitswMLUq3ShRtAizDUeWUwTb3KXshgXtf6Q0vjn3fPf7YkWgXwpm?=
 =?us-ascii?Q?GyfzfLH704M9HHd8gE2QKZDSyl3hw64q4RuooIR9davFvk2gSV4rP9LvS0dy?=
 =?us-ascii?Q?090+r+RjlCjAf6vPxViSprX2VMaEILh4Kb99WwYM4KPaKFs8zDX0UZcsux2q?=
 =?us-ascii?Q?xhaIlX0GXb/5N/bhmrFU40TgBqpLbshJB/qC+G6JYeiXGHY0gV6k4HpP6DEu?=
 =?us-ascii?Q?dND+zSq5UDQq6oN/MlbB1eOAwh7EUjII73j7PFaDVVm1w4AZ2naWLNOsKGsE?=
 =?us-ascii?Q?vu3vNJkCp7C5j9odfSNI4vlV4tqxF2GpXAAciYaRtSQcs9l+Hz3WonUq2f2J?=
 =?us-ascii?Q?6yqEipQ0V/bJI/UCNkesgeE2GCGgjwjyno4O7dSQf7gS/DJKye0EXmtDfG2Q?=
 =?us-ascii?Q?OYYB1oTuz4eOgjxuM5tdxGQfJGFDIqECw8w26R+CnwalNd28Dfi7MTo4L8W1?=
 =?us-ascii?Q?xlNvsSdV3cm3BLoR5v+eCZhinYY4W9HjQlOzkC5ebmA4sTEYqwt0CzawvMP9?=
 =?us-ascii?Q?UdXl2qSKpTGtktDPiUIU1ho/vvYZkV8nVrXkbPFVZ1olXTw2H6Va0m1xbOUu?=
 =?us-ascii?Q?cBupB3JiBTE/BIhsk+Ok8QGmHxvdK28NGAWYbL3zk5wKXh02bxrCQPk7G2+W?=
X-MS-Exchange-AntiSpam-MessageData-1: r5ii+3KWiie1PMstHDN6xdRi+5aQCjKTmzQ=
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0e7bc3c-09f6-44ac-a46b-08de5a525531
X-MS-Exchange-CrossTenant-AuthSource: MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 07:37:59.7016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x5ImDBx//e20uaObb0TGdHme1ekasNildfLgeH0kB1B7tTuhmrzr3i8U0rqEdVFBKjL4q8FmOS5D3Y9c7DSJkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P192MB1721
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 07:38:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229874

From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>

Upstream-Status: Backport from https://gitlab.com/gnutls/libtasn1/-/commit/=
d276cc495a2a32b182c3c39851f1ba58f2d9f9b8

Signed-off-by: Bruno VERNAY <bruno.vernay@se.com>
Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
---
 .../gnutls/libtasn1/CVE-2025-13151.patch      | 30 +++++++++++++++++++
 .../recipes-support/gnutls/libtasn1_4.20.0.bb |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/libtasn1/CVE-2025-13151.pat=
ch

diff --git a/meta/recipes-support/gnutls/libtasn1/CVE-2025-13151.patch b/me=
ta/recipes-support/gnutls/libtasn1/CVE-2025-13151.patch
new file mode 100644
index 0000000000..5047d67984
--- /dev/null
+++ b/meta/recipes-support/gnutls/libtasn1/CVE-2025-13151.patch
@@ -0,0 +1,30 @@
+From ff7aa7ef2b9ba41df8f2d1e71b05bf2c2ad868dd Mon Sep 17 00:00:00 2001
+From: Vijay Sarvepalli <vssarvepalli@cert.org>
+Date: Mon, 22 Dec 2025 12:24:27 -0500
+Subject: [PATCH] Fix for CVE-2025-13151 Buffer overflow
+
+Upstream-Status: Backport [https://gitlab.com/gnutls/libtasn1/-/commit/d27=
6cc495a2a32b182c3c39851f1ba58f2d9f9b8]
+CVE: CVE-2025-13151
+
+Signed-off-by: Simon Josefsson <simon@josefsson.org>
+Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
+---
+ lib/decoding.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/decoding.c b/lib/decoding.c
+index 1e0fcb3..abcb49f 100644
+--- a/lib/decoding.c
++++ b/lib/decoding.c
+@@ -1983,7 +1983,7 @@ int
+ asn1_expand_octet_string (asn1_node_const definitions, asn1_node *element=
,
+ 			  const char *octetName, const char *objectName)
+ {
+-  char name[2 * ASN1_MAX_NAME_SIZE + 1], value[ASN1_MAX_NAME_SIZE];
++  char name[2 * ASN1_MAX_NAME_SIZE + 2], value[ASN1_MAX_NAME_SIZE];
+   int retCode =3D ASN1_SUCCESS, result;
+   int len, len2, len3;
+   asn1_node_const p2;
+--=20
+2.47.1
+
diff --git a/meta/recipes-support/gnutls/libtasn1_4.20.0.bb b/meta/recipes-=
support/gnutls/libtasn1_4.20.0.bb
index 8127ba5b1d..bfc011a2f1 100644
--- a/meta/recipes-support/gnutls/libtasn1_4.20.0.bb
+++ b/meta/recipes-support/gnutls/libtasn1_4.20.0.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237af=
26da5dc08a4e440464 \
=20
 SRC_URI =3D "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
            file://dont-depend-on-help2man.patch \
+           file://CVE-2025-13151.patch \
            "
=20
 DEPENDS =3D "bison-native"
--=20
2.43.0


