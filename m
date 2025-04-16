Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E29DC369BD
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 14:29:15 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.40])
 by mx.groups.io with SMTP id smtpd.web10.21026.1744813751679006300
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 07:29:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=JT9VCBza;
 spf=pass (domain: ericsson.com, ip: 40.107.20.40, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LWhlN02G72hhMO9GlzRC4SlJ8eti0YPlgj4ZuPC8t3Euhttm5XjW7AERc2Iqf4B5LVlOufVgzm4otsEFItq8WuHv2Bk/IamaS3Zmc95inOOMPuJKnrAwxpJSEYjPowZqhsWjCX9EZzmh+OG+qan4qDcqW7EZmhqxry3PAI6xTqU8pO1xHL1E1zaQFCb4JpCSrPWTbADjz8ppUcOhoLS0b/g1KBZ7gaNt1GcLLsYXN47txL7Ks3waitJahUTkTdYgWQmzcAWeGR8q/JT4/b+DL8R6J21I9Uz7rrJfS2gEQkU7VQz4zRIFFSx61e9CH5PEf/8llGcR4uhB5Mtp73X5lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jWneflbvSpE11vq/K6ZPkFPW92ZoYeAV3UNqlfIgpl0=;
 b=fZCDIAt2hsPvPhbGOa43CN3UPzE0/l8Pn2+uOonLoyfnZgyfwlLpRb+pSfAIa4KlOKS3pb4z/WAi98gGaRlXxcZQmPcZddJi/uI3HfAtSi6aPVwpTW3pzQ0UEva8BOpxSL00Z28MFChxkX9C9OV4sYB+4FSaW4I5OAuP41M4Pi7A8IApT2si2XCRYiN8FeE108QRT6ldzl8ynUTAglB/4hC1IuNhU7MyvQpHQmRwqICM3ud0HqNj9thT42sTZfmIBCqoI17cNqNYDkuu4OzU4kImXX2nTMlH7J2kHV899Q8mGk+zCuDIvdd0/EV06kbIPzSyKpy19SqHSkAbEJXh/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=arm.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWneflbvSpE11vq/K6ZPkFPW92ZoYeAV3UNqlfIgpl0=;
 b=JT9VCBzaqtYQVQqva1l8jjVj/30rxA58ExgIRGMq9Xa59IlFmJonSfiXpi+YKnNCAbYUTBgIov57OxhgsP3jxurXKngroWLWG3S7z3z6BlFjvLDQGS+PuN2+qdA7y9cBFt7pbJL26MLO1WWfmjmgLaoXkpsnZQ3jgDlDu1x2oCrh1cBOp+MkLJTqEjju7DgQbw+MPRbJygGPyfHf2L3Jhm9PRn9NIcbbyrehFa81BL1etkt7hwj5me+9hij4j6PQTjQnTKg2EbAHkbU4MZ2f4Ji2xVAX16n/VNPjC5W9chogMLgB9H/oogjCXgajSBL+suoHPh0lqEyqj2nxunNelw==
Received: from AS4PR09CA0030.eurprd09.prod.outlook.com (2603:10a6:20b:5d4::20)
 by DB9PR07MB8702.eurprd07.prod.outlook.com (2603:10a6:10:30d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Wed, 16 Apr
 2025 14:29:06 +0000
Received: from AM3PEPF0000A799.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d4:cafe::75) by AS4PR09CA0030.outlook.office365.com
 (2603:10a6:20b:5d4::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.18 via Frontend Transport; Wed,
 16 Apr 2025 14:29:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AM3PEPF0000A799.mail.protection.outlook.com (10.167.16.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Wed, 16 Apr 2025 14:29:06 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 16:29:06 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id DAFA54020C02;
	Wed, 16 Apr 2025 16:29:05 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id C25537000229; Wed, 16 Apr 2025 16:29:05 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <rybczynska@gmail.com>, <steve@sakoman.com>, <Peter.Marko@siemens.com>,
	<richard.purdie@linuxfoundation.org>, <ross.burton@arm.com>, Daniel Turull
	<daniel.turull@ericsson.com>
Subject: [PATCH 0/2] Check compiled files to filter kernel CVEs
Date: Wed, 16 Apr 2025 16:28:57 +0200
Message-ID: <20250416142859.909037-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A799:EE_|DB9PR07MB8702:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a260a44-cfe0-4be9-157c-08dd7cf30b7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?KRo7eentcdSO0VNG3Wors6DzlLGg9gfBaydu3vzcCEOCSs4Y6U3X0gqoL80e?=
 =?us-ascii?Q?71cMinJGiaXY9h7XnQM8t6w3GQv6PoCx/4gq7t0UizonRw1tdPqFyvyv7Irq?=
 =?us-ascii?Q?rU9JhfDnZGRhCtpstFN0Af5n/sUskz4BiLpdOhk90wp5dzyWep2D3dgML20h?=
 =?us-ascii?Q?I5YR+edU4G9JY+s4bdZ3wZgkCx7j26baSQ6C5ec4n8Hk5x9NzESdSY1Pr6Yo?=
 =?us-ascii?Q?6gRSp7tgwyxMDr8+aNbkKiACNAVMtS5+AAjjI3rHQmSusqCINW2O0Pk1pr08?=
 =?us-ascii?Q?4/LIkZaZP+ZnXD9xpgwCqd4WBA5Id1MPExGRwygtkAc1GQEQ6P4+1XdNM4ij?=
 =?us-ascii?Q?pJXI3ilOz4kUAqwjpTEW5n7+96SpGLdpVxLzryzMqlDYh3jehwzbzekP66nf?=
 =?us-ascii?Q?WnMMljYaWzQSCi9xwFn+bldfALcK6HXBx46DSeRKDPgPWTvOSdc1XFZpO9Kw?=
 =?us-ascii?Q?LMaFUmEOQPkqX+zfKE0GXgr3jlXP+2fm7pqkIrTw7nPtLhPSVFctJ0Bn16ew?=
 =?us-ascii?Q?6SbS5AJYtm57NgN1R7euf24LHGZ5hX7qlatJIyoGjbkjwp7F3GJaGG+V+DrJ?=
 =?us-ascii?Q?2ERsMre7x8Zp2abCt+gPZF6m6DGXeG3BFYT5pSCME2qnEPP2+2mTiZ16LMY8?=
 =?us-ascii?Q?Phwj92nwGqsFl8npi6tbyKXzmw05ahLVWv+9iq6kyuCg2GMz5V4OKWv3uoKh?=
 =?us-ascii?Q?XVcxYnl7KJYcsGFrjSIcAMODfUX7vjdPZRTtRrMguKaO5RO0RinrJIFvdbqh?=
 =?us-ascii?Q?WAF4QcfQ1YH5hp8bjpWkpT8TDtBg6cHFU00ghJVYmp80g6bjgJjmm1jIPjhk?=
 =?us-ascii?Q?WsoHmHtGkxjtukBabIozy5v/fl5yxP3rC2ZkjFGCncuqbYvev4tNv4GMlTNP?=
 =?us-ascii?Q?41Xm2qBvWZi6slA4r/DYRS4YeR0+5avlp7WBU4F8R5NFb+DYsgkJSzw7rlni?=
 =?us-ascii?Q?uIqUXHCYvjAxqVHjZSvFWwyTunH5fh8Hc9Cx8hcZ7A+P+C3fNz7MfkdrNOsy?=
 =?us-ascii?Q?76Cw6JQ97mgF/3AQOXYv4Pu1/kuJr/CbqDOdsiAdi2umuPeUoHlYG/rmlywG?=
 =?us-ascii?Q?G/Vd5EeRJMOMN0K9zf997vS78Ja4IG1etYmVORBaM0ZoAz+TUkOtjSNsCv1m?=
 =?us-ascii?Q?nNigvYSWnQplr7JHHfm1lsf35ehejM3zL6O8tEaBGv87XI1aeEuTvY4OMW++?=
 =?us-ascii?Q?wiqS79TErFhQDVh+6Lyp39MCsihXNCGXsFMmw2GLiTItadZCVuejhiJlsOzf?=
 =?us-ascii?Q?fk5dMcdX8XX1Vy5FTwstfzx2uXV110XyIUQk2b29XsqtON4DEUO8+SZ265kq?=
 =?us-ascii?Q?r/VMc+Uqq7yAv8nnVDS3PpPblkZORJU4gXDjB2ejWbe+NSOvV1SkG/LE21YF?=
 =?us-ascii?Q?9SNfk6F2cB3ytAN7+aCL1ySL+HtY8QU0cHyf4w5dyIpkeb+nMWru/IX0Xnn4?=
 =?us-ascii?Q?A6iOCatV2Y+JLiomYawEJ6yH5XezWy3jMJeWPmIY7wkydMMXVdRtD/f7X0HJ?=
 =?us-ascii?Q?Qsi5fk1U31Bcyl7YflZccb92+TXvSOei/BXNCxcLvdOdHL9WDEchFH+MMw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 14:29:06.7522
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a260a44-cfe0-4be9-157c-08dd7cf30b7b
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR07MB8702
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 14:29:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214991

From: Daniel Turull <daniel.turull@ericsson.com>

Since kernel.org became a CNA, more information is available in the publish=
ed CVEs,
including details about which files are affected by a given CVE.

This series adds functionality to fetch the database from kernel.org CNA in=
formation:
https://git.kernel.org/pub/scm/linux/security/vulns.git

To filter out CVEs that are not applicable, I developed a new bbclass that =
uses files
compiled with the build kernel configuration. This approach requires a comp=
iled kernel,
which is why it's implemented as a new class rather than an extension of th=
e existing
cve-check.

In the future, an alternative approach could involve incorporating the affe=
cted files
into SPDX rather than saving them independently and run an external tool to=
 filter the
CVEs.

Comments and suggestions are welcome.

Daniel Turull

Daniel Turull (2):
  linux-vulns: fetch kernel.org CNA info
  cve-check-kernel: verify kernel CVEs using programFile from kernel.org
    CNA

 meta/classes/cve-check-kernel.bbclass     | 132 ++++++++++++++++++++++
 meta/conf/distro/include/maintainers.inc  |   1 +
 meta/recipes-core/meta/linux-vulns_git.bb |  42 +++++++
 3 files changed, 175 insertions(+)
 create mode 100644 meta/classes/cve-check-kernel.bbclass
 create mode 100644 meta/recipes-core/meta/linux-vulns_git.bb


