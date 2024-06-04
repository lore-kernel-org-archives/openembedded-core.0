Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B8C5C27C54
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 06:50:49 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.60])
 by mx.groups.io with SMTP id smtpd.web10.15187.1717483846685195217
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jun 2024 23:50:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=kyG/nk8J;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.241.60, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KbDZvZlBJD5nOMafbQj/FWdViVhdqHOnccZv9GO9URjxAb9fXXFpr5CTqr/G4thwBy6jH4Gu2QD9WsoLiAtHycEw8rADUnbjxgUisEa1sp9m+EYb1aO8oUnFFAupT0Y5lWlzGLKJzQjxBY/cTJkWD8EO/VJ0/tAkGi3w1gNXYhjlhyRsWqxaD7mElnR18r92gi8c4YHW2H5EdSGRm7otuICeURmCiAm/OYinjL8vP6ks8e2bEPfs71WXzBkmy5GoVs+G8XDsv7a7mBldfu3BiJRePcHvMWuoyNb2qvV3ufFx2q95bpoodLMUrbzjkl+ThAnOyJCjjkp7NrVzdGf8ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZKtblxxRrANVU8PaI2XIgyTLDwMaOc+7yM+MzGuoNPg=;
 b=GI9WVHfLFdyhSonHs/rpmKKq/jzBrsF2h/+39jrPmDhm6uNTCFAE+A6/qelfcUsT8Fl5v0p9VSVgDuVUbbpJHsV9b3DyIsxxA1meg0mCtpN+d4hTG/Rxy4/UX/OU3sUZOWlnYqdywQ1bC1IPKc7j04oJzlxlW8an1r2e1vqoLYGhzvZk5mjUe3pRBUa0WCF0+VOsR4Hig6FPVF3+YWEvHUkaCfwtcu6ykoXuS7NWh2iMQ7sOtXWJzuCZWn5VUP72ONmdU1zTOtZ4389WFXSkxREkCHDibAZo0Nt2NXCPemvBfdchqAftCQUVqrbUG1lKqQTkPEpUsbdsRXgmwkuzug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZKtblxxRrANVU8PaI2XIgyTLDwMaOc+7yM+MzGuoNPg=;
 b=kyG/nk8JbGIVFp7B31wAe7mJfj+oPRWnKiz/jfa+amRVhoZWCrehF56NtxvgbZCQ7ifCwDj4aeUpCVL5gU6p5ht3lyG7fvrz7hf85ZRvndJpN0ard1ZSD0byuNwwcd0QYbO+l7NR8+LxEv1f+tBQkwze88IxDCHppLYwiVLTBBA=
Received: from AM8P191CA0023.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::28)
 by VI1PR06MB8951.eurprd06.prod.outlook.com (2603:10a6:800:1e2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.24; Tue, 4 Jun
 2024 06:50:43 +0000
Received: from AM3PEPF0000A795.eurprd04.prod.outlook.com
 (2603:10a6:20b:21a:cafe::c) by AM8P191CA0023.outlook.office365.com
 (2603:10a6:20b:21a::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.30 via Frontend
 Transport; Tue, 4 Jun 2024 06:50:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AM3PEPF0000A795.mail.protection.outlook.com (10.167.16.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Tue, 4 Jun 2024 06:50:43 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Tue, 4 Jun 2024 08:50:41 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org,
	alex.kanavin@gmail.com,
	alexandre.belloni@bootlin.com
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [PATCH v11 3/3] classes: add a systemd-sysext image class
Date: Tue,  4 Jun 2024 08:50:40 +0200
Message-ID: <20240604065040.2771-4-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240604065040.2771-1-johannes.schneider@leica-geosystems.com>
References: <20240604065040.2771-1-johannes.schneider@leica-geosystems.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 04 Jun 2024 06:50:41.0906 (UTC) FILETIME=[84497520:01DAB64B]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A795:EE_|VI1PR06MB8951:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b23ce7cc-305a-4c39-ebff-08dc8462a7ce
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|82310400017|376005|36860700004|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?uxQkBohGm82F198dTfJGJ5y/SOI+UVa1REGTDmpgyQ9+5OeLj62SY1MAtSRQ?=
 =?us-ascii?Q?JmhAFXmMQRqx5mQFRSWVISNkWgD/PkIyCqIZWQACoXrRMtL/8GPXOOYpUpG8?=
 =?us-ascii?Q?IWJ9MhQlOR9M2f/nIpCUHNKSiQUIDdmHvDgbuR5lUWcrp3j7leyD53bCifcM?=
 =?us-ascii?Q?TB2fImi98nTc+TcOEADucNiaelaOr7Shyvquthh3ERNsrBzIhAjXOcjxnzVH?=
 =?us-ascii?Q?T88o8a7pVABltzWhkge07u8L+sCHZT/VfTz6atZxx4tVlFGiY/xkU8REGAea?=
 =?us-ascii?Q?VfPXQiXC4+pYzPEcehQKRGyDGJN/9mruDFGYk0W98shvNljzjNBoFS9qvF7p?=
 =?us-ascii?Q?QxZ8HxpFbJaBd4Aqe9ICvj6WTmi8zlB8B7tsiwaqCHqJbLxdiazSgDuGytyk?=
 =?us-ascii?Q?LD/xzLRMsEg0j6jVCCsF2vbNlB2zQUAZg1jHnosr/WmAy7cXlWTbPHGi/+nL?=
 =?us-ascii?Q?/yyLZnAR6Nl0090hlfhVbF7GO3gk1/OiqAxwyikwcY7rA9jgfiyl/DSsqY4i?=
 =?us-ascii?Q?d0IPZ0uxlXcoYiUJoZ71gpmyQ6LDkNC8BvFI9AzbL7RczkaNaPKzRG1PZVXj?=
 =?us-ascii?Q?tfJjeGxtdl2Qmj1Yty85zppHHKnJ/5JgYpmBSBIwBVo+r43SgJQ4nYYxSzeD?=
 =?us-ascii?Q?hLAIlF7Wzz/rWO0ZCAFaamdsma70pRxshNq+Bkndv6wMJGi7CHwEL7v0CNfY?=
 =?us-ascii?Q?Xe2uwhO4Y24oUkzcpaUb1T9T3N6/VXdDiqcVmWeXq2Qcy8X9Y//Rua88eDKD?=
 =?us-ascii?Q?MV4tHfZQ0KQbtyfLbdcZLEHjcIsVYHd3oAP3U+B2QbTiwwKJgs5JS95g2BVy?=
 =?us-ascii?Q?PoGpCMJuDB9AXEBSszS0exxqSFEmsJxu9s8Qp4I4nrqx7kkQ7U2eIBif7WFQ?=
 =?us-ascii?Q?cCd8gBZV3mOJK/Cg/3TbioSDRDphoCHI3MiRYB6arBePwwgEsBB57WELZZZ+?=
 =?us-ascii?Q?7sZshsPsxFPWRQEYm5DRkfnpF+cb2dYyJg5qioWDwtPb9hEd5O91dT49iC9O?=
 =?us-ascii?Q?kOfEbJ7rZMKpI+RDz04j84LRWVb07/WQhexow12txg6REA7BiJJKhA7LbQEc?=
 =?us-ascii?Q?RzrmYUMAzQgNNk3lK7CF7SLXK7d7wsZHAAlyZM+GmP4zgd5XrsL20PO6QklF?=
 =?us-ascii?Q?Tq60fR9EDRmwoP+FnTvwo9x1gcVFKVjdihXxOKDzB+jZ9908OeB1ZGSc2KI9?=
 =?us-ascii?Q?etGdt+u1PpstlAPyRLYeJtUfejXr7Jg1clVNO6It3+BA4FZBNU3LlsTE5zzZ?=
 =?us-ascii?Q?8tYwuvHy9lzFjtjNJ+7P9FGos0DsH/tMLvJ1dF4jeKyH5k7CyeaBdJYngG7W?=
 =?us-ascii?Q?UR6oUwrAPx5W+sSRDxY/lu7X?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230031)(82310400017)(376005)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 06:50:43.6472
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b23ce7cc-305a-4c39-ebff-08dc8462a7ce
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A795.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB8951
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 06:50:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200293

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


