Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04DE0CCFA00
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 16:15:59 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.51])
 by mx.groups.io with SMTP id smtpd.web11.19373.1761927356491847037
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Oct 2025 09:15:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=AQK0TzVY;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.84.51, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GuUJwIndqVizVQH5pvDfoPtRS8qQTbyXEGceHjRrddiuctijKGe70N67wJwmNkd+Lr+3FVsC3bOAJHs7re7Z1W/WiutHEkED2P7BkwN0uP+7ZjGd++EamJ+tirz/h81hO3TUX0xXvR93cPpbxR75AdVbZlGq74afluyMbvrAHPcJyoZzMssqWuash9jgvhD6lars7K0tTCFqVpofevO24sNCxZfkLS/oGmQX+4HnZOLvI8t5+5g2hJUhALxiOOT0YJK0qsGEj+WIPPgJLnBLEZ+GZaG/rmZGaflTbNXrFxILs04gcHa+wIJl4Vwp+JkQ49ps0YaujU3R7JmLHygI+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ZsAlhEj853Tdjt33ewkcyaD7opaUiR/DO88NoIReyA=;
 b=Y0CyR1ffR4JbDd2WOKnaiPmWNf9eyRP00Vj0E8ZElGwRAxr+NyXGK1Glq+B/rA1Uwf0CkQCONRedZV4B6oDbtj2YfSdo+8DpBHvicPdgbdsZAkMuxJNYC+5jmmhT8rzMdtJ/LvAR3yaM7rlWiqq4jm/Fp7al7bfHfefQ8dEU8Z6VvoHrM+BLQDGucR76//cRTOe0ch4eTIvLf39Os9UKMDqfG/UWgTDMjz0FPXE1SfcuGxGBHmZCGXSvyt7sa+9AViVUiCy1k4OUGM/vxWtNZ10ngvwdG91mv1C+18bXu89TJFKjybIwzNKIfnLfq+bKtfLoay7gBMTNpNDtoJd/1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ZsAlhEj853Tdjt33ewkcyaD7opaUiR/DO88NoIReyA=;
 b=AQK0TzVYPrkEDCK/5QpkP2Rlo7YDpr5W6lvXkmeA6K3GgIXsjblHE+m2as4RUU8H4P7JGaBeahdof4om4F2NnxrzPdYZTyraWMsFtKJUoqZQ5FMJUVWSNiJJPP19fAwcMhnVxCqTQHesoRnU1wsAZ22KcfiNRmqcfRR8pjkm1dg=
Received: from AM0PR02CA0162.eurprd02.prod.outlook.com (2603:10a6:20b:28d::29)
 by AS8PR06MB7255.eurprd06.prod.outlook.com (2603:10a6:20b:25b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 16:15:53 +0000
Received: from AMS0EPF0000019F.eurprd05.prod.outlook.com
 (2603:10a6:20b:28d:cafe::e9) by AM0PR02CA0162.outlook.office365.com
 (2603:10a6:20b:28d::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.12 via Frontend Transport; Fri,
 31 Oct 2025 16:15:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 AMS0EPF0000019F.mail.protection.outlook.com (10.167.16.251) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Fri, 31 Oct 2025 16:15:53 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Fri, 31 Oct 2025 17:15:53 +0100
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [scarthgap][PATCH v1] perf: add Kbuild file for unistd.h
Date: Fri, 31 Oct 2025 16:15:51 +0000
Message-ID: <20251031161551.1405597-1-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 31 Oct 2025 16:15:53.0413 (UTC) FILETIME=[A1724750:01DC4A81]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019F:EE_|AS8PR06MB7255:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ae8bcab0-730f-4113-1aed-08de1898c40c
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|34070700014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?dYSWOgG1ClqlhyTrf4TD3B0U57Gdzq35zc7czw6q/JHXZGADQZimZb+vIpfF?=
 =?us-ascii?Q?YorJvYd+aJKcEwP9bgJX4bS6/GgmqEgAn+X4EIQoUA2khl47EQBhr16GecDs?=
 =?us-ascii?Q?vDd3pnAHRW3vk7ajwjONqdLZrskn3pI/U1VlKtQ2bR7A4NF8NsSXN6zhdzJa?=
 =?us-ascii?Q?tvZwa+AmVhldJnZxfXDggAYDz86+ed+tn57z5bG86lKZvXB28O6LYD/TvWgc?=
 =?us-ascii?Q?e2kaOcRYsVkHdsL/BUBsveY3Ktt03wdD+FC1iLQusZQb91PFxrtIQt+H96Dy?=
 =?us-ascii?Q?5ZA4UyOTL2ZN3HpAODdl07Ay9C2JTUpD3PKbuCQy+wJJ1b4yptMgqLonrJD4?=
 =?us-ascii?Q?EQfEZqdvWIVCsGdDCHSla5E+xbsgg+1JDScGxHCAT9u3qZ0eaSgWValzHaoQ?=
 =?us-ascii?Q?LVPwKDxutLSvA4FV3CQR7QWuYL3wvnUccFrT7itkMlmykfFRun+4XLCge5or?=
 =?us-ascii?Q?xRsHvqXX7FuvmUAJuEb0lTu/A+OtvH/9OL9bJh//xbeQ/snn5zgT/8ULgbld?=
 =?us-ascii?Q?YdGqGb8vKAaeB6lYZGqjZS+nVz/4bR9WaO+cvHmrzUodEgXZGU5WNprmuWws?=
 =?us-ascii?Q?KSwR8KJIULyLbJ2c1rb7GJxK3xiecGSvxpsnUi5PwSMDbj0SZNLQEx2u2r3F?=
 =?us-ascii?Q?IG/Gz8nh2jkJcOY+hpd9dztkkAa6E7P5d0c206UWXFptuL/wq/XGTbGlxJVm?=
 =?us-ascii?Q?PAajfMWjVO0/LZjACLSbbuTUo4Mo7Hl+Kncp+V6oBvjry7jwRPCgNOchxbjT?=
 =?us-ascii?Q?/ixtbz1XdRKefNuDaahog4LNVUG16wSB0RvHPJXI+mBBVgxHWJzat1cN8esJ?=
 =?us-ascii?Q?XVZ8chaLOtNeNs0HE/PBQ7cXLV6s9e+cJ0MPxx09qYzQBZ4xBURchEiQZObD?=
 =?us-ascii?Q?pBPt4zLhF5n1kZmTe1mUeULIeHeyIUAYlQSHm43y0PF02l/KvwR+UVi/Ihaz?=
 =?us-ascii?Q?AVMSGG0P6BkX4aqVy065IVCPmciZnx1pYugXcU8zuRPzzrkkoY1mXUM8T0DN?=
 =?us-ascii?Q?Pbqln/NHvgIZ3aFIqXEAI8LFGAzz+aqSMNTbCuJC74Ayt1VylDUHONgGjMVX?=
 =?us-ascii?Q?nj54EbJezPd2oaXGRlbKENxGwhT/iYm5kkbtKjlqrIr8cJOmk+2VeziLwgBo?=
 =?us-ascii?Q?jAWFLMDtNrCDp09JYYPn3Te1Djq5f0xiIAMynQi8dlN7ghAanebaV9a4yuH/?=
 =?us-ascii?Q?ip5Yz0FNn7JDWbfvliNUG4BLI3WvqAJ83ICaiCS+Dq1BAh1r6teQ/DBvEXEH?=
 =?us-ascii?Q?4WJakIXAo7O1I/nwhzCaLWq1hdB5uZYxm1+/HDf/m2URFK2LTTaXknwHvo5h?=
 =?us-ascii?Q?fP2rKCZFDaSZx82FleLMoipAAw82jTQRHA8PeNv16c7AMEbCq0IJ9OkAvKW+?=
 =?us-ascii?Q?jP4Uhjsu4r3j+I70aOHDxUS9DBGAcVTukuMZLWSW3croZakw2UArbbkNqKTg?=
 =?us-ascii?Q?vVACHuq/VR2kGoAuTfmvr1gQr/rKgAl/kqSUeL9Y7KZLQzk4rT0Ur8Q4sFsu?=
 =?us-ascii?Q?eH3qg+fu+QS610cY3TObr2KWGoT4PszVbVgZebJT1VMDTYrf+rovXTWIWYw4?=
 =?us-ascii?Q?RiECl0GkCi9XisKKk1k=3D?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(34070700014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 16:15:53.6056
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae8bcab0-730f-4113-1aed-08de1898c40c
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF0000019F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB7255
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 16:15:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225547

Building 'perf' with/against newer kernels (>=3D6.14) would fail because
of a missing 'Kbuild' in the folder created when manually installing
the 'unistd.h' header from libc.

Add a oneliner that creates the missing file, with the relevant
content taken from the kernels Kbuild file.

Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 meta/recipes-kernel/perf/perf.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/pe=
rf.bb
index 11fa917649..7db5fe6d1c 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -368,6 +368,7 @@ do_configure:prepend () {
     # so we copy it from the sysroot unistd.h to the perf unistd.h
     install -D -m0644 ${STAGING_INCDIR}/asm-generic/unistd.h ${S}/tools/in=
clude/uapi/asm-generic/unistd.h
     install -D -m0644 ${STAGING_INCDIR}/asm-generic/unistd.h ${S}/include/=
uapi/asm-generic/unistd.h
+    echo "mandatory-y +=3D unistd.h" > ${S}/include/uapi/asm-generic/Kbuil=
d
=20
     # the fetcher is inhibited by the 'inherit kernelsrc', so we do a quic=
k check and
     # copy for a helper script we need

base-commit: 649147913e89cd8f7390cb17cd0be94c9710ffa6
--=20
2.43.0


