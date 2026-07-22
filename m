Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32C47C4453B
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 08:52:13 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.25])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43625.1784710316112325928
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 01:51:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=aiklKBYA;
 spf=pass (domain: ericsson.com, ip: 40.107.162.25, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T4WY4ImM18RuvsBnXPYCi+KMiuPm/Lumag/eWu3+j+31LkGeLjche0iK85rRBtaReUQzeCqFkJuSYfwVSTzYb5cLd0HfzMaRW+Td7WL2WucuHKRsTqyrPwspFWI/tjOgq8G63knWgFJcybWz+1pw+usGcvNRZgcCZ9wRNKY5vER+m4BakHYZWBiw3hhpNgCg3vSWYjh8Jpu0xK6j4bi1N07W+BxJPCmhR693zDx45Pwitzg2rYUuOgzHM4c4cDpiBridJYwnekfo34sulPmOWM2c0QDqCquWjY9zcB/JC3QXPQh6O1ZIf0hajelL/vo6fkLenr3e+Jk7QSzYAiqkXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qmPxGIokfrjdO2mvbxOcb8vvKKYj6uMwr0i+yDeQ3Fo=;
 b=vign4Y+HCYoXfR2zFoHWZtTMzN/vQHgxgVhB8W6AcP3a5Dj6meVeu00GUGz3MmOW1EeCgfupHDyh+UFWjWdpNWinZagKPvOnuCPK5X0w8B9M5Y5PyYHV3TDETyvNnDTVtHHrCYFiJxl8iJCa3YD7NSURIxgVC7KF/vdAverFsjsfNBiZCBSu/MKdcYIqlYTPhFkXMsAeFZLzVZWCS5wY/ImZJ6OxvOLmchSNTd+4CVZS0j7rf8+o27EeQGyjak55ZRkFyuOcMMGSqrc+lP8UKCGW9sztVEF+Qh4s2tc+O7a3XxszughlQ8yscKl4CQB7BacQXCudBCFL1juCdVBe0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qmPxGIokfrjdO2mvbxOcb8vvKKYj6uMwr0i+yDeQ3Fo=;
 b=aiklKBYAbDuYWYAm+IliPgpbcrNqNRQQaZ14sbDAJFUtvP7rI3xMRNj1NzOg8XQyI72eNetRQDQLgrHcEIs2WdyEPkxKi4S0d4AqasY5Dy4DYYjXzUlifR3IdmJanQiJfmIeNcH++mGe7iQPYt3Tn9c/NUOv066EqNhrxx11QXW5oH0f3466ZQOUbtKAQg10dfNbWLZYTeANtln6YtO1AJ/Vycw0Z61SNFkpHeCc+uzWwwg4yXWpYeLCIL/+cDHNIETi1C//oXqPjgSojYsH3aTVIJwFpFFLS9PldglVCWHChpKWesE2hk/RwAZ4ikFyg9Q2p8IIROg5WG08i7xJkA==
Received: from DUZPR01CA0001.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::10) by PA4PR07MB7631.eurprd07.prod.outlook.com
 (2603:10a6:102:c6::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 08:51:50 +0000
Received: from DB5PEPF00014B93.eurprd02.prod.outlook.com
 (2603:10a6:10:3c3:cafe::ae) by DUZPR01CA0001.outlook.office365.com
 (2603:10a6:10:3c3::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 08:51:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB5PEPF00014B93.mail.protection.outlook.com (10.167.8.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Wed, 22 Jul 2026 08:51:49 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 22 Jul 2026 10:51:49 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id 7B1A94020B43;
	Wed, 22 Jul 2026 10:51:48 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 41F83700DBB0; Wed, 22 Jul 2026 10:51:48 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH v2 0/4] Add missing tag parameter in git SRC_URI
Date: Wed, 22 Jul 2026 10:51:34 +0200
Message-ID: <20260722085140.2355003-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B93:EE_|PA4PR07MB7631:EE_
X-MS-Office365-Filtering-Correlation-Id: c0526720-f7ec-4c2d-3bb6-08dee7ce784a
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|23010399003|18002099003|6133799003|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	JQw583kx9IeVYKxfamzvMcxiK1ZPt3Lz8OInkQWnLEUUq1m8NuwYU4D1tHLfmpehQGqrckDDeedm/kwX8D+v4U/WeJy6V/cKgYZzJk1ye/RdYrQ2HEZduDASKX+HD4WQdN4kiosKmPYBe6XFf5GZAAij09Oo/YdxIzzCP4rSyg7jgQ6XVQDxxW2tZ00p6x0VtEPzDDgESxzlXinw6azynkm6ps5FvQ7/mAzSF90jOCqZyPqDg5v6irlKnwSihgQVdarioBe3JI9ByHEl4widbf5EPs/PfNkU67zXeV9sB0XZmmmRYac3bC7tvmS+eYaT4d6zu8u86Nke0kOPkh0PDPHKf3zVS+QnmaxXZMlf8+FC+Z6gfglyaE8X+P45+K5zIzLywuuglt34ge9fFGMIG9cTYbzoPjNcPkqHqTMEnu3aSTQSu2UZGOxu3Wo+SHfWkyM/mHJoufiXyjNV77KUyZtXksqQC4WnYOosEm8BOKrD9M3rY/jEQuHBVsrBehZQz9/PKgmL5nR4o44vB5vha+cF8LneIQZ2+gEkz5ICtterUpQdFlFDtejXf3sW4yqixNpyF1MVVlI7LRrjUJfL3FgU9FvN4witjzuW8hdaP/HBEXGaHW1k5/Lh6BNflubkUkGyyFzVHfgSaN7070SHHZyraZ9mA9t2d/d21lJQFV2G4GxNjCdXLcxrPqQEfKLSP8GfE9PYb6jJKrNR5otMLQ==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(18002099003)(6133799003)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	IyOThP9ArJyDCxfm4vLM+gf8ogx74EU91dFkIKElg2j4TryjA8iZgLC0FNa/tVsrsm8VFgihd90FUyyvHEOdwG8lp60s0U3daXR/wC8QLwFiNPhwG1Z6/eLlbmOGMcwReNJsLcw2K0ns3MDIzIiVpE+ZTZDwz4U9Ik2kXr1i/hNxns9nzLtdVbqQaP5QmYV4adY9GZ8D3o+rrckdiBhpXU/zPbARBg7vEN4wnPu0LMlTqXzJW175JHrwUZlYe5RY8sgwWHhuZsmA+scajDb3AhnPh2ySh8ALu6UxRmqJ2DfteiGtydesoiPMBbU+T200+OB3wER6/gSc5MjQ2vZu51ghMlijC0uSspcyF9C7Hk6fu9kE7JttlYWey0pSe5Y7T07tatOcUhfg5CNPdUmbg2q21vuCwhufX5FixkndZvdfBWLQzH5i0/jj9LC5bBTs
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 08:51:49.9813
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0526720-f7ec-4c2d-3bb6-08dee7ce784a
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B93.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR07MB7631
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 08:52:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241629

From: Daniel Turull <daniel.turull@ericsson.com>

Create a script to systematically check and add tag=3D
into SRC_URI to track releases together with SRC_URI

And update all recipes with missing tag that I can verify with the default =
build
with -c fetch and do_unpack

For reference, this provives:
1. Human-readable provenance

tag=3D documents which upstream release the recipe is tracking.
Without it, you have a bare SHA hash in SRCREV and no machine-readable
indication of whether that commit corresponds to v1.2.3
or just some arbitrary point on the branch. tag=3D makes the recipe self-do=
cumenting.

2. Fetcher-level verification

When tag=3D is specified, the fetcher can verify that the tag actually reso=
lves
to the SRCREV commit. This provides a sanity check =E2=80=94 if someone bum=
ps PV but
forgets to update SRCREV (or vice versa), the mismatch will be caught at fe=
tch
time rather than silently building the wrong source.

The script has been done with AI, which probably makes it bigger than it sh=
ould
but it covers corner cases. All patches in the series are independent.

Done on top of master-next
---
v2: rename patch using meta as target

Daniel Turull (4):
  scripts/contrib: add helper to report and fix missing SRC_URI ;tag=3D
  meta: Add tag in SRC_URI to multiple recipes
  cryptodev-linux: add +git to version
  xmlto: correct srcrev to point to released version

 meta/recipes-bsp/efibootmgr/efibootmgr_18.bb  |   2 +-
 meta/recipes-bsp/efivar/efivar_39.bb          |   2 +-
 meta/recipes-bsp/gnu-efi/gnu-efi_4.0.4.bb     |   2 +-
 .../avahi/avahi-libnss-mdns_0.15.1.bb         |   2 +-
 .../connman/connman-gnome_0.7.bb              |   2 +-
 meta/recipes-connectivity/neard/neard_0.20.bb |   2 +-
 .../slirp/libslirp_4.9.3.bb                   |   2 +-
 meta/recipes-core/seatd/seatd_0.9.3.bb        |   2 +-
 .../sysfsutils/sysfsutils_2.1.1.bb            |   2 +-
 .../bootchart2/bootchart2_0.14.9.bb           |   2 +-
 meta/recipes-devtools/distcc/distcc_3.4.bb    |   2 +-
 meta/recipes-devtools/dnf/dnf_4.24.0.bb       |   2 +-
 meta/recipes-devtools/e2fsprogs/e2fsprogs.inc |   2 +-
 meta/recipes-devtools/libdnf/libdnf_0.75.0.bb |   2 +-
 meta/recipes-devtools/mtd/mtd-utils_2.3.1.bb  |   2 +-
 .../opkg-utils/opkg-utils_0.7.0.bb            |   2 +-
 .../recipes-devtools/patchelf/patchelf_git.bb |   2 +-
 .../python/python3-dtc_1.8.1.bb               |   2 +-
 .../python/python3-pefile_2024.8.26.bb        |   2 +-
 ...-check-update-cvelist-native_2026-06-24.bb |   2 +-
 ...eck-update-nvd-native_2026.06.24-000003.bb |   2 +-
 .../systemd-bootchart_235.bb                  |   2 +-
 meta/recipes-devtools/xmlto/xmlto_0.0.29.bb   |   4 +-
 .../asciidoc/asciidoc_10.2.1.bb               |   2 +-
 .../cracklib/cracklib_2.10.3.bb               |   2 +-
 .../iputils/iputils_20250605.bb               |   2 +-
 meta/recipes-extended/libnsl/libnsl2_2.0.1.bb |   2 +-
 meta/recipes-extended/ltp/ltp_20260529.bb     |   2 +-
 .../net-tools/net-tools_2.10.bb               |   2 +-
 .../xinetd/xinetd_2.3.15.4.bb                 |   2 +-
 meta/recipes-extended/zstd/zstd_1.5.7.bb      |   2 +-
 meta/recipes-gnome/libxmlb/libxmlb_0.3.28.bb  |   2 +-
 .../libepoxy/libepoxy_1.5.10.bb               |   2 +-
 .../matchbox-wm/matchbox-wm_1.2.3.bb          |   2 +-
 meta/recipes-graphics/waffle/waffle_1.8.3.bb  |   2 +-
 .../xorg-lib/libxcvt_0.1.3.bb                 |   2 +-
 .../recipes-kernel/blktrace/blktrace_1.3.0.bb |   2 +-
 meta/recipes-kernel/cryptodev/cryptodev.inc   |   2 +-
 meta/recipes-kernel/dtc/dtc_1.8.1.bb          |   2 +-
 meta/recipes-kernel/powertop/powertop_2.15.bb |   2 +-
 .../matchbox-theme-sato_0.2.bb                |   2 +-
 .../sato-screenshot/sato-screenshot_0.3.bb    |   2 +-
 .../gnome-desktop-testing_2021.1.bb           |   2 +-
 .../libdisplay-info/libdisplay-info_0.3.0.bb  |   2 +-
 .../libseccomp/libseccomp_2.6.0.bb            |   2 +-
 meta/recipes-support/lz4/lz4_1.10.0.bb        |   2 +-
 .../recipes-support/numactl/numactl_2.0.19.bb |   2 +-
 .../rng-tools/rng-tools_6.17.bb               |   2 +-
 .../shared-mime-info_2.5.1.bb                 |   2 +-
 meta/recipes-support/xxhash/xxhash_0.8.3.bb   |   2 +-
 scripts/contrib/check-srcuri-tag.py           | 483 ++++++++++++++++++
 51 files changed, 534 insertions(+), 51 deletions(-)
 create mode 100755 scripts/contrib/check-srcuri-tag.py


