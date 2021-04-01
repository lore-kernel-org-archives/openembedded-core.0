Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.58])
 by mx.groups.io with SMTP id smtpd.web12.3570.1617296517633191377
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Apr 2021 10:01:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=HKztdqmo;
 spf=pass (domain: windriver.com, ip: 40.107.75.58, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NxwZjMkFGA1e03+vq7lLtSW53sSIezSGM8YFHwdc+BFBCewTPh9rPIt2ZequC2119n6P87mwKYoQRjQssJLaBaWjMqoYB17S8vSvVb2d+E0hs0uX4CvqBhnK33cHeVsy/9p0JS7t1Nj414lcq/qeOuFQh6pPqnP3pRHv/9JWRH6VF7NkHDL1tHK1Chzyn/PCp78GwEDlExGY+WPQG14LQZjEoE8q6L/ed8Sct89+6I7XdXT4jQZU5+ytndwjV7VEcKg8JGimO7YgYng1JNPX8CUyI6V896NSRFKyBHgPr38nfgjP/9/Y7mSB6Bn8geB1DQ0SBCvuKb4hqs43pFKjwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QD+jhmtI8xmobeucjrHwFYQzQIVpESHNQFPEgUb8o/g=;
 b=azRsRjdCMxHVNl3+kSO0RN2QKMxxx/vikrardNqUynYAZAh7RBiwvjFFAMMwPC2x4Gl2Rs/YYb5yYS3sm+BqUukyYmPkBdZs1xR3DeOTcAiCxEON11/a9IaNtsDzt1KX6jVEr01eFu/k9nr/ah2aZsYIlNEV/gS9dDRbc72rqBxAUHFS7judQeCvM7t/epPEGSzyalXQxukO3slb2P3s3kbpiLlXVnLJqp54YixkUXZXx+zghwn5fGkH4r8UprFJWvK22g9WIWuYzwZoo3sgSXG8vCHZs1YRdoXkTD0aSMv7Ucx2RiHwZskGOdDhgkVwgtXrv1rYCcO7KZB2zL9eoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QD+jhmtI8xmobeucjrHwFYQzQIVpESHNQFPEgUb8o/g=;
 b=HKztdqmo/ihmYFuYWKQNSMYscDqNUl5SWA3faHP+2BwW89a5uG+ejlstI6tuFzc06DhJP0VEtBrTaC4IOBo+U3nxDGDGNxIGcTbRzefdkUhoWXwV5U30bZ13SpjOLI2DmVhbf7COtiI/FD+jNkJWDjASFLeRZn60O6Wf21vM2v4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SA2PR11MB5146.namprd11.prod.outlook.com (2603:10b6:806:116::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Thu, 1 Apr
 2021 17:01:55 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f%9]) with mapi id 15.20.3977.033; Thu, 1 Apr 2021
 17:01:55 +0000
From: "Yi Fan Yu" <yifan.yu@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] valgrind: print failed ptest details
Date: Thu,  1 Apr 2021 13:01:41 -0400
Message-ID: <20210401170141.16479-1-yifan.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: YT1PR01CA0075.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::14) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-lpggp3.wrs.com (128.224.252.2) by YT1PR01CA0075.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.32 via Frontend Transport; Thu, 1 Apr 2021 17:01:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91308c5e-d205-459f-af29-08d8f52fda94
X-MS-TrafficTypeDiagnostic: SA2PR11MB5146:
X-Microsoft-Antispam-PRVS: 
	<SA2PR11MB51469B259A3D7272BF9B6647807B9@SA2PR11MB5146.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ig1HFn5yMgOTXx5QGIbQBWY0zgpSq8vl9PWKUWIIw055bfmAPWk9BBIRL6L8noYg5TkHkMWswuZHgTZDE0IOAXJuzS4Lp4+1GNWKOZU7nT2ZHeq8h6esobuQld/27MhG6T3UIT8eP1BFEAjdlsEWR6NvkGc4LJm84nxqW1efBYsYNY1FAHToP+QM4Yv51o/SmPMrszyn27czKpHE1rilApkowFAV9FYeVpR3uIdp2jIgsEA+nO4ZulN14amevcUJVaiVAApbLOBWGtEfIkGOgI3rdAFmfWjZvtS7iZ430qhVDFITxUpiyHm4FwcPMCG99B5Wi/iAIWaw+eVmQREqZFapDZW/0fTAdtolYTDyVkLlTxEP2FnTCDdsLssSj6f4xppyDcfQVLhLKdYP4lb7W8DSqbDV//CyuizP1F8auXGNbR8gfVaqqK1KdTrfdye0mBSuruGl8BPCvCAitC2TgMZq47lNTaV4PPehzgpvqlNLe2SxWDxoXDRdP5Wcj95q1iUVdSVlzBA/WZ3cQ+gT0YjSN0BOvUIJS5+FWGaDhuiRC0wA/DVkdbC2n8o7sSur6maQkiYHkilsF7vUvhwCkK1B2WlHsvebZCbJTGMHdAmj8mX71NH1BblFfRKoACTAu3lTXqSlixCrKMJ73hy0Jw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(366004)(39850400004)(346002)(36756003)(8676002)(6486002)(86362001)(8936002)(83380400001)(316002)(186003)(6916009)(16526019)(2616005)(956004)(26005)(6506007)(1076003)(478600001)(66946007)(38100700001)(2906002)(66556008)(66476007)(5660300002)(6666004)(6512007)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?A4uFaIx5aFtlu2w5b6R1T/8vuEcjUJKk8fOfv8pDcqFBR0SFYrW0K/h24krE?=
 =?us-ascii?Q?XgXPk03F7yokUlkVc21MYj4TbsXwmOaA6fu3gW6XMmwrlRMf7kibM9GzwOHi?=
 =?us-ascii?Q?GGWI5jcsSYpZauAGPm70kRNormh6aII3w2kq3++KmiPPIG0AQmS/WrXrYOGI?=
 =?us-ascii?Q?/2IJuLG9sJN7eT9s9rCMXOKbF8lNcOwCRHvZUeySAHrQx8O92VJah+Sgreuw?=
 =?us-ascii?Q?05IwSuZKav6xHUWs8BHphoCoXKC725TQ7aMvJpSFusSFmKV4S4tXRVf8popU?=
 =?us-ascii?Q?GN8qk5J+Np/xbYFEdD2q4Rh11q2juBoedKP+00IYzQvDFJ7/B4pz6VSwiOb2?=
 =?us-ascii?Q?Jkr8kznq0Kdzd+hAdAaiFOvX2+6ZkyCGHTHFxpmyI2/6hWWM138KnoDPzXv3?=
 =?us-ascii?Q?oi04BO6fzWMpcjQ7E7x8/e3kexMU0qz4O1RAimvaQz6MurQ6+bZAvnWbHhsO?=
 =?us-ascii?Q?4KF6hwW/4IVJcqpImFkmH0np1lYL+MZqsflXEOTa3e3Sf7olodin4A3ey15w?=
 =?us-ascii?Q?IN3h8m+/a8e1j9RZybehM3rBm+LJRDCfL+fHcXDidVcTfJ4nc5WvyUrruV+r?=
 =?us-ascii?Q?bsKqFohGu+WNM234SW15aggEHa9iDfs2VSOl0iQBrw7onuZK0fApjl/9CE9b?=
 =?us-ascii?Q?oSKXbxeVDlA+8Pm7maDEgU3gd6D4DumfaGAEYYNn6TeSi+mOHtvPNT/6oBkX?=
 =?us-ascii?Q?15FHJHbGD20jtdxYUJBa7cZuVcVmFIIALiBroP0qG2iuOw8XlmZihqHgOxoE?=
 =?us-ascii?Q?GyToWje0DKB6NvMeeOxnm4Dtt3n5sH90/FLwElCramAxvOjKl4aix5IMSJpW?=
 =?us-ascii?Q?Xzr1cqO55ebDbJvCUIJ/098hNjwYwoaAowatbpsPvQXzO0MQW6BwdxMe0mwZ?=
 =?us-ascii?Q?yN6qVmuZSyuuzSvPs9uoKRPdNGopMEZL6l9AVPGrSEg26R2CgIsoqSpQSvYV?=
 =?us-ascii?Q?cF96V3S8lpHAW+pRcpU/XWfuj5nhAf6E6iPnFQZ0/oPf8njio6D0VREF4XXW?=
 =?us-ascii?Q?4BeMXndy8AgLFHNjSQmMVMJnBE4ufkhCTVYyWJ230Sw4RdKXayf/XsZ398Fs?=
 =?us-ascii?Q?WBe0YJcSEynfaoSd75PI1vFh4TG8idqb4YWXFsHn9UsOi09NLbNWSeVO72Sk?=
 =?us-ascii?Q?FHQw7PNDMMBeJzrZfejt4Nii/zeYmObDyEfWi5dZX8xpEl1/rukitxgpOl9p?=
 =?us-ascii?Q?ENNg67EAlHgmjKvPDEr2w2Pk21UokB/59kWwCAOPqS9EhEYo5cnu8gmzuxJR?=
 =?us-ascii?Q?cxkxs1z0FYMkD9wFka4RueuNn1fMQtQNNwLZg+ugGwXofTWA3CtJVe3OYdm7?=
 =?us-ascii?Q?RYfjFAC2lI6MI7sHr6R5/Wi+?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91308c5e-d205-459f-af29-08d8f52fda94
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 17:01:55.4132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YYo4J3yvRRLo9QbnNUK+1j1eAN6f8pikjf2Yp1oxtKieLyGXu/IImEi1hCGNqYJKY6ag8Dbu+iNiwB3le+rngw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5146
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Some intermittent failures in valgrind are hard
reproduce.

Printing the difference between actual and expected
will make understanding them slightly easier.

[YOCTO #14294]

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
---
 meta/recipes-devtools/valgrind/valgrind/run-ptest | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-devtools/valgrind/valgrind/run-ptest b/meta/recip=
es-devtools/valgrind/valgrind/run-ptest
index 3e0205fe6e..60d243276b 100755
--- a/meta/recipes-devtools/valgrind/valgrind/run-ptest
+++ b/meta/recipes-devtools/valgrind/valgrind/run-ptest
@@ -56,6 +56,16 @@ for i in `cat remove-for-all`; do
    mv $i.IGNORE $i.vgtest;
 done
=20
+echo "Failed test details..."
+failed_tests=3D`grep FAIL: ${LOG} | awk '{print $2}'`
+for test in $failed_tests; do
+    for diff_results in `ls $test*.diff`; do
+        echo $diff_results
+        echo '************'
+        cat  $diff_results
+    done
+done
+
 passed=3D`grep PASS: ${LOG}|wc -l`
 failed=3D`grep FAIL: ${LOG}|wc -l`
 skipped=3D`grep SKIP: ${LOG}|wc -l`
--=20
2.29.2

