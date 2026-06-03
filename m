Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C619ACD6E4A
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 13:04:09 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16878.1780483105778467759
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2026 03:38:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=GNtlldZX;
 spf=pass (domain: est.tech, ip: 52.101.66.43, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wn95+E2JkvEoZSQ+fLIqBWgzoCktUqHUX+JzI66jUQYxEBJz8SALp0KZxYCsIxjce6PzmEc8xvptqyjHW7M+H0sPOR4DhRYRKmGHKpeBPUfjkcbQRTFknwuaCJe/SuTGQXdXI+IaizPKOFnt0zzKcOTmQbqz9hCSg7EqMqMbku1U5yER9dcsvbhAJXf3peooA4+fpGDWuEFjvstlJzLammuO5PAK4Pr+51QsiL1BwUEoAVjmtOS36vJ1kCMH0o/UnrQFOiSRi0i1qdaJNAtD3zbS3nRuy/igWnxODv67V7xFGW58KMvLsQIs89GQtVHb1JkqE2M7tsa4Om2wRyjdTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=98Paq8naMsJnyCOtfi1v/ThHZoou8eJtcfzVSbFgGOs=;
 b=k3CTcKLPQUeqCK2TbDf+dCACzNbMUz3OJ/o1rgT8AgY2CuGFM6NMYm0uLVC4LCIH/Z6F8xm3OhhcEKmHfl1DoVcKpiC6/yF6HBYtbgK1aWk5nckH5aFKiBAxb6/LdV5EGemoWbhlAR5qEuNGhULdfri59vCUwXbZQS04xyPJXsNchWAFLQ4QDwVFADCOny/lle5UumZh9qMHm8C0VAA+4YLzGHvg1pABM1HLoqfec6qHwbpe3gKAxzh0wEGtOnmT2WtTMZ3xjNROsHGu3UBWqNeO/jWAL3J70l4P5PuIlJmK3pTzrvvFDlhu5/Wk1iJMb+HjWJpJd1o7Lg2FRhEhVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=98Paq8naMsJnyCOtfi1v/ThHZoou8eJtcfzVSbFgGOs=;
 b=GNtlldZX5kfpbqdb/KEhmOfXof6XHSeRxQa9bJQLvvTfFRZ/JdLqun+wIc130R4sZiymL2COkqG5MmB4VG5HygISINFn6CxbNDCS5hzay55VqaMJwpMyn0+NnPtWGH/o5n1HDwcj6gq++RTKlFQbROnPOgqXDj3G3OHgFckNgHPRLhtLd8l1Rnbc9jvkBo2wbl0NfvGFhkiTZ+IqxP/uhmKIErV1SQGduFyCWbkHC4raM/TiFcM2uWhfdoh6cglolCmaurhxX0AHR7OWE5yL9tre2UQrtk0XJcsqe4l9GX5aqmFp6eqjRvKTnSGPX+nUfv3ULwaKSes/JYi9YmS8xw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by AM8P189MB1236.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:246::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 10:38:19 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%6]) with mapi id 15.21.0071.015; Wed, 3 Jun 2026
 10:38:19 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [OE-core][scarthgap][PATCH] python3: CVE-2026-3087 not applicable
Date: Wed,  3 Jun 2026 12:38:11 +0200
Message-ID: <20260603103815.868117-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: DUZPR01CA0280.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::26) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|AM8P189MB1236:EE_
X-MS-Office365-Filtering-Correlation-Id: 193aa0d5-f695-495c-eea0-08dec15c3a1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|56012099006|11063799006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	p4y0btA55SOnRnQnb5Q1/PSSKLD+0z5NoRwN4x2IopSR8EGy2eJl0a600Swotn8RY5E4dWcu72S9remSGS5/mGikbOn9PgDkzznhKE77kXb/lQIl91+King6YEa3Yw29fO97IFCKiy7ey/a7Id5qmd5yfDbM4sWtZmHZBkMbz+SzRjlOHYTVmPH0tpTw85IP8cOYFlRdPrTgqhPSspRxtWHJBRr5ctdziwBPSUqx2G0TRonqTi5wk+lee9VqQevzhdM+Pw1KJ6yRAdhLuOIRAVqUPYym7SP6ERZw+ZVw1MrZ+iqlCcldfQ2Ph0h0y65k0o2GALycAi16/zTv4ohm8BsTBIfHgHLejlybniccucOCi6MAE9Vf+ItO3vWlBOQJg5C3bwvyLtreAiVj9XhuEmIvqUxuo2Mx6wywv/suIorjJrffLltOuC8GuigSOVv5RB1765AIjYAcWSj0FlhvAMUhNg8yHMcOsh7MandLJR9/O3ykGZy18N9YyoARMs9Nihrmd5RvH1713UNDjOOnvH4IOV0v4auG4XbqkmIjeLQB0ZUpsQ4ZVBDNjUFi5Iqk0N7HN26QfpEBcJjv/K+dvsA/W8+YCriDNFBCg/ZKGJ2d1JhgCULrj7ywnsQK+0TlgNYFfiK2jbf/ep3c//Hthw6uhQlwygsTsBdGlmPAMs+AxIQmQWKp7R7oVq1Z8vGBJGLneCzuVXm++RrSx0rg0w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099006)(11063799006)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VvLYG2yIcP5aVT0PAAUS2fKpHrsgoc9BF8F68wHClYR1RmC7wgCeqBD3FA3i?=
 =?us-ascii?Q?Rn2xvw01ok7TdLW8y14b/uQkoOR0lrejyq5P1eMmgeqGE/krGHtdm8Zk3DaY?=
 =?us-ascii?Q?H/c0z7YpEzHw4xcSdk9NLhV0GHsBkHpMyWlADmZ1ytNCPhLjGJh5WQXGBMBr?=
 =?us-ascii?Q?y5eTr7nJ9GRWNHo7I1ptx0KhOlaQiTqbgMckXXy7OdwJHGNVl64hxN0hQwR/?=
 =?us-ascii?Q?VwFSltZaeeB/hh6oSSuxhcVYHWfmFLSMonmKDyaG6XQAnEKotEFdJ5o7N3RH?=
 =?us-ascii?Q?IjKDOdK62IcwRy7mRk04wbZ3myEvvhtJFqbb16g95I1ZIvTO1qbXgx0Hyou0?=
 =?us-ascii?Q?rSI2ArNZINhJ1SpbFIxBZiJIsaqvsaIvo7pCeT05LR1iWLw7WfIGFbUJOnbN?=
 =?us-ascii?Q?uSoGA8cwluVDtpseHUaoIXjS1kuLlzjy53H8u3/v2by4Jxp3CZPrc3r3cz+k?=
 =?us-ascii?Q?uZleyQ6jAMNaauHBDjB5UwchS+Ai83TwBaqTqx4qzT7qvhnKshc9eKCyBVUc?=
 =?us-ascii?Q?gu6/BYDkcDk0+SwjtkkfsCLqhaFxlFgUDhKXT1zcXUIXf0WNPt2IqBUsNcny?=
 =?us-ascii?Q?RmVMnOGZ+GhCzLr5xKUxjiAblQejlkLTnwIC4fmGIQYm0x14+IgNQhqD0Epj?=
 =?us-ascii?Q?5J3M56F6Y/EFPMcqVy03gZ389Lb5E/wvqpYMvyrdEbCHZfkxrykapDgRC8l8?=
 =?us-ascii?Q?tvUumxOa/rDLMIOQgWuHY27KnmMmOYcBPN2lvD4M5c+RY18ZV1qVtnv1+DjP?=
 =?us-ascii?Q?g7N4n58aDbBA2osGLZJ/umiv82H77sj4r2sm/HqkbZ795fwj5bBnAIKb4fK7?=
 =?us-ascii?Q?FnyR1aAjGeAuTM7sMMz6g5bQBoh19pqpET/Gx54UpaqkI1uVHth6pX5EwOKq?=
 =?us-ascii?Q?frul0/1Bp0o1rDLsZ7HK8km2evwYVAqBImJ174SALkLzjKdjQlIFRKUb9rUL?=
 =?us-ascii?Q?FB8WUbD2QjdoRHjMLQNytepFf2oJaQzbbYmqTlhriax2iym46PC7xTm+PcOm?=
 =?us-ascii?Q?04sqn0IGGnhwDoPFcAEmL9x+OoMO+aiZRwZBPutRt2KEyKXlNkW9t6sl0+sw?=
 =?us-ascii?Q?R2BicATwJ1FotCe0DKLmPcwWhCExTu1bEz8LYDUkvEIkb9HoVElDoodCbYop?=
 =?us-ascii?Q?nRFDLkXHje/zc86eqLF7Rcvo/g7qUoiPqtCT6bHzqzfTq5asWuc4SP/Rr82Z?=
 =?us-ascii?Q?lXiEKUi78QDCx6RgOgdOpAXX1TRcOpb5T+8VMWo81yxxj6lZ/f5BDMaRPyYt?=
 =?us-ascii?Q?Kr0CUnT+LDGRHadtZDDLgdmZz8qgi9V18xrmpN8XU92R/TB/bReIIrZ/3vMZ?=
 =?us-ascii?Q?yY2H9ySuRN18ppXd1KSxpBh29gh9O5M+M7AaqC2VYLFnno9nJ+BHciJj9kCx?=
 =?us-ascii?Q?lh3+LQunXFJ86+MyPaFHl0SRP4dDWtsyOI/HV4thDJRPfHrTsk+P0KJq38du?=
 =?us-ascii?Q?52uKfPynN0wNT9FciGXaiot+anW8IhnMUWCE4mctkxDkDWK5rjX5sdcfIN4J?=
 =?us-ascii?Q?0v4iYmDYSReaXDOeNq/F6Q4NlwzVaFe1MkhVboGkp+3v9RO9v2Tu4DXlWb3x?=
 =?us-ascii?Q?xsUYPNH7kwcas5zFFJ80yOVTMZNuaGhA05BGr+rOIm3cFZ/cxMcM/zq9pu/V?=
 =?us-ascii?Q?40hArhuVfOsA4yJPaaMReVgLfaPEPeDHXjYueRfyqZvPMF6bORILb9OYFkhU?=
 =?us-ascii?Q?6smEJxzpQ7q2M5+yow85XY0LjASXx0XP3GDRilIYaIpx8UvAcy8Y3iTT3qwQ?=
 =?us-ascii?Q?uwDm1pbJecfrAHL+VbjBvbSD+3dBRpw=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 193aa0d5-f695-495c-eea0-08dec15c3a1b
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 10:38:19.0044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jGOPJYnkkYZah5T2akYSfn3tYV7XapQXXPv0tmmWJuC5GcybFFl3R7GS0tK2aPVmNlyrnx9RVACjpn3nDmO+jC9ja2Aux4EZH2Ei1UHq3i8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P189MB1236
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 13:04:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238096

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

CVE link: https://nvd.nist.gov/vuln/detail/CVE-2026-3087

The CVE is only applicable to Windows OS

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 meta/recipes-devtools/python/python3_3.12.13.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3_3.12.13.bb b/meta/recipes=
-devtools/python/python3_3.12.13.bb
index 5fa25235fe..5433345df8 100644
--- a/meta/recipes-devtools/python/python3_3.12.13.bb
+++ b/meta/recipes-devtools/python/python3_3.12.13.bb
@@ -54,6 +54,7 @@ CVE_STATUS[CVE-2022-26488] =3D "not-applicable-platform: =
Issue only applies on Win
 # The module will be removed in the future and flaws documented.
 CVE_STATUS[CVE-2015-20107] =3D "upstream-wontfix: The mailcap module is in=
secure by design, so this can't be fixed in a meaningful way"
 CVE_STATUS[CVE-2023-36632] =3D "disputed: Not an issue, in fact expected b=
ehaviour"
+CVE_STATUS[CVE-2026-3087] =3D "not-applicable-platform: Issue only applies=
 on Windows"
=20
 PYTHON_MAJMIN =3D "3.12"
=20
--=20
2.34.1


