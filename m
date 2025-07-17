Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18130C83F1A
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 09:51:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.45021.1752745891467018299
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 02:51:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=92934ef8f0=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56H6T82B153688
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 09:51:30 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47wdva2wb9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 09:51:30 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 56H9pU95487596;
	Thu, 17 Jul 2025 09:51:30 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2054.outbound.protection.outlook.com [40.107.236.54])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47wdva2wb8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 09:51:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DU5p9gbDSyNyteu+BSMrKCXOLCysLhFSOl7XE0CFsPAn7xeQQvKPfCoKqpoVPz8hQgo/j2djU1FDvwt7nrCrobf5S13Ezslys8ZPVzNvxbcVtdtsXZ+swX8sH83Vx+Ohb9Nk3NmnBT7iANyM5bsdMezkbCrmWjOWDfl6TODRPClEFitocvJh2dR51+k8GO5e61QTV7hOhOAV5n+VXiivJ78kKhGNduKVdRQdaA/xBHM/jU4khgH3ULwIeVf8UkelP8muqm+yJJRJH89VxCAf2PqLXeYSlzMGsVh4WR4oYcfK3vI2Xt+XIO8g8F/kcAtT0/VkmWrgXVlC5MhEKuNTaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ofqi/h9jzT3nW4OQsR7rie6gvN4mM6RwvMfCPR/jNts=;
 b=MOlIYJGlLsdM1sMGJftaixw9xl4ze5uYv6Vdyw/9eU8g5j1Nd2I64e5jF+86/BNyBajWwjAxxy0bJywIuOEGtgs6qYaBRVXRC1+enRxlwPAiQ/pfzCk0rRRwyWYQyGlG2Pl0gpaFyvXW28UhdwbvUCM2JwYao0ofQhTgSw8+eeP/5Ed+faoc5B9NmjZwFQ6ZPBB/Y1TMjbglm1DsAjuG3h6JW3FJPubSPE9kOYBT0w02o3D/2FWPU3EPip92hVpeF7jSB3l3yZ1sNpiKAfO3LxskTeSCSCy/re7nnn6n0IoJBgn4SUpdhpYhi8YifclmWS2lZh4PwS/7gGGVNszliQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by SA0PR11MB4752.namprd11.prod.outlook.com (2603:10b6:806:99::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 09:51:28 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::7ff0:a398:beba:1ce7]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::7ff0:a398:beba:1ce7%4]) with mapi id 15.20.8943.021; Thu, 17 Jul 2025
 09:51:27 +0000
Message-ID: <5d5cbde0-eaad-461b-b878-cbd1411352cc@windriver.com>
Date: Thu, 17 Jul 2025 17:51:22 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/2] lttng-tools: Upgrade 2.13.15 -> 2.14.0
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        mingli.yu@eng.windriver.com, openembedded-core@lists.openembedded.org
References: <20250717082216.459161-1-mingli.yu@eng.windriver.com>
 <20250717082216.459161-2-mingli.yu@eng.windriver.com>
 <DBE8DHTVEB13.27BZ3GL6DGZ1Z@bootlin.com>
Content-Language: en-US
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <DBE8DHTVEB13.27BZ3GL6DGZ1Z@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SEWP216CA0026.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b6::15) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|SA0PR11MB4752:EE_
X-MS-Office365-Filtering-Correlation-Id: 12077de8-df01-4571-b083-08ddc5177fd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VlBiRG5wSEovODBuVm9wQlQxTTFYUDFyUFZsR0RJamhrbUlFN1NTdWhOWVhy?=
 =?utf-8?B?ZDJPb1FEWHorZlpCRVMrWUZUWXVhMVJHQjBqdVhXK2FVZWR5TGlFRlRCY1pB?=
 =?utf-8?B?dmYvbWNIdGpDdUZvb3kxRkk0K283TjF1K0lubWdoK2FVdEtDcUQ4c1pQVUxW?=
 =?utf-8?B?N3hGVjRYM01OQkY1UVZFT01lU3dKYWtYVkh1MWptdytIY0s2U3M2SkV6UTNw?=
 =?utf-8?B?Q2VXcWdLMmx5YlV4bERsYm5CTVNsNGY5RVpiQWw4SzJBWjB5Ym84ZUo0S1VG?=
 =?utf-8?B?Qm1iSU5YSkQzWktDbVBVd2FSRjhETWQ3d2FKRC9oUzE2Mjh1ekoxeTdCUDMv?=
 =?utf-8?B?M2xLU0FicFdBa0xob2F0M3NCWE5icUhjQ1dxNU5Dank3cEtNdlRVcyt0UUJv?=
 =?utf-8?B?ZERtOTFHdDZ6UDYvVnNCb2tDY002c01mR1dyK256L1p4R3pTU0xveG56NlVW?=
 =?utf-8?B?KytuWStsdWtzWldwbFhyMFlmK1ViVGJ2bzNaa1RNd3QvQzdVcGhSa1ZPOEY5?=
 =?utf-8?B?UncxWjBrdk9RYnhFY2h6YnhRSVJXd0Q0bmN1WGY5dkYxNUE2U09veDNRaldF?=
 =?utf-8?B?TjZZY1VzQ1hpM0ZabHhIM2V0YUtIVE4xR1ZCUG1NcDlsWWpmeE05WW1NbTcv?=
 =?utf-8?B?dERpck1MSjc5TG56alFCeEZLNTl6SnBXbzczaGtxRHVwcUkvRGY2RVVhcjYw?=
 =?utf-8?B?bmp5azJDVm82eGR5d2ZRZFBoMGdvSWpNbFhIZjlPekJUWnN3TzFkVmZTV0o0?=
 =?utf-8?B?RXZ6bGhsV0pBTmFQMi8rMWFRcTByUlcrUnpLRnlDWUs1eGpNUm9PK2VHVy85?=
 =?utf-8?B?WVNmQmlVYWR6VVFnNjREQi9nQXYyMm9CK2ZKbE5RcTRPOUxqbXhybzFnenRv?=
 =?utf-8?B?L3gyb0tVT0Vwb2NtK1A3dng1NnBhVW10Uk5IdFFTVUhJb1FObFJ6RXdrcjhm?=
 =?utf-8?B?OU5PK0s4UCtPWEsrUzEzTFlFb0dJZjU5TmZONzF6R24zUExYbittU2daLytn?=
 =?utf-8?B?enFiS1cvditrSnBnU2JlRlhyN3NuM3M1VmJIbDhWUk9ocHNkaG1NZzFIaE02?=
 =?utf-8?B?MkpzT2IvNzFuT1pBdzArSFZDRnFDMktpc1hNZFA2RW9DS3htL1BtaVFBMlk5?=
 =?utf-8?B?MmEwMjAvUitkd2Fwc0V5ODk5blg5UnhJNVFyOXdkRk95eWR1eG9zQkNsT21R?=
 =?utf-8?B?WmtxVGpWYlJoWHA0T2dJOGdqOHRDdGVUeWk3T1VEZ0U5QXFOU0sxYk9OR3ZR?=
 =?utf-8?B?V1ByaGFNZjlENTdJZEs5cWdsZUF3Y2YxUWwrODBOUXJWbGtyZHZVSTMvZURB?=
 =?utf-8?B?ZzdYaFo5MlJsTTV5NS9tNEV2ZVhTYi85NTREYVFieU5UeEg1U2x2b0d3Tktk?=
 =?utf-8?B?WU5IU1Z3NkMySXJ5L1hxeEl0N1FqM2Vwc2graTdaK092Nk9BNmwvcSs3Q1Nj?=
 =?utf-8?B?SXhWL0hXUzIzK2hyeDlVNy9DZHJWWFRFck1NekpESTViWHlMNWNxN1hwODhv?=
 =?utf-8?B?cTZYSjBUV2hiY2M0S1hXSENJMnI0OFVrOFVZeDZhU0JLNlp4MnZIdEpSdlJ0?=
 =?utf-8?B?SGU5WGpBU1pTaFFtazVYQ3hJVk44S0cyTzVFRG9xZkNEYnhYQmV6a256ZCtE?=
 =?utf-8?B?RlVrcURGdXpaSXFGb0hEOFIxYTF3dUN4OWxaOTFTTFAyM0IrU2dVblVKd1Q0?=
 =?utf-8?B?SVhrVkhIS1Z3ZmVJOU5kaHo1K0MweDV5VkR2Y09YMDFXdkRxM2ZPUnJyZFl3?=
 =?utf-8?B?S2lwSFNFeXU3cHJlVFZIVVJZRzVzblRwSzNFK2owMm1FamFhOGZBemMrdmZF?=
 =?utf-8?Q?bIpN/Ixp11bsOtTPyPHByw0+AswD8bahuT5GI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bXNBWENucTJoRkxtK0ZyekV1VWdxaWQzN1d2OWtBWXVYMXVqYlNpeU8wVTJR?=
 =?utf-8?B?cXNVcTJiMnhxR1VLb1hMNE5hMEt2ai9lZEdnSjg5ZlYxMitWUWk2R0lTUWFP?=
 =?utf-8?B?STdYYURVYnkrOGt2ekNnRnd0Ykh2MWpmNER4NmxIMmFoeHg4T01kcXhLR292?=
 =?utf-8?B?N2hKbExiS0IrN3RueDYwc1ExUnFFckRkUXJ4Vis4ZXJQTVFyZGp6MjdLR3Er?=
 =?utf-8?B?VXJyRzFvdWU5Wmh2OWtqR1BNL0ExN01yYTRuZWorSHpJNVJRQlhuMVlIeVhX?=
 =?utf-8?B?Y0tybkRhVUZqN24wMFozMGlhNlpUQUJFenArS1g2K242a2pwK25GOVhsM21K?=
 =?utf-8?B?NUg0TFlNVUp5Q0tEdXBneTVGd0hXT24zemJZajdEWVErdHRvQWRCRmg2Zm1C?=
 =?utf-8?B?MnFSMjdLZGdBdEdzRFAwR05rL0crZGttL0Q4K2dmbUhKYzJQN01oM2F6bEp4?=
 =?utf-8?B?TWxOb09UQUNtN3RWamxqRXFOYmVqa2l6dmdxbUtSNzZlczhTdW53UGp3Z2JU?=
 =?utf-8?B?MnloWExjbkc3K091eDNOTHhIK0dPRkhMY2I3REdLN0g0OGJHN0xsYXFidEtM?=
 =?utf-8?B?ZzdZV2lHeGwvM1RValJXTEVKS0NQOVE4ZkhTR3R2V3VKaitpSTV6ZlJ3a01V?=
 =?utf-8?B?cWoyQ2VPTUNXZVhwTXhIdUF3TzEzNEZaNFNySWdmNDBKU09mYisxQlpwOENY?=
 =?utf-8?B?eVZQdzRDM0hmS1ZmcjFlY1Z3ckdacHY4MW8ydHNmVzk4RERuMmZwNzc5cnd3?=
 =?utf-8?B?TWg5SXVrY2k4TnlwQVF5Sll1Zzd5QzIwWGU2a29TY1ZUKzJjOTlIWHpmVjZl?=
 =?utf-8?B?ZG1EajZDdnhLOUl6RldENTBDc0RBUlF6bWJFaFNXTmc0ZTBIQWtvS1drQ3hl?=
 =?utf-8?B?ZjRDby9RUFNGdUhrOHdtRnAyTTdueXhwd0RnR05rTEg1WGVYWTk2aEsrc3Mz?=
 =?utf-8?B?YkNVb2JXZnJZcGtCZkdLZm13UjFBOFIyVFZzWGZzWk1nR000WHZ1ODdDVlB6?=
 =?utf-8?B?UFhDVXdNQXVQUlhaRTgzeFpZMDZtckt6S2kwRUdFSitVS3dwYndacTJKYUtQ?=
 =?utf-8?B?OWg5ME1nKzBRRHRnWDhMcGFLN2pSNWZmSkN0Z1M4MnFjcUhGa1p0aDkzWUdT?=
 =?utf-8?B?eXpPRjZBTFRDNng4UGdBRHBzbThSK21ReUZGMW9aUGo4ZTNWVThYQkN5MWFZ?=
 =?utf-8?B?MUtBWC9rNEdyMDRGV0hMYk93S3ZNMUFvbDZXNFNSNHEyVzU0T1pnc1lNZDN1?=
 =?utf-8?B?andOUGlnTzFsbTh0dHh3aUhsZGpKcHFFUVBVWmVzVDArRTQ4L0F3RjJrZHlH?=
 =?utf-8?B?WTFPYjdaRGNHK1Ivc205b0ZSRkwyWWNVRzFTWURvbVNXdW5JVVJHRC95angr?=
 =?utf-8?B?UURqOUlhZWk3WW5zRGxndXJheUZURDZOMldVMzBWTkJtdlJLS2xvUy9DTUVx?=
 =?utf-8?B?Y3hBdzJKMjhGUmQySWdNNFFHcW9NOW91dlo4Rzl5bnFDTGxlUFRZUEw5aHFw?=
 =?utf-8?B?MUdHOHRrVlV5Z1R1Y2RGMUZYVlVMTC93dDBEOGRQYkVFV2E1ejNBbTgzdkl1?=
 =?utf-8?B?ZnZRZi9mQzRzcTNDaWhiRWVHSithcjVoZDB5LzloMCtRemJDWFF0QzJ4WWRV?=
 =?utf-8?B?ZDRyR3l5eHFTRHhvWThkSG9hZE1pdCs4SFpjaUhaOU9HYXE1THlHbjdzTWRn?=
 =?utf-8?B?VmxhZDZzT2pJejVPTFp1aTh1SHhlVXBtcWVvbXkzZmhpQktaN01YQmZ0WXJi?=
 =?utf-8?B?dmV3dGl6VGIvSytBanJ3UVNWdTNJdXhhYW5RK3RTNXhXTm1VRGJyUTNYU2tB?=
 =?utf-8?B?SGhURjZNNGYvQUQxR2VWcmRVS2paUWNzNmRscmROKzYvY0ZuQ0gxT0FhOXhJ?=
 =?utf-8?B?SnlPTEk0eksyTlBBKzI0SVFtTWRUMEpzZmxqbmNGZTRWTS9JSkN0YkJmY0p3?=
 =?utf-8?B?OUFXcmpZNVoxK1JyNVNCY1lBT0ptM044bm5BZHpaZ0k2MXBZUE9yQ050LzRL?=
 =?utf-8?B?TitSSURDOG4wQzlHVTZNSVFqcnNaRzc1UCttK01uT3hXQVpsQkVlSWRuLzV5?=
 =?utf-8?B?eEd5TDBick0rdTc5NFJQcDhVTmxVckIrTGZteENZZHNNakk3MERQT2ZvcTg2?=
 =?utf-8?Q?iWmiSdhd3ncAqzF7OZ5jciEzq?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12077de8-df01-4571-b083-08ddc5177fd1
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 09:51:27.8115
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /tMwJ1q/qXDZ1JN5Z+5r407DUv4jKSlPK5UZ9Zyz25HkEzBTjU9cm7afk7QaPbqk5S+YMzYk91YhGnNCTe6c6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4752
X-Authority-Analysis: v=2.4 cv=AbaxH2XG c=1 sm=1 tr=0 ts=6878c7a2 cx=c_pps
 a=edAnfM5la+mS0bQuDOiirQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=NEAV23lmAAAA:8 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=5-FZmmoXwXIsBE_wLeQA:9 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=d3PnA9EDa4IxuAV0gXij:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 1-Zanh9FyyGdSdQ-na0CAA2t_vxV0_pL
X-Proofpoint-ORIG-GUID: sQEFmFeCcTTlfwjYVr8kMZ9mGLukXTTz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDAxNyBTYWx0ZWRfX64yoT4Do7ZFW
 Bo5vdS3hpZkzGriItBWxzDgwR/UEzXQ5ab7a82VRJK1z/qmRnZhQQ2TevIEcWOxsXSb0BBsnEw7
 NEt3oI3IZBdf408KK/rz6j6WVAc2wawbt7F0nMUlvZy7oijCkvmifFutd8MyfeoaKd0V+3BmNVx
 AzLwy34XtzLS5HB59jwXsoL0Oq/X1KPGjrz/rSY93wiy3IZQG5n3yrzQbw3SSm5aX/1v34VQdGO
 0+haRrTESMNj/jTu04OAAbiW/KMHHfLWmMjpg7R5iXHFLvMnmTCQtvNTheXhYHO0oWJET5gfGPC
 gUtedVjITc9q3VgsxecRx1scYbwEwPtrWxitjz3hgZX0FygMN0laa0a2poR31JkopmAz20hFQPw
 jV8FIzip
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1011 priorityscore=1501 spamscore=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507150017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 09:51:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220527



On 7/17/25 17:42, Mathieu Dubois-Briand wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> On Thu Jul 17, 2025 at 10:22 AM CEST, Mingli via lists.openembedded.org Yu wrote:
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> Remove 3 backported patch.
>> 0001-Fix-rotation-destroy-flush-fix-session-daemon-abort-.patch
>> 0001-compat-Define-off64_t-as-off_t-on-linux.patch
>> 0001-tests-add-check_skip_kernel_test-to-check-root-user-.patch
>>
>> Remove 0001-fix-lttng-tools-fails-to-compile-with-libxml2-2.14.0.patch
>> as the the issue has been fixed in another way as [1]
>>
>> Rebase 0001-tests-do-not-strip-a-helper-library.patch and disable-tests.patch
>> to fuzz issue.
>>
>> Add babeltrace2 to DEPENDS to fix below configure error.
>>   | configure: error: libbabeltrace2 is required to build tests
>>
>> src/common/config/session.xsd is restructured to src/common/session.xsd [2]
>>
>> Add 0001-gen-ust-events-constructor-change-rpath-to-libdir-li.patch to fix
>> the below buildpath QA issue.
>> ERROR: lttng-tools-2.14.0-r0 do_package_qa: QA Issue: File /usr/lib/lttng-tools/ptest/tests/utils/testapp/gen-ust-events-constructor/gen-ust-events-c-constructor-so in package lttng-tools-ptest contains reference to TMPDIR [buildpaths]
>> ERROR: lttng-tools-2.14.0-r0 do_package_qa: QA Issue: lttng-tools-ptest: /usr/lib/lttng-tools/ptest/tests/utils/testapp/gen-ust-events-constructor/gen-ust-events-c-constructor-so contains bad RPATH /buildarea3/myu2/yocto/builds/ptest-2025-07-09/tmp/work/core2-64-poky-linux/lttng-tools/2.14.0/build/tests/utils/testapp/gen-ust-events-constructor [rpaths]
>> ERROR: lttng-tools-2.14.0-r0 do_package_qa: QA Issue: File /usr/lib/lttng-tools/ptest/tests/utils/testapp/gen-ust-events-constructor/gen-ust-events-constructor-so in package lttng-tools-ptest contains reference to TMPDIR [buildpaths]
>> ERROR: lttng-tools-2.14.0-r0 do_package_qa: QA Issue: lttng-tools-ptest: /usr/lib/lttng-tools/ptest/tests/utils/testapp/gen-ust-events-constructor/gen-ust-events-constructor-so contains bad RPATH /buildarea3/myu2/yocto/builds/ptest-2025-07-09/tmp/work/core2-64-poky-linux/lttng-tools/2.14.0/build/tests/utils/testapp/gen-ust-events-constructor [rpaths]
>>
>> [1] https://github.com/lttng/lttng-tools/commit/2d2e77ddc9e3e63c3c658e824fb754f5a534a6ab
>> [2] https://github.com/lttng/lttng-tools/commit/4ae042345b4094e98611744d9ba6c92265058fdb
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
> 
> Hi Mingli,
> 
> Thanks for your patch.
> 
> It looks like this is breaking when using musl:
> 
> ERROR: lttng-tools-2.14.0-r0 do_compile: oe_runmake failed
> ...
> | ../../../sources/lttng-tools-2.14.0/src/common/eventfd.cpp: In lambda function:
> | ../../../sources/lttng-tools-2.14.0/src/common/eventfd.cpp:18:31: error: expected id-expression before numeric constant
> |    18 |                 int flags = ::EFD_CLOEXEC;
> |       |                               ^~~~~~~~~~~
> | ../../../sources/lttng-tools-2.14.0/src/common/eventfd.cpp:21:36: error: expected id-expression before numeric constant
> |    21 |                         flags |= ::EFD_SEMAPHORE;
> |       |                                    ^~~~~~~~~~~~~
> 
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/111/builds/790
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/2072
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/2102
> 
> Can you have a look at these fails please?

Okay, I will look into this and send v2 then.

Thanks,
Mingli

> 
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 

