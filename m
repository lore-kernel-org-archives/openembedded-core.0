Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED9AFC3DA4A
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 08:42:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.206032.1724056935256915615
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 01:42:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8961296bbf=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47J4v0U4026923
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 08:42:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 412ju6sj7h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 08:42:14 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47J8gDuX001555;
	Mon, 19 Aug 2024 08:42:13 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 412ju6sj7e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 08:42:13 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a/nzn7jHW4A8APjthLnSzRrkpg6R8NsgvOkBkZfJZeLdCPzZe4n8g7r+XPYPpIpYUrYLMP5tBWp9Gab+5B8Q0xOHBeLrmoGRGUlRS3OHlDSgzCX+k3xNFCWf0DaVHg3EBQ9VnFfWizaMVjd2RgOqndOm8/PkzxSaUwa4Bs8hdUz8QjdD4FKlwrpG6n5E4RK54oHy+5mspHmgHGlOeUM4v2uioecdtDkWNoraHFxPESI2pjBiUmeZJTRg4zrgwPEa9C/a1CkqxGm4gBQCdjvY9ExKfv2SQXaOlUohXP91eLDm6Llmi66opNoQl16q9Bo67YtVX+5+LnTxmeOnbqywbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i+Km8AnToK3Mosq5k64B2Uq3gzC4b0jvLXDc47CDUHY=;
 b=O6iUiLNknyuiPuH4mtYrB2CO7/YPaw3hlqHhBUqPUTusW3yIazzYt+AuUvBf34+S7DXiccR/aWJxGs+FiMHlZONsunnkgjlXsVgNjDhrBw8rok0Ic07kwCANlXqQyJSZgN83rp1gFbV2zlMkY9Nq4sd1LiaqNSGd+zyjjq9sUxXLA8fyE3HID+AuuRY9+beVxISjtczZ2gNoQUsrscLgc1WFjoFJKGZVIrWia11FJYicxKhDvZTmeQ2SLHjGx7u2rwsHbmdrHQGdVLOy49XNIVcvpSR9tK3sxM2hkJ7W54n5Lm4xIAv8xtzCyXUmBDc6F1EkiIBxF/u2SZBe6uFHcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by PH7PR11MB5862.namprd11.prod.outlook.com (2603:10b6:510:134::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 08:42:12 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%5]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 08:42:11 +0000
Message-ID: <5af6be94-323e-4c38-bf58-054fe085b650@windriver.com>
Date: Mon, 19 Aug 2024 16:42:05 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] util-linux: Add PACKAGECONFIG option to
 mitigate rootfs remount error
To: niko.mauno@vaisala.com, openembedded-core@lists.openembedded.org
References: <20240819082215.1322013-1-niko.mauno@vaisala.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <20240819082215.1322013-1-niko.mauno@vaisala.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0175.apcprd04.prod.outlook.com
 (2603:1096:4:14::13) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|PH7PR11MB5862:EE_
X-MS-Office365-Filtering-Correlation-Id: 96ec4bbd-b03b-4e80-5244-08dcc02ad167
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|4022899009|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?R05adlNwQXViQ2N6VUhWMk9PL3V6S0E4eng3b1JrMzNYTy9Sa1JReEFyNlVt?=
 =?utf-8?B?VHkxSFJTOFZ2ckhLeTBOVHJDeGp0dzVHalE5MktmbnNBaEg4SmV2RTJQWWVS?=
 =?utf-8?B?elRzUW1oVDgvZ2lrbThkM0JNcW5BNU9sQ1hteXhiTEZEZkVPUGhJWDZ1dlJC?=
 =?utf-8?B?K01oMk40cVB3UHc5cFJOZ2tsKzNyaHZRaUtwc2tiSTN2T0VJYlIwRTljd0FS?=
 =?utf-8?B?SlJaOHB6T3FNK0VkUUZQNEVMNEptblBLNHNSZ2RiZzhnYk1CWDZyTmVmLzNC?=
 =?utf-8?B?YnNTbzVSWEh3citRZmlJVjdqc1d2a2IySWlXZ0NvajBHeWFLVUlaU2F1dG1C?=
 =?utf-8?B?Z3lvcThNVktwd0ladllhdURRZDYvV3ZSNkw4N0h6Q1F4Z0VKOEtrN1M2WVNG?=
 =?utf-8?B?ZkExQnMvWVV2aVpLMDFQT053a0JiamxDSGdkZnphQXZoa2k3Q2dxcmlXdW1K?=
 =?utf-8?B?cWd1RXBmWVpWSmlnZzgvOFVLY3RJSElMM1pVb0dtc0loRUtXSVBibUNWYkxS?=
 =?utf-8?B?Qm9lZ2oxN1Y5MXJGRDBtZWM1WDdJaStpMGF6eE83Um81ZW40bHNhVThoci84?=
 =?utf-8?B?RllQOWEyTGhsTFo1MHl6cEgxQW04NEdNVUhna1lwTm0wdDkwQitZVFRWUkpk?=
 =?utf-8?B?cmhCWms1TnV1SkMzdnVUeWJkZmJrUFZzVndERjZYUURjeUZXREJKMjhieVVx?=
 =?utf-8?B?NjVUbVBQYm1FOWUybExxNkdKaXBQVEVOQ3hIcllrczM4VmNHUWFkMDhoWmdF?=
 =?utf-8?B?U1hwdlh2OGt3ek91dHN4RXpPb3ZRYnZlS0pTLzZjWEdhbkw4RElQQnJ5S04x?=
 =?utf-8?B?UDd4ak0zaGR4ZkJWU0FQNnZrNFhtNTIzQ1NCdVJhanBjWkJ0eGM0WnBPVVE0?=
 =?utf-8?B?bkMxZnBXKzRUQm0vMU82SnFhL2dBSjhXdFF6LzBPaWcyZFVSRko4QnR1WWty?=
 =?utf-8?B?aVR6WUM2czJMQTljejhIbm5QVm5VSm1YTGoyeUFoNmttbDZVcDZCWkRzditP?=
 =?utf-8?B?WEpIRy9tcW83U2RIeG9NZzdOdWZhbUxYOUVtdGIxd1I4VHlVRmtpeWF4R05q?=
 =?utf-8?B?QTJMWjdGSUtlVERsT2ZoRHlMSlBkdU8xRkNKTDBBTnJHRkFtZ010SDBuVTZW?=
 =?utf-8?B?MEdQSmNFTjE2UER1cEVLVW56OGdhY1ROcnFydlVBWnRJU0RJcTlxZXJKSXlT?=
 =?utf-8?B?K1VHaE84S294eWNIdnRrWGp4dHRub0NSSjZQODF0RkMvSEU0SDBxMGRVVTJv?=
 =?utf-8?B?d2dZcExtK002UlRCZi9FT0JhQjhqL2ZONG5jbTdTSXlGaG1jSHd2b0JZM3kw?=
 =?utf-8?B?Y0VFcDNnVm5BemtOc2tPelZEK0JRcGFSOWdZc1FqWllzODlDWjVHOUVuaFlr?=
 =?utf-8?B?akVtWU85NmhjYkkwaGJXUE40eDk2eWZrL1BVRUJ5NExnTGhmcndzMENRS0Jx?=
 =?utf-8?B?N2xKWXNIMUwwOEliMWpWYzNKTE5JaTVLSXcvTnlPYjQ5MzBqUXBBd05CVGYw?=
 =?utf-8?B?TVlRTk93V0l2TkVNMEFCOXZvNzRUTXd5NVNIdHp2ZFM4VVB6Q1NpN1kxRGNo?=
 =?utf-8?B?TzVoMVRUUWs5YmJqcGNRWW9QWEZMdnpHZlJKeWtJbEhXMy9TaVBtOUc2Wktl?=
 =?utf-8?B?Q1JrNXZCenIva3k3akhvYjRWNlcwak0yOXZFaEFOZlpTYXVZZG1iZWJJbkEr?=
 =?utf-8?B?R0k3VzlzenVFSHI4QnYwSDhuWVU4QWJ2UVlqWlBoWDZpa0xuMzRmSUNNbzh0?=
 =?utf-8?Q?CQt8Z093oH2SAAm9NE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(4022899009)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QVdvK09jQndXNlUrV3YyWXN3aThBblk0enowNnVVcnlRcXh4cEVkVEdTT1VU?=
 =?utf-8?B?YThMYVVUK1A5QktPeXdsMXZQcWZIazRsZDRlRll3b1BEcXpTaERDMmgyckRq?=
 =?utf-8?B?dVJRU2JRM3NPSTdaREdnUDBaZ0twNHhzcUFuNGk0ZEVNVTl4K1dNZlFKWFRW?=
 =?utf-8?B?REVoTVI4cElCMjFzOCtpZjFTMHBtdFVycWV6YnBYYjdXRnliZ3VzMTI0c3dM?=
 =?utf-8?B?ZVdsaFpqQm96dE9haXdCQ1g3ZFJCYzFlM01UUzJXb3ZlbFFqVE1mS0VPR09w?=
 =?utf-8?B?ZlBsTHBpMW9rcUNiZ0N1RkF2ZWtWU2dkek1rNHN3MWZPMWd1a1VIUnRUMTdI?=
 =?utf-8?B?aUY3ck1CdU4xbURYYnR5T2U5eG5FR3grWHZVM2VQQkd3SGo3M1RVR1ZEWG5B?=
 =?utf-8?B?RUZQYWdyYnFvNW8zUnFDZ2VEeVBaQjgrZ0MvYmpHcXFtZ0lybFJNV0pDcEkv?=
 =?utf-8?B?YkFDaVdJU3lxOEE2d25oTzFtTmYrYjlLVDd2MDBmTnZpWUJTMEhvanpYOStL?=
 =?utf-8?B?dDg5VGZsaDd2YitzN1p5TllZcGNaNVhUNFB3WFNLTUZGWDNKWHI1d1JPdXBG?=
 =?utf-8?B?dlpKMFI1cHdFcWdMR09lNVB4bjlZSVFnN2ZVMGdvTndqNXlSRTZPSXRyM3Fh?=
 =?utf-8?B?VEdZOW8yTGdHTjN3eWtYMzhiVHVuUUJKSnlXWGEzcnNQYVRhdWI5aFpqSVJh?=
 =?utf-8?B?MjgvWmgvYUpuUFZTc2gxdGl1MUZLall4M3VKRlppUVJIT3l5Q0NMM1VPS29Q?=
 =?utf-8?B?NUV3MVFYNVVqcHBCT1B1Wkd2U051UDJCSWxWdlVnWlRDbXZ1M1NpMHBaQzVy?=
 =?utf-8?B?N1YyN3BXQTNUSDFwamh1K0ZHSXpyOTRJQTdpV2JtMmpxL0VZZTE4RUViZjZw?=
 =?utf-8?B?eit1MnBDQmU1VXJyVVNHR1lJTkNvR1JRa2NwYjMvWVdlZXVwVjlybGVEazFT?=
 =?utf-8?B?Ti83emkvMGovM3UzT2w3WVRubTJtTVg4dXlBWXZhRGRVT29IZk5JZnRCb0x0?=
 =?utf-8?B?TWVKalZHLzNCM1dVSHFobjZJd3FIZi9aMGpKOHRZV1c5aE5YU1FhWHJtcGxD?=
 =?utf-8?B?Y2VLWGJDejNZWkR5L0ptcXNVUnVmbDZKNGdNSkUzem1Mc0lsVkdEYzdTUU14?=
 =?utf-8?B?SUs4ODB0aytOR2k5VnFYdUh6ajE5QkZBU0ZlR1cvd0pkNVBKeVNBTTIvNjg3?=
 =?utf-8?B?Q05SaVV3NXdHUjFFKzZTb1VlY0x2M09JQjRBTEJoTW1GTytIUlBrUHg1UUk4?=
 =?utf-8?B?dHo5VjAyVjQ3NVNITE5tbUdmdUoxcTlDS3lGU3poUW9NdzhFUFFoalVxMExq?=
 =?utf-8?B?VjlJRHZaUkM2a1R2WWV2WWdmQUZnK0ZIRmkva0FlbVFmOEhoM2dqM2U0YUpv?=
 =?utf-8?B?emVGYUtqc2UrYUl0NEptcEVVV3ZhZXB6eFgrUldiSGMzSjJGdHFrcVRTUlor?=
 =?utf-8?B?OEVtaTF5UnVWZHdvcnluRUZ6NE9qSHRiMThIQUllcjlLYWR5UFlRbkFXVlZB?=
 =?utf-8?B?MnVob2Q2Q09YTVBEMWpiYlZSUEJpU3F6UzVEWHU4RlI3MXNlZ21NRlo3N283?=
 =?utf-8?B?QkUxanBPb3VIZUNuZ1dBWUdwS054ZndPaHdrd0ZoT08yZ0dhMjRpcGxrdS8v?=
 =?utf-8?B?c092UXg2U0c5TnFSVWxkTlhERVB6YUZSSEdzNFExd25PRC9pa0JPbXhnbGlp?=
 =?utf-8?B?MmtWOExKOTJkZXl1V0RNRnBncEpkSkk0NkYwSHJHb0NMU3Q3bkpVVWg0UnNr?=
 =?utf-8?B?am5KQyt5MGlsZkt0alMxVWRraFlwMXR6WEhFVC9WWnJxcU8vL09Hb3BJcUJB?=
 =?utf-8?B?RXVqeWF2MU9RalRhMkdoaUxXSm94UEI0Q0p6QzFRcU9jdlppWWJQWGIrYzNY?=
 =?utf-8?B?a0lRaGVZN2FDcnFWcGNlajJqVGVYZEtOeVhudXdZQXdWSlFCb2FuZldsL2w4?=
 =?utf-8?B?WWM4V1NaRHowNmhtQVlYZWErbzJlU2FrU2hDVnlvNnQxYWorL2RsQzRqeE8v?=
 =?utf-8?B?Y1c3dWZOaWpuZ0dtbU9pY1N1ZEZmYnFSc0wyWVZubi9ybDhKQnFMeUVUdCtE?=
 =?utf-8?B?TG9xd2Y4WjZLVThGZUNjS3B5TkdZL3locTh3R2pzTWk2dHZBdzcvV0NqTndu?=
 =?utf-8?Q?oBMxyicJGXskXn3Fgzj/e9HO8?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96ec4bbd-b03b-4e80-5244-08dcc02ad167
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 08:42:11.8109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ZbMB1S9uH+XygEF3JeSrZh0dSWAWWunIjAa5lKiOkTTX6yQmGFD1sdFZP5L61RrA3zpefSfgNInSUa5bhi4Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5862
X-Proofpoint-ORIG-GUID: 7c0cyy7bMIafGf34GfOLJbWpTJ_DPdHL
X-Authority-Analysis: v=2.4 cv=VdWlP0p9 c=1 sm=1 tr=0 ts=66c30566 cx=c_pps a=28bFCgguF5sZfysLuYgbMw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yoJbH4e0A30A:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8 a=NEAV23lmAAAA:8
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=eWRtdWc1AAAA:8 a=t7CeM3EgAAAA:8 a=prNLF6cHo92Il2LaOS0A:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=Vxmtnl_E_bksehYqCbjh:22 a=AjGcO6oz07-iQ99wixmX:22 a=fQEa9puXOWAy-YWvlEz7:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: dtguLLFyey-G68-TOpyCAgeGfxoN7LIZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_07,2024-08-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 spamscore=0 malwarescore=0 impostorscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408190062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 08:42:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203490

Please see my comments in your v1 patch.
I don't think we should add this PACKAGECONFIG, instead the util-linux's 
check codes need to be improved.

Regards,
Qi

On 8/19/24 16:22, Niko Mauno via lists.openembedded.org wrote:
> The 2.39 version of util-linux took new file descriptors based mount
> kernel API into use. In relation to this change, the upstream release
> notes in
> https://github.com/util-linux/util-linux/blob/v2.39/Documentation/releases/v2.39-ReleaseNotes#L14-L21
> mention that
>
>    This change is very aggressive to libmount code, but hopefully, it does not introduce regressions in traditional mount(8) behavior.
>
> After observing following failure when booting a board using a bit
> older 6.1 series kernel together with initramfs rootfs based boot flow
>
>    [FAILED] Failed to start Remount Root and Kernel File Systems.
>    See 'systemctl status systemd-remount-fs.service' for details.
>
> closer inspection revealed:
>
>    demoboard ~ # systemctl status -l systemd-remount-fs.service
>    x systemd-remount-fs.service - Remount Root and Kernel File Systems
>         Loaded: loaded (/usr/lib/systemd/system/systemd-remount-fs.service; enabled-runtime; preset: disabled)
>         Active: failed (Result: exit-code) since Wed 2024-08-14 14:53:48 UTC; 1min 22s ago
>           Docs: man:systemd-remount-fs.service(8)
>                 https://www.freedesktop.org/wiki/Software/systemd/APIFileSystems
>        Process: 76 ExecStart=/usr/lib/systemd/systemd-remount-fs (code=exited, status=1/FAILURE)
>       Main PID: 76 (code=exited, status=1/FAILURE)
>
>    Aug 14 14:53:48 demoboard systemd-remount-fs[76]: /usr/bin/mount for / exited with exit status 32.
>    Aug 14 14:53:48 demoboard systemd-remount-fs[81]: mount: /: mount point not mounted or bad option.
>    Aug 14 14:53:48 demoboard systemd-remount-fs[81]:        dmesg(1) may have more information after failed mount system call.
>    Aug 14 14:53:48 demoboard systemd[1]: systemd-remount-fs.service: Main process exited, code=exited, status=1/FAILURE
>    Aug 14 14:53:48 demoboard systemd[1]: systemd-remount-fs.service: Failed with result 'exit-code'.
>    Aug 14 14:53:48 demoboard systemd[1]: Failed to start Remount Root and Kernel File Systems.
>
> also consequentially, 'systemctl status' reported:
>
>    State: degraded
>
> When issuing 'strace -ff mount -o remount /' the failure occurred at
>
>    mount_setattr(3, "", AT_EMPTY_PATH, {attr_set=MOUNT_ATTR_RDONLY|MOUNT_ATTR_NOATIME|MOUNT_ATTR_NODIRATIME, attr_clr=MOUNT_ATTR_NOSUID|MOUNT_ATTR_NODEV|MOUNT_ATTR_NOEXEC|MOUNT_ATTR_NOATIME|MOUNT_ATTR_STRICTATIME|MOUNT_ATTR_NOSYMFOLLOW|0x40, propagation=0 /* MS_??? */, userns_fd=0}, 32) = -1 EINVAL (Invalid argument)
>
> After further investigation, The issue was pinpointed to lack of Linux
> kernel commit
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=95de4ad173ca0e61034f3145d66917970961c210
> ("fs: relax mount_setattr() permission checks") in the kernel version
> that was being used. Above mitigation was discussed in email related to
> then-rejected CVE-2024-26821:
> https://lore.kernel.org/linux-cve-announce/2024051606-imaging-entrench-b327@gregkh/T/
>
> After testing with qemuarm64 machine different linux-yocto versions,
> it was observed that the issue impacts following versions of currently
> supported LTS kernels:
>   - 6.6.17 (fixed since 6.6.18 i.e. mount_setattr() returns 0)
>   - 6.1.78 (fixed since 6.1.79 i.e. mount_setattr() returns 0)
>   - 5.15.164 which is currently the newest of 5.15.y series (i.e. no
>     known working version)
>
> Taking the above findings into consideration, add a new PACKAGECONFIG
> option which by default opts users out from using the feature which
> can cause issues with some older kernels.
>
> Versions 5.10.223, 5.4.279 and 4.10.317 were also tested but the issue
> was not reproduced with those versions - using strace showed that the
> mount_setattr call associated with the new mount API problem was not
> issued with these LTS kernel versions, which seemed to be confirmed
> also by following libmount debug message in these cases:
>
>    415: libmount:     HOOK: [0x7fa115e818]: failed to init new API
>
> Note: In addition to the aforementioned, this change was
> tested also briefly using the current latest kernel versions 6.1.104,
> 6.6.45 and 6.10.3 that using the old mount API with newest kernels
> did not introduce any observable regression to the boot flow.
>
> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> ---
>   meta/recipes-core/util-linux/util-linux_2.40.1.bb | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/meta/recipes-core/util-linux/util-linux_2.40.1.bb b/meta/recipes-core/util-linux/util-linux_2.40.1.bb
> index a1aab94055..2d89eb6745 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.40.1.bb
> +++ b/meta/recipes-core/util-linux/util-linux_2.40.1.bb
> @@ -107,6 +107,13 @@ PACKAGECONFIG[cryptsetup] = "--with-cryptsetup,--without-cryptsetup,cryptsetup"
>   PACKAGECONFIG[chfn-chsh] = "--enable-chfn-chsh,--disable-chfn-chsh,"
>   PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux"
>   PACKAGECONFIG[lastlog2] = "--enable-liblastlog2,--disable-liblastlog2,sqlite3"
> +# Using the new file descriptors based mount kernel API can cause rootfs remount failure with some older kernels.
> +# Of currently supported LTS kernels, it seems safe to enable this option with:
> +# - version 6.6.18 and newer in the 6.6.y series.
> +# - version 6.1.79 and newer in the 6.1.y series.
> +# - with the 5.15.y series, versions till at least 5.15.164 can not use it.
> +# - with 5.10.y, 5.4.y and 4.19.y series kernels libmount seemed to use the old API regardless of this option.
> +PACKAGECONFIG[new-mount-api] = "--enable-libmount-mountfd-support,--disable-libmount-mountfd-support"
>   
>   EXTRA_OEMAKE = "ARCH=${TARGET_ARCH} CPU= CPUOPT= 'OPT=${CFLAGS}'"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203486): https://lists.openembedded.org/g/openembedded-core/message/203486
> Mute This Topic: https://lists.openembedded.org/mt/107977031/7304865
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


