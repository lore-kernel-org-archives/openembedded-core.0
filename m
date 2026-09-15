Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEB37C88E77
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 21:19:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1034.1789507159133869331
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 14:19:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=sLC/B4+t;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=37185ab288=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FJGlae3530792
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 21:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=Gbn2QFW8DyxquTEUUvO0/9
	hL1rc8PdtAdPPzzuQqqhQ=; b=sLC/B4+tGIzvlLhAb35SV5+ntthmrm1VcOR3/m
	zKt0qLyWqwjGYQMdUcfqHhjDyi1ai9ZWHFJ8679vI4YyttQzdC5W+uDko4xfvw6H
	I4o1RJEh3QtiOaRQZTe2urbaXx/ewTymIQtRSlYnv23oWZix41v5E61XtZbNjWw8
	R8m2CGEmeshAZ93Cj9WEO1Wl7nic+QjbVq7Gxti0zSr5l6qifBU2qxv+ex/peott
	Dt/k+kOHltUa0+8SLFRFMqAx25tyDrW6fwKBGzUaRB3ILo3YJ7YirgVWVBMu58di
	trF7LgvA+oskjzYn49wGop3pQ4hHvO78/CWaYzxHtMxHpicQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022100.outbound.protection.outlook.com [52.101.53.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gqc1q08qg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 21:19:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pVG6MyfSHksBcmEYzb+4SZm4Bx3lxVkQcVliZl4y53EWwY5hOd65g4mZh40MwhLKf6QuT5swlpegBfo237UcnjrYDowhFhcmxMU4Zu0mTnyCpYbKXXt1m9Zd0k3Vmxjjs5js7Gsa6PmtETM1ogkM8A2JzMMnSbvQgvafTnrN5EFrsQqhZ4PoNGrZtE+fGAUfdgxCDkul8a3U6dimwRQvWIg81m+iD6GN1gUljo+YcPKMvmMqyOwsT4Ksyd4H8gkTmixGBqyTV2Pliksw2f8nDVQ6hz/VLEmcO20Q63XhhRF4K10jSkt7e4xICV2JqwuUG5Kz8FKI+9ESrHmIm0c2aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gbn2QFW8DyxquTEUUvO0/9hL1rc8PdtAdPPzzuQqqhQ=;
 b=omZjvGHVxZNmNqWBvD+t+ZZItbKKqbMZpJ3VPa5A7cN0O3tBmPO5mxz2vdQZcAVT3zl8vqxUvW87jDCljx3zfy7QwbEZuUnJEwbCRBbtGFWjt5vsidvIP9Coj0ldfKA+GnH8IFanQa2cT/4cWbr/m9o63p50PXnxLB46C8xzP7s1iTVE5X9bOyKNVPTGA+qf1ZEUNtCefeCS3WZ6ddMikxajSXlianwB0Z5XlKqaGTUPFvwQ9pMxQJrzO4Ao7wNOphut2H/r1fI8jrPbEl0oJHYOwWvLDcXsnLgsxq9y+vacssUoGKyYSJ32xLlmMm94LpPp7R/jxVqeqLAeTxFB6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by MW4PR11MB7101.namprd11.prod.outlook.com (2603:10b6:303:219::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Tue, 15 Sep
 2026 21:19:15 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%7]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 21:19:14 +0000
Content-Type: multipart/alternative;
 boundary="------------Ci7DY2nKrk0lkmG9XzrYaJan"
Message-ID: <0e241da6-c332-4965-8f99-14f9c3469701@windriver.com>
Date: Tue, 15 Sep 2026 17:19:13 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tiff: add ptest support
To: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>,
        openembedded-core@lists.openembedded.org
Cc: Shiva Komati <Shiva.Komati@windriver.com>,
        Ross Burton <ross.burton@arm.com>
References: <20260915073620.2271352-1-HimaniRamesh.Barde@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20260915073620.2271352-1-HimaniRamesh.Barde@windriver.com>
X-ClientProxiedBy: YT4PR01CA0151.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ac::18) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|MW4PR11MB7101:EE_
X-MS-Office365-Filtering-Correlation-Id: 20b79014-de51-460e-ff81-08df136efe7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|5023799004|6133799003|10067099003|3023799007|56012099006|18002099003|22082099003|25016099003|29003799003|11063799006|8096899003|12006099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	CPPnPHhNnAdCk4ZTPG1Rjw05WhabR+rTGeRVRIYccYdmhQnsoprXsJYnHEVaviWKq6TegNSJrZsdpO0qL3DuEV/9lIj16rqY0uJ30SS4cGz9mm0bjTFPtH1UGgzkuCx80wqARoguJO9asbvo6w48WP/lNm6NMFUGl6/5QYsOiYjxeBhxSZimopRg91gao0OGimf1p6TXwYpPYbE15JrE1VzBWx7cLUJSqPzh53JjQiFM7Lsaw8Btoxx4b9ui33vx7kbywPeWweVC5xDsQmfD3NBDGHkMY5v+CrzQ9ceHEizJ48qVCRqTmCkMwCX0BuF6LsQMXqPJLO1d8iRYwBIMrmHCybI6sBbp5RWZ0156lexgtZXFlwT85mnD4qGWhbxBexb5foNydZFjxWUApQdDYPqq77OJaeCzytThJebmFSV1IctL6aJ9bnY64QJTFCNHOcLtHXmyHyQ/4KUCqV0DgEIS68kVTjtLvhRde6qavmo8eB5sGtolJLznLgykYf2NtvBu2OTWeuWsuOz7mPwAKcsiuRf/UPy5uPNMvDReaeMMv+XdQuh6olTgz1oe7yLvVxA5TrnqL/65uMQIgYX1Teei7CUYuLPzaY0ltx2F5sY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(5023799004)(6133799003)(10067099003)(3023799007)(56012099006)(18002099003)(22082099003)(25016099003)(29003799003)(11063799006)(8096899003)(12006099003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dlg2bHZKOGc2eDNKYmRLcmpVVGF6ZXhWYU1lZ3lEQkF2M2V3TWdobE9NUEdh?=
 =?utf-8?B?RXBEcGFKclIyTVhZc2o2TVNiamc0L3o2U2Nna3NWdW85L0EranJLc3g2NU1G?=
 =?utf-8?B?NjZRQTMyNnRMQ1RhMGtLTkd5bEdSRk9xSGYzdGxQWkdOU1AwUU9haUVpamZn?=
 =?utf-8?B?VFFobitpNnE0ZFYyWEN3QmIwV0FJN1VGTVlXMWNVbmpMcS9GNEo5ZTV1ajVR?=
 =?utf-8?B?R1VSR1pPWElrN0VEbW4xdThidlV6amp6MHB3L25kMVhNMzNrbW9HR3lIcHpl?=
 =?utf-8?B?Ny8vak5ST3Y2RTJTejE0bHFoelN4VklRNjdLUS96eXRzb2xrd1pIWWgrWmUz?=
 =?utf-8?B?STk5ZXArVk1TSHdzTEs5UTl5V2E0cDhab2c0L2NnZnNvck9saVZDUTBFTTRH?=
 =?utf-8?B?YStVRlQ4ZSsvbUplY2pneWg0bkI1NVdTMGtJNkZiZUYyRU5URjg4SkRaS3R2?=
 =?utf-8?B?dkJZWFhTUlp3RHlFTjRWUmM4eDZzK0VaeWJGVWwxTU9DTmg5YkJucUZhQUJu?=
 =?utf-8?B?T2ZWd3NoVzJpRDBQMnR3cm05ZVpzVHA3bFNaUVlKMVZQckFLclJQK1VOMitV?=
 =?utf-8?B?dGhJTG5xVlVMNUMrSGJvdjUwOG5WeEpPSDQwK1VzekVqRE5DVlV1cTNieDY1?=
 =?utf-8?B?N3NKYXpabHNrVjMzYktCZFZ6akFtMGFqbGp3RlpkVm5lTzVNRTFtZWF5eFpV?=
 =?utf-8?B?c2Y3dWZCbGtmV3cxQ2l4K2U3dXJGcFpud2pWWm9xeDYwNDZzNVRBNjBOUXRO?=
 =?utf-8?B?K0VGeE1lcUhybHBnRE5tUVB2TUVDVkVVaHRuVGFkL2NiemRUSHRxMjNDMjQ5?=
 =?utf-8?B?VUVEazNiTnF1WkdkSTQ3c2wrL1I2bmtqaDBFWkhGcXJ2N1pWZFM0YkhtQlVZ?=
 =?utf-8?B?bE0zYzFGS29XNElMT0R2aW9QZkVpWXM3L1JYMEtXM1Y4NU1ORUxmTFNRb0U3?=
 =?utf-8?B?Q1lSWGttNG0zeSt3WkNZRWZ3UzFNSWZEajVKQVFkNE5aeGlrQWYxWXp1eUR6?=
 =?utf-8?B?N3dBaWpQMUpYcmRVQmVOL0ZaVG1xK2kzNnMzcVQ0cEVFdWJyYW40Y0FscElk?=
 =?utf-8?B?Y0JZbDZVVkNXWExLOHBYb04rdzllSmpwQ0lNdEpYT0lqRC91S2xiOUFZYjhn?=
 =?utf-8?B?dnA0YUE0ci9OaC9uK21HbURuZllwcUZ6eGRnbkVFZUhXaExjT01yTUpLR1A0?=
 =?utf-8?B?NGVVTUEwMENJTndObGQyTW40WXREL0xJVklWVkpMK2xUTkFObXpXSlNCK0o1?=
 =?utf-8?B?RGJ0cllPNjdBZm1MS3Y0NHBjMVZucjEvbHpWR3lqQXNQUDlrS3pVMmNQZmlJ?=
 =?utf-8?B?Wm9VNzN2a1JlU1RLSnJxaU1rY0RjdUxscGp5MVlqdTY4NFk0OXZ4dkxuUTU1?=
 =?utf-8?B?b2tCb3B5RnpIWEU4V0tPSE1lOURRSGx2Unk1SzBUSHdQOEQ1cVM4eHZjcEND?=
 =?utf-8?B?RlR1Mkk4NVdoOGxaU3ptc1AvOXJXMVdsV3ZrZ1FPTjQ2dWZJVS9RK0hBcTkv?=
 =?utf-8?B?Uk43QXZEcE51MEVMUFdOOWgyUCtJbmd4eGNkZXAvK0RxL1hjSFRPTTdpRmJZ?=
 =?utf-8?B?WCtiMlRTWXBUbFM0RE5STmx6K28wRlBPQSt5SG1obitPTXMzdjNRNkRPRFFV?=
 =?utf-8?B?Y3VHUTRoY0FGQzk4SElOV2EzUE8rZjUwTmJGSmN6S0JwTjBsdktYY0QzbFQy?=
 =?utf-8?B?MmJjeS9uSmlHT05kREVDRndQMEdBNEhKc2hwLzBIbzYvTldjRGdheVRETEgx?=
 =?utf-8?B?ZXRudkhKRWJ4eVY4MVpmVFdjejBVTnVTV21YcUQrbHJOb3lJWWZ2OGZUSkdp?=
 =?utf-8?B?dHYwVjRNYnB6QlV0MksvK05VR3lOZzZTUitFWEd0enBMUEp2aVNHcFRZUmx6?=
 =?utf-8?B?MDdjMnNiNzQyZnZ0OWFCUkgvQnNKak5NMVIwSEtBR2cySHZjRFYxREMrTi9n?=
 =?utf-8?B?c2xnaHdWaEtMY2treXlJcG02WiszV2RBTklIa0MycC84dG5YZjRaM2E4SmZU?=
 =?utf-8?B?UFM4anNtYnkwZGlNSlhNbmxtOGdQaDM4Vis0NmQyb2dCV1E3WXFWclEzdXZW?=
 =?utf-8?B?MFRES21VNUtTM0VQS3NCWUduTVAxTTR1OTJLUVdQU0ZTWlplL1U2Rm5kU1Z6?=
 =?utf-8?B?bFo4eHA4SXFrVzZVNHRpZTBvQlJVSnhCV3NWcWZoa1hpSHlaQzZFMFA4MDY0?=
 =?utf-8?B?WWtxbWxtek8vZngxSUFwbUlXR2ROT0RCQitOcVBzMm1RaC9HeDVUSFA1b2VE?=
 =?utf-8?B?UXZSTjZXTFp6QVJwZVZIUXROY3Z0ZHBJdmszQVVHTXN2SU1nYmNxbVFsb2lx?=
 =?utf-8?B?V3c2aUpsRWQ2TzBsVS96KzhNTlFWQitRZjMyck9rTEVEdmc0eVlCV1RPdWln?=
 =?utf-8?Q?TTZfTgPWzYW9k4wo=3D?=
X-Exchange-RoutingPolicyChecked: 
	rdKjv4SpNcZQWQoVpvEcMy8GKVRosRhe7fCRR49qjgafxCXxcUrl184K8KvrdFrpcJxPMv5bg2KDIz9zP8ZQ7BXLYAIzKHD91fds1+MHW5DhhMTOUZmzl7b2LKwcTtUrJTV+y7Hi5FZyUOCpBKHFsith7uGsBTrTqxe00/2bhOWZZyhYyxwGikJrBIAO9jZXFTYNcKi/hWxkqUWbPXgWXGC7lFbJLL7MusuBABx579sNvThYe6Do/0L7TqHVrN/z4GU5MHzL9SAZGULPbV/LIRh78zNFu8fAdFIoUSFO5QSFWcrh6gqADiXFAM66CiRp1THrOQwgSvuZ1MyHfhnTFA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20b79014-de51-460e-ff81-08df136efe7e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 21:19:14.8607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gSZN/ymLQrLtIXYjeOS1D/T6qk1BApsKnYA7TXybeOEFp9T2MXXBF9Mw/U8rJKcAjag6gB1flAL8SA0GiLWr40E8qIgxQ0b7Hi3VJrfWexQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7101
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=D9HSufRj c=1 sm=1 tr=0 ts=6aa9b655 cx=c_pps
 a=DKSSrQ+NYQ8T18zF/YpGLw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=Qs8GJauRAAAA:8
 a=H9VqmB7XAAAA:8 a=t7CeM3EgAAAA:8 a=80XHqyHurY4IFKenZBEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=brB6Bddo3YucmKYmUAAA:9 a=OO5gUf6TlqiWrqzV:21
 a=_W_S_7VecoQA:10 a=zNvLeHyizlYA:10 a=lqcHg5cX4UMA:10
 a=-MsOl3yrPmtpHepMbiy1:22 a=v3k57InNul7ldpsxCyLV:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDMxMSBTYWx0ZWRfX0op8NsE+zaeY
 iSE0sYd7JCVbZzRwJ33vwgjzwdNaEbnNGU1wv73+tCjHGH/ibFL1+3hz8kBt+q78YPYAxzuXqW+
 zKvxc9doogrFe14TLBjgXlO+ady2M3CdAD/eDMHRlQ9mkMaCrzPrHfyT+r49xSEWm54p3ztTQJe
 PBjS7xvETE4zFmig6s5XFwjyfcn/noTwr3v8If17YG5h+Ma5wsV8ZGLvLKAAAuy1qOvve6Q/5Po
 AxS58nhQrVPq1vkeEXbQlG94Kr0elt7+7OgV9RBRfLZIyg7YEZC7q+QFhX6pewIRpn8MeecGeDK
 AODgNxFjPSBICNg5EX4SjpnAw0baB4AyDofaAf6fwyU2H34aIsN5P1NMudlcHkvfhxCZ8myNYRf
 P7xlxzNQMgT9JfNNLr7cF11j5FtUkTrwYsA9uq8+l0Bc49ivvRP341Wl6lQp8hT+GSPT+tBYKIL
 ZNaJrZxv0kr+qHhsh8A==
X-Proofpoint-GUID: vnCQ7FXDVlTgrBwt3_pDcO-HlWyMC46C
X-Proofpoint-ORIG-GUID: 1YjWBRBStblqGa3uYwaXf1m3IIJI76bv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDMxMSBTYWx0ZWRfXwV7ON0IHyj8O
 z17tnQK50cWoJVV65s85XW2B4euiaSooKVmJoCnTdJtttjWVhZgFuzrHasK47uB3RB9FiQGcaoM
 hparkps7Rsp0jHCtGqRkO6DHJszuD2x8LKsu6HQKbyhNNpBDB3fn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150311
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 21:19:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245904

--------------Ci7DY2nKrk0lkmG9XzrYaJan
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 68FJGlae3530792

Hi Himani,

I'll review this before Ross Burton gets to it ! ;-)

On 2026-09-15 03:36, Himani Ramesh Barde wrote:
> Enable ptest for tiff (libtiff), running the upstream test suite shippe=
d
> in the source test/ directory: the C unit-test programs (check_PROGRAMS=
)
> plus the shell-script tests that exercise the tiff command-line tools.
>
> do_compile_ptest builds the test programs via "make check TESTS=3D" (bu=
ild
> only, no run). do_install_ptest installs the compiled test binaries (re=
al
> ELF from test/.libs, static testtypes from test/), the shell test scrip=
ts,
> the shared common.sh helper, and the images/refs data. common.sh is
> adjusted so the scripts find the installed tiff tools in ${bindir} rath=
er
> than the build tree's ../tools, and run-ptest recreates the SOURCE_DIR
> path that test_ifd_loop_detection was compiled with so its images resol=
ve
> on target.
>
> The run-ptest wrapper emits automake-style PASS/FAIL/SKIP results and
> skips the JBIG test (JBIG is not in the default PACKAGECONFIG) and the
> thumbnail test (the thumbnail tool is not built by default).
>
> The recipe is registered in ptest-packagelists.inc (PTESTS_SLOW), and

What was the execution time that determined that you would add this to sl=
ow.

> buildpaths QA is skipped for the -ptest package since the compiled test
> binaries legitimately embed build paths.

Well, maybe not legitimately but we haven't yet demanded that the ptest=20
code be reproducbile AFAIK.

>
> Validated on qemux86-64: all C tests and shell tests pass, 2 skipped
> (jbig, thumbnail), 0 failed.

Why were 2 skipped ?
Specify how many tests were run for those curious and since you have=20
that data on hand.

>
> Signed-off-by: Himani Ramesh Barde<HimaniRamesh.Barde@windriver.com>
> ---
>   .../distro/include/ptest-packagelists.inc     |  1 +
>   .../recipes-multimedia/libtiff/tiff/run-ptest | 31 ++++++++++++++
>   meta/recipes-multimedia/libtiff/tiff_4.7.2.bb | 42 ++++++++++++++++++=
-
>   3 files changed, 73 insertions(+), 1 deletion(-)
>   create mode 100755 meta/recipes-multimedia/libtiff/tiff/run-ptest
>
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/con=
f/distro/include/ptest-packagelists.inc
> index 2b5d665..837e1c1 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -151,6 +151,7 @@ PTESTS_SLOW =3D "\
>       tar \
>       tcl \
>       tcl8 \
> +    tiff \
>       util-linux \
>       zstd \
>   "
> diff --git a/meta/recipes-multimedia/libtiff/tiff/run-ptest b/meta/reci=
pes-multimedia/libtiff/tiff/run-ptest
> new file mode 100755
> index 0000000..40301ed
> --- /dev/null
> +++ b/meta/recipes-multimedia/libtiff/tiff/run-ptest
> @@ -0,0 +1,31 @@
> +#!/bin/sh
> +# Run the libtiff test suite and emit ptest-style PASS/FAIL/SKIP lines.
> +cd "$(dirname "$0")/test" || exit 1
> +
> +# test_ifd_loop_detection is built with -DSOURCE_DIR=3D"@SOURCE_DIR@" =
and opens
> +# its images via that relative path; symlink it to the installed test =
dir.
> +if [ ! -e "@SOURCE_DIR@" ]; then
> +    mkdir -p "$(dirname @SOURCE_DIR@)"
> +    ln -sf "$(pwd)" "@SOURCE_DIR@" 2>/dev/null || true
> +fi
> +
> +CPROGS=3D"ascii_tag long_tag short_tag strip_rw rewrite custom_dir \
> +custom_dir_EXIF_231 defer_strile_loading defer_strile_writing test_dir=
ectory \
> +test_IFD_enlargement test_open_options test_append_to_strip \
> +test_ifd_loop_detection testtypes test_signed_tags raw_decode"

Ross will likely have more to say here but my take is:

+1 point for using a list in run-ptest and iterating over it.
-1 point since this list is also in the recipe.

There's likely a way to have the list live in the RECIPE ONLY and
then generate or fill-in the run-ptest script at build time.

Gemini suggested this:

|PTEST_APPS =3D "app1 app2 app3" SRC_URI +=3D "file://run-ptest" inherit=20
ptest do_install_ptest() { install -m 0755 ${UNPACKDIR}/run-ptest=20
${D}${PTEST_PATH}/run-ptest # Replace the placeholder with the BitBake=20
variable contents sed -i -e 's/@PTEST_APPS@/${PTEST_APPS}/g'=20
${D}${PTEST_PATH}/run-ptest } |


There may be better ways.

> +
> +for t in $CPROGS; do
> +    if [ -x "./$t" ]; then
> +        if ./"$t" >/dev/null 2>&1; then echo "PASS: $t"; else echo "FA=
IL: $t"; fi
> +    fi
> +done
> +
> +for t in *.sh; do
> +    [ "$t" =3D "common.sh" ] && continue
> +    case "$t" in
> +        *jbig*) echo "SKIP: $t (JBIG support not enabled)"; continue ;=
;
> +        tiffcp-thumbnail.sh)
> +            command -v thumbnail >/dev/null 2>&1 || { echo "SKIP: $t (=
thumbnail tool not built)"; continue; } ;;
> +    esac
> +    if sh "./$t" >/dev/null 2>&1; then echo "PASS: $t"; else echo "FAI=
L: $t"; fi
> +done
> diff --git a/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb b/meta/recip=
es-multimedia/libtiff/tiff_4.7.2.bb
> index 8bc3a48..ea4300b 100644
> --- a/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb
> +++ b/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb
> @@ -9,6 +9,7 @@ LIC_FILES_CHKSUM =3D"file://LICENSE.md;md5=3D4ab490c308=
8a0acff254eb2f8c577547"
>   CVE_PRODUCT =3D "libtiff"
>  =20
>   SRC_URI =3D"http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \ +=20
> file://run-ptest \ "
>  =20
>   SRC_URI[sha256sum] =3D "672bd7d10aee4606171afb864f3570b83340f6a33e2c1=
86dc0512f7145ffdf6a"
> @@ -23,7 +24,7 @@ CVE_STATUS[CVE-2023-6277] =3D "fixed-version: Fixed s=
ince 4.7.0, NVD tracks this a
>   CVE_STATUS[CVE-2025-8851] =3D "fixed-version: Fixed since 4.7.0, NVD =
tracks this as fixed in 2024-08-11 vulnerability"
>   CVE_STATUS[CVE-2026-4775] =3D "fixed-version: Fixed since 4.7.2, NVD =
tracks this as version-less vulnerability"
>  =20
> -inherit autotools multilib_header
> +inherit autotools multilib_header ptest
>  =20
>   CACHED_CONFIGUREVARS =3D "ax_cv_check_gl_libgl=3Dno"
>  =20
> @@ -64,3 +65,42 @@ do_install:append() {
>   }
>  =20
>   BBCLASSEXTEND =3D "native nativesdk"
> +
> +do_compile_ptest() {
> +    oe_runmake -C ${B}/test check TESTS=3D""
> +}
> +
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}/test
> +    # Compiled C unit-test programs. libtool leaves a wrapper script i=
n test/
> +    # and the real ELF binary in test/.libs/; testtypes is static and =
lives
> +    # only in test/.
> +    for prog in ascii_tag long_tag short_tag strip_rw rewrite custom_d=
ir \
> +                custom_dir_EXIF_231 defer_strile_loading defer_strile_=
writing \
> +                test_directory test_IFD_enlargement test_open_options =
\
> +                test_append_to_strip test_ifd_loop_detection testtypes=
 \
> +                test_signed_tags raw_decode; do
> +        if [ -e ${B}/test/.libs/$prog ]; then
> +            install -m 0755 ${B}/test/.libs/$prog ${D}${PTEST_PATH}/te=
st/
> +        else
> +            install -m 0755 ${B}/test/$prog ${D}${PTEST_PATH}/test/
> +        fi
> +    done
> +    # Shell test scripts and the shared helper
> +    install ${S}/test/*.sh ${D}${PTEST_PATH}/test/
> +    install ${S}/test/common.sh ${D}${PTEST_PATH}/test/
> +    # Point the test scripts at the installed tiff tools instead of ..=
/tools
> +    sed -i -e "s|^TOOLS=3D.*|TOOLS=3D${bindir}|" ${D}${PTEST_PATH}/tes=
t/common.sh
> +    # test_ifd_loop_detection embeds -DSOURCE_DIR=3D../../tiff-${PV}/t=
est; fill
> +    # that path into run-ptest so it can be symlinked to the installed=
 tests.
> +    sed -i -e"s|@SOURCE_DIR@|../../tiff-${PV}/test|g" ${D}${PTEST_PATH=
}/run-ptest
> +    # Input images and reference outputs
> +    cp -r ${S}/test/images ${D}${PTEST_PATH}/test/
> +    cp -r ${S}/test/refs ${D}${PTEST_PATH}/test/
> +}
> +
> +RDEPENDS:${PN}-ptest +=3D "make bash tiff-utils"
Do we really need 'make ' to run the tests?
I don't see where you call that in run-ptest.

Is bash really a requirement or can we just use whatever POSIX compliant=20
shell in installed ?



As embedded devs, we wince when we see bash being pulled in needlessly. ;=
-)

Can you check if any scripts that have: #!/bin/bash=C2=A0 pass shellcheck=
:
https://www.shellcheck.net/
and if so, try running them with just /bin/sh

If that works, you should send a patch / PR to libtiff upstream .

This is good work but it can wait until you hear back from upstream for=20
a v2.
Ideally, any patches would have an upstream status of Backport or at=20
least submitted.

> +
> +# The compiled C test programs embed build paths in debug info; this i=
s
> +# expected for ptest binaries and not relevant to the shipped library.
> +INSANE_SKIP:${PN}-ptest +=3D "buildpaths"

oe-core.git on master
=E2=9D=AF rg INSANE_SKIP.*ptest | wc -l
10

so this is not the preferred solution.

Some fixes for such insanity will be in the list below:

oe-core.git on master

=E2=9D=AF git log -22 --oneline -G"^INSANE_SKIP.*-ptest"=C2=A0 | rg -v ad=
d
a09c0fa79c lttng-tools: Upgrade 2.13.15 -> 2.14.0
8fc31fb235 valgrind: disable ptests
0a6821ca4a gettext: Drop ptest INSANE_SKIPs
e7f221bafb m4: Drop ptest INSANE_SKIPs
df1e2e5bbf python3-packaging: enable ptest
5beb30cdf3 python3-cffi: enable ptest
dc5cd169e8 nettle: rewrite ptest integration
7870364e48 glide: remove as 'go mod' has become standard
cfecef4e69 dbus-test: merge into main dbus recipe
41ecc76c7f elfutils: Fix ptest dependencies
42344347be Convert to new override syntax
3ebfc4fc4e elfutils: silence a new QA warning
7c22dc2e34 libmodule-build-perl: upgrade 0.4229 -> 0.4231
099a2a212f go.bbclass: separate the ptest logic to go-ptest class
e5b8f83d29 go: Remove INSANE_SKIP_* textrel that are now handled in=20
go.bbclass
7d84075830 valgrind: Include debugging symbols in ptests
524fcf3412 nettle: fix ptest failure


See if you can eliminate the embedded build paths. There are likely=20
examples of that in git history as well.
Ask for help if you get stuck.

Good work, v2 in a few weeks please.

--=20
# Randy MacLeod
# Wind River Linux

--------------Ci7DY2nKrk0lkmG9XzrYaJan
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 68FJGlae3530792

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <head>

   =20
  </head>
  <body>
    <div class=3D"moz-cite-prefix">Hi Himani,</div>
    <div class=3D"moz-cite-prefix"><br>
      I'll review this before Ross Burton gets to it ! ;-)<br>
      <br>
      On 2026-09-15 03:36, Himani Ramesh Barde wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20260915073620.2271352-1-Himani=
Ramesh.Barde@windriver.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">Enable ptest for tiff (libti=
ff), running the upstream test suite shipped
in the source test/ directory: the C unit-test programs (check_PROGRAMS)
plus the shell-script tests that exercise the tiff command-line tools.

do_compile_ptest builds the test programs via &quot;make check TESTS=3D&q=
uot; (build
only, no run). do_install_ptest installs the compiled test binaries (real
ELF from test/.libs, static testtypes from test/), the shell test scripts=
,
the shared common.sh helper, and the images/refs data. common.sh is
adjusted so the scripts find the installed tiff tools in ${bindir} rather
than the build tree's ../tools, and run-ptest recreates the SOURCE_DIR
path that test_ifd_loop_detection was compiled with so its images resolve
on target.

The run-ptest wrapper emits automake-style PASS/FAIL/SKIP results and
skips the JBIG test (JBIG is not in the default PACKAGECONFIG) and the
thumbnail test (the thumbnail tool is not built by default).

The recipe is registered in ptest-packagelists.inc (PTESTS_SLOW), and</pr=
e>
    </blockquote>
    <br>
    What was the execution time that determined that you would add this
    to slow.<br>
    <br>
    <blockquote type=3D"cite" cite=3D"mid:20260915073620.2271352-1-Himani=
Ramesh.Barde@windriver.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">
buildpaths QA is skipped for the -ptest package since the compiled test
binaries legitimately embed build paths.</pre>
    </blockquote>
    <br>
    Well, maybe not legitimately but we haven't yet demanded that the
    ptest code be reproducbile AFAIK.<br>
    <br>
    <blockquote type=3D"cite" cite=3D"mid:20260915073620.2271352-1-Himani=
Ramesh.Barde@windriver.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

Validated on qemux86-64: all C tests and shell tests pass, 2 skipped
(jbig, thumbnail), 0 failed.</pre>
    </blockquote>
    <br>
    Why were 2 skipped ?<br>
    Specify how many tests were run for those curious and since you have
    that data on hand.<br>
    <br>
    <blockquote type=3D"cite" cite=3D"mid:20260915073620.2271352-1-Himani=
Ramesh.Barde@windriver.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

Signed-off-by: Himani Ramesh Barde <a class=3D"moz-txt-link-rfc2396E" hre=
f=3D"mailto:HimaniRamesh.Barde@windriver.com">&lt;HimaniRamesh.Barde@wind=
river.com&gt;</a>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../recipes-multimedia/libtiff/tiff/run-ptest | 31 ++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.7.2.bb | 42 ++++++++++++++++++-
 3 files changed, 73 insertions(+), 1 deletion(-)
 create mode 100755 meta/recipes-multimedia/libtiff/tiff/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/=
distro/include/ptest-packagelists.inc
index 2b5d665..837e1c1 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -151,6 +151,7 @@ PTESTS_SLOW =3D &quot;\
     tar \
     tcl \
     tcl8 \
+    tiff \
     util-linux \
     zstd \
 &quot;
diff --git a/meta/recipes-multimedia/libtiff/tiff/run-ptest b/meta/recipe=
s-multimedia/libtiff/tiff/run-ptest
new file mode 100755
index 0000000..40301ed
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/run-ptest
@@ -0,0 +1,31 @@
+#!/bin/sh
+# Run the libtiff test suite and emit ptest-style PASS/FAIL/SKIP lines.
+cd &quot;$(dirname &quot;$0&quot;)/test&quot; || exit 1
+
+# test_ifd_loop_detection is built with -DSOURCE_DIR=3D&quot;@SOURCE_DIR=
@&quot; and opens
+# its images via that relative path; symlink it to the installed test di=
r.
+if [ ! -e &quot;@SOURCE_DIR@&quot; ]; then
+    mkdir -p &quot;$(dirname @SOURCE_DIR@)&quot;
+    ln -sf &quot;$(pwd)&quot; &quot;@SOURCE_DIR@&quot; 2&gt;/dev/null ||=
 true
+fi
+
+CPROGS=3D&quot;ascii_tag long_tag short_tag strip_rw rewrite custom_dir =
\
+custom_dir_EXIF_231 defer_strile_loading defer_strile_writing test_direc=
tory \
+test_IFD_enlargement test_open_options test_append_to_strip \
+test_ifd_loop_detection testtypes test_signed_tags raw_decode&quot;</pre=
>
    </blockquote>
    <br>
    Ross will likely have more to say here but my take is:<br>
    <br>
    +1 point for using a list in run-ptest and iterating over it.<br>
    -1 point since this list is also in the recipe.&nbsp;<br>
    <br>
    There's likely a way to have the list live in the RECIPE ONLY and&nbs=
p;<br>
    then generate or fill-in the run-ptest script at build time.<br>
    <br>
    Gemini suggested this:<br>
    <br>
    <pre _ngcontent-ng-c3243601800=3D"" class=3D"ng-tns-c3243601800-22"><=
code _ngcontent-ng-c3243601800=3D"" role=3D"text" data-test-id=3D"code-co=
ntent" class=3D"code-container formatted ng-tns-c3243601800-22">PTEST_APP=
S =3D &quot;app1 app2 app3&quot;

SRC_URI +=3D <a class=3D"moz-txt-link-rfc2396E" href=3D"file://run-ptest"=
>&quot;file://run-ptest&quot;</a>

inherit ptest

do_install_ptest() {
    install -m 0755 ${UNPACKDIR}/run-ptest ${D}${PTEST_PATH}/run-ptest
   =20
    # Replace the placeholder with the BitBake variable contents
    sed -i -e 's/@PTEST_APPS@/${PTEST_APPS}/g' ${D}${PTEST_PATH}/run-ptes=
t
}
</code></pre>
    <br>
    There may be better ways.<br>
    <br>
    <blockquote type=3D"cite" cite=3D"mid:20260915073620.2271352-1-Himani=
Ramesh.Barde@windriver.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">
+
+for t in $CPROGS; do
+    if [ -x &quot;./$t&quot; ]; then
+        if ./&quot;$t&quot; &gt;/dev/null 2&gt;&amp;1; then echo &quot;P=
ASS: $t&quot;; else echo &quot;FAIL: $t&quot;; fi
+    fi
+done
+
+for t in *.sh; do
+    [ &quot;$t&quot; =3D &quot;common.sh&quot; ] &amp;&amp; continue
+    case &quot;$t&quot; in
+        *jbig*) echo &quot;SKIP: $t (JBIG support not enabled)&quot;; co=
ntinue ;;
+        tiffcp-thumbnail.sh)
+            command -v thumbnail &gt;/dev/null 2&gt;&amp;1 || { echo &qu=
ot;SKIP: $t (thumbnail tool not built)&quot;; continue; } ;;
+    esac
+    if sh &quot;./$t&quot; &gt;/dev/null 2&gt;&amp;1; then echo &quot;PA=
SS: $t&quot;; else echo &quot;FAIL: $t&quot;; fi
+done
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb b/meta/recipes=
-multimedia/libtiff/tiff_4.7.2.bb
index 8bc3a48..ea4300b 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM =3D <a class=3D"moz-txt-link-rfc2396E" h=
ref=3D"file://LICENSE.md;md5=3D4ab490c3088a0acff254eb2f8c577547">&quot;fi=
le://LICENSE.md;md5=3D4ab490c3088a0acff254eb2f8c577547&quot;</a>
 CVE_PRODUCT =3D &quot;libtiff&quot;
=20
 SRC_URI =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"http://download.o=
sgeo.org/libtiff/tiff-${PV}.tar.gz\+file://run-ptest\">&quot;http://downl=
oad.osgeo.org/libtiff/tiff-${PV}.tar.gz \
+           file://run-ptest \
 	   &quot;</a>
=20
 SRC_URI[sha256sum] =3D &quot;672bd7d10aee4606171afb864f3570b83340f6a33e2=
c186dc0512f7145ffdf6a&quot;
@@ -23,7 +24,7 @@ CVE_STATUS[CVE-2023-6277] =3D &quot;fixed-version: Fixe=
d since 4.7.0, NVD tracks this a
 CVE_STATUS[CVE-2025-8851] =3D &quot;fixed-version: Fixed since 4.7.0, NV=
D tracks this as fixed in 2024-08-11 vulnerability&quot;
 CVE_STATUS[CVE-2026-4775] =3D &quot;fixed-version: Fixed since 4.7.2, NV=
D tracks this as version-less vulnerability&quot;
=20
-inherit autotools multilib_header
+inherit autotools multilib_header ptest
=20
 CACHED_CONFIGUREVARS =3D &quot;ax_cv_check_gl_libgl=3Dno&quot;
=20
@@ -64,3 +65,42 @@ do_install:append() {
 }
=20
 BBCLASSEXTEND =3D &quot;native nativesdk&quot;
+
+do_compile_ptest() {
+    oe_runmake -C ${B}/test check TESTS=3D&quot;&quot;
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/test
+    # Compiled C unit-test programs. libtool leaves a wrapper script in =
test/
+    # and the real ELF binary in test/.libs/; testtypes is static and li=
ves
+    # only in test/.
+    for prog in ascii_tag long_tag short_tag strip_rw rewrite custom_dir=
 \
+                custom_dir_EXIF_231 defer_strile_loading defer_strile_wr=
iting \
+                test_directory test_IFD_enlargement test_open_options \
+                test_append_to_strip test_ifd_loop_detection testtypes \
+                test_signed_tags raw_decode; do
+        if [ -e ${B}/test/.libs/$prog ]; then
+            install -m 0755 ${B}/test/.libs/$prog ${D}${PTEST_PATH}/test=
/
+        else
+            install -m 0755 ${B}/test/$prog ${D}${PTEST_PATH}/test/
+        fi
+    done
+    # Shell test scripts and the shared helper
+    install ${S}/test/*.sh ${D}${PTEST_PATH}/test/
+    install ${S}/test/common.sh ${D}${PTEST_PATH}/test/
+    # Point the test scripts at the installed tiff tools instead of ../t=
ools
+    sed -i -e &quot;s|^TOOLS=3D.*|TOOLS=3D${bindir}|&quot; ${D}${PTEST_P=
ATH}/test/common.sh
+    # test_ifd_loop_detection embeds -DSOURCE_DIR=3D../../tiff-${PV}/tes=
t; fill
+    # that path into run-ptest so it can be symlinked to the installed t=
ests.
+    sed -i -e <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:s|@SOURC=
E_DIR@|../../tiff-${PV}/test|g">&quot;s|@SOURCE_DIR@|../../tiff-${PV}/tes=
t|g&quot;</a> ${D}${PTEST_PATH}/run-ptest
+    # Input images and reference outputs
+    cp -r ${S}/test/images ${D}${PTEST_PATH}/test/
+    cp -r ${S}/test/refs ${D}${PTEST_PATH}/test/
+}
+
+RDEPENDS:${PN}-ptest +=3D &quot;make bash tiff-utils&quot;</pre>
    </blockquote>
    Do we really need 'make ' to run the tests?&nbsp;<br>
    I don't see where you call that in run-ptest.<br>
    <br>
    Is bash really a requirement or can we just use whatever POSIX
    compliant shell in installed ?<br>
    <br>
    <br>
    <br>
    As embedded devs, we wince when we see bash being pulled in
    needlessly. ;-)<br>
    <br>
    Can you check if any scripts that have: #!/bin/bash&nbsp; pass
    shellcheck:&nbsp;<br>
    &nbsp; &nbsp;<a class=3D"moz-txt-link-freetext" href=3D"https://www.s=
hellcheck.net/">https://www.shellcheck.net/</a><br>
    and if so, try running them with just /bin/sh<br>
    <br>
    If that works, you should send a patch / PR to libtiff upstream .<br>
    <br>
    This is good work but it can wait until you hear back from upstream
    for a v2.<br>
    Ideally, any patches would have an upstream status of Backport or at
    least submitted.<br>
    <br>
    <blockquote type=3D"cite" cite=3D"mid:20260915073620.2271352-1-Himani=
Ramesh.Barde@windriver.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">
+
+# The compiled C test programs embed build paths in debug info; this is
+# expected for ptest binaries and not relevant to the shipped library.
+INSANE_SKIP:${PN}-ptest +=3D &quot;buildpaths&quot;
</pre>
    </blockquote>
    <p>oe-core.git on master<br>
      =E2=9D=AF rg INSANE_SKIP.*ptest | wc -l<br>
      10<br>
      <br>
      so this is not the preferred solution.<br>
      <br>
      Some fixes for such insanity will be in the list below:<br>
      <br>
      oe-core.git on master&nbsp;<br>
      <br>
      =E2=9D=AF git log -22 --oneline -G&quot;^INSANE_SKIP.*-ptest&quot;&=
nbsp; | rg -v add<br>
      a09c0fa79c lttng-tools: Upgrade 2.13.15 -&gt; 2.14.0<br>
      8fc31fb235 valgrind: disable ptests<br>
      0a6821ca4a gettext: Drop ptest INSANE_SKIPs<br>
      e7f221bafb m4: Drop ptest INSANE_SKIPs<br>
      df1e2e5bbf python3-packaging: enable ptest<br>
      5beb30cdf3 python3-cffi: enable ptest<br>
      dc5cd169e8 nettle: rewrite ptest integration<br>
      7870364e48 glide: remove as 'go mod' has become standard<br>
      cfecef4e69 dbus-test: merge into main dbus recipe<br>
      41ecc76c7f elfutils: Fix ptest dependencies<br>
      42344347be Convert to new override syntax<br>
      3ebfc4fc4e elfutils: silence a new QA warning<br>
      7c22dc2e34 libmodule-build-perl: upgrade 0.4229 -&gt; 0.4231<br>
      099a2a212f go.bbclass: separate the ptest logic to go-ptest class<b=
r>
      e5b8f83d29 go: Remove INSANE_SKIP_* textrel that are now handled
      in go.bbclass<br>
      7d84075830 valgrind: Include debugging symbols in ptests<br>
      524fcf3412 nettle: fix ptest failure<br>
      <br>
      <br>
      See if you can eliminate the embedded build paths. There are
      likely examples of that in git history as well.<br>
      Ask for help if you get stuck.<br>
      <br>
      Good work, v2 in a few weeks please.</p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------Ci7DY2nKrk0lkmG9XzrYaJan--

