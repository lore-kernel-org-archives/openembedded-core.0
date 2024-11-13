Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFB82D637B0
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 19:58:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.20786.1731527917716328123
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Nov 2024 11:58:37 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=10478256be=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AD6ou0N018994
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 19:58:36 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42uwtuah5r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 19:58:35 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4ADJwZSg010837;
	Wed, 13 Nov 2024 19:58:35 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2048.outbound.protection.outlook.com [104.47.70.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42uwtuah5p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 19:58:35 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yJqxpColAZ6p0XGhiimqwW5gMVQ6Zpl+CZHhzXzNAZMbwTzi6AJB0vr8KkcOeeHN59f5mW4O69C5DssQkfwW71wA7CdDaSeggAZ1tHvGCBV0oqsJPDMD2YjSPYQhywww/FJ7wOUuH1EyGr0wjk7c6HOfRzGYpmgdAAV1TS9hBUHf4PkLNbTQbnIqi+IVpzzPU4ymi4LPyDwW8tzy75U8RoDlAfDTgpjPJU4wbvUx1qLyXr2WxIMamdggHXK0597yzS/Gg054wYYv1RgJ2DmxFRXMesPkiFFut2wp16yFVykO2hgDRqCTmqBOPmapjFAL7rSGKdpMCAwtUxcDwaUL2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8uzTFuHz+yHral7QEMakF7k+k6I9upGURZKKAapA6Ks=;
 b=HgwiZ+ZC3lB+D6jsyZIQ3sadVhWGQfUcJklDkFbpZrcR/kQTyIzE9pPUJ4+W5MDcOUKrgxdV3nNETUX0aRzGH1TQrQV1l+9AtibYbLLkv+xlmCkgtqskP0raLN0xk0D/KpwygXSu2YI/VpXeiUCj2zv6FCnkIM++RgUVIBUXvqYuhxOtdKpCwSyV3E1FG83fae0Xpcjg1gIc3E1oxEyv3T0K6pqcYU862kxyBhtqU2b1sidO9+Kn2kk7BZtPe9fNwDqFEmoHpKMsrjBod6GuqFm7iy6j874CI2CEvB06dkG8VzIjfmGq4yiF2i7Ca9hm55v1CR+woE80KHrNp9hIpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by MN0PR11MB6087.namprd11.prod.outlook.com (2603:10b6:208:3cd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Wed, 13 Nov
 2024 19:58:31 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.8158.013; Wed, 13 Nov 2024
 19:58:31 +0000
Content-Type: multipart/alternative;
 boundary="------------s6Pj42T3YGIS38b05WEomwIY"
Message-ID: <29602c0d-93f6-4eae-81a6-9546d9cef478@windriver.com>
Date: Wed, 13 Nov 2024 14:58:28 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] gcc-target.inc: Fix gcc symlink handling for
 multilib support
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Deepthi.Hemraj@windriver.com, openembedded-core@lists.openembedded.org
Cc: Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        leo.yan@linaro.org, Khem Raj <raj.khem@gmail.com>
References: <20241113125147.4193489-1-Deepthi.Hemraj@windriver.com>
 <da8159be7e9d212681a4c2b52643bb2b019ab462.camel@linuxfoundation.org>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <da8159be7e9d212681a4c2b52643bb2b019ab462.camel@linuxfoundation.org>
X-ClientProxiedBy: BY3PR05CA0060.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::35) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|MN0PR11MB6087:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ad5aff5-e873-49e5-5d0a-08dd041d8c3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YTg4RDhDRHdhc1VNS1ZETEVrc3J6WWpCbHhSMzE3d2gyU1J1UXo3KzBkYWlE?=
 =?utf-8?B?elpGdU5NVGFBN3BRbGVNVUhyby9oNEVhMXZ1a0pmV3phZndWdm5uckcvNmk5?=
 =?utf-8?B?aEVISTVycmZ2Z3I1UTRZbmdKY2hQNzdEYnlKam92M2M4QTVHTXIxQTZ4cWI3?=
 =?utf-8?B?enRSWWFXdDc0QlNtZGM5bXB5bWhmcXE3RXV1eVZRSWM4SXdSTXNZdVBXL0p3?=
 =?utf-8?B?NE1sMlVwYjM5c0tpblp6RndPeTJWbERPOHAzRFM5MXhvNmdmUENHL2V5MlFa?=
 =?utf-8?B?OUFQUGt3REExVGcyNFlPVm9kdmc4WndaRS9IMEpBMlpFOU5rNGR3TTBXd01Z?=
 =?utf-8?B?ZnZROXBhclRPOFdHc0NVRWxSbFhISlQzWUFxSFVoQWpVWk1aTzNQKzk0YUdP?=
 =?utf-8?B?SUcvQ0wzNE1kTnFsMFVpdFJPNVZMRlNyWnlUbGxjREdoSWdQRXhMYzIzL2tF?=
 =?utf-8?B?QVpuVU1pM0tGazZIV0RWeFphWW5WRXJaMzlqMkVtSXMxWm9tc2pGRGkrbHRo?=
 =?utf-8?B?OVFiMUlVL0gxc1N4L3BPbmJiendEUE8zUkxocnBINWM3dUkyUU1Sazd6UGtJ?=
 =?utf-8?B?RWk5MllWZ3BjdnBidzdCZnkzeDZMdm50OEVYM3RuUWhqVU5JMXNzcHlOOWgw?=
 =?utf-8?B?MlEzOFZTdk0xTU9VTnU2WTEweUsvVEt0YzlmZGp4cTVMZm1xVUJuckpCazlx?=
 =?utf-8?B?cXRocWMzbDZxN2t5R3NFZEg0b2Q5UnFLYXJVc0psQ3lPUGFLTmNES1V5dUFG?=
 =?utf-8?B?SE5WcUJpUXRPczgrOHVEb0R1T1dJQzRzTHg4SFU0Skx1UnFSdENWSllPNVc2?=
 =?utf-8?B?aER1TnF1QU1JdzV5aHNpUWZYNjRIRVdSdGhPVmtpUEFTak05UTN4ZFo4b3Iz?=
 =?utf-8?B?ZmZTVzMwM1ZmUm50VVloRUFjb3pBdWJPTWNIRkJxdW04NzcyemRFRFJFTWRT?=
 =?utf-8?B?VmRzV3A0Tk4zcGpsSmhkMG0xMklialhKaGJkbnFLMUIvQUtEK2dITWQ3N2k0?=
 =?utf-8?B?SmlmOUdxSHJaZnlEWUYwdS83NXpiNXJ5aW52MHhUNmoxaUgxdTNHTVIwd2FS?=
 =?utf-8?B?cS9YYUw0M3Y2SytWTkFmUzR2eStCK2pSb2d1aGNWdTR0WU1uWnNvTUxXMTRW?=
 =?utf-8?B?VWdlZzhEaFlDR1BZVHluRlBjZFpOc01WTW84STZhK1FjOTY1blB6dVF1T0tk?=
 =?utf-8?B?Q0xwY0xDQzIrdjlSUTdFZk5tUDBtRzQrYlFEcHYrS0xJTmZsTkFLbktYYU9L?=
 =?utf-8?B?UHZZZzgrdFJLbzNIcUVTaHBNUEhob29UYUx0bnB2VjRGTE03anRna0JyalZu?=
 =?utf-8?B?Y2ZCSUFMSTRlN3lSU3JGclRxSllaSTdJaGp2cmgrQXlFTUtSb2JXb1RsT0ZP?=
 =?utf-8?B?b280Uis0bmY5QkxYM3pQaVlqNUV6M2l5cWprZmRuSHl2K05ieVZ4U2Noc2Nk?=
 =?utf-8?B?QXdhaGhZT29GUUwzeXQwamRzNGNyRkpXV2wvQ0tjT3lqR2xjRUduR3liKzh0?=
 =?utf-8?B?YVdZazF3NlFIQjVYTElrZ3puTWo5Uy9uNCtjYXhHeXI1NkhtWmpndjNrTCty?=
 =?utf-8?B?VGRpcVJOME1SRWEybkFpRi96MmxPSmV6eEdxNElSTnlIdzJ2VXpiOTY2MUM4?=
 =?utf-8?B?L1l6RUlLdXhRWkJGeG5wbUEvcUNLRlMyUEtpZzhYU0p6Q1FkdERqT215dVBm?=
 =?utf-8?B?TGlDbGlDZmhXdFhqUWxVcGpaRWxUQXhpdjlLWXdrNVprRTFrM01qcjVRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TENwMFpWbnhMM0plZFk0N1FYRlg5aDFlclE0YVprV0IvSnJJMisxRktzOTB6?=
 =?utf-8?B?MXAvNndwYVJ3Tjh4c3hqTzBmNS9JSURYOWUveGZwdXorZFAzQ3d3a1FTelJS?=
 =?utf-8?B?d2FNQmRMcjRJcDVtbmlZWkl2VVB3V1hHMzVBQXdzdis5enhLdDZzZWo2YUZx?=
 =?utf-8?B?ZnoxNWdrU0xOSTZmSTRBbEM5OFR1d0ZHcHhXMzJ2MlVFZldCcjd4b1pHUlpM?=
 =?utf-8?B?WVlyL1NiK2I4UXA3elZwck9SaTB3TFJCaVpUbm9CZjd5aHdNS04vSitFU01D?=
 =?utf-8?B?WnlwN0FEdXhnYUIwUlpuWHY5QXhxN1NyZTJhS3ZUc2JDVkN1SnMzTy91amhr?=
 =?utf-8?B?T3Mrem1nQVBMdDhmbUdoOG1IUXFIRVBXY2hTRXNuaE0za1h5QWVHd3VESVJD?=
 =?utf-8?B?cjJqa04wOW05TFVnVEw4a1ZDRVVyOHdQTTFOd0t1QWN0UHNLUzdyNjQrMmhO?=
 =?utf-8?B?WEtUb3Q3R2N3aU5lS1hWQWluNThLYzl0N3E1UE1TRmxzOXRsYkV5UEVuOUNw?=
 =?utf-8?B?QitObzRuSkZheTJVWnFFMXh1ZTl6MFhYdGFpV2U3YW9KWGsxY1RubjRDRlFN?=
 =?utf-8?B?ZncwdU9oRnhBZXhVTkJGM3kxdERYQWxFcDVKYjZ0WlRhaVZQT1JldGd1UDRP?=
 =?utf-8?B?ZzhGc1FPb0dnQzBUWVVHU2p4LzZOWG9sb2JpNmkxdTBBSnlKSHRIL1dxdGNk?=
 =?utf-8?B?VWdZS3NVQ2JDQUJwVG5DRmgxNExpb0l5QXZ6VUNjZFF0Qyt4OFNvcnk0cnVC?=
 =?utf-8?B?d21ZQWNZOHM4VFhiZlJLeDhyQUpmRHB3UlYvOXJsZ0FHeWUwcDl0b3ZNRGhv?=
 =?utf-8?B?M0t6VXM2V3doUlVNMUtNeE9ZU1VFNEtDNGtDNS9wZ0xqbjNMcFN4N2VOMmtW?=
 =?utf-8?B?bmxVK2VVNTJvcUhhRUxHRWFDMTV1N29XUGVyY1VwRFliWjV4RzNJY0FyemlH?=
 =?utf-8?B?SW5YUE1oVTNkWm9uQWNnb3R1UDZzMmg0UFJSV2FtTGF1VU9uOGFDTzg2SHpU?=
 =?utf-8?B?ZFYwNmpzZE9nSnpYR1RFMmZFZndtNkVYQmpqL2tRays0am5GcHJMRWhPWHMx?=
 =?utf-8?B?K1lhTE4wOUhPeUdPQTNpUldoT0s4MGVnYTBpWWw2MHRXZFhIS2dwcHJDMXdm?=
 =?utf-8?B?dDJ4YmNwUTVZQmZhb0ZGM2tzaGNpdFdQVHVWYjlPR2loY2tjdzY3aytFU1BZ?=
 =?utf-8?B?NWRpTkx3WXljYW5wcUtBYUlSWXNON0hrRmxqZ2Uxd3JMZXlIaXlNM2xndU9h?=
 =?utf-8?B?QWZoaXZNblZsdTIrdkx0L0tGbkJmV0pVb0ozZTh6aHU3ZGptKzc5Vm1NN1Rs?=
 =?utf-8?B?Smw0UWNrb1dFZXFmb2JIOFZ6Qm1zeU9NTDZKeUlWbUxzWm92RldLSi9aNGQ1?=
 =?utf-8?B?OGNjaHNKS0dXVXU5bnV6ZlVLajBlSURkNmduSFpDL0FPQVlPRlBwQnFLTFF2?=
 =?utf-8?B?YlZITW5sbEhZVnUxNUI5MFU0ZmtIVG4wUkVEak1rbDBieTVwN2tHamQ5TDNL?=
 =?utf-8?B?bEg0VTZVL2NURit5QnJjSDlNb0ZqNnZRK3hSR2tsV0tSL3NkemQrOVdSM0ls?=
 =?utf-8?B?Mk42WllubXAwTU1NMGVML3Uwc2hxMjl3dlg4bWxMdmF4cTNoYlBaMVMvRXRp?=
 =?utf-8?B?VHNYSk9QVE8yci9zK2pXcHc2T1RVSjRvbWNKb2c4cCtOSTg3KzFxdklnWHFU?=
 =?utf-8?B?ZWc5NVo3RTh4RDVNZUFtTzRhdkRWdFZiQytybXN4bTlPenBZbi90WVBCMHk5?=
 =?utf-8?B?RFI1RERsaVlRRWZDdnFWT3Fhd3JNNzdPZWYvTmpsd0JzY1kxd2dVN3AxalFW?=
 =?utf-8?B?TFo5MkMxYUVNcFU3STFrTmhRVDE1TUEzd0xROGJ5R2tqVVBsLy9oc3FqalEw?=
 =?utf-8?B?QklvMzllNmRhNGxBM2lWY2M1K1hkTmNVR3dDWmo4MWJ0cGk3Q0NxS3dVenEy?=
 =?utf-8?B?ZWhyWVlrTkl1UzFSc1F4WVpVcFJ5d1JVeEJBRWNvbHNLVnpEcUlYb09nZXJI?=
 =?utf-8?B?T3hqNTFaYzhURjRZUW8zdStaVDRBSlc0Z2RocDBaMm01N2xWWnNpTlZDN3hi?=
 =?utf-8?B?NlNXM0EzdUNqOWVHdFpuWkQ1Sm1YcGw1SUhTTkpJNTNhRDhrWGRFL2JGUWlK?=
 =?utf-8?B?UnpwZjBlb0hlQ2VJNWhld0FueTE4OGFHWGFMejhzSjA1SDgxTWNJdnEzb3pE?=
 =?utf-8?B?T3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ad5aff5-e873-49e5-5d0a-08dd041d8c3c
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 19:58:31.1281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A285oKO3GMtIoHtojYbxKqZTOcBdcbPcD6fTsyoAeR63DaFxCzbxSaPjNpr8NYcnggIHeRfaS9exNFUs++kecYrQXYAttG1eb99d11/iwbY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6087
X-Proofpoint-GUID: gHk8JE_xTKPDbrr50kl_rzfaU8DVapTs
X-Authority-Analysis: v=2.4 cv=BPnhr0QG c=1 sm=1 tr=0 ts=673504eb cx=c_pps a=PK5aExQQjalka8oDlC/sVA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=jIebxsl7DnGh8b8lT9kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ag1SF4gXAAAA:8 a=3C1giwDDpkGfffvcPRIA:9 a=w2gqv1dwzoLeALHs:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-ORIG-GUID: Qg1Fvvl5CuWU2vuXmAOeGXf97OIwS23I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-13_12,2024-11-13_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 malwarescore=0 clxscore=1015 mlxscore=0 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411130164
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 19:58:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207123

--------------s6Pj42T3YGIS38b05WEomwIY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4AD6ou0N018994

Summary:

Deepthi:
 =C2=A0 to check if adding=C2=A0 bcc, bpftrace to meta-clang's=20
NON_MULTILIB_RECIPES list avoids the error and

Richard and others:
 =C2=A0 to comment on if that makes sense.

More below.

On 2024-11-13 8:23 a.m., Richard Purdie wrote:
> On Wed, 2024-11-13 at 04:51 -0800, Hemraj, Deepthi via lists.openembedd=
ed.org wrote:
>> From: Deepthi Hemraj<Deepthi.Hemraj@windriver.com>
>>
>> Enabling multilib support and adding both lib32-gcc-symlinks and gcc-s=
ymlinks
>> to the image installation results in a conflict between
>> gcc-symlinks-13.3.0-r0.corei7_64 and lib32-gcc-symlinks-13.3.0-r0.core=
i7_32.
>> Following error occurs because of the conflict:
>> "file /usr/bin/gcc conflicts between attempted installs of gcc-symlink=
s-13.3.0-r0.corei7_64 and lib32-gcc-symlinks-13.3.0-r0.corei7_32"
>>
>> The conflict occurs because both packages try to install files in the =
same location,
>> causing installation errors during the build process.
>>
>> Updated the gcc target recipe to correctly handle symlinks for multili=
b support by using ${MLPREFIX}gcc
>> instead of just gcc for the gcc binary symlink in ${PN}-symlinks.
>> This ensures that the symlinks point to the appropriate multilib gcc b=
inary for 32-bit and 64-bit configurations.
>>
>> Signed-off-by: Deepthi Hemraj<Deepthi.Hemraj@windriver.com>
>> ---
>>  =C2=A0meta/recipes-devtools/gcc/gcc-target.inc | 4 ++--
>>  =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-d=
evtools/gcc/gcc-target.inc
>> index 6b47c10413..ff59eb1b52 100644
>> --- a/meta/recipes-devtools/gcc/gcc-target.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-target.inc
>> @@ -71,7 +71,7 @@ FILES:${PN}-dev =3D "\
>>  =C2=A0"
>>  =C2=A0FILES:${PN}-symlinks =3D "\
>>  =C2=A0=C2=A0=C2=A0=C2=A0 ${bindir}/cc \
>> -=C2=A0=C2=A0=C2=A0 ${bindir}/gcc \
>> +=C2=A0=C2=A0=C2=A0 ${bindir}/${MLPREFIX}gcc \
>>  =C2=A0=C2=A0=C2=A0=C2=A0 ${bindir}/gccbug \
>>  =C2=A0"
>>  =20
>> @@ -182,7 +182,7 @@ do_install () {
>>  =C2=A0		ln -sf gfortran f95 || true
>>  =C2=A0	fi
>>  =C2=A0	ln -sf ${TARGET_PREFIX}g++ g++
>> -	ln -sf ${TARGET_PREFIX}gcc gcc
>> +	ln -sf ${TARGET_PREFIX}gcc ${MLPREFIX}gcc
>>  =C2=A0	ln -sf ${TARGET_PREFIX}cpp cpp
>>  =C2=A0	ln -sf ${TARGET_PREFIX}gcov gcov
>>  =C2=A0	ln -sf ${TARGET_PREFIX}gcov-tool gcov-tool
>>
> No, sorry, but definitely not.
>
> You can install one of these or the other but both doesn't make any
> sense, just don't do that.

I agree that one should avoid this if possible.

In our WR Linux bug description, the issue seems to be that:
if you have a 64 bit kernel, and a 32 bit userspace image and you add:
 =C2=A0=C2=A0 IMAGE_INSTALL:append =3D " bpftrace"
in conf/local.conf then the error occurs.

You can't use lib32-bpftrace since that's not supported apparently:
 =C2=A0=C2=A0 COMPATIBLE_HOST =3D "(x86_64.*|aarch64.*|powerpc64.*|riscv6=
4.*)-linux"
From:
https://github.com/kraj/meta-clang/commit/952f28c59439a146032b14260d5f6ad=
69d83426e
and for bcc, that's done, without explanation in the commit log, in:
https://github.com/kraj/meta-clang/commit/93511705


By the way, this isn't a urgent, or critical use case.
It was just found in testing and seems like it's worth trying to get to=20
the root cause.


Deepthi,

Please confirm that you are able to reproduce the issue using just poky=20
and meta-clang.
I want to be sure that this is not a bug in WR Linux.

Also, does the issue go away if you add bcc, bpftrace to=20
NON_MULTILIB_RECIPES in the meta-clang layer? see 1), below.


>
> I also don't understand how this fixes things since surely all the
> other symlinks conflict too?

Yes!

We'll have to see if we actually care about lib32-gcc-symlinks.

The only use case that I can see is to be able to easily install both 32=20
and 64 bit toolchains, symlinks
on target to be able to build say a kernel module and a userspace=20
package for self-hosted
development.

../Randy



1) Some info (from scarhtgap) on NON_MULTILIB_RECIPES

poky.git on scarthgap
=E2=9C=A6 =E2=9D=AF rg NON_MULTILIB_RECIPES
meta/classes/multilib.bbclass
20:=C2=A0=C2=A0=C2=A0 non_ml_recipes =3D d.getVar('NON_MULTILIB_RECIPES')=
.split()
33:=C2=A0=C2=A0=C2=A0 # We nearly don't need this but dependencies on=20
NON_MULTILIB_RECIPES don't work without it

meta/classes/multilib_global.bbclass
187:=C2=A0=C2=A0=C2=A0 non_ml_recipes =3D d.getVar('NON_MULTILIB_RECIPES'=
).split()

documentation/ref-manual/variables.rst
5606:=C2=A0=C2=A0 :term:`NON_MULTILIB_RECIPES`
5611:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NON_MULTILIB_RECIPE=
S =3D "grub grub-efi make-mod-scripts=20
ovmf u-boot"

meta/conf/multilib.conf
27:NON_MULTILIB_RECIPES =3D "grub grub-efi make-mod-scripts ovmf u-boot"


meta-clang.git on master
=E2=9C=A6 =E2=9D=AF rg NON_MULTILIB_RECIPES
conf/layer.conf
38:NON_MULTILIB_RECIPES:append =3D " llvm-project-source"

> Cheers,
>
> Richard


--=20
# Randy MacLeod
# Wind River Linux

--------------s6Pj42T3YGIS38b05WEomwIY
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4AD6ou0N018994

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">Summary:<br>
      <br>
      Deepthi:<br>
      &nbsp; to check if adding&nbsp; bcc, bpftrace to meta-clang's
      NON_MULTILIB_RECIPES list avoids the error and <br>
      <br>
      Richard and others:</div>
    <div class=3D"moz-cite-prefix">&nbsp; to comment on if that makes sen=
se.<br>
      <br>
      More below.<br>
    </div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">On 2024-11-13 8:23 a.m., Richard Purdi=
e
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:da8159be7e9d212681a4c2b52643bb2=
b019ab462.camel@linuxfoundation.org">
      <pre wrap=3D"" class=3D"moz-quote-pre">On Wed, 2024-11-13 at 04:51 =
-0800, Hemraj, Deepthi via lists.openembedded.org wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">From: Deepthi Hemraj <a cl=
ass=3D"moz-txt-link-rfc2396E" href=3D"mailto:Deepthi.Hemraj@windriver.com=
">&lt;Deepthi.Hemraj@windriver.com&gt;</a>

Enabling multilib support and adding both lib32-gcc-symlinks and gcc-syml=
inks
to the image installation results in a conflict between
gcc-symlinks-13.3.0-r0.corei7_64 and lib32-gcc-symlinks-13.3.0-r0.corei7_=
32.
Following error occurs because of the conflict:
&quot;file /usr/bin/gcc conflicts between attempted installs of gcc-symli=
nks-13.3.0-r0.corei7_64 and lib32-gcc-symlinks-13.3.0-r0.corei7_32&quot;

The conflict occurs because both packages try to install files in the sam=
e location,
causing installation errors during the build process.

Updated the gcc target recipe to correctly handle symlinks for multilib s=
upport by using ${MLPREFIX}gcc
instead of just gcc for the gcc binary symlink in ${PN}-symlinks.
This ensures that the symlinks point to the appropriate multilib gcc bina=
ry for 32-bit and 64-bit configurations.

Signed-off-by: Deepthi Hemraj <a class=3D"moz-txt-link-rfc2396E" href=3D"=
mailto:Deepthi.Hemraj@windriver.com">&lt;Deepthi.Hemraj@windriver.com&gt;=
</a>
---
&nbsp;meta/recipes-devtools/gcc/gcc-target.inc | 4 ++--
&nbsp;1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devt=
ools/gcc/gcc-target.inc
index 6b47c10413..ff59eb1b52 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -71,7 +71,7 @@ FILES:${PN}-dev =3D &quot;\
&nbsp;&quot;
&nbsp;FILES:${PN}-symlinks =3D &quot;\
&nbsp;&nbsp;&nbsp;&nbsp; ${bindir}/cc \
-&nbsp;&nbsp;&nbsp; ${bindir}/gcc \
+&nbsp;&nbsp;&nbsp; ${bindir}/${MLPREFIX}gcc \
&nbsp;&nbsp;&nbsp;&nbsp; ${bindir}/gccbug \
&nbsp;&quot;
&nbsp;
@@ -182,7 +182,7 @@ do_install () {
&nbsp;		ln -sf gfortran f95 || true
&nbsp;	fi
&nbsp;	ln -sf ${TARGET_PREFIX}g++ g++
-	ln -sf ${TARGET_PREFIX}gcc gcc
+	ln -sf ${TARGET_PREFIX}gcc ${MLPREFIX}gcc
&nbsp;	ln -sf ${TARGET_PREFIX}cpp cpp
&nbsp;	ln -sf ${TARGET_PREFIX}gcov gcov
&nbsp;	ln -sf ${TARGET_PREFIX}gcov-tool gcov-tool

</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">No, sorry, but definitely no=
t.

You can install one of these or the other but both doesn't make any
sense, just don't do that.</pre>
    </blockquote>
    <p>I agree that one should avoid this if possible.<br>
      <br>
      In our WR Linux bug description, the issue seems to be that:<br>
      if you have a 64 bit kernel, and a 32 bit userspace image and you
      add:<br>
      &nbsp;&nbsp; IMAGE_INSTALL:append =3D &quot; bpftrace&quot;<br>
      in conf/local.conf then the error occurs.</p>
    <p>You can't use lib32-bpftrace since that's not supported
      apparently:<br>
      &nbsp;&nbsp; COMPATIBLE_HOST =3D
      &quot;(x86_64.*|aarch64.*|powerpc64.*|riscv64.*)-linux&quot;<br>
      From:<br>
      &nbsp;&nbsp;
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/kraj/meta-c=
lang/commit/952f28c59439a146032b14260d5f6ad69d83426e">https://github.com/=
kraj/meta-clang/commit/952f28c59439a146032b14260d5f6ad69d83426e</a><br>
      and for bcc, that's done, without explanation in the commit log,
      in:<br>
      &nbsp;&nbsp; <a class=3D"moz-txt-link-freetext" href=3D"https://git=
hub.com/kraj/meta-clang/commit/93511705">https://github.com/kraj/meta-cla=
ng/commit/93511705</a></p>
    <p><br>
    </p>
    <p>By the way, this isn't a urgent, or critical use case. <br>
      It was just found in testing and seems like it's worth trying to
      get to the root cause.<br>
    </p>
    <p><br>
    </p>
    <p>Deepthi, <br>
    </p>
    <p>Please confirm that you are able to reproduce the issue using
      just poky and meta-clang. <br>
      I want to be sure that this is not a bug in WR Linux.</p>
    <p>Also, does the issue go away if you add bcc, bpftrace to
      NON_MULTILIB_RECIPES in the meta-clang layer? see 1), below.<br>
    </p>
    <br>
    <blockquote type=3D"cite" cite=3D"mid:da8159be7e9d212681a4c2b52643bb2=
b019ab462.camel@linuxfoundation.org">
      <pre wrap=3D"" class=3D"moz-quote-pre">

I also don't understand how this fixes things since surely all the
other symlinks conflict too?</pre>
    </blockquote>
    <p>Yes!</p>
    <p>We'll have to see if we actually care about lib32-gcc-symlinks.<br=
>
    </p>
    <p>The only use case that I can see is to be able to easily install
      both 32 and 64 bit toolchains, symlinks<br>
      on target to be able to build say a kernel module and a userspace
      package for self-hosted<br>
      development.<br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <p>1) Some info (from scarhtgap) on NON_MULTILIB_RECIPES</p>
    <p>poky.git on scarthgap<br>
      =E2=9C=A6 =E2=9D=AF rg NON_MULTILIB_RECIPES<br>
      meta/classes/multilib.bbclass<br>
      20:&nbsp;&nbsp;&nbsp; non_ml_recipes =3D d.getVar('NON_MULTILIB_REC=
IPES').split()<br>
      33:&nbsp;&nbsp;&nbsp; # We nearly don't need this but dependencies =
on
      NON_MULTILIB_RECIPES don't work without it<br>
      <br>
      meta/classes/multilib_global.bbclass<br>
      187:&nbsp;&nbsp;&nbsp; non_ml_recipes =3D d.getVar('NON_MULTILIB_RE=
CIPES').split()<br>
      <br>
      documentation/ref-manual/variables.rst<br>
      5606:&nbsp;&nbsp; :term:`NON_MULTILIB_RECIPES`<br>
      5611:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NON_MULTILIB_=
RECIPES =3D &quot;grub grub-efi
      make-mod-scripts ovmf u-boot&quot;<br>
      <br>
      meta/conf/multilib.conf<br>
      27:NON_MULTILIB_RECIPES =3D &quot;grub grub-efi make-mod-scripts ov=
mf
      u-boot&quot;<br>
      <br>
      <br>
      meta-clang.git on master <br>
      =E2=9C=A6 =E2=9D=AF rg NON_MULTILIB_RECIPES<br>
      conf/layer.conf<br>
      38:NON_MULTILIB_RECIPES:append =3D &quot; llvm-project-source&quot;=
<br>
      <span style=3D"white-space: pre-wrap">
</span></p>
    <blockquote type=3D"cite" cite=3D"mid:da8159be7e9d212681a4c2b52643bb2=
b019ab462.camel@linuxfoundation.org">
      <pre wrap=3D"" class=3D"moz-quote-pre">
Cheers,

Richard
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------s6Pj42T3YGIS38b05WEomwIY--

