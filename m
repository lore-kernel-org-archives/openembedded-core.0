Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0385C41513
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 22:35:15 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.46])
 by mx.groups.io with SMTP id smtpd.web10.7727.1715812511361556157
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 15:35:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=KAIWjYDt;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.105.46, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NTf6z2tufIuNyPJZx5iATf7zE6uRvcnI9aBQhR9Mv/Sbtzy3CHmGEs/Az3dAgXQZ0wVBl1baWsvmqicXkbm+40Fki9mRSNMx/D9qcPA4yUtJ6VaB4SIL71A0RWy5ZYhcxXx6dNyN8wRqzCh7vaBqLSFXb3fxH1PKUAVHnW868xBcC1HopMI0SvOYCdv8ZAb1+E4/tcGFYft5xQt/j9aLA26GMgKDY5dim0NMgCvb5d1MNdhwfVfgQ1pHRaqePogd8ISZIqwHMPMJbJbs6VesRYw5cXLJ7KlHp5UgUpqc3ToqqdXAecM9oFWAVPBiCAsiQuVsLIT2Y4fPR8oHBfW8iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZKtblxxRrANVU8PaI2XIgyTLDwMaOc+7yM+MzGuoNPg=;
 b=KG2GmnxPPH5KXfIkBShVKixRltfPQWsNi0LRJd9W4s3yyQRtU+pYJ7v7j0sHR6kwEH82Byu72BfY1daN+qKfSrEO+Ds98qsQpM0tY1qrejk1kQydx0D8I+BETL6tM6f10VhruHDL2EH+ZfdHoi8r4vmvsrT37pBntxtFA4FAWERlkHBVvvWZ93vd2MVbjnMUcSzLd/jtrD2XCQHHO9Yji9JzWRzYU69l0uYmhC4GlTg5S7QZonuyqLZdMN+l0OMA825iYN+A/a7C0J6R9YJx14iOz9udy300cBIcmBpz8YUDHGdmvrVRxDWSrKokzBIZiF8torgHKD93Oa4WsBNVdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZKtblxxRrANVU8PaI2XIgyTLDwMaOc+7yM+MzGuoNPg=;
 b=KAIWjYDtHwXGxDgIXGfedbHT6vdVFiPG0Y/sRSwJfBJEaNjFKT2SXmKl9JJi0dB76k4v34lPtkSUVnkagJcHXEZs2pynfP1gR2+bCTUtbzY4xiTHuCQCTNkPSnVnZbQAKDYSq/G3HXP7f/Yf8SQU5dQB40Kba0JkEM9Zhds3ds0=
Received: from AS9PR06CA0539.eurprd06.prod.outlook.com (2603:10a6:20b:49d::28)
 by PA2PR06MB9353.eurprd06.prod.outlook.com (2603:10a6:102:402::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Wed, 15 May
 2024 22:35:07 +0000
Received: from AMS0EPF000001AB.eurprd05.prod.outlook.com
 (2603:10a6:20b:49d:cafe::81) by AS9PR06CA0539.outlook.office365.com
 (2603:10a6:20b:49d::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.25 via Frontend
 Transport; Wed, 15 May 2024 22:35:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AMS0EPF000001AB.mail.protection.outlook.com (10.167.16.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7587.21 via Frontend Transport; Wed, 15 May 2024 22:35:07 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Thu, 16 May 2024 00:35:04 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org,
	alex.kanavin@gmail.com,
	alexandre.belloni@bootlin.com
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [PATCH v9 3/3] classes: add a systemd-sysext image class
Date: Thu, 16 May 2024 00:35:00 +0200
Message-ID: <20240515223500.3464486-4-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240515223500.3464486-1-johannes.schneider@leica-geosystems.com>
References: <20240515223500.3464486-1-johannes.schneider@leica-geosystems.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 15 May 2024 22:35:04.0258 (UTC) FILETIME=[216B3A20:01DAA718]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AB:EE_|PA2PR06MB9353:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: bdd730d5-e403-49f7-e226-08dc752f45d2
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|36860700004|376005|1800799015|82310400017;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ehtRLrleIWaXOVhWkhQt+gr7x9FPgTKOJXVzA4Ta7vOYfIKumyVusXvBCpQG?=
 =?us-ascii?Q?8ArzDpIzDt9SJ4I+eqtOuKL6TPtUMajZ6vS3kfjrYJK0p9Zw76XX2iBwN3kz?=
 =?us-ascii?Q?OqyDqgS53S1X1U3vApb4S1lDLnPEllLx8wfFXLxET4QABS4nqUI5gIY6cYA9?=
 =?us-ascii?Q?H43/0hWpdg1ggie0HBvpCRMsPoW1NAgs2k98Zoz5MbA2lrmvKqJXj19dj9Vh?=
 =?us-ascii?Q?iwGzxhBzopglJjcW5pGaeu8T4lDa9scNue4EaseT5yhwa4h0jip6mM6WFQ3J?=
 =?us-ascii?Q?BAxmJsGMmp3yEnIpQv+qSzlD58/uhLyPGQrQVi9hV6it0Jtgxs09F27lxVIO?=
 =?us-ascii?Q?k0vOYrQ1FpJNWRMR7N6qg3k7Cb+eWm8IUFeCr38EfluVvcef/8VLcLUTGN5Q?=
 =?us-ascii?Q?DWpeNuAvfWRu64YR+3sB4tJvj2sJcK0A/BiD5Ofdzq4CKNOZqbRAvFOX3iT4?=
 =?us-ascii?Q?dpZgjKN5aFhieLtKzczRmUxxDhIZez5NyKdAxIhghDJxcXL2TkYx14IOow/F?=
 =?us-ascii?Q?eMcMMwYpDXHAGEcNjvN4DcimNaHZJpAhhSLB+Oii+EfjF7mJ7WzlyK0raWop?=
 =?us-ascii?Q?nmq1bhX8IqyDbVWVFMwwk0hhiaNWSymctXFpE8n45TU5kAfE76BDbxG83Byc?=
 =?us-ascii?Q?Em1qljArD3aXubW75KRGch97WYRUnl0GbKOxCU7Lx6l/Yo3mBe2+8fnewWpF?=
 =?us-ascii?Q?Hz0nLkQtDo6A2BNZKsmU7pCJbKZScByCn19kfvIZ10NYuc4EEK9YABGwtGBP?=
 =?us-ascii?Q?x24UYRB2DlDy18qr8e84Bmf95ITUThYjwMyPjA8479INpAODCnqMw3iiVf0a?=
 =?us-ascii?Q?pAk3xWqGwRdr/SlaecTkGyeQ5hpV2GDnpA/8iRbfSvr+2B91GIpDrMmLy6QE?=
 =?us-ascii?Q?1JsC54kcst1Rwz5SN8Tq2FEX8qeXFbVubjA1Cc0Hx+0g4/Jlotfptkm25Ld+?=
 =?us-ascii?Q?5JnO4in88o4dLv4T9wWTGtDGIQNZJK471CYtVtZC+ij+CNraizPS4uxYYor5?=
 =?us-ascii?Q?S9SYy9/GwWuObuCMsiwT5mbcdVqQ6AHCL/xIaS4YY2zLeKI8BBfj4OHRE7oU?=
 =?us-ascii?Q?ZnR+j/fBPlhg2wZ4NsObXcKQmNRGr4/zlEMN4FX8y3NZYpL/stDtSW2amTio?=
 =?us-ascii?Q?foaL3tBU0FiCYaVeFMAbVrajsHZ51PU+btBFmL6c/KMFDUZbo+mD+vpE9mc8?=
 =?us-ascii?Q?JgH1nPCoaDCfgcxIWuJXCTmkFczQFUZzrNt/QruFfrwCKC9Tdn9fSLAZ1LoE?=
 =?us-ascii?Q?puyqzSOBN2d9zfeSLGQrDYi/V9nCqnSy/MqnojLknnpImYy+CfyS+RNzHeTj?=
 =?us-ascii?Q?gZAmsYyFTfs0vYTEXH1sMLSv?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230031)(36860700004)(376005)(1800799015)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2024 22:35:07.4191
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bdd730d5-e403-49f7-e226-08dc752f45d2
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001AB.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR06MB9353
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 22:35:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199433

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


