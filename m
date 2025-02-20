Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56BB6C021AD
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 06:03:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.43547.1740031410110615338
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Feb 2025 22:03:30 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=414618de0a=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51K4hNN9023353
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 06:03:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44w00khyp2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 06:03:28 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51K63SmQ009471;
	Thu, 20 Feb 2025 06:03:28 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2046.outbound.protection.outlook.com [104.47.58.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44w00khyp0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 06:03:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FwylEm7FcBccF9wO4kXvGycFO1PzJAq/NMxgUEvcnnClVKzpOMjVtMafw31WW8VeeWLB43j3OCtwPZPnj0IvoF95i36nE8VU5QgVsfsIkf/mcOGP3SMBQReQd+yf9yLwLyd1QIGo6ZqwYtJCxh1L7ZYkygSEf74+myIaras+KICP1RvB8ufKFbbtUcOtwytJNVjyeyVVvsUj4gTSsRHGtAnp7CB9U810v5TsZB7wuV01ygYYJ4QPGZi36VnaVZjxU8L1gLDSp49WoY2q/cBHnEusqHiZ3HkUTCsCNmvg8akUIW7cggeeh37iy2ZlqlmcboJod1ezD1hRjSF5mwHrdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xx2iU/HvgN9hAvvC05mT6MmMoQwFasD1Ivpextca7zE=;
 b=KuAMe8jfGfHVGLp+iSXyZhHkbucWGR0+X5iz/YruVDyzssQ8qYLgt96WfUG4TqHLt/vzVVnk12VFCBstTJCE674EcdmVPBTyLzc7x8T5n5erZmG4KUql5b3cyLVStZPvGKHEJSnXABaiUxXKUTC5pCCgeCZLH2KTDhJIfG6l0FL8yGVMDtFuPptyUJvUCNhefqWFPZYWF7wOC5z2wU34+Ko0HhdXN2A+lYf4Jy3VDu8TX7mDxE+LbLVrJC1ipFwT70xVlkJuK2uxQRhg6eT6xHUwcFa1bX0pBxKj6pEeuRfdj2eWLtpqssirJsaJUa0CrSVhXx8ipHuJXWelKtn71w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB8264.namprd11.prod.outlook.com (2603:10b6:806:26c::17)
 by IA0PR11MB7955.namprd11.prod.outlook.com (2603:10b6:208:3dd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Thu, 20 Feb
 2025 06:03:18 +0000
Received: from SN7PR11MB8264.namprd11.prod.outlook.com
 ([fe80::e92:66a8:56ff:f569]) by SN7PR11MB8264.namprd11.prod.outlook.com
 ([fe80::e92:66a8:56ff:f569%7]) with mapi id 15.20.8466.015; Thu, 20 Feb 2025
 06:03:18 +0000
Message-ID: <9b7d0f0a-75b1-491a-86d4-d0f2922587a2@windriver.com>
Date: Thu, 20 Feb 2025 14:03:06 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [kirkstone][PATCH 1/2] Revert "ovmf: Fix
 CVE-2023-45237"
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org, soumya.sambu@windriver.com
References: <20250219102151.4000494-1-kai.kang@windriver.com>
 <CAOSpxda-k+BcRkcQXzFe2D=gDyj_kKb+=YFVNnVeK4=fD=q1qg@mail.gmail.com>
Content-Language: en-US
From: Kai <kai.kang@windriver.com>
In-Reply-To: <CAOSpxda-k+BcRkcQXzFe2D=gDyj_kKb+=YFVNnVeK4=fD=q1qg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYWPR01CA0039.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::14) To SN7PR11MB8264.namprd11.prod.outlook.com
 (2603:10b6:806:26c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8264:EE_|IA0PR11MB7955:EE_
X-MS-Office365-Filtering-Correlation-Id: 95840665-18a2-4ced-3f13-08dd51744564
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|4022899009|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZjhnQzVzVVFsQ1c1dG1DWkVDU2ExUXNKaVZ0Q1hiZ241ZGkraVJFZGhXTXA1?=
 =?utf-8?B?VE54ZEhPZjZPMGpMUGw2OWtBRWRrcTJINXVISkpEa1lnWWlhVXkwVjlZTFRz?=
 =?utf-8?B?ejk5ZDdhQTg4NkF1eExWRjhmdEhvcWs5K016RmFuV25seHRiR3BIZTJiYml2?=
 =?utf-8?B?eHh6TVRuMnNsVDRxWlVvWDltYmRvY3NQaTJ5QUpLaGJwMHdyTjhqS2RyUHpJ?=
 =?utf-8?B?RTZzTTZ2Q05pZXJvcTBwRy95TjI0UVVNY0ZMSGRzbWt5Um5lYm5GanoxUU9t?=
 =?utf-8?B?bnJXckZ4bFQvbnN3RFJKUXY1UnF6R2UzU0VuS0FHSE5LYU9UR3MyQ0dsYS9C?=
 =?utf-8?B?NWVxSnVCK2FoMVg0RzM0ejA4TG5lWG5aVHRhNXZRbHNrNjNXOHEzMUpKbnpx?=
 =?utf-8?B?Z2V1V2RmZTBuenhTbVk5cUpzWm8ya3pwbmVmV21HSjRGVzdHYnNMMU16NUx1?=
 =?utf-8?B?QU9ZMXRtN0dRYUNRZlpLemlnT3U5eXd1aS9xN0tYUjMza1RjYVc4WjVpSUpO?=
 =?utf-8?B?UVlpaVZpSmh5NzhFQU1yMUthR29wUEszaUhQZGNZaEJwTEk2K0t0MGJZUEVk?=
 =?utf-8?B?YTNuajBIU25VT243Sk9qS3ZmZ1JmZFZNR1lxL28vYkp0eXNTa1FPbGJKTDgw?=
 =?utf-8?B?VFY2OHFjQmJFbExvR2tLNWdhcTExRGRkK21oUWJqMUZObGRMaHdxWk9QTjV2?=
 =?utf-8?B?ZFFhY1BQNGpJOUFHeEdoVmlwYXFJMWY2RFpjaDhxa2J3VlQyZ2F4clJNb3o1?=
 =?utf-8?B?cG5sNlVjNkJXYUhnQ1pRdXdqeXhnbk1UaDlNTklvQnl2SWVpQWVldnJER2VK?=
 =?utf-8?B?b0RlM2ZCczExLzNVcWplaEtKbDAyZy9PZ2ZOYkNHNEpLSzQzMnVPNE4yV2Zu?=
 =?utf-8?B?MUkxOHJRQUtnKzNycmtuM1JydFFOZ2ZELzBjWGpDUVlXZ29mMWRLc3lTVVgy?=
 =?utf-8?B?VExqK2ZGZTdsT0pDVUtQeUI3NEpQckxzVHRMamFaQ2lWRVM2a0hXRnJVdTFs?=
 =?utf-8?B?SGpEaDk4bkhRT25xcGplSk1pcEQ2RnBkWDJ4S2l5azRsby9ya1QzNEp5bnN0?=
 =?utf-8?B?QyttMG5VM3NJN2pTWlRuM0s5UEJkSWN6Y0hMN2lqM2lLcmRRU0dwNng1UzRt?=
 =?utf-8?B?cTdwbTdhQUJZaEJqUjhJM2pCSGF1UEpYWUppU3JiWitNekVBTDBHZUFyaENJ?=
 =?utf-8?B?TllGckkzdTV5bXRJK01IbXlJUWx0TE9KR3ZWRG1PRlFVWXJTWk9RY2tWVml0?=
 =?utf-8?B?UDhZQm1nVUhlTXBleVZFNnV4NjhRSGpWL2VBcmNmZXQyQTR2OEZzVm5LcXlp?=
 =?utf-8?B?ZTU2R2tZN0hqYkowY0dEZjVNcVpFZTZXOTUrSS8rSHFwOUtFUGtCaTdld3U0?=
 =?utf-8?B?d1pLVWpSZy9SZ0hsSTFLQXY0WU1kbkU3ZHhoeER5amw5bEYzZDl4aGNETFpz?=
 =?utf-8?B?aERRTEtvRmM0YWsxbUM1UHZwT0U0ckZzYzE3ODZRK2ptY2FGYkMxWTd0T2VS?=
 =?utf-8?B?M3pwYzFxZTRnbHR1elovUVlKd2xtZ296ZWJKbGtaVGdzMlo2azFqSnY0bkpi?=
 =?utf-8?B?dWpVK0g0aVFQa0lITUVJK25EQzAvWko4N1owMUJJazdqalhhc2wzMVc1SzUz?=
 =?utf-8?B?eXR6eHdzVXNiRElNcVMyeVljOFRGdXhJcHJXcGZvNXNEQXA0Q3ZkREw5V0oy?=
 =?utf-8?B?ZG54a1UrV2xHUC9ObUtBaHpIdDNSbThpeGhyNWZHZVRJVFpDUzZqOWp2VW5p?=
 =?utf-8?B?Vm9SYXE4Tm9FZGdvT2ZGZ1dkck1RYzd6aHNXbFVDQjdzUWUwODVSQUJJTjR4?=
 =?utf-8?B?c2ZtdkNSVVNzMnovUzhuUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8264.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(1800799024)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Ujc2b09ZQTdkemRTZ1FCajRaTWl1YlFtV2JybVF0WkhWcStWc1F3eU9pVmlj?=
 =?utf-8?B?R1VMc1BwS1h4c05hTllveTd2dEFnQmx0VUE1WU11Qk1NTHNidUJ4d2dnRUNl?=
 =?utf-8?B?TnFqdTlFbXlhUDV3L1BYUFA2UHJHbzBMSDZ1ZXd3VWZna1lGaUNhUGlYV0la?=
 =?utf-8?B?L0RCMWR0dStnemRaMnhTNWo4eWU0cC92cTZsNERsOFVQejBDTnFlWkQ5VVp1?=
 =?utf-8?B?dmtpem85MHZKNXo4ZkN1YXlvVFR2WTVOcXVjd2xVUjFIV2trVmdlTmpnVDZ0?=
 =?utf-8?B?dlJaaUdPcHpUdWJRTmYyeUw1QWJxNEVUeVcrQW5iTXlKZWgzbkx3OXRNam9u?=
 =?utf-8?B?ZkdtbVZ6RkdNOGVDY0hNMVIvNVBhQ25mblFtWkpvMlIyc1N1YXRIdlZOUVVP?=
 =?utf-8?B?aitWL1MvTXpLSFAyQ1dnVWVrZ0twNjBDMENGQUNQS1NxaElIYzVaNnhOazlM?=
 =?utf-8?B?RlpNNU1Hc0oyRm0yNXJEcC9leWxFb1RiMmw3S2RtOFdBcloyeFFQeDlmQzFH?=
 =?utf-8?B?c0VwZDhTbU5UMmkrUS9ROFdyc0l2QWtkSE1lZ2d4N0JkdFN6NFJSWlBwQTlZ?=
 =?utf-8?B?cUEvTXVIT1JnR3loSnpTQWZ1MjJ3cUJmSVFWWU5oV0dJWEhsTVFYL2Q3a1hv?=
 =?utf-8?B?MEtjcjFHMkhCQXJrWXJDVEovWU5FTkwrSW43bVdhTjJ5SU5IQkMrclpRWGtX?=
 =?utf-8?B?eGM4WnI5SUxRZCtmcUluaHJUQkFqZEFHODNKcDdScW9ZWUswdjNYL3VYb0Vo?=
 =?utf-8?B?MmF4QnRFSjVZUFZpVHcrQUExTEE1N3RuM0U0a2s2bzVvWG9vQlpycnBzMU9q?=
 =?utf-8?B?ZWphSG5lRVppbnFQdDg4RlM0VXo4WnBPbllYc1BNZ0dXakNRZnVLbFNkb3lw?=
 =?utf-8?B?bkJEZzNBTm4rTDFaT3BJRUJpNFphbUZlRDN2Yk9WYXJNMmcvRDhlZFRxbkE3?=
 =?utf-8?B?ZCtmTTVjcTlUTG4rTFlLeTloemtmdFZJZEJidFNGc2JHY0pWeUNCc2N2alJz?=
 =?utf-8?B?anNaaGlHd1hseElhWHZ6MkdGREI3UmFSNFE4WDZJY0FlditUWUZyeFRlMitE?=
 =?utf-8?B?eUZFeVNBVlZVdlFDbWlNTzlObVd4aHlGSkpvWlI1am9uMGJiVXJMNEpKVkIz?=
 =?utf-8?B?ckRhNXdhMmdwUzUySmp0aEtXcW9zVFA3Y2tCbGJyYUFOZmoyVDJ5aUVKTWh6?=
 =?utf-8?B?YVY1S0FEWFhXUGJ1SjFxa1FITTlOWG5CU1p4OEdmSS9POFNNemIwa2FmbTBY?=
 =?utf-8?B?OFEzL24vRldPWXZEc2JNenRFYXU2WExJVjBOV0FoMnBmTHBmVFJXaTJIQ09I?=
 =?utf-8?B?bXoybE1RYlpzZW9KOFdlaDN6K2oyK2JPWFlsUGNqZFhIMDVWeVNuM1NuaEVI?=
 =?utf-8?B?MGJSdm9rWHJlbjhkOFVFZDl0MHBSckVKcEw1eDNzVmdtTTRFYW0wSEtmVG8y?=
 =?utf-8?B?OUlneGd6c0xFRWxJcVlrb3hzSEZFYXdFcXdvZEhsN2syQlJuQ2UzQ3EvMjBh?=
 =?utf-8?B?YUhLaHJhN2RHOXpTOGpkMHZvcllTK0x3VGV4ZGRJemFqY2xhVElBYzVGN0Nu?=
 =?utf-8?B?U2ZSLzBBVFN6eitOOW1MS28zYkoxS2w4ai9icXVGR0hnSEM3bGxUeUh3MFU1?=
 =?utf-8?B?MnBRajQ0VlFNaE1XS1QwVVUrQ2JHZURKVVFPc1BkUFZkcWt1Yzc2UGo5bVpu?=
 =?utf-8?B?bjYvQXVTRFV1WmJacTc3L1JaMUJkaUdab3Y3YWpQdXJIeFZpSzBjVitLN21X?=
 =?utf-8?B?cWFPRWxRMWdJT0N6VHo3dmxRYk9OSThqaXY2akVkSnp3bVpBWDYwL2xIRkRS?=
 =?utf-8?B?SS9GYU1JVisxUlFRNWNvNlRoUTJHN3A1M3lubWlrUVR1eVFYUjZKbVRkQlR3?=
 =?utf-8?B?Q2VuOXExU1ltd2hLS09XR2xHMjdhUUlNQzdISEUwYThqS1ZwaW5BYXpROVRk?=
 =?utf-8?B?Z0txcGdveE00VUhpSkd0dUUzdEZ4eHZaUU51anNaU1VHT280NFY3K2FLNzZU?=
 =?utf-8?B?OTAwUExINkdRbjFYelZFNnJ3SkRCN0hGcG9SNDN4dG15YVJkZnEyWDVMQlcy?=
 =?utf-8?B?anRZVjNCKy9CVVNUbWdkL0JYYVU4czJRU1FXbU9WWGFaV296RTlOTVpvNkFR?=
 =?utf-8?Q?qXKUuRitGxRwUlABgb32BWyre?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95840665-18a2-4ced-3f13-08dd51744564
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 06:03:18.1954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y830xosyCA+i4FwUYLlVBtz41i/pgCXbzcs7X1BfXQAEHUl3KZ+/Ky4tI7EIhJPwopUKgXv0m7nVwbmLP42QNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7955
X-Proofpoint-GUID: kNeKvcgWVol_ykdKngPomewWQzAv0ZLh
X-Proofpoint-ORIG-GUID: c05m1aBREgkjv7Ga-xT9sQOhYi5Nxdb-
X-Authority-Analysis: v=2.4 cv=BvtnwZX5 c=1 sm=1 tr=0 ts=67b6c5b0 cx=c_pps a=ur2hu7Zt/Tb0cWAHmjvzJg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=NEAV23lmAAAA:8
 a=hqBzw_eTAAAA:8 a=XkRKQH6RAAAA:8 a=QQrwgld0AAAA:8 a=VKio34HhAAAA:8 a=PYnjg3YJAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=7CQSdrXTAAAA:8 a=jYJ61ryfAAAA:8 a=VwQbUJbxAAAA:8 a=yMhMjlubAAAA:8 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8 a=_enOPnqeAAAA:8
 a=WEyBKPZmr50vBY91ExgA:9 a=SteIlcP52Yr4zQSW:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=lBZTsuZDXdQA:10 a=Hv90Ch-Tvl0A:10 a=RVmHIydaz68A:10 a=bkWp_v3HvcftT6DRAIDL:22 a=1gUyE30hU_ULiMxJiLUW:22 a=GixL4z90Y-kx4mQuXZm8:22 a=ALVy6clGPs_Yy9GZ8Zsv:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=eNvJ01k53lG8zT5pDJgy:22 a=XAbD3I9PDrnSMThV5XoS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_02,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=999 bulkscore=0 clxscore=1015
 malwarescore=0 phishscore=0 mlxscore=0 spamscore=0 impostorscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502200041
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 51K4hNN9023353
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 06:03:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211741

On 2/19/25 23:19, Steve Sakoman wrote:
> Hi Kai,
>
> Not sure why, but this fails to apply for me:
>
> Applying: Revert "ovmf: Fix CVE-2023-45237"
> Using index info to reconstruct a base tree...
> error: patch failed: meta/recipes-core/ovmf/ovmf/CVE-2023-45237-0001.pa=
tch:1
> error: meta/recipes-core/ovmf/ovmf/CVE-2023-45237-0001.patch: patch
> does not apply
> error: patch failed: meta/recipes-core/ovmf/ovmf/CVE-2023-45237-0002.pa=
tch:1
> error: meta/recipes-core/ovmf/ovmf/CVE-2023-45237-0002.patch: patch
> does not apply
> error: Did you hand edit your patch?
> It does not apply to blobs recorded in its index.
> Patch failed at 0001 Revert "ovmf: Fix CVE-2023-45237"

Hi Steve,

How about try option `--keep-cr` with git am as I mentioned in the patch=20
file?

Regards,
Kai

>
> Steve
>
> On Wed, Feb 19, 2025 at 2:22=E2=80=AFAM Kai Kang via lists.openembedded=
.org
> <kai.kang=3Dwindriver.com@lists.openembedded.org> wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> This reverts commit 4c2d3e37308cac98614dfafed79b7323423af8bc.
>>
>> The fix for CVE-2023-45237 causes ovmf firmware not support pxe boot
>> any more and no boot item in OVMF menu such as
>>
>>      UEFI PXEv4 (MAC address)
>>
>> It has not been fixed by ovmf upstream and an issue has been created o=
n
>>
>> https://github.com/tianocore/tianocore.github.io/issues/82
>>
>> Revert the fixes for now.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>
>> Please add option `--keep-cr` when invoke `git am`.
>>
>>   .../ovmf/ovmf/CVE-2023-45237-0001.patch       |   78 -
>>   .../ovmf/ovmf/CVE-2023-45237-0002.patch       | 1288 ---------------=
--
>>   meta/recipes-core/ovmf/ovmf_git.bb            |    2 -
>>   3 files changed, 1368 deletions(-)
>>   delete mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2023-45237-0001.p=
atch
>>   delete mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2023-45237-0002.p=
atch
>>
>> diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2023-45237-0001.patch b/m=
eta/recipes-core/ovmf/ovmf/CVE-2023-45237-0001.patch
>> deleted file mode 100644
>> index d1dcb8dc44..0000000000
>> --- a/meta/recipes-core/ovmf/ovmf/CVE-2023-45237-0001.patch
>> +++ /dev/null
>> @@ -1,78 +0,0 @@
>> -From cf07238e5fa4f8b1138ac1c9e80530b4d4e59f1c Mon Sep 17 00:00:00 200=
1
>> -From: Pierre Gondois <pierre.gondois@arm.com>
>> -Date: Fri, 11 Aug 2023 16:33:06 +0200
>> -Subject: [PATCH] MdePkg/Rng: Add GUID to describe Arm Rndr Rng algori=
thms
>> -
>> -BZ: https://bugzilla.tianocore.org/show_bug.cgi?id=3D4441
>> -
>> -The EFI_RNG_PROTOCOL can rely on the RngLib. The RngLib has multiple
>> -implementations, some of them are unsafe (e.g. BaseRngLibTimerLib).
>> -To allow the RngDxe to detect when such implementation is used,
>> -a GetRngGuid() function is added in a following patch.
>> -
>> -Prepare GetRngGuid() return values and add a gEfiRngAlgorithmArmRndr
>> -to describe a Rng algorithm accessed through Arm's RNDR instruction.
>> -[1] states that the implementation of this algorithm should be
>> -compliant to NIST SP900-80. The compliance is not guaranteed.
>> -
>> -[1] Arm Architecture Reference Manual Armv8, for A-profile architectu=
re
>> -sK12.1 'Properties of the generated random number'
>> -
>> -Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
>> -Reviewed-by: Sami Mujawar <sami.mujawar@arm.com>
>> -Reviewed-by: Liming Gao <gaoliming@byosoft.com.cn>
>> -Acked-by: Ard Biesheuvel <ardb@kernel.org>
>> -Tested-by: Kun Qin <kun.qin@microsoft.com>
>> -
>> -CVE: CVE-2023-45237
>> -
>> -Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/c=
f07238e5fa4f8b1138ac1c9e80530b4d4e59f1c]
>> -
>> -Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
>> ----
>> - MdePkg/Include/Protocol/Rng.h | 10 ++++++++++
>> - MdePkg/MdePkg.dec             |  1 +
>> - 2 files changed, 11 insertions(+)
>> -
>> -diff --git a/MdePkg/Include/Protocol/Rng.h b/MdePkg/Include/Protocol/=
Rng.h
>> -index baf425587b..38bde53240 100644
>> ---- a/MdePkg/Include/Protocol/Rng.h
>> -+++ b/MdePkg/Include/Protocol/Rng.h
>> -@@ -67,6 +67,15 @@ typedef EFI_GUID EFI_RNG_ALGORITHM;
>> -   { \
>> -     0xe43176d7, 0xb6e8, 0x4827, {0xb7, 0x84, 0x7f, 0xfd, 0xc4, 0xb6,=
 0x85, 0x61 } \
>> -   }
>> -+///
>> -+/// The Arm Architecture states the RNDR that the DRBG algorithm sho=
uld be compliant
>> -+/// with NIST SP800-90A, while not mandating a particular algorithm,=
 so as to be
>> -+/// inclusive of different geographies.
>> -+///
>> -+#define EFI_RNG_ALGORITHM_ARM_RNDR \
>> -+  { \
>> -+    0x43d2fde3, 0x9d4e, 0x4d79,  {0x02, 0x96, 0xa8, 0x9b, 0xca, 0x78=
, 0x08, 0x41} \
>> -+  }
>> -
>> - /**
>> -   Returns information about the random number generation implementat=
ion.
>> -@@ -146,5 +155,6 @@ extern EFI_GUID  gEfiRngAlgorithmSp80090Ctr256Gui=
d;
>> - extern EFI_GUID  gEfiRngAlgorithmX9313DesGuid;
>> - extern EFI_GUID  gEfiRngAlgorithmX931AesGuid;
>> - extern EFI_GUID  gEfiRngAlgorithmRaw;
>> -+extern EFI_GUID  gEfiRngAlgorithmArmRndr;
>> -
>> - #endif
>> -diff --git a/MdePkg/MdePkg.dec b/MdePkg/MdePkg.dec
>> -index 59b405928b..a449dbc556 100644
>> ---- a/MdePkg/MdePkg.dec
>> -+++ b/MdePkg/MdePkg.dec
>> -@@ -594,6 +594,7 @@
>> -   gEfiRngAlgorithmX9313DesGuid       =3D { 0x63c4785a, 0xca34, 0x401=
2, {0xa3, 0xc8, 0x0b, 0x6a, 0x32, 0x4f, 0x55, 0x46 }}
>> -   gEfiRngAlgorithmX931AesGuid        =3D { 0xacd03321, 0x777e, 0x4d3=
d, {0xb1, 0xc8, 0x20, 0xcf, 0xd8, 0x88, 0x20, 0xc9 }}
>> -   gEfiRngAlgorithmRaw                =3D { 0xe43176d7, 0xb6e8, 0x482=
7, {0xb7, 0x84, 0x7f, 0xfd, 0xc4, 0xb6, 0x85, 0x61 }}
>> -+  gEfiRngAlgorithmArmRndr            =3D { 0x43d2fde3, 0x9d4e, 0x4d7=
9, {0x02, 0x96, 0xa8, 0x9b, 0xca, 0x78, 0x08, 0x41 }}
>> -
>> -   ## Include/Protocol/AdapterInformation.h
>> -   gEfiAdapterInfoMediaStateGuid       =3D { 0xD7C74207, 0xA831, 0x4A=
26, {0xB1, 0xF5, 0xD1, 0x93, 0x06, 0x5C, 0xE8, 0xB6 }}
>> ---
>> -2.40.0
>> -
>> diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2023-45237-0002.patch b/m=
eta/recipes-core/ovmf/ovmf/CVE-2023-45237-0002.patch
>> deleted file mode 100644
>> index 722a6cd530..0000000000
>> --- a/meta/recipes-core/ovmf/ovmf/CVE-2023-45237-0002.patch
>> +++ /dev/null
>> @@ -1,1288 +0,0 @@
>> -From 4c4ceb2ceb80c42fd5545b2a4bd80321f07f4345 Mon Sep 17 00:00:00 200=
1
>> -From: Doug Flick <dougflick@microsoft.com>
>> -Date: Wed, 8 May 2024 22:56:28 -0700
>> -Subject: [PATCH] NetworkPkg: SECURITY PATCH CVE-2023-45237
>> -
>> -REF:https://bugzilla.tianocore.org/show_bug.cgi?id=3D4542
>> -
>> -Bug Overview:
>> -PixieFail Bug #9
>> -CVE-2023-45237
>> -CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:L/I:N/A:N
>> -CWE-338 Use of Cryptographically Weak Pseudo-Random Number Generator =
(PRNG)
>> -
>> -Use of a Weak PseudoRandom Number Generator
>> -
>> -Change Overview:
>> -
>> -Updates all Instances of NET_RANDOM (NetRandomInitSeed ()) to either
>> -
>> ->
>> -> EFI_STATUS
>> -> EFIAPI
>> -> PseudoRandomU32 (
>> ->  OUT UINT32  *Output
>> ->  );
>> ->
>> -
>> -or (depending on the use case)
>> -
>> ->
>> -> EFI_STATUS
>> -> EFIAPI
>> -> PseudoRandom (
>> ->  OUT  VOID   *Output,
>> ->  IN   UINTN  OutputLength
>> ->  );
>> ->
>> -
>> -This is because the use of
>> -
>> -Example:
>> -
>> -The following code snippet PseudoRandomU32 () function is used:
>> -
>> ->
>> -> UINT32         Random;
>> ->
>> -> Status =3D PseudoRandomU32 (&Random);
>> -> if (EFI_ERROR (Status)) {
>> ->   DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\n",
>> -__func__, Status));
>> ->   return Status;
>> -> }
>> ->
>> -
>> -This also introduces a new PCD to enable/disable the use of the
>> -secure implementation of algorithms for PseudoRandom () and
>> -instead depend on the default implementation. This may be required fo=
r
>> -some platforms where the UEFI Spec defined algorithms are not availab=
le.
>> -
>> ->
>> -> PcdEnforceSecureRngAlgorithms
>> ->
>> -
>> -If the platform does not have any one of the UEFI defined
>> -secure RNG algorithms then the driver will assert.
>> -
>> -Cc: Saloni Kasbekar <saloni.kasbekar@intel.com>
>> -Cc: Zachary Clark-williams <zachary.clark-williams@intel.com>
>> -
>> -Signed-off-by: Doug Flick [MSFT] <doug.edk2@gmail.com>
>> -Reviewed-by: Saloni Kasbekar <saloni.kasbekar@intel.com>
>> -
>> -CVE: CVE-2023-45237
>> -
>> -Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/4=
c4ceb2ceb80c42fd5545b2a4bd80321f07f4345]
>> -
>> -Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
>> ----
>> - NetworkPkg/Dhcp4Dxe/Dhcp4Driver.c          |  10 +-
>> - NetworkPkg/Dhcp6Dxe/Dhcp6Driver.c          |  11 +-
>> - NetworkPkg/DnsDxe/DnsDhcp.c                |  10 +-
>> - NetworkPkg/DnsDxe/DnsImpl.c                |  11 +-
>> - NetworkPkg/HttpBootDxe/HttpBootDhcp6.c     |  10 +-
>> - NetworkPkg/IScsiDxe/IScsiCHAP.c            |  19 ++-
>> - NetworkPkg/IScsiDxe/IScsiMisc.c            |  14 +--
>> - NetworkPkg/IScsiDxe/IScsiMisc.h            |   6 +-
>> - NetworkPkg/Include/Library/NetLib.h        |  40 +++++--
>> - NetworkPkg/Ip4Dxe/Ip4Driver.c              |  10 +-
>> - NetworkPkg/Ip6Dxe/Ip6ConfigImpl.c          |   9 +-
>> - NetworkPkg/Ip6Dxe/Ip6Driver.c              |  17 ++-
>> - NetworkPkg/Ip6Dxe/Ip6If.c                  |  12 +-
>> - NetworkPkg/Ip6Dxe/Ip6Mld.c                 |  12 +-
>> - NetworkPkg/Ip6Dxe/Ip6Nd.c                  |  33 +++++-
>> - NetworkPkg/Ip6Dxe/Ip6Nd.h                  |   8 +-
>> - NetworkPkg/Library/DxeNetLib/DxeNetLib.c   | 130 ++++++++++++++++++-=
--
>> - NetworkPkg/Library/DxeNetLib/DxeNetLib.inf |  14 ++-
>> - NetworkPkg/NetworkPkg.dec                  |   7 ++
>> - NetworkPkg/SecurityFixes.yaml              |  39 +++++++
>> - NetworkPkg/TcpDxe/TcpDriver.c              |  15 ++-
>> - NetworkPkg/TcpDxe/TcpDxe.inf               |   3 +
>> - NetworkPkg/Udp4Dxe/Udp4Driver.c            |  10 +-
>> - NetworkPkg/Udp6Dxe/Udp6Driver.c            |  11 +-
>> - NetworkPkg/UefiPxeBcDxe/PxeBcDhcp4.c       |   9 +-
>> - NetworkPkg/UefiPxeBcDxe/PxeBcDhcp6.c       |  11 +-
>> - NetworkPkg/UefiPxeBcDxe/PxeBcDriver.c      |  12 +-
>> - 27 files changed, 410 insertions(+), 83 deletions(-)
>> -
>> -diff --git a/NetworkPkg/Dhcp4Dxe/Dhcp4Driver.c b/NetworkPkg/Dhcp4Dxe/=
Dhcp4Driver.c
>> -index 8c37e93be3..892caee368 100644
>> ---- a/NetworkPkg/Dhcp4Dxe/Dhcp4Driver.c
>> -+++ b/NetworkPkg/Dhcp4Dxe/Dhcp4Driver.c
>> -@@ -1,6 +1,7 @@
>> - /** @file
>> -
>> - Copyright (c) 2006 - 2018, Intel Corporation. All rights reserved.<B=
R>
>> -+Copyright (c) Microsoft Corporation
>> - SPDX-License-Identifier: BSD-2-Clause-Patent
>> -
>> - **/
>> -@@ -189,6 +190,13 @@ Dhcp4CreateService (
>> - {
>> -   DHCP_SERVICE  *DhcpSb;
>> -   EFI_STATUS    Status;
>> -+  UINT32        Random;
>> -+
>> -+  Status =3D PseudoRandomU32 (&Random);
>> -+  if (EFI_ERROR (Status)) {
>> -+    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\n"=
, __func__, Status));
>> -+    return Status;
>> -+  }
>> -
>> -   *Service =3D NULL;
>> -   DhcpSb   =3D AllocateZeroPool (sizeof (DHCP_SERVICE));
>> -@@ -203,7 +211,7 @@ Dhcp4CreateService (
>> -   DhcpSb->Image        =3D ImageHandle;
>> -   InitializeListHead (&DhcpSb->Children);
>> -   DhcpSb->DhcpState =3D Dhcp4Stopped;
>> --  DhcpSb->Xid       =3D NET_RANDOM (NetRandomInitSeed ());
>> -+  DhcpSb->Xid       =3D Random;
>> -   CopyMem (
>> -     &DhcpSb->ServiceBinding,
>> -     &mDhcp4ServiceBindingTemplate,
>> -diff --git a/NetworkPkg/Dhcp6Dxe/Dhcp6Driver.c b/NetworkPkg/Dhcp6Dxe/=
Dhcp6Driver.c
>> -index b591a4605b..e7f2787a98 100644
>> ---- a/NetworkPkg/Dhcp6Dxe/Dhcp6Driver.c
>> -+++ b/NetworkPkg/Dhcp6Dxe/Dhcp6Driver.c
>> -@@ -3,7 +3,7 @@
>> -   implementation for Dhcp6 Driver.
>> -
>> -   Copyright (c) 2009 - 2018, Intel Corporation. All rights reserved.=
<BR>
>> --
>> -+  Copyright (c) Microsoft Corporation
>> -   SPDX-License-Identifier: BSD-2-Clause-Patent
>> -
>> - **/
>> -@@ -123,6 +123,13 @@ Dhcp6CreateService (
>> - {
>> -   DHCP6_SERVICE  *Dhcp6Srv;
>> -   EFI_STATUS     Status;
>> -+  UINT32         Random;
>> -+
>> -+  Status =3D PseudoRandomU32 (&Random);
>> -+  if (EFI_ERROR (Status)) {
>> -+    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\n"=
, __func__, Status));
>> -+    return Status;
>> -+  }
>> -
>> -   *Service =3D NULL;
>> -   Dhcp6Srv =3D AllocateZeroPool (sizeof (DHCP6_SERVICE));
>> -@@ -147,7 +154,7 @@ Dhcp6CreateService (
>> -   Dhcp6Srv->Signature  =3D DHCP6_SERVICE_SIGNATURE;
>> -   Dhcp6Srv->Controller =3D Controller;
>> -   Dhcp6Srv->Image      =3D ImageHandle;
>> --  Dhcp6Srv->Xid        =3D (0xffffff & NET_RANDOM (NetRandomInitSeed=
 ()));
>> -+  Dhcp6Srv->Xid        =3D (0xffffff & Random);
>> -
>> -   CopyMem (
>> -     &Dhcp6Srv->ServiceBinding,
>> -diff --git a/NetworkPkg/DnsDxe/DnsDhcp.c b/NetworkPkg/DnsDxe/DnsDhcp.=
c
>> -index 933565a32d..9eb3c1d2d8 100644
>> ---- a/NetworkPkg/DnsDxe/DnsDhcp.c
>> -+++ b/NetworkPkg/DnsDxe/DnsDhcp.c
>> -@@ -2,6 +2,7 @@
>> - Functions implementation related with DHCPv4/v6 for DNS driver.
>> -
>> - Copyright (c) 2015 - 2018, Intel Corporation. All rights reserved.<B=
R>
>> -+Copyright (c) Microsoft Corporation
>> - SPDX-License-Identifier: BSD-2-Clause-Patent
>> -
>> - **/
>> -@@ -277,6 +278,7 @@ GetDns4ServerFromDhcp4 (
>> -   EFI_DHCP4_TRANSMIT_RECEIVE_TOKEN  Token;
>> -   BOOLEAN                           IsDone;
>> -   UINTN                             Index;
>> -+  UINT32                            Random;
>> -
>> -   Image      =3D Instance->Service->ImageHandle;
>> -   Controller =3D Instance->Service->ControllerHandle;
>> -@@ -292,6 +294,12 @@ GetDns4ServerFromDhcp4 (
>> -   Data          =3D NULL;
>> -   InterfaceInfo =3D NULL;
>> -
>> -+  Status =3D PseudoRandomU32 (&Random);
>> -+  if (EFI_ERROR (Status)) {
>> -+    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\n"=
, __func__, Status));
>> -+    return Status;
>> -+  }
>> -+
>> -   ZeroMem ((UINT8 *)ParaList, sizeof (ParaList));
>> -
>> -   ZeroMem (&MnpConfigData, sizeof (EFI_MANAGED_NETWORK_CONFIG_DATA))=
;
>> -@@ -467,7 +475,7 @@ GetDns4ServerFromDhcp4 (
>> -
>> -   Status =3D Dhcp4->Build (Dhcp4, &SeedPacket, 0, NULL, 2, ParaList,=
 &Token.Packet);
>> -
>> --  Token.Packet->Dhcp4.Header.Xid =3D HTONL (NET_RANDOM (NetRandomIni=
tSeed ()));
>> -+  Token.Packet->Dhcp4.Header.Xid =3D Random;
>> -
>> -   Token.Packet->Dhcp4.Header.Reserved =3D HTONS ((UINT16)0x8000);
>> -
>> -diff --git a/NetworkPkg/DnsDxe/DnsImpl.c b/NetworkPkg/DnsDxe/DnsImpl.=
c
>> -index d311812800..c2629bb8df 100644
>> ---- a/NetworkPkg/DnsDxe/DnsImpl.c
>> -+++ b/NetworkPkg/DnsDxe/DnsImpl.c
>> -@@ -2,6 +2,7 @@
>> - DnsDxe support functions implementation.
>> -
>> - Copyright (c) 2016 - 2018, Intel Corporation. All rights reserved.<B=
R>
>> -+Copyright (c) Microsoft Corporation
>> - SPDX-License-Identifier: BSD-2-Clause-Patent
>> -
>> - **/
>> -@@ -1963,6 +1964,14 @@ ConstructDNSQuery (
>> -   NET_FRAGMENT       Frag;
>> -   DNS_HEADER         *DnsHeader;
>> -   DNS_QUERY_SECTION  *DnsQuery;
>> -+  EFI_STATUS         Status;
>> -+  UINT32             Random;
>> -+
>> -+  Status =3D PseudoRandomU32 (&Random);
>> -+  if (EFI_ERROR (Status)) {
>> -+    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\n"=
, __func__, Status));
>> -+    return Status;
>> -+  }
>> -
>> -   //
>> -   // Messages carried by UDP are restricted to 512 bytes (not counti=
ng the IP
>> -@@ -1977,7 +1986,7 @@ ConstructDNSQuery (
>> -   // Fill header
>> -   //
>> -   DnsHeader                    =3D (DNS_HEADER *)Frag.Bulk;
>> --  DnsHeader->Identification    =3D (UINT16)NET_RANDOM (NetRandomInit=
Seed ());
>> -+  DnsHeader->Identification    =3D (UINT16)Random;
>> -   DnsHeader->Flags.Uint16      =3D 0x0000;
>> -   DnsHeader->Flags.Bits.RD     =3D 1;
>> -   DnsHeader->Flags.Bits.OpCode =3D DNS_FLAGS_OPCODE_STANDARD;
>> -diff --git a/NetworkPkg/HttpBootDxe/HttpBootDhcp6.c b/NetworkPkg/Http=
BootDxe/HttpBootDhcp6.c
>> -index b22cef4ff5..f964515b0f 100644
>> ---- a/NetworkPkg/HttpBootDxe/HttpBootDhcp6.c
>> -+++ b/NetworkPkg/HttpBootDxe/HttpBootDhcp6.c
>> -@@ -2,6 +2,7 @@
>> -   Functions implementation related with DHCPv6 for HTTP boot driver.
>> -
>> - Copyright (c) 2015 - 2018, Intel Corporation. All rights reserved.<B=
R>
>> -+Copyright (c) Microsoft Corporation
>> - SPDX-License-Identifier: BSD-2-Clause-Patent
>> -
>> - **/
>> -@@ -951,6 +952,7 @@ HttpBootDhcp6Sarr (
>> -   UINT32                    OptCount;
>> -   UINT8                     Buffer[HTTP_BOOT_DHCP6_OPTION_MAX_SIZE];
>> -   EFI_STATUS                Status;
>> -+  UINT32                    Random;
>> -
>> -   Dhcp6 =3D Private->Dhcp6;
>> -   ASSERT (Dhcp6 !=3D NULL);
>> -@@ -961,6 +963,12 @@ HttpBootDhcp6Sarr (
>> -   OptCount =3D HttpBootBuildDhcp6Options (Private, OptList, Buffer);
>> -   ASSERT (OptCount > 0);
>> -
>> -+  Status =3D PseudoRandomU32 (&Random);
>> -+  if (EFI_ERROR (Status)) {
>> -+    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\n"=
, __func__, Status));
>> -+    return Status;
>> -+  }
>> -+
>> -   Retransmit =3D AllocateZeroPool (sizeof (EFI_DHCP6_RETRANSMISSION)=
);
>> -   if (Retransmit =3D=3D NULL) {
>> -     return EFI_OUT_OF_RESOURCES;
>> -@@ -976,7 +984,7 @@ HttpBootDhcp6Sarr (
>> -   Config.IaInfoEvent           =3D NULL;
>> -   Config.RapidCommit           =3D FALSE;
>> -   Config.ReconfigureAccept     =3D FALSE;
>> --  Config.IaDescriptor.IaId     =3D NET_RANDOM (NetRandomInitSeed ())=
;
>> -+  Config.IaDescriptor.IaId     =3D Random;
>> -   Config.IaDescriptor.Type     =3D EFI_DHCP6_IA_TYPE_NA;
>> -   Config.SolicitRetransmission =3D Retransmit;
>> -   Retransmit->Irt              =3D 4;
>> -diff --git a/NetworkPkg/IScsiDxe/IScsiCHAP.c b/NetworkPkg/IScsiDxe/IS=
csiCHAP.c
>> -index b507f11cd4..bebb1ac29b 100644
>> ---- a/NetworkPkg/IScsiDxe/IScsiCHAP.c
>> -+++ b/NetworkPkg/IScsiDxe/IScsiCHAP.c
>> -@@ -3,6 +3,7 @@
>> -   Configuration.
>> -
>> - Copyright (c) 2004 - 2018, Intel Corporation. All rights reserved.<B=
R>
>> -+Copyright (c) Microsoft Corporation
>> - SPDX-License-Identifier: BSD-2-Clause-Patent
>> -
>> - **/
>> -@@ -576,16 +577,24 @@ IScsiCHAPToSendReq (
>> -         //
>> -         // CHAP_I=3D<I>
>> -         //
>> --        IScsiGenRandom ((UINT8 *)&AuthData->OutIdentifier, 1);
>> -+        Status =3D IScsiGenRandom ((UINT8 *)&AuthData->OutIdentifier=
, 1);
>> -+        if (EFI_ERROR (Status)) {
>> -+          break;
>> -+        }
>> -+
>> -         AsciiSPrint (ValueStr, sizeof (ValueStr), "%d", AuthData->Ou=
tIdentifier);
>> -         IScsiAddKeyValuePair (Pdu, ISCSI_KEY_CHAP_IDENTIFIER, ValueS=
tr);
>> -         //
>> -         // CHAP_C=3D<C>
>> -         //
>> --        IScsiGenRandom (
>> --          (UINT8 *)AuthData->OutChallenge,
>> --          AuthData->Hash->DigestSize
>> --          );
>> -+        Status =3D IScsiGenRandom (
>> -+                   (UINT8 *)AuthData->OutChallenge,
>> -+                   AuthData->Hash->DigestSize
>> -+                   );
>> -+        if (EFI_ERROR (Status)) {
>> -+          break;
>> -+        }
>> -+
>> -         BinToHexStatus =3D IScsiBinToHex (
>> -                            (UINT8 *)AuthData->OutChallenge,
>> -                            AuthData->Hash->DigestSize,
>> -diff --git a/NetworkPkg/IScsiDxe/IScsiMisc.c b/NetworkPkg/IScsiDxe/IS=
csiMisc.c
>> -index b3ea90158f..cd77f1a13e 100644
>> ---- a/NetworkPkg/IScsiDxe/IScsiMisc.c
>> -+++ b/NetworkPkg/IScsiDxe/IScsiMisc.c
>> -@@ -2,6 +2,7 @@
>> -   Miscellaneous routines for iSCSI driver.
>> -
>> - Copyright (c) 2004 - 2018, Intel Corporation. All rights reserved.<B=
R>
>> -+Copyright (c) Microsoft Corporation
>> - SPDX-License-Identifier: BSD-2-Clause-Patent
>> -
>> - **/
>> -@@ -474,20 +475,17 @@ IScsiNetNtoi (
>> -   @param[in, out]  Rand       The buffer to contain random numbers.
>> -   @param[in]       RandLength The length of the Rand buffer.
>> -
>> -+  @retval EFI_SUCCESS on success
>> -+  @retval others      on error
>> -+
>> - **/
>> --VOID
>> -+EFI_STATUS
>> - IScsiGenRandom (
>> -   IN OUT UINT8  *Rand,
>> -   IN     UINTN  RandLength
>> -   )
>> - {
>> --  UINT32  Random;
>> --
>> --  while (RandLength > 0) {
>> --    Random  =3D NET_RANDOM (NetRandomInitSeed ());
>> --    *Rand++ =3D (UINT8)(Random);
>> --    RandLength--;
>> --  }
>> -+  return PseudoRandom (Rand, RandLength);
>> - }
>> -
>> - /**
>> -diff --git a/NetworkPkg/IScsiDxe/IScsiMisc.h b/NetworkPkg/IScsiDxe/IS=
csiMisc.h
>> -index a951eee70e..91b2cd2261 100644
>> ---- a/NetworkPkg/IScsiDxe/IScsiMisc.h
>> -+++ b/NetworkPkg/IScsiDxe/IScsiMisc.h
>> -@@ -2,6 +2,7 @@
>> -   Miscellaneous definitions for iSCSI driver.
>> -
>> - Copyright (c) 2004 - 2018, Intel Corporation. All rights reserved.<B=
R>
>> -+Copyright (c) Microsoft Corporation
>> - SPDX-License-Identifier: BSD-2-Clause-Patent
>> -
>> - **/
>> -@@ -202,8 +203,11 @@ IScsiNetNtoi (
>> -   @param[in, out]  Rand       The buffer to contain random numbers.
>> -   @param[in]       RandLength The length of the Rand buffer.
>> -
>> -+  @retval EFI_SUCCESS on success
>> -+  @retval others      on error
>> -+
>> - **/
>> --VOID
>> -+EFI_STATUS
>> - IScsiGenRandom (
>> -   IN OUT UINT8  *Rand,
>> -   IN     UINTN  RandLength
>> -diff --git a/NetworkPkg/Include/Library/NetLib.h b/NetworkPkg/Include=
/Library/NetLib.h
>> -index 8c0e62b388..e8108b79db 100644
>> ---- a/NetworkPkg/Include/Library/NetLib.h
>> -+++ b/NetworkPkg/Include/Library/NetLib.h
>> -@@ -3,6 +3,7 @@
>> -   It provides basic functions for the UEFI network stack.
>> -
>> - Copyright (c) 2005 - 2018, Intel Corporation. All rights reserved.<B=
R>
>> -+Copyright (c) Microsoft Corporation
>> - SPDX-License-Identifier: BSD-2-Clause-Patent
>> -
>> - **/
>> -@@ -539,8 +540,6 @@ extern EFI_IPv4_ADDRESS  mZeroIp4Addr;
>> - #define TICKS_PER_MS      10000U
>> - #define TICKS_PER_SECOND  10000000U
>> -
>> --#define NET_RANDOM(Seed)  ((UINT32) ((UINT32) (Seed) * 1103515245UL =
+ 12345) % 4294967295UL)
>> --
>> - /**
>> -   Extract a UINT32 from a byte stream.
>> -
>> -@@ -580,19 +579,40 @@ NetPutUint32 (
>> -   );
>> -
>> - /**
>> --  Initialize a random seed using current time and monotonic count.
>> -+  Generate a Random output data given a length.
>> -
>> --  Get current time and monotonic count first. Then initialize a rand=
om seed
>> --  based on some basic mathematics operation on the hour, day, minute=
, second,
>> --  nanosecond and year of the current time and the monotonic count va=
lue.
>> -+  @param[out] Output - The buffer to store the generated random data.
>> -+  @param[in] OutputLength - The length of the output buffer.
>> -
>> --  @return The random seed initialized with current time.
>> -+  @retval EFI_SUCCESS           On Success
>> -+  @retval EFI_INVALID_PARAMETER Pointer is null or size is zero
>> -+  @retval EFI_NOT_FOUND         RNG protocol not found
>> -+  @retval Others                Error from RngProtocol->GetRNG()
>> -
>> -+  @return Status code
>> - **/
>> --UINT32
>> -+EFI_STATUS
>> - EFIAPI
>> --NetRandomInitSeed (
>> --  VOID
>> -+PseudoRandom (
>> -+  OUT  VOID   *Output,
>> -+  IN   UINTN  OutputLength
>> -+  );
>> -+
>> -+/**
>> -+  Generate a 32-bit pseudo-random number.
>> -+
>> -+  @param[out] Output - The buffer to store the generated random numb=
er.
>> -+
>> -+  @retval EFI_SUCCESS           On Success
>> -+  @retval EFI_NOT_FOUND         RNG protocol not found
>> -+  @retval Others                Error from RngProtocol->GetRNG()
>> -+
>> -+  @return Status code
>> -+**/
>> -+EFI_STATUS
>> -+EFIAPI
>> -+PseudoRandomU32 (
>> -+  OUT  UINT32  *Output
>> -   );
>> -
>> - #define NET_LIST_USER_STRUCT(Entry, Type, Field)        \
>> -diff --git a/NetworkPkg/Ip4Dxe/Ip4Driver.c b/NetworkPkg/Ip4Dxe/Ip4Dri=
ver.c
>> -index ec483ff01f..683423f38d 100644
>> ---- a/NetworkPkg/Ip4Dxe/Ip4Driver.c
>> -+++ b/NetworkPkg/Ip4Dxe/Ip4Driver.c
>> -@@ -2,6 +2,7 @@
>> -   The driver binding and service binding protocol for IP4 driver.
>> -
>> - Copyright (c) 2005 - 2019, Intel Corporation. All rights reserved.<B=
R>
>> -+Copyright (c) Microsoft Corporation
>> - (C) Copyright 2015 Hewlett-Packard Development Company, L.P.<BR>
>> -
>> - SPDX-License-Identifier: BSD-2-Clause-Patent
>> -@@ -549,11 +550,18 @@ Ip4DriverBindingStart (
>> -   EFI_IP4_CONFIG2_PROTOCOL  *Ip4Cfg2;
>> -   UINTN                     Index;
>> -   IP4_CONFIG2_DATA_ITEM     *DataItem;
>> -+  UINT32                    Random;
>> -
>> -   IpSb     =3D NULL;
>> -   Ip4Cfg2  =3D NULL;
>> -   DataItem =3D NULL;
>> -
>> -+  Status =3D PseudoRandomU32 (&Random);
>> -+  if (EFI_ERROR (Status)) {
>> -+    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\n"=
, __func__, Status));
>> -+    return Status;
>> -+  }
>> -+
>> -   //
>> -   // Test for the Ip4 service binding protocol
>> -   //
>> -@@ -653,7 +661,7 @@ Ip4DriverBindingStart (
>> -   //
>> -   // Initialize the IP4 ID
>> -   //
>> --  mIp4Id =3D (UINT16)NET_RANDOM (NetRandomInitSeed ());
>> -+  mIp4Id =3D (UINT16)Random;
>> -
>> -   return Status;
>> -
>> -diff --git a/NetworkPkg/Ip6Dxe/Ip6ConfigImpl.c b/NetworkPkg/Ip6Dxe/Ip=
6ConfigImpl.c
>> -index 70e232ce6c..4c1354d26c 100644
>> ---- a/NetworkPkg/Ip6Dxe/Ip6ConfigImpl.c
>> -+++ b/NetworkPkg/Ip6Dxe/Ip6ConfigImpl.c
>> -@@ -2276,6 +2276,13 @@ Ip6ConfigInitInstance (
>> -   UINTN                 Index;
>> -   UINT16                IfIndex;
>> -   IP6_CONFIG_DATA_ITEM  *DataItem;
>> -+  UINT32                Random;
>> -+
>> -+  Status =3D PseudoRandomU32 (&Random);
>> -+  if (EFI_ERROR (Status)) {
>> -+    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\n"=
, __func__, Status));
>> -+    return Status;
>> -+  }
>> -
>> -   IpSb =3D IP6_SERVICE_FROM_IP6_CONFIG_INSTANCE (Instance);
>> -
>> -@@ -2381,7 +2388,7 @@ Ip6ConfigInitInstance (
>> -     // The NV variable is not set, so generate a random IAID, and wr=
ite down the
>> -     // fresh new configuration as the NV variable now.
>> -     //
>> --    Instance->IaId =3D NET_RANDOM (NetRandomInitSeed ());
>> -+    Instance->IaId =3D Random;
>> -
>> -     for (Index =3D 0; Index < IpSb->SnpMode.HwAddressSize; Index++) =
{
>> -       Instance->IaId |=3D (IpSb->SnpMode.CurrentAddress.Addr[Index] =
<< ((Index << 3) & 31));
>> -diff --git a/NetworkPkg/Ip6Dxe/Ip6Driver.c b/NetworkPkg/Ip6Dxe/Ip6Dri=
ver.c
>> -index b483a7d136..cbe011dad4 100644
>> ---- a/NetworkPkg/Ip6Dxe/Ip6Driver.c
>> -+++ b/NetworkPkg/Ip6Dxe/Ip6Driver.c
>> -@@ -3,7 +3,7 @@
>> -
>> -   Copyright (c) 2009 - 2019, Intel Corporation. All rights reserved.=
<BR>
>> -   (C) Copyright 2015 Hewlett-Packard Development Company, L.P.<BR>
>> --
>> -+  Copyright (c) Microsoft Corporation
>> -   SPDX-License-Identifier: BSD-2-Clause-Patent
>> -
>> - **/
>> -@@ -316,7 +316,11 @@ Ip6CreateService (
>> -   IpSb->CurHopLimit       =3D IP6_HOP_LIMIT;
>> -   IpSb->LinkMTU           =3D IP6_MIN_LINK_MTU;
>> -   IpSb->BaseReachableTime =3D IP6_REACHABLE_TIME;
>> --  Ip6UpdateReachableTime (IpSb);
>> -+  Status                  =3D Ip6UpdateReachableTime (IpSb);
>> -+  if (EFI_ERROR (Status)) {
>> -+    goto ON_ERROR;
>> -+  }
>> -+
>> -   //
>> -   // RFC4861 RETRANS_TIMER: 1,000 milliseconds
>> -   //
>> -@@ -516,11 +520,18 @@ Ip6DriverBindingStart (
>> -   EFI_STATUS               Status;
>> -   EFI_IP6_CONFIG_PROTOCOL  *Ip6Cfg;
>> -   IP6_CONFIG_DATA_ITEM     *DataItem;
>> -+  UINT32                   Random;
>> -
>> -   IpSb     =3D NULL;
>> -   Ip6Cfg   =3D NULL;
>> -   DataItem =3D NULL;
>> -
>> -+  Status =3D PseudoRandomU32 (&Random);
>> -+  if (EFI_ERROR (Status)) {
>> -+    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\n"=
, __func__, Status));
>> -+    return Status;
>> -+  }
>> -+
>> -   //
>> -   // Test for the Ip6 service binding protocol
>> -   //
>> -@@ -656,7 +667,7 @@ Ip6DriverBindingStart (
>> -   //
>> -   // Initialize the IP6 ID
>> -   //
>> --  mIp6Id =3D NET_RANDOM (NetRandomInitSeed ());
>> -+  mIp6Id =3D Random;
>> -
>> -   return EFI_SUCCESS;
>> -
>> -diff --git a/NetworkPkg/Ip6Dxe/Ip6If.c b/NetworkPkg/Ip6Dxe/Ip6If.c
>> -index 4629c05f25..f3d11c4d21 100644
>> ---- a/NetworkPkg/Ip6Dxe/Ip6If.c
>> -+++ b/NetworkPkg/Ip6Dxe/Ip6If.c
>> -@@ -2,7 +2,7 @@
>> -   Implement IP6 pseudo interface.
>> -
>> -   Copyright (c) 2009 - 2018, Intel Corporation. All rights reserved.=
<BR>
>> --
>> -+  Copyright (c) Microsoft Corporation
>> -   SPDX-License-Identifier: BSD-2-Clause-Patent
>> -
>> - **/
>> -@@ -89,6 +89,14 @@ Ip6SetAddress (
>> -   IP6_PREFIX_LIST_ENTRY  *PrefixEntry;
>> -   UINT64                 Delay;
>> -   IP6_DELAY_JOIN_LIST    *DelayNode;
>> -+  EFI_STATUS             Status;
>> -+  UINT32                 Random;
>> -+
>> -+  Status =3D PseudoRandomU32 (&Random);
>> -+  if (EFI_ERROR (Status)) {
>> -+    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\n"=
, __func__, Status));
>> -+    return Status;
>> -+  }
>> -
>> -   NET_CHECK_SIGNATURE (Interface, IP6_INTERFACE_SIGNATURE);
>> -
>> -@@ -164,7 +172,7 @@ Ip6SetAddress (
>> -   // Thus queue the address to be processed in Duplicate Address Det=
ection module
>> -   // after the delay time (in milliseconds).
>> -   //
>> --  Delay =3D (UINT64)NET_RANDOM (NetRandomInitSeed ());
>> -+  Delay =3D (UINT64)Random;
>> -   Delay =3D MultU64x32 (Delay, IP6_ONE_SECOND_IN_MS);
>> -   Delay =3D RShiftU64 (Delay, 32);
>> -
>> -diff --git a/NetworkPkg/Ip6Dxe/Ip6Mld.c b/NetworkPkg/Ip6Dxe/Ip6Mld.c
>> -index e6b2b653e2..498a118543 100644
>> ---- a/NetworkPkg/Ip6Dxe/Ip6Mld.c
>> -+++ b/NetworkPkg/Ip6Dxe/Ip6Mld.c
>> -@@ -696,7 +696,15 @@ Ip6UpdateDelayTimer (
>> -   IN OUT IP6_MLD_GROUP  *Group
>> -   )
>> - {
>> --  UINT32  Delay;
>> -+  UINT32      Delay;
>> -+  EFI_STATUS  Status;
>> -+  UINT32      Random;
>> -+
>> -+  Status =3D PseudoRandomU32 (&Random);
>> -+  if (EFI_ERROR (Status)) {
>> -+    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\n"=
, __func__, Status));
>> -+    return Status;
>> -+  }
>> -
>> -   //
>> -   // If the Query packet specifies a Maximum Response Delay of zero,=
 perform timer
>> -@@ -715,7 +723,7 @@ Ip6UpdateDelayTimer (
>> -   // is less than the remaining value of the running timer.
>> -   //
>> -   if ((Group->DelayTimer =3D=3D 0) || (Delay < Group->DelayTimer)) {
>> --    Group->DelayTimer =3D Delay / 4294967295UL * NET_RANDOM (NetRand=
omInitSeed ());
>> -+    Group->DelayTimer =3D Delay / 4294967295UL * Random;
>> -   }
>> -
>> -   return EFI_SUCCESS;
>> -diff --git a/NetworkPkg/Ip6Dxe/Ip6Nd.c b/NetworkPkg/Ip6Dxe/Ip6Nd.c
>> -index c10c7017f8..72aa45c10f 100644
>> ---- a/NetworkPkg/Ip6Dxe/Ip6Nd.c
>> -+++ b/NetworkPkg/Ip6Dxe/Ip6Nd.c
>> -@@ -2,7 +2,7 @@
>> -   Implementation of Neighbor Discovery support routines.
>> -
>> -   Copyright (c) 2009 - 2018, Intel Corporation. All rights reserved.=
<BR>
>> --
>> -+  Copyright (c) Microsoft Corporation
>> -   SPDX-License-Identifier: BSD-2-Clause-Patent
>> -
>> - **/
>> -@@ -16,17 +16,28 @@ EFI_MAC_ADDRESS  mZeroMacAddress;
>> -
>> -   @param[in, out] IpSb     Points to the IP6_SERVICE.
>> -
>> -+  @retval EFI_SUCCESS           ReachableTime Updated
>> -+  @retval others                Failed to update ReachableTime
>> - **/
>> --VOID
>> -+EFI_STATUS
>> - Ip6UpdateReachableTime (
>> -   IN OUT IP6_SERVICE  *IpSb
>> -   )
>> - {
>> --  UINT32  Random;
>> -+  UINT32      Random;
>> -+  EFI_STATUS  Status;
>> -
>> --  Random              =3D (NetRandomInitSeed () / 4294967295UL) * IP=
6_RANDOM_FACTOR_SCALE;
>> -+  Status =3D PseudoRandomU32 (&Random);
>> -+  if (EFI_ERROR (Status)) {
>> -+    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\n"=
, __func__, Status));
>> -+    return Status;
>> -+  }
>> -+
>> -+  Random              =3D (Random / 4294967295UL) * IP6_RANDOM_FACTO=
R_SCALE;
>> -   Random              =3D Random + IP6_MIN_RANDOM_FACTOR_SCALED;
>> -   IpSb->ReachableTime =3D (IpSb->BaseReachableTime * Random) / IP6_R=
ANDOM_FACTOR_SCALE;
>> -+
>> -+  return EFI_SUCCESS;
>> - }
>> -
>> - /**
>> -@@ -972,10 +983,17 @@ Ip6InitDADProcess (
>> -   IP6_SERVICE                               *IpSb;
>> -   EFI_STATUS                                Status;
>> -   UINT32                                    MaxDelayTick;
>> -+  UINT32                                    Random;
>> -
>> -   NET_CHECK_SIGNATURE (IpIf, IP6_INTERFACE_SIGNATURE);
>> -   ASSERT (AddressInfo !=3D NULL);
>> -
>> -+  Status =3D PseudoRandomU32 (&Random);
>> -+  if (EFI_ERROR (Status)) {
>> -+    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\n"=
, __func__, Status));
>> -+    return Status;
>> -+  }
>> -+
>> -   //
>> -   // Do nothing if we have already started DAD on the address.
>> -   //
>> -@@ -1014,7 +1032,7 @@ Ip6InitDADProcess (
>> -   Entry->Transmit    =3D 0;
>> -   Entry->Receive     =3D 0;
>> -   MaxDelayTick       =3D IP6_MAX_RTR_SOLICITATION_DELAY / IP6_TIMER_=
INTERVAL_IN_MS;
>> --  Entry->RetransTick =3D (MaxDelayTick * ((NET_RANDOM (NetRandomInit=
Seed ()) % 5) + 1)) / 5;
>> -+  Entry->RetransTick =3D (MaxDelayTick * ((Random % 5) + 1)) / 5;
>> -   Entry->AddressInfo =3D AddressInfo;
>> -   Entry->Callback    =3D Callback;
>> -   Entry->Context     =3D Context;
>> -@@ -2078,7 +2096,10 @@ Ip6ProcessRouterAdvertise (
>> -     // in BaseReachableTime and recompute a ReachableTime.
>> -     //
>> -     IpSb->BaseReachableTime =3D ReachableTime;
>> --    Ip6UpdateReachableTime (IpSb);
>> -+    Status                  =3D Ip6UpdateReachableTime (IpSb);
>> -+    if (EFI_ERROR (Status)) {
>> -+      goto Exit;
>> -+    }
>> -   }
>> -
>> -   if (RetransTimer !=3D 0) {
>> -diff --git a/NetworkPkg/Ip6Dxe/Ip6Nd.h b/NetworkPkg/Ip6Dxe/Ip6Nd.h
>> -index bf64e9114e..5795e23c7d 100644
>> ---- a/NetworkPkg/Ip6Dxe/Ip6Nd.h
>> -+++ b/NetworkPkg/Ip6Dxe/Ip6Nd.h
>> -@@ -2,7 +2,7 @@
>> -   Definition of Neighbor Discovery support routines.
>> -
>> -   Copyright (c) 2009 - 2012, Intel Corporation. All rights reserved.=
<BR>
>> --
>> -+  Copyright (c) Microsoft Corporation
>> -   SPDX-License-Identifier: BSD-2-Clause-Patent
>> -
>> - **/
>> -@@ -780,10 +780,10 @@ Ip6OnArpResolved (
>> - /**
>> -   Update the ReachableTime in IP6 service binding instance data, in =
milliseconds.
>> -
>> --  @param[in, out] IpSb     Points to the IP6_SERVICE.
>> --
>> -+  @retval EFI_SUCCESS           ReachableTime Updated
>> -+  @retval others                Failed to update ReachableTime
>> - **/
>> --VOID
>> -+EFI_STATUS
>> - Ip6UpdateReachableTime (
>> -   IN OUT IP6_SERVICE  *IpSb
>> -   );
>> -diff --git a/NetworkPkg/Library/DxeNetLib/DxeNetLib.c b/NetworkPkg/Li=
brary/DxeNetLib/DxeNetLib.c
>> -index fd4a9e15a8..01c13c08d2 100644
>> ---- a/NetworkPkg/Library/DxeNetLib/DxeNetLib.c
>> -+++ b/NetworkPkg/Library/DxeNetLib/DxeNetLib.c
>> -@@ -3,6 +3,7 @@
>> -
>> - Copyright (c) 2005 - 2018, Intel Corporation. All rights reserved.<B=
R>
>> - (C) Copyright 2015 Hewlett Packard Enterprise Development LP<BR>
>> -+Copyright (c) Microsoft Corporation
>> - SPDX-License-Identifier: BSD-2-Clause-Patent
>> - **/
>> -
>> -@@ -31,6 +32,7 @@ SPDX-License-Identifier: BSD-2-Clause-Patent
>> - #include <Library/DevicePathLib.h>
>> - #include <Library/PrintLib.h>
>> - #include <Library/UefiLib.h>
>> -+#include <Protocol/Rng.h>
>> -
>> - #define NIC_ITEM_CONFIG_SIZE  (sizeof (NIC_IP4_CONFIG_INFO) + sizeof=
 (EFI_IP4_ROUTE_TABLE) * MAX_IP4_CONFIG_IN_VARIABLE)
>> - #define DEFAULT_ZERO_START    ((UINTN) ~0)
>> -@@ -127,6 +129,25 @@ GLOBAL_REMOVE_IF_UNREFERENCED VLAN_DEVICE_PATH  =
mNetVlanDevicePathTemplate =3D {
>> -   0
>> - };
>> -
>> -+//
>> -+// These represent UEFI SPEC defined algorithms that should be suppo=
rted by
>> -+// the RNG protocol and are generally considered secure.
>> -+//
>> -+// The order of the algorithms in this array is important. This orde=
r is the order
>> -+// in which the algorithms will be tried by the RNG protocol.
>> -+// If your platform needs to use a specific algorithm for the random=
 number generator,
>> -+// then you should place that algorithm first in the array.
>> -+//
>> -+GLOBAL_REMOVE_IF_UNREFERENCED EFI_GUID  *mSecureHashAlgorithms[] =3D=
 {
>> -+  &gEfiRngAlgorithmSp80090Ctr256Guid,  // SP800-90A DRBG CTR using A=
ES-256
>> -+  &gEfiRngAlgorithmSp80090Hmac256Guid, // SP800-90A DRBG HMAC using =
SHA-256
>> -+  &gEfiRngAlgorithmSp80090Hash256Guid, // SP800-90A DRBG Hash using =
SHA-256
>> -+  &gEfiRngAlgorithmArmRndr,            // unspecified SP800-90A DRBG=
 via ARM RNDR register
>> -+  &gEfiRngAlgorithmRaw,                // Raw data from NRBG (or TRN=
G)
>> -+};
>> -+
>> -+#define SECURE_HASH_ALGORITHMS_SIZE  (sizeof (mSecureHashAlgorithms)=
 / sizeof (EFI_GUID *))
>> -+
>> - /**
>> -   Locate the handles that support SNP, then open one of them
>> -   to send the syslog packets. The caller isn't required to close
>> -@@ -884,34 +905,107 @@ Ip6Swap128 (
>> - }
>> -
>> - /**
>> --  Initialize a random seed using current time and monotonic count.
>> -+  Generate a Random output data given a length.
>> -
>> --  Get current time and monotonic count first. Then initialize a rand=
om seed
>> --  based on some basic mathematics operation on the hour, day, minute=
, second,
>> --  nanosecond and year of the current time and the monotonic count va=
lue.
>> -+  @param[out] Output - The buffer to store the generated random data.
>> -+  @param[in] OutputLength - The length of the output buffer.
>> -
>> --  @return The random seed initialized with current time.
>> -+  @retval EFI_SUCCESS           On Success
>> -+  @retval EFI_INVALID_PARAMETER Pointer is null or size is zero
>> -+  @retval EFI_NOT_FOUND         RNG protocol not found
>> -+  @retval Others                Error from RngProtocol->GetRNG()
>> -
>> -+  @return Status code
>> - **/
>> --UINT32
>> -+EFI_STATUS
>> - EFIAPI
>> --NetRandomInitSeed (
>> --  VOID
>> -+PseudoRandom (
>> -+  OUT  VOID   *Output,
>> -+  IN   UINTN  OutputLength
>> -   )
>> - {
>> --  EFI_TIME  Time;
>> --  UINT32    Seed;
>> --  UINT64    MonotonicCount;
>> -+  EFI_RNG_PROTOCOL  *RngProtocol;
>> -+  EFI_STATUS        Status;
>> -+  UINTN             AlgorithmIndex;
>> -+
>> -+  if ((Output =3D=3D NULL) || (OutputLength =3D=3D 0)) {
>> -+    return EFI_INVALID_PARAMETER;
>> -+  }
>> -+
>> -+  Status =3D gBS->LocateProtocol (&gEfiRngProtocolGuid, NULL, (VOID =
**)&RngProtocol);
>> -+  if (EFI_ERROR (Status)) {
>> -+    DEBUG ((DEBUG_ERROR, "Failed to locate EFI_RNG_PROTOCOL: %r\n", =
Status));
>> -+    ASSERT_EFI_ERROR (Status);
>> -+    return Status;
>> -+  }
>> -+
>> -+  if (PcdGetBool (PcdEnforceSecureRngAlgorithms)) {
>> -+    for (AlgorithmIndex =3D 0; AlgorithmIndex < SECURE_HASH_ALGORITH=
MS_SIZE; AlgorithmIndex++) {
>> -+      Status =3D RngProtocol->GetRNG (RngProtocol, mSecureHashAlgori=
thms[AlgorithmIndex], OutputLength, (UINT8 *)Output);
>> -+      if (!EFI_ERROR (Status)) {
>> -+        //
>> -+        // Secure Algorithm was supported on this platform
>> -+        //
>> -+        return EFI_SUCCESS;
>> -+      } else if (Status =3D=3D EFI_UNSUPPORTED) {
>> -+        //
>> -+        // Secure Algorithm was not supported on this platform
>> -+        //
>> -+        DEBUG ((DEBUG_ERROR, "Failed to generate random data using s=
ecure algorithm %d: %r\n", AlgorithmIndex, Status));
>> -+
>> -+        //
>> -+        // Try the next secure algorithm
>> -+        //
>> -+        continue;
>> -+      } else {
>> -+        //
>> -+        // Some other error occurred
>> -+        //
>> -+        DEBUG ((DEBUG_ERROR, "Failed to generate random data using s=
ecure algorithm %d: %r\n", AlgorithmIndex, Status));
>> -+        ASSERT_EFI_ERROR (Status);
>> -+        return Status;
>> -+      }
>> -+    }
>> -+
>> -+    //
>> -+    // If we get here, we failed to generate random data using any s=
ecure algorithm
>> -+    // Platform owner should ensure that at least one secure algorit=
hm is supported
>> -+    //
>> -+    ASSERT_EFI_ERROR (Status);
>> -+    return Status;
>> -+  }
>> -+
>> -+  //
>> -+  // Lets try using the default algorithm (which may not be secure)
>> -+  //
>> -+  Status =3D RngProtocol->GetRNG (RngProtocol, NULL, OutputLength, (=
UINT8 *)Output);
>> -+  if (EFI_ERROR (Status)) {
>> -+    DEBUG ((DEBUG_ERROR, "%a failed to generate random data: %r\n", =
__func__, Status));
>> -+    ASSERT_EFI_ERROR (Status);
>> -+    return Status;
>> -+  }
>> -
>> --  gRT->GetTime (&Time, NULL);
>> --  Seed  =3D (Time.Hour << 24 | Time.Day << 16 | Time.Minute << 8 | T=
ime.Second);
>> --  Seed ^=3D Time.Nanosecond;
>> --  Seed ^=3D Time.Year << 7;
>> -+  return EFI_SUCCESS;
>> -+}
>> -+
>> -+/**
>> -+  Generate a 32-bit pseudo-random number.
>> -
>> --  gBS->GetNextMonotonicCount (&MonotonicCount);
>> --  Seed +=3D (UINT32)MonotonicCount;
>> -+  @param[out] Output - The buffer to store the generated random numb=
er.
>> -
>> --  return Seed;
>> -+  @retval EFI_SUCCESS           On Success
>> -+  @retval EFI_NOT_FOUND         RNG protocol not found
>> -+  @retval Others                Error from RngProtocol->GetRNG()
>> -+
>> -+  @return Status code
>> -+**/
>> -+EFI_STATUS
>> -+EFIAPI
>> -+PseudoRandomU32 (
>> -+  OUT UINT32  *Output
>> -+  )
>> -+{
>> -+  return PseudoRandom (Output, sizeof (*Output));
>> - }
>> -
>> - /**
>> -diff --git a/NetworkPkg/Library/DxeNetLib/DxeNetLib.inf b/NetworkPkg/=
Library/DxeNetLib/DxeNetLib.inf
>> -index 8145d256ec..a8f534a293 100644
>> ---- a/NetworkPkg/Library/DxeNetLib/DxeNetLib.inf
>> -+++ b/NetworkPkg/Library/DxeNetLib/DxeNetLib.inf
>> -@@ -3,6 +3,7 @@
>> - #
>> - #  Copyright (c) 2006 - 2018, Intel Corporation. All rights reserved=
.<BR>
>> - #  (C) Copyright 2015 Hewlett Packard Enterprise Development LP<BR>
>> -+#  Copyright (c) Microsoft Corporation
>> - #  SPDX-License-Identifier: BSD-2-Clause-Patent
>> - #
>> - ##
>> -@@ -49,7 +50,11 @@
>> -   gEfiSmbiosTableGuid                           ## SOMETIMES_CONSUME=
S  ## SystemTable
>> -   gEfiSmbios3TableGuid                          ## SOMETIMES_CONSUME=
S  ## SystemTable
>> -   gEfiAdapterInfoMediaStateGuid                 ## SOMETIMES_CONSUME=
S
>> --
>> -+  gEfiRngAlgorithmRaw                           ## CONSUMES
>> -+  gEfiRngAlgorithmSp80090Ctr256Guid             ## CONSUMES
>> -+  gEfiRngAlgorithmSp80090Hmac256Guid            ## CONSUMES
>> -+  gEfiRngAlgorithmSp80090Hash256Guid            ## CONSUMES
>> -+  gEfiRngAlgorithmArmRndr                       ## CONSUMES
>> -
>> - [Protocols]
>> -   gEfiSimpleNetworkProtocolGuid                 ## SOMETIMES_CONSUME=
S
>> -@@ -59,3 +64,10 @@
>> -   gEfiComponentNameProtocolGuid                 ## SOMETIMES_CONSUME=
S
>> -   gEfiComponentName2ProtocolGuid                ## SOMETIMES_CONSUME=
S
>> -   gEfiAdapterInformationProtocolGuid            ## SOMETIMES_CONSUME=
S
>> -+  gEfiRngProtocolGuid                           ## CONSUMES
>> -+
>> -+[FixedPcd]
>> -+  gEfiNetworkPkgTokenSpaceGuid.PcdEnforceSecureRngAlgorithms ## CONS=
UMES
>> -+
>> -+[Depex]
>> -+  gEfiRngProtocolGuid
>> -diff --git a/NetworkPkg/NetworkPkg.dec b/NetworkPkg/NetworkPkg.dec
>> -index 928e84fec4..ff335e957c 100644
>> ---- a/NetworkPkg/NetworkPkg.dec
>> -+++ b/NetworkPkg/NetworkPkg.dec
>> -@@ -5,6 +5,7 @@
>> - #
>> - # Copyright (c) 2009 - 2021, Intel Corporation. All rights reserved.=
<BR>
>> - # (C) Copyright 2015-2020 Hewlett Packard Enterprise Development LP<=
BR>
>> -+# Copyright (c) Microsoft Corporation
>> - #
>> - # SPDX-License-Identifier: BSD-2-Clause-Patent
>> - #
>> -@@ -127,6 +128,12 @@
>> -   # @Prompt Indicates whether SnpDxe creates event for ExitBootServi=
ces() call.
>> -   gEfiNetworkPkgTokenSpaceGuid.PcdSnpCreateExitBootServicesEvent|TRU=
E|BOOLEAN|0x1000000C
>> -
>> -+  ## Enforces the use of Secure UEFI spec defined RNG algorithms for=
 all network connections.
>> -+  # TRUE  - Enforce the use of Secure UEFI spec defined RNG algorith=
ms.
>> -+  # FALSE - Do not enforce and depend on the default implementation =
of RNG algorithm from the provider.
>> -+  # @Prompt Enforce the use of Secure UEFI spec defined RNG algorith=
ms.
>> -+  gEfiNetworkPkgTokenSpaceGuid.PcdEnforceSecureRngAlgorithms|TRUE|BO=
OLEAN|0x1000000D
>> -+
>> - [PcdsFixedAtBuild, PcdsPatchableInModule, PcdsDynamic, PcdsDynamicEx=
]
>> -   ## IPv6 DHCP Unique Identifier (DUID) Type configuration (From RFC=
s 3315 and 6355).
>> -   # 01 =3D DUID Based on Link-layer Address Plus Time [DUID-LLT]
>> -diff --git a/NetworkPkg/SecurityFixes.yaml b/NetworkPkg/SecurityFixes=
.yaml
>> -index 7e900483fe..2b2c794697 100644
>> ---- a/NetworkPkg/SecurityFixes.yaml
>> -+++ b/NetworkPkg/SecurityFixes.yaml
>> -@@ -121,3 +121,42 @@ CVE_2023_45235:
>> -     - http://www.openwall.com/lists/oss-security/2024/01/16/2
>> -     - http://packetstormsecurity.com/files/176574/PixieFail-Proof-Of=
-Concepts.html
>> -     - https://blog.quarkslab.com/pixiefail-nine-vulnerabilities-in-t=
ianocores-edk-ii-ipv6-network-stack.html
>> -+CVE_2023_45237:
>> -+  commit_titles:
>> -+    - "NetworkPkg:: SECURITY PATCH CVE 2023-45237"
>> -+  cve: CVE-2023-45237
>> -+  date_reported: 2023-08-28 13:56 UTC
>> -+  description: "Bug 09 - Use of a Weak PseudoRandom Number Generator=
"
>> -+  note:
>> -+  files_impacted:
>> -+    - NetworkPkg/Dhcp4Dxe/Dhcp4Driver.c
>> -+    - NetworkPkg/Dhcp6Dxe/Dhcp6Driver.c
>> -+    - NetworkPkg/DnsDxe/DnsDhcp.c
>> -+    - NetworkPkg/DnsDxe/DnsImpl.c
>> -+    - NetworkPkg/HttpBootDxe/HttpBootDhcp6.c
>> -+    - NetworkPkg/IScsiDxe/IScsiCHAP.c
>> -+    - NetworkPkg/IScsiDxe/IScsiMisc.c
>> -+    - NetworkPkg/IScsiDxe/IScsiMisc.h
>> -+    - NetworkPkg/Include/Library/NetLib.h
>> -+    - NetworkPkg/Ip4Dxe/Ip4Driver.c
>> -+    - NetworkPkg/Ip6Dxe/Ip6ConfigImpl.c
>> -+    - NetworkPkg/Ip6Dxe/Ip6Driver.c
>> -+    - NetworkPkg/Ip6Dxe/Ip6If.c
>> -+    - NetworkPkg/Ip6Dxe/Ip6Mld.c
>> -+    - NetworkPkg/Ip6Dxe/Ip6Nd.c
>> -+    - NetworkPkg/Ip6Dxe/Ip6Nd.h
>> -+    - NetworkPkg/Library/DxeNetLib/DxeNetLib.c
>> -+    - NetworkPkg/Library/DxeNetLib/DxeNetLib.inf
>> -+    - NetworkPkg/NetworkPkg.dec
>> -+    - NetworkPkg/TcpDxe/TcpDriver.c
>> -+    - NetworkPkg/Udp4Dxe/Udp4Driver.c
>> -+    - NetworkPkg/Udp6Dxe/Udp6Driver.c
>> -+    - NetworkPkg/UefiPxeBcDxe/PxeBcDhcp4.c
>> -+    - NetworkPkg/UefiPxeBcDxe/PxeBcDhcp6.c
>> -+    - NetworkPkg/UefiPxeBcDxe/PxeBcDriver.c
>> -+  links:
>> -+    - https://bugzilla.tianocore.org/show_bug.cgi?id=3D4542
>> -+    - https://nvd.nist.gov/vuln/detail/CVE-2023-45237
>> -+    - http://www.openwall.com/lists/oss-security/2024/01/16/2
>> -+    - http://packetstormsecurity.com/files/176574/PixieFail-Proof-Of=
-Concepts.html
>> -+    - https://blog.quarkslab.com/pixiefail-nine-vulnerabilities-in-t=
ianocores-edk-ii-ipv6-network-stack.html
>> -diff --git a/NetworkPkg/TcpDxe/TcpDriver.c b/NetworkPkg/TcpDxe/TcpDri=
ver.c
>> -index 98a90e0210..8fe6badd68 100644
>> ---- a/NetworkPkg/TcpDxe/TcpDriver.c
>> -+++ b/NetworkPkg/TcpDxe/TcpDriver.c
>> -@@ -2,7 +2,7 @@
>> -   The driver binding and service binding protocol for the TCP driver.
>> -
>> -   Copyright (c) 2009 - 2018, Intel Corporation. All rights reserved.=
<BR>
>> --
>> -+  Copyright (c) Microsoft Corporation
>> -   SPDX-License-Identifier: BSD-2-Clause-Patent
>> -
>> - **/
>> -@@ -163,7 +163,13 @@ TcpDriverEntryPoint (
>> -   )
>> - {
>> -   EFI_STATUS  Status;
>> --  UINT32      Seed;
>> -+  UINT32      Random;
>> -+
>> -+  Status =3D PseudoRandomU32 (&Random);
>> -+  if (EFI_ERROR (Status)) {
>> -+    DEBUG ((DEBUG_ERROR, "%a Failed to generate random number: %r\n"=
, __func__, Status));
>> -+    return Status;
>> -+  }
>> -
>> -   //
>> -   // Install the TCP Driver Binding Protocol
>> -@@ -203,9 +209,8 @@ TcpDriverEntryPoint (
>> -   //
>> -   // Initialize ISS and random port.
>> -   //
>> --  Seed            =3D NetRandomInitSeed ();
>> --  mTcpGlobalIss   =3D NET_RANDOM (Seed) % mTcpGlobalIss;
>> --  mTcp4RandomPort =3D (UINT16)(TCP_PORT_KNOWN + (NET_RANDOM (Seed) %=
 TCP_PORT_KNOWN));
>> -+  mTcpGlobalIss   =3D Random % mTcpGlobalIss;
>> -+  mTcp4RandomPort =3D (UINT16)(TCP_PORT_KNOWN + (Random % TCP_PORT_K=
NOWN));
>> -   mTcp6RandomPort =3D mTcp4RandomPort;
>> -
>> -   return EFI_SUCCESS;
>> -diff --git a/NetworkPkg/TcpDxe/TcpDxe.inf b/NetworkPkg/TcpDxe/TcpDxe.=
inf
>> -index c0acbdca57..cf5423f4c5 100644
>> ---- a/NetworkPkg/TcpDxe/TcpDxe.inf
>> -+++ b/NetworkPkg/TcpDxe/TcpDxe.inf
>> -@@ -82,5 +82,8 @@
>> -   gEfiTcp6ProtocolGuid                          ## BY_START
>> -   gEfiTcp6ServiceBindingProtocolGuid            ## BY_START
>> -
>> -+[Depex]
>> -+  gEfiHash2ServiceBindingProtocolGuid
>> -+
>> - [UserExtensions.TianoCore."ExtraFiles"]
>> -   TcpDxeExtra.uni
>> -diff --git a/NetworkPkg/Udp4Dxe/Udp4Driver.c b/NetworkPkg/Udp4Dxe/Udp=
4Driver.c
>> -index cb917fcfc9..c7ea16f4cd 100644
>> ---- a/NetworkPkg/Udp4Dxe/Udp4Driver.c
>> -+++ b/NetworkPkg/Udp4Dxe/Udp4Driver.c
>> -@@ -1,6 +1,7 @@
>> - /** @file
>> -
>> - Copyright (c) 2006 - 2018, Intel Corporation. All rights reserved.<B=
R>
>> -+Copyright (c) Microsoft Corporation
>> - SPDX-License-Identifier: BSD-2-Clause-Patent
>> -
>> - **/
>> -@@ -555,6 +556,13 @@ Udp4DriverEntryPoint (
>> -   )
>> - {
>> -   EFI_STATUS  Status;
>> -+  UINT32      Random;
>> -+
>> -+  Status =3D PseudoRandomU32 (&Random);
>> -+  if (EFI_ERROR (Status)) {
>> -+    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\n"=
, __func__, Status));
>> -+    return Status;
>> -+  }
>> -
>> -   //
>> -   // Install the Udp4DriverBinding and Udp4ComponentName protocols.
>> -@@ -571,7 +579,7 @@ Udp4DriverEntryPoint (
>> -     //
>> -     // Initialize the UDP random port.
>> -     //
>> --    mUdp4RandomPort =3D (UINT16)(((UINT16)NetRandomInitSeed ()) % UD=
P4_PORT_KNOWN + UDP4_PORT_KNOWN);
>> -+    mUdp4RandomPort =3D (UINT16)(((UINT16)Random) % UDP4_PORT_KNOWN =
+ UDP4_PORT_KNOWN);
>> -   }
>> -
>> -   return Status;
>> -diff --git a/NetworkPkg/Udp6Dxe/Udp6Driver.c b/NetworkPkg/Udp6Dxe/Udp=
6Driver.c
>> -index ae96fb9966..edb758d57c 100644
>> ---- a/NetworkPkg/Udp6Dxe/Udp6Driver.c
>> -+++ b/NetworkPkg/Udp6Dxe/Udp6Driver.c
>> -@@ -2,7 +2,7 @@
>> -   Driver Binding functions and Service Binding functions for the Net=
work driver module.
>> -
>> -   Copyright (c) 2009 - 2018, Intel Corporation. All rights reserved.=
<BR>
>> --
>> -+  Copyright (c) Microsoft Corporation
>> -   SPDX-License-Identifier: BSD-2-Clause-Patent
>> -
>> - **/
>> -@@ -596,6 +596,13 @@ Udp6DriverEntryPoint (
>> -   )
>> - {
>> -   EFI_STATUS  Status;
>> -+  UINT32      Random;
>> -+
>> -+  Status =3D PseudoRandomU32 (&Random);
>> -+  if (EFI_ERROR (Status)) {
>> -+    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\n"=
, __func__, Status));
>> -+    return Status;
>> -+  }
>> -
>> -   //
>> -   // Install the Udp6DriverBinding and Udp6ComponentName protocols.
>> -@@ -614,7 +621,7 @@ Udp6DriverEntryPoint (
>> -     // Initialize the UDP random port.
>> -     //
>> -     mUdp6RandomPort =3D (UINT16)(
>> --                               ((UINT16)NetRandomInitSeed ()) %
>> -+                               ((UINT16)Random) %
>> -                                UDP6_PORT_KNOWN +
>> -                                UDP6_PORT_KNOWN
>> -                                );
>> -diff --git a/NetworkPkg/UefiPxeBcDxe/PxeBcDhcp4.c b/NetworkPkg/UefiPx=
eBcDxe/PxeBcDhcp4.c
>> -index 91146b78cb..452038c219 100644
>> ---- a/NetworkPkg/UefiPxeBcDxe/PxeBcDhcp4.c
>> -+++ b/NetworkPkg/UefiPxeBcDxe/PxeBcDhcp4.c
>> -@@ -2,7 +2,7 @@
>> -   Functions implementation related with DHCPv4 for UefiPxeBc Driver.
>> -
>> -   Copyright (c) 2009 - 2018, Intel Corporation. All rights reserved.=
<BR>
>> --
>> -+  Copyright (c) Microsoft Corporation
>> -   SPDX-License-Identifier: BSD-2-Clause-Patent
>> -
>> - **/
>> -@@ -1381,6 +1381,12 @@ PxeBcDhcp4Discover (
>> -   UINT8                             VendorOptLen;
>> -   UINT32                            Xid;
>> -
>> -+  Status =3D PseudoRandomU32 (&Xid);
>> -+  if (EFI_ERROR (Status)) {
>> -+    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\n"=
, __func__, Status));
>> -+    return Status;
>> -+  }
>> -+
>> -   Mode   =3D Private->PxeBc.Mode;
>> -   Dhcp4  =3D Private->Dhcp4;
>> -   Status =3D EFI_SUCCESS;
>> -@@ -1471,7 +1477,6 @@ PxeBcDhcp4Discover (
>> -   //
>> -   // Set fields of the token for the request packet.
>> -   //
>> --  Xid                                 =3D NET_RANDOM (NetRandomInitS=
eed ());
>> -   Token.Packet->Dhcp4.Header.Xid      =3D HTONL (Xid);
>> -   Token.Packet->Dhcp4.Header.Reserved =3D HTONS ((UINT16)((IsBCast) =
? 0x8000 : 0x0));
>> -   CopyMem (&Token.Packet->Dhcp4.Header.ClientAddr, &Private->Station=
Ip, sizeof (EFI_IPv4_ADDRESS));
>> -diff --git a/NetworkPkg/UefiPxeBcDxe/PxeBcDhcp6.c b/NetworkPkg/UefiPx=
eBcDxe/PxeBcDhcp6.c
>> -index 7fd1281c11..bcabbd2219 100644
>> ---- a/NetworkPkg/UefiPxeBcDxe/PxeBcDhcp6.c
>> -+++ b/NetworkPkg/UefiPxeBcDxe/PxeBcDhcp6.c
>> -@@ -2180,7 +2180,7 @@ PxeBcDhcp6Discover (
>> -   UINTN                            ReadSize;
>> -   UINT16                           OpCode;
>> -   UINT16                           OpLen;
>> --  UINT32                           Xid;
>> -+  UINT32                           Random;
>> -   EFI_STATUS                       Status;
>> -   UINTN                            DiscoverLenNeeded;
>> -
>> -@@ -2198,6 +2198,12 @@ PxeBcDhcp6Discover (
>> -     return EFI_DEVICE_ERROR;
>> -   }
>> -
>> -+  Status =3D PseudoRandomU32 (&Random);
>> -+  if (EFI_ERROR (Status)) {
>> -+    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\n"=
, __func__, Status));
>> -+    return Status;
>> -+  }
>> -+
>> -   DiscoverLenNeeded =3D sizeof (EFI_PXE_BASE_CODE_DHCPV6_PACKET);
>> -   Discover          =3D AllocateZeroPool (DiscoverLenNeeded);
>> -   if (Discover =3D=3D NULL) {
>> -@@ -2207,8 +2213,7 @@ PxeBcDhcp6Discover (
>> -   //
>> -   // Build the discover packet by the cached request packet before.
>> -   //
>> --  Xid                     =3D NET_RANDOM (NetRandomInitSeed ());
>> --  Discover->TransactionId =3D HTONL (Xid);
>> -+  Discover->TransactionId =3D HTONL (Random);
>> -   Discover->MessageType   =3D Request->Dhcp6.Header.MessageType;
>> -   RequestOpt              =3D Request->Dhcp6.Option;
>> -   DiscoverOpt             =3D Discover->DhcpOptions;
>> -diff --git a/NetworkPkg/UefiPxeBcDxe/PxeBcDriver.c b/NetworkPkg/UefiP=
xeBcDxe/PxeBcDriver.c
>> -index d84aca7e85..4cd915b411 100644
>> ---- a/NetworkPkg/UefiPxeBcDxe/PxeBcDriver.c
>> -+++ b/NetworkPkg/UefiPxeBcDxe/PxeBcDriver.c
>> -@@ -3,6 +3,7 @@
>> -
>> -   (C) Copyright 2014 Hewlett-Packard Development Company, L.P.<BR>
>> -   Copyright (c) 2007 - 2019, Intel Corporation. All rights reserved.=
<BR>
>> -+  Copyright (c) Microsoft Corporation
>> -
>> -   SPDX-License-Identifier: BSD-2-Clause-Patent
>> -
>> -@@ -892,6 +893,13 @@ PxeBcCreateIp6Children (
>> -   PXEBC_PRIVATE_PROTOCOL       *Id;
>> -   EFI_SIMPLE_NETWORK_PROTOCOL  *Snp;
>> -   UINTN                        Index;
>> -+  UINT32                       Random;
>> -+
>> -+  Status =3D PseudoRandomU32 (&Random);
>> -+  if (EFI_ERROR (Status)) {
>> -+    DEBUG ((DEBUG_ERROR, "Failed to generate random number using EFI=
_RNG_PROTOCOL: %r\n", Status));
>> -+    return Status;
>> -+  }
>> -
>> -   if (Private->Ip6Nic !=3D NULL) {
>> -     //
>> -@@ -935,9 +943,9 @@ PxeBcCreateIp6Children (
>> -   }
>> -
>> -   //
>> --  // Generate a random IAID for the Dhcp6 assigned address.
>> -+  // Set a random IAID for the Dhcp6 assigned address.
>> -   //
>> --  Private->IaId =3D NET_RANDOM (NetRandomInitSeed ());
>> -+  Private->IaId =3D Random;
>> -   if (Private->Snp !=3D NULL) {
>> -     for (Index =3D 0; Index < Private->Snp->Mode->HwAddressSize; Ind=
ex++) {
>> -       Private->IaId |=3D (Private->Snp->Mode->CurrentAddress.Addr[In=
dex] << ((Index << 3) & 31));
>> ---
>> -2.40.0
>> -
>> diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ov=
mf/ovmf_git.bb
>> index d52e3f4971..bb345688ac 100644
>> --- a/meta/recipes-core/ovmf/ovmf_git.bb
>> +++ b/meta/recipes-core/ovmf/ovmf_git.bb
>> @@ -47,8 +47,6 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;b=
ranch=3Dmaster;protocol=3Dhttps \
>>              file://CVE-2023-45229-0002.patch \
>>              file://CVE-2023-45229-0003.patch \
>>              file://CVE-2023-45229-0004.patch \
>> -           file://CVE-2023-45237-0001.patch \
>> -           file://CVE-2023-45237-0002.patch \
>>              file://CVE-2023-45236.patch \
>>              file://CVE-2022-36765-0001.patch \
>>              file://CVE-2022-36765-0002.patch \
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#211699): https://lists.openembedded.org/g/openembe=
dded-core/message/211699
>> Mute This Topic: https://lists.openembedded.org/mt/111267276/3620601
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[steve@sakoman.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
Kai Kang
Wind River Linux


