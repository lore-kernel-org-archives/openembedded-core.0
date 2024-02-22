Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8674C48BF6
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 00:34:53 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.78])
 by mx.groups.io with SMTP id smtpd.web11.2442.1708562087891704048
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Feb 2024 16:34:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=ulqKTpFa;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.21.78, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k2UCwZ/qDe2Ohb0VGwBlj4+K1jJh2YBkcn7xcq+5KyBpjiuUOIEqWOsmcfIwOSQ8qafpbvfsE26sUKEHwtva8dzUCzeGaGZ0Y1LfrGlTmSFUvV2NEJXVFUctk9ssvpjSjEIOfd3RqJDPl/A1VxBtJVJktsu9FQtQjVD3x6cdTdcC35tQDz1wo1xpOOfWy2zsovACXbbpQdRK7bhcHsF6zx6gCBPpVW0X2LI0E4fEhXFZpNBtp0QissdW6/jdcJE2xd5Rg2LDS8ZjSF+FySt7cCFwLEDCEoawSS74W+hu5FYQor+eA05qwE07IXHdZaFWFS9aLy3CPDDsb+R/pL9EpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VT/bLJqgmzWv6IKJfMdQ7qXWSVAqP3YMv5nVxTLSqjg=;
 b=SfP1BErr7dcmhvWp28glMz31YdSKVVHiVCFFvQLBgHayoMhLnHiPfZj2OjjdNxhKx9QWGJafeBT/Dgxhx6Uk66R7AMy6+cRLJ5GpAiU42XfIamgKYTB+WdEA0ewKtnmVQ9gZPlsncSRsbSneX8vtSj5Jub6slx+SjG37NqAIYIqge0EPLmMoxKirlP0pLdaCgJclX3qiaqtGGMi5o4sUiegMzozGSMdOL/tOSCM9HcpATxbu7zpO6V48kFeH2g+a5FV1X5eJzLuWPeCQGqMSbuKP8U8CDUQueSxyqk6NCvDDT68BNs6kLMddO5fRpj4LEUy+eGhSkNCA8LHT3XGifQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=temperror action=none
 header.from=leica-geosystems.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VT/bLJqgmzWv6IKJfMdQ7qXWSVAqP3YMv5nVxTLSqjg=;
 b=ulqKTpFaqJ76aTR9DBcY1f03WAOCXpW0H9fr5bI6Bjj0QS53yHgzVCgc5TjuPR4Rp3izM1RWkP5s+LmwIC+WVnMQgv1mJOoMVFnjzTQ1c/xnOGbzpDM/s5SBNKmQI69Qa6sDCjDZOwNeqIbZ82uDK0hEkGOB35bjH++r8v6ncQQ=
Received: from AS4PR09CA0024.eurprd09.prod.outlook.com (2603:10a6:20b:5d4::12)
 by AM8PR06MB7666.eurprd06.prod.outlook.com (2603:10a6:20b:360::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.22; Thu, 22 Feb
 2024 00:34:44 +0000
Received: from AM3PEPF00009B9E.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d4:cafe::1b) by AS4PR09CA0024.outlook.office365.com
 (2603:10a6:20b:5d4::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.43 via Frontend
 Transport; Thu, 22 Feb 2024 00:34:44 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=leica-geosystems.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of leica-geosystems.com: DNS Timeout)
Received: from hexagon.com (193.8.40.94) by
 AM3PEPF00009B9E.mail.protection.outlook.com (10.167.16.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.25 via Frontend Transport; Thu, 22 Feb 2024 00:34:43 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Thu, 22 Feb 2024 01:34:39 +0100
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [PATCH v3 3/3] classes: add a systemd-sysext image class
Date: Thu, 22 Feb 2024 01:34:27 +0100
Message-ID: <20240222003428.1585775-4-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240222003428.1585775-1-johannes.schneider@leica-geosystems.com>
References: <20240222003428.1585775-1-johannes.schneider@leica-geosystems.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 22 Feb 2024 00:34:39.0453 (UTC) FILETIME=[EB7818D0:01DA6526]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009B9E:EE_|AM8PR06MB7666:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: aea21e3c-31d7-4532-d3ab-08dc333e1020
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EMhtw3u3sjtOjfsm7jTACwb3IYAGBmE1exIWEGSTAzsxMMrsWQU0aL6AiGIyq2WLhn/8FajIcyqZKbYm//YvFvt8fQPV/RB+8W7Xnvf94qS1IR6MgZ9RVC5kwsQ4aO8xodZuu0WICWcjHpHmIQFyOGsoJg19jh+74b3AxV4WbublKtUZ44xkNM4n2yioeJD/J0Iukx5KLgpl2CT+PMh7m7oZPmUGDUAIxBNYhxfyEc4SHtePPVYtRHWYGiyH9NzGBAn0UMaq6Ut1WJvOWHwwKgYQ/nKvfzMJUFMMOylQhjOkDVTv/hhkLcRpT5WtfTFxwvp4KWkJi/80QFiGxLhVX0/IjdQ/FPxv/nNfWGnSHLpnM7Tdn2Qfpuk8ej6vU9z5PJjj/bd/t5s46eeMHN4F6l55rJAL/4KrVAbZRTjlgN4g5bOWmkU48qHx/I9yj6DvmyUnkH31Z7Jhbp2XT+W0Tr5pbBFqNCqFlexoFKleba96VHUB7VD6ApniYeetmglQxTXXEkIrgeDzsoyjozBXoWGpswLUVYp7kHx7CCnxa3eeyKWDQeDWAwAY2icvagUVtrYEBoiW2FNZTXktdIrJht8mMG/qnMl6VzQ70RBAGwbH1afCyLjR5A2CFVTTgUvj9T89R1fY3sfrBnoy5mqVgA==
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230031)(36860700004)(40470700004)(46966006);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 00:34:43.1031
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aea21e3c-31d7-4532-d3ab-08dc333e1020
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009B9E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR06MB7666
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 00:34:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196003

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


