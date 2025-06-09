Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 849D4C61DB2
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 04:21:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.51577.1749442898968578990
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jun 2025 21:21:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=82556ac094=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5593spNU003989
	for <openembedded-core@lists.openembedded.org>; Sun, 8 Jun 2025 21:21:38 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474mxm13hc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 08 Jun 2025 21:21:38 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5594LbTp012053;
	Sun, 8 Jun 2025 21:21:37 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2086.outbound.protection.outlook.com [40.107.92.86])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474mxm13hb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 08 Jun 2025 21:21:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UGSj/dEGz3CJqV5InHCpYCkukuJxDcYyTRS9YcoUFoztj9K//Zg7TYij9jTIrr9RPH26I293u8hriUxP99ka0lX8uThWbMsk57kWbInzSVSPZPQLm/ii475AZ3HnyKN3rLIw+MOM7wmNS10dFm+3kvgHELKrsV0Paa/vnYHF/CekY0wsPpyjqtGgY9yPlxDJP+Tt0cMHI0OiqfAcAdz6NmFR+vihbsSpFTc9uVPxvi1p4uHNlzwxJk449vBBB8dTfdGkO6xu218gDO6+TeX2kaGddl7n3Myl4oAtGnvRws9JUO/ofNqhDsU983rdsqnD/YIwTcpjSrXg+BQOSdd+Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ojxNN9KI3oMocjqkIFnEtKh4FnZ1z/8iUDC5Lrqg6mQ=;
 b=UmIXtj/gjla7XODLhlnbLJlugEV/p98BsR6ubiy8KNu2guk461NffErc8z5ojq2A/UgJkH3abzO981GnuhaqtK3NtKUk6VIrpV20xgZptRYtRzWiE2yR8fNpBNKOgqqpPwzy/2jFOfAr5oCrCQ9qSLJRWGLSJAp0SNa7l9yxeuWnTh50NExqsCuoSscsR0V1Xrw8RCem81+FfCEQSQgvfBDOHb07O6NMNK5G5QU86ffh+DuoJARMKcnraHejZrI1vNiLsgtOWIb9UROuRstQF2K0Wt/Fhr6V/Iv5Ox7LaRqLbYUQutwTDIXQBjPmanppE6IaoGpycdVw3pDNSN//2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ2PR11MB8404.namprd11.prod.outlook.com (2603:10b6:a03:53f::6)
 by MW4PR11MB7126.namprd11.prod.outlook.com (2603:10b6:303:222::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Mon, 9 Jun
 2025 04:21:33 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::5d01:3e43:7a6b:5629]) by SJ2PR11MB8404.namprd11.prod.outlook.com
 ([fe80::5d01:3e43:7a6b:5629%4]) with mapi id 15.20.8813.020; Mon, 9 Jun 2025
 04:21:32 +0000
Message-ID: <cc0e0ddc-c76d-479b-9632-804e2ac0b422@windriver.com>
Date: Mon, 9 Jun 2025 09:50:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [kirkstone][PATCH] binutils: Fix CVE-2025-5245
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
References: <20250605061344.2792436-1-Deepesh.Varatharajan@windriver.com>
 <CAOSpxdaomB2bZqTawmUz15FknOMpTEan-jSdiQaqEmV=jZ8LsQ@mail.gmail.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <CAOSpxdaomB2bZqTawmUz15FknOMpTEan-jSdiQaqEmV=jZ8LsQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BN9PR03CA0535.namprd03.prod.outlook.com
 (2603:10b6:408:131::30) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8404:EE_|MW4PR11MB7126:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cfbd186-834d-420a-5999-08dda70cf91d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|4022899009|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QlFCbnNHWWNrVlc1UGkxaDFMQitlUjdiNEY5alA2eDZlTzFoVjAxaXNEaGxw?=
 =?utf-8?B?WkdQMTJ4SEl3bXlSOWVhTStZSUhBaUJwUVhaemFXWGd1TlFGY2M0NXEvTWxh?=
 =?utf-8?B?SVNJcXpDSEFkZDNKbThIOFJ0NTNpSGhCV1ZQZGpwazdhbWhXWkJjZlhrM05q?=
 =?utf-8?B?akJqWG1jYzNJcjc5M250OFlla0RqQ0lTd3hCT3duVHpFNU9mWGQ1cmhva1dt?=
 =?utf-8?B?b3pDUC9CdEsxOEIzcVU2eGljMHltOHVDZmlBQm52a003cDhhZGRibG1ISXBp?=
 =?utf-8?B?aHR1QmFqdmdXOFRUVnBxcFI0QWJtbWl4cmU3dUVBTWlnQ0JsSW1zQ0s2ejdo?=
 =?utf-8?B?aTI5VXhtdzQrY0NLQnk3Q0MwdFZhTk4wRXdkbEl5azNram9hMFVYQlkyRFdY?=
 =?utf-8?B?VXNWRnphWEN0aXNNYk1HWFNlMnFpVE1SZFVrb1VaRkxySDFJbmNnNHVxL3Bm?=
 =?utf-8?B?UVBDVHBJWXd2TUZha0RiUFJiZGQzbTdYZEw4b3N5dHZ6eVRyU2lWNVllRm9N?=
 =?utf-8?B?MHhiNGNyYnZYWUZ2V2RuZWdnbmsrdjRpdU5UL3pXbllXcllZR3BCQm92R2NE?=
 =?utf-8?B?clJTY2ZITStJOVdHOEd6dmVsN1RLaGp5QXlKb2xaWExleUlEczlwR2t3dUVL?=
 =?utf-8?B?blROby9EeE5pazdCYlJnTnJUYVMrRWE1dWRudC9zNVlwSldLdlY4SlNRVkVT?=
 =?utf-8?B?QXhzdEUwUnZ1Z2JJU0RwVXZOQmZta0s2bE92YTFZenBBZXJkMDlidkhxUHcv?=
 =?utf-8?B?YlVSZlkxS0FRLzNCNDN2NjBlNy9lZ1U5RGFCUy8vS09IY1F2enR0TnVoTkU4?=
 =?utf-8?B?UU4xczA5MmViSTFVRkEybTVrLzhEaThUdzc5Y1U5MFZ2cXAvSW4vc1NTeU9N?=
 =?utf-8?B?dEJNSTV6WXVTajBFQm9DN2dkQ08vQVdneSsrU0FTd1ZzOVJiNjB3bHRWeUVo?=
 =?utf-8?B?clpxQ2pGRUFxYitHUVJiMGV0Z1pYcHNNQnVpcmJvQmtvcG1MT1ZxaDNNOGhF?=
 =?utf-8?B?ODVERVJ5eU1WS2xhM3pGdW8rMVFyV3ZYcHVmMGpCamtOMmhFVnMzT0lZdEJw?=
 =?utf-8?B?SmVFYWV2Sk5HdDBrNldyM0w0SllncU9ZOVY0djV1aENIaGQyTWZhcHEzN0hG?=
 =?utf-8?B?alRPdWRBRU5KbGxxdGVVc1FrNlR5NTJCajBKR1hLMzJEUW9vUWN4UEY1TlM2?=
 =?utf-8?B?NkYxcDMwUm1PZDNGZWJ0WU5RSFptSXJwWVZSUW8wZzNBeG5pUUxzMUE1V2F4?=
 =?utf-8?B?amNBTGFYa0IvZytsQkMrMmlUQzF3OU5jcDlLUy9ETFY2eHlTRURRMEMzeGZ3?=
 =?utf-8?B?T3hJY2NSRHQ4Y1hRMCs0WUpqRktHWGQ4c3g0UFNlZlVxV056N1daUzhKcHAy?=
 =?utf-8?B?QjNOK21DT3lBLytvdGxYMnFjMzRZeW50RnkyNDdPL1QwdmRHWURjNUE2ZHBl?=
 =?utf-8?B?YlRHL2hrRTVVK1Rxb1VzYzZ3QTlxaXZHLzVUNHppOEhlbUtEbXMvdFZKR2Uy?=
 =?utf-8?B?Y25MK0VzR2RScmloNUtjbzVYU3A4QUlQL0dZaTFZSmw5ZUY0NERPczJWeXFL?=
 =?utf-8?B?alpXa2gxQ3BrcjBnN1I2QVBhREQxcGwvRDNOVnZaNXRQWEdsSW1XYStsU1VU?=
 =?utf-8?B?MFE2OTdJWTZoWUdrVHRvK0MvRWRPNm5mejJxbUppZjVBQXdhQTh3SExwaFdF?=
 =?utf-8?B?S2swaUdhVlhIc0gvWmtZY3pvR0JIeWpTNkRxMTNtd1YxemxZU1hyTFNQK1dP?=
 =?utf-8?B?YUs4YUoyencwTXZ4VG5nWElPMldhbC9RYTZZbXhsKzBsc0dHc3BOc09SVGdi?=
 =?utf-8?B?ejd3QXNwa2NITlZKTDdldjRYMHlQQmlyNzZHWkYzYjJJd2VnWGFtNEJFdjlo?=
 =?utf-8?Q?cUKFq/oVFpahf?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8404.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(4022899009)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NmEvZjhWMThSN01rbjlWSzZvTXUwSFZoZnlHcGRKVjZOc0dJcUJiSkc4dE5P?=
 =?utf-8?B?aCs4cEtQOC82NmY1enFKNXZ6aGNKUmRaNGZXQ0l5R2kzcDNHdW1hWjYyeGN0?=
 =?utf-8?B?TGpnOW8vNm5FYktHTFFFTmRxKzNTUXdMVTNrYTc5MzN0b0ViQjJxUXZUeStm?=
 =?utf-8?B?aC9DNkd5NG4rTUZkMndDVTdVcmhIT0ozRkd3Ylo0V0FwYWpVWXpQaDhzYnM5?=
 =?utf-8?B?K25QeUE4QW9zV1Rwd0hNZ2RiZUxlTUl0VDIvb09NU2xBbVVJUTJuZi9xVUU0?=
 =?utf-8?B?M0xqU3JyejVGR1FHRFY2cXBwbFcvczRObDJuVzdRaGJTTnRLdjlvaGo0WjA1?=
 =?utf-8?B?dkZFV3ZvYis4K1BQbTlRQy85aXRucEVEMThLbkdWZlNXUngvYWRYdTJEV3E2?=
 =?utf-8?B?azViTm9oTVlUSGJTeU1sNms0ZHo4VE1aSE0veEFqUUFxUmhmTkxJVG1vekxX?=
 =?utf-8?B?MUdEakVlanFNcG82VEtLbjV0NDBYWHYvWkxqNUh1TFhYV0VRN2dkS28xa0Fo?=
 =?utf-8?B?bHBzdTY5Y3BkYTJtbCtyRC9FT1VrcEFoenRqeTVzWm4vYjlVWlJOT3BEcytQ?=
 =?utf-8?B?N0VTVkQrR2VFV3p1dS9HSGthdzcvQ2hVSkN0VHhqODJ3WjkwM0txRVJVYWFT?=
 =?utf-8?B?K2dOR3BHck9RMUs2aW9jQklqbFBTdVpUVTUvc1R0Q2Qza3g2OENpbk5UOGlW?=
 =?utf-8?B?K0NTb0w5ZTVSazg5aFZoNXF2US8wY0JtVjlSa0Nmd0hZNGpFNlFPOWY4SUMr?=
 =?utf-8?B?MUFZdzdOVEI5TmZpYkRMMHBiRnRZQ2VnYnBIcHF0RG9GRnRrQW9WRFNTeVdP?=
 =?utf-8?B?Q3dHeHRkV0hkNWM4N21MMkE1YmltQmFoQlUrcENUaGdjK3VwdGI5MmFPRzBL?=
 =?utf-8?B?eFVRRVJtVVNsN0pqVGcwK0s1RVFKRlFkb1JUYlR4dTAyRUtFZ1pzSWxMZFI0?=
 =?utf-8?B?UmJQSkdTS1l2aktsOEJrRHBObnRUbHpLMGUwK0xRT2RTV2hlOFR6QmNock5G?=
 =?utf-8?B?Z3BrclVvN0Vqa1UwSWhxSXVIMXF3bGk3eEpHNjFuQjUvSUNicEFsU1VaWHFX?=
 =?utf-8?B?eWo4ZW1kNDVSalZYOUNWNFY5WjZuV3N5VGV3SUEzanB4bHdnZTRmMzhySmpM?=
 =?utf-8?B?cG93NlJDNFl5NTBPZ1JJdWMzdENvTXArNzZML0lXMlVwMmlmQ21sWmY4dUtQ?=
 =?utf-8?B?WVJpcVhRcFFrMjU0OGQ5bHl5NDBuZGhiSm52Y3hZS1V3VGRxazVZMGI2MnlF?=
 =?utf-8?B?WHp4SnNYcWNaOWF2dVQrUWowWTJZN1l5SGwwMlAvMUx1U2hRNDdtY1JHeWJP?=
 =?utf-8?B?ZlF0UW1Yem5GYWw4TUhVY3hOTnVjZmlKZmNQeTJxQ3FXaGtLR1AvOEk4NE04?=
 =?utf-8?B?WTdwWUFUSllXOGJId1hJZGtIWWp6aStzL0gySzhKT0o5K1luYW9mV3pKUjdK?=
 =?utf-8?B?ZTh0dzV5aThGY05kNnVIOGZyY0tGOEc4TUhEOTRubVRxazdCeklCQWE2Y3Zq?=
 =?utf-8?B?blYwOHI5dE9ubHlJY0lHMU8vVDN5R0ZxNzZMck0vSzVWcVVydGh1U3NTOHl3?=
 =?utf-8?B?VkIzU0tiOXE0ZklTOWZzQWJDL1E2Ky8wakZSbEwwMjlJUGdaeHFZejVUZWlz?=
 =?utf-8?B?L0xYZnBhdEZRTXF5dUtFUzFOQTFSRFJDRjhIazU3QlpPN1pHdVoyNXJhOVlV?=
 =?utf-8?B?VkMwNlZ6cVlZN2hOOHNVeE56bnFBL1ZRY3JNK2xzUHd0ZjZad2Z0dVJaNE9V?=
 =?utf-8?B?OU1iU2QvemNEb1lvWXBXN2xyRDlHQmtBZml3MGNTWjRCTFkyci91YnYwZ0w2?=
 =?utf-8?B?WlRYSVhneDhEeUIxUmh6TkY1NThQZm4xTTZma1FLMDYrNVMzSC83TmkwUjRn?=
 =?utf-8?B?dVpmbXBUNmVZeDFKQURnUmY3czBRSzRLckRWM0ZHQ0Z6YkhoRm04SXhBbTBk?=
 =?utf-8?B?YzBmWFhaQzNZczY1SW9BdlVGTHRtN3BLbFpCN2REQ0ZMZGpXUFdCUzE3V0lL?=
 =?utf-8?B?Wm1YdGlWNW81bHowMnFXU0pVWE1TK0FWYklXY1ZjTUN6SUYrVnhyQzRiM216?=
 =?utf-8?B?dXdKYVJTQXo3cW8xM3RJOGkveFZvUXZOVnBXOXJlUHUzQ0Z1Wm41enVkcnM0?=
 =?utf-8?B?Y3FTOU9JUnVZMjFPZDl4WlNmc21MRjJYNWhKNTg0d09iWkVIRzFOK3B4YkpY?=
 =?utf-8?Q?zUXg5VBNGzIgzeWtRjC9rW0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cfbd186-834d-420a-5999-08dda70cf91d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 04:20:31.9595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4oF08A1NxcZ5elpMkY9FL20ZJJGkZdWLzF9vwq38ukVEyuqd+B8z8CKUeJVFa5ZZqT2ug+vrLVpciyaiHjS/OKn0f3mxGXRjm4FKGWQ2bpiXbM//gE0mic62srO1u9+F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7126
X-Proofpoint-GUID: HtYx9HbVnsJvoJROPlHL4rlQwnIt3k6r
X-Authority-Analysis: v=2.4 cv=L74dQ/T8 c=1 sm=1 tr=0 ts=68466152 cx=c_pps a=5RZAJXZTQAV0bSSsSFVBEw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=CCpqsmhAAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=_enOPnqeAAAA:8 a=k1KUM9Ah-_n37HGkNEQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ul9cdbp4aOFLsgKbc677:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=XAbD3I9PDrnSMThV5XoS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDAzMiBTYWx0ZWRfX8B7d9BGE42A4 HO5eE57EKzd8BRTq1vPhgVaavAkZFv4QeC900glA0eE8gsSKTRQyPJTsp7wNPUxJCtRmm37Ko0t WubAw55qOfawkyCTdgMgfouH5R5FP7IQ3jNT9Yq63Gdy8Mf3jlGdcfeRI0xr+y9FBb8NMsUfpQ2
 wHEB6k0SSqlXNbg3uxSoDyZ3lWWblSL/QAfbFsq9TEmJqWnNpmRsxia3yLQn57qQEr9gyPcdNT9 /lvscnMW9CkeUgahLa7ROHyHuRSzXAR2hpToUn+j0d1L0rXOEajREFIjIN0Q9j9cBTPy508YY+U Txe7/Y/TNXrQgM+kJkrivphtucXItbxNqUhmUvh3qC0ikWk55HDJjUfnSgX+unmrpQ16eYhcOZ3
 33lQPfL7ZUoAqx6JrowiQER7akE+QfeOjvcqa8yDkXJFwsN39eZ77ystXUH/ZoFfDm8XJ16D
X-Proofpoint-ORIG-GUID: A7w6dqYo8tqaWAWzDG0oM51nSKJG1yLi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 spamscore=0 suspectscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506090032
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5593spNU003989
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 04:21:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218240


On 06-06-2025 23:00, Steve Sakoman wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Wed, Jun 4, 2025 at 11:13=E2=80=AFPM Varatharajan, Deepesh via
> lists.openembedded.org
> <deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
>> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>>
>> PR32829, SEGV on objdump function debug_type_samep
>> u.kenum is always non-NULL, see debug_make_enum_type.
>>
>> Backport a patch from upstream to fix CVE-2025-5245
>> Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gd=
b.git;a=3Dpatch;h=3D6c3458a8b7ee7d39f070c7b2350851cb2110c65a]
>>
>> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.co=
m>
>> ---
>>   .../binutils/binutils-2.38.inc                |  1 +
>>   .../binutils/0041-CVE-2025-4245.patch         | 38 +++++++++++++++++=
++
> A typo in the patch filename -- should be 5245, not 4245!
>
> Also, please send V2 as a patch series along with your patch for CVE-20=
25-5244.
>
> Thanks!
>
> Steve
Sure Steve,

V2 incoming.

Regards,
Deepesh.
>>   2 files changed, 39 insertions(+)
>>   create mode 100644 meta/recipes-devtools/binutils/binutils/0041-CVE-=
2025-4245.patch
>>
>> diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/r=
ecipes-devtools/binutils/binutils-2.38.inc
>> index 01fd03d2f4..d89d3eef19 100644
>> --- a/meta/recipes-devtools/binutils/binutils-2.38.inc
>> +++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
>> @@ -75,5 +75,6 @@ SRC_URI =3D "\
>>        file://0038-CVE-2025-0840.patch \
>>        file://0039-CVE-2025-1178.patch \
>>        file://0040-CVE-2025-1180.patch \
>> +     file://0041-CVE-2025-4245.patch \
>>   "
>>   S  =3D "${WORKDIR}/git"
>> diff --git a/meta/recipes-devtools/binutils/binutils/0041-CVE-2025-424=
5.patch b/meta/recipes-devtools/binutils/binutils/0041-CVE-2025-4245.patc=
h
>> new file mode 100644
>> index 0000000000..2de6abbe93
>> --- /dev/null
>> +++ b/meta/recipes-devtools/binutils/binutils/0041-CVE-2025-4245.patch
>> @@ -0,0 +1,38 @@
>> +From: Alan Modra <amodra@gmail.com>
>> +Date: Tue, 1 Apr 2025 22:36:54 +1030
>> +
>> +PR32829, SEGV on objdump function debug_type_samep
>> +u.kenum is always non-NULL, see debug_make_enum_type.
>> +
>> +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-g=
db.git;a=3Dcommitdiff;h=3D6c3458a8b7ee7d39f070c7b2350851cb2110c65a]
>> +CVE: CVE-2025-5245
>> +
>> +Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.c=
om>
>> +
>> +diff --git a/binutils/debug.c b/binutils/debug.c
>> +index dcc8ccde..465b18e7 100644
>> +--- a/binutils/debug.c
>> ++++ b/binutils/debug.c
>> +@@ -2554,9 +2554,6 @@ debug_write_type (struct debug_handle *info,
>> +     case DEBUG_KIND_UNION_CLASS:
>> +       return debug_write_class_type (info, fns, fhandle, type, tag);
>> +     case DEBUG_KIND_ENUM:
>> +-      if (type->u.kenum =3D=3D NULL)
>> +-      return (*fns->enum_type) (fhandle, tag, (const char **) NULL,
>> +-                                (bfd_signed_vma *) NULL);
>> +       return (*fns->enum_type) (fhandle, tag, type->u.kenum->names,
>> +                               type->u.kenum->values);
>> +     case DEBUG_KIND_POINTER:
>> +@@ -3098,9 +3095,9 @@ debug_type_samep (struct debug_handle *info, st=
ruct debug_type_s *t1,
>> +       break;
>> +
>> +     case DEBUG_KIND_ENUM:
>> +-      if (t1->u.kenum =3D=3D NULL)
>> +-      ret =3D t2->u.kenum =3D=3D NULL;
>> +-      else if (t2->u.kenum =3D=3D NULL)
>> ++      if (t1->u.kenum->names =3D=3D NULL)
>> ++      ret =3D t2->u.kenum->names =3D=3D NULL;
>> ++      else if (t2->u.kenum->names =3D=3D NULL)
>> +       ret =3D false;
>> +       else
>> +       {
>> --
>> 2.49.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#217987): https://lists.openembedded.org/g/openembe=
dded-core/message/217987
>> Mute This Topic: https://lists.openembedded.org/mt/113481072/3620601
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[steve@sakoman.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

