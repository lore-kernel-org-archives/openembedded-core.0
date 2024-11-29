Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2665BD6EBE2
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 07:01:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.110568.1732863655561855785
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Nov 2024 23:00:55 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2063098a0a=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AT6u4GQ002734
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 07:00:54 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43671b1tdt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 07:00:53 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4AT70rGJ011662
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 07:00:53 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43671b1tdr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 07:00:53 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=THwkLSdUnWLRCRQptqL2IF0t+sotbCLS4eFekEIlRZKFKk8GNBen4o1e8R+4PWeDmSRFrBnFphILaqg9VTBILfyBv3h/tmBhS26QXt0fVWtlSpHRwum+p7+M0XFg17wgMMm7MQDM6yb4+KTPEpAayfWpmgn7BeXKTJdDmh1xOGipjBUNeeRNuPjD9+Ze/PnXoHKi1hqQ/ZBdVEE2b6j3z08ssmW5PmpiCyo1t7FiIfGee72JjpTHpLxjHuImEN8Eeh+GHlS8B6PWs1WeVj4gP8fOKFUhDSxhX84s0VX+mURnX2apwf0Bk2S/iU/GKFaM9uFhrqf9RjApPmNEraIokQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XPeoEskHACWRg38bI0On9JYZrNePhUsjcn6RdbTM8Qg=;
 b=k+hCXRABrkF3nSu3ajl2x4ViWxKjjh6Qe7uVFlQCuPSFBOXneBdYFk5HVJbxRQ8YzgnjIOF80DmmVL8/hb4jy0Z5t3+KB3CdhN3lwPtS8OPvMxYCAQivF+RnIp9FeBL/9a8YbAiy5yxxfcjXYJDuM7GajaO51pL+gzSa3QUrxl3RVFGQ9+Y7vO3oT0Qc3coBQneu+2YmdAeGcpgn38GGoWfBU9fQLD1E8MivBsu5QpFPIobqXwaw5w+bMW6jX+H4TEW/1x5DwaQyszSAEIPVBY/jRhXj+BhYrPjT3XuHwBjiAre4mX+msKAG4P0Msz/XfSr96oq6V/N0RRhCK+OElQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by CYXPR11MB8709.namprd11.prod.outlook.com (2603:10b6:930:dd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Fri, 29 Nov
 2024 07:00:49 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%4]) with mapi id 15.20.8207.010; Fri, 29 Nov 2024
 07:00:49 +0000
Content-Type: multipart/alternative;
 boundary="------------L2Dvp1NpafOt8CMZr3Tm9I0A"
Message-ID: <35c36689-1007-412a-ab65-d2c2e4820885@windriver.com>
Date: Fri, 29 Nov 2024 15:00:44 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe-core][PATCH V3 1/3] sbom30/spdx30: add link prefix to the
 namespace of spdxId and alias
To: openembedded-core@lists.openembedded.org, JPEWhacker@gmail.com
References: <20241125081500.4048680-1-hongxu.jia@windriver.com>
 <180B2809D3D6ACA7.7301@lists.openembedded.org>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <180B2809D3D6ACA7.7301@lists.openembedded.org>
X-ClientProxiedBy: TYCP286CA0372.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::20) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|CYXPR11MB8709:EE_
X-MS-Office365-Filtering-Correlation-Id: d9949969-6713-46f0-5f26-08dd10438dfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|366016|376014|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TStucHpNMTltNkdmd3BOb2VBRklGQW5BTjJVK2dEMFI1UDRHSzhMZlJsbWNL?=
 =?utf-8?B?SkNXUFZhL2VVOVVxS0MveElZZ05lSVJsOVhiQzRFOHAxS1ZPS2YrOG9kRkVt?=
 =?utf-8?B?K3Z0WldPeEQreVZRRmplclFtcDJMZDJJTnhKTW92a3Y1WHlBcE9WQjIxR09Y?=
 =?utf-8?B?UTF2akVZdTJnQmlib08waldLakVDSUVCc25ERUdtUmxMcVRXNWQyYndWMks5?=
 =?utf-8?B?NWtHVzEwT1JvVHl3UHlRVFFrNmFDSXJ6OFQ0TnpkbG9rZWdqKzVyU25aYUNG?=
 =?utf-8?B?R0dyTEdlNHJIYXMwanBoeGNzVGkrejJ6NWd6NWladE9OT3pTTk9va3BrRnUw?=
 =?utf-8?B?RnltVlM3d2IwekpDTTFySjVydWxjdEwrYS91V0pueUs4QVVIdlgzUDdoQSsw?=
 =?utf-8?B?c3QyYkNCV0l4Y3pmVDF2bUw0RkMxVm9uS3JtWDd4TkNqY3NlSGNTeGhJajlH?=
 =?utf-8?B?czVsUUNvNzFXcHNMcVhTLzk5SW95VFo2MklGRzlSZHVWa3FkNExaOGRGOUls?=
 =?utf-8?B?dHE1S1k5aktxT1d4L0wyTXAxUWIrcXhsMXVTSkNqYURIUU1YMXZ5M2t2VHh3?=
 =?utf-8?B?ajB0dTRqdTdpeGNERFRmV0w4bVJmU1JxRDBlNzV4TFhjU1g2dkNMZHFQZVhP?=
 =?utf-8?B?N0ZYYUZEMGdHRHNDQ09ZWFRYTWJxeFRLLzhLZXZpUGptdzVPWklaUW9HaUd4?=
 =?utf-8?B?cWJTM1BZQnJ3WTBRR0R5VDlGVEQ3aElaZWxWTGwzcmNLNWVXMUVPWXBQUlBY?=
 =?utf-8?B?NFUvQXlzZkxjbHJTc3FQTURYbytXOVliL1hTdkphSWloTFNlSkRmN1NqRENL?=
 =?utf-8?B?RXhpQXI3Qm9CSVBmZThyYzlEdndFNzZZTnE1RnVwdW5wdW85VGZ5REZ5MHEr?=
 =?utf-8?B?UytmQzljdVhmMTRrMzFzNU5JQ3I3SnhESGxqemNPZ0dvZzBINWpJNVdxU2lZ?=
 =?utf-8?B?aGh3eVVGNnROU3A5RE51c0s5WVl1RC9DS24xLzJkRTYwVHZSdzhIbFFBRkJJ?=
 =?utf-8?B?Y3FOTEM1VnlndmpHYmZzV3o0Ym5PMVIrWWpaN29hU3VLZDg4cTBGMGtaUXBV?=
 =?utf-8?B?OXJ6S3crb0FpQjU0dWVHL1d0NmtlUWV4OGNHS3ViZzdOMkFpaFcxcG1naVE4?=
 =?utf-8?B?MGNwTjE5VEpvRG5iMG5WT0VxeDVSdWdQdWxpaHcvOGl6UWQya0xLM3M2M2o4?=
 =?utf-8?B?SDZRbUJ0S282K01za0wzbTh5ZjE1eHhyTWJpMHYxYnFVSzdNMWlqWmVBd2tJ?=
 =?utf-8?B?Lyt4OGNvNnJacHNJUGo5dHNvR3IwcGRneVIrVkk5b1c1ZWV1dG15YTZKc2l0?=
 =?utf-8?B?Q01kSkNJdkVra0g3Y1NEVFp4ZzhacnFDWExONE1yUlppSTZ4UllJeVhzZnBD?=
 =?utf-8?B?M25ncXR6MmZ3TS85R2NHSjBWWFZHY1kwRGpEZGNJUEdSQXZvUkdQNlE2VS9D?=
 =?utf-8?B?VldiZ2NJZTgybmI3Z1pTM3luTStaa3U5YjhwRmNwVnNFa1ZqTmI4YmQrd0pU?=
 =?utf-8?B?a0JmbjREbTJqVWg3QXRTM3plZ1VUd0RIbTM2bEZuOVdOV1d3YVFLQ1VyMitR?=
 =?utf-8?B?cTJiYTRrK1gyYXpmMVM4aEt6bWhzMFpKTjVlbEpjQVZnOW9RODNjeHRMQTFK?=
 =?utf-8?B?L0FQVlpZWEJMWStKbmtyaHBoYVpSajdPL3UvVmVPMEREUWN3UFB2WTNaVGdv?=
 =?utf-8?B?ZHBTVlN5N1NUNjRzN05kMXF4Q0M2bldJdGZPZm5RVmdlbWtXMktOUUVhd0Js?=
 =?utf-8?Q?HD2KJkE/RVOd71b3Xw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(376014)(1800799024)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZnozNjk2RUQ1TW5YS2xOOXNRNVNmN0NkRFYvN280UkROSGphZk5vcy9TekFz?=
 =?utf-8?B?Y21XYVF1R0tSSm5tQlRIL3J0QzJMbTNDSVVYZG5KV2kyRWUxUU1ZbjQwU1U3?=
 =?utf-8?B?NXVuelpsYjVCYXV4QXY3bXZ6dnBRaDVRN2k2b1FUVXlJUE9yV1hRaTMyeVhN?=
 =?utf-8?B?dElkUVpoa3lxdGRFOHd3akgwU3hDeFdSY0YwSFpBeTJFUzR1MVZGY2V3RFBQ?=
 =?utf-8?B?Sjc1ZktxSXpUc3NWRW0wM21hRm1MMmQrd0dDdHVnZ2Z6ekVlV0hrVXBLUm45?=
 =?utf-8?B?emhVSEt3V2dmcGp5Zndnakp3Q05sdnFNQnVEeVpkbkZVYmg0ZmJucVNYMHZi?=
 =?utf-8?B?c3A1Nldsd2JseTBHTmNOTy9UeDBvNUJtZUF1cmZ4alJXTEt4YnN2dmpxZWdO?=
 =?utf-8?B?WHZNeUF6SkNlWW5yekZTVG1HZE5LZ0xiQll0MFpRL0hWUFhIN1NYdzVDczRJ?=
 =?utf-8?B?Vlk4YzFNTEJuNUFIRHNTbXRKZ29aU3BlU0JDdUhaRDFMbU9LbUZGMUJNNnY4?=
 =?utf-8?B?Z1I0MXRCZ3VpeUtTZzZJL250R2ZvSys1QmFvS2doS2g3SFpNSXRGRHp4K0pu?=
 =?utf-8?B?dWdrZkJJbmU3eUR4Zk5LMFpsSU1yUld3UFVnSmdodHhOMzZpdnJ5am9PemdL?=
 =?utf-8?B?RDBKeUI3cUx2NkZ6NVF2V2lKeFFkeEl2ay9yNnRaZi9CRFJjQW9VMEVhVmNr?=
 =?utf-8?B?OEF4R1F3eTUyR014UnZJYWM4UDlIVXUxbWRoeVo1TDVSdVBLSXdXU3FLSjF1?=
 =?utf-8?B?RXpPVXpPYURlTDNCRXZhSFE5Wm5EK2Y0c0Fod3ZnbUR6K3dBeHJGN3lWaHNZ?=
 =?utf-8?B?UXFlZWd3MmMwcXgyRzBUY0xab2RIeFJpNjA4bDFaNVNQUFNDYzBLeTJjeU5K?=
 =?utf-8?B?T1NuZE9oUVI2eW1mL3ZXZEhYb25sWkVHMXUxbjFBdjJvK0xKU3Z6R1ljMnJa?=
 =?utf-8?B?SnpOUFVWVUtjMmxMNWZ5UEYyRzRQWXdCVXIxSHY1U2lhQ2Npd3NoTm8wSVho?=
 =?utf-8?B?b3Znb3crT3hCVVgxUksybE5MdnN5bjk1NnhCNnUwRTR2RDNKbm1RK3VJMkMv?=
 =?utf-8?B?Q3RGZjVaeVFYQzBGM2NlUGtEYmxKamhKc3NlaW1iM2ZoRXhqQUI1b080Mnln?=
 =?utf-8?B?R1JwQjZqUHRyNXZYVDBHSkFFZ3Y4WDBTOTdiZk5PK3hOVFVDTWYvcGhvY1du?=
 =?utf-8?B?S3Q3Q0xLT1F6NXlqbk84N1R5WS9TZ3BrR3U1T3dPYlVqMmhIRThNUFp0bE1v?=
 =?utf-8?B?dU1UZ2JJZEgvR0VFckVWREFjRnRNVXJpR1JYMVZLMEduQ3VuRDZoUW50MGIy?=
 =?utf-8?B?UnlKUjZmTDhrT1VENkM0Ym5VSks1YmFJdHJKNVVUWWkyZThqQmFZNEh0NEJ6?=
 =?utf-8?B?dm04R1BEKzJnV2VXRVdVKzhWcURNMStqSld2ZW5UNXljM1liOWlpc1p4RnB1?=
 =?utf-8?B?STRMTVQ3QklpeC9DTkU2YjBwOGVkVjNCR21Zb3dacU9VM2lPQkdmWGlJRDNV?=
 =?utf-8?B?N2MxSEUvUVVaSUlvc0pVWGkwMzNrc0o1Lyt1VnBsNzJwclNONEhjZHhWVENF?=
 =?utf-8?B?K1U0VDhtMUlEaDlINHNLUFg0THZBYlYzNk9kYzdTcjZlcVc3Y1liVVBTcWZL?=
 =?utf-8?B?eHVvR0RZY3J4N2oycVlrNmxLdGVpYzZTOGhpQ2I4U2N4eS9MTk00aThsSm9D?=
 =?utf-8?B?OVVvdmJvWUI3SVEzWmJWUmJPcGE3aUV0UlRJZWhoRGUrYWxDbGswOGdWRUd4?=
 =?utf-8?B?d3JNcjllQ1Z1dzJRN2Y4aGJObGw1YTF3d1Fyd09MWnhweW1Scnoway91ZXky?=
 =?utf-8?B?b2hpT3V3cDlSVlBGT2pINVhxcWpCbUtiUzVNMW1NRlQ3cmJTcE40MDJDc1kv?=
 =?utf-8?B?RFBEUmlQUGpWVkFqZjlEcW44QnMwbmNlYytVV0hPZTlqNWRXck8rbndMVU15?=
 =?utf-8?B?emFkSHdIbWphb3Y2WDNOOThhbkh1YmtvaVpET2FhTFBWMTUrSGZ0c0hUWkRm?=
 =?utf-8?B?Q0N1WFZ0dnVLcWxpY2h4NTNPclB6MnNBd0M0dWZPbnByTFhNVTdJbVRKaHNy?=
 =?utf-8?B?MU9CRTlUZzRvcE9OcVVHWFFXRWQwSDU5ME10Z2pnOXFNcDJnTjNtdVd3QVJX?=
 =?utf-8?B?OE9FRWxEeTJGNUtueWo5WkJqalRpMTBGeG0yT0VWenNrMW5JU0svK0Z3a05Y?=
 =?utf-8?B?K2c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9949969-6713-46f0-5f26-08dd10438dfa
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2024 07:00:48.9817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8J8hfT2FuGN0vkq0wygIIHrZk5jpB2KWUvodtPJlCnRueA6wgNqncsB3QWf3Xp9FXRFFqSK+DLVhvgEPiRK9VdhJtw4IVKiNPNCjmHibC0g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8709
X-Proofpoint-GUID: RWyCQmszTJYmvG5fpKCdURaVy3Q0yhxg
X-Proofpoint-ORIG-GUID: fpy-B9I5dXYgdSOtLlAL4wchx5l3H51e
X-Authority-Analysis: v=2.4 cv=TIe/S0la c=1 sm=1 tr=0 ts=674966a5 cx=c_pps a=ynuEE1Gfdg78pLiovR0MAg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=24AZYWMyAAAA:8
 a=Q4-j1AaZAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=oh0XWkzd3RUQJgK0yEUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=WSVSr37nw-464eoIB1sA:9 a=sE9ysDpxHpX29x-M:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=bG88sKzkDEFeXWNnvthB:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-11-29_04,2024-11-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 mlxscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 adultscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2411290055
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 07:01:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208003

--------------L2Dvp1NpafOt8CMZr3Tm9I0A
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4AT6u4GQ002734

Ping Joshua,

Let me add some additional explanations,

The spdxId was consisted by "namespace" + "user define suffix" [1],
in each jsonld file, multiple elements have the same "namespace" and
different=C2=A0 "user define suffix".

This commit tries to make "namespace" differs between jsonld files, via=20
adding prefix
and name to instead of ${PN}, then each jsonld file have unique "namespac=
e"

After apply the commit, all elements in the same jsonld file will have=20
the same
"namespace", and pick up the same link-name from "namespace"

Take shadow for example,

In tmp/deploy/spdx/3.0.1/core2-64/recipes/shadow.spdx.json, link-name is=20
"recipe-shadow"
...
 =C2=A0=C2=A0=C2=A0 {
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "type": "simplelicensing_LicenseExpressio=
n",
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "spdxId":=20
"http://spdx.org/spdxdocs/recipe-shadow-6845d95c-0853-56dd-b976-caae5a994=
61e/bdf9bac970ab5868fda8a811581a46956790f1744837b22af9726173428059b7/lice=
nse/3_24_0/Unlicense",
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "creationInfo": "_:CreationInfo1",
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "extension": [
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "type": "https://=
rdf.openembedded.org/spdx/3.0/id-alias",
"https://rdf.openembedded.org/spdx/3.0/alias":=20
"http://spdx.org/spdxdocs/openembedded-alias/recipe-shadow/UNIHASH/licens=
e/3_24_0/Unlicense",
"https://rdf.openembedded.org/spdx/3.0/link-name": "recipe-shadow"
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "type": "https://=
rdf.openembedded.org/spdx/3.0/link-extension",
"https://rdf.openembedded.org/spdx/3.0/link-spdx-id": true,
"https://rdf.openembedded.org/spdx/3.0/link-name": "recipe-shadow"
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ],
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "simplelicensing_licenseExpression": "Unl=
icense",
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "simplelicensing_licenseListVersion": "3.=
24.0"
 =C2=A0=C2=A0=C2=A0 },
...

In tmp/deploy/spdx/3.0.1/core2-64/packages/shadow-src.spdx.json,=20
link-name is "package-shadow-src"
...
 =C2=A0=C2=A0=C2=A0 {
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "type": "software_Package",
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "spdxId":=20
"http://spdx.org/spdxdocs/package-shadow-src-ccffa1b0-6952-53bb-bc7f-0631=
476873ed/bdf9bac970ab5868fda8a811581a46956790f1744837b22af9726173428059b7=
/package/shadow-src",
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "creationInfo": "_:CreationInfo1",
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "description": "Tools to change and admin=
ister password and group=20
data=C2=A0 This package contains sources for debugging purposes.",
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "extension": [
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "type": "https://=
rdf.openembedded.org/spdx/3.0/id-alias",
"https://rdf.openembedded.org/spdx/3.0/alias":=20
"http://spdx.org/spdxdocs/openembedded-alias/package-shadow-src/UNIHASH/p=
ackage/shadow-src",
"https://rdf.openembedded.org/spdx/3.0/link-name": "package-shadow-src"
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "type": "https://=
rdf.openembedded.org/spdx/3.0/link-extension",
"https://rdf.openembedded.org/spdx/3.0/link-spdx-id": true,
"https://rdf.openembedded.org/spdx/3.0/link-name": "package-shadow-src"
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ],
...

Then creating unique link recipe-shadow.spdx.json and=20
package-shadow-src.spdx.json,
one link for one jsonld file, all elements in one jsonld file share one=20
symlink. Rather than each
element have unique link hash path.

tmp/deploy/spdx/3.0.1/core2-64/by-spdxid-link/recipe-shadow.spdx.json ->=20
../recipes/shadow.spdx.json
tmp/deploy/spdx/3.0.1/core2-64/by-spdxid-link/package-shadow-src.spdx.jso=
n=20
-> ../packages/shadow-src.spdx.json


[1]=20
https://github.com/openembedded/openembedded-core/blob/master/meta/lib/oe=
/sbom30.py#L353

//Hongxu

On 11/25/24 16:14, hongxu via lists.openembedded.org wrote:
> In order to simple reference the SPDX ID to instead of making jsonld ha=
sh
> path for each element, only creating one symlink for one file and refer=
encing
> it multiple times, add link prefix and name to the namespace of spdxId =
and alias
> to replace ${PN} to avoid namespace conflict between recipe, packages a=
nd images.
>
> Take recipe shadow, package shadow and package shadow-src for example:
> Without this commit, spdxId and alias in recipe and package jsonld have=
 the same
> namespace
>
>      spdxId:http://spdx.org/spdxdocs/shadow-xxx/...
>      alias:http://spdx.org/spdxdocs/openembedded-alias/shadow/UNIHASH/.=
..
>
> After apply this commit, the namespace of spdxId in recipe and package =
jsonld differs:
> In recipe jsonld tmp/deploy/spdx/3.0.1/core2-64/recipes/shadow.spdx.jso=
n
>
>      spdxId:http://spdx.org/spdxdocs/recipe-shadow-xxx/...
>      alias:http://spdx.org/spdxdocs/openembedded-alias/recipe-shadow/UN=
IHASH/...
>
> In package jsonld tmp/deploy/spdx/3.0.1/core2-64/packages/shadow.spdx.j=
son
>
>      spdxId:http://spdx.org/spdxdocs/package-shadow-xxx/...
>      alias:http://spdx.org/spdxdocs/openembedded-alias/package-shadow/U=
NIHASH/...
>
> In package jsonld tmp/deploy/spdx/3.0.1/core2-64/packages/shadow-src.sp=
dx.json
>
>      spdxId:http://spdx.org/spdxdocs/package-shadow-src-xxx/...
>      alias:http://spdx.org/spdxdocs/openembedded-alias/package-shadow-s=
rc/UNIHASH/...
>
> Then will use namespace of spdxId and alias to create link for jsonld f=
ile,
> one symlink for one jsonld file, referenced by elements multiple times
>
> Signed-off-by: Hongxu Jia<hongxu.jia@windriver.com>
> ---
>   meta/lib/oe/sbom30.py       | 29 ++++++++++++++++++-----------
>   meta/lib/oe/spdx30_tasks.py | 13 +++++++------
>   2 files changed, 25 insertions(+), 17 deletions(-)
>
> diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
> index 0a7b4c05fb..28d251a7ac 100644
> --- a/meta/lib/oe/sbom30.py
> +++ b/meta/lib/oe/sbom30.py
> @@ -217,9 +217,11 @@ def to_list(l):
>  =20
>  =20
>   class ObjectSet(oe.spdx30.SHACLObjectSet):
> -    def __init__(self, d):
> +    def __init__(self, d, name=3DNone, link_prefix=3DNone):
>           super().__init__()
>           self.d =3D d
> +        self.name =3D name
> +        self.link_prefix =3D link_prefix
>  =20
>       def create_index(self):
>           self.by_sha256_hash =3D {}
> @@ -322,6 +324,8 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
>               uuid.NAMESPACE_DNS, self.d.getVar("SPDX_UUID_NAMESPACE")
>           )
>           pn =3D self.d.getVar("PN")
> +        if self.link_prefix and self.name:
> +            pn =3D "%s-%s" % (self.link_prefix, self.name)
>           return "%s/%s-%s" % (
>               self.d.getVar("SPDX_NAMESPACE_PREFIX"),
>               pn,
> @@ -341,12 +345,15 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
>               elif namespace not in e._id:
>                   bb.warn(f"Namespace {namespace} not found in {e._id}"=
)
>               else:
> +                pn =3D self.d.getVar("PN")
> +                if self.link_prefix and self.name:
> +                    pn =3D "%s-%s" % (self.link_prefix, self.name)
>                   alias_ext =3D set_alias(
>                       e,
>                       e._id.replace(unihash, "UNIHASH").replace(
>                           namespace,
> -"http://spdx.org/spdxdocs/openembedded-alias/"
> -                        + self.d.getVar("PN"),
> +                        f"{self.d.getVar('SPDX_NAMESPACE_PREFIX')}/ope=
nembedded-alias/"
> +                        + pn,
>                       ),
>                   )
>  =20
> @@ -805,8 +812,8 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
>           )
>  =20
>       @classmethod
> -    def new_objset(cls, d, name, copy_from_bitbake_doc=3DTrue):
> -        objset =3D cls(d)
> +    def new_objset(cls, d, name, copy_from_bitbake_doc=3DTrue, link_pr=
efix=3DNone):
> +        objset =3D cls(d, name=3Dname, link_prefix=3Dlink_prefix)
>  =20
>           document =3D oe.spdx30.SpdxDocument(
>               _id=3Dobjset.new_spdxid("document", name),
> @@ -887,9 +894,9 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
>           return missing_spdxids
>  =20
>  =20
> -def load_jsonld(d, path, required=3DFalse):
> +def load_jsonld(d, path, required=3DFalse, name=3DNone, link_prefix=3D=
None):
>       deserializer =3D oe.spdx30.JSONLDDeserializer()
> -    objset =3D ObjectSet(d)
> +    objset =3D ObjectSet(d, name=3Dname, link_prefix=3Dlink_prefix)
>       try:
>           with path.open("rb") as f:
>               deserializer.read(f, objset)
> @@ -918,9 +925,9 @@ def jsonld_hash_path(_id):
>       return Path("by-spdxid-hash") / h[:2], h
>  =20
>  =20
> -def load_jsonld_by_arch(d, arch, subdir, name, *, required=3DFalse):
> +def load_jsonld_by_arch(d, arch, subdir, name, *, required=3DFalse, li=
nk_prefix=3DNone):
>       path =3D jsonld_arch_path(d, arch, subdir, name)
> -    objset =3D load_jsonld(d, path, required=3Drequired)
> +    objset =3D load_jsonld(d, path, required=3Drequired, name=3Dname, =
link_prefix=3Dlink_prefix)
>       if objset is not None:
>           return (objset, path)
>       return (None, None)
> @@ -1049,8 +1056,8 @@ def find_root_obj_in_jsonld(d, subdir, fn_name, o=
bj_type, **attr_filter):
>       return spdx_obj, objset
>  =20
>  =20
> -def load_obj_in_jsonld(d, arch, subdir, fn_name, obj_type, **attr_filt=
er):
> -    objset, fn =3D load_jsonld_by_arch(d, arch, subdir, fn_name, requi=
red=3DTrue)
> +def load_obj_in_jsonld(d, arch, subdir, fn_name, obj_type, link_prefix=
=3DNone, **attr_filter):
> +    objset, fn =3D load_jsonld_by_arch(d, arch, subdir, fn_name, requi=
red=3DTrue, link_prefix=3Dlink_prefix)
>  =20
>       spdx_obj =3D objset.find_filter(obj_type, **attr_filter)
>       if not spdx_obj:
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index 5aeed5cd6f..ef829fbbf1 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -461,7 +461,7 @@ def create_spdx(d):
>       if not include_vex in ("none", "current", "all"):
>           bb.fatal("SPDX_INCLUDE_VEX must be one of 'none', 'current', =
'all'")
>  =20
> -    build_objset =3D oe.sbom30.ObjectSet.new_objset(d, d.getVar("PN"))
> +    build_objset =3D oe.sbom30.ObjectSet.new_objset(d, d.getVar("PN"),=
 link_prefix=3D"recipe")
>  =20
>       build =3D build_objset.new_task_build("recipe", "recipe")
>       build_objset.set_element_alias(build)
> @@ -574,7 +574,7 @@ def create_spdx(d):
>  =20
>               bb.debug(1, "Creating SPDX for package %s" % pkg_name)
>  =20
> -            pkg_objset =3D oe.sbom30.ObjectSet.new_objset(d, pkg_name)
> +            pkg_objset =3D oe.sbom30.ObjectSet.new_objset(d, pkg_name,=
 link_prefix=3D"package")
>  =20
>               spdx_package =3D pkg_objset.add_root(
>                   oe.spdx30.software_Package(
> @@ -793,7 +793,7 @@ def create_package_spdx(d):
>       # Any element common to all packages that need to be referenced b=
y ID
>       # should be written into this objset set
>       common_objset =3D oe.sbom30.ObjectSet.new_objset(
> -        d, "%s-package-common" % d.getVar("PN")
> +        d, "%s-package-common" % d.getVar("PN"), link_prefix=3D"packag=
e"
>       )
>  =20
>       pkgdest =3D Path(d.getVar("PKGDEST"))
> @@ -812,6 +812,7 @@ def create_package_spdx(d):
>               "packages-staging",
>               pkg_name,
>               oe.spdx30.software_Package,
> +            link_prefix=3D"package",
>               software_primaryPurpose=3Doe.spdx30.software_SoftwarePurp=
ose.install,
>           )
>  =20
> @@ -1002,7 +1003,7 @@ def create_rootfs_spdx(d):
>       with root_packages_file.open("r") as f:
>           packages =3D json.load(f)
>  =20
> -    objset =3D oe.sbom30.ObjectSet.new_objset(d, "%s-%s" % (image_base=
name, machine))
> +    objset =3D oe.sbom30.ObjectSet.new_objset(d, "%s-%s" % (image_base=
name, machine), link_prefix=3D"rootfs")
>  =20
>       rootfs =3D objset.add_root(
>           oe.spdx30.software_Package(
> @@ -1037,7 +1038,7 @@ def create_image_spdx(d):
>       image_basename =3D d.getVar("IMAGE_BASENAME")
>       machine =3D d.getVar("MACHINE")
>  =20
> -    objset =3D oe.sbom30.ObjectSet.new_objset(d, "%s-%s" % (image_base=
name, machine))
> +    objset =3D oe.sbom30.ObjectSet.new_objset(d, "%s-%s" % (image_base=
name, machine), link_prefix=3D"image")
>  =20
>       with manifest_path.open("r") as f:
>           manifest =3D json.load(f)
> @@ -1150,7 +1151,7 @@ def sdk_create_spdx(d, sdk_type, spdx_work_dir, t=
oolchain_outputname):
>       sdk_name =3D toolchain_outputname + "-" + sdk_type
>       sdk_packages =3D oe.sdk.sdk_list_installed_packages(d, sdk_type =3D=
=3D "target")
>  =20
> -    objset =3D oe.sbom30.ObjectSet.new_objset(d, sdk_name)
> +    objset =3D oe.sbom30.ObjectSet.new_objset(d, sdk_name, link_prefix=
=3D"sdk")
>  =20
>       sdk_rootfs =3D objset.add_root(
>           oe.spdx30.software_Package(
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#207723):https://lists.openembedded.org/g/openembedd=
ed-core/message/207723
> Mute This Topic:https://lists.openembedded.org/mt/109768078/3617049
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
hongxu.jia@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--------------L2Dvp1NpafOt8CMZr3Tm9I0A
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Ping Joshua,</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Let me add some additional
      explanations,</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">The spdxId was consisted by &quot;namespace&quot;
      + &quot;user define suffix&quot; [1],</div>
    <div class="moz-cite-prefix">in each <span style="white-space: pre-wrap">jsonld</span> file, multiple
      elements have the same &quot;namespace&quot; and</div>
    <div class="moz-cite-prefix">different&nbsp; &quot;user define suffix&quot;.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">This commit tries to make &quot;namespace&quot;
      differs between <span style="white-space: pre-wrap">jsonld</span>
      files, via adding prefix</div>
    <div class="moz-cite-prefix">and name to instead of ${PN}, then <span style="white-space: pre-wrap">each jsonld file have unique</span>
      &quot;namespace&quot;</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">After apply the commit, all elements in
      the same <span style="white-space: pre-wrap">jsonld file will have the same</span></div>
    <div class="moz-cite-prefix">&quot;namespace&quot;, and pick up the same
      link-name from &quot;namespace&quot;</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Take shadow for example,</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">In
      tmp/deploy/spdx/3.0.1/core2-64/recipes/shadow.spdx.json, link-name
      is &quot;<font color="#ef2929">recipe-shadow</font>&quot;
    </div>
    <div class="moz-cite-prefix">...</div>
    <div class="moz-cite-prefix">&nbsp;&nbsp;&nbsp; {<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;type&quot;: &quot;simplelicensing_LicenseExpression&quot;,<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;spdxId&quot;: &quot;<font color="#ef2929"><a class="moz-txt-link-freetext" href="http://spdx.org/spdxdocs/recipe-shadow-6845d95c-0853-56dd-b976-caae5a99461e/bdf9bac970ab5868fda8a811581a46956790f1744837b22af9726173428059b7">http://spdx.org/spdxdocs/recipe-shadow-6845d95c-0853-56dd-b976-caae5a99461e/bdf9bac970ab5868fda8a811581a46956790f1744837b22af9726173428059b7</a></font>/license/3_24_0/Unlicense&quot;,<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;creationInfo&quot;: &quot;_:CreationInfo1&quot;,<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;extension&quot;: [<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;type&quot;:
      <a class="moz-txt-link-rfc2396E" href="https://rdf.openembedded.org/spdx/3.0/id-alias">&quot;https://rdf.openembedded.org/spdx/3.0/id-alias&quot;</a>,<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a class="moz-txt-link-rfc2396E" href="https://rdf.openembedded.org/spdx/3.0/alias">&quot;https://rdf.openembedded.org/spdx/3.0/alias&quot;</a>: &quot;<font color="#ef2929"><a class="moz-txt-link-freetext" href="http://spdx.org/spdxdocs/openembedded-alias/recipe-shadow/UNIHASH">http://spdx.org/spdxdocs/openembedded-alias/recipe-shadow/UNIHASH</a></font>/license/3_24_0/Unlicense&quot;,<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a class="moz-txt-link-rfc2396E" href="https://rdf.openembedded.org/spdx/3.0/link-name">&quot;https://rdf.openembedded.org/spdx/3.0/link-name&quot;</a>: &quot;<font color="#ef2929">recipe-shadow</font>&quot;<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;type&quot;:
      <a class="moz-txt-link-rfc2396E" href="https://rdf.openembedded.org/spdx/3.0/link-extension">&quot;https://rdf.openembedded.org/spdx/3.0/link-extension&quot;</a>,<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a class="moz-txt-link-rfc2396E" href="https://rdf.openembedded.org/spdx/3.0/link-spdx-id">&quot;https://rdf.openembedded.org/spdx/3.0/link-spdx-id&quot;</a>:
      true,<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a class="moz-txt-link-rfc2396E" href="https://rdf.openembedded.org/spdx/3.0/link-name">&quot;https://rdf.openembedded.org/spdx/3.0/link-name&quot;</a>: &quot;<font color="#ef2929">recipe-shadow</font>&quot;<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ],&nbsp;&nbsp;&nbsp; &nbsp;<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;simplelicensing_licenseExpression&quot;: &quot;Unlicense&quot;,<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;simplelicensing_licenseListVersion&quot;: &quot;3.24.0&quot;<br>
      &nbsp;&nbsp;&nbsp; },<br>
    </div>
    <div class="moz-cite-prefix">...<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">In
      tmp/deploy/spdx/3.0.1/core2-64/packages/shadow-src.spdx.json,
      link-name is &quot;<font color="#ef2929">package-shadow-src</font>&quot;</div>
    <div class="moz-cite-prefix">...</div>
    <div class="moz-cite-prefix">&nbsp;&nbsp;&nbsp; {&nbsp;&nbsp; &nbsp;<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;type&quot;: &quot;software_Package&quot;,<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;spdxId&quot;: &quot;<font color="#ef2929"><a class="moz-txt-link-freetext" href="http://spdx.org/spdxdocs/package-shadow-src-ccffa1b0-6952-53bb-bc7f-0631476873ed/bdf9bac970ab5868fda8a811581a46956790f1744837b22af9726173428059b7">http://spdx.org/spdxdocs/package-shadow-src-ccffa1b0-6952-53bb-bc7f-0631476873ed/bdf9bac970ab5868fda8a811581a46956790f1744837b22af9726173428059b7</a></font>/package/shadow-src&quot;,<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;creationInfo&quot;: &quot;_:CreationInfo1&quot;,<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;description&quot;: &quot;Tools to change and administer password and
      group data&nbsp; This package contains sources for debugging
      purposes.&quot;,<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;extension&quot;: [<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;type&quot;:
      <a class="moz-txt-link-rfc2396E" href="https://rdf.openembedded.org/spdx/3.0/id-alias">&quot;https://rdf.openembedded.org/spdx/3.0/id-alias&quot;</a>,<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a class="moz-txt-link-rfc2396E" href="https://rdf.openembedded.org/spdx/3.0/alias">&quot;https://rdf.openembedded.org/spdx/3.0/alias&quot;</a>: &quot;<font color="#ef2929"><a class="moz-txt-link-freetext" href="http://spdx.org/spdxdocs/openembedded-alias/package-shadow-src/UNIHASH">http://spdx.org/spdxdocs/openembedded-alias/package-shadow-src/UNIHASH</a></font>/package/shadow-src&quot;,<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a class="moz-txt-link-rfc2396E" href="https://rdf.openembedded.org/spdx/3.0/link-name">&quot;https://rdf.openembedded.org/spdx/3.0/link-name&quot;</a>: &quot;<font color="#ef2929">package-shadow-src</font>&quot;<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },&nbsp; &nbsp;<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;type&quot;:
      <a class="moz-txt-link-rfc2396E" href="https://rdf.openembedded.org/spdx/3.0/link-extension">&quot;https://rdf.openembedded.org/spdx/3.0/link-extension&quot;</a>,<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a class="moz-txt-link-rfc2396E" href="https://rdf.openembedded.org/spdx/3.0/link-spdx-id">&quot;https://rdf.openembedded.org/spdx/3.0/link-spdx-id&quot;</a>:
      true,<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a class="moz-txt-link-rfc2396E" href="https://rdf.openembedded.org/spdx/3.0/link-name">&quot;https://rdf.openembedded.org/spdx/3.0/link-name&quot;</a>: &quot;<font color="#ef2929">package-shadow-src</font>&quot;<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ], <br>
    </div>
    <div class="moz-cite-prefix">...</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Then creating unique link <font color="#ef2929">recipe-shadow.spdx.json</font> and <font color="#ef2929">package-shadow-src.spdx.json,</font></div>
    <div class="moz-cite-prefix">one link for one <span style="white-space: pre-wrap">jsonld</span> file, all elements in
      one <span style="white-space: pre-wrap">jsonld</span> file share
      one symlink. Rather than each</div>
    <div class="moz-cite-prefix">element have unique link hash path.<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">tmp/deploy/spdx/3.0.1/core2-64/by-spdxid-link/recipe-shadow.spdx.json
      -&gt; ../recipes/shadow.spdx.json</div>
    <div class="moz-cite-prefix">tmp/deploy/spdx/3.0.1/core2-64/by-spdxid-link/package-shadow-src.spdx.json
      -&gt; ../packages/shadow-src.spdx.json<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">[1]
<a class="moz-txt-link-freetext" href="https://github.com/openembedded/openembedded-core/blob/master/meta/lib/oe/sbom30.py#L353">https://github.com/openembedded/openembedded-core/blob/master/meta/lib/oe/sbom30.py#L353</a><br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">//Hongxu</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 11/25/24 16:14, hongxu via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:180B2809D3D6ACA7.7301@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">In order to simple reference the SPDX ID to instead of making jsonld hash
path for each element, only creating one symlink for one file and referencing
it multiple times, add link prefix and name to the namespace of spdxId and alias
to replace ${PN} to avoid namespace conflict between recipe, packages and images.

Take recipe shadow, package shadow and package shadow-src for example:
Without this commit, spdxId and alias in recipe and package jsonld have the same
namespace

    spdxId: <a class="moz-txt-link-freetext" href="http://spdx.org/spdxdocs/shadow-xxx/">http://spdx.org/spdxdocs/shadow-xxx/</a>...
    alias: <a class="moz-txt-link-freetext" href="http://spdx.org/spdxdocs/openembedded-alias/shadow/UNIHASH/">http://spdx.org/spdxdocs/openembedded-alias/shadow/UNIHASH/</a>...

After apply this commit, the namespace of spdxId in recipe and package jsonld differs:
In recipe jsonld tmp/deploy/spdx/3.0.1/core2-64/recipes/shadow.spdx.json

    spdxId: <a class="moz-txt-link-freetext" href="http://spdx.org/spdxdocs/recipe-shadow-xxx/">http://spdx.org/spdxdocs/recipe-shadow-xxx/</a>...
    alias: <a class="moz-txt-link-freetext" href="http://spdx.org/spdxdocs/openembedded-alias/recipe-shadow/UNIHASH/">http://spdx.org/spdxdocs/openembedded-alias/recipe-shadow/UNIHASH/</a>...

In package jsonld tmp/deploy/spdx/3.0.1/core2-64/packages/shadow.spdx.json

    spdxId: <a class="moz-txt-link-freetext" href="http://spdx.org/spdxdocs/package-shadow-xxx/">http://spdx.org/spdxdocs/package-shadow-xxx/</a>...
    alias: <a class="moz-txt-link-freetext" href="http://spdx.org/spdxdocs/openembedded-alias/package-shadow/UNIHASH/">http://spdx.org/spdxdocs/openembedded-alias/package-shadow/UNIHASH/</a>...

In package jsonld tmp/deploy/spdx/3.0.1/core2-64/packages/shadow-src.spdx.json

    spdxId: <a class="moz-txt-link-freetext" href="http://spdx.org/spdxdocs/package-shadow-src-xxx/">http://spdx.org/spdxdocs/package-shadow-src-xxx/</a>...
    alias: <a class="moz-txt-link-freetext" href="http://spdx.org/spdxdocs/openembedded-alias/package-shadow-src/UNIHASH/">http://spdx.org/spdxdocs/openembedded-alias/package-shadow-src/UNIHASH/</a>...

Then will use namespace of spdxId and alias to create link for jsonld file,
one symlink for one jsonld file, referenced by elements multiple times

Signed-off-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
---
 meta/lib/oe/sbom30.py       | 29 ++++++++++++++++++-----------
 meta/lib/oe/spdx30_tasks.py | 13 +++++++------
 2 files changed, 25 insertions(+), 17 deletions(-)

diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index 0a7b4c05fb..28d251a7ac 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -217,9 +217,11 @@ def to_list(l):
 
 
 class ObjectSet(oe.spdx30.SHACLObjectSet):
-    def __init__(self, d):
+    def __init__(self, d, name=None, link_prefix=None):
         super().__init__()
         self.d = d
+        self.name = name
+        self.link_prefix = link_prefix
 
     def create_index(self):
         self.by_sha256_hash = {}
@@ -322,6 +324,8 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
             uuid.NAMESPACE_DNS, self.d.getVar(&quot;SPDX_UUID_NAMESPACE&quot;)
         )
         pn = self.d.getVar(&quot;PN&quot;)
+        if self.link_prefix and self.name:
+            pn = &quot;%s-%s&quot; % (self.link_prefix, self.name)
         return &quot;%s/%s-%s&quot; % (
             self.d.getVar(&quot;SPDX_NAMESPACE_PREFIX&quot;),
             pn,
@@ -341,12 +345,15 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
             elif namespace not in e._id:
                 bb.warn(f&quot;Namespace {namespace} not found in {e._id}&quot;)
             else:
+                pn = self.d.getVar(&quot;PN&quot;)
+                if self.link_prefix and self.name:
+                    pn = &quot;%s-%s&quot; % (self.link_prefix, self.name)
                 alias_ext = set_alias(
                     e,
                     e._id.replace(unihash, &quot;UNIHASH&quot;).replace(
                         namespace,
-                        <a class="moz-txt-link-rfc2396E" href="http://spdx.org/spdxdocs/openembedded-alias/">&quot;http://spdx.org/spdxdocs/openembedded-alias/&quot;</a>
-                        + self.d.getVar(&quot;PN&quot;),
+                        f&quot;{self.d.getVar('SPDX_NAMESPACE_PREFIX')}/openembedded-alias/&quot;
+                        + pn,
                     ),
                 )
 
@@ -805,8 +812,8 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
         )
 
     @classmethod
-    def new_objset(cls, d, name, copy_from_bitbake_doc=True):
-        objset = cls(d)
+    def new_objset(cls, d, name, copy_from_bitbake_doc=True, link_prefix=None):
+        objset = cls(d, name=name, link_prefix=link_prefix)
 
         document = oe.spdx30.SpdxDocument(
             _id=objset.new_spdxid(&quot;document&quot;, name),
@@ -887,9 +894,9 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
         return missing_spdxids
 
 
-def load_jsonld(d, path, required=False):
+def load_jsonld(d, path, required=False, name=None, link_prefix=None):
     deserializer = oe.spdx30.JSONLDDeserializer()
-    objset = ObjectSet(d)
+    objset = ObjectSet(d, name=name, link_prefix=link_prefix)
     try:
         with path.open(&quot;rb&quot;) as f:
             deserializer.read(f, objset)
@@ -918,9 +925,9 @@ def jsonld_hash_path(_id):
     return Path(&quot;by-spdxid-hash&quot;) / h[:2], h
 
 
-def load_jsonld_by_arch(d, arch, subdir, name, *, required=False):
+def load_jsonld_by_arch(d, arch, subdir, name, *, required=False, link_prefix=None):
     path = jsonld_arch_path(d, arch, subdir, name)
-    objset = load_jsonld(d, path, required=required)
+    objset = load_jsonld(d, path, required=required, name=name, link_prefix=link_prefix)
     if objset is not None:
         return (objset, path)
     return (None, None)
@@ -1049,8 +1056,8 @@ def find_root_obj_in_jsonld(d, subdir, fn_name, obj_type, **attr_filter):
     return spdx_obj, objset
 
 
-def load_obj_in_jsonld(d, arch, subdir, fn_name, obj_type, **attr_filter):
-    objset, fn = load_jsonld_by_arch(d, arch, subdir, fn_name, required=True)
+def load_obj_in_jsonld(d, arch, subdir, fn_name, obj_type, link_prefix=None, **attr_filter):
+    objset, fn = load_jsonld_by_arch(d, arch, subdir, fn_name, required=True, link_prefix=link_prefix)
 
     spdx_obj = objset.find_filter(obj_type, **attr_filter)
     if not spdx_obj:
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 5aeed5cd6f..ef829fbbf1 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -461,7 +461,7 @@ def create_spdx(d):
     if not include_vex in (&quot;none&quot;, &quot;current&quot;, &quot;all&quot;):
         bb.fatal(&quot;SPDX_INCLUDE_VEX must be one of 'none', 'current', 'all'&quot;)
 
-    build_objset = oe.sbom30.ObjectSet.new_objset(d, d.getVar(&quot;PN&quot;))
+    build_objset = oe.sbom30.ObjectSet.new_objset(d, d.getVar(&quot;PN&quot;), link_prefix=&quot;recipe&quot;)
 
     build = build_objset.new_task_build(&quot;recipe&quot;, &quot;recipe&quot;)
     build_objset.set_element_alias(build)
@@ -574,7 +574,7 @@ def create_spdx(d):
 
             bb.debug(1, &quot;Creating SPDX for package %s&quot; % pkg_name)
 
-            pkg_objset = oe.sbom30.ObjectSet.new_objset(d, pkg_name)
+            pkg_objset = oe.sbom30.ObjectSet.new_objset(d, pkg_name, link_prefix=&quot;package&quot;)
 
             spdx_package = pkg_objset.add_root(
                 oe.spdx30.software_Package(
@@ -793,7 +793,7 @@ def create_package_spdx(d):
     # Any element common to all packages that need to be referenced by ID
     # should be written into this objset set
     common_objset = oe.sbom30.ObjectSet.new_objset(
-        d, &quot;%s-package-common&quot; % d.getVar(&quot;PN&quot;)
+        d, &quot;%s-package-common&quot; % d.getVar(&quot;PN&quot;), link_prefix=&quot;package&quot;
     )
 
     pkgdest = Path(d.getVar(&quot;PKGDEST&quot;))
@@ -812,6 +812,7 @@ def create_package_spdx(d):
             &quot;packages-staging&quot;,
             pkg_name,
             oe.spdx30.software_Package,
+            link_prefix=&quot;package&quot;,
             software_primaryPurpose=oe.spdx30.software_SoftwarePurpose.install,
         )
 
@@ -1002,7 +1003,7 @@ def create_rootfs_spdx(d):
     with root_packages_file.open(&quot;r&quot;) as f:
         packages = json.load(f)
 
-    objset = oe.sbom30.ObjectSet.new_objset(d, &quot;%s-%s&quot; % (image_basename, machine))
+    objset = oe.sbom30.ObjectSet.new_objset(d, &quot;%s-%s&quot; % (image_basename, machine), link_prefix=&quot;rootfs&quot;)
 
     rootfs = objset.add_root(
         oe.spdx30.software_Package(
@@ -1037,7 +1038,7 @@ def create_image_spdx(d):
     image_basename = d.getVar(&quot;IMAGE_BASENAME&quot;)
     machine = d.getVar(&quot;MACHINE&quot;)
 
-    objset = oe.sbom30.ObjectSet.new_objset(d, &quot;%s-%s&quot; % (image_basename, machine))
+    objset = oe.sbom30.ObjectSet.new_objset(d, &quot;%s-%s&quot; % (image_basename, machine), link_prefix=&quot;image&quot;)
 
     with manifest_path.open(&quot;r&quot;) as f:
         manifest = json.load(f)
@@ -1150,7 +1151,7 @@ def sdk_create_spdx(d, sdk_type, spdx_work_dir, toolchain_outputname):
     sdk_name = toolchain_outputname + &quot;-&quot; + sdk_type
     sdk_packages = oe.sdk.sdk_list_installed_packages(d, sdk_type == &quot;target&quot;)
 
-    objset = oe.sbom30.ObjectSet.new_objset(d, sdk_name)
+    objset = oe.sbom30.ObjectSet.new_objset(d, sdk_name, link_prefix=&quot;sdk&quot;)
 
     sdk_rootfs = objset.add_root(
         oe.spdx30.software_Package(
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#207723): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/207723">https://lists.openembedded.org/g/openembedded-core/message/207723</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/109768078/3617049">https://lists.openembedded.org/mt/109768078/3617049</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:hongxu.jia@eng.windriver.com">hongxu.jia@eng.windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------L2Dvp1NpafOt8CMZr3Tm9I0A--

