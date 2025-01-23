Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67686C02182
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 10:31:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7906.1737628282939159625
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jan 2025 02:31:23 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=31183a5049=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50N63SBj009556
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 10:31:22 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44aqfw1k9n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 10:31:21 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s+xIXH8J94eKyvNDUr+5dfY0dNpC/HVgKiNZIZBvcVNTFt7akjnnecRO4EWFYcZPUyzxbN7UaqPWax33WPGQJ4sGFO+vVvcRZX7Yh3GaLhZuGRumMr+1EU96UBs3+UUO5tnzI1y+7bej0khVE9Pgvl+b0ndzvFo99rk7g+QDzhYvJBFiRWZIv0gbUiXW289h2TTXX/35cEbxTf92r7uCjL0csUaQAM1P3LS8ADJkWgib9cuNn6bNaiVPu0bC/xFV9NvyCHP+eF8A5h6EnJbKQ4b2tO+WFjWYkjKLkkj1QQI/m92M2tP4+yFjAdXov9Xy6TT57haee67xzRlfrWWG8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aeg2G7M57T7y217AXZhyUEKAwQgfLEwDm5XuqDraEAY=;
 b=ZHIm0D77tQslyKqvzgRTxVZVwpgKhiHzh4QeDtrdiuJPQUpDVJM9ZCnGUM71xp9Jh+Q7Gaxad0D5Edhz2n4Roh/d/dYXkcIDeMj6XF9ojWDsL5/8kFguw0IzfmON9MgQKgClSZ85ocmwlzdONhp4tGQKdMWYbln5IszJw9qEXV3tAZQPLwRCfSO/VoSOx/QiOiC93htx6wynrBw3SL4AxxIgje+QLaP0zwKGycYZwtaDU0xKuornEYU5rv3LcP1e8rlJ07fa0X57psC+SBLN8Xt1rPYL0nJS6BdNyBsAPqhLdM0Jv31xGENWrX23NscV3cwc7DDvQNH8ovpxRTARcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ2PR11MB7599.namprd11.prod.outlook.com (2603:10b6:a03:4c6::7)
 by PH0PR11MB4871.namprd11.prod.outlook.com (2603:10b6:510:30::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Thu, 23 Jan
 2025 10:31:19 +0000
Received: from SJ2PR11MB7599.namprd11.prod.outlook.com
 ([fe80::8345:1cb3:a109:be24]) by SJ2PR11MB7599.namprd11.prod.outlook.com
 ([fe80::8345:1cb3:a109:be24%5]) with mapi id 15.20.8356.020; Thu, 23 Jan 2025
 10:31:19 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        Yash.Shinde@windriver.com
Subject: [PATCH] gdb: Upgrade 15.2 -> 16.1
Date: Thu, 23 Jan 2025 02:31:00 -0800
Message-ID: <20250123103104.1885498-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: BYAPR02CA0048.namprd02.prod.outlook.com
 (2603:10b6:a03:54::25) To SJ2PR11MB7599.namprd11.prod.outlook.com
 (2603:10b6:a03:4c6::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7599:EE_|PH0PR11MB4871:EE_
X-MS-Office365-Filtering-Correlation-Id: 10f7cf53-6a75-48d4-b6c4-08dd3b9912d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?d0o2a1p6RldJYkcrMGlDbkhQSnUxMUpNRFpZUkxhdmR5UjRjMHR0Tk1KWG43?=
 =?utf-8?B?TDBydjNnS0NpVDRVWkhVM3BWbndZZUt6dW5LWUtFajVhMExacncvdWkzQzR1?=
 =?utf-8?B?SjBzTUtBQVBmT2hJT2xJRjVCbFdDRS9oV2dNQXY2M1AvOUVlUW05OGFNNnJ0?=
 =?utf-8?B?WG90clJaZkNkQ0Rna2p5OHJGZkpNQWl5NzFydThzRVVVOHc3ZTJpRHJiUXZh?=
 =?utf-8?B?eVNRaEtQbEdVSFp0Q05Nc080c3pLOWw3bmhRcEo0QWxKdGtnV29PLzFjelVS?=
 =?utf-8?B?d1hCMW5VeGpvU0tSRmplVVk2L284ZU1iTGxJTXJjb2hxL3U2eURFZTBrdm9J?=
 =?utf-8?B?THJtZjNhWit6TUgrYld0NVlFaVFVMkttMmxra0IrMDhPM3dMaCt4ai9nL0l4?=
 =?utf-8?B?MXNQRDV5OThLNHp4WUVTbUEzcG1wOEVEaUwxaGVrZVArSEZTWmJGak5mUExs?=
 =?utf-8?B?Um9jV095dU9scUpiT0VlZFNnRGVDZ1ZYWGlvbW1KTEpsNWlxWURhelZLc095?=
 =?utf-8?B?bGlvWjQyRkhvZVVvUGZBSjFmT0tEaWNFWWtaVmJXTFpzbmFXZzMrYmFrbGl0?=
 =?utf-8?B?Qng5T3R4RDVFWnlqNGJYRnNHa0dwalBoN3hEZkpvd3BFeEpJWlBGa0Q2amFq?=
 =?utf-8?B?Wlo1NVZNakZPR2puQkNRM1BZSks0QWpjT0ViTFViaHBScVJ2QnFsc3ZZaXlN?=
 =?utf-8?B?cGlZa1pYSnE1Zmd1Tk5GNlFrVDR4WldkdUZ6ODF2ZWo5WTllMVU3enhuZXVo?=
 =?utf-8?B?UVd4UFRQa2FMNFZ2dWszbGVhOERoelZzK0F2U2oyVVhSZVI3SStneXRoSEN1?=
 =?utf-8?B?QVR6R2htQlladDNEOTZ6SEtUaVpBUXpnejl6WUtEOEhUNmdvRWs2SU05UDFn?=
 =?utf-8?B?Q2dpbHM3MzgxdWZsRVg2SHdNZWcxeFdyTkQxNFN1ZXZoRHl6dlJCaVZSM3V1?=
 =?utf-8?B?a24wMXlET3JNOS9wblVvb25XYnBoTE5QcGtxU2RaUXNRekg0MExWMkErUVI5?=
 =?utf-8?B?cjdjMHlMM3QwL2J5NXA4UFM2MjByRXhJTEw2b0xjREI3b2djWnQ4NjNtd2JB?=
 =?utf-8?B?RHBtLzM5M3I0c1lRR3lHanFlWXJQKzVoaDZ0WUlKei83MVdoMG0rYWFpb1p1?=
 =?utf-8?B?U2NLQkdWZFFGTmYxM1oyNDRSQUdKQWw1QXRwRkhxTmJ5c2tJNytYajVuUHdp?=
 =?utf-8?B?U1FHakxYVnpWQVJMWkx6RkFhVUtxamxKa3FkQzhaTzBzTjkvaG9kRnFuUnJp?=
 =?utf-8?B?d0ZtMm5aeDRTaWxua3RmYlJRRnoxNU5HQzNwdmdBbWVTc1p3WkFMajRhc2xD?=
 =?utf-8?B?V1lVOGtMRDR1ODRNMW15Q2h5bFhtWnlDZU5UTlVjcmw5SGpLTkZvYjV1cTh2?=
 =?utf-8?B?cEgwZTYrcDYrcTdPeEVWL0g5M2FaZndSekVhWTdtT28yOUdsSkg2RTZheTRQ?=
 =?utf-8?B?TE12YUFKazJkVTF2UHZlSzJRNmRWbTMyQ2dRSXR3UlNjQTZLNHBKbDNKejJ5?=
 =?utf-8?B?cUJvSWt6cHdOdmUrbEdDWllxZUVHY2d1MTJxT1c2WEhoQ2lRV2lsSVFSV2lr?=
 =?utf-8?B?c2VFRjRDcmRXTXhEMk4vTENWMU9oRUdtaER0blY2TjhiR0sxQmVuUU5ENHdz?=
 =?utf-8?B?VG1xKys4ZVYzSlpmLzVQOWIySE9wY3hkV0R6eDk5TGxYc1dNVS9xcmZUUGpM?=
 =?utf-8?B?L1FsTWVjRkk2WEtRRVpPUFQ2S00wbTQ2dERUMTJ6THBrZkZ5dGxBRHMwVFJI?=
 =?utf-8?B?d2NXTEthUkFqeFZRZUtmdmIwcmJWNGpsWStHdXc5SmlGanRQL2lUSFJZblBI?=
 =?utf-8?B?dk1FaDYzMXZPOE1YMmhVa0xhb2dzUDdSQVRaWmoycmhlRi82RW9YN1B5WGRZ?=
 =?utf-8?B?dGtPeDJPa1RPTU95b1NZaTVOY1d6eDNnSysvTTdWVGl2a1E9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7599.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NkJyUld3OFJIVlF3YzNhcWphWm9ZZG02RzZyMXVXU0hVaFhwU2QyRUljUlFQ?=
 =?utf-8?B?ZGJIYjV0MWZBVDBKVkI4U1ZOU245bWROb2M1eEp0UG5xL2RXTTloamlhQWl0?=
 =?utf-8?B?dUlLK25SMDVSM3greldSOFBnT285THdCVWdvc21WZ3gvMGV3M25CNlNhdzEv?=
 =?utf-8?B?aXFIdGNLTE02RlR6S2JGTkNGUFV3ZWMxS01XQTFtQ2VtcFVpQWl5ZC82Q2Yr?=
 =?utf-8?B?dEROY0ZGNXg3NWhHNjVQZGlzeEF3VXlqdW1YWDB2QkE2L2VNNVdLc0JZNGNM?=
 =?utf-8?B?elRib09rUkhZK05kNkE1MzgxWEg5bTRvQTE0bm52eFZRcSsxUlpKQ3hkVmMw?=
 =?utf-8?B?YzlxbkVzSmNERVpIYk96bWFQNzlvRDhzUWhid3dxY0JWQmsxTXNtbzRGU2NQ?=
 =?utf-8?B?c0NJL25tSU9acFVtaEJuSGE4TWk4US9lTDlTU1UzWWp1ZU04emVmSmRhamxv?=
 =?utf-8?B?MFdvcmtOK0FjOXZKTm0xcy9xSC9DV1lGK0RUakh1ZUNkTklFKy9hdXRXZkU2?=
 =?utf-8?B?aDc1ZVN4WFRRdGpyeVROWjBJc3dDWktnQ2t2dmsxN3g5SFowUksvcHA5MG1h?=
 =?utf-8?B?YWF2Q21KWVhrK21wL3NnTGtndnBKN0ZnenJHSDlkOUErZHk5TGNwQnYwMzJC?=
 =?utf-8?B?NDd3cVlBdVBESTEwU3R4MmRTT1puTXVHNDdIbzh5T0tYc2VOd0xDenBYaHdz?=
 =?utf-8?B?ODZOZVBsY2hhU1AzRDdQS1hxWVpYYzZTRU5TaS9yandDanhOSTQxTE4vbmJh?=
 =?utf-8?B?a3VOcmlmL0xRdFFzOWJtYitoVjU5bGlhYWY0RUNtUE0zMVJ1eEZwUFVHbmta?=
 =?utf-8?B?T2F1enYxblZDTkVBUWc0Q3U5VkxwVnl4bkNkK1UvTkV2bU1ZSkpwQlgwK1hG?=
 =?utf-8?B?THNFVFdldXprbmVPQ2c3MXhDVGxNTTUxeTR1SlpwdE13VmFiTU9CZlBjdGlh?=
 =?utf-8?B?L2xHWTdoR05hb3NKNFJOL04xRkJ0VTVvQlhVTldQc0VMSm0yZlNKTzFMcVYr?=
 =?utf-8?B?Y1hOdWwreW9KQmYxTTRLeGFZb1NxaURPVHJCMjFOZC9VSUkzemdUTXVoem1w?=
 =?utf-8?B?MGdqOE1sNGxaTGdKekE4SmdrR1dBTGVqakh4aVBzN3pleFdnbnQvVDZHbk1K?=
 =?utf-8?B?aUs3ZHhLcFloTzhPaDVzTXA4ZDRmNEJyZWVjZnVEaUd0MVBObE5DZVlldWRx?=
 =?utf-8?B?YTlxeUlFWTJxKzRJenNoTXhwY2tUSDNxS1ZuM0hiczdVaHBpNDA2Q0JDZHc5?=
 =?utf-8?B?aHgvSHo1d1Z1SEV5bkQ2UmpZNHAzbW8yc3g4UzFYZDdBTGJGMVhscHNmV2cx?=
 =?utf-8?B?T0VmOERsYkNTWkhIcFczNENZVVZZWTN1RHBicHN4bWVMMUhzblQrV0loQW02?=
 =?utf-8?B?ME9lSWNkcnFkZFNvRnZzQ3FKeVZOb1R3MGsrVHdCelpmMW5nVGpXeExzOHRO?=
 =?utf-8?B?elRrdHFBVFBNSXNXb1BDNWZraFpLcXc0anZwQnFqOTg5MVBDSWtXNGhIaDFR?=
 =?utf-8?B?aWdadmVacElxaVlnY1h0aXlKUXdENWI3cmp6MUxtR1ZVWXN2aEI2RVNjUmhB?=
 =?utf-8?B?QlRnTEZpNlFLQS84dGhXcXBET3JTMVJoTTBkWW8xQkpBMVVDODZqNmFIL1BS?=
 =?utf-8?B?OVdndmYxT1VvMVQ4aHdHaFcvdjZ2VngwZmErWmdzUnhXWGFuTWtjQzFkbUxD?=
 =?utf-8?B?VHhUTU1PN2VLUlYwY1RYMzd3R1ByeXZYS1Y0NGFXaUtPVGsxWTNIL1lKNG0y?=
 =?utf-8?B?RXh5a2thSVI1eXprZTNVeEZkTGJZWWlYUklqMDR4RzQ4ak5XWjZmYTV0amEx?=
 =?utf-8?B?Y0lCbGkwVWU4QktvQ1NEb3B4K3Fza1FkVXR6NGZRTGhNMU1MSVZUeUlTdW4x?=
 =?utf-8?B?N0xIK2tpMXY0dFRSU0VVOTRXdTN4WkVUaFFPKzl1ZjNJZ2RFU1d2S3FVU0w0?=
 =?utf-8?B?c2VUNFh1K2haMk51ckZmUE9tVk10M3pydWRuT1doNklHZk1qMEUyUlViTER2?=
 =?utf-8?B?aWQ4bWVMREl1alllb0JGMHd0ck9hWTV1ODk0MXJiUkk2S0hjc2laNzEvYjN0?=
 =?utf-8?B?MjhnM2lKOWpRNEpITklIMFJObllhMndkQmlsSVZlVDJQMUVuNXFObU5aWHRM?=
 =?utf-8?B?OG5oSUhwL0JhbDd3WXRtYXcyNmNVT0JZa0hCZTJPM1VRVDM1YXRQbHRROGpD?=
 =?utf-8?B?VVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10f7cf53-6a75-48d4-b6c4-08dd3b9912d9
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7599.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 10:31:19.0352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RvB2/ad7O64/bFa3R0WTsrAvegWgeU15MqoXZ1JETP0a+o26Nio2o+KDM7tfhqoZyi5gfW9569QkGDLPGVVLI6ztDscA65O82hkyA6G5pKA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4871
X-Authority-Analysis: v=2.4 cv=b/xI4sGx c=1 sm=1 tr=0 ts=67921a79 cx=c_pps a=gIIqiywzzXYl0XjYY6oQCA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10
 a=CCpqsmhAAAAA:8 a=07d9gI8wAAAA:8 a=NEAV23lmAAAA:8 a=b4LDLZbEAAAA:8 a=pGLkceISAAAA:8 a=sbSeSBlXAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=Xk1Z3-p4R--2tSMch9sA:9 a=g-3pqrflW95dkCGK:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zxEYbfW3NtAA:10 a=UzEUFbzKNcAA:10
 a=GAMdcTV6l7IA:10 a=ul9cdbp4aOFLsgKbc677:22 a=e2CUPOnPG4QKp8I52DXD:22 a=20T61YgZp4ItGotXEy2O:22 a=7fW4R0_MU044L0Oq4fTP:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: NxEZucG6KlSe5BijlQOPIjftVQhWvUMu
X-Proofpoint-ORIG-GUID: NxEZucG6KlSe5BijlQOPIjftVQhWvUMu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_04,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 impostorscore=0 mlxscore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=999
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501230080
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 50N63SBj009556
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 10:31:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210189

From: Yash Shinde <Yash.Shinde@windriver.com>

* Drop 0001-Fix-Wenum-constexpr-conversion-in-enum-flags.h.patch, its alr=
eady applied to gdb 16.1

Detailed release notes:

https://sourceware.org/pipermail/gdb-announce/2025/000143.html
https://sourceware.org/gdb/news/
https://lwn.net/Articles/1005562/
https://www.sourceware.org/gdb/download/ANNOUNCEMENT

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 meta/conf/distro/include/time64.inc           |   2 +-
 ...ian_15.2.bb =3D> gdb-cross-canadian_16.1.bb} |   0
 .../{gdb-cross_15.2.bb =3D> gdb-cross_16.1.bb}  |   0
 meta/recipes-devtools/gdb/gdb.inc             |   3 +-
 ...constexpr-conversion-in-enum-flags.h.patch | 313 ------------------
 ...e-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch |   4 +-
 .../gdb/{gdb_15.2.bb =3D> gdb_16.1.bb}          |   0
 8 files changed, 5 insertions(+), 319 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_15.2.bb =3D> gdb-cr=
oss-canadian_16.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_15.2.bb =3D> gdb-cross_16.1.=
bb} (100%)
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0001-Fix-Wenum-constexp=
r-conversion-in-enum-flags.h.patch
 rename meta/recipes-devtools/gdb/{gdb_15.2.bb =3D> gdb_16.1.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/dist=
ro/include/tcmode-default.inc
index fa4028ceda..34f20b8f26 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -23,7 +23,7 @@ PREFERRED_PROVIDER_virtual/gettext ??=3D "gettext"
 GCCVERSION ?=3D "14.%"
 SDKGCCVERSION ?=3D "${GCCVERSION}"
 BINUVERSION ?=3D "2.43%"
-GDBVERSION ?=3D "15.%"
+GDBVERSION ?=3D "16.%"
 GLIBCVERSION ?=3D "2.40%"
 LINUXLIBCVERSION ?=3D "6.12%"
 QEMUVERSION ?=3D "9.2%"
diff --git a/meta/conf/distro/include/time64.inc b/meta/conf/distro/inclu=
de/time64.inc
index f9f2fd0877..5122e2a122 100644
--- a/meta/conf/distro/include/time64.inc
+++ b/meta/conf/distro/include/time64.inc
@@ -53,5 +53,5 @@ INSANE_SKIP:append:pn-pseudo =3D " 32bit-time"
 INSANE_SKIP:append:pn-binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} =
=3D " 32bit-time"
 #gcc-cross-canadian-arm-14.1.0-r0 do_package_qa: QA Issue: xxx/x86_64-oe=
sdk-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/14.1.=
0/plugin/gengtype uses 32-bit api 'ctime'
 INSANE_SKIP:append:pn-gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "=
 32bit-time"
-#gdb-cross-canadian-arm-15.2-r0 do_package_qa: QA Issue: xxx/x86_64-oesd=
k-linux/usr/bin/arm-oe-linux-gnueabi/arm-oe-linux-gnueabi-gdb uses 32-bit=
 api 'lstat'
+#gdb-cross-canadian-arm-16.1-r0 do_package_qa: QA Issue: xxx/x86_64-oesd=
k-linux/usr/bin/arm-oe-linux-gnueabi/arm-oe-linux-gnueabi-gdb uses 32-bit=
 api 'lstat'
 INSANE_SKIP:append:pn-gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "=
 32bit-time"
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_15.2.bb b/meta/=
recipes-devtools/gdb/gdb-cross-canadian_16.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_15.2.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian_16.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb-cross_15.2.bb b/meta/recipes-d=
evtools/gdb/gdb-cross_16.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross_15.2.bb
rename to meta/recipes-devtools/gdb/gdb-cross_16.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gd=
b/gdb.inc
index ff0db68da7..41f92be3cb 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -12,6 +12,5 @@ SRC_URI =3D "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0005-Change-order-of-CFLAGS.patch \
            file://0006-Fix-invalid-sigprocmask-call.patch \
            file://0007-Define-alignof-using-_Alignof-when-using-C11-or-n=
ewe.patch \
-           file://0001-Fix-Wenum-constexpr-conversion-in-enum-flags.h.pa=
tch \
            "
-SRC_URI[sha256sum] =3D "83350ccd35b5b5a0cba6b334c41294ea968158c573940904=
f00b92f76345314d"
+SRC_URI[sha256sum] =3D "c2cc5ccca029b7a7c3879ce8a96528fdfd056b4d884f2b05=
11e8f7bc723355c6"
diff --git a/meta/recipes-devtools/gdb/gdb/0001-Fix-Wenum-constexpr-conve=
rsion-in-enum-flags.h.patch b/meta/recipes-devtools/gdb/gdb/0001-Fix-Wenu=
m-constexpr-conversion-in-enum-flags.h.patch
deleted file mode 100644
index 8866db2e93..0000000000
--- a/meta/recipes-devtools/gdb/gdb/0001-Fix-Wenum-constexpr-conversion-i=
n-enum-flags.h.patch
+++ /dev/null
@@ -1,313 +0,0 @@
-From dd22f64329c46797b3a3de2605ad1fa14cf77dd4 Mon Sep 17 00:00:00 2001
-From: Carlos Galvez <carlosgalvezp@gmail.com>
-Date: Sun, 30 Jun 2024 21:36:24 +0200
-Subject: [PATCH] Fix -Wenum-constexpr-conversion in enum-flags.h
-
-This fixes PR 31331:
-https://sourceware.org/bugzilla/show_bug.cgi?id=3D31331
-
-Currently, enum-flags.h is suppressing the warning
--Wenum-constexpr-conversion coming from recent versions of Clang.
-This warning is intended to be made a compiler error
-(non-downgradeable) in future versions of Clang:
-
-https://github.com/llvm/llvm-project/issues/59036
-
-The rationale is that casting a value of an integral type into an
-enumeration is Undefined Behavior if the value does not fit in the
-range of values of the enum:
-https://www.open-std.org/jtc1/sc22/wg21/docs/cwg_defects.html#1766
-
-Undefined Behavior is not allowed in constant expressions, leading to
-an ill-formed program.
-
-In this case, in enum-flags.h, we are casting the value -1 to an enum
-of a positive range only, which is UB as per the Standard and thus not
-allowed in a constexpr context.
-
-The purpose of doing this instead of using std::underlying_type is
-because, for C-style enums, std::underlying_type typically returns
-"unsigned int". However, when operating with it arithmetically, the
-enum is promoted to *signed* int, which is what we want to avoid.
-
-This patch solves this issue as follows:
-
-* Use std::underlying_type and remove the custom enum_underlying_type.
-
-* Ensure that operator~ is called always on an unsigned integer. We do
-  this by casting the input enum into std::size_t, which can fit any
-  unsigned integer. We have the guarantee that the cast is safe,
-  because we have checked that the underlying type is unsigned. If the
-  enum had negative values, the underlying type would be signed.
-
-  This solves the issue with C-style enums, but also solves a hidden
-  issue: enums with underlying type of std::uint8_t or std::uint16_t are
-  *also* promoted to signed int. Now they are all explicitly casted
-  to the largest unsigned int type and operator~ is safe to use.
-
-* There is one more thing that needs fix. Currently, operator~ is
-  implemented as follows:
-
-  return (enum_type) ~underlying(e);
-
-  After applying ~underlying(e), the result is a very large value,
-  which we then cast to "enum_type". This cast is Undefined Behavior
-  if the large value does not fit in the range of the enum. For
-  C++ enums (scoped and/or with explicit underlying type), the range
-  of the enum is the entire range of the underlying type, so the cast
-  is safe. However, for C-style enums, the range is the smallest
-  bit-field that can hold all the values of the enumeration. So the
-  range is a lot smaller and casting a large value to the enum would
-  invoke Undefined Behavior.
-
-  To solve this problem, we create a new trait
-  EnumHasFixedUnderlyingType, to ensure operator~ may only be called
-  on C++-style enums. This behavior is roughly the same as what we
-  had on trunk, but relying on different properties of the enums.
-
-* Once this is implemented, the following tests fail to compile:
-
-  CHECK_VALID (true,  int,  true ? EF () : EF2 ())
-
-  This is because it expects the enums to be promoted to signed int,
-  instead of unsigned int (which is the true underlying type).
-
-  I propose to remove these tests altogether, because:
-
-  - The comment nearby say they are not very important.
-  - Comparing 2 enums of different type like that is strange, relies
-    on integer promotions and thus hurts readability. As per comments
-    in the related PR, we likely don't want this type of code in gdb
-    code anyway, so there's no point in testing it.
-  - Most importantly, this type of comparison will be ill-formed in
-    C++26 for regular enums, so enum_flags does not need to emulate
-    that.
-
-Since this is the only place where the warning was suppressed, remove
-also the corresponding macro in include/diagnostics.h.
-
-The change has been tested by running the entire gdb test suite
-(make check) and comparing the results (testsuite/gdb.sum) against
-trunk. No noticeable differences have been observed.
-Tested-by: Keith Seitz <keiths@redhat.com>
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Submitted [https://patchwork.sourceware.org/project/gdb=
/patch/20240630193624.2906762-1-carlosgalvezp@gmail.com/]
----
- gdb/unittests/enum-flags-selftests.c |  27 -------
- gdbsupport/enum-flags.h              | 104 ++++++++++++++++++---------
- include/diagnostics.h                |   5 --
- 3 files changed, 70 insertions(+), 66 deletions(-)
-
-diff --git a/gdb/unittests/enum-flags-selftests.c b/gdb/unittests/enum-f=
lags-selftests.c
-index b55d8c3..02563e5 100644
---- a/gdb/unittests/enum-flags-selftests.c
-+++ b/gdb/unittests/enum-flags-selftests.c
-@@ -233,33 +233,6 @@ CHECK_VALID (true,   UEF,    ~UEF ())
- CHECK_VALID (true,  EF,   true ? EF () : RE ())
- CHECK_VALID (true,  EF,   true ? RE () : EF ())
-=20
--/* These are valid, but it's not a big deal since you won't be able to
--   assign the resulting integer to an enum or an enum_flags without a
--   cast.
--
--   The latter two tests are disabled on older GCCs because they
--   incorrectly fail with gcc 4.8 and 4.9 at least.  Running the test
--   outside a SFINAE context shows:
--
--    invalid user-defined conversion from =E2=80=98EF=E2=80=99 to =E2=80=
=98RE2=E2=80=99
--
--   They've been confirmed to compile/pass with gcc 5.3, gcc 7.1 and
--   clang 3.7.  */
--
--CHECK_VALID (true,  int,  true ? EF () : EF2 ())
--CHECK_VALID (true,  int,  true ? EF2 () : EF ())
--CHECK_VALID (true,  int,  true ? EF () : RE2 ())
--CHECK_VALID (true,  int,  true ? RE2 () : EF ())
--
--/* Same, but with an unsigned enum.  */
--
--typedef unsigned int uns;
--
--CHECK_VALID (true,  uns,  true ? EF () : UEF ())
--CHECK_VALID (true,  uns,  true ? UEF () : EF ())
--CHECK_VALID (true,  uns,  true ? EF () : URE ())
--CHECK_VALID (true,  uns,  true ? URE () : EF ())
--
- /* Unfortunately this can't work due to the way C++ computes the
-    return type of the ternary conditional operator.  int isn't
-    implicitly convertible to the raw enum type, so the type of the
-diff --git a/gdbsupport/enum-flags.h b/gdbsupport/enum-flags.h
-index 5078004..acec203 100644
---- a/gdbsupport/enum-flags.h
-+++ b/gdbsupport/enum-flags.h
-@@ -75,30 +75,6 @@
-    namespace.  The compiler finds the corresponding
-    is_enum_flags_enum_type function via ADL.  */
-=20
--/* Note that std::underlying_type<enum_type> is not what we want here,
--   since that returns unsigned int even when the enum decays to signed
--   int.  */
--template<int size, bool sign> class integer_for_size { typedef void typ=
e; };
--template<> struct integer_for_size<1, 0> { typedef uint8_t type; };
--template<> struct integer_for_size<2, 0> { typedef uint16_t type; };
--template<> struct integer_for_size<4, 0> { typedef uint32_t type; };
--template<> struct integer_for_size<8, 0> { typedef uint64_t type; };
--template<> struct integer_for_size<1, 1> { typedef int8_t type; };
--template<> struct integer_for_size<2, 1> { typedef int16_t type; };
--template<> struct integer_for_size<4, 1> { typedef int32_t type; };
--template<> struct integer_for_size<8, 1> { typedef int64_t type; };
--
--template<typename T>
--struct enum_underlying_type
--{
--  DIAGNOSTIC_PUSH
--  DIAGNOSTIC_IGNORE_ENUM_CONSTEXPR_CONVERSION
--  typedef typename
--    integer_for_size<sizeof (T), static_cast<bool>(T (-1) < T (0))>::ty=
pe
--    type;
--  DIAGNOSTIC_POP
--};
--
- namespace enum_flags_detail
- {
-=20
-@@ -119,10 +95,62 @@ struct zero_type;
- /* gdb::Requires trait helpers.  */
- template <typename enum_type>
- using EnumIsUnsigned
--  =3D std::is_unsigned<typename enum_underlying_type<enum_type>::type>;
-+  =3D std::is_unsigned<typename std::underlying_type<enum_type>::type>;
-+
-+/* Helper to detect whether an enum has a fixed underlying type. This c=
an be
-+   achieved by using a scoped enum (in which case the type is "int") or
-+   an explicit underlying type. C-style enums that are unscoped or do n=
ot
-+   have an explicit underlying type have an implementation-defined unde=
rlying
-+   type.
-+
-+   https://timsong-cpp.github.io/cppwp/n4659/dcl.enum#5
-+
-+   We need this trait in order to ensure that operator~ below does NOT
-+   operate on old-style enums. This is because we apply operator~ on
-+   the value and then cast the result to the enum_type. This is however
-+   Undefined Behavior if the result does not fit in the range of possib=
le
-+   values for the enum. For enums with fixed underlying type, the entir=
e
-+   range of the integer is available. However, for old-style enums, the=
 range
-+   is only the smallest bit-field that can hold all the values of the
-+   enumeration, typically much smaller than the underlying integer:
-+
-+   https://timsong-cpp.github.io/cppwp/n4659/expr.static.cast#10
-+   https://timsong-cpp.github.io/cppwp/n4659/dcl.enum#8
-+
-+   To implement this, we leverage the fact that, since C++17, enums wit=
h
-+   fixed underlying type can be list-initialized from an integer:
-+   https://timsong-cpp.github.io/cppwp/n4659/dcl.init.list#3.7
-+
-+   Old-style enums cannot be initialized like that, leading to ill-form=
ed
-+   code.
-+
-+   We then use this together with SFINAE to create the desired trait.
-+
-+*/
-+// Primary template
-+template <typename enum_type, typename =3D void>
-+struct EnumHasFixedUnderlyingType : std::false_type
-+{
-+  static_assert(std::is_enum<enum_type>::value);
-+};
-+
-+// Specialization that is active only if enum_type can be list-initiali=
zed
-+// from an integer (0). Only enums with fixed underlying type satisfy t=
his
-+// property in C++17.
-+template <typename enum_type>
-+struct EnumHasFixedUnderlyingType<enum_type, std::void_t<decltype(enum_=
type{0})>> : std::true_type
-+{
-+  static_assert(std::is_enum<enum_type>::value);
-+};
-+
-+template <typename enum_type>
-+using EnumIsSafeForBitwiseComplement =3D std::conjunction<
-+  EnumIsUnsigned<enum_type>,
-+  EnumHasFixedUnderlyingType<enum_type>
-+>;
-+
- template <typename enum_type>
--using EnumIsSigned
--  =3D std::is_signed<typename enum_underlying_type<enum_type>::type>;
-+using EnumIsUnsafeForBitwiseComplement =3D std::negation<EnumIsSafeForB=
itwiseComplement<enum_type>>;
-=20
- }
-=20
-@@ -131,7 +159,7 @@ class enum_flags
- {
- public:
-   typedef E enum_type;
--  typedef typename enum_underlying_type<enum_type>::type underlying_typ=
e;
-+  typedef typename std::underlying_type<enum_type>::type underlying_typ=
e;
-=20
-   /* For to_string.  Maps one enumerator of E to a string.  */
-   struct string_mapping
-@@ -394,33 +422,41 @@ ENUM_FLAGS_GEN_COMP (operator!=3D, !=3D)
- template <typename enum_type,
- 	  typename =3D is_enum_flags_enum_type_t<enum_type>,
- 	  typename
--	    =3D gdb::Requires<enum_flags_detail::EnumIsUnsigned<enum_type>>>
-+	    =3D gdb::Requires<enum_flags_detail::EnumIsSafeForBitwiseComplemen=
t<enum_type>>>
- constexpr enum_type
- operator~ (enum_type e)
- {
-   using underlying =3D typename enum_flags<enum_type>::underlying_type;
--  return (enum_type) ~underlying (e);
-+  // Cast to std::size_t first, to prevent integer promotions from
-+  // enums with fixed underlying type std::uint8_t or std::uint16_t
-+  // to signed int.
-+  // This ensures we apply the bitwise complement on an unsigned type.
-+  return (enum_type)(underlying) ~std::size_t (e);
- }
-=20
- template <typename enum_type,
- 	  typename =3D is_enum_flags_enum_type_t<enum_type>,
--	  typename =3D gdb::Requires<enum_flags_detail::EnumIsSigned<enum_type=
>>>
-+	  typename =3D gdb::Requires<enum_flags_detail::EnumIsUnsafeForBitwise=
Complement<enum_type>>>
- constexpr void operator~ (enum_type e) =3D delete;
-=20
- template <typename enum_type,
- 	  typename =3D is_enum_flags_enum_type_t<enum_type>,
- 	  typename
--	    =3D gdb::Requires<enum_flags_detail::EnumIsUnsigned<enum_type>>>
-+	    =3D gdb::Requires<enum_flags_detail::EnumIsSafeForBitwiseComplemen=
t<enum_type>>>
- constexpr enum_flags<enum_type>
- operator~ (enum_flags<enum_type> e)
- {
-   using underlying =3D typename enum_flags<enum_type>::underlying_type;
--  return (enum_type) ~underlying (e);
-+  // Cast to std::size_t first, to prevent integer promotions from
-+  // enums with fixed underlying type std::uint8_t or std::uint16_t
-+  // to signed int.
-+  // This ensures we apply the bitwise complement on an unsigned type.
-+  return (enum_type)(underlying) ~std::size_t (e);
- }
-=20
- template <typename enum_type,
- 	  typename =3D is_enum_flags_enum_type_t<enum_type>,
--	  typename =3D gdb::Requires<enum_flags_detail::EnumIsSigned<enum_type=
>>>
-+	  typename =3D gdb::Requires<enum_flags_detail::EnumIsUnsafeForBitwise=
Complement<enum_type>>>
- constexpr void operator~ (enum_flags<enum_type> e) =3D delete;
-=20
- /* Delete operator<< and operator>>.  */
-diff --git a/include/diagnostics.h b/include/diagnostics.h
-index 97e30ab..14575e2 100644
---- a/include/diagnostics.h
-+++ b/include/diagnostics.h
-@@ -76,11 +76,6 @@
- # define DIAGNOSTIC_ERROR_SWITCH \
-   DIAGNOSTIC_ERROR ("-Wswitch")
-=20
--# if __has_warning ("-Wenum-constexpr-conversion")
--#  define DIAGNOSTIC_IGNORE_ENUM_CONSTEXPR_CONVERSION \
--   DIAGNOSTIC_IGNORE ("-Wenum-constexpr-conversion")
--# endif
--
- #elif defined (__GNUC__) /* GCC */
-=20
- # define DIAGNOSTIC_IGNORE_DEPRECATED_DECLARATIONS \
diff --git a/meta/recipes-devtools/gdb/gdb/0002-ppc-ptrace-Define-pt_regs=
-uapi_pt_regs-on-GLIBC-syst.patch b/meta/recipes-devtools/gdb/gdb/0002-pp=
c-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
index 56602b4116..69d4d51af0 100644
--- a/meta/recipes-devtools/gdb/gdb/0002-ppc-ptrace-Define-pt_regs-uapi_p=
t_regs-on-GLIBC-syst.patch
+++ b/meta/recipes-devtools/gdb/gdb/0002-ppc-ptrace-Define-pt_regs-uapi_p=
t_regs-on-GLIBC-syst.patch
@@ -16,8 +16,8 @@ index b51e2278f4b..f1bc07df0e9 100644
 --- a/gdb/nat/ppc-linux.h
 +++ b/gdb/nat/ppc-linux.h
 @@ -18,7 +18,13 @@
- #ifndef NAT_PPC_LINUX_H
- #define NAT_PPC_LINUX_H
+ #ifndef GDB_NAT_PPC_LINUX_H
+ #define GDB_NAT_PPC_LINUX_H
 =20
 +#if !defined(__GLIBC__)
 +# define pt_regs uapi_pt_regs
diff --git a/meta/recipes-devtools/gdb/gdb_15.2.bb b/meta/recipes-devtool=
s/gdb/gdb_16.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb_15.2.bb
rename to meta/recipes-devtools/gdb/gdb_16.1.bb
--=20
2.43.0


