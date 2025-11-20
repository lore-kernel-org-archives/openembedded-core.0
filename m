Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22298CF885C
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 13:44:56 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34329.1763646287079481575
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Nov 2025 05:44:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=aOdye2k3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=341909d004=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AKAS9QM4105198
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 05:44:46 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=fDzCiauL2YroScseDmAi+1Dyt+0qxphAv+g8ILEQilc=; b=
	aOdye2k3D/kC0TQTSsGhXxOVnsNgfGNqio3ZPGA4hGPLd3YlcnvMunEkRbcL52gL
	WI5yKihsxEPM70mPK78RtW1zI7TGquTPJsc11Np2/1jU0KcKS06QDKrC8pWdPf9+
	fiPPyIHiAtIecAFOB4+epVmdTFrzzs0OXFz11dgS32gLmEMa/l8P3K20ou1Xgvr2
	3fKOBVatEqTeFiz7Ti6W4+MmyetejLokgO14oMPq6k06xuMQie9+E1PqKoBk1k3O
	f3Ap97Im0D4ZVO6MNk6xCAWlpgSbGTFP8tdpVZusnuDFS0gJms2eeZh3GU8i6rpT
	3uQ0Wn4pXWF9Vj/5rAaZkA==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012001.outbound.protection.outlook.com [52.101.53.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aeswje8pq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 05:44:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XOv2clpJOIEA+hmcFygmu17s6/e+05WCUimfeyeF1Eko5umAkm2APkGpKGF1i3Lb8i8Av4zOwDade0DbtyUtdRb7nZ+BIUrbWSPza5Vm213jLBooWe0Xq4HFUsHbpRpOOqFqGPn6aItluD8Ro2Yjj+5gZuuKVNMuVbZE8W9XBkhPtk9qIdhWa8nK+v8+GBwEFIlx9Uv/c066qRNujh7d0DS4NxdeTqXBQhYheZJbfYY0+qaBlHProb61ZqW2vJacqSko98FVZIjA7CWiNiAhKK0BCB8V2F1fpCTio6CgEeKK9So5RzOAX8mOGaJ5W2CB3XAscSiGflHu2MKfa40hKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fDzCiauL2YroScseDmAi+1Dyt+0qxphAv+g8ILEQilc=;
 b=rwB/dyquzTy65K+W0DgrwleFrndSoOGPB7THi82u3VmbJAekpeJ/tpN9FBqYCMTx29slNpQPeebO4OsDCtvayNaNCaLuIAOZIpi4gC8ochwjPArFvWy0rTAIM5hcSbxgXnkisGwR/JNBUZoemy/5rUbyJMGyPKsfHx1k7ps259rTwGE2SGOuqCyEfCBpa97U1xQs+MiHURoad7OgTzxqf+x9VrzFNPzd0+gczT/fJZv1BFx1VeGo1KnN2wOntDQEGI9WVymbAGm+ntowyeMkOGNxI2M1uI183l7yjdKcsx2GjQ8VbQzcJtqBrHxGhDIhL7laHdcup8n+EblOn7vPaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 13:44:43 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 13:44:43 +0000
Message-ID: <3e0e2afa-04a5-43fd-8915-e641262a7b98@windriver.com>
Date: Thu, 20 Nov 2025 19:14:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 02/11] linux-yocto: add clang-native,rust-native
 and bindgen-cli-native to DEPENDS
To: Randy MacLeod <randy.macleod@windriver.com>,
        openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com, Sundeep.Kokkonda@windriver.com,
        yoann.congal@smile.fr, elmehdi.younes@smile.fr
References: <20251119164804.256364-1-Harish.Sadineni@windriver.com>
 <20251119164804.256364-3-Harish.Sadineni@windriver.com>
 <71685d1f-3b10-4a2b-bb9b-a2fa5e35ccda@windriver.com>
Content-Language: en-US
From: Harish Sadineni <Harish.Sadineni@windriver.com>
In-Reply-To: <71685d1f-3b10-4a2b-bb9b-a2fa5e35ccda@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCPR01CA0120.jpnprd01.prod.outlook.com
 (2603:1096:405:4::36) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SJ0PR11MB4845:EE_
X-MS-Office365-Filtering-Correlation-Id: ba065b56-6e03-4d75-5e74-08de283af5c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SFBxNWpwYkFUOGxDelgyVmpiMUNteS9NTHFQdy9INEVOLzdSRnl6ZDB0MW5J?=
 =?utf-8?B?TGhNK214RTNEdjJYaDVobnI4MEQ0NVFuYTQzZnBqTDA2Q0x6cU9weTNzSXZQ?=
 =?utf-8?B?TlBIb2xFZmdacGlGTklxMGIyZmNNOEJqZG9kNENYclorZHlWejdwUGJDR2xN?=
 =?utf-8?B?YmNORjVHVVVLZ0lrZ0p4VnNITHA1NDU1Vk5Td2wyQ1RQcUFNRGpXRW8xNDVz?=
 =?utf-8?B?b3BLdzUxRlpId3RneXk5MGJYSTNJU3doc3dCcTM2L3FqU1NhYmNTVlZtWC9H?=
 =?utf-8?B?RHVtSzEzWGQ0VjFZWkVqY1N3QmUzeFFjRzlYTmE1NnlBdlgwOGlMbWVzQTI5?=
 =?utf-8?B?alQwRE56UzhHa1ZXbEJqOG5QbXUrd3E1cEJCdUczY3RtbVd4REdqRW9YamZG?=
 =?utf-8?B?NkM4SVI0QUU3UE9qTnUvV0kyR2ZRSGdGL0lHOS9HZEQ5RGRSc0o2NGtxK0pK?=
 =?utf-8?B?Q1V4TjJBYkg4Q0lWRjUxdVV3YVBibi9HUk56SHhJd2pHaWlxK0JmLzI5djhE?=
 =?utf-8?B?YXNmY3JXUmVVMU83UnBHa1REK3A4ajVkdzlKM3R1dnZ1bi9GRVVCb3lMemRE?=
 =?utf-8?B?UmpLaGs4VFRNUUFjaTVzTDlaZWlPaTdqQ2NXd0d6QjlZdVYrNThISzl4aWZH?=
 =?utf-8?B?QmFzZE44UHVhSHBjMWlyRWQyMC8wcTVWZHE5bWtFQWtnZWEyYmpaY1NzN0ZN?=
 =?utf-8?B?VDZPU0VyMWJaZ01kSkY1Zy9LRWhUUmhYRllURUcxMGNMY3d5OW15bmlTQmcx?=
 =?utf-8?B?eEZJZDhwUE1PN2ZHRU9HMlJ3WlRBVFB3MnIrUTlHUGxNWlJoT3hGbUhyOEdt?=
 =?utf-8?B?KzVwNkZsZ0lYdHFJcGk1WHBpY2RoRFVvOXRnQnpBWW5XMHk0YUc5SjNndUxn?=
 =?utf-8?B?VnNneFUremRWMTJ4eVNQUVROREdobVJHcWJaUnhGQjgxS2NJdUF5R1ppb2th?=
 =?utf-8?B?L3NpbkZhL2M0aHRxN2VEeHIyTW5ZWXNMdjlzNlNSVkVIZHB1dzRSMUNTb0xk?=
 =?utf-8?B?ZDVIWjJiVmJmVEY4eEVJWmpheHpJa2dKakMwQVNvSXQ1NTFxZ2o4aStsTnpw?=
 =?utf-8?B?ZEhkVE16YjRZa2Q4MVFqckF6d0tZZHU5U3MwYTZnYStwaDVTSDI1WnMrTkNJ?=
 =?utf-8?B?YURoWDVLUnR2L1I4VkFKbW9vaHhkM2VWdm4xeGlZQnc1MjVKd1FwODRnaDlr?=
 =?utf-8?B?ZmpVU0NXK1dEUHpISlh0enhTZ0lkTVBXRXJJL2lIdVk2UzhLZlZuQTgrN0Rs?=
 =?utf-8?B?RVdZTHBZZ09Kc0hzN0JwNHNGc1ZMRHdycUY5VzVrRDI1eDNmMDFLSmxKNmdW?=
 =?utf-8?B?Q2o0bHgyUDJ2VDIvMWZYTnZicDRIRTEzT1R6QzlkZ2FvaUMrUDI2SlRZR1NB?=
 =?utf-8?B?V0xIdHk3R3ZDNnRLMm5pbzVLN0tldzZGbmJDa1J5WGRyUWRzZkhhSFZONDlO?=
 =?utf-8?B?ak1USGh6azhYeGR1NTRBR214MFZPQ0Y2ckpDUk9adUM1V1NRNnFrMVdCcFVW?=
 =?utf-8?B?bkpVTXZFcVFSV0pNTTkzei81bHo1NGg4ekgxeE1EeU1WSGluTitHMStpTTV2?=
 =?utf-8?B?Vk9ERnBYSnZYOUZXcWVtMXhOK0NGU3BnWTlINzA3ckFQRTAwdEpKMjk2ME5G?=
 =?utf-8?B?SmMxY3hBcTBDRDNsSGF1TGt1ekxldUdhNVVvZkJBVmhGd3pOWHEzVEtnZ0xx?=
 =?utf-8?B?bUFySTNwVkpUTzA1aEZKVjVKdmFpQkx1YThvaG1DdGgrL3Z2NVZBbzJ4YzVj?=
 =?utf-8?B?MUM4ZTFZNGVueHJ2c2MxYmcxQU1sYXJXaGgxWGRMQ3ppNk1rQ2IzSExiWmk2?=
 =?utf-8?B?ZnUzN2ViLzhWZWVYTENXTmJuc0djOS9EZCsyR0s0aW1FQUY0Y0dFdUhkRVpU?=
 =?utf-8?B?TDdTcXYyVWxueXJNRFk1dzFaelk3cll2NkpsdmhXVHg0L3JOUFI4NllQUVU2?=
 =?utf-8?B?VDNpZlpaRmF1djFISmt4aFBmOTJVVzFnUnN0Nk5UVm43M0F3T1lFa0txYnhu?=
 =?utf-8?B?ZFV1Tlk0UjZMN2tyVjk0NzlNbUVLVmhaQXFoZi9ydnNmRW9FTi9ramtoUis5?=
 =?utf-8?Q?wzAnkB?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q0JCUm9CazViQ3N4M3VLVmkxckdzcjdqczREMEVxYjJzYkVrSFhtam9LdmNR?=
 =?utf-8?B?Z3ovN3NzNXh0NW1FdmZPTEFwTVh4UmhNUjh2OU90eHhQNXNiRjhMYXFFdlFr?=
 =?utf-8?B?cnVFSnZicHF1YjJNZDVCcjhZckxENFBRRTdtcEsvUWlxVC9iNDFtWWpydnNB?=
 =?utf-8?B?Z2UrRVdUZnYxYUNXTHA0TUtoSTdNdW9VL3pMNjdRdGJmK21VcUNHOGtYbk5q?=
 =?utf-8?B?cFlHbVgwK3U1ZUcvUDg5eTZZaVFtRU5JQ2Y1dTZjbXJLc1U0ei9QUnh0cFNk?=
 =?utf-8?B?ZjBVY05XNWJZNmdUTDBBQUgycmhrbjlXVWpCYkpLUEhJa21Ud3RCajd5M2g2?=
 =?utf-8?B?d0p3V3BHNWdicm54cGNUT3F0VDczaUloUjVJU0FtOTNsLytyMzBBUzM1QXZk?=
 =?utf-8?B?UW5nNENqS2xXNG4zQXNtYzZBM3BhS1djZGpINjdUelZ2RnlnREx4QUFlRW9h?=
 =?utf-8?B?NStmaC9GVkFpZEJtSk9jVDZOWnJkYVJtRVUxSkxBRXBYT2xoZ2Exb3NkZnZR?=
 =?utf-8?B?aXMrUDB6alVrVHBSeDVlRHd1RTErc0wreWpzdUZHMFFQVDJvTG81SDI0Zllu?=
 =?utf-8?B?RE8ybVdMSE9zenZ0RlIwMWQ1MEY5anY2YlRTOTQ0WTUzeXdyQ2V1U3EyMVRY?=
 =?utf-8?B?ejQ5TzBTWjB6eENMSXJubVByRllKQnB4blBSN2c4K2oxWFR1UHlWZTBYYWpF?=
 =?utf-8?B?c3B2anZLVWhIMytrbkFWQlZlVUZiQTJzRE9ITkxPUnJKM2RVMitBS3Qxd1Jh?=
 =?utf-8?B?S2xkWnQ3QUFHdmxXb1E5NlVLN01hZ3hSY1pDT2FKaEpUYXRXTUs0RHBNa2FW?=
 =?utf-8?B?N2xSZEMweURyaTlnNDdpbnVFakFqbTQ0R1krbjdzKzEweXFzUGRYMmQzZG5j?=
 =?utf-8?B?QWh0bXY4S0FvNWp6UVV6UVNhWUN6VGV2bE84c2dIeGRaTEUxNmFNc1Z1aXB2?=
 =?utf-8?B?eDRLMXIrZmdhKzh3STVxUEZPUXdIbUVLM0w1RkRRaEhTS29YL0RicDQzQWlM?=
 =?utf-8?B?YkMxejNIa3RPUDhRcjdiM1psTjU3UkpRclBKUFJPeUo1aWx1b3VRckhXSTY2?=
 =?utf-8?B?MytkYWx3UHduVHFtc1NSNGhXb3JVR1Q4TkJXY2NJa21jR2RlaUpvWkdKdmhu?=
 =?utf-8?B?MERNZ3lqUGRwTXFTdGE1RXBMVzY1K1dUTU5hTGk4MzZQSS9jNVdJL05VTkJw?=
 =?utf-8?B?S3pvcWNvWjFYQTVzaVZwOTYwZ2wwRGhzY2toODAwemp3cTkrYXY1dVl2bkFm?=
 =?utf-8?B?cGRHSkUzQW9wZ3BYdlVuMHBtTGdPUjF6RVloY01JWW1WMmlFSk1aQ3pPQktT?=
 =?utf-8?B?YXhLa2xXWXhIZUwzU0duWlBmbzI2MHhmU0lQOVB3UFpkU0p5MDNicUxCY3Mr?=
 =?utf-8?B?MVVST3dHUXZncDdPdzd6UWVMcVdMQzlUbXdwdGxnMEdZZWgrRlJEQU4wWUQx?=
 =?utf-8?B?OVNEVmkrVGhXZzE3UWV0c2tqVXFZOEZ0YWU0SjRoN2ZuTjdJbnNXeEQwRG1x?=
 =?utf-8?B?eUhoaFQ1NXRLbUlFQXZKMnVCY3ZsZkNpT3BGY0Ixb2Nha2dXcWlQMDRCRjly?=
 =?utf-8?B?U3ZabFhCTDBGOEVMc0l0ZE1TaUQ4S29qSlYxK09FWDY4bmFEK2xZWnJhRmI3?=
 =?utf-8?B?ZEh6bzQxRUNmRllXRlhoY1preFNLMXkzaGFab3pQREQvaXllZ1VwcVV3bzlL?=
 =?utf-8?B?bjcyQ1gvSVN0ck1oWit6dzZBTTU5dE9xcVkxUjJCTGlQY0tacnJsYWJsb1Iw?=
 =?utf-8?B?Nmc2MGd0b0d0SVJZTlhFczFkODBvcXk1SkpFKzNLajhWUHJZRHZIZVRvbTJj?=
 =?utf-8?B?N3o3bHRNakNXV1pwbXNGTFUrRHZXS2lhOXFrWVVNN29qd0lqVVpRckdPRVhL?=
 =?utf-8?B?UHhSYjluNzVHNmZmVmVnSSsralVoYzF4N2ovbEkyM0Z2SS9BcFoxWUpmZEFS?=
 =?utf-8?B?Vmc2Q2huOHRJdFY1a2FQUkNTKzMwNE5QblhYSjIyY2Jac0hWbnRRdURTOVQw?=
 =?utf-8?B?TmdMbDZ0S0t6RzczdjJrRWJMOXZ1L1NOZ1NzUHpzQUtqK0xkWWhOMjl2VDBE?=
 =?utf-8?B?YUhoWHpmaFhNWHo3bGNqMUZIS0RiRGNHU1BwUFl4YkJoUi9EZTNNQy9EdUlt?=
 =?utf-8?B?NThxZWQ5ME95Nk43NzVGakNMdE9NMXpuS3ZLbThqRjNEUkxBTFVnNUNLSzd1?=
 =?utf-8?Q?MziHNJqrghaHMy6v5BchDRk=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba065b56-6e03-4d75-5e74-08de283af5c5
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 13:44:43.0996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5GH28pI53MoMmYzmLzFX2NGuuuCv8x7Etj4qBwGKfZn26p+WI01SWDoOWVpmH7z3Kl2GrpUGOyuRcWzWYnz4GKR52u+3tdUdYc+eXWtdUuk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4845
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=BqiQAIX5 c=1 sm=1 tr=0 ts=691f1b4e cx=c_pps
 a=0imTBu3/wk/XLaKPibPjKw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8 a=TbeSswyw96v5hfXzbMAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: HOnZFqHZ8U46O9W0kT3OQUA2eLnLs5B-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA4OCBTYWx0ZWRfXywTyXg0+HGEp
 oNJEUG/Sz/VRG+de6iaLC1meCEuEdvLbXvGvlV93dT6DsOoo/QdO/lfEQATX/YV8i1J+7cl22jt
 Xqqv6rj+OuEgBKcoUWLREqf047Bw3n7vy20kPh4FIN9oOKy4fC3JMjMWtPVd/qCxT5cFnrEw9fH
 tff4YH08Pqt17oVHj/+dSGT+EEv/hHYcSFFBaHJ9AwYKPEfxk1o8+loAAMMqaAO5Qhw15ftcHy4
 ZhvUbHFhL5vhTqLAzmQDNxI+bpWieggotnGOr2kymg2YkM8y6qqXy92liMGYnvVUaCCuf3cayA7
 X2TibnJ+X+/ThfAPRvuCP+MojRVbIVCdmFbTwQQ9xlT/6dw3Snqv8QEkALe5t79R2unH5WUa9D1
 nkyn7q4Y8AmFG3fBBT4L62dJz9sExw==
X-Proofpoint-ORIG-GUID: u01yuCjV70-oiPMYhPwiobLnLF_jwX75
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_05,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511200088
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5AKAS9QM4105198
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 13:44:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226622


On 11/20/2025 1:18 AM, Randy MacLeod wrote:
> On 2025-11-19 11:47 a.m., Harish.Sadineni@windriver.com wrote:
>> From: Harish Sadineni<Harish.Sadineni@windriver.com>
>>
>> Add `clang-native`, `rust-native'  and `bindgen-cli-native` to `DEPEND=
S` to support
>> Rust-based kernel modules or features that require generating Rust FFI=
 bindings using
>> bindgen during the kernel build process
>
> I'd like to see either a change the shortlog from:
>
> =C2=A0=C2=A0 linux-yocto: add clang-native,rust-native and bindgen-cli-=
native to=20
> DEPENDS
>
> to:
> =C2=A0=C2=A0 linux-yocto: conditionally add clang/rust/bindgen-cli-nati=
ve to DEPENDS
>
> or for you to introduce the rust-kernel DF in the body or ideally both.
>
> ../Randy
>
Sure Randy.
I will address all the other minor review comments with RFC v4.

Thanks,
Harish
>
>> Signed-off-by: Harish Sadineni<Harish.Sadineni@windriver.com>
>> ---
>>   meta/recipes-kernel/linux/linux-yocto.inc | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-=
kernel/linux/linux-yocto.inc
>> index 4d0a726bb6..41b12b6f14 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto.inc
>> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
>> @@ -81,6 +81,8 @@ KERNEL_DEBUG ?=3D ""
>>   DEPENDS +=3D '${@bb.utils.contains_any("ARCH", [ "x86", "arm64", "po=
werpc" ], "elfutils-native", "", d)}'
>>   DEPENDS +=3D "openssl-native util-linux-native"
>>   DEPENDS +=3D "gmp-native libmpc-native"
>> +RUST_KERNEL_DEPENDS ?=3D"${@bb.utils.contains('DISTRO_FEATURES', 'rus=
t-kernel', 'clang-native=20
>> rust-native bindgen-cli-native', '', d)}"
>> +DEPENDS +=3D "${RUST_KERNEL_DEPENDS}"
>>  =20
>>   # Some options depend on CONFIG_PAHOLE_VERSION, so need to make paho=
le-native available before do_kernel_configme
>>   do_kernel_configme[depends] +=3D '${@bb.utils.contains("KERNEL_DEBUG=
", "True", "pahole-native:do_populate_sysroot", "", d)}'
>
>
> --=20
> # Randy MacLeod
> # Wind River Linux

