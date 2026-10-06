Return-Path: <benhur.tessele@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED22ACA5FFC
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 11:13:05 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43143.1791285179799503653
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 04:13:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=uuIGKb/y;
 spf=pass (domain: est.tech, ip: 52.101.65.66, mailfrom: benhur.tessele@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IQErjl7pq0yNMKkpo0QcB10rTcO8/szOZAYEmh5zcd5zCTZN3rWR5sNvM8CaCMo1XnhA5mm3HRHZz+iKZj1trO963cCoKMivfsgAvFE5WqanQ5SsYZq3na2wuV2lSbrRVkgfq11cMbOqD8z0swNqVs25CI+3ql07NUvpEYux2Jr2XoJ8PSrvNuPtNltzQ4pRXy33+hCCsqcP6YJY/R3EYzWlYpgG2/TrPvNMOuOMcBWMRy7iLwE9ApTIpn3tduHAYnqdg3RpdIEYNb3R+e4BrZ2BH9XkMKpLckfWSLN37xoE+7CAe1nYjP6rhfdRGUddEdG+XFN7JQtVI9byFCS5dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BnAROK30OstL2ycAFB6lHj82g4ocrhxXNMVfZZ/pt+g=;
 b=Ywd7/ZiiucGT3wi7LVoqPZC5PJcnkvovJ1X8ETcz95c6eppwlDt+mSehhBGexrIccBc9ZeeD7GAD22T6xSYptJ6DcZEpeT9FfcuHjNF20gVHLEbObzKBaYYGzIkoLUojgwZTFJoMQtFZ+PEyL5Kn5XJQtmzTtLKCe6DDR7woNOij+hBZEeW6CQD5zjdtlCFScpe8CpB7rkFgeLUZUuDfNP/SIQibOwbDhC2kMlXI+0o7igIOi2DNil3Ztcc8g2irM5YNE33o9RwqZuCjkE65H25hrYDVWjGJgCuVTkvN1+O1bNaVUYeH/5M/jZA6861ukCCMf3o2i/NXd9lPbca1KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BnAROK30OstL2ycAFB6lHj82g4ocrhxXNMVfZZ/pt+g=;
 b=uuIGKb/y2zx44Dcj9h8DFISJRvNIwpeJOPkNfLjBy34JP+oynZcsGTqxS7FmX6D4uALgdMWkB1hZC5OF4q4jYgjAXfvGikIgEayj1C7X6L1WloZOh+aIMQ8pDzV/lvJhgVPh1auUD2HjxF+wqGl8+IqsZmDg4PwExrigoybtnB7Dchg2eiBGAvo/m1NB4F9V+EzCLr1ndUDsb1xJCg4u1Y92vnuxIbHCayS+O7WboAxieLzd66GH2zrU17rDQ1lxCCm+S8ozknP8pbPijNWe0tErhEzhsXFmxy3Orl6+n8OWVKI74QAJhqY8delFMC18AL2GO2fRF/6umiw5xWHjYg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PAWP189MB2572.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:35a::16)
 by VE1P189MB0974.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:149::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 11:12:52 +0000
Received: from PAWP189MB2572.EURP189.PROD.OUTLOOK.COM
 ([fe80::5da2:7509:7be5:d74f]) by PAWP189MB2572.EURP189.PROD.OUTLOOK.COM
 ([fe80::5da2:7509:7be5:d74f%6]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 11:12:52 +0000
From: Benhur Tessele <benhur.tessele@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Randy MacLeod <Randy.MacLeod@windriver.com>,
	paul@pbarker.dev,
	mathieu.dubois-briand@bootlin.com,
	Benhur Tessele <benhur.tessele@est.tech>
Subject: [PATCH v2 2/2] packagegroup-rust-cross-canadian: add rust-analyzer to the SDK
Date: Tue,  6 Oct 2026 13:12:30 +0200
Message-ID: <20261006111230.1478039-3-benhur.tessele@est.tech>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261006111230.1478039-1-benhur.tessele@est.tech>
References: <20261006111230.1478039-1-benhur.tessele@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0159.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::16) To PAWP189MB2572.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:35a::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAWP189MB2572:EE_|VE1P189MB0974:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cac0470-2857-48f9-304a-08df239ac391
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|6133799003|10067099003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	ZBYJcK30T41rnfISTyolUqTMHb2uR/QeVSNhHaa2XknRboFtpJo2pxh++U3XRjJkVLmsXtI51w642+yCDExDRUMhx4XH/VjfT0D5hykc1sAIOvn/CJaTL9jVYu8SBWA6EvZDqWN7VrMmt8KuUbhF7+0x3XOoUhspwUNU3oQmRLI7k/DBMkj610OojLhBL/Dp9JfVRWK/uPRGBTOfazqUWuEo5QF2MYND0li5p4Eh65Y2MVh/sNBJb+k4R1NM6NQpEguB+LUcqSeM/zva8uD4lXaPZ+4H330tK4aS5C/wKZtZ7DqBsmNafObn1Hr9PAXl+N/jv5w2uMLen8oXKaWjD3bEmWg2M3d6vKqcs4FujqpffAYMiH922yP/GNtL5nI78Q5WftU9ztl6E9lNeQ/AarFoF1kKFS8uEzYiEfI2MDKoyLUgahHoszMB+yBmOWEfLta36n7YI97O59zEyl0+gGRpfVqQ/nYoLmc4HzYQXMr291f9yiWrvjKETiShQEuqP8JmUC4fiw3iv5V6q98ShYsP+FhV7RxKgT05THoJpE+yX8RXWvNi/320r0fPhl/jYe26h/1coUG+0+Wpaji3qTrcw+H/NtTfLTN9EOoulK4xjKlKulbfyudBB7BATKFmLY3ZE8g/hNmCkUUMjbZClBn71FaMFmRi2C53XZHKThM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWP189MB2572.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1SmVj04CNn0W54OmdRF7BBjx3W+zUs2anS5x83lqcjRDIFl60HnEq0TUVX+e?=
 =?us-ascii?Q?NU1sPfN+eSWfgpr38RVXSnBkkk9EGAaL+omLxpTUwMXq02FTbfGDpdGrJRk1?=
 =?us-ascii?Q?MMeraehncM76nyENsnNafsqZPVBvJKAhCwPxXhGda3M/tzOv1wcQUavtwDfk?=
 =?us-ascii?Q?besnadAUYvGcbAMJagycINdidy8SOMJ5/TnFOt1I9L5kE26UwtgCpH6nwxM6?=
 =?us-ascii?Q?8uk1B9B5ZiWTfeN8F/JAyLtIN1FRlx4AMx9+AXGmXOXuRbx4j7X+Ral6faBH?=
 =?us-ascii?Q?IRiZ6qKPlVClNAaA21V26wY6K4SxRJc7sbFmDKm6CqFZpM1xRmEfQ2GyZhqV?=
 =?us-ascii?Q?Y9NOD3qf6XzCYJBYjH4mXHuWdr3dtXb/+xwt7Dxu50mMzTzrgcrMFoO6/bmt?=
 =?us-ascii?Q?zCXlRcrVvGzNIWqMX6sGPfy9x59qecotf1cP35pe0G7j5kMQwU6u1u0HQ3XG?=
 =?us-ascii?Q?sshAXp23Bxw+DrK1RiXZ3G1PVB3mjc/+I4EMeAHpieTZrPSOu005NVhtiZLc?=
 =?us-ascii?Q?nGqAHBijfP5PeFR4+1DvRNlae/cg932nswJUxAd9x2xmAcYDYY3Cr1nh5BZe?=
 =?us-ascii?Q?oEZ38hmZp7Jnb5/MDDcz0aBFCk+Mim1sj9OEGHUs+Q4pZDE2Q2vYL6WVtEmD?=
 =?us-ascii?Q?51C56yLt3adhUz/aQNlSNgqGQue6Cy2dGlgDHZuFtWBkEAwQnM6x3JYz0N1Z?=
 =?us-ascii?Q?ld5P/HVq6ygDYnw7W4zfkTdejUBmniVyl3MqYrKHgvjv1gYFjDFd/KEedWh0?=
 =?us-ascii?Q?EEk6yjUXQ1EKSxjXkEfFOkoyK7BtWwXkAyFDCWg0GUqL/eSfmdJis+h3PZaD?=
 =?us-ascii?Q?wQymfMg3unuR5tHgg1Q5qdeXzowt7T0E2YnAiJRJaR2k/bhzTi9fWK8ZF6yK?=
 =?us-ascii?Q?1Ji0YT5837OM0eqexvivSxkT2Bct+8Eav35DCHWkWYDviMiThusF+WfDVHND?=
 =?us-ascii?Q?Ej0ozK3T1qB6NyBVh21o+xLLCU6toZM6zsGRvre3MvWZ9jCZkhpyl/Xk1I0l?=
 =?us-ascii?Q?8mFLchCXGXZ5F//vt1eqsn5EBkt+kUERV8LGYivAnhG6WQ0DjLsMX6gq550N?=
 =?us-ascii?Q?LCS/59g9dw+mgEtSM2yd05QUuoG9PAkxmSABAI09iuerrLTSNC5EORnt1vqq?=
 =?us-ascii?Q?fYQUcwjn+6++/yp2H17W7RIMrpuxBNef0opDe49ld4dtGNGli4Aa4S6mw0EX?=
 =?us-ascii?Q?Eq3/bzEItSrT01ocPfQhKpzFvCRaQxRTzvk3YrR6Ud8zZhUA3QfKWuDz4riJ?=
 =?us-ascii?Q?hX9KBFLx/S0s72MDU7SNsu+f+qQgvR8Xxf8UoWCOx6pcAiGuCL/5qmp2XfRp?=
 =?us-ascii?Q?TWjlmeEhjg0gBjK/KX8RK3qV8vJOCikWwuit2R+sPLkL6QW90POMITYznMcr?=
 =?us-ascii?Q?AGYkOruacDf36ldU5gQw4BTo0kFBHKZsA/uVx/s5mZ5mMN52ynTC4mVL9bRN?=
 =?us-ascii?Q?ROvIzLYpGc1Dhpi9xbVe2Ebx51KxAMdgxxMC7PG+ylIK6wYAg6GRXNy2gFNF?=
 =?us-ascii?Q?dLOBIFH57wCwGmXhfC207X3V/p7smsMOaLFklKUEo3WxLpGGMaMGkGHKdZR5?=
 =?us-ascii?Q?O2T3K00RYoOX//d8xcJoZUQl4d5ksatFFYjwPt3EKbEhNCHQN1ea01UVAKlh?=
 =?us-ascii?Q?xnihugd+TgM/LiSaLGizFyUwGA09HnVjmcqpGCD3+TSNIArRDSCajpWYNHUo?=
 =?us-ascii?Q?7O4SKqRkxgsOeQTZs0nqb8Oazu50ZhKCi+K3N2tBxzE6fud40TdzMpLa2IwK?=
 =?us-ascii?Q?7FpaJ5ZlBA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cac0470-2857-48f9-304a-08df239ac391
X-MS-Exchange-CrossTenant-AuthSource: PAWP189MB2572.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 11:12:52.3615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CF8Cv7l+HOGP9PPeUox4QnaUI8OQ9yIDVXodETNze+gfOXoVYYBTZBaBsk6v6ylsZtwPjJstTrXzEvUJW625Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1P189MB0974
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 11:13:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247284

The Rust cross-canadian toolchain already ships clippy and rustfmt as
host tools. Now that rust-analyzer is packaged, add
nativesdk-rust-tools-analyzer so an SDK built with SDK_FEATURES =3D "rust"
provides rust-analyzer as well.

The standard library sources it needs are pulled in automatically via the
package's RDEPENDS on nativesdk-rust-src-lib.

Signed-off-by: Benhur Tessele <benhur.tessele@est.tech>
---
 .../packagegroups/packagegroup-rust-cross-canadian.bb            | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-rust-cross-canadi=
an.bb b/meta/recipes-core/packagegroups/packagegroup-rust-cross-canadian.bb
index c73c8d3333..54b39189b4 100644
--- a/meta/recipes-core/packagegroups/packagegroup-rust-cross-canadian.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-rust-cross-canadian.bb
@@ -17,5 +17,6 @@ RDEPENDS:${PN} =3D " \
     nativesdk-cargo \
     nativesdk-rust-tools-clippy \
     nativesdk-rust-tools-rustfmt \
+    nativesdk-rust-tools-analyzer \
 "
=20
--=20
2.43.0


