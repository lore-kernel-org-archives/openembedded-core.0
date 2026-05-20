Return-Path: <Quan.Sun@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C13F3CD4F5E
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 20:25:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22032.1779308739440838907
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 13:25:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=i370MJbr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=96008878a8=quan.sun@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KFG8XS2344647
	for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 20:25:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=oDPdKbD+F5GLnN+/4MJsMR9n3XZ1p7SUKaW++DD5SzM=; b=
	i370MJbrIMKrPGpPRHyaCQJrwQMSc3ftIT88spWnsY6B56VOtR4y96hv9K1OVaFc
	B+zJJ7c2U3cYIuiFyqUDAv7YSzC5NJ9CxuLjobZ7z9z7rQ1Ej+4DQTNybCndGeik
	0Bi1XEenb3qcPJl5TZeiUKi83yRJ33HuKkTz1U1YVmTMnRepmehL5jnP0BBD+690
	uCEgWfrdSS2CRPftdmkFlB5VaJIcUZbhZsI5PDSI1Jrv+/yiMu3YRxGUPLzTbHzC
	VHPurrtsPdT9R/419E8FeGNjxb3sgWp8gY1EyCV5qVJYMYXlqnCXmrJqnv5YjC49
	0svKRiTvJqIAX9XjAT1n5A==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011001.outbound.protection.outlook.com [40.107.208.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6fj3x30c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 20 May 2026 20:25:37 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nlBrSUmgTJDM5Ughf4IP/jzVpEPjX2SmKYfaqJ9VcGf9bV8bZ2SugU25xgZyiIlARFBsGNNE/zoE0eeAFTKP/g4rN4oRDrFi0Kb6Vttr5b9seAGHPTQSM2s4WhkEgw6sRhjNiYihGpTobTrvxWEeCg0lb7O5a4spzzMFvGCuNFnnhf8bL3l2Bj3/Q0xjUlk/BY+z8KAB3SZYbbKIsTg1kBQcPjXNAEq5a0O13KUSff4ni2tTtfbL7OIeu4+scq5AJcabD7HX2Nmda1HJsltpwrydwuP8impynYcttLg6uooEqCTYLAUt0MyHk3XU0MMg8SShVCd0v/tI+YFoTmoWPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oDPdKbD+F5GLnN+/4MJsMR9n3XZ1p7SUKaW++DD5SzM=;
 b=IV/FbSET4Cazgnmy/tbadEk4OUV/lhVsYUNBE/YmmuXyXYpCiYd0lKFWdcLX/cm/YKGTdK3P87/cL2Je4l0hfHNttYkuw+pPGGVx0Y1Xb78bSQv99fBgU1t/be3z9CKpQvuf3KC+mtWsSA0nPXWOZfAdqCOO37QgK/BoFSlTEyZt9vwiK0+caY+VOs5jo0CrSqNxO9tCoD58N1nqTHdxSSbt72voXPdvEC4lHqihEgsMSpux0vVaGKG8+qd6abUHvub6lwxbzThVMcekVVGXm1CPsC8U5vNYFLTKfpAm7LaMU7bRFGgA4qdUr26xZDmCrAXTTZ7p9/M2/BJk0i5AnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB7283.namprd11.prod.outlook.com (2603:10b6:208:439::10)
 by PH8PR11MB6708.namprd11.prod.outlook.com (2603:10b6:510:1c7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 20:25:33 +0000
Received: from IA0PR11MB7283.namprd11.prod.outlook.com
 ([fe80::6e41:656f:120e:8e8]) by IA0PR11MB7283.namprd11.prod.outlook.com
 ([fe80::6e41:656f:120e:8e8%5]) with mapi id 15.21.0025.023; Wed, 20 May 2026
 20:25:33 +0000
Message-ID: <3e4f1f40-ec7c-40f2-baef-d9522c1a4de7@windriver.com>
Date: Wed, 20 May 2026 16:25:31 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] qemu: fix iotlb_to_section() for different
 AddressSpace
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
Cc: Randy MacLeod <randy.macleod@windriver.com>,
        "antonin.godard" <antonin.godard@bootlin.com>
References: <20260511205209.511914-1-Quan.Sun@windriver.com>
 <6c03f986e436cacfacbf9bef36bb4e37d75b7cf8.camel@linuxfoundation.org>
Content-Language: en-US
From: Quan Sun <Quan.Sun@windriver.com>
In-Reply-To: <6c03f986e436cacfacbf9bef36bb4e37d75b7cf8.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: YQBPR0101CA0117.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::20) To IA0PR11MB7283.namprd11.prod.outlook.com
 (2603:10b6:208:439::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7283:EE_|PH8PR11MB6708:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f787806-746c-43bd-e532-08deb6adf157
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|4143699003|18002099003|56012099003|22082099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	8TJNUfydO80qKEiOLHHN4wiYCMJbiwHY1JEijUwylzl3KxqfTmOf0MnbPucHZcHCjZsIxp6XmRpaQQgg3Q4g7Ls0tD4UDvAAkriyBV4blGkcFEFFqZye4iLwLoKGeC4xGWKu0F2vzY6f0kTuu2HtW9cgKTLSA3/6nzJ3wTixXvdScMOERjIK41uU5aE0q6TeTd4shBzGE4tMh/8uO9O10kBu2twQA2BC4OSQmdiSOwlOQBqETQXcjHI2ay+mNFJdiprDkl8ZbdN24lsxCFSYyuuM7Vm1y1H0srpX84kD8vda3FRw7uifcq2xuhqnKaoWWwcheq6AoNYhj9PytbAN2u/h0xUdJpxPRhj3c8GysbmywBQXJ/4aNyOCV8hi2LEV0alod76g4pjl0zYC9CFulDqBpEbiy9n1eh7kXmxjmqmr8qN7SVZebVipeDlVgvsegZ2MtU16vMjC7WD3Vv13hgz8cLVkaGlEh5agw/odKKZbFW9m5Jf01+VZO8UhcvODtib+iOUU0xfIheiAyKsyuInbn5L77t6w+nxB28UgI3JSbkdlBk5ouHI93IxDCJbdh/VA5SQIaSS0ikgMS9S2jjvgFYRFnh22gX1y5RAu1Y8tuA6MV+Pk4pd8ZlsETlMqC2NEgMZtckafGJCZJsVOZA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(4143699003)(18002099003)(56012099003)(22082099003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b2hWbzJ5SjVHTHNmckJGYVYxa3pyNzhPY1JaRjN0a1ZPSm16aFpoRGdqQ3dL?=
 =?utf-8?B?ck1rWVdKOW5ISTQ3dkF0NENvdWQ4dDU0VU5WVlRSWVZxaHorc3pmYTZINWNO?=
 =?utf-8?B?SXQ2Vk5xRWlmaWV3VWJoSUhoRENwWTdqRUk2aDhtU1N3U01ZVzh4NVFjS0Vx?=
 =?utf-8?B?ckNFdXk3S0pJa3h2THkxUjhKeXozWU1WSDZjbXo4VTQzaFlySFlzaWlmMEdN?=
 =?utf-8?B?NVlXQklEQ0ZPcCtoeEkzM3BqRmtYUHc0RExvaGZobWxybkhIK1E5NXJ2SkRU?=
 =?utf-8?B?N2xBSjZpRGRsTWs4ZDdYNll4eHZFOTdLSUwxclJzV05DTXMwd1lJMmZtZDNw?=
 =?utf-8?B?cTViY3kyRk4zWlNmUFUrNVhBUTBLQUoyWHZIMVNwMnJaNDR3TUJUWThwL3M4?=
 =?utf-8?B?KzVHR2RnbkFkVHU5YTFPM0g5Ukk1ME9qTStmOE5WN3BjTVVkTXRIQWg1Wk93?=
 =?utf-8?B?NXlTQno0dlB5ZEkvcXZZQ3VvS1FPb2xZWU80eFFLU3lKaW9IS291d3NqNGdB?=
 =?utf-8?B?ZkZpR2tNU0VZN3dyeVpYZGpFazdSeTNMNUlaT0QvMk84M3YrRmNTQlQ3N201?=
 =?utf-8?B?bm9DellscDhYUFJuclpIRXl0cDhxNlpmZi9pM3Jqb0tmd0htMHZQdmlIa2ZY?=
 =?utf-8?B?dmJjT203NTl0ZEkrbXAyR0d6R1ZrdVdIQXNEVEM3T0pGbmZyaHBhQkQxT1pw?=
 =?utf-8?B?SjFyUTQ4MVpRdHBEb21xT2xwc3AxdHpTRDM2bnd5L29aWDdaZmh6dWt2SzVk?=
 =?utf-8?B?elZTWU9hTUxCV2hUNkF3SEN2WmwrWE5rd2E3TkNtR21VWDNKdTFuUGtHRkhP?=
 =?utf-8?B?STdwZCtRdE9IcjVnMStOZ2dPd0VJNUJ2ZGlXaHN6a210OVM1R1VkbjZ1bk10?=
 =?utf-8?B?UkdkcVFhOTFlZ2k5cmZvZXowVTh4bjlyYnUrVE93dDQwTytVcEdyd1ZXTE1x?=
 =?utf-8?B?Q0trdVltODNFWkhuYXg5RGx5VjVYVU0wUWNWOWl6bFZUWm1yUmhjcnphdG01?=
 =?utf-8?B?YlJBclNSUFl2WU9UQUw3MmlrMEtkT2lKZCswMlBtOFJ5U0ZjZ05JaUd2NHVJ?=
 =?utf-8?B?TUdaSjdYWW5NL0lTSFV4MXZqRGprU01vejNQUjVwSHNYRmpSTVV1cWErLzlW?=
 =?utf-8?B?QUtyb2g5dVpTeVkxVStaZFdzcURMSk84OHlHU1h5S2xwSnJRS0QrcEYvUHlC?=
 =?utf-8?B?Wk1kZXdiMEkybGRNYitOaUlXUzQ2YUhOd0NLYXgxMFhzTUNCbGJiWS9LeWlN?=
 =?utf-8?B?NXZmNjVvaXNMVjU0WjZrOGg2dllCNWxON3BJVlR0M0VMQko3bHZiZEUrdW9B?=
 =?utf-8?B?ajlITWJFd0R3ejNIM1ZwZWpPNG1OM2tPenBzeDN3WHIydWM0UWFlUy82Ykx0?=
 =?utf-8?B?R1JpcXEweXQrbzhaSEVGUzRnbHFFczZRVDNldVNFR2NDM1dDbnU4cHRvdHZZ?=
 =?utf-8?B?b244ZWE4THVJOE1oMWt2ZVJDbWk4ZW96dVQrRjFlcVVSdlNjRXBtcHBvVUpl?=
 =?utf-8?B?ZUZJWDVRajN3QitVbUozODRXVlNMaEplVGhxUDgwNGZhMGNTbFBEZWF5SVRn?=
 =?utf-8?B?aUtVNlJJelZYRlhOZmxEMlM5VXZvcWttRVkyVm9FRHRSdGJuL0JyZjA2R1NY?=
 =?utf-8?B?dSt1K1VzS1BmTHhvNnh0ZzVLUlo2MFR5RUJPUzRUYVNTckdnTkVsSllSMjlX?=
 =?utf-8?B?ZDMxQ0doZjZBeW5uWWgwNGVoSElQTUE1NDk2V1hPQS9kWGQyZDYvaXJodC94?=
 =?utf-8?B?VkJHVFJRNTNZYkRvRUVOR00vbU1GVU1GUkxEaUp0aE1Ga3Nyb2JobDExUnFO?=
 =?utf-8?B?dUsyZGxES1VyaUlQdlpJN3JaYXp2dG1TclQreWJKVmhTMXMwVm9jTHZMSGFW?=
 =?utf-8?B?ai9YVFlLSEsrbWZ4VGVTVlRnUmJaSEpBclNSaDkydmFKRmVqdC9qZWkvQUE4?=
 =?utf-8?B?Qi9BRWY0RmtKSU16Q0F2SVRBWWhlWWU5Vjk2QlhYUjlkSlZWVDFKUmVOQ0VE?=
 =?utf-8?B?WmNNaS9UK1JXVDhydmtBb1ZaUmVDVG5hb0Y0amhvQ2J2UWU3MnpzNmtjR0R2?=
 =?utf-8?B?aVFmWFROM3haNGdpTTlMdWk4MEQ2bUVuTXR6NENrTlh4OHc3cVV2RWRQQjZ6?=
 =?utf-8?B?OGxPMlk3R0xSMmdCcm5SeTVGeDlPWUdsaDkrMmFHV093WjA3K3N6TnluY1d2?=
 =?utf-8?B?RFBWRVloQXZldGhGbm5ndEVVR3l2cXI0L3l5Q20yeFNoeUkwNFVMY2xRVkhI?=
 =?utf-8?B?bjZCQnJDZ3hMUk12bzNwc29DZW5lZTd3NTFKUldqd09wS1lCeWh0YVVDcy9m?=
 =?utf-8?B?bGQ2eDQ5S3dJWjlJT3hjUzA2ZHB0bGFJSVZuSnQvQUUzSkFzTk94Zz09?=
X-Exchange-RoutingPolicyChecked: 
	Im7Xqs+EDjJmr/FCm2/w4rpx82NG1ZwV/FQPFvOevMZr9ozc/YCQWalmuQHorNzaH/Mxmg8uezpvAQ4xqLXwVDsimDG7pxOWd5l6/CVVMAyICmYDyZv8E0Qnm74bIddxAaSZvY7/407+BkYwytzsF3RJ5/bqONLTE3a9TxoSKiqXBUL2T9t4gLgH8BWnaPumVRt3XfKqcyK/0+o+uSkAmrP23TzYym7SlHu7eTP64/IP/lVGm7C3Z+4ETGFK1NaH91OdZUUKM2I7EIEfbJvbpZFEhejAMliknW2n2HbvSK95FWDjj7f6+a0+vHjre1oMYAPfcQhZPD+DMMF7zCDYkA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f787806-746c-43bd-e532-08deb6adf157
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 20:25:32.9752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HCrnftjBTeFUmUiq9uZWuuviJiWE6OPqTAMrREE8DwFu7KCGf670Vvvu0kxUhgkTvYzrcWQtVUiG4pExXC0EBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6708
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: JflUq_P_Oe5on2YVH4jsFZk_VQmQUd0M
X-Proofpoint-ORIG-GUID: wcOtwXbOoZBNHhoRooaYzVXrQ7JfTtTn
X-Authority-Analysis: v=2.4 cv=VssTxe2n c=1 sm=1 tr=0 ts=6a0e18c2 cx=c_pps
 a=+gGuMjfID3j0L7k8h/8w9A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=X6hXcU7WkWuPGJr4uHsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE5OSBTYWx0ZWRfX3O2BD7gGX2bU
 gtGPaDrBC7ILPg9G0MQ9QuCB9x5+qkANwpM8078nk0QcpeheajYlzviHQdudD0qRUJI9e2VOFyq
 YXy8VeuP9NZIz38n/6+xUMQCF5Y7ZEGsqdZIx2QMObJOg51+QDkoknL5GA3faY+DGTe/jF8rlpo
 q5j0vHGHta6Bqi4FdmZkbK/Hh62aVHT3cYzjHnS26haqV5AHbrCIVD/HcDlF7lzFuQfVBViW5up
 W7M3A87I0oS2KJwZuE0YAF+I2KqOOmxJA1xj/QDxnkQgf2ZVGHKuLBsQqDRjj4CUfnxX6KMVHJD
 yrbeaiAC/JEYGcK6XM8gAXRQGGV/QuM7+c880CYX5p8eJttZgH7pvhcAa6TXYhwqSqgZqsd+50C
 E7QcVaroODmxeigUjbzh7R2iOWBjdFJKs4KtLbf0Gywjpf3qNwdDfLuB1VQeiy0/ZiWS/gXgeQv
 pgvgI9+KfZ+MChP3xRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200199
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 64KFG8XS2344647
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 20:25:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237467


On 5/20/26 6:36 AM, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Mon, 2026-05-11 at 13:52 -0700, Quan Sun via lists.openembedded.org =
wrote:
>> From: Quan Sun <Quan.Sun@windriver.com>
>>
>> Backport upstream commit 854cd16e318e ("accel/tcg: Fix iotlb_to_sectio=
n()
>> for different AddressSpace") to qemu 10.2.0.
>>
>> The bug causes incorrect memory load/store when CPU access goes throug=
h
>> an IOMMUMemoryRegion that returns a different target AddressSpace, and=
 the
>> fix replaces the section_index lookup with a direct MemoryRegionSectio=
n
>> pointer stored in CPUTLBEntryFull.
>>
>> Note that the fix primarily targets ARM/RISC-V, but since it eliminate=
s
>> iotlb_to_section() and performs the lookup based on CPUTLBEntryFull,
>> it may also help address some currently observed QEMU boot issues
>> on x86, e.g. the https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1=
6259.
>>
>> AI-Generated: kiro-cli
>>
>> Signed-off-by: Quan Sun <Quan.Sun@windriver.com>
>> ---
>>   meta/recipes-devtools/qemu/qemu.inc           |=C2=A0=C2=A0 1 +
>>   ...tlb_to_section-for-different-Address.patch | 274 ++++++++++++++++=
++
>>   2 files changed, 275 insertions(+)
>>   create mode 100644 meta/recipes-devtools/qemu/qemu/0001-accel-tcg-Fi=
x-iotlb_to_section-for-different-Address.patch
> I noticed this failure on one of my current builds:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/80/builds/3615
>
> which looks a bit like some of the errors we were hoping this fixed?
>
This looks like a graphics-related issue (I remember earlier we had=20
similar one). The last kernel message is about the PL110 display=20
controller and deferred probes. The Sato image starts X11/Sato desktop=20
which requires the framebuffer to be functional. If the display device=20
doesn't complete=C2=A0 initialization, X11 startup blocks, which blocks t=
he=20
init sequence, which prevents the login prompt from appearing. It's=20
possible this issue may still exist even with QEMU upgraded to 11.0.0.

Thanks,

Quan


