Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9919DC25B75
	for <webhook@archiver.kernel.org>; Fri, 10 May 2024 03:09:50 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.42])
 by mx.groups.io with SMTP id smtpd.web10.4513.1715310588606003448
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 May 2024 20:09:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=q2hvSaGT;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.22.42, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XM2v8iiZIJlu7HGYhjZEY7ay5pMupKgNy+Ez+/LSYTi9AwvIKjI+MyDPMcdarQp2FiSRj4OVl46l8CkAMXP/Vr/sq0R7N5KCSnaFav098bkRvJSRTJG3Qqr21KsPIjvpalfFhOeABfQ9qPqfbIxWBX7ITpl88dL3ggBw25l8hgGCzPhnhKBphrcFveyDDBllUAMV3fDEELI/ydUrVtQ9tihG5O7jQjGjdTerLEAzUU/Dm6f15jbjuIfX3qxJOqeSd29Fp3bAxzAzN7m69eMt5w3VWXUphcwvuRSQm6i5U3vLFan9f2WMIZWFdscFLMyGfWYNylShCulQfSDPwOIyzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZKtblxxRrANVU8PaI2XIgyTLDwMaOc+7yM+MzGuoNPg=;
 b=ZRhHKdZni4S7liqchErQckW9P78NgebEe/7a0tuhhKgqtQPmdiVYwdAP7RgsgYIdYbFB3xrDaVRM1DVKzI0q8f7+meb8jpyBErM5H78BTToACDyQSwxKfLuoHAvzfxvlK+J3rJRMgpPVQOe9/zZLj7cO0f3W79LpxNYyuCihhEy6XJifDMjJmoLNOj/kpDcEillk5dIYxFga9NEvUY1AzjAfnvo0FE8sYor8hBFAefh+CbA0NTUp67qt2tGWweue2R1CKvAiw76Gwmph7+6bOsDbMJXFuaGocU91GYdcntcyAXUwGGPg/Bw+mv8VTJBJ9/Z9LZF9lR1QlyKaD/cxdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZKtblxxRrANVU8PaI2XIgyTLDwMaOc+7yM+MzGuoNPg=;
 b=q2hvSaGTX4rcZJnE2CEtvLBsKzd3rNImIRAhZDQoiyTAcR57DXGIIV6RYDIfI2i8RxnScRuQh9zimHzAU5ePxNgr/ZhAEfvpWSruHiCf4CgDr4HLXGIeACcg/vM3RqNbEnAllHQR3l/RV+gblDeD+62KFqfzJU53v6XYQsTD0go=
Received: from DUZPR01CA0292.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::14) by GVXPR06MB8946.eurprd06.prod.outlook.com
 (2603:10a6:150:11e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.47; Fri, 10 May
 2024 03:09:43 +0000
Received: from DU6PEPF0000952A.eurprd02.prod.outlook.com
 (2603:10a6:10:4b7:cafe::3) by DUZPR01CA0292.outlook.office365.com
 (2603:10a6:10:4b7::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.49 via Frontend
 Transport; Fri, 10 May 2024 03:09:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 DU6PEPF0000952A.mail.protection.outlook.com (10.167.8.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.18 via Frontend Transport; Fri, 10 May 2024 03:09:43 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Fri, 10 May 2024 05:09:39 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org,
	alex.kanavin@gmail.com,
	alexandre.belloni@bootlin.com
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [PATCH v7 3/3] classes: add a systemd-sysext image class
Date: Fri, 10 May 2024 05:09:37 +0200
Message-ID: <20240510030937.3789910-4-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240510030937.3789910-1-johannes.schneider@leica-geosystems.com>
References: <20240510030937.3789910-1-johannes.schneider@leica-geosystems.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 10 May 2024 03:09:39.0993 (UTC) FILETIME=[7F3E6090:01DAA287]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000952A:EE_|GVXPR06MB8946:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5459a50a-4f4c-4c45-29a0-08dc709ea3cc
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|36860700004|376005|1800799015|82310400017;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+cl9uCKGv9AFnDrXUC+uk614Tw9x4fj/Gw5UWOFVXOidVxy+sBLEmzH+bcTw?=
 =?us-ascii?Q?FD4E8Cqgd90908AUCxjDjowslLXpvuAGrj0EO5LolUlGF6iTHigvsfbod8A3?=
 =?us-ascii?Q?IidFnwtM26ftd7pi4e4ASS8HNMj4wpIF9v9SiB7iOqNSas1f5IP89Ae1oGeB?=
 =?us-ascii?Q?8NHAcemj8bI3XA3dhFpBaAk3D28iBRPsdm0/a3pfRlyohTbdOfO8s9WncXsc?=
 =?us-ascii?Q?uc6nSP7gNajFCDI9MczEO9Zfcru7k5OEfFtxJrXTXlrWmvFbfLDuJIIRXdsr?=
 =?us-ascii?Q?4kYFi0SR0g3JLjSP1nC0yCXgtssC5Dlt6EywEyXkjz0c0M6wJLtGUx1c2sXH?=
 =?us-ascii?Q?AcTxGlo8SG1MYRihkmV0905rt0albqCvg5MU6GMshO08dsR1FgSes1wDWRos?=
 =?us-ascii?Q?YS8h5GwKyRJzkKbR4XUwwXDA/JxMb8Y8C7ucUTuVI/SAbDjGGbyFUJc+ybph?=
 =?us-ascii?Q?yn5j8X6RybHGiT708FBXr1tC3LW8FaEVBO8omgCcljZow/40/x9YrTwDnKwj?=
 =?us-ascii?Q?RuDJo2lCfAZgIEhgCJ+gS8J0FDkDlpYX6BWVayrTptNHlpQu6jo0to3eGh/H?=
 =?us-ascii?Q?0CbAFVPzI57sqpqtaiPDe6hfhRc4jN84g7AswR8DVLDt44uMPuAR4raRPKds?=
 =?us-ascii?Q?pH8ssGIQDyp3JJM5RCS+PTE72LXyP1qQc61LBMHhjJbk3vvz7J5Hp4XQpGcU?=
 =?us-ascii?Q?9Bja4yzetOhUKFGM70VfABGvg7zzjgTOKyRRPyUZa8aABG5KyvDWX2jIe9FW?=
 =?us-ascii?Q?dUfBjJnElRxY90zLq0YGdkwpX+xw0/s3nFIYDEDqyg4PlR7EyzDaxvUldV4h?=
 =?us-ascii?Q?uvbvLEn88l68aB7KEviWOBuK6K4d4tgphTgUOg3nqvzBInUqRcyShJps4s3b?=
 =?us-ascii?Q?MvLNLpJ3aEWfH3DxQZyAI7o+GonCNOEwpphmqCF4LVpzANL9O/JeppxPECR7?=
 =?us-ascii?Q?f1INSzezM88KyjhRhZXUvcpjEIre16HnrF03aDyYLlPzLkICXaomTgg0/pJL?=
 =?us-ascii?Q?7GwHR3fgOznDO4PudgCkSZra+lBDjditxEszVwL8Gctv/OVfRMxHxkGG1+0Q?=
 =?us-ascii?Q?VTfydm//nBBwd224ITJJBYm8JaCr2+hjV3KsekZ5SJaYo6iD51lPSjGntO0V?=
 =?us-ascii?Q?3iyIaBl5CjV859V+cVfxA4Og1dVcUxlfJv+syGdGoRrgzLZoc/GoU6E6bp5h?=
 =?us-ascii?Q?PGsGizfwG5RN63yOcwd4cn+skkq3hkQAezgw0ksVJDO8v831LWBCK1fQzlR6?=
 =?us-ascii?Q?czNM0gsYe2/cLh+j2Y7b87YbWB0ou34HBxcTGys2VSfLXGpdm52JPlSuJ2Uz?=
 =?us-ascii?Q?oCBor4BaQXC0zRA+h+J1n6iq?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230031)(36860700004)(376005)(1800799015)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2024 03:09:43.4352
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5459a50a-4f4c-4c45-29a0-08dc709ea3cc
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000952A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR06MB8946
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 May 2024 03:09:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199190

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


