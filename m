Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45847C3DA4B
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 14:34:56 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.16])
 by mx.groups.io with SMTP id smtpd.web10.48.1721226895278635914
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jul 2024 07:34:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=eFrhKzq+;
 spf=pass (domain: axis.com, ip: 52.101.69.16, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o41f8kNoEvd7wCM7m8BytIE93gCQL+VPTr5+mSCehZgXslHormIJMILqs7sr3u8EcpY+xDQZCj2Wljsk2gvWoD7x87nIDiMmAAg2yHUKkP9S2MXPRlIPRTCGVqeahGeV+h78t0hCe7o4MDIOFcMRiG5SAFWJAGFuueAQ7wsdEE9F7Ta4Bk4muE5qQqBWCy14IC26tqL9VNekT6sLrO9X+z/WWYDy6Kk6zowM7cGQKWh7XDQAWCIPW4LytEmSjAUROaweoihsHLJmd2AhaDL1UKP4ft/oC8e3Xzjjgx9xjgfDYWxjLkSW3ElycJi7K8oz5gD32kag5OPu3ELfbdF3gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=09T+Lql4LvdngDm3U4GOQ/RKvhyDgnvR3F/3jAPRVMI=;
 b=Gc/iM0JnrVsoO44HyW5yusiAEubdP4/tO0HYUEafF1xbv9qpgJab3tQ0j+F5MjVFak/zLLwquhZjJz+2flItyozNkpe4xaer0pfvlChpAglPw0nsDT1kB04TiI5PKIUvDsRa2t3RVj0SJvqNifXyIlcPf0NQqlba2wWMZFMJXR/M8Dsw4w9PcQ++3fjgWb8387kkgJC6GATngkAGAxUYm5RNtDYsT1Pu+zmELftcI7+oDPeXJEAOAWcdjOQCMLK9vFVNgjPp+qTHsylse+GnuZRLlFVUspPmVA+Q/AiFl15HOzoIxM32m670BFK6Gsxhbl0Ns037gXVNvT5wcLofPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=09T+Lql4LvdngDm3U4GOQ/RKvhyDgnvR3F/3jAPRVMI=;
 b=eFrhKzq+iTjPWc4Em1lzHTrq3voZyt572swfrHvqNOfrU9iWouP8b58wwrdWTP9pray8PJkTWE6wB3CQJGKrrZ5j0YMGoUB0tev4hQn9FYne62EfY+zOfvvHNoIV6Ye0t4aAqOGSnVKC22btsFHK6swteDJpo1S04n5k4Ypu66c=
Received: from DU7P189CA0017.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:552::31)
 by GV1PR02MB8514.eurprd02.prod.outlook.com (2603:10a6:150:9a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Wed, 17 Jul
 2024 14:34:49 +0000
Received: from DB1PEPF000509F0.eurprd03.prod.outlook.com
 (2603:10a6:10:552:cafe::7f) by DU7P189CA0017.outlook.office365.com
 (2603:10a6:10:552::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16 via Frontend
 Transport; Wed, 17 Jul 2024 14:34:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509F0.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Wed, 17 Jul 2024 14:34:48 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 17 Jul
 2024 16:34:48 +0200
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 17 Jul
 2024 16:34:47 +0200
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 17 Jul 2024 16:34:47 +0200
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id E1102117
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 16:34:47 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 46HEYlUY804925
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 16:34:47 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 46HEYliD804924
	for openembedded-core@lists.openembedded.org; Wed, 17 Jul 2024 16:34:47 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] systemd: Move the MIME file to a separate package
Date: Wed, 17 Jul 2024 16:34:41 +0200
Message-ID: <20240717143441.804891-2-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240717143441.804891-1-pkj@axis.com>
References: <20240717143441.804891-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F0:EE_|GV1PR02MB8514:EE_
X-MS-Office365-Filtering-Correlation-Id: fcc4ec9d-b72e-454e-35f9-08dca66d9c7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/tvO5QOzo9qrfvkeUeOki96pfVjw9H5Amcuw2I6S1TZwGVG6c64nwzYOLu8g?=
 =?us-ascii?Q?vCz91509l7shnymf1wBV1OeffQsgqE9OlbUBGjqwFHq/XRVP3WVv/7Ih7OY2?=
 =?us-ascii?Q?D5O7V0Q+sTlwznWcYmsp1VnIx9Dj2uVa0CFNtK3di+DW/1AoEmtq0CTwXHTh?=
 =?us-ascii?Q?Pf9arDdBMiQ2YPkcsAVty5/i+7rVXfRysy2uqH/CghS3kIb9T23KPWZ9AjfH?=
 =?us-ascii?Q?U0le+ySdoNjawU9npfYeeqE29XU3A7DKoq/KAv1Nr2g+jyFr7bWcPS+vxA5O?=
 =?us-ascii?Q?KN9tNKOquEDUxQca852Xr9FmTND7kTTCy+oCt6h8H20gbJFjJxRa7itGNFYd?=
 =?us-ascii?Q?uKmhPjRyZ55hNRLoNyungT/zXnEQGpVo+ZXxlBPBEGJ7evKW0gDtTaHMQ7ai?=
 =?us-ascii?Q?qnfKFQSbRq99Lq2750wxZ1o8sUR8T80AoJRNpW74S45fHUHifCnw+N7Uube3?=
 =?us-ascii?Q?CCag4jRo4SxsvFRlmwPPPYUWNikHhMfo+wbeAK6Nxd/+BsK2WGamLq4ltMsm?=
 =?us-ascii?Q?kBK7rpAJgCrEY0a236PrMg0vb2cnsnbXA2BKL3lqUHCqwNqu9yYpPL1/wpKu?=
 =?us-ascii?Q?UX3Q8vbHWwy4fTUNVw2oackNnFV+dsBCAZOPSoZnuLNVQ3rmY3opJeInl8RO?=
 =?us-ascii?Q?S1vbEYp97NuL+lWjevY/WoJi2B2bKiaUNmyUpSHh3COgth4WNDrmbwxKLvpq?=
 =?us-ascii?Q?NJrnPH/44oliJv9IthlWmvRmvYBFv2HlrR6l7/sz2gwYQEdRa6iXNvSGKW5A?=
 =?us-ascii?Q?ATlZM88OUYpySzUiXTVh5YAYD0Z8ySmu4Hg9Ln7GnXmzUDTKUgeLdS93g3wW?=
 =?us-ascii?Q?k9Abr3oqlkYOnh0Ryx5RIcg0EaUqm6XUEAwVwEFygOyF6d1ZH4YjraBg3P2s?=
 =?us-ascii?Q?qVkmbowEeI8Hph5WztZ6jALpXDnsFAAP/0PQ8UiSEjF4pY0IVBirhtPl4P0A?=
 =?us-ascii?Q?g91yLReWu6222VdBGOSUbz2NNimEGazuAQFm7rlKrFlAnj9H8khcja1wbIUK?=
 =?us-ascii?Q?XTwXMFn70P7pK/XEzeFUYhGOmnydTn9DlPHa/TwY9VQOobaO+ykh/yRuBjJs?=
 =?us-ascii?Q?fvhm5FR0Az4PsJYqGTRg7owgM3Kho3pZqBzteBVg/1h9+3WZU5/2xiet76jh?=
 =?us-ascii?Q?q5ckrg0eDaFFwMdzEPE4fLomVLA7sT8OYNNspFRC0yaNZwuFN9m1G8gSVpsi?=
 =?us-ascii?Q?7TOUSivHPj8OHNxz1AiYzXKngDQBOole9n3gI8jUXbmwjpSYA29uUhr17pkm?=
 =?us-ascii?Q?eQ4oeZm9zxPYsPMoTKf1l1bOXtPYAaL24vJ8v/QKIqrzpAn8pMlNSQHQ5OC/?=
 =?us-ascii?Q?nWWrVLJb3y0jbExKEhKEIUWD0PUWMCml3B9bz6jbmd9f0Vf46DNmzNMkGe0q?=
 =?us-ascii?Q?xp89kygCDQ4Xnir9zt5UKGF3oDEHntxV9jSSNbMsJmWz4DRZ4BZE35rHjITk?=
 =?us-ascii?Q?+rU+Ic+DEZEdSHHuSxvnxEWt8EdUyo2c?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 14:34:48.6084
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcc4ec9d-b72e-454e-35f9-08dca66d9c7d
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509F0.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB8514
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 14:34:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202167

The systemd-mime package is added as a recommendation for systemd so
that it is installed by default, but can be excluded, e.g., via
BAD_RECOMMENDATIONS. Excluding it avoids pulling in the MIME database
for products that have no use for it.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-core/systemd/systemd_256.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_256.bb b/meta/recipes-core/s=
ystemd/systemd_256.bb
index ef243c2ce1..6ef6b16f0c 100644
--- a/meta/recipes-core/systemd/systemd_256.bb
+++ b/meta/recipes-core/systemd/systemd_256.bb
@@ -429,6 +429,7 @@ PACKAGE_BEFORE_PN =3D "\
     ${PN}-journal-upload \
     ${PN}-journal-remote \
     ${PN}-kernel-install \
+    ${PN}-mime \
     ${PN}-rpm-macros \
     ${PN}-udev-rules \
     ${PN}-vconsole-setup \
@@ -634,6 +635,9 @@ FILES:${PN}-extra-utils =3D "\
                         ${rootlibexecdir}/systemd/systemd-cgroups-agent \
 "
=20
+FILES:${PN}-mime =3D "${MIMEDIR}"
+RRECOMMENDS:${PN} +=3D "${PN}-mime"
+
 FILES:${PN}-udev-rules =3D "\
                         ${rootlibexecdir}/udev/rules.d/70-uaccess.rules \
                         ${rootlibexecdir}/udev/rules.d/71-seat.rules \
@@ -731,7 +735,7 @@ RDEPENDS:${PN} +=3D "kmod dbus util-linux-mount util-li=
nux-umount udev (=3D ${EXTEND
 RDEPENDS:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-g=
enerator', '', 'systemd-serialgetty', d)}"
 RDEPENDS:${PN} +=3D "volatile-binds"
=20
-RRECOMMENDS:${PN} +=3D "systemd-extra-utils \
+RRECOMMENDS:${PN} +=3D "${PN}-extra-utils \
                       udev-hwdb \
                       e2fsprogs-e2fsck \
                       kernel-module-autofs4 kernel-module-unix kernel-modu=
le-ipv6 kernel-module-sch-fq-codel \

