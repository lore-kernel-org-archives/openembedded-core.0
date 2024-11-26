Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BF56D5A6ED
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 07:55:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.41054.1732607750256288534
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 23:55:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=10608bb639=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQ5DvKD021849
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 23:55:49 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 433feq2k6m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 23:55:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c3kctzGTZE6U5EaNBfITWx86MI/+YGPxslIDkg7TRi8RoFNl7A6+M0zYxMuvDm5+BYzvQvj0CHFWRIvwcsQv93B6umhN8CBMe/Z0UULg2SZWLQH8Mey81clok3TdfA0bYGfVNgKASZF4O7ctvXofoR4eimBiOrzrtnhdwo4uocZ2EufkNK2nWiBvh/XtFao4QcxD1a07swMWXglCoHwauBZRFQai13oXTVZrrr7f33DrhRD4lJekWl28CzlbE+fwvYpQi/wD1SvqNggYLWLq3+CFPoS52R/gV/SHHv6T3p3B4sn6eRwfxyFP4kqIeWM1kEaYYr/eSgZBEOGi49RexQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rPYXcc4Lw37MLZnDrwZQZTL7NVYBdx9erOL/JVA2M7I=;
 b=nWQHdnusRfz6gkqYZDhSMK8xzEoFSVUbMPfpZlgDyXxYqHNuEP2zXySqjEXO10ujeWrXmvl5qg1P1LifdKrlKgggtzP4Sgd2bileieNLdzhPZrtpkiL4dV3KukDqAP5IpxWEmaVOpDg+vQcajYC7qE/NjAJ0eqi168T8IBL3CVBfkEoN0oisbxIVFWqLrLWJn6+/KuEhGNiOuqKPGcYAq6nlY+XAUQ8xwX6OPvuqtm9I6F7KKHm12c1bWJHTr2Q0U3M4GxrOjHiE6vn/AwbhEOphTkyGE4tgMl9uzv6znlH9d/4BTuY5F9c5wbl+eAGCmhPQHdg5nkjYdb00RpWuZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS7PR11MB6293.namprd11.prod.outlook.com (2603:10b6:8:97::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Tue, 26 Nov
 2024 07:55:44 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 07:55:44 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone][PATCH] coreutils: fix CVE-2024-0684
Date: Mon, 25 Nov 2024 23:55:34 -0800
Message-Id: <20241126075534.2340778-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: BY5PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::23) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DS7PR11MB6293:EE_
X-MS-Office365-Filtering-Correlation-Id: bc45fa07-5e72-47b7-05f8-08dd0defbafa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NktDU203Y3NsdDFPc21PTnlzbFVZYkNaTENDSEVVcStHZHlDUlhXdnpiUXVq?=
 =?utf-8?B?UXRCMjBWb0FnQkNKWElRMGR1aFV0TmhqcmdOM1JoNVRnVkNxNlZqTmZoNmxu?=
 =?utf-8?B?bnlraTdDNWxlWDFRRUFOUStyMXkzU0h6ZzJyTnJsSFd0a0pSeEFEQktkOElH?=
 =?utf-8?B?bXE4aE1RZmRXQzNVajdRUkJTaHVVOXNESVlVRjFCNlJrYTdXc0N5bEY1R3dH?=
 =?utf-8?B?RnUxdU5XVkN5ZVI4dGhCYmRCMjlnOXZ3TEZnNnVSVW4rQVFwSXBLVmlsSGRS?=
 =?utf-8?B?aGxZNExzYjhQUkdxbnRhd0Q1TFBlSE52bzkybjV6SWt0TGxUL05LNk52TzFT?=
 =?utf-8?B?bGE2TThaOVRCcHIzN2ZjbmdTLzlKcWcrYWZtMG8yempwRjZUZzNsbzV5Tzk2?=
 =?utf-8?B?RlZTZVgrcDE2YVdQdXBiRFBaMjZ3WFBJU2ZYTkVLYTRKaEJ6Q0VvL3F5Nk9s?=
 =?utf-8?B?YTFheTRBdWtCbm1idHNkOGRuNDZqOG1BeWZkcTk4U1h2QUFtVTFJbzlGSmx6?=
 =?utf-8?B?NnN3NjcrbFZMTU5yWXR5MjAwTlBEaU9RaVhTazdlV3RWY0IyMEEwOTRyZ3hB?=
 =?utf-8?B?bWp3Qmt5MlhiQ1hONmNRZTBaZEZkdEhYbG0xMG55R0NodXpEeUQxdlp4ZjNI?=
 =?utf-8?B?bTRlY2xaRDN0UUJZRGdIYlJON3V5RmtuQ2E0QnlPWmpwMWU5NmpidWZIRTVD?=
 =?utf-8?B?TGRzbzdDa3oydHc2U21lOU10UTVVcWoyU1ZaeUJqd1I5Y0IySWUwT0pFeE5G?=
 =?utf-8?B?bi8rL0dTSWFvK05YZEtlWkYvMjJiamIzYk44U25pS0FqdGlkVVB2WDNZcEVT?=
 =?utf-8?B?WDdLWmFwUE1hNkJlcXBrOWw2SENiWks4TjFtb0JIYlBNOTZybUh1L2xnNmpz?=
 =?utf-8?B?WXJabmRYUjQ3YjRReUtIWEhMNlJ5NGpNaktPQnJOUFJSMTFlbXhSQzRoSkRv?=
 =?utf-8?B?MndRNC9jWk1jdEE2RWxmTitIcExxamI0Q2t6eHZ3SEYyTy94ZzNuUmxWWWto?=
 =?utf-8?B?UWJ1VzFIa3dVbklOWnIrbHJWZFBac0NGWkQ3RVdKVjRMU0MvYTNzamVURTB6?=
 =?utf-8?B?WWo2R0Vpc1FiZHpMa1FzN2hmTVUrRklpVWZ2MkZmL0FVYWt0UkI3d0MvY3BT?=
 =?utf-8?B?OXh2eFlzakQ3cHJyZmpTMjc3VkpOQS9KNWs2dnVMNW1BNHFnUG5Yb291Rmpi?=
 =?utf-8?B?Vi9rNnlOSThkVUJyTDBxV25LRXhrcFliMVg0R3ZlTC83MXRPWkl5UEZQeXZv?=
 =?utf-8?B?Ni9DYkZwUUprTHF0RWRURnE3M2NhMnNTcS81WDZ0ZjVHM3E3WFRWSlJFQ1Zj?=
 =?utf-8?B?Q0pGazhQVy9WaDVrL2hoREhwdXBIV243ZDUrc1hkK0hEVWpRRHZqbTEwbnpQ?=
 =?utf-8?B?bHB6UjBMZXJ1aHk3cUVXUzZ1eUprSit4V0hEOWNTc1lYVUFvRWYwSUxRQzZL?=
 =?utf-8?B?WTYyM3BwdkJ5alNDQlpnNHUwbVhsakV0OHdvQzN2WllrODN1SXZwYzRPZ2o1?=
 =?utf-8?B?eUlvSGE4WmxETjV3U1JScVVmalpMeHhuQzh6cHYvY1BiK2RJWkdNNy8wN1Za?=
 =?utf-8?B?UVZRUWpiVnA1VHhlWGl2bnJpZ09zcENmRmZDTVBoSVpnQVpsem56dVNVc3Z1?=
 =?utf-8?B?bnNpODZHNkE1S0NHVWZaOUVadDRRUGcxdTFuVEVrSFpwTnZ3UmFRVDVYWFNt?=
 =?utf-8?B?a05BV0ZyMW5iblp4SkZqS0xkTjNraGpVQVJzRkR2eU9aMTU2ZHFHU0JyS3Ft?=
 =?utf-8?B?NUNLQmQ5cFRLS3BMOTZjdTlTVmc0bVZ1ZHNFTGNDcTFpa28wOC81cmNFQUdR?=
 =?utf-8?B?NXlxYzQ0M0pnK3haenVSY3BVOWppOHBUYVI2ZnJIcXVBNEMwYmVlNHlucGNu?=
 =?utf-8?B?S2h4cmxldHFHdGNiZnZtZ1dSVzUyRkZKZEkvZnBhc3Fzdmc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OVpiVzRhVGFNc3hpaS9BbGkzT0dRYzlMd0pMOERVUmZNZmRsT1M2L1BDeWNS?=
 =?utf-8?B?ZzZrU0duYTEwd0JoZXBvV1lwVGxiUkFoNmkwZFdJUmFPZ1NvelpxcnBybWRK?=
 =?utf-8?B?TWRKUEJ6a2krSHRDZmQ2cWQvVytHb0lmY08zS29oOW12blFOWjhuamNMdnZU?=
 =?utf-8?B?dEVXRmNIck5ER2lreWxzbmFIZno0czNUamo0OWtIWEFQdDZhQWJ2T3R2SDNr?=
 =?utf-8?B?ZC9BTTVPSGVZYzl1VHNSZW4wbnhSU3Q3ZlhBZFJQeUgzM3d1UlF0OXo4OFBj?=
 =?utf-8?B?NmlYQ0xkbVpYTmlSMGJGeFcrT3FkbitXV01udGh0Wjd6UUUra283b2F1K2xz?=
 =?utf-8?B?M3M2c2NMb3duUjFBQlg1QnUrWlJybFJnZ00wcW5XbndxTTJraDN2RVl1aTRI?=
 =?utf-8?B?ZGpuSllDZTcrc2R6dVBFcUFFa0xKTU9rWWhEbXZsZXNFSnE2UTNyRTV6bGpX?=
 =?utf-8?B?ZEtRZjZsS0tRRkg4M2poTk1IYmFLWDZ5RkRxU2Uyc3BLWjVuVUdOVXZLQjFL?=
 =?utf-8?B?T01oT3BMQTJvamprRnN2N2VVTmhzandWcTJZSlQ0SHYvUzZKbFp2eXQ1WlBj?=
 =?utf-8?B?WFAzQ3p1TFlMNSszSS95RHllVUlETnFPSExTUTdjL1dWbDJwcGI3dTRRa3Rm?=
 =?utf-8?B?MFliTHJuYU1wVWtRNXJIL05RUjVzZlZ4aWxTU2VWOXR3cUxDMFRYamVDMEZx?=
 =?utf-8?B?bXBzSEJIOU1EZ29mZEVCZkxjd0VGZ3NKQVpYZDhnK0U5Z2V2ZkY2Qm9LN2o0?=
 =?utf-8?B?MHg4S0duWWhuQmpDT25vci82TFArOEJmVUIvMlNvV1pzTnRmMFlxYkNRT3E3?=
 =?utf-8?B?K3ozaGk4VGY5K1d5aHRVbWRkRDlwVHRBc2tJVXBxeUNRYkovRnJJZHdpdTBU?=
 =?utf-8?B?WVVjUnBmNkpORjhybmRJSVorVkZYZE1BdWRTQThTUzB6OC9mNUcxbHdkQjVt?=
 =?utf-8?B?ak5sZHY4S3AvME42aDBzYlVNNFhmemV5NU1vZGFNVm5xNEhkWmVES1BwVlNQ?=
 =?utf-8?B?UEFmdnZ2UVZHdEN3RUxjS3lzaTJaVkRBdjRqcHdTeEFWeStCUHR2UU5zdkIx?=
 =?utf-8?B?NG1xdXdRN0VlVWFkU3h0SFczekF0Y1djWU9qN0FYb292ZDhzTytKdXhVUG5F?=
 =?utf-8?B?YmhuenlHUnAyZDhzRURUZjJqVC81K0pxc3R2VW1mcThBK1UrSGdFdGV6cFpM?=
 =?utf-8?B?N0JBN1BIQTR4SVg3Tno3N1VKeHpqNC9NdENMVDZmVy83aVFUbitpVU96aDlS?=
 =?utf-8?B?a2c3akpyTy9Jc0wvRFpXaGdkWUNIclR1aFk5MlJCNld1bTdiSi9xeDEvTTBr?=
 =?utf-8?B?c04vbkhZeXFoVjREcHV2T1o3ODRSRVFrYkl0U0IzZW1PM0RZcS9vMmNyWGJ1?=
 =?utf-8?B?Z1pRUmg5YmYyMGN0WjU1U0tYQ1hjamc5TnRCWU1kd0tEb092ODZXbERYOGJp?=
 =?utf-8?B?cGQ4R2lTSmNsUmRiR1M4Z3hHeCtvdDNNd0Z1T2FTZEJnbnF6ODR1amp3SHpL?=
 =?utf-8?B?N1B3d0ZsclNMR3g5OFhtVHZPdnBqTVRiNTNvdkFianBoUGltOUxhUEFNcHp3?=
 =?utf-8?B?emMvN250Y2c4U2tzM3plWTN4Nk5zbnlEU0FramgzVHpGakxZSlU5MzVNcVU5?=
 =?utf-8?B?WDRtNm0xZUU4TXEyZk1YRnV4SUZpVVdGQ3JheGFXZ21kOXJhbGdaRWlEdXlj?=
 =?utf-8?B?eXptTjd1ZjNGUnlGZUJxNFFGZi9lMFVNN0hYTm4vKzgydTFGZWkrNDRNR2pG?=
 =?utf-8?B?QnVHNHNUOU9FbWVKeXlHV0I3cWM4RlJQNk44MDN6OFAxdDZVTk1MT1U0Y2c5?=
 =?utf-8?B?SENXTTZHdlJDeGdneXR4VzdrSWpheGlFTHlQQUN5SFBNcG9tU1BpWDJrajBr?=
 =?utf-8?B?SmhpcjJmb25Zd3BIZHFFRG9JUUl0UUdmaEc1QmFRQnhzcXN2a1ZrNzdoMXV2?=
 =?utf-8?B?S3UzUmh0SjcyNjlFUVQwMTVVR3pjVjZ4cmhQMnExdmc3YWpqbXVaSElyOXJG?=
 =?utf-8?B?dUExaE9JT1F1cGN2TVhQMkRaQmhvcU5ORjVhdFNzSzVWR21hRE1jNDJvanIy?=
 =?utf-8?B?MkgzRHZHK2hyYjhXSk4ybmY3bkhLNFZJaDM5MHR2ZVFVc0x3elZKYkN2eDB5?=
 =?utf-8?Q?Is9vd4d2qnxENKHGIuR/bYkmK?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc45fa07-5e72-47b7-05f8-08dd0defbafa
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 07:55:44.2642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ryXi5HIcY4LCTC6yCFmneXhb1TwpI2Q/ECv69dCLEZ8AGN/O/FYtXXTqVCdMKbfDryM5aCTGrW9tz6TIm+f0vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6293
X-Authority-Analysis: v=2.4 cv=c+L5Qg9l c=1 sm=1 tr=0 ts=67457f05 cx=c_pps a=/1KN1z/xraQh0Fnb7pnMZA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10
 a=t7CeM3EgAAAA:8 a=ENYW0vS-B00P3n3B2IkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=JM4-IM7dGyYZWQGaSAIV:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: _yu0QQzuB2VX19Gp8KRPCmH-CDclTimv
X-Proofpoint-GUID: _yu0QQzuB2VX19Gp8KRPCmH-CDclTimv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-11-26_06,2024-11-25_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411260063
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4AQ5DvKD021849
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 07:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207841

From: Chen Qi <Qi.Chen@windriver.com>

Backport patch with tweaks for the current version to fix
CVE-2024-0684.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...0001-split-do-not-shrink-hold-buffer.patch | 42 +++++++++++++++++++
 meta/recipes-core/coreutils/coreutils_9.0.bb  |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-core/coreutils/coreutils/0001-split-do-n=
ot-shrink-hold-buffer.patch

diff --git a/meta/recipes-core/coreutils/coreutils/0001-split-do-not-shri=
nk-hold-buffer.patch b/meta/recipes-core/coreutils/coreutils/0001-split-d=
o-not-shrink-hold-buffer.patch
new file mode 100644
index 0000000000..3eab65dcf1
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils/0001-split-do-not-shrink-hold=
-buffer.patch
@@ -0,0 +1,42 @@
+From 80dca40bbb36b7b1630bb5a43d62b3ff21b4e064 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Mon, 25 Nov 2024 23:43:49 -0800
+Subject: [PATCH] split: do not shrink hold buffer
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+* src/split.c (line_bytes_split): Do not shrink hold buffer.
+If it=E2=80=99s large for this batch it=E2=80=99s likely to be large for=
 the next
+batch, and for =E2=80=98split=E2=80=99 it=E2=80=99s not worth the comple=
xity/CPU hassle to
+shrink it.  Do not assume hold_size can be bufsize.
+
+CVE: CVE-2024-0684
+
+Upstream-Status: Backport [c4c5ed8f4e9cd55a12966d4f520e3a13101637d9]
+
+The original patch is tweaked to fit the current version.
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/split.c | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/src/split.c b/src/split.c
+index 4b1b144..e44e867 100644
+--- a/src/split.c
++++ b/src/split.c
+@@ -785,10 +785,7 @@ line_bytes_split (uintmax_t n_bytes, char *buf, siz=
e_t bufsize)
+             {
+               cwrite (n_out =3D=3D 0, hold, n_hold);
+               n_out +=3D n_hold;
+-              if (n_hold > bufsize)
+-                hold =3D xrealloc (hold, bufsize);
+               n_hold =3D 0;
+-              hold_size =3D bufsize;
+             }
+=20
+           /* Output to eol if present.  */
+--=20
+2.25.1
+
diff --git a/meta/recipes-core/coreutils/coreutils_9.0.bb b/meta/recipes-=
core/coreutils/coreutils_9.0.bb
index 8a2fbeca32..1cce9192ec 100644
--- a/meta/recipes-core/coreutils/coreutils_9.0.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.0.bb
@@ -20,6 +20,7 @@ SRC_URI =3D "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://0001-local.mk-fix-cross-compiling-problem.patch \
            file://e8b56ebd536e82b15542a00c888109471936bfda.patch \
            file://run-ptest \
+           file://0001-split-do-not-shrink-hold-buffer.patch \
            "
=20
 SRC_URI[sha256sum] =3D "ce30acdf4a41bc5bb30dd955e9eaa75fa216b4e3deb08889=
ed32433c7b3b97ce"
--=20
2.25.1


