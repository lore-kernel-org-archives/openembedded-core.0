Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF098CF9C6B
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 04:24:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.6232.1727151872177565656
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Sep 2024 21:24:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=99979d78d4=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48O4OPpq001769
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 04:24:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41um6hg3q6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 04:24:31 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 48O4OUfW001929;
	Tue, 24 Sep 2024 04:24:30 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41um6hg3q4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 04:24:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mp3EMDqt0zmr6b46KCbAhv1jFH9iWfIg6CG8eTFYQChEnGuiI0i6gWMJ2nSkwcW42hcqUtOrPayyhpZtKkvpDnWDJDfa92GtprHHY/6TeoA1yKvGd5aRzjsadEuQRh0SNMGPSOM1vNYyZn0I8rH0ESAE1PqU43p0108E2yPOtnxXnIISnE48QGomK37shIh1LoRnpa+HybOVbDwmZlgtJ9nIx64tInuhnVYjqdDq4QjTJohy6NU8FqGYmyPtSppTmAiuGcoIyS1lpPo3gvQRPxzlhpe5Pa8c7VgYdDVBGcZXevPoBo612cDDFgDb/9AdR9ysOh4IkvRQ7rnwLHsdNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5/xUFUBYvPEFVsuWtaq/KVm5RufDkHA31Dsp0aD7vJg=;
 b=dZlcIA8+HAJ9Xx/7eK4/Oz+34UDDVDcueuZVAOZ8dpnYN7yQ/6cQB+h4h0ERn5020+zjJd4TnQoMqxYCSpbe7Sd5ej4TXdmh9yedZXsrp1kkEaN3FodOJxoz5v7eXWR/bjr+WySr44+8u448dxjc9uZvq5WeIc8yOsCB0OVssbPDoKC08+GzeMz/5NxWT5csQO1JARdOmdl5pxijZM5+uFFS1dsu+GpI7324fpOA/7YV77PRDldvfq8bqS8XvU81Hv2bJYEdRwM0Bfcuu+ITaGolrhL6MYUg7HnP8tLjztPqZzXZFLsForU97LEyF23pfO/36+245zXFUWd2AsBPGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by LV8PR11MB8584.namprd11.prod.outlook.com (2603:10b6:408:1f0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Tue, 24 Sep
 2024 04:24:27 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%4]) with mapi id 15.20.7982.022; Tue, 24 Sep 2024
 04:24:27 +0000
Message-ID: <0738ba86-15be-4c53-a8a3-624c65eef18e@windriver.com>
Date: Tue, 24 Sep 2024 12:24:19 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 0/2] proposal: Append VENDOR_REVISION to PR for
 CVE scanners
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, david.reyna@windriver.com
References: <cover.1726821150.git.liezhi.yang@windriver.com>
 <CANNYZj9SyrR1TMWY3ehfbT+-rrDQqfKVSiN-thQQBoVwXK+uxQ@mail.gmail.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <CANNYZj9SyrR1TMWY3ehfbT+-rrDQqfKVSiN-thQQBoVwXK+uxQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCPR01CA0019.jpnprd01.prod.outlook.com (2603:1096:405::31)
 To LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|LV8PR11MB8584:EE_
X-MS-Office365-Filtering-Correlation-Id: f8941e37-ac6c-446f-55e6-08dcdc50c6de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|1800799024|376014|366016|3613699012;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?c1NsT0FubE43TFRCejVzdEk2U0l2NFRBTkdXc3RKbWgvWTJtcHhHUTRsb1lX?=
 =?utf-8?B?cXhsOTl2RWNPN1YvZGtYQmNhWnJLRVFZTzZtdVdQNGtGa1ZydmtIM3JTbE03?=
 =?utf-8?B?NjdhdzdkT2FEeFRUUUw5VFNFd3hvVTJaQ056MlB2akxab1N4V2xIR3ZiZVY2?=
 =?utf-8?B?ZUo5dnIvUVNHQ1pINkVVNHhJeTNUZms4SHdNR0VJYVI3VGIzcDI2ZDdYMHls?=
 =?utf-8?B?Sk5TL21RSGIxaE92bUtuSEdyK1B5RWgyTGpmbGQ4OVdJU2NlUHEvSkQwMFQ3?=
 =?utf-8?B?ZE50SmNha3hicnB2WUVVZXkzQkMyR3hLZmk0bk4yeHRBQkprUVRxbW9OZHBo?=
 =?utf-8?B?R05rSW8yMFpaYlRrWDYwMWZPK3hJc1BaWnF4Q3pialpJL1pPMyszNTkwS0tO?=
 =?utf-8?B?YmlpV1hyN2grdGtEN24zMGxvWUszWlJSbm90eFZZck5NNGgyS2MvR2djaG9Z?=
 =?utf-8?B?aWhiRVpkSzNmRGtSeXk4bDFSODNXRjA0RzNuQmVmM1R4S0RBM2NuRWVkcWVG?=
 =?utf-8?B?MTZFaDFLeUlHWXBqZEhwQmRSUmZ3cFJqdCtva09yWGRWdkZWTnAyTjdkM1Vp?=
 =?utf-8?B?TFdSL0orVUF6QXZoVjFYbVpYNzRoNnRkakZUU3ZYTjVvVFQzOTZlbEcra1dT?=
 =?utf-8?B?WFVuRmNLM0U1bytGcXNqdmIzbGpCemFXOFJCaXo3ZEJhNXBxeEcvckhMUitK?=
 =?utf-8?B?YnM1R2ZUZHpwMncrSUVVTHY0bHBISjYyQkwyZURVaThpRzltb3BDNE51bUtO?=
 =?utf-8?B?UTZJemhlTTg1QzZ0ZDF2dU5YS2wyR0lmbVlObWZNRG5EUHRsTEpSUlVmY0JK?=
 =?utf-8?B?b0JkNnlORitmdXljTkU0bDkyRnVwcStmaVpmODVxTlFyaEFwVTJ2UHRuMklL?=
 =?utf-8?B?Unp2S0VpeVdJZmtFQkw1V3BaV3hSYktFUnJ5eDRYd3dQcmRrUlBHU3Z2amFZ?=
 =?utf-8?B?dWFWTE9WTXpCeDdQNytJRURscmJYNVRFZVl5MjZoV3ZZMUx4N1hxUDhvaUFG?=
 =?utf-8?B?cUFrc24ydGY3YVk1RGZnamV3NEVHTWd2QldZTUhNaDdxQU5VSG1EWnVtVnR1?=
 =?utf-8?B?YSs4NGpYWEtsaGt0VXg0djJHblU1Z0F5ckNPcHlDa0k0eDhaSi9UZEFrVi9j?=
 =?utf-8?B?UmluSGR1NUlTandTSi8rckluL3Z3QUlqRm1LVk05d2YrenlkMnQ1MnNhVnpq?=
 =?utf-8?B?Y3lrRXF0S0I3b3JXQUdVM25aQ05SVEZvb2J3QzhhZEJ5dGUyUGJ3TnVtalVw?=
 =?utf-8?B?WTUwNUdqcmhSaG5FNmVrNnUvVFhLb1V6QTNiZEtNSk9NbUJ5aXFOWUxBT0tv?=
 =?utf-8?B?UGw1b0RrNWxDN3JGcllVZ0J0d0lMKytldjA1eHVHOUx6TytiT0JZbjZDM3h2?=
 =?utf-8?B?SGdyb3VMWGl4aGllNm5SaUFzSkc4a0d1MWhRSnNaQ05YZWlRbWxvNlVxTjFr?=
 =?utf-8?B?YllNU083dDZYSGFTVGJQQjhTZWxicWVTdFRGandRS0FCTDQ1b3QzQUJxVXp6?=
 =?utf-8?B?TnhLODhLQ3Qwd1ZRUGhUZk12SXRXNGR5d00wRUhhcnVBOFRmRjVHZnB0Lzli?=
 =?utf-8?B?QW5tMS9Hak95VExJK3cvTFk5T0hWWXcyQzVkQmUvWDdZMHpRYXpaQ3lMTWw4?=
 =?utf-8?B?OU9nTWRxVE85UzNFS01oMU5TNUhoOWtKVEl0RnpVSHFGRnB4K2J0OTNWazRN?=
 =?utf-8?B?ZTV3dXl1R3l1NGRwZzNUeElWOEtUamFFdmovZFNGeWJ1NTFyVjRVYjFsWEVO?=
 =?utf-8?B?NE01dUl1T2lqRFhqS1FudUpGRFFJQVFFQmw0OW5kWVV0Ykd3djBmbkhkVWdQ?=
 =?utf-8?Q?oOJ1dOYS0/Dhdn1rujmqJdHGC+okqEYCgTTAI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(376014)(366016)(3613699012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SERnTy9QWC9mZ1ZJQU1PY1FWREdZRExxTWFKMy9OU2F2YTJVRTh0SkUvcjNq?=
 =?utf-8?B?SUtVb01YR3R2Tkp3R2F2K3BHclpKNU9oUTVIVzBveUJ2T2NBOHY1OWdmYkZN?=
 =?utf-8?B?WFJQYlE0RSsyUEk4cGNCS3pvYU95dkRQbjZkMktuRTJOMWQwNnNkY1YxVjBZ?=
 =?utf-8?B?VmRlZGszajVRR3ZPNmpiSnI5K29kdnc4Sm0zUC9oSmRlZGJSMW9NZHRJbGkr?=
 =?utf-8?B?N1Y3dUs3b2tGaUUrQlhsZFpqMXpoVkpLTGFRTzV2RjJZVFJpQ3lqRUgyaDdj?=
 =?utf-8?B?TUZIQnZVWDZuRVcwNG80TENmQlJKMmlDNFNQYWI3QjNncDFtQVVjQ2QrTERy?=
 =?utf-8?B?TVdBcnJaRCtSK2M1Q0RXN1l4RDMxcGtYV0FEdm5haEpaZFZaU3FrTFpSL0oy?=
 =?utf-8?B?Z3E2ODNGdW1LNW5UbG1xNGVCQU5EK2lrVlY4MjM4MDBjdU9jMWdHZCtOZVFS?=
 =?utf-8?B?VzJRN20vUEg4STdGdUpyR1gzYUQvVUtNVklDbWhXeXNvSzREZU0wTzFzV3lY?=
 =?utf-8?B?aUpxcUJteUdYc3JZdlFhOTBYN1RUcStFaUJSSFBHdGNyL2F3THdPZFZwSFNN?=
 =?utf-8?B?emEzZjBHbVpaeWJaVEhMS2lWQU9RVGs1NmoyR0E4ZVNOSG1mTlFvVWx0SmZC?=
 =?utf-8?B?ekluTVJDOFZlTWtZa2lNZ2gvSmRNbmZJeUtjU2FBKzlUVVA2eHNqYUtIdkpS?=
 =?utf-8?B?VFJMdm4yZEYxbThVbXZRTkNXK1FHNXFrTjdiQjhuR2kyaXExZHdDMkFzVnlu?=
 =?utf-8?B?WVR3N0JXSkdrZ3RCUnNibnlFa2RIOTc3dXhNNEtObDZoRkNOcDZlYVA3eXJB?=
 =?utf-8?B?U3RIeHhHR0FXMXJ5dEx4VXQ3K3VKK0hCZUlPNGQzUlJKL1BZZy9WK3J3SzVq?=
 =?utf-8?B?M05Xdk1pbndLVmhNQkRxQWloTnM4OVN5bWJSL0dhenhwOEVydTR1bmplSVFW?=
 =?utf-8?B?M0RnZ1M1MXRwYjZWdFN4a1BNbGhSd1IrVHNZNEI1MGorejRrdXY5T1ZFK2l3?=
 =?utf-8?B?WDN0VlcwTVloZVpKL3ltQ2VPODJhejhBZjF1SUp2N3FGTjk5OWRaRklhUHZq?=
 =?utf-8?B?MWlKT3JoNFgzZFliQStsV1NqQzJQNElGbWxaSlNyRmhlV0szZU5sdTFFSUFE?=
 =?utf-8?B?SjlHdkJscGpnY0VxWHlYdm5mWHpzN0J6aWthaHBNeS9oZXFLVjlXUXNGbS9i?=
 =?utf-8?B?eEphRmlZbUpNNVRFRnlsZU1MZFdwOC9jaEhzSnhWc0RJeGVzdTR0VGdhLzZ0?=
 =?utf-8?B?bGtrRThYVXhJRHVDcHp0dUNrMVlwVkVpcXo3S2svRm9mS0hxMWEwMGpZOEUz?=
 =?utf-8?B?NDErY25mTEl3cmNQSUpNVlp4WUhTektCd2krMUVJQmgxMGhYNWdOYUQxanly?=
 =?utf-8?B?UUtYemVUYUZaN1ltOVNoQWRBTnBKQ25yWDAzV0IyNmdyU1JyRFoyZCsxWVRK?=
 =?utf-8?B?U2F0aE5icFpPRmM5b1ovL24rdGxvZTF2bVBoM2F4dnh0STFzaHZXaUU2Sktm?=
 =?utf-8?B?eThrREdDWGNqZ1FaM0xtUlVmK2NKSlZTTmxxWms4MlhnUkUzcGwwc1ZIVWtP?=
 =?utf-8?B?b2N0d25FY21VYVlCeW5rNGh6WnJiZURpRFVJYTNDZ1RYTVd1ZVU0YWVXelVu?=
 =?utf-8?B?NjRCbVk1T0lWWnl3L3VxS20wUkNqM0hNalhSQUNqOVFhMXZGLzJjSGJNM05E?=
 =?utf-8?B?ZklGOXJzNnVOQTQvdG0rbDhpNG5RcEhqc3pwbEJJOWtESG5iZ1Z1RUhWMVV3?=
 =?utf-8?B?WnlJTm5sT252ZVlqenFmbkVBTVVkMEs3aWtwN1pURVJQeEZGVCs3TzJhWFpQ?=
 =?utf-8?B?c1hsYk43SThDNmdDcFk4MWovQm1XOG9NUXdCYzIzMEVsTW04YmZudXA5YXpY?=
 =?utf-8?B?cCtMYzYzQ3Nzb2hvY1FmcWx5SlFzc0JpZS9hWFVGc3Y0Y2psTU1JNno4NUVC?=
 =?utf-8?B?UUtqL2FlaE4xL2NZWjJWN053dUUvRUhUZUhmZGtxVnVnNCtkOHgyVnlGZjZZ?=
 =?utf-8?B?eW1DdGRZcklIckprOEluRUpDSks2NVMrL1JleVZLc0JSNDVDSW1ybDhTakpH?=
 =?utf-8?B?RmJnemhXZTAreGx6S3hGQkVNSWdKUGFhelNQdDdXVExWeGc3cWlXSHRKYTNK?=
 =?utf-8?B?Z3FBN3Z5WGZhUFA4YytSRzBBRE85QU0xTkFKRmZsMjZSaHZKNVBqRklXN0pv?=
 =?utf-8?B?ZlE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8941e37-ac6c-446f-55e6-08dcdc50c6de
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 04:24:27.2327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hK3HWgVH5Y8dIzmiFzg7/UXnFs+2QUBaAhBHVNYHgsW4fTcLpHzjGIwWu4K8TyiYpiIcHstT58BfUmfdHGJc/Ynp5e4a9bzBUHWJSQPJ3gA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8584
X-Proofpoint-ORIG-GUID: Zt27iS3uyrCoS5kDA-ztlpmknGQ4uf0x
X-Authority-Analysis: v=2.4 cv=bas5U/PB c=1 sm=1 tr=0 ts=66f23eff cx=c_pps a=pa2+2WWV+ihErLhOOf7pAQ==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=uxSsLqcG66RPRh6GbEUA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: FP8ixiwri0G6Thm8HR05dGU15LyqbTy-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-23_19,2024-09-23_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 spamscore=0 phishscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2408220000 definitions=main-2409240028
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 04:24:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204832

Hi Alexander,

On 9/24/24 01:19, Alexander Kanavin wrote:
> I don't understand. If we fix a CVE with a backport, then there's
> metadata in the backported patch to indicate that even though the
> overall version doesn't change to the one that isn't vulnerable, the
> patch addresses the vulnerability. Why is a whole separate mechanism
> still needed?

Thanks for looking into this, the problem is that the metadata (CVE patch info)
is not in the binary packages such as RPMs, so the cve scanners such as Trivy
doesn't know that. For example, CentOS and Ubuntu also has the similar issues,
they use the vendor revisions such as 29.el6.centos and 0.4ubuntu3.3 to help
Trivy know that the CVE is fixed in a lower version package.

// Robert

> 
> Alex
> 
> On Fri, 20 Sept 2024 at 10:53, Robert Yang via lists.openembedded.org
> <liezhi.yang=windriver.com@lists.openembedded.org> wrote:
>>
>> From: Robert Yang <liezhi.yang@windriver.com>
>>
>> The VENDOR_REVISION is for cve scanners to know the CVEs have been fixed in a
>> lower version, CVE scanners such as Trivy can know the CVEs have been fixed in
>> a higher version, but it can't know the CVE is fixed in a lower version without
>> a helper, we have the following ways to set the helper:
>> 1) Use PR server
>>     This doesn't work since the server updates PR for any changes.
>>
>> 2) Update PR manually when add a CVE patch
>>     This is doesn't work either since:
>>     - This is very trivial and people may forget to update the PR
>>     - The PR may be updated for other reasons except CVE patches
>>
>> So we need a specific part such as VENDOR_REVISION for cve scanners.
>> The VENDOR_REVISION is designed as part of PR:
>>    PR:append = ".vr51"
>> - ".vr51": The VENDOR_REVISION
>> - "vr": Vendor Revision, can be set to other values such as oe or poky
>> - "51": Convert from DISTRO_VERSION (Yocto 5.1), it can be customized with
>>          a function defined in GET_CURRENT_VENDOR_REVISION.
>> - The VENDOR_REVISION will only append to the recipes which have patches
>>
>> There are two bbclasses to manage the VENDOR_REVISION automatically:
>> - gen-vendor-revision.bbclass: This is used for generating VENDOR_REVISION
>>    automatically, and save all the recipes' VENDOR_REVISION in
>>    vendor-revision.conf, it is like:
>>    VENDOR_REVISION[meta_recipes-support_libssh2_libssh2_1.11.0.bb] ??= '${VENDOR_REVISION_PREFIX}51 \
>>     CVE-2023-48795:CVE-2023-48795.patch:b6c68cd1f0631180914ff112ac0c29c4 \
>>     notcve:0001-disable-DSA-by-default.patch:61b6368d4a969d187805393d8b8fee85'
>>
>>    And in the second release such as Yocto 5.1.1, the bbclass will update the
>>    vr51 to vr511 when both of the following 2 conditions are met:
>>    - The DISTRO VERSION is updated, for example, from 5.1 to 5.1.1
>>    - The recipe's patches are changed (Patches added, removed or updated),
>>      otherwise, it will still be "51" when Yocto updated to 5.1.1, this can avoid
>>      unnecessary PR bump.
>>
>> - enable-vendor-revision.bbclass: Append VENDOR_REVISION to PR
>>    After the VR is appended, the rpm package is like:
>>    openssl-3.3.1-r0.vr51.core2_64.rpm
>>
>>    There is no change if the recipe doesn't have patches, for example:
>>    base-files-3.0.14-r0.qemux86_64.rpm
>>
>> Check the comments in the header of gen-vendor-revision.bbclass for more details.
>>
>> // Robert
>>
>> The following changes since commit 161c5b311f1aeb8f254dca96331b31d5b67fc92d:
>>
>>    build-appliance-image: Update to master head revision (2024-09-17 12:31:45 +0100)
>>
>> are available in the Git repository at:
>>
>>    https://github.com/robertlinux/yocto rbt/vr
>>    https://github.com/robertlinux/yocto/tree/rbt/vr
>>
>> Robert Yang (2):
>>    enable-vendor-revision.bbclass: Add it to append VENDOR_REVISION to PR
>>    gen-vendor-revision.bbclass: Add it to update VENDOR_REVISION
>>      automatically
>>
>>   .../enable-vendor-revision.bbclass            | 125 +++++++++
>>   .../gen-vendor-revision.bbclass               | 243 ++++++++++++++++++
>>   2 files changed, 368 insertions(+)
>>   create mode 100644 meta/classes-global/enable-vendor-revision.bbclass
>>   create mode 100644 meta/classes-global/gen-vendor-revision.bbclass
>>
>> --
>> 2.25.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#204726): https://lists.openembedded.org/g/openembedded-core/message/204726
>> Mute This Topic: https://lists.openembedded.org/mt/108555445/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

