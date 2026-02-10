Return-Path: <daniel.dragomir@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8112CEA810D
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 13:02:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19047.1770728547711977045
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 05:02:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=sLCOc+wk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=650135ed7e=daniel.dragomir@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A5m71V1762305
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 05:02:27 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=h6IJEKJXHJ7/Ey+7cXyZwdJ/9vowRrGkvRDQ9uPOZRM=; b=
	sLCOc+wk9hcmCl2Yt884ig37TdldWTFXbwxqg7eXPSjO4E2N2FNm+TqiX8XhB8Ph
	2YpuFnKhvBXhFIi/EdPxVYX2MB3nOUC6C+ZqVH5NQYaKdWKzMpNJEWDuS9FByoH6
	qTbqmgMS9QUeLTMsBBNxKlcdyCdLYseCUyv03ZDF0IQzu8Mtf5dJfsBBIzu4IhGp
	vswCKkSHjp5uF1OCwE7IOJpMOjCQcM38E4T1Ijma/GTWIzpiA15AhiFgf72BfGmD
	PiVUCSSyhW3+zNMTk22VM5IYqMOhGZKn6cM+FMsHKO8oM2sFGK5gt8PRjJwhiwxs
	gcgTt7cVLbmBuW3mw3OhMA==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010034.outbound.protection.outlook.com [52.101.61.34])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c61j4u2p2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Feb 2026 05:02:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oHLMwOfgHOkK1wdB64rcPWrHFaC3uZAxbDccd/fuCQhSP7c/9UzwTlwqKb47+VABxHAu5Nb7B9a04KONH4ub/H7gLYKqiNgP2XzKkMXLUDwYMwjfN2TiaPaJytwqRFhP9xXZ2greFfieWvjMqbgc6YZM/XvImtdElZUaQy07QwKDfAJRWlf4wjyqfPVY/9WwQ4nwvT7zJggkUlhR7BfX4naxx8GFFKojL6fn75qjDlwggS+3KMQW2bbZT5Miem1D++TnmikURCeKIqb5Ms7AvEGVPjSvUV/OTi47MCu6N2CZkcyPmjqpEx/P8lTMcMpRt/vZ7joOM1asKy+a9OIHlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h6IJEKJXHJ7/Ey+7cXyZwdJ/9vowRrGkvRDQ9uPOZRM=;
 b=unnrExoPHEt4Mg1Yv037mW8bQXETYN/eb5a8T+k30Ifi6RJeuuc8dmQrE3sHkPvL5Wnf2sP2WksREID0zbv+Z5zx2j9n3zj6TE91EROwdjCtj1wDOrDK1CsomH7liwi8+gss2OZNthH+TqIe7aWNMHJDWOUOMmz2ucnOsSPCma2C98q2uW+7EhbF9e5vxK5v/NAjuMn7rHuNEsSBlogjaWSgB5/l1TzJvWKKHxLsgQmX8XFIot2VVaOCDdRRKVDQhtXeRV62s1ysSe6s/GMnPl01lLgqcuUzIdxnzEI18JYbt5SLtpgoo6gENjly5ZaGz+RYFJ/bigy5yj9QdPIvEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY1PR11MB7981.namprd11.prod.outlook.com (2603:10b6:a03:52f::12)
 by MW4PR11MB6864.namprd11.prod.outlook.com (2603:10b6:303:21b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 13:02:22 +0000
Received: from BY1PR11MB7981.namprd11.prod.outlook.com
 ([fe80::f002:6d1e:9df4:52b1]) by BY1PR11MB7981.namprd11.prod.outlook.com
 ([fe80::f002:6d1e:9df4:52b1%4]) with mapi id 15.20.9587.016; Tue, 10 Feb 2026
 13:02:21 +0000
Message-ID: <b98b1d52-9839-4fe8-841b-412d3faca754@windriver.com>
Date: Tue, 10 Feb 2026 15:02:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] wic/engine: warn about old host debugfs for
 standalone directory copy
To: Ross Burton <Ross.Burton@arm.com>
Cc: Paul Barker <paul@pbarker.dev>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20251218101524.703244-1-daniel.dragomir@windriver.com>
 <494e78c31feaaec6cf5c4c96ad3cbf45ac19dd5d.camel@pbarker.dev>
 <a77d83f822d4431d08307570482ebd024bcc5238.camel@pbarker.dev>
 <bce56a9a-88a2-4642-a42a-9ece138fb8ea@windriver.com>
 <8D0B2530-B94A-4B18-8341-C64D76D56B60@arm.com>
Content-Language: en-US
From: Daniel Dragomir <daniel.dragomir@windriver.com>
In-Reply-To: <8D0B2530-B94A-4B18-8341-C64D76D56B60@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0224.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::45) To BY1PR11MB7981.namprd11.prod.outlook.com
 (2603:10b6:a03:52f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR11MB7981:EE_|MW4PR11MB6864:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a1d0bab-8b60-4c16-a549-08de68a49f7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?LzFoSnQvNzhUbVN5dVJzaG9kSUNObXFlNlBCaEE1TkxkRUpUMzBBdkkyaWts?=
 =?utf-8?B?cVdDc3B0MTNqZkdDNmZsN0xSV1dJa3dlME5mdmk0b2ZLSHRBQUFuVytkblRI?=
 =?utf-8?B?ZWJuZ3BFc29WbHdteXZZbXVKT1h1WUdVMjlDNTlSSExPbUExcWtMQVgxdXd0?=
 =?utf-8?B?RyszNDFMSnk4c2NjT1BaRElZMDhBU3hHOUtOeUlZN1NGZUNabldjaTRzd09T?=
 =?utf-8?B?YVlnaGhtWXpoUFg0TWVSWXFFSlpvc0NQVnJlNmtmNkhFYnRDcFYydVF4dVgz?=
 =?utf-8?B?aFFBSGh3UzM3MDY2Z1VodTIvM2hqQmgyK09VaXQydEc5YmNBZjVSMTdkQlZ0?=
 =?utf-8?B?L2VhcCtWNnNRbEpkNzMxcFpkclNQNy8yU2Z5TW9VOXduQTBJWXRHREZYU3Rw?=
 =?utf-8?B?dVk3UHEvbno4eU1iSHpUZkxLcjBmakRBdllKMFVBVThoWUdvL0ZZb08zdUhD?=
 =?utf-8?B?UkgyTXkvMUFUWGpUMitqWjBxQzRDcHRyWHovaHd4YXdwOG1XQThMQTU4SURG?=
 =?utf-8?B?U2VCSThYTDVkOXlXeXJoOVh3SnM5Tzl6NGtRYTM5Z2lXNDJ5YXFrUDZFRWhN?=
 =?utf-8?B?UVhiZ3pzQi9nakdqanRRaXpFYkd2eUx5VXVlbHpyd1daN0lRZnEzY0E4K0tT?=
 =?utf-8?B?RHNmOElvYm1rb1lOK0d0SXVhOWo3amdHMGJhRG5oeXBLNVIyVUFDMi9IckJH?=
 =?utf-8?B?YSs0K3kyTXBtbGFCeUgrQWJ2NXhaZ1hLTHI1OEhCOUN0SVV3N241NmtaWXVz?=
 =?utf-8?B?TWk2cjJ1UEJ6UVh0MXVZQ3JBNHo5cHhvVTFoeHh2Uy9GSW1EYTVMMXNzTVNz?=
 =?utf-8?B?dzMvQ0hmNzVlR3lvVEdocVMwRGlGTUNuTUNYRkVBeWZneGF2dTRhM0oyamRv?=
 =?utf-8?B?MnhPQ0dIUzZuSG1OMVdHUEcrN1Jlc3FvOUxtazFDUThHclNubEtZWWxPZWZx?=
 =?utf-8?B?MWozWHcyS0d3THNob011amxRbHBVS0VndmR5NFA3b3lSbEZnblEyQzFuMzEw?=
 =?utf-8?B?Y1VPR01IdzdxU1lpSDR3QW1LVmdSV0lRMnpkdmtpVW5rb1VxejNXZ0YxYU5D?=
 =?utf-8?B?Y0JtSWFRcVpieEpjNVAxdURwTkovVElzWW5UMC84aUUwMVBqY3Z3cVVpSURW?=
 =?utf-8?B?YVFZN0tIcllXbGhnTVR6MFQ5M21sWmpNM1pNTU9LTHBvOU1jVll4dE9IZURQ?=
 =?utf-8?B?WmF2dzJKeUYwYzlxekZDN3lYUDR5bWo1ckNXWnRCTW0yREFlb2dGNDR4Y0tp?=
 =?utf-8?B?bWZSR1lWSStHbG9tTXczYmR3T0lsazRxSDR3aVZCYzRGU1BMSnV3eWkrUnVr?=
 =?utf-8?B?VXFIQno4SEhRMGNEMU9NOGpzK01RZEx3ZG9naTlvWWRvK0JkNDhvaGFoMkZs?=
 =?utf-8?B?WkVWZjArSWJlN1lIZmt2OWdINENqMjUzR1c4R3N3dUJ2bldlcVZxWlJZaDVY?=
 =?utf-8?B?dysrZ3hiSW11bHA0MVViNlJxTU0rMUFpQUZISGFraC9jQ1kyMFA2VUtvcjJW?=
 =?utf-8?B?OUJLc0laZ0JzeVYrcEljTFJTRmxMTkl0SU5sOHRxN0xJQ1lmU29sd3BrbElF?=
 =?utf-8?B?Qm10Z25mWVJWYTFlcmY0bWxFbVByT1FhNDA5bVUyN1ptMUJiRCtvS0FnVkRn?=
 =?utf-8?B?cUNnSWdySlRYOHpVVUMzRHExczNVKy9WR3dJZzlzR3FQKzBHYlN2eVRDNC9H?=
 =?utf-8?B?YzVBdlY0Z2c3OVlDc0Zsa0lLVk4xVTgzRGhzamZzWElTdkFOY2dWNkZYYXdt?=
 =?utf-8?B?UDEvLzZjWXVxMDk5TDZpa2psL2xEbnhTS0p0OXhzM0lwc290R0w2VzJaWEc3?=
 =?utf-8?B?RGZpZ3dBYlNLVHQwZzdvSnUrc0VzRUNJNWhkNVpzcFh6TXd0RlFjbTh1R05s?=
 =?utf-8?B?SHV3WlNMMWtWalpwT2pheDdTVDYrMmZ1K3VLZjg0UWJCZDJoMFI2L1I0VGFq?=
 =?utf-8?B?SWE3czk3aklYUWhjQUFOYmx4WWNCZ3VINThIVXQyNGpMQm1UbjlXNVl6MmZE?=
 =?utf-8?B?Ty9yYVFBSHNiZW85ZER1SFdMZW1aNGQySnI1ZStLc0JxTkhIK2toZE1FZ25q?=
 =?utf-8?B?Zm10ZHVCbHNDNVNRQnhGcDJvbW13aTBReXM1YnprY3lUamtHRkJMRERON0pz?=
 =?utf-8?Q?EGqU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR11MB7981.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TFM3ZTM4NWFGemZSSDVLTjlnZlc0R3NVNXhLN29WeU1IdFl2YkFOenBXOXhP?=
 =?utf-8?B?S29odEhTOXhxcXgvdDBkV1ZBVzZwZVZlYWlvNHplMXBVaVRFaWNGcGRrTm9V?=
 =?utf-8?B?VTVERUYxa3hHZFVXcHlYSUJJL1g3L1RiWitLdGtxbDhjVHVCOVBMNFJvSTlp?=
 =?utf-8?B?NUNRTndhZExqa2Y4bFp4UEpydmJFMkJwbVpsbGRwTXdYakxSMlZRcFZKcEZI?=
 =?utf-8?B?UEhRcFhlamUwNGxIeW5UY3V4Q2xsZ2k0OWVNQ3h1NnF1aURFNC8zNE9saDhY?=
 =?utf-8?B?UFBTQUlBRHFpKzdrbzg3OWNSaGZvQktRU05NMWkxQ2s0cWlXUVltZU9mdHIw?=
 =?utf-8?B?UFVURkwwNzBiU0xITFg5alkzL0t4TnhCZ2g1a0tITGhpVEJSR1NPbWRQL3h5?=
 =?utf-8?B?Zk9tY0hYQm5HMzd2SkRRS3FlMTVFUGlsYXpHR0hMS2M1d3B1TGxsUTdIRVNG?=
 =?utf-8?B?a2hrd0NmVU1qZm54R2NhOExXMENRR0wzbVBubDl5ZlMzN0pyQXViZUpKQ0JF?=
 =?utf-8?B?cEdIcWsyTUlxZm9odFdYd0Zqb1VLWEFvRHIvTlByejZ5Q2dodmQ2OVhYV2Q2?=
 =?utf-8?B?RDU3MmlCRzRNa1g3UTZPU2tFNHQ5bUo5aVl1RmFZMXhHSk5QYXpZTnIzNXM4?=
 =?utf-8?B?K2RBK29WTWw1aTBCdithZFgwVVpCalMyM3NsT3ROWHVxRzFFQUxjRWNReFdV?=
 =?utf-8?B?R2J2c01VZm0zZ0hQbTdMaTlkN084VTZQM1FkeUVVOGJJbW9uRVpGNFU5c3Rw?=
 =?utf-8?B?YStYSTdnZERFTWlVQTVUbUhEMHI0V05BVm9HZ3ZOTUtmeGZPT1l5Q2hSSXI3?=
 =?utf-8?B?UUV2dkFmR3dIbnBocDJWdzczOC9TTVlCTXEybkJuUFVQZkIwL1lLODVldmh5?=
 =?utf-8?B?KzZCMkxUL1kvWTY0UVFKcnBlcDVCaVh6dVBmQ1BNWVlxODR6UzlBTmhTQjNm?=
 =?utf-8?B?VXplam9zYk1tVVFKQVNJSDVLaXlVQkRCQ1IrY2xLWmNVVHUrU0s4djdYMWM3?=
 =?utf-8?B?Sk5iRlQ1VjQ0bURnZ0N1Y0k1Zm5qVm11WVpuQ2ZnSm5nQi8rUGUwbURvek0w?=
 =?utf-8?B?ckhOQXZRL00zQjcwKzk2R0hCOVJwVVN6MDBSZHY0RXBYN2ExN1MremZVZFRT?=
 =?utf-8?B?Sk5HTThKc21ZYnVValF0eCtNUVI3Uk1uYks1N0V6L0V6SXF0Z3pxb3NwZmxR?=
 =?utf-8?B?dlluZEFnV0hOOHdFdkdZVU85RnQ5MS9KYXpINXd0RkJtMGFEZ2JXSnZFUHBQ?=
 =?utf-8?B?SnF6Mk5EWUplSEt2SGVGaG5tWFlYZU5raTJuYzhRc001YzcvY0xvWlFxUS9T?=
 =?utf-8?B?QUt5cTZ2azRhWW9mV0oxTWVFUmJSWUVSS0tPVXRjUXdBSkozc2xxbCtqNkF6?=
 =?utf-8?B?TTRPYnd1NkczamNvdGhuRlIyMXhHWVBUdCs3K3EwSXpTOExIS3BnS2JQckNJ?=
 =?utf-8?B?M1p1NUNLNmI4TXhPSTNVZnNQbGJYTklKU0hJUndmT2xGNEZJNnQ0NC9nT0FB?=
 =?utf-8?B?MElDbmFlNTNQenQ3d0JWd2pXdGFxUnhvVnBrNGJYd3p4NjJPK1YzRXhCMGJl?=
 =?utf-8?B?cWdvMVJwbzhFOTVrT2dhRXBzbklIRnF2T25BWXJDdCtJSGdFcXdyam9RcmUy?=
 =?utf-8?B?bVJ5cnZXUmUwa2VTSVcrVlZOZDdLbEZOemI4VWM1bTd4UGJacTVEbkcxT29H?=
 =?utf-8?B?V2pRT0syc1c3SE1EZTFwZG41N0dXSGRiQTFpMkpYdE5vTnh5WHBvdTNFaVAw?=
 =?utf-8?B?ZHM0NHlkbTRGcnVha0FROFdQMjZRZy9KM09RZ2VhcEJHb2VRRytLU1p2dE5l?=
 =?utf-8?B?ZTBxQUs4TWVRR3AzM2dLenRwNW9mR05GMysra3lqU2o4VVRDNExaeXIvM21V?=
 =?utf-8?B?TXRQOTBHSVlBamV3VjVuZzFWd2VwUVBjMjB0OVhpSG1Tb0ttZndpYzBNNFBQ?=
 =?utf-8?B?ZldjU2Q2S3V3UXI4eDYrWjI3UmM5N0d5anRLQ1FKb3ZBUDZWbzB3cHNCblF2?=
 =?utf-8?B?ZEVCQ0NZQTVmejZRMEV3TThTNVpVamlxcmRrUVZEa1Q4MnkvekdaMGlhU2ZT?=
 =?utf-8?B?Sk40WFJMS2dLMnFDbmZ6N2UzcStzc2V0OGY3eVFOMmVpZEtjbmR1L2NseWMz?=
 =?utf-8?B?NFlQTGNiS0dpa3lMOUhVSmZNV1lWL0ZYdXVRS01WdVJUc1B1RHNweFRWdHJt?=
 =?utf-8?B?TU42TUpWcmpac3RnQmt3ZDY5SkhJNFBtU0tMV0lkaXVXUTJteS9pVHVGc0pT?=
 =?utf-8?B?R2o4Sld4N0RWajlNVWxsWXJoVG8wdVlTdjdpSVZHOXdxazFiYms4RnZmKzJq?=
 =?utf-8?B?cTRUVVZuVTBvVHlCSzFpSlh4T3JWdE81ME9wOHF6a1lvNnF1eUJtZmF4dGdm?=
 =?utf-8?Q?uIezN1xOKtZTG73o=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a1d0bab-8b60-4c16-a549-08de68a49f7a
X-MS-Exchange-CrossTenant-AuthSource: BY1PR11MB7981.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 13:02:21.1040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: phG9yPpSyUSQuASUUB3BAcH4RZr2YSveV5ShX1EA+NwVroqJB9jZymkxJ7Z98PsB9aJs6hdMS0rcOGyr0gautTI7L7/wOznXml7WiDCJSLA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6864
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=Wb0BqkhX c=1 sm=1 tr=0 ts=698b2c63 cx=c_pps
 a=IMbvhL78Fdh+aiPumIwVPQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8 a=_WFzSNuGQ6OL-CRQVbcA:9 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: 2nHWqAWRtA3HBPZFCgmX_brDr7dgiy6H
X-Proofpoint-GUID: lwT3ISkkO6SVbIS6uLrkXn9qCTq73-QW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDExMCBTYWx0ZWRfX0epQrcL2FlYx
 c9j3EYXKQ4hrX0gsE97gRJFgeZG7bYhMAOuYzNLxA3OkQrI0L8ETSTiFgvwsy1pjbYRNcsgNhn4
 wWqC/C1cu85NbQSX7PzWq4sT9dkl1VhMzGBEevCzJZMj7Q7zU24nAWxobWbF5eL1rx5rkU1L4pW
 okYIEciponfs7LFF9Dejf5Eb0ryc/vSABTiccTuZ0bf/wq0B8yiuZTwsj7KUuCLuqqo0o/3SGlC
 qm9KJfXzjczpY0psZM3qV5zbrAc8YC32btp6S5TgEFdqjo5vkeARGv+6SMz17PJA9zdkg1JGz3N
 7snIoPOY29OXYp3qPS4ZgjEt2NPP+tNAqRV7MMKzsgDYO//jgg8y+L2KtWQnqd+QO3kTWkuO2De
 UO/IjL9he8nOECx2HuSRaFCzZF8q3kr+ca7lxWrZpqvSuQKL9CznXg6UiP8z5fqW/gYqeodO9jL
 i/5fvC9Cmws5GkAgweg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_01,2026-02-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100110
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 13:02:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230894



On 2/9/26 20:12, Ross Burton wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> On 18 Dec 2025, at 13:48, Daniel Dragomir <daniel.dragomir@windriver.com> wrote:
>>
>>
>>
>> On 12/18/25 13:46, Paul Barker wrote:
>>> On Thu, 2025-12-18 at 11:34 +0000, Paul Barker wrote:
>>>> On Thu, 2025-12-18 at 12:15 +0200, Dragomir, Daniel via
>>>> lists.openembedded.org wrote:
>>>>> When wic is used in standalone mode, it relies on host tools such as
>>>>> debugfs. For directory host->image copies into ext* partitions, wic
>>>>> uses scripted debugfs "-f" input with multiple mkdir/write commands.
>>>>>
>>>>> Older host debugfs versions (< 1.47) may behave unreliably in this
>>>>> mode and can silently miss files. This does not affect builds using
>>>>> debugfs from OE where the version is known to be sufficiently new.
>>>>>
>>>>> Add a debugfs version check and emit a warning when an older host
>>>>> debugfs is detected. The warning is shown once per run and does not
>>>>> alter execution.
>>>>
>>>> If the risk here is silently missing files, resulting in a corrupted
>>>> rootfs or worse, I think this should be a hard error.
>>>>
>>>> Consider the case where someone relies on a device having a firewall
>>>> enabled, but /etc/nftables.conf is silently missed during construction
>>>> of the rootfs ext4 image. That could result in all ports being open.
>>
>> This failure can only occur when copying directories into an already
>> created WIC image with an ext* partition. It does not affect image or
>> rootfs construction.
>>
>> My understanding is that `wic cp` is a post-creation image manipulation
>> tool and is not used during rootfs generation or WIC image creation.
>> It is intended solely for modifying an existing WIC image without
>> mounting it.
> 
> Which can be done by people in production, so I agree with Paul: this should be a fatal error, not a warning.
> 
> Ross

Understood. I'll send a new version of the patch with error instead warning.

Daniel

