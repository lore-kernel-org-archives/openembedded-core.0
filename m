Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E900D64072
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 05:09:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7530.1765948146421502544
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 21:09:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HEdzZQ5E;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=444662dbf6=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH3BlGk1371890
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 21:09:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=FmlEhwAWv9rFCsvxQPsCSLOXvi7m5jkIFWX1sNzyo74=; b=
	HEdzZQ5EI/rEO3Z5r5pPnNN9FbSo5O/sYHkFX8X4Tu7fBS0G3qEjQxtuvdkuNbGx
	yt8GMncwXmUZrs6YafioXnkHm6H8nqjEiMkrHENxyqC92lmbuD7jC9kiW3Brke/U
	R91VotxH/vE4FyEXmV1RuIl8IV0yQYQ0gQcNJt7LNI0oOceWvPaAS97Bn0krxzIe
	4jyh4lKkanhH+qwGWQYVIeBlpCf8d9YNugICh7s5Yw9zYL7y2lwspecf1Di6wSFJ
	E7Ep1poJ4nB6gY+QwGxZgU78uMxMy1DCshi+1lxmFyBgkq6QLE576yS5RfpbdK/v
	+hh/t/08HeYQnHmIqaSICA==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010042.outbound.protection.outlook.com [52.101.201.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b3k0sg4s1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 21:09:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UwTsPujBGEk+ZjDaZo30UaEqKGo22qYBJnxDeH2hrWI+QEBEja8zBAiKX8euaXFUYnstBtLAwsVUHyxa+NcMQkUb0JSzAz6X/IsNhuSItPpdET3B49khCCI35zYKcnSARz+TurWBNQmc2QV+2Nb71gVbMjKG9/KpgEkeKsok+zWR4vEselfKgBG1Ws9Ropjosen1ZUvgfyKbEBYL9tTYUWstSnuCk+Byfz/Fubr5+/hCQXRNFAm1sAm3QOqEis4bafQZhkwRJxeZgJlvY0mm9ECno8MOjP9QqwiCsmlTlrKIfBHYZGIZJD8OEi4/Kaffp9LyDQrwneswKP/2RQzmUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FmlEhwAWv9rFCsvxQPsCSLOXvi7m5jkIFWX1sNzyo74=;
 b=JVfV1p63XImhr/8+gee/DX1GQlnZ6nr77lgGM0eUJkLcPZ7J0+2r3T5QUBOBw9pvmebWg0YYyMdmnbyq8rKV3f/QKkSfkrLZszgVkLsLQZJaT9C2JAaP1mmLGOYFPzvTVSk9y/m7Ivy6ClpYgxpOVUxo+aCsWkuddiKYMA6NVO99vDbiSpPrquQzJkQLaotkOc0vctiJSBGWq4VqBPyL/qAoiE9AY5RF6DxTBMWYA8+GTb+vYNdUg51S5KRAIA5EJw/24SJsPSjvPDWHsRoxPTXqJGNJM8nw5D880vd+kSAwHUh3GSWGUbEZe4OO1hyfwhs8w36wTh4OVL2+B7fBDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA1PR11MB7697.namprd11.prod.outlook.com (2603:10b6:806:33a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 05:09:03 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9412.011; Wed, 17 Dec 2025
 05:09:03 +0000
Message-ID: <e4d9e842-4b84-474f-a5c2-226f891eb68f@windriver.com>
Date: Wed, 17 Dec 2025 13:08:58 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH V5 2/2] rootfs-postcommands.bbclass: fix adding
 'no password' banner
To: Paul Barker <paul@pbarker.dev>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: "alex@linutronix.de" <alex@linutronix.de>
References: <20251204083208.1046464-1-Qi.Chen@windriver.com>
 <20251204083208.1046464-2-Qi.Chen@windriver.com>
 <09078a17ec73a43bfbda989cdc9f4a2ece5d4384.camel@pbarker.dev>
 <CO6PR11MB56028B34D3F4318930C01EC0EDAEA@CO6PR11MB5602.namprd11.prod.outlook.com>
 <CO6PR11MB56021F91F5A05724552D07E3EDAAA@CO6PR11MB5602.namprd11.prod.outlook.com>
 <f5aafc65f9a29a4ee07ac93e664af238cbe9a9a9.camel@pbarker.dev>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <f5aafc65f9a29a4ee07ac93e664af238cbe9a9a9.camel@pbarker.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:4:195::19) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA1PR11MB7697:EE_
X-MS-Office365-Filtering-Correlation-Id: da0f8a06-0ecc-4b78-3931-08de3d2a6583
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?L0IrVXN5MFVLQ2laTE1SL3ZEOU1RbHAyTENNRUp4ZUdzRHN4aDRmR1dKQW42?=
 =?utf-8?B?Ujc1cjcwN2xidThtZUpRZFh5U2NORHdScXlEVE1IdnUrSlBCanIzWXdOVUhQ?=
 =?utf-8?B?UGtBQzlxK2Nyb0FiVVVhY1h5S1lJbTArWEU3Vm1tdWV6Skxzemd0VTNKU0pj?=
 =?utf-8?B?VUlsRU1KeWl6RkZyQWUyM1ljRkNDK21yYk5WTEJBcTlUcitDMmJTL3UvTkl0?=
 =?utf-8?B?UWdlRlhDeGVNYXcxNklCdzlzbFdzU1J6T3g4NFlqQTBtZmFQNDcrZGdJWVA4?=
 =?utf-8?B?RmwyUGwxd1B3bXFQdzRwaXFSQmhPbldaVTc2cGxQclplWW90MGtHTjRzdXZz?=
 =?utf-8?B?TEF4QjJ3dkNCNkJ1YjJJMkg1MXBTcnp5bytmZWFrc3R6RkVrTEZhUUNNTHlT?=
 =?utf-8?B?MkQ3SGl2azlWSjQ5YlIyNnMzNEtqWUpXaEh1NkI2UXlMT3A0eUhhclkrWkhq?=
 =?utf-8?B?cmlrNnBDTVFyeCsrUzY0ZjZYdEJQNTBWUzJNL2lBOVFBTmdlQVQ0QUpLWGgy?=
 =?utf-8?B?MUVyaURTRU5ZdDliTlhsR2pSeTkzT04ybFRHN2o1VElpQ1FuNk01ZW1jR2hO?=
 =?utf-8?B?VFFGZWh6U2dacWw1a2tLWWVIaUpTRWZnMGU5TTF1cjJtTXV3ZjFRN3prdWd4?=
 =?utf-8?B?UUxXRHdvUWczWmZpYlQ5NHJwSkFDbEx0R1pKNGFSUnU4MEVFU3BXOUg0Qktr?=
 =?utf-8?B?VUY4RG9hdTVMSVJiV1RIWHJxNldIWG9BdmcvRTFxblVUaWVJQlBzN09uSk11?=
 =?utf-8?B?dlMrM2Rxbzd1L0J0R3R1YmMyZDJSbjdHdkV3Q2N0blk3VHplY09Yc3hGREVG?=
 =?utf-8?B?VXNOUUxFUUFsMytnUGRjcURLeG54NTl0QUpEK2RIUHBrT3J5eTR4d29ITVhO?=
 =?utf-8?B?OU9EZ004KzdoWldReW1lajJZNlFSL1EwUUxRVENRZlRDL1VOTFZaUWg0YkVB?=
 =?utf-8?B?VDVXM244V2pPemszVnAyMFlWQTZCOU0zdWVyNThzekl0SlZUcTZMQmZqYmdF?=
 =?utf-8?B?RnZyT0V4SVRsV3J1T1lwYkZORC9MSmF5N25iY2taVnZSKzk4OVp3NXdnNjJC?=
 =?utf-8?B?eGdKS2YyRmZ4cURxaGtDc3pLU2FNaDBpOFFVVjhVMFNmMGdQclVpVEROU0Jr?=
 =?utf-8?B?U3cwK3FUa0djaHp0WXhmMlVLQlM2UGRPZ3haZ2pLRFF0Qi9TU2NQTXludld3?=
 =?utf-8?B?cGNBcGFXSzRQc2tGM1VobEdGVm1VdC9MOTBwaWJNM0k5c09Wa2NEL2t4UHFj?=
 =?utf-8?B?YkFmdHZYUzhoT1ZiK0NFWE1RV1dpNjY5UE93a29keUJlcHpNRkc0ZFR3YkRh?=
 =?utf-8?B?Vld3cWVna2gvcWFzV3pMYS9FZUhJWVVHVXJIakFPUHhQMWlEOGZKdTh1eEtR?=
 =?utf-8?B?Z05XTEEramRlTVBNaUFiSFFmK1RxVFNaTTVaRFQrSm1GOHZLU2hvVUUzcEJv?=
 =?utf-8?B?ZHhVU2tReDJTbnQ2aXpRL3VyMllWZDVGc0pBNkh1WGUrOUU0WWIvMnU3bkVQ?=
 =?utf-8?B?Q3EwelREVm12MWhGLzk3RzZETTdDR0RMWXFKR1p0MVQ5NUtwcXJ3NVQrUU9V?=
 =?utf-8?B?L1puZnBQWE53QmgxUGVXcFlYakROUW9Eb1JLQXlFVVNuNGhmMFRrVm5aYzBh?=
 =?utf-8?B?Mm9ncWRJK0NPWGNlVDBkQTZKc3pNVVBNUzZBWWxiSCt0N0xKZ0JQUUVsQ2cw?=
 =?utf-8?B?ZDRUWXZVcjBQcWZON2FlNGR3TXg1VlF3UTdSTXlmaGxUM2xDM2tlSDRFdDhM?=
 =?utf-8?B?enJ4L1h3ejBONmNYbTFVNmgwYm5YMmZGTmg1OWdYdml5L3RFTkpXS3lydEpv?=
 =?utf-8?B?V2F5am1YVjkwRFg2L2RWSUFxMDRQQm1sdGJ2UlFocUdHYkV1NTVBb1BPeGpu?=
 =?utf-8?B?UWw0YU5naUJvWGRtaU4rQVk3WHBReFV2OSs3NmlJSWlTVGlFejhNQzU0RG95?=
 =?utf-8?Q?xhVhS5FVfRJbGFbvBK7Qqsfpe1hXZ1Ls?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YVdGWlpWRnk4UUlaQSs4ckk3SzBTS3VncE0rYVZuSkxvYU1KdHkrWFlYL2Nj?=
 =?utf-8?B?MUF2MndvbWFxK0poL2NJbVFTS3RBdkc4eTZSZVBiM1RqVWFiSkV0S2VpYjc4?=
 =?utf-8?B?OGhoUWhuRDBpNlVKSHMzemI2Z00vNm0wY01NMlB2cy9iSVhDZkVmNEJHVXly?=
 =?utf-8?B?QnR2WGtsSmJDeGFidVpubXpwSGc0Y01wMGZ3QWZXNERNVHBRdkZiS1pCajJq?=
 =?utf-8?B?UHEvNHZsR0QzSi9uNmZ6azFGdkl5cHh0cGJmcGo4d1NxaG9rKzNUcW16Q0M0?=
 =?utf-8?B?eVdRNS9pYkdRelBiNS8zVE5UZU96NmJMcWdydUxVT2R4RUZsazFqUWY0bkxK?=
 =?utf-8?B?VDhORVk0bFNVZzQra0FpV1psT0hMUVoxTFVLZUY5allvcGIrdTNvenUvZ2Fz?=
 =?utf-8?B?K0duY3YyVjdaaFhVb2RkRVV4NVRZYnVzSVFpRDNDUkJMOTFCSUFWSjEvdWsx?=
 =?utf-8?B?ZWgyZ2xFbE8wdG1WK2JxeXVmWmFpUlZ1VmVrZS9VSEkvSU1tLytjNkNpUDdC?=
 =?utf-8?B?ZHlUeDZ0dXpaY1lLODJpOHFHNGs5TGhrQUxtMVlveVljTW84RkxHWXRubDJW?=
 =?utf-8?B?SkMzK1BzaDZxSFlCWFR5VVAxWDFpeWFyaW5lWi83T09VM0w5MnBvTEYxdFdq?=
 =?utf-8?B?aVJsNS92bXZuNmRDNlZsSWtyamhBQTNsSkJocjJJTjdJOGRySWw5QTdrbVpP?=
 =?utf-8?B?ejE5K0NlVGlNci95UWx1ZndOOG1wTmdJOWllRWE0Lzd2bTc4blpjUEcxWXN5?=
 =?utf-8?B?WFF3WWZuNCt2VFQrMGxRSmg3eTd0RHowV0JJV04wRjRldmZ6TGJLVGtpTUhZ?=
 =?utf-8?B?ZVIxYjRUZWcrVVNUWjE4SCtsNTIwODYraVlSTFpGcEV4V2dES0prOVgxYzhn?=
 =?utf-8?B?eWtBbTgwWFNpNFlWakV0ejNqdG1td09FWHVvcEt2SFJWMjNIWlFpZ3JQeG5C?=
 =?utf-8?B?VFFjbm44dGEzajFKeDFiOGtKRzZIME1Hdy9HWFN3MHFtdG5XS1VDTjFxU0lv?=
 =?utf-8?B?UEpwQ1VkRWE5a1N3T0QzV3BvUHU5ejVISkRHczBnNVF2SFZvbHdOZkUwSTl0?=
 =?utf-8?B?aHFuSzMvOE1SYXhqeU56ZTZRRFJSMXB2bXdURTBnSXE3RWhQVll1RUVWMGJh?=
 =?utf-8?B?ZkJ6L3lzMVRhWkNRaUpSMEQ5aEZxbVZHamNNU1lSQStxY2IrbG9LOXdscm8r?=
 =?utf-8?B?dWR2aUl3bDVLZ3dyQnlUUlNWODl4R0JxMWNUSW1iRHZJdjk4djQ4OElmMzRz?=
 =?utf-8?B?dGJFaldKN3k5MGg0Nkh1dDN2SG5rTkszTzhtWHlRcFJtNElrR3VMMXB3MUdB?=
 =?utf-8?B?REI3Z1QrZldpR1gvNko0dlNDR3kyTDVRamhqRkNlTFliYXI1SHNtQndoSHQz?=
 =?utf-8?B?dU9ydStVV0dLb3FJcDNLVjRoRTlTNjdERXFyM1UrdVN3NTRwemxWYlBHSnhs?=
 =?utf-8?B?MjJ3TDk5SnBOWFc0SjhRZWxQcVBVTVNaemRTb2VuN21TL0NxR3p0WDd0TmQ5?=
 =?utf-8?B?RDNGQWx2ek5aSUUzVUNMaXM2M0U3UTRhU0hzUWtLU0N6cTJ5SU1SekM3bWhR?=
 =?utf-8?B?U2tmWUc1cjh0ZjA1Y0dlU29tb0ZhZjluQUdoZkJpWk1KMW9yWVNLMGxodzZ6?=
 =?utf-8?B?bUFDbkxKK2JvMTBML0JmRjVzTytKNitSNG1BM3BVTC84eER2dzJGUHlSZE9p?=
 =?utf-8?B?Q0R6OU1pbnhPWnowcGZxT2JTL3RXQXJibm5ndG9KU1d0eXh0SnBRTnhkd0ln?=
 =?utf-8?B?SnFWOUtSSjJMajlwOFdpcFFtQXRxOXhaODJoOFc3Q0F4SEFNejVOUjlYSFNr?=
 =?utf-8?B?RklZZDBJMVFsVUQyZWMwdDljUzBLZmF3ckFkNjQrcVFKS2FNcGN6MTlRalp2?=
 =?utf-8?B?R3UwZnNDNTY4RzNocFZzKy90Qnd6THpYQUE1Tk41YTlaQ29tTWFYUFJMei9i?=
 =?utf-8?B?K2J1eUpSR2hpbkRaWEZaNHVVOWRIOFFjMFlqdkRKc2MxT0ZnLzgweksyYUN6?=
 =?utf-8?B?K3BSSHllTk1sWXM0eTdwQnpHSFY2bzJ1U0NHTUFFNTR0Y0lWcDZlRTBFZkhZ?=
 =?utf-8?B?eE03cGgyd2pxRFZZUmtTQlBPeERuNG9jUjROWHlKc3NyV0plcm9JWFZPL2x0?=
 =?utf-8?Q?7svJVVhJeVqtA+rKdy5zhrESg?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da0f8a06-0ecc-4b78-3931-08de3d2a6583
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 05:09:03.7033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4O4Be5drNf1zkHWxY4cr0Him5oEzWERjVmWSf/NFGpy9lYxYUo5R8ClG0HXW6uJl50SeViH0gmMYsBoZxFjyiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7697
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: mbr7TZ0v9qZ4nGQqXfTclVpe6LGTtGqp
X-Proofpoint-ORIG-GUID: vziZuczOT0wW0frx4TCvnrJpbU-uQYMx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDAzOCBTYWx0ZWRfXwiQxm2SuxSZm
 renCVspNZCbILvg+DNt9g+UWgVW10EZAvBgs4AXZLwfz222QGjqZWwBDu69LFckzwcEz9bOQxZX
 t+RayBj/R3YSuZG1IlkgPdm05XLFqbb3shJwefguyQ1QSbK68O1ufYexu9yZXurslbQ5r578rvq
 4ku9nnLqg0r7P/4u3EykPwfOE86UAYsd5GGsq0QHZXVCe+ImUJEf8X/Mb/HKjXLeXdGk8yR93HF
 HWTHlYjm8ERCJUMFOaqs9I0/hEb8OhOxZ79TMgKqCbcxIZBJUAwW+Miloxo6M3pF1Hjp3EJ8fQj
 n9xpLKxIJwS+OZLBFpwIzWaoyjPhEJ/wN5/KecowbOQ+Ee6fR6UMb5mTwX3d6bJoVRE/K0yzp4Q
 qoCuB35NzPY+tp7e9yBGvM7eHrcMog==
X-Authority-Analysis: v=2.4 cv=PqeergM3 c=1 sm=1 tr=0 ts=69423af1 cx=c_pps
 a=/Dg/agRq+0IGp9KZEOxzXg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6VpcvSTjClald6eMtawA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170038
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 05:09:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227995

On 12/16/25 21:23, Paul Barker wrote:
> On Tue, 2025-12-16 at 02:13 +0000, Chen, Qi wrote:
>> Ping
>>
>> Randy told me that this one was hold because the :append concern.
>> I think I've stated the reason clearly.
>> The function is not changing /etc/passwd and /etc/shadow. It's just checking them and changing /etc/issues.
>>
>> Anyway, if anyone has some other approach. Please let me know.
> Hi Qi,
>
> We discussed this on the patch review call yesterday.
>
> I understand the reasons for the :append here and the interaction with
> the extrausers bbclass. However, this still leaves us with concerns - we
> don't want recipes chasing each other using :append as the ordering gets
> very difficult to reason about.
>
> The extrausers bbclass also uses :append, would the ordering be correct
> if set_user_group and add_empty_root_password_note were both added using
> += instead? If so, let's patch extrausers.bbclass instead of using an
> append here.

Hi Paul,

Thanks for the suggestion.

I checked the history. I found that the 'append' in extrausers.bbclass 
was first introduced by me. And I cannot recall why I used 'append' at 
that time.

After changing to use '+=', things continue to work. And the ordering is 
correct.

I'll send out V6.

Regards,
Qi

>
> Best regards,
>


