Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6AC1C43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 11:50:48 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19489.1782820245268210183
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 04:50:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=VtntxUtT;
 spf=pass (domain: ericsson.com, ip: 52.101.70.31, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IFifx32gZIoEYlgJgwD/6hX+L3p6SUMvsphY3c+r79N8vG5xrKtlWwsWSzkMzsMVfTSROvZoY0ddS6IcX6SxPfY5uNSAWLndCNJ1owog0LBWQd36VLzzjuxQq9tZ0tcXQAd5P7E5KtbfOVt4kILFY3NtBwRTGECm1sYq1KUUXsSDXhewqAal9s+Kwtz6pFNosLoHvBS9m6hqipFaQTydDvvtlqaKivJyn/MM67S99H5B3TLWDB99ywvmySuhfE/vvGNGYoSP7ZBvf3KInLdmmc7p7y832/iyMCLFLEdG2+3YELB4U8VgIWGI0uBz0oDdN/M2u4mRo0kxIA44gishcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=umME3lD6d9EunsMDWVl18BK4PKFsfd1l03xh8qR44pk=;
 b=uwvd3nSw07NUy8apbfYuquiy3BD1CXeIqlT8WCso0oz3j/pkTWbKbqE0ZKXCZcyLCDPW+G5X7CgCh2oSyh5ji4mFbWgT4ujYzY1EvBi2MO9Yr2tAIlYdfoBqYCbFnNcZUzLkNr2jDe9zV9O5Uvv+SUV563NStfrEveVEOCUC8xTTPNTqvfU2WrCMHRKJCc9bYZ4P40Nuph3H4s1XypTLlsZnZqooQPwXUv+h9PiiDUomkIryHnuxtFv1+4r1gl7uEEqAwN5VsvIMl4OGH6VtWaYiN8KJc3qYGxCo9OqSM0gEoWvGjJnBs25CxVhkR+S+nb7u5TjLLXvqXeA8wTBhxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=arm.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=umME3lD6d9EunsMDWVl18BK4PKFsfd1l03xh8qR44pk=;
 b=VtntxUtTgOgosi8nxK4zR2jaI3K06TATi+yWsSly/2TQWh9/wHVcfFiXAAdp4gjbhx8rD9/3fg5uSFbvki6rgvh2uma24BY/pWX2Fue2ICSK2CU1qI1ItfyANE0rD+RQxJGSWe/rH/BEiKMMLSod73PZ9TbV4zrwIihhUKoc1D+QrTHW3IlbFplTsURVRH7EvbMURrVZGifhU5aPwdahpOweMqZeYbYXX0G/pcStCsn2p7JEp9KUdV15G4f3ejeP3nXjpr7Ri9guUAhJ1cr+f1F3F3I83Y9qG5CAxKJhXokwHyQT96O/ZHqt5IR23mUwDyG7traweMBWVHbeLJzpgQ==
Received: from DU6P191CA0025.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53f::25)
 by VI0PR07MB11914.eurprd07.prod.outlook.com (2603:10a6:800:333::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 11:50:40 +0000
Received: from DB5PEPF00014B94.eurprd02.prod.outlook.com
 (2603:10a6:10:53f:cafe::a2) by DU6P191CA0025.outlook.office365.com
 (2603:10a6:10:53f::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Tue,
 30 Jun 2026 11:50:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB5PEPF00014B94.mail.protection.outlook.com (10.167.8.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 11:50:39 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 30 Jun 2026 13:50:39 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id 670D24020B6B;
	Tue, 30 Jun 2026 13:50:38 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 43232700DBB0; Tue, 30 Jun 2026 13:50:38 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <qi.chen@windriver.com>, <alex.kanavin@gmail.com>,
	<richard.purdie@linuxfoundation.org>, <Ross.Burton@arm.com>,
	<mathieu.dubois-briand@bootlin.com>, Daniel Turull
	<daniel.turull@ericsson.com>
Subject: [PATCH v3 0/3] systemd: update to 261 and be compatible with rhel8
Date: Tue, 30 Jun 2026 13:50:21 +0200
Message-ID: <20260630115028.4001775-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B94:EE_|VI0PR07MB11914:EE_
X-MS-Office365-Filtering-Correlation-Id: dec7bef0-06cb-4fe0-962f-08ded69dcebd
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|23010399003|18002099003|13003099007|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	ZqoI39s33tWlnupZSH0kvdVaCpSW2c7sQReksEio09eaLSHI0nIOjTmYchlaIplF1dphLmasdzNB467jYMGUczCa7R99RQkO63vP7xSce8iqwaEDTUmnsKRKXVSKNfWmtD1SBghblM7tqQqKEaSsNEQxIIZdPzWApjZz1z27vJzJ+T+s9hMq1gKkGfh8LYLgN7HkatTws4IluxLWZADEq/TI7qSvKd4sYguLFQsT9x5bUaztDmHWLhiOds8eERwxoCy4psK8Tjt8HPbADuLWEvopcy/6h+ojgECstmeuJIIvjMwZpuLl+ExiQrcSG5D9Ub/zBGxQtFJSo0D8LjkD5dYayW1oLJeSIyDsjLF4rnTnY6UvpxxcH8ZWdDLGMPnBPYAa/NloueqpUoLKgkWW/cEb/JRdzhP06JtkEVglCEsJYcnNT41WoumwqczcRL64eyphRJK1X06eAg4l9j6MzWFdQgaz/tbwMGzrO4ze+CBJ/B+kAlLjy3x67JvZ1Lxaa1ZqEzGRKGpKrpy8cunmKQ99u09i6yta1HGa20kCv2YttawmqCH/uMO3EtLdfJvw9j8AWXYJyiqAO+1ztcLjf5ar376u+DVZffOTU/ZxIMCn7oMT9QaRobXC9wc/EVFqZsb+IcqVqoFc1jmq/t2ZSVMuGHbNiZnftyxrrdXmhKc=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(23010399003)(18002099003)(13003099007)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ymUC7vD7es8xXzPLmEVYOGGP2blQpg/F9p6Vh41IPlkuSjrovGcxxb8YXrGqm5qYIKhhK9Akv6EWg/KofWcanTSh4IFpQ/EMZwsUkXEQnlm4BTx6y4VgSFLPH2/wL31vdGz/iqN4577kNHddQOMB7TqjOQMNpMRUjab95r7DMboKWHnz4xgOUgMX1XC+Gj/ZagohAppL8GqLjJzrN/x3GbQfvFZ4zSExGl791dx3ysod6f5dPr9zJZ9Cl7xvVqs9kFO4d7DfoWs71bpyufkyeIPoSPoYudfQIhBoV5lebHlbWfYyxKNPVUOvYwWRor7zo9G6gSr3EJmAOoAFaq0vHpws8JvHgpk0MsdOLe8xcemdj5oyuIWYX3AaWd71PeHPIqbck3MXtyj8A90Mrqo+YYw8BkN7yuW+2MwMcoRZamPX3qUCJh4UFCYA59ciAhUD
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 11:50:39.9092
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dec7bef0-06cb-4fe0-962f-08ded69dcebd
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B94.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR07MB11914
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 11:50:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239880

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

Tested on rhel8.10 with testsuite systemd on qemux86-64

Daniel Turull (3):
  dlopen-deps.inc: treat soname list as ordered alternatives
  systemd: upgrade to 261
  systemd: add native hwdb generator for hosts without STATX_MNT_ID

 meta/conf/distro/include/maintainers.inc      |   1 +
 meta/recipes-core/systemd/dlopen-deps.inc     |   9 +-
 ...ve_259.5.bb =3D> systemd-boot-native_261.bb} |   0
 ...temd-boot_259.5.bb =3D> systemd-boot_261.bb} |   0
 .../systemd/systemd-hwdb-native_261.bb        |  32 ++++
 .../systemd/systemd-systemctl-native_259.5.bb |  19 --
 .../systemd/systemd-systemctl-native_261.bb   |  28 +++
 meta/recipes-core/systemd/systemd.inc         |   8 +-
 ...meson-use-libfido2_cflags-dependency.patch |  54 ------
 .../0003-Do-not-create-var-log-README.patch   |  10 +-
 ...il-fix-PCR-bank-guessing-without-EFI.patch |  62 ------
 ...-detailed-debug-logging-to-fdset_new.patch |  97 ----------
 ...idfd_open-and-STATX_MNT_ID-on-older-.patch | 176 ++++++++++++++++++
 ...t-mode-for-reproducible-cross-builds.patch |  36 ++++
 .../{systemd_259.5.bb =3D> systemd_261.bb}      |  14 +-
 scripts/postinst-intercepts/update_udev_hwdb  |  24 ++-
 16 files changed, 311 insertions(+), 259 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_259.5.bb =3D> system=
d-boot-native_261.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_259.5.bb =3D> systemd-boot_=
261.bb} (100%)
 create mode 100644 meta/recipes-core/systemd/systemd-hwdb-native_261.bb
 delete mode 100644 meta/recipes-core/systemd/systemd-systemctl-native_259.=
5.bb
 create mode 100644 meta/recipes-core/systemd/systemd-systemctl-native_261.=
bb
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-meson-use-libfid=
o2_cflags-dependency.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0004-tpm2-util-fix-PC=
R-bank-guessing-without-EFI.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0018-shared-fdset-add=
-detailed-debug-logging-to-fdset_new.patch
 create mode 100644 meta/recipes-core/systemd/systemd/Handle-missing-pidfd_=
open-and-STATX_MNT_ID-on-older-.patch
 create mode 100644 meta/recipes-core/systemd/systemd/hwdb-use-compat-mode-=
for-reproducible-cross-builds.patch
 rename meta/recipes-core/systemd/{systemd_259.5.bb =3D> systemd_261.bb} (9=
9%)


