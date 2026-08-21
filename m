Return-Path: <roland.kovacs@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71E26C5DF87
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 09:31:08 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.1])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3874.1787304659899800381
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 02:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=ACRpM9dY;
 spf=pass (domain: est.tech, ip: 52.101.70.1, mailfrom: roland.kovacs@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ctULn6Q6EGHPrj5yQ2qV69H+28KkbYWebSH2t3DaguHGWkbYPJopakqkJ4Vsiq3NC7tlVHOa3g8SAZ9zIbiYrqYi8QLe1fWeagJ546/52KckZLxOdYSceQtTJt4tBPz9P1xJHEa+gwCHGM0Qz61Q3ovfHW+EaGNnamuX/M0AXnzvjt/F0b0tIbPCmDiKqL4wIPc2ysZBorkZCnx4LLgnqV4SQn+Dv6LQ26rcBxW8llO1vDDffCaD9hEZKvVJkrBgeJDiU6WToEZI6TungK+XK4DSy4hhlEkJdkyeX44KRKsNCRebglciP+nqiWFkI1fLkwky3FPP65U6tJqTP699nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NCUyoK9mgO85pRb1vONrA2k7fhBVrtfjlnOLnoT4sFc=;
 b=PXl4xkA5sDDy5zrpQ0FPvtijvqTErQHnfwYcFvK0Xcc8ij+tDPDLMaIZgv/kybMQ97rUe5kfftiQrhBSaWUK7BCqWKJ67SCqgR8vagrIQmSHrv136yPo2wJ/hNIza6jbc4YZmxMjTm6n9HwT4fGH2ljorv+dJ6S5lCIBPxDo5d6g85v5pJSChQzI4DJOuNLCT47TcleUogjYsI2g8X62PBNo/1xMJqnaRJRZhsA3fAcYDHsPPF/BMomxmJPwqH99jsxqW/eE12dWV2l+cIY8SbhEKUiW6efRgIxXvi1SnT4B/6FGUw0ySKmea5ih4jGwuHVhr+e5qn1oxEORlw/pgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NCUyoK9mgO85pRb1vONrA2k7fhBVrtfjlnOLnoT4sFc=;
 b=ACRpM9dYDsyDUk5+JwMdDcXgLeNCouFeLsGkmire7vd+f43mZ8LfdMlh3lDjrUKaxVbfZHL1VSpYc4cwz+LRig9C6/Fdt2LtKyV0BlvKYmb8E/rQEeIXp7umwBF3m52OPgXfJ5vB4jnn3S8wBrpP1BzcXny2gA4HCLRKi7O/q+PPLoy66944GMxlnS1b5RIwV5nnM39CUEpAwOYZZUZ+aioOBfr+2FJMB96QeSpbCiA8+hdVveBdCde5eHtTpzdvDixokbTDbgydWXaho4eByv5CrSxzMp9t7/vGxfnZuGnLMEXtd9h/dd/wBLCbSz4RboSDJKtjfpOnz4duRDjmUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:111::20)
 by VI0P189MB3287.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2b6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.3; Fri, 21 Aug
 2026 09:30:54 +0000
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::ab4f:3151:4330:625d]) by AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::ab4f:3151:4330:625d%5]) with mapi id 15.21.0360.003; Fri, 21 Aug 2026
 09:30:54 +0000
From: Roland Kovacs <roland.kovacs@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH v2] gnupg: Mark CVE-2025-68972 as upstream-wontfix
Date: Fri, 21 Aug 2026 11:30:52 +0200
Message-ID: <20260821093052.1174778-1-roland.kovacs@est.tech>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2P251CA0022.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:10:230::20) To AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:111::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB0725:EE_|VI0P189MB3287:EE_
X-MS-Office365-Filtering-Correlation-Id: 21fbeb61-d344-449a-bd4e-08deff66e628
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|10067099003|11063799006|56012099006|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	xvicUe+BYnH4OqYO3Y7czLc3z6GpJMbAeK3VemzqlfDQi6+MPCSJnReat9g2WqtU4vbRFoa4XkmiYqTeOyPLMJ6M1vedjGRx0UYuNQY4g2fdUi5+MrjiHWCsXExYh4QEUyTeOj61B25jU6icgUBNQf/uHPNIYcCWf+zLyZ4319yYWbnvIvay1hg9oc6mFFZTXba0gujddowVjzzgadw+2EuYnpXvQ16/WQdXlaeFgX1HATSC5M45AWSwuJ5JdBLty4ZgdrM66qXQ6sX+9x9RmyR/cZhcZUDRCRaVblvC0+MBWAZkiz3U0WV+r06+Muhl8yYq0Fs6KUAM3NDKEh7kdiBtAm4L0dzMQyvXWFTzeHNiR1FHO939dubKaBbntQeiMu/kpkNTwT9/2BvomdVu/2m9E7agT4DOkgI/Vt6bvE8lFYmZN0QhlE1xJrMucCBG0d9VUw0t4JVksTEM1nc3gqrAorrebSCyYE4PsGJLPhgzTb50PIRoQctTgwBqbnynZqeQbpe3SUPBtPPfS03l0yK4kGEq3CjAANedzp4SI8K8EJvXDlCCsZoo59cqS1i7l6At6ms/AND3NnPt0BIQVSs3cRbSk8rADZVjwHPQbamvZ28jjYwJ2CIXqA08BP83
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB0725.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(11063799006)(56012099006)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ryh9UeTUD4HkOaCT1syGpV1OPnD/LOzaIk/kg5/asW2mBHlwdoKcES0oyIgF?=
 =?us-ascii?Q?evQh9WFUiEahf0AAFEkKiokFhVDRZhBLJCt7lGBhQpSJtScELaxLAKQdzvx6?=
 =?us-ascii?Q?E8dAsJ7TF3YE97kUgkgFtlWh/efNioiTUho0xPN6FLo9Cu1/ypt/K0CrlAqq?=
 =?us-ascii?Q?tcNSQ5ImhVE9FzcxMU4BKl6lOW57pnZY19gjT5w4wQiYV1SRxP65X51odqyZ?=
 =?us-ascii?Q?nyY96jiW9zY2HqwA7/zUikbtJ0BzecDpSxKiE0fX0IEPXPnUAVhMMzfJrqCF?=
 =?us-ascii?Q?grXDute+7oEQhg345cz/AiQZOzd1nzOFpQjYS9PGuZUz5pGmBfIMddCyf1sd?=
 =?us-ascii?Q?0RKWOBHS1Y421S47DU/toTTiv1lfelpNlDr5wgmomcd4gzqM+PdG94NMglJB?=
 =?us-ascii?Q?pFRcg/CEiTPU8+9ZJvm9bE+SYB8tROp4nPhDBPX2JM6JV1cgIgT0hgdyUtz9?=
 =?us-ascii?Q?ceEs8yPIa45XSUFQj//r67OYdyxT6qAM3avC8Maf5TQQb93vmicd/CT3nmWg?=
 =?us-ascii?Q?IOwlSYhyImHKv+GQqKLhleGdiCjVtbVnDip8TXUTJ/WTLjGgnlEfS3DZdpI/?=
 =?us-ascii?Q?+i2PjS6QmAlqRYeoAU6R0668fVHtxozfrQXA3q/eFbefNQJcytFi+SOTtlPs?=
 =?us-ascii?Q?4TJEGN/pQBqJcKvYfGkQfwDnKUgRrbvg9SdjHeLD5/l4JKX2VXux50xRexq5?=
 =?us-ascii?Q?nhGLBwcVffJxyyzHbzMKe2UjZrebsXfVtpTYXGG9Q0X2CT50EojM70J+Uvox?=
 =?us-ascii?Q?84ScyJzvH0lfXSnTPCwQpA1RhZx2LlmcqTifKaHUt8dLfcSHBfi/EV9ptdJL?=
 =?us-ascii?Q?joFf1OqLrhn39TVS55tqwN/6hr1bYUCzxb4jEjiziLCy/Xx/hNIXV/LPOvP+?=
 =?us-ascii?Q?oI2WH1bBc0C2DV5BWmhhrt6FKgK6USO3C1H0F9vTj2hb8MRmjfkaeIVO4lYK?=
 =?us-ascii?Q?CAOq0rzGrmugTQuIcnRg8VnF18ln0gVN8xCHbVxzQ2pS9fRcVVoRW/4Zom54?=
 =?us-ascii?Q?ZK1YPdILxVnrOMek9bB6D75kce9KvojmnggMnnvGtwm9CF+2wIgvM2HsoZG6?=
 =?us-ascii?Q?xT/66tb7BsJzxu1U5eES3lIrEPcNQ9Uk/uwthbyc+00yKh7/eiAXLpzjmPmr?=
 =?us-ascii?Q?dHlsTRJ3yuAPROrpOyf4kzX4p5Td6EUsXnVfxvGLY9er7owMyepuC3rSKjWS?=
 =?us-ascii?Q?bXJ4DPKFqX5rRdvVmRoBbsqCJFL+ACzBHienaJbIdaYGPhLYECIyCxEyESz9?=
 =?us-ascii?Q?tTQY4MIa1NxwR4JsK/iueVS2G/q96kcAkuFzTn/cPqz7jtanSY4ywmpisSa6?=
 =?us-ascii?Q?SUMDgDMRxH+z99oV67/HDosJg29Eerd88LsktwdRJ/f/dlCkrMnaFrVX90ik?=
 =?us-ascii?Q?QHs8e6PlOTxWqMsfKhBpdhctN08Zi12SdtFuOm2VG9sK7kwa7BIFYGktVNam?=
 =?us-ascii?Q?Eh3NYazGp0n9243jFvjf4lKw0gtEu+qncqTTk4pbwBRU5rVbQ0ihNFD0Dmk0?=
 =?us-ascii?Q?0b6duG7bmkU2uBIJNGxDXlo3rHvgauuCSGr1Mq/8rWls2mjf89jtwlTFGbb2?=
 =?us-ascii?Q?3uSy4poSUlA1ayhMz7HA951sFpSNjV1EHmgPiEbjN4xglKLS/kQfEQUkgKBI?=
 =?us-ascii?Q?uOZhmmVZ8gdZKe85P3oBL04kjuPVDDOKtTHGWvn3zjCBC2AfOouSo3bQX1Fr?=
 =?us-ascii?Q?6J1GLMxVOP5KvwvuMeD754l/ij5JYDOXgxyZoYGatOmo9Nvvc9l11j8WjFVk?=
 =?us-ascii?Q?uTPGvLUy0w=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 21fbeb61-d344-449a-bd4e-08deff66e628
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 09:30:54.7271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lVelpfeTENluikFTJXv1mXnqOf4Z4LGD+4C65Z3JVxYt2DR31wAd47Tt99yeDWNCimQXFxBewCJmZtT1FpPoQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3287
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 09:31:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243917

Mark CVE-2025-68972 as upstream-wontfix based on mailing list discussion,
where the maintainer states that "[...] this is wrong usage of a tool or so=
cial
engineering".

Link: https://lists.gnupg.org/pipermail/gnupg-devel/2026-January/036154.htm=
l

Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
---
v1: https://lists.openembedded.org/g/openembedded-core/message/243897
v1 -> v2:
	- Fix patchtest complaint about empty commit message.
 meta/recipes-support/gnupg/gnupg_2.4.9.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/gnupg/gnupg_2.4.9.bb b/meta/recipes-suppo=
rt/gnupg/gnupg_2.4.9.bb
index c85de6047f..3ebea399d7 100644
--- a/meta/recipes-support/gnupg/gnupg_2.4.9.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.4.9.bb
@@ -85,3 +85,4 @@ lcl_maybe_fortify:mipsarch =3D ""
=20
 CVE_STATUS[CVE-2022-3219] =3D "upstream-wontfix: Upstream doesn't seem to =
be keen on merging the proposed commit - https://dev.gnupg.org/T5993"
 CVE_STATUS[CVE-2025-30258] =3D "cpe-stable-backport: fir for this CVE was =
backported to version 2.4.8"
+CVE_STATUS[CVE-2025-68972] =3D "upstream-wontfix: Upstream considers this =
CVE invalid - https://lists.gnupg.org/pipermail/gnupg-devel/2026-January/03=
6154.html"
--=20
2.43.0


