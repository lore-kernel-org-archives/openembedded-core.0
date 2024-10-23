Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8881FD2E00A
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 02:40:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.125.1729651233718973001
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Oct 2024 19:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0026e9079c=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49N0j65F024265
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 02:40:33 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42c3r74e26-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 02:40:32 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49N2ZfQh020462
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 02:40:32 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42c3r74e25-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 02:40:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xjwE0AJUEE35CmpAPCN0tBWM4DXvYhvpIbhVTZyKyWkLCWVcBZoIjrwSYmSxsEhZT16XTPLkQhOmhCGQKsYSh/NKVVarXNpmIk6NMCJO8qxywBwzw/ALHoQI26Q18SaUF2u8a8hHiftIZreUYlrWVffMjJVFiaz9FkJ3imHc6zJ3Vt+39COJm54BenIugdpNzlYegjeFat/QANEeMbAoqw4Ph2OY+86Xuw8f9w4s9AGHVK1Pm4Ocn2QTjVVFW5+hrGBuofHA/jzNHYzyr4zUgXsFEfwe9Wqz2nLslEesDZWExLrXFyTyWxTe5lVLy/d9+//CY/jXMMe42Bw/zTqQQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ctdWmj9m/3Yr2F6CM+LVV/9S+Sqgg3icCVzIKjfqUgo=;
 b=nSo8EILN74O1MRkZQQRsWoSGLTkR/gaIMmtogfEX9bldooFhAyB44Hf+FWg9yGpkT1a2Zrt3qe1QMIg0fQNjFfmOvIqgIdh6v/goZuNnx44Iu+tSW7h3CtfvWzFmVEjyhppSXJAJsqpGouFmf+xvLdq99ylOsYs3Dld2OLHMbIhVB3vHhukqYBtZvjxYCD/Vju7IjUv5zaELvZvxNfrY7qYJs4KIxzhL/8BsvxGwSRdroRqqOnwLIN9LTLxNBygY66lDBTMcFvaKXD/6ORDise7PHx7hXL80q8onsSz3VNh+RFUpneEHzBdb7qfDxUv1ElJDfRD1S0WpYqEwlhgK6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by BL3PR11MB6481.namprd11.prod.outlook.com (2603:10b6:208:3bc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29; Wed, 23 Oct
 2024 02:40:28 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8069.027; Wed, 23 Oct 2024
 02:40:27 +0000
Message-ID: <fb2ad9b5-3b48-4b8b-b0b1-f6758f6ad4cb@windriver.com>
Date: Wed, 23 Oct 2024 10:40:22 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] classes: rootfs-postcommands: set better sane
 time to systemd
To: =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay+rtone@gmail.com>,
        openembedded-core@lists.openembedded.org
References: <20241019021935.2105739-1-gael.portay+rtone@gmail.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <20241019021935.2105739-1-gael.portay+rtone@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCPR01CA0128.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::20) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|BL3PR11MB6481:EE_
X-MS-Office365-Filtering-Correlation-Id: 91887d97-349c-4458-223c-08dcf30c0d8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Rmw0RlJCbGI4eXlIWjV2QnFFV2R0UjFkcCs0NUh3UEs4dFZCTW5LR3o4blFK?=
 =?utf-8?B?ak5rSDFFM096MEZwcEFGSFBmcmNFc0ZGQWUwQmw5WUh0SzVNNElGeVlvemln?=
 =?utf-8?B?bDUxcWh2VGZ3c0tMTzRMMm1ERHE5ME1HTFl1NkJCZ0NCcXBNUVNCRHRGZjMy?=
 =?utf-8?B?TFFONW1CQkdHTklZdG0ydUNoQmVpbGt3allYN1FtOVN6V2VQVXpnM2RUVDd4?=
 =?utf-8?B?b2lCT05KV1NFYVUwb2hqM2tKSEczVFZueC82RGdHYUpnYk5aL0RXMnl4NThn?=
 =?utf-8?B?R3VFZVF3cWloQmtEMTVZUTQzdVdvZE15NTJEYlZmZVJnRGNSRjhzdk4vaUFj?=
 =?utf-8?B?QnBCZUd0anVRUWVCZTR1WEl2TFJyRFFZRU1pM2Vxam1vc284a1NBTGZVZjlv?=
 =?utf-8?B?b3h1TnorMFNabnFzVk9WcFdsbzFMZlJGbEJQbThEQkJHV2UxNmNOT2l3RlR2?=
 =?utf-8?B?U3IvZURST0ZtU1pRa2FIY256YjU1SDZJNW92ODN3QmtLK0FMMk0wTGI4RU5H?=
 =?utf-8?B?cWhvRExRWGdlb2RlUlRZYUNDNzJGMmt0cHVHYktacm96MnRIYVp1aDlodm1B?=
 =?utf-8?B?WE5hRElxSWg2bnZmWFQxYTlObW8rM1FWd1R2M2p3RTJXSE9mci9WTFIrSVFv?=
 =?utf-8?B?dFZuWmFrTWVTNVgzQ3p2UTB1cDdna3B3Si90S3V0SVA2bG5lcjlOSVNOcTMr?=
 =?utf-8?B?WHRNZW9aaHFGcUprYnQ0aW1vU29KdnB0K0RYR3FGd3V2TFZnMS9LVnFUbmJv?=
 =?utf-8?B?dmkzamFINlBpRW5Sb0l1VWUzaC9Vc0huN0w0YWJrdXgvc0hZNkIrRmlGN0tu?=
 =?utf-8?B?dGpBODRHdVVpYU9yK0lKZENXRDA2MmM0R2xUNUF2RHlmZVhGT3U2bUdFK3Zz?=
 =?utf-8?B?MHJ3cFJSNDRnTXI3ekNPeS82UmdDVVZBWDhPd3BUSk9TaForUzVKYVBFR2cx?=
 =?utf-8?B?T0QwVHlPb2UwWDdlSVFkaGRLOXArOTdYSzRORW4vRFlmWlhVaExoSUNEUnRO?=
 =?utf-8?B?VFdxdlVlRTV4cFNSVUtCVnpzalhOUnZMTjFnV3RGT3VqT0lRYWlDTWIrRmEv?=
 =?utf-8?B?aElLei92Y2xWMXJ6U0RzMlJDQ3NNbENBR3d0TUhnUDlISUN2VStFVjgySVlW?=
 =?utf-8?B?c2RUNFhYZFFlN3ZSRnF6SVNranZUSEhwRjNiQVp6b2twNjZQWkR4dUVsMkdS?=
 =?utf-8?B?bW12QlhyU1U0Tm1BWWc2dFVpMDJWUy9leWNhRG5ES1ZrWDNoazYrRDZGaFJV?=
 =?utf-8?B?Z0Z4bHQ2QXZuSER3VnNoWVJyOEFPeU0zeTB0b0JTNWpWRUMxTkw1ZmJZeEFl?=
 =?utf-8?B?bG5kZVNpZGtxakhxYzRIczh4QzNmSHVFRmRxQlBWVUNvdkh1VFFWaUZoeVlL?=
 =?utf-8?B?QmRENHN0djVDN2Y2S0xNeTk0NFhNM25FMVJKL1R1UTJGc05uR3BYSlBwUUox?=
 =?utf-8?B?VEFPcEVnYU1xbFN0L1FGUnNpNWdad2ltVXdpT0pNUTFOWFhSYTZ3TWIwelZi?=
 =?utf-8?B?SWFCUkNTL3dZbG9kc1RhbUh5aVBZWlkyYlFqeFNtOG5lTmg1WlRLNFlRTDhu?=
 =?utf-8?B?UjRCeUZ1K2Jza0t0SXRoa3ZUZkpoRmlhZHZSdXcydU5rMktjUnhHWUxSLzQz?=
 =?utf-8?B?a096SllQSndnK2JkNzVua0YrN3hGTi91Y0dPbWZ6clowZ0NtN1p4T0dNN1Zv?=
 =?utf-8?B?SnhLQ3VwbEg0bjE0TWZBSVBaR3VHR05ER2k2a2pGMStvclE5Mnd3Skp3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(4022899009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aVRMazFiYmRpTStUN2xvMzF2WkhIMEJscWozQjhjODQ2OHhWZklmcVIveHFR?=
 =?utf-8?B?eFFyYXJjK3QvV3kzL1VTN2pMbGZpcUMweXoxOGdmSk5RSHJFQ0NOMk1IUzBV?=
 =?utf-8?B?bjhTTzVCN3M5ZzlVU2dmL01aeWdFNzBVZ3piRE9SRkVLK3E0d3kzRVlHc0p0?=
 =?utf-8?B?MlhuS3pDbmZuRmpXaGJsQ210dm9sdGRIeVZOTXp4cXFmUTZ0aWRRU0FhUmhH?=
 =?utf-8?B?YWVEbTBuS2ZEN0pKYmpXcXdvd2ZldjY1cVJVbHVUbjRHS1grNlNPZ25uMnZw?=
 =?utf-8?B?VmprL1dRVmZ1T0ZjM3YrUkRYREVnSVZ3WEhSNTl6WjlYd3NJcVJpcFlYNUNT?=
 =?utf-8?B?YXFwK1grOHRBeVN1MVRNazZhWjQvRVhlcUFWbzFtakVJQ0ZwQ3RYckpHV1VK?=
 =?utf-8?B?c2MydFR2ZjhHSFJaK2kxVkFyRHhxeUdXYWRqbWpLalhjd1JYTVpXQlM4NURE?=
 =?utf-8?B?Wk5nN0duVDVlSk56NStvay9UWFlISkF6Nnhmc3dmdmhBSlc1Vkw2YjNRWHZs?=
 =?utf-8?B?dHBDVjRVNk5WZ25JWlJDNFliVllhNzRyYTdQSHFhT0ZNQklINUVtSkZrVDc4?=
 =?utf-8?B?SUgycEc0aDl5aGViK01MMWl0L29nRVNOWmE2bmg2WitLc1RVc003Sld3TXZl?=
 =?utf-8?B?ZURrb3M3WEwrSUxBUGRFeVhPNWpiWVdaUUppNElRemFYSTFaZjM2emJMNURa?=
 =?utf-8?B?TlAzZEYyYWFUMkFWRHpjZzRIazllTTcyb01kUTYwT1Qyb3A4eHpjTDRnRGhS?=
 =?utf-8?B?N25kY3dYY0tWbEVKVXN6NmsxRmVrZzh1ci8vbXZjRzZsc21vRWZPVG83RmZv?=
 =?utf-8?B?SkJRVVFNUS8yMG5XQ0pTekJuRTFtN2Y5OUJwRkNjL2tYRkp2eC91UUN1ZHE5?=
 =?utf-8?B?Q21ZdTFXSTFyaWRYUmNncFA0UjhUQzdlWmlmOHVGZmZtLzU0MG1lSzloK3B6?=
 =?utf-8?B?RTk0b1BVUkRCTnRpVVhpZy8xTDVFbzFoeHhGUGhCTzZONEsxaE9VMkRUL3Rr?=
 =?utf-8?B?eHRDRUtBTlU2TE9qU3F3MzM4czIvNGNvSzR1OGtYWXRiM0NZSkdRSmNGUWxX?=
 =?utf-8?B?eWJyUEthN3BIRFAxSFdjZ3YxbDE2RXh3MFZrOXUvTTZzdGJIQ2RJcWc4RnNG?=
 =?utf-8?B?cFhNYStIMmZlbkNCeXFteUk5L3RNZ1d5OGRVYVcrOVp4a2lrK0llQVdtVGFo?=
 =?utf-8?B?N0s2ZWMydXA4aDlOQXM5SDlJMFR3VnZXQkU2K2pBUy9WYXdhNFFUdG8wVmZt?=
 =?utf-8?B?K0lEYWgraG5zSDNLUnpDVU1nSU82eUlsZEVlSGlxY0p6SXIzWC9xMG1yZmxl?=
 =?utf-8?B?WlV5cm9LS3oxSHd0WVBzVjRSYlBodmwzOEE5NEJ1UkZBOG9xSld3N25ISC9s?=
 =?utf-8?B?YmdDTXVZaUlMNm1COHdjUEMrWVlsV01YOFBUOUFUU0Z2L3JZTTFlNzVydzdI?=
 =?utf-8?B?a2t5WnlULy9UcEdnSmlMbERPN3BMVzRuUXQxU1AwY3RYN2w4UzNKVHlueG1P?=
 =?utf-8?B?cElKeUxPeHovUlNNUjJXbk9hbVF1QjYwcFcxZmU0dWNTa3h3L0VEbUVsQ3Rp?=
 =?utf-8?B?RjdrY01mQ2JQOUtJMUFNZitxRmZMV1pmMU5jdi9uNWQ0T2o4R3ArRnZMRkpv?=
 =?utf-8?B?Q3I0bFhlcGlmR0I4VFpuQ211UC9GZ1FQTkFDNkIvUCs4MjNaNG5qRkZGT2x5?=
 =?utf-8?B?V2hSc25jaVBGZVpPSHh4U3JETVpoYWJCQ0VYQWZuWnlUSWcva0tDZTdMSXY0?=
 =?utf-8?B?MUFTdFlQVWtSRHpQeG9mR1M4ejRvWkNBYUtodVcrN3gwRnMrcEZ0REo1YkhW?=
 =?utf-8?B?TUNKRE5lbnJ1RWg3bDJGOGJMOVN5M1JhWDJKTGtydzNXTzdnNWlSdGRMTzFu?=
 =?utf-8?B?ZTYxK2tUZ2dISkN2aHpzM3o2OGp6NDhadzR6MzNzWjNzQ01SdzJMd2JtVU9h?=
 =?utf-8?B?TWdIcnR0QVF1TURjdE51MFJJdVJFcVJuMkNVaVpZRVE4NmVZOE5sTHdZQzFY?=
 =?utf-8?B?cy9XakFLWktSeFIvQWRqV055OUN3K3l2V1BoWXBLYzFySmY0QXZZZjc0bDVI?=
 =?utf-8?B?Wk94Szd3d2t6YXBvcnJuVUZidXA3TGhmdXpkMTV2aXNEZXkrQk5nTHJza3FY?=
 =?utf-8?Q?Kq+Hqj4WfRusVpCKJWtGuj/1z?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91887d97-349c-4458-223c-08dcf30c0d8e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 02:40:27.5334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +vFQawVgZUsmWX8PnzzkAnJeNH3CNZakYsNcOxe9k65b9+OKlBs2czMrd6SPJMYwXW3FspDHsisOa2Zzonsh/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6481
X-Authority-Analysis: v=2.4 cv=b8Tg4cGx c=1 sm=1 tr=0 ts=67186220 cx=c_pps a=wMNeujlvNozESTkKEiiyVQ==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=3Vf896MWROmXlQ-mZrEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: QwIE0T69-W0T8L7acYWFsUyr4dlPzzWA
X-Proofpoint-ORIG-GUID: WfIFGsYeEQT58NwikmhrpjNCwFcYxT66
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-23_02,2024-10-22_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2410230013
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 49N0j65F024265
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 02:40:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206182

The timestamps of all files in rootfs will be changed again by=20
reproducible_final_image_task. To achieve what you what, what you need=20
to do is touching an empty file, $D/usr/lib/clock-epoch, in systemd's=20
do_install task.

And when you create /usr/lib/clock-epoch at rootfs time and changes its=20
mtime to the current time when REPRODUCIBLE_TIMESTAMP_ROOTFS is not set,=20
its mtime will be set again by reproducible_final_image_task to be the=20
commit time of the latest commit. This means the touch action in rootfs=20
time is useless.

Regards,
Qi

On 10/19/24 10:19, Ga=C3=ABl PORTAY wrote:
> When systemd is started, it sets the system clock to epoch to ensure th=
e
> system clock is reasonably initialized if no working RTC.
>
> As init process, systemd sets epoch very early to the more recent
> timestamp of[1]:
>   - the build time of systemd (-Dtime-epoch)
>   - the modification time ("mtime") of /var/lib/systemd/timesync/clock
>     (systemd-timesyncd)
>   - the modification time ("mtime") of /usr/lib/clock-epoch (systemd)
>
> The first epoch timestamp is is hard-coded at build-time by the systemd
> recipe (using either SOURCE_DATE_EPOCH, git-tag, or NEWS modification
> time[2]).
>
> The second epoch timestamp is maintained at run-time if the system runs
> systemd-timesyncd.
>
> This implements the third epoch timestamp at image build-time, from a
> newly introduced rootfs post-process command that is very similar to
> update_timestamp.
>
> It touches the file /usr/lib/clock-epoch with the modification time set
> to either the current timestamp (now) or to a reproducible timestamp if
> REPRODUCIBLE_TIMESTAMP_ROOTFS is set.
>
> Note: That newly introduced rootfs post-process command is automaticall=
y
> set if systemd is set in the distro features.
>
> [1]: https://github.com/systemd/systemd/commit/863098fdc9cd91e4f7600853=
56ac02c4b7ba6df1
> [2]: https://github.com/systemd/systemd/blob/v256/meson.build#L804-L825
>
> Signed-off-by: Ga=C3=ABl PORTAY <gael.portay+rtone@gmail.com>
> ---
> Hello,
>
> With this patch, one can have a better sane default time set by systemd
> very very very early in the boot (i.e. even before systemd outputs its
> version!).
>
> 	# dmesg
> 	(...)
> 	[    3.347641] Run /sbin/init as init process
> 	[    3.350435]   with arguments:
> 	[    3.350440]     /sbin/init
> 	[    3.350443]   with environment:
> 	[    3.350447]     HOME=3D/
> 	[    3.350451]     TERM=3Dlinux
> 	[    3.431275] EXT4-fs (mmcblk2p2): re-mounted. Opts: (null)
> 	[    3.523997] EXT4-fs (mmcblk2p4): recovery complete
> 	[    3.527828] EXT4-fs (mmcblk2p4): mounted filesystem with ordered da=
ta mode. Opts: (null)
> 	[    3.694440] systemd[1]: System time before build time, advancing cl=
ock.
> 	[    3.714755] systemd[1]: systemd 250.5+ running in system mode (+PAM=
 -AUDIT -SELINUX -APPARMOR +IMA -SMACK -SECCOMP -GCRYPT -GNUTLS +OPENSSL =
+ACL +BLKID -CURL -ELFUTILS -FIDO2 -IDN2 -IDN -IPTC +KMOD -LIBCRYPTSETUP =
+LIBFDISK -PCRE2 -PWQUALITY -P11KIT -QRENCODE -BZIP2 -LZ4 -XZ -ZLIB +ZSTD=
 -BPF_FRAMEWORK -XKBCOMMON +UTMP +SYSVINIT default-hierarchy=3Dhybrid)
>
> Thus, one can do time-based related things offline or before the system
> clock is set by the network (if trusting the time does not matter that
> much for sure).
>
> This happens if the system has no hardware clock or if it is way too fa=
r
> in the past and if using an old versions of systemd; systemd v250.5 set=
s
> the system time to April 28, 2022 5:53:22 PM (1651168402).
>
> Also, please set REPRODUCIBLE_TIMESTAMP_ROOTFS to any appropriate value
> if enabling reproducible-builds (the default). Otherwise, bitbake sets
> the timestamp to Friday, March 9, 2018 12:34:56 PM (1520598896).
>
> If you have a better idea on how to implement it, please tell; in the
> meanwhile...
>
> Kind Regards,
> Ga=C3=ABl
>   meta/classes-recipe/rootfs-postcommands.bbclass | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>
> diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/cla=
sses-recipe/rootfs-postcommands.bbclass
> index 5f4d67f93c..cc74c75cfa 100644
> --- a/meta/classes-recipe/rootfs-postcommands.bbclass
> +++ b/meta/classes-recipe/rootfs-postcommands.bbclass
> @@ -22,6 +22,9 @@ ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains=
_any("IMAGE_FEATURES", [ 'deb
>   # Create /etc/timestamp during image construction to give a reasonabl=
y sane default time setting
>   ROOTFS_POSTPROCESS_COMMAND +=3D "rootfs_update_timestamp "
>  =20
> +# Create /usr/lib/clock-epoch during image construction to give a reas=
onably sane default time setting to systemd
> +ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains("DISTRO_FEATURES=
", "systemd", "rootfs_systemd_timestamp ", "", d)}'
> +
>   # Tweak files in /etc if read-only-rootfs is enabled
>   ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains("IMAGE_FEATURES=
", "read-only-rootfs", "read_only_rootfs_hook ", "",d)}'
>  =20
> @@ -402,6 +405,19 @@ rootfs_update_timestamp () {
>   	bbnote "rootfs_update_timestamp: set /etc/timestamp to $sformatted"
>   }
>  =20
> +# Can be used to create /usr/lib/clock-epoch during image construction=
 to give a reasonably
> +# sane default time setting
> +rootfs_systemd_timestamp () {
> +	if [ "${REPRODUCIBLE_TIMESTAMP_ROOTFS}" !=3D "" ]; then
> +		# Convert UTC into %4Y%2m%2d%2H%2M.%2S
> +		sformatted=3D`date -u -d @${REPRODUCIBLE_TIMESTAMP_ROOTFS} +%4Y%2m%2=
d%2H%2M.%2S`
> +	else
> +		sformatted=3D`date -u +%4Y%2m%2d%2H%2M.%2S`
> +	fi
> +	touch -m -t "$sformatted" ${IMAGE_ROOTFS}/usr/lib/clock-epoch
> +	bbnote "rootfs_systemd_timestamp: set /usr/lib/clock-epoch mtime to $=
sformatted"
> +}
> +
>   # Prevent X from being started
>   rootfs_no_x_startup () {
>   	if [ -f ${IMAGE_ROOTFS}/etc/init.d/xserver-nodm ]; then
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206078): https://lists.openembedded.org/g/openembed=
ded-core/message/206078
> Mute This Topic: https://lists.openembedded.org/mt/109095282/7304865
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
Qi.Chen@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


