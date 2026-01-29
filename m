Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93785D6B095
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 16:39:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19178.1769704767747271324
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 08:39:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=UhtahnHC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=64894db884=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TASNlc1977523
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 08:39:27 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=pA/oBF7XP
	5omPVFoh6VvZEcW5d9TqvNjfD7nr7G1lSc=; b=UhtahnHCKryo2nOC+0sGPE7Y6
	N8axonM/UjH1BfPERghHfNy4KO+st+P+pgPO1+MRYoIDucS1mfZG6n2cf+WXItYV
	qKqekTRknIIzRIFigDEkl4CLkdPnrZJOYG2ZUWplwgRDOZSJ5aUWwuwRjHtVzwZ2
	6/wG2DPwfVNeFDxCjLUMMjivD1c2oLkazx/0yVt4IqC2l9Gq77m3NvUZwNQNSnmE
	8dryKtwYUFwttAlBe7AcO869cyCMujz5eVLmBBhcAUYiaxYycIKN1o42Hc13UO9A
	S40jR7btrA6nl+kSvsShizxlni+XMcU8vsuiTpNOhGJj8dbCB9x9rIc/cErDw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010011.outbound.protection.outlook.com [52.101.46.11])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4byx2t8skp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Jan 2026 08:39:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wn8SP+7vXaFTKhbz4GcoFJnM9524EAgQ5GNe/Fl4m8yLL6DPat0PDLSQSn/Ne7iQGTXCJfE7p+f5yoXFugxhntfYQ+CqXaYjxK1uYC40depWGvQS8UvDqY1dqxZPv12ZyoDVoBm+NT0jFKDCij8hN92an9wMf01zK2uhfddw9As4wu5pFWk6sYatr9ddsstdT+zcohA7K7HHyFwm5KTnJModJBJdpX0e2+ht1iQ85xvC1WPpSlYWVRaK1BIpg54u+FMk9EVg6OGr/ZddDq1PLcdxQfzYbhruj40N1OoJOuYT4wwAhvewkhgIIRR3CVSfqnDS0rMGU7tBtOdDZjh2rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pA/oBF7XP5omPVFoh6VvZEcW5d9TqvNjfD7nr7G1lSc=;
 b=VxtjFMua5117bDwM2B80uZvNEOtzDxGmIzJ5/96bQQZ3RlOM/fi5I1Ir4XkNqMon9g7cd9VTTAx9fvOBIyTnWrF4HEBCSJBxZ2eQPzfPnz5NnDBuowQVv5XqU7WIN7JOoFVhgHov0epbpN9ttUqcwH+C05llGL/erWFcxfOoXtp+z9GdPtXQx+LyQMHoXacNBV579Y212HlIfmIMR7PciwjK+lYyxTpqocvDZzfdb1bBC10JGrnjsXruL5OBn7I3yUKNSGErLkvhXZT+lsGUrsssqCs8HPWtHDPgdNLzLoGfdYxs4FJtrk8bCMg2PtV6EGFo0jNXIolq6P1vQjkVMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by IA0PR11MB7910.namprd11.prod.outlook.com (2603:10b6:208:40d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Thu, 29 Jan
 2026 16:39:24 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 16:39:24 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        alistair.francis@wdc.com, bruce.ashfield@gmail.com,
        yoann.congal@smile.fr, elmehdi.younes@smile.fr,
        richard.purdie@linuxfoundation.org
Subject: [PATCH v5 00/15] Enable rust support for linux kernel
Date: Thu, 29 Jan 2026 08:38:55 -0800
Message-ID: <20260129163910.2612040-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0100.namprd05.prod.outlook.com
 (2603:10b6:a03:334::15) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|IA0PR11MB7910:EE_
X-MS-Office365-Filtering-Correlation-Id: 837941a3-4eeb-4987-0d75-08de5f54f635
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?IC7nbbpnb1yWTlxEcuKmXCkfckaMPJcV6RlSBo7lFrLo7elmPSGYXHg0Vpmi?=
 =?us-ascii?Q?yUMZLU6XmSz7YOo9l4mKw9Bg8L+q2mreyjNokqlo6tTT208KjRaXqy47p41p?=
 =?us-ascii?Q?i6noMWK2I11cvT1brsActW0+bTCiTVXk45L4k5qebXNNKgnzPUzUmYcHif4F?=
 =?us-ascii?Q?OeNoQb+ng3VTQPB99FRl6z4UKchaA4JAuYW7CuN0JW67uY2bKp2E9lPGHfQ/?=
 =?us-ascii?Q?w+Ecr/UqDaxwSsoDTMD3hSoHgg+lr4KtGkHKWRld6FDyd0Ove86VNOFjTjVw?=
 =?us-ascii?Q?H2N2VWp6o6moQICwCbxSugcw0USJo8iJbRsJOYW30aoqW+DdZsRIS/C3vGlw?=
 =?us-ascii?Q?LtZENuwhzE7+pR8ietKAcV1pxfsxuYyNMFbL8y4mgsEO4L5aN6sS2RlGdnj4?=
 =?us-ascii?Q?zXl3gfO8xSQg5EqMnz9cxENfCCY/qY4ERCwBk7FAvkd0LIZpXfdk/hPzRG5b?=
 =?us-ascii?Q?kCJsjgdda68KqSEvhCdle0eF6w4du2wrwfT3SnJwE3eVQs67zcx8a1ZPP21d?=
 =?us-ascii?Q?nW976K00HIFesPKnftU/5aHsKpOILfulLu/kHC7/D+iz5URxkFKZjEh/JDby?=
 =?us-ascii?Q?9n9XgIHz4ChWFG7emtnbfYqrpbJm6/gKHZtPA0ygs2ef7d3IOPU9sLXVQw1V?=
 =?us-ascii?Q?uFP1a/RWzsE7Oy2BX7ywQv/7P2BHfLM6+HQtKGCK9Rb4Je26FC8xxpeL42mg?=
 =?us-ascii?Q?rrX0yBhZa7UI8eUqQpXJHwUOg0UTtIRr1T7teS33o7bn4/fxSkqIQ8OijZqm?=
 =?us-ascii?Q?gH9TOUd1/w2K/dV24lxj6X6IiO5gRmA1yc48K4BrEI5LY5sAFyCtR1LP7UFY?=
 =?us-ascii?Q?LNXo26mqHbGnY+8J0TSYt76JuxHe5F4fpE8SsIu36ZTTAUvrKWDb7iaaj4n8?=
 =?us-ascii?Q?841PApfYXjrErEUzFrztioflk78WecuyfnCRYU4NCEgUrBGjMQTr7x/z+6vr?=
 =?us-ascii?Q?ocsn+63N41eEWwxhDAGGIKiZZ0BtwGll6JAoSH1rLHu2kWf3dO2/05GZJqea?=
 =?us-ascii?Q?2cx4M5L2H2GD1vAE3/MPYNdJuRBx/7+C93OI4otHmUS65QWaqH4wdtFjYBNl?=
 =?us-ascii?Q?J/LS8czzcUgMXNd564tH7B3V2AvKo4ZJnL583D6O4gcGb5hzzDfxKDUy9vUn?=
 =?us-ascii?Q?PyOH/pSoTOZeBLACHU5Dx5fXDDemn99Auo8aNis0yqkQ+LDoa6mcFgZ5bQDu?=
 =?us-ascii?Q?SIt10C/8Ml7L7OHNsjj8yFTGsuPl0fbmaZ+ZUXdsVouXxiOryc7C8rlhlMos?=
 =?us-ascii?Q?XB7uGc+vZ2If957AlU2l3o5PseZnXt6unbkyKhO3cGaZP2ARyZpgWFOUGk9w?=
 =?us-ascii?Q?z9gtoAD32OgCCAl5dlCxEt45AGmFdycEJ8W9kJh0FXs8fgoFj93Y6maz4ai2?=
 =?us-ascii?Q?IhNoRLMQTcibdeztVjVaAjR50NBDL/eGTNh8EasF/MQCKuAzbClbiZNIvr86?=
 =?us-ascii?Q?YN6o8y7tTxn6t6T+NHbtgoSnFsligz4uSe6wBVE1Q3l8dQFQcNub8MmkocEd?=
 =?us-ascii?Q?1e/R1D+Sdy8sUvl64zahyhU3nZEh60IEVczTCCrBiEKcFjq/LAvm2vF/dcPA?=
 =?us-ascii?Q?g4TMdc1gyjzVTwuPkL2zjiW15JjqjJIqXBKSy9y/yzg2msBGqxQhMOvtuWH3?=
 =?us-ascii?Q?gsL1Em0hVwL33cv1pZsx6Aw6E5XAvwWiXCBOg9WVYy5M?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eR7HUskhfM9fwhfuIeMn8Ra1ImO+ml+gtURpgr0js2T2J63fqwy2ZFaGLZC1?=
 =?us-ascii?Q?lTikO53+e2vXB5wzepv0AfkeNfXezC+VMLlq9wykWMa+N4BzOcCIOwu3mS56?=
 =?us-ascii?Q?m2XxDpGBccgEMg3vNJC4q2jfb71V0cvroZqpc6V8UW4jUqmlvp242s56Md4u?=
 =?us-ascii?Q?uInErNzchxsSC+CZGOpdtLA/xGnFdP7UAiFDzN6AoazGuHQShxzeOwrtjpSa?=
 =?us-ascii?Q?3HyMyOWLkkWLfFkLh0MRkXlX77CgO3Sv/KXu3cuyvqorb8FCuOv9ESyS3CY1?=
 =?us-ascii?Q?KFvmKzMhHm46B6L+FY3Z8cM0tNvmt14Ti3SWpAJoAsnDuOu9lx9daGV81x3B?=
 =?us-ascii?Q?imCqhW0uw+7IUFC7SDcpOBaRnF7I8V5GBoi2FYMlKNbfXozt5hbeQICH6Au3?=
 =?us-ascii?Q?xpUiiwx9DDl6Sp31I+2GNAqI7g7q1gqIpIR82cDzHcKPTbvL5cDg+m5vXKvO?=
 =?us-ascii?Q?gHL9ST7qq15aNhsXkG4E+c/zZSfwqh2kZelTDNywk0D+3On/Akl+BWxrfq6A?=
 =?us-ascii?Q?xMFAYykRJiKO2GwfVY++sgJ/JnbIjx13m7LdDA6dDDT/qZV0lvlXhE+TVjwb?=
 =?us-ascii?Q?nmRR8PBvOjKFjZD9FCtmz/dQnsngk+XyvPEEoUj4odYWDNnYEmcWF3fgWlN4?=
 =?us-ascii?Q?aBmNTvdo/qIVzVkQHIRvuMeWOveO5dxTWMJkAbjGCZo1XQ8msRgy+lnP1Vfh?=
 =?us-ascii?Q?w5b4yyCosf2WzBCFab7MovaAUguO3WaSKlBTZnpvsoeEsWNI6Lju7P9bHKf0?=
 =?us-ascii?Q?8uw37B9jpdslbJ2bzHPgPbxhMRMzhIQjjfkB/JwIC2Ij8G+BqEyEAJwIhUlj?=
 =?us-ascii?Q?q25D2MGKk8/KaJKemor+ugjF5iHi1k6db6UoXLb+pNOgAna5srZvoQx2hh67?=
 =?us-ascii?Q?8P6JFhnfWIvpWPbw4tVR7v+GwSQe8d3WX4Q0+sEmySi20giib/0FkigoJV71?=
 =?us-ascii?Q?IKw2Kzx2b4pfEQPugviFaWdwHa8gTUpQe3XhTh17iQ2mECGFk6ZLovlPxZ/h?=
 =?us-ascii?Q?DrjUFtn0xsY5myCEzjGVLWVEmVBtltPlFh0UfoQBR1rmlFIQWJ2mMROMpmxn?=
 =?us-ascii?Q?kSUOjKEHasbJLBTACfYa/EFRH5OrFtRTjMbVeyQA7/deDvoRY6RvO1eqA3vH?=
 =?us-ascii?Q?a5WXNuHKbGjACMkURyRaMwz9mKztI44bMhHuJ1muSonSRlJ44U5VuWKtA9Si?=
 =?us-ascii?Q?/YVjJ9QUzfJ30XBrDWYHyVCMwgTbyKUK2WqMreE6dC0bFiWUPVcjE1Eqm0gT?=
 =?us-ascii?Q?Ccd2EcLMl5zsKLPEu4B+J3R5QynStX4b3OGsVPzOCp4FMIcBZxhgr7fMV6H4?=
 =?us-ascii?Q?5R4KLuuNU8OymNsKAVYZdao1K9CPo0aJgCfyxSCrH58A/Ll3uYwXK7FZDch4?=
 =?us-ascii?Q?455IQCWd6cjT7Swb1+tka0oib2yw74E6sc5ybJ/9vxMxhc9c2Ws3lsaZ6vPw?=
 =?us-ascii?Q?TUEUN84D8cTWO+s5p0HeeaWWwg/9uvjley7KxdYtbQrjo8XUfd3uJSg+FK80?=
 =?us-ascii?Q?6CQ6ryHOZg3A9T3HwX5XOXoX0vM9zkjDISjvWs2HMFuaxxEEQf4QO6uTm+TN?=
 =?us-ascii?Q?dgXZlTF8XuIaqPquTlsyTXVOLCJzS8imZXpyZ7oYvbEzMOrVFUzpAqRqLfdQ?=
 =?us-ascii?Q?7j8pxnCgb59kwvCMyBbRzvEjJb+EigsupDiONhNBUivhNLiWffxB/mi+nc3z?=
 =?us-ascii?Q?bJREa72GKbhH9e01nQrLhNpOn3ObWQefS3/MrshKKMPm/mGb4ahp9werrnPX?=
 =?us-ascii?Q?Gf2QmYayXL4wTEtuH+9JXo3FHmaCB7U=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 837941a3-4eeb-4987-0d75-08de5f54f635
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 16:39:24.7270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: duxRYX3Ty/IrqzHV/KUpMZVm6gpc3BtHYSQHMmBL06CJ0meK1ueXBYiai8Lfp8PcJEHShkPpMvEo1L0BOW4dKvnsdAJgb4E//2iM7Cd644g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7910
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: MMemgLnlvIvw5X-LWL1RC-4Dmg7SSmVd
X-Proofpoint-GUID: cicT798CfF3E0JngKmOD5Fe4GZg6xz9m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDExNSBTYWx0ZWRfX9elx2ndO2JbY
 MA6omduMiMryQqHrxvWOMk+k2RFXBwXCxmmTuAOrPvRqkgI4YgdNqVTq7m82tq/UkaITirQVZk3
 iSsT8rE1VA9obHx8SBvsn7AI2OhwDX/UnxIqA3Wx141pRe88lnwawD6go3DlCenixzhIt5zm4qh
 +VgWH4t00VVmHJIC7qI5vZifGgUkPuAxFyfjMKuRyCLqBgNt2OnkYCs9IibLUOFJXxI5UzFD+b/
 /Kz9vWgXaU7b8RDT+hOvR5Ph+hrVPJwrIC+xoPHdueDu6LI4ZnPdEAggNNGGIbiB0MSy1xX5cpa
 nhEOjzKOmCuJN5f4A6hgrpcWUDDKzqaEXTMbJseryp9yRIiqolS6NWb8aO6H/EpiJHRNu7hL1kh
 1Vs3xQHadHnJNFPbTHPf+JU5lPtHcW2dQc0/yNF7VuoqP7gqBrZfM3rudF6SNhyz2LcOXB+gavQ
 K2EU9SlmDIleCMVwvhg==
X-Authority-Analysis: v=2.4 cv=NcDrFmD4 c=1 sm=1 tr=0 ts=697b8d3f cx=c_pps
 a=kVQeibrV0jayZGAE3rze0w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=JIMSEG8B6JNmkwDUZLoA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290115
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 16:39:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230141

From: Harish Sadineni <Harish.Sadineni@windriver.com>

v5:
- Regression in autobuilder with v4 series is due to applying v4 series together with following patch 
  "llvm: enable LLVMgold.so build by adding binutils dependency"(https://lists.openembedded.org/g/openembedded-core/message/229387)
  is fixed by droping Alistair Francis's patch(https://lists.openembedded.org/g/openembedded-core/message/229091).
- Updated patch "rust: install Rust library sources for 'make rustavailable' support" to install 
  rust standard library sources for rust-native. 

v4:
- Resolved patchtest failures.

v3:
- Removed the DISTRO_FEATURES dependency for installing Rust library sources in the Rust recipe,
- Extended support for on target rust kernel module developmet by installing Rust library sources and
  introduced packaging of the Rust standard library sources in a dedicated ${PN}-src-lib package.
- Integrated Alistair Francis's patch(https://lists.openembedded.org/g/openembedded-core/message/229091)
  that uses the Rust bootstrap tool to install Rust library sources for rust-native.
- Dropped the patch that added rust-kernel to native/nativesdk feature filters in bitbake.conf.
- Updated flags in the make-mod-scripts recipe to fix build failures when building Rust out-of-tree
  module recipes.
- Dropped the bindgen-cli patch extending BBCLASSEXTEND to include
  nativesdk, as it has been merged into oe-core.

v2:
- Combined [PATCH 05/16][0] & [PATCH 06/16][1] from v1.
- Updated commit message and added in code comments for patch "[PATCH 09/15] kernel-devsrc: copying
  rust-kernel source to $kerneldir/build"

[0] https://lists.openembedded.org/g/openembedded-core/message/228559
[1] https://lists.openembedded.org/g/openembedded-core/message/228560

v1:
The previous series was RFC v4, "Enable Rust support for Linux kernel"
(https://lists.openembedded.org/g/openembedded-core/message/226623).

In addition, Yoann Congal posted RFC v2, "Kernel Rust out-of-tree module support"
(https://lists.openembedded.org/g/openembedded-core/message/227281), which builds on top of RFC v4.

The current patch series is a unified version that combines both efforts.
Compared to the earlier series, the main changes are:

-Kernel configuration fragments have been moved to yocto-kernel-cache.
-The kernel fragments have been removed from SRC_URI and from the files
 directory previously stored underrecipes-kernel/linux/files.
-Updated the "[PATCH 11/16] selftest/cases/runtime_test: Add test for Linux Rust sample"
 by appending KERNEL_EXTRA_FEATURES:append = 'features/kernel-sample/kernel-rust-sample.scc'
 instead of adding this directly in the linux-yocto recipe.


This patch series introduces Rust support into the linux-yocto kernel recipe and
related build infrastructure in the Yocto Project. The goal is to enable building
the Linux kernel with Rust components and provide support for building kernel module
which is written in rust and also provide support to build rust kernel modules in sdk.

And this series adds test for Linux Rust sample and also added support
for out-of-tree kernel module written in Rust as well as associated test.

Summary of patches:

- Patch 01: Add required dependencies ('clang-native', 'rust-native','bindgen-cli-native') to the kernel to support Rust binding generation.
- Patch 02: Install the Rust standard library source ('library/') for  native,target and sdk.
- Patch 03: Updated `kernel-yocto.bbclass` to invoke `make rustavailable` during 'do_kernel_configme', ensuring Rust readiness.
- Patch 04: Add kernel configuration support for Rust (via 'kernel-rust.scc'), enabling the Rust build options in kernel config.
- Patch 05: Fixed buildpaths errors when rust is enabled for kernel by appending --remap-path-prefix to RUST_DEBUG_REMAP
- Patch 06: split `HOSTCC` flag to align with to linux-yocto and fix build issue with make-mod-scripts recipe.
- Patch 07: Disabling ccache when rust-kernel is enabled for linux-yocto.
- Patch 08: Copy Rust kernel sources into kernel-devsrc build directory which will be required while running 'make prepare' in sdk.
- Patch 09: Added oe-selftest case for the Linux Rust sample.
- patch 10: Copying include/config/auto.conf in STAGING_KERNEL_BUILDDIR
- patch 11: Export artifacts needed for out-of-tree Rust compilation
- patch 12: Prepare out-of-tree rust module compilation
- patch 13: Added rust-out-of-tree-module recipe in meta-skeleton layer
- Patch 14: Fixed buildpaths errors for rust-out-of-tree-module recipe by appending --remap-path-prefix to RUST_DEBUG_REMAP
- patch 15: Added rust-out-of-tree selftest

Patches have been build-tested successfully on:
- qemuarm64
- qemux86-64

Benchmark test-result for x86-64:
+-------------------------------+------------+-----------+-----------+-----------+
| DISTRO_FEATURES               |   real     |   user    |    sys    |  FS usage |
+-------------------------------+------------+-----------+-----------+-----------+
| rust-kernel (enabled)         | 46m1.720s  | 0m28.864s | 0m3.696s  |   58 GB   |
| rust-kernel (disabled)        | 30m1.053s  | 0m20.091s | 0m2.748s  |   33 GB   |
+-------------------------------+------------+-----------+-----------+-----------+

The increased in time & fs is due to kernel rust dependencies in
linux-yocto.

Harish Sadineni (8):
  linux-yocto: conditionally add clang/rust/bindgen-cli-native to
    DEPENDS
  rust: install Rust library sources for 'make rustavailable' support
  kernel-yocto: enable Rust kernel support via 'make rustavailable'.
  linux-yocto: enable Rust support in kernel configuration
  kernel-yocto: Fix for buildpaths errors when rust is enabled for
    kernel
  make-mod-scripts: split `HOSTCC` flag to align with to linux-yocto
  kernel-devsrc: copying rust-kernel source to $kerneldir/build
  make-mod-scripts: fix for buildpath issues with rust-out-of-tree
    compilation

Yoann Congal (7):
  kernel-yocto.bbclass: Disable ccache when rust-kernel is enabled
  selftest/cases/runtime_test: Add test for Linux Rust sample
  kernel.bbclass: Copy include/config/auto.conf in
    STAGING_KERNEL_BUILDDIR
  kernel.bbclass: Export artifacts needed for out-of-tree Rust
    compilation
  module.bbclass: Prepare out-of-tree rust module compilation
  meta-skeleton: Add rust-out-of-tree-module recipe
  runtime_test: Add rust-out-of-tree selftest

 .../rust-out-of-tree-module_git.bb            | 18 ++++++++++
 meta/classes-recipe/kernel-yocto.bbclass      | 22 ++++++++++++
 meta/classes-recipe/kernel.bbclass            | 19 ++++++++++
 meta/classes-recipe/module.bbclass            |  8 +++++
 meta/lib/oeqa/selftest/cases/runtime_test.py  | 35 +++++++++++++++++++
 meta/recipes-devtools/rust/rust_1.92.0.bb     | 19 +++++++++-
 meta/recipes-kernel/linux/kernel-devsrc.bb    |  9 +++++
 meta/recipes-kernel/linux/linux-yocto.inc     |  2 ++
 meta/recipes-kernel/linux/linux-yocto_6.16.bb |  1 +
 meta/recipes-kernel/linux/linux-yocto_6.18.bb |  1 +
 .../make-mod-scripts/make-mod-scripts_1.0.bb  | 10 +++++-
 11 files changed, 142 insertions(+), 2 deletions(-)
 create mode 100644 meta-skeleton/recipes-kernel/rust-out-of-tree-module/rust-out-of-tree-module_git.bb

-- 
2.49.0


