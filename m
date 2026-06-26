Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E48CCD4F26
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 07:38:39 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30166.1782459514790454939
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 00:38:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=GyoYktq9;
 spf=pass (domain: ericsson.com, ip: 52.101.65.28, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NsJ7p+g6ODzXm7itEFPavvuyoAUs+Dhu2o0VMGiMxGpTgU4by9YUOM/LCGKMWWpfHRVo/Vb7HCCYhIYnZlYtg1zsxRuPA2oexcj2kORuozY3OC/BGa4h/J6DR6+fYF0mHX6vcZ//5jpv69az0NeLrmcxBKzoIBReEpFasqCXBjTtFCAXmN0X5kKERSnnoXqtMQVlDGM08lEZP3dP99mt0dBjS/9FWuhMHYLum4hR/AZYDY2OZqBjMEv9wYKWknjuPWFI7SiX5zdilP6Q/o6GO3sK8/SWWqm+WNQ4myNTFp/fVy2F+HNLS7ntk1DV0KaKKixFWhlk7T3MQJs8jtQXAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p6cfwTIM4cObvJC/9GHCUjsPZSZ8aseNE/LEVEcJ85c=;
 b=FGpIA8lSGn+BMYqdrncKX86ryXYDL9QiT+4xRku9X/a+7pPRyE9Um+1ww10KQvV6Z8+serTewyB0YDevf7VqY3oKp6URApJ3ZnX0Qh0ASP7M3/Hq/mZwIi3WJy7lVMWG1BAFODtFSnzWQq+2VzOSVHo4QZvEe+xeLQS2saVbm1G+V/AE0WCBy3xkeIAMN4Er9c2yeViaajbNC+WSzD673cwsSfsiHSxr27jGAtFHC01gA7tTL4di9zLi/qjMcAMJHQd0q6Fx2bfnKHfzbuTAGwwtOYhbNvhhqrIM/pIoDopF4htIxKllENrOLushtpMqBGPLzdZ4r+ZfFYX7elYC9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=est.tech smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p6cfwTIM4cObvJC/9GHCUjsPZSZ8aseNE/LEVEcJ85c=;
 b=GyoYktq9O26eTaC78owax8QxCL8PGkJw44lf033HYD4UYt8ysrA1x4tfXzJyIi7SspfAKtjRXuludCd8CQ4pSFZBAoGxla9aq80lI1n8ZBkBNNV06E+39oq9+dde8DZWppTzUqAJFELHrsz2ocKPcvYWjFghNQ94yy05j2HjdwESL6h5aYH3daR6eZv+M4RHX642onV1NcSB2aeiTPxFKkn7bX05FH2rjZBd14LrdRjf4cLHfh/Ky2qHH4yUNT9784+IstDSHgXGW68iYYz4ykViZF4rLrHgdhP56c+U6eIDS3gpugUBJHxW9z6puhmX3N3Qb0LeL7od/NYCdBNCRQ==
Received: from DU7P191CA0005.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::28)
 by AM8PR07MB8106.eurprd07.prod.outlook.com (2603:10a6:20b:36d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 07:38:30 +0000
Received: from DB1PEPF000509FC.eurprd03.prod.outlook.com
 (2603:10a6:10:54e:cafe::85) by DU7P191CA0005.outlook.office365.com
 (2603:10a6:10:54e::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.17 via Frontend Transport; Fri,
 26 Jun 2026 07:38:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB1PEPF000509FC.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 26 Jun 2026 07:38:29 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.67) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 26 Jun 2026 09:38:29 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id 960304020E9A;
	Fri, 26 Jun 2026 09:38:19 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 658F1700DBB0; Fri, 26 Jun 2026 09:38:19 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <anders.heimer@est.tech>, <qi.chen@windriver.com>,
	<alex.kanavin@gmail.com>, <richard.purdie@linuxfoundation.org>,
	<joerg.sommer@navimatix.de>, Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH v2 0/3] systemd: update to 261 and be compatible with rhel8
Date: Fri, 26 Jun 2026 09:38:06 +0200
Message-ID: <20260626073812.769193-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FC:EE_|AM8PR07MB8106:EE_
X-MS-Office365-Filtering-Correlation-Id: cfc65ef0-5322-47fd-fb2e-08ded355eae5
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|376014|36860700016|82310400026|6133799003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	F4wMty3KXR0ZZOXhicH0y/mDSD7BEvU/odyn/TOiWsgI4S0yc9W95tP0s6+c8bN2Pg9wh3HGzchC0V5qDnUyNrbQkrG8bO1DOB2vd0nCr2pwJfAdrzg+0GmK/QU4usZ3mE0FY77gqksStPo+Du45z7Mgt0dFXvCZopqA6HOyaGuMrnxXp2cWXU8UvNYOLmvRvWZyny61e29pFtrTxJQR7rygS2220UnnkwD7fVZVAGrfSeDyK9u24kRVteuyN3fNYBLUMmRCqr4rb3ojNUxWQDWBGn0U6w+q0jbQGbmU8FKUIE1Sh6oI6QSMyR2AgIN97YP8Jfcv7PR1q8EgEsjvUB3V8VuVSFq3CkDRde4/l2YdQ2+G1y54Ok/20Z2Q/LX/uzW128Ws/Sd46IT8B4ArfW4HkBvXo2PYN/OMKM/o1b3pxXnfdJh1CJh8UBAQjCK6wSvLCo/YkU4PmiPPMPok36NyFR2GN2iPev1qKM2fuwATN8EP+aM9oydMU6D4852unN8QbGHRVpMqQVkDui2gTSIxZSaWCeesfM1YyjbpBYsl/6+BD1KBn2X1IrQvhDpegmtlAXfcEgPHeH1oADNIsuiMB+/6QCrGApMhbGrckPb6VfFfX7GVGGyNxbFrEVd4WJIPqBkuTwtIDIPtp7BmdJL5SD5schUG3JFYmNAfrcH8MAhccfggYoPuM83pnomGwb7XQNGQneTWbOQZjGD+8g==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(6133799003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	d6lyELvssShTfthurVqaSVMcXcOT/ZZPEhbXiTCECTCZnZd2V+9Ax+NSKoG3SRB/eylBV/InqY+zej8SuTpTld5dvsSY+sw7zmJT4ND60V/F1w8GHLyU0ysdOwlb2m/gCFwi7yk4SqqjfxlHE+VG8MsoZIMLasA+eG8kXEITn+/G5klVa4auP0v5UzU8iykhNaa8txTHDn1Q6NW24nXYQ0B1V3kbXpWfQA8Ah8gSArB2blPKgPjPCnLFUlyzgUufZelyzl+r8zYaNW2L2Dj641wPJxFqNsty5YKj2x1mY/HMckHSF4pz633owWHSA3BOFvQ9e3waTeBTPpyQRyzLnIYyTKv7U8ptCSluOKzqnBZCVEGqbenc4jabzSMXK/KXapA0ianeZTleYMrJhU/p/EEjPGReNr2GuDQzGmfeguskgKf91hU8e6t5XjSRVu7r
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 07:38:29.8611
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfc65ef0-5322-47fd-fb2e-08ded355eae5
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR07MB8106
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 07:38:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239609

From: Daniel Turull <daniel.turull@ericsson.com>

systemd increases the dependency on the host kernel,
which breaks builds with rhel 8

This series add native patches in the systemd tools
to make it work.

v2:
 - re-add tag verification in SRC_URI

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
 .../systemd/systemd-systemctl-native_259.5.bb |  28 ---
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
 16 files changed, 311 insertions(+), 268 deletions(-)
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


