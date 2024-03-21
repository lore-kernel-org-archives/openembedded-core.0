Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6429C54E58
	for <webhook@archiver.kernel.org>; Thu, 21 Mar 2024 05:27:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.318.1710998850396600804
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Mar 2024 22:27:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3810a8932b=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42L4o1fN028274
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Mar 2024 05:27:29 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ww2d6mqyn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Mar 2024 05:27:29 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dLAY0omtqB4FnTvOeirlauoQQ7DqVDIjFtUUWVSA1P6EAqdrky2e4UKOGqQ5j4c0dkTDFyIoyHo/NsoiB1betjczCp03vkYYmn+Yp4CEHkUWtdJahA/JGUscVorbMbCelc1Iy4l67gBdrIqhoRl6JO5QOXw2yNwAONniXHL7PWUUMjFZkA9G8hlmu9cQjqpiWMSCIq1ub0A9eArJhSMDucK/NXtKEwlMSLSRk148ntJnSz4v7FIdBm0//B1Ys+sZMwziwIFRjTmwyZz42RCxGBSZquEMARpj3me68jQ5j35aVQ0Vsi8p+jvHKpqeRLf8SNlWKWrihabCW0UH42iPsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B4+C7k9Eq540Dk5H3CdSg0GYS5ygfK3bMrwLC5aYl8U=;
 b=AB7BI7SXWh8LKTZjnonm+QNvaJa2RExGFQt2YaeIapaiGzgJC92saW4p9r/AGvUu1TIz22NHuD6Nvu7p+TjLFcF5DmzJRYslUb/yohT26j2P/nD+1EUkRSUphD3Og2mqEJktWRzC9L53hr+04sATyx+2tFdpecWid5DNcUxWxlNvxz3r88WFymkRi9gQN56kSXAjDrqPi+dUXWmch1bo3Lb2OULCGn42M9yB/uqIcihSQTH08n00ygZdLrY9jJzzJbiepTFuAw/iTgKISI65BXI6b1+meSjF57Wbm1j4DDg3vvVzm55dEKPCG5YKFIoML7Mx7bZrXZbUH1eIFTXqIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by IA0PR11MB7258.namprd11.prod.outlook.com (2603:10b6:208:43d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.12; Thu, 21 Mar
 2024 05:27:25 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::5dcc:ddee:208a:33b5]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::5dcc:ddee:208a:33b5%4]) with mapi id 15.20.7409.010; Thu, 21 Mar 2024
 05:27:24 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] ltp: fix missing connectors tests in scenario_groups/default
Date: Thu, 21 Mar 2024 14:07:02 +0800
Message-Id: <20240321060702.578484-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0009.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::18) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|IA0PR11MB7258:EE_
X-MS-Office365-Filtering-Correlation-Id: 43b4fa2b-c20f-4215-ecfc-08dc496796fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xvhEMb14B/nw3iG8Wb14FU4Ocwd5eYM/YgLq7VmQhQDew1JRJMXCUy3XuA2eCGOAnhEztF9sDQxpDkB4kGLooTyj4Obr2ESoDzofnf3eTZCHwGb7DL06opid7TgEizaL7e208nWxB7qfMUlFnC52jDvmyzF63J77K7+xfV2upXy9aMESUb9O85DPfg56THKkVuN62i1TdNtecsZgmZjFqz3OQh2F39lueWOuqV92dUjw49jps8aDmvNOMLQnKf7vMz0lYE3hIqvnCt8w4oIv1rsMe6erY5amplmO6bCugUVTQ8DwJChVqCkrHcetIUCz224jYkr4ZKDoAVyM8+65mpCn41yFdpRLSKxXrCg2tTLPoIUqtdEU1EJMFRSLVULxaFkXolctqATHvNa+2IgGatJ6RYuzQcRAXUydkW4uTTCeJO7U7kljt0PUhBbvOmczhpIGHHR8Qf/XKkYbAWXSKehyLlbsqwcVsyk5+8JpNZySHT3Vj641uZ02O7RLMs2BCLmugk2VIuVChtKAmCzyV0kh9TsNfEk3H0/jZsObQg2rrwot/p+C+jV0pNVJURpPH6/jHJGIkkK1JZUkxwmVQzsd41AiDjYHeBp+wzbiAz/+sCBrW68gBSwPLEBRm1YvjyXmjblXbf8qpBBC4BL4AJukfOGaOd0ML3T8COn3dBs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(52116005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vBpqxsUGvy5/bGyEHgXWltfPIVahp+u6Tmat4uwnVVvi+zHeZvg3RORYgh0t?=
 =?us-ascii?Q?8z1ZNbuLjJEE/4g3aRCjpaPFS1O/AJ41XnoGv20JvBGXzfS2Rf8SD/VdrW/S?=
 =?us-ascii?Q?rAfeOdEGgNbAOaTEwizwNGACSJ+lxf/yu7xfrBmrrbWG9zH83WLf5PHZ8k01?=
 =?us-ascii?Q?5d+G6xBb4qONaGdrStgeehGS6wNTuKN/Vn5+l12mDEF28y3QRx59FMiI0Oug?=
 =?us-ascii?Q?iJMAfnY4d4Gf7SzcvDP4uI+NRrlQ8bX0pIx0Q3qLEZJrpcrsv5QUjjOqEm7u?=
 =?us-ascii?Q?vYVBiqPUXXxsDRt59CmGwk0lB/YKKsMU1MLqocqTYgq0+59Rdys09/vtIl3S?=
 =?us-ascii?Q?HOw089SwgBf6ipwJJgD2XcnrJb6HcvFf4haSjtmh/NrPwDPUFx2y8TZIiNLs?=
 =?us-ascii?Q?hHTJejJ/V9UwBSNbgGErp8kWq81KwXFAPTNN7mvqurfuvBI5bSmH4OVB0D59?=
 =?us-ascii?Q?rSwWZxewi8Udyd1D7vj2O+kLujOamLNZBz7haBriDGo6oNfd1a7922HFsgei?=
 =?us-ascii?Q?aeS5ENHmh5jXSUPZYx/sGVFaanREZrmqcPvbhx9fD/131lmLQDGrT9bHXBLc?=
 =?us-ascii?Q?hn9Obhh6GPNN8/7Cd8eJfDYcVVbGjOBWjXkqSQ8ui5muljFLztCg0xOty9qf?=
 =?us-ascii?Q?XsIbBANWF7FeYhyQ6xPRZdRYTB1mgi/ezrXrPejSnIJrGcrNFC+yG7eaj702?=
 =?us-ascii?Q?9wOaD/ZeHp0NB4WD/bsCQ3jM4tycgVy47r5l+0TSXVheWINw1/ZZBFl9AKBQ?=
 =?us-ascii?Q?6zk5mTnLDTUBGUECcrHshwTma/pyXH/4LrAD684k+1TJ14qIReybI/VazU83?=
 =?us-ascii?Q?a+wlB1MZ7Ag837NOn761xFWPgGHjfES0/eUEqLXPq3Zj1J7tWjdRp0gM1RDx?=
 =?us-ascii?Q?6ybKge63PBDngOA+LhNArQ/w2zlsAog19Ge5GNK471Zax2Rbe5lk6PGbEXil?=
 =?us-ascii?Q?5yaoTIk7NdQJkddQ/Y1rbO2ZomlbD8tHSwXd3VS0YPuAnACIVNhbvJsPN6HE?=
 =?us-ascii?Q?F7p1oPd6tD732IiY/RtPlqZ7NNYX5xyiLQgtPY1kYW3mUXJmGD8l7hVEyyCV?=
 =?us-ascii?Q?+J/ZybLCOFrrbxORLYj70ZPwFegK7lISaRg2S9fIqyo5sTRgxTcAhIzUxOkw?=
 =?us-ascii?Q?NHnY4SClZBO+X+1PmGEi3chL5DOy7D3EL2CXzCZTmDDJiele1hckalvFBXjx?=
 =?us-ascii?Q?zTmcGa/KqKnZdOZy4Jj7tUa434AqlDT2Sm74j8RhvfK+FRG7aVcS4N++fKa3?=
 =?us-ascii?Q?IOtFVQIlsKhk143i4tl2ju+n+czEP4BgYfS4ZCoe5EO7baYFYLStn2iwGmsF?=
 =?us-ascii?Q?DzMSIqEch9ozj3+X/L38WdS7oXmFVUTDyFz1lSiAlI/zANFE9D7LvKQQMiGg?=
 =?us-ascii?Q?PQosLFa4FC3LrRt2huOHy/D5M2gtg58tN5WNJtfhUIK7rV7C85jSqXFWyVdI?=
 =?us-ascii?Q?t8jGJIweAzj77J0tmsCGNNIEcodxy18q4Xt5dyIOiIRGey2YaZI6twUsuthR?=
 =?us-ascii?Q?/sZ/UiJM77IP9QUui3tBUPZtxKBjxm+ruhwxzE1ISVJdtWVcdY4dIlGrDgWG?=
 =?us-ascii?Q?xRaB5Z9l1iQW/FOM20y7UthBUeWh4vw316qHaUBx9b5rqtFOmLnugDcUmh5a?=
 =?us-ascii?Q?fA=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43b4fa2b-c20f-4215-ecfc-08dc496796fb
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 05:27:24.5485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sRHwyQ8qbaIyxYzN+v6J3iMBod2Kbe2NiMhpCPfF4Kqi4HXsUayeBgiuG6G6JMvOJpoz0LvTTGoCWiy4+yvl2IHUXGEw6VHjv7C0gSjPdnQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7258
X-Proofpoint-GUID: xwze8dkuK_B9nB3QYhNV4rkq-Mk1k8QC
X-Proofpoint-ORIG-GUID: xwze8dkuK_B9nB3QYhNV4rkq-Mk1k8QC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-21_02,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 clxscore=1015 mlxlogscore=999
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403210034
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Mar 2024 05:27:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197407

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Upstream moved the connectors tests to kernel_misc group but didn't
update the group index, this cause test kernel by group report error.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 ...rio_groups-default-remove-connectors.patch | 34 +++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20240129.bb     |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-scenario_groups-default-remove-connectors.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-scenario_groups-default-remove-connectors.patch b/meta/recipes-extended/ltp/ltp/0001-scenario_groups-default-remove-connectors.patch
new file mode 100644
index 0000000000..4a50d1ae38
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-scenario_groups-default-remove-connectors.patch
@@ -0,0 +1,34 @@
+From 14c710cae38aa96bd8d681e891b6a1d691f99988 Mon Sep 17 00:00:00 2001
+From: Xiangyu Chen <xiangyu.chen@windriver.com>
+Date: Thu, 14 Mar 2024 09:47:10 +0800
+Subject: [PATCH] scenario_groups/default: remove connectors
+
+runtest/connectors was removed in 9b642d89c, thus update scenario_groups/default.
+
+Fixes: 9b642d89c ("runtest: Merge runtest/connectors to kernel_misc")
+Closes: https://github.com/linux-test-project/ltp/pull/1144
+
+Upstream-Status: Backport from
+[https://github.com/linux-test-project/ltp/commit/14c710ca]
+
+Reviewed-by: Petr Vorel <pvorel@suse.cz>
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ scenario_groups/default | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/scenario_groups/default b/scenario_groups/default
+index f17b2061a..ec77d8fb8 100644
+--- a/scenario_groups/default
++++ b/scenario_groups/default
+@@ -16,7 +16,6 @@ controllers
+ filecaps
+ cap_bounds
+ fcntl-locktests
+-connectors
+ power_management_tests
+ hugetlb
+ commands
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/ltp/ltp_20240129.bb b/meta/recipes-extended/ltp/ltp_20240129.bb
index acd857f4a9..3e896957d1 100644
--- a/meta/recipes-extended/ltp/ltp_20240129.bb
+++ b/meta/recipes-extended/ltp/ltp_20240129.bb
@@ -28,6 +28,7 @@ SRCREV = "68737d20556d37364c95776044b1119c0912a36a"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
+           file://0001-scenario_groups-default-remove-connectors.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.25.1


