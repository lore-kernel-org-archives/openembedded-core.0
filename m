Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7D2FC369C2
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 01:18:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3547.1744939107085147435
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 18:18:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=62031b095f=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I0pF7u032690
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 18:18:26 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45yqpkpx2f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 18:18:26 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53I1IPiT006169;
	Thu, 17 Apr 2025 18:18:25 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2042.outbound.protection.outlook.com [104.47.58.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45yqpkpx2e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 18:18:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=enCgo3CDOtwIGIDAoThH/7mCtaysTdXdUuaz5mm6txMrcSPo7YCt49WGDvf229hKR49EAQfBFIQbyLZkAIRlJGuv2gxHxbVPvlHK5Oz2UBbOnat3Xm04SoVAJ+sIZr7371C7AnaNLGQ5v4FKyxqAu9lxNHPnVNQBU4F/Qo5GwdWGsPpYS7mOGjtie7W8C6ZsOIg6doBDjaIS1g3FnMxy6BnAxoHa+j+MKvkj+cnWbslqrN/dgMl5/3A1iMPbLOFL+cVNF+x0725LFXF1//go/q5ggy3UxOoFDdGvomG61YNYSupkXCGpZv98xTv7Xsb2i/UBRMb4rZLyO+F+/Rh14g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4WpyvswZDAjjc38AL02TM/E3fTQNuJSJXXFLsGfEUIQ=;
 b=D562RdB37KBf+wHUvPCKQpl/nsjpNnd1ZERLKI3FYZB7fOFdGcWRsKNmohVWZmVjJZI/V80lcqJA1iiPlI3kcE8pBznOFqgKBBds3TeViWhwo0WFnD+6c1u5YvL14gSrne08rVeahV9FCbSa1KM5Gzoqzjt/aUyLpCNvz/yPkrCxM5g/Kg6xA4ug4CWrgYPX8eKj9MIbotFUHeDbaXvxWImOiteuRKk0h2Ssjbr7rN2VHiw/OAr82dUz8qa08zhgmTmZeOAm/KQTBFPO4475a0JGsdf04taTIjuwar1RUQLLH50IM/q/1jH/oyg2LkGFp/lRJHX1WPA88JjLTuFE4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by DS4PPFE12D62847.namprd11.prod.outlook.com (2603:10b6:f:fc02::58) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.26; Fri, 18 Apr
 2025 01:18:22 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%3]) with mapi id 15.20.8655.021; Fri, 18 Apr 2025
 01:18:21 +0000
Content-Type: multipart/alternative;
 boundary="------------oELl1QZI4cnvNHelcWwrpWdb"
Message-ID: <43c86e60-db11-492f-8736-176a8c8a4849@windriver.com>
Date: Fri, 18 Apr 2025 09:18:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][PATCH 1/3] buildtools-tarball: move setting
 of envvars to respective envfile
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
References: <20250417022147.2776717-1-changqing.li@windriver.com>
 <CAOSpxdYfQwhauJe_qZkxXmX7n4fxjX1FrL1RAKfs7J==qLnUEA@mail.gmail.com>
 <CAOSpxdZvrcCgyRvGKpubRocvpiy1WA3_FPMw6zRtAxTxgNYgmw@mail.gmail.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CAOSpxdZvrcCgyRvGKpubRocvpiy1WA3_FPMw6zRtAxTxgNYgmw@mail.gmail.com>
X-ClientProxiedBy: TYCP286CA0166.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::17) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|DS4PPFE12D62847:EE_
X-MS-Office365-Filtering-Correlation-Id: d9e3f2d4-d34b-40d6-a3fc-08dd7e16e88f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|376014|1800799024|366016|13003099007|8096899003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ME93YlUwQWRuL2hPSXZHZ3E1SlRvSm9uRm1rVDUvSkdSTnVYcUsva0xJVTRq?=
 =?utf-8?B?MkNtRVZPRlZPQklOT3p4WEF2dVUxUFh2U1VDdVBlaTRkTTJXbFF3MVlxaUts?=
 =?utf-8?B?UUw2WVZmWXpXRFByRXdEZ0NJV2NLSDRWWGc2enpFMXFieU9pRi9GSld0RU1F?=
 =?utf-8?B?dHFySDBHNE8zenBMOEpwTDNLbTQ2eE5iOUhGd0hXMGZkNkRhMFJQUEJRSFpt?=
 =?utf-8?B?YktUb2FjSkRlejFuL2RwUTI5SG9qb0RUR1NsNjRyZGhFYk1veXAxT2tkWDU0?=
 =?utf-8?B?a0wxNlZyY0h1M2VSa09BNTZCbTUvOGRvU2xvb05sWHQxU202aVhwNmM2OVY4?=
 =?utf-8?B?YVIzM2NBRmRUWEdiYUdOaXVvOVpndC84aUgvOFI2K0RxWGxtQVUrQytrdUJi?=
 =?utf-8?B?Q1pibTAwdGhQNzZFSUlNVTIxdHdPSy8zLy9qeGpaNU5MK1BhUC9LZ3VuV2dH?=
 =?utf-8?B?QWtPZHY5ZzdZTTIycE40MTBDZiszbi9ZWGZNNmtvcjc3OFNObnBGV0h4R3ZG?=
 =?utf-8?B?YXhMc0k4dmRnRVNnUjZpd0Vqa1F1b242emlhVmZqMTJxeVNsT3Y2dGdQSERO?=
 =?utf-8?B?WHpHb2YxNml1Qm5MUHpXVThxUDNwYTFLemRhejF4WkRjeEQ0bkF6dXU4dmhy?=
 =?utf-8?B?Ykt0aXB3dSt6OHN1NDUxZUFkQ0M0NGRTVkNHeVlJUG9US2NsR05aa2lBZ25s?=
 =?utf-8?B?WU11Q0xXR09ZaDI1cHE4Mml1ai90MktnOEsxaGNYa0ZYeVo1Z2x5c29rdHlJ?=
 =?utf-8?B?aG5PODZka0F2elRHVm82dVMvNzl4alZSdVRYakpDWXhlTi9GS1hjWU1nRzZy?=
 =?utf-8?B?dWxOSTFPb1B6VVErOFJwS2J2ZHJDS1FiTlYxeWlFbWluRE5WSTgyL1FJTG5o?=
 =?utf-8?B?SHFFeExUMzJnN3owaXpxaE9LVXZYZ1Ywckw3MndYY2lBbHQyYVZoeDRSaGpm?=
 =?utf-8?B?UnI4ZU1RdmNUZm9PcE9pVlIvdXMwN05KbjNxYXZOSnhidWs0NEs4QjFCU2N2?=
 =?utf-8?B?NnRrL0M0VDRkZ2F4cXNXVSszVk9IdWJhOTNtdjJjMm9tQllxbktsR1BmNWdN?=
 =?utf-8?B?T2lpQWVNOTRKeFJUaENrUGpZTVNSeHpRYmVCdGxiUUg5WExvZ29NT0dPbWp5?=
 =?utf-8?B?Nkxla1lzNFRyUDY4SzlTa0pNUlNxOWt2TXFzRmp3cWRkTlJaaUlrU1puTm9x?=
 =?utf-8?B?TXIzaDVSTEZZeE9uc0ZZSnk4Zzd5MGhUd2laM3FPYmhmQml4VTFaSG40TGVj?=
 =?utf-8?B?NW1wRVV4OWNubEV6WlF2Q0pFTXBTU3pwcmdxVHBPNzBMRW1WU0RtUnFTRzZX?=
 =?utf-8?B?UGlCanQwZFlpaGtmNUVqMjVXOTNucGlNQWpHZWdmNmFmVERvYkZ3bVJjTVhk?=
 =?utf-8?B?N3o4SllYSjErWURTSzhWdjFIR1ZlZHF2UXBTMXhCNnVuVGxtVmZ2cHRwaU83?=
 =?utf-8?B?OUZRd0VqcTFIZGNONFJSb0lYYzBjY0ZBRXpURW1xZ0Vkd3FXRHdBdkJzaWNY?=
 =?utf-8?B?WW0yNCtZd2VkL3A1dnJlbkM3UWtpcVZkcVkvZ3BvNzZ5TEF4YkRHdVI5cjFD?=
 =?utf-8?B?alJvVmJNTDg4Y0dZR2htdWx5eHI3Z0o3aUdpeWhpbFdMbmR1cEJIZU8wNHFp?=
 =?utf-8?B?MGJQWWNJY2R6SWpFNUJLTExPbjlVekQzYUVlaXdVN1VQL2VJa204cURyeHRW?=
 =?utf-8?B?ZFBkbS9MU0JhclVSNXpYV2Q0TkRXVk9IenJLN1R6ZTFPa3NORkVaWU5Wa1Nj?=
 =?utf-8?B?bklUcTJ1cjh0SkZ0bEZ3MWk2OGN0VGc1Q0VsTkdUd0p0emNXcU5FbGdHbE9P?=
 =?utf-8?B?OGtjbHFoMnEzUEcwb2QwUGp4U3lHRkZtd05TYmdzUmkvalhQc3M0VWVnQVJT?=
 =?utf-8?Q?541e7hYq/uevy?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(1800799024)(366016)(13003099007)(8096899003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SjRuSXRiUk02MFFQT2ZadGhWZ0RDbVFub0U3OWw0R09ocGFNazVXL2Fybm5J?=
 =?utf-8?B?NHMreUNZYytJOWVKQ0pDRlp3QmVZcmJ5anNhWHNjM3pNL1hNdmtSRlhwb3dp?=
 =?utf-8?B?TmM0QklRUTV5OTlGVmRGUG01Q3RvV0dGM0RubXlua1VSTTJMZDk0Z1FMRWZF?=
 =?utf-8?B?dlE4bTFIMDFSaFI0L0ZRVWlqcGJFMnhhV1BDRlpqV1o0dENlTlE3T01yejA3?=
 =?utf-8?B?RXJRNVNpdVduUElQRm03NTQvd2ZTV3pZcldidXhCZjEyWDBoTFpnRXlUMkxu?=
 =?utf-8?B?Vkh4RFUybGxzQkRnUW04RGlHWGQ2VXZYN2NvakpqOUFjbHdNVEFjSm1waXY0?=
 =?utf-8?B?aVZiNmFYRlFrOFI1RUpvQkUrMlNKaitIMnQ3MnpjNWVodXRZWndzc3pOVFhi?=
 =?utf-8?B?akdaYlBCZ0RUbFBDeTJ1YmszWnFCcms1cG1CVmFiZFdTQW5MU3FMYnJOYVlj?=
 =?utf-8?B?aXNXU05oaHJ2WEF4eVJsNUE0TXVISEtzVHNPS2JGMkpjUmJLK0JMbG1aMndF?=
 =?utf-8?B?NjBBYURrMis1bjFoUHVmMEtGQWR2NE5nU3Z5NDVhb0lweWhIMXdiTW8vQ243?=
 =?utf-8?B?VXQ5U2xTdHBUcklrVHM0T1NiL2NqZWJyQlYwNmVUUE0walNJMGZFT0ptYTh0?=
 =?utf-8?B?VmQwQUhBWXdSZCtueFlEdDVDUEc0WGErUHZQSHhrb0llL08zeWd5V2dja3pZ?=
 =?utf-8?B?TGFYZEJnakxsRXByMUpjRjJhNXg1K0ZoYTh0RmZjODlNUWg0N08zSnkxaHZO?=
 =?utf-8?B?MGNBUWMrWFNxVmlUN29naGhZbkp2Q3NQMHU5UFFZdmZWSGFyVk4rVTd5dEN1?=
 =?utf-8?B?Y2ticHU2MEVlTVVMREtYMklmSzhvSUFockt4TitDSUFOaGQydU81OVJxNXJJ?=
 =?utf-8?B?amtCbm83d256QTFCTFIvQVkrKy9ObXJaZTQxdGdiL0N1WEZTSTE5SjRkQ1NN?=
 =?utf-8?B?N3R6anN5aGpnMjdwbFUzRndsWEQyZmwyQjZWNDJETmNTZEQ5RW1WckpFOCtl?=
 =?utf-8?B?bWszYndwYzVhdzNqcG5JdTBLSTdOekI0NDZtYkxFUE15TldGeHVJYUZPV0Zv?=
 =?utf-8?B?djNERy9PMEcyZnIyRjQ3TGZRSU1iMUdTZzRSeDhVVHJmTW9JQTQ3RTByc2Uv?=
 =?utf-8?B?enZxeWw0Nmc3cjVhZ0VRNHpJL3F6UGZLMUpkeEI1ZWs0S3JQMFk2MkhlcDBL?=
 =?utf-8?B?TVpyUitsYmVTdExkWTdUemZUK2NTc1FYUzBTRnFpbVFvUXNtU1V4VnErVmMx?=
 =?utf-8?B?YmkwNzFBNmpkMEI2RFhDSkRzSUJLMTArODJONHBNWm1WYnBJdUd2UlNENWds?=
 =?utf-8?B?Wm9kUmVuSnFqbDIrd3BsZkV3UVVTRWdVSmcwTDhNS09tU2RkS1NKeU1MTlV4?=
 =?utf-8?B?SlE4TFp5U3V0QnRUclZvNkhoM2h3d2dLN3lLL2hpLy9nRE9Ucm1WaHlKamdZ?=
 =?utf-8?B?dEpzK3czY0pwUmUyZEVZU25Vam1abkNrbC9EL1BOTXdXTjlyV3NJOU5RUUgy?=
 =?utf-8?B?bC90WTlrSWJTdTdacnk1dlY1dE94MWgyY1RjengrMjRXc0hLQ1Z1ZlVSdlJj?=
 =?utf-8?B?S0VCTTQ4SElJR1dUT0lKR3RKdnZlODFtaEpVbjRGOU5Dd1lOL09XK0grdVVX?=
 =?utf-8?B?ZytkMDFGVUg5NG50MHFvREw3K3ROclFoTHJoaTk2VG0yTVkzZ1piMmJTQnZq?=
 =?utf-8?B?azJCN0JyWEdlZ3JmR2d2dGR4Nmg3bmpOVDJYM3RtMlUvcjZsZnpIclhGWmdv?=
 =?utf-8?B?OW0rMFhXWnN4K3lJZHJzZjRMcWowWE9IRFFWS3Zra3Nwd1pmVTRPSUZENVhy?=
 =?utf-8?B?U3ZRWlAza1V6SUVoSVhWYWVxczduMk1TVkxSdktVU25zeE1ISzh3Yzc4eEpo?=
 =?utf-8?B?K1ozdUtsdDFYdHhybk1DS2d6R1EyYXlUSEJVUWJPdkd2ak50NXNVaXBkU09p?=
 =?utf-8?B?ZHBHakNzaEwwdld4c0lPbk5xQ0NlUXpYSUk4Q0IrZmR1K3pKNVVPbk9OYkJS?=
 =?utf-8?B?a3Z5MktBSWhaQWd2ck5WTVNrSFJVaHlMYUpGeUFDQ2ZXVWJ6ZGRQdGx6aEc5?=
 =?utf-8?B?S0pTclBHTFJXMm83TGhSZjJxOVNRZGN0T1BjbjQraEZYWnJVWm5XSmlVelpT?=
 =?utf-8?B?aFlvRTBRTU1JdnlXdkMyZEhuSlpCRmIzbWp1cEgvTzBaajhEYkFNTHNyRDhI?=
 =?utf-8?B?VWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9e3f2d4-d34b-40d6-a3fc-08dd7e16e88f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 01:18:21.6371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9eoRTnaVpqukVCpVudVs5crCDigvG5P/Aba3lmbkPwe7BxTa3jhSyp/Ydvh5ZTiL7DyorVQ/lpTU7MwiBkNz68P2BXUiPRBKRXudhXprPPE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFE12D62847
X-Proofpoint-ORIG-GUID: fpnBlR09j5toxy0B9Xbhu08sb_FW7ccC
X-Proofpoint-GUID: bfL-KqU0DYYpl8xpThtlp2ZZ7UGcKSE4
X-Authority-Analysis: v=2.4 cv=UZBRSLSN c=1 sm=1 tr=0 ts=6801a862 cx=c_pps a=mEL9+5ifO1KfKUNINL6WGg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=UXIAUNObAAAA:8 a=Q4-j1AaZAAAA:8 a=_enOPnqeAAAA:8 a=t7CeM3EgAAAA:8 a=_XTez3ddHY1cOqIz0k4A:9 a=_gJZ0CEiSTn2W1QB:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pGLkceISAAAA:8 a=Jl9Jrx8jqGfjHF8XrTgA:9 a=IoSftRmgZjyCGrPT:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=ImwWUX5h3JJ3gRE9moBe:22 a=a1s67YnXd6TbAZZNj1wK:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=XAbD3I9PDrnSMThV5XoS:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_07,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 impostorscore=0 phishscore=0 malwarescore=0
 spamscore=0 adultscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504180007
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Apr 2025 01:18:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215119

--------------oELl1QZI4cnvNHelcWwrpWdb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 53I0pF7u032690


On 4/17/25 23:43, Steve Sakoman wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Thu, Apr 17, 2025 at 8:39=E2=80=AFAM Steve Sakoman<steve@sakoman.com=
>  wrote:
>> The third patch in this series seems to be missing. Is this intentiona=
l?

1/2 is merged in master,=C2=A0 and 3 is pending(currently on master-next)=
,=C2=A0=20
so I only send 1/2 for scarthgap.

Sorry I forgot change the patch number.

> Also, can you add a cover letter explaining why this series is
> necessary.  Is this fixing a bug?

OK.=C2=A0 I will resend this series.

Regards

Changqing

>
> Thanks,
>
> Steve
>
>> On Wed, Apr 16, 2025 at 7:21=E2=80=AFPM Changqing Li via
>> lists.openembedded.org
>> <changqing.li=3Dwindriver.com@lists.openembedded.org>  wrote:
>>> From: Changqing Li<changqing.li@windriver.com>
>>>
>>> * make git,curl,python3-requests align with openssl, move the setting=
 of
>>>    envvars into respective envfile
>>> * for environment.d-openssl.sh, also check if ca-certificates.crt exi=
st
>>>    before export envvars
>>>
>>> Signed-off-by: Changqing Li<changqing.li@windriver.com>
>>> ---
>>>   .../openssl/files/environment.d-openssl.sh            |  7 +++++--
>>>   meta/recipes-core/meta/buildtools-tarball.bb          |  6 ------
>>>   meta/recipes-devtools/git/git/environment.d-git.sh    |  3 +++
>>>   meta/recipes-devtools/git/git_2.44.1.bb               |  8 ++++++++
>>>   .../environment.d-python3-requests.sh                 |  3 +++
>>>   .../python/python3-requests_2.32.3.bb                 | 11 ++++++++=
+++
>>>   meta/recipes-support/curl/curl/environment.d-curl.sh  |  3 +++
>>>   meta/recipes-support/curl/curl_8.7.1.bb               |  9 ++++++++=
+
>>>   8 files changed, 42 insertions(+), 8 deletions(-)
>>>   create mode 100644 meta/recipes-devtools/git/git/environment.d-git.=
sh
>>>   create mode 100644 meta/recipes-devtools/python/python3-requests/en=
vironment.d-python3-requests.sh
>>>   create mode 100644 meta/recipes-support/curl/curl/environment.d-cur=
l.sh
>>>
>>> diff --git a/meta/recipes-connectivity/openssl/files/environment.d-op=
enssl.sh b/meta/recipes-connectivity/openssl/files/environment.d-openssl.=
sh
>>> index 6f23490c87..6cb82d7386 100644
>>> --- a/meta/recipes-connectivity/openssl/files/environment.d-openssl.s=
h
>>> +++ b/meta/recipes-connectivity/openssl/files/environment.d-openssl.s=
h
>>> @@ -1,5 +1,8 @@
>>>   export OPENSSL_CONF=3D"$OECORE_NATIVE_SYSROOT/usr/lib/ssl/openssl.c=
nf"
>>> -export SSL_CERT_DIR=3D"$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs"
>>> -export SSL_CERT_FILE=3D"$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs/ca-=
certificates.crt"
>>> +if [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt"=
 ];then
>>> +    export SSL_CERT_DIR=3D"$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs"
>>> +    export SSL_CERT_FILE=3D"$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs=
/ca-certificates.crt"
>>> +    export BB_ENV_PASSTHROUGH_ADDITIONS=3D"${BB_ENV_PASSTHROUGH_ADDI=
TIONS:-} SSL_CERT_DIR SSL_CERT_FILE"
>>> +fi
>>>   export OPENSSL_MODULES=3D"$OECORE_NATIVE_SYSROOT/usr/lib/ossl-modul=
es/"
>>>   export OPENSSL_ENGINES=3D"$OECORE_NATIVE_SYSROOT/usr/lib/engines-3"
>>> diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/reci=
pes-core/meta/buildtools-tarball.bb
>>> index e2ce5b3ecf..414c266663 100644
>>> --- a/meta/recipes-core/meta/buildtools-tarball.bb
>>> +++ b/meta/recipes-core/meta/buildtools-tarball.bb
>>> @@ -73,12 +73,6 @@ create_sdk_files:append () {
>>>          touch $script
>>>          echo 'export PATH=3D"${SDKPATHNATIVE}${bindir_nativesdk}:${S=
DKPATHNATIVE}${sbindir_nativesdk}:${SDKPATHNATIVE}${base_bindir_nativesdk=
}:${SDKPATHNATIVE}${base_sbindir_nativesdk}:$PATH"' >> $script
>>>          echo 'export OECORE_NATIVE_SYSROOT=3D"${SDKPATHNATIVE}"' >> =
$script
>>> -       if [ -e "${SDK_OUTPUT}${SDKPATHNATIVE}${sysconfdir}/ssl/certs=
/ca-certificates.crt" ]; then
>>> -               echo 'export GIT_SSL_CAINFO=3D"${SDKPATHNATIVE}${sysc=
onfdir}/ssl/certs/ca-certificates.crt"' >>$script
>>> -               echo 'export SSL_CERT_FILE=3D"${SDKPATHNATIVE}${sysco=
nfdir}/ssl/certs/ca-certificates.crt"' >>$script
>>> -               echo 'export REQUESTS_CA_BUNDLE=3D"${SDKPATHNATIVE}${=
sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
>>> -               echo 'export CURL_CA_BUNDLE=3D"${SDKPATHNATIVE}${sysc=
onfdir}/ssl/certs/ca-certificates.crt"' >>$script
>>> -       fi
>>>          echo 'HOST_PKG_PATH=3D$(command -p pkg-config --variable=3Dp=
c_path pkg-config 2>/dev/null)' >>$script
>>>          echo 'export PKG_CONFIG_LIBDIR=3D${SDKPATHNATIVE}/${libdir}/=
pkgconfig:${SDKPATHNATIVE}/${datadir}/pkgconfig:${HOST_PKG_PATH:-/usr/lib=
/pkgconfig:/usr/share/pkgconfig}' >>$script
>>>          echo 'unset HOST_PKG_PATH'
>>> diff --git a/meta/recipes-devtools/git/git/environment.d-git.sh b/met=
a/recipes-devtools/git/git/environment.d-git.sh
>>> new file mode 100644
>>> index 0000000000..18104f0528
>>> --- /dev/null
>>> +++ b/meta/recipes-devtools/git/git/environment.d-git.sh
>>> @@ -0,0 +1,3 @@
>>> +if [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt"=
 ];then
>>> +    export GIT_SSL_CAINFO=3D"${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/=
ca-certificates.crt"
>>> +fi
>>> diff --git a/meta/recipes-devtools/git/git_2.44.1.bb b/meta/recipes-d=
evtools/git/git_2.44.1.bb
>>> index 53d67eb40a..7229b9ae0c 100644
>>> --- a/meta/recipes-devtools/git/git_2.44.1.bb
>>> +++ b/meta/recipes-devtools/git/git_2.44.1.bb
>>> @@ -13,6 +13,10 @@ SRC_URI =3D "${KERNELORG_MIRROR}/software/scm/git/=
git-${PV}.tar.gz;name=3Dtarball \
>>>              file://0001-config.mak.uname-do-not-force-RHEL-7-specifi=
c-build-.patch  \
>>>              "
>>>
>>> +SRC_URI:append:class-nativesdk =3D " \
>>> +file://environment.d-git.sh  \
>>> +           "
>>> +
>>>   S =3D "${WORKDIR}/git-${PV}"
>>>
>>>   LIC_FILES_CHKSUM =3D"\ @@ -115,6 +119,9 @@ do_install:append:class-=
nativesdk() {=20
>>> GIT_EXEC_PATH=3D'`dirname $''realpath`'/${REL_GIT_EXEC_PATH} \=20
>>> GIT_TEMPLATE_DIR=3D'`dirname $''realpath`'/${REL_GIT_TEMPLATE_DIR}=20
>>> perl_native_fixup + + mkdir -p=20
>>> ${D}${SDKPATHNATIVE}/environment-setup.d + install -m 644=20
>>> ${WORKDIR}/environment.d-git.sh=20
>>> ${D}${SDKPATHNATIVE}/environment-setup.d/git.sh } FILES:${PN} +=3D "$=
{datadir}/git-core ${libexecdir}/git-core/"
>>> @@ -155,6 +162,7 @@ FILES:${PN}-tk =3D " \
>>>
>>>   PACKAGES =3D+ "gitweb"
>>>   FILES:gitweb =3D "${datadir}/gitweb/"
>>> +FILES:${PN}:append:class-nativesdk =3D " ${SDKPATHNATIVE}/environmen=
t-setup.d/git.sh"
>>>   RDEPENDS:gitweb =3D "perl"
>>>
>>>   BBCLASSEXTEND =3D "native nativesdk"
>>> diff --git a/meta/recipes-devtools/python/python3-requests/environmen=
t.d-python3-requests.sh b/meta/recipes-devtools/python/python3-requests/e=
nvironment.d-python3-requests.sh
>>> new file mode 100644
>>> index 0000000000..f2eee203ca
>>> --- /dev/null
>>> +++ b/meta/recipes-devtools/python/python3-requests/environment.d-pyt=
hon3-requests.sh
>>> @@ -0,0 +1,3 @@
>>> +if [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt"=
 ];then
>>> +    export REQUESTS_CA_BUNDLE=3D"${OECORE_NATIVE_SYSROOT}/etc/ssl/ce=
rts/ca-certificates.crt"
>>> +fi
>>> diff --git a/meta/recipes-devtools/python/python3-requests_2.32.3.bb =
b/meta/recipes-devtools/python/python3-requests_2.32.3.bb
>>> index 4f0638b50c..36ff75f87d 100644
>>> --- a/meta/recipes-devtools/python/python3-requests_2.32.3.bb
>>> +++ b/meta/recipes-devtools/python/python3-requests_2.32.3.bb
>>> @@ -3,10 +3,19 @@ HOMEPAGE =3D"https://requests.readthedocs.io"
>>>   LICENSE =3D "Apache-2.0"
>>>   LIC_FILES_CHKSUM =3D"file://LICENSE;md5=3D34400b68072d710fecd0a2940=
a0d1658"
>>>
>>> +SRC_URI:append:class-nativesdk =3D " \
>>> +file://environment.d-python3-requests.sh  \
>>> +"
>>> +
>>>   SRC_URI[sha256sum] =3D "55365417734eb18255590a9ff9eb97e9e1da868d4cc=
d6402399eaf68af20a760"
>>>
>>>   inherit pypi python_setuptools_build_meta
>>>
>>> +do_install:append:class-nativesdk() {
>>> +       mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
>>> +       install -m 644 ${WORKDIR}/environment.d-python3-requests.sh $=
{D}${SDKPATHNATIVE}/environment-setup.d/python3-requests.sh
>>> +}
>>> +
>>>   RDEPENDS:${PN} +=3D " \
>>>       python3-certifi \
>>>       python3-email \
>>> @@ -19,6 +28,8 @@ RDEPENDS:${PN} +=3D " \
>>>       python3-compression \
>>>   "
>>>
>>> +FILES:${PN}:append:class-nativesdk =3D " ${SDKPATHNATIVE}/environmen=
t-setup.d/python3-requests.sh"
>>> +
>>>   CVE_PRODUCT =3D "requests"
>>>
>>>   BBCLASSEXTEND =3D "native nativesdk"
>>> diff --git a/meta/recipes-support/curl/curl/environment.d-curl.sh b/m=
eta/recipes-support/curl/curl/environment.d-curl.sh
>>> new file mode 100644
>>> index 0000000000..0d53aabb8e
>>> --- /dev/null
>>> +++ b/meta/recipes-support/curl/curl/environment.d-curl.sh
>>> @@ -0,0 +1,3 @@
>>> +if [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt"=
 ];then
>>> +    export CURL_CA_BUNDLE=3D"${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/=
ca-certificates.crt"
>>> +fi
>>> diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-s=
upport/curl/curl_8.7.1.bb
>>> index ddd591dd96..8f074f4ff7 100644
>>> --- a/meta/recipes-support/curl/curl_8.7.1.bb
>>> +++ b/meta/recipes-support/curl/curl_8.7.1.bb
>>> @@ -21,6 +21,11 @@ SRC_URI =3D " \
>>>       file://CVE-2024-8096.patch  \
>>>       file://CVE-2024-9681.patch  \
>>>   "
>>> +
>>> +SRC_URI:append:class-nativesdk =3D " \
>>> +file://environment.d-curl.sh  \
>>> +"
>>> +
>>>   SRC_URI[sha256sum] =3D "6fea2aac6a4610fbd0400afb0bcddbe7258a64c63f1=
f68e5855ebc0c659710cd"
>>>
>>>   # Curl has used many names over the years...
>>> @@ -104,6 +109,8 @@ do_install:append:class-target() {
>>>
>>>   do_install:append:class-nativesdk() {
>>>          fix_absolute_paths
>>> +       mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
>>> +       install -m 644 ${WORKDIR}/environment.d-curl.sh ${D}${SDKPATH=
NATIVE}/environment-setup.d/curl.sh
>>>   }
>>>
>>>   do_compile_ptest() {
>>> @@ -152,6 +159,8 @@ RRECOMMENDS:lib${BPN} +=3D "ca-certificates"
>>>
>>>   FILES:${PN} +=3D "${datadir}/zsh"
>>>
>>> +FILES:${PN}:append:class-nativesdk =3D " ${SDKPATHNATIVE}/environmen=
t-setup.d/curl.sh"
>>> +
>>>   inherit multilib_script
>>>   MULTILIB_SCRIPTS =3D "${PN}-dev:${bindir}/curl-config"
>>>
>>> --
>>> 2.44.1
>>>
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#215022):https://lists.openembedded.org/g/openembe=
dded-core/message/215022
>>> Mute This Topic:https://lists.openembedded.org/mt/112307271/3620601
>>> Group Owner:openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub =
 [steve@sakoman.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
--------------oELl1QZI4cnvNHelcWwrpWdb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 53I0pF7u032690

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#cceed0">
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 4/17/25 23:43, Steve Sakoman wrote:=
<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAOSpxdZvrcCgyRvGKpubRocvpiy1WA=
3_FPMw6zRtAxTxgNYgmw@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

On Thu, Apr 17, 2025 at 8:39=E2=80=AFAM Steve Sakoman <a class=3D"moz-txt=
-link-rfc2396E" href=3D"mailto:steve@sakoman.com">&lt;steve@sakoman.com&g=
t;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
The third patch in this series seems to be missing. Is this intentional?<=
/pre>
      </blockquote>
    </blockquote>
    <p>1/2 is merged in master,&nbsp; and 3 is pending(currently on
      master-next),&nbsp; so I only send 1/2 for scarthgap.<br>
    </p>
    <p>Sorry I forgot change the patch number.<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CAOSpxdZvrcCgyRvGKpubRocvpiy1WA=
3_FPMw6zRtAxTxgNYgmw@mail.gmail.com">
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
Also, can you add a cover letter explaining why this series is
necessary.  Is this fixing a bug?</pre>
    </blockquote>
    <p>OK.&nbsp; I will resend this <span style=3D"white-space: pre-wrap"=
>series.</span></p>
    <p><span style=3D"white-space: pre-wrap">Regards</span></p>
    <p><span style=3D"white-space: pre-wrap">Changqing
</span></p>
    <blockquote type=3D"cite" cite=3D"mid:CAOSpxdZvrcCgyRvGKpubRocvpiy1WA=
3_FPMw6zRtAxTxgNYgmw@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

Thanks,

Steve

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">On Wed, Apr 16, 2025 at 7:=
21=E2=80=AFPM Changqing Li via
lists.openembedded.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:changqing.li=3Dwindrive=
r.com@lists.openembedded.org">&lt;changqing.li=3Dwindriver.com@lists.open=
embedded.org&gt;</a> wrote:
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">
From: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:chan=
gqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

* make git,curl,python3-requests align with openssl, move the setting of
  envvars into respective envfile
* for environment.d-openssl.sh, also check if ca-certificates.crt exist
  before export envvars

Signed-off-by: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 .../openssl/files/environment.d-openssl.sh            |  7 +++++--
 meta/recipes-core/meta/buildtools-tarball.bb          |  6 ------
 meta/recipes-devtools/git/git/environment.d-git.sh    |  3 +++
 meta/recipes-devtools/git/git_2.44.1.bb               |  8 ++++++++
 .../environment.d-python3-requests.sh                 |  3 +++
 .../python/python3-requests_2.32.3.bb                 | 11 +++++++++++
 meta/recipes-support/curl/curl/environment.d-curl.sh  |  3 +++
 meta/recipes-support/curl/curl_8.7.1.bb               |  9 +++++++++
 8 files changed, 42 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-devtools/git/git/environment.d-git.sh
 create mode 100644 meta/recipes-devtools/python/python3-requests/environ=
ment.d-python3-requests.sh
 create mode 100644 meta/recipes-support/curl/curl/environment.d-curl.sh

diff --git a/meta/recipes-connectivity/openssl/files/environment.d-openss=
l.sh b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
index 6f23490c87..6cb82d7386 100644
--- a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
+++ b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
@@ -1,5 +1,8 @@
 export OPENSSL_CONF=3D&quot;$OECORE_NATIVE_SYSROOT/usr/lib/ssl/openssl.c=
nf&quot;
-export SSL_CERT_DIR=3D&quot;$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs&quo=
t;
-export SSL_CERT_FILE=3D&quot;$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs/ca=
-certificates.crt&quot;
+if [ -e &quot;${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt=
&quot; ];then
+    export SSL_CERT_DIR=3D&quot;$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs=
&quot;
+    export SSL_CERT_FILE=3D&quot;$OECORE_NATIVE_SYSROOT/usr/lib/ssl/cert=
s/ca-certificates.crt&quot;
+    export BB_ENV_PASSTHROUGH_ADDITIONS=3D&quot;${BB_ENV_PASSTHROUGH_ADD=
ITIONS:-} SSL_CERT_DIR SSL_CERT_FILE&quot;
+fi
 export OPENSSL_MODULES=3D&quot;$OECORE_NATIVE_SYSROOT/usr/lib/ossl-modul=
es/&quot;
 export OPENSSL_ENGINES=3D&quot;$OECORE_NATIVE_SYSROOT/usr/lib/engines-3&=
quot;
diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-=
core/meta/buildtools-tarball.bb
index e2ce5b3ecf..414c266663 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -73,12 +73,6 @@ create_sdk_files:append () {
        touch $script
        echo 'export PATH=3D&quot;${SDKPATHNATIVE}${bindir_nativesdk}:${S=
DKPATHNATIVE}${sbindir_nativesdk}:${SDKPATHNATIVE}${base_bindir_nativesdk=
}:${SDKPATHNATIVE}${base_sbindir_nativesdk}:$PATH&quot;' &gt;&gt; $script
        echo 'export OECORE_NATIVE_SYSROOT=3D&quot;${SDKPATHNATIVE}&quot;=
' &gt;&gt; $script
-       if [ -e &quot;${SDK_OUTPUT}${SDKPATHNATIVE}${sysconfdir}/ssl/cert=
s/ca-certificates.crt&quot; ]; then
-               echo 'export GIT_SSL_CAINFO=3D&quot;${SDKPATHNATIVE}${sys=
confdir}/ssl/certs/ca-certificates.crt&quot;' &gt;&gt;$script
-               echo 'export SSL_CERT_FILE=3D&quot;${SDKPATHNATIVE}${sysc=
onfdir}/ssl/certs/ca-certificates.crt&quot;' &gt;&gt;$script
-               echo 'export REQUESTS_CA_BUNDLE=3D&quot;${SDKPATHNATIVE}$=
{sysconfdir}/ssl/certs/ca-certificates.crt&quot;' &gt;&gt;$script
-               echo 'export CURL_CA_BUNDLE=3D&quot;${SDKPATHNATIVE}${sys=
confdir}/ssl/certs/ca-certificates.crt&quot;' &gt;&gt;$script
-       fi
        echo 'HOST_PKG_PATH=3D$(command -p pkg-config --variable=3Dpc_pat=
h pkg-config 2&gt;/dev/null)' &gt;&gt;$script
        echo 'export PKG_CONFIG_LIBDIR=3D${SDKPATHNATIVE}/${libdir}/pkgco=
nfig:${SDKPATHNATIVE}/${datadir}/pkgconfig:${HOST_PKG_PATH:-/usr/lib/pkgc=
onfig:/usr/share/pkgconfig}' &gt;&gt;$script
        echo 'unset HOST_PKG_PATH'
diff --git a/meta/recipes-devtools/git/git/environment.d-git.sh b/meta/re=
cipes-devtools/git/git/environment.d-git.sh
new file mode 100644
index 0000000000..18104f0528
--- /dev/null
+++ b/meta/recipes-devtools/git/git/environment.d-git.sh
@@ -0,0 +1,3 @@
+if [ -e &quot;${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt=
&quot; ];then
+    export GIT_SSL_CAINFO=3D&quot;${OECORE_NATIVE_SYSROOT}/etc/ssl/certs=
/ca-certificates.crt&quot;
+fi
diff --git a/meta/recipes-devtools/git/git_2.44.1.bb b/meta/recipes-devto=
ols/git/git_2.44.1.bb
index 53d67eb40a..7229b9ae0c 100644
--- a/meta/recipes-devtools/git/git_2.44.1.bb
+++ b/meta/recipes-devtools/git/git_2.44.1.bb
@@ -13,6 +13,10 @@ SRC_URI =3D &quot;${KERNELORG_MIRROR}/software/scm/git=
/git-${PV}.tar.gz;name=3Dtarball \
            <a class=3D"moz-txt-link-freetext" href=3D"file://0001-config=
.mak.uname-do-not-force-RHEL-7-specific-build-.patch">file://0001-config.=
mak.uname-do-not-force-RHEL-7-specific-build-.patch</a> \
            &quot;

+SRC_URI:append:class-nativesdk =3D &quot; \
+           <a class=3D"moz-txt-link-freetext" href=3D"file://environment=
.d-git.sh">file://environment.d-git.sh</a> \
+           &quot;
+
 S =3D &quot;${WORKDIR}/git-${PV}&quot;

 LIC_FILES_CHKSUM =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:\=
@@-115,6+119,9@@do_install:append:class-nativesdk(){GIT_EXEC_PATH=3D'`dir=
name$''realpath`'/${REL_GIT_EXEC_PATH}\GIT_TEMPLATE_DIR=3D'`dirname$''rea=
lpath`'/${REL_GIT_TEMPLATE_DIR}perl_native_fixup++mkdir-p${D}${SDKPATHNAT=
IVE}/environment-setup.d+install-m644${WORKDIR}/environment.d-git.sh${D}$=
{SDKPATHNATIVE}/environment-setup.d/git.sh}FILES:${PN}+=3D">&quot;\
@@ -115,6 +119,9 @@ do_install:append:class-nativesdk() {
                GIT_EXEC_PATH=3D'`dirname $''realpath`'/${REL_GIT_EXEC_PA=
TH} \
                GIT_TEMPLATE_DIR=3D'`dirname $''realpath`'/${REL_GIT_TEMP=
LATE_DIR}
        perl_native_fixup
+
+       mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
+       install -m 644 ${WORKDIR}/environment.d-git.sh ${D}${SDKPATHNATIV=
E}/environment-setup.d/git.sh
 }

 FILES:${PN} +=3D &quot;</a>${datadir}/git-core ${libexecdir}/git-core/&q=
uot;
@@ -155,6 +162,7 @@ FILES:${PN}-tk =3D &quot; \

 PACKAGES =3D+ &quot;gitweb&quot;
 FILES:gitweb =3D &quot;${datadir}/gitweb/&quot;
+FILES:${PN}:append:class-nativesdk =3D &quot; ${SDKPATHNATIVE}/environme=
nt-setup.d/git.sh&quot;
 RDEPENDS:gitweb =3D &quot;perl&quot;

 BBCLASSEXTEND =3D &quot;native nativesdk&quot;
diff --git a/meta/recipes-devtools/python/python3-requests/environment.d-=
python3-requests.sh b/meta/recipes-devtools/python/python3-requests/envir=
onment.d-python3-requests.sh
new file mode 100644
index 0000000000..f2eee203ca
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-requests/environment.d-python3=
-requests.sh
@@ -0,0 +1,3 @@
+if [ -e &quot;${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt=
&quot; ];then
+    export REQUESTS_CA_BUNDLE=3D&quot;${OECORE_NATIVE_SYSROOT}/etc/ssl/c=
erts/ca-certificates.crt&quot;
+fi
diff --git a/meta/recipes-devtools/python/python3-requests_2.32.3.bb b/me=
ta/recipes-devtools/python/python3-requests_2.32.3.bb
index 4f0638b50c..36ff75f87d 100644
--- a/meta/recipes-devtools/python/python3-requests_2.32.3.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.32.3.bb
@@ -3,10 +3,19 @@ HOMEPAGE =3D <a class=3D"moz-txt-link-rfc2396E" href=3D=
"https://requests.readthedocs.io">&quot;https://requests.readthedocs.io&q=
uot;</a>
 LICENSE =3D &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"file://L=
ICENSE;md5=3D34400b68072d710fecd0a2940a0d1658">&quot;file://LICENSE;md5=3D=
34400b68072d710fecd0a2940a0d1658&quot;</a>

+SRC_URI:append:class-nativesdk =3D &quot; \
+           <a class=3D"moz-txt-link-freetext" href=3D"file://environment=
.d-python3-requests.sh">file://environment.d-python3-requests.sh</a> \
+&quot;
+
 SRC_URI[sha256sum] =3D &quot;55365417734eb18255590a9ff9eb97e9e1da868d4cc=
d6402399eaf68af20a760&quot;

 inherit pypi python_setuptools_build_meta

+do_install:append:class-nativesdk() {
+       mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
+       install -m 644 ${WORKDIR}/environment.d-python3-requests.sh ${D}$=
{SDKPATHNATIVE}/environment-setup.d/python3-requests.sh
+}
+
 RDEPENDS:${PN} +=3D &quot; \
     python3-certifi \
     python3-email \
@@ -19,6 +28,8 @@ RDEPENDS:${PN} +=3D &quot; \
     python3-compression \
 &quot;

+FILES:${PN}:append:class-nativesdk =3D &quot; ${SDKPATHNATIVE}/environme=
nt-setup.d/python3-requests.sh&quot;
+
 CVE_PRODUCT =3D &quot;requests&quot;

 BBCLASSEXTEND =3D &quot;native nativesdk&quot;
diff --git a/meta/recipes-support/curl/curl/environment.d-curl.sh b/meta/=
recipes-support/curl/curl/environment.d-curl.sh
new file mode 100644
index 0000000000..0d53aabb8e
--- /dev/null
+++ b/meta/recipes-support/curl/curl/environment.d-curl.sh
@@ -0,0 +1,3 @@
+if [ -e &quot;${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt=
&quot; ];then
+    export CURL_CA_BUNDLE=3D&quot;${OECORE_NATIVE_SYSROOT}/etc/ssl/certs=
/ca-certificates.crt&quot;
+fi
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-suppo=
rt/curl/curl_8.7.1.bb
index ddd591dd96..8f074f4ff7 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -21,6 +21,11 @@ SRC_URI =3D &quot; \
     <a class=3D"moz-txt-link-freetext" href=3D"file://CVE-2024-8096.patc=
h">file://CVE-2024-8096.patch</a> \
     <a class=3D"moz-txt-link-freetext" href=3D"file://CVE-2024-9681.patc=
h">file://CVE-2024-9681.patch</a> \
 &quot;
+
+SRC_URI:append:class-nativesdk =3D &quot; \
+           <a class=3D"moz-txt-link-freetext" href=3D"file://environment=
.d-curl.sh">file://environment.d-curl.sh</a> \
+&quot;
+
 SRC_URI[sha256sum] =3D &quot;6fea2aac6a4610fbd0400afb0bcddbe7258a64c63f1=
f68e5855ebc0c659710cd&quot;

 # Curl has used many names over the years...
@@ -104,6 +109,8 @@ do_install:append:class-target() {

 do_install:append:class-nativesdk() {
        fix_absolute_paths
+       mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
+       install -m 644 ${WORKDIR}/environment.d-curl.sh ${D}${SDKPATHNATI=
VE}/environment-setup.d/curl.sh
 }

 do_compile_ptest() {
@@ -152,6 +159,8 @@ RRECOMMENDS:lib${BPN} +=3D &quot;ca-certificates&quot=
;

 FILES:${PN} +=3D &quot;${datadir}/zsh&quot;

+FILES:${PN}:append:class-nativesdk =3D &quot; ${SDKPATHNATIVE}/environme=
nt-setup.d/curl.sh&quot;
+
 inherit multilib_script
 MULTILIB_SCRIPTS =3D &quot;${PN}-dev:${bindir}/curl-config&quot;

--
2.44.1


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#215022): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/215022">https:/=
/lists.openembedded.org/g/openembedded-core/message/215022</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/112307271/3620601">https://lists.openembedded.org/mt=
/112307271/3620601</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:steve@sakoman.com">steve@sakoman.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------oELl1QZI4cnvNHelcWwrpWdb--

