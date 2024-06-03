Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87BF7C25B76
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 10:33:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.80135.1717410796897596837
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jun 2024 03:33:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6884730cad=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4535FSUH011273
	for <openembedded-core@lists.openembedded.org>; Mon, 3 Jun 2024 03:33:16 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2047.outbound.protection.outlook.com [104.47.55.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yg35f1ck5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 03:33:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bJ42FBqQ88HjcLYNBD7DOydElEh8ZwSwX1LlqYSU6eUpe8T8qUHrh2yGMH5g4eJ8Av4AlnqcOEGuCp+jgzCTtiKapC5o2+wviUSAhPyy5nprovwMnXHpelI/XkwKMyk84rV188cstxw8A1xrU7HohLUcVAPPyMkWi7BvK7uun/c8RepxUjrRHyyQrol9xkvHFhFSv4T/AgZfApyrOne8Zd1vxD9Xvqlles0AwOB2sl4qPNVOxOmHzYZY5EEwWrDQFf6zPU+DwqpRAyRdG0BhhNV2dAZdhFBrtFxj+L4V5Y5TYk9HFwlhsZ618jPV7rY0tlahuJNYJnllJk5zKndBkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zckG2NGu2b2NzNhbaHnVklAlT1KorVaCVcBhywydmvQ=;
 b=HNDedwLDVH3k1b3xzunIqAZFvtnRLKwoUoJjDzorF18z0vRUxSxyccxMMifLOYt8LMALSYIRQripfSZUM0TBJEuwO9CFWsdlVQtlQtb8Y+z7hgo9gl88nygkQzvJbAZog14Em2TrePDFPxrcPX6MonbXgybxIXL7DLMbh1WmtjRzYuCOqvtswxxoIVPtKA5+Z13ofi8y/EXQ5lHn/gKvHQWzuWD31yWtkTalLD2wjIV+3DnYaE/FUyyrT6g6K47WB2TKDDAigbXkUGgO3eKv0GqSvOzRIunaprYPgvaCeteKW2Tx1Ad10FIleHDodMlMs48tmH89yO01aAyv0mnXCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by CY8PR11MB7033.namprd11.prod.outlook.com (2603:10b6:930:53::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.33; Mon, 3 Jun
 2024 10:33:13 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::4e72:f734:5886:b658]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::4e72:f734:5886:b658%7]) with mapi id 15.20.7633.021; Mon, 3 Jun 2024
 10:33:13 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] ltp: upgrade 20240129 -> 20240524
Date: Mon,  3 Jun 2024 18:33:00 +0800
Message-Id: <20240603103300.1626507-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240603103300.1626507-1-yi.zhao@windriver.com>
References: <20240603103300.1626507-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0113.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::17) To DS0PR11MB7484.namprd11.prod.outlook.com
 (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|CY8PR11MB7033:EE_
X-MS-Office365-Filtering-Correlation-Id: 94f414c7-8714-4ddd-5cfd-08dc83b8926e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|366007|1800799015|52116005|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?WPCEXOkvSTjmRHUEVJU/55wJcKixbnRVo4n1J6mDsCndBz3d8ffL8Zmg3234?=
 =?us-ascii?Q?myz5JMEro9RCWpRWoc7LGCoDi89cV+KrPvs4NTTNujHgJIMOufsa8/+EP6ar?=
 =?us-ascii?Q?9lznTLzg5Xs5280Nj+MCFkSfUrwtpy6t6I2ukSI2akhTL+iGFZ3OgkKE2N/w?=
 =?us-ascii?Q?sIKRjuJpPeUrjm2EZxA1glZXrDsQkyz4a8DH9ykgtWcPiBzCYmwbXhdJQ0z4?=
 =?us-ascii?Q?9DQ7fWnzPgQf2+UgfzJhGqhDQGsrRANMq8sgtgUpFVcikftUSCpDaBXahA7r?=
 =?us-ascii?Q?aDHG5s1PV7965L+iV+BVGTFk8lMK0BoS+Hd7cagJ33BoeZ2x6E00JNJ9TCSn?=
 =?us-ascii?Q?ug/icPxqyz+fFxaJBXAF1p1xj2DpKeH/3zyye7DGdpqMNyIkOPOWy41vjxl8?=
 =?us-ascii?Q?Z3XZIYAOW2GDd0erI0/qliUvDmYz4xrTWGgjuahG2167yjQdpJN5420gF6Fh?=
 =?us-ascii?Q?GDHYrd2ecuNJnJBLYJbLdVzffxNd0fjMny411pklCAUS8IydhrUUld/Dx/Po?=
 =?us-ascii?Q?fWyU9HKWIyw77VzvhSZWHua3v0exAF1p2xqIs6cyYlvx+xVnobZa/zAbsBkJ?=
 =?us-ascii?Q?HiLM1y61g7INeRpwQVQkZDbMX6AG5xH6RYBw2QLvbr0I1BG9JXsZgs7Zo0aJ?=
 =?us-ascii?Q?7KZT3tgZ6WcwIrE+x2WnAqsf6yeto4A6m5Ku97rzrEeBIvGVEH/CDOxAqPnY?=
 =?us-ascii?Q?/I/ChyRr+wFoTMzTOLUKSbbhIF05bX1fZnnD4etC2ZZlI4jjabEpPPOGUD+c?=
 =?us-ascii?Q?ptrU+2xIl4djA878ntXdispvWO4iBRgERyDEvYooqHAQQiohlDFchNjkdYEq?=
 =?us-ascii?Q?gQHVj+v+hmpoPIMxjqGrmAyktWLQOQjgB1q72Xj10Ves74oiB1vkcqakSlV2?=
 =?us-ascii?Q?yE/89piV0+VDb/hMCWlBAg2JSBwwLGmLc2CNgwwjVGrOxalMGdoQ+ZO+X37j?=
 =?us-ascii?Q?IAr6i39k/rSl1kogEHxQVqAUrTZpSppVNGZUirYy3N5br2tGdTYgltsi6oka?=
 =?us-ascii?Q?XnaggY5VoKG5pDPGz5tXvs9AQaGQfSFCfAObaAvUGtkzPNyqRsw2dwbE+Ty+?=
 =?us-ascii?Q?wIqGr6yfaPTigrwT6pGS4gNlf2HzUpXgy3aBHn/iT9gQVkZo158Jri2oMwPw?=
 =?us-ascii?Q?j8u+CJwMcNuXByTvySthU4/dnFzdpJChAZb7rDZsi2mjQFu3YWtFJHqOTrjQ?=
 =?us-ascii?Q?MsTMgKykCD25lGv+85ZmC4MaI0BcF+g+ORyEFrRpimXIdHmIHgi+AOtGKLJA?=
 =?us-ascii?Q?NZlRhK5qfroRvvO6tZ5pcMpGR9rDE/YXKnvJG6kQcQRW5cwKZNAeHmQ5KOg6?=
 =?us-ascii?Q?4CbnqNN5HPkYr/gz0jFCZu7cKcdzmEXVgHMyvSDupfFQgA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(52116005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?J25+gHERK6uyLZ4QKXJimcdFU5jZwWHNfHX3olV09P9j8uLxRmmMYGmmJ9NK?=
 =?us-ascii?Q?EJUnRZv0ZZ7pu2ezc6ZGFM6zY5vw8Nwkz4anuw15AMiU1vtAHhO7cPv2X8Oy?=
 =?us-ascii?Q?BfD+H7DwrpV3GTwVSY0uOAs2d3sF9K2p2ykQ94PH/DNW/1YTxkVxRKWYsyI4?=
 =?us-ascii?Q?nO5wg3On7ucj7PR8XwwynjEp82X1MbdnEI1lfEQKoQ6jWBJnHU1BhbK/CQ8i?=
 =?us-ascii?Q?x0hDCBSufeKmX1K8iOZ+J3XtkDCTLMdQ31nJ7zoxqMkP8u1/fFGsoGMzrtPx?=
 =?us-ascii?Q?QcHj3/TQtIPjB278s00KeDPMwplUTqz0SwNmwzZGycIysRzHeedOrOdla4ty?=
 =?us-ascii?Q?/nlagqUdk+f0tQw7Kpg9fzzEowJRnUE7reZd8Yb1VTPBm28nU3Z1IOEtZC4W?=
 =?us-ascii?Q?Nu10MCYAmDFBxV1X/cyrk/3Kbyx8goEvbcci0EEu3/OyvIjB4hQO8eP8Uy8P?=
 =?us-ascii?Q?pKqlTizpoYxABKAripLVcJEFwj1KuhHz1q5wULQax2+pasiXERFiMCf/cQHL?=
 =?us-ascii?Q?xQHiFT9z5M0r9EZWxI6FnNyx4eEkAk8JJxWUH0ga4Ld1elcoUtfLoDbglxSf?=
 =?us-ascii?Q?Rd89F+5ji54G2aKbCN5MAvu5ddQM2sa3JttsmqKnDuot/GkSFcaXc7k9ZHga?=
 =?us-ascii?Q?we7MMWxStAY4zUlznUcCz8tnnh/oGCuIEQtZPGZ6Rmi8KlyC+Xt3QkvWYkDm?=
 =?us-ascii?Q?JhoyhJ6+RPjpCmWErGMqjRBAP4tHnOiAldkXAAPRkMC7SHxChgTYvPJHGyyp?=
 =?us-ascii?Q?kuVDvqmrv0Rz+9WmKxP8fanWw01naK4SGDUGdKcOiT1VwHR0fdRVTO7dA5iI?=
 =?us-ascii?Q?+fcANYW/cFwc45duKRu9QNOBQVx9TJInTYDTkFLW6ok+Dr62senaSucB1IJ8?=
 =?us-ascii?Q?o6dTRMSkoZglHr+2obC5x7819YcYmOM4cVo7Xbel7IOIxNx27jAR/N79iW0u?=
 =?us-ascii?Q?CilYlqIxqYM7TozstCNZTw9MbRQXAhJ2IJElo46mX0OMreUiivbP2Jh7Np/r?=
 =?us-ascii?Q?Z2Ml2MyT9CBf1dU51R4ZBbg8VEYLoaca4iHvjO6ijR1G4SYbIJK47MPiqfqI?=
 =?us-ascii?Q?A0nJ0z7FpXp1iCwlBNY+0t5x6iSAJhlzTSQ9F0Nd8GqZYUSOs/DB2IV1Mbpb?=
 =?us-ascii?Q?dH245raJTSqSjCKkUdykV7TcupfZG/QM0R05wikMdIPC3B9r8OIvfOYMBFkY?=
 =?us-ascii?Q?kgtFapnfKveK1oQrB3eAnTUtIOn9/zpnynFGNxDLtAdvO/JwJoNrndPLz/uA?=
 =?us-ascii?Q?nJUrdzQVDJom9r2TIx7RbG4D+TuJqE3KVj/pCSCGun4VQXlRck0xesD63GDl?=
 =?us-ascii?Q?Z9sub+/lceNDhRiQS0sGy++SMEtUN7kYJ/CpDIiXQ2A6KUd76wMfCIwUdYyy?=
 =?us-ascii?Q?HHdx7yTxgP+Jg4aWzXAQABvXa92jBc7ZXAway2xLDvac/93Kl8te7kUrbzKu?=
 =?us-ascii?Q?wv0vGZg/nf5PSU6B2sEMVDUoOh8gn5P+jZNuv6SvcEz8WywPpm6fzCglwfzy?=
 =?us-ascii?Q?+kQhju5Eja3X7ci/8V0ODxzdT0hziquzpndTIQEtu0tL21yOuG/X5dzrV5qf?=
 =?us-ascii?Q?LuwFYzzXCeadOkg+Zo785iCW4yUWmJu4q0H8Gd3s?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94f414c7-8714-4ddd-5cfd-08dc83b8926e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 10:33:13.5167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KeZGWriv7Fy6rM6s/C7zrWoTwcIiutx8X62YzUxydrUWqsU2FaA7E+eKmtX+bjXV10R84PciqJZMURDdTiaYvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7033
X-Proofpoint-GUID: nc1A5Bj_2HJJ8VxeZyp8juR4nBDgRnm9
X-Proofpoint-ORIG-GUID: nc1A5Bj_2HJJ8VxeZyp8juR4nBDgRnm9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_06,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 mlxscore=0 phishscore=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406030088
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 10:33:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200245

ChangeLog:
https://github.com/linux-test-project/ltp/releases/tag/20240524

Drop backport patches.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...001-Remove-OOM-tests-from-runtest-mm.patch |  9 ++--
 ...rio_groups-default-remove-connectors.patch | 34 ------------
 ...-Use-time_t-instead-of-long-for-type.patch | 54 -------------------
 .../ltp/{ltp_20240129.bb => ltp_20240524.bb}  |  4 +-
 4 files changed, 4 insertions(+), 97 deletions(-)
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-scenario_groups-default-remove-connectors.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-sched_stress-Use-time_t-instead-of-long-for-type.patch
 rename meta/recipes-extended/ltp/{ltp_20240129.bb => ltp_20240524.bb} (96%)

diff --git a/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
index cc98079651..5b6c780bec 100644
--- a/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
+++ b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
@@ -1,4 +1,4 @@
-From e87c2ad1e16cdbd62ba71b2ace3270503decaa56 Mon Sep 17 00:00:00 2001
+From 768159aa53257d247645a12518778f50b8fdf578 Mon Sep 17 00:00:00 2001
 From: "Mingde (Matthew) Zeng" <matthewzmd@gmail.com>
 Date: Wed, 29 Jul 2020 08:47:09 -0400
 Subject: [PATCH] Remove OOM tests from runtest/mm
@@ -14,10 +14,10 @@ Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
  1 file changed, 6 deletions(-)
 
 diff --git a/runtest/mm b/runtest/mm
-index d859b331c..3c2962f44 100644
+index 6a8cd0b9d..8ce3f4416 100644
 --- a/runtest/mm
 +++ b/runtest/mm
-@@ -74,12 +74,6 @@ ksm07 ksm07
+@@ -76,12 +76,6 @@ ksm07 ksm07
  
  cpuset01 cpuset01
  
@@ -30,6 +30,3 @@ index d859b331c..3c2962f44 100644
  swapping01 swapping01 -i 5
  
  thp01 thp01 -I 120
--- 
-2.43.0
-
diff --git a/meta/recipes-extended/ltp/ltp/0001-scenario_groups-default-remove-connectors.patch b/meta/recipes-extended/ltp/ltp/0001-scenario_groups-default-remove-connectors.patch
deleted file mode 100644
index 4a50d1ae38..0000000000
--- a/meta/recipes-extended/ltp/ltp/0001-scenario_groups-default-remove-connectors.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 14c710cae38aa96bd8d681e891b6a1d691f99988 Mon Sep 17 00:00:00 2001
-From: Xiangyu Chen <xiangyu.chen@windriver.com>
-Date: Thu, 14 Mar 2024 09:47:10 +0800
-Subject: [PATCH] scenario_groups/default: remove connectors
-
-runtest/connectors was removed in 9b642d89c, thus update scenario_groups/default.
-
-Fixes: 9b642d89c ("runtest: Merge runtest/connectors to kernel_misc")
-Closes: https://github.com/linux-test-project/ltp/pull/1144
-
-Upstream-Status: Backport from
-[https://github.com/linux-test-project/ltp/commit/14c710ca]
-
-Reviewed-by: Petr Vorel <pvorel@suse.cz>
-Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
----
- scenario_groups/default | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/scenario_groups/default b/scenario_groups/default
-index f17b2061a..ec77d8fb8 100644
---- a/scenario_groups/default
-+++ b/scenario_groups/default
-@@ -16,7 +16,6 @@ controllers
- filecaps
- cap_bounds
- fcntl-locktests
--connectors
- power_management_tests
- hugetlb
- commands
--- 
-2.34.1
-
diff --git a/meta/recipes-extended/ltp/ltp/0001-sched_stress-Use-time_t-instead-of-long-for-type.patch b/meta/recipes-extended/ltp/ltp/0001-sched_stress-Use-time_t-instead-of-long-for-type.patch
deleted file mode 100644
index ae8dc8706e..0000000000
--- a/meta/recipes-extended/ltp/ltp/0001-sched_stress-Use-time_t-instead-of-long-for-type.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 74074f9a71c876d6e95c2d72702888dd2fabc761 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 6 May 2024 11:43:20 -0700
-Subject: [PATCH] sched_stress: Use time_t instead of long for type
-
-This ensures it works across different architectures
-Fixes
-
-| sched_driver.c:744:43: error: passing argument 1 of 'ctime' from incompatible pointer type [-Wincompatible-pointer-types]
-|   744 |         printf("\nend time = %s\n", ctime(&end_time));
-|       |                                           ^~~~~~~~~
-
-With gcc-14
-
-Upstream-Status: Backport [https://github.com/linux-test-project/ltp/commit/0a682f1af42d8d261202821be580fe26d17ee9b7]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- testcases/kernel/sched/sched_stress/sched_driver.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/testcases/kernel/sched/sched_stress/sched_driver.c b/testcases/kernel/sched/sched_stress/sched_driver.c
-index 61573d788..5b8c187fe 100644
---- a/testcases/kernel/sched/sched_stress/sched_driver.c
-+++ b/testcases/kernel/sched/sched_stress/sched_driver.c
-@@ -136,7 +136,7 @@ int debug = 0;
- /*
-  * Function prototypes
-  */
--void startup(long);
-+void startup(time_t);
- int start_testcase(char *, char *, char *, char *, char *, char *);
- int process_slots_in_use();
- int available_user_process_slots();
-@@ -251,7 +251,7 @@ int main(int argc, char **argv)
-  * information to the screen and .  It also initializes the	 *
-  * process id list and other global variables.	 			 *
-  *-----------------------------------------------------------------------*/
--void startup(long start_time)
-+void startup(time_t start_time)
- {
- 	char tempbuffer[50];	/* temporary buffer to hold names */
- 
-@@ -734,7 +734,7 @@ void kill_short_term_testcases()
- void finishup(start_time)
- long start_time;		/* starting time to calculate elapsed time */
- {
--	long end_time;		/* time when program finished */
-+	time_t end_time;		/* time when program finished */
- 
- 	/*
- 	 * Get the end time and calculate elapsed time; write all this out
--- 
-2.45.0
-
diff --git a/meta/recipes-extended/ltp/ltp_20240129.bb b/meta/recipes-extended/ltp/ltp_20240524.bb
similarity index 96%
rename from meta/recipes-extended/ltp/ltp_20240129.bb
rename to meta/recipes-extended/ltp/ltp_20240524.bb
index f8e6d3987e..1aafed0bf5 100644
--- a/meta/recipes-extended/ltp/ltp_20240129.bb
+++ b/meta/recipes-extended/ltp/ltp_20240524.bb
@@ -24,12 +24,10 @@ TUNE_CCARGS:remove:x86-64 = "-mfpmath=sse"
 
 CFLAGS:append:powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS:append:mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
-SRCREV = "68737d20556d37364c95776044b1119c0912a36a"
+SRCREV = "8f21ebba42216dbb7e8d44c23b4a977d6823f7a1"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
-           file://0001-scenario_groups-default-remove-connectors.patch \
-           file://0001-sched_stress-Use-time_t-instead-of-long-for-type.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.25.1


