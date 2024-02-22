Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95AECC48BEB
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 00:34:53 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.50])
 by mx.groups.io with SMTP id smtpd.web10.2447.1708562087757387267
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Feb 2024 16:34:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=l1MuFt+m;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.15.50, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TRd0kWWEOyegL6Z2epCI3vT2+bmxpN+WACugrxzH/1TL5bt6Vl7LX1rOG45Z0bzQWelhF3bL87x196Bww/Q4hsezRReiu+9QdIhBcZWql+FK4RAMYfCuNQtbJw4T6IHCZ6VC8pWPV2bcN3kvP+EMyjvenn2x3oQ3ZGVP+rm5FLhs6LGmrIElWgsk2sraHgbZmlm22FokYPkKU6dLMkouRsst36zuRPIdmPN1agoqNYdcfIu2A4Sr6U6Ve+Vfyw4+MuitC4taJV0mbliMKQMf6XXh7Wi9rb7p+c8MXv3j13H0BD0VTOtdDZurzwI7iiSuJBx4JpuM2Ymz/hxqgOWg1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VT/bLJqgmzWv6IKJfMdQ7qXWSVAqP3YMv5nVxTLSqjg=;
 b=ch9soyhTuRDQVHpbkAJH7ET1ziCatL+VRcyPblgnqoMwtKGXAcYBxBDU53WqnJtCaoqSxBRnKafy45VugJKrIjHjaFFYMTcp+4QFND5ybKR7etYBo5jBzW1RwZ+jxxIyuzXObsZ9GLFd7RpCf0gHCMXDGbn74wX8Oa7aATdiJIq6ADCvsbtbQ0ywPYlcCgCEOFlma5Dh3vXpl6WxjQEsGARPdA92XJwYWL+NerkX875OA8EzgloPQnJ5od7nHRPxgU7vnn64dw7rbxolUdaSTInqaXg0aUnRgB5ihfUGH/tq8mSO/I9dj6+CCMqDpP2SGLaSnwVCyBkrw3VvvDXKPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VT/bLJqgmzWv6IKJfMdQ7qXWSVAqP3YMv5nVxTLSqjg=;
 b=l1MuFt+mGnicPKGBn4qWwTKb+qrrGOoRyCGC+ZX3SYNHN+YMfJJanmplENCCLime4fJdDlcBz3sTkp6gxAgN5uiOzijyCPBrkP6zGyBvdvfC/m8z4m7DEvg2G4rxNe7PJVvlfJq9Hl0iAFvN4LOK9gX6gumN0M8e8ZAgIirG2Hs=
Received: from AS4PR09CA0028.eurprd09.prod.outlook.com (2603:10a6:20b:5d4::16)
 by AM0PR06MB6532.eurprd06.prod.outlook.com (2603:10a6:208:19f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.10; Thu, 22 Feb
 2024 00:34:45 +0000
Received: from AM3PEPF00009B9E.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d4:cafe::63) by AS4PR09CA0028.outlook.office365.com
 (2603:10a6:20b:5d4::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39 via Frontend
 Transport; Thu, 22 Feb 2024 00:34:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AM3PEPF00009B9E.mail.protection.outlook.com (10.167.16.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.25 via Frontend Transport; Thu, 22 Feb 2024 00:34:45 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Thu, 22 Feb 2024 01:34:39 +0100
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [PATCH] classes: add a systemd-sysext image class
Date: Thu, 22 Feb 2024 01:34:28 +0100
Message-ID: <20240222003428.1585775-5-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240222003428.1585775-1-johannes.schneider@leica-geosystems.com>
References: <20240222003428.1585775-1-johannes.schneider@leica-geosystems.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 22 Feb 2024 00:34:39.0453 (UTC) FILETIME=[EB7818D0:01DA6526]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009B9E:EE_|AM0PR06MB6532:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ecbe85e7-6752-4887-da2a-08dc333e114a
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mhQ2gB/BFQKI7pkRgpDyS1NC/uEV+IAL1zJmTHVmeJqp+NjxRfCo9o2A+gQJm9OyHedq7BbGpehA4wRsQl2Q9umsRScqugOCKZ03d9xpQRlkr6uoyvcSt978KcZ2h0GnEE0zQoJlm7zIAm5uVwjH9TzT0w61esxvdRM3FFdaGTBTasfLPWNhXtj5Axy3t2dIHNnPOiqipjeW4b/tcKrAA4hZOw4CM8W7lrxrXXZXLzDpUwPLi4nspL3bOagnzHPnLErrWaaqAW61XwPy0BLfOQG8p5qul9/0iy7qZcyUt4rwR0mxMpg506nSN/FRszErGVDfewXouaqgg2JLIWvg+Z9yHtWgodO3lTtmxKuvNAD/7aNaT8eqHHDTSAA988+M/jLxx5xH22lFpjQtO+iEqu+yLCi9wrAq70CEsKJHuo6yoFswZuA/t1R2hxjN8EWN8GSpdIsHty6GtXBwtP1fU3wXA06P6wuD2YYs5py07LmXE1D9PCtEehHI5KhBDFjhAP/Sf31F2JYvKEZEwWWW7IZQNvQ3WmkkJnGan7qyFmUDktDUivFzh26ctF4asXtzcraWmAIH6vNJYsUefLvo6lulEMPaogNJ1SyZDBouAFbWrGjivvv4BVCDOkdCr+RI2KAX92fQ6Q8LYtfNPp8kDA==
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230031)(36860700004)(40470700004)(46966006);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 00:34:45.0562
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ecbe85e7-6752-4887-da2a-08dc333e114a
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009B9E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR06MB6532
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 00:34:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196002

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
 meta/classes-recipe/image-sysext.bbclass | 42 ++++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 meta/classes-recipe/image-sysext.bbclass

diff --git a/meta/classes-recipe/image-sysext.bbclass b/meta/classes-recipe=
/image-sysext.bbclass
new file mode 100644
index 0000000000..012db83353
--- /dev/null
+++ b/meta/classes-recipe/image-sysext.bbclass
@@ -0,0 +1,42 @@
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


