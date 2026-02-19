Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6F6DC531BC
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 19:45:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22529.1771530321049776182
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 11:45:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=d5ZnSVMR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=651017371c=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JBtprF201270
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 11:45:20 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=bz6qLm/IJCAn/20hDU6DAm
	srEqHgElURqgLOsYW+y7w=; b=d5ZnSVMRkA4ohLsJBohxieJQyGV2C7W8lqVfem
	sBzkCwJ/w+7EmHBupIx4/qse8vVuw5bvnltBwOhjIcVs8X5TIlwYVecdkzgfp2d4
	jp/wcqMFINMIrmJjyOjtq/UAcqY527lLQRNOWmkBbLzx6Q+RVd2Tla/cl4Ujcrs3
	c56pMDPjZUXyL4QYQwL3HfSFARdi6VXPSbvBwWTfG7GCy3OTlq0fJsGTqQFQSxe9
	V3kw2cD/gnD8po8kPPSg7Kya42XHHoMAD1WLI7/IGxGwrcvyuTsWTu3epA60qJJj
	BYDyrwz+pXl32dgJ2FZ8q/cWzd81JKaWUIFWZSo+G+ObUKJQ==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012030.outbound.protection.outlook.com [52.101.43.30])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cdtuagstf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 11:45:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xCYcnZJTp50LrEsFHhRuox2OJmyxA1NJ3G3fXBLdoM7/kI4Ds5BNc0Wt4Kzh8khD9RHfRczeKfPF1lsHhZWDiO28RvugcbOEh4fI+76zYPOTHnG2hF+pFkU+FxYJV1MYOtPfJajIzOpoelXcVpVTC+j6OQpOnXOlP261Zb9xZI6GiG7o7CzpLCpIEh0D7+FiEz0m3vl59sg5Pps9CpN7JkKvpTjig5jM3IZN/0dbHTL/x3w2i2dWdljyeAhiTtTQg2FKlsOqri13GrAnNckG4erhpOcs6kA1oTHlj7O9l24LZRTefKozKUXSvMpeGyPhj/nWzlJYSmobTTRj3dxkig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bz6qLm/IJCAn/20hDU6DAmsrEqHgElURqgLOsYW+y7w=;
 b=Zyh5vpfInkBYZQlXX30W19reiSBU3eo9ongyw143Iubg25ZpFs8/ddvAWwiVZ1qnGSIJLC2+P1MjGzrGbOQUyanOQXXXdh9bOUEui9kPW4awzPWHxZAn2lSvFgkmc+3DofP1hrfYiXUlVqvS0R5VaQSrXybMf0icumJt+iO8SfT+uNSKGX4HU8MxVBVh0hYf9pxk6dc0oWflA7YSR3dpAnuvIINhEfcbXS/SOMItqWhw7vuOswwiAxm3Ry47KFPVnnpQi+a6DWHy/tj0C3qTU+/sO0Yxj+SXkuoHIIFdmxx57GbZ29GvBrA4BYVUUqDzQipI7qr10cxLfxMvVEGOnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by MW5PR11MB5857.namprd11.prod.outlook.com (2603:10b6:303:19d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Thu, 19 Feb
 2026 19:45:17 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%6]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 19:45:17 +0000
Content-Type: multipart/alternative;
 boundary="------------Aks0iXO09OlGnGQUV4ykciqF"
Message-ID: <787e9745-2f4c-4ea6-b4ca-433c822ab0b3@windriver.com>
Date: Thu, 19 Feb 2026 14:45:12 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/2] coreutils: kill and uptime are no longer
 installed
To: openembedded-core@lists.openembedded.org
References: <1895BBA9C4761CF4.1171932@lists.openembedded.org>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <1895BBA9C4761CF4.1171932@lists.openembedded.org>
X-ClientProxiedBy: ZR2P278CA0046.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:53::19) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|MW5PR11MB5857:EE_
X-MS-Office365-Filtering-Correlation-Id: e4c6f000-699e-4247-2ef6-08de6fef687d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|4022899009|376014|366016|13003099007|8096899003|7142099003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?a0lvZmE5akhnbW90ZzZKbVdGTEpOdDUwUG1LbXgxN1B4RGJ4c2pyRjRkeWh3?=
 =?utf-8?B?ZG5KRXp5RXRMSFJCRGwvWVNNMFZxYzhvS0pxL2ZDUVd5Um80dkxXYVIydnVn?=
 =?utf-8?B?ZFo5RHlDa2p6YzFwUU0xb0ZPeDllVVlQRkxXTXpCSVFaRHJiRU1jd25mNVlJ?=
 =?utf-8?B?b25xQi9LdEtTdENkMVVZRm1DYkt6MlI0ZTBDTUhybTBiYXhmVlhIbThveCtt?=
 =?utf-8?B?MDRRSjZDVkNRcFhGODRIbHovU3lOTmh2OFQvK3g3VTN0TVNySVltdGo2a2ZH?=
 =?utf-8?B?R0l2cUdocW5OYWRwRmIxb3JwbFlZOGZLeDErendXemRXaVNVdlROWUJZVFZY?=
 =?utf-8?B?YnVueVM4MHkwTjllY0tsSTR5aWNVcHlxMEVRS1p0clpNTE55UitwUzVCek51?=
 =?utf-8?B?M2QxVWhyYng4M3QvQXUxeFNkM2dkS1BPMGFtMzFTdlhGdlkzRnNLdTd3dXZm?=
 =?utf-8?B?QUhCS25ET2VOUDhOQlpySnpSOGVWRVk3WXVoSmh0ZzBMV2VUVkZHOUVoRk5R?=
 =?utf-8?B?d2YraC9jWWM0STJGbDljbElXNGdMNHExallSQ1REOE56WWJGMjVpT3p0Tk1h?=
 =?utf-8?B?elJsekV4S29vTWx4Wk5jajZVN0twZjFiOVBiYVhib1NnN01Ea0VOTUEyQ0Y2?=
 =?utf-8?B?eWU3U0cyVG5NcFJtMk9OQzB0ekk4Q1BoWEhBWUtZNnphNXBOVE5lSFJNaGRJ?=
 =?utf-8?B?cnF6cnN3bVZDK1dVeXZIaVpMQXJMaEtvTTV6TGFOTVlpZW9CeVJGRVR3dTIy?=
 =?utf-8?B?TGY2OGNrNEgxcHNuSkhLb2p1cXZ3eU8rTERRdVY1bGlTT3B5a3p6OUx2Ulgr?=
 =?utf-8?B?TFl0cjc0NG41Rkd6M2EzaXROOHdCcG5YRi9nZ29YdDRjYjQwOG5XTjMwc0h4?=
 =?utf-8?B?WnRZb2Y0bE9jVEo5YkNMWFd4eWlUVGw1VVY1WW45MVJrWGlKeHVqc0hDajgv?=
 =?utf-8?B?aFFLL1hnclZIZTloU3VuTU84cWdzZUcxaVZ0NE5jMkFCUUgzbi9NVytsTjRX?=
 =?utf-8?B?T3BzK3pnTEtDUzVzL0dreUVoZ3NmMFcyaEpUR1MvTzJ5dUtlNit5dlIyVVhk?=
 =?utf-8?B?VXAzZERmS29pQzBoNG9FOHRsUVhUWlg4WmJQWFFBQzhmcjNvVFp1Ymo0M25L?=
 =?utf-8?B?c1pMOUNRT05kV0N6LzI5TEh5SzhpY2xSNjk1WXlQWEZtWm1CWmIveFMxVlFK?=
 =?utf-8?B?N0xHQlNWVWFZem5hNi9TMnhlekVWM3MvYWx5bGsrcS9OWEd6VzFPcW11T0dY?=
 =?utf-8?B?ZEg4OVVsQS9qdlozS2szSEF1OFdYM2w0eHU1NFc5ZlBaQnlmTGhlcTJ3SGx2?=
 =?utf-8?B?U25pQ09JU0hQMGVwTWdCMG9mT01ZWUp5MFovMzFNL3FuUzlNRHByZm0wQkJH?=
 =?utf-8?B?U0daTEFYUFZrUytmMG1DbEIyS0Y1cm1zMXFVYkhxdUhsbG1RWk1UR2k2N2Ra?=
 =?utf-8?B?MWIzbDVOUjdyTFBvRWxFVHF0bjVvbFljSUhROXdyK1BXdU12WE1vV0RFL1pJ?=
 =?utf-8?B?YU00VnhoTjFIQng4ZEtXOVpGTFdVOWdHUG1VN0JTTE5wc0RmSGpndkhJVkt4?=
 =?utf-8?B?YU03SFYwbjIwTXVXeTVzSkN1Rno0N09RWGg1WGtyTk9SY3RnWEs2aDVDRE1T?=
 =?utf-8?B?NkJ0Y05rcE5yc1dnczVWWW11U1o5bklhS2FQN0hOc0c0ei9nTlVGOGhIa1Fp?=
 =?utf-8?B?NTNCT3F4MnFjWHpYT3l2QmRUcjRSd2JYYVFOTzNTMDBidmVJK3FpR1BON04r?=
 =?utf-8?B?d2MvaklzbW1rVmJhZlNhSzNRQWs4ak04Nms2MCsweWVjSlJXd3ZGRTZheFpM?=
 =?utf-8?B?K2dvQXZETCtkd1ZHbHU2MVhieWRzWW5sampVL3RZYWxqN3h0OVQ5Z2tUOW5h?=
 =?utf-8?B?SUhUZ1JtakQ1NGdrbThlKy9OdW9nTmFscUFSN05oMCtvRmlzeSs2Q1pVeitH?=
 =?utf-8?B?L1BzNWV1VVZVZ3VaYTJMMG1rYzZ2TlBqaVl4RDlQa2Z5ZURsNUZ6TXl2ekk1?=
 =?utf-8?B?SkhDZDBac1F2L0hMcytiVWpOc0JlQXBDZFE3ZGFVNDlIYmtoRkhWR2p5dVQx?=
 =?utf-8?Q?7dfP9u?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(376014)(366016)(13003099007)(8096899003)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?a0NnZitXS2VCUDRjSm5mVUtEUlZ5OWVPeHViWjFCNEMyLyt4Mnd1YlI3a0ty?=
 =?utf-8?B?M2xuM1huMVpqcnBPa3VCN3FFQ2p1SFpZcjVhOTBkc0IvOGtZOEpEbWdkbnE0?=
 =?utf-8?B?dVNKQWlTaWFVQmwrdGVVSWpoV2xpMStFUGg5dVlNZjViVFRvVm5HQTY0cldn?=
 =?utf-8?B?dVJwS0VZb3VMMjJHdUZyRmV6S3BmWlRWQWdDQ2NEVUFpc3luMlQwWDIvU2tw?=
 =?utf-8?B?cDYrb2RHUitFYVMyQmZZWTNCWEN1cWZLMHU2YUh1Q2dmSEtlVGZQSHEraThW?=
 =?utf-8?B?Y3NKQ1UzcVRIZXV2VDE2Z1dUbHBMbTg1V2RCVTk4VFllV1NiaVJFMjJFSHhp?=
 =?utf-8?B?QXE1WFpjdDloNG13eXZtb0syemgyYWlFUzhDMm02SGFVa2RWV29SdEM2cDZR?=
 =?utf-8?B?VjF3ODIyeEFqdUJpM3FudGJFTHIzcmkzY2g1TVN3UkxpSER5NHVUT1JVTG5y?=
 =?utf-8?B?dzJjWXR0eWo2bk9XN2I5VXJCS0wvZUNDcGVqNmFxUWhQSnZrMXdDbWJ3aFY2?=
 =?utf-8?B?T0Z6a1RPU2Fsdm5zVllicTMvTnNnRHpiZjkvMCs2ejgxQU40SHBxVTVwRXh1?=
 =?utf-8?B?ZGZCMGFnOE8zV2p1L08xR0x4WHF3M0xDRzhLNERnQzkwbllLSTFERHF3Rmdl?=
 =?utf-8?B?Tml5Q3A5V0JRaEJNM01xMVlnR2hlcGZ5T1AybldDTWswTlYrRkhhc3FrSlVw?=
 =?utf-8?B?L0FQckNRa2NIT3c1djlvUHFkcmlqWXBPdUl2WVlkZVVwRUlnbHJtYlFQWGFT?=
 =?utf-8?B?WWtqaFBWWFgvTU04Y2dPNUVnRjk3azlCYXlBZFkyV2k1OVgyZi8rcExYQm5u?=
 =?utf-8?B?TGZUTFNvZmJqS2hLNGNHOHB0dVliVFVUYjZaTmkyQy9rcjFjTWRoSlJzdVdx?=
 =?utf-8?B?RndEc3d2ZnErMHRETnhFZWhMS2lzZGk2QlBzSmM5NjF3TEgwOXhOak9oMWV2?=
 =?utf-8?B?Wk9ueHJsK1c3M05JdXAyVFNicHRVc3ZKUTdtc1hHQ1pabi95eEJiRDZmKy9E?=
 =?utf-8?B?d3d4Mmx2ekdWSnpiSy9ZdVFyenpzWXNMYmtrQzJZenpXTjcyOGptUUk1Sm8x?=
 =?utf-8?B?V3dyQ3JlazRGK2tkdHhiMkhNL2RYNXl3SUFmd3RlUG52cDlzVlFKM1FCMCtC?=
 =?utf-8?B?M2xoUFpLdCtBYXM2STZjZ05vRG5yaVVpQU0wWXd1SHo4SEpUSkxrSjZPMmNH?=
 =?utf-8?B?UGdnU3hNTC8vbk5Qc3ZEN1BDcnVDL1ZRN3pEeFU0ckhhclE2M0VGMHpNa2FM?=
 =?utf-8?B?ckRXdGlvTmU3ZzhTUFJ3elpuSFIxSlE2SlFjd0JiWTBPTUx5R1BRa1l4dXlF?=
 =?utf-8?B?MDYwNTlxamtxYnJYcDZ3NmtMMUVhSzUrZ0gvQUJyYWVjT1VvRXFBeDJlWG1F?=
 =?utf-8?B?b2JWV2ZlRnd4cEs3cFhudFRZczhCTU93V2pzZHBKUVdmcncxeW1Sc0lHbHdq?=
 =?utf-8?B?WWozTS9rWEIxa0ZPcGhhUWd0Q0JtdkhBVlhyMXlQaDJTTEcvK2p2WXZwRlI1?=
 =?utf-8?B?MVpyS1dFRGtjK1JobVg3VkxPNS9id0RjeVFIQndRLzJPRnhNWnUzQkZpTk9G?=
 =?utf-8?B?alRLdFVIZlRXT1dwTGkwcnZJTVJBVGJocjNtajhrRys5TEFReTNma0lmRFJL?=
 =?utf-8?B?Rjk5V3hYMFVLNFkwMmMxcVdlVTdPSVFoMWdIY2s5WmN1L3IvYWY3dzVQUjZ0?=
 =?utf-8?B?L3JFeVZTOXRQQi9FVWpCZWZXL3lDU0hzeDhFSUs4Si9SRHFkNWVVdGhIN0Vt?=
 =?utf-8?B?L0xENDVkeHpxQXNxaEpGM214WVJBSkl2eXlYTGxvaEo3bFpZU080UEY2cWxM?=
 =?utf-8?B?Sk1YMlBwZ29UQStwUTY0RTlTRXFUemRHMlR4S1N2MGE5QU16NVFxQmZHNHdu?=
 =?utf-8?B?MGJIaloxOElmdzNReGx0TEVtZWpRYjU3Tm44V0FzeWRLOGk5dUdTSUdTL09v?=
 =?utf-8?B?aWhFQ2ZOWDRiRUFoRGRzRy9PQ0t2QzdBYm5ac3V2bHh1Vm1xcmFDN0hLa1FL?=
 =?utf-8?B?S2dpZENnUWo1aFNxTEx0R1UwalhwSnFZaUFzRDhpY3NxOFcwNmM4bmtzYUE0?=
 =?utf-8?B?Z3Y3UjZOWDFNZVlESjdPUzk5Ky9iV2YydGpEV0EvZHZaWXBHZlRJRTRzU0Q3?=
 =?utf-8?B?ZStZdHVBVTE1YkFuM0oycW1tZXE0djZwR2xoUjJMckxQU0hEakw1QjVWZGgr?=
 =?utf-8?B?emFSMUwzZ29tUGorM0l1elhFOGVobXZVMVVmd1h4dWpnZmRZYVZaL0xpUFhl?=
 =?utf-8?B?b3BqbjRMZ0pwMldPaExRa2tRZWZNVm94TFEyYytRUE41dXE0RGNGbG9KZTZH?=
 =?utf-8?B?UmxHSXo4VHM5RUtFME5sU285MjE5YnZWekVXdTVMVkp3NjNtZ1FqQk03T3Zz?=
 =?utf-8?Q?FAaou1jU08Co1vO0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4c6f000-699e-4247-2ef6-08de6fef687d
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 19:45:17.6403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /J9A48mQM/8Er3p67bRnD7kWHmzgQYgiIildmSXOS2+qJJ9kH3UmGN1bfD/Ddu3jjdFYSTACGdnI4Gu9dQpzdFSbKtMBbEHElMwxhQce+9U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5857
X-Authority-Analysis: v=2.4 cv=OqxCCi/t c=1 sm=1 tr=0 ts=69976850 cx=c_pps
 a=H8CAifLk0DAaaH9V+JapoA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=NEAV23lmAAAA:8
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=q6nckz9JxiVCIY1dfSYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=_LTivCtssX3fFtaGtqoA:9 a=m4xIZju_4Bg4iU87:21
 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: M__M012lC_yQ4RxTJdgDGrQMrDBynUtz
X-Proofpoint-ORIG-GUID: M__M012lC_yQ4RxTJdgDGrQMrDBynUtz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE3OSBTYWx0ZWRfX9/MJ/Y/VYwbN
 o9LsjpJCDpq/P6uT1/r9mYl6eztf/+MZtg+03Qd5710g74sUUXFKZwtSTOfeKtiAFX3cWczxZ8e
 DRw9isl1ScHbZRBAQIVXPCVbD66Kd3f0DgUr1UG77bnnUAexC/ODxXn6dlz16rQwkSuRvC71VKA
 v8Vw8VL9HuRCpBSZ3lKQjU88lzt0icqiUd2Ij3GHVr8LSuLo7Kkff+WIBraf04DB1ZELi0z0bzq
 WoMZjkWOsIZQTg5xjxlSVLzShArBpC2WwcQ00PPr8EOOa8wazh73Q+OWyj5iyztCfAepyfW6v+I
 aOjjNcZYNAM6BpqfAPEQTBnUkW/sJb6fBYkCZQgN8Nkks6SioFBMllqkvPBIeeIMQQTPlszgKBu
 00mMdY6iNWl9VKKksdDJi5YOvqweBj2UCBizHbX7SgDcAHuKLbzGeUghz3E5umm2JlKquPImNqg
 7cHfnvYegSeqJTuFohQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602190179
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 19:45:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231441

--------------Aks0iXO09OlGnGQUV4ykciqF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 61JBtprF201270

On 2026-02-19 2:12 p.m., Randy MacLeod via lists.openembedded.org wrote:
> From: Randy MacLeod<Randy.MacLeod@windriver.com>
>
> In coreutils-9.10, as explained in:
>     6b399ad35 build: kill(1), uptime(1): don't install by default
>
>      * build-aux/gen-lists-of-programs.sh: kill and uptime are not inst=
alled
>      by arch, debian, fedora, suse at least, so add to disabled list.
>      Fixeshttps://github.com/coreutils/coreutils/issues/132
>
> Note that in oe-core:
>     kill is provided by busybox, procps and util-linux
>     uptime is provided by busybox and procps
> and in other layers there may be other providers of these commands.

This could and probably should be merged with:

 =C2=A0 =C2=A0coreutils: upgrade 9.9 -> 9.10

but I wanted the change to get some attention so I've sent it separately.

../Randy


>
> Signed-off-by: Randy MacLeod<Randy.MacLeod@windriver.com>
> ---
>   meta/recipes-core/coreutils/coreutils_9.9.bb | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-core/coreutils/coreutils_9.9.bb b/meta/recipe=
s-core/coreutils/coreutils_9.9.bb
> index 7deadded06..1a017cb0bb 100644
> --- a/meta/recipes-core/coreutils/coreutils_9.9.bb
> +++ b/meta/recipes-core/coreutils/coreutils_9.9.bb
> @@ -56,10 +56,10 @@ bindir_progs =3D "arch basename cksum comm csplit c=
ut dir dircolors dirname du \
>                   join link logname md5sum mkfifo nl nohup nproc od pas=
te pathchk \
>                   pinky pr printf ptx readlink realpath seq sha1sum sha=
224sum sha256sum \
>                   sha384sum sha512sum shred shuf sort split sum tac tai=
l tee test timeout \
> -                tr truncate tsort tty unexpand uniq unlink uptime user=
s vdir wc who whoami yes \
> +                tr truncate tsort tty unexpand uniq unlink users vdir =
wc who whoami yes \
>                   ${selinux_progs}"
>  =20
> -base_bindir_progs =3D "cat chgrp chmod chown cp date dd echo false hos=
tname kill ln ls mkdir \
> +base_bindir_progs =3D "cat chgrp chmod chown cp date dd echo false hos=
tname ln ls mkdir \
>                        mknod mv pwd rm rmdir sleep stty sync touch true=
 uname stat"
>  =20
>   sbindir_progs =3D "chroot"
> @@ -112,7 +112,7 @@ ALTERNATIVE_PRIORITY =3D "100"
>   # Make hostname's priority higher than busybox but lower than net-too=
ls
>   ALTERNATIVE_PRIORITY[hostname] =3D "90"
>   ALTERNATIVE:${PN} =3D "lbracket ${bindir_progs} ${base_bindir_progs} =
${sbindir_progs} base32 base64 nice printenv mktemp df"
> -ALTERNATIVE:${PN}-doc =3D "base32.1 base64.1 nice.1 mktemp.1 df.1 grou=
ps.1 kill.1 uptime.1 stat.1 hostname.1"
> +ALTERNATIVE:${PN}-doc =3D "base32.1 base64.1 nice.1 mktemp.1 df.1 grou=
ps.1 stat.1 hostname.1"
>  =20
>   ALTERNATIVE_LINK_NAME[hostname.1] =3D "${mandir}/man1/hostname.1"
>  =20
> @@ -143,8 +143,6 @@ ALTERNATIVE_LINK_NAME[lbracket] =3D "${bindir}/["
>   ALTERNATIVE_TARGET[lbracket] =3D "${bindir}/lbracket.${BPN}"
>  =20
>   ALTERNATIVE_LINK_NAME[groups.1] =3D "${mandir}/man1/groups.1"
> -ALTERNATIVE_LINK_NAME[uptime.1] =3D "${mandir}/man1/uptime.1"
> -ALTERNATIVE_LINK_NAME[kill.1] =3D "${mandir}/man1/kill.1"
>   ALTERNATIVE_LINK_NAME[stat.1] =3D "${mandir}/man1/stat.1"
>  =20
>   # The statx() requires glibc >=3D 2.28 and linux kernel >=3D 4.11, it=
 doesn't work
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#231440):https://lists.openembedded.org/g/openembedd=
ed-core/message/231440
> Mute This Topic:https://lists.openembedded.org/mt/117898090/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [r=
andy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------Aks0iXO09OlGnGQUV4ykciqF
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2026-02-19 2:12 p.m., Randy MacLeod
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1895BBA9C4761CF4.1171932@lists.openembedded.org">
      <pre wrap="" class="moz-quote-pre">From: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a>

In coreutils-9.10, as explained in:
   6b399ad35 build: kill(1), uptime(1): don't install by default

    * build-aux/gen-lists-of-programs.sh: kill and uptime are not installed
    by arch, debian, fedora, suse at least, so add to disabled list.
    Fixes <a class="moz-txt-link-freetext" href="https://github.com/coreutils/coreutils/issues/132">https://github.com/coreutils/coreutils/issues/132</a>

Note that in oe-core:
   kill is provided by busybox, procps and util-linux
   uptime is provided by busybox and procps
and in other layers there may be other providers of these commands.</pre>
    </blockquote>
    <p>This could and probably should be merged with:<br>
      <br>
      &nbsp; &nbsp;coreutils: upgrade 9.9 -&gt; 9.10</p>
    <p>but I wanted the change to get some attention so I've sent it
      separately.</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:1895BBA9C4761CF4.1171932@lists.openembedded.org">
      <pre wrap="" class="moz-quote-pre">

Signed-off-by: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a>
---
 meta/recipes-core/coreutils/coreutils_9.9.bb | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/coreutils/coreutils_9.9.bb b/meta/recipes-core/coreutils/coreutils_9.9.bb
index 7deadded06..1a017cb0bb 100644
--- a/meta/recipes-core/coreutils/coreutils_9.9.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.9.bb
@@ -56,10 +56,10 @@ bindir_progs = &quot;arch basename cksum comm csplit cut dir dircolors dirname du \
                 join link logname md5sum mkfifo nl nohup nproc od paste pathchk \
                 pinky pr printf ptx readlink realpath seq sha1sum sha224sum sha256sum \
                 sha384sum sha512sum shred shuf sort split sum tac tail tee test timeout \
-                tr truncate tsort tty unexpand uniq unlink uptime users vdir wc who whoami yes \
+                tr truncate tsort tty unexpand uniq unlink users vdir wc who whoami yes \
                 ${selinux_progs}&quot;
 
-base_bindir_progs = &quot;cat chgrp chmod chown cp date dd echo false hostname kill ln ls mkdir \
+base_bindir_progs = &quot;cat chgrp chmod chown cp date dd echo false hostname ln ls mkdir \
                      mknod mv pwd rm rmdir sleep stty sync touch true uname stat&quot;
 
 sbindir_progs = &quot;chroot&quot;
@@ -112,7 +112,7 @@ ALTERNATIVE_PRIORITY = &quot;100&quot;
 # Make hostname's priority higher than busybox but lower than net-tools
 ALTERNATIVE_PRIORITY[hostname] = &quot;90&quot;
 ALTERNATIVE:${PN} = &quot;lbracket ${bindir_progs} ${base_bindir_progs} ${sbindir_progs} base32 base64 nice printenv mktemp df&quot;
-ALTERNATIVE:${PN}-doc = &quot;base32.1 base64.1 nice.1 mktemp.1 df.1 groups.1 kill.1 uptime.1 stat.1 hostname.1&quot;
+ALTERNATIVE:${PN}-doc = &quot;base32.1 base64.1 nice.1 mktemp.1 df.1 groups.1 stat.1 hostname.1&quot;
 
 ALTERNATIVE_LINK_NAME[hostname.1] = &quot;${mandir}/man1/hostname.1&quot;
 
@@ -143,8 +143,6 @@ ALTERNATIVE_LINK_NAME[lbracket] = &quot;${bindir}/[&quot;
 ALTERNATIVE_TARGET[lbracket] = &quot;${bindir}/lbracket.${BPN}&quot;
 
 ALTERNATIVE_LINK_NAME[groups.1] = &quot;${mandir}/man1/groups.1&quot;
-ALTERNATIVE_LINK_NAME[uptime.1] = &quot;${mandir}/man1/uptime.1&quot;
-ALTERNATIVE_LINK_NAME[kill.1] = &quot;${mandir}/man1/kill.1&quot;
 ALTERNATIVE_LINK_NAME[stat.1] = &quot;${mandir}/man1/stat.1&quot;
 
 # The statx() requires glibc &gt;= 2.28 and linux kernel &gt;= 4.11, it doesn't work
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#231440): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/231440">https://lists.openembedded.org/g/openembedded-core/message/231440</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/117898090/3616765">https://lists.openembedded.org/mt/117898090/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------Aks0iXO09OlGnGQUV4ykciqF--

