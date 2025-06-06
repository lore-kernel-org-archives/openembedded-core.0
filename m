Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92125C5B543
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 03:30:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.25770.1749180600081183442
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 20:30:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8252d755fa=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5561HeFf024692
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Jun 2025 20:29:59 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rvuqy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 20:29:59 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5563Tw9D026523;
	Thu, 5 Jun 2025 20:29:58 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2082.outbound.protection.outlook.com [40.107.244.82])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rvuqx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Jun 2025 20:29:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZB9eWCjR19OI5NLejdLPYPX5S/Exemuv1BQ+FwxPfWzxU7cPhiY+dTt6QLHpPuX4uX0gikvOOmV/hRvRknYwBNa/unliTDkSjlvQCPF/WqgPVwO9Kbh1m9EhnQbJK6JYI0WCcffJylhEN3H/C/RrzEKnQPAIPMJNlcX5RC7qcnnZBsCxWQY3ZNAxsal3QpZls53gS2r0oCcOnK0qPulfwBdxLnfw+OXjIEGb/HfRRfCjOgyIl5xeU0P46VOzs/kKVHiAEfM2sFfHdAOFaJ9l58F/D46llipI6WBavv6L+Bc0ozKOcNuQDzIZuZeSpzqkXxnamV0cu6p38rVf2Yd+PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AW9X7f7WExQojXZ3YS0VvLURQFDAV1WSD6lcGerlIdE=;
 b=o49T1K4oORvuz9LzVvGLfH9LuupY7ir4MYLMuiHFaKv1MHI7+LFZpwTC2vRjp9AjA2HE9ouCQUFcnpqyN5xVYSi7k3k/NMvtBKJqUmcOEvao3JPOVLt+xMqbXI2ksaZgMVqQNn6S94iqMXxzIu2ihEbBpuZpo+YIWrxGpgCPARsmIAHihK3BGwEdboOc6we7fkOxUnTtc9m+AY/HjYQLS7aaQF+IsRBwXV8nWQ0B14qbI/nWBSTss4G79SbV2SIBdIWPgoN/4egCG7LwvUL33cSO0N2VVymxP/1ehM2lzCFt/2skJxW+aEa8CJ7PKWozSpFokzSCLEQM3Kbqj7bAvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by DM4PR11MB7301.namprd11.prod.outlook.com (2603:10b6:8:10a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Fri, 6 Jun
 2025 03:29:55 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.8813.021; Fri, 6 Jun 2025
 03:29:55 +0000
Content-Type: multipart/alternative;
 boundary="------------JjaUfdgAFUG7w3ai6KmONXGb"
Message-ID: <f131d185-9350-4320-abae-d82235743324@windriver.com>
Date: Fri, 6 Jun 2025 11:30:07 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][PATCH V2 06/14] libsoup-2.4: fix
 CVE-2025-46421
To: Gyorgy Sarvari <skandigraun@gmail.com>,
        openembedded-core@lists.openembedded.org
References: <20250604113426.464818-1-changqing.li@windriver.com>
 <20250604113426.464818-7-changqing.li@windriver.com>
 <be3d0085-1099-401c-b4bc-d30b19cf5b12@gmail.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <be3d0085-1099-401c-b4bc-d30b19cf5b12@gmail.com>
X-ClientProxiedBy: TYCPR01CA0204.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::11) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|DM4PR11MB7301:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fc9fd04-b784-4106-650e-08dda4aa67c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|4022899009|366016|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OVFpSGdpTlhJcXFpVEZMSTQ3cFRkMXp0bmxqdWMrZHVuZFhvQnY4RnpyQlV4?=
 =?utf-8?B?NGNXYk1xaWpjODdNUlo4eGFNZWtPQ2Vwbi9ucXEyMVVPYm5seUhxU0ptVWdK?=
 =?utf-8?B?TFJYVGZ2T1FJZStWdEpTUVJsVGV1bFFFUEszNFdLbEtlZmUzdGFSZitvRVA4?=
 =?utf-8?B?cWFvZFFsMHRRaGY3RnBtcitDS3JSbng2Y2VYUFV0d1cxZkpwamdMK0Eyajly?=
 =?utf-8?B?V1NMdGNlVHdUNExNMUwxODRlTjhhbVVia0h5NVhaaWNZSzVDRmFwQTQyTFZ2?=
 =?utf-8?B?T3VtUmhETFM0dzh1Y0NoeVovQlovRHpoc1hTM1AxV0JSN1FuSE83aVBZS3dw?=
 =?utf-8?B?eDcxOTFZWWkxUlR6SWV3bW8raUN4bFNsQTU2WGY4b3ZURlBmUm1IeXNnNlFM?=
 =?utf-8?B?S1VwSStaUFJrU1BWT3JJdzEvU0Fpa0JBM0kyWWhlNmU2OFZxd3BIL3BNV2c4?=
 =?utf-8?B?dEhRcnVHR2trWW80VmxJZE1USCtaZUo3RU10TVRBaGMxcGVNSktESEhid0tR?=
 =?utf-8?B?QmQyY09RZkZqUFNVMUZhM1cvbi9BdlJHUjdhU3NON2lwVTIwZEROc09RRTZB?=
 =?utf-8?B?VnZZZHRYb3pkZ0YyWExoNXBTQUxyblZlQlNrZUtoNHlZSXA3RzFJQklkd2JU?=
 =?utf-8?B?NWZJdXUxTDJLVVJSZ2lTejhPb2RIUGVFa0FaQ2VxdktHdWM1Ykp3eVJveWZD?=
 =?utf-8?B?bUtkNGgzbzFGRXFUd0xnSXhNSzNTU002MDdsTUJRZExzZWE1ZTdrTXdiM2lz?=
 =?utf-8?B?SXlsT1RJWXQ4V1RkcEpaL21maU1QY1F4OWI5V3ZFYko0MEJYSnhTanFqZ290?=
 =?utf-8?B?bXdEbHNOZ0h0Z2hyR09LY0RNNjcvVzU4OGZDNkg3TEwyd1kyWDlQOVdhMUdM?=
 =?utf-8?B?Qkw4b2FwYjc2dXAwdGhlZVZ4a2E0Q2V6YVBMaWJ4Vm1Ydmx4cDVpcWlDcFFx?=
 =?utf-8?B?cG00T0NmckV2ZDhSaG1oR241RnVPMGhaYmRZSlN2TzEwSjFVMFg4RS9KVVlF?=
 =?utf-8?B?V0Z2Z0psQW9ocVMzbnlSdzFOWVRMT25BTzZoeWM4Z0NtWlR3Uk9YTXJkb1B6?=
 =?utf-8?B?MDl1YjRhVkt3U05TYlBrWDl5NEc3MHVhZ0FGMThXQlRyWGlzR3B5RmNaUEdU?=
 =?utf-8?B?MjJab2dnZDlzN1ErUFJvQmlDdGtqcVVvOWR1dzEwUGN2bW5xWDBwU2FKcVhx?=
 =?utf-8?B?NnFRSGhEMSsvVUJDUVp5eXkrYzRmdHJYREZWMmljeEFsSU1vdE9oK0thMmp4?=
 =?utf-8?B?QUJkaXlpTTFRR2dYZFUrWHIrbmp6R3Fack5jdm1XWEl5aWxXMVBvdmQzQnJI?=
 =?utf-8?B?MW1YN0VHYzVucEtVSXJ1Q0ZNV0hzcm54b3JzWU45djZoRWd1Q2pIdVlMY3Vt?=
 =?utf-8?B?Qk5BWW9MNzFKWGlDLzBjbXpGUXlnd0laM0pDejJpS0JwbHd2NGZlNGNSOHgy?=
 =?utf-8?B?cWtMcFNLQzNvQTAxRWZHTFNpc3dtMStvanJ0aVdJSWhzditZR0FoQ1dSLzVV?=
 =?utf-8?B?ZGxlamZlT1NUV000YlpraGdodTNnRUR3SytJTC9CL0JDSi9Ta00wekNvT3RP?=
 =?utf-8?B?LzJ5d1lqYkZqbUYvTGh6d25BYk1pT0VFQ1VEQU4vWjBRSWJ6SlBLWGsrYkFM?=
 =?utf-8?B?eTJmclE2Z0RwVHY3K21ucTh1eWtYM1VUZGM0YXZlN09QVEdDRnJLSE92dTgz?=
 =?utf-8?B?Z3NmRUNhT1gxY3VIczlYZFp4a1VtbFYvTzVsZkd1OFVlak5PbU1Od1dIeTFP?=
 =?utf-8?B?TDQzS2xPUmh1akFpaDJiZTJnWHFLbEdMVUhxeFpVeGltWFEwWThJZXlBYndX?=
 =?utf-8?B?RUNqdS9nelBhT1ZZWjhLZUJDeTBKSDByTHBIVEhKcFVpV1ZMQTI2aWdFK0I4?=
 =?utf-8?Q?o4e79R8y273wC?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(4022899009)(366016)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?T29YZ21sTEZkY3Y3VmtpMHI3ZVJUSmV5L3AzbS96S2NKUDBIamhkQU9ZeGtV?=
 =?utf-8?B?aWgwY0I1NGJycDhicGJUUHpDOEJBdUFiSFBod29zN1ZhWGFOeS9ZSkh0K25M?=
 =?utf-8?B?UWEyckZJQWM5RGdTMUJYTEN1cHhWNzBSMWZ0Yk5FQWh1WUx3bE5aSzdMQVo2?=
 =?utf-8?B?SzBKMGU1NG5hV045L1VJd2JoOTFtMFYxNjF0Wmp1WjYxWktHQWtOc09zTHJn?=
 =?utf-8?B?Umo1Yi9oQUlhSTV4eGpyTXdwbzlJc0xwRlh0RXMxMis2eXpWdG04cDJuZnJy?=
 =?utf-8?B?YVgrS1RzRCt0eUpHM20yT1owYkxRVk40QmdRSlFTdWh0RFdJbnQ1bzNXOTVm?=
 =?utf-8?B?RTd0MkpJTlBvaEJSQkk4Y3RoR1pHVHZWc3IyNFd6djdlYlJMR2dWWDN3UjdE?=
 =?utf-8?B?RXltUGVvYmdxYVdiMEtPNDFjTlJhckNoY0U0UWplVzFxejErNFdiLzhlSzN5?=
 =?utf-8?B?ZW84ZkJRNXR4ZUZmZlJBeGFUSUZacDAvYkZXclNjdHFVOCtRREFWNjRnNzdP?=
 =?utf-8?B?K0pHeVdYRDYySEtwUEd0eWp2LzhyMTE3bDIxV2oyMnM4OU8wcWxsN3hiRHJu?=
 =?utf-8?B?TFRBdGdHN0NjZk40NDhWaWVhSGl0VkdkSlh1aVRDRVdsYnllU3V1Z1pZQVla?=
 =?utf-8?B?NWxCTjFabndLb3VIVExTdkdic0NJT0p5S0ViVCttVUx3bWJUUDE0SXkxdUs1?=
 =?utf-8?B?OWF4a3paNVRJdjVNM1lYdUZPRlZON21KWHpVcWk4eFVaNFh6U2c2V0paMTV6?=
 =?utf-8?B?bHJHMFdTTGd4TXNXOTdMMWlsQ2JON0ZMSjRlak1qeFJzbERmR0dSV08wU3JL?=
 =?utf-8?B?bDJqU29zUy9kMjdTcER4UnM2aC9JS2t3MTdoU3J5NzdwNnNFM0M1ajBSWHZj?=
 =?utf-8?B?K3p3QUsvVVEwODRTblFYYk50a29YUHd5eFNwSUkxVWVjMVo4WE05RVlzQkxN?=
 =?utf-8?B?ZTdKQUNEWnVRMmFWUmp5aFVSNndWeEdOZzNjR2xmbHo2cEVYL3cyNTUvMVJT?=
 =?utf-8?B?aEtpVlRVSTEvaEJ2Qno1RkZBS2lBRjRpVWt5dFdpOFZ5UUQ2SDlYR2xiR0Rl?=
 =?utf-8?B?UXBxRWhxK3d4QkRoWUx3ZWVueEhFYnRBOVZ4cFArRnVFTG05NG02VmNQSHJw?=
 =?utf-8?B?R25iemlIaUpLa1B4aVFiU3NCYWs3SW5uRTBuR3FYVVNMa3BnWUQ2SVBlMXcr?=
 =?utf-8?B?SHhodDV2Y1hoNDRnaTJmbUVKWXVSYU0xMWUxRXBFc3RWazk1cUxBNnl1RFhw?=
 =?utf-8?B?QlhtY0xISUE0MWtkclREdm5nU0kzcWJYZ0FDd0Y2aUJFWVUxaFdseGxvWlFs?=
 =?utf-8?B?UUd0NlAyeUl0YVhzTzk4dXA4VnJYRjZQVkh3Tzd1TXpGRm91SURoOWFEeDky?=
 =?utf-8?B?REFYSUF0SmQ2OFhFbHJwRmYrbkM4RGNGT0VjVjZuK2oveGVGdzhnZlhjVDNv?=
 =?utf-8?B?TWdpeVYrd3p4c3FSMjJZMkhPcVhabTNXTGNBRzV6TTRVQ1I1cThGQ0lqeE5n?=
 =?utf-8?B?dm14TjRjL3JhQkJwcHBidnZDdksyRFk1TndBbGdmZGhaV3JlRDhGaUFETXYx?=
 =?utf-8?B?aWMvTFBFbGFIWlVYa0Z4SEFOcElUV09Tdmk1MU1qL1ltNENkbVR0dGNmUTRQ?=
 =?utf-8?B?L1VINTB3YlROUnpBK2E4RDlySVN6UkFpNjhOQmZrb0hFekdqM20vVDNRZ0dr?=
 =?utf-8?B?eWJteHRJOUNCcXdoQ0d2SWk2dXZlMlo4ZndiS3ZFRXg4UkdxNHZhTldiMDF4?=
 =?utf-8?B?YzhUdndnUk9SdlI5QUo5blA2TC9IODliODh1Yit3SGNjaUdGZmd4U01EWmpz?=
 =?utf-8?B?QmZ1SG0xY3d4VDBCaEhrQ203TzZUcjVOTWc5WW82c2RvNUQ5TTZjSGtLS3Rt?=
 =?utf-8?B?ZVovL1NRRFNQRFdUQ3V5NmhZc2k4a3V6WThDKzB1bWZMcHhPaWRFa0VhaXha?=
 =?utf-8?B?ZnFXbXBqZjkxVkFaQlZ2NFhPMWdyYnNNUkNaNVlid1Zad0hxNDZrVFFFVkli?=
 =?utf-8?B?QlErN3VuL2V0SWF6d294bXJvV3pIVjVzbXBBWmtqZ3pVNlBETzNWRU5zTFdQ?=
 =?utf-8?B?cUJJTEJVbWJRL0FoV2YrRXFrWVVSczZ4aXd3YThoRzlTTUVSWlRqZkpUM3BY?=
 =?utf-8?B?SXdab1dUdlJOR0R2UzJMblJpME1CaGcrTzRRd3hMYlg5Nk9ISldhTzNTSHh5?=
 =?utf-8?B?aFE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fc9fd04-b784-4106-650e-08dda4aa67c3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 03:29:55.1218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QSSDggwxtFwDGk26WyWaAzjfvBqnCS6W8RgxucudTcIZNPwrNNG0BLBczQQ9YvRZl38rQpNKSxZWau8kvVb10yIa/W6KUN5Qhh9jmn7659c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7301
X-Proofpoint-GUID: LQdN9ln4FvqoTezWzEmVxEuldnSHDzSy
X-Authority-Analysis: v=2.4 cv=VIHdn8PX c=1 sm=1 tr=0 ts=684260b7 cx=c_pps a=+1Pulch26Pu9WVt5L8GVww==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GHR8O2WEAAAA:20 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=V2sgnzSHAAAA:8 a=pGLkceISAAAA:8 a=4Txow1No6z9fe4ssPjgA:9 a=QEXdDO2ut3YA:10 a=UBFVfQAFWYhimOpKR3UA:9 a=sTgobtX4FntTA4p9:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=Z31ocT7rh6aUJxSkT1EX:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDAzMSBTYWx0ZWRfXwzX7zLg9BpEA hfD/Ulk06vpPpiai2zsyvKzh3LcBlTlPe+iOSrw9cYw3oU9IsZqOUSP+pGuXPdViFW6VaeOgHvz O8PJCkus1I0c4CWoNiP4Y5hzTie2Kk86ZXb1wwkSfQgIPHvJiQfgaMH2u/8TaO4h5A+2Rcy6iPp
 1N9NWnhCAelY4ccglYvVBE58M6a7QdZNcw64tFdgGlX2MDdJ70vx2z2EQE2AoMDy+uMrr8Tku7V Q8J6M+vEvdGsrhmzotDDAIRArz2oL2W8vK7p8usS2UfMWJeZpAMY+T+RhiTXOPF7ze0KOQQTEF6 NAg0RHgcOxjaJ6pxd1HDvSiipE9wIp4YIyZbiCy99zZ8kcQjvnvgTrfkR9JHqFdlI1mxrD0ND+S
 MArJCWxMZHiYwFaQRAm+uDVwwwZrUThWg482I/rvNu+BMoyxZ+cYed+jEDYQVEL2JwkHwOdu
X-Proofpoint-ORIG-GUID: wXHXtk89vHZ1xBwNC-44yjIh5m2om76g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506060031
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 03:30:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218090

--------------JjaUfdgAFUG7w3ai6KmONXGb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/4/25 20:13, Gyorgy Sarvari wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On 6/4/25 13:34, Changqing Li via lists.openembedded.org wrote:
>> From: Changqing Li<changqing.li@windriver.com>
>>
>> Refer:
>> https://gitlab.gnome.org/GNOME/libsoup/-/issues/439
>>
>> Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ---
>>   .../libsoup/libsoup-2.4/CVE-2025-46421.patch  | 48 +++++++++++++++++++
>>   .../libsoup/libsoup-2.4_2.74.3.bb             |  1 +
>>   2 files changed, 49 insertions(+)
>>   create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch
>>
>> diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch
>> new file mode 100644
>> index 0000000000..64706f43aa
>> --- /dev/null
>> +++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch
>> @@ -0,0 +1,48 @@
>> +From 5eb225f02bb35de56cfeedd87bde716bf1cb750b Mon Sep 17 00:00:00 2001
>> +From: Patrick Griffis<pgriffis@igalia.com>
>> +Date: Wed, 5 Feb 2025 16:18:10 -0600
>> +Subject: [PATCH] session: Strip authentication credentails on
>> + cross-origin redirect
>> +
>> +This should match the behavior of Firefox and Safari but not of Chromium.
>> +
>> +CVE: CVE-2025-46421
>> +Upstream-Status: Backport
>> +[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/436/diffs?commit_id=3e5c26415811f19e7737238bb23305ffaf96f66b]
>> +
>> +Test code not added since it included some headers not in version 2.74.3
>> +
>> +Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> +---
>> + libsoup/soup-session.c |  8 ++++-
>> + tests/auth-test.c      | 78 ++++++++++++++++++++++++++++++++++++++++++
>> + 2 files changed, 85 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/libsoup/soup-session.c b/libsoup/soup-session.c
>> +index 83421ef..8d6ac61 100644
>> +--- a/libsoup/soup-session.c
>> ++++ b/libsoup/soup-session.c
>> +@@ -1189,12 +1189,18 @@ soup_session_redirect_message (SoupSession *session, SoupMessage *msg)
>> +                                                SOUP_ENCODING_NONE);
>> +     }
>> +
>> ++    /* Strip all credentials on cross-origin redirect. */
>> ++    if (!soup_uri_host_equal (soup_message_get_uri (msg), new_uri)) {
>> ++            //soup_message_headers_remove_common (soup_message_get_request_headers (msg), SOUP_HEADER_AUTHORIZATION);
> I think for libsoup-2.4 this would be something along the lines of
>
> soup_message_headers_remove(msg->request_headers, "Authorization");
>
> or wouldn't it?

Gyorgy, great thanks for point this out. I think you are right. I will 
fix this in V3.

//Changqing

>
>> ++            soup_message_set_auth (msg, NULL);
>> ++    }
>> ++
>> +     soup_message_set_uri (msg, new_uri);
>> +     soup_uri_free (new_uri);
>> +
>> +     soup_session_requeue_message (session, msg);
>> +     return TRUE;
>> +-}
>> ++}
>> +
>> + static void
>> + redirect_handler (SoupMessage *msg, gpointer user_data)
>> +
>> +--
>> +2.34.1
>> +
>> diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
>> index 3f66099361..d37b553a92 100644
>> --- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
>> +++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
>> @@ -35,6 +35,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
>>              file://CVE-2025-32053.patch  \
>>              file://CVE-2025-32052.patch  \
>>              file://CVE-2025-32050.patch  \
>> +file://CVE-2025-46421.patch  \
>>   "
>>   SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#217933):https://lists.openembedded.org/g/openembedded-core/message/217933
>> Mute This Topic:https://lists.openembedded.org/mt/113464308/6084445
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [skandigraun@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
--------------JjaUfdgAFUG7w3ai6KmONXGb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/4/25 20:13, Gyorgy Sarvari wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:be3d0085-1099-401c-b4bc-d30b19cf5b12@gmail.com">
      <pre class="moz-quote-pre" wrap="">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On 6/4/25 13:34, Changqing Li via lists.openembedded.org wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

Refer:
<a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libsoup/-/issues/439">https://gitlab.gnome.org/GNOME/libsoup/-/issues/439</a>

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 .../libsoup/libsoup-2.4/CVE-2025-46421.patch  | 48 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch
new file mode 100644
index 0000000000..64706f43aa
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch
@@ -0,0 +1,48 @@
+From 5eb225f02bb35de56cfeedd87bde716bf1cb750b Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <a class="moz-txt-link-rfc2396E" href="mailto:pgriffis@igalia.com">&lt;pgriffis@igalia.com&gt;</a>
+Date: Wed, 5 Feb 2025 16:18:10 -0600
+Subject: [PATCH] session: Strip authentication credentails on
+ cross-origin redirect
+
+This should match the behavior of Firefox and Safari but not of Chromium.
+
+CVE: CVE-2025-46421
+Upstream-Status: Backport
+[<a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/436/diffs?commit_id=3e5c26415811f19e7737238bb23305ffaf96f66b">https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/436/diffs?commit_id=3e5c26415811f19e7737238bb23305ffaf96f66b</a>]
+
+Test code not added since it included some headers not in version 2.74.3
+
+Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
+---
+ libsoup/soup-session.c |  8 ++++-
+ tests/auth-test.c      | 78 ++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 85 insertions(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-session.c b/libsoup/soup-session.c
+index 83421ef..8d6ac61 100644
+--- a/libsoup/soup-session.c
++++ b/libsoup/soup-session.c
+@@ -1189,12 +1189,18 @@ soup_session_redirect_message (SoupSession *session, SoupMessage *msg)
+                                                SOUP_ENCODING_NONE);
+     }
+
++    /* Strip all credentials on cross-origin redirect. */
++    if (!soup_uri_host_equal (soup_message_get_uri (msg), new_uri)) {
++            //soup_message_headers_remove_common (soup_message_get_request_headers (msg), SOUP_HEADER_AUTHORIZATION);
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I think for libsoup-2.4 this would be something along the lines of

soup_message_headers_remove(msg-&gt;request_headers, &quot;Authorization&quot;);

or wouldn't it?</pre>
    </blockquote>
    <p>Gyorgy, great thanks for point this out. I think you are right.&nbsp;
      I will fix this in V3.</p>
    <p>//Changqing<br>
    </p>
    <blockquote type="cite" cite="mid:be3d0085-1099-401c-b4bc-d30b19cf5b12@gmail.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">++            soup_message_set_auth (msg, NULL);
++    }
++
+     soup_message_set_uri (msg, new_uri);
+     soup_uri_free (new_uri);
+
+     soup_session_requeue_message (session, msg);
+     return TRUE;
+-}
++}
+
+ static void
+ redirect_handler (SoupMessage *msg, gpointer user_data)
+
+--
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index 3f66099361..d37b553a92 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -35,6 +35,7 @@ SRC_URI = &quot;${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            <a class="moz-txt-link-freetext" href="file://CVE-2025-32053.patch">file://CVE-2025-32053.patch</a> \
            <a class="moz-txt-link-freetext" href="file://CVE-2025-32052.patch">file://CVE-2025-32052.patch</a> \
            <a class="moz-txt-link-freetext" href="file://CVE-2025-32050.patch">file://CVE-2025-32050.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://CVE-2025-46421.patch">file://CVE-2025-46421.patch</a> \
 &quot;
 SRC_URI[sha256sum] = &quot;e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13&quot;


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#217933): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/217933">https://lists.openembedded.org/g/openembedded-core/message/217933</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/113464308/6084445">https://lists.openembedded.org/mt/113464308/6084445</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:skandigraun@gmail.com">skandigraun@gmail.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------JjaUfdgAFUG7w3ai6KmONXGb--

