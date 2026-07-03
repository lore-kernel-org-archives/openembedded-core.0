Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB7A8C43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 07:30:37 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.88139.1783063828305176657
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2026 00:30:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=CavUwT5D;
 spf=pass (domain: ericsson.com, ip: 52.101.69.43, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vQ035eidDZq3UU6z63oBxJTUIDl2/KxtJVIs3TVs1VubmU1D5VqvWKxuWMwqOu4c2cTCAKIz+xg4fHRfMXhyhey+oatouQ4eo0UzJizNkj3cwiGpUKDGCx2PnRZd7Ch7g2XEX/YiKRganEPiXqfzNp0NrsIVIcy6+V6Scp9YItoy4uV33MKBGA1fp1RtwMvqzbSiXpFwtAiP+1BNmeJWi8ywBzQAnPPoFCVMwrGRp1vXwjpJlfvhuQLmBylQe4TYBrMb9T52SpBZa9koivOvmwGT7PzIlXDFugeq/uSKsEYqyIWIv0y97ThqUnS4kosDBact4xLjSnvXDnhKL5nLSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zcjP8XVN7oz2Btr565lZ3ZESPbWT6rBKgA9kvrBjXQQ=;
 b=DxvgoWV9aNyEc+9Jx4CpD28olXdI6FXKdxFuFSn7IaZuQRVEgYG1SWwWyg7VAHYJMLAqpj0jceA5XKjJLMUhX7v0U1Ai2lwLR/UjT6BicGrz2uTQb3qxmiRgtI1jyyzT8V4cKBzZOhZqBLrgamvgg5MxqsNbYjg0mhpS0GwJfqiP0sNOmxWMnDKmaR4BD2UIRNNdVCTP4CvMK09gx8ld8v4aqJa7QmW6spazN+hk0AXxuVnDoVs3tRsQh15BR+MKlP0QF7MeVFky/soFiuu27d/CWistNCANlxTC+OYQ6pluMg7skEfds4foJ5eEdoez/JQHCq8X0WdgK6Dp0gpq4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=arm.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zcjP8XVN7oz2Btr565lZ3ZESPbWT6rBKgA9kvrBjXQQ=;
 b=CavUwT5D2eyz7Ui44wa2UwMtL3YzOy3lwbJQBJtWh3Qkx8WL4aGdIuS8tnfZF9B/UWBHNQhYvtjZZ8GW/6Ze78bl0lzHznimbtv9hsr38VKU0QiNpYdcUa2J26B0/FFfkfpUNAIOdLXmX19Bcg4/1fwLQY0SPcU0NKI1m6XBZ1TH6SgyGcrRQBuRC+kxfONg3ooO9mG/xTsHVJKuSb7fpcHy/ulKJACpXsB0pAVGnxXLUSH+R5iCrC3cI84wkG36g60Hxf2geHnjYhkMvrzYiUXr2oi5VGWMx3O9X+l9f3E/4y49GV12KVJZm/k02Ud/syCdrqtqQeJXjRSzjdx2BA==
Received: from AS9PR05CA0154.eurprd05.prod.outlook.com (2603:10a6:20b:496::13)
 by PA1PR07MB10952.eurprd07.prod.outlook.com (2603:10a6:102:4ff::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Fri, 3 Jul
 2026 07:30:23 +0000
Received: from AM4PEPF00027A63.eurprd04.prod.outlook.com
 (2603:10a6:20b:496:cafe::2) by AS9PR05CA0154.outlook.office365.com
 (2603:10a6:20b:496::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.11 via Frontend Transport; Fri, 3
 Jul 2026 07:30:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AM4PEPF00027A63.mail.protection.outlook.com (10.167.16.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 3 Jul 2026 07:30:23 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.63) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 3 Jul 2026 09:30:23 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id 87B659992F;
	Fri,  3 Jul 2026 09:30:05 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 205E0700DBB0; Fri,  3 Jul 2026 09:30:05 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <daniel.turull@ericsson.com>, <openembedded-core@lists.openembedded.org>,
	<ross.burton@arm.com>, <mathieu.dubois-briand@bootlin.com>
CC: <anders.heimer@est.tech>, <qi.chen@windriver.com>,
	<alex.kanavin@gmail.com>, <richard.purdie@linuxfoundation.org>,
	<joerg.sommer@navimatix.de>
Subject: [PATCH v4 0/2] systemd: update to 261 and be compatible with rhel8
Date: Fri, 3 Jul 2026 09:29:30 +0200
Message-ID: <20260703072948.2939128-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A63:EE_|PA1PR07MB10952:EE_
X-MS-Office365-Filtering-Correlation-Id: 771d8f91-298a-40f9-4799-08ded8d4f1d3
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|36860700016|82310400026|376014|13003099007|11063799006|6133799003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	exEWaVFWrUhiTSTCJeNpqKCGFnGh8p2CqLU+Q3klb/fuz+iJ+ED4wB6E9NWfYy5YNt3pu5Uh0mcgDV+6IjmmsODpRzifkGUvfDxxhTaGPFUCJsopq8cZ7PLY3wizyABtOHg8CIVCHlKaNCpWg/iU732FmAcZk5IYj/Bf59cPcIlsMt1kO2yDU0jUDppVjgu2ppZbG/j9fm/96o0UcQDZ+E85HBkRD0HBkuoATS/YoesI4h9LUBnILRDkqxIA98Ep6dRO/v9Pwl+r/DAJsxUCHLiGijeJIkMncpP07qk5PKp8zYqcy5YRcwuc1iHxQ/mhzH0W9+cPmTlDxGuSWyhz8kiIjW/8jRzxx3d5zG42pJUAuLQCANc1ob8f6c0R6CMTK/bwRaYwZZfK+ZG+n0xIugroH3wCwIO/Lg4I1Yw5/CMgsXzsJ6lhpRP2rC0lwIoAOdN0jnx7VDfx/WeivdhFqWZF9SdyY7+AW2ihvVUcIRqnatOISXweYse1MM7iorhb9nP+JTn1pzP0qSGNL88ZFXkgeWb4bjybsAY4UA50JUvBSZKfrtEC1Jpf6TWEZXyhePhQ0qaGncBrTMR82Wl3EsM2T5adg+kdZlPeeYo99MF5Xz+PRPDBSfD+FjTD+nx6nhypL3zVFpszg9PTDIGj3Q==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(82310400026)(376014)(13003099007)(11063799006)(6133799003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	WTnoOQt0cjgLZ/VcYeCGBbrg/t45W8g2tBA4qvh6E1u6tXiYewox1SBTZ1WFek09bxvGkui7eiMyE16tILFaa/vG0x0+H3mZQ06fN7PxD8z8s7CILdSsIPMP6tqYYlxck794NR5vvFchJgdoEDHghmy4Gmaw6IfIQsvGeGERWREjE9mSwJmuWqtT195+Hk7jF85awKtBN9ea8MYsbX+i9Q7EkztGn436+Be9u7wa8NREARl37xJHFxmeAOmBTDbN1tSk62Wtd9wvW0NE6pdJCxXEk7Ozpeo0gC0u+kWaSwBMSRGGW5a92Y3xULTPOzHbul8m5kybWUjk4bZ2LWgQH35r/09Pr5G0Wjx2mfYaybebZn78Nte2bIhCwWgxMYs4FePwcyjEr8qOzQ+OQwIPb5RL0gggCjImYCUD2ZZe6BGZwTucFTPluv0ybPRggC62
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 07:30:23.4407
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 771d8f91-298a-40f9-4799-08ded8d4f1d3
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A63.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR07MB10952
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 07:30:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240079

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

Tested on rhel8.10 with testsuite systemd on qemux86-64

Daniel Turull (2):
  systemd: upgrade to 261
  systemd: add native hwdb generator via merged systemd-tools-native

 meta/classes-recipe/systemd.bbclass           |   4 +-
 meta/conf/distro/include/maintainers.inc      |   2 +-
 meta/recipes-bsp/keymaps/keymaps_1.0.bb       |   2 +-
 .../initscripts/initscripts_1.0.bb            |   2 +-
 ...ve_259.5.bb =3D> systemd-boot-native_261.bb} |   0
 ...temd-boot_259.5.bb =3D> systemd-boot_261.bb} |   0
 .../systemd/systemd-systemctl-native_259.5.bb |  19 --
 .../systemd/systemd-tools-native_261.bb       |  42 +++++
 meta/recipes-core/systemd/systemd.inc         |   8 +-
 ...meson-use-libfido2_cflags-dependency.patch |  54 ------
 .../0003-Do-not-create-var-log-README.patch   |  10 +-
 ...il-fix-PCR-bank-guessing-without-EFI.patch |  62 ------
 ...-detailed-debug-logging-to-fdset_new.patch |  97 ----------
 ...idfd_open-and-STATX_MNT_ID-on-older-.patch | 176 ++++++++++++++++++
 ...t-mode-for-reproducible-cross-builds.patch |  36 ++++
 .../{systemd_259.5.bb =3D> systemd_261.bb}      |  14 +-
 .../modutils-initscripts.bb                   |   2 +-
 scripts/postinst-intercepts/update_udev_hwdb  |  24 ++-
 18 files changed, 292 insertions(+), 262 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_259.5.bb =3D> system=
d-boot-native_261.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_259.5.bb =3D> systemd-boot_=
261.bb} (100%)
 delete mode 100644 meta/recipes-core/systemd/systemd-systemctl-native_259.=
5.bb
 create mode 100644 meta/recipes-core/systemd/systemd-tools-native_261.bb
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


