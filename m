Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F7FAC44536
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 13:17:05 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47956.1784726223052353912
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 06:17:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=SDyQTQf3;
 spf=pass (domain: ericsson.com, ip: 52.101.72.42, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q+qesB1RwQsy0EILrPCn+lINzPxT/y//1NWWK6pB11ZA9pq0vMuc3sdxDJyagMkxexQeVAoE7aW4dlTk+y8XmjPQ9ssEwO6OpKHZK++bKdMZC0MrpwePFl1x7f4PhryFkxbqnqho7hc68R9jqFUq8A7Z5s5IQcH0MyDejaTM+xRi28D908yGPX5Dl5JreCY5J8IJf0/tLxv8pSXTsNI2drVkGW4iQFldDr1VLtMW6zECjAME50IVvFF6jz3B7FzuW6FJfphinpjCQ6J1aA2CknM65CqMguau3u1CxS+6QWeXSLADr9Mke1ofTLyBEJ3cYw8WYKJTbwmhFGNCQodEsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s9Am6tYD/zu2/qlh/eeMqi4sZlOIj1vss/yZWJHB5zQ=;
 b=CYIuaflc50nsUe/Mvxm1p1om6CcoH2wryuEoj0VUmArJFf9+ROWJDeKdy/whV3Fgpnrf1wyaqFtY+6fX3BiHH9HGwvosHIWrvDIZLvnZLkgbPivpJ4y9mgKvpKf/AcP3Rj21W9vzWiiL4qISdiyMg3CIXxpS7ps9xFWOQgaa6ds7jmG2sV0BAifTZwXUaAaJljPSueE/g7So+XrODl7hXa/kOJeSrGrFRgXuk33b39Ud73ZfKJOM2EwN45mP5Nakr8xfCd30X4knFadnmjJhdqvqtS1++s/M5ov4fIEVCOzLKK3SlVp59qhApFsYOqBLS4ciBdinfR2kwADd9cS+LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=arm.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s9Am6tYD/zu2/qlh/eeMqi4sZlOIj1vss/yZWJHB5zQ=;
 b=SDyQTQf3ghc+mTVprEo1Gcz6mSCdO0t/kwdbYZsFrcKcggWf6jJx1tHLqDxXhZRjmfIyDpNbySDcJxvkd5JPBPUpyBkassYnNit00r/bWXjlg+IOlwUm6zyJOKcPAOskmEwglHWdFRZwd5juL3BeqorhxYrz6z2at3JN07WAms1Znt5dmvd7uJXT49z4iZ3YqtSEyRv6Z5ArXGuOCH8TSlr18+HMFk+Ohr19vl153uldSztGths9lV58U9QPm//MHx3XLtRyPABn5w1BgVGY6ZYwR9Jc3gmHnKF7k46TlGI+msiwQCfScc6X2ndVL22oCsvO6x39vqfgxXJcYkA/WA==
Received: from DU7P191CA0018.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::11)
 by AS2PR07MB9504.eurprd07.prod.outlook.com (2603:10a6:20b:642::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 13:16:55 +0000
Received: from DB5PEPF00014B90.eurprd02.prod.outlook.com
 (2603:10a6:10:54e:cafe::10) by DU7P191CA0018.outlook.office365.com
 (2603:10a6:10:54e::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 13:16:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB5PEPF00014B90.mail.protection.outlook.com (10.167.8.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Wed, 22 Jul 2026 13:16:55 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 22 Jul 2026 15:16:55 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id 1A66095801;
	Wed, 22 Jul 2026 15:16:54 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id E48B9700DBB0; Wed, 22 Jul 2026 15:16:53 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <daniel.turull@ericsson.com>, <openembedded-core@lists.openembedded.org>,
	<ross.burton@arm.com>, <mathieu.dubois-briand@bootlin.com>
CC: <anders.heimer@est.tech>, <qi.chen@windriver.com>,
	<alex.kanavin@gmail.com>, <richard.purdie@linuxfoundation.org>,
	<joerg.sommer@navimatix.de>
Subject: [PATCH v5 0/2] systemd: upgrade to 261.1 and be compatible with rhel8
Date: Wed, 22 Jul 2026 15:16:38 +0200
Message-ID: <20260722131640.4155716-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B90:EE_|AS2PR07MB9504:EE_
X-MS-Office365-Filtering-Correlation-Id: 30a46a83-6a26-4663-e2c1-08dee7f380c0
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|82310400026|36860700016|1800799024|13003099007|6133799003|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	sfKTK6MxLgGRYTJT9Z+hq8ykfXCGHFibUB7waPD+7HhLczECeCno+xt7y7KpDKRo7HaR7Xr3XiqeXzrexVwtpG+ssAMZWwiOJowOeA0Ll/OLPu7Aa6jsBsCnWE5bJAl4AMxB7Qa+ny2I4D1L2CvIhGSyyHIfP5gtLg2hGzlOYV/IJ7j9ixW7uderwivUlTCfh+90G+LSRcHc0g3uYGGkwyH2/Yrb6/7U42Ejo2lXxZF5j2zUUBgEeTJG1E/wMMiBMYUI7oo8GIyEdeEsiwJJ3VzUqDboHU2vhZ2YzGf5jBnDfx9VZUWbeZqbbGp9+MJio8j7LGRyElGeK0TfH1/YSYs8tl1xNSYJM5brtXqQJgmwYOWYzGDuUPHBDJnQwehAyR3YtAg12OZlbo1gjCq0I14RPesqVhWB1ICkgSttl/BWtNAHmqEw8VZ2yeIyQTuhNk6b9FHB60mc9pH13cs4BZ6fRKl2a+APPXb59Of66C7BleAVks8YcjFjhE1ojLTyel2KElnmX1y0uHFAVAaouL6n/ghCtl9Ge2EzwyLvx1jtgZ9tFnGEGNYkDdr/qFUegurfR592wcJsUbsnVhLvI+h+Sc5IgEAmfrHt1HDPcFgPz5tQNZA7TGiVG9f22jgMbIDDvJBSV+tERz7TRigH/+2p7FkG7iSeowVNTV5anPKO4KZdBnoXaXS8c4ewI2yfhB7EmgF7p5jDgawLibUKmw==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(36860700016)(1800799024)(13003099007)(6133799003)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	SR9aUpzNyDDGMdaIwSFzk7NWzViut65w/4XZHisKerpwCrXnYPHNZunFN0zf0N/sK47xWAxy4RJZTDEXD/3PnzSn0X1Kg5GvEwA1L+Dj94aj54fb+MKAG1g2H7LgzCRimUbtoTT2Q1c+/jmDgFMGcPUVoTNeg006USbwyKzlSIp4ViEcqrK2s3a0oQqS6JKX9wxhNCtU+KGQseo1ZANjA+hzPWTRPDi+OtiEP+0/rWgNm1PzlxS7C7dixYAJ38Q3ACg9Lqop7sAEMKCINlTbLaPIu8Yua2m+MFQ+ItIr5D0VFMvJTyegA7u9kYGL/KkKm3KCjy5lF8NnVS1w+YYNh9fQ9nJfgrOyJrWbf8PH/578qlkIJux9Y3tJOGGFV3wL/HsZfRwNuH/mUH1gu7n0M+ry/MLRMR6IiNk1wCcuO9l+g38h8NPzfnwERL2NFk71
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 13:16:55.5587
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30a46a83-6a26-4663-e2c1-08dee7f380c0
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B90.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR07MB9504
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 13:17:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241690

From: Daniel Turull <daniel.turull@ericsson.com>

systemd increases the dependency on the host kernel,
which breaks builds with rhel 8

This series add native patches in the systemd tools
to make it work.

v2:
 - re-add tag verification in SRC_URI
v3:
 - rebase on top of Ross Burton meson patches. if not needed keep v2
 - re-tested
 See https://patchwork.yoctoproject.org/project/oe-core/patch/2026062914155=
9.1305873-1-ross.burton@arm.com/
v4:
 - still on top of Meson patches from Ross
 - merge systemd-systemctl-native and systemd-hwdb-native into
   systemd-tools-native and update references
   (this will cause meta-oe postgresql to fail). I'm planning to send
   a patch to it once we merge this one.
v5:
 - on top of master-next and ross systemd patches
  systemd: no need to use qemu for hwdb update
  systemd-tools-native: add systemd-hwdb
 - update to 261.1 instead of 261
 - simplify patches based on Ross work

Tested on rhel8.10 with testsuite systemd on qemux86-64

Daniel Turull (2):
  systemd: upgrade to 261.1
  systemd-tools-native: fix systemctl/hwdb --root on RHEL 8 hosts

 ..._259.5.bb =3D> systemd-boot-native_261.1.bb} |   0
 ...md-boot_259.5.bb =3D> systemd-boot_261.1.bb} |   0
 ...259.5.bb =3D> systemd-tools-native_261.1.bb} |   3 +
 meta/recipes-core/systemd/systemd.inc         |   8 +-
 ...meson-use-libfido2_cflags-dependency.patch |  54 ------
 .../0003-Do-not-create-var-log-README.patch   |  10 +-
 ...il-fix-PCR-bank-guessing-without-EFI.patch |  62 -------
 ...-detailed-debug-logging-to-fdset_new.patch |  97 -----------
 ...issing-STATX_MNT_ID-on-older-kernels.patch | 160 ++++++++++++++++++
 .../{systemd_259.5.bb =3D> systemd_261.1.bb}    |  12 +-
 10 files changed, 174 insertions(+), 232 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_259.5.bb =3D> system=
d-boot-native_261.1.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_259.5.bb =3D> systemd-boot_=
261.1.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-tools-native_259.5.bb =3D> syste=
md-tools-native_261.1.bb} (89%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-meson-use-libfid=
o2_cflags-dependency.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0004-tpm2-util-fix-PC=
R-bank-guessing-without-EFI.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0018-shared-fdset-add=
-detailed-debug-logging-to-fdset_new.patch
 create mode 100644 meta/recipes-core/systemd/systemd/Handle-missing-STATX_=
MNT_ID-on-older-kernels.patch
 rename meta/recipes-core/systemd/{systemd_259.5.bb =3D> systemd_261.1.bb} =
(99%)


