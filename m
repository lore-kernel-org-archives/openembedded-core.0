Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BFE8C36012
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 06:22:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.43952.1743056529814122286
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 23:22:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5181519be0=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5cbvB023237
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 23:22:09 -0700
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2045.outbound.protection.outlook.com [104.47.74.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45hrg45fg3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 23:22:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YbLI8Se6Wk4O2izlPYaFE+f9NbWULrLKribuYQKFFug65Bx6a6eQqPFD0ASfkqetWQCcRxa8gekt37xS9UCOApDRPpesRPI26e5rrQfwwHBR5lZtYfB1SEZRg2JxK1oe9a8gQTIKHURX6h7TXtZM2+yDv8SEJ73eGlhy6SAxAfbIKUzJU5tM3J+8+3pb21zqOz0GfohFk/91zcnEiN1IduIH3ADViS6SQEOh65sI/4rrUdUb+kKgIH2HeH/pGQ4lGuFtmi5AIajmtT9mEKbM+H3gfRqHJaQ/QLOA8ROwUFrUHHdwpdRtoT51GlS4qBGqqm6OSkhZUyzrKthJZdChDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b7R6U3CtFtdOwvNq0ZhDrnu4o4YExUdHpWLulut8NBQ=;
 b=Jp2JHClctU/hFUsikoBx+Cuo2sVdJG2eBcGj82xYWWx6r/W/+cZXByRKuBUEHJsVbNgpS7d1rLEmz4qLj8Hqc4EhpyIP/7Mz7w50EZkhgYrEEQr1Bjq9CZmJawFuuUH28P+uyLK2zOip4poaBy6q5NZGdYorYtw5pZkmFN/26aJ10f8OLhYAWOs66z/bfvGvzII9VMscabmu/DclutoQwb60ziUKzPOATW9o4dIeaq94AG5/NOvpQlyNmGU6bXHwOEos1gqwDIN1IBCJw5Z4Ilbl+F5eVdRG9nynpCAJXDGo3pg8zTjhO0xN+vBh2f2tNczs1ZnllZQcryX9M+3RZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by IA1PR11MB7869.namprd11.prod.outlook.com (2603:10b6:208:3f6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 06:22:07 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%5]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 06:22:07 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com
Subject: [RFC PATCH 2/3] mc: fix buildpath QA regarding unzip
Date: Thu, 27 Mar 2025 14:21:43 +0800
Message-Id: <08b6743215228b20c8afc6cd4f750a90d404c7e6.1743052694.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1743052694.git.Qi.Chen@windriver.com>
References: <cover.1743052694.git.Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0183.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::19) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|IA1PR11MB7869:EE_
X-MS-Office365-Filtering-Correlation-Id: 5243e878-dab1-4db9-8dc0-08dd6cf7b26d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Rr1cmHsg/yxNqPoFAIkHDOwYOQAxUnHw5Kv3DXuYI4VPt4Usm4RA5vbTlxCC?=
 =?us-ascii?Q?WAezaJOrdRL6llPBhNlpHu0EjPEE3567arv+7BIkIRPNcGdWIBDYw+o9XZHg?=
 =?us-ascii?Q?i5HkyLHecjjbcySznUhJDOGJFHxPC49/HPWmSFXm62/J5QmHNuR9N71val6l?=
 =?us-ascii?Q?kcNIntthsJTxQ4CYzSN9jzu2oyBhz7nlFMSbDSCJmrVgnJPf0XMBxq8Y0ZPL?=
 =?us-ascii?Q?t9c4Z2j6NYHRzYyZtwVxvGEUI0lwVnz9cBwBC9q1xELWmHmaGnp+md+rRLzx?=
 =?us-ascii?Q?RFulVpBVz0I/Ndo7GVXIrM2i/cMk0EDarpWYZpSqaMf0Sl7lcsWm4ljY0SZu?=
 =?us-ascii?Q?ARdr0lnygbtbD20VjuSyAstpZxj40V2yrEVDU7RZbEbkfqpXrO9a5R9MsPHb?=
 =?us-ascii?Q?CgxZeVBojzTlbpPFgd+FnHW+WkugDSnLfGrUfj7SeDo8QyP7UZStjcxqOvW8?=
 =?us-ascii?Q?9fbzJumUfk7IiZ8DD+ENBDiXJS50vP8vADsW09k85YLI/N+0dCuEtP6ngX5W?=
 =?us-ascii?Q?5Ssaad1J2nucqPaTE+XofAx04OhOeEFQ6I1zZPsD8TVa+QcMQ/c1o7f+WwMR?=
 =?us-ascii?Q?nBtmbnKAnoY3l7heTPdyyYv7znrl7nK9vwpTs7gDbHpIqziOjKXYCSmJhKv3?=
 =?us-ascii?Q?GwFsVBo/D4zRtK/sGA9Otky/vAGFqiK2molLinif/EJjXpiKLUHrizMDnjzl?=
 =?us-ascii?Q?5sgsPC0kC6w/DkNJ4bJiR9l+ITRQYGPo6ie63Uv+6+VuEYJ6v0zTn+zI5ObO?=
 =?us-ascii?Q?f9CpWb0G6SJLqzFCXKyURXaN7DCP8iCtjW0wBzcRaEqpwET2MIec5k2UjCMc?=
 =?us-ascii?Q?bmDy9lKJaFMVQjWj9RHL5L/J3buFo+WiZhvgcPPKfaoR/HbA8xYlz/vIElYq?=
 =?us-ascii?Q?pLsPOdfdGxOnWyNMUqq6xLCdypwrEks3pJ7VmAc1VQ2bg1qoXzmron1i4G7N?=
 =?us-ascii?Q?MkAAlMx7VyFycvOfr3gZC4Q73Y0CH3c7nTpBczk+d4ftSAnEQRbzYGrsU0nU?=
 =?us-ascii?Q?EQD4BzXwPaXYXpBuryS/TD1MUvnnJelXJftfSKkq/v1t2s9W0ZZF8/zwNcQw?=
 =?us-ascii?Q?BjqsUA+0Vz1XyPef4UNhppt/HZp17j4Wlkxw2SCjNRI76ugPNpZ8b9Mbmf21?=
 =?us-ascii?Q?H4ru2MrhPMeFYt8xWBvsGdfzmHodGZycRTGhe89Qch5D4YOZTbOFYmkMG4hJ?=
 =?us-ascii?Q?EL3bQbd4iV8cPCXIq5urpRbro/Zv/8G57ztr5QJgu96H2al306/IRqp+Alkm?=
 =?us-ascii?Q?QFc7un0WIptNiX32chXtf14tmYj8sqo0+w9Z26tTDbCrxLWmD2SFH7IzWyg8?=
 =?us-ascii?Q?6ZZEKseyLT/IDHOjvLQrD24lxk0RKq4FrYnLUVRb10chLeQC4tXTVFKW157V?=
 =?us-ascii?Q?fwEoV84qwXxi0Wj7AILGwrdfd3BtgyUjW4QuXkXVAyb3B+OvCLqo3c05fq8E?=
 =?us-ascii?Q?IAVUlzhCB0h5woy+59TZA8e4yIpEcWQp?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DTMsxqwOO92mu6A8wJOybvJvZ/c44pzeycqO8D2F93TkfzxJsgLZcWex7xkR?=
 =?us-ascii?Q?xkbbILjHGuepr3UFa6RnDWneAPS4wf9Bf7PfZvYkHLrJsdpWKx0lCLQogE5p?=
 =?us-ascii?Q?rgk7lo4EE4wmjdHqfmMqa+mBZDNl+0eohsf7XAsuCNG+7xzJHCaMuTr0/0i+?=
 =?us-ascii?Q?u932mbN1JhoF94efVnbJNqI1zIbLXkYoTGA285EyC6LPnDzJRiGz3a4UFm7Q?=
 =?us-ascii?Q?L/+D1Zpp/irmcxiVVQi4Iu9GeKsMbFKxdQicYejh4J0D55N8y9pXzEWVev11?=
 =?us-ascii?Q?sSyQ7Er9ofXaTjNYicsDL8Au9fE5kKYclHNLSipyNdQYb5z/oxjtkKxCzYCR?=
 =?us-ascii?Q?fKOMHdIlPbr4mXw7BsKTyC5DYrFr6yKir4vl8I5T28KNOJyrQ9uuvAJCHmNF?=
 =?us-ascii?Q?ihi8UWDUH2VZd6KVLXQoyRI+d2gBt8KIDsIkTmZ51MUM7pbytc1NkZj5AsS/?=
 =?us-ascii?Q?PO25M8qgjbf6Yrh5sSHPoe7sXNf0kghVzjsU9bopABPtNzEDHESjmEdcERu+?=
 =?us-ascii?Q?Btw4WKazLjFEagMzSXsO88VZk8Y+hq/hQDQiUvROhc1w3lDqJ5HovSJ7+8Tk?=
 =?us-ascii?Q?OHeRjrfNcaNf7POpYyrh/3fi2PoAWCO7t/LuVAlCKEQ+vDJm2lmpOx+GCdcL?=
 =?us-ascii?Q?BNA9bQUGxEEdg32RSB9qhjnmZ4N+Oo0ssg3ro0Sj/cAKpMuTzi494rT/bKu4?=
 =?us-ascii?Q?0dK9AvEUsvBhTGp+GmGJrehHW2Q5pUP1DwhLUTszhuZFe2cY1DU+ekyWj3Bi?=
 =?us-ascii?Q?02nnUp9RX9uIL1f9ze2+CI9VrdzvvPnmN14HljV9xkGLsXRzF9uxriXEYMHE?=
 =?us-ascii?Q?7NJJgR05UCPGYXHH+g3ryCffuBMJ26DuHTwLHVkSatSyJh9WoI4x4AbRvuER?=
 =?us-ascii?Q?82Jq1Ukhf2UyzqOEmzJtKnhlM31wHKqXjiLVPwJeYZ2cKIElbuxX8uejUBrx?=
 =?us-ascii?Q?Qek3dGDVNucULTyIwlvqDvbVlmLyQA7RRkk0D6lX8rMDtejmn3vTIfc2w1Vq?=
 =?us-ascii?Q?IkaAE+5OBbMmGY726St6iIL11tboL81xq6DF6SejrQ7Bvo17aIy2Ft6gPxqY?=
 =?us-ascii?Q?K4Xryq6J0soS7QvVnhwYOlaFbiHIJ3h0EFTs94cJTo5r0AWWhc1dLl2TOjXa?=
 =?us-ascii?Q?21nYDmAHsg1A94djozcAcdSnXmKileq3hWrl6w20zrr4z7HhmIo52aWkgV2y?=
 =?us-ascii?Q?MfLobGnjG5MeeRlXDSC+UuIRUsphaonrC2XtE3OB9SQmnElpRrCEX/P4Rmua?=
 =?us-ascii?Q?qrXzmDzL8kn/1bESXGv831is9S8SHPXcocBmRKnFcpsoWlJE/69SuzhefKRu?=
 =?us-ascii?Q?5rJqQv3tTbHtgG0RcfsC5TrUL2X9p8mAXAaQX8c3m9VOq9YpdUqDG1Ve5AOZ?=
 =?us-ascii?Q?cUwIaZVeHD3pHYRem+8hLQsRw8IvWcbcJbND5s4M6n8XP3kYMDiLqWpG5qn0?=
 =?us-ascii?Q?JXwyncw4DfLkqzroA/19bmb2F3kNfHcKrv1xRGib3JPGBu7IWcb/W385p+Kd?=
 =?us-ascii?Q?uZ2RM9Ya58YoMI5VQQ5sGKH0UXQ9N2UN6oJ1oRrb4hoSuPvuu3TbUyKAJRi3?=
 =?us-ascii?Q?XnrbNiWQXjQ+uKrnxn0WfAdKRp1rBfhzwyn4HlxF?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5243e878-dab1-4db9-8dc0-08dd6cf7b26d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 06:22:07.1026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vTZBZcR4gQcnIHUta+n7IloYKicMdodG/wSD9F/0YxNh6bcqJj869uVJoifBXyc43jLdq81UjR7WnQcyxHs0aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7869
X-Authority-Analysis: v=2.4 cv=HZwUTjE8 c=1 sm=1 tr=0 ts=67e4ee91 cx=c_pps a=GbYsmhbcUJoGoLxTsnc7yA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=t7CeM3EgAAAA:8 a=8PSBA3_SYKCjySTJtlIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: SgLEwc3-IaBoQepHiELT0C4PHQP3BXzs
X-Proofpoint-ORIG-GUID: SgLEwc3-IaBoQepHiELT0C4PHQP3BXzs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_09,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=670 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503270040
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 06:22:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213707

From: Chen Qi <Qi.Chen@windriver.com>

When unzip-native is somehow introduced indirectly into the dependency
chain, then we get buildpath QA issue. Pass a similar value as the ZIP
to fix this issue.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/mc/mc_4.8.33.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/mc/mc_4.8.33.bb b/meta/recipes-extended/mc/mc_4.8.33.bb
index ec50cfc7ce..fd18edf7be 100644
--- a/meta/recipes-extended/mc/mc_4.8.33.bb
+++ b/meta/recipes-extended/mc/mc_4.8.33.bb
@@ -32,6 +32,7 @@ CACHED_CONFIGUREVARS += "ac_cv_path_PERL_FOR_BUILD='/usr/bin/env perl'"
 CACHED_CONFIGUREVARS += "ac_cv_path_PYTHON='/usr/bin/env python'"
 CACHED_CONFIGUREVARS += "ac_cv_path_GREP='/usr/bin/env grep'"
 CACHED_CONFIGUREVARS += "ac_cv_path_ZIP='/usr/bin/zip'"
+CACHED_CONFIGUREVARS += "ac_cv_path_UNZIP='/usr/bin/unzip'"
 CACHED_CONFIGUREVARS += "mc_cv_have_zipinfo=yes"
 
 do_install:append () {
-- 
2.34.1


