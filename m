Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1181DC5AD49
	for <webhook@archiver.kernel.org>; Sun,  8 Jun 2025 07:51:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.34041.1749369072066729314
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jun 2025 00:51:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=82543c27de=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5587o2NQ000799
	for <openembedded-core@lists.openembedded.org>; Sun, 8 Jun 2025 07:51:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474cd90sw1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 08 Jun 2025 07:51:10 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5587pAbT003654;
	Sun, 8 Jun 2025 07:51:10 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2056.outbound.protection.outlook.com [40.107.236.56])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474cd90sw0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 08 Jun 2025 07:51:10 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FYYp4JEPZ78nI+H7b+dZyKaXi+V8QC5+zjMNVcLHGomx1wJI0l1njwmIVsUOmBXkerOKqxcXFknDRcJgmOFIG3VfMf3emvXVBJgZtvIH2q3FFsP6BgZ87FAzWZIUp2jneLwUN4IC95a1Em0VYh/ZzLLyApckFW7NvCFoo4J8kcV8Sa2NdKyF/RtnodPEW6DmXwiDWh+Tt9KPZW7GHikkpVBw5pnSrLsilaD3sx/QsJGhUTK+fLfeBXgtA0tUiCwMxnE513tvttwZiClHg0WqusXGNDgykDrYynk/7A6GjYIIllMM/toT6vLVha5h9htS/l+tbHvgc659K6GMo4D2Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zfQRqq+sn8MyWFrHQ3wmguNf3VkgTE31QVP0aQcw5GI=;
 b=kIX1tweyhpjw4qMlIyF6wQvani0DtC05dxrNpBlbTrpGm5/VFYmO2l50PLVnSuIg9ynlXi17zp0Htp3K/hIKnDVZHIZ7EjcYWnlf9gp9igSG1YIAzzbJaun5kIevazUwCdMgyvnLgfofSS+wrc8YmR5ZlIjegKPUGM23heONFE+tlVDx3pysa8iQn21zkMGn73ZeAtjUxzglTupjiH+2NhOMM9/gCUzrjNDc5p+xee2xYbHCba6Izl5sHgVddFFabHSXXTJ4sfD+fosb8k7YoVE3budrCyYBNQWmcLmD/S5mk2gBSP6A4tNFAacP4ElDgRvkLVUyD3GZ7QKp7Rq1Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by CH3PR11MB8703.namprd11.prod.outlook.com (2603:10b6:610:1cd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Sun, 8 Jun
 2025 07:51:06 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%6]) with mapi id 15.20.8813.024; Sun, 8 Jun 2025
 07:51:06 +0000
Message-ID: <1fc03946-6ccf-45de-8f90-d2e714da5d3c@windriver.com>
Date: Sun, 8 Jun 2025 15:50:59 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 0/2] Upgrade automake and rpm
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
References: <cover.1749092509.git.liezhi.yang@windriver.com>
 <DAEIF6QL7XAS.1NMY7JXUJYGZC@bootlin.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <DAEIF6QL7XAS.1NMY7JXUJYGZC@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCPR01CA0074.jpnprd01.prod.outlook.com
 (2603:1096:405:3::14) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|CH3PR11MB8703:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fff2324-4caa-4db3-338f-08dda661396b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bG8xSGkzM2ovVzdwZlRZOFA1OTk5dCtQa3RCRWladWozckZTbWplclkzVHE5?=
 =?utf-8?B?RWtzbEdxNjNtN1E1Y0VSYmNRYmliQmRWZWplcUR3ck9sM2lXaEE0VjZpSFhS?=
 =?utf-8?B?T3N1UWs1aWxQbjVVRlB6Rkk2K3VXV2FlcWE5OGxoTEdIYUdEOHg3eFBJVUpG?=
 =?utf-8?B?b3Y5MDB4Ull2dkhrbnl5UG45MXVlQTZFeWtaK2ErVnhJeVlqTEFUVUhiQWxz?=
 =?utf-8?B?WlkyNjlKSmVvTkduWnlSOENDTDE1R3Y4UG9yQURDQk5RWGVyQ0FOaEk5VUNM?=
 =?utf-8?B?WEtiQi8rNHJtbitubFdRa1JtQmZOTWc4eFNrbG9hSkxVWmZ4WThNS2RxdzVh?=
 =?utf-8?B?L09EallsenNxZlZKdGZaWUFOTGh4eS9Id1ZWaStZSm9oRGhscVg1TFlCQnFK?=
 =?utf-8?B?ejZJdzNvVllOYU9rcFRTa0pIeWlvMisrSUltZWg5NktpTXlkd1FsNVc2NFNJ?=
 =?utf-8?B?eitWZW5rbnFQVkw4UW5TRTlJdm5rUWY4UDQweStTSVZ2MWVmcEhpT01JcytW?=
 =?utf-8?B?MjNkY1JDRUwxaDNRMTg0WnBYVldFeXNOd2E3YkNteFhFMENqT0RKSkJFMXpw?=
 =?utf-8?B?bzBxT1l5aHdsTWNTaFVNQVRJOXpSakJiU3VBQzZTN2ZGam90N0VOd0pSWHZ0?=
 =?utf-8?B?cnJ4ck53aXg1b3lrc2J2WDgwa3dORzZnc3BaMW40dWYrMllsdk9kbjRsSENP?=
 =?utf-8?B?NndkSG5XRHVWVCsrMzY4bmJoaVEzZ0lsc2FYdkF0WVh1OEUyM3RLMVB5UDAv?=
 =?utf-8?B?akZlTmhrZjJhRWV6a0l2OWtoQ2lFM0lYdEVxWGtxQ28yN2l0ZUZmRVJrTnND?=
 =?utf-8?B?eGVVV1RQSFdZM3RSUDZXMkRFeFVjUWVOcEZYSVg5ZE01aml5NmdFWjkzYnB1?=
 =?utf-8?B?VFlXckk0NjR5dWYzUnNvVXBqaTdnaTJyYU5rWHozeXpGRzJHdUc1NUh6NWVY?=
 =?utf-8?B?UFQwMFByWUtidnlpQ2lrVG1iZmxhL3hweEFiVUQ5SVVPN0tpdEU2ZEVXbjJ4?=
 =?utf-8?B?UXhDTFpneDNtczlzZmN0b2hqT0MvZkpmaVpKZHNiNUJIOE9naFZBakkvU1pr?=
 =?utf-8?B?Yjk0VExLYnVQRitwTnlTeDZOdXUrQW1pOTA1Ny92L0taM2cxSUJ1Um9nSWlB?=
 =?utf-8?B?M2hVUnRWQytWSTY5MXZyclFKc3FRcjltNi9NdTNHelEyc2w0SVpPck5YKy8z?=
 =?utf-8?B?VVZQMHBCOStNbW1UaWM4RmxGd091VUtNc1JRbElJeTZBUFQ5RFNpamJxSTZh?=
 =?utf-8?B?WkJwS1lvY2ZGQktzczBqTVZIQWVsMmRiaVZnaGFyMURrK1d0VDZUVXpnUG0w?=
 =?utf-8?B?bURCemtSUWdjc2FaK20ySXhWZ2duT2YrRER1d0ZZYUxBczFmak9wUURDNFZG?=
 =?utf-8?B?aVhsZFJrOXNidlJOVGRJUGNreGhNTERkbmhLWlpMQjVGMjZwSXVNcEhlVEw1?=
 =?utf-8?B?THZqUkErUDVHMVVWSGhTNTJLRlJPY0hybnA5WGhLWTh1U1dIVENDY0laaXNZ?=
 =?utf-8?B?UlRMbFNIM2VuLzZuTDdoVmQzOFdhaXNxSTlLTGh5ME5hOTYvWEQvS3FmYyt5?=
 =?utf-8?B?V2U1NTlYMFlGd0wraUNjYzAzL3Rha3k4ZGV1Ums2RkNBVDBGMWlZQmRjTEZI?=
 =?utf-8?B?WjdwY1J0WlVIU0k5T0tKakliSkd6cDkwUER3R0hubzgwVjhuK1NZRUoxMkRO?=
 =?utf-8?B?Z0RsVkNHM1VVTjg4YmxmQTZ3OFJSTjdHTEd3UitJQ0Y5SjZBM1VkMkZFeExx?=
 =?utf-8?B?aVl4MDFSSjNLT0R1bmlzam0vUmFkTGw3TVR1bTI4YTRuN2tYVWRlQzZXTzZE?=
 =?utf-8?B?ZlZKRS85OWkwNFdFZmZ0MXg5akIxb05Qa2hvSkZWWFRpTDlBY2NhaWNJTVJP?=
 =?utf-8?Q?W+0/27mP6c3PY?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aDEwSnJNQ2trNlV0YVo4TjlIellBWjR4L3VZMFZoK25PR2tRU3hnS1JneVlo?=
 =?utf-8?B?VEt4RzZwaWNtQmZKbmNzZkY3aFZLRDVqOU14dVYxWmhQOGpMang2L1FXaFRR?=
 =?utf-8?B?bitQc1RqTUM5WkRrek41Y2pkUkRqa0ZJNXB2VExOQy9yZUhYa0g5QmJESzhp?=
 =?utf-8?B?NURldjI1WWs1d1ZCNzFscmxlOVlKdHZGVm5PSEdFaDdOWGxzREpid1pqaXBv?=
 =?utf-8?B?U2pZU0JqVXNkaFhFdTl4em5Da1JQS1hMWXRJRWczempmTmQ4dHpwZlVNN0JJ?=
 =?utf-8?B?REJFN2V6TjhqSVhId2ptTmdOMjUrazcxTytvUVFZNXk5NUF1YlIrbGh3Ykcw?=
 =?utf-8?B?d2F5TFNZVkhXNElmaDNTbnlBYVBIdjcrYjdpbER3ajRuY1hudjIxZnU5aFZn?=
 =?utf-8?B?S2ZSUmZuc3N4MndtYXJPaDdlNFJDaTJpTnZYNytDKytmTWJKMmpjbjFVQzhB?=
 =?utf-8?B?KzZuS3p0aDFiS2liZU9adHN4U0lpS2pOSGVUVVNXWkxsazFEdzZMRWZZU1VR?=
 =?utf-8?B?SjkybytRZVpjZTBuTnczcWc4aTlXLzJCNEIwbURnQnh2cjJDT3VhMlpuTTRF?=
 =?utf-8?B?ZGt0RG93T1lEMW5ac085MVBmRHRIbG5qQU5TaURuNjk1bnd5NFZZYm8zblVx?=
 =?utf-8?B?UUZpK1FOUTcrU1dZUElIQStVMWgxbG52Y01nMzQ5dmlYWTNtL21PemJ5aSti?=
 =?utf-8?B?N3U5d0FuRWhXZHZIZFNid0tGVk9LeUJVS3JzRjNTUVN3WEplSi9UeUF5MEFF?=
 =?utf-8?B?UHRYZ1NCRDd2VXlQU3dpcFVzTVlWK3pWNG82MGFzSXVuN01qMnMzTEJidzN4?=
 =?utf-8?B?K0RQcnI0dzFTTkN2eWxNWm1SeEx5bTlQWUVtQUJOSW5IUTZRUnhvMmhMTVdK?=
 =?utf-8?B?bXh6eGpVdWhXY1NkYy9vM2QzNUVzMXBOa0NGMjVzRSsxSllvTHZDNDlOaHN6?=
 =?utf-8?B?RVgxZDhmNHNkdU9VK1FleE5Jek9SYklJYk1hRWlXT3hVcUpIRnZPWWZEcFJq?=
 =?utf-8?B?R3dTTDhlK2svTlp2bFNMTFlRT05zRmlxc1JVZDFkWndtYWYrbFByWFZJeXlF?=
 =?utf-8?B?aHE0SVVFSFhvVkJ3Zi94SCtUdHFVRnNoZzllL0x1aGtra21wcVlpUVlsRDVo?=
 =?utf-8?B?dUVxbmUybE9kNStqMWxZUVdzNlFlYXA0bHJoU2RLdWU0MmZnTVNONU9sazBE?=
 =?utf-8?B?dmk2dUFBRHZaZmZ3eVp5ODZzK1EyT1d2NHJlVFhhYzFnWEludlpWSEx0T2Jw?=
 =?utf-8?B?Wk9tL0tLQUNuK082N1RYZnV1eFVYNmpQaXB3MUduQUVnTlZ4L2dwUjdyV3BW?=
 =?utf-8?B?MkR6UUVTSis4SGw5Uyt2TEgvT1E1Rm1TaHBNNjR6S0M3WldwZGc3ZVZnQTAx?=
 =?utf-8?B?R1NKWTFJY3JSQU9ta1d1Sy9mYjhYaXhYLzNZR3lpb3h5eHlaOXVGZEdlcnFW?=
 =?utf-8?B?TWdxR3F1ZXpkVWlaYUMvSWFaNEx3YkkzVGxJSkJKRTJheW4rRmJGTUErQVhk?=
 =?utf-8?B?Tkkwb2NqUXZzNzUyLzI3S082cDdSZ0FYLzVqdGFHOUppY1R0RnhCSGExT0k4?=
 =?utf-8?B?TXBOaTRUOVdhYk9DRnlkM1h3TUhkVTBDU1VaSkFoeTZMbUJXaU1wYlRjdVZm?=
 =?utf-8?B?dy9QQjNvK0EyRkhDNUpCajFlNUgyV0FBcGw4UmJMN2VRd3Z5Z2hYcm9rUU1C?=
 =?utf-8?B?TTRJc1VETVp3L3ZRa05la0hxZlM5Q3cveFNMK3NvZ3I2Sm4yTnljUm9QZUUr?=
 =?utf-8?B?TUJvSkFueTdwdkdOQ0VjaVBQVkF1eS96RWMzZmovSFI2M0k0TzZ5QkZKRmZD?=
 =?utf-8?B?TlBycytCMERNSzZrZEZhdzM4N3Z4MnZxVm5yejVLR29ZbU4wUlVIUzcyZElr?=
 =?utf-8?B?cXE2ZG5EWE5XMk9oMHhvTmg2cTVQMEpOSStxeFY5U0ExWjV5cmp6NVN6M2Jo?=
 =?utf-8?B?WndxYUZvQ2RaWDlQVWZUYWM5YmR2M3BLdGdNeVR0ZGpRaE9WVUNteVZBSFhy?=
 =?utf-8?B?Rk44dTZxOGpNUllhQWJEa3JLQUpPSXpiU0NpWVJjMnBTZ1Bxb1VpTHpsVklj?=
 =?utf-8?B?ZHh3b1ZSUGxSYzVMTmIwV1NSQlkzalNYemZPdlRQNXZMNCtuY3JaeWtwdUZl?=
 =?utf-8?B?N3B2d0JjZmxDaytwV0JPVFYvK05pQkk3SDdNVEc3TGphbm4ycjRFV09wTFlB?=
 =?utf-8?B?Q0E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fff2324-4caa-4db3-338f-08dda661396b
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2025 07:51:06.3861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3NJw+C1GfSB+qpdT7vWm7Bvgy5zl5AKMOR4y9zfSC8idikwAW6x7S+MLmwdnQoQNZhjqtGqdupWiqVLmGAK3qDKGtxBuEPolKB7gRn2xeeY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8703
X-Authority-Analysis: v=2.4 cv=f+xIBPyM c=1 sm=1 tr=0 ts=684540ee cx=c_pps a=Z35tn85hJNknc3PDpfQsnQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=dkgbdN9mAyQ5BOzQSWIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDA1OCBTYWx0ZWRfX0g3OL6BilZYQ LuZxvj/lxvka/wknjKzxcC6lx22G99ckw7ZiZowpbn30r7YKwhl3CqUUNrAHwkRqq9nOmIqHHtc EVTqVNUjudcZPLRv9g/ICCZCgZLd1A8sI1tsJL12zspNRqJbA3gZ8PqmzMC3Xa+8cThyjOunk4l
 Y6H9/mYIXLPB8+zoZDg8ujBCa+xxF3/C3JB4UOR1sSXBI75uBUvDjYi68JZAUHoTjdKxK+UKM3j MLbU1SVOAqcwn8ebvZDQhf4OOU7XIsgfv2OUVNaccPVPIlH2sjBLga8aayUVQzWofZnq16J5rvb 9bRms77RdUNFYhruVinXM32a2JRe7WEl0FyBFMf7IADqygC47D1+fdXtQVgUrf6pHU5iSLuD+mX
 mDAyMIau/4ob2GWH11UvKKXDhpzsuXZdSWukJc2n6VufU+TCCTjrrZsLIsSnd9P9AezmNBtN
X-Proofpoint-ORIG-GUID: kCtWlqas96hew4kkHYhI-MeWQHG-FuXA
X-Proofpoint-GUID: avhAVaK9MdgzY8vUO-eBsGkDdmLuoRhw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2506080058
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5587o2NQ000799
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Jun 2025 07:51:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218208



On 6/5/25 17:59, Mathieu Dubois-Briand wrote:
> On Thu Jun 5, 2025 at 5:02 AM CEST, Robert Yang via lists.openembedded.=
org wrote:
>> From: Robert Yang <liezhi.yang@windriver.com>
>>
>> The following changes since commit 2e817e6e4d53543766b935479b148a1950c=
c37c8:
>>
>>    oeqa/maturin/guessing-game: Bump dependencies to avoid security war=
ning (2025-06-04 08:08:28 +0100)
>>
>> are available in the Git repository at:
>>
>>    https://github.com/robertlinux/yocto rbt/upgrade2
>>    https://github.com/robertlinux/yocto/tree/rbt/upgrade2
>>
>> Robert Yang (2):
>>    automake: 1.17 -> 1.18
>>    rpm: 4.20.0 -> 4.20.1
>>
>>   ...report-error-when-the-path-of-Perl-c.patch | 27 +++++----
>>   .../{automake_1.17.bb =3D> automake_1.18.bb}    |  2 +-
>>   ...LUGINDIR-in-top-level-CMakeLists.txt.patch | 57 -----------------=
--
>>   ...lling-execute-package-scriptlets-wit.patch | 24 ++++----
>>   ...ge-logging-level-around-scriptlets-t.patch | 27 +++++----
>>   .../rpm/{rpm_4.20.0.bb =3D> rpm_4.20.1.bb}      |  5 +-
>>   6 files changed, 47 insertions(+), 95 deletions(-)
>>   rename meta/recipes-devtools/automake/{automake_1.17.bb =3D> automak=
e_1.18.bb} (92%)
>>   delete mode 100644 meta/recipes-devtools/rpm/files/0001-Set-RPM_PLUG=
INDIR-in-top-level-CMakeLists.txt.patch
>>   rename meta/recipes-devtools/rpm/{rpm_4.20.0.bb =3D> rpm_4.20.1.bb} =
(97%)
>=20
> Hi Robert,
>=20
> Thanks for the patches.
>=20
> It looks like this is breaking several builds on the autobuilder, with
> following error:
>=20
> ERROR: rpm-native-1_4.20.1-r0 do_compile: Execution of '/srv/pokybuild/=
yocto-worker/qemux86-64/build/build/tmp/work/x86_64-linux/rpm-native/4.20=
.1/temp/run.do_compile.320418' failed with exit code 2
> ...
> | gcc: error: unrecognized command-line option =E2=80=98-fhardened=E2=80=
=99
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/68/builds/1841
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/43/builds/1779
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/28/builds/1680
>=20
> Can you have a look at these please?

Sorry, I have a local buildtools-extended which contains gcc made me miss=
 the=20
error. And when I started a new terminal to drop the buildtools-extended,=
 the
tmp/hosttools/gcc still linked to the previous buildtools-extended, didn'=
t
link to /usr/bin/gcc, that might be seomthing we need to improve for host=
tools.

I've sent a patch to upstream to fix the error for -fhardened:
https://github.com/rpm-software-management/rpm/pull/3796

And will send a V2 to upgrade rpm.

// Robert


// Robert

>=20

