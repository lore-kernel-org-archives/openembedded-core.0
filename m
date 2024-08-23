Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA85AC531DF
	for <webhook@archiver.kernel.org>; Fri, 23 Aug 2024 00:57:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6625.1724374621012867615
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 17:57:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8965975543=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47N0fVRS026506
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 00:57:00 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 412ju6x005-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 00:56:59 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47N0uxWP015628;
	Fri, 23 Aug 2024 00:56:59 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2047.outbound.protection.outlook.com [104.47.55.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 412ju6x004-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Aug 2024 00:56:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xHhPf6lBuYPUiaC14gWLxWBMSqO6ZKw9aJa6CgADKx+lfHc+45wjyLvqYqsslOqstp393AdiuLg4NI3WZhjSp3ZJwJUxo4uOhT4De+jW6+KlVfCEvlo6PO0dYFRSJ4AhfGpmE7Xd3jcBCtGJtjNc0BsPGKm5yQnSAxHjZYSFphxpGnwBrs072Dh/GlQ5ZEK3o66Z4Gh6CABhtg/Gp3zl+GGNY/N0qXtZ3la36ChuGZqmTBXH8rX8y7TasmUyT/+CgwO1JVOQBtBqH9wvRPGVXt1cNPjWVXRLty/MUdE1VeS0Evsi0dYeKuhzoQG8agzBBZt87FwzD/I3+jEyhv859w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tezvth1Z2JHTE6DYc7ZrBe3luFtLXCtC4m14vo2b1fA=;
 b=eS77LeiD/XUbUkp+sqafT7M+iiiJ7vBIFNfzrAOhDjNKES29yPWE3YZ65y1nl0NsAmGFneKlpaww2E7lbyXJF6ZKFvVAP3RvpTJAsUl9XRx6P0chvOQvUH4EZ3SkH7A2CnKAG4gN6Y82wa8HVJWVMG1hIcw9i3fF6Ks1xxW/eadUDEUJ7T+vSvN5XbTPgg9GGCw+Y1iEqInCkEU/b3Qdtf2YcwNUtSAc0DRlaCDR6tBL+SUh7mESxT3o5lEf0uHUI00HaycAxnYBOhNtLbLgfpSA63Q0dQzO+XbLb+hQSf/wjawCaEhQraSTLSdchuwv1Thq2Gu1MLqxtsIZFfAfKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by IA1PR11MB8151.namprd11.prod.outlook.com (2603:10b6:208:44d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Fri, 23 Aug
 2024 00:56:53 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%6]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 00:56:53 +0000
Content-Type: multipart/alternative;
 boundary="------------YSDDcjQE4Ni0JhLBVmnLWAPq"
Message-ID: <9d603884-968b-4439-b88b-2bf8f6aebb9c@windriver.com>
Date: Thu, 22 Aug 2024 20:56:51 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][master][scarthgap][PATCH] wpa-supplicant: Upgrade 2.10
 -> 2.11
To: sdoshi@mvista.com, openembedded-core@lists.openembedded.org,
        "steve@sakoman.com" <steve@sakoman.com>
References: <20240822161721.6699-1-sdoshi@mvista.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20240822161721.6699-1-sdoshi@mvista.com>
X-ClientProxiedBy: YQBPR0101CA0275.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::25) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|IA1PR11MB8151:EE_
X-MS-Office365-Filtering-Correlation-Id: 936bb3eb-9176-46d2-bed6-08dcc30e7a51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|4022899009|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?S0FwTlg2YzlMOE9ad3ZUc2xZZzA5OFFWOXR2WmtpVWNORFVuemFxR25IaHFP?=
 =?utf-8?B?OWtxTU9YREZpUTJDY2RWd0NkWUZCdzZuZk43T2lFNVM3QkQrYlliWDhMbEtN?=
 =?utf-8?B?MmM1ZU8yYUl6aHhYdnMxVUljdTBpNmRSNkt2b3BQb2JVWWhJankvbUVHSlFT?=
 =?utf-8?B?bmJYY21MSGRGdEc5U2lrK1l5MngwTEYvb3o1aTFsT0VlbTJuYmZ4SVlWcTg5?=
 =?utf-8?B?OGdzaUNLeWJLSE5VbVd3K0JVa0FaU2cxRDFqbzNuNFZ5bXJaM1FYVTJvZ0tY?=
 =?utf-8?B?cEszWGJNREpFZDVrUFltSTFKSS9iSkxKSVF0ODkydlZJVm5NVEJqUEhZVDBP?=
 =?utf-8?B?L1liY0x1bWZydjhaNmxQWlFoR0R1bWhaR1lXSHdjK3VJdW1XSmxhUy9QV0Ir?=
 =?utf-8?B?L2IwTnJoUVQvOU5IS2RZL3RMbStEMlJFR3dkemU4TXN5b3NscWpLcGx2alk1?=
 =?utf-8?B?bmZ6SklFWXJVUk9mTG1Vai9aU1Nsc2FFanlaSWVPZEl1MGtZNlFQb0d2YkRh?=
 =?utf-8?B?ZEYrQ1RlRTRZUjhGNDQxdUk5TGpKYnJucVhRYmRsa0NvOFFGdDVDWXo2NC9n?=
 =?utf-8?B?d2dZNXdIZ3RuZkxIOFBmbHJQWFVwczJ5MFBUaUU4bGFZRmJtOGx6QW11NVZn?=
 =?utf-8?B?azErL2xPZHU3bldTckZ5aFVpbjk2Sm5iazEwQUJNT05PUHJSLzVldUgxSmFX?=
 =?utf-8?B?dERweTBvejZNL3ZVdllDTkxlRTFudlVnaTE0dHN5M0hQWDBqQkVDcHlMUnVk?=
 =?utf-8?B?Z0phNStpKzlheFU2aEphNWlFUzZHaklleWlmazNzVFdWVkh3cTJ1YmlNYmpp?=
 =?utf-8?B?V2tYNFVsQXVvcitBOCs0TkRZS1RBTi9MS1dnY2pJMm5VS2xiU3lScjJBeEgv?=
 =?utf-8?B?MnNzQzVQMXB2NHZmOUV3ZkU2clN6TWFBWmg5UTlmQnN4alBhRFpSVFVlOTUy?=
 =?utf-8?B?U2UzSjhjTjBDa1NTSkNHaituWkJyWWUxbnoyWHRtRGFFblJ4V0Q2SFhIaVFk?=
 =?utf-8?B?TWNhaFdxZGo5bUJIb0RpQ09vY1VqWXF3UHVlV2ZnVUtzR2VjNzBwY3FZMmZp?=
 =?utf-8?B?cmRhQkJSL05yZVhwVkg3VTBMUzZxZVRmanFCWStIc1lLZHYwVksyOTdBV3Q3?=
 =?utf-8?B?YUJxd0tHZ0hrb2ZiWXhNOVQrd3dldkF0emlUMURhMWFtUFRBUWNKUSs4SW0v?=
 =?utf-8?B?MHkrQXlmK1NtL1FMSUZ3R2xLeExvRG5jQ1pxOFYzWkt1eHRaZVlhUlZOMmhs?=
 =?utf-8?B?dVg0bzRvc0UrS0UxWGdMbGltRUN5ZXVLdkVGMkUxeVlZOThiaE92ZkQxS2lI?=
 =?utf-8?B?SXQyM2JsaHpTWWV4Y1ZsSFgwVHVXSTFXYTE0b2ZCNnFxdzZIQ3YyMGllQXdY?=
 =?utf-8?B?aWJsdEhhQSsvMDN5d1ZWb0VKVG1PdVVSVFlQSzFnVDkyNE10bFFxOHVBZzZ4?=
 =?utf-8?B?eVI2aU9uV3NtcVVpVnc3ZW9ZV1JtZHA3K09kVFlEZWxJTUttUHVPT1Y5cmdL?=
 =?utf-8?B?L1J5blh5OWxoYW53QWJyUGpCczFieXpMaWVaOEZYT1RQVXZjUjJVUTFkVHJq?=
 =?utf-8?B?bjlZUjdxQVZVYVVSREQ2VEdmZHRQcVNOc0lzYTNkdUFTVzZFMXdWQjYyS2JT?=
 =?utf-8?B?RjNkWFJ1SDI4MVlhcXRJZkZyOU5kSHdCTXVoT0ZjL1VTSm1HckYvUHZYeXlC?=
 =?utf-8?B?d2pPMWN4YXV2d2dMNTBEMU5udDJOZjlsc3U1RUhsYUhXN0NPUm5XUUlVb0RW?=
 =?utf-8?Q?WkPPKAK/DbsCDhKyTA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(4022899009)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MGZkTVl2TWtXcVpqcjVxWnVpV29HVXlzMlZJYzlmd00wcWVvZVVCVFA3cUMr?=
 =?utf-8?B?cUcvWWUvT1lqdWtodWc1R2o2T3JlQkpiRjNDQS9nMU13SFhwR29kRllLTTUw?=
 =?utf-8?B?Uk1MWmxjRUtRUDBmSnhtSHBoUFVsTkh0d21Wb3Z4NXlCeHA1TkZSVld0d3ds?=
 =?utf-8?B?OGwzNVVWSGF2K1ErUHFPc1FEWlBjay85VEc2cFg3RjVwOTFDWFhVSEZVRzU3?=
 =?utf-8?B?ZCs2WFBRL1IxeGY3SjZwOE84V0l5V1JQcDZLQ2VLbjZDdDVLY2ozdmJzNHhw?=
 =?utf-8?B?YmlXNE50cXZrQ3dYZi81eXYwMzhiNWtVTi92YUcvWkVqTzVKNkh3aFhUc0dx?=
 =?utf-8?B?M0ZaRkxSaEVWdk40Skxob0lwYjgvY3hMdVBMZUhyNm9mVjhkVnBpL1p0VjJ0?=
 =?utf-8?B?RE5GTXNZV1FZRTc5QWRaVFlVbWkxZFAyRGg0ai8vakpwcmJTeE5aaTVaZWY4?=
 =?utf-8?B?Rm0ySC9hTzFnREtkbGo3a0tMUlRJVXNjejFGbkRWTFM5YmVSNEQvdGxqTnlK?=
 =?utf-8?B?QnhJL1pUdjlBdDRxdVhweDlIOGprQ1VVd0gxYTJxU01DTFVRbHFNb2ZhdEhQ?=
 =?utf-8?B?TU5HN3RXbm9icGF4WWR2VG9YbjFHd1hyVG9lS0dJOUV4UThxWEtlSHQ0dkhF?=
 =?utf-8?B?OXVZNTNQY05sa1pDUjFQTHoyN3FFQXB5RGNuSXJwWlU3cXdkand4YmNKdzhP?=
 =?utf-8?B?V1lmT2JjUXFHdysrZm5NYXp4amtTVFNrZDdaYStFbXgyYk1oR05aMVhpVm8x?=
 =?utf-8?B?dHNUSm56SUNVREVVM1NnSlM3elNDMEVtT3BTWkp2V0V3MllDR1RBREZtRDRm?=
 =?utf-8?B?aDN5K3dmUFgwSzNXTW4zMjVVRGtrMVNNaU1lRHRYUXJVWTJFdDBrK2tFVCs5?=
 =?utf-8?B?R1ROa0hMYXdRUHptM1Y4dy9VZU80UW5EeW5CRlZNZm51QmVUUW1jTDhuSWw4?=
 =?utf-8?B?WWpnQktTQlNheVlxMWJ4RVc5TUFSem1JL3NaSlJ5eXNiekM4VStZWEF0UGZl?=
 =?utf-8?B?T2lUVEN1WHNQbmx3TStJK29YbDVOeG4wM3JXTDN3TXNPYUhVNXB2UGk0WG9t?=
 =?utf-8?B?Y0VvRW80NEVpbk9rTHd6bzZ1cU5uRHhLOS9YT0dJSjAxMlA1U1RuMXArZWJt?=
 =?utf-8?B?NVo5UUo3ay96Wm0yc3haOFIwakRodUdZdWFBdzl0VDMvOHNQV0k4ZDlCZ3hD?=
 =?utf-8?B?Z0dXSWwwOFBjcnd3ZUNtRGljNkR5TmIwMGlneWpIbURrR0lCbmdWcFMxOFNa?=
 =?utf-8?B?K0dYZXhQQko2SStjZUFOMUtDcEpuSGJPemszVlUzbnVaNEhha1I5R1NaRko0?=
 =?utf-8?B?c2Q1cC9GTlBscDRiYng1UWlGYXhFTkNRSk51NWtxd044WVp1bFZ6NGRtVmsv?=
 =?utf-8?B?eUhSMXNtZmM2c1BMNkxnckNyY1c0dUpabW1uemZlYlNhZUFSRnNseCtPb05N?=
 =?utf-8?B?RTJOQ2pMODNmZG1kL0ErbHdBSWJLQVJKanU4T3Rvd0trb1o1Vkl6TXNNZkZl?=
 =?utf-8?B?T0YyS1hqS2daWFY4T01TekxKRHBybkYzNVM2QXgvSUhWeXhiVTVMRXAxK3dt?=
 =?utf-8?B?S3preUF5VzRKYUs4N2E0VUxsQmJja1c1ZVlORHQ2bjRTT0FCZnlSZnpCMlZO?=
 =?utf-8?B?UE9NR0FHWGxLVjhyc1I2YVp3VEpMaGd3cnc2QmYwWmlOQkx6MCtkYXg2RDRY?=
 =?utf-8?B?ajl4T3VEL2hGQzlCQWVLb0oxenlOdXRwRnl4dTc3aUdzUDNZUXdvYmlFclFU?=
 =?utf-8?B?ZVEvSXR6Skt0SWF3eGVWT1B2MUMzcHp0VmZXc0pvVllZbnJ0bDh3V2QxRzBV?=
 =?utf-8?B?b1o0NUdJdWt6U3J6YWk2OFIzSUZEVjhqOXBPRWFtSE9ua0ZubmFHa1o1T2I3?=
 =?utf-8?B?TWFiYVhLL3Zoc2hyN21QY0lBMW9icVlNTEdhZUVuMzhhVlIwWUphTHpTYWx6?=
 =?utf-8?B?a1JCek9FTU5RcTUxVExMRWZqRkcvQjRGaHNkRkpPeE9zS0N0SG50RS84d0Ni?=
 =?utf-8?B?RDJXRzNvOGpoTUc0VG1XQ1I5am55RVBXeXpWYWpWcG43TU1sZjlMQkQzay9v?=
 =?utf-8?B?c0U5Y0FjRG1oVzVYSnZvQW5saFBHWnFHT1FrUzJQeTlIWTlDOWU2SnJGc3VM?=
 =?utf-8?B?cTQ3d0l2U0NSUDNQeU1NVDducFhNSTZYN1duUEE1aVRDWm03U0VlR0JlcXVN?=
 =?utf-8?B?b3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 936bb3eb-9176-46d2-bed6-08dcc30e7a51
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 00:56:53.0451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k8Ed78dZIv9kkTSltXBMkzVGvuqoGcY6Z3SeAYfp88QHI8YAahIOt5L5aaO/SHy/oPy0Lw/kYHDaKJgML/QerXPwNBAfh5JM6Cp7Glh7+E8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8151
X-Proofpoint-ORIG-GUID: 3_VqCfWSjZ89pQv4X2z7ah96OqQLGWCI
X-Authority-Analysis: v=2.4 cv=VdWlP0p9 c=1 sm=1 tr=0 ts=66c7de5b cx=c_pps a=2/f09Pi2ycfuKzF0xiDRrg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yoJbH4e0A30A:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8 a=fk1lIlRQAAAA:8 a=yaAG3qJ-AAAA:8
 a=pGLkceISAAAA:8 a=JfrnYn6hAAAA:8 a=COk6AnOGAAAA:8 a=t7CeM3EgAAAA:8 a=lZI6BftWLBXyHBpGwdsA:9 a=CYH4U5sQG6XSfQ-T:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=tmL6ccyT9T4A:10 a=GFfUI7B0NGUA:10 a=oUHh9KSzjG4A:10 a=_DcmwgE0N9P0SH7Fl0YA:9 a=10jHs9LQOepAk9KF:21
 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=T1a-OTYGVawA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=U75ogvRika4pmaD_UPO0:22 a=oLVlbjkABFOu4cUI0CGI:22 a=1CNFftbPRP8L7MoqJWF3:22 a=TjNXssC_j7lpFel5tvFf:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: V-4SYxvTpXvxGjDgs20JVoFRQzaP-2zB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-22_17,2024-08-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 spamscore=0 malwarescore=0 impostorscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408230005
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 00:57:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203665

--------------YSDDcjQE4Ni0JhLBVmnLWAPq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 47N0fVRS026506

For scarthgap, it's good but not mandatory to have Steve on the To/CC lis=
t.

On 2024-08-22 12:17 p.m., Siddharth Doshi via lists.openembedded.org wrot=
e:
> From: Siddharth Doshi<sdoshi@mvista.com>
>
> License-Update:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> - README: Change in copyright years as perhttps://w1.fi/cgit/hostap/com=
mit/README?id=3Dd945ddd368085f255e68328f2d3b020ceea359af
> - wpa_supplicant/wpa_supplicant.c: Change in copyright years as perhttp=
s://w1.fi/cgit/hostap/commit/wpa_supplicant/wpa_supplicant.c?id=3Dd945ddd=
368085f255e68328f2d3b020ceea359af
>
> CVE's Fixed:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> - CVE-2024-5290 wpa_supplicant: wpa_supplicant loading arbitrary shared=
 objects allowing privilege escalation
> - CVE-2023-52160 wpa_supplicant: potential authorization bypass
>
> Changes between 2.10 -> 2.11:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> https://w1.fi/cgit/hostap/commit/wpa_supplicant/ChangeLog?id=3Dd945ddd3=
68085f255e68328f2d3b020ceea359af


Hello Siddharth,


This update make sense for the master brnanch but likely not for=20
scarthgap unless you can show that
this is a bug fix only release.


It certainly does not look like a small bug fix only update based on:

=E2=9D=AF git diff hostap_2_10 hostap_2_11 | diffstat | tail -1
 =C2=A0534 files changed, 85965 insertions(+), 16847 deletions(-)

=E2=9D=AF git log --oneline hostap_2_10..hostap_2_11 | wc -l
2295

and the hostap and wpa-supplicant ChangeLogs which mention adding=20
features below (1).


Since the repo ( git://w1.fi/srv/git/hostap.git ) doesn't have a stable=20
branch for 2.10:

=E2=9D=AF git branch -a
* master
 =C2=A0 remotes/origin/HEAD -> origin/master
 =C2=A0 remotes/origin/android-jb
 =C2=A0 remotes/origin/android-kk
 =C2=A0 remotes/origin/android-l
 =C2=A0 remotes/origin/android-m
 =C2=A0 remotes/origin/aosp-jb
 =C2=A0 remotes/origin/aosp-kk
 =C2=A0 remotes/origin/main
 =C2=A0 remotes/origin/master
 =C2=A0 remotes/origin/pending


you'll have to backport any CVE fixes that you're interested in unless
someone explains why this is a sensible update for scarthgap.

Thanks,

../Randy


1)


=E2=9D=AF git diff hostap_2_10 hostap_2_11 hostapd/ChangeLog | cat
diff --git a/hostapd/ChangeLog b/hostapd/ChangeLog
index 279298e4d..1c8240d33 100644
--- a/hostapd/ChangeLog
+++ b/hostapd/ChangeLog
@@ -1,5 +1,42 @@
 =C2=A0ChangeLog for hostapd

+2024-07-20 - v2.11
+=C2=A0=C2=A0=C2=A0 * Wi-Fi Easy Connect
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - add support for DPP release 3
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - allow Configurator parameters to be pro=
vided during config exchange
+=C2=A0=C2=A0=C2=A0 * HE/IEEE 802.11ax/Wi-Fi 6
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - various fixes
+=C2=A0=C2=A0=C2=A0 * EHT/IEEE 802.11be/Wi-Fi 7
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - add preliminary support
+=C2=A0=C2=A0=C2=A0 * SAE: add support for fetching the password from a R=
ADIUS server
+=C2=A0=C2=A0=C2=A0 * support OpenSSL 3.0 API changes
+=C2=A0=C2=A0=C2=A0 * support background radar detection and CAC with som=
e additional
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drivers
+=C2=A0=C2=A0=C2=A0 * support RADIUS ACL/PSK check during 4-way handshake=
=20
(wpa_psk_radius=3D3)
+=C2=A0=C2=A0=C2=A0 * EAP-SIM/AKA: support IMSI privacy
+=C2=A0=C2=A0=C2=A0 * improve 4-way handshake operations
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - use Secure=3D1 in message 3 during PTK =
rekeying
+=C2=A0=C2=A0=C2=A0 * OCV: do not check Frequency Segment 1 Channel Numbe=
r for 160 MHz=20
cases
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to avoid interoperability issues
+=C2=A0=C2=A0=C2=A0 * support new SAE AKM suites with variable length key=
s
+=C2=A0=C2=A0=C2=A0 * support new AKM for 802.1X/EAP with SHA384
+=C2=A0=C2=A0=C2=A0 * extend PASN support for secure ranging
+=C2=A0=C2=A0=C2=A0 * FT: Use SHA256 to derive PMKID for AKM 00-0F-AC:3 (=
FT-EAP)
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - this is based on additional details bei=
ng added in the IEEE 802.11
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 standard
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - the new implementation is not backwards=
 compatible
+=C2=A0=C2=A0=C2=A0 * improved ACS to cover additional channel types/band=
widths
+=C2=A0=C2=A0=C2=A0 * extended Multiple BSSID support
+=C2=A0=C2=A0=C2=A0 * fix beacon protection with FT protocol (incorrect B=
IGTK was provided)
+=C2=A0=C2=A0=C2=A0 * support unsynchronized service discovery (USD)
+=C2=A0=C2=A0=C2=A0 * add preliminary support for RADIUS/TLS
+=C2=A0=C2=A0=C2=A0 * add support for explicit SSID protection in 4-way h=
andshake
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (a mitigation for CVE-2023-52424; disable=
d by default for now, can be
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enabled with ssid_protection=3D1)
+=C2=A0=C2=A0=C2=A0 * fix SAE H2E rejected groups validation to avoid dow=
ngrade attacks
+=C2=A0=C2=A0=C2=A0 * use stricter validation for some RADIUS messages
+=C2=A0=C2=A0=C2=A0 * a large number of other fixes, cleanup, and extensi=
ons
+
 =C2=A02022-01-16 - v2.10
 =C2=A0=C2=A0=C2=A0=C2=A0 * SAE changes
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - improved protection against side =
channel attacks


=E2=9D=AF=C2=A0 git diff hostap_2_10 hostap_2_11 wpa_supplicant/ChangeLog=
 | cat
diff --git a/wpa_supplicant/ChangeLog b/wpa_supplicant/ChangeLog
index efcc6cd9c..3f4162eb0 100644
--- a/wpa_supplicant/ChangeLog
+++ b/wpa_supplicant/ChangeLog
@@ -1,5 +1,55 @@
 =C2=A0ChangeLog for wpa_supplicant

+2024-07-20 - v2.11
+=C2=A0=C2=A0=C2=A0 * Wi-Fi Easy Connect
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - add support for DPP release 3
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - allow Configurator parameters to be pro=
vided during config exchange
+=C2=A0=C2=A0=C2=A0 * MACsec
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - add support for GCM-AES-256 cipher suit=
e
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - remove incorrect EAP Session-Id length =
constraint
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - add hardware offload support for additi=
onal drivers
+=C2=A0=C2=A0=C2=A0 * HE/IEEE 802.11ax/Wi-Fi 6
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - support BSS color updates
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - various fixes
+=C2=A0=C2=A0=C2=A0 * EHT/IEEE 802.11be/Wi-Fi 7
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - add preliminary support
+=C2=A0=C2=A0=C2=A0 * support OpenSSL 3.0 API changes
+=C2=A0=C2=A0=C2=A0 * improve EAP-TLS support for TLSv1.3
+=C2=A0=C2=A0=C2=A0 * EAP-SIM/AKA: support IMSI privacy
+=C2=A0=C2=A0=C2=A0 * improve mitigation against DoS attacks when PMF is =
used
+=C2=A0=C2=A0=C2=A0 * improve 4-way handshake operations
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - discard unencrypted EAPOL frames in add=
itional cases
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - use Secure=3D1 in message 2 during PTK =
rekeying
+=C2=A0=C2=A0=C2=A0 * OCV: do not check Frequency Segment 1 Channel Numbe=
r for 160 MHz=20
cases
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to avoid interoperability issues
+=C2=A0=C2=A0=C2=A0 * support new SAE AKM suites with variable length key=
s
+=C2=A0=C2=A0=C2=A0 * support new AKM for 802.1X/EAP with SHA384
+=C2=A0=C2=A0=C2=A0 * improve cross-AKM roaming with driver-based SME/BSS=
 selection
+=C2=A0=C2=A0=C2=A0 * PASN
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - extend support for secure ranging
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - allow PASN implementation to be used wi=
th external programs for
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Wi-Fi Aware
+=C2=A0=C2=A0=C2=A0 * FT: Use SHA256 to derive PMKID for AKM 00-0F-AC:3 (=
FT-EAP)
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - this is based on additional details bei=
ng added in the IEEE 802.11
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 standard
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - the new implementation is not backwards=
 compatible, but PMKSA
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 caching with FT-EAP was, and =
still is, disabled by default
+=C2=A0=C2=A0=C2=A0 * support a pregenerated MAC (mac_addr=3D3) as an alt=
ernative mechanism
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for using per-network random MAC addresse=
s
+=C2=A0=C2=A0=C2=A0 * EAP-PEAP: require Phase 2 authentication by default=
 (phase2_auth=3D1)
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to improve security for still unfortunate=
ly common invalid
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 configurations that do not set ca_cert
+=C2=A0=C2=A0=C2=A0 * extend SCS support for QoS Characteristics
+=C2=A0=C2=A0=C2=A0 * extend MSCS support
+=C2=A0=C2=A0=C2=A0 * support unsynchronized service discovery (USD)
+=C2=A0=C2=A0=C2=A0 * add support for explicit SSID protection in 4-way h=
andshake
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (a mitigation for CVE-2023-52424; disable=
d by default for now, can be
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enabled with ssid_protection=3D1)
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - in addition, verify SSID after key setu=
p when beacon protection is
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 used
+=C2=A0=C2=A0=C2=A0 * fix SAE H2E rejected groups validation to avoid dow=
ngrade attacks
+=C2=A0=C2=A0=C2=A0 * a large number of other fixes, cleanup, and extensi=
ons
+
 =C2=A02022-01-16 - v2.10
 =C2=A0=C2=A0=C2=A0=C2=A0 * SAE changes
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - improved protection against side =
channel attacks


>
> Note:
> =3D=3D=3D=3D=3D
> Patches
> 0001-build-Re-enable-options-for-libwpa_client.so-and-wpa.patch,
> 0002-Fix-removal-of-wpa_passphrase-on-make-clean.patch,
> 0001-Install-wpa_passphrase-when-not-disabled.patch,
> 0001-PEAP-client-Update-Phase-2-authentication-requiremen.patch (CVE-20=
23-52160)
> are already fixed and hence removing them.
>
> Signed-off-by: Siddharth Doshi<sdoshi@mvista.com>
> ---
>   ...all-wpa_passphrase-when-not-disabled.patch |  33 ---
>   ...te-Phase-2-authentication-requiremen.patch | 213 -----------------=
-
>   ...options-for-libwpa_client.so-and-wpa.patch |  73 ------
>   ...oval-of-wpa_passphrase-on-make-clean.patch |  26 ---
>   ...plicant_2.10.bb =3D> wpa-supplicant_2.11.bb} |  10 +-
>   5 files changed, 3 insertions(+), 352 deletions(-)
>   delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-suppl=
icant/0001-Install-wpa_passphrase-when-not-disabled.patch
>   delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-suppl=
icant/0001-PEAP-client-Update-Phase-2-authentication-requiremen.patch
>   delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-suppl=
icant/0001-build-Re-enable-options-for-libwpa_client.so-and-wpa.patch
>   delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-suppl=
icant/0002-Fix-removal-of-wpa_passphrase-on-make-clean.patch
>   rename meta/recipes-connectivity/wpa-supplicant/{wpa-supplicant_2.10.=
bb =3D> wpa-supplicant_2.11.bb} (90%)
>
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/00=
01-Install-wpa_passphrase-when-not-disabled.patch b/meta/recipes-connecti=
vity/wpa-supplicant/wpa-supplicant/0001-Install-wpa_passphrase-when-not-d=
isabled.patch
> deleted file mode 100644
> index c04c608bde..0000000000
> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-Inst=
all-wpa_passphrase-when-not-disabled.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 57b12a1e43605f71239a21488cb9b541f0751dda Mon Sep 17 00:00:00 2001
> -From: Alex Kiernan<alexk@zuma.ai>
> -Date: Thu, 21 Apr 2022 10:15:29 +0100
> -Subject: [PATCH] Install wpa_passphrase when not disabled
> -
> -As part of fixing CONFIG_NO_WPA_PASSPHRASE, whilst wpa_passphrase gets
> -built, its not installed during `make install`.
> -
> -Fixes: cb41c214b78d ("build: Re-enable options for libwpa_client.so an=
d wpa_passphrase")
> -Signed-off-by: Alex Kiernan<alexk@zuma.ai>
> -Signed-off-by: Alex Kiernan<alex.kiernan@gmail.com>
> -Upstream-Status: Submitted [http://lists.infradead.org/pipermail/hosta=
p/2022-April/040448.html]
> ----
> - wpa_supplicant/Makefile | 3 +++
> - 1 file changed, 3 insertions(+)
> -
> -diff --git a/wpa_supplicant/Makefile b/wpa_supplicant/Makefile
> -index 0bab313f2355..12787c0c7d0f 100644
> ---- a/wpa_supplicant/Makefile
> -+++ b/wpa_supplicant/Makefile
> -@@ -73,6 +73,9 @@ $(DESTDIR)$(BINDIR)/%: %
> -
> - install: $(addprefix $(DESTDIR)$(BINDIR)/,$(BINALL))
> - 	$(MAKE) -C ../src install
> -+ifndef CONFIG_NO_WPA_PASSPHRASE
> -+	install -D wpa_passphrase $(DESTDIR)/$(BINDIR)/wpa_passphrase
> -+endif
> - ifdef CONFIG_BUILD_WPA_CLIENT_SO
> - 	install -m 0644 -D libwpa_client.so $(DESTDIR)/$(LIBDIR)/libwpa_clie=
nt.so
> - 	install -m 0644 -D ../src/common/wpa_ctrl.h $(DESTDIR)/$(INCDIR)/wpa=
_ctrl.h
> ---
> -2.35.1
> -
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/00=
01-PEAP-client-Update-Phase-2-authentication-requiremen.patch b/meta/reci=
pes-connectivity/wpa-supplicant/wpa-supplicant/0001-PEAP-client-Update-Ph=
ase-2-authentication-requiremen.patch
> deleted file mode 100644
> index 620560d3c7..0000000000
> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-PEAP=
-client-Update-Phase-2-authentication-requiremen.patch
> +++ /dev/null
> @@ -1,213 +0,0 @@
> -From f6f7cead3661ceeef54b21f7e799c0afc98537ec Mon Sep 17 00:00:00 2001
> -From: Jouni Malinen<j@w1.fi>
> -Date: Sat, 8 Jul 2023 19:55:32 +0300
> -Subject: [PATCH] PEAP client: Update Phase 2 authentication requiremen=
ts
> -
> -The previous PEAP client behavior allowed the server to skip Phase 2
> -authentication with the expectation that the server was authenticated
> -during Phase 1 through TLS server certificate validation. Various PEAP
> -specifications are not exactly clear on what the behavior on this fron=
t
> -is supposed to be and as such, this ended up being more flexible than
> -the TTLS/FAST/TEAP cases. However, this is not really ideal when
> -unfortunately common misconfiguration of PEAP is used in deployed
> -devices where the server trust root (ca_cert) is not configured or the
> -user has an easy option for allowing this validation step to be skippe=
d.
> -
> -Change the default PEAP client behavior to be to require Phase 2
> -authentication to be successfully completed for cases where TLS sessio=
n
> -resumption is not used and the client certificate has not been
> -configured. Those two exceptions are the main cases where a deployed
> -authentication server might skip Phase 2 and as such, where a more
> -strict default behavior could result in undesired interoperability
> -issues. Requiring Phase 2 authentication will end up disabling TLS
> -session resumption automatically to avoid interoperability issues.
> -
> -Allow Phase 2 authentication behavior to be configured with a new phas=
e1
> -configuration parameter option:
> -'phase2_auth' option can be used to control Phase 2 (i.e., within TLS
> -tunnel) behavior for PEAP:
> - * 0 =3D do not require Phase 2 authentication
> - * 1 =3D require Phase 2 authentication when client certificate
> -   (private_key/client_cert) is no used and TLS session resumption was
> -   not used (default)
> - * 2 =3D require Phase 2 authentication in all cases
> -
> -Signed-off-by: Jouni Malinen<j@w1.fi>
> -
> -CVE: CVE-2023-52160
> -Upstream-Status: Backport [https://w1.fi/cgit/hostap/commit/?id=3D8e64=
85a1bcb0baffdea9e55255a81270b768439c]
> -
> -Signed-off-by: Claus Stovgaard<claus.stovgaard@gmail.com>
> -
> ----
> - src/eap_peer/eap_config.h          |  8 ++++++
> - src/eap_peer/eap_peap.c            | 40 +++++++++++++++++++++++++++--=
-
> - src/eap_peer/eap_tls_common.c      |  6 +++++
> - src/eap_peer/eap_tls_common.h      |  5 ++++
> - wpa_supplicant/wpa_supplicant.conf |  7 ++++++
> - 5 files changed, 63 insertions(+), 3 deletions(-)
> -
> -diff --git a/src/eap_peer/eap_config.h b/src/eap_peer/eap_config.h
> -index 3238f74..047eec2 100644
> ---- a/src/eap_peer/eap_config.h
> -+++ b/src/eap_peer/eap_config.h
> -@@ -469,6 +469,14 @@ struct eap_peer_config {
> - 	 * 1 =3D use cryptobinding if server supports it
> - 	 * 2 =3D require cryptobinding
> - 	 *
> -+	 * phase2_auth option can be used to control Phase 2 (i.e., within T=
LS
> -+	 * tunnel) behavior for PEAP:
> -+	 * 0 =3D do not require Phase 2 authentication
> -+	 * 1 =3D require Phase 2 authentication when client certificate
> -+	 *  (private_key/client_cert) is no used and TLS session resumption =
was
> -+	 *  not used (default)
> -+	 * 2 =3D require Phase 2 authentication in all cases
> -+	 *
> - 	 * EAP-WSC (WPS) uses following options: pin=3DDevice_Password and
> - 	 * uuid=3DDevice_UUID
> - 	 *
> -diff --git a/src/eap_peer/eap_peap.c b/src/eap_peer/eap_peap.c
> -index 12e30df..6080697 100644
> ---- a/src/eap_peer/eap_peap.c
> -+++ b/src/eap_peer/eap_peap.c
> -@@ -67,6 +67,7 @@ struct eap_peap_data {
> - 	u8 cmk[20];
> - 	int soh; /* Whether IF-TNCCS-SOH (Statement of Health; Microsoft NAP=
)
> - 		  * is enabled. */
> -+	enum { NO_AUTH, FOR_INITIAL, ALWAYS } phase2_auth;
> - };
> -
> -
> -@@ -114,6 +115,19 @@ static void eap_peap_parse_phase1(struct eap_peap=
_data *data,
> - 		wpa_printf(MSG_DEBUG, "EAP-PEAP: Require cryptobinding");
> - 	}
> -
> -+	if (os_strstr(phase1, "phase2_auth=3D0")) {
> -+		data->phase2_auth =3D NO_AUTH;
> -+		wpa_printf(MSG_DEBUG,
> -+			   "EAP-PEAP: Do not require Phase 2 authentication");
> -+	} else if (os_strstr(phase1, "phase2_auth=3D1")) {
> -+		data->phase2_auth =3D FOR_INITIAL;
> -+		wpa_printf(MSG_DEBUG,
> -+			   "EAP-PEAP: Require Phase 2 authentication for initial connectio=
n");
> -+	} else if (os_strstr(phase1, "phase2_auth=3D2")) {
> -+		data->phase2_auth =3D ALWAYS;
> -+		wpa_printf(MSG_DEBUG,
> -+			   "EAP-PEAP: Require Phase 2 authentication for all cases");
> -+	}
> - #ifdef EAP_TNC
> - 	if (os_strstr(phase1, "tnc=3Dsoh2")) {
> - 		data->soh =3D 2;
> -@@ -142,6 +156,7 @@ static void * eap_peap_init(struct eap_sm *sm)
> - 	data->force_peap_version =3D -1;
> - 	data->peap_outer_success =3D 2;
> - 	data->crypto_binding =3D OPTIONAL_BINDING;
> -+	data->phase2_auth =3D FOR_INITIAL;
> -
> - 	if (config && config->phase1)
> - 		eap_peap_parse_phase1(data, config->phase1);
> -@@ -454,6 +469,20 @@ static int eap_tlv_validate_cryptobinding(struct =
eap_sm *sm,
> - }
> -
> -
> -+static bool peap_phase2_sufficient(struct eap_sm *sm,
> -+				   struct eap_peap_data *data)
> -+{
> -+	if ((data->phase2_auth =3D=3D ALWAYS ||
> -+	     (data->phase2_auth =3D=3D FOR_INITIAL &&
> -+	      !tls_connection_resumed(sm->ssl_ctx, data->ssl.conn) &&
> -+	      !data->ssl.client_cert_conf) ||
> -+	     data->phase2_eap_started) &&
> -+	    !data->phase2_eap_success)
> -+		return false;
> -+	return true;
> -+}
> -+
> -+
> - /**
> -  * eap_tlv_process - Process a received EAP-TLV message and generate =
a response
> -  * @sm: Pointer to EAP state machine allocated with eap_peer_sm_init(=
)
> -@@ -568,6 +597,11 @@ static int eap_tlv_process(struct eap_sm *sm, str=
uct eap_peap_data *data,
> - 					   " - force failed Phase 2");
> - 				resp_status =3D EAP_TLV_RESULT_FAILURE;
> - 				ret->decision =3D DECISION_FAIL;
> -+			} else if (!peap_phase2_sufficient(sm, data)) {
> -+				wpa_printf(MSG_INFO,
> -+					   "EAP-PEAP: Server indicated Phase 2 success, but sufficient P=
hase 2 authentication has not been completed");
> -+				resp_status =3D EAP_TLV_RESULT_FAILURE;
> -+				ret->decision =3D DECISION_FAIL;
> - 			} else {
> - 				resp_status =3D EAP_TLV_RESULT_SUCCESS;
> - 				ret->decision =3D DECISION_UNCOND_SUCC;
> -@@ -887,8 +921,7 @@ continue_req:
> - 			/* EAP-Success within TLS tunnel is used to indicate
> - 			 * shutdown of the TLS channel. The authentication has
> - 			 * been completed. */
> --			if (data->phase2_eap_started &&
> --			    !data->phase2_eap_success) {
> -+			if (!peap_phase2_sufficient(sm, data)) {
> - 				wpa_printf(MSG_DEBUG, "EAP-PEAP: Phase 2 "
> - 					   "Success used to indicate success, "
> - 					   "but Phase 2 EAP was not yet "
> -@@ -1199,8 +1232,9 @@ static struct wpabuf * eap_peap_process(struct e=
ap_sm *sm, void *priv,
> - static bool eap_peap_has_reauth_data(struct eap_sm *sm, void *priv)
> - {
> - 	struct eap_peap_data *data =3D priv;
> -+
> - 	return tls_connection_established(sm->ssl_ctx, data->ssl.conn) &&
> --		data->phase2_success;
> -+		data->phase2_success && data->phase2_auth !=3D ALWAYS;
> - }
> -
> -
> -diff --git a/src/eap_peer/eap_tls_common.c b/src/eap_peer/eap_tls_comm=
on.c
> -index c1837db..a53eeb1 100644
> ---- a/src/eap_peer/eap_tls_common.c
> -+++ b/src/eap_peer/eap_tls_common.c
> -@@ -239,6 +239,12 @@ static int eap_tls_params_from_conf(struct eap_sm=
 *sm,
> -
> - 	sm->ext_cert_check =3D !!(params->flags & TLS_CONN_EXT_CERT_CHECK);
> -
> -+	if (!phase2)
> -+		data->client_cert_conf =3D params->client_cert ||
> -+			params->client_cert_blob ||
> -+			params->private_key ||
> -+			params->private_key_blob;
> -+
> - 	return 0;
> - }
> -
> -diff --git a/src/eap_peer/eap_tls_common.h b/src/eap_peer/eap_tls_comm=
on.h
> -index 9ac0012..3348634 100644
> ---- a/src/eap_peer/eap_tls_common.h
> -+++ b/src/eap_peer/eap_tls_common.h
> -@@ -79,6 +79,11 @@ struct eap_ssl_data {
> - 	 * tls_v13 - Whether TLS v1.3 or newer is used
> - 	 */
> - 	int tls_v13;
> -+
> -+	/**
> -+	 * client_cert_conf: Whether client certificate has been configured
> -+	 */
> -+	bool client_cert_conf;
> - };
> -
> -
> -diff --git a/wpa_supplicant/wpa_supplicant.conf b/wpa_supplicant/wpa_s=
upplicant.conf
> -index 6619d6b..d63f73c 100644
> ---- a/wpa_supplicant/wpa_supplicant.conf
> -+++ b/wpa_supplicant/wpa_supplicant.conf
> -@@ -1321,6 +1321,13 @@ fast_reauth=3D1
> - #	 * 0 =3D do not use cryptobinding (default)
> - #	 * 1 =3D use cryptobinding if server supports it
> - #	 * 2 =3D require cryptobinding
> -+#	'phase2_auth' option can be used to control Phase 2 (i.e., within T=
LS
> -+#	tunnel) behavior for PEAP:
> -+#	 * 0 =3D do not require Phase 2 authentication
> -+#	 * 1 =3D require Phase 2 authentication when client certificate
> -+#	   (private_key/client_cert) is no used and TLS session resumption =
was
> -+#	   not used (default)
> -+#	 * 2 =3D require Phase 2 authentication in all cases
> - #	EAP-WSC (WPS) uses following options: pin=3D<Device Password> or
> - #	pbc=3D1.
> - #
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/00=
01-build-Re-enable-options-for-libwpa_client.so-and-wpa.patch b/meta/reci=
pes-connectivity/wpa-supplicant/wpa-supplicant/0001-build-Re-enable-optio=
ns-for-libwpa_client.so-and-wpa.patch
> deleted file mode 100644
> index 6e930fc98d..0000000000
> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-buil=
d-Re-enable-options-for-libwpa_client.so-and-wpa.patch
> +++ /dev/null
> @@ -1,73 +0,0 @@
> -From cb41c214b78d6df187a31950342e48a403dbd769 Mon Sep 17 00:00:00 2001
> -From: Sergey Matyukevich<geomatsi@gmail.com>
> -Date: Tue, 22 Feb 2022 11:52:19 +0300
> -Subject: [PATCH 1/2] build: Re-enable options for libwpa_client.so and
> - wpa_passphrase
> -
> -Commit a41a29192e5d ("build: Pull common fragments into a build.rules
> -file") introduced a regression into wpa_supplicant build process. The
> -build target libwpa_client.so is not built regardless of whether the
> -option CONFIG_BUILD_WPA_CLIENT_SO is set or not. This happens because
> -this config option is used before it is imported from the configuratio=
n
> -file. Moving its use after including build.rules does not help: the
> -variable ALL is processed by build.rules and further changes are not
> -applied. Similarly, option CONFIG_NO_WPA_PASSPHRASE also does not work
> -as expected: wpa_passphrase is always built regardless of whether the
> -option is set or not.
> -
> -Re-enable these options by adding both build targets to _all
> -dependencies.
> -
> -Fixes: a41a29192e5d ("build: Pull common fragments into a build.rules =
file")
> -Signed-off-by: Sergey Matyukevich<geomatsi@gmail.com>
> -Upstream-Status: Backport
> -Signed-off-by: Alex Kiernan<alexk@zuma.ai>
> -Signed-off-by: Alex Kiernan<alexk@gmail.com>
> ----
> - wpa_supplicant/Makefile | 19 ++++++++++++-------
> - 1 file changed, 12 insertions(+), 7 deletions(-)
> -
> -diff --git a/wpa_supplicant/Makefile b/wpa_supplicant/Makefile
> -index cb66defac7c8..c456825ae75f 100644
> ---- a/wpa_supplicant/Makefile
> -+++ b/wpa_supplicant/Makefile
> -@@ -1,24 +1,29 @@
> - BINALL=3Dwpa_supplicant wpa_cli
> -
> --ifndef CONFIG_NO_WPA_PASSPHRASE
> --BINALL +=3D wpa_passphrase
> --endif
> --
> - ALL =3D $(BINALL)
> - ALL +=3D systemd/wpa_supplicant.service
> - ALL +=3Dsystemd/wpa_supplicant@.service
> - ALL +=3Dsystemd/wpa_supplicant-nl80211@.service
> - ALL +=3Dsystemd/wpa_supplicant-wired@.service
> - ALL +=3D dbus/fi.w1.wpa_supplicant1.service
> --ifdef CONFIG_BUILD_WPA_CLIENT_SO
> --ALL +=3D libwpa_client.so
> --endif
> -
> - EXTRA_TARGETS=3Ddynamic_eap_methods
> -
> - CONFIG_FILE=3D.config
> - include ../src/build.rules
> -
> -+ifdef CONFIG_BUILD_WPA_CLIENT_SO
> -+# add the dependency this way to allow CONFIG_BUILD_WPA_CLIENT_SO
> -+# being set in the config which is read by build.rules
> -+_all: libwpa_client.so
> -+endif
> -+
> -+ifndef CONFIG_NO_WPA_PASSPHRASE
> -+# add the dependency this way to allow CONFIG_NO_WPA_PASSPHRASE
> -+# being set in the config which is read by build.rules
> -+_all: wpa_passphrase
> -+endif
> -+
> - ifdef LIBS
> - # If LIBS is set with some global build system defaults, clone those =
for
> - # LIBS_c and LIBS_p to cover wpa_passphrase and wpa_cli as well.
> ---
> -2.35.1
> -
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/00=
02-Fix-removal-of-wpa_passphrase-on-make-clean.patch b/meta/recipes-conne=
ctivity/wpa-supplicant/wpa-supplicant/0002-Fix-removal-of-wpa_passphrase-=
on-make-clean.patch
> deleted file mode 100644
> index 53b0fcdf53..0000000000
> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-Fix-=
removal-of-wpa_passphrase-on-make-clean.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -From d001b301ba7987f4b39453a211631b85c48f2ff8 Mon Sep 17 00:00:00 2001
> -From: Jouni Malinen<quic_jouni@quicinc.com>
> -Date: Thu, 3 Mar 2022 13:26:42 +0200
> -Subject: [PATCH 2/2] Fix removal of wpa_passphrase on 'make clean'
> -
> -Fixes: 0430bc8267b4 ("build: Add a common-clean target")
> -Signed-off-by: Jouni Malinen<quic_jouni@quicinc.com>
> -Upstream-Status: Backport
> -Signed-off-by: Alex Kiernan<alexk@zuma.ai>
> -Signed-off-by: Alex Kiernan<alexk@gmail.com>
> ----
> - wpa_supplicant/Makefile | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/wpa_supplicant/Makefile b/wpa_supplicant/Makefile
> -index c456825ae75f..4b4688931b1d 100644
> ---- a/wpa_supplicant/Makefile
> -+++ b/wpa_supplicant/Makefile
> -@@ -2077,3 +2077,4 @@ clean: common-clean
> - 	rm -f libwpa_client.a
> - 	rm -f libwpa_client.so
> - 	rm -f libwpa_test1 libwpa_test2
> -+	rm -f wpa_passphrase
> ---
> -2.35.1
> -
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.=
10.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
> similarity index 90%
> rename from meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.1=
0.bb
> rename to meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.=
bb
> index 8113bcab09..321dedc58a 100644
> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
> @@ -5,8 +5,8 @@ BUGTRACKER =3D"http://w1.fi/security/"
>   SECTION =3D "network"
>   LICENSE =3D "BSD-3-Clause"
>   LIC_FILES_CHKSUM =3D"file://COPYING;md5=3D5ebcb90236d1ad640558c3d3cd3=
035df \ -=20
> file://README;beginline=3D1;endline=3D56;md5=3De3d2f6c2948991e37c1ca496=
0de84747=20
> \ -=20
> file://wpa_supplicant/wpa_supplicant.c;beginline=3D1;endline=3D12;md5=3D=
76306a95306fee9a976b0ac1be70f705"
> +file://README;beginline=3D1;endline=3D56;md5=3D6e4b25e7d74bfc44a32ba37=
bdf5210a6 \
> +file://wpa_supplicant/wpa_supplicant.c;beginline=3D1;endline=3D12;md5=3D=
f5ccd57ea91e04800edb88267bf8eae4"
>  =20
>   DEPENDS =3D "dbus libnl"
>  =20
> @@ -15,12 +15,8 @@ SRC_URI =3D"http://w1.fi/releases/wpa_supplicant-${P=
V}.tar.gz \=20
> file://wpa_supplicant.conf \ file://wpa_supplicant.conf-sane \=20
> file://99_wpa_supplicant \ -=20
> file://0001-build-Re-enable-options-for-libwpa_client.so-and-wpa.patch=20
> \ - file://0002-Fix-removal-of-wpa_passphrase-on-make-clean.patch \ -=20
> file://0001-Install-wpa_passphrase-when-not-disabled.patch \ -=20
> file://0001-PEAP-client-Update-Phase-2-authentication-requiremen.patch =
\ "
> -SRC_URI[sha256sum] =3D "20df7ae5154b3830355f8ab4269123a87affdea59fe74f=
e9292a91d0d7e17b2f"
> +SRC_URI[sha256sum] =3D "912ea06f74e30a8e36fbb68064d6cdff218d8d591db0fc=
5d75dee6c81ac7fc0a"
>  =20
>   S =3D "${WORKDIR}/wpa_supplicant-${PV}"
>  =20
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203657):https://lists.openembedded.org/g/openembedd=
ed-core/message/203657
> Mute This Topic:https://lists.openembedded.org/mt/108040776/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [r=
andy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------YSDDcjQE4Ni0JhLBVmnLWAPq
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 47N0fVRS026506

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">For scarthgap, it's good but not
      mandatory to have Steve on the To/CC list.<br>
      <br>
    </div>
    <div class=3D"moz-cite-prefix">On 2024-08-22 12:17 p.m., Siddharth
      Doshi via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20240822161721.6699-1-sdoshi@mv=
ista.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">From: Siddharth Doshi <a cla=
ss=3D"moz-txt-link-rfc2396E" href=3D"mailto:sdoshi@mvista.com">&lt;sdoshi=
@mvista.com&gt;</a>

License-Update:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- README: Change in copyright years as per <a class=3D"moz-txt-link-freet=
ext" href=3D"https://w1.fi/cgit/hostap/commit/README?id=3Dd945ddd368085f2=
55e68328f2d3b020ceea359af">https://w1.fi/cgit/hostap/commit/README?id=3Dd=
945ddd368085f255e68328f2d3b020ceea359af</a>
- wpa_supplicant/wpa_supplicant.c: Change in copyright years as per <a cl=
ass=3D"moz-txt-link-freetext" href=3D"https://w1.fi/cgit/hostap/commit/wp=
a_supplicant/wpa_supplicant.c?id=3Dd945ddd368085f255e68328f2d3b020ceea359=
af">https://w1.fi/cgit/hostap/commit/wpa_supplicant/wpa_supplicant.c?id=3D=
d945ddd368085f255e68328f2d3b020ceea359af</a>

CVE's Fixed:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- CVE-2024-5290 wpa_supplicant: wpa_supplicant loading arbitrary shared o=
bjects allowing privilege escalation
- CVE-2023-52160 wpa_supplicant: potential authorization bypass

Changes between 2.10 -&gt; 2.11:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
<a class=3D"moz-txt-link-freetext" href=3D"https://w1.fi/cgit/hostap/comm=
it/wpa_supplicant/ChangeLog?id=3Dd945ddd368085f255e68328f2d3b020ceea359af=
">https://w1.fi/cgit/hostap/commit/wpa_supplicant/ChangeLog?id=3Dd945ddd3=
68085f255e68328f2d3b020ceea359af</a></pre>
    </blockquote>
    <p><br>
    </p>
    <p>Hello Siddharth,<br>
    </p>
    <p><br>
    </p>
    <p>This update make sense for the master brnanch but likely not for
      scarthgap unless you can show that <br>
      this is a bug fix only release.&nbsp;</p>
    <p><br>
    </p>
    <p>It certainly does not look like a small bug fix only update based
      on:<br>
    </p>
    <p>=E2=9D=AF git diff hostap_2_10 hostap_2_11 | diffstat | tail -1<br=
>
      &nbsp;534 files changed, 85965 insertions(+), 16847 deletions(-)<br=
>
    </p>
    <p>=E2=9D=AF git log --oneline hostap_2_10..hostap_2_11 | wc -l<br>
      2295</p>
    <p>and the hostap and wpa-supplicant ChangeLogs which mention adding
      features below (1).</p>
    <p><br>
    </p>
    <p>Since the repo ( git://w1.fi/srv/git/hostap.git ) doesn't have a
      stable branch for 2.10:<br>
      <br>
      =E2=9D=AF git branch -a<br>
      * master<br>
      &nbsp; remotes/origin/HEAD -&gt; origin/master<br>
      &nbsp; remotes/origin/android-jb<br>
      &nbsp; remotes/origin/android-kk<br>
      &nbsp; remotes/origin/android-l<br>
      &nbsp; remotes/origin/android-m<br>
      &nbsp; remotes/origin/aosp-jb<br>
      &nbsp; remotes/origin/aosp-kk<br>
      &nbsp; remotes/origin/main<br>
      &nbsp; remotes/origin/master<br>
      &nbsp; remotes/origin/pending<br>
    </p>
    <p><br>
    </p>
    <p>you'll have to backport any CVE fixes that you're interested in
      unless <br>
      someone explains why this is a sensible update for scarthgap.</p>
    <p>Thanks,<br>
    </p>
    <p>../Randy<br>
    </p>
    <p><br>
    </p>
    <p>1)</p>
    <p><br>
    </p>
    <p>=E2=9D=AF git diff hostap_2_10 hostap_2_11 hostapd/ChangeLog | cat=
<br>
      diff --git a/hostapd/ChangeLog b/hostapd/ChangeLog<br>
      index 279298e4d..1c8240d33 100644<br>
      --- a/hostapd/ChangeLog<br>
      +++ b/hostapd/ChangeLog<br>
      @@ -1,5 +1,42 @@<br>
      &nbsp;ChangeLog for hostapd<br>
      &nbsp;<br>
      +2024-07-20 - v2.11<br>
      +&nbsp;&nbsp;&nbsp; * Wi-Fi Easy Connect<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - add support for DPP release 3<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - allow Configurator parameters to =
be provided during
      config exchange<br>
      +&nbsp;&nbsp;&nbsp; * HE/IEEE 802.11ax/Wi-Fi 6<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - various fixes<br>
      +&nbsp;&nbsp;&nbsp; * EHT/IEEE 802.11be/Wi-Fi 7<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - add preliminary support<br>
      +&nbsp;&nbsp;&nbsp; * SAE: add support for fetching the password fr=
om a RADIUS
      server<br>
      +&nbsp;&nbsp;&nbsp; * support OpenSSL 3.0 API changes<br>
      +&nbsp;&nbsp;&nbsp; * support background radar detection and CAC wi=
th some
      additional<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drivers<br>
      +&nbsp;&nbsp;&nbsp; * support RADIUS ACL/PSK check during 4-way han=
dshake
      (wpa_psk_radius=3D3)<br>
      +&nbsp;&nbsp;&nbsp; * EAP-SIM/AKA: support IMSI privacy<br>
      +&nbsp;&nbsp;&nbsp; * improve 4-way handshake operations<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - use Secure=3D1 in message 3 durin=
g PTK rekeying<br>
      +&nbsp;&nbsp;&nbsp; * OCV: do not check Frequency Segment 1 Channel=
 Number for
      160 MHz cases<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; to avoid interoperability issues<br=
>
      +&nbsp;&nbsp;&nbsp; * support new SAE AKM suites with variable leng=
th keys<br>
      +&nbsp;&nbsp;&nbsp; * support new AKM for 802.1X/EAP with SHA384<br=
>
      +&nbsp;&nbsp;&nbsp; * extend PASN support for secure ranging<br>
      +&nbsp;&nbsp;&nbsp; * FT: Use SHA256 to derive PMKID for AKM 00-0F-=
AC:3 (FT-EAP)<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - this is based on additional detai=
ls being added in the
      IEEE 802.11<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; standard<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - the new implementation is not bac=
kwards compatible<br>
      +&nbsp;&nbsp;&nbsp; * improved ACS to cover additional channel type=
s/bandwidths<br>
      +&nbsp;&nbsp;&nbsp; * extended Multiple BSSID support<br>
      +&nbsp;&nbsp;&nbsp; * fix beacon protection with FT protocol (incor=
rect BIGTK was
      provided)<br>
      +&nbsp;&nbsp;&nbsp; * support unsynchronized service discovery (USD=
)<br>
      +&nbsp;&nbsp;&nbsp; * add preliminary support for RADIUS/TLS<br>
      +&nbsp;&nbsp;&nbsp; * add support for explicit SSID protection in 4=
-way handshake<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (a mitigation for CVE-2023-52424; d=
isabled by default for
      now, can be<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enabled with ssid_protection=3D1)<b=
r>
      +&nbsp;&nbsp;&nbsp; * fix SAE H2E rejected groups validation to avo=
id downgrade
      attacks<br>
      +&nbsp;&nbsp;&nbsp; * use stricter validation for some RADIUS messa=
ges<br>
      +&nbsp;&nbsp;&nbsp; * a large number of other fixes, cleanup, and e=
xtensions<br>
      +<br>
      &nbsp;2022-01-16 - v2.10<br>
      &nbsp;&nbsp;&nbsp;&nbsp; * SAE changes<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - improved protection against =
side channel attacks<br>
    </p>
    <p><br>
    </p>
    <p></p>
    <p>=E2=9D=AF&nbsp; git diff hostap_2_10 hostap_2_11 wpa_supplicant/Ch=
angeLog |
      cat<br>
      diff --git a/wpa_supplicant/ChangeLog b/wpa_supplicant/ChangeLog<br=
>
      index efcc6cd9c..3f4162eb0 100644<br>
      --- a/wpa_supplicant/ChangeLog<br>
      +++ b/wpa_supplicant/ChangeLog<br>
      @@ -1,5 +1,55 @@<br>
      &nbsp;ChangeLog for wpa_supplicant<br>
      &nbsp;<br>
      +2024-07-20 - v2.11<br>
      +&nbsp;&nbsp;&nbsp; * Wi-Fi Easy Connect<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - add support for DPP release 3<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - allow Configurator parameters to =
be provided during
      config exchange<br>
      +&nbsp;&nbsp;&nbsp; * MACsec<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - add support for GCM-AES-256 ciphe=
r suite<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - remove incorrect EAP Session-Id l=
ength constraint<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - add hardware offload support for =
additional drivers<br>
      +&nbsp;&nbsp;&nbsp; * HE/IEEE 802.11ax/Wi-Fi 6<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - support BSS color updates<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - various fixes<br>
      +&nbsp;&nbsp;&nbsp; * EHT/IEEE 802.11be/Wi-Fi 7<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - add preliminary support<br>
      +&nbsp;&nbsp;&nbsp; * support OpenSSL 3.0 API changes<br>
      +&nbsp;&nbsp;&nbsp; * improve EAP-TLS support for TLSv1.3<br>
      +&nbsp;&nbsp;&nbsp; * EAP-SIM/AKA: support IMSI privacy<br>
      +&nbsp;&nbsp;&nbsp; * improve mitigation against DoS attacks when P=
MF is used<br>
      +&nbsp;&nbsp;&nbsp; * improve 4-way handshake operations<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - discard unencrypted EAPOL frames =
in additional cases<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - use Secure=3D1 in message 2 durin=
g PTK rekeying<br>
      +&nbsp;&nbsp;&nbsp; * OCV: do not check Frequency Segment 1 Channel=
 Number for
      160 MHz cases<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; to avoid interoperability issues<br=
>
      +&nbsp;&nbsp;&nbsp; * support new SAE AKM suites with variable leng=
th keys<br>
      +&nbsp;&nbsp;&nbsp; * support new AKM for 802.1X/EAP with SHA384<br=
>
      +&nbsp;&nbsp;&nbsp; * improve cross-AKM roaming with driver-based S=
ME/BSS
      selection<br>
      +&nbsp;&nbsp;&nbsp; * PASN<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - extend support for secure ranging=
<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - allow PASN implementation to be u=
sed with external
      programs for<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Wi-Fi Aware<br>
      +&nbsp;&nbsp;&nbsp; * FT: Use SHA256 to derive PMKID for AKM 00-0F-=
AC:3 (FT-EAP)<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - this is based on additional detai=
ls being added in the
      IEEE 802.11<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; standard<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - the new implementation is not bac=
kwards compatible, but
      PMKSA<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; caching with FT-EAP was=
, and still is, disabled by
      default<br>
      +&nbsp;&nbsp;&nbsp; * support a pregenerated MAC (mac_addr=3D3) as =
an alternative
      mechanism<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for using per-network random MAC ad=
dresses<br>
      +&nbsp;&nbsp;&nbsp; * EAP-PEAP: require Phase 2 authentication by d=
efault
      (phase2_auth=3D1)<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; to improve security for still unfor=
tunately common invalid<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; configurations that do not set ca_c=
ert<br>
      +&nbsp;&nbsp;&nbsp; * extend SCS support for QoS Characteristics<br=
>
      +&nbsp;&nbsp;&nbsp; * extend MSCS support<br>
      +&nbsp;&nbsp;&nbsp; * support unsynchronized service discovery (USD=
)<br>
      +&nbsp;&nbsp;&nbsp; * add support for explicit SSID protection in 4=
-way handshake<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (a mitigation for CVE-2023-52424; d=
isabled by default for
      now, can be<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enabled with ssid_protection=3D1)<b=
r>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - in addition, verify SSID after ke=
y setup when beacon
      protection is<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; used<br>
      +&nbsp;&nbsp;&nbsp; * fix SAE H2E rejected groups validation to avo=
id downgrade
      attacks<br>
      +&nbsp;&nbsp;&nbsp; * a large number of other fixes, cleanup, and e=
xtensions<br>
      +<br>
      &nbsp;2022-01-16 - v2.10<br>
      &nbsp;&nbsp;&nbsp;&nbsp; * SAE changes<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - improved protection against =
side channel attacks<br>
      <br>
      <br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:20240822161721.6699-1-sdoshi@mv=
ista.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

Note:
=3D=3D=3D=3D=3D
Patches
0001-build-Re-enable-options-for-libwpa_client.so-and-wpa.patch,
0002-Fix-removal-of-wpa_passphrase-on-make-clean.patch,
0001-Install-wpa_passphrase-when-not-disabled.patch,
0001-PEAP-client-Update-Phase-2-authentication-requiremen.patch (CVE-2023=
-52160)
are already fixed and hence removing them.

Signed-off-by: Siddharth Doshi <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:sdoshi@mvista.com">&lt;sdoshi@mvista.com&gt;</a>
---
 ...all-wpa_passphrase-when-not-disabled.patch |  33 ---
 ...te-Phase-2-authentication-requiremen.patch | 213 ------------------
 ...options-for-libwpa_client.so-and-wpa.patch |  73 ------
 ...oval-of-wpa_passphrase-on-make-clean.patch |  26 ---
 ...plicant_2.10.bb =3D&gt; wpa-supplicant_2.11.bb} |  10 +-
 5 files changed, 3 insertions(+), 352 deletions(-)
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/0001-Install-wpa_passphrase-when-not-disabled.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/0001-PEAP-client-Update-Phase-2-authentication-requiremen.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/0001-build-Re-enable-options-for-libwpa_client.so-and-wpa.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/0002-Fix-removal-of-wpa_passphrase-on-make-clean.patch
 rename meta/recipes-connectivity/wpa-supplicant/{wpa-supplicant_2.10.bb =
=3D&gt; wpa-supplicant_2.11.bb} (90%)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001=
-Install-wpa_passphrase-when-not-disabled.patch b/meta/recipes-connectivi=
ty/wpa-supplicant/wpa-supplicant/0001-Install-wpa_passphrase-when-not-dis=
abled.patch
deleted file mode 100644
index c04c608bde..0000000000
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-Instal=
l-wpa_passphrase-when-not-disabled.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 57b12a1e43605f71239a21488cb9b541f0751dda Mon Sep 17 00:00:00 2001
-From: Alex Kiernan <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:ale=
xk@zuma.ai">&lt;alexk@zuma.ai&gt;</a>
-Date: Thu, 21 Apr 2022 10:15:29 +0100
-Subject: [PATCH] Install wpa_passphrase when not disabled
-
-As part of fixing CONFIG_NO_WPA_PASSPHRASE, whilst wpa_passphrase gets
-built, its not installed during `make install`.
-
-Fixes: cb41c214b78d (&quot;build: Re-enable options for libwpa_client.so=
 and wpa_passphrase&quot;)
-Signed-off-by: Alex Kiernan <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:alexk@zuma.ai">&lt;alexk@zuma.ai&gt;</a>
-Signed-off-by: Alex Kiernan <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:alex.kiernan@gmail.com">&lt;alex.kiernan@gmail.com&gt;</a>
-Upstream-Status: Submitted [<a class=3D"moz-txt-link-freetext" href=3D"h=
ttp://lists.infradead.org/pipermail/hostap/2022-April/040448.html">http:/=
/lists.infradead.org/pipermail/hostap/2022-April/040448.html</a>]
----
- wpa_supplicant/Makefile | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/wpa_supplicant/Makefile b/wpa_supplicant/Makefile
-index 0bab313f2355..12787c0c7d0f 100644
---- a/wpa_supplicant/Makefile
-+++ b/wpa_supplicant/Makefile
-@@ -73,6 +73,9 @@ $(DESTDIR)$(BINDIR)/%: %
-=20
- install: $(addprefix $(DESTDIR)$(BINDIR)/,$(BINALL))
- 	$(MAKE) -C ../src install
-+ifndef CONFIG_NO_WPA_PASSPHRASE
-+	install -D wpa_passphrase $(DESTDIR)/$(BINDIR)/wpa_passphrase
-+endif
- ifdef CONFIG_BUILD_WPA_CLIENT_SO
- 	install -m 0644 -D libwpa_client.so $(DESTDIR)/$(LIBDIR)/libwpa_client=
.so
- 	install -m 0644 -D ../src/common/wpa_ctrl.h $(DESTDIR)/$(INCDIR)/wpa_c=
trl.h
---=20
-2.35.1
-
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001=
-PEAP-client-Update-Phase-2-authentication-requiremen.patch b/meta/recipe=
s-connectivity/wpa-supplicant/wpa-supplicant/0001-PEAP-client-Update-Phas=
e-2-authentication-requiremen.patch
deleted file mode 100644
index 620560d3c7..0000000000
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-PEAP-c=
lient-Update-Phase-2-authentication-requiremen.patch
+++ /dev/null
@@ -1,213 +0,0 @@
-From f6f7cead3661ceeef54b21f7e799c0afc98537ec Mon Sep 17 00:00:00 2001
-From: Jouni Malinen <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:j@=
w1.fi">&lt;j@w1.fi&gt;</a>
-Date: Sat, 8 Jul 2023 19:55:32 +0300
-Subject: [PATCH] PEAP client: Update Phase 2 authentication requirements
-
-The previous PEAP client behavior allowed the server to skip Phase 2
-authentication with the expectation that the server was authenticated
-during Phase 1 through TLS server certificate validation. Various PEAP
-specifications are not exactly clear on what the behavior on this front
-is supposed to be and as such, this ended up being more flexible than
-the TTLS/FAST/TEAP cases. However, this is not really ideal when
-unfortunately common misconfiguration of PEAP is used in deployed
-devices where the server trust root (ca_cert) is not configured or the
-user has an easy option for allowing this validation step to be skipped.
-
-Change the default PEAP client behavior to be to require Phase 2
-authentication to be successfully completed for cases where TLS session
-resumption is not used and the client certificate has not been
-configured. Those two exceptions are the main cases where a deployed
-authentication server might skip Phase 2 and as such, where a more
-strict default behavior could result in undesired interoperability
-issues. Requiring Phase 2 authentication will end up disabling TLS
-session resumption automatically to avoid interoperability issues.
-
-Allow Phase 2 authentication behavior to be configured with a new phase1
-configuration parameter option:
-'phase2_auth' option can be used to control Phase 2 (i.e., within TLS
-tunnel) behavior for PEAP:
- * 0 =3D do not require Phase 2 authentication
- * 1 =3D require Phase 2 authentication when client certificate
-   (private_key/client_cert) is no used and TLS session resumption was
-   not used (default)
- * 2 =3D require Phase 2 authentication in all cases
-
-Signed-off-by: Jouni Malinen <a class=3D"moz-txt-link-rfc2396E" href=3D"=
mailto:j@w1.fi">&lt;j@w1.fi&gt;</a>
-
-CVE: CVE-2023-52160
-Upstream-Status: Backport [<a class=3D"moz-txt-link-freetext" href=3D"ht=
tps://w1.fi/cgit/hostap/commit/?id=3D8e6485a1bcb0baffdea9e55255a81270b768=
439c">https://w1.fi/cgit/hostap/commit/?id=3D8e6485a1bcb0baffdea9e55255a8=
1270b768439c</a>]
-
-Signed-off-by: Claus Stovgaard <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:claus.stovgaard@gmail.com">&lt;claus.stovgaard@gmail.com&gt;</a>
-
----
- src/eap_peer/eap_config.h          |  8 ++++++
- src/eap_peer/eap_peap.c            | 40 +++++++++++++++++++++++++++---
- src/eap_peer/eap_tls_common.c      |  6 +++++
- src/eap_peer/eap_tls_common.h      |  5 ++++
- wpa_supplicant/wpa_supplicant.conf |  7 ++++++
- 5 files changed, 63 insertions(+), 3 deletions(-)
-
-diff --git a/src/eap_peer/eap_config.h b/src/eap_peer/eap_config.h
-index 3238f74..047eec2 100644
---- a/src/eap_peer/eap_config.h
-+++ b/src/eap_peer/eap_config.h
-@@ -469,6 +469,14 @@ struct eap_peer_config {
- 	 * 1 =3D use cryptobinding if server supports it
- 	 * 2 =3D require cryptobinding
- 	 *
-+	 * phase2_auth option can be used to control Phase 2 (i.e., within TLS
-+	 * tunnel) behavior for PEAP:
-+	 * 0 =3D do not require Phase 2 authentication
-+	 * 1 =3D require Phase 2 authentication when client certificate
-+	 *  (private_key/client_cert) is no used and TLS session resumption wa=
s
-+	 *  not used (default)
-+	 * 2 =3D require Phase 2 authentication in all cases
-+	 *
- 	 * EAP-WSC (WPS) uses following options: pin=3DDevice_Password and
- 	 * uuid=3DDevice_UUID
- 	 *
-diff --git a/src/eap_peer/eap_peap.c b/src/eap_peer/eap_peap.c
-index 12e30df..6080697 100644
---- a/src/eap_peer/eap_peap.c
-+++ b/src/eap_peer/eap_peap.c
-@@ -67,6 +67,7 @@ struct eap_peap_data {
- 	u8 cmk[20];
- 	int soh; /* Whether IF-TNCCS-SOH (Statement of Health; Microsoft NAP)
- 		  * is enabled. */
-+	enum { NO_AUTH, FOR_INITIAL, ALWAYS } phase2_auth;
- };
-=20
-=20
-@@ -114,6 +115,19 @@ static void eap_peap_parse_phase1(struct eap_peap_d=
ata *data,
- 		wpa_printf(MSG_DEBUG, &quot;EAP-PEAP: Require cryptobinding&quot;);
- 	}
-=20
-+	if (os_strstr(phase1, &quot;phase2_auth=3D0&quot;)) {
-+		data-&gt;phase2_auth =3D NO_AUTH;
-+		wpa_printf(MSG_DEBUG,
-+			   &quot;EAP-PEAP: Do not require Phase 2 authentication&quot;);
-+	} else if (os_strstr(phase1, &quot;phase2_auth=3D1&quot;)) {
-+		data-&gt;phase2_auth =3D FOR_INITIAL;
-+		wpa_printf(MSG_DEBUG,
-+			   &quot;EAP-PEAP: Require Phase 2 authentication for initial connec=
tion&quot;);
-+	} else if (os_strstr(phase1, &quot;phase2_auth=3D2&quot;)) {
-+		data-&gt;phase2_auth =3D ALWAYS;
-+		wpa_printf(MSG_DEBUG,
-+			   &quot;EAP-PEAP: Require Phase 2 authentication for all cases&quot=
;);
-+	}
- #ifdef EAP_TNC
- 	if (os_strstr(phase1, &quot;tnc=3Dsoh2&quot;)) {
- 		data-&gt;soh =3D 2;
-@@ -142,6 +156,7 @@ static void * eap_peap_init(struct eap_sm *sm)
- 	data-&gt;force_peap_version =3D -1;
- 	data-&gt;peap_outer_success =3D 2;
- 	data-&gt;crypto_binding =3D OPTIONAL_BINDING;
-+	data-&gt;phase2_auth =3D FOR_INITIAL;
-=20
- 	if (config &amp;&amp; config-&gt;phase1)
- 		eap_peap_parse_phase1(data, config-&gt;phase1);
-@@ -454,6 +469,20 @@ static int eap_tlv_validate_cryptobinding(struct ea=
p_sm *sm,
- }
-=20
-=20
-+static bool peap_phase2_sufficient(struct eap_sm *sm,
-+				   struct eap_peap_data *data)
-+{
-+	if ((data-&gt;phase2_auth =3D=3D ALWAYS ||
-+	     (data-&gt;phase2_auth =3D=3D FOR_INITIAL &amp;&amp;
-+	      !tls_connection_resumed(sm-&gt;ssl_ctx, data-&gt;ssl.conn) &amp;=
&amp;
-+	      !data-&gt;ssl.client_cert_conf) ||
-+	     data-&gt;phase2_eap_started) &amp;&amp;
-+	    !data-&gt;phase2_eap_success)
-+		return false;
-+	return true;
-+}
-+
-+
- /**
-  * eap_tlv_process - Process a received EAP-TLV message and generate a =
response
-  * @sm: Pointer to EAP state machine allocated with eap_peer_sm_init()
-@@ -568,6 +597,11 @@ static int eap_tlv_process(struct eap_sm *sm, struc=
t eap_peap_data *data,
- 					   &quot; - force failed Phase 2&quot;);
- 				resp_status =3D EAP_TLV_RESULT_FAILURE;
- 				ret-&gt;decision =3D DECISION_FAIL;
-+			} else if (!peap_phase2_sufficient(sm, data)) {
-+				wpa_printf(MSG_INFO,
-+					   &quot;EAP-PEAP: Server indicated Phase 2 success, but sufficien=
t Phase 2 authentication has not been completed&quot;);
-+				resp_status =3D EAP_TLV_RESULT_FAILURE;
-+				ret-&gt;decision =3D DECISION_FAIL;
- 			} else {
- 				resp_status =3D EAP_TLV_RESULT_SUCCESS;
- 				ret-&gt;decision =3D DECISION_UNCOND_SUCC;
-@@ -887,8 +921,7 @@ continue_req:
- 			/* EAP-Success within TLS tunnel is used to indicate
- 			 * shutdown of the TLS channel. The authentication has
- 			 * been completed. */
--			if (data-&gt;phase2_eap_started &amp;&amp;
--			    !data-&gt;phase2_eap_success) {
-+			if (!peap_phase2_sufficient(sm, data)) {
- 				wpa_printf(MSG_DEBUG, &quot;EAP-PEAP: Phase 2 &quot;
- 					   &quot;Success used to indicate success, &quot;
- 					   &quot;but Phase 2 EAP was not yet &quot;
-@@ -1199,8 +1232,9 @@ static struct wpabuf * eap_peap_process(struct eap=
_sm *sm, void *priv,
- static bool eap_peap_has_reauth_data(struct eap_sm *sm, void *priv)
- {
- 	struct eap_peap_data *data =3D priv;
-+
- 	return tls_connection_established(sm-&gt;ssl_ctx, data-&gt;ssl.conn) &=
amp;&amp;
--		data-&gt;phase2_success;
-+		data-&gt;phase2_success &amp;&amp; data-&gt;phase2_auth !=3D ALWAYS;
- }
-=20
-=20
-diff --git a/src/eap_peer/eap_tls_common.c b/src/eap_peer/eap_tls_common=
.c
-index c1837db..a53eeb1 100644
---- a/src/eap_peer/eap_tls_common.c
-+++ b/src/eap_peer/eap_tls_common.c
-@@ -239,6 +239,12 @@ static int eap_tls_params_from_conf(struct eap_sm *=
sm,
-=20
- 	sm-&gt;ext_cert_check =3D !!(params-&gt;flags &amp; TLS_CONN_EXT_CERT_=
CHECK);
-=20
-+	if (!phase2)
-+		data-&gt;client_cert_conf =3D params-&gt;client_cert ||
-+			params-&gt;client_cert_blob ||
-+			params-&gt;private_key ||
-+			params-&gt;private_key_blob;
-+
- 	return 0;
- }
-=20
-diff --git a/src/eap_peer/eap_tls_common.h b/src/eap_peer/eap_tls_common=
.h
-index 9ac0012..3348634 100644
---- a/src/eap_peer/eap_tls_common.h
-+++ b/src/eap_peer/eap_tls_common.h
-@@ -79,6 +79,11 @@ struct eap_ssl_data {
- 	 * tls_v13 - Whether TLS v1.3 or newer is used
- 	 */
- 	int tls_v13;
-+
-+	/**
-+	 * client_cert_conf: Whether client certificate has been configured
-+	 */
-+	bool client_cert_conf;
- };
-=20
-=20
-diff --git a/wpa_supplicant/wpa_supplicant.conf b/wpa_supplicant/wpa_sup=
plicant.conf
-index 6619d6b..d63f73c 100644
---- a/wpa_supplicant/wpa_supplicant.conf
-+++ b/wpa_supplicant/wpa_supplicant.conf
-@@ -1321,6 +1321,13 @@ fast_reauth=3D1
- #	 * 0 =3D do not use cryptobinding (default)
- #	 * 1 =3D use cryptobinding if server supports it
- #	 * 2 =3D require cryptobinding
-+#	'phase2_auth' option can be used to control Phase 2 (i.e., within TLS
-+#	tunnel) behavior for PEAP:
-+#	 * 0 =3D do not require Phase 2 authentication
-+#	 * 1 =3D require Phase 2 authentication when client certificate
-+#	   (private_key/client_cert) is no used and TLS session resumption wa=
s
-+#	   not used (default)
-+#	 * 2 =3D require Phase 2 authentication in all cases
- #	EAP-WSC (WPS) uses following options: pin=3D&lt;Device Password&gt; o=
r
- #	pbc=3D1.
- #
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001=
-build-Re-enable-options-for-libwpa_client.so-and-wpa.patch b/meta/recipe=
s-connectivity/wpa-supplicant/wpa-supplicant/0001-build-Re-enable-options=
-for-libwpa_client.so-and-wpa.patch
deleted file mode 100644
index 6e930fc98d..0000000000
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-build-=
Re-enable-options-for-libwpa_client.so-and-wpa.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From cb41c214b78d6df187a31950342e48a403dbd769 Mon Sep 17 00:00:00 2001
-From: Sergey Matyukevich <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:geomatsi@gmail.com">&lt;geomatsi@gmail.com&gt;</a>
-Date: Tue, 22 Feb 2022 11:52:19 +0300
-Subject: [PATCH 1/2] build: Re-enable options for libwpa_client.so and
- wpa_passphrase
-
-Commit a41a29192e5d (&quot;build: Pull common fragments into a build.rul=
es
-file&quot;) introduced a regression into wpa_supplicant build process. T=
he
-build target libwpa_client.so is not built regardless of whether the
-option CONFIG_BUILD_WPA_CLIENT_SO is set or not. This happens because
-this config option is used before it is imported from the configuration
-file. Moving its use after including build.rules does not help: the
-variable ALL is processed by build.rules and further changes are not
-applied. Similarly, option CONFIG_NO_WPA_PASSPHRASE also does not work
-as expected: wpa_passphrase is always built regardless of whether the
-option is set or not.
-
-Re-enable these options by adding both build targets to _all
-dependencies.
-
-Fixes: a41a29192e5d (&quot;build: Pull common fragments into a build.rul=
es file&quot;)
-Signed-off-by: Sergey Matyukevich <a class=3D"moz-txt-link-rfc2396E" hre=
f=3D"mailto:geomatsi@gmail.com">&lt;geomatsi@gmail.com&gt;</a>
-Upstream-Status: Backport
-Signed-off-by: Alex Kiernan <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:alexk@zuma.ai">&lt;alexk@zuma.ai&gt;</a>
-Signed-off-by: Alex Kiernan <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:alexk@gmail.com">&lt;alexk@gmail.com&gt;</a>
----
- wpa_supplicant/Makefile | 19 ++++++++++++-------
- 1 file changed, 12 insertions(+), 7 deletions(-)
-
-diff --git a/wpa_supplicant/Makefile b/wpa_supplicant/Makefile
-index cb66defac7c8..c456825ae75f 100644
---- a/wpa_supplicant/Makefile
-+++ b/wpa_supplicant/Makefile
-@@ -1,24 +1,29 @@
- BINALL=3Dwpa_supplicant wpa_cli
-=20
--ifndef CONFIG_NO_WPA_PASSPHRASE
--BINALL +=3D wpa_passphrase
--endif
--
- ALL =3D $(BINALL)
- ALL +=3D systemd/wpa_supplicant.service
- ALL +=3D <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:systemd/w=
pa_supplicant@.service">systemd/wpa_supplicant@.service</a>
- ALL +=3D <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:systemd/w=
pa_supplicant-nl80211@.service">systemd/wpa_supplicant-nl80211@.service</=
a>
- ALL +=3D <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:systemd/w=
pa_supplicant-wired@.service">systemd/wpa_supplicant-wired@.service</a>
- ALL +=3D dbus/fi.w1.wpa_supplicant1.service
--ifdef CONFIG_BUILD_WPA_CLIENT_SO
--ALL +=3D libwpa_client.so
--endif
-=20
- EXTRA_TARGETS=3Ddynamic_eap_methods
-=20
- CONFIG_FILE=3D.config
- include ../src/build.rules
-=20
-+ifdef CONFIG_BUILD_WPA_CLIENT_SO
-+# add the dependency this way to allow CONFIG_BUILD_WPA_CLIENT_SO
-+# being set in the config which is read by build.rules
-+_all: libwpa_client.so
-+endif
-+
-+ifndef CONFIG_NO_WPA_PASSPHRASE
-+# add the dependency this way to allow CONFIG_NO_WPA_PASSPHRASE
-+# being set in the config which is read by build.rules
-+_all: wpa_passphrase
-+endif
-+
- ifdef LIBS
- # If LIBS is set with some global build system defaults, clone those fo=
r
- # LIBS_c and LIBS_p to cover wpa_passphrase and wpa_cli as well.
---=20
-2.35.1
-
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002=
-Fix-removal-of-wpa_passphrase-on-make-clean.patch b/meta/recipes-connect=
ivity/wpa-supplicant/wpa-supplicant/0002-Fix-removal-of-wpa_passphrase-on=
-make-clean.patch
deleted file mode 100644
index 53b0fcdf53..0000000000
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-Fix-re=
moval-of-wpa_passphrase-on-make-clean.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From d001b301ba7987f4b39453a211631b85c48f2ff8 Mon Sep 17 00:00:00 2001
-From: Jouni Malinen <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:qu=
ic_jouni@quicinc.com">&lt;quic_jouni@quicinc.com&gt;</a>
-Date: Thu, 3 Mar 2022 13:26:42 +0200
-Subject: [PATCH 2/2] Fix removal of wpa_passphrase on 'make clean'
-
-Fixes: 0430bc8267b4 (&quot;build: Add a common-clean target&quot;)
-Signed-off-by: Jouni Malinen <a class=3D"moz-txt-link-rfc2396E" href=3D"=
mailto:quic_jouni@quicinc.com">&lt;quic_jouni@quicinc.com&gt;</a>
-Upstream-Status: Backport
-Signed-off-by: Alex Kiernan <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:alexk@zuma.ai">&lt;alexk@zuma.ai&gt;</a>
-Signed-off-by: Alex Kiernan <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:alexk@gmail.com">&lt;alexk@gmail.com&gt;</a>
----
- wpa_supplicant/Makefile | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/wpa_supplicant/Makefile b/wpa_supplicant/Makefile
-index c456825ae75f..4b4688931b1d 100644
---- a/wpa_supplicant/Makefile
-+++ b/wpa_supplicant/Makefile
-@@ -2077,3 +2077,4 @@ clean: common-clean
- 	rm -f libwpa_client.a
- 	rm -f libwpa_client.so
- 	rm -f libwpa_test1 libwpa_test2
-+	rm -f wpa_passphrase
---=20
-2.35.1
-
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10=
.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
similarity index 90%
rename from meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.=
bb
rename to meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
index 8113bcab09..321dedc58a 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
@@ -5,8 +5,8 @@ BUGTRACKER =3D <a class=3D"moz-txt-link-rfc2396E" href=3D=
"http://w1.fi/security/">&quot;http://w1.fi/security/&quot;</a>
 SECTION =3D &quot;network&quot;
 LICENSE =3D &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"file://C=
OPYING;md5=3D5ebcb90236d1ad640558c3d3cd3035df\-file://README;beginline=3D=
1;endline=3D56;md5=3De3d2f6c2948991e37c1ca4960de84747\-file://wpa_supplic=
ant/wpa_supplicant.c;beginline=3D1;endline=3D12;md5=3D76306a95306fee9a976=
b0ac1be70f705">&quot;file://COPYING;md5=3D5ebcb90236d1ad640558c3d3cd3035d=
f \
-                    file://README;beginline=3D1;endline=3D56;md5=3De3d2f=
6c2948991e37c1ca4960de84747 \
-                    file://wpa_supplicant/wpa_supplicant.c;beginline=3D1=
;endline=3D12;md5=3D76306a95306fee9a976b0ac1be70f705&quot;</a>
+                    <a class=3D"moz-txt-link-freetext" href=3D"file://RE=
ADME;beginline=3D1;endline=3D56;md5=3D6e4b25e7d74bfc44a32ba37bdf5210a6">f=
ile://README;beginline=3D1;endline=3D56;md5=3D6e4b25e7d74bfc44a32ba37bdf5=
210a6</a> \
+                    <a class=3D"moz-txt-link-freetext" href=3D"file://wp=
a_supplicant/wpa_supplicant.c;beginline=3D1;endline=3D12;md5=3Df5ccd57ea9=
1e04800edb88267bf8eae4">file://wpa_supplicant/wpa_supplicant.c;beginline=3D=
1;endline=3D12;md5=3Df5ccd57ea91e04800edb88267bf8eae4</a>&quot;
=20
 DEPENDS =3D &quot;dbus libnl&quot;
=20
@@ -15,12 +15,8 @@ SRC_URI =3D <a class=3D"moz-txt-link-rfc2396E" href=3D=
"http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz\file://wpa_supplicant.=
conf\file://wpa_supplicant.conf-sane\file://99_wpa_supplicant\-file://000=
1-build-Re-enable-options-for-libwpa_client.so-and-wpa.patch\-file://0002=
-Fix-removal-of-wpa_passphrase-on-make-clean.patch\-file://0001-Install-w=
pa_passphrase-when-not-disabled.patch\-file://0001-PEAP-client-Update-Pha=
se-2-authentication-requiremen.patch\">&quot;http://w1.fi/releases/wpa_su=
pplicant-${PV}.tar.gz \
            file://wpa_supplicant.conf \
            file://wpa_supplicant.conf-sane \
            file://99_wpa_supplicant \
-           file://0001-build-Re-enable-options-for-libwpa_client.so-and-=
wpa.patch \
-           file://0002-Fix-removal-of-wpa_passphrase-on-make-clean.patch=
 \
-           file://0001-Install-wpa_passphrase-when-not-disabled.patch \
-           file://0001-PEAP-client-Update-Phase-2-authentication-require=
men.patch \
            &quot;</a>
-SRC_URI[sha256sum] =3D &quot;20df7ae5154b3830355f8ab4269123a87affdea59fe=
74fe9292a91d0d7e17b2f&quot;
+SRC_URI[sha256sum] =3D &quot;912ea06f74e30a8e36fbb68064d6cdff218d8d591db=
0fc5d75dee6c81ac7fc0a&quot;
=20
 S =3D &quot;${WORKDIR}/wpa_supplicant-${PV}&quot;
=20
</pre>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre wrap=3D"" class=3D"moz-quote-pre">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#203657): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/203657">https:/=
/lists.openembedded.org/g/openembedded-core/message/203657</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/108040776/3616765">https://lists.openembedded.org/mt=
/108040776/3616765</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------YSDDcjQE4Ni0JhLBVmnLWAPq--

