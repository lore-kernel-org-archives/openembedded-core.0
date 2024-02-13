Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FAF8C4829A
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 08:58:13 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.75])
 by mx.groups.io with SMTP id smtpd.web11.7658.1707814692600215238
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 00:58:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=O9WzHfm0;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.8.75, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pg+eetaKhes5aiTMyr0kRUbra2+UbFaxnfdVLCDLYkvO+7Rdki7UuCvBpOxJ30wt2ZvJZG6ZYQ1a5xMTdop0AHECthFbBhx+fp3L2ezh6e3z8b8F0PJKm/8FM1HpoTRNxqiKbnZlAnhCcUqvfT4fI/XUfGeSX4XUENdfXv9MWAzvjtnv3k7SMe2s3oeEfxXJ706lddc6DOxTqw1gqRXzpea4TCiqikVsZDqULMYU7F+vIYschuYi2xuxrRjAyvrqevfjwm63CthBjPSs9pxta+tPbHql0XUTnCtaL3iihmlqZZgjSaiE/A4byhvZobmo9IqRvzgah9u91zN6qKN31Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AJ0WAnsjhH+h4LyJgg8WEe1/Ol3fR4tp5Y9hYEtZrd0=;
 b=c3SDJAu6C5xOVDQGjY33FHaUnQcswO3vUG2/E1S7IKTZ7yxSXhVSdgBHsuceIzZnAVdGxhwMJVLAxmNm0mdWAhs1lMbRHUTWvqn7rpKBm7TZQdgm3AeA0p5X3W4gq+NtwEPrDl7lcYHPnEVNa18SPtp9duvx7YZqR0kNHsCIzQ2g796jdYFPVKStFk88DrWifPyKfs2x/gMKStAGK4xV9qGsjRpxT89hCCRG4gXHq7H3mv4WYLKl835q15Ik+gI4bHGQI2oGLmlZsEIT92spQb22C0BtdutswJxk88kHqYdjFTe85K4I8gzcTegXKaIL3opYX6Q8esvqYpRYle+/iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AJ0WAnsjhH+h4LyJgg8WEe1/Ol3fR4tp5Y9hYEtZrd0=;
 b=O9WzHfm0us/kcaVRvLUSjV3nZcyIrcEY8V8+SswIlrAHx5Jg/7c35yZVRznyUN1BwSCb2EMghdEFmMpELYOtqv9QxAZaUYx5/A/YMcrrBIt2jlWn81nMQI/7no+c8YgMYPuVPgdC/CucQmU956YeRditZ+H580BYCQNKiRGFCB4=
Received: from AS4P189CA0008.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5d7::9)
 by VE1PR06MB7168.eurprd06.prod.outlook.com (2603:10a6:800:1aa::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Tue, 13 Feb
 2024 08:58:09 +0000
Received: from AM4PEPF00027A67.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d7:cafe::af) by AS4P189CA0008.outlook.office365.com
 (2603:10a6:20b:5d7::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39 via Frontend
 Transport; Tue, 13 Feb 2024 08:58:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AM4PEPF00027A67.mail.protection.outlook.com (10.167.16.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.25 via Frontend Transport; Tue, 13 Feb 2024 08:58:09 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Tue, 13 Feb 2024 09:58:08 +0100
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [PATCH v1 3/3] classes: add a systemd-sysext image class
Date: Tue, 13 Feb 2024 09:56:57 +0100
Message-ID: <20240213085658.170917-4-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240213085658.170917-1-johannes.schneider@leica-geosystems.com>
References: <20240213085658.170917-1-johannes.schneider@leica-geosystems.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 13 Feb 2024 08:58:08.0343 (UTC) FILETIME=[C3A72670:01DA5E5A]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A67:EE_|VE1PR06MB7168:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 202ae336-5622-4b04-b0c4-08dc2c71e68e
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UL9/avNltZUYUM7pHOu5lp7QQN8HcFiexX/8vHk+6dpCWbWo7l2R84mTaVmunsYn0PRT1vvljgmh5+MdRLB7DfF0jjsywWP0Xpe0jatfuI+K22FByrRVwbg5GKQ7cnJLaQzhJycTL5keAHaBmTLW+tldSc3WX1cQT4amSZ+FGhakAj71u3aGz5+1As9wbLixidIAN5NDl0UFRolpm7ACcmUhmnB/mbJDtZb6Fpw2Uo4FFlZi4JuiNUFoueba3n7gQpMdtlPDK+o+d1eYy0fTsotPUFMEU1GNFhy71SZwWd0LHrL9O/PJYszQpnnUUBI1kdlyxoEFumA+nR5yETEds9eIA2Sbg6qLa7tvVhvevvGUlJpquZ2KHbwl4YMgxqaikCOZ9yxer+uOMsVJW5SbowP+1HE4mwkZg42yTEuG7DJOxyQtcoP7JDt6F69ctklbe5eHGWhiivgKVBeFVpMl+bZ6IkODPr6pWh/lKTboQJfMZglUh+dUIKntHIEKedrIvXGmg9cxzA2gs9JCc5SV81IinXwpzQKlf4p1mzU5hIy4+M6JFf7X7+7YKMkvPq5QNSNFqCnX7B9qJ8NNVbFI2w==
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(396003)(346002)(136003)(230922051799003)(451199024)(1800799012)(186009)(82310400011)(64100799003)(36840700001)(40470700004)(46966006)(2906002)(82740400003)(44832011)(5660300002)(356005)(86362001)(81166007)(1076003)(2616005)(6666004)(107886003)(83380400001)(26005)(336012)(36756003)(6916009)(316002)(70586007)(70206006)(4326008)(8936002)(8676002)(478600001)(966005)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 08:58:09.0492
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 202ae336-5622-4b04-b0c4-08dc2c71e68e
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A67.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR06MB7168
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 08:58:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195375

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
 meta/classes/image-sysext.bbclass | 38 +++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 meta/classes/image-sysext.bbclass

diff --git a/meta/classes/image-sysext.bbclass b/meta/classes/image-sysext.=
bbclass
new file mode 100644
index 0000000000..10dcb267a5
--- /dev/null
+++ b/meta/classes/image-sysext.bbclass
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


