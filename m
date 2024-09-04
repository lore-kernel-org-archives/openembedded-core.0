Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F04ECD37B4
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 14:04:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.50950.1725458641910997329
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Sep 2024 07:04:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9977801a03=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4844LWma006470
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Sep 2024 07:04:01 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41edurrmsk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 07:04:01 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 484E40XY018529;
	Wed, 4 Sep 2024 07:04:00 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2043.outbound.protection.outlook.com [104.47.55.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41edurrmsh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 07:04:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lUH6M60wMEU1127ghGaOWwrGcZtk4iRzFbL+IsfW8Wk4t8/pyndYsBF7MwdrTtOJRCpI0weoFpXE6ppAkZ4ZroerTDN+svMWKOt4F94N8gQRDb9H6PrChHkYHv4nnFsRlAJQtlbhB7Gs928P8vXvL9jB1tw0VPCzNvurn4J6wmrvt4WvEJwMKMhunNx3pkTAvzxLH5+vJJrBQCw/ChDwWMSytNUCpyw4D444dCWDUC5UgcJiwkbNIchaTTJA/PDaRE+CMa+7aoAwZZq1C4LljVLNfxgcPbaDJXKikv2QKwKRHdzOrSVSN8r1toXG8f5Ya9Qzo3gDjC/QFU6YwS380A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qKt1ylut1KufBGdxw76KwF/dQKHl6rmVmkQ3HCYwJAQ=;
 b=ORFybWE4vbQCZFQBI7uC9bUf6LsnieBdjZO+9biOePMv+iY/3Qd6uqbKDMMR8AyHRPu0ynr25jaBOHTlDG30T3a2lpUQZLxD+qE5I5gkaFYQ1DQw8g1+eK4C6qPeQUFhOzOy5cvxnkMB9WBv18dMliRZgJjf6m3jXbdFCfvqGT9nYaTl9T0aSR+fpvWHwoaIyOHslU5sQoaEsK5W1X6G8q0cHmI+ldEpFHRJrSUk8kV1NrhhfCrCJj2p3vO3ZX6hGtm+MY8qkv/DMit0vEBoOjBKMOnfNhTMIMSxmE1Su4UEv02oDuXi3KGPTwXw2aNmVjqMpus8z5HibfTgKr8Lcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by MN6PR11MB8194.namprd11.prod.outlook.com (2603:10b6:208:477::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Wed, 4 Sep
 2024 14:03:57 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%4]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 14:03:52 +0000
Message-ID: <f761db35-c3d0-4391-b79b-52012c1696e0@windriver.com>
Date: Wed, 4 Sep 2024 22:03:44 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/1] buildcfg: Print bitbake branch and revision
 when it is in a separate repo
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <cover.1725456147.git.liezhi.yang@windriver.com>
 <8f43b5d81fdd28340c6c14fddd307b55ac05883e.1725456147.git.liezhi.yang@windriver.com>
 <CANNYZj-MPo05EF2qRezSXKpK6L8Djg0CZxBv--ozuLM42JbGUg@mail.gmail.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <CANNYZj-MPo05EF2qRezSXKpK6L8Djg0CZxBv--ozuLM42JbGUg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0005.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::23) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|MN6PR11MB8194:EE_
X-MS-Office365-Filtering-Correlation-Id: d1f0a359-9919-4ac2-0831-08dcccea681d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cUNmZGlabHlhMnpUWS91UWwrY2tOdWVYZVdtdkdRMjZnbmNpNC8vcTNidkxQ?=
 =?utf-8?B?UGRvNjFsbk1WeWtGcG1nT3BieGxsN1JteStqam1TTGJ4Kzg5SzNuLzRGR3VU?=
 =?utf-8?B?blpNbEtYeDVSWDZQcEJDV3JGWWU2aHc4UVBEQlRWMmtVSFNobk05U3VUYVJI?=
 =?utf-8?B?Y1VqcTVkc281Q2NzZ0xTVXo4NURLN3htZmdaSFhqYzNBM1VUVEE2V0VtaC84?=
 =?utf-8?B?U2QyVWV4TTJ5WkZGU0ROcktIbzZsMDV3Q3hEeEMvUFNaSDRMYllWa3k4RzhW?=
 =?utf-8?B?YVJkRUEzYUZXRGJaVFFIcXRWYVNwckMzcExnK2g3bFVkcnViN0YyMkw0VVdk?=
 =?utf-8?B?UjRvSEEzWUtLbEN6ejJPZGpEWFVrZDdjbERNeWVXVG95b2M3T09UWWVRRkpQ?=
 =?utf-8?B?YVpGUG9PaFNKVUE4eUFzMkZHQzJIbVIyRlVBTEN2d00vZjVMNzBpVHlvMEp2?=
 =?utf-8?B?VjRZeXZJRmRrbDJsTWlOUDJGak51bENwc2NqcTI3bVRNNVNPUnUxeTZNZGlF?=
 =?utf-8?B?d2l2bkZtYlpBdEkxd2dYR25BUjZsZjdnU3FjTDY1Y2FxcDMvTUZDUGZxcXdm?=
 =?utf-8?B?NUdCV1hTQWlHMmpGQ1luZUtHeDhoOHkyc2Exd1gzNjA2UEVmdGI0Y29aeDRs?=
 =?utf-8?B?ZXhGT0Rkc0wzTTNlMXEzNjgrRlArUWdjcExLZXZVT2ZuRE1vaExHTFZka3lj?=
 =?utf-8?B?WDBVVGthRkdjZi9OeE12QmRLSWY0eS9oK2lXVFcvZlpvN2UrdkNadkIya3ZZ?=
 =?utf-8?B?VFJUd3d1N3QxbGl6UExEZlZRTmNkVk9jTURJUXhKQ0UwR0x2cDNmakVWdU9m?=
 =?utf-8?B?YUlBTThMenkwWVVlcHByNWRRcHpjR2RDZ1ZuSS9sS1V1QTRHeFFDRzlLMlBE?=
 =?utf-8?B?UVBXRzVjOEt5OVdNWTBxMVB5UWRkR3pSa0ovZUhFRVF2ekJJOWtTM3FoYTJh?=
 =?utf-8?B?ZllnTUdiV0xhVkg2bElvZGxjTFNhZExXQVUwMEtnMEhMTlBGRTcxTktJV0RZ?=
 =?utf-8?B?cTljcUZLbzVoYWwyRlZkYml0cE1nQU16L1hlWEU4V2pXRDhvKy9xZVIwNHQ0?=
 =?utf-8?B?MGhvY3FtMHl6WUJseVIraFczU2N2OGlQUEhUMWxsV1NBYWJFWFY2NTBUM1lo?=
 =?utf-8?B?dWkvNTE3bXNMTlI2cjd5L1I4ajZCSFVONzUxYWdoUXI4OEpkcnVNODh5Tk1m?=
 =?utf-8?B?a0MrTDFLd2JuMWdRV3JhY3RmYTI3aWRIbkd3TEhURmhjVTlEUExiNnlkOUha?=
 =?utf-8?B?d0FKNy9PVDJXbmZ5TUs5VmhDVXBGMkJic2dVb1l2UCtPNHlUNXNiZTFvZmJx?=
 =?utf-8?B?KzNkU3RSUWtoZXdycHlPRDkvaVZQOHpGaHpDSS9XRUQyQkx5YzFMVmxONlZS?=
 =?utf-8?B?SVA5WmNzcklvNWNtYmZZOXNvbjdtNUZXWGQrdGpKMFVGRDNCVnhlck4yY29Q?=
 =?utf-8?B?Y3NBdlFFdkNhajB1S2c0Mit2WndOcS93dW9LVDN0cHJsbUxQN0JGSFdqckRk?=
 =?utf-8?B?SUdtWUtOdDdzTjk5WVN4ckJpUnU1T2U1ayttVTcyYlFWRlZtaGVXSzdQclFp?=
 =?utf-8?B?Zm5VcVJXU2srTFVzMTN3REZOcHQ5bGthR01RZXQ4KzUrUkk3d0FERTU5TUI5?=
 =?utf-8?B?dkFkNG1ncDJoN21MZHZtS1c4OEZSYTFRVktOVHhYYXRmRFJsNE92c1VyZFpq?=
 =?utf-8?B?ZDNaMUpGTmNqR1pRN09VV3oyUFdmK0FkdDNRZGNVbGkreHFXOVBwSTNHZjFj?=
 =?utf-8?Q?MzRTH0FMO6k00L4HDw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(4022899009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L2x5cFNXblFuZzM5M3RuYXBIMXpvWFdSbzJTcE5MYk1rMW00bHlUT0xZZjFJ?=
 =?utf-8?B?eTc2UTN5dHB6cDFXbGczS0hXT1pqejBJekVaQVNscUpRUnE0MVoxMWVORlN4?=
 =?utf-8?B?dDZTK2dFaW9JYzg5M0RoNFNyUGtXVlBhS0Y1OFZHS3dVUFVzTGorWWg3a2h0?=
 =?utf-8?B?b29mZWpSZ1BaYlJVdFVKTmkwUG5ueHFTeFRCeFpGT2NIanZwcmhSSk5MNVhR?=
 =?utf-8?B?Tm1xclhLYmJwWm54VTU0UVlQSHpDVHoxWFl6eU8rNVZUMmc5WnVPVWdUVnRS?=
 =?utf-8?B?SEZYSGFTUVJPRVYvNEhWYnhMcTg5cjdpQ1Y2MUxKVFpwRFA1aWVKYkg3a0NZ?=
 =?utf-8?B?RHA1VUMwWFJCRVZQQ2haaEIvY2w3bU9GTjFrOUt5RmQydERNWW1PMEsrY3Fl?=
 =?utf-8?B?eVoxNHV0S0QyTnZab2dyS2hVdXlhNmlucTl6SVhVRmJ2S3d6ZkZmcktUeXQr?=
 =?utf-8?B?bDBYNmhCZUg5REJXZDNCMmhNeW1YeDhBandYODdqRU1OZ25rblRocUdONlBk?=
 =?utf-8?B?c0RzOUk2cjJXT3VmQUlHNFpObEc2anFsOFkreVY4ZXlHYUp1UFhDWkFoMHl1?=
 =?utf-8?B?dW56dHVOSWJxbnpDei9hQVZTVmp3bmF0b3ZLZzdHbm5hRnlMYTBHU2Y1cGk5?=
 =?utf-8?B?MlpqS2YvK3VsVlYzZ0xRbENrSC8zZERuTklzNWNoeEh3VFJJZE5xbW1sdFhW?=
 =?utf-8?B?N1ZwMnR4M1VCVWI1U1I2ZUd4eFRjWnVzWmhJT2FhS01tTFNtUGEwMjJxM0hz?=
 =?utf-8?B?dEVnSTExV0FIeHBhZkQ5cWdkVXE2NFEvdnB6Vm9RUkxzMkVLdTluSjArRnhl?=
 =?utf-8?B?L0dPVzNNT1NORi9iZGZsK0ZEdGFsT2xKcTVaSVdVdkdMQVkvSEpJQjE1K1N1?=
 =?utf-8?B?Vzhac2FieTQ3UUlFQmNpQ0pTL2E5WmhWTUZjZ1lEOFNHa1lFdDRVR1l5d1FS?=
 =?utf-8?B?R0VmOXhQZVZDT2M4ODlXUENWY1JKWWJ1WkpDZ2gzSjlmTU5EWHNjeEVSQkk1?=
 =?utf-8?B?bFlpakxuR3lTbTJxMVp5OExkbWZsNzJ6U2FpU3VBbk5Ob2xUOEhLU0c0eDhX?=
 =?utf-8?B?M2NKY2RqV2dNYWkzWW40T2dVeE8rYUNFa3UwMTM1RzRFYWVnNEV5NTZ5b2tm?=
 =?utf-8?B?WnpNQVB5UWh5amcvRHR6WVVMRFcwT3YvalZCUTNaeFVlc2NoeHpjZmdUbW1G?=
 =?utf-8?B?YXFaSSswN2Zzb2xrdk1YSnFNKys0Zmh2dk9uSngxU1hzaWtYSUNnN25URGp3?=
 =?utf-8?B?YmhZQjZPWlRnMlpoOHVnY01GSUxNVHEvRjBnaXJieTZoMzV3eFpsTEhGVXBm?=
 =?utf-8?B?dVgzVzRSeFNrbWN3SitXblZPRm5UWGlVSVo0MTJSd0RSYm5FTVB1OG5BTFdH?=
 =?utf-8?B?dnpkUG5ZK2lZNVpPcUNSNGJqZENJYWhWT3BQQnhmeFUwYnJFeDZzK2NxbWpF?=
 =?utf-8?B?U09sWEpRSCthWElJWmtPVTFTRFhYRUdsZXJmL1BlS0M4MVlPdkVkbWpVa2h1?=
 =?utf-8?B?RVVKS0ZOREdIMTBySGFwZVBEZmZsOFY1R0o1a3hWcWd5S25hMm1qYVRyaUpC?=
 =?utf-8?B?TWxZemVaRUFmYW1PUlJtaWtMTEhwOHZMMkVqRlJiYmFWM1NaSGFLbU1nbGZ0?=
 =?utf-8?B?STgzMk1SSkxhdERBUWFWdXc2K0J6TTJRYzM0Rk0vT2xYcDZMYnFaMis1ZWxx?=
 =?utf-8?B?OGp4aGZ6ejBzSklKOFlXckd3NWhnY2UzMnRLTlV0MngwT1g1NVFxNkVIQnJG?=
 =?utf-8?B?SnZMekJmbkFEQzc4dVB4dXVuSldOc1Azam1jWHdiSmR6czJ0TXphdnhVQ3Y3?=
 =?utf-8?B?Ulp4U0M1MVgzM1EwUno3eXpubjVxbXc3eDZmRE5PMEVuT2tnd3NiY3o0d1RY?=
 =?utf-8?B?Mk11amszbnljRVRaRkVaMmdYa3k0S0RwSVFXK29pWm13NlMzTEo3dy9BQ1U5?=
 =?utf-8?B?QklsVWdWRGFBQW8wV09mV0lBN1lqWWZmcTNoVGN0UldQWElrQU9ReHhNNVA1?=
 =?utf-8?B?SlRsWTlpM1l4STFQZ0xZVmtCYnlENXcrNUxURUhVTThZZi83djcwN0xoN1pt?=
 =?utf-8?B?eEorMDVKeTZjK0hjMHJpK28vUjhDSVpzNElvT2p5b3lxVjBYR0RLOW1YcVp6?=
 =?utf-8?B?U2FHNkxFWGE3b0dxMmxzLzJqRmNpcFAwb3Q5UXJzelJPaGlKOWdQL1BCMWRs?=
 =?utf-8?B?b3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1f0a359-9919-4ac2-0831-08dcccea681d
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 14:03:52.1841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5l68pbKPEzIMj+WxZprSTdOSQFaIpKukbW6Bwrl3GA1V02MWOdEkpVU8NJBi+rgHlbNK2/cwZ0o7vfoPTC8PxFtBtQyZcqpDq3ccjl0lGtI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8194
X-Proofpoint-GUID: SgBvi6dYW5Cbe0AEWsvgKB1vGN92bMNg
X-Proofpoint-ORIG-GUID: qwpIT3dV9qmY7YH9kQof_LV7U2Cq_sJR
X-Authority-Analysis: v=2.4 cv=FbFlx4+6 c=1 sm=1 tr=0 ts=66d868d1 cx=c_pps a=2TzYObwzRp/N0knVItohZg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=sp3MFURpEol9DfbNtx4A:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_11,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 mlxlogscore=816 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2409040106
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 14:04:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204209



On 9/4/24 21:36, Alexander Kanavin wrote:
> I don't think putting this into get_layer_revisions() is correct.
> Bitbake is not a layer, and obtaining its revision should be in a
> separate pair of functions:
> 
> is_bitbake_in_separate_repo()
> get_bitbake_revision()

Makes sense, I will send a V2 for it.

// Robert

> 
> Alex
> 
> On Wed, 4 Sept 2024 at 15:23, Robert Yang via lists.openembedded.org
> <liezhi.yang=windriver.com@lists.openembedded.org> wrote:
>>
>> From: Robert Yang <liezhi.yang@windriver.com>
>>
>> Clone https://git.openembedded.org/bitbake into poky/bitbake
>> Before the patch:
>> meta
>> meta-poky
>> meta-yocto-bsp       = "master:377fd06d86f5f3be80a927ee19c30d9557077a7f"
>>
>> Now:
>> bitbake              = "master:5bd0c65c217394cde4c8e382eba6cf7f4b909c97"
>> meta
>> meta-poky
>> meta-yocto-bsp       = "master:377fd06d86f5f3be80a927ee19c30d9557077a7f"
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/lib/oe/buildcfg.py | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/meta/lib/oe/buildcfg.py b/meta/lib/oe/buildcfg.py
>> index 4b22f18f36..5e2de15127 100644
>> --- a/meta/lib/oe/buildcfg.py
>> +++ b/meta/lib/oe/buildcfg.py
>> @@ -73,6 +73,12 @@ def is_layer_modified(path):
>>
>>   def get_layer_revisions(d):
>>       layers = (d.getVar("BBLAYERS") or "").split()
>> +    # bitbake may in a separate git repo
>> +    bitbake_dir = bb.__file__.rsplit('/', 3)[0]
>> +    bitbake_git_dir = os.path.join(bitbake_dir, '.git')
>> +    if os.path.exists(bitbake_git_dir):
>> +        layers.insert(0, bitbake_dir)
>> +
>>       revisions = []
>>       for i in layers:
>>           revisions.append((i, os.path.basename(i), get_metadata_git_branch(i).strip(), get_metadata_git_revision(i), is_layer_modified(i)))
>> --
>> 2.25.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#204207): https://lists.openembedded.org/g/openembedded-core/message/204207
>> Mute This Topic: https://lists.openembedded.org/mt/108264652/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

