Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE8E6C369DC
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 04:45:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.890.1746593107048249374
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 May 2025 21:45:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=72226897d0=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54660iER031293
	for <openembedded-core@lists.openembedded.org>; Tue, 6 May 2025 21:45:06 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46dee3bwcp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 21:45:06 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5474hvXm021729
	for <openembedded-core@lists.openembedded.org>; Tue, 6 May 2025 21:45:05 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46dee3bwcn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 21:45:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dd7bidgtW9Ei+2AxexxrpNp6O2PCQtl1ujiPeglKyhTZTSJEyMHr5bNZR85QEQsCGhOZN9J2mz4/D3kxjWys0MjwfH8GDyBLg+16RH5x6/mgWOQ6cRkSBPTuPrHA7aWIGtfJRrwyYZY1zAZ6KYsGju2u2B27bdp9B9bKJAOOb0ucOWoZOGVfTF7w4jqQOV54BWWYI+1FBdBU4jr/ZtcSuEmzw128yJyBfiYlHy22AlUHja9FS99Pe2iNYNL39wc+fc2i2m2VAIMAAhXa+1s29K4w5SfPO60NEYFJQp4LpE7hWiZnAzHAlsAU3n2frSvxzJz/id2LYwXGzCE2TTkJEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RRFHj9djWvJE0eJgB1vd6i+xmgk0HbaMLDQH5nS5v1k=;
 b=hGenEGOh0gxU6bG2hHSWljQ1tKFMSdCRR1oJwYvQ7AItBO+iYgKp9+vs6gc7nCc8zBGuRFGvORqAaM/nh3EO+ydzAwfOJP1paViN7JABGrAKCoc4hojJbxUR7qu7VBHdOnroSo8ebsIMQxV1HMwyDWR4hcq6ySPAuYetxQXOEe5RbSlcnD2Dykq4M4hdPnTpZfFkt2ZTAILA4APNxVzsmk/TtssKsc6wWtHdY0ASQ2PN2f2+s5XqlGJjD3eFt6j9vF+MPfwf9RHFlVy2WaFFhqOWdVzD+huInDMutfKcxQiBoio8fmrKWQmmYCEqpKK6aJsjXXY3QvTbtMYMfFAPYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by CY8PR11MB7292.namprd11.prod.outlook.com (2603:10b6:930:9c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 04:45:00 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%7]) with mapi id 15.20.8699.012; Wed, 7 May 2025
 04:44:59 +0000
Message-ID: <9ff4fb9f-9641-4249-9c3b-cda32291d4a1@windriver.com>
Date: Wed, 7 May 2025 12:44:54 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] spdx30: Provide software_packageUrl field in SPDX 3.0
 SBOM
To: Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20250428055717.2358310-1-hongxu.jia@windriver.com>
 <CAJdd5GbEKufqjBgR6q9DYBGBz1_a7pL8ds2cuDu-w7NqOo=0Dw@mail.gmail.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <CAJdd5GbEKufqjBgR6q9DYBGBz1_a7pL8ds2cuDu-w7NqOo=0Dw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TY4P286CA0017.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b0::19) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|CY8PR11MB7292:EE_
X-MS-Office365-Filtering-Correlation-Id: a9c16fdd-b1c4-47d2-f207-08dd8d21ec34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RHQ4KzQ4bWQwSE93bUlybDhNWEJrS3Z1clcxODBKTy9DSzY1UnZodTRLQ0x4?=
 =?utf-8?B?REphV0VXUzREZld3cjVETzRVbjF3cXN5d0d2cGhHdGdrYWlkRjQwUUZob2ZG?=
 =?utf-8?B?N1kySEhKb2FMbmNuQ0hWbDh4MHk1cmNJbWg5WkxsTkpiVTdhQkJLV1lUYXNM?=
 =?utf-8?B?M1crUEhmSytCWXNJM1o4NUNuSFMrTU51YXNWaldpWEhWN2FGNnRkR2x1R3Jo?=
 =?utf-8?B?aGg2cTZrWHdBYWFxMENsZjdFVVR6UnovdmhSTjl5dFpGWlpRN3cvSm1TR1hp?=
 =?utf-8?B?cTgyRmlvYjl2N3ZaTUFGQkRKOVRIOGJnRGsyK1YzWWtQRU5xOTVpbm1TeCtY?=
 =?utf-8?B?b3V1ZzMydHdIUHJDZFdnaUJ4aXhhWEJiZW1MaWl5S05VYnVwRnpDRlIwRnFK?=
 =?utf-8?B?MCtuR0pneWpjSXBESlZXSUQ1WmVDWnBQajFpQWFMSEoyQnQ3UFkwUEg5aUMw?=
 =?utf-8?B?V0lta204bXVZME1zZXBCTDZFLzNsSjdIc1kyVzhBcHhHQTNCeGprWUhQMjV1?=
 =?utf-8?B?WGRsUVBWTkhYZlJXRHdiYjlDM0ZLM0tWUWhybkxGSlI2aE8zazJkcFp5TVhz?=
 =?utf-8?B?bzJzcUtibnhDQWF4cmFhcElvNDUrNDZGMzQySDQ1ZFgrSms3eGJEeEx5WHZS?=
 =?utf-8?B?TTZldDNiYTRqRGxCTFhDemI0K2dmcWs1YWNOcW9MMmVwc2l2cGpIb1VWaWx5?=
 =?utf-8?B?QWJXZXVicHd2RW5XWnVlT1ZmM1V6MWdqU2JZb2EvdXgrbUVBVE1SZlAyOHp3?=
 =?utf-8?B?YW91eFpmMWxoV0RYQTdER0hJVGRMdWVSb0gwTHlJQ0VMRFRDUnhoemRlMWNL?=
 =?utf-8?B?T3VmdThBN1EzTW9meWhwV1kxQ0JsRzB6MGF0eUdUeEMrT1ZXODFYcDYwTWYz?=
 =?utf-8?B?ZUl1YnRSVk4vSTNaSUc4ZUoyQWlqWkFKQWYxemxFTG1iR0x2U1VTMmM1QWZu?=
 =?utf-8?B?Q2doUTF1c3pIMmRMQlBuMlczNTFGZkZCZ25zdXQwKzRNL1RPNC9vdklVOG9n?=
 =?utf-8?B?OEI2RFBYSy9LWlRIV01tQkdkZEVoOFRqbHB3YlhJaFR5S29VcDVvUFg3RXpM?=
 =?utf-8?B?Q2MvMVcvYzM3c05SV3VpVlJhdEk2STZtQ2RIS1JjR2pPcVFTYjlWcEFSU21V?=
 =?utf-8?B?NXcxNis0eThONHRFd0UyK0k4WTdGNmdTUlpGVC9xY1dlOWtPdzZGeTFhSCth?=
 =?utf-8?B?L2MvVk1GdXh2U01Ndy9NU0VwaDZGM1ZxR3FhQU82b3BodHBiSnUzbjU2U0sz?=
 =?utf-8?B?MDVGRzdwWkJRL2VxNStTajZCamFWMDZCYlp2d04zOE1ELzBKRWFvRFZqNHpY?=
 =?utf-8?B?cHoxSGVsa29yRFRDTGljN2JoaE5tOW9vV096ZFZISWUwSXRkd0FQMnBXdWht?=
 =?utf-8?B?MDN2emFTeVloNWc3aThpYUJTMHpzZkRacE5tc1BxRGpUTDZhSjdGYXlKRVR4?=
 =?utf-8?B?ZUhYeEVrS1k3STdSY0h3dTBJSmZTaWlsVVBzYUluQy9TR3VEUWlveUhXRWlm?=
 =?utf-8?B?SHR1eGlkOGtOL0QwZTFFTkhTK3dEVStrQnA2QURuTlNNZ2orcGtjOHV5YlFm?=
 =?utf-8?B?YW5FcWNlQTNEMlRMMHlTdWhRT3lMTjUzWU1LbGR1SGE0anBQR2Z0QkkrblVh?=
 =?utf-8?B?T2k1MVgwcWJuU3RQVzZtYSswYTdsbzNER01HNzYyU1VxVGU3eGd0YTZuL2pu?=
 =?utf-8?B?S3lMd2R4R1hJY2NSeHBIWjh3T1VQSkNlTHNNYjZoWWJHZllWelRsL2g1VGFm?=
 =?utf-8?B?QVZobVlUMWRBQktodG5xQk9WQklaSWMrWWZSUnJmS00rVS9qQkFXVnd1OEdB?=
 =?utf-8?B?UEFHSjNSRjZxc21sSWxOS1MrUmZuaDhzd3Rtc3AycTJQQUFqNHBOYUxUaHk5?=
 =?utf-8?Q?xBCBTiidTHW+X?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QU15VC94UkxpNUhKM1h3Ulp6YzdiR3dyYWRTQmptREpiMDVGNFZ2QTRBdGM1?=
 =?utf-8?B?b05QY3dxb09vZFdjeFloQXRBUmkxdkY1Y2w1VGo0Q0hjUkNud0wxQkZyMmVJ?=
 =?utf-8?B?MFFmQlVkd3BzcEJmbVBka2pSdy8vWFN4N2ZDSEkzWmw1SnhnRVdvVk5wVFhj?=
 =?utf-8?B?cXNVeFFUWWlCT1B6NXdYa05taTM4dWRQZkIzekNUMTBIK0s2YWdjTURPS1VY?=
 =?utf-8?B?dEc2YWZhcGJKV09TSWVveHBwQmErbFhDc1V5SUdzUGdqWWJFa1JXdkRWQTBz?=
 =?utf-8?B?K1ZQYVhzbFBmRi9Da2FpV0puL0pUUjNrS1pYZ0FWaTgzeXlsUU85eWI0R3R4?=
 =?utf-8?B?OTNQemlETDJzWEpjdjJndmNrNnJ5WVc3aGhvOHZITEtLUEI2VUxuNWtZcXhV?=
 =?utf-8?B?SFR0Y1ZtSTBlZGU0SklQVTZHNUR4THlxNGd1dkQzSkw5OTRDMWxOSEVxL0pa?=
 =?utf-8?B?Rk9mMDM3RXd3Q05iMkZHNFJDSlZQUC9QWUtSMkpYbzI5UXk1TFA2UDBtdmJB?=
 =?utf-8?B?UWhxVFBqMERySzcwaXFkeDhCWVVpQklpaXFqWmdjNGhBelY5L2R4MGsrR2cx?=
 =?utf-8?B?ejh6aUhXU3lZeEFqU1R4NjlmV1JGd00zV0E5V1NaVFBpdm1hSnBEcTBiYTVs?=
 =?utf-8?B?TFJ5TXA5NHQrUTdxdHgrdHpaNFBaL3hjaklmOG9aaEd0Tno1WFFnNVNCL1Uy?=
 =?utf-8?B?Sk1DbFJNUnhneUlKZUJIVzRzR0RqRVpUT1NwRkdJaDFVZUgvR1hQRWorL2lz?=
 =?utf-8?B?RC93cmt1YnZVZXJOaUdQRng4cmJvTXFnK2lCeUQ0UThjSWthNlg5MEdIMDRo?=
 =?utf-8?B?dlZJc2Y3NE1tQ2gxZEh1WDF4Y0RIcXhhVmxhRThmRXVFY2ttbEdXSkNrMmd1?=
 =?utf-8?B?bmQ2NjdVam1mdFVFd3lUQno3eDd4bkwvbkdkQlpZZnoyOVF6bGkwWHJiNE8z?=
 =?utf-8?B?cTI5b3VsTWI1bStTbTgxMVZlVVptOHl4OXpIVWVlSFhFaE9QRTRISjAxNVox?=
 =?utf-8?B?bXdmamJHYXNMMFA4elpXOUxyTmJIU0JzY2o4cVJyVXk3S2NKWGJMNHR3MTYw?=
 =?utf-8?B?NlpjdElIR3UrTHJmYUJLTUtsRm1QTlJOVWZVOWxyOVUxY2pJVldOcFk4YUpr?=
 =?utf-8?B?UUhHSndzbHNmRTFHcGc4QXg0NlNxY2JyZnM0bkp6S1RYV2wvSmFqTkJPdVl4?=
 =?utf-8?B?cUZFQllkMG9CeFJxd25kc0FudGRQWHdyR1VoYWsvMEt2T1c0STJneS9mU2VE?=
 =?utf-8?B?VnpuVG5ISEdvRjAyODlOYjVRR0daRXVkbGYxOWlrK1VoSldLeFlqR0JuMmpl?=
 =?utf-8?B?cmQ4dE4rbjB6SnhHODZ1L0RSNkZES1NaQ2Q2VnoyenFqcGFGOUFTSGE5UlhN?=
 =?utf-8?B?YlByaGIwQjQvT1B4ZmYwTjRXcHF6Qm1XSXJPSWU2MWRoZ01mYllGZjF4RUw2?=
 =?utf-8?B?QkJSNit3MmpzTW5zWXJDNnpKYUl2VWZ2TDJpWTJHQ2E1VGVxdHl2SVN3SjJG?=
 =?utf-8?B?TWtOV1FFUEZlS0w0UDBBTFlMcnZOV2JpWjB6c3lHaFh0U2JJMlNqQW5IN3NL?=
 =?utf-8?B?NkdSd3dmZnczYVN4d21RcFArOHNHOGFnWUxyN0hQMDBnUXNEN29KR1lxR3I3?=
 =?utf-8?B?cDdDY0l0ZWkxYU91NFRSUDRxTnZkWjdkaUF1RHA1a0pDa0NaQ0NjaUNIWHRF?=
 =?utf-8?B?QzRGZ0hWb1VVVTU0U1crRDhVRnVMQTFwcjg3dldudGhHa0o0eXNqc2NBNkp2?=
 =?utf-8?B?NW5zdDhZYytIRlNDeWVlLzRKMkl5Ykt3UEMzWFJyZ2dobjVjSXdjOFhURVdt?=
 =?utf-8?B?cjNRV3ZEbm9BMDJ4WUZXT1dIVGUvZ0JUb2pIcnlJRWNmMGt1UXFpb2FOQU5s?=
 =?utf-8?B?b0QxSEN4WXYxcDhNS0wvS01Td1hsT2ZxOFNPYTk1Mm1mZ1U3YjV3cEdmVGdS?=
 =?utf-8?B?SHYrSnJibzZGa0MvYXhFVG91UzlEQlZKTGNFcktBeXdMcFFVb3Q3eEcwdEdm?=
 =?utf-8?B?VFc5ZUJXOGVQSGxtaFowZ3A3SzFiZVg2dDRvaEJsbGZNcGRlVDdGdW1HMXA0?=
 =?utf-8?B?WHZJN0tMSFJWeHpYWFBNb1JEVmJSeTEvL2UvVVQ4WlpOTGk4cnZlV09EaXdq?=
 =?utf-8?B?elVuWkZYMHdIQ0hST1ZkS2xDVktrb0JWdndadzZRRkd3ZHBsWWpobEsvazdj?=
 =?utf-8?B?c0E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9c16fdd-b1c4-47d2-f207-08dd8d21ec34
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 04:44:59.5861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oQ791kpKKcoUwHFUZ4zpXkAbuwL0moA+bSLvDqmgnKlCFaaaOXljOI5OaqlXGnYgB6hp9gEf7xKId9XwpQ0oYeVswJl/WQc0A3syTPR5VMA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7292
X-Proofpoint-ORIG-GUID: v-r2dUmAkAPLO-f2A8f-poShg-KP5CvO
X-Authority-Analysis: v=2.4 cv=Pd3/hjhd c=1 sm=1 tr=0 ts=681ae552 cx=c_pps a=H8RDR50mQ1szzU+C1Tr1+Q==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=wECf3xPYAAAA:8 a=t7CeM3EgAAAA:8 a=nCUzwVJPguewUgDaVpUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=ccNonjl4-tybilS9-zgM:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: gkjqeYgLKjrac3kl_K72DGtXnD0y72Ku
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA0MSBTYWx0ZWRfX2wbjxkWzddwn txhFo0PQD8UtWnWg/asAzm08kkt1rRbzqI+mCobiKxmOClt3qeAqFqvALSxT9lvcRHVpT/ROPkA gdHDdGmrTThOx6rG5UKAb00uUX36/uchqLZUYTaHXqurM520gwdHXi6OSiMJHspWr2JIuwpax79
 yV8cdWAnwpJT2F9N9yflhYu/TZFiQnoxTw8RpUJPO3YzrIpatj/AEONdNGEBsjswOsQXY3V/jrH yNiSuN2EVUD9v2OS4hfOXUxeXXMs4Ivn86ogCsjhpp9L7uZ6H43UtGKKdwX+5leHcXUsvePgpPH fWYR0j+q4AmwFJyu2b2fJVVrgiWvQjEw2Pnr0aUqUNXDwMSvHz9+ZvPlp0DKH160Hsf9yVNm7PX
 wJ42o0jSfiT8NVA6VMUwo0t0zWV3l40RId7tXiCVsig9KeCfsqlq7w1KctQf1L7u0Q04s4p+
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_01,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 spamscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 mlxlogscore=999 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505070041
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 54660iER031293
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 04:45:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216086

On 5/1/25 23:03, Joshua Watt wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> Mechanically, this change seems fine. However, I do question what you
> are planning on putting into this field?
>
> PURL is pretty well formalized, and AFAICT there isn't really a good
> way to describe what we produce as a PURL. Can you provide some
> context on what you are planning on putting in this field?

We are planning to add rpm types [1] in original [V2 spdx30: Provide=20
software_packageUrl field in SPDX 3.0 SBOM] [2]

[1] https://github.com/package-url/purl-spec/blob/main/PURL-TYPES.rst#rpm

[2]=20
https://lists.openembedded.org/g/openembedded-core/topic/112409837#msg215=
310

//Hongxu

> It might also be helpful to follow this discussion:
> https://github.com/package-url/purl-spec/pull/372
>
> On Sun, Apr 27, 2025 at 11:57=E2=80=AFPM Hongxu Jia <hongxu.jia@windriv=
er.com> wrote:
>> Define var-SPDX_PACKAGE_URL to provide software_packageUrl field [1][2=
]
>> in SPDX 3.0 SBOM, support to override with package name
>> SPDX_PACKAGE_URL:<pkgname>
>>
>> Currently, the format of purl is not defined in Yocto, set empty for n=
ow
>> until we have a comprehensive plan for what Yocto purls look like.
>> But users could customize their own purl by setting var-SPDX_PACKAGE_U=
RL
>>
>> [1] https://spdx.github.io/spdx-spec/v3.0.1/model/Software/Properties/=
packageUrl/
>> [2] https://spdx.github.io/spdx-spec/v3.0.1/annexes/pkg-url-specificat=
ion/
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   meta/classes/create-spdx-3.0.bbclass | 5 +++++
>>   meta/lib/oe/spdx30_tasks.py          | 8 ++++++++
>>   2 files changed, 13 insertions(+)
>>
>> diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/creat=
e-spdx-3.0.bbclass
>> index 044517d9f72..c0a5436ad68 100644
>> --- a/meta/classes/create-spdx-3.0.bbclass
>> +++ b/meta/classes/create-spdx-3.0.bbclass
>> @@ -117,6 +117,11 @@ SPDX_PACKAGE_VERSION ??=3D "${PV}"
>>   SPDX_PACKAGE_VERSION[doc] =3D "The version of a package, software_pa=
ckageVersion \
>>       in software_Package"
>>
>> +SPDX_PACKAGE_URL ??=3D ""
>> +SPDX_PACKAGE_URL[doc] =3D "Provides a place for the SPDX data creator=
 to record \
>> +the package URL string (in accordance with the Package URL specificat=
ion) for \
>> +a software Package."
>> +
>>   IMAGE_CLASSES:append =3D " create-spdx-image-3.0"
>>   SDK_CLASSES +=3D "create-spdx-sdk-3.0"
>>
>> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
>> index ba965821f86..61d7ba45e3e 100644
>> --- a/meta/lib/oe/spdx30_tasks.py
>> +++ b/meta/lib/oe/spdx30_tasks.py
>> @@ -631,6 +631,14 @@ def create_spdx(d):
>>               set_var_field("SUMMARY", spdx_package, "summary", packag=
e=3Dpackage)
>>               set_var_field("DESCRIPTION", spdx_package, "description"=
, package=3Dpackage)
>>
>> +            if d.getVar("SPDX_PACKAGE_URL:%s" % package) or d.getVar(=
"SPDX_PACKAGE_URL"):
>> +                set_var_field(
>> +                    "SPDX_PACKAGE_URL",
>> +                    spdx_package,
>> +                    "software_packageUrl",
>> +                    package=3Dpackage
>> +                )
>> +
>>               pkg_objset.new_scoped_relationship(
>>                   [oe.sbom30.get_element_link_id(build)],
>>                   oe.spdx30.RelationshipType.hasOutput,
>> --
>> 2.34.1
>>


