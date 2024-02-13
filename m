Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9B6DC48BEC
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 10:00:23 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.46])
 by mx.groups.io with SMTP id smtpd.web10.8127.1707818419843695589
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 02:00:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=S4D4UawS;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.20.46, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fC/ogHjtkuG/gkCSfL3W6cVHuFfpCh10Uscy8IxRulBu/Uc504VnmFDDJYdWV0tyku8MGE6CcFwtjrlkVoc1DseoX/Ife/kjjSXSM6Lb6zlcm0yeQqrPO4Ib3ktZfZYmKYB/llTY2bpaG18aj4vPCT32DDM3bvVrcBSALkSC68C9MjaYHQx/9X+6jG+Rfh1hHSO0Ncd22h0j1MOYQA3aqIkXjXz2qccxJ54Br/v9FhhiwI+U+2P+8g305VDniok0ZZVnW/N4g4zewde5igp3J77UbeHP10J+XyDu245F9Guth76yt0nd7q1jSPzZv7N8v5PUHyz2MSp/c4bGBHCq8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VT/bLJqgmzWv6IKJfMdQ7qXWSVAqP3YMv5nVxTLSqjg=;
 b=OM3O/k9lAYkPVp4pkEVZICkj/Rv0dUvFKPioAosqK9LzaDa3hGqR+AsbeGuaNEa/wNClo0bgy/SEOjzHyrgiDxgPEpqbRWWF5Fa2/OoEXAwKZdgSNKmqzjF4ouO2gb/eYNYkd13vVpfmQVtSarTQ5QfehmRut83XCwr0R7qG1XZaAgnlw6L3wZNKV45uAla2sE3REsgMEISmdS1ehl1XC87K+4pjM0nG0lgfq0ftEMN/Frw8brWmIsU+hFkuJU3shLz1+0MBVNbU1FiUx9tBfTU+Sy3bvbXQ/vMPXb3pPMe3GLrj83OC9sYb89KGUtJRPcWKMMBue1TARBx47RiKcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VT/bLJqgmzWv6IKJfMdQ7qXWSVAqP3YMv5nVxTLSqjg=;
 b=S4D4UawSqlLoh0hDLsww/hpbaqgSh4j4VindNIUC6go6P2q0Vq8oqBPq3E0lagP0lh2fGztIFj7AMiI59ilBuvlGOtlMOoCfg8WRL1uPt5WEPrtELkg6QdZzcyeVPx7u5xYT8l5tRmoBbampgxjN5YPApT7TImiYrSAJ4zCXRns=
Received: from AM6P191CA0080.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::21)
 by VI1PR06MB8686.eurprd06.prod.outlook.com (2603:10a6:800:1df::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Tue, 13 Feb
 2024 10:00:16 +0000
Received: from AM4PEPF00025F95.EURPRD83.prod.outlook.com
 (2603:10a6:209:8a:cafe::98) by AM6P191CA0080.outlook.office365.com
 (2603:10a6:209:8a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39 via Frontend
 Transport; Tue, 13 Feb 2024 10:00:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AM4PEPF00025F95.mail.protection.outlook.com (10.167.16.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7316.0 via Frontend Transport; Tue, 13 Feb 2024 10:00:16 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Tue, 13 Feb 2024 11:00:15 +0100
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [PATCH v2 3/3] classes: add a systemd-sysext image class
Date: Tue, 13 Feb 2024 11:00:11 +0100
Message-ID: <20240213100012.252237-4-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240213100012.252237-1-johannes.schneider@leica-geosystems.com>
References: <20240213100012.252237-1-johannes.schneider@leica-geosystems.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 13 Feb 2024 10:00:15.0269 (UTC) FILETIME=[7112ED50:01DA5E63]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F95:EE_|VI1PR06MB8686:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 50be0c24-53fb-4158-04a6-08dc2c7a9479
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HEhksjmRdw/E4qe7XSL7WAij1LGvgSKvTgeBD0qVzQ0cdHag+XjQpCk4eg86P6ljf555+xEXzTH6T+aDBfgWQPw0fI1RUDXFfeRdyVeLyKx7OEQUnxyPyWfb4gNhD+/goDwSA/CvDxfuZZBdvZDKhQE6S2w3IpDgko17fmzLbfNne9puT/J1QQLy9JQ802kQRglPx1FtLkT1JHpRSLZDQuQdrJdtMMh0pixcZzxIcBEfzCGDhudS5LyZBFyyDs529bnXUQK+YjGrtg0FCMRdf8RKs22uvOakmxMp3kmk0L3PnRHbTtOWMdoIFeuaVqrjwUJj9SRncbBBf1A+1pdx4tAIyprh2w03606AYJtBD6txfopkD/NQREanuBjvqqPLCWwbOfjYk2xU/znOtc/P2/GKTAxQRPmVMoY415hwAPrzpMtmpvdPQTcekOTIQURvZFy8DQOFcJLuv4wZZhnoMt68VUNfBwllud5wf8hwfxAPKCcxC3/mWy1qIOXV/4XpLTNua+2RGsDrhUkehqWW7bol7FDy+76rUDYPOLQf7aXeTGoEYCVpHQRH4HNypRyGdlb3kzZWY0bEsLsEKEDKHQ==
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(376002)(39860400002)(396003)(230922051799003)(186009)(82310400011)(64100799003)(451199024)(1800799012)(40470700004)(46966006)(36840700001)(86362001)(82740400003)(36756003)(356005)(81166007)(966005)(316002)(478600001)(6666004)(107886003)(26005)(83380400001)(2616005)(41300700001)(1076003)(336012)(4326008)(2906002)(6916009)(44832011)(8936002)(8676002)(70586007)(5660300002)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 10:00:16.8046
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50be0c24-53fb-4158-04a6-08dc2c7a9479
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00025F95.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB8686
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 10:00:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195381

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


