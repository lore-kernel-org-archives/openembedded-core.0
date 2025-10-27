Return-Path: <david.nystrom@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33E15CCF9E5
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 18:27:47 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.70])
 by mx.groups.io with SMTP id smtpd.web10.40728.1761589665324624789
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Oct 2025 11:27:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=TrXF+dYn;
 spf=pass (domain: est.tech, ip: 40.107.159.70, mailfrom: david.nystrom@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rGvZLwnFqeoZgr53mtGhlK5ESyT0bQpNQ8GZx0Wn1afqfnGVplwh136UdUutMz5U0Tdrq0qMaqfyGw4dpYRcmbj0uplMmzMNT/7c0v1NyTuTUeFVblKfZlndP6WfNHW3SgLbQE0x0Ln4ax+SjJhdLXizV4KGB8qSX7WlbKN/TRG+7UdSxNuaA+xwekZK2RBE2RGYmuZZ2bNM0bbn3n0qdRf44D7Emdue7rdkMYJDJdVGgUKpPKSfswONfOrixRF40VIkr3urjQksuOzRIyYJkVQc8B1io8kDLkIbHPaJyq0iT2La+cAPAoMApaotUXwtZkJTuW8CpqjdXu3FVikuqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PafUFwlLKJt9Y/J5+OymhWXm/x/sv1hyIpR2nqLEe5s=;
 b=fdMqOFuL7uwDEIoJs0lOZtl3hytSfyLCcOJsydV3/vKl2FeuHs9RYVSi+FqcZi8ppfbQPYo//3E0Rj6xAqbV+ghRJyac8HgaNT09bzLWoPuqlM/LPJZKETyNrg1UnPUviQbswqKL0MkrXLmKc6Aj1qLqjDARtufnqyBJtJop6w/qJp8sa4QmmEM5NNVvW5MxxtDRguGJWyjduohHBStG4XaYq1WzohC9IMfH11Lgi8PTShQFUB6IbpmwQ+wyQ2ZSpa8D97fD0iNAfTT3qbtzfF+Vyg1xIkf/zsLIWGjS95MeUC+esToZNSavfD56IzfSqK8Ajx8sPI4h3vcByt6s2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PafUFwlLKJt9Y/J5+OymhWXm/x/sv1hyIpR2nqLEe5s=;
 b=TrXF+dYnXzsyQNTdPuBnF3090AfnURGGBpXDCpgYsUEyBPbTgAAWJvz29QTFTFtDH6eriKKigt9qnz3qUB2dsxeflNgKbvda+NMVVmJOWS4Aod3PmIdDsS4T2ThHV1eYLDQvNYyLNBF07LXymClYvDezWwaizM7wSz7UfgcgV1thnu5F9bs3TxFHTWo4DvdlYdc6l5uxIYFVgsC3eDk1bcSNthoA7hOzY1OO0RzGRSTq6LqgCaKgZBGDF3oGBcrF1fRo5nBwzrKevLJYbcCQqSNHfVW4BPrDZZDlr1G8s5FCTggw1AyyEgslQza9UIaGf+FeQ4gYcASPATN2pQyTLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from BESP189MB3241.EURP189.PROD.OUTLOOK.COM (2603:10a6:b10:f3::19)
 by BESP189MB3343.EURP189.PROD.OUTLOOK.COM (2603:10a6:b10:f4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 18:27:41 +0000
Received: from BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc3e:2aee:25eb:1a0b]) by BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc3e:2aee:25eb:1a0b%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 18:27:41 +0000
From: =?UTF-8?q?David=20Nystr=C3=B6m?= <david.nystrom@est.tech>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?David=20Nystr=C3=B6m?= <david.nystrom@est.tech>
Subject: [OE-core][PATCH] lz4: fix CVE-2025-62813
Date: Mon, 27 Oct 2025 19:27:19 +0100
Message-ID: <20251027182719.684586-1-david.nystrom@est.tech>
X-Mailer: git-send-email 2.48.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO2P265CA0133.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::25) To BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:b10:f3::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BESP189MB3241:EE_|BESP189MB3343:EE_
X-MS-Office365-Filtering-Correlation-Id: 684a7b1e-cc04-40cf-4a75-08de1586839a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?mveUU4OVX9BCM5flmUGN2N/vzqdpvoa3YT33Bd9jBQac1jFTG2qJ1R8mJdHo?=
 =?us-ascii?Q?v/F0H2ONQrdgxqUR1V1E7gYmYGkNMEw0uihpK+4u+cVRc74COCsSn4iXTvuu?=
 =?us-ascii?Q?RRVE/JP0WH/Ez1HakXlYBWViXOJPp5g3vf4n90k9X1xtGjrppaacGWxcSE21?=
 =?us-ascii?Q?EzFJ30EJ+jsiavYayYWHOHu+u6bc34Fj9jmnkLzp57kywsqrEeVWZy392OXY?=
 =?us-ascii?Q?d0FGmrjpcI0rzMqzeL0n6fDhqZg7GINvseo5gLudaZImbUwJ3n8ELzHN8ymk?=
 =?us-ascii?Q?WmCuVznus0kvkCY2ZtA/S9kFAt1tooAk3QOgw7dCJYDDTLY/36Qa6q+bq9Tc?=
 =?us-ascii?Q?XxQtgG043nv7p4VI44N9nFmzkB9xzT7dabbYwl0ZbMqJR7lCDGamZppAOXLA?=
 =?us-ascii?Q?g7QBiz9ZbkwUi3eoTPxOievRueKy6976unJiyqoAmYCNqMNDLo3H23jh8TIv?=
 =?us-ascii?Q?eeibVbQxUZebrXfpasb5i7oTFGZ1ohlW+QhppI6cev7lYB3Rj8OYcTlJ6lOh?=
 =?us-ascii?Q?1sjmYunJHU/MJy3x1vY3/YbBZSJE2dzkOgKfU0z7hCPxhhV6uIbeGQ9zyhdm?=
 =?us-ascii?Q?xw4XO79rJ/LwP5tRviDZeAEKunKTNX4lcgXxHTWzoa11GrghJnbPpfmjXzzL?=
 =?us-ascii?Q?hPl/0khYvYl8XhcSDyyOn0dz3Tn5Ze6hdWhO7/GebmMYytk/sFtbACBRrP3V?=
 =?us-ascii?Q?JcqwsGcE8euvoMfx/1U8Be2/6bvwok4yoLKD4GgAWI1i/DWe9ZaoGPm/wxKf?=
 =?us-ascii?Q?+cqMkY4IDDbX5JlZWptU2x0rWE3ub3fiE1tS+cwq5yiluTAMC7REI/MVdxDr?=
 =?us-ascii?Q?PE+W9guW1v4ljpP1Ju3ISpa0St6hhitn+NbM2RuOqIL0RBxRklEmnhQT6fuX?=
 =?us-ascii?Q?uQMUDarXxNH0Y+LQBPRHlr0JQpqwrCAXt15AuOXLpGZqfiU3qjj1e0OhYTpb?=
 =?us-ascii?Q?VIOThQSx4slLfqoRi9/ZBtVwcUkjLOASO6PFmdtG3afw65bXaOQ7njblGxNo?=
 =?us-ascii?Q?+l+PCu3dDnEPg/v8WAMwjFjyHLrrhmU1NnpKa+GkFjZ4I48eKjtwUCM54kKt?=
 =?us-ascii?Q?Y3WHd35+qAnMvMcpxoBwIDYSx3lozEM7ABZ7Cp3Iz4XZou0Eo+5E3GFc7bWT?=
 =?us-ascii?Q?MHUuHaElaptlvE62Ac7bl9SoZ2pumcqC2dnuJPEBbYrU1RwVkhlxjexhr3A3?=
 =?us-ascii?Q?7C7iB7351Ykb+0aGTj1euwd0wq2OehCBJwUA0S4DNXszcouDPC/RnaObHu/C?=
 =?us-ascii?Q?QTpRy2GP8Br9m7pYStnHzuTZoUiaM99Cl2z5C41F+seeuRgaTnmiV0tsRulc?=
 =?us-ascii?Q?uomTzESViX/ikp1+3ij9fjnKM1J1zgaGoQkdAxoNPGFcixL0BrDzXrYyiHt6?=
 =?us-ascii?Q?Q0JwYAJ/Gbf7GE7knTfhkphE05L2RaQ1oCCyMb9ls/d7pF67kEw0iEnx5Uq+?=
 =?us-ascii?Q?LnY2s/KCnXw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BESP189MB3241.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XzjbDIUio8V71WS8TBuoasdt84oE3VtgEizQVYQeUwmq3uKgPLIPeU5w22Xt?=
 =?us-ascii?Q?jq2hBm9Gkbq222WZds5kMz/kMkJ7tD7lGVbOlrb6isgYQmPd17xhaf63Z662?=
 =?us-ascii?Q?N56Q4tBONg4TyLwUaHPrK5eAgrNcLjcOodWHS708LcfBqSHd73qvcjDPR1lL?=
 =?us-ascii?Q?AOC7kd1jRc07OHK5zwOvc+i0wKewot8mZwttqRErpV5o7x/IISmhWtVNqKKV?=
 =?us-ascii?Q?2Hps5Z/cbEurzfDglnSxnICMk/c97zfi8W6FtgEuNuR84hD4447krW7VLpgS?=
 =?us-ascii?Q?2PxXNuRyM4t1c0dxQl6syXZ34lhMBJuKGB5F9NqoIwz6HC2u+bnbCdqLhyEM?=
 =?us-ascii?Q?8C2X+2P7mPf9iVPkvnK0vBYl1yv7WGOxxOUAwAu2+4ZGyxZ4n9CntodTDvkH?=
 =?us-ascii?Q?xTWdB4qczZCHNGAnHyRPF+fWK0xxSWXp2hjxdgkDF6Y39SIKeuDNTrfDjlg8?=
 =?us-ascii?Q?UKGAaBpSfIRoXoDOgdhmZePYHmfTFEm2kY7NDh6RbSeppWiFt9tefWdx+V1h?=
 =?us-ascii?Q?mtQtdvOL45U/ZbqlOC9upTQ696sDypM26Uv6WaeffEDCytr1EYjPbacMWdar?=
 =?us-ascii?Q?g9VN8788rcnd7aUP6zwE5mV7kiRF4o+cMpGghmIf781/ZRFOAVWtnKiqUb5I?=
 =?us-ascii?Q?wV67vKxxZJh6WuBbm6E3+y1/Dbc+JLCBb5DdDDk5bRv3TlYNTf2ECGyYA9u2?=
 =?us-ascii?Q?ey9hqySSrxi5GTFz/icN9vjhisl5OdzHAG43K2BCejeozwRFrtcCdqBL2yuE?=
 =?us-ascii?Q?XIrv/6ZuEXcJPRJbggLWtk3ksqAcekDs+a0Pzqyihg78YYpyq/NUE699HuBi?=
 =?us-ascii?Q?sWxYFYld8ZTYYVMwHCsZATHbUXL+2R+LVtoC0oI8Ikjh31sjanGKzTcLHHEU?=
 =?us-ascii?Q?S4uoG7uyEBVmLoNlg5ZUhqTDuz3LFXOOmr4ml8I/tNOaWEbAJttcymiK+qnB?=
 =?us-ascii?Q?nkJ/wIDI7uD/m46qqf1tCZigELpA/TySZKUpcAbZBLla8MzyqqjEj12RIoQP?=
 =?us-ascii?Q?KfTy593gz7FkDexjFXyGX7RQ7QrfCaBD3fHJiPV0VqGIACoXa8abvJSgaPsI?=
 =?us-ascii?Q?7Kwo9wDlLjAXX70KADMQjutvaUcPF8fFd8ZFwhWkuAZEW1ewq3+otw9WSp7o?=
 =?us-ascii?Q?7dGJpRhFCflAT2N5u6mhv0dxkt6AtsXhgauAH3jg3O7oDLzSpaqHGI66PULb?=
 =?us-ascii?Q?f+E8BHnxQXGBfsb9/HusIvFkhdmMEOxqMy3IsJONl898ViH4ErJ/AE4uBx/X?=
 =?us-ascii?Q?z5u/ccrN+ceyNXSH7kxkbdMoc1NFk3Z6BntGdyXh2SEhCnyNKsSw3LDe1xtl?=
 =?us-ascii?Q?ltPoZtNa3vBCzotnaQe8mFUIqc3rWdSPAw2szM0IOJf+KtW/2iouq6+IG+DU?=
 =?us-ascii?Q?eDhA/rZ7vYEnUJdqg905cefLy84UeYV0Uq5CRre3izDk8ZRfY12z2qNTqKxa?=
 =?us-ascii?Q?d4dTcfm+IXfBeihJ24Mq9BJj3Rn02G7gvtYPTHa3Ddl5lXJuHHJC8lJQR38r?=
 =?us-ascii?Q?8Mgp+/P53GKgZZJjmXwYh50QtYF5QsoIhuQUzo9KlRGyoyy13hGH0oT5mOeD?=
 =?us-ascii?Q?4SBgwX/z+ItHT7y9mEkp22M8hIQtjJdKb8bTA4OWfe0oHYMhP4E1UIVlByv5?=
 =?us-ascii?Q?cQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 684a7b1e-cc04-40cf-4a75-08de1586839a
X-MS-Exchange-CrossTenant-AuthSource: BESP189MB3241.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 18:27:41.1745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ad8ynpbU6g6EieD69QwybH43OoiUvUw6F/E7VdnsUe1I7NAp7TInaapxZ7zaFrBSvFz33dM3VSyhl52IBtVEUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESP189MB3343
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 18:27:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225347

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


