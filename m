Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7C4ECD1296
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 07:18:46 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.56])
 by mx.groups.io with SMTP id smtpd.web11.161163.1712733519017810366
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Apr 2024 00:18:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=M0EezinJ;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.6.56, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E6r+Gp5UmHgIQnTXxgoptthbNxMjivXj5ZrRXeAKH66PmjzJMw6CQ5v9Wni4u5NjSXZY2TGJOx/o65YIA+SMS5+/4WuAA9QKzi5D4cyR2VdgCl1b33MZwyuGTJ5z9TkUXazrdedvZO09D8kmtNoPMAyX7eQAmO/ABQwpzgSqeY0+BqmMy0YZRGlzt34wMewF7hAD8ZbcZiDHcfS6LVlmjcx8YuWJ+K+Zt8zdqh6MvZad06O6QHqYH6plB6ez8dX/ad+TWVxg3lHG4n93n44N1fD42gEGt8ZcmzwhbfPMoHnnTGUKBJgIjLeeXtVbmcxbONiPg95+0Q6GYL41UaEZpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZKtblxxRrANVU8PaI2XIgyTLDwMaOc+7yM+MzGuoNPg=;
 b=OMClvVA9sVQ5Dpj2V9wK8yi33O/G+4euCJspLbp+oOico1uzr4EKOt0qthe1CqSvs6MlmegjuukvbRLUO0OAPhzs1eywqEjXXd++SNPksMAXjlm2G6PZv+6orLAKgMSFvJ3K8xDTBjLzOgzhT/S6YWUpL8cE+yHrKe7gQJx1+mSvoTXve6j1Qx57HMY8+fwyL7IB1JMa1H96HfFOJM6jcHha8stUE7q40q9YdumWvPD80lru5RSWE6h9aMj2pOIN9dh3kOuM62lCsu/OSChaWJGPjdPHszHxCt/bs6yfU4Q6u6kR1a7w2qg3AFObGYGhq46awUKEtvXHJ0EZa0S/ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZKtblxxRrANVU8PaI2XIgyTLDwMaOc+7yM+MzGuoNPg=;
 b=M0EezinJNYK7X3yNVj4PMxfRm8iL3w+Osti2LUy7vsrflZHDvNwEjjsVJbfZny3ceFPjBIYn9zsTgJIpeH4Fn1sOuyDp2ZEN9gR0hwpKrewjRb86T8huHLrTZwYu02W/LXBx8cIUESo+K8Bfs3Z75L6zlBkZC/ia0rVRHWxTqAI=
Received: from AM7PR04CA0005.eurprd04.prod.outlook.com (2603:10a6:20b:110::15)
 by VI0PR06MB9558.eurprd06.prod.outlook.com (2603:10a6:800:235::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Wed, 10 Apr
 2024 07:18:35 +0000
Received: from AMS0EPF000001AD.eurprd05.prod.outlook.com
 (2603:10a6:20b:110:cafe::60) by AM7PR04CA0005.outlook.office365.com
 (2603:10a6:20b:110::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.19 via Frontend
 Transport; Wed, 10 Apr 2024 07:18:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AMS0EPF000001AD.mail.protection.outlook.com (10.167.16.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Wed, 10 Apr 2024 07:18:35 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Wed, 10 Apr 2024 09:18:32 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org,
	alex.kanavin@gmail.com,
	alexandre.belloni@bootlin.com
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [PATCH v5 3/3] classes: add a systemd-sysext image class
Date: Wed, 10 Apr 2024 09:18:27 +0200
Message-ID: <20240410071827.4099903-4-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240410071827.4099903-1-johannes.schneider@leica-geosystems.com>
References: <20240410071827.4099903-1-johannes.schneider@leica-geosystems.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 10 Apr 2024 07:18:32.0608 (UTC) FILETIME=[4B621A00:01DA8B17]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AD:EE_|VI0PR06MB9558:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 78ca5b2d-eae2-4411-8010-08dc592e6f9d
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Q10nqnC0uWa9LeWZe33x536heUz6ONTSIvt3URqmuEJtk6PFczwSpwFsH/tRdk6mtByviDOSuGN82e/6XoWW0vPzUzs3lFSXWc+fKu859+efQo2FhZfTta6+yO+rFXWHyzzMm+gX5AgZQDNPur11wvz/XuseD4Ws72xuOBgFRahfQ2EaFV2CGEvHX1GzXkeOtt0K7eUZqGIS8vL1x5qIlOeTUVXdf/YyfJ9ic1iKBDwBt4M/pVxEMHHoxCXEvCpcQFSrSiRk5Xdd+mpmHYhXpnl7JmzUPlVOotWO0Kcwn7w1yibRR9DLULvX/6Qwl8aTcIRl3wBD4yRI0aFiuiIsTazdH28O3f43fenVRuEtvEKhdqQpTMKQiuin29r1P7xnzwy2atTp5+iyzwjJDg9wi2A2Gyf3+u1OusLeBxlfho2Msf2MlaFSD8niuP/Sxz2h4kctcFNU3RTn7YVZOQATwPNcM4dLcuGmDeTAwVtZ5Dloq5zpFUf9u0/44ZfK8YEKy1RGj09ZRuApo2q+wjiM4LMvKBRF3Fvqdz0bGnLnl8TL4kkPicItgJpz/LWf56L5QJmBljyQKEoFByTXU1nM89gA1uljHtKNRkw4fV4JRzRKZtW1SaZLf1MWmtFjO3cnla6ZmUPjyGbWCsh5BnPDTc2HOqrtc7hf4kYfIeL3ZpsDzlCLWdsmqWukOb0KgBBuVTMI7RCZbixX/Fn/gTqGwA==
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230031)(1800799015)(36860700004)(376005)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 07:18:35.5415
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78ca5b2d-eae2-4411-8010-08dc592e6f9d
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001AD.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR06MB9558
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 07:18:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198083

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


