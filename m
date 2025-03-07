Return-Path: <S.Mueller-Klieser@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC57BC282DE
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 13:44:09 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.123])
 by mx.groups.io with SMTP id smtpd.web10.11158.1741355047004529448
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Mar 2025 05:44:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@phytec.de header.s=selector1 header.b=ABjqsU12;
 spf=pass (domain: phytec.de, ip: 40.107.247.123, mailfrom: s.mueller-klieser@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bFjBN02w6kXgPry3xtqU5hgE4NFgeCKOO0CunOIugHTapbuYCYHcmP/CV5dxf32kUERP9/dvbBEktoquFu7Psy022kYDgBjy027XMSdGRqIbj63yMMi5JSM98y1SCCTAISVc38yruqZvyXk3Bb47F5cTq5a4sLY5QQj/7uNr8wZOsF7rc65sYXMDjunZmrOCu2t7bj5f32nxcr78PanRK1QOKdIk8NAXC4AeQ+KXuhTVt32P7iSk+Qgv+5O6qq8FvTGZTAol/8bdi9z+aEM6Me9ybS3H8DTmmfa2mmO8tep6+VbRQEFM12k71uhLhUk48n5a/ENSnGZWq9pS5XYbNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DGcj3mw1+Wn1Rai9wYVwtcRSKAFiiAko1f9FvpsHJ2M=;
 b=Yeab6JAGzv+uS5qXvheJaVgJUYleMBHXQq4J9R9/4Vrukg/gbRSAh/fFeihz5p6PKFQSJs3Xjp/gwGhELTTYK1hE95UXVd95mriIDAnqsccT7SQOqy46LIuAoGrlql6ENdpoJlbKwOzx4mELaqweRSdjmtyEetru9Sc/LzkLEdxwW/7UyXYuTo64RxySkn9PTP12gHtiKRlaioiw/95jfYyJKmAQDLbak/7KDr5J2g+nrmHoGe8PGlfYeAV3taK0oJfONyRt74PAIov8nj0LW0n9odP8RoEAnPi0hOnze5YlPYsRC2eAwdupX9tVGlla7K3B4JZYZtaP/wks465Qrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=phytec.de; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DGcj3mw1+Wn1Rai9wYVwtcRSKAFiiAko1f9FvpsHJ2M=;
 b=ABjqsU12cqdSmnPdZNgIhMV5eoKTzu3e6E6t14a3/WFWbQi+1UC/z1PtUZdNEZBOShjKaaitD3jMq8E0d9CuQehvMlio7VCdpueKND2lrdE26URt8XdKNVAwlE2mVvlUgGriqd0Fch+9SodgBX7w8OROFOr4A3u1ewZ/2mOP4M1tIEGLjX3sQf9GgVUg+H9QPu4ls01BhtHofKan/i0VCa7cwY3T6NK+snNAEkD0AtbXTAsrpdjIAiYqAqu/9wAhfsioCp66IYNq0wmjJmM00XYE7V12hSOsPq5ptk8ylWW4fIlaJpFu/gF2N+gYDBrQyReXOARxXrArjJK5W8MkqA==
Received: from AM0PR06CA0083.eurprd06.prod.outlook.com (2603:10a6:208:fa::24)
 by PAXP195MB1168.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:199::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.22; Fri, 7 Mar
 2025 13:44:01 +0000
Received: from AMS1EPF00000040.eurprd04.prod.outlook.com
 (2603:10a6:208:fa:cafe::1a) by AM0PR06CA0083.outlook.office365.com
 (2603:10a6:208:fa::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.23 via Frontend Transport; Fri,
 7 Mar 2025 13:44:01 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AMS1EPF00000040.mail.protection.outlook.com (10.167.16.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Fri, 7 Mar 2025 13:44:00 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 7 Mar
 2025 14:44:00 +0100
Received: from [172.25.0.52] (172.25.0.52) by Florix.phytec.de (172.25.0.13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 7 Mar
 2025 14:44:00 +0100
From: =?utf-8?q?Stefan_M=C3=BCller-Klieser?= <s.mueller-klieser@phytec.de>
Date: Fri, 7 Mar 2025 14:43:52 +0100
Subject: [PATCH v2] kernel-arch: add macro-prefix-map in KERNEL_CC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-ID: <20250307-fix_tmpdir_v2-v2-1-3660de636207@phytec.de>
X-B4-Tracking: v=1; b=H4sIABf4ymcC/03NzQ6CMAzA8VchPbtkm+wDXsUQMlzVHkTccDEhv
 LuNO+jx37S/bpAxEWbomw0SFsr0mDn0oYHzLcxXFBS5QUtt5FE6caH3uN6XSGksWoTgvLcu+tZ
 Z4JslIS98vdNQO+Hzxexahz+Vn1TT/JnCSKXbburspGxfFAz7/gEEuAulpAAAAA==
X-Change-ID: 20250307-fix_tmpdir_v2-aa78867d8476
To: <openembedded-core@lists.openembedded.org>
CC: =?utf-8?q?Stefan_M=C3=BCller-Klieser?= <s.mueller-klieser@phytec.de>
X-Mailer: b4 0.15-dev
X-Originating-IP: [172.25.0.52]
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000040:EE_|PAXP195MB1168:EE_
X-MS-Office365-Filtering-Correlation-Id: d73add4a-9484-4555-7632-08dd5d7e1e1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zFKh9KPEfYO/stdGdNF0yHqTbKdF5WrryDPNect0dZ9tj36cJPUBPe/z9scz?=
 =?us-ascii?Q?X9WDNDEGhkJDgUzqgg1PTt8JOLmpLWA+Nu1YS+0Cth6o6VOfJ//9XLpuiD8v?=
 =?us-ascii?Q?n+h0xmz5NR/onW3NW5arleoW1ll1ee1tDbtUHFa6u4yxLcuDgb5b7SCP/5mx?=
 =?us-ascii?Q?N8H7wx832rhVMTFFR72iqT4Vfsp5zn5lrlmMIJ2Xv0jmNDrI+WQmWwHQ8HFC?=
 =?us-ascii?Q?Wxo18tIoxZB3ZMB/y4r8iEV2RrXKSrBspTZ1WWZ1+Uk0blyqkns4E1+EsTtD?=
 =?us-ascii?Q?NQxzvwbDYX9V2JKg3Z6EFluA5tRsRBGfLgDErK/Jjqqd9+drV+hRflztIb+P?=
 =?us-ascii?Q?plrjf45pas6SFHYO7Ugoj7sT45MCusnEQw2Cr1ztkuo5lD8cBaYYu60YrMpL?=
 =?us-ascii?Q?GczjnI1vChCPw1oz8RCx1UpeYL7PkLorwg6e9Y7Vfd+cnzRaQrW282C5eA9b?=
 =?us-ascii?Q?W5AnSp0tkdRhH9bchji/49oLmVXq7NeGSU+HCDNIFVBSKxnG+m1yyivN1nH8?=
 =?us-ascii?Q?S/aeCUicN6KVSO3HG79YhU7FnwYUDqe3+x6WRonT2aAV0w1+r6JPGtmYFZQZ?=
 =?us-ascii?Q?yceGhA5fmNT7AMxCgC/+ZveeNKpz1dcsaHnzzNgNTRcZhib/yhf236XVg1+r?=
 =?us-ascii?Q?OuMf0YlXDbJ+RlhJDRZfFrYpS6q7YIWN7ZH7G5/uPA8MT9dIEqN1WKzpexi8?=
 =?us-ascii?Q?bfsK150TY6OAao3txusB3vLsLxa1ukYiE88U7ngkXQInzfkq9qw9pmsxS3CZ?=
 =?us-ascii?Q?pbc/WJjZ5wkBQiEUSdz3s0tK05Be5cO72YsUbwD8mkv/Sz478LsSQtSBc7ua?=
 =?us-ascii?Q?u5AJjfYHWk82maMmWTqtnyuuQMjbpf14VUyWcq5tJwAFm9ciR7AYAnqDFaWj?=
 =?us-ascii?Q?+Q0jIR09fBT6SSO36/tJGqK1vPtYjwfXgdvvO/AFGXW+YuhW6MQgyXYRtkam?=
 =?us-ascii?Q?jRNdbpJ76LpUwkindTwkhoAnm1uQVllRfYXE3L2fvWo+C+XJXTEcafdgNy0w?=
 =?us-ascii?Q?9uCRFwVKguP6T1IsOoEFfUWBkjvrZXuV2TOxPGy6ULsgZRU8dWnantUOZZ85?=
 =?us-ascii?Q?NVVT2slvZonxz/F7uvZ1AY5TUrBgMGRojNk0H6EE+b95gFAj+XHse5Gvnta+?=
 =?us-ascii?Q?ZVo+0S5Zj+5tT3134KMftmLQS0z6xT8PKzeEIEgsSalVcjF84xuTFzciMx1F?=
 =?us-ascii?Q?TJc74P3XwrKXzoR0COKRrlXMyhjVRrmO2j06zayMox+0b/BtGw5Jocp7V3F/?=
 =?us-ascii?Q?7pMQ6LZ+33W3rV6Z9kIHc69uizo2Q+2HpSUDF2c3mPxDm9KcZzvVlAklj+60?=
 =?us-ascii?Q?TX7AJO7hl8BnRtS4kMTZrKKASM/dRk1Ref1FUFPHXnzQdEX3p7c/wWnPwIDe?=
 =?us-ascii?Q?tlX3iB0tkjuDhFdxf+SUKH+u5qEZeW+l9JvcQrVHd9ggHkLLqbtWz0AjD8cB?=
 =?us-ascii?Q?syMkpE3cjAW7pvqkp/UUenfwnTgxEnt7/k+9nMDZ9G0tNRUxiwNddMFL6ZOQ?=
 =?us-ascii?Q?yDuWDq3YpUDp8YA=3D?=
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 13:44:00.8544
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d73add4a-9484-4555-7632-08dd5d7e1e1b
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP195MB1168
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 13:44:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212436

When building external modules, macros can include absolute names of
kernel headers. The macro-prefix-map for the STAGING_KERNEL_DIR is
currently missing. Add it in the same way as its done in bitbake.conf.

This fixes reproducible builds and following build error:
ERROR: cryptodev-module-1.14-r0 do_package_qa: QA Issue: File <..>
cryptodev.ko <..> contains reference to TMPDIR [buildpaths]

Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
---
v2:
- add macro-prefix-map instead of switching to file-prefix-map
- unify settings to mirror bitbake.conf
---
 meta/classes-recipe/kernel-arch.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-arch.bbclass b/meta/classes-recipe/=
kernel-arch.bbclass
index b32f6137a2..36a6e0a60a 100644
--- a/meta/classes-recipe/kernel-arch.bbclass
+++ b/meta/classes-recipe/kernel-arch.bbclass
@@ -71,7 +71,13 @@ HOST_AR_KERNEL_ARCH ?=3D "${TARGET_AR_KERNEL_ARCH}"
 TARGET_OBJCOPY_KERNEL_ARCH ?=3D ""
 HOST_OBJCOPY_KERNEL_ARCH ?=3D "${TARGET_OBJCOPY_KERNEL_ARCH}"
=20
-KERNEL_CC =3D "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} -fuse-ld=
=3Dbfd ${DEBUG_PREFIX_MAP} -fdebug-prefix-map=3D${STAGING_KERNEL_DIR}=3D${K=
ERNEL_SRC_PATH} -fdebug-prefix-map=3D${STAGING_KERNEL_BUILDDIR}=3D${KERNEL_=
SRC_PATH}"
+KERNEL_CC =3D "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} \
+ -fuse-ld=3Dbfd ${DEBUG_PREFIX_MAP} \
+ -fdebug-prefix-map=3D${STAGING_KERNEL_DIR}=3D${KERNEL_SRC_PATH} \
+ -fmacro-prefix-map=3D${STAGING_KERNEL_DIR}=3D${KERNEL_SRC_PATH} \
+ -fdebug-prefix-map=3D${STAGING_KERNEL_BUILDDIR}=3D${KERNEL_SRC_PATH} \
+ -fmacro-prefix-map=3D${STAGING_KERNEL_BUILDDIR}=3D${KERNEL_SRC_PATH} \
+"
 KERNEL_LD =3D "${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
 KERNEL_AR =3D "${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
 KERNEL_OBJCOPY =3D "${HOST_PREFIX}objcopy ${HOST_OBJCOPY_KERNEL_ARCH}"

---
base-commit: fec201518be3c35a9359ec8c37675a33e458b92d
change-id: 20250307-fix_tmpdir_v2-aa78867d8476
prerequisite-change-id: 20250305-fix_tmpdir-501249b96b16:v1
prerequisite-patch-id: 54d70209fa3ce2ad374d98d2b1c8062e55afb548

Best regards,
--=20
Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>


