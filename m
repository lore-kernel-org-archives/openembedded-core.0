Return-Path: <bin.lan.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04FD6C28B28
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 00:47:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4003.1741826850893713470
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 17:47:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5167d38173=bin.lan.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52D0VLCd012648
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 00:47:30 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45b0emsbyk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 00:47:29 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52D0lTW0003115;
	Thu, 13 Mar 2025 00:47:29 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45b0emsbyj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 00:47:29 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lN5d+FnPH/V0rdCDvSur2grfA0ZhA/4IIKTcFa2VeCtorgWbjLA+mnWW4oCcIdIGpu+FHEwB8IgRr2LWCjiLCMKHf1ePYMAn+kklhAR6Y6CR1lGcfRcwxjZTAYiXop+Qq+8FHlEjFVcJg0D9aUhMs2TQgwo1XDTI6nIQnhgKLrOrmYEY95ZxPSymWCwQbIcrAWC6QLXfjFNMzgVcr9CSGYTrfjkjBTmDuDEy+mGEb2YZrZSdrr45RGBQD6gr0SzuKUeHLiqAi0M+7+roS02W3t/E1YtoudE6CAwSyvaecTkSA3Z2YOMehgrC+3debSPqDKXamyGOvxtKkga/lIwNWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WTooeXHnTxYfIF1hAPI2RWFIGe5AFQdGiET26skmZMw=;
 b=mn6/QcP2BN2qOnjgzi69edekNGerCohNwP1OjI3ZdprvMF4D8Y1OtAP1IGOM4sZg/RBYmaub5oZu5EFil+OQVog7sH6KbkRJ+bTvPNi98RiQKQl6ydVhJcZjVA40OsjmhZsRFy0uy6lVgm4PwVFFLNxyH9BknRwftPhXODGE1NE+scYhHzxpHdYFPlrKO7KexMk7oErc1O34fj0gQBBn5Rn4KCxCDMdIDrbh0rMd3LqeR4pAiTcJtj2tp53ON8n6Tbdw7erC3Ds0cnM1bQx5e7/JazN+IvREs+o/xm7YaYzAet/JRPFXIrH2qdGH2/WMcEH/adcYi/wyUc8QXrZ0KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8701.namprd11.prod.outlook.com (2603:10b6:610:1c8::10)
 by CY5PR11MB6344.namprd11.prod.outlook.com (2603:10b6:930:3b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Thu, 13 Mar
 2025 00:47:25 +0000
Received: from CH3PR11MB8701.namprd11.prod.outlook.com
 ([fe80::5727:1867:fb60:69d0]) by CH3PR11MB8701.namprd11.prod.outlook.com
 ([fe80::5727:1867:fb60:69d0%2]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 00:47:19 +0000
Message-ID: <19f457e8-bfa8-455b-92b3-34a2f839afe5@windriver.com>
Date: Thu, 13 Mar 2025 08:48:08 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH v4 1/1] babeltrace2: upgrade 2.0.6 -> 2.1.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20250310071133.2713991-1-bin.lan.cn@windriver.com>
 <20250310071133.2713991-2-bin.lan.cn@windriver.com>
 <CANNYZj96yOjER4+xHS5mxjbcj7QeNookrsR_+ee=pz2_TnEayQ@mail.gmail.com>
 <CANNYZj9Bqvzs=e=99cqhD88z261Y_yt7gKGbmNCeYmONO79=rQ@mail.gmail.com>
Content-Language: en-US
From: Bin Lan <Bin.Lan.CN@windriver.com>
In-Reply-To: <CANNYZj9Bqvzs=e=99cqhD88z261Y_yt7gKGbmNCeYmONO79=rQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP301CA0066.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::7) To CH3PR11MB8701.namprd11.prod.outlook.com
 (2603:10b6:610:1c8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8701:EE_|CY5PR11MB6344:EE_
X-MS-Office365-Filtering-Correlation-Id: b6cb1bad-255a-4404-94f2-08dd61c89be6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dmtJeDh2VncxVGsvdUdxc3NHVDc3M01XaDROblVWU0J1a1gweFB6aTViYm1m?=
 =?utf-8?B?RzVtMllYa1RTRUwxdURyVUdHdEd6RkhxR0ZZdDcxMVJJVWFMdWFFNThZanNP?=
 =?utf-8?B?N3dTYTVJQzRuSTd0N2tWeDV2T0NIU0VOYnJZYTk1VXlUOFNRMjE2ejhpMWFj?=
 =?utf-8?B?L2hTNkNaVVZuTG5MTS9qb2d4c3hpZlY1U1Zwd3BjaDhmbFVhZk9XbHZHMm91?=
 =?utf-8?B?dmJ2dGU5NEgwY3FqQXJoL01od0J6SGtmQjJrL25xd3JTWGJQYS9EOXMzbmVn?=
 =?utf-8?B?dlpCM2dlaXVQTVZTNUFYM2xVR3JhRDhlODZ4VHMwT2lBMU0ycGw3eWlybDJU?=
 =?utf-8?B?YUMrMXFOUklKSkhoYStINWc0aXh0N3J2NjYyd2liRi9IWHJuYXE0UHNTRGNx?=
 =?utf-8?B?cjVqNkFETDJYQVNlMjUxWUdXbXhMVnVlK1M1b3Y0YTBHS0g1K1BuMzVya3Bq?=
 =?utf-8?B?M0x3UCszSzNBNUw4cmVISU5zYmxtSFVhblp4THU1YkpYMFd4Y1M5dHFTR0xo?=
 =?utf-8?B?a0Q2dVhQZFMyWERidDJBelZJL3BIYnNLQUJ3NWJaZ0VMOGp1VTlmMFIraXBl?=
 =?utf-8?B?S1Zha2tsWmhzK29NckRqYU8wK21jekpBNWFsYXlIT2hLbUhKdVBRdlRIcUp5?=
 =?utf-8?B?NlJXYXU4MHBncjdpWHpzVTdnaUMxTEI0ZjhnNU0xOEQyT1RuTkVPNXlOZmUx?=
 =?utf-8?B?QW5WOXlEb3ZONG1DR0ZQU1lKbW1RdUFJbnZHU1piVDJjeDFaVEVRK2Q4dDQ4?=
 =?utf-8?B?MlhOUFE3RmkwemVaSVRPZldyRTUvSUZSNjZmVnJnREVKeWdzTlFxVDlkWW96?=
 =?utf-8?B?V1RJTFQ4MkFFQllwNjlsV2pEOFBiaUJxTVUzaDI0QUZVMXN5ODhjM29hYkNq?=
 =?utf-8?B?UVV0WmMzMHVqRDdBM0d2NHpyZ2tCdVhVdzJWblI5RGEvb0N4d2kxL3BFQVBt?=
 =?utf-8?B?RnVEMXA3aDRENmNhTXArYTJPakdmWms2OVJKT0tOYWFYNkdWbEN4OUMwZ2ZM?=
 =?utf-8?B?Nys5RDNaTlJtK2I2ZXNRYk1IMXJoanplSlAveGVSeXR1R3FsVGlQUTc1YTRK?=
 =?utf-8?B?YlR2TVhHNjY2akJUYkt6Y09xRHFsSTlVUlFlTy9ReS9mdS93dU5tckVScnVa?=
 =?utf-8?B?clNldE9XS0xGSC92YmYwbXVVem5zakdvTnNqOW4zWWRSVGE5WVZNTGxkRER2?=
 =?utf-8?B?L25Td3Y4aU81cm96TW1QWG9LdThMQmFZZ3dTR3hYQmI5UG02WnErZ1pXUmNa?=
 =?utf-8?B?NExtQ0JoQnRJeDhZSzE4NjBLKzQzWURUTWpWaHo5QU14QmZUS2JGTkNsRmdm?=
 =?utf-8?B?RERtZk1QUjNFWEJKZ1RXRlRZU25YMGxxOGRHN2ZQNTVTcmJQQ0dFOHAzUjlL?=
 =?utf-8?B?Q3p6UlY2VDZHOEErMUg0OGNZMFVLa0NFeG9CbmV4dlByWVRJL0YxcU1jUFNu?=
 =?utf-8?B?Vm5ONkxhdDhnbFJmNGNQT3VJWWx6T3cyMXlKYzArTmlPUUpNTE0yOG43Q2VK?=
 =?utf-8?B?dUxKZ3BTb2JvSGU4SE5DQmJwZGx1aThuS1E4b3pVd0ErRGNERmIrTnkxQmxw?=
 =?utf-8?B?QnRZNDlzMjFkREpLUEdsQXUzSjlNeXpNQzIrdUJ5QkYzRlNwZ2thNmNZWVdU?=
 =?utf-8?B?TTlMMlNMbzBWK0VEejhzZGFOd3BkRStTRldzNm1lS2FIVHZNODlGTFk2MnVM?=
 =?utf-8?B?NHFtdHBhTHNrTGlBYnFmTWRhMHRMWDcwdWthUW41Wnp3dE9od0xWNFM3SkpZ?=
 =?utf-8?B?NzZNMzBXZ0dtUWJSemtXck9ySFFPYWthUmxWbklUNnFFa2JKdHBWeE5vbXBy?=
 =?utf-8?B?anBJQnpwczBjK2doR0tOQT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8701.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S1Q0TlRkZ1NpVGVGVWVNSTFRcDNwdE1TbzIvWWRVZHRYYmhyOGpOTXdncDRU?=
 =?utf-8?B?R0ZlSHhPNUZOd1VsK1BpQ3N1OXdDbE9LcFo1dVEvdjBZVFNkZXBnVm04aE80?=
 =?utf-8?B?VFNoVWJ0bnhSR0E0STZVN1pEMFZsemp2NU5aM2dldmtxZlFjVWw1enpLVWZh?=
 =?utf-8?B?b1ZablVIOEVBT3AyVnV1eEhPTXBxY0lURHlFcEc2enRRY0NzRmxURHZYUERr?=
 =?utf-8?B?aGI3cWMrL1ZoeDhMNlByWG5mYzRlSDZDdDJYK0JUVjYvZ3MyOWl6VWo3UE1L?=
 =?utf-8?B?RHdwNGpEb1dyaGZhM2E4UjdhUE1QUWt2MGVjMzV4NzErVitCdWNCejNSM29t?=
 =?utf-8?B?emYyT1dQcDJLMXYzQkhod2xCWDlTTFA5alViQVVRMzhYMXloQ3lEc2t1RGc5?=
 =?utf-8?B?QmNSY0pHYTZzUXlxY1gzVzFPUFRGRFRINUY1VjRnQXVrdUcrLzVtY0JqUHJI?=
 =?utf-8?B?S2ViM2g2VnVVTTg2WlFPVDdZUTlCYnhkdXpLWEx4Vkt1Zjc1SDNOakFKNjNT?=
 =?utf-8?B?aCt2aVpBL3ZUZjE1RUE5blNPckROdmFpUnJXbjFiTDAzcFNRRGt4emJ5akVX?=
 =?utf-8?B?THZXNVkva1NYVGpGQUUvZW1YMStXa2RCenUyMjdNMVM5aUJyUkNRTTh1ZDIv?=
 =?utf-8?B?bWR4UHFaQ0ExM2p3SWZ4UXdlem1yTnJra2ZzNjd1aTJtYnlTUXhLZlM0TDJp?=
 =?utf-8?B?eXdzQ3o4RkFYakZib2VlWFlPVzhlZGNJWnJQU0ZCaEVUME93bzFsY0pzaFRn?=
 =?utf-8?B?MTNRK01ab1VucHlpNXZyWmxKTHN4QmdEWWJUQlNYUmhpVitIL01ENGNhTnFy?=
 =?utf-8?B?bml5K0hlVkw5b05DOUozVVZ1VllGa1pIU21BdU5DYmdWaC9pRSt6RTZ1cGF2?=
 =?utf-8?B?K3laSkNsUnpDOHl2Y240dy96WWdSNXllc2k3c3pWT2hjMjUvUjVHV1FMNCtx?=
 =?utf-8?B?UmlPczdHeEJweERmaDZ0a0FKQVJTVS9tM1lOaE9JSG1ZSWZEeUZuWXN2TE5X?=
 =?utf-8?B?Z2hWNU9MNy9uMWNuWkhxMFdDVzI3NGhUeUhUZ1I5Q3dLLzlaakYydmRFSExk?=
 =?utf-8?B?dUtEMzZCelcvdkdVejVaL0JNUDFRNUhOVGVKZGhSUm5OM25SdkFuN1N5YktQ?=
 =?utf-8?B?TmVNcHpqUUp1ZE93dWJidzgyM1ZtRWdVOHhBb1hVNlRSTW0yVFZjYTdtaDJM?=
 =?utf-8?B?WEZ3dFdJZjI2R1dGMGxLRDRwWStlSmxpRUlGbGdzYnlZTWpldkRSSGlkY2RE?=
 =?utf-8?B?Qm5UQ3ptaEFvd1FWRUVIc25FOFNGZytuMmYvUXZkREorTmNPL2taME51RWJw?=
 =?utf-8?B?dDF2Wjk0bTl5NncwcGRpbnhRM3hudEVmSXFRd2RhQnJ5ZFZkcFZsNzNpeGZY?=
 =?utf-8?B?SUppelFkY0MrL1hWeUlickk1MElVbzRxQ3RRMlNaSkpWVG50MTI4UWNWK0N1?=
 =?utf-8?B?cmkrc0NzSUVzbzVWYlZwUkRsSWZqSDRDdTVjRFNYM0lKaGJzS21MSUdKRGM4?=
 =?utf-8?B?eEF4WmgzZStkU1RXZkpiaGd2NDlFVzF4WlhGS1dsV3F4NEN0RUtTNUI3THlQ?=
 =?utf-8?B?TWYyK0lEdWlSc3JtZEZCL1I4S1N5WVlteHowdEFMNE12enhQY1VYS1ZETmlB?=
 =?utf-8?B?M2xJUEwzTEpmUmUyQzhydFNKUHNqMnoxVkVoTUxVSENCZm5GYXZCZFg2RTRv?=
 =?utf-8?B?SHo5OWswNzloVFZpVnAwYXp0c1FGVUFsUStPdTZFQ1pOM2wwRnhQM3NiMmI1?=
 =?utf-8?B?MEc0a3ZMaWdWMTF1MGdSNEpqRldSY1duOWNVSU9laUFiQXV4YWViZXYrTWJF?=
 =?utf-8?B?RzZrbEZnMk1HL3EwY1ZvL1BOamYwN1U1RkJGak5MOEI3UVFjMWNQYm40VFpS?=
 =?utf-8?B?YWxFRUdzd1RCT1FTSUx4clJDQ2thZjF4VTJLQStrRC85dE1Bb2JsMWdlQ01S?=
 =?utf-8?B?MGVmRVk4d0hJSnYxZE9FSlFuQUdacmpCNkdBZ20rSlMzbnJXZnM3RzJHUzZM?=
 =?utf-8?B?T3oxMUJZQStaSW1WRUlVSE55TGZIb0ZHQmpYYVdDVDU0aEtGSFgyUmVoQnN0?=
 =?utf-8?B?UUZRMFlKTmNIYzBLSWhiSThVUWNxYUtqM0ZUSXBIZ05BUFNWS3dZbFY2T1VJ?=
 =?utf-8?B?RmVWR1FUMGNMeTdhUkFBRFF3QlJ3MGFZeDZZUVZ2RzdybEJOVnNrU1l6VXUy?=
 =?utf-8?B?RkE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6cb1bad-255a-4404-94f2-08dd61c89be6
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8701.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 00:47:19.6434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qbKk3l+1EhNDeeyDswSYUsYpJGXpCZSdoqdQw6sb+Ktrb6WxeR6pPuc5ENtEjHksZSaVrfVarhLwdEbnPJ1I+NRT3oJni4Wo6iRCyvB4Vds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6344
X-Authority-Analysis: v=2.4 cv=J6Gq7BnS c=1 sm=1 tr=0 ts=67d22b21 cx=c_pps a=hHPfuxNGWHHq0fQgDGst2w==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=H5OGdu5hBBwA:10 a=U40Yx87jAAAA:8 a=a5LkSv8FAAAA:8 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=fk1lIlRQAAAA:8 a=7d_E57ReAAAA:8 a=iMW6Obw7H-WenqExjNwA:9 a=_PE9Q_0Z8bzuyU0-:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=BBahhS0D0WQA:10
 a=yv_D6YSC6K1Ih23S2Yuy:22 a=E2cWBXyb0kjxxB1PlMdk:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=U75ogvRika4pmaD_UPO0:22 a=jhqOcbufqs7Y1TYCrUUU:22
X-Proofpoint-GUID: ZvYp0ubMFA1owRbh3qIeMFjOQ2U51RQO
X-Proofpoint-ORIG-GUID: tIykUeiC7HdSlayZ3IRXAVUpdaUUqshp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-12_06,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503130004
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 52D0VLCd012648
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 00:47:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212730


On 3/10/25 20:50, Alexander Kanavin wrote:
> And if the patches are not suitable for upstream submission, then the
> correct status is 'Inappropriate' but even then it's expected that
> upstream is notified (via ticket or mailing list message) of the
> issue, with the idea that they propose a better fix, or a workaround.
>
> Alex

 =C2=A0I agree. I have upstreamed my patch to Babeltrace project. Thanks =
for=20
your review.

Bin Lan

>
>
> On Mon, 10 Mar 2025 at 13:48, Alexander Kanavin <alex.kanavin@gmail.com=
> wrote:
>> Please do not add new Pending patches, especially without an
>> explanation of what is pending.
>>
>> If they're suitable for upstream submission, then you should do so
>> before submitting them to oe-core.
>>
>> Alex
>>
>> On Mon, 10 Mar 2025 at 08:12, Bin Lan via lists.openembedded.org
>> <bin.lan.cn=3Dwindriver.com@lists.openembedded.org> wrote:
>>> From: Bin Lan <bin.lan.cn@windriver.com>
>>>
>>> Update 0001-Make-manpages-multilib-identical.patch with correct line =
number.
>>> 0001-tests-do-not-run-some-tests.patch is used to disable some new te=
st
>>> cases.
>>> 0001-tests-do-not-run-test-applications-from-.libs.patch is deleted f=
or the
>>> commit log is not very accurate and the line number is changed, is re=
placed
>>> by 001-tests-set-the-correct-plugin-directory.patch.
>>> 0001-tests-set-the-correct-plugin-directory.patch is used to set
>>> the correct directory of plugin shared library.
>>>
>>> Copy the trace files (*.ref) and the metadata files (*.mctf) which ar=
e required
>>> by test cases from source directory in babeltrace2_2.1.0.bb.
>>> Set the correct test environment variables in tests/utils/env.sh when=
 running in an
>>> embedded environment. Remove "GREP=3Dgrep SED=3Dsed PYTHON=3Dpython3"=
 from the file run-ptest
>>> for these test environment variables are set in tests/utils/env.sh.
>>>
>>> License-Update: add new license BSD-4-Clause GPL-3.0-or-later CC-BY-S=
A-4.0 PSF-2.0
>>> Babeltrace 2.1 is a major change. Babeltrace 2.1 is released after fi=
ve years
>>> of development after the release of Babeltrace 2.0. The licenses did =
change
>>> significantly.
>>>
>>> Changelog:
>>> Babeltrace 2.1, MIP 1 is available and adds many functions
>>> to support CTF 2 features.
>>> The Python bindings wrap all the library changes in the same
>>> systematic way as in Babeltrace 2.0. Add type hints to the
>>> public API to assist with static analysis of your applications.
>>>
>>> Details about the 2.1.0 release:
>>> https://babeltrace.org/docs/release-notes/babeltrace-2.1.0-release-no=
tes.html
>>>
>>> Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
>>> ---
>>>   ...001-Make-manpages-multilib-identical.patch |  9 +--
>>>   .../0001-tests-do-not-run-some-tests.patch    | 58 ++++++++++++++++=
+++
>>>   ...not-run-test-applications-from-.libs.patch | 28 ---------
>>>   ...sts-set-the-correct-plugin-directory.patch | 29 ++++++++++
>>>   .../lttng/babeltrace2/run-ptest               |  4 +-
>>>   ...eltrace2_2.0.6.bb =3D> babeltrace2_2.1.0.bb} | 33 +++++++++--
>>>   6 files changed, 122 insertions(+), 39 deletions(-)
>>>   create mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-tests=
-do-not-run-some-tests.patch
>>>   delete mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-tests=
-do-not-run-test-applications-from-.libs.patch
>>>   create mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-tests=
-set-the-correct-plugin-directory.patch
>>>   rename meta/recipes-kernel/lttng/{babeltrace2_2.0.6.bb =3D> babeltr=
ace2_2.1.0.bb} (70%)
>>>
>>> diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages=
-multilib-identical.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-Ma=
ke-manpages-multilib-identical.patch
>>> index 2401b176e6..76bef9c3b8 100644
>>> --- a/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multil=
ib-identical.patch
>>> +++ b/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multil=
ib-identical.patch
>>> @@ -5,15 +5,17 @@ Subject: [PATCH] Make manpages multilib identical
>>>
>>>   Upstream-Status: Pending
>>>   Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
>>> +Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
>>>   ---
>>>    doc/man/asciidoc-attrs.conf.in | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>>   diff --git a/doc/man/asciidoc-attrs.conf.in b/doc/man/asciidoc-attr=
s.conf.in
>>> -index ad1183f1..e11c7031 100644
>>> +index 88fb13ce2..27858b720 100644
>>>   --- a/doc/man/asciidoc-attrs.conf.in
>>>   +++ b/doc/man/asciidoc-attrs.conf.in
>>> -@@ -1,7 +1,7 @@
>>> +@@ -4,8 +4,8 @@
>>> +
>>>    [attributes]
>>>    # default values
>>>   -system_plugin_path=3D"@LIBDIR@/babeltrace2/plugins"
>>> @@ -24,5 +26,4 @@ index ad1183f1..e11c7031 100644
>>>    enable_debug_info=3D"@ENABLE_DEBUG_INFO_VAL@"
>>>    defrdport=3D5344
>>>   --
>>> -2.24.1
>>> -
>>> +2.34.1
>>> diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-=
run-some-tests.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-d=
o-not-run-some-tests.patch
>>> new file mode 100644
>>> index 0000000000..11d97a276b
>>> --- /dev/null
>>> +++ b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-som=
e-tests.patch
>>> @@ -0,0 +1,58 @@
>>> +From da489a5476249dbf087cef7f5da57e61aedd443b Mon Sep 17 00:00:00 20=
01
>>> +From: Bin Lan <bin.lan.cn@windriver.com>
>>> +Date: Thu, 6 Mar 2025 16:14:45 +0800
>>> +Subject: [PATCH] tests: do not run cpp test applications and
>>> + src.ctf.lttng-live/test-live.sh
>>> +
>>> +These cpp common test applications are needed to re-build
>>> +in the target. The test cases src.ctf.lttng-live/test-live.sh
>>> +need a local or remote LTTng relay daemon.
>>> +
>>> +Upstream-Status: Pending
>>> +
>>> +Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
>>> +---
>>> + tests/Makefile.am | 13 +++++++------
>>> + 1 file changed, 7 insertions(+), 6 deletions(-)
>>> +
>>> +diff --git a/tests/Makefile.am b/tests/Makefile.am
>>> +index 2a4022bc4..df990218d 100644
>>> +--- a/tests/Makefile.am
>>> ++++ b/tests/Makefile.am
>>> +@@ -128,10 +128,11 @@ cpp_common_test_unicode_conv_LDADD =3D \
>>> +       $(top_builddir)/src/lib/libbabeltrace2.la \
>>> +       $(COMMON_TEST_LDADD)
>>> +
>>> +-TESTS_CPP_COMMON =3D \
>>> +-      cpp-common/test-c-string-view \
>>> +-      cpp-common/test-uuid \
>>> +-      cpp-common/test-unicode-conv
>>> ++TESTS_CPP_COMMON =3D
>>> ++#TESTS_CPP_COMMON =3D \
>>> ++#     cpp-common/test-c-string-view \
>>> ++#     cpp-common/test-uuid \
>>> ++#     cpp-common/test-unicode-conv
>>> +
>>> + TESTS_LIB =3D \
>>> +       lib/test-bt-uuid \
>>> +@@ -225,7 +226,7 @@ endif
>>> + endif
>>> +
>>> + if HAVE_PYTHON
>>> +-TESTS_PLUGINS +=3D plugins/src.ctf.lttng-live/test-live.sh
>>> ++#TESTS_PLUGINS +=3D plugins/src.ctf.lttng-live/test-live.sh
>>> +
>>> + if DEV_MODE
>>> + TESTS_LIB +=3D lib/conds/test-conds.sh
>>> +@@ -272,7 +273,7 @@ endef
>>> + $(eval $(call check_target,bindings,$(TESTS_BINDINGS)))
>>> + $(eval $(call check_target,bitfield,$(TESTS_BITFIELD)))
>>> + $(eval $(call check_target,cli,$(TESTS_CLI)))
>>> +-$(eval $(call check_target,cpp-common,$(TESTS_CPP_COMMON)))
>>> ++#$(eval $(call check_target,cpp-common,$(TESTS_CPP_COMMON)))
>>> + $(eval $(call check_target,ctf-writer,$(TESTS_CTF_WRITER)))
>>> + $(eval $(call check_target,lib,$(TESTS_LIB)))
>>> + $(eval $(call check_target,plugins,$(TESTS_PLUGINS)))
>>> +--
>>> +2.34.1
>>> +
>>> diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-=
run-test-applications-from-.libs.patch b/meta/recipes-kernel/lttng/babelt=
race2/0001-tests-do-not-run-test-applications-from-.libs.patch
>>> deleted file mode 100644
>>> index 805dde8064..0000000000
>>> --- a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-not-run-tes=
t-applications-from-.libs.patch
>>> +++ /dev/null
>>> @@ -1,28 +0,0 @@
>>> -From 582713cc9a013481eeef253195d644020f637ec4 Mon Sep 17 00:00:00 20=
01
>>> -Message-Id: <582713cc9a013481eeef253195d644020f637ec4.1583403622.git=
.wallinux@gmail.com>
>>> -From: Anders Wallin <wallinux@gmail.com>
>>> -Date: Thu, 5 Mar 2020 11:20:04 +0100
>>> -Subject: [PATCH] tests: do not run test applications from .libs
>>> -
>>> -Cross compile specific change
>>> -
>>> -Upstream-Status: Inappropriate [oe-core specific]
>>> -
>>> -Signed-off-by: Anders Wallin <wallinux@gmail.com>
>>> ----
>>> - tests/lib/test_plugin | 2 +-
>>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>>> -
>>> -diff --git a/tests/lib/test_plugin b/tests/lib/test_plugin
>>> -index 652c90cc..1f817c50 100755
>>> ---- a/tests/lib/test_plugin
>>> -+++ b/tests/lib/test_plugin
>>> -@@ -26,4 +26,4 @@ fi
>>> - # shellcheck source=3D../utils/utils.sh
>>> - source "$UTILSSH"
>>> -
>>> --"${BT_TESTS_BUILDDIR}/lib/plugin" "${BT_TESTS_BUILDDIR}/lib/test-pl=
ugin-plugins/.libs"
>>> -+"${BT_TESTS_BUILDDIR}/lib/plugin" "${BT_TESTS_BUILDDIR}/lib/test-pl=
ugin-plugins"
>>> ---
>>> -2.25.1
>>> -
>>> diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-tests-set-the=
-correct-plugin-directory.patch b/meta/recipes-kernel/lttng/babeltrace2/0=
001-tests-set-the-correct-plugin-directory.patch
>>> new file mode 100644
>>> index 0000000000..6a46c821bf
>>> --- /dev/null
>>> +++ b/meta/recipes-kernel/lttng/babeltrace2/0001-tests-set-the-correc=
t-plugin-directory.patch
>>> @@ -0,0 +1,29 @@
>>> +From 32494b1726a881883cb6d317ab76d1ec3f1fa740 Mon Sep 17 00:00:00 20=
01
>>> +From: Bin Lan <bin.lan.cn@windriver.com>
>>> +Date: Wed, 5 Mar 2025 10:51:11 +0800
>>> +Subject: [PATCH] tests: set the correct directory of plugin shared l=
ibrary
>>> +
>>> +test-plugins-plugins/.libs is not exist when cross build. The plugin=
 shared
>>> +libraries are moved from its original test-plugins-plugins/.libs dir=
ectory
>>> +to test-plugins-plugins directory when cross build.
>>> +
>>> +Upstream-Status: Pending
>>> +
>>> +Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
>>> +---
>>> + tests/lib/test-plugins.sh | 2 +-
>>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>>> +
>>> +diff --git a/tests/lib/test-plugins.sh b/tests/lib/test-plugins.sh
>>> +index f83e42baa..939236393 100755
>>> +--- a/tests/lib/test-plugins.sh
>>> ++++ b/tests/lib/test-plugins.sh
>>> +@@ -14,4 +14,4 @@ fi
>>> + # shellcheck source=3D../utils/utils.sh
>>> + source "$UTILSSH"
>>> +
>>> +-"${BT_TESTS_BUILDDIR}/lib/test-plugins" "${BT_TESTS_BUILDDIR}/lib/t=
est-plugins-plugins/.libs"
>>> ++"${BT_TESTS_BUILDDIR}/lib/test-plugins" "${BT_TESTS_BUILDDIR}/lib/t=
est-plugins-plugins"
>>> +--
>>> +2.34.1
>>> +
>>> diff --git a/meta/recipes-kernel/lttng/babeltrace2/run-ptest b/meta/r=
ecipes-kernel/lttng/babeltrace2/run-ptest
>>> index 71a9c81bfb..a0bf33b75d 100755
>>> --- a/meta/recipes-kernel/lttng/babeltrace2/run-ptest
>>> +++ b/meta/recipes-kernel/lttng/babeltrace2/run-ptest
>>> @@ -4,7 +4,7 @@
>>>
>>>   # Without --ignore-exit, the tap harness causes any FAILs within a
>>>   # test plan to raise ERRORs; this is just noise.
>>> -makeargs=3D"LOG_DRIVER_FLAGS=3D--ignore-exit abs_top_srcdir=3D$PWD a=
bs_top_builddir=3D$PWD GREP=3Dgrep SED=3Dsed PYTHON=3Dpython3"
>>> +makeargs=3D"LOG_DRIVER_FLAGS=3D--ignore-exit abs_top_srcdir=3D$PWD a=
bs_top_builddir=3D$PWD"
>>>
>>>   exec 2> error.log
>>>   make -C tests -k -s $makeargs $target
>>> @@ -16,4 +16,4 @@ if [ -e tests/test-suite.log ]; then
>>>       cat tests/test-suite.log
>>>   fi
>>>
>>> -exit $exitcode
>>> \ No newline at end of file
>>> +exit $exitcode
>>> diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb b/meta/re=
cipes-kernel/lttng/babeltrace2_2.1.0.bb
>>> similarity index 70%
>>> rename from meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb
>>> rename to meta/recipes-kernel/lttng/babeltrace2_2.1.0.bb
>>> index 6a0052f779..090d9293e4 100644
>>> --- a/meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb
>>> +++ b/meta/recipes-kernel/lttng/babeltrace2_2.1.0.bb
>>> @@ -2,17 +2,18 @@ SUMMARY =3D "Babeltrace2 - Trace Format Babel Tower=
"
>>>   DESCRIPTION =3D "Babeltrace provides trace read and write libraries=
 in host side, as well as a trace converter, which used to convert LTTng =
2.0 traces into human-readable log."
>>>   HOMEPAGE =3D "http://babeltrace.org/"
>>>   BUGTRACKER =3D "https://bugs.lttng.org/projects/babeltrace"
>>> -LICENSE =3D "MIT & GPL-2.0-only & LGPL-2.1-only & BSD-2-Clause"
>>> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da6a458c13f18385b7bc5069a6=
d7b176e"
>>> +LICENSE =3D "MIT & GPL-2.0-only & LGPL-2.1-only & BSD-2-Clause & BSD=
-4-Clause & GPL-3.0-or-later & CC-BY-SA-4.0 & PSF-2.0"
>>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df6b015e4f388d6e78adb1b1f9=
a887d06"
>>>
>>>   DEPENDS =3D "glib-2.0 util-linux popt bison-native flex-native"
>>>
>>> -SRC_URI =3D "git://git.efficios.com/babeltrace.git;branch=3Dstable-2=
.0;protocol=3Dhttps \
>>> +SRC_URI =3D "git://git.efficios.com/babeltrace.git;branch=3Dstable-2=
.1;protocol=3Dhttps \
>>>              file://run-ptest \
>>> -           file://0001-tests-do-not-run-test-applications-from-.libs=
.patch \
>>>              file://0001-Make-manpages-multilib-identical.patch \
>>> +           file://0001-tests-do-not-run-some-tests.patch \
>>> +           file://0001-tests-set-the-correct-plugin-directory.patch =
\
>>>              "
>>> -SRCREV =3D "0a6632f77801f3218a288604c646f8a39cb0d2c4"
>>> +SRCREV =3D "e61d41ff3c3ac6a123930d4e60cf710ff9ea18e0"
>>>   UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>2(\.\d+)+)$"
>>>
>>>   S =3D "${WORKDIR}/git"
>>> @@ -33,6 +34,14 @@ LDFLAGS +=3D "${@bb.utils.contains('DISTRO_FEATURE=
S', 'ld-is-lld ptest', '-fuse-ld
>>>   # coreutils since we need full mktemp
>>>   RDEPENDS:${PN}-ptest +=3D "bash gawk python3 make grep coreutils fi=
ndutils"
>>>
>>> +do_configure:append() {
>>> +    # when doing cross compile, the path ${B}/src/plugins/ctf/common=
/src/metadata/tsdl
>>> +    # is not created by the babeltrace2 build system. It is need whe=
n generating
>>> +    # parser.cpp by executing /bin/bash ../../git/config/ylwrap.
>>> +    # So make this directory after configuration.
>>> +    mkdir -p ${B}/src/plugins/ctf/common/src/metadata/tsdl
>>> +}
>>> +
>>>   do_compile_ptest () {
>>>       make -C tests all
>>>   }
>>> @@ -51,6 +60,10 @@ do_install_ptest () {
>>>               -exec install -t "${D}${PTEST_PATH}/tests/$d" {} \;
>>>          find "${S}/tests/$d" -maxdepth 1 -name *.expect \
>>>               -exec install -t "${D}${PTEST_PATH}/tests/$d" {} \;
>>> +       find "${S}/tests/$d" -maxdepth 1 -name *.ref \
>>> +            -exec install -t "${D}${PTEST_PATH}/tests/$d" {} \;
>>> +       find "${S}/tests/$d" -maxdepth 1 -name *.mctf \
>>> +            -exec install -t "${D}${PTEST_PATH}/tests/$d" {} \;
>>>       done
>>>       install -d "${D}${PTEST_PATH}/tests/data/ctf-traces/"
>>>       cp -a ${S}/tests/data/ctf-traces/* ${D}${PTEST_PATH}/tests/data=
/ctf-traces/
>>> @@ -92,6 +105,16 @@ do_install_ptest () {
>>>
>>>       # Remove architechture specific testfiles
>>>       rm -rf ${D}${PTEST_PATH}/tests/data/plugins/flt.lttng-utils.deb=
ug-info/*
>>> +
>>> +    # Set the correct environment variables when running embedded en=
vironment
>>> +    envsh=3D${D}${PTEST_PATH}/tests/utils/env.sh
>>> +    sed -i "/BT_TESTS_SRCDIR/c\_set_var_def BT_TESTS_SRCDIR '/usr/li=
b64/babeltrace2/ptest/tests'" $envsh
>>> +    sed -i "/BT_TESTS_BUILDDIR/c\_set_var_def BT_TESTS_BUILDDIR '/us=
r/lib64/babeltrace2/ptest/tests'" $envsh
>>> +    sed -i "/BT_TESTS_AWK_BIN/c\_set_var_def BT_TESTS_AWK_BIN 'gawk'=
" $envsh
>>> +    sed -i "/BT_TESTS_GREP_BIN/c\_set_var_def BT_TESTS_GREP_BIN 'gre=
p'" $envsh
>>> +    sed -i "/BT_TESTS_PYTHON_BIN/c\_set_var_def BT_TESTS_PYTHON_BIN =
'python3'" $envsh
>>> +    sed -i "/BT_TESTS_SED_BIN/c\_set_var_def BT_TESTS_SED_BIN 'sed'"=
 $envsh
>>> +    sed -i "/BT_TESTS_CC_BIN/c\_set_var_def BT_TESTS_CC_BIN ''" $env=
sh
>>>   }
>>>
>>>   do_install:append:class-nativesdk() {
>>> --
>>> 2.34.1
>>>
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#212489): https://lists.openembedded.org/g/openemb=
edded-core/message/212489
>>> Mute This Topic: https://lists.openembedded.org/mt/111614780/1686489
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=
 [alex.kanavin@gmail.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>

