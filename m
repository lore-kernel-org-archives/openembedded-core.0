Return-Path: <zhixiong.chi@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2D7FCD37B6
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 03:11:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42289.1778469074080782318
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 May 2026 20:11:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Zp3GqxMX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9591002d8a=zhixiong.chi@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B2K5nG2736399
	for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 03:11:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=FBz6dB0VX7n7RNBM1rXrsi
	3/QC5uWPcM31zwmPZ/1KI=; b=Zp3GqxMXYJ/KthRJK//CQd+askA4bxkuz43Ct5
	ItD969t2KluJm4CV7nJATdHyA3LsguW9NIPHhOYruoZj3z2yneFi4scYvrn0XDls
	M/7Bf3jibEipZixvgOu/Lzb0L48Zr319nqAx6c7JnvQT/N0VsXf6v+C9a+u0ZlMJ
	dd2RYu94ivVGyTFHWNoFZSZ/Q8FPewP41R2kl83i085DIPv+XanGtLcEp9hELoqV
	9IqeZJAoJMJhrvqwXro+a+4qtxUzhHWDwr7cs8O6AxOjk09fKQl4VAGPkK156p0g
	sMwM7kO0XQraFazjXyLBcOnrMDzZZR6Tbbt4NsDbWHsasUvA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011052.outbound.protection.outlook.com [40.107.208.52])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e1uw6hgff-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 11 May 2026 03:11:12 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HgLNCcu6YI9YOJs7oPlvVCCGUT4UD/Q+Ie6KAcSzZuqWVDF+AFVNrNiukLKEWn8D0Rox+0GC47s+TBnTAeWnxWRcnSjL6FWJNfWjAFbVrajp8C/VxGWFak4UNFk+gPfB+oXzbNv0aKy95RWcMGeYRwDAhnwQYioXtK+qHOlti6gcG/ieXgCeFY+2brqyEh0iZF0stTUMHE5B2f1/+Yp+9bpXY7xzvNaGDyT3VvAV8ZTc0utPGqLyh92o6h2LvLFkx6UzB0asWJWR1RcIoqHhkS6MQIvJ0ZBmLWHDO0yImZ3ZP1oDF5fsjxst0F3HbbLIwzpMJgsp3M991z4ctoziiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FBz6dB0VX7n7RNBM1rXrsi3/QC5uWPcM31zwmPZ/1KI=;
 b=dP955qT3KIBW7Hxr9Q+Wk6nDv9VWaQkf00pI9ZVsrLeF5WXZG+UDPfmXxi0jC4HLgzk7DDS/zk7YvUgB9jfpoUICppqk60TvVW9crwCZzw+5b8S82rlPEjvPmGXQX0Kiw2OUbQw6OLsxl4RSzdDq1LRxOGArzA5Ws4ePjRYBBT/8g5EcHx85Fvhm9pR/5j4odYXeyHLsTzB3DJNpDnAKOPu29EpXtSeZ+PQS/1djORLkDcbtk5a9n208ZefciFb28p+vNv7GgI8Oa78d3m9D4sEUsrrmZnJrcPzCGxUwudgm2QPoI822+ctHVMePo27YFk2Mp+VA5FvN5g2rZraGUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPF75D68BA1B.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::32) by BL1PR11MB6002.namprd11.prod.outlook.com
 (2603:10b6:208:386::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 03:11:08 +0000
Received: from DS4PPF75D68BA1B.namprd11.prod.outlook.com
 ([fe80::881a:ac0:4717:712a]) by DS4PPF75D68BA1B.namprd11.prod.outlook.com
 ([fe80::881a:ac0:4717:712a%8]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 03:11:04 +0000
Content-Type: multipart/alternative;
 boundary="------------XMscq9Da9Jet4mhiLLJbACdO"
Message-ID: <d828c167-5671-4370-b122-b25f23003812@windriver.com>
Date: Mon, 11 May 2026 11:10:58 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] oe-selftest: Add static postgres user/group
 for reproducible build test
Content-Language: en-US
To: yoann.congal@smile.fr, xiao.zhang@windriver.com,
        openembedded-core@lists.openembedded.org
References: <20260421070646.1290375-1-xiao.zhang@windriver.com>
 <DHYO49JUR52Y.1OUCD7ZQJ693R@smile.fr>
From: "Chi, Zhixiong" <zhixiong.chi@windriver.com>
In-Reply-To: <DHYO49JUR52Y.1OUCD7ZQJ693R@smile.fr>
X-ClientProxiedBy: TY4PR01CA0082.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::10) To DS4PPF75D68BA1B.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF75D68BA1B:EE_|BL1PR11MB6002:EE_
X-MS-Office365-Filtering-Correlation-Id: 87fa80f4-de60-4a19-44a3-08deaf0af011
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|4022899009|18002099003|22082099003|8096899003|13003099007|56012099003;
X-Microsoft-Antispam-Message-Info: 
	vtNHJEJVokSjDR5lBL+gTgdKt6EgMU6N3n09v/vnJJA1qFoSA0VOzYqH73DOvciGE/Ysex1/oav2OWcLOvRnliq+E3ucnYAOq2yzlUJCbdy+c+WcBSpi8iZNEL7uiVWK0AMGhi5aFDBDZl/lMyl2XTGDUryvIPPfBRh866kYF8oHYabTsvTTDOR3R/jbIaMX07la8ajKPpjiDJF5q6g/a24S0SyyDbJh1XT9m8UZESnvIImiRkAaf00Ctlv8GqPBw5YSfBzwowwJtPYuZ1nZwThv2a+EAzd2WdTmDDTAsBGXvQRTMnBTjJ53Wiai7l0GKiVQVGWn6KTBf+m6JNlmH+762KDCLZYYEgMnYmjpKyMh3DL0TdMcmyDQNTg2YDbQSAJd4BaZ3d3i2wxVsPdUAcPMdvJ+3lICxsRATj+Lwj1+/qjJ3JnA6xCUR8uiD2+3duxYzQgTUSwOLI6WFo+/ygbD2Xw+xPBoTmMzfdWx8H2r0cKKG9mRQe5sKBv4oNk2vtoPhEMjAdTB8+CpXvE6PlXYXF7DIJJy8Dmt5MgAA2GZYJDI1yj0lPHZoJN6ECRe41qVjmlPz2hzJ2emEyXiHDMWbGjRI6AB9o4vCfKR1Amn+ur9QIK9wHdvVsnJQv25mGitvfuQSq6cxqD2CAwv1w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF75D68BA1B.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(4022899009)(18002099003)(22082099003)(8096899003)(13003099007)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?emRTZFBWRlJndnlhTlBmL3FHMWs4UmZEdmVPcjVIWmdzL25icVZVRlQ4UFFt?=
 =?utf-8?B?NGJRTjhEcW5GTUorQkR3VnN6SWFLdmlnVlUzRTNGYVVjOTNCdXVjUXJIRUdy?=
 =?utf-8?B?UGJ1SDNMODFLTWtoRDdqQXQ4YWJCZ2xzc3N2OXZjYU9OckMxUXVvNEo3dk9l?=
 =?utf-8?B?UFIrbFNsem1oM1VoemRlbC9rYW9vbTRXSWRzRG8zaUlSNGwyMWtJdU5Uck1y?=
 =?utf-8?B?L0RDL05JaGU2UXpiOWorSmlDalAzM0xid3lWYnpiS0tlODdMcitYK0VyV3Fz?=
 =?utf-8?B?MzI4OFROc09sVGEyRG5WN3ljYkZXZmpRRDJTQ21NQkh6ams5QjlhRVQrWitq?=
 =?utf-8?B?VTk0L2twVVo0OWFzSVMrR3lnOW13OEE2NU5abkVpNFMvTW50V0RiWDFobnpP?=
 =?utf-8?B?WFk3UHhQc20rOXBKS2NaYzZiVDZ6TXNuejhaWEJWVEQvcnA1Z3NTQm1YZmpO?=
 =?utf-8?B?SEJDcGM0UXNsdmlTcCsvYUFGb0U4Ukk2eE1DOGsrbkNOSHNRUVBHdG81dWI2?=
 =?utf-8?B?ellCeHdVVEZCQ0N5Y0liTGppUVBCVE1jNjU5dURoMEd0ZDA1cklLR3dNYUcz?=
 =?utf-8?B?ZldDNXpPZmJ2T0VQbWNtcG9OcXlUKzRQUVVzN2Z6UGMvQnVuclNhVHk4Z3lR?=
 =?utf-8?B?ZnFYay9GUERqLzNiam9pdE51dUFPNlloRThIWVhsQS9FV1o4Sk5UeEdwT2ty?=
 =?utf-8?B?YWJrZG1OV25hdkV0M2FBeWVmVXE4MU5td01RcGlSdnE0Z2NpUlNpZW11TGdt?=
 =?utf-8?B?b0s2dW9jMGprcCtTM0cwSlQ0a2g4L0M0b0pSOTFJTmpVZWRnN1U2Vk9VMGxI?=
 =?utf-8?B?eTl3RXA1ajVkYlNpT2NWQ0dLb1hGQzg1M2NJTFBiZUhRTlg3K09MNmVkL2xG?=
 =?utf-8?B?ZWx4akpSK1YySjBEWWE3enhSTVdJSG5jWDRuVUJVZXBsWFRkL1o0eWd4RFFv?=
 =?utf-8?B?dWs4WVpIOEx6NGs4bnlDVkFQd0lJL2c5MkRpRGZ2eGlJNzZXZlVpczNBVkhN?=
 =?utf-8?B?Mm9XZmduZE1xSGppRHF1dlIzblNhMzVEK0MycXl3M2RYdmd5VmFwUUtJWE03?=
 =?utf-8?B?S2FITTVQZ21WYkgvN1ZHN3IxMU5leUlQNUp3dkRrd21lU0xvcnVkREEzaU9B?=
 =?utf-8?B?clJnV2ZmTU5GVnVIWkRWSlJ6UFdlLzZkdnA5S1F0dEpHUmEyS2ZWZTBvKzhz?=
 =?utf-8?B?MDNJcFVSaWdFZ0k1elhyL1QxTU1kOEp0V3BEeGRpUVBtUHBuNlZJbTZnSDRq?=
 =?utf-8?B?SnJDcnhHaTdwQlNUM0p4aWNCU1lHMEMvSUZQais4REtFaHVYdHpORjI2UVhX?=
 =?utf-8?B?V3gyaHk4MEU2Q0RSdksrM04wMEozcW03UGtWbTd0VUFVb0lqUytYVkxiSGs0?=
 =?utf-8?B?Um44UXlmZkFoQ211N2lKR2N0OFpsL05vTC9adXVrTDRWUnRyZGk0STlvbDdt?=
 =?utf-8?B?dHRLZHJFa0RhazNleWhMMDBJVGV1ZXZKdXVyVkZIWGswZVE0aXRRUzFnYXhQ?=
 =?utf-8?B?ZnJ1TXpxYVRxcUMwYlFUVHhIVGVxTXRKRHpoNWRjOFdYaUNoNm0ydjdYZEN0?=
 =?utf-8?B?SzhPeWp5a01odncwUHlUU2FIY3FVcmIwWTRVMlFlVmYyRlhia0J6YlY2b1Ba?=
 =?utf-8?B?d3RoWXM2STU2b29oZDVnazUya0tDczFyZmZBMTZ6N2pxd1MyOU91VkFocHh6?=
 =?utf-8?B?WGNTbnUwcFlOOGZxeG85VDNLbDB6N0dZaEZLTEpvb2R1THJNeFFmWnhQZnor?=
 =?utf-8?B?elBmTnpwTzl1RzFWV09wRG9na1Y1aEhuSkZxbDhwaUQ1MFVkT0YxQ0d4ZUpa?=
 =?utf-8?B?NkdNRjJhcC80NnVuOHQ0R2kvMFdDNGtVdXA3QU5jSCtrMmlTbEs1eEpQWHIz?=
 =?utf-8?B?dU5rSXQ2cEdXY2hNcDlRejNLNWxaR0F0ZlFsVnE0bStqZm1PUVVhSGdTYTR4?=
 =?utf-8?B?U1l0QkZyejNmRStMSVh1L1RTZDFqUVJZd0tCdFJhaGhsWUNOUXBIdVNUcG11?=
 =?utf-8?B?YXYyUEJkaThMNFdWVGxTR25SWjdxRjhQOGt3aGFXQkIvNXBWTDJBUVpCcDhI?=
 =?utf-8?B?NEJNM1JiSE1iWTU5dGJSZzdYNEk3VjhXb1F2c2JJbUNnSGN1ZjFab1NqeXI0?=
 =?utf-8?B?cjZrS3gzLzgwV0lZMm9ZT3ZnY0ZXSkZRbWVWSlBLaWNNTlQ4Y1BSRS9McUVR?=
 =?utf-8?B?RzA4cmhPSVJHMjZORlpxclUzNmtzM1p4YTYzcW05QVo3a0I3U3I1dFpOZUNo?=
 =?utf-8?B?Zkw4SEVxbHZFdzArWWxZanpCWEhuWGpXcGhrSXdUY29vVXRjU1BoMmtidDFm?=
 =?utf-8?B?cGQranR0clp2OEVWbkRTSnFYYjU0UnFyWDJ2NCt2bFRjT3F3WmRqUm92U292?=
 =?utf-8?Q?mivDfYSAZ3qoyRas=3D?=
X-Exchange-RoutingPolicyChecked: 
	Y4teImdkCIBJPJsb12R7Tcj4DPygSOubQHxKN3V83pIiGCB6THw8LyPm4ZvJC4qs9a44CBscNNOpzDsbXYlt3YTaTfEYFxxz0fkR1ryRrqC2wzwia31GPWKR+HR+p1bHf/gLdG67q5iaAeqsNLhyCjsKpWqFFLX+p61IPp//Mon2plgaAIWy36AlJGvtQDR7+n3OOlML+C6mUcMENL2DP9VIz+TJANgk07lkz4lqlNurgB0LIOyBjGAsbIFPAj9SxYnFLlbqpcQyl3655bKxZCVWhV5zQIuO6ssudQ7IH/9Ei2xnxujS/4deDCXpcOtzIDxw6Q/A3WfgPNKNPtJ6aw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87fa80f4-de60-4a19-44a3-08deaf0af011
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF75D68BA1B.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 03:11:04.6660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vzCoOK2ncKwIQrbMU/jvnVOUsPIAlsIbWQRRvrZWUB2adqTaTLMlvsfPLgLapTyUwY/YvDS04QrHHhig6omZ6TqGOrInoaXc3aCsHUyQ7/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6002
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDAzMiBTYWx0ZWRfX0MNgVC+v5WOk
 pOJomMZrMZ4EF2FpwdG3qbPBAI3ZCIxDGv1GWIsSXP2ttZSuxN8aS4MiGHAy0aRduPUZ1nW6jBT
 eOo2V1BmW8nGte7YVAihGJ3BRY6FYQO78G8jTaaWb/yWZDPfspv8oQIdjOP3ejyePDEc3LSdrFI
 CiZjPU9KvouIDoLzxZgdLgZifAdZ4UI/NE3qltAcWcrcP/0ZyyVMgs5YTGSEtVWgAXi709Eb2vp
 ZpQ9skfJ6JXkvErnnX1sCh5GHMSBBwFSFMi34vqAygfFeTBmUJF7mIcUHhzvP5dcGb8s4M0V1q1
 Q4KQ/VnqXCSg0YXEY2SuVTf2Q3tEyT3iZvNmCOwoSwBxXk8S+FQRWA0MlvfSW1On2zsqV7fKSLO
 r6Rq+90bZZUY5Q7amlrjDZZGi1P2OhAtnJvFUqgcNm1l9ODkkxeohWzm+XbaKc7wMfEzCNnQxuQ
 BEVHINnnZTbTz7m8ULA==
X-Authority-Analysis: v=2.4 cv=d6nFDxjE c=1 sm=1 tr=0 ts=6a0148d0 cx=c_pps
 a=DEJEzXtY41/hIaqkAZCRpw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=_s4iPZzd_z-U0xFT3C0A:9 a=QEXdDO2ut3YA:10
 a=LVVdaqqDU9W9cF4QaU8A:9 a=ZSqneSqUgXELqzT1:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: N_J_t9v_9XyEuevL5vl2APMY6RmrG8HN
X-Proofpoint-ORIG-GUID: V-mct-Mm3QvO46dUtrubX4AIByHbljHg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110032
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 03:11:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236772

--------------XMscq9Da9Jet4mhiLLJbACdO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Yoann,

Given only static-group and static-passwd are added at 
meta/lib/oeqa/selftest/cases/reproducible.py in oe-core

as the commit 
https://git.openembedded.org/openembedded-core/commit/meta/lib/oeqa/selftest/cases/reproducible.py?id=77397bace64dfd03e704400fea918d93f00d0bf7,

the static-{group,passwd} in meta-openembedded/meta-* layers are not 
included(eg: static-group-meta-oe/static-passwd-meta-oe).

I encounter the same issue during reproducible testing

So how to expand the USERADD_GID_TABLES and USERADD_UID_TABLES to add 
the static files in meta-openembedded to avoid the static id not defined 
issue.

Generally I run "oe-selftest -r 
reproducible.ReproducibleTests.test_reproducible_builds", export the env 
variable USERADD_GID_TABLES and USERADD_UID_TABLES or the other method 
we already have defined in yocto?

Thanks.

On 4/21/26 15:52, Yoann Congal via lists.openembedded.org wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Tue Apr 21, 2026 at 9:06 AM CEST, ZhangXiao via lists.openembedded.org wrote:
>> This adds the static postgres UID/GID entries to static-passwd and
>> static-group, fixing the "Nothing PROVIDES 'postgresql'" error when
>> running reproducible test.
>>
>> The selftest environment requires static system user IDs to ensure
>> build reproducibility, which was missing for the postgres user/group
>> before this change.
>>
>> Signed-off-by: Zhang Xiao<xiao.zhang@windriver.com>
> Since this is a meta-oe recipe, shouldn't those static IDs be defined in
> https://git.openembedded.org/meta-openembedded/tree/meta-oe/files/static-passwd-meta-oe
> https://git.openembedded.org/meta-openembedded/tree/meta-oe/files/static-group-meta-oe
> instead?
>
> Regards,
>
>> ---
>>   meta-selftest/files/static-group  | 1 +
>>   meta-selftest/files/static-passwd | 1 +
>>   2 files changed, 2 insertions(+)
>>
>> diff --git a/meta-selftest/files/static-group b/meta-selftest/files/static-group
>> index 6a9ece20a8..a08795c4ea 100644
>> --- a/meta-selftest/files/static-group
>> +++ b/meta-selftest/files/static-group
>> @@ -31,4 +31,5 @@ audio:x:532:
>>   empower:x:533:
>>   cmake-example:x:534:
>>   meson-example:x:535:
>> +postgres:x:536
>>   nogroup:x:65534:
>> diff --git a/meta-selftest/files/static-passwd b/meta-selftest/files/static-passwd
>> index 98017c8153..ba1dcd54d8 100644
>> --- a/meta-selftest/files/static-passwd
>> +++ b/meta-selftest/files/static-passwd
>> @@ -21,3 +21,4 @@ ptest:x:529:529::/:/bin/nologin
>>   xuser:x:530:530::/:/bin/nologin
>>   cmake-example:x:534:534::/var/lib/cmake-example:/bin/false
>>   meson-example:x:535:535::/var/lib/meson-example:/bin/false
>> +postgres:x:536:536::/:/bin/nologin
>
> --
> Yoann Congal
> Smile ECS
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#235603):https://lists.openembedded.org/g/openembedded-core/message/235603
> Mute This Topic:https://lists.openembedded.org/mt/118934221/3618679
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [zhixiong.chi@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------XMscq9Da9Jet4mhiLLJbACdO
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html data-lt-installed="true"><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body style="padding-bottom: 1px;">
    <p>Hi Yoann,</p>
    <p>Given only static-group and static-passwd are added at
      meta/lib/oeqa/selftest/cases/reproducible.py in oe-core</p>
    <p>as the commit
<a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core/commit/meta/lib/oeqa/selftest/cases/reproducible.py?id=77397bace64dfd03e704400fea918d93f00d0bf7">https://git.openembedded.org/openembedded-core/commit/meta/lib/oeqa/selftest/cases/reproducible.py?id=77397bace64dfd03e704400fea918d93f00d0bf7</a>,</p>
    <p>the static-{group,passwd} in meta-openembedded/meta-* layers are
      not included(eg: static-group-meta-oe/static-passwd-meta-oe).</p>
    <p>I encounter the same issue during reproducible testing</p>
    <p>So how to expand the USERADD_GID_TABLES and USERADD_UID_TABLES to
      add the static files in meta-openembedded to avoid the static id
      not defined issue.</p>
    <p>Generally I run &quot;oe-selftest -r
      reproducible.ReproducibleTests.test_reproducible_builds&quot;, export
      the env variable USERADD_GID_TABLES and USERADD_UID_TABLES or the
      other method we already have defined in yocto?</p>
    <p>Thanks.<br>
    </p>
    <div class="moz-cite-prefix">On 4/21/26 15:52, Yoann Congal via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:DHYO49JUR52Y.1OUCD7ZQJ693R@smile.fr">
      <pre wrap="" class="moz-quote-pre">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Tue Apr 21, 2026 at 9:06 AM CEST, ZhangXiao via lists.openembedded.org wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">This adds the static postgres UID/GID entries to static-passwd and
static-group, fixing the &quot;Nothing PROVIDES 'postgresql'&quot; error when
running reproducible test.

The selftest environment requires static system user IDs to ensure
build reproducibility, which was missing for the postgres user/group
before this change.

Signed-off-by: Zhang Xiao <a class="moz-txt-link-rfc2396E" href="mailto:xiao.zhang@windriver.com">&lt;xiao.zhang@windriver.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Since this is a meta-oe recipe, shouldn't those static IDs be defined in
<a class="moz-txt-link-freetext" href="https://git.openembedded.org/meta-openembedded/tree/meta-oe/files/static-passwd-meta-oe">https://git.openembedded.org/meta-openembedded/tree/meta-oe/files/static-passwd-meta-oe</a>
<a class="moz-txt-link-freetext" href="https://git.openembedded.org/meta-openembedded/tree/meta-oe/files/static-group-meta-oe">https://git.openembedded.org/meta-openembedded/tree/meta-oe/files/static-group-meta-oe</a>
instead?

Regards,

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">---
 meta-selftest/files/static-group  | 1 +
 meta-selftest/files/static-passwd | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-selftest/files/static-group b/meta-selftest/files/static-group
index 6a9ece20a8..a08795c4ea 100644
--- a/meta-selftest/files/static-group
+++ b/meta-selftest/files/static-group
@@ -31,4 +31,5 @@ audio:x:532:
 empower:x:533:
 cmake-example:x:534:
 meson-example:x:535:
+postgres:x:536
 nogroup:x:65534:
diff --git a/meta-selftest/files/static-passwd b/meta-selftest/files/static-passwd
index 98017c8153..ba1dcd54d8 100644
--- a/meta-selftest/files/static-passwd
+++ b/meta-selftest/files/static-passwd
@@ -21,3 +21,4 @@ ptest:x:529:529::/:/bin/nologin
 xuser:x:530:530::/:/bin/nologin
 cmake-example:x:534:534::/var/lib/cmake-example:/bin/false
 meson-example:x:535:535::/var/lib/meson-example:/bin/false
+postgres:x:536:536::/:/bin/nologin
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">

--
Yoann Congal
Smile ECS

</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#235603): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/235603">https://lists.openembedded.org/g/openembedded-core/message/235603</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/118934221/3618679">https://lists.openembedded.org/mt/118934221/3618679</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:zhixiong.chi@windriver.com">zhixiong.chi@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
  <lt-container></lt-container>
</html>

--------------XMscq9Da9Jet4mhiLLJbACdO--

