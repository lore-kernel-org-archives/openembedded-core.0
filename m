Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77B0BD2E019
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 07:21:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.656.1764919264421446301
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Dec 2025 23:21:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=C3g20kql;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=44343d77d5=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B56mpnH2849968
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Dec 2025 23:21:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Q0e983nUpKP11H+xDNOxq6Xi1SejRe/XGj1HnydX0Y4=; b=
	C3g20kqlf8LJlWnstmFLsEoX8AOcsDnt9nNowxnPKpI03iwTYqq6EXy7YpM9oR2Q
	ss/47dO/QRNz7PrebjpHy513+bJRIUfgJAAeRCEt9Z+RDWHb9txuH+DsguOi1bMR
	Ifk506z2qQKSnPWFZwQbsYgC8b5TuaYk5MxBgXH2f6ZkvYv88IH+07D2Fz41csx/
	a0MwACTpLeFGwgzB6oiCiWI/EFnXNY1QfuCmOFN/B8aMR8pZGRCNDNWZwDyGsKek
	OEjZkfUl1NKR14LiEx+Rslu/npoGFpM1ZAeVJe196l59qfp68tYwAQ36aKLOFNRD
	B8fAjKTZzhOrjeXAyihhRw==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011045.outbound.protection.outlook.com [40.93.194.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4audserrc0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 23:21:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uvHHMFpnfmt6WTy0X+G+osId9fUj2D3tqEzysK6LX5WQ6jrvZF6uvmbWRErcDip4vcNouANoekBSkivpPt1eT98a7COC9PvRTO5zgldgi/IJkNSQ6SjAnCne5yJTT/F9fxIBo+34bNg+RwTGwEcNCExKYbNrd558tjE7nHiDVug7OqEjc71sErLyG8H7EEAjzOLdVnDA00NvAKC8RPMtuEjGX9Xc7jqJuhXGqJihMGSY6iIKofWIdgxS0kntbVJ0ZI0OIIXgU+pGxYVVtA4greYY+upZKfdpjoVQ67IRFHdTYcfi2nr0vmNjnNdOFSMR/qGU99xAT/WttU/UGN5U4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q0e983nUpKP11H+xDNOxq6Xi1SejRe/XGj1HnydX0Y4=;
 b=DSTehmeYlYoMCWD0GcGGCVg2x9vOuGYh+9dXmilOFloT1cYOmx5n7tvpMnjm6xaZMdNuDqxR3ID2uyQg8zdoJt5njj/LOhDD8Wk36Uf5eZTMvYxo5DXA+HGss9gNjyqUo09N8skq1y0w8lx2tOVbwuD4K1wlMUwQcieMwl6x4ix4j2GaDABIm3uRKeL6aiSSurtNE4uGZO8Dj6WF9XAu26rV95MLkfSoteaODPfWw+SzTistZsCNj+YfqZ6YT6AgtDa/qVLQQfGiQZoS8fpMpvEkl1KCcIEcOvqPWkLJbrjeyKcgQTIKh5/s0RKGnaBL+4OuZ5ogI69U6pewTNQ8og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH3PPFA07D87DA6.namprd11.prod.outlook.com (2603:10b6:518:1::d3e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 07:21:00 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9388.003; Fri, 5 Dec 2025
 07:21:00 +0000
Message-ID: <ee7547ad-cece-4d50-8bcf-5a11b8f953c1@windriver.com>
Date: Fri, 5 Dec 2025 15:20:54 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] kea: set correct sysconfdir and localstatedir
 for keactrl
To: Ross Burton <Ross.Burton@arm.com>,
        "yi.zhao@eng.windriver.com" <yi.zhao@eng.windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20251126165806.3422444-1-yi.zhao@windriver.com>
 <69AC3CF4-0AEF-470E-BA32-1BEC61390E06@arm.com>
Content-Language: en-US
From: Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: <69AC3CF4-0AEF-470E-BA32-1BEC61390E06@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCPR01CA0053.jpnprd01.prod.outlook.com
 (2603:1096:405:2::17) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH3PPFA07D87DA6:EE_
X-MS-Office365-Filtering-Correlation-Id: fc6ee1a0-a41e-4c37-a34f-08de33ced749
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VHgyOWNxRmdEVnFRaG1OQ2NSNURMYndHblBqNmJVamp1Ym1IdGdTMllKQ1da?=
 =?utf-8?B?R0JXWFR4ZXV5VVBrajdqbG1wTDdaZStkb0FOOTNUY1MrMURNM2h1SjJWVThn?=
 =?utf-8?B?eTF1dGpsamVwTk80QlcrK2x1K1FKUjFaM0JiV1QwTGZLQ2oxellUbHo5a2tE?=
 =?utf-8?B?UWJQa0pHOEttQ3dIclk0L29WdGxHUzZPZjFySFhWb2wxaHZaWlViV003eXZ3?=
 =?utf-8?B?T2hXL2hTUHpDaEV0a0xHM2VaelgrQ1V3ZFVjdHBXUjFGVnV4amdOYnQ2UjJn?=
 =?utf-8?B?TE1ZQ3dCcFYrSzUwdVRDNWo5bGxHS1hBUmZyeG1DVVFpa1I3L1lBK0JRN3hi?=
 =?utf-8?B?UEtrN0NPbDRQR2oyMGdEOHJta1hPalowb3NkbjZmUnRMTXJoQXhEVHpzS2Nr?=
 =?utf-8?B?RHltT09vamlabzM0N1Z2U2IxckRCVG5ZUkRQMGFOc1dGY2FtODJuU1RZbDE1?=
 =?utf-8?B?WVVDRGljcXFSczNKejVTZGhUSkUvTC9OenJOdHFzWnZyRW8vOHNqdjFxSW1u?=
 =?utf-8?B?QWNuSTdRcnFMbWxpaGdCRkExNWxsQ3VSbDhGMUMrOXhtN003OEgvb3B0am5k?=
 =?utf-8?B?b1cxdVNFKzl3a0ErMEN3RzRUd1VjWVUvQkJiQTJObTBvTHZGaHlzbFFJMDcy?=
 =?utf-8?B?RjU2LzJ4Ym9vRzM1Y05YbTB4U0swNStHSXUzaEFyZytCcVFiYUNBWTdmUHdY?=
 =?utf-8?B?SkRRKzVDeHRQNkdHWE5nR0R4MU5aV3dVOThtK3Jjd1ltdFV5MVlZRGFTejl3?=
 =?utf-8?B?dVdFVzZCMTZlSU4zc1N2V0dVak1aUFpTZ1l5TXNrZnZ1RHh3V2NDQ2FTZ1ZZ?=
 =?utf-8?B?Zkg4ZVg5NWFVN0JnR0pibzBYVHd4WmZybXN2TzBEaExHQlNCMEZwdWwraFND?=
 =?utf-8?B?eU5rZGpLUStVclVMcDFlK0xDMkRtR0NKNC9Fcll3SkVYV05Od0FFTm5GeSt1?=
 =?utf-8?B?bjI0c3lPdWtQdDNOVjF6d2x6d2F2Q2xMTFM2cFpnaXRPdVJXbHNSenAxQlFw?=
 =?utf-8?B?WmgzTlhUMjYrbzJkM2U3Q2d2anN1TTdjdE0zazJkMmlaMXRQOHVIQ0RkZkhL?=
 =?utf-8?B?R0diRE52NkFOUDE0RGJjQnJaajJJbUlQZWVKN1RlVWw4YUdPekRNdklZdHlh?=
 =?utf-8?B?aFl1dW85YlJRck1pVWVEazQwRitxQ0FVdnN4eTR4eDNMakxueVNxVmgxRlAw?=
 =?utf-8?B?VEcya3JrU0hyNG5Vd1ZuaXJTSGkraUo4cFVkV2g5NW9lUVZBU0xpM1hQMGZS?=
 =?utf-8?B?am13bktKV2VMYkl5TTBsbnYxQVd6WlV1RVJKWDFDa3F0dWRGeko2WlR3TEJt?=
 =?utf-8?B?dVB3bDJNSFZob2pzSyt5SmFIVDB2UkZyNG9McE5ONkgzSEE2ZzBlb0NJZnFp?=
 =?utf-8?B?K0dMRHhJQUcwRzVQSDNkY2dHWi9kYWJYRFpjeDJ1Y2d3bE5NeXVycmZ4Ymlm?=
 =?utf-8?B?RG1IVElYMStFZ2djSXNYSGNHOFY4MGhlRFI2eHhReXM5eFJ5bW0vaUFURTR4?=
 =?utf-8?B?RU9sSUI1ZEJsWURMMm5XR3Y1UldNdTZTVGN6cE92SVUvZ0VIYm83Y2wzMVhU?=
 =?utf-8?B?bjBSZFJsMFBsQThIVmlmOGk2c1BBOXIzR3VvQ29jMGt0NnZFRC9ZYjZLTU1I?=
 =?utf-8?B?NEs4dUhlbWozQXk4UDRURk9UcS9PWExiODU5bnk1WkhoTFp5bXJKWWt2a1pa?=
 =?utf-8?B?eXRxbjF4MUp2QTgwQ1UzQXdqLzM3Q3pSQ2tQeWxVaWNOVENoakd3WDlNQ1FH?=
 =?utf-8?B?SlZ5ZUpFOWlTZjlUcEpXVlVMejh0UE5IazJreHdXdlc2eHhORFJkSFl2c01G?=
 =?utf-8?B?Ui92RlgvRUEvemllemZ1TEdtVmFpV1BZcjJPMG5NYWw1QXllVG52NWcvVXZp?=
 =?utf-8?B?Q0o2WVFSZXdpRGY2b1FVRVk0Q3VkSm5zNCtpU0h0QWRuZzhtY3dUS1hGOFow?=
 =?utf-8?Q?5+IhVAby5DCQU8SmBHGGmqM+7v8ENJSp?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?K2VxTFFsQUx1Zm5BYzRpRHVKTlhvTHFDbFNXZlV6WVhWYXB5YTdBQW0rYWl5?=
 =?utf-8?B?TlhEd0piWUEzTkMraFhoSk5hdlZVWHJQaDVDQWxzK2dCTll2N2R6Uno5RlRY?=
 =?utf-8?B?UGFhdG1mNUkxMFVmcml0ZytxcmkrQWFPSU84OGo4aUpDMnNydkZERlg5ajd5?=
 =?utf-8?B?aUlER1MvcTBGbkFDVVVuMUI3VWFNQlRNaXBUck5aS1RMTm9CWWdqV09NeUcv?=
 =?utf-8?B?VEZuNEdKemhEaG5CL0s1Wk1oVU9HYTVBcks4MFFlUU14Q3lDZlg5MnR3Y2VF?=
 =?utf-8?B?d2dNSDFaTjFyUTIvOFBJZnJVL1RBN1F1V2NSODJkUWhacGMycjJqQ0h2cDU0?=
 =?utf-8?B?bEM2OW1zMzg3cDhvTitleXFxdDd0V2pvZkQwWG9XVlBabk5hN0s0M3VrVFdU?=
 =?utf-8?B?WDEyQjJaWTV3OVFlYmdwek1UZFJaMUhDZDNVTi80RytmbkJUVTRBZXNBYm9h?=
 =?utf-8?B?RzYrVS9NT2trbVpEVGYveXBWMHFJdEVFUXg1WXQyaHBBRTNPMDkvTEY1Rm53?=
 =?utf-8?B?OEM3VUpmY3VKSS9IVXBPVEFGdXJGTzlreXl1TWVhQkF0OUUwaUd4UzlJSWhK?=
 =?utf-8?B?REl4RnhYd0ZqYWxabDlQZmtMMlVubVpqWWt6eURNMERMSEpOYTZTOWs3TjVh?=
 =?utf-8?B?NGRrQ0VTR2UxWFNLSWVURW5ja2s4YWZ4bGRkR0VVWWFNbGl4M1lFckdKc0I1?=
 =?utf-8?B?WVNtTWkrR1FPZTJnenJNa2IxZEhYZHV6ZDJubGVxR2NMMEhrYnhDTDNDUm9K?=
 =?utf-8?B?RUJiQnVsOXpDS1hpNXc2Qk5UcnFFTitQVU1ySStRUUJxUFNYK3pPazhxaEM5?=
 =?utf-8?B?U1RnemVzNDdqdzZWTHdIM2JkTDFCTURBUHZrOVBVdFdXRU9EQzJsWldoaGhr?=
 =?utf-8?B?M1p1bkJUOW9NUkFRakRMWkhMbHRHTFZNaldFRGZKVXpSR0I3WVY4U250eHVM?=
 =?utf-8?B?NzQrd2F3dGhaUEVkZTFOeEt0S2xlaHlsaHNRN25nQTVaUUp6MndvV2I4Y2RR?=
 =?utf-8?B?Vk5OQ0tTdVY2NE44SlBURmV6ZnhzY0VKbE1tU3lmQi9RUndNbnJvME5Fdk9B?=
 =?utf-8?B?Z0xTNDhmbDkvV0FGNUZOSU5DS0kzaTVyYmRzK2FWQWJtc0NIRWJxSHVValhi?=
 =?utf-8?B?WVlUMVRlRlJ0eVBTUEYrZTI4YXpTSFJ1bHAybDB1bkdNc0tMbGtOQ1BGa1ly?=
 =?utf-8?B?YldPR1MxN2hOSkIvek56VFJ0b1RnVmFOb0gyczFLSjhMOFhrNkRza1JGTEpD?=
 =?utf-8?B?TFNNQUlqUlhWdU5JSXVIb1pWK0VGZXN1ZGVseXlna0pPRVZ3YXJtd2VNcDU1?=
 =?utf-8?B?MWtGa3U5R2pZa2VUSmx2MXBXNHdHSmRCNWVGcG11K1JrT3hUZFEwbCtwY1RE?=
 =?utf-8?B?OFdFUlJCbGJuUFM4bldNWjcrT0JYYjE5WUlvcmhTZnpyNFlTR3RoNkdlUWRt?=
 =?utf-8?B?MWV1Y0VjMlkyNDFadnk1ajJObXMwT0lmQ1JqcUJpVytnUExvb3RYVFlXL0xx?=
 =?utf-8?B?ckdIVjdoTlRBMXBBZ3FSQWdLRkQ5Z3oyYmQzeVpHMXROb3g2V2NuNzBMY2JS?=
 =?utf-8?B?NjJ1M28wYW5HT0JaWkkxUnZFTHIvOGtlMnBFZFkvejNvUU5WTy81SEhCQUlh?=
 =?utf-8?B?WnBVdWpYdUFOT1Q2Nk5pTm40UVRhMjZmaGthQk9mc1hwQTRsWEwyQzdmSW5L?=
 =?utf-8?B?VUdhbW5Ta1hBUTBIREFqRUdPMU1HamxCQVVuRXNPOW5QMzhRQ0FVOHBzRU0y?=
 =?utf-8?B?d1NkZm56aTRST3FLSitNZ3lmSDdwSm9oRFZCWStHR2dvcG8xSmRtckhjQTF0?=
 =?utf-8?B?Zy9xVWVLZWtETTd5T2JJZTBid21xNlp3czhjeHBjSnRjdzBRRGRha0Y4QjN0?=
 =?utf-8?B?aXpmMlpVNDJhWk1ESE56eC9YdHRzOTVGQTUyMzB2bnlxSXVzQ21FakNicEVN?=
 =?utf-8?B?YVpsOWpaYkVqN0k0NndDVUdhVkh5TDNuOXdEU1Z0RmtJbkx6TWw0WHE2NDhF?=
 =?utf-8?B?Z0ozWlBsV2pDU1V0bU4wc2ZqUTExaGI3WmsxRWdLTG51RUlZT3Y1emtJT0hv?=
 =?utf-8?B?MnhUOGVZOXFjd1ZWWnB3ZEtuZmlXSXRTMVhPQ0hIUytnN1dtTGpPSzVqUVhQ?=
 =?utf-8?Q?yhYfXu6c2csrcvLzM41GvPQQ2?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc6ee1a0-a41e-4c37-a34f-08de33ced749
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 07:21:00.4524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lRd+a/Efbr+EPYQsmTEhedWUYufVPeCNKiKqAwZ9vZaOxrJ06RvM6dtrvvuonh0wegaVE7egDTVm9/ygAvJzcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFA07D87DA6
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=W+Q1lBWk c=1 sm=1 tr=0 ts=693287df cx=c_pps
 a=z/rjtr9/JqYX5j7IdmSYkQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=0Pj6Uz6pQpZIEE2qgl4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA1MCBTYWx0ZWRfX3soI4IiYnCYa
 EJK/RdbcLrGaCWfFE14ZVRTjD+NF45Rvj0UOeSp8OGa5LROMJdvjcp5V+B3V/wefmEd0Wj8aa1S
 Z2FlrLXYkr7EBDyMhbgpoOF9UZNptmUFGvx0wbg694N6p3QLXKktugntS4NUjjcx7+wY/PK/H+M
 +e0bHZqSIOir5OCXvV3Ozq7pUAMIcYYjlFhyRSgYQR/jbkmbnFn8Mlf6izEMV6iqAB4bBx9rtOc
 ZoNJDFV41Xuk4jUPYbpdXGV8SljjBACGDU3TBSuWgKVxFYlM5gjc2Wi5AxCEcYVk8jPMbdCJ7+i
 NeOFwgGBfGhk9cBKVrRjasHIxX++nblj6JEc1PaGER6AFIddVsFVDCsCqngW0w4hgFbnCT3UV/G
 CZ3QWBTdIBkVQD0wEHMPAS3YUdKJ6w==
X-Proofpoint-GUID: hJBIq5Uf4x21EnkcnLSoHNRnuKMRCkHk
X-Proofpoint-ORIG-GUID: RSuqMHxROpMag4PZNrYQV0YDOEq1oiOS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050050
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5B56mpnH2849968
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Dec 2025 07:21:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227335


On 12/5/25 01:53, Ross Burton wrote:
> On 26 Nov 2025, at 16:58, Yi Zhao via lists.openembedded.org <yi.zhao=3D=
eng.windriver.com@lists.openembedded.org> wrote:
>> In keactrl script, both sysconfdir and localstatedir are prefixed with
>> ${prefix}, causing an error when keactrl runs:
>>
>> $ keactrl start -s dhcp4
>> ERROR/keactrl: keactrl configuration file doesn't exist in /usr//etc/k=
ea/keactrl.conf.
>>
>> Remove ${prefix} to ensure keactrl can find the correct directory.
> This isn=E2=80=99t the right thing to do.
>
> Well, the scripts _are_ broken because they do prefix+sysconfdir, which=
 is just wrong. Upstream should fix that.
>
> However, keactrl appears to be a tool for developers of kea who want to=
 start/stop the daemon, and our init scripts should just call the kea dae=
mons directly instead of going via an init script.
>
> Can you send a patch to port the init scripts to invoke the daemons dir=
ectly, and remove keactrl from the packaging?

OK. I will send a new patch to fix it.


//Yi

>
> Thanks,
> Ross

