Return-Path: <mark.hatle@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0479FC6169
	for <webhook@archiver.kernel.org>; Fri, 13 Sep 2024 17:02:51 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.68])
 by mx.groups.io with SMTP id smtpd.web10.78709.1726246966101806418
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Sep 2024 10:02:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=eEQvfP+9;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.236.68, mailfrom: mark.hatle@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mC9znEjWxSdfYi7w9AzB+Fc1uvg3HOg1tMXY3zPt48AOXbuKdtDlU8rUWJixzOATw9ttDa7iHZLONXGPUxf4wz9YCs6KeOOoZX/lxsu+AZPD2zwQzqq3UHWi6DUeimYqbHjzHgWIICT9s3KNUpxl/KmFqwa1dauma7ZmUAMLrsmrKhR7Im9rWUYMVPk4+XB1kLvVC4L2ogh6rubLOWzc6gO7CPbQgbUnmv1VJX0gDEg0m8m1dAjTLJGi9+oHHlt0NJ9PiZv7dZEQD267m9+dlCnrbNWG2hnRm/vsOo69U5EyNzWbCcnDHFem8LDys0E6LRge6O4Z/JeCWx9A344cYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FrTFmPDoTBziojka+ZNtyVcMTl0l1Yc6IJ0V7dO7Qks=;
 b=WFxqN5uJmzVOCGIHB78ahYbDj/jvQCaivxMsvj0RRSlNA24WKwgGW1zkdko9RKNgQjJVK/Pa7WM2+jeSkB6pC64dRVA18jxvltEDwnZVmbyr913+9dHFBPXoQhvdVwtv+TeRW8wlt+Tej3Po5h77NsexQp5Bp4UGE4tC42WpDVvPOdMMRSCwkviucjr7UJV6sa6va3Fs/ieX0bASWhouLASJyzJjxsmzVUCeInfO/9ArLcM3ExSz0E7Z1zF5Sxz6gwwaQAQS4WsLuSa6sWsXyCzT7zP9j88lWutxxSqHNG/XY8iPRIJB5calFAuYLVckWeR8UeNiOyMPYLXbDx7OMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FrTFmPDoTBziojka+ZNtyVcMTl0l1Yc6IJ0V7dO7Qks=;
 b=eEQvfP+9LQSdbWF4oeskVa4uEJ8487ca6J+ixlnZKW28dn4ukRPex/yHfUg/igbm+1MAwKQ6UwAxp3yZ0rPzwvEussFl3JVCGACN2d+wr8lMYkKyPhA5kg7RNlfzbWJSScsRGShV344ns4DQyxG47Q+2Oi3BVBQskdzDON/HI1A=
Received: from BN9PR03CA0893.namprd03.prod.outlook.com (2603:10b6:408:13c::28)
 by CY5PR12MB9053.namprd12.prod.outlook.com (2603:10b6:930:37::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Fri, 13 Sep
 2024 17:02:40 +0000
Received: from MN1PEPF0000F0E1.namprd04.prod.outlook.com
 (2603:10b6:408:13c:cafe::bd) by BN9PR03CA0893.outlook.office365.com
 (2603:10b6:408:13c::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25 via Frontend
 Transport; Fri, 13 Sep 2024 17:02:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E1.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Fri, 13 Sep 2024 17:02:39 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Sep
 2024 12:02:39 -0500
Received: from xcolc230100.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 13 Sep 2024 12:02:39 -0500
From: Mark Hatle <mark.hatle@amd.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][scarthgap][PATCH] gcc: Fix spurious '/' in GLIBC_DYNAMIC_LINKER on microblaze
Date: Fri, 13 Sep 2024 11:02:39 -0600
Message-ID: <20240913170239.1479734-1-mark.hatle@amd.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: mark.hatle@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E1:EE_|CY5PR12MB9053:EE_
X-MS-Office365-Filtering-Correlation-Id: 12f36213-463b-461a-a861-08dcd415e02f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?uxHgkCadJXKYnIQFufI6a4JsvVBKyeM3euNNgVpDd+sUnaBWzp+sPA1TNK8K?=
 =?us-ascii?Q?HpAyFNbWBbdqUtDvLN1bMFj29kzPYdO9mVMtmq7u4SbrWnz/wvnOkgSWEiR3?=
 =?us-ascii?Q?+Z8IaOPxcAuDB3ZklImxLKzxJ5kodjX7d7s6lzD/ADaw9Ujs7XQnxPGdElzn?=
 =?us-ascii?Q?sw5XGh7scG+uSOPVlRYGvUIkxHIpf3zkDBIFdfpajnMVFcBrv4yB1lpdDH9d?=
 =?us-ascii?Q?8X6wsrqIWAzWshjI4E/WaFElZrACoLIcPF8qzFIbjC1tpM7xu5klGoyKia9z?=
 =?us-ascii?Q?+ZcWyzjqbEMGASXySbVnXJEM1nrZvU/5DU6ugkqjmYN/tiBd3BDBDVwFGpsS?=
 =?us-ascii?Q?zq8L6pb01HuqnmEXIlvQVZoFetKuSGine7plLlsb5Ce4F0RHVaXkOxf3oDPj?=
 =?us-ascii?Q?4A5Y2iyyexyVeQAGwGBtZNb4+k+ZxT8po0biR+ZX+3cAnDfAS/JRFJdOPC2i?=
 =?us-ascii?Q?qy0KyW4GZqIgTruJmtT/fb61yX5fYaXoi7z4zj+zgexMgPTUX5LwX0Ls9l3z?=
 =?us-ascii?Q?mPnZGt6pR56OeQZGuHDrQg9HgnAe8/5U/HrWnRDfAuyElBky6ZUU8Hh3oP4P?=
 =?us-ascii?Q?I9jZRMK5GMBcj66itUhiWOR5BjXEZhgLjq8iAoDNLjvhTj4vIh1i5xs9TxyJ?=
 =?us-ascii?Q?RmdR7JK4jThXuiGOm7CMXU3+dSpzHjDk/Da7ukEsWGWYMz80X4VVtmMYfJmn?=
 =?us-ascii?Q?pvwELIWilOdXVi1j9nzCEq+WubeSAiS2VkjeQuKoynIv1kc8U+YqrkRMLvSh?=
 =?us-ascii?Q?8vJnii0CUfwRoUkDUnEZpZYLbkR7bsGmfLTI1tpEDmCKIXuHeb/lbGglauyv?=
 =?us-ascii?Q?gVbxEHxtacYxvDvQtry0sdYcn0ZlvQd0e80HkgAdKMKo7QNtYcDNh6mc8k2+?=
 =?us-ascii?Q?Li2b71KKHyCJeodiapP96W2eImFdvJGmUZbFazvVBOXsnWCBUYB8kJg96Njc?=
 =?us-ascii?Q?d/gkG4o4UBvdixM1bx80uRB9O42EkqI7R1LPsrqyi7epwlra9EXzoo/xdZaz?=
 =?us-ascii?Q?KzwsouVKXBsDyX9FeM6OmVzlpDE9f/cGHDGB2c6fXys7IN0BFMEkZTlUSsFK?=
 =?us-ascii?Q?DuOtJ6TPwWTGPQPo3E2pkmKX/+3CLaVVrZJlGvGFwPwwQcfbCTGlyo0aosZa?=
 =?us-ascii?Q?p1++JmkDf+LdY4DUZBT3MaSf4HIHhnpcQnkfXlP07wuKdSO6AXvzFyb/wX0u?=
 =?us-ascii?Q?3hTNoQVQ74fGXZoRZLBFNYQ/GFmM0sAe0Hm6mCr34/Izq5Z13336gmMpmUdo?=
 =?us-ascii?Q?UJmEi8meLPjfWLWIA3OEDXHK4W7GXzUOUp170THc4wloQoDK3pH/Ae/97ahF?=
 =?us-ascii?Q?RCy3ZTkx3mebE9ShtX9NMMig17PGRHcKXPatvqJzTVsf13lvUKx9ft22aVj+?=
 =?us-ascii?Q?RHN0Su3xD8e34/XvjAb7TdZlf7+g70zoYM81rSgvMbV2MWELzIOQUwB/nCYf?=
 =?us-ascii?Q?312zjPIlMh9T2kTg3x1JmRwuGkdxexKN?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 17:02:39.9764
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12f36213-463b-461a-a861-08dcd415e02f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000F0E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB9053
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Sep 2024 17:02:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204487

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Mark Hatle <mark.hatle@amd.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Backport from master OE-Core rev: f0eac82b9a1e4549b7d918df768c369ed7ab5183

Signed-off-by: Mark Hatle <mark.hatle@amd.com>
---
 ...fine-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER=
-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc/0007-Define=
-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
index b0b77dbfa0..9de883c2c7 100644
--- a/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UC=
LIBC_DYNAMIC_LINKE.patch
+++ b/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UC=
LIBC_DYNAMIC_LINKE.patch
@@ -1,4 +1,4 @@
-From aacfd6e14dd583b1fdc65691def61c5e1bc89708 Mon Sep 17 00:00:00 2001
+From 4067ae345f0ff1fbf37c0348f2af09257513b817 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:24:50 +0400
 Subject: [PATCH] Define GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
@@ -185,7 +185,7 @@ index aecaa02a199..62f88f7f9a2 100644
  #undef GNU_USER_TARGET_LINK_SPEC
  #define GNU_USER_TARGET_LINK_SPEC \
 diff --git a/gcc/config/microblaze/linux.h b/gcc/config/microblaze/linux.h
-index e2e2c421c52..6f26480e3b5 100644
+index 5ed8ee518be..299d1a62c81 100644
 --- a/gcc/config/microblaze/linux.h
 +++ b/gcc/config/microblaze/linux.h
 @@ -28,7 +28,7 @@
@@ -193,7 +193,7 @@ index e2e2c421c52..6f26480e3b5 100644
  #define TLS_NEEDS_GOT 1
 =20
 -#define GLIBC_DYNAMIC_LINKER "/lib/ld.so.1"
-+#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "/ld.so.1"
++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld.so.1"
  #define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
 =20
  #if TARGET_BIG_ENDIAN_DEFAULT =3D=3D 0 /* LE */
--=20
2.44.1


