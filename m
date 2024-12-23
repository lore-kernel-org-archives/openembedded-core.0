Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91335E7718F
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 20:05:26 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.77])
 by mx.groups.io with SMTP id smtpd.web11.20895.1734984317855565748
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Dec 2024 12:05:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=gn3uDwWg;
 spf=pass (domain: oss.nxp.com, ip: 40.107.247.77, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ccbeMsz1wvfUke/jvaNpsljbjhGCrzdbKeyKuBQA8snsExPHXrxs0HgR5an3Iq0Sk6V7uUsA+s/9TWUyfqWC1sJ5+eIRHbDqAA1NNXMpugLT4K1bqbaglDrb9tG3iGO+mXDolItAnP7XIYEOeynvCM0DMVVU5bJrgQU1R0PgVs6WvMVUPBVCqO5ecoic+CMqHC6Pag/76l+L+kL35Ck9s+eVoTKoHNhdoqiCP7LW3agUXIZYdt6hh3QJqjbfCo05u+D4i33CMe0nyiUEMbUtO2GHgiByDMm+YRMJ+6S7d5mGiGT7H+vmqV3+Co0e3w3bVxOl0lAS/H51syqrWWcmSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/wNdezoNmq2OIUMr7XEZfipMQUw4ZdNjGDErIF4pL8=;
 b=DeLWUWTpd4UAIHIT6I39+qkcdF6DK4tWd5dTT9K2wrNBFEqGbCLYzrxYsAbmIpeDmGMqNNO38sctBoV6eOhvQB5FoxZ29mF7i8zYvdfWg7pmNzBEy8gQyNiMngzrRBtfJDljwByZITkmXBt6OAUiMB6cdVDY1Zu//PSppSkYCuYjJNbhUHXcX/4WkZsz1zCWzwa9n7nfvECxQEr/If4gccql4Rc6n2LEA2gKxa6u0pDnjNB5Dgf0691ePJUkPVhEzgicVDEoP/IdG1NlHMZUc1BMPusURij9OJyfazltlZIt5UpywL6cxBpq9cPUZox5VwL9BK2k+sX1o6vwMKaDjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/wNdezoNmq2OIUMr7XEZfipMQUw4ZdNjGDErIF4pL8=;
 b=gn3uDwWgladPAaw4sWcf5neerc6psRy6T+1nArmoEm2FyFqLV4zu1d8mAeopes4ZnvGntB1TxNu0vVar4tetWS3dLKUvItXkx3o/PTRtfbDDGE+2a0hx5XAEbOsZVoD0Ot43RsgoMSHH6GN5uhPZ5Cozu+mwL65rlul5b9omQGUSFEQ/O+UF/nnwdQNrqf6w0VTfKWk1iXh3xQo3+abDf+ldvKSta9p0s1P7Kw1tYqGveVktQceBQvqeGDgU6xJiIXOntCwhozkgcVdaW8Uk1IvNl5UGmXbLCFalkuWYXUFC6r1zNymr89q2sOevhLBne9l6TgPocQwkBg3QA/bPBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by PAXPR04MB8157.eurprd04.prod.outlook.com (2603:10a6:102:1cf::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.19; Mon, 23 Dec
 2024 20:05:11 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%2]) with mapi id 15.20.8272.013; Mon, 23 Dec 2024
 20:05:11 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH v4 2/5] wayland-protocols: Remove inoperative packaging override
Date: Mon, 23 Dec 2024 14:04:53 -0600
Message-ID: <20241223200456.2504683-2-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241223200456.2504683-1-tom.hochstein@oss.nxp.com>
References: <20241223200456.2504683-1-tom.hochstein@oss.nxp.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0003.prod.exchangelabs.com (2603:10b6:a02:80::16)
 To PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|PAXPR04MB8157:EE_
X-MS-Office365-Filtering-Correlation-Id: 10863468-ee5a-4524-855e-08dd238d1b87
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?j79FKlKJgskGd2Jt004FGCdw71TDBsZ2gYSGCVOn8fAHMEncEYkmO7pYNPUC?=
 =?us-ascii?Q?Jna5ZQ9hCZ19AMSVFhA5/fse+qfZejyMLqXV2eMWWkgr7LmLuGLZ4wOWi3li?=
 =?us-ascii?Q?HKlo5g7AVlflqZDFVQ3PA6/+nkUefDPSrOe5IjcA8lpkHqzUMMkyjGC0kF19?=
 =?us-ascii?Q?trf5morB6BoZbMhDEjfIAemTY/a+7HaiQQTWk+KAe0GpqXQdgx+hmub++G9g?=
 =?us-ascii?Q?GKy0mVmEY9wYxJSe0xMke5hVAwu+aRFYh6iqaG+RW4EjxxC28HYnUHqpw/22?=
 =?us-ascii?Q?vo+OxOqC04rAoBoYVHAgvJ0xpPYRYNzNWi1K736l2/PdKw2y5O3Yr8OrsNss?=
 =?us-ascii?Q?a1L2MZD0cEJLvBZtFVEi2SAC9fXJCKEUhjVHKrPM5JKmx9LyoX2vNsobqSC0?=
 =?us-ascii?Q?+kijuie8pYMfcxlXGDmMfs/ljLBx3NsWXFd3630CAz8g8r8MTSUk2ubv2y4K?=
 =?us-ascii?Q?88hW2FA9PpTDYgUj5VTV2hn64qAAQ+HXY64l6o9uxdr1oVJgnbi9lO59mgCc?=
 =?us-ascii?Q?hX1XAwne+RTXqf1zWTd+akqmUDnKCfUPxJ2RMpeJTBJZ5TT5dE+TC9RPttfR?=
 =?us-ascii?Q?9qQJeOOQsaah8ZXdFBrQtAeTBJV3Qbi6Fn5eh1ty63aPXlLMtrV5SkIHhc3l?=
 =?us-ascii?Q?oKtNZHDxy0M9uIQ+bm9D5k+IdSvWsLUDrTsTolbCYRr+bIKh1I/j3blMtQn1?=
 =?us-ascii?Q?z+3yNtpi3vxcu5aLdE5h0aJ3eyFKyKJjB2rrf0caD0t3RYmufFqEt419MfBz?=
 =?us-ascii?Q?D0SaRKGx3FgJfczvJygaigZbzj1dFFwx2Pfxro9NJU/2cluelICg1kyp+jBE?=
 =?us-ascii?Q?ZL9DlN9xRbx1o5pijZpyRHb0o9+ZjeT/oTh9Qt9wqll2VBUA+PViJFOB7uGE?=
 =?us-ascii?Q?+t7oupCE9nnIA9rCuZwjnb8ra6xg5oKDKnbK4QVQUQ4/4zwLE1d0Ix/M2H5n?=
 =?us-ascii?Q?fhhxnLJmXSX9iYvw0Zn9loKtwZEkYisUX/OupMT1tc/LOJeS+tC6dEQ2mPy2?=
 =?us-ascii?Q?hLLRzpQptHqbEygFqD4LdR/C74/cPEbo/qMQdZVe5zatMKFCBddCOBj+aD8E?=
 =?us-ascii?Q?Eq25igUuTBi5czQUJNJcqP5MveoBNnqiYkb+nxOA5bzojZa6hsc04mgu3fb0?=
 =?us-ascii?Q?q6/cmA4eNDb0abpwBal+YHdztB39bU7SgPKJq96Fx+LosmtLlmbkP63o2qGC?=
 =?us-ascii?Q?45hhCF3vIHD1TIDPbcBFe9MUXBVXRMZe22xmPDeBwMRwq4ADC9f+3jae1m5Q?=
 =?us-ascii?Q?uufl7lr5hM+l6pyx37cJzs+a3hjLkshkhuieryvojTdIyFY1JxUPJEmMHAOP?=
 =?us-ascii?Q?tARzp26K/4p6FnrQXSKq53rnVltI76YnQvtzjtnj3Vm1SSbZauN4+tD0ApHk?=
 =?us-ascii?Q?5E25WHYWLyW1Sbb1jWbUYnTJBBFZHTmwK+r3iHDzfSCNd+jW9aYSJk5pZVey?=
 =?us-ascii?Q?9QHzkSfGMG+fOUueMY/S9BEfdtUfejRv?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VrNhAzUleZJfCPDgGAyZrOEsYE88CVYQGZ7A48jMYMH4MMZnbDfgD81E7hXV?=
 =?us-ascii?Q?DMSoQpJ/lPdfsI1qM00tkawi++5INvRW7O3Vi+Ui5xo8hNs1Yy7gWSSlp+fH?=
 =?us-ascii?Q?9MytrO7HdEKucttAUbqqlg7VJLqFTx4SrrtaRJMpdY4NvxMDm7/MobgBLfUn?=
 =?us-ascii?Q?5BD8U0WpxBn7KxwcGbsPqyHZDEGIX7ZvSDU6Er9LcGecGPTEtyZNVVyi4LWa?=
 =?us-ascii?Q?NiwmP0KHrjpZ2JyMd7zzvwEQosXloyR2MuPgeS0pdYTzznvzTZTb0BtmPPNa?=
 =?us-ascii?Q?/cx4+UbaPG/H1omkINQ/6AVPBrCL6NFWYk8rZjcrhieMsCdPnpedpKfD+uRw?=
 =?us-ascii?Q?ju4g4XwkdNGmOyYPspOu23JJWe9XbN5a/dCJKnqI7ZLHSHv7Eni1vyvVbNLZ?=
 =?us-ascii?Q?ZFtgJamkN+kqLuxVjTx8KAE6O42bM4VB003/3ll5VCzC1CeW65nCacBVoJLg?=
 =?us-ascii?Q?j2Uto5nPxl8+I8VgiRRPQORBFo3YPC46RKGbBRgjpKcL8LOV/1jUICcXdmlN?=
 =?us-ascii?Q?e6us3e0Qw1adttpUbYheCLjqRjm5keMCd7KG2uW9rU2CBe7bJaOlyfZOa+KW?=
 =?us-ascii?Q?b+K4Av025f+wawe61DD3XGXgTonN9nbVckhfZSMr1/65z7tAXqwdJHwJvIva?=
 =?us-ascii?Q?cTjChPAGT64OaLlVI4zY6nA8+eg226cfP/kOOzChFJXS22Fs1fOYnk8/Md9b?=
 =?us-ascii?Q?GeFfV+VSuBSH8ZfMnuB1ymcc0bKx87YsX3xNKE0BlVLp+IvB/WybqvyaA4Xp?=
 =?us-ascii?Q?7b9CSsbE5Uxu1aG9VikcrWCMeFJMokQnA0XqqD8cqJUoX/eYL3N6umNzbpSm?=
 =?us-ascii?Q?TR/p3FtYU+ZfAKhpD6sNIDBkGdrDW/FND4RnzZ7FOZLomx8QhdfNP6mlyM4B?=
 =?us-ascii?Q?lPMsu35/JLuaagOJuTLW5LboxX6WBwnyLxBSdc9mIalWaIXM9rU1Tf0VwoI7?=
 =?us-ascii?Q?QOxcrLQuRgQigy6xl6OLleCZ9L81f0sr+xIseYYtEHu14R2sueTzvsBbxOz9?=
 =?us-ascii?Q?DSLA71A8FKvyd0sDBoNAZXlN4CD37LozBMWHG9y/JYH52ajZr6GBBhuQ5BRa?=
 =?us-ascii?Q?obrxrxOX2r4W+ZO/mXES4/D376lTMiU+jKF0dg6DXmJSzetl/dWsrZwsQlOO?=
 =?us-ascii?Q?hs1Km+mA4902oNaSfHi4sW6Rcr/05MySuU2LU2AtSyRnvLb+nSmcrOuwhfC1?=
 =?us-ascii?Q?OWB9jC/UD2iGouKBUx52etKG+gcko9pEA+QGW0qBe2GebHZZnNXihkSuh9ac?=
 =?us-ascii?Q?E8IcKFrEqU06dY/C/zb8Pz9IZGTjJt9pl2Uo+70QpROu2AYJVRnJ+z6TT5F6?=
 =?us-ascii?Q?RYP8kwGg8+QM5HvaLLD76gSvDcxl30X4FaI81biZ2XxxGT/wrYKWcDTcCEXP?=
 =?us-ascii?Q?MnabkLIo9WMcOyY6bZ0G8mLMqL9bDn7N3zuwHKRQANM5kF04lJ5TsMxDFEEv?=
 =?us-ascii?Q?mMWBrE1tpKX56dX1hpzDtbSIVxyqXrpXGWl7oAjhnGfZIK0e4peaOn4nawoC?=
 =?us-ascii?Q?B3UPj/Ce104CXeKssRYFvx7IhHRzDZVqSaByD9kbHuc2fg9TIDePTsjG38sr?=
 =?us-ascii?Q?o2vuU1AigZ+weS9HMT71a2TXdQ0NKeQDvBDjPUFA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10863468-ee5a-4524-855e-08dd238d1b87
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 20:05:11.8778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7SrmNmH2NWDExS512vyNO9WgYosAz6FhydnHjP7lEo50Cie8sS/YHyIPRP50T+YDylAjahOe/W4oiWBQxhIj0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8157
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 20:05:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209049

The upgrade to 1.38 re-enables the dev package [1]. With the dev
package enabled, the file wayland-protocol.pc is filtered by default
into the dev package, and the override adding it to the main package
does nothing and is not needed.

[1] https://github.com/openembedded/openembedded-core/commit/5de187aee675a7=
8fe59620a3fb64a5da5ae662aa

Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 meta/recipes-graphics/wayland/wayland-protocols_1.38.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb b/meta=
/recipes-graphics/wayland/wayland-protocols_1.38.bb
index 3e628ab113..be6b732b1a 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb
@@ -21,7 +21,5 @@ inherit meson pkgconfig allarch
=20
 EXTRA_OEMESON +=3D "-Dtests=3Dfalse"
=20
-FILES:${PN} +=3D "${datadir}/pkgconfig/wayland-protocols.pc"
-
 BBCLASSEXTEND =3D "native nativesdk"
=20
--=20
2.34.1


