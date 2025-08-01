Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDD24C87FD3
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 02:08:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.78575.1754014088877285683
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Jul 2025 19:08:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0308d9517b=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 57126qNp2677383
	for <openembedded-core@lists.openembedded.org>; Fri, 1 Aug 2025 02:08:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4888htrpm3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 02:08:07 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 571287HV2678893;
	Fri, 1 Aug 2025 02:08:07 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2083.outbound.protection.outlook.com [40.107.92.83])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4888htrpm2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 01 Aug 2025 02:08:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KcP2dS1AhR5uD8MaKXQDTw+T5AVfAdv83+64ht/b12Dc9NQ/JUKEsc/uIkWf29K3CuMrxRHhy4Uc3H66F4wE0u297TN9RkHon7OMIEA6XsyQB+tDUF5YV1YbMQop/Jn1gfaGrNZWGuKXrn6t3FrEyxlLhkXAjU/ywIyWTzTa8HICI34pyM0ToJZjg9tSCPakt6yXTJaOtQQPb93EVljdr4doxYCtdS+ayZkIuf3IiyXJEHI/jowsr7er+Ozue5bRSfLURA+GdapnLYtApH5ZLvNwQ/HfbvOl23geIO2Qarr6ZGIvfHNXe7LT1Lk7+Cl04uwfscQzH303FridZWzJBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1cdKnMFLhE44j+s0GpMVbvcXkYeNjVa8A5dToAmlRmU=;
 b=yjCoS35tJvPJStTk8+nH5FxMaw4SW7q1ZYVEClfNUERT+Ej4Bk1MoEqwMdAwlgftY675A5irL7guyrLVswK1I87k5KN1VrRzCQ9PfdPOzwbnra9TzXzVX35wPUYyGWouwpRsXaJZEzTiXrhBrGaG1r4LKw3qxDewkeAU/LnH1HqDmA9HZ/rR7PysC4j8iXIGxPCQVqMuNeVuAEe3UQnBMhKrxD24VDvl9E8uQBAWoy5yQl+0BFIm1gICzcH++7gh0YnKcNH8pypdWL+m2haKxDPOYCyZTkRaqWYVlf09jDdjHKv4w2sdxnGZNHqQeY+rd2M3NwzJ1VLLtlQquGtrYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by PH7PR11MB6008.namprd11.prod.outlook.com (2603:10b6:510:1d0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.14; Fri, 1 Aug
 2025 02:08:04 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%3]) with mapi id 15.20.8989.013; Fri, 1 Aug 2025
 02:08:03 +0000
Content-Type: multipart/alternative;
 boundary="------------ZKBHNL5seBWhsd0ZA2BGZKKr"
Message-ID: <6e93a032-4a03-480a-a319-bbee55b76825@windriver.com>
Date: Fri, 1 Aug 2025 10:07:56 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] perf: improve fixing for buildpaths QA warning
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>
References: <20250730014258.3962647-1-changqing.li@windriver.com>
 <6EFFF8DB-D5A5-463F-A8F0-5AB6CED660DA@arm.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <6EFFF8DB-D5A5-463F-A8F0-5AB6CED660DA@arm.com>
X-ClientProxiedBy: SG2PR03CA0126.apcprd03.prod.outlook.com
 (2603:1096:4:91::30) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|PH7PR11MB6008:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f967242-2bc8-40bb-c572-08ddd0a03f60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OTh6SVVGUkJnSE9ndm9zNkhHSWdCdzZsUVZHd0FlN2h6cUJBL1dNZUJnMVRL?=
 =?utf-8?B?Q0tEdURhU1k3ZmhLVE9naFNHTGhwdmZ4MzVaczErNzZ5TzVMMWJlT2wzaWd1?=
 =?utf-8?B?NUxmS3ZzK0V3WHlhaGRwMFlkQUZFZk05bUlXWUJVWDBCMXlHRGJSekgwUTZr?=
 =?utf-8?B?SFlKYThCRVZCS0FqbHpia0tNb0VuUmlQSGw4R0VxMTdhVm9TcU9qM25FOTJL?=
 =?utf-8?B?L0o0L3NZT0QyaktXQkIvQ29VVFZJVzFBV2R0cCtJQ1JhNkxCdEhVSWgvWWp3?=
 =?utf-8?B?KzhtOXZVWW5KQmIrME4zdGlmclBweFhqdW44Wmx3UStGNGVKQys0R1JzSkFW?=
 =?utf-8?B?NEJiMzFEeWlVeTBIVm1ZZ2t4QVN5MlI5alloaldQU3pnQWMrRU5DSjNObDJB?=
 =?utf-8?B?WUg4bFV5cFNBRGZVenpmeExqSFQyeUlaUENnMkR3OFo3M2pZV3N0ZzZZS1NO?=
 =?utf-8?B?Zm5yUXE0ZXFjaFc5YWhkK3NnVktsTURPd3BLeVJ6Ry82Unl5MW9oMk9HSUNQ?=
 =?utf-8?B?dldsdXZqa2lwNlJaeDV0UEVFNnJ5emFPbXozM2creHhYdTVIWW5RQmlsVWQ0?=
 =?utf-8?B?WGQrZm1PSXEzcUpDYWxiOGNjN1dtWFFOT2VaZ0VQSDVkaWRhUldGWkhneE5O?=
 =?utf-8?B?Q1c3VGxoRXBudi9PU0kwdEZZN2tTRHp4dlM0SzBXL1gvK3FWcjRNVThBZXRi?=
 =?utf-8?B?ZHZ3TUVPMk8yRjM4K0JYU1hQaXZ5cGord2h5Y2NBUDhSVTFUTUtIdTg5RHJt?=
 =?utf-8?B?RVhQTE8vd3VQc000Y3FlTWczU2hkNnIvZ2lkLy9DOXVVcVVEUnNyT1FrTk54?=
 =?utf-8?B?emhyVmJ4clVuTzluSTl5MlcrR3ZzYU9FNXpvZklyRGFsVVdzcWx5cElsdysx?=
 =?utf-8?B?eWdCSzl3WDVKbDNpTVBKd1UvcVRsUkVTbGNUSml4UWtsTmRaOXVtNUxqbSt3?=
 =?utf-8?B?VWhDNCtrWTNueUxocVlUV0VXQTBnbFoyZkxFd3FTb1REUytmWlFOT1g0QlFV?=
 =?utf-8?B?Q1MyNGc2K0toUlo3ZHgyMFE3NFVUM2JRVHhUS0svejFWQm9LcVoxbitIbmZw?=
 =?utf-8?B?VzVrTjJkNU9PY1FnVDhEVk9ybUNwMFNKei9qejhQT3duS0JVOWNLNUJnUjBq?=
 =?utf-8?B?Um1xN0JtVk9nZ3R5aE9STmtJZzUvVmVNNWZWcUc4cVJMOENRSHpDVHNGdE9x?=
 =?utf-8?B?NnpwY0FVd2RsbFdHazE2M0NEWnNsV1lsaDBGWmFoeUtlRTFERkNFdjJBVDg2?=
 =?utf-8?B?SVRFWTdVTUd0U21YbVQ2NG41SVh3dEZFejBKdGhKcnBDaTdHV05RWm5weTBx?=
 =?utf-8?B?N2tyK3cxdm1Sbm10OU8zNEJNUW8yL0xEN0M2bVhpbndDY3JvU09KWm5qeFZj?=
 =?utf-8?B?RVQraEdZQkZ0NDRMdjcyTzlNTjdBN3p5ZWdqTC9MRU5vL3AxTFZ1eGEzRGor?=
 =?utf-8?B?dDR0dDdya2k1VUl4ME1UUml4eTg2REdaTUg2OEMxYWlLRWIrOVhLSm1OYWVX?=
 =?utf-8?B?QVBicTNZVkhPN3ZWYzV5bTN5K01ZVHNuNjdDaWRmQ3N5Y3dWVkZKYkZLNTdk?=
 =?utf-8?B?SXNJQWFYVnV4eHhxeWo4ait1NWI4SkthTzlpeGdZUGk4NVc0SEJKcmNHclFy?=
 =?utf-8?B?OTk0OXRHeHJPM2x3VExxK1ZPbytuakUxaUZaczYwQXFXRUdQMXB5ZUhBQ0Yv?=
 =?utf-8?B?b2NhY1dGYXFvWkhENkRBVWhSZmFHYUh6V1J6a3VpU1E0amR2azB3NmN5cm1D?=
 =?utf-8?B?c2srcVo4UjczSzBINFJQRzlaMVc1NTdHN2xKVFg3TUNoUE9sbnV6YkhBaVg3?=
 =?utf-8?B?bmhYb0VzcnQ2SVhlR3BKSWVVUG5sTG9WOGVuNTVUd0o5KzJqT3kyQ0N1WHFZ?=
 =?utf-8?B?c1dvTFlZTU1SbkdDSkFDQUlUVE5iSWtKSWswOWpka2dRNWp5RzZwclhOZitq?=
 =?utf-8?Q?+jAh31gJDwk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bVhPcU9zNmNDTWlnK05QNnRsN2pEWW5rdFpQNkJWUXJBL3VDK1RMUTVCYk1F?=
 =?utf-8?B?TlNSd3E3U0ppREdnMGJyaEppUG96Z2d1SnhTMFpBQjNVc2pBVHR6T25vMFQz?=
 =?utf-8?B?Nmgxd0lUVHhyaTdjdWxqaVVqK3hZK1Exc2JjV2FlczVZek9xSHRGYXd6NHUr?=
 =?utf-8?B?cy95SFUxdmg0SnRYYkZpT2R1ZmVwa3VqWEhsUDJNTVJyek5zemoxZTR3Mld5?=
 =?utf-8?B?cEpneU5uUEZiU0JxcFByZjNLQWNCWDBCSFRtVlBKcDErSVdnSXgyS0Z5WWs1?=
 =?utf-8?B?YmV2NFJtQk5ZQkY5Qzg3U1dYQVFBeC9RZnJpbFNCcWlQSzZlLzgyUGxzKzJI?=
 =?utf-8?B?MlczaXcyL3lSbzhiamYwN1Y3cnZqSXdTeWhXNHl5R0VxSUg0alpldHZUV0Zn?=
 =?utf-8?B?MmNscXFyc29GdUw3WGdJQ0xvMHQ1S1BsUXgvOTZ0dGgyVDRnYXFPUkhtSVRn?=
 =?utf-8?B?M2xXdjl3Q2l4ODYvTVRhWG92OHhmQ2N0OUhDbEZHei9PNUFKamQwdndVSWV1?=
 =?utf-8?B?S25pVzRLUmVzNE92cUlkck5Wekt4RFJlbUVOcDdQVzArekRUSjc5QzZMN0U4?=
 =?utf-8?B?VXkyekM2SEIxTFE5TTF5OGRERFVUL2Z6U0YxS3FJbGdQeVVVZDVlNmM3cDFq?=
 =?utf-8?B?U1V3V1JRWEdFaCtiUlZxMFFIalY4eVdHbng5NjJEbDdMQkJ5SldKZVI2NFVh?=
 =?utf-8?B?cGRQeitOZDJUYnBrUDcreVhiL0loamdKRHNXUVB0bVNFZnBGaElFenBOeS9Z?=
 =?utf-8?B?TVFGVGpiOWpiZEFpNStNT1FhemR6TTZsdUJneXdrelhJcXV6UktkSXJrZTJz?=
 =?utf-8?B?WjF4T2dzc2cwR01sb3pVeGdJM1ZRY2RUYWRKbUVHOGhxYjliQlkwK2JlOGJk?=
 =?utf-8?B?UGw0UkMycVRCRVhjMWJYQU51dWo1OFhLNDlqYTFReEZrMkVNYTZtcWY4RVBF?=
 =?utf-8?B?V2UyUElSeW9mSU9WeUhSbXgwck42Q1RoQ2lvN0FGTUhMRTRVUjZueEMvMzlj?=
 =?utf-8?B?NHRUMGY4VUI0d21LUUZoUDlVVGFlRUljR29JSW1SMzY1aFFxa0pwMHVxNjJk?=
 =?utf-8?B?K0srbVlFNDI4ZVRCRzM5b3hBVkR2M1ZWVlh5ditxOWhBTnlRclZoQ0ZYcWlH?=
 =?utf-8?B?VmJ6MWdVWDkzU2tqUHZ3cDFvL1g4VitYL09PRy9GZ0dEKzhKem1Jd2huNDZn?=
 =?utf-8?B?ajNMa2J2L3gvSjkxMFIydXlIcS85bkl1MkIzOTR0U0RjQkdxRk5lZlc5VDFY?=
 =?utf-8?B?MjVOTEpTczVzak9CTk1GZENiY0JUMk9ORUhnUVQ0dmNLelA2akc1YXpmYjdj?=
 =?utf-8?B?UXdtakZmRzlTVDJldUJ4T1kwbk1Eb1VpbVVUZFNoWEdLSWVDd2FnSzNQYmRh?=
 =?utf-8?B?TnRRMXlIWGpxYStzY3MvcElTeHFISTFJTDVSc1YyRzhBUXRaVzVIY0VqS3RE?=
 =?utf-8?B?TTR0YWd0a1E5VXRLMzVSZlFZbktTOFhBQjhRVDVTZDVCL0dzMmd4Q1oyTTZ5?=
 =?utf-8?B?Smc3U2M2eFFMY2hnOUdJclA1ckdTbkhLZ1lkTm5jWExjV0duTStuMkh3SXVr?=
 =?utf-8?B?Z2xUeFk4Um12OHpuaHh5a2RFYzRMSkpwbC93SzVxa0Jrb1g5K0lBaEhMTXBx?=
 =?utf-8?B?cVF2NitUR1RZcHhManU3OFJIMEIzWDB3SlJMWDVtcmZnbnh2Y2tVUGMxa1pB?=
 =?utf-8?B?L1VVUWxXU2VMRzI2SGJwSDlYYnpkKzR0b2RPNnQyek1ERzlhaFNDd2NKNGVV?=
 =?utf-8?B?ZmJ4b3UwK0Jqc2xtbjRDbWZENXpqdGJ0MDBKdExJVkREd2FpWGE4LyszWkMy?=
 =?utf-8?B?eDFCM1pmSHhHNVJpL2RLaE9iNkpqWU1NcEw1NGo0K1F3d2pUalRWcWFyVDk5?=
 =?utf-8?B?czRIZGZTTDNkR01aSE5qbHN2NVVxNU9NaEE1Y05uZmJubDdNQVc2Zmk2TzAr?=
 =?utf-8?B?Y3gzWjEzWlR6V1N0QkF5Z3VOUmVuVVhXV29Mc1dQMWU2Y3BXSHFzdlRPdmg5?=
 =?utf-8?B?c0RBMjQwRE5SOHZSMHphcVlNK0gxdCtydlAyOTJxTVNlWWRFbVVQaG52My8x?=
 =?utf-8?B?MFRuY096ZzI4YVFvZEVRTjNJS3duTkg4MHgxN0VCc0k2N29iTVNwRkgzaE14?=
 =?utf-8?B?THcrUlp0MWNWZTR3dzRDWG1jVS9uVWxNcDRDcy9yT2ZGcmRyc2RISDhwZjNm?=
 =?utf-8?B?YUE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f967242-2bc8-40bb-c572-08ddd0a03f60
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 02:08:03.7038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fH4Z7Ng6EdMZ7WDmIHe6IoATpioAVlsyNBIA3sI2yOPN78MlD9d+CfzWN9W7nATyIE49lJcHSmoYl/RO8jBWCuRgZA2iSjrmK/PSYd5QhME=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6008
X-Proofpoint-GUID: k7vFskd-HxfM7yGYPYmfgxwLLdoqjoMZ
X-Proofpoint-ORIG-GUID: q0kRWneTxz8UCRUUy_2yJmTh1s8jCp5w
X-Authority-Analysis: v=2.4 cv=ZtntK87G c=1 sm=1 tr=0 ts=688c2187 cx=c_pps
 a=glwKbk3EqpzANxFx8SABCw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8
 a=Q4-j1AaZAAAA:8 a=tp-0G4Oy1sD-0NHJIoAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=7CQSdrXTAAAA:8 a=wvPkM9v7g1_ikmSEda4A:9 a=0nssUtToHdHv3PpT:21
 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=FdTzh2GWekK77mhwV6Dw:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDAxNSBTYWx0ZWRfX2S6mESo4sWCf
 sDTK3T7cJu0vsiXKNP8wklxlnjq4Nzuz4ziszZIibzSPb1f414MPShyON16WmJ4jUbq7H96kl1p
 sSG8giFy2U1rc+RThLFcach0luN1PI+hOOdW9HxYfgEAMS22i4mBi/CLvE0Kz0gtMOC7nqzbwp6
 nmATuHjtfBeNbSlUPw4hkSKwwg2lQ5Gwi7qqWEO2UflIAwm5UREOBMrRxE2cSpWWLkPF1Io+0C+
 Z5sFmajV0vboLuQt5LxZjtFD1qoDV/dLl1R1iAzG8Dbf+AyRVEkC1KRVJrZ1bfYzSxtbVaL059J
 TWl3B5+5aL4AFAob6QLBFV86P+zypAZics8+Z47QNAieD4gKj/5Ixl6ORUkW/uSK+8Q9bFK3HIm
 PattgO6J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_04,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2507310086
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 02:08:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221209

--------------ZKBHNL5seBWhsd0ZA2BGZKKr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 57126qNp2677383


On 7/31/25 17:38, Ross Burton wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On 30 Jul 2025, at 02:42, Changqing Li via lists.openembedded.org<chang=
qing.li=3Dwindriver.com@lists.openembedded.org> wrote:
>> From: Changqing Li<changqing.li@windriver.com>
>>
>> if O=3D${B} is removed from EXTRA_OEMAKE, perf will compile failed wit=
h
>> error:
> Why would you remove O=3D${B}?  That would cause the build to happen in=
side the shared kernel source, correct?

Originally, I want to remove O=3D${B} to workaround the perf build failur=
e=20
with long build path,=C2=A0 and then find arm64 will compile failed

with above error,=C2=A0 and then find it is related to the change of=20
"tools/perf/arch/arm64/Makefile", so I have this patch.


I have send a patch to upstream linux to fix perf build failure with=20
long build path, see followling link.=C2=A0 So I don't need to remove O=3D=
${B} now.

https://lore.kernel.org/lkml/20250728093153.2330009-1-changqing.li@windri=
ver.com/


Regards

Changqing

>
> Ross
>
--------------ZKBHNL5seBWhsd0ZA2BGZKKr
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/31/25 17:38, Ross Burton wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:6EFFF8DB-D5A5-463F-A8F0-5AB6CED660DA@arm.com">
      <pre wrap="" class="moz-quote-pre">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On 30 Jul 2025, at 02:42, Changqing Li via lists.openembedded.org <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li=windriver.com@lists.openembedded.org">&lt;changqing.li=windriver.com@lists.openembedded.org&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

if O=${B} is removed from EXTRA_OEMAKE, perf will compile failed with
error:
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Why would you remove O=${B}?  That would cause the build to happen inside the shared kernel source, correct?</pre>
    </blockquote>
    <p>Originally, I want to remove&nbsp; <span style="white-space: pre-wrap">O=${B} to </span>workaround the perf
      build failure with long build path,&nbsp; and then find arm64 will
      compile failed <br>
    </p>
    <p>with above error,&nbsp; and then find it is related to the change of &quot;<span style="white-space: pre-wrap">tools/perf/arch/arm64/Makefile&quot;,  so I have this patch.</span></p>
    <p> </p>
    <p><br>
    </p>
    <p>I have send a patch to upstream linux to fix perf build failure
      with long build path, see followling link.&nbsp; So I don't need to&nbsp;
      remove&nbsp; <span style="white-space: pre-wrap">O=${B} now.</span></p>
    <p><a class="moz-txt-link-freetext" href="https://lore.kernel.org/lkml/20250728093153.2330009-1-changqing.li@windriver.com/">https://lore.kernel.org/lkml/20250728093153.2330009-1-changqing.li@windriver.com/</a></p>
    <p><br>
    </p>
    <p>Regards</p>
    <p>Changqing<br>
    </p>
    <blockquote type="cite" cite="mid:6EFFF8DB-D5A5-463F-A8F0-5AB6CED660DA@arm.com">
      <pre wrap="" class="moz-quote-pre">

Ross

</pre>
    </blockquote>
  </body>
</html>

--------------ZKBHNL5seBWhsd0ZA2BGZKKr--

