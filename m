Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3EC7CA101F
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 16:34:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.23576.1757522054425679861
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 09:34:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=VlkXZ+7U;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=134864cbda=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58A5jZRc3643424
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 16:34:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=li93+tX+a6R2p9tuvMPpJY2toFCy3IizAzoy0fNOSyk=; b=
	VlkXZ+7UMHDOfq5VVW6YJBRuFZH9C3fS3fbnjnWutXWdu0J+gO3cnUZw5vB2/RiX
	OcFei7PozSBZAz+iIpd+usQ35EnRPUe3jmQBjWkKia/TqOavQL9Q8gYhrjIqHkVc
	1da4VtDoyQXOrXV1Dnxc7tc4qh8dzGyZr0Br1TNIjwDvn8K23iEa0gsb+DBhzHQg
	J+OcK0whCmQUTZE8rDKMPedLfLs6fAyoS1s9rmpFsfR/euYNLXqnRUDKRPIOKKp9
	/L3wdVQ4Q1EyLR9xqsQpznC7FMlujzBhBFDp7tRTgNONaLs7+bK8O0XJCfcjXEzy
	g1t4qzo+gYCbdu1rT45ryg==
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2048.outbound.protection.outlook.com [40.107.100.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 491ve3324n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 10 Sep 2025 16:34:12 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gQ6nMoymCC3gwbiNJebs+cICSCNpFNYeAyWZAbSJodlbwRQ//Ax9L5eRSge2z+S2mXbj+NDNfFLEbN6w3yjt6B0zTdvGUuEDjXjsU+ZksUYUnftyhnwPUfCHPkRV0gLMfOsXG0wWfl1rIeVyFd6ET5KQpmpyOO7dTE8owjj7Yb9jlKYmybqb6K3mThELNv3tRN47uQskYnmLu6hgPbDxvU2m7WnH+rmf6bRp5L3ZFDIEo4Yy0s4DRdp/iJzu1MjsuKTSk3XR35P+I39+BNXVT1UolFWu3XversmYoSbOXaENLy03yfVmJYD0u56HagS7c8+vW4F80/4vvC4dzsFlqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=li93+tX+a6R2p9tuvMPpJY2toFCy3IizAzoy0fNOSyk=;
 b=sZdLqR0W6ObyCOlvBZCgdQ9HnTIdfIkJ10/+/AanqRBViP3eiyiaAfvvXRaQJ51RopzkF3M/7NXrq8idgXbGkFWoIKMMwmoDPavGfb3YIePFip94JPYAMDpOYczPEbcKleYneofoXzO2NhOGmay/xdgUf0r7OlflCToq550oy3G3RwZ2FPkUZp+Ex4SIJKXhVL/e+dykWWPo/QByKiXZCsMYx95fpWARaEkp38ZTu+b5NO1bWKIZYxzpa8hWa01y4oZNfX+9/k1FbWKlB43Cr3ufCycYFqKAiBmRgQ1o6ubnL7r4w7XIanY3+5+KPX5NlIzXp+HR+m+DbK1L5CC2yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 MW3PR11MB4764.namprd11.prod.outlook.com (2603:10b6:303:5a::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.22; Wed, 10 Sep 2025 16:34:11 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%7]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 16:34:11 +0000
Message-ID: <23dd8abf-716f-4f21-8375-1b0a102170fa@windriver.com>
Date: Wed, 10 Sep 2025 22:04:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: Clang - Question on dropping D144541 clang patch in OE
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
        "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>,
        "MacLeod, Randy" <Randy.MacLeod@windriver.com>
References: <DS0PR11MB79014CF356CC7621C30E755AE00CA@DS0PR11MB7901.namprd11.prod.outlook.com>
 <CAMKF1spW9RueDyMXqj5oTqhfkq6csjPP7CaOc3Jwk2gx4V=Xyg@mail.gmail.com>
Content-Language: en-US
From: Sunil Kumar Dora <sunilkumar.dora@windriver.com>
In-Reply-To: <CAMKF1spW9RueDyMXqj5oTqhfkq6csjPP7CaOc3Jwk2gx4V=Xyg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: PN3PR01CA0035.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::14) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|MW3PR11MB4764:EE_
X-MS-Office365-Filtering-Correlation-Id: 294f4310-7169-4c73-9dd2-08ddf087deee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VWFoR2o5RVVIczc0bG1nWE9PS2lSQXZoMHByNXM5UXhFcElsS2FzdThsT1Uy?=
 =?utf-8?B?c2pTdm1WaWtyOGZteTBBSFl5aE9NZVFmQUlFK0VpQXpnR0hYUXF2ZmxrZ3Ay?=
 =?utf-8?B?ejBoTjFIa1B5T01JODhLUVl2WVBhK3dyL0s5Ti9vNFBUZVVkS3grUGU3QjdP?=
 =?utf-8?B?N3ZCeHFxUHp4OEIrUnRLUUl5Z3hOTFc5aVNyNEVPRTNiRXU3S1VMUFEvMCtW?=
 =?utf-8?B?dkp6YTlieC9lcGh1dVFNN28yM1V5cld3VTVVNnBqK1ZGbUlieFl2WElEdStw?=
 =?utf-8?B?RTB4by9vdE5yaFlxUnZSUjM2WllGeDJkOXpMMi9hZWJFRk8xZUF2TXJFYmF6?=
 =?utf-8?B?aElybGcyVUlQSFdoUHNmMGpkWWNVd1ZES0dGY2JWQmpicXFqL2srdWRkTWZW?=
 =?utf-8?B?UXQwVTJHOHQ4TUNkbEJ1dlRRL3pLTlZ1cmQ0Zk5NY25nSjhNYzRuQ2hCY1hj?=
 =?utf-8?B?bnM3YlBOMUhwVHM0bGdDQWNSMmo0S2ZvQnRHZXFUWFMrbytBNzRlc0U1K0dC?=
 =?utf-8?B?UUJzbWowVTYyV3VaUS9KSU5rSEdsOGZhWmNaK3A5blBEM0JCbWU5Q0xadUdZ?=
 =?utf-8?B?cVVFdktKUjJDTWxlT0dpZW1HaU15bEk5VklqbXoxUDgrblkrQlhJSEJsMEJ1?=
 =?utf-8?B?WXBwb0hJWHNDRWIzUWFBOXNEOHkzQ3pxZktTZmVaOVcyUjBTcWw5TUkxbk5D?=
 =?utf-8?B?VDlkeElhRFJUU3FxKzJTZEhzRU51MG91dXdMVDlXWkxNUzBrWE53b1p0aFJw?=
 =?utf-8?B?TStMVCt2NHVWVHJKVmpXeGZvTHRMZk5Bc0JETkV0aEI5dDVPZExicXhVcmtt?=
 =?utf-8?B?STNwU1V0L2dWbkRuVGxhU3lUMGFZQjBLSVdGN01JWk5QMkVkeHdCYlJWV3RE?=
 =?utf-8?B?RmpvOUNidDlrakorb09hWE5PYURBZE5MMDMrOEVGUWJzU0psWlBBR3Y2bjVW?=
 =?utf-8?B?UnBQaDlWcUxCME5XbHVLZXV4bi9kRllmWmxGcm5DYUVsTnRVZjJPZVdZUWpY?=
 =?utf-8?B?djcraFpKMTl2TWVjRmdRa1YzREpHaVlCS05PZFF0ZFVKbmJ4eDA2Nmd1ZkRh?=
 =?utf-8?B?K1FvT24zRFJ0bk4xZ0lON1NYMWlJOVBMV2laQks0c3BRdm95dVF3NmtVL2dt?=
 =?utf-8?B?SWJBRE1jZTd1WVp3bzBraWx1TS9lbTdSY2N6MjhKS2plRURHNTliYW5pQjBt?=
 =?utf-8?B?NmZCWWlkaW9iMklPdjVmOHJXQVpkMnlGdFA1ellEcFNLakJablV4WktZNStx?=
 =?utf-8?B?T01hUnRjWlpZTU1mdjdDSk0zNG9lclhTQlFPbk5SUXcvajAyQzl5LzJpcWVN?=
 =?utf-8?B?Mm80RkpXcXM1dkoxM0R4THRkc0ZxeXd5MS9XQUEzVXhRZy82ZUFESnUxb2Fs?=
 =?utf-8?B?NFVseG5KQlBiU2ttbWdGS1YzZWE1MzBuZ0FlcFo5RzRvcHJ4WC9qbmdiQjgr?=
 =?utf-8?B?alQzRzZjaDRKN01yMUtidVpLU0ZqMkxYcGFvQVhyY3UvNjJYMU9yVnRMc2xj?=
 =?utf-8?B?cjhSMjlSVCtMYzMzeDIrUGl0K0czYkg1QjhaTVVGc3IrYTY5TER0R2Uxdjl1?=
 =?utf-8?B?QWVHeWZlWVorbUZTOG1vcUdyNnlZSFlrZk1ieHVoM2JHcUhrazhFMHMzNGRy?=
 =?utf-8?B?RnViNVRBOXRGeTI0Rllqc3o2b3JGT1lMMjdDNm5qK0QrVU5LcGR3SlY5Mnpz?=
 =?utf-8?B?RWtYWTNmZkRuK3hrNWZvcUZGRkV6NlhhU09wdHdjL3daSTVzbFM2UlpMN3pG?=
 =?utf-8?B?T2ZSQXhCL3VjdTJuMnMvZlhPK0tZdkF2Y00rNHVMR2tWRlBPU1poYTJzNTRE?=
 =?utf-8?B?SUpBVEx1Q2d1a1FZb0ZCQjRuYVVDUTV2REM5Q3o3YUpNZXQ2V2pSK1Uvazlu?=
 =?utf-8?B?N1VYOG9SUFp0ZlV0d3JZU1IvY1oralp4SkFNNnRFTmRQempzaHJOOE1SSkJP?=
 =?utf-8?Q?z1nE+cBx98g=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VVprUC8yVFBzUktPSWx3R0JVcU5FcWUvaENiOWJtU2VJbHlSWnNDeWIyZ0Rq?=
 =?utf-8?B?cElGSE95bmUxZUlRMFJ0OFFwTlB3MWorZW5NWGEwSHF5TGJBWFlUMDVkbTZt?=
 =?utf-8?B?YUZETm1FQ2ZLejd0ZkJwNXdSblErSkJYTmxieXpkUlhsNiswZ0RvNjFYaExU?=
 =?utf-8?B?THFQZFlUR0FxQlE5MWljNWk0Z09IV3NHR0R0aGZiM2gvRjEzNlM1cnlEdG4w?=
 =?utf-8?B?SmpGVmNnakxZVmNNaFpzRGQxbGZ4c2NLU28vK3JZTFR5eDBXYmxDS0gwbk1B?=
 =?utf-8?B?dlIzcjFvTTBmQi9zUGRvUGNmcnJUUW9EUVU3RXM0Wkx4S0FMWHNuM3loVU9Q?=
 =?utf-8?B?OFBQRjBQTjMzeExPbGRiT1M4OWVxL3UzZUpxL2lpQkFvbWZJb1daaDRVaHhL?=
 =?utf-8?B?Q2FmOGZPZGlFKzRJYlZZZUFmT2NqVFV6SVEyY3NyeW53NGZFcVNvNHZEU2gr?=
 =?utf-8?B?dzdYSzkxa3lmTE9mRzV6eWpsZEtkWFluWFA0QTdXQ1pyOEIyaWFWSkxETEFt?=
 =?utf-8?B?L2x0MHZGWW01QXJVVHVpTTFmWVhWZmRGVXV6YUozWmYyWG1vWEpuZEExWlFu?=
 =?utf-8?B?cFowUXVjZ3kvYklqVWVNMDZnaS9vcnBSZkZocnpZTjhRSmxyeFA5WUh0YVlB?=
 =?utf-8?B?OWVpVmRFZGZxNmdvelk2Wk1jYkRQQlliRlZBSCtwL1R0c3JVQjJnczE5OEkz?=
 =?utf-8?B?UzhOdldJWWx6TGtSQ0xhM0t0cEpld0h1SWY3THlDZmxhYkxrdTl4TG44eFdT?=
 =?utf-8?B?S1U3bitQNzRnRlZWZEFtWFluVFEwUzdDSDJZdkZiNTVtZVl4c0UvSTlSYVhO?=
 =?utf-8?B?b3NKR3hva1ZWRktkYk5pWi9pS0FIVkt1RlRpOEw5NngwN1d2SUxUZHplRlBL?=
 =?utf-8?B?WFpDNmtEQ3lPdFcxM2tIY0cySVFyNnhHWkxhLzF0YU5TOVRNTVJaSmhZLzlC?=
 =?utf-8?B?TG56ZnRpWExkS01qbkdwQ1F1MTFRQklTL3pIbUhBR3NzclVCT2lrZ2hVSDhN?=
 =?utf-8?B?RDhOK3JsS2pEL0ZCcW83TXV2a1dpQ0Z2N2NNYmJXMVpiUWgzL0JRUHM3aDJo?=
 =?utf-8?B?WHFCV1E5VlFLVEdidnlCNEh2MnJleVd1NmRDRTBTZFpobVlLVVNidDR3UVJz?=
 =?utf-8?B?ZmsxcnlFZms5eVhVNG1KdDdTRkdnaUFrdG4rQUZDUzR1RXFUemIvUm5IWXg2?=
 =?utf-8?B?bUZkNWRvdUhJOTJXYmdPZUxCZjZlaEM0SzRPRzN0M3dTSjVIb2cvbFBKZGNk?=
 =?utf-8?B?S1A4Nmd6QVIwZ3NwMmE4Tk1YWGwrNm5jYldNSDd6R011SGRpc25GM2kwZnQ1?=
 =?utf-8?B?QnErelRJNzF5dGhRdG5Pb0xLSXpqK3Qra3pQS0hPUXVqQThyZW5uMmhwbzFK?=
 =?utf-8?B?bXF0SDBma1htZ3lyb1JoQUdXOUhXQWZrSUYvVmlKcGh0UU9zVEF5bUdudjZH?=
 =?utf-8?B?SVVHSVdRc0JldUR6OGRUZkd6NXlVeElhcjRjRGdySkdmaXc3UnpGUEVoVnVV?=
 =?utf-8?B?TzR1eFozZ2lTSmZPKzlqVkJHMDBBUkJXbU1PZTBPTGZybEpkK0ZrakpNV0tB?=
 =?utf-8?B?MU55ZTAvbWU3VUlPRDNLMkRLUmpBTS8xNzg1bDA1STlSUVAvc1d1TVlBZWJS?=
 =?utf-8?B?NWJDQUlxSWEyZHZiRWJwWHVIS1VPVTBHdVppSVZOR0VvRUFoZ1RSM1ZtVlQ1?=
 =?utf-8?B?c3lhUk9vSUlYUmpKMzhTWlZ3cjJKd05HbzhDU3ZQV1g1V2QwM0RVZE9Eb0lr?=
 =?utf-8?B?TmJuaGxMdzE2OFY3TDNIdHVXUHF2cFJoWEpHWVYwZnRIcE9wdUJXNVhPRFUv?=
 =?utf-8?B?SmFEbGZ4cnhBWDIvOTVLc2hxYVpCK2hjaDFzYlNJRzJsTXFZeXg3RTFwcGhO?=
 =?utf-8?B?ZUhoQm5jRXdVcnR1ZVF4b3Y0OG9rN0dZZGxYUGpsVCt4cnh3diszS0x6eFJu?=
 =?utf-8?B?WDlhNUFOaHlRZWFkcmN0M1F5RFloemlUcSt0QnBZMjBCSndaazRPNzR0Vmwv?=
 =?utf-8?B?OGcrUXVBK1pPb0Q5S3ZQWmJlTHI3QUtKMndrT0U0YUVXVjFYZnBFSVd5MnpX?=
 =?utf-8?B?WW5uUUtOdzhaR2V5a1pBd3BrN0MxRnJPcXRFOEROYmFTd2ZJYXQyeDFQaGRj?=
 =?utf-8?B?NTRMck9ycjU4QXRQdkpZMytjbWZvQUNqRGV2VjdaQ3BVTnJvZ0pWMG9pL0U0?=
 =?utf-8?B?UGc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 294f4310-7169-4c73-9dd2-08ddf087deee
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 16:34:10.9629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2M3fIy44LbqF9UiUiPFgiEB5sZpuwetpXhyr69NwM8vlHZ/at+2ld+7DrCxd8WUQ0JR/+Q/mRJSt+gog8Q7VHank2ZB+v9Bkw4W7WEpdoQk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4764
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 9jwJmjWVZMQH5qxzpwYXgCR4i-9e16Me
X-Authority-Analysis: v=2.4 cv=U4mSDfru c=1 sm=1 tr=0 ts=68c1a885 cx=c_pps
 a=IGreAyPUPBSHjVw7E5NCrg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8
 a=4ccg4aFzZSBYaeO2rX0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: srKv4N11aMHsxJRdkukiPLX7phYNP8dI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDE1NCBTYWx0ZWRfX7Y1UMQuLFz7V
 3PuxxoUiB7so8utH69z0wvnWZ5YwTStpWgbhGR1HLRztAuq94mwyJAwpxkWTjdZlbXnkvDwFpiP
 2IFtyTmOdnrkbuSKJT1TfOKDfprYzHlvdpU/8zqt3JHjzRHRiR6PjxW19fNgkTTGf5+a3tMRVMJ
 5E7NfbK0MHWzYElIaDXNmL111d6ZLYBBk6v3LLJyMhDbCnJLjsodvuPhQWeGPhDpKn0u4kFZoZL
 j5h2FjLeLFp3lV7ltvAJK05OCkZtQCdK4HiClyeYT3ONFC/DuQhuoAg3gkYx4CKLJTKxtwPAJot
 8RtdxeZVV5+V0BhHsMgU2a2xkItSg36NI2FQm84aaTmPzpTPQT8Bdzhr0m1qwQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_03,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 58A5jZRc3643424
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 16:34:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223229


On 9/10/2025 9:56 PM, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Mon, Sep 8, 2025 at 7:45=E2=80=AFPM Dora, Sunil Kumar
> <SunilKumar.Dora@windriver.com> wrote:
>> Hi Khem,
>>
>> I'm cleaning up our clang patches in OE and I am looking at the one we=
 have from
>> D144514 (The one that adds #undef TIMEBITS in sanitizer_platform.h).
>>
>> I see you already got the main fix for that TIMEBITS=3D64 error commit=
ted LLVM upstream
>> in D140812( Commit - 26800a2) for Linux in sanitizer_platform_limits_p=
osix.cpp.
>>
>> In our builds, I haven't seen any issues without the D144514 patch. Si=
nce we're only building
>> for Linux, can we just drop the D144514 patch and rely on your upstrea=
m Linux fix?
>>
>> My Question is: did D144514 serve a broader purpose for other OSes tha=
t we might still
>> need to account for? Is there a specific arch or multilib config you'd=
 recommend
>> I test on to be 100% confident we can drop this?
>>
> It looks like we can drop it. But try building  compiler-rt-sanitizers
> for arm32 ?
> to ensure.

Yes, I built compiler-rt-sanitizers for the arm32 architecture, and the=20
build succeeded without this patch. Looks safe to drop.

Thanks,
Sunil

>
>> Thank you.
>>
>> Regards,
>> Sunil Dora
>>

