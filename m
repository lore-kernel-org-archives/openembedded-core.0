Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFCB4D591AB
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 17:49:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1245.1731952179190721173
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 09:49:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=105279e00a=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AICNdWf009516
	for <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 09:49:38 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xqj7sveu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 09:49:38 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4AIHlU3R032312
	for <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 09:49:38 -0800
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xqj7sves-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 09:49:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BHRn6+t3c0bT+2sFAsjLoFZy7fk4o0TzkSL7AgRyB8+5OVQI7ut27Q8as1hq010S3CFX9B5GEM+Ff7+oSfB5Ye1thCOQJF/NZpaKxtOpXiY/ZQJTK/LUP6SbxDZPRlnlAq0fwTC5Yn+ldBRJs7523xKkU6D3MctQaJk5CHD8ILMjJGDea2rmzK9wCnIiCTZeXwxIgmdB17T7nD/Ob5XTH1qSf0o0k8yrURo5KgcBF3rDBpXXcq1xu8XT7aclZXGnlBK34/hLlErk1pmxL7Bi/2ZHQ5Mopqtb5m9A1BzMlXn5EdeHX51Sj3l72NNTj4D5wRbtcWO5wuQ5w1e8scfzcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vVZB4JKGUlGjnDpS/6NIdGEyZPlO2Os44rA/1Tl1IK4=;
 b=DJQmvTVFtFC7KLzFTgUTDC5mR0k8uHF14wkO2Z02fwc5QMmNAx6X0H3CqQZs5lCp6TgCouKGonzONZVwkEX1bKjPOTDaK6YxQC57/RiX0PPI0cIo2099r6D+osv3Urn+h3/zIFQADKmQd/5aSmwl+PMgr8gcc5c9GCvoNT4VtvnlXup6h3p2BTikAQApOZKUph6yGEuILO2bqE3QMrqYynFB5g2+UeZLCydzwha1p1c2bH0f7c5AQ7fhtVsKixNdKgybcuFx4pXI68YLyrUvbsU2J5gtajk2RdbIQS++/CY6HwqqQzdE42J//kc9OgRCpr7fZ7aVg9G2gcd7X9JULA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by CH3PR11MB8657.namprd11.prod.outlook.com (2603:10b6:610:1ca::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Mon, 18 Nov
 2024 17:49:33 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.8158.023; Mon, 18 Nov 2024
 17:49:33 +0000
Content-Type: multipart/alternative;
 boundary="------------cWyou01rNC5ZriwNtyGhoa1G"
Message-ID: <8dea3eda-46ad-40f0-ab8e-7b6dd77ca07b@windriver.com>
Date: Mon, 18 Nov 2024 12:49:30 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [scarthgap][PATCH] binutils: stable 2.42 branch update
To: "Hemraj, Deepthi" <Deepthi.Hemraj@windriver.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: "Gowda, Naveen" <Naveen.Gowda@windriver.com>,
        "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>,
        Steve Sakoman <steve@sakoman.com>, Khem Raj <raj.khem@gmail.com>
References: <20241118075944.1914998-1-Deepthi.Hemraj@windriver.com>
 <LV3PR11MB86028FDA769516293301ABF08D272@LV3PR11MB8602.namprd11.prod.outlook.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <LV3PR11MB86028FDA769516293301ABF08D272@LV3PR11MB8602.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR13CA0194.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::19) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|CH3PR11MB8657:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d103551-552e-4519-0b23-08dd07f95bfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?M2d5RjNyTHQrK0UvREVrS1dDMnV6bVBsRk5GcmJNcVUwVXd4aS9HUkJ5aXZ3?=
 =?utf-8?B?Rk9EdWZZdExqN08zejZmN2JlODR4b0ZYZ3VCYXNHck1VbE94WVJIZ0lIR1Zs?=
 =?utf-8?B?cml3a081NFAzWjhsUDV4dzNUeXpnelc0NmxPaXNQVlV6Qkp3SmdIQmE4dWpi?=
 =?utf-8?B?WXAycGFNQ00xOE5ERld1dnFiYlR0Z01ZODNvbSs5RGFEc1BTN3UzQmlaVFE4?=
 =?utf-8?B?eFpNVDZqTTZZNm9NK1FIOUQ2MUp6bEpsOHJwVGFsQW44V0x2RUlTY0l3ZFhZ?=
 =?utf-8?B?Y2JRY1htZDZ3NlhDc00rUlJqazFSWWJVMFV2SDhIaEc4em1BM2g3WlZSSWtJ?=
 =?utf-8?B?QU9BcWt4U0Y5THZwSjhIWHBQYTk4VFpKWHV0WDBMcFltQWI5UEpYUmdSOXQw?=
 =?utf-8?B?bWg3bDRhWnhnTUQyblJDUndmUGh6MDRRL2RsYXBTR0x2UmlqQlRCTSs2OHQx?=
 =?utf-8?B?dHdzMVFTSzZuZEhkZjNiSGlUSTRGLzBGemYvQ0RnVjZtYmVwblZwOXVlM25z?=
 =?utf-8?B?YkdTcVZ2WHdRZENBeVZBMnN5Vko0MXl2enRDQkFFNEwyc2xob1hMYWx2QlFp?=
 =?utf-8?B?SmMzNGVPSFpuRUNLZ0V1dUx1L2tjb0V6dkdpOTZZN0xOSldSMFBqaUFzN3Zl?=
 =?utf-8?B?bjN4RXRaNHhPWjJBUjdJRjF3ZGpTYjZyOGhzdDJWNUNCQ2lSNzJNME8vMXhr?=
 =?utf-8?B?K2N1UWFCUUltc0cwT2cwNmVsRk96K0dtVnovVWxkN3dKOEk2Y3dmc3lLTVla?=
 =?utf-8?B?TGZUUnFHcmZjaTdYZlJmUnlicVRsTXlKcE5qMHYyazZrRWxEZFpCSFY4aFZv?=
 =?utf-8?B?Um5JR01kYnBKbU9WQjBiQmZwcU5DcjdZUTF2bWliUDlnaWFpRmxqamo0Nlgy?=
 =?utf-8?B?eVZ2R2tPMDNIVmV6eUMxVDdhbDlrZjJXUGRMQlM3VDVjSVlKRXdVaUdTcUIz?=
 =?utf-8?B?RXp1NTFhdzJ0aSttMHY5ZkdEcW5nNCs4SEh0c2p5K25IUFNjNGYwL2FQbTFl?=
 =?utf-8?B?TGZqNVA1M0YvYW9BTzN3L3lQdU4yWnEwaFJjaitWRUVDMTRFL2ZlRUxGS2ZL?=
 =?utf-8?B?MWg2aGRsSi9UeHd4UmZDVXBFeWhhMTFrNHV2WnVYci9tOHZ5UWV4VzlBVExL?=
 =?utf-8?B?RS81M1NwOVJxYlF2amxIUjFPQlVZVVBGVENhVGQ5OWVjZnVhZmlLWEsrUjNB?=
 =?utf-8?B?bGQvenQzeEltWlAvN1NCVTI5bG5RallnWGlvaDNYZHE4cVJieFNMMUgvNVJy?=
 =?utf-8?B?MFJXeDN5ZEY3ZFU3N01vdDZnNmdkM2R3WE10ZXlQdU5lQWNHMDc1SzJwNnFw?=
 =?utf-8?B?U0RSY3ppTkJ2blo1QkdNWXdsN1Y2eEtFclFGcFdkNUtGbGJtb2l2Q3BIS3hK?=
 =?utf-8?B?R0lHS3o3SUdBUFEzVUxlNldUR0MwUUt0ZEFCR2F1RDNYaGN3bnkvcEpPQ2Jx?=
 =?utf-8?B?a1NQSGJYbXQ5UFE2RG80OUlNaWF6UnNlcm9DSmRCcUoyL3NXenpRaDJ5cU5D?=
 =?utf-8?B?VzllcHVMOWdFZkUrRm9USTFxeGc1NDJleGNWQkYzZXI4ZGcrc1VGZjhPNi9s?=
 =?utf-8?B?ZThFV2x3cnBqU3ZwRUdrTm9QMnd5aHFXU0w5UUxUaGUwMDk5NmdGOWgrS3Uz?=
 =?utf-8?B?dzdWMk84a2dQZGtYbzNJQ3AxMHhudUZrcld6dWdQVVB2MU9FMzQ0TnM5K0tr?=
 =?utf-8?B?U3p6ZzNYcXUyY3Uwais3WG1kaFR5SkRYb25JVmFmc0Mwc0pHNkV5QXVKanpI?=
 =?utf-8?Q?vPcSW7A9Yv+JDvpi/gqp/xrcU8kpVKPwckT65+2?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UmJhZWZIajlLSkFJV05ncHdjbEFKb1dvQ05meHNnMzBFNEorU1ExWS9zbE1s?=
 =?utf-8?B?cXhOMjBKb3NmcDFZYm1PTmE0d2RWSWdET2hHNjltYmxQVlBXb20yTThDZ1Qx?=
 =?utf-8?B?VEp4Ry80K2pEc3lpT1I2aktzSlBLOG5nTUM1QldFNW81YzlRbU1TbkhKcWVq?=
 =?utf-8?B?ek9CaTZ0cDFzdFkzY0xwc1MyL016VmhIeHUvZGw2YzF4ektoa0E4azFLZDdZ?=
 =?utf-8?B?TFJJdmIyZmhKVjllSm10UmdEcEZXSENtTjJCWGwvaHJudDIrdlM2SE1YRERY?=
 =?utf-8?B?a2lOaFAzZy8vZHNkeGlEcHR5VGplRGhqa0xQaUN2cFpiaUQvRXZldjRqanQz?=
 =?utf-8?B?WkxpZUxRQldHSTl1SE1QQ04rRStScXBjcHlPcEc5c2lXTjFjVU1vUEFKZFdn?=
 =?utf-8?B?c0x4R21PUzYwcHc1N0RReTFzeW8ybXZYUmQ0anVoOHBUei9kUmtoNExXbmlD?=
 =?utf-8?B?SFZmSWUxeVowSElvaGhGc1h4UEh6T0FCb1Fpb0FpVVhVaGhzY1g5MnB0dmhp?=
 =?utf-8?B?RFdDbHRrNG1HQWhjWmF5Q25JQWZhZ0wvaFRDWTlFOC9ORHdMc0hxNll3UHZM?=
 =?utf-8?B?b0J0MFh2aHd0S2NWYU5aMUlVa3lMalc2dWdCQ0Q3MmRBNXo3dFBZUTlPak1C?=
 =?utf-8?B?clJLRDlCN1grQS8rNW5MeU96N0N1NmtSZHRqYll4K2hRMXBlZU1yOVlxck5P?=
 =?utf-8?B?L3dRNERxTndYK2FJRmtUOStZSC9xZlM0Y3BxK2Q1d0d5QlRpUVpseFYrL25N?=
 =?utf-8?B?Z3lYY1paV0tES3loZE5SV1FLTmdTSVF1bUpzdW9zNndiUklFRnhYYzdYVm1t?=
 =?utf-8?B?UTJWVXVSWmR4OGxCK2VwOWR3cStlSnhYZDNPMm1kNE1kbG1tS201eDRVVUlB?=
 =?utf-8?B?N3JZSXVlaE9zSFgzOHNKbU5NL2haZzZUdloySlZBUE03bEU1UUJieVVtdDVy?=
 =?utf-8?B?eWg1V2dEYmkrUTdKcWFPVW9vcU9tNmtOckxDNzNrN0dhcmRVa3ZJVWF1bUM0?=
 =?utf-8?B?NUpDb1ZCK05CaGpRSzF4ckR2eDljazRVcWpZeVFvNTloREdMNnJ1d3FnWXpI?=
 =?utf-8?B?Y3RCRi8vUnZKV085alNxSU1IV0NtR2x1Q21nbmRlUWdoUzVLQXFEcjdiZ00r?=
 =?utf-8?B?KzdHb2hoQWJ5Q1ZqVFFTcVJvb1o3OWo4dWhSUHBVamVqMEhmUzk1TnowOXd5?=
 =?utf-8?B?b01xU21VcGZlcEJxU1Jub3dacEVzdkNxcW9vQjR3VmNqWUM3OWVhejg3elN2?=
 =?utf-8?B?MTg5YTZMS3Q5bGtSVC9KMTRoOW5OM25DallqcjVSUTlsSlBUZnMvK0ZHVXdM?=
 =?utf-8?B?YlR6dDRIK1dsWXRCaWJDL1Z1OUJSTUMwTG5QZERjVlNhWlUwWExGclVtbzE5?=
 =?utf-8?B?THZyWG1ua0tLVlZHU09mcm9lOEtSS25QWFJYdGJhR2JrdTBYdlJIUWhWZ0FF?=
 =?utf-8?B?VnU0OFVBQy92QnJvdUVVTzhTbDMyeGM4dHFjZzZKaWFXUXk2a1gyczdQVk1p?=
 =?utf-8?B?Z2cvSXA2czNBeFBMWnM2NkhRTjV6UmZJY1pST1Z5NzBrQ0FPYmlBbXhod0pr?=
 =?utf-8?B?UkxGSjA3M1ZWS1N2Yml0OCt0R2FTZ3hybFM1SU44OEJEdkp5NVlmU3BseDRW?=
 =?utf-8?B?aEhaUGc0UzN2NjVtR3dhY1NtR09iNHlRRDFZRzRLWW1iM01scVBJR3laejdZ?=
 =?utf-8?B?c2lObEJjWkJsZVp4LzErQWVGZ1VFL3hFdjVQWW9JTWl6TGk1N1lEemFuY3R5?=
 =?utf-8?B?Zk5oeUdyeDhHTmZpSE1uRDh1SmZXNjd3U0NBdnJWQ240OTZxelNkaElrU01D?=
 =?utf-8?B?Z1RobEs4d1F2U21NMWtCNllIdDlLVFRrVTl4WkoxbkJ5S0wyWTc0eGNpNkJv?=
 =?utf-8?B?dUtLdDJvTU4vQmx2clU2aE5xTElZdi9TSVR2WmlNKzg4Tm5heDJORVJJVVk2?=
 =?utf-8?B?MDJQZEkzQi9EdFBBclZnVjU3UnY4WHo0dks2UlM5V1Q5QmFRT3d6QlRNaVJL?=
 =?utf-8?B?NWZyS3ZHdnViSWMva1FBU3p1K3g4ZmxvbVJBTFAwTDdER3RYSFhJWEFkT1pM?=
 =?utf-8?B?V3UyS0pJUmt0Z2pIZnpqWU40akZydC9GejN4WFNsT012Wmpqam5IbzNVdUFT?=
 =?utf-8?B?dWdLRzhFcm1iR0trV2tsbGhHcXNTM0xqaEV6a29xWEt1N2twbm5lSEtDZ0Rs?=
 =?utf-8?B?NEE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d103551-552e-4519-0b23-08dd07f95bfd
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2024 17:49:32.9731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jGMVO1G4/8zACS9657/EqX6NcuDSsp73gbene5FAApIs8bMIN4tnlUP/OsmdlIvvioMEHDKYM7ln70OaJjcSfCBixGrxPEDy5WUBph4BBFI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8657
X-Proofpoint-ORIG-GUID: Ly1RsxWYWors3gXbrsp6PcoMR1127wjX
X-Proofpoint-GUID: cB_01TL8u4kC60kvtF60kc9Jh5eAS4et
X-Authority-Analysis: v=2.4 cv=Sb6ldeRu c=1 sm=1 tr=0 ts=673b7e32 cx=c_pps a=+tN8zt48bv3aY6W8EltW8A==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=CCpqsmhAAAAA:8 a=Ec9K7kjZFTjOKK9LYfAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=UqCG9HQmAAAA:8 a=nFzeUjvz8-WTFiPXLggA:9 a=H_5yvEwIrcRSbyc2:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-18_14,2024-11-18_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 mlxscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411180147
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 17:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207229

--------------cWyou01rNC5ZriwNtyGhoa1G
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4AICNdWf009516

On 2024-11-18 3:20 a.m., Hemraj, Deepthi wrote:
>
> -----------------------------------------------------------------------=
-
> *From:* Hemraj, Deepthi
> *Sent:* Sunday, November 17, 2024 11:59 PM
> *To:* openembedded-core@lists.openembedded.org=20
> <openembedded-core@lists.openembedded.org>
> *Cc:* MacLeod, Randy <Randy.MacLeod@windriver.com>; Gowda, Naveen=20
> <Naveen.Gowda@windriver.com>; Kokkonda, Sundeep=20
> <Sundeep.Kokkonda@windriver.com>
> *Subject:* [scarthgap][PATCH] binutils: stable 2.42 branch update
> From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
>
> Below commits on binutils-2.42 stable branch are updated.
> 09ba78f0513 LoongArch: ld:Report an error when seeing an unrecognized=20
> relocation
> 00abcf39930 s390: Add arch15 instructions
> caf72067a77 s390: Relax risbg[n]z, risb{h|l}gz, {rns|ros|rxs}bgt=20
> operand constraints
> 543a22c7ee3 s390: Simplify (dis)assembly of insn operands with const bi=
ts
> 7c94c87d463 s390: Align opcodes to lower-case
> fffb4fae823 s390: Flag conditional branch relative insns as condjump
> 2d238ecbe50 s390: Use proper string lengths when parsing opcode table=20
> flags
> 10d0dd2ba2b s390: Whitespace fixes in conditional branch flavor=20
> descriptions
> 10a143e273c LoongArch: Add elfNN_loongarch_mkobject to initialize=20
> LoongArch tdata
> 9055fbe5ffb LoongArch: The symbol got type can only be obtained after=20
> initialization


The changes are all for arches that we do not support.
Merge to keep up to date, I suppose.

../Randy


>
> Tested on qemux86_64.
> There were no additional PASS or FAIL after the update
>
> Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
> ---
> =C2=A0meta/recipes-devtools/binutils/binutils-2.42.inc | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc=20
> b/meta/recipes-devtools/binutils/binutils-2.42.inc
> index 5d5ba3d6dc..bff97b50c3 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.42.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
> @@ -20,7 +20,7 @@ UPSTREAM_CHECK_GITTAGREGEX =3D=20
> "binutils-(?P<pver>\d+_(\d_?)*)"
>
> =C2=A0CVE_STATUS[CVE-2023-25584] =3D "cpe-incorrect: Applies only for v=
ersion=20
> 2.40 and earlier"
>
> -SRCREV ?=3D "8a6764d35e5c15d78de8aef8f27af3eefd9d7544"
> +SRCREV ?=3D "09ba78f051319e8f8861b26fb9340e21ca973c70"
> =C2=A0BINUTILS_GIT_URI ?=3D=20
> "git://sourceware.org/git/binutils-gdb.git;branch=3D${SRCBRANCH};protoc=
ol=3Dhttps"
> =C2=A0SRC_URI =3D "\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${BINUTILS_GIT_URI} \
> --=20
> 2.43.0
>

--=20
# Randy MacLeod
# Wind River Linux

--------------cWyou01rNC5ZriwNtyGhoa1G
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2024-11-18 3:20 a.m., Hemraj,
      Deepthi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:LV3PR11MB86028FDA769516293301ABF08D272@LV3PR11MB8602.namprd11.prod.outlook.com">
      
      <style type="text/css" style="display:none;">P {margin-top:0;margin-bottom:0;}</style>
      <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
        <br>
      </div>
      <hr style="display:inline-block;width:98%" tabindex="-1">
      <div id="divRplyFwdMsg" dir="ltr"><font face="Calibri, sans-serif" style="font-size:11pt" color="#000000"><b>From:</b> Hemraj,
          Deepthi<br>
          <b>Sent:</b> Sunday, November 17, 2024 11:59 PM<br>
          <b>To:</b> <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a>
          <a class="moz-txt-link-rfc2396E" href="mailto:openembedded-core@lists.openembedded.org">&lt;openembedded-core@lists.openembedded.org&gt;</a><br>
          <b>Cc:</b> MacLeod, Randy <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a>;
          Gowda, Naveen <a class="moz-txt-link-rfc2396E" href="mailto:Naveen.Gowda@windriver.com">&lt;Naveen.Gowda@windriver.com&gt;</a>; Kokkonda,
          Sundeep <a class="moz-txt-link-rfc2396E" href="mailto:Sundeep.Kokkonda@windriver.com">&lt;Sundeep.Kokkonda@windriver.com&gt;</a><br>
          <b>Subject:</b> [scarthgap][PATCH] binutils: stable 2.42
          branch update</font>
        <div>&nbsp;</div>
      </div>
      <div class="BodyFragment"><font size="2"><span style="font-size:11pt;">
            <div class="PlainText">From: Deepthi Hemraj
              <a class="moz-txt-link-rfc2396E" href="mailto:Deepthi.Hemraj@windriver.com">&lt;Deepthi.Hemraj@windriver.com&gt;</a><br>
              <br>
              Below commits on binutils-2.42 stable branch are updated.<br>
              09ba78f0513 LoongArch: ld:Report an error when seeing an
              unrecognized relocation<br>
              00abcf39930 s390: Add arch15 instructions<br>
              caf72067a77 s390: Relax risbg[n]z, risb{h|l}gz,
              {rns|ros|rxs}bgt operand constraints<br>
              543a22c7ee3 s390: Simplify (dis)assembly of insn operands
              with const bits<br>
              7c94c87d463 s390: Align opcodes to lower-case<br>
              fffb4fae823 s390: Flag conditional branch relative insns
              as condjump<br>
              2d238ecbe50 s390: Use proper string lengths when parsing
              opcode table flags<br>
              10d0dd2ba2b s390: Whitespace fixes in conditional branch
              flavor descriptions<br>
              10a143e273c LoongArch: Add elfNN_loongarch_mkobject to
              initialize LoongArch tdata<br>
              9055fbe5ffb LoongArch: The symbol got type can only be
              obtained after initialization<br>
            </div>
          </span></font></div>
    </blockquote>
    <p><br>
    </p>
    <p>The changes are all for arches that we do not support.<br>
      Merge to keep up to date, I suppose.<br>
      <br>
      ../Randy</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:LV3PR11MB86028FDA769516293301ABF08D272@LV3PR11MB8602.namprd11.prod.outlook.com">
      <div class="BodyFragment"><font size="2"><span style="font-size:11pt;">
            <div class="PlainText">
              <br>
              Tested on qemux86_64.<br>
              There were no additional PASS or FAIL after the update<br>
              <br>
              Signed-off-by: Deepthi Hemraj
              <a class="moz-txt-link-rfc2396E" href="mailto:Deepthi.Hemraj@windriver.com">&lt;Deepthi.Hemraj@windriver.com&gt;</a><br>
              ---<br>
              &nbsp;meta/recipes-devtools/binutils/binutils-2.42.inc | 2 +-<br>
              &nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br>
              <br>
              diff --git
              a/meta/recipes-devtools/binutils/binutils-2.42.inc
              b/meta/recipes-devtools/binutils/binutils-2.42.inc<br>
              index 5d5ba3d6dc..bff97b50c3 100644<br>
              --- a/meta/recipes-devtools/binutils/binutils-2.42.inc<br>
              +++ b/meta/recipes-devtools/binutils/binutils-2.42.inc<br>
              @@ -20,7 +20,7 @@ UPSTREAM_CHECK_GITTAGREGEX =
              &quot;binutils-(?P&lt;pver&gt;\d+_(\d_?)*)&quot;<br>
              &nbsp;<br>
              &nbsp;CVE_STATUS[CVE-2023-25584] = &quot;cpe-incorrect: Applies only
              for version 2.40 and earlier&quot;<br>
              &nbsp;<br>
              -SRCREV ?= &quot;8a6764d35e5c15d78de8aef8f27af3eefd9d7544&quot;<br>
              +SRCREV ?= &quot;09ba78f051319e8f8861b26fb9340e21ca973c70&quot;<br>
              &nbsp;BINUTILS_GIT_URI ?=
&quot;git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https&quot;<br>
              &nbsp;SRC_URI = &quot;\<br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${BINUTILS_GIT_URI} \<br>
              -- <br>
              2.43.0<br>
              <br>
            </div>
          </span></font></div>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------cWyou01rNC5ZriwNtyGhoa1G--

