Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44870C2D0CD
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 09:27:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7017.1747819626486133195
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 02:27:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7236f77f38=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L4YVlG021339
	for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 02:27:06 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46rwfs94a5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 02:27:05 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54L9R5gR006644;
	Wed, 21 May 2025 02:27:05 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2042.outbound.protection.outlook.com [104.47.55.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46rwfs94a4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 02:27:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b10v8zbhGLKkFwTonsqV8qAVCNwF4WRgO+m0HcsDXUj45WVnXm+S68DTOkVMLi1fwMcpBztTkDYHnpKoptU12Y/bDJ53nfsfjMXKpnKozCca5xx9zivDgKwegWVoZaD3dgnyyf/DM40WILGNlzkw4VduMB108shtgx9aJBfHkKbbGPnY+tMrSxB4Q3WQTEqnucEhxEuCMdcekVUL9EMTqcwQhmY+igB9Tnf0K6kSX5dRy5t2cXmrXpha/zQJXB1V/UE3CqxAQIoEugdWqg++AGBj3K7T3RwaiDe4loB3JWdQDI/zYPwMcaXF4QqI8Luj0OL7kb1XJjFbOc8iro5u7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DdA93IeymTrL4AZIe7soVwRsQ68OW/+KDElBo2iLWwM=;
 b=BXqd0mnc0+VtEnigAENUfgfzpacO4MSfAUJaEN2U+sMlGKoi7qeJ1uM75ZlgFsvAZmeVbAzCYCEXDlFAdGQj4LVoRsEfjQ6Je5wpavy3svMXP2Tvos3LbDCCkzxrt7kHOJh/pSrkc6nKroDwr+fvNE+wI3lPgYgkAfbR31WvvchSP8u1eeHqfpvp+zxvuvoT7TawxKxwkeqNsioU/4Ppy1ckH609XIGGxf0Wbjii7HA9enRk8Qo0XARCRnt6EhSagczMYeN+9S8zqpF5bn5/dUPp8y8kvKWOHW0t5ezOWQwJ6PYEJGldM3oumfoeig0tLaecsh7ehXbwH4VvEWQq1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by PH0PR11MB7615.namprd11.prod.outlook.com (2603:10b6:510:26e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 09:27:00 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%5]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 09:27:00 +0000
Message-ID: <043483f3-339a-413c-9c78-1a6a8230df2c@windriver.com>
Date: Wed, 21 May 2025 17:26:52 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/1] autotools.bbclass: Copy
 gettext/po/Makefile.in.in to all po/Makefile.in.in
To: Gyorgy Sarvari <skandigraun@gmail.com>,
        openembedded-core@lists.openembedded.org
References: <cover.1747817251.git.liezhi.yang@windriver.com>
 <ec444128381202080ec89649e127d0e6ae6cbdf5.1747817251.git.liezhi.yang@windriver.com>
 <a4e6e52e-b27a-496f-a715-24ceca866ab6@gmail.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <a4e6e52e-b27a-496f-a715-24ceca866ab6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0354.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::17) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|PH0PR11MB7615:EE_
X-MS-Office365-Filtering-Correlation-Id: 6122646e-73a1-46b0-906a-08dd9849a38b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|4022899009|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bEdWUmkyTUY3RzVMUFI0M2lzWldHVDFKRGhWUXJnbW1RZGNDbDBmbXZ4cmU3?=
 =?utf-8?B?VXYvMmVRZG9ScEJNaC9TQkJPM0lSZlp2UjcremlSbW4xa1RDYjdHT1ZRQ09N?=
 =?utf-8?B?cEJoZ2c4NTlkOTZoekVpbi9ucWtPTENGci9GY3pWM0ZFUE5nazlGRkJDdjMv?=
 =?utf-8?B?YjFSMEtzK3BVek10ZzMwUm1mOWo3M2V0SHduNmFhTnVoaUZkUWZhbThJYXZ2?=
 =?utf-8?B?OFdoOW4wOGJBWVlnWG9iRkNMV3RTRSsxM1FZcktsTlF6WEd4RytTQitKcE9B?=
 =?utf-8?B?UUp0N3pOMWE3Yk1FVDdDeEpIUURBWEFyL2I3S0Z6dlhvaTdIWEt6V2hZV0tj?=
 =?utf-8?B?TFNkaUJKbFRnWWs3dTI3SjRqOGxBNFRGeXJnd0JCckgxREFiNzhURFlHbnow?=
 =?utf-8?B?QXNLaHY4UmpOZWNtbGF5c2RnRDhlNkJWUlFoZEVhNFZmdThpSUJvTElOMTdh?=
 =?utf-8?B?Smx0WXpyZ0VSTytuUmNUSmNQME9TRTlURWUvU3dJdmZRZkl0c0JPTThZcWkz?=
 =?utf-8?B?dDJtcU15UmJlZHRIL0dTcHVyU3kxTUhYZWdDaEZtNTcvL0ZuZ1BESzREbUNM?=
 =?utf-8?B?SmVmM2ZQMVFTMmhFZDhKZnAyNHRWOUFhNW9aM1UvQ3NlL1RSRjB2YlUxN3ZD?=
 =?utf-8?B?VWc3ekFkRFRYTkp3aUJySjI5WGZOMG54bzhaTHN5eEFpR1JxMERNV2pNNEg5?=
 =?utf-8?B?aWtyYTdFZVNKclRYbzd2MElGRnNqWXFvRGZEU3Rjdkcwcnl1TUgwbGpVRkVs?=
 =?utf-8?B?V1dBSzUrZmxJWHRLVnpjYmp2dnBERzhsaWROSFY5MXpid0tqVmU5ZGplV3JL?=
 =?utf-8?B?alBLb1VWZEpnb1dXczYwMVF3NDlSMTNCd1dkSzUzOHlFVmhmd285MVNIZTJT?=
 =?utf-8?B?WkZaRW1RRmZ2bXFQeTBheUZsdGhlNU5XUUhFVS9yMzNFY21vdEYweVNSc0wr?=
 =?utf-8?B?WXVWbzVZMUtWa1NjNnYxNkVRcFpXS0RHbzQzRWtRRS8xdXpqdktLRW9veDJq?=
 =?utf-8?B?L21rd3pKc3ZKSXBjcWE5V1BLdEpzTmZyOWljVGM0RVJXYjI4SlR4Snltak4x?=
 =?utf-8?B?RXhyTnFpTFRCOXVlMUZaVzJmSHc1RnlBM0F4ZHRuRks4Wm55SElwRFRRUFdJ?=
 =?utf-8?B?VzF2a2t6OFltaFdzbmRUQnZKdVFUdEJWMXlKUUI2bU1TZzVjc21hU3MxaGcv?=
 =?utf-8?B?Uk9lQi9uT0srZUVXZ0JkTmx6NjlsOWZkNlQ0eVFPNFhBM2RSYjlPdyszU2tI?=
 =?utf-8?B?YmNMRVBJNERqTlpJQ0FYcm96Rm1McThkVitwWFhJTHJIRnJDdU94L3gwTXVF?=
 =?utf-8?B?djFWWVdGd3p1ZFYyV2drdmdoR2pOTCsxY0VUUzVXZGQwSWgvRm9UdVVBOUp4?=
 =?utf-8?B?NU9xTi9qdHd2K1Z5L1pQU3NyMDNNQkk5RndSYW9FeENpZ1RlM3YrbkVxUjZV?=
 =?utf-8?B?aEVKNmloVU5sWWw5NWM5cjVOSW9kTXFaYmZTcUFxRXpTTnlzdElQcmRMcUhs?=
 =?utf-8?B?VlJvMkZ1Zys4UVRuc1FTOFp3bzRQUzIvTm9oV3M1UlhlYWt1S1pSU3pEZ1Y2?=
 =?utf-8?B?SzBkeXJ6VWIyOUJOQXFyVDJheDRsQ2RUbk1tQ01CSStERHQwRFdxL1VCY0Zv?=
 =?utf-8?B?c2ROd3NxaWRlYTkvNXk3V3JLUVRpUGhqeG5kcXplZ1dTc0dhTG5OQUZvdVFO?=
 =?utf-8?B?ZWV3OXlJTmUyY3NYSG1IRGJnRXkwWlBRS2haLzArajlyaW8rQmJ3bEZhNElk?=
 =?utf-8?B?Mi8zSW9jby9ZT05FY2dqR1VmZDZHSncxTFJDeVFEZjQ1YnI3STBuSFRKWXRO?=
 =?utf-8?B?UTFkcEpaYnIvVFVMN0xoa1JnR0JKUFB3R3N4dDlDcCtwalN2RmZneDhURFNQ?=
 =?utf-8?Q?wMW0DYDoz/9k/?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UUhnUEY2V0RlUkNzNlY2YnY5NUhSQXFQSU4yMTRQZmRlbDFWdkU5c015UDli?=
 =?utf-8?B?b0tEbE5GZjhka3ZpcEJtanpocGJ0QS9WZzB6U2VVVmJGeUZMbGpaK2dnb0NC?=
 =?utf-8?B?c053a25EaHJSS3hadVhVOHFSaFRIOTA5dTUvTHR3a2RTSmhkd2ttSEpPdDZX?=
 =?utf-8?B?Tk9Ib2VqQ0d0VTJjMnFCOUFNOWtXSjJ2aGVuaDdvS2pVdXhDNkFQSDhzZ1Y0?=
 =?utf-8?B?Qi9hRERmaXF4RVp0NXZSY1UxZndRSUppb0QzZzFGcThXZkRqZWNyL2pOUStN?=
 =?utf-8?B?bzJlYmkyeHNZZ3laN3o1Y1JkeGI1STRxM3ZzZTZyZ0hiRG9qbVB5VjVmMHBr?=
 =?utf-8?B?VmRFaW5ETzVzbkt1OEtRMnFSNXVpS0llaThuaTVqTGtFckwxWjVjSi8rYi9J?=
 =?utf-8?B?VnhnMFE3N1ZQZ3ZLaFM0ZTl1MDRsSmMwZEowcnVBdzZKV2k2UGEvRFJFZDlR?=
 =?utf-8?B?RVhQR1N5OUZBV1IyWUFqQTFNQnBhdzdXcDdSQ2NoMzFDdzdMaXpOWG1MQitt?=
 =?utf-8?B?RkRpQnJxemhvUC8rSWJZWUp1WFY4M1hyb1V4Qkl5UXdCUGVJeUVJaEd2ODhj?=
 =?utf-8?B?b3ZQenY1Tmp4Mm8yNnJPOVl5dm1WS1BJNnBwcXUwU2FGcC9JdDAxaHpoV2sy?=
 =?utf-8?B?QnNBWFNpd1RJQUZnWDZlZmt5REs5M1JsUWZTU2o5cWROR2dxM2xhckNPSGF3?=
 =?utf-8?B?eG5mUXN5SmZhQXpERUhHWGR3NzdWUjNkZ0FndGJiaWh6OE1DTmx2K1k2ekRy?=
 =?utf-8?B?K1NkM2o1RjlERkt2Z0hydkV4eHpxanBoTFNvd1A0U1V3a0pMbEgxSkV0S3F0?=
 =?utf-8?B?a3E3U3Y1eldTRlg4Nm44KzVPR21wdmlLcjBXcGNGNklBbzJUTVBMRG82TTUv?=
 =?utf-8?B?UjZMdVhBWDY3Y3R1QmNSenM3NnhVNnBXZ0wrSGF4dXJSYW9ONWYyVUdkcERU?=
 =?utf-8?B?V25TQlZiWjZlQy94Qmo5QXhVNmdvZ0hENmc0Ym45TE5wYjRtcldCY0ZsMVRG?=
 =?utf-8?B?a2lCNnQ1MThMRFJHUDVjMXBwcjBWeGk4NE9RcXU0VmtsSGEyUzdVY3ZpaStm?=
 =?utf-8?B?MEtNYUdhN0J6c3NNRWlaRVZ2NnlHc3AvYW5yZmd3YUpnWVlmTDhmYjJUdlNK?=
 =?utf-8?B?T1VWY2FiSUFiQlhrL1hFWGR4b1hqU1VRMTVmRlVqbVRNQ3JkUGVWKy85dkho?=
 =?utf-8?B?ZWZYMFZwUlkvNnF4SVVWbGszRTIvalpQb3BSYnhVb1k2MXdJbWY1K3NUempK?=
 =?utf-8?B?VXEwbDNzdlpTeUhYSE5BY0lEQnk3ek04UGtWU2VlRjRwUitVODBSaytpMUgz?=
 =?utf-8?B?Z1J5WmpLankvTHM0WjNTYjg2aDRERmRVWkRSdU9nTzVZcXVyb1YrMDNUSUUx?=
 =?utf-8?B?OC8rb2VhQjNNYlUwWXROSmErdTgwRndQTW1wN2h5RGRTUEhxRVNNMm8zWHlD?=
 =?utf-8?B?WFg2L0xGZFZ5NHV5d3FJZllyM3Uvb3RmVEo2QkRBZ0Z5Wkx0cFBFVEFOZnM3?=
 =?utf-8?B?Z0hHcmtTakw2aDU3MkpKNHlmSEk4d2c0WnBGSVU3RzdYbUg0RWhPL1BmVFBL?=
 =?utf-8?B?dGVHOTlMWHYzc092R3FybU5jZWQ4N0gxc0g2YVEzU2Z3aHF2RU9yeEdzM1Rh?=
 =?utf-8?B?VXVCcXFrRlZOTlBxTTBuekl1Wm16cnEzVXA3R08xbUVmL1N2Z1FETm1GL2ov?=
 =?utf-8?B?MS9BRWI2NDJRQjlEZXI0ZFpBZzZnTmFCdkxvVUFhVFNpR256ZVBBNzFOTmhQ?=
 =?utf-8?B?TGpUK1AvZ3JZWS9PbU41cktnUkE1ZmhXbm9JMkxZaVlrR0YzRVFreEQ2RG1a?=
 =?utf-8?B?OTRzQWwzRkd2cHU0SWtIYittQnZ5UzdMMU1NYXh3N0EzMXlGNjdjZThZakly?=
 =?utf-8?B?OTBIRlJ4WHV5WTdMQlFHZk1EUWtGSGxzT1M4R0xmT0dwa3JBT1BmWDhaTTFi?=
 =?utf-8?B?cG5iSHdLRng4TkR3UGViZm5DMjQ5MUNIRVlRT3ZGV0dKKzJFUFF5cHpKZXBv?=
 =?utf-8?B?bVBZRVF4dUN5V20vS2FOWDhCZXhlYUdSMUk5dDlrYVJobGNUcHVITDEvcFBM?=
 =?utf-8?B?Q0JrZHVucUJ4STV1QVBZN1hHU24rNitLM2NCeWY5WnovZ3FVQWdoUVQvMkFN?=
 =?utf-8?B?SDY1UVB1Nm1xK2xZQkdiMUhSSmZZTWpNc09iVC9JZCtzTTVObHR6YWlLbzZQ?=
 =?utf-8?B?TEE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6122646e-73a1-46b0-906a-08dd9849a38b
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 09:27:00.2787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LpxLNgx7ophtZbsiqypDGJw/ZSls4C1AMC/CfAfuY1IzHVq+bYS8+/QvMqndNe+nldF4LBPrUBgga+wCMiHirqd5DwdprgjZtnziONXvquk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7615
X-Proofpoint-GUID: Vz6fpYRZu6Wj8vTGeoTMvTofZeHnUt77
X-Proofpoint-ORIG-GUID: lr7CnAxIBTjCQu8ljSwQ4oyZdKbZSgq2
X-Authority-Analysis: v=2.4 cv=KJNaDEFo c=1 sm=1 tr=0 ts=682d9c69 cx=c_pps a=SXeWyiAXBtEG6vW+ku2Kqw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=bRzqlTLMYmaYISAiEkgA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDA5MiBTYWx0ZWRfX/t5W3u6Bsqfr iX42+uIx0I3AcNvtGiQO/xDUn43RKNtbcEoxh5lfoBeMhRFB3dgq9lN6p1qkD/fQYETEfA1LyDx Ho7yStqhWEcdm3ZGIjLAGYNzOQxlMZpjbIVz7z1NzI8mBZQI1+Lc9PTYLrDvF+df/9bXf8J4QNm
 qyoc5ADB+O7zhr9xMTIQVIumnuprGHbHJFFAg8Lv9/RcmkulfH9+9zqLHKsEoabjqEPV27F3Y0/ EQw/AdZW/38pW4OFejzNVsg94KYzlSWgznYespR7VymBafZOB7Kr/yiQhfBA02D8JVwtlcUkL5V oVsW7KvdNhJAV+sCy5gbgbZW6erM6Y+PZhjgxEGKUnX2jd5IHBBZ0aEwyIU1z4pisfkGkeVVjN+
 GwT0/Y9Sbk60ChnAR2LWLroYHShTAIfGjO3BafeWKXkCM8JigolroRpnnN3VgiZZXpuTvIdJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_02,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505210092
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 09:27:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217010



On 5/21/25 16:55, Gyorgy Sarvari wrote:
> 
> 
> On 5/21/25 10:50, Robert Yang via lists.openembedded.org wrote:
>> From: Robert Yang <liezhi.yang@windriver.com>
>>
>> The previous code only copied to ${S}/po/Makefile.in.in, but there might be
>> other po/Makefile.in.in in ${S}, for example:
>> * bison:
>>    runtime-po/Makefile.in.in
>>    gnulib-po/Makefile.in.in
>>
>> * gawk:
>>    extension/po/Makefile.in.in
>>
>> * fontconfig
>>    po-conf/Makefile.in.in
>>
>> * There might be more recipes in oe-core, and more recipes from other layers.
>>
>> The build would be failed after upgrade gettext to 0.24.1 since gettext changed
>> the way to include Makevars, so we have to fix the recipes one by one, such as:
>> do_configure:prepend() {
>>      cp -f ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in ${S}/runtime-po/
>>      cp -f ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in ${S}/gnulib-po/
>> }
>>
>> Even if we don't upgrade gettext to 0.24.1, have different po/Makefile.in.in in
>> the same ${S} is a kind of bug, this patch can fix the issues.
>>
>> The fix way is:
>> Find all possible po/Makefile.in.in, if it is the same as ${S}/po/Makefile.in.in,
>> then override it with ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/classes-recipe/autotools.bbclass | 22 +++++++++++++++++++++-
>>   1 file changed, 21 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes-recipe/autotools.bbclass b/meta/classes-recipe/autotools.bbclass
>> index 948f8c183a..d4138bfc57 100644
>> --- a/meta/classes-recipe/autotools.bbclass
>> +++ b/meta/classes-recipe/autotools.bbclass
>> @@ -188,8 +188,28 @@ autotools_do_configure() {
>>   		elif [ "${BPN}" != "gettext" ] && grep -q "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC; then
>>   			# We'd call gettextize here if it wasn't so broken...
>>   			cp ${STAGING_DATADIR_NATIVE}/gettext/config.rpath ${AUTOTOOLS_AUXDIR}/
>> +			# Find all possible po/Makefile.in.in, if it is the same as
>> +			# po/Makefile.in.in, then override it with
>> +			# ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in.
>>   			if [ -d ${S}/po/ ]; then
>> -				cp -f ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in ${S}/po/
>> +				makefile_in_in_top=${S}/po/Makefile.in.in
>> +				need_copy=$makefile_in_in_top
>> +				if [ -f $makefile_in_in_top ]; then
>> +					makefile_in_ins="$(find ${S} -name Makefile.in.in)"
>> +					for makefile_in_in in $makefile_in_ins; do
>> +						if [ $makefile_in_in != $makefile_in_in_top ]; then
>> +							diff="$(diff ${S}/po/Makefile.in.in $makefile_in_in)"
>> +							if [ -z $difff ]; then
> There seems to be an extra f (difff vs diff)

Yes, you're right! It's strange that my world built well with this typo. I've 
fixed it locally and re-do the world build. Will update the patch if the build 
works well.

// Robert

>> +								need_copy="$need_copy $makefile_in_in"
>> +							fi
>> +						fi
>> +					done
>> +				fi
>> +				for makefile in $need_copy; do
>> +					cmd="cp -f ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in $makefile"
>> +					bbnote "Running $cmd"
>> +					$cmd
>> +				done
>>   				if [ ! -e ${S}/po/remove-potcdate.sed ]; then
>>   					cp ${STAGING_DATADIR_NATIVE}/gettext/po/remove-potcdate.sed ${S}/po/
>>   				fi
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#217006): https://lists.openembedded.org/g/openembedded-core/message/217006
>> Mute This Topic: https://lists.openembedded.org/mt/113225997/6084445
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
> 

