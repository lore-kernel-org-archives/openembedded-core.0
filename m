Return-Path: <Kris.Gavvala@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3A70CD98F2
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 19:55:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50459.1781898933234310958
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 12:55:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HwFc/hSH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0630b3b404=kris.gavvala@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JIVoeL3108608
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 19:55:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=2Ew5/T39T
	L7pvdFj5P5W+8QqWGWD4mM1EXNbweUR0tg=; b=HwFc/hSHBWObs3FTmdVGHENOY
	xGOA0XLVpXajNVSxbg5LKdiBCygGoNoONPgQGvIgcA8VxR3Z0hz1cWOK7HDXAGJI
	mi+PzE0H7snlXA2M3PVsoCHF8JWhrHNjeCupFwhjX8VHYEKlD48lDcx9JvZ7+EtP
	jnMejM7crC5cesvFFH1rNMspexOcNQyRFWazMcV5qYWnBzw2t+PoqNbHyPNbXwG9
	ca4jVDJivvz+bppJGPOfL0y7swiCyhFxUc7P7dR/Hpr6jz3qeXrRXMUjzUVmizOO
	uRKOqQGHyTyE7Ax6LgwRR4UKLo9czyi98ixmN0i02UHidvPN8b6q/MuLQhMrA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011013.outbound.protection.outlook.com [52.101.62.13])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4euefc4uyk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 19:55:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HyExmdIQlVEgIIJ1/0STp4QoGsCUjfj/n5ajNMsNpJdGZipLZ3qTAHyqRVvaDl6WxlDaHcu1M/uc53r6fy74fY3tGCJPsHO8XxLlqZ/J5+1em1QS9pVACYiWyj+HUFBe//Vxl4eMvwvgH2Omho9s8RUoPnz9T0QhnA6+aV1xq32GogqTQj/EOHd1wpdtiu5++Uo33aJhhHU5NKrqy4uOGivj7WuGvs06ocjBL774lTT1Ku1CWI4luh52SfeBhkA89clp6Zb1jkLnCQS9Q2tFUkzj0oYrWEBvgYhQcJBDaGzK6IfKvEoZBlM0lgcjuhJABEPF9Yen/BRbE+KaJf9Kqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Ew5/T39TL7pvdFj5P5W+8QqWGWD4mM1EXNbweUR0tg=;
 b=lP3v1R54VhoYxgb0bI8kYC5VRQ1jSSFi4Hwfh368OeLJM59HKe42auuarGp9D2YvRwgzHDR/2i33FiT2Hai/NpkzGyK0O5H0wjDA+cmZ6Wnl6I96SnGBP4jF/Jw7TaXtddJ5p1oWZVK1/ua01RA0bRzLSqYftlCPgYCYPlufczATxdpaRxvOSTrNx+WaM7r/4AIZQjD3W25+kYS7FM7Gvrh3Dgc3znjpGy7IJUXlvsyHWk47bSlTrjU6D5UzeqqDMNjK6ME7xNSethXA21cfmbt1V7hafjn5wmTXOxjfRl2hJ1Xpk54mU467eAoLNmrQYAxMbLvc5UFdqEg+LGvdww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB7783.namprd11.prod.outlook.com (2603:10b6:8:e1::17) by
 MN2PR11MB4517.namprd11.prod.outlook.com (2603:10b6:208:24e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Fri, 19 Jun
 2026 19:55:29 +0000
Received: from DS7PR11MB7783.namprd11.prod.outlook.com
 ([fe80::aa04:56da:f40e:96a1]) by DS7PR11MB7783.namprd11.prod.outlook.com
 ([fe80::aa04:56da:f40e:96a1%5]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 19:55:29 +0000
From: Kris Gavvala <kris.gavvala@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: kris.gavvala@windriver.com
Subject: [OE-core][PATCH] python3: Skip test_tracemalloc_track_race for glibc and musl
Date: Fri, 19 Jun 2026 12:54:05 -0700
Message-ID: <20260619195405.4021971-1-kris.gavvala@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0136.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::21) To DS7PR11MB7783.namprd11.prod.outlook.com
 (2603:10b6:8:e1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7783:EE_|MN2PR11MB4517:EE_
X-MS-Office365-Filtering-Correlation-Id: 65995cb8-01df-4af4-7ec5-08dece3cb6c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|23010399003|18002099003|38350700014|56012099006|6133799003|11063799006|12006099003;
X-Microsoft-Antispam-Message-Info: 
	4eEJ+U8r4JxeJMEvPDv700G8EOS/+0Fk1rjEBnnaiWLmoPVHtwe7QbdvUKap++Aap7UpxOUxZLtCeouqs/MHz9qgLrj7kCZ9/qEawX5x6J/htDYN4kTS0vR4q5GSglXX7ss5EgTQzXLs4CqWP3ViNOp9BASYsuFlCnBDShWgkg6pRghsNqqhP6QmDxkqPLKkWbFU32bdsJ8woE/1Pe22bclGrs4Gcy6jxdrEOo7jeDF3OTnc6MHVzQ10u/9IXWYzKXrydPu86q3oAKF50cbFe8dUqWyFmxRjwx+Zwkh5R4TRwOu71Zq02q5cHIzowXUhdreI8kcTWm5ouqXCtDPiLeDdn7uCzNj+CCgCgoWM1WizNvY+9sEPuaVE6gkAyq20qsuzz5MS8PX5mbQgJj2s2fAWiYwLbqeGkCrWIYYnYLky5Ohb3ukSEG6rg+AZPQMOXzJQBwaRf/1lDkKCNzqWb0CF7Ed8S1vNKS8uRaZGCuOHLHVDcKqaGJeTTC28l4AkRaR1naYSaCG41SzgQ4ukzZuQZUBb1TSsOmLGrJMG0TGY/Kga/kNUukw3azh+w4XlKdRaU18Usu4TKX67+OmA3Semob5KF00/3ikc1c3C2SionsvE1EV91jAteL6x9G0U3//CyrhP/knyvCABI8dlOBvY257/4uFpIMRBkgCo/rK54P8bSPkSVrw1GoZ6ME4woBrIF168jKpEwHrjkGzP3C+dE81aL2VEyGeu2OiWkaE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB7783.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(23010399003)(18002099003)(38350700014)(56012099006)(6133799003)(11063799006)(12006099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hR5uifBERtenMlyRMF8LIrWHcQPE6ngzVu5PugfPwa1QqAaZcQmgUJPan3q1?=
 =?us-ascii?Q?//ulLjpNsEfdYmyeyxK2u1SLADTiOTzCzanpx/9oCRW/1C4VIc/4yRtk8DzS?=
 =?us-ascii?Q?k9pj5fpuOxelUZ58bpMvBtqXLWl8eek5WRhjg7ev0GRLrS5PIe0LfL2zqOmF?=
 =?us-ascii?Q?YV5+q+phFnB/3SEDsK4vlxG5Ngwh0V0/UppfdaCD6bzHKmW4Q5ytA1s3wgzu?=
 =?us-ascii?Q?0ainrtHPLpIGs1USiD9xZPJmgQfJ2rmBlFtb9C8J0rLnTdM+jdwkrFkXA3q6?=
 =?us-ascii?Q?bzVsJCWHlRyPv3MMCAgzYz5ip/YB6SFs5TrnSP2eb1ZzYOdwf8S4UGzTJxEv?=
 =?us-ascii?Q?/xHGOHafVnOcoISEk3oNM0sUFQENvmWXkAbS/6vC913s4qVmOhv+FkvuP1cG?=
 =?us-ascii?Q?Pb4Gq9yU/c7pYwGwfyf2/7bFGKnEyku32veyNNK+xS4yQVkdniiOUkF+gdIO?=
 =?us-ascii?Q?tQYWx7CqWYFJ/uZ+1c6aBn9gRnP2Cg648BKbCryh/sBF+WxWNrbA23Tu6xkV?=
 =?us-ascii?Q?7Na5yFSmpZRNcMHoCygYjVFtcIROPv0St/Gwg3ByUUMEIoZgaDOsC82Jg0hV?=
 =?us-ascii?Q?80AXUDigIx5IYIGhwCAxEUKHCogUx4COInX1o7ldcOG5EdL3rm9MZAhWjoee?=
 =?us-ascii?Q?Py8+16fRH8P2fw68V6SS04uOItF3VoF6G2b3Y6a2UHEQDUQ8/GoKufoWoM2d?=
 =?us-ascii?Q?RKfvZGg5RsPbLrFdPlZVoFIFmNjS9kO6yfENNhpfVax9y/fSQWRM9zLnjkQ6?=
 =?us-ascii?Q?BNuxRQmzO/Fpx7GmPkxfg+YRK2I9l0cbzUXX9pt0+dZa/bxBf0t4OpXwveaV?=
 =?us-ascii?Q?IEt3At2hybbEtOmYTJWpUUFB9Cq5+wR7zZ89XjFYyxEL4SUNa4ov8gkQ7cAf?=
 =?us-ascii?Q?ylTYdC88WBNxFhuug+2tLXuGmDEXvhOvnkrQsgAWvEu9ak6/tVnyqwfNt0WK?=
 =?us-ascii?Q?ZxKJmArrChqOgFD7aB/pyhxVd8johiNL5FDSxzGh5Llg2ltinLEZZjGiAwYy?=
 =?us-ascii?Q?eC4zlhKqNogjPrxcBy5HpUsOPeVnVOjQMAw8AbNO7albEmREvCkUfjXbYP4+?=
 =?us-ascii?Q?W/WZdj/i1MSvGIKV50rI69T2/VtJTJqloFI2RnCo1xMgSaYL8mgE2HWc1mPR?=
 =?us-ascii?Q?0JIq+aQ6+iL0X0zRjzympdZTN9gA7C9u6Maq1T2wXu9K7F//AkOIIBhW74gB?=
 =?us-ascii?Q?M3/AEXpmD1Uv+5gOIHJv8JE0nJHz4x4Rr9vbENjvISapA3PhkbZnRmtrIUKc?=
 =?us-ascii?Q?r4IHM7B0coSCdh48QMo8AiWDnXQaGIPs7AZ4M4M0fqiu4BmM1tRvKlvDjyWx?=
 =?us-ascii?Q?75Lh/OYcTUIaV9eq8s9GwkQdNnTbbNLfiwxZP9wmWoo5w/2SvggkzMQp/fUP?=
 =?us-ascii?Q?73XA6qHgPiTuim649Qy+kLTKy7oHzSHWBgMHQzhBvQ87KfxkwP1GhlfSY9rs?=
 =?us-ascii?Q?kEZ7n6EsoKnq8NsYCDcX53Lg0IpbkrTD0P6dBuUFNys6ewruJEo+w19iGlH7?=
 =?us-ascii?Q?hgUnncxB0GGkfnF3ffRsJUtUwa3Z8/AXbJ8Jj8h1qNVMv9OCqW7xoEQu+44n?=
 =?us-ascii?Q?D05xlTu339Czs3CeMRWBCCJhUqb/grZoVSawyA7UPACZpiSWPrmyVfzD2kwt?=
 =?us-ascii?Q?fzkk5lsM8clGyHUA2uVpqwAW43PTFGAy8n3QtH2DDLTgrHcifBKOKRBT7z2z?=
 =?us-ascii?Q?a/TssC/L9j9MvrwTHCSrRr/79lGLAOY8s1xvmLaUg/a03NjFvT93Q2EdC7sM?=
 =?us-ascii?Q?XXU8mz247rya6X++M0G429es6M5JGlE=3D?=
X-Exchange-RoutingPolicyChecked: 
	itMfOagtLaYy3dgIPOXcOfa3ufFVS7z69lzvpjRkdHwEx3O92wSHqLH3XuZo/Kz/i4tsFtkRMF6zoX1gJsqeCIRyXn1eK/Pr0tU/sSHv9hvTdlqwmAdyfI2veAlifDWNIGV7SwE6noJfqByKyEpZZE94vR03imxE86wwU6utyGRCTYbM09joEHaqtUZV0nVmCzV4/Nf27xryBVVKEee/CWMPRHDWf41nPQo9E3egG/JcVkfN12GRtjr/dJipqJAJeo4DOGPDOHqJ1ADUmqSYCTrdXKonO10NhW6URRixCAfoWNJqN8xkuLkZ8D7EK+ZakFCRHh7W9ZT9FYJHQ1xV1w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65995cb8-01df-4af4-7ec5-08dece3cb6c9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7783.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 19:55:29.4337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lqpPX6byhrbMyJ9SSRalzwm8VW/IVMSkBhmNY+iSL0Nq2VkVtxrTYG+DhgIxNSFZY0yYhdkNs0mMpYIAGsUwRgxeYu8L4wVvXd5l+qdsg8U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4517
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDE5MSBTYWx0ZWRfX4eku8cetbQ7m
 kNmow83L5Zg9mKRUpACTQKoHMO7vDhvRxJ/srp4SAXz5DFdiNZWCn2AG4d3AImH2G1sOem47sXj
 YfFMN3Q236Evrg3ngZZkgZ9OsJlXCDKd2zZRUzE4HCr2+glYlk2r
X-Proofpoint-GUID: eaaG0ZGt57W4QiZvbBvPTPv5lMGPqbkk
X-Proofpoint-ORIG-GUID: eaaG0ZGt57W4QiZvbBvPTPv5lMGPqbkk
X-Authority-Analysis: v=2.4 cv=ObGoyBTY c=1 sm=1 tr=0 ts=6a359eb3 cx=c_pps
 a=J2EZj3tNR0Bt/EAJeTok+A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=8AHkEIZyAAAA:8
 a=t7CeM3EgAAAA:8 a=PyATIaFd2_4qOWD7jVUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDE5MSBTYWx0ZWRfX+HzdGrJjFcug
 nKx50Nu0T70kj3bGIRnC06h4KQSEVXqasI9ow30mMFtohvRZb39P1GCCuFIyZlFA0gM7/wKnpFu
 klK6TJjqvHHG60PZuxEfKzX6or5Fie84Hzyl8HOkVL+lanAKYf6QYMDCwkog2kdehSnQND2uGbR
 ou0kwiG+alzflkbRtn04cV6at/rLps1r8o4lFXcrsAyEGsUO+ToTxvYLJAARtgveZUDkModvb5D
 REd6HkIk4HY7lekiZCHg9cCSGfPE4DhJ1fXaWQ/zcFUbsBbjOeiu6BckpnsHW9t/phRDr+t88RY
 0Ft9VYdPTcwbrSaRxnhZ4V++UAeiLsr7kOz5z4G1uCpEINeJzDG/vOpp0G75KKnQEA8ZOGDDtNl
 bk8byKvejdAtqKgxYR89Xx8TY3OZF5YbW1OU6+OKWB+ZAKg1vF2xQpxre+M7ruiC8ffau3KQGhr
 BkJ5mld8Kh/wAscQHVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_04,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 19:55:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239191

Skip test_tracemalloc_track_race when running with glibc or musl to avoid ptest
failures for now.

[YOCTO #16182]

Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
---
 ...malloc_track_race-for-glibc-and-musl.patch | 44 +++++++++++++++++++
 .../python/python3_3.13.12.bb                 |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-Skip-test_tracemalloc_track_race-for-glibc-and-musl.patch

diff --git a/meta/recipes-devtools/python/python3/0001-Skip-test_tracemalloc_track_race-for-glibc-and-musl.patch b/meta/recipes-devtools/python/python3/0001-Skip-test_tracemalloc_track_race-for-glibc-and-musl.patch
new file mode 100644
index 0000000000..093de45995
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-Skip-test_tracemalloc_track_race-for-glibc-and-musl.patch
@@ -0,0 +1,44 @@
+From b0fcd618c8387387d38dd0b4494bb8d94b49b849 Mon Sep 17 00:00:00 2001
+From: Kris Gavvala <kris.gavvala@windriver.com>
+Date: Fri, 19 Jun 2026 10:44:22 -0700
+Subject: [PATCH] Skip test_tracemalloc_track_race for glibc and musl
+
+test_tracemalloc_track_race crashes with a SIGSEGV
+when running python3 ptests on qemuarm64.
+
+Skip the test when running with glibc or musl to avoid ptest
+failures for now.
+
+Upstream-Status: Inappropriate [OE-specific]
+
+[YOCTO: #16182]
+
+Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
+---
+ Lib/test/test_tracemalloc.py | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/Lib/test/test_tracemalloc.py b/Lib/test/test_tracemalloc.py
+index 0220a83..b2159f9 100644
+--- a/Lib/test/test_tracemalloc.py
++++ b/Lib/test/test_tracemalloc.py
+@@ -1,6 +1,7 @@
+ import contextlib
+ import os
+ import sys
++import platform 
+ import textwrap
+ import tracemalloc
+ import unittest
+@@ -1111,6 +1112,8 @@ class TestCAPI(unittest.TestCase):
+             self.untrack()
+ 
+     @unittest.skipIf(_testcapi is None, 'need _testcapi')
++    @unittest.skipIf(platform.libc_ver()[0] == 'glibc', "Skip test for glibc")
++    @unittest.skipIf(platform.libc_ver()[0] == 'musl', "Skip test for musl")
+     @threading_helper.requires_working_threading()
+     # gh-128679: Test crash on a debug build (especially on FreeBSD).
+     @unittest.skipIf(support.Py_DEBUG, 'need release build')
+-- 
+2.49.0
+
diff --git a/meta/recipes-devtools/python/python3_3.13.12.bb b/meta/recipes-devtools/python/python3_3.13.12.bb
index 854d834135..0176abb849 100644
--- a/meta/recipes-devtools/python/python3_3.13.12.bb
+++ b/meta/recipes-devtools/python/python3_3.13.12.bb
@@ -32,6 +32,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-Generate-data-for-OpenSSL-3.4-and-add-it-to-multissl.patch \
            file://0001-Skip-flaky-test_default_timeout-tests.patch \
            file://0001-gh-128377-Skip-test_cmd_line.test_non_interactive_ou.patch \
+           file://0001-Skip-test_tracemalloc_track_race-for-glibc-and-musl.patch \
            "
 SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
-- 
2.49.0


