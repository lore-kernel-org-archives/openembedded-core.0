Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49925C19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 10:40:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.8227.1741344005264804770
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Mar 2025 02:40:05 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=516141550b=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5275fHXf028452
	for <openembedded-core@lists.openembedded.org>; Fri, 7 Mar 2025 02:40:04 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 456csa35b2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 02:40:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xLLHuxIG+Av+AL1dJ/3Gj7ZMA+RyD+AJIhml+VX8B9xfNqz0SyY08Ey8VqFa3bao7M95l8mWcKR7k5oLMalPKuvPk6cFM+W1GjMxUg953Ky5RIjtUQcUiejUCkOQHyXnNjPajtkT/wRS7/Y/YMd0xmkNAKIrBUW8jYpN+9T7/kjKEgFdPcUGrnvBY/63pWox5XyFTokwHoSUwYwDB6+gBOJRY0+WLQ0iCIU42Xjb9xs1s9LTTijBOs6ypu3eTwSNB44BVmCY07vhud8nleWWMz5qLKOUcS4szP9dSe7AamX3iikEBuOtvhCewUXJiYMmvDTdXwBoS8AVugKOK2XSvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=75sq6CFv2Mke6mgojVwQLakeWc9+iyGbMi5wYpNxSXc=;
 b=x72FcuEiGKxWTODBAGA5E7ORUBZJjPHJc5Wca8KsGXF9DGrKe8BBvDsNN1BXrFdkvtCLJxsvKCm06QIXgvwUYNmELx0+10q8+gU4KIoUzhhG1p/uFgMlrnORoslqSFpD+C/Zad9lhu2IBHJVP2zSb5S7TG255nXnAgQOBtT6IeIVobWAC5jqKLD94tOVUqUHSlESJI3FLQ6uoXlwRU8c9DIzqyjVM38872Uv0ZjV1wuH4ph6k3l653HBps3AwJiyuPLb2EEboOkWyJh8Jd7A1v6XPRyNlhda9WcWwD8/1aqvpzzK1WUnKl3mLBUV3JB1IdU/hUVIPEnlw5rEQyxdLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by BL4PR11MB8797.namprd11.prod.outlook.com (2603:10b6:208:5a7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Fri, 7 Mar
 2025 10:40:00 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%5]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 10:40:00 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?q?=5BOE-core=5D=5Bkirkstone=5D=5BPATCH=C2=A0=5D=20libtasn1=3A=20fix=20CVE-2024-12133?=
Date: Fri,  7 Mar 2025 18:39:49 +0800
Message-ID: <20250307103950.3859258-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0084.namprd03.prod.outlook.com
 (2603:10b6:a03:331::29) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|BL4PR11MB8797:EE_
X-MS-Office365-Filtering-Correlation-Id: dcbd41c3-f89e-4627-a9a7-08dd5d646967
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|10070799003|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?b2RDOHM3cTJEbUNLSGdJVUxaK0lHVklwK3d5anZSMWVkSUkvRHAvY0FpemR1?=
 =?utf-8?B?aCtqOFpwQnM0OHg1SFJSYm9WRnpsQUd3STRINkxCcy9IUmoyTVNkSlcrTklp?=
 =?utf-8?B?UWllZ0F3V1gzdzQvR0xiemc0Q0hVQzJNNlVub25UMkxrd0lSUTNib0FuZk5Q?=
 =?utf-8?B?QnlNUitsUkRTTG1pVkg5czk1d1U2dlRySk5vYnJiY29Gb040YUgwN1VTMG5m?=
 =?utf-8?B?WldCV09NYW1xaEQ5KzVOelZYRHRwQzRlRXVaVG5pQlhYU2ZQZkg5bjdOS0Y0?=
 =?utf-8?B?R0RROTJGcVRxMVBqbFR0anJZQ2Jidm1HbnR2RyttdVRUSkxnTDRSMEllS2NP?=
 =?utf-8?B?OFJQMTJwd0lFVmpRWEVBK3d5Yyt3eGJxcjl2bXgvNnplTTR4OHZIdEhRTWx2?=
 =?utf-8?B?ZUt1NFdsRDBPdGlNRlpscUFPcmlSbUVEQjRtdVM4ZlFLZTRQcHJmblpCaXRt?=
 =?utf-8?B?d3M3NVBKcUN0Yi95SFBhaTN0VjBDT25ERkhUNlM5bVoyRTZnQnBqUVU0bVJH?=
 =?utf-8?B?bW9icGdyMEYxUDlHT0hEOC9Fekd2Rk5SNEp3S0xSYlo0d1N4TjVKTE5RRUlU?=
 =?utf-8?B?WkcrZ0hSTk92UVNwTGg4QlI3TFBjQk5TMVdkMWhyVHhYS3pPK0NnYVV3Mm1o?=
 =?utf-8?B?bU9xY2hhUGdxYWRuQysrRjBaRkkyQVg1WE5uamhFZTgzaTZSQmYxTXE3dDA5?=
 =?utf-8?B?Z1VyRU1yeDZJeTBhTTFJRlFGeXhzTWdFNTZKODZoRmtxSDYySjVYbzRDVlRN?=
 =?utf-8?B?ZklvaVhMNUxESURObjVRQUpVamtzSjFiTGFmMlV5MjZqZWw1aHNwRlh5RHdP?=
 =?utf-8?B?UHBMUWtkUGdtZzBRcFNsZEZkQ1dlRFVySDRUcFVvSXhWRkNUWjkwemp6QXJK?=
 =?utf-8?B?RnQ3SWxMUkdTZmdJbTh4WW5jemhhRzFKWU0yWlF6YjN4RUJvYk9TV1EyYUxr?=
 =?utf-8?B?b2p3SGR2OUxLNldCYU8vRmt5dlcvdkxyQitlKzVvcXVGaXJIN09jUXNOeUxF?=
 =?utf-8?B?UEI0S21nNmJTN3lseFoxc0kvNGZNTE5FNnB3aFFsdWNlc0g5Z1dBMFkzcGRi?=
 =?utf-8?B?cG5oSmlDZmdwUklPd3RlZG9wRlR3czFYZ25nL0pwRDZ3WFZvS200RU10UDNo?=
 =?utf-8?B?RklhU254bE9SNHh5UnRuaVArdGk5YWxBbFVJcnVKQ2hrMUc1a1p5VXNLcEZw?=
 =?utf-8?B?ZmQzWW5SaXVaZGJNN20wVjJDdXV1YS82ODlFeENPRXU1RElsZHZnbHhRR3o1?=
 =?utf-8?B?RzJLUlNKd2lKU1g3SE1GazRzZ2s2SzFHTDNrSlQ4bjFSL0ZheVdFRXhuaHM2?=
 =?utf-8?B?a3ZRdHdGMGVmUGdXVGxxRE55d2pUSnJmOFBraW1vRGdTcGFrbTJFdlNHWk5G?=
 =?utf-8?B?NDFZVDA5Rk95MjlrL0hGbERrME52YllnRENUN3cvRnEzeDg1MWhyZmlWOWRN?=
 =?utf-8?B?REhybHUzUXpiL0hMS2xKaXBreWU3K3FXYmUyREtYOWdnOVhWRzZ6WU1OWjBr?=
 =?utf-8?B?Y1AxcEtzZWV5NVRlWWNOTC9xN1hLZVR0RWw1NDVocDA0WXRyN3VPeGdMRm5J?=
 =?utf-8?B?a1VNZHQ1U3pGa1VQNTkvaTlPZlUyekx3bXRHL0I0QkZINjhqMDNvRko3emlw?=
 =?utf-8?B?bGZOWGZXQ1hMUitKRDB0bW9lYjZOY2NOeXAyaDVxMjFkZThoK0dCTmIzZjhm?=
 =?utf-8?B?blpoeEJnVzVFcGh2eXc2T01kVFRJUEFkVEtyanAyY252aVo2U2FYUlgwcjVy?=
 =?utf-8?B?VytmRU5jemUvNkNJbkRIWXZMc2tmSlNHeTZZMnZrSFRkckI2VjJ1MzR1T0R0?=
 =?utf-8?B?UzE3OWhsT29scDA3QkJ0Y0h5RW5GRjYrZWtGbkxqU2N6cEVQQWZNNnpGeXMv?=
 =?utf-8?B?REVwL2NjbEFiS281MzVKcFB2R1V5dUhxcUc0dG52UHJlVFE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(10070799003)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZVcvNTFvS2I5U2hoRWJvcmx5aDVjek5WZS9Sa25PWFF5cWRGRFVOSmNXbXgr?=
 =?utf-8?B?RmZPcHVhYUxIenNhMlNtWkdNSWJ6NzFnRTJpNmFKb2ptMFNUMlhpSFpPaWY5?=
 =?utf-8?B?dC9oRTBIa3o2VWxMRlQzdENaL3VJL3Z6VWNhM3hlYjJBY2Ftc01sKzN5SEVi?=
 =?utf-8?B?SFJmOU01d3lXVTR4NEpadVpQK3RaVWFSM2FXTmY4bllraGwxVGZTTVFCWS9i?=
 =?utf-8?B?cXdROHR4ZDBlMHBsNkMwTG5SS29vUHVta0NYejRKRVI4Tm9HczVoVm9LcVpZ?=
 =?utf-8?B?Z1pXdnBhNGJJNjVBMXE1N1F2ck1JclJ0OGxuQnlrSWY4dHRRNVAvaUlRRHo5?=
 =?utf-8?B?dk5RZVlSUnVJQTQxVVNUajk4T1RQejNQSmdpTHp0T2RvamZkZWF6WC8ydHFr?=
 =?utf-8?B?NUVFS1VlOXdmVUVWL2tIR3dxa09ORTdzRjZtTmJZTFoyZjgrUGdYdTk4dUdz?=
 =?utf-8?B?U2xCSjg1NWVWMXdUK1ZaVUxPaW1sNTRUNEpXNkd3eTdYOWxwVENXUVFlTnZZ?=
 =?utf-8?B?SHVGNUZ0NnRtWlVxaENOOCsyUy91aVVnOTVENWNoMVExUU1yc2V3OVBiR0hh?=
 =?utf-8?B?NG1RYjFrUXRQaUFvbnB0am82U0VFeEgxa2cwSGQreFFIcmVxYlY1Zldrc1NJ?=
 =?utf-8?B?QkwwZXdIUStkYlkxemM4blBTRWtQMEVkSEFwTmQwak9hRHFpc2pOcW10VjdX?=
 =?utf-8?B?OTJCWWNmV0x2U1NFZjRhRThsL2ZMNzRjWUowL0dicVZFZzlDY0dES2UxRVFz?=
 =?utf-8?B?WkpwRndxMTNpYTR3SHZVbHYxeFRacE9TVnZxYUtoQmlNQXRyTzBseGU5NHpp?=
 =?utf-8?B?N2s3eC93SWJ5ODhzSVB6SUMwZUhyTERVK2dWbFNGNS9td2xmcUc1S3BPS01D?=
 =?utf-8?B?cGd6YjZveFM5aG1xOHk5ckhHeEt0Tkw2bW4weXRmdjRFY1U1ZXpOUHdKY3dC?=
 =?utf-8?B?cmlWamMzMlI2YVhOY2MxUEg2Z2Z5MEV4UldOYWl4SFBJbXhUOUZTMHNYK0lx?=
 =?utf-8?B?Uy81M2EyZlZsT0ZOTXVZNXdDczJRemxCZXAvMXRDVzhjWmxtZzFIOFlXNkFL?=
 =?utf-8?B?bjRuVVpSZU1VSTNvQzJXamNFekVnVUg0MTI0Y0ZNSDYzUmIva0c0RFdQWU1F?=
 =?utf-8?B?ZXV1VG5UUytZUzdpb04xUzRHVEFhSExEL1FHNmVyL2lESnBWVStmZDdBSnlM?=
 =?utf-8?B?WEd0U01TWGNhOXArV256NlV3eXpXa04xcjZaRVFiZVl2aUpkL0Q4VG4rVm9x?=
 =?utf-8?B?SGJ0RDFCSTM1YUlZTXE5b3pxUDZPazc5UDRsNm96dWVkNlpQa3piRENWcTBE?=
 =?utf-8?B?cUVteHpHM096SjU4cGRVdEU0WklyVzFJOWVrZmlmSTV1OU1UTW04bW5XQ1Qy?=
 =?utf-8?B?NS9DeEZGemhoUE9yVHZQVWtzWGxGejArcXNPWmRZUU1nM2FTemh4cVJ1MXRa?=
 =?utf-8?B?TkM5UjkrNXpHME4rT2NzR21lT05Yb21OZk9qVjhlU1VFSklGZ1ZKOStKd3lL?=
 =?utf-8?B?TzdlYU43YlRvNFN1UUNkdndBREJIakFxSkxzcDk3SWxlcjhhK0puU0pqc3F0?=
 =?utf-8?B?QURWbEI4aGxFWjVnZmFVdkt4Q0tRR1pZZjUwdnUzeUUvdDFnSGx1SEVpZUMv?=
 =?utf-8?B?TC9MVXJ4OUdFdE1SQWNCYnlvdmpoNmxrL0J3K2hLNExYSG53b2VOdGlXbkJH?=
 =?utf-8?B?UTcrd09WQzIwaGg4UlVSUk1qR1BWLzFqUThNRVFKTjg3YzNWZVNFWllvZEdH?=
 =?utf-8?B?L0NOUnpTeUlDTnNNNHRQcG1MNVRJaFE4R08xV2JXbXVUdzJSeFViMXk2cHhC?=
 =?utf-8?B?bS9hUDRkY3lmZFdncDJtK1A5MjhuQjBsQm5Hb3l5NkZFYlh6cGxVVGc2U3Nq?=
 =?utf-8?B?blZFK3VoV2xsdndGQmtBbUtoMHQ0QVJFOUs3V3dpTWhnbm85b1pGcFNTNmNC?=
 =?utf-8?B?eVUzMGxycHplMVJpNDc3MFphOHlrUXlvUnRnZmd0bE5mdElmVU5taS9NVG9B?=
 =?utf-8?B?Zm12Ykw4aUpxRWRHQm1Bcm90ais2Uk1PSDRCYTJqM3dpMmcxVkE1V0VKRTBi?=
 =?utf-8?B?MnV5UW9zUkRuUDBiZW5TL2tLelFiU3M0aldiSkc0U3pwMi9UakZCc0s5M2Iv?=
 =?utf-8?B?a1NKdzBGbzdIK0hnMktEOC85Q1IyblpYM1h1WEs0ZGN2K0dFQ2VVdFhpTndx?=
 =?utf-8?B?bS9jWmUrV0VsVGZjNFlMRzFsOTNTTFhodnBmaEtBc1BPZXNncVZqS2tycFdL?=
 =?utf-8?Q?VUds6yC2lmoTVdQ0zIl8tlof4kvn8rpr0juCh9x6Rc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcbd41c3-f89e-4627-a9a7-08dd5d646967
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 10:40:00.6839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yfT3QW7hS8Dn2OjPB6nrrT8XHpuPN9dIDuaS/ffpEKs26uYRoDqy9qn+r613HT2JfbFWEV7Yc7xSZw8JFjsddQGM/xGnYTeVmH4N7ZjX0cE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8797
X-Proofpoint-ORIG-GUID: 4wg0OSX6CunHSFhLih7TqYpECBDa8n5h
X-Proofpoint-GUID: 4wg0OSX6CunHSFhLih7TqYpECBDa8n5h
X-Authority-Analysis: v=2.4 cv=d4wPyQjE c=1 sm=1 tr=0 ts=67cacd04 cx=c_pps a=2bhcDDF4uZIgm5IDeBgkqw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=5KLPUuaC_9wA:10 a=PYnjg3YJAAAA:8 a=p0WdMEafAAAA:8 a=t7CeM3EgAAAA:8 a=mDV3o1hIAAAA:8 a=H2kMXXDjAAAA:8 a=24xW3R4Yw-gLoYaI9NAA:9 a=QEXdDO2ut3YA:10 a=h0CFQEqI0dcA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=UQGQp_6C1EM-8DAw1ZOj:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-07_04,2025-03-06_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 impostorscore=0 mlxscore=0 mlxlogscore=493 clxscore=1015
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503070076
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 10:40:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212428

From: Zhang Peng <peng.zhang1.cn@windriver.com>

CVE-2024-12133:
A flaw in libtasn1 causes inefficient handling of specific certificate data.
When processing a large number of elements in a certificate, libtasn1 takes
much longer than expected, which can slow down or even crash the system.
This flaw allows an attacker to send a specially crafted certificate,
causing a denial of service attack.

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2024-12133]

Upstream patches:
[https://gitlab.com/gnutls/libtasn1/-/commit/4082ca2220b5ba910b546afddf7780fc4a51f75a]
[https://gitlab.com/gnutls/libtasn1/-/commit/869a97aa259dffa2620dabcad84e1c22545ffc3d]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../gnutls/libtasn1/CVE-2024-12133-0001.patch |  43 ++++
 .../gnutls/libtasn1/CVE-2024-12133-0002.patch | 235 ++++++++++++++++++
 .../recipes-support/gnutls/libtasn1_4.19.0.bb |   2 +
 3 files changed, 280 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0001.patch
 create mode 100644 meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0002.patch

diff --git a/meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0001.patch b/meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0001.patch
new file mode 100644
index 0000000000..d843b6dc92
--- /dev/null
+++ b/meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0001.patch
@@ -0,0 +1,43 @@
+From 4082ca2220b5ba910b546afddf7780fc4a51f75a Mon Sep 17 00:00:00 2001
+From: Daiki Ueno <ueno@gnu.org>
+Date: Sat, 19 Oct 2024 02:47:04 +0900
+Subject: [PATCH] asn1_der_decoding2: optimize _asn1_find_up call with node
+ cache
+
+If we are parsing a sequence or set and the current node is a direct
+child of it, there is no need to traverse the list back to the
+leftmost one as we have a node cache.
+
+Signed-off-by: Daiki Ueno <ueno@gnu.org>
+Signed-off-by: Simon Josefsson <simon@josefsson.org>
+
+CVE: CVE-2024-12133
+Upstream-Status: Backport [https://gitlab.com/gnutls/libtasn1/-/commit/4082ca2220b5ba910b546afddf7780fc4a51f75a]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ lib/decoding.c | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/lib/decoding.c b/lib/decoding.c
+index d2f6dea..1e0fcb3 100644
+--- a/lib/decoding.c
++++ b/lib/decoding.c
+@@ -1570,7 +1570,14 @@ asn1_der_decoding2 (asn1_node *element, const void *ider, int *max_ider_len,
+ 	    move = UP;
+ 	}
+       if (move == UP)
+-	p = _asn1_find_up (p);
++	{
++	  /* If we are parsing a sequence or set and p is a direct
++	     child of it, no need to traverse the list back to the leftmost node. */
++	  if (tcache.tail == p)
++	    p = tcache.head;
++	  else
++	    p = _asn1_find_up (p);
++	}
+     }
+ 
+   _asn1_delete_not_used (*element);
+-- 
+GitLab
diff --git a/meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0002.patch b/meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0002.patch
new file mode 100644
index 0000000000..a3a6af2920
--- /dev/null
+++ b/meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0002.patch
@@ -0,0 +1,235 @@
+From 869a97aa259dffa2620dabcad84e1c22545ffc3d Mon Sep 17 00:00:00 2001
+From: Daiki Ueno <ueno@gnu.org>
+Date: Fri, 8 Nov 2024 16:05:32 +0900
+Subject: [PATCH] asn1_find_node: optimize "?NUMBER" node lookup with indexing
+
+To avoid linear search of named nodes, this adds a array of child
+nodes to their parent nodes as a cache.
+
+Signed-off-by: Daiki Ueno <ueno@gnu.org>
+Signed-off-by: Simon Josefsson <simon@josefsson.org>
+
+CVE: CVE-2024-12133
+Upstream-Status: Backport [https://gitlab.com/gnutls/libtasn1/-/commit/869a97aa259dffa2620dabcad84e1c22545ffc3d]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ lib/element.c    | 56 ++++++++++++++++++++++++++++++++++++++++++------
+ lib/element.h    | 10 +++++++++
+ lib/int.h        |  8 +++++++
+ lib/parser_aux.c | 10 +++++++++
+ lib/structure.c  | 13 +++++++++++
+ 5 files changed, 90 insertions(+), 7 deletions(-)
+
+diff --git a/lib/element.c b/lib/element.c
+index 850bef4a..528df418 100644
+--- a/lib/element.c
++++ b/lib/element.c
+@@ -33,6 +33,8 @@
+ #include "structure.h"
+ #include "c-ctype.h"
+ #include "element.h"
++#include <limits.h>
++#include "intprops.h"
+ 
+ void
+ _asn1_hierarchical_name (asn1_node_const node, char *name, int name_size)
+@@ -129,6 +131,41 @@ _asn1_convert_integer (const unsigned char *value, unsigned char *value_out,
+   return ASN1_SUCCESS;
+ }
+ 
++int
++_asn1_node_array_set (struct asn1_node_array_st *array, size_t position,
++		      asn1_node node)
++{
++  if (position >= array->size)
++    {
++      size_t new_size = position, i;
++      asn1_node *new_nodes;
++
++      if (INT_MULTIPLY_OVERFLOW (new_size, 2))
++	return ASN1_GENERIC_ERROR;
++      new_size *= 2;
++
++      if (INT_ADD_OVERFLOW (new_size, 1))
++	return ASN1_GENERIC_ERROR;
++      new_size += 1;
++
++      if (INT_MULTIPLY_OVERFLOW (new_size, sizeof (*new_nodes)))
++	return ASN1_GENERIC_ERROR;
++
++      new_nodes = realloc (array->nodes, new_size * sizeof (*new_nodes));
++      if (!new_nodes)
++	return ASN1_MEM_ALLOC_ERROR;
++
++      for (i = array->size; i < new_size; i++)
++	new_nodes[i] = NULL;
++
++      array->nodes = new_nodes;
++      array->size = new_size;
++    }
++
++  array->nodes[position] = node;
++  return ASN1_SUCCESS;
++}
++
+ /* Appends a new element into the sequence (or set) defined by this
+  * node. The new element will have a name of '?number', where number
+  * is a monotonically increased serial number.
+@@ -145,6 +182,7 @@ _asn1_append_sequence_set (asn1_node node, struct node_tail_cache_st *pcache)
+   asn1_node p, p2;
+   char temp[LTOSTR_MAX_SIZE + 1];
+   long n;
++  int result;
+ 
+   if (!node || !(node->down))
+     return ASN1_GENERIC_ERROR;
+@@ -177,17 +215,21 @@ _asn1_append_sequence_set (asn1_node node, struct node_tail_cache_st *pcache)
+       pcache->tail = p2;
+     }
+ 
+-  if (p->name[0] == 0)
+-    _asn1_str_cpy (temp, sizeof (temp), "?1");
+-  else
++  n = 0;
++  if (p->name[0] != 0)
+     {
+-      n = strtol (p->name + 1, NULL, 0);
+-      n++;
+-      temp[0] = '?';
+-      _asn1_ltostr (n, temp + 1);
++      n = strtol (p->name + 1, NULL, 10);
++      if (n <= 0 || n >= LONG_MAX - 1)
++	return ASN1_GENERIC_ERROR;
+     }
++  temp[0] = '?';
++  _asn1_ltostr (n + 1, temp + 1);
+   _asn1_set_name (p2, temp);
+   /*  p2->type |= CONST_OPTION; */
++  result = _asn1_node_array_set (&node->numbered_children, n, p2);
++  if (result != ASN1_SUCCESS)
++    return result;
++  p2->parent = node;
+ 
+   return ASN1_SUCCESS;
+ }
+diff --git a/lib/element.h b/lib/element.h
+index 732054e9..b84e3a27 100644
+--- a/lib/element.h
++++ b/lib/element.h
+@@ -38,4 +38,14 @@ int _asn1_convert_integer (const unsigned char *value,
+ void _asn1_hierarchical_name (asn1_node_const node, char *name,
+ 			      int name_size);
+ 
++static inline asn1_node_const
++_asn1_node_array_get (const struct asn1_node_array_st *array, size_t position)
++{
++  return position < array->size ? array->nodes[position] : NULL;
++}
++
++int
++_asn1_node_array_set (struct asn1_node_array_st *array, size_t position,
++		      asn1_node node);
++
+ #endif
+diff --git a/lib/int.h b/lib/int.h
+index 4f2d98d1..41b12b0b 100644
+--- a/lib/int.h
++++ b/lib/int.h
+@@ -31,6 +31,12 @@
+ 
+ # define ASN1_SMALL_VALUE_SIZE 16
+ 
++struct asn1_node_array_st
++{
++  asn1_node *nodes;
++  size_t size;
++};
++
+ /* This structure is also in libtasn1.h, but then contains less
+    fields.  You cannot make any modifications to these first fields
+    without breaking ABI.  */
+@@ -47,6 +53,8 @@ struct asn1_node_st
+   asn1_node left;		/* Pointer to the next list element */
+   /* private fields: */
+   unsigned char small_value[ASN1_SMALL_VALUE_SIZE];	/* For small values */
++  asn1_node parent;		/* Pointer to the parent node */
++  struct asn1_node_array_st numbered_children; /* Array of unnamed child nodes for caching */
+ 
+   /* values used during decoding/coding */
+   int tmp_ival;
+diff --git a/lib/parser_aux.c b/lib/parser_aux.c
+index 415905a0..4281cc97 100644
+--- a/lib/parser_aux.c
++++ b/lib/parser_aux.c
+@@ -126,6 +126,7 @@ asn1_find_node (asn1_node_const pointer, const char *name)
+   const char *n_start;
+   unsigned int nsize;
+   unsigned int nhash;
++  const struct asn1_node_array_st *numbered_children;
+ 
+   if (pointer == NULL)
+     return NULL;
+@@ -209,6 +210,7 @@ asn1_find_node (asn1_node_const pointer, const char *name)
+       if (p->down == NULL)
+ 	return NULL;
+ 
++      numbered_children = &p->numbered_children;
+       p = p->down;
+       if (p == NULL)
+ 	return NULL;
+@@ -222,6 +224,12 @@ asn1_find_node (asn1_node_const pointer, const char *name)
+ 	}
+       else
+ 	{			/* no "?LAST" */
++	  if (n[0] == '?' && c_isdigit (n[1]))
++	    {
++	      long position = strtol (n + 1, NULL, 10);
++	      if (position > 0 && position < LONG_MAX)
++		p = _asn1_node_array_get (numbered_children, position - 1);
++	    }
+ 	  while (p)
+ 	    {
+ 	      if (p->name_hash == nhash && !strcmp (p->name, n))
+@@ -509,6 +517,8 @@ _asn1_remove_node (asn1_node node, unsigned int flags)
+       if (node->value != node->small_value)
+ 	free (node->value);
+     }
++
++  free (node->numbered_children.nodes);
+   free (node);
+ }
+ 
+diff --git a/lib/structure.c b/lib/structure.c
+index 9c95b9e2..32692ad2 100644
+--- a/lib/structure.c
++++ b/lib/structure.c
+@@ -31,6 +31,9 @@
+ #include <structure.h>
+ #include "parser_aux.h"
+ #include <gstr.h>
++#include "c-ctype.h"
++#include "element.h"
++#include <limits.h>
+ 
+ 
+ extern char _asn1_identifierMissing[];
+@@ -391,6 +394,16 @@ asn1_delete_element (asn1_node structure, const char *element_name)
+   if (source_node == NULL)
+     return ASN1_ELEMENT_NOT_FOUND;
+ 
++  if (source_node->parent
++      && source_node->name[0] == '?'
++      && c_isdigit (source_node->name[1]))
++    {
++      long position = strtol (source_node->name + 1, NULL, 10);
++      if (position > 0 && position < LONG_MAX)
++	_asn1_node_array_set (&source_node->parent->numbered_children,
++			      position - 1, NULL);
++    }
++
+   p2 = source_node->right;
+   p3 = _asn1_find_left (source_node);
+   if (!p3)
+-- 
+GitLab
diff --git a/meta/recipes-support/gnutls/libtasn1_4.19.0.bb b/meta/recipes-support/gnutls/libtasn1_4.19.0.bb
index 5fb8b54c06..d5bc1e408e 100644
--- a/meta/recipes-support/gnutls/libtasn1_4.19.0.bb
+++ b/meta/recipes-support/gnutls/libtasn1_4.19.0.bb
@@ -12,6 +12,8 @@ LIC_FILES_CHKSUM = "file://doc/COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 
 SRC_URI = "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
            file://dont-depend-on-help2man.patch \
+           file://CVE-2024-12133-0001.patch \
+           file://CVE-2024-12133-0002.patch \
            "
 
 DEPENDS = "bison-native"
-- 
2.43.0


