Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09FFAC02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 23:29:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.103268.1738625354955197657
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 15:29:15 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4129c6a382=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513Mu2kY012801
	for <openembedded-core@lists.openembedded.org>; Mon, 3 Feb 2025 23:29:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44h8u12bnw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 23:29:13 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 513NTDS7028603;
	Mon, 3 Feb 2025 23:29:13 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2044.outbound.protection.outlook.com [104.47.70.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44h8u12bnv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 23:29:13 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wQP51nYtwe6NTjB704HurMeKAvjTIRpcv8uJyiGr6YrJbWPC34lPF1MTikdHtRpUPYaxXmDak8uBLiHBKs0sLh/VqiA8jvSLnexfwVFqQSkcW3tu1XAVlQ79b4bbS5UPNC7+gg7aZ9ZkXCNIoghVNWPtdpd5DNEiZucBrqRBIiEZa+UPhQb+sCPaYCsG02r4GWn1jY0DmQBTOSida8Kaeum70VwuIx/uboIanfYl+uTahyIszmC9CuRGukzsgz+WaEGtCTcjs3DPMAWE/9LFWfqtTYE22puNS61EVdXlLN6dpRfKOe9k1PQclDbIBCxCod12NYhndr1djWgQ+dOn0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=looiKcTK7Kq+rM/KLC5njDH5ZRc3B+VHfypNMH0HUiA=;
 b=zDaZqPTZjXbjakXilHwgkeH4pniOBjuf4j2AC56c0lFa6DTh98+7ufjV8ON3u0v8jNIGVVBhMNxsNlBwDCcbX2KkoGtKmEKtvVwiP9VamvPGxdF3QkCiDZmgO59nYicpgIYIG0aPZnNXRP30I4WIHENDv5/xRhWbUSVO8lbKCYWoVbooV94l880fOMvY4381A7zj7eTVbOBMhBbt/kN9cX356nDiBHK8w8jDz+Dw7JFolCi2k8aIyzCIj30oKaIVRdMMoM0BA84QgpWuJcYoMup1+Gr2pC1WRqI9xlBToIU7oZt62+cBmd4KETgvzwDxqje7UMvAsleHVTwTBayayA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by DS0PR11MB8761.namprd11.prod.outlook.com (2603:10b6:8:1a1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Mon, 3 Feb
 2025 23:29:09 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.8398.025; Mon, 3 Feb 2025
 23:29:08 +0000
Content-Type: multipart/alternative;
 boundary="------------HiSaQaIs3fmv6Ib0HJ2kO2jz"
Message-ID: <93297d8b-7bc7-476f-a5d3-4fe1db4b8df6@windriver.com>
Date: Mon, 3 Feb 2025 18:29:05 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] glibc: Upgrade to 2.41 release
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        richard.purdie@linuxfoundation.org
Cc: raj.khem@gmail.com, openembedded-core@lists.openembedded.org,
        mathieu.dubois-briand@bootlin.com
References: <20250130165359.137315-1-raj.khem@gmail.com>
 <fda5a12dbb22da458d6b0dbea2903f08442c70fa.camel@linuxfoundation.org>
 <CANNYZj-fRsCoQFLFnvH9+cwvFPw8zWDvHM4eCv=3WoumAxdcxQ@mail.gmail.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CANNYZj-fRsCoQFLFnvH9+cwvFPw8zWDvHM4eCv=3WoumAxdcxQ@mail.gmail.com>
X-ClientProxiedBy: BYAPR21CA0016.namprd21.prod.outlook.com
 (2603:10b6:a03:114::26) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|DS0PR11MB8761:EE_
X-MS-Office365-Filtering-Correlation-Id: f17d518d-037a-46dd-d31c-08dd44aa8ebb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MkhkeFpyeGYwTUN1OU9TdWh6TWJCcWY5ZVFESU5BOEJRaGpVMm5HRVVEbzB4?=
 =?utf-8?B?cGpONmc3OHpJdWZSV0tJcXNHTVQzdjR5d2x4aTdnVm9vbnNZZHFPK24vaHB0?=
 =?utf-8?B?S2U2OVcxQk9wTmJldmFtR1NqM1E2S0FRd2RuRy9GZWRmTmNueFZtT3U0ZS9x?=
 =?utf-8?B?dm13WEQwdzhlcUVNMzNCOUNGNFVOMDdWVVdZMXJKN0szRlBzZUhnV1ZCdDVn?=
 =?utf-8?B?U2w3cHg1aEpPM3dIS1NRbWs1c0NYSWg1Y0JkUmd2S2JxdjhteDMwUGF5NXVZ?=
 =?utf-8?B?K29UZFFkWUx6NHUzNU93NjRibVBRSEhub3RWM29ESjVPRjFPU05yTWI3S3cz?=
 =?utf-8?B?bUI5RzVsb1dEQXMwenMvY2dsQkNHcVF4Y1hqNjVocmhhdTBuQW5WNW01RFBm?=
 =?utf-8?B?TUJmdlZmcnRmaDVYdGVkZ25qd1BDQWx1VjFCcVk3UE02TVJCUExwYWQvN0NX?=
 =?utf-8?B?QThIN212dkF1eUZwUjhEajhuMExabFFxbktuMGtUYm95UElHbUNKckIrVlZX?=
 =?utf-8?B?Q283c0piVWRqNmlwdWFZZHI5RGZDclovcVFqQkdxd2R0UjdoU3JpYkJlQ0R1?=
 =?utf-8?B?M1ZpMVMyZm9JYXZyemJ5OEZTK20rT1p4NDFYZ2pHUUlrcTJ2SHl2QXExUXpQ?=
 =?utf-8?B?bzlxZUw4Y1E5M0ppN2J6Z2R3ZC9CNVA2YTdXaWtpVFZ4cGZzalo4RDd3dURH?=
 =?utf-8?B?T0I4OGpYMEhtQjlOYjNvSGRaRTNpS1lRdnRobEtvUWVmOEw2VXpvdm5SbDZX?=
 =?utf-8?B?ZExFK2w1OUhpL2Z5T1g3WXdVMnAyeEJVVXVVVjZBVDY3b002dU1hd1RsR2Rt?=
 =?utf-8?B?c3dXbXo3SkVGWFNuM2F4cExZQUdzUVhRcHY2aVFDaSt6Q2pRVmdsQjlCWVlr?=
 =?utf-8?B?UU1vZGhrSDFPeTdZcEhRaUpvTkJNYUhrVDhCdzdlaVU5L0tLeFg0RTlKK2tS?=
 =?utf-8?B?VS9mSVNrcmlxSDEwSlEvZlVvSUpQWlVsYk5CT1gxejNKait2a01SZFd3SmZL?=
 =?utf-8?B?OHZMS3VWVjRoS0xwT3FYWVZHOGZoN1FIN0hpcDcrOE9UTTFYeW4vd1FOUlk1?=
 =?utf-8?B?Q2RPenhQSjdBT2VUbzYvWElKdDdwM1VOVGlSN2I0ZkhHdU9tdTUvdjZ2RWNu?=
 =?utf-8?B?SitEWXdaOWR0SzlkMC8zTkNpaXBqZy9TZlZ5S04ydXRveVFuZUVzeVlWd3lN?=
 =?utf-8?B?WFc2OHRIM3hTQ2U2YTQ3N1FKemFoa3ZDK3czTHFxVG5HUGtxZ29Ud0R1VEww?=
 =?utf-8?B?aVY3bEd2TUhlRlZBN2taU0w2ZWdCaUVJYzFqS2ZwSGU0Y1c3YnJnc2tzOXlS?=
 =?utf-8?B?bDJEMzl5U3U2OGQ4K01SeVF4WmVCbU9hd0MrTzJERmlQQVJDK2E4N3N5ZGxV?=
 =?utf-8?B?SmVnSHA5eEUvT1MxRkovY3ZmTDBnek56Sjh0VWtUNXBuSTZSTXZQbG1nRGZH?=
 =?utf-8?B?L3hwQ05qMkd3amt6RFRzeVhhUDdBemk2enh2dUhnb1ZScmlkTnI1NU14Y0ZL?=
 =?utf-8?B?dkRCMzZvTFM3NzIvQWF2YjU0RCt2Z2N6RXpVdDArNlkzc2VvaTRZT2tkZEEr?=
 =?utf-8?B?ZzV6U1JpN0dFQ3piVGo5NXVNV1FOY1RsQ05zWUNjR0lkaHhLVlo5cUNVZ3JL?=
 =?utf-8?B?bWljWGoreTJucklzOGEraWYxVUJBZmtzOXhybmdwVWRNMks2OHcyZlJKdnA2?=
 =?utf-8?B?S0NPY0JyUnV4dlhqaysvNEFzT3BEMU8xcmhVWDVyeXBSSlgySW1rbHpzYzkv?=
 =?utf-8?B?N3EvWnNBVEkvMHVoU3BhemhaVGFLVTZuSEdjT0tiVjBJRGRiZWE2WGJjeG5G?=
 =?utf-8?B?bWpUTXVYVjF3Y1kwTEl6Zz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SFoxVFUwVnBxdEs2Q1VmWXF0Z3ZUYmxCN0hqS3F5RFgyOUwrYkI5eW1pb2NP?=
 =?utf-8?B?QVNFOEhQa1hoYkJ4ZThtQlRqTWRNcDFnZGNxbDJyRUFwem5nNlNhQnZrcVk3?=
 =?utf-8?B?MW1pYy9IeExDM3VVZDREVnorakpUdWNJODNKTFJrbS80MnIxdExjZG9uWHhI?=
 =?utf-8?B?Nk13SythbEpNOWwxZjRSUk1VcGZKeHFBTE5wTy8zOEk1bXlMZzFiZUZIOXJv?=
 =?utf-8?B?RFhJLzFiSWRPWktHNWdKbDVOZmFKakU0NzJGZVkzem1jVTNvYTF2SUI5T2x6?=
 =?utf-8?B?SkZ0N2MvL1Zyb3ZXajdQSDBMQko0cGM1cWdGeDlaZWhQVlZkMk5wRExka1hG?=
 =?utf-8?B?R3R3dUp6RURyVWZFUnVLTGZCbWpIcUlocXhsNmdIdmxmWjU1MW0rdUFJYzAr?=
 =?utf-8?B?T0JzYisweWJrbUU4ZTlNek94bWxZS3o1dE42R2RiVm9XNy8xMGRkUUxlMVkr?=
 =?utf-8?B?MVJZR3Uza0I1WVZGT1VEQmp5SWR6eG9RQXNROG5oVXFQemFNRXpzRk1uODlQ?=
 =?utf-8?B?RVpDR2ozQnllWFJ1U0t2NFN1c2x0K3JqSGNIcGVzelVGOE0zTVlrcVhLZk9K?=
 =?utf-8?B?TDRVVUVsTzhrYkhPRFd2VHZpRkxZaHNGMi9LbmVVeHpmYmN3UmxteUg5S2tN?=
 =?utf-8?B?emFNZmhTZldxZUdna0paQ3RsOHliR0xnL0FsVjBSeTVWTEZaY0hwd050Qko0?=
 =?utf-8?B?SG44TlJzbHBCdlA3RndwR0ROdk8rWWJDNGxKSVNWREVNbDNKUVRZUTEyN1Rm?=
 =?utf-8?B?dEM0b1FsYnZsM0hjbHFDdzNrcFFJTUtjenRya1cyQ1B1VGdaRFlrYk5EMVU4?=
 =?utf-8?B?dkJTWm9NM0c5R3FTU0d3cmdCTTJSOEpraG9YUEY0M1NtVks0VEU3MTJqVGlM?=
 =?utf-8?B?emQrRnhhSnNXTlg3SWVRUlFhMnJQUm1ScFV4NDZFTUFEbjVESXplbi9HY25M?=
 =?utf-8?B?MGpwZzAzUjVwSXN3K2hUemI5UjFWcEVrWHU1VGVIYVUvZnpjQ1dtd0JXN3ly?=
 =?utf-8?B?MnA2MllEb1JQeDBMYnNUZmhJV2JPN2JFZ2I3M2lmWjZzV08ybERWVWpNTDEz?=
 =?utf-8?B?UTBSSnhyTWhGWmxyTWJXaWVSR3lwalo5cWJ3b0tDTFlEMWtyZzJYcDBPVlZu?=
 =?utf-8?B?NWFvWmNqMHYyOGlkeFdzbHdkM1JlMWZvd2xVeUJkK2xKYVUzNVA5b3JwN2NK?=
 =?utf-8?B?Yjh0dzN5U29BV3VXMlArS1BPc2s1aEJWcXhUbGpvSnJXb3VSTDUrMkJXOEIr?=
 =?utf-8?B?dm1uc2Q0QkVGOU9OeHlNUUlPamowZkF6alZmMWhtS3VtT21IMGEyNTNDL2c2?=
 =?utf-8?B?S3BManJDWDY5TFVudVlXeGF6WWFtNFZIbjZpanBpczVDa25ST0ZjRVYvbmZk?=
 =?utf-8?B?bDRIMGxheFZzNmZxMjVjU2dleUYvbmNQQ2UyOHQ4R1dSek9FN1IzV3kxeE5r?=
 =?utf-8?B?Sk5tV1hTUjB2SXBkTlNxaFFUcStMSXJWbk1JYlViVHVkWWZ2R1d1T1gxVnVQ?=
 =?utf-8?B?ck9yZmdZaGhrYUdXS3NTSUR1WXMwUWZ3UGd4eUdkYW5GSEVNUmZBQldYRkwz?=
 =?utf-8?B?SUJXSVM4S29FRFJ4Y2ZoTDBtS0Flc0R3VmFhcjNGaFhQRmxESHhma3ZlVU1m?=
 =?utf-8?B?ck9DWnNBbmRZNXdNb2RXMnM3TGZpVC85YS9sd2w2SHROZlZ4MDloSzF6WVl2?=
 =?utf-8?B?MysvSmd0RVBITGw3VWs3NlVxWGRRb3MvemVDR0R0cTJqVS9HbXlCNlY3aldR?=
 =?utf-8?B?UjhJdE1IWFZTWlpIZFY0WXdvQ1VqRElXS09VTHNMazFEcmY3dXRwUUMzMVlv?=
 =?utf-8?B?eXRSWlBYQ2dSVVQzRmFISlc3cWRkVU9ncmM0K29CT0V3Zk9EakRJWjEvdmxr?=
 =?utf-8?B?NXk2T0VtV3JuK21pNTdGdThGejdUNzdmTm5iOVVBWktJc2xmSGpCZGhKVDRp?=
 =?utf-8?B?QzN6bjA3KzJod2R1WHJsaUFsSjFxVDZnWlpOWDFOaGRzaEVFUzlVVWxEeVNU?=
 =?utf-8?B?ZGJxaTNBcVdaK3R1Z0lHS0Z5MmtrbW9xc3NjM1VIRlRjaldpRHV2OU1DcXI2?=
 =?utf-8?B?SVBnL1dsSUtwMTdUYzNHOElhcVFsL0xDWHVvQWVsY2dZa01QR1d5ZkZLWkxF?=
 =?utf-8?B?OGhvVGl2dWJxSThpUGh1TVJXY0NiM29YY3ppMXVFVGVlc2RORWdHRC9SV2s0?=
 =?utf-8?B?dHc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f17d518d-037a-46dd-d31c-08dd44aa8ebb
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 23:29:08.7563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cdxunlNbQTFCGhxUYPKGjKKAMTpdSthSbQBfju/exJSdN0ZGUEd1XPPCd0mOQsMFuckbPL1yp1FmN/QWerB+4pAEJn1zdwWnsZqXJBRUDdg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8761
X-Proofpoint-ORIG-GUID: 0Qpvo1NopENMzI8YCBP32ErKuwDmQTDI
X-Authority-Analysis: v=2.4 cv=HuqMG1TS c=1 sm=1 tr=0 ts=67a15149 cx=c_pps a=zz2QubYGG/9FVtTd3zWqHQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=bRTqI5nwn0kA:10 a=iGHA9ds3AAAA:8
 a=Q4-j1AaZAAAA:8 a=Bz_orYSE7hYFaQNdDb0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pGLkceISAAAA:8 a=qdclSGzfiHrDy-R72a4A:9 a=IixTLoFFnN9O6DVg:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: _OjVMu3vXzwYY1LVcJ38r2RcGBf20i-C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_10,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502030171
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 23:29:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210743

--------------HiSaQaIs3fmv6Ib0HJ2kO2jz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 513Mu2kY012801

On 2025-02-03 6:10 a.m., Alexander Kanavin wrote:
> On Fri, 31 Jan 2025 at 23:37, Richard Purdie via
> lists.openembedded.org
> <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
>> Thanks Khem, this passed in testing, the only issue was valgrind ptest=
s
>> failing:
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/851=
/steps/12/logs/stdio
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/853=
/steps/12/logs/stdio
>>
>> Copying Randy...
> Let me bite: it's time we drop valgrind ptest.

Okay but I'm not going to give up on the ptests completely yet
so the patch just disables ptest build, install, etc.


> It's just a non stop
> headache to support and I haven't once seen it provide actual value.

It certainly has been a headache!

I agree that most of the issues have not provided value but
I think some of the target tuning likely came out of trying to run the=20
ptests.


Patch being tested:

966f4c6fc5=C2=A0=C2=A0 2025-02-03=C2=A0=C2=A0 (HEAD -> master-next) valgr=
ind: disable ptests
d392981530=C2=A0=C2=A0 2024-11-29=C2=A0=C2=A0 valgrind: update 3.23.0 -> =
3.24.0 (ptest=20
fails, vg_regtest needs rebase)

glibc is ready to go to AB but I need to confirm that musl still builds.

I'd prefer to keep this order even if the update breaks ptests so that=20
if we do decide to re-enable the ptests, it's easier.

../Randy


>
> Alex


--=20
# Randy MacLeod
# Wind River Linux

--------------HiSaQaIs3fmv6Ib0HJ2kO2jz
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2025-02-03 6:10 a.m., Alexander
      Kanavin wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj-fRsCoQFLFnvH9+cwvFPw8zWDvHM4eCv=3WoumAxdcxQ@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">On Fri, 31 Jan 2025 at 23:37, Richard Purdie via
lists.openembedded.org
<a class="moz-txt-link-rfc2396E" href="mailto:richard.purdie=linuxfoundation.org@lists.openembedded.org">&lt;richard.purdie=linuxfoundation.org@lists.openembedded.org&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Thanks Khem, this passed in testing, the only issue was valgrind ptests
failing:

<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/851/steps/12/logs/stdio">https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/851/steps/12/logs/stdio</a>
<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/853/steps/12/logs/stdio">https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/853/steps/12/logs/stdio</a>

Copying Randy...
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Let me bite: it's time we drop valgrind ptest. </pre>
    </blockquote>
    <p>Okay but I'm not going to give up on the ptests completely yet<br>
      so the patch just disables ptest build, install, etc.<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:CANNYZj-fRsCoQFLFnvH9+cwvFPw8zWDvHM4eCv=3WoumAxdcxQ@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">It's just a non stop
headache to support and I haven't once seen it provide actual value.</pre>
    </blockquote>
    <p>It certainly has been a headache!</p>
    <p>I agree that most of the issues have not provided value but <br>
      I think some of the target tuning likely came out of trying to run
      the ptests.<br>
    </p>
    <p><br>
      Patch being tested:<br>
      <br>
      966f4c6fc5&nbsp;&nbsp; 2025-02-03&nbsp;&nbsp; (HEAD -&gt; master-next) valgrind:
      disable ptests<br>
      d392981530&nbsp;&nbsp; 2024-11-29&nbsp;&nbsp; valgrind: update 3.23.0 -&gt; 3.24.0
      (ptest fails, vg_regtest needs rebase)<br>
      <br>
      glibc is ready to go to AB but I need to confirm that musl still
      builds.<br>
      <br>
    </p>
    <p>I'd prefer to keep this order even if the update breaks ptests so
      that if we do decide to re-enable the ptests, it's easier.<br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:CANNYZj-fRsCoQFLFnvH9+cwvFPw8zWDvHM4eCv=3WoumAxdcxQ@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">

Alex
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------HiSaQaIs3fmv6Ib0HJ2kO2jz--

