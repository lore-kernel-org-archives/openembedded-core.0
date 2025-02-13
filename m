Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7D7AC021A0
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 02:09:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2173.1739412569351431351
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 18:09:29 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4139445ff2=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51D1wfMV014802
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 18:09:28 -0800
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2042.outbound.protection.outlook.com [104.47.56.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44qwy6jf95-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 18:09:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I7cbE/TIlPQZnooc+BQ+wzRTwHl3vrqHFBZJqwMPPU0gjWwtQZ7zCpSlnemAgxkDRL2VHRCjGqyGLZ/QaWXeoUf67Zi9ScCvu2BWOHOwqCxTccKBhI/WKk3Lgx4KlK4PmP7sIuhFYNPZ+5WwmvaKfL+9NY/mzKi3ijHux+b+vEqAKKlQ0ty0mXkkABB1PLVgRY6oigisMS1yfhgrf5DdcCk7sLOX11n/TZ1kuL5a/ej4pr3FQffJtyLOpPoigqCZ5B81qSBLH8sfKVQTCLL/Ke0wMafrx2yhnkXX/1pGK4orFEFuIjxDJDh824ZttEQrM5L4nLIVGm9nIdwgI7+mtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VXEX0k0v1SitGDgMK2BeR5uD/j0iYBfh2BQG2eJgKVg=;
 b=bA2S2QAmz9HlODVGHdK6ijjh2Hc82x3G1jeCjFqcHHOs3evvjzEBnu8CNaXpX7LisejFNt20xDUYwj5hYvVRsKQCw/ccxKJedQTdZ+Q+klWCMejsmP5yVVOcHSKDOf0iXktyKjPOd40Xra/YRfKo4snPPaDf/Gh3Nbk8J4gXlUobKC/MGmKYxlETWsYCodg/gfIys8SdDJjzspLje/ZEYLJ1XXqG3RBXBnXQ6MVH3gj/WbiTHmT9kOEF0m0Cg3RPjXskq4rm/8KKazW1rHStrnrZN85iVE9mFcNc6/cI7bkV4+qGFHnDOvdIM4owRh7s5fZXpb9V38Ff3F2FgoiAog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by SJ2PR11MB8539.namprd11.prod.outlook.com (2603:10b6:a03:56e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Thu, 13 Feb
 2025 02:09:24 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%5]) with mapi id 15.20.8445.008; Thu, 13 Feb 2025
 02:09:24 +0000
Message-ID: <e4016f28-f5ce-41dc-9c9a-a2e6d2073be8@windriver.com>
Date: Thu, 13 Feb 2025 10:10:09 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe-core][kirkstone][PATCH 1/1] python3: Treat UID/GID overflow
 as failure
To: openembedded-core@lists.openembedded.org
References: <20250208070605.3478960-1-haixiao.yan.cn@eng.windriver.com>
Content-Language: en-US
From: Haixiao Yan <haixiao.yan.cn@windriver.com>
In-Reply-To: <20250208070605.3478960-1-haixiao.yan.cn@eng.windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::18) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|SJ2PR11MB8539:EE_
X-MS-Office365-Filtering-Correlation-Id: a222a36a-cb03-4ea1-eca0-08dd4bd36f52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|4022899009|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bHVqSCtXOHF2NFlNTEJlSHo1cnQzdjRIUlo4QndtRGpUVlRMMkVIWUFvK1pE?=
 =?utf-8?B?d1o5SEZqZ0FpMUV1R1plVHFsQ3N5Z1RXOXhkcko0QUM4MStRTE53Z3UrUjNT?=
 =?utf-8?B?RG1DbGdvakhyQldVcEdZMmk4TzVVTlQ5UFBONklKSWthTzhhQ3lGcVZObzhE?=
 =?utf-8?B?Z2VWMncyeDZnSElrRkdZSWJZeEltenNsREN3ZGs1Qk04MEQ4S1IrNWxPSVkx?=
 =?utf-8?B?aFlhUktVNGtVbW9waWFQc1QxREp2TDBvWFRRUEh2REVqSnhHYzJXUGZJV2l6?=
 =?utf-8?B?YjZpT25POTM4MmdCMnV2MHJEc25yaFJIN2RFS1JmaXUxS2R4Qkl5b0FBcEEw?=
 =?utf-8?B?dzhhUDYxbFlPZHpkdy81bndTZzJ4U2FJRzFXeUFtZWN1K2pHK0paMEpoT3g5?=
 =?utf-8?B?SE5ES0tXWW1lMHB0V2NOaU9PaWF2T0JnSHZDVEw4b2NsWnh6TkQ4TGtEaFRX?=
 =?utf-8?B?cW5aV2ZVTnJGT1A1dllzdkZCcWpWVkxBd2x0NUpZYnh6RHVGc3RhdEI4NTl0?=
 =?utf-8?B?MDMzcXM4YzdhU2s3UmJROUpFOGlKbFlUbFkwSGRTbU9aZ29TcVNKVHB0TStL?=
 =?utf-8?B?SzdIcmpZWUczbThGendHYzNzN3J2K2Z5eG1DV004T29rVThlMUF2bkFWbXpo?=
 =?utf-8?B?eVZWM1VxNXFqMDJ3Rlpycisxb2QvOXNMMkRNR3lRY1V2ZkM1Q2x6MFNJQXJF?=
 =?utf-8?B?THNyVkQ5R2tqQ0JoeDRLdkRNMFIzaE42ZDhxRWY1RVpMQmp1WnBNYmRFN3g1?=
 =?utf-8?B?SVhKSWJCZ3MzYTlHZzJHWkQ1d0RNQ3FUZFMrVGJCcDZHMlNoRGh5NXZ3ZVBm?=
 =?utf-8?B?VnpMWDh5OHpBOThEYlpJMjVna1BtYzhXZHZmK2VaQ3oxY2xCbEFqb3B1Vjcv?=
 =?utf-8?B?cTA4NHY4aWZkV1dGMHFjdFBDSmlGQUc0ZGh1WDhuSVJBS0ZDUjR5SjZXdkJx?=
 =?utf-8?B?YURXOUVGVHNzWTFHQ3RLNmtoTTNnTFpSVnIxWnMvdkNBRzhmTlg0T0U0d00z?=
 =?utf-8?B?QWlvMzc1dWJUa3hBMEtHUkNUUkhDRnlDUk5icW0vcnFZTzN0VnJ0YnlVQ2xB?=
 =?utf-8?B?WTVNN0NLcTFCTGE5M3B5Q0pWcnJPeDVZc2hSREhmdFB4T2UxeXhKQ0Nxak1I?=
 =?utf-8?B?VUR4dmY5R2tiME0zRFVwZmtVV3VTL2ZoV3hSKzNHdXpPWUljL1NjZzNvRk9k?=
 =?utf-8?B?U3Vja0syb1oyNjRxdVhTeU9tR2hhVEdHSDliM3RyYksxdmRISVpDYmFaUGZa?=
 =?utf-8?B?YzcrSkt4anB4eHdST0trOWNpM1ZKRmNwYTNZL0N2d1doNEpJcW9CNnJTUHlH?=
 =?utf-8?B?eVM1Zjk3dUpsOGRCQVJJZmxWRFRGamdvcXErS0RmNy9NblpsQnNsa2NRbWJr?=
 =?utf-8?B?OWJxV0w3M3dCbHNWRXVYZVVSRDJiT1doUE9BWkI5dUlYYnhxL2VsTUNseDVy?=
 =?utf-8?B?K1VxRmhGQ0FSNEJLZWZrK3VuQlUwempwWDh2clV5eGthLy8zMnhWUmFqamV1?=
 =?utf-8?B?NTQzYkk0Nk5TVFNidlFKTzY4Ym5VR00zT1o2UW5UTXB5YzlycFB2RzJkZGpM?=
 =?utf-8?B?Ym95blNNZVY5Nzk1ZTcrY1l1N00weFdtbS9qTEo2SE9lbHo2SklaNnY0NmQv?=
 =?utf-8?B?STFVRHdkc3YrMmVnYkduU2k2aXNIVUtSamhSOWQ3dmJITlRRa0dSTFNQVDJj?=
 =?utf-8?B?cDgvUTQwOHR5bjcvYVVQYVE5ZG51YzRKZzdEUlc3cXd5UFlDZlJWOUwwS3dj?=
 =?utf-8?B?RDQrVFFwMkRmczRVcWx3RXJlR3JLM1lsQU9oM1ZBQkJ2M2w5Qi96VE8vY0dF?=
 =?utf-8?B?Wkh5SHRnVjE2L3R4RW4rQT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(4022899009)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OVdLRmJvZWo4RHN1RDhmTDNDSHgxZjJxTWFLcFlnL2RuWUFvaVhMdTdQeC9m?=
 =?utf-8?B?dmRCNmhDRWRYVzZjdGk5M29JQzY4YVNIdWpiZEMzWjhEeVQ1dTdiS25UbTBZ?=
 =?utf-8?B?dUR3M05DdFl2NE1XUkxVekY3NTN2UGh4NU9iL3pNWW1vYlg1dER6UXZRV0hv?=
 =?utf-8?B?UGV1VlR6UUVqdEsxR3I4L1NlMS9KU3N1azhiNG1kVC9VcjNQRThCOUxlTlhI?=
 =?utf-8?B?YWJJV2hhSEJCa0dvL2E5dzVtRGUyd2toRGZEdHBGNE4xd1A5RXl6ZTNDSXlo?=
 =?utf-8?B?Z2V1RnRibXE3b24yWTFiV1Ftc25Tak43ZHVVQTBZemJ5cXl4aG50T1JSWEwx?=
 =?utf-8?B?ZG0wanJyYW5PakE2VzdyOXhaME1jM0dqT1lTMkdVeGluME9oM010VDB0aC8w?=
 =?utf-8?B?WmxvMVdoVmVGdGJ4a2lxS0dSSUlieTF1WHRjZWxDN3BLWTdzRDVOMldjS1FQ?=
 =?utf-8?B?Q3FHazRiTDRGbnNXWWgrMmVMWGlQdWR3MXM0dDZ6SGJkd1Q2U0ViL3NtNGRZ?=
 =?utf-8?B?ajFJLytPb2FleUdxMkxZNWhVL01rNUJQd1hoUVJaSmhWTytUUm55ZTl5VHlW?=
 =?utf-8?B?d2pTZm1rMUR3Rzl3TVFLMWNQM2ZOVWdXUUJBeW50ZmFlRlFDT0tDQm40dU5u?=
 =?utf-8?B?VkRGMXkydnhZdjhkN1J5am1xdklWSkp0N29tdC9mbWxtbXROV2VvKzNoZlZy?=
 =?utf-8?B?UlFBakJrZGo2NXlnUDBXdjd1d0dZRkc4aG1kL2tDWTh6a2dCMDdHdkJiTElj?=
 =?utf-8?B?REp1U3BSeGFzZ2Z2MzJDUXRxUmVZUG5CTXg3K1NDdzgybmRQMEgxdVRrNEVB?=
 =?utf-8?B?RHFpNWplOE5XWXZBQlZkNUlscU9TT2tUYmFIbmFEYnIyUDdkcTRCcWY2aDJm?=
 =?utf-8?B?Rlg2WStFQ25ObUNSWkx2Z0xWd1FFYkQ2ZEVoLzdlK3FKdHVnTnhOVm50Y3FL?=
 =?utf-8?B?NE9aR0I5eS82QW91MVZMMUh0aEs3Ykd3TFhtZzNqWHlFYjhHNkU5YW5veHpm?=
 =?utf-8?B?VXJWbUlkZkNGOTVBcDJPazRpSnlmYzJ4R1E1K1FCRUJERU50a1dNOVNLK3Jx?=
 =?utf-8?B?UTlVVis4aVg2Y2M2WmZHUy9CaDhlK2hhd1AySnZNVnc2NXQ4bHJ5aUtDcHl2?=
 =?utf-8?B?VFpvK1JnOGtmU3RsR3pFUlUzck1aQTQzbS9iT2xPV25NVXplR08xNEpsVGF6?=
 =?utf-8?B?U3A4NTZvVHpKQ1g1QkQyUzVKczNwTWg3UUYyYnBlem1SQlhmNEhqYzEyMUtW?=
 =?utf-8?B?VGlNbThwWCthV21FMjRDQUhMd3M5YTdFS21vOGFWS0lwWGE2blBiYklxaFdK?=
 =?utf-8?B?ZldObVYvMzM5aytPbktoMXZlenBRNHBSNlBIZjM0Y2tZVUR2Nm13K096azVM?=
 =?utf-8?B?azdndk5LNTlyeHJ3MTVxOXcvRmwxV1l3dVd6S1dnOENQRXdHVjZZb3FBOTk2?=
 =?utf-8?B?R2Q1cDdlTExlRFJ6M1o4bmt6Qm1ickNUVjN4WWZ6NzNCZTFzdkJQRXk0MWZT?=
 =?utf-8?B?ZG43anozWVZBbHhCRHdLNzJUUkZVYk1tbE1JZldxS2VUenp6a290UTRRRlZN?=
 =?utf-8?B?SHlManpPV0drbEpmRWVVRTR5U29HWjZoQWpTc1pHM2tQdnZqQ1lmbDVqMG03?=
 =?utf-8?B?ajFFall6dmFTS3VmWEg0cUo4U3B6TW5waGJtbCtmZk5vdW5KUHVFWGRKNGxq?=
 =?utf-8?B?dTUvUUR5V216Z3JleXZxeTFhWW5pQWlXa1JoYVFqSDM3MUJkVk52bnR6WXd1?=
 =?utf-8?B?YnVtSG5hSzlIa1BJclZyQjlNZXV0SXcvN2JQM0dhSjJLZzJvWXNybjZiWnJK?=
 =?utf-8?B?eWZiL1JUZVR4L1FlemtmY2FHQXluMXJjWVdTLzhKOUlrOUZFcm1lMmE4K051?=
 =?utf-8?B?ZC9uc2ErU2loVGhQYk1EalU1RnhBNlFvNEVISFhTRWZKVzFZMFBielB1ZXl3?=
 =?utf-8?B?R1VPWXVSaHgxcXM3ZTN5L1k5THhWK1pyR1d0NlR2eG1LSFpkcHIrTEVyeEMz?=
 =?utf-8?B?R2J2dnkwU1JBSy9xejB1VFlBZkVTTjdQOGVySnhMUXNndEd4Njk0Q0psODNl?=
 =?utf-8?B?cDU4UERGOTlibk5vZzhXcHVUM2h1c3Q1ZmxzQmxmZzFEVUhoYWlhUEQyYXIr?=
 =?utf-8?B?UGpPUFhpeVlGYVM3Mm5oUTVJczJveHNqR2RlTmhrR3lsaTBuMzQ1QjB3eG50?=
 =?utf-8?B?OVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a222a36a-cb03-4ea1-eca0-08dd4bd36f52
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 02:09:23.8731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 44kQxGfsauqmLNUC6JDZy5oDMjI4GG9mTnbcb/M7x9C6rzhCM+QUOn5uLCdFs4qv7GzEWVVzXsS05rJWg2gn9fUfcWTrc7/iDyW3BYIV4og=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8539
X-Proofpoint-GUID: pV59z_CekfXz7tmkR4DAFffaAhg2Pugm
X-Proofpoint-ORIG-GUID: pV59z_CekfXz7tmkR4DAFffaAhg2Pugm
X-Authority-Analysis: v=2.4 cv=G8nmE8k5 c=1 sm=1 tr=0 ts=67ad5458 cx=c_pps a=ruI+LRy+bJmAUyIDade2ZQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=bRTqI5nwn0kA:10
 a=NEAV23lmAAAA:8 a=8AHkEIZyAAAA:8 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8 a=NuuKlkaXgWcN9jnCWxMA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_08,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=728 malwarescore=0
 impostorscore=0 spamscore=0 mlxscore=0 suspectscore=0 bulkscore=0
 phishscore=0 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502130014
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 02:09:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211285

Pls ignore this patch.

Upstream-Status: Backport [https://github.com/python/cpython/pull/108369] need to be update.

Thanks,
Haixiao

On 2025/2/8 15:06, haixiao.yan.cn via lists.openembedded.org wrote:
> From: Khem Raj <raj.khem@gmail.com>
>
> This fixes ptest failures on 32bit architectures
>
> AssertionError:
> Failed ptests:
> {'python3': ['test_extractall_none_gid',
>               'test_extractall_none_gname',
>               'test_extractall_none_mode',
>               'test_extractall_none_mtime',
>               'test_extractall_none_uid',
>               'test_extractall_none_uname',
>               'setUpClass',
>               'python3']}
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 43104b547cb79693c83df0882773ae8dd74b1d35)
> Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
> ---
>   ...e-treat-overflow-in-UID-GID-as-failu.patch | 40 +++++++++++++++++++
>   .../python/python3_3.10.16.bb                 |  1 +
>   2 files changed, 41 insertions(+)
>   create mode 100644 meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch
>
> diff --git a/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch b/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch
> new file mode 100644
> index 000000000000..88b84c602435
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch
> @@ -0,0 +1,40 @@
> +From 999d4e74d34afa233ad8ad0c70b989d77a21957f Mon Sep 17 00:00:00 2001
> +From: Petr Viktorin <encukou@gmail.com>
> +Date: Wed, 23 Aug 2023 20:00:07 +0200
> +Subject: [PATCH] gh-107811: tarfile: treat overflow in UID/GID as failure to
> + set it (#108369)
> +
> +Upstream-Status: Backport [https://github.com/python/cpython/pull/108369]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + Lib/tarfile.py                                                 | 3 ++-
> + .../Library/2023-08-23-17-34-39.gh-issue-107811.3Fng72.rst     | 3 +++
> + 2 files changed, 5 insertions(+), 1 deletion(-)
> + create mode 100644 Misc/NEWS.d/next/Library/2023-08-23-17-34-39.gh-issue-107811.3Fng72.rst
> +
> +diff --git a/Lib/tarfile.py b/Lib/tarfile.py
> +index 3bbbcaa..473167d 100755
> +--- a/Lib/tarfile.py
> ++++ b/Lib/tarfile.py
> +@@ -2557,7 +2557,8 @@ class TarFile(object):
> +                     os.lchown(targetpath, u, g)
> +                 else:
> +                     os.chown(targetpath, u, g)
> +-            except OSError as e:
> ++            except (OSError, OverflowError) as e:
> ++                # OverflowError can be raised if an ID doesn't fit in `id_t`
> +                 raise ExtractError("could not change owner") from e
> +
> +     def chmod(self, tarinfo, targetpath):
> +diff --git a/Misc/NEWS.d/next/Library/2023-08-23-17-34-39.gh-issue-107811.3Fng72.rst b/Misc/NEWS.d/next/Library/2023-08-23-17-34-39.gh-issue-107811.3Fng72.rst
> +new file mode 100644
> +index 0000000..ffca413
> +--- /dev/null
> ++++ b/Misc/NEWS.d/next/Library/2023-08-23-17-34-39.gh-issue-107811.3Fng72.rst
> +@@ -0,0 +1,3 @@
> ++:mod:`tarfile`: extraction of members with overly large UID or GID (e.g. on
> ++an OS with 32-bit :c:type:`!id_t`) now fails in the same way as failing to
> ++set the ID.
> +--
> +2.45.0
> +
> diff --git a/meta/recipes-devtools/python/python3_3.10.16.bb b/meta/recipes-devtools/python/python3_3.10.16.bb
> index 19a85a8770c4..48f845b0891a 100644
> --- a/meta/recipes-devtools/python/python3_3.10.16.bb
> +++ b/meta/recipes-devtools/python/python3_3.10.16.bb
> @@ -36,6 +36,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
>              file://deterministic_imports.patch \
>              file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
>              file://0001-test_storlines-skip-due-to-load-variability.patch \
> +           file://0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch \
>              "
>   
>   SRC_URI:append:class-native = " \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#211019): https://lists.openembedded.org/g/openembedded-core/message/211019
> Mute This Topic: https://lists.openembedded.org/mt/111067807/8599992
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Haixiao.Yan.CN@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

