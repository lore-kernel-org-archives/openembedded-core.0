Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A0A0C021B2
	for <webhook@archiver.kernel.org>; Fri, 21 Feb 2025 00:41:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.12855.1740098501194198030
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Feb 2025 16:41:41 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4147254162=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51KEra6e024718
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 16:41:40 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44w00ku4jq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 16:41:39 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51L0agdU012228
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 16:41:39 -0800
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2040.outbound.protection.outlook.com [104.47.51.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44w00ku4jn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 16:41:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k2pV6CBpOEYmRR21TbbWxhG6a3XW0FpmCKeLglrzqw0hcwiwsWaWwc6Aqm+wTAgKWA/ObQJqUFMvXVNYmKZiJmC4fddQNUndc2H/4PjHTX2IEsR0vikTk2pyTpU7OpdtzbbNK6a8Ik/DrtXyubMfQX8XnTfyR/CEsnZbFEAWTv1SRA4E0lzduO4Tw/Q7oxi2g2ZyCTMJmUi7EKff2nStS4IvxPD6a8CgetfxdpDb4VfBIwvNxOyY03JX/JyShbv4G53dxlet2SLcgyAuVaQze4NUrQclnbte6kABaHBCiZAn55fS3Sy+46V9w823J7+tXR6cv6dFkNzMbONYFco/FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aHlkgauj9hh3kB6h/A04iyxA7eqLj2CgQYs+dRwzeOM=;
 b=peYqJmhApfERIZIYw2pHCWZWkffCzQ9cpsCTjNy27nBWciN7VIDETObWbnbUjHwZdZKXWq0I8Ak/NEFs17vGa1b2eocaAIeCIeom4fpG1zQEcuaZGHGmPb46/gL5kjtiSFWUfktBn7TXzLwy2nU+h6WYwajZSM24oi5GAW1Pt3FbHpuS9RPNf4Lk2r1YJQKPz1UZBOK3gwXZmIBrjop6dAZsE1EHd+m2pH4xiewPbgrkdfN11ZGou/hsJXWv7I0dre937RCYoKPIudgPON/0goYspRGD1iDvStAnzohJ9ISZ6VBYK7yqLZRREguBtDJA2pf47E6dNhap6/6BgJL2iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB8264.namprd11.prod.outlook.com (2603:10b6:806:26c::17)
 by PH7PR11MB6379.namprd11.prod.outlook.com (2603:10b6:510:1f9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Fri, 21 Feb
 2025 00:41:21 +0000
Received: from SN7PR11MB8264.namprd11.prod.outlook.com
 ([fe80::e92:66a8:56ff:f569]) by SN7PR11MB8264.namprd11.prod.outlook.com
 ([fe80::e92:66a8:56ff:f569%7]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 00:41:21 +0000
Message-ID: <b7680e34-6696-4fdb-9491-96d66df253a1@windriver.com>
Date: Fri, 21 Feb 2025 08:41:05 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [kirkstone][PATCH 1/2] Revert "ovmf: Fix
 CVE-2023-45237"
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org, soumya.sambu@windriver.com
References: <20250219102151.4000494-1-kai.kang@windriver.com>
 <CAOSpxda-k+BcRkcQXzFe2D=gDyj_kKb+=YFVNnVeK4=fD=q1qg@mail.gmail.com>
 <9b7d0f0a-75b1-491a-86d4-d0f2922587a2@windriver.com>
 <CAOSpxda5rhXmkRwVjExgxPueaev131vLG58v6LcsJtvZFJaBjw@mail.gmail.com>
Content-Language: en-US
From: Kai <kai.kang@windriver.com>
In-Reply-To: <CAOSpxda5rhXmkRwVjExgxPueaev131vLG58v6LcsJtvZFJaBjw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0276.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::13) To SN7PR11MB8264.namprd11.prod.outlook.com
 (2603:10b6:806:26c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8264:EE_|PH7PR11MB6379:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ece9c36-0ce3-482b-aa32-08dd521075eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|4022899009|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aEpDcnNlNENTZG13T3Y0cmQvbk5PT0R4WjF0cld0YUxMYjkxVFRhZ0prL2J5?=
 =?utf-8?B?WFBmT2x2L2FmQVlyNmR2dzdmaDJPNlROVzZudGtwc1djcTNoSURVRWUvUzVC?=
 =?utf-8?B?ckhzeCtveU5NVk02U1Q0WE15bDE0VDlhbWczbFBTZXdwaFZ0eW5hV0xYYnJC?=
 =?utf-8?B?N2tPWjAvZ2VYUnVhdU43ajBSanZXUUNkT0hpNmxBMW5tVlRUdzdaejloTEtJ?=
 =?utf-8?B?TGRuMG55QTRyVkd3cE43blMyUkdXczk4dVFvL1VxSzlWKzdPV0tsc2RRZlVa?=
 =?utf-8?B?UjdVUkU3RU50dXo5Z25wbVVXTlJDUlN3SGJUaTlMUXdaZnpUay9VdGJ0ekFW?=
 =?utf-8?B?dGtMUUQ1WHZCTjhXQVhMRm9xeEtidnNONDQ3cDc3QUhWdEFKWG1oYjhxOE85?=
 =?utf-8?B?UDZBanJCSjhoZjFTWEpwM05iSlpzbFB0M3BMU1VxNy9hMFYxZTBxb3lmUEpB?=
 =?utf-8?B?NXFRQ0U5bWtVeE9MUktjTE5Td3d3b1JqSmRlTVYrUWhzMW5XcVhpN2lTZlYw?=
 =?utf-8?B?dnl0M29FQURsZ0pmWGRZalQ2V3pqekYwc2N0WUYxNnkzVGxPb3lMYmpzS1pG?=
 =?utf-8?B?eGxmanBwKzU4SmdhSDU4SzRHMGlYeXdoRE9RZnprNm1vTVlISldSUXhwUmdy?=
 =?utf-8?B?OFYvczlieWhZYXNQWmJnSDQ0ZTU2NmRFU29sem4yNm9SVFV0WFNURks3U3JR?=
 =?utf-8?B?V3cvbDl4LzBwYmdMNENiaWY4aDdSaUliaWxqbnNyZC9EWTlCbGliQTA0bXN3?=
 =?utf-8?B?ckxMY1c1U3dTVStDQ0wzbVJQNU45bjQxcVBWYUx4bmhhKy9PNm1CUUR1Z0Fn?=
 =?utf-8?B?U0tsUG5lN0NWTWI3VUtYV2NCSUFGdjBjMUR2MldpQXZMWm1ad0VkcWNNQUtG?=
 =?utf-8?B?WEtqeUNkOUU0ZVJJOXB4VEF0V3ljNUI1Y09HcjJ1NnBLK3Zka1JnQkIybVhm?=
 =?utf-8?B?Q3cwNndNcGlMYWlmVGFFT0JFNnlkN1VnbllQTTZWNUVjZHRtNFl2NDRQR3Fj?=
 =?utf-8?B?QVlya2NOWTBIaGFSODBYcm1XOW1jSWl6QUJYbWxVK3JySDdpbUtnR1hsQmZ5?=
 =?utf-8?B?NUYvZk5CT1o1ZVkwOUN2TnRtM2w0Zlg3Y0pWaHV6MEY5M2E1MWpXQjJKVlQz?=
 =?utf-8?B?MlUvbTRtb2xnZWNneUxFb3hzYzY2TE9ONFFRVXVzZ1FxV085N2I4S1hQWFRr?=
 =?utf-8?B?S3ZNd3RtWlg2dWJOeS9Pdld5TVBKY3kwZDNTNEQ5MVZPRUpBdk1IMkJDWWJN?=
 =?utf-8?B?SHlheFA2d2tOcGtQbG5MNmtQemI3dWd2S3RpNjdPZ3hVdGlCckN2QnNsTjFk?=
 =?utf-8?B?TE1zUUJrK0Izeng4Rm5vYXp4NmljZTBDMTZ6OTZrNTlxQ3lxMitkZFNxeld1?=
 =?utf-8?B?d3FpNmtDVE5IRnRibVZYci9PTlhJYkJqTk96NU9JTnhOUkNmdFVyWUV0bHc1?=
 =?utf-8?B?bk84cnBXcUNrVENNYmdZd3g3R0VDUUExOFdDR1ozcFRwN0s0ejEzMzI1Tmx3?=
 =?utf-8?B?cFY4VnNQcWZQc3duWmlnS0RISFZvYklCd1Q5K2dHaXdQVDIrbFBRcU11SVN4?=
 =?utf-8?B?RjVla0pVYy9iNnBLVXI4TEZNUnRQUkFzQ0pVSGhhYW9kYnNYQW8zYzArYlQx?=
 =?utf-8?B?T1g5NlBQMWJsSHllTDRlblhmTTJDTHhjdVRNZlc1UlZUWnF2cm5ReS9lVWhS?=
 =?utf-8?B?ZWFxbnhaZmtBaEliM2dxejVvaWpLcFdUaXRtL1FvZlZ4QVpnV0Y3enVlUmVk?=
 =?utf-8?B?NTFlNUc1NzE4NVFRZklYdnBtamsraDNSd3ZVWko4OW5GampTUEl6am1qVTN3?=
 =?utf-8?B?cWxFVVdZeFhRckZrSjhuUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8264.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Vk1UNTd0dDQwS0lKOFRWQVlnMVdWWm41a3htbTNJazQ4TkJaQ0FvVEhic1do?=
 =?utf-8?B?YTlUb0Q0Z3BPb28wU1dYaVhlL3gvalZ0UzFaaHZodmZnd2l4MXRjZ3h1MnVt?=
 =?utf-8?B?eSs0bGd6eWsycExhSlFRVitheUVmUzNTNGovWmtTZTJtZnFGUGxQTWZLdzNx?=
 =?utf-8?B?bStkdVFEdmp3SEd3VWhrV1VqR0JTUldrQXZCNmRZYjRrdjhsRWhrMnlyd3Iw?=
 =?utf-8?B?Uk1pQUJKbFVhYURtRlZtWFdicGRydVVtTm0zQTYxbTY2eXRReUN5YTNjOTdF?=
 =?utf-8?B?TjdaNXVVWkphcG9ZOUh4ekhUZDdmOU9jekN6UXRSdjlPVDhHMjdtNzJBeHFj?=
 =?utf-8?B?YmdIRG9pbVRtbnkzSTZ3VFZiKzRDZndXbVhhaWhpQ2Q1TktIeVQxZUFaSVh5?=
 =?utf-8?B?WXR5NWJjcVhXSUg3RVRBcHNVRFY5ODlxVmh6VUxYeUhnSGZzMEFJS1phYmxM?=
 =?utf-8?B?d2FrZHdBM3B0a0RxNHNQcnc4RE9qL2Nwam92bFVqVzUxYnExOTNKNmZGVGtJ?=
 =?utf-8?B?Rjd0NndpVVFkVE5RT1BIWHd3SUpwT1docmVmdEYzaUo0TWJjUWZwTEVFZzln?=
 =?utf-8?B?NHdnN3RxUHdJZEdjUnNRMG0rZEhhRHZvOTdRdHJ6aDlyM09uMVlsRk9BN0pK?=
 =?utf-8?B?ay9vMmtJZDA3ZWZFYW9MKy9PbVZDTk14R2h1UjFWUmhIR0ZQdmxSK0ZvWmFZ?=
 =?utf-8?B?cVcwTklzSG1oK29CdS9qUG1ad2VHcmVDa0Evb1VIUGNYRTlJbkdmN1I3Q2p4?=
 =?utf-8?B?TGtjN3Zwd1VtQ0diMVNCSTBnSm16UTNZUmtUWGZrY25hT0FBOWNkTHdpUHNL?=
 =?utf-8?B?T3FLOWNsSnBrRnk1R0p6enMvUlUzS2xyaXNpbVZSLzNVaEYvdjRBd1YyaWJp?=
 =?utf-8?B?TmhsYzJxOHNnVW5xK2lOd0NtR2xYcjdBa2lzSjFzRzJsSmxJVFZQcG84eWE5?=
 =?utf-8?B?dnk1UWhRRElOYzZQa05PMDRqMGkrTTgxd29uTVZ2N2ZoRVA4bXpEWDVnUllR?=
 =?utf-8?B?RWE5bm4yVUtkYUtJd3o5MEI5WThnaUYvM0ZZVnFjTmZWNitMWXF0TTBITUZx?=
 =?utf-8?B?SFcxNTgzaGUrOUhObGJ5QmRNYTVVdUUraDNHK1ZoeGdRMlpJaGxBNDVUZzRp?=
 =?utf-8?B?U2RYSG9Pcms4OXFDb3FWTzlzcGJIYjczRUJSRHRYNDhqMEJ0TFBWY1VkR3pq?=
 =?utf-8?B?YXZKNXFOL01uMEo2Qy9JWU8vMko2dll1aUVkclk3Sk5hV0l4Q1EwK0h5ZFNX?=
 =?utf-8?B?dkxXMG1saTdTT25NNWVkK1c1RHF3QStDWEdtTnAyKzF4VlJ6TzcyUHA3NGNG?=
 =?utf-8?B?WGhXZGNWS2VrdEZsYlR2R2dEVkRIN0M3R0FxdlZ1VENnOXVVOVJnNHhXVGZw?=
 =?utf-8?B?VC8wcEdnYjlUdUNZVzhpdHQ3ZVlmVXBxdFg0V0RweitrVCtSaXEwMDdHSm5C?=
 =?utf-8?B?SzQrbW85aGpPb295Zm1oL2lBTDlCbGhDRGR0dm1hRmtYOXlqN3pDTFRSMXJt?=
 =?utf-8?B?VjRjVFJIaWtaYUtCMnFyT1czb3V6K3BRbmt0N3ZqKzI2d1FPdFpPZVJqdDFw?=
 =?utf-8?B?Ky9GVVBYamFUakgzaVB3c3dXL3RHRmJEYm5BQUV2b1F4MjVSS2V1aU9vOWFo?=
 =?utf-8?B?ZzFmUHdzY3Q3d3djVUw1TkMrd01sbHZETWVQZFdrYUZTaUVYZFozcmUyZlVi?=
 =?utf-8?B?aWhTUTc0VFNuZHZyMUJlc3p2OXlnMDYveXRGZDY4NU1jOU5KK1o0NG12QlIy?=
 =?utf-8?B?NHhSL3J0RE43QjV3c0hLeHFneTZraHhMZGlzN3k3Tmw2MlFrWjhFVm5rRXls?=
 =?utf-8?B?cGpxekhLRklVbHN0TnJYL2dPNHRHVEhucWIvYzhKcWVibUNlN3NWbGhpbXZa?=
 =?utf-8?B?d0lySTY5Syt0QVpsRzVxWG4xWEhpOWx2Nm1tS0M0a0xOWjZEZVk4WWhSYk1Z?=
 =?utf-8?B?WHFaSG5kNXhjbUVHVUVET0hDbndIMldKYzNHTGs0ZjhKQnFXK3Y0a2NGNjNl?=
 =?utf-8?B?TmtwLzRBbldSQlRpWGw0WHUxWDRzSkVLbm1tMkpmV1MzSFprRmNwamR0Ui9Y?=
 =?utf-8?B?SWd5MWFVUENLOHFpNVpWSnBjZG4weUk1ampqQUNmR1Z6VlFxNnl2TUNhRWM0?=
 =?utf-8?Q?erOhxbuYc2CcunW3a1Fa6iX44?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ece9c36-0ce3-482b-aa32-08dd521075eb
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 00:41:21.1022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lSLHO+kg9B65jKYdhNAqWDMR/jgdWTxltsk/b6Q+m7ivnSLBK66VOyJur06sPwkuvTMxMXPiO2t6kXlzcBGAaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6379
X-Proofpoint-GUID: 1e35J2amvqEii3PHyh1HgzCzNY0E_-Ac
X-Proofpoint-ORIG-GUID: f0EInThrf594Mue9Ao7Rcwx9YT4c5f07
X-Authority-Analysis: v=2.4 cv=Ao8U3P9P c=1 sm=1 tr=0 ts=67b7cbc4 cx=c_pps a=UtaLnOzkojfj4BVWksq/2g==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=NEAV23lmAAAA:8
 a=hqBzw_eTAAAA:8 a=XkRKQH6RAAAA:8 a=QQrwgld0AAAA:8 a=VKio34HhAAAA:8 a=PYnjg3YJAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=7CQSdrXTAAAA:8 a=jYJ61ryfAAAA:8 a=VwQbUJbxAAAA:8 a=yMhMjlubAAAA:8 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8 a=_enOPnqeAAAA:8
 a=bywSISiA_F-BfbxJxJcA:9 a=omCVNakuWDzMObkc:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=lBZTsuZDXdQA:10 a=Hv90Ch-Tvl0A:10 a=RVmHIydaz68A:10 a=bkWp_v3HvcftT6DRAIDL:22 a=1gUyE30hU_ULiMxJiLUW:22 a=GixL4z90Y-kx4mQuXZm8:22 a=ALVy6clGPs_Yy9GZ8Zsv:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=eNvJ01k53lG8zT5pDJgy:22 a=XAbD3I9PDrnSMThV5XoS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_09,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 impostorscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502210003
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 51KEra6e024718
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Feb 2025 00:41:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211783

On 2/20/25 22:27, Steve Sakoman wrote:
> On Wed, Feb 19, 2025 at 10:03=E2=80=AFPM Kai <kai.kang@windriver.com> w=
rote:
>> On 2/19/25 23:19, Steve Sakoman wrote:
>>> Hi Kai,
>>>
>>> Not sure why, but this fails to apply for me:
>>>
>>> Applying: Revert "ovmf: Fix CVE-2023-45237"
>>> Using index info to reconstruct a base tree...
>>> error: patch failed: meta/recipes-core/ovmf/ovmf/CVE-2023-45237-0001.=
patch:1
>>> error: meta/recipes-core/ovmf/ovmf/CVE-2023-45237-0001.patch: patch
>>> does not apply
>>> error: patch failed: meta/recipes-core/ovmf/ovmf/CVE-2023-45237-0002.=
patch:1
>>> error: meta/recipes-core/ovmf/ovmf/CVE-2023-45237-0002.patch: patch
>>> does not apply
>>> error: Did you hand edit your patch?
>>> It does not apply to blobs recorded in its index.
>>> Patch failed at 0001 Revert "ovmf: Fix CVE-2023-45237"
>> Hi Steve,
>>
>> How about try option `--keep-cr` with git am as I mentioned in the pat=
ch
>> file?
> I did use that option:
>
> $ git am --keep-cr
> ~/Downloads/kirkstone-1-2-Revert-ovmf-Fix-CVE-2023-45237.patch
> Applying: Revert "ovmf: Fix CVE-2023-45237"
> error: patch failed: meta/recipes-core/ovmf/ovmf/CVE-2023-45237-0001.pa=
tch:1
> error: meta/recipes-core/ovmf/ovmf/CVE-2023-45237-0001.patch: patch
> does not apply
> error: patch failed: meta/recipes-core/ovmf/ovmf/CVE-2023-45237-0002.pa=
tch:1
> error: meta/recipes-core/ovmf/ovmf/CVE-2023-45237-0002.patch: patch
> does not apply
> Patch failed at 0001 Revert "ovmf: Fix CVE-2023-45237"
> hint: Use 'git am --show-current-patch=3Ddiff' to see the failed patch
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
>
> I'll just directly revert these two commits and copy/paste your text
> into the revert message.

Thanks a lot.

Kai

>
> Steve
>
>>> On Wed, Feb 19, 2025 at 2:22=E2=80=AFAM Kai Kang via lists.openembedd=
ed.org
>>> <kai.kang=3Dwindriver.com@lists.openembedded.org> wrote:
>>>> From: Kai Kang <kai.kang@windriver.com>
>>>>
>>>> This reverts commit 4c2d3e37308cac98614dfafed79b7323423af8bc.
>>>>
>>>> The fix for CVE-2023-45237 causes ovmf firmware not support pxe boot
>>>> any more and no boot item in OVMF menu such as
>>>>
>>>>       UEFI PXEv4 (MAC address)
>>>>
>>>> It has not been fixed by ovmf upstream and an issue has been created=
 on
>>>>
>>>> https://github.com/tianocore/tianocore.github.io/issues/82
>>>>
>>>> Revert the fixes for now.
>>>>
>>>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>>> ---
>>>>
>>>> Please add option `--keep-cr` when invoke `git am`.
>>>>
>>>>    .../ovmf/ovmf/CVE-2023-45237-0001.patch       |   78 -
>>>>    .../ovmf/ovmf/CVE-2023-45237-0002.patch       | 1288 ------------=
-----
>>>>    meta/recipes-core/ovmf/ovmf_git.bb            |    2 -
>>>>    3 files changed, 1368 deletions(-)
>>>>    delete mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2023-45237-000=
1.patch
>>>>    delete mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2023-45237-000=
2.patch
>>>>
>>>> diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2023-45237-0001.patch b=
/meta/recipes-core/ovmf/ovmf/CVE-2023-45237-0001.patch
>>>> deleted file mode 100644
>>>> index d1dcb8dc44..0000000000
>>>> --- a/meta/recipes-core/ovmf/ovmf/CVE-2023-45237-0001.patch
>>>> +++ /dev/null
>>>> @@ -1,78 +0,0 @@
>>>> -From cf07238e5fa4f8b1138ac1c9e80530b4d4e59f1c Mon Sep 17 00:00:00 2=
001
>>>> -From: Pierre Gondois <pierre.gondois@arm.com>
>>>> -Date: Fri, 11 Aug 2023 16:33:06 +0200
>>>> -Subject: [PATCH] MdePkg/Rng: Add GUID to describe Arm Rndr Rng algo=
rithms
>>>> -
>>>> -BZ: https://bugzilla.tianocore.org/show_bug.cgi?id=3D4441
>>>> -
>>>> -The EFI_RNG_PROTOCOL can rely on the RngLib. The RngLib has multipl=
e
>>>> -implementations, some of them are unsafe (e.g. BaseRngLibTimerLib).
>>>> -To allow the RngDxe to detect when such implementation is used,
>>>> -a GetRngGuid() function is added in a following patch.
>>>> -
>>>> -Prepare GetRngGuid() return values and add a gEfiRngAlgorithmArmRnd=
r
>>>> -to describe a Rng algorithm accessed through Arm's RNDR instruction.
>>>> -[1] states that the implementation of this algorithm should be
>>>> -compliant to NIST SP900-80. The compliance is not guaranteed.
>>>> -
>>>> -[1] Arm Architecture Reference Manual Armv8, for A-profile architec=
ture
>>>> -sK12.1 'Properties of the generated random number'
>>>> -
>>>> -Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
>>>> -Reviewed-by: Sami Mujawar <sami.mujawar@arm.com>
>>>> -Reviewed-by: Liming Gao <gaoliming@byosoft.com.cn>
>>>> -Acked-by: Ard Biesheuvel <ardb@kernel.org>
>>>> -Tested-by: Kun Qin <kun.qin@microsoft.com>
>>>> -
>>>> -CVE: CVE-2023-45237
>>>> -
>>>> -Upstream-Status: Backport [https://github.com/tianocore/edk2/commit=
/cf07238e5fa4f8b1138ac1c9e80530b4d4e59f1c]
>>>> -
>>>> -Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
>>>> ----
>>>> - MdePkg/Include/Protocol/Rng.h | 10 ++++++++++
>>>> - MdePkg/MdePkg.dec             |  1 +
>>>> - 2 files changed, 11 insertions(+)
>>>> -
>>>> -diff --git a/MdePkg/Include/Protocol/Rng.h b/MdePkg/Include/Protoco=
l/Rng.h
>>>> -index baf425587b..38bde53240 100644
>>>> ---- a/MdePkg/Include/Protocol/Rng.h
>>>> -+++ b/MdePkg/Include/Protocol/Rng.h
>>>> -@@ -67,6 +67,15 @@ typedef EFI_GUID EFI_RNG_ALGORITHM;
>>>> -   { \
>>>> -     0xe43176d7, 0xb6e8, 0x4827, {0xb7, 0x84, 0x7f, 0xfd, 0xc4, 0xb=
6, 0x85, 0x61 } \
>>>> -   }
>>>> -+///
>>>> -+/// The Arm Architecture states the RNDR that the DRBG algorithm s=
hould be compliant
>>>> -+/// with NIST SP800-90A, while not mandating a particular algorith=
m, so as to be
>>>> -+/// inclusive of different geographies.
>>>> -+///
>>>> -+#define EFI_RNG_ALGORITHM_ARM_RNDR \
>>>> -+  { \
>>>> -+    0x43d2fde3, 0x9d4e, 0x4d79,  {0x02, 0x96, 0xa8, 0x9b, 0xca, 0x=
78, 0x08, 0x41} \
>>>> -+  }
>>>> -
>>>> - /**
>>>> -   Returns information about the random number generation implement=
ation.
>>>> -@@ -146,5 +155,6 @@ extern EFI_GUID  gEfiRngAlgorithmSp80090Ctr256G=
uid;
>>>> - extern EFI_GUID  gEfiRngAlgorithmX9313DesGuid;
>>>> - extern EFI_GUID  gEfiRngAlgorithmX931AesGuid;
>>>> - extern EFI_GUID  gEfiRngAlgorithmRaw;
>>>> -+extern EFI_GUID  gEfiRngAlgorithmArmRndr;
>>>> -
>>>> - #endif
>>>> -diff --git a/MdePkg/MdePkg.dec b/MdePkg/MdePkg.dec
>>>> -index 59b405928b..a449dbc556 100644
>>>> ---- a/MdePkg/MdePkg.dec
>>>> -+++ b/MdePkg/MdePkg.dec
>>>> -@@ -594,6 +594,7 @@
>>>> -   gEfiRngAlgorithmX9313DesGuid       =3D { 0x63c4785a, 0xca34, 0x4=
012, {0xa3, 0xc8, 0x0b, 0x6a, 0x32, 0x4f, 0x55, 0x46 }}
>>>> -   gEfiRngAlgorithmX931AesGuid        =3D { 0xacd03321, 0x777e, 0x4=
d3d, {0xb1, 0xc8, 0x20, 0xcf, 0xd8, 0x88, 0x20, 0xc9 }}
>>>> -   gEfiRngAlgorithmRaw                =3D { 0xe43176d7, 0xb6e8, 0x4=
827, {0xb7, 0x84, 0x7f, 0xfd, 0xc4, 0xb6, 0x85, 0x61 }}
>>>> -+  gEfiRngAlgorithmArmRndr            =3D { 0x43d2fde3, 0x9d4e, 0x4=
d79, {0x02, 0x96, 0xa8, 0x9b, 0xca, 0x78, 0x08, 0x41 }}
>>>> -
>>>> -   ## Include/Protocol/AdapterInformation.h
>>>> -   gEfiAdapterInfoMediaStateGuid       =3D { 0xD7C74207, 0xA831, 0x=
4A26, {0xB1, 0xF5, 0xD1, 0x93, 0x06, 0x5C, 0xE8, 0xB6 }}
>>>> ---
>>>> -2.40.0
>>>> -
>>>> diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2023-45237-0002.patch b=
/meta/recipes-core/ovmf/ovmf/CVE-2023-45237-0002.patch
>>>> deleted file mode 100644
>>>> index 722a6cd530..0000000000
>>>> --- a/meta/recipes-core/ovmf/ovmf/CVE-2023-45237-0002.patch
>>>> +++ /dev/null
>>>> @@ -1,1288 +0,0 @@
>>>> -From 4c4ceb2ceb80c42fd5545b2a4bd80321f07f4345 Mon Sep 17 00:00:00 2=
001
>>>> -From: Doug Flick <dougflick@microsoft.com>
>>>> -Date: Wed, 8 May 2024 22:56:28 -0700
>>>> -Subject: [PATCH] NetworkPkg: SECURITY PATCH CVE-2023-45237
>>>> -
>>>> -REF:https://bugzilla.tianocore.org/show_bug.cgi?id=3D4542
>>>> -
>>>> -Bug Overview:
>>>> -PixieFail Bug #9
>>>> -CVE-2023-45237
>>>> -CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:L/I:N/A:N
>>>> -CWE-338 Use of Cryptographically Weak Pseudo-Random Number Generato=
r (PRNG)
>>>> -
>>>> -Use of a Weak PseudoRandom Number Generator
>>>> -
>>>> -Change Overview:
>>>> -
>>>> -Updates all Instances of NET_RANDOM (NetRandomInitSeed ()) to eithe=
r
>>>> -
>>>> ->
>>>> -> EFI_STATUS
>>>> -> EFIAPI
>>>> -> PseudoRandomU32 (
>>>> ->  OUT UINT32  *Output
>>>> ->  );
>>>> ->
>>>> -
>>>> -or (depending on the use case)
>>>> -
>>>> ->
>>>> -> EFI_STATUS
>>>> -> EFIAPI
>>>> -> PseudoRandom (
>>>> ->  OUT  VOID   *Output,
>>>> ->  IN   UINTN  OutputLength
>>>> ->  );
>>>> ->
>>>> -
>>>> -This is because the use of
>>>> -
>>>> -Example:
>>>> -
>>>> -The following code snippet PseudoRandomU32 () function is used:
>>>> -
>>>> ->
>>>> -> UINT32         Random;
>>>> ->
>>>> -> Status =3D PseudoRandomU32 (&Random);
>>>> -> if (EFI_ERROR (Status)) {
>>>> ->   DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\n=
",
>>>> -__func__, Status));
>>>> ->   return Status;
>>>> -> }
>>>> ->
>>>> -
>>>> -This also introduces a new PCD to enable/disable the use of the
>>>> -secure implementation of algorithms for PseudoRandom () and
>>>> -instead depend on the default implementation. This may be required =
for
>>>> -some platforms where the UEFI Spec defined algorithms are not avail=
able.
>>>> -
>>>> ->
>>>> -> PcdEnforceSecureRngAlgorithms
>>>> ->
>>>> -
>>>> -If the platform does not have any one of the UEFI defined
>>>> -secure RNG algorithms then the driver will assert.
>>>> -
>>>> -Cc: Saloni Kasbekar <saloni.kasbekar@intel.com>
>>>> -Cc: Zachary Clark-williams <zachary.clark-williams@intel.com>
>>>> -
>>>> -Signed-off-by: Doug Flick [MSFT] <doug.edk2@gmail.com>
>>>> -Reviewed-by: Saloni Kasbekar <saloni.kasbekar@intel.com>
>>>> -
>>>> -CVE: CVE-2023-45237
>>>> -
>>>> -Upstream-Status: Backport [https://github.com/tianocore/edk2/commit=
/4c4ceb2ceb80c42fd5545b2a4bd80321f07f4345]
>>>> -
>>>> -Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
>>>> ----
>>>> - NetworkPkg/Dhcp4Dxe/Dhcp4Driver.c          |  10 +-
>>>> - NetworkPkg/Dhcp6Dxe/Dhcp6Driver.c          |  11 +-
>>>> - NetworkPkg/DnsDxe/DnsDhcp.c                |  10 +-
>>>> - NetworkPkg/DnsDxe/DnsImpl.c                |  11 +-
>>>> - NetworkPkg/HttpBootDxe/HttpBootDhcp6.c     |  10 +-
>>>> - NetworkPkg/IScsiDxe/IScsiCHAP.c            |  19 ++-
>>>> - NetworkPkg/IScsiDxe/IScsiMisc.c            |  14 +--
>>>> - NetworkPkg/IScsiDxe/IScsiMisc.h            |   6 +-
>>>> - NetworkPkg/Include/Library/NetLib.h        |  40 +++++--
>>>> - NetworkPkg/Ip4Dxe/Ip4Driver.c              |  10 +-
>>>> - NetworkPkg/Ip6Dxe/Ip6ConfigImpl.c          |   9 +-
>>>> - NetworkPkg/Ip6Dxe/Ip6Driver.c              |  17 ++-
>>>> - NetworkPkg/Ip6Dxe/Ip6If.c                  |  12 +-
>>>> - NetworkPkg/Ip6Dxe/Ip6Mld.c                 |  12 +-
>>>> - NetworkPkg/Ip6Dxe/Ip6Nd.c                  |  33 +++++-
>>>> - NetworkPkg/Ip6Dxe/Ip6Nd.h                  |   8 +-
>>>> - NetworkPkg/Library/DxeNetLib/DxeNetLib.c   | 130 +++++++++++++++++=
+---
>>>> - NetworkPkg/Library/DxeNetLib/DxeNetLib.inf |  14 ++-
>>>> - NetworkPkg/NetworkPkg.dec                  |   7 ++
>>>> - NetworkPkg/SecurityFixes.yaml              |  39 +++++++
>>>> - NetworkPkg/TcpDxe/TcpDriver.c              |  15 ++-
>>>> - NetworkPkg/TcpDxe/TcpDxe.inf               |   3 +
>>>> - NetworkPkg/Udp4Dxe/Udp4Driver.c            |  10 +-
>>>> - NetworkPkg/Udp6Dxe/Udp6Driver.c            |  11 +-
>>>> - NetworkPkg/UefiPxeBcDxe/PxeBcDhcp4.c       |   9 +-
>>>> - NetworkPkg/UefiPxeBcDxe/PxeBcDhcp6.c       |  11 +-
>>>> - NetworkPkg/UefiPxeBcDxe/PxeBcDriver.c      |  12 +-
>>>> - 27 files changed, 410 insertions(+), 83 deletions(-)
>>>> -
>>>> -diff --git a/NetworkPkg/Dhcp4Dxe/Dhcp4Driver.c b/NetworkPkg/Dhcp4Dx=
e/Dhcp4Driver.c
>>>> -index 8c37e93be3..892caee368 100644
>>>> ---- a/NetworkPkg/Dhcp4Dxe/Dhcp4Driver.c
>>>> -+++ b/NetworkPkg/Dhcp4Dxe/Dhcp4Driver.c
>>>> -@@ -1,6 +1,7 @@
>>>> - /** @file
>>>> -
>>>> - Copyright (c) 2006 - 2018, Intel Corporation. All rights reserved.=
<BR>
>>>> -+Copyright (c) Microsoft Corporation
>>>> - SPDX-License-Identifier: BSD-2-Clause-Patent
>>>> -
>>>> - **/
>>>> -@@ -189,6 +190,13 @@ Dhcp4CreateService (
>>>> - {
>>>> -   DHCP_SERVICE  *DhcpSb;
>>>> -   EFI_STATUS    Status;
>>>> -+  UINT32        Random;
>>>> -+
>>>> -+  Status =3D PseudoRandomU32 (&Random);
>>>> -+  if (EFI_ERROR (Status)) {
>>>> -+    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\=
n", __func__, Status));
>>>> -+    return Status;
>>>> -+  }
>>>> -
>>>> -   *Service =3D NULL;
>>>> -   DhcpSb   =3D AllocateZeroPool (sizeof (DHCP_SERVICE));
>>>> -@@ -203,7 +211,7 @@ Dhcp4CreateService (
>>>> -   DhcpSb->Image        =3D ImageHandle;
>>>> -   InitializeListHead (&DhcpSb->Children);
>>>> -   DhcpSb->DhcpState =3D Dhcp4Stopped;
>>>> --  DhcpSb->Xid       =3D NET_RANDOM (NetRandomInitSeed ());
>>>> -+  DhcpSb->Xid       =3D Random;
>>>> -   CopyMem (
>>>> -     &DhcpSb->ServiceBinding,
>>>> -     &mDhcp4ServiceBindingTemplate,
>>>> -diff --git a/NetworkPkg/Dhcp6Dxe/Dhcp6Driver.c b/NetworkPkg/Dhcp6Dx=
e/Dhcp6Driver.c
>>>> -index b591a4605b..e7f2787a98 100644
>>>> ---- a/NetworkPkg/Dhcp6Dxe/Dhcp6Driver.c
>>>> -+++ b/NetworkPkg/Dhcp6Dxe/Dhcp6Driver.c
>>>> -@@ -3,7 +3,7 @@
>>>> -   implementation for Dhcp6 Driver.
>>>> -
>>>> -   Copyright (c) 2009 - 2018, Intel Corporation. All rights reserve=
d.<BR>
>>>> --
>>>> -+  Copyright (c) Microsoft Corporation
>>>> -   SPDX-License-Identifier: BSD-2-Clause-Patent
>>>> -
>>>> - **/
>>>> -@@ -123,6 +123,13 @@ Dhcp6CreateService (
>>>> - {
>>>> -   DHCP6_SERVICE  *Dhcp6Srv;
>>>> -   EFI_STATUS     Status;
>>>> -+  UINT32         Random;
>>>> -+
>>>> -+  Status =3D PseudoRandomU32 (&Random);
>>>> -+  if (EFI_ERROR (Status)) {
>>>> -+    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\=
n", __func__, Status));
>>>> -+    return Status;
>>>> -+  }
>>>> -
>>>> -   *Service =3D NULL;
>>>> -   Dhcp6Srv =3D AllocateZeroPool (sizeof (DHCP6_SERVICE));
>>>> -@@ -147,7 +154,7 @@ Dhcp6CreateService (
>>>> -   Dhcp6Srv->Signature  =3D DHCP6_SERVICE_SIGNATURE;
>>>> -   Dhcp6Srv->Controller =3D Controller;
>>>> -   Dhcp6Srv->Image      =3D ImageHandle;
>>>> --  Dhcp6Srv->Xid        =3D (0xffffff & NET_RANDOM (NetRandomInitSe=
ed ()));
>>>> -+  Dhcp6Srv->Xid        =3D (0xffffff & Random);
>>>> -
>>>> -   CopyMem (
>>>> -     &Dhcp6Srv->ServiceBinding,
>>>> -diff --git a/NetworkPkg/DnsDxe/DnsDhcp.c b/NetworkPkg/DnsDxe/DnsDhc=
p.c
>>>> -index 933565a32d..9eb3c1d2d8 100644
>>>> ---- a/NetworkPkg/DnsDxe/DnsDhcp.c
>>>> -+++ b/NetworkPkg/DnsDxe/DnsDhcp.c
>>>> -@@ -2,6 +2,7 @@
>>>> - Functions implementation related with DHCPv4/v6 for DNS driver.
>>>> -
>>>> - Copyright (c) 2015 - 2018, Intel Corporation. All rights reserved.=
<BR>
>>>> -+Copyright (c) Microsoft Corporation
>>>> - SPDX-License-Identifier: BSD-2-Clause-Patent
>>>> -
>>>> - **/
>>>> -@@ -277,6 +278,7 @@ GetDns4ServerFromDhcp4 (
>>>> -   EFI_DHCP4_TRANSMIT_RECEIVE_TOKEN  Token;
>>>> -   BOOLEAN                           IsDone;
>>>> -   UINTN                             Index;
>>>> -+  UINT32                            Random;
>>>> -
>>>> -   Image      =3D Instance->Service->ImageHandle;
>>>> -   Controller =3D Instance->Service->ControllerHandle;
>>>> -@@ -292,6 +294,12 @@ GetDns4ServerFromDhcp4 (
>>>> -   Data          =3D NULL;
>>>> -   InterfaceInfo =3D NULL;
>>>> -
>>>> -+  Status =3D PseudoRandomU32 (&Random);
>>>> -+  if (EFI_ERROR (Status)) {
>>>> -+    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\=
n", __func__, Status));
>>>> -+    return Status;
>>>> -+  }
>>>> -+
>>>> -   ZeroMem ((UINT8 *)ParaList, sizeof (ParaList));
>>>> -
>>>> -   ZeroMem (&MnpConfigData, sizeof (EFI_MANAGED_NETWORK_CONFIG_DATA=
));
>>>> -@@ -467,7 +475,7 @@ GetDns4ServerFromDhcp4 (
>>>> -
>>>> -   Status =3D Dhcp4->Build (Dhcp4, &SeedPacket, 0, NULL, 2, ParaLis=
t, &Token.Packet);
>>>> -
>>>> --  Token.Packet->Dhcp4.Header.Xid =3D HTONL (NET_RANDOM (NetRandomI=
nitSeed ()));
>>>> -+  Token.Packet->Dhcp4.Header.Xid =3D Random;
>>>> -
>>>> -   Token.Packet->Dhcp4.Header.Reserved =3D HTONS ((UINT16)0x8000);
>>>> -
>>>> -diff --git a/NetworkPkg/DnsDxe/DnsImpl.c b/NetworkPkg/DnsDxe/DnsImp=
l.c
>>>> -index d311812800..c2629bb8df 100644
>>>> ---- a/NetworkPkg/DnsDxe/DnsImpl.c
>>>> -+++ b/NetworkPkg/DnsDxe/DnsImpl.c
>>>> -@@ -2,6 +2,7 @@
>>>> - DnsDxe support functions implementation.
>>>> -
>>>> - Copyright (c) 2016 - 2018, Intel Corporation. All rights reserved.=
<BR>
>>>> -+Copyright (c) Microsoft Corporation
>>>> - SPDX-License-Identifier: BSD-2-Clause-Patent
>>>> -
>>>> - **/
>>>> -@@ -1963,6 +1964,14 @@ ConstructDNSQuery (
>>>> -   NET_FRAGMENT       Frag;
>>>> -   DNS_HEADER         *DnsHeader;
>>>> -   DNS_QUERY_SECTION  *DnsQuery;
>>>> -+  EFI_STATUS         Status;
>>>> -+  UINT32             Random;
>>>> -+
>>>> -+  Status =3D PseudoRandomU32 (&Random);
>>>> -+  if (EFI_ERROR (Status)) {
>>>> -+    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\=
n", __func__, Status));
>>>> -+    return Status;
>>>> -+  }
>>>> -
>>>> -   //
>>>> -   // Messages carried by UDP are restricted to 512 bytes (not coun=
ting the IP
>>>> -@@ -1977,7 +1986,7 @@ ConstructDNSQuery (
>>>> -   // Fill header
>>>> -   //
>>>> -   DnsHeader                    =3D (DNS_HEADER *)Frag.Bulk;
>>>> --  DnsHeader->Identification    =3D (UINT16)NET_RANDOM (NetRandomIn=
itSeed ());
>>>> -+  DnsHeader->Identification    =3D (UINT16)Random;
>>>> -   DnsHeader->Flags.Uint16      =3D 0x0000;
>>>> -   DnsHeader->Flags.Bits.RD     =3D 1;
>>>> -   DnsHeader->Flags.Bits.OpCode =3D DNS_FLAGS_OPCODE_STANDARD;
>>>> -diff --git a/NetworkPkg/HttpBootDxe/HttpBootDhcp6.c b/NetworkPkg/Ht=
tpBootDxe/HttpBootDhcp6.c
>>>> -index b22cef4ff5..f964515b0f 100644
>>>> ---- a/NetworkPkg/HttpBootDxe/HttpBootDhcp6.c
>>>> -+++ b/NetworkPkg/HttpBootDxe/HttpBootDhcp6.c
>>>> -@@ -2,6 +2,7 @@
>>>> -   Functions implementation related with DHCPv6 for HTTP boot drive=
r.
>>>> -
>>>> - Copyright (c) 2015 - 2018, Intel Corporation. All rights reserved.=
<BR>
>>>> -+Copyright (c) Microsoft Corporation
>>>> - SPDX-License-Identifier: BSD-2-Clause-Patent
>>>> -
>>>> - **/
>>>> -@@ -951,6 +952,7 @@ HttpBootDhcp6Sarr (
>>>> -   UINT32                    OptCount;
>>>> -   UINT8                     Buffer[HTTP_BOOT_DHCP6_OPTION_MAX_SIZE=
];
>>>> -   EFI_STATUS                Status;
>>>> -+  UINT32                    Random;
>>>> -
>>>> -   Dhcp6 =3D Private->Dhcp6;
>>>> -   ASSERT (Dhcp6 !=3D NULL);
>>>> -@@ -961,6 +963,12 @@ HttpBootDhcp6Sarr (
>>>> -   OptCount =3D HttpBootBuildDhcp6Options (Private, OptList, Buffer=
);
>>>> -   ASSERT (OptCount > 0);
>>>> -
>>>> -+  Status =3D PseudoRandomU32 (&Random);
>>>> -+  if (EFI_ERROR (Status)) {
>>>> -+    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\=
n", __func__, Status));
>>>> -+    return Status;
>>>> -+  }
>>>> -+
>>>> -   Retransmit =3D AllocateZeroPool (sizeof (EFI_DHCP6_RETRANSMISSIO=
N));
>>>> -   if (Retransmit =3D=3D NULL) {
>>>> -     return EFI_OUT_OF_RESOURCES;
>>>> -@@ -976,7 +984,7 @@ HttpBootDhcp6Sarr (
>>>> -   Config.IaInfoEvent           =3D NULL;
>>>> -   Config.RapidCommit           =3D FALSE;
>>>> -   Config.ReconfigureAccept     =3D FALSE;
>>>> --  Config.IaDescriptor.IaId     =3D NET_RANDOM (NetRandomInitSeed (=
));
>>>> -+  Config.IaDescriptor.IaId     =3D Random;
>>>> -   Config.IaDescriptor.Type     =3D EFI_DHCP6_IA_TYPE_NA;
>>>> -   Config.SolicitRetransmission =3D Retransmit;
>>>> -   Retransmit->Irt              =3D 4;
>>>> -diff --git a/NetworkPkg/IScsiDxe/IScsiCHAP.c b/NetworkPkg/IScsiDxe/=
IScsiCHAP.c
>>>> -index b507f11cd4..bebb1ac29b 100644
>>>> ---- a/NetworkPkg/IScsiDxe/IScsiCHAP.c
>>>> -+++ b/NetworkPkg/IScsiDxe/IScsiCHAP.c
>>>> -@@ -3,6 +3,7 @@
>>>> -   Configuration.
>>>> -
>>>> - Copyright (c) 2004 - 2018, Intel Corporation. All rights reserved.=
<BR>
>>>> -+Copyright (c) Microsoft Corporation
>>>> - SPDX-License-Identifier: BSD-2-Clause-Patent
>>>> -
>>>> - **/
>>>> -@@ -576,16 +577,24 @@ IScsiCHAPToSendReq (
>>>> -         //
>>>> -         // CHAP_I=3D<I>
>>>> -         //
>>>> --        IScsiGenRandom ((UINT8 *)&AuthData->OutIdentifier, 1);
>>>> -+        Status =3D IScsiGenRandom ((UINT8 *)&AuthData->OutIdentifi=
er, 1);
>>>> -+        if (EFI_ERROR (Status)) {
>>>> -+          break;
>>>> -+        }
>>>> -+
>>>> -         AsciiSPrint (ValueStr, sizeof (ValueStr), "%d", AuthData->=
OutIdentifier);
>>>> -         IScsiAddKeyValuePair (Pdu, ISCSI_KEY_CHAP_IDENTIFIER, Valu=
eStr);
>>>> -         //
>>>> -         // CHAP_C=3D<C>
>>>> -         //
>>>> --        IScsiGenRandom (
>>>> --          (UINT8 *)AuthData->OutChallenge,
>>>> --          AuthData->Hash->DigestSize
>>>> --          );
>>>> -+        Status =3D IScsiGenRandom (
>>>> -+                   (UINT8 *)AuthData->OutChallenge,
>>>> -+                   AuthData->Hash->DigestSize
>>>> -+                   );
>>>> -+        if (EFI_ERROR (Status)) {
>>>> -+          break;
>>>> -+        }
>>>> -+
>>>> -         BinToHexStatus =3D IScsiBinToHex (
>>>> -                            (UINT8 *)AuthData->OutChallenge,
>>>> -                            AuthData->Hash->DigestSize,
>>>> -diff --git a/NetworkPkg/IScsiDxe/IScsiMisc.c b/NetworkPkg/IScsiDxe/=
IScsiMisc.c
>>>> -index b3ea90158f..cd77f1a13e 100644
>>>> ---- a/NetworkPkg/IScsiDxe/IScsiMisc.c
>>>> -+++ b/NetworkPkg/IScsiDxe/IScsiMisc.c
>>>> -@@ -2,6 +2,7 @@
>>>> -   Miscellaneous routines for iSCSI driver.
>>>> -
>>>> - Copyright (c) 2004 - 2018, Intel Corporation. All rights reserved.=
<BR>
>>>> -+Copyright (c) Microsoft Corporation
>>>> - SPDX-License-Identifier: BSD-2-Clause-Patent
>>>> -
>>>> - **/
>>>> -@@ -474,20 +475,17 @@ IScsiNetNtoi (
>>>> -   @param[in, out]  Rand       The buffer to contain random numbers.
>>>> -   @param[in]       RandLength The length of the Rand buffer.
>>>> -
>>>> -+  @retval EFI_SUCCESS on success
>>>> -+  @retval others      on error
>>>> -+
>>>> - **/
>>>> --VOID
>>>> -+EFI_STATUS
>>>> - IScsiGenRandom (
>>>> -   IN OUT UINT8  *Rand,
>>>> -   IN     UINTN  RandLength
>>>> -   )
>>>> - {
>>>> --  UINT32  Random;
>>>> --
>>>> --  while (RandLength > 0) {
>>>> --    Random  =3D NET_RANDOM (NetRandomInitSeed ());
>>>> --    *Rand++ =3D (UINT8)(Random);
>>>> --    RandLength--;
>>>> --  }
>>>> -+  return PseudoRandom (Rand, RandLength);
>>>> - }
>>>> -
>>>> - /**
>>>> -diff --git a/NetworkPkg/IScsiDxe/IScsiMisc.h b/NetworkPkg/IScsiDxe/=
IScsiMisc.h
>>>> -index a951eee70e..91b2cd2261 100644
>>>> ---- a/NetworkPkg/IScsiDxe/IScsiMisc.h
>>>> -+++ b/NetworkPkg/IScsiDxe/IScsiMisc.h
>>>> -@@ -2,6 +2,7 @@
>>>> -   Miscellaneous definitions for iSCSI driver.
>>>> -
>>>> - Copyright (c) 2004 - 2018, Intel Corporation. All rights reserved.=
<BR>
>>>> -+Copyright (c) Microsoft Corporation
>>>> - SPDX-License-Identifier: BSD-2-Clause-Patent
>>>> -
>>>> - **/
>>>> -@@ -202,8 +203,11 @@ IScsiNetNtoi (
>>>> -   @param[in, out]  Rand       The buffer to contain random numbers.
>>>> -   @param[in]       RandLength The length of the Rand buffer.
>>>> -
>>>> -+  @retval EFI_SUCCESS on success
>>>> -+  @retval others      on error
>>>> -+
>>>> - **/
>>>> --VOID
>>>> -+EFI_STATUS
>>>> - IScsiGenRandom (
>>>> -   IN OUT UINT8  *Rand,
>>>> -   IN     UINTN  RandLength
>>>> -diff --git a/NetworkPkg/Include/Library/NetLib.h b/NetworkPkg/Inclu=
de/Library/NetLib.h
>>>> -index 8c0e62b388..e8108b79db 100644
>>>> ---- a/NetworkPkg/Include/Library/NetLib.h
>>>> -+++ b/NetworkPkg/Include/Library/NetLib.h
>>>> -@@ -3,6 +3,7 @@
>>>> -   It provides basic functions for the UEFI network stack.
>>>> -
>>>> - Copyright (c) 2005 - 2018, Intel Corporation. All rights reserved.=
<BR>
>>>> -+Copyright (c) Microsoft Corporation
>>>> - SPDX-License-Identifier: BSD-2-Clause-Patent
>>>> -
>>>> - **/
>>>> -@@ -539,8 +540,6 @@ extern EFI_IPv4_ADDRESS  mZeroIp4Addr;
>>>> - #define TICKS_PER_MS      10000U
>>>> - #define TICKS_PER_SECOND  10000000U
>>>> -
>>>> --#define NET_RANDOM(Seed)  ((UINT32) ((UINT32) (Seed) * 1103515245U=
L + 12345) % 4294967295UL)
>>>> --
>>>> - /**
>>>> -   Extract a UINT32 from a byte stream.
>>>> -
>>>> -@@ -580,19 +579,40 @@ NetPutUint32 (
>>>> -   );
>>>> -
>>>> - /**
>>>> --  Initialize a random seed using current time and monotonic count.
>>>> -+  Generate a Random output data given a length.
>>>> -
>>>> --  Get current time and monotonic count first. Then initialize a ra=
ndom seed
>>>> --  based on some basic mathematics operation on the hour, day, minu=
te, second,
>>>> --  nanosecond and year of the current time and the monotonic count =
value.
>>>> -+  @param[out] Output - The buffer to store the generated random da=
ta.
>>>> -+  @param[in] OutputLength - The length of the output buffer.
>>>> -
>>>> --  @return The random seed initialized with current time.
>>>> -+  @retval EFI_SUCCESS           On Success
>>>> -+  @retval EFI_INVALID_PARAMETER Pointer is null or size is zero
>>>> -+  @retval EFI_NOT_FOUND         RNG protocol not found
>>>> -+  @retval Others                Error from RngProtocol->GetRNG()
>>>> -
>>>> -+  @return Status code
>>>> - **/
>>>> --UINT32
>>>> -+EFI_STATUS
>>>> - EFIAPI
>>>> --NetRandomInitSeed (
>>>> --  VOID
>>>> -+PseudoRandom (
>>>> -+  OUT  VOID   *Output,
>>>> -+  IN   UINTN  OutputLength
>>>> -+  );
>>>> -+
>>>> -+/**
>>>> -+  Generate a 32-bit pseudo-random number.
>>>> -+
>>>> -+  @param[out] Output - The buffer to store the generated random nu=
mber.
>>>> -+
>>>> -+  @retval EFI_SUCCESS           On Success
>>>> -+  @retval EFI_NOT_FOUND         RNG protocol not found
>>>> -+  @retval Others                Error from RngProtocol->GetRNG()
>>>> -+
>>>> -+  @return Status code
>>>> -+**/
>>>> -+EFI_STATUS
>>>> -+EFIAPI
>>>> -+PseudoRandomU32 (
>>>> -+  OUT  UINT32  *Output
>>>> -   );
>>>> -
>>>> - #define NET_LIST_USER_STRUCT(Entry, Type, Field)        \
>>>> -diff --git a/NetworkPkg/Ip4Dxe/Ip4Driver.c b/NetworkPkg/Ip4Dxe/Ip4D=
river.c
>>>> -index ec483ff01f..683423f38d 100644
>>>> ---- a/NetworkPkg/Ip4Dxe/Ip4Driver.c
>>>> -+++ b/NetworkPkg/Ip4Dxe/Ip4Driver.c
>>>> -@@ -2,6 +2,7 @@
>>>> -   The driver binding and service binding protocol for IP4 driver.
>>>> -
>>>> - Copyright (c) 2005 - 2019, Intel Corporation. All rights reserved.=
<BR>
>>>> -+Copyright (c) Microsoft Corporation
>>>> - (C) Copyright 2015 Hewlett-Packard Development Company, L.P.<BR>
>>>> -
>>>> - SPDX-License-Identifier: BSD-2-Clause-Patent
>>>> -@@ -549,11 +550,18 @@ Ip4DriverBindingStart (
>>>> -   EFI_IP4_CONFIG2_PROTOCOL  *Ip4Cfg2;
>>>> -   UINTN                     Index;
>>>> -   IP4_CONFIG2_DATA_ITEM     *DataItem;
>>>> -+  UINT32                    Random;
>>>> -
>>>> -   IpSb     =3D NULL;
>>>> -   Ip4Cfg2  =3D NULL;
>>>> -   DataItem =3D NULL;
>>>> -
>>>> -+  Status =3D PseudoRandomU32 (&Random);
>>>> -+  if (EFI_ERROR (Status)) {
>>>> -+    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\=
n", __func__, Status));
>>>> -+    return Status;
>>>> -+  }
>>>> -+
>>>> -   //
>>>> -   // Test for the Ip4 service binding protocol
>>>> -   //
>>>> -@@ -653,7 +661,7 @@ Ip4DriverBindingStart (
>>>> -   //
>>>> -   // Initialize the IP4 ID
>>>> -   //
>>>> --  mIp4Id =3D (UINT16)NET_RANDOM (NetRandomInitSeed ());
>>>> -+  mIp4Id =3D (UINT16)Random;
>>>> -
>>>> -   return Status;
>>>> -
>>>> -diff --git a/NetworkPkg/Ip6Dxe/Ip6ConfigImpl.c b/NetworkPkg/Ip6Dxe/=
Ip6ConfigImpl.c
>>>> -index 70e232ce6c..4c1354d26c 100644
>>>> ---- a/NetworkPkg/Ip6Dxe/Ip6ConfigImpl.c
>>>> -+++ b/NetworkPkg/Ip6Dxe/Ip6ConfigImpl.c
>>>> -@@ -2276,6 +2276,13 @@ Ip6ConfigInitInstance (
>>>> -   UINTN                 Index;
>>>> -   UINT16                IfIndex;
>>>> -   IP6_CONFIG_DATA_ITEM  *DataItem;
>>>> -+  UINT32                Random;
>>>> -+
>>>> -+  Status =3D PseudoRandomU32 (&Random);
>>>> -+  if (EFI_ERROR (Status)) {
>>>> -+    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\=
n", __func__, Status));
>>>> -+    return Status;
>>>> -+  }
>>>> -
>>>> -   IpSb =3D IP6_SERVICE_FROM_IP6_CONFIG_INSTANCE (Instance);
>>>> -
>>>> -@@ -2381,7 +2388,7 @@ Ip6ConfigInitInstance (
>>>> -     // The NV variable is not set, so generate a random IAID, and =
write down the
>>>> -     // fresh new configuration as the NV variable now.
>>>> -     //
>>>> --    Instance->IaId =3D NET_RANDOM (NetRandomInitSeed ());
>>>> -+    Instance->IaId =3D Random;
>>>> -
>>>> -     for (Index =3D 0; Index < IpSb->SnpMode.HwAddressSize; Index++=
) {
>>>> -       Instance->IaId |=3D (IpSb->SnpMode.CurrentAddress.Addr[Index=
] << ((Index << 3) & 31));
>>>> -diff --git a/NetworkPkg/Ip6Dxe/Ip6Driver.c b/NetworkPkg/Ip6Dxe/Ip6D=
river.c
>>>> -index b483a7d136..cbe011dad4 100644
>>>> ---- a/NetworkPkg/Ip6Dxe/Ip6Driver.c
>>>> -+++ b/NetworkPkg/Ip6Dxe/Ip6Driver.c
>>>> -@@ -3,7 +3,7 @@
>>>> -
>>>> -   Copyright (c) 2009 - 2019, Intel Corporation. All rights reserve=
d.<BR>
>>>> -   (C) Copyright 2015 Hewlett-Packard Development Company, L.P.<BR>
>>>> --
>>>> -+  Copyright (c) Microsoft Corporation
>>>> -   SPDX-License-Identifier: BSD-2-Clause-Patent
>>>> -
>>>> - **/
>>>> -@@ -316,7 +316,11 @@ Ip6CreateService (
>>>> -   IpSb->CurHopLimit       =3D IP6_HOP_LIMIT;
>>>> -   IpSb->LinkMTU           =3D IP6_MIN_LINK_MTU;
>>>> -   IpSb->BaseReachableTime =3D IP6_REACHABLE_TIME;
>>>> --  Ip6UpdateReachableTime (IpSb);
>>>> -+  Status                  =3D Ip6UpdateReachableTime (IpSb);
>>>> -+  if (EFI_ERROR (Status)) {
>>>> -+    goto ON_ERROR;
>>>> -+  }
>>>> -+
>>>> -   //
>>>> -   // RFC4861 RETRANS_TIMER: 1,000 milliseconds
>>>> -   //
>>>> -@@ -516,11 +520,18 @@ Ip6DriverBindingStart (
>>>> -   EFI_STATUS               Status;
>>>> -   EFI_IP6_CONFIG_PROTOCOL  *Ip6Cfg;
>>>> -   IP6_CONFIG_DATA_ITEM     *DataItem;
>>>> -+  UINT32                   Random;
>>>> -
>>>> -   IpSb     =3D NULL;
>>>> -   Ip6Cfg   =3D NULL;
>>>> -   DataItem =3D NULL;
>>>> -
>>>> -+  Status =3D PseudoRandomU32 (&Random);
>>>> -+  if (EFI_ERROR (Status)) {
>>>> -+    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\=
n", __func__, Status));
>>>> -+    return Status;
>>>> -+  }
>>>> -+
>>>> -   //
>>>> -   // Test for the Ip6 service binding protocol
>>>> -   //
>>>> -@@ -656,7 +667,7 @@ Ip6DriverBindingStart (
>>>> -   //
>>>> -   // Initialize the IP6 ID
>>>> -   //
>>>> --  mIp6Id =3D NET_RANDOM (NetRandomInitSeed ());
>>>> -+  mIp6Id =3D Random;
>>>> -
>>>> -   return EFI_SUCCESS;
>>>> -
>>>> -diff --git a/NetworkPkg/Ip6Dxe/Ip6If.c b/NetworkPkg/Ip6Dxe/Ip6If.c
>>>> -index 4629c05f25..f3d11c4d21 100644
>>>> ---- a/NetworkPkg/Ip6Dxe/Ip6If.c
>>>> -+++ b/NetworkPkg/Ip6Dxe/Ip6If.c
>>>> -@@ -2,7 +2,7 @@
>>>> -   Implement IP6 pseudo interface.
>>>> -
>>>> -   Copyright (c) 2009 - 2018, Intel Corporation. All rights reserve=
d.<BR>
>>>> --
>>>> -+  Copyright (c) Microsoft Corporation
>>>> -   SPDX-License-Identifier: BSD-2-Clause-Patent
>>>> -
>>>> - **/
>>>> -@@ -89,6 +89,14 @@ Ip6SetAddress (
>>>> -   IP6_PREFIX_LIST_ENTRY  *PrefixEntry;
>>>> -   UINT64                 Delay;
>>>> -   IP6_DELAY_JOIN_LIST    *DelayNode;
>>>> -+  EFI_STATUS             Status;
>>>> -+  UINT32                 Random;
>>>> -+
>>>> -+  Status =3D PseudoRandomU32 (&Random);
>>>> -+  if (EFI_ERROR (Status)) {
>>>> -+    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\=
n", __func__, Status));
>>>> -+    return Status;
>>>> -+  }
>>>> -
>>>> -   NET_CHECK_SIGNATURE (Interface, IP6_INTERFACE_SIGNATURE);
>>>> -
>>>> -@@ -164,7 +172,7 @@ Ip6SetAddress (
>>>> -   // Thus queue the address to be processed in Duplicate Address D=
etection module
>>>> -   // after the delay time (in milliseconds).
>>>> -   //
>>>> --  Delay =3D (UINT64)NET_RANDOM (NetRandomInitSeed ());
>>>> -+  Delay =3D (UINT64)Random;
>>>> -   Delay =3D MultU64x32 (Delay, IP6_ONE_SECOND_IN_MS);
>>>> -   Delay =3D RShiftU64 (Delay, 32);
>>>> -
>>>> -diff --git a/NetworkPkg/Ip6Dxe/Ip6Mld.c b/NetworkPkg/Ip6Dxe/Ip6Mld.=
c
>>>> -index e6b2b653e2..498a118543 100644
>>>> ---- a/NetworkPkg/Ip6Dxe/Ip6Mld.c
>>>> -+++ b/NetworkPkg/Ip6Dxe/Ip6Mld.c
>>>> -@@ -696,7 +696,15 @@ Ip6UpdateDelayTimer (
>>>> -   IN OUT IP6_MLD_GROUP  *Group
>>>> -   )
>>>> - {
>>>> --  UINT32  Delay;
>>>> -+  UINT32      Delay;
>>>> -+  EFI_STATUS  Status;
>>>> -+  UINT32      Random;
>>>> -+
>>>> -+  Status =3D PseudoRandomU32 (&Random);
>>>> -+  if (EFI_ERROR (Status)) {
>>>> -+    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\=
n", __func__, Status));
>>>> -+    return Status;
>>>> -+  }
>>>> -
>>>> -   //
>>>> -   // If the Query packet specifies a Maximum Response Delay of zer=
o, perform timer
>>>> -@@ -715,7 +723,7 @@ Ip6UpdateDelayTimer (
>>>> -   // is less than the remaining value of the running timer.
>>>> -   //
>>>> -   if ((Group->DelayTimer =3D=3D 0) || (Delay < Group->DelayTimer))=
 {
>>>> --    Group->DelayTimer =3D Delay / 4294967295UL * NET_RANDOM (NetRa=
ndomInitSeed ());
>>>> -+    Group->DelayTimer =3D Delay / 4294967295UL * Random;
>>>> -   }
>>>> -
>>>> -   return EFI_SUCCESS;
>>>> -diff --git a/NetworkPkg/Ip6Dxe/Ip6Nd.c b/NetworkPkg/Ip6Dxe/Ip6Nd.c
>>>> -index c10c7017f8..72aa45c10f 100644
>>>> ---- a/NetworkPkg/Ip6Dxe/Ip6Nd.c
>>>> -+++ b/NetworkPkg/Ip6Dxe/Ip6Nd.c
>>>> -@@ -2,7 +2,7 @@
>>>> -   Implementation of Neighbor Discovery support routines.
>>>> -
>>>> -   Copyright (c) 2009 - 2018, Intel Corporation. All rights reserve=
d.<BR>
>>>> --
>>>> -+  Copyright (c) Microsoft Corporation
>>>> -   SPDX-License-Identifier: BSD-2-Clause-Patent
>>>> -
>>>> - **/
>>>> -@@ -16,17 +16,28 @@ EFI_MAC_ADDRESS  mZeroMacAddress;
>>>> -
>>>> -   @param[in, out] IpSb     Points to the IP6_SERVICE.
>>>> -
>>>> -+  @retval EFI_SUCCESS           ReachableTime Updated
>>>> -+  @retval others                Failed to update ReachableTime
>>>> - **/
>>>> --VOID
>>>> -+EFI_STATUS
>>>> - Ip6UpdateReachableTime (
>>>> -   IN OUT IP6_SERVICE  *IpSb
>>>> -   )
>>>> - {
>>>> --  UINT32  Random;
>>>> -+  UINT32      Random;
>>>> -+  EFI_STATUS  Status;
>>>> -
>>>> --  Random              =3D (NetRandomInitSeed () / 4294967295UL) * =
IP6_RANDOM_FACTOR_SCALE;
>>>> -+  Status =3D PseudoRandomU32 (&Random);
>>>> -+  if (EFI_ERROR (Status)) {
>>>> -+    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\=
n", __func__, Status));
>>>> -+    return Status;
>>>> -+  }
>>>> -+
>>>> -+  Random              =3D (Random / 4294967295UL) * IP6_RANDOM_FAC=
TOR_SCALE;
>>>> -   Random              =3D Random + IP6_MIN_RANDOM_FACTOR_SCALED;
>>>> -   IpSb->ReachableTime =3D (IpSb->BaseReachableTime * Random) / IP6=
_RANDOM_FACTOR_SCALE;
>>>> -+
>>>> -+  return EFI_SUCCESS;
>>>> - }
>>>> -
>>>> - /**
>>>> -@@ -972,10 +983,17 @@ Ip6InitDADProcess (
>>>> -   IP6_SERVICE                               *IpSb;
>>>> -   EFI_STATUS                                Status;
>>>> -   UINT32                                    MaxDelayTick;
>>>> -+  UINT32                                    Random;
>>>> -
>>>> -   NET_CHECK_SIGNATURE (IpIf, IP6_INTERFACE_SIGNATURE);
>>>> -   ASSERT (AddressInfo !=3D NULL);
>>>> -
>>>> -+  Status =3D PseudoRandomU32 (&Random);
>>>> -+  if (EFI_ERROR (Status)) {
>>>> -+    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\=
n", __func__, Status));
>>>> -+    return Status;
>>>> -+  }
>>>> -+
>>>> -   //
>>>> -   // Do nothing if we have already started DAD on the address.
>>>> -   //
>>>> -@@ -1014,7 +1032,7 @@ Ip6InitDADProcess (
>>>> -   Entry->Transmit    =3D 0;
>>>> -   Entry->Receive     =3D 0;
>>>> -   MaxDelayTick       =3D IP6_MAX_RTR_SOLICITATION_DELAY / IP6_TIME=
R_INTERVAL_IN_MS;
>>>> --  Entry->RetransTick =3D (MaxDelayTick * ((NET_RANDOM (NetRandomIn=
itSeed ()) % 5) + 1)) / 5;
>>>> -+  Entry->RetransTick =3D (MaxDelayTick * ((Random % 5) + 1)) / 5;
>>>> -   Entry->AddressInfo =3D AddressInfo;
>>>> -   Entry->Callback    =3D Callback;
>>>> -   Entry->Context     =3D Context;
>>>> -@@ -2078,7 +2096,10 @@ Ip6ProcessRouterAdvertise (
>>>> -     // in BaseReachableTime and recompute a ReachableTime.
>>>> -     //
>>>> -     IpSb->BaseReachableTime =3D ReachableTime;
>>>> --    Ip6UpdateReachableTime (IpSb);
>>>> -+    Status                  =3D Ip6UpdateReachableTime (IpSb);
>>>> -+    if (EFI_ERROR (Status)) {
>>>> -+      goto Exit;
>>>> -+    }
>>>> -   }
>>>> -
>>>> -   if (RetransTimer !=3D 0) {
>>>> -diff --git a/NetworkPkg/Ip6Dxe/Ip6Nd.h b/NetworkPkg/Ip6Dxe/Ip6Nd.h
>>>> -index bf64e9114e..5795e23c7d 100644
>>>> ---- a/NetworkPkg/Ip6Dxe/Ip6Nd.h
>>>> -+++ b/NetworkPkg/Ip6Dxe/Ip6Nd.h
>>>> -@@ -2,7 +2,7 @@
>>>> -   Definition of Neighbor Discovery support routines.
>>>> -
>>>> -   Copyright (c) 2009 - 2012, Intel Corporation. All rights reserve=
d.<BR>
>>>> --
>>>> -+  Copyright (c) Microsoft Corporation
>>>> -   SPDX-License-Identifier: BSD-2-Clause-Patent
>>>> -
>>>> - **/
>>>> -@@ -780,10 +780,10 @@ Ip6OnArpResolved (
>>>> - /**
>>>> -   Update the ReachableTime in IP6 service binding instance data, i=
n milliseconds.
>>>> -
>>>> --  @param[in, out] IpSb     Points to the IP6_SERVICE.
>>>> --
>>>> -+  @retval EFI_SUCCESS           ReachableTime Updated
>>>> -+  @retval others                Failed to update ReachableTime
>>>> - **/
>>>> --VOID
>>>> -+EFI_STATUS
>>>> - Ip6UpdateReachableTime (
>>>> -   IN OUT IP6_SERVICE  *IpSb
>>>> -   );
>>>> -diff --git a/NetworkPkg/Library/DxeNetLib/DxeNetLib.c b/NetworkPkg/=
Library/DxeNetLib/DxeNetLib.c
>>>> -index fd4a9e15a8..01c13c08d2 100644
>>>> ---- a/NetworkPkg/Library/DxeNetLib/DxeNetLib.c
>>>> -+++ b/NetworkPkg/Library/DxeNetLib/DxeNetLib.c
>>>> -@@ -3,6 +3,7 @@
>>>> -
>>>> - Copyright (c) 2005 - 2018, Intel Corporation. All rights reserved.=
<BR>
>>>> - (C) Copyright 2015 Hewlett Packard Enterprise Development LP<BR>
>>>> -+Copyright (c) Microsoft Corporation
>>>> - SPDX-License-Identifier: BSD-2-Clause-Patent
>>>> - **/
>>>> -
>>>> -@@ -31,6 +32,7 @@ SPDX-License-Identifier: BSD-2-Clause-Patent
>>>> - #include <Library/DevicePathLib.h>
>>>> - #include <Library/PrintLib.h>
>>>> - #include <Library/UefiLib.h>
>>>> -+#include <Protocol/Rng.h>
>>>> -
>>>> - #define NIC_ITEM_CONFIG_SIZE  (sizeof (NIC_IP4_CONFIG_INFO) + size=
of (EFI_IP4_ROUTE_TABLE) * MAX_IP4_CONFIG_IN_VARIABLE)
>>>> - #define DEFAULT_ZERO_START    ((UINTN) ~0)
>>>> -@@ -127,6 +129,25 @@ GLOBAL_REMOVE_IF_UNREFERENCED VLAN_DEVICE_PATH=
  mNetVlanDevicePathTemplate =3D {
>>>> -   0
>>>> - };
>>>> -
>>>> -+//
>>>> -+// These represent UEFI SPEC defined algorithms that should be sup=
ported by
>>>> -+// the RNG protocol and are generally considered secure.
>>>> -+//
>>>> -+// The order of the algorithms in this array is important. This or=
der is the order
>>>> -+// in which the algorithms will be tried by the RNG protocol.
>>>> -+// If your platform needs to use a specific algorithm for the rand=
om number generator,
>>>> -+// then you should place that algorithm first in the array.
>>>> -+//
>>>> -+GLOBAL_REMOVE_IF_UNREFERENCED EFI_GUID  *mSecureHashAlgorithms[] =3D=
 {
>>>> -+  &gEfiRngAlgorithmSp80090Ctr256Guid,  // SP800-90A DRBG CTR using=
 AES-256
>>>> -+  &gEfiRngAlgorithmSp80090Hmac256Guid, // SP800-90A DRBG HMAC usin=
g SHA-256
>>>> -+  &gEfiRngAlgorithmSp80090Hash256Guid, // SP800-90A DRBG Hash usin=
g SHA-256
>>>> -+  &gEfiRngAlgorithmArmRndr,            // unspecified SP800-90A DR=
BG via ARM RNDR register
>>>> -+  &gEfiRngAlgorithmRaw,                // Raw data from NRBG (or T=
RNG)
>>>> -+};
>>>> -+
>>>> -+#define SECURE_HASH_ALGORITHMS_SIZE  (sizeof (mSecureHashAlgorithm=
s) / sizeof (EFI_GUID *))
>>>> -+
>>>> - /**
>>>> -   Locate the handles that support SNP, then open one of them
>>>> -   to send the syslog packets. The caller isn't required to close
>>>> -@@ -884,34 +905,107 @@ Ip6Swap128 (
>>>> - }
>>>> -
>>>> - /**
>>>> --  Initialize a random seed using current time and monotonic count.
>>>> -+  Generate a Random output data given a length.
>>>> -
>>>> --  Get current time and monotonic count first. Then initialize a ra=
ndom seed
>>>> --  based on some basic mathematics operation on the hour, day, minu=
te, second,
>>>> --  nanosecond and year of the current time and the monotonic count =
value.
>>>> -+  @param[out] Output - The buffer to store the generated random da=
ta.
>>>> -+  @param[in] OutputLength - The length of the output buffer.
>>>> -
>>>> --  @return The random seed initialized with current time.
>>>> -+  @retval EFI_SUCCESS           On Success
>>>> -+  @retval EFI_INVALID_PARAMETER Pointer is null or size is zero
>>>> -+  @retval EFI_NOT_FOUND         RNG protocol not found
>>>> -+  @retval Others                Error from RngProtocol->GetRNG()
>>>> -
>>>> -+  @return Status code
>>>> - **/
>>>> --UINT32
>>>> -+EFI_STATUS
>>>> - EFIAPI
>>>> --NetRandomInitSeed (
>>>> --  VOID
>>>> -+PseudoRandom (
>>>> -+  OUT  VOID   *Output,
>>>> -+  IN   UINTN  OutputLength
>>>> -   )
>>>> - {
>>>> --  EFI_TIME  Time;
>>>> --  UINT32    Seed;
>>>> --  UINT64    MonotonicCount;
>>>> -+  EFI_RNG_PROTOCOL  *RngProtocol;
>>>> -+  EFI_STATUS        Status;
>>>> -+  UINTN             AlgorithmIndex;
>>>> -+
>>>> -+  if ((Output =3D=3D NULL) || (OutputLength =3D=3D 0)) {
>>>> -+    return EFI_INVALID_PARAMETER;
>>>> -+  }
>>>> -+
>>>> -+  Status =3D gBS->LocateProtocol (&gEfiRngProtocolGuid, NULL, (VOI=
D **)&RngProtocol);
>>>> -+  if (EFI_ERROR (Status)) {
>>>> -+    DEBUG ((DEBUG_ERROR, "Failed to locate EFI_RNG_PROTOCOL: %r\n"=
, Status));
>>>> -+    ASSERT_EFI_ERROR (Status);
>>>> -+    return Status;
>>>> -+  }
>>>> -+
>>>> -+  if (PcdGetBool (PcdEnforceSecureRngAlgorithms)) {
>>>> -+    for (AlgorithmIndex =3D 0; AlgorithmIndex < SECURE_HASH_ALGORI=
THMS_SIZE; AlgorithmIndex++) {
>>>> -+      Status =3D RngProtocol->GetRNG (RngProtocol, mSecureHashAlgo=
rithms[AlgorithmIndex], OutputLength, (UINT8 *)Output);
>>>> -+      if (!EFI_ERROR (Status)) {
>>>> -+        //
>>>> -+        // Secure Algorithm was supported on this platform
>>>> -+        //
>>>> -+        return EFI_SUCCESS;
>>>> -+      } else if (Status =3D=3D EFI_UNSUPPORTED) {
>>>> -+        //
>>>> -+        // Secure Algorithm was not supported on this platform
>>>> -+        //
>>>> -+        DEBUG ((DEBUG_ERROR, "Failed to generate random data using=
 secure algorithm %d: %r\n", AlgorithmIndex, Status));
>>>> -+
>>>> -+        //
>>>> -+        // Try the next secure algorithm
>>>> -+        //
>>>> -+        continue;
>>>> -+      } else {
>>>> -+        //
>>>> -+        // Some other error occurred
>>>> -+        //
>>>> -+        DEBUG ((DEBUG_ERROR, "Failed to generate random data using=
 secure algorithm %d: %r\n", AlgorithmIndex, Status));
>>>> -+        ASSERT_EFI_ERROR (Status);
>>>> -+        return Status;
>>>> -+      }
>>>> -+    }
>>>> -+
>>>> -+    //
>>>> -+    // If we get here, we failed to generate random data using any=
 secure algorithm
>>>> -+    // Platform owner should ensure that at least one secure algor=
ithm is supported
>>>> -+    //
>>>> -+    ASSERT_EFI_ERROR (Status);
>>>> -+    return Status;
>>>> -+  }
>>>> -+
>>>> -+  //
>>>> -+  // Lets try using the default algorithm (which may not be secure=
)
>>>> -+  //
>>>> -+  Status =3D RngProtocol->GetRNG (RngProtocol, NULL, OutputLength,=
 (UINT8 *)Output);
>>>> -+  if (EFI_ERROR (Status)) {
>>>> -+    DEBUG ((DEBUG_ERROR, "%a failed to generate random data: %r\n"=
, __func__, Status));
>>>> -+    ASSERT_EFI_ERROR (Status);
>>>> -+    return Status;
>>>> -+  }
>>>> -
>>>> --  gRT->GetTime (&Time, NULL);
>>>> --  Seed  =3D (Time.Hour << 24 | Time.Day << 16 | Time.Minute << 8 |=
 Time.Second);
>>>> --  Seed ^=3D Time.Nanosecond;
>>>> --  Seed ^=3D Time.Year << 7;
>>>> -+  return EFI_SUCCESS;
>>>> -+}
>>>> -+
>>>> -+/**
>>>> -+  Generate a 32-bit pseudo-random number.
>>>> -
>>>> --  gBS->GetNextMonotonicCount (&MonotonicCount);
>>>> --  Seed +=3D (UINT32)MonotonicCount;
>>>> -+  @param[out] Output - The buffer to store the generated random nu=
mber.
>>>> -
>>>> --  return Seed;
>>>> -+  @retval EFI_SUCCESS           On Success
>>>> -+  @retval EFI_NOT_FOUND         RNG protocol not found
>>>> -+  @retval Others                Error from RngProtocol->GetRNG()
>>>> -+
>>>> -+  @return Status code
>>>> -+**/
>>>> -+EFI_STATUS
>>>> -+EFIAPI
>>>> -+PseudoRandomU32 (
>>>> -+  OUT UINT32  *Output
>>>> -+  )
>>>> -+{
>>>> -+  return PseudoRandom (Output, sizeof (*Output));
>>>> - }
>>>> -
>>>> - /**
>>>> -diff --git a/NetworkPkg/Library/DxeNetLib/DxeNetLib.inf b/NetworkPk=
g/Library/DxeNetLib/DxeNetLib.inf
>>>> -index 8145d256ec..a8f534a293 100644
>>>> ---- a/NetworkPkg/Library/DxeNetLib/DxeNetLib.inf
>>>> -+++ b/NetworkPkg/Library/DxeNetLib/DxeNetLib.inf
>>>> -@@ -3,6 +3,7 @@
>>>> - #
>>>> - #  Copyright (c) 2006 - 2018, Intel Corporation. All rights reserv=
ed.<BR>
>>>> - #  (C) Copyright 2015 Hewlett Packard Enterprise Development LP<BR=
>
>>>> -+#  Copyright (c) Microsoft Corporation
>>>> - #  SPDX-License-Identifier: BSD-2-Clause-Patent
>>>> - #
>>>> - ##
>>>> -@@ -49,7 +50,11 @@
>>>> -   gEfiSmbiosTableGuid                           ## SOMETIMES_CONSU=
MES  ## SystemTable
>>>> -   gEfiSmbios3TableGuid                          ## SOMETIMES_CONSU=
MES  ## SystemTable
>>>> -   gEfiAdapterInfoMediaStateGuid                 ## SOMETIMES_CONSU=
MES
>>>> --
>>>> -+  gEfiRngAlgorithmRaw                           ## CONSUMES
>>>> -+  gEfiRngAlgorithmSp80090Ctr256Guid             ## CONSUMES
>>>> -+  gEfiRngAlgorithmSp80090Hmac256Guid            ## CONSUMES
>>>> -+  gEfiRngAlgorithmSp80090Hash256Guid            ## CONSUMES
>>>> -+  gEfiRngAlgorithmArmRndr                       ## CONSUMES
>>>> -
>>>> - [Protocols]
>>>> -   gEfiSimpleNetworkProtocolGuid                 ## SOMETIMES_CONSU=
MES
>>>> -@@ -59,3 +64,10 @@
>>>> -   gEfiComponentNameProtocolGuid                 ## SOMETIMES_CONSU=
MES
>>>> -   gEfiComponentName2ProtocolGuid                ## SOMETIMES_CONSU=
MES
>>>> -   gEfiAdapterInformationProtocolGuid            ## SOMETIMES_CONSU=
MES
>>>> -+  gEfiRngProtocolGuid                           ## CONSUMES
>>>> -+
>>>> -+[FixedPcd]
>>>> -+  gEfiNetworkPkgTokenSpaceGuid.PcdEnforceSecureRngAlgorithms ## CO=
NSUMES
>>>> -+
>>>> -+[Depex]
>>>> -+  gEfiRngProtocolGuid
>>>> -diff --git a/NetworkPkg/NetworkPkg.dec b/NetworkPkg/NetworkPkg.dec
>>>> -index 928e84fec4..ff335e957c 100644
>>>> ---- a/NetworkPkg/NetworkPkg.dec
>>>> -+++ b/NetworkPkg/NetworkPkg.dec
>>>> -@@ -5,6 +5,7 @@
>>>> - #
>>>> - # Copyright (c) 2009 - 2021, Intel Corporation. All rights reserve=
d.<BR>
>>>> - # (C) Copyright 2015-2020 Hewlett Packard Enterprise Development L=
P<BR>
>>>> -+# Copyright (c) Microsoft Corporation
>>>> - #
>>>> - # SPDX-License-Identifier: BSD-2-Clause-Patent
>>>> - #
>>>> -@@ -127,6 +128,12 @@
>>>> -   # @Prompt Indicates whether SnpDxe creates event for ExitBootSer=
vices() call.
>>>> -   gEfiNetworkPkgTokenSpaceGuid.PcdSnpCreateExitBootServicesEvent|T=
RUE|BOOLEAN|0x1000000C
>>>> -
>>>> -+  ## Enforces the use of Secure UEFI spec defined RNG algorithms f=
or all network connections.
>>>> -+  # TRUE  - Enforce the use of Secure UEFI spec defined RNG algori=
thms.
>>>> -+  # FALSE - Do not enforce and depend on the default implementatio=
n of RNG algorithm from the provider.
>>>> -+  # @Prompt Enforce the use of Secure UEFI spec defined RNG algori=
thms.
>>>> -+  gEfiNetworkPkgTokenSpaceGuid.PcdEnforceSecureRngAlgorithms|TRUE|=
BOOLEAN|0x1000000D
>>>> -+
>>>> - [PcdsFixedAtBuild, PcdsPatchableInModule, PcdsDynamic, PcdsDynamic=
Ex]
>>>> -   ## IPv6 DHCP Unique Identifier (DUID) Type configuration (From R=
FCs 3315 and 6355).
>>>> -   # 01 =3D DUID Based on Link-layer Address Plus Time [DUID-LLT]
>>>> -diff --git a/NetworkPkg/SecurityFixes.yaml b/NetworkPkg/SecurityFix=
es.yaml
>>>> -index 7e900483fe..2b2c794697 100644
>>>> ---- a/NetworkPkg/SecurityFixes.yaml
>>>> -+++ b/NetworkPkg/SecurityFixes.yaml
>>>> -@@ -121,3 +121,42 @@ CVE_2023_45235:
>>>> -     - http://www.openwall.com/lists/oss-security/2024/01/16/2
>>>> -     - http://packetstormsecurity.com/files/176574/PixieFail-Proof-=
Of-Concepts.html
>>>> -     - https://blog.quarkslab.com/pixiefail-nine-vulnerabilities-in=
-tianocores-edk-ii-ipv6-network-stack.html
>>>> -+CVE_2023_45237:
>>>> -+  commit_titles:
>>>> -+    - "NetworkPkg:: SECURITY PATCH CVE 2023-45237"
>>>> -+  cve: CVE-2023-45237
>>>> -+  date_reported: 2023-08-28 13:56 UTC
>>>> -+  description: "Bug 09 - Use of a Weak PseudoRandom Number Generat=
or"
>>>> -+  note:
>>>> -+  files_impacted:
>>>> -+    - NetworkPkg/Dhcp4Dxe/Dhcp4Driver.c
>>>> -+    - NetworkPkg/Dhcp6Dxe/Dhcp6Driver.c
>>>> -+    - NetworkPkg/DnsDxe/DnsDhcp.c
>>>> -+    - NetworkPkg/DnsDxe/DnsImpl.c
>>>> -+    - NetworkPkg/HttpBootDxe/HttpBootDhcp6.c
>>>> -+    - NetworkPkg/IScsiDxe/IScsiCHAP.c
>>>> -+    - NetworkPkg/IScsiDxe/IScsiMisc.c
>>>> -+    - NetworkPkg/IScsiDxe/IScsiMisc.h
>>>> -+    - NetworkPkg/Include/Library/NetLib.h
>>>> -+    - NetworkPkg/Ip4Dxe/Ip4Driver.c
>>>> -+    - NetworkPkg/Ip6Dxe/Ip6ConfigImpl.c
>>>> -+    - NetworkPkg/Ip6Dxe/Ip6Driver.c
>>>> -+    - NetworkPkg/Ip6Dxe/Ip6If.c
>>>> -+    - NetworkPkg/Ip6Dxe/Ip6Mld.c
>>>> -+    - NetworkPkg/Ip6Dxe/Ip6Nd.c
>>>> -+    - NetworkPkg/Ip6Dxe/Ip6Nd.h
>>>> -+    - NetworkPkg/Library/DxeNetLib/DxeNetLib.c
>>>> -+    - NetworkPkg/Library/DxeNetLib/DxeNetLib.inf
>>>> -+    - NetworkPkg/NetworkPkg.dec
>>>> -+    - NetworkPkg/TcpDxe/TcpDriver.c
>>>> -+    - NetworkPkg/Udp4Dxe/Udp4Driver.c
>>>> -+    - NetworkPkg/Udp6Dxe/Udp6Driver.c
>>>> -+    - NetworkPkg/UefiPxeBcDxe/PxeBcDhcp4.c
>>>> -+    - NetworkPkg/UefiPxeBcDxe/PxeBcDhcp6.c
>>>> -+    - NetworkPkg/UefiPxeBcDxe/PxeBcDriver.c
>>>> -+  links:
>>>> -+    - https://bugzilla.tianocore.org/show_bug.cgi?id=3D4542
>>>> -+    - https://nvd.nist.gov/vuln/detail/CVE-2023-45237
>>>> -+    - http://www.openwall.com/lists/oss-security/2024/01/16/2
>>>> -+    - http://packetstormsecurity.com/files/176574/PixieFail-Proof-=
Of-Concepts.html
>>>> -+    - https://blog.quarkslab.com/pixiefail-nine-vulnerabilities-in=
-tianocores-edk-ii-ipv6-network-stack.html
>>>> -diff --git a/NetworkPkg/TcpDxe/TcpDriver.c b/NetworkPkg/TcpDxe/TcpD=
river.c
>>>> -index 98a90e0210..8fe6badd68 100644
>>>> ---- a/NetworkPkg/TcpDxe/TcpDriver.c
>>>> -+++ b/NetworkPkg/TcpDxe/TcpDriver.c
>>>> -@@ -2,7 +2,7 @@
>>>> -   The driver binding and service binding protocol for the TCP driv=
er.
>>>> -
>>>> -   Copyright (c) 2009 - 2018, Intel Corporation. All rights reserve=
d.<BR>
>>>> --
>>>> -+  Copyright (c) Microsoft Corporation
>>>> -   SPDX-License-Identifier: BSD-2-Clause-Patent
>>>> -
>>>> - **/
>>>> -@@ -163,7 +163,13 @@ TcpDriverEntryPoint (
>>>> -   )
>>>> - {
>>>> -   EFI_STATUS  Status;
>>>> --  UINT32      Seed;
>>>> -+  UINT32      Random;
>>>> -+
>>>> -+  Status =3D PseudoRandomU32 (&Random);
>>>> -+  if (EFI_ERROR (Status)) {
>>>> -+    DEBUG ((DEBUG_ERROR, "%a Failed to generate random number: %r\=
n", __func__, Status));
>>>> -+    return Status;
>>>> -+  }
>>>> -
>>>> -   //
>>>> -   // Install the TCP Driver Binding Protocol
>>>> -@@ -203,9 +209,8 @@ TcpDriverEntryPoint (
>>>> -   //
>>>> -   // Initialize ISS and random port.
>>>> -   //
>>>> --  Seed            =3D NetRandomInitSeed ();
>>>> --  mTcpGlobalIss   =3D NET_RANDOM (Seed) % mTcpGlobalIss;
>>>> --  mTcp4RandomPort =3D (UINT16)(TCP_PORT_KNOWN + (NET_RANDOM (Seed)=
 % TCP_PORT_KNOWN));
>>>> -+  mTcpGlobalIss   =3D Random % mTcpGlobalIss;
>>>> -+  mTcp4RandomPort =3D (UINT16)(TCP_PORT_KNOWN + (Random % TCP_PORT=
_KNOWN));
>>>> -   mTcp6RandomPort =3D mTcp4RandomPort;
>>>> -
>>>> -   return EFI_SUCCESS;
>>>> -diff --git a/NetworkPkg/TcpDxe/TcpDxe.inf b/NetworkPkg/TcpDxe/TcpDx=
e.inf
>>>> -index c0acbdca57..cf5423f4c5 100644
>>>> ---- a/NetworkPkg/TcpDxe/TcpDxe.inf
>>>> -+++ b/NetworkPkg/TcpDxe/TcpDxe.inf
>>>> -@@ -82,5 +82,8 @@
>>>> -   gEfiTcp6ProtocolGuid                          ## BY_START
>>>> -   gEfiTcp6ServiceBindingProtocolGuid            ## BY_START
>>>> -
>>>> -+[Depex]
>>>> -+  gEfiHash2ServiceBindingProtocolGuid
>>>> -+
>>>> - [UserExtensions.TianoCore."ExtraFiles"]
>>>> -   TcpDxeExtra.uni
>>>> -diff --git a/NetworkPkg/Udp4Dxe/Udp4Driver.c b/NetworkPkg/Udp4Dxe/U=
dp4Driver.c
>>>> -index cb917fcfc9..c7ea16f4cd 100644
>>>> ---- a/NetworkPkg/Udp4Dxe/Udp4Driver.c
>>>> -+++ b/NetworkPkg/Udp4Dxe/Udp4Driver.c
>>>> -@@ -1,6 +1,7 @@
>>>> - /** @file
>>>> -
>>>> - Copyright (c) 2006 - 2018, Intel Corporation. All rights reserved.=
<BR>
>>>> -+Copyright (c) Microsoft Corporation
>>>> - SPDX-License-Identifier: BSD-2-Clause-Patent
>>>> -
>>>> - **/
>>>> -@@ -555,6 +556,13 @@ Udp4DriverEntryPoint (
>>>> -   )
>>>> - {
>>>> -   EFI_STATUS  Status;
>>>> -+  UINT32      Random;
>>>> -+
>>>> -+  Status =3D PseudoRandomU32 (&Random);
>>>> -+  if (EFI_ERROR (Status)) {
>>>> -+    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\=
n", __func__, Status));
>>>> -+    return Status;
>>>> -+  }
>>>> -
>>>> -   //
>>>> -   // Install the Udp4DriverBinding and Udp4ComponentName protocols.
>>>> -@@ -571,7 +579,7 @@ Udp4DriverEntryPoint (
>>>> -     //
>>>> -     // Initialize the UDP random port.
>>>> -     //
>>>> --    mUdp4RandomPort =3D (UINT16)(((UINT16)NetRandomInitSeed ()) % =
UDP4_PORT_KNOWN + UDP4_PORT_KNOWN);
>>>> -+    mUdp4RandomPort =3D (UINT16)(((UINT16)Random) % UDP4_PORT_KNOW=
N + UDP4_PORT_KNOWN);
>>>> -   }
>>>> -
>>>> -   return Status;
>>>> -diff --git a/NetworkPkg/Udp6Dxe/Udp6Driver.c b/NetworkPkg/Udp6Dxe/U=
dp6Driver.c
>>>> -index ae96fb9966..edb758d57c 100644
>>>> ---- a/NetworkPkg/Udp6Dxe/Udp6Driver.c
>>>> -+++ b/NetworkPkg/Udp6Dxe/Udp6Driver.c
>>>> -@@ -2,7 +2,7 @@
>>>> -   Driver Binding functions and Service Binding functions for the N=
etwork driver module.
>>>> -
>>>> -   Copyright (c) 2009 - 2018, Intel Corporation. All rights reserve=
d.<BR>
>>>> --
>>>> -+  Copyright (c) Microsoft Corporation
>>>> -   SPDX-License-Identifier: BSD-2-Clause-Patent
>>>> -
>>>> - **/
>>>> -@@ -596,6 +596,13 @@ Udp6DriverEntryPoint (
>>>> -   )
>>>> - {
>>>> -   EFI_STATUS  Status;
>>>> -+  UINT32      Random;
>>>> -+
>>>> -+  Status =3D PseudoRandomU32 (&Random);
>>>> -+  if (EFI_ERROR (Status)) {
>>>> -+    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\=
n", __func__, Status));
>>>> -+    return Status;
>>>> -+  }
>>>> -
>>>> -   //
>>>> -   // Install the Udp6DriverBinding and Udp6ComponentName protocols.
>>>> -@@ -614,7 +621,7 @@ Udp6DriverEntryPoint (
>>>> -     // Initialize the UDP random port.
>>>> -     //
>>>> -     mUdp6RandomPort =3D (UINT16)(
>>>> --                               ((UINT16)NetRandomInitSeed ()) %
>>>> -+                               ((UINT16)Random) %
>>>> -                                UDP6_PORT_KNOWN +
>>>> -                                UDP6_PORT_KNOWN
>>>> -                                );
>>>> -diff --git a/NetworkPkg/UefiPxeBcDxe/PxeBcDhcp4.c b/NetworkPkg/Uefi=
PxeBcDxe/PxeBcDhcp4.c
>>>> -index 91146b78cb..452038c219 100644
>>>> ---- a/NetworkPkg/UefiPxeBcDxe/PxeBcDhcp4.c
>>>> -+++ b/NetworkPkg/UefiPxeBcDxe/PxeBcDhcp4.c
>>>> -@@ -2,7 +2,7 @@
>>>> -   Functions implementation related with DHCPv4 for UefiPxeBc Drive=
r.
>>>> -
>>>> -   Copyright (c) 2009 - 2018, Intel Corporation. All rights reserve=
d.<BR>
>>>> --
>>>> -+  Copyright (c) Microsoft Corporation
>>>> -   SPDX-License-Identifier: BSD-2-Clause-Patent
>>>> -
>>>> - **/
>>>> -@@ -1381,6 +1381,12 @@ PxeBcDhcp4Discover (
>>>> -   UINT8                             VendorOptLen;
>>>> -   UINT32                            Xid;
>>>> -
>>>> -+  Status =3D PseudoRandomU32 (&Xid);
>>>> -+  if (EFI_ERROR (Status)) {
>>>> -+    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\=
n", __func__, Status));
>>>> -+    return Status;
>>>> -+  }
>>>> -+
>>>> -   Mode   =3D Private->PxeBc.Mode;
>>>> -   Dhcp4  =3D Private->Dhcp4;
>>>> -   Status =3D EFI_SUCCESS;
>>>> -@@ -1471,7 +1477,6 @@ PxeBcDhcp4Discover (
>>>> -   //
>>>> -   // Set fields of the token for the request packet.
>>>> -   //
>>>> --  Xid                                 =3D NET_RANDOM (NetRandomIni=
tSeed ());
>>>> -   Token.Packet->Dhcp4.Header.Xid      =3D HTONL (Xid);
>>>> -   Token.Packet->Dhcp4.Header.Reserved =3D HTONS ((UINT16)((IsBCast=
) ? 0x8000 : 0x0));
>>>> -   CopyMem (&Token.Packet->Dhcp4.Header.ClientAddr, &Private->Stati=
onIp, sizeof (EFI_IPv4_ADDRESS));
>>>> -diff --git a/NetworkPkg/UefiPxeBcDxe/PxeBcDhcp6.c b/NetworkPkg/Uefi=
PxeBcDxe/PxeBcDhcp6.c
>>>> -index 7fd1281c11..bcabbd2219 100644
>>>> ---- a/NetworkPkg/UefiPxeBcDxe/PxeBcDhcp6.c
>>>> -+++ b/NetworkPkg/UefiPxeBcDxe/PxeBcDhcp6.c
>>>> -@@ -2180,7 +2180,7 @@ PxeBcDhcp6Discover (
>>>> -   UINTN                            ReadSize;
>>>> -   UINT16                           OpCode;
>>>> -   UINT16                           OpLen;
>>>> --  UINT32                           Xid;
>>>> -+  UINT32                           Random;
>>>> -   EFI_STATUS                       Status;
>>>> -   UINTN                            DiscoverLenNeeded;
>>>> -
>>>> -@@ -2198,6 +2198,12 @@ PxeBcDhcp6Discover (
>>>> -     return EFI_DEVICE_ERROR;
>>>> -   }
>>>> -
>>>> -+  Status =3D PseudoRandomU32 (&Random);
>>>> -+  if (EFI_ERROR (Status)) {
>>>> -+    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\=
n", __func__, Status));
>>>> -+    return Status;
>>>> -+  }
>>>> -+
>>>> -   DiscoverLenNeeded =3D sizeof (EFI_PXE_BASE_CODE_DHCPV6_PACKET);
>>>> -   Discover          =3D AllocateZeroPool (DiscoverLenNeeded);
>>>> -   if (Discover =3D=3D NULL) {
>>>> -@@ -2207,8 +2213,7 @@ PxeBcDhcp6Discover (
>>>> -   //
>>>> -   // Build the discover packet by the cached request packet before.
>>>> -   //
>>>> --  Xid                     =3D NET_RANDOM (NetRandomInitSeed ());
>>>> --  Discover->TransactionId =3D HTONL (Xid);
>>>> -+  Discover->TransactionId =3D HTONL (Random);
>>>> -   Discover->MessageType   =3D Request->Dhcp6.Header.MessageType;
>>>> -   RequestOpt              =3D Request->Dhcp6.Option;
>>>> -   DiscoverOpt             =3D Discover->DhcpOptions;
>>>> -diff --git a/NetworkPkg/UefiPxeBcDxe/PxeBcDriver.c b/NetworkPkg/Uef=
iPxeBcDxe/PxeBcDriver.c
>>>> -index d84aca7e85..4cd915b411 100644
>>>> ---- a/NetworkPkg/UefiPxeBcDxe/PxeBcDriver.c
>>>> -+++ b/NetworkPkg/UefiPxeBcDxe/PxeBcDriver.c
>>>> -@@ -3,6 +3,7 @@
>>>> -
>>>> -   (C) Copyright 2014 Hewlett-Packard Development Company, L.P.<BR>
>>>> -   Copyright (c) 2007 - 2019, Intel Corporation. All rights reserve=
d.<BR>
>>>> -+  Copyright (c) Microsoft Corporation
>>>> -
>>>> -   SPDX-License-Identifier: BSD-2-Clause-Patent
>>>> -
>>>> -@@ -892,6 +893,13 @@ PxeBcCreateIp6Children (
>>>> -   PXEBC_PRIVATE_PROTOCOL       *Id;
>>>> -   EFI_SIMPLE_NETWORK_PROTOCOL  *Snp;
>>>> -   UINTN                        Index;
>>>> -+  UINT32                       Random;
>>>> -+
>>>> -+  Status =3D PseudoRandomU32 (&Random);
>>>> -+  if (EFI_ERROR (Status)) {
>>>> -+    DEBUG ((DEBUG_ERROR, "Failed to generate random number using E=
FI_RNG_PROTOCOL: %r\n", Status));
>>>> -+    return Status;
>>>> -+  }
>>>> -
>>>> -   if (Private->Ip6Nic !=3D NULL) {
>>>> -     //
>>>> -@@ -935,9 +943,9 @@ PxeBcCreateIp6Children (
>>>> -   }
>>>> -
>>>> -   //
>>>> --  // Generate a random IAID for the Dhcp6 assigned address.
>>>> -+  // Set a random IAID for the Dhcp6 assigned address.
>>>> -   //
>>>> --  Private->IaId =3D NET_RANDOM (NetRandomInitSeed ());
>>>> -+  Private->IaId =3D Random;
>>>> -   if (Private->Snp !=3D NULL) {
>>>> -     for (Index =3D 0; Index < Private->Snp->Mode->HwAddressSize; I=
ndex++) {
>>>> -       Private->IaId |=3D (Private->Snp->Mode->CurrentAddress.Addr[=
Index] << ((Index << 3) & 31));
>>>> ---
>>>> -2.40.0
>>>> -
>>>> diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/=
ovmf/ovmf_git.bb
>>>> index d52e3f4971..bb345688ac 100644
>>>> --- a/meta/recipes-core/ovmf/ovmf_git.bb
>>>> +++ b/meta/recipes-core/ovmf/ovmf_git.bb
>>>> @@ -47,8 +47,6 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git=
;branch=3Dmaster;protocol=3Dhttps \
>>>>               file://CVE-2023-45229-0002.patch \
>>>>               file://CVE-2023-45229-0003.patch \
>>>>               file://CVE-2023-45229-0004.patch \
>>>> -           file://CVE-2023-45237-0001.patch \
>>>> -           file://CVE-2023-45237-0002.patch \
>>>>               file://CVE-2023-45236.patch \
>>>>               file://CVE-2022-36765-0001.patch \
>>>>               file://CVE-2022-36765-0002.patch \
>>>> --
>>>> 2.34.1
>>>>
>>>>
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#211699): https://lists.openembedded.org/g/openem=
bedded-core/message/211699
>>>> Mute This Topic: https://lists.openembedded.org/mt/111267276/3620601
>>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsu=
b [steve@sakoman.com]
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>
>> --
>> Kai Kang
>> Wind River Linux
>>

--=20
Kai Kang
Wind River Linux


