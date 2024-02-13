Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50646C48BC4
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 08:58:13 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.52])
 by mx.groups.io with SMTP id smtpd.web10.7418.1707814692517865017
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 00:58:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=gIZiiIrE;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.249.52, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J4Lz4GRlD0CC+YSR1reWyuu/mWPWtcVYtOkVYp+kZObuTbbkyA989xxMLaYF7IE/A4NKP5jr9lhXCdD3YAvyEFFa0VZ4hTMfTU2TxUt7nTwXk0PfTFpjOO/7nIz3OoKWK2jinXdijKBWxkJKUsnab3A65I2DFHACQ5omsR6A7vfDPhdgh+eJkX8zIse6mCSbiX/rxcrU+zV/1tsyOVxdCt5UHE1fqvx+BOt8pgDUzdBWNBUlgDCHB3a/xN/EhpfUGsDDQiHSslt+Epbz9Q8Tv5dtdNT8rbXu874lnqpuuLuVC801FRoc6kwtOFyNRx5C8nfwOoeva4GuVaPQPuKlOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NDk+8roE9fWv0adWTEw4K8p7J3Dw0TAaX5u+EPsSM5o=;
 b=k/a6KmzVxbaTDHiWgIIudRqWROV+GgrTPYa9qaONElEydfOWeVORniKvUD1mNyxcVnk4OFoh+OX45TQMU5g4ZW90G58fgf0jBg6ujsm/USmt+TTYE+xUuYDr6Jl+7OUbxmit7qv8VKrztrG+JQeDkr4ZkoB2VkFs/JPyqa+UExTx9W9R2cX+Q+0XRF27oMAqm3M/A93aKsUnN0FphhNlTeES2fjyRVYIlHD5B5BUf6PWemhB6vKBkB/yovqY+tz6SygxVAUtCxXatB5N/jgFXUbRtTCwoOV9cpRz/2ZpoC3iYGLC9kQh5qJspMcXJcAGUlm7bbJN09jtHXHYiwLbeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NDk+8roE9fWv0adWTEw4K8p7J3Dw0TAaX5u+EPsSM5o=;
 b=gIZiiIrEqgESC9B2PA7ojpGROUyGjrot92+ylafnwRmSoORovvK17roUehoI6hdUhR998KBEiIryxqqss8H7ZTgSbf2zdezpWV92bX5JNoJQyzXGL8aN5RHIzBd9aA1r0U5TRb/HQZwBkQiTynffA1GLjX0YFcnxERdsWa5gf9I=
Received: from AS4P189CA0008.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5d7::9)
 by DBAPR06MB6806.eurprd06.prod.outlook.com (2603:10a6:10:180::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.35; Tue, 13 Feb
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
Subject: [PATCH] initramfs-framework: overlayroot: align bootparams with module name
Date: Tue, 13 Feb 2024 09:56:58 +0100
Message-ID: <20240213085658.170917-5-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240213085658.170917-1-johannes.schneider@leica-geosystems.com>
References: <20240213085658.170917-1-johannes.schneider@leica-geosystems.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 13 Feb 2024 08:58:08.0374 (UTC) FILETIME=[C3ABE160:01DA5E5A]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A67:EE_|DBAPR06MB6806:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 222714b4-78b9-46ec-86e5-08dc2c71e6c5
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bLi6qjLzL4uhQBRmKN+yelBB4r+xQN6e7D6ewUy6YKqAhMf9kzYKgGSM8tiq4XoWEEZYq9+mr9lp3j8dJRPY8UA7k6ZIcl3Sb1tLzM88EGFmXJv+AYksfBUUyYuVZ1cPCTDggqQ5OYWjPZCaVZgf6w92TNE4MB8CVIgQUZUcacYWyKXpjwoi8J+eElxb/ShfJzbzPO7sx906sihAQ61epYmTsqmfC++lfltKFjAj2qs0hdeSABXkQfFhMD3Qjhx3kv7wQdaSXZSmpPLg3f3HOGkCgL4unSze618vFavn/a5k3RKxq+GJ/5nfbunbP9V3d3TlRLm0YDBF6fUOpBqrREI/oeEUWlrLh+94vklhnDrhaxKweACbxOGTr0IXg+yurfd69IeTH6Qlb1bWAFDrBfFvyGvZU0Gc7YBS6d7Tn4Y8sBsLxzoiXSP1WrVesPpPFatF2gpM4sbjZArRbdiIQ0GqZMXEkU7zGDHIVn+yZSP/0o/FQ3QC7EFoTkztUE9p9MpRcW7WQt7v8tVOGLHrMVEQR/46DBdp55bvxAMR44stUrmvlDQ9datmhkrJNbRa78/fNzS7K+EJl2CZQVlmdaGr6ZFmqLyt6O6l+RvGLpg=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(136003)(39860400002)(346002)(230922051799003)(451199024)(186009)(82310400011)(64100799003)(1800799012)(36840700001)(46966006)(40470700004)(1076003)(336012)(26005)(41300700001)(2616005)(70206006)(4326008)(2906002)(5660300002)(8676002)(8936002)(70586007)(6916009)(44832011)(478600001)(83380400001)(316002)(6666004)(107886003)(356005)(86362001)(82740400003)(36756003)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 08:58:09.4086
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 222714b4-78b9-46ec-86e5-08dc2c71e6c5
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A67.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR06MB6806
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 08:58:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195374

Renaming the 'rootrw' kernel commandline parameter to
'overlayrootrwdev' to both align better with this modules name, and
point out the usage of the variable.

This patch also includes an if block to migrate the old 'rootrw'
block, should it be already used by someone.

Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 .../initrdscripts/initramfs-framework/overlayroot    | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/overlayroo=
t b/meta/recipes-core/initrdscripts/initramfs-framework/overlayroot
index 10084228a8..0d41432878 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework/overlayroot
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/overlayroot
@@ -15,7 +15,7 @@
 # accessing the original, unmodified rootfs at /rofs after boot.
 #
 # It relies on the initramfs-module-rootfs to mount the original
-# root filesystem, and requires 'rootrw=3D<foo>' to be passed as a
+# root filesystem, and requires 'overlayrootrwdev=3D<foo>' to be passed as=
 a
 # kernel parameter, specifying the device/partition intended to
 # use as RW.
 # Mount options of the RW device can be tweaked with 'overlayrootfstype=3D=
'
@@ -74,15 +74,19 @@ exit_gracefully() {
     eval "finish_run"
 }
=20
+# migrate legacy parameter
+if [ ! -z "$bootparam_rootrw" ]; then
+    bootparam_overlayrootrwdev=3D"$bootparam_rootrw"
+fi
=20
-if [ -z "$bootparam_rootrw" ]; then
-    exit_gracefully "rootrw=3D kernel parameter doesn't exist and its requ=
ired to mount the overlayfs"
+if [ -z "$bootparam_overlayrootrwdev" ]; then
+    exit_gracefully "overlayrootrwdev=3D kernel parameter doesn't exist an=
d its required to mount the overlayfs"
 fi
=20
 mkdir -p ${RWMOUNT}
=20
 # Mount RW device
-if mount -n -t ${bootparam_overlayrootfstype:-ext4} -o ${bootparam_overlay=
rootfsflags:-defaults} ${bootparam_rootrw} ${RWMOUNT}
+if mount -n -t ${bootparam_overlayrootfstype:-ext4} -o ${bootparam_overlay=
rootfsflags:-defaults} ${bootparam_overlayrootrwdev} ${RWMOUNT}
 then
     # Set up overlay directories
     mkdir -p ${UPPER_DIR}
--=20
2.34.1


