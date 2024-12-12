Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC391E7717F
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 14:31:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.20826.1734013857728764409
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Dec 2024 06:30:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=207616a842=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCBfSqx021076
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 14:30:57 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2043.outbound.protection.outlook.com [104.47.70.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43cx4xdmw8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 14:30:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UWMt2gtJoNdre1ozykhqbp6Pxy4kk5mdgwwTs0MzYDKHzsYMpcm166QIId8eDBxZaElNfft3L0gbkOF8XyeALrkv8c2I/X9nGvmhfpIoWImoFfSHubixAMbE7ZgRFknO2+htZd5XQEfy8GS1jDbcl+WaD17v3d9AqrGFztFz0Uow3fK1ejlPQNckLusW24KKr1w7pFegAYmDQUoxVpCSWx0BMI7348u8qLcDg+41eB5ByjVQsDZ3vZiaLs8nTmuYehNvPEPnT7I32TZdByuFiyFC8tNiFAj0hQyBfi/f1s0hVESvU6ouN6Q3wh2AZYAAzgtlS/WcaVjhXu9nQvRrSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LD6SwUPbGKOTVcSTDAQJvpHWvDkZ8X9Q2zHerbbZX68=;
 b=hTgIJXCLTk2i1mJGlTJaBG6NVhn5Szv9w+L/8JV1ONd7yZ6CAo6Ypd/IOlBOnxhd81vnI4PoefTOuUG4EnsS1m3bxf9wTidP2Sg14b8mL+ZDhY/XBv4wcBHFcAcfWVXAtc6sQkgnwy11ni/9FZjf80jR/oA5X0gJR36IhCshR+g+h9Ac1J6RQ2tFo9j0uCVSm3yMFARJwyjX6RFXkd7d284kwcny9sgKNjiN6dCvN7p6+h+UBasGd3m0D7W13G3nllGlO5+HUjhFCqJfVu21Qp1wj4GXW9aBqJfqNxr6S9PgAWN1SGf+ZnPg4XW6nmTB3oqzVYwewdjy6wD3KeMIvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by CY8PR11MB7396.namprd11.prod.outlook.com (2603:10b6:930:87::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Thu, 12 Dec
 2024 14:30:49 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%4]) with mapi id 15.20.8230.016; Thu, 12 Dec 2024
 14:30:49 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        Yash.Shinde@windriver.com
Subject: [PATCH] binutils: Fix CVE-2024-53589
Date: Thu, 12 Dec 2024 06:30:29 -0800
Message-ID: <20241212143029.3623347-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SJ0PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::22) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|CY8PR11MB7396:EE_
X-MS-Office365-Filtering-Correlation-Id: 0acc17b8-2e9b-4921-dda6-08dd1ab992b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?V0FrNGlIZGYzNkhMUHVQR0p4U3kvcnl2VHhmTHEvYVdESzFUVVRrK0FLTEds?=
 =?utf-8?B?R1NvbExXcGswU0RlUi9Ia2ZJcjdUU3J5MXlPeW1VbmY5Y3NlaTR2blZvM1BF?=
 =?utf-8?B?UmI4QkRsVmNHWnNKalZlRkV5VDNvT0RIcC9lWHNXM0tXa3lYOFlpSm1HMllE?=
 =?utf-8?B?dlprWCsxWnBEOUs1NzdPNlFQN2R0aGVLTU42T2xzQ0x3VnRYN1QwRy8wbjJM?=
 =?utf-8?B?SjFjTkpJQ25TaUdTdWozbVpHKzZ2emNaNENxa2ppVTY5SjU1YVNUMFEzOW40?=
 =?utf-8?B?SmlJc3Q1WlA5U2FCdXV1WEg3Nk9aai81QzF1L2dnRWZvaWQxY1VKRDlxN3hS?=
 =?utf-8?B?b3FUTGxBNVRpbllVUGIvd2lNRFN5b3N5T2pvRnJGUWdjUENNNi9wdkJGcDE2?=
 =?utf-8?B?aVF2ajVVd09tM0FRTCtva1RMeGRDOVRhNFNsMnlkZm4rbjlRc1Y2N2dRNWhT?=
 =?utf-8?B?Vmh6aS9tN0ZnTVFuWlp1R3lsTlNJM1MvdXJ3K1ZGaHdOdUtWY1FVNmVBMjZW?=
 =?utf-8?B?SEMrZXY4NFQvRWs3WmlVRDJTYXhnaWl1S0JTSHFCMkh2eGh0QlFubDdqRERU?=
 =?utf-8?B?d2NnSnVaWDB3TTY3MThpODlrdmF4c0UvYUFuVjJyZU5oT3NVWU5yRk42YmlG?=
 =?utf-8?B?SzM2LzZLc3VzelhBQkQ3OUhrRVhlTlkvOVFoejRyTkdUdXROVGh4K2VrSDh5?=
 =?utf-8?B?U1loRE5jMmpIaGZOZHYraXB2L0tnZTYxRlN2QTJxcGIvbitVWmY3eWR2SzdZ?=
 =?utf-8?B?aFY2M2F2WkJJc1hLN0hBVHRtekhNR2NmR2hyeUt1NWJXbU9qRmpkaHEyN0lG?=
 =?utf-8?B?YWd1MWxnSFlENWNjVFRkUFZweW50MWJwaVI0OGxMR21DWTZqVW4xaXgwUWw3?=
 =?utf-8?B?SG9QN2tMRkdLWWkxY3BHZGhiL1dsUTdDZWttQzhWQWRXVG4va0NseUcrQ21R?=
 =?utf-8?B?RCtxUk1sK2JYYXJDRHdVMG8vWjYxR2ROV3RleEZBZmJPKzEyQzB2SVhsWlp1?=
 =?utf-8?B?M2dPdTN3cGFVWGpjQ1Rmb21GYUJRTjFac0hJaksxL3VYdnFYbmdNNkFYV1lU?=
 =?utf-8?B?MjJ4cmFHUzJ4VkxnR0VoNkxqUWMxM1BEZUV4aGlTTVlKVlB6OHFxbEpjMThW?=
 =?utf-8?B?dmxlcXB4c0ZZVjV3aUNwMWYvYm5UUk5DSVQyL3hlVFA1VmFXWmRUSEx3bTZL?=
 =?utf-8?B?ZithZjE1SDRzTDF3anBmR3dnR2t6L0FEUjBWQ0hmODA1NTJSa1ZBZkprdUts?=
 =?utf-8?B?Z2tCUVRjRUV2Q1YxbVVQNkhCY2pjVUhEL1hTMkxmSHVUOUF5UVM3T3ArMXdy?=
 =?utf-8?B?TytXM1pyWlFnRlFpYmg1TThkWGoyRnJyZXlFNXh6QXA4R0s0MFVXSUZpU0FR?=
 =?utf-8?B?NkhhQWVNMTk4Uk9hWVBHVGhsdFM2N0RBcEJsSk5aNHdESCtWZzFLd0ZVZVdW?=
 =?utf-8?B?MkRnWU1FeVp3MWVyMTVDbGJqUTk5Wkxya2pWakNqY01UTUJXSkkyNWhpUmQv?=
 =?utf-8?B?QVVobk43UkRuRVpRTW5tbWJ4ckVKYmFqajd0Nm96ajk0TmE2bXJneE9FR0xX?=
 =?utf-8?B?QnRJbDB4MjFLWkt0K0QrbTB6VVcvcThIU043Y0JESWgxREdUMERNVUt4QmRS?=
 =?utf-8?B?aHhZd3pOdUhZT3lwYk5zQ1JJVTVReXJwSUV1Q2p1TVp6ZFJLZExpRHR1Qkdr?=
 =?utf-8?B?OGduRXllUjkrdEJuU0J3bEF5a01hWXlwb1BIdVBjZnJBVllYeFR6SStTbEFP?=
 =?utf-8?B?NjhZclRxTldWK0wxRHhZcVRqL2liMkxBNmp3VmwvMm85eWwwSjdrdm52VlY4?=
 =?utf-8?Q?7Lv6xl/SmrTh+kCpICZSJ9LcKBV48y4LKtNQs=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?M0RQcG1EeTBKbHpjdCtQMkJKczE4eVJyOTJ5TTFzTS96U2NWWWdmWndUL0pa?=
 =?utf-8?B?TmtxMW1GSm5DYm5ZQUNLeFdZZFhjU3dKakd4M3c2azNuejdUdmd6azkwRnRy?=
 =?utf-8?B?cG5OOVl4MjhKYjIvZmRlVnlqbTMzZVFvcjJJM2x2QlpOTHhJdzgvNWtoYldW?=
 =?utf-8?B?SjE0T2dBTW1OK1ZwUXV2Vm91bkt1RFNLMlJhSWJYbHR5WFE1dzlPSzJuN1E3?=
 =?utf-8?B?eEVxSVpISkpRNWUyY3MwU1lUbzVRaVA5TlZoUE90by92blljNzVmN1UydTVL?=
 =?utf-8?B?TnUvYzNRNEdXUEM0aHh4b1JKQWNrUVptRXl2Qng0djBaYTZobUV3eWhhVW4z?=
 =?utf-8?B?RERGSlpqNVd0a0lMZGo2R2dsc3lXRDRpNFN2WHlnWlRJVWV2SzZIU3BYTFA5?=
 =?utf-8?B?Ym5vTlE4UjlHV1JjNGUwWGtyMTRMWm9LaUdDSGdwN0ZuNnFxMXZWSllmNFkx?=
 =?utf-8?B?SFU3TzEwTkM5OWduSnBXb280ekJuR2U1NkV0U2M3NFk3ZDNWdkgzUi95YytE?=
 =?utf-8?B?Uzg5RERiSVZEQnJ0WFhwR1c0bGJCUjBGelovZTMxMW5DWVl2WDBocnFMRktP?=
 =?utf-8?B?YXVUTjR4dWw3MUwwS3g1WG9TS0JSSnFQSmFsMG11T2lBa1Y4Yk1WSzZ3a0Rs?=
 =?utf-8?B?Zm5Wa29lNkZKRDJiNk5VcG1TeUV6VmRmQjNxajJlK3dNbFlBSWFHL2NMLzRj?=
 =?utf-8?B?Wm5icGhmN1dnNzFPSmx6Zis2M08vQlJmYnhZNmxuYXdsSW1lMlJXR2psU2s1?=
 =?utf-8?B?MVR6TEZmdlB5d3BKYzZObjgwVFVMVTZwY01obTRPc1ZMaC9xRE1CZ3IyRGZI?=
 =?utf-8?B?TXlGUmtqRVdUcnVKT1FsVG5mS3Q4cUcyZ09GV0U0NU1FSmJBRzFSVkdTc0p6?=
 =?utf-8?B?UkRNWWtrVDdsZGFMYXdrWEcxd0x2NmNveitqbG54dFNmQUV1NXJ5SnI3ZzV5?=
 =?utf-8?B?eExOYy9CZDNWYTNsSWlSTlNPazZDbkRnSWhRTGZtbSthenlBTzY2SFlBMEpn?=
 =?utf-8?B?b3dkNFd5ejQ2NnNUOGQybS9nQjdJVkwrVWhsbURhNWo3K2RpMndWWC9hV1hr?=
 =?utf-8?B?cmU0NG0rVUR6d3FCYjVmZG1ObEMyQWtVR2ZZZS8vL2Vqb3RLZWJmMzBhUGZr?=
 =?utf-8?B?U0hqMWZtZlVSUVRQcnZ5OHlzMUpiN3Znck9ndHF3RnIvWHVoVWxFSkFaZXh6?=
 =?utf-8?B?V0ZkeTEvaUhaWGpTZ0s1M1ByZUhqN3BRQW1RbW1JdjRyanpVMUx3MWp6VTVw?=
 =?utf-8?B?Tm1WTUFPaWpaNVNYYmRROXBNckQzdlQreHlYWDJpT0hUb2dVMzZYRTN1ZlFq?=
 =?utf-8?B?M3A4d09NeW12M1dhaVJxOHQ1WmhtMCsxUndYU3RKODJEV2Nsc1RRT0VOdEI3?=
 =?utf-8?B?cFpJaHo4Qk5CeUxSeHNJM2JhK01TVlRqQXNGL25IT2JoYlVUaEhyUlpNQ0hP?=
 =?utf-8?B?ZFl6aUxlK3VKbkZMaHJ3Y2N0cWVHSEZQeU9NbkNQbW5xd29IWFdlWmRkemhT?=
 =?utf-8?B?NEdJa3FmT2p0dHVpbnVacVk5VnhMbVNwVDMrVEI3VXIvbzRJbWd1Ym15TVNJ?=
 =?utf-8?B?YzJ6V1lhdFVHZW1ZSHhlNFVCOEp2ci9qMS82bU1RNXNxN1p0cUFvV2lySVJ5?=
 =?utf-8?B?K2tJT2JUVDV5aTZycUcyRENYdkpGY1ZkWml2K2g1cWlPRWRuSWU5WFVLck00?=
 =?utf-8?B?S0JTUGU5bE54KzYwU2tqRU1vc2VKcVhQaVVyR0prM2xicDRNa0tCRnJrNmFp?=
 =?utf-8?B?dGp1WTZKUzVBeTBaaWRZeFRndnB1TWFXcXJoVXFnWEVUcnZOM3RRMUV5Lzhu?=
 =?utf-8?B?Q1dLWGI0dkc5OW9vL0kzYzJtZEtFRU5xT21naURKYlM3NllXbmRESlNhaDVR?=
 =?utf-8?B?cGZ2L3JOMFdmRk9IMlE1Z3lHeUcwTEMrczZ4a1hmemo1akVmN3JXemtzM1pU?=
 =?utf-8?B?OVA4V29IaHN6NTBQNVpkNXlzbVd1RnZRQVkwLzA2RE4vWUZsbmdIMDdiVHFB?=
 =?utf-8?B?YUVNUWhoQzlwcTkxVVNoTW51Z1Nxc1RuUVYxR00xT3BlTjFEOGNKcHI3NXB6?=
 =?utf-8?B?QUgwOTFURGtGMll2K0tTRW5mRFUwQ2RNd2RVVThOVFl5SkFPV0k3SndoSXoz?=
 =?utf-8?B?V3c3amZNeDdBeUdodnBRcnQvQ1l5ZmZzR0pIYTBxVjkzTlp1cnVGZ0ROTmhZ?=
 =?utf-8?B?eXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0acc17b8-2e9b-4921-dda6-08dd1ab992b1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 14:30:49.1124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XFEb6im1OUOYdXJrX6Ei+MrwhZz5s3dYDiS2j5KOL+Ze8rKoLm0luZBKpIg5d7GzMltKiML8jOpBuI720Q80CjFzdMau+eM/FTl2B/OMTRo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7396
X-Proofpoint-GUID: xrUHdL_0hTX2MYm7jNl6C-MpwHCBeBt7
X-Proofpoint-ORIG-GUID: xrUHdL_0hTX2MYm7jNl6C-MpwHCBeBt7
X-Authority-Analysis: v=2.4 cv=Y/UCsgeN c=1 sm=1 tr=0 ts=675af3a0 cx=c_pps a=GoGv2RwMe+/7w9MjyR+VRg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=QkpFdd30EMMon_xh91kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-12_09,2024-12-12_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 mlxscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2412120104
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4BCBfSqx021076
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 14:31:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208647

From: Yash Shinde <Yash.Shinde@windriver.com>

A buffer overflow vulnerability exists in GNU Binutils=E2=80=99 objdump u=
tility
when processing tekhex format files. The vulnerability occurs in the
Binary File Descriptor (BFD) library=E2=80=99s tekhex parser during forma=
t identification.
Specifically, the issue manifests when attempting to read 8 bytes at an a=
ddress
that precedes the global variable =E2=80=98_bfd_std_section=E2=80=99, res=
ulting in an out-of-bounds read.

Backport a patch from upstream to fix CVE-2024-53589.
Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.g=
it;a=3Dcommitdiff;h=3De0323071916878e0634a6e24d8250e4faff67e88]

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 .../binutils/binutils-2.43.1.inc              |  1 +
 .../binutils/0015-CVE-2024-53589.patch        | 92 +++++++++++++++++++
 2 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0015-CVE-2024=
-53589.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.43.1.inc b/meta/re=
cipes-devtools/binutils/binutils-2.43.1.inc
index f472631932..4a8666b433 100644
--- a/meta/recipes-devtools/binutils/binutils-2.43.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.43.1.inc
@@ -35,5 +35,6 @@ SRC_URI =3D "\
      file://0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.pa=
tch \
      file://0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.pa=
tch \
      file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.pa=
tch \
+     file://0015-CVE-2024-53589.patch \
 "
 S  =3D "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0015-CVE-2024-53589.=
patch b/meta/recipes-devtools/binutils/binutils/0015-CVE-2024-53589.patch
new file mode 100644
index 0000000000..380112a3ba
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0015-CVE-2024-53589.patch
@@ -0,0 +1,92 @@
+Author: Alan Modra <amodra@gmail.com>
+Date:   Mon Nov 11 10:24:09 2024 +1030
+
+    Re: tekhex object file output fixes
+
+    Commit 8b5a212495 supported *ABS* symbols by allowing "section" to b=
e
+    bfd_abs_section, but bfd_abs_section needs to be treated specially.
+    In particular, bfd_get_next_section_by_name (.., bfd_abs_section_ptr=
)
+    is invalid.
+
+            PR 32347
+            * tekhex.c (first_phase): Guard against modification of
+            _bfd_std_section[] entries.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.=
git;a=3Dcommitdiff;h=3De0323071916878e0634a6e24d8250e4faff67e88]
+CVE: CVE-2024-53589
+
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+
+diff --git a/bfd/tekhex.c b/bfd/tekhex.c
+index aea2ebb23df..b305c1f96f1 100644
+--- a/bfd/tekhex.c
++++ b/bfd/tekhex.c
+@@ -361,6 +361,7 @@ first_phase (bfd *abfd, int type, char *src, char * =
src_end)
+ {
+   asection *section, *alt_section;
+   unsigned int len;
++  bfd_vma addr;
+   bfd_vma val;
+   char sym[17];			/* A symbol can only be 16chars long.  */
+
+@@ -368,20 +369,16 @@ first_phase (bfd *abfd, int type, char *src, char =
* src_end)
+     {
+     case '6':
+       /* Data record - read it and store it.  */
+-      {
+-	bfd_vma addr;
+-
+-	if (!getvalue (&src, &addr, src_end))
+-	  return false;
+-
+-	while (*src && src < src_end - 1)
+-	  {
+-	    insert_byte (abfd, HEX (src), addr);
+-	    src +=3D 2;
+-	    addr++;
+-	  }
+-	return true;
+-      }
++      if (!getvalue (&src, &addr, src_end))
++       return false;
++
++      while (*src && src < src_end - 1)
++       {
++         insert_byte (abfd, HEX (src), addr);
++         src +=3D 2;
++         addr++;
++       }
++      return true;
+
+     case '3':
+       /* Symbol record, read the segment.  */
+@@ -406,13 +403,16 @@ first_phase (bfd *abfd, int type, char *src, char =
* src_end)
+	    {
+	    case '1':		/* Section range.  */
+	      src++;
+-	      if (!getvalue (&src, &section->vma, src_end))
++             if (!getvalue (&src, &addr, src_end))
+		return false;
+	      if (!getvalue (&src, &val, src_end))
+		return false;
+-	      if (val < section->vma)
+-		val =3D section->vma;
+-	      section->size =3D val - section->vma;
++             if (bfd_is_const_section (section))
++               break;
++             section->vma =3D addr;
++             if (val < addr)
++               val =3D addr;
++             section->size =3D val - addr;
+	      /* PR 17512: file: objdump-s-endless-loop.tekhex.
+		 Check for overlarge section sizes.  */
+	      if (section->size & 0x80000000)
+@@ -455,6 +455,8 @@ first_phase (bfd *abfd, int type, char *src, char * =
src_end)
+		  new_symbol->symbol.flags =3D BSF_LOCAL;
+		if (stype =3D=3D '2' || stype =3D=3D '6')
+		  new_symbol->symbol.section =3D bfd_abs_section_ptr;
++               else if (bfd_is_const_section (section))
++                 ;
+		else if (stype =3D=3D '3' || stype =3D=3D '7')
+		  {
+		    if ((section->flags & SEC_DATA) =3D=3D 0)
--=20
2.43.0


