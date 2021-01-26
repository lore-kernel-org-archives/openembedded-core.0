Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.68])
 by mx.groups.io with SMTP id smtpd.web08.527.1611698301026997311
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 13:58:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=LOeb4/zT;
 spf=pass (domain: windriver.com, ip: 40.107.102.68, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b0tBQN98yglwVCBU2CRRAoV+4dsLdeVrgtAvlWRjoz4esZMFlmDkLnEjYCTwDgZLBXUIcqI2fOTSp9JUaBv2k5id+xMqR3LoCsmtx8Tb+p3eeYcRz6hUIlzmiNqGW+4aH3y/r8nyfFTmdGaP9ojZi8pGYem836Mzg3Qdfqd/Dam5QFkQGbRNbXQd8zpRI5BAptZyf7BC/YUdEObNrPz1zOru/2Tf/SIRbA6GBoBk01Pi//kfoeys+6FIAPy7dBspkImrN/bH2y/LfyVK8ZrIPRWRV3cEGIygXLxT0uSnZMwhmmHisxtfnWHKeg5In/9iRoFmeUSANPbRkHNhIc/GVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8AeXu04q8Fl5Kqf7LD5Gso4rnqa7cl1+xjEeeesD5o=;
 b=WR0b+GNFKXf8fH0Ziyli+k9Kb9IZ6S3UKd9XJzbmlJWq0yEQMEesVB6L5mSSoRVHUsYiBgYP4Sne+v4LEgrSWX4cUK0f75f3ghJ8RVn0gUzawisj9SHGgVcQV6HUlh9BLWOKcIloraXDwzqnJVUVsyGQ5IwXWBCH1ng3MOux/G2IMYkPkx52XQU8ovoamVWfobo86rdZFjJPMvlD5zvma7n8VlgmVm5wfx3tnn+v0ZgKR+AzCVy7ZhJHzfR449RRoapBjsD79xn29b/9VlNrWxyU71H68EI+mG9p5xxErZQ5/MIP5I0QAZjvPyxWs/CWXjSTemD1l1rbu4T0yzyO6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8AeXu04q8Fl5Kqf7LD5Gso4rnqa7cl1+xjEeeesD5o=;
 b=LOeb4/zT/DvZ2obLulBhQ6jH/la6TXfEqoycUKugLAsvhngrQWMN1t9manqfoB6zPB6dQT79EoBeupPVaKdmdpwKU7pB/zgA37Opjqa0SiEKMIPsGZ4iAyJC2sPW572W9Hk9SDwb5jJ8IaWlHsq6Mon8F15/i1BAZjVvttGko/8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SN6PR11MB2720.namprd11.prod.outlook.com (2603:10b6:805:56::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.16; Tue, 26 Jan
 2021 21:58:19 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::1c2f:159e:f6f6:36f3]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::1c2f:159e:f6f6:36f3%9]) with mapi id 15.20.3763.014; Tue, 26 Jan 2021
 21:58:19 +0000
From: "Yi Fan Yu" <yifan.yu@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] strace: increase ptest timeout duration 120->240s
Date: Tue, 26 Jan 2021 16:58:03 -0500
Message-ID: <20210126215803.20937-1-yifan.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: YT1PR01CA0046.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::15) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-lpggp3.wrs.com (128.224.252.2) by YT1PR01CA0046.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend Transport; Tue, 26 Jan 2021 21:58:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8541ccb2-61f8-4a68-3280-08d8c2457d8e
X-MS-TrafficTypeDiagnostic: SN6PR11MB2720:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB2720938B103B528BBEED93D780BC9@SN6PR11MB2720.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:361;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YelfXHBUAmbgEpdOJ2SJp8poNVbpVxRMJyfWcaAGDGRftVY9rBazZFDOFhgHn4nkz9SVpPvlPamdRLQf8IIXOTV4zGoHOEmCPQMZP8ZCQQHqX3IJQgodhTBFvyVPWY1PkARt0vngY00DL6nM5ekdrF7S01zYKC7YopORZoOB6SKz6CMAn7NSnCxI5DC/KeykxqIK7zkBvFsO9btqTqZMXbrR0g/bKKaQtq5oUGuRl0ZX7HgSh/xr4W03n6ziWfH4btwl1u1QgEMoL9np/i69OxkBHVyO3JsV+Kfn15zoMcaeMbORFwxF/2BEfoVwN8MjQ85P5LFeCcrlF5vF2mTWa28LOa5XvAcs6DGdMLJntAFyXEMD0Lpak3i3SodpHfzE/xuwCLT+e7MrUNFS57GOVVCZIzY8u3OK+7j6NFBMHRw/JVCS8HmuNl2b10NzQUq5gyekh6TZG42Jay4JHY3ckLgsiiqZbmzlwCUxfd7NNjHTUw0erO5ZZo20AbFwatVN7VgXt98zdjtxtn+xl1B39A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(39850400004)(366004)(376002)(396003)(26005)(66476007)(66556008)(186003)(16526019)(86362001)(5660300002)(83380400001)(6486002)(36756003)(8676002)(1076003)(6666004)(6506007)(4744005)(52116002)(316002)(6916009)(956004)(66946007)(8936002)(2906002)(478600001)(2616005)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?eIT5gX16z0crv55AeOlqHhQE8/hyCGGeX6MziZMBMlPdQ9JOs8AsLV/TcSDo?=
 =?us-ascii?Q?LHE9pS+R42rbo7KMB1c7Lu1Cp4txPAAVQ/qHCewOyspcno3eOxG6BAJr1M/W?=
 =?us-ascii?Q?5+qfh15n0rgFFRwmgXS/WBwdSYDbwL+eSK+YuzXe6s5JkAVGkKisrNDzU/V9?=
 =?us-ascii?Q?zjmzr/4F3WJjr4HdgUYcfG0c1WNZYv48kOq9lImiPSCES6IugaOdg67GcU40?=
 =?us-ascii?Q?pBQ7krchafQlzunfpixkhxfGFt2RfSFhi8QjWzuQbDrZCtAeCKqT4pMNqJzi?=
 =?us-ascii?Q?lRrT4hGXzv48HCwz0r9ADyII8QMb1d9uxK+zGVqjrwp7rCcDbm/t6Y5HPEOz?=
 =?us-ascii?Q?si2WAhF//Pjw+P6Y4VV9OMjFhXvHq1sYPP2wDhE41okHPFCCeJ4bY4xdL87r?=
 =?us-ascii?Q?s2puyGNDqlXjFT3+7ELsrPttnOEUxhGbw5Wo5UG9lpdrfUQ1JG2AfXPYvDIU?=
 =?us-ascii?Q?IZ6I7i9F1KqVpYvBoIcwhM3Ye/zvB2ns2nK0mC0V2fabYCgQGTIIEfSYO4Yq?=
 =?us-ascii?Q?XOjSVLLL+46tZCJS2YJzQUl8BraRJ8JHrj07u6XEp1Di6oftchrt6JMXvX19?=
 =?us-ascii?Q?ertresv05fPwFJOxhrYFlTERJQcrm4+uGlVRYVV8tRm+ATAFHgxhu3UqrtVy?=
 =?us-ascii?Q?8Xycc1d5byYhis2tTUyQGUAZIGg9jDnN1oexr7cMGVs79rqzByzLquyLXmmS?=
 =?us-ascii?Q?jqPp6dNVLI6vmwlt0huBPqUMLvcCNnkIss8hZpNVnTi0ZBgZ4xurcQMl1MYt?=
 =?us-ascii?Q?vTxCipENthK6Dw8G4Ofdws6Q/pILvaYwzp97idHdgGmmpsMTWyQXFKSi/Tu3?=
 =?us-ascii?Q?WUGpZxVyulZ3RQ9z10f7uY5ZK1AlLZryWR4f0Us0FyDzDTxY+zxr5Gk1siEp?=
 =?us-ascii?Q?KDZPA3nD/N4VzudbPUcXvvY++D2AtAjM9PGVmXh/OlwPA9MS2lEhdMMOAqiA?=
 =?us-ascii?Q?eYsCroq2e/TSucdx0+u6/sAyo+vg6leXS4n35G0Jl4hSj2B9ZYwXS+Wd3nMM?=
 =?us-ascii?Q?z4iNqNVZ3qIbQNnbhUD5J8cjYm3NOiLKgN5hW8Ydm4SEdynCPmy0UG8LORXo?=
 =?us-ascii?Q?1sVBaK26?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8541ccb2-61f8-4a68-3280-08d8c2457d8e
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 21:58:19.0596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FKcaQ3p7GHR9MA6SL5cv2rR9NiSdDEVX3LavnJKSv2mvopXBJu5oKMd8LPngTIlwvd4Fr9V0LWpGk6PtKpNjDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2720
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

solve qual_fault-syscall.test and qual_fault.test
failing due to timeout.

Bug 14165

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
---
 meta/recipes-devtools/strace/strace/run-ptest | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/strace/strace/run-ptest b/meta/recipes-d=
evtools/strace/strace/run-ptest
index 4660207220..0d6fd0db07 100755
--- a/meta/recipes-devtools/strace/strace/run-ptest
+++ b/meta/recipes-devtools/strace/strace/run-ptest
@@ -1,5 +1,6 @@
 #!/bin/sh
-export TIMEOUT_DURATION=3D120
+
+export TIMEOUT_DURATION=3D240
 chown nobody tests
 chown nobody tests/*
 chown nobody ../ptest
--=20
2.29.2

