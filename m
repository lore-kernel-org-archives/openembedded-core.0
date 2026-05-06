Return-Path: <Quan.Sun@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E168CD342C
	for <webhook@archiver.kernel.org>; Wed,  6 May 2026 21:49:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32072.1778104137593931562
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2026 14:48:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=VSb3L/tF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=95862363a1=quan.sun@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6467cRm9748474
	for <openembedded-core@lists.openembedded.org>; Wed, 6 May 2026 21:48:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=OrwyHFLl2082p5HuIJQ4
	2VK9VtUZGqByG9AwdaMJENA=; b=VSb3L/tF4L4YHQOVBCPGcpnMHxBJIUEAVrk+
	/T8NItI0hu0tzX+MgyH64k0wMBHfwlgi/+u6OvV+8+VQDMQYMIx04fOotP7Yu6uC
	pxjJeVZs+U0yMWTfKj4AIJBzWerRFH2MjopxrvwPUlV/8A5hqydwVz3wgrLsWula
	cRA2v+CRxp1ifyluVKYkX6ITMnJZ1wAT4wBhUd6dI2eNiL7tKAYJWpwnOxRZIAFi
	wpXZNWb0CF4LwUeEi21/KcMFRSclQjFPVOJOwE4r1xGXw/UhsDQ3Lepbcemzm7Yp
	gf4cbdrcvK0DnWe/yzTameEueOuz5S5Q/PTNLe1ReKxzVFdD8A==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013000.outbound.protection.outlook.com [40.93.201.0])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dw8pu5re5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 06 May 2026 21:48:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gvtoybq2mSKejA9UK7C3QbZyvtanCgIpXQqOT3k9xjvctUYEqxo/LT4j4GYh7slr08kZ7bhjZvhf0ZyvoOSQ96QfM4PCXAaK3e69Tx1HOXxcmxfjePU9Dih3hM4oIXIrpgh2Lxwrw2XWekt/XJYDNHNglECRwptya7zNKyGduZAA1PsedTxdI/5vCAPX0EOXig02sgvkXZwOs9f0eRdH5PbM2q9uaT+aJMMEnLfw4fzLJ2uPgRTfCh3wFnIKgSBZTrjmgycpNt6DDsb3GexXwiweUJPiWmhk11QsqGmJzTOvR9mzIlVzGXvP1eNkBwFJn45oncsCeqdWBiVQkbGASA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OrwyHFLl2082p5HuIJQ42VK9VtUZGqByG9AwdaMJENA=;
 b=KxPUha9CucNMw+Gj9XK3uX4VYmItBdr4Yjx6H+nyWSBwfylRkuUqqqrZ//TzT4QaJBAdJlRJPAJc/XEULa4QGFaxugvSQ/29IfE64Fb0Cidxl8IqW/UI8LyXzialEnUElnQakJk5XptqK3UOLQG9MnwvxL0D5Sd5r7pnEYHBSy7SdN3XPLCclixQJPynw/Y6hB8lbr3uOvHhRC3Jgx+mEkDOfKP16vuFYQBEJT7CNfi9wBaC9S6RpOvEasoDRq2ta/aG0/BDIIgkGEn8IkSi6cuv93G11LdoKjTlGk2B9M23S+JXql8Lww5r7JvHmqNlqKKfy8B+uD+3DYXMV3GwZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB7283.namprd11.prod.outlook.com (2603:10b6:208:439::10)
 by IA4PR11MB9059.namprd11.prod.outlook.com (2603:10b6:208:560::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Wed, 6 May
 2026 21:48:52 +0000
Received: from IA0PR11MB7283.namprd11.prod.outlook.com
 ([fe80::6e41:656f:120e:8e8]) by IA0PR11MB7283.namprd11.prod.outlook.com
 ([fe80::6e41:656f:120e:8e8%5]) with mapi id 15.20.9870.023; Wed, 6 May 2026
 21:48:52 +0000
From: Quan.Sun@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] qemu: upgrade 10.2.0 -> 11.0.0
Date: Wed,  6 May 2026 14:48:29 -0700
Message-ID: <20260506214835.1578529-1-Quan.Sun@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: DM6PR02CA0115.namprd02.prod.outlook.com
 (2603:10b6:5:1b4::17) To IA0PR11MB7283.namprd11.prod.outlook.com
 (2603:10b6:208:439::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7283:EE_|IA4PR11MB9059:EE_
X-MS-Office365-Filtering-Correlation-Id: 01f2ecf2-8703-4f9b-3371-08deabb94357
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|29003799003|25016099003|18002099003|12006099003|56012099003|38350700014|3023799003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	3VA5qkio+hRepjfEWXLarfbswwjRgyd2H/l+LHSn+bsy6oSKn1RLqNbt4exUidRHyJFmlRG+7/Wim8k/os+JV9f5RE/Iw7O1qNda50IfB3Fa3EJ0D8DQvmGumbWtc7vJTK0wtnZOK3UeCo+EYJqBvr1K0nbGE23M/LkeGkv/gFbwjiv5rvURVTviyJSTKS2kRDJAFAv+DU3SXwGSbJPKo//CTo+mg0PgsleoggKBHrYULM3mAZkwUnWgzbByZnEp/jBvJLiXzPGP2XkvB59k0jDLBJWkT9hURmEfdUiP1G1UrMKjOKaiWpWMaz/0XnDm6NvOAlFG+opRF1FNenHP/G0ba/SdeVpkbQ6W+HOq3mrs3g4NmCWiMy1pKhEa97CLrQrzI+0uiSvfsfpw+r8L9fZogWyEOG7lG2Sx9OM4HVwwnHD6NktwST7Hz4Q6tnbxlEooeA/fWE3vO4cOgK5fnlL98pr2bo3XmrOxZB7vpqgd1WhNoId/+XvVpwnpxDitp9UDTfBcHusnHa9yvuXXpOAvPXBG5ZvNl0zXm//OpDfyvyFi+7UAjaMnh6BwDJqvbLlTSOLiJ905xEj2RSM+a86FTd62rqGG5VScWATRcmGahsPZK+nk6fhY5R7Q+014evryb3JcDTOWJni2tmK08Pfs4r+4bRpFKS84XELzG5WKVI6WHvfEQDZOKXCBcKlI
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(29003799003)(25016099003)(18002099003)(12006099003)(56012099003)(38350700014)(3023799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bnNEWTBNcDd2ZkN1dmIwUlNRelVvL05GSHFPTWpRWG11VE1ESXdLMXZBdFBs?=
 =?utf-8?B?K1hsN1dMSms0NmJoSGZEQ0lNTzNrSmt2bW5xamxRY1pUdHZhWS9wMDFQTjI4?=
 =?utf-8?B?K1lXRDlNSmFsMW41YUVpQm9NdnVkeSt2T0ZzaGxySVNWVVNjTFkxcU52cEl6?=
 =?utf-8?B?MlpjdDdFU1VqTUlkQUtQVFI5azJYWWNJVERxUzlRR1FKSDVLcGt1K1A3blhB?=
 =?utf-8?B?Szdidkk0clM3R2NkSnRra1hrblROOTJQNFFwUE4yR1RIYW5oMEM0N2RIdXBK?=
 =?utf-8?B?WGl0aXA5bm5VWFF2TDZCWHEwUTQrWHBPMnhSR1ZmU3ZXUEd0SVFPRi9ZeGV5?=
 =?utf-8?B?Z1V2RUM1V1V2S3ovMFNPNTN5VUlTVkJMM05adDFmeXpNYTgyMWdGVW9nV05Q?=
 =?utf-8?B?dlc4N0tkc1hnem1nd0puenNyaWFJNDExcXJIRmJaMWREM2dRd1g1MnduZHp0?=
 =?utf-8?B?QTlVa0R1SnpjZkJpQlN4aWdTNGhibW9iekRuM0lDUk9oYzk1SUYrRUVMVnVs?=
 =?utf-8?B?blV5OWlDdE5VRHUyVEMvamVVU01VaXRSNUtRMzQ1TzlPSjZ5blNid1pIei9I?=
 =?utf-8?B?b3JaOFgzZWpPTW5hTUJ1N1JzMDdTL2srODJ6SHF4Nm1KL2JlOXJDVmZnRVBU?=
 =?utf-8?B?ZnovN0hGcHlGdy8zcktwUldzb3oyS0xlVnlVKzRramYraHFteEdFTkw1V3cz?=
 =?utf-8?B?MzNjOUtXenhSRUFSR0tSU2ZmbkkwakorVEJTY2FDNFY4WHlhRXpzVWhQR2Vi?=
 =?utf-8?B?bTBTbVJRbjJYRk0zcmJKQ2RBZS9yRWpWdFNrdytNSDduQi9wVzU0VFhxNmRk?=
 =?utf-8?B?cThIcnhjdDh0SVBBMmNocnUrWVFleExCR3d1ZVN1N1V1KzdWbUFJM1B4S0xM?=
 =?utf-8?B?ODM1eHdNa3djbTNZM3hkR3VDZFZ1eldKS0VOLy95NHZMekpCSG0xM0tTanNr?=
 =?utf-8?B?K3RaL1pVZk5QRXdIZmtaNEw0eUhkVVA1MlVEVlRaVGJaNUhBVktXN29XT2px?=
 =?utf-8?B?WDJWbHdiRWw2Rm1ZclBIa2lIUnRGMUJOWDJVUklNSXQ0dEZaZmN4eUczYWcy?=
 =?utf-8?B?V3B6SlQxaFRqdWdQZGVBa1A2QTJtYzd1VEhpR3FKc2o4TkNIUFNsbEhvUyt0?=
 =?utf-8?B?U05lK0VmNHlaWWVQQnU5U055Vi95RGN5aytieFF6aXpOOVd0VFhTNlRJcHpF?=
 =?utf-8?B?RU9pNkg1V1FXNGZOZG4rblBDQ1A1cktMOTl6OWFPQzkzYTdGT3lhRFNrSWhK?=
 =?utf-8?B?elhQUWdCTTR5eXI3ZldONitSeExmcXYyVlJkQ3ovOXovWURlT1BmME9xZ0E1?=
 =?utf-8?B?Zk9WV0Y5bXg1MVMyMWUzZUZDOW11UUFKMGwzeEduNHUyalpUY1NkT1Vab0d4?=
 =?utf-8?B?Vk9SbDB2aEYxRWVXelpuSTcxeUh1Wk05cWRENHhuQVhtZGdjQlNZamFTTXZp?=
 =?utf-8?B?L3paY3R2ZDI4TERPOStTQjV4Rk5nV09iTEVKU0pidXVzM2d3ZDhweElpY1dN?=
 =?utf-8?B?ZVNRM0lWbzI5NjNvNSswUVNyWk9sTERTUWNjUjRWUzJIVGJWcnN3U3UxVy9X?=
 =?utf-8?B?UDhKK2tLTUlsenRya2NYTEZSaVVZQ0lPZHBpdGhmQThRdytMTDI5VExYNWxr?=
 =?utf-8?B?bWIvSDJLZmJqSUVvKzNteFd3dkFkVmNLbkJOazUyamMvbis5OGdoK0tRWXZP?=
 =?utf-8?B?N2t4ckNwVkRxVU5lYTdXOXVyNmNXS05ITGIwMlBCMmVTK1ZuQ0hqTjFOcUdI?=
 =?utf-8?B?MlVxZzRpLzY1SXk3anhWYWNYTVgyVUxSbCtBZFVtU3RIRWF3RWpUMHN1RVZR?=
 =?utf-8?B?WURRTkVhbGJ5dzNBaGZmNVhLZmxkMnF4SE44eFZOazNzUHdyaWJRQXYxL2F6?=
 =?utf-8?B?cFhnNHd6NWs5ZWJkeTJRcEtYWEE2TTJ2Vms2dWExVmlodG01OWdnMlNWbjgr?=
 =?utf-8?B?UGtjeCtnSytzUk1vZUZMSTQ1cnVRbmx0aHBGMEhiNTRzblN6UFloSE05Tkl1?=
 =?utf-8?B?UmxpSmVSY3RpbWtXVzlXRFpKaTNpRUNsc01EUDMwaXhSOGIreTYyN05jYmtM?=
 =?utf-8?B?VUp1V0JTWUk3NlMwck9PWjRsdjBSdlZUVW51Z0FpTmFwbmpMd2wyTzIxcU4y?=
 =?utf-8?B?TWJzYjZRamMwSGgraE82WEpYRlgwWW02V0hJQXQyV0drWWUrWDNyUUNFZEwv?=
 =?utf-8?B?ZkFTRk1hdVV5SGgzQVY0b3VGU3AzYXVlQTJWNmxjay8zYlJ3VHc3a0pBY0Js?=
 =?utf-8?B?dnBQUjFqZVUrRUlxelRvNkx5VjJuMy82SUtleVE0b2ZtcDM3SkJDUTJSTnYx?=
 =?utf-8?B?QXFxMGt0SVZ6aloxdXBMRXhqZGl4WjA0VEw3Y0p2T1YvMmlTWUVtdz09?=
X-Exchange-RoutingPolicyChecked: 
	Pa2UqB9sx5+QRRK5KqosPE3jOKt8x9gGvoFxmhw9Qf39W1iEL/I1M06jXN0T1lglrkheuX+6qbuoBcUb4ob0OsDG/hsV20iUzZhaMaz/XNItD9UYiHALRPlOreg/PmoDr3hFwbU16gFOGo3fK3eF74Mb7nud+6v7uR6zivnxvKoLIiaWH/jK+S9wDYjQiVEBTBumgJLR8yiLGwPwWcgP3h4VlaZsU4EiIvvW/xaWU3mK0o0depLv2L7LgdENpJh/NaakrrWVfgk1BvqpB6VvKeXTcflWB+Z6IhLfpZITN1JTdKD+GuMTs+ADk8XnKr4wUHVvNac7eDAUjhgQk7vI2g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01f2ecf2-8703-4f9b-3371-08deabb94357
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 21:48:52.2354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3nBd6Q/twFG/t/AuylS4W8eciRkDKH6dd2G50J4C+VZLuRHlz6549pCBqKdeyT2d1MXQGXUIHcS5UMFiW7mtEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9059
X-Authority-Analysis: v=2.4 cv=AdaB2XXG c=1 sm=1 tr=0 ts=69fbb748 cx=c_pps
 a=snd9/+/+5efdJOckOpJmHA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=p0WdMEafAAAA:8 a=ID6ng7r3AAAA:8 a=mDV3o1hIAAAA:8 a=D2nq_zG4AAAA:20
 a=kmYkUENqAAAA:8 a=t7CeM3EgAAAA:8 a=KKAkSRfTAAAA:8 a=69wJf7TsAAAA:8
 a=AUd_NHdVAAAA:8 a=ag1SF4gXAAAA:8 a=pGLkceISAAAA:8 a=ilKATfAMAAAA:8
 a=0j-U6ke3OHZIqCWh_BsA:9 a=IAUN8CZL_BI60Izz:21 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=AkheI1RvQwOzcTXhi5f4:22 a=p9kz6gysRiz6SGr9lVkz:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=cvBusfyB2V15izCimMoJ:22 a=Fg1AiH1G6rFz08G2ETeA:22
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=73awMTU50e6eLoBjGbzZ:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDIxMyBTYWx0ZWRfX6x7IOIEW27eN
 X3BMNMeqmJVH7WmIbiJfpJmXXRnyfgyHesOEyHXDQJAIHkLl1r0zJS7hN495LXXV/XVj+orYB+y
 kkD1Veld2frpJwKvgGwUsLaYrinGx9zu6EWVzARNLTOF2DMka+kdTtpg++hq8ixs07HXSxsxlbw
 0Gkd24SUUosNrNSDvEEDFHu/1E0vBybRghxF6Ca9TOOYjFSf8cl3KVc1m1px35FzrtH+d8bJbdb
 bOaKRqrUVq7nuaTFmiKwKCVwlRqo5IuspjbfrPrNZ6FPcuhZVW4nfCWq7c7grLZLGTb8TqPu/EV
 EJ5I6qvHrIEqlAOxt6y7BQIsMsj5fqZg7KlfizpXhy9obZGVDV6wkwGDfxflLhnaQ6ZDXyyFlKS
 Qm1Eqnoo425sruMBfNCsziyHzUFBaqQXi1jTl+vT9ixYO2odY7LQV5GOAAslar9eNPtCIBbX+h2
 WqB//hiXRnuG+lDRzpg==
X-Proofpoint-ORIG-GUID: PPkmivgzLKf_rLtPnxEgUZgGxOC_coGV
X-Proofpoint-GUID: PPkmivgzLKf_rLtPnxEgUZgGxOC_coGV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060213
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6467cRm9748474
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 May 2026 21:49:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236554

From: Quan Sun <Quan.Sun@windriver.com>

Key changes:
- The qemu.qmp library was removed from the main QEMU repository
  (see commit e1e49b35b3c3). Source the standalone python-qemu-qmp
  v0.0.6 from https://gitlab.com/qemu-project/python-qemu-qmp to
  continue providing QMP support for testimage.
- Refresh patches for new version.

AI-Generated: Uses kiro-cli

Signed-off-by: Quan Sun <Quan.Sun@windriver.com>
---
 ...native_10.2.0.bb =3D> qemu-native_11.0.0.bb} |  1 -
 ...10.2.0.bb =3D> qemu-system-native_11.0.0.bb} | 10 ++--
 meta/recipes-devtools/qemu/qemu.inc           |  7 ++-
 ...load.c-Correction-to-HWCAP2-accessor.patch | 42 ---------------
 ...n-environment-space-to-boot-loader-q.patch |  6 +--
 .../0002-apic-fixup-fallthrough-to-PIC.patch  |  6 +--
 ...mu-Do-not-include-file-if-not-exists.patch |  6 +--
 ...er-space-mmap-tweaks-to-address-musl.patch | 22 +++-----
 .../qemu/0006-qemu-Determinism-fixes.patch    |  4 +-
 ...d-use-relative-path-to-refer-to-file.patch |  6 +--
 ...and-MAP_SHARED_VALIDATE-on-needed-li.patch |  2 +-
 ...gure-lookup-meson-exutable-from-PATH.patch | 10 ++--
 ...ject-include-paths-for-standalone-bu.patch | 53 +++++++++++++++++++
 ...and-the-python-venv-aren-t-used-for-.patch | 10 ++--
 .../qemu/qemu/fix-strerrorname_np.patch       | 35 ------------
 .../qemu/{qemu_10.2.0.bb =3D> qemu_11.0.0.bb}   |  0
 16 files changed, 96 insertions(+), 124 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu-native_10.2.0.bb =3D> qemu-nativ=
e_11.0.0.bb} (99%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_10.2.0.bb =3D> qem=
u-system-native_11.0.0.bb} (68%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-linux-user-elflo=
ad.c-Correction-to-HWCAP2-accessor.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0010-meson-fix-subpro=
ject-include-paths-for-standalone-bu.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.p=
atch
 rename meta/recipes-devtools/qemu/{qemu_10.2.0.bb =3D> qemu_11.0.0.bb} (=
100%)

diff --git a/meta/recipes-devtools/qemu/qemu-native_10.2.0.bb b/meta/reci=
pes-devtools/qemu/qemu-native_11.0.0.bb
similarity index 99%
rename from meta/recipes-devtools/qemu/qemu-native_10.2.0.bb
rename to meta/recipes-devtools/qemu/qemu-native_11.0.0.bb
index 26fa84c180..a77953529b 100644
--- a/meta/recipes-devtools/qemu/qemu-native_10.2.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-native_11.0.0.bb
@@ -7,4 +7,3 @@ require qemu-native.inc
 EXTRA_OECONF:append =3D " --target-list=3D${@get_qemu_usermode_target_li=
st(d)} --disable-tools --disable-install-blobs --disable-guest-agent"
=20
 PACKAGECONFIG ??=3D "pie"
-
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_10.2.0.bb b/me=
ta/recipes-devtools/qemu/qemu-system-native_11.0.0.bb
similarity index 68%
rename from meta/recipes-devtools/qemu/qemu-system-native_10.2.0.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_11.0.0.bb
index 2e4f7328ad..c27d69d2cf 100644
--- a/meta/recipes-devtools/qemu/qemu-system-native_10.2.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-system-native_11.0.0.bb
@@ -7,6 +7,9 @@ require qemu-native.inc
 # and avoid file clashes
 DEPENDS +=3D "glib-2.0-native zlib-native pixman-native qemu-native"
=20
+SRC_URI +=3D "git://gitlab.com/qemu-project/python-qemu-qmp.git;protocol=
=3Dhttps;branch=3Dmain;destsuffix=3Dpython-qemu-qmp;name=3Dqemu-qmp"
+SRCREV_qemu-qmp =3D "82006cb788d27b090a8b84fc7831feb9c528bcdc"
+
 EXTRA_OECONF:append =3D " --target-list=3D${@get_qemu_system_target_list=
(d)}"
=20
 PACKAGECONFIG ??=3D "fdt alsa kvm pie slirp png pixman sdl \
@@ -26,8 +29,9 @@ do_install:append() {
     rm -rf ${D}${datadir}/icons/
     rm -rf ${D}${includedir}/qemu-plugin.h
=20
-    # Install qmp.py to be used with testimage
+    # Install python-qemu-qmp for use with testimage (upstream removed
+    # qemu.qmp from the main QEMU repository in favor of the standalone
+    # project at https://gitlab.com/qemu-project/python-qemu-qmp)
     install -d ${D}${libdir}/qemu-python/qmp/
-    install -D ${S}/python/qemu/qmp/* ${D}${libdir}/qemu-python/qmp/
+    cp -r ${UNPACKDIR}/python-qemu-qmp/qemu/qmp/* ${D}${libdir}/qemu-pyt=
hon/qmp/
 }
-
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index 7aa593bc5d..5cadbaa03e 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -22,7 +22,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da3b50d8b88dc=
c0eb3d7d39b760b9e821 \
 SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://powerpc_rom.bin \
            file://run-ptest \
-           file://fix-strerrorname_np.patch \
            file://0001-qemu-Add-addition-environment-space-to-boot-loade=
r-q.patch \
            file://0002-apic-fixup-fallthrough-to-PIC.patch \
            file://0004-qemu-Do-not-include-file-if-not-exists.patch \
@@ -32,15 +31,15 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.t=
ar.xz \
            file://0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed=
-li.patch \
            file://0010-configure-lookup-meson-exutable-from-PATH.patch \
            file://0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-f=
or-.patch \
-           file://0001-linux-user-elfload.c-Correction-to-HWCAP2-accesso=
r.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
+           file://0010-meson-fix-subproject-include-paths-for-standalone=
-bu.patch \
            "
 # file index at download.qemu.org isn't reliable: https://gitlab.com/qem=
u-project/qemu-web/-/issues/9
 UPSTREAM_CHECK_URI =3D "https://www.qemu.org"
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
=20
-SRC_URI[sha256sum] =3D "9e30ad1b8b9f7b4463001582d1ab297f39cfccea5d08540c=
0ca6d6672785883a"
+SRC_URI[sha256sum] =3D "c04ca36012653f32d11c674d370cf52a710e7d3f18c2d8b6=
3e4932052a4854d6"
=20
 CVE_STATUS[CVE-2007-0998] =3D "not-applicable-config: The VNC server can=
 expose host files uder some circumstances. We don't enable it by default=
."
=20
@@ -74,7 +73,7 @@ do_install_ptest() {
 	find ${D}${PTEST_PATH}/tests -type f -name "*.[Sshcodp]" | xargs -i rm =
-rf {}
=20
 	# Don't check the file genreated by configure
-	sed -i -e "1s,#!/usr/bin/bash,#!${base_bindir}/bash," ${D}${PTEST_PATH}=
/tests/data/acpi/disassemle-aml.sh
+	sed -i -e "1s,#!/usr/bin/bash,#!${base_bindir}/bash," ${D}${PTEST_PATH}=
/tests/data/acpi/disassemble-aml.sh
=20
 	# Strip the paths from the QEMU variable, we can use PATH
 	makfiles=3D$(find ${D}${PTEST_PATH} -name "*.mak")
diff --git a/meta/recipes-devtools/qemu/qemu/0001-linux-user-elfload.c-Co=
rrection-to-HWCAP2-accessor.patch b/meta/recipes-devtools/qemu/qemu/0001-=
linux-user-elfload.c-Correction-to-HWCAP2-accessor.patch
deleted file mode 100644
index 47d6f41385..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0001-linux-user-elfload.c-Correctio=
n-to-HWCAP2-accessor.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From c333f9c4ee212297f3b9a8a6ef62396a63c48e61 Mon Sep 17 00:00:00 2001
-From: Jim MacArthur <jim.macarthur@linaro.org>
-Date: Tue, 6 Jan 2026 15:40:48 +0000
-Subject: [PATCH] linux-user/elfload.c: Correction to HWCAP2 accessor
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-get_elf_hwcap was used when get_elf_hwcap2 should have been.
-
-Cc: qemu-stable@nongnu.org
-Fixes: fcac98d0ba8b ("linux-user: Remove ELF_HWCAP2")
-Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3259
-Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
-Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
-Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
-Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
-Message-ID: <20260106-fix-hwcap2-sve2-v1-1-1d70dff63370@linaro.org>
-
-Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit=
/c333f9c4ee212297f3b9a8a6ef62396a63c48e61]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- linux-user/elfload.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/linux-user/elfload.c b/linux-user/elfload.c
-index 0002d5be2f..35471c0c9a 100644
---- a/linux-user/elfload.c
-+++ b/linux-user/elfload.c
-@@ -708,7 +708,7 @@ static abi_ulong create_elf_tables(abi_ulong p, int =
argc, int envc,
-     NEW_AUX_ENT(AT_EXECFN, info->file_string);
-=20
-     if (HAVE_ELF_HWCAP2) {
--        NEW_AUX_ENT(AT_HWCAP2, get_elf_hwcap(thread_cpu));
-+        NEW_AUX_ENT(AT_HWCAP2, get_elf_hwcap2(thread_cpu));
-     }
-     if (u_base_platform) {
-         NEW_AUX_ENT(AT_BASE_PLATFORM, u_base_platform);
---=20
-2.34.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-envir=
onment-space-to-boot-loader-q.patch b/meta/recipes-devtools/qemu/qemu/000=
1-qemu-Add-addition-environment-space-to-boot-loader-q.patch
index bc8dace013..98aa6b6387 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-=
space-to-boot-loader-q.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-=
space-to-boot-loader-q.patch
@@ -1,4 +1,4 @@
-From f2d9bc614f7edf66412209aba78aa086e65dc75e Mon Sep 17 00:00:00 2001
+From a84184c98cf296954e0c757604e969b8565eb474 Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Fri, 28 Mar 2014 17:42:43 +0800
 Subject: [PATCH] qemu: Add addition environment space to boot loader
@@ -18,10 +18,10 @@ Signed-off-by: Roy Li <rongqing.li@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/hw/mips/malta.c b/hw/mips/malta.c
-index cbdbb2105..62681fdae 100644
+index 812ff64d8..daf929943 100644
 --- a/hw/mips/malta.c
 +++ b/hw/mips/malta.c
-@@ -65,7 +65,7 @@
+@@ -66,7 +66,7 @@
  #define ENVP_PADDR          0x2000
  #define ENVP_VADDR          cpu_mips_phys_to_kseg0(NULL, ENVP_PADDR)
  #define ENVP_NB_ENTRIES     16
diff --git a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-=
to-PIC.patch b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthroug=
h-to-PIC.patch
index bfc85f4842..ad00f24482 100644
--- a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.=
patch
+++ b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.=
patch
@@ -1,4 +1,4 @@
-From 945af9ecc80653955cbdbb7d3e28dce61795b251 Mon Sep 17 00:00:00 2001
+From 0a688e763d91c2e0e11cbe960f405442a9f35417 Mon Sep 17 00:00:00 2001
 From: Mark Asselstine <mark.asselstine@windriver.com>
 Date: Tue, 26 Feb 2013 11:43:28 -0500
 Subject: [PATCH] apic: fixup fallthrough to PIC
@@ -33,10 +33,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/hw/intc/apic.c b/hw/intc/apic.c
-index aad253a..212b01f 100644
+index 8766ed00b..581fc6deb 100644
 --- a/hw/intc/apic.c
 +++ b/hw/intc/apic.c
-@@ -740,7 +740,7 @@ int apic_accept_pic_intr(APICCommonState *s)
+@@ -741,7 +741,7 @@ int apic_accept_pic_intr(APICCommonState *s)
  {
      uint32_t lvt0;
 =20
diff --git a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-fil=
e-if-not-exists.patch b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-=
include-file-if-not-exists.patch
index 2e738abaa3..4b6ac54445 100644
--- a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-no=
t-exists.patch
+++ b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-no=
t-exists.patch
@@ -1,4 +1,4 @@
-From f8c1614b204c1d64af906dc70dbf4a1534eb6b38 Mon Sep 17 00:00:00 2001
+From b38315a5a6f9fc033c72bb94ff258bb4b1ac8dd3 Mon Sep 17 00:00:00 2001
 From: Oleksiy Obitotskyy <oobitots@cisco.com>
 Date: Wed, 25 Mar 2020 21:21:35 +0200
 Subject: [PATCH] qemu: Do not include file if not exists
@@ -16,10 +16,10 @@ Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com=
>
  1 file changed, 2 insertions(+)
=20
 diff --git a/linux-user/syscall.c b/linux-user/syscall.c
-index c236b2834..2a3527a87 100644
+index f4b74ad35..3da51ea83 100644
 --- a/linux-user/syscall.c
 +++ b/linux-user/syscall.c
-@@ -119,7 +119,9 @@
+@@ -117,7 +117,9 @@
  #include <linux/blkpg.h>
  #include <netpacket/packet.h>
  #include <linux/netlink.h>
diff --git a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-spac=
e-mmap-tweaks-to-address-musl.patch b/meta/recipes-devtools/qemu/qemu/000=
5-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
index ffbbb1ab32..f270c6a035 100644
--- a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-=
tweaks-to-address-musl.patch
+++ b/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-=
tweaks-to-address-musl.patch
@@ -1,4 +1,4 @@
-From 3621615790270449bf9c8a0777e8ef28eb762bf9 Mon Sep 17 00:00:00 2001
+From e4abb937ba5a6a476d31886e71e67006df22a664 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 8 Jan 2021 17:27:06 +0000
 Subject: [PATCH] qemu: Add some user space mmap tweaks to address musl 3=
2 bit
@@ -18,30 +18,22 @@ rather than ENOMEM so adjust the other part of the te=
st to this.
 Upstream-Status: Submitted [https://lists.gnu.org/archive/html/qemu-deve=
l/2021-01/msg01355.html]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
 ---
- linux-user/mmap.c | 10 +++++++---
- 1 file changed, 7 insertions(+), 3 deletions(-)
+ linux-user/mmap.c | 5 +++++
+ 1 file changed, 5 insertions(+)
=20
 diff --git a/linux-user/mmap.c b/linux-user/mmap.c
-index 002e1e668..912839dec 100644
+index b635b6a21..a5a617516 100644
 --- a/linux-user/mmap.c
 +++ b/linux-user/mmap.c
-@@ -1109,12 +1109,16 @@ abi_long target_mremap(abi_ulong old_addr, abi_u=
long old_size,
+@@ -1113,6 +1113,11 @@ abi_long target_mremap(abi_ulong old_addr, abi_ul=
ong old_size,
      int prot;
      void *host_addr;
 =20
--    if (!guest_range_valid_untagged(old_addr, old_size) ||
--        ((flags & MREMAP_FIXED) &&
 +    if (!guest_range_valid_untagged(old_addr, old_size)) {
 +        errno =3D EFAULT;
 +        return -1;
 +    }
-+   =20
-+    if (((flags & MREMAP_FIXED) &&
++
+     if (((flags & MREMAP_FIXED) &&
           !guest_range_valid_untagged(new_addr, new_size)) ||
          ((flags & MREMAP_MAYMOVE) =3D=3D 0 &&
-          !guest_range_valid_untagged(old_addr, new_size))) {
--        errno =3D ENOMEM;
-+        errno =3D EINVAL;
-         return -1;
-     }
-=20
diff --git a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.=
patch b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
index 5b24c18916..0d7974fcdc 100644
--- a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
+++ b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
@@ -1,4 +1,4 @@
-From 8b28a9376074067bc2d84d4f77d5c7a42433b31b Mon Sep 17 00:00:00 2001
+From e891928d2248e186c65979cf5a2ba0cff9d00824 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Mon, 1 Mar 2021 13:00:47 +0000
 Subject: [PATCH] qemu: Determinism fixes
@@ -11,6 +11,8 @@ meson to pass relative paths but we can fix that in the=
 script.
=20
 Upstream-Status: Pending [some version of all/part of this may be accept=
ed]
 RP 2021/3/1
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 ---
  scripts/decodetree.py | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-r=
elative-path-to-refer-to-file.patch b/meta/recipes-devtools/qemu/qemu/000=
7-tests-meson.build-use-relative-path-to-refer-to-file.patch
index a58c936d06..275c500894 100644
--- a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative=
-path-to-refer-to-file.patch
+++ b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative=
-path-to-refer-to-file.patch
@@ -1,4 +1,4 @@
-From 097b75ad8310143decab92f6d1744144e7a4809f Mon Sep 17 00:00:00 2001
+From ac9a866ac807cb1542f26df07b4aad3a06342a99 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 14 Jan 2021 06:33:04 +0000
 Subject: [PATCH] tests/meson.build: use relative path to refer to files
@@ -17,10 +17,10 @@ Signed-off-by: Changqing Li <changqing.li@windriver.c=
om>
  1 file changed, 3 insertions(+), 3 deletions(-)
=20
 diff --git a/tests/unit/meson.build b/tests/unit/meson.build
-index d5248ae51..2c581f055 100644
+index 41e8b06c3..ce5df4957 100644
 --- a/tests/unit/meson.build
 +++ b/tests/unit/meson.build
-@@ -127,17 +127,17 @@ endif
+@@ -124,17 +124,17 @@ endif
 =20
  if have_system
    tests +=3D {
diff --git a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP=
_SHARED_VALIDATE-on-needed-li.patch b/meta/recipes-devtools/qemu/qemu/000=
8-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
index af0eafb65f..f6e563ad80 100644
--- a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED=
_VALIDATE-on-needed-li.patch
+++ b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED=
_VALIDATE-on-needed-li.patch
@@ -1,4 +1,4 @@
-From 9d5deb767523ea0d1aeecb9960244c702530acad Mon Sep 17 00:00:00 2001
+From c0bfd2c5556afcf4413c81b3fda54a62f2bdd8c8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 21 Mar 2022 10:09:38 -0700
 Subject: [PATCH] Define MAP_SYNC and MAP_SHARED_VALIDATE on needed linux
diff --git a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-=
exutable-from-PATH.patch b/meta/recipes-devtools/qemu/qemu/0010-configure=
-lookup-meson-exutable-from-PATH.patch
index db88766cf6..430b1aa509 100644
--- a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutabl=
e-from-PATH.patch
+++ b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutabl=
e-from-PATH.patch
@@ -1,4 +1,4 @@
-From aaec67c133dddda7204d23964732b4b788cbc9ce Mon Sep 17 00:00:00 2001
+From e357ac91b04f733148defe8c133ae8b2085a9a23 Mon Sep 17 00:00:00 2001
 From: =3D?UTF-8?q?Martin=3D20Hundeb=3DC3=3DB8ll?=3D <martin@geanix.com>
 Date: Wed, 22 May 2024 14:02:55 +0200
 Subject: [PATCH] configure: lookup meson exutable from PATH
@@ -13,10 +13,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  1 file changed, 1 insertion(+), 4 deletions(-)
=20
 diff --git a/configure b/configure
-index 82cace1..83bbda9 100755
+index eea903067..217af781f 100755
 --- a/configure
 +++ b/configure
-@@ -993,10 +993,7 @@ get_pwd() {
+@@ -981,10 +981,7 @@ get_pwd() {
      fi
  }
 =20
@@ -26,5 +26,5 @@ index 82cace1..83bbda9 100755
 -fi
 +meson=3D`which meson`
 =20
- # Conditionally ensure Sphinx is installed.
-=20
+ # On Haiku, meson might show up in a "non-packaged" subfolder instead, =
see
+ # https://github.com/haiku/haiku/blob/r1beta5/docs/user/storage/storage=
intro.dox
diff --git a/meta/recipes-devtools/qemu/qemu/0010-meson-fix-subproject-in=
clude-paths-for-standalone-bu.patch b/meta/recipes-devtools/qemu/qemu/001=
0-meson-fix-subproject-include-paths-for-standalone-bu.patch
new file mode 100644
index 0000000000..5258b6db5f
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0010-meson-fix-subproject-include-p=
aths-for-standalone-bu.patch
@@ -0,0 +1,53 @@
+From f013e84d382bc1bd7d49206bdf47c689b0c6fbb5 Mon Sep 17 00:00:00 2001
+From: Quan Sun <Quan.Sun@windriver.com>
+Date: Fri, 1 May 2026 13:53:24 -0700
+Subject: [PATCH] meson: fix subproject include paths for standalone buil=
ds
+
+Upstream-Status: Inappropriate [OE-specific]
+
+Signed-off-by: Quan Sun <Quan.Sun@windriver.com>
+---
+ subprojects/libvduse/meson.build      | 3 ++-
+ subprojects/libvhost-user/meson.build | 9 ++++++---
+ 2 files changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/subprojects/libvduse/meson.build b/subprojects/libvduse/mes=
on.build
+index 3e3b53da3..80114f431 100644
+--- a/subprojects/libvduse/meson.build
++++ b/subprojects/libvduse/meson.build
+@@ -10,7 +10,8 @@ add_project_arguments(cc.get_supported_arguments('-Wsi=
gn-compare',
+
+ libvduse =3D static_library('vduse',
+                           files('libvduse.c'),
+-                          c_args: '-D_GNU_SOURCE')
++                          c_args: '-D_GNU_SOURCE',
++                          include_directories: include_directories('.',=
 '../..', '../../include'))
+
+ libvduse_dep =3D declare_dependency(link_with: libvduse,
+                                   include_directories: include_director=
ies('.'))
+diff --git a/subprojects/libvhost-user/meson.build b/subprojects/libvhos=
t-user/meson.build
+index a18014e7f..6d469038c 100644
+--- a/subprojects/libvhost-user/meson.build
++++ b/subprojects/libvhost-user/meson.build
+@@ -14,15 +14,18 @@ glib =3D dependency('glib-2.0')
+ vhost_user =3D static_library('vhost-user',
+                             files('libvhost-user.c'),
+                             dependencies: threads,
+-                            c_args: '-D_GNU_SOURCE')
++                            c_args: '-D_GNU_SOURCE',
++                            include_directories: include_directories('.=
', '../..', '../../include'))
+
+ executable('link-test', files('link-test.c'),
+-           link_whole: vhost_user)
++           link_whole: vhost_user,
++           include_directories: include_directories('.', '../..', '../.=
./include'))
+
+ vhost_user_glib =3D static_library('vhost-user-glib',
+                                  files('libvhost-user-glib.c'),
+                                  link_with: vhost_user,
+-                                 dependencies: glib)
++                                 dependencies: glib,
++                                 include_directories: include_directori=
es('.', '../..', '../../include'))
+
+ vhost_user_dep =3D declare_dependency(link_with: vhost_user_glib,
+                                     dependencies: glib,
diff --git a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the=
-python-venv-aren-t-used-for-.patch b/meta/recipes-devtools/qemu/qemu/001=
1-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
index d04596d313..040931a941 100644
--- a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python=
-venv-aren-t-used-for-.patch
+++ b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python=
-venv-aren-t-used-for-.patch
@@ -1,4 +1,4 @@
-From c9f174b2f7b43e59e91f88c75c8b3e2ee30bfcdd Mon Sep 17 00:00:00 2001
+From 70fa360e5bf72b28960747da47d9b85e650ad312 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 22 May 2024 13:58:23 +0200
 Subject: [PATCH] qemu: Ensure pip and the python venv aren't used for me=
son
@@ -29,10 +29,10 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfo=
undation.org>
  1 file changed, 2 insertions(+), 2 deletions(-)
=20
 diff --git a/configure b/configure
-index 84e429409..1a9585e8e 100755
+index 217af781f..cf8666337 100755
 --- a/configure
 +++ b/configure
-@@ -981,14 +981,14 @@ python=3D"$(command -v "$python")"
+@@ -951,14 +951,14 @@ python=3D"$(command -v "$python")"
  echo "python determined to be '$python'"
  echo "python version: $($python --version)"
 =20
@@ -47,5 +47,5 @@ index 84e429409..1a9585e8e 100755
 -mkvenv=3D"$python ${source_path}/python/scripts/mkvenv.py"
 +mkvenv=3Dtrue
 =20
- # Finish preparing the virtual environment using vendored .whl files
-=20
+ # Finish preparing the virtual environment using vendored .whl files.
+ # Even if PyPI is allowed, we disallow it here to force installation
diff --git a/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch b/=
meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
deleted file mode 100644
index 524e20a3dd..0000000000
--- a/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 475dbdbee7ff878d113f45a1a623e9abbf0e55f3 Mon Sep 17 00:00:00 2001
-From: Natanael Copa <ncopa@alpinelinux.org>
-Date: Wed, 18 Sep 2024 16:19:37 -0700
-Subject: [PATCH] target/riscv/kvm: do not use non-portable strerrorname_=
np()
-
-strerrorname_np is non-portable and breaks building with musl libc.
-
-Use strerror(errno) instead, like we do other places.
-
-Upstream-Status: Submitted [https://mail.gnu.org/archive/html/qemu-stabl=
e/2023-12/msg00069.html]
-
-Cc: qemu-stable@nongnu.org
-Fixes: commit 082e9e4a58ba (target/riscv/kvm: improve 'init_multiext_cfg=
' error
-msg)
-Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2041
-Buglink: https://gitlab.alpinelinux.org/alpine/aports/-/issues/15541
-Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
----
- target/riscv/kvm/kvm-cpu.c | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
-index e06d2126b..e1cc02fba 100644
---- a/target/riscv/kvm/kvm-cpu.c
-+++ b/target/riscv/kvm/kvm-cpu.c
-@@ -1994,8 +1994,7 @@ static bool kvm_cpu_realize(CPUState *cs, Error **=
errp)
-     if (riscv_has_ext(&cpu->env, RVV)) {
-         ret =3D prctl(PR_RISCV_V_SET_CONTROL, PR_RISCV_V_VSTATE_CTRL_ON=
);
-         if (ret) {
--            error_setg(errp, "Error in prctl PR_RISCV_V_SET_CONTROL, co=
de: %s",
--                       strerrorname_np(errno));
-+            error_setg(errp, "Error in prctl PR_RISCV_V_SET_CONTROL, er=
ror %d", errno);
-             return false;
-         }
-     }
diff --git a/meta/recipes-devtools/qemu/qemu_10.2.0.bb b/meta/recipes-dev=
tools/qemu/qemu_11.0.0.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_10.2.0.bb
rename to meta/recipes-devtools/qemu/qemu_11.0.0.bb
--=20
2.49.0


