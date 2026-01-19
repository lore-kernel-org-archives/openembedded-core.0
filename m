Return-Path: <j-sahu@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 577E9CCF2E6
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 11:13:20 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32994.1768821189352153137
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jan 2026 03:13:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=NDZ8F+Ew;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.61.54, mailfrom: j-sahu@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PalNqoY4vSm8lM6Pd5Vbf//3CVwmk6DnKfA8jVwVHsQKABvke73Ei8QAmm0cEKJ8bIY+WI0ndw9xKox5KvoFCIzXQDIN61xkAdcl/Cmme76cnDvf20Lk8aSoP2I0cUdj/dAZpFoJsGrpncGfM/cGcR+TmOB7yBWuynifLXZuWX4XFq4WmFb2r4OqK8diW3QgedvkA0zMbJPGwJpMALWiRFGspMrM7HCtxU0zPlJq0qGhDzbtHE2bKomKcqP+MK5AJirvp91uTwtzxA7Zc1IwIFwfj7GZ1A6dErZnt+h5qzLelv/y3D6PxD0afkV73Qr6to6SaUfM75Xs5knyyKeIUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nCNY++ws+b52SiyRsrTaQYuy+KPDsiJk1lx9Aa2iYdI=;
 b=yuPn8iHMr0RqTHXnFUbDqrdWyrJus1AScJnCFA+128EkUAbxi5yZD8PkDObQtoLkN9FPpzMvg8Ic5zN73c97y6xDXPLzMq323YiqNFJu6KUkjv9jToH1Kug46av9pt3nVbn8Rh0aWP3nGakTL6OPp9DT1SqRLpRSlrqgbtEByB+r7kA+nfXG1I/rBCjedjuNlAZmD63Xjqz9ruTGyePU3NNVIfqhP05+qtF4iXECJlTLABfqNh+gZYq+0gxejxEYFiGLrmh1dZGRnGdzDvzil9mYUqASPCP0xBf0W8mrw7HyOn/Ri8uM++QSWolwjnouqHv7wJsnSlpa+vo97aitDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nCNY++ws+b52SiyRsrTaQYuy+KPDsiJk1lx9Aa2iYdI=;
 b=NDZ8F+EwLf/4vxcMsSskbSSt1xhaKdu/6RUm0KToQ0GDb5cj1zT/8pItjReJmFnPwcwZuD0rwiqVgT0buFT9My38gAoYBUrie4TLvIiYDbQNY3sz/lwXxodoB4gTqrCYvXLguMLy9iQqkBj3Ft9hY4ULyLGcFAMTuwinDEULtN4=
Received: from SA1P222CA0157.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c3::24)
 by SA1PR10MB6415.namprd10.prod.outlook.com (2603:10b6:806:25a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 11:11:42 +0000
Received: from SN1PEPF00026368.namprd02.prod.outlook.com
 (2603:10b6:806:3c3:cafe::53) by SA1P222CA0157.outlook.office365.com
 (2603:10b6:806:3c3::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.12 via Frontend Transport; Mon,
 19 Jan 2026 11:11:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SN1PEPF00026368.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Mon, 19 Jan 2026 11:11:41 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 19 Jan
 2026 05:11:41 -0600
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 19 Jan
 2026 05:11:40 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 19 Jan 2026 05:11:40 -0600
Received: from jeevan-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (jeevan-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [172.24.233.81])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60JBBdqN3454372
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 05:11:40 -0600
From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] gstreamer1.0-plugins-good: Add Qt6 QML plugin support
Date: Mon, 19 Jan 2026 16:41:36 +0530
Message-ID: <20260119111136.2327726-1-j-sahu@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026368:EE_|SA1PR10MB6415:EE_
X-MS-Office365-Filtering-Correlation-Id: 56409622-7639-4352-d406-08de574b85e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9rx43mALR8SjrdtZMgyKRPmBAt2PWXAUp5OiQzHru71An9WY3hUa4ob0t1Nx?=
 =?us-ascii?Q?qjBJqaykwkTSao11KJP+24fN4EyjTq4Y6922NjBHwixay4AqWaGLo5jmLkwU?=
 =?us-ascii?Q?EqLANFRvr7o0BMw05J/CB4oVZGdc3lc1NYM97SyFG2m2pkGbIOch/mtOxxuF?=
 =?us-ascii?Q?R2eJcBGk96KFoj+XRXIo/KG/JzbwWHwSGOpaWg53ZHu2xcptEr8KtDtqGW8x?=
 =?us-ascii?Q?WQoRFtZOZCHZTXR0Tadi2FeNZDTZGWPSknXyRzqOKHp7EfKEpIoj+hf1s22/?=
 =?us-ascii?Q?FIqKuPWoaW9dAqzcTasaRr/RiASN8nXog/ZpQgM5flVfQO7ZRHYRGGJCD36t?=
 =?us-ascii?Q?EqHpVX8kUkpMr7c4wtsLbXScgW12iWYRv1SJPPvXuyqEg7w2qH2SdEu03Noz?=
 =?us-ascii?Q?nd26umvYSjMYFWJ7d02uCw6VIlN5fvyKVOppl5vQOg4qDSVfKk4/9yuRalAJ?=
 =?us-ascii?Q?0iDUU3A8x6P4v4a6aH5vB8VDPAybQC6C1//mT9qo/c4pZpblmuKj+OopRqY6?=
 =?us-ascii?Q?ByJ+AHbmO0V6mehorM9W1ayspXpthdaC3wbaCFMCYLBHsn1PykdL34LIHsNa?=
 =?us-ascii?Q?OsUnMuoqCqIAqFueuEWzWIg4WPksIwu6nVZzQ98uTmsvbQ97LPQmbqpPZefG?=
 =?us-ascii?Q?Xa7RxMtrj3P7U5KSbwA6RgHqWPTMH0tsKggnBIj8NfTVTSyZSB24laJP3NPv?=
 =?us-ascii?Q?7p1Mc8Orao5YvKiSxGVs7O/EY5XkHqbqnyXk6URw9yw7MuYckR7SKiv0E4JO?=
 =?us-ascii?Q?37hkM3kcJspbMkrrZYWEU0zGYcCrMdULLAfit6VhgLlee5WTVIcVVMfaqHVx?=
 =?us-ascii?Q?iEgOWm8vu5C68aydz4mtcxhZflYcUb2B2UtXzuTyjHFabR7SuDDj+/d89iJ0?=
 =?us-ascii?Q?VGFpRJM0CXL99iZ0EN7qWGNsNscz+7+mgp/tZJSOdUApOdlgfbAWQOZAS+oh?=
 =?us-ascii?Q?1z/ZNbggSTnbgOvtYEFW8zHpaRx7DyG9BmlNy+tE+ff21sFgSB71sesSVDca?=
 =?us-ascii?Q?ZPjKw25J4YupAaRivJoWgQdDJfFNsurLNsrkdsYA4+owWlrH1OVAvpS11MDF?=
 =?us-ascii?Q?unx/gPRHim9bEDBxbJyHIhlQu09VbjN7hH9AYX3BctAkMyTN8wPRLgqKxuXH?=
 =?us-ascii?Q?viaotmBXjLepeySMfe24Sl95KMesSmG6Nk1QMk+8k4MGTNmjuIxizVkdViYd?=
 =?us-ascii?Q?HqUh7NsCvh/gwI6VQTfvWPWZ/TxM+yzeukVYS59P34jLojJKTCrizOGgBDXM?=
 =?us-ascii?Q?VQXa2GtzFR7Xe9Z/VqjOPhLdc5iTGH46CslHVyz5d8lXUNIe5/+9+GIZYBBv?=
 =?us-ascii?Q?QOdNbbOuae7ZLl8EaUdi489XPbwkJTMoSW3wjT3DOFo/HcKEyvRywu0FB5a9?=
 =?us-ascii?Q?fXPCAA2Rc1Jpg42wNK1903NWC90h8QiovcL+VUxiyK3n72ANmil2r78mMMRG?=
 =?us-ascii?Q?trDcs3PuhG5ro0Rkev356obbMH+09ZNK32KrQYJVOQOZYQk70gAzXx7bgpKo?=
 =?us-ascii?Q?UKPtEWo9CXGsPM5NR0eYmtHC2BNQwG5UlUnZedf4Q/ORzeeT6mluNiCgm44l?=
 =?us-ascii?Q?YbXSDzvpotyFhNv1pAygHwWFwAJOg72t5XSQnb2uLThgyMaXRycZfPefa6q9?=
 =?us-ascii?Q?msS7dybWSXTTiJn/8DTdjxIqIVYnvZQnNqnjtt5npFixduusztehkJ2Y8ZgB?=
 =?us-ascii?Q?9FdJ6Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 11:11:41.3092
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56409622-7639-4352-d406-08de574b85e6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF00026368.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6415
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 11:13:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229607

GStreamer 1.26 supports both Qt5 and Qt6 QML video sink plugins.
Add PACKAGECONFIG[qt6] to enable the Qt6 plugin alongside the
existing Qt5 support.

The Qt5 plugin builds ext/qt/ directory, while Qt6 builds ext/qt6/.
Both can coexist and are controlled by separate meson options
(-Dqt5 and -Dqt6).

Signed-off-by: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
---
 .../gstreamer/gstreamer1.0-plugins-good_1.26.9.bb               | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.=
26.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.=
9.bb
index 4977415f71..d77e52d74e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.9.bb
@@ -34,6 +34,7 @@ X11ENABLEOPTS =3D "-Dximagesrc=3Denabled -Dximagesrc-xshm=
=3Denabled -Dximagesrc-xfixes
 X11DISABLEOPTS =3D "-Dximagesrc=3Ddisabled -Dximagesrc-xshm=3Ddisabled -Dx=
imagesrc-xfixes=3Ddisabled -Dximagesrc-xdamage=3Ddisabled"
=20
 QT5WAYLANDDEPENDS =3D "${@bb.utils.contains("DISTRO_FEATURES", "wayland", =
"qtwayland", "", d)}"
+QT6WAYLANDDEPENDS =3D "${@bb.utils.contains("DISTRO_FEATURES", "wayland", =
"qtwayland", "", d)}"
=20
 PACKAGECONFIG[amrnb]      =3D "-Damrnb=3Denabled,-Damrnb=3Ddisabled,openco=
re-amr"
 PACKAGECONFIG[amrwb]      =3D "-Damrwbdec=3Denabled,-Damrwbdec=3Ddisabled,=
opencore-amr"
@@ -53,6 +54,7 @@ PACKAGECONFIG[libv4l2]    =3D "-Dv4l2-libv4l2=3Denabled,-=
Dv4l2-libv4l2=3Ddisabled,v4l-
 PACKAGECONFIG[mpg123]     =3D "-Dmpg123=3Denabled,-Dmpg123=3Ddisabled,mpg1=
23"
 PACKAGECONFIG[pulseaudio] =3D "-Dpulse=3Denabled,-Dpulse=3Ddisabled,pulsea=
udio"
 PACKAGECONFIG[qt5]        =3D "-Dqt5=3Denabled,-Dqt5=3Ddisabled,qtbase qtd=
eclarative qtbase-native qttools-native ${QT5WAYLANDDEPENDS}"
+PACKAGECONFIG[qt6]        =3D "-Dqt6=3Denabled,-Dqt6=3Ddisabled,qtbase qtd=
eclarative qtbase-native qttools-native ${QT6WAYLANDDEPENDS}"
 PACKAGECONFIG[soup2]      =3D "-Dsoup=3Denabled,,libsoup-2.4,,,soup3"
 PACKAGECONFIG[soup3]      =3D "-Dsoup=3Denabled,,libsoup,,,soup2"
 PACKAGECONFIG[speex]      =3D "-Dspeex=3Denabled,-Dspeex=3Ddisabled,speex"
--=20
2.34.1


