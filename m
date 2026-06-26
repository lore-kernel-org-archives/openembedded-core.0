Return-Path: <Kris.Gavvala@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F9ECDE00B
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 01:38:05 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26721.1782437879863977244
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 18:38:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=M8RCpJBs;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0637d125c9=kris.gavvala@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q1Jke82590758
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 18:37:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=a4IXV9FcomO+uh2RF6vZ1X
	EgwBYqDy4yZLEoAUrjRQs=; b=M8RCpJBsEK2kpO68NnInIBDmlwcfIpzCdHzRLD
	hVhNQAyIurwdfGHSfafP6tGScdGtfO4CJxdF+534ylIYfcgruh6zuFVm3guwud/V
	Zf4Vb6WvELNVyb/zjbEDzhq9I0OqZfM2p9M9WtMJ16cXmf4csE+iXoDdri9PLLz3
	R0SbUIW4vhWEpftqejXpAm1sXCUZ2frLfhsu6mwy6FP4s4VDJ7nIdNcoyVFvm8fA
	iRjI8S4g6XCoNnjTvxX0iSByCcDM9lzG+Uk7eCwXKHRs/jQgpe300rnZJJoAK/mx
	9d9w2zEWxt0MTftzT2wn/IiP7SlIaNatsfcrNM1JnrageHng==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012047.outbound.protection.outlook.com [40.107.200.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f1exk81dj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 18:37:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EHswfvPdFSn3deP7Z0Ed56YgekHc6dpJdgmViqeTR0VF2AtNWDwjkA/2+IBiOy2Ei+D1SCQLk+Oj93X7PvPuRuyWITg7ZQJqFqRKwzKaiQSezO5lyNSk3epaUzUTUed4tjFEToIJ8fI1NkT1b4Af21affiXU3PAVDlripdvUOioOj35HG26zDY04WGWXSWMY+suPrjKMOz07R4mahQRJx4dkGS1g3zFdEFqOoXUTAtns3pneMlQBwxRO1bkG4ceQx/pH3zjvWDzE1YZqI0ED6ysL/3gkIZPIKEG6MR+EF9+WgmwNg+1oH8pRXnnnssijHUWnrQwZrBZMDpPjNzRPdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a4IXV9FcomO+uh2RF6vZ1XEgwBYqDy4yZLEoAUrjRQs=;
 b=depjIQz9wvKnEt6oI0UoLh7RFyuvWOIqC07TxlmEZLKJtlUvIG2sgvc5Jp1ltWQ+cELli/fXuBfGbA+ZhfVv10yuNWq/YEEN0TKQr5tLj3qNdJdvUibjePIkmi7Lr4rB9b0032xcik2erasVpEqYOTkQBiPsLINKD3LrDUsd3WViX/1xwEJTc7QUwcJ0EP5d+qzmnBdmKM2395L7DjZzp2WZ7Y51VjuOlQyb1DY5U+sobmY+SiI4jUAJaBz7MbTBsZwRPCp6WcZ9I87ehL2U1IMzFtHftbAdaBmieNv4oWFuRVp1wxJBtQRinEjUQw8ViubwvW0vXzEqhTykYoLDcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB7783.namprd11.prod.outlook.com (2603:10b6:8:e1::17) by
 PH7PR11MB7642.namprd11.prod.outlook.com (2603:10b6:510:27d::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.17; Fri, 26 Jun 2026 01:37:55 +0000
Received: from DS7PR11MB7783.namprd11.prod.outlook.com
 ([fe80::aa04:56da:f40e:96a1]) by DS7PR11MB7783.namprd11.prod.outlook.com
 ([fe80::aa04:56da:f40e:96a1%5]) with mapi id 15.21.0159.015; Fri, 26 Jun 2026
 01:37:55 +0000
Content-Type: multipart/alternative;
 boundary="------------VbNu05U2yMNftyQnZf3d4Fyp"
Message-ID: <f3673565-3b70-4bd7-81f6-f984a3274454@windriver.com>
Date: Thu, 25 Jun 2026 20:37:48 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] python3: skiptest tracemalloc_track_race
To: yoann.congal@smile.fr
Cc: openembedded-core@lists.openembedded.org
References: <20260624223336.1254487-1-kris.gavvala@windriver.com>
 <CAMSfU+4DoS4g1hZdLtK45fo3rmqiXXthb5kNusWjcts+S8MV9w@mail.gmail.com>
Content-Language: en-US
From: Kris Gavvala <kris.gavvala@windriver.com>
In-Reply-To: <CAMSfU+4DoS4g1hZdLtK45fo3rmqiXXthb5kNusWjcts+S8MV9w@mail.gmail.com>
X-ClientProxiedBy: VIUP296CA0044.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34b::15) To DS7PR11MB7783.namprd11.prod.outlook.com
 (2603:10b6:8:e1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7783:EE_|PH7PR11MB7642:EE_
X-MS-Office365-Filtering-Correlation-Id: 845f3207-3cbf-41bf-eb33-08ded3238b70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|23010399003|4022899009|376014|52116014|22082099003|18002099003|6133799003|8096899003|13003099007|11063799006|4143699003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info: 
	HU+ALbULO29SsF1vFqSXTJw+abQQ61K4sjSJbpQTnWv+c7towLqgRzUxyKgdnGl/WJN9+BXOVOAbLz7D7Vzo5kVJqjjE93DK1aUf0nKAiq3GIFr5Uxe+fpxaWzX5dgTEbneRpHDDaiymakOvL/5Vsm8hBFCLEz+su+Suns+JmB9FaWAhoO66EP079IQU1tJAG9Z9akiFFCPE5diB1AXw6r8NkW+Y9j21iFzOGw/kdAcbIZPYEgD2NyFwGWYwz9wM00aFRBqMMtctfrnguGRKOezOkWapwFObGPsT+1aQtbgsDgBAkPUrShOSEJ3BKJS0fsdFxULi0+tvs/XYW0xpOVbyQjYWPEAxFQbCoJtRNo707S/fwObIBJwFBxm6ySG9TlozrHDDMq2Bsi8OqNd+NBeW9WL/HG0GUKAaFYPRoQ6pGsSj40vI/bKdQ5DqUost/T6qW89U5SZKg/1aW8DjGK/qC6BjfQzypzcJwi4KlTPYNosyPvkDIKp20lV2SZ43aAOeC1YC3PxHTQr1BhQ/2Wj7XZe9f8Mu+fZUujoqH/Hf0r3seSAKk38ARz0D50VfqVdJjvTUtctnUgdwa2fJPL3BSTFaEI9gPsrvFPYZdUB9h43VGRJI1r+i9BhegB1N/LcxNGQc+2WRITiNGSxTyT6OKNNtlAHx9sToyjz8nM4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB7783.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(4022899009)(376014)(52116014)(22082099003)(18002099003)(6133799003)(8096899003)(13003099007)(11063799006)(4143699003)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?K1dRV3VrOERQTEFJa2Q4YXRTeTVGbDFXdURvVGxCZ1NqcC9iQ3ordlVUVEVJ?=
 =?utf-8?B?N1lHeVRnOHlPS3dXTjNSODVkRktTOS83dUVvd3Zmb1dLME1RNFFmRzh0aXN2?=
 =?utf-8?B?RG9DdkFZZWNGcTdpeW42ZnRpVVNiSE80NG1ZOVA4eDg3eUN6UGFlTXhvU0lj?=
 =?utf-8?B?OGNHWnNBdXdsQWRhTnNDZzRQWU1seUZPem44aWd2d0V4SmRpQ0JYNmd5UzJx?=
 =?utf-8?B?eFpEc0dxUkgyZjE4c1pJbFdXQTNXRk16dVZ0RVh5dVorUC9qUHVqUjZMWUNu?=
 =?utf-8?B?b3NYRlZERnpoZC9VWGhnZkVjZ3g3QndUMEY3c0l0c1ZoSUNObUtoZGJSNjV2?=
 =?utf-8?B?dEp3bVpHT2EzMHQ5Sjcyc2ZWRVdHdmJHMEhDS1cwZFhJekxVaDVlVVIyNkYv?=
 =?utf-8?B?TzJmaGw5VUcyZG8zakN2N1Y0T0JzdlpNYTdFcEJTR0ZhdEEyK0NtTHFBeXYy?=
 =?utf-8?B?anV0cEZyQ29BNk5HMkpwRDFramxZUnJtUFF4bVBmZGpsc3FIRTBZSGhHcXdD?=
 =?utf-8?B?bC9IUTBHM2dRcmdFejJsRk9VUmo3cGh2SEdoMVVkNGtCVllKUTV5eStGckQz?=
 =?utf-8?B?VUoyU0ptY2F1UTBGcmpYR29rcUxrZEpFTVU3a0Z0cU9LK3NFMXdvOXQ0RnNT?=
 =?utf-8?B?Qm5kUFoxSUZSQ3ZpM0tteXQwU2VnWVlTOW10QThLU2t0UmRnR2N4RXkyd1pU?=
 =?utf-8?B?MEJReVJoT3poSFlabHBpT1JyVXZ3MU5jRTNxQTNhUmJUU0N1a01wUFJrMUhT?=
 =?utf-8?B?SEZWOERRcmU4S2kzcUx4dGlSU2J3Q0ZjRHpVMXNqK3NGWDhaWmdVZ3gyZEZY?=
 =?utf-8?B?eE4xOUpsUlFYUHdQaXJrbW50QXlJb3JJVnJNOGhsQnNFaUhhWDdObnRGV3RF?=
 =?utf-8?B?YzJIaDV3ZGJrS24xNmxjY1RZekNYaWZCcXBCdkFESHZ1MG9rMWRyMnd6L2cy?=
 =?utf-8?B?TjZqVTN4dUhickxKYkp3c0dDTHBLeHYwdStXaEJGWFpTRTliNURUMW9MT0Vj?=
 =?utf-8?B?aXlqYlNQbU12cXJNaXUvQUdmYWhLa2xxN0xRLzUxMFNlT2RPbVJhQlVWMTdG?=
 =?utf-8?B?cUpLbjZRQ0xvcDFvSkZoaXYzdDRZeXZiQzQ4NjNQekE2MDVSZlFSVzQyL3Az?=
 =?utf-8?B?WkdTM0xmQWRWVXJZV21iL2lvc1RDV0U0aGN6aitVNHhEeVlyY0kvY3FNQ0Fm?=
 =?utf-8?B?UHBFd1ZIVktYc1VKeEkwTEt1V014SzBOeHFyeVJtbDNRY3lhcHdrdTE1SzNi?=
 =?utf-8?B?NXJaTmJCVFVQTnoxd044MTEyV1d6VzRsTnBML0p3ZmdjK0hDZGJZSWhIaDhN?=
 =?utf-8?B?TDhaWk5RVGdxSThPUEFMS3VQaCt6QndnM2xjUkgwUWkxQm1lcHVYU1NDZGN6?=
 =?utf-8?B?NGVFSFhGV3hpRlN3TkN6MUpiVEUvZmUvWDY0c3dGelJCSk5oSVhobTBBRC9z?=
 =?utf-8?B?aEs3czFBS1VQQ25XcEJiUXpwdERaTHU1alRxL0tRdDlLSTU0MUFIOHVNNzkz?=
 =?utf-8?B?Tkdta1BLVGcyRE1zZkJ4MEZXeFY2SWxtZmtEQUQ5dWh2VGxJWXZ6N2RlU3FJ?=
 =?utf-8?B?M3dtMmhNTXl0Tm5vSDhwZTB5UjRzQU92R24yMHA1eVd6RmEvOGovZjY1UTRS?=
 =?utf-8?B?UlUvQWEzYjFwa0lGelUvOGhhZHphYlFEY1JkOVRwMHBVR2RaK2FUR1NCaGdv?=
 =?utf-8?B?WEpVaDhmaVRydWxhd2ZrdlhmakdqZDgxQk43YnlzWXZLbnNiYThJcmhybGJa?=
 =?utf-8?B?QlVhemMwcTlHbTgvTHZmc2gzeGRWZlIrMXZUVmdUc0RoL0JLbTYxTUNWVGQw?=
 =?utf-8?B?dUV0YjUwVWNhNUltbmNGM1JlMVVFK3N1dktkVUc4Nms0dlV0Q1luQnhJUWNF?=
 =?utf-8?B?aFVEc0lOWEphVUJzT2hWUlM1VUM1Q0dDMnBta3F5SWIwZS9GUzFlOVNHeCtu?=
 =?utf-8?B?UndibTZ0dkJkOUp3YkF2UkJkZ2VQZXRmejRERmpMNGhydTVpVUlGWWRYcmZo?=
 =?utf-8?B?SytUTWdtd3ozcGtsUTJLSGw2SFY5REFHUjVLdjhwY0ZJbEx1dVpvSGdDNGIv?=
 =?utf-8?B?LzYvUXJicW45SUxnRGdQUHBYbkZvWEt3aUY2Y0VCY2V4TS8vT0ZRT1RrVGVM?=
 =?utf-8?B?Z051N3pQK3JjY3FpV0Z2ajBIUm5sVDFpQ08zWHF4YzVqWjJkN0RRdEFvU3gw?=
 =?utf-8?B?c01jSkZmUmlqT1ZNUzdIbHpGenNnV1Y0a3F3TnpSMnRVU1R2ZFkyUlpwR2lC?=
 =?utf-8?B?S3lrampTdnd3RWtTS2RxZUc5dzY1YmhYdFpITXJ4U3hNbEVua2gvOGNXSlRH?=
 =?utf-8?B?eDRJeWdXSTdZZVVmQUJJUGxuc0wvUmxqcWVtNEp5T0g0RGxxbW1GZ2pyNzQw?=
 =?utf-8?Q?HFB4d2BhLbUT/Jrc=3D?=
X-Exchange-RoutingPolicyChecked: 
	fzKFcQLqGDCnra4QrbD2o6yDMNoquiZ1vSsp7Lzhb8lr0levpgYMJWBIStDg7gGuWiTAKtiROfxOZKNlvZfvLfkGXGLIpfkXS4/vFa7cRw6AbF1pGIVTun8BNSoBhn1fz2y0qk00O5zF4eiDpBWjgAuwkiJOXPRAuZ+0UuUvR4G0pek5aljSFAYxjwlOgeFnXSgp8AlZL46TCT64M0/uK62FYxj1rL5taMB9lzjhtAUBXjzTbdxOww9i7RaFsDbudJqHaDnOzCJs1Puk0imUel6iWBY3U7vdthDZQaxXhXBb5okyxWU3wCIp4LPuLjWTMO5zRZACOe6JsJei4IWv1w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 845f3207-3cbf-41bf-eb33-08ded3238b70
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7783.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 01:37:55.1489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8lhr8LqmuGsxa+GMZwsXWJ6IpTSZ0rSTctaZkR0tUV6sriY4X1zm6mv9FnqHozd9R6YgJVAEAtPioOcry3ya7taUhbRAOkyWX+RfWTN6NHw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7642
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: o2X5krIW6mOiz-8x5HZPJKF3jNxt16w0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDAxMCBTYWx0ZWRfX8z6r5PHIMD/1
 K8TPQ44QN+HO8xk2vE/qkPZJZ5h2c30HcmHIrwsh0rcdelItOHblJWMx2G3cOgLBCQWfGbV/yH0
 abkfgBgCkIwtn48J2n9Fm6sxODO8ykEQgW/UGo2Lj7E46sfxN1H7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDAxMCBTYWx0ZWRfX3PEV9mxitFzb
 AAZ/AeGJ+DEo2oF4PGSTRJ6H0DJe74lrr/y0Ae18jENUWPZutDvrr1dlPFM44XdoV1w7ZJy4XF/
 nHJo6jIVzXEINce1Ea0PGlDyHmHjdoMhMDnck4v6njz+RrvzD/lE4rikb87NqUnG1jyzmkFpO1H
 QSB9JpdbdHgrZsntxTUtKLQuXd0XuEgGStaUdDvjvv/RxE7ulReSqZRgNp4+ovyG/aMTCzR3zKQ
 I4EdLgzbpKy+hUnTh4Aj86i0FegX/H8bSqsu0apabIkxhfd8rqYjTQyAttQu+5DQcJwNrnPOwr3
 OSrA1YsigNS4+IJiK/lXVawFzfh40eYtjgk4GPwIZO1XqZT6FphFNxzjIAY/8D3luPzjtfTTKKx
 b9mrMyqJPDPnhE9APacbmh/g3Y7IsDnQxLUf7JfVKx+yTRH6r7OsDNSM8T8+4oyL1rdfyfuYW0G
 QbLUl0bwd5mOKK6qA0g==
X-Proofpoint-GUID: LybDnnz0mSS1xv-Jt2LpCLfioSZbDkRg
X-Authority-Analysis: v=2.4 cv=NLLlPU6g c=1 sm=1 tr=0 ts=6a3dd7f7 cx=c_pps
 a=JPzmcyOoIuAgIyAaop9pOg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=Q4-j1AaZAAAA:8
 a=NEAV23lmAAAA:8 a=zhH3trtjAAAA:8 a=t7CeM3EgAAAA:8 a=i4UPQfKq1Y4wHX5fFlgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pGLkceISAAAA:8 a=XUKDfiOwNNzw2CGhfCwA:9
 a=KoYaNpbFDByDiwEk:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=lap4kSrHH8eKdvMWMUGw:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 01:38:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239590

--------------VbNu05U2yMNftyQnZf3d4Fyp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 65Q1Jke82590758

Hi Yoan,

Yes, my mistake. I will send a v2 mentioning that its for wrynose.

Thanks,

Kris Gavvala

On 6/25/26 2:18 AM, Yoann Congal via lists.openembedded.org wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>
>
> Le=C2=A0jeu. 25 juin 2026 =C3=A0=C2=A000:35, Gavvala, Kris via lists.op=
enembedded.org=20
> <http://lists.openembedded.org>=20
> <Kris.Gavvala=3Dwindriver.com@lists.openembedded.org> a =C3=A9crit=C2=A0=
:
>
>     In python3 ptests for whinlatter, tracemalloc_track_race fails
>     with a segfault.
>     To avoid ptest failures for now, skip test_tracemalloc_track_race
>     in ptests if using glibc or musl.
>     Making the change on master to backport to whinlatter.
>
>
> Hello,
>
> I think you meant "wrynose" instead of whinlatter (which is EOL).
>
> Thanks!
>
>
>     Fixes [YOCTO #16182]
>     Upstream Issue: https://github.com/python/cpython/issues/143143
>
>     Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
>     ---
>     =C2=A0meta/recipes-devtools/python/python3_3.14.6.bb
>     <http://python3_3.14.6.bb> | 8 ++++++++
>     =C2=A01 file changed, 8 insertions(+)
>
>     diff --git a/meta/recipes-devtools/python/python3_3.14.6.bb
>     <http://python3_3.14.6.bb>
>     b/meta/recipes-devtools/python/python3_3.14.6.bb
>     <http://python3_3.14.6.bb>
>     index 291bde70f6..0fd1831b86 100644
>     --- a/meta/recipes-devtools/python/python3_3.14.6.bb
>     <http://python3_3.14.6.bb>
>     +++ b/meta/recipes-devtools/python/python3_3.14.6.bb
>     <http://python3_3.14.6.bb>
>     @@ -320,6 +320,14 @@ SKIPPED_TESTS:append:libc-musl =3D " \
>     =C2=A0 =C2=A0 =C2=A0--ignore
>     test.test_ctypes.test_dlerror.TestNullDlsym.test_null_dlsym \
>     =C2=A0"
>
>     +# Fails due to potential race condition so remove it for glibc
>     and musl
>     +# Bugzilla YP 16182 (test_tracemalloc)
>     +SKIPPED_TESTS:append:libc-glibc =3D " \
>     +=C2=A0 =C2=A0 --ignore
>     test.test_tracemalloc.TestCAPI.test_tracemalloc_track_race \
>     +"
>     +SKIPPED_TESTS:append:libc-musl =3D " \
>     +=C2=A0 =C2=A0 --ignore
>     test.test_tracemalloc.TestCAPI.test_tracemalloc_track_race \
>     +"
>
>     =C2=A0do_install_ptest:append () {
>     =C2=A0 =C2=A0 =C2=A0sed -i -e
>     "s|SKIPPED_TESTS=3D|SKIPPED_TESTS=3D\"${SKIPPED_TESTS}\"|"
>     ${D}${PTEST_PATH}/run-ptest
>     --=20
>     2.49.0
>
>
>
>
>
>
> --=20
> Yoann Congal
> Smile ECS
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#239546):https://lists.openembedded.org/g/openembedd=
ed-core/message/239546
> Mute This Topic:https://lists.openembedded.org/mt/119965939/10383205
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [K=
ris.Gavvala@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------VbNu05U2yMNftyQnZf3d4Fyp
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 65Q1Jke82590758

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    Hi Yoan,
    <p>Yes, my mistake. I will send a v2 mentioning that its for
      wrynose.<br>
    </p>
    <p>Thanks,</p>
    <p>Kris Gavvala</p>
    <div class=3D"moz-cite-prefix">On 6/25/26 2:18 AM, Yoann Congal via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMSfU+4DoS4g1hZdLtK45fo3rmqiXX=
thb5kNusWjcts+S8MV9w@mail.gmail.com">
     =20
      <strong>
      </strong>
      <div style=3D"border:solid #9c6500 1pt;padding:2pt;background:#fcfc=
03"><strong><class=3D"msonormal" style=3D"line-height:11pt"><span style=3D=
"font-size:11pt;color:#000">CAUTION: This email
              comes from a non Wind River email account!</span></class=3D=
"msonormal"></strong><br>
        <class=3D"msonormal" style=3D"line-height:10pt3"><span style=3D"f=
ont-size:10pt;color:#000">Do not click links or open
            attachments unless you recognize the sender and know the
            content is safe.</span><br>
        </class=3D"msonormal"></div>
      <div>
        <div dir=3D"ltr">
          <div dir=3D"ltr"><br>
          </div>
          <br>
          <div class=3D"gmail_quote gmail_quote_container">
            <div dir=3D"ltr" class=3D"gmail_attr">Le&nbsp;jeu. 25 juin 20=
26
              =C3=A0&nbsp;00:35, Gavvala, Kris via
              <a href=3D"http://lists.openembedded.org" moz-do-not-send=3D=
"true">lists.openembedded.org</a>
              &lt;Kris.Gavvala=3D<a href=3D"mailto:windriver.com@lists.op=
enembedded.org" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">=
windriver.com@lists.openembedded.org</a>&gt;
              a =C3=A9crit&nbsp;:<br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              In python3 ptests for whinlatter, tracemalloc_track_race
              fails with a segfault.<br>
              To avoid ptest failures for now, skip
              test_tracemalloc_track_race in ptests if using glibc or
              musl.<br>
              Making the change on master to backport to whinlatter.<br>
            </blockquote>
            <div><br>
            </div>
            <div>Hello,</div>
            <div><br>
            </div>
            <div>I think you meant &quot;wrynose&quot; instead of whinlat=
ter
              (which is EOL).</div>
            <div><br>
            </div>
            <div>Thanks!</div>
            <div>&nbsp;</div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              <br>
              Fixes [YOCTO #16182]<br>
              Upstream Issue: <a href=3D"https://github.com/python/cpytho=
n/issues/143143" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"=
true" class=3D"moz-txt-link-freetext">
                https://github.com/python/cpython/issues/143143</a><br>
              <br>
              Signed-off-by: Kris Gavvala &lt;<a href=3D"mailto:kris.gavv=
ala@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"mo=
z-txt-link-freetext">kris.gavvala@windriver.com</a>&gt;<br>
              ---<br>
              &nbsp;meta/recipes-devtools/python/<a href=3D"http://python=
3_3.14.6.bb" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true=
">python3_3.14.6.bb</a>
              | 8 ++++++++<br>
              &nbsp;1 file changed, 8 insertions(+)<br>
              <br>
              diff --git a/meta/recipes-devtools/python/<a href=3D"http:/=
/python3_3.14.6.bb" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D=
"true">python3_3.14.6.bb</a>
              b/meta/recipes-devtools/python/<a href=3D"http://python3_3.=
14.6.bb" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">py=
thon3_3.14.6.bb</a><br>
              index 291bde70f6..0fd1831b86 100644<br>
              --- a/meta/recipes-devtools/python/<a href=3D"http://python=
3_3.14.6.bb" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true=
">python3_3.14.6.bb</a><br>
              +++ b/meta/recipes-devtools/python/<a href=3D"http://python=
3_3.14.6.bb" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true=
">python3_3.14.6.bb</a><br>
              @@ -320,6 +320,14 @@ SKIPPED_<a class=3D"moz-txt-link-freet=
ext" href=3D"TESTS:append:libc-musl">TESTS:append:libc-musl</a> =3D &quot=
; \<br>
              &nbsp; &nbsp; &nbsp;--ignore
              test.test_ctypes.test_dlerror.TestNullDlsym.test_null_dlsym
              \<br>
              &nbsp;&quot;<br>
              <br>
              +# Fails due to potential race condition so remove it for
              glibc and musl<br>
              +# Bugzilla YP 16182 (test_tracemalloc)<br>
              +SKIPPED_<a class=3D"moz-txt-link-freetext" href=3D"TESTS:a=
ppend:libc-glibc">TESTS:append:libc-glibc</a> =3D &quot; \<br>
              +&nbsp; &nbsp; --ignore
              test.test_tracemalloc.TestCAPI.test_tracemalloc_track_race
              \<br>
              +&quot;<br>
              +SKIPPED_<a class=3D"moz-txt-link-freetext" href=3D"TESTS:a=
ppend:libc-musl">TESTS:append:libc-musl</a> =3D &quot; \<br>
              +&nbsp; &nbsp; --ignore
              test.test_tracemalloc.TestCAPI.test_tracemalloc_track_race
              \<br>
              +&quot;<br>
              <br>
              &nbsp;do_install_<a class=3D"moz-txt-link-freetext" href=3D=
"ptest:append">ptest:append</a> () {<br>
              &nbsp; &nbsp; &nbsp;sed -i -e
              &quot;s|SKIPPED_TESTS=3D|SKIPPED_TESTS=3D\&quot;${SKIPPED_T=
ESTS}\&quot;|&quot;
              ${D}${PTEST_PATH}/run-ptest<br>
              -- <br>
              2.49.0<br>
              <br>
              <br>
              <br>
              <br>
            </blockquote>
          </div>
          <div><br clear=3D"all">
          </div>
          <br>
          <span class=3D"gmail_signature_prefix">-- </span><br>
          <div dir=3D"ltr" class=3D"gmail_signature">
            <div dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal=
</font>
              <div><font face=3D"Raleway, regular">Smile ECS</font></div>
            </div>
          </div>
        </div>
      </div>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre wrap=3D"" class=3D"moz-quote-pre">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#239546): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/239546">https:/=
/lists.openembedded.org/g/openembedded-core/message/239546</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/119965939/10383205">https://lists.openembedded.org/m=
t/119965939/10383205</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:Kris.Gavvala@windriver.com">Kris.Gavvala@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
  </body>
</html>

--------------VbNu05U2yMNftyQnZf3d4Fyp--

