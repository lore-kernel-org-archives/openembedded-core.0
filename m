Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C910C71136
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 18:11:47 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.48])
 by mx.groups.io with SMTP id smtpd.web10.3793.1749838297052874294
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jun 2025 11:11:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=ZVCOT3zs;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.92.48, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C+TMi61YWz19IE63FSNqYQA6JUuQLTkfh3oJmN7uw2I8B2wcvEqnNQrByAewBOoyUDa0udTBZIZsXtbIjfDy6k7jMQOFFRdi6WN0GANON5a/BXxL+QoetWIQBuM/AH9SFsIYsmj39aW/rHLNFBhjQ9q4C9mmhq0FdmpEf27MgplsRzKmngOeBIxB6G5SOy/z3J/lhFKuVkhtGKhRnE5F1gdG1j8QLVNJaji8BPx/ACZbEz1Joi+8sR+RSc6ymnfOFhVafdMxsUHLFv72/TuySOaGy5QRBI+8Z3TxBZKQjeVO+AaYU/Phxfbbts5I4JOm+FKtTX8fV9UorHPenv757Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fbivUEjn4481QGa0d6MC+m+3aL4Rfd60djG/ovVCxWY=;
 b=FvANS/ILiNbLcWgWRz3MtJdRbb4Bg4cBSbPIQFDybu4GGlLwn8lrEtm36657E6D3Wh0MJqha4Fqqh3D3SeUx2LtwWisSEh6NOEbmrFbEXaa251+cX1Tb/8cZxtbFyR9e20LO55E3HwwUce3YfgfBB//P+qs9B3wm0LqzYwxltJ/70Qna5JEip1FG6ne2ZRFwQORWRTj/6g9c0Z7tzQr4JST3pMJK1oXnr4aMvlAOn2ChtwMvBuI7nd2HRDuBD0Xf1h+pQAJyc3u7W4HQcpr64/WZv/XKYetfROoL0gpeX5IDC4J3owHLilTtBs5XujHlYK0cn97u2UPJy5YWtO6fgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fbivUEjn4481QGa0d6MC+m+3aL4Rfd60djG/ovVCxWY=;
 b=ZVCOT3zs+uigtxLsMXxl5lN+8R2A6psbRgNTkzYt1dfAYAUbzlBFs1tgJbYyEq3ghpHX4XoRjeLQuZI0WbFrsZPJXAURSY9N8z25BOndg+4YtUKA9wp9E0qJ+04jPTUMO01YWdIvfdKdocKGpnXFSf+NbesmQYDJtpI2+BI7KSM=
Received: from MN0P222CA0002.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:531::7)
 by DS0PR12MB6582.namprd12.prod.outlook.com (2603:10b6:8:d2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.38; Fri, 13 Jun
 2025 18:11:34 +0000
Received: from BL6PEPF00020E66.namprd04.prod.outlook.com
 (2603:10b6:208:531:cafe::e7) by MN0P222CA0002.outlook.office365.com
 (2603:10b6:208:531::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.25 via Frontend Transport; Fri,
 13 Jun 2025 18:11:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00020E66.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 18:11:33 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 13:11:33 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 13:11:33 -0500
Received: from xcosswyocto01.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 13 Jun 2025 13:11:33 -0500
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <openembedded-core@lists.openembedded.org>
CC: <raj.khem@gmail.com>, <jon.mason@arm.com>, <ross.burton@arm.com>,
	<mark.hatle@kernel.crashing.org>
Subject: [OE-core][walnascar][PATCH] tune-cortexr52: Remove aarch64 for ARM Cortex-R52
Date: Fri, 13 Jun 2025 12:11:27 -0600
Message-ID: <20250613181127.754779-1-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: sandeep.gundlupet-raju@amd.com does
 not designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E66:EE_|DS0PR12MB6582:EE_
X-MS-Office365-Filtering-Correlation-Id: 0853e1c7-6280-44cc-6240-08ddaaa5bae5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CMC0FUdF39hy1GGN4sDOZmwT3JE298mqvCKDGEaidFqjf06POpMswdcIFq4b?=
 =?us-ascii?Q?o15q5cGlTvN5/fTl/PlDL3cpKlQBj9ul7mgKkdrJeqgghatzRdMptWr/tamW?=
 =?us-ascii?Q?WGdWOKjKDNzRYLRNRfBauWaI5JGQqZFrB2PqPH20aXFIoZRSAKLMadr/H0nv?=
 =?us-ascii?Q?faWM5qKXzVnSYP/Zzhq96HfAEsBAxSO59lZpFOVVNdtxlwSTbn04L4rCtcOJ?=
 =?us-ascii?Q?npbKG+ydW3Pt44BJTJGip1RnH7uKxR1lNcBcXF2uKWNOHZy46AnDJ3l4pQG3?=
 =?us-ascii?Q?m7kp+wjjOOCW2hYQhhygJGiTnfsXzaz4eaCr+4bmfxBdUMGpvXw6blbmKA5M?=
 =?us-ascii?Q?4eT/1rMlKVOVeFsdZoL7mZsmLsEDMPSe705iNY4UYQ1oVgXPHYNpN64I3Gbb?=
 =?us-ascii?Q?1lUhiG8h5uFXbY4/fMD+KNXYXd3gZW7uUV2HGfNsw88JImEuzAT3jjsI20as?=
 =?us-ascii?Q?nvqBxQZek4mNbPXgCVNPJVU+X5i5oLMAPR1O8N6kbgRV4RJHUK1a35AS+BwY?=
 =?us-ascii?Q?tiX45GoO7vsQA5VNtbZR8OLQ7X9jYnaxBwuKi8ynjsP5xM8pjKn3PG8YYxfC?=
 =?us-ascii?Q?XdCOPn7CxwcR5/H40EwzK621R86CiCUG76fb3xSGIW2pT73jHRGGl/DbBZ1S?=
 =?us-ascii?Q?Y1DUavwtbiRsUQVp2iG5EIB/zspat2SaJoHeXkoU1i9APqLdoIXaN736k3r0?=
 =?us-ascii?Q?jaDVpqVKm7ccHV10+yk8Ieq3/qMbeId9MVf+nURqDEyV9joMalXIA35UwFbt?=
 =?us-ascii?Q?HIVx6qxhmWbK7PwUiAThmZLgeDVV/fDMeZGLuS9URnColhoSiHtovF4ZOnWc?=
 =?us-ascii?Q?nJH7wxNQjLqbpRB/T1L+Lrqjd8e1YatwN0VsHHSFAhxhlRHdmBRlXttwOpas?=
 =?us-ascii?Q?+aZ5KiZMjcr2hW0H+Nqmfe0YmpUrC33kiof6heNeP5CTV6OheJIWvg4V/8vX?=
 =?us-ascii?Q?SBS/XWVgi3SFvIL7yOeUbYvYJ5X1gHIP5km4pNYoPHYXBHYLm6XVYR8f+oQq?=
 =?us-ascii?Q?gifKoO6RLmZT2yEBLmfSt3ZdU5OvGTHmCcFukv1SXEK6je992jq4InyqvYqZ?=
 =?us-ascii?Q?NpxA1XGr8Y0BRi8xlp1FuZj8YvpQxHVNOhfLASdcccQOv6gNwN+IN/BwntDj?=
 =?us-ascii?Q?j9rYpU0jq+bhxVkFUbNoDUsaeE35kEt6Vol9vWuRStosotTQy3qXWU+HXg/t?=
 =?us-ascii?Q?kx3DU3QXSfBbsS0077WWsVEr3vayoHSIzL09QphvMS9nH0XhpEOZDeRNFonF?=
 =?us-ascii?Q?DMKiPZFfAR4DB/CaqlEQCS3n3vgVTQBlkQcQyXeOFMwRCyrDHSSPptX9HOIx?=
 =?us-ascii?Q?DWC1fh3L19LbrfD3Mz3P//JxiBRM/dW8jYi99I3h7SqC3coIfu+NfvsNsdyG?=
 =?us-ascii?Q?Xpx1KK0JVSLHmLIrvLyZO6r20MhskevH/te7tvcCWK6vY0BDr8MywBCsWZng?=
 =?us-ascii?Q?Lhnuc+vj5em3bJviU7amMSHqMsyYp22Qj29j2dH6huXag+cQL9cfWsPX5hLT?=
 =?us-ascii?Q?B7nIFGX+H68D4eKuNgG5vSOkL8v/onvr/09v?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 18:11:33.7950
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0853e1c7-6280-44cc-6240-08ddaaa5bae5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF00020E66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6582
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 18:11:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218622

Remove aarch64 for ARM Cortex-R52 processor as it supports only 32-bit
ISA but not 64-bit ISA. Also update ARMPKGARCH for cortexr52hf.

Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
Signed-off-by: Sandeep Gundlupet Raju <grsandeep85@gmail.com>
---
 meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc b/meta=
/conf/machine/include/arm/armv8r/tune-cortexr52.inc
index 89f0e09450..e8667bc16b 100644
--- a/meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc
+++ b/meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc
@@ -10,11 +10,10 @@ require conf/machine/include/arm/arch-armv8r.inc
=20
 AVAILTUNES                             +=3D "cortexr52"
 ARMPKGARCH:tune-cortexr52               =3D "cortexr52"
-# We do not want -march since -mcpu is added above to cover for it
-TUNE_FEATURES:tune-cortexr52            =3D "aarch64 crc simd cortexr52"
+TUNE_FEATURES:tune-cortexr52            =3D "${TUNE_FEATURES:tune-armv8r-c=
rc-simd} cortexr52"
 PACKAGE_EXTRA_ARCHS:tune-cortexr52      =3D "${PACKAGE_EXTRA_ARCHS:tune-ar=
mv8r-crc-simd} cortexr52"
=20
 AVAILTUNES                             +=3D "cortexr52hf"
-ARMPKGARCH:tune-cortexr52hf             =3D "cortexr52"
+ARMPKGARCH:tune-cortexr52hf             =3D "cortexr52hf"
 TUNE_FEATURES:tune-cortexr52hf          =3D "${TUNE_FEATURES:tune-cortexr5=
2} callconvention-hard"
 PACKAGE_EXTRA_ARCHS:tune-cortexr52hf    =3D "cortexr52hf"
--=20
2.34.1


