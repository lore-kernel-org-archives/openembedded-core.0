Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9385CF3C26E
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 14:25:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15496.1773066329386699831
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 07:25:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=c2ZbHyDk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75289530f7=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6294j1dN2128275
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Mar 2026 07:25:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=ujJuPql2Y38qih3lu+4E3GgIlkWg6fm78O1CHMxgN84=; b=c2ZbHyDkMmCF
	Q6AknQt0b1bM9pPV/R2NJek3C49v3OWxnIENYGURjnP3Euk1by+4Btee4s6ba4f5
	jW/iRb7ozBGeoFWMi1s8O/vGJbAqjXnAG4WSNonMxIe37WbfWKf1mOC7Yx2CmV5Q
	44FveTMopOpcqp5P4DtHjEChKkT6OnVuFMhBGyHjhMnUMUqCwu71udCnnL1/eZus
	qaC0S5YcrJnnJoYbBquKX2mcduJmaMgS1pJyjSFYLcVfb+spUObdzuQGoiujYWyp
	AhtpuPece2aLVCghKZCBc8cqYW4STN1wR4B81NuGfxO2i0DH9i1/xzk2W3dMIHwW
	Ru2VR2CnlQ==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013027.outbound.protection.outlook.com [40.93.196.27])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4crmdm1mhj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Mar 2026 07:25:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w+fxv0kQ2+vB0k5YninOEEGigoLGk5KwF+SS7Qs8caFhRB40679iJ2DtcLa1pyOhtGSq2ELXLuzU6k6a9oVcUkGH1o14hLJ+3xrtvcQd0VKtPIgeL5DugTwToNb58/+eBu6OMr35BsDGGdW5ry7waEr8+6CCmDGcnZL3Kku6Y7/O8u1/QRRVFs3ok556JxhSDlAg00JTU2tfDDYD0J2jUFyOFCxE3dk+13MbN3gbFr7XeUcXhOdm4dFAGmu8Rk1VujVYv7d/BqNksnQ+OCWgGhk+ig3s/11tE+ZqbaW5Kha9DBM9qcirLrkRsGk4jBYppD14GzJuv8tSzMLCA4Nrrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ujJuPql2Y38qih3lu+4E3GgIlkWg6fm78O1CHMxgN84=;
 b=GYnrVfMvj07iODQilS4jl0ucPf4Q7l/rss65Bk/bJNl7LPMMRWCWxvuaKA56IayObg3vZR9UglpakKOeaPgxBvWH/jUGh4fTC2rhNxihTS7fPr9prCREH9dX+fIox05Lv9Njkgq0PtclMSHq7R/zubJcxRB/TpX0dV4Kq1oHCe1LAmhrCAWbkOCB33EDjx7kRwXvZtWPMCa5ys8BewPouHMmvQdglIfy2Xbf1hwL1xpVE898JsROKDNZuUX+VAgdJdJTkXeR3RC5w/gVHqnvQeKL0lNu+1t9ghjvqP4k2i0yGpiL68BdCF54737H6LNZqevKCP6dzmKcZHMb3aqQWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by MW3PR11MB4746.namprd11.prod.outlook.com (2603:10b6:303:5f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.10; Mon, 9 Mar
 2026 14:25:25 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9700.009; Mon, 9 Mar 2026
 14:25:25 +0000
Message-ID: <97641fd2-9c5c-4d4f-9b7d-ca1d655e740c@windriver.com>
Date: Mon, 9 Mar 2026 22:25:14 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][master][PATCH] groff: upgrade 1.23.0 -> 1.24.0
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
References: <20260306092939.1907718-1-peng.zhang1.cn@windriver.com>
 <DGXIUF7BJW61.19RP6EZ3O8H60@bootlin.com>
From: Zhang Peng <peng.zhang1.cn@windriver.com>
Content-Language: en-US
In-Reply-To: <DGXIUF7BJW61.19RP6EZ3O8H60@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0540.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::6) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|MW3PR11MB4746:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f9dddd9-7dc4-48e4-0d65-08de7de7b481
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info: 
	reEoE8GfX/OA8f65cKbffiEJ5MOtchhXkizzZSSV480HORPToLaSG3N/zuKILcR4up7rd2v1n19QdTtAQkY7Uh/0YzYgcuUGVOefElviMB2Z/bCcJkFHnOo9txrn0jygF3NCwYJRCC3xERMrVA3Xjfcc0AD/c4+M8fYU6/lWAqp9AM0BV9OGuZXA/ks2pPyp1kWaDv4YyWrVamvUx5nala3ODNyiFpkOKl23ncEQg01fzziGr+TtwWN9TO26ezmVzMVctDfLGkCEj8fIKCUWEerlWi6nKrxj+tpR7E1HctIpikldAuPjAM7CwH30aY5Nm9Dj1pfl6I9HDgAeaD8lUx4KuHVlCSqfy0aJAPASztiC/p0Yg/tG0odEh6I09aeeG0kKZosB8gPcmcywprQslW/++YhhSFNtxU7L+VA1aEHlb8jZ9+Skg48UaCS9ZShlF0tQeBcNxngd2ziY2LZq+Ug1W3/luCVl8nyDEF7CmEQ0HEjirdVM/sERR98b8XBUc23wDvcQ1tGNMrepgIL5xVdLaSRlvCRRUR7eovTT7QwXwRf/OrJsZjctZ+0d0DKQI6LfOytCN71VDhoSv79TUb4P0g98kprBAqPK4Y6ekicLc9NcJcfMaT+1TkFOwS93wHPpFLP6GH6EntnsoPnvw0p0OJ0nXwt71atcmPDg3RzCYq2x9jB6rDoUurmq0SQw
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MElKRW5tdmNSWFQzRm4rSXBmcS9XZFVMMkpCYlkxVlpkMVlpTXFveUZXMmZT?=
 =?utf-8?B?ZHYybW8vQW5pYnpGYkpKSVVScU1DTTdReGFKcW1ITGc5ay9OUnJGTERTbWd3?=
 =?utf-8?B?eWkvazhrTFdQWmJBeWZKY0NuQTcrb1RZMmtaamg0ZDBrQWV5UXJ5YXJuTEE2?=
 =?utf-8?B?b0JQYThJaHNkdDlwV2pLNW5TSGJZTU93Szd3SUZERG1WU1ZsTXFQekg2NUlW?=
 =?utf-8?B?TjFHLytkUUhPTFdaV2hjVVFXTnZ3SzhpOXlDeDQxOCtLY0lWMzNGeHUrZXAw?=
 =?utf-8?B?Z0xpZTBwY3FZcERacVNobEZiRFFtUCt2N0Y2TVl6K283dzZXREFuM2tKWDRt?=
 =?utf-8?B?L1lIK0xaZWQwdTRqVzluMnA0Y0ora2tlVFk0VWQrQXMxOHdPQVhUT2k0MlJn?=
 =?utf-8?B?dU5UYi84bmJ6QUh2M1FiTjZBb2ZJSzdLNjBQM3lEQ2RXbTVUOWtaYVhFK2x5?=
 =?utf-8?B?dnhQZ1VoNEVUamtJMDYzRU5tb0haR2Npd0lEMm9LYW1SeHJ6dG0veFJOaVFW?=
 =?utf-8?B?eEorZ1htZDF2aHVmckJUTURkdUFLeEdySjhjMUJsMDBPVzRnNnF2dm9raWZ2?=
 =?utf-8?B?Uk9OMGxYZzJKSFVrU3VBZGQvVDhaY1dNUzZ0RTFYeVkrNlUyb0ZTaVdiRitO?=
 =?utf-8?B?ZmdiK2grZHpIQW1ibVFDQjd5QXFJaUFoTmVocEFzR1FGeDJteHBBeTAwZjQ3?=
 =?utf-8?B?ZTZuWVJjNGxqNUlrTmtjUnNuMGE4anFJQUJyT3hjanlZQklFa0ZUOVdNVzQ0?=
 =?utf-8?B?aXlGL1RId0J0UUc4MCtRK3pZZXhYOTM2Rk43SWMrRCs5UVZoclVGeWtmb3ZN?=
 =?utf-8?B?OXBiZ2xKYzBPdVoxVlRvYzJsUk9SSkQvSVhnbFZOeXllYjV4ZGpoTitiUlVO?=
 =?utf-8?B?bzc2L2MzZTdtWWd0NEJZSDloNjNlT0JGWTFPcnNNejhtYVJFUkUvSS8wd3Uy?=
 =?utf-8?B?NFF5TWZnUGh2SWJMVWltWnRqWFhIVWF3WlFJZEdXZHJWWlgvMmtaaGxYYWtC?=
 =?utf-8?B?TWNjdkJNM2hEekRVb3p3ZlRkYm9KdlZHMGl3OFFLeVJFQnNKa2VUZG5ydThr?=
 =?utf-8?B?WnZ3TkZqb244TGx3Y1hEZDg0ek1SWnF4VnFKY2lsTWYwSng1Q3l6Ty8wdVZp?=
 =?utf-8?B?VCtuUTEvTFozTVZPd2FuVFpSWm5uTFl5ZHIrc3hBODdrWk83Y3NLNG9tV1c0?=
 =?utf-8?B?anc0N1JuOXhPNStWc1l2b3dHbG8yQXlhNHhycExCVkRqYmplNGV2dkYxL2Va?=
 =?utf-8?B?WHF4Zi9LTHBRU2xUbW40ZGdzUm42dk1mejRHS0JRM0gwb2hadVZKYWtsSUFN?=
 =?utf-8?B?SElRM3RJSHBNWS9mUmx4blVaUnBSNy8rNjljMnZ0ejlrOWV6T3o3WGtOWlF6?=
 =?utf-8?B?WWVmUTlMOWVpM0JJZUdJM0FRN0IrVXBGUys5N1g1ckUvRUQ1bVRFd1VFeUJs?=
 =?utf-8?B?dEtCRFJ3ejBRZ3dpZWY2Q1RxNkI4YjJ3MjdwWE1ldUdTbFd6a2ZwZ1YyUld0?=
 =?utf-8?B?UlZSVXJyZXV2bFhCOVE3NmZweG1zSlc5Sk5yRDlYZU42RlNqNW5IWXBWWnBF?=
 =?utf-8?B?UXgvaWJ2ZkNxM254M1B0cFJOUk94U2lCTUJDWkNLUzNXRHNjU3JLZ2kvTGdR?=
 =?utf-8?B?Ly9LRC9YVkhPeWgyRU1JYUVUbVRyaHZSUEdsejk5UU94Qi9wY05OVXVPN3d6?=
 =?utf-8?B?V3VrVWRYR2lUKzIxb2F4cC9rQ3E0a1FsVzQ0cGhBbGlCUzB6ZUEvZ3JpZmE5?=
 =?utf-8?B?K3VDZExsOExoaW1DTmF4RVdxaWs0ZktLVlpZeDVCdmRzdzBnS2dmRFVVK3ND?=
 =?utf-8?B?RHVCZ0pLSjUwY042QzFESnplbWdMOVhRcXFOV0F3THg5SmEvcTJxNzBPVkVm?=
 =?utf-8?B?K0VpdVBRZWlPOGxZNVRwTFdDa2FoTksrSGxMdmxENlNXTXpUT0ZkKzZRR1dj?=
 =?utf-8?B?L3d4TUszR1lSTnExcnplMUk2U1Nwa20wWlFrTmFqTnJMbWwwR0l0V1pEdzRW?=
 =?utf-8?B?NjU2dkUrOTZnclZteFRFVVRHQ0hNdUhORzkyZGdLWkorSDBrN2hQdWduMkYy?=
 =?utf-8?B?SGZYVm9TQWlva3RWL0RxZFgwNVhnNTlEbTFVQ3JEaTNjSlFnV3RnWXh1dWsz?=
 =?utf-8?B?UEg5MnZCOU5LanVMcGVrNU5HdkphUDR0LzNkeGdIVUI0NjZxa1NHTEh1N3Rj?=
 =?utf-8?B?ZElpSlUrb25HUFBhbE5PZ0NzbVJOOWdtMU5YK2lCd0pHT25FYThCdWRacVVN?=
 =?utf-8?B?NWFrSGxtM0xLRGhSTHpLVFAyOTd4NTRsUmExYWZwbVphU2tmVlZIQXhPb3Ni?=
 =?utf-8?B?YXJvbUJTbmd4ZC84MitKbDVqWDF1Nk5KVnhtRjBPNjcwRnRaZkFXMlFZc2ZL?=
 =?utf-8?Q?KAxsTiMQCuNH31nz/IJXcHB7F2CBOhB2D5HAhcwHin9E5?=
X-MS-Exchange-AntiSpam-MessageData-1: Pk6Jx3/5hW7rzjUbfiMzymCM0jJLp+3CNGs=
X-Exchange-RoutingPolicyChecked: 
	CBSAixctJo5w6aBmWteHe/c9fxo/v35x0LsSVilqMkC5AxkWn3zgWKgH53KZZ3UEE8UwMwgvSpzP8ZGVMQLrpQ2JYbgrUsLE/Vk3FCZlsFCMw3tA8YNKKcQn01mYPj78Em+dD3R9w7O6vZNTKTHrl4vOuLxcxtTzpXe7ydmkWGqN40QyomOMmylNASF53tG5n8/4ubwA3lnBxdthQeMZe2c+rO3n+WwUMJANywmdcYF63YY8UpIIvFDLdsp02ge19v1USqxVRq+L/hWvhLWM0VFni86V7zh6YI6epTmkTVQakr8dUFLIYT5qlEOMcA1PEDy1k9ClbJmjvRvlfaAhBQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f9dddd9-7dc4-48e4-0d65-08de7de7b481
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 14:25:25.5886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e7wBibyXIXiiGlhhVV/DSd4fDbdrPkcsXZFU2ptOLrTXuJX/KfP9ininbakBjT5RN/wwSNDPHM+LxLep7U7RjlAht5a4JDwr/ZNQQ40a5uk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4746
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: P0RC5rTKQzzdwV9iP2qdt8Ebws4BEuSi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEzMSBTYWx0ZWRfX/z6tTCmTBAix
 0AZxKTkuQucFp8f7LPr3AKPhX2/BngQ450ovbafR7/ZCCtphCkWYMiGPOkrlQ3CCY53kcz0ExKl
 KsKn+ojAHB3GnGNgy1TmiHhDw7xiXTBJF9fn19VNK1KQkqm/dG5wzk5FH4mnfhUvRaEfOL3guQC
 mDjWBx0rPX9RyqUQ+KF80C7KtAWX/6C9i7piMNrMweMWNAhicXkqCrFGdGyvNuMoT2eeND4RoWd
 K7tWagJJF9yq905og75/vyzJqXUTyqPE+yJrUrVk+tzQaxTsQNfxr1Nosf+S9oZ71CEBaQi9Eo8
 bOzogi5ferZNInCGuUPNAfyjY149ZzVBso+rdwd7io3fzpM3+CvZOL4LId4ijbIAUoOkkP8eq5x
 rqi/xSqBvDO9MgRv+m1+dCWGDx/xPaYcjm9iFCBaqO3iqrPTjCEyiOhUFLEwJ+NoVU/26X+2XjF
 Q0ylJE2IIEp4vPWPXOw==
X-Proofpoint-GUID: IvDzbtc5Fi8h356n1U-1e3TBmisbyY6_
X-Authority-Analysis: v=2.4 cv=QppTHFyd c=1 sm=1 tr=0 ts=69aed858 cx=c_pps
 a=Fmy/MLZGwmeCELFTjYB8og==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=mDV3o1hIAAAA:8 a=iGHA9ds3AAAA:8 a=1NWNoF9oAAAA:8 a=P-IC7800AAAA:8
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=AgygO7kppe_9izNMuN8A:9 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=97APRTa-CG6DvPMFVxHL:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 impostorscore=0 adultscore=0 clxscore=1011 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090131
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 14:25:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232723


On 3/8/26 23:55, Mathieu Dubois-Briand wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Fri Mar 6, 2026 at 10:29 AM CET, Peng (Paul) (CN) via lists.openembedded.org Zhang wrote:
>> From: Zhang Peng <peng.zhang1.cn@windriver.com>
>>
>> Upgrade to latest revision of 1.24.0.
>> - Drop patches included in this release.
>> - Add patch to fix test-groff not found in cross-compilation.
>> - COPYING, LICENSES: Refresh GPLv3 text.
>>
>> Release Note:[https://lists.gnu.org/r/groff/2026-02/msg00149.html]
>>
>> Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
>> ---
> Hi,
>
> Thanks for the upgrade.
>
> It looks like the reproducibility is failing on groff:
>
>    File "/srv/pokybuild/yocto-worker/reproducible/build/layers/openembedded-core/meta/lib/oeqa/selftest/cases/reproducible.py", line 407, in test_reproducible_builds
>      self.fail('\n'.join(fails))
> AssertionError: The following deb packages are different and not in exclusion list:
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/deb/./x86-64-v3/groff-doc_1.24.0-r0_amd64.deb
> The following ipk packages are different and not in exclusion list:
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/ipk/./x86-64-v3/groff-doc_1.24.0-r0_x86-64-v3.ipk
> The following rpm packages are different and not in exclusion list:
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/rpm/./x86_64_v3/groff-doc-1.24.0-r0.x86_64_v3.rpm
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3541
>
> Diffoscope output can be found here:
> https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260308-55s2cjsh/packages/diff-html/
>
> At first glance, it seems the issue is the doc pdf which is not stable.
>
> Can you have a look at it?

Found that src/devices/gropdf/gropdf.pl uses rand() without seeding from 
SOURCE_DATE_EPOCH. Will add a patch to fix this in v2.

//peng

>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

