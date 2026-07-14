Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CBD9C44501
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 06:39:44 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.92])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6949.1784183974309574002
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 23:39:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=qJ3Z93uW;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=qJ3Z93uW;
 spf=pass (domain: navimatix.de, ip: 52.101.84.92, mailfrom: joerg.sommer@navimatix.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r0ggcO4TWyRD67/cLQNGMiV8uqYCeLmx55eKUjI2GzE=;
 b=qJ3Z93uWOaJFPOS4IwL7u726LCMYpBtKHWzWnnsG+u/LgLMAh4aobO8K1PlL+26glbZtu3Qo0dEM1wa8VhDk90n8y67A7h8+lB3indKB2tr39lFPKOcTy3YWdN23EGYSUV1ZiFxHg0uKlItkHsZMo9CzS8OmMR64DTdv8gpV4Jo=
Authentication-Results: dkim=error (no key for signature)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by DB8PR01MB6518.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:15c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Thu, 16 Jul
 2026 06:39:31 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0223.011; Thu, 16 Jul 2026 06:39:31 +0000
Resent-From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Resent-Date: Thu, 16 Jul 2026 08:39:28 +0200
Resent-Message-ID: <alh8oOndW2KaXJ1A@navimatix.de>
Resent-To: openembedded-core@lists.openembedded.org
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uJ6Ohq5zvqyyddjhgA+JKjeMWvRXpgSsKTdU3aOtMmMneIHe4V3lXjlfPd1Pyi2nyZKQU6tev8hxfSv45bXl0Q9cSziJxwKtUSBDEbD+ERv2pQ+goTqD894IGwux8i6TI56nM/HhHUiBmRmkSrpVzwX3w8wRp0l5jDaWY03dlFqEmFd/qCvgDUySvzyc1x+cqnvDIHM309sRjWPJD33cClmEEpOYMF0bTRK+sbzdz+oR2e7zxzyX1qc6ghnTK+b2T4+NkjarqXX20YainP93vUuHybCHGNnY1Jvv5GKNCVDey0ShGX1/hl/U6t1iL7X3InZjTfP0rTgP6Sbfz7L4Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r0ggcO4TWyRD67/cLQNGMiV8uqYCeLmx55eKUjI2GzE=;
 b=qoQ0odXTteCKRsKU2MvgDwrXQX+ez8cArtsD/HRnubKDg/O+kmBeeZE0Oi0/cl4VGEJt7vg0dbh5sKN4d+Hu/wZTy8mssIQv6W2u1mbxgInTjvHVFlceD2Axq2CFlLqKkOrepGhGdZKAr+MBzrtfvxiZNo9OmoMxFoAnIpagIwp/5rvU8cLIATNbPKF8115+b5e390dH/85Nyu+4VrZk4zqkOMkxAP2WZvctKoHoBhVQbWE7Ylvfp3m8OkMUK9O1PKI3BCR4r3PrdcsdtiiOl+5hzAvcwIq5yEBw4uxIQhs4uoG7AAHsHfrkp+CgznQio/OsSjuH+N1J5pR8yvkOwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r0ggcO4TWyRD67/cLQNGMiV8uqYCeLmx55eKUjI2GzE=;
 b=qJ3Z93uWOaJFPOS4IwL7u726LCMYpBtKHWzWnnsG+u/LgLMAh4aobO8K1PlL+26glbZtu3Qo0dEM1wa8VhDk90n8y67A7h8+lB3indKB2tr39lFPKOcTy3YWdN23EGYSUV1ZiFxHg0uKlItkHsZMo9CzS8OmMR64DTdv8gpV4Jo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Date: Tue, 14 Jul 2026 16:41:33 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: <openembedded-core@lists.openembedded.org>
Subject: Enable audit and other PACKAGECONFIG by DISTRO_FEATURES
Message-ID: <20260714144019.2771283-2-joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: BE1P281CA0228.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8c::7) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
X-MS-TrafficTypeDiagnostic: 
	GV2PR01MB11835:EE_|PAXPR01MB8872:EE_|AM7PR01MB6722:EE_|PA1PPF67F80E730:EE_|DB5PR01MB12799:EE_|GV2PR01MB11835:EE_|DB8PR01MB6518:EE_
X-MS-Office365-Filtering-Correlation-Id: a515535d-563f-4363-492d-08dee304fd94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|14060799003|1800799024|366016|376014|23010399003|56012099006|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	i7jvrLjiuU1mPNFNXD8++c+R4EJPmv7HhEXr7/3CKZpJcIdFIcknP6n6dWu4yBWtwilP2rD9m06FHvGd32b/IbByiugrBtPaCdqUDfl4O4yxxWHMcEodUEqZbK3RrBSFgM4pdSQBRz9pLek9/C9VybL/QTMzvT/97LO+huHGckpqHewLaHob3s+jdrfrS5M+uQv9OjkHjD2AzP75siOZu4XSRDTIORh85mD1h4CgZyt5zteOjTnPGCrUJv/dutjZeNS9OsxUR5FEf75qxcH2STlUj+hQWO0MBxm3G8Hm4F5484aVxXjMV4G9cZ7f607QH640FZn54AYGkV+pfxnoXu97mCHSPy0caBJ0VrIPli6rW8hHvdhWruGEpdTP+lVALsyljqr0WLbV8Pk/mo4LnC4ccuc51vP1s9eBj67fSRF5jVMKZ+B4K3d6CfCpG97EgNNz75FRAijgd65slExv3a2UpFbyjIFlUncAYPHE4uMKaJ5oG+U4yF/GGYmxKJimoGhDgTjAI6sMsaZhlbQ1sxtNzv3qeymbXbALBjCFqckGlPmvtdEmPVXG62kuiPVy6ZGfIvFB7pqBZK4jAi0QBlA0a/PfEeCm2axAt4LzgAKgYNvtZgU433A16v0nlIbMD50X/J12KgSY8R8ZOET14bFM+mW4zBxXjrc+5mqU5TU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(1800799024)(366016)(376014)(23010399003)(56012099006)(18002099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-CrossTenant-Network-Message-Id: 793d92f1-849a-453e-044e-08dee1b600d7
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 14:41:34.9498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xxR9oBuQhe0Ldz9Vg9r82HilnLT0mqggUyd3JHn15tqfvK+MQf1BuVMdkKvtTcxlO/HEHupny90x7Xuslf8/KrJqUfeq/1TWdZkrW88P/CM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR01MB8872
X-ClientProxiedBy: BE1P281CA0256.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:86::18) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	793d92f1-849a-453e-044e-08dee1b600d7
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?h+HdMsa3VvmWRIu7wqWeTLrZhqkAOx0hHS8LQFRx5VTSPkiQ+EI5SKb90d+U?=
 =?us-ascii?Q?ehTZ/8CcBayQlVVGxEfX7PJZHNnutfG7WpKzUoFZr1uAG40YLUzVWlhFDvXk?=
 =?us-ascii?Q?XxDfGOohJgY/oJxIX0tnsgim3R1NjQpJotllRe+apCynXOAdXe/1duMkVMrW?=
 =?us-ascii?Q?5r9fiEHCzsMUafhGAzvpCQPWIuWlTTrFGnZM5tnDkfa1Fw2r3eY3enR6BDZy?=
 =?us-ascii?Q?5EaVIORa74mLDtV2AxuNytY9jc9dp+Dg0tIITjQzmaWU2w56wcR/AZe4pkge?=
 =?us-ascii?Q?OEXqPi8o6RuGgTcRKitZka86tJdCgxdzQSqRG34rpTevHKQ36cXD/IMmmi3I?=
 =?us-ascii?Q?GU/Wc5pKy/Ig9uEBKPYJM4RuZdqXzBdFHdS3vSFMXSMx6SwBSS6IzL4l0+vH?=
 =?us-ascii?Q?i8NV+TwUwF2r9vFT0Px7LH5bfH6T8Rtvw85N484IAJcicl3zv0lc7T+5SwnZ?=
 =?us-ascii?Q?LEzE5mk1W3Lx9AdIzSMg0PnQouglbMP5atTsF2mz5d+1zkU8QNkPynCgc878?=
 =?us-ascii?Q?1X5GZe/yk2B5DaeV/ItZUUzIBsK8t8h1ZyGmyXjFstA+QANkYT37PzuTjeN9?=
 =?us-ascii?Q?8AWaR7pu+gsrou7Tc4tgN0HYxp01KLDC9v+S0BWQn9CmzyEVptGytP44W3sV?=
 =?us-ascii?Q?dHsv1RoAFraXVulvxawHUAwojV67gTBtWPVuOUj9RV8TyJ8yWjXXKKGAi9W2?=
 =?us-ascii?Q?rQmwkLIhh/iO9kq7D/5y6kV+9tfsHKWXz6aEyaV+Bj/UVjqDoG4ofJoAmoz3?=
 =?us-ascii?Q?CW0G2CKT2aPqG+w5w5PcisKvxnmX1s2GOt3a+qcwOXK7uGX00sEOyh117AbA?=
 =?us-ascii?Q?J4kJLPQVJ9Lv2vtXy+Jmzxd9qjVDtrY7heJnrbYIuYVxR3F7N0xQkQb2vshn?=
 =?us-ascii?Q?+o/btRszst45lU5yLgFLzuYXEQQaSNdfu1xuz3jra29I/OhCBxmBRUX1602r?=
 =?us-ascii?Q?ZS7hcMr8pZNv+3cZo4ABfwyOucuEWzK8oWyUcFeG73jGkxjiDC4TYDyk7ZZ0?=
 =?us-ascii?Q?viNPHK+oEfAryLdxD1x6EzgAEuoiKXvX7oPtMp7zcdfPiCVkBdVNvw5TMUNw?=
 =?us-ascii?Q?7X0rPRSFP0oGiOn39XXqjKYE9+ZXwrmA/o9cDVen4lLwCUHsnbYHS16N5dx8?=
 =?us-ascii?Q?z8Olcl/ZatyXrlOMNtMZSYROuZMzfZucVCgjYRd2bq5+IrhTfFoxbE+doKNz?=
 =?us-ascii?Q?SPJcDOngJpJ0ry+HhCQ+MdU/aakHbIUGLe0/rRnNkVYuaXEMJeNirCNlGUGq?=
 =?us-ascii?Q?B3/ZX32dikESF4ceEtIvlE8rbb1Lf0T8E1Aq6vyU5p27tcSi6gYxzSd6JSYw?=
 =?us-ascii?Q?AmlEnIhCAt5XBCGKTG2o1MFK2wmJCrwcDBApNZ8CKdmQ1EEWzc2K3snjkv6a?=
 =?us-ascii?Q?A/x81tYPhTBibdSHk6u1RbWApJo55q1LEMwha99qDLDJ1YRFLlNNUGDx7vq5?=
 =?us-ascii?Q?LpYki418RKEGpsw6DQpGpsMXAWmq09MJoqiXdJxhdCDi9TFdTZ2nM+5koDC6?=
 =?us-ascii?Q?Ij/ehRPZ4bdCFQPYDeef4+CRNvdpT2gQYN6qPOj+vRuygSSBXEtSEW289Jo9?=
 =?us-ascii?Q?S9zLNb/w4rRgQrAdKsXZceP+YQDD7o1DbuUbeOftSaXjluqss6DO+80/vezG?=
 =?us-ascii?Q?juMJ4DKtLLgMpZZ1GZrTUyPMNFuGTnZq7wwBGE3Nyge9HgyQERI5lpyiQHKe?=
 =?us-ascii?Q?7+1U0fRUIi5EZ6Z2pNtZAVW18ca4q/zvkE+npVJeP1RfORAJIf4u7faQabsv?=
 =?us-ascii?Q?a2prR4/HIGQPcZmkNgr2vWmy1+Q++lk=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a515535d-563f-4363-492d-08dee304fd94
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 06:39:31.1767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9QZfzrqWUdTHT23PmDs8nbJUg+ZcMvqFdef/saDAeZ2xK9WugpZnM44NgGiOX2skivPb2DcRM837NVCUreuqnFpSompXiwmyATczgQHXVpg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR01MB6518
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 06:39:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241055

systemd already enables its PACKAGECONFIG[audit] by filtering the
DISTRO_FEATURES for `audit`. It's useful to extend this feature to more
packages.


