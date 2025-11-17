Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FCBDCCD19A
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 01:22:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6590.1763342532842425684
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Nov 2025 17:22:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Bl9/WTh3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=34165bd6f8=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH0w7Ql202386
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Nov 2025 17:22:12 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=0TP2SiOvmIZMhRO8DdWChi8XDvdAtR2Po3HkfAbRJ1Y=; b=Bl9/WTh3NWDC
	Qss42bR4/sOzi52lmtSw37RhiYPrGBE0Id+B/5avSQ4Dj/ehoyozk2t0/82sl9j9
	YjubsX8i22ZE9uAS5XI34KmpbJ36WlFa4moxTPFWBZbbpYXA77AEFRapW2aIEPmd
	V6Han9F37+JsQFv8QCTh1LuWHVqDOD6EsugtBkbIeUxXAl/VsReybHZCautBWzK4
	zq3Mt6cd/Jb4BuuntfLJnJQs5B0stfHTWV2zJJP0hn2GsUQw5RuZ2WqluWvK+5on
	Jj9a3Zu6/0lc/auCkwNjWojOsu0tgDUq07j99IHOlMORLhlQcxNynhnhsbIrAqW1
	yoJ1/XAjZA==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010019.outbound.protection.outlook.com [52.101.201.19])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aeswj951u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 16 Nov 2025 17:22:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bvn8Sf4eUkTYrJWFBSv8QBQ9zUs38QWXoC9eIoYH34AblnLX9qzPre76Fb45EKkNac3IMS8np5jM6ZSYM4u8MqNhe5vIR/Encaf+QDfq9Kl/pASfATrZF4GXgJNR/Hjdb0RCtDDHYPpit2Tnh9sRU5vEfeGeh/kvPTIKA8cagDIL/3Kkb8vV7mrM4X/S1+U1GSnccgjZps4P9Ubibz+h8xuOxJcq50o79wb1+fZAMeq57wgPG+C+sgDvM7oJunjDbipFNk4Rtt9KEqQFeArSWTlTzMasjbELr8mwz3Bt52MB1JChiynduAdvwP0Vz9p88HN25cNTu1SzPc0Fvs6ZpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0TP2SiOvmIZMhRO8DdWChi8XDvdAtR2Po3HkfAbRJ1Y=;
 b=D+INk41tovQt1hBOvkCoBfMhM0w8s0oKjRCceiElczgKId8luifqdr/glphVnYvIxDWDMjvhj6zHm+SrHcTNv5Y3ml4ccLBf+uqeaEDg8B6KybTI39HBtZBqUrobWK1eTGevS3C3p+zxbMQsjO3S5LhCJItybNRhpzuFgN/8Lc1aSC04Ohev5Kd+s6Qkv8gBLKPU+z0ta/qe61J7ujpz1mMqj1BWjNYzQuecxf10GpgLazw/tVoL+Rc2hbE5yhZR3SfbGR2LjG/ZCIYIq47dFNzhwcqia8LFfq7J3IvxnwskLGh/f+O5sQbYZUd8wIYm9gpCHONPSLwUw7aMg0gMjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by CY5PR11MB6188.namprd11.prod.outlook.com (2603:10b6:930:24::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 01:22:09 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%5]) with mapi id 15.20.9320.018; Mon, 17 Nov 2025
 01:22:09 +0000
Message-ID: <ca4c0f3e-db98-40b5-93f1-8b3b4cb73629@windriver.com>
Date: Mon, 17 Nov 2025 09:22:03 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/1] buildhistory.bbclass: Warn when PRSERV_HOST
 is not enabled
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <cover.1763295498.git.liezhi.yang@windriver.com>
 <0468feeac5c3c42078b6cf9085f7707de5f09cc9.1763295498.git.liezhi.yang@windriver.com>
 <87cfd519da6bba9636c4f2d0806916fb15179b8d.camel@linuxfoundation.org>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <87cfd519da6bba9636c4f2d0806916fb15179b8d.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TY4P286CA0043.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::10) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|CY5PR11MB6188:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d125500-d897-4ad5-969e-08de2577ba60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cWZRMmRBSWtMT0tZT2tiWW1ZN1UvTjdpcXUxV0VSeXlRM0Jna29sUUFlTzZ6?=
 =?utf-8?B?TmN3dDF2SzBpKzFqc1ZpdTR4RzhlVldrWm1oTCtLVHgzRnBNNmlpWXNYMFlN?=
 =?utf-8?B?aVNncTNsMWNsS1grcGl4ak5Ma1BiTHVQTlZDcG1hWk5lV0RESTM3bHBQb2RE?=
 =?utf-8?B?encreGRXSkxMR2VCaUFZS296OHdZUUN1RnpXczdSem9IRWY5R2NMZHV2OG1L?=
 =?utf-8?B?UFhmVWJ6b1hSbzB3M0oyTnFYelE0c1dsbkdYQVFTVFJSOGRsaXVaZk55VTNt?=
 =?utf-8?B?VEQ4N0RGWWwwODFLVFdCWWcrTTBGdFZ5UERsUE4xc3NSYVNDSjRjTU1JL1Zh?=
 =?utf-8?B?K2dJWWRndnB1eEVneFF6V1BONm4vY3NKRlBoSlA4Ymljcm1Ob0ZUemFDeThR?=
 =?utf-8?B?N1FRaGFVUWtOd3NNRHU1YmFoVkNHVGREQkNINFIzdTdFMXh5NnBJVENEdTJv?=
 =?utf-8?B?UCtGV3ByY0NBQ3k1L2JVM3hhS29ZckNwRnoveGdXQUphV0xkNGx3R1A5Ymxi?=
 =?utf-8?B?c3FyWldlaXg5dENsM05NQUVicXlubDY5eVVrSGN5Qjh1YWR1QWxRRjN0Uzgr?=
 =?utf-8?B?ZFNxeCtLa2Nia1BDelJ1UXBCUnJiNmozRGRVNGNpRmhhSlNRSGpTdkgvc0Vp?=
 =?utf-8?B?cUl2UkMvTDRCMkZ1bFNwUVovSGdKQW1hbkk3MlNmd1pQYnNmQkRubExocTJp?=
 =?utf-8?B?RTBUb0RkSC9mT3BEbkdkZk9aOEtDK09TQ0dpb3JVeUFValp0SnNyaWdjVXlB?=
 =?utf-8?B?MFR5cUpOeVI4NktBdlkycktnRnYrTUVveFVadWpZZi9WRlJhNE5HdktUK2hQ?=
 =?utf-8?B?Nko3UUQyN2YzaGtCSThHZHQ2ZVdoaFlTcC8zWm9TdVlMMWlnY0dOeXJSM3dN?=
 =?utf-8?B?RFlyQURKYkR2ZGtub3p2OTNEeWNyU3Y5c0xYM2pHdmFWSE9jTk5RSGRVWnNX?=
 =?utf-8?B?OGRGSG55cEVxbjkrd1R6K3kvQm1LRkdkbEJsR3EydjVubVpxNVJTdE8rNnNv?=
 =?utf-8?B?eWNvbUVIbExqcjlWUFdMNmVteGdRYmt3VDRJNFJoZG1TMEY0bGxRek1qRW92?=
 =?utf-8?B?Tnh3YjdRTXNtQTlLVGJ1Q3Q1cEhBbWtzWWlUYlFJTXkwUWNvYzdlcHg1a2Yy?=
 =?utf-8?B?QXB0RWFGRDlXTDNJYVh6cy9HWTlWdlAralFyd1l1SWZ4bm5hOVRUTlpDTWN4?=
 =?utf-8?B?TXo4Z2FLditDZytHaTdaTUh3NVZyTWFPU3FqbFZ2OCtPZSttUVRFb1dpTXNa?=
 =?utf-8?B?em8xL1lMR29NUzhVQzZ4dlZiZzhmMHFLVTRaNzcwa0J6SVp5N2VLYWh5elNP?=
 =?utf-8?B?aXN6dDI5OC96cHk4WEZ5a09qQWxDQWRZUXFpWFVxSjlyQVh5eHorV0ZkN2N6?=
 =?utf-8?B?d3lwVGt2TUJsY1gzdkFENEhUZGFLbWtCdXVaRngvelpPbXU5MmxkbWFuVGsr?=
 =?utf-8?B?WEN2TEppK0hMR0F3bkJFSWJ4d1YyeU1SZ1ZFT0Y4QkEweXNvUWlnNkd5Zitj?=
 =?utf-8?B?NTF1LzU3SThXdUE4T0ZKK1l2cGh1ZXY0bExaUGtmS3JLeG9mallLR0I3TWJh?=
 =?utf-8?B?K3JlWWgrZGF0RmRHRjAwS2lmWVBjRkFQUi9ZK1ZGaHE2WG44WWprUHk3TFhv?=
 =?utf-8?B?MVlWYUFreXBlQjd3aWJMSndmN0RUMVZIRklHMGxSa3IrcVMwTG83aU1KelFN?=
 =?utf-8?B?QkRKLzcxUHFEYlFsSGxRVFo4TkdIeEpPdmRkMmtQMEg0bmNWL2RCaFBTMEdu?=
 =?utf-8?B?M0J5U01kaVdXeE04OHp5WXFMajI0MVk5MFlXWlRSZTRYT2FsMHpzblh0WDI4?=
 =?utf-8?B?KzNHemNFWlhWSVZ4TXcvNWgyV2NVZkkwQ2ROaUlrbzJnamEyMmk5WGpEazdv?=
 =?utf-8?B?WTg5amxaSFY3cTZTQjRhT2MySzBlTEFmeEZkZWNjRkNrMFkrNDgwUVgwNWlE?=
 =?utf-8?Q?ckYsWc743W2mzEemd/d3yPvPYU3BcVYJ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eGFNbmNxaStVSjltVkxuVnZwcUY1c25ncWpuMS9rdWUzRWh0SzQ1TkM2aDJq?=
 =?utf-8?B?YjBtTW1TZ0Y5QWIxS1EwT050UGg4TkdjYUxiSXJqTWpERVRHMXVPZnliU09S?=
 =?utf-8?B?d2p4ZGRFUENCZDIrVEIrTkU5bzF2RTRrQVhSQ0sxbTRtQWJhNE1mdEhuL2Y4?=
 =?utf-8?B?S1ZDOXF1b0ZXeTYveGRrUmxXdzV3VzFEYmFiZURmRDdHSXlmMm5sZzVHRDF2?=
 =?utf-8?B?Z3FRNnlOWmsvQlY0NHVKTEJiMHB6S3BmSDB1T1c4RlpRenVVNGpUbWtxbUZ0?=
 =?utf-8?B?UlVuSzBJcDQvRmJPcjJQR1R1TzNWU1RSVTgwZ2xidDEvQnZGKzBRSnRYSlpD?=
 =?utf-8?B?VG1kRmxvaXEvMzZGLzNxNWs2SkNVVGdkNThYd2VxZWlqcGZibmU5T0taKy90?=
 =?utf-8?B?LzB4UHVrY0VEa1cyWXZlOXZsaFBxb2lnckR2V2NkUlAwTTd4anFsWWgxVXZj?=
 =?utf-8?B?c0R1L3JvVFc2V0hIbW5qRkwvTDFacjkxNkZNekRaUGxxbGRVYVZZdUNlbUNn?=
 =?utf-8?B?MXRUL2h4ZzU2U3E5NDU1bnQxNEhyTW9UMi9MdnFpb0pzLzF1QUgxZmpoWlBG?=
 =?utf-8?B?WFVvWEsxNm8vaWJZKzJ6WHBJWVZUNUs0eVczcEo0eHNXQXJhdFdJWkg5TDVQ?=
 =?utf-8?B?dThybVpXTlhVV1UvdFZIeTg1bER0aDU5dEpwM282T0h1MDB2TlVpSDh3bHJC?=
 =?utf-8?B?YmxnZnZlcWdWQUx2ZEFJczRrVklwekc3NU9DWWM5QmxVRkgveEpkcDJMcDZL?=
 =?utf-8?B?L3hsT20rODNWdXVpcWdRbWJZQjdBdHNlcWtadkZMTHZVTEV3bDZxT2dzRnI0?=
 =?utf-8?B?WGVzSDNnbnpXWnhqeE1kMTJLV2hiNDQ2YnVra2gvQ3lMTFFMQ2NiQmVYY3px?=
 =?utf-8?B?YTdmdDNoZHI3dzlvMnRVdTF1ck1tYlNrMWhSNnFlbGplWmtHSVhCd3hPZ0Zu?=
 =?utf-8?B?dEhFSGF1amswS3lyNVRnanJqVzZaUFczYmNnVCsvRU5CT2JPWGUxaFNlMzJS?=
 =?utf-8?B?b0oxRkRiUC8rWFI1bVNKTG4zS3BuNm1FSG80M0ZidU1QeW9oeWNmK3VHZkpU?=
 =?utf-8?B?dExLekpDdXlNUGRGVm9kaG9jcHJ2S2l1MExOR0RWcUROSUxxczNFcXIzUWg3?=
 =?utf-8?B?Q2FNRU1kS21zTkoxR1ZvWTl2em5EOEZnUVM4Y1FGcCtpM0pqbXBPL2JzWFZ6?=
 =?utf-8?B?VENZTlFCTlM5UWtZTG1lYU1Hd2NTUUpaOHUzU3JIRWduRXZTZFdXVFEyVHU5?=
 =?utf-8?B?VU5OWGs2dzJMbUhMREZyMDFJZUZRaGtmMy9DQW4zcm9pdnN0WUhsN1NoYk10?=
 =?utf-8?B?N3l1dnM2QjlZTjhDbVNFWFlSamw0bW9MYkhNVnZiSEZjdkw0NVUxRC9vQ2dW?=
 =?utf-8?B?bjNYYnVQMk93R1dmeVp2TzY5djhxcXVKZzZlSGxYVll4bTZGb3hKdjV5cVB5?=
 =?utf-8?B?aGJSWDQvbzRiK0MyVTZvSU1DZ0lQVUNscUkvL1ExTXpYNzBtR0RTSG42bEo0?=
 =?utf-8?B?TEpUenc1UUc5U3dnTWxneUlMRm9CSCtta3NLdithcnkzaTNsbldiUFhjQzc3?=
 =?utf-8?B?OGVibHpKL1E0QjZoSjltN1I0V0FXQTlOTUVoY28yZ054L3pnay9GLzlyVlA1?=
 =?utf-8?B?akZmSytrWFp4YUkwQit3VU9kT2ZNMnNBd3hhT2FFQXFzdnRJdHhmM2lSN3BE?=
 =?utf-8?B?WjBmVHViUzhXckNDTWlHWjNDRmwwRjFDUlVZcXBkam1YNGIwbGVXOU5kZnQw?=
 =?utf-8?B?UVR3WXNFOVE3YWM1S2k3dGtkVHBvcXRQQzJETG1vWElsWXBMQ1hqREhWMFlB?=
 =?utf-8?B?M3Arc28xNExyREpuK25OUDlCb2NQL1JZL20vakVnejFvdVZ1RjMrdDdhQUdS?=
 =?utf-8?B?WWtqZVdFVEVObFAyS0YvN2xIUitLcktmVDZlVmlEVTBBTWRqbVhyZHRTbDlG?=
 =?utf-8?B?c016QVVPeHZBczMzR1d1WFFzUUQ3UldUS1VmTVhxSUV1TjV4dXlkV2lTUk1Y?=
 =?utf-8?B?NnUvK055Si9UVW5vUGptbHVhekRpb29KclNsbWpDRDREMnQ5OTY1U0ZLYVVz?=
 =?utf-8?B?cHhhamNoZUk0M3kyR1MyeTNlUUpUSjJRV05sSjlEQWh4OCtXeDk4V3h3TWlD?=
 =?utf-8?B?b1JoSm93bzAwOEE3bkRKM0RjL3RmTm8rTnQydnZaOUZ3SVlJbk54S1pyWDUw?=
 =?utf-8?B?VGc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d125500-d897-4ad5-969e-08de2577ba60
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 01:22:09.4539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PDsfOvfN4WCD8/szDM/DFuL2HQnxiwE7MPSPNTM4G8pkTioy1OEqxdVo4IE2sxgEoq/sMjXATpgTzNT2yw/QUh1n+sn5+oqNOm76rxkdZRU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6188
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=BqiQAIX5 c=1 sm=1 tr=0 ts=691a78c4 cx=c_pps
 a=NuF0lfjhaYRYFIRzorixyA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=zj3Ziyof7NP5oS_8ikkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: CQSVETBykzSqAmiHqjLkShXinaxJXBRm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDAwOCBTYWx0ZWRfXycZrh1FqYg0M
 Ft5dNCQppZsZJWuzaPzDGfmuyd84shGjJu1fS/gJoxPaNMln0i/NPhpgHxwx1siGDeb8K+SKOiu
 +CqgDGtlXfExrsBaUYJs//fYAV1wRD3TD3us1ee6qIhBD5R4s8CNQATLujPnnBf5ldM/tKRXe0p
 zWLpk7bNGhA2t+0oAZlEgtG9euw46CHJu35GeZx3A65MMc2qizyfa53ts26T7dz4/CXo8vY04Lp
 3NfC+DxqfcZ+t2f1AzLF99SnYeEbg3ICIAL5JbcyAFfvNsAZdNxR+WvM3k13nyvUDng4g8pqYpH
 UpMeO8Ywl5aN1hApqbFeMKQLNl5l3aYCxdXqnPsSLJLyz50lMQP70qT4c9E95Y92NZ6QV1+XQjv
 GSJn7zs6Q/0Z7IiiV8O0Epnhu9U4mg==
X-Proofpoint-ORIG-GUID: fqhBhLuDvYvdJND8Vif_s8JkM5yPoqnK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_01,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170008
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5AH0w7Ql202386
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Nov 2025 01:22:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226479



On 11/17/25 12:27 AM, Richard Purdie wrote:
> On Sun, 2025-11-16 at 04:18 -0800, Robert Yang via lists.openembedded.o=
rg wrote:
>> From: Robert Yang <liezhi.yang@windriver.com>
>>
>> The version-going-backwards check may fail without PRServer, and it's =
not easy
>> to debug, so warn for that.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>  =C2=A0meta/classes/buildhistory.bbclass | 5 +++++
>>  =C2=A01 file changed, 5 insertions(+)
>>
>> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhis=
tory.bbclass
>> index 4a380c10c6..859fded472 100644
>> --- a/meta/classes/buildhistory.bbclass
>> +++ b/meta/classes/buildhistory.bbclass
>> @@ -57,6 +57,11 @@ BUILDHISTORY_PRESERVE =3D "latest latest_srcrev sys=
root"
>>  =C2=A0PATCH_GIT_USER_EMAIL ?=3D "buildhistory@oe"
>>  =C2=A0PATCH_GIT_USER_NAME ?=3D "OpenEmbedded"
>>  =20
>> +python() {
>> +=C2=A0=C2=A0=C2=A0 if not d.getVar('PRSERV_HOST'):
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.warn('PRServer is not e=
nabled, version-going-backwards check may fail!')
>> +}
>> +
>=20
>=20
> Shouldn't this be conditional on that test being enabled?

Yes, you're right, I will send a V2 for it.

// Robert

>=20
> Cheers,
>=20
> Richard


