Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC87FC44537
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 14:48:55 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.55])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24707.1784645328441078138
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 07:48:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=EUUXR+dE;
 spf=pass (domain: ericsson.com, ip: 40.107.159.55, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Em7HwBGoQ1DK2MVxM4padtWLrJwSQpFg7WjdHClpsE6Tq30475HoHVYDU0piqO5CnMIcEyxvWMHBvKgFN9D9Ore+4XvtRHbJMDqFGBT1+wRkZyBCtaYYR4Bf6rVhHxnLhJOkBRrO5OY5uM82wMJkN/iExm/cPBC30+lvpoL34DZKFhqYAuYvP+gW5nnVOD9Olg5C8hU62/grI99x62+NAyNol+TQQ3PwyeYZHkr+mjM08qyWnO7EpXp1VPVJ/EubvhLMKbx+7gHYeujIG0YckL3i6Jsk+TupBHow8Y2UTjP/TkZhC08KTra9j11PyPgzc4duvKKmcIGnfW1//IzxaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TV69DIEf6BWBxXFeKWT9hjy4K9yvjUQPE9epGkxmf40=;
 b=XtMapPOnevaqphCXnCItbgkfrsiYL79IrpJ3vtR0wxAVrmjBOHFniIBg3C8jA5Mc2kKuyTMETrHNVVaAgZ9niqbGAKI0bOjjKynh0UlCxBoL+V9+2xZgpXWEFYRRaDZl7XTN6aSuqclQ8wgVPrweL9Z1hyK8uSeQ1g5TDvuRJ0Schb8GtJRnS21ynAxnXqrwErzp+vLZqntjQId7QCFtZrESEXVk3fTxLCUTaugSKSAf0Rf1Bdq01cvXaNyL89IEgwVngSHmr9miqhk1+N0iU/97mLk3NROZxoD8xwjzhxi7TO5BBwW8TRfRKFjGtYWA633kQNx4pN3po0d5Tr9MJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=gmail.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TV69DIEf6BWBxXFeKWT9hjy4K9yvjUQPE9epGkxmf40=;
 b=EUUXR+dEwV0UpDI5YCHBy9Rx8D5m5N6bBc0IqLhXb6tco7Y07XkIS7jJb6H59yvHCKpY9GsskIaS/GFx+aJC8GVnWTCDOmdYCrNUpFeklARXK6IMad+uc9wjGwR6Gk05n5XDPowQulc8XGrwoHQY4JZLFcTiI+sWTQuGdQjQlgnahh9jCyYxi5n7Oz9SBaJ/aL9lFjJGBZMOM7RMVNhQd/DRPD7+GPy1ybDtrJ/e3WWKt3y3QdmA9QR1jhT0P015Bl53JxT3F32cbTKlskQTSmv+p5SbPcDnObzV1cx6YPkhxFBkumKwaV+QYQV2Akp4bNi9+JKMc2HwbARpxuUO6g==
Received: from AM9P192CA0022.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::27)
 by VI0PR07MB10828.eurprd07.prod.outlook.com (2603:10a6:800:2c9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 14:48:43 +0000
Received: from AMS0EPF000001B0.eurprd05.prod.outlook.com
 (2603:10a6:20b:21d:cafe::8f) by AM9P192CA0022.outlook.office365.com
 (2603:10a6:20b:21d::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Tue,
 21 Jul 2026 14:48:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AMS0EPF000001B0.mail.protection.outlook.com (10.167.16.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 14:48:42 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Jul 2026 16:48:42 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id 351494020B6E;
	Tue, 21 Jul 2026 16:48:30 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 0C3CF700DBB0; Tue, 21 Jul 2026 16:48:30 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>, Alexander Kanavin
	<alex.kanavin@gmail.com>
Subject: [PATCH 0/4] Add missing tag parameter in git SRC_URI
Date: Tue, 21 Jul 2026 16:48:04 +0200
Message-ID: <20260721144811.323786-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B0:EE_|VI0PR07MB10828:EE_
X-MS-Office365-Filtering-Correlation-Id: 997917b9-efc8-496d-2d67-08dee73728f9
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|376014|1800799024|6133799003|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	BkcFtbjZDCEXfqH89T2ePUS6vETMlraTfmDiQuEGufCrNuPgYZSmgzH0XjCmQRt8YfxvwpiCBYbY7Dzku/FE1WZPPyglGEHDX4ZKci/7SUwspcsldkwOAPrER2KQsvXWwo2GQUN3AnqTO5EDBbSRmBvl1eKah7Nfeg90604KW4C1cpjf5vyEYuh8dPkz5Gr8TuZMc8MTdrSgGx6WuLvVjWKoSzaO2o9vm0m/SvOK6KK3qCsy9707Ee1HKSWQfzr2AEby855EY3JfEbj9+RYKReHRDdUoBdPIvWqAUBBaKIfFDT//dTJhvO1pVb87RyY4SAQ0NCMWc9uX2I9MqsaaesVSFAF4H8RnjhFUgynl4jy5XuB7AuZWv7TGl/tWovywODR1ndtrmjBe+DEAnfkOJcvyAMFitGCc8030VKmXDn3POZ0PeJoFIZ/Ins1HyzRDzmii9m8l2GHLZPF7eUmcTBesGVEjbmTHyw9vaLkMS0lwPqXHf3gucJaBD7hmBeJ+3CADcqDrhDcmCar3C7/XrX4OxBjM+NJc1GwvPldS9eI1ba7JaDRINiELPHuUbz0pvIVG/wcyKQaQCx2xofsZYw2GViungU2zTIVJwWCgjLt35r+x+P5ZDXiepObWM6FsSGJIuAaYG1QvGTssLYUrDU3cDRSAXlu1TV3ykL77VD+VH8s4qGJiGziKCGVEBRNIET21TT1LfVCazZlMZJkkHw==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(1800799024)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	+sQlexmWrF4zzv0Lzk7ovWFrdDeu4xGJzQZnVy2cvHXnBbCSdieAkREimvRqPzdRtDlCJCaVqm4l4JWRpIw9bTPxn2y+Grb5gwafR1jBy9fQJm7LGorcKeJIbvEXOlAMCtbe2d1IM9J1x8JqLYZbLRszkPcKMwMUP9v/nczERbfejVZHAi4ySld0GI/wWt95ENRZTJxCT+vmAImIBP/F24IJ6piqI/IKB1Vh6QLDgdnIMdC3oENUJ2AH2WKVbDVJQQpw5A1SxsFy0hz0u+cM+P6IA/SUPzMdDgFKF+NufYeGELiqcp7l32yCO8QASeQLYO+hXeEaYwBRQnRWbua6yEjxdaRLafY0cmxMj3I75h5erq5CEiDLyvf2mjpLVwP4gF6YnpP94GTIYOORw6DQRypyjiLPwD5R0OwaRGQO1I1TTtVbvDVj8/lGXm2D7Zsd
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 14:48:42.9224
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 997917b9-efc8-496d-2d67-08dee73728f9
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001B0.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR07MB10828
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 14:48:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241545

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
Suggested-by: Alexander Kanavin <alex.kanavin@gmail.com>

Daniel Turull (4):
  scripts/contrib: add helper to report and fix missing SRC_URI ;tag=3D
  Add tag in SRC_URI in multiple recipes
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

--=20
2.34.1


