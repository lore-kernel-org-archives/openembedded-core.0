Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AD72CCFA00
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 08:38:21 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.87])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13329.1762245490871860785
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Nov 2025 00:38:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@vaisala.com header.s=selector1 header.b=w8NEqXhd;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 52.101.69.87, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YzmQu6+XWV3TfS0lxx9XnK5rOb8Him9ENt1BxvgxBF7TqOGVLhQdsJN3OZHyEaF/8fOHGn2uZ1r2+QFoJPxHDICeTb8ejMSFFC8bWeDCM77560KK0SgCl7/hNu9Rjl6rteOJX6DqLILsBmkyYsdcFz9SMuBe9GViBQTr2MckO+Tpg/5I7+JhmoRctNdXAn7U401ZkX4gogiIJWHBH2XyJHMAvfPqN0xHz+PJ40LG6u+4ShT5gyX0NLHEo1ADQntACzNTDu43r8x3EAq/9Ij2EuleDTk7zyhy0dAiXAn83rhobz1Okfhvj0aa41U/AOK8cCr29+OwjXC5K/O0D+8JeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wQ33Df1GBwAD2k+1D0uIZOFQFtVQCtzO9gNwD27cRHY=;
 b=gn99Qom4FHKPb0FtnAGjAeOGxjcl/gBCuMf9pmnhagurrjB/yI8L9zv6e24EIkNGS6Y1KWZs/mpSKKwvwZDnTTOrV5o4J5eXCYZrZxZiNbJeOo0BP3yh7Ei2G1Z4lLAKAhcm5309p9QyJP8+8GvJ/OrXx7tVKrfBfY78kYJuXBRtPKH3yomWSebdFyvlRB0HdGRxmc4LMuiiRj1J11upqiPu6hAlEbmmn/fWwtXYlG1dqjRIaot9hH4zoOsyEj/Ogmn7nDcPQbel1wBQ369s1FVCdyvXHqn/J2Cs6PoCv+NCWMCyZuMyd0rISx7oXyfUDCGTXWIjg/hgcAAQFLzNaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wQ33Df1GBwAD2k+1D0uIZOFQFtVQCtzO9gNwD27cRHY=;
 b=w8NEqXhdK11ea1khrk2pjEnziD2QpZYcCAJTDti3FgB4CTTq+ye6g6zC5CsUn8M0YtJ06Rzetp8xWol+apSolztGKVlC4Lwr4VKHj+mUSSFY3YibPR5HFzWgNVfDj0FvnD88zCRoeycOQQSt4+xTJ8u9bS+1DADOv9dAvykMkhkv7lR6ToV4bxeaIrm98Mf1gr50oZcd1wU3IYNqkjtIuBzDjtPR9RLn8jMUecXCDU5VRPe2Ovz323QZYVzuhNe/zUpLGAtb8RitUU9ItOqgy2s22FgGs6+lhMjD0vNlXv9vzXNY3Iukqqx4MjznWerYyuzereFEl+Q3n0yvGLZnvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by GVXPR06MB8876.eurprd06.prod.outlook.com (2603:10a6:150:11b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 08:38:06 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 08:38:05 +0000
Message-ID: <5b0a6b8b-73dd-45d6-a29f-ba856a14579b@vaisala.com>
Date: Tue, 4 Nov 2025 10:38:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] cve-update: Drop obsolete NVD1 support
To: "Marko, Peter" <Peter.Marko@siemens.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: "ross.burton@arm.com" <ross.burton@arm.com>,
 "rybczynska@gmail.com" <rybczynska@gmail.com>
References: <20251103143157.315178-1-niko.mauno@vaisala.com>
 <20251103143157.315178-3-niko.mauno@vaisala.com>
 <AS1PR10MB56971268C925EB139090781BFDC7A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Niko Mauno <niko.mauno@vaisala.com>
In-Reply-To: <AS1PR10MB56971268C925EB139090781BFDC7A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: GV3PEPF00007A89.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::619) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|GVXPR06MB8876:EE_
X-MS-Office365-Filtering-Correlation-Id: 55b01d64-12bf-4658-e8bc-08de1b7d7951
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WkdEaUN4TzFyT0x4dDFzSCtJTWwyeVpBNk5Kcnc4aDFnYWpaOVUrR3ZLS2xV?=
 =?utf-8?B?QitqTlZPOUhqWlJkVUFRTmJ6aGxNZDc1QnBVN2hKV2dUN0ZIeDVhNmp6cXl2?=
 =?utf-8?B?MExVSy9sTkM0MGJEQlJ4cm9HMmt5ZWN2TThuVnNubFRPbFpWaktsU1ZXT3kv?=
 =?utf-8?B?WFA3TU5ubThodEhlbm9uMjUxeEV0RURROW52NkdDbGE4TVRCZHduREUxZkxk?=
 =?utf-8?B?RHZ0allyN3FLOG1KUmduc29zMzJHMWV6UnFDVXFNZjlOaDRZOWNYRWRMbFVn?=
 =?utf-8?B?MmRPRGxqaFZkdGE3WTBOd0M4YmpmY2pFckFPZXByaGU3NGpKdlF0VnptdTNu?=
 =?utf-8?B?aGlkN3JRUE1YbTVLUENTK0ZyS29NV1lhMFlEcklIdEFQb2hodUlZK0ptbHNR?=
 =?utf-8?B?Q3JOYUsrRGg0eGVPOEd6cHlOREtLMkg5WExxYjZKV2VXdWxXNW92Z3gvdVJO?=
 =?utf-8?B?RWYxLy9EV3dwYXlkWUFYY09PcUxlRGZKK0xzdVR1OTVQZmplQlMybE4zMXQr?=
 =?utf-8?B?UjBMREhjZXo0Tlo2NXRVSkJRTzVWeVBoaW1yYzVtN0pEVHJmUWhrMkpaZC9M?=
 =?utf-8?B?blgwMXAzMGlUZ0VvYW9VdDVTUzcxNExhdWJTcXdJL0FTajVHcGJ6cDhHb2Vr?=
 =?utf-8?B?UTMxK2NuR3hZQUN2ZkowNXFIeTIxSjhhbGx3WVNzSUpuTEhoT0pYMDB4OFdh?=
 =?utf-8?B?YUpFMG02WGFZZzZDdkJkZmt3Z3g5TWZRQ2ttRTMyc2I2YjdtazNpRUxzUGM2?=
 =?utf-8?B?dGFsMTNqQ1ZlaVZjcHg4SnVFMHZZRVAvd1ZtS0lKMVRwOFJzNk0vZ2RZZ1BW?=
 =?utf-8?B?NFFDMmlvS0hwdkZkWjkvVHN5MzhrdVFZNFpNd2JlYytWMDk2dWRBT2wxQWV2?=
 =?utf-8?B?emp5NDR3dFE0cTdYVkpHUzN4ZVhOc1c0amx1WTV5MWwyR0hsc3dLOXcwV1VC?=
 =?utf-8?B?UFY5YlhHbGZUbXB5WFJJc3d2M3NneFBUN0czVGRhWHczcElJUkFFM0FWMHBj?=
 =?utf-8?B?T2hoN2JCMjdWMncwM29vTUtFY0s2bTZON0cvOUdFVFFmamhsbG5RVHVmaGpk?=
 =?utf-8?B?Q0VyNTFSZGxHQW5pd0Jzb2h4Q0xYUStldWpiU3QvbnJQd3R1ZVpWaDkyNlJi?=
 =?utf-8?B?Z0E2ZEhLaW9MamJ3WENFUGIwNUhsNURFYzZxRG5kMnZnSC9nT2t0K0NMa3VH?=
 =?utf-8?B?djViRitQZ2Z6K2JvY0poQU5JT2F0YXJ2dE5LL28wei9OdGhyV1ZsRFV3bVpF?=
 =?utf-8?B?THNyVTl6WldDNngrQ20yMlorUisxT3JEVGFURkJCaFp4MW4wV3BpMWxNZUZ5?=
 =?utf-8?B?RFBxaWpJeXZ5aURIeFlMQ3lURkI3VEgwRFZaZzFMVm52S3hFcXl2OG0xNG5v?=
 =?utf-8?B?VWpyUTBhSnVGdVZKNXlNYVU0Z2RZdHdIOSt6NVFFWTREdVpUMEVFTW5ZNDVz?=
 =?utf-8?B?Kytldy9USXlsLzBpNEdMbnFTc3ZRNGc3WGMwVmZXSGZkYStuRHBBL3pTZVdI?=
 =?utf-8?B?K1pzZSswYnVUK0F5M1J4YVUxSm1sR0pUU3RkOWNtOUc3bTJkMXhlM09xL1Fx?=
 =?utf-8?B?bHh2d2FaSm5KdWdpaDU3S2JMaTNwSlExc1BOcHR3VkhXOEFqR05KalBVQlBX?=
 =?utf-8?B?a00vL3NZUXpnQStKYmR1VmE2cngvbVNCamtPREgwYTBSNkU3TGF5QWJrajhu?=
 =?utf-8?B?bHYzVWVhVHpIcUxocVl3dzltUm9xQWFaOXVYSTNVSGdWNmwvR1l0ODFMOW5B?=
 =?utf-8?B?Yjd2Z2tVdFdhdXR4L1pSeGg4YW8xSCtVMlZ4TUdkOEpLWUlwbEtDYVE5ckVO?=
 =?utf-8?B?RXQ4eERVd3BJdXNWRnZYYTE2aVl0eUs2WHhWZ0luMi91NXROWUFYUGl1QnFy?=
 =?utf-8?B?RFI5L1N4ZjhBWHpIaTFRRG9vaG4xcmx3OHMwb3FiZXhRcVNEdWdHY1pLVlEr?=
 =?utf-8?B?bENJRXEzNVlKQTk2THZpUVd4T0ttc0JtRUpVSEU0ME42MFplSkwwN0JSaVNE?=
 =?utf-8?B?NVZiWmxlRW5nPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZEtUY1V3TjNzaFFDNzlZbTVDWHNRTC9XeTVXR0NVREI0UGtzYjlhUXRDcHZn?=
 =?utf-8?B?a3Bhd1dmVGxxZXpkQ0JxeWRRdW9ZVzZHZUNHSTc2Y01vMDEvK2xGaUlaY3RO?=
 =?utf-8?B?SExYQm5FN3FyazM0UjQwQTdXNG5vZFpoSjA5OEIrc2h6WEh0bk9DbGVuVDFh?=
 =?utf-8?B?ZHdqNFZhTCtRZjFaeU9RY3hGbVBFYytkYzcwU1hBbUdzTHp3N0RpMlZDbjgv?=
 =?utf-8?B?NlIyVGVaalBrTzVDUW1UdXVIb21CK2cvc0t4WkNBM0lubnF3UDlzWklMalRl?=
 =?utf-8?B?VWNiMWNaNUlBSXE1MlNRNTFvVWdyYkV3WnNidXB4bDBrTEpJSWR6SXVsUVRL?=
 =?utf-8?B?Zmg1VzVrd3gwdGMrRi85UTR0L0JjNzVSOWdEWWdrNERka2krOSt1a3VZbjBH?=
 =?utf-8?B?V1dabXd5dzZOVmpuN1BHZVVPdGFkZG1aYzRSK1ppWGJmaVBRVFhyckFrVmZj?=
 =?utf-8?B?aUlpY05JT0Yrb3UvMEF6UitzeU85OHRTcXpIeDhYK3hiTExRR0VFc1lOQjJ0?=
 =?utf-8?B?SkovVUtkcmtNQ09mdWhXVkVUZVBkVExyaWNmcFVTTzNiS3lWbTQ5M3drcWlo?=
 =?utf-8?B?bjZoeTdMYVpldkVacVlGdy9Ya0JxNEtNMGM3QmpNeVV6YlU2dDN6QzhudGh1?=
 =?utf-8?B?alYxOWdtWTBEVDhWU2k0a3BWdjdaZEtzTWVWZ2prbkQycHg5YzZMUU1wVlB6?=
 =?utf-8?B?dFFGek1ydjRoc3huVThYTUJ1UXJlQlBFVzJkZDIzNnN5MFZxUXpiMmk5MTlS?=
 =?utf-8?B?VU9pR3F4WGtwQTkxTEVlOUhkbEJXSFJVd1J4TStXYzNXczFLUmpjRjhwZisr?=
 =?utf-8?B?Qmx3OEFHcWQ4UUlQWHNHSFg3S2hid25PcDVhZUF5dU01RXdNWHRGSG1EWFN4?=
 =?utf-8?B?NW9VK0pVU2NpMDdmOEZkYTQzMGVMZlZOei8xTnMvQUE3WnhmdUhkYmxBWGFa?=
 =?utf-8?B?cVlMWFIxMjI1Q1NxNHc5QktadENRN2pPNEd0Ym1mUTRUeVU2YkplUVBxanBp?=
 =?utf-8?B?ZWwrRFNrdkVuRVFqYzVvUk1OSlNKRXczS3FweUxKaVowS1NVU3AzL1orL2xr?=
 =?utf-8?B?NnlScjQ5Tm1acVg4eWlCZ1JrSDhCdW9JdS9XaUZwWEVabE9ibGtoMklqcktS?=
 =?utf-8?B?dWhScEFaa3B3WDlRVTJGSWY4Yk1XczNPdnliKy96QWY2K0p2Nmh0c3BhMzVR?=
 =?utf-8?B?Nndib3RoQmx1cnVZVmxndmk2bWFjQXZXZDJiSS9YWTdKQTFlQSt5QnBoQlJo?=
 =?utf-8?B?UW13SlJRM2JSUXpNT1hDU2VHUE1kaWhVVURLeStERnRUYkVkZGFPWjltUkoy?=
 =?utf-8?B?UGNMZFBLN0ZITFdjSysySkkyVk9oSFAwUWhjWHlJMkZWYncydnY3TlNFY2NV?=
 =?utf-8?B?Yko2YXhCajJHWkRtbG9xdUpCSHR3c0UvTU1GeU1KY1dkNzNJdThxK2FaZkQ0?=
 =?utf-8?B?TURxTE55U3dzeHVHK2tiYUNwa0RCZHlYME5ydUduRmRib1RsOUY2MHFRUitK?=
 =?utf-8?B?ZE44WUpFZndyd3l2b2ZiOUdYWTM5d0xEOElJOEZqVzZFTldieFcyTEFzVGpu?=
 =?utf-8?B?cTlmNndRNmtEc3lhaGozM0F3c0QrSG9kNVN1OG40a3dDSmg1ZDAvdGZHS25o?=
 =?utf-8?B?SG1oZGRzOEJ5dkMyYzUvMVR0SjROSmtoYnpVNE81c3piS1E1VFVTb1hIbHVD?=
 =?utf-8?B?OFg2M0NPUVBkNjNKQ3Jra1lBMFhjaWRZMnZ5VW53OHJncGxicnF2dFo0TldD?=
 =?utf-8?B?TDNyWVd2SnRKaEtWZklKc2R6c3BZOEQ1bjB6RW1sSFRMVGNaZERwZXJ0dG1w?=
 =?utf-8?B?Z2FWczNNR2RKQkZzall2bGxpalJZZXIwK3J5cDNmcjZVRjNLYmwyc1Z4NnU4?=
 =?utf-8?B?YUZveFViSW0vamdqdWROb0d1YmdXb3M0NzJ3N3lzMmtxZU5TaGlyc1h6aXk1?=
 =?utf-8?B?R3hZcmR1VVJwR0ZwS1VLQ3hFeFlHRi9uWCtYRDlzMkwyWHZEVDBKRlY0UmhI?=
 =?utf-8?B?d0dtbkxLRGV6bzZCcFlNZVAzbDNOdlViRVhXZ0dxUmgvOWg1QnhGeTAxeDll?=
 =?utf-8?B?VTlsN2ZWWG01czdSUStRVkIrbE5jamhua1dYQmpSc1MrMy91TkptSm4wQmtQ?=
 =?utf-8?B?bkNHRjF0aUhHMWo4bkFDUnFjODVyR0hkYmJ1ODJ0WkFRclhiL3Z5WUFDYVZS?=
 =?utf-8?B?ZUE9PQ==?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55b01d64-12bf-4658-e8bc-08de1b7d7951
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 08:38:05.6290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0CsIHSZRFWi1rT7qQM8KGfTCLT7l1Let0nytwDOzqcIFGlsYJFVFWuBFwUDzeSPDCb4PClfv1/FRmI106kYQqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR06MB8876
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 08:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225718



On 11/3/25 17:26, Marko, Peter wrote:
> This should be commented on by Marta, I'm not sure if she brought this back even though it was not working anymore.
> In case it's accepted, contribution to yocto-docs should follow.
> 
> Peter
> 

Thanks for pointing this out Peter, I'll make a note to submit also relevant changes to yocto-docs as needed.
-Niko

>> -----Original Message-----
>> From: Niko Mauno <niko.mauno@vaisala.com>
>> Sent: Monday, November 3, 2025 15:32
>> To: openembedded-core@lists.openembedded.org
>> Cc: ross.burton@arm.com; rybczynska@gmail.com; Marko, Peter (FT D EU SK
>> BFS1) <Peter.Marko@siemens.com>; Niko Mauno <niko.mauno@vaisala.com>
>> Subject: [PATCH 3/5] cve-update: Drop obsolete NVD1 support
>>
>> Since enabling NVD1 as NVD_DB_VERSION nowadays leads to BitBake failure
>>
>>    WARNING: cve-update-db-native-1.0-r0 do_fetch: Failed to fetch CVE data (HTTP
>> Error 403: Forbidden)
>>    WARNING: cve-update-db-native-1.0-r0 do_fetch: Host IPs are 172.65.90.26,
>> 172.65.90.25, 172.65.90.24, 172.65.90.27, 2606:4700:78::90:0:180,
>> 2606:4700:78::90:0:183, 2606:4700:78::90:0:181, 2606:4700:78::90:0:182
>>    WARNING: cve-update-db-native-1.0-r0 do_fetch: CVE database update failed
>>    ERROR: cve-update-db-native-1.0-r0 do_unpack: Error executing a python
>> function in exec_func_python() autogenerated:
>>
>> Remove the support for obsolete NVD1.
>>
>> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
>> ---
>>   meta/classes/cve-check.bbclass                |  8 +-
>>   .../recipes-core/meta/cve-update-db-native.bb | 87 +++----------------
>>   2 files changed, 15 insertions(+), 80 deletions(-)
>>
>> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
>> index c63ebd56e1..259c699af2 100644
>> --- a/meta/classes/cve-check.bbclass
>> +++ b/meta/classes/cve-check.bbclass
>> @@ -31,11 +31,11 @@
>>   CVE_PRODUCT ??= "${BPN}"
>>   CVE_VERSION ??= "${PV}"
>>
>> -# Possible database sources: NVD1, NVD2, FKIE
>> +# Possible database sources: NVD2, FKIE
>>   NVD_DB_VERSION ?= "FKIE"
>>
>>   # Use different file names for each database source, as they synchronize at
>> different moments, so may be slightly different
>> -CVE_CHECK_DB_FILENAME ?= "${@'nvdcve_2-2.db' if
>> d.getVar('NVD_DB_VERSION') == 'NVD2' else 'nvdcve_1-3.db' if
>> d.getVar('NVD_DB_VERSION') == 'NVD1' else 'nvdfkie_1-1.db'}"
>> +CVE_CHECK_DB_FILENAME ?= "${@'nvdcve_2-2.db' if
>> d.getVar('NVD_DB_VERSION') == 'NVD2' else 'nvdfkie_1-1.db'}"
>>   CVE_CHECK_DB_FETCHER ?= "${@'cve-update-nvd2-native' if
>> d.getVar('NVD_DB_VERSION') == 'NVD2' else 'cve-update-db-native'}"
>>   CVE_CHECK_DB_DIR ?= "${STAGING_DIR}/CVE_CHECK"
>>   CVE_CHECK_DB_FILE ?=
>> "${CVE_CHECK_DB_DIR}/${CVE_CHECK_DB_FILENAME}"
>> @@ -108,8 +108,8 @@ python () {
>>       extend_cve_status(d)
>>
>>       nvd_database_type = d.getVar("NVD_DB_VERSION")
>> -    if nvd_database_type not in ("NVD1", "NVD2", "FKIE"):
>> -        bb.erroronce("Malformed NVD_DB_VERSION, must be one of: NVD1,
>> NVD2, FKIE. Defaulting to NVD2")
>> +    if nvd_database_type not in ("NVD2", "FKIE"):
>> +        bb.erroronce("Malformed NVD_DB_VERSION, must be one of: NVD2,
>> FKIE. Defaulting to NVD2")
>>           d.setVar("NVD_DB_VERSION", "NVD2")
>>   }
>>
>> diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-
>> core/meta/cve-update-db-native.bb
>> index 3a6dc95580..4423216be5 100644
>> --- a/meta/recipes-core/meta/cve-update-db-native.bb
>> +++ b/meta/recipes-core/meta/cve-update-db-native.bb
>> @@ -11,7 +11,6 @@ deltask do_compile
>>   deltask do_install
>>   deltask do_populate_sysroot
>>
>> -NVDCVE_URL ?= "https://nvd.nist.gov/feeds/json/cve/1.1/nvdcve-1.1-"
>>   FKIE_URL ?= "https://github.com/fkie-cad/nvd-json-data-
>> feeds/releases/latest/download/CVE-"
>>
>>   # CVE database update interval, in seconds. By default: once a day (23*60*60).
>> @@ -108,30 +107,12 @@ def cleanup_db_download(db_tmp_file):
>>       if os.path.exists(db_tmp_file):
>>           os.remove(db_tmp_file)
>>
>> -def db_file_names(d, year, is_nvd):
>> -    if is_nvd:
>> -        year_url = d.getVar('NVDCVE_URL') + str(year)
>> -        meta_url = year_url + ".meta"
>> -        json_url = year_url + ".json.gz"
>> -        return json_url, meta_url
>> +def db_file_names(d, year):
>>       year_url = d.getVar('FKIE_URL') + str(year)
>>       meta_url = year_url + ".meta"
>>       json_url = year_url + ".json.xz"
>>       return json_url, meta_url
>>
>> -def host_db_name(d, is_nvd):
>> -    if is_nvd:
>> -        return "nvd.nist.gov"
>> -    return "github.com"
>> -
>> -def db_decompress(d, data, is_nvd):
>> -    import gzip, lzma
>> -
>> -    if is_nvd:
>> -        return gzip.decompress(data).decode('utf-8')
>> -    # otherwise
>> -    return lzma.decompress(data)
>> -
>>   def update_db_file(db_tmp_file, d):
>>       """
>>       Update the given database file
>> @@ -139,12 +120,12 @@ def update_db_file(db_tmp_file, d):
>>       import bb.progress
>>       import bb.utils
>>       from datetime import date
>> +    import lzma
>>       import sqlite3
>>       import urllib
>>
>>       YEAR_START = 2002
>>       cve_socket_timeout = int(d.getVar("CVE_SOCKET_TIMEOUT"))
>> -    is_nvd = d.getVar("NVD_DB_VERSION") == "NVD1"
>>
>>       # Connect to database
>>       conn = sqlite3.connect(db_tmp_file)
>> @@ -155,7 +136,7 @@ def update_db_file(db_tmp_file, d):
>>           for i, year in enumerate(range(YEAR_START, date.today().year + 1)):
>>               bb.note("Updating %d" % year)
>>               ph.update((float(i + 1) / total_years) * 100)
>> -            json_url, meta_url = db_file_names(d, year, is_nvd)
>> +            json_url, meta_url = db_file_names(d, year)
>>
>>               # Retrieve meta last modified date
>>               try:
>> @@ -164,7 +145,7 @@ def update_db_file(db_tmp_file, d):
>>                   cve_f.write('Warning: CVE db update error, Unable to fetch CVE
>> data.\n\n')
>>                   bb.warn("Failed to fetch CVE data (%s)" % e)
>>                   import socket
>> -                result = socket.getaddrinfo(host_db_name(d, is_nvd), 443,
>> proto=socket.IPPROTO_TCP)
>> +                result = socket.getaddrinfo("github.com", 443,
>> proto=socket.IPPROTO_TCP)
>>                   bb.warn("Host IPs are %s" % (", ".join(t[4][0] for t in result)))
>>                   return False
>>
>> @@ -192,7 +173,7 @@ def update_db_file(db_tmp_file, d):
>>                   try:
>>                       response = urllib.request.urlopen(json_url,
>> timeout=cve_socket_timeout)
>>                       if response:
>> -                        update_db(d, conn, db_decompress(d, response.read(), is_nvd))
>> +                        update_db(conn, lzma.decompress(response.read()))
>>                       conn.execute("insert or replace into META values (?, ?)", [year,
>> last_modified]).close()
>>                   except urllib.error.URLError as e:
>>                       cve_f.write('Warning: CVE db update error, CVE data is
>> outdated.\n\n')
>> @@ -224,17 +205,14 @@ def initialize_db(conn):
>>
>>           c.close()
>>
>> -def parse_node_and_insert(conn, node, cveId, is_nvd):
>> +def parse_node_and_insert(conn, node, cveId):
>>       # Parse children node if needed
>>       for child in node.get('children', ()):
>> -        parse_node_and_insert(conn, child, cveId, is_nvd)
>> +        parse_node_and_insert(conn, child, cveId)
>>
>> -    def cpe_generator(is_nvd):
>> +    def cpe_generator():
>>           match_string = "cpeMatch"
>>           cpe_string = 'criteria'
>> -        if is_nvd:
>> -            match_string = "cpe_match"
>> -            cpe_string = 'cpe23Uri'
>>
>>           for cpe in node.get(match_string, ()):
>>               if not cpe['vulnerable']:
>> @@ -290,44 +268,7 @@ def parse_node_and_insert(conn, node, cveId, is_nvd):
>>                       # Save processing by representing as -.
>>                       yield [cveId, vendor, product, '-', '', '', '']
>>
>> -    conn.executemany("insert into PRODUCTS values (?, ?, ?, ?, ?, ?, ?)",
>> cpe_generator(is_nvd)).close()
>> -
>> -def update_db_nvdjson(conn, jsondata):
>> -    import json
>> -    root = json.loads(jsondata)
>> -
>> -    for elt in root['CVE_Items']:
>> -        if not elt['impact']:
>> -            continue
>> -
>> -        accessVector = None
>> -        vectorString = None
>> -        cvssv2 = 0.0
>> -        cvssv3 = 0.0
>> -        cvssv4 = 0.0
>> -        cveId = elt['cve']['CVE_data_meta']['ID']
>> -        cveDesc = elt['cve']['description']['description_data'][0]['value']
>> -        date = elt['lastModifiedDate']
>> -        try:
>> -            accessVector = elt['impact']['baseMetricV2']['cvssV2']['accessVector']
>> -            vectorString = elt['impact']['baseMetricV2']['cvssV2']['vectorString']
>> -            cvssv2 = elt['impact']['baseMetricV2']['cvssV2']['baseScore']
>> -        except KeyError:
>> -            cvssv2 = 0.0
>> -        try:
>> -            accessVector = accessVector or
>> elt['impact']['baseMetricV3']['cvssV3']['attackVector']
>> -            vectorString = vectorString or
>> elt['impact']['baseMetricV3']['cvssV3']['vectorString']
>> -            cvssv3 = elt['impact']['baseMetricV3']['cvssV3']['baseScore']
>> -        except KeyError:
>> -            accessVector = accessVector or "UNKNOWN"
>> -            cvssv3 = 0.0
>> -
>> -        conn.execute("insert or replace into NVD values (?, ?, ?, ?, ?, ?, ?, ?)",
>> -                [cveId, cveDesc, cvssv2, cvssv3, cvssv4, date, accessVector,
>> vectorString]).close()
>> -
>> -        configurations = elt['configurations']['nodes']
>> -        for config in configurations:
>> -            parse_node_and_insert(conn, config, cveId, True)
>> +    conn.executemany("insert into PRODUCTS values (?, ?, ?, ?, ?, ?, ?)",
>> cpe_generator()).close()
>>
>>   def get_metric_entry(metric):
>>       primaries = [c for c in metric if c['type'] == "Primary"]
>> @@ -338,7 +279,7 @@ def get_metric_entry(metric):
>>           return secondaries[0]
>>       return None
>>
>> -def update_db_fkie(conn, jsondata):
>> +def update_db(conn, jsondata):
>>       import json
>>       root = json.loads(jsondata)
>>
>> @@ -403,13 +344,7 @@ def update_db_fkie(conn, jsondata):
>>           for config in elt['configurations']:
>>               # This is suboptimal as it doesn't handle AND/OR and negate, but is
>> better than nothing
>>               for node in config.get("nodes") or []:
>> -                parse_node_and_insert(conn, node, cveId, False)
>> -
>> -def update_db(d, conn, jsondata):
>> -    if (d.getVar("NVD_DB_VERSION") == "FKIE"):
>> -        return update_db_fkie(conn, jsondata)
>> -    else:
>> -        return update_db_nvdjson(conn, jsondata)
>> +                parse_node_and_insert(conn, node, cveId)
>>
>>   do_fetch[nostamp] = "1"
>>
>> --
>> 2.47.3
> 


