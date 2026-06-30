Return-Path: <roland.kovacs@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C724DC43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 13:04:12 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.16])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20927.1782824643216728830
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 06:04:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=hdOb+4gj;
 spf=pass (domain: est.tech, ip: 40.107.130.16, mailfrom: roland.kovacs@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BvGgT7pfOCWE61U0zRQh2cGMLjPDdxcclEMUd/EHv8Lh+iQbnDajL7CsEKb3rFgXXD0ow7HwEiSgJi7r4vEhsx2/fnfCjC2GHoarLzRdx2J4tE5zpMArlynK/5/1dwh7TGWoc0K1+gz5pXxrC4Wr9dUl3sx7QoOuqKAVMvPFCdkh5g5Y9gJ5MatsIuB89gRrwWOj/+oVfP44LdRIfTuPUxxVhWURefM2BAM9GOBS8+r+VL9LFTv9AI/azWtpm5H8YbMvPFXC88vAY7fpVRSa1OALfU8ubY/SYEgkJXKYWfe/qQay7nfzn5iH7R07Qw1rqPfOBEqjw/mSJgSZz/JHqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kcZ/inU3/87J5eBcdjB0iBgsJ0YuaZSh9haFjtchX00=;
 b=eSrmaA0aJqS6N3QTSz5HE97KsnAvX5EGz9sXjpvIkh65LiuJn2ISjkd83qTe9AIUAJd/r6dk9uiZa4HtUIwP7ZbvZUTYsCEyV0fKitxVU+qAx9egAZVKYcssZOCHdQ1yX/8Xt3+UAFV+a7N6OjQScNoQ5X5+Hh6Nokk3kyuPZqOtytqPemWgXHQIAJWnrb9c/fJVez+lgZU6rkjjNWen2jz81zxSeDj/U1d7vepRLTyUhcKM/dDEM8nAnrC8yw7aFutZouVs/8m93tQswa+vLurMODHIta+GNWg86xwv68CCoB9wurrkDzGsz+7osZ+GKYsmkhZOZRAZI/xpwTFrDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kcZ/inU3/87J5eBcdjB0iBgsJ0YuaZSh9haFjtchX00=;
 b=hdOb+4gjnvKOFyotNuE6oXQg4PXC5/YGj4fOuyD8OS8ooZpMDn+3KFJ/1wz4daTSW7O1LqqsTRY0ZRgFfybOgyV4ZI5qal3Kfmv7H5Yhyb9aBl29jKCAGM9Pl4H1hMTdQYLXJwtFW7qXocEp8nXpfkVH6YFge0ewHjlTJ6bRaHMGxpMlw2h3ZBuGAU5OKT9Iw974FpnY6EJwmeKtF0rrwD+xgkY/9ix6L0tmS33eniakJYAdVpaA3Tpbfgwue7YlnJZfmN6fmU4OgK1ifGRipR8tTLWiyAAgH2kY+cFszSAEuiYisjJu7fZLzWCLqzGkXVII3391Y2cHEgxJO/MBFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:111::20)
 by PAWP189MB2777.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:46a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 13:03:59 +0000
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::ab4f:3151:4330:625d]) by AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::ab4f:3151:4330:625d%5]) with mapi id 15.21.0181.008; Tue, 30 Jun 2026
 13:03:59 +0000
From: Roland Kovacs <roland.kovacs@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH 0/2] gnupg update and fix outstanding CVE
Date: Tue, 30 Jun 2026 15:03:56 +0200
Message-ID: <20260630130358.71091-1-roland.kovacs@est.tech>
X-Mailer: git-send-email 2.54.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0247.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::6) To AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:111::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB0725:EE_|PAWP189MB2777:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ba6d2ce-0d4e-4515-eaa4-08ded6a80cf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	hx+ovKAcoeL+iJ4zd/lKf5jgvB0fP4WQIM4a6FF16KxzZLrVeDlyKlcyzBnW7OGwIyy/az41ulloMPgI/SvMObTOwmGp/zrfxuoZ9EZ0ZC/gm8VbLX7JtxZFIPlmF3+KhVc8rSXFQ3O83ty09JUB9Cks38s0/7tWrwclbWINoBq2/FfJSvl4LT/BULD9lXiMkbqyTLN61/VgmS8PEL65SgVO6Gtcm21XlDOJu2SsvMsmJ7ndRl77MV73WbosVUJQCVEgzseZFgl44jEjEDVcd3wzL+DkMYVaDhxV9w3HSNHMRMQ8aRsi5qgEjzUj2WeFf1oi6wWHU0E49K+D9N/XB8aqL6a1u2KPJ6loZR6G70as9xIqQnwf+OSSDW8k0ZEIHoqs9wDu8PyAIhnGNyM7gPK+vGXAa7OsqXTo8sVceEqUcydPVRraqiU1KdDGQGAiKkUD9pQQ/ntZzyYgkomaJz2/YnA60ua+xnIf6NtwV3eNLJsnx643s1XBJPaOTGWIog0PLjkUfjjwssOqTjV9iPTGHXT///r8yzxPiq1hB21Of5HfiF7cTd4CAb3OvzqaNFJpwiGdMbDRieY8gvL4wxEKKhsbrwA3na/LrQMr78GOhlT8p1HfLIyJ7K2TMcxTmBSgCMmEcihO54c0NgnfPz+E0q8RP9CehrJaaSsAZHk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB0725.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XE+oHa85DntOnyNpP4eVPpmySlZ0bLVylcUSi5jJbAJ02hYSxW4M7stsbAa3?=
 =?us-ascii?Q?7N/j3vceizA5XQkczHMUCZGqGdefn+iIBiedleAth7NGtUpT4fJ12TTZt2cx?=
 =?us-ascii?Q?20mDqsnYmsf8euzkPdDcbyzNXN3jOxH8T1xXwd7W6KtbtUL6cv7QAoI5sXsn?=
 =?us-ascii?Q?g45Bgwv5MPFulgKr1YEV5fgy0QuAYxSjxDUuU8uYb8quv66jGCsFI2xvKnDH?=
 =?us-ascii?Q?hzlMhPrTwFhfZpTHTRfCXBku1anptcei/TjEbl/TOLUyMyYJB9aL/ARfNeP4?=
 =?us-ascii?Q?Y3Ldy1iAvJXl0Yl3V5q6+NsUFUl+pVEcJMalxpHKjmDUjppfPsTFD6ecr+/S?=
 =?us-ascii?Q?emxw0CPhKrabOoCnn8Ir8/dQQH97m6u6mLIxkxey3pxxrfg1AAAJetSVNxcq?=
 =?us-ascii?Q?0WsuGBRd7ZnLw1JWSzqEyJ7Zc6PrOMWBUMgXxIeYqoe3DK+JCqiMTB5rsEYK?=
 =?us-ascii?Q?yD97brAAr+DA5ctdF7ZGTpD00tbZOem16j2sGukdPHYl71Jj/DA4gpqDDISu?=
 =?us-ascii?Q?fJtv2lVqLMlowLs/+eATIUXBur47ufcYYOP8P0Ao5d0CoT0nDaIQhVv3iho2?=
 =?us-ascii?Q?ilUBz7sUFGiBg1OaRdpq2xQqWbJ4TVVH46uDfP9F0DXpvhE0VCvhj147k2DG?=
 =?us-ascii?Q?85K0jJ2vPb9SnWzNwNReQAjHXsAlgtm1IFTN30+UlhIyRbpzeEHteVWi82RW?=
 =?us-ascii?Q?m9GDZDJwn4wE5S02jUNp9s4OcXaWwpfWnx+5aFwJ43uXq0YklC6fhwGi8IxX?=
 =?us-ascii?Q?e9xcj7pZOBU2iCOOe4Akhuo8I70GFRO+RDC5yIVjZgPmP2lKWAqE6alDrEwy?=
 =?us-ascii?Q?E8OIwEOBsYc2QhAo1f7V9JO262THaN5eH7SVz2gIW945l4Uz2oXbcXX+DFrD?=
 =?us-ascii?Q?4V6rFGl8UBzSjK/6IKGhivtESrDQjYeOQaA429GOLln4ZXxRczFgABlmukhw?=
 =?us-ascii?Q?wrtdVOhgwg9abn/h/8l1oZ28M7rfxW6MH35OAFOq09HitwU2/8Izv5QgxL3m?=
 =?us-ascii?Q?7kwHiGdnDC87RoP/BpPEoHvG6Q4fx4WQDjJ5vW3zCCn6FxjFzMgdSHnzw+Ks?=
 =?us-ascii?Q?0jo0VLGsMKfKENOklA5MnFTDLCMAm1pi7zejVnQRb7HVMZvCMto96hHBCJMn?=
 =?us-ascii?Q?PZG4cPSKWeSq77wr576K+opaeVVeHXtMdCNxomIASGBjelapZj3v5/dirgH/?=
 =?us-ascii?Q?LLM060dew5xewoh21eKy7JXipqS8bEvyV70m7aZYh5o232TrWH87xoERCtMc?=
 =?us-ascii?Q?41LBkhH9P35LmrmWZ73ptmNQN8LmRrfQMrVUX+DNOn/vFac8ez7dQaTaVXkm?=
 =?us-ascii?Q?IJLrW6Z529MDltGEM4RvA21qAtkuHNtNgtMQLfR/WOUQdlweR+uATUOP1eyB?=
 =?us-ascii?Q?s6ckgS1jM0J9+5QLOy0Q629x6xCrf5KxGkN7McO/f3bDna3RzFDFLFI+1Bqu?=
 =?us-ascii?Q?HFJW0KKTCwyCoWmJj30p6/UwofMXTm9tv9MQIICdriUEYEIM9G5LwWVXDCQO?=
 =?us-ascii?Q?4FU4lTZshU38e4dRiggQ3DytzaX2ssQlfN0MyEcK4uVMSUIXjmliQ6SLm64t?=
 =?us-ascii?Q?ET9LaYqrEaVSCsV07JjKkMAhgAGmK1TY1qMOsODkOvgm1sR5lK/rkRJG5ISW?=
 =?us-ascii?Q?ZnHD6e/wuf6dcRBe9HNu2BRRxcVUIuZldWiRfM//WGYKO/X3Nr3VBIRFEHWL?=
 =?us-ascii?Q?gFQwmTVmBzT/oSEc7c5nTAPzbYXlXtiYubFsfBIptDcb+J3mV2YX2BHKzA95?=
 =?us-ascii?Q?BwbNSvKh/g=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ba6d2ce-0d4e-4515-eaa4-08ded6a80cf4
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 13:03:59.4010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uNLXmNpzQk6nVbZt8YyUB6caXpdwS8d89quigrbPLGMXZsRf73PIo2LcAQpmMjTA11EdlX6OJvjCSusOoVGqMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP189MB2777
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 13:04:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239891

In order to squash multiple smaller bugs, bump from version 2.5.17->2.5.20,
however that does not resolve CVE-2026-57062, so it is backported from gnup=
g
master.

Roland Kovacs (2):
  gnupg: Upgrade 2.5.17 -> 2.5.20
  gnupg: fix CVE-2026-57062

 .../gnupg/gnupg/CVE-2026-57062.patch          | 43 +++++++++++++++++++
 .../{gnupg_2.5.17.bb =3D> gnupg_2.5.20.bb}      |  4 +-
 2 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2026-57062.patch
 rename meta/recipes-support/gnupg/{gnupg_2.5.17.bb =3D> gnupg_2.5.20.bb} (=
94%)

--=20
2.34.1


