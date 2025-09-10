Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CF3FCA0FED
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 14:13:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.18987.1757513582119689044
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 07:13:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=IjxWD9sL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1348cd1563=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58A62Ask3744095
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 07:13:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=E7PE1EnHYGtwDzRe47s+Lh
	A4qBjJTGVJdmQ94qg+fho=; b=IjxWD9sL/ZD66AP0MHMFRxIiUUjVn4DZBqCBtE
	5iB38Vb0jHs1K5MOJ+sje6iLwwOP9TDci8e3Gqr8Uqo9NznpaOZrZmu+7gYFmDPL
	mXZWnsSXKG8vRB01cnh+9uKE2FIB0D6EHEiJtMzMrPfslc/ihsdCkJqsD4EScs8s
	vBo3muxtpM6H5iGb3jBZ2067cSI8RDAJWj2ucWQd4gT6BhIPRi23B02r8E9KBqM3
	HcGrzf4/q1qEK9GJa3n9FL4vLwfRmscAIOdhwUjW9UB/TzOCyBcZN9USoLEvdhmh
	9k8FB2WKutLHyYiyIRf9VjhTH7emg9AW5pjTl9yOO/nsRwlQ==
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2077.outbound.protection.outlook.com [40.107.100.77])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 490mfg47nu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 10 Sep 2025 07:13:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A42wHUV+tit0zgFDnh1lV01BY6VXEZlhOspqJhMTqrGHDP6Kv74ih0Hja8sRwJQBRF+FiRN6+siwilb0x+49dqEK+gCpvR6SySZxjoT3qEsYKtj6Sbup0CcNhIAWttQR1o26f8Yi+GC88DoZ68lZFjRpgKIubNm1UZFocq/7dRd9dhdayP+SbT/CL+9RCfnibp+jCg0A7q1tY3J3tlB684zZltMu79EUfolpYovP0ON/Al/9pSW+sO3T8gi3JHO438d5oFLAQWwLkYzgNkZFyI1inW7Pbo1R+qhQzHn8K7juYdmEZi0QhN5M2FB98CruBqSQh6UPFNa/sUBnB7VV0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E7PE1EnHYGtwDzRe47s+LhA4qBjJTGVJdmQ94qg+fho=;
 b=qSYaw7DbHNh7gzYHQoWAOLfbHoi7o4x7mDiGRciyaJO5+q8efrcCHd0708mdVD01WrhX2kfzDIszLlboZMWpq7g6BFnWGtFBIM8yoZcotUC2YFQhfmXM+iArQEtiPWQigqa/MIQlbGU0xA86QtVr/72gZStMnWkxQYPii4fL7MBplo52p6H1+mCQFhJJxg/9LP5SvfOWINg5mNpg/Vepeyi1tzGrH9XlM+yzNR9wrhJx9p0f/mGgSM8XzHeG8/lY6XBvF7YZYM0RjWEd/by3wuHxIzdRRtgNqnFLoHrejza+XGUoX78VLedE20sLZFxNdR0Tuj6BlowuqYetvyvZOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by SJ5PPFBC9025319.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::84e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 14:12:57 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%7]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 14:12:56 +0000
Content-Type: multipart/alternative;
 boundary="------------TKYzCE2LSH6P0AwsgWkLfe2L"
Message-ID: <2bb8039f-394b-4963-bae7-10edeb817686@windriver.com>
Date: Wed, 10 Sep 2025 19:42:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Drop rust-llvm and use clang instead
To: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        "Kokkonda, Sundeep" <sundeep.kokkonda@windriver.com>,
        "Dora, Sunil Kumar" <sunilkumar.dora@windriver.com>
References: <29f1bfef-97ac-44bb-b2de-63661a38e814@windriver.com>
 <CANNYZj99rO9YpEUe1_sGBFXiaOA0dgoRMRK_AwgPKkaQWCnhfA@mail.gmail.com>
 <454f5ba1-09a2-456c-8df8-0a0fe441f6cf@windriver.com>
 <CAMKF1srZbQepXc5MAHphPARTu9XJFyQM-9fyotVX9bqA4LQNBg@mail.gmail.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <CAMKF1srZbQepXc5MAHphPARTu9XJFyQM-9fyotVX9bqA4LQNBg@mail.gmail.com>
X-ClientProxiedBy: MAXPR01CA0116.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::34) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|SJ5PPFBC9025319:EE_
X-MS-Office365-Filtering-Correlation-Id: ab27bb83-6b81-4fbd-301f-08ddf07423b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|10070799003|1800799024|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?b1QwNmQ0SEd5aXl6YU4xSEc1SHR6cklrNE1HR29BSTM0SGdMQ1lRTEdTdHhO?=
 =?utf-8?B?NHBoUDNVd1dKN2V4Snp4Y28zVW1EK2R1WW9qUlU2OGY4UUVFbzRJKzBCM1dN?=
 =?utf-8?B?TFpHbXordkZtWGl6NWZVYnpMeDJEL0NlYUZwOFVsTS9YQ1VaMXdhUXZzMXRm?=
 =?utf-8?B?VmhRQmZUTjlYZ2s3TmZFRzY4Y2NOZWU4cTRJZ1JEeVMxamdaSHVOcFpNZy9u?=
 =?utf-8?B?VDE4SU1qQkZEVHFSZWszVHo3Y2toaTNMaDE4YVNiTi9URUFWZGt6Tk05VXU1?=
 =?utf-8?B?aU8yYnZQWmdwM3RNOUZqYUx0WDNlR0ZidGF4RTJZTFdEQkhheGR0c1diN3Iy?=
 =?utf-8?B?OU5sLy93VEhKaSt0ZHBiUmpNdzY2dG9oVDV4Qm80b2pJUTV5b0swcXNTMFZy?=
 =?utf-8?B?MmdEVGdoRVc1b1JPdTVZVmwyK3RrbG1vUDI0VFhJZlphenhjMWFSTkJoYm5s?=
 =?utf-8?B?YWQ3bWxhSnM2WDZGcmxhRFo0VGZpaVVZeXFnVmlVK1Z1a0d5ZDNETFlOUWUv?=
 =?utf-8?B?VU9zNXpmSCtCQmlrRVhlNXA1czVDc3JlRVZSbHZKbFdZQ1pZYnc5ZFVMbXhk?=
 =?utf-8?B?alY2djJUd3h3SUxNUk4xZDF5ZllCYThUU3l4S0ZsUkpJSWdFNmRsYy9PS241?=
 =?utf-8?B?d1pvYUtVaGE2a2d0eFp5bzM5dDRwMHF3YlA0ZFllcnhKNGFNZlRPVUUrMDJa?=
 =?utf-8?B?ODRSZ1l3bzdMb3YzVmNaR1RucVhDczN2bWZjN1BZbTFldWQrNmNwN2FvNlNq?=
 =?utf-8?B?NkxlWk1ETWpFUjlFRlAyeHFOazAzeGZWeFJxM2NhNmpSN09iNlZYS1pVdVlu?=
 =?utf-8?B?U01GdEZpdW85cThLK294Rk1mNFR4d2VIb043ajFqQkRuYUhVZlFjWk4yQXZT?=
 =?utf-8?B?NTNSL3hqUTdMMWFlVW5mc0RTUW9aRjE3Mm5FVGlHNENqUWlzNjRNa2habngy?=
 =?utf-8?B?akJJS1krNVlYZnBFOFp0cUkvcDh3R3Uxd0JUSFpreVN1OE9WWjZLdGh6L1gx?=
 =?utf-8?B?aVNyMHhwYnN1elNKcDNWai9kalMxODBjODBSaWdJSnR0c2x5QXpBZFUrZ3N4?=
 =?utf-8?B?RlpKVlN3cGFJN1BwWFdaSWVyQXhUQWE2T2Nhcnk2bnBNeXpHMzNaTmdsczZX?=
 =?utf-8?B?ajBwVG5Hc3NYMEJXVVlrS1NzUHlEL1Q1Mm9WMWRVRkprT1gwTWJJVnJvZ244?=
 =?utf-8?B?QlE0SzlHOHRUbE92MjZDejJkYUJwcVdzSzExOENzWWU4ZndLSWZiSkZna291?=
 =?utf-8?B?cXJ3ODE3cm9ZL2JpOUhqL0xId3VldGRJUHpxeE5QRmRQU1RyWWxOejBvczdL?=
 =?utf-8?B?RjZsMThqWHNubWNGclJJZ3ZUem1qcWRIeU5zeGNjZklmTW1YWVdVMXYvcm1m?=
 =?utf-8?B?TEkzaEpvTmd1YnJJYmtoR0xGOG4vZlhPSHZPdG1lSlRxbjBNY1IxTXhpcHcy?=
 =?utf-8?B?UFhTRW55eFZUV21VLzF1cm1tYXEzQk43cnJ5eWdLeldXd290R05Yako0N3Vr?=
 =?utf-8?B?WWVlRUVsbHZBOHVHcTdQMXM2Qjg3ZHY2VC9ZRmZPQUg1cXpnZXNITXRSMlNE?=
 =?utf-8?B?TGJJVWhhcmxXc3kvdFRRVUxpSHArdDFmekNKdjVqMmQyakR1L0c4UlRHU0lR?=
 =?utf-8?B?TnBzVzkxdGluZ1VwYmRNTVdQMU5JcS84NXQ2ZlVmYnNibVFMc3FwaUtHWWph?=
 =?utf-8?B?a0J0dFgzS1NCSTU5bDZDLzZaVnltR2wza0lwUnNkQW5FcFpIQTI5azJEdFRJ?=
 =?utf-8?B?Uit0S0lxR3ltaHFyYkRYYXViajVYWDEvUG1aSTNDVTRiR0dFUlA3dnpQa3BF?=
 =?utf-8?B?VSs1WURHUE9BazRmWEcxdmRGd0hzc3JkY1A1ODN4V0pPeE9jNXRSQTJ4d205?=
 =?utf-8?Q?DB90/9cXVqeBD?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Nld3ZGFlVkVIMVF0eXkrVFpTdkluNlVmMHZCTGVXREE1NzNod0toVnduSnQw?=
 =?utf-8?B?Ukh0Q1M3Ujl4RkxzWGtDOTUrK0lWMFlsbk9kdkc4SlE1UGZhNXpuWjVhenNa?=
 =?utf-8?B?QTlEQ1pvdmk1UWNjR3ZYRDF2VXBTQXpuVXZsdkNHcnNIU2xmWGw2T3M2bkQ1?=
 =?utf-8?B?NjZNOW1HRjc3czdTUjRTVWR3c25qbkpxNlZMRXBNSEs0cHZObk5DV2NRNTJa?=
 =?utf-8?B?RFRGY3FqcmFWdW0wbGp1Z2xqSCtXTENIYjhSVmxHcmdraWo4emVZSU80aThP?=
 =?utf-8?B?UWhyS21ueE9Mdi9TK2p2NGpIRjh3endWWlczZGNDZ0kvOGRFcDZPaDR4Qk5N?=
 =?utf-8?B?SWY0dVgxRU1adTF6R3g3YzBUbWpPUXo1TTMvYktDTkoyNThrY3QwZmlIYkdi?=
 =?utf-8?B?NUlabnVscFZxV1I2dk1WZ3pHUEtlQXphY1QwSld2NGVSM1l4SnlLSENmTDFk?=
 =?utf-8?B?cUZQYU1nazRQaTVSTWxmVHBjVUtUcFJ0bEtuMXdPelhCVEUzRVU2UXpjVTFS?=
 =?utf-8?B?aFpQc3V6OUo3aUpGUGlrc0ZtTWRXcmdDbTBXcFgvMnRFWUFIMklxNW11MXZ4?=
 =?utf-8?B?bmU0b21DVm5mWTJocThXN09rU093MnI2TXpBOElkY0d4c25DQ2F4NU8xYjRk?=
 =?utf-8?B?VVlrOVQwaUM1SHBvZHk1RjIvU0NyWjUxaVBOc3RZUWNLMFptUlM2VTFMdlov?=
 =?utf-8?B?ZVdOeDBsVHEvVDdraWdYbU0zaUZTVUVXN1Y2Ry9QMGpMd1dKeUhqcVBrc2t1?=
 =?utf-8?B?QWpBWmtTMXkybXNJTktzRTNJOGpyRGs0anZTNTBnSytoOTIrODFLcWxDSFFt?=
 =?utf-8?B?b2pLWFRhQTE5ZUgrcm0vTUpCczlQWWlQUWl2aG9wZms5b21zaGdBM2owSXNR?=
 =?utf-8?B?VUxFUzRqYk90NXRHSUQrWWg4MkdnY0xXdHhGWDVSUHJYc2tRQWtIVUphZjNo?=
 =?utf-8?B?N1dWM0JXdGs1Yno0VU1qOGV6VE1lYXdBL0ErUXRSL3BmS0M5ZE1OcC9URklZ?=
 =?utf-8?B?aHcvdFROa25iZ1JlUy9GZmNpRU0rLzJHbE5lWTdEelkxMUlMU3FNSjJWbXB0?=
 =?utf-8?B?bFhIZml5TTFxMDRFa1kyeUdmamFYQ3lQTXJTV0x6TmpkVS83OFB3R0xoemh0?=
 =?utf-8?B?Y3VvMnBFNGFUWkF2M1FRMyttVGlLUmV3TlFFSkxEd1NFRjg0TmRNaVBQODdq?=
 =?utf-8?B?ajYwVjJ2TWV1Tjh5eWw3bEZSbU5XTmNmVXAwdVduU1YyYy9PU3dCWFQ0bFhq?=
 =?utf-8?B?R2U2MVpncUxPK3kxTmYvWHJReGdHZlRQVUdWS3lKd1UzUlpXS0Nlc2ZoM0Na?=
 =?utf-8?B?T3RheFY2TmVCQ2pQWXJwVUI2NERnUkIvUEw5UUtRQU44WWk5aDR5dDJIRnBE?=
 =?utf-8?B?Nzg1UllBVUhQU2dIUW1xRnhKeGZRVG4vcVp4K0dVaXZjMjRwaDlBRlVRZ3dB?=
 =?utf-8?B?ZzJySnB2YW0weWo4UHhDalJkSmFrTHVZL0QrcUxHTlU0RFhFY29qWmJTT0Ft?=
 =?utf-8?B?dFR2aFlXcWtGRzJncmF1YTRqamRXRWd4bGg0ZU50TFpEZ1YrVUJHdDFRQmJk?=
 =?utf-8?B?cDVQakNtSzlMb1FmZTJFNE9oMzNKM1c2N3J5aHB1L1hzR2NkajVVUXJtcGRy?=
 =?utf-8?B?L0l0cU0vOFJRakZiQXdLN0hDK0FTNWpMb2RrekVGZHJBNkYyMHZuTTlPdFdK?=
 =?utf-8?B?MkkxS2xxbFlyNUJaWXByTWN4UEVBNGNPcGRzOWgyaTVwc200dElDbWV5bm1s?=
 =?utf-8?B?Mk5ydmxXV2s4MTVZRGRnb0dxSUlmMldTRVVUNHlhdGZnTmlGMGpDRHpYV3VV?=
 =?utf-8?B?Tk5CZ1ZSSXJMcVMrNEhkZzRQSkFrR3hDak5VeDVlZ3ptNEl4Tm83L200WmhD?=
 =?utf-8?B?TEZCQlRvK3RPMVBtaHVYNXpWYzF6cVAvdmVYcHlmakxDZlBrVUFDallqWW5D?=
 =?utf-8?B?MGtYdlZrSHZIQ1RjL2U2YUZYcHdiamxGZ0pFUEhETTF4Y0VZWWVwaEtmNndL?=
 =?utf-8?B?Q3MxMzhpS0k4azIzZWVyOGNCcXVLakVkYXZjZVBkYkNuSU9LYXpUeVYvTEtP?=
 =?utf-8?B?SWJCbVJ3NzJQV09jM1JwRHFOM2p1c3JzVkdrS3FJZ2QwZTVVRlpCZEd1OVVt?=
 =?utf-8?B?QXoxL1BUc29zNkhrTEFna0prNStRNVBuSzhCM1MrVEVyc3pMUUQxUmdXL0dl?=
 =?utf-8?B?OVp0Q0ZQYy9OU3ZFb3RSRjYwak1MWFNoSGFpTHpncUZWWTJKZW9xbkJYaDAz?=
 =?utf-8?Q?wmboKyePBLvb1XPZb1m3bgjBQHChnWwZSp6qkRjiEo=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab27bb83-6b81-4fbd-301f-08ddf07423b7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 14:12:56.7948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KanGGN1vzwtAuPHUZJQZeUmDIHqccM3pD8BZms9EXwTIr+s4imzhDNRXekeStHtzUDDGLx9CdXD3exeCNLs6vmcSbau/zX4Ttl7SAnByf0etvOGlVKfVgb87oK85uacP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFBC9025319
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: Vcel5YpPj7rEiDcI1klm3OXKhWDl7dnr
X-Authority-Analysis: v=2.4 cv=d+v1yQjE c=1 sm=1 tr=0 ts=68c1876d cx=c_pps
 a=Rm1dGHnBZ3gR68Io0UZYpg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=iGHA9ds3AAAA:8 a=ei4SEBeUAAAA:8
 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8 a=z8vU8Gr3U-nLPclttLsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=Hqou25T6mLgA:10 a=pGLkceISAAAA:8 a=52mdeZd8sWgJSgSe30wA:9
 a=LLqZvv_BRlVComUU:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDEzMSBTYWx0ZWRfX4w2uSFL+W/S5
 R08DCsT+dTvPuNgiUUaq+HYUuzbTlU0F9cqNYa+PBs5YmrvbqcJjBdZxhDi+z6oBUAjwaYIC1cG
 vAqiXXKknUDf9ddiU4Zv7dD0BD1fzJ53OHLfHFhl8il5dekm04eQDONgRgxrN4UibLbMlLjcHnn
 8ntpOEAqxrEh0pB6ETwHzW/m/KKv1hJcA7WlRlHdCSKbDPGlqMdMkBuT7171tn9Ljt0oHlJRmBr
 Q2Y0PeQ9P5aS6hcHxWJHcr3jwwg3VoX259OwFvv76aRVM+XEZcWeBqdPLz9uC8SOOjS6YeWPJ2W
 CQyX3X9Dyu+8rZwxG/twyHSKf7iSILtwP56FIGWdoxKLLQCw7EmcYPsW4h8iLc=
X-Proofpoint-ORIG-GUID: tGnKv3bCKqOH6OO1zNRRfCpwTvKbOjKI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_02,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 clxscore=1015 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 14:13:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223218

--------------TKYzCE2LSH6P0AwsgWkLfe2L
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 58A62Ask3744095


On 09-09-2025 21:44, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Tue, Sep 9, 2025 at 1:19=E2=80=AFAM Deepesh Varatharajan
> <deepesh.varatharajan@windriver.com> wrote:
>>
>> On 28-08-2025 18:33, Alexander Kanavin wrote:
>>
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender=
 and know the content is safe.
>>
>> On Thu, 28 Aug 2025 at 13:45, Varatharajan, Deepesh via
>> lists.openembedded.org
>> <deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
>>
>> We have removed rust-llvm and updated the Rust build to depend on Clan=
g instead.
>> With this change, we successfully built Rust for both native and targe=
t. Additionally,
>> we ran a full bitbake world build without encountering any issues afte=
r dropping rust-llvm.
>>
>> We now add these flags "-C link-arg=3D-lz -C link-arg=3D-lzstd" becaus=
e of this following diff
>> otherwise we will get errors during link time.
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
>> You can find the relevant changes on the poky-contrib branch here:
>> https://git.yoctoproject.org/poky-contrib/commit/?h=3Dharish/rust-llvm
>>
>> Differences seen in builds:
>>
>> with rust-llvm for bitbake rust
>> real    54m54.184s
>> user   0m13.470s
>> sys     0m1.380s
>>
>> f/s usage
>> 41G
>>
>> without rust-llvm for bitbake rust
>> real    57m51.015s
>> user   0m18.129s
>> sys     0m2.051s
>>
>> f/s usage
>> 45G
>>
>> We are open for suggestions, improvements, or concerns regarding this =
change.
>>
>> Thanks for checking this! Is it possible to have a conversation in the
>> rust upstream about starting to use proper clang, or reasons to
>> continue using rust-llvm? Maybe there's a ticket or you can open one?
>>
>> While 'proper clang' appears to work now, deviating from what rust
>> developers do is risky and can cause problems.
>>
>> Alex
>>
>> Hi All,
>>
>> Summary of discussion with the rust upstream about using latest LLVM i=
nstead of Rust maintained LLVM fork.
>> https://internals.rust-lang.org/t/can-we-use-proper-clang-instead-of-l=
lvm-fork-what-rust-uses/23489
>>
>>
>> Upstream LLVM is generally compatible:
>> - Rust does support building with upstream (vanilla) LLVM, especially =
the latest major release and the one or two preceding ones.
>> https://rustc-dev-guide.rust-lang.org/backend/updating-llvm.html#updat=
ing-llvm
>>
> Thanks for the discussion, I think its expected that there are rust
> specific backports, but it seems its not a whole lot of patches with
> llvm20
> and I hope things are just getting better with future releases. We
> need to ensure that such patches are not regressing clang if we do
> that sort
> of backport, hopefully there will be no conflcits.
>
>> Things to note when using Upstream LLVM:
>> - Rust may include cherry-picked bugfixes in its LLVM fork and so usin=
g upstream LLVM might lacking bug fixes from rust's forked llvm. (But,
>> this anyway we will catch it up with newly released rust update)
>> - If a bug shows up using vanilla LLVM, it's on us to track it down un=
less it's a known issue. (In general, the latest llvm is always under tes=
t with
>> rust nightly builds)
>>
>>
>> Impact on Yocto Rust upgrades:
>> - Rust upgrades shall always check for updates on rust forked llvm and=
 backport the relevant patches to clang's llvm.
> right
>
>>
>> Regarding the rust forked llvm local patches:
>> - There are no local patches on rust forked llvm other than the backpo=
rted fixes from llvm master.
>>
>>
>> Do let us know how can we proceed on this.
>>
> I think we should go ahead, we have llvm-21 already in final stages so
> that might be a bit to address, do find out which version of rust will
> use llvm 21.
Rust 1.91(Nightly) is using llvm 21.
>
>> Regards,
>> Deepesh

1) d35840afa50d [rust] Add CI Checks to Rust fork
=E2=80=83=E2=80=83- This patch adds CI monitoring for PR statuses.
2) 801294e8f616 [rust] Changes needed for 'x86_64-fortanix-unknown-sgx'=20
nightly target.
=E2=80=83=E2=80=83- This patch enables libunwind to work inside SGX encla=
ves (target:=20
x86_64-fortanix-unknown-sgx)
by replacing all OS and libc dependencies with Rust-based equivalents,=20
allowing safe stack unwinding in
Rust SGX apps without relying on pthreads, malloc, or standard I/O.

https://rustc-dev-guide.rust-lang.org/backend/updating-llvm.html=20
<https://rustc-dev-guide.rust-lang.org/backend/updating-llvm.html>

These two patches are specific to the Rust nightly forked llvm and have=20
not been carried into the stable
branch or official release tags, where only bug fixes backported from=20
LLVM master are maintained.

The backported bug fixing patches from llvm upstream applied on top of=20
the Rust forked LLVM (v20.1.7)
for Rust 1.89 are already present in the upstream LLVM 21.1.0 tag. With=20
the poky master-next branch now
upgraded to Clang 21.1.0, I was able to build Rust 1.89 successfully by=20
depending on Clang.

Can I go ahead and submit the patch to delete rust-llvm after the Clang=20
21.1.0 upgrade is merged into poky-master?

Regards,
Deepesh


--------------TKYzCE2LSH6P0AwsgWkLfe2L
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 58A62Ask3744095

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 09-09-2025 21:44, Khem Raj wrote:<b=
r>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1srZbQepXc5MAHphPARTu9XJFy=
QM-9fyotVX9bqA4LQNBg@mail.gmail.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

On Tue, Sep 9, 2025 at 1:19=E2=80=AFAM Deepesh Varatharajan
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:deepesh.varatharajan@wi=
ndriver.com">&lt;deepesh.varatharajan@windriver.com&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">

On 28-08-2025 18:33, Alexander Kanavin wrote:

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

On Thu, 28 Aug 2025 at 13:45, Varatharajan, Deepesh via
lists.openembedded.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:deepesh.varatharajan=3D=
windriver.com@lists.openembedded.org">&lt;deepesh.varatharajan=3Dwindrive=
r.com@lists.openembedded.org&gt;</a> wrote:

We have removed rust-llvm and updated the Rust build to depend on Clang i=
nstead.
With this change, we successfully built Rust for both native and target. =
Additionally,
we ran a full bitbake world build without encountering any issues after d=
ropping rust-llvm.

We now add these flags &quot;-C link-arg=3D-lz -C link-arg=3D-lzstd&quot;=
 because of this following diff
otherwise we will get errors during link time.

Setup in rust-llvm
-DLLVM_ENABLE_ZLIB=3DOFF \
-DLLVM_ENABLE_ZSTD=3DOFF \
-DLLVM_ENABLE_FFI=3DOFF \

Setup in clang
-DLLVM_ENABLE_FFI=3DON \
-DLLVM_ENABLE_ZSTD=3DON \

You can find the relevant changes on the poky-contrib branch here:
<a class=3D"moz-txt-link-freetext" href=3D"https://git.yoctoproject.org/p=
oky-contrib/commit/?h=3Dharish/rust-llvm">https://git.yoctoproject.org/po=
ky-contrib/commit/?h=3Dharish/rust-llvm</a>

Differences seen in builds:

with rust-llvm for bitbake rust
real    54m54.184s
user   0m13.470s
sys     0m1.380s

f/s usage
41G

without rust-llvm for bitbake rust
real    57m51.015s
user   0m18.129s
sys     0m2.051s

f/s usage
45G

We are open for suggestions, improvements, or concerns regarding this cha=
nge.

Thanks for checking this! Is it possible to have a conversation in the
rust upstream about starting to use proper clang, or reasons to
continue using rust-llvm? Maybe there's a ticket or you can open one?

While 'proper clang' appears to work now, deviating from what rust
developers do is risky and can cause problems.

Alex

Hi All,

Summary of discussion with the rust upstream about using latest LLVM inst=
ead of Rust maintained LLVM fork.
<a class=3D"moz-txt-link-freetext" href=3D"https://internals.rust-lang.or=
g/t/can-we-use-proper-clang-instead-of-llvm-fork-what-rust-uses/23489">ht=
tps://internals.rust-lang.org/t/can-we-use-proper-clang-instead-of-llvm-f=
ork-what-rust-uses/23489</a>


Upstream LLVM is generally compatible:
- Rust does support building with upstream (vanilla) LLVM, especially the=
 latest major release and the one or two preceding ones.
<a class=3D"moz-txt-link-freetext" href=3D"https://rustc-dev-guide.rust-l=
ang.org/backend/updating-llvm.html#updating-llvm">https://rustc-dev-guide=
.rust-lang.org/backend/updating-llvm.html#updating-llvm</a>

</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">
Thanks for the discussion, I think its expected that there are rust
specific backports, but it seems its not a whole lot of patches with
llvm20
and I hope things are just getting better with future releases. We
need to ensure that such patches are not regressing clang if we do
that sort
of backport, hopefully there will be no conflcits.

</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">
Things to note when using Upstream LLVM:
- Rust may include cherry-picked bugfixes in its LLVM fork and so using u=
pstream LLVM might lacking bug fixes from rust's forked llvm. (But,
this anyway we will catch it up with newly released rust update)
- If a bug shows up using vanilla LLVM, it's on us to track it down unles=
s it's a known issue. (In general, the latest llvm is always under test w=
ith
rust nightly builds)


Impact on Yocto Rust upgrades:
- Rust upgrades shall always check for updates on rust forked llvm and ba=
ckport the relevant patches to clang's llvm.
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">
right

</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">

Regarding the rust forked llvm local patches:
- There are no local patches on rust forked llvm other than the backporte=
d fixes from llvm master.


Do let us know how can we proceed on this.

</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">
I think we should go ahead, we have llvm-21 already in final stages so
that might be a bit to address, do find out which version of rust will
use llvm 21.</pre>
    </blockquote>
    Rust 1.91(Nightly) is using llvm 21.
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1srZbQepXc5MAHphPARTu9XJFy=
QM-9fyotVX9bqA4LQNBg@mail.gmail.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">Regards,
Deepesh</pre>
      </blockquote>
    </blockquote>
    <span data-teams=3D"true">
      <p>1) d35840afa50d [rust] Add CI Checks to Rust fork<br>
        =E2=80=83=E2=80=83- This patch adds CI monitoring for PR statuses=
.<br>
        2) 801294e8f616 [rust] Changes needed for
        'x86_64-fortanix-unknown-sgx' nightly target.<br>
        =E2=80=83=E2=80=83- This patch enables libunwind to work inside S=
GX enclaves
        (target: x86_64-fortanix-unknown-sgx)<br>
        by replacing all OS and libc dependencies with Rust-based
        equivalents, allowing safe stack unwinding in&nbsp;<br>
        Rust SGX apps without relying on pthreads, malloc, or standard
        I/O.</p>
      <p>&nbsp;<a aria-label=3D"Link https://rustc-dev-guide.rust-lang.or=
g/backend/updating-llvm.html" id=3D"menurh3e" href=3D"https://rustc-dev-g=
uide.rust-lang.org/backend/updating-llvm.html" rel=3D"noreferrer noopener=
" target=3D"_blank" class=3D"fui-Link ___1q1shib f2hkw1w f3rmtva f1ewtqcl=
 fyind8e f1k6fduh f1w7gpdv fk6fouc fjoy568 figsok6 f1s184ao f1mk8lai fnbm=
jn9 f1o700av f13mvf36 f1cmlufx f9n3di6 f1ids18y f1tx3yz7 f1deo86v f1eh06m=
1 f1iescvh fhgqx19 f1olyrje f1p93eir f1nev41a f1h8hb77 f1lqvz6u f10aw75t =
fsle3fq f17ae5zn moz-txt-link-freetext" title=3D"https://rustc-dev-guide.=
rust-lang.org/backend/updating-llvm.html">https://rustc-dev-guide.rust-la=
ng.org/backend/updating-llvm.html</a></p>
      <p>These two patches are specific to the Rust nightly forked llvm
        and have not been carried into the stable<br>
        branch or official release tags, where only bug fixes backported
        from LLVM master are maintained.</p>
      <p>The backported bug fixing patches from llvm upstream applied on
        top of the Rust forked LLVM (v20.1.7)&nbsp;<br>
        for Rust 1.89 are already present in the upstream LLVM 21.1.0
        tag. With the poky master-next branch now&nbsp;<br>
        upgraded to Clang 21.1.0, I was able to build Rust 1.89
        successfully by depending on Clang.</p>
      <p>Can I go ahead and submit the patch to delete rust-llvm after
        the Clang 21.1.0 upgrade is merged into poky-master?</p>
      <p>Regards,<br>
        Deepesh</p>
    </span><br>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1srZbQepXc5MAHphPARTu9XJFy=
QM-9fyotVX9bqA4LQNBg@mail.gmail.com">
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------TKYzCE2LSH6P0AwsgWkLfe2L--

