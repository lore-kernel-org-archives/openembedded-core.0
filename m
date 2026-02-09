Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7216E81BD0
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 14:25:49 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.35])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48342.1770647144535915363
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 06:25:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=vzrijGwI;
 spf=pass (domain: est.tech, ip: 52.101.72.35, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=stQjnVgVbrwu5Xra64JY2Zh4iJcoUweacxav7scTFlB7shBZKzaAxkfV1dePBki+tV3dJTfxyBlEXimvcWWSJDazocrQ29Kt8CRa5poR+9umQsc8b0MWeMmM/ekLXDnOZMLBDUJHWJhKIs32at2/DUSNYS6NJwBHuB3hjI08pGJF6JoxeTdGJuxobFVtUISXI1n2qqyCIviTjWEr8h7vc4x9BZX6xYSnsQod7RltiWfX5tXTKo8Ckf6LVrA0x0ka8H6nZXAW6JCTEmr0HjwOb9cLM/UaKkHipPpSPQ37G10GjgvFdsdv7TM/M40gFnmYXvwWb802GJLomtqMw/GhJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RSmYh6x4sDwZId0b0SYbTG55UwcMtXcF4vlxAMvRulU=;
 b=zQhHZ8IDTnYgsNB0/V3WB39qjH0Y7klcPg0lEPK7zavlkKv+kET+hVospgZQYB0y1jJDmuOswr/hBsZsA062NPkKgicLaDyUbFoYkGpcQerGJlUGu5RKXO80pyDogk7eYlbA0LDrzh42l/VDWnpk8HpRbOT8yFaXDOE4Q3cGt1dns24Pt0T2sI4KHy8MWEtpuFLZAC2PqXKFbVTNsnwGrrUoMJm4oPQOHNnNThYH+WzgEZkRY8584b2eJ3yu7jfWjmJm73xB+oz0cwcw781Kw5xSAIv/tOFqWMfbTumRO0SvWBa7oD+NEEBMEkP0kU0YnsjFFpcQna29Au1D3hacHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RSmYh6x4sDwZId0b0SYbTG55UwcMtXcF4vlxAMvRulU=;
 b=vzrijGwIA/CJQj0hqTTMmz+mBkquRb7VzJbnnGTAPB62tCMFhwHEDQezjmd6vaVqxNrudl/kfnLmDJevzR6hZum4cP/ri0jW5y52QemobUUG8rdB7XQVaYig6Eex4TJTwxerFcl2Lr9xiBx+gWfwMTF+9/7PklmpcBV/o1OukZNMjATd7dg1IRTjRv5+/miS6MgbYIRRAEByRTRXkQ9qp2SyroPw56ayQ4QV2/Ch3HCSM7+QpJyLOWebqf6EZS9cixnDW1lWEtN2HZK+IYBKEBL89pgiOhF97R3JwJKNh3Xr9XmDfHnIFzQT2GfiB2/ZQn0N50kb8073m9NydM8DtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by AM7P189MB1012.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:14c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 14:25:40 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95%3]) with mapi id 15.20.9587.013; Mon, 9 Feb 2026
 14:25:40 +0000
From: amaury.couderc@est.tech
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [whinlatter] [PATCH 2/2] avahi: patch CVE-2025-68471
Date: Mon,  9 Feb 2026 15:25:20 +0100
Message-ID: <20260209142534.55871-1-amaury.couderc@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0157.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::14) To AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6ad::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP189MB3196:EE_|AM7P189MB1012:EE_
X-MS-Office365-Filtering-Correlation-Id: 5536bc2f-62c3-4893-0111-08de67e719ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?bvRLE3rCUGTtS+6hPGK8wZd/6/oJT+72nf/8hsZlsVtDb2e9xm2T8+QbHDYJ?=
 =?us-ascii?Q?CmEQHoTvB2oV3dJXH8eXex2CAlSatY0cOGgge2EAGnX87Hi5FME5tTexQ5EQ?=
 =?us-ascii?Q?WkG3AVkHAprj7/RtF9/oG5kKkX6/sbRK6/G8oGFjdyfe+682OTI1qqEOViX6?=
 =?us-ascii?Q?/vBbXgPU27gRtfz8wq+TBi0AsnK31YASU433obZP9aUll5o/9Bku202BC6Va?=
 =?us-ascii?Q?Pwp+UADS2g/hKNYHZOo/MEBa6cQsq4DdXiCCwcVsp3C3czguxdhfRkS3WJdD?=
 =?us-ascii?Q?t48nYPUvVe2WifG6xLS7YTdxkM+nDKZSqp3NGTkSBoZg/+/8h9ATNc3Y1Aa4?=
 =?us-ascii?Q?B0uQgVTyy8KrKys6/+KPdFVNlubWbo5A1lomyQGloILYYj/1WAyaskxKJrsY?=
 =?us-ascii?Q?jeDIh6cDcvhNIwi7wcleHIPMhjxr2mk8moUKj0UJizNyAMf1Q8fntqHLCCZC?=
 =?us-ascii?Q?YSBZEf9SukDIEvB0uBlXfgciLqIJZk+JKQUmym/tk/6VPMY/DGa/1LoXj1Kr?=
 =?us-ascii?Q?mwCMfHQUQDcFTkQ1ZnRd0a12NyPLJmkg/7PmQH2gVpk4UxUNTBVwApQ7eqZu?=
 =?us-ascii?Q?udXaWDm94yRSOBp4fC94NihpmJzWeieCi5g52WmqGWbxZKLH4ZoQb/D5rYcz?=
 =?us-ascii?Q?oqhT23C9zf0jA9LiAcN0Z4FthlYL9bBAm/jmfezBHdDCmVmEsLTcbHtuNHTG?=
 =?us-ascii?Q?E9jksjLqnaL7oz9Mw2rvvbiXK+vJpBLuR/LMumgzTpPLedS4f+YjLB7w4G8c?=
 =?us-ascii?Q?vC3VIXjdFVXbJtY+jLQBuwsNFIljnvcbC7/L2ZC2UDexG77qF+Sl/r0lbmxI?=
 =?us-ascii?Q?CImq3b9HCLzLnTpvjxaWSztPaNKU3Ewhi/tnPMaXeHqtdbCPNtyq4ou3DCI8?=
 =?us-ascii?Q?NJ0hHPNwv15UOHN0A4+ggqVSdISz5I/orNoZKtTjGCwLGT3y1lBJ2Pgy4rju?=
 =?us-ascii?Q?1aIswiCC+XjA0EHFaBjAi7XiChuQLKpugRK2fP8119YX47w2OGikiJAq6iYX?=
 =?us-ascii?Q?t8wp+SAepQT4DGkNnhopvVL4PugV1k4MqDOQ7qojd0ARJRJMBdItO+eiyNQm?=
 =?us-ascii?Q?hkT59VG64fRKZaXpWj0FYiZZ9dvqaECNqMYDCkcrjOFMw4oRVuZ6kgT988K0?=
 =?us-ascii?Q?y659UOUP5DyNKuGzXU0bYTWnmQv2/JRbSRV58NF+JC3y+pn7M2VH68IrjlFB?=
 =?us-ascii?Q?IWRqkpKECPJCBdl46MJFRN5oGWI+fIzOxEzp9ZS7BrQ8o5LJgenEGcYUQh4y?=
 =?us-ascii?Q?aCdNYGj2PJEglPUNbioj1mI9ZXcvUXcNYgTmrWJqUilOfi3bc8JmCWQoAahY?=
 =?us-ascii?Q?pfOyKxroo2mnUKcdcFogG0HNVG81qCwW4kQICw5aPsScXY3aHRqE9EFPVqnk?=
 =?us-ascii?Q?IT/TUetFFqyMLT9lO5BjCyTQrIPzO5iWMw8Box4pXfFFYGZl1k3Ur+Pq4gwQ?=
 =?us-ascii?Q?mYvsi4G6PQA6uw54B2i0h7P/k+HfuZWxgzIENkIiUXT5XxX+vyyRkyMdzkuF?=
 =?us-ascii?Q?3TvWwse054dzDAw5+sGxZpZCzzI2p5BNE+N/?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SJ1vXmnSyI+l1Nqa5Rbzp6vblqwmwrL5NTYNms1j8b8x5UJUpRxzy+o8KhNT?=
 =?us-ascii?Q?VsyArzjY0WkUEtA3nzuP9c6rO/rp/hLpyztkblrdSsEdBqk8qT++UBA8KiID?=
 =?us-ascii?Q?5FAEYrhRpvoGcM22LNsTLIv4yoAy+KM7LFsmHOWL330QU/4aAqhizbNUNfad?=
 =?us-ascii?Q?ZFGWK0ycyu9qe+7DJlotoYUrhDzW9OLY4kmR41wYG5kgDhifoqA25ta1jRM1?=
 =?us-ascii?Q?l0DSceMaXNYwuU0Bm8wk007DNiW7Z4DI5GndtjWNXq9XAPRx6OM28Z0kGC/3?=
 =?us-ascii?Q?0NN56ZaBJ53CeaF1gkjUfQZo9mgQCGYIYd+IA5Vbh8VQKhjVO6kBfErvQ+uP?=
 =?us-ascii?Q?JX1RZxQNcxFQIGiS6rRvnySFkgZ7dirF7BDat7i7jKv/JZm4STqahB4zmuVD?=
 =?us-ascii?Q?WeY8RT6qPfRrhGfvORuVtdsgUkmL+wiq0S2TVzaQbFYCk3aTzLLHpNeDXSjo?=
 =?us-ascii?Q?orxOYWIPEWWeArf7JSZGmn5+2CzO1B+YCJH5iX9uN2RKvmqevS+hiDGFiK7r?=
 =?us-ascii?Q?lpp5Z3o2kO5JVdqXfZk16AQQ65Hk4FOgb/nDaXtZiceV91PqWdSNyXz5jvdg?=
 =?us-ascii?Q?kMWchG2Tml3aawJbXPYlUNyAFdBpo80TH0LJDfAwClU51PHyLyNI3lEwspjt?=
 =?us-ascii?Q?6vI06hlPSCTWuxvmCitSgxPV7uOjaBLgac6UJF3H5iYm8F4uw+/oec+xt+hj?=
 =?us-ascii?Q?f5/8smWI0bOMuWc/lyFiNN8xEj7JKKh2c4wgZI6P6CDii6XECFHEuRQgZKAC?=
 =?us-ascii?Q?DHgTMYV6k4K65MoEPG36rgw+XnhGGpOUIB2e/SzCrk0VXSaL4Csu3bOEpzvr?=
 =?us-ascii?Q?YSRrSwi/c2kmV1tUEg67aCbWpXpoXnCh7CNJHxX1+Ee+B1sCY4WSkO8VXWvf?=
 =?us-ascii?Q?GkR6h5En0UuNBjZ0owR5W4Y3x+JrNITZGiaqQ6BTpVjfyMErMi7laqKUuIg6?=
 =?us-ascii?Q?od5lDqnKh6osrmYW5fCkmdtIVJU1yFjt/nUxG0hFWI5BVD2htnz6AH2TGAvp?=
 =?us-ascii?Q?3jVrhBhbK2xyTHadW/1m084SASCdhPmH64oFj7Gq177dL6yGoSiUSnsBUEm4?=
 =?us-ascii?Q?Fa0cVOhets+km57+5taAMa/3hUw5tAJFt0iaHtNgLNcomtKXYo13nOCDuZhI?=
 =?us-ascii?Q?M4tBk9hx3Dv+nfYjrLZfgZGG4ODRt6yMQuJ94pDVvR59kLIqCTeimLRegKDH?=
 =?us-ascii?Q?ZZ5nTGbFUWjNm+x1xx+zz/95awBRypRys8noLIb1xzscOgYEm0BxQHGrupjr?=
 =?us-ascii?Q?wR8HMyqhLe5kN4jXmMMrxQY/83mLw12JxfSg7zs0uohrdaoXDx5F4vII9pL8?=
 =?us-ascii?Q?6ONRgSFfF+n0v8nM8kuEJHF3TK3TmA1riKO22WPxBOnlpjn+NWy8/UvlNeVo?=
 =?us-ascii?Q?3fNcRJd2pM5kPRW0zQ4kyELncB0VMH7B/BLs6k4fXoGK9YgfMW1I2HV5MS36?=
 =?us-ascii?Q?mFKjsRmX6jUPdaK75DAXkYMABRXnh9SidPiUL0sOudZpU9JiGZkSoZRbv5bF?=
 =?us-ascii?Q?Cx6yWbfmXlSyMRmXE8tOoAW0/Ty+QhMLeKFo9U7KooBf9viCOAxxPvNzh6Hh?=
 =?us-ascii?Q?TJqBiLIcQPaF7qNOh/VrKs8hkP4prFfRjfeZ1H2XMpstW4XqpWyvrxIznSfp?=
 =?us-ascii?Q?Ef9InnXsvHd92vnNvUk7GroLrnExrl4AtFE3CkvrEYO+ekaxEazU+qE9zFkg?=
 =?us-ascii?Q?qOzuUxpk7559Vuu74SSb0mh/HqTD9Vtq2TuAtqhmauvTd9C4omZbsUhtqjzP?=
 =?us-ascii?Q?mUhc3RDdUg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 5536bc2f-62c3-4893-0111-08de67e719ef
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 14:25:40.3768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yeL4mgQt/o5uYO3d/UAk7RVQB1Kn0im4CU+3O8mWEkM1MGYbdgwcA4hONd29GsQ9OR60OZ5xlWqy/jeMXRGP+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB1012
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 14:25:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230804

From: Amaury Couderc <amaury.couderc@est.tech>

Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |  1 +
 .../avahi/files/CVE-2025-68471.patch          | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-68471.pa=
tch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-co=
nnectivity/avahi/avahi_0.8.bb
index 4efb29a7d3..6c58613475 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -39,6 +39,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/avahi-${P=
V}.tar.gz \
            file://CVE-2024-52615.patch \
            file://CVE-2025-68276.patch \
            file://CVE-2025-68468.patch \
+           file://CVE-2025-68471.patch \
            "
=20
 GITHUB_BASE_URI =3D "https://github.com/avahi/avahi/releases/"
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2025-68471.patch b/m=
eta/recipes-connectivity/avahi/files/CVE-2025-68471.patch
new file mode 100644
index 0000000000..210565cdd6
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2025-68471.patch
@@ -0,0 +1,36 @@
+From 4e84c1d6eb2f54d1643bd7ce62817c722ca36d25 Mon Sep 17 00:00:00 2001
+From: Hugo Muis <198191869+friendlyhugo@users.noreply.github.com>
+Date: Sun, 2 Mar 2025 18:06:24 +0100
+Subject: [PATCH] core: fix DoS bug by changing assert to return
+
+Closes https://github.com/avahi/avahi/issues/678
+
+CVE: CVE-2025-68471
+
+Upstream-Status: Backport
+[https://github.com/avahi/avahi/commit/9c6eb53bf2e290aed84b1f207e3ce35c54c=
c0aa1]
+
+Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
+---
+ avahi-core/browse.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/avahi-core/browse.c b/avahi-core/browse.c
+index 2941e57..86e4432 100644
+--- a/avahi-core/browse.c
++++ b/avahi-core/browse.c
+@@ -320,7 +320,10 @@ static int lookup_start(AvahiSRBLookup *l) {
+     assert(l);
+=20
+     assert(!(l->flags & AVAHI_LOOKUP_USE_WIDE_AREA) !=3D !(l->flags & AVA=
HI_LOOKUP_USE_MULTICAST));
+-    assert(!l->wide_area && !l->multicast);
++    if (l->wide_area || l->multicast) {
++        /* Avoid starting a duplicate lookup */
++        return 0;
++    }
+=20
+     if (l->flags & AVAHI_LOOKUP_USE_WIDE_AREA) {
+=20
+--=20
+2.43.0
+
--=20
2.52.0


