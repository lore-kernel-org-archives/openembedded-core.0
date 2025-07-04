Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C401CC83F03
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 13:03:17 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.0])
 by mx.groups.io with SMTP id smtpd.web10.11886.1751634195820168751
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jul 2025 06:03:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=r5gGtoRz;
 spf=pass (domain: ericsson.com, ip: 40.107.159.0, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mnmRgxPIRngdmGtY72bEMFo6KkpAdmRmfE6sZaQeo1X+OZweZAU3iBBAHp76y8SCEpbtGNaIngeaxYyQZ2skAGDh1qB7QkRRB15yh1VytUKKICMdIkUb9eWTeSC7HhtnSZOp2vPjF6aJDNdrZSD50T7V1lHJg00JhW65wVmSE4/ebkMOZpoXYVgprmJIhTq4fNpBYUBZjSuYoy0sEZrlg48tYRBDOm9QBrTabN5L7Blqt69V8toQ35AU+xcP0/6tZMFYiOKuWURGNmFwcHGg0bSw4h5IPYPLd61P8FNQDA/gxVvYtNbxMJEchn7IQy1jyhcRG5yff7EyT1jWcm+wFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cGKkprhAI3Rw3JKMXNJhEU5ZgPwmJ+nSQaX2MTvrsmA=;
 b=ivedSVDHD1RyMVSDJd5TLpk3k6I2xAKn5ZW31HedZLMQXBsn0ww8is0RF3SnlYjOusXkWC6C8a2msbubel9avCtcr1GcoAmilm1cqhWyyUJ3HtmYOgNBI+vDrCpmjr1bqghQ4WjH/WjjGNukc4cgTtpGCAObbUu48gSlG5x62i178uOYfm3MQzzlFR1fx6EBtBzEyDhpALhMa3qtFwCF+ng3gWfgBYqf+bvLLBcVyHK9n5SnwuVlR0PDKctjijkTOsPGiunajKrs1jBedPlaqpnCUwNG+GvVMQK/KyearLu4qC9EEh3ipm1RcOOuOmVBb+pY9m+jnz5BFgksghFgng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cGKkprhAI3Rw3JKMXNJhEU5ZgPwmJ+nSQaX2MTvrsmA=;
 b=r5gGtoRzUKxXkQ2+2e+Qi2aBJenaQEvDApdLXNr3GkME4Rrp/Tk6idZCz16Ko47URh6PnlWsTE0hpmag2Sb0P/+qcUogk+8CFbPFtoaCkLW5GRsr2BIPxJ4SnB0i7/8DIOZbpFDfrDGHEwFBU8YAS1eh/tHBBHsoTbhsIO6g3t5QewrCrP8hgMFT13S/KComiVCOyp+wGlZsmWnKbpIvVUK9EuqsAx8ws0fCJULtZwCkbkZ8TqgGzp4KWPhnRea3la0U4FhM8048W0HX1AFLTZJjRk2VvWLLgijgTnHCrPRdaE1Hu9zb21uJh6nkXZQSXEHMdmhe4rNeSSlPjK+3MQ==
Received: from AM0PR02CA0076.eurprd02.prod.outlook.com (2603:10a6:208:154::17)
 by AS8PR07MB7462.eurprd07.prod.outlook.com (2603:10a6:20b:2ab::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.25; Fri, 4 Jul
 2025 13:03:12 +0000
Received: from AMS0EPF000001A3.eurprd05.prod.outlook.com
 (2603:10a6:208:154:cafe::74) by AM0PR02CA0076.outlook.office365.com
 (2603:10a6:208:154::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.23 via Frontend Transport; Fri,
 4 Jul 2025 13:03:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AMS0EPF000001A3.mail.protection.outlook.com (10.167.16.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Fri, 4 Jul 2025 13:03:11 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.62) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 4 Jul 2025 15:03:04 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id 7B3DC4020AB9;
	Fri,  4 Jul 2025 15:03:04 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 673D2705E341; Fri,  4 Jul 2025 15:03:04 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH 1/2] improve_kernel_cve_report: do not override backported-patch
Date: Fri, 4 Jul 2025 15:02:54 +0200
Message-ID: <20250704130255.1157673-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A3:EE_|AS8PR07MB7462:EE_
X-MS-Office365-Filtering-Correlation-Id: b97172c2-3971-470e-d026-08ddbafb2126
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?oTuAoFXd7L7qNKN732e17ELFbTWHPeW/Acc5oro3x1jburkxs7pQGZ53KCn3?=
 =?us-ascii?Q?NMRzPZAWp4rV9UGOSTpyU+z/KNUao0vAEHMisJTPsGe1NO28azrI1MCH9X4m?=
 =?us-ascii?Q?GPD1xhAMMTgauNuNOVQJQX13jGoRST/IQYjqxvtC0y0kfM6ieZtvqe3eHUV/?=
 =?us-ascii?Q?WeDrc64pH9+nxyDfDQ2WSivKEnEZUpiA2t2RkLDn/83A9VkV5LStzNVoO0YC?=
 =?us-ascii?Q?pA5P10g+ZGSdYEiyltrHJgHM8x0Nq+ienC5PTa8hI1iA/Z2niMcVIvaKq0+G?=
 =?us-ascii?Q?VV8m/c+zQFB8TQGKmGZTm2tfHb4MoOzBQxNLhYdrby0hs7/FMzF0lxjkIHjp?=
 =?us-ascii?Q?2Sa0+aOdpER4OhawGp4EHmJPDgGoPFiZftNxbUPKPoRtnFT4jpNzX0ViLJJF?=
 =?us-ascii?Q?7byKV0qhVTy5clCBe2VhB5WUpGsjpzS99/nqMfTPLNcjYiDzdDc5N5N1xVom?=
 =?us-ascii?Q?X6AkezH36MxtAoOy1xMiTxj9z6BdobKGb30hNU07/Eegx/k5ohAHG0Iy3KVV?=
 =?us-ascii?Q?bsXJMYBmisNwQ8KXZ2kEwvFcLglj7veEY1tkXQs9N7u6Fb+Jfc74IKw2zEO3?=
 =?us-ascii?Q?6QchkBvMpp2l8hF0JG4bGOpTIPvL/wm48/SOaKqZGR1N/kIr7oGDRkl1tY94?=
 =?us-ascii?Q?vfRn5oSZNEEtKAaqQD4nYZ86frtl2QI18pkNfUSoiv5dJX8zE7GgIFHWbRAn?=
 =?us-ascii?Q?Z30mh0fj+yxCLSCCCCSYgmwkMw0T6fPvrhVNEI93gTTwKE+EwQCxhl9Xf/+Y?=
 =?us-ascii?Q?XsdZ+3mudBeV7awBhtbVtUPLpFpGXrIgx5flocm7RnAHAMxa7sh2yBjMLcJN?=
 =?us-ascii?Q?P++/GPjQeS6Rddxepph4GrUuirH7H9rL5WbNtY4qd1plJ9veybMNF4WO30M3?=
 =?us-ascii?Q?rS+M2sppzppvyA2B/HlHB9urTboY8Mw4ky+6e/aj5JBJsP9VDeUBpRx4twAM?=
 =?us-ascii?Q?IV7+HCdzRoc0CWFsc3CIFKTNUwc9wfRoRtTlRPz5X3swspDI0bI3Sr16JH6n?=
 =?us-ascii?Q?yt7blY9S4XUKikUM2lhXVamgXOkzeHCYE4c59S3GuwGB0JyQ9E/JAAnRciBx?=
 =?us-ascii?Q?H3Nh4IMEYuqnKirNjwoT3MbppjAhqygrjgJWTQJnDG77rDzXTGSHEZ3y9eJk?=
 =?us-ascii?Q?rhOKHM2EWt9aNEdHaWeUq7ItzKAhCkCpJ2ey6/RptpcrjyxzwepT/JV2s5K0?=
 =?us-ascii?Q?nhN13cWX7mt9KHRCZt5xSjg0kRnjHssAWiJ3Umw/13hj9y8UlKW6FgrCS6ST?=
 =?us-ascii?Q?Vc3ruELFMRqhUez9BBjb7hUwJvAsZQgtgjkIwSQNygOARoPlQVWn0UDHq9PM?=
 =?us-ascii?Q?gW1aJHFArSi6Hgqv9E28mSs31vpHlBO3G+Xs18wfBkdEier+yv0kiqyqP42g?=
 =?us-ascii?Q?svI3JqBS3z6JHXZEKFaCRoz021WwU6ZXsIc4vTgy4sF9+Bls4KTNN6kf3nCA?=
 =?us-ascii?Q?yRscSuLeh+V1yHM2rt3mjHM2wY5E1mWYopdiJmf4WeVIUm8uBb4MLJup3opK?=
 =?us-ascii?Q?hfQ6hBFz0J+ofafiRshlX4hhp++uXKPWrc/W?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 13:03:11.1656
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b97172c2-3971-470e-d026-08ddbafb2126
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A3.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB7462
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 13:03:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219920

From: Daniel Turull <daniel.turull@ericsson.com>

If the user has a CVE_STATUS for their own backported patch,
the backport takes priority over upstream vulnerable versions.

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 scripts/contrib/improve_kernel_cve_report.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/contrib/improve_kernel_cve_report.py b/scripts/contrib=
/improve_kernel_cve_report.py
index 829cc4cd30..a81aa0ff94 100755
--- a/scripts/contrib/improve_kernel_cve_report.py
+++ b/scripts/contrib/improve_kernel_cve_report.py
@@ -340,6 +340,10 @@ def cve_update(cve_data, cve, entry):
     if cve_data[cve]['status'] =3D=3D entry['status']:
         return
     if entry['status'] =3D=3D "Unpatched" and cve_data[cve]['status'] =3D=
=3D "Patched":
+        # Backported-patch (e.g. vendor kernel repo with cherry-picked CVE=
 patch)
+        # has priority over unpatch from CNA
+        if cve_data[cve]['detail'] =3D=3D "backported-patch":
+            return
         logging.warning("CVE entry %s update from Patched to Unpatched fro=
m the scan result", cve)
         cve_data[cve] =3D copy_data(cve_data[cve], entry)
         return

