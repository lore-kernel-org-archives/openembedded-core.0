Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF9BFCAC5B5
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 08:29:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.48731.1759134572883738781
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Sep 2025 01:29:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=dIYhwiB3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2367b08ad8=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58T5KbN23954079
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 08:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=36Y1PelzHX1oKaah2om8f/bZmHhEZiYyFoGTLYT/0Nw=; b=
	dIYhwiB3TttFrs6eKoUSlINxAlXroso+XKZ9ELflvPgpMIYbVi/+UZRutT4JpSQ5
	13+/w7gRSOCAIm717Tu+eNP2zBnbtSuDg2tK6wqrV/CO229os/8Sqs6iEk026NpU
	71R7TdDP1OvQXfQisIw3/R2AkVzT4iLRFpjgGXK4oSm6FactOKn9oYyKj+pItfgg
	8SbC36Arej0/Od8DcBXgJzIfDKY7oLH9OLIEAtaLxTKywCyYUdFsdnTxC/oRV30P
	R8XxeoqipvkTv3WLG5y678ldGddxG+6IxXFYGj603fR9ElcB4NLrWUlL524hxZFj
	gtIAsqzpnLN0JmOoe6QjTQ==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012019.outbound.protection.outlook.com [40.107.200.19])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49e6w7hpkd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 29 Sep 2025 08:29:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GIwQ9pZvYrJCTknZ87DPqKvKd34E0yLRaaVeq+IQFYKyd1EniK4rkz2oSzkZx7vnfh41NdQW+3dyNLuGmrpvMARJ41DG2BaJ+UeQ0Ai7WmxBeVymgIdI4wIaBbJ8YHkOVcuofix0DzOwMekLe9yudG0yYerjCmNXo9v1PaYpIePo6UxMIsRia5tF6hp6Sybsi8NWNkC3qSHKt6rWWB8pnXZyb88QttOSNe2rD+MJKeiMFwHNkQ/GG5EO1Ox/2xJk2bPAIlIs2Q0O7wcnYYxEoWnxcpCflpQzvgGnaARpymOGU0pIuYAQgWdXdMa1iyToHAXZ6jqByPwkf8OmpnFTRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=36Y1PelzHX1oKaah2om8f/bZmHhEZiYyFoGTLYT/0Nw=;
 b=KTeWVI0G0h1HnHsdiyjYTiXm0DnbdX88nLeWAGiG+SmzDXsrmEeRdb9QBpE2BUsTGyHjXzQfkE4GoMj3nFZTi7hNVerHAa3JL/7bxUSsX9kYdMiUBowA3Jt7WJBeSv+1/DuWic2BNoyaXmW+7OmCxIH1lihspxWURVnw5+oAgk3HiozXDDvIjseOzna7LQB3Ba9iFTzz4RK7D/mhPysBHgwV8l9ZLHbhIL0TsJEa2xcNgXqnPQIqVji4qQokvuKd1uzNf+m3T4u3JgQEjEazu+iK+zSs/zSq3UcO83EAy0kjfDEl3mzqDLJ59UedWN1T2X/A0E2ddhtIuEkdBj7rsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by SA3PR11MB7656.namprd11.prod.outlook.com (2603:10b6:806:320::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 08:29:28 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 08:29:28 +0000
Message-ID: <f07bc225-e3b6-4ac9-b6e4-de52d4053618@windriver.com>
Date: Mon, 29 Sep 2025 13:59:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V3 1/2] rust: Use clang instead of rust-llvm
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
References: <20250926102411.3742996-1-Deepesh.Varatharajan@windriver.com>
 <9433bf5a-8648-4142-a17f-69092253dd46@gmail.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <9433bf5a-8648-4142-a17f-69092253dd46@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: MA0PR01CA0044.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::17) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|SA3PR11MB7656:EE_
X-MS-Office365-Filtering-Correlation-Id: d0757f64-9058-4237-319d-08ddff324e27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|4022899009|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?c2oxd3lQbEVQUXZqakZLOENMUmIxd2dFVzdqeUVKSVRydGJ2M3VoNktHSWFP?=
 =?utf-8?B?Sm5RU1JhYi84ZmVWM09kU2lUNW9rRjErdW4yRlFwV0hsNEtWUUh0cVdsemJR?=
 =?utf-8?B?a1k5SUNvWUR0VkY2b2hTdVVpb1l3YmI1bGsxSnVuT2F2K0M5OGJUOXlBMjJP?=
 =?utf-8?B?eEhHVVdQOXkxOWdBYzlWWDNvMDMrUHBLT0V2UWxuTTVHUHJhZkNVak1VZmp4?=
 =?utf-8?B?Z1pOQWtiVGxPVjNhVUZ1c1JzUXN3YW11d1BwTUR6bVFwZGRJa0FHZndUMW1j?=
 =?utf-8?B?a1JSQ1dXRFdBaHBGcGRNSGlGZXRXS09zeW5PdTlaaWRuVzBFRTBOanIzSHg0?=
 =?utf-8?B?aXRVWHkvUnZKamphb0RWTHBjb1Z5em8vanJoRFpiZVZQeHl5clBHVDcvN0ox?=
 =?utf-8?B?d3M2UUJNZm5Xd0s3RWptOW9tVU1DSExabEluUHBpUU9rM0RvOE5OS21YY0Nr?=
 =?utf-8?B?a0NIS0tCeUZVVWhXeEJ1SjRCQitaQ2xiLzhiMjNleGkzaHVyRUNLMEFnN2xP?=
 =?utf-8?B?cHJVVXJDeExMNzU5REJ0K2g0K2g1cmpsTTFxVmtkV0NkamlGczVpSHR5SDNG?=
 =?utf-8?B?c1paYnZrZ2NXNW5sS1JuNFdoM3BNMVN4aXpmUDRiMjVRMlVOYjA3OWVUbkQz?=
 =?utf-8?B?TWlQNSs0TTFEK1o1MStmSWI5ckZmUmpWU3NUWkxEYVhURURweURzQURqbkh0?=
 =?utf-8?B?KzJtak55V3VDOTJjTXpEQjRrZjNvcWV5QTRjcWIxMHlvVHV5d3YvRlBNVmQ1?=
 =?utf-8?B?NENoODNObFdLK3JlLzE5TDIrejhzTjl1TDltaTJKRklONEV1aVVDTlVQMkhz?=
 =?utf-8?B?VGN1dnJXZldlMDVWVnZXb3hXL0s0Uit1ZGJGS3Zsd3NtZWsyVStBQTZCOENM?=
 =?utf-8?B?ckNpeSs2ZzJ6N0lCMHViY1BjUUtkTzdPZHBEeGRSUmx3emRKczhCZ2lSU0J5?=
 =?utf-8?B?dFkyYTFUTXBkMU1lM0p3RTlIbHY3bHlORkxIN01VWHUxTFc5Uks3U3U1SkJM?=
 =?utf-8?B?LzZsVjFuRWxxZHJFT0dyb1lodG9wSTNtYVJSb3lwWFJPUC9YZXo3MTZyYkVQ?=
 =?utf-8?B?cDlKUk5rUDUyVGVuQ3JlQVh5RUs1TFVHRVRKMUtOQmJqV2FjTUI4TUFpL1pC?=
 =?utf-8?B?N0pRRTlDSjBvR2o1NlpCR3A3ZW5ORElVQ3JaS3lBSnRGeWdaQTNZNkIyb3V3?=
 =?utf-8?B?WEhlNnV2Mlg3OW5BaGROMFJJV0h2SzhvT0ovT3UyYVNVWVZIU2JUQU9STm52?=
 =?utf-8?B?NzFoamxLbEd3Vnc2SnpwcDNBcW8yTjFrSEdPcE1tZmZXam5KM0sySEVIeFQr?=
 =?utf-8?B?OUVVbmtDTjVLRVc2TXpxNnBhcEtRZi9oNHdjVmhMZmJVTzI2SW5qaGVGNkUv?=
 =?utf-8?B?WUw5OVp3OGlScTIxSjA2ZmJTZ3BjbXovaVppN3U2MXQ5SE1zT0dpaDRLZmhu?=
 =?utf-8?B?WlJmRVE3aXZtcU93SHB5eG9GNmFXTTdHMG5Ed1lDZ0loM2Y5TUpveEZaNml2?=
 =?utf-8?B?TE5NbDVQdXJ2ZUxaZWFUUWVJRU4rN2pLVWJTNnIxZGhkSTlPZHNWODFlRk1M?=
 =?utf-8?B?WkwzSnRlZThCRFo2eE5Qd0wwbW96TEp1eWx1UlVxRFpLdnY4SVlpK3U0VFlB?=
 =?utf-8?B?NVhOMmJvQTkyTHlLYWpwdFBIdFhENGhmMGN2cks1SEdNR0dxaDJKb29KMVJW?=
 =?utf-8?B?ZTd0bE95dCtLbC9NMndQTlkrWHQ5T3pSU1dSaGhsaWdUMDAveTFBcWQrTi8r?=
 =?utf-8?B?b2RhWFUyZUlnVkUvZHhvUExvWnU4V3dCMjVhd0dYbDRTTW9oQjFyUlc0VWNI?=
 =?utf-8?B?SkYzQUdYTHA0ZlBJdkJZWDQyT1hVczNZQjRIZGZ2ZktSOEgxSk9udkVUUmFL?=
 =?utf-8?B?dklkcmhuMkVkUTJKMXEwcWVYT0RGT0lhdnF5WHcweU9VZ1E9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(4022899009)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RXNUZmpLMTJOaEdYbVE5MklrUXB5YVNuNTNDVGIwRjM5dFN1aG5zYkVZVHl0?=
 =?utf-8?B?ejlrYWNOcGM3VFg3a0xaWnNwQ3krRDdmeWhCaTlMMnBOL3F3Sm95UlY3dEhu?=
 =?utf-8?B?SEVrd3ZJdHpKNnJXSkRzMEpVeDFqcWJSUDJ4YTdXNmlrd1lSZ3JBN3ZMalRU?=
 =?utf-8?B?WU1QWDM0SnA5WDhia0VoUWs1WjJlTjVLWXFPUlZnL1lwUE5STVZuMXNWUzk2?=
 =?utf-8?B?WkJ3UHpESVorR25aZVk4UmRMSWVMS293Tk8xZ3UyOTlHMkZzQktPRllaMkdX?=
 =?utf-8?B?Vk1vM210VVFRc3gvSlZzOGQyenVNbWxBSE9Mam9jMko2YTBtMVhaSkVGV09D?=
 =?utf-8?B?V01WbkpBNXZJYlZNSEdOdnNRWEk1Vm9EdjcvRG1NUUxhNlVZVHpNS0VZazNr?=
 =?utf-8?B?clVKbVZVMXkwZ1pHNjJOR3lhZHNZQW9NaitCQWlydnZXQ093N3RpU1Uvekx0?=
 =?utf-8?B?Z1ZtYlBIeUZ3TElPL1F4WDV2WWw5dGh1bDhKKzBXa0pEaWRtR1AyczJQbXJK?=
 =?utf-8?B?cXhpUndIbWtXTStZVG0rY0JCVEdtbFVmd0pIQVl0aWJpV3hGbFM3R2pyalFQ?=
 =?utf-8?B?WTI2ZXM1ZlZIdFBSTkRqWmI3d1RVM3NqRVVVWXJmSENCclRIVkR0TEVmV1Vo?=
 =?utf-8?B?empHQ1MyMzZraVBMTGJJWWlJK3JLUVVZdXArR04yYUpGR3hRdDBUT0s5Mk9U?=
 =?utf-8?B?TmJxTW1sNC8wWG5qanQrTWNkZEhUMmhBTWRJdDdQdzBMUVZGUy8zRTZ5aXNE?=
 =?utf-8?B?RmJDY2NpTjJIdW9oTTAvbWlXdWtGakk1VDdueTVIOHZsVGoyek1SSlFaSXZ0?=
 =?utf-8?B?cDI3K3VQUmVhTnhGOTVrMTBrUnpybE92UmZFdkp2SFd1UTI4eVdUV29rWEcv?=
 =?utf-8?B?Rzh3V1ZlZXhwS3ZFMzRub1g4VkZRTmxFTmh4OGUvWTZWUGZzcnJIQmRIbk5w?=
 =?utf-8?B?NFhCUUJ1K3UwSHRFeUg1aUwvRFlIRFVZSnFtNEdMUi9wL0FHK1ZMa0JrdGJP?=
 =?utf-8?B?UmQ2dGpSQmNHSW1OdGI0RjZxOU1wVHJTK2dHT01NN1JydlZqOXMyRzVsandt?=
 =?utf-8?B?bjlMMDlmL2creUlpWlE2Y0phK0hmZ2dMMkdESnRGa2Z1RGxqVFduWU1MZFpX?=
 =?utf-8?B?aEM2ODlaMWpCWWVaSUhFUXVPZGZIY3oxeHdZMWNBaXhuSjFRU1RpT0dKMlZZ?=
 =?utf-8?B?c2duK25kcjBpdzJvYzcxNjBRenRNTWtBZkNCRExQcFdDYytQbEZ3SmFtcm1V?=
 =?utf-8?B?T2dwVXN6cEUvL1dXNFZRZnQzMXF6MUwwNHViU3N3UjN3TFR5YTVZcXJtS1FB?=
 =?utf-8?B?aVdXWGIwbTNnVkI5TDI1a0NKcjN4Z21xQjJESDNPdkxra2pGSGxnN0NWbGN1?=
 =?utf-8?B?NURMQWNQR0piSzYzTTg1MEpsb20vdU1FVnlEZXdmTnZaMm1GNkxUTE9GUTJF?=
 =?utf-8?B?T2VPbkcxZnlpakkyVk9pa3BOVWZGQ094ZlB2T3pLRG9tK3JISGZXbHNvOGkw?=
 =?utf-8?B?aVBhV1hLWEloOUNQTkJmZzA1RnVBYjNoLzdVWTQ5S3Q4aXNndk8yeXJSd3kr?=
 =?utf-8?B?cEFzb0NtN1dYSytXN3h1bGYybnhOR0UrVmV0QnVtUXZLZTNqYzd2SUpoaUlN?=
 =?utf-8?B?Y2dDbG1xaFRiSDdYNVFmTXk1OTFibEpYdVJyWXRlbnJ3SmdqYnRsTUxscEJC?=
 =?utf-8?B?OFFLQmthdUptRDZXamNkVTJBbG55eWdZNE1Gbnc2cHpNZ0YxMG9RT251Nmha?=
 =?utf-8?B?OU1WYzNlTEJDZjFaY2NxUkVTNUdPcUdqb0MwMFMzVkFSTWRDSWVCMmVTWHNH?=
 =?utf-8?B?MlNDODcvZGJzTVBubm5HbEhNMThXeFUvWkMyeVRPc1pFMXhLdzVmQTFydTdy?=
 =?utf-8?B?bExNNk1iQkJWQUZHVS9uSzdmTVhSQjJZQUZERTRJOVhyMFRVa2NtZ3BIelRM?=
 =?utf-8?B?REFzRHUzaEk3QTQ0YWFESTUzNTVWM2xDWlFwY0dVc3ZBaW54MTJEVHRyTVl3?=
 =?utf-8?B?MXpKendFaE5LNGpUZHdOVm5ZZ2dxaXcyRmFMWUUzZXVSWW1lZ0xmejY4djk5?=
 =?utf-8?B?STFlYzM2V2lUUnZnaTZ4N3FnZDhCQ3lxYWZGR3hiemo1eUxYb29zS2RrM1lN?=
 =?utf-8?B?eHRyRnQ0dENnWHhWWTlvQ08rRzltSVZWb2p1Q3lxdDJ1WW9mOVd4V2wzbnRU?=
 =?utf-8?Q?sUFFq3obgUPSq3vMmsIm8sM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0757f64-9058-4237-319d-08ddff324e27
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 08:29:28.6392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DAWO5cjt+hmQWOdEbvWq/8yVbclTgHBYb3rfV1IZ4gc/6GWfTafvaNwu8dkRHWAT1GbgopV3okhaNUmXEMsdzn2wcqGKYfAhGdkcCPjfCa2rn3u7k1u435lyEUE3D/Q7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7656
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDA4MSBTYWx0ZWRfX72F8314TYhqC
 VQR/sXjMh2qa87g3lZSEhU7SjmsAWeGzmj7TGKlYpos+MXv8pfCM/mNNaxxyLLxalmH5w/4dtvm
 HXwIAcl1CdaBlwbC9TU5/zektw9soS+s9pu6CPR2wAiccwdl7YRPwbxdFulSnYvyFC0DqA7KzJT
 GHzg/N6MnyuZ7+M4yaDb5wSuy9/56N5mRZqHTqtsFd6pdjrH/yaOd1OuvxlvPjL6U7cz733USmb
 4RIJbwuR9/iBg1SqGBMGZ0FeMm+TRfO0GPwVdhjo/4D5i+Wg9eolDoYykZ5PgUYTzrqdPUbM2UC
 /31M0GWPVeSnmX4O4DRQoJ2aN0CVSDFcMYfrr/FvgcIUNI4dgtwt1+/yLC7up+WFsH08I1cpqMQ
 1wZerdH2qsxACnCZg8scafwBKlxe6g==
X-Authority-Analysis: v=2.4 cv=Lc0xKzfi c=1 sm=1 tr=0 ts=68da436b cx=c_pps
 a=jJxBgQE0Gv9vBhouG1T1Tg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=ei4SEBeUAAAA:8
 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=MjmsNxC-51y9pvLLj4QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Hqou25T6mLgA:10 a=8zIOOLb7Ym0NljyPXbuS:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: by7SM0e6X-a68NpnbnMDl09M_FsOLaui
X-Proofpoint-GUID: gMEnYTSQjf7SvYAf3FBIYPVs3-lhRApz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_03,2025-09-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2509150000 definitions=main-2509290081
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 58T5KbN23954079
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 08:29:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224125


On 26-09-2025 23:00, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>
> On 9/26/25 3:24 AM, Varatharajan, Deepesh via lists.openembedded.org=20
> wrote:
>> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>>
>> Updated the Rust build to depend on Clang instead.
>>
>> *Summary of discussion with the rust upstream about using latest LLVM=20
>> instead of Rust maintained LLVM fork.
>> https://internals.rust-lang.org/t/can-we-use-proper-clang-instead-of-l=
lvm-fork-what-rust-uses/23489=20
>>
>>
>> *Upstream LLVM is generally compatible:
>> - Rust does support building with upstream (vanilla) LLVM, especially=20
>> the latest
>> major release and the one or two preceding ones.
>> https://rustc-dev-guide.rust-lang.org/backend/updating-llvm.html#updat=
ing-llvm=20
>>
>>
>> *Impact on Yocto Rust upgrades:
>> - Rust upgrades shall always check for updates on rust forked llvm=20
>> and backport
>> the relevant patches to clang's llvm.
>>
>> *Regarding the rust forked llvm local patches:
>> - There are no local patches on rust forked llvm other than the=20
>> backported fixes
>> from llvm master.
>>
>> *We now add these flags "-Clink-arg=3D-lz -Clink-arg=3D-lzstd" because=
 of=20
>> this following
>> diff otherwise we will get errors during link time.
>>
>> Setup in rust-llvm
>> -DLLVM_ENABLE_ZLIB=3DOFF \
>> -DLLVM_ENABLE_ZSTD=3DOFF \
>> -DLLVM_ENABLE_FFI=3DOFF \
>>
>> Setup in clang
>> -DLLVM_ENABLE_FFI=3DON \
>> -DLLVM_ENABLE_ZSTD=3DON \
>>
>> *When multilibs enabled:
>>
>> llvm-config expects static libraries to be located in the lib=20
>> directory rather than
>> lib64. However, since LLVM is built as a non-multilib component, the=20
>> lib directory
>> doesn't contain any library files. To accommodate this without=20
>> breaking multilib
>> behavior, we copy the required library files appropriately.
>>
>> Previously, when we depended on rust-llvm, this worked because we=20
>> specified:
>> -DCMAKE_INSTALL_PREFIX:PATH=3D${libdir}/llvm-rust
>>
>> With this setup, llvm-config was installed inside=20
>> ${libdir}/llvm-rust, which included
>> its own bin and lib directories. Thus, llvm-config located in bin=20
>> would correctly find
>> the libraries in the adjacent lib directory.
>>
>> Even when multilib was enabled or not, llvm-config would still look=20
>> for libraries under
>> lib in this structure, so everything functioned as expected.
>>
>> *Changes needs to be done when llvm splits from clang:
>> In rust recipe:
>> Update the dependency from:
>> DEPENDS +=3D "ninja-native clang" to DEPENDS +=3D "ninja-native llvm"
>>
>> In llvm recipe:
>> Apply the same changes that were made in the Clang recipe, as those
>> configurations have now been moved to the LLVM recipe after the split.
>>
>> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.co=
m>
>> ---
>> =C2=A0 meta/recipes-devtools/clang/clang_git.bb=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 4 ++--
>> =C2=A0 meta/recipes-devtools/clang/common-clang.inc |=C2=A0 6 +++---
>> =C2=A0 meta/recipes-devtools/rust/rust_1.90.0.bb=C2=A0=C2=A0=C2=A0 | 1=
8 ++++++++++++++----
>> =C2=A0 3 files changed, 19 insertions(+), 9 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/clang/clang_git.bb=20
>> b/meta/recipes-devtools/clang/clang_git.bb
>> index 53bca1c24f..3e117b308b 100644
>> --- a/meta/recipes-devtools/clang/clang_git.bb
>> +++ b/meta/recipes-devtools/clang/clang_git.bb
>> @@ -83,7 +83,6 @@ OECMAKE_SOURCEPATH =3D "${S}/llvm"
>> =C2=A0 # https://github.com/llvm/llvm-project/blob/main/llvm/CMakeList=
s.txt
>> =C2=A0 LLVM_TARGETS_GPU ?=3D "${@bb.utils.contains_any('DISTRO_FEATURE=
S',=20
>> 'opencl opengl vulkan', 'AMDGPU;NVPTX;SPIRV', '', d)}"
>> =C2=A0 LLVM_TARGETS_TO_BUILD ?=3D=20
>> "AArch64;ARM;BPF;Mips;PowerPC;RISCV;X86;LoongArch;${LLVM_TARGETS_GPU}"
>> -LLVM_TARGETS_TO_BUILD:class-target ?=3D "${@get_clang_host_arch(bb,=20
>> d)};BPF;${LLVM_TARGETS_GPU}"
>
> compiler we build is building all architectures once because it then
> reuses same compiler for all cross compilers just by creating canonical
> symlinks, this change is not going to work.
We removed this line because, for the clang class-target build, LLVM was=20
only compiling
libraries for the target architecture and GPU targets and kept inside=20
the target
sysroot. Since we use the llvm-config built for the class-target during=20
the Rust target build,
it was failing due to the absence of static libraries for other=20
architectures in the target sysroot.
Here the target is x86 arch. So, it compiled libraries for x86 arch only=20
and we can see the error
for missing libraries for other archs as below:

|=C2=A0 =C2=A0--- stderr
|=C2=A0 =C2=A0llvm-config: error: missing:=20
poky/build/tmp/work/x86-64-v3-poky-linux/rust/1.90.0/recipe-sysroot/usr/l=
ib/libLLVMAArch64Info.a
|=C2=A0 =C2=A0llvm-config: error: missing:=20
poky/build/tmp/work/x86-64-v3-poky-linux/rust/1.90.0/recipe-sysroot/usr/l=
ib/libLLVMLoongArchInfo.a
|=C2=A0 =C2=A0llvm-config: error: missing:=20
poky/build/tmp/work/x86-64-v3-poky-linux/rust/1.90.0/recipe-sysroot/usr/l=
ib/libLLVMLoongArchDisassembler.a
|=C2=A0 =C2=A0llvm-config: error: missing:=20
poky/build/tmp/work/x86-64-v3-poky-linux/rust/1.90.0/recipe-sysroot/usr/l=
ib/libLLVMMipsInfo.a
|=C2=A0 =C2=A0llvm-config: error: missing:=20
poky/build/tmp/work/x86-64-v3-poky-linux/rust/1.90.0/recipe-sysroot/usr/l=
ib/libLLVMPowerPCInfo.a
|=C2=A0 =C2=A0llvm-config: error: missing:=20
poky/build/tmp/work/x86-64-v3-poky-linux/rust/1.90.0/recipe-sysroot/usr/l=
ib/libLLVMRISCVTargetMCA.a
=2E
=2E
=2E
|=C2=A0 =C2=A0thread 'main' panicked at compiler/rustc_llvm/build.rs:277:=
16:
|=C2=A0 =C2=A0command did not execute successfully:=20
"poky/build/tmp/work/x86-64-v3-poky-linux/rust/1.90.0/recipe-sysroot/usr/=
lib/llvm-config"=20

"--link-static" "--libs" "aarch64" "amdgpu" "arm" "asmparser"=20
"bitreader" "bitwriter" "bpf" "coverage" "instrumentation" "ipo" "linker"
"loongarch" "lto" "mips" "nvptx" "powerpc" "riscv" "x86"
|=C2=A0 =C2=A0expected success, got: exit status: 1

Maybe instead of removing. Can we change
-LLVM_TARGETS_TO_BUILD:class-target ?=3D "${@get_clang_host_arch(bb,=20
d)};BPF;${LLVM_TARGETS_GPU}"
to
-LLVM_TARGETS_TO_BUILD:class-target ?=3D=20
"AArch64;ARM;BPF;Mips;PowerPC;RISCV;X86;LoongArch;;BPF;${LLVM_TARGETS_GPU=
}"=20
?
>
>>
>> =C2=A0 LLVM_EXPERIMENTAL_TARGETS_TO_BUILD ?=3D ""
>>
>> @@ -107,6 +106,7 @@ EXTRA_OECMAKE +=3D "-DLLVM_ENABLE_ASSERTIONS=3DOFF=
 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DLLVM_ENABLE_PIC=3DON \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DCLANG_DEFAULT_PIE_ON_LINUX=3D=
ON \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DLLVM_BINDINGS_LIST=3D'' \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 -DLLVM_INSTALL_UTILS=3DON \
>
> tabs vs spaces inconsistenty. Please fix it.
Sure.
>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DLLVM_ENABLE_FFI=3DON \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DLLVM_ENABLE_ZSTD=3DON \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DFFI_INCLUDE_DIR=3D$(pkg-conf=
ig=20
>> --variable=3Dincludedir libffi) \
>> @@ -137,7 +137,7 @@ EXTRA_OECMAKE:append:class-target =3D "\
>> -DCMAKE_AR=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ar \
>> -DCMAKE_NM=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-nm \
>> -DCMAKE_STRIP=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-strip=
 \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DLLVM_TARGET_ARCH=3D${HOST_ARCH} \
>> + -DLLVM_TARGET_ARCH=3D${@get_clang_target_arch(bb, d)} \
>
> why is this change needed ?
>
I made this change to ensure that LLVM_TARGET_ARCH is set correctly to=20
the actual target architecture.
However, it appears that even without this change, the build completes=20
successfully for the target. I checked
and printed the value of HOST_ARCH and realized it was already set=20
correctly my mistake. This change is
not required.
>> -DLLVM_DEFAULT_TARGET_TRIPLE=3D${TARGET_SYS}${HF} \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DLLVM_HOST_TRIPLE=3D${TARGET_=
SYS}${HF} \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DLLVM_LIBDIR_SUFFIX=3D${LLVM_=
LIBDIR_SUFFIX} \
>> diff --git a/meta/recipes-devtools/clang/common-clang.inc=20
>> b/meta/recipes-devtools/clang/common-clang.inc
>> index bf3a63914a..c22e3c1b19 100644
>> --- a/meta/recipes-devtools/clang/common-clang.inc
>> +++ b/meta/recipes-devtools/clang/common-clang.inc
>> @@ -30,10 +30,10 @@ def get_clang_arch(bb, d, arch_var):
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 elif re.match('aarch64$', a):=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return=20
>> 'AArch64'
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 elif re.match('aarch64_be$', a):=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 return=20
>> 'AArch64'
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 elif re.match('mips(isa|)(32|64|)(r6|)(=
el|)$', a): return 'Mips'
>> -=C2=A0=C2=A0=C2=A0 elif re.match('riscv32$', a):=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 'RISCV'
>> -=C2=A0=C2=A0=C2=A0 elif re.match('riscv64$', a):=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 'RISCV'
>> +=C2=A0=C2=A0=C2=A0 elif re.match('riscv32$', a):=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 'riscv32'
>> +=C2=A0=C2=A0=C2=A0 elif re.match('riscv64$', a):=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 'riscv64'
>
> This is representing LLVM backend name and not normal arch and clang
> uses RISCV for both rv64 and rv32
>
After this change were made,
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DLLVM_TARGET_ARCH=3D${HOST_ARCH} \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DLLVM_TARGET_ARCH=3D${@get_clang_target_a=
rch(bb, d)} \
do_configure of clang failed
with the following error:

| CMake Error at cmake/config-ix.cmake:585 (message):
|=C2=A0 =C2=A0Unknown architecture riscv

Since this change is irrelevant
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DLLVM_TARGET_ARCH=3D${HOST_ARCH} \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DLLVM_TARGET_ARCH=3D${@get_clang_target_a=
rch(bb, d)} \

The below changes are also not needed.
 =C2=A0-=C2=A0=C2=A0=C2=A0 elif re.match('riscv32$', a):=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 'RISCV'
 =C2=A0-=C2=A0=C2=A0=C2=A0 elif re.match('riscv64$', a):=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 'RISCV'
+=C2=A0=C2=A0=C2=A0 elif re.match('riscv32$', a):=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 'riscv32'
+=C2=A0=C2=A0=C2=A0 elif re.match('riscv64$', a):=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 'riscv64'
-=C2=A0=C2=A0=C2=A0 elif re.match('loongarch64$', a):=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 return 'LoongArch'
+=C2=A0=C2=A0=C2=A0 elif re.match('loongarch64$', a):=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 return=20
'loongarch64'
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 elif re.match('p(pc|owerpc)(|64)', a):=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn=20
>> 'PowerPC'
>> -=C2=A0=C2=A0=C2=A0 elif re.match('loongarch64$', a):=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 return=20
>> 'LoongArch'
>> +=C2=A0=C2=A0=C2=A0 elif re.match('loongarch64$', a):=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 return=20
>> 'loongarch64'
>
> same problem as above here
>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.fatal("Unhan=
dled architecture %s" % arch_val)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ""
>> diff --git a/meta/recipes-devtools/rust/rust_1.90.0.bb=20
>> b/meta/recipes-devtools/rust/rust_1.90.0.bb
>> index 5d804c7398..c2cb8f8829 100644
>> --- a/meta/recipes-devtools/rust/rust_1.90.0.bb
>> +++ b/meta/recipes-devtools/rust/rust_1.90.0.bb
>> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D=20
>> "file://COPYRIGHT;md5=3D11a3899825f4376896e438c8c753f8dc"
>> =C2=A0 inherit rust
>> =C2=A0 inherit cargo_common
>>
>> -DEPENDS +=3D "rust-llvm"
>> +DEPENDS +=3D "ninja-native clang"
>
> I think using 'llvm' instead of 'clang' here is more appropriate to
> represent the dependency, clang provides llvm as well, it also ensures
> that when we split llvm out of clang recipe then you do not need to
> change it.
Sure will do that.
>
>> =C2=A0 # native rust uses cargo/rustc from binary snapshots to bootstr=
ap
>> =C2=A0 # but everything else should use our native builds
>> =C2=A0 DEPENDS:append:class-target =3D " cargo-native rust-native"
>> @@ -28,8 +28,8 @@ PV .=3D "${@bb.utils.contains('RUST_CHANNEL',=20
>> 'stable', '', '-${RUST_CHANNEL}', d)
>>
>> =C2=A0 export FORCE_CRATE_HASH =3D "${BB_TASKHASH}"
>>
>> -RUST_ALTERNATE_EXE_PATH ?=3D=20
>> "${STAGING_LIBDIR}/llvm-rust/bin/llvm-config"
>> -RUST_ALTERNATE_EXE_PATH_NATIVE =3D=20
>> "${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-config"
>> +RUST_ALTERNATE_EXE_PATH ?=3D "${STAGING_BINDIR}/llvm-config"
>> +RUST_ALTERNATE_EXE_PATH_NATIVE =3D "${STAGING_BINDIR_NATIVE}/llvm-con=
fig"
>>
>> =C2=A0 # We don't want to use bitbakes vendoring because the rust sour=
ces=20
>> do their
>> =C2=A0 # own vendoring.
>> @@ -188,6 +188,16 @@ python do_configure() {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.build.exec_func("setup_cargo_environ=
ment", d)
>> =C2=A0 }
>>
>> +#llvm-config expecting static libraries in 'lib' instead of 'lib64'.
>> +#Since LLVM is built as a non-multilib component, the 'lib' directory
>> +#doesn't have any library files when multilibs enabled. So, copying
>> +#library files without impacting multilib behavior.
>> +do_compile:append:class-target() {
>> +if [ -d ${STAGING_DIR_TARGET}/usr/lib64 ]; then
>> +=C2=A0=C2=A0=C2=A0 cp ${STAGING_DIR_TARGET}/usr/lib64/libLLVM*.a=20
>> ${STAGING_DIR_TARGET}/usr/lib/.
>> +fi
>> +}
>> +
>> =C2=A0 rust_runx () {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo "COMPILE ${PN}" "$@"
>>
>> @@ -199,7 +209,7 @@ rust_runx () {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unset CXXFLAGS
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unset CPPFLAGS
>>
>> -=C2=A0=C2=A0=C2=A0 export RUSTFLAGS=3D"${RUST_DEBUG_REMAP}"
>> +=C2=A0=C2=A0=C2=A0 export RUSTFLAGS=3D"${RUST_DEBUG_REMAP} -Clink-arg=
=3D-lz=20
>> -Clink-arg=3D-lzstd"
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Copy the natively built llvm-config i=
nto the target so we can=20
>> run it. Horrible,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # but works!
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#224075):=20
>> https://lists.openembedded.org/g/openembedded-core/message/224075
>> Mute This Topic: https://lists.openembedded.org/mt/115446166/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=20
>> [raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>

