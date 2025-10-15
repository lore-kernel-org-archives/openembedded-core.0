Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CC7FCCD196
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 08:51:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.11136.1760518267165516646
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 01:51:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=q9ECejqI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2383de7e2d=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59F4Kg1X1035161
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 08:51:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=/rsz6bORudMzvw8T3CNLCIx0uP3LzxnJKS4j64V2D0w=; b=q9ECejqIE3Aq
	5HHCY+esKlUXiJLbPnbLcAMXOCYjrvyGuWl/daYDl4gneJlizLkGdT38Gfk7/lfe
	jfn+M5J0FRRnK+AoHtyqK3lpuR7OrT8dAOkUTZhtI7+UeuyK/GLASfKeEmM794gY
	3smRJCcECLaQK9uy77uIPoMItfN6l7Yl0LZG39Brz/cLQ8koFy+g9p82ne6woO/G
	G/EUBaCOgObVDcZ0tlqnIdByVwK5NrMBsEB7L39D76wKJT9gJ5bd5bnxZdGUnEOd
	Vkz7YkXlfZ6ZWU4Y6mOf+b/fONxN1Pq348WN9XbwpobeMWhBmkv3GQoBYtZGywRp
	KYX2M9GSgg==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013020.outbound.protection.outlook.com [40.107.201.20])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49sthh93up-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 15 Oct 2025 08:51:05 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wGxHOfNpvGX9V9O7WZ4H2s2c+etYSObIdUXb7wuct3Ne8ZjiEo6bQ03i9Ye9Vo1Eaac6/CuY0VH41UY7tHTN3aoRsUrFcTTPTDdl5TLEyR+iZ8aMLGGKJ16cQM1579lLJap/MCZDrJFErb8gdduW99OKz6LpNqmNGYTR72VOIrwmMHW1romaYZRyafgtHqxgiociQpnmzgOyiLMyT5znSCa4DDwwZqfV859fBLxhoThqo+/mh/3b26I/bQSoF8Dx1K4vvSWsNLBRPFLHbMi7a7KhS22vv5t68o27HqDo7V22PAtB0wXkKu2tAXC/ozT8wSkkUE/h23gk+sYFMzlaxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/rsz6bORudMzvw8T3CNLCIx0uP3LzxnJKS4j64V2D0w=;
 b=MuvaH7aRPDAvVhzYS6vWYSc/I0DN2Cjlrx959U3HdQQ3Oy53Veqdk3UaAel+ielaGWDpndnaCbeSVa+9evPd3bc1q1lONfVqo9q+Cy5gUJkJYUfaZLhBCvPKlmlU/GgVVBtWYQm5BQ9xlybSuGnO3CiqAhjVJ7gcCQpKt3KpHHGvBC+5AfbU6j69LsK2U5nIbQCDUbsNWzb53c7zl8dITi3DPEGa8Q+cTxQE/KKbrYKO0C0XCn1AABd4oD1C1sz7YnGWxMPF7PpEPzWRm8RR9MN3w0Jm0RrdOt1PPg5NLtWUarVIttnU2bcmHEVdykfrcFSWj5LFOpEg4m7Jf5+FGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH0PR11MB5904.namprd11.prod.outlook.com (2603:10b6:510:14e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Wed, 15 Oct
 2025 08:51:02 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9203.009; Wed, 15 Oct 2025
 08:51:02 +0000
Message-ID: <566874ad-5230-4a15-9e41-6f1c86be9a23@windriver.com>
Date: Wed, 15 Oct 2025 16:50:56 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH 2/2] systemd: upgrade from 257.8 to 258
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
References: <20251014121513.2606389-1-Qi.Chen@windriver.com>
 <20251014121513.2606389-2-Qi.Chen@windriver.com>
 <DDIRI660AS9R.2FK1M3YUMCMTD@bootlin.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <DDIRI660AS9R.2FK1M3YUMCMTD@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0002.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::21) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH0PR11MB5904:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ad810f4-821e-43bb-cc5b-08de0bc7f7f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VXBNcHl3d1k5V0lYcTBjeXVSbC9XcWRnRXNwOHorR1EwVEFucVBYUXdOaU9s?=
 =?utf-8?B?UGRrR01peGlzdWZqNU5ZVlFvSlcvTDdZcEdNODZuWWxtNm5QbFNtMjQ0alBH?=
 =?utf-8?B?TGFnSHlkOGdHamxPTjZvdThvUGMwQlBhZDVXSkt1QTUxNW0zYXgxdFBleWg0?=
 =?utf-8?B?bmFraW5wZUdUajlBNGhibFRvN2ZPQS9YVUNsOWk5UGFMc3hid0l0Z2xubnRt?=
 =?utf-8?B?ZGZFZU5FdnhIRFFPMzRXL2I2cCtBM1Q5VmtvaGg0ME1reUlNdEJJQVJFQi9j?=
 =?utf-8?B?S1oyWkJDMzJZZUxrbjVGZGhXajZpNEtsZkxrVGxLNGxVcEJyVmZlTGNGS25m?=
 =?utf-8?B?bzlJUG1icy9rUGJua1R4WkZZOU4vUW4yTHJqejFRdUc1NzZqaEpNNHhLQkNs?=
 =?utf-8?B?WWFpbWw5aVpDRDJYYWVZd0VIdG9iZXpiQWlWNGZKTHgrTUhDbmEzRFA2eDVt?=
 =?utf-8?B?eHdoWDJxdUtiNE9YdlBPSi9JYWRORHdKVDhHak1rZS9qWXRRcmtWMitHeGth?=
 =?utf-8?B?OFVEMmdBbUZDcHZaNDdzWjJBdVZuUDNJOVRmNEtjR0V1by9FUFpESDVqWllN?=
 =?utf-8?B?SndPL3M5MEhMY0xpL1d0d1lNVHV0SmhRUjVudDloSGl1RGRLNjV6QVFUZmtL?=
 =?utf-8?B?UjdvRm5XZXB2VEVXWmp0N1VkMUh6L2s4ZGdjVk1QdVA1MXF2c3hIQTQxK3Bz?=
 =?utf-8?B?RjNoSXFDVjdKUkpiY2VWUkVMU0kxWS9TODFlWFJ2bEJZVm5yOEg0L080Sm5J?=
 =?utf-8?B?dWlVOXZOV0YrU3NXUkkySk5YK284clhuenY0NmJ2bXEyZkg2SHduRk9CeVJT?=
 =?utf-8?B?MDVtd01lV3VGZE1TdmU4cFVqUncrZ2hMZW03bzVJYVFpZEVpamZNQ3RMckRw?=
 =?utf-8?B?SmljZGhpR3M2WmlTZ1NSREdxNjYzYnFGL2VMeHBraFllem9OTVdPck1OTlll?=
 =?utf-8?B?bUhrMUdwKzlqKzFjdVd5ZWVQd1I5dHpJa0EzQlEydEpRd21HMXl1dXphaWpt?=
 =?utf-8?B?emxMTVVnUGMrVjUyREVBU2ZLQWZmRHNvU3I2ZStNTERsbXIvbDNEaDhnUS91?=
 =?utf-8?B?V3o0ZnBGTUpHRFRrSGpsSkF3NUpLQ1Q3UFlER01qaHlzZDU1azZjWDcxUnZt?=
 =?utf-8?B?aTI4NGg1TFdyWjBtc0I0MmNHN2VBU256ek9qZVVTcVFPVzUwUmF2ckJRYWtn?=
 =?utf-8?B?bG5nRUI0cGxYVDhBT1RPQjdKWXZUWGxka1lMOVVZT0FybFlGYVZEQ04yTy9F?=
 =?utf-8?B?SSsyc3FrMVJFT2pvUzM5WHBCandJOFpzOCtoRnZxTmVBd3d1d05mb1lpQXIx?=
 =?utf-8?B?VXJ0Z3pWUllsSTdza0xwUW02TVpUWVpRMHBXcy9GRmlhMzlnczNydUpZV1pv?=
 =?utf-8?B?cjNzWDRZdnI1NnFhQlY5cE9wWGlPNkhMak5IZlVwUWJKUVUvN1BxWEljVG5N?=
 =?utf-8?B?WThaekpsQWpUOGx0aUc3RWh4S3FMOWw3Mzh4bC9wa20yYlZ1bWkzMXBqMnJU?=
 =?utf-8?B?S2lHUi8vTzFFMXdNZExwbGxiMFl0NVNSZFZoTndMd2xweFFiUkM4dlF4SVo4?=
 =?utf-8?B?amtHNVBEL1l2cjVhVWxuT2wwR2M1OERpd29aMHU0N2dDTW9BK1B3TnBTem1K?=
 =?utf-8?B?djdPYlN0bVkxUDRoSFhzS3BBSC8wUkljeHRlZ1llMEU2bGpqT0J5TkEra3pJ?=
 =?utf-8?B?RnhqZEVPZmlOWTRFcFNJcnlpanRGTkQ2OW83WWoyWTNpK0gxbW5UNzFpMm9u?=
 =?utf-8?B?czdrbXE1WmZHRGJQdWMyVDcvK1M2OXEwMXh3MkcyTS9IMFB1Q2h4aUxoME5m?=
 =?utf-8?B?Vlk5by91UDY5ZDhFZVJQU2RGVTJHU3k0a2NSZXZ0Q2JZN2xXY0VRR1RIL3Jo?=
 =?utf-8?B?TkhJM0F6SW5icUd3WDdoYjBKQUFlaXZ2aUlTZ2FabllSQXc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aGtubHJ5bU1pV3dzalpHMGlENzY1dnhpNGVYWlpROG5sV1lCUHpjK0xuYklL?=
 =?utf-8?B?SHlTOGpCeWxCbVdoSTlrSWhRQVN3dEIyRnZIUWlXUXBtZWtWQTF0NXBuMEl4?=
 =?utf-8?B?WWZkVEVBVWxwQ1l0Z1l1MytPQTM2dG5iMk45LytTMHRQVG8yT0h3QUMvam9v?=
 =?utf-8?B?elV2WjRKdzE4eVVNU05vV1NBZG04L2NCeU1oWHBBNG5uR2VjUUU5K2k1MzYv?=
 =?utf-8?B?SkZ3VWIxZ2RSSjc5Y21KVXM4NndCcFQwNHhjT1FyblBXbHlzdk1EWmEyTjRk?=
 =?utf-8?B?a0Q1a2FRSVE3SFk4UVZLZXV3YXVFYXMvV05QRmtpaGNNNUxyVXV3SnJoei8r?=
 =?utf-8?B?N2R3SXMyM2VmRmkrRDNwSGNPdS9HRDNLOGlseXNCTC9pUWxMYStGTEFVcVM1?=
 =?utf-8?B?aU9kZDdCSVk3bksrZzE1VktwVTVGOVV6SnZjYUJRM2pFY0t6MFlqVXowRi8r?=
 =?utf-8?B?VTdVc1loTHVBUlJ6V0NmWUFyTTZDS1h6eTlwK0FaMXZDYkVjU1YxQnh5akRx?=
 =?utf-8?B?VlFNTFhibXFndlBub2sxUElCdFh6T0hhQURhcWx3UGEySnFMckZVQ2U2eWp0?=
 =?utf-8?B?aTQ5ZVBxYXNUMHhhTk95QmJpK2VqbmNtc2FTSjl4dkJJd1l5WlJpUjZtYWxr?=
 =?utf-8?B?YjgxZG9Rd3ZjOVpZQTVFQ2NtYVVXTThXZW5kYWplVXU1emF4Vy9tL0dDSDc0?=
 =?utf-8?B?ZzdLckhTOFI5b2dLbllmVU52WER3SGRwTTlBMkdpcFMxcFZ3WExVMjZBYUxr?=
 =?utf-8?B?WmFId0FCWG1lMkltTWNDS2Y3OXlrbEtZbC80eFMxN2k3a1d3TngvLzBwVzJv?=
 =?utf-8?B?cU1xTUZvU3Z2Y3BrV2VEWFpVWUQ4ckg2aHJkbnkwQ3pqVDN0T1dqaHlydWZT?=
 =?utf-8?B?SmJBZ2FuTWRBVG5RbysyNUhFZUVKVGxYNm1SZUZIN1dJcVFNRExZbGs2TGN1?=
 =?utf-8?B?RmZGcnhLOVhTcTdMM0Z5S2NpRTFVdHpPVE5kNVdzcTQ2Vy90TW1ueW1HT2NN?=
 =?utf-8?B?WUh0Y2lRYUpwc1dHRGRKSXUxWWJuWTRVbVduSlpmMGJ0Uy9rZ1oyc2owTGRy?=
 =?utf-8?B?d2V3OGhJdDdZWEE1c2RldHNVR3lLYkJ3ekpDb0tFN0lGOGtCSk1LeHR1b0ZT?=
 =?utf-8?B?TjlXaXNtWmNET2pQdFpMWWZmVW8wVGtXclQrZWR2cWdTUkw1a2JJdUdDTmZG?=
 =?utf-8?B?YXFOWUI3R1hqM2F6ZUd5VzJxZHFvUFlnc2RqMmZ3YVdjYTlEQWgzWFJ2Nk91?=
 =?utf-8?B?dTJJWTJPY3F2ZXBIRWVub3FrK3BpanYyWi9zZVptSjZuUmFCRFRqL3BaTEta?=
 =?utf-8?B?UmcvdDBqMllDbVpIWHQxckJ4Y0xWL3NTaW13Yzg3TGNQVTA3aTlYMmE0Y3lM?=
 =?utf-8?B?Y1R4WFJvMDFQSHhFNHJHR3JjN2RPTmVtWWU2UU1VTmcwMWdNWnlhdVhWL0RZ?=
 =?utf-8?B?U2I4RXpoT3JYSkFiQmEzUiszYU1sRVdleXhNV0VtdFY1ZmwycFBXYldLTlRD?=
 =?utf-8?B?dWhQZjdZTkpML0g3UDIvTmNXWlRyaTBadU5LN0RFMlRHdGVSN2ZONU9UUUJI?=
 =?utf-8?B?M1RjQmRZeGZvaXhFYXc3UkJDVGNQenI5R05IdHJiZGlCR29BcU1NZUEvT2dG?=
 =?utf-8?B?V054cEh0ME15bkxiNnluRXoxQjV6OGF2Y09mTEl0NTJpSmZjREFib1dyeFpO?=
 =?utf-8?B?RThBcjFUUTV3VG4vMEY3ZCtrL3Y4OEFia1o4OUoxMm9LenNDRlZGZW1xeFow?=
 =?utf-8?B?QXpiWVRIOWZWSnRSZUVlUmpNdkdxVFZoeHFmUVVOUjBWdnN1KzNwbnJKR2JH?=
 =?utf-8?B?djJ0dzBuTXhjYzVGMUtHMjdmaSt0ejhlbkVNc0xvci9pQ1JhVnpyZkpQTzNL?=
 =?utf-8?B?YWlZZDZmenZXZlh3YllIUWpmZVF1VkxEakpSZm05MGVpQ0Z6ZnlTUEYva2V5?=
 =?utf-8?B?eUdNTXRuRWtLRElhaHphOXNaUzdSazhMd25vZm95b2xxOUVvZUR0ZXFYbnJU?=
 =?utf-8?B?c2lJQTJkYmRIYS9FUXlQYUxhUGFNSDIzYnd0Z1h3U3E1SThiOUJ1emZnckpt?=
 =?utf-8?B?QU1kazJtcUZ2SVYvemNQaDJjMzg2dlVUMElSdk42QkZQZTRvUnA3clpGd3ZM?=
 =?utf-8?Q?4g/sPp7eWo1CFADUeBfONEe4f?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ad810f4-821e-43bb-cc5b-08de0bc7f7f8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 08:51:02.1024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jegwZ/R891X4cECCNGfQueqNAjQHormVBd7lHkWdmIvrkLh8DPs+22sa+lhLFrZN8iFb9KXinvn789hQf1rSWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5904
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 2nmO98AHr-DPSv96AAjM1a1lyFTRFxkw
X-Proofpoint-ORIG-GUID: -x7zltWrv4QbsVYRcgGPIW_NcLuADVZ4
X-Authority-Analysis: v=2.4 cv=QLBlhwLL c=1 sm=1 tr=0 ts=68ef6079 cx=c_pps
 a=YVy+1Oos88+FgPqksjWX8g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=XkRKQH6RAAAA:8 a=iGHA9ds3AAAA:8
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=GoUJzEW4f13950PHXPMA:9 a=QEXdDO2ut3YA:10
 a=1gUyE30hU_ULiMxJiLUW:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE1MDA2NyBTYWx0ZWRfXxc36QRRc0BSb
 JXmCMlPzw2W3rtq8ea7Hiqpb2w7pIGXURTIG8ZcypHFJol2QLWz07ajmkUNzCydRUcqhmvsLKEF
 ImvTXgO2H9MVPrMfNp37ricvUffThKPwaOlD75m9458+jOZ0ZVHDgxqqw0UhPCXvcXuBE2BXTsH
 rYyNyXH9+Yiwbb9UZzWfdHK+a5Hw4Yc+q3LhpoJT8KLDTqCKbVFJJjMS2vJPF34pLjqooD9twDv
 IXA9RP/rCua3vJuQmpyb1WVxfLEk286vEd8DKGWkX6lDNZySnNyNNwQlfbfCAHbFvsjpcoUi1do
 rctTfDzgJgb7NpqvKE4+FlZx/FcGL73fBCTv0rmNShCbmdZxY8tIef76eSBkY0yVVbbaCCJRZjl
 VVBnI97IWpS7rNM2LTpzbPOSBHAS1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510150067
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 08:51:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224885

On 10/15/25 16:44, Mathieu Dubois-Briand wrote:
> On Tue Oct 14, 2025 at 2:15 PM CEST, Chen Qi via lists.openembedded.org wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> 258 Release Changes:
>> https://github.com/systemd/systemd/releases/tag/v258
>>
>> The 'runlevel', 'initctl', 'telinit' related contents are removed
>> because they are offically removed in v258.
>>
>> Disable tests explicitly. This is because we're not installing any
>> tests. There's no point building them out. And this puts extra burden
>> on making things compile for musl.
>>
>> musl changes:
>> 1. The -D__UAPI_DEF_ETHHDR=0 is removed from TARGET_CC_ARCH.
>>     The __UAIP_DEF_ETHHDR is defined as 0 in netinet/if_ether.h in
>>     musl. There's no need to explicitly define it in compiler
>>     commandline. And such explicit definition will break the logic
>>     of the header files in systemd, resulting in extra patches.
>> 2. All patches are re-evaluated.
>>     This version of systemd introduces big changes in header
>>     files and other places. So the previous musl patches are
>>     re-evaluated one by one. Those that are dropped are considered not
>>     needed. A few new ones are added. There are some notable ones.
>>     0012-do-not-disable-buffer-in-writing-files.patch is dropped because
>>     there is not runtime error.
>>     0016-Fix-the-segfault-for-glob-related-codes-and-define-d.patch is
>>     added because this version of systemd uses strv_free to free gl_pathv
>>     instead of relying on globfree provided by libc.
>> 3. The 'struct ethhdr' re-definition error is solved in musl recipe.
>>     If musl upstream does not accept the patches, we'll need to use
>>     previous method and change quite a few files.
>>     https://www.openwall.com/lists/musl/2025/09/30/1
>>     https://www.openwall.com/lists/musl/2025/09/30/2
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
> Hi Chen,
>
> I saw your message saying this is not ready to merge, but I already had
> this in testing and got some warnings:
>
> WARNING: core-image-full-cmdline-1.0-r0 do_rootfs: Group clock has never been defined
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/2560
>
> They do appear while building with poky-altcfg distro, for all machines
> and probably all images. It was confirmed here with core-image-minimal.
>
> Can you investigate this before your next iteration?

Yes, I will. Thanks for telling me this.

Regards,
Qi

>
> Thanks,
> Mathieu
>


