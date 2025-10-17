Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3763CCD199
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 02:56:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7314.1760669813891288198
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Oct 2025 19:56:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=G9PBjuds;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2385795b49=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59H252X92340856
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 02:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=4kpu4fbiJjpvuS5w4vQqk3+/h6F69OpfpG4NQUBKpjg=; b=G9PBjudsNxle
	G1ZULlo3p+DzPlMDXSocio2Gz5clPmPAB/S04w3z1z27hUTWrZUuodPMwtmm6nGS
	ZrS0YRDQmOYJaOrSz3l/iS5++M4jdQDPihNpoye0EQxd/tAjLv2TrCFazeEK8Gz4
	0TY7xcCN6WSiZe3dZe5v67/6kJ0SjJkSf1zYQf5nTWFVK+1GhOC/I8Wb5JHB61vZ
	dgIPF8HFYUf3QtAY35tmRsC85zhCwqYJUSDmg2ic1evwYkkckRD4ISCX84IfX29F
	CJD+Nn38gqCxvIoY05l5iulAWs19rNxdPhPss3u50lEyCWtV54GxIaQTIniC3YBy
	zN0jLMCg7A==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013009.outbound.protection.outlook.com [40.93.201.9])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49sthhbk0y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 17 Oct 2025 02:56:52 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PZNOyBK9avSVLykYWsKd4ie+LHW6b11R+8ah8xd6qJ8cnar0L8FTfVcoz8g5DQi4M42HHHftduyt3pFoDOz7F0/P+kp+Z7jn0iYucfCn8HQZhQV5yANnnDwzm28ih2VitiBn34yMNkOOPadVVo+9DYgHiJw64rajR5qMeX8imC1s6qaI6Hp0jqh77xuuls/+I5Mrqik5uqv0l6wqQTVRIblCDYQ3eOAEYCcXrNw/yc6IQxM4Ylf78jQc4Z3SB814zhN3w1d1L0dhWjc9voue7zCFYvDenGZZKqhqoIPG0VWBhUj1jgN6SXongCgKVBTJQ/fZPluRRavy/cVSboWlAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4kpu4fbiJjpvuS5w4vQqk3+/h6F69OpfpG4NQUBKpjg=;
 b=a2C9h4EtD4XNOT/djsvNtf2IPD5I1J1UU95LqtZqIiMBbPoCkvo/zm6P10j/ENq7s9SvDnsrXJynNBqdMU+UZbxwxdxCtq5JY96IKRNTrbROiyHuWH7MWebODbhi8fsll3Q0LPg2s9H/M3BIrT9ntoffNFjuOLuiWaF1ibi/7HnmxMt1z8iiNc3bLrzxU9DrFDH/xmJBwFoiyUSHpk8bZH4LxeFH5zIyvWNLt5MOaz1rDs7oVO+qnPFF9zitNxgVOpQMs6u9JhO7bTGpNZekRRdH7BVujJTO9nLYTWHPn/9D4lA4BTBVGkqC0Fe4F9x2uVu/q8DHcpTEGWueoZvBXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MN2PR11MB4550.namprd11.prod.outlook.com (2603:10b6:208:267::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 02:56:49 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9203.009; Fri, 17 Oct 2025
 02:56:49 +0000
Message-ID: <a7d6a359-5a4d-4314-939f-3fa97627bdc2@windriver.com>
Date: Fri, 17 Oct 2025 10:56:43 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH V3 1/2] base-passwd: add clock group
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20251016084700.1537381-1-Qi.Chen@windriver.com>
 <DB5PR02MB102130824E86A46D0A830FB03EFE9A@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <DB5PR02MB102130824E86A46D0A830FB03EFE9A@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR06CA0006.apcprd06.prod.outlook.com
 (2603:1096:4:186::19) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|MN2PR11MB4550:EE_
X-MS-Office365-Filtering-Correlation-Id: 19740e6a-099b-4e1e-f095-08de0d28d14c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?U1NXa1BQaHBHZVFXRWVkbjVQbjB4UHBlU0l3dUJRaUVzYW1HUkVyS0pKdVV5?=
 =?utf-8?B?MWhueGswOGlGWEgrY0dsY2dLbHkycnJvQ1c2K093aUN3cTVjN2ZuNCtSNlVh?=
 =?utf-8?B?bXc5MHp1Snk2eDN1UzVpc1lBWWEwYVpyT09WUDNCZ0o3QjZ2OVVRWkozQ1lO?=
 =?utf-8?B?dUh0MmlGMURvbkJVWHlGZnBZNjc2Rms0V3F1aDYyamdpN0RucWl0blkrcXZN?=
 =?utf-8?B?NjZJWHFnMGZ6YUp3WWVJc1FLQ2NoaFFPTnJqdUIwaSt0ZXlKM0lTWlh4UWNE?=
 =?utf-8?B?cnBnQUYzL3BVSTZZOXo5RDQ2RDB0c2hKVEVwVmVCMFJ4OVlPejV3UTloWkwz?=
 =?utf-8?B?TzhEQ0JWL250by9EbENSZlJkaFNNcXZiK3loODdhRWhCdkl6N2RTdWdPNGIx?=
 =?utf-8?B?aHBjcHBRNDdHaFlORzJ0QWJ4RkZUUlBDcm0wT2NxeWRuR09iQ0FJRnEwbzlo?=
 =?utf-8?B?aXIxT01RY0RHVExBSjJFeE1qZ21tczZyVVZmemJwQiszYUxCMVM0cGpVUnho?=
 =?utf-8?B?UUpYakcyNFB2ZGdhK1Jaak1oTXYxSEgxeVR5RjRwcThKYXNkQjcrZHM2NWhL?=
 =?utf-8?B?Nm1Tc1NHME9SdURFZ3JvWUhraldhZzllWjViMHZtZUJXZmE0UTMza3JMU3lQ?=
 =?utf-8?B?Q081b3oxQjZxWXlvQUZqU041d2FjNHBsaGgrWk85dUVQZ1ZWcmhHYkd3NHlj?=
 =?utf-8?B?ZDlXNHluZlhtSGtTOGhVb1FKc25hdXRkVmsxRUlDNXVwd0Q4QTJPRmE5Y25O?=
 =?utf-8?B?V3krbkRBRUdHZE80OGdSVk1IU2VIN3VtUzNQaFZoQitlR2oyZmgxZlN4R1Rn?=
 =?utf-8?B?bmt1NThic3BEZ3JHNkVtQW9LNEN1QTNTK0R2N1BPYTRVMTdPak5yalloeEpt?=
 =?utf-8?B?ZFczcjZPRit5UGxOU05ZVjl3bWRkR3JrdUhNRllFcDZEeW5qY2dhQUN4Qnls?=
 =?utf-8?B?TTdBVHJ6ZXB6dW9iNFVvMUVja05ycm5MaDRPbjlWeU44WHd5RmxUUWw1SkZh?=
 =?utf-8?B?ekhqVExsdlAzdnVOV0JyRk1xMWI1eGlsb1pXS1QxQXdKSVBCY0Fzck8yWWRr?=
 =?utf-8?B?TDc0c2pieTFrb2JMVTE0SERVK3ViUWNnTldENllnZ0kzREdUZ0dNOWFyVzh5?=
 =?utf-8?B?UXlHaVliUDQ2R1NzVVN3WXlWdndiQjdkTVZBSkJoK2l6UWxzQ0FZVjJURFFS?=
 =?utf-8?B?WW43dElTcExWdDRoSlBWaWI3MS9WRWpQdmVEaEFvZlEzWWo2SjhTOWVDcjha?=
 =?utf-8?B?NzdWb2xuZmszUUw4N1VMNWhyU2Y4bDVvdDlLdklLZU1NdHVOMUJxWUJNNWxl?=
 =?utf-8?B?MmRIRnN5bnZXeUFML3hmQnVpRktTcG1lbUJUZjcvTytvSWc4SkN6UHJ5MFY0?=
 =?utf-8?B?WFVkWjQyYjNXZDRxMldoc1RaR1RsdTlwKytjOWVVeFFNYXNLS2NWeFB0RkU3?=
 =?utf-8?B?QWNveVJMV1dvRXpQVjl0UXoyZHVKZEthdm51bFd2dE92djJQcEFNdXd0Vk1j?=
 =?utf-8?B?QXBHY0w3SFRNdUpnWUk1amRHSUJ3M1JxTm5SVnVpbVIvNHRyTU1NSVppQjh2?=
 =?utf-8?B?ZGFqVTcyNTJBeFJGZ0lqMnpLV2NnS05uUDVnOWJjOERNc1NodWQ3K2pNQXd4?=
 =?utf-8?B?MTB1UHNtZlY4TTROY1ZGS2ZFbDJpQ2VORWk3M0RXTWF2TmpKNnYzMjIyVEQ0?=
 =?utf-8?B?QXlkYWlYV0RVN0lWa3FqdE9NMWVzakc4STdXOXlkREJTNitiV0ZHbUtSVVM1?=
 =?utf-8?B?TGg0Sm01N003bWJKakRvT3FDNGRjTzNZaENGblRIR0M1VXVaUVovZWFHZ0N0?=
 =?utf-8?B?N29hKzVXeWJMYS9OSjQxVk8rWFozSlRoYTlGMmJhNGpYb3FsTWxQQ3pobnYw?=
 =?utf-8?B?ZjFKRklneFNQaTdYQWdmSzh1NjIrQ3FJU0c1RnRmNzZLVnc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TDhXRzV6czhMaCtZdHBVc25qMSt3amh2TVRnSE1xN0JYajZOLzB3aElGL21o?=
 =?utf-8?B?d0JVbG5yK3dQMURUSVNVbGJkUmhNODhnWng0NGhXMUJCakptWHVyTDArR2FF?=
 =?utf-8?B?b0tJelVJWFF0K2RsK3VlWW5EdnJ0VnEyUTY5V0pvdnU0eUc5MjJtcGQ1TER3?=
 =?utf-8?B?cDJyVzZSa1FxR3ZRYUNKV1p4dkhIWlpVSHNiOUtKT21JYWI5YWM0cFZDbEQ3?=
 =?utf-8?B?QTRyT0c5UnRNRnMwRzgzTUJkaGFCS1cweHhibDJsb3VJUlFWWDFNcWZONUZi?=
 =?utf-8?B?dFgyMGt5Z2dydGZoYnlxNHpUOXF6Nm0xL3lTc0M2RlVOazROK3N1dEJ6UTFh?=
 =?utf-8?B?Ymhra1hWVVFCVExEUUlVS0Y5TXdTQUhIWU56WUJqMi9lZjh3OXZPZnF0Yllu?=
 =?utf-8?B?VlBGTktYZ1N2MytEL2JLYitRckVtUjBGd1J4Sm5iL3JxUVVuUVRlL0lqZURD?=
 =?utf-8?B?Uzluczl4VXRzU1Q3L1U0Q2dxdll5dm91dStSY0tEUE8zZGlpNnZZYitRbEZu?=
 =?utf-8?B?QkpRS290VUZxUWptZVA2OWx5MGpoSlkvSWVXcXRYWHBFbm1jMGxqaHMyVitq?=
 =?utf-8?B?OWJYSHRHaDFxbWJWNXFCaTBhQ2V5bUsxMlpxeWJqbHRRdVJBbWhCSDUrQ2tS?=
 =?utf-8?B?Tms1RERGTE5ibUtGYzN5MjZsK2tBTDEyOVJKNDUwVW1DNGJ3dFhXck5ZZTFn?=
 =?utf-8?B?MmYwUWtuT0F2SW9lN2M5RVBoM01qenUxVzBXMlJwTHNYQitqekNpYWVmYUNX?=
 =?utf-8?B?VTEyRnF0Z05HNFNqMmorSVBSaEF3aTJMSFVRVWRLTTM4bm4wZmpzK1hhdEUw?=
 =?utf-8?B?TThqRGVSU0ViMVlSYjNLdmoxUXUyN0ViS3IzMzIzVlk3aGhTanFQRW1zamZF?=
 =?utf-8?B?dlMzeENwY0gvVXRDWWpZenFXdXdTOGkvUS9LS3dsNHhSVVluNzZvejBMZVg3?=
 =?utf-8?B?VjBQeGlNYTBUbE5QbnpmSnlQVGVTODU5RlIzZFJVUk50dW80cFZEeE1GN1ZJ?=
 =?utf-8?B?ZElCTjZWNkV6VlZlZlY2Y1N6OFNQR1hIejRkQm04WTBhOUtKalZDeGNjQ0J0?=
 =?utf-8?B?R1JrY1B1dnNZL25XTjJaNVdaaEUybU5SNGozaDkxZXVFd0x2U2R3SjZ6Nmtv?=
 =?utf-8?B?bFhnSTlEVDVTemp0WlFZQmI2b2VPQjdQdkovZXMvOGIzMVlwSmFLNkJmMWdO?=
 =?utf-8?B?UVhHZ0lJNTcySVcweVRrakp2NlgxVzlsUkdjRGYvWWJwUkRwL2xaZlRVajI3?=
 =?utf-8?B?Um9BUjI0eHhVM3RJZ1RSdURQVWhNejBPdTFxRnFjRjBrU1JSc3I2bTdzanZn?=
 =?utf-8?B?dmlKMmN2eG1uSE85bmRKbzNYaERCTnVFYmRsSVlKYlVic0I1T1JjN2VldHhu?=
 =?utf-8?B?QW9FU3B4anVGVUM5bkdITmhvOTlud2tGbUl5Y1F2Tk4yR29RTEZJUE9SZFUv?=
 =?utf-8?B?UjVhbFc0Zmhad0pHOThKVmZNaGVRait2NGNWbGlnbEtUS2RCbU5uR2xudFJX?=
 =?utf-8?B?bnF1dDVob3Z2NDhMa1BZSXYwQndoTUUxZThrM1ZDZVQyelI3WUx4K0dyME40?=
 =?utf-8?B?Z3lpMnlpMysrNEVUVFM1cmEwUnlZRDFGRzZUUy9NQkhRWjBoRHNDOG5BNVEv?=
 =?utf-8?B?YWRNUlpPU0xqQ2Z5TFR4R0kwaHJ3TVBqb0t2YjZDa0ZOVFUvMTRPMkdFZkx0?=
 =?utf-8?B?bnkyeUdtUVR5djR3NmgxT1lNTkZPckdCcUo3TnBsS1F1WldXOXNHRyt5UW11?=
 =?utf-8?B?cHcyb2VQdmNLQnR3bnMyUlJRTFdYK3QwVFRLRFJMN3RiTVNJSmFGRXcyUVpC?=
 =?utf-8?B?dUUwQi90YlV3MW93dzlleEdSdTZUT24zcC9IYkV1RTFvdDU0R0dQUnJoc2xK?=
 =?utf-8?B?bDhJZmM4R29QNDg0TFBIdmZiNDN0bnNIa3ZTK3RRbEFOMmxvSGZDTHRFK1Zt?=
 =?utf-8?B?MS9UZytLamIvZnE5MUt6N09jQzZidi96b0Z2Uk0rRVBIVW1XT0VrNmFCWVYx?=
 =?utf-8?B?d2tFUEFHQmJkZXNEa3JuaXNvTWtzdTNPOVF3Rk8wMkViZi9EZ2xkR2FSMThT?=
 =?utf-8?B?dVhxMml2elZMUjRJV1cwOEllTTBVSkJxNk9KZUlyWXZWbU42V0ExU2NaVlVx?=
 =?utf-8?Q?Gw9NtYRT2oXB5GFiFiLA76dKm?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19740e6a-099b-4e1e-f095-08de0d28d14c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 02:56:49.7227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0zR9XDGK8PyZlP4K+AwMz4j1+GfGl1isSjQtyX2EHT8eZOVsqQxzDFTSMN1jB6wiGtFH7K4V6wS3aeGv8j+Muw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4550
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: OFYQNhmwJ-rR7yPB1F2U0e8a-gn7EljO
X-Proofpoint-ORIG-GUID: zEZN93KOpw81x3dVKFvNspnxB8Uqvb4Z
X-Authority-Analysis: v=2.4 cv=QLBlhwLL c=1 sm=1 tr=0 ts=68f1b074 cx=c_pps
 a=bo0f5OQ5EW/jR9k4kEC/jg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=danhDmx_AAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=3TBGsGSGVeN4nhLCRNEA:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE3MDAyMCBTYWx0ZWRfXzom4OL9NpOif
 a8Eu3OmVbzNOrQWbTdy0qQdpCOPNgEeTC1mLVD+mdWZ9VBIqTe60DqtzG60oNxrnim+FTbfOxgb
 8FRS5W58toRtpczI2bweC5ST2T5fZte/sXxJo3ent02QoGTZ3AsH96OT0Wg/+ezjYDVvL9rk7Pq
 4FS8M8C7jomPHVEJVbvryoFrl1PRmRCB2gsFRRPG6WTp83z68TE3foFXoNJDWW+G3xEiQV9cdlw
 KLIZqJma/cMGz0RDlEmSOxsJ4wIWqjEHiyqNnsbhStZ6aYoxBfQkbWjZDxPRYXMrtsAs9IObn6B
 IPeUvRbJP+KwHr78bNWtD6N4QP/iUR0pXQA6c/fMOFy0f/dVA8ni2EyWyXvwIg5BvdferiemTi7
 lhgxyzeizRx6HbS6Os6F+c26ZrLg8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510170020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 02:56:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224989

On 10/16/25 17:49, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org> On Behalf Of Chen Qi via lists.openembedded.org
>> Sent: den 16 oktober 2025 10:47
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core][PATCH V3 1/2] base-passwd: add clock group
>>
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> New systemd version (v258) introduces a new group, clock, to
>> "enable applications like linuxptp to open clocks without root
>> privileges".[1]
>>
>> This results in warning at do_rootfs time:
>> WARNING: Group clock has never been defined
>>
>> Add group clock with gid 81 to fix this issue. The wheel group's
>> gid is 80, so 81 is chosen. And as the patch to add wheel group
>> was not accepted by upstream, directly mark this one's upstream
>> status to be 'Inappropriate'.
>>
>> [1] https://github.com/systemd/systemd/commit/af96ccfc24bc4803078a46b4ef2cdeb5decdfbcd
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   .../base-passwd/0001-Add-clock-group.patch    | 34 +++++++++++++++++++
>>   .../base-passwd/base-passwd_3.6.7.bb          |  1 +
>>   2 files changed, 35 insertions(+)
>>   create mode 100644 meta/recipes-core/base-passwd/base-passwd/0001-Add-clock-group.patch
>>
>> diff --git a/meta/recipes-core/base-passwd/base-passwd/0001-Add-clock-group.patch b/meta/recipes-core/base-passwd/base-passwd/0001-Add-clock-group.patch
>> new file mode 100644
>> index 0000000000..1cb22a05f7
>> --- /dev/null
>> +++ b/meta/recipes-core/base-passwd/base-passwd/0001-Add-clock-group.patch
>> @@ -0,0 +1,34 @@
>> +From 4b3a8f347179d7e2a1062eeed13a6474deb28728 Mon Sep 17 00:00:00 2001
>> +From: Chen Qi <Qi.Chen@windriver.com>
>> +Date: Thu, 16 Oct 2025 08:48:49 +0800
>> +Subject: [PATCH] Add clock group
>> +
>> +The clock group is needed to "to enable applications like linuxptp
>> +to open clocks without root privileges". See the link below:
>> +https://github.com/systemd/systemd/commit/af96ccfc24bc4803078a46b4ef2cdeb
>> 5decdfbcd
>> +
>> +Note that this group is needed as long as people use udev from
>> +systemd because 50-udev-default.rules needs it. See the above
>> +commit.
>> +
>> +Upstream-Status: Inappropriate [enable feature]
>> +
>> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> +---
>> + group.master | 1 +
>> + 1 file changed, 1 insertion(+)
>> +
>> +diff --git a/group.master b/group.master
>> +index e54fd1d..6f84539 100644
>> +--- a/group.master
>> ++++ b/group.master
>> +@@ -39,5 +39,6 @@ staff:*:50:
>> + games:*:60:
>> + shutdown:*:70:
>> + wheel:*:80:
>> ++clock:*:81:
> Why does this have to go here. Why can't you just update the
> GROUPADD_PARAM:${PN} in the systemd recipe to create the clock group:
>
> GROUPADD_PARAM:${PN} = "-r systemd-journal; -r clock;"
>
> That way it is only created if systemd is actually used.

I consider this clock similar to the 'wheel' and 'kvm' groups. 'wheel' 
and 'kvm' groups are added here, so I put 'clock' group here.

 From my understanding, such groups are likely to be used by other 
applications (recipes). You can see this from the original commit: 
https://github.com/systemd/systemd/commit/af96ccfc24bc4803078a46b4ef2cdeb

It's possible that applications such as linuxptp will use this clock 
group. What systemd (udev) does is to change the device's group to 
'clock'. This means applications using those devices could be put in 
'clock' group to be granted access.

Regards,
Qi

>
>> + users:*:100:
>> + nogroup:*:65534:
>> +--
>> +2.34.1
>> +
>> diff --git a/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb b/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb
>> index 177927d674..e4e0890293 100644
>> --- a/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb
>> +++ b/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb
>> @@ -13,6 +13,7 @@ SRC_URI =
>> "https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar
>>              file://0005-Add-kvm-group.patch \
>>              file://0007-Add-wheel-group.patch \
>>              file://0001-base-passwd-Add-the-sgx-group.patch \
>> +           file://0001-Add-clock-group.patch \
>>              "
>>
>>   SRC_URI[sha256sum] = "cf869870fed7862b57bfa9e99cd5cd6f365e2349705a1b65af7fc182629bd1ab"
>> --
>> 2.34.1
> //Peter
>


