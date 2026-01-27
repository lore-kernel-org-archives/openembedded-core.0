Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF4B8CA6CAC
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:57:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6322.1769504258014933990
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jan 2026 00:57:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Bz4lpu9V;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=54872b1b3d=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R7Ygm2606164
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 00:57:37 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=OPfPFrB184AbTy3uh9LG3U
	+ZlDBEOm7eXgIKwwms3KU=; b=Bz4lpu9VljN9CLkkhIL4nq8rMaZzmbYheUrjff
	YCwFTDxzRwUC11pBf+pa/tAc58EiAoaZglC+T16W8mtbuqCsakSAouby+WBdCKyD
	m/BeUTyx0df+m8yHKQBa9hWuGBedAVplhc3ncp3eLsKbDwvmUYC4UCI6Gu+bSjjH
	oBRy8thvx326QiTc70mKuDnUgvKqyG2leS+jPmRrDfazSklm8KNWoSzxkwIXUJzd
	dvBzSZisrGfC1B01bbzu+FoE78I1mojKDHlfjPnhuE8Oue5FltjLyvMlIr6p6c+w
	4V9Mh5XO9Tm4BKh6KJFM3tY31Sk7UeSAckPIpVA9hmhHcBOQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012003.outbound.protection.outlook.com [52.101.48.3])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bvt85ar7f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 00:57:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a9gqZSx+Te+kTBjvRqIBtLHFcKFoSG2yUcQQa0+cmW9VzYyEkFp/K6c8B3St0GlO8QiKcJItxS/SJ/J/QZMBtobjHdifLERLAewG0ZQw+csdZVtotzj59cA1cOu3OfxxWtH0gr4BBVSpkho6xpD0cdBkdgKx/X4mnFdh4G/h/akqj6L84whUf7/1Kpt7IRy//I+6o41MT8IG3NPpVzix94fpr9IrrmHphjsHVaJgqK/fKyIPOSOiiCW9mGQ25LbLdU010VAZd0IlFHfzm4tNxr0bS3mVxoqQ4ANbcIYOiU4GI1MPTEuFEFS+TCwqBTAvMzLfxcLkximi3k78Ud97Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OPfPFrB184AbTy3uh9LG3U+ZlDBEOm7eXgIKwwms3KU=;
 b=mZ+hL7GUUEQtNurF4nFEbh6Xq/LRPt6uUR2BZJKoKF9C+v/6poUci4cBSfHCqeB70qp9MCsA+7trHRiKKdTDlQMJfagMpX2eb3FFxrpbD3H2Uojyo51HgDGcqzHJsErfCvit3wlyKDgKmIT5gByOCQWsQq7pokR7tV/jHMAjGOAV1Y/qIHRrDLeBea9BK+41sdCJ39HgYftJYZPQbwWTNBQEwxWISdbFoizKW3Ddy/1hA1L+iq7VjpZ+CwV0DsSn2jODrRX9SUJ8rTtgtpPxio7WU5qYqJuwV/JXmT/FT6UPi7qDkQx2Tc8BKDunC6B1ByqYhrLOdZP/k1vC6Ydb6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by PH3PPF25FF87461.namprd11.prod.outlook.com (2603:10b6:518:1::d10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Tue, 27 Jan
 2026 08:57:34 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%3]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 08:57:34 +0000
Content-Type: multipart/alternative;
 boundary="------------CTsUsyvVqG4on3pcs3ZhpdqD"
Message-ID: <00e8c0f8-7889-4e90-95c0-82de63c1d815@windriver.com>
Date: Tue, 27 Jan 2026 16:57:32 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V2] procps: support ptest when TCLIBC is glibc
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20260116092704.2465341-1-changqing.li@windriver.com>
 <48503D06-1C65-407A-8EE8-B2E5099C797C@arm.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <48503D06-1C65-407A-8EE8-B2E5099C797C@arm.com>
X-ClientProxiedBy: SG2PR02CA0135.apcprd02.prod.outlook.com
 (2603:1096:4:188::23) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|PH3PPF25FF87461:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bbc03ee-027e-414f-282f-08de5d821c97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Ykk0MDFZZlAvUXo5NThVbnZmN2dQdXBqcEI1bmlEeWNzVUJhaWZZZEx4eFdW?=
 =?utf-8?B?b050bHluYys1OHlPWHkxbTE2ankrOHRnQmMvUTN5Tlc5eGp3Y0c1bWRNcXhp?=
 =?utf-8?B?ZWpMS0FZdHV0SmMwOWlCSnlxaWFhd2xNMUN4T1ZHemp1RElSTnp6RHVKTG14?=
 =?utf-8?B?QlhYZ1FQZk1JekNlS3g1a081QXpZVU5sZ3p0VWhBblRWSUltVjJXNjliY29u?=
 =?utf-8?B?d2pTRGVlR2o5cnRLNnRuZ2NpUHpJMUIwTlN2VjVtbkVqSDVHK24vVUxxa1Jn?=
 =?utf-8?B?ZGtGNStJeHkzNExCRjI5OWtHYU9wV0U0cTIyTTFJWThrZDJjZGF4SU83NHd1?=
 =?utf-8?B?UFZ6MTlhell3a09ueVlIVzFCK3l6aTdvalU4VGdTRmxmQU1sWk84ZGpNb3Yx?=
 =?utf-8?B?Y25UcFg2ZWNranNlU2dNdVhBQUZEYnhZSGY3NGFNcSsrUms0cGVtbHlZZG8v?=
 =?utf-8?B?VkhNNHZ4OStBY1Nqa0xtbXZCOGQxaytVZkphWDBYVGhXbHFmb1RLaE0wUitp?=
 =?utf-8?B?cHEwUkhRS3B6YmVoWHBMYVljaHR4cGtSRzFydWYvanVvQkRCMlA4OGJkWkFN?=
 =?utf-8?B?ZE8rQmg2ZnhIRmJuWE5KZUQ5Uk5Cek4yK3lhNEdnbmtqMXRnSHdFRDFneDI5?=
 =?utf-8?B?R2ErNzcweHp0eUlCY0owejA3ZkpCNllNbGdKZWtkVVBnVDNObXMvNUZwY2Fo?=
 =?utf-8?B?VEk2d016bEJBVmN0R0dpN3pEakZzbmF0TzE2dlJMR291cWxRamJnK0xNMlZY?=
 =?utf-8?B?SUoxSTJBOWdzVjFncEY2UUpmTEZzamFyZjZQaXFtRUI5bmdWMkVhUjNtTkVL?=
 =?utf-8?B?UURKbWRQUHF0OFhBY3VNZDAyRzg2QkxLL25JNHovNEtWQVoxWEdtRWVjbER0?=
 =?utf-8?B?aWZ1YVE4WFVTeGNBdmx6VmdqZmFkZEFoWDIvK0kvaTdDUFRqZ1NaMUFGMlc1?=
 =?utf-8?B?RmhJbE5BU2hRSEJ4aFU1MlVTdXVncDVQNnQzUlpJKzRYM2lzMTl3YWZ4OXcr?=
 =?utf-8?B?aTFvd1BhWktyOE9PZmZFa0NHdVdDKzJEK3k0T2JXeE5jNk55V2owLzdUZDRZ?=
 =?utf-8?B?bktaR3dFYVZVcTJxMFNVQ1p2L3FCS09xY09aOVJaTXZhcmpyR2UwVWMzRkNX?=
 =?utf-8?B?dTNjeEczMzlBeVBBb290RmFHY0t1V2xjMC9tbk1KMWlWeGprREdxczVXT1Ny?=
 =?utf-8?B?S3hlVXc4em5BTWtRNWFkb1RiUm5FZlNKWnVoNWlhbitEWU10MUxjdzZ3K05T?=
 =?utf-8?B?cEV5Rm4xNnFBZjMrbEhBL2dYZ3RtdnhaVTJTcVJmQjhuZGk3KzdHaW5FOTVa?=
 =?utf-8?B?ZWNVdDlLZTZpOEFHNnluSjZTSzBSL243c0p0bG5zRVd2elMyeHZ5dHVjVWhU?=
 =?utf-8?B?WmhRdi9lZi9OcTcrRjFWU0pNbkp2R2Y5dE1sc3ZqUXQ4RmJaanBBOHExZjRv?=
 =?utf-8?B?TGhKNUpTdXA3b1Q0WlF1VEhvY2g3SjRUSDBOUExpRFpNeitDVjVNdXZFcldR?=
 =?utf-8?B?NG0rWEFwSHliT2Q1bkhEaytIbkI3Yk15cy9SdnRiSS9kZmIzZGlwZUVFbHlk?=
 =?utf-8?B?Q3plbjF1SXdqMWVReXFuQ0dSMHplSGk0Mk5aM0V6TytkWHVrTkFhbWhSSnA0?=
 =?utf-8?B?UGFLVW83VkdCTUh1SlNxSWpYUjBqczBBMDEwTDNrNzdoNzNDL2s0LzNid3BJ?=
 =?utf-8?B?UVppcnZrODhpTXhvdkpHYU13R1RaL3VuemxyZ1dPVlJ6Y3M3V0I1NkUvRG04?=
 =?utf-8?B?L01GSU5WUmFxZEJmcFZEU3BCU1hSR3BBay9vM2lvZk1MbzRCRjJsV01Iaktt?=
 =?utf-8?B?L0x2Z0FsWlhKSER5c0lCUWZaZ2cvZDR2ZXVQV0E4blFKTWh1WllTQ0Zjb2I0?=
 =?utf-8?B?Yk55TXpGRnZOVXU4RXZyU1E4WUNrMjNaMC83V0k5MFhGazkvRlFoNGlmZUZr?=
 =?utf-8?B?R3hGeWZNTVdaYklnalJJYmV3Zk94Q3dLSXB1ZlRiZTBsemtpWVZxUjNhTjhm?=
 =?utf-8?B?T0hSUmZxdWUrei93ZXB6ZlFjTVI3aXJDQ3dCZWJKYlNENTlCeXV1NmxFZ25C?=
 =?utf-8?Q?BTAEVK?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RG5LT0l5UTZINmhNckt1YUFIeW85MUNMd0VGSU1rOW9uVlJOaFJuclRZc2hE?=
 =?utf-8?B?bXc3djQvcmlPOG0xNVI5dkdySDNtdXh0MDJWV1dFMW9QUUNHM2N2S3Y0Z2E0?=
 =?utf-8?B?NjRrMkR6RmJLbFFBWG9XaU1pdkQweUdTRnRxckZhbndWRndvTUM4WEwwVEEw?=
 =?utf-8?B?cldienZYOWxNQ2pRZHZGWHN1MFgxcGxYcnFDZG1mV2FsbnFUS0hKUXlwRGVz?=
 =?utf-8?B?NktxM2tDN3cvSXk2bHBoYStlZzdkUDhxaTcraDNaY2NvQW80ang0aUtNNEwz?=
 =?utf-8?B?QzIwTU43d0ZNa3Y1em8wNjNiTitUT1ZMQ0ovckJrQjcxWGNjOURlbEdFMXp3?=
 =?utf-8?B?dnJLWUVENXZkcjVIMWhMY3JyQ3pibkhONVIwbTRNSnZXNzY2ZTdOZjZuZXll?=
 =?utf-8?B?Z2orbWhVTFE2UFlSek1POWdUUUQzeHZneURaenZnS1ZCV1JhVDlINTBzWDlj?=
 =?utf-8?B?R3YxT2JyLzdVUnkwejd3L2h6aFFyT1RCT0VsWlU5WUdESkVHekpPUDhYOVFR?=
 =?utf-8?B?Vm5DaXFZUzcza1RYK3ZBSkppTHhzYzNIZmVUTjk2TnRSYXo3MkxITU1vL2FR?=
 =?utf-8?B?QWRLWlVUV1RTbTRWNElMZmlFSTdaV1pBNGRLakpNb2pzclYrcCtreVFRZGtl?=
 =?utf-8?B?S29XTWxBd1FWeGRldk5tUW85S2E1OWVJOHpPZi9HYzlrY2pZZFFwVHJzUU5I?=
 =?utf-8?B?eGhHaDc2MU9YU3NnNmp6U3FMWlJLSGh4ajQ4RkNSNHQyS0paMkhTdjBSQUVt?=
 =?utf-8?B?M0I3eVkrVEJ0V2FjblU2QVc1enpuRk5LVG16N0R4OUM1VUgvVnRVaGtwV0hG?=
 =?utf-8?B?OUJJQ3ZKT0I1OGRSQmcrWFA5QmcyMVBRZExacVJCUitZTHFFUXZ2OW9zemFS?=
 =?utf-8?B?VUtjRFdDNlRETUp1N000RDcrNnppR0pXYnIvY3dURSsySmtJUVRSQTgrd2F6?=
 =?utf-8?B?bWJoQlE1Q1N2RXhqaitVZmxPN254TThYR2JFS3kycnhVMVFqaHIveGE4a1Fp?=
 =?utf-8?B?TjJXSDRTYjFob1MzaHZjb3ZtdTkrc2tkbTJpcStveU41RUNJeXVwTWFQYlVx?=
 =?utf-8?B?T3J6Z2VTYm5IY2RyWUhRRTBqbWhyK2prYjBDeTB5NC9TREhjNjJOTWhKM0I5?=
 =?utf-8?B?U01aMUJQN1VOb1crSnE0M0VEUXpwVDYwOGltZDRiT0liRGpLa3dOMHROVlNi?=
 =?utf-8?B?S1o4dG9HSDFlOXRLb0RwQW9sNnUzc1AyYkZPeXE2TEhIUjQ4bnd3OTFlNlBt?=
 =?utf-8?B?blVoZXcweXZEV0REblU0cnFMa2pkVHVMQmx2SHBjZklKMUtLbkZMcCtRSWcr?=
 =?utf-8?B?TjRrYm9ob0tMcmQrVlNJK3M3NXZBR3V3OS9BVjhFUVZlaTFxQThvSmo4QXZk?=
 =?utf-8?B?WERXZFo1UjBCVFNDcmRQaStTQkFNWEwzWVBBbm80YkV6SWswU2lSK2JNNXVP?=
 =?utf-8?B?b0lUZ2JkOGNoUTA0Wk5hdG15THVDcU4zdDJLODAyNHZRT2loMnpXb1pjQytx?=
 =?utf-8?B?K01TNFV3aGJOdjN3NFNUUTROZEY5MFk0RFNyejRFTHkwb0ZxZHpKdDZCV1I0?=
 =?utf-8?B?T1dYd1lpWGpDUlAvTVN6bkxXL2lOck4vQ1lKaHRlVGJBKytpb1BINmhoajU4?=
 =?utf-8?B?UFZJVFhnanJhSnJ6ZFlxWTdUQTFUbDhIc3ZKMHhHWDcwK3lTT0NZdE1LOUYw?=
 =?utf-8?B?aXJSODF1WGJpaTNWTFYvV1hYMC9ncTlpRnFJNXlDbmlzVDh4S2VUeDFQRGUx?=
 =?utf-8?B?d04xS2FUV0xYbHAxR3l5b0txbzFvcCtsMmRXMFF0RjBrZHVQUTZaelc0dEFs?=
 =?utf-8?B?aGsyWkNQM1A0RjFJUi9VWjJwa2NjcisybnN3YjViTGt5YXBoMmtTdVMrNVNv?=
 =?utf-8?B?blFkWFFNbmJuUURXVjB0ZDhPaFBtRlRRMlgxd1kzbDdlb012VWhBYjRYd0JC?=
 =?utf-8?B?dXRyanRLOEcxL1pVT3lFUXRSTVVwV1lQWWxHQXVudFhHYW1vQTFQa1ROUk9x?=
 =?utf-8?B?OXNRZTJIQUk4RXNHV0FUUXlsd1J6WGgvNzNaLzZMNHBSS3JGQUFWdzQvd1Ur?=
 =?utf-8?B?ak8yN0hvVmIyeTRYMXdsYjFKSndycXQ4aE91V3ZlT1hLQytqMEw1VUQ2K0hW?=
 =?utf-8?B?OCtJQUJITU91OUFydU5aK0J3OExMczN5bEFvRzR3YU82V1gyY0hQQU1oSE1u?=
 =?utf-8?B?dnZkeEsrTGZiVlVvZVo2RXp2clZQSG02MWFQOXVXUVgvZXZCYmZmcFBFMmtP?=
 =?utf-8?B?QUJuN0c5dU9tRzVVcmVsTGsrREdLRUF3WTJNWWFOUlEzVnpEekhLMFcvNkpL?=
 =?utf-8?B?MU5NdHE2U01MT1ZNeGRkOE1tRFJiZHI2ekRXQ2taWlRvaW1mRGg0OUh5b3J1?=
 =?utf-8?Q?SE7OA28hI5qR4ZEo=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bbc03ee-027e-414f-282f-08de5d821c97
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 08:57:34.2892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y7pp1K+HeYCoC2yZdorJgFoh9vfzk4b56ntdXFXKwtwSSJ8p5S7hS4dDVcQ6aJkTPHmNJJ2Mfh5ImOrtHG/lFm75RbUZLRQ0L8a7rCjCZyM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF25FF87461
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA3MiBTYWx0ZWRfX1hZn2Aio9Wi7
 74gTDDhBSo3BrOonfVh+Fu8ArBYd8koJysOfcozz9939hR4sPx8NikQYvzOY3pWVKANkf7nqYji
 5cyOrT/uTzonKK3YXeVrGv9Jpkmy6bcuDoWugNJQY01+FYmAIm7LK7xIvWIC8dW/MSEtw1M4Fe0
 mvfYawfFLQNYFMnFuIh5GJTgzeed0INM8Nqeco26GLOnDnRjd/N5TB2vwyuXz5fKKJkdl/YvkJx
 vRfiC7MdlNiuFm4CoiW3cFoGcAMbNafnyerIZYaPMbCHnw3p62Ix5yY1KNhmxagVDXNfFivLzg5
 5LtVgUjT1AwRauSVApjY26/WeY4c5lNQcC1urUDmEgpSylUZ7M7Pm9UQ34zrIyJ/2Ecl0WKKrmt
 1r3Sbodh0wximTDnB3/Xs2u0lyT5XejEPvW/mKjmh+hdn8RaXh0Bg/qxAspL5Kqv0/OJkGFqrSb
 6t0MnARHF25kkdpzurA==
X-Proofpoint-GUID: 0Ma6W1fzBRY9gPXI1akCT0VLhqJc4mqy
X-Authority-Analysis: v=2.4 cv=M6lA6iws c=1 sm=1 tr=0 ts=69787e01 cx=c_pps
 a=O5ql0vl6PVxeYGQXc+vjrA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Q4-j1AaZAAAA:8 a=6eTBPnJexsyPmsKDtKUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=7CQSdrXTAAAA:8 a=LVVdaqqDU9W9cF4QaU8A:9 a=or0laQedkAdgD2GP:21
 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: DvHhvQR3urYi-5vfOwTSrnt2JZeC3UJY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 08:57:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230031

--------------CTsUsyvVqG4on3pcs3ZhpdqD
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 60R7Ygm2606164


On 1/26/26 21:01, Ross Burton wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On 16 Jan 2026, at 09:27, Changqing Li via lists.openembedded.org<chang=
qing.li=3Dwindriver.com@lists.openembedded.org> wrote:
>> +SRC_URI:append:libc-glibc =3D" file://run-ptest"
> Keep things simple and just add this to SRC_URI, it won=E2=80=99t cause=
 any problems in musl builds.
OK
>
>> +    DEJATOOL=3D$(make -C testsuite -s -f Makefile -f - <<'EOF'
>> +all:
>> + $(info $(DEJATOOL))
>> +EOF
>> +)
> You can use makefile-getvar (oe-core/scripts) for this, and do it later.
Corrected in V3,=C2=A0 this script is much better.
>
>> +     rm -rf ${D}${PTEST_PATH}/testsuite/Makefile*
>> +     rm -rf ${D}${PTEST_PATH}/testsuite/README
>> +     find ${D}${PTEST_PATH}/testsuite/ -type f -name "*.o" -exec rm -=
f {} +
>> +     find ${D}${PTEST_PATH}/src/ -type f -name "*.o" -exec rm -f {} +
> Might be easier to use makefile-getvar to get the list of tests and the=
n install them directly, instead of copying * and then deleting files.
>
> Also find has a -delete option which is better than -exec rm.
>
>> +     DEJATOOL=3D$(cat ${B}/testsuite/.dejatool)
> Just use makefile-getvar here?

All changed to use makefile-getvar in V3, but for sources under=20
${S}/testsuites still cp them all, but don't remove unless Makefile.am/in=
,

because we not only need to install something can be got by=20
makefile-getvar, but also some config files/folder that only directly=20
used by *.exp.

>
>> +     sed -i -e "s#@DEJATOOL@#$DEJATOOL#g" ${D}${PTEST_PATH}/run-ptest
>> +     for p in $DEJATOOL; do
>> +        if [ "$p" =3D "ps" ]; then
>> +            install -d ${D}${PTEST_PATH}/src/ps
>> +            ln -sf ${base_bindir}/ps ${D}${PTEST_PATH}/src/ps/pscomma=
nd
>> +        elif [ "$p" =3D "sysctl" ]; then
>> +            ln -sf ${base_sbindir}/$p ${D}${PTEST_PATH}/src/$p
>> +        elif [ "$p" =3D "kill" ] || [ "$p" =3D "pidof" ] || [ "$p" =3D=
 "watch" ]; then
>> +            ln -sf ${base_bindir}/$p ${D}${PTEST_PATH}/src/$p
>> +        else
>> +            ln -sf ${bindir}/$p ${D}${PTEST_PATH}/src/$p
>> +        fi
>> +     done
> Not sure I understand the point of iterating a list and then switching =
off each item in the list. Why not just make all those symlinks without t=
he loop and conditional?

Because most of the DEJATOOL should match the else branch, but=20
sysctl/kill/pidof/watch has different install path, not binddir, but=20
base_sbindir/base_bindir.

For ps, the ps.exp want to run "src/ps/pscommand", but not src/ps like=20
other programs, so I need to make the link different with others.

>
>> +RDEPENDS:${PN}-ptest +=3D "dejagnu bash glibc-utils"
> Have you verified that it _needs_ bash and we can=E2=80=99t send a litt=
le patch to use sh?

I added this since I met error that reminds this depends,=C2=A0 but it se=
ems=20
not need any more, maybe the depends has been removed during rework this=20
patch.


Thanks

Changqing

>
> Ross
--------------CTsUsyvVqG4on3pcs3ZhpdqD
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 60R7Ygm2606164

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#ffffff">
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 1/26/26 21:01, Ross Burton wrote:<b=
r>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:48503D06-1C65-407A-8EE8-B2E5099=
C797C@arm.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

On 16 Jan 2026, at 09:27, Changqing Li via lists.openembedded.org <a clas=
s=3D"moz-txt-link-rfc2396E" href=3D"mailto:changqing.li=3Dwindriver.com@l=
ists.openembedded.org">&lt;changqing.li=3Dwindriver.com@lists.openembedde=
d.org&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">+SRC_URI:append:libc-glibc=
 =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"file://run-ptest">&quot; =
file://run-ptest&quot;</a>
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">
Keep things simple and just add this to SRC_URI, it won=E2=80=99t cause a=
ny problems in musl builds.</pre>
    </blockquote>
    OK<br>
    <blockquote type=3D"cite" cite=3D"mid:48503D06-1C65-407A-8EE8-B2E5099=
C797C@arm.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">+    DEJATOOL=3D$(make -C =
testsuite -s -f Makefile -f - &lt;&lt;'EOF'
+all:
+ $(info $(DEJATOOL))
+EOF
+)
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">
You can use makefile-getvar (oe-core/scripts) for this, and do it later.<=
/pre>
    </blockquote>
    Corrected in V3,&nbsp; this script is much better.<br>
    <blockquote type=3D"cite" cite=3D"mid:48503D06-1C65-407A-8EE8-B2E5099=
C797C@arm.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">+     rm -rf ${D}${PTEST_P=
ATH}/testsuite/Makefile*
+     rm -rf ${D}${PTEST_PATH}/testsuite/README
+     find ${D}${PTEST_PATH}/testsuite/ -type f -name &quot;*.o&quot; -ex=
ec rm -f {} +
+     find ${D}${PTEST_PATH}/src/ -type f -name &quot;*.o&quot; -exec rm =
-f {} +
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">
Might be easier to use makefile-getvar to get the list of tests and then =
install them directly, instead of copying * and then deleting files.

Also find has a -delete option which is better than -exec rm.

</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">+     DEJATOOL=3D$(cat ${B=
}/testsuite/.dejatool)
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">
Just use makefile-getvar here?</pre>
    </blockquote>
    <p>All changed to use <span style=3D"white-space: pre-wrap">makefile-=
getvar in V3,  but for sources under ${S}/testsuites still cp them all,  =
but don't remove unless Makefile.am/in,</span></p>
    <p><span style=3D"white-space: pre-wrap">because we not only need to =
install something can be got by </span><span style=3D"white-space: pre-wr=
ap">makefile-getvar, but also some config files/folder that only directly=
 used by *.exp.</span></p>
    <blockquote type=3D"cite" cite=3D"mid:48503D06-1C65-407A-8EE8-B2E5099=
C797C@arm.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">+     sed -i -e &quot;s#@D=
EJATOOL@#$DEJATOOL#g&quot; ${D}${PTEST_PATH}/run-ptest
+     for p in $DEJATOOL; do
+        if [ &quot;$p&quot; =3D &quot;ps&quot; ]; then
+            install -d ${D}${PTEST_PATH}/src/ps
+            ln -sf ${base_bindir}/ps ${D}${PTEST_PATH}/src/ps/pscommand
+        elif [ &quot;$p&quot; =3D &quot;sysctl&quot; ]; then
+            ln -sf ${base_sbindir}/$p ${D}${PTEST_PATH}/src/$p
+        elif [ &quot;$p&quot; =3D &quot;kill&quot; ] || [ &quot;$p&quot;=
 =3D &quot;pidof&quot; ] || [ &quot;$p&quot; =3D &quot;watch&quot; ]; the=
n
+            ln -sf ${base_bindir}/$p ${D}${PTEST_PATH}/src/$p
+        else
+            ln -sf ${bindir}/$p ${D}${PTEST_PATH}/src/$p
+        fi
+     done
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">
Not sure I understand the point of iterating a list and then switching of=
f each item in the list. Why not just make all those symlinks without the=
 loop and conditional?</pre>
    </blockquote>
    <p>Because most of the <span style=3D"white-space: pre-wrap">DEJATOOL=
 should match the else branch,  but sysctl/kill/pidof/watch has different=
 install path, not binddir,  but  </span><span style=3D"white-space: pre-=
wrap">base_sbindir/base_bindir.</span></p>
    <p><span style=3D"white-space: pre-wrap">For ps,  the ps.exp want to =
run &quot;src/</span><span style=3D"white-space: pre-wrap">ps/pscommand&q=
uot;,   but not src/ps like other programs,  so I need to make the link d=
ifferent with others.</span></p>
    <blockquote type=3D"cite" cite=3D"mid:48503D06-1C65-407A-8EE8-B2E5099=
C797C@arm.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">+RDEPENDS:${PN}-ptest +=3D=
 &quot;dejagnu bash glibc-utils&quot;
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">
Have you verified that it _needs_ bash and we can=E2=80=99t send a little=
 patch to use sh?</pre>
    </blockquote>
    <p>I added this since I met error that reminds this depends,&nbsp; bu=
t it
      seems not need any more, maybe the depends has been removed during
      rework this patch.</p>
    <p><br>
    </p>
    <p>Thanks</p>
    <p>Changqing<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:48503D06-1C65-407A-8EE8-B2E5099=
C797C@arm.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

Ross
</pre>
    </blockquote>
  </body>
</html>

--------------CTsUsyvVqG4on3pcs3ZhpdqD--

