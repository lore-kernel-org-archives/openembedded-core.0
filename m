Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 505A9C87FCE
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 03:10:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.73550.1753672203533162452
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jul 2025 20:10:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=930402bcc4=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56S2mmcb1256712
	for <openembedded-core@lists.openembedded.org>; Sun, 27 Jul 2025 20:10:03 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 485xpm02gp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 27 Jul 2025 20:10:02 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 56S3A2021293324;
	Sun, 27 Jul 2025 20:10:02 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2070.outbound.protection.outlook.com [40.107.93.70])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 485xpm02gm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 27 Jul 2025 20:10:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y4bM4tsjI1J7/lAEcX+0hVts0iT2mEli8cyq7bIpYgSJl9lajXJ4rovwsU+OTa4Eht+3RW5yeAUcWcKxFzZHoOmzV2NezjhUqAeAIkWpKq7/c9+RQhGvfksUYSKdnmcOl7WR6AjkLCrC1BGMJtC8T2+USuJ2yGh/X4C5zUSIP7KzkjiLqraw+BNOBGNcMFGXbdvSOrfu9Aze3nAE1HoNuhTQ2LeC2LEeuXut1qOqGzYPFNzAy+rZLecbY2lPPiQLizd/4rIbOg3U9YkE5yEJeIg4CNI2wxZwLIwTicvEZFxX71piryhgm1zC/DJ8UWTJSnGQhQJr7IWMdEXHPeu9DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ubV/oqK8cx0WmViYFJuMHKaBDZMERKd/BSirACsFlM=;
 b=vVe0qViiRVHignwVSjVoWpJV6pK19Of7Sw8JKrqIA3f/2Fiuuc+nIjaBfXQatEGlinFZrputBNCo/OiTVPt/wzfo7inSCeaFueWswtFT1NoWDwvX7Osb8LLLswzAfLKzoStve/8xaRG5g6QJD+3RAGUpTiKBEzLO4ctBN2YkKLiI7xRBeDdLTtkyDfRqbJiUdkiIYSDlqlulUbB0kFPMk5wicoHxSzadsD7Cl6zyqn5lav5331yhme5FGJC6OuSQ2YQo8WM6IjgGD9OaSH5mvPw7ZaV36ahHCJimYXStr8V8Ij5cO5eD+EOCnmJVcPQjwImt/B2Ui2MgiXlqfcQyAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by LV8PR11MB8535.namprd11.prod.outlook.com (2603:10b6:408:1ed::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 03:09:59 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%6]) with mapi id 15.20.8964.023; Mon, 28 Jul 2025
 03:09:59 +0000
Message-ID: <64210007-939c-4a0d-9e99-6a33189dd241@windriver.com>
Date: Mon, 28 Jul 2025 11:09:51 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/4] bash: upgrade 5.2.37 -> 5.3
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        hongxu.jia@eng.windriver.com, openembedded-core@lists.openembedded.org
References: <20250721082103.2262095-1-hongxu.jia@windriver.com>
 <20250721082103.2262095-2-hongxu.jia@windriver.com>
 <DBJ6VQ8HNDNA.2QA8PHPZYPCE3@bootlin.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <DBJ6VQ8HNDNA.2QA8PHPZYPCE3@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: KU0P306CA0079.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:2b::8) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|LV8PR11MB8535:EE_
X-MS-Office365-Filtering-Correlation-Id: 182af0f0-de3e-4835-8804-08ddcd843c4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?c0ZTcnlHemRncWliR2FwdGFrNkowUkZLSDEvMy9DdzM0cnh0cVczMmpnVEh5?=
 =?utf-8?B?a2FDSTQ1eVpZb2YyNmFQZXZvWnZVQWg0ci9BTFdNMGlrYUUzUDJxRERGaTFn?=
 =?utf-8?B?YytOWFBrSHhrdTBjbHRoUVVJZjVMQ2ltRnNUa2I5SngzZENvTUpEOWpyd2RL?=
 =?utf-8?B?NDhLVmtxL1VTTit0eGNNTEx3MTk2ckl2a1RYZlVHN0lIZHJqcGMybDNZTEhU?=
 =?utf-8?B?NjdtR29lSXVtcDRIV2lZMlFmemN5bGRjTFlZWXVsQ3Y3ZENGcHBQRHFQeE81?=
 =?utf-8?B?WUZhVWMwRkNkSFdYWTlOZy8zeDhXTjlMMkNhcDBscFRPSkdLZ3FBd3FlNjA4?=
 =?utf-8?B?T0QvS3kzc2QrWVpuSzNkT2ZPNlJsZjFBRWRLRXk3NUhjMG0xYnpqaEw3S2cw?=
 =?utf-8?B?OWg0MnZPTkJ4N1VuZnBnRFowQ1JsUTYyQzV4a21sbkR3WDNLTC93NEZqRjJN?=
 =?utf-8?B?ZUtuaTlwcithdnpLbHdGWnRweTdCM3dBN2ZGU1FtcTdDY3FKRjhTMjBUc0t2?=
 =?utf-8?B?TTZTdTkzaUw3b1FCWFFpenhNM0JJQm1DWlRya2VKRFFNWmVLUDNqaDE5UTlr?=
 =?utf-8?B?ZDVlZ3d1THBnMUhLcGxTZlVRMXFiVHdMYThVTm9mY2NSV0ZzV3U1d3MyRU5J?=
 =?utf-8?B?WllualM4NUswZWU0bGI5dlZGNE1HSjh6alR6TkZKZnRSdjlMNGFpdFA0Q2Zt?=
 =?utf-8?B?d1g1VEVhOU5JTU5sNVAwcmJDc25Vcm9VSm5NeVJoaUsrdGdZeUVRUTc5cEI1?=
 =?utf-8?B?b0lQNkl1eGJoeUVEUU11MUs1Q2FRUjRNNWlhM29aZW13KzIwVFd0OGVJY1ox?=
 =?utf-8?B?Y3RMZVVwdndhb21nNUM3c2ZVeEhuWUVMUmQvOFJsSG1NR2VoM0lrWWNMVGNk?=
 =?utf-8?B?bEFqSWdCcFRaVmVSaGJtcE1oNnJKdVNTU3pzK1ltazI2dlZuQmFaS21Ra3cz?=
 =?utf-8?B?RmFWckVZZllPbEpJZFoxVXNGK2dLZFRrWkdlWlhFamNRREFFOFh3d3c2M1pN?=
 =?utf-8?B?VmpBUFFaRTlZM3NFVUZJL1NPVmZYYU56L2diYTZrejdCc2hUdFJiN2QraVNW?=
 =?utf-8?B?czlrNVVHbFhvZjh2VEVNRVFGVXN4bUozZWgxSERyYkVSUmIyT1o4TWt0OVhn?=
 =?utf-8?B?OWdwZk1wRE9wN2s1a1c1QkpYN3dsNmJpY3ZhMGI4SHMwTEF5bXptbys5TnQ1?=
 =?utf-8?B?NmVUdE1GS0pVbUtrOExSNEsxaDcyekMrdlI3L1FacThrVXhHUnFxQWxhV0Fk?=
 =?utf-8?B?NjQveDZHM09tV3UzSHMwUmFvUk5BWHluRFFvWS9IMkx1c2N0NDV4R2NIbUlh?=
 =?utf-8?B?NFFNbEpMWUd5NzlVbExqR2VneUROaXk1U0tkdXhNYXNGYzR6bncvT2xlNHZ0?=
 =?utf-8?B?U0VSY1VxT2NTQjUzclBJcDZNbUtpUkpJdGVSbXJndUNlajFMdC9PUmpDUmdX?=
 =?utf-8?B?Y2w0TzU4eGdFNGNuRkgwNmhIdjlZbWRVRFNKTnF4cTF1cHRzdmVtMWJ4emhL?=
 =?utf-8?B?bUlYc2l1ajdzWkdDZ3dxMEEwSlczdmVoWklWdDBRM3lPTXNpb0xNakFGSExS?=
 =?utf-8?B?SmVXcVdmUWtqRUZkbThwS2pFTFN3ekdSUk9pam9qNVRENVlFU2htN2tsUTdL?=
 =?utf-8?B?aHlLSGh3VVpIWitaVEdzQXNGaU9tNjR5U2NaeS9ZRmJNU1N4QktTU0ZlK0NE?=
 =?utf-8?B?dUFTQ3FqcDN5RVZBTzJDWUR4NkJERFVMa1RNbC9LVUQyKzlBV2dyOUpPUitn?=
 =?utf-8?B?ZVVOS1VwUzRwMUlMazZVQWZYUEcydjFIQURNakFyR1c0MjB1K1AyMGd1cmJu?=
 =?utf-8?Q?HXO6YzLkPC6clsQ5XkbL9lEkcZmCf22GyT0SU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?K2x3VWRaQmVtNVpiZDN3Q3FyNE9CT01EL3F0U1BxMEVUZDZPQ2lWUEp0WkFy?=
 =?utf-8?B?d0JFei81OWFVczZsWDlLMXlRUkVrQU43azVNRDJZZGNISTc1cG9LaUdvWW84?=
 =?utf-8?B?dmdISTRtTllKTjVoVVlxWDhMa3BpRXJMZC9GWnB2RThiRVZ1eXBoaW1lanMw?=
 =?utf-8?B?M1FSeVRCdkRlK3dOVXgzb1RhdERwSHJFSzZtSEtHQkFIc0VWM3dTL1ExOHVo?=
 =?utf-8?B?SUJTSmltcVhvZWdLbE5XcG9qS1FSOVBBZE5seExoS2lvcXV2K2hIYUF6YXBO?=
 =?utf-8?B?aDlLY3dBOE9xbml5K1BQSlhpMkRCeS9sYWNpRjdrOGp1VWhFSklHTHFGMWtm?=
 =?utf-8?B?TUJaNXorZ204eTlvQ20zaitORlRDRVJ2Z1lzOG1tRUtPaXBEdGRMaHB4MmFm?=
 =?utf-8?B?TXpJVkRnaStZbDZkRU5FN0N5UjNINHRPcHhPTWpRSkR3eHozN2xFUEEyakRC?=
 =?utf-8?B?MEVnYlZPUzZpcG9DeEZDWjhqcTQxMVZxY0d6UG5UYmVMMXZQRHpWQ3A5NFJW?=
 =?utf-8?B?RlJGTW83a1FnYzJKb29vaTU4QUl2OVVMZ0duSm16VWZIOGM3MytGV3ZUNnpC?=
 =?utf-8?B?ZjBYZklvM09DZlBndS9OY05mcUJSQmZycWMvUEpKQnpPdCsrOEtQUThleWRt?=
 =?utf-8?B?a3NEWHR1bW1WSmVHN2ZsWE9wREw3UXFtOGpXclZMeTdkNk10Z3VyclpIMC9L?=
 =?utf-8?B?K21SN0NYanJLTmNqaXptTGVMUElyd2pkMlNSdVBISC9nL1ZjOXdhZlA5YVZx?=
 =?utf-8?B?cFp3NVhQMlZmNUdvYk02N21NVEJTM0xJTTc0cFhsTDV0SWRIa3NxRkVhNG1X?=
 =?utf-8?B?bWxSeTFyREwxOVVNZkp3RHB2SUtsdmxpRDNMNFB5N0J5WFFPNjJUVG5Ta2FS?=
 =?utf-8?B?eUQ2L25tV0pTM3RwWWxrckl5TktVaThpeG9veUNvQmJoTEVyakFZV3hkc0xX?=
 =?utf-8?B?ZmpERmQ4TmZCckFWYlFsVDdjR2VIWERLUWFoNkwvWXZ1VE50S2txY2ZzWGFO?=
 =?utf-8?B?OUdVNmZDQzg5bkRYakNUWUZ1VFY4ZGRzOFJxTGR1TjhuWFU1SmxHTHRxeVpB?=
 =?utf-8?B?bGdNamoxc3k4bmx5ZnNkeHVLekpzdHhZeE9zeHljY3ZTcXNGWTNieWlzN244?=
 =?utf-8?B?N21Qbnd6ckhDRVY3NHJUc2tyUWpkTU5OcEJvMnJ5dU5ySVdIQjNZZko5M05P?=
 =?utf-8?B?TFBkQjFOVVpiSzdlWTVvQ1VPeTFMRXJmcldIR3hQaHAyN3lkclZuWndUcmxn?=
 =?utf-8?B?UUxlTng3bi90UE1aTDlSTjljQythUFA1cGxlMFk5dGtHTFp0OFNpbXg3TDEx?=
 =?utf-8?B?OEJQekk3Mjl0WEJxN0d4Q24reVZ3UC8vR0ZHcGNPSUZLWXM5bWlIZUxRTGcx?=
 =?utf-8?B?cGJaa1VDUkhMQmpRUDExci92RGdzQ0J3dEhhRDNqUk9KMjlkYm1DWkhwamo4?=
 =?utf-8?B?akl0a0l0RU1HMWlZMDhTS3hlb1VHNHhXUytWQjZicXlmNjc1K1E1b0NrRDU5?=
 =?utf-8?B?Q0ZPekUxRUVnQStFVjd3L2p5QjBRSEFTZFUxcnY3YVpUVXNXdE1FeTVzSGUw?=
 =?utf-8?B?WkJBclJLcFB3c0VWL2dRYm5ycHh1RlV0MDBOL1g5alJITUVkR29pVWRZYjh3?=
 =?utf-8?B?bkVWT2NkbnpDMG1iZlVPLytsTXFIaWY0T3dlM1o5b1VaU3llTkh4QTJBVWZL?=
 =?utf-8?B?WjRJcXg4WVp0SjlNR2pwSytzQi9ZYVdqZ0JRZ1haU2ZhMWpPWUtMSzJldU84?=
 =?utf-8?B?blR5SHJuMFoybks3NDQwYW1iOXlwTlJYaE1UN0tZSVBsT3JuSUh6R2orTHZq?=
 =?utf-8?B?SDRjNzgycmF1cWF3Z1FHZEFLdTUyQ3Q3M2hnby9JYUx4SGQ4UVI1Vk5uQkl4?=
 =?utf-8?B?c0dGRFdEcEJDSnR2VlNuQzF0Mk4yTmFLRlJ6NmdqU1VORkFvamd0VHpIdVgz?=
 =?utf-8?B?eUN4TzA0TFAxWnZMQXA5RVM4NjBKaG9NUWw0N3d2MHMwcEpjM1JnKzNuR0Nh?=
 =?utf-8?B?SU5Zb3B4Mmd6bFlPUU1YWE9YKzg4WXF4WjRVUnlNeHkyWGVPT2g3NXBhenJa?=
 =?utf-8?B?LzhHR3NqUnJVVWQ0YUZWY3F3aTNwS3E5L21oem8wVUdlTmNyOXFDQVFrYnFQ?=
 =?utf-8?B?czJ4eEpWblNWTHBFUDhCbVhSc3NDUTVVMVF0bUhwbFNuRFkvdXlTL2ZHYm1x?=
 =?utf-8?B?bEE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 182af0f0-de3e-4835-8804-08ddcd843c4c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 03:09:59.1373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ukyl7ogjgALghgl4vRXfGfQhvRXd7GvlN6MRQPPSeunS23QZPE9/srMDmU6P+e0zi6e7hOS0kW3PCJivBo67HIuXSuxhh4weUcKIfDtGsFg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8535
X-Proofpoint-ORIG-GUID: _PrwX4Peeydh4sAfFFv3eKuKCsh6Dglx
X-Authority-Analysis: v=2.4 cv=Ps6TbxM3 c=1 sm=1 tr=0 ts=6886ea0a cx=c_pps
 a=zt8rrfwMfysDI2oCBTbMeQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=iGHA9ds3AAAA:8 a=1NWNoF9oAAAA:8 a=P-IC7800AAAA:8
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=k8P1qRasuFx08aVWB64A:9 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=97APRTa-CG6DvPMFVxHL:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDAyMyBTYWx0ZWRfX+gq/0ApxFhRK
 FILwmzsFgoHwrdSj931sY/+T1Fttvlze9qMnE44QolQFRT8WwB8SRQ/vwiQbTAkrD34g2RGlsE8
 QxTmYrMG208uCeiSTJpAyQFvY6UFcN6BPgmQdkG42fXkcfjygfecCyYI9d8/7z397GKJXUB+3Im
 bHaYO//BZeIJqnkRJzmXj8+Q12KD5zX5tZJpxi93CDAPcGOdhXmktnulP3abFYt/sAbe+1HUKRk
 imph6z0fJiRcUtYGj43jBLfw7CB3qA5WUGwr1yxe7B+G1yNA7APOJwUToItFFjVGRfXJTkijuxN
 LDkPu9aOIWJjEozdDEL7Cobw6+vLDijUv31w7D2dDQSmzsq59PpeGF+5MDtqfaG7MuM7v+Qt45a
 u1qHk1oM
X-Proofpoint-GUID: Mg9vjHFcmNu_p-kNnvMyCUNjHeFY41Qd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_01,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2507280001
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Jul 2025 03:10:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220983

On 7/23/25 13:35, Mathieu Dubois-Briand wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Mon Jul 21, 2025 at 10:21 AM CEST, hongxu via lists.openembedded.org wrote:
>> Refresh patch to 5.3
>> - mkbuiltins_have_stringize.patch
>>
>> Drop backport patch
>> - 0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch
>> - fix-filesubst-errexit.patch
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
> Hi,
>
> Thanks for the update patch.
>
> It looks like this is somehow breaking util-linux ptests:
>
> Failed ptests:
> {'util-linux': ['kill:_decode_functions']}
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/1942
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/1934
>
> Ptest logs can be found here:
>
> https://valkyrie.yocto.io/pub/non-release/20250722-88/testresults/qemuarm64-ptest/core-image-ptest-util-linux/
> https://valkyrie.yocto.io/pub/non-release/20250722-88/testresults/qemux86-64-ptest/core-image-ptest-util-linux/
>
> Can you have a look at these failures please?

Sorry for replying late, I am OOO last week, I am working on it for now

//Hongxu

> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


