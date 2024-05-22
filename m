Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4953C41513
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 14:12:03 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.42])
 by mx.groups.io with SMTP id smtpd.web10.11159.1716387119643022146
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 07:11:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=Qd/p3GcR;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.20.42, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=obO9QQqXiflK7yK0d2+LN2CJmVytB0FoFyEkLQhYc8hZAi7yvNAb1v8ikrdTWJXwU7K42Z1G0dSepqj5ebR2GarQpN9c5K/efpXufBuD6PsomlzTmzyRsY4f0G+PCUu2w6+cMUJyqBf5RipBWcMZw37/MhmwehGsywbWfTAbuM/qX+RwLf9RVYuis6eG8WHAZlrsJ8eGcKGT4nkmvMIrvg0mdDOHSFcxaDmo5kUbIRLY3iYw9rk9k6DR9fNbHKFU3zlv59zb7KAxh96g5Pcqfd/w1xvMno3xONvRl04WzL2ryKpmhAj8ubpsAHqXoRF+WQUtpe+KnuFsytLGa18f5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZKtblxxRrANVU8PaI2XIgyTLDwMaOc+7yM+MzGuoNPg=;
 b=iQBk89v6CLNN1M5kurvdovkzqA0CrFO+avIMnFTTYm/SJRqqvXU+G0sL6Ev3STUeNxz8kSZv2i9w+YZA2BIdiR0sPJa7Vftnx6esiy8zvtHiwCTRs6fQQ4g94SZanPidNMzOd1wDmPjB8keiTymrs6XOTkWMlixwhB4xu/5+PmgqnMgnaPUZFcbTZbPfLwykKiNUKj/Jbzv8aENiLqgX28hMdE+fTBUKUcHC/C6a+C5aLEmE60+6uxNZ4/z1UlUUiJFboa+2Wk253PhyMC0sfXwB1jO3gcX9iLfLhvpqLP3PoMIRwyniuwfB6cUHm7pDq6QmdzwRINOnHDfeypJGEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZKtblxxRrANVU8PaI2XIgyTLDwMaOc+7yM+MzGuoNPg=;
 b=Qd/p3GcRB+PuS2MTbp1v7UKVstldQ4WgejUYxG9LJWSr9KBxAs4vjKXoxQtB78xjaLycCryXXvYHxIIvfd7XOwdOuI88TXJpzZe2uJ2WxciYm3qiHk+ULIafRsmh3TqinuBQSH66HxuVWDsW7TigqCw383BJACE/sYNGsSZ9ZU8=
Received: from DB9PR06CA0019.eurprd06.prod.outlook.com (2603:10a6:10:1db::24)
 by DB9PR06MB7227.eurprd06.prod.outlook.com (2603:10a6:10:1fa::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Wed, 22 May
 2024 14:11:56 +0000
Received: from DU2PEPF0001E9C2.eurprd03.prod.outlook.com
 (2603:10a6:10:1db:cafe::96) by DB9PR06CA0019.outlook.office365.com
 (2603:10a6:10:1db::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35 via Frontend
 Transport; Wed, 22 May 2024 14:11:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 DU2PEPF0001E9C2.mail.protection.outlook.com (10.167.8.71) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.14 via Frontend Transport; Wed, 22 May 2024 14:11:56 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Wed, 22 May 2024 16:11:54 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org,
	alex.kanavin@gmail.com,
	alexandre.belloni@bootlin.com
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [PATCH v10 3/3] classes: add a systemd-sysext image class
Date: Wed, 22 May 2024 16:11:52 +0200
Message-ID: <20240522141152.3286471-4-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240522141152.3286471-1-johannes.schneider@leica-geosystems.com>
References: <20240522141152.3286471-1-johannes.schneider@leica-geosystems.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 22 May 2024 14:11:54.0032 (UTC) FILETIME=[FF889300:01DAAC51]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF0001E9C2:EE_|DB9PR06MB7227:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9cc763dd-d74a-433b-8aaf-08dc7a692394
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|82310400017|36860700004|1800799015|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6wTH/DYJz/Sl3qLSAEl2WFfYh26pqItc7GuX2s3+vxBn4/rOjDoK1W++CXgc?=
 =?us-ascii?Q?B6Yj7Cz7gfJLeeZ4Y0FVMrRZ5mJ2pu29/1fPMPBhKZYDIrg3yWpg/96DpSoy?=
 =?us-ascii?Q?bawRy8ay9RJGx+3emFM525Nv5AZfpzttNKnqgyuq0TFWiyOhDGo86HGWJ3lP?=
 =?us-ascii?Q?6sMs5FYpDQMNkubKWQw0lU3We9PL2FpSOcW4zLZmHb2+6E0bao1qNSoBJ03Q?=
 =?us-ascii?Q?cmjtYtRZCtrUsEzDOiZ2XBNnrbXobpJBsBAyiwx8LTHdvOaGXgTzyZDl+f2n?=
 =?us-ascii?Q?cRS+90GwWTwkon3c3/GHL+JqPl4h1r1VXuMJAYbNnpDSVr5PTzpBT4x9Unrm?=
 =?us-ascii?Q?H9fIS/F91OQrbl1NkGqwfDHtsTaavUzxrtimyh04LZWhV2MdID1ZQg4PQj7A?=
 =?us-ascii?Q?4PlGZjFOsV8vQCtUdg/X/SqXxH/BP6h3jI/XCX2728yyo0xLFxgvuTiHNiGj?=
 =?us-ascii?Q?Ejr2q73GVXU4mInWxMD0o/i4ZappjeXONAqljX3ELkoPh58lyweNONkKc+fD?=
 =?us-ascii?Q?e2+XZ0JQtt/pmwltrZKWwfXzBBUZMzh79yzTdygMQKxR7GToXppML1cvGzRi?=
 =?us-ascii?Q?IKkfooOBQk/wJ0wYV2MScuSKvPCxa+hPrS/Hj21AnlG9C6OArN0GqYk43Fwe?=
 =?us-ascii?Q?EycEh3A7xkdG3fJybkymnKn0gt1o4AktL3mXxLcc6IUdoeXijPNapRMBHBvw?=
 =?us-ascii?Q?y/DralflddsmO8cBCWRi5XWoUj9a/yqZV+PcvInDSnNO4MjNHDJnXTjn2/7C?=
 =?us-ascii?Q?UENy3d0UD23SxmxqWBBYHbIGTdnupPp09LXh3RkQ7z3FwuiyKpz24r7TTUIJ?=
 =?us-ascii?Q?nFlfE4kF4YV3cqSER1or3DZYoJ6aGsunu0JNW+Pf+W6icgY1ZnPCTi7M5SQw?=
 =?us-ascii?Q?yPo88fxv38uHT4j+lZ7YQ/vRq1E7DygNrOK6t/nUpRTSPXfS/Hv8IIDkgqGj?=
 =?us-ascii?Q?6IT2+awFVrI8jP+el5iC91+7xkLpCIqn1+XjZYpJdgVsF0CsJYTBDF5clDI3?=
 =?us-ascii?Q?ABlhI2sjZ4e8Vawsq1X6JuGO/HzU63OVEa3GMGdtvrZoei+jDRs3BHWrBvtR?=
 =?us-ascii?Q?NehmLdxd9ogBFmXy5k4rzfPZ3VfpjuIqAtHO4bA9Q9SY0LdfY8Y4yqrQ8tLI?=
 =?us-ascii?Q?cR0gxvCxvwAC4lsiiIZA2WI47nLj5hGx0nUqv5fAoQ0vnenW8WhaSIRgDL1e?=
 =?us-ascii?Q?izwrHBrzix58X0oOHuCNR4ASW4MixyiZpM+1KfVwhDldA6V4wTRr/ciR3gr0?=
 =?us-ascii?Q?hP1oNmBPovN1Hql/pFYxDBNAyV80acmhIWyA1mWQkXENBMQrOIp6VMVdTwZ8?=
 =?us-ascii?Q?U5RgzhgQkcVzcytvp0J/QvDO?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230031)(82310400017)(36860700004)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 14:11:56.6234
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cc763dd-d74a-433b-8aaf-08dc7a692394
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF0001E9C2.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB7227
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 14:12:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199759

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


