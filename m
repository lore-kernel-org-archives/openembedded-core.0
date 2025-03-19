Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C87FC282EC
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 02:42:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.3905.1742352119565633094
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 19:41:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=517316d858=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52J19Smu021186
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 02:41:58 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45cxs0v56p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 02:41:58 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52J2fwx4026227;
	Wed, 19 Mar 2025 02:41:58 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2168.outbound.protection.outlook.com [104.47.73.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45cxs0v56n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 02:41:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pNHdeWtoY2lXTnmMKMfagUsi0mYq8ECmWlPHf6lYmcGK6k2JDnk9DsitlrWFdPvrbPrMe01JtBUSe72g5eAJ2h5+g5N0+qfxvdweAb/i6EmGl1KykZhY9SbeCCE5sSwWFiaALw0ItbLhdTPFm0G0CamWyu6shBbXKUGMlpiSYk1Nfg0v2Q/mlyW0LB78rYNbOXnxt/Sazeb/skpvtJ73SiWnVIlf2g0HxB+zfjLBueJzfwBKc0IFzm8vZw3mU4825Q1mVnkaNrot5tVRpftWtskTLHdIbbv3x+4FCCHbe4bqBQ0ZXcTROmKuT8F3o5eud9vJ4oCh5t2dAR6yv+7ipw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zCrccTLmcjhHUtUxHV5iReP6DdNkzoraQIcB/5pvtOU=;
 b=KuzC+8ZP+iJqZTmbE9w8r6ZGnvJzHxLWs2RT/31F5L8UUBcIl4gcpRTtxgTE83cKd9g+0Tpj0ZCC6KFxVcSbtkYQNM2QkytKdWaxFyuP9GK/1z/GxlNRF8aGiQWseUKRxRZrBtQNAnHPNeEfOn7rgwHR0BbbZ13G6zhtWB1aFxpiKBsLopDIGH7LKY3y8uECNsymmjKKE5+++HseRkHErEh7VeN6JvOdxJbnl65orTr2rIEe9NhT3rz5BnGjgnefRLrEKB/KEmGm7WrInPvwMovE1CMz2d+3ZK6qYSIDXsp8EJGZnSD9GVzIkcbCka/khROgqmTa3Yc4x9dftDUYIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by CY8PR11MB7899.namprd11.prod.outlook.com (2603:10b6:930:7e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Wed, 19 Mar
 2025 02:41:53 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%7]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 02:41:53 +0000
Message-ID: <a63721c5-77e1-45d5-8f01-c1cffa074cc8@windriver.com>
Date: Wed, 19 Mar 2025 10:41:46 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] docbook-xml-dtd4: correct license name
To: Ross Burton <Ross.Burton@arm.com>,
        "hongxu.jia@eng.windriver.com" <hongxu.jia@eng.windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20250310071234.2370628-1-hongxu.jia@windriver.com>
 <892349E8-2E4C-4C7E-9E14-0034B85CDD14@arm.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <892349E8-2E4C-4C7E-9E14-0034B85CDD14@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG2PR03CA0095.apcprd03.prod.outlook.com
 (2603:1096:4:7c::23) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|CY8PR11MB7899:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f5944f5-7194-4bb4-cba1-08dd668f9b8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bE1icnY5a0RFbFZDOVo2RVJmSDJFK284V0k5U3IvUitDZzIrSVdWZnBGWkJD?=
 =?utf-8?B?VXdNRFFxRG1tZ3FTS2Uyd0N2ZktHU1ZRR2ZOZTBEd29IWjRYa1JIVGRrZUdh?=
 =?utf-8?B?VUZoNWpaUUZyQjh2b0g4L0hDQWQ1Y3ZZOVVkQjdqZkVENlFqTTJlK0lHY002?=
 =?utf-8?B?UmRTUTcydVplWDRzRHZrVGRtb3BoS1lFTWJYdmtmUVRYUmFEK2s5YURQSUR5?=
 =?utf-8?B?QzV5TDZqWmVjRXFBRFd6UU1GMXQza2dEZVN5UmpPS0FZdkoyWWtpcE81Si9J?=
 =?utf-8?B?OWMwRkdTamhCOVlYQkhZVThTZjFFYzJHanJ6MmhkK0JNYlViYXMrVzBsT2l5?=
 =?utf-8?B?Z0pzQUx2VWZEU3llUHVreVRXdEcvQldjdmdOZGlERXBsTVVYMkF4bUlDcGdj?=
 =?utf-8?B?R1QyMUJVQjNkK0NyNUEwb29lSzlCMndUMmhqbDRDQVY3QUFEKzVkVEs5aVdF?=
 =?utf-8?B?Nzh3NVlRdHh4Qi82SnRmRnZhTkJ1ajBTWlpQeE43d01RZkpaa01CQU5hS2sy?=
 =?utf-8?B?M0U5d3FIcDdENUVxK21rNlU2cysvQk95MnI1T0IxZ0RvUytRU1ZuYk5yNmZ6?=
 =?utf-8?B?d2QxQWdtY2UyM2pqWnVacjRIdGp2a0FtUVpsMzFsUEZ1UVU0SjZDRW8rSEV2?=
 =?utf-8?B?Q2tVRmEvWnYveDZzeCs0RHhGNGViUXhOeXdSbUsxZWsvbktxNndNRG9aaHNq?=
 =?utf-8?B?cEZCdThxdjJMWHUxWXNlODV6YlBveEVwRkdTY3pCQkI0Q3FEVmIxbnZFajBo?=
 =?utf-8?B?cmVNZVJtTlRDR1hyNXQzVWdFWk9wRlhKOTNWdWJkZU1XaXY0YUh4K3ZrSGpU?=
 =?utf-8?B?YlpSS3E1WmxqclFDZDl2bWJ4OE9McFFqMGYzZjhHMlIrV0pmRW54ZnpXa3Vw?=
 =?utf-8?B?ZVNpNTh3dW94MEY5MVJjYlNndGx5WWJiZHNwaVNvbGNnRS9SSHFCcUJobWdp?=
 =?utf-8?B?Q2NNb3Zyek1wL1NiSm1FakdjbzZERGgrcHp6VCtUK0JpeWhFZW1EYWNnOWkv?=
 =?utf-8?B?RHlpZW5TcVcrK29BaDN0d0w0eXdsYnNXd3lqa3NpbE52NlNPcDBJYjVQL2w2?=
 =?utf-8?B?dmxVL0NMeDNGVUxHcXdnRFdGUDdvTSt1ZFJPcThMMFFwQ21wVStXZXR6Q2I0?=
 =?utf-8?B?YmhYdGFQNTBxTkNwbGZlc3hKaEptYXd1eHJQNm9SUDdjd1RWVHVubWVXa3Jt?=
 =?utf-8?B?MkNVY3o4WW5BOENkbzFWQWpuRk92QnVINjhFR0h1YVlhSEFHcHNBNHg4TTcv?=
 =?utf-8?B?OTNRVEd3NFVlYWZhMUl3anV2Um9xdVNtcjhORnAyWmcrcHRoZTFiVnZUQXVw?=
 =?utf-8?B?cmhQNTVGcEhIUlIrUm9FOHJIajBjMUdhdWliWHc1VEt2TUxYaDNJWmREYWhG?=
 =?utf-8?B?U1NKR3lvWHJoUHBVMEVsNGJIZmN5WnV4L001NFZOcTBCTi9tdXFnMkZiaXFi?=
 =?utf-8?B?WkFsSGI0YkVOZi9iaXRQaXlMbUpCVkRxMis2aTh1bFJWYndZL2psWXI2UjZJ?=
 =?utf-8?B?UlJzSVlJM1NJdkhFRGVvUWhEWmozVkxuSWJZVkNXa1R5SlRTeWRUTkNLS3hP?=
 =?utf-8?B?dE9iQUlDdGJjN0ltUllwUWkxUlF0TW8zdStETHdkMDUrTnV0MXZKZ3FuV2dK?=
 =?utf-8?B?WHh0b3dFOHJmdFZzdHV2Wlc2azRPV3Qxck5CTkxjRDNRelFHV0dxRW04bWli?=
 =?utf-8?B?RVBaZkUvVnpTNmhXRXVaYkg3VmQ0UEREV1l2VEc5dlNTdTE5cjZyMDV6OTF0?=
 =?utf-8?B?ek9ITVFza2dFVFZIa0ZDQ2U5SmJTaWtja1FIWGVpYmxSU0FqcTlWbXJOM3hN?=
 =?utf-8?B?N3dHamxhSzVvMkpLTE5tTk5mY3YvTTVUdnV0QTF4elc2STFnaTY3K010R1Ir?=
 =?utf-8?Q?psPFEDxsyD0MJ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dGF2K3V4Z3A2WWZMTUl5WklqTFl5cmp0RlM5bkZJSEx3cXZVSnFVSFp5dDlI?=
 =?utf-8?B?YWg0c1ZBenFUUTNCbFhtSDdvT3F0ekx6S3FSQWUzR3FIb1hNWmpYOU5YSldK?=
 =?utf-8?B?NWRPUUVOQllzWGJzc0R2ZURBY3JzdXp6d3BpbjBCTmk1QUluUithVWdFYnM1?=
 =?utf-8?B?ejZCcU91VGJybnozQXk0ZFBUV2hzNmR2VTdZOGVrdVZUWGc3S3c1YjRmOEN3?=
 =?utf-8?B?aVoyTWV1WUpJOEZnQXNldW1hcm4vTVIxQTV0VDJCVTVQekhzeVpUZ3MyQkc1?=
 =?utf-8?B?bnk1MmJwZnVNM0pvSC94QXlseDVyVE92cmZ6c3RYVXdiK1hVV0FyUUpUTERM?=
 =?utf-8?B?ek1Ud2hKblNNZk5XNVdIVExRY3FSQTBXUFZxWFNDQ291WTh1bmwvSzA5dTJ1?=
 =?utf-8?B?VSs4TldRUDZpaFRaRjA2R2RQMC9ndExlaGpWU1cvU0JFVzV4M3U3WEJ5eHBN?=
 =?utf-8?B?QWpseWNuT051OEpaRExyZmNwVjU5VzRHQ0hJbTlPcXNpekxzUy90UUZJQldT?=
 =?utf-8?B?QllES1phbnlFc1dYdC83WXp2UmViclhGUDZ0SWFraTB1dmZTMGoyTVBLWE81?=
 =?utf-8?B?SmRRL2l1dUUrbU9FMHJwNmRFWG1VdXBCK0czUHRoTHd3NXhyMVU4dURDdldG?=
 =?utf-8?B?b3VCMHRtTjJWR2F2TUo1STM1d0FuVHVhbVk2NEthaTdkb0pXWkIrVGQ1OEx0?=
 =?utf-8?B?S2JiYVJnYUFoTDdPVDhpWkhmSVFPMXFTV2NqYVJZcEtnUDlVSVorblBPNzZp?=
 =?utf-8?B?SWRIaHJvWjYxM0dNL1FUU3hCWjRVSnJqQ3BBcGIxUjJRV3pUTUpMS3pUQUFO?=
 =?utf-8?B?L2lWUEZoL0lOYWpSZmFXV3JrdGVUMmhGS0I1Sm5PWk0rL09FTUNWMUE3QlRK?=
 =?utf-8?B?RWtvY1o3Q0dzcWxFRENrY2pWSEx2THk5YmxnNHlzdXZqOVdoRzhPN09ydmRs?=
 =?utf-8?B?Q1hWdVJzYndiRkVFR0VUbmVycmdPNFc1VUhLRXRkVy9XWFhTaEFhUGUrZzdB?=
 =?utf-8?B?aVc4TnpFRTI5amVRc1JBQlR3d0ZKSHJRM2s1VlBLNTFxMEpxNDA4NCtkOGRN?=
 =?utf-8?B?bWYxSnZxZEMxNFFCOTVFcnlJeEQza2wvcy8rMUlReVJQUlNmcUlNejdvZmVK?=
 =?utf-8?B?bFlDTlhQbUY0Sy81QWo1SmpJajZDT2crcHMvQUd2djRDa2JpdzV5Yzd4L3RB?=
 =?utf-8?B?dCtRVml6RGV0blZVNlhaSVdJc0ZyYTlXUENyV2NvVWU5SVRaTHo2eXc2QjRN?=
 =?utf-8?B?NEJHSERubVNBWmRUZUVrejhYNjM2UTVtcDZiQUIwaU5Gd0QvZFFPalpoRWFP?=
 =?utf-8?B?UnYxRmhjbjZNNTRWcDczVXR6WlY2UEZGQmdUTldQclpMWFN2RStOT2hhYW5S?=
 =?utf-8?B?dTc3SXdoTEJ3RzZGMSt3ekYrTGd2czdpRzVVcGRJSTZlL1UyUkNtUFFoS1dO?=
 =?utf-8?B?cm80aURGQUVLNm95bHlXKzhJSmxGdDNMSm96Vm9yWTZ5Zy84MnIxUHp0NnhO?=
 =?utf-8?B?VkxqNjF0YUs1QU90d3d1WXl6V0dUWUZKMzlScERxeGQ1S0JZa3UrMHc5UjRW?=
 =?utf-8?B?Ym9HMCt5MjRXNkNuVUZ6VWxRWkNzeHFBQ0lDQ0pNTWxBVEJSWk9kNWpMNy8r?=
 =?utf-8?B?SEZxc0JQNnUzSjQxNXlNdjhMbG1qQ3VVRXdPRjVkcSthaGJhMWtuVWtuY1p5?=
 =?utf-8?B?UlA3eG1BMFl4UWVGVk1ReUxpM280Zy93eWVpZ0xiSjBLOWxEMmNsRkN3bTJv?=
 =?utf-8?B?WDYyeG1pYTdBall3NVBwaUd3KzhuVnNDZGlsNTh1eVU2VWNZdzc0QXV3Y1p0?=
 =?utf-8?B?Q0pXN3d1Q0lMMmY4SVRZT2NHWVJtV21wcWdveW5uMk5jWEREbElkbjZPUHNT?=
 =?utf-8?B?aTN6cFByeFZma2tubjA4WUdibVBFU0IrNkFLbXlGeEVFK2paZGcvYmZ2NmtD?=
 =?utf-8?B?VjBqd1JtZEI3YURmNEplZEoxMEs1eHBWSXVPTW53VktGQnJJV1V4VDhxQWVk?=
 =?utf-8?B?cGRzNjV6bFM5VHZ3WnR5RjVhVHZTalgyYmUyNWxaWStRdnlZMVlCVUxSdFQz?=
 =?utf-8?B?aFV3eUMxSWtCcmJYRVh2OFR3RkFBN2xEWTJxNjlUOVcyVmNmT1F0ckFwL1lF?=
 =?utf-8?B?QkpKWWJpdGZEUGRBR3QvM3J0QnFqM25qR2Ixejd4c2lFL2tUam9uZGZrVndW?=
 =?utf-8?B?OWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f5944f5-7194-4bb4-cba1-08dd668f9b8d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 02:41:53.6001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y/Nw3qBttaefZpHqf4USnmL0JLdzYVI9fc4St7Wm11gnPb1VK9euemxqOfLn3B4DlOV5waqrsH/xAsVskWvAKif4bruGThcqOfBQwt+RYlc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7899
X-Proofpoint-ORIG-GUID: n3Q866AWRo13ooiAz4VovX8nOJdLN1a6
X-Proofpoint-GUID: RgXJFuTNXwFhZpqM__nViEo0WdvopleJ
X-Authority-Analysis: v=2.4 cv=NY/m13D4 c=1 sm=1 tr=0 ts=67da2ef6 cx=c_pps a=WGTt6C9BqyZsVnlRayY6PA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=H5OGdu5hBBwA:10 a=xNf9USuDAAAA:8 a=Q4-j1AaZAAAA:8 a=auuiqKRGHwclmaEYFNsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_10,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 spamscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 mlxlogscore=990 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503190018
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 52J19Smu021186
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 02:42:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213261

On 3/17/25 20:43, Ross Burton wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On 10 Mar 2025, at 07:12, hongxu via lists.openembedded.org <hongxu.jia=
=3Deng.windriver.com@lists.openembedded.org> wrote:
>> - Use license in source file to instead local file LICENSE-OASIS
>>
>> - Refer debian[1], rename license LICENSE-OASIS to DocBook
>>
>> The content of license has no change
>>
>> License-Update: rename license LICENSE-OASIS -> DocBook
>>
>> [1] https://salsa.debian.org/debian/docbook-xml/-/blob/debian/master/d=
ebian/copyright?ref_type=3Dheads#L28
> This license is essentially used in just one recipe, docbook-xml-dtd4, =
so it doesn=E2=80=99t really count as =E2=80=9Ccommon=E2=80=9D to me.  Fu=
ture releases use a license that is in the SPDX database, but this is a b=
espoke license.
>
> In this case I=E2=80=99d prefer to clean it up by using NO_GENERIC_LICE=
NSE, and remove the OASIS license from the common license list.  I have a=
 patch I was testing, I=E2=80=99ll send it.

Understood, it makes sense

//Hongxu

> Ross



