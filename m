Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23C56EB64DA
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 11:20:32 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.50])
 by mx.groups.io with SMTP id smtpd.web10.4837.1689160823457464085
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 04:20:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@welotec.com header.s=selector2 header.b=icgRX19o;
 spf=pass (domain: welotec.com, ip: 40.107.6.50, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FH54jFPc6VXRQJxAGt93Zb1sWuU7LI7gHEBQGglYd0m2W7qvav6BXVS4Rr+sSS+Zm0BJ3ux6Jdu2h1U+JJunmwk5d9tIDeXr2XrzJlgapWxyO298M5EMTph8iq+55vG6VTV01+4pidXu7WSdf4ExAP7l6DQGSXleB3yDMXc5Q2pzCMtwC++n/hAyzfTMbqij++6e8INM37EgwbQwMGEVn9PbNxv4DEvpyFIE8cbPMK1JLIsgkPF6ZyI4vvDM+5LdlDoNLtj95YpJhKdl8VEGo/jLlgj4eCde7UkNVy81nMkpCfOfh1PO4fvLaE3xLsASaeI+ADQ8eKijRid16cz5tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FhSbpNtIu01gzcXqIIgE+KAoxaSghkHVnOFAdrtyjwI=;
 b=jxAA+odFNKGpgxX4vrCQuyjCgFx8Roy5JBLm+6QqpTMtnjE0BN5JfzTFGaTReeaRpCXSqHPvGhI9FBnOYycn4k5dLzRH3Eo3EupTXxPznLJN+rm8XfT68Bk376mfKx7LkNKODZExeg3msBGtMkcKrmweIgPcqdLJQaV0pt+AkiBHteQAOXOMXz9ztGDZdc5Wm60h/20adpY2FbY+xugMONdmJe9cuNd7saCH1HIiTM5yVvbnesYS+sTJKHQpRuv6mF0woMctcbZaXdO4dJPXWv4faaALmLPK5aVUbH/U4bJc0pmulnuyRnW/um5JGnDIp+kFZ2PZ01vr3qr0VDw4mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FhSbpNtIu01gzcXqIIgE+KAoxaSghkHVnOFAdrtyjwI=;
 b=icgRX19oKvAfoq1Clw1eHQRZlXpEdzj323xuvRWPCWFkdIPbFbBa74R1B3dJy8NligmotafbanhV1RDzcVlEfU8xq3sAYfha0rtkAGSSFxqxwMxDLhNgYr+iY759FNbJFDtgYrmy2AqxbaRxMbVIa1At2vpiDsDutga1oMmm3Tw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AS8PR04MB8866.eurprd04.prod.outlook.com (2603:10a6:20b:42d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 12 Jul
 2023 11:20:19 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4%6]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 11:20:19 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v3 1/5] bitbake.conf: add acl and xattr distro native features support
Date: Wed, 12 Jul 2023 13:20:03 +0200
Message-ID: <20230712112007.705867-1-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7b::8) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AS8PR04MB8866:EE_
X-MS-Office365-Filtering-Correlation-Id: 314b6073-2b47-4f8c-37cc-08db82c9f968
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VYtOJ+kMZjPIOm8z345U5EtW0Qz3xAmNQhaPp/W+IjmNlXIlb1XTVRiZoAkB05u3r8v38ZDDL7b52nzvC7jYy2sS3U6Ri+cJNyMBMpdrsLOkMmrEenLYfwx/xPs7wZfaQW7/HcUBXB37fmabnkqwvv8+c9w/S25bmo5eDdDNuk2qv1gWjltzXMuIhKzwjolRPozDF6FKuV+a8c9oILgmY2e+bLs6nlhKXPRWMGmGXbmkx+ZnN0SHPHH3IHD9tEpJ+qv/H70pRjHcu0WpdnEje/axULpF5APc5kVx/EJrzu1uQ4JDtdWX2FPPj3KExoI3elTrkM8PSQag2XU5FbxzwsWxiHajmbSG+pFjIPM3CUBUHk7o+0UuSDzbXXpxoY6BUXvmmWFrWrVQbkqQpe1lLVPRHurZnn94KM9n0u26jLVVitS/e0J6w2HZmCQjs1GExVR8v6m30M/0/p6O606UN5+ya0n1iXZoFxn5mUSA+Nvj/mOQEI87ndM1wuiCK+YI0fyu8xqf/PYgMOrA7v46DL90KXKDoI90z7dvv1nRwQXl0LnZekALc+ctoQA8WHuzIOIb63GZDL/C3rByQfyT6C1Wh5vRPytdTjP3VnXHom7IGG5EjJaOwgoskfp4sHw0
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(39840400004)(376002)(366004)(451199021)(107886003)(316002)(41300700001)(52116002)(6512007)(6486002)(83380400001)(186003)(26005)(2616005)(6506007)(1076003)(38350700002)(478600001)(6666004)(6916009)(38100700002)(66556008)(4326008)(66476007)(66946007)(36756003)(8936002)(8676002)(5660300002)(86362001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IgdQKCtgMGNWh/oihviq2ca30OdPb89jtiXFBEBdN7HgLs518YCC8L2G+YEI?=
 =?us-ascii?Q?akmd65rIRE7YDQAIkWta4vWmCJx+uXRfmnJUs2uhTL18dA0tZANrTmjGrECh?=
 =?us-ascii?Q?siuia+f2i9ggT+6POrFpn3/TeXFDRWwgD6t2lFJWaxevkRhbgOuf2ajydNw8?=
 =?us-ascii?Q?B2sP/SU6HL1bI1l8KkK6ohvD+7y6JpS7pPyl+yLzKOx9fnpLKiiaIuWimYl4?=
 =?us-ascii?Q?CWxT9IcKlAfwLrMrklrtDdf2x1zQ94U9AC/XsqSC92FQRNBVmHzjSAZp7vDD?=
 =?us-ascii?Q?bfC7wzzVMD3GxwDWF1MpEqxXEjZrEcJrjoSP9jY5D5FiyVeDSM/139M19ewe?=
 =?us-ascii?Q?2A6TnlvNmWvvdLf2WBSAGXdKiHKu6o3m6nTqtvjKtRJdSBkrK4b0nxUMvPuK?=
 =?us-ascii?Q?whxvXE9bFXgdOALzgRKjxsUVKjRXwokIgHIxQJeYz5RkneCN4FFgjHUMNc2r?=
 =?us-ascii?Q?Ermi4qsGuM2bnqx3klgMXzVO+w7rB5Vdkxtoxhg45DzWvda5qeH10Xbi3QPx?=
 =?us-ascii?Q?6JM6fwnyCRYeV+mJk3O0zuFWp8kynFqXyKKmulle6XuoG58BjMxROkpu6p5y?=
 =?us-ascii?Q?lrqwbk6N+tVAv2rWDgDdIvBxr4GCCchMVafcU8Xp60R2+73GFnx7MpJdIV4y?=
 =?us-ascii?Q?mrg3dTBuv6q/stU0lHhnioyqCL6kMlPli8orNwE5bhCCvotQ7hSPI/BtN/Ae?=
 =?us-ascii?Q?HYW48zKHWCjsB3bU6omLXeB1QiipfSs/4HBmwNlqPMDLfL1p30laC/i/kFgp?=
 =?us-ascii?Q?7/WsBSspcaTsclmf88hpYNBiW7mAoz93k/HusDnEWpS2ETAoL03XLFsqFhHT?=
 =?us-ascii?Q?LbcCHytmpx7EhBymdsURSsMSTQCpHsppizshiCJ8KbbEw7Q8eXzSaj3pQzk5?=
 =?us-ascii?Q?OX8wH4EERtxUAqtu8Wc92TR2V66o6qUKo0SFkGO3KJ480nDHQu62k6BLMiwC?=
 =?us-ascii?Q?oVkBrraN2UudsPPYpDxS8icqKF5lSsX4zFc+JaE2OLc1/O0mCGL4OK+TQhUN?=
 =?us-ascii?Q?YYHziHCTBPNoP77Rozm57xHx0GoG0AdbqpTghszB8XmgA9j67nxywNKm4FDD?=
 =?us-ascii?Q?oJUXWb+Lp3nBcXU6pJ5cNcOKFTA0GsSIT8y3wuiTCPJl4P95pCBjr7lsgQ77?=
 =?us-ascii?Q?4zeQztR1mNJqJDyozBUcF6/8yQ8M7YQUT3thT+2yug4Ek5uVGA3LDz4eXJH5?=
 =?us-ascii?Q?yslZuxM4+Lp/7LZuGXw4fJUEkOuP+hPIvwaEh2bn/86L55VSHcIwet+8Ppv6?=
 =?us-ascii?Q?ZCmsxxuv+CqDxoyLkxHPVp1SA1Y/GkTC8ApjYpDJO1/mIk+EWgmEkyw3SmMO?=
 =?us-ascii?Q?6zzVZlj7pwmXmDEUAWSTm0i7QGy2Ugy6+KnVohuDwUf7S0Fo7nvgAbRae7gq?=
 =?us-ascii?Q?6p6lo8cU0/Om0n5TjTD45RnQKZmUZ3uIT82EQ0o+UkQacQDnLaAvPo4K2uMW?=
 =?us-ascii?Q?AkqldIZaXzWyBjZJoPnWuDzhm4ROU/4hxLqGXQiFr14mWcy7QeFjfn1OdbWA?=
 =?us-ascii?Q?tKB1nRQ47pguSXH/T2LnUgmcyglSIUcmnRlUuS2N9Xs0HvdBrzZFMJ5xtoCD?=
 =?us-ascii?Q?veUn6BqNMJDQI7AKEjUyAZJR+6F4SZYMBCv4vqEy?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 314b6073-2b47-4f8c-37cc-08db82c9f968
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 11:20:18.9590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hQVcH1E1YhLAXHqelFInCPnXJT4HDdIZG5MUA0QdMb+lPJG9Rv+/38paioL3Yb1HQ1qn0ZjMP9hNCYWffiJZRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8866
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 11:20:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184177

Include support for ACLs and extended file attributes for native
builds, depending on which distro target features has been turned
on.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/conf/bitbake.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 9625a6fef4..20684a5126 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -904,12 +904,12 @@ IMAGE_FEATURES +=3D "${EXTRA_IMAGE_FEATURES}"
=20
 # Native distro features (will always be used for -native, even if they
 # are not enabled for target)
-DISTRO_FEATURES_NATIVE ?=3D "x11 ipv6 xattr"
+DISTRO_FEATURES_NATIVE ?=3D "x11 ipv6"
 DISTRO_FEATURES_NATIVESDK ?=3D "x11"
=20
 # Normally target distro features will not be applied to native builds:
 # Native distro features on this list will use the target feature value
-DISTRO_FEATURES_FILTER_NATIVE ?=3D "api-documentation debuginfod opengl wa=
yland"
+DISTRO_FEATURES_FILTER_NATIVE ?=3D "acl api-documentation debuginfod openg=
l wayland xattr"
 DISTRO_FEATURES_FILTER_NATIVESDK ?=3D "api-documentation debuginfod opengl=
 wayland"
=20
 DISTRO_FEATURES_BACKFILL =3D "pulseaudio sysvinit gobject-introspection-da=
ta ldconfig"
--=20
2.34.1


