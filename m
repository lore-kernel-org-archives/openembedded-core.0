Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CC23C0218F
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 18:15:38 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.84])
 by mx.groups.io with SMTP id smtpd.web10.19621.1738174529563243509
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 10:15:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@agilent.com header.s=selector1 header.b=1xq2aJUk;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.243.84, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vzgY+QgxyYg+nLWehuaOpz3DLZnaBur9YZHpl/t3oNE+cGZaoVo1aukYv44/yXYNRNvq2WDr2365hqAaCA/1yK+3SNMKsA1WJv35WX7+kQv5D2g4PXckATqVd5WMwTuOK8IYcy5qTk4HBOJXCCSctHi2Fo/lDeEgft14zxAgbiOyu9pe/P5/j/fwvF2RmpdxfeBDcvFtULZjgCRiDMdQihNnagVOYf6owm7NrgXwE1e85qmzVNDj+xcZO3PZcCDOCbXvwhz6MDoLE1F1vD6At7++E9SdtJgOPD65lHBg/Sib1DJFQUzdpBvImDYtVjyYM1Vok2y3FPW7Hg2rWTc3Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7huP7lNPvRUIRBfm7/YA1CaHJaPsoNkD5gNlwfWwWd4=;
 b=BhNb9lAAw7lZ0OBCKWyBHgth/Q/32tL37pdQ/WYoVgwq71Hp9ADPEzI0Z4N9f5dJmlomBNcvCefgj8M3HzgbgcJCVSJQ9csfqDOdSx6QNqJTdCNs6ncZGOUpxLMoPFpxj3SngcPs9sAhZOk/wzdsnRO4xnlAuRFfIYaKNiLQ4mGdLH+BAEF6TDX1cGF6P7Xz0E8heH72J3EuHrOKCc4wkf2tnUkY5lyDZMW+63meG6pg7SdXTNRzyNDGO46ftzQ6/IOhYg6P8GGa1ZnJSUXjrgYACp4jHry8NtYXSBnBtbGruk6+uo7sSQAbBFvFr9Tn1xq+1zq4fYxFZ65xr5+UBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.37) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7huP7lNPvRUIRBfm7/YA1CaHJaPsoNkD5gNlwfWwWd4=;
 b=1xq2aJUkhf5UQcKolj9bqCwgcPllMw9wUt+nefapblFUJfRYVOb1h17lTArvI7GCYpEP3LgjuOuZX6uGFiDvRT7DnyxOvUxe/772ARNEa5cH0LkMk+ZxXDx+8NiT2We6Vy3H9pQVqfrmwElfktBTMun3DYYZji72VcDLKZK1Hvvkt/4x6Et1oUj7Uau3WDaC69xjDbMd/k3b8FRwamCRqa80F89Ghe0th07G1IBenaDHeGz9QxNRbtvoqiDOJ2v54tLXiMViUHweyuhtIBZf8VX+KJ/jzA4ts5ELI+2Au0lWqe7lkveR+y6QM3qNYERbmKnJ184isv6HFKfu3GFL/A==
Received: from BN9P222CA0003.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::8)
 by DS0PR12MB8199.namprd12.prod.outlook.com (2603:10b6:8:de::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Wed, 29 Jan
 2025 18:15:24 +0000
Received: from BN1PEPF0000468E.namprd05.prod.outlook.com
 (2603:10b6:408:10c:cafe::c) by BN9P222CA0003.outlook.office365.com
 (2603:10b6:408:10c::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.21 via Frontend Transport; Wed,
 29 Jan 2025 18:15:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.37)
 smtp.mailfrom=agilent.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.37 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.37; helo=edgeappmail.agilent.com; pr=C
Received: from edgeappmail.agilent.com (192.25.218.37) by
 BN1PEPF0000468E.mail.protection.outlook.com (10.167.243.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.14 via Frontend Transport; Wed, 29 Jan 2025 18:15:24 +0000
Received: from laplante-B650.lfs.agilent.com (192.25.126.4) by
 edgeappmail.agilent.com (192.25.218.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 29 Jan 2025 11:14:41 -0700
From: <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [PATCH 5/5] oeqa/selftest: when setting up the local 'poky' copy, also copy local changes from the 'scripts/' dir
Date: Wed, 29 Jan 2025 13:14:56 -0500
Message-ID: <20250129181456.1826467-5-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250129181456.1826467-1-chris.laplante@agilent.com>
References: <20250129181456.1826467-1-chris.laplante@agilent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468E:EE_|DS0PR12MB8199:EE_
X-MS-Office365-Filtering-Correlation-Id: 743d7e20-8a52-40e7-9959-08dd4090e6a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fNYP5PHfr27kFBcopcDvB/TnWC42rl0kzIFBhsCFoAzxYRVOF4Vfwk93kz/Y?=
 =?us-ascii?Q?XFaR9Yl6GaUTvaTbl36y+PFqIeeaYNttGnLy1Nw7PKVfock8sUR+rIaPNPJm?=
 =?us-ascii?Q?bFCyZov5wJC4QCJofEFrXG11U6gUppu0eW4BdL7aWbuci64yXG/rTqjZDhyS?=
 =?us-ascii?Q?NmN9w4vmU1ynOHYgxacYcTKaO0qo9ou7ytsuN/2JrN3GsMZEpH6S+01OyFLC?=
 =?us-ascii?Q?CgT2Din/P69CTaVdN9rsofkqWbgKE75oRpvh2uYxCxAr5XtvWOMwF5uPC/7t?=
 =?us-ascii?Q?4Q5JpM9qtipQwUm5KSnMmdLQG93DWfOj3kR2VipuPEQA2ZPhOsAeA88GpPsV?=
 =?us-ascii?Q?Zt8M9rot39Fs5QA4b9MnfnASwdQawHJqz78RA3px51BKZQIJ9Z+8iWlQa+rB?=
 =?us-ascii?Q?ed9nisNI3kH2qllPPkbb/o/nJV7C3CuAfpb16p5h8RtLW0Kkrk/gaMSvb2nb?=
 =?us-ascii?Q?Kq6q/58e6/w7ylhoiMVjrLVsUvIaVCYT61JEUnSdJ/8m3ICxG7BskzMSSCeh?=
 =?us-ascii?Q?MZBgEN2WwEcLUV2K8lF4zqhqXn2SEPew8/7m53GRLyvSUKdkgeE1NKWu7Dx8?=
 =?us-ascii?Q?RdcRb+haPWqijqjzc9B4PP/i7cGlO6jFaWxV3sSrDQzuc78cl95dGvSJUmAO?=
 =?us-ascii?Q?Xuym+7unxek8xa3SQ015BP2seucLUDYjxbBEhcIunXK04nB5YjJ5m5SjJAC9?=
 =?us-ascii?Q?jK/6xT5wW+5DTk9IlqfR1I67KXyrVhhO7Q8rcIwGJiVF3zbPc8b0rHYVgag9?=
 =?us-ascii?Q?441ZabzxmHxl//cqTMy4950a8yUjVB13MlTzObIMsN5gIlqIlukxu+I7mdBk?=
 =?us-ascii?Q?sUnTOeJ47KRZ24l1Ksd7x2rwDuUd6tbIz0U+nfMotBdhMshJ08o29tS7i1uD?=
 =?us-ascii?Q?4S/wV3F0fy1j3Xz3bgcKR1xYo2YZW0TzxTX3lW7hkjSH7FghiZWcgVo4ARCo?=
 =?us-ascii?Q?5LRESFl+Ux1YYE/JI/UFBttJwmcsBcnoq7VOG2+rTF9AWturEnbvhz+ytamj?=
 =?us-ascii?Q?BETK3mpxJWcT0C/DFf1N8/+vjMfAX1UInXD6KjHn5W9rusN9Zy5TX7qAq95J?=
 =?us-ascii?Q?1r9klxh8trXvnpjoDNRWYUXW1KjSO3FOoH2Og9zTF/ERR5XOvI23WKFAts0x?=
 =?us-ascii?Q?JjO0i0pRo3mrHd3PGP1+ZNS5GvNyo9mVWhJZ01Zmz32OUaDpAKDZeKiiqyiA?=
 =?us-ascii?Q?ff+RdP454QuxsVQycCLzEf9eAzQ+rYtWqEMEXBwz7Ta9vqwF6P0cBZSdEH+s?=
 =?us-ascii?Q?Ssivns+I3Oka0BlfAEEc5cdqmiLlc97HRx+T63yaaLl7aeeyx4z7c4kGrr5R?=
 =?us-ascii?Q?BndtMGxNFHb7YptgxNIpqYRxQVTqpQiaPFsSLXbpC1yPRef8zkY08dTWYCxF?=
 =?us-ascii?Q?5/2hF/FnXhj8oHweBP3FmpA5p4RH7KCFuiXGAwUDBs3hnhec3oeJOGGkbjxg?=
 =?us-ascii?Q?Yc77Udz+VysR7E16LglInhKdHboJAbRIf+9yYlvrKglCmOLfajE2GH5mi/4M?=
 =?us-ascii?Q?idgryko3fKrX6a0=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.37;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:wpcosapexchedg1.windmz.agilent.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 18:15:24.4021
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 743d7e20-8a52-40e7-9959-08dd4090e6a3
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.37];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF0000468E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8199
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 18:15:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210407

From: Chris Laplante <chris.laplante@agilent.com>

It's very frustrating to make changes to scripts/ and have them be
silently ignored by oe-selftest.

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selfte=
st/cases/devtool.py
index fb9d7966ed..e09e9755a3 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -64,11 +64,15 @@ def setUpModule():
             # under COREBASE and we don't want to copy that, so we have
             # to be selective.
             result =3D runCmd('git status --porcelain', cwd=3Doldreporoot)
+
+            # Also copy modifications to the 'scripts/' directory
+            canonical_layerpath_scripts =3D os.path.normpath(canonical_lay=
erpath + "../scripts")
+
             for line in result.output.splitlines():
                 if line.startswith(' M ') or line.startswith('?? '):
                     relpth =3D line.split()[1]
                     pth =3D os.path.join(oldreporoot, relpth)
-                    if pth.startswith(canonical_layerpath):
+                    if pth.startswith(canonical_layerpath) or pth.startswi=
th(canonical_layerpath_scripts):
                         if relpth.endswith('/'):
                             destdir =3D os.path.join(corecopydir, relpth)
                             # avoid race condition by not copying .pyc fil=
es YPBZ#13421,13803
--=20
2.43.0


