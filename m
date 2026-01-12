Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2D94D25030
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 04:53:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26773.1768193587616941352
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jan 2026 20:53:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=YZHMEhgW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5472788a74=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C4nJrZ746204
	for <openembedded-core@lists.openembedded.org>; Sun, 11 Jan 2026 20:53:07 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=QHacojbbrllyxPfEEVdjDqQOUF6RsiSG5TcE2DSihGs=; b=
	YZHMEhgW8HqWRCD83i8XgFXhbgu6Z9Pnp3ydDxQ4F5Mbtf1PXnidWteMV6WToiE3
	o1JcKYJ5mUk1k9pzaVyRBGmsRXf8NJhFfmcvvd0LBDiRcksSG7JGoqHDzlh+8qP/
	JPvA+9uoIJk6JpugoOJro8zHrFjwyjB0GY+4lCEkqkFKzc5BFEA5cOacj3m/vUlX
	xFg2of7z17HF+8zoYQ625Pb4m2z3ypy+Lmd5QjpD2Sxeav52RMqfVKmor4be1MpN
	u4VldE12Ws0go4Wra7Zq02f+24XYWyiO4NsQ2SVEf6GA1Clr9IHtjKkknZI4f6Mb
	zZOVH4QNs6T84lZXkw5wbQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011064.outbound.protection.outlook.com [40.107.208.64])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bkjx0s7up-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 11 Jan 2026 20:53:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bN9GKQ5Mmi2OsjsPSLMWuv9p/B+ohWLxUs3dAZHlhDiRk7HK3/N2yFOVUV4gaKq2WFAH2dpbFtEAkaqjR7lKCZ+LcYPAzvPpU24epWE/dBYMAZdJX3266Qr/CdT2M0bJE/a8fpdjJcx7Pyqypmtdry+2DwE8zQve0JbPOJbqlmZkW/irK9cRypiKXOxrh6+CetUsqaCxgRPrDavqGKmyqyRkyhYjy2934iQTDZA4vweEcyYOwYxYJtNvBTUy/lZkIPMTwYKXNjgQEXU1VwhlgyITomFlG4W7abbFHCGXCLsxHVVBdnxPVnZtMTuYKD/wakHEHepJX4e0fBfCJbQJ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QHacojbbrllyxPfEEVdjDqQOUF6RsiSG5TcE2DSihGs=;
 b=LtFtDGAfG1tdV4lmp2NaBl2x3OdbPBuxgWEcOINB0JVao1KUWAhJUWuQAwi7CueLhpIBJ5M1q8Ozat7HynxrLHogs5EC+3CppzVSDUrv1ZyZE7M79VuLjXR5tI8AmMDt4WmLb4Z7kFap6M46Ji2thkwQxpEWJFPmTHqMfo6bCFSqItET5gtyECVdAQEjhANzeFpGgGDOZYXl3Db2olHRS11LYm94Gnh8cicIYN12e2JnJ+eNXtZdT6fL0jYuMa3LfobKiYsWlhojPmnB6Q+DYsRCS2OweEQOfD/PGZ7aMXQwmMP0FXdm8AP863nddSP/itDMpDV1h/8J8x10ru2+vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by CY5PR11MB6487.namprd11.prod.outlook.com (2603:10b6:930:31::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 04:53:04 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 04:53:04 +0000
Message-ID: <e07e5e63-5484-4331-8a4a-6eb4027c1a38@windriver.com>
Date: Mon, 12 Jan 2026 12:52:55 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] go: fix multilib file conflicts
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        Khem Raj <raj.khem@gmail.com>,
        Alexander Kanavin <alex.kanavin@gmail.com>
References: <20251222032455.2683666-1-changqing.li@windriver.com>
 <522E1A76-C605-4C0C-AB6A-F568E5676905@arm.com>
 <979d9d7f-8a2c-4cb3-8849-d8724f3d0f58@windriver.com>
 <D3892BD1-671E-4177-9154-08CA89880ADC@arm.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <D3892BD1-671E-4177-9154-08CA89880ADC@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI2PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:4:196::16) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|CY5PR11MB6487:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d97715a-3f17-4330-dec1-08de51967829
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RE5WRHNRM0pPajJCN1p3ekZ3aUIwTjlWNW9RVGI2UmE2L3JXdTlxVlJHUE9R?=
 =?utf-8?B?Y1FNNUM3aGNZM1ZlRUFzVUl1dkx6QVBTeUV5Zytwb1JPVVpCcXlCN1RkZ2pj?=
 =?utf-8?B?MUNXV3hhUmJQemJzRmFEQlVFdjVHS2Vzalg3VUx2ZVFjM3htVXE0WFJiRjhz?=
 =?utf-8?B?MmFNaS81bElLZ3dGNHdUZVlnc0haeG9BRTI5RDRoWXFYNnNmc1AwWkpiTmgy?=
 =?utf-8?B?MTZmTFZvSGxUSmpkbHZVNHNoQmh1eGVHQXhnQ3dQZUZvR2gzbW9ScllEQXpi?=
 =?utf-8?B?T0t3eW91bDkwaWxUZ2x2b1MwMjR6cG1NOU5rL1JQWjNzNzB2THdoa1ZMWlds?=
 =?utf-8?B?VkdaV2FmWDhlMW9TVUJHOUYzQmFDUHFGcG9QYllsRDNPSFVGcC9lM0V3aHVB?=
 =?utf-8?B?U0lCdjQ5YkpuNTVJNU42ZytMb3VuWG1id3FDUW1jdngzb0Vsd0tndXJiYlFG?=
 =?utf-8?B?VWJWRXNuY2tHU1RpaCtMeTh3VkJ4NzN3dWxkVzFvR3V3bmduRDk4M2xQV2k2?=
 =?utf-8?B?b2tmam9wRVNYa0Z4QXJQL2g2VW9QalB5Qk1IUWduYXJ6ZlFPbTVnOU9OOWFP?=
 =?utf-8?B?akJoOTIvMFRZMUpCOC8xZUgrY2hWdmFPaytPd08xTlVHNkR4R2xBbmVQSjU2?=
 =?utf-8?B?U0RqcGd0YVA0SFpicFVpaXZIeVFFOXU0dkxZd2RWQkZFbU9nV2tqN0dJZk55?=
 =?utf-8?B?K3NtT1YwYm1DOThsNGFENmJxNS9BbnNzRVJ2R0FPTFhqU1JrSGZyRkRXYXpn?=
 =?utf-8?B?VnJnMGdvRDlBd01QL3ZUbDNPZWZoL1Bydzc0dE5iSVI2RGhFemk0UFQ0dGZJ?=
 =?utf-8?B?amt0Z0VJN0l4djZsV3Z5ZXhFK0RnWHNMeW05b3lqck9iV00xVThDRGp6VnNJ?=
 =?utf-8?B?ODlMRlhWN3V5blpybkxSdzRISy81b3JXRitBditkaXNOUy9QaDVYNnl5QUNj?=
 =?utf-8?B?VGlScTlPYmFPY2JGSFlLN0lSQ3pEd0Nmd3ZDYm9qNXZPYkpoVzllV1dUT1J1?=
 =?utf-8?B?YjllTHdpQmR3OFpjR1NyV0duQUd3dFFIWEhjWkdCMGIxOVdvQ1FWNUxrY21Z?=
 =?utf-8?B?NEpIdXZkQmxXZktCS1g5RGdSR0Y1Vnp3MWlEZlJ0Q0pTODNhUm1rdmFlSlJr?=
 =?utf-8?B?U3liT2V3RnpLRDJsSXVHbzZPMS9lSy9XL3c4RjRkL1k5UW40RXlacTMyRTdy?=
 =?utf-8?B?aW1wQXVnbE9BSmh4K01pMG52OW4vYnVWdjk4TS9UeUhCWWNVaFhmUWdRUzd2?=
 =?utf-8?B?RG9WY2c5QlV3Z0JaaENzRHNJZXptV3Y1QllZRDc5UG9abEJNRkx4bVg4Njlw?=
 =?utf-8?B?RWhybko1NmZEcXlyRVZvY1k4SXdJNnN5OUErRlJPQ2pXemRLL0lzWHNaOG1p?=
 =?utf-8?B?Q0oyMTB5Q0UyT1JMMVRHbGNCclp0YjRJNW1hTXJNT3hIQ1NkaFpjSUhWSnZz?=
 =?utf-8?B?ckFTRnFRdlNtKzhaNDRubHVkSlgzVzhDMEpDSUszRjJ4MUdDZDVML1dZV3FY?=
 =?utf-8?B?ZmR6RFBMQkRPQmxDUTVNZWhUOTJTVncvN0lkOEt5b1VzWXU4cmV6Tmc1ZWhw?=
 =?utf-8?B?Y3duUittOG81T1RnTGVCWVphbjl2eU1xZDZMMG9VNjZ0SUsyUm9SL2RHU1Fq?=
 =?utf-8?B?ODRpSWJrdUw0VUlocXBLTzcwOGxiRWRDKzVVTFFsU2Y0cTViVHRQMkRxeXVP?=
 =?utf-8?B?MTFvNVRQYmExeWdCTmpJRTZYcTZ3SDl4VUREbzJHNmZlamQrSlVJZ1poR2FN?=
 =?utf-8?B?cGd5QW9ZcW9MSmVpZVBwQU1GWC9nanRHYjFJb1ZHc0l1ODZlQ0RRblYrTW9j?=
 =?utf-8?B?M2xERWVER2tPdk9Sc0pXV1RtUHp4ZUN4dmxrOUlYdnpiQjRSamNJbU9nQyt1?=
 =?utf-8?B?RXVMK09ZUXV4RTByOFMzTTJhSWllaXFLN2hDLzhzcFZYVnJOcmtYTWFTZFB5?=
 =?utf-8?Q?sg8J+Buhxxp98zgOy/eJ+mSrZP5jF1V7?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NzJ2Rk1UUm45WUdyOXM1L3JWL1RhVlFobytsZUlKemxZcEg0dWllYWk5QXQx?=
 =?utf-8?B?NDcxcHdPWHlNR05aYmpIblo4VXJiYS9talhiOTZ2cTlHdUNpYTV3bTZsSWxH?=
 =?utf-8?B?V21EUFNsREFlS0k3UWZ2OWx3alVobVEzcW5KblQxbHhha25kTW16YVVPRVhX?=
 =?utf-8?B?WExwMmV5c2VKeHdpM1NKK3hRUE5tRlhPckNNYVBHOU03THlqbmMrZktudlNX?=
 =?utf-8?B?RGN2R2NQZmEwUkxJWG45emVEcGRzYUdwOFo2ZnJ2TmE3QURpVldWaWIzTnpH?=
 =?utf-8?B?YllFelJ6V0tuaHIxTXEwQ3cxZnZWU3YwRWVqQUJ6UksyNm1PSllzZ1lGSkFK?=
 =?utf-8?B?Nng3WXV5VUpqMUNlaVlTdXI1N2Q4dFJhOW9Ub2gyMjVtbGJ6RHpMRVRWMmJs?=
 =?utf-8?B?NTRDMDBHS3hZLyt1Y2luNGFGU3lWZkphTkhHa2tSdllvYW00NndVbVc3RFdo?=
 =?utf-8?B?UXlOQzZRKzltS0pEM3JMQUVabUV0dnlBK3JPUS9GRFoyZWxsN2NsdENsd3dC?=
 =?utf-8?B?S2NnVVdBWnFyZlgxenQ5Q2I2UkxtZHVscXFDMUxYb3FxTjArYWFLMG1kZ0lI?=
 =?utf-8?B?eU5laEFobnlLVm9zckprNFc4amh1bEJmNFA3U1Y2MUhOMGZacEdhd1MycFZI?=
 =?utf-8?B?WEJtSmJUU2dKQzdTSGFWczBiQmYxanpEcyt2ZnVjb1hPU3M2RFpGWXFzRVd2?=
 =?utf-8?B?S1JZS1cxZTRCL3MwTCttT3dWbTRGOXdkUThSRXgvUk1SZ2Y2SUowVG1FRGxG?=
 =?utf-8?B?VTcwSTQvT09pVlZsc1p3QXE5L0dITUtScXFyS1JLaDhyZjdTOCtGdEdlSmJn?=
 =?utf-8?B?NjhQRVJXN29JbUl6R0ZZNUFSbzgwY0JadDRtVjFUelo2SlBNQXVzTlM3WUtk?=
 =?utf-8?B?Wkx1Rk5pelRHVXpHMGhZTXlZZ2hudHZ1b0tIaFJpY3JCaERzUFo4K1NpUUhC?=
 =?utf-8?B?U21leVR0T3QycTV2R1AwU2xBNFpmV0dxcFYxc0VMOEZYaVZib1ZYQzFsbGE4?=
 =?utf-8?B?bzMrOU5aWnJRQUNIaDhNajErVHBXZ1pGK2Z5eUFBZHdqQlVlNnJVWXpGQ0lY?=
 =?utf-8?B?MUxhTmNpZmpCdWk4clo2eUhnMzRJVnNYNEMwSEIvRkpSaHU0SUFZR1gxNVVq?=
 =?utf-8?B?R0hkL0Exak10RXNsWFR5SWVkNENYMy83T21LN3l2ME1RM3kycDNxQWZaL3Yz?=
 =?utf-8?B?czdnSmxycWlXUDRScjBXRWJodVV2MUFHZUNWbGEyU1RRMEdEbnFCS0Roands?=
 =?utf-8?B?dlZ0M1hsM1RTVE9iMDMxMzdxQzZhd0k0cENZcjRwY000QXpzS0VVdUlMajZM?=
 =?utf-8?B?T0NWdHNFRHJMYmJOcE9uQlNOaW9jbW9ucmJsWHpvOHhRTWxiWTJqRFZJZjJp?=
 =?utf-8?B?ZFR2T0JRTHp3VmRMT3BhdUM2OFhmRExtaUVlOVJyTnFjbkNiQVJZUmQ2Wm1m?=
 =?utf-8?B?M1lhMEdlajdrTGE4ZG5veWZqTzd4Uk9qUWhjcTNxMUttU0lWZGdDeDVDWXMx?=
 =?utf-8?B?bjh1MVVNZUpaTG5XU0lDZERuZFpiR2IvZi9XRWY3Q0VpeUsvMnJOWjNxWjc5?=
 =?utf-8?B?ZVUzaXRQOExCTnpPbkRTU1psWU5mN0FTQzFMSkhjMzlZcElLKzlyZldkOGhu?=
 =?utf-8?B?MlZObGd2TVFVQjNTWTM2Z1lMVndoakQrVU5pZ3F1YmdDZEpqK2J1QW9FNENl?=
 =?utf-8?B?S3VhMDNGdktGVkF5ejRaaDJXNTV4ejEzT3Vja3d2dXBJZjZSSEhJL2NPTDl4?=
 =?utf-8?B?Z2x4UE1SRDNNWExGSHFOOWhCVUdxVzVQQ2wxUWhZQjBKdFhvQnQ5amNDMWNF?=
 =?utf-8?B?Q1NiQis1U29qQXAwbjE5WEpsUDlDZzRyd29yNENDSVd1Z0lsSXdvYWNiNVVt?=
 =?utf-8?B?NTVGbjV2QU8wemtyQnRYV3IxV3BZNGxjMld6VjhpSXVHRjdjeVJwYy9GRWVa?=
 =?utf-8?B?SjloNm83b2pXRklsNTRxbGdTaTdEZUVTUFI4SVRJVWxvQndyNm9Yb3hwUkhJ?=
 =?utf-8?B?MktGNHM4RkJBbWVmUVplL0YzSHNiWVJwVXViOFpPZ2ExSWVMT2wwazFZTUJy?=
 =?utf-8?B?MXB2YXpnS2RjTGwxVGVyZDl0OGVpTW5WQWNKaktGSW1rUkhlNmtVSEF5K3Iv?=
 =?utf-8?B?UHRQb0MxM1JPRkZGUnp2WS9Vdnl1UithRWZlaHhtQ2R3N1JDWGY5RGgxTXJF?=
 =?utf-8?B?SzZzcHB6dCt2cDJ3MDBwYnZmYmtrOS9RWWlOMW5wSG9VODl1NWdyNEdFMWll?=
 =?utf-8?B?Um40OElWdC9MczF2ZGdHNzdMaGV5cGhCVHBodlAzdExOSjZvbWV0RTl1Q1Vj?=
 =?utf-8?B?bU9DM21Xd3dIVzY3OHpCc0x5U2pDdDlpaTBJblV3YU9jaC91bjN0SHphczlF?=
 =?utf-8?Q?Phlyoan5sQQr4OjA=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d97715a-3f17-4330-dec1-08de51967829
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 04:53:04.4934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JQgrWDwUYv5HU3Ozt/wLLCEJhwPfBQKyserNDo9balmFnSPeaT8KDtjTJa5wmH/hjRtYSuj/KkOOafgYmmlK8211wh+lDOZixi/LFiRi8KA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6487
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: kHqW_IGh01xyNDq2JnrQMjEGECv5jVz8
X-Authority-Analysis: v=2.4 cv=e5ULiKp/ c=1 sm=1 tr=0 ts=69647e33 cx=c_pps
 a=9jnBlOlZf5MLgdYWwawaCQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=I4K2yCkWg9ToUO_6_BMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDAzOCBTYWx0ZWRfX9vXze0YUmtHf
 dNVBnPoYwgSAaYnknPyOfkhckm50ftZBxFnFnKzLIvTa8wCpZ2d+IL3N7Vxzt5O0k8NpHMB9huk
 2mqoXA/i0zy9GugmS3aHfK3hz3xc1Rq62hCu49pAq+Y84nhleX9LEcCZ/zKD8WtTjp/s8nI0ibo
 iRQnM6QgFJrO14j7gcoJp6Zd4ONOfj/Xu9NIC79hGlxswKON0y3Jps7FlJBnGRMpaqfBwCf2O0K
 BAsTm4TxcT+BJsDgo2CQsNvE3jvXms0MN9ZvSFr+b/8bvxgrEujriQl+MVP5CmxO/6F6RyHN8Rz
 /fUn0Tq/ofJPcvKiEsUn3i97/Q5R3chPdlmO+LcHFPlS8IicErEgIVUTRcbrQyiQEHAHq+EQD1r
 Y9MhDYieAvtg3ohIkMV4hzbf7c2hAPe2J6bhs9BR9vwNa3oAf/wpyqkWXSVqIQMi0U0OezZiFRb
 BmW1rEW0rdZnrzjTg2w==
X-Proofpoint-ORIG-GUID: c2yTrXNrhoW0nvw1fapgfOQyfskDESEX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120038
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 60C4nJrZ746204
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 04:53:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229183


On 1/8/26 18:10, Ross Burton wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On 6 Jan 2026, at 01:15, Changqing Li via lists.openembedded.org <chang=
qing.li=3Dwindriver.com@lists.openembedded.org> wrote:
>>
>> On 1/6/26 02:08, Ross Burton wrote:
>>> CAUTION: This email comes from a non Wind River email account!
>>> Do not click links or open attachments unless you recognize the sende=
r and know the content is safe.
>>>
>>> On 22 Dec 2025, at 03:24, Changqing Li via lists.openembedded.org <ch=
angqing.li=3Dwindriver.com@lists.openembedded.org> wrote:
>>>
>>>> From: Changqing Li <changqing.li@windriver.com>
>>>>
>>>> This is for fixing the following error of 'bitbake meta-go-toolchain=
'
>>>> when multilib is enabled:
>>>> Error: Transaction test error:
>>>> file /usr/bin/go conflicts between attempted installs of go-1.25.4-r=
0.x86_64_v3 and lib32-go-1.25.4-r0.core2_32
>>>> file /usr/bin/gofmt conflicts between attempted installs of go-1.25.=
4-r0.x86_64_v3 and lib32-go-1.25.4-r0.core2_32
>>>>
>>> Why would you do this though? We don=E2=80=99t support installing bas=
h and lib32-bash either.
>> Hi, Ross
>> The issue reproduced when multilib is enabled globally in local.conf b=
y following config:
>> ```
>> require conf/multilib.conf
>> MULTILIBS ?=3D "multilib:lib32"
>> DEFAULTTUNE:virtclass-multilib-lib32 ?=3D "core2-32"
>> ```
>> bitbake meta-go-toolchain will failed with above failure.
>>
>> [snip of meta-go-toolchain.bb]
>> TOOLCHAIN_TARGET_TASK:append =3D " \ ${@multilib_pkg_extend(d, 'packag=
egroup-go-sdk-target')} \ "
>> [snip of meta-go-toolchain.bb]
>>
>> go is in packagegroup-go-sdk-target,  it is extended by multilib_pkg_e=
xtend.  so both go and lib32-go will be installed.
>> go is added in to packagegroup-go-sdk-target for providing entire tool=
chain include compiler.
> Maybe the packagegroup shouldn=E2=80=99t be doing that expansion then?

We don't want go to be extended, but packagegroup-go-sdk-target not only =
include go, it also includes go-runtime/go-runtime-dev, we need to extend=
 go-runtime/go-runtime-dev.

so fix go packaging for multilib as this patch to avoid the conflicts iss=
ue.

//Changqing

>
> Ross

