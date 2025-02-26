Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E360C021BE
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 03:33:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.109.1740540802324590731
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 19:33:22 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4152bef189=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51Q3SwQx017893
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 19:33:22 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 451ptmg8hm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 19:33:21 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51Q3XLio025178;
	Tue, 25 Feb 2025 19:33:21 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 451ptmg8hk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 19:33:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rnX9malyOgDzY0ZY7Mal7ZPdDuWyDusVFt8RJJEze1DD0hWFFqXAw3nU3Gm5SAgtEqWJcPdlFvwaaRAw+IQ7r5wPxSy1ztmQ1m+vkaUKc3JQzQb/oh5Kc2/MojPHX3vdZE4pz0Fl2Bc4uMrsLNZeaEGX6MfBOPDFNBHlm1TF0KTF7y/BbMxNrYgjTJwzGmvUXpPRmPJM/FuUhbcKQfnZBnKU7ZC2o3+o0Ciwj+QwPkocBdcGmFslpe0u2cuwL3le5mSAadhu9VNyDQS9XNoiUyHSa1fIIEddJm01BlMtCoEkA0IUy7BLQ6eIW2fjFoRPZNvOgaBbNZmBYkhXCMGDPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0MR7aQfRVdJOuQDKmmpxqHSwgEJTZfZA1e6vJ8Mk0a0=;
 b=K5s/iuKa7Cb/TtwFOzz6bKvm3voVXN7nNTukiYE2dEeRGxZ3dzL3Oa5DmDnfzQVt9KOLpS9Rt7YtzSGhW+WCFsPtCZKMN04U+O+PQNF57u/GVyzl2qhzobnCFXEiqWyPwn/pZkgXYfkfphssIbZr4IXT8xJWEKHRZAjDZ8xpGgsNwbXkuneHIwDNIA/KZ1WRYdu7yfIusbPkP34GTFQeZJqNfGc3RNj6s2NEavKNvEOcDBlwY/9s/so7bVTV+S4EuxBygPnWMdoLGXVrF5UB1acw2cuWJbM6UY/6uQfvGJmiBMeYrjIfFTBm4G9aTN8R7sidqNU5yTeHDPaHm2cNwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by DS0PR11MB7903.namprd11.prod.outlook.com (2603:10b6:8:f7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Wed, 26 Feb
 2025 03:33:17 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%6]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 03:33:16 +0000
Message-ID: <1cf0f0c6-ad1d-4832-a5af-fced0179d328@windriver.com>
Date: Wed, 26 Feb 2025 11:33:09 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] grub-efi-cfg: Add GRUB_TITLE for custom GRUB
 titles
To: simon.eu@gmail.com, openembedded-core@lists.openembedded.org
References: <20250115081303.27992-1-simon.eu@gmail.com>
 <20250115085521.32982-1-simon.eu@gmail.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <20250115085521.32982-1-simon.eu@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGXP274CA0011.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::23)
 To SJ0PR11MB5613.namprd11.prod.outlook.com (2603:10b6:a03:3ab::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|DS0PR11MB7903:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d813bb0-593c-42e3-9f72-08dd56164dc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|4022899009|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VUZ6ZkU0Q3NFMFo4dStwL0R0UGxqQkJuSU8wc0g2VUp4dnJaQnZrNERvTWNn?=
 =?utf-8?B?RU1aNE5sajFkYVQ4dk1ObTNSTG82MEcvcDcyQW1rK1hCUWJTZFZJbUFONTNk?=
 =?utf-8?B?bXBSQ1BYZG1qZUVQUExMVXhHRU5CODhXcTNNcDVGVTdsbUlJM1Y2TEZYVDJi?=
 =?utf-8?B?R3BKTzcwVHQzY0x3Wjd6dktmNnFOU3Z0WWUxTG5zQ0pQL0dvc2x6cHpQTjBE?=
 =?utf-8?B?a3FpUExSb29XUUZtTG5xMDZtL2JTdG13SmdYRmJ2T2gyUUdPbzdrN0liT25S?=
 =?utf-8?B?bnlMKzduQWdEVHh0bmljVHEyQjZUTHZYVGlYbzNHZ0QxcHdHeldkOEhTU0cw?=
 =?utf-8?B?RGNiRDczVWJZWGQ1OGZJRkIzMG9YUUgyOUQrSnNVR1g0NUdPUGJZVVVOZTNH?=
 =?utf-8?B?TjlBVm11aDR3dDFLQStwa2RsdGRxUDJQNG9GUXUxU3MvdFRFd01LVzVhZUtu?=
 =?utf-8?B?Q3BqS2Z0Si9HUDM5UDRielBZUGhMZkFiL2FRUTFXbS9WWGNhLzhHalhSTVlr?=
 =?utf-8?B?RmZ3UE5pTGFtSTdoVnRrRUpYWU03dm56VjdKZnVqb0R4OUxzWlEyYkRNa2Z4?=
 =?utf-8?B?ZC9jK05xOHYzOStqaFVLb3lCTUd3SmI0TEhWYTBqcmNuUnR6a3pLMyt4N09q?=
 =?utf-8?B?WDQwbEpRMG5hLzVvR0sxVTNjcnNiQ1A1QTMvSFowazFKcHN0UHlOV1dXQm1O?=
 =?utf-8?B?SWVBV2laMkVkeERsMGovWlR0dWpibVladG9ZOW40NGNjWnRYTDJnN0tFUHFq?=
 =?utf-8?B?WVFJeXJERHcycXVQbFpYb04ydkNPMGcxNjFpWklXZVBub2h0S01CQjRhU2lM?=
 =?utf-8?B?WlUvdDc4ZjFXQy9JVjdDcjF2OEwybXo5UXBsMld2bitPYjcxK3ZqOU5zKzlT?=
 =?utf-8?B?Nm9JN1NBeDRSYldIQXlaOEwzYWhLMlB6UVE5Vm04d09lZ0g0d1VTNzNJWGk3?=
 =?utf-8?B?OXhxcU03ZTM3Q2NZRXFoaTVlb3A0ejhsWGFJMHNnUndjUVc3YThaSXZ6MkxZ?=
 =?utf-8?B?dHVuNGhybmJweWJpVTZ3U0NzdnYydlhCR2Vyem1iWWYvZ01nZ01FZDVhdlhp?=
 =?utf-8?B?eGVuRVMrRCs4aExuZlN4bC9LU0k0MXloZWdmZGlkc0srQjZOYVpkL3NvTjhj?=
 =?utf-8?B?aVE5RGF0SlN1SUpYQm1rcWEvbVNGQ0lCMmF3RFE4RENnZUpsN0RMOW14QnIw?=
 =?utf-8?B?L29iWEw4cXIzWUhqTXdYVkkzY3V0a1lFMTVmeVZ3bTMzV1ZQbk8rNmd4QlA2?=
 =?utf-8?B?Sk9VQ0t3MzhsOWJvWVVkWFBBN042MVpFTWlyc3N6eU93YWxUekpyV2tPSDVl?=
 =?utf-8?B?OVFaWHFqTk1TeTdZS3FDQ2p2azcrMjdDbU1OUFVOSUg1OXdldFBiRnRmQWpB?=
 =?utf-8?B?WDBJQm5lOERUY1F3ZGJpOGxDU3ZHTFltZTJQS1B6cWQ5cWlZSnlDS2VEM25u?=
 =?utf-8?B?dTNJcURlRmJMRmpBTXF6K1pFdTNaZDBRS0xrSTJ4NW5TYmxXNGVhY2RSekxx?=
 =?utf-8?B?OFZ3VnNvckE1eHBBMGZJZURsNFV0WThTbnNSRlRmMGd4TDJaZGxFS2JlS3Jz?=
 =?utf-8?B?anpNRzVFT1BaSEpQcnB5Nk1wYXViMklMZ1BsTURkdmJaWW0vb0FrNWNaSW1L?=
 =?utf-8?B?MVNtLy9hMjdBbHFyaEdXU1hMandoR1NoZE9ENVA0aGZKTzllcExIMHJaeEF2?=
 =?utf-8?B?MWhpOUpTQm1wQ2N0ZnFzQXF6c2tJbG53a1pQRWp5dkgxWnk0cGtGUXFyMklR?=
 =?utf-8?B?VUdCSk1iTldXdjJMR1hlMU44YjNDQzZ4QkFYOXh5NEVueXN1OEwxVHFXb3NX?=
 =?utf-8?B?ZTc5MHJPVDlwc1B5TnVTdz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(4022899009)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cGN3M2ZYRlZLcHhKanlOaVJ0WkZ2aFU4VjFTeWlZbzlmYnE0eHNtTy9WbHMy?=
 =?utf-8?B?U3VEMG5DbXkwVmpjTWNWK1hjZUJCOUFNOENJVnp5aVNNTDFJYnErbGc1SEd5?=
 =?utf-8?B?R25jeENtdXZTSjhwbjl4RjN5QzJwak1HOFB1Zm80S3JiQWN6RkxoYnl5bVpw?=
 =?utf-8?B?a01GRzd3M2VJam1mdUFOcFRMbVpKTllVRWE0QmF3cEFEOWJLcXlHQkxPeHkx?=
 =?utf-8?B?Y1Y2eUlTVUFLVEZYd3dnUVZKWGVmc1d5c1QyQ2JhbElvc0N6Qk5JSVN3UmVu?=
 =?utf-8?B?SXZ3NDNsQ0xKV3NqZjVPUmtWSzhWaU82NisvYm85Um90TDc2ZjRrN0NWc1lu?=
 =?utf-8?B?dG1DVGpxbzM2MGZGKzBmYy9wdEJ1SHdyNlU5STIzWFg0RE9Jc2U2Z011eUVB?=
 =?utf-8?B?b3NBemc4cWVqMEpJQm8zVkp4QWVCbEtRMUJsWm84STNKakRORHdGWGFSNlN2?=
 =?utf-8?B?bTBFS2FFUDV4a2Z1NUp5aysrbGlmZ1dsV2RGa3psWUlacC9oYmcvTTVFcm50?=
 =?utf-8?B?Z084LzBuRHVJNzl3alFVMk1ZK3puYlpOU2Fwd0sybDZ2V1hkTmMxUFlsOGdj?=
 =?utf-8?B?WkhVRkpweTAycnhGam4wenB2WkJQekVIblZ4aVRHTTFBZE0wVkZLWkttWWcv?=
 =?utf-8?B?OFEyWksybHF5YmNGam9Zb1VYWmNhODBtKzVqTlJsRWplMElCTmM0UmQrS3dQ?=
 =?utf-8?B?VDJrMkVpZ2RQSFRkQXAvR0xIWU5DeXRMajFpK05GTEZjYUZxczZrVmw5VHRN?=
 =?utf-8?B?UmJqRGU1di9VLzlKamxmSHNZOXg0akx4Q1JLdzI4ZzdlRDExaENYL1F6R3lL?=
 =?utf-8?B?bGZzUk9lNFVneEFLdXlqVGFPYlZQMEZCVDk5RFNFMVd0R0k0WUhybU91ZSta?=
 =?utf-8?B?cm1LeXVOeWlsR2hxb29PQXozSTY1bU1jZ2ZzT2pLSnFPaHhlN2xpeWxVcHJE?=
 =?utf-8?B?V1RhdUx2OC9USURtWHpvUHJaZFhnS2pTOUxjTXZKUlFzcVhpMFRkSFlaYk1D?=
 =?utf-8?B?ZCtwUkYvMDFIN1V6d3I1MW1OOVhsUm9yUWJWdVhGSm9MWG0vS3YwQzhsbTJ0?=
 =?utf-8?B?Y1FYaVE0U3NmaXptREhqR2hWdWtNaERDOU1zVVovcXhUQngwUzcycTBGUWVD?=
 =?utf-8?B?TDU1dkdIV1M1MDVmNWl2c3VQWk5sS2xBVUNVQ3l3Mk1EYy9lZjMweE81bCtN?=
 =?utf-8?B?S29Tc0Z2aWh0YzZMbkpmdmdaWGEvS1JuWE1uU3FuZlhqUEFCSDVaV1B4bWxT?=
 =?utf-8?B?R00wT3dIQWlhbkZXczJKeFpjbHl6ZEZYa09xTWpMUFA3a2ZUbkU1cm44M3Mz?=
 =?utf-8?B?Y2liek9DbXB2NXAvRWIvNE1NRzRUSTJ2eWxIMXQvUllMcUNRazNuTURBNHJp?=
 =?utf-8?B?dFJzU3NqR2dkQTh0d1pnanhoN1o4YUJpejhoZDVEVW50K29IL1cyZHBDM2Rn?=
 =?utf-8?B?MkRobG1lQmV3ZWRWRkZITjI4V2JXeUtGN2IzcEJHODN2dERENm9VVzR5aWMr?=
 =?utf-8?B?aytVNzZVUkI1UllrM1NQSDQ0bU16YktHaGl6Z25wMnRwcUtlV3E1U1hoUTRo?=
 =?utf-8?B?bEptK2xlRHFiUU5PTCtHbU5ySkZKY05WMmFkTnlKbGl1ditHWkh3UmJNczdI?=
 =?utf-8?B?ekc3VnVJWjRtcFVVYisxSzdrcXhxZnBuVmU5aW5sSndsbUNRbTEwVm82VnhU?=
 =?utf-8?B?dWQ0TlZKNzEvYnhCTURqZ01Ec2x4NnozOUdjRzNaYmRYZXRwaWt1UzVYZUJO?=
 =?utf-8?B?TThiU1B2M0t4OVkwb3hTeUs3SlNSc3I4TUpDeUdoYmxEdGliYmI0ZXBoUVJE?=
 =?utf-8?B?S3RtQUZlbjRQK3JIUVlWdG5wU0NXbE5CN3l3eVF0dEIzNTJCcUZ0TjNaRkJF?=
 =?utf-8?B?dmo0WTQ3N2JyWEdab29CV1BQKzA3L2RXN2ZpWUJ0QjUwUWFHWTExQXBwWU12?=
 =?utf-8?B?bEFPeFROdjJzVGVqUEt4eGR1bnQ2V29sZVFBekZEdU9WTG1ZUHR2R2ltbU41?=
 =?utf-8?B?ZDBLdENzUVJqZERmbXplZitCUkVIZGt3Z3JqbktQaHN0Y0VYd1Z1VG41Slhm?=
 =?utf-8?B?WUFwSFgxRjVhbGJFSHVJaWp2d0FBUDZMQml1cVo3V3hwMnRQcVp2U01Ea3NH?=
 =?utf-8?Q?c98bg7kTEO54p4PirdExFNfLM?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d813bb0-593c-42e3-9f72-08dd56164dc7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5613.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 03:33:15.9875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BanE53L68tGiZRDyAfxfURA/Awq4FMEAAiNHsLGEYRaFJuLNluTL1w3GVxFQ8eE86KhUTMmOdcvG4YoLd+g/0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7903
X-Proofpoint-ORIG-GUID: aKZA3Gdv1-_t6LwIAfBFZ5GcL6kaUQNX
X-Authority-Analysis: v=2.4 cv=UK8nHDfy c=1 sm=1 tr=0 ts=67be8b81 cx=c_pps a=H8RDR50mQ1szzU+C1Tr1+Q==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=Q4-j1AaZAAAA:8
 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=1PhRaIvRZn6IgZZww7IA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: pttoGYiLryc1dCR5ggXa2Ut1TIW-ZHMd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_07,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=999 spamscore=0 bulkscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502260025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Feb 2025 03:33:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211942

On 1/15/25 16:55, Simon A. Eugster via lists.openembedded.org wrote:
> Until now, the default title of a boot entry is its label. The label is
> a variable which determines the script to run during an early boot stage
> and is not necessarily human readable.
>
> This patch allows to provide a human-readable title for each boot entry.
>
> Signed-off-by: Simon A. Eugster <simon.eu@gmail.com>
> ---
>   meta/classes-recipe/grub-efi-cfg.bbclass    | 8 +++++++-
>   meta/recipes-bsp/grub/grub-bootconf_1.00.bb | 2 +-
>   2 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes-recipe/grub-efi-cfg.bbclass b/meta/classes-recipe/grub-efi-cfg.bbclass
> index 52e85a3bb0..9a5cb99c52 100644
> --- a/meta/classes-recipe/grub-efi-cfg.bbclass
> +++ b/meta/classes-recipe/grub-efi-cfg.bbclass
> @@ -23,6 +23,7 @@ GRUB_TIMEOUT ?= "10"
>   GRUB_OPTS ?= "serial --unit=0 --speed=115200 --word=8 --parity=no --stop=1"
>   
>   GRUB_ROOT ?= "${ROOT}"
> +GRUB_TITLE ?= ""
>   APPEND ?= ""
>   
>   # Uses MACHINE specific KERNEL_IMAGETYPE
> @@ -91,10 +92,15 @@ python build_efi_cfg() {
>           if not overrides:
>               bb.fatal('OVERRIDES not defined')
>   
> +        localdata.need_overrides()

When grepping the poky repo, I noticed the above line.
Is it necessary? Could you please double check?

Regards,
Qi

>           localdata.setVar('OVERRIDES', 'grub_' + label + ':' + overrides)
>   
>           for btype in btypes:
> -            cfgfile.write('\nmenuentry \'%s%s\'{\n' % (label, btype[0]))
> +            title = localdata.getVar('GRUB_TITLE')
> +            if not title or len(title) == 0:
> +                title = label
> +
> +            cfgfile.write('\nmenuentry \'%s%s\'{\n' % (title, btype[0]))
>               lb = label
>               if label == "install":
>                   lb = "install-efi"
> diff --git a/meta/recipes-bsp/grub/grub-bootconf_1.00.bb b/meta/recipes-bsp/grub/grub-bootconf_1.00.bb
> index 783e30bf38..7ed0877726 100644
> --- a/meta/recipes-bsp/grub/grub-bootconf_1.00.bb
> +++ b/meta/recipes-bsp/grub/grub-bootconf_1.00.bb
> @@ -22,7 +22,7 @@ python do_configure() {
>       bb.build.exec_func('build_efi_cfg', d)
>   }
>   
> -do_configure[vardeps] += "APPEND ROOT"
> +do_configure[vardeps] += "APPEND ROOT GRUB_TITLE"
>   
>   do_install() {
>   	install -d ${D}${EFI_FILES_PATH}
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#209822): https://lists.openembedded.org/g/openembedded-core/message/209822
> Mute This Topic: https://lists.openembedded.org/mt/110624139/7304865
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


