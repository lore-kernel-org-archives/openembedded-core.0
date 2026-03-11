Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D95BFCC9AA
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 05:17:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14193.1773206254649717627
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 22:17:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=A+OFkrL4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7530fe02e0=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B1p93F2435337
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 22:17:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=aRGe/V1xB6W7DTCW4Z7FyldIp8Ht04H6BpAOYsqx6k8=; b=
	A+OFkrL4UoliQEaE0icUrJyuZzIpvk+SKrgJBVUZNuAnpHNeBuN4w01BQ/SYy9WB
	fEf1YfiP1o6UTNJd+5tDJW19j6irzNY7g5kyaXAuHXJzMqsvCoR1Cd7OscH8faic
	Fg+J+Dyw6GGhEqu+5i/+IyO4raU5yq3HMGI+qknhdIyQAQgtpyxHjTIUI+tDBhlu
	jDQ3vOPqRltd6JC75MNOkKDqI7q6x5rIGjUYD+rjODUo1faCa6WOOt+Mle0Rlb83
	THCrlEt+C0sOKK+OPD5cjHB+6Pm9CjX6KFSZIxeMtPjFZT/w5eg2NIurvZtzOSPF
	vefCU1Xi/MWiXfdSHlHSCA==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012009.outbound.protection.outlook.com [40.107.209.9])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cty3j058n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Mar 2026 22:17:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bodJxKpELMHGxmwxnJQnqsc/7DRmw00eDwFpMdkKu8ou/HWrtBCCux0L+tK+jY2OhKvb8bY49DHOPpr1axIt1GybfuWEej2S1TnDP6wiRKWEFK55XY758Mhi0N/ioW9Ns5y5vsSa6xmkZfSg0iHYZB72fBPiwPN7lkREUBIptE/4HbVPsWseGgkNc5xP3AU9rV4jXH4EV+clFLztecDwB94H2cKTfRw9uH1NlIESJeahAO2CgfAWNG9OjArOIFE3vvtWneMp3fBZPGBxGQWaJT/Xrss2dQHnO6fWgSP6Z/+7WBSK0EdoyRzdelUVjMyj0yflSAWC0avPPsSqyGSpww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aRGe/V1xB6W7DTCW4Z7FyldIp8Ht04H6BpAOYsqx6k8=;
 b=iBOh0qjGotwCsqmUiqo5gTGGDh8a0jCKyVp2cx5+SwDpWjkdRSge2XQ1NNgl3wQcSXqHuyCp/0jPOKl4lQ+oWkPoemEol4Z5x0EJYkLtNOSSHrE6d64z27IUzbXlQPXwuW29AAUi75+KnpeGuGnOEd/IiPPzBIj20Sjii4GBy1dfTNr/cXB0B2bgT55H/2xOX4sjgeNeR8/fzdxSCdYmtSwf6dhhObNwmW3nVf4yepMXfP+3AV9VnWyaOjq8+1/H1L2n/HQrn3Z0JhUAvx2y5IUJ7cbrLCbtSXLwm+2feFNE/mk2SkYS62i0crfq+p2BaLG09QvJD9v0RUEx9pWL2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by CH3PR11MB7298.namprd11.prod.outlook.com (2603:10b6:610:14c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.13; Wed, 11 Mar
 2026 05:17:31 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::f908:c07a:c64d:67a3]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::f908:c07a:c64d:67a3%6]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 05:17:31 +0000
Message-ID: <98cccb05-390e-4362-899c-8eace203e970@windriver.com>
Date: Wed, 11 Mar 2026 13:17:26 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/3] m4: upgrade to 1.4.21
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20260305180333.306176-1-martin.jansa@gmail.com>
 <f9600ac4-c65f-4cf3-8b50-7c6e90563538@windriver.com>
 <CA+chaQcR9wFdqBCq0GP580-CcfakqM06gadzb=d6m0EseC75qA@mail.gmail.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <CA+chaQcR9wFdqBCq0GP580-CcfakqM06gadzb=d6m0EseC75qA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SEWP216CA0109.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bb::18) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|CH3PR11MB7298:EE_
X-MS-Office365-Filtering-Correlation-Id: e074f559-e954-478d-7e54-08de7f2d7f1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|7053199007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	WPF3CX2u6+pymg4/JnmNDyTwc4NtvOKBNphEzLx2+9+jhJt5quHVxpwzUJKXWl0LKZyG46PXPsiTpEsWqtqpTBHVrgzT0UvpVTG8+67wN5VE0+/hpJ51hyF808LBjjv2HVTNcJ7xK4BfZ7+ov9/dvPWtDb06LpkXSbwMa062j2nUNiTuTMziDEYKj4H+6hX9rXEp8qk0/VfujN67zB9YaSUETcIHlpawIEsTillzzx/H236H9gQmDyTcKuFSgmLRS05B498Ud8w7WfYQykAIvSw4k4UVFHqoI9dTloN9O3/BOZ6z/++drUVpLIj2WbATdGUwXQFLHIUgSHQ025ALM9TA0h19zcaPZHqjrgUwFdn5rPI/xW8t3btUM6pqRmoKFMMH7PmfOAp5dqNtEhQdOf2pCgCzPc00FfJw+2pbu+7PqEH1+riv5qr5RQVnKa6gRD/tt5a3zY9W/vYKZ4KCPf6gSzAM4hkKgPHUFC543SlaSKw2hYj4ekZP7heszEjwJ2IR9Nup+6cdbhgx8Dg6Ikc51Ir/myRnUaaXybRCora1vd+R+ENzWtG0u1rmRhfPQ0/HuC/6v03yc2BsQh3dpDXFhQifaVLV5/oXlou5q9FW00X8G3YagdCvtBz4jIpt+SyVV27l7y9sg31EjfBivHGr15odwyL3B0UHRnberdve0HwSQEYTL4oAtBsN/KIE
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WmNBQzdseklXVFVZMzRJMnFNWVo3UFExVlJtR0RPQWlWZFRXbnpVWnQrSHdY?=
 =?utf-8?B?cm1mam9FNTdMVFZ5Y2xyblB6WUQ1bFM3aVhFVzhQakxKbG5YaUt0d1paeHFY?=
 =?utf-8?B?WDNpRXdGNVVNWUNUd3Q4b2kxMnFDVnlscXVKTnlaanJtMFBiLzJOcDF1OW1V?=
 =?utf-8?B?a1NLMUswdjVEVzFTYXJwOWtOOWZ4bENGamNqT0pnZHJYUnpZckdZOEMvb29M?=
 =?utf-8?B?dTBvYkszenB0Ym1CWU1Yb0dhNjBYRi9RempuckdobkZTUnFwT0h1OHpBd3Vs?=
 =?utf-8?B?YzJRZUxnTXphaTlPUTJEajlMVUErSlFEbU9kOEdxKzd0ZG9XWWRMUnk2SEJ0?=
 =?utf-8?B?L2xGNGVOZ1RYYlcvT3hoT0lCL1lwWTMwVGkwdnFYajBCa2xWVFJvWExPZ2w3?=
 =?utf-8?B?RkJ6cENBUzhQd2J4VWNUSlNEZ1BXMFJweklGSGdaTnBxaUhBR21pN0M2ZitV?=
 =?utf-8?B?YkhES2JWeUlUdTNXdktjWFRvVWpPeXpMVFBWZTJ4VENYVEMvYUlLRkp5ancv?=
 =?utf-8?B?V3U5S21DUzNLV1BkVzg3ZFRxU3JJWWZyTW90Z3FTS0krSWJqRTcrdzcrZU1h?=
 =?utf-8?B?eVRBb3U4L2pZbjhzR3QzRi91NmhWekprdkpRcHlyeTlqdjRmbjBiclpjaDc1?=
 =?utf-8?B?Z0dBRFYwSFc4emF4b0FGSW9Lb3hGSldZUE05Vjh4dTdTMjdvMDI4S1JDWmhH?=
 =?utf-8?B?Zk9kK3RQYkdGU3d1L3QvcTVTMmpIbEhUaStjUk1ybVRqRXhWbGZkSHhqa0Z5?=
 =?utf-8?B?TEs2ZTFVMGUzdEhRK3lUMHQ2ODhqRzY0czFPUGNIbE9EYmVUYUh3WFo5bFBH?=
 =?utf-8?B?YmJ0c0x4bTNMSTRJdnVFQy9RdXFHODNFR2ZwM3dvQ1BjbEZHZmwwUmVrYUpt?=
 =?utf-8?B?NzZWNGJaTDg1eit0bmZYblZEOUU0V01qM1hSeEI4enZ1dGRuaW9NemM0bjFT?=
 =?utf-8?B?ZmtOU1VUTkV6aHk3VEFjQ1oxMStBNmk2TW4reVp6RzBEZ1RtYytYeFQ5a0pR?=
 =?utf-8?B?Vnp5ZENhcFdWcTgyK0hMWFYyTjhDa1oxM1VjM05zN3RFZFFVSmV2T1ZVVEVQ?=
 =?utf-8?B?SFdWNUlMSEpyamNUdy9DT1NwaWdmajhGdGR5SWhQNm1GWDFMSnFYZ0dscEZ1?=
 =?utf-8?B?WTJkL000dnhQazVibEphZUl1T3QwR0ZxMlhWNTYwSktGL2g2MWRJbUdIMlA0?=
 =?utf-8?B?eEl4VEIvMngzTk5sZENjc202RFZJY0FabmcrcnA3YXBGSFdWMHFPaktxQjRX?=
 =?utf-8?B?L1E4R2lLZUJ3NndHWmplNnZxZUZtV2dDUFZrMzdKY0wxaFI5RW5iaVY4Tyt4?=
 =?utf-8?B?T1F6aHFVTkNXeDhvWFROYlcrQW1keVFvZW9xSHJBdi9VOVZNSWcyaWRvcy9H?=
 =?utf-8?B?RDF4eGhrRkF1SmFNWVE3djllV01ld1kzRGc3V1BEYmw4WUN4WG9YTGlGSll3?=
 =?utf-8?B?OW1WU0FMYUx0TUxEakFheEdEN0hlM3lEdEk2YjJWSHJDK3pUUnZ2WDRvR0Nx?=
 =?utf-8?B?OTNlODZtQy9GZDVwWmhzT244aVdJWU5RQ0luYUlsSHNSL2Y4YlpWQW1namkw?=
 =?utf-8?B?QzJzM2N6cjVVWGlicTEyMVZJTkVyRE9nK3JxY0QzSDQzak9hWjJ4aXk0Uktt?=
 =?utf-8?B?eWNFMkROQjI2b1k2RXhlWW5QSm9mSGpYdjBaTW9LU2UzaWhXTWZRZzlZOENq?=
 =?utf-8?B?S0lwSUxmdW5tZmJZanUxRTF3S2Y5VjRONzdON0hmN3lkRkFmMHVCVEpTODF1?=
 =?utf-8?B?N3NjRmJZQVRnS3FLeFUwUm5xZmthVXdld2E5OGg1RDJwbjZIRUozVXUwM0hv?=
 =?utf-8?B?YkJLVlU2TFd6ODVhcjMrcEx0d0FvZUJ4b1QzOWM0Q2ZWdHY1VnkxR2ZRU1Zp?=
 =?utf-8?B?U000dmN2WWpiSjVRNEZLbnhabkovYXJSS25kSG4rbFJKYmliZUJnVFBsRGtm?=
 =?utf-8?B?cFBGeU11MkllTzBJdXgzTUFGQ2wwTkx3SGNIWnlPekJoWVQ1QmJ2RlpiTUxk?=
 =?utf-8?B?TmFRVVJwNFVMMVhNRGEvUEZrNlczNDFTQWhsaGJ1RUhzajVlODVVL1o2Ym1O?=
 =?utf-8?B?MzRiMFZlL3d0ZnVrbEFVT2hoYUE5VGJWVC9YYWlJdUEyZ1FkejZ2d3Jwdk5Y?=
 =?utf-8?B?blAwbW9oUGVuRzd6ZnV3ZmZEM29sVytMMFExeDJBNmFyNkpBazlKRTFlS09v?=
 =?utf-8?B?RVk3U21RbTA3VkR5SFI2SDdoT3dHdDFYQjAyVlVrMHVmaTJuUHVKVVZYNklZ?=
 =?utf-8?B?RDFoY01YdkZ1amI3bXRvaWoyYmhYa091MjlPL1o4eXBlMHdFOWlTS3FMMTVz?=
 =?utf-8?B?RUI0U0duVVgzai9nZ0hnVGF1SHVzWXNTTGJYMUlycERwNEZERVJjYTJGNFcy?=
 =?utf-8?Q?sYYe03IQACEHcjhY=3D?=
X-Exchange-RoutingPolicyChecked: 
	Kti3xWqmubTHCjBeGjavRdFRHAl/gnPIpv1l/Hptaa4arTGINkE/UdTcrRalodUYwiek2LDy6Mt4WlZ7q+lXiC5oLIopqfPNw6+kYIf8vYDZFvHpdUiR2f0D+lKWyk0oK5CDpbafmlFVtSzeV/A4zxIratsykf7pPj1LNkvMocKBvzd10sdLwmD9BAYk1g/K+P5hXLtzB9fJd/EgcWFgcLl1Yz8RE18Qm9XLk2BYqyoADgu78pOHtnLcLsqnkbmbC0zv67GxIqpysoSFV/tc7eoyib/BETtQUKAUX6Wjo4dNBHUnJb6VinkpFTty5G10GlIChPsBBkDj7fb+qii72A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e074f559-e954-478d-7e54-08de7f2d7f1a
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 05:17:31.7298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sAxgljSrOD2UzOX+4OzZRglLVNleCVNVSAffV09Pzk+SGvoi9cO5fI0yi72MN0bovi679yuMYhQr4jlITN2CCf4+rTHmW5FdLIT2AXWXpy8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7298
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: MHU9g6n5G3v6v7wD3w4mOgRCGN27KAr8
X-Proofpoint-ORIG-GUID: vaJkBVJTVnNJA4l7Q0N7wL9ozU_KCzkn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA0MiBTYWx0ZWRfX+AxM+AjcK2Je
 lDc7LpSjRKLejskvvG5CMA785avpHK1kUP0xiJ4aUt80jbP1RPRHPKne4Rim1p1h8gilMpv/7LR
 5XnBbqSrQajH1VNfzeneOa1ybHNyObRFVreK9qo/EyLJOvhzcP0EYr+GuU7ODGBVS4HuVD1OD+i
 59Xd2znxKE7ab2euiI+shOgEcH2834iAkVoaemDprveJMOu2Dhdw116ThXhWacIL+oPunp7Ekf8
 Xxrwdk9lioPHuS0ZOCbzAM4cZVh3WKqVfkDi9NZpcmpL/17vnJpISNXo+BgmJeSBtfaAVtPt/I2
 IhdGucDl5UCotovXEcCFDrfpNFWAdFNAQvlU5rV5QxT4fv8rITxP2lVSJA/vhucTLz6LZF3tbFV
 FeB+Bu90EQzctNTZiSwP5E0BtqPr/SJwcn2IQQwlzUd9+FoiHK3zQ0dNdvd7+bt4bJY7IULob39
 W72cMaF0SrZZvi2GjbQ==
X-Authority-Analysis: v=2.4 cv=Qr1THFyd c=1 sm=1 tr=0 ts=69b0faee cx=c_pps
 a=NtQEcg4T3rGzBSLVY3gzHQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8
 a=f_dgcQxTrbF9m5rx028A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110042
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62B1p93F2435337
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 05:17:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232836

Hi Martin,

On 3/8/26 20:14, Martin Jansa wrote:
> On Sat, Mar 7, 2026 at 4:00=E2=80=AFPM Robert Yang <liezhi.yang@windriv=
er.com> wrote:
>>
>> Hi Martin,
>=20
> Hi Robert,
>=20
>=20
>> On 3/6/26 02:03, Martin Jansa via lists.openembedded.org wrote:
>>> From: Martin Jansa <martin.jansa@gmail.com>
>>>
>>> https://lists.gnu.org/archive/html/m4-announce/2026-02/msg00000.html
>>> This release is being made mainly to cater to recent glibc changes in
>>> light of the C23 language standard.  However, it also includes fixes
>>> for some corner-case bugs in eval and when using the defn macro on
>>> builtins.
>>>
>>> Fixes m4-native builds on hosts with glibc-2.43 like:
>>> ./stdlib.h:827:20: error: expected identifier or '(' before '_Generic=
'
>>> ./string.h:777:20: error: expected identifier or '(' before '_Generic=
'
>>>
>>> Remove 0001-gettext-h-Avoid-gcc-Wformat-security-warnings-with-d.patc=
h
>>> which is included in gnulib revision used by m4 since:
>>> https://gitweb.git.savannah.gnu.org/gitweb/?p=3Dm4.git;a=3Dcommit;h=3D=
beee8d26382460010338c37f9dd9f823aa9f4ee8
>>>
>>> LIC_FILES_CHKSUM was updated for barem4.m4 and testbarem4.m4 from:
>>> https://gitweb.git.savannah.gnu.org/gitweb/?p=3Dm4.git;a=3Dblobdiff;f=
=3Dexamples/COPYING;h=3De623b2b9394cbd1784a4964bbac105050296f33b;hp=3D7e7=
3a1219b542fa035facc47cdb3dd81132e6373;hb=3D900a90f624cee4a8c1c02c4d6a61ef=
1ed26a17d1;hpb=3Dc7b96d682958532c4eb2d5c2d81bb6ac342fd410
>>>
>>> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
>>> ---
>>>    .../m4/{m4-1.4.20.inc =3D> m4-1.4.21.inc}       |   5 +-
>>>    ...4-native_1.4.20.bb =3D> m4-native_1.4.21.bb} |   0
>>>    ...gcc-Wformat-security-warnings-with-d.patch | 133 --------------=
----
>>>    .../m4/{m4_1.4.20.bb =3D> m4_1.4.21.bb}         |   0
>>>    4 files changed, 2 insertions(+), 136 deletions(-)
>>>    rename meta/recipes-devtools/m4/{m4-1.4.20.inc =3D> m4-1.4.21.inc}=
 (90%)
>>>    rename meta/recipes-devtools/m4/{m4-native_1.4.20.bb =3D> m4-nativ=
e_1.4.21.bb} (100%)
>>>    delete mode 100644 meta/recipes-devtools/m4/m4/0001-gettext-h-Avoi=
d-gcc-Wformat-security-warnings-with-d.patch
>>>    rename meta/recipes-devtools/m4/{m4_1.4.20.bb =3D> m4_1.4.21.bb} (=
100%)
>>>
>>> diff --git a/meta/recipes-devtools/m4/m4-1.4.20.inc b/meta/recipes-de=
vtools/m4/m4-1.4.21.inc
>>> similarity index 90%
>>> rename from meta/recipes-devtools/m4/m4-1.4.20.inc
>>> rename to meta/recipes-devtools/m4/m4-1.4.21.inc
>>> index 5c4ba09288..ce9fe2be8e 100644
>>> --- a/meta/recipes-devtools/m4/m4-1.4.20.inc
>>> +++ b/meta/recipes-devtools/m4/m4-1.4.21.inc
>>> @@ -7,19 +7,18 @@ GNU M4 also has built-in functions for including fi=
les, running shell commands,
>>>    inherit autotools texinfo ptest gettext
>>>
>>>    SRC_URI =3D "${GNU_MIRROR}/m4/m4-${PV}.tar.gz \
>>> -           file://0001-gettext-h-Avoid-gcc-Wformat-security-warnings=
-with-d.patch \
>>>               "
>>>    SRC_URI:append:class-target =3D " file://run-ptest \
>>>                                    file://0001-test-c32ispunct-Check-=
for-musl-along-with-glibc.patch \
>>>                                    file://serial-tests-config.patch \
>>>                                  "
>>>
>>> -SRC_URI[sha256sum] =3D "6ac4fc31ce440debe63987c2ebbf9d7b6634e67a7c32=
79257dc7361de8bdb3ef"
>>> +SRC_URI[sha256sum] =3D "38ae59f7a30bf9c108193cc5c25fbb06014f21e230c7=
ede2eff614f7b7c37ed8"
>>>
>>>    LICENSE =3D "GPL-3.0-only"
>>>
>>>    LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237af26da5dc08=
a4e440464\
>>> -                 file://examples/COPYING;md5=3D4031593b2166d6c47cae2=
82d944a7ede"
>>> +                 file://examples/COPYING;md5=3D005f2e201a0526c1d1d79=
dd6303ecf23"
>>
>> There are new license in the example files barem4.m4 and testbarem4.m4=
, it just
>> says "This program is distributed under a Creative Commons Share-alike=
 license",
>> but not version is specified, I guess we should use CC-BY-SA-4.0.
>=20
> Is there an option to install the examples? I've checked the build and
> image directories and the examples aren't built nor installed.

Sorry, I didn't know that either. I found this issue during update m4, th=
anks
for working on it.

// Robert




