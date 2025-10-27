Return-Path: <david.nystrom@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 139FBCCF9EB
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 19:55:04 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.20])
 by mx.groups.io with SMTP id smtpd.web11.887.1761594902252617472
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Oct 2025 12:55:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=LLBJj2Il;
 spf=pass (domain: est.tech, ip: 40.107.130.20, mailfrom: david.nystrom@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MtiXrdPScVa/qZIPDJ1UYKD/Xg+Z81e+kDjUsA94k2zfdAbOROuaHkeUbKreyd1bHkfgux70LfO/GRXdAfrYr7QkoHK3x5TY0nWL41K3fFlWLBRsVjUz+vAc0Q2ATeebtSom65BSvHiQOB9FkFw0DY3g6/nUgCQfiZbzGtGLeTVwPjQzDv9adhUwWrDe4/qY3FWN/x7vqbA+BFf3YSVFdEL3xTK5Hp+p+e7u3L9UcX+yBxK/kfLEkRW+8YwfhSdXyxYm7GIhyW8BelPx1h2aK2eZkf5ijhX+hmAkTMsjZrn5juavnjE+mANo2MxgYrKrWoY6LMuyMj4k2Rl92Hzxuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PafUFwlLKJt9Y/J5+OymhWXm/x/sv1hyIpR2nqLEe5s=;
 b=xwOtfLw94U3DkSCe+lPzY7eoM2QEKRUF5jW/umJAV0UUwRy7cBG7GDVSpBxEsqFBzpIlyIRzRsqBH6TMuAmQYc9ppLkg6WwK0rr07z8yVvnEq1N7/pNXCAvw6edqZaPp2tAyZE9620FoswI5mivs1G+9qHF5PkXig+KYiK4Ay4x5Jwa67YoGD5ad9++UP+fbzItq47VPrDAfPGBBBGuIPxGWZL223owptgeOJFAjMfebukMyLQX4nA3r/7tfox69CB1Ea+KIfIUtBJTQDfKqNm+bXw1h/3sv++EvLzKoD+z6Zoh2lQjhAps34SLy5iV23QVvzdB4dZY3zx8gmsskBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PafUFwlLKJt9Y/J5+OymhWXm/x/sv1hyIpR2nqLEe5s=;
 b=LLBJj2Ile4b9c+UHSlzGBOOgUXzKSNRPs+TvPKopyjqyAu9MpLiqhfEG/Fsbvx4tYS2vII+x80fnJzPiCKH/8I2EH78GmOb+T2jRpcp1uVB8SpVywPQKU85M+r8pdLX65Cy7e2U8F/QkLeBfdwYEIPYh+Ee6MGW1plhmCCAPm71xibkNK+ecdi+yLWpB72Lyn3HKx6IqL+HrtO1FMqsBcGlbU+fnsMm01bfhJkbbZwkD3K+JX+lgu/fzUCK9OaPxdvIGmCH0tLGG26UypMDAo2t3QKxEApp0f/Xg24lmVQv7K+63+w5N8ZrZjVuUkK4DdVstU/DD5lfZpOCxr2XPiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from BESP189MB3241.EURP189.PROD.OUTLOOK.COM (2603:10a6:b10:f3::19)
 by PR3P189MB1067.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.16; Mon, 27 Oct
 2025 19:54:56 +0000
Received: from BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc3e:2aee:25eb:1a0b]) by BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc3e:2aee:25eb:1a0b%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 19:54:56 +0000
From: =?UTF-8?q?David=20Nystr=C3=B6m?= <david.nystrom@est.tech>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?David=20Nystr=C3=B6m?= <david.nystrom@est.tech>
Subject: [OE-core][scarthgap][PATCH] lz4: fix CVE-2025-62813
Date: Mon, 27 Oct 2025 20:54:48 +0100
Message-ID: <20251027195448.716828-1-david.nystrom@est.tech>
X-Mailer: git-send-email 2.48.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO2P265CA0102.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::18) To BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:b10:f3::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BESP189MB3241:EE_|PR3P189MB1067:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b1e17ca-1603-42c2-2252-08de1592b434
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?yaPl25L93HCuHsoTlYH185/JyArb5Wvmmy3R5iAxGE3hq5REsv+7VFpJfnB9?=
 =?us-ascii?Q?rqKY0plIn6pXW+jYoWVDAPWFQxMb4S0Bk09SkSnPWGzXFVjLMOx0GFLTezH1?=
 =?us-ascii?Q?Hfp+mXS4qJm7qchaVmdpzg6S1Um+yrxoX49GKjV654po+XmiNiufOQwLndt5?=
 =?us-ascii?Q?AIZq+oSrf/FcZCFeo3roJYFhUJQOEJlq8BH4UlSYyiqKDcUbURlX8XlRqYPC?=
 =?us-ascii?Q?aReFz5uakx1CXyNU6tRhYAo4WxDCYGv/qmEsESzc1ojrGmaBWy7TlhU3b8Mc?=
 =?us-ascii?Q?XvXi5a8SmfCD/QpqqnnNvI62yZan6d6+w7XdHDEzjOwPJDk+jwjroBcuW/Bn?=
 =?us-ascii?Q?nmwyKZW+nL6/ZoMN7fgsC2TtXM3rABk8bKD9d57lQIJK7DEFOm6XlMQ1T6Ew?=
 =?us-ascii?Q?STRanMdpbOVorrUHCbErzNeajDithoeQxKZSRkBeYtKstP0DohEfHta13Gie?=
 =?us-ascii?Q?layYgGkImMaNoisBJpqLXm8BIonz7UE+IuYSo+xnRW7pqq938DUHd82M2g2+?=
 =?us-ascii?Q?xLJgeM54DMfDoKHCilBBExZ8RMBzQKpviUYsAcBx0wIFYjSCrz2AV6ozLRWs?=
 =?us-ascii?Q?u4zIA6gJJdr5+/zXxQ9GKVgf6kOOR7p/ESTB6kWL/vB+Vmmo629uoaQvDrG7?=
 =?us-ascii?Q?EP58b39ChKqGbjng4grksO9MAipxtQKqDmhv8xfLB3zq3Oyld4Sh2kX9bq89?=
 =?us-ascii?Q?qdiTQwBCpcceJ9qbcr91usj69Ee/Ur0IQrPZZUOidjzT6jX+BIVS5RQiAbSo?=
 =?us-ascii?Q?+TojuH5jSpBq8RwM1AGrdxztwmDquER74tJ9iAbyidNnp8moYyW++z45t0og?=
 =?us-ascii?Q?Bp4SxHfz9+Hyp74GiNCeF/qLGAngTVBcKVAyJdh5XFBuVcyL0LPgWOBuSH68?=
 =?us-ascii?Q?cjAEePHPKmLfszWd2HoVNfFhRPt00uQ0KTRO6VBeVnkb8P6T30PvnnojPrXe?=
 =?us-ascii?Q?a1s9ik2ib2I8ySzbbFK7d/xRCQO8xLfgZcONNC7hPlqaEx9IqWApvpj4k23M?=
 =?us-ascii?Q?5Ooo+SKfQjSLDzVx6kBdvFYP0dsnPIbARafbGC2YJpYxCNZCnbsdOi5yedAm?=
 =?us-ascii?Q?ym7BUMadeHgbUTMPK7kUuEEQxNj32vk9bK20TWFjsZ1snWZhNlFtSnfnSgNe?=
 =?us-ascii?Q?ruU5X0oNhIiQItauzxvthwycW/fEQUGwCjbNajBk2VBG245JTLwzkU0ydfSS?=
 =?us-ascii?Q?N50/ySWoIhaSs9O839izzKgQMnJiIfFezAgNI7NozdHBnX4H2w+9WiH8wEoN?=
 =?us-ascii?Q?cl/JIasipQyJuNipDWXfyRq87BQXzeNRL7qiR0QSjwlii2H87GNbbdC6i7xK?=
 =?us-ascii?Q?rENr/Es2zfWT1fDxe7v2OvxZgHIR/3i+Rr9I/ctuJoUCzc4yOgFF6LR1iXI4?=
 =?us-ascii?Q?q9MCcvjMLrDh7Rb+MRVtmJnyQIeiDYgP3PEVE5A7XzO1jBON4TeJ+PA2deeQ?=
 =?us-ascii?Q?E3pALuyGc8U=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BESP189MB3241.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QCJz7EmqFzObGz6kAmFsLgeKvIkcDKVs8E05tgvTsbfDWMb83nwH+3dSSOcK?=
 =?us-ascii?Q?p//S88+iDCFkHR2W/ABE57FKfYNSC9pErB/7/0ngwRZtpXUZBa/EyCQ/vivA?=
 =?us-ascii?Q?AKQpRVEkRyb3piBQHWtaCTWBBpd3qkO1iYVbIenPtkZGeO+wREOZO0066bA8?=
 =?us-ascii?Q?0b8LoKHGD/+aE25xrIguyR+Aw3bR55DRZaiExONX3FW4UXVUeurrFRkX4yTK?=
 =?us-ascii?Q?O4uktwAiygbMnIyeERcL/cWV3pgy5VvPQhhoBcQRvpmb+t0J3XMcc+zs6Yk8?=
 =?us-ascii?Q?5ZaK61i4vJvZZp2GpL5R9gPX1w99C9xauQ1lfp7aMZln0Q4KNrLDX17+5Upg?=
 =?us-ascii?Q?tzMnpWD+mv+DXmt3BEm47HgfBGC/tFWNTT9S3ZEiLhceiIsTK25CiHcM24mj?=
 =?us-ascii?Q?QDmSfiZTKn7evpPHKTX0r5PXH4Xu3Q+OdYAG76aDLcH9syHK9uk5Pd8LBPLc?=
 =?us-ascii?Q?8usekfTT2LN2o870A5wW3nU2T/6hW5dg1rLvmgiMXi1WXqCM9dtvC240IM8h?=
 =?us-ascii?Q?ATDdqSvUnk9v/LiWVDPAGK9f7L47n/DJZnF0V8VUjWDF6g+pZUfGpeJJ4eer?=
 =?us-ascii?Q?sQcgYDPiv8KNMZjHQU93MsbqIc/f7SB8ZL5gSSkPZ7lyBycXzNLlodLj0RMh?=
 =?us-ascii?Q?jRH5CYTD5fhJPJE56XxxL2g/V6EtcodBiiRRprBsXIMd/YYuKEAl7vDSFfiY?=
 =?us-ascii?Q?7ToJsaW+czelgzLc7nrqgjOLGTNl+3TXQw4t6XnAkIH/E3k9h2LAvsXaN876?=
 =?us-ascii?Q?nBTL3B43092pq64ZR/n398NepaYP0SBV+HLu2Bw0k3kJxfgGTe3z1zvQCpgK?=
 =?us-ascii?Q?Ul4enZdRyP4yorgnD+ebaZUfWooZK+jO7Pz1jMZepaVKhNAW3X/a6Awy2kN5?=
 =?us-ascii?Q?vJWCAQMEZ4chKNjV0gUMb2JJ8617jZtJACYzgmdk0zgagVLzIsNPVLunHYB1?=
 =?us-ascii?Q?/vwJ1Ue75Qg8+YVS/GI+tuoLeIxGOIuJhk5AdjAWYeXVqMoXFZiGut4QR6/0?=
 =?us-ascii?Q?X922JIZyIbrXBpSeydEFNOEDW5IDQp9DoG73tzWXKGobi7Xl6s4hxizOkf0P?=
 =?us-ascii?Q?SSbdgtoTqoz/FMTneh1p5hZo/R+tbOw5FSaO6bkUuvT1nCpu9ON9kgdpy4+W?=
 =?us-ascii?Q?58kvdLu+0ShoEURZo5At/5gwj51jHQWgYkuTxpGab3gjedmDBIaNgXOfNbMl?=
 =?us-ascii?Q?N0r4n18Qkq5U0KJi8qzY0wGClNutWd48zk69FRbBqudfRAp0R8I6FPP97e7E?=
 =?us-ascii?Q?UDa4KSJ6nc73Jw9O4CL4t1ZARoYPYFcQFgiasCwX4LxZWT64vAWsDjeXvpFS?=
 =?us-ascii?Q?b+5PlXYjik0NBXMosVWmKFWnCQgBgtaoe6irFWWMniswwJ6hKPFmVWE6hRby?=
 =?us-ascii?Q?x28w6pJVCRG6rHJCPQzRIBdo9SUzV4szd3DZlurWjsZow+zhyZM6+dLOCDAD?=
 =?us-ascii?Q?0ZdL16JY7L8EsJtiDSd8cufitrVeVvMQbyxkMwPt4u3Ng4lo/h87wdBx+6kW?=
 =?us-ascii?Q?MbaB3A0EC4TxxGMIEKM2RgG3zRFxaUUhaAl/CMvhpP+6ILZ5JHlEodO1mF/G?=
 =?us-ascii?Q?ZC+jQ8Nxd2MzOIea4MTe7nl8sZrQAldb0s9H+0kMooZ8v6AiL3/B0vAkPoKa?=
 =?us-ascii?Q?Hg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b1e17ca-1603-42c2-2252-08de1592b434
X-MS-Exchange-CrossTenant-AuthSource: BESP189MB3241.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 19:54:56.6953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IBFBO8dYA5JYh0VJwaUNmnvXohNums7vau7QmmIQwTfX6YuijBUxNU5gYdetb7XSXsDFPvPdOPdeTdeEw0W0iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P189MB1067
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 19:55:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225352

Prevent attackers to cause a denial of service (application crash) or
possibly have unspecified other impact when the application processes
untrusted LZ4 frames. For example, LZ4F_createCDict_advanced in
lib/lz4frame.c mishandles NULL checks.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-62813

Upstream patch:
https://github.com/lz4/lz4/commit/f64efec011c058bd70348576438abac222fe6c82

Signed-off-by: David Nystr=C3=B6m <david.nystrom@est.tech>
---
 .../lz4/files/CVE-2025-62813.patch            | 73 +++++++++++++++++++
 meta/recipes-support/lz4/lz4_1.9.4.bb         |  5 +-
 2 files changed, 76 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/lz4/files/CVE-2025-62813.patch

diff --git a/meta/recipes-support/lz4/files/CVE-2025-62813.patch b/meta/rec=
ipes-support/lz4/files/CVE-2025-62813.patch
new file mode 100644
index 0000000000..bbd0f74541
--- /dev/null
+++ b/meta/recipes-support/lz4/files/CVE-2025-62813.patch
@@ -0,0 +1,73 @@
+From 10dbd089b74cf858a24a4aa4c2a438984ddf17d7 Mon Sep 17 00:00:00 2001
+From: louislafosse <louis.lafosse@epitech.eu>
+Date: Mon, 31 Mar 2025 20:48:52 +0200
+Subject: [PATCH] fix(null) : improve error handlings when passing a null
+ pointer to some functions from lz4frame
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Backport [Upstream commit https://github.com/lz4/lz4/comm=
it/f64efec011c058bd70348576438abac222fe6c82]
+CVE: CVE-2025-62813
+
+Signed-off-by: David Nystr=C3=B6m <david.nystrom@est.tech>
+---
+ lib/lz4frame.c    | 15 +++++++++++++--
+ tests/frametest.c |  9 ++++++---
+ 2 files changed, 19 insertions(+), 5 deletions(-)
+
+diff --git a/lib/lz4frame.c b/lib/lz4frame.c
+index 174f9ae4..cc6ed6f1 100644
+--- a/lib/lz4frame.c
++++ b/lib/lz4frame.c
+@@ -530,9 +530,16 @@ LZ4F_CDict*
+ LZ4F_createCDict_advanced(LZ4F_CustomMem cmem, const void* dictBuffer, si=
ze_t dictSize)
+ {
+     const char* dictStart =3D (const char*)dictBuffer;
+-    LZ4F_CDict* const cdict =3D (LZ4F_CDict*)LZ4F_malloc(sizeof(*cdict), =
cmem);
++    LZ4F_CDict* cdict =3D NULL;
++
+     DEBUGLOG(4, "LZ4F_createCDict_advanced");
+-    if (!cdict) return NULL;
++
++    if (!dictStart)
++        return NULL;
++    cdict =3D (LZ4F_CDict*)LZ4F_malloc(sizeof(*cdict), cmem);
++    if (!cdict)
++        return NULL;
++
+     cdict->cmem =3D cmem;
+     if (dictSize > 64 KB) {
+         dictStart +=3D dictSize - 64 KB;
+@@ -1429,6 +1436,10 @@ LZ4F_errorCode_t LZ4F_getFrameInfo(LZ4F_dctx* dctx,
+                                    LZ4F_frameInfo_t* frameInfoPtr,
+                              const void* srcBuffer, size_t* srcSizePtr)
+ {
++    assert(dctx !=3D NULL);
++    RETURN_ERROR_IF(frameInfoPtr =3D=3D NULL, parameter_null);
++    RETURN_ERROR_IF(srcSizePtr =3D=3D NULL, parameter_null);
++
+     LZ4F_STATIC_ASSERT(dstage_getFrameHeader < dstage_storeFrameHeader);
+     if (dctx->dStage > dstage_storeFrameHeader) {
+         /* frameInfo already decoded */
+diff --git a/tests/frametest.c b/tests/frametest.c
+index 33019551..523e35d1 100644
+--- a/tests/frametest.c
++++ b/tests/frametest.c
+@@ -589,10 +589,13 @@ int basicTests(U32 seed, double compressibility)
+         size_t const srcSize =3D 65 KB; /* must be > 64 KB to avoid short=
-size optimizations */
+         size_t const dstCapacity =3D LZ4F_compressFrameBound(srcSize, NUL=
L);
+         size_t cSizeNoDict, cSizeWithDict;
+-        LZ4F_CDict* const cdict =3D LZ4F_createCDict(CNBuffer, dictSize);
+-        if (cdict =3D=3D NULL) goto _output_error;
+-        CHECK( LZ4F_createCompressionContext(&cctx, LZ4F_VERSION) );
++        LZ4F_CDict* cdict =3D NULL;
+=20
++        CHECK( LZ4F_createCompressionContext(&cctx, LZ4F_VERSION) );
++        cdict =3D LZ4F_createCDict(CNBuffer, dictSize);
++        if (cdict =3D=3D NULL)
++            goto _output_error;
++       =20
+         DISPLAYLEVEL(3, "Testing LZ4F_createCDict_advanced : ");
+         {   LZ4F_CDict* const cda =3D LZ4F_createCDict_advanced(lz4f_cmem=
_test, CNBuffer, dictSize);
+             if (cda =3D=3D NULL) goto _output_error;
diff --git a/meta/recipes-support/lz4/lz4_1.9.4.bb b/meta/recipes-support/l=
z4/lz4_1.9.4.bb
index 51a854d44a..8c96f9bab4 100644
--- a/meta/recipes-support/lz4/lz4_1.9.4.bb
+++ b/meta/recipes-support/lz4/lz4_1.9.4.bb
@@ -13,8 +13,9 @@ PE =3D "1"
 SRCREV =3D "5ff839680134437dbf4678f3d0c7b371d84f4964"
=20
 SRC_URI =3D "git://github.com/lz4/lz4.git;branch=3Drelease;protocol=3Dhttp=
s \
-	   file://run-ptest \
-	   "
+           file://run-ptest \
+           file://CVE-2025-62813.patch \
+           "
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>.*)"
=20
 S =3D "${WORKDIR}/git"
--=20
2.48.1


