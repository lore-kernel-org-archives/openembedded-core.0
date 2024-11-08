Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12765D64098
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 21:46:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.4742.1731102395832867520
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Nov 2024 13:46:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=10420f7345=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A8LUAPL024946
	for <openembedded-core@lists.openembedded.org>; Fri, 8 Nov 2024 13:46:35 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42s6gf14b0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 13:46:35 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4A8LkYc1017467;
	Fri, 8 Nov 2024 13:46:34 -0800
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2042.outbound.protection.outlook.com [104.47.70.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42s6gf14ay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Nov 2024 13:46:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hMyxQ68l2c4+BXkuoRoiF6GS+LRcUHBbz1nPNQJR41rH7Qbz9rCI5t5gdaxCqIVotv4Mw9Bwt4H5ROaKfP/4jGNBd/FoBy6sAefbbvEM0nYHkUnH+a8+bf8fRu2ukzN6jnUSQ3T7VNpxLYzYrKRSO9b+A8wmnJwAe4wgAv3EB4UwOwl8kaI7W0yJ5WhJ70nVRy+1tvXq9+Ejj9Ij2Z+5GQTOemovSyg8qlkEHgDHSPYPIPsiYUjIE4RR1+fyDX114VYll93Qlx2pTY6DniHXd65JZSHoD6Gs0B1LABu7BsA+zn4CsOPhEI5znHXi6O9jRekFGuMQDwyX3jvfnBIS3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aw3Groz4Y0PqZnEmhc/gfaDPh6lwAFPfGrWSKr0NCcI=;
 b=aGKw9aZG4txNGGgCWO+Uv7mYhHhd8rPAw8Zncg82VTYvAY6PxmVh3BbuFfK6aI7RmjwguhjUWvgph/n3UIbMkVh94IgU1p1UlOGn8Gfkk3nWMBgEguqfbPqyG1L27uO+MnhIa/4Cz4lET5+limIv2zOB3yAclPEc47nxWIUcGl7EdX5l/5TtUzQRLfJt0NMbzPIzFk7W1iRejIF8B6SNIib/VchRGLVw6A815pRYNgRJLTJgYOFF4m9ibD135wT3l/fqkrdDzR6MuMDyWwJ5XhZblqhlBxMb5NSxPLosB5AJbk9mLRVlejldMfwXCbtwVxU39zm4uKgp/oMHx/L1QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by PH0PR11MB5127.namprd11.prod.outlook.com (2603:10b6:510:3c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.21; Fri, 8 Nov
 2024 21:46:31 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.8137.018; Fri, 8 Nov 2024
 21:46:30 +0000
Content-Type: multipart/alternative;
 boundary="------------1jBoAU23IRWWZWr0F4OJl8mh"
Message-ID: <b8dcae77-45bd-4f8d-91ed-bb8aac0aff70@windriver.com>
Date: Fri, 8 Nov 2024 16:46:27 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] openssl: upgrade 3.3.1 -> 3.4.0
To: peter.marko@siemens.com,
        Richard Purdie <richard.purdie@linuxfoundation.org>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        Steve Sakoman <steve@sakoman.com>
References: <20241023184829.2216595-1-peter.marko@siemens.com>
 <180155B44E341F73.23694@lists.openembedded.org>
 <bc5ea6421ee3bf54f3f950f79036d3b51e60b3d4.camel@linuxfoundation.org>
 <AS1PR10MB56977189B862AC8B9F71791EFD4E2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <AS1PR10MB56977189B862AC8B9F71791EFD4E2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
X-ClientProxiedBy: BY3PR05CA0054.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::29) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|PH0PR11MB5127:EE_
X-MS-Office365-Filtering-Correlation-Id: 80e883ab-6520-438d-1126-08dd003ece34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|4022899009|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RmE4eDFHSU9tV3Y4SmdTczNzbFhoRDJIUjNsMVlRcFFWYVAyZDR0dmhWTmMw?=
 =?utf-8?B?MzhMRUhwdm9jakhSUXVFQnlHQTJ0OGpDK1l4VXNzQWRnNFNlelVsTUpmL0Fz?=
 =?utf-8?B?cVZ2QTQ4MDVPR09JemxzTlNldlZYK3hzQWhPOWpwTk1vQzU5bVpOcGFrdlND?=
 =?utf-8?B?Q1l1aWNsdVFIc3p3bDBkQVdLN0xIZkV0OElGWDV2ajRzQnpmNUEyOTBQSkRI?=
 =?utf-8?B?V0VOK2FxUmJNZDA5MDZDU2kwbHhtQThzanlITzVFZzhadzhWQ0FMVUJkc2JU?=
 =?utf-8?B?ME5yTkFiL0lCVFoyMVl6TW03ZkJ1MTNyMlVVbzY0UWhnSWo0WWxDTHB2ckFy?=
 =?utf-8?B?WkJhellNNjBRc1ByTyt4bVhuM0pSeU5yVkVKMFFqQ1Y5eWtGcGFiNHRjN2pZ?=
 =?utf-8?B?aEN4Sm1CU3JxOFhxUlpCVmJMWlFsaUsyWXRwd0JWL3Y2ZURMSWhpUG5sejBR?=
 =?utf-8?B?TW04TG5XblBzZ3pLTU5Qbk1aRXVBQTVoY1oxSzVldkNyd0Nacm1LU1N1OTVN?=
 =?utf-8?B?QXliNW5Hd1o2Uy9MejZMcHlkbW9JQ2cxZmFqTEs5T1dNRkd3b1E2ZkJPNXJH?=
 =?utf-8?B?NE02OVpqUk1YaFBVK3hBdlpkSThxOHJ3S1AyWmxQeTNXRFd4MU10VEgzY2Vu?=
 =?utf-8?B?WTNZd2ljcTQybXVGREF6QnBXU3JSM2tEdzhrQ1Avbm95UUNoZjA2YytqWnhv?=
 =?utf-8?B?QUlORjJZZkJwVmtoSGp4WTM1WEVaVFRxaUV5aVAxZy9yT2xleFZUVHJHa0dP?=
 =?utf-8?B?aEx4c3pEYkFlaGgrNmQ4QnIvWm4yczJnUTdLVVk2U2xHcUZMZWFZU2tTc0c4?=
 =?utf-8?B?SDlvNVNVYTJQOW1ralB2ZzlYRDVwWkpkOWFjNndWSTQwM2xmY0V5WUJwWnZn?=
 =?utf-8?B?WTlEanZSdFl1Q1RhMGloQ09xOWJsZmJhczVkRGhKQjQ3dFFMQXVYeVFHcUF3?=
 =?utf-8?B?azdLNWl3Z2NZcitxeG94WlJNYjdzMENTZVFHNk50Q0RIUUR3NE01ay9LWU56?=
 =?utf-8?B?VjFXZFhpMDFYQXJOTjFuY2xWQmFaazR1bUZSajc5YS9kRmtqT3ZUa0dIQm13?=
 =?utf-8?B?dHh6MytYQS8vSWQ5U252QjFtMnZTL2c4amU2c3hyVWJQNUF4ZExaclI1SGc2?=
 =?utf-8?B?QVMra0R4RlJpNDVFbFR0T3U2S2R1NWNYSnQwbTdwOEg4clF6L0xhLzJuSTZZ?=
 =?utf-8?B?cVN3K2F6dkxWYXRjc0tNVjk2d29ZVHBXV2Rkdk1CdCtGYkt1R2lPSUhCN3h4?=
 =?utf-8?B?bEgxaDB2b0JqRW1JdVJPQm1QYVB4N1VpQm1uakpmWUxieWZCeW5JQzNUMmNa?=
 =?utf-8?B?SnhxM05YM2pzanlmM1YwV2QxSlBOVWtpTkhBcnBaZlBkeCs5QStGL0hKL0lz?=
 =?utf-8?B?dkREdGV1aC9aa1pScVBQd2crL3VGTCtjNnRGSlRVQk93cmY2Mm1yMVNyaWRP?=
 =?utf-8?B?YU85Z3d0NFRsNXJBSVZOeU92MWo3cmRRVHV1a1B6QitFTG1FdllmdkNSUUgz?=
 =?utf-8?B?WEp2WlBrTzhlZGZaQzQ0SVJGWkYvYjNmcHFaU3VNK1Q4M1MvcjlPRzVBZjV2?=
 =?utf-8?B?OXhBQzlLMTBMaGFtZURVRW1pb3VuYzRFdjhqOUl4b1ZJYkFqaGM1b0FHUjh0?=
 =?utf-8?B?Z2tJY3B0c2xxMHdMYWNXK1BEN2JoeGV4NkNOUEgyMW9GOG9RSC9lTC9VOGl1?=
 =?utf-8?Q?HNaQKbu8yy6hUaR4Dtuw?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(4022899009)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d25peE9zVGpMUDV1VTRrUk9CZTZkcTZFN2h2U1NiSmFQY24wcitvVzhKMXZ0?=
 =?utf-8?B?QVQzMFZVSm9WWW0wM2FWRDQ1bUdncGVkbE9BdHVNZ0dTRzlqWkx3bUo0NVJs?=
 =?utf-8?B?L001VDFkQkpBemtvdzllTzJ5anJxVkl0NXVtTXlnNENPNDFxNURSbUQrOTNH?=
 =?utf-8?B?ODMwSjltb3VFN2x0U3VadkRLWHViYlBXTXc0RTVVNjVtU0JjZHRvdFhzK3ZM?=
 =?utf-8?B?TVZrdkQ5Tlo0Mkg0aDlLUjJ2Vk9oaGJpTzM3OUVUdlRqYzhDNVo3VU5pWlFq?=
 =?utf-8?B?ajBKaXRIYzI5cUJ4dFpCZmg5R1YzeUZjK3B2NWR6WmR6ZlRzUEZETDNGUVln?=
 =?utf-8?B?VXZ0eDBRZzIyMVRGbmMxdEFFR3BSWEdSRkJaQkZla016bGl3cy8wcTBjWGsr?=
 =?utf-8?B?WEZzQ1djKzlWdlE1Q0MrNWduSnpLRjFIQm1VV1E4RDNXbGdRdmpBc1lrUFRO?=
 =?utf-8?B?SWFIc2RKTEkrdzhEc0tmbDFnT1FtS09ScUdONGZXdHdDOWF6cVdLb014QjQr?=
 =?utf-8?B?RG1lMlUzcENOckVnTTRMMjc3eVpiTFpEcGFjejVaZWRTRUNnSnhFVUFpNVJz?=
 =?utf-8?B?THorUlExdjBjV21nTkFhUHlvRE8yRlU3eThiREFOeWtSYTczUm5yRFJLK0JU?=
 =?utf-8?B?ZmlTSDRJZjJIUDRMWkdKd1lDWnVrZ2VCOEpmV0x1RVF6dEVsRi8yYnRXeWxD?=
 =?utf-8?B?S3phb3FNNVFsVEd1eFdxb3pFVVl5eUdSeERYVTVrc2tiVHNjeVYvQnZjdkZn?=
 =?utf-8?B?UXNINUpiajVmS2tmaFkyWUlzMzIvblNZVW94TWtFYktOcTFKekJVczFQVGdI?=
 =?utf-8?B?bFZMTm4wVGNkOGNmMkJ5NE1yNERyZktsdm41U29aWGJnWmpCMXBGRFY2Mis1?=
 =?utf-8?B?YmZVT3N0bDhzak9rb1ZNWkdpRC9KaEFEQUtVdkNMNmVqVTZMeEVtWjFPV0M0?=
 =?utf-8?B?WUNKTjFRYmJmRWE1dWFjemk1OVBwMlN4MmZ0b3A1TEVJcWZ4N3F3ZHFUWkdP?=
 =?utf-8?B?cG11OXdiUThKejJERjg4dEY5VElZM0wzYWNhZkRPZVN2RElPeU8xbEo4NHY2?=
 =?utf-8?B?QTFxSVN6dC92a2l5Z3EzakpHTGhNMDlwSElvSjV5KzJFSWN5RU9lYkNzVGlj?=
 =?utf-8?B?ZmcvS0VJTmNPc2J1NitTL0hkQ09Gdmw5d3d4N2xWdkI5amZQb1YvWHhndHZa?=
 =?utf-8?B?aTBRdXZSRDlsclQ5TllGS1ZZbFdKbzJFVHpUTHNZMXhQTVBKaUd6UTdkQ3cy?=
 =?utf-8?B?ME1laStsbUJHYkdacyswelR1blRvMi9KV3lWSWtObDZEdENOTGpsNG1FSG5R?=
 =?utf-8?B?QU1IRU15MlBjSExKVUpSNWN6ZzhYcXhNNG4zOHNLMzdiVDZmV29ISUJDTHBz?=
 =?utf-8?B?TTFBNFZjS2YrZ1ZqSUJ3SUpBNmtjbW96Z05GNGtXSE1TUjkxZFozRUpyRU96?=
 =?utf-8?B?N0doQlVld0RQQzlDV1NGdlZkUXhXaWd0bUx2WnJuSWthMS9UWjdJOURVRjdr?=
 =?utf-8?B?NEUxamVyaW51Y3NlUkdFY0l3M1MrdStWTlgrTzF2MUhPSUE1L09LWU43WVgx?=
 =?utf-8?B?bXE4enVoYTZiKzNlL25pTGQ2MWRxUEZVWjhnWnBnVzVlYmVodzJxVS93am5p?=
 =?utf-8?B?bHJpOTdaZHFLbWFkdDVzZnAwNC9GZDNmUHdONFJCN3gvRGxDNitYRFprMnJl?=
 =?utf-8?B?aUUzWTNTalBhNVo2VTl1NFN5Y2lqTTBheG9KU3EvbUtkUktLakM0V0VDdnFG?=
 =?utf-8?B?VTEraUc2MnkvZnNDYTlOenFDNGFqaXJ5MTZCQUVvVDA1ZG91OVdLVFBITXBX?=
 =?utf-8?B?bDVubXV1ZHpWaEtjbzFoZXRGU2t2UGJ3OEtVbVMwZE9IVkJpTTVXSjZEREdT?=
 =?utf-8?B?VTlkM3RhUURyVzhXT0p0RVlmVzJTTXkva2tiRCtqMnFwK3VNYXdkWnorTytV?=
 =?utf-8?B?Nk5FMGx4UEdQMkhuWks1UFkrSk0vTmVTbDFXelBDNXgzNGdWMDB3RHlVdVRU?=
 =?utf-8?B?OUpNMC9oclR3aE9Iak5xV1lZZ3JTR0dza292b0NNMUUwa0xWK3BZeVFiWVhw?=
 =?utf-8?B?ZlJjV2RKZGlUL0ZmQUlyU01zMEs3RitIMTJ3a2htNmpKamZTWkROaGdkc3ZG?=
 =?utf-8?B?eE95WHNPdjIzcmk3OGlrMGNvc3U5TWNJQXZtenlyM0pOaFFHelAyS3NUMHMw?=
 =?utf-8?B?b2c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80e883ab-6520-438d-1126-08dd003ece34
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 21:46:30.6579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YPbRU0qw9pIO9T8XNFX3UvU87w7Qvd0SGRgmRqNl+70jJ9Lmk+5vqCuEg9OhZMbZG5ghUZhy5CiDzoDsJij5cgzZy/dHFc/2kd9aKyGOJac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5127
X-Proofpoint-ORIG-GUID: GdXC5e6dnzo2nUKJAHjJ0na8AC4VWyrz
X-Proofpoint-GUID: IVRoE8hXsA4nQrSD63eTVtimhRZQ-em5
X-Authority-Analysis: v=2.4 cv=CL54XgrD c=1 sm=1 tr=0 ts=672e86bb cx=c_pps a=Dwc0YCQp5x8Ajc78WMz93g==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8
 a=ag1SF4gXAAAA:8 a=a_U1oVfrAAAA:8 a=_enOPnqeAAAA:8 a=NEAV23lmAAAA:8 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8 a=8DXo4bXbR2EJLQonH4wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=UqCG9HQmAAAA:8 a=v8m9i3Slvq0gVAlBjNgA:9 a=-pSF0EXa6LZwJtnv:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=XAbD3I9PDrnSMThV5XoS:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-08_19,2024-11-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411080179
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 21:46:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206900

--------------1jBoAU23IRWWZWr0F4OJl8mh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4A8LUAPL024946

On 2024-10-24 2:56 p.m., Peter Marko via lists.openembedded.org wrote:
>> -----Original Message-----
>> From: Richard Purdie<richard.purdie@linuxfoundation.org>
>> Sent: Thursday, October 24, 2024 12:14
>> To: Marko, Peter (FT D EU SK BFS1)<Peter.Marko@siemens.com>;
>> openembedded-core@lists.openembedded.org; Steve Sakoman
>> <steve@sakoman.com>
>> Subject: Re: [OE-core][PATCH] openssl: upgrade 3.3.1 -> 3.4.0
>>
>> On Thu, 2024-10-24 at 09:19 +0100, Richard Purdie via
>> lists.openembedded.org wrote:
>>> On Wed, 2024-10-23 at 20:48 +0200, Peter Marko via
>>> lists.openembedded.org wrote:
>>>> From: Peter Marko<peter.marko@siemens.com>
>>>>
>>>> Release information:
>>>> https://github.com/openssl/openssl/blob/openssl-3.4/NEWS.md#major-
>> changes-between-openssl-33-and-openssl-340-22-oct-2024
>>>> Handles CVE-2024-9143
>>>>
>>>> Refreshed patches.
>>>>
>>>> Signed-off-by: Peter Marko<peter.marko@siemens.com>
>>>> ---
>>>>  =C2=A0...ke-history-reporting-when-test-fails.patch | 53 ++++++++--=
-----
>>>> ----
>>>>  =C2=A0...1-Configure-do-not-tweak-mips-cflags.patch |=C2=A0 4 +-
>>>>  =C2=A0...sysroot-and-debug-prefix-map-from-co.patch |=C2=A0 4 +-
>>>>  =C2=A0.../{openssl_3.3.1.bb =3D> openssl_3.4.0.bb}=C2=A0=C2=A0=C2=A0=
 |=C2=A0 2 +-
>>>>  =C2=A04 files changed, 28 insertions(+), 35 deletions(-)
>>>>  =C2=A0rename meta/recipes-connectivity/openssl/{openssl_3.3.1.bb =3D=
>
>>>> openssl_3.4.0.bb} (99%)
>>> Unfortunately this causes a regression in python3's ptest:
>>>
>>> https://valkyrie.yoctoproject.org/#/builders/73/builds/270
>>>
>>> I did revert this patch and tested a build and that passes so it is
>>> definitely from here.
>>>
>>> I'm trying this in conjunction with the python 3.13 upgrade which
>>> might
>>> let us fix this for master but if so, the problem for styhead and
>>> earlier will probably remain.
>>>
>>> There was a related python bug:
>>>
>>> https://github.com/python/cpython/issues/87743
>>>
>>> Copying Steve so he knows that gremlins lurk here...
>> The 3.13 upgrade doesn't help so we're going to need to resolve the
>> ptest issue somehow to merge this...
>>
>> Cheers,
>>
>> Richard
> Richard,
>
> I was able to bisect openssl tohttps://github.com/openssl/openssl/commi=
t/933f57dfe21657f7aba8f13e0cdb3b02dd64fcc3
> When I revert this commit, then the python3-ptest succeeds also with op=
enssl 3.4.0.
> I have createdhttps://github.com/python/cpython/issues/125936 to inform=
 cpython maintainers.
> I don't have enough knowledge to fix it myself but I think that the ope=
nssl commit breaking things should be great lead for someone else.
>
> During the investigation, I have also found 2 following problems with p=
ython:
>
> 1) when running ptest in core-image-minimal, there are two crashes in c=
onsole (both with openssl 3.3.1 and 3.4.0):
> [   91.482461] python3[8605]: segfault at 10 ip 00007f5b0760f561 sp 000=
07ffeda12c440 error 4 in libpython3.12.so.1.0[1ae561,7f5b07566000+23c000]=
 likely on CPU 0 (core 0, socket 0)
> [   91.485213] Code: 0f 1f 84 00 00 00 00 00 90 41 54 55 53 48 89 fb 66=
 48 8d 3d c9 d9 35 00 66 66 48 e8 79 90 f5 ff 4c 8b 25 ca d7 35 00 48 8b =
00 <48> 8b 68 10 49 3b 6c 24 30 74 09 f6 85 b0 06 00 00 20 75 4b 48 8d
> [  118.871057] python3[12214]: segfault at 10 ip 00007f7ad5dd2561 sp 00=
007f7ad50f7dd0 error 4 in libpython3.12.so.1.0[1ae561,7f7ad5d29000+23c000=
] likely on CPU 2 (core 2, socket 0)
> [  118.873991] Code: 0f 1f 84 00 00 00 00 00 90 41 54 55 53 48 89 fb 66=
 48 8d 3d c9 d9 35 00 66 66 48 e8 79 90 f5 ff 4c 8b 25 ca d7 35 00 48 8b =
00 <48> 8b 68 10 49 3b 6c 24 30 74 09 f6 85 b0 06 00 00 20 75 4b 48 8d
>
> 2) python ptest parsing is wrong, it detected only one from 8 test fail=
ures (see my cpython issue and ptest logs).
>
> Could someone create Bugzilla entries for these?

Done.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15644

Are you willing and able to create an YP BZ account Peter:
https://bugzilla.yoctoproject.org/createaccount.cgi

../Randy

>
> Regards,
>    Peter
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206302):https://lists.openembedded.org/g/openembedd=
ed-core/message/206302
> Mute This Topic:https://lists.openembedded.org/mt/109176901/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [r=
andy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------1jBoAU23IRWWZWr0F4OJl8mh
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2024-10-24 2:56 p.m., Peter Marko
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:AS1PR10MB56977189B862AC8B9F71791EFD4E2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">-----Original Message-----
From: Richard Purdie <a class="moz-txt-link-rfc2396E" href="mailto:richard.purdie@linuxfoundation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a>
Sent: Thursday, October 24, 2024 12:14
To: Marko, Peter (FT D EU SK BFS1) <a class="moz-txt-link-rfc2396E" href="mailto:Peter.Marko@siemens.com">&lt;Peter.Marko@siemens.com&gt;</a>;
<a class="moz-txt-link-abbreviated" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a>; Steve Sakoman
<a class="moz-txt-link-rfc2396E" href="mailto:steve@sakoman.com">&lt;steve@sakoman.com&gt;</a>
Subject: Re: [OE-core][PATCH] openssl: upgrade 3.3.1 -&gt; 3.4.0

On Thu, 2024-10-24 at 09:19 +0100, Richard Purdie via
lists.openembedded.org wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On Wed, 2024-10-23 at 20:48 +0200, Peter Marko via
lists.openembedded.org wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">From: Peter Marko <a class="moz-txt-link-rfc2396E" href="mailto:peter.marko@siemens.com">&lt;peter.marko@siemens.com&gt;</a>

Release information:
<a class="moz-txt-link-freetext" href="https://github.com/openssl/openssl/blob/openssl-3.4/NEWS.md#major">https://github.com/openssl/openssl/blob/openssl-3.4/NEWS.md#major</a>-
</pre>
          </blockquote>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">changes-between-openssl-33-and-openssl-340-22-oct-2024
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">Handles CVE-2024-9143

Refreshed patches.

Signed-off-by: Peter Marko <a class="moz-txt-link-rfc2396E" href="mailto:peter.marko@siemens.com">&lt;peter.marko@siemens.com&gt;</a>
---
&nbsp;...ke-history-reporting-when-test-fails.patch | 53 ++++++++-------
----
&nbsp;...1-Configure-do-not-tweak-mips-cflags.patch |&nbsp; 4 +-
&nbsp;...sysroot-and-debug-prefix-map-from-co.patch |&nbsp; 4 +-
&nbsp;.../{openssl_3.3.1.bb =&gt; openssl_3.4.0.bb}&nbsp;&nbsp;&nbsp; |&nbsp; 2 +-
&nbsp;4 files changed, 28 insertions(+), 35 deletions(-)
&nbsp;rename meta/recipes-connectivity/openssl/{openssl_3.3.1.bb =&gt;
openssl_3.4.0.bb} (99%)
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Unfortunately this causes a regression in python3's ptest:

<a class="moz-txt-link-freetext" href="https://valkyrie.yoctoproject.org/#/builders/73/builds/270">https://valkyrie.yoctoproject.org/#/builders/73/builds/270</a>

I did revert this patch and tested a build and that passes so it is
definitely from here.

I'm trying this in conjunction with the python 3.13 upgrade which
might
let us fix this for master but if so, the problem for styhead and
earlier will probably remain.

There was a related python bug:

<a class="moz-txt-link-freetext" href="https://github.com/python/cpython/issues/87743">https://github.com/python/cpython/issues/87743</a>

Copying Steve so he knows that gremlins lurk here...
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">The 3.13 upgrade doesn't help so we're going to need to resolve the
ptest issue somehow to merge this...

Cheers,

Richard
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Richard,

I was able to bisect openssl to <a class="moz-txt-link-freetext" href="https://github.com/openssl/openssl/commit/933f57dfe21657f7aba8f13e0cdb3b02dd64fcc3">https://github.com/openssl/openssl/commit/933f57dfe21657f7aba8f13e0cdb3b02dd64fcc3</a>
When I revert this commit, then the python3-ptest succeeds also with openssl 3.4.0.
I have created <a class="moz-txt-link-freetext" href="https://github.com/python/cpython/issues/125936">https://github.com/python/cpython/issues/125936</a> to inform cpython maintainers.
I don't have enough knowledge to fix it myself but I think that the openssl commit breaking things should be great lead for someone else.

During the investigation, I have also found 2 following problems with python:

1) when running ptest in core-image-minimal, there are two crashes in console (both with openssl 3.3.1 and 3.4.0):
[   91.482461] python3[8605]: segfault at 10 ip 00007f5b0760f561 sp 00007ffeda12c440 error 4 in libpython3.12.so.1.0[1ae561,7f5b07566000+23c000] likely on CPU 0 (core 0, socket 0)
[   91.485213] Code: 0f 1f 84 00 00 00 00 00 90 41 54 55 53 48 89 fb 66 48 8d 3d c9 d9 35 00 66 66 48 e8 79 90 f5 ff 4c 8b 25 ca d7 35 00 48 8b 00 &lt;48&gt; 8b 68 10 49 3b 6c 24 30 74 09 f6 85 b0 06 00 00 20 75 4b 48 8d
[  118.871057] python3[12214]: segfault at 10 ip 00007f7ad5dd2561 sp 00007f7ad50f7dd0 error 4 in libpython3.12.so.1.0[1ae561,7f7ad5d29000+23c000] likely on CPU 2 (core 2, socket 0)
[  118.873991] Code: 0f 1f 84 00 00 00 00 00 90 41 54 55 53 48 89 fb 66 48 8d 3d c9 d9 35 00 66 66 48 e8 79 90 f5 ff 4c 8b 25 ca d7 35 00 48 8b 00 &lt;48&gt; 8b 68 10 49 3b 6c 24 30 74 09 f6 85 b0 06 00 00 20 75 4b 48 8d

2) python ptest parsing is wrong, it detected only one from 8 test failures (see my cpython issue and ptest logs).

Could someone create Bugzilla entries for these?</pre>
    </blockquote>
    <p>Done.<br>
    </p>
    <p><a class="moz-txt-link-freetext" href="https://bugzilla.yoctoproject.org/show_bug.cgi?id=15644">https://bugzilla.yoctoproject.org/show_bug.cgi?id=15644</a></p>
    <p>Are you willing and able to create an YP BZ account Peter:<br>
      &nbsp;&nbsp; <a class="moz-txt-link-freetext" href="https://bugzilla.yoctoproject.org/createaccount.cgi">https://bugzilla.yoctoproject.org/createaccount.cgi</a></p>
    <p>../Randy<br>
    </p>
    <blockquote type="cite" cite="mid:AS1PR10MB56977189B862AC8B9F71791EFD4E2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM">
      <pre wrap="" class="moz-quote-pre">

Regards,
  Peter

</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#206302): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/206302">https://lists.openembedded.org/g/openembedded-core/message/206302</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/109176901/3616765">https://lists.openembedded.org/mt/109176901/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------1jBoAU23IRWWZWr0F4OJl8mh--

