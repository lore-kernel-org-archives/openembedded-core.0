Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E37E4CAC59A
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 08:34:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.11447.1758270876055741618
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Sep 2025 01:34:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=h0kIHhUF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=135712f5a8=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58J6i8nA765221
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 01:34:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=96FRvNY+KwnyAiAQfduOQS
	BaGdOpphiAKP77xMKOsZ4=; b=h0kIHhUFiNsgS8fx8Y9PWrCynlO/FhOCzYctw3
	oBjbj1ja3478QLNi5yns7HJWpnTuhPdBRb+J9oJAj7IFhyFvLg6R0srSCBKfFEDH
	CVJlh7Rp06Y/KQGFySOCSbTUE2s+nyuZD7bvImsxuqJsdV92Ae/qDZsDg3xsEyFi
	bFUsoBG9U6HX8ElorrOj1w5ibANg0iB81XbePCzQVX2f235pJ86rp2kxisrA8U9K
	NjZtDCPglbM74AmWd4M6vcFZp0sykr6FfPII/M6cUUuG9mdfRuzhpCRlskHfJ28v
	yrgS9yzxluN//HdVvYX5Dj9yWFgFy+Cv9uRKqyG1kfKAyNEg==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011020.outbound.protection.outlook.com [52.101.52.20])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 498vgr09xj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 19 Sep 2025 01:34:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=epEAaZpuZ5fma2mqTSHCnOPheH6nSlgiA3WXQhILl4SIOsT0/gT4Bt75KPeBSRNvUMXAzImvCL1b12e7+61GoP5Ipo85fdgXh4GGLEXhe9++D7T1B0nDMUyFAIL+sTD7Zmx4/OB5FZ1lvmHVdUa5HbgBqmkrQ9dbsgq4utsL74akMktcn+51HpXfWiydr4sPTCvAKS4Bu6Kux7VT1j/mA/VAp6K78XzJrcnH0b2d3z0XTihI9zXhhfGLTLaz1U5qT5vzZmy0oU4rPiuxRB0fAcSTDXIX/exHGbZkfaI6q3jkw6Z5WMu64bEVFRlZpZLlhmmu1BXN+vMitkNzYIa24g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=96FRvNY+KwnyAiAQfduOQSBaGdOpphiAKP77xMKOsZ4=;
 b=q9xJTblI+KiiRyd1vgHreve4NhyYCgmLkEChP1WpGxGoMxeKMNKtpxiGVb5Wi534OhFNj/gEorisp7U+ip4Ia46JW8b1c4cGb1KX8pgvQcAJboD5LbnVJqpzuLpsWDsrdxkgAZ0ofb2i0YkyL7fxNVAfcM4jJq0T3XG30bzMwYS37x+lqMGzrMBNqOgzsVNiJOS3A+ZJsdBLh5IDB8x4EKFkEXUuwTy9AsZvOiE3al7O+EoyfuQDYsdCawG+dLhZizg/0BEG+4P0l+HiM/TcFh/B97BDhHRusS3KvpKzIjtVVq/KAiHSy5N0x31KnlJvlhYFkocdb9mpOf6PjIXERg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by PH3PPF5D8CD6E8B.namprd11.prod.outlook.com (2603:10b6:518:1::d25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Fri, 19 Sep
 2025 08:34:31 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%5]) with mapi id 15.20.9137.015; Fri, 19 Sep 2025
 08:34:31 +0000
Content-Type: multipart/alternative;
 boundary="------------z7lx678tEr66csjHbj6xv6sK"
Message-ID: <00533f1a-9384-4673-a786-c6a9371acc51@windriver.com>
Date: Fri, 19 Sep 2025 16:34:26 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 4/8] debug_build.inc: collect debug build tuning
 configuration
To: hongxu.jia@eng.windriver.com, mathieu.dubois-briand@bootlin.com,
        openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com, peter.kjellerstedt@axis.com,
        Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20250916040927.103722-1-hongxu.jia@windriver.com>
 <20250916040927.103722-4-hongxu.jia@windriver.com>
 <DCV1DEVKB7V0.2YZ96FPV5N3X6@bootlin.com>
 <1866903FE1AA84E8.22280@lists.openembedded.org>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <1866903FE1AA84E8.22280@lists.openembedded.org>
X-ClientProxiedBy: TYCPR01CA0188.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::20) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|PH3PPF5D8CD6E8B:EE_
X-MS-Office365-Filtering-Correlation-Id: 61d66fd4-06a7-4493-99b0-08ddf7575ab8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|4022899009|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?b3pOZDZ1L0VtazZjNER2dlZoOGszZnp1Y3kwdU5HN2ZSTGxmSUlIaTVlbU5y?=
 =?utf-8?B?WmNKUU9QK1B5aDhIUU5GUldwdVBIcWk4WnpQT1Z4eUY5ZnErZGhFR0E2VVgx?=
 =?utf-8?B?U29SRC8vRW5SY0pDMzJJcjk5Nm5kbVllNHdTZVFIVG11ZlF1dTlDemxMOFV2?=
 =?utf-8?B?aUlRUUR6dmpmRnVBSkdRU0pUWEZuVVc5MFpjeVZQU1huQ3U3WFNDWVIrbzNo?=
 =?utf-8?B?WFJEb3NSYTlsbDlvS3l3b1NlRGc4S3BWWGdUZWNiOGtSWmhKUGhNZzJzTkFl?=
 =?utf-8?B?TzVEWFVhckVvNGkxVzBKNm5pQWlsQ2tZWmpIT1kvTDNxTXdHVkw3VzFEbmtl?=
 =?utf-8?B?dXNpM2ZTQ2d1aU1jTm1vaEpzMm1wM2FkZERLNnpiR1ZoQXF6Y1FxZUxCZzR4?=
 =?utf-8?B?cHBJcUZCVWJtZURFZ0I2VkhIMmF6b281VkFSVFJjbG1KNUlsOTY2QUQ0QkRW?=
 =?utf-8?B?YTdYVkVvSmo4bTBTeFJHbkF4bmVjZW51dVFpSUtHZHRjVkZsT3liQTZHWFpZ?=
 =?utf-8?B?c3FMSkpsWDNNQ3hBRFN2K0NSZmdhaFQxRHVwYnN6NjBXd1VDUDRoek9laEFy?=
 =?utf-8?B?TG5qM2cyWStoQlU4Y3FucmZtMTdPYkp2Z2JzQWFBOHpFZDRJWUNCZmRrTmth?=
 =?utf-8?B?ZExtamhqY1MvZENxNk5VcHhlbkdML25wRzZmOVFBTmlFcEhRVGE0Vlp2NUlu?=
 =?utf-8?B?ckpiTEJBVmZGRkUrRjg2YzdSUVI5UHNpMU8xZUNKRy9JWHRhWlNTaVNiRjBm?=
 =?utf-8?B?TUNrYlJIeHZyMS9jSkh0cE4wemllblZUT0E4M0hJcjJQTjZ2T1BkUU0rcmRJ?=
 =?utf-8?B?bnN1RWFUcmQzUmFrU0VrV0drZEtiZlBIWXlYaUh4TzNDYzdBT2xteU5KOTdR?=
 =?utf-8?B?NTN0em83bDJmOGlvdm5FL29yeUY2K2JvV2FJRDE1R0ZucE1OVmVsdDNZTm1D?=
 =?utf-8?B?REJGYkpaQXYxNU40TlZMZS81ZU9hQ0VodmJ4R3Fybld4d2tGQnpXcEdQM2FL?=
 =?utf-8?B?Zmg3YVh4WHFiQUhLOWllL0xMV0VMNXE3bWhGUzhRR0sxMHcvTTdpRElCdjBW?=
 =?utf-8?B?OU1jbmhtMzcwN3N0djUxYnArWUlSbGJ6M01nQTZOUXI0dFVtbDlLTGJhWXFa?=
 =?utf-8?B?VURCSVdramtjaUdZSGd3ckhPc1ZtS08wNzk4SElLcDdYbS9Kd0U1dWhieVpu?=
 =?utf-8?B?MTQ1ei8xSEpaOWlPVk5HcTlxaVF3RG9ORjA0WjJmeGtLVHJWTzVHcVZ6aWpk?=
 =?utf-8?B?VjgvNjJYOUw0bkIwaldtdzhsRnNvTTliYXViamR3dy84K01QTHRLYzZQL2lr?=
 =?utf-8?B?aFRoWjJrcHpKWjhYZ01RaldCZVYrcVAweFFvanlBMWkzVDdvVlBWVGo1NG83?=
 =?utf-8?B?U2xtMHdiU1cybUM5cDZOVlBTeVlPUG90QWZmZ3IxSDlCaC9HdkYzbk81V251?=
 =?utf-8?B?V1MybzlKUlc0RFdlZXZHMUMxQjQ2RW5kQ2I1bmphUlZDQlA3MUUxRWt6TWph?=
 =?utf-8?B?bC9yL3pvWmI4VUt1dmRxOEFHWkgvTUU0S1Z6elRVVXZpdjkyeTRWK0VuYlE1?=
 =?utf-8?B?ME5qeDNJM1YrMHIxK0lvYWZaY2dFZUZXeEttNEpmWXd1b2FObVljS1djS3M0?=
 =?utf-8?B?djc4UmxEck9jVFd1c0xPaXQ3cStzWlNPN01Fc21TMHVKUU5UYUErak5pcnJk?=
 =?utf-8?B?MHY3Unc5MVphcXhjMllmSWFhZ3pTSVNhSWVJYUY3b3BXQVNyakRJWXRBUzIy?=
 =?utf-8?B?K1BwZlVSbE5iR0NJL0w5cWhPb2pSWmk4Z1l1a2piY0pVajQwVTlUR0VZdUtM?=
 =?utf-8?B?ZXdWcTlXci81WTRlbko1T0cwR0VQT20rVjJJaGZacFh4d1BscVI0VzZLTC9P?=
 =?utf-8?Q?mofQmFISRH3B4?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4022899009)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ejMrREl1SDhHYlJpcWVHSFdocjl3cFVRM3R2VmtYbi91TVY0MDVzVlplSkxx?=
 =?utf-8?B?czVXMFJ5TVVCOWVqbzE0YU03cnZhcE1jdXJ4RTBrSFpyNVNvU3BrOXo5QmVE?=
 =?utf-8?B?K0FrWmUwbTUvaXQ1WXJDUDROOS9oREtwd0k5Mzh5aHVhTVgzNXhyUDVYSmRm?=
 =?utf-8?B?RXZ2WDR4SlQ0S29xTVB5bnI5ZERWVlZ4L0ZIVnE3MDBMNkJDSnAraTZSNWJw?=
 =?utf-8?B?dDE4U2pVUjRjbE5yelU2dGJtQ1VCVmRCN2tzbndiUUNycmEvRkNiS0VXcXNz?=
 =?utf-8?B?UGkvYTBUcWx3QVA3eGhmUU4rNUdpRitEODJzUjh1MUhjMXpHNlc5amdXWlFM?=
 =?utf-8?B?VkxySm1EMU5EWXlyMzNURlJ6czMrcVJVNktoRDBFdTFTOGdQVm0wTUVlV3h4?=
 =?utf-8?B?bXdUM2Y3SmJ2QXdTMTRWRVo3TUE5a2tpczRPanc2OVpINDlvMksvRHV0bjZG?=
 =?utf-8?B?RHdDS3Vabi9jMTdxbzBBKzYxbUJDY002akovRy9EOXZzdmNERjJieFZ3cGY2?=
 =?utf-8?B?S3FwaXFES1l3V0xaMmVFVTRjdnZMZm9ENzkyWlNsQUN3M2E2cUZzUWZ2bzdo?=
 =?utf-8?B?RllVT3NIQm5QTW9qdkJKZDd0dnRSdmQ0U0tTWGxSV1JuWnUwTWpUM0F6WE4r?=
 =?utf-8?B?Tkt5MC91QkZSc2VCTDI5dkVhWXE1OGc4NnlNRndweUFSTkFNa2VyWVJRQ3JM?=
 =?utf-8?B?SXg4YTZCR0twaUdrNW0vTWFxaGhvbEh6d1lNeXFxYTdwcGVOWVNObklpMXE5?=
 =?utf-8?B?Qis0QXRnbVR6eSs3dldpZTNYY3pab05DOHc3b1FSU2ZHSm1rMU1ZcWl3eVhC?=
 =?utf-8?B?dmZpS1UzMTEyakVobmJvSHY0M3dWSzlYTkVhRURMUGdPbVRGTGJLTWZDaTZ4?=
 =?utf-8?B?UDA4UzNYRm80RHIyUk9xM2dtc3dqMHN6N2N2SFM5dWlUTG81Z3JUQzN4Q2tZ?=
 =?utf-8?B?SS9VczhQUUNNY1c3Ym53NDR5UFRPT1N6T0ZnNXArdFM5Nm80a3VHQUZ4VSto?=
 =?utf-8?B?OVhiVHRpd1M5b0pSL0J0c1pSOHdEZ2hWK042d1cvdnRsMVhDUjVpMDVIc0RZ?=
 =?utf-8?B?NitYZHdaWWt0eHhLUHA5YWIrQ052c3luY0lxVjdmc2tPWG5RMk9yYlYveDhh?=
 =?utf-8?B?VzViYlZHZVlkTVJKTmVPaEFuNEF5SjRDcUZDVDcwamE2TEh6SkhQbVZTSmFM?=
 =?utf-8?B?QjJ5ZTB3aFVKRkJid3c1UjVIaCtiSXNrbzZpN1FnYlozTWJxUzdPM25BbGl3?=
 =?utf-8?B?VVhYQUVXaDBHOUZlWjV2NG1TMEI3MGFEUlRaNkNtd2JtdzJXR3A5S2wydFhT?=
 =?utf-8?B?VHJUbEgwaG9FUTlPaHVHWCswTVNRNWUzTFVZcXF3V0I4Rm1sMThHY3NGQmVZ?=
 =?utf-8?B?K1FWOU42aUJaZVZZclhQTHdvYytnR0hDcFBzSjBleVFPRSsrVnpGckFrUTZy?=
 =?utf-8?B?ZkdlYkNBMTJFdWdmMkVVSHRuSFRjNmpRRkxIcVkyaE1rOWsrMXNOV2VQK2Nn?=
 =?utf-8?B?NTNQdEdUOVRzbG13cTlxWUFPcnRpSjZWVDRMNEhtaE1XdmRzaC9jWmY4RWh3?=
 =?utf-8?B?S2ZFUmorUk1nTEFjd0pURDlidEw5cXFwbzQzUGFOSUwyQXRqdjNJY2lldEl5?=
 =?utf-8?B?NlhkQnQzQ0pvblN4YjQxR0N3aGtldVIrRFFCT3BBRGRCMHVJWHM0emhyZjhF?=
 =?utf-8?B?OFc3aTJjNk1PNm1qR2NZUjZTcVNUUzhRY08zT3ZXNHd6YVVjV1FXTFBCbkN0?=
 =?utf-8?B?T3NkL0xESGxDbEltaWdHSEZhcGpSNWUxcjdHNWZTdGZJMzhiZmZWQ2ZEN2M1?=
 =?utf-8?B?S040YmpkUFhzNk01cExrNWFVRHRrbnpKelVXSmpBQTVpM0l5Z0FTSjFxdFBU?=
 =?utf-8?B?YTZZTDJnTS95R1BmRlM3SnFjUTNkWGtrTzlXZUVDWk16eXRzdWpHRFFZQW1H?=
 =?utf-8?B?bWhpcUhKS0tmUzVHWGZyaXRqSnhSZGFGZVhhZFNHQWVjRko1QURzV214aGpT?=
 =?utf-8?B?Z1pRQkl6SGt0YUc1Y2dVNml4Z2VuSlhvTVV4SHNPZkZRdGZxK1FIaWY5aFBj?=
 =?utf-8?B?T0Fwd3V3RERDbnVOSldaRnlIcEkvR202RHlBSzNBZWVzS3FHdG1uaWhkcCtr?=
 =?utf-8?B?MDVPcFIrT2RNOGdDRWFnUHlCK1VOR3BlUU56eGVaVXJlb3RuYVV2cW1wZ0xU?=
 =?utf-8?B?MlE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61d66fd4-06a7-4493-99b0-08ddf7575ab8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 08:34:31.4817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2sT6bLXxwSbvU1xiSa1T/NwaQZC+IfKKiqvQkeICqPI+nqiq6gpxdRnsrvtdQcJbaS7X8kYD1pAoPqiryh8wkVMFg/FLxV7fe+Mx37lr7io=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF5D8CD6E8B
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=Z+LsHGRA c=1 sm=1 tr=0 ts=68cd159b cx=c_pps
 a=x0D8RYL8GqfJKF6oaN0fjw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=iGHA9ds3AAAA:8 a=1NWNoF9oAAAA:8
 a=Q4-j1AaZAAAA:8 a=P-IC7800AAAA:8 a=3-RhneuVAAAA:8 a=t7CeM3EgAAAA:8
 a=syfNYHXCo_SBGoLZ8NQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iaZW5-mRKTR581f75CcA:9 a=kQhRZ-ja-qgl5JGt:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=97APRTa-CG6DvPMFVxHL:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=d3PnA9EDa4IxuAV0gXij:22 a=VLVLkjT_5ZicWzSuYqSo:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: TxHFcaJzV7a9bb-Df8c-J3Vn32sxMTkf
X-Proofpoint-ORIG-GUID: Mhff5MT8AQqunT80H3fvLSHFOnZ-XvFP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE5MDA3NiBTYWx0ZWRfXxo/j+o4vx3pA
 dzJihxg8oPkZGPRRw4onzhTCjoiXW5mfNkawJ67RZua3FhqZrf95jIrNo28rUkdgTv9xvZmTLgp
 DXrkrjsNhSpqyk+STY9Y+v8OSIiQfbfMhXf4ZuJQcSkVkU73n2+H0l3vldhC0mYEMWE2pA+fQhG
 mjS5riDdlHJ8qeiSsi6cIUtnZ+qOebPzxwSXNnHt5UG8Io46G7CCc016fwK5nGimOOnkMaFPW/e
 xuLfL/az+LPq67VpmQqSB9MNw802SDsjmOVgaFyO1d7jGcQ1RcyYMXR+Ygnims8sjS9W4tZEtj1
 R3tq3MI3VkESv0IJ/w2ztsvXzAfz8q+Pgwh2Dd3fahpVk5scv/EI7MN8XE7XN4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_03,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 08:34:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223730

--------------z7lx678tEr66csjHbj6xv6sK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 58J6i8nA765221

On 9/19/25 11:08, hongxu via lists.openembedded.org wrote:
> On 9/17/25 19:24, Mathieu Dubois-Briand via lists.openembedded.org wrot=
e:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender=
 and know the content is safe.
>>
>> On Tue Sep 16, 2025 at 6:09 AM CEST, hongxu via lists.openembedded.org=
 wrote:
>>> The modern compilers and code seem to require extra steps to avoid DE=
BUG errors,
>>> Move debug tuning configuration from recipes to an include file to ad=
dress these
>>> errors.
>>>
>>> Introduce separate variables to avoid the :remove operations, such DE=
BUG_OPTLEVEL,
>>> BUILD_OPTLEVEL and OECMAKE_WEBKIT_NO_INLINE_HINTS
>>>
>>> Suggested-by: Peter Kjellerstedt<peter.kjellerstedt@axis.com>
>>> Signed-off-by: Hongxu Jia<hongxu.jia@windriver.com>
>>> ---
>> Just a note about this patches: I had perf reproducibility issues [1][=
2]
>> after taking this series and I believe this is linked with this patch.=
 I
>> suspect this is not directly related with it, but more with the issue =
we
>> have had with perf reproducibility last week.
>>
>> So I dropped this patch for now, but I will take it a bit later this
>> week and try to go further. I still wanted to provide some feedback
>> here. Also, if anyone believes this issue IS related with this series,
>> please share your thoughts.
>>
>> [1]https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/=
2505
>> [2]http://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20250916-0s=
s72vce/

I am digging in the issue, and found the issue only happen on world=20
build of reproducible, have different debuginfo data.

I found the commit [1] to fix reproducibility issue for perf, but it=20
seems the issue still existed,

...

 =C2=A0=C2=A0=C2=A0 perf: Fix reproducibility issue

 =C2=A0=C2=A0=C2=A0 Perf's build process generates two copies of its inte=
rnal headers,
 =C2=A0=C2=A0=C2=A0 one at tools/lib/perf/include/internal and one at=20
libperf/include/internal
 =C2=A0=C2=A0=C2=A0 with files like xyarray.h. Although the files are ide=
ntical, the=20
binaries including
 =C2=A0=C2=A0=C2=A0 them would see them at different paths and have diffe=
rent debuginfo=20
data.

 =C2=A0=C2=A0=C2=A0 To avoid this, build libperf.a first, which will ensu=
re the libperf
 =C2=A0=C2=A0=C2=A0 headers directory exists. This is used in preference =
to the other by
 =C2=A0=C2=A0=C2=A0 the build process and results in consistent binaries.

...

[1]=20
https://git.openembedded.org/openembedded-core/commit/?id=3D0a886fcacaab0=
fbce1306c0f99d482f940a8f705

oe-selftest -r reproducible.ReproducibleTests.test_reproducible_builds

$ recipe-sysroot-native/usr/bin/dwarfsrcfiles=20
sources/perf-1.0/libperf/core.o
/usr/src/debug/perf/1.0/tools/lib/perf/core.c
...
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /usr/src/debug/perf/1.0/tools=
/lib/perf/include/perf/core.h
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /usr/src/debug/perf/1.0/tools=
/lib/perf/include/internal/lib.h
...

$ recipe-sysroot-native/usr/bin/dwarfsrcfiles=20
sources/perf-1.0/libperf/core.o
/usr/src/debug/perf/1.0/tools/lib/perf/core.c
...
 =C2=A0=C2=A0=C2=A0 /usr/src/debug/perf/1.0/libperf/include/perf/core.h
 =C2=A0=C2=A0=C2=A0 /usr/src/debug/perf/1.0/libperf/include/internal/lib.=
h
...


If specify perf of reproducible for oe selftest, the issue was not found

$ echo 'OEQA_REPRODUCIBLE_TEST_TARGET =3D "perf"' >> conf/local.conf

$ oe-selftest -r reproducible.ReproducibleTests.test_reproducible_builds

$ recipe-sysroot-native/usr/bin/dwarfsrcfiles=20
sources/perf-1.0/libperf/core.o
/usr/src/debug/perf/1.0/tools/lib/perf/core.c
...
 =C2=A0=C2=A0=C2=A0 /usr/src/debug/perf/1.0/libperf/include/perf/core.h
 =C2=A0=C2=A0=C2=A0 /usr/src/debug/perf/1.0/libperf/include/internal/lib.=
h
...

$ recipe-sysroot-native/usr/bin/dwarfsrcfiles=20
sources/perf-1.0/libperf/core.o
/usr/src/debug/perf/1.0/tools/lib/perf/core.c
...
 =C2=A0=C2=A0=C2=A0 /usr/src/debug/perf/1.0/libperf/include/perf/core.h
 =C2=A0=C2=A0=C2=A0 /usr/src/debug/perf/1.0/libperf/include/internal/lib.=
h
...

//Hongxu

> Hi
>
> I clone the branch of you on contrib
>
> https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dmathieu=
/master-next-success
>
> https://git.openembedded.org/bitbake-contrib/log/?h=3Dmathieu/master-ne=
xt-success
>
> And do oe-selftest without the debug build patches, the issue we have=20
> had with perf reproducibility still exist
>
> $ oe-selftest -r reproducible.ReproducibleTests.test_reproducible_build=
s
>
> ...
>
> 2025-09-19 05:05:31,099 - oe-selftest - INFO -=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 2025-09-19 05:05:31,099 - oe-selftest - INFO - FAIL:=20
> test_reproducible_builds (reproducible.ReproducibleTests)
> 2025-09-19 05:05:31,099 - oe-selftest - INFO -=20
> ----------------------------------------------------------------------
> 2025-09-19 05:05:31,099 - oe-selftest - INFO - Traceback (most recent=20
> call last):
> =C2=A0 File=20
> "/buildarea5/hjia/contrib/openembedded-core-contrib/meta/lib/oeqa/selft=
est/cases/reproducible.py",=20
> line 406, in test_reproducible_builds
> =C2=A0=C2=A0=C2=A0 self.fail('\n'.join(fails))
> AssertionError: Bitbake reproducibleA failure
> Bitbake reproducibleB-extended failure
> The following deb packages are different and not in exclusion list:
> /buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibl=
eB-extended/tmp/deploy/deb/./qemux86_64/perf-dbg_6.16.7-r0_amd64.deb
> /buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibl=
eB-extended/tmp/deploy/deb/./qemux86_64/perf-python_6.16.7-r0_amd64.deb
> /buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibl=
eB-extended/tmp/deploy/deb/./qemux86_64/perf-src_6.16.7-r0_amd64.deb
> /buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibl=
eB-extended/tmp/deploy/deb/./qemux86_64/perf_6.16.7-r0_amd64.deb
> /buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibl=
eB-extended/tmp/deploy/deb/./x86-64-v3/apt-dbg_3.0.3-r0_amd64.deb
> /buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibl=
eB-extended/tmp/deploy/deb/./x86-64-v3/apt_3.0.3-r0_amd64.deb
> The following ipk packages are different and not in exclusion list:
> /buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibl=
eB-extended/tmp/deploy/ipk/./qemux86_64/perf-dbg_6.16.7-r0_qemux86_64.ipk
> /buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibl=
eB-extended/tmp/deploy/ipk/./qemux86_64/perf-python_6.16.7-r0_qemux86_64.=
ipk
> /buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibl=
eB-extended/tmp/deploy/ipk/./qemux86_64/perf-src_6.16.7-r0_qemux86_64.ipk
> /buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibl=
eB-extended/tmp/deploy/ipk/./qemux86_64/perf_6.16.7-r0_qemux86_64.ipk
> /buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibl=
eB-extended/tmp/deploy/ipk/./x86-64-v3/apt-dbg_3.0.3-r0_x86-64-v3.ipk
> /buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibl=
eB-extended/tmp/deploy/ipk/./x86-64-v3/apt_3.0.3-r0_x86-64-v3.ipk
> The following rpm packages are different and not in exclusion list:
> /buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibl=
eB-extended/tmp/deploy/rpm/./qemux86_64/perf-6.16.7-r0.qemux86_64.rpm
> /buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibl=
eB-extended/tmp/deploy/rpm/./qemux86_64/perf-dbg-6.16.7-r0.qemux86_64.rpm
> /buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibl=
eB-extended/tmp/deploy/rpm/./qemux86_64/perf-python-6.16.7-r0.qemux86_64.=
rpm
> /buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibl=
eB-extended/tmp/deploy/rpm/./qemux86_64/perf-src-6.16.7-r0.qemux86_64.rpm
> /buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibl=
eB-extended/tmp/deploy/rpm/./x86_64_v3/apt-3.0.3-r0.x86_64_v3.rpm
> /buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibl=
eB-extended/tmp/deploy/rpm/./x86_64_v3/apt-dbg-3.0.3-r0.x86_64_v3.rpm
>
> 2025-09-19 05:05:31,099 - oe-selftest - INFO -=20
> ----------------------------------------------------------------------
> 2025-09-19 05:05:31,099 - oe-selftest - INFO - Ran 1 test in 32633.939s
> 2025-09-19 05:05:31,099 - oe-selftest - INFO - FAILED
> 2025-09-19 05:05:31,099 - oe-selftest - INFO -=C2=A0 (failures=3D1)
> 2025-09-19 05:05:34,691 - oe-selftest - INFO - RESULTS:
> 2025-09-19 05:05:34,691 - oe-selftest - INFO - RESULTS -=20
> reproducible.ReproducibleTests.test_reproducible_builds: FAILED=20
> (32633.79s)
> 2025-09-19 05:05:34,736 - oe-selftest - INFO - SUMMARY:
> 2025-09-19 05:05:34,736 - oe-selftest - INFO - oe-selftest () - Ran 1=20
> test in 32633.939s
> 2025-09-19 05:05:34,736 - oe-selftest - INFO - oe-selftest - FAIL -=20
> Required tests failed (successes=3D0, skipped=3D0, failures=3D1, errors=
=3D0)
>
> ...
>
> //Hongxu
>
>> Thanks,
>> Mathieu
>>
>> --
>> Mathieu Dubois-Briand, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>>
>>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223719):https://lists.openembedded.org/g/openembedd=
ed-core/message/223719
> Mute This Topic:https://lists.openembedded.org/mt/115268059/3617049
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
hongxu.jia@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--------------z7lx678tEr66csjHbj6xv6sK
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 9/19/25 11:08, hongxu via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1866903FE1AA84E8.22280@lists.openembedded.org">
      
      <div class="moz-cite-prefix">On 9/17/25 19:24, Mathieu
        Dubois-Briand via lists.openembedded.org wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:DCV1DEVKB7V0.2YZ96FPV5N3X6@bootlin.com">
        <pre class="moz-quote-pre" wrap="">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Tue Sep 16, 2025 at 6:09 AM CEST, hongxu via lists.openembedded.org wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">The modern compilers and code seem to require extra steps to avoid DEBUG errors,
Move debug tuning configuration from recipes to an include file to address these
errors.

Introduce separate variables to avoid the :remove operations, such DEBUG_OPTLEVEL,
BUILD_OPTLEVEL and OECMAKE_WEBKIT_NO_INLINE_HINTS

Suggested-by: Peter Kjellerstedt <a class="moz-txt-link-rfc2396E" href="mailto:peter.kjellerstedt@axis.com" moz-do-not-send="true">&lt;peter.kjellerstedt@axis.com&gt;</a>
Signed-off-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com" moz-do-not-send="true">&lt;hongxu.jia@windriver.com&gt;</a>
---
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Just a note about this patches: I had perf reproducibility issues [1][2]
after taking this series and I believe this is linked with this patch. I
suspect this is not directly related with it, but more with the issue we
have had with perf reproducibility last week.

So I dropped this patch for now, but I will take it a bit later this
week and try to go further. I still wanted to provide some feedback
here. Also, if anyone believes this issue IS related with this series,
please share your thoughts.

[1] <a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/2505" moz-do-not-send="true">https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/2505</a>
[2] <a class="moz-txt-link-freetext" href="http://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20250916-0ss72vce/" moz-do-not-send="true">http://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20250916-0ss72vce/</a></pre>
      </blockquote>
    </blockquote>
    <p>I am digging in the issue, and found the issue only happen on
      world build of reproducible, have different debuginfo data.</p>
    <p>I found the commit [1] to fix reproducibility issue for perf, but
      it seems the issue still existed,</p>
    <p>...</p>
    <p>&nbsp;&nbsp;&nbsp; perf: Fix reproducibility issue<br>
      &nbsp;&nbsp; &nbsp;<br>
      &nbsp;&nbsp;&nbsp; Perf's build process generates two copies of its internal
      headers,<br>
      &nbsp;&nbsp;&nbsp; one at tools/lib/perf/include/internal and one at
      libperf/include/internal<br>
      &nbsp;&nbsp;&nbsp; with files like xyarray.h. Although the files are identical,
      the binaries including<br>
      &nbsp;&nbsp;&nbsp; them would see them at different paths and have different
      debuginfo data.<br>
      &nbsp;&nbsp; &nbsp;<br>
      &nbsp;&nbsp;&nbsp; To avoid this, build libperf.a first, which will ensure the
      libperf<br>
      &nbsp;&nbsp;&nbsp; headers directory exists. This is used in preference to the
      other by<br>
      &nbsp;&nbsp;&nbsp; the build process and results in consistent binaries.<br>
    </p>
    <p>...<br>
    </p>
    <p>[1]
<a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core/commit/?id=0a886fcacaab0fbce1306c0f99d482f940a8f705">https://git.openembedded.org/openembedded-core/commit/?id=0a886fcacaab0fbce1306c0f99d482f940a8f705</a><br>
    </p>
    <p>oe-selftest -r
      reproducible.ReproducibleTests.test_reproducible_builds<br>
      <br>
      $ recipe-sysroot-native/usr/bin/dwarfsrcfiles
      sources/perf-1.0/libperf/core.o <br>
      /usr/src/debug/perf/1.0/tools/lib/perf/core.c<br>
      ...<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /usr/src/debug/perf/1.0/<font color="#ef2929">tools/lib/perf</font>/include/perf/core.h<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /usr/src/debug/perf/1.0/<font color="#ef2929">tools/lib/perf</font>/include/internal/lib.h<br>
      ...<br>
      <br>
      $ recipe-sysroot-native/usr/bin/dwarfsrcfiles
      sources/perf-1.0/libperf/core.o <br>
      /usr/src/debug/perf/1.0/tools/lib/perf/core.c<br>
      ...<br>
      &nbsp;&nbsp;&nbsp; /usr/src/debug/perf/1.0/libperf/include/perf/core.h<br>
      &nbsp;&nbsp;&nbsp; /usr/src/debug/perf/1.0/libperf/include/internal/lib.h<br>
      ...<br>
    </p>
    <p><br>
    </p>
    <p>If specify perf of reproducible for oe selftest, the issue was
      not found<br>
    </p>
    <p>$ echo 'OEQA_REPRODUCIBLE_TEST_TARGET = &quot;perf&quot;' &gt;&gt;
      conf/local.conf<br>
    </p>
    <p>$ oe-selftest -r
      reproducible.ReproducibleTests.test_reproducible_builds</p>
    <p>$ recipe-sysroot-native/usr/bin/dwarfsrcfiles
      sources/perf-1.0/libperf/core.o <br>
      /usr/src/debug/perf/1.0/tools/lib/perf/core.c<br>
      ...<br>
      &nbsp;&nbsp;&nbsp; /usr/src/debug/perf/1.0/libperf/include/perf/core.h<br>
      &nbsp;&nbsp;&nbsp; /usr/src/debug/perf/1.0/libperf/include/internal/lib.h<br>
      ...<br>
    </p>
    <p>$ recipe-sysroot-native/usr/bin/dwarfsrcfiles
      sources/perf-1.0/libperf/core.o <br>
      /usr/src/debug/perf/1.0/tools/lib/perf/core.c<br>
      ...<br>
      &nbsp;&nbsp;&nbsp; /usr/src/debug/perf/1.0/libperf/include/perf/core.h<br>
      &nbsp;&nbsp;&nbsp; /usr/src/debug/perf/1.0/libperf/include/internal/lib.h<br>
      ...<br>
    </p>
    <p>//Hongxu<br>
    </p>
    <blockquote type="cite" cite="mid:1866903FE1AA84E8.22280@lists.openembedded.org">
      <blockquote type="cite" cite="mid:DCV1DEVKB7V0.2YZ96FPV5N3X6@bootlin.com">
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
      <p>Hi <br>
      </p>
      <p>I clone the branch of you on contrib</p>
      <p>&nbsp;
        <a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core-contrib/log/?h=mathieu/master-next-success" moz-do-not-send="true">https://git.openembedded.org/openembedded-core-contrib/log/?h=mathieu/master-next-success</a></p>
      <p>&nbsp;
        <a class="moz-txt-link-freetext" href="https://git.openembedded.org/bitbake-contrib/log/?h=mathieu/master-next-success" moz-do-not-send="true">https://git.openembedded.org/bitbake-contrib/log/?h=mathieu/master-next-success</a><br>
      </p>
      <p>And do oe-selftest without the debug build patches, the <span style="white-space: pre-wrap">issue we have had with perf reproducibility still exist</span></p>
      <p>$ oe-selftest -r
        reproducible.ReproducibleTests.test_reproducible_builds</p>
      <p>...</p>
      <p>2025-09-19 05:05:31,099 - oe-selftest - INFO -
        ======================================================================<br>
        2025-09-19 05:05:31,099 - oe-selftest - INFO - FAIL:
        test_reproducible_builds (reproducible.ReproducibleTests)<br>
        2025-09-19 05:05:31,099 - oe-selftest - INFO -
        ----------------------------------------------------------------------<br>
        2025-09-19 05:05:31,099 - oe-selftest - INFO - Traceback (most
        recent call last):<br>
        &nbsp; File
&quot;/buildarea5/hjia/contrib/openembedded-core-contrib/meta/lib/oeqa/selftest/cases/reproducible.py&quot;,
        line 406, in test_reproducible_builds<br>
        &nbsp;&nbsp;&nbsp; self.fail('\n'.join(fails))<br>
        AssertionError: Bitbake reproducibleA failure<br>
        Bitbake reproducibleB-extended failure<br>
        The following deb packages are different and not in exclusion
        list:<br>
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB-extended/tmp/deploy/deb/./qemux86_64/perf-dbg_6.16.7-r0_amd64.deb<br>
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB-extended/tmp/deploy/deb/./qemux86_64/perf-python_6.16.7-r0_amd64.deb<br>
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB-extended/tmp/deploy/deb/./qemux86_64/perf-src_6.16.7-r0_amd64.deb<br>
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB-extended/tmp/deploy/deb/./qemux86_64/perf_6.16.7-r0_amd64.deb<br>
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB-extended/tmp/deploy/deb/./x86-64-v3/apt-dbg_3.0.3-r0_amd64.deb<br>
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB-extended/tmp/deploy/deb/./x86-64-v3/apt_3.0.3-r0_amd64.deb<br>
        The following ipk packages are different and not in exclusion
        list:<br>
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB-extended/tmp/deploy/ipk/./qemux86_64/perf-dbg_6.16.7-r0_qemux86_64.ipk<br>
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB-extended/tmp/deploy/ipk/./qemux86_64/perf-python_6.16.7-r0_qemux86_64.ipk<br>
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB-extended/tmp/deploy/ipk/./qemux86_64/perf-src_6.16.7-r0_qemux86_64.ipk<br>
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB-extended/tmp/deploy/ipk/./qemux86_64/perf_6.16.7-r0_qemux86_64.ipk<br>
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB-extended/tmp/deploy/ipk/./x86-64-v3/apt-dbg_3.0.3-r0_x86-64-v3.ipk<br>
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB-extended/tmp/deploy/ipk/./x86-64-v3/apt_3.0.3-r0_x86-64-v3.ipk<br>
        The following rpm packages are different and not in exclusion
        list:<br>
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB-extended/tmp/deploy/rpm/./qemux86_64/perf-6.16.7-r0.qemux86_64.rpm<br>
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB-extended/tmp/deploy/rpm/./qemux86_64/perf-dbg-6.16.7-r0.qemux86_64.rpm<br>
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB-extended/tmp/deploy/rpm/./qemux86_64/perf-python-6.16.7-r0.qemux86_64.rpm<br>
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB-extended/tmp/deploy/rpm/./qemux86_64/perf-src-6.16.7-r0.qemux86_64.rpm<br>
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB-extended/tmp/deploy/rpm/./x86_64_v3/apt-3.0.3-r0.x86_64_v3.rpm<br>
/buildarea5/hjia/contrib/openembedded-core-contrib/build-st/reproducibleB-extended/tmp/deploy/rpm/./x86_64_v3/apt-dbg-3.0.3-r0.x86_64_v3.rpm<br>
        <br>
        2025-09-19 05:05:31,099 - oe-selftest - INFO -
        ----------------------------------------------------------------------<br>
        2025-09-19 05:05:31,099 - oe-selftest - INFO - Ran 1 test in
        32633.939s<br>
        2025-09-19 05:05:31,099 - oe-selftest - INFO - FAILED<br>
        2025-09-19 05:05:31,099 - oe-selftest - INFO -&nbsp; (failures=1)<br>
        2025-09-19 05:05:34,691 - oe-selftest - INFO - RESULTS:<br>
        2025-09-19 05:05:34,691 - oe-selftest - INFO - RESULTS -
        reproducible.ReproducibleTests.test_reproducible_builds: FAILED
        (32633.79s)<br>
        2025-09-19 05:05:34,736 - oe-selftest - INFO - SUMMARY:<br>
        2025-09-19 05:05:34,736 - oe-selftest - INFO - oe-selftest () -
        Ran 1 test in 32633.939s<br>
        2025-09-19 05:05:34,736 - oe-selftest - INFO - oe-selftest -
        FAIL - Required tests failed (successes=0, skipped=0,
        failures=1, errors=0)<br>
      </p>
      <p>...<br>
      </p>
      <p>//Hongxu<br>
      </p>
      <blockquote type="cite" cite="mid:DCV1DEVKB7V0.2YZ96FPV5N3X6@bootlin.com">
        <pre class="moz-quote-pre" wrap="">Thanks,
Mathieu

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
<a class="moz-txt-link-freetext" href="https://bootlin.com" moz-do-not-send="true">https://bootlin.com</a>

</pre>
        <br>
        <fieldset class="moz-mime-attachment-header"></fieldset>
      </blockquote>
      <p><br>
      </p>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#223719): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/223719">https://lists.openembedded.org/g/openembedded-core/message/223719</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/115268059/3617049">https://lists.openembedded.org/mt/115268059/3617049</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:hongxu.jia@eng.windriver.com">hongxu.jia@eng.windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------z7lx678tEr66csjHbj6xv6sK--

