Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E0A3CA5FA2
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 11:40:10 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55337.1790595604195884966
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 04:40:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=W/nIoYjq;
 spf=pass (domain: est.tech, ip: 52.101.84.67, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lIUOP9WgyMRJuHYie9ZESTR6gtmfDcHWKIC+NC5HMvB9AO4Nello606TZ4fu4qY4wzh+uOBWCEP3ka3qL+XslCPJF9KL7JuOGZNkNxGzYbFed3I8UxFmSqHGUbbFCl6rTNI/AbdTlJrVu9L6ufaC8lRFaEgNWEjtBNuD+TMcvzxlvh7zzpY3wyfSCkYq3bF+Vihfr3U31BPKTaZWN8tWcGFo3WEIm6bRwsyJVgGvKYKbSjts0JYVlH6UvtJDDTt1ShY7crzLSN9y++sHaghxH6yBmnbwEg/JsmZp7omAebE1lTLrnDAiGy9LVO44wmoDINRiMzdr0qm0saBbxhT7qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wz6dZILpWfqkNo9yLtvWKjLjeetkaqKdKCbov75JWo8=;
 b=OfmI0gMMMF0S/6jQJiz0wp02VUBnvWX4mji8o191o+ehOJfZ9wDwX1R8/1sGTM0XKObNt1AKlpMIS40FKD1WdE7hmYfMQhUTlW8JoIXuBGPuZqI2LWmC5jcL82aloyS7q1YTY6blv5gMOO9ubhQjUVewE7JJTf/8e1wQq8JrMUWS1aaNkQkbnBE7o/Tc/BadKAArwwGnGaOHICSpX2Za18QjmX78UUKkGoUDs3vG6vEK4uCk382N7UQBjqCztd7adtU7XlRl8WLv3ZJOS7z4KrOdhczSoQnyMDjUsaabr3kpM3KjdgSEZe/+a8EGKm+k8dvPEUSkO/uKKf1aVYnNwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wz6dZILpWfqkNo9yLtvWKjLjeetkaqKdKCbov75JWo8=;
 b=W/nIoYjqG9txXxeKpimIz0YLhChMOJzJ5rldf+8nQ7gm/puRZlPRqSKuN5YrgY7NvpmQJYkVzuK77haQBmH8P2J4V0MfDCPSoxQgEIlxXLB1D3VDlkye/+SQlpz1tH90rfzU2Jc14/qxEufIWn3FErI2mL/7+2socYtwYmDHYXMI4kdLj7pkHCPl1E5gQXoSVcKB+8JSbQnc1xd3+OQbW0NtiUm1hnGg1kgsOcZqcJ8Jg+BIfPwqMOA7jFWwh0Sc3Q+M2CxM96sf66zPc/KUqOkPvwGg9jEHvA8/GFr+Sito2lN2V9345BfbaOMIwp2W57XHqnSFypYNWx2RFewNqA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by VE1P189MB1053.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:162::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 11:40:00 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 11:40:00 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] systemd: Update HOMEPAGE
Date: Mon, 28 Sep 2026 13:39:55 +0200
Message-ID: <20260928113956.42485-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260928113956.42485-1-jaipaul.cheernam@est.tech>
References: <20260928113956.42485-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0534.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::19) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|VE1P189MB1053:EE_
X-MS-Office365-Filtering-Correlation-Id: 270274a7-6a58-4512-0a5f-08df1d553a83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	YIfsk8eJGZmdM4YdqZkeclJTeL5VQqQIwBvm4uEtQOgdp5Rpq87kZsMOmQGQspJayNXhSr7SSd6tNuDDGpGywVuu7AeJhSP7nfIxLiTAeEZASRL6N6eqB4ZKyDfQ2JY0PcvyxsMiR//ktt+Ps94yM6hZRh5HUspnYHc0wTyzO2jsOk5EiffUzVt92/FjutNNvrtkQVmmVOnEWpmLyRz2hr/XzT9yCgimA6WmPgJRL4hm+HECKlK7n915JV1FbsP40F5M7z3me0OSay/bRIR1Gy7eLHyW6PvW2IicUSm13qG4EOVY4juNJ01HZL0WCV6FrHfZg489t0ZzzQZfkQ/7mRg8b+iZ3HGQIFmcEBxmO5y93f5FNdoNdCEUQzmakLl5GK2elhwIifojfeSrpuY4F3ptcnTS+kWvprp6SF1zq/pBaelyILAHlnh/eYtsmC7XkFpbbwpQR3MWCye8F7bfWhkRaXdPIx9bo72pw99lx656SYo7CNormoQ7dfUyEWSbP1NGOj8chmT4w8viGmt/LcDUF0Jfj/2erInvhACsOt5EAZx8/hJb+W79Shpqda5jUm7DOJoTSC+lj39NKjpu+cObLtGrWoXtXGkK0d+Gd/Y=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jwLRJDGkh+Hohmzxlery4YqphU/6NFf4uYc/cVBEy7KWBFkxUJr0knP/PHjM?=
 =?us-ascii?Q?O7rMCHJXl09AKIIJd+LYaN87mgTMVu48A+gE/gtFwOHPsYUS54m1nTz74jBu?=
 =?us-ascii?Q?+zfg0r/8KJFKlHKsMozPkXPLbgqC8NKw+MyOBIwLndE8EFIsZrTJO6uINM3h?=
 =?us-ascii?Q?FE2yzYaUSsMZ8W+fAoUu81Llowc02vJxgNNXzFeH60Pk/CjhwZnQph35M1LS?=
 =?us-ascii?Q?yPXTn8vLTTclWbNWEPDLHKFHUhuUo+ZrgxfpMKM42ZJdlWB6CByBe+Tiamxv?=
 =?us-ascii?Q?9i1nunp+YVA9nx48x6YJgv+Gt1TZ0CAWHRSOkpdmuizEgZuVuYDSmZC6BfCF?=
 =?us-ascii?Q?raB1N7qdi20wcGYB6VsVlkGA4r7bNmE1ES+uODrO1eUq5qqktgYK7sOIYUpx?=
 =?us-ascii?Q?rIzLWmu2gymmj91KUpzDVmyxcqJrkKz24nrfv2quN78xPWA4Gmz/0rstaUVU?=
 =?us-ascii?Q?Jfs2gmbyUUVTay29ghjODxtXbR3m5dx6nMhDALicaoD3zdbOkRO+iEA0JVns?=
 =?us-ascii?Q?2VQ5M1e6k8du4hd1uP9Wl9myWTjSceIcMcr/eQOiFsw7U59NMjlyeDj8Y6gK?=
 =?us-ascii?Q?Ltk3n3D9ScJQi2a5GM0QL/WBIR0EMvm7Wxy83ZGTgtWXkgH8ee4mlxbM8DTc?=
 =?us-ascii?Q?U8/jj+fRC7ALNW+KsFi1l9cxf+fzYYF5y076woBWTbcThMX55Mu7CTLu8PoA?=
 =?us-ascii?Q?fYCwDJ0Muk16Yd7un7DLfBoRLyLHFgyAV/17HZAywjwKy/rYLQB6ZjBqO5Wq?=
 =?us-ascii?Q?hq909N2TWlmt7Pt+SazHdfEL+dWlYrNRL2/Ow9kuAUNnxV1D5JJ7v6WnfG3m?=
 =?us-ascii?Q?0VQfzyJtgGN/0sRvRHJXrVNI/HHfNXSVtjsnTQzufLIl6WCBcdWLxS/ufxzZ?=
 =?us-ascii?Q?pn3DT19kszs+TOirq4SETha2KzUbyghskE6ZIwVnkiQbtcIAToukT4xS13Ps?=
 =?us-ascii?Q?Z05WEp7Ap0gSKAApFxNxOLHye4iwCJFkvNp+hb03oGLlIXEfCeH/buR/aEzi?=
 =?us-ascii?Q?KgX/HfQNwUtNQeTyiEtEfYIu4h/lngHGobhFuByjaaFQ/8OUmEJCEv0xsZ8b?=
 =?us-ascii?Q?XIvFDeO1f8i00WF56sM9pgxAEVaUcu0HJZJ36/6KUlq31vn8ISk8DqA8xepZ?=
 =?us-ascii?Q?xJAtOO+xUstn5fjCeAsnGDgB7o+S11jvv3Vv476yoXVpyqnzYtDLlW85W2au?=
 =?us-ascii?Q?bZ8p9kzSZE3h1ilxZ5Ar30i25qunZwVltLfCEiI4u5Emfby25nxPZaFaR0ZM?=
 =?us-ascii?Q?XXMXfzOndR21syQyqpV0Os/CI9S+m5jvY8xvyV/fpt7/fFPQ8C461fWACUPB?=
 =?us-ascii?Q?iTLSEaWxn+iLaI9x79yXJeKLD+e53ufl2fh0IQbzOJ4EAmMOhVyxIi09Sjlo?=
 =?us-ascii?Q?FoXNCzhVdJ4ksTJQGayivu6qr2VM6EmI1Xfr5uuwuDPvGXHNwJEPJ37/zcWT?=
 =?us-ascii?Q?65hsYBJdLJR9G4K7YG/9JO7Ex0oyvGum6d1+51Mm83AXxw3A8S3XiXFecl8q?=
 =?us-ascii?Q?L73ZCQfrenU7Z86PGvyR0Zo3HgkUrMDdM8xJuhTRrih+8JtssgjVuPwwpFRB?=
 =?us-ascii?Q?JBxnc7LtDUQue4oA7qg8tXCHAqsqOZGCTi9zCZaItvlMZ2TpcfNr2fDkXQR6?=
 =?us-ascii?Q?LdjMJ7I0u7ZDrNQVuMGnMtIpXkPA0RA9GIgfd9vN1g3NvpsID+hfrqvRJEyB?=
 =?us-ascii?Q?HrgwxdtPr2ZEJZNy6a5apigY8FFswMpOtN5RP0vprTIgbZEYstH0fe3Rjr4G?=
 =?us-ascii?Q?Hbrf28jI3w=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 270274a7-6a58-4512-0a5f-08df1d553a83
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 11:40:00.1937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ux9DiyrcNocwq/+sT8ur6sxipBY2UJ9e1jSYIVtqDSVzGM34vGHlihlSi7GTcd/mba89UhLVB1x8JJRPtViMWbx9fPiP6/RslFvllbctX74=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1P189MB1053
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 11:40:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246756

- Previous homepage is obsoleted and replaced

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-core/systemd/systemd.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/syst=
emd/systemd.inc
index 5ea45a78b2d..d3760491f07 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -1,5 +1,5 @@
 SUMMARY =3D "A System and service manager"
-HOMEPAGE =3D "http://www.freedesktop.org/wiki/Software/systemd"
+HOMEPAGE =3D "https://systemd.io"
=20
 DESCRIPTION =3D "systemd is a system and service manager for Linux, compat=
ible with \
 SysV and LSB init scripts. systemd provides aggressive parallelization \

