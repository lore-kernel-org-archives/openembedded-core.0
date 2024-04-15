Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F49C00A94
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 06:02:15 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.85])
 by mx.groups.io with SMTP id smtpd.web11.14607.1713160930691139183
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Apr 2024 23:02:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=nzswLFwl;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.15.85, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kjnpvYpzJsH4+8wtzmeoM9LldZs8N7/8SEuflVxlhFPYgyHPDOAOtemxkdDwBsV4fBwYCWbjSyCnKmQ1eD8IdcG8uS9pjd7HpLBZbIawXt4VVXhE5QpJ4pTV+F77ZFsyeJOdaYpzM9Ay9WhPS/YQZA12RS2uVvjfHKA5hwWpDyo3JHkmRSCdWrRHUNr1Zt6tLcWKGHSRuQ5lJMb8N+de262++H+XgQOTasII82Oe1rdHXVJiBdp3WUNOURnG2FNekbHNXJZ3EsF3kZMJbJcTeqwiNjQmNPQ+kbb2AJbNhb3qIIgrcXZnUA0+geHFafsAeYrDV3LGB6/8yTaiBLIWBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZKtblxxRrANVU8PaI2XIgyTLDwMaOc+7yM+MzGuoNPg=;
 b=Pxgxyrl6S+iEKIV/F1nj7Y9dvadrWhlK75KjhHcgpdOgmlUr0YBdI9I/9clkTu+Ciwy1QGSYxK7ocX7V4SKXIY8VA4+T77UsTRC/hrtvm2HXLwboScwG5QnrsSSF3yBBv0jGgQ1YrG9U571KRW/tQb4rSQLnzehv0G9dTJBgD5jj3/k4sPhBJrhnTWlt+tzqZ1PVkT1BVHWZtpUzX3YTYUzcm1IY7tgmlxlPTHe33HGEBXEdWiy0h468bhPKV7d6h5gz/O69+DS79gloW8wfcvTIurcASDMx5jONETvDgLv39ZAa+bEsC8/nCpNFDGhifSCu9EVXJln8NtWbOnmS1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZKtblxxRrANVU8PaI2XIgyTLDwMaOc+7yM+MzGuoNPg=;
 b=nzswLFwlv61IKNq2o7I5BzcWqpS42x3Eb/QbDz6ViEJOtEbaW7EMtD56spIlKvlpw+s96aOJ2g0L1uhhNyQODRt+BM35U16z+RTbm/UowR1uzBVkmJQMAlW2ODBM9sIvG/LyoOta7ulJflr4v5kJSxn0qgxFz3Qf5/Lr1gCkHUU=
Received: from AM0PR10CA0029.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::39)
 by AM8PR06MB7025.eurprd06.prod.outlook.com (2603:10a6:20b:1dc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.26; Mon, 15 Apr
 2024 06:02:07 +0000
Received: from AM4PEPF00025F99.EURPRD83.prod.outlook.com
 (2603:10a6:208:17c:cafe::9b) by AM0PR10CA0029.outlook.office365.com
 (2603:10a6:208:17c::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.30 via Frontend
 Transport; Mon, 15 Apr 2024 06:02:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AM4PEPF00025F99.mail.protection.outlook.com (10.167.16.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7519.0 via Frontend Transport; Mon, 15 Apr 2024 06:02:07 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Mon, 15 Apr 2024 08:02:06 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org,
	alex.kanavin@gmail.com,
	alexandre.belloni@bootlin.com
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [PATCH v6 3/3] classes: add a systemd-sysext image class
Date: Mon, 15 Apr 2024 08:02:03 +0200
Message-ID: <20240415060203.2961-4-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240415060203.2961-1-johannes.schneider@leica-geosystems.com>
References: <20240415060203.2961-1-johannes.schneider@leica-geosystems.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 15 Apr 2024 06:02:06.0011 (UTC) FILETIME=[719FB0B0:01DA8EFA]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F99:EE_|AM8PR06MB7025:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0479f1ba-70e7-443a-a5d9-08dc5d119536
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	T48EbrsT4UnSfi1/ostpz60wbWKXsQ29LHKipQURmD5Fx1MoAj4oCiQxIYFcpvs2A5goZM/p0yNyC7AG8cMAeqIh4sYmjlYHX+mz2lNPdn2nmwevPqaaLvfSD1tWK4i/EZh2FSrMzaF2xT3kyKqfGtdo9UKCa3zXo6ziYNk0R+t9+S5/f6E0hUW85NZ+w0RnRWVLQzVdvr6BV6pmlDhgO5zCzKJ7S+d42QNrz3ilZdNzHwPRkCd+uJIvLgrrebD+Y95GBMLALBe2f5SRrbwFwIjpLtyUA7AuySW714FvskgwtP6/29WOc1gJOi7nHEq8niw2t5ca8i9wi0ZtYcl53J3EnzSUia4/pLOpOTRNLYUgfBFDSoibQcFpfJP4U56vgaJbuDiaTkRDaMY0/oDC0BrGQoPW0gDqkSOToZi6O0+JCcpIEeu5UT43ZZKQs3t0NsiUPZHd/HtqCl8o3UbyCrVVDDG8O/dlqkKzNE/AYeRH3thB+8IzBeCRCSNwk4TDG7OERmJW+nmosSGzYf1Qi7ZthHHoOZ8r3WVxYCYUXp2M4JiaLi6hWkNBBi7KRbqpNiN6uAmWqhAUe4lV4pKnd0z9ApFXEdgYFffUarGeQ46VdsN8cp91bdpRmWnhyXFSZ7iLJGwxSV75oC5ii2SgdN5OaRjbsuWLz4iWhNAUoYVrjm3JUmV2xnCw55cJ9Po9fg7xnyTab344RW+LObEhGw==
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230031)(36860700004)(376005)(1800799015)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 06:02:07.8669
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0479f1ba-70e7-443a-a5d9-08dc5d119536
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00025F99.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR06MB7025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Apr 2024 06:02:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198217

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


