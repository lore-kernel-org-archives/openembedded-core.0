Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7B79CAC5B5
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 03:08:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.45486.1759115299427494357
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Sep 2025 20:08:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=reQsHJno;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2367bb7401=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58T2FsjZ122477
	for <openembedded-core@lists.openembedded.org>; Sun, 28 Sep 2025 20:08:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=YBP5G7vjxFN6W4RBTxTmkSmKEgjQA35PHJqIxGMVs5s=; b=
	reQsHJnotOgohjxjTl2T4qZmGoLHMDg4HoJ5nyOuZgP2sDPlwlgRgAgp4+kC+7Ja
	PyydDaqlW+NFPzM8Uquj/xUjsCsxeu8nm8RBs/CLEHWIcYz66LdgGhEWC7KR/aO2
	w8/1JBLH/5AXQqEmoVxmVTwsAoxf/7c9lozRphrOVWRPPp0wGSE2LVZMKWoDQM1S
	hDTer5fCzEKLoZNlqwsXBQZzxcUgMvjGdo8nABoq7z3tajZgLIW5tUTErzL65lKi
	W0fxFtaicRUz+baCwYF/zo2yZ5kvPwi+FugT/s6/4j8aR8LqWb2iJY1fSZtbKSZO
	O0i9fb4IHRPM6oK7IFZ5VA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011032.outbound.protection.outlook.com [52.101.52.32])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49eb6yhacc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 28 Sep 2025 20:08:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pZ5Mi2fKJ6c/+TWYJpBYAZNDsnS0rQaxhzEhWFHI0vifTNFKAawpWFp/IndBOqsGJIHd3dZQnepcd6jqJgPnBuWPAT0MtQ9hkk8pDMrffIbC8jN/5lecRQGIFG2C0lDq7d1rJuxohuIk0E3lCgjxH7g1bNKhoPgInZ8qCnwGYpCDVri1Qlf1s/xJOP4z3b1yulqMwnETORztZ9dLSkdQ8CEQYb7sOxyTmFgmHFTcwbqpkvPh/eTGssLX8duqOZH+UMIGJhlGZfCSIOveNiErjNlcTMk3z4xyRDh2yq3jW4srId1F/8qqVXdlM58iwmr1a1NsO3470cp8b6IO8Zcepg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YBP5G7vjxFN6W4RBTxTmkSmKEgjQA35PHJqIxGMVs5s=;
 b=be22rPb+2lfzunq1AvyMGGkocHoiw4Q5vZUxfN0fcddThXq0P9z+u4nmFie03Sbiq+OpLfmdzmI6RtVoVzRfEfnlg/SpeYm42mEBR2WUgr+ez68+fw7AmtH4HoU4z7U3rRcKl516c8weHlM8DlwxMMKZpFLSaXntOwI9Jm4GfCYHlEbelVu5YLIhs34x231S2IREOxr0v1NMVuICq/fkr+qJxsQYimmOIL91Lx2s8w2OwssXvjmveXru5wSFAmE9RCLhHKG/4PZf+c0iVGhD7KZbjxMh1XtCtdbLfZ4LleLN6/OAHq/SUZ9OpX2ZWyaAxkmSa3/9+tDNEWkObQO9lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by PH7PR11MB6906.namprd11.prod.outlook.com (2603:10b6:510:202::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Mon, 29 Sep
 2025 03:08:15 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 03:08:15 +0000
Message-ID: <ccc3d979-dfcc-45e5-a5dd-d4caf1c8a533@windriver.com>
Date: Mon, 29 Sep 2025 11:08:05 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] syslinux: clean old object and dependency files
 before do_install
To: Khem Raj <raj.khem@gmail.com>, alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org
References: <20250926073618.4162662-1-haixiao.yan.cn@windriver.com>
 <CANNYZj_QnvcztWCEeDa98DVJjbrpZYhsb56D1jMe+pL+=_uwUA@mail.gmail.com>
 <8f9969b9-aa03-4225-b72d-7df98d3f9490@windriver.com>
 <CANNYZj_+3yOR14u2s6ooqQg8CuQYZqOhmi3M=k903gedmgTLLw@mail.gmail.com>
 <551f878a-05d0-47a1-98f3-5eb31bafc6ea@gmail.com>
Content-Language: en-US
From: "Yan, Haixiao (CN)" <haixiao.yan.cn@windriver.com>
In-Reply-To: <551f878a-05d0-47a1-98f3-5eb31bafc6ea@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: KUZPR03CA0017.apcprd03.prod.outlook.com
 (2603:1096:d10:24::11) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|PH7PR11MB6906:EE_
X-MS-Office365-Filtering-Correlation-Id: f36b001d-7c6c-4285-e394-08ddff056e86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|4022899009|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bjBITURSTisvRVFPSzM0U1JQMmVkMWo4STlRTXVEdU9ZK2RjNnlyMGpTL3g1?=
 =?utf-8?B?Y2hLb0x1czhVUVBXRXI4MDZ1Wm5McTVkckxtcmd3cWIwZmNHYkZyMFBBb2Mz?=
 =?utf-8?B?elg0bmFKVmtmMXozZDgzbkZIc2lFMENrUWxBWjF0Slo5ejFORmZGNG1KdHFG?=
 =?utf-8?B?TGZLVlpRWHlpbGtzUGFjTms1RC82UnU4TXNzeml4akF4UUNpRUMxR0g3VmVV?=
 =?utf-8?B?U2M1bHU2ZWRrS0pxdERLWW52aEhkeW5rNlFBaXk5bWlMcmo4aUo4MHNTV0ZY?=
 =?utf-8?B?QWJCbnBTWVJVN0xVRHhoMWxoSmV1S0tZQS9kdUsvUVl5K09qR0RQUFpoNitM?=
 =?utf-8?B?TzhzRVFLZGJXV1Q4R1FrbVc5aytwNHc3YTk2UmR1cVVKci94VDdud0kvdEEw?=
 =?utf-8?B?QVdIdjErUVJFRGdZUG1DWkxwMnFuZHVXMWdWWHdqWk1mM3d4eDR5MUNXS0p3?=
 =?utf-8?B?VU4wcGhaemJSTlZTVmU4c0QrQzU3blhlWTkvUE9UbWx2bGc4ZWtSM0l1RC9O?=
 =?utf-8?B?TTd3cnBLVUZhV3dBNVYySlZQNUg4MW8yMEladWJOdGpLRHQ3eGxZSHcybW1n?=
 =?utf-8?B?M1NYb01rdzdleld3dFNaZTdXSGI4WDJ3MEh5M0ZTY1NpaVBCejBLRzBPcWhj?=
 =?utf-8?B?VjBlM0VSclcvK014UlBrdlk3MmIzQVJNcUlxNGh2VUd2VlFJQURESFNOdjBY?=
 =?utf-8?B?dm82NGcwclBEcisxQWFFVEVuVTUwVDJjbjVPU1hUMWdtNG9KamlRam1CNmZ1?=
 =?utf-8?B?YUlXTTFsUGcvYXhKK21wMTMzN1ZTYzIvc3JNWnlIbzZlRTRRY2Q2TzY0V3ZC?=
 =?utf-8?B?YjRTeGs3bDcyVEI0VzlJank1dTlqci9WMzhWMTRDYUlRUlZUVUQ1RVZDWTFM?=
 =?utf-8?B?R1h6N2J0RG5jdzVnRVliQTJ4L1BmU2xHWmxJQ3VNT3p0MGdiQ1VrYXlBK3Z5?=
 =?utf-8?B?VlVtOFFNSWRvQ29CaWd2ZVVLd05QT0w1Y0crUE5NUjRzUU5CVzAxaWVhM3lk?=
 =?utf-8?B?aTMwSWczMi9ocEN1NWZZcUtOKzVUc2pWZHlMMThmZ3FicGZiQkFDWDVpRkZC?=
 =?utf-8?B?aWpGU0JyelJyU0pEQzJIZUZwSy9MU2Q1V3pIUEJaMEpJZWM4YjlTWDRRRW96?=
 =?utf-8?B?VTBKcnNyL24wTW1TMVlhRVB4cUVZckJUUzVCVVZkNXA2N29XWVVINWFlNUF6?=
 =?utf-8?B?R3p0OU9OQ0VwK2JlR3VHSFFXVGZwUHhpWHdmbkI1bnJDcXA0KzJ1bWRkeTdP?=
 =?utf-8?B?MG5VOVltM0puUng1eUpSVXYvbTdqZGYvRDFmZ0xJSUQrSkxXbU9MMUlVeVFW?=
 =?utf-8?B?SDFlQUsvQlBHZmVRa09TSUZteVJWVzJzb1poQjVybU96c1hRUmRWQzh3enda?=
 =?utf-8?B?dUtpeTNReDNOWE03ZTQrK2w1YjRXSnRIODc1bEZ5NUdOK2h2MndPUllDaklG?=
 =?utf-8?B?TVZZYXpvdEhYYWZNeUw1T3dJUnRpTUZoQ3F4THZ6bWpWMjJFQVdBVzRUVDdi?=
 =?utf-8?B?aWc4UDBBamgyWFBFL3dDL1JGTzJwVXV2TXlQRVpxZFpvaDJNWXQrQ0xuZmxX?=
 =?utf-8?B?RHdNeEJtTWRDUkRnaHI4TGxxZDQzdDJvSlFmRWFob0NSMk1iKzc5U3JHUXZp?=
 =?utf-8?B?MjJjL3ZNWW9nRnlWM3dmUnVrWFA5dVlDbjhrbUpxV0dJUDZrK0h3cDNMNTMr?=
 =?utf-8?B?b09aZzZTSUNJTkNaMkx3ZFZ0V1AvTWw0MWxUMlAraGRLcWV5MTI3SzJyK3dK?=
 =?utf-8?B?V2NPWXFwc2JEcEsvRHVxZ1E3WVNBd2xnbk9XQkxQYTRNdkV0SGJoQnVmOEVk?=
 =?utf-8?B?eFdZdk1MdFlBQkduZjBrYmpNOVV6OFNCTTJ3ZGIrWnRta2w1cUxYVEh1VDlh?=
 =?utf-8?B?Y29zZ0tHdExpdnhSdzdyRzBQczJBODlKVEpLUzdUejY5NEE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB8200.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OWVZdHJZQkpnRTk4cnB0KzZyVXl6dmxSNklLWGcxWGtIeHRrMElKVkVKSG5B?=
 =?utf-8?B?QldXZm9xbElDemowaUQ1REdibHM0V1d3ekN1YVRlZ3JkVnBBZG8yclE3Yk9K?=
 =?utf-8?B?dnB6ckZWYnU4bGNnbjJvTDgyZFRtMGVFUWc1emxOT2ZYd3dtNSs1SG5YeThY?=
 =?utf-8?B?M3ZSS2NBNzdlaXRCOG83dS9JQ1ZQWW43ZGIzeWU1aEREUDVwMXl3SDdxQVZ3?=
 =?utf-8?B?K1NXMzBuekFVcFdFenNCcUN5cTJQZGVwK1BBREJsWGtoRThkL0svcEtzV29Z?=
 =?utf-8?B?NVcvdjlKVUdkS3ZhZTdqQ2VxVDFLODN0dkVrUSs4OTJOeExXYmRiV21sMXE2?=
 =?utf-8?B?TW9PRkNodjBwNDNHZjRDTlo4VzQxTkFaaXFIdnNxQ2RiRURTUEdZb0pUek1B?=
 =?utf-8?B?b083Z2ZjZ3AzSTI0NmhVK3VoQ0RtZlNURXNRZkNCNm9sK29qc0R5ZGtaUUNl?=
 =?utf-8?B?UVhyWHpZN0FCV1QyUHJ2YkVTME02YVZzVWxObzhJTnRNVDJ1TDY5UDdLVkUx?=
 =?utf-8?B?YjZhOXVVQ0o0TXBPUmRMeU52OGtEdUQxK0cwN1dUc0phS3VkWlNvQzJ2cWU3?=
 =?utf-8?B?b0hBbG1nWSthUm9aMnl5c0hDL1grMU5mM1pjRFJ1Y1lqRjBhcFV2a0ZiUkE1?=
 =?utf-8?B?bXBOTVBIWC9CdDE2a1hYNStWVytEb3NlaE94WnJPdmtlMXRoQjFPK2IxRkNr?=
 =?utf-8?B?dzNBNFlxZVRvK1FKMUNwOHcxV2JMVU8rcHpJcEZLSjhPNlN4YlhGWnhCdVRt?=
 =?utf-8?B?eHVud1A1UlY5VFF5NGhEMmVTQXY0RWVGejFOOXZQYUxJMmVvZHIvZVNtNWwz?=
 =?utf-8?B?dmZWb2lSZGFhYnY0UUJFL0szNExIZkNaSDZXQlhReDluL25CcEdQN0hxTzQr?=
 =?utf-8?B?bUQydEpkL1V2TklOczlzaUh3NG03ZVBBQzhLa243RkE2RlMydmR6ZjBJZUlJ?=
 =?utf-8?B?NzhWQmJNekxtYlRZYzhCSEpKZlFKS1lHTHorckJtME0wallUQnJMQjllMVgw?=
 =?utf-8?B?cUE5ZHBqZzhUZUVNejlDc1FkQVNBU2FlMjVOWTVqb1dZaTVucHRWZ29tVkpC?=
 =?utf-8?B?TUMycmpOWXlFaTQ4S2F3OURjMU1XczN0M3M0NlJEZGxMaXYrU1hCcGlsQ3Qv?=
 =?utf-8?B?QVEwMTRNTW1hQmRJRDRJRzB6Q3NtQ0xhWWlCYTlMZXp4QmxTWWhQRGl2SzR0?=
 =?utf-8?B?VzlZeS9FNXVIRFByWDRWNTJ3ckovQWcvM1VVUHpJTVlMaEpWdU0vTHc1RG5K?=
 =?utf-8?B?U0cwQXMvejNacXFWd3hZRUtXRzQxbWtUMmc5STllK2lRZHpnMHRMQzAwRlg3?=
 =?utf-8?B?aDlVQUtoOXRSTm9QOWQ5TTZhZ3daK2l4cWQvRG9PM2FVL1BwN1FMUlRnZy9B?=
 =?utf-8?B?ZVhtMWdTbS9lNXhVa0tOWDdHbTVNQmxJNGF6UXg3NGtJUTVZUkVHOWlqRnh0?=
 =?utf-8?B?dURGcXVHeURadVVFVFRWaUtLL2NvVktVcVBsSTBrMDk3ckZRMzdiRkl1WDN3?=
 =?utf-8?B?VGtXZU4yaThMM2ptQjluUEVnU3phQ0Z0dGZRSXVkK2pKWmVrcExpVjRVY3o0?=
 =?utf-8?B?MGRBL3RFSk0xZitjOEU2cDhaYTQyZ2l3b2NiY3hqcEVQTWU2NTZtNlhyc1F1?=
 =?utf-8?B?YVV3Q3pnL0VFM1cxczR5SjBkaHpJLzFNV3N3d2d1NG9HNjR0dXNJMUcvanhq?=
 =?utf-8?B?TlRtYVd0T1ZldE4wZkZURkt3ay9Bay93Q25FQnN4d0RBYk1BV1ZLWUtMUThn?=
 =?utf-8?B?UVRDYXRnRm82M3hqMEdMQ2RINzJVTlZyT1NIZ1ViV1RlY1drRk1jNjZ4enBJ?=
 =?utf-8?B?RGxIUW1hMG9zbUFWQzZsSVRnRzdHME9XcloyT0JMWFl1ckhOamc1Qk5IRlZO?=
 =?utf-8?B?SDErNW8vcXI2cW5nU0dQSGkrMjdacnB5alJFMTNlK1VWajVTZFl6MVBUNGND?=
 =?utf-8?B?NHJ4L3g5LzJ0RWIwMmcxRGpMbFpiUTlSV3ZWRUlyank2Qm1FT3pFQ3hsS1lO?=
 =?utf-8?B?MFR3dlpJWDlUbEk2VEJXeFR6TWU2bkNFTVg3TGkxMS9QVTdQUGhwN21kTnZn?=
 =?utf-8?B?N0tRZkRHcUVGY3BGRTV6R3FldlZKV0MyMFZtZm96T1BVZkVVZGhUa3JaR1ZX?=
 =?utf-8?B?dzN2dGFXVDhjU3JQYVFSM2ZpV3FTYUNyYm5Rb0o4NkNxZ0VQcjVHVEMyZFJr?=
 =?utf-8?B?dkE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f36b001d-7c6c-4285-e394-08ddff056e86
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 03:08:15.3380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: guUbjOrc6QfNsSDwfIDT5QGd/l8ePqRpMmYrxJ7a5uSGZrwCV3CkTUTydBbXlqM5FM2X8EvubCF3K/tJ5Ng0Dpst874zPKYWEba5WtlHFN0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6906
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: YhtItsYknesxTRK7AHRe2FveMYtXhGoQ
X-Authority-Analysis: v=2.4 cv=cYHfb3DM c=1 sm=1 tr=0 ts=68d9f823 cx=c_pps
 a=vMZ8N8iCC09X6dpNzQs02g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=NRKLPRp0mtf_MRC1H_QA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDAyOCBTYWx0ZWRfX7+FCLU+A4az4
 P8h6D5A1uDVk2FMTGJzWEqBz1AMterB0GXb2rJ3rnWKDQV93t/mN8DxWJVyk7z4RPnwu6YHK7Bh
 jbDHo6KWPDA2SxeYqYTRStl3vdBgjcNEmfnJWz5g9EmuZ2SZ+vcZNZ9P7bCNyg8DZr7wxRh5lFa
 C7P0B4hUjqbu7hwOfpU5BY6YKB3qJqCvZSL+vwKnZR55IWT7fYKZ9/RhiywzYoptSamaxTgpfTF
 PMUAE/fsld4iO6o+SYS2C/eXa/h37iIbTtUAJX603HcOqF1AR9FWv1guT9RAZKwh+p9/r7nGeuh
 lnfoP9s6Z6IJ8I2fIkzhzUQwZSqNpcwBbmANqxC74wVJVs/piRtHYpW2SXD88IpbWvLwnDLcs9K
 R00XwPM/Z3YCAJCmvOjoDXL3lZ+BGQ==
X-Proofpoint-GUID: 3zOLUvoxtVAhFz6VwMDrxPTUSar2JuXK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_01,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2509150000 definitions=main-2509290028
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 58T2FsjZ122477
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 03:08:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224112


On 9/27/2025 1:05 AM, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>
> On 9/26/25 1:27 AM, Alexander Kanavin via lists.openembedded.org wrote:
>> On Fri, 26 Sept 2025 at 10:03, Haixiao Yan=20
>> <haixiao.yan.cn@windriver.com> wrote:
>>
>>> Executing `make clean` deletes all existing .o and .d files from the=20
>>> OBJ
>>> directories, ensuring that zlib is rebuilt from scratch and preventin=
g
>>> stale dependencies from causing build errors.
>>
>> Thanks for the explanation. The next question I had was why the
>> standard clean mechanism that is usually triggered in do_configure()
>> isn't working, and indeed I am seeing this in the recipe:
>>
>> do_configure() {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 oe_runmake firmware=3D=
"bios" clean
>> }
>> ...
>>
>> do_configure:class-target() {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # No need to do anyth=
ing as we're mostly shipping the
>> precompiled binaries
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :
>> }
>>
>> Should this second function be removed instead, so that the standard
>> one takes over and does the cleaning?
>
> I wonder, if it is cleaning the pre-compiled stuff too, it seems
> the intent is to use pre-compiled binaries for target. So checking
> if those are kept intact after clean might be prudent.
>
It will not clean the=C2=A0 pre-compiled binaries.

bitbake syslinux -cdo_configure

find ./bios \( -type f \( -name '*.c32' -o -name 'ldlinux.sys' -o -name=20
'ldlinux.bss' \) \) -print | LC_ALL=3DC sort > prebuilt.after

 =C2=A0cat prebuilt.after
./bios/com32/chain/chain.c32
./bios/com32/cmenu/complex.c32
./bios/com32/cmenu/display.c32
./bios/com32/cmenu/libmenu/libmenu.c32
./bios/com32/cmenu/simple.c32
./bios/com32/cmenu/test.c32
./bios/com32/cmenu/test2.c32
./bios/com32/elflink/ldlinux/ldlinux.c32
./bios/com32/gfxboot/gfxboot.c32
./bios/com32/gpllib/libgpl.c32
./bios/com32/hdt/hdt.c32
./bios/com32/lib/libcom32.c32
./bios/com32/libutil/libutil.c32
./bios/com32/lua/src/cmenu.c32
./bios/com32/lua/src/cpu.c32
./bios/com32/lua/src/dhcp.c32
./bios/com32/lua/src/dmi.c32
./bios/com32/lua/src/lfs.c32
./bios/com32/lua/src/liblua.c32
./bios/com32/lua/src/lua.c32
./bios/com32/lua/src/pci.c32
./bios/com32/lua/src/syslinux.c32
./bios/com32/lua/src/vesa.c32
./bios/com32/mboot/mboot.c32
./bios/com32/menu/menu.c32
./bios/com32/menu/vesamenu.c32
./bios/com32/modules/cat.c32
./bios/com32/modules/cmd.c32
./bios/com32/modules/config.c32
./bios/com32/modules/cptime.c32
./bios/com32/modules/cpuid.c32
./bios/com32/modules/cpuidtest.c32
./bios/com32/modules/debug.c32
./bios/com32/modules/dir.c32
./bios/com32/modules/disk.c32
./bios/com32/modules/dmitest.c32
./bios/com32/modules/elf.c32
./bios/com32/modules/ethersel.c32
./bios/com32/modules/gpxecmd.c32
./bios/com32/modules/hexdump.c32
./bios/com32/modules/host.c32
./bios/com32/modules/ifcpu.c32
./bios/com32/modules/ifcpu64.c32
./bios/com32/modules/ifmemdsk.c32
./bios/com32/modules/ifplop.c32
./bios/com32/modules/kbdmap.c32
./bios/com32/modules/kontron_wdt.c32
./bios/com32/modules/linux.c32
./bios/com32/modules/ls.c32
./bios/com32/modules/meminfo.c32
./bios/com32/modules/pcitest.c32
./bios/com32/modules/pmload.c32
./bios/com32/modules/poweroff.c32
./bios/com32/modules/prdhcp.c32
./bios/com32/modules/pwd.c32
./bios/com32/modules/pxechn.c32
./bios/com32/modules/reboot.c32
./bios/com32/modules/sanboot.c32
./bios/com32/modules/sdi.c32
./bios/com32/modules/vesainfo.c32
./bios/com32/modules/vpdtest.c32
./bios/com32/modules/whichsys.c32
./bios/com32/modules/zzjson.c32
./bios/com32/rosh/rosh.c32
./bios/com32/samples/advdump.c32
./bios/com32/samples/entrydump.c32
./bios/com32/samples/fancyhello.c32
./bios/com32/samples/hello.c32
./bios/com32/samples/keytest.c32
./bios/com32/samples/localboot.c32
./bios/com32/samples/resolv.c32
./bios/com32/samples/serialinfo.c32
./bios/com32/sysdump/sysdump.c32
./bios/core/ldlinux.bss
./bios/core/ldlinux.sys

Thanks,

Haixiao


>>
>> Alex
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#224063):=20
>> https://lists.openembedded.org/g/openembedded-core/message/224063
>> Mute This Topic: https://lists.openembedded.org/mt/115444935/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=20
>> [raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>

