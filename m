Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3075CD2F009
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 12:21:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5728.1769501442727641356
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jan 2026 00:10:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=BTbMRl1K;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5487e805b0=jianpeng.chang.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R7eC9e614790
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 23:48:07 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Tm4rfIKF4enI7T0jSt/RmV7UKMfFV8mXSPSBtfY5WU8=; b=
	BTbMRl1KecsdkOoulk6g2037wmbTqNH4yOXWihSZ0fuUihN5/qLRfVsR5Q++IDuF
	yE0/rQjBVPvp5D4PO3O6BxDi5HntMdY59ydudL5F3e55Xhv/vV0bfEi83OESHCaG
	3lAUvVMorUgTpcIpzHI8uSVcbdPo6lzS28UHFNfbULn4BTTTpG9+5KSfofh3CVCE
	5b3A3+fDXIGhvt+E3+LTRvHRQ/kpPdiyHQGt/XgHlXp8JJHSEv7N8CZKBU6AQLVH
	ErKLZsjlyOxKDPdXS1ksRTK5F5OYXKv+gpsZEIAYfGyhVW6pm81mNJHo0q3Mk25W
	hit+PGBDaj30d2cwdkh1vg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012039.outbound.protection.outlook.com [52.101.43.39])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bvt85apfa-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 26 Jan 2026 23:48:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ge3o6Ie5/bt6Vf2tOQSvq8PF7WjGOi7Sb1gYs8l45Grn110O0cGydJtbCCrhqEv+ULhth73BB5Vz2I0jRxuVnuAJ/jxYDxHMPo0k/G4b5QPBsQm8Qg5oPeDBvCdDt+K93Ps+Yqz8CxecpraXNHzjfGzqk+Eo+OrUdZSMlPmR8/EEBt603mvwE/lhfmx6ofUwBRYkUZtYTh3R61eTpn7vwqhcr4PGX7RGAR4Iw9I2+tMHGCVZpS2aINwmGovuJpXhdh+NceoZhb2yQd3RVopsJCw7Y2r149SFej0WiojPIhEhWNuLlIQeddcsnwF/aZRE8ZWKhGymc9J18jYjixL6Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tm4rfIKF4enI7T0jSt/RmV7UKMfFV8mXSPSBtfY5WU8=;
 b=QpruKB0/YhIgje1FumoDECSE8dv2Xuj8Qraeze8LWcPO6JCrpLP+aSe1KeP+zQjJgxFL2kMGdrXZJxSdsPMY2QoR3LeAGH1LPwa/qbNXPa9dpjJ3gaOmw+9SEUUdBsLGJNXgj8/+BGnXnle6vyaV21HoICJsGxrlGvcc8ToCn+uLmt5QeXw6duAdJE0CtQs6NZQi8PlHH8CjmE9KAYklVZxBjRIH/6htYx8clzveIQ9Q2VJhEy03ZrpQLchFeQBmK3PadrCCAIRAxsTT68Ya0/6/5VMyaFLgY6JVExBbH9DUGZH5ws67Y67oDzXWIa9056gzRQdv+PpjWf+A7pPCsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7736.namprd11.prod.outlook.com (2603:10b6:8:f1::17) by
 SA1PR11MB7698.namprd11.prod.outlook.com (2603:10b6:806:332::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Tue, 27 Jan
 2026 07:48:04 +0000
Received: from DS0PR11MB7736.namprd11.prod.outlook.com
 ([fe80::f7c7:f271:a7b:7a68]) by DS0PR11MB7736.namprd11.prod.outlook.com
 ([fe80::f7c7:f271:a7b:7a68%4]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 07:48:04 +0000
Message-ID: <940c88da-1788-40e6-b358-9dc8c701431f@windriver.com>
Date: Tue, 27 Jan 2026 15:47:21 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] alsa-utils: fix dynamic package splitting dependencies
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20260123032747.99010-1-jianpeng.chang.cn@windriver.com>
 <510ECB90-577D-4972-871E-12451C272B7C@arm.com>
From: Jianpeng Chang <jianpeng.chang.cn@windriver.com>
In-Reply-To: <510ECB90-577D-4972-871E-12451C272B7C@arm.com>
X-ClientProxiedBy: SGXP274CA0022.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::34)
 To DS0PR11MB7736.namprd11.prod.outlook.com (2603:10b6:8:f1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7736:EE_|SA1PR11MB7698:EE_
X-MS-Office365-Filtering-Correlation-Id: e57d032a-14c4-41e3-6ffd-08de5d7866fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Q2EvQ2FicTk3YkdwWHI1d3hPQU4zUWRrVUJSNUF1Nm5hM2EyM2xEdlltc01S?=
 =?utf-8?B?bGFLeTNkR0s3Y0xBbEZwRmJxbG9odzVZREx0NjVRMGNhZFdzeVdHZS9IK2hk?=
 =?utf-8?B?T20vZ0pWS09zK3htSWJIV2dtSU14V2NKcmN1QUdrcTlXTytrU0RZbjNWazNB?=
 =?utf-8?B?RU10OGNZT21td2xZSzVCcXJVcFlpektLUVRPY3QrR2Z4MTQrNHl4TXpnMGF3?=
 =?utf-8?B?dS8xZklwZGxvR3BKa3YwTTV2SUNDZHZKblNGQkNMTVU4NDdVd2RJWE9aSXFw?=
 =?utf-8?B?Z1AvMGo2dHJEQk43cElFaitpVVhwYnRvMnp1UFVRVUE4NFlCUFlBOTVWemdF?=
 =?utf-8?B?aUtIQUEwa0NNcHMydEdtMEJVNEkvUWtPWVBOMDVPQWlBSm1WK0tIVXRLL1hW?=
 =?utf-8?B?QUlpbk9tbkRIQlBzbzN1QS9udWVJalFQMDlVTXVLbk45cjdQRUlxM3djN3cr?=
 =?utf-8?B?TklaWHFKNFNNSFd0dzZtS2JiUWd2S3VmVlpIdlJmdk4zTkY0UXdxTTJtYUZK?=
 =?utf-8?B?YWcrWnpDMDdrbmhZcEdLbGNVSFVaNVVwNzFvWmQ4OWNiYXZ4L21oRllucTl3?=
 =?utf-8?B?bWhUcXY3TjY3TGoyc0h1N09wdXlLdm4yYUpoTjk5MGJnOEVNb0lwZkN3LzVa?=
 =?utf-8?B?SXV3cTRCYzhLbTNSL2V5dC9lRmRZRlUrcTA2b283eTVVc1hiWURMd1RsbHZm?=
 =?utf-8?B?VHZONkEvWjgvODFMdm1heG5sTTkvRDllUGw0S2ZSbEtpRVlOS2xkeW9XU1Qw?=
 =?utf-8?B?NGg5Rmh5UlRiL1NrTHU4ekVzOGlPc0ltd2F3bWgxKzVjS1dabGJ0SFNRVSt5?=
 =?utf-8?B?a3dQMERsSGRJOU0zQVpmTTBlUk1nWUFxWG9HSFhKSXBxS3FsTXo1QlJwbXRN?=
 =?utf-8?B?Q3d3anNSNEtZTnBCQVhCVTBYd2xOWkVncjhIYlpET3pjcVVFK040aDNKRWtB?=
 =?utf-8?B?dE9DcUI2ZTBDL205eGxWZTV4NDBLNWVSQ3c3SzlhbE9FQWtNOVN0TnVvUXNl?=
 =?utf-8?B?Mkh0TkZadDFJOTJBeEhnZ280L0VPTlpUVUM0Qzg1THlQamFyakZXWW1OMXUv?=
 =?utf-8?B?OFEyTk5TbVdHaVkwWGZRd3VGeFpnM1pEMko0a0R2OGRub3pYaU1ZMU1oUDlt?=
 =?utf-8?B?UXZ3NUUrVGtJRjJ4Lyt4ZWMxZWFwejhRUmhicDlrM2J0WG1TMzlMbzR4Vk1a?=
 =?utf-8?B?UlhNeWxHR2lGU3Y5d2NZaDdKU1l5Umx5cTlEcUxWVDlVNWt1Zkc4b0JDVHl3?=
 =?utf-8?B?Zkx4U3JJREh0cHU2R0trL0V5SUNnWTZtQWNGN3k0OUZJdUh5dmE4b2ExVVBG?=
 =?utf-8?B?OWFBWGRMZDBOOXBSTzI3ZlB3VjRlRjl5cWs0M3dENHVKT3AxTTB1MWFyMFNk?=
 =?utf-8?B?ZVJyQXdlazJqY0J3QTU2V24zdEhheWpJZi9VVmF5bjRBTTE4MEp1OWNGMGMv?=
 =?utf-8?B?b3k4QUxVQzVqVm1BVmVjRlA0L2FzZFdDNjl6NmJnWFk2V1JVTFJUY3JFb0FX?=
 =?utf-8?B?MFI4UDgwdWNVWXRPTG9PN0lRNWE5bmxlR1NPNHV3L3EydVRQdk40bDhKS1ha?=
 =?utf-8?B?eW5weDJvMllNYkp3QThxcHVKOUdmQWNKWkN0SkxuNmp0emdlU3NhWHZaYjAz?=
 =?utf-8?B?NVVjZ2FvSDU2cW00bE5yNFhIUTNKS3ROL2laMDVpeUFKbEdXd2p0ZDFHSGtL?=
 =?utf-8?B?UHNMZ1V1SFV2OGZqdUFYalBuUThtZitFNWg5L3lUS0lhTVVtRVQwRHJiMVhW?=
 =?utf-8?B?NU41cEtyM1JyRHc5Vk1KRmJ0Rk5xTlo1SGFuTy91OFMvMCtWM1hvT0FIbXRF?=
 =?utf-8?B?WWxFTWltc2RsYUs4ekdyN1dmZVZHckYxOC9jWk44R21oL1FGeEp3dkxZbDl4?=
 =?utf-8?B?YldNTER3ajhIS0ZlRVRnS25CNldzYUM3MndlRkdRSFhPS2EzbkxEYWlncWFL?=
 =?utf-8?B?cDdJZkNGRENoTXBmZ0pjOFM1QzFRblc0bjdtMDN2QlBZTWQ3NytVcDJreHIy?=
 =?utf-8?B?VTA2NGxxWmRobWNYWmxKbjNVK09vblhmVnB5NnJoNWtjL2xzcitOY084Q1Bp?=
 =?utf-8?B?SDlXMVhPUUlmai9URXozblBIU1NsSUl5OXJ4Q2JBTWl4UEFCcWM5MFlRQUd2?=
 =?utf-8?Q?+GSY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7736.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TURiOGNlK0tEYWczWTVHUStkY3ZpeE1xYkhMQWMzeE16NzNyYUNGRXRSQXp5?=
 =?utf-8?B?UEd4V01rZE9uZ0xNN1hxODVGUnZxa2lPa0ltNXhYc0NJa0Q0d0NsOWExMHVS?=
 =?utf-8?B?ZkdaWTlkZUtXVDVTdzd1QUpCVStFTnRLR2hUMjgzWHd2Q2ZYaDQ5MW5sNUw5?=
 =?utf-8?B?VkZQWkx3Q0trdHRIYStGamVlVmMwQ2lHRDU2eitjRFR6YlZ1OXhYNkZxRHN2?=
 =?utf-8?B?MGNXTEJMWTZrVmRLbGczVzlTMytVTVpuSklnclM1MGlybEFPdUhUZWdqTi9v?=
 =?utf-8?B?UC90ODVsaUNMVm5TT2d6eFliWW10YUdGQ0NBcWtpa2NrdUxYTG0vVTFyeWVR?=
 =?utf-8?B?QTdkVHRkeldBSDFIWXk4Y1BZcWRyL1EyS3JpeHhwYWR2UGdxb2M5UG42b1M5?=
 =?utf-8?B?NVU3SVNpeDc0V1VFV21YV1I4MFd5U3JMVHhjRWlYc2c1d3luL09MaGo1Y2Vh?=
 =?utf-8?B?bWx6bXJPSStwNEVEc001REpOSDJSN1BITkNuY2ZMK1R0UUVSWDN6Um0wMUhC?=
 =?utf-8?B?Y1BOOGFsVWNNNk5jRHorQk1iNGsranFQUC9GMVBiWUliTGtZU090MFgvYmdR?=
 =?utf-8?B?dmpsTHVGOUJ1UkV2b0FRSzkyekZjN1AwM1pmaDN2MVhObHJTZzFVeHVxbEtL?=
 =?utf-8?B?ekpIZ3ZKVmJLYVZrdjVJamNVWG12S3cvVVFlUVFScVZKcUVQRHQvb2NDTFJ6?=
 =?utf-8?B?cXN4bm9GTVpLZFc3SFhHQklxaU9rcVFCcXNMLzY3OUNZNlJ5d3NwUjM4MHRM?=
 =?utf-8?B?ZldndUxDelZ4dFU5OThqYmcwU0R3QWIyVjdPOE56alRpMGdjdEJpbWJBdEs1?=
 =?utf-8?B?cHp5aTZaa3VEcVlWekJTNUdUV2cxV2hOc1BMV2loL2g4UHhxeVA3UlA4NjZu?=
 =?utf-8?B?UENycjBnZ0pXSi92Nk5mWnM3TkxqT1pIaGp6V2FsUk5iVVJMakRxMFRtVGRL?=
 =?utf-8?B?SDZnMTE5Ym1QdGNNMk1PbStjN0V4T2xTSDZscjc5QXkxZlA0RnVyVmx4SkR2?=
 =?utf-8?B?SXQ1UEZFcDNLSlYvYWovb1lGYTNkZ1Jhb2ozb3Vsb3hualNpTk5nSDR6N3Nj?=
 =?utf-8?B?OFdRViszZWZFdlNOdHNXeWhrU1hBV0NYcFdYM2FwUTRodVdMRHhLMGhRNEND?=
 =?utf-8?B?YVRlWFRBcXptRmh0TWJ0Z1ZhUGxsWE9ReVhyL0lnN2piSW5sOU9CSVlaU2lU?=
 =?utf-8?B?UUdRSVp4WmV6Y3k2VEM1ZVhIREtzM1VxUGlsRE1VMVJHTXhZNW80cGgxTEd6?=
 =?utf-8?B?ZDdTWmlHcHB0VXp3VzJadTgwYWdMTWF0eTB6SkNBeEkzdExhS2k4OTJLZTJG?=
 =?utf-8?B?cjI4YjZTNFFpSFFkaFFndEIwSllDQkZlNkpxZ095OTZsR0RKOE9SdTg1WExs?=
 =?utf-8?B?SHU4YkV3RzJTQWxvNGxnWVNnU1FIQmJzam8xTG1hN3ZwdXNjcUxHbFdsLzFI?=
 =?utf-8?B?YWdvenZIUFZQSC9jMmlCWE50b2h5ak5WZDFFNnhWbXN6MFJkK0V3eFlHaWt3?=
 =?utf-8?B?WGQ2eEZ2eFhHV3lmRFgrUWlXcWpMQmxIU3pFdmhuVnFIcFdraE1URkdHdS9i?=
 =?utf-8?B?QktiMVN5b05KdGVaYzVhRXhDQWtUUnczMEwrZFdBSC9id1lGL2ZMalgvQnBw?=
 =?utf-8?B?aWtoSXNYUGlnTW91N1R1WU1jQ1krMElwdDUvN3hvYVR5YlBsV3A1ZzJUVVcv?=
 =?utf-8?B?czJHd2w4ektxRDJ2U2VNdXUyZThpa2t2N3c5ZXlEMTRVd1hMSmV5ekFwelRP?=
 =?utf-8?B?NFd3ZkVrYVhUcFpSa3FrUWpITkloTHRJOGpISXhaSUlzWTQzZS9mNnRpbGtE?=
 =?utf-8?B?eTBubU5hbjd3dlpyNG5rSkxnb1lOOTZUdmIxL2dURnZnVUd6ZlZyKzRFNzNm?=
 =?utf-8?B?cTBaMExKQWl5cVZCaGQvNWFkWXdKVUR6M29zVHpyN0JMOS8ybWNzeXdVeWlZ?=
 =?utf-8?B?VUZJVG1JMDBXTmFHMjZVSWxsNUxHeEEyV3o5MGN6M25Rei94SWVaeURKbTla?=
 =?utf-8?B?WUhSeFRPY2pKdnA0N3pxNCtadEUzLzhUZ1U1NVdtVTR4cnBjMW95MFpkMS9H?=
 =?utf-8?B?UXI1NkJZamVHemh0Sjkyd01IcUFVT2Q1bm5HazZXRHdvR2dycTJDdWRtVVNU?=
 =?utf-8?B?cTE0bmlnTm5MbENWekxLdVdBbnhHTXNyK0twb01FUG9hZXFHQ3diTHI5ZEFK?=
 =?utf-8?B?OUdJMzNRMkZNQ1NoRU5jMngwbEFneFk1ZlVnUkp1bmJBTXdZczlFb05XcEZw?=
 =?utf-8?B?eUJxdmJVQXJWejMwa096b2pFZDVsWCtuMW53d1dyQVd1N2RBeVErcUU5OEo0?=
 =?utf-8?B?c1E0cmZ0NlRKb2xEMTJWb3FpZWxDYUgzNmxrVmRVdHR3VDNIV0JVWHV4ZGdL?=
 =?utf-8?Q?mS5TL7GbzAOY9gok=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e57d032a-14c4-41e3-6ffd-08de5d7866fc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7736.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 07:48:04.2437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8e9ECVEEdImp+dqVtp7FpSwjdAYfanKX3YXnPvfZ53RIKltertr7vn+gk/e3t7YkbF3SAw+lYkcX8wai2vkWX0ZXKgwSSOumm0FDrIerxIM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7698
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA2MiBTYWx0ZWRfX1xJBuwtffSPT
 leNLjAcOabbhf3vV4OurHv1DyZVYpA8abwBg779zvdr8UBEt4lFfVA9jozfhHxW3jbj5xV2GHam
 M69vTglXPZ0YF4Bhhvro0YHk3wqQKDtZX4cMz0KByaxZ5za6Ku1PNsdNJEBIx2QncWBxeLu4XZc
 rsnL7YSmmO7hAt6wmc+eFy6FUFHfKz/sllw3C63KQGoEl8QNeE6YaL2PUvEHnXbacaCnBycv2Ab
 qKv6ivNGw1dnHEaWeclXhNKMna291NrUYc1VGGYA2MJR0G8WWXdUr456+JVIgee+vUZKmlMIpLV
 Oyg48j7I785Ct0MJs286lxZFVm2YJYqtUtboWOoFI4F4T56ozF9grWcWJSJlyqVov3HG6eiWGBX
 b09s6p/HJsIz/HRwqVHFpDgKAIr9NLanbv2G/bRRW2R7+FFjMxWa3HNS2YgFCTkAepRkZuxJFAp
 j9CducQvINsAh2nY2ew==
X-Proofpoint-GUID: Pu4FDKy1b34XTCpI0qPz4xjKmuMhPl_y
X-Authority-Analysis: v=2.4 cv=M6lA6iws c=1 sm=1 tr=0 ts=69786db6 cx=c_pps
 a=1lugHNwfFMYeWqdp2xp0VQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=QiDmL3qyi34oqfu5XW0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: X3gFEid_pLaAdddUO1soU2imqDubZXaa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270062
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 60R7eC9e614790
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 12:21:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230040


=E5=9C=A8 2026/1/26 =E4=B8=8B=E5=8D=889:03, Ross Burton =E5=86=99=E9=81=93=
:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On 23 Jan 2026, at 03:27, jianpeng.chang.cn via lists.openembedded.org =
<jianpeng.chang.cn=3Dwindriver.com@lists.openembedded.org> wrote:
>> nothing provides alsa-utils-aplaymidi needed by
>> alsa-utils-1.2.15.1-r0.corei7_64 from oe-repo.
> This was fixed by "alsa-utils: fix packaging=E2=80=9D (4c6d5f96990d3200=
cbbe475bb750fe75492a277a) I believe.

Yes, I see it.

Sorry for the inconvenience.


Thanks,

Jianpeng

>
> Ross

