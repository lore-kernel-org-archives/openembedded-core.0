Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70521C5B552
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 11:32:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.84699.1749555159164904741
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 04:32:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8256183154=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A3J8PM000380
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 04:32:38 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474mxm2p2c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 04:32:38 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55ABWbNp028877;
	Tue, 10 Jun 2025 04:32:37 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2088.outbound.protection.outlook.com [40.107.93.88])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474mxm2p2b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 04:32:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OUwuGjMRLGKctymjK1gvFZX6PJxv9pKMUoemjQBiY7u95rOUp+YgCqUCa42p2zdGjUXigInu1r9+CrtbZJ9c6mlJSDWUCa6oRhKDS3LZdV4HGsYxDcatdL0oX6HZFU3uHobhNEF/awyI7nzyrYKt8vYK5GGzSAixl5x3ujuas3Q/P4vO/7wWoGzp2tMGZnIep0Gz4EAz71UEOCmO//a3x06l+1nQuA+c6FHj7CZTP0fiK2Y2KYvOth3YC0dABXS+2/YErAFfwsoePvVNQk7Vp3v4SShy2Fmyk3YVsJ3gBEBVJ+KWoTOh6lgFAhUIHr9hBcAo0CMOUObVLgaPaKV0AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WsACJPxPAnoMbnq/bcBlNe4PaRnEbux1qRbTj3vBxb0=;
 b=k0TW0vesQyAKdGuXb3md3gr91MwYn8yxHJAahykgHv5cRMvkJq2kSv00ZkPf5f6LrAYBKfCzU4JVzaioucKQGhfwIg4UQ900e3weBINJT7xJYahwPY/BQPw1CfD4eQSEbzUp8LR4Kf3v8D6oUjY2klzuKGBM+AzvNMMFERKekV7xyIWyklX3QCfy87O8feThAZjkZo5STgYa8cxxA0318hsolOPe2K1HGdX1lmGy9hvBJyMcp/MlPFOVV0VXwoxQED8+8nE00jaGm5cTPRRO04FaPKyJjqzBy/t/qu2/t2VEIs0NK1N9DSF5oMKWdaJJazFt/pv9SpsTx5i7HqEy5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB8527.namprd11.prod.outlook.com (2603:10b6:510:2ff::9)
 by SJ5PPF263E38237.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::81a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Tue, 10 Jun
 2025 11:32:34 +0000
Received: from PH7PR11MB8527.namprd11.prod.outlook.com
 ([fe80::3b8:836:a6b7:dcc7]) by PH7PR11MB8527.namprd11.prod.outlook.com
 ([fe80::3b8:836:a6b7:dcc7%5]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 11:32:34 +0000
Message-ID: <b38d42b5-c6df-4bcf-bdeb-b3cc32808e1b@windriver.com>
Date: Tue, 10 Jun 2025 19:32:24 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 2/2] automake: 1.17 -> 1.18
To: ross.burton@arm.com
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <cover.1749554012.git.liezhi.yang@windriver.com>
 <3a20c600314b7acb3eb3015583a6cbc4ceb4970f.1749554012.git.liezhi.yang@windriver.com>
 <2420FDDE-F7F7-4A02-8696-66554E56924A@arm.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <2420FDDE-F7F7-4A02-8696-66554E56924A@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TY2PR04CA0003.apcprd04.prod.outlook.com
 (2603:1096:404:f6::15) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8527:EE_|SJ5PPF263E38237:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ffab143-d2eb-4f48-ef01-08dda8127c19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|4022899009|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aXV5TVVaT3M5MnVuL3ZVSThzV3VNM2ZjbksyQ1UyNjdJQXNXYWl3MlN5SFBr?=
 =?utf-8?B?TlFOelJMK0VRVG0rQUJTRHdMazgxak1heS9SS0traG9nM2JFdXFsTExUZmVN?=
 =?utf-8?B?Z0d6YW11WW8zV0VzU0swQXVkYnNqUCtNaHhxWXNUUTE3bVVsaDJwSVhIWU85?=
 =?utf-8?B?cXloMGQyNmIwdjlXUVdPU29WRTJmNUZVVDRacDFnd2dlcUR4TE96SGxNWjVu?=
 =?utf-8?B?NWJpR2lsWE03TDFkaDgrK1hMYklxNW04Zys1MDJwTW1XVVRmekllQ2R5VDFt?=
 =?utf-8?B?U0tEZ2lyZ0tnZ1dZZzViOHBCdVdTUGQzVkdYV1ArYnFLaVZ4a1BQazRMa0VL?=
 =?utf-8?B?amNHaTBWbW8xV2hKNVJEdkRVckMxOVFMcElEVmU3YmdvbWgrMkhoUUlrL3FS?=
 =?utf-8?B?SDlWdG11ZWU5ME9HcXNFT1dCbS93SVUxemdBY2lzRVM3enJCMTd4Y09kaU50?=
 =?utf-8?B?OUlBTmppK3gxNVZmK2lBaHRFVWt5bW01cDdkcm9TVTVOaXpsa0hsUGNXWjQx?=
 =?utf-8?B?TkgrQmdXM3NVWXlHanVRdFhTajMrdzBOcFVzdkFKd0h2TzhDTzFyYkdmdzhH?=
 =?utf-8?B?M3ovZld0S2JFZ0N4VW50UXJYZVhpN0Z2dHBxZHVrbW5TNzZGVjVrMkFEeTMz?=
 =?utf-8?B?Qzd5VkVyd2F2U1lFQlExWWpYVFVaMC83SFRsZnBLOVRUeHdQcXg1MW1CYmpv?=
 =?utf-8?B?Qk8vUk1DRUFkMW9xa3lScU5LSzM3RjVjT3BlV3F3RU5Ia2l4RjhrdVEzakpS?=
 =?utf-8?B?S0JzeU0vVTA1TFFzcCs5dWNkdjlJcXJtd1p0Z3dzaGRxU1UxVWhwdjdZbXhY?=
 =?utf-8?B?dnAwMG03SDFGeDJ5Q1dEYlV4UEhhS3JGclRJNUtxd1JzaDBsdXNwYzZEZ2Vr?=
 =?utf-8?B?V2pmZzJYUzg4NDlaTXREbjBGTll3UHJvMEIrMGtwV21uSTMzNEl2RERNb3ZY?=
 =?utf-8?B?VFY3TzA0aDdTc1djcnhyWmk3MVJBc0RvOEdodlVHY1NSdExaTkJzNlFlREUy?=
 =?utf-8?B?YUcrTFZmZjdoQ01MQk5SaHd6RXFQVVJuM2tUZnNiaVFsaG5vUnNWcUgycWx4?=
 =?utf-8?B?R1NiYkxZOFNDRjBUQ3lteWZyVHZvRlo2MWRQeS9sejFjS3J3STVUdTRLMlJw?=
 =?utf-8?B?MksrZTBkREpUT0R3L01QN0QxN094b2RRRjlHTFdtVHZCK0NBNmVVM2hoRUk1?=
 =?utf-8?B?cERyWXIwN0t1UTZDNDcxRW9ZMjEvaTUwWm5pMXdMbHg0Sm9CVEwyRFVBNGY0?=
 =?utf-8?B?T2E3b2VYUzhUS0Q5MExNVWtsdGNBK09Tems4d3JGcHA2YjArZno0dUdaN1JJ?=
 =?utf-8?B?NlpJSkpPZjM1S2lVaHEwNC8ycXJxcUZNVVVyMmxDSzEzQ2xCbnZxbnVhQWEz?=
 =?utf-8?B?U05vblBCajVSa01yYzZwaUdsOXMySjV2T2dJbVpscVRiODV1d1MrOFVDc1hy?=
 =?utf-8?B?Ty9RemE0Vy9USGp3Q0ZNQWZhT0JmOVJMQVFuQWZtM0U4c2pka1I1TFFXWVBy?=
 =?utf-8?B?NWZXYmR4d0xJYUdXd0YrVGtUWFRqZ21LaG8wN3J0U1FGVENSbFV2RE83SGFX?=
 =?utf-8?B?Q3U1bm4rUE0ySmE0UWg5S1AxSVdUUU9YdGV5NmdQVllCVjJjaUd1bUw4QWd1?=
 =?utf-8?B?R2xGejFhMXQvWWtQdVprVk5ZVWZQYTV2bURjaTBxam1RZmR4UXdnelc5SURm?=
 =?utf-8?B?V21ma2tUS21sUExaVDdObldWN3dQbjRBdWt2L2xuQzI3VFhTMWNFb3AxVVpZ?=
 =?utf-8?B?S0VZRHFReThvUlQvYmMybWVYR3BmSXA1cEcrcHhBeXplN3RRNnNxdlZoN2cw?=
 =?utf-8?B?ZDI0YWtUdktIcUhTYS9WWkZXNmRZRkZBWElrQi9yT1NUcEVrQ0lVVmFiMXA4?=
 =?utf-8?B?dE1oVlQ5VTFvcVRBcjVpYU9ZS1pTaGJlMElyVTllTDBCWWZCendFV25wdElB?=
 =?utf-8?Q?o18rcIqkjoI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB8527.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TFVXMnBVNkc4ZkFCa3I0M3FqYXZqYmd6MFl2Yjc5ZnlvYjF6K1ZLUjJLaDln?=
 =?utf-8?B?a0dpQlJRYzJjVVZwMm42UEZQRG05OVBkRk5PV1hEbFY4MmpYengzMnFySWJ5?=
 =?utf-8?B?aGQyRFZkMzF2TlM5VThubjJzZlRvS1dkeGR2aHFCZEdEUlpVZm5UWUw2QVZ6?=
 =?utf-8?B?cTJSMWsybWx1U2hzQmVyYUVYVFpkRkgyZXVLU2xDTmUyUElXeEw0SzFYaWw3?=
 =?utf-8?B?aGVraURMR01wNmFybHVkcWM5eTJCWEpFVHEwSkdRN2NPREdPeW41NDZRNzgz?=
 =?utf-8?B?UkZIejBtclRlRzVjOXBpSlRzSkNxLzF3Y0xML0xrWDdhTUorbyt1WXBLU2VF?=
 =?utf-8?B?cjlkNFpIc0ZucE05Rnova2tWMkJSNXJUWE9yRlpLVFBlNXlaSnUzSzIrRzlt?=
 =?utf-8?B?V0VwYkxOcGlHaWZxWmZOSk8yTGJqUzlET3VVUE1RMm9CSWxyenZKN3VEYVZn?=
 =?utf-8?B?TXVRamVWRVR5ZVdSc202czdlVGhTcjdtOVFkM1pjVTBFTm5pQlJHa0psM2pE?=
 =?utf-8?B?cEU5T21IWllDcER4SlFteXM1bUlQZjZtZGpsQXh5UGIwNHpUNStWNzMxY3p1?=
 =?utf-8?B?NFVlYzBtV3VWdE4xajJ0bUk0TGd6RWtpcVpFWlgrck1Ha3pHTmZOdVNydE4y?=
 =?utf-8?B?dloweXRpM3QvYjI2RGlRVnhFU1ZXejNFQmdzaXdwaFZQVUtYQk1kVThQU1hu?=
 =?utf-8?B?by9xT0F0SWVXZVlnelVIY2NOL1BVQkNRNmtvTzZWQ2YwRlJXTllVcUQyMzVF?=
 =?utf-8?B?eCt0d1NyWEk0UHJxcHNkYUxRRm82V0ZjQ2ZOYmxoS2dYWDN4eG1YbjRFVmJ3?=
 =?utf-8?B?WGs1cEpkUDJ1eFRzWDR1dEdPY1FVTjJJb2J6VHJ2WmluNUtuNGhjaC9jZ05i?=
 =?utf-8?B?bWZEN1g2S2c0cG5DcXVraUFzRW9KRCtTdEpkc2NpZjA3QmdrM2t6YkIwYldq?=
 =?utf-8?B?b1VpakkyMFc4NlYxYS9oaUpiODl3SDlVN291dEYyZ2tuQkpCUTVsVk9KOHdD?=
 =?utf-8?B?bDZTZkZqeTFuM21uSEE1TzA5T2hCeFBjL0w3U3N1WG5DdGtPT2E4MmNQOVRv?=
 =?utf-8?B?YVdEa01EYk9HNVRsbkhYZkxLcTJzL3lNZlR0S015NVc0SmtHZC9BV3NwbTdZ?=
 =?utf-8?B?ZGFaTU52VnM0QkE4UlNuQUh4c0lGdGxvR1FYSWxxSkVqK1FsRjFVdXcxdGN4?=
 =?utf-8?B?SFBmMWR5bnJ6S0RFUTV6NGdMc1lMYm5pd05xQ244OEszNmxheDhVa3JjNlI4?=
 =?utf-8?B?dlFpWU1tYmRsR0RYM2VDdXp2MldJanhUM3NrcUFKUEVSVGIvYnMzaExMVC84?=
 =?utf-8?B?UlB0Q1F0SGxDbjYrWXFqMDV1QnVPOXdMVFZabXViMjkranZ3YmE5Uk5LZ25F?=
 =?utf-8?B?YS91Q1FMU0JIcUF6QXA3OWYySk4wZUFOWWJGV0o2SU1qNjI1bnJIcmxCclU5?=
 =?utf-8?B?azMvbWVtL0tFRjY5aTk1akRQN3JLTHpqYkVKeEM5SW96VURVNm1Ocy92c3dG?=
 =?utf-8?B?Z3ZycXpVSjZFdzBOazcrMUx2cEdnSVg4TWZ3bEM0Qml1M2lOYTRhZmFJN0tr?=
 =?utf-8?B?ODdMWDJsM3k3Q0hlenFFcDFHTmR6OU9FMkpTdGdPSm4zNjNUeklZZmZpdWpp?=
 =?utf-8?B?ajZqUGRXSnZmcUtBTzhNckVieWlySjVKQnlFNk1tNkJyUklzbmN4N1F0ekt0?=
 =?utf-8?B?eENNN09HY1VvRE9oaVFTU0VBYWZzNDl1L3BkRHA0U1djVVRXNVRHbUtTVjFm?=
 =?utf-8?B?WWI2NDhvNXZ2U2poWGFpbGdsd3hJcEhjRkVYcWhSbEVQai8vRVM2aGVzMkNM?=
 =?utf-8?B?Z0JrdW5tZVE3RGt0dVVmc1QzR1ZMT1JkQmYza3gzRlMzWVN4TFVFMXlxVms5?=
 =?utf-8?B?Q3ptWmZOWXkvZ2llOXc4UU9nV0thdTFmZXRiS0REbXRIbUFwY25GRkJKVG1w?=
 =?utf-8?B?d1JILzgvMXBRNC9JeXhqZ2Fic0VwZzVYbXlNaHIyUmNmZTZsYitxR0ZGdllM?=
 =?utf-8?B?UjMvYUJxRUxpNWNycXA1NFV4ZnJ0QjNpYzhBVExCdmdueWw5ZmtHYXdWQmg1?=
 =?utf-8?B?akNHTnkyMW5yUk1ZUHA5c2JlTzI1c0dXZEFIOUoyNTE5dVRieTlFQ3BJMG4z?=
 =?utf-8?B?WTZ1Y200cE92Y21tZUxZd05NOTVMV1Q2eXdkSmk2S040UGZad0RqTWNXUVZH?=
 =?utf-8?B?T2c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ffab143-d2eb-4f48-ef01-08dda8127c19
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 11:32:34.4707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f71VIbuxEg6LhS2FioYQ1IgSjd4H0OfkNjx5PvO2lReTC4qRMZfL7kyDqgYc3w5qJjKpSKO5Zzw09JaKxsY0OpZ2BDqR6eUOoCWM9zLzTYo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF263E38237
X-Proofpoint-GUID: 498T8xNLgJvSIy1AGCHH5JV3DvbGTe7-
X-Authority-Analysis: v=2.4 cv=L74dQ/T8 c=1 sm=1 tr=0 ts=684817d6 cx=c_pps a=J1E+JpBSxTWGFwZU4p+gNg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=AJu5Q4vYAAAA:8 a=-OiRtrRQMuJXW43UiTIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=1OHxEZ4uPFp8rhvYjniX:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA4OSBTYWx0ZWRfX4Tg+dRqAA/j8 KeNvQ1JKxpXYWUGZHcrzr7Ow7DKPfeEPkkCu0+Bua8EeMEKUKpUHov696miR+U/sQAFWAvryvb1 oYmam3aWvDewbcYnoezr5wMtvPGIQ0kLPJMZ5qkJl2cYPWp6tLLn2FKPBHPBNA516n1E+t+WCJW
 tzAdlXHxEsu+FmLvfi3YI37o42jia/E3v6HWQs5D7uytOR9GLKjv4h+sI+fPTpH84Vg3hQRatWE n37wNdOCmb6xgiBP3LzlzvRxfIH3ZHbE9IN7x6TNaeePMEsMlmETunSnd2b+lxCW/C6CpY8JZN8 G1NWR+a0I3EuFPfLiWPZx3NgZ/vzyBcI6wxuWsgIm1NOg9Jzzw14Q4S8wZETdQSruCk0ShC24/n
 O/HqfjUpf/yJ6df+zokZ4RP0hjjuJjY4gTlQh0Hyue449quvYlTebHV0kFQ1S0lQQMKa/Mun
X-Proofpoint-ORIG-GUID: d9WZQOdYgxcrX5B0y66Q_r8ED7jWGiO8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxlogscore=653 adultscore=0 spamscore=0 suspectscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506100089
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 55A3J8PM000380
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 11:32:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218347

Hi Ross,

On 6/10/25 19:21, Ross Burton via lists.openembedded.org wrote:
> On 10 Jun 2025, at 12:17, liezhi.yang@windriver.com wrote:
>>
>> From: Robert Yang <liezhi.yang@windriver.com>
>>
>> * Drop 0001-configure-don-t-report-error-when-the-path-of-Perl-c.patch=
, it is a
>>   warning not an error any more, so just drop it.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>=20
> I still request holding off this until the rebuild problem that I=E2=80=
=99ve seen has been investigated properly.

I've replied in V1, did that address your problem? Or how can I reproduce=
 the=20
problem, please?

The automake before 1.17's mdate-sh couldn't update libcheck's
doc/version.texi, so the doc/check.info wasn't re-generated, then we coul=
dn't
see the build error before.

I think this can also address Ross' question about rebuild libcheck faile=
d
with automake 1.18, it is because doc/check.info wasn't re-generated
with automake 1.17, then we couldn't see the error.

And for other recipes' rebuild, I've done the testing with:
$ bitbake world
Edit autotools.bbclass to triger rebuild
$ bitbake world

All of them worked well.

// Robert


>=20
> Ross
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#218345): https://lists.openembedded.org/g/openembed=
ded-core/message/218345
> Mute This Topic: https://lists.openembedded.org/mt/113567518/7304958
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
liezhi.yang@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

