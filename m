Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3957BC25B5F
	for <webhook@archiver.kernel.org>; Sun, 12 May 2024 06:32:11 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.43])
 by mx.groups.io with SMTP id smtpd.web10.30497.1715495528112974997
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 May 2024 23:32:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=XrxpmsYs;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.22.43, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ReMaBB5iQnyd049YF4Bom5pe9aUlT4Lu1Q9p6SPh4qkW55AFaFC84kySbGLTh3V7yAILuDSqqqxLDmtECvjrjFUEL876zIv6sJ94EF5nColey9t4IMr7gKAMtNT4UtdOYoOp+UAjy5b/mDbtb07L5ItqEqgn+GCYjw/Rf3mrLRbyL3WsdymtCKUHf7C7VK2ISqjgP7D3wjzIkck6tAB8UlBs9Lzk7fJs/yUV10q3SUR4D8LyFZW7IMyhqqbYNNsSlPmXtd8dboUjyFBEzesOFA5gR4vPZ/dTFJZNhXQvxHD15g9dyD5L0Ck5vmzzEVMFqvKBtfTp2X5BwfGoWeCG/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZKtblxxRrANVU8PaI2XIgyTLDwMaOc+7yM+MzGuoNPg=;
 b=aIst6sF4FE2Hl3TjOaG85atQWe/MpjQr5MEzlSHnNexBHj3M0zfJ7P31XKZsd6LHz3dSeEzZn18Ft/2QB7A3WMhmvEteK7vjROUlZAmPHjuKi8Mp316fPZqeLg3USjy89rN5c/9PWCgqAGTgtGyBZKQSeCCeC77irrEWwFeCzMjrumqgHpaMZabq0cIOZRF6yeGFOMes7cxBpWpne8powajOKHHfstGQp2HpEx6HwF6P6yv3VjqO01tyv//L1r+ytr1/fiuDzidK/Aa5jvIFMf/SeYBYmuVkp8iEfiFxl0EN0RfzLif93g4wXaOw3ocIl4dsaCce3CP7J2nwfOT9Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZKtblxxRrANVU8PaI2XIgyTLDwMaOc+7yM+MzGuoNPg=;
 b=XrxpmsYszlGRWRvrtAHBnkEJVgVadVUCIMcra8edXJZ4nId0e8DLk2paCdRYjSd3NNJaEfbkWsXP9Cq+tqBbbLDm18qnm0z8lxqKLHIHACBODMQiMdSRXiV8pRh8djjI1/EeVZLC5EOq2W6bZLwuJFa+Bsn5oxS2JGry5kna6i4=
Received: from DUZPR01CA0334.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::25) by PA1PR06MB9549.eurprd06.prod.outlook.com
 (2603:10a6:102:45a::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Sun, 12 May
 2024 06:32:04 +0000
Received: from DB3PEPF0000885D.eurprd02.prod.outlook.com
 (2603:10a6:10:4b8:cafe::78) by DUZPR01CA0334.outlook.office365.com
 (2603:10a6:10:4b8::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55 via Frontend
 Transport; Sun, 12 May 2024 06:32:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 DB3PEPF0000885D.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7587.21 via Frontend Transport; Sun, 12 May 2024 06:32:04 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Sun, 12 May 2024 08:32:01 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org,
	alex.kanavin@gmail.com,
	alexandre.belloni@bootlin.com
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [PATCH v8 3/3] classes: add a systemd-sysext image class
Date: Sun, 12 May 2024 08:31:59 +0200
Message-ID: <20240512063159.1249522-4-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240512063159.1249522-1-johannes.schneider@leica-geosystems.com>
References: <20240512063159.1249522-1-johannes.schneider@leica-geosystems.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 12 May 2024 06:32:01.0317 (UTC) FILETIME=[18DCE550:01DAA436]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885D:EE_|PA1PR06MB9549:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 392f8639-3d87-45be-9c1b-08dc724d3d35
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|36860700004|1800799015|82310400017;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?vztHsdqjkxEG6oVnwyf6aoczr+R4qkWvGF/gAg0/moWGhvriY7nXfIr1Z5ee?=
 =?us-ascii?Q?Th2kxKHvHHsfzp6m3PIpXCZJapRG+D8UU7iY/89Yq62SlqcRe/p5Rl1JAker?=
 =?us-ascii?Q?MpSqZ8Yy2Xglz+1zCQEztJ83h6yP+iU5fy1+M9Z9cpPtVPcGkgOHE5coMnlb?=
 =?us-ascii?Q?ZDx6u0VigkYyGZc409zIqAE75MJq0fE/PCr7G76wN0uGSRP+qPgBa/AFiggp?=
 =?us-ascii?Q?FjVYaCbUhZ4Z/xP9EbH3v1vlnI5sdMJWyF9bMYERuD82ej8VNTXQDHOQbRTf?=
 =?us-ascii?Q?qqzxfDMqrTg1UHOKkU1FLGMdj/h9bEcTpdITL51ZK7s8MUbdo7KcKVc1ZaX9?=
 =?us-ascii?Q?lfbPParJ3NuWP0W2OTWnYj+e6YV45bQDoy6EOf4YcX18HNy01WcfIpQeNkGu?=
 =?us-ascii?Q?sY2Nv/EmJStiLWHA9X+A9uK26Foiwov2xlPxULCVyM2sXuC/wBE/oZrjl5oC?=
 =?us-ascii?Q?+s6GntKTIvxkJ1CflNZo2WUK0XDVXneq2vMWEvJmD2feaL+cnYxOSvsYITH7?=
 =?us-ascii?Q?JSFnnV1Loxqok29zdW85WLqOHME9rg0SRpg8DpuWfJyNOwAS96ezFMKeZTeM?=
 =?us-ascii?Q?AfjqlUAG1UYy9wmX9ggKRvaR5riiz/z1SaZPQNYuKKPQbf0lTTA3EtGdG+Uc?=
 =?us-ascii?Q?XaCOtyYpehXC/NoVsJFenaNnIjr80II8B2yiPzjbhpxsvpsz/A7pO9uepBHV?=
 =?us-ascii?Q?VXbFGm5hFp64iRgHHWkOltIdy/PGaB6xkLlLJy9cS3gKntQWAeImelsrUQcT?=
 =?us-ascii?Q?6/AEsQjc+RvO584C6D/dsHU2JZf6uRiPKgCtUCSrpUn7OCXQR46P4/sodHAc?=
 =?us-ascii?Q?+vF7iGWISXW5LdJcQBGkIXmTNs34j5IDwS4S75iqhFOUkAk51LCCzepA7wl6?=
 =?us-ascii?Q?hkGABrVgurBddHK6fC46FawPvUiRMe0Fk0ngaU+kEuAbDn3sjCMJiWMGdjbM?=
 =?us-ascii?Q?9Sv/YYAMzsF7m1gH01CndMyKLSXzF8rgwGwq9vu+XRdtfpj1WEXSJ+gkwtvn?=
 =?us-ascii?Q?xtS7KEwSHeHzShVnBsk+VEEbhisNbvJnsT5uZYAY5itE8NjnZ7xNWf2xn9a0?=
 =?us-ascii?Q?YMHdYvkl/Rva6lhnz2mnUnG47C8byxNBCxGHTd3IvtDfdPIJC9/IZcXYmeAF?=
 =?us-ascii?Q?0SSIplEyeEEZ1k+oSyJQ2DFvtDyqIh61qZJyqKl+8MvT9RZmituX7lBGD7xS?=
 =?us-ascii?Q?yQED+p7lu5s3X5byU4WsVzr5UnNp/KecgTqIwRrCzU1J51ZvSSeezs8FXDpb?=
 =?us-ascii?Q?HFaAdPbnr7Pfg7JtgOzSpKLs9oVDbBaVEuGZtu66fAf2RefqXUxIRcpVGBOS?=
 =?us-ascii?Q?OcQdomOihDRzmCRIes39ZStF?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230031)(376005)(36860700004)(1800799015)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2024 06:32:04.4114
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 392f8639-3d87-45be-9c1b-08dc724d3d35
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF0000885D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR06MB9549
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 May 2024 06:32:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199211

systemd-sysext can load a raw-image containing usr/ and opt/ folders
to mount them as RO overlay over the rootfs, to "extend" the systems.

This class provides the necessary changes/additions to the enclosed
file-system so that systemd-sysext accepts the extension for "merge"
into the rootfs.

With such an created image, placed into the correct folder (see [1]),
`systemd-sysext list` should be able to list the "extension" and
`systemd-sysext merge` should enable the overlay. On both commands a
preceding "SYSTEMD_LOG_LEVEL=3Ddebug" can aide in figuring out what is
amiss.

The strict name checking systemd-sysext does against the name of
extension-release.NAME file, is disabled, as there is only one such in
the resulting image. This is done to allow a user to freely rename the
resulting image file.
Note that for e.g. squashfs, the kernel needs CONFIG_SQUASHFS_XATTR=3Dy

Link: https://www.freedesktop.org/software/systemd/man/latest/systemd-sysex=
t.html
Link: https://0pointer.net/blog/testing-my-system-code-in-usr-without-modif=
ying-usr.html
Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 meta/classes-recipe/image-sysext.bbclass | 43 ++++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 meta/classes-recipe/image-sysext.bbclass

diff --git a/meta/classes-recipe/image-sysext.bbclass b/meta/classes-recipe=
/image-sysext.bbclass
new file mode 100644
index 0000000000..bc3e4d52b5
--- /dev/null
+++ b/meta/classes-recipe/image-sysext.bbclass
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: MIT
+#
+# Copyright Leica Geosystems AG
+#
+
+# systemd-sysext [1] has a simple mechanism for version compatibility:
+# the extension to be loaded has to contain a
+# /usr/lib/extension-release.d/extension-release.NAME
+# with "NAME" *exactly* matching the filename of the extensions
+# raw-device filename/
+#
+# from the extension-release file the "ID" and "VERSION_ID" fields are
+# matched against the etc/os-release and the extension is only "merged"
+# if no mismatches between NAME, ID, and VERSION_ID.
+#
+# Link: https://www.freedesktop.org/software/systemd/man/latest/systemd-sy=
sext.html
+
+inherit image
+
+IMAGE_NAME_SUFFIX =3D ".sysext"
+EXTENSION_NAME =3D "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${IMAGE_FSTYPES}"
+IMAGE_LINK_NAME:append =3D ".sysext"
+
+DEPENDS +=3D " os-release"
+
+sysext_image_mangle_rootfs() {
+    R=3D${IMAGE_ROOTFS}
+
+    # pull a copy of the rootfs version information, which systemd-sysext =
matches against
+    cp -av ${RECIPE_SYSROOT}/${nonarch_libdir}/os-release ${WORKDIR}/exten=
sion-release.base
+
+    echo 'EXTENSION_RELOAD_MANAGER=3D1' >> ${WORKDIR}/extension-release.ba=
se
+
+    install -d $R${nonarch_libdir}/extension-release.d
+    install -m 0644 ${WORKDIR}/extension-release.base \
+        $R${nonarch_libdir}/extension-release.d/extension-release.${EXTENS=
ION_NAME}
+
+    # disable systemd-sysext's strict name checking, so that the image fil=
e can be renamed, while still being 'merge'-able
+    setfattr -n user.extension-release.strict -v false \
+        $R${nonarch_libdir}/extension-release.d/extension-release.${EXTENS=
ION_NAME}
+}
+
+ROOTFS_POSTPROCESS_COMMAND +=3D " sysext_image_mangle_rootfs; "
--=20
2.34.1


