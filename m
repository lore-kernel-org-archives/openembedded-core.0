Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58E2CC83F1A
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 05:58:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.5754.1753336697073034713
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Jul 2025 22:58:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9300d03ff4=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56O5vdiG306124
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 05:58:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 483duq01gk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 05:58:15 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 56O5wFQF306794
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 05:58:15 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2047.outbound.protection.outlook.com [40.107.92.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 483duq01gj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 24 Jul 2025 05:58:15 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vs4gLFfvZto93zhU7NGtbXlvrZKtCu2v5DbFdLpOcqkHTkF+U8sWUegDDEjUN3bxoXdpGCFGDkcjOjeISK1FfBn1GI7wF5Ru9EGr+CZqqydwy+nKbGD/wwWMxMOrB2r02dBiaPgOcqPe8h1CLuTZsCPjw9CtflqzwBLGZcKGpMiHarcSqMNUmsTaseZe4he90pGDVcgsAnhc6tJ6HUSfS1EwqOJAvPjaE2a9OoUsCKUEis249OEItV0CQWHsvYt6hlzsgAyU0DfxOGidKGdu6m0kJH4gImXUSgYSJW62SKxzz0SKYAOt/mFbtrCt9qucJw/eq4MY+ninKu9t/12ybg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rHiPnkSKxqno7Kg6umnv6sNECqI5evXgDmlP55KU/JI=;
 b=LMpt48PLeVktAl7Z8jCRwyd7/wJluPuf7gSU3OvK4A6hhDq9rTlk5hFWdfU/PMIoPtDQDQWLFovfuYy7O6vZvXNI4Ph8rqtBD5D+fWr1o9qeJd8Dp8F3YqRrmG6jD5a06hcqrK1dJlFCvhVYenR4NrHH9MECHijiBebPV1WMO9G4mWIfjG3Ccc/T7MoXMoBiAJkzLC8LAmT/zwT3BWSjBo8sBWAcJO0wUArH3GSSxsT/wHPdFWdG7gg8274JrmpLklazeqRgzP7O7DWwh9wxekecZCeLltGwjU9EKA2pUA6K+2lCeJ+57atKTn9H5bvSOxnLCFkTr2EWR08IVxW0xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by DS4PPF2A0C3F85C.namprd11.prod.outlook.com (2603:10b6:f:fc02::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Thu, 24 Jul
 2025 05:58:12 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::7ff0:a398:beba:1ce7]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::7ff0:a398:beba:1ce7%4]) with mapi id 15.20.8943.029; Thu, 24 Jul 2025
 05:58:11 +0000
Message-ID: <b955127c-37e5-401d-915e-af8e2ab51bb2@windriver.com>
Date: Thu, 24 Jul 2025 13:58:23 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 2/4] babeltrace2: Enable python plugins
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        Joao Marcos Costa <joaomarcos.costa@bootlin.com>,
        mingli.yu@eng.windriver.com, openembedded-core@lists.openembedded.org
References: <20250720090010.3122861-1-mingli.yu@eng.windriver.com>
 <20250720090010.3122861-2-mingli.yu@eng.windriver.com>
 <1728b300-fcaf-4969-8ea8-b41735242764@bootlin.com>
 <1ae568be-00d1-4589-9ab0-887c05bae482@windriver.com>
 <DBJ77YFBBNED.2NE9TOFHYZ07O@bootlin.com>
Content-Language: en-US
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <DBJ77YFBBNED.2NE9TOFHYZ07O@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SL2P216CA0091.KORP216.PROD.OUTLOOK.COM (2603:1096:101:3::6)
 To CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|DS4PPF2A0C3F85C:EE_
X-MS-Office365-Filtering-Correlation-Id: 77a100e5-b928-4401-ecd1-08ddca771255
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aktPV3Nkd09qazNKekdQcWtocG0vVlNEUHlBTllleE5BQjBaL05teVRnRTJZ?=
 =?utf-8?B?U1RiQ2VIcHhJV0FjYnFPd0NULzVlSUJoQzZ3R2prOWJPYUdXM1FBbS9XUXJL?=
 =?utf-8?B?Mk1oY0s0dS9oa0lOMS95enJMY2d6QWlnSFM5KzcyUE5zVDEzNU9PN0ZyU0JH?=
 =?utf-8?B?bVQyU1BHRnFYUzhBYnF1U1hCaDlJaVdVSWJidWJOM2hqOFUvbUZ0YndmZWUz?=
 =?utf-8?B?TnpMRkdzVGtrU3pKajNxQ05jMjQ1eGN6N00yUlNuL1JkWFZGakRoeUFIdjZr?=
 =?utf-8?B?eWtHb3hLc3RyMm50UGpBbDYzNWt1WTVpRUdmVTdWZ05ZZmpqOE0rMktRVW1Z?=
 =?utf-8?B?U0JPeThkcFVpZXBwNGpmeFJ0TUozSEJxVXROMFJDWEZPaUp1NGgrTm9DQ3pS?=
 =?utf-8?B?eUt6Q01XblcyQ0x4R1JoNTdKZWFLRFlocEJ6eEdXLzhjYVJmWFNKV2UzQVQz?=
 =?utf-8?B?ZVhIOXVqdE1NSE4yeHlBMURVWWlkc0IzRjNGb0VsZW9VamhaVTA1T2VwNGs3?=
 =?utf-8?B?Z2dLYW5hTHIrZU54SWR5M3JFMS94cXRrTjNqOUVNdjdTUVM4VWxDemphR1RU?=
 =?utf-8?B?QmpvOEJaZGp1NXVxSENKR0NoaVAzZFNQMHQ2VVFMNmJBeVpSU1dZdzcrN2ht?=
 =?utf-8?B?MUlqVEc1dXU1WGZHQ1JsQkI0YUhYNnpraENqQmRqSS9IRkFpNW1GejRWYmtT?=
 =?utf-8?B?TU1BMUtEYUNFazQwS3NwWW1uLy96b3V3YnRiREo1RHFFSHZLbmpiT2NtUHZL?=
 =?utf-8?B?alREcGNVTXU3WnVDeGJJblljVFRHdzlxeDM2Q3BoekVNUUlnUFVZUnQvQzZF?=
 =?utf-8?B?WTF0UW5Gd21BV3VTMTlCR0wwdXl1MnlTcTY5RTV3eEh6UnVQMzdzRzdlZ09y?=
 =?utf-8?B?QTg5VkRXQ0NHNW14WTVrN25rUytXcXBxbG5yQVJGTlJtT2E0NTFSYkFtajVt?=
 =?utf-8?B?NU01N2kreEFEN0dkQUlSK2tPcWRPeHZuZjhOVlBvbXgyRytvUHl4OVU1NCtP?=
 =?utf-8?B?cjNnczVsQWlZYnl4c1VpeW1haVErTU5ld0hPR0U3N0dFdWg2VUdXR3VwdCtU?=
 =?utf-8?B?cGM2S3BOTkVYaU9OZGZoQkxLaHdHanRGdUhHYU9CZ2JiWWl5QjlzSEQ0WmF0?=
 =?utf-8?B?bWFoclN4dGlVdHN3Y2ZFaUhGL3BEUWRQK21FQ1JpRzlPWlVVQlVJUzNxcEV1?=
 =?utf-8?B?QXErdnNRdzludkFVWG10NGFNQWZJaG81SUdzU29NLzlkU0xpTCtTaXV4dE9i?=
 =?utf-8?B?YjFzcnVoSDc3WTA1UTZLMFlhdk90Vmsxczh2ZEZaRDdyZnFvSFlxZ1ZqWS9G?=
 =?utf-8?B?dlN1SUhJRzEyUDFaWW01V25Kb242eHZnQTB0b1l1cHU5dXdaSVMyRFVEaGQ1?=
 =?utf-8?B?SVFQUElXMzRwZEtEOEZJNnh6cFpaNWl6SG1oZFNjMFF3MFgycmplb04xckJ4?=
 =?utf-8?B?ZUcyTG1qWmxiT2pjemN0aUw1MWVYaElkZFdGcUVHMGVtSkhFYWN0dFN1QlJZ?=
 =?utf-8?B?VUpLakRZRXZYMTRwaDJsb0tjU3RBajRuZjRBVG9KaUJiNFc4OXFEZ3BCSDZG?=
 =?utf-8?B?K0srWWJsTXczelN4K0p4ZTJ5VGJndG5rd0J1L01La1JrZ2VyVnA3V0kzUGd4?=
 =?utf-8?B?ckI4c0JtZWRxWmR6anczWjcwZEZwTEpucE9KSVNNdWwwZ0V1T2NkZ3NGQURR?=
 =?utf-8?B?SWZIQjMzU3pmOTVlaFlTa2drbGtncVZiQ2ZNNzF6aFloZlg0S1ZXWG9ZSllG?=
 =?utf-8?B?M3IvN0J4TmRBYkJldkpDaTBlb3puRUg5TldmYmJjMDZQT1JoK0J2b1d2Z3la?=
 =?utf-8?Q?Nrr/S3DdBHT4a58Q91KmRwvkDayydP6038nlo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YkMzdWIvYnlWd01OTGRSNFJZcDBMMDVJYUFPV3hoUmtRODllSmJqalRNMHdr?=
 =?utf-8?B?dTlmSTI1R3BPRStQaytPNitIVjVldDM0R1ZXbURkcnNodzBZVVo5bHF1QS9S?=
 =?utf-8?B?RDJGM3ViY3RqK0ZRVjExNnMycmMrQ2VhNUY3ZzFiN0xBWHBLbUVIbTJaRkJM?=
 =?utf-8?B?eW1wYkc1czdGSWllVGx3WkxlSEMrZkFHNnh5Q1RTUWRzeVc2Z0c4MUVVOUNB?=
 =?utf-8?B?VmxyV2RZNzhrYkllYU1wYlVFbmFKM1BuOUJuSTlYTTB1djlrbCs1QlBpMWVa?=
 =?utf-8?B?cHhJTUl5Tk5oMENuUzdUaS9lVlVkeU0zL1FrMXFBYytWZDU3eTVtUEdNclN1?=
 =?utf-8?B?V2M1MmRiUHRhbzdYVmRLcVVYMy9KMGNXK2EzTUdtcDg3M2h3ZVYxYUlUSUJV?=
 =?utf-8?B?K0FLSURVbmNLenBKZXhSU2pVZmh3R3RHY3ZIcHdpU0hteDRWM3FCK2wzRjNq?=
 =?utf-8?B?SWRFTjNRTks4b2xHNmp5TGRpYkhRcTZqaU50VzBhR0FOQnNrcUhuYlIvNlRT?=
 =?utf-8?B?YjJ6b2Y0U09wTEJWN3N5bXFhaXpyaTE3Z0N4Z05ZVFFNRGVkWU5lQ1l0Ky93?=
 =?utf-8?B?R2xZcUc5Q05QaC93SU9Wd1pEdkJDZThzRzl6OVk5Sk83NG13TUozK1o0U1c5?=
 =?utf-8?B?bHh5OUVkZUZlRjloaVdKUkNFTXNZakZBUVM2Nit5NzFJaHN4Nm91eWkrQVJO?=
 =?utf-8?B?UytzMjA1NTZWQUwwN3RZVTJwK2R1cjJaTEt3bjhnalhWRGhidjBtdUNVemJW?=
 =?utf-8?B?K0VZN3JpUmVMekJnRHgrU3BvVjI3Mmt0SC9nVlJYYXZWOUZGOVpON0hSR1NS?=
 =?utf-8?B?U2M3d3dTQndOcXlhVVk5cVFXdnhjRnRFcldRTWI4bGt2NzlIbzNEc1V2WXV1?=
 =?utf-8?B?UTcycTRuUGhBUUw1RUpTaEFEM1ZaVHIwbjlXTFBVeUc1ZUY4R0poMVZkbXZu?=
 =?utf-8?B?Z2FkRXZCZG1yKzYyR2pKblpOZmNGMWhSTjF1VWJpTHd5VEEwbU5LTkcrNWEy?=
 =?utf-8?B?Z0Q1UWNEVHRudmlmQnZzeUtGekFLa0FDUGlIWUNVVUhCd2lHbUdZVHFFdUxG?=
 =?utf-8?B?WjBMWm42VCszUGVZK3ErWXRxZm5ZQldHNXAxOWg3Mm11SFREQTMzemdkOG11?=
 =?utf-8?B?czAzOWQyWS8ra2JEUVB6ZTJsVUhHMjlFWUNBWTh1enorT1lmRWttYmhDbjAw?=
 =?utf-8?B?OWRiZ09Cd0pKQmlSNDRaVkVvL0s4aFhzTUd1dzREZGZHVSt6S0lyZ2l6S2Iv?=
 =?utf-8?B?WlpQblJEZ0ZFZ3Ewc2EwRi9zQjYxVFN0cytURFN3aXp3TnhmbWhRemxyYjVv?=
 =?utf-8?B?MTgvLzJ3dHNsUXJBNTdMQkJzSnNGZUpYajR1d2J0dWEvNmVJNVVQK2dUZ0dl?=
 =?utf-8?B?R0pvc3ZaWkZjNjhRUEVHNG52RHgyUlN6NUQ0KzFzaFRNSUVMYlRRNXNWZVM4?=
 =?utf-8?B?WGVTL3BLTlVzNDR6Smw2U2dqVU9oOGs2QldaRnlFRkdlYXhxTGhGbVMxOTZQ?=
 =?utf-8?B?U0xHcEhYUUQxOU9hNHgyRGpkVzV3ZjFFcVBPUHk0T2V2QzNVUmFyd2RrTTlk?=
 =?utf-8?B?b2ZGUmRlb1ljL0lzUjc0bUJudldhMHJLMldtZGxjOGVZUS9pYWV1eS9NVmxn?=
 =?utf-8?B?V3hRMzc2dEdJU3ZmcDFIQXUyb1F4TjhHd3hNUmpuK3VPYTZ1ak1YVDlkUkNN?=
 =?utf-8?B?Yk1NdHZsU1hjVjZIZmJZY25kUWhZSFlGbVNwZkozSVBJTEVKT29naFVrOEc4?=
 =?utf-8?B?aDBCSDZEWUdLUjhHTGFnVUw3akJ2Um55MHAwM2VoWnZ3bnVnNXRaOHQrT3V4?=
 =?utf-8?B?NXB2N0RES0RkZGtZVjhHUkxUWERIM24vU0VjblR4RFlwODYxaFZnd2Qxa0t2?=
 =?utf-8?B?OXFISFJkeUpWeVRUbXNjanZnZ0tTQTBYUWRuaTkrWnpya1ZuOUg2MklKU2xD?=
 =?utf-8?B?YU1nNFp0cW9KMllVbUJLdTI5SjRzTnIyYTk0M0pFY04vV2JPcHp0WEJkc0Rl?=
 =?utf-8?B?M1cvZFcwYmtuR0lqazFNeFdleHBmSk11YUxXaU9jNjlpY3RMSFd1Y2xLR1pO?=
 =?utf-8?B?cnc0Y2ptanFGYWYzT0Riblh2WERJeFFwZnVzOGFuWU1VUndiR3JGbDVwYzNO?=
 =?utf-8?B?UmtNZDVwdkVoNU1TWk8xSXhMUDdYOHlEeHR5Q2J1Q3htYWxFRGdiSU5WMlZv?=
 =?utf-8?B?anc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77a100e5-b928-4401-ecd1-08ddca771255
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 05:58:11.7933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J/4GRsDOA5fxyIoA3a+rrLp5+Dwbir6D9BR+7Oo4QsnQRHr4GUGRZgkFhL3CZ/CfwYnFT+50Tvktv4wAOCTZMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF2A0C3F85C
X-Authority-Analysis: v=2.4 cv=f/tIBPyM c=1 sm=1 tr=0 ts=6881cb77 cx=c_pps
 a=LuzQ4XTo42GRDgkCKj1yyg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=iGHA9ds3AAAA:8 a=1NWNoF9oAAAA:8 a=P-IC7800AAAA:8
 a=kBoCP8jEF8Oj4L1J-GgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=97APRTa-CG6DvPMFVxHL:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: ZNVVw4pFbJbFBkDSnpfkAkeD1esFegOH
X-Proofpoint-ORIG-GUID: dOvr7qX2HECac6ym4D7GaPzW2EnVa0F6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDAzOCBTYWx0ZWRfX5pmmmFP0leov
 ILbO/WGEp6oMacSHz1Kjp2CsUekHBpzYd61nqrUuZt+P6D3wgxFPL4z5fJVpJ72EWIMqyv3PPcZ
 Fn4aUW/ZTGq3HUlxLClA3wi0khoIhMCOUk5UNuUn5yq7RWuxr92AzKfQ7D3WdydZ7lhLUr25A5c
 gXOQWYazZpreos7PQ8hVdHdxfqeB+WdB7Yhu+R5imhLh/MPg5pXJxi4L/fmf1PZWjCb7zxUOeVV
 g8aeL9t9VWbkSKyNtyxslp1JsQ/79Rgmt7p+i7MIhLSnwaarZyPpD+5l2DvHBoqy3aUhaoDLNL3
 rePQWP70yycUj4tBEN4h45CPPaOUN5yDoG81SpVBZPuaFXeOVcNnNAMZY6HlmKEchaKxWTKFges
 WC30EG9m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2507240025
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 56O5vdiG306124
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 05:58:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220821



On 7/23/25 13:51, Mathieu Dubois-Briand wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>=20
>>> There are some ptest errors in the autobuilder:
>>> -
>>> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/61/builds/1=
923/steps/12/logs/stdio
>>> -
>>> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/73/builds/1=
931/steps/12/logs/stdio
>>>
>>> Could you please take a look?
>>
>> I will look into this.
>>
>> Could I access the ptest-runner.log such as
>> tmp/work/qemux86_64-poky-linux/core-image-ptest-babeltrace2/1.0/testim=
age/ptest_log.20250710153833/ptest-runner.log
>> corresponding to
>> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/61/builds/19=
23/steps/12/logs/stdio?
>=20
> Hi Mingli,
>=20
> Ptest logs can be found here:
>=20
> https://valkyrie.yocto.io/pub/non-release/20250720-85/testresults/qemua=
rm64-ptest/core-image-ptest-lttng-tools/
> https://valkyrie.yocto.io/pub/non-release/20250720-85/testresults/qemux=
86-64-ptest/core-image-ptest-lttng-tools/

I didn't find ptest-runner.log under the location you pointed.
The ptest-runner.log such as=20
tmp/work/qemux86_64-poky-linux/core-image-ptest-babeltrace2/1.0/testimage=
/ptest_log.20250710153833/ptest-runner.log.

Thanks,
Mingli

>=20
>>
>> Thanks,
>> Mingli
>>
>>>
>>> Thanks!
>>>
>>> --
>>> Best regards,
>>> Jo=C3=A3o Marcos Costa
>=20
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>=20

