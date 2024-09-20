Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A216CF58C9
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 04:12:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.10476.1726805526809433173
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 21:12:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=999395d859=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48K40uEN032353
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 21:12:06 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41na0mp483-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 21:12:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pKGZQB2EOETdc8B4hdXPGf3Z79Xuo7MkFCagFwsG0ze8X46KklncVe+C2i0TTfeJEIfmOKc0ehg8LBU+l3SwOlGGjh7frphrRLpTuXxMeTMmXAX4Cb4HTD6DAzHnXeySbArth1lEeQZLcOOfRCaHsfT5PNsTjHXw8k5qvf87aQ5RDSbM8XJiRJAbh6LWsuqpaF3sWvUutZJsLSXeK3SikCwxwtfQQAlzdLF2mmjdziUtecUbaXXmEv98JpgRb5oMo27tjAYOqUolYLyDeQ5oPzh0omT2iFOIReeO/dgOgoMjB9cHUL5+RPOd3bqMIH+GIP+q9kTZOGBC2eVmN+8mgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qn/rxqdel7Sp7jRjGyMHg0O468g9B232ew6QWzV1KP4=;
 b=HhkUPL4Tqtd/SIqzZBsIRLjVlLvJbkCKL9aRGRsFJGtp7xgnnFG/bAm2+epKuwMoJ4pHAjDy0FnXgtDJMSrFbr082+ZG8PTj+odgB+xAvdgTYgtzLcRR4Gpb6ihO0hd2BveeZtTqoxGhukNQgJMlxo2V4lAg525N0Dv1N4NdAVmqF9yZhesmy54lXsNrSmf6sd10XMmnFTYUHOLap8y1Vk/kwTUdiG9oNIcwimJUB3ymDq7SD6BudbZlU6C54coFYBN4ap6g2Ih9Qr8rIo31pKvEOaacdjlt8Q66zk2CsY8CTbnIbd+1cjOpg7JWNjs6hejD+Q/cUQRoStspLXiRwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH3PR11MB7916.namprd11.prod.outlook.com (2603:10b6:610:131::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.17; Fri, 20 Sep
 2024 04:12:01 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%7]) with mapi id 15.20.7982.018; Fri, 20 Sep 2024
 04:12:01 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] json-c: avoid ptest failure caused by valgrind
Date: Thu, 19 Sep 2024 21:11:48 -0700
Message-Id: <20240920041148.3446456-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0022.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::35) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CH3PR11MB7916:EE_
X-MS-Office365-Filtering-Correlation-Id: 89afd328-79a8-401e-6c57-08dcd92a6060
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VSUYAeQOSjUCQ7uaqM2TiEvsw5xBQBjQOBQrvrvAk/+XykDz3fKF43hCXUa1?=
 =?us-ascii?Q?V8rcDIQYuqtUQNVT4R5jGDcIRYZ/of3tBucMznXMTXHOyxM64u9I5iPUd9th?=
 =?us-ascii?Q?FQW/N5mTs/3p18j63RTN6bq31ry3yN+R37Y8R/kb6jasrQmY+vcOaHaZGQU/?=
 =?us-ascii?Q?FGBZPVXafFBur8fTpSJS1k3LppnLNOk5mXH33coO/ZUoBnaKdVMf3YzHU/zR?=
 =?us-ascii?Q?+8HFq5yd0GKv2PX1vnKKNgAS/X1aZMT7jK/kA/KMO9rhTyBMGMlFQoTM/qRG?=
 =?us-ascii?Q?tQnkFUN/HVkKyoNtbpBvYqMzIuzUgeeK6BRg+nns3ny4F4b/oWamDDfzDNFQ?=
 =?us-ascii?Q?BZ7fCfL4bIc0KaNqlzdbipIsU6cVydwFxYXF6QcGNbE6vyqN7feCTpXte4EC?=
 =?us-ascii?Q?jDv4jPVyi7kxolD3IM80UFXSdmU+9irCCulfie3xn9InpXPLIk4Svt/fBpLX?=
 =?us-ascii?Q?NaF8V5oyxGc9CXrAt8EHU4m/YoNqA58Dafa7xQJIKAl3ue8Qho2of55Pshay?=
 =?us-ascii?Q?HgcVMtiiOtehzrWK4WxNqQDKo0ECXFbewI92W8Daq13UwxL1U7jFFGo/A5pH?=
 =?us-ascii?Q?FhcQysgVwh99xu+9H1JgcuJfjbOvkn/sX2CHkF7GeNv6QTHMWQlWWjs/8OFx?=
 =?us-ascii?Q?meacJqqgDqqbbJ/aRdPzhdZnHALZDKqPFgmRrEnbjWGApwoIwKRFWGqc0gkt?=
 =?us-ascii?Q?rwkBfG3sYORHvuO/eaiYr5f9rb0ytO2yjH6oFT8zvfxR/pPcG8HYMz1FYq8i?=
 =?us-ascii?Q?VvK8EyOXny/kUTg6wBCt0nSLU2IByrnjcazmjnruKHd8tfDNCtKl6+/M0rGI?=
 =?us-ascii?Q?rwtOT8wbOEqLteOUMaBLN0+0gE8++HzWVl9XIc9T0JGKPEC+lKQfmAbbctzW?=
 =?us-ascii?Q?svv4zKqsfJRRFFo3pvhMSMuOlI+6+dFVQ8hE4nmpa7/+IHnFivdTME1QlMoC?=
 =?us-ascii?Q?BI3M5+M+zyIqNlb5iktUOcO/aew2eeP4xOW6ShhV6r6zqvmze1WDK/Sf303E?=
 =?us-ascii?Q?qwZ0aFXIjfyKqKZzYZ1eRLmRCTvAsYPsCH+QQb60P4TlECY5ETzIBOahY3FP?=
 =?us-ascii?Q?JsYWpW0vI/Rok98SY5MceQF6c7za78xm5bg9pq4fvqZb2eXQ1j6od4g78zTO?=
 =?us-ascii?Q?ZSpx8XBH7fh7VJcWbbJ/nucSw37clz6LyCCf5HEZgYLUH2WSxcDYjS0z6mr/?=
 =?us-ascii?Q?ZP9q6VZtoqJD3lPs5omSdVkeaX/e3hdWrkrtp1JOkB5TGPWVwayqym2roEk1?=
 =?us-ascii?Q?vmN7Vy9ZfROJ89gBv+hKddfb77lgHn+8asq7HWFkgUdAthP86kagvzghc3LK?=
 =?us-ascii?Q?ru1d4GUQNmRlYDREag0Yy/d4qt+nm0qNlraRLpifg9pu2w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4GKdoMBaKTaUAc7EzPhPe4WDRarPY9HGF2JUeNjjCIgF4hkWhJ+N9SiZa6ez?=
 =?us-ascii?Q?G6DX9eTNgESbEgoNB9GkQMU8071JwFCRAayXfu70xd6+CtNq2iUjI8cly/g7?=
 =?us-ascii?Q?3JE/4Nq0sCivVbWQDsSn3/b8d+jtNcQ1QaZSfUSxP8bQlb+oaVpsqmZ1n+BG?=
 =?us-ascii?Q?JXdTv98Du5dACnX32mHAn4ApAeWy/ner5kJvvcgD/hxmN9QWsgDCKxHDNIlS?=
 =?us-ascii?Q?d1XBdM80rICqod2q24R5VBN6GR4kwKLYYQB0H+lbfou8WGprNtuaafAUEJB6?=
 =?us-ascii?Q?XtFHL3sBeWm07Ralx4gLETWb3KlI/6yTuI+Q4Z5AYGSO0OPxyfQZLlB3lkRh?=
 =?us-ascii?Q?jFP6TaJwO1P9VPtTt/1fdMiCuOq6f/csXmG7VMGW2gJas66gg/4FAjKQg0Z+?=
 =?us-ascii?Q?gjkg47oL6Garz2hlBfKVkVxmNiLEfhLm+Bs9uSpTPUQeeLOGpqeeIJYApfqZ?=
 =?us-ascii?Q?kMQwMZMco2weFEsTC14G4JyrWpJgFVNNZsGsWJRvx0cTS9g+PiVeW4OomI6i?=
 =?us-ascii?Q?WEQLseVYBRJyYf0zcDzf40E6wy1ovMOMBs4TmysghOJcFrq78pRX7g9DpOxj?=
 =?us-ascii?Q?CSEEIMIe7aDKezIT4V2/FDyKsezgwxdVU/jBEfPGl9bogVwrehgQJRq4j0e9?=
 =?us-ascii?Q?YQv4DRCUL9SO//wXfWddGELNKq5+7AEmbfk1QogfAV7wXc7bfQm0t3DqPQKN?=
 =?us-ascii?Q?aAb2nGCeX6elC4LQpXN00nxqGjEkeJ/XgTDb200ui7xhnLR5Fticl8TDxdlF?=
 =?us-ascii?Q?mKMCNdAVXp+9Nt5hzyVVjeUTT7wuz5qD2w3bX/gaZN57u+g6OehsZ0k6FGBc?=
 =?us-ascii?Q?yUKGVb/mnOgxrIl+vJlYSRHh3oBL3GtJ2OApw4+SFtXMyabMtZ1NZREovuNZ?=
 =?us-ascii?Q?8CzG3OqwVrKwbi5wAlj06jOU9+O6MrPmWZvDMUNwdd68t1unD5bwL14e/Feq?=
 =?us-ascii?Q?bPuXOc3EyluSOgmqXdOTEm84efCNT5//HbhoBnL3wHlaDoH6ZibCw+pP4/UH?=
 =?us-ascii?Q?jREKkkfOTXznhbO1TrIOcm6E6USTCdJwLrJ6BP6j2me/af0aoMkfrN+Rxs3R?=
 =?us-ascii?Q?evwrK1k7cg2BsAYt88pJTNYr5OVFJXLBqtSYip7zJcpXwkl2dMDopbPVHph5?=
 =?us-ascii?Q?VM/WuJjHdeSQVFBD3HNOJcZEFitF5IaatPQ60Std/22bPtsbF+4v3PKHxXbu?=
 =?us-ascii?Q?iD4emwFiOLGLII5I7p2Mlv7wW9OVS0q/sGO91907eRr9PgtsEnz+3oJUh5dg?=
 =?us-ascii?Q?CTC7QJ5Pgg+szcyYsuFNak6GxcDaUgdp5Ch2iswZ+Yafo9d2Ssa1/Fv0LZST?=
 =?us-ascii?Q?cq41i/qPqiKx3DZm7pkYv0z0ynnkNSVMU3VW+3asuHNOVpujF6FS6vUUe3Uk?=
 =?us-ascii?Q?UrOe8aEN/CYUAVp1fhe2ebQ07FW52S80c9Aq0cqLbO/qxFjN81fGUc9Zb8+q?=
 =?us-ascii?Q?imDElMYZCqproVr+mvItsIH5iQeEn+IO64re0+8tsncJ5+TOwR44/wJ5dPaF?=
 =?us-ascii?Q?4Yvc170VtZQtsc4ZBHH8DgIM6xoRElX4yOQ5B3wTBgbIVWoMN3ITneTEgqTJ?=
 =?us-ascii?Q?wwBLMaqXZqNddALsUsneoceIAtu9Aop4kxzSOqt8?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89afd328-79a8-401e-6c57-08dcd92a6060
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 04:12:01.0591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vdcIK+X9sz7FB4xJxebR4PfyfnEZgP43cn3EXz8Z3U7rHz5lhwokfyYkDHAkKRvWeskrXRPoh4F16hsbUr84aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7916
X-Proofpoint-ORIG-GUID: ZV82XbDLqyrYFqJhUiKsnAT1oKrsNVsR
X-Authority-Analysis: v=2.4 cv=d6+nygjE c=1 sm=1 tr=0 ts=66ecf616 cx=c_pps a=19K1aDEwnJ0RahI1emVHDw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=-isPuABhBgH7XLOD-3kA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: ZV82XbDLqyrYFqJhUiKsnAT1oKrsNVsR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-19_24,2024-09-19_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 mlxlogscore=617 spamscore=0 mlxscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2408220000
 definitions=main-2409200026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 04:12:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204721

From: Chen Qi <Qi.Chen@windriver.com>

json-c's ptest will automatically detect valgrind and use it to run
tests. This will fail in case valgrind does not work, e.g., intel-x86-64
(corei7-64) + lib32 image. The error is about illegal instruction.
Error message is like below:

  Illegal instruction     (core dumped) valgrind --tool=memcheck ...
  ERROR: "test1Formatted spaced pretty" exited with non-zero exit status: 132

So we explicitly disable valgrind by exporting USE_VALGRIND=0.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/json-c/json-c/run-ptest | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/json-c/json-c/run-ptest b/meta/recipes-devtools/json-c/json-c/run-ptest
index 2d0e94cd3a..acdce54f3e 100644
--- a/meta/recipes-devtools/json-c/json-c/run-ptest
+++ b/meta/recipes-devtools/json-c/json-c/run-ptest
@@ -3,6 +3,8 @@
 # This script is used to run json-c test suites
 cd tests
 
+export USE_VALGRIND=0
+
 ret_val=0
 for i in test*.test; do
     # test_basic is not an own testcase, just
-- 
2.25.1


