Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81E9BC4829A
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 12:24:44 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.80])
 by mx.groups.io with SMTP id smtpd.web11.10431.1707827082366022036
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 04:24:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=AsbddTtn;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.22.80, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GWl2HOp7Rd6hO6kWADxScz6M5PE3znv+P9ov+WgzsxIJkbaANJc59xFIJvj5vN+mF+UpT9sxd6TUcmiofK5fykY9fW1uPtwYisSTbmDR49rwO+hcWHwV8eUjWaybew6AtbxK9VpZyrsCt8v0Ul4AJUzYm60B4Xc1SrcgpqAu1qq2CVpA6e/ORjS1j30Pxl+y5o9aQnVPAodD9JvprCjt5vRelm4doC8ITdqwe3G6QJeL2Xwu/vv/uH0cqIQnl2rPtFCmO10M0e9Rh6oVRNPBcPv+KQqzd+ZWlVVfLaNxZyDa1VT487XSjFg6b09be1/oJnU1y6xwxDf1xznWqizrCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NDk+8roE9fWv0adWTEw4K8p7J3Dw0TAaX5u+EPsSM5o=;
 b=ARYFry4NUkX5TEKDaAyd+fMg3U6QwHL82342e0R1QuI+q5gi014XWlMWGx/69S9QkAQFmq3piAItACIxYogzv7T49226lNwhwkEyZIYAgqb4R3EqqY+GRDJ72HBTS1Qp3r4BFcUKN8dUj1jChEMcvdJaRXdU2qZ6d1LxTpaR418j5Hiab6X5K+j1JLMEz2q4A9JXdaMd3UsGzJuN4wHuXC3yr+2Pj7cI9BKfMFGkAAmo/12CPz/V6N9GNnb/GGKuTzKrkOdCpzAISPDBJlvhuqVHbRhZjUKIfySmwSs/dN23lgWMjJSWHB4xV7dkpzyKlb7Ucbkxvd1sJLr8X/Rt/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NDk+8roE9fWv0adWTEw4K8p7J3Dw0TAaX5u+EPsSM5o=;
 b=AsbddTtnB6newDaeeVc+FBlAe0XsmfwvVu+7cfwnFYZq5G1Bh/wxM6+jkjFFx5Rb5aTrXCCDvGWRThOtxDdVhuO6XdnMkpdx5ImaSjMgqlcMumuVr3EK3OoVGFWGA1ZuiSXQK0P7F2rLkqymElFtKA74R2+T+JgbSY0ukHBEM0Q=
Received: from AM5PR1001CA0068.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::45) by VI1PR06MB9071.eurprd06.prod.outlook.com
 (2603:10a6:800:1e2::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Tue, 13 Feb
 2024 12:24:39 +0000
Received: from AM3PEPF0000A799.eurprd04.prod.outlook.com
 (2603:10a6:206:15:cafe::2b) by AM5PR1001CA0068.outlook.office365.com
 (2603:10a6:206:15::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39 via Frontend
 Transport; Tue, 13 Feb 2024 12:24:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AM3PEPF0000A799.mail.protection.outlook.com (10.167.16.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.25 via Frontend Transport; Tue, 13 Feb 2024 12:24:38 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Tue, 13 Feb 2024 13:24:38 +0100
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [oe-core][PATCH] initramfs-framework: overlayroot: align bootparams with module name
Date: Tue, 13 Feb 2024 13:24:26 +0100
Message-ID: <20240213122426.3570935-4-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240213122426.3570935-1-johannes.schneider@leica-geosystems.com>
References: <20240213122426.3570935-1-johannes.schneider@leica-geosystems.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 13 Feb 2024 12:24:38.0672 (UTC) FILETIME=[9CDD5100:01DA5E77]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A799:EE_|VI1PR06MB9071:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 670577f6-2724-45aa-ab18-08dc2c8ebf8f
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1+3DrP7se7NBQ5viT6bbTLv4T27nzak7y52LAYBKlwjTSLAUj46aqHUzMtaBv1XV2YexpUeqxq4d1BfSvd1A3smpmh+Oc+lJu+11J9UmJVghMsIeFCyRrap/Io2Vj3zP6tgw11nAXYyH2W3M+qIk2Vk5m9LP+YWCdljyAvFDLtBYjN5rJ/TgiB+WDEtsmknoHmfjpsyqLUmUI3zlFHtXFsuC6wrdOuCtP4Y0/+zZgCBeVDJS7ftM7roqRgw10wTv9u83PjCh6iNp4za0bI6OA+NQIQaBVKGMvXa9wtllAhWS7mhUZQ8kShq3/o15NpnNqB4bBDv60KS00RU8HVYX8XiGusSQ86f3QxIhusuGsT91T4H/15mKdANFOwM3etU/uHlD/Z0WFm/UGzipaCHvAMyPsWFQG/KFdDGRRkLby59QIOrCGll+VvPvfgnTwHH80Wdoh4K6Fr8sdb7SY/UQmK8866XtovHhdfpELMe1IWgDss8ulcKPMICe5ysFu6St3rXHfdfslZVNDHC3hfrDKUZfeFACZFZ+HUGgaa7pLVq6qObVCHw3yWc6IinpXfgtw/cvFSpHpUZpa1S6lIYJzpKGcr0T5IBquGzLMSlUCHc=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(396003)(136003)(376002)(230922051799003)(1800799012)(451199024)(186009)(82310400011)(64100799003)(36840700001)(46966006)(40470700004)(44832011)(5660300002)(2906002)(41300700001)(2616005)(107886003)(36756003)(26005)(1076003)(478600001)(82740400003)(356005)(336012)(81166007)(83380400001)(86362001)(70206006)(70586007)(6916009)(4326008)(8936002)(8676002)(6666004)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 12:24:38.9984
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 670577f6-2724-45aa-ab18-08dc2c8ebf8f
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB9071
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 12:24:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195395

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


