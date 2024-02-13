Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D00DC48BC4
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 12:24:44 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.41])
 by mx.groups.io with SMTP id smtpd.web10.10176.1707827080621762805
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 04:24:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=q3JsSRPj;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.8.41, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lyAyZA49eOKGSLJBsWCi4klMTwykoZGfA0BLYjSi8duPIfv2XjzyQgwD3M3OOjNdK0ZP/FhtTl5/nB1yOaDu8uvwtkGowRNvQ5mNp0P4BBH+o4WqJ68vvQ6U+Isobfr/ziCAyz2n9KuFiXWSSJQKGyJ1rTRuLgwEkbbxDgFBpLBzFlptP/aG8hPkOE8zHIZvjOAwH+MY1zcWcYAOQL+VvtB4jFYEq1pe9j1lZoeBLTaOHewNISAaIcDWGmpFTKORiibah4yskm2hah+ofAubuipZkT0kyZumYGB7RsDYASciTh7w3pOYgfzgsIyVT/GXcKKdJAreNlh9PclR7+bcMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BD5fKTLT/PB2mH8CNvowbxKl2QwozC4vrYuHVXKfiAY=;
 b=QbsFDIXLjV9gzW1X8fWhA2OscCPIfqsUuB26xLnCOjmQAjlNXxFmjlGn2cbks3riuP49I5pTldZQD6RzcmfDsMAhHGzVEXwC1Vglv3zeOMiZq5/0imI9WeILAcDzZNaywklZrNTofX/HmK4WENjCAK+oXF9YJJX74bCKXB9grRcelyMqkrVbd/py9nsJlojqkD8QJuItsWD8Aaku96FIaANSXuZIS+MFaPiji9ZdSuEzjBgGUhf1E7DGyoXvl7PrM2kXeUTuhrPL6ZlVtj7dy38Esx0EJ9UJSb6Og6M4uUVxE8Eg/RKPhioclyHmoHUL70tyXyIpf9694yVQh+lSLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BD5fKTLT/PB2mH8CNvowbxKl2QwozC4vrYuHVXKfiAY=;
 b=q3JsSRPjKA96AUO0GxCzhTrt8yV/BuJb/3DDc3hGJKYzcGHTnQnBkNGjLxgQjmwMCWOqXAhel1u7CQts/UXrvsPqnPkrcgmRs81TFT4NHAAhj1HmUZDSzN/3No25tOoeO5h+9/O/c2YehnW/jSoD/eZZCSGgo9iZ5wq0OqsN5mM=
Received: from AM0PR06CA0132.eurprd06.prod.outlook.com (2603:10a6:208:ab::37)
 by VI1PR06MB8901.eurprd06.prod.outlook.com (2603:10a6:800:1d6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Tue, 13 Feb
 2024 12:24:36 +0000
Received: from AM3PEPF0000A797.eurprd04.prod.outlook.com
 (2603:10a6:208:ab:cafe::4) by AM0PR06CA0132.outlook.office365.com
 (2603:10a6:208:ab::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.40 via Frontend
 Transport; Tue, 13 Feb 2024 12:24:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AM3PEPF0000A797.mail.protection.outlook.com (10.167.16.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.25 via Frontend Transport; Tue, 13 Feb 2024 12:24:35 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Tue, 13 Feb 2024 13:24:35 +0100
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [PATCH v1 1/2] initramfs-framework: overlayroot: fix kernel commandline clash
Date: Tue, 13 Feb 2024 13:24:24 +0100
Message-ID: <20240213122426.3570935-2-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240213122426.3570935-1-johannes.schneider@leica-geosystems.com>
References: <20240213122426.3570935-1-johannes.schneider@leica-geosystems.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 13 Feb 2024 12:24:35.0422 (UTC) FILETIME=[9AED67E0:01DA5E77]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A797:EE_|VI1PR06MB8901:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6c092552-6476-4e02-e009-08dc2c8ebd88
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OyPlw7tHaNpSadAcaG4A6qNI4PK7PI+KaGYpwsHmIQR8zoK7Fe8AyjVPPCuT4iHUS2iSQsda0FBTdJU8WX3XoMn3TF5C4XO6CMNAGQJfycr+2tIssrX4QdCM3tuj7OJR3WChKWXSHiscQn0cQ3RVMfOmqCbsP2VIN8Rn2V8o1KkWe5HI6Iir1VZzM+JZApwuir7VvWJAQJwwd57lOtvlvhcdvURbo4WYfnR0PuPdktXl2Kkbm83rHSJBi02ZwhyV5IhKIToE4UcIxpVtFaEeGlKr6Wro/UmRBuEOIcLzNdQLaOJzRDmZRIVZy33eAShodor3KN3TPETCy0ZuzL2IzceOrkO9Wd2wH+Hfo7zY8oioo9o8L12RxqBVgABs5RrVTmziUXcwNKlbPDXvEwRFGjMVt/Xy7K9NFbLvfoMfQmjaGlZJiigM7uRmWMP/VO1uH2RcOIOjN93UWq7YC1FtvsUP6+oakqUqiKMpjOe0dVgtG+b3MeqhoKy47Nj87gjvjnloUsUaTZgqXvx8tJGemQqMqz4SCSsiyZrNzlINsr1hr0TKX+SsW/Ptz5UyWEy9DkVmmAfH15XSykcBBZwpinSRohZwB/HVpmVtyHdUGrg=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(346002)(376002)(39860400002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(82310400011)(36840700001)(46966006)(40470700004)(478600001)(6666004)(1076003)(26005)(336012)(107886003)(83380400001)(2616005)(5660300002)(6916009)(2906002)(8676002)(70586007)(70206006)(8936002)(41300700001)(44832011)(316002)(4326008)(36756003)(82740400003)(356005)(81166007)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 12:24:35.6297
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c092552-6476-4e02-e009-08dc2c8ebd88
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A797.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB8901
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 12:24:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195393

The initramfs-framwork takes kernel commandline options and converts
them for internal use to variables following the 'bootparam_name'
pattern. The overlayroot module uses 'bootparam_rootfstype' and
'bootparam_rootfsflags' which both collide with linux kernel
parameters 'rootfstype' and 'rootfsflags'.  This collision is solved
by putting the variables in the namespace of the initramfs-framework
module.

Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 .../initrdscripts/initramfs-framework/overlayroot             | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/overlayroo=
t b/meta/recipes-core/initrdscripts/initramfs-framework/overlayroot
index d40342dc59..10084228a8 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework/overlayroot
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/overlayroot
@@ -18,6 +18,8 @@
 # root filesystem, and requires 'rootrw=3D<foo>' to be passed as a
 # kernel parameter, specifying the device/partition intended to
 # use as RW.
+# Mount options of the RW device can be tweaked with 'overlayrootfstype=3D=
'
+# (defaults to 'ext4') and 'overlayrootfsflags=3D' ('defaults').
 #
 # This module needs to be executed after the initramfs-module-rootfs
 # since it relies on it to mount the filesystem at initramfs startup
@@ -80,7 +82,7 @@ fi
 mkdir -p ${RWMOUNT}
=20
 # Mount RW device
-if mount -n -t ${bootparam_rootfstype:-ext4} -o ${bootparam_rootflags:-def=
aults} ${bootparam_rootrw} ${RWMOUNT}
+if mount -n -t ${bootparam_overlayrootfstype:-ext4} -o ${bootparam_overlay=
rootfsflags:-defaults} ${bootparam_rootrw} ${RWMOUNT}
 then
     # Set up overlay directories
     mkdir -p ${UPPER_DIR}
--=20
2.34.1


