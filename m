Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C09E5C79FAD
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 08:20:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6978.1788942009654844657
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 01:20:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bJX6Iiis;
 spf=temperror, err=temporary DNS error (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=371238ee91=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6896nekL544578
	for <openembedded-core@lists.openembedded.org>; Wed, 9 Sep 2026 08:20:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=yaO9HRR3avQGFxOuAl4c5gUbbfRg0WH9nbeYvS5vnIg=; b=
	bJX6IiisjEDqbzFLc5KlYzbPEqYMem3NSss4epYArhj3Lyu6lq6JgA/Re4u++uCJ
	YwcsdHV1Y7kranxGdgsNxvzk31szilJtzGAH9wrv/Qwk/qw5g11shorPH3Y7Xp+9
	zv0UoyAeKweOXl/Y59gVfw9HTVvV0dFxlZl/s+cOcbc6ebPQYLh8wqgCv40rFElQ
	Kj5FlTNbgF7vqah3qlgRetvu4gjyUJe5v58oDmxYKMXJCLU9wDoiVvb0SUlf9usr
	4oogbUOdfJED8RtjHCGri50r+9KQ+Y/0KHQ1udmTvMZv/bYOpQXMnH80Na9ojVJp
	GXUKw7qAtrugp62b/W7LTg==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020120.outbound.protection.outlook.com [52.101.85.120])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gg8rrdtpw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 08:20:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KU3NmwbFylsU7/fgWAhY86Tp6yqaqS7j/R7u10MbIuUXXpUueAm7Y0hUymVTFMa9WKKMucGQ0fCrXtID/QaOqYYxL7KFShqu3GQFwd4DYFz3N8trMDR8oycU/nuEkqVhY3S5G7QFDARMF/kGaljhVB1pM5EAtRXh0YHVja7bU7JUWl2NMFiqXW/eNjo8wgd6hV6x6Zg9224is4r19qAibKVcBPT5nunWLA+rX7JRA0mmEimbXfZOxPiAaF2473HtO0MUeAEQqHTQIlXTSFl3FxratlNMpZP6VVamuEtW4HNURpChQ7ZIjkkNsCuZxoN0FGOta+lRG0zZTuKTXx6kfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yaO9HRR3avQGFxOuAl4c5gUbbfRg0WH9nbeYvS5vnIg=;
 b=kdtHpIh/Ojec1kBuC6o7uTFujbC8tvBrWbSkmsa6zbQTCSS+Go1SyM/dHUOChRGVEKDTSCBQEJxuSN+XWVaOj38SL3A7JgJQYuyIUSP53kcXTLF9tX6zt2pBxVlJcIoBOfWNcfHqt/UMZfxl47ls0bAAJMsxIdfHk1M7U+FzBKktJoVSKfjt8iIydVLh7LOqNXun1LDnyjOHk/iMhQf1kKSylfP/WQUEWTY/EsbGKACEEnWCkt6su0ubMwOkYc5fq/VK7qv4e0oJ+tddp7udnPJapgI6Q0WdNfuhtz2+VvbseTRbB6jzZJ3D5llUYsdUJhLt5fkc1kuRIHxR6lBb6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 DS0PR11MB8738.namprd11.prod.outlook.com (2603:10b6:8:192::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.7; Wed, 9 Sep 2026 08:20:03 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%4]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 08:20:03 +0000
Message-ID: <9f9ff305-ef97-4f1f-ab38-ba112379b2e6@windriver.com>
Date: Wed, 9 Sep 2026 13:49:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [wrynose][PATCH] glibc: stable 2.43 branch updates
To: Yoann Congal <yoann.congal@smile.fr>,
        openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
References: <20260904065001.674758-1-Hemanth.KumarMD@windriver.com>
 <DL9YGDUXQCK0.3Q4ODQ2JNRJYD@smile.fr>
Content-Language: en-US
From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
In-Reply-To: <DL9YGDUXQCK0.3Q4ODQ2JNRJYD@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN5PR01CA0010.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:261::11) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|DS0PR11MB8738:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dc6f878-1691-4fdc-301c-08df0e4b25e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10067099003|6133799003|3023799007|22082099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	will/eOhfhlwyC0hNxdtjsgKq6hwgQQzq1qa6Tyr9bsiggL4gZIdQX2Hq5JpoMWC8R0ZxinBXBSjVmtpRbjXuvYj0G4upNn3geWJ1G12kZS86oyReHbGAG8e+Mc32mmgR17fZlb200HEKtUKC7R/0tAFzETYdwcqWn/iPBM5pe69cLQDqj8zUoJdt/yxXQbuCTJmuQU57C028ijMV+YpHidHuIn4haCmXgd+Od2N6kZ03M/YeIPZFshv6417wON6cIlnpSfljH6GZVvtKW5Osiy8CPe4YTccurqzQrtFDI6by3+ZI5pBrGFdK0Z30Lmm6Ne3yG6Optn4BkTmwocB/ZJQSlKH4kFVW5PaLIMKPS5d0mxyUov7mTJ176s5VDmBOu85xnnwNjNfZvF1qCPmMHBuuaQ78EUrnXuFXFnOX/MIWt2/4QJXLYi3Hg/zSpda1xBh2rSqCrs1gBY4RywkOqJZK0veF+3tCF/Lk0h/A0vbAY/EexFVgcAK7N4ZJTrZXZD23oCDoe/2SRYeQJ67a5+e4hvhJDIcA6Ah/6C95yhT4gsCfgcfagTHmKdS7SMGnHGolvfL2HFgD/HUgTMYsPEQzuIi1okdJajLxNqWi6qj508KGhI8OMH8k3BpIDtsgp8g+e6Vq5VFQZGpT4cnwjRZIV+hugwEQcdxjBDMn+A=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(6133799003)(3023799007)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Ny84d0diWmNwNnI2UUdFS0lQM3U4UEI0eXEyYnhneWxMdHhYckZnZFRBTERC?=
 =?utf-8?B?Z0puR0RHTi9JN3Yra1NVR1FaV0lJMm8rdTdCZVNDOWlzeUxKenZyUFRkR25p?=
 =?utf-8?B?MUk0TjkycFdmalRieFFSWGY5MEk4UzZYN21qbXJMUHBmOERXTUpsMmY5S0xa?=
 =?utf-8?B?cUJ5NW1Gc2pRTDNSVndSUy9DVmhFYk1hSUt2VkFzWmFvSTlISXJ6VDJoRFlM?=
 =?utf-8?B?YktVSytDY2pEZkZ5L04yOE9YeDFsYUtwYjMrVjJ3eldFdXhkaG5IbkdDMlVM?=
 =?utf-8?B?ZkJZcmhIYklOT0ZUS0RYWEFiTDAwWHJreGFhOGVVa1g0ZU10dUUyY1ljckV4?=
 =?utf-8?B?TFFlazFhWTd4QzJyU21nLzA2dnVBUUxuM0o3SHoyaEJmN1Z2V3BEbGJmS3p1?=
 =?utf-8?B?L0U4WFZZOHRjV0ZVaUFOb0c2cytCeThETTNpbzc3NVhEY0NNdWxkWktER2Zk?=
 =?utf-8?B?bm1ZOHVzSkRNYUVYRVNkQ0xvLzVycTNLckFDS1dNYVdhL0dFYnVNMzdmR1Nj?=
 =?utf-8?B?bWlQYzFkS3R0ZGlNekJZaFovNTRSK3BDQmhDRGdpV0VGeHdpS08waFM2WUEv?=
 =?utf-8?B?VFU3a1A5WlpNelJSRzNkM2NHNFFtYldHMDdkUllkakVHWlBWdFhOREtPN3ZB?=
 =?utf-8?B?eTBPV3doVHArNDdJU1RGZmo1WHJvV04xZzZiZ1U3WTV5bi8vaFdrUDNWdGJj?=
 =?utf-8?B?VzQzOHpPN0dDeS9xdjZxdVJWYW54aFkwdm5qTEFVUG9CZHhNTHVMOGQ1czFR?=
 =?utf-8?B?Q2dsZktmamwwYkhyMldMdVBncEh6MDBvbFA4NWlnVlNpU2JRQTZUQnhVTDd0?=
 =?utf-8?B?bURTaTdJZVRqTk55VXY1R2huUVREQWxldys5bDUrZFNuZ2FrbUJaOUxiMVYv?=
 =?utf-8?B?bGdocXZycVZhOFVJQ3o2ZWJQRllMQWlIbzcyODBUdzBqNElwaVU1VmV6VVZM?=
 =?utf-8?B?bmc1T1JmOVRES0tLRHV1RVpWU0owMGgvUzFaNExiamlmL2o2b3prQlEwTnI1?=
 =?utf-8?B?eG0vY0VNcTBaOU8wVnFQVkl0dmk4Qk0vNHRaZUJaMkl1cDRsbzg3bEZyNSt3?=
 =?utf-8?B?dGpsci9ObzZiZ0RZdjkvTkxBbldNNzkvNEJiWE81M3JrbVFOMUNlcTRUNEJ6?=
 =?utf-8?B?SnhIUUZNZGtNVy9DdXZBYkRJS1RvNHFiVUlPSFhnNll4VHRkdDN2eHljVmJr?=
 =?utf-8?B?UlAxbGlISkorb2Z1OVBSbVpScVFvQzlGZjRjTVUwTzBEZFJVSGV5UEd4ZU9q?=
 =?utf-8?B?ZUJrTXRjamJMRTVJUkYreWJ4Zjl6dXBIUFlzaGd0alpqZy9zQjJ4YWdlSVgw?=
 =?utf-8?B?Y3YrYzI4WFpMZnpnQnIvTUFFanVLbmhrNFpKZkxzYkpndDZVNndkNDlDK1lx?=
 =?utf-8?B?VnUvQy90VHY2ejRHZk0vWEtPdlV4SW5Zdzl2U1R5RzgyYWxYMnRLcEs1aS9O?=
 =?utf-8?B?RnN6cG5XeWRDeEd1ODlWSjJuWEE3S0ZXZkdtdEpqc2RrZHYvcmFOclVLcjUx?=
 =?utf-8?B?K3o0SnhRdHJVU0xrVDlaV3lQZ3lDYTdKSlI1ZE9PSzA0aW9qVzN1WDh6cWo5?=
 =?utf-8?B?amlkYWxqK0N3d1IxN3hOYTFSc0V3bEd5NWM2YzZHblFCSmwrWWwzcDVZT3JN?=
 =?utf-8?B?cmxTSXNtSjdNYWlVeDI5ak11WTA1Qnhsa3h4VkNyb3pLbEw0TEU3RnVIaDhz?=
 =?utf-8?B?QlBzd0d4OTV4d0MyWEN3b0hIYjlRa1NWaUdYQXozS2d2NnF5TWpOdVUvN2Yy?=
 =?utf-8?B?RGZ2L2lESEJiK2JoWWJndWxXbnNsb3ZGRlVuRWFKR08zVm5aMkpjdS9ZVnRI?=
 =?utf-8?B?cDBVVExGMEt1STNsakRFTytWMWVZUlBQTGs1NktIeTJkR3N3S1VmSGlxZlBX?=
 =?utf-8?B?bHhRUTg5SFh5WXpXSFRIc3BXRWYvYUliRkRMeGY0OVBYYk43bVNBM25MKzNr?=
 =?utf-8?B?Y3RPMitSQnhPVzFwRFBqdkV0aE41Z2MrQ2hWazZzenVwbXA5Ulh1NlZ6dEt1?=
 =?utf-8?B?U2ltLy8wZzY1MnBQS2lRSG1Oa2w5VzFXM2VLRU9kVk5ub1FjSVpSOG1oM2ZW?=
 =?utf-8?B?T1ljc2FoNE9nRnZ3eVpkY3dyblBzT1JZYTZZelVmQzRldGZ4SURBOFQ2c3Bp?=
 =?utf-8?B?TUcvOFBXdDFwbUpoQkpicXNwQWk3NkEzNUlaM2x2Ym16RXhhVzFnd3llSTh2?=
 =?utf-8?B?c2dZaGxnR1lTck5UN3BqaDIzWXQyYVRFM0xlMlBiNHBDa1d6M081R0RNUjZu?=
 =?utf-8?B?MzZNVWpnRDZiK21pYVNtSDMxVDVzS0U0UWhtMFpGQ0plZDBNbHJKc1ZvZWhu?=
 =?utf-8?B?S0NzWFBYeDh5RTB4clFmTWxHSzc5NlcxclRtTFh3T1IvblZWdkc5eWxOWk91?=
 =?utf-8?Q?yBlc4xuAon0LCc4A=3D?=
X-Exchange-RoutingPolicyChecked: 
	uWCQFQoVtbpau+LfEKhFr+RJpEvzkaqut80ZRD7i9EizTqP/fQh3Q6YZP2++YrCAE1Vyww3XfI1+/9QUcY6d9BG4gB2rGaTXqTcIpg9d/hqNt1S2Z8/b02+uVUCCGe29Ib9zhTlfBujHz5yUa/Jpr6Bjv+YwKJb+05RZ44kit2vbcGNUvN1GhpdCwTtmyXWoR1dn498nWdZFG5iFwsUgyOPL2L1VX+lydnMtfZVJ+uVjYcMF9+lk4jCpKghwe5Ofyxs5vlANg32zdeWpF/YotpEtTRpwCGVIi4CJBqL/+Ch3bU/ikJOXtiNbaGZ5mPl/gf7FBlDgX+pKMx/7GMj40A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dc6f878-1691-4fdc-301c-08df0e4b25e2
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 08:20:03.4233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mvkkqHd240IaryycNKWBxzUgt94DRZ7LeoeXbzdkZW5YBF3FRd0e/VGrd8wMFoEydbSqTeOm+FQBpoCwO1F5A/G1z0aGBIuBk+IvQoUnF3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8738
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: pijHn1WZHKkf9vbfrL2jNbQD2TWXYzqw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA5MiBTYWx0ZWRfX3/k+lVpV9Qih
 2Ow4EtkTvWBxkk+WIpfW6ZS69OB4/71XKi8vY1D7QR0o3+7Q3/19t1e5njbtf5Hcq4GiRjFKSin
 F06B18EMZxTmVYhV7BF0WGnZ5RLuPRWTu+14jNBl/mIzLounOOyT
X-Proofpoint-GUID: J5l8Hc2XJ_pD65cnIAA2qDnbR57gxs9f
X-Authority-Analysis: v=2.4 cv=boF8wkai c=1 sm=1 tr=0 ts=6aa116b8 cx=c_pps
 a=NZ0yFJJwKHxD90Bh/jZbXA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=CCpqsmhAAAAA:8 a=lXcVUTf83a841gKuuoQA:9
 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA5MiBTYWx0ZWRfX7/3acqma4jl4
 XLb16X9MfErLyNLU3dq9+hnxD0Cz8ORZ7gwYUjrAR/K7ebwXK0NPsG8DlSGZ3UNl8ZWs4+TkUXr
 VPBQEq4VjDaYxeumAwNBoVp83rXqs7tuuiQTYQwiiF+2jVK3ldGZSXKxFR1cQiLkqt0G4XHUu8Z
 l5H2LBi4y5yH6hauya2DyDIIkR889avdjHSIpmRS/B1h2pRupQBGmIcsuyEv+4vE3y4NDGNmGGH
 Ukb+EOwaazWOVXXLAmJ63ULpV8hpQeSqV2BCmO5p8XRAVPA/O5zuQlc32jvWL4UUbWEKk4j24qE
 4ehMSzrPbx6w3thAiybSZ5ggCVYrz7PRvk+FPxou3L487U9jTZ0g8zZYSijS6mVv77e5LId5XxW
 muGaMvvxxacU08EHMrV+wbMPFQHwEcCmGvSBIneCEysZovqw+q83DoS4bqug2Pn+9kcgbfo5KSL
 8TgnPGgbarC4cCNoMhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090092
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 08:20:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245453


On 08-09-2026 06:35 pm, Yoann Congal wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Fri Sep 4, 2026 at 8:50 AM CEST, Hemanth Kumar M D via lists.openembedded.org wrote:
>> From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
>>
>> $ git log --oneline 1c9988e52540c844928c6d93ff45305adc2c24a0..8dad0ee453a9bd9d24e55daba85e70915b29e19d
>> 8dad0ee453 alpha: expect test-float32x-float64-div to fail
>> f024355965 alpha: add the denormal trap enable bit to FE_NOMASK_ENV
>> c4dac931ab alpha: Fix stack alignment in makecontext
>> 76115597fe alpha: fix setrlimit compat symbol for negative rlim values besides -1
>> c29ca5d216 iconvdata: Test case for bug 34556, bug 34568
>> 3ad1bbd8f9 iconvdata: EUC_JISX0213 decoding lacks pending character reset (CVE-2026-80489)
>> 138c43f018 iconvdata: SHIFT_JISX0213 decoding lacks pending character reset (CVE-2026-77117)
>> 713998bf00 stdlib: Fix right-justification in strfmon (bug 34510, CVE-2026-19499)
>> 2a35bab35b posix: Remove unnecessary overflow check in wordexp (BZ 34090)
>> 4964178b4d m68k: remove sysdeps/m68k/m680x0/fpu/w_fmod_compat.c (bug 34559)
>> 0afa34adb0 misc: Fix out-of-bounds array write in tdelete (bug 34506)
>> 7d26579873 malloc: Show hugetlb tunable default in --list-tunables
>> 8017bcfc4d m68k: Fix fmod/fmodf infinite recursion (BZ 34508)
>> a388c4002d posix: Fix wordexp WRDE_APPEND to preserve state on non-NOSPACE errors (BZ 34090, CVE-2026-6368)
>> bc95068f5f ppc64le: Restore optimized memchr for power10 [BZ #34300]
>>
>> Testing Results:
>> +--------------+--------+--------+------+
>> | Result       | Before | After  | Diff |
>> +--------------+--------+--------+------+
>> | PASS         | 5818   | 5821   | +3   |
>> | XPASS        | 4      | 4      | 0    |
>> | FAIL         | 1071   | 1071   | 0    |
>> | XFAIL        | 16     | 16     | 0    |
>> | UNSUPPORTED  | 402    | 402    | 0    |
>> | UNRESOLVED   | 7      | 7      | 0    |
>> +--------------+--------+--------+------+
>>
>> Changes in testcases:
>> +------------------------------------+--------+--------+
>> | Testcase                           | Before | After  |
>> +------------------------------------+--------+--------+
>> | iconvdata/tst-jisx0213-progress    | N/A    | PASS   |
>> | posix/tst-wordexp-append           | N/A    | PASS   |
>> | stdlib/tst-strfmon-bug34510        | N/A    | PASS   |
>> +------------------------------------+--------+--------+
>>
>> Justification:
>>
>> commit - c29ca5d216 iconvdata: Test case for bug 34556, bug 34568
>> Adds the regression test for the EUC_JISX0213 / SHIFT_JISX0213 pending
>> character reset fixes (CVE-2026-80489, CVE-2026-77117).
>> +PASS: iconvdata/tst-jisx0213-progress
>>
>> commit - a388c4002d posix: Fix wordexp WRDE_APPEND to preserve state
>> on non-NOSPACE errors (BZ 34090, CVE-2026-6368)
>> Fixes WRDE_APPEND state preservation and adds a regression test.
>> +PASS: posix/tst-wordexp-append
>>
>> commit - 713998bf00 stdlib: Fix right-justification in strfmon
>> Fixes right-justification in strfmon and adds a regression test.
>> +PASS: stdlib/tst-strfmon-bug34510
>>
>> Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
>> ---
>>   meta/recipes-core/glibc/glibc-version.inc | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
>> index cf5a444095..6d667ac95c 100644
>> --- a/meta/recipes-core/glibc/glibc-version.inc
>> +++ b/meta/recipes-core/glibc/glibc-version.inc
>> @@ -1,6 +1,6 @@
>>   SRCBRANCH ?= "release/2.43/master"
>>   PV = "2.43+git"
>> -SRCREV_glibc ?= "1c9988e52540c844928c6d93ff45305adc2c24a0"
>> +SRCREV_glibc ?= "8dad0ee453a9bd9d24e55daba85e70915b29e19d"
>>   SRCREV_localedef ?= "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
>>
>>   GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
> Hello,
>
> I've not tested/reviewed this patch yet but, for the next glibc upgrade,
> can you please put a partial sha1 in the patch title? That would help me
> and my various tools to differenciate between the different glibc
> upgrades.
>
> In this case, something like
> "glibc: stable 2.43 branch updates to 8dad0ee4"
>
> What do you think?
Hi Yoann,

Sure, we can follow this convention for future upgrades.

> Regards,
> --
> Yoann Congal
> Smile ECS

-- 
Regards,
Hemanth Kumar M D


