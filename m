Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AB99C28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 20:57:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.377.1743195422662533687
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 13:57:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6182d079f8=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52SG1KFa031884
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 20:57:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45hje1qqnk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 20:57:01 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52SKv0HR012273
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 20:57:00 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45hje1qqnh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Mar 2025 20:57:00 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=twrqNu32n740KPOG6xVGmoln0sDCgYHsJpGG27mLfMeJVspRbDyM1aRPL4ibnGOJM0KEQr/0905luM3tZsK7Fo/ThXkYpXjKXBqiWEj3Ctbjb7vTiuaB8+Z2zNZAf7vsUsF85x5cc5MTW/u6IeHrDC23U6owyTEtce0CE2DcuLqkcS0LW/8p4umJRWTCf9dCxXqjwb6M0PH0UfHN1NmNYEktEwtt9Rc/y3RT4fiX3MEIXTXy2CLs5cw7y/KRzfLq1iWKzrwTX+PfZsZmUUnFSh5s4RTihT2457ZuhM7xxtrU4g9cs2hon1kLpTuPqQfTy8IgQPnBKeW3zmkRHqNugQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2wY332NEChWpwGjjh2hKpzunqe1z7qKmt0wkndUul70=;
 b=HCDXINjKR54SNwUvlVDxxsC20quIAtiySwg0tO8L/y/ckHS7EqcdpMgR6zOJQ3hGJLGIkiZF7EVXi4qqjXJ2RXhVOLbNUji3NVIgEBuDF0PY/Yt40DtPwqNljxt9djIbQBZj3hPu79svIqrd1ajd6tgUDF6cXA1P+mB9L9RNH2v/q3clnAkWFkaC0MheOB94kEpdcyoIMD+G3nDsfPjUgFiwI/XHaUlGI8vhbgXx/ivoi7/rvCbRMMl+ygyvKZtRACfU86YLcYoXT3C3pzzb8jq/94yh+VqAMAogpJEoEq+D1KgjHIe4H4uLtnTGF3opEGiT/80vLznhLcswMEDD4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by SA0PR11MB4605.namprd11.prod.outlook.com (2603:10b6:806:95::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 20:56:56 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%7]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 20:56:56 +0000
Content-Type: multipart/alternative;
 boundary="------------0db7x1ReK4IGbdBO4kmj7xY4"
Message-ID: <e961e1bc-bfd6-49b0-82dc-c00ac879ad76@windriver.com>
Date: Fri, 28 Mar 2025 16:56:54 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] rust: Upgrade 1.84.1->1.85.0
To: Yash.Shinde@windriver.com, openembedded-core@lists.openembedded.org,
        Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Cc: Sundeep.Kokkonda@windriver.com,
        Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20250328143005.880998-1-Yash.Shinde@windriver.com>
 <20250328143005.880998-2-Yash.Shinde@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20250328143005.880998-2-Yash.Shinde@windriver.com>
X-ClientProxiedBy: DM6PR03CA0091.namprd03.prod.outlook.com
 (2603:10b6:5:333::24) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|SA0PR11MB4605:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bb77faa-a6aa-4e94-1b92-08dd6e3b12f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|4076899003|8096899003|4013099003|4053099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OXlJbDJ5MHFzbWRjSmEwQngxK0R3T0RSdzRudVFqL0JyYnlreHIyVWY3WnU0?=
 =?utf-8?B?QXV0bW5uOWhILytkV1hVQlltL2hWTXU0VmZYNUlWVDhqcHlaY0svNDk0bjdD?=
 =?utf-8?B?bmJsQmJYbHdBN3VzNnFrNlpEZHVMd0tkNHV3MHF4dTNiTzI1SlE2UWl0NXJF?=
 =?utf-8?B?MTJSSWU1T3FLYnZwWTBaNmxiRSsyVklUUWY2bXVuUWRHR3IwRmFDdGlrNVh4?=
 =?utf-8?B?YlpFR2dWWEtrZ2lDT0MrM0lxeGkwVjNxY2tubTB0dW5BS3ZOYnlycGJCOE1m?=
 =?utf-8?B?dUJEUG15OWl0QnpRNkovL1BKcU1jRWMwd1hDdjErUmVPQk5lYWtRZHBDTGIv?=
 =?utf-8?B?S1VjMWpaeFJtSEtFay9hbkx5SzRmdUJtMUpnWWtvQzBrcEVsY25ZZHdQMmly?=
 =?utf-8?B?cVVEKzBSck0wMjdXbDF1cVpEL3JHRS9ESXUrNHprKzJNazJFT0xzamo3U205?=
 =?utf-8?B?bFFGeGd0QTkxVVdDZTBQWTAzV0VDb2YxcElFbzBxZHh2REF0ZlZMcHZManFJ?=
 =?utf-8?B?R1BBVGwwTU10RkpzYTVRZ2R5Q1pUUWZ2cHZPQzZUSjJISzduaDRuY0wrR2tI?=
 =?utf-8?B?YlZZSG4wZFJCc2ptYzFGNis0R1o5MklFcUZGYlRUcmpuMUVER1RNVFBobHBW?=
 =?utf-8?B?U1BHc0NPZzI1djBkR0NMVENDMitQWkVkNFdXb2lQWStLTDBqTXZMbXROdUdn?=
 =?utf-8?B?T3pvUGtxd0hVakZ6dHlHNG1hWG9lblhkVUwyeElsMjg3cGJGa3BtNWxVS3hh?=
 =?utf-8?B?Q3RFVkpwQXdHOGtqSllTZ3VUN1VzRU5TWWVtRHVRcWpjNmJzYmFDM1RIU0RD?=
 =?utf-8?B?OURFZit5MU56eHRrQTBIUmxaQ0VQL3FsL3lyQWZyNkZjbW4zdTJpeEVDMzJs?=
 =?utf-8?B?L1R4L2ZiZ0xseS9KL3FKNG1tcmxSMjkwMjNCMGViamQ5QThGNnpnRUZ4UHdY?=
 =?utf-8?B?eUdHYWdhdVBDWG1qc00yZW1KdzU1UnNoOXNNaldDMTF4aEZlTU9yeGxCbG9M?=
 =?utf-8?B?TlRSbENETUxRVEh1V0FSbi84ZHhXZ0lGdnJ0YmJTSFFCR2tnbnVvc2F1YnVk?=
 =?utf-8?B?YlpZYnZrZytDenJNbFJFODdLZ1lidmZlRmdYZGdsSTlyUitHa1ZPeGRVUGt4?=
 =?utf-8?B?ZVdmWnhJTnBvdHp1QzYwQXBuLzgrYTlaSkFFcW9EcHE0UnZhTmllTmRGakRx?=
 =?utf-8?B?Y3kvY251MXJvSW1sWWRZc2pIWnkvUXI2U3Y1U0w5RzZDOWpDRnNQMWVmMGtE?=
 =?utf-8?B?UFpzam9HYTFrK0p3ZzF4OWNDUFpkSFArbkJhVUVBUWw5eGFaYWFqelpFSGlt?=
 =?utf-8?B?ZGRNOEZhZmdKWHVMSU5HUFRyU0N4UkZ2TWtrY1R4NzlDS1hOZXFXWFBxK2xF?=
 =?utf-8?B?TGpZNzBkVmpGZVRiQzIvV0JxS1VPQlJnNFZudWk5WWwwTTBFLzRkQUNkQUpy?=
 =?utf-8?B?ZFJKdGdrZjBvWW9pZmhFUGFyeHNGN1Q0ZTZKKzgxNkV5RTBnVjUvNkROT2Zn?=
 =?utf-8?B?eGEyTlV5dW1SZ3NadmdzL0NJWTdvZlk1Vk9ObjRyRTJVV1R2OWRTQjJmd3ZH?=
 =?utf-8?B?SGp0c0dLRVM0bURKaGVKWWRhTEV5cWxCb1hTcUoyQVJyTld0VThmaDdxNHhL?=
 =?utf-8?B?UkFzcXVxNVFIV0wwckkxZkVVM1NLOFlWMjFUZ0lLZEtrd3FJOE4zZnplWmJE?=
 =?utf-8?B?ZmFsZW1lN3RHVUxXMG1xS0NpVkFhb21rQ21QMDBwMGhoQjNRTVo4YjV3M1Ro?=
 =?utf-8?B?ZGpOUVZPUUpyRXJWcFhCRmQzdUswZFFSSGE0ejNoWnZwQTU2MTY2TXJDNC9T?=
 =?utf-8?B?UXpmZjBHM3JlR1JWYmlSdz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(4076899003)(8096899003)(4013099003)(4053099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VjZHZEx5YUVMeHNOdExCdkxiaWNnVkM5TFlDcStlUTdHYVJ4cmZ0cmhxZDk5?=
 =?utf-8?B?K1JEZHd0cktXS0RSVktpRDRvRjY0TkZVQmZrNlhRNEVoa3krcUNQQU4vS2Fu?=
 =?utf-8?B?Z3FpanJrSGM1TGVaOGdJcm9Wem94N2xGa3hlSmtiUkdzUjVwOFpSR0N6MWNR?=
 =?utf-8?B?L0oxVjFIOWZGbjZJSm1uRnhyaXZKM2xwOGwvcDR5eG95L2FXcU13dzFyM2sz?=
 =?utf-8?B?cFBmd1g1c3RRMFJhbFpoSGx1SjcxTHNMUmdYNCtxWEhOUlFHbjc1S0NNWCti?=
 =?utf-8?B?NUNVK3JzV0FPb0NTOE4rb244a0FrOXZiOXdBNU14allnbUtYMXNIeW1UakdT?=
 =?utf-8?B?WkRuYllaaUpWZUxVeFdIRy9FR3NBNWJ3RWhEcW9VNHY0Rk5hRHprbTFDNEM1?=
 =?utf-8?B?YmVZalRNb3dVTzRuRlVDK3Bja1BEQ2p5MS9QYkw1b3BydVBUbWk1WWsvL1ZZ?=
 =?utf-8?B?OVprTjIrWUR2ZFN2bmRnb29sRnZIMTVmK3N0SGZWTkFzclJkYlhmL1lCZ1Vx?=
 =?utf-8?B?UDh2NXlUNks4UVdTNnRMV1NWTUY1T0daOTVyOTlTa3p2SE1KY0hUMjNlRFY0?=
 =?utf-8?B?MDJDbC81VTdTK3VUMUxKd05PZHpFaDViTVNMMmtXYnY2emFDR1ZTQVJ1aUNF?=
 =?utf-8?B?VmQxS2o3Q0QwZlJXa1d5WWkyUC9MVXVReml2NWlpS0gvM0xGUDZoK3g1Wmpm?=
 =?utf-8?B?L1BQb1NMUGJSUlNaSUR0bkhmK2tZTmE3bXVIMUJhL3VINXU3L3RqeHdJNjVt?=
 =?utf-8?B?aE14TnFVeEZ0clJNc1o1QzlET3Q0cmhreXBaUWd0ajJ5cGlVblV0UHhVSEZU?=
 =?utf-8?B?WXhQUFlOTjcrdjVSR0t3dVBTd1R5ODdWU3c1aDUxU2x0bFVuOThxaXlMVjFn?=
 =?utf-8?B?Ym9MUkpsbmUva0o4WGkwckRJcEI0eFF1YXZVMUpPSUVSSjBRdXhiQ0NUTFll?=
 =?utf-8?B?bGFraytpak1VNEVPQ3FuRkxHZnJIaHJHWmtFODFiZ2l1UHhKNHNpeWV3c2pu?=
 =?utf-8?B?aEpEdHFoTFoySlp4Vnl5cVJxN25Wc01zdzhwQ1dRRkJiNjlKcFZ3UVNoNHo5?=
 =?utf-8?B?L3YvQ0prZTFYa1V0anFLTktOL1V3bmZBbzR0T2kwNkwrSnRyZU9sZzFaVFpJ?=
 =?utf-8?B?UnhSTG9yMTFMSUphOURJNTdIdmt6WFNnbVY5UjFBb3crckp3MTNkOU9NQkph?=
 =?utf-8?B?WDN1L0NlK2t0dXRKeWlxekVtWnlmL1E0S1ZVak1memJOc3V3alBXV3dpYm5z?=
 =?utf-8?B?a1ZudXovdXVqVlpHWjZ0MUx4UGdOaHV3clpwNmo5L3lzRzFNTzIwUXFiaUx1?=
 =?utf-8?B?VURpaCtBZUFwMFlCNmtaa1pzQ0ZtcG1wSFE2YjBuRCsyU0ZUMXk0VzQ3b0hk?=
 =?utf-8?B?NkpCczJ5aHVTek5vVnRDdHIyUXM3VllGWldhK1JCOS9KNDd3citXclhCNE5t?=
 =?utf-8?B?YXVGaTltMkh4ZzdJZmpBNXVzbUovTCtteGh0QmNDMi8xYnlWZmFlb0JkSnNi?=
 =?utf-8?B?cEZTd1VJRmVoSk1WS0hhTnphc2hYcnNlSG9HVXFsWHJ6N2J2Q21MRktuemtC?=
 =?utf-8?B?Y25BQ3VRSE9sUG1OZnZPazZsYWNxbkF5WDZXSExFRWV2ZklEUnVHcXdXdUdm?=
 =?utf-8?B?dmh2UjE0QnNsTlNUVEUxaWpUWTJQWVd6UjE3RVRwakxVREQ1aitvUzhkRXNB?=
 =?utf-8?B?aGFIZGxjUWJCbTArM3VhY1VyUEZKZ0FaUk9MNDNYYU45VldxRlJVRXFYQ3dp?=
 =?utf-8?B?ZDJkYnlGSEhTY0h3VXlEU3JxKzFHWnpOYlJFbFB2blFCMTZJekxDY1NHTUFZ?=
 =?utf-8?B?U21OdHYxUG9adXloK0FYOThIOU1RalJJdEZNeTQ5RlE4MHRJcVF2dTdaZTFG?=
 =?utf-8?B?S2o1Wkt4NEgzVGRlSjM3aDg2NHVjTUdtT0xBQ1lSOUZHL3NLa0MrQUUwRUIr?=
 =?utf-8?B?bEJvV200ZlNGYk1uRElURk1TREpxbHdidTE5bWRIcEZHTHZHcVlFdjlTWlhL?=
 =?utf-8?B?L1lWcWtGTmtKd3h5YW9VK2ZsS3lqL0swb2NQYkp4YUJ5VExuYThZNlFxbjN1?=
 =?utf-8?B?cFIwci8xQ0Y4V29Ldjc1dWZLQVN3R29JeG9iMmU4NUJzZTV2SzdIcFVHaFBD?=
 =?utf-8?B?R0JLcEw1dmpWS3Y1ZHR2WVIwaWRSM2FXTUZXYzJIT3Z5UGJKaEhyYlkrY0dv?=
 =?utf-8?B?enc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bb77faa-a6aa-4e94-1b92-08dd6e3b12f9
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 20:56:55.9542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: erPuliFenG1NE6K9xMzDFEBSbO0hxH5kABNRFNAuucO6fT4uAq/sKa2VGlpHwPT7FDBQ65FkJSqHYVgKMDG/oZM03AkIuol4yxL1TZ9W5mw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4605
X-Authority-Analysis: v=2.4 cv=KPVaDEFo c=1 sm=1 tr=0 ts=67e70d1d cx=c_pps a=ztkV8ooph0rfw1Th5QLTnw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=ei4SEBeUAAAA:8 a=NEAV23lmAAAA:8 a=1NWNoF9oAAAA:8 a=t7CeM3EgAAAA:8 a=ag1SF4gXAAAA:8 a=IGMbTGpjoapdTAOZDfkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dI7qjkOEfi4A:10 a=b2R5CYIeGhkA:10 a=ZX5EaQzt-HjJZZ9PUAsA:9 a=1Urd6b88T8X4w14K:21
 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=gWQGXMuO6U4LzzpkxkkA:9 a=HXjIzolwW10A:10 a=T6a71-JsGAwA:10 a=WMqJJ4WO7ae52AYww0QA:9 a=8zIOOLb7Ym0NljyPXbuS:22 a=97APRTa-CG6DvPMFVxHL:22 a=FdTzh2GWekK77mhwV6Dw:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-GUID: tzLrRcfHgn-Ilu3RFh1SAxdie16Ox_j7
X-Proofpoint-ORIG-GUID: uklNc4lTw_I7wHH6zUNg1zN2JVUnSPrh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_10,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 adultscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503280140
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 20:57:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213872

--------------0db7x1ReK4IGbdBO4kmj7xY4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 52SG1KFa031884

On 2025-03-28 10:30 a.m., Yash.Shinde@windriver.com wrote:
> From: Yash Shinde<Yash.Shinde@windriver.com>
>
> Rust stable version updated to 1.85.0
> https://blog.rust-lang.org/2025/02/20/Rust-1.85.0.html
>
> Some of the major updates:
>
> - Update LIC_FILES_CHKSUM in libstd-rs and rust recipes.
>
> - Pass '-Zforce-unstable-if-unmarked' to RUSTFLAGS in libstd-rs.bb
> Fix:https://github.com/rust-lang/rust/issues/133857#issuecomment-252634=
1227
>
> - Downgrade bootstrap cc version causing bootstrap to fail on custom ta=
rgets. (Backported from v1.85.1)
> Fix:https://github.com/rust-lang/rust/pull/137460/commits/e4ca11f87ffca=
8c63aa56d45b46e62b6acc58bd7
>
> - Explicitly set float ABI for all ARM 32 bits targets.
> Fix:https://github.com/rust-lang/rust/commit/a51fefcaab835b310e2e26005b=
50982d0049d905
>
> - Rust v1.85.0 tarball doesn't ship gcc tree. Drop the unpack:append() =
which removed it and prevented the bloat.
> Fix:https://github.com/rust-lang/rust/commit/13c3f9b9498013837782b46120=
085ea19ca75518
>
> Adapted the patch changes with v1.85.0:
>    repro-issue-fix-with-cc-crate-hashmap.patch
>    revert-link-std-statically-in-rustc_driver-feature.patch
>    rust-oe-selftest.patch
>    rv32-cargo-rustix-0.38.40-fix.patch
>
> Dropped patches:
>    fix-tidy-check-failure.patch since it's merged with v1.85.0.
>
> Signed-off-by: Yash Shinde<Yash.Shinde@windriver.com>
> ---
>   .../classes-recipe/rust-target-config.bbclass |   4 +
>   meta/conf/distro/include/tcmode-default.inc   |   2 +-
>   .../rust/{cargo_1.84.1.bb =3D> cargo_1.85.0.bb} |   0
>   .../rust/files/downgrade-bootstrap-cc.patch   |  41 +++
>   .../rust/files/fix-tidy-check-failure.patch   |  19 --
>   ...epro-issue-fix-with-cc-crate-hashmap.patch |  60 ++++-
>   ...d-statically-in-rustc_driver-feature.patch |   4 +-
>   .../rust/files/rust-oe-selftest.patch         |  46 ++--
>   .../files/rv32-cargo-rustix-0.38.38-fix.patch | 236 -----------------=
-
>   .../files/rv32-cargo-rustix-0.38.40-fix.patch | 236 +++++++++++++++++=
+
>   ...ibstd-rs_1.84.1.bb =3D> libstd-rs_1.85.0.bb} |   4 +-
>   ....84.1.bb =3D> rust-cross-canadian_1.85.0.bb} |   0
>   ...ust-llvm_1.84.1.bb =3D> rust-llvm_1.85.0.bb} |   0
>   meta/recipes-devtools/rust/rust-snapshot.inc  |  81 +++---
>   meta/recipes-devtools/rust/rust-source.inc    |  23 +-
>   .../rust/{rust_1.84.1.bb =3D> rust_1.85.0.bb}   |   0
>   16 files changed, 415 insertions(+), 341 deletions(-)
>   rename meta/recipes-devtools/rust/{cargo_1.84.1.bb =3D> cargo_1.85.0.=
bb} (100%)
>   create mode 100644 meta/recipes-devtools/rust/files/downgrade-bootstr=
ap-cc.patch
>   delete mode 100644 meta/recipes-devtools/rust/files/fix-tidy-check-fa=
ilure.patch
>   delete mode 100644 meta/recipes-devtools/rust/files/rv32-cargo-rustix=
-0.38.38-fix.patch
>   create mode 100644 meta/recipes-devtools/rust/files/rv32-cargo-rustix=
-0.38.40-fix.patch
>   rename meta/recipes-devtools/rust/{libstd-rs_1.84.1.bb =3D> libstd-rs=
_1.85.0.bb} (88%)
>   rename meta/recipes-devtools/rust/{rust-cross-canadian_1.84.1.bb =3D>=
 rust-cross-canadian_1.85.0.bb} (100%)
>   rename meta/recipes-devtools/rust/{rust-llvm_1.84.1.bb =3D> rust-llvm=
_1.85.0.bb} (100%)
>   rename meta/recipes-devtools/rust/{rust_1.84.1.bb =3D> rust_1.85.0.bb=
} (100%)
>
Others have pointed out a few problems, including a build failure.

...

>   RUST_DIST_SERVER =3D"https://static.rust-lang.org"
> +
>   RUST_STD_SNAPSHOT =3D "rust-std-${SNAPSHOT_VERSION}-${RUST_BUILD_ARCH=
}-unknown-linux-gnu"
>   RUSTC_SNAPSHOT =3D "rustc-${SNAPSHOT_VERSION}-${RUST_BUILD_ARCH}-unkn=
own-linux-gnu"
>   CARGO_SNAPSHOT =3D "cargo-${SNAPSHOT_VERSION}-${RUST_BUILD_ARCH}-unkn=
own-linux-gnu"
> diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-=
devtools/rust/rust-source.inc
> index 92bb5e4779..e07055882c 100644
> --- a/meta/recipes-devtools/rust/rust-source.inc
> +++ b/meta/recipes-devtools/rust/rust-source.inc
> @@ -1,30 +1,19 @@
>   RUST_VERSION ?=3D"${@d.getVar('PV').split('-')[0]}"
>  =20
>   SRC_URI +=3D"https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-=
src.tar.xz;name=3Drust=20
> \ - file://rv32-cargo-rustix-0.38.38-fix.patch;patchdir=3D${RUSTSRC} \ =
+=20
> file://rv32-cargo-rustix-0.38.40-fix.patch;patchdir=3D${RUSTSRC} \=20
> file://rust-oe-selftest.patch;patchdir=3D${RUSTSRC} \ -=20
> file://repro-issue-fix-with-cc-crate-hashmap.patch;patchdir=3D${RUSTSRC=
}=20
> \ +=20
> file://repro-issue-fix-with-cc-crate-hashmap.patch;patchdir=3D${RUSTSRC=
}=20
> \=20
> file://oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch;patch=
dir=3D${RUSTSRC}=20
> \=20
> file://0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch;=
patchdir=3D${RUSTSRC}=20
> \ -=20
> file://revert-link-std-statically-in-rustc_driver-feature.patch;patchdi=
r=3D${RUSTSRC}=20
> \ -=20
> file://Zdual-proc-macros-additional-check.patch;patchdir=3D${RUSTSRC} \=
=20
> - file://fix-tidy-check-failure.patch;patchdir=3D${RUSTSRC} \ +=20
> file://revert-link-std-statically-in-rustc_driver-feature.patch;patchdi=
r=3D${RUSTSRC}=20
> \ +=20
> file://Zdual-proc-macros-additional-check.patch;patchdir=3D${RUSTSRC} \=
=20
> + file://downgrade-bootstrap-cc.patch;patchdir=3D${RUSTSRC} \ "
> -SRC_URI[rust.sha256sum] =3D "e23ec747a06ffd3e94155046f40b6664ac152c9ee=
3c2adfd90353a7ccff24226"
> +SRC_URI[rust.sha256sum] =3D "d542c397217b5ba5bac7eb274f5ca62d031f61842=
c3ba4cc5328c709c38ea1e7"
>  =20
>   RUSTSRC =3D "${WORKDIR}/rustc-${RUST_VERSION}-src"
>  =20
> -#After updating to Rust 1.85 we can revert this removal of "src/gcc"
> -remove_gcc_directory() {
> -    # Ensure the gcc directory exists
> -    gcc_dir=3D"${S}/src/gcc"
> -    if [ -d "$gcc_dir" ]; then
> -        rm -rf "$gcc_dir"
> -    fi
> -}
> -# Add postfunc to the do_unpack task
> -do_unpack[postfuncs] +=3D "remove_gcc_directory"
> -


On IRC, Richard said:
 =C2=A0=C2=A0=C2=A0 I'm puzzled as the rust space fix didn't have the imp=
act on the=20
metrics I'd hoped for :/
 =C2=A0=C2=A0=C2=A0 I think there is something else going on. ...

Let's review.

Rust-1.83, is where the src/gcc bloat was added.
That was merged here:

 =C2=A0=C2=A0 commit 72e21bef1a6bcc8f05ad4e24cfef4228384f1c3a
 =C2=A0=C2=A0 Author:=C2=A0=C2=A0=C2=A0=C2=A0 Deepesh Varatharajan <Deepe=
sh.Varatharajan@windriver.com>
 =C2=A0=C2=A0 AuthorDate: Wed Mar 5 01:01:56 2025
 =C2=A0=C2=A0 Commit:=C2=A0=C2=A0=C2=A0=C2=A0 Richard Purdie <richard.pur=
die@linuxfoundation.org>
 =C2=A0=C2=A0 CommitDate: Wed Mar 5 16:26:54 2025

 =C2=A0=C2=A0 =C2=A0 =C2=A0 rust: Upgrade 1.82.0->1.83.0

The postfunc removal commit was here:

 =C2=A0=C2=A0 commit 2cb5d1accca23df67dd55d01416ea404ab92683b
 =C2=A0=C2=A0 Author:=C2=A0=C2=A0=C2=A0=C2=A0 Deepesh Varatharajan <Deepe=
sh.Varatharajan@windriver.com>
 =C2=A0=C2=A0 AuthorDate: Thu Mar 27 05:06:03 2025
 =C2=A0=C2=A0 Commit:=C2=A0=C2=A0=C2=A0=C2=A0 Richard Purdie <richard.pur=
die@linuxfoundation.org>
 =C2=A0=C2=A0 CommitDate: Thu Mar 27 09:41:58 2025

 =C2=A0 =C2=A0=C2=A0 =C2=A0 rust: Fix bloat issue in recent rust updates

so we should see a large tmpfs usage increase on March 5th and a=20
significant reduction on March 27th.

Look at the buildperf-alma8=C2=A0 (or buildperf-debian11) on March 27th:

https://valkyrie.yocto.io/pub/non-release/?type=3Dbuildperf-alma8&date=3D=
2025-03-27

There are 4 perf builds that day and build number: 20250327-93 includes=20
the bloat removal commit

which I found by opening each run, starting with the lowest run numbers=20
and clicking on the
"commit" in the "Current commit" column at the top of each page.

You can see that the FS usage did decrease but only by 785 MB. Maybe=20
that's the 1 GB for src/gcc
and some other packages are adding 215 MB.



If you look at the FS usage for
 =C2=A0=C2=A0 test1: Build core-image-sato

You can see the significant increase on March 5th of 103504 - 97857 =3D=20
5647 MB
that Richard pointed out week(s) ago:

There's another significant increase on March 7, and a decrease on March=20
11/12 which would be good to understand.


So, it's Friday afternoon and I'm not going to dig any more today.


Yash, Deepesh,

You did mentioned that you dropped=C2=A0 the rm -rf src/gcc in the commit=
 log but
in addition please do some work to check what the FS usage is for a=20
core-image-minimal build
at each stage probably initially bug checking out 1.82, 1.83, 1.84,=20
local commit 1.85. in poky's git repo.

Are you able to reproduce the initial ~5647 MB increase in 1.83 ?
What tmpdir size do you see once the:
 =C2=A0=C2=A0 rust: Fix bloat issue in recent rust updates
commit is added?


If things are confusing using the public poky repo and master branch=20
commits you could
start with poky with rust-1.82 and create a branch where you just add the
rust updates (and dependent commits as needed) to eliminate changes from
other parts of the system.


Please send an summary of findings email to this list each day as you=20
are testing and reviewing the data.

Thanks,

../Randy



>   UPSTREAM_CHECK_URI =3D"https://forge.rust-lang.org/infra/other-instal=
lation-methods.html"
>   UPSTREAM_CHECK_REGEX =3D "rustc-(?P<pver>\d+(\.\d+)+)-src"
>  =20
> diff --git a/meta/recipes-devtools/rust/rust_1.84.1.bb b/meta/recipes-d=
evtools/rust/rust_1.85.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/rust/rust_1.84.1.bb
> rename to meta/recipes-devtools/rust/rust_1.85.0.bb


--=20
# Randy MacLeod
# Wind River Linux

--------------0db7x1ReK4IGbdBO4kmj7xY4
Content-Type: multipart/related;
 boundary="------------N9CdUUGQr0Mj7r2exni1VNOa"

--------------N9CdUUGQr0Mj7r2exni1VNOa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2025-03-28 10:30 a.m.,
      <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:Yash.Shinde@wind=
river.com">Yash.Shinde@windriver.com</a> wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20250328143005.880998-2-Yash.Shin=
de@windriver.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">From: Yash Shinde <a class=3D"=
moz-txt-link-rfc2396E" href=3D"mailto:Yash.Shinde@windriver.com">&lt;Yash.S=
hinde@windriver.com&gt;</a>

Rust stable version updated to 1.85.0
<a class=3D"moz-txt-link-freetext" href=3D"https://blog.rust-lang.org/2025/=
02/20/Rust-1.85.0.html">https://blog.rust-lang.org/2025/02/20/Rust-1.85.0.h=
tml</a>

Some of the major updates:

- Update LIC_FILES_CHKSUM in libstd-rs and rust recipes.

- Pass '-Zforce-unstable-if-unmarked' to RUSTFLAGS in libstd-rs.bb
Fix: <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/rust-lan=
g/rust/issues/133857#issuecomment-2526341227">https://github.com/rust-lang/=
rust/issues/133857#issuecomment-2526341227</a>

- Downgrade bootstrap cc version causing bootstrap to fail on custom target=
s. (Backported from v1.85.1)
Fix: <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/rust-lan=
g/rust/pull/137460/commits/e4ca11f87ffca8c63aa56d45b46e62b6acc58bd7">https:=
//github.com/rust-lang/rust/pull/137460/commits/e4ca11f87ffca8c63aa56d45b46=
e62b6acc58bd7</a>

- Explicitly set float ABI for all ARM 32 bits targets.
Fix: <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/rust-lan=
g/rust/commit/a51fefcaab835b310e2e26005b50982d0049d905">https://github.com/=
rust-lang/rust/commit/a51fefcaab835b310e2e26005b50982d0049d905</a>

- Rust v1.85.0 tarball doesn't ship gcc tree. Drop the unpack:append() whic=
h removed it and prevented the bloat.
Fix: <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/rust-lan=
g/rust/commit/13c3f9b9498013837782b46120085ea19ca75518">https://github.com/=
rust-lang/rust/commit/13c3f9b9498013837782b46120085ea19ca75518</a>

Adapted the patch changes with v1.85.0:
  repro-issue-fix-with-cc-crate-hashmap.patch
  revert-link-std-statically-in-rustc_driver-feature.patch
  rust-oe-selftest.patch
  rv32-cargo-rustix-0.38.40-fix.patch

Dropped patches:
  fix-tidy-check-failure.patch since it's merged with v1.85.0.

Signed-off-by: Yash Shinde <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>
---
 .../classes-recipe/rust-target-config.bbclass |   4 +
 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 .../rust/{cargo_1.84.1.bb =3D&gt; cargo_1.85.0.bb} |   0
 .../rust/files/downgrade-bootstrap-cc.patch   |  41 +++
 .../rust/files/fix-tidy-check-failure.patch   |  19 --
 ...epro-issue-fix-with-cc-crate-hashmap.patch |  60 ++++-
 ...d-statically-in-rustc_driver-feature.patch |   4 +-
 .../rust/files/rust-oe-selftest.patch         |  46 ++--
 .../files/rv32-cargo-rustix-0.38.38-fix.patch | 236 ------------------
 .../files/rv32-cargo-rustix-0.38.40-fix.patch | 236 ++++++++++++++++++
 ...ibstd-rs_1.84.1.bb =3D&gt; libstd-rs_1.85.0.bb} |   4 +-
 ....84.1.bb =3D&gt; rust-cross-canadian_1.85.0.bb} |   0
 ...ust-llvm_1.84.1.bb =3D&gt; rust-llvm_1.85.0.bb} |   0
 meta/recipes-devtools/rust/rust-snapshot.inc  |  81 +++---
 meta/recipes-devtools/rust/rust-source.inc    |  23 +-
 .../rust/{rust_1.84.1.bb =3D&gt; rust_1.85.0.bb}   |   0
 16 files changed, 415 insertions(+), 341 deletions(-)
 rename meta/recipes-devtools/rust/{cargo_1.84.1.bb =3D&gt; cargo_1.85.0.bb=
} (100%)
 create mode 100644 meta/recipes-devtools/rust/files/downgrade-bootstrap-cc=
.patch
 delete mode 100644 meta/recipes-devtools/rust/files/fix-tidy-check-failure=
.patch
 delete mode 100644 meta/recipes-devtools/rust/files/rv32-cargo-rustix-0.38=
.38-fix.patch
 create mode 100644 meta/recipes-devtools/rust/files/rv32-cargo-rustix-0.38=
.40-fix.patch
 rename meta/recipes-devtools/rust/{libstd-rs_1.84.1.bb =3D&gt; libstd-rs_1=
.85.0.bb} (88%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.84.1.bb =3D&gt; r=
ust-cross-canadian_1.85.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-llvm_1.84.1.bb =3D&gt; rust-llvm_1=
.85.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.84.1.bb =3D&gt; rust_1.85.0.bb} =
(100%)

</pre>
    </blockquote>
    <p>Others have pointed out a few problems, including a build
      failure.<br>
    </p>
    <p>...<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:20250328143005.880998-2-Yash.Shin=
de@windriver.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">
 RUST_DIST_SERVER =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"https://st=
atic.rust-lang.org">&quot;https://static.rust-lang.org&quot;</a>
+
 RUST_STD_SNAPSHOT =3D &quot;rust-std-${SNAPSHOT_VERSION}-${RUST_BUILD_ARCH=
}-unknown-linux-gnu&quot;
 RUSTC_SNAPSHOT =3D &quot;rustc-${SNAPSHOT_VERSION}-${RUST_BUILD_ARCH}-unkn=
own-linux-gnu&quot;
 CARGO_SNAPSHOT =3D &quot;cargo-${SNAPSHOT_VERSION}-${RUST_BUILD_ARCH}-unkn=
own-linux-gnu&quot;
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devt=
ools/rust/rust-source.inc
index 92bb5e4779..e07055882c 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -1,30 +1,19 @@
 RUST_VERSION ?=3D <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:${@d.g=
etVar('PV').split('-')[0]}">&quot;${@d.getVar('PV').split('-')[0]}&quot;</a=
>
=20
 SRC_URI +=3D <a class=3D"moz-txt-link-rfc2396E" href=3D"https://static.rus=
t-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;name=3Drust\-file://rv32-c=
argo-rustix-0.38.38-fix.patch;patchdir=3D${RUSTSRC}\+file://rv32-cargo-rust=
ix-0.38.40-fix.patch;patchdir=3D${RUSTSRC}\file://rust-oe-selftest.patch;pa=
tchdir=3D${RUSTSRC}\-file://repro-issue-fix-with-cc-crate-hashmap.patch;pat=
chdir=3D${RUSTSRC}\+file://repro-issue-fix-with-cc-crate-hashmap.patch;patc=
hdir=3D${RUSTSRC}\file://oeqa-selftest-Increase-timeout-in-process-sigpipe-=
ru.patch;patchdir=3D${RUSTSRC}\file://0001-src-core-build_steps-tool.rs-swi=
tch-off-lto-for-rust.patch;patchdir=3D${RUSTSRC}\-file://revert-link-std-st=
atically-in-rustc_driver-feature.patch;patchdir=3D${RUSTSRC}\-file://Zdual-=
proc-macros-additional-check.patch;patchdir=3D${RUSTSRC}\-file://fix-tidy-c=
heck-failure.patch;patchdir=3D${RUSTSRC}\+file://revert-link-std-statically=
-in-rustc_driver-feature.patch;patchdir=3D${RUSTSRC}\+file://Zdual-proc-mac=
ros-additional-check.patch;patchdir=3D${RUSTSRC}\+file://downgrade-bootstra=
p-cc.patch;patchdir=3D${RUSTSRC}\">&quot;https://static.rust-lang.org/dist/=
rustc-${RUST_VERSION}-src.tar.xz;name=3Drust \
-            file://rv32-cargo-rustix-0.38.38-fix.patch;patchdir=3D${RUSTSR=
C} \
+            file://rv32-cargo-rustix-0.38.40-fix.patch;patchdir=3D${RUSTSR=
C} \
             file://rust-oe-selftest.patch;patchdir=3D${RUSTSRC} \
-	    file://repro-issue-fix-with-cc-crate-hashmap.patch;patchdir=3D${RUSTS=
RC} \
+            file://repro-issue-fix-with-cc-crate-hashmap.patch;patchdir=3D=
${RUSTSRC} \
             file://oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.pa=
tch;patchdir=3D${RUSTSRC} \
             file://0001-src-core-build_steps-tool.rs-switch-off-lto-for-ru=
st.patch;patchdir=3D${RUSTSRC} \
-	    file://revert-link-std-statically-in-rustc_driver-feature.patch;patch=
dir=3D${RUSTSRC} \
-	    file://Zdual-proc-macros-additional-check.patch;patchdir=3D${RUSTSRC}=
 \
-	    file://fix-tidy-check-failure.patch;patchdir=3D${RUSTSRC} \
+            file://revert-link-std-statically-in-rustc_driver-feature.patc=
h;patchdir=3D${RUSTSRC} \
+            file://Zdual-proc-macros-additional-check.patch;patchdir=3D${R=
USTSRC} \
+            file://downgrade-bootstrap-cc.patch;patchdir=3D${RUSTSRC} \
 &quot;</a>
-SRC_URI[rust.sha256sum] =3D &quot;e23ec747a06ffd3e94155046f40b6664ac152c9e=
e3c2adfd90353a7ccff24226&quot;
+SRC_URI[rust.sha256sum] =3D &quot;d542c397217b5ba5bac7eb274f5ca62d031f6184=
2c3ba4cc5328c709c38ea1e7&quot;
=20
 RUSTSRC =3D &quot;${WORKDIR}/rustc-${RUST_VERSION}-src&quot;
=20
-#After updating to Rust 1.85 we can revert this removal of &quot;src/gcc&q=
uot;
-remove_gcc_directory() {
-    # Ensure the gcc directory exists
-    gcc_dir=3D&quot;${S}/src/gcc&quot;
-    if [ -d &quot;$gcc_dir&quot; ]; then
-        rm -rf &quot;$gcc_dir&quot;
-    fi
-}
-# Add postfunc to the do_unpack task
-do_unpack[postfuncs] +=3D &quot;remove_gcc_directory&quot;
-</pre>
    </blockquote>
    <p><br>
      On IRC, Richard said:<br>
      &nbsp;&nbsp;&nbsp; I'm puzzled as the rust space fix didn't have the =
impact on
      the metrics I'd hoped for :/<br>
      &nbsp;&nbsp;&nbsp; I think there is something else going on. ...<br>
    </p>
    <p>Let's review.</p>
    <p>Rust-1.83, is where the src/gcc bloat was added.<br>
      That was merged here:<br>
      <br>
      &nbsp;&nbsp; commit 72e21bef1a6bcc8f05ad4e24cfef4228384f1c3a<br>
      &nbsp;&nbsp; Author:&nbsp;&nbsp;&nbsp;&nbsp; Deepesh Varatharajan
      <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:Deepesh.Varatharaja=
n@windriver.com">&lt;Deepesh.Varatharajan@windriver.com&gt;</a><br>
      &nbsp;&nbsp; AuthorDate: Wed Mar 5 01:01:56 2025<br>
      &nbsp;&nbsp; Commit:&nbsp;&nbsp;&nbsp;&nbsp; Richard Purdie
      <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:richard.purdie@linu=
xfoundation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a><br>
      &nbsp;&nbsp; CommitDate: Wed Mar 5 16:26:54 2025<br>
      <br>
      &nbsp;&nbsp; &nbsp; &nbsp; rust: Upgrade 1.82.0-&gt;1.83.0<br>
    </p>
    <p>The postfunc removal commit was here:<br>
    </p>
    <p>&nbsp;&nbsp; commit 2cb5d1accca23df67dd55d01416ea404ab92683b<br>
      &nbsp;&nbsp; Author:&nbsp;&nbsp;&nbsp;&nbsp; Deepesh Varatharajan
      <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:Deepesh.Varatharaja=
n@windriver.com">&lt;Deepesh.Varatharajan@windriver.com&gt;</a><br>
      &nbsp;&nbsp; AuthorDate: Thu Mar 27 05:06:03 2025<br>
      &nbsp;&nbsp; Commit:&nbsp;&nbsp;&nbsp;&nbsp; Richard Purdie
      <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:richard.purdie@linu=
xfoundation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a><br>
      &nbsp;&nbsp; CommitDate: Thu Mar 27 09:41:58 2025<br>
      <br>
      &nbsp; &nbsp;&nbsp; &nbsp; rust: Fix bloat issue in recent rust updat=
es<br>
      <br>
    </p>
    <p>so we should see a large tmpfs usage increase on March 5th and a
      significant reduction on March 27th.</p>
    <p>Look at the buildperf-alma8&nbsp; (or buildperf-debian11) on March
      27th:<br>
      <br>
<a class=3D"moz-txt-link-freetext" href=3D"https://valkyrie.yocto.io/pub/no=
n-release/?type=3Dbuildperf-alma8&amp;date=3D2025-03-27">https://valkyrie.y=
octo.io/pub/non-release/?type=3Dbuildperf-alma8&amp;date=3D2025-03-27</a><b=
r>
      <br>
      There are 4 perf builds that day and build number: 20250327-93
      includes the bloat removal commit</p>
    <p>which I found by opening each run, starting with the lowest run
      numbers and clicking on the <br>
      &quot;commit&quot; in the &quot;Current commit&quot; column at the to=
p of each page.</p>
    <p>You can see that the FS usage did decrease but only by 785 MB.
      Maybe that's the 1 GB for src/gcc<br>
      and some other packages are adding 215 MB.<br>
      <br>
      <img src=3D"cid:part1.N2Dq6bFk.IIl2RAN1@windriver.com" alt=3D""></p>
    <p><br>
    </p>
    <p><br>
    </p>
    <p>If you look at the FS usage for <br>
      &nbsp;&nbsp; test1: Build core-image-sato</p>
    <p>You can see the significant increase on March 5th of 103504 -
      97857 =3D 5647 MB<br>
      that Richard pointed out week(s) ago:</p>
    <p><img src=3D"cid:part2.ziiZ9PSu.0AfEsRCJ@windriver.com" alt=3D""></p>
    <p>There's another significant increase on March 7, and a decrease
      on March 11/12 which would be good to understand.<br>
    </p>
    <p><br>
      So, it's Friday afternoon and I'm not going to dig any more today.<br=
>
    </p>
    <p><br>
    </p>
    <p></p>
    <p>Yash, Deepesh,<br>
    </p>
    <p>You did mentioned that you dropped&nbsp; the rm -rf src/gcc in the
      commit log but<br>
      in addition please do some work to check what the FS usage is for
      a core-image-minimal build<br>
      at each stage probably initially bug checking out 1.82, 1.83,
      1.84, local commit 1.85. in poky's git repo.<br>
      <br>
      Are you able to reproduce the initial ~5647 MB increase in 1.83 ?<br>
      What tmpdir size do you see once the:<br>
      &nbsp;&nbsp; rust: Fix bloat issue in recent rust updates<br>
      commit is added?<br>
    </p>
    <p><br>
    </p>
    <p>If things are confusing using the public poky repo and master
      branch commits you could<br>
      start with poky with rust-1.82 and create a branch where you just
      add the<br>
      rust updates (and dependent commits as needed) to eliminate
      changes from<br>
      other parts of the system.</p>
    <p><br>
      Please send an summary of findings email to this list each day as
      you are testing and reviewing the data.</p>
    <p>Thanks,</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:20250328143005.880998-2-Yash.Shin=
de@windriver.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">
 UPSTREAM_CHECK_URI =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"https://=
forge.rust-lang.org/infra/other-installation-methods.html">&quot;https://fo=
rge.rust-lang.org/infra/other-installation-methods.html&quot;</a>
 UPSTREAM_CHECK_REGEX =3D &quot;rustc-(?P&lt;pver&gt;\d+(\.\d+)+)-src&quot;
=20
diff --git a/meta/recipes-devtools/rust/rust_1.84.1.bb b/meta/recipes-devto=
ols/rust/rust_1.85.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust_1.84.1.bb
rename to meta/recipes-devtools/rust/rust_1.85.0.bb
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>=

--------------N9CdUUGQr0Mj7r2exni1VNOa
Content-Type: image/png; name="Nua1q4ux5Rq8uEFS.png"
Content-Disposition: inline; filename="Nua1q4ux5Rq8uEFS.png"
Content-Id: <part1.N2Dq6bFk.IIl2RAN1@windriver.com>
Content-Transfer-Encoding: base64

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
MtK16ouUl/XVv5aXOr59+3a76qqrrE2bNnbWWWfZAw884KStobyMdI5b/TMz++yzz+zSSy+11q1b
2yWXXGI///nP7ZJLLgnJz0hxrl8fOnbsaH/84x+td+/elp+fb9dff73t378/pvoQKd9LSkosIyPD
Ofa5556zNm3a2Lp168zMbO3atTZq1CjLzc214uJie/rpp61du3ae8nzYsGH2s5/9zDn2nHPOsSFD
hjivf/SjH9moUaNc6104ka47ZswYp+7cfvvtYc+PJc/MzD799FMbM2aMtW7d2vr162fPP/+8mfkv
86buaxuKt1ueeimjSHXFS1tqKG7R5JFbva0v1rRHKtN4j8/R9hOR6rSXNMarztd38OBBk2S7d++O
KR514Wzbts1TfYtUR/zGKdI4EI5b/YxUH8K1h0hlG5yW4Dwy8zd+RztPi1Rm0dQdt77Za5rc2pFb
uiLlq5/+p355hqt7fuasfvoSt/yMtd8Px2u7i1SWbvOW+hoKx20O7pY/ZpHHVL9l0Zjjc1Ots9zy
NFJ9j0c6vZg3b54FAgHbuXOnXXzxxXbNNdeEfO5Wp73W4cZOq5d+f9u2bSF/+1mjBouUrnAijYnB
YV1xxRV26623hpw7YcIEmzx5spnFtt5tKP6xtJf6ZRjLGjCWNbWf9IS7TqS6V19jz2nNItflWOpI
NPNht3L1m77mHOP9zhfdxtZY7iHVF26tHs19HLf0NuaauqGwZ82aZfn5+bZ3714nXTk5Ofbee+95
ilNDcwG38bq5x1evY1I84uJn3eX1flSkcS7e6xW3NYhZ5PEgUv75WQ9H02b8pDPe64ho7oXWr3uR
4hupDcU6X0GoJt8o69u3r61evdo2bdpkF1xwgU2YMMHMzGpqamzIkCE2adIk27hxo61YscKGDRtm
t912W4PXGThwoP35z3/2dH5paaklJSXZ7373O9u4caPddtttlpeX51SO4LDqi3Su1wXc0KFD7ZNP
PrFZs2aZJGvXrp29++679sEHH1j37t3t3/7t36I63sysU6dO9t3vftfWrVtnixYtsi5duthPfvIT
M/tnYx09erTNnTvX9u/fbwsXLrScnBw7fvy4mZ0c1JKSkmzDhg2npH3x4sUWCARswIABtnLlSlu2
bJn169fPvvWtbzUYfixl4XZuXf707t3bVq1aZR999JENHjzYxo8fH7ZeuJV7fZHyMpzga7nV8erq
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
lYmbwsJCLVu2TLW1tc57wd+giiaOfso5mjLxE38/CgsLtWHDhpCNxmg3QQEAAAAAAAAAQGziulHW
pUsXDRs2THfffbduuOEG5/2cnBwdOHBAS5cuVUVFhZ599ln98Y9/1L59+04JIz8/X5mZmXrkkUe0
e/duvfbaa5oxY4bz+eDBgzVixAhNnDhRa9eu1fz583XHHXeosLBQ0slNpzvvvFOzZs3Stm3b9OKL
L6qiokJFRUWu8b/sssvUsWNH3XzzzSorK9OiRYt0zz33aOrUqZ7zwE9ag02ZMkVr167V+++/r8mT
J+v6669XQUGBa3qlk99I27lzp/Ocq+DXXs5341Ymbm644Qbt379ft912m7Zs2aKZM2fqqaeecj6P
Jo5u5RycB9GWidf4+zFmzBjl5eVp2rRp2rp1q5555hktWbIk5FtlM2bM0Jw5c6IKHwAAAAAAAAAA
eBfXjTJJmjhxovbu3avrr7/eee/yyy/X1KlT9a1vfUv9+/fXunXr9Je//EVLly7VY489FnJ+amqq
nn/+ec2dO1edOnXSrbfeqmnTpoUc89prr6lTp0667LLLdNNNN+nqq6/Wz372M0nSlVdeqbvvvlt3
3HGH+vTpo1//+td68cUXNWTIENe4Jycn629/+5uOHDmikSNH6pZbbtHkyZM1ffp0z+n3k9Y6AwYM
0JgxYzRhwgRdddVVOu+880I2YiKlV5ImTZqkhx56SA8//HDY127nu/FSJpG0bt1ab7/9tj766CMN
GTJEjz76qF588cWQY/zG0a2cg/MgmjLxG3+vUlNT9cYbb2jdunUaOnSolixZottvvz3kG4uPPfZY
xOefAQAAAAAAAACA+AiYmTV3JBpy+PBhpaSkKD09vbmjgv8fZRKb3bt3a86cObr55pud599973vf
U0FBgX75y182c+wAAAAAAAAAAEgsKc0dgUiysrKaOwqohzKJTUZGhu68805VVlZq8uTJWrNmjV59
9VUtXbq0uaMGAAAAAAAAAEDCadHfKAO+ihYsWKC7775bW7duVY8ePXTXXXfpu9/9bnNHCwAAAAAA
AACAhMNGGQAAAAAAAAAAABJSUnNHAAAAAAAAAAAAAGgObJQBAAAAAAAAAAAgIbFRBgAAAAAAAAAA
gITERhkAAAAAAAAAAAASEhtlAAAAAAAAAAAASEhslAEAAAAAAAAAACAhsVEGAAAAAAAAAACAhMRG
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
tEmSQp5p8e677+rLL79UUVFRg3kaTqdOnTRkyBBJ//zJnbKyMpmZa1o/+ugjSdLYsWOVmpoqSc7P
i23YsCHk2FjzFWhMTdFf1vHTFjIzM3XllVfqiy++0IoVK/T2229Lkq699lpJ3tf3frDGj4+ysjJt
3LhR7dq1c3428etf/4SKCScAACAASURBVLpqa2s1e/bskGM7dOig4cOHSzrZDyclJWn9+vUyM9fx
wE8/HCu/dcPLeNiY8Yh2XhGpjbqNv7QfNOTcc89VcXGxhg8frtTUVJWXl2vu3LmS/LetePT9buML
7Z32jsSS0pQXq5uw3HfffRo6dGjIZ3379lVWVpZKS0v1hz/8Qa+//rqWLVumDRs26Pnnn9f27duV
kZHh+VrJycnO34FAIOSzBQsW6PLLL1enTp10yy236L777tM111xzShjhbmwEh+s1XQAAAGgeXbt2
VefOnbVq1SqtWbNG55133ilzQ7e5nNvc0W0OW8fLpkv79u1D4ucWtwMHDkiK37y17nkEkebSXlRW
Vp4Sr+rqal9xccvXuvDCpTNY/TwNJzieKSkpSkpKUnJysqe015Vr8LF15VI/zbHmK9CYmqK/rOO3
LVx77bX6v//7P7311ltasWKF0tLSNG7cOEne1/f1ReqTWePHx8yZMyVJ+/btO6Wvfu2113TLLbc4
r83MqQtJSUkKBALOa7fxwE8/XJ+XsTmY37rhZTyMhtfx3O+8wss8wG38pf2gIU8//bTznzLeeecd
ff3rX9eTTz6pBx54wHe9ibbvry/S+EJ7p70jsTTpN8rqGkh2drbGjx+v8ePHq7S0VO+9957S09M1
f/58/eY3v9Hw4cO1ZMkS/eMf/9A555yjvXv3av369SFhxfJQwDfeeENmprvuuksPPvig6+I61nQB
AACgeQQCAZ133nl65513VFZW5vxv9WBuczm3uaPbHLZuPrh582bnf7kuX77cU/zjPc+Md3gNzcnP
PvtsSdLcuXOdm5Cvv/66r7i45Wvv3r0lSYsWLXLCvPDCC9WmTRvn4e1e7dy50/lfwG+++aZqamp0
7rnnekpr3f+8ffPNN52bCbNmzQr5DDgdNEV/Ga2xY8eqVatWmj17tpYvX67LLrtMubm5kvyv7730
yazx4+Mvf/mLJGnw4MEqLi52/iUnJ2vRokU6dOiQc+yePXtUUlIiKbQfDgQCruNBNP2w37G5bgzw
Wze8jIfRiLaOxqNuu42/tB94Ufft//Lyckn+66afvj/SPeRI4wvtnfaOBNNYv+kY7hllFRUVlpeX
Z+np6Xb77bfbmDFjTJJddtllZmY2a9Ysk2QFBQU2efJku+666ywpKcnatWtnX375pZmZXXzxxSbJ
brjhBtu5c+cp1637fdWioiLnvbrfiP3Od75jZmb//d//7fwW7sSJEy07O9ukkw89NPvnM8qGDh3q
hDF06FCTZBs2bDAzs8cff9wk2b333uuaLgAAADSd4GfuVFdX2yOPPOK8XrBggb333nshz9xxm8u5
zR3d5rBHjhyx1q1bmyQrLCy0AQMGWGpqashzUMLNYb3ELd7zVi9zaTP3OXl5ebmlp6c7z5ipe7C3
gp7REOvaoKqqygoLC02SXXzxxc7zHeqeaRMuLQ09oyY1NdUKCgrsmmuusaysLJNks2fPDpvW+mHU
1tY66Rs0aJB9+9vfttTUVAsEAvbee+/5ylegqTV1fxlLW7j22muduL3wwgvO+27XDPdMGrc+mTV+
7D7++GOTZK1bt3aeG1anuLjYJNmMGTNCnlFWUFBg48ePd/rhWbNmmZn7eOClH46mHpidOgb4rRte
xsNonlkUzXge7Xn126jb+Ev7QX11zyirq89moePPsWPHXOtN/Xbi1vebuc/h6jQ0vtDeae9ILE36
jbL8/HwtXbpUo0aN0u9//3utW7dOU6dO1auvvipJuuaaa/TUU0+pU6dOeuWVVzRv3jxdeOGFmj9/
vrKzsyVJ//7v/66ioiL99a9/VUVFRVTx+MEPfqCJEyeqsrJSW7Zs0SuvvKKsrCzt2bNHS5YsiXu6
AAAA0HxGjBgh6eS3Jer/JIjkPpdzmzu6zWEzMzP1hz/8QWeffbZ27dqlbt266ac//amnuMd7nhmv
8Nzm5O3bt9fcuXNVXFys0tJSVVdX6yc/+YmvuLjla0pKit5++21985vf1EcffaSPPvpI119/fVT/
c3f48OH6wQ9+oBUrVqhLly56/vnndfXVV3tKayAQ0Jtvvqnvf//72r9/v+bNm6fhw4dr0aJFGjVq
lO+4AM2psfvLWNQ9cyolJcVpn9Fc00ufzBo/dnU/uxj83LA6V111lSSF5Gfv3r116aWXaunSperS
pYteeOEF52fU3MaDaPphr2Nz/THAb93wMh5GI9o6Go+67Tb+0n7gRV5entq0aSNJeuutt3zXGy99
v9d7yA2NL7R32jsSS8DM5w8yAwAAAMBXwJo1azR06FAVFxdr6dKlzR0dAAAAAEAzaNJvlAEAAAAA
AAAAAAAtRUpzRwAAAAAAmkNubq6uuOIK9evXr7mjAgAAAABoJvz0IgAAAAAAAAAAABISP70IAAAA
AAAAAACAhMRGGQAAAAAAAAAAABISG2UAAAAAAAAAAABISGyUAQAAAAAAAAAAICGxUQYAAAAAAAAA
AICExEYZAAAAAAAAAAAAEhIbZQAAAAAAAAAAAEhIbJQBAAAAAAAAAPD/tXfncVVV+//HX5sZBRUV
FHHKIRzAClCRzCmHr1pqZaWolVetDIfsZv1Sr1pqo3bzUallmkNW12tWao45lAOKkooTpNxrzigo
kwhyOPv3x7kcRZBBUUvez8djP+Sstfbaa+9z9gb356zPFpEySYEyERERERERERERERERKZMUKBMR
EREREREREREREZEyyam0Oprz1Q+l1ZWIiIiIiIiIiIiIiIj8CQzq3+tOD+GWMkzTNO/0IERERERE
RERERERERERuN6VeFBERERERERERERERkTJJgTIREREREREREREREREpkxQoExERERERERERERER
kTJJgTIREREREREREREREREpkxQoExERERERERERERERkTJJgTIREREREREREREREREpkxQoExER
ERERERERERERkTJJgTIREREREREREREREREpk0o9UJaTY1v+7H0CNGyYgmFcsC8ODheoVSuFiIgM
0tLMYveTkmJiGLZ1C3pdkO++u4xhXGDgwIs3vR+3Q3H26W51qz5/IiIicmv88ssv+Pr63vD6SUlJ
GIZBQkICKSkpGIbBH3/8UWDbrVu34u3tfd2+cnJyME0zX78iIn82pmmSkJBAQkICly9fvtPDkTLg
VNqpOz0EEfkL2n92P1O3Tb3h9fed3cfx1OOlOCIRuRuUeqAsICAVJ6cLnDxpvS19RkZa8PZOZsMG
yw33HxjoSOvWTgQHO3LmjJUZM7IYNiyj2Os7OkLr1k40b+54w2P4sysL+3g9t+IzLSIiIn9e5cqV
Y/LkyXh4eNx0XyEhISxevLjU+xURKW2zZ8+mevXqVK9enc2bN+erj4yMxNvbmw0bNhS7z+uts3fv
Xjp16kSlSpUICQlh7ty5hfaze/duOnfuTMWKFalVqxbDhw8nNTW12OOQP599Z/fRdl7bfOWZlkxe
XPEi1aZWw/8Tf2b/NrvQfn47/Rtt57WlwjsVqP3P2rz+8+tYrDd+f0hEbo+SnutXr9f3u74s2rfo
um1MTMasH0ONaTUI/jyY7Se251k//LtwyjmXu+l9EJG7i9OdHsCNsFph794cduywMHFiJomJJtnZ
xZ8Bdq2ZM8vx4IO2QxEdnUNISCpLl2Yzbx4YRtHre3gYbN7secPb/ysoC/soIiIiAuDu7s7YsWMB
SEkpvdn0V/crIvJncv78ecaMGYOTkxMWy5Ugg9VqZe/evezYsYOJEyeSmJhIdnZ2oX0Vtc7p06dp
164dqampdOjQgT179jBo0CCcnJx45pln8vWXmJhIp06dSEtLo2PHjpw5c4ZPPvmEc+fO8e2335be
QZDbIuFiAtuOb2PCxgkF1o9YNYLfTv/Gyn4rOZZyjAFLB1CzQk26Nuiar21GdgaPfvMoPfx7MKP7
DPaf3c/QFUOp7F6Z1x98/VbviojchJKc61d7/efXOZV2itoVa1+3zbf7v2VN/Bp+HfgrkSciefxf
j3P8leM4Go58HPUxfQP6UsW9Smnvkoj8xZXqjLIHHkglNtaWo65mzRSio20/x8bm8H//l46XVzJ+
fim8+uqlPKns1q+30KpVGh4eydSokUL//hc5fdp63T7T0kyCglIZOjSDhISCZ/nk5EBWFhTxN3w+
Dv87IrVqOWAYtsCZYVzgoYfS7G3mzMnCMC4wapRt1llx0hKeOmXl0UfTqVQpmbCwNH7/vejZSWfP
mvTrdxE/vxSqVEnmiSfS+eOPK+ulppq89FIG9eqlUKlSMg89lMamTVf+U/PHH1YM4wKBgaksX55N
o0apHDhQvPfkWtfu44EDtuPywAOpDBhwEQ+PZBo1SuXHH7OZPTuLBg1S8PJKZsiQDHu/P/6YTVBQ
KuXLJ+PjY9ufEyeu7E9ysskzz1ykcuVkOndO5623MjGMC0yblmlvU9JxQ+Gfr6LGdb3PdFHHXkRE
RO68b775hsaNG1OlShXCw8O5cOECAAkJCRiGkScI9umnn9K+fXsAe7rFglIk7tmzh9atW1OxYkUe
eughDh48eN3th4WFERMTw7PPPsvYsWPz9JuVlYVhGHz88cdUrVqVSpUqMXjwYA4fPkzbtm3x8PAg
NDQ0T8rHs2fPEh4ejo+PD97e3owcOZIc5YcWkVIwZswYfHx86Ny5c57ytLQ0goKCGDp06HXTxubk
5JCVlWUPhhW1zqJFi0hOTmbcuHGsW7eOQ4cO4eTkxIQJE7Ba8/8/eceOHSQlJTF69Gh++ukndu3a
RaNGjVixYkUp7Lncbgv2LuDtzW+TdjktX11iRiIL9i7g424fE+wbzGONHiOiRQTTtk0rsK/o09Gk
ZqXySbdPaOrdlKebPk2fgD5s/O/GQrff6JNGlJtSjsCZgayJX1Nq+yYixVPScz3X2vi1rDy8ktFh
owttF3Uyij4BfWhQuQEDmg3AMAxOpJ4gOTOZ+Xvm83Loy6W5OyJylyjVQNk//1kOPz9bl198UY76
9R1ISjIJC0tjyxYLvXo5U6eOA9OmZfLaa5cAOHPGSo8e6ezdm8OTTzrj7+/AokWX6dv34nX79PQ0
iI2tQGxsBTp3di5wLLNmZeHmdoHw8KKfATZ8eAbt26fRqlUaoaGpeHkZzJlTelNwc3KgY8d0VqzI
pl49By5fNhk79lKh61it0KlTGl9/fRl/fweaNnVk6dJsevRIJ/f/Dt26pTNzZhaengYdOzqzfbuF
Dh3SiIzMG7A5e9ZK//4XOXLEdiOlqPekJPbsyWHt2mwaNnQgLi6H3r3TGTo0g2rVHLh0yeSLL7L4
178u8/vvOTz5ZDq//26la1dn7rnHtj8REVdSXL7wQgYLF17Gz8+Bc+esvPVW3vHcyLiL+nwVNa6C
Pn8lOfYiIiJyZyQmJjJt2jQWLFjAsmXLiImJKXCmQkkkJyfToUMHGjduTGRkJM8//zyvvPLKddtv
27aNZs2aMX/+fKZMmVJgmwULFrBjxw7mzZvHnDlzCAsLY/LkyWzevJnTp0/z0UcfAbYZGt26dcMw
DDZt2sTy5cuJjIxkxIgRN7VPIiLR0dF88cUXzJgxAxcXlzx1np6exMbGEhsbmy+IlmvWrFm4ubkR
Hh5erHVOnDgBQNOmTQGoWrUqfn5+HD16lDNnzuRrHxgYiIuLC9u3b+f48eNERUVx4sQJgoKCbmq/
5c4YHTaanUN2MrHdxHx1B84dwDAMWvq1tJe1rdOW3Wd2F9jX/dXvZ8+Le3A0bI+IsFgtHDl/hKY+
TQtsH5sYy8AfBzIydCS7nt9Fmzpt6LOkDzmmvnQicjuV9FwHSLqUxOBlg5nfaz6eroVnvAr2Debb
/d9y5PwRvt73NVbTSs0KNXlv63sMbzlcaRdFpEClmnqxXTsnPD1tuQr/7/+cqVTJ4J13MrlwwWTi
RHcmTHDDYoG6dVP48MNMXnnFldhYKxkZJg884MiECe7Uru3AmDGXyM62BYsK6hPA39/2h1CFCsXI
jViE3bvz/lHk7k6Rs5RK4ocfLnPoUA7NmzuxfbvtYv7ww4XPQFq9OpuYmBw6dnRm3TrbcyzatElj
9+4cDh7MISHBZOtWC/XqObBrVwWcneHzz5144YUMJk/O5Kefrjz74uxZk88+K8ezz7ri6kqR70lu
YKg4XF3h8OGKeHoa1KmTwvHjVmbOLMeLL7oybtwlpkzJ5ODBHGrXdqBfPxceftiZ/v1d2LMnhwce
SGXPHtuBPngwh8WLL+Pra9sfJycICkolJubKG/H551klHveBA4V/vmyz9q4/roI+f+vXW4p97EVE
ROTOsFgszJ49mwceeACAOXPmEBoayokTJ3B2LviLVkVZuHAhlSpVYtasWTg6OtKkSRP27NnDggUL
bnicr732GvXr16d+/foEBgbSsmVLHnroIQB69uxpv6H8yy+/8N///pfIyEj7+GfOnEmLFi145513
qFChwg2PQUTKLtM0iYiIIDw8nHbt2jF9+vQ89Q4ODvj7+wMU+zpT1Dq5AbLc6/KGDRvss2fPnj1L
jRo18rSvXbs2M2fOZNCgQdSuXdve781ce+XP6WTqSaq4V8HBuPJ/e+/y3py/dJ5MSyZuTm552nu6
eOLpYrvH8ug3jxJ9KpoGlRswqf2kAvuPvxCPi6MLvZv0xrucN+91fI8e/j2wWC04Opa957GL3Ckl
PdcBhiwbwrP3P0tYrbBCA2oA/Zr1Y2/CXlrNaYWvhy/fPfUdCekJrDq8il3P7yr1/RGRu0Opzigr
SG6qv4kTL2EYF3B2vsDJk7YpUYcO5RAa6kjlyga7d+dwzz0p3Hef7YG8/+//udnTIN6IiAhXTNOL
f/+7fJFtt2zxxDS9sFi8WLnSg/R0k65d08nKuvHtXy036PLII844ONjSOz71lEuh6xw8aFunffsr
scxff/UkLa0SAQGO7Ntnq+/WzZncez1PPmnrc//+vFE+Hx+DIUNsQTIo+j0ZMSKDWrVS7Etc3PWj
hk2bOlKhgoFhQLVqtoBSWJhtzL6+tjcwJwdat3bib39zZfNmC82bpxIWZkuzkDs7Ljcg1qaNE66u
4OgI3bvnvYl1I+Mu6vNV1LgKUpJjLyIiIneGu7u7PUgG0KJFC1xdXTl8+PAN9xkXF8eDDz6Y52Za
blDrRjVr1sz+c8WKFQkODs7z+uptp6Sk4OPjg5eXF15eXnTo0AGr1XrddGgiIkX58ssviYuLY+rU
qTfcR0REBKZp8u9//7tY7QcMGECTJk1Yu3YtderUYeDAgXh62oIdV1/3ckVHR/PKK69Qs2ZN3nnn
HV588UXS0tLo169fgaka5a/Lal7//bRYC8/eMvahsbwa9ipn0s/w7pZ3C2zTtk5b/Kv4U296Pfov
7c+Sg0toVbMVro6uNzVuESmZkp7r8/bM41jKMca3HV+s/g0MPuj0AedGnyNmaAxhtcKYuGkiY9uM
xcmhVOeMiMhd5JZfHXIDCePGuRESkndzTZo4Ur68waFDFVm0KIsffshm61YL+/fnMHduFseOVcTN
7eZnjBWXoyN07epMUJATO3daiIqyUK6cbfumeeP9pqfbVr468GcpIkNfbv31vtRk/m9AxlWH58IF
s8C+fXwc8rQr6j2ZP/9ynmeHFTbWgoKZBY153bpsunRJx9fXgSFDXBg3zolevdLt9Zf+lz3x6kwf
rq553/sbGXdRn6/Nmy2FjqsgJTn2IiIicmcYRv6/IR0cHPKlFcuVXYwH2zo6Oubr180t/zdeb0ZB
4wZbKrPAwEB27y78G7QiIiWxatUqkpOTqVatWp7yjh07smLFCrp3717q23Rzc2P79u3Mnj2bEydO
0L17d1599VX27t2Lr69vvvbz5s0jJSWF9957jxdeeAGAAwcOsHnzZnbu3EnLli3zrSN33qJ9i+i/
tD8Abk5uXCri8RMAvp6+nL90HhMTA9vvw8SMRDxcPPBwyZ+5JelSEtk52VT3qE5ozVBCa4bS2Lsx
4d+FM6HdBHtKxlweLh7sen4X6/6zjtVHVjN+43jGbhjLrud34euR/7MnIjevoGtBSc/1rce3En06
GpdJef+ON940WN1/NV3qdyl0DHFJcew7u4/PHv2M5Mxkhiwfwpoja2hUtREzH5lJsG9woeuLSNlw
y2aU5aYubNLE9oeJh4dBz57O9OzpzKFDOWzZYsHV1WD16mw+/jiTFi2c+OUXT06dqsS99zpy7pyZ
J+3e1X0Wd/tZWVCMex55JCebHDpk21CFCoZ9FlZcXI59ltG2bSWbNdSwoe0YrFiRbQ+4/fDD5ULX
adTIts769VciL+3apeHllUxsbA6Bgbb6lSuz7cGZ77+39Zlbdz1FvScLF5bHNL3sS9OmN5+C4Kef
bPv+6quuTJzoni+Y1qiR7aO4aZMFi8UWmFy5Mu+bdyPjLurzVdS4rpb7+buZYy8iIiK3R0ZGBnv3
7rW/jo6O5vLly9x77732stTUVPvPBw4cKLJPf39/tm7dmmcGw/bt20tpxIVr3Lgxhw4d4vz58/ay
FStW8Mgjj9yW7YvI3aldu3Y899xz9iU3tWHnzp2pWbNmsfrIyckhKyurWF84AIiMjGT8+PHUrVuX
Dz/8kAYNGrB//37atm1r//JBVlYWWf9L8ZLzv/+IHTt2zP761KlTAJpR9ifWL7Af5gQTc4JZrCAZ
QLNqzbBYLfx2+jd72bbj2wipEVJg+7m75/LI1/l/D2ZZCk4PtPHoRubunkvXBl2Z/n/TiR8ZT3ZO
Nmvj1xZrfCJScgVdC0p6rr/f6X1OvHLCvkxqP4km3k048coJ2tVtV+QYxqwfw5QOUzAwGLdhHH6e
fhwbdYxXw17lycVPlsp+ishfX6kHyvz8bN8EGDPmEqdOWRk0yJVKlQwmTLjEsGEZdOuWzhtvXCIm
JocqVQwyM2Hy5EweeyydQYMyGDkygyNHcqha1bAHRq7tszhmzcrCze0C4eEXi2w7fHgG7dun0aZN
GjVqpJCebhIY6EjTpo7Ur+9AxYoGiYkmTZqkcv/9qSxcWLKcjL17u+DqCjt2WAgNTSMsLI0NGwqf
evTII874+zuybl02HTum0b59Gr/8YuHeex1p1MiRhx92plUrJ+LjrbRokUqfPhd5441LGAb84x+F
f7O5qPfkVqhVy/ZRe//9LHr3vkjfvrb35fJlW+SwVSsngoMdOX7cSsuWqYSGphEVlfcY3ci4i/p8
FTUuyP/5u5ljLyIiIrfP4MGD2b17Nzt27OBvf/sbffv2xdvbm8qVK+Pu7s67777LmTNnWLp0KV99
9VWR/fXr14/z58/z0ksvcfjwYZYsWcJnn31W6DqGYXDy5EkuXy78S1JFCQoKIjQ0lCeeeILdu3ez
evVqhg8fbn8OkIjIjYiIiODLL7+0L0FBQYDt+Yn33XdfsfqYNWsWbm5uhIeHF6u9l5cXM2bMIDw8
nIcffpgWLVpgtVr5+9//DsDJkydxc3PDw8M2q2DgwIE4Ozvz9ttv07x5c2rVqkV8fDwPPPAAISEF
31SVvybvct481fQpRq8dzfHU42w5toUZO2cwrMUwe5uvYr5i+e/LAXis0WPEJcXx/tb3+SPlD7af
2M4bP79Bn4A++WaTAWRkZzBqzSi+j/2eo8lHmbdnHkmXkgjwCbht+ygiJT/Xvdy88PP0sy9e7l64
OLrg5+lXZOrUqJNRXLx8kQ73dABs1wEHwwFHB0dcHF0KTQMpImVLqQfK/v53NwICHFm2LJukJJPK
lQ02b/bkwQedWLjwMnv35jBihCvffWd7dlivXs589lk5fH0dWLz4MqtWZdOunROrV3vi4WEU2Gdp
2707h02bLGzebMHTEx5/3JkffvDAyQnc3Q0WLSpPw4YOnD5tpVYtByZNci9R/z4+BitWeNC6tROH
DuVgscBbbxXeh5MTbNjgwZNPurBvXw779uXQt68LP/xgO26GAStXevDCC66cP2+yalU2LVo4sX69
7VgXpqj35FYYOtSVJ55wIT3d5PDhHBYvLk/58gZnz5r88ostILZ8uQfduztz5IgVV1cYMyZv0OlG
xl3U56s447r283czx15ERERuj/vuu4+uXbvy+OOP8+ijj9KyZUt7UMvZ2Zm5c+eyYsUKfH19ef75
53nllVeK7LNixYps2LCBffv2ERwczIcffsi8efMKXSc8PJw333yTyZMn3/Q+LV26FF9fXzp37sxz
zz1Hjx49ePvtt2+6XxGR26lRo0YsW7aMgIAAoqKiuOeee/jmm2+uO0O2efPmrF27ljZt2vD7779j
GAYDBw5k1apVODs7F7iO/HXN7jGb2hVrE/xZMIOWDWJS+0k80fgJe/30HdNZsHcBAA0qN2DtgLWs
OrKK+2beR58lfehYryMfd/u4wL67N+zOaw++xvCVw2n8aWM+2v4R83rNU9o1kTugJOf6zXhj/Ru8
/fCVv5ff7/Q+/7nwH/ym+TH518kseWrJTW9DRO4OhmnezNO3REpHUpLJ9u0WPD0N2rSxBZtefDGD
zz7L4uuvy9O3b8HPExERERG5GRcvXsTJyQlX18K/jSoiIiIiIiIidycFyuRP4dQpK/Xrp3L5ssm0
aeWoWNHg5ZczcHSEgwcrUL36LXucnoiIiIiIiIiIiIiIlFEKlMmfxsaNFv7xj0vs25eDoyMEBzvx
9ttuNG+udIYiIiIiIiIiIiIiIlL6FCgTERERERERERERERGRMkn57ERERERERERERERERKRMUqBM
REREREREREREREREyiQFykRERERERERERERERKRMUqBMREREREREREREREREyiQFykRERERERERE
RERERKRMUqBMREREREREREREREREyiQFykRERERERERERERERKRMUqBMREREREREREREREREyiQF
ykRERERERERERERERKRMUqBMREREREREREREREREyiSn0uro1JnE0upKRERERERERERERERE/gRq
VK96p4dwSxmmoWv4dQAAIABJREFUaZp3ehAiIiIiIiIiIiIiIiIit5tSL4qIiIiIiIiIiIiIiEiZ
pECZiIiIiIiIiIiIiIiIlEkKlImIiIiIiIiIiIiIiEiZpECZiIiIiIiIiIiIiIiIlEkKlImIiIiI
iIiIiIiIiEiZpECZiIiIiIiIiIiIiIiIlEkKlImIiIiIiIiIiIiIiEiZpECZiIiIiIiIiIiIiIiI
lEkKlImIiIjIXScnJwfTNG/b9rZu3Yq3tzcASUlJGIZBQkLCTfdbmn2JiNytMjIyeP3112nevDke
Hh40bNiQ559/nmPHjtnbpKSkYBgGtWrVspc1bNgQwzDsi4ODA7Vq1SIiIoK0tLQ7sSvyJ+f5jifl
3y5PRnZGvrofYn/AeNOg73d9AUi6lITxpkHCRdvvcN9pvhhvGval/NvlaT23NVEno27rPoiUdfvO
7uN46vE7PQwR+ZNRoExERERE7johISEsXrz4jmy7XLlyTJ48GQ8Pjz9VXyIihYmMjMTb25sNGzbk
KU9MTOTpp5/G29ubgIAApk6dWqL6a+Xk5PD666/j7++Pj48Pffr0ITExsdjjudbp06cJCgri/fff
Z8+ePdSsWZPTp08ze/ZsmjdvztGjRwFwdHSkdevWNG/ePF8fgYGBtG7dmuDgYM6cOcOMGTMYNmxY
oduVklu0b1GeQNHVy5r4NQD858J/6PFNDyq9W4la/6zF6HWjuZxz2d7H6HWj862bG5gqSGJGIk8v
eRrfab5Um1qNgT8O5Pyl88WuL0imJZO18Wvzlf8Y9yMOxpXbbOWcyzG5w2Q8XK78Dp/YbiKxw2I5
FHGIdQPW4eHiQc9ve3LJcqnoAyhyF8m0ZPLiihepNrUa/p/4M/u32YW2L+racDUTkzHrx1BjWg2C
Pw9m+4ntebYb/l045ZzLler+iMhfn9OdHoCIiIiIyN3E3d2dsWPHFliXmZmJm5tbqfQlInKzrFYr
e/fuZceOHUycOJHExESys7Pt9aZp0r59e/bv30/37t2Jj49n9OjRmKZp/7ew+oIMHjyYefPm8eCD
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
MmzYMDp37oyjoyNPP/00b7/99g2NSUQEbKkIN27cSEREBBs3bsTLy4spU6bwxhtvFKv+WoZhsHbt
WkaMGMHatWtxdnYmIiKC995774bHWK1aNXbu3Mn48eP5+eefOXr0KKGhobzxxhsYhsHMmTOL7GP3
7t32n318fOjatSsffPABTk66ZVLarKaV9f9Zz6fdP81X513Om/XPrmf02tEEfxaMh4sHvRr1YsrD
UwCoVaEWkYMjGbV6FK3ntqZKuSo8c98zjH3oyu/56TumU7dSXR6991FiEmLItmbTYX6HfNtKfC2x
yPoq7lUK3ZeO9TqSnJlMh3s65EsJeT3jN45n/MbxgO05SnUq1WFq56n09FegTMqW2T1mM3TFUII/
C8bL3YtJ7SfxROMn7PVXn8tFXRsK88b6N/ig0wf21+93ep/BywbjN82Pe6vcy5KnltyS/RORvx7D
LM4cVRERERGRMuKXX36hd+/enDt37k4PRURERERERERuMaVeFBERERERERERERERkTJJgTIRERER
kat4eXnRpk2bOz0MEREREREREbkNlHpRREREREREREREREREyiTNKBMREREREREREREREZEySYEy
ERERERERERERERERKZMUKBMREREREREREREREZEySYEyERERERERERERERERKZMUKBMRERERERER
EREREZEySYEyERERERERERERERERKZMUKBMREREREREREREREZEySYEyERERERERERERERERKZMU
KBMREREREREREREREZEySYEyERERERERERERERERKZOcSqujU2cSS6srERERERERERERERER+ROo
Ub3qnR7CLWWYpmne6UGIiIiIiIiIiIiIiIiI3G5KvSgiIiIiIiIiIiIiIiJlkgJlIiIiIiIiIiIi
IiIiUiYpUCYiIiIiIiIiIiIiIiJlkgJlIiIiIiIiIiIiIiIiUiYpUCYiIiIiIiIiIiIiIiJlkgJl
IiIiIiIiIiIiIiIiUiYpUCYiIiIiIiIiIiIiIiJlkgJlIiIiIiIiIiIiIiIiUiYpUCYiIiIiUgw5
OTmYpml//csvv9CkSRMiIiJKbRtJSUkYhkFCQkKp9SkiUhpM0yQhIYGEhAQuX758p4cDXLlm5i6/
//67ve7zzz+3lzds2BCAlJQUDMOgVq1a9nYNGzbM04eDgwO1atUiIiKCtLS0275PcptER4O7e8F1
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
3XffAdCrV69i74thGLRs2ZKNGzcSGxtborSL10pOTubQoUMASmV7ox59FC5dsi2ffAJDh155/eqr
tllZVmvem90Wiy14ZZq2Z4VZLPDbb1fqt22DkJCCt1fS9mBL0RYeDi+8YAvW5aZ9LK6MDNt+iMj1
FXUtuB1i53k0AAAEjUlEQVTn+tXGjLEFxw0Dxo2znfvHjtnG8uSTN76fIvKXp0CZiIiIiNz1Onfu
TPXq1Rk0aBCxsbGsX7+e119/nREjRhSrHmw3YU+ePMnly5fz9Z+RkcGoUaP4/vvvOXr0KPPmzSMp
KYmAgIAbbrtp0ybeffddFi5ciIeHBzk5OeTk5GCaJkFBQYSGhvLEE0+we/duVq9ezfDhw/H39y/l
Iycid7PevXvj6urKBx98QGhoKPfccw/Jyck8/PDD1KhRg4iICL788kv7khvoeu2117jvvvvw8vJi
xowZhIeH8/DDD9OiRQusVit///vfATh58iRubm54/O9b/l26dKFp06YsW7aMsLAwQkJCyMrKYsSI
EfZZvAB79uzBMAyaNWtWov1p2bIlJ06cwGq1ljhQNnz4cNq3b0+bNm2oUaMG6enpBAYG2lPeSinr
1g0uXrSlXoyPh5074aWXoGdPqFTJ9syhp56C0aPh+HHYsgVmzLDNSMn11VdXZnQVp/31ODnBhx/a
njkWE1Nwm7NnbeOMj7fNSPn8c4iMtI1XRG7c7TzXo6Js150OHWyvMzJszzpzdAQXl8LTOorI3c8U
EREREbmLpKenm4B55MiRPOVHjx41H3nkEbNSpUrmPffcY44fP960WCzFrv/ggw/MChUqmP/4xz9M
0zTN0NBQ84svvrDXT5w40fTz8zPd3NzMJk2amAsWLLjuGK/XNjk52QTMM2fOmMOGDTOBfEvuNpOS
ksy+ffuaVatWNatVq2aOGDHCzMzMvPkDKCJlyoYNG8xWrVqZHh4eZs2aNc0XX3zRTEpKKrBtr169
TMD8+eef7WWrV682g4ODTQ8PD7Nly5bmv/71L3vdiRMnTMB0cnKyl509e9Z88sknzapVq5oNGzY0
p0yZkmcbqamppmEYpp+fX5FjT0xMtF8bLRaLuWnTJhMwDcMwL1y4YG7ZssUEzAYNGpimeeUaW7Nm
TXsfDRo0yHed9fHxMR9//HEzPj6+eAdRCjdrlmkOG5a/PCbGNLt0Mc2KFU3Tz880IyJMMzn5Sn1G
hmk++6xpenub5r33muann+ZdPyTENHv3Ln77q+3aZZpubnnLunUzzfbtbWMA0zxzxlZevXru08ls
i2GYZt26pjltWkmOgohc71pwK8/1q3XoYJrR0Vdenztnmj17mqanp2kGB5vmzp0l3SMRuYsYpnn1
PHcRERERERERERERERGRskGpF0VERERERERERERERKRMUqBMREREREREREREREREyiQFykRERERE
RERERERERKRMUqBMREREREREREREREREyiQFykRERERERERERERERKRMUqBMRERERERERERERERE
yiQFykRERERERERERERERKRMUqBMREREREREREREREREyiQFykRERERERERERERERKRMUqBMRERE
REREREREREREyiQFykRERERERERERERERKRMUqBMREREREREREREREREyiQFykRERERERERERERE
RKRMciqtjk6dSSytrkRERERERERERERERORPoEb1qnd6CLfU/wfGrK0hRhs1KwAAAABJRU5ErkJg
gg==

--------------N9CdUUGQr0Mj7r2exni1VNOa
Content-Type: image/png; name="wIto4RDoMX0WSvkF.png"
Content-Disposition: inline; filename="wIto4RDoMX0WSvkF.png"
Content-Id: <part2.ziiZ9PSu.0AfEsRCJ@windriver.com>
Content-Transfer-Encoding: base64

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

--------------N9CdUUGQr0Mj7r2exni1VNOa--

--------------0db7x1ReK4IGbdBO4kmj7xY4--

