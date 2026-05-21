Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EEF0CD5BA4
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 10:56:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33891.1779360969556182176
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2026 03:56:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=i4rGmECi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=96019d6c76=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L7oaTa373993
	for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 03:56:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=iqvlFyWVKxXrad8sCWkncqo+8IwO7DE7OEE8roY+0jk=; b=i4rGmECiPxxQ
	1A+0WQ9RbfcZ4wav/re6FCYWCW3rRC86buVXo6MDbHVXxNU8AuaiIRMCb7cuVrp5
	HghbQ/skU66pOHd9DidtMaQ8ysGwlIoqqf3AHk98J5UpqMdHoPHxEzMPaHKPUA9A
	9u/uiBnBZnNMKQXJHA6ShlBORCqPR6366y8Xtbn3QQt2Bxg3SKRhEpwpxiQlHyH5
	bD7yxd8q2s7RCFtg4Ke1oN8d+n/8Csf5DxHZ294gPG7nJXk8jxAqTcYwnWKlnZ/X
	VYcIgSFCyKY1yFE7Pwp1plQ2M6irpA6bcmQhWWUNbecUtMfHd/kgbNAjqQBTXjew
	20KaLNY+lw==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012016.outbound.protection.outlook.com [40.107.200.16])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e9rgj0hnq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 21 May 2026 03:56:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UaOlao6HSQWuufTaQ/BMa/CYf4QHdEYe3mV1d3b2zZcLfxGGILnoIHnReig9GHUkVT6eIvdaJ9MpBnOlgrM+DMdCfsIIfyMK4Mqj1NhfRXmgbu9mrhIeANroIlOGy1EHMzWOAlWXLKU+vN8FOgxoyQt3nYEOCZxE2p6WTK+WzorbSMhtraTsvbYGg+AIEV15lvhjcvM0FBH+Pa/8fBgmeJcMzzys1Z+5VfEbUGSiNJn57i8D5/H/BfjzvHzvs+usldNVqJ9yPzV41taSPFXsSo2lBeIMUo91j/s2UIvjDxhNGEf4IjeCcUafPf+NN5XDCrM/2gX5LaP96MBpyUTwWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iqvlFyWVKxXrad8sCWkncqo+8IwO7DE7OEE8roY+0jk=;
 b=dlAKWBlUSGM+H7EcGQNTbJWfAIy0LpsS+ez5xYty7pnIHDaBzaWcM2cKi66+L43hz1FsZEVFhkBEMmgebgGWD7FOlKr61kqZMYfZ/QHHoPKP12zPYEMRdZMxCuQSU0+TFWPte5iXa/UtVl6n/NZpkCxBUpEbKuv3nkEfnkRydiWuK7JcwgRrwq8B98E20Ca/P35ztoVabggOhLn7IXfnlzku2xTsXZlWEfO5FfGB0cV89eD5228sYKqZWhk/6yH/eA4Bmnh16jrQjeVVVsIBBrH65IyRaCpPOqyaAaYBP4kmPatJcJfzQc7aW+fv87bGVqiw0AWsBu0M14WWyAeDRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by IA1PR11MB8221.namprd11.prod.outlook.com (2603:10b6:208:451::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Thu, 21 May
 2026 10:56:03 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 10:56:03 +0000
Message-ID: <25c59ccc-8de8-44a2-9ae4-30f66a51c25f@windriver.com>
Date: Thu, 21 May 2026 18:55:56 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [meta-selftest][PATCH] meta-selftest/files: add
 postfix/vmail/postgrop to static-passwd/-group
To: Yoann Congal <yoann.congal@smile.fr>,
        openembedded-core@lists.openembedded.org
References: <20260513072651.2235181-1-changqing.li@windriver.com>
 <DIO8CUB3VD1U.39NH95XC3C83@smile.fr>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <DIO8CUB3VD1U.39NH95XC3C83@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR04CA0016.apcprd04.prod.outlook.com
 (2603:1096:4:197::7) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|IA1PR11MB8221:EE_
X-MS-Office365-Filtering-Correlation-Id: 670bc4c3-a6e3-4302-fba9-08deb7278cc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|4143699003|22082099003|56012099003|18002099003|15056099003|11063799006|5023799004|6133799003;
X-Microsoft-Antispam-Message-Info: 
	WPuishRki6/GCt3ZwROMltlHieKaeTapS2LIZ35MJL7qkva0zSempb/ZCMKMvHFO4KqcMSWGv/NgVCt+GW1kOFihnFApwQZBgdLFjZP9abqhadsGgPm23DjPBQfXHSiuc+Ok/RW3zXarpyJ1JG0Ez/hDCGG8wVodcZ4Gvzl9nwPNDViMTmUVGMC9roSR7YNiQ60ZP+Pj5sm5AzoCpuTv3+unQv91mm4pCPUx9DG5YPJ1iZUppwlIQnbPzh95Do5eqdKeS1KtuhkmkYUv7nQ6JQFPsqwCDGX8+O3kYLIkfDIHniTptzA+3hRwbEhp7ltP9sb9gsEU0R62HCGb6gAVUcQOMMvbwXwO2t+94yaKrxz9Yk3wVU48UA7FY+MIYkzFc7+d8HufzNmsUpNEx5DoruwmPveoheNR9a+RWeJqn+moo3wS8EynNzhXQ0WcD3N+6AZvwPFrjGgC75GfQLqnxBU5lUuEnDr9ii5LfTMLjjrCZMjJWj/uoI7I7fCfZa3RizEm6gLJS41i05SZ9h2UNMzjQdDVUoJSz+ZUyPVl5yImB7hXPiQ1lUqh6DHT053orpA3v3nYY5Ty6Wix0N4i3AHCCnxj8J8WwcWtkBG/fSQRY8OTA5MyoG1Gadj6mlGtFO3Lc1olzAOXL2xzpsH0Ww==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(4143699003)(22082099003)(56012099003)(18002099003)(15056099003)(11063799006)(5023799004)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZUNVdlNtbndUSDB1Q2JvOXBydFFxMW9KZnRvZGFUQWU4Q3REalh5ZjJ5bDZZ?=
 =?utf-8?B?K1dEK0pNMWpkYlRLMGZ0M1pwTXc3RzRZdVliR0t5WGdOc2N6dDZlNGdvUnli?=
 =?utf-8?B?Y285TTBxdjVTSVFqWW1EL3pmdTlDZzNLNkRlN29KczdPVjFGY3ZJVUZVVXJ5?=
 =?utf-8?B?VHlDdXRFaEtzVlpVTEZydE50Ujh1bVJrV3NwTklBMzVCcnBtMU4vUVRnWjlq?=
 =?utf-8?B?Sk10S0ZTTVhuRlU1OTYzcms5cGh5UE9PSTlZcWd5R1h4NjhhTGhvNGxLTjEx?=
 =?utf-8?B?YjhUNnBpdXhOUVF5SjFFNWhXWEV3WnlkMjdPazRZSGdKWHcrNWF0RDUydXRB?=
 =?utf-8?B?VjdpRnczTkhHUnQ3NU1iNzNrRXhCQnhTVDFIVC9hVkcwLzJSL2lHcFl4YWtB?=
 =?utf-8?B?S3NJNDdKaUwyRDlrNlcxRERqVHlTaFc2RVJwajFDcGVWZWd3TzErRnN1dVpX?=
 =?utf-8?B?d2NsVXVPY2J5Tisrb0FVaWZXMklyL2tWQUsxVUF6bVFINjl1UlkyU2FtT3or?=
 =?utf-8?B?ckZ1S2dGSXJVWG1oUUFkc3FMNWkrb3NRZlpwY3lZSFFXOC9obkc4SHRoblVX?=
 =?utf-8?B?YVVxUHFObjQ4cnJqa3d0b204QmQ5V3ZTd2FMMEJybFFoTmFHRlFZWWM5dE1l?=
 =?utf-8?B?Q0xtbWp6TzFtOEwzOEQwcVllRmJ6L3NVTFR6bTNOWExxSFhMRUFXOStmdFdh?=
 =?utf-8?B?cFhnRHhqQlhVeU1xaml3WkR6aWYxRzhiUG04bE9YeHgzUnF0QVdyY2hBcHNH?=
 =?utf-8?B?Qi9PeGNhMkcvTytvcXZBaU1BbDVvSVhZM3RCaTV2aW5JRUJ3L0dIeUt6UElo?=
 =?utf-8?B?eUxTQVY2NEdxZ2d3YmloclNiYTdKeGI3MnAvd1JHWEJpVlpIbFliTUsxalB1?=
 =?utf-8?B?Z3ZSSEFReEFqV2JmcXpQVkR0cTVaY05XcTkyaVJobk9BaXZMR2ZjSk1wSGVu?=
 =?utf-8?B?MUloWnFEV3VVV1ErNktMZ1BjbHI1R1RhcE1Ja09LSUVERisyR2dUZ1RwR1ZC?=
 =?utf-8?B?VDlHVTFESkhJcndvQk9jZ0Jkd3kyNmIwakI5RTlwb0JvbldCa2V2Q3dPNG5F?=
 =?utf-8?B?eENEZFNrb1M4NWd1dGRWOUhib3EvRWJRcmJJZWxvU3lrMDdaVWI0SklHc0J4?=
 =?utf-8?B?U3hCRXVWZlBWTEFuT0xWanlHMTZxSE9Pa0wvb0c5RkN5Q1Z5dFBQTFV5Z1Jx?=
 =?utf-8?B?QVR5QlQydjEwd2tTTzExdGczRHhLYVAraFNROHhuSG1nR0t4bU5kbGltUTVG?=
 =?utf-8?B?UXVHOEQzbHh6Y1UwTEdIcHJJWVZqZUpSbFlkeXU1RVlRMEFFM2VXdno0bkFi?=
 =?utf-8?B?d1dSRVpqdWhCOWtCYVFVNVE4K0hoYU03NTZoeG1lZG1FT1dNYm1IbnVHSURM?=
 =?utf-8?B?eXVkVXRhTGhyRnFNeUFRWHBNQStFQll2UnZHdUx6ODNuVEhOc2wrTmQveEZs?=
 =?utf-8?B?SDdDdHkzdjF0T3VyOWl1ZE9XcVZpeUNmUUV0ak5xS3RsZUpzRWxhdEkvS3I1?=
 =?utf-8?B?MzdVdE9sbGlSU0dTUHFJeXU2V1lreFk1dE1IY3FobG96cnQxTFhzdTlZNzVD?=
 =?utf-8?B?MExMV3Z4S3NtZjBhSUdZV1pjb3dlQ1UzSUZ2YTY4ci9hTmhiUjREN0FkYmhT?=
 =?utf-8?B?RnNQRDdsMUF4UEM0VStYZUxoRFJ4RTBwTHdFMUE4ejlTMDYzRkJWQmRRSGNv?=
 =?utf-8?B?a3VJdWxCRU1yck9hekZLOW1CUGRiUEtxUy9MMlRBYzhCTVF6MFlHdWpXcFVU?=
 =?utf-8?B?ZE82UUJyUDRsMUhCMUUvUVhheW9rVFZEd0FUNlNVMXErT0NOYTBENng2eUJz?=
 =?utf-8?B?S3NxKzJTT2Rvb0Z2YVNDWit5K28zbW1Sc3k0L1JJWG9GQStUM2oxMjNwVDg0?=
 =?utf-8?B?K1IxeU9ZUWdDZXBXaVQ1bHpJQ1M0QjNvSGxBdjlDeGZQelNqN3NPc21ENnBa?=
 =?utf-8?B?SFZDemQzNC90anNuemVJRXNqL1lBQmdjL2pqemcrMW04aGpHcFpLVkR1SlBT?=
 =?utf-8?B?MEp3MWZTRmNTWWlOMHlpUTdKek1DUWpyT1FjTU1GZCtaNkdyRGt1SU1yTWs0?=
 =?utf-8?B?RVdJU0J1TzFtblI5cVhhV3B4YlRHRTU1M0ZSeWFBbFRRcnpKTkU2VGdvQU9Y?=
 =?utf-8?B?akZKM2luWTk4QWEyVHFDcGp0NVNmZFpQZUl5UnZlYWk2TjM1d2FHdVFFZmVQ?=
 =?utf-8?B?ZWRlaGFFaFdXNW44R3dRQmU4US9QV2ZQL0NBV3RiYUg4ZU5VbmIvRksxUUV3?=
 =?utf-8?B?bjVJVjdqc242SEJUU0Q3eGxySGcxTDlYUEtXSENTUlFSZ0c1akh4MEVSUDc5?=
 =?utf-8?B?Sk1rN1dwaERKMU5nRWErM2FsQVJUYXJpeURuU1JUck1kNXhkV0Q2VjE3WUpk?=
 =?utf-8?Q?bHJ/mmmxh5+oi4Tk=3D?=
X-Exchange-RoutingPolicyChecked: 
	OlgLH0NplgnHnbSF/WCKAWAAhb98b4Dz7UTFdaVEoQb8sXky67GOtR4QxtxnsTQo+f1wlCq7QVPqi9+i63VCp20UkqGlBaFWvp2rnKLLJ9ATVtbTNNSVPqsLWr3NTBQS7F0XNNYsjENDMWV0u/E6xp0wwy+VHI36A0KTAImpywVa9Xwtoq9NrvjvWobkCljB9ICHDW5/Bpn5rbXrKt2fHmlhLKdG42ABSuC+knaCEIamFAL7EZtxyub6HMQ5z43hYY9Rtyw5gCSVX7HGIExJw5FzLgWpc4huD/YQ0cpZyRJKo45Zb4OlRHhB1F4kvXyhBUVwZVx6knR3Tn7Wv0sEZQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 670bc4c3-a6e3-4302-fba9-08deb7278cc4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 10:56:02.9545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: twdromOW80D9SRQZusLx3aQihZr7GnG/ciI6KD9vX6FNwiq8YLL4tNn4bAQYxuygnPDFY6pKR8r+sEDuI3IsBXHarQR+6OuAZX5RHKaArPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8221
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEwOSBTYWx0ZWRfX67x69nhCPeDF
 gbxbGa05B1CFyr6VPQZvyqWEvzLrMmfRPOeOVsuN20ifTnnJr0OSUSANmiYsPH6kC2LD/rRB8Gi
 gqp5S+/Bk5kOP2zRrAEQ/X/Mg7V8t+qG/AoJOMPbWi0ubjVQhvuoFk+Oxe3umKH9SWKUuZcg2J5
 GTCm8d1MJbraXC37BfOxDBIHmZ3pFwP83z4X2BjoMlIM40AhrikbolcvtNpK2/nnVAQy4tnA85Q
 wXu11y7ZJXMTvU2EHirQhBtzxcam44edrGOaclmIqS3u2v8J+SotAX7cAgjSsD9KGmrLC2LZ9nH
 Z4I3BaPuWdqn1ND9mrFCheRWETs90BnBz0+9ZwdsM+Ew0E7oXwoSOnOale8pgUtf0Nj9Yf/qgJW
 IDGrAv3PoHPIm1/PvX1coYS72ifjuUEy3tRGhQMtf70WK9jsR1o2ETM0f9SmgTiOL5hMIznv8QG
 6mtUvwwUHpvYRsaar2w==
X-Authority-Analysis: v=2.4 cv=XKYAjwhE c=1 sm=1 tr=0 ts=6a0ee4c9 cx=c_pps
 a=2LRq3VT+JIpsXvqoN2bfxg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=Q4-j1AaZAAAA:8 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8 a=osr1S2gdIvsdySAO6K8A:9
 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: AEkdTj5LDi6M3oWTnuMzNZAE2jLTgEFJ
X-Proofpoint-ORIG-GUID: uQaLiEfMSEYtnZ5wHamiK2UV5g8bzOCQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210109
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 10:56:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237505


On 5/21/26 17:00, Yoann Congal wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Wed May 13, 2026 at 9:26 AM CEST, Changqing Li via lists.openembedded.org wrote:
>> Package postfix-bin create postfix/vmail, and group
>> postfix/vmail/postgrop, add them in static-passwd/-group to fix the
>> failure as below:
>> 2026-05-13 15:16:49,656 - oe-selftest - INFO -       ERROR: Nothing PROVIDES 'postfix'
>> 2026-05-13 15:16:49,656 - oe-selftest - INFO -       postfix was skipped: Recipe postfix, package postfix-bin: system username "postfix" does not have a static ID defined. Add postfix to one of these files: /build-st/meta-selftest/files/static-passwd
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
> Hello,
>
> Postfix is a meta-openembedded/meta-networking recipe and postfix has
> already a static id defined in
> https://git.openembedded.org/meta-openembedded/tree/meta-networking/files/static-passwd-meta-networking#n4
>
> You may use this file by adding
>    USERADD_GID_TABLES:append = ' files/static-group-meta-networking'
>    USERADD_UID_TABLES:append = ' files/static-passwd-meta-networking'
> to your configuration
>
> (This is what AB does: https://git.yoctoproject.org/yocto-autobuilder-helper/tree/config.json#n396)

Hi, Yoann

Thanks. I did not notice that before.

Regards

Changqing

>>   meta-selftest/files/static-group  | 3 +++
>>   meta-selftest/files/static-passwd | 2 ++
>>   2 files changed, 5 insertions(+)
>>
>> diff --git a/meta-selftest/files/static-group b/meta-selftest/files/static-group
>> index 6a9ece20a8..914d387ee1 100644
>> --- a/meta-selftest/files/static-group
>> +++ b/meta-selftest/files/static-group
>> @@ -31,4 +31,7 @@ audio:x:532:
>>   empower:x:533:
>>   cmake-example:x:534:
>>   meson-example:x:535:
>> +postfix:x:536:
>> +vmail:x:537:
>> +postgrop:x:538:
>>   nogroup:x:65534:
>> diff --git a/meta-selftest/files/static-passwd b/meta-selftest/files/static-passwd
>> index 98017c8153..3a75aea754 100644
>> --- a/meta-selftest/files/static-passwd
>> +++ b/meta-selftest/files/static-passwd
>> @@ -21,3 +21,5 @@ ptest:x:529:529::/:/bin/nologin
>>   xuser:x:530:530::/:/bin/nologin
>>   cmake-example:x:534:534::/var/lib/cmake-example:/bin/false
>>   meson-example:x:535:535::/var/lib/meson-example:/bin/false
>> +postfix:x:536:536::/:/bin/nologin
>> +vmail:x:537:537::/:/bin/nologin
>
> --
> Yoann Congal
> Smile ECS
>

