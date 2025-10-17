Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E14C9CCD199
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 02:44:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7139.1760669085050434678
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Oct 2025 19:44:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=BWR20Xqf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2385795b49=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59H26qEt888477
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 19:44:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=XMRYdOVa6ZpoupJ1WBh3YU9GvvynmDXy3J/4YtsCjV4=; b=BWR20Xqfqqau
	PonB34JRAWJ/olekB/KRuqGysAS0qPfA+OF+KhIROy3EKYgK/PyhcrI9WoTMyvXO
	i39eE7AdG+T1icYVfUuOJxrcapGycDepg3Irpn3YMpiJwJYwk+oxO6xxkr6oP78/
	d3UCogte4vraz+Yh8qCnDgt0bBX0x3iIxQqwRZSWCD3jKo/CCIM76F0XhZSZzGyD
	9hVqz7GvWD/7WlgR6+h2qC65ur4+O9jMdqIk7ssl0FkjfNWSqI9PL6ypODw+0gyK
	cQLkcSRi5dIHZNViShClUkfrMOiY5j/CeSpCRPKJSxd78XVOWyjiXZeB19mI6m3b
	iGKtSIbJrQ==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012065.outbound.protection.outlook.com [40.107.200.65])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qprdxs4c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 16 Oct 2025 19:44:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C0Ig2TR9GY11d3Oh8V40J44CgONEnsemUzQyZ79Sk3vdVal2OPO72bhdAxwRWUOV9echDISYaN2WE7JWWUiO61eecX0CWUQfgE29mdn79Sa7l/ZYgRrKTcpE3cS20IMFjQl6r1NAsNWWrFCdnWcnKzpxzL7ZqyN/yrk5ueHsJuMzV9/2g4fE5wKMlzXht7nsttieTNIDwYbt4eDLDseEsADUnZIiYiSiARjo1+CmZt2l6YsOXOiXQoV4p8J31dIQWMlXo5FNafjPzmgaUv8z3w6qnFvr69f+jTSsOqMfVKfoViQrsxa54tBhGChq8omEOomzh3KcsQuUEk6Nq3+3Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XMRYdOVa6ZpoupJ1WBh3YU9GvvynmDXy3J/4YtsCjV4=;
 b=VDXVhWPdPMvLmvHI8w808mQg94DT4MiJoqiqXB4/IjTQh3QpgCaOFoBCeDg16lTR72BeXx/5HHrochJ9h/4vxWd+Nqi5gQ1apycqynVzMT0T6zljY0G4GsPnK9MrrdKCoYhsRw9CKh3BmtFm+cAkUFQ2RpT8g5byEc3vbKomV38oF5YTSn6iurRbvQPuQpguLyyElvKjVhSJWEoyHLhNWx8S9cKpOAMJ6UeMhVcDLgVFMBIgagANdvUZwkRYYfziw4GXXgasJDL1+73m7q51SCUMzoFzTJuhr5G20CWexm8hryUz3uLR8L6zN7ENReBu9LP+tzOR7/MRN6XvNprbhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CO1PR11MB4849.namprd11.prod.outlook.com (2603:10b6:303:90::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Fri, 17 Oct
 2025 02:44:41 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9203.009; Fri, 17 Oct 2025
 02:44:41 +0000
Message-ID: <4f933821-481c-4cfe-adc0-b734792fc006@windriver.com>
Date: Fri, 17 Oct 2025 10:44:37 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] package_manager/oe-pkgdata-util: fix
 complementary package installation
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20250924084233.3429501-1-Qi.Chen@windriver.com>
 <CO6PR11MB560294040AD5A59501524E32EDE9A@CO6PR11MB5602.namprd11.prod.outlook.com>
 <DDJUY91C0269.2QMM9NMD7SA2G@bootlin.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <DDJUY91C0269.2QMM9NMD7SA2G@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY4P286CA0043.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::10) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CO1PR11MB4849:EE_
X-MS-Office365-Filtering-Correlation-Id: aea05957-c6f4-4b1e-ea76-08de0d271f5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TXdUVjlNM1BodFVzL012SklwNHlSMDQzYkxVR3JJODluSVdRSG10Q1luMHFM?=
 =?utf-8?B?L3c1TXBxUHlFK2xwRkFvYVVWcmtqa1MxMjNoSkVPNS9FeFBzUGlyQkJJVVJh?=
 =?utf-8?B?RlpYUjlpa1dwR25jL0pocEdwdmt4d3hUSXdkb0JCYTQ0bWtxZFRsVnBmWU85?=
 =?utf-8?B?a0E2SDU4SDNManY3VHJVdUtMbmtCaXJTMlNJWXhlaWFCMVBFNEhjVkE3MWFw?=
 =?utf-8?B?UGVscUJ6dHkyeFhpYng4R0RBVXJCeFJnYkJROEx4UnBpR0EvRE04Rndqa3Zj?=
 =?utf-8?B?eE9DU3dpNXRGeUJmQVNSNjVwaTdzcy9iT2lKSmNXYVk0R1NidTJBdWwvaWdm?=
 =?utf-8?B?a2dTQ3dZd3AvaW4rV0VUVjd5SnlxQWJTZWFQZGF6bmdqcHVIMUlwdXVTSm0w?=
 =?utf-8?B?KzFRMUdKYWJHNmowU1B5N2tOdGkyRXBFeFBBZW5FY1g4UlllQUdrMWx0ck9L?=
 =?utf-8?B?ditOdTFSV3BBOUQrQ2xBN3d3WVdxRjc0K29lb3hUeFJXKzlYS21rakNWRDds?=
 =?utf-8?B?QWFWcnBQcllvQkYrMXBRcURtK2ZRemtESFVwTjkzUnRTY0hlOVliM1BqekFl?=
 =?utf-8?B?VzA4OUpCajJrNWRCZk4xZ05uQkxSNGdNQmZpVUZDQ2lRVDNzb0s3ZDcxZTJW?=
 =?utf-8?B?U1I0N1RyWTVlMHRRWWdHYW9ic0pSVnU0djlpcS9XUDJDWVRJTldDWFBCeXRk?=
 =?utf-8?B?OFg4WWNMbEZxVkZiVThoUlBreGIvTmpQdTNyWHc0cnF1YU9JRVEzWDJETVN4?=
 =?utf-8?B?aUlmZnlrcVdQdXNoVVlGNmJXUGJ0bVNSNVNMQTg5VWpuVXo1WUEyaFNWNDlx?=
 =?utf-8?B?TWxCN3hxUmhVY1lhV3NCa0FlS3ArLytTMWdJSGluWHF0NDF1U0RSNVdNQ3I0?=
 =?utf-8?B?c0g5VDV0bjROaURjNkRHUXovTGdzNVE1bXpWZzFZdllRUEVpM0NzajcwTXBY?=
 =?utf-8?B?Nit3dy9jbC9ueVk4TnZYSFZiazgwUE51ZkhlbVJmSkthVjJTUDhoSU51VEJN?=
 =?utf-8?B?RGpGWEc1cjd5RWZTZ3c2Q3BxQkhmeUI2b05hY29LYldObW1PR1hHMVBGbndU?=
 =?utf-8?B?TmZBeHdVL1ZKeENQVDlPak50dzF2WmxjYXAvWENZMWpnYzdUSkd5NlAvckgy?=
 =?utf-8?B?N1JRMEtPcjhtVUlVTjB1emM0TnZ5d2JCcEhIdXMzdTRVQmp4czl5Q3laWS9k?=
 =?utf-8?B?emVtVGhUYnhsV1psa0hYSmpBSXlxUm93d2VTVWYrdEQ4eWJqR2lPMVVhb3NW?=
 =?utf-8?B?SUtUQUo1MDkvYVpHeHROUUdhT3dMYjdBT01TM01yMDdhL3luRDIzdmp0blY2?=
 =?utf-8?B?eUViQit2S3E4bGNLUmQ3SEgyVmc2K3EzUmsxVVBPOWN4WTBialJSejkrS2xl?=
 =?utf-8?B?OE9peTNoQXdqc294N1pXZWxBVGtZdVlpSDVxZUhvSzk0VURQeTh0Zk15aE1B?=
 =?utf-8?B?WFpCUjBvay95cUtiQlM3NzdmRjJQSnNONkJFK3NYYWtTRFZCbkk5TVlDOXdH?=
 =?utf-8?B?VnRmbE9kcjlXZkhITWlJUGlRM05PSndCZUZ0a2MvcUUxRkZwR3o0bHRYeEJ4?=
 =?utf-8?B?NS9HZURpcmlJQkdqRnVIai8yZGxCT2ExdHRNUW1KWjNXREdhM1Z4eGY3V3BP?=
 =?utf-8?B?V1ZQcDBVdmdTbHZTcittU3JUekc3UEtCbTl6Yk1PajUrQ2FpalF0M2dFSE5C?=
 =?utf-8?B?d0ZoWCtmdGt2QklicFBOUWdqMUpMVlU0MStLN0ExY25VdXhiNkFobEpmVmFu?=
 =?utf-8?B?NEVMQUhQdm9LZ3p1eG9La1VHQytQRnQzeUoyb2FBbFRGSTlTL2lRbGh3U0xa?=
 =?utf-8?B?WEJKbDk2VUhUUFc2TGZCRTl3ZXZqTFBlNFU2THNOOWhRV054Y21IUUdLQ1BZ?=
 =?utf-8?B?UEVUd1FMaCtNS0Z0TXNtVmJUem5TRXl3cjR6bzBhclpYQkg3Y0RNb3ZyU2Js?=
 =?utf-8?Q?NH0TF7w7YEfpJ1pYABfamWtgrQ6zQbi3?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?M0U2ZEFxZzJLREIxK2dOVWd2cWpFdCt2d1FDdEIyRklyeDNSN0gyQmt3aEl6?=
 =?utf-8?B?VTdQWUp2UEV4VlpnTVhmZXRBbjNUNUJJTTZqRFluZlZ5WFljaHRyVm1IdVd1?=
 =?utf-8?B?bUJnTzFRUkcvTFIzcm1FOThVR2luWFZwNEgyWEcrbEYrL3ptbjBLcmdOaHd0?=
 =?utf-8?B?YUxTQ0poMnljRVRoV2N0OHZ4QWF2R05GWGVML0hFQWx4cFcrM2ZlQm5QYU9p?=
 =?utf-8?B?L0tPNDA0Wkx0bjl4ZXJVSkg1S2d6c1U5OW1HZU95UjdFUUN0TC8xaU5rUmhU?=
 =?utf-8?B?QTJBTGNzMmhPcmpIU3VkUWQrZWRORHhCVTVZQ2ZOWnA4MDhURVJhNWRqOElR?=
 =?utf-8?B?K0pLWjV5bnpKdFBEOWZjYjkwN3kzUjhHV2xFOStBRERBaUk0SlZ4NGpyM0tt?=
 =?utf-8?B?NnVpc3QvQTE3N0Z6eU8rdU02MGk3OXRSZUVRTTlwVzRiZEF2S3JYTW12VndT?=
 =?utf-8?B?NU1IZ21reTh5cHphUENpODA2eTA0dUh3KzI2UGlYRHVRbC9KNm5SNkh3Q2R3?=
 =?utf-8?B?TTI1dFJGaGhjek1OSU5JTE5YMnNBcUdXY0dkM1BWNERLUzNPdEJlc0FLYUhl?=
 =?utf-8?B?eno2cUJMMTJTS21TTFBIR2JaWGoybG9LMnQvNnRuYVJVOEdhczhSaTAwQUtk?=
 =?utf-8?B?d2U3MkVyMDB2alZlMWZUMldPYjdMZlZXOHdTWmZ2Q1h6dUJHRnpHdFZQbkFw?=
 =?utf-8?B?WDVqbXVWSXpmVWdVT1ZCajNQOFk4dVFSZmJNWGRiNm9pZVNvQloxbHFib1E1?=
 =?utf-8?B?YWdqbW4zV2U0b1YyaC9HTjVSWjRQSWpYMU1CUUJwM2psdlJmaTQ5eFU2WjVR?=
 =?utf-8?B?VEE3TDlGczV5bkZjQVhqbEdybUxsZnlUUFRQK2x2bHMzUEFrMlNaVVRWL3N5?=
 =?utf-8?B?SWlSczVPdi9hWUgrUkxQNjRzUTZPYzJBMUtqajZ5T2lxYlBXOFU1VURjZzVP?=
 =?utf-8?B?eGRnci8wT3dpVVI0VGNlREVKbnZEa0t6L3hNUGlsc0JQcnBZT0M3QTVReXor?=
 =?utf-8?B?MllXYzdBOEsyZGVleTZ4TUZhUHlqUGE3STBLZC9QUTd3UWJiY0dZOFpWaUpH?=
 =?utf-8?B?VWFPeDFKQW1BV3VLdWxWTzBLQlRudE42TGFYVitJVWc0WlNGa3IwRUJpYWd6?=
 =?utf-8?B?MG4vRHpsKy9kTTI0bzNabjZkWkxSWVdWbm9kQWpNckFCTG5PQ1BBZGQ4WW5P?=
 =?utf-8?B?NDJKWTRTM3Z4eTdOc3Yrdi9GNElpaW5lazVUY2pQUkYwQ2J3Q1NhQUdjZnQv?=
 =?utf-8?B?czFZY1FiVkJXcDdHSWFnYkVlMHJXR0d3ejhhOCtkTXIzQTNmT2pucjllVDFz?=
 =?utf-8?B?NjVxemtzSzMwL3VaajljLzZxL0NWRk5YY0JPNkVML1JCMnVGWVgzdWNQdFQx?=
 =?utf-8?B?cG5rVnpqTnVKc2l6M24wdUNSdXJQSDdWTTUzTk16VC9UVUxFeVlvc3ppaUlR?=
 =?utf-8?B?bW5xbm00cFFrekFFSyt2VGtkZGdOTGJaaklBYlBtMEIrZnVFU3BnUENwZ2tw?=
 =?utf-8?B?OUt4dHpzMk8yNEZyeC9lSUlSa1RKZ3hJYkZuWGpEd0lqSHNLRTczUkVSa044?=
 =?utf-8?B?RlgxK1psd2pYVGFjRDNHd3VpekNQd2lXcTJDRGZxYms4SWJrRjI3dXVBSUUv?=
 =?utf-8?B?WjNFOVhNZ1Mwc25mN3U0TnozUWRmYlluTkxaUnRsdmJ1QnpPalBYd1hBKzI0?=
 =?utf-8?B?Z3FuekRBMlc0SUMrSHR3TTVrdDViVitUQnVYRU8vbTV2a3RPeE5aUVpFKzhV?=
 =?utf-8?B?QlMyVnpHOTdWVllKUlk3dzdWcExlcnF6K3o1bTdMTmVCK2YvaXpIVERXL0JM?=
 =?utf-8?B?OTZOUUN0anpYQXdVNUVqdjRLZmV5bW5VSmJGSmx4akg0cjJUZWttU0xrdmFV?=
 =?utf-8?B?aUMvckk3L0p3aVIwUHVOYVg4a0dhMHdaV3VaQVpuSzdTNjNmcWVkMGJXNEVB?=
 =?utf-8?B?TzhLSjFRZHl5MzlzdWZ3UXZwWXNURERObFJHUktuQyt0dWlLQ0dUR015c0tZ?=
 =?utf-8?B?M1FHUzRVcEtmWVBNVWFDVXJIb0hvTTZUUVU2RnYyR3QwZmk3S1VsUG5sM25z?=
 =?utf-8?B?Y0F3MDZOenJFSTlaUG1jY0ZMRjExbm1XN0xiYmhoSWtaSUYxajI0ZXF5L20z?=
 =?utf-8?Q?bmrwC46C6NUgPnm/frVdm3tR1?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aea05957-c6f4-4b1e-ea76-08de0d271f5e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 02:44:41.6940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C7ewkp8dglO8FOx8tGjss6oXhVmIb+NYLSo3CKC9IEiTimt7orYsBn3MyaTYfGS/2AfOaZME8NEO4hpW2q+vbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4849
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE3MDAyMCBTYWx0ZWRfX1F3+2G2f2G93
 Ki+CknZ3WH4hPQ+llQChEEDLR3motu4zipz0BSxZmjj1jR7kwBL+V+k1/MrAuhyYqgpPFfZmTgI
 /Iw8r3EkwtDk3vpHjsJjIsW9pcCWqEEuUUSmhxuwwnu4hILDBkgXcYk9GiJVLVFmKqBHP2G8+/Z
 fj5d3zUBjrVHPmzy+E2bkweWG6VWMunIFkz8Lz+bBfpyE5vLVpHu7HXKlknghePvhOrudgoBPmQ
 PP/S8Y8bfZyf0f+NsDmVn5BiTTeVUBw4JBjwWyffYKjssO5ThVb9kW56dKoKC8FiIR8cnCNaf+P
 69u2UL8fr5BJOYUwUQvzj2cnyqFfyXpGPwPkkEZIuLTf0WV5GaBxEVRcK2mw5QErKkPYS7aNml5
 EokWmYuzVreS76fjX4dthUSCetMhlg==
X-Proofpoint-GUID: wa2fFSwEqvHVFQFNXOxDY8nU28TdZJWl
X-Authority-Analysis: v=2.4 cv=JaKxbEKV c=1 sm=1 tr=0 ts=68f1ad9c cx=c_pps
 a=c5DtkGEGy/pke2otaEk1DA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=sp__ra2DQtPr0xdX5vgA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: K76aRqx1rgESBREEG1YVN8xtyRhBM6uv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510170020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 02:44:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224988

On 10/16/25 23:39, Mathieu Dubois-Briand wrote:
> On Thu Oct 16, 2025 at 10:35 AM CEST, Chen Qi via lists.openembedded.org wrote:
>> ping
>>
> Hi Chen,
>
> I confirm this patch is still in the master-next branch. It is still
> considered to be merged, but this is a non-trivial change and nobody had
> the bandwidth to review it so far.
>
Got it. Thanks.

Regards,
Qi


