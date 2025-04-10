Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 680A6C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 15:30:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1322.1744299031373825643
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 08:30:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=61954b6b13=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A4k7co005306
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 08:30:30 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tyt4evsw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 08:30:30 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53AFUTRU023209;
	Thu, 10 Apr 2025 08:30:29 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2048.outbound.protection.outlook.com [104.47.55.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tyt4evsr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 08:30:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VvfERTZHol3M/9UPCL+Qyz6iMMvyJGCpyeWZ3zY88y6J37X0O7vKOo9grqTRZ7vrINM3rRr/xlXw7zg+WVzborap4hZl3KqQ2cgwa1UB/+TzRyMPFxc/9FSHjB/h5mgyDVixj8CfgBJakE2IFOr7eLLnHmE2/eZJUCU0v2AiPchbDvTB1JIGBy/F/mpiHcabGnwUHsqsFM/sYfT975f+ehUbs+7VxHX+mFkLeTR3BB5Nz4gtZz5RubwlmAoRTEOJgdTAX2ZfMA948Zum1HS0MBvLYxsGgvz8LjDb394VRIT5mbFfmb77U2lvT/O1TVS3JKfpz3oppcfJSOsvd14dTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2oXLaBsRfX9StKVEuVVg5POslrNplMdN4efL0PR7S+s=;
 b=jX6GBlNbaOsPOB6ByDkXbM3s8sjav3JcUEjXZli88qX9/Mfw9El95iyOgN8mfMopok6ZsLCW/hlZxLz5jnlgTbBbemsmSJm1VNy6qdU+k9vjsnj9cN8LimVu0jNLktcrAkAnoy1aOuwK/auePpg2JxNeRMrZzddWuwyaGqCzm2rGsoUNOO+9rZOBMEkh5vNz2H3TXryIm1Z1Qbmo3NJt9nQjb+npNaHkIu/qQWGCO1vmz4kNC0U2XMAwL/ar7486uqCz+9ShPYn2YMnp7fJHAWkdgg7hADcenEUWLG0OOdWvD79hnCWgX2Nyij9zepE4z2FuQ/wjpy0YTN5K6pdVPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by CY8PR11MB7107.namprd11.prod.outlook.com (2603:10b6:930:51::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Thu, 10 Apr
 2025 15:30:25 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%7]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 15:30:24 +0000
Content-Type: multipart/alternative;
 boundary="------------3F05IZRZnK1v40bcIYY4rq7Z"
Message-ID: <26644306-dfb2-4f5a-927a-f00867b13839@windriver.com>
Date: Thu, 10 Apr 2025 11:30:22 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][kirkstone 10/10] glibc: Add single-threaded fast path
 to rand()
To: steve@sakoman.com, Richard Purdie <richard.purdie@linuxfoundation.org>,
        "Yan, Haixiao (CN)" <Haixiao.Yan.CN@windriver.com>
Cc: openembedded-core@lists.openembedded.org
References: <cover.1744145328.git.steve@sakoman.com>
 <19fcc012160c6b8782be0e6fc54797c88bf084ba.1744145328.git.steve@sakoman.com>
 <3a3917e7e0b9c3f444ee895f24ca401b36e6c694.camel@linuxfoundation.org>
 <CAOSpxdbDTvGJb3tVH323=+BEDEM6JwHRveMhaZ+oRFA0i5QrFQ@mail.gmail.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CAOSpxdbDTvGJb3tVH323=+BEDEM6JwHRveMhaZ+oRFA0i5QrFQ@mail.gmail.com>
X-ClientProxiedBy: PH0PR07CA0081.namprd07.prod.outlook.com
 (2603:10b6:510:f::26) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|CY8PR11MB7107:EE_
X-MS-Office365-Filtering-Correlation-Id: fd4cd9a2-0a2e-4a68-010f-08dd78449d29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|4022899009|13003099007|7053199007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WERESW5uWXM1c1ZYdW0wQWFMMlA4SmRQVUp4VTlnY1dYY3Nac21PVytDQTBC?=
 =?utf-8?B?SXVFd1kxKzJtL3lKT1BxdGNIM2tWMVhxdThpU3h6OEM1Q3h0OWZnalhyTDBS?=
 =?utf-8?B?M0Y0MzdkK3RxcU95UFllZDZ3ZVc1RFRUSU9zb1d1TTFIODFicDZwVWFPemww?=
 =?utf-8?B?QSt1Szd0aWJObmtUSUtpRm96dHJNQ0RDUHVEQjVsN09UWUNTSjdJYVdFT0lZ?=
 =?utf-8?B?L2JLMHpKeHZQQy82QkU3WE55ZURScG1HK0pqZ3UvUVZ1Y0ZUZGZPVXlvZENL?=
 =?utf-8?B?U1NKMlUxZHc2VE42U0krRGd3cVZzVE9ndnpqZ1dibFlPNWFyQ1lpTWo3MVRz?=
 =?utf-8?B?WXp1VnRFOGp1dk56cGlsZG5ydno5Z3FyMEVTTHVLeU5OMGNRR2dSVEM2M2Jr?=
 =?utf-8?B?VnZOeTNaUG5nOHAxbi95YXN5VmtTL1pHbWtFYWQ0UlBPM1hqdFhtT2NiaDNI?=
 =?utf-8?B?RWlidEdRWHlQaElLUE8wVDBmRGxJWGNCZ3l4TFA2TkJJM1I4SERpVmZBejM3?=
 =?utf-8?B?dU1qTjFkbU1xVnhhclIyNE9lc2FXVTF2Si9VVmc1bjZWMUNqeGpEUktsVFAr?=
 =?utf-8?B?em1KenRUZWJleVBXRTVmeTg5RUhsNDFabVgzNjRucGFUTytCeVVtdWVFaVZx?=
 =?utf-8?B?bUdlMUpYM3M2T2tsT2pYdksySHg1ckVtS0hJMGIybzQvY3BBTEVkQVVYYmtM?=
 =?utf-8?B?enhWenBLb2RWLzhqUWQ3aTRCdVlkVXFTQnRlOUNFZmMvc3piZE5NdDV4bXo4?=
 =?utf-8?B?UW5JRnRoQXN1YXdlaU44UTFmZ0Z2c1ZtZlFqN3VpM2Y4Wlg1ODRMSjJXYm1N?=
 =?utf-8?B?L0FnRGhZcW1KVzdJTzZVQzl1UGZ0WWs0eWxXd0xQSG10OGJBaS81VStRMDY0?=
 =?utf-8?B?Wmt3Y04yZDdUdUFONlFpcFRCWGZ5TlNVYkFjZEVkTWUyYjEyNHdFTnpBNTdG?=
 =?utf-8?B?bmdmMGY1aWpKNDlBaFArd2ZianY1aHFLMHg1eHAwMnp6U2Z0c3hBdUUxWjUw?=
 =?utf-8?B?djFXWUl2U0V2djNCbWh6VWRPM1F1K09LbHhscGp1ZlZTbVluREFkOS9MVjVa?=
 =?utf-8?B?a3FPd2I4SGMwQTNZS0w1bDY2cjJNZVpyaDVNbHM5bHQ1a0tKRnc2NjNQR2Nq?=
 =?utf-8?B?cU9GSEYxY3NTQXNycVVCdmJPcmVuODlwYmxVRUppRXJaazVQVFZaTWxFdk1k?=
 =?utf-8?B?VEtzWC9uMWhaaHRDMm5aMVEvQlNlMCtFYUh4aVVlZUNUajhLaXpzM2ZFR0dX?=
 =?utf-8?B?Ukpud3lpckYvdHVTWExkbU9na0dsWEpJTDNXMHNTT3FORkNPRXBsdURuRTVr?=
 =?utf-8?B?WFFDc0k4N2tkT3Ezb3lSOHBQTDJRK1JLdkVzRHk3QjhhTGhHWGZnZHV6aUk2?=
 =?utf-8?B?Z29qZVlzcXZYR0hJRXoyYm5VZ1BwbVB5d3NtTjdZU1lxcWlZRGtCaFkxb1NG?=
 =?utf-8?B?TEt3bFB5UVFNVWN0b0syRTFnMmN2SGNxYzhiMlJBcU1iN3d6U256czBOL2pk?=
 =?utf-8?B?T1pQSTA3Unovd3Vpci9mTGNtRExiQnlTeGk4OElhcStvbThZUTBuQXJ0Slhq?=
 =?utf-8?B?NlNvWXdGNmxBaUlRUnRLVmhUN1dzclR6a1UyMkRrbzR5NHhsWHdSNEJ2czZP?=
 =?utf-8?B?ZUMvVjFpZFZlWk5rVTV2RDZ1WVBqNU8xaFNWaGRlYlFBSzdubVlWYlQwY1Bv?=
 =?utf-8?B?VkRZRmljTjJsRjVYTzVZRnkyL3B3ZDQrb3JBL1NNVVNFdTBwTzBUNURKQytQ?=
 =?utf-8?B?N1YySjdwd2s4L0NVRUNrbmhXbUFhRm9zMXRtRDJ2OUFHbERCTEJoMzF3Qk1R?=
 =?utf-8?B?aXUvSDFBZytxVWZjVzJxNDJ2WXo0b3FWbWVxMFZHMU1ic2l5NXA3S1pTMkY3?=
 =?utf-8?Q?r+KUzHBLiRdhW?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4022899009)(13003099007)(7053199007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MUJOd0w5ZXJudklLYXBjUGo3ODd3aEIvK2NocjAyelFuek9DbTIrczQ1c0p6?=
 =?utf-8?B?K1J1RXRUQ1VvODdTcGpqTHB5aUp1c3kva25Wc1dSWG5BTVNuS0pNbVVHNHNr?=
 =?utf-8?B?U0dlM0NjbFo5SW85dW5CdkxqYjEyWWxSY2ZVR1NXTDEvSEM2ZUFza3pteHRI?=
 =?utf-8?B?bjIvUjRsN3FFVjdITkxQV1MzWHhzb1k3YXI5YmkvdVJDTi94Z3AwY1l6Sm1H?=
 =?utf-8?B?NnZhRXd4dE9WdEUxWFc5Rm9ybWFFMUxuRDdSMUZMK2pyaHpvbFFnbkNqLzRO?=
 =?utf-8?B?K3h4NmZBWnYyMnJybFpjUkc3TjkwVWRqL2JVMnVTdHhvUmo4bFlWQ1l1ZHF1?=
 =?utf-8?B?b1VmWlpuRUtDWmlWL0t2Q1RZcEtQVDN6TXpjQjNWZkJqWi95MVk2Y3dueWRY?=
 =?utf-8?B?cmNneEJ2dkRYTXVvS0hTazROeG5XQ0xZa01Zdk5CWlMvb1VvTHhDdXByWFFa?=
 =?utf-8?B?L2J2RE4rWkVmUE52WFNnUkVTMEtpLzg3MS9rQnhuQjRHK3haU2NpVi9xLzI0?=
 =?utf-8?B?Z0FSeE92Wm5iWE1RMmVNSlR6by9La2pNQ2QwZzgwQ2hBdjl1TVF2cVdOVWl1?=
 =?utf-8?B?anNIYmJ4aUh5bkFvNVpheUs1a21lQkZUSXpqeFF2U1VONGc1bE1mM2hrUTFx?=
 =?utf-8?B?QTRPNHpKVm1kUUZkZFkvaWJkTzBiR2M1UUJnN0Nld0poYnI0NXlvTmlOVEJx?=
 =?utf-8?B?Tnhza1FhRmxEOVljeUNoU2h4aVgrN0F3eno5eUFYT3B1NVlGUXVmL0dkRkR2?=
 =?utf-8?B?c0NYTXV6ZWFyd0ZTclRTN3hzYkQwblVBRUpuWGpqSjVYd0ZIMnlQb2wycjhB?=
 =?utf-8?B?bW5CV3FGVmVMb3FHcmE2WUQvbHh2UElXUFNFMkFBaWlyUW1jdThvTTAzZWhr?=
 =?utf-8?B?V05seU1tMU01a0doQUVrOXZMbDNTVGdMb3BXcWZkT1dSNnZhZm5jSmkyM0RX?=
 =?utf-8?B?UFozbnkvR2tSeCtkWWIwc1RBbTUrQW5OZHJrbkxjcnl1ZFB5a25kd2czbVVL?=
 =?utf-8?B?Z3BxbUl4eEF5Um1hM0lWMURPcDlieXVGKzJWVk85dlZHMW1GTDUzYk43akdK?=
 =?utf-8?B?L0trUExpVkFnU0lQbzRCcW4xcjdTSmliQlUvS2lTMjNaWXdDZGo0UEN4N0cz?=
 =?utf-8?B?VVB4SFJpNFBNSlZjRGRnVEtJeENZdkFIMHFIcnNkU054M0ZvQjE3U2dkb0Nl?=
 =?utf-8?B?eG9GQW85TmEzbFVQYUVnMFV0czFQRUkrcWl5YVV4enFwNnNHS1ZFL0x1NGRh?=
 =?utf-8?B?VGVDSlpGTllBNXpiTGFVT1VXcUdkZWJOeGNyRVV3UVh5NnpWZW5VdTFuSWxX?=
 =?utf-8?B?SFVhVmRhVFJjODM2Z2dZTTdsVTM1SUJ1d3B2RXVaSmxRUEtQQTVuVXlyUitY?=
 =?utf-8?B?YnhpQjFZVHB0MFFqZ0tWc0dmaStnc2VLUDJMeHdndVRHc1hHYmZHallJUUxL?=
 =?utf-8?B?U0pQa1VxQkhjZnJsVGVRV09ZYTBueTNjNW9ZU1hvYk9LL3lVR01NV085Qkdt?=
 =?utf-8?B?QlUwSU1lOXlONC9ySGpvQllLWjhpOWdmbC9hMDRQdEN3NlhVVGo5dml0M3R6?=
 =?utf-8?B?R2I4Z2ErNHFJdFJoTVdqdG9FcVNjOWpwUGVqZXRIZEdmVDlQYityRkVMc1Zs?=
 =?utf-8?B?WE04Q0dYOXU3aUpDNGpuK0o2ZDJJdkwyYThTemhTRjJyZXhDUGRucE1UUnNG?=
 =?utf-8?B?VTZlUzVKK1hSMkZncDFCVWdXTWJhWkpkdVBVZlA3YUNXRkRuTjRtWm5xMUFG?=
 =?utf-8?B?NlYvWEY5WlVDSzVwb2drd2pGeHBXdGVqRmRydU9vcm5iK1Y1eWFibGdTaDBI?=
 =?utf-8?B?dGdLd0owcm5uY0krRFQ1VFBadEYzTE9va0loWWZHNjhjazJQb21SVWNCOVBK?=
 =?utf-8?B?S2o2NTRheGxzVDFRVnNVK0hnN2NodTZiRS9Da2p6YmJXdjE2NjVpR1dFaWlL?=
 =?utf-8?B?OVR4b0IvTVkwS3l1dTUxOWp3US9qQ25uTDVSUXlKRmZ0V3NwbmVNM1p3OVFD?=
 =?utf-8?B?N0s3YjVKQlUraitoWlZBcTUyQUY0dVY3Y1J6M2hXUTBFbk9BNFBwMjVpVFRB?=
 =?utf-8?B?SXdCKzVuOE0xVWU2SnpxQmh5K1F0QkJPZnR4cW9pWDZhRU5hYXNrNmVEc0xN?=
 =?utf-8?B?UWlUTDlhMUUzQ2ZUR1BRWUdENVVzeHpkWUtRYmdBU2lxNnJ1TitIQzZuT3Jv?=
 =?utf-8?B?NEE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd4cd9a2-0a2e-4a68-010f-08dd78449d29
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 15:30:24.8902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iiJmhwEicq8uSpfsQcEWordRPXcgMBw0toLqI9FzDxF9zy2jEzE2ZZkn001vUb8SxwaCxZYR1Vck83Z62TSqWAGXzKiU8lUEZ8K3ktsIeSM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7107
X-Proofpoint-ORIG-GUID: 3AYAm0gZJCeGA6FU04KcgEA6hmnn-s28
X-Authority-Analysis: v=2.4 cv=RMSzH5i+ c=1 sm=1 tr=0 ts=67f7e416 cx=c_pps a=+hq7TYb7Jqj0EztKBnUMzg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=CCpqsmhAAAAA:8 a=Q4-j1AaZAAAA:8 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8 a=_enOPnqeAAAA:8 a=20KFwNOVAAAA:8 a=KKAkSRfTAAAA:8 a=xoWJ8iwB_Qmd0UybmmoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pGLkceISAAAA:8 a=8YLmpHxm398PgzAxhzMA:9 a=UGw3uBFBsV6xwBHF:21
 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=ul9cdbp4aOFLsgKbc677:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22 a=XAbD3I9PDrnSMThV5XoS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 9RnKzBM3jSs5Je4aXHhXn_jCd346Ntg5
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504100112
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 15:30:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214681

--------------3F05IZRZnK1v40bcIYY4rq7Z
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 53A4k7co005306

On 2025-04-10 9:49 a.m., Steve Sakoman via lists.openembedded.org wrote:
> On Thu, Apr 10, 2025 at 4:33=E2=80=AFAM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Tue, 2025-04-08 at 13:51 -0700, Steve Sakoman via
>> lists.openembedded.org wrote:
>>> From: Haixiao Yan<haixiao.yan.cn@windriver.com>
>>>
>>> Backport a patch [1] to improve performance of rand() and
>>> __random()[2]
>>> by adding a single-threaded fast path.
>>>
>>> [1]
>>> https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3Dbe0cfd848d9a=
d7378800d6302bc11467cf2b514f
>>> [2]https://sourceware.org/bugzilla/show_bug.cgi?id=3D32777
>>> Signed-off-by: Haixiao Yan<haixiao.yan.cn@windriver.com>
>>> Signed-off-by: Steve Sakoman<steve@sakoman.com>
>>> ---
>>>   ...dd-single-threaded-fast-path-to-rand.patch | 47
>>> +++++++++++++++++++
>>>   meta/recipes-core/glibc/glibc_2.35.bb         |  1 +
>>>   2 files changed, 48 insertions(+)
>>>   create mode 100644 meta/recipes-core/glibc/glibc/0001-stdlib-Add-
>>> single-threaded-fast-path-to-rand.patch
>> This isn't in walnascar yet.
> I've got it and "qemu 8.2.7: ignore CVE-2023-1386" in my local
> walnascar branch. I will hold off merging to all stable branches till
> after walnascar release.
>
> Thanks for catching this!

People were discussing this bug wrt adding it to walnascar's RC2 bulid.
The conclusion is to merge it to walnascar *after* GA so it can soak for=20
a bit
and to minimize risk to the GA release.

This is a customer issue and they have been happy with the fix since=20
March 28th but
it was only merged to our product repo on April 2nd so it's probably a=20
good idea
to let it soak.

I'm not sure if it'll help but below is Haixiao's summary from our=20
internal bug tracker.
It's a verbose version of the master branch commit log.
One notable comment is:
 =C2=A0=C2=A0 the issue can not reproduce on modern CPU (such as Zen3/Ryz=
en9),
 =C2=A0=C2=A0 they are smart to handle the lock for single-thread case.

I wonder how many other 'modern' targets avoid the issue at build / run=20
time.

If we want more info, please rely and Haixiao can spend some time on digg=
ing
a bit more.

../Randy



Summary:

This is a generic issue, not only found on wrLinux, also met on ubuntu=20
22.04.

The degradation since from glibc-2.34, until the latest glibc-2.41 is=20
affected.
The fix will be included in glibc-2.42.
I have filed https://sourceware.org/bugzilla/show_bug.cgi?id=3D32777=20
<https://sourceware.org/bugzilla/show_bug.cgi?id=3D32777> to the upstream.

The first bad commit is 60d5e40ab200033a982a9fd7594a1f83dcdb94a0.

commit 60d5e40ab200033a982a9fd7594a1f83dcdb94a0
Author: Florian Weimer<fweimer@redhat.com>
Date:   Wed Apr 21 19:49:51 2021 +0200

     x86: Remove low-level lock optimization
    =20
     The current approach is to do this optimizations at a higher level,
     in generic code, so that single-threaded cases can be specifically
     targeted.
    =20
     Furthermore, using IS_IN (libc) as a compile-time indicator that
     all locks are private is no longer correct once process-shared lock
     implementations are moved into libc.
    =20
     The generic <lowlevellock.h> is not compatible with assembler code
     (obviously), so it's necessary to remove two long-unused #includes.
    =20
     Reviewed-by: Adhemerval Zanella<adhemerval.zanella@linaro.org>

This commit remove the optimization for single-threaded case, such as=20
mallocrandfree.
 From the perf result, random function has been called significantly=20
increased from 15.5% to 42.28%.
on glibc-2.33, disassemble the random function:

(gdb) disassemble random
Dump of assembler code for function __random:
    0x00007ffff7e3dc20 <+0>:     endbr64
    0x00007ffff7e3dc24 <+4>:     sub    $0x18,%rsp
    0x00007ffff7e3dc28 <+8>:     mov    %fs:0x18,%eax
    0x00007ffff7e3dc30 <+16>:    test   %eax,%eax
    0x00007ffff7e3dc32 <+18>:    jne    0x7ffff7e3dc70 <__random+80>
    0x00007ffff7e3dc34 <+20>:    mov    $0x1,%edx
    0x00007ffff7e3dc39 <+25>:    cmpxchg %edx,0x17e708(%rip)        # 0x7=
ffff7fbc348 <lock>
    0x00007ffff7e3dc40 <+32>:    lea    0xc(%rsp),%rsi
    0x00007ffff7e3dc45 <+37>:    lea    0x17bb14(%rip),%rdi        # 0x7f=
fff7fb9760 <unsafe_state>
    0x00007ffff7e3dc4c <+44>:    call   0x7ffff7e3e070 <__random_r>
    0x00007ffff7e3dc51 <+49>:    mov    %fs:0x18,%eax
    0x00007ffff7e3dc59 <+57>:    test   %eax,%eax
    0x00007ffff7e3dc5b <+59>:    jne    0x7ffff7e3dc90 <__random+112>
    0x00007ffff7e3dc5d <+61>:    subl   $0x1,0x17e6e4(%rip)        # 0x7f=
fff7fbc348 <lock>
    0x00007ffff7e3dc64 <+68>:    movslq 0xc(%rsp),%rax
    0x00007ffff7e3dc69 <+73>:    add    $0x18,%rsp
    0x00007ffff7e3dc6d <+77>:    ret
    0x00007ffff7e3dc6e <+78>:    xchg   %ax,%ax
    0x00007ffff7e3dc70 <+80>:    xor    %eax,%eax
    0x00007ffff7e3dc72 <+82>:    mov    $0x1,%edx
    0x00007ffff7e3dc77 <+87>:    lock cmpxchg %edx,0x17e6c9(%rip)        =
# 0x7ffff7fbc348 <lock>
    0x00007ffff7e3dc7f <+95>:    je     0x7ffff7e3dc40 <__random+32>
    0x00007ffff7e3dc81 <+97>:    lea    0x17e6c0(%rip),%rdi        # 0x7f=
fff7fbc348 <lock>
    0x00007ffff7e3dc88 <+104>:   call   0x7ffff7e81c00 <__lll_lock_wait_p=
rivate>
    0x00007ffff7e3dc8d <+109>:   jmp    0x7ffff7e3dc40 <__random+32>
    0x00007ffff7e3dc8f <+111>:   nop
    0x00007ffff7e3dc90 <+112>:   xor    %eax,%eax
    0x00007ffff7e3dc92 <+114>:   xchg   %eax,0x17e6b0(%rip)        # 0x7f=
fff7fbc348 <lock>
    0x00007ffff7e3dc98 <+120>:   cmp    $0x1,%eax
    0x00007ffff7e3dc9b <+123>:   jle    0x7ffff7e3dc64 <__random+68>
    0x00007ffff7e3dc9d <+125>:   xor    %r10d,%r10d
    0x00007ffff7e3dca0 <+128>:   mov    $0x1,%edx
    0x00007ffff7e3dca5 <+133>:   mov    $0x81,%esi
    0x00007ffff7e3dcaa <+138>:   mov    $0xca,%eax
    0x00007ffff7e3dcaf <+143>:   lea    0x17e692(%rip),%rdi        # 0x7f=
fff7fbc348 <lock>
    0x00007ffff7e3dcb6 <+150>:   syscall
    0x00007ffff7e3dcb8 <+152>:   jmp    0x7ffff7e3dc64 <__random+68>
End of assembler dump.

test %eax,%eax will check the single-threaded condition, if in=20
single-threaded environments, skips locking, calls __random_r directly,=20
and returns the random number.
if in multi-threaded environments, acquires a lock, calls __random_r,=20
releases the lock, handles contention, and returns the random number.

on glibc-2.34, disassemble the random function:

(gdb) disassemble random
Dump of assembler code for function __random:
    0x00007ffff7c44db0 <+0>:     endbr64
    0x00007ffff7c44db4 <+4>:     sub    $0x18,%rsp
    0x00007ffff7c44db8 <+8>:     xor    %eax,%eax
    0x00007ffff7c44dba <+10>:    mov    $0x1,%edx
    0x00007ffff7c44dbf <+15>:    lock cmpxchg %edx,0x1b0641(%rip)        =
# 0x7ffff7df5408 <lock>
    0x00007ffff7c44dc7 <+23>:    jne    0x7ffff7c44df8 <__random+72>
    0x00007ffff7c44dc9 <+25>:    lea    0xc(%rsp),%rsi
    0x00007ffff7c44dce <+30>:    lea    0x1ada6b(%rip),%rdi        # 0x7f=
fff7df2840 <unsafe_state>
    0x00007ffff7c44dd5 <+37>:    call   0x7ffff7c451e0 <__random_r>
    0x00007ffff7c44dda <+42>:    xor    %eax,%eax
    0x00007ffff7c44ddc <+44>:    xchg   %eax,0x1b0626(%rip)        # 0x7f=
fff7df5408 <lock>
    0x00007ffff7c44de2 <+50>:    cmp    $0x1,%eax
    0x00007ffff7c44de5 <+53>:    jg     0x7ffff7c44e10 <__random+96>
    0x00007ffff7c44de7 <+55>:    movslq 0xc(%rsp),%rax
    0x00007ffff7c44dec <+60>:    add    $0x18,%rsp
    0x00007ffff7c44df0 <+64>:    ret
    0x00007ffff7c44df1 <+65>:    nopl   0x0(%rax)
    0x00007ffff7c44df8 <+72>:    lea    0x1b0609(%rip),%rdi        # 0x7f=
fff7df5408 <lock>
    0x00007ffff7c44dff <+79>:    call   0x7ffff7c88680 <__GI___lll_lock_w=
ait_private>
    0x00007ffff7c44e04 <+84>:    jmp    0x7ffff7c44dc9 <__random+25>
    0x00007ffff7c44e06 <+86>:    cs nopw 0x0(%rax,%rax,1)
    0x00007ffff7c44e10 <+96>:    lea    0x1b05f1(%rip),%rdi        # 0x7f=
fff7df5408 <lock>
    0x00007ffff7c44e17 <+103>:   call   0x7ffff7c88750 <__GI___lll_lock_w=
ake_private>
    0x00007ffff7c44e1c <+108>:   movslq 0xc(%rsp),%rax
    0x00007ffff7c44e21 <+113>:   add    $0x18,%rsp
    0x00007ffff7c44e25 <+117>:   ret
End of assembler dump.

Both single-threaded and multi-threaded are using atomic operations and=20
lock management.
So cause the performance of single-threaded cases degradation.

The fix has been included on master branch on Feb 24, 2025.
https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3Dbe0cfd848d9ad737=
8800d6302bc11467cf2b514f=20
<https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3Dbe0cfd848d9ad73=
78800d6302bc11467cf2b514f>

after the fix, disassemble the random function:

(gdb) disassemble random
Dump of assembler code for function __random:
    0x00007ffff7e1d0b0 <+0>:     endbr64
    0x00007ffff7e1d0b4 <+4>:     sub    $0x18,%rsp
    0x00007ffff7e1d0b8 <+8>:     cmpb   $0x0,0x199221(%rip)        # 0x7f=
fff7fb62e0 <__libc_single_threaded_internal>
    0x00007ffff7e1d0bf <+15>:    jne    0x7ffff7e1d100 <__random+80>
    0x00007ffff7e1d0c1 <+17>:    xor    %eax,%eax
    0x00007ffff7e1d0c3 <+19>:    mov    $0x1,%edx
    0x00007ffff7e1d0c8 <+24>:    lock cmpxchg %edx,0x1935c0(%rip)        =
# 0x7ffff7fb0690 <lock>
    0x00007ffff7e1d0d0 <+32>:    jne    0x7ffff7e1d130 <__random+128>
    0x00007ffff7e1d0d2 <+34>:    lea    0xc(%rsp),%rsi
    0x00007ffff7e1d0d7 <+39>:    lea    0x1917a2(%rip),%rdi        # 0x7f=
fff7fae880 <unsafe_state>
    0x00007ffff7e1d0de <+46>:    call   0x7ffff7e1d500 <__random_r>
    0x00007ffff7e1d0e3 <+51>:    xor    %eax,%eax
    0x00007ffff7e1d0e5 <+53>:    xchg   %eax,0x1935a5(%rip)        # 0x7f=
fff7fb0690 <lock>
    0x00007ffff7e1d0eb <+59>:    cmp    $0x1,%eax
    0x00007ffff7e1d0ee <+62>:    jg     0x7ffff7e1d120 <__random+112>
    0x00007ffff7e1d0f0 <+64>:    movslq 0xc(%rsp),%rax
    0x00007ffff7e1d0f5 <+69>:    add    $0x18,%rsp
    0x00007ffff7e1d0f9 <+73>:    ret
    0x00007ffff7e1d0fa <+74>:    nopw   0x0(%rax,%rax,1)
    0x00007ffff7e1d100 <+80>:    lea    0xc(%rsp),%rsi
    0x00007ffff7e1d105 <+85>:    lea    0x191774(%rip),%rdi        # 0x7f=
fff7fae880 <unsafe_state>
    0x00007ffff7e1d10c <+92>:    call   0x7ffff7e1d500 <__random_r>
    0x00007ffff7e1d111 <+97>:    movslq 0xc(%rsp),%rax
    0x00007ffff7e1d116 <+102>:   add    $0x18,%rsp
    0x00007ffff7e1d11a <+106>:   ret
    0x00007ffff7e1d11b <+107>:   nopl   0x0(%rax,%rax,1)
    0x00007ffff7e1d120 <+112>:   lea    0x193569(%rip),%rdi        # 0x7f=
fff7fb0690 <lock>
    0x00007ffff7e1d127 <+119>:   call   0x7ffff7e60360 <__GI___lll_lock_w=
ake_private>
    0x00007ffff7e1d12c <+124>:   jmp    0x7ffff7e1d0f0 <__random+64>
    0x00007ffff7e1d12e <+126>:   xchg   %ax,%ax
    0x00007ffff7e1d130 <+128>:   lea    0x193559(%rip),%rdi        # 0x7f=
fff7fb0690 <lock>
    0x00007ffff7e1d137 <+135>:   call   0x7ffff7e60290 <__GI___lll_lock_w=
ait_private>
    0x00007ffff7e1d13c <+140>:   jmp    0x7ffff7e1d0d2 <__random+34>
End of assembler dump.

cmpb $0x0,0x199221(%rip) will check single-threaded mode, which avoids=20
unnecessary locking.

BTW, the issue can not reproduce on modern CPU (such as Zen3/Ryzen9),=20
they are smart to handle the lock for single-thread case.


>
> Steve
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214675):https://lists.openembedded.org/g/openembedd=
ed-core/message/214675
> Mute This Topic:https://lists.openembedded.org/mt/112161542/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [r=
andy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------3F05IZRZnK1v40bcIYY4rq7Z
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 53A4k7co005306

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2025-04-10 9:49 a.m., Steve Sakoman
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAOSpxdbDTvGJb3tVH323=3D+BEDEM6=
JwHRveMhaZ+oRFA0i5QrFQ@mail.gmail.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">On Thu, Apr 10, 2025 at 4:33=
=E2=80=AFAM Richard Purdie
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:richard.purdie@linuxfou=
ndation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">On Tue, 2025-04-08 at 13:5=
1 -0700, Steve Sakoman via
lists.openembedded.org wrote:
</pre>
        <blockquote type=3D"cite">
          <pre wrap=3D"" class=3D"moz-quote-pre">From: Haixiao Yan <a cla=
ss=3D"moz-txt-link-rfc2396E" href=3D"mailto:haixiao.yan.cn@windriver.com"=
>&lt;haixiao.yan.cn@windriver.com&gt;</a>

Backport a patch [1] to improve performance of rand() and
__random()[2]
by adding a single-threaded fast path.

[1]
<a class=3D"moz-txt-link-freetext" href=3D"https://sourceware.org/git/?p=3D=
glibc.git;a=3Dcommit;h=3Dbe0cfd848d9ad7378800d6302bc11467cf2b514f">https:=
//sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3Dbe0cfd848d9ad7378800d6=
302bc11467cf2b514f</a>
[2] <a class=3D"moz-txt-link-freetext" href=3D"https://sourceware.org/bug=
zilla/show_bug.cgi?id=3D32777">https://sourceware.org/bugzilla/show_bug.c=
gi?id=3D32777</a>
Signed-off-by: Haixiao Yan <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:haixiao.yan.cn@windriver.com">&lt;haixiao.yan.cn@windriver.com&gt;</a=
>
Signed-off-by: Steve Sakoman <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:steve@sakoman.com">&lt;steve@sakoman.com&gt;</a>
---
 ...dd-single-threaded-fast-path-to-rand.patch | 47
+++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0001-stdlib-Add-
single-threaded-fast-path-to-rand.patch
</pre>
        </blockquote>
        <pre wrap=3D"" class=3D"moz-quote-pre">This isn't in walnascar ye=
t.
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">I've got it and &quot;qemu 8=
.2.7: ignore CVE-2023-1386&quot; in my local
walnascar branch. I will hold off merging to all stable branches till
after walnascar release.

Thanks for catching this!</pre>
    </blockquote>
    <p>People were discussing this bug wrt adding it to walnascar's RC2
      bulid.<br>
      The conclusion is to merge it to walnascar <b>after</b> GA so it
      can soak for a bit<br>
      and to minimize risk to the GA release.</p>
    <p>This is a customer issue and they have been happy with the fix
      since March 28th but<br>
      it was only merged to our product repo on April 2nd so it's
      probably a good idea<br>
      to let it soak.<br>
      <br>
    </p>
    <p>I'm not sure if it'll help but below is Haixiao's summary from
      our internal bug tracker.<br>
      It's a verbose version of the master branch commit log. <br>
      One notable comment is:<br>
      &nbsp;&nbsp; the issue can not reproduce on modern CPU (such as
      Zen3/Ryzen9), <br>
      &nbsp;&nbsp; they are smart to handle the lock for single-thread ca=
se.</p>
    <p>I wonder how many other 'modern' targets avoid the issue at build
      / run time.</p>
    <p>If we want more info, please rely and Haixiao can spend some time
      on digging<br>
      a bit more.</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <div class=3D"action-body flooded">
      <p>Summary:</p>
      <p>This is a generic issue, not only found on wrLinux, also met on
        ubuntu 22.04.</p>
      <p>The degradation since from glibc-2.34, until the latest
        glibc-2.41 is affected.<br>
        The fix will be included in glibc-2.42.<br>
        I have filed <a href=3D"https://sourceware.org/bugzilla/show_bug.=
cgi?id=3D32777" class=3D"external-link moz-txt-link-freetext" target=3D"_=
blank" rel=3D"nofollow noopener">https://sourceware.org/bugzilla/show_bug=
.cgi?id=3D32777</a>
        to the upstream.</p>
      <p>The first bad commit is
        60d5e40ab200033a982a9fd7594a1f83dcdb94a0.</p>
      <div class=3D"preformatted panel" style=3D"border-width: 1px;">
        <div class=3D"preformattedContent panelContent">
          <pre>commit 60d5e40ab200033a982a9fd7594a1f83dcdb94a0
Author: Florian Weimer <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:=
fweimer@redhat.com">&lt;fweimer@redhat.com&gt;</a>
Date:   Wed Apr 21 19:49:51 2021 +0200

    x86: Remove low-level lock optimization
   =20
    The current approach is to do this optimizations at a higher level,
    in generic code, so that single-threaded cases can be specifically
    targeted.
   =20
    Furthermore, using IS_IN (libc) as a compile-time indicator that
    all locks are private is no longer correct once process-shared lock
    implementations are moved into libc.
   =20
    The generic &lt;lowlevellock.h&gt; is not compatible with assembler c=
ode
    (obviously), so it's necessary to remove two long-unused #includes.
   =20
    Reviewed-by: Adhemerval Zanella  <a class=3D"moz-txt-link-rfc2396E" h=
ref=3D"mailto:adhemerval.zanella@linaro.org">&lt;adhemerval.zanella@linar=
o.org&gt;</a>
</pre>
        </div>
      </div>
      <p>This commit remove the optimization for single-threaded case,
        such as mallocrandfree.<br>
        From the perf result, random function has been called
        significantly increased from 15.5% to 42.28%. <br>
        on glibc-2.33, disassemble the random function:</p>
      <div class=3D"preformatted panel" style=3D"border-width: 1px;">
        <div class=3D"preformattedContent panelContent">
          <pre>(gdb) disassemble random
Dump of assembler code for function __random:
   0x00007ffff7e3dc20 &lt;+0&gt;:     endbr64=20
   0x00007ffff7e3dc24 &lt;+4&gt;:     sub    $0x18,%rsp
   0x00007ffff7e3dc28 &lt;+8&gt;:     mov    %fs:0x18,%eax
   0x00007ffff7e3dc30 &lt;+16&gt;:    test   %eax,%eax
   0x00007ffff7e3dc32 &lt;+18&gt;:    jne    0x7ffff7e3dc70 &lt;__random+=
80&gt;
   0x00007ffff7e3dc34 &lt;+20&gt;:    mov    $0x1,%edx
   0x00007ffff7e3dc39 &lt;+25&gt;:    cmpxchg %edx,0x17e708(%rip)        =
# 0x7ffff7fbc348 &lt;lock&gt;
   0x00007ffff7e3dc40 &lt;+32&gt;:    lea    0xc(%rsp),%rsi
   0x00007ffff7e3dc45 &lt;+37&gt;:    lea    0x17bb14(%rip),%rdi        #=
 0x7ffff7fb9760 &lt;unsafe_state&gt;
   0x00007ffff7e3dc4c &lt;+44&gt;:    call   0x7ffff7e3e070 &lt;__random_=
r&gt;
   0x00007ffff7e3dc51 &lt;+49&gt;:    mov    %fs:0x18,%eax
   0x00007ffff7e3dc59 &lt;+57&gt;:    test   %eax,%eax
   0x00007ffff7e3dc5b &lt;+59&gt;:    jne    0x7ffff7e3dc90 &lt;__random+=
112&gt;
   0x00007ffff7e3dc5d &lt;+61&gt;:    subl   $0x1,0x17e6e4(%rip)        #=
 0x7ffff7fbc348 &lt;lock&gt;
   0x00007ffff7e3dc64 &lt;+68&gt;:    movslq 0xc(%rsp),%rax
   0x00007ffff7e3dc69 &lt;+73&gt;:    add    $0x18,%rsp
   0x00007ffff7e3dc6d &lt;+77&gt;:    ret   =20
   0x00007ffff7e3dc6e &lt;+78&gt;:    xchg   %ax,%ax
   0x00007ffff7e3dc70 &lt;+80&gt;:    xor    %eax,%eax
   0x00007ffff7e3dc72 &lt;+82&gt;:    mov    $0x1,%edx
   0x00007ffff7e3dc77 &lt;+87&gt;:    lock cmpxchg %edx,0x17e6c9(%rip)   =
     # 0x7ffff7fbc348 &lt;lock&gt;
   0x00007ffff7e3dc7f &lt;+95&gt;:    je     0x7ffff7e3dc40 &lt;__random+=
32&gt;
   0x00007ffff7e3dc81 &lt;+97&gt;:    lea    0x17e6c0(%rip),%rdi        #=
 0x7ffff7fbc348 &lt;lock&gt;
   0x00007ffff7e3dc88 &lt;+104&gt;:   call   0x7ffff7e81c00 &lt;__lll_loc=
k_wait_private&gt;
   0x00007ffff7e3dc8d &lt;+109&gt;:   jmp    0x7ffff7e3dc40 &lt;__random+=
32&gt;
   0x00007ffff7e3dc8f &lt;+111&gt;:   nop
   0x00007ffff7e3dc90 &lt;+112&gt;:   xor    %eax,%eax
   0x00007ffff7e3dc92 &lt;+114&gt;:   xchg   %eax,0x17e6b0(%rip)        #=
 0x7ffff7fbc348 &lt;lock&gt;
   0x00007ffff7e3dc98 &lt;+120&gt;:   cmp    $0x1,%eax
   0x00007ffff7e3dc9b &lt;+123&gt;:   jle    0x7ffff7e3dc64 &lt;__random+=
68&gt;
   0x00007ffff7e3dc9d &lt;+125&gt;:   xor    %r10d,%r10d
   0x00007ffff7e3dca0 &lt;+128&gt;:   mov    $0x1,%edx
   0x00007ffff7e3dca5 &lt;+133&gt;:   mov    $0x81,%esi
   0x00007ffff7e3dcaa &lt;+138&gt;:   mov    $0xca,%eax
   0x00007ffff7e3dcaf &lt;+143&gt;:   lea    0x17e692(%rip),%rdi        #=
 0x7ffff7fbc348 &lt;lock&gt;
   0x00007ffff7e3dcb6 &lt;+150&gt;:   syscall=20
   0x00007ffff7e3dcb8 &lt;+152&gt;:   jmp    0x7ffff7e3dc64 &lt;__random+=
68&gt;
End of assembler dump.
</pre>
        </div>
      </div>
      <p>test %eax,%eax will check the single-threaded condition, if in
        single-threaded environments, skips locking, calls __random_r
        directly, and returns the random number.<br>
        if in multi-threaded environments, acquires a lock, calls
        __random_r, releases the lock, handles contention, and returns
        the random number.</p>
      <p>on glibc-2.34, disassemble the random function:</p>
      <div class=3D"preformatted panel" style=3D"border-width: 1px;">
        <div class=3D"preformattedContent panelContent">
          <pre>(gdb) disassemble random
Dump of assembler code for function __random:
   0x00007ffff7c44db0 &lt;+0&gt;:     endbr64=20
   0x00007ffff7c44db4 &lt;+4&gt;:     sub    $0x18,%rsp
   0x00007ffff7c44db8 &lt;+8&gt;:     xor    %eax,%eax
   0x00007ffff7c44dba &lt;+10&gt;:    mov    $0x1,%edx
   0x00007ffff7c44dbf &lt;+15&gt;:    lock cmpxchg %edx,0x1b0641(%rip)   =
     # 0x7ffff7df5408 &lt;lock&gt;
   0x00007ffff7c44dc7 &lt;+23&gt;:    jne    0x7ffff7c44df8 &lt;__random+=
72&gt;
   0x00007ffff7c44dc9 &lt;+25&gt;:    lea    0xc(%rsp),%rsi
   0x00007ffff7c44dce &lt;+30&gt;:    lea    0x1ada6b(%rip),%rdi        #=
 0x7ffff7df2840 &lt;unsafe_state&gt;
   0x00007ffff7c44dd5 &lt;+37&gt;:    call   0x7ffff7c451e0 &lt;__random_=
r&gt;
   0x00007ffff7c44dda &lt;+42&gt;:    xor    %eax,%eax
   0x00007ffff7c44ddc &lt;+44&gt;:    xchg   %eax,0x1b0626(%rip)        #=
 0x7ffff7df5408 &lt;lock&gt;
   0x00007ffff7c44de2 &lt;+50&gt;:    cmp    $0x1,%eax
   0x00007ffff7c44de5 &lt;+53&gt;:    jg     0x7ffff7c44e10 &lt;__random+=
96&gt;
   0x00007ffff7c44de7 &lt;+55&gt;:    movslq 0xc(%rsp),%rax
   0x00007ffff7c44dec &lt;+60&gt;:    add    $0x18,%rsp
   0x00007ffff7c44df0 &lt;+64&gt;:    ret   =20
   0x00007ffff7c44df1 &lt;+65&gt;:    nopl   0x0(%rax)
   0x00007ffff7c44df8 &lt;+72&gt;:    lea    0x1b0609(%rip),%rdi        #=
 0x7ffff7df5408 &lt;lock&gt;
   0x00007ffff7c44dff &lt;+79&gt;:    call   0x7ffff7c88680 &lt;__GI___ll=
l_lock_wait_private&gt;
   0x00007ffff7c44e04 &lt;+84&gt;:    jmp    0x7ffff7c44dc9 &lt;__random+=
25&gt;
   0x00007ffff7c44e06 &lt;+86&gt;:    cs nopw 0x0(%rax,%rax,1)
   0x00007ffff7c44e10 &lt;+96&gt;:    lea    0x1b05f1(%rip),%rdi        #=
 0x7ffff7df5408 &lt;lock&gt;
   0x00007ffff7c44e17 &lt;+103&gt;:   call   0x7ffff7c88750 &lt;__GI___ll=
l_lock_wake_private&gt;
   0x00007ffff7c44e1c &lt;+108&gt;:   movslq 0xc(%rsp),%rax
   0x00007ffff7c44e21 &lt;+113&gt;:   add    $0x18,%rsp
   0x00007ffff7c44e25 &lt;+117&gt;:   ret   =20
End of assembler dump.
</pre>
        </div>
      </div>
      <p>Both single-threaded and multi-threaded are using atomic
        operations and lock management.<br>
        So cause the performance of single-threaded cases degradation.</p=
>
      <p>The fix has been included on master branch on Feb 24, 2025.<br>
        <a href=3D"https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=
=3Dbe0cfd848d9ad7378800d6302bc11467cf2b514f" class=3D"external-link moz-t=
xt-link-freetext" target=3D"_blank" rel=3D"nofollow noopener">https://sou=
rceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3Dbe0cfd848d9ad7378800d6302bc=
11467cf2b514f</a></p>
      <p>after the fix, disassemble the random function:</p>
      <div class=3D"preformatted panel" style=3D"border-width: 1px;">
        <div class=3D"preformattedContent panelContent">
          <pre>(gdb) disassemble random
Dump of assembler code for function __random:
   0x00007ffff7e1d0b0 &lt;+0&gt;:     endbr64=20
   0x00007ffff7e1d0b4 &lt;+4&gt;:     sub    $0x18,%rsp
   0x00007ffff7e1d0b8 &lt;+8&gt;:     cmpb   $0x0,0x199221(%rip)        #=
 0x7ffff7fb62e0 &lt;__libc_single_threaded_internal&gt;
   0x00007ffff7e1d0bf &lt;+15&gt;:    jne    0x7ffff7e1d100 &lt;__random+=
80&gt;
   0x00007ffff7e1d0c1 &lt;+17&gt;:    xor    %eax,%eax
   0x00007ffff7e1d0c3 &lt;+19&gt;:    mov    $0x1,%edx
   0x00007ffff7e1d0c8 &lt;+24&gt;:    lock cmpxchg %edx,0x1935c0(%rip)   =
     # 0x7ffff7fb0690 &lt;lock&gt;
   0x00007ffff7e1d0d0 &lt;+32&gt;:    jne    0x7ffff7e1d130 &lt;__random+=
128&gt;
   0x00007ffff7e1d0d2 &lt;+34&gt;:    lea    0xc(%rsp),%rsi
   0x00007ffff7e1d0d7 &lt;+39&gt;:    lea    0x1917a2(%rip),%rdi        #=
 0x7ffff7fae880 &lt;unsafe_state&gt;
   0x00007ffff7e1d0de &lt;+46&gt;:    call   0x7ffff7e1d500 &lt;__random_=
r&gt;
   0x00007ffff7e1d0e3 &lt;+51&gt;:    xor    %eax,%eax
   0x00007ffff7e1d0e5 &lt;+53&gt;:    xchg   %eax,0x1935a5(%rip)        #=
 0x7ffff7fb0690 &lt;lock&gt;
   0x00007ffff7e1d0eb &lt;+59&gt;:    cmp    $0x1,%eax
   0x00007ffff7e1d0ee &lt;+62&gt;:    jg     0x7ffff7e1d120 &lt;__random+=
112&gt;
   0x00007ffff7e1d0f0 &lt;+64&gt;:    movslq 0xc(%rsp),%rax
   0x00007ffff7e1d0f5 &lt;+69&gt;:    add    $0x18,%rsp
   0x00007ffff7e1d0f9 &lt;+73&gt;:    ret   =20
   0x00007ffff7e1d0fa &lt;+74&gt;:    nopw   0x0(%rax,%rax,1)
   0x00007ffff7e1d100 &lt;+80&gt;:    lea    0xc(%rsp),%rsi
   0x00007ffff7e1d105 &lt;+85&gt;:    lea    0x191774(%rip),%rdi        #=
 0x7ffff7fae880 &lt;unsafe_state&gt;
   0x00007ffff7e1d10c &lt;+92&gt;:    call   0x7ffff7e1d500 &lt;__random_=
r&gt;
   0x00007ffff7e1d111 &lt;+97&gt;:    movslq 0xc(%rsp),%rax
   0x00007ffff7e1d116 &lt;+102&gt;:   add    $0x18,%rsp
   0x00007ffff7e1d11a &lt;+106&gt;:   ret   =20
   0x00007ffff7e1d11b &lt;+107&gt;:   nopl   0x0(%rax,%rax,1)
   0x00007ffff7e1d120 &lt;+112&gt;:   lea    0x193569(%rip),%rdi        #=
 0x7ffff7fb0690 &lt;lock&gt;
   0x00007ffff7e1d127 &lt;+119&gt;:   call   0x7ffff7e60360 &lt;__GI___ll=
l_lock_wake_private&gt;
   0x00007ffff7e1d12c &lt;+124&gt;:   jmp    0x7ffff7e1d0f0 &lt;__random+=
64&gt;
   0x00007ffff7e1d12e &lt;+126&gt;:   xchg   %ax,%ax
   0x00007ffff7e1d130 &lt;+128&gt;:   lea    0x193559(%rip),%rdi        #=
 0x7ffff7fb0690 &lt;lock&gt;
   0x00007ffff7e1d137 &lt;+135&gt;:   call   0x7ffff7e60290 &lt;__GI___ll=
l_lock_wait_private&gt;
   0x00007ffff7e1d13c &lt;+140&gt;:   jmp    0x7ffff7e1d0d2 &lt;__random+=
34&gt;
End of assembler dump.
</pre>
        </div>
      </div>
      <p>cmpb $0x0,0x199221(%rip) will check single-threaded mode, which
        avoids unnecessary locking.</p>
      <p>BTW, the issue can not reproduce on modern CPU (such as
        Zen3/Ryzen9), they are smart to handle the lock for
        single-thread case.</p>
    </div>
    <p></p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CAOSpxdbDTvGJb3tVH323=3D+BEDEM6=
JwHRveMhaZ+oRFA0i5QrFQ@mail.gmail.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

Steve
</pre>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre wrap=3D"" class=3D"moz-quote-pre">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#214675): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/214675">https:/=
/lists.openembedded.org/g/openembedded-core/message/214675</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/112161542/3616765">https://lists.openembedded.org/mt=
/112161542/3616765</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------3F05IZRZnK1v40bcIYY4rq7Z--

