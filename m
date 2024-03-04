Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ABBFC54E49
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 06:16:07 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.40])
 by mx.groups.io with SMTP id smtpd.web10.92489.1709532963371297295
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Mar 2024 22:16:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=KLySjb1Q;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.7.40, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=POvyNU9Z1z2hb4yfBUe+Kcr1fzB/RBaNSfUjAgIw6VkJ3LSaqZqRhrq/jO6UWh/EWMCE8H3qlrRH2Jk6SXSbIaSxdsyFkIpaHCxKErVvZ/jYcJBP23UWVR6YRXfHEFxRSXh2LzX+XIyHriFb70PxX320xkpnu2e+ScpqF3KeCCDEXKeCrMR6eZgku5jO71rIrkVM1dL/YmaynWtebtzhAirK44hlg4z6iGFB+AMtwADG7Yi0oyPPi30NTTZXSK6FnFFoW4QJzbyctYROI5O30ye3OGxPR7w8nufpMbGXC0JOTvYHA/Gy/wYzNC0+dokffHP9rWDPGpn/wmTGKlwlLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VT/bLJqgmzWv6IKJfMdQ7qXWSVAqP3YMv5nVxTLSqjg=;
 b=gOCSmXbspzfYc3IrrLLwHC0Ytb9YuI5Okr9BCVza6FdhoDpvkblHTGESo9fyj3RGRXS/pE3XSXBBdoXCo3z7RwUdl6JVV6eRmXqJuQYJElmH+65BMNb/CYAm9URzF4PGbpmxti/4T3ulZCvYg5/FH5zY9bzZ2S1jaDvUnh2jxDhfC3EqaF48i8BJCJj+H0pMblF2cGEh7I+xcH5+HybdldUvPixwD/updj0+azMbao8oSWOi+MPDbS53RQ20Ooo1h5aLNhL02vZDq0MfNHzDeMxL0lJz6ZeUras6aStf0k2/u333GegWwJG8cQgYl4Zy8Idc00wozZGDOnhw2mTpYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VT/bLJqgmzWv6IKJfMdQ7qXWSVAqP3YMv5nVxTLSqjg=;
 b=KLySjb1Q9zyeix9sdvrEJKy2oZ0BiVfeyMFOVn7nus2FmYibSrZXR+ftkVA4oPiLBgS2jr2oYBPNxKhff6tS344k+NhnvY1MsH6EaUi30Kbxxh3SjS+uVG/QIETCrjytzEZg8ViRkXdg3rKzluqAku5tMI01QSuhS5KaRSansTU=
Received: from DU6P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::25)
 by VE1PR06MB7024.eurprd06.prod.outlook.com (2603:10a6:800:1a7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23; Mon, 4 Mar
 2024 06:15:59 +0000
Received: from DU2PEPF00028D09.eurprd03.prod.outlook.com
 (2603:10a6:10:540:cafe::21) by DU6P191CA0011.outlook.office365.com
 (2603:10a6:10:540::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39 via Frontend
 Transport; Mon, 4 Mar 2024 06:15:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 DU2PEPF00028D09.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7362.11 via Frontend Transport; Mon, 4 Mar 2024 06:15:59 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Mon, 4 Mar 2024 07:15:57 +0100
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [PATCH v4 3/3] classes: add a systemd-sysext image class
Date: Mon,  4 Mar 2024 07:15:53 +0100
Message-ID: <20240304061553.2281009-4-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240304061553.2281009-1-johannes.schneider@leica-geosystems.com>
References: <20240304061553.2281009-1-johannes.schneider@leica-geosystems.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 04 Mar 2024 06:15:57.0677 (UTC) FILETIME=[6BFC59D0:01DA6DFB]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D09:EE_|VE1PR06MB7024:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 993b28b4-b034-47fc-7926-08dc3c128f78
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1hGua2SLuQIYQqnn+f5nMaeZu+IFMoMRPHEC3xLyIXGoBjKbmvcmwsXlmJlAairwoRqnzLqo6kZYTv4nzZ6/DH2I/JqonCPkGO83iJeJVh4glCJSiQbaylsuzocUHY7fI/pGGaiWaLXFJUxzmd77M0RYSQgDActDgRHbB6kUa2igA6cxtDrAXpsTJ0oHplc2aeJL+15qQ/sXmCg1R/FOCrWaGfjsKtEcXoD+HQkkXHJKVEA0uKkTSQivQEts7OQYJbaD7Im0MZpy+g/5/dHrc5+9KSz6P8DsTb0l8kw9TlK2yIZK9+GP9yn0domrRa49M8CpdeVhURVJQ1Ar5gKbywLf6775XnjIN9lD86PkXvkjrvPJ/lbKdTdb9yIXS59OpZ1aMb/C6LL4eTBdn9U7B626q0fBfZvr0dRnXRO+Ihoto7lNT9dbXqPdeY1C4SdwzzGj5oLHk0foWxk8EakddQ5ToloYRdq+BnHqSe6c9nR8ZQ9rTB0F262+oVWEiLagjDXWOuGEJa6ZrjX4jNS9TMalcKDXl/TodlGc8Cv2L4pLrWx8b1+llSGm3JSXUpQB4QPkCP/MvvCdKYDIgXQpFbcyfalQtm5s2SEmCNULy5602X3lImb8Mga6yhjjGXwquwfPjC60JtLsLukm8989L5mKQ/d+G28c1vW8QK522NfywkhRC977z5YxggQQ2jh9XJM3ETOfx1wiozfAFFKIpw==
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 06:15:59.3257
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 993b28b4-b034-47fc-7926-08dc3c128f78
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D09.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR06MB7024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 06:16:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196589

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


