Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B66DE8B38D
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 02:31:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10515.1770172289055656377
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 18:31:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=K2nzk2hq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6495392723=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6141XuoS3184647
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Feb 2026 18:31:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Vig4p5BS+Qfiw/U0GNFb/ld08t4RbYJ1wjd6rskl4/Y=; b=
	K2nzk2hqDKgn96A9ru00oehF3gIpwtRVixffDTrxPcHcvcylNjJ1yCu90zfUsD2o
	SY99QnRdSSOpD4T46Ryd9JfJ+JWV2axXx6Pd1kazg2T1p392Ri5gQFx71JFfHRjK
	+/n3d0b1jHKnt8e4qSmtR8Z0Odpgx9pTGsy+lG2C8SckuFdsA5uabvMBxVerGCYf
	OMWgxbS/0iTKSWbKWazdFJYyayk49TNpOdiV3vaEeDhxNRXx5tP5JIcmGebmRneO
	+cxCBQV3qwl8z1FdaH0mUCOGL+XOgraWnaT16qasDJ/EeNY+DBJPnBrrimOEo6aH
	lAezEpyGhApLUPoTTd4OrQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012062.outbound.protection.outlook.com [40.107.209.62])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c3vj381cm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 03 Feb 2026 18:31:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QhwqMGGxqHDrhJF7JSASplm9iE8Lnr6gKRLagoEUWBydqUPQxxcDXiumH03/cxRQoC/A5BvroxGBXDak1/mJw/E8ztNQUxo8ZdoWJ7y8Z9MfYn3+kjRxVrurDb4nItgxCIy+PNOpsaF/6Oo6WKWE3qnUSoPlsg5nQQEqOFK27Z+9xq6Jjlf9VSxs1N9OTRcQW0wVsBY8DiI8Q3mS0k8dVT1eD3ZMcIZZJQIT3TFIrbpzN4qZVlTB+5S3aEuzONI/9fgYqX0ifJ0drET9g/Y8/kPE32wvTZMs01EMd0BmTDKnYQW6GzLaDJidhOqROOTr82Y5L0A+ghhe1kds8QfqSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vig4p5BS+Qfiw/U0GNFb/ld08t4RbYJ1wjd6rskl4/Y=;
 b=oacjso1D1MLf82uMzOlcXumFmPC06GrOWB4zX86477Suh4SAWk9lm9Ho4gVHoQlfvS8vA0IjQgWarhv1lzTb/zkpQ6/2nGidGRbF+mJ04ugH0DS3WeQcAVdTEguhDVGowJGvgofunYji+deLCOwy17dFdcp9OSCLMQZcs823FXZUyqf+zs6OQ2X12umROX21uzpoAMq/wwl7pdqXn0+PoEEr7MGL1Z3hXqi6OdhMrRBi+YMl8cFG7EqZZSiqecQbxhV7LrqW/VWINnY35ndUqSvDoAHMWLae//3O46L/pbD6TyeCrsfeBUEPaCYods4imzp/FdKTuRpbihD2w34jJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CYYPR11MB8432.namprd11.prod.outlook.com (2603:10b6:930:be::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 02:31:26 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9564.016; Wed, 4 Feb 2026
 02:31:26 +0000
Message-ID: <425e69ef-7bd6-458c-8c1c-45e6c5c1deb6@windriver.com>
Date: Wed, 4 Feb 2026 10:31:20 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH V2] runqemu: restore support to run without
 bitbake
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20260130030601.388697-1-Qi.Chen@windriver.com>
 <CANNYZj8YOfUnv23oOyX6o=BuyX=LRQqoQaeS4osuRRoW4yiS8w@mail.gmail.com>
 <CO6PR11MB5602CABDD265D0F875CDCB14ED9BA@CO6PR11MB5602.namprd11.prod.outlook.com>
 <CANNYZj_obj+rntV-c1XEs=09-y=kVdqBxoD5M82euQ=5iT3MkA@mail.gmail.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <CANNYZj_obj+rntV-c1XEs=09-y=kVdqBxoD5M82euQ=5iT3MkA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR04CA0018.apcprd04.prod.outlook.com
 (2603:1096:4:197::9) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CYYPR11MB8432:EE_
X-MS-Office365-Filtering-Correlation-Id: b7b82f55-d2de-40f6-69ac-08de63957e9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SndVSlNzUFE0NlpqUWpqVmpTcjY4WXBEQ1FYWnFVMnlPRUlXVlFWb1JJVVh4?=
 =?utf-8?B?Zk1nRGtid2xtOStEVW9qUU13Ti9MWnVlRnFZRGtaZlA0b3NBVFBPaVJrYVFl?=
 =?utf-8?B?a1FYQWN1UlFPTW0vdWVJazBCN2wwYmRsK0M5Sm92RENQME1VMVN6b2pCNGxH?=
 =?utf-8?B?WGtubnVmZjhPUU5NMGpPL2xLcHdDOWJVenV2Qi9FVitUN1pxWWhXTWRHSjZ5?=
 =?utf-8?B?OVYvZG1UbGd0d21abmlxQ1pvNzdSc1FUQVRla2I3Q3BtMVRlN28wTFlvTExz?=
 =?utf-8?B?SkszdmI3MXNTRHNYTTlnN2dwR2pyNnBsUHM3L20xZVJNN2JZNEZPNjY5UHBh?=
 =?utf-8?B?REtuZ0lpbldPUnpXRE9KNzRERWUxY0xiSkdIRmVPcDRRU2dMQ25tMEFSd3RZ?=
 =?utf-8?B?YWhnUWxkbGsrWTAyS2VIRy9yRStPWlQxMXAzaStQYmpVN1kxQkRVTHJxOEJp?=
 =?utf-8?B?S3pSU0hVR1pqOEdsRHdFL2ZDM05CTFZMNWtyWWE1cEpldTlqTlZRdEJLMmJy?=
 =?utf-8?B?OUFlZytxOER1cVZvM2ZsbGhwRnQ0elVMakNuRTNTeDJYV3gxcTFzVTQwRTF2?=
 =?utf-8?B?WC9CMzVLTDRZRldsQndTUmtsc21OaUlDVy9pY01Db0hPdVpqQWxSY1ZndFpG?=
 =?utf-8?B?ajVKdlM4V3ZXZ3FWblpTWjZ0ZXVXclVpWGI5NU5KdjVlU3VtYmNvcUxwTThL?=
 =?utf-8?B?ODBScmVyc1ltQkgxQ3MvdnBBSksxdTJOVG90azF3d21BdkhlT2VmMVIrWStI?=
 =?utf-8?B?SXRPR1BwS1dIWG8rNSthV2pDNzFOOENFYzJLRmcwWHdqd09YQllHaVNkdFBW?=
 =?utf-8?B?YmVTV05adWphdlpFMzNYazhydDJqYytVS0VPSXg4cXVSZnBzZjk5MHoyS2Fv?=
 =?utf-8?B?aU1Ob1RORDhlYitZd0QvN2VaM0hzeFY5THNUSDFqTlJodThpdjVEVEZnemZu?=
 =?utf-8?B?QXlpR1hpdnJHRGJORWdkVzVBVXZFOEswQkFRMmh3bXNSRmhXQzBJdzBRRExn?=
 =?utf-8?B?OUQxWWVvc2tjYW50eThCdFFlL2dPYjdqRXRybjZJcG9NdlNMRTJ5eVhSNWRO?=
 =?utf-8?B?eklvcnF0WTUxSzhsN1Y1NkFFdjlQQ3ZXOHRJVWQwSWhEKzJhdXMzVFdKTW1p?=
 =?utf-8?B?OEkzcFBpYUZrQndId25UaUJNL2ptUVplU3dhbnhEZThYRlJlaTlMUE5JWVdS?=
 =?utf-8?B?OGpWRkZWY21zM0V3bG5qbGhVRjRsVzcwa3BiOWs1S3NOZW0vb055KzcyNG81?=
 =?utf-8?B?bDRKaExKNDdIZW42bjB2dDNWOW40VG9DR01ZbXMwQ01lekhTWXNWMW5LcHZI?=
 =?utf-8?B?ZkUvaU1kWTg0YjkyR2llYTJBREhGUWJoT3NQVW1GUzhRRmE3VmxzOE04MTNp?=
 =?utf-8?B?N3hWak5VQjh1K0ZhbVl5cjV3NTdyTGNiQllTSnFscml6RFBsdkpuMkdySVox?=
 =?utf-8?B?TmdDTm04M29NTU5kTTJ5cTBWV2psbkk3WGRDbGZHUjZTSUVXTU1rQU1GcE41?=
 =?utf-8?B?Y0RSc2M3Mk1yelFNS0xNN0JFK3phWmhPNlJrODRIbTRTN1h4UCtOdWhXM2xk?=
 =?utf-8?B?UkpjVkkwS05HWFk0aFVFSWRKZG80aVpFNmhQejVSSDVuVDhVKzkyWDU3ZU9R?=
 =?utf-8?B?cTkzUFB4VFBPSXFickZVU0dEcDR5MEcwNkg1T29ORDl6VkFTc3NiU0I4OTB4?=
 =?utf-8?B?MEFBSDk0MCtkNStBSUFDOTBvaUNjeURhNjZ2NVNXWFpwY3lXU3FtUkloYUU0?=
 =?utf-8?B?T2ZUSVhvT1plenZhZmZoOHh6K2pXVURyeE40U1pNQ1BvUXYvV3lvZC83TWk5?=
 =?utf-8?B?S2xuOEQwYzNpRllnRm1pODlRWkhqdnFYYWlobVRXdFRqNGlUS3Q1bnJvaGlR?=
 =?utf-8?B?VGdlSHJ4RkdMS2s0dy9mM2VDVHpyMjV4cC9iQS9QcEtlaGJ2aDF2TzYxVCt6?=
 =?utf-8?B?eFhRL3FHMzNjL0Z6QnZHcThlKythbmh5aGVUUDZCSDhjRHFHcDAvNXhrNXF6?=
 =?utf-8?B?YmRnS0QwWGxVR3RtU3hFQXF0dnY2aFcxOVZia1dwWWZabmZySCtDWkNaVTZS?=
 =?utf-8?B?UTNyTkl3bUsyR3RYZnVmR0RUTGxzTFZwVkJxQzdMd2xnVHZuUC9JN2N6UjJh?=
 =?utf-8?Q?3buQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SlJXbU5OMjVmdHYxTzYwUG5hK0I4UlgrZXVxRkdDVkJmV0tscm9JbU5MRTJW?=
 =?utf-8?B?bVpjeVFha2toMWptMWRZWGFvZ0VaSG5JUFZ2OUpDb0lRWFNsN0ZIc2VWYWNR?=
 =?utf-8?B?QkRUUUtYd2pLODFhczFIbUN2UkJLRlBVci9odDd1Q1hhdnBNZXBqS2t3b3FK?=
 =?utf-8?B?cnkxUDRXQ2d3aWFPeFc4QjBpYlFudXl0amduY0kxS1QrQmlLRGJCd1ZSUnFC?=
 =?utf-8?B?Y3FOYThUSy9jeGdyeUJHTVN4ZExOL2FacHJxb1ZzSUJSdlJ3OWM4MmhDblpr?=
 =?utf-8?B?TnU4RWlLdlBxNDBXNmJGRWdja0RZam5tR0pqSjdxVUNka3U5V056VVlUeDR2?=
 =?utf-8?B?Uit2cWVtakZMdVp5b2tLWGxkVUFReUg5cVU5T3FINHJpYmN4LzBvM0xKQkJS?=
 =?utf-8?B?UmszNFRmeWhMRmZ3WVQrZFV5cEZ6TW1BaW1IdmhKZkhLY3FhZjc4clMzNWs2?=
 =?utf-8?B?RFcwdExZTkV4UlFjaGNzbUdleXIxcXVkMGFDdkQxSEZTTW5KV3M2ZDFTYUZ1?=
 =?utf-8?B?cTVicHBSZ1IvSkhYemwzOHljMzU3UUdlbHdVdlQ1b0ZmNzU5Zk5kSmFLY0E3?=
 =?utf-8?B?bXZwWWFRdGY1YzhyT2syVGNmQzIvYTNpcFFUdGpHUitwUm85NlpiSU43Vzhi?=
 =?utf-8?B?Q295TlhOQVBtRnlaL0hsRlJaZjltczR6MEQyODFvZUpCZXJpU04zd0sxbXZn?=
 =?utf-8?B?SVk2NGNwdlJ6aE13aUozSkdON21XZnBKMElsUll0bmRSRmd2Y0J6Y1dEVEtx?=
 =?utf-8?B?SnB4dU9sbzNRZXRsYk83azhDUXdISEdXMXdLSnA2OXVSOWxMRUJCWSsvYmUr?=
 =?utf-8?B?RzMzd0pOUEFCajh6ZmVHUFhLT1hSQ05ZakpNTHB4aTFjVTZQZE93L3prYUpE?=
 =?utf-8?B?TGgvK2xOeXBoeWFaOW8wdU0zTm80UFZOQUhxYTVoMWdIcHNydVB2T2ttQUR6?=
 =?utf-8?B?eFJPcDFDZVNNNVJON0lnRlZBZC9waG1uT0lTREUxOFNLOVhkQXlFTzZCN1VJ?=
 =?utf-8?B?Q3hlM0dUVnBQeENhdHRIRFdpd1d0MHBla2FDd0lMNmJRQzRtUUVsbmFWcFA2?=
 =?utf-8?B?TjFrUU9wZFA4TnR5dXBqSW1laGhQdFlXWGI2Ti9jVXBzQ3JtbEFERUxZS3Bz?=
 =?utf-8?B?WUFzMGs1ZmdpNnlWdXFDb3M3dFhibDlud1F0eHc2cHdyc3RXOFdsL3lwU2pY?=
 =?utf-8?B?RVBDRktrVFF4MmUzTmRYN3VOU1pCUGZGRUJYUWR0a0dWMmJ6d1c5dFRYOFhx?=
 =?utf-8?B?Rm1GRG9wZWhkSWpKTTVqYXBGYzJFTGFhY2FsT0h6Vk1rQXMwRjZrS1E5ZTVL?=
 =?utf-8?B?QzdRMTBwQVMyclpwckRFaUkzKy8xY0YvMnAxWldmK0JqUVlMM3VJenc1ZVFM?=
 =?utf-8?B?RVNsbXRuYmhFbnY4Q2xWTG1lNkVMQzZsenlTS1NjYStaNFV3dHhORGJIcFU3?=
 =?utf-8?B?c1hZV0hiVTFnUUdpUXhMZVRkbEI1bU5taU5JSlFBR1R1NWVCZkZ1dWowdFl2?=
 =?utf-8?B?MlBoSlpjQ0x0aXJyd2d5YmNuUzNsWklYT2ZnVXZ1RWtRUHc4OG1FNlJmQnpK?=
 =?utf-8?B?enhxeGg3NDdIN2dhanFIQ01JcElQWFlWSHJPRzZKaVdsWTE2WnNGOWZkNHk1?=
 =?utf-8?B?YUxpamFERWVvYTB1ZndzQW1jTUxYZGM4ZjNFbjVtR1E3Zi90UVFqU0l5Y1Vm?=
 =?utf-8?B?L0JxVDVmZEIxWGowZlExMDkzZ1BIZG1zNzlpQXBZYkpvTmt5SjZ6QlVkMGRh?=
 =?utf-8?B?UmViU1VDU0xDZWNISC9KYkd5L2hubk95MENaajlyclZvVDlpbGQ4V2FXcXMy?=
 =?utf-8?B?VWUzM3RFN29kZEZ4ejI3dFYySGQ2M3U0NmQxckdEd3oza0xkcHRKZlRWcGtU?=
 =?utf-8?B?QWkwTXVmakVzeCtmcmFvK2plRGlFK1RzbWc3TE9tSGJicDRuZVNmanVoM2g4?=
 =?utf-8?B?WUhGWEdBVkhNeXI4WG5ESTF2VmZLSVNXTStUb09IYTZyREdTZTBTSE5yNC82?=
 =?utf-8?B?eGgzNW5LR3dyblhnYnBtRFlvSVBrSksybVppNmVIUElsUG5obXdzQXFIb29n?=
 =?utf-8?B?TnFISFp0Uko4OWkzQUk4MURDcGJVSzhpZmJPQjVCSkZLU0FZNlJQN284YTZ2?=
 =?utf-8?B?OVdqa2lIVXhqajg1emRFTWxtWmJZZDdZbmZLVVFaRVk5TWZUREN4QTljelgw?=
 =?utf-8?B?aWI3VlhzWlRjK2MxaTZHWnZLOWZJY0F5c0E5dG9uYzVTbmhsUGVta2RYSXlj?=
 =?utf-8?B?bC9yYmF0a05QUm1aMUZxUk9BN3MxVHVEMUhVRHZzdmF1SFhJNS9ReXMxYlNw?=
 =?utf-8?B?dVJ0dUxRQ2pIbnMrU1V4ckZ0NjYvVC8xK1ZmVzF6MllPL0dRYmVlQT09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7b82f55-d2de-40f6-69ac-08de63957e9c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 02:31:25.9887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TEM+Pp5jzAPZqilon4ZkVbhkVyL1PiTVaMQVW2YqipO4WA0JYZRljPCBmV/VmTSM50xVWCP3uUUK/o7j55ILrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8432
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAxNSBTYWx0ZWRfX9S30fkq6wtMU
 e7zG15kMf1lHBwBZJOXlXHWqDNvPsQ5XCactr79wi+KGedK3TfbwY5m/GMypWO0Ywh0QcNfVQsS
 vcD35PDbV0PSc/zp9nxp6HGizjkH6DwyW6c7eEHMV8VIJ7ZDs6eczV3ab5r2NvM4bjf3OiQh4RG
 QddNGDJ6CmwZRj4eKFyrHf9ZQoQgYEpT6YwrPLASPphP4IcJ38qc5T40+jc6ePgffrdp33FII6m
 bb/DU2RDMo5c42nU4n7zVN4ti9wg0Gl3XglU2U9OwHEGonpSD/qRF/iIcjJJVV3PRSz3bh3OJHw
 1YZ3j/fYMesVvMy70EHbKQrKi4LRMbtz2SOsQFCMR2sjmPp5UOtRlAieKVbF9mBgslKC79QDI1U
 3Zm45vf9tZotkquvryYK+99P8/M5yfAEGwgKnR6Bu8/R6d9v9LnkuECiLxwrK4s7qKcf1ng1l8l
 Knj26mXMjAPRPVWvbcQ==
X-Proofpoint-GUID: b0roIkthdnZ-GqFbR4wqaQx5zJsPE10R
X-Authority-Analysis: v=2.4 cv=R9UO2NRX c=1 sm=1 tr=0 ts=6982af80 cx=c_pps
 a=6wJ5VEhJUsGCSgd7q/o3PA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8 a=b1BxVuMagznvNuxFX14A:9
 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: pmKaE4XcUf09Kuf_DJnlXV0KDG_1CCBj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040015
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 02:31:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230493

On 2/3/26 18:10, Alexander Kanavin wrote:
> On Tue, 3 Feb 2026 at 03:21, Chen, Qi <Qi.Chen@windriver.com> wrote:
>> The steps for the test case should be simple and easy to reproduce.
>> Do you have any suggestion how to fix this issue?
>> Note that SDK does not have bitbake and OE metadata there.
>>
>> Or do you want me to first send out a patch to add an OEQA selftest case? Will that be accepted?
> I would suggest that you develop that patch first, and send it as a
> RFC (because it is expected to fail). I'd then be able to use the
> patch to reproduce the failure locally, and come up with suggestions
> (or maybe even patches) to address it. That would ensure the use case
> is officially supported, and will guard it against future regressions.
>
> Runqemu code is too complex and over-engineered, and to be honest,
> needs to be somehow simplified and rewritten, so when we see
> opportunities to simplify logic in it, we take it. Your use case fell
> victim of that because there were no tests or other indication that
> the code is necessary, but it wasn't intentional, and restoring
> support for the use case should be fine, but this time it should come
> with tests.
>
> Alex

Got it. I'll add the test case and send out the patch as RFC.

Regards,
Qi



