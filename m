Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7698BCAC58E
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 16:56:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2664.1757609782401040388
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Sep 2025 09:56:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DWiP8RnC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1349732c48=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58BB7FX23944507
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 09:56:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=QbQfsfVTyryo2WanMtq6fj
	p1ukLgX4o+Z6OUCTbL5XA=; b=DWiP8RnCNcOA6E+OkZ8H1J+SEixcbAwr4H4hO2
	FlHh9Q2brMG5yllev+iexwHuMYAAzj/iphH7AsX3191N4K61dKdljQUUMSB2bSvH
	hiT72wYec00YwK73h5RrvMMioGisw+8GncfYy3N9U/PJq0dLS2M2qu9bFpWa/OY1
	VZs+MesfjUP73RBRjZg3sUu4YnYkT2WUqp9iTyc4EWR3grA+Kykt0yW0ywKbclIu
	JbNp6qMsDWc/w87gM7ADzfUKF/L+Pp0h79o43iLPafsnqw28WMgLHn33GutNSv0d
	zhyNSV/Z+BoUM7Vsa129it+C9Z6yuHtQvCqVNH7ZO1XdOyXw==
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2080.outbound.protection.outlook.com [40.107.102.80])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 490g80e1e8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 11 Sep 2025 09:56:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JqWyYTwLbS2u05BbDKoDSdtOl/gbnmNagAniKPBPcJyRUR5KucPE9U82+9FfCNMceOFJnyIJM+Fc3vEr1LnEczwQ9MdflkMlCq76cCl0e9o5/R4SHOatiDAyz4vjKOgPC35p34Gqg9QbBACxlZt2aoc/cGnjNq3+QEbg7yzSMLxRFaJmekWimnEsVPDE0TAed4pIE/b5MDWM9t6NQbijt1deAVEQ/pYh9EcUbOGw3TjhttGXjv32grlOOWjUgtkztHGsfwC26D9BOOe99tfb3MCPFkhjyoi0ijmgJ1WyBchLEQVLMsSVP7hL5uNliKowLe1FACvXklm22Vm/DGoouw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QbQfsfVTyryo2WanMtq6fjp1ukLgX4o+Z6OUCTbL5XA=;
 b=xuJZDxlQx1XAGTvYHmiJlDEkwepF0ZV6EhaFJKpdwsCDwlZz5FQ408FxJqqpMisvU0zgKKo1E/l1tUnbIw7acDVzkS60A4P9AwLDPDCwYaTN7XJmrl/ruo+OhZuAFW/QMhENRAE1NHGtD8J7LhyfBbZW8lPE+M7nviarQeKXwBlhlYTfdK4grQ1qD+fNkIk72fJmmZuv3LfEranbUOBYzKiaLeIvaiB7Ltbcw43nqFatCEbu5cqvxaJRRLTW2kNQS8w5d5cSr/3k/nx4268heZr6pnD94Qmen/DWUg0nsxY9evc3CombTTCD+hVhRdzDyvICTR4uAFuimV032pt+iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by MW4PR11MB6837.namprd11.prod.outlook.com (2603:10b6:303:221::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 16:56:18 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 16:56:18 +0000
Content-Type: multipart/alternative;
 boundary="------------KIoTa5cImloHmsPoloLVejOA"
Message-ID: <16907d6c-a28d-4369-95fd-199fcccba105@windriver.com>
Date: Thu, 11 Sep 2025 12:56:16 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 0/1] wic: updated fstab does not preserve
 metadata of the original file
To: mathieu.dubois-briand@bootlin.com, dani.barra25@gmail.com,
        openembedded-core@lists.openembedded.org
Cc: hongxu.jia@windriver.com, trevor.woerner@linaro.org
References: <20250902190555.7929-1-dani.barra25@gmail.com>
 <DCK51OC59LCA.XXERUU1OP7Y@bootlin.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <DCK51OC59LCA.XXERUU1OP7Y@bootlin.com>
X-ClientProxiedBy: YT4P288CA0010.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d4::10) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|MW4PR11MB6837:EE_
X-MS-Office365-Filtering-Correlation-Id: ebbc15d7-1061-4af0-0467-08ddf154204e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|4022899009|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?a1h2RUlFQ0lZcFVodnlpWDNnNmZrYnJiODJRRXA0R3FhOWl0d2duVStpN1R0?=
 =?utf-8?B?cHVqbmlTbTltQnV3c2N6M0hXTVJwaVdROUFSZTM1WVJaKzRPMHE5a2NmM3I4?=
 =?utf-8?B?bEFBdjJadjVOQlJtYmliVXRJdS9RaUVhV3JTcE82aVpLaW9oWTRqL29rOTBy?=
 =?utf-8?B?a2RvamN1UHNHWG9lRXZ3eW1WRWxRYktJOFV3T2xramp1ZVd5eDFGQU1IS3E5?=
 =?utf-8?B?YmxUTVZ5Rkx1T2Z0aS9mZ2pBVjZ1QnZ3c2c2Z0ZSZ0RUYzYwdUxobG9Tckp6?=
 =?utf-8?B?QlZXaFQ4aFJBTGRNU1BuOUxnV1VyVHkxdGlvNUxwdHN3ek1nbnhld0FlL1FK?=
 =?utf-8?B?Z21oQXo0a09ZaDArT1FGUE0vc2ZFbGw5NzVrMUh0TWZmcjFMWnlNa1VwKzdH?=
 =?utf-8?B?TWw4NEZUbkMyYWpXb1g0emYrdTZDdFk0OW9ENm5TWnNLR2NCR05aQ09pTGZ2?=
 =?utf-8?B?bzhOdjlLMmhPbzQ1TFZxNjRQSmpnejBJWnRyTzZPVUROVlkxOEkzYmtLNnJT?=
 =?utf-8?B?NTdKNTA0cDE1UjdSbXRVRm9tNlc3VnJiVzY3RzVOUk00NCtrRGY4Sjd4dWRW?=
 =?utf-8?B?MVE3YlI1WTlXbEJlczFBcEV2VjNYNUpJRjArdHRONCtZSkR5bnFHd0svZVNE?=
 =?utf-8?B?bC9YcTFkL1J0Ukc5cUtwWVpiUE9aZmppNkh3ZkNHYkcxK2lMSVlTTVRWbDhn?=
 =?utf-8?B?ZFViMGhTWkl3Z1ozR0Z5M3N6MEhFcG92Y3lIcGlRa1NqTm1wT1BHRnB0QnY4?=
 =?utf-8?B?eVR6NmNXZDlSVWo3TUUxS3kxVG9ENWN6ZEljNm1ISkJ1UEU0OTlVbElIK3dD?=
 =?utf-8?B?OU1zdFZvdE1MWkRlWmh1b3RIZ2NIc1F5QmJLRXR0blIwUWpkL040MEltV2M0?=
 =?utf-8?B?bXpERU1rdlE0RXltbkdBWElHejhkbjdDRUJVSjlLMkFiNVJKeE8zRTlTQ1hE?=
 =?utf-8?B?OFFySjRidW1ZV3hNUzVPaVpMRXU1VjFIZmJxL3VFRm5pNzJiK3E3VjVuS05I?=
 =?utf-8?B?dGlWVTlLT1NadDZNdTA1YXROZ2taQ1N0Yi9ibnZQMndHdjBnV01vZjBrYThU?=
 =?utf-8?B?VW1zbEVuTkF4WCt3dVhJSFF2bGJvMi9HQ0FYU01HNDJDQVNWRnNrckpyYUxX?=
 =?utf-8?B?UGV4MFF0WitoS28wOHlEY0p4TEl0a205b2NxbW5xdlZWQXdmbGRXcngrMndG?=
 =?utf-8?B?SklFSCt4UWIxVUk5cXA2dlBXQlRUK3JiL2FQTmJjSHhBTlNEV2d6eTRrMmpx?=
 =?utf-8?B?RFBGcDlzaGVUQ1ZjcEtzMnBDc21ZbTBRcFlZTlFFUWxJN3JjN1VLQk04QW91?=
 =?utf-8?B?S3RKUEpsWWRrNUs2Z09OZzBjUjlGWDlOaFdLLzlnN3pWRFplcmNtTEcvUXoy?=
 =?utf-8?B?SVpQWmRqdDZxelZkZGZuSU9nV0REWld6N1pxaWdnR3EwaEtMV08wSFUyUnNQ?=
 =?utf-8?B?MlpvcGsxT29MQ0QzbTRtRjNYSkQxTHVIYzZGMTFudSthOGc0b0hMY01wd2o0?=
 =?utf-8?B?OGFZakJRakluYkUzVG1yaGUxTHVSdWJsRUdsa200cHF4a2d5V3VBd3ZFeHNK?=
 =?utf-8?B?TTFIV2hYV3BFcFN5cDc1VnZQZ3dtMTNxRzlrU3ptb3VoQkZ6Z0lZaTYzd282?=
 =?utf-8?B?UzhxaThHaVNRNHM4dGlSYUhFMHFOb3JMMVNkNW5sdmY5MmRtaEZnNG9XRlp1?=
 =?utf-8?B?QkQ2NXBleEsveXhRZmg3TGlWTVFmY1pxV2xvZ21UZGsvSVRHQ2FZSnR6cGRr?=
 =?utf-8?B?QVk2WDFEUjI4ZVRCeHZHa0RIS2E1WW1DVkFmNVVkdVRCRHYwRXJnU29sVFlk?=
 =?utf-8?B?TVlJRXFoREZPaTBBREMzZE5PQ3E1Y2xzSHJKU1l2dXdEZEwrdmtham9oZEJT?=
 =?utf-8?Q?64Rpd8Ozcr873?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4022899009)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?V20rUi9RZmppZ05GMWUrcFd2UzUxN3Bpa045RUhrNk4rWFRmZ2ltOE5oa2Ra?=
 =?utf-8?B?SVBkR0RyeUxQN3l2RkliZzlLcmFJamFXcU12VzEvbXdxeUxJanZ0MWdaN3pv?=
 =?utf-8?B?KzUrZ2txQ3lSL1RSbE5CbkZZYjYxVXl1c3RyRUR3V0VyM0RPNk43T2ZrVHBR?=
 =?utf-8?B?RzZqZEt3RmNuY2xOdnE0Z2tDYW1sZGwwYWc0emtINy93QVRvUUZqY2VtV3dm?=
 =?utf-8?B?ZnI0dEVBbFpxNXFPTGU1UklqczVLMTlBeE03bjN1WjAvcjR1TkxjeENFTEhQ?=
 =?utf-8?B?Vmd4UkpBUGtkdnVDVm1qQ0kyYVphSHZZUkJoMXR6YXNMb2s1Vkx1UGFMcGtV?=
 =?utf-8?B?NkdkM0g1TzZBY3I1UVJ6MlpleEFmN3lqN3RvYjZJQkFUbWJ6OE9XdFFCN0tZ?=
 =?utf-8?B?RFF0SS9sV3FzZTRNUklrdVluQm5Fdzd4T1lyVmpERUgvbWdqNmFuVkUxNE1O?=
 =?utf-8?B?UEFyTHB4Tk5lcjdjamZ4WFluSGZVQytkcFBUYWZ4Y293cHAvRnZ0VjQvNEJj?=
 =?utf-8?B?VHBzc0JoZnZIWlRuYVFCRTVBSFVac3JHNXMxRkpVK2QxSWpndFNFb3YvbG8w?=
 =?utf-8?B?cGQ4Q2RxMERCRnkwZExFZThyY1pzQ2hJWFMvSk8vL01acUwrYnI5ZlMwS2or?=
 =?utf-8?B?TU0rcDBXUXlOWTRub3ZnUkN2VDlwT0FLTWo0RU83UlZXQjZsWEU4NTM4dzln?=
 =?utf-8?B?QWlsV0l4OEpPZUozcmR4bXdQM1ZiaUZoNjJzQ2d6bjQ1WStpT1czaGZmL2p2?=
 =?utf-8?B?OEJocDZMNm5MbDI5Z0p3L2lQVml5cVhndVJMRkttRUs0S2oyVXhKU1lzOUlF?=
 =?utf-8?B?Q3hZMHJBdnh4QnVxVnJxZGJrbEVEdlRMM3JMQXJYYlBhVUtFYlJKWnBLUThB?=
 =?utf-8?B?eVNCM0hqaFp6WTFudU9mdkdKWEtyWWQ1RWRBaUhFYmhLNC80ZEpja3Y5WVFZ?=
 =?utf-8?B?OExna1lIUU1vNlBEZk45bytLV3BiVFA2c1VKUi9ld3NQZ2dyWlVLQkZnWkRo?=
 =?utf-8?B?UlVlRWpmcnNHYTVDdVU3N3h2YjNhUWhreFFRK082MWdwZm9YQ3JLbTJUMzV1?=
 =?utf-8?B?dnJ5UGFVWEZKVW0zSU4zVmdycmNHUXQzOVZmSW8rdXFid0g1ZE9UeWl6RjAy?=
 =?utf-8?B?NmJuNll0Y3A3NmQydytrckR6c3hiVnA2eE4vWTh5eXBZZnpxL0IvM0ZRT3B5?=
 =?utf-8?B?SkJ3WWYvanFjRGFDQmZkTUNGUmxWc0JFZFQ0MGlhNTRJaklQc0t6bDVML0NP?=
 =?utf-8?B?aGpsbWtwVnZISVVzU3JWMURqYVRBSXpkRzBtMDJwZW5ET1RyUmlJNkVNSmhp?=
 =?utf-8?B?amxqTklMb2NXWXhTQmtaMmFjSlh1UE53Z09iTXJyRS95TFJDcWpuYmtuV01H?=
 =?utf-8?B?dStpeUg5Tlp0VU9SYjA5Q3p0UHU1Q0VxWVJoemt2VmE0c25tWkZVR1dDWXRQ?=
 =?utf-8?B?b2FPSWRMcGJvVTJRemZJV0RTbDZqa1B3ZXR0NDNnMTU0WmNVNmo0cU9UK0FN?=
 =?utf-8?B?emtodk1ieW9xaXFqaW9LY2tYV2Zua3M1VEhlNzhGR0pyYWY4aVRiZ21Oem1h?=
 =?utf-8?B?QWxyeUxYRW5ETXRtSFZzWXZZUFN4RmFvZVk1aG5ZY3QwZHJoRml0VWt6UWpa?=
 =?utf-8?B?Y2IrN3lYRjNEMUc3Zno4TlQ1UzZBVG1UNG83UlpNaVFjRDkyVE9RV2dzTXJz?=
 =?utf-8?B?YlhvZm51ZUZ3VXdRZjkvZlZVNWVsTjlWNTllTVlWd0RGZ1hCL3JTUFREMXl3?=
 =?utf-8?B?OUlkTUNVeWpPN2NkVStacmtiUi81cnJXTjJYNlI4UjJTZEszOGgyMmx2V2I5?=
 =?utf-8?B?UW8yZG50Z29UcFZwQVRKUHhPYUU1Vkh6WEtKK2pLcWl3WUlmL2c0VHdDaFpH?=
 =?utf-8?B?Q01YaEhqNnM5QmxDZ05MbGlaWmcya0s1SEI0UVdVU3NSd0hOSW9NbnR4TTY4?=
 =?utf-8?B?VFoxMThhMng5T2JoMEZ0ZWJuTWVWamJSOEtoT29kUDkrR0MzNVo0RHF3dGxq?=
 =?utf-8?B?WldSMjdDbHlvSXhITjZmRVJRVG02ZEFod0tZY21IOXlmaEZMY3JleG1UK0FG?=
 =?utf-8?B?YmxRWXRRR0pkUkMzYlo4RUNTeWZlZm9TZnNURzFDZmZ1Q3RyakZkSi9HOVZa?=
 =?utf-8?B?OEw5a2MveEtreVZvaDRhbkRmYXdXdU5MQS8zNXVjc3F2cnNMVzJGSVJzdktJ?=
 =?utf-8?B?V1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebbc15d7-1061-4af0-0467-08ddf154204e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 16:56:17.9825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +qIRBG1F2v16+UImREOEkbkLInf3bqRRSl2wE/rgH28PC3pJLNmAwCzaNatZQzFOs4WvwCmLAcqWxXIVnU3xQYr3b7EE7k6wtNqRA3r1aVE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6837
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: lk72qVwXzs1DP_hs31iNtA2R6mcFO6hN
X-Authority-Analysis: v=2.4 cv=RaOQC0tv c=1 sm=1 tr=0 ts=68c2ff35 cx=c_pps
 a=jHt2LEqBz83fb7eelIN2eg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8
 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=e-vWT-HjQ2sjwPvoj8AA:9 a=QEXdDO2ut3YA:10
 a=P-IC7800AAAA:8 a=cv-LXyGVNsmZpyiWcRMA:9 a=LWPGE9IJkgjZJA4C:21
 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: mQzJhyLFvRvaQKqXCkPc5uzLF8RCZK4z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTExMDE1MSBTYWx0ZWRfX0WF3E/UTd5uy
 yX43XGGA/um+YYWrMXDu5uMjDzAONj+TIY4mMommtcp18prO250QhbypisYICz6hzkp5LdLiG8l
 Fi/n37fAQ6FZnpSvLvDwh1EjV8bkWVg+f+Nr4uvs4e/FPvwGXfZ8hovIpydqZyhOFlvOm34Bc3f
 6vOkoTm8+04fyBw65LNeXPJcd9h03R40pQUMYD6O0b9FXWT+9ViDraRMsKAZVCHDvy87hrmLDM3
 nieK05cVgEMmn4FJgkJdXUYglnoQ78OPE10dZsCijfrtvAmJ4LgmP5vG9gYCQOJ1bGKRN6VDbda
 MOr6SOps1HlV8CH1BpAbCwTIapeyau2jhc3Gq1T27j6qOnnvJAmRf/9k963LoM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_02,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 16:56:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223291

--------------KIoTa5cImloHmsPoloLVejOA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-09-04 11:58 a.m., Mathieu Dubois-Briand via 
lists.openembedded.org wrote:
> On Tue Sep 2, 2025 at 9:05 PM CEST, dani.barra25 via lists.openembedded.org wrote:
>> From: Daniel Andrade<dani.barra25@gmail.com>
>>
>> Using `install` in the rootfs plugin forces fstab to be replaced entirely, meaning that even its Inodes will change, leading xattrs and SELinux context stored by pseudo not to be applied.
>> The fix just uses `cp` without preserving attributes from the temporary fstab since none of them are needed, just the content.
>> Same thing happens with the predefined mechanisms for ext4 and msdos. Using debugfs there is no way to replace contents while maintaining metadata, so the approach taken on the path was to remove the different fstab logic for those fstypes and also use the same modified cp command. Reviewing the builds I did it seems to work for all of the fstypes.
>>
>> Another problem is that the timestamp applied to fstab is not the same as every other file. It seems like the `SOURCE_DATE_EPOCH` variable goes to the fallback timestamp (`SOURCE_DATE_EPOCH_FALLBACK`).
>> Since you are using that variable everywhere, it is not the same value as ` REPRODUCIBLE_TIMESTAMP_ROOTFS` under `poky/meta/conf/bitbake.conf` that is applied in every other file.
>>
>> Daniel Andrade (1):
>>    wic: Content of the temporary updated fstab should be copied into the
>>      original not replacing it entirely.
>>
>>   meta/conf/bitbake.conf                   |  4 +++-
>>   scripts/lib/wic/partition.py             | 15 +--------------
>>   scripts/lib/wic/plugins/source/rootfs.py |  4 ++--
>>   3 files changed, 6 insertions(+), 17 deletions(-)
> Hi Daniel,
>
> Thanks for your patch.
>
> It looks like it is breaking a test:
>
> 2025-09-04 15:28:11,112 - oe-selftest - INFO - wic.Wic.test_no_fstab_update (subunit.RemotedTestCase)
> 2025-09-04 15:28:11,113 - oe-selftest - INFO -  ... FAIL
> ...
> 2025-09-04 15:28:11,114 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
>    File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib/oeqa/selftest/cases/wic.py", line 859, in test_no_fstab_update
>      self.assertEqual(bf_fstab_md5sum, part_fstab_md5sum[1])
>    File "/usr/lib/python3.12/unittest/case.py", line 885, in assertEqual
>      assertion_func(first, second, msg=msg)
>    File "/usr/lib/python3.12/unittest/case.py", line 1251, in assertMultiLineEqual
>      self.fail(self._formatMessage(msg, standardMsg))
>    File "/usr/lib/python3.12/unittest/case.py", line 715, in fail
>      raise self.failureException(msg)
> AssertionError: 'af3c087d6c9131735c8d1f270a226892' != '9edb8255abd217fdb20e118833afb856'
> - af3c087d6c9131735c8d1f270a226892
> + 9edb8255abd217fdb20e118833afb856
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/2412
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2268
>
> Can you fix it please?
Ping?

I think this is being tracked by:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=15947

"WIC does not preserve metadata when updating fstab"

Btw, we were just following the "Need Info" process during the bug 
review meeting
so that's why I'm sending this email.

../Randy


>
> Thanks,
> Mathieu
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#222962):https://lists.openembedded.org/g/openembedded-core/message/222962
> Mute This Topic:https://lists.openembedded.org/mt/115043355/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux

--------------KIoTa5cImloHmsPoloLVejOA
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2025-09-04 11:58 a.m., Mathieu
      Dubois-Briand via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:DCK51OC59LCA.XXERUU1OP7Y@bootlin.com">
      <pre wrap="" class="moz-quote-pre">On Tue Sep 2, 2025 at 9:05 PM CEST, dani.barra25 via lists.openembedded.org wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">From: Daniel Andrade <a class="moz-txt-link-rfc2396E" href="mailto:dani.barra25@gmail.com">&lt;dani.barra25@gmail.com&gt;</a>

Using `install` in the rootfs plugin forces fstab to be replaced entirely, meaning that even its Inodes will change, leading xattrs and SELinux context stored by pseudo not to be applied.
The fix just uses `cp` without preserving attributes from the temporary fstab since none of them are needed, just the content.
Same thing happens with the predefined mechanisms for ext4 and msdos. Using debugfs there is no way to replace contents while maintaining metadata, so the approach taken on the path was to remove the different fstab logic for those fstypes and also use the same modified cp command. Reviewing the builds I did it seems to work for all of the fstypes.

Another problem is that the timestamp applied to fstab is not the same as every other file. It seems like the `SOURCE_DATE_EPOCH` variable goes to the fallback timestamp (`SOURCE_DATE_EPOCH_FALLBACK`).
Since you are using that variable everywhere, it is not the same value as ` REPRODUCIBLE_TIMESTAMP_ROOTFS` under `poky/meta/conf/bitbake.conf` that is applied in every other file.

Daniel Andrade (1):
  wic: Content of the temporary updated fstab should be copied into the
    original not replacing it entirely.

 meta/conf/bitbake.conf                   |  4 +++-
 scripts/lib/wic/partition.py             | 15 +--------------
 scripts/lib/wic/plugins/source/rootfs.py |  4 ++--
 3 files changed, 6 insertions(+), 17 deletions(-)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Hi Daniel,

Thanks for your patch.

It looks like it is breaking a test:

2025-09-04 15:28:11,112 - oe-selftest - INFO - wic.Wic.test_no_fstab_update (subunit.RemotedTestCase)
2025-09-04 15:28:11,113 - oe-selftest - INFO -  ... FAIL
...
2025-09-04 15:28:11,114 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File &quot;/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib/oeqa/selftest/cases/wic.py&quot;, line 859, in test_no_fstab_update
    self.assertEqual(bf_fstab_md5sum, part_fstab_md5sum[1])
  File &quot;/usr/lib/python3.12/unittest/case.py&quot;, line 885, in assertEqual
    assertion_func(first, second, msg=msg)
  File &quot;/usr/lib/python3.12/unittest/case.py&quot;, line 1251, in assertMultiLineEqual
    self.fail(self._formatMessage(msg, standardMsg))
  File &quot;/usr/lib/python3.12/unittest/case.py&quot;, line 715, in fail
    raise self.failureException(msg)
AssertionError: 'af3c087d6c9131735c8d1f270a226892' != '9edb8255abd217fdb20e118833afb856'
- af3c087d6c9131735c8d1f270a226892
+ 9edb8255abd217fdb20e118833afb856

<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/2412">https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/2412</a>
<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2268">https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2268</a>

Can you fix it please?</pre>
    </blockquote>
    Ping?<br>
    <br>
    I think this is being tracked by:<br>
    <br>
    <a class="moz-txt-link-freetext" href="https://bugzilla.yoctoproject.org/show_bug.cgi?id=15947">https://bugzilla.yoctoproject.org/show_bug.cgi?id=15947</a><br>
    <p><span id="summary_container"><span id="short_desc_nonedit_display">&quot;WIC does not preserve
          metadata when updating fstab&quot;</span></span></p>
    <p><span id="summary_container"><span id="short_desc_nonedit_display">Btw, we were just following
          the &quot;Need Info&quot; process during the bug review meeting<br>
          so that's why I'm sending this email.</span></span></p>
    <p><span id="summary_container"><span id="short_desc_nonedit_display">../Randy<br>
        </span></span></p>
    <br>
    <blockquote type="cite" cite="mid:DCK51OC59LCA.XXERUU1OP7Y@bootlin.com">
      <pre wrap="" class="moz-quote-pre">

Thanks,
Mathieu

</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#222962): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/222962">https://lists.openembedded.org/g/openembedded-core/message/222962</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/115043355/3616765">https://lists.openembedded.org/mt/115043355/3616765</a>
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

--------------KIoTa5cImloHmsPoloLVejOA--

