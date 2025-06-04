Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58650C5B555
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 09:06:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.12013.1749027969665175036
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 02:06:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=82504e28f8=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55427bki023528
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Jun 2025 02:06:09 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rt7u3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 02:06:08 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55490pRR025052
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Jun 2025 02:06:08 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2053.outbound.protection.outlook.com [40.107.243.53])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rt7u2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 02:06:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n9bo+bWpR9+RLaQmXQNUhmMiR3h41kh+/egWwQMqdFizjFWeFd4i0a4S4n+s1VLRZUCRvYhnpxIQzACQ1h34BOHqV2nzfpTR4Y6mGGEYfm5Zo3rbxU8V7QC53biKoNfIRQqd2Uio33mw4Qvd6VHX5OZ7uoteNlctzvvvXRgBBMiyfQQalm5D5jiZpHcIT/n3TJxJwwqOEny3+zCW5pbS/X2dtQ0fLshKoJCieaKi7gwMrw5mhqygRcDhQVfut05/Dz7q5/Aeqo6vbpl6021DkVHbWCrO/f29yUwPPe+OpLPfvnilySbV2svOYBkNIULp8VRwonVQ1QBOqKfRa/ygrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0hMT20J/FclgQ4vXC54MZTgcNDo+SEKhW6/CLtQWwnY=;
 b=ai6VOsK9EUuj4/+ZjUQjM4VDYsSr0huW5oN0ClTlJb9jevobpNQHO9te6CtI1xjW8lNgIm54cUmJjcbvp+ZA3WZNL0ODOq1sAFyJ4xFAxgD85JQ4pIo5KLBOn68hMfOHpxa3NHCWaNbktnTv6bVPktW0qhQPxCu0ByPx5SNTCG0r7UzmDM1F+bCyM+N1osb5r2evM7QjcAtx+ux29iEkn7QBjngPZ5rU0+MP3B7OBgmhnkEVRlFtMQbCQGXagsw0jZwpVL1Vy+907eFnOi4zZ+keV1h0yid8Nqa8YRsKH9O0iJXng8A0MHtUlJn7szFTtwXuIWN8IRR9wp+/muaB0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA4PR11MB9105.namprd11.prod.outlook.com (2603:10b6:208:564::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 4 Jun
 2025 09:06:06 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%3]) with mapi id 15.20.8813.018; Wed, 4 Jun 2025
 09:06:06 +0000
Message-ID: <2af52c3c-9a52-497c-9d82-28e97d4d0efe@windriver.com>
Date: Wed, 4 Jun 2025 17:05:53 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] util-linux: fix ptest failure for musl
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <20250603071720.2055740-1-Qi.Chen@windriver.com>
 <56e70695-1d21-47cb-81d5-8adc68348550@gmail.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <56e70695-1d21-47cb-81d5-8adc68348550@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCPR01CA0079.jpnprd01.prod.outlook.com
 (2603:1096:405:3::19) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|IA4PR11MB9105:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c2ff1c8-94ea-4a28-4e73-08dda34709d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bnN4cEszS0ZpdUFsVitzOW5IdDQvYm45QlBaVEdRQ1o2aVRsSGJWSldGdU45?=
 =?utf-8?B?RW5WcUVxc0R5bmU1VkhlV1M1N2hCc0RmcHRxK2NMeGJwMU9VTkdaVzVmVEs3?=
 =?utf-8?B?cXFWa1JaYWJZVlNFdVFvR1dYL0JxRVVKNHE3VjlFeUUyT1lRQ2tuVGJKS2Rn?=
 =?utf-8?B?dDRudExPdzVWQ1BJK3FsUWdOaWV5ME56MTdDV2k2SFJyUldBaUdWSDc1MmQv?=
 =?utf-8?B?RmpJODdjZ0lablQxRzl2ZlhqZWxzMjJQRmRmbEh2QjIxRVJsUlZjRmVIMU9s?=
 =?utf-8?B?U09JTEwyUURPU1ZXYVBIQjhEMmRtNWVzaGMrSmJ2dGN6cTZUeTR4ZGpmWmlm?=
 =?utf-8?B?Q05vQ3NqUTIyeUlxZEdMekNJN0JQTnBZbTBzTThwM3daV2ZlWkJDd3dLL3Vs?=
 =?utf-8?B?c0F4RFVzZTI2TDBZNFRnbnB5ZkxCT0ZmZHFKcU80RDh2S2wrR0JLdHpvY1hj?=
 =?utf-8?B?QS9oUXB5QlJmN3plcGxkdWthdlpIZlV6T2lVWktleEFoWTVGT2pGdnV6NUh1?=
 =?utf-8?B?T3hqcllXSFZzS2l5b05rK2NqclUyM0g4SnY3eklYVFg5bnlLbHpsU2dXYUhz?=
 =?utf-8?B?cUlyOTJYTm5MSzlaMnNGMGdDMXRCbXMxc001T1orRDRQd1RSeGNhT29JeUdX?=
 =?utf-8?B?bTh4aFozbFkzSlZJZFN4YUNuMk5ZSmZyczJPMjBvR2FSUzRvRWNpakMvL1dj?=
 =?utf-8?B?MHNyWVREY0hTclpPL3J3VmZ2eFlXcTlvQlR1QTBONDdibWtBNm44UnNQYWpX?=
 =?utf-8?B?RUpNTklGWG9UWkV3VjJmRlhnQkhHb2ZCdklTV0Z5TktOR3N5dkRrQ0VMM2Fa?=
 =?utf-8?B?RWhHbWY1UUFjQjhCT0tZU2R2N2MxdE9nRTk5QnNsZU5qdzgrK1NMVXlTWXZ5?=
 =?utf-8?B?K0JWOXJndFNKOXNCZzdHaXJYVURJWkNpZFA3T3QxTkI5Rlc5UkRjL1VVTTFI?=
 =?utf-8?B?Rit5aFA0N09qVXBGM04zY3RlUWRaVktMODdJUk5BUmtVdmZVR0xlR3Q1Z0Zz?=
 =?utf-8?B?L3lmcDZrSkY2bFlxVWhtNHk3dGFYNHZYRStNbllnbmVoWWpwckFLYjBacGxJ?=
 =?utf-8?B?N280bEtqTzZrMHFNS1F5NndEN2hSSE40Zm40cWdmekVjL043SlBWOVZmNTEr?=
 =?utf-8?B?NXdHNW53RUVqOFpmWFpybFBWQ08zTjFyMUNiNnR0Z2FYa20vc2pkWWFod01R?=
 =?utf-8?B?WW95MjFJcVpEMEVPSXZLdXhYeEo1Z28zcHZlZmxrQkwyR0Vnb09lYnlGN0Iz?=
 =?utf-8?B?Nk5GK0trV2RYdWhSMmpGR1d6bU5sNUxLM2poUmVocUtsVENyQkRlVVY0SWhC?=
 =?utf-8?B?QWpWT25WbllENVNDY2VtTGhnTXI1SFBjWE15b0Q0bnE1S2tXc0NuYXBFU2o5?=
 =?utf-8?B?azJ0RWpITjA0dklDYW9OTzlwT01FSlNKV280N0dTR0EyOGk4M0kyZ1VVQ09s?=
 =?utf-8?B?VzlJVWhnKzZ3c0U2Z29IZTZaV1JySEYycEFYeksxZjAzcDdPVzV5QUIrMEZh?=
 =?utf-8?B?UmlqU2VVeGdrK0xwcnZRUEE3UDFqa3JId244MHN6Y1drRUpXcWp5bUIyY1A0?=
 =?utf-8?B?L1ZlczZNd0FwWkVnWVU3ZVdZelRjMEhKTlhyWFZlYUpJTVBYazR2SHVxdno5?=
 =?utf-8?B?ZFR3aDIwa2ZacDFib2lvckQ2Ymp2NGJPSnZoczg4MlN2cjFaRkJ2RDhqbEZr?=
 =?utf-8?B?NTVhS2tSNGkxMkVzb1lzZlhkK3doRWxzNWNFT2pDQXNMdmd2UjFlaVBTR21T?=
 =?utf-8?B?c0dhREhyZXdQVUNvRVVTeWliSHlMeDd2cDNRYTdHYWVlV2svak5SWFhwN0du?=
 =?utf-8?Q?d2z58tJsAcgBvhijzaQXgZEkw9D5JyxolW1BY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(4022899009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bGEyQ1ZoVllsNGZLb1hJdHB3ZmZWemVpZ0s0VzZiWEc3UWNxVmd3ZzFlME5u?=
 =?utf-8?B?Z0FsOXUwOEFIM0FZVkhPTjQweVgxUndGMlJXUnRLeCtpVXdYTTBYZWdaSmFF?=
 =?utf-8?B?MzkzWFhPeWd2dnQwWmVVeEt0OHVUSnJibzRjQkJQbkd6OU91Umhab3I4ZWYz?=
 =?utf-8?B?VEg4TUN1OXVuMzgwT1Fmd1R0NEY1V3piakV5WTRvQXhNbWU0VnZ2ek1RRmRG?=
 =?utf-8?B?c1N6dkJFODdoOStlbzE3MUVoMmFodzlhNStQdU1jTlNpdFVTRE1LaS9IdG9W?=
 =?utf-8?B?OExiT0VmcnpMMTRWS2JweitpaEprcXJDOEU4L0dJUzBIN1BFZG1DdXYrU0Ir?=
 =?utf-8?B?V2tyWThJZlF1Z3VpMXFPZ09WalQ5ckU3R1cvL3czUXZLQkZjb21xREc4Skw1?=
 =?utf-8?B?OTNSZFRib1FmZk1WNXBQcEcwMzBwalc0UVBGdkNBa1B1UnFiOUVYWGJqcXlp?=
 =?utf-8?B?WHlrTVZMZHhSa2FWTTNxUnpaYVdKRlBhQlg2VjZ3R3o5empYOVdvOEwxUm1j?=
 =?utf-8?B?NkQ1OWV6OFhzU0ZCTVFFQUNnZHk1aUNLaXJGYUpDcDVXa0k5aStvVzJNSUZY?=
 =?utf-8?B?Z2FYRjZMMHJmeHFyZ3d2cVdLUW9SSm1EU2NqcHUveVI0a3pVRHE0YVhEWXRV?=
 =?utf-8?B?NG52emMralJRelZMbGcwOG51QjNmR2xUMTBZTy9KK0IrYmRQZCt5b1NzYVp2?=
 =?utf-8?B?R0QyajRtbjNZdFZiUWZWRzQzVGRFdnBJWW9HeW1IQ0RBU0NRbnpNTVhkRDky?=
 =?utf-8?B?SUczSVFPWWVTNDRCSFFycTVkbTNLTXZ3NElYdU5WL0NsemxlczFrbFY3bkFq?=
 =?utf-8?B?QkdUVjRSUy9UaEdTNmxPbUovNUxIamx2cHovd00wS2lKVWlqVlBpN3lXYWpB?=
 =?utf-8?B?d0xSZWh2L2ZkVmNYUCthTTdtelhDekhjM2pGU2dXRjZHTmpLVXNKcTJVd08v?=
 =?utf-8?B?dGo3L1VVMnpFeXRIalUyaDJROFJWa29lYnVLM1NMdmxWYmUrRnZLRHc3SXJG?=
 =?utf-8?B?QXlaeTB4TmNhckhWY0dncjg0Mkh5QnBZczlTUVhaVFk0dmRja2pJbFdHbFJS?=
 =?utf-8?B?bVRIMlRPTWYwdzhMc3dTV3hsU0pJYWptRGREN3ZFWTJvNFJhN1MxM2xwYjZV?=
 =?utf-8?B?QzBrQ01NSy9uUGJTcm51VEJ6Y1F4QmlmRGNRTFYvOHJ1ZXlDNUIzQmhlUjRy?=
 =?utf-8?B?a0phTXovNFBOTldxTXhBRmM3RXIzZllKcXdrV3lBRU9JYWI3WjlhOThSWG1N?=
 =?utf-8?B?ZWRiSGNsTUJHNkxPN2tmcGRxSFVMeTF2UzJDY0YyazRURGpSVXBuTStlVk9z?=
 =?utf-8?B?bDlDM01IcVJQVDY5OUNMU29wamh4S0Q0Z0NnRklnYm52bWlpNmtETjV4dTcv?=
 =?utf-8?B?RmlsNFNneHpyREdlYVVYc3NxU3J5Y25abTBPcy9lT0pBK0NLdDE2S1lZWUM5?=
 =?utf-8?B?dm5WdmU5N3VkaGx5bktGa3ZjNFVzQ0g3WTFqNWJ2TlpSQ2c1QXJzbThUQ0hm?=
 =?utf-8?B?cVlCKytZNGhleGUyL3NkZDhYakh1SFRYbWVHOE5raG1jajRHSllVeitsTUEw?=
 =?utf-8?B?UnZlN1BVdUVhdm9SbmZlTXlOWjFHOW9CSDNUeDJmakprdWVOZlRuaHp6bnB0?=
 =?utf-8?B?NXhtT2Z0Slk0SnVlRk43aEMvbGM0bHZlcHdlVEgvZ2NmMHNKZ0pjdDVUS3RX?=
 =?utf-8?B?Lzd0WUkwYlg1VEpyWStuL1Y0L2tKNlVObU1PWWFXaEcwOFBsQ3pXbFpFTHRu?=
 =?utf-8?B?dDl4cE4zRWxFcGtiQVB4ZVhSbURmT1dzMTVNN1lWaU5iUlNHaFFCcndmMFZo?=
 =?utf-8?B?SkJqQVdDZHpRNVlnYXN2K3JxdFdxOTVFL21PK3V0U3Q2ZHRPVmRUMmhRMHcy?=
 =?utf-8?B?YVF0N0tlQkV6UUo2YVowRDY4eFRLUDA2dktYUjVXbDRiQXUweitxUzRuL3BY?=
 =?utf-8?B?Y3BERlJnK0txUVFPd1hFY2JnNXdWaC8vbUJVTGdEYjNqYVk4bjc2UHFrYWcz?=
 =?utf-8?B?eDN1aGJDYmNRcmljUURoWjdaZHR0OU9FNXJuTld6YWtXQkY3MFdNT25McTF1?=
 =?utf-8?B?S2sxVEtWNFFKTFZlc1JLeldzNVdKQVJtMmVtSGFwL3NMSHEvSklYbmJoYVJ3?=
 =?utf-8?Q?OdY7CyxiohDTdH5t0Z0OfiLAE?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c2ff1c8-94ea-4a28-4e73-08dda34709d1
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 09:06:06.1661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KUAq3RY2eatiMDN02LMQBA7vvR+yB6KBKNn+dRBca4I/CQ1OF2OTFTlsAqCMEKaVDgZZI9ti5GeKAGbtcntgZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9105
X-Proofpoint-GUID: sHPuXJKJ1IdYKBrlV5UaT5fJmwwv_PR-
X-Authority-Analysis: v=2.4 cv=VIHdn8PX c=1 sm=1 tr=0 ts=68400c80 cx=c_pps a=W6EPrjjQM45bXwhc9OBL1g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=CCpqsmhAAAAA:8 a=5KEJ3k9QAAAA:8 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=ep0zVQ5_ciO99FTJshgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ul9cdbp4aOFLsgKbc677:22
 a=olg2BfGzmf2haRflzj8J:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA2OCBTYWx0ZWRfX6VFHRNsX+sFp NDktXPyE1sY7g1NNIqruHrrw6wUho52zVeYyfvPTi8thshEhkj+pBlEnRoqwF0It1XPLBiXpFnx DZhosdf0ywV6n3USVCD6YTxczf+H+IdQ4+3a2jybJXiH1R5FVmXxZdkJ2b1MX7V8QTbq7vKLqqe
 7WkjUIvDjYeM1Y1I0ExOXuXTzlP5lUpj3HF5zzskNssCcIcSUzU+qYfgjiXgNpKQ0pB6zND3sDV MkFVGvft8gETs/12KaUFm9tpjaHTinTIZ65tEOyrr+pU0/w4OCjMKdEoNN5QYchwyLoawg3pFeA ojKEM8Voa5LPRfrjp66rtB2Wr0ULn5IxwfOM71zi/NOlLnk/cMdR9F29ed2o+/Mu3adJnWBXLmD
 +D/63SfiAqlqV+CcdsOpaC6sobfoGR+DoPGbK5j9vK35z5dmNaEMV4DxudhtgMW+pXe8kh/A
X-Proofpoint-ORIG-GUID: yq4oP_uBt4uLqBzx6B8-UIRqO_JLZB2W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_02,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506040068
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 55427bki023528
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 09:06:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217893

I'll update PR and send out V2.

Regards,
Qi

On 6/4/25 04:20, Khem Raj wrote:
>
>
> On 6/3/25 12:17 AM, Chen Qi via lists.openembedded.org wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> The kill/decode test case fails for musl. The root cause is the test
>> case only considers glibc and uses 34 as SIGRTMIN while musl uses 35.
>> Add a patch to fix this issue.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>> =C2=A0 meta/recipes-core/util-linux/util-linux.inc=C2=A0=C2=A0 |=C2=A0=
 1 +
>> =C2=A0 .../0001-ts-kill-decode-fix-for-musl.patch=C2=A0=C2=A0=C2=A0 | =
43 +++++++++++++++++++
>> =C2=A0 2 files changed, 44 insertions(+)
>> =C2=A0 create mode 100644=20
>> meta/recipes-core/util-linux/util-linux/0001-ts-kill-decode-fix-for-mu=
sl.patch
>>
>> diff --git a/meta/recipes-core/util-linux/util-linux.inc=20
>> b/meta/recipes-core/util-linux/util-linux.inc
>> index b0f2a9d497..2d003c28b2 100644
>> --- a/meta/recipes-core/util-linux/util-linux.inc
>> +++ b/meta/recipes-core/util-linux/util-linux.inc
>> @@ -42,6 +42,7 @@ SRC_URI =3D=20
>> "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 file://fcntl-lock.c \
>> file://0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch=
 \
>> file://0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch=
 \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0=
001-ts-kill-decode-fix-for-musl.patch \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 "
>> =C2=A0 =C2=A0 SRC_URI[sha256sum] =3D=20
>> "81ee93b3cfdfeb7d7c4090cedeba1d7bbce9141fd0b501b686b3fe475ddca4c6"
>> diff --git=20
>> a/meta/recipes-core/util-linux/util-linux/0001-ts-kill-decode-fix-for-=
musl.patch=20
>> b/meta/recipes-core/util-linux/util-linux/0001-ts-kill-decode-fix-for-=
musl.patch=20
>>
>> new file mode 100644
>> index 0000000000..efdd019cda
>> --- /dev/null
>> +++=20
>> b/meta/recipes-core/util-linux/util-linux/0001-ts-kill-decode-fix-for-=
musl.patch
>> @@ -0,0 +1,43 @@
>> +From e6b6e401b0046a524e2e3e3db66f1b85b06fa2d4 Mon Sep 17 00:00:00 200=
1
>> +From: Chen Qi <Qi.Chen@windriver.com>
>> +Date: Tue, 3 Jun 2025 13:18:36 +0800
>> +Subject: [PATCH] ts/kill/decode: fix for musl
>> +
>> +glibc uses 34 as the value of SIGRTMIN:
>> +https://sourceware.org/git/?p=3Dglibc.git;a=3Dblob;f=3Dsignal/allocrt=
sig.c;h=3D8ed8e37dd6c41f94be6eef042ce9db1af1153228;hb=3DHEAD#l27=20
>>
>> +"""
>> +static int current_rtmin =3D __SIGRTMIN + RESERVED_SIGRT;
>> +"""
>> +
>> +musl uses 35 as the value of SIGRTMIN:
>> +https://git.musl-libc.org/cgit/musl/tree/src/signal/sigrtmin.c
>> +
>> +Adjust the test case to cope with musl. Otherwise, it fails with
>> +the following difference:
>> +
>> +=C2=A0 -Ignored: HUP QUIT TRAP PIPE ALRM
>> +=C2=A0 +Ignored: HUP QUIT TRAP PIPE ALRM 34
>> +
>> +Upstream-Status: Submitted=20
>> [https://github.com/util-linux/util-linux/pull/3605]
>> +
>> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> +---
>> + tests/ts/kill/decode | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/tests/ts/kill/decode b/tests/ts/kill/decode
>> +index 57149899e..f17ea36e2 100755
>> +--- a/tests/ts/kill/decode
>> ++++ b/tests/ts/kill/decode
>> +@@ -53,7 +53,7 @@ ACK=3D
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Sending one more U=
SR1 is for making the signal pending=20
>> state.
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "$TS_CMD_KILL" -USR1=
 "$PID"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "$TS_CMD_KILL" -d "$=
PID" | {
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [[ $("$TS_CMD_KILL" --=
list=3D34) =3D=3D RT0 ]]; then
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [[ $("$TS_CMD_KILL" --=
list=3D34) =3D=3D RT0 ||=20
>> $("$TS_CMD_KILL" --list=3D35) =3D=3D RT0 ]]; then
>
> hardcoding these values are perhaps not ideal. Maybe using SIGRTMIN=20
> here could make it work across platforms.
>
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 # See man signal(7).
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 #=C2=A0=C2=A0 The=C2=A0 Linux=C2=A0 kernel=C2=A0 supports a range of =
33=20
>> different real-time signals,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 #=C2=A0=C2=A0 numbered 32 to 64.=C2=A0 However, the glibc POSIX=20
>> threads implementation in=E2=80=90
>> +--
>> +2.34.1
>> +
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#217761):=20
>> https://lists.openembedded.org/g/openembedded-core/message/217761
>> Mute This Topic: https://lists.openembedded.org/mt/113443532/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=20
>> [raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>


