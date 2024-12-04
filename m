Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 974D2E7716F
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 21:23:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.26230.1733347407656686983
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 13:23:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=20682b3ba7=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B4LJREh000574
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Dec 2024 13:23:27 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43833q4yf4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 13:23:26 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4B4LNQi2005787
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Dec 2024 13:23:26 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43833q4yf3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 13:23:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V8PJv0/H8BV8nbZeuTk82EshXbTFQDgYhgJ6xGMyVc2c1cEF9DMV77YYiL4UaS4EodmnxDaHqMDTXUeXpXEa9ZCNoQT2T+IrHiyoFTzFMVpaHhuR2x2SI92UnadJW+uGTp8jDq++D0MZ7MGdwpYEFLvxpzHy14y2bFCKGlwquNkOOOQEyE+asx1TPb5JcFRY6A9q2r9B2JbYLDRTAoPFX/a4Q8/AX6Fw0f+iJcxq2ikovvJFK2UuO4dJgMxVI1x9FkI6bzYZHqrKdu7E5kNG6Htdxadnv4t7d0LOu7G+WCpafTwo4bNhGbeTb2qoRFQ2MpaOEA2R9R2ghKXvO2NHTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3uMENxyiOeY7gqAZAenMRp2lkdmnVDLN+jrZ7CBB0zQ=;
 b=CnwFUwuVwaUSkm2V28TJqfP8bYxDYf2E/J2KMCznKft/m3080xZzt9+bpAhLmX8rq8oo2lLA795Hz/kULlJ+LmDJ/Ampvehx/fY2gVCDxOianQY4WiRkXH7Ea7/gb5tDeDBPmaj4E0Nk409E7G3s01irRsDWwLN8rmmQaIOWaiVoujgjPzgznKnPgsXNkGfIWuqGErr7uKhieqoHPcxusA95j8yDn9eaK+S+X6rGhAx1eIjSoNJvGqkmKuyQ4zGYaDaZdAAitlb1ji4iZhCt9QVu0MU5BbsD2M3m/JaT7/1DBjtK6iEElnpwRALva5M6rr4ENLQN2Sxjt5vH8pNKAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by IA1PR11MB7680.namprd11.prod.outlook.com (2603:10b6:208:3fb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Wed, 4 Dec
 2024 21:23:21 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%3]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 21:23:20 +0000
Content-Type: multipart/alternative;
 boundary="------------HPwkRKuJmT4eF4bUK0spDQuU"
Message-ID: <1841fe4a-9c73-4205-8146-59c124d6ce61@windriver.com>
Date: Wed, 4 Dec 2024 16:23:11 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][scarthgap][PATCH 1/1] Revert "ruby: upgrade 3.2.2 ->
 3.3.5"
To: Steve Sakoman <steve@sakoman.com>
Cc: Yogita.Urade@windriver.com, openembedded-core@lists.openembedded.org,
        "Yang, Liezhi" <Liezhi.Yang@windriver.com>,
        "Jia, Hongxu" <Hongxu.Jia@windriver.com>
References: <20241203101426.2227535-1-yogita.urade@windriver.com>
 <5623da37-3663-4bc0-9b50-a5efa34d72ad@windriver.com>
 <CAOSpxdbWAHY7H9QKsfP8xCLaeq_R1f9zhy7MsuO0T6h7PhBsPA@mail.gmail.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CAOSpxdbWAHY7H9QKsfP8xCLaeq_R1f9zhy7MsuO0T6h7PhBsPA@mail.gmail.com>
X-ClientProxiedBy: BYAPR07CA0003.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::16) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|IA1PR11MB7680:EE_
X-MS-Office365-Filtering-Correlation-Id: a98eebca-faab-494a-347c-08dd14a9e097
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?enl5aHUvUTNvQnZOeDV5KzdyU24yQkM4UEQwWlJ1akZHVnVQdEZBNSs5bG1R?=
 =?utf-8?B?NzVKMjRhWnMxcVMwZnViQUZtQmt2d1JKVy9TblVMQ2FuMWRYZ1dtMUhVM3Vq?=
 =?utf-8?B?Vm8waSswQ2hrT0s3OE1SK053UThkWkJob3FKNm1GeGQ4OXYyMTdJbjlvMXpJ?=
 =?utf-8?B?RUY1K0p2U2R6N0NrT0NBQmpjZGNFV2xpYWV1aC9JNlJxRWp1d1Y4UHppSWM1?=
 =?utf-8?B?bVBiYXNHMnhkdDQ3dXBOZ0RZK0RMRCtVbXJZVU9NSDBhRHQvNDVRMjQybWZl?=
 =?utf-8?B?bkpSUitWWTYxSytENWI2cUVoZlRYZTR0bS9vQ0hGSmJMSjdpelkrd0cyM0Z4?=
 =?utf-8?B?alFBa0xDZk9mVVpaNmx2cWlWV3lQZjAxV0FESXNRdk53TXJkd25rNUhOR1k5?=
 =?utf-8?B?a0tJZ0VFUkFUR1lkNWFqYXZvSVlPNkFEZDNrcjg4bFVOTjZ3MjZjWjYrWXVx?=
 =?utf-8?B?UHBacU5hRGRkUDRsUW9BdmJ0eXBWSlZtaWRuelVlWXk4STlHSG9rVFpRNXA2?=
 =?utf-8?B?YU5qNXRKelZnbzh6eDV6NnVqRGxvVlVLQ1l1dFdzUVh4QitRN2xhUmZnRXVu?=
 =?utf-8?B?aUpxN2V6TlI3WmJtRkZKY09ndXYwVUlDMHJxb1JvVGZ1TkNoemdkUEQvTE5J?=
 =?utf-8?B?Y2ZnSFFzWk5vbzZNYytReDZPM0tCMVhGdUtpdW54MEEvSlJ5T2lSaGtMYlk5?=
 =?utf-8?B?b3ZHRng0S0VEVDdEVjJmbEdQZXdGOWdLRDlhYTg1UEhUWElRWWM0dnFsekN2?=
 =?utf-8?B?cmVLSStNVW92ZG02WmhsZjRnTXZ5VngrYVVDRytsMWF1QnM5MFRhR1podDJN?=
 =?utf-8?B?d1RJUlhkMG1kbUppUzJiRG8rNmhacE5vTnBkMnY2VnVLdXNYT3VBMkpxbXk2?=
 =?utf-8?B?cUFwd3BBR0V5ZmJHcnVRSGluV2xLK0lGMlpweGp6emgra1NuOTY3RGNGaE1T?=
 =?utf-8?B?UWlxS0I5aHQvcVlNYnBkR3BqSXVrcytmaEZuK1g4cGpnTlJEVU83T2xqbURV?=
 =?utf-8?B?ZFNQeHUxbDZNUFdTRmxFeG54OGU5dlRYUEZSN0s4eFdPSytCaURlc2R5Q0Y0?=
 =?utf-8?B?MVByKzk0a1NGbzhJZmxtbmFSZ1hubU5mUzVFejNCaGsrRFgxNk5kWWNpYWJK?=
 =?utf-8?B?anZaRzl1R1hEWE83Z2g4Wlp4U3JFSEpsMWtmTFVyTGt1Nitwd0Q2L2RWOFFy?=
 =?utf-8?B?THg5TWg3aW1aVlpvUTVQNVFuekp4SEwxVWtiM216YTRYNGxPeVo0eHR0QUwy?=
 =?utf-8?B?TXE1ZENPdzRNRXg0UVM4RlAwUU1kRzlTYUJEUDNxODBTdVVjTWh2QU5UOGE2?=
 =?utf-8?B?b2luUlBEeTJtaDVaQ25iT3B6dDh0K3lLUUhkc1FGRjRBOVc2REtTMGdabFdp?=
 =?utf-8?B?OWFlNVlZcFVDNHpWTEdwa3FxdVFiOUJnV2M4eE9pNmNRR0NWYjV0MHI4cEha?=
 =?utf-8?B?bUcwRXlOQmRxbW1mbzFWdktxeUdvZGx0WUZTUHE3cHRQTE9LaElKL2kzTjFq?=
 =?utf-8?B?WEg1aURXOEkralFka2kyQlIxa0tkZVN5OTBoNWlGM3g5QWw0ZEVHdkdBN2s0?=
 =?utf-8?B?RWdmdzhJWXZJMEx1ZlNjSFBhVnVzVnU2UmFBSXNRb204Lzk3di9sYnp1RC9J?=
 =?utf-8?B?QmhaSExRMXV0N1U4MHZBcVhHd2NObzdVblZ0RGU1SVZrbjlnTnMza2ZnUnBS?=
 =?utf-8?B?anlZZFRSYmIxVDlMdkNCa1E5YVRtZjhJZlhZNEM2NWlZSDg4eGxJSWE1R3JK?=
 =?utf-8?Q?Kn7dRRDcKjPq5ojimQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eFZKbHNMTVBoeG5zcHBFL1BLUVJyS2pkMGNRcHFQVTdrcW1DTzByUUxWUE5n?=
 =?utf-8?B?UVhjZ3UzNWNHcEdUS21SbmNOV3NCYVlVcDBwRkcvYTNVemdxbWhndGR0dWJh?=
 =?utf-8?B?UGVKbkt0ZmQ2RlZFSVVaN0IyMGcwb01XM2d0WjA3U01IYjMvME9ZaHlMdktq?=
 =?utf-8?B?NVlpVks4V0RhcnBodlFQeldBSWVwUUJIWlY0V3NxMVJlcUE5SE1ZUi92eTBk?=
 =?utf-8?B?c1FjbHRvaU8zYkdqY3ZhZEFuc0lSemZXdnUzNkErSEt4cFNkQnR0TWgxQzRE?=
 =?utf-8?B?ZnlBU2E1SWp4YXdLTUZMMzFObTFVbmF2TzREaG5KVEliQTRKbGRlU1l6WkdB?=
 =?utf-8?B?c1I4MDc3TnJVc0hxZ002cmVzeHJQQXdOVnQvQlVSQUo2MlJzWXAzVmJTSGVa?=
 =?utf-8?B?ZlI1UW1VK3ZjSDFScUtnU0psN3JPM0N2czZMQWxrNUJlN25aSXpiaVc3cTBj?=
 =?utf-8?B?RkhvNi9vd0VuZzJuMzRmY2VwLy9wRFh2T3RodVNMN0NIUkpGWEF3eFFXVmdr?=
 =?utf-8?B?RUdKSWNPMEZkdW14WjBCTk8wc29vMk8vVjdHaGtGWHgwcDFRdXFIeXBYNjI0?=
 =?utf-8?B?ZWhpdmdyMUhDVlZEQjJLRzkwdG1ib05JTnBxNWE4TDUzbk9YR0ZDSGxxVndO?=
 =?utf-8?B?Z09ZUlhqcGUxZERCajU2SDVtVHRTMkZUaUNJNVBuOUJLY0ExUWlJRHBCa2Zv?=
 =?utf-8?B?VW4yVGxwUGQyOWxtemwwakJwRHRxWnhDcW1VeWVucFBBZEg2S1hwL2xRbitY?=
 =?utf-8?B?RmJFNkdFL1phdkxwNW4vWm1Ra2UxQ3M2aUhCSEg3VnozakFOVDZUMjdTY1JC?=
 =?utf-8?B?NlE5NHZTK0R1L1lhMGtmeXZCUk8wc2YxNFU5VFVDZVAwK0hlZU4wU2w5YTkr?=
 =?utf-8?B?RVdsbXlWR2E3cVd2NTJ6c0ZaTzEzR2cxdWhIdWtqTW1od014dVhVcW5YWXF6?=
 =?utf-8?B?TkRxZG1XRi9uZDFITDBiVzRvNnBCTUs2Z0FTcGREWkNRRWpONnRSN3NQY1BT?=
 =?utf-8?B?VXhhQTZlZEMwTTBray9pTmFUcUxQNUpoSlN6VnBzb05Jb1hxdGxTTHA4Rmlp?=
 =?utf-8?B?VURRS1NZK1h5bW9rNVVWTmg0SUNIOTRzNzdzU1BrNDBQdVB0M0h6K25YSVdr?=
 =?utf-8?B?ZWtuZ1pNbFh1QzJ0bk1EVEliU1JCeWRyQ09Yc1hiT3ZwRkI0Z0owK2xCWFQ1?=
 =?utf-8?B?MjlJMzYxcnJoUWNmU0RFSElPazlkR0xxZlAySmphWm0wK2hDK2NwZDNrUFFO?=
 =?utf-8?B?Y1JybDlTSXJGeFVxQ2tVc1hNSUZOZHc5Qk5aVWFPZDNkcVhDVlJwVzdxUy9u?=
 =?utf-8?B?Ujd3eCtuWXp5RHRXM1ExNHJ4aDVnYkQ2MUlyaGxqYXFaU1JqdXBXVWYyZDVZ?=
 =?utf-8?B?RXh2UlVDaHZmOHlIS3hCT0RzS2RxWUxxdm5uVkF4eWY2SWxCaEtoeldCUEZw?=
 =?utf-8?B?dnJkVzhCV2p6TUllY24vWFVOMUJ3YXJrWEhYd1BIOEdjbytBL2xKUmlZOURW?=
 =?utf-8?B?bEdmZS9IeldFTGxiWVJPR0F1Q3Y0UWV4MlpjQXNUZk5BSklEN0hXU05naVFo?=
 =?utf-8?B?TU11WTUzTWhqUm5XeTJrS1R6eUhCVnFLMGVsdCttSW1FZjJGNCtFT2VkeHRI?=
 =?utf-8?B?dGVPc0Q5NHU3ZVVyN0ZZb0ZzMWNab0xuaFp3RUtMYVdLS0pFaS9XMy9wRFBJ?=
 =?utf-8?B?MG9HZmxLa3gxb1phK3BkclJnNURabFhzY3p4VW1NUkZZMG8rL000VDUwclpk?=
 =?utf-8?B?QkJYdUJMSEZlcnQ2MDZaNjJLemN3SFBCWWFZYjhWeWUwWDJNR0NmUHdEZTZp?=
 =?utf-8?B?MGNVejJZbk90ekozNmpyYkN0U1h3cDNBZXRRSEgxeHhlS2pzNGRDWTEyOU5Z?=
 =?utf-8?B?eGc3SDRDbHZTVjdCY1YrcmpDU1BobG1LNkFNU0xiRFhFNEJ0Qk1VTjNyNU13?=
 =?utf-8?B?Wk1JUWJ3czZoZjYrVG1ONVhLZjByWlVXVEQvNWEyWElYZm1rOTJFYzI1NzN3?=
 =?utf-8?B?TDR0dTVDYXNUdUxmRURrM09scVl5eVpRWEpCZlBJUW5MREpkNXNwUFBiS3p4?=
 =?utf-8?B?bjEyVmxsOXV3WkNZWTNXYkpYZkViV2dqQ2xEeWdzMEY3N0ZwV2d2YVV5OHQ0?=
 =?utf-8?B?MnM0N05QbFNrZS9iUzBZRGZoSzk2anM3MmxsWWVTZS9DRlVaTkhoMS96RkZR?=
 =?utf-8?B?VlE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a98eebca-faab-494a-347c-08dd14a9e097
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 21:23:20.8478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vNzlbrI3PFD2SceFM2fL7dwy/cn0xe9z3uvDhfKCP8UIqkWNqZNj3EL9TZGP9ifcU8z1fUZnedXUCoE5V5jqRI2Xz2cEu/Ss8GG1l1pg+O4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7680
X-Proofpoint-ORIG-GUID: 3EBlF5Pp-TTPz7Bo603jKcS3o84NUSb7
X-Authority-Analysis: v=2.4 cv=bqq2BFai c=1 sm=1 tr=0 ts=6750c84e cx=c_pps a=2bhcDDF4uZIgm5IDeBgkqw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=2HyfR_PSAAAA:8
 a=NEAV23lmAAAA:8 a=w2PP7KgtAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=gJ9eChrh3aqeKNfEiVYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pGLkceISAAAA:8 a=PwNoGsqUTTabP48WBxUA:9 a=494bwCcBZ9kDMOEK:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=0zSPmqmPh2d1CTP8umvz:22
 a=CDB6uwv3NW-08_pL9N3q:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: GWaRm5Zzd-U3tuiNBP3Jv_70LyMFERIu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-04_18,2024-12-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 mlxscore=0 bulkscore=0 spamscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2411120000
 definitions=main-2412040165
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 21:23:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208361

--------------HPwkRKuJmT4eF4bUK0spDQuU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4B4LJREh000574

On 2024-12-04 3:49 p.m., Steve Sakoman wrote:
> Sigh, I'm sorry I didn't catch this :-(
>
> I think my eyes saw ruby "upgrade 3.3.2 -> 3.3.5", I checked the link
> in the commit message to verify that the changes were all bug/security
> fixes and I merged it.
>
> We've already done a release with this update in it.  Perhaps we can
> discuss it in the bug meeting tomorrow?
>
> Steve

Yogita,

Please note, that only PATCH level updates are allowed (almost all the=20
time) on stable releases.
See: https://semver.org/


All,

Yikes!

Yes, we should discuss what to do in the bug meeting tomorrow and reply=20
here to fill people in on the plans. If anyone has a strong opinion=20
please let us know.


I didn't even notice that the change was from 3.2.x to 3.3.y when=20
reviewing it.
It seems that I assumed that no one would do that!
We're all so used to the rule of not changing MAJOR.MINOR that several=20
people overlooked
that MINOR was bumped by one.

For the 3.2.2..3.2.5 update, we have:
=E2=9D=AF git log v3_2_2..v3_2_5 --oneline=C2=A0 | wc -l
242


We could even take 3.2.6:

=E2=9D=AF git log v3_2_5..v3_2_6 --oneline | rg -v "merge revision"=C2=A0=
 | wc -l
20

https://github.com/ruby/ruby/commits/ruby_3_2/

It might be worth having a version comparison check tool to run before=20
release.

Thanks,

../Randy

> On Wed, Dec 4, 2024 at 11:51=E2=80=AFAM Randy MacLeod via
> lists.openembedded.org
> <randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
>> Add Robert and Hongxu who working with Yogita on this, iirc.
>>
>> On 2024-12-03 5:14 a.m., Urade, Yogita via lists.openembedded.org wrot=
e:
>>
>> From: Yogita Urade<yogita.urade@windriver.com>
>>
>> This reverts commit 0402f54b66438ec6e9f06f02652e148dce6480b3.
>>
>> This isn't a minor version upgrade.
>> $git log v3_2_2..v3_3_5 --oneline  | wc -l
>> 6924
>>
>> Do we have any ruby experts to comment on the stability of the 4.2 bra=
nch
>> and the update to 3.2.5?
>>
>> They claim to be following a semantic versioning scheme:
>>    https://www.ruby-lang.org/en/news/2013/12/21/ruby-version-policy-ch=
anges-with-2-1-0/
>>
>>
>> Ruby is a fairly large code base:
>> ----------------------------------------------------------------------=
----------
>>   Language             Files        Lines        Blank      Comment   =
      Code
>> ----------------------------------------------------------------------=
----------
>>   Ruby                  7914      1480730       202190        82299   =
   1196241
>> ...
>> ----------------------------------------------------------------------=
----------
>>   Total                 9409      2188531       271762       197233   =
   1719536
>> ----------------------------------------------------------------------=
----------
>>
>> The git repo does have a branch for each release which would indicate
>> that they are at least familiar with the idea of stable releases.
>>
>> Other than the number of commits being large, do we have
>> any data to support the idea that this is not a stable release update?
>>
>> Yogita,
>>    What are the before, after and diff ptest results?
>>
>> ../Randy
>>
>>
>>
>>
>> Signed-off-by: Yogita Urade<yogita.urade@windriver.com>
>> ---
>>   ...Alignof-to-define-ALIGN_OF-when-poss.patch | 51 ++++++++++
>>   ...e.in-do-not-write-host-cross-cc-item.patch | 32 +++++++
>>   ...Obey-LDFLAGS-for-the-link-of-libruby.patch | 25 +++++
>>   ...-Makefile.in-filter-out-f-prefix-map.patch | 42 ++++++++
>>   ...eproducible-change-fixing-784225-too.patch | 26 ++---
>>   .../0006-Make-gemspecs-reproducible.patch     | 18 ++--
>>   .../ruby/ruby/CVE-2023-36617_1.patch          | 55 +++++++++++
>>   .../ruby/ruby/CVE-2023-36617_2.patch          | 51 ++++++++++
>>   .../ruby/ruby/CVE-2024-27281.patch            | 96 +++++++++++++++++=
++
>>   .../ruby/ruby/CVE-2024-27282.patch            | 27 ++++++
>>   .../ruby/ruby/remove_has_include_macros.patch | 35 +++++++
>>   .../ruby/{ruby_3.3.5.bb =3D> ruby_3.2.2.bb}     | 13 ++-
>>   12 files changed, 446 insertions(+), 25 deletions(-)
>>   create mode 100644 meta/recipes-devtools/ruby/ruby/0001-fiddle-Use-C=
11-_Alignof-to-define-ALIGN_OF-when-poss.patch
>>   create mode 100644 meta/recipes-devtools/ruby/ruby/0001-template-Mak=
efile.in-do-not-write-host-cross-cc-item.patch
>>   create mode 100644 meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS=
-for-the-link-of-libruby.patch
>>   create mode 100644 meta/recipes-devtools/ruby/ruby/0002-template-Mak=
efile.in-filter-out-f-prefix-map.patch
>>   create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2023-36617_1.=
patch
>>   create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2023-36617_2.=
patch
>>   create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-27281.pa=
tch
>>   create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-27282.pa=
tch
>>   create mode 100644 meta/recipes-devtools/ruby/ruby/remove_has_includ=
e_macros.patch
>>   rename meta/recipes-devtools/ruby/{ruby_3.3.5.bb =3D> ruby_3.2.2.bb}=
 (88%)
 >< snip >< snip ><


--=20
# Randy MacLeod
# Wind River Linux

--------------HPwkRKuJmT4eF4bUK0spDQuU
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4B4LJREh000574

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2024-12-04 3:49 p.m., Steve Sakoman
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAOSpxdbWAHY7H9QKsfP8xCLaeq_R1f=
9zhy7MsuO0T6h7PhBsPA@mail.gmail.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">Sigh, I'm sorry I didn't cat=
ch this :-(

I think my eyes saw ruby &quot;upgrade 3.3.2 -&gt; 3.3.5&quot;, I checked=
 the link
in the commit message to verify that the changes were all bug/security
fixes and I merged it.

We've already done a release with this update in it.  Perhaps we can
discuss it in the bug meeting tomorrow?

Steve</pre>
    </blockquote>
    <p>Yogita, <br>
    </p>
    <p>
      Please note, that only PATCH level updates are allowed (almost all
      the time) on stable releases.<br>
      See: <a class=3D"moz-txt-link-freetext" href=3D"https://semver.org/=
">https://semver.org/</a></p>
    <p><br>
    </p>
    <p>All,<br>
    </p>
    <p>Yikes!</p>
    <p>Yes, we should discuss what to do <span style=3D"white-space: pre-=
wrap">in the bug meeting tomorrow and
reply here to fill people in on the plans. If anyone has a strong opinion=
 please
let us know.</span></p>
    <p><span style=3D"white-space: pre-wrap"></span><br>
      I didn't even notice that the change was from 3.2.x to 3.3.y when
      reviewing it.<br>
      It seems that I assumed that no one would do that! <br>
      We're all so used to the rule of not changing MAJOR.MINOR that
      several people overlooked<br>
      that MINOR was bumped by one. <br>
    </p>
    <p>For the 3.2.2..3.2.5 update, we have:<br>
      =E2=9D=AF git log v3_2_2..v3_2_5 --oneline&nbsp; | wc -l<br>
      242</p>
    <br>
    <p>We could even take 3.2.6:<br>
    </p>
    <p>=E2=9D=AF git log v3_2_5..v3_2_6 --oneline | rg -v &quot;merge rev=
ision&quot;&nbsp; | wc
      -l<br>
      20</p>
    <p><span style=3D"white-space: pre-wrap"><a class=3D"moz-txt-link-fre=
etext" href=3D"https://github.com/ruby/ruby/commits/ruby_3_2/">https://gi=
thub.com/ruby/ruby/commits/ruby_3_2/</a></span></p>
    <p><span style=3D"white-space: pre-wrap">
</span></p>
    <p><span style=3D"white-space: pre-wrap">It might be worth having a v=
ersion comparison check tool to run before release.</span></p>
    <p><span style=3D"white-space: pre-wrap">Thanks,
</span></p>
    <p><span style=3D"white-space: pre-wrap">../Randy</span></p>
    <p><span style=3D"white-space: pre-wrap">
</span></p>
    <p><span style=3D"white-space: pre-wrap">
</span></p>
    <blockquote type=3D"cite" cite=3D"mid:CAOSpxdbWAHY7H9QKsfP8xCLaeq_R1f=
9zhy7MsuO0T6h7PhBsPA@mail.gmail.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">On Wed, Dec 4, 2024 at 11:51=
=E2=80=AFAM Randy MacLeod via
lists.openembedded.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:randy.macleod=3Dwindriv=
er.com@lists.openembedded.org">&lt;randy.macleod=3Dwindriver.com@lists.op=
enembedded.org&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">Add Robert and Hongxu who =
working with Yogita on this, iirc.

On 2024-12-03 5:14 a.m., Urade, Yogita via lists.openembedded.org wrote:

From: Yogita Urade <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:yogi=
ta.urade@windriver.com">&lt;yogita.urade@windriver.com&gt;</a>

This reverts commit 0402f54b66438ec6e9f06f02652e148dce6480b3.

This isn't a minor version upgrade.
$git log v3_2_2..v3_3_5 --oneline  | wc -l
6924

Do we have any ruby experts to comment on the stability of the 4.2 branch
and the update to 3.2.5?

They claim to be following a semantic versioning scheme:
  <a class=3D"moz-txt-link-freetext" href=3D"https://www.ruby-lang.org/en=
/news/2013/12/21/ruby-version-policy-changes-with-2-1-0/">https://www.rub=
y-lang.org/en/news/2013/12/21/ruby-version-policy-changes-with-2-1-0/</a>


Ruby is a fairly large code base:
-------------------------------------------------------------------------=
-------
 Language             Files        Lines        Blank      Comment       =
  Code
-------------------------------------------------------------------------=
-------
 Ruby                  7914      1480730       202190        82299      1=
196241
...
-------------------------------------------------------------------------=
-------
 Total                 9409      2188531       271762       197233      1=
719536
-------------------------------------------------------------------------=
-------

The git repo does have a branch for each release which would indicate
that they are at least familiar with the idea of stable releases.

Other than the number of commits being large, do we have
any data to support the idea that this is not a stable release update?

Yogita,
  What are the before, after and diff ptest results?

../Randy




Signed-off-by: Yogita Urade <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:yogita.urade@windriver.com">&lt;yogita.urade@windriver.com&gt;</a>
---
 ...Alignof-to-define-ALIGN_OF-when-poss.patch | 51 ++++++++++
 ...e.in-do-not-write-host-cross-cc-item.patch | 32 +++++++
 ...Obey-LDFLAGS-for-the-link-of-libruby.patch | 25 +++++
 ...-Makefile.in-filter-out-f-prefix-map.patch | 42 ++++++++
 ...eproducible-change-fixing-784225-too.patch | 26 ++---
 .../0006-Make-gemspecs-reproducible.patch     | 18 ++--
 .../ruby/ruby/CVE-2023-36617_1.patch          | 55 +++++++++++
 .../ruby/ruby/CVE-2023-36617_2.patch          | 51 ++++++++++
 .../ruby/ruby/CVE-2024-27281.patch            | 96 +++++++++++++++++++
 .../ruby/ruby/CVE-2024-27282.patch            | 27 ++++++
 .../ruby/ruby/remove_has_include_macros.patch | 35 +++++++
 .../ruby/{ruby_3.3.5.bb =3D&gt; ruby_3.2.2.bb}     | 13 ++-
 12 files changed, 446 insertions(+), 25 deletions(-)
 create mode 100644 meta/recipes-devtools/ruby/ruby/0001-fiddle-Use-C11-_=
Alignof-to-define-ALIGN_OF-when-poss.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/0001-template-Makefil=
e.in-do-not-write-host-cross-cc-item.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for=
-the-link-of-libruby.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/0002-template-Makefil=
e.in-filter-out-f-prefix-map.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2023-36617_1.patc=
h
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2023-36617_2.patc=
h
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-27281.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-27282.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/remove_has_include_ma=
cros.patch
 rename meta/recipes-devtools/ruby/{ruby_3.3.5.bb =3D&gt; ruby_3.2.2.bb} =
(88%)
</pre>
      </blockquote>
    </blockquote>
    &gt;&lt; snip &gt;&lt; snip &gt;&lt;<br>
    <blockquote type=3D"cite" cite=3D"mid:CAOSpxdbWAHY7H9QKsfP8xCLaeq_R1f=
9zhy7MsuO0T6h7PhBsPA@mail.gmail.com">
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">
</pre>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------HPwkRKuJmT4eF4bUK0spDQuU--

