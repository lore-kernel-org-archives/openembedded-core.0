Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45648C3ABAC
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 14:39:24 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.41])
 by mx.groups.io with SMTP id smtpd.web10.104.1745937557354171598
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 07:39:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=Uikb5h3l;
 spf=pass (domain: ericsson.com, ip: 40.107.105.41, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kS4YTFGOB4+rjuSVVw7DDxIg/xVys5sCSK4bRkgaBVC0XrzhV1lzcChHjO8wBw97y39EhwUjaq+7RIiGpX68E4QkDY3BZVl5/E8J/2mWo2V24bwMwkbWRSfXtCg+q0jSCd/2sQ6Smpz11YvtKd2acIdvVcHjuxTZD2icUZYOC4uRns0AVIFa1ryuzeTVjv/Y9hOqb4lPRmVNlnPLCAZ6N+tWNl7H4zLXy295YVTRPG6nvwvKnP7MpsODVKsRhnX8uFfGRROLsaolmKwXSFa84AZCPhipV9rMTJStrIhWKl5sdwGI+qCWD476shbd7+hUkp/uV6eZd0mOtSh+EIj03A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N+qqmtRkrh20UB0tGxYyzCOBUh8CSBjjuSBZNlzc1GI=;
 b=rCATLpNpvSfZMHlPuxnhf283MGlxcqPb6RG8no3n/bdACZ4oPXFJPHY4JheSjnT5AO+eZ7IdW23SDvDOJ4OmkA/lUqXZHdSRpk3pEDTd7Hh6mDAfyJybTmAsL5drD3u1LuPiLqkenJwCLSx4y1M6t3FtGn//MtqRpjAxEFzEWSqz8W3ol0ksL3hOMiO+O4RTR64WAxTRdrD3A2sLaIQqh4JP8fgaeqO+vCH7GsiWFWxopOavKAAWwI4l9zroysBqXlPwpf9JmDUeItoFCGJj86I2FWlnHzmHv8zicjnEAcWrhxp1DE6DwgPoOU96YlTvCx7LLePWB0k7TG5nLEpM+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+qqmtRkrh20UB0tGxYyzCOBUh8CSBjjuSBZNlzc1GI=;
 b=Uikb5h3lvW9FO5YvKTM7fNT6fHrdiSXSPA5ObWPr3P3HzDe5huBdkqF7bauY+jez7CkozE9gvXl8pvr9YdAVuKb4G8WyXIIPOX0U/hbVWwzAjAsNoOEKcEZm8hvznmyi5omfRsJgTDvUw25TKVy4RbEE7mAx0ZZ0ZiwsrRdEFpqQzN6OKqi551nJtA5QEmWnqgpftE/jZD4CMAOdrla6Z+XzMESt2+589/Zc3XCIngdcftK6Q+IMJAiqXtL7tWs7o2uLfZjomn2X8SugevTFR00e7r74FsJwNhMtejYLKMwCr32PWOfz8nm/Ak1X20n5Bompea+H71yWwPe4+mgeDQ==
Received: from DU2PR04CA0082.eurprd04.prod.outlook.com (2603:10a6:10:232::27)
 by PAXPR07MB8446.eurprd07.prod.outlook.com (2603:10a6:102:2b8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 29 Apr
 2025 14:39:09 +0000
Received: from DB1PEPF00050A00.eurprd03.prod.outlook.com
 (2603:10a6:10:232:cafe::e7) by DU2PR04CA0082.outlook.office365.com
 (2603:10a6:10:232::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Tue,
 29 Apr 2025 14:39:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB1PEPF00050A00.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 14:39:08 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:39:08 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id 01EC34021583;
	Tue, 29 Apr 2025 16:39:07 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id C957970E75F7; Tue, 29 Apr 2025 16:39:07 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Peter.Marko@siemens.com>, Daniel Turull <daniel.turull@ericsson.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: [PATCH v3 8/8] cve-exclusions: correct CVE_STATUS
Date: Tue, 29 Apr 2025 16:39:04 +0200
Message-ID: <20250429143904.634082-9-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250429143904.634082-1-daniel.turull@ericsson.com>
References: <20250429143904.634082-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00050A00:EE_|PAXPR07MB8446:EE_
X-MS-Office365-Filtering-Correlation-Id: c6cb3a8f-692e-41db-1fff-08dd872b99bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?m1YGDES+rsd0HVeFwx98zEi+dz/htAZfC2pVBe6W4sQzndgO0BlRnQMdT9Jn?=
 =?us-ascii?Q?qPNFQuNn5nxTOp2YHIW+/PHKHEnQPlfVw9Vs96/topT82mBFChoKh3encJRZ?=
 =?us-ascii?Q?yBsqBRK93WcGOySjI3CE7jWPslPGsMIwF/nQ7shlFUlHame+AIPxgCBNZ182?=
 =?us-ascii?Q?klAU2oa0Q9usRHtk1hxztvRnldhvlvTqxt4oAn/Ke0A2f0YEhCAh4nk3DM32?=
 =?us-ascii?Q?KimoDXqK4sQ2+aqCsK5anEmOLBwQTpmtOris72wv2Bu/uL401oAp4j0e3keS?=
 =?us-ascii?Q?3Ftw/srd6JTpGN+52NEpvncfqitv4P5ybcjQ4CcO/BVnMRoxj+672nLOu0/8?=
 =?us-ascii?Q?1xqS4PHh8lLBS8m63zRFygm4AYsOqoaYrDEni+7V/ltmEaoax7ACnrR+jvI5?=
 =?us-ascii?Q?lu+9VDog+uaKzV3zv286eiqGm4TxD0jYJyAIpdf8EIzg/vKk6PbKdSUrZ+Ar?=
 =?us-ascii?Q?cLyNDrgrFoara9odBySi8vowD00/R9FK/UOKZebChc8qHdk5IkW3p3Vg+7DL?=
 =?us-ascii?Q?PmpzxMgL+Fv07tdM9uARd6mD6mDOd+PBfNFlhYXhbhlLo7k+1NGhP/kGxQPl?=
 =?us-ascii?Q?sgjqYvZHr4N0vkzCDw/hyhcAIME69ekdxSiboPwMvDQNHNN1mbguTo0LtRl1?=
 =?us-ascii?Q?r8chTvOjr2oOGm2CS8uFZ0YqvFqmc2BAm5Qf5L7nME+bnVyXg8mT1eqIy0UL?=
 =?us-ascii?Q?OLYr9G70D6xdXCG+EEHRQGH9GZtNRPsll+/u7ZQJUMSaAC0OBADmdInofgLT?=
 =?us-ascii?Q?f2CkTuoV+SWophA0a5ayZX1h2C7WLWWOh6QQX8ymbsjhJ6/C/+4c0ks4H44/?=
 =?us-ascii?Q?WKMJ1HiblCOgTVAMBPTmDAoq1z6wiZ7S6Z29v8ZwH6YtTrGZ21E5e0Gqd+cS?=
 =?us-ascii?Q?8JZAKJ+DPlsmx6+AhJez91u9nLsB+etXckxK+7emS//WPcgMRETLgzwctSaM?=
 =?us-ascii?Q?7yU2uxF5JNe99dLi4UR5p8EWuAiFXrz6ULfuUvRRaj00dtMd8/RfQBinFtT2?=
 =?us-ascii?Q?QtCt/nDL8/vPCsAyCVhsxVSlVpIWutsFdAIksa6uPh98WB8kpYREheRB+mz7?=
 =?us-ascii?Q?EYbji6+arXS4wFs2LG1+0tDL/B7OWP5b3T7Nxob3v2Tj03n3ZHS79tkiNg6q?=
 =?us-ascii?Q?TBP9kS3cTIyeHHOqi39IzB5pGTR9kwhMC/1yEYixcJWx39WU931Sksv4S/cR?=
 =?us-ascii?Q?27E2TTPEPMVAXVzXCMr33jkyQvN4+T31k60XdroFfJY31MAK+oOg+FWnFihX?=
 =?us-ascii?Q?jIxM+G+YNBl8gt/yYKF3rirZ1ByNgJm6CA17NkYwO+4rrR+CJAP02RZRbPp2?=
 =?us-ascii?Q?4FdkocNtUDa44CBDhc7Peh1XlghU6YNQtv3qKSSw2x1wyFHKMkGS8C4m5N/e?=
 =?us-ascii?Q?WfG8vQOjofTjg7NRW9P1QadaT25NXGUGawngIIa4fiH/0rbVh7ZK9yDjaOzO?=
 =?us-ascii?Q?Bwv4f8529UGJ50tPF2cuZeBT2FAQVk102zvSgtDXluOnq0tG/ViU3HVAB4+T?=
 =?us-ascii?Q?+Cjw7uE5wOs3cKT5OGXqiF/jcHFDY+Hf1ECgcTEjX7+lfw6a0hyb9Vn1ng?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 14:39:08.8079
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6cb3a8f-692e-41db-1fff-08dd872b99bc
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR07MB8446
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 14:39:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215675

From: Daniel Turull <daniel.turull@ericsson.com>

Some old CVEs do not have proper metadata to be able to resolve them
or at wrongly assigned to the linux kernel.

The new kernel cve handling fails to report not vulnerable for a few
CVEs that were introduced in LTS branch.

CC: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/recipes-kernel/linux/cve-exclusion.inc | 31 +++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes-ker=
nel/linux/cve-exclusion.inc
index f1b7db44b6..a80588ddeb 100644
--- a/meta/recipes-kernel/linux/cve-exclusion.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion.inc
@@ -155,3 +155,34 @@ CVE_STATUS[CVE-2023-7042] =3D "fixed-version: Fixed fr=
om 6.9rc1"
=20
 #Fix https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/comm=
it/?id=3D7315dc1e122c85ffdfc8defffbb8f8b616c2eb1a
 CVE_STATUS[CVE-2024-0193] =3D "fixed-version: Fixed from 6.7"
+
+#Fix https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/comm=
it/?id=3D6c54b7bc8a31ce0f7cc7f8deef05067df414f1d8
+CVE_STATUS[CVE-2023-53012] =3D "fixed-version: Fixed from 6.2rc5"
+
+#Fix https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/comm=
it/?id=3D2f10d4a51bbcd938f1f02f16c304ad1d54717b96
+CVE_STATUS[CVE-2024-35788] =3D "fixed-version: Fixed from 6.9rc2"
+
+#Fix: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/com=
mit/?id=3Dc8243def299793ac6c85fdc1086089c800c1051a
+CVE_STATUS[CVE-2024-57920] =3D "cpe-stable-backport: Backported in 6.12.10=
"
+
+#Fix: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/com=
mit/?id=3D62b9ad7e52d4777f7e775ee1f0ad2452f6041024
+CVE_STATUS[CVE-2025-21988] =3D "cpe-stable-backport: Backported in 6.12.20=
"
+
+# Vulnerable code only in lts branches until 6.1.129 and 6.6.78
+CVE_STATUS[CVE-2025-40364] =3D "fixed-version: Fixed from 6.7"
+
+CVE_STATUS[CVE-2019-14899] =3D "cpe-incorrect: related to opevpn"
+
+CVE_STATUS[CVE-2021-3714] =3D "not-applicable-platform: specific to RHEL w=
ith securelevel patches"
+
+CVE_STATUS[CVE-2021-3864] =3D "not-applicable-platform: specific to RHEL w=
ith securelevel patches"
+
+CVE_STATUS[CVE-2023-3079] =3D "cpe-incorrect: not Linux but chrome"
+
+CVE_STATUS[CVE-2022-1247] =3D "not-applicable-platform: specific to RHEL w=
ith securelevel patches"
+
+CVE_STATUS[CVE-2023-3640] =3D "not-applicable-platform: specific to RHEL w=
ith securelevel patches"
+
+CVE_STATUS[CVE-2023-6238] =3D "not-applicable-platform: specific to RHEL w=
ith securelevel patches"
+
+CVE_STATUS[CVE-2023-6535] =3D "not-applicable-platform: specific to RHEL w=
ith securelevel patches"

