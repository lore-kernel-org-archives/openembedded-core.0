Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F5B9C282EC
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 13:49:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.14730.1741960146710834829
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Mar 2025 06:49:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=51685675bd=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52ECnF80021644
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 06:49:06 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45bgat2bub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 06:49:05 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52EDn5te012661;
	Fri, 14 Mar 2025 06:49:05 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45bgat2bua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 06:49:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TR+KYqD7AXkuDuz55vFWLYs6vg7i4mZrsoVDgTJfSGnjiHTWIhH/3cI88/q489jU3tEW8YMHxNmEHdq48IriNsW/HvnCDBLZeDx4qcaOIWmyHUpvY1YosBlMc6OuXh1IHD3OmvnjG/ZIJboafevF5CeWUYRn8XX1lyFv/QV5NK6NXHh83A/TP4UqM75NDLjuqWNg/qH2+afahAR798/dNjf4hec8pxgOhW91b/umhceSIqC+jKEtg9wG2qZEKTYeIYAEghI0P/+V/ZZBRFP+rl8NAROAWXvKEOoMY6M0Lgbiv0RckIMx+6rcaricdZiOPUQKTzrWCxUTJaN0X8jypw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZYZ+qVCYC6QJyGjB1ecgQIFoB2gLF5Nh59Oyx+ZFyY8=;
 b=kT7zbd9H6FyHiDMQy1+lzcP3uZ8Mu/iSkgeeaGN1RmFtAmiKutiYqFh0tB31G0o7HzuWEElGDi3tx/bQoQdXjVnl1NblIUx07Joag5ngu7Z4Qo0A/lEf9LwSOjxgb9UejU5vwBkF+kHc58t7J+HltvYNQduLSdo66MZEH3HEg5TVGtkWkvjOkGYhCHNgKwh97oZEUhneAQZz1vhoJlQEbAtByEHbrC07nva7Gzxg8Ng+5KzNmN6AsRrD0hVsvsicmrJDubw/Wh3Qy8bayJ4yS0I1hXeBH55wDfiZdA74OENCBLQ+7ef76KMayBdO4TwwCkiMR5jbBUXLsOi16CTEaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by CH3PR11MB7275.namprd11.prod.outlook.com (2603:10b6:610:14c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Fri, 14 Mar
 2025 13:48:59 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.8511.026; Fri, 14 Mar 2025
 13:48:59 +0000
Content-Type: multipart/alternative;
 boundary="------------U4FvnYoqiUVXknMniT4lKLmK"
Message-ID: <70820f45-41b1-487b-ac53-1e49ef57fd5f@windriver.com>
Date: Fri, 14 Mar 2025 09:48:56 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V4 2/3] rust: Upgrade 1.82.0->1.83.0 --> bloat
 alert !!
To: Yash Shinde <Yash.Shinde@windriver.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>,
        deepesh.varatharajan@windriver.com
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com,
        Khem Raj <raj.khem@gmail.com>,
        openembedded-core@lists.openembedded.org
References: <20250305134459.2275598-1-Deepesh.Varatharajan@windriver.com>
 <20250305134459.2275598-2-Deepesh.Varatharajan@windriver.com>
 <c411d58d-bd27-4107-9b98-e39de14204df@windriver.com>
 <5d748ede629df75d0ed30df5418b42b936d5416b.camel@linuxfoundation.org>
 <03997060-1f1c-4784-af57-bb83b0514ebb@windriver.com>
 <a82ea56c-dc36-4784-a6cd-33d97014bdbe@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <a82ea56c-dc36-4784-a6cd-33d97014bdbe@windriver.com>
X-ClientProxiedBy: BYAPR08CA0046.namprd08.prod.outlook.com
 (2603:10b6:a03:117::23) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|CH3PR11MB7275:EE_
X-MS-Office365-Filtering-Correlation-Id: d13d6179-81a6-43f0-68e4-08dd62fef8be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bU9MVHpaS2lqYm9ERmFiZDlpRUhDemdOQjVGcUdXR3JOVmtyWWh1RzVHd3dx?=
 =?utf-8?B?RGVab0JlNzlsaXhROFE4U1MyZ05CWnhFVXg5T2ZjZFNLbllWVFNVUEdQVmxq?=
 =?utf-8?B?cmVpdlFFSVZkY3puclVMaUVJTm9rbnp2dERFZVZCMjI2QWl4YVdLUWNMYlUz?=
 =?utf-8?B?eS9XSXhyZkNuVkxuclZBbGVEN05KMmZldmVhMFBLR3I1QVFCc3pHM0pOa0ha?=
 =?utf-8?B?a2dZRzh4NjEzaG12b1Jxak9weGhnMDdkeUxHaThvSkkrTUUrYytDZkV4VDg5?=
 =?utf-8?B?Yk8yU3NNTUFaTXNRNVk0NjJuamFQa1dyM0J3MHd4RnBudGxFbi9EbEVmclEr?=
 =?utf-8?B?NkRiQTZkcDZOZWg2QUxHbklLQmtEb291eWlPd1Jubk84a1pRQ0VMZWdtczYx?=
 =?utf-8?B?blpLNUIxekxsR25SUFNaVzhMbzNMV3EvaVhQWmdGNWFidFd2U0k5U3ZNUjg5?=
 =?utf-8?B?NUVoWnpIMHphZUYzNmFOY1h3U0NLeFRDZWlMZUdhbjlha1ovbWhlY3JFanpt?=
 =?utf-8?B?Nit0UFJHK1ZCUFVJc3BmMjhhUTc0eW1RMHNQMnQxMW1YbWR6WkwrWjdocE8v?=
 =?utf-8?B?c05yT2V6U1k2dGpqdk9PY1gzWVpoVTZLNG9acDhtcDdsNTdpdWRLQU1UVXJP?=
 =?utf-8?B?S3ZDdm1LdGJWUFhoQ09JeG5VTGtjdlFWaVNQZjFibVBzMXQ2OGZvajAvNlNE?=
 =?utf-8?B?NmtOejFicU4vTU8vMEM4bDVoM0x5U2M5LzNPRnovaTFtUlI0QTZpZ2pFbmNE?=
 =?utf-8?B?bzlQVDdZQXVHQ1dBZWpHbGFkaVNuK2lqbmhkeDcwbjk5eU53SXVYb1FnTGVT?=
 =?utf-8?B?Zi9FNEFCV2NKUmlscUpLYkpyK2xyUzdBL2JLOGJISlY1b285TitMSTVtMEJm?=
 =?utf-8?B?eG1BSHdkMXRIMEJWS0ZUSmt1dzJ4dXJweXo2bEt5RHRnRTk0OHpEZmtnUXZs?=
 =?utf-8?B?WE1pUnhkSW52SE12eTJTem5EcVE5TTdLekVRMnpaRFZMTEZvVzRFSXpCSzgz?=
 =?utf-8?B?WmxSVEMzYkdxbmU5U21LQURxNzI5ekNobVZqVTRwUFQvMEtnV0ZXQWxGSEpV?=
 =?utf-8?B?bmV4MFFjN3phNGRBaFBqbm1mMXpHVnMwdlFVUHIvVlFHd0VCemRkMGp2RFhy?=
 =?utf-8?B?c3UwYXIyQlhlNCtpZkk4YnVpMElEeDZmOXJKRXhlOGFGRW9IQjh3UExoN1VH?=
 =?utf-8?B?MCs4MHFOV3QxVzFOZnVML2JmdVRicXFLZkhnL1BBVlJBejIzWDg0VEJCQitV?=
 =?utf-8?B?WG5BY1FySndOS1lXcVJXTG5MZkxzRE1XK3ZVVHduRTl5ZUpHZ0lWUmtvdHZt?=
 =?utf-8?B?WEQxbVE5b1JuekxXRklKLzFSZGF3d1luSFU4MG1FaVJnSi9zdXZJaXJOSXYx?=
 =?utf-8?B?RUg5K3lvVk9uVm1qRGJZNVV0RDhaak1oejNBbU5MbzNDbHdNTCs5ZVdUbmU2?=
 =?utf-8?B?SlZ5R3VrL2lkaUdkdEFiMVFEYmtIUlpDdUg1UlNoTUovRUE1SjMxUEE0QlFt?=
 =?utf-8?B?K3BLczE1UXExYzNkbXVjZVBrbnNqa3BndTJ2U01rbGF4UHQ5VlVDVnRBaFg3?=
 =?utf-8?B?ZmZzWjdKeTJIN1cvMkd4ZVpaRTQxY0drSEVlNitQU3Avbnh6enBKSy9Bemhq?=
 =?utf-8?B?bHJ4V3BXQnhJR1pMcTlQNlk5dFIzOXRsdzJKSFp5emw2SGg0YndvNFluVEZJ?=
 =?utf-8?B?OS94cTdzdnBXUCt3T1RzSklybVhMRU44cUxiQVFTb2xRenhkcDVHT0ZsYWUz?=
 =?utf-8?B?TTBLdkZVT2U5MHVSdXIxdEJTelZLc1htYlRmcS9mZFhrNFM4bmVxSmpFT3V3?=
 =?utf-8?B?YkxWdlFoalhYcXF2WkNlQT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Und6UTFXRHVrcUh0WE9tMmsxRWpWUlZEcGppM08vL1M2WFo0c0c0bm5kWElR?=
 =?utf-8?B?SDM0YmV2QzJHSXRaRGdpRzE2YU9od2dWRGhhZ2ZrelN5UUxhQXdCV2tNc3Jn?=
 =?utf-8?B?c0FXbEhYKzhyaW8yQTIxRmtUallMS3M4NlRRSUFQSHpBcVRVVWxFb2xFWDJK?=
 =?utf-8?B?dmhjTzVVTHVQdy9ONElmbVBOTE01N2I4YnFkZGE3Y1F4R0JEdTZ5cTBmbUU1?=
 =?utf-8?B?MEpoUi9qYlJSdXBXVFlsZU5YK3hhSXIySjlwUE5WQ0hscktrLzlTc3REY3k5?=
 =?utf-8?B?VVJUanJJUnNqMDgvZDgybE5YRFZVbEo4TVU2R0ozbDloUGRQMk0zUzJDTkk0?=
 =?utf-8?B?akVRUTMwNE1VU0xnaXlNOUtRMm1VV1M4a2J0Yms4VmRDTThJdFhzOTBmQWRz?=
 =?utf-8?B?RTI3KzVzM25LTVpzb2JuOTRza3dVL0VCV09nZU0xU1VvTnVyRDYxTkhlZUJj?=
 =?utf-8?B?NDVleXNsUEs5THRXSWNLd3R6MkU5b1g2a01OaTZoYkdvU2VGTDduNCt5bXAz?=
 =?utf-8?B?NGdKWVZsdkIwQW84K1FPd2xhZnd5VzNsSDFrdnFHTXNzbFhWMVBSR3hiSFFP?=
 =?utf-8?B?T3B0QTdjRDVkMUlUa0lZaVR0OG84Q09TZSsvdnlrQjBNdmQ3S1R5VFVsU1JY?=
 =?utf-8?B?bXVnV2Y3SXRMQWRyMmVRS1dycm1kUjl2RGx1dU5wQWxjTkYzdTBZU2loT2xM?=
 =?utf-8?B?dTNoN2EzeC9RRGY3aWpYZFRmR3RQSm9xbzR3R21RaDJMcjdoK05IY2cvZTNv?=
 =?utf-8?B?TVJ1QWY2c1plMWE1TklQem5UdmJFTVNrcTFERmRRNm9zVS9taDF0b201cjll?=
 =?utf-8?B?Z0xsUXJucEovMDdhM2JveDN0VVBXZXZ0KzlDQnlNckMxNEFRNTl1UlRueXRv?=
 =?utf-8?B?WXRHR29tY2xKenhNdzYvTVdoMUV0ZXpocHhQNjhPRkVYM1JQM1RLMC9WcHYx?=
 =?utf-8?B?UUxtU2R6UXhSTmV0blRabmh3Y3pINFlPUFF5TmhnWkxuOWlrU3U4TmtLOHpR?=
 =?utf-8?B?Y3UyejQvcTJGSlljRTR4Mmg4L3MxaW8wYUxPTlMxY2ZaZnN2V2xtWTl4b1Vs?=
 =?utf-8?B?bHFyTmt4dDZ1QlJ4c3pTeTVKUHhqVU5PZFFkOUd1ai9OTzdRMW5BdjJNQjBY?=
 =?utf-8?B?SkNreFVpZG5aWkY3UWl6bGk2bmhKV3A4TXQ1S1ZDSEt2RTQ4REZITlF6Y3N5?=
 =?utf-8?B?MzJmeWY4Mnd1dmdaLzg5K1VBa0s5Wnl2QTRwOCtRcFRraHBzRyswNTFISXpI?=
 =?utf-8?B?elZWU0JSYlZpVjNyNnJGeTlTR0YwcmF1SWRack84Wkp6NkFXMlFIWWllb2x0?=
 =?utf-8?B?NHMvOUMzN3IybDVQaWxzSUkzRGpsc0dKU3UrMlFGcFNJaDZzeGZ5OGtqT3BU?=
 =?utf-8?B?OEpUMzV0QTJiV2cyRjhrRVplTFZxdjB1MkJMK3RIa3UwZW1ZQ0plZG80R1pC?=
 =?utf-8?B?akFPenN0cnZJSXRBY1phTVh4MDdlWkJPME10MzFyN2xCVTRGNi9UVW8rRjM1?=
 =?utf-8?B?R2J4MUNYMHBTR3NRNUh2UGNmS1BsNklpNldNbEY3aEJEQkhOKzNRM1lzVGFE?=
 =?utf-8?B?K0ZzcHRaVit0VllqbEZ6MDAyVW40bnRtSUJpU25iUEZqajB3UHl3aUpUTEE2?=
 =?utf-8?B?U0lyblRNejNCdlcvT2hhbjUxSXNyU0RCclNyK09JQVZCQ1FHNUZaTnZBL0lE?=
 =?utf-8?B?TG5ZY2E1RWZ3cmFnbVlYQ0xZSktrM1N5Q1pzMDFmbjUvOC9vSDF1RkpOVmRr?=
 =?utf-8?B?TWI1M2dDUitYbXhMVDMwUW0zaXl3YklKbkpuVndqblMyRVNyeFJ1UGptbUZ2?=
 =?utf-8?B?N1hXOEdVVUIzVGc5MmljaUtnMmZFRlNmdXg3Nm1sdStKdk9YNXlpQ2ZpZVJO?=
 =?utf-8?B?YkZjUDdXTHlJbG5odGpMTTFhckVUOC9hZkowbTJDOHVaMmVoWll6bld5UzR6?=
 =?utf-8?B?bllSMVJJWDlRSHhndDN0TUJwdXgzWEwvTjZHcmNXYkdPcnFTRHN3OTE5aGcw?=
 =?utf-8?B?VGZZaFZTcEpPa2VOelQ1TjBnc05PcFF4OGNSN0VTb0FaTEpQdEYyUXEvSXVE?=
 =?utf-8?B?dFJNV0cyTTM1dEIvQ3ZOUFBQYWMva2VyM0I3a25ta1Y1N1p0RUxDOThaeWZs?=
 =?utf-8?B?RWYrZlUzaDRQMDU5RGJuZkdEUVE4bWFzT2o1dHFjSEJ5N3FhaEZXWU5Lb2d5?=
 =?utf-8?B?Vmc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d13d6179-81a6-43f0-68e4-08dd62fef8be
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 13:48:59.2623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D5fP8o0A/9ssDfvJRU2M3i89H9PsX9fuGWlMzF3riDWT+J5ROCc/KmUckRKnu3DmjvubyBh20iX43SEAqCrlpqyjrHvWU/UKHoSwNOSbzM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7275
X-Authority-Analysis: v=2.4 cv=VYX3PEp9 c=1 sm=1 tr=0 ts=67d433d1 cx=c_pps a=NZTPE88KBhpz0z3fOSYQ1w==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=iGHA9ds3AAAA:8 a=NEAV23lmAAAA:8 a=WcpLpWcy-su_mNMuKdoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=t7CeM3EgAAAA:8 a=ag1SF4gXAAAA:8 a=6YuhePjxQn2l8ICrpu8A:9 a=GjSU1v3HGKG1Gubp:21 a=_W_S_7VecoQA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-ORIG-GUID: M-_mqJkgoXUwzpT5P8wvPOcNBVQ3QkqG
X-Proofpoint-GUID: NZuOjAIJG6RPlPMX00dwchHIZecr-o0S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_05,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 adultscore=0
 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503140109
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 13:49:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212845

--------------U4FvnYoqiUVXknMniT4lKLmK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 52ECnF80021644

On 2025-03-14 8:52 a.m., Yash Shinde wrote:
>
>
> On 14-03-2025 00:18, Randy MacLeod wrote:
>> On 2025-03-07 6:37 p.m., Richard Purdie wrote:
>>> On Fri, 2025-03-07 at 16:02 -0500, Randy MacLeod wrote:
>>>> =E2=9D=AF for i in `ls -d *src`; do du -sh $i; done
>>>>
>>>> 3.5G=C2=A0=C2=A0=C2=A0 rustc-1.82.0-src
>>>> 4.8G=C2=A0=C2=A0=C2=A0 rustc-1.83.0-src
>>>> 4.9G=C2=A0=C2=A0=C2=A0 rustc-1.84.0-src
>>>> 3.9G=C2=A0=C2=A0=C2=A0 rustc-1.85.0-src
>>>>
>>>> I didn't check for the other 4 GB yet...
>>>>
>>>>
>>> rust, rust-native, nativesdk-rust, cargo and so on.
>>>
>>>> Should we do that an host the tarball=C2=A0 on yoctoproject.org?=20
>>>> <https://urldefense.com/v3/__http://yoctoproject.org?__;!!AjveYdw8Ev=
Q!fJXJLq5zUX_ORAdT0imsy5PfIAHVBjw3rwJRpJH0HgmwRJiTyMFIQebHf7jG9o_l7GKu06t=
9zK2RNaNX3CujsTYP40pyXJxYOXO78vw$>
>>>>
>>>> Should we write a custom unpack rule to=20
>>>> --exclude=3Drustc-1.83.0-src/src/gcc ?
>>>>
>>> Or just delete the directory in a do_unpack postfunc?
>>
>> Yash has 1.84 mostly working and
>>
>> will add a post unpack change to rm -rf rustc-1.83.0-src/src/gcc
>>
>>>
>>> Or wait for 1.85?
>>
>> This likely won't get merged until YP-5.3. We'll see how long it=20
>> takes to be ready for review.
>>
>>
>>>
>>> This is annoying "bloat" which we at least need to identify and work=20
>>> out a plan for.
>>>>
>>>>
>>>>
>>>> Next week, I'll also dig into the 'tmp' usage increase to=20
>>>> understand where the 5 GB that Richard reported comes from.
>>>>
>>> See above, I'm guessing so it needs to be confirmed but...
>>
>>
>> Yashe,
>>
>> Can you review the reason for the FSspace usage difference between=20
>> 1.82, 1.83 when you have time?
>>
>
> The following differences were seen when compared the FS usage between=20
> v1.82 and v1.83:
>
> I did a basic "bitbake rust" build (in separate dir paths) to check=20
> the effect on Yocto build FS:
>
> The TMPDIR FS usage:
>
> TMDIR FS usage =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0 v1.82.0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=
 =C2=A0=C2=A0=C2=A0=20
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0 v=
1.83.0
> du -sh poky/build/tmp/ =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 65 G =C2=A0=C2=A0=C2=A0=
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0=C2=A0=20
> =C2=A0=C2=A0 73 G
> du -sh=20
> poky/build/tmp/work/core2-64-poky-linux/rust/1.8x.0/rustc-1.8x.0-src/=20
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 9.8 G =C2=A0=C2=A0=C2=A0=
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0 12 G
>
>
> It's more 8G in v1.83.
>

Thanks Yash!

It's a bit odd that you see an 8G diff and YP AB saw 5 GB but that's=20
close enough for now.

Please run the same analysis for 1.84 update both before and after=20
removing the src/gcc .

Please summarize the data for 1.82, 1.83 and the two sets of data for 1.8=
4.

I'd expect 1.84 + "rm -rf src/gcc" to be somewhat larger than 1.82 but=20
much smaller than 1.83.


../Randy


>
> The main reason for FS usuage differences in v1.83 are:
> 1. Addition of gcc  ~1.1 G.2. The addition of enzyme AD sub module ~392=
 Mb.
>
> References:
> https://github.com/rust-lang/rust/commit/9028177115718b38c0a189c4fb9eda=
03a14841d7
> https://github.com/rust-lang/rust/issues/124509
> https://github.com/rust-lang/rust/pull/129175=20
> https://github.com/rust-lang/rust/commit/59d4114b2d1aaac9a6dfe770997f2e=
79ccfd28ab
>
>
> Dir
> 	1.82.0
> 	1.83.0
> 	Diff
> rustc-1.8x.0-src.tar.xz
> 	210Mb
> 	338Mb
> 	128Mb
> rustc-1.8x.0-src
> 	3.5G
> 	4.8G
> 	1.3G
>
> (PS: Please ignore the previous mail.)
>
> Regards,
> Yash
>>
>>
>> ../Randy
>>
>>
>>
>>
>>>
>>> Cheers,
>>>
>>> Richard
>>>
>>>
>>
>> --=20
>> # Randy MacLeod
>> # Wind River Linux


--=20
# Randy MacLeod
# Wind River Linux

--------------U4FvnYoqiUVXknMniT4lKLmK
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 52ECnF80021644

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2025-03-14 8:52 a.m., Yash Shinde
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:a82ea56c-dc36-4784-a6cd-33d9701=
4bdbe@windriver.com">
     =20
      <p><br>
      </p>
      <div class=3D"moz-cite-prefix">On 14-03-2025 00:18, Randy MacLeod
        wrote:<br>
      </div>
      <blockquote type=3D"cite" cite=3D"mid:03997060-1f1c-4784-af57-bb83b=
0514ebb@windriver.com">
        <div class=3D"moz-cite-prefix">On 2025-03-07 6:37 p.m., Richard
          Purdie wrote:<br>
        </div>
        <blockquote type=3D"cite" cite=3D"mid:5d748ede629df75d0ed30df5418=
b42b936d5416b.camel@linuxfoundation.org">
          <style>pre,code,address {
  margin: 0px;
}h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}</style>
          <div>On Fri, 2025-03-07 at 16:02 -0500, Randy MacLeod wrote:</d=
iv>
          <blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-le=
ft:2px #729fcf solid;padding-left:1ex">
            <div> </div>
            <div class=3D"moz-cite-prefix">=E2=9D=AF for i in `ls -d *src=
`; do du
              -sh $i; done</div>
            <p> 3.5G&nbsp;&nbsp;&nbsp; rustc-1.82.0-src<br>
              4.8G&nbsp;&nbsp;&nbsp; rustc-1.83.0-src<br>
              4.9G&nbsp;&nbsp;&nbsp; rustc-1.84.0-src<br>
              3.9G&nbsp;&nbsp;&nbsp; rustc-1.85.0-src<br>
            </p>
            <div> </div>
            <p>I didn't check for the other 4 GB yet...</p>
            <div> </div>
            <p><br>
            </p>
          </blockquote>
          <div>rust, rust-native, nativesdk-rust, cargo and so on.</div>
          <div><br>
          </div>
          <blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-le=
ft:2px #729fcf solid;padding-left:1ex">
            <p>Should we do that an host the tarball&nbsp; on <a href=3D"=
https://urldefense.com/v3/__http://yoctoproject.org?__;!!AjveYdw8EvQ!fJXJ=
Lq5zUX_ORAdT0imsy5PfIAHVBjw3rwJRpJH0HgmwRJiTyMFIQebHf7jG9o_l7GKu06t9zK2RN=
aNX3CujsTYP40pyXJxYOXO78vw$" moz-do-not-send=3D"true">yoctoproject.org?</=
a></p>
            <p> Should we write a custom unpack rule to
              --exclude=3Drustc-1.83.0-src/src/gcc ?<br>
            </p>
          </blockquote>
          <div>Or just delete the directory in a do_unpack postfunc?</div=
>
        </blockquote>
        <p>Yash has 1.84 mostly working and&nbsp;</p>
        <p>will add a post unpack change to rm -rf
          rustc-1.83.0-src/src/gcc</p>
        <blockquote type=3D"cite" cite=3D"mid:5d748ede629df75d0ed30df5418=
b42b936d5416b.camel@linuxfoundation.org">
          <div><br>
          </div>
          <div>Or wait for 1.85?</div>
        </blockquote>
        <p>This likely won't get merged until YP-5.3. We'll see how long
          it takes to be ready for review.</p>
        <p><br>
        </p>
        <blockquote type=3D"cite" cite=3D"mid:5d748ede629df75d0ed30df5418=
b42b936d5416b.camel@linuxfoundation.org">
          <div><br>
          </div>
          <div>This is annoying &quot;bloat&quot; which we at least need =
to
            identify and work out a plan for.</div>
          <blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-le=
ft:2px #729fcf solid;padding-left:1ex">
            <p><br>
              <br>
              Next week, I'll also dig into the 'tmp' usage increase to
              understand where the 5 GB that Richard reported comes
              from.<br>
            </p>
          </blockquote>
          <div>See above, I'm guessing so it needs to be confirmed
            but...</div>
        </blockquote>
        <p><br>
        </p>
        <p>Yashe, <br>
          <br>
          Can you review the reason for the FSspace usage difference
          between 1.82, 1.83 when you have time?</p>
      </blockquote>
      <br>
      <p>The following differences were seen when compared the FS usage
        between v1.82 and v1.83:<br>
        <br>
        I did a basic &quot;bitbake rust&quot; build (in separate dir pat=
hs) to
        check the effect on Yocto build FS:<br>
        <br>
        The TMPDIR FS usage:<br>
        <br>
        TMDIR FS usage&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&=
nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbs=
p;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&=
nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&n=
bsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp=
; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&n=
bsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp=
;&nbsp;
        &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&n=
bsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp=
; v1.82.0&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&=
nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&n=
bsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp=
;&nbsp; v1.83.0<br>
        du -sh poky/build/tmp/&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp=
; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&n=
bsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp=
;&nbsp;
        &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&n=
bsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp=
; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &=
nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp=
; &nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&n=
bsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; 65 G&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbs=
p; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&=
nbsp;
        &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&n=
bsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; 73 G<br>
        du -sh&nbsp;
        poky/build/tmp/work/core2-64-poky-linux/rust/1.8x.0/rustc-1.8x.0-=
src/&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&n=
bsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; 9.8 G&nbsp;&nbsp;=
 &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nb=
sp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&n=
bsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp=
;&nbsp; 12 G<br>
        <br>
        <br>
        It's more 8G in v1.83.</p>
    </blockquote>
    <p><br>
    </p>
    <p>Thanks Yash!</p>
    <p>It's a bit odd that you see an 8G diff and YP AB saw 5 GB but
      that's close enough for now.</p>
    <p>Please run the same analysis for 1.84 update both before and
      after removing the src/gcc .</p>
    <p> Please summarize the data for 1.82, 1.83 and the two sets of
      data for 1.84.<br>
      <br>
      I'd expect 1.84 + &quot;rm -rf src/gcc&quot; to be somewhat larger =
than 1.82
      but much smaller than 1.83.<br>
    </p>
    <p><br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:a82ea56c-dc36-4784-a6cd-33d9701=
4bdbe@windriver.com">
      <p><br>
      </p>
      <pre>The main reason for FS usuage differences in v1.83 are:
1. Addition of gcc  ~1.1 G.2. The addition of enzyme AD sub module ~392 M=
b.

References:
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/rust-lang/r=
ust/commit/9028177115718b38c0a189c4fb9eda03a14841d7">https://github.com/r=
ust-lang/rust/commit/9028177115718b38c0a189c4fb9eda03a14841d7</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/rust-lang/r=
ust/issues/124509">https://github.com/rust-lang/rust/issues/124509</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/rust-lang/r=
ust/pull/129175">https://github.com/rust-lang/rust/pull/129175</a>=20
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/rust-lang/r=
ust/commit/59d4114b2d1aaac9a6dfe770997f2e79ccfd28ab">https://github.com/r=
ust-lang/rust/commit/59d4114b2d1aaac9a6dfe770997f2e79ccfd28ab</a></pre>
      <p><br>
      </p>
      <p> </p>
      <table cellpadding=3D"2" cellspacing=3D"2" border=3D"2" width=3D"71=
4" height=3D"118">
        <tbody>
          <tr>
            <td valign=3D"top" align=3D"center">Dir<br>
            </td>
            <td valign=3D"top" align=3D"center">1.82.0<br>
            </td>
            <td valign=3D"top" align=3D"center">1.83.0<br>
            </td>
            <td valign=3D"top" align=3D"center">Diff <br>
            </td>
          </tr>
          <tr>
            <td valign=3D"top" align=3D"center">rustc-1.8x.0-src.tar.xz<b=
r>
            </td>
            <td valign=3D"top" align=3D"center">210Mb<br>
            </td>
            <td valign=3D"top" align=3D"center">338Mb<br>
            </td>
            <td valign=3D"top" align=3D"center">128Mb<br>
            </td>
          </tr>
          <tr>
            <td valign=3D"top" align=3D"center">rustc-1.8x.0-src<br>
            </td>
            <td valign=3D"top" align=3D"center">3.5G<br>
            </td>
            <td valign=3D"top" align=3D"center">4.8G<br>
            </td>
            <td valign=3D"top" align=3D"center">1.3G<br>
            </td>
          </tr>
        </tbody>
      </table>
      <pre>
(PS: Please ignore the previous mail.)
</pre>
      <br>
      Regards,<br>
      Yash<br>
      <blockquote type=3D"cite" cite=3D"mid:03997060-1f1c-4784-af57-bb83b=
0514ebb@windriver.com">
        <p><br>
        </p>
        <p>../Randy</p>
        <p><br>
        </p>
        <p><br>
        </p>
        <p><br>
        </p>
        <blockquote type=3D"cite" cite=3D"mid:5d748ede629df75d0ed30df5418=
b42b936d5416b.camel@linuxfoundation.org">
          <div><br>
          </div>
          <div>Cheers,</div>
          <div><br>
          </div>
          <div>Richard</div>
          <div><br>
          </div>
          <div><span><br>
            </span></div>
        </blockquote>
        <p><br>
        </p>
        <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------U4FvnYoqiUVXknMniT4lKLmK--

