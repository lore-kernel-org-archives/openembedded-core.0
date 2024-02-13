Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9008DC48260
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 12:24:44 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.41])
 by mx.groups.io with SMTP id smtpd.web10.10177.1707827081300327809
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 04:24:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=vLSxYItI;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.13.41, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U/qqQlc+WdQGMuICv2vkcKrOr5COr4fpRDSo/eua6/85WY3ejJe3gNinCzQjqAkmpzmxsk11MyUCWSuL8zj/X5UHyYS4yoNjdf5A14vWVpLtRfBJrvY2zxMMn6I9+SytLUPczd3t5JYN8DHXJvUNGJO3NcW8e3QQfFZ3JdIEmJfgL3ynsAaNT0+q7p+pQsY+73PfohpIXRD6LybwdejonNNuIVMViGHDvUFmshoV1MxNr5RrxFdbNB6NavhMXS+6cY3yOZJ3lsF3HdNmpaTUMEg2AGxT33/jPN+hFdzQjUcGf9Hpvc6jEdFCvjbspyIwTx8iabraeCDIkhMeVjQ4tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NDk+8roE9fWv0adWTEw4K8p7J3Dw0TAaX5u+EPsSM5o=;
 b=U0gaMBmKH8Tg0cXHHQubvxrEyFur3Myo/+O4ShY3ExfExE6govv3YTBGYt+U/XXEamR9+SYlwEuERuQeGyRmk2R8S9zgWBznMKWfO76vBo8iKolibStHBlqE0NqvtC7PFWiXnuxWQHIhnZgu0Xq2cXmMkVNIpuwc/3rdPjECTuwW1mgap0mLrY/iivc43cku1cNG9DnWfxNCPFOcb8Drm3RJAMUhvmVhpj5x4uGIzWRmFLbUq+F0dvAeBMlO1STlEfj62XZry2Ra5ed1h/UUjeo8WgUiMFQcMswDTAs8pcpWW7PAGoJQ07z8nMUQ+M2U3vnB3Y4M+XVV5uVBTWUCqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NDk+8roE9fWv0adWTEw4K8p7J3Dw0TAaX5u+EPsSM5o=;
 b=vLSxYItI7oX6/rOU+CdVKsEYujXqFpRiEwRaqm+7zRjMuxfuyHpHUsjHVa9WzNyS3jkMvjJ3UXkvUSasWwePGZq48uAv8RciVOf8GoWMbNKuWo5G7rDMK/anT5umOKxVg3ycxzt9FmbdbswUIi9woPvnRWsMeEJooFh/FdkdOf0=
Received: from AM8P189CA0016.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::21)
 by DB8PR06MB6570.eurprd06.prod.outlook.com (2603:10a6:10:128::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Tue, 13 Feb
 2024 12:24:37 +0000
Received: from AM3PEPF0000A798.eurprd04.prod.outlook.com
 (2603:10a6:20b:218:cafe::c1) by AM8P189CA0016.outlook.office365.com
 (2603:10a6:20b:218::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39 via Frontend
 Transport; Tue, 13 Feb 2024 12:24:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AM3PEPF0000A798.mail.protection.outlook.com (10.167.16.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.25 via Frontend Transport; Tue, 13 Feb 2024 12:24:37 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Tue, 13 Feb 2024 13:24:36 +0100
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [PATCH v1 2/2] initramfs-framework: overlayroot: align bootparams with module name
Date: Tue, 13 Feb 2024 13:24:25 +0100
Message-ID: <20240213122426.3570935-3-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240213122426.3570935-1-johannes.schneider@leica-geosystems.com>
References: <20240213122426.3570935-1-johannes.schneider@leica-geosystems.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 13 Feb 2024 12:24:36.0563 (UTC) FILETIME=[9B9B8230:01DA5E77]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A798:EE_|DB8PR06MB6570:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a13b01cd-4b06-4738-99f1-08dc2c8ebe75
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OwEUpbbAQeOM9QSTno2McqgvDAH7CiP5mIyttgKH6/sNkZ4xfPBM5KPZKwcXB1fkZZi2fM6ZuGjbsRVfHeM4U1+9V5kCvTP+EXjEnStnqynZ5yHsC+NlXxseB6cjN2S0MbPsEIWwpvUSxtqbhGVxRIxGdtBOru8NB6lJAv+x4OecMu3HzgzSpPwIYITwbRfrzAOW3yXZCCEhvvLske59z5jjXeXjJO1RmGiPK93LAtrK7/kDuCeJ1W/kEaTwdacMOJEK3jYqS678sLEA0Oc/gwLbZrz1R0GYLYycCh1M/3Yto6zVATDxlHme6TY4Wlfdt2J5q/K84MQ+mO/s+HighskfgdL5I5DBYhBd11NmRy+x8lAiKQw8L8uotetmRg5H+fKctXEDmHFfy+DIX/BJlAnt7Df8Ja6P+ufSU8FOYHo66LBcGX4ukfnmgKQ/1bzVt8++PwCFMOuPk4rQLNfWcpZYT7WiHKFjcj+kgXmaJKHCKWWabEwo2JIbo0NaIG+OYUJQF0o+7lc7RgMpedujZDYg62Zq+7JCqx0APh6kvtle88xiE6RjDdEVl+WVtPpBNZCCPdQZBKggx/QMA6CerONqDqFx3FdiJlTc9xA5zaQ=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(346002)(39860400002)(396003)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(82310400011)(40470700004)(36840700001)(46966006)(36756003)(316002)(6666004)(86362001)(2906002)(8936002)(8676002)(44832011)(4326008)(6916009)(5660300002)(478600001)(81166007)(356005)(70586007)(82740400003)(26005)(336012)(1076003)(70206006)(2616005)(41300700001)(107886003)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 12:24:37.1030
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a13b01cd-4b06-4738-99f1-08dc2c8ebe75
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A798.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR06MB6570
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 12:24:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195394

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


