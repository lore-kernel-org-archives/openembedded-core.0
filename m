Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4842C36002
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 17:48:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.46165.1742838513341907249
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 10:48:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5178f3fb87=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52OHkPVI031553
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 10:48:32 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45hrg427a9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 10:48:32 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52OHmWnI001358
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 10:48:32 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45hrg427a7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 10:48:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZacksoUoNvJ5nOm/fud4dsG0oeKToZJVhfrmA9FkSsNjtMHtADN1Il5bVWw1viZCn+kDjbjymWyQIz6mGm0+lpIrNLM32ztqsZlKIlv05PgYVRrunkBrCfaITU5XsFJHGoQ9DbpAD5tZxPKCb2YKE7jZOX5lfV+XLAoIuLbvFv92N4aDi6bZ8WLWFnZeX/AiIcqtrR8bQddNLcjE/+F/hbmN0ZYCgDXtCF8NjgnxtwPsGOS0Zq2QzUcL+BcGuQGFIjqfggkOuYBFzKl1L4t2AOc/+Trxz07l80c6jy3ddLYIsYk96L2VjL5c5aQ0ky0yC8xTdESwH45bcGGdhEfBVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HvUeEMNIclhapxRUTA4rk9RnrwHDj/A2yyngeCZkvgg=;
 b=CRFU9yh+oneoKlUTDEtEW0bvnS8U1RW839uvt6EI37aUWvFuWHoXZRb8FS68nzOuiacsBaOTDB7fWimjSooQ/BhKWns70eCb9es4zg5fZ+JyPIYCCjtwq2bP5Ow32S4Ln/hectf8Wz2SlZNYhYOCIEapzB5veGffA22DX3jkd7qxhBoLCjdm9C2FBRdAbZnEaZ6K33Zll98xkiKWuXh8A9RtYbWwmEBXWCe4qFtOpHiurZlkMem9mYtUf6WInHl1nSR45lFPCHpln6sbanItyGq+nKhT38fPpUtwt4yGgSa/oFubUmlTHqXineKNf8GVNWIAVi4KiBYVOBRBBKVJMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by MW4PR11MB6737.namprd11.prod.outlook.com (2603:10b6:303:20d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 17:48:28 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%6]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 17:48:27 +0000
Content-Type: multipart/alternative;
 boundary="------------YvlBUu1hl0D0dw0LTsKCmLRq"
Message-ID: <6b60bdbd-8095-432f-b3fe-37057b1cb086@windriver.com>
Date: Mon, 24 Mar 2025 13:48:24 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/5] rust: Fix build failure when multilibs are
 enabled
To: deepesh.varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org,
        Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com,
        alex.kanavin@gmail.com
References: <20250321132502.2607941-1-Deepesh.Varatharajan@windriver.com>
 <20250321132502.2607941-2-Deepesh.Varatharajan@windriver.com>
 <CANNYZj_5kjhg3WPi7E-UxYX2yFXw-KFpR0gdExet79uG-Xin_A@mail.gmail.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CANNYZj_5kjhg3WPi7E-UxYX2yFXw-KFpR0gdExet79uG-Xin_A@mail.gmail.com>
X-ClientProxiedBy: PH7PR10CA0023.namprd10.prod.outlook.com
 (2603:10b6:510:23d::21) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|MW4PR11MB6737:EE_
X-MS-Office365-Filtering-Correlation-Id: e7107f83-f3c4-4007-e1d4-08dd6afc151c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|4022899009|1800799024|376014|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dVNPZk43UXRrdW1RSk92N1U4MFZTbjNDVUhmMTNNZFJvMlByWittUUdiZnZq?=
 =?utf-8?B?ODk4Nys1Z2ZidEl6aVZzeCtDdGVTRm9DaWovbmJBeWZSaTY5b3hBSzBlSzdV?=
 =?utf-8?B?UExQd3dPTEJISjhMTnBscmRlbzJSRDNhMXRrTkhWVUx2UEhkK25EZG1ERzIy?=
 =?utf-8?B?N1BjTXZsNUlTSTVFN2JmTUJZQWtrMk1OK0dWOFlwalpaN0NQTWVjSFFIZGU2?=
 =?utf-8?B?Yng1SE1QN3FGcklVZy8xaU1aOUI3Ly9SQllabHlkSTEvcHFmSm0wYjI4SmVz?=
 =?utf-8?B?RVgvOW13OHJDSkFzU3UvY0tIVnhjVWJFSGxjcUNzU01tR3lianNjMXJHREYy?=
 =?utf-8?B?NDkyNExnTVlVRkY3VTRrNzc0VWd1bi9CbkoxUUpMaUZPbEdqK0pabjU2clZ5?=
 =?utf-8?B?cUh1LzF5R1FLYVY5aDdSOGlhbFc2K0x4ZG5RdnY3Z3ZoNmxKN1FGUkVzOGhV?=
 =?utf-8?B?OEloTGlnMWdqYVo4S25YZFJyRVV5UUlnUEt3bkgveEE0YzFpcXptcVY0bTFL?=
 =?utf-8?B?Tmo5MGphUDI4dE9ibmFZYUlBbGRCUllzM3hybXlYT1lPRmFSYTlMLzlLclEr?=
 =?utf-8?B?bUdyZzFyWnVzSXNGVSt6NU44d2VWVjhxNG9KdGdFcFd0cmFSK0NmbEMyZ3Mr?=
 =?utf-8?B?V0YvU2VvUGIvZDJmUTljcWJrbTVBTWd4anBod3BPa09pNklWWmVMQnlGeTJ0?=
 =?utf-8?B?WjZ2clpaeE9IS2pmbVZGTmxPODJQbVV5bGtVSjZOaS9tallEa1JuNWFRYVVP?=
 =?utf-8?B?eHNlK2txM2gwR1ViVDQ1aTIyZlJWOVNJNzdLd3RnSWRTYk9jd3lWYXNBblVi?=
 =?utf-8?B?RTd0WUNHRFI0bG9LZGNNSktYOCt2WHc0eEpJOVNra3pNRTZCZWtqRkhybVdY?=
 =?utf-8?B?bTJRNVB2c0t5eTNod2VlSnJGenhMV3VVdzQvd2ttczlGcVBJMFdHZzBKTHBC?=
 =?utf-8?B?VDVwZlJOV0tKdE5zMWRVem9POER4akk1djRrdkN3ckVXaGlvcWRWcU9hNjF1?=
 =?utf-8?B?QVdIalpUZ3FUeFI4Z3F3c1dvNzE2M1ZzQTh3TW1QOXZaZXMyOCtHOVIwN203?=
 =?utf-8?B?dVJyaHJwME9pc1ZsR0RWd2ZRTHVISnRRY1k2WGlkRGxVUkc0NkY2SE9KYVdv?=
 =?utf-8?B?UGJhbHI1bUlrUnA4TytXVS9od1Qza2JTd0NoZkVETmFZZ0ZaVWxzeHcxOXRW?=
 =?utf-8?B?d3hXYm00WXhmWHI2Z1dKSlFub3RmZUl1Z2ZsRGpkWjBTQnVSK25yTmR1SW1x?=
 =?utf-8?B?QWpTRnptbEswbjh6NXNkNHFiZ0p3TkVBNWJpcUlpckZjc1RjZWpPdnQrUi85?=
 =?utf-8?B?L1k3a1duNGFjbFlJL0dpdWI2SzUxN1pheC9Yem5odUlqaGZOdlpEejBkSHdz?=
 =?utf-8?B?SXlnQzYxLzRxRXRYVU9lR2VTc3A2TEFQZ1RpZ081bWVqNDRQWlpsZ1BEK0Rz?=
 =?utf-8?B?UlhuYUgxNGRZSjRFdys3QzllYXgwS1BMUmdPWGQvN0VZc3dGTzIza0h0eTFo?=
 =?utf-8?B?eWYrOE9jeUVodmR2bTFTejRxRk1xSUdJc0xwWnNNK0REam55N3Q1MWtWamVj?=
 =?utf-8?B?eTJlN1B6QTNvUURHNWRJM3MxMHVzdE50QWJqNHVLOFB3Y2FXWkVPeU8xbU5O?=
 =?utf-8?B?akxtSlhzUURpWnFsMm05RWYwYWxncVZpRE02MytGeHRSNjNJTXozZEZjeUYy?=
 =?utf-8?B?ZmdydjQ2ZmQ0SzVodmtJbE5GdzNLQ0trbENSNVFleWY4ZUdlUnIzbjdyY0Ir?=
 =?utf-8?B?b2Iwc2QyV3FWa0FjZnFTMWthcnQzc3NDZkprUnJKTzFZbUFWeGpacnZxUkFz?=
 =?utf-8?B?WVJoWC9HRWhZaWt5QVkvZz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(1800799024)(376014)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VEl2TTEyNEc5VXhmak5ZdERReG5RNkNrSUd3akpOZXNnZHJDYnI1TDUwYnZV?=
 =?utf-8?B?M0g0dmR0a05wTGNXeTc4WHp2S1Z0V09yZnhXS2JBbVVPUXFHa3RjcHdUSHhG?=
 =?utf-8?B?dU5pNTQyOW1YWUtHNVIvUlhyNFZ0Wk8zRFdUWCtuK01vL0hGK2twTm5uUmRs?=
 =?utf-8?B?NWZrNFJpNUY2UFVMWlBIZWtlM1BNM1c2dnY4T0VVWHFlZjkrWkVuOFloTlla?=
 =?utf-8?B?M3BYeU55dGNRaTJsMElXT1JRblFZN0Vrc0FseDRjdGZZNGZseXh1N2Z0Vkx3?=
 =?utf-8?B?R3B6NjZOZnllTzAwNndnVzJiVk1Zc0UrNUg4UW9kc3FJZzFNWVI5RUlNMEJU?=
 =?utf-8?B?MVBmTytZMm9kaVIyWmhNQXdZVngrK0tLU3NSYlBpWDB4cUNVQTdBYUI0TWVJ?=
 =?utf-8?B?R2d6ek1hZ2Vrd21aTXN5NHZ3SWIwV1VRNFhBYmY2ODJESU5qOG1QenNzdW1M?=
 =?utf-8?B?NTBLSGVHc3cwK3NTVUcwVlhjMWh3a3dMU0hyNVU4QXhtSXNMQnQvc2pFa3FI?=
 =?utf-8?B?Tk5pczZYN1ZxZVpGVk9kUnEwMXAvOXoySWt4dzVTUXI5RGh5c2poT2Z1R3dI?=
 =?utf-8?B?cUtjd3B6VHRBVzdqOURoN0ljS0R1TmZJYTdXOGo3Y2syVkJaVE9yNDBzNTRE?=
 =?utf-8?B?UldKZ2dnTGhyZGltYkw3RjNnTmZsb1g4bndLK3RlMTdTcHJrMFg4enhUd3Ri?=
 =?utf-8?B?WnRzREVmdTlyWCszaTRVNGlHVDJkMGtYOW9ENTlzejZlUVQyd1pDcHFJczU2?=
 =?utf-8?B?WXdMUTcycGJRSXNkK1c4aWVNZmlTRVpvaG1zbkVwNTBPN09HMmJPb1hoVS84?=
 =?utf-8?B?MXpnSFZMSlN2N0Y5ekJMK0xURU1vM29WUTNTUmJCODd1TnRtOTNzazNPQ1Zo?=
 =?utf-8?B?Tnh0Tnd6ZnQvRlprRzYrbnFiQzdCWm91Q04vL05kQVVJNkR1V3ZCSmVHM0Nw?=
 =?utf-8?B?cEtlajdRMnFBK3NlbGJoNnQ1VVpIeFRjRlNhTVBFcHhFVDNmbXFzSjlEMVdl?=
 =?utf-8?B?dXlxcXRiSENNeTRpV2dCYTdFMllRYUlvbDlJN1JibGh0azBmakZvajVudHQ2?=
 =?utf-8?B?dGZ1YTY5L0tHam9WY3V2VEtlR0tFY1VmOUR0L2U2Vi9xWWIrYkZJN0dYdC9C?=
 =?utf-8?B?SmdIWHpLSjM2MHM5VTZFZ2cyVlpOQmJ3UEhYUHhDZ2MyZFlBaFhKQ1BKcXFj?=
 =?utf-8?B?MnQ5d0RFa3FmZENlUHp5L3dyZUliLzh4UzlYS1RZaFVJamhBMnV0N1ZSYzBx?=
 =?utf-8?B?YzFzYVhRS2VFODZ2eEFmbHF1Z0NDZWUrMXhiN1lyclpCNHdiaUxaRENoRHF0?=
 =?utf-8?B?c01NMkM5bG1WNkVRM015azNyVmdia1Vtc0JScFRMczFPTXNzTW03WFNZSWd1?=
 =?utf-8?B?U2lwV0JqdGo5YjJUQ256c2pTd2cyaDNsWmFiSkdiZE1TRU4wMEZWMlQ5RXpY?=
 =?utf-8?B?MkJVVkwwTk9rd2JqRVNPVmt0SnVONERmQjduOHF2VWtBNUNkRk5pNmxMcWQ1?=
 =?utf-8?B?dUtVSE5LMEpvREhsQ3VsRjVYR0hUaVVYTHJsWVZvYWIrRi9INStmUWRWVGVT?=
 =?utf-8?B?ZEwxaGI1RU04S2Rpc3Y0TitEUjBpMkFiMzhEdmVYTmpjQXkvRkUrRGRiajNy?=
 =?utf-8?B?QmtIdVptL1UvemFKNTA4bTE1R0U1b2pmSEoxVU5lWm5ZUHJhV1AvVGk1NnlT?=
 =?utf-8?B?bHc0UzRuVlhJZkszbmpNUlVMYStxVEJma1RZTURnU05rZFdUR1NQMUFpOGky?=
 =?utf-8?B?dEtMVUg3M1dYcXlxLzhJQXZHWFhGNkF3R2R1NEQ0WmJCWG40WjFxZVJ5WG1a?=
 =?utf-8?B?RFVDT29IcHNFS0VGK2NaWFBnK1oxRUUyRzFVbFlOS2l0RUFBSGZHOGpnbUFG?=
 =?utf-8?B?bUFrZ2lFeDNPd1NnbWdpMWJMRDROUWpyck80TkpSUWRROEtYNENxTEtGeUY2?=
 =?utf-8?B?ZEhQNGJIempuY2hPSU1wNTZteEZtelVNMjRvODdWV2UxT0h6Ui85dndCRVRS?=
 =?utf-8?B?dW1ZZk9IdzBxUHBWN2EzMmxiei9TTHA1anJWU09hNGtkSzJteEp6NWxwcUtx?=
 =?utf-8?B?Mk8zVHZZVkRGRUx2bmM2elZoaE51YjlXTS9xRXpMczRYWHRjSTkvWkpSbDlU?=
 =?utf-8?B?WGtxY09GY0RBQkx0ZTRzUUlBaVBSL1pnU0RWSkNUaHRsa1dSSGZQWndTb1I0?=
 =?utf-8?B?cHc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7107f83-f3c4-4007-e1d4-08dd6afc151c
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 17:48:27.6443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UiDXFBfCKDEgU1PiObpgetHyyzi5XIQZbWz/uhx1g6IxGFrGZH5DCqMUfAq4DK8RJeqI3lYFnmjPJv4eiVGJqgAIXjUIZe+bQ93FmRxwtNg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6737
X-Authority-Analysis: v=2.4 cv=HZwUTjE8 c=1 sm=1 tr=0 ts=67e19af0 cx=c_pps a=qvBKVd3KFl3zkoLf5jvq7Q==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=9oIAAdUL0SlM9gdt9nMA:9 a=QEXdDO2ut3YA:10 a=pGLkceISAAAA:8 a=SBgPd-9KPVHTh_X7iwEA:9 a=I5j7i0SXXkz_YRJE:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: hZVGVsKKYzbud96xmvDKDHrG3EB0dcOq
X-Proofpoint-ORIG-GUID: GyqwUGUiuhl-F0A5_C_qTkPBRILguWBh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_06,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=684 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503240127
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 17:48:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213568

--------------YvlBUu1hl0D0dw0LTsKCmLRq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-03-24 5:23 a.m., Alexander Kanavin via lists.openembedded.org wrote:
> On Fri, 21 Mar 2025 at 14:25, Varatharajan, Deepesh via
> lists.openembedded.org
> <deepesh.varatharajan=windriver.com@lists.openembedded.org> wrote:
>> From: Deepesh Varatharajan<Deepesh.Varatharajan@windriver.com>
>>
>> When multilibs are enabled, rustc could not find dynamic libraries in the
>> lib64 directory due to the bootstrapping process searching in the lib
>> directory. This commit exports both lib and lib64 paths to ensure
>> correct library detection.
> What is creating and populating this lib64 directory then, and how
> does it decide that it should be named 'lib64'? Shouldn't either that,
> or the code that looks in 'lib' be fixed so they match each other?
>
> This looks like an incomplete fix, as it does not get to the bottom of
> the mismatch problem.

FYI:

This will block the 1.84 update until we understand the root cause.
What happened in 1.84 that we need this change?


../Randy



> Alex
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#213520):https://lists.openembedded.org/g/openembedded-core/message/213520
> Mute This Topic:https://lists.openembedded.org/mt/111827575/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux

--------------YvlBUu1hl0D0dw0LTsKCmLRq
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2025-03-24 5:23 a.m., Alexander
      Kanavin via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj_5kjhg3WPi7E-UxYX2yFXw-KFpR0gdExet79uG-Xin_A@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">On Fri, 21 Mar 2025 at 14:25, Varatharajan, Deepesh via
lists.openembedded.org
<a class="moz-txt-link-rfc2396E" href="mailto:deepesh.varatharajan=windriver.com@lists.openembedded.org">&lt;deepesh.varatharajan=windriver.com@lists.openembedded.org&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">From: Deepesh Varatharajan <a class="moz-txt-link-rfc2396E" href="mailto:Deepesh.Varatharajan@windriver.com">&lt;Deepesh.Varatharajan@windriver.com&gt;</a>

When multilibs are enabled, rustc could not find dynamic libraries in the
lib64 directory due to the bootstrapping process searching in the lib
directory. This commit exports both lib and lib64 paths to ensure
correct library detection.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">What is creating and populating this lib64 directory then, and how
does it decide that it should be named 'lib64'? Shouldn't either that,
or the code that looks in 'lib' be fixed so they match each other?

This looks like an incomplete fix, as it does not get to the bottom of
the mismatch problem.
</pre>
    </blockquote>
    <p>FYI:<br>
      <br>
      This will block the 1.84 update until we understand the root
      cause.<br>
      What happened in 1.84 that we need this change?</p>
    <p><br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:CANNYZj_5kjhg3WPi7E-UxYX2yFXw-KFpR0gdExet79uG-Xin_A@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">
Alex
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#213520): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/213520">https://lists.openembedded.org/g/openembedded-core/message/213520</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/111827575/3616765">https://lists.openembedded.org/mt/111827575/3616765</a>
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

--------------YvlBUu1hl0D0dw0LTsKCmLRq--

