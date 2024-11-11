Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71157D3ABCC
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 16:13:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.63129.1731341598740224353
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Nov 2024 08:13:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1045fc21af=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ABDw7aB002528
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 08:13:18 -0800
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42t3w79tfk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 08:13:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DNaH4tLuT1gLcwwkErGZiYB1hC8NLMZK/LWcrrIHruPUa0m4TkaLuNHApX/sUc+njTLSPGRNyVRWUVz/XJ5KL6fsEsaq9PhnM9qAh8vBAzgdY7yCqvwQdrjI8nnO/Or9rOyLZ3J7D9kopQCYzE8cTqvCEzS9QfdS3QTcwhlrVugRQqcfSa5CWCDWeG7u86o+8HQrh6ATKrU46XbVyXPlCm4r5jFH0VuZ+tHubgZ1TQ8aX+RqFs8nBUZu91Uufi/pY+80IPj105Mo+ug7QTAIfzCQ3XEVL6P8Im9nT22wK6RmwlGRYh4uCyNj0CIh3bJHqdwDezSJqRaQ0yDAVLr9Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQrRzABCTJANr1eF1RhsWnBVizc8/go3p6dcsS22nFw=;
 b=SxUzepi3MCCaT5B9npuJuDisMJRql+4U/accgqy4U93dohwppzctjuL1UpQ32uRpQK9Q3X7SHSdXZj4752lwQmP7a6SWy09Up2HvtN6gJV0Ovsc5uKxwxBQx+WnajhZ/3TvhoilKRyg6PYTp50iEE9fBUHqY4NqRtqOWGmBX9wBRv3bayNCi2zXmACGkOpALOju1zrPykLOv43HaUpe7B3/70aoLiDCjZXcK+clG3dKnV17Klb8eDTfTnicI+TpSaLPqbjoQpMs+a1rYem+SjYWW+hnZmjtJkPyISF5PdbswJP+DB1huiH3AFseU6Z1gmrc5UWVXr24pnPFmurSQpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by BL4PR11MB8821.namprd11.prod.outlook.com (2603:10b6:208:5a6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Mon, 11 Nov
 2024 16:13:11 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%4]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 16:13:11 +0000
Message-ID: <8f9ee65f-0602-4f53-b24c-f06929d86791@windriver.com>
Date: Tue, 12 Nov 2024 00:13:04 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/1] groff: Fix race issues for parallel build
To: openembedded-core@lists.openembedded.org
References: <cover.1731339499.git.liezhi.yang@windriver.com>
 <9c5f0c327a632d9004d80fc588aa5b861b3ebe59.1731339499.git.liezhi.yang@windriver.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <9c5f0c327a632d9004d80fc588aa5b861b3ebe59.1731339499.git.liezhi.yang@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0048.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::11) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|BL4PR11MB8821:EE_
X-MS-Office365-Filtering-Correlation-Id: 981b9fdc-63be-4aa7-11e4-08dd026bbcea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZmEyWFNBa29xL2JzNkdsY21HZ3hmeHdGQkFaeEN4VHMrUmJ6ak12RXExOFN0?=
 =?utf-8?B?YjhIMjA3bGFJWlBxc3BIaHJRaUJLRTNkZDBxeDRtMHdYUHlrZmRCQUI5REZE?=
 =?utf-8?B?RlIrZ1ErYUhJaVMxOXp0bVowMTVwMmR0RjA1a1l3dmxmQkVoM1FNUnFtSFg0?=
 =?utf-8?B?Y1VIc21nazhCV2xkalJ5SVp2QmdIZnlkU0ZHM3NDc0NpOGU0SUJqcUVnMVpp?=
 =?utf-8?B?M2txdDR6SytTRncxRy91TUZ0VjQyR3UyMWxwbGRNZkpVd1ArVGhkWXplV0F1?=
 =?utf-8?B?L2xPTlQ1alFVR3lsOWNaUVowc0ZTakpxeXNhRk45ekdDSHVmWFRJUDZnSWk5?=
 =?utf-8?B?YVY0eS9Semg2RkNIK3NDdUVpQm9yRDk0TmxHckFqM2RZSGxCanJ1TDNIZWVs?=
 =?utf-8?B?OXk1M290K0JaQ0VMVUFXY0tLYmhFMTJXZ0ZRNEx0TnBtTkFTVHBOS2o1MzRu?=
 =?utf-8?B?U2VoRkNPS2Z2dVBXT05rb0lzTTdpclJUM1d0VVkxdzZBVENmZk5MOCtub0Uv?=
 =?utf-8?B?TGtQN2x6N0t5WG14dysrckRMcHk4WW5lYkJjOU14Ly9GSU1FTmwybzFQaVZz?=
 =?utf-8?B?c0I3TTQvbkdMeEJ0RVlxOWs4N09pQUtFSWplVjllT3pBUkdGbEN2OVc3NUNS?=
 =?utf-8?B?QmNROXdwdlhZb3lPeTRxUnhpdDU0MHdic2RUTFlBOTRvUFh3WjFuZVphVThF?=
 =?utf-8?B?UEZadi9ZbmovUUdMSi9wVEtHNEI4aklWaTY2bnpCZCtaQXN0SlZiWmU2a1hI?=
 =?utf-8?B?d09sSWc4RVpvZ1ljUE8rVGYydnFZWkt2UnU4Yk5EVVQ5VkNHTHJJZXlPaGVm?=
 =?utf-8?B?UE9Hd0FDSkJMWHEycDk4QlhRRElBbDlCM0lNTFk1NDFLUGxiWGdINUFtMWZT?=
 =?utf-8?B?VnhmTUF4ZjZsOUNQbE1TUjZVdldseVhJbDF0VE40QWl1VSt2MEpqQjAwS3Z3?=
 =?utf-8?B?THoxTHNQaUlkWDJkczVhVzNBWWtUNk9KNDJGTTRTVnYrLzhLeElJYWlDQXFW?=
 =?utf-8?B?M0lxeUgzaGR2clpESGhkK2ZhWmtFbTNOM3M4ZDllODhMaFErZnNnRFBCdnJO?=
 =?utf-8?B?emUzUFg3eWRjVDZDMUJDMXVxazFPUnZnQStCTWltRFhNUG41TDNKZnBvVnFR?=
 =?utf-8?B?blI0VXJIcndBeHVjODJxM29xTVVUOWExVzNrREtlS3hGdFF0UDA1aFFkZDZZ?=
 =?utf-8?B?MEZ1VjJOS3VFRGRUcTZ6OUlxczQ0VnEwMllpNmlTQTF3ZFBIZnlQS2xvQndU?=
 =?utf-8?B?UzVaTnI4djJmUSs0UllLZEVLNng2MkFDckErOVpBN1ppMS9xWkE0dTY0NWth?=
 =?utf-8?B?NHpnL3VYZWxuN3pXQ1Y2ejJyTTJKcFM5SFI1bFo2MnlGYlVCL25NL1JMNllD?=
 =?utf-8?B?OUJUbTNlbjhCbFlGcFZoTG5NQVlJZE11amhnRzNiT3BGVm1oaTQ1NDJlNEQw?=
 =?utf-8?B?NXJwQW5VK1RhcCtxS0pacDdtNFNpTHBqRkVQbXhmQk1yOWZNaXoyNjhVQmxw?=
 =?utf-8?B?RnBjVFM0cUF2R2Q5TXhjZ1JtZkdHbmthV3JHZ3BQTGhUU0YvaDBRRS9kYjlY?=
 =?utf-8?B?am9VSkZNZUFkcDhQdjlUS3Q3aEVQL1pvcDhHS2dQTGpDL0c5WnRQZXlEWDZh?=
 =?utf-8?B?RXVwbFlzbXNWeWw1ZFgwMWtlREg2bURKNkFQNlNrQ3NMdkxTQnFFMDltRmFP?=
 =?utf-8?B?cUk1aGx3Z2l6VElOb3ZNTzBsdWpZRjFuS0JnUWNUZkNyakVvWTdiOFh3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4022899009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RDNFcElmN3YzV042WEFLYTRMalM4VEZTVWJJQ0FydlhpOVUyNU0zL2Z1M3Zu?=
 =?utf-8?B?L0RHWWRKZDJzbGd1RDRycGJVTmVvRHJiUW50b3RtNm8wL1ZVRXczZVpRMDV6?=
 =?utf-8?B?WmwxU0t1ME1ZN2h6Y0xvenlLZGhDUjdRWW4vdDRwbm1QVFZubkd6UkM1VGFF?=
 =?utf-8?B?WTN3bElJenk4NmtZUVMzdDlGb2FOMlNKdjdaUmw4NlkxcW9iRWphRHgwbjBY?=
 =?utf-8?B?ZVVUR2RIQUpTUmFocncyVWJQWFRsdmgvV0RzTDhJSGFHT3NHSjFoZ3dFQmFa?=
 =?utf-8?B?cE1SOGVJMURPOElNSXA1TjUrV1c0dE50Q2g1Wkw3eUt0SDZwam4zeUpDaXYx?=
 =?utf-8?B?eDIxaDQvMkNyTStoZkxIemZEdE8ybUppSmpRYkxXRVMxSEFPOFRDY0phRUJO?=
 =?utf-8?B?UzBDL3h6Y2ptQzVyOE9HeUlHVW9zN0dBZHk5SmsrTGJpdW1pSWl5M2lIU2s3?=
 =?utf-8?B?aGN6SEUweHQwbURFeE9VNHIzUDBDTlpWbWVNVlR2UzB2b0hnS3RXQS9Nbmo3?=
 =?utf-8?B?NXhsank2ZzZ0eE11MWI3RE5sZnVQK2dBY1BNUXZseGNuMTJPZnEveWVJbFFE?=
 =?utf-8?B?UmpWYWkzQUNWQlpVTHpJcW55OHVRdUxvY01wQ1BYbzFESTdUMmFEVTh3bC83?=
 =?utf-8?B?bFFGT2JMdWRmeVhTUTZHTkcrWXdIVzlJVnJBZkM1cmgzSjdYc3p2Q2dMMmNi?=
 =?utf-8?B?bkJYeHI1Q3pTRW5ORDdXaXRaRXB3Q3Y4QUZyeGNVSVhTRGMybDNwV2d3WE1J?=
 =?utf-8?B?YStsd0dtbjQ1cjNGYUc3ckpmd05TYXJ1TUQ1eXJMMDFFK0ovemt6cDQxazdM?=
 =?utf-8?B?UkwvMGRSY0kxL0VEMFQ2ZmVDQTJ6Mmh1dWdIMExqUnVvWXVyZjBpSlVZRG1U?=
 =?utf-8?B?cGdsMnI4eG9GdXhMSDNQN0NpM2RUNVpkODVBcHJnZ1RqK3RGd0xSSklxNGJU?=
 =?utf-8?B?RSt2VXk5SnN2ekhmMjVqZnRTWjdPY2RlM0oyZnZVbC9DbkZmZ0VVTFBkZ0da?=
 =?utf-8?B?VE93R1RFMlVxeDZmbVpmSndqNk5LL1VvWFF2SlhScS9KSEhNMHZld2xPNFVD?=
 =?utf-8?B?NElQbFB4OStDZmxqSllnNUZQaDFkMXZOMm9EVzlLNmlPeXp0R1UxRnNSRkNw?=
 =?utf-8?B?aStqV3gxdjA1QTZEZ0xKcnByS0dxYStVWG1wTkFnb1VCR2dEcmJzbXp6Mnlq?=
 =?utf-8?B?SnlzU3ZxMTdOM014dC9RQkpjeFhtYmxzc2VVOHRONndKOWhibEpMMjQycjZk?=
 =?utf-8?B?L0xXTm1Ycy9EUnBBYjBOUnZCc25udDJBcGR2bTZobi9ia0RjTlFzd1lZU0tJ?=
 =?utf-8?B?N0xiYkVTbkxQdktXcjBBVkFmNkh3aVFmMEZmQ0RtcFgyd0lCUi9tZkd5YytT?=
 =?utf-8?B?K1F0dTFucWpGb0VkRHBBQXpGUVNnbzVFZEVtZ0QzMys2eUhHb2FDTU1jWllB?=
 =?utf-8?B?UENhMUREeDlGK1ZFUTl5UVJTNlpjSjg4ODdMNXAyeS9QZWY3ZGJlNUQvWFRQ?=
 =?utf-8?B?TGMwbmhwMzM3bXc4MHVscGw1czc0N2pjYjFpWm82S1h6T0N0OW1WcElmV2RW?=
 =?utf-8?B?RnBKL25LcHI5SkNGakJockFJdUJFUU51MUdzRjc4ZDU2THpFQWgxWjArTjgw?=
 =?utf-8?B?VlR1Y1I2ZFFrYnBMd3JnaytZUVA3K21lTE5lSFhyazZBQzJqVmc1cmJKWFdK?=
 =?utf-8?B?bXFXSTZlbVhhZHZLM1M2MHlHeTMrNHRwblprS3B0SXBSY2F0N2ExOENaVTVr?=
 =?utf-8?B?dVpEeEpzUHZjSFdicVpyZUg0R3ZxNUJHcGYyWXA2ODc2bXZMUnFiSE9TaERI?=
 =?utf-8?B?WW1rdlRSeW5zL1k4b1FVZmxHbHEvTGhrcEtpVlovaEdQT2JiQWN6MTQydE5M?=
 =?utf-8?B?Y3Y1dytkRE5naldBQmtCSmErOTVobWNQeHc3c2dQazhURFkzYng1U3Q5STZl?=
 =?utf-8?B?MDg3SU5WMXh1eTlCWGxOc1JqeTJnTTdvWVJUTFh0NEdOS1hTWDd6MlVocXR5?=
 =?utf-8?B?eFNsblEvcW4rdElrQUh3UCtmOTlRZEFEVmxWU0k2Q09qam8vMTVqN3lTQy9w?=
 =?utf-8?B?ejdvNlhOZWV4WVcxL3V1Zk5YRnNTV3g0RG1lTStOYUh0bm5CVjRTOHJiUm1Q?=
 =?utf-8?B?OU14eTl2am1tanRnRjlYSW1FZzY0OVRudUZJNzN4bk1hVlE2R1VPT3ZEK0pq?=
 =?utf-8?B?dEE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 981b9fdc-63be-4aa7-11e4-08dd026bbcea
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 16:13:11.3636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pu8WdqnS3voxrbDRHoxqZZ6s4qgZh6/vQjhCnZzAGZ9TPMWdM5OmiTW7dRVD9ZltgvATQ0x8ua4eGyYPv2CunWhAi2pVW6hk09KQhMDdIQc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8821
X-Proofpoint-GUID: Ly-_wvF8CGc3HUVdVCq33SUzTfgoBsOM
X-Proofpoint-ORIG-GUID: Ly-_wvF8CGc3HUVdVCq33SUzTfgoBsOM
X-Authority-Analysis: v=2.4 cv=WY9eaFhX c=1 sm=1 tr=0 ts=67322d1e cx=c_pps a=Bc47kgIQ+uE7vzpOcRUeGA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10
 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=mDV3o1hIAAAA:8 a=mJZ8rvJYqx58lWgZD_sA:9 a=QEXdDO2ut3YA:10 a=Dgw8U4_x4KgA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-11_08,2024-11-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 suspectscore=0 mlxscore=0 phishscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 lowpriorityscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2409260000
 definitions=main-2411110132
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 16:13:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206960


Sorry, the subject was wrong, fix the subject to:

groff: Fix race issues for parallel build

Updated in the PULL:

   https://github.com/robertlinux/yocto rbt/race
   https://github.com/robertlinux/yocto/tree/rbt/race

// Robert


On 11/11/24 23:38, Robert Yang via lists.openembedded.org wrote:
> From: Robert Yang <liezhi.yang@windriver.com>
> 
> Fixed race issues for parallel build:
> groff: error: couldn't exec soelim: Permission
> 
> And:
> groff: error: couldn't exec grn: Permission denied
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   ...tbl.am-Fix-race-issues-for-parallel-.patch | 31 +++++++++++++++++++
>   meta/recipes-extended/groff/groff_1.23.0.bb   |  1 +
>   2 files changed, 32 insertions(+)
>   create mode 100644 meta/recipes-extended/groff/files/0001-contrib-hdtbl-hdtbl.am-Fix-race-issues-for-parallel-.patch
> 
> diff --git a/meta/recipes-extended/groff/files/0001-contrib-hdtbl-hdtbl.am-Fix-race-issues-for-parallel-.patch b/meta/recipes-extended/groff/files/0001-contrib-hdtbl-hdtbl.am-Fix-race-issues-for-parallel-.patch
> new file mode 100644
> index 0000000000..de4a55bbab
> --- /dev/null
> +++ b/meta/recipes-extended/groff/files/0001-contrib-hdtbl-hdtbl.am-Fix-race-issues-for-parallel-.patch
> @@ -0,0 +1,31 @@
> +From 771686c042d5f494550d0399f36e00b1ca557b2d Mon Sep 17 00:00:00 2001
> +From: Robert Yang <liezhi.yang@windriver.com>
> +Date: Mon, 11 Nov 2024 14:12:51 +0000
> +Subject: [PATCH] contrib/hdtbl/hdtbl.am: Fix race issues for parallel build
> +
> +Fixed race issues for parallel build:
> +groff: error: couldn't exec soelim: Permission
> +
> +And:
> +groff: error: couldn't exec grn: Permission denied
> +
> +Upstream-Status: Submitted [https://lists.gnu.org/archive/html/groff/2024-11/msg00097.html]
> +
> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> +---
> + contrib/hdtbl/hdtbl.am | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/contrib/hdtbl/hdtbl.am b/contrib/hdtbl/hdtbl.am
> +index 9384fac..70f7bc9 100644
> +--- a/contrib/hdtbl/hdtbl.am
> ++++ b/contrib/hdtbl/hdtbl.am
> +@@ -119,7 +119,7 @@ SUFFIXES += .roff .in .ps
> + 	       -e "s|[@]EGREP[@]|$(EGREP)|" $< >$@
> +
> + $(HDTBLPROCESSEDEXAMPLEFILES): $(DOC_GNU_EPS) groff troff eqn pic tbl \
> +-  grops grn font/devps/stamp contrib/hdtbl/examples/common.roff
> ++  grops grn soelim font/devps/stamp contrib/hdtbl/examples/common.roff
> +
> + uninstall_groffdirs: uninstall-hdtbl-hook
> + uninstall-hdtbl-hook:
> diff --git a/meta/recipes-extended/groff/groff_1.23.0.bb b/meta/recipes-extended/groff/groff_1.23.0.bb
> index 8a16321479..34a42c7e26 100644
> --- a/meta/recipes-extended/groff/groff_1.23.0.bb
> +++ b/meta/recipes-extended/groff/groff_1.23.0.bb
> @@ -13,6 +13,7 @@ SRC_URI = "${GNU_MIRROR}/groff/groff-${PV}.tar.gz \
>              file://0001-build-Fix-Savannah-64681-webpage.ps-deps.patch \
>              file://0001-build-meintro_fr.ps-depends-on-tbl.patch \
>              file://0001-hdtbl-Fix-Savannah-66316-missing-grn-dep.patch \
> +           file://0001-contrib-hdtbl-hdtbl.am-Fix-race-issues-for-parallel-.patch \
>              "
>   
>   SRC_URI[sha256sum] = "6b9757f592b7518b4902eb6af7e54570bdccba37a871fddb2d30ae3863511c13"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206959): https://lists.openembedded.org/g/openembedded-core/message/206959
> Mute This Topic: https://lists.openembedded.org/mt/109516791/7304958
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [liezhi.yang@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

