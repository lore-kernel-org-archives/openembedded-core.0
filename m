Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67ADEC83F1B
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 06:11:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.72343.1752473476285585607
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Jul 2025 23:11:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9290ac3eb4=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56E4UTcj716123
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 06:11:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47uf2v9pqw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 06:11:14 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 56E6BESt881144;
	Mon, 14 Jul 2025 06:11:14 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2043.outbound.protection.outlook.com [40.107.94.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47uf2v9pqv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 14 Jul 2025 06:11:14 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wG4t8WbpVcfk5U2OGHblYq93AJGLSpSRecqVPeA9+r4Cu6dcWaAgdzpUlkGx7gnLlJBhG/TxAd4Az1+yAMTB6swW8enciXNOjpfcyBBPMVCgfOo9IouwKgrxLvrrWxqlGiGNoscv2jYFcijrNRdGCb235lclGE8dK02AfZq3rJlmC3yW0MLJZcUsuXS6lW+HihL7tW7YvDhQKa9b9k1of0uxwAkxw/EfIl0xH3Y2lULBYTpyH5OV3HQI7XEeSDtzY+3sEhu8N87eefGw0eqxa9QwzXTVlgvTMVxb4Toh/ijPaF8TwRwtERfpJkDA/kNtsab/L0eMCu071VF8bXY8MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n/Qn261enWzGLKkTuecrv6mRO+OI0N03KXW2bY4ajZY=;
 b=GMk6fX2Ap4/8crogHJstZ1nftgVgDDaql65Di4HJMBa07wxJORKpYD9VsHMFIwO/MBIsLUVZ9R9y6BvXZ/rLOV3WSD79aehjsg9TKGwpo3D47Z9ImoltjaMKuvOL7+YMbsvutinnC3N9Znhfm3OixyvfowzoJuXYVxEgZVwceOYvl4OPBk52QZLEFtLQMVg9qBx4tAOKre1oyo62AZCwFsUxIhx9dKCIFLuwHNxjomUVTcjX5q4917NQLcIfvUMW7VJ5UZhIol3hJupK9awocFO/SezVIvavrOF8mEFYZAwS/ksV9Kqy84ERRrXVtQ+GEUqGIpggaS8W38LI2HDmUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MW4PR11MB5933.namprd11.prod.outlook.com (2603:10b6:303:16a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Mon, 14 Jul
 2025 06:11:12 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%6]) with mapi id 15.20.8922.028; Mon, 14 Jul 2025
 06:11:11 +0000
Message-ID: <e21296b7-89fc-425a-b7cf-3d0334bc0f75@windriver.com>
Date: Mon, 14 Jul 2025 14:11:06 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: Circular dependency error on util-linux fstrim service
To: Hiago De Franco <hiagofranco@gmail.com>,
        openembedded-core@lists.openembedded.org
References: <20250711180958.tbmriqtce25kxd2q@hiagonb>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <20250711180958.tbmriqtce25kxd2q@hiagonb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SEWP216CA0022.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b6::19) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|MW4PR11MB5933:EE_
X-MS-Office365-Filtering-Correlation-Id: 357ecf50-2567-48ba-f963-08ddc29d3b40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TmJhMUZmOVVnZXZXR2dFZ2JNQVB3Q3oxZXYvWnZneE1OTDZLOVZ6VEUva0M3?=
 =?utf-8?B?NHB4UDJCNWVQL0tOOG9KZFoydFk5L1hCQUYva25LcnJ0V1g3MkNHOTh1VVdD?=
 =?utf-8?B?OElRY0E1ajR6VUUxNEdLcTF3UHlDVHpXbWVWdHQ2SG8zb3Z3R0hvblN6RE1T?=
 =?utf-8?B?MXJoZXZvREdBL29yUkF2ZEMvVnRGYXlPY0VqN1J1QzFvOWJQNGtGU2ptWUF0?=
 =?utf-8?B?clQ0NjFiOXV0eTh3VkdPVkF2eUhSMi9jbEE4Zm84blBCNUV0di9jZjJSODlW?=
 =?utf-8?B?L3daRXFCcTlWYmoyRTBPTGlmbnMwWXNEaFNZb0N2aEIrRkV6NG5vcDVSWjZO?=
 =?utf-8?B?MjdQeGtVTXpzUGhEeWFGdGJmL3RaM2JaL1EyWTh3N01qZzdJaWw5bG0wTFhm?=
 =?utf-8?B?U2JyMzlxYm5UYzdZSXFqZHJDUzFGZHhFRm4wREx6eWc5SXJlUXlmaG5mejA2?=
 =?utf-8?B?VTVlOXZENzBOcVpUNlhOemZ2NjBaWTBSTGMwKzhNSWZPWms3SUhJZjlzbFBJ?=
 =?utf-8?B?Y1FPWk5rcmdzZjVDdjRsWnVLNnhXSFRtNUlVQ0gyd003TzFVOXAyTzFvZjIx?=
 =?utf-8?B?UkdZR29JUkhSSkZESG4wc1VVakZJSTJQWjFDUzA3RStvWGc3RjhGcFJtY0Jp?=
 =?utf-8?B?TGpCQ1pVVW9KTU9YTTN2Z3RFaFl5TTVFNi9ycUpWWGFFODVQL2s5RTVIQnFD?=
 =?utf-8?B?MWJLQWNvNzJmMEgxNTBZTitiWFlLMmlhcDZLMm1EWGNuUDJCdEdaNHVUczdV?=
 =?utf-8?B?dVVFa0RBeUJVR2hnNXNZc09GdGVKa3hiSTJBNUpBeGpNZ1YrMGQ3UWpmdnRy?=
 =?utf-8?B?SWp4WUgxVGgyVmdjS0ppeDZrWVBuZHNDQmc3emtjRytpbnk1dHBZK0ovWjZ4?=
 =?utf-8?B?OU95bEkvaUVWaXZSZDVqVzJiY3Rsenp3cmlFK3N4SDhRTjhJYjNUc2N4WVZl?=
 =?utf-8?B?S3dFTUt6ajJCbGZTRituNnlrRS9mSUFWdVFQbXNodVJwMi9TV0dDMGlZMDJ0?=
 =?utf-8?B?NFRCZFh0aGxHL3JHb2lVSFpWajBHN3dXMFFXYXN5bGJJV09lM1JKWEtDOWVm?=
 =?utf-8?B?dFBZV1lqOENuNTU4RGdGbVExT05aWldwdmhiOEFidmRKbUZjcFMvek1IRlhn?=
 =?utf-8?B?SUZXWVROQUtkc0JxSjRaKzA2WldYTUJSTzJlVnUrRG1hOVVqNUZMbytSM2pW?=
 =?utf-8?B?M2ZSNEp6VUtkbGozTFFwc0RMczMxOFprSDJNaDJiTW5SWWhHWS9KUUVZMmR6?=
 =?utf-8?B?WTdsblFlZ0FNZjlnbWlRUk9HNEVwb0lhZi80aGJkLzlSQ3JuK2xrWkdFUGRS?=
 =?utf-8?B?RHk2dkRGVXVhQ2VBa3M4cG9WWWwySThPZjhrQVQwMG5aOWF5bVdLdWticUly?=
 =?utf-8?B?MDBmWjNIVEVlVlFaN3VRR0tCelVGZWRoZGVTRGd5ZjNsM3UvNnBBeWx0UnJk?=
 =?utf-8?B?ZG50UVU2UGsyODV1emJRdWtVeVBLS0NJaWprYjN4QlJCRGJINlJ5NzR5bm1y?=
 =?utf-8?B?N3E0RCtKMGVsNStKaWtGQ0JEcGRqeVJTb3VUNVdMVUVMSTVsYzFCOW1HMzhs?=
 =?utf-8?B?aDhVWGFYUkwyeFhkbUhnb29VSjNTa0hjbFBTci8rdGlxTW5jdE9QOTBlNVFk?=
 =?utf-8?B?NklvYTNHZFhKM3AyR1JQVzdTSEszTytNMkxRNU1LRlE4ZlpuS0FuWkpWNzBI?=
 =?utf-8?B?bkRVYnQ5eWxCRmw0MlFkK3hMcmQ0eFIrcTBwU1pTTTNEanFwRWRrZk9DS2JG?=
 =?utf-8?B?ZkdCOCtIVEpPSExRVGlQaHVwM3o5aldVODZOWnFnbHl4SkRyS1JaU1pLZUQv?=
 =?utf-8?B?QTBxUVcyMWZZdjVWaDJscDFOZUlyZm5XMUpBRWV2YjhqdDBYVXJvOFhMYWww?=
 =?utf-8?B?dlk2S2JaeHdiaG1ZZGdtUTdNa0x4Z2xvY01mOUtkVEljS0w1aTI4ZVBiOEV1?=
 =?utf-8?Q?Hi+xwThVs70=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?N2U2SGFyekg5K04yeHdZaFhxY2lZWUZyRDBpZ0tuN08yY1E3VElCbjY3MmVp?=
 =?utf-8?B?dmhEN3d3Mm1kVTdCUVptY21ZSWxuU0ZFUXlPY0NtQ1k5aE5XajJpS0dNTWkz?=
 =?utf-8?B?YWRtT2xFQ3NVNG5VamNscllxcmd4Wm9KT3ZQNUpmS2lkS1QyUTc4ejRDYm5Z?=
 =?utf-8?B?eEV3aVRJU3BuNWhta2g0MHRHazZWeE5IUDQrc0lGVkVTTHZuenZhNGpFOWdX?=
 =?utf-8?B?S24wK1JJSm5OeFJaUXR2TjdGVjZKdUVEWjZXM2ZTQ0xCbE83Q0VTZnNaOXBG?=
 =?utf-8?B?c1VCOXdhRFNyN0VCL2ZnaWU3OWZhbHY4RmhydE42RXVoOTdjSEJIblRFMUhR?=
 =?utf-8?B?OGM1L2IvY1U3a0kyVUhQN2RrRDhmdE93eWI1TllmMjh1RUZQYVg5UklSQVlt?=
 =?utf-8?B?MXAyMHVXT2JrUnBYbEdIK0EwUzlVTWREUGpkdWdubnZhNGp0SkJIaEhUY1NR?=
 =?utf-8?B?VDRnRzBuWlRtWTFzWHRmRXkzcEVWajhBQW1WV29DV3Q4Y204bGp4TDRZZ29u?=
 =?utf-8?B?NThWdUY1N1V6UEdKLzE5MVFKMzVxQUNNV2l2Zm8rdEVYb1o1eHNZeVl3UitU?=
 =?utf-8?B?WitLVUhWZnV5Qnh3QkxwWG1QbWdQWFg4Y2tGeHZXWUdsMi91SXBXZXJoMkNn?=
 =?utf-8?B?cU5nbHRaSGpJUXhpejBOL1IrVXNERVdHMWg4RGd2UzRsRWppemQ3alBzNW9F?=
 =?utf-8?B?R0dkOThRdkszN3BndXRrYTJMRzBJTjRpYlp5MzdnK0NwcEF6MnlsdjZScVVx?=
 =?utf-8?B?Vksyd05zcGNTZWhEV1dsb21Hd0pNenhYNncwMVpuN0o0RmV2UjQ0UDRUYW1J?=
 =?utf-8?B?bkNobFFQNWFLYTl2eGc0WDBZMG4xUS9aaGdBdXY0TmpSYlc2ZVhvRlZRZUU5?=
 =?utf-8?B?STJ3TUEwelVJdGo2RVhtN1VhTXlKRUtsaHpOdWUybXRkTTgwYWhSR0tRR0sv?=
 =?utf-8?B?NXV3RFp2R3JJb3ZVYVY0M0NTdjlrVmZhNjc4bkVhYUxOOXVxeEdFZjd3Tzdv?=
 =?utf-8?B?V2YwMFZRallPL1IyVHpEejkvTzNOUTBhWHNYMUtQVExWNE9QQXVERFF2Ui9Y?=
 =?utf-8?B?d0lDNGg1eTB6TUk4V2lnM0MwcHJmWUtNUFIwMWpBTDNZdWtaQkN6SVN2OTVL?=
 =?utf-8?B?WUxpK1JGb1RBWkVoeTNzYmRMTU1RSTlROXBqcTVRei92V0g5RzFSc1lKamY0?=
 =?utf-8?B?REJ6V3ZKcWpKMVh2TldqQ1MzQTZaN21sTG45NVpERTdSQ21vc0kxQjlZRzBU?=
 =?utf-8?B?Ynpka1ZwZlgxa3F0QldYYXNiNi91YnNGUEVWR1ZZU3Q1dWNsRHBJVXJUdzJw?=
 =?utf-8?B?dzJxYUFWSjN0bThFSDY2RkZaZlE1S0QraHBrYlJkdXFxZ29vMTBla3VJcTVE?=
 =?utf-8?B?Nmp1RUJJWWRsYklTLzNObXBaZnI2ckJESUE5WFcvUkVXbm9qWEtTL1lVU3V5?=
 =?utf-8?B?U3h5S0lpczNVa0NhSmx4SzArK0Y4SHgxQjhSUEo5U09LYlEzTTBnbTlCTlFj?=
 =?utf-8?B?bUZ2UCtucllqQ2NwVzFBazREaGNvSlZ4ZlJDZzl3MCtqc0JUUU1tMGdyelVN?=
 =?utf-8?B?dmduSXpsZ0k2OU9UbWlMUW9FN2NvblBQcE42TE1NRHp5cWE1OHJmaGhYNld3?=
 =?utf-8?B?aFZmVHhycllybUhwaVFCc2FIQ0wwamR2MUlaQkNYK2lFMXF6bnVhandrSXls?=
 =?utf-8?B?TnFUK2ZEUVd6dFc1QlhWR1k0RUhKVktFZkNVeVpMbHNpUnBrTUh6dmhZd1lS?=
 =?utf-8?B?UTgwL285aGlEbENHRTd6TlM4Ynh6blphbTlzdmpFemF0dEhBQmZwaUlDQnM0?=
 =?utf-8?B?MHMxMWlkTjNGbkY4U3o0UVY4WDdyQTlpRkFPQWFzUXlDUTh5dElIRkZqeEho?=
 =?utf-8?B?RW44Rkw5QWNKM20wbUhSM1Zmdndsdjcwd0Z1K05vNFhLODhOQUNwSUNNZzZD?=
 =?utf-8?B?enRJOThxMko1eTVoRDIzVGFidVRYY05sU0xDajg3NHpNM2FOQ0pWeW90YWpH?=
 =?utf-8?B?WnJ0NjczWDM4OFd6R3o1c3BJVzBhY1Y1VTZOenVMNElaU0JYNXJQK1VyVHZa?=
 =?utf-8?B?YlBHS0RNa21FSkxFVU9DRGlOTjlmMk1US1Yrd0g4eThnL012MmR4RTY3N2Rt?=
 =?utf-8?Q?UxRTO4KHedE7pfW9sxz86ckD4?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 357ecf50-2567-48ba-f963-08ddc29d3b40
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 06:11:11.9358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vyVWc9w4iVwDMUMiKHSbtVn0tsb9U6+mNGC+kbeKsxXT9kEFQxWnjEXkk80KRHdqG7rnJv34qdxCjJFV7TqXyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5933
X-Proofpoint-GUID: BWX2mQGGqlxEAXtdMiktsx3YXlzmxsRK
X-Authority-Analysis: v=2.4 cv=TYqWtQQh c=1 sm=1 tr=0 ts=68749f83 cx=c_pps
 a=y/K43w2UyI1TRv0bXhuaRQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=5x7Ht-j6By-HazqEnN0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: YLotX2fAnxSpLAFPhKloEkXVVVTBi7X4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAxOSBTYWx0ZWRfXwPmmcQplujta
 Iv/DpLNrEq/+tCwhXV0cnh6Vcn3DTDdpAtivVbk/iyDW4RhAaFOx7p9qvjRQ3RdGlJ7PAQ0pHWI
 kqFXED/mBg27J/Xxyumi0gLN4Dh5LYJUAWamj5Q2FG0T0ys6fS8qcbEAUbQvngZaa/c4a4Zfv1q
 IHikxtsIn6VGEIl8i0EdGEM/BV/3UaaaYuYpbZu2m90ftp8/PDu1ORFbn1WRKgPGpNod5O62o1F
 VxH1pS1vjO8NjZ8hOyN2FtuEdyb++i3kwaJZgZopW0dNEDl4mF9H6KJD8TZAr22nJUzHRCCJX9T
 pdJW0Mky8fFbdcxr7+pjF2ccu+Eyk8sNvsC9PJ9KRx6z4yY6uaOwTHDm8xtt+7ai6hPjFKK6ZqQ
 WFMYhJga
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 adultscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2506270000 definitions=main-2507120019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 06:11:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220214

On 7/12/25 02:09, Hiago De Franco wrote:
> Hello all,
>
> Currently there is a circular dependecy error on util-linux recipe if we
> try to use fstrim.service and fstrim.timer. These files depend on
> libsystemd, therefore when you enable the systemd PACKAGECONFIG of
> util-linux the recipe breaks because systemd is also dependent on
> util-linux.
>
> I was wondering if we should create an util-linux-libuuid recipe
> equivalent for fstrim as well (util-linux-fstrim_<version>.bb ?), so we
> can get rid of this error. I am not sure if this is the correct
> approach, do anybody has any reccomendations? I will be happy to send a
> patch to fix this issue.
>
> Best Regards,
> Hiago.

For this particular fstrim issue, I think you can just install the files 
manually with replacing the @sbindir@ in the .service.in file.

Regards,
Qi


