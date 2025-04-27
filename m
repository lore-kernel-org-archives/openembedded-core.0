Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4304FC369CB
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 02:18:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.20090.1745720311976292615
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Apr 2025 19:18:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=62127ed986=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53R0A3C4016698
	for <openembedded-core@lists.openembedded.org>; Sun, 27 Apr 2025 02:18:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 468pf913rb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 27 Apr 2025 02:18:30 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53R2IUTQ014035;
	Sun, 27 Apr 2025 02:18:30 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2046.outbound.protection.outlook.com [104.47.58.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 468pf913ra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 27 Apr 2025 02:18:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bsn+0OqvWJJE6n+XntDsXBhd7NxzPojxgpX0z6qn0Kq10L3iZVc50BC+/mKSeV/M+gDKuFZEeUB6fQf8MbyH/zuMHk7XpGlDyoTRFbOYssmfmraa6ACFKUjNi7opIBByINjZJbxXi05Rbar02SPPvBJmbA4U4R+WTgkar1aUZX5FzM/TxHk58qhVxZOmQVATBAt1jR07aHzAciXnUF9OSnqERHNcI4y9MuWrBcvh7D66R0cTxcks5/5/PiDWikmuupVuLpd6BUDEbU1TzlE9JzdthI5I+kClHChu5t4okyEYvTBi/gd4KznNpitmeKn5MIyZX1eMPPGO2pwy20Rq2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mvc1kj2QxjL718bHrELWxoyChmgl5++fzBX59/pfrk8=;
 b=u8EQZ3Irj5X/k6a0d0fzcgoQSZ16Fw+D7UkbhK0afm3rvlpP2Z0syEN9kTXBDM5djLy07V2ykwqF8JinK+fGD+xbcCn5+R0oExwK0V53AcxocshymGdSP/u2oIhCs0A8gT9GFoI9e2iN3Xh16UZUkYGbkNA0uXzpW6idgotLhuEpAFzEGVP5RfQ1U6QIiAz4Tbzto6/Kd4emAKpcSJPleZxFjiRNz6sZiDpOAlQt6F6WtNBVWglJp0dYsq+Olr/xt9IVHsq7uz+db4i2XcdzzcT3J06i1isfmtkJcHTGYsl6mUqdEWvxMvE2TvsyqU+3qyudEkA1mhaB2ZN6806aEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DM3PPF49E43CAC1.namprd11.prod.outlook.com (2603:10b6:f:fc00::f1c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.28; Sun, 27 Apr
 2025 02:18:26 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.8678.028; Sun, 27 Apr 2025
 02:18:26 +0000
Message-ID: <46f27f5f-ffe9-4ec0-9c2b-a2a6e6bf3056@windriver.com>
Date: Sun, 27 Apr 2025 10:18:21 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/2 v3] sassc: fix runtime version
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20250425073757.498411-1-yi.zhao@windriver.com>
 <20250425073757.498411-2-yi.zhao@windriver.com>
 <CANNYZj9p6PoEKJ+FC+K=goQWhGSDi5n+AcGJ8yzq1U5PSXcCcg@mail.gmail.com>
Content-Language: en-US
From: Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: <CANNYZj9p6PoEKJ+FC+K=goQWhGSDi5n+AcGJ8yzq1U5PSXcCcg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TY2PR06CA0042.apcprd06.prod.outlook.com
 (2603:1096:404:2e::30) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DM3PPF49E43CAC1:EE_
X-MS-Office365-Filtering-Correlation-Id: 0769b45c-e397-4684-6d9b-08dd8531cb08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MUxJTTQ2THFCWWJBaHNjb21GNDR0Z3ZvRnNtWVpqazlGcEdyUm03dW5iVHhu?=
 =?utf-8?B?aWpUNFhDckpPa0dFR25xTVZ2VURhNU1rT0x3Yk1JbTFYU2dmTjQ2c29GVjh0?=
 =?utf-8?B?VURHQkxZYTRnL0o2VFRKVGFaOUx2aHdIdUU2c0pRQXVsRXpjL2lrbUxYWWRU?=
 =?utf-8?B?N0NobHMxbGNKSmJFTURVL016Ym9pL3UwbWtmQjMvLzc0TDZQVWEvSm82Tmd3?=
 =?utf-8?B?UlI0TE1jL3VpNHpRZjZ5MXZDUjFuSHJDb2VDL0d2Ti8wUldQQUNjdnpnSTdq?=
 =?utf-8?B?My9sVVRFVVFIdUVvUzZLak9hRTRMYUxxUXhXZnhQWFFUUW1PQThwSkR4YU9W?=
 =?utf-8?B?U29BaFBIT2ltb1ZCbThEN0plQ08zaHEyclBGK1BhMlk1NTBjUjVPUjFoZk0v?=
 =?utf-8?B?WEhIMzB6SFdsUXJmMzF2cTk2eEtUbi92dWFSK3hycWF4MmY1S0JhcXUwcWFH?=
 =?utf-8?B?ZGREMmRRMmtrL1F2RzFrV0d0RlN1NHVwc1RpKy9IZWtDSUFKTzZpRitjWkl3?=
 =?utf-8?B?MU41eTJDb1c4OEJqN2ZxeHR5QmNwRjFnTzBHMnNlWCtQZjE0akJvZm1aeVFs?=
 =?utf-8?B?dnplN0VDS2dqT0NEUE5DQ21WUGNSdEg5ellBa0xsbVRpWHpGbUt4VUhVazMz?=
 =?utf-8?B?bHZCVE9lbFpWVVhqc09ZZFkyanlIczlPUDhwZ0tEZnI2ZitFUVpiTmdJbCsy?=
 =?utf-8?B?RTdqYUpWaG15aTg3VG9YRjhzQjdZVUQvUGxTZDdWV1M5dkxCbmdwdzNLNTMx?=
 =?utf-8?B?eVBtaUFiYTIzTno4anJZdE8xT0IwMnAzQTNJbUFXc1gxejlBTjk2dks3c01G?=
 =?utf-8?B?NlZIT25ESXZnYVY2K2h1U3BKWVc2aVZ0RVluLzhHK3VmRisyOG8xWEF4eDRr?=
 =?utf-8?B?M0dYMHBUV1VRY010Ri8waG9JbjlEMVBUaTd1VnM3dGhRV2RQd1V1d1h2YnZl?=
 =?utf-8?B?TVFKek41UHRTd2psNldUbWEyc1FjaFZVaVV1SWRLQ01sYXJYNFRmWGdRSGFm?=
 =?utf-8?B?RjBHcjgyK3dQTDdTckl4S25UVkYyalBGck83a0ROUnRtK1dMZ21mOHVyV21r?=
 =?utf-8?B?SzFJY0hZbGFHME43TE5PQ296M2tjN0tpZy9WY0djM2FjRGNtWkh4dm0zVks0?=
 =?utf-8?B?MHZ1OS83ZFZieGNsdmhNN1JRMGhjVndnaG5BOUxBUWpLajc4L21zQk5JR0J5?=
 =?utf-8?B?NnpWK0ZZYUorckFCb0VRQWlITXpVNjg0VEZ1NUtLYnhEQXJkVEhwcDBBQXgr?=
 =?utf-8?B?Q3NBZlpBL09RUVRUUm5xNk00NGkwV0I0YU0yeVNscHBaZEtqRGVJdXN0dDEy?=
 =?utf-8?B?M09Jd1JPMEZyTXFXbGVLMU9NQlpBNTBXRzBZZHlLM1VWYW9FYkMxWStrNVIw?=
 =?utf-8?B?d0tOQWlPbWtydEtuWnEzQjJudDZrZ0xvRzNCeElNekJ3UHRaZHU2SDFOL1Ri?=
 =?utf-8?B?UWgrYk8yM0VLS3Z3bjFTRlpuMWtFL2g1TEVGcUE3eU5SclFsR3diemtSa3Rk?=
 =?utf-8?B?aVBpYUgwU3FISUJ1aC84UEIwdTI5Vk5UMTZyZmFLc1hRYVlKaHhZSTVhQUxS?=
 =?utf-8?B?N3dxMHBkM2xiTXRxMVZIcHJUSElXbFN1NVFvUzNzSWFvb0d4NllZQlBKcy9j?=
 =?utf-8?B?dEhncnlxQS9hY014Sk5kYXhxQW1iUGFYVFdrRnlkUU5kZHRIRk1GeDlmdW51?=
 =?utf-8?B?cUVVYTM2SFFZMUtIT2d0N2pzcUNmaUNTUFN0QWdMVE1ySStBeGpsRTUzUkxP?=
 =?utf-8?B?SGhWMlg0RXZ3ZTdBSm4yZ2Jud2hIV0pocTJ5a2ZHQUNhTjlhYVdobm4xd1B3?=
 =?utf-8?B?U0lpRG5NeHpFU2ErK3NKeC81dk9NQ1MvTFgyN2hrZCtjVlBkY3JuSnc1MC9M?=
 =?utf-8?Q?rr/g7VPZLqIB9?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(4022899009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eFFTK3djR3BpajVBeGRKNlhJMmxyVU9kdzhjYm5oUFNGa1VNTHBKM2gvaTRy?=
 =?utf-8?B?MXljVS8rZTM2WGtOVFVVSjZaYU9OMEVnVC9naWZ3bTJWOU41RzBLY1NMZWp2?=
 =?utf-8?B?T3lmNVQyVWpjcXZYOUZNN1JLZGFkd0FnakxnL1J3OWZiME44M2ZKOVd6cEU4?=
 =?utf-8?B?NXZBM2xoWGdZaTJRMG8xWmRZNEZXTE12KzBzNk11T2tybUdNOVZrVDdjZklm?=
 =?utf-8?B?U0ErTkhOSUtnRnlxSnladlhOdkJmQmFWZE5sUy9yTzZValkzbThmdHg0UHlU?=
 =?utf-8?B?ZkFXbHhaNlpobmRtYjkrQVRxejgrdTFnQUdyMSt0QXFlL1ZKMUlCWmJuV1BU?=
 =?utf-8?B?ZmRPOUZobi9CYzdDaFRIN1RVY1BGT1dFcnRYVTVRMVFhZGYwZmt5dmVlVEc1?=
 =?utf-8?B?ZmhxdGY5WVRWUDI1OVZFK2hUYUg0TDByQXpvc0xXRFlPbUdMVmlObmlFUElB?=
 =?utf-8?B?YnQyK21KUjFGRlZmOVlLRmFYKzErTkdnMWQ3b1U4V040YjFhNCtXRmloMFZJ?=
 =?utf-8?B?MWFBNlA1TXRZM2dnL3BsdUMwRTlHWGNOMjA0bWYrRjNtbmFtZFZYNzduUDkv?=
 =?utf-8?B?d2pTRUZod09QbXlxWnVSM0h5ZEdPaE5xeFNpdHk0Vm9ZN0lsbWMzak1QMzRq?=
 =?utf-8?B?VWRtNS81MmpURUFOSlM4NVdyaUNzdDk5ejRJeXJRam1tNFhVWjhrbjhRZ1Z2?=
 =?utf-8?B?dC9tQXZQbWJ1eXlYZE9YU2xCWDJDMzZCOWVJMmNSMWNZSWhJRjQ5NHBlNER6?=
 =?utf-8?B?MTRqT0pNSEl3N2pROXZGM0I3TVgzbk9sbHRVS05ITUpnSHJCeWcxREFYUklP?=
 =?utf-8?B?b29sSTVsb29aWVl3R0NUTVZaM2RUdyt5NENBYVlRSElBbVpqd0U1TDRtSzdI?=
 =?utf-8?B?aUx0bmRxSFcyNVBzVTZFQ3dIZ2FVc0p0cG5IbFU1NE1SN04rR2xmVzlubWpT?=
 =?utf-8?B?dmZ1K0pKZ1gxc2J0V25RZlZJemxxNUQweEFiUmFiTUhFT21YeW5UK1poL09t?=
 =?utf-8?B?RDJIUHozT0NLU2dDdWdHWXk2T2o1VHNYSFpmMVdUaThpZzVXVTRjclVoNG5z?=
 =?utf-8?B?QmdyY1ZUUFhocmU0bU5mWVkrTUc5WFFIVWFGc0ZkeFNIMmd3K2p6TU1Jdkwv?=
 =?utf-8?B?K2tBT2hBM294U3RIM1h5L0FQQzlJVGwyQnZybldEVzlhclU5ZlBvWmJkRnln?=
 =?utf-8?B?ZXlwbllwczdzTFo5bXFmVk9OZ3dmZU51VkhPVGtZK3h1VEdUTVR4RGdRcFJX?=
 =?utf-8?B?UUhmeG5lYmRxREtnQWFIcXFRQzM2QUNlb3duT3dmZUE0T3VJNUtUeE1rM3c5?=
 =?utf-8?B?eWRDSC9rU25MZHpVRkRvalVDTmIxTktUODBZeCtvTlFweWpnMW9MdjN3OFVm?=
 =?utf-8?B?ME44VVB3ZHZZdjFNSHcyNXEvcmZsSk9jaGNVMmJ1Y28wVjdhSG9BallqcEZI?=
 =?utf-8?B?VUJwcGpScy8rSStaUTd6K2NPU2Z1N3dGc0NDQTl4dC8ySHpUbGlOa05vaWtJ?=
 =?utf-8?B?WGE3MlFxcEVwZFhQKzJmZnNrbnF4ZHFjZDFwYWtNL0pwN0FENkxIS0czVW9y?=
 =?utf-8?B?N2M5d3pPNXdYUDZuL1M4S2xwSnBJOWoyVW1rczBQcS9TYWJreHExcHJFZzc1?=
 =?utf-8?B?TUtCaGZENGM0TUZjQ080dm9wQlRKM0J5OVlqY015YW5zaGNtRFBaRGx4Z3dW?=
 =?utf-8?B?OHBPNEVQam9DdzEwbDl6eVFyZmtVV2JkRHh6bll0VGFkalN1MHVqKzVYR3lF?=
 =?utf-8?B?SERhZldvVTd5blp1NTg5ekxHVWhIV1RsMFhRYWNYNG1QRk9yQ3dkanpMUGZW?=
 =?utf-8?B?K2M1NzhOQ1lwZk9EYVMwTHFGdEg4L0pZMm5MSlRpWndLc09VK3NsZG0xMExs?=
 =?utf-8?B?MFN5Q3B5YytTNEdtdkUrczUyNVkwaFMxWFlWMm1rSWl2M1JNbWU5aHRJVXV4?=
 =?utf-8?B?VmowY1dnYmtoYy81SDA2N1lyclpHRWZ5M2ZsQmwva0YyS0tnWWdaVzJtbWlN?=
 =?utf-8?B?U3hMSkFOYjdodVZTbU8wajhxMHRXdldkZlE3YnJ1TnRRcld3VDE2azluNSts?=
 =?utf-8?B?SE5tK3pDM0lHNVJETU9VL1g0Uzg2eng0V2U4aGRFRXVvNDFGUmhvb2hHZ3pF?=
 =?utf-8?Q?dGD6pKKqKMWCM+N5+qAAGMBGM?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0769b45c-e397-4684-6d9b-08dd8531cb08
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2025 02:18:26.5382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wrAkGTsBU29rPupZThYtdoy/REDOCpPTg2mSki6Ha88WcVp6hfY5FkQWRHjWJXbmq0B+Dt9HzFrzda9NXfJpzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF49E43CAC1
X-Proofpoint-GUID: KulEw4pfeGRdxfORdeSVqkJi9KcQTox8
X-Authority-Analysis: v=2.4 cv=EavIQOmC c=1 sm=1 tr=0 ts=680d93f6 cx=c_pps a=ur2hu7Zt/Tb0cWAHmjvzJg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=R4zn0fMUQI9_99QQl7YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI3MDAxNSBTYWx0ZWRfX9Hz0oN42q3k0 VpRVCabVs7oIsl+vjvAqoNx0sYsaD5mMXJiBCAVX9wYbSSN6ezrEzTrikcKBw3c73PaFwQWsrJQ B4KtQu/peD6Ft07fiWQmwFQbcMdyMkrp5AQGCJ/cuUiDRqAdOflHsP6Owf2CkiD8cbGso5Hfsty
 OCgNkuj+pX2ta9bIcpzqe7+l7wx6nRrjUClTDpJtnQy7+juNVTl32mnAjxcV02DwNSutvEPSXeW n4Sy1ljjSlPkm36cg04O/XkjXFKPZJaQzfwtSQRcgPdvqvybUFtYTRzx0YUAUTMzJ+af0lMSE1E 2VMHKsgcrDInsIABIZW/rWekmlIbOi65xMbhh5O9ZBWMCSxjqMXLrvqNDGg9M9WMkKff2Eqj5Gz
 eveK+6qYF1LZ4MveF5I9Yfmn89UOTnWjNFXP7FmbDb2Qa0jwpBlShK2pmq6zORzJBRD21pfq
X-Proofpoint-ORIG-GUID: 9YtZjlJvx4ujIc3HfyWa5qomC-FAbuNO
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-27_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 mlxscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504270015
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 53R0A3C4016698
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Apr 2025 02:18:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215529


On 4/25/25 16:11, Alexander Kanavin wrote:
> Thanks, v3 for both patches look good.
>
> Can you review usage of these components in core and meta-oe? Are they
> optional or hard dependencies?


Only 2 recipes depend on it. libadwaita (in oe-core) and adw-gtk3 (in=20
meta-oe). There is no build option to enable/disable this dependency.

For libadwata, if sassc is not found, it will try to build sassc itself.

In src/stylesheet/meson.build:

sassc =3D find_program('sassc', required: false)
if not sassc.found()
 =C2=A0 subproject('sassc', default_options: ['warning_level=3D0', 'werro=
r=3Dfalse'])
 =C2=A0 sassc =3D find_program('sassc')
endif


//Yi


>
> Alex
>
> On Fri, 25 Apr 2025 at 09:38, Yi Zhao via lists.openembedded.org
> <yi.zhao=3Deng.windriver.com@lists.openembedded.org> wrote:
>> The sassc_version.h should be generated from sassc_version.h.in. But
>> there is already a sassc_version.h file in source directory. When ${S}
>> !=3D ${B}, the sassc_version.h is generated in build directory, and th=
e
>> original sassc_version.h in source directory is not overwritten.
>> However, the latter is used during the build, resulting in a missing
>> runtime version. Remove sassc_version.h from source directory to ensur=
e
>> that the one in build directory is used during the build.
>>
>> Before the fix:
>> $ sassc --version
>> sassc: [NA]
>> libsass: [NA]
>> sass2scss: 1.1.1
>> sass: 3.5
>>
>> After the fix:
>> $ sassc  --version
>> sassc: 3.6.2
>> libsass: 3.6.6
>> sass2scss: 1.1.1
>> sass: 3.5
>>
>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> ---
>>   ...assc_version.h-from-source-directory.patch | 61 +++++++++++++++++=
++
>>   meta/recipes-support/sass/sassc_git.bb        |  4 +-
>>   2 files changed, 64 insertions(+), 1 deletion(-)
>>   create mode 100644 meta/recipes-support/sass/sassc/0001-Remove-sassc=
_version.h-from-source-directory.patch
>>
>> diff --git a/meta/recipes-support/sass/sassc/0001-Remove-sassc_version=
.h-from-source-directory.patch b/meta/recipes-support/sass/sassc/0001-Rem=
ove-sassc_version.h-from-source-directory.patch
>> new file mode 100644
>> index 0000000000..c6717995c5
>> --- /dev/null
>> +++ b/meta/recipes-support/sass/sassc/0001-Remove-sassc_version.h-from=
-source-directory.patch
>> @@ -0,0 +1,61 @@
>> +From b5d03d5313d4cc19a7e6e9ba5fd74d1f8400cd46 Mon Sep 17 00:00:00 200=
1
>> +From: Yi Zhao <yi.zhao@windriver.com>
>> +Date: Thu, 24 Apr 2025 21:28:55 +0800
>> +Subject: [PATCH] Remove sassc_version.h from source directory
>> +
>> +The sassc_version.h should be generated from sassc_version.h.in. If t=
he
>> +build directory is out of the source directory, the sassc_version.h i=
s
>> +generated in build directory and the original sassc_version.h in sour=
ce
>> +directory is not overwritten. However, the latter is used during the
>> +build, resulting in a missing runtime version:
>> +
>> +$ sassc --version
>> +sassc: [NA]
>> +libsass: [NA]
>> +sass2scss: 1.1.1
>> +sass: 3.5
>> +
>> +Remove sassc_version.h from source directory to ensure that the
>> +sassc_version.h in build directory is used during the build.
>> +
>> +Also remove '--dirty' option from 'git describe' command line in
>> +version.sh to get rid of '-dirty' suffix from version number that
>> +was introduced with this change.
>> +
>> +Upstream-Status: Submitted [https://github.com/sass/sassc/pull/283]
>> +
>> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> +---
>> + sassc_version.h | 8 --------
>> + version.sh      | 2 +-
>> + 2 files changed, 1 insertion(+), 9 deletions(-)
>> + delete mode 100644 sassc_version.h
>> +
>> +diff --git a/sassc_version.h b/sassc_version.h
>> +deleted file mode 100644
>> +index 3ca12e3..0000000
>> +--- a/sassc_version.h
>> ++++ /dev/null
>> +@@ -1,8 +0,0 @@
>> +-#ifndef SASSC_VERSION_H
>> +-#define SASSC_VERSION_H
>> +-
>> +-#ifndef SASSC_VERSION
>> +-#define SASSC_VERSION "[NA]"
>> +-#endif
>> +-
>> +-#endif
>> +diff --git a/version.sh b/version.sh
>> +index d56af99..cf97d82 100755
>> +--- a/version.sh
>> ++++ b/version.sh
>> +@@ -1,5 +1,5 @@
>> + if test "x$SASSC_VERSION" =3D "x"; then
>> +-  SASSC_VERSION=3D`git describe --abbrev=3D4 --dirty --always --tags=
 2>/dev/null`
>> ++  SASSC_VERSION=3D`git describe --abbrev=3D4 --always --tags 2>/dev/=
null`
>> + fi
>> + if test "x$SASSC_VERSION" =3D "x"; then
>> +   SASSC_VERSION=3D`cat VERSION 2>/dev/null`
>> +--
>> +2.34.1
>> +
>> diff --git a/meta/recipes-support/sass/sassc_git.bb b/meta/recipes-sup=
port/sass/sassc_git.bb
>> index b7f57ca244..64e92f48cf 100644
>> --- a/meta/recipes-support/sass/sassc_git.bb
>> +++ b/meta/recipes-support/sass/sassc_git.bb
>> @@ -7,7 +7,9 @@ DEPENDS =3D "libsass"
>>
>>   inherit autotools pkgconfig
>>
>> -SRC_URI =3D "git://github.com/sass/sassc.git;branch=3Dmaster;protocol=
=3Dhttps"
>> +SRC_URI =3D "git://github.com/sass/sassc.git;branch=3Dmaster;protocol=
=3Dhttps \
>> +           file://0001-Remove-sassc_version.h-from-source-directory.p=
atch"
>> +
>>   SRCREV =3D "66f0ef37e7f0ad3a65d2f481eff09d09408f42d0"
>>   S =3D "${WORKDIR}/git"
>>   PV =3D "3.6.2"
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#215435): https://lists.openembedded.org/g/openembe=
dded-core/message/215435
>> Mute This Topic: https://lists.openembedded.org/mt/112447458/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[alex.kanavin@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

