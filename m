Return-Path: <olani@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23C1ECA0EE9
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 07:27:37 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.26])
 by mx.groups.io with SMTP id smtpd.web11.7753.1725002852265088937
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Aug 2024 00:27:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=EHk3Keuy;
 spf=pass (domain: axis.com, ip: 52.101.67.26, mailfrom: ola.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VpMH13Oi6zwNZoKQnfwmYwF9xQy21bdSMxMFhMi2yOxwAyaiDmBRBWNi40RG5hqhG5TfuyNPb2g+k7qdS1JtE3boczfoBN6QScqVu+vnVn1K8b2qLKyEOwFvyu4XcDXa//19CjuE57QG2M5bI/tRVX566VKc6Vqe6Owi76RuGO3NtFFu0qtGuBYDHil7rfiCelME6Zxc6GBsIE0iZ1c56iF4oxTLOCl9GdSFp4LWn6PnhZzHY61IyHXLwbhTnVgtSul92pVhOVhsqw7mPQ6LFBi1ll2z5RUMyXWLzMOnzk7W6Aq3a4r+N/ZBfeJvBiARNNle6BmXxf57rXB7DXzwbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h2QO1lwp6vw4rgj31IRjEDgaAfbrkLgQJurhZEE4SiE=;
 b=Nll9DKW3g83uB+Vl/tgWhhAlA0iZw4V+ojRvPxxAgJwo5sDYAthWAUbm7pNrRux6isefwXi2HDdcaY5me/Gkh4XMWaSWJOgr4PKIgZq8yBd3mcRP0YTfDagQA9GDABxCHarmuYxavUjGQChoZ1bMJfFc52NPtoBf+QLyvp0hLhNDsIBvrwfB4cCEPKof7MKMAyL1h9a8FSt3wkMNU2Dz3mgA9d1qvJeYZrtz12SAQlSlzVvLbk783tAn8j9LjDCrT3gE37J4KaT4lenoNGVUaWjbybjfd8GOeDry0+cdFCP/nmKcX6pIowP1lq29WD8pGihaDwGqTlQA4xWNbNIqgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2QO1lwp6vw4rgj31IRjEDgaAfbrkLgQJurhZEE4SiE=;
 b=EHk3KeuyDDCyCMwNGWVprWRDwETJuZKRNDRVfyYSeWZWml00inVjJ16X1NU0lOo9FSijsr5m2s7wLvMAqMcEPcdYkwuf0Lxfvr1qhZEB9nCc/xBJjZ04VCBoGgkyaDjv/mgwYR/My8DNfjP9zEYH4k5jiPfalXYzHqK+NhOPszE=
Received: from DU2PR04CA0258.eurprd04.prod.outlook.com (2603:10a6:10:28e::23)
 by AS8PR02MB7000.eurprd02.prod.outlook.com (2603:10a6:20b:2ef::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Fri, 30 Aug
 2024 07:27:26 +0000
Received: from DB1PEPF000509E3.eurprd03.prod.outlook.com
 (2603:10a6:10:28e:cafe::23) by DU2PR04CA0258.outlook.office365.com
 (2603:10a6:10:28e::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20 via Frontend
 Transport; Fri, 30 Aug 2024 07:27:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509E3.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Fri, 30 Aug 2024 07:27:24 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 30 Aug
 2024 09:27:24 +0200
Received: from pc58073-2410.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 30 Aug 2024 09:27:24 +0200
From: <olani@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <olani@axis.com>
Subject: [PATCH] insane: Remove redundant returns
Date: Fri, 30 Aug 2024 09:27:24 +0200
Message-ID: <20240830072724.2719936-1-olani@axis.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E3:EE_|AS8PR02MB7000:EE_
X-MS-Office365-Filtering-Correlation-Id: 61ec4f1a-05bc-4d00-1de0-08dcc8c531be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?HIy7CH6C7ecjc6IRZtSP9L3YBJhV/gwQ9AFOFY/qp0CGio/dEP6cVTG0qDfM?=
 =?us-ascii?Q?1Yjsci7/MEpMP0909UmPEyPd3bpX/UUQRwCPPJi6N+S1IVk5oqsHEdiUhVeL?=
 =?us-ascii?Q?ibIwbbiHjjNTjuVfuUA5nleKQG5OKh9hi60COd/VQ3fIbPO5HJ1jWxVU5Vmi?=
 =?us-ascii?Q?Xd/1uKjGQjtGKWtFSJtcMwRwBKxZkYdct/qADGULsYx/l3w70LM+eUHWs3j1?=
 =?us-ascii?Q?nBuZhKnkRasIgEJpCXQwZA1jAPedLa+AwCVfxyniYbqpvJj+yhsdsXpwnI8a?=
 =?us-ascii?Q?LVaDki3BWjR/LyPyNEeCH/DOtJXfkHWWg3xDyCoc27c6uaBhuk8BBs9gAD5V?=
 =?us-ascii?Q?pe7LGH+UNJwQHsSW5Q4t8LFoRrDP/Jms/gC14+g3R0YEVEI0F3MmGHafowxK?=
 =?us-ascii?Q?Qf1S+SK4jdPJfWFNAi2pwIyYday4HDbxHUjUjArohfgK580WILlMI9HriaUG?=
 =?us-ascii?Q?opbOQk2ucsGKWprAQTG7nKMbly4KNxwLltM88hOeRCACJJdtjjl15zTO4zxG?=
 =?us-ascii?Q?6th535Yr4PguZEZ5LC7ERSwvfrDuyTMbbRhI9bqiz5fxXQ60wkEpt83rdIo4?=
 =?us-ascii?Q?J7qG5udAouD5RpGwBsfcFqIBjwCpvxtSA7CxcBRLU79kDcc2VlCCHr1T8Nac?=
 =?us-ascii?Q?JZXsU8/YSriC4r4AF1o5jk+qkjhG2oUJlRNry4l5z/1ajTCXodQILvUPSJ1n?=
 =?us-ascii?Q?AGJd45QbaeHq5zdE8me9BbnYP9ODHltnH5+c1tqTXXTJBKU2EmlMtP7eq7tL?=
 =?us-ascii?Q?G581AyUrJQptH/qbq7A4hjzFEAD4iLbePOAgNuRilOrkBg/U7e15e1IT5pqf?=
 =?us-ascii?Q?gh3szstO2pdzz+WLFkXK/9eyjdK6elkRcBqY3HXwOqKataNbOWOGJOrJMNo2?=
 =?us-ascii?Q?8DFYc9ApOvt2MQPFxPhBckVcESL6Z0tWs+sV4AUPy1geAQEyCMB5ZqZGCpGB?=
 =?us-ascii?Q?hUd2fUcyAVFs3rVyW5Vccfg+UVhlH/ukovYykOH3NwdtzV10G05kmogZV28h?=
 =?us-ascii?Q?w7Bn2XFB/Kg10suwvEl6Ps43x8ZAd3cTTfTuD1WznuC7ck85ZHZl+DW828Xr?=
 =?us-ascii?Q?XijkcuGVq7qiAnEZwFShwG8RZqwohZ++RB5PCVzpLTnMHH1ldEl8DLWqKh3/?=
 =?us-ascii?Q?rSwA01taU4p+rRXsSpW6VWSdpBO+8f++Xb/49w/qcVnFVeGQHksck3s3xNoR?=
 =?us-ascii?Q?0JF6mAP+Tmkwj4JWu0Urajcj/BbM2Scs4hi2manewPQ0l+o+0lzzqBFTPyDE?=
 =?us-ascii?Q?Wvxh34nPuzSTVdLg/GOB0FTjU2q9R8gUVwCELxvhcS3zcMVpOT38JxZN54Kn?=
 =?us-ascii?Q?TOtn7Q9k6mlWkc0US0EujBqI8ji9U3NuJseoF2Xhr35xImDdLSDPLPMS1sEk?=
 =?us-ascii?Q?X522WBJ9yfRWqZ0+Al36aA+5HCNzM8GpoFPGjJ83HGNrNKf3rIXuaftHrOeu?=
 =?us-ascii?Q?ibWUjXF85CPVgCvNFOX3RuUkI7bLEEfG?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 07:27:24.7798
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61ec4f1a-05bc-4d00-1de0-08dcc8c531be
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E3.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB7000
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Aug 2024 07:27:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203955

From: Ola x Nilsson <olani@axis.com>

Some redundant return statements were left over from
insane: Drop oe.qa.add_message usage

Signed-off-by: Ola x Nilsson <olani@axis.com>
---
 meta/classes-global/insane.bbclass | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insan=
e.bbclass
index 32adcc722b..d7aba89b49 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -113,7 +113,6 @@ def package_qa_check_libexec(path,name, d, elf):
=20
     if 'libexec' in path.split(os.path.sep):
         oe.qa.handle_error("libexec", "%s: %s is using libexec please relo=
cate to %s" % (name, package_qa_clean_path(path, d, name), libexec), d)
-        return
=20
 QAPATHTEST[rpaths] =3D "package_qa_check_rpath"
 def package_qa_check_rpath(file,name, d, elf):
@@ -932,7 +931,6 @@ def package_qa_check_deps(pkg, pkgdest, d):
=20
 QAPKGTEST[usrmerge] =3D "package_qa_check_usrmerge"
 def package_qa_check_usrmerge(pkg, d):
-
     pkgdest =3D d.getVar('PKGDEST')
     pkg_dir =3D pkgdest + os.sep + pkg + os.sep
     merged_dirs =3D ['bin', 'sbin', 'lib'] + d.getVar('MULTILIB_VARIANTS')=
.split()
@@ -941,7 +939,6 @@ def package_qa_check_usrmerge(pkg, d):
             msg =3D "%s package is not obeying usrmerge distro feature. /%=
s should be relocated to /usr." % (pkg, f)
             oe.qa.handle_error("usrmerge", msg, d)
             return
-    return
=20
 QAPKGTEST[perllocalpod] =3D "package_qa_check_perllocalpod"
 def package_qa_check_perllocalpod(pkg, d):
--=20
2.39.2


