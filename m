Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C6F7CCA476
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 11:10:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.15903.1759835441504234938
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Oct 2025 04:10:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=moUydyxl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2375bebcce=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 597AEMeg3405382
	for <openembedded-core@lists.openembedded.org>; Tue, 7 Oct 2025 11:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=ijFhpxe79Zpfv/RLnVsAfvl6ATplg4HdEeDIxVYuxzE=; b=
	moUydyxlZ8RZDdSVr3mtXa74LZJvLBs+AuPPAYYjxD+/AUuAP4po+Sko32YU9ssr
	cwwnsKSeKw6ctw7I96IpKHcfwMrb3NPnG+dz10FnUW08e0f0oGjtHtCvPs74EaeW
	GR6FwRtVHhuVqypN6TpGp9/mEpjMkReO+hbz8CX77nHD7qamVRfoxQSlou5dajrl
	gEpUEORX4FFYx8uvXXWRywMl0JLICnl/JYoAokMGgK8M0hXQWbx5f/dyYCIP4uMn
	X/ZydftIP36L819yCA9y1QvwwHWrDbAK+7ohaInIWwZHvqCKvSzx1tHRv/k/I6p8
	j9+2mp4AjS+pTEY2DIHH8g==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011063.outbound.protection.outlook.com [52.101.62.63])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49jrxgtucc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 07 Oct 2025 11:10:39 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WG+jAm8ZDMwmi/rkaoO5vMHpDcpAehdhrAMBybddjDodQZIjt4Gu+AwDvYVj3MFhkJTmUemp+CxbuG7INCctGW1DOYsmhBv5MaqFhQUfT+rHN0kNGmZPZFNGQ5vMMovz+e9MDt7n5xfDSc1mKopkQJ49JMJmYkeR6yfEvfLFP5rqBvc8wUlrbAHtB+UTVBrT9qovXOqza0P70mLau6hU0I7MoYZv6YMylmbspe3quZRVu6uozziYd+DggUPBzdxuTu+gWMcuAhrinVfkpRlBlqnsWCHgrAUND7pSRO3ZbVKycoTkpB+84JB7D+0xnJc5je3qPOUotRLuPpw4apS88A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ijFhpxe79Zpfv/RLnVsAfvl6ATplg4HdEeDIxVYuxzE=;
 b=S54WytKc5qGks3Z9jHrC8uTtx0fwBrF5Phza7yXoplaOGcyQeVRY2QTx620oWA+co+Cc+jPoPJtsZKmyK6KDnuVOLN63gHe7oJqpvk/lQgel7PeScM70mUC1zm5hpN6PtPbRUtfyGyVidfuOW7P1XneUv7VaAhZQLbnk8f/bdoo61cBVOE11b7UgXh2I/RLBThAFFUmuQjozfIrlYHxFX3out6U/5xmn/Hw0M1LpAWjxWCE5z/eNAHKwmTeX41uSEB9ggLotWYbRn4srYkwMCHJvBLeMFidnB4bAOzLjtxBY2JiEP4C/lyAfwkXyoWMTyd7CiKSGPy9XhpS7Jb8gbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by MN6PR11MB8171.namprd11.prod.outlook.com (2603:10b6:208:471::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 11:10:32 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 11:10:32 +0000
Message-ID: <55dd2edb-6faf-446d-b28a-4bace9859169@windriver.com>
Date: Tue, 7 Oct 2025 16:40:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V3 1/2] rust: Use clang instead of rust-llvm
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
References: <20250926102411.3742996-1-Deepesh.Varatharajan@windriver.com>
 <9433bf5a-8648-4142-a17f-69092253dd46@gmail.com>
 <f07bc225-e3b6-4ac9-b6e4-de52d4053618@windriver.com>
 <CAMKF1spO_MP=CtN8rdG3S=YE2qmUEVYfCDsRrxzo6pipvpJD6w@mail.gmail.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <CAMKF1spO_MP=CtN8rdG3S=YE2qmUEVYfCDsRrxzo6pipvpJD6w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: MA1PR01CA0146.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::16) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|MN6PR11MB8171:EE_
X-MS-Office365-Filtering-Correlation-Id: a27c2daf-f6c6-45ef-f54c-08de05922150
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|4022899009|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?THd2c0x1QlFKNUFyRWxYdnpPQ3VIZVlwU0FlYmVOME4xMVR5d2RlMlE4Y2o4?=
 =?utf-8?B?Rmdic29qOGFHaTcvd3R2RmpqK3lFWVBDMFZ2RWFLQVkrYlhtSGRCenR5SU9x?=
 =?utf-8?B?VXlVUVVVKzUwaTFIbVVlNGNudjlEdWdpODY5QXdCZGVWNmVNbm5JaEY4enQ4?=
 =?utf-8?B?OCtjeWM0ZnZRT2dnWTZrQmJ1UVJUL1ZyYmxMU1FkMFR0SFZTcFl1a3NKaFpq?=
 =?utf-8?B?OUcyWGZrc1FNR2p1aWlGOXFUelVkeVptdHlLS3ZVaFl3eXEwdkRxWUprYWkz?=
 =?utf-8?B?V0cydkVPQldEN3JGZ0NTM3JrR2RIVmhveFlSb0Y3Q09YdXI3L1ZIaXZOMzdo?=
 =?utf-8?B?N3A4WWtHb2ZwRlRiVnQrWmF1OEd0WW5TUnZOTFppMnp6RExHYUFJYXRZYUtp?=
 =?utf-8?B?cUNVWllUbEJ4U1MvTklMalFXWTJwbWhCNGN4cFJZYWZwSkpzTTNjaUFiM0ww?=
 =?utf-8?B?a2lPeXR2REo1SFRHVzFwZzVHSTB1a1k2MDBXUGxVTVZoWjM2dWZRWTVtMlRV?=
 =?utf-8?B?UVlFQ3NhOVZKSGhyR3Flb0JSUGNYWUpXRlpvbHBWeUVQM21wVSt5dEs5Z0ZL?=
 =?utf-8?B?cHN4S05BTkxJcUNUajFNNHRTY2JZZi9SV0JGcnp5cWJqWXpDYlZySDlWaDdY?=
 =?utf-8?B?VUNnMnZoVmQzakk4RjJ1R1M3c1dOZ2JDNE93QTl1emZNOUNDRGF2Z3BIQ1RS?=
 =?utf-8?B?aUNEN1JhTjhiTGk1K2hsOTFmOWdjS2dQNC9yZloxVGNObVZJY0xXNEFFTGU5?=
 =?utf-8?B?UGNxeGxnK3RWWksvMDVZTlJQQ2RlR0M2OGZ3enRIaW5hN0dXMnNEeWRvVWhj?=
 =?utf-8?B?QnlRckJ2cWdRYmFHMkI0cTlWR3ptcURtWGNWalJ2ZGZkaFRQeFFtc3AyMUEw?=
 =?utf-8?B?N2ZtM2wyYjFRMVArclJJQ3FYK0F3REFnSkM5T1hTV3lHM3lDS3VEaFc0LzBh?=
 =?utf-8?B?bHQwYlZpTFpaZGFrZGNNY2JMYTlzWWVtbDllVVlsYit6eUxUdHB5Y1B2K21t?=
 =?utf-8?B?S1JoaXlFV3lwem04cEo1OG1jczRwekc2dmhCR0xzTW53aFh4OGM5ZVdxay9p?=
 =?utf-8?B?UXM5TmhUM29RRjdEdmZlOXlaWm5WVnN0VTJ6THI4U3pBWTRLWlZEaW4rb0lQ?=
 =?utf-8?B?Mi9FcjVtQTl3Ym1ZanR1M0tIdFlObjNneEtIQXhuczhSaTVDL0FZNFMwYjlU?=
 =?utf-8?B?WndnOHFvZHZyS0EwL1Q4MHR0NThPbk5qcFpFRGh1NFY2ZlRnZ3VFeVBXNnpM?=
 =?utf-8?B?bTExdHJWMEtZbDg3T1BORlZ0VVRlQ2g5ZkphNS9uajU1THNxRjhZNXFZWmdu?=
 =?utf-8?B?V2piU08yaTVIWndwUk4ydVBYNTJXOVZYLy9EaFhScDBuQ3JyMWlNTFAycGVV?=
 =?utf-8?B?d2pQMjBoMzJPZmErMGFHNE4yNExDbHBNNm1NRHFwNGtzTGd6QUFoMHBKRmJh?=
 =?utf-8?B?dnFrbW9YS1J4VUhvUE1Rclh4Q2ZqQlk1bCtGUERrOExPdmlEbDRjczBpck9n?=
 =?utf-8?B?RFdybVZWZWhDTURrNWlEZHBZR283d2NpU09oMWJrbWdrSXRYRzIzZ0ZOajRh?=
 =?utf-8?B?NkpGbzQ4VWFKdXJSZ2pKRndSbk1Ra0ZTN1duYW9lbTlnbW1TakJ5N21RN3dN?=
 =?utf-8?B?aGllUEpiN0VGOWo5akdpZ05ERWlublhLcWdoTW9mZlBYazkrZ2drY1lqbito?=
 =?utf-8?B?NzVwQXRkSmFNTGhRSGpsMkE5ZVQ4VU16RW5DK0toS0FpQjVwdzc2OVBKSnBM?=
 =?utf-8?B?ZVM4MWVpUUszRVF1N2hzakR2SWZOSGNXK2J0T3ltOEZGSDN5UzI4YVlyR29K?=
 =?utf-8?B?ZzRkUENWZWtwWkovcDlCNjRsaXNFTFZ3enZobVN6RXZsbTNVVXBVT3ZvaFFJ?=
 =?utf-8?B?WWlINTZPUnZrOEZpOGt3UWNmLzVNOVBadFRWa2dLMmZFdHc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MVdMZ2hHS0FkVnRFcDRVQkpkVjVsT0cxbkdMclFPNlpVNE1uUVhHcXVOdGJT?=
 =?utf-8?B?R1k3K2RGWVJPWVBLZ2hZa21Xd0VQd2hoeEhDRjYzT3o4WDZjSmZkZ3JXMUNS?=
 =?utf-8?B?WmtoaTNOYVpMVEZKbnBHa1ZaNjFKUWpLRDJVeXM0YmFoMHRRdEVSNHIrbTda?=
 =?utf-8?B?dTFRVm94OXVoQnE1WXNET0IrTE9HWnBFTFFrWnpmV3NzcFZtbzlIZENUcDlU?=
 =?utf-8?B?eFMvQjdyekl4dkNLb25lN1hSNHZnVEtEMS9aN0dvUjhlM1BqeW1WQVMwMjgv?=
 =?utf-8?B?dWl2ckNoRm5CcUZLYW1xYXBybjZLK2t1VTdUaUM4T0hFaHBaWktEenY0OUtM?=
 =?utf-8?B?dDFjSksxWWRjazVQdFQrclN4TXYvK0tPNG5CRWJXNHNiS0p2REdkV2JHcWh6?=
 =?utf-8?B?NklKd3YrM3IremhJNEhoWWswS0ZtSmN4Z1VlNW8wTzZ2NENTNVM0UXZrVity?=
 =?utf-8?B?ekJtR3h3dzF5M2Y5WTU1bVhRK0RwRHJhWnFKQUNxdnhUWForWHpJTzBnRmlU?=
 =?utf-8?B?QkhKbWJKaWF3dkxkVVdsZkNDREtoSlFLNDVTSmxHMkhKa2VlTWQrUmNkT2VV?=
 =?utf-8?B?aEZpb3dMZ1dJZVFsWWJRZlFWNnkvMVQ4Vm9xSUVTTDVXYlVzSTBqc3ZmNDdl?=
 =?utf-8?B?QlFCTWxPZDk3NkhBTkVHRDJuQWg0WHM2YTRlU2VXQVMwWENxZDA5cUV6b2lX?=
 =?utf-8?B?cjJObEYxa0pHaHVhNzZuSWw3QWlvTTk4S2E0RHVqNTRkeVVGV3NEOWNZUW9O?=
 =?utf-8?B?MHNuc08yRkpaSjhCS1cyZUxIejZadFlPK2NxODRERUhvbXczTVZKcFZxK1hj?=
 =?utf-8?B?WngrZFlobHNIeUp0cUo2eUYrNkpxTXN2bjd4cklYNVViSnFmM01FOGQ2RTEw?=
 =?utf-8?B?a2hadUx0YVN1OHkvaVhzVUlsdnhoa2RxY2ZkdnVlYXZSSHpYY0JpN0ROVTdJ?=
 =?utf-8?B?b2JIY2ZPOXd6L2N6czIrenc1eVEyeUgreFVYdldxWXdvRjdCU3NyaEZYV2JM?=
 =?utf-8?B?VWprQ3lwNFBkUFdsVWZ5RHNDUUpRNUNCVXNVNGcvczdJVklaWUVMZWRIMTNk?=
 =?utf-8?B?ZnI0Q2pJclU2L0ZOV0F1eDZjRTZwU2JlZmw2RWtZL2R2S0R3eW1CK0xhSzVV?=
 =?utf-8?B?TDcyaHVZaWs0b0NocHplQzdWbjd3azVNWnJYRW5xdXlFbUNUT2lhU3VRSUFl?=
 =?utf-8?B?aDhJcUp6TElZWnk3dHl5ditQcEF4cFNha1d1MUcyLzN6NEloTTA3U0JaTUk0?=
 =?utf-8?B?MEttekZiOHhDMGU5ZmhqdWJvUHRld2g5akF0WFY2VEhsa0Z1SVlSdjhOWFU4?=
 =?utf-8?B?VjJSSHdlSVhHd3lpNnhUMjVQVGdjZlpqZTlLeVE2ODhMZ2lsT2xCVVhlV050?=
 =?utf-8?B?U1ExOWp1aFNjM0Jtc1p1VGp0WEt6My9BZVZUcUd1Y3E3R1RCMzNaNTVuQWlv?=
 =?utf-8?B?NlRaVlRtTjJRbkh4UGcxcURZUStFbHUrVnJ5KzFKTnJxdlRXUXNoQ1hkUUM4?=
 =?utf-8?B?K0FWUkxiQllKbDBkNTZNU3VYUTE5N1VoL3hUUXljNlFrY0RnZHpVOURhRGJH?=
 =?utf-8?B?RXVwUyt3Z0xNQktDZzEybjRuWjRlR2IrS2lyM3UrLzV6RkFvNmFMMkovOWxh?=
 =?utf-8?B?L1E2OHpKSDNKZFlleFN1ZTRKNXFyc20zZm9VVk5pMERXY25iakcyRWxkQUps?=
 =?utf-8?B?RWhVdmcwaHJJajJOZTdjREJlazhDb2kzVXIxRnNmbTM3eXhxMnl5ZjZPUXNR?=
 =?utf-8?B?MUg1OWpyMURUYWZoTlVjSWJ6QVd3NXMwR2t0WUF2aFUzQTM1WEc5bWRWUjNR?=
 =?utf-8?B?bXJkY3VBQk44cDk1N3c5VXI2ZkdIKzMvR2xTc1dVNXNBRDhlOWdSaW1tdlZ1?=
 =?utf-8?B?YnIzdmFxZE1kSXlTdWVtc0ZybEZNVmpaTjM0YXNTeGtOWEJPam5CandDdmtS?=
 =?utf-8?B?cHcrRUlabThXcmtwN2h2VkZtNmhKbkhyeDltd1FvU1FtTHB3RVF1TUswTXl0?=
 =?utf-8?B?VzNRWGFpTXo3YTVXWXR3Ly9HSk5XQjQ4SnNCZHlJTUdmZUhndzR1RVBNdUhR?=
 =?utf-8?B?WjAxeS9icUtQb3Z2YjdyUEhOa3A2ME0vWWk1TDMxc2ordk83MWlQMUR4ZFI5?=
 =?utf-8?B?ZFBOd3VQdndJUmZpTjEydWJubkNtZ0FyZm5FTnNJRWtBeUdqVVRyVDkwRlBE?=
 =?utf-8?Q?oYPO/DmDPOeTxAOT76I3GnM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a27c2daf-f6c6-45ef-f54c-08de05922150
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 11:10:31.9753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cREVVSmoCk2mW+Y/NxwTOpdTC4RhX0pK4yGgoAhwr4PhiChUOCVKJTcTqyS1W0BzI7LXaXEZqouEytix9WmDx7berQRlXinIeuZBMW20Kn/jlMrDwwdKDzPo/zgIljEC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8171
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: A1ExnWdFy9wHmPCEuB3I_mnf4mqNa1K0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA3MDA4OSBTYWx0ZWRfX4+vpOHaan8F+
 hNaeeHuocGJdD+yYvFUF6TrJxv5up9wEh4FwGZM3oI0X0XWEWdNsv6Cq6kMFgl64h4/lNiwvPe5
 Ukd0Ua498trBKZ5tr9rpr/MrXBB9RAalJ/F2jBgztMYjF5KdPLGSnc7WwKFkLG5eN1KmAYKHelV
 U0CEU0HVeYH4Ox7N5uWCsEm9Qs74XqFKociFPO6brc7pYzJT6DJ+8YLqPY8Ji8uNmZfpTzbEJcA
 4gELiR+5fnMHyK2bgwjcWGGkLfbpK2RNhaON0ZxsSMMZP4jJ/DUQWvNPLSXe/B4JFg6bi+WnBmm
 6bxjBq4ypIzEhPwemEy32BpIMuMsoF+sBpH+q41vvIaysoZr0fwkxNaOBvyOF6gMdCXIFO/XSRQ
 FVHOjx2ac+OvQUCCTs+5z/GimsGiWw==
X-Proofpoint-ORIG-GUID: qfvFjbA3z0Ho8lV8C7RbKsWAZECiKxE0
X-Authority-Analysis: v=2.4 cv=ari/yCZV c=1 sm=1 tr=0 ts=68e4f530 cx=c_pps
 a=1HqfSBmQQ8HGCHze6/9uFg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=ei4SEBeUAAAA:8
 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=sKHWOaTUltQzQMvHVrsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Hqou25T6mLgA:10 a=8zIOOLb7Ym0NljyPXbuS:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2509150000 definitions=main-2510070089
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 597AEMeg3405382
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 11:10:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224524


On 02-10-2025 00:59, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Mon, Sep 29, 2025 at 1:29=E2=80=AFAM Deepesh Varatharajan
> <deepesh.varatharajan@windriver.com> wrote:
>>
>> On 26-09-2025 23:00, Khem Raj wrote:
>>> CAUTION: This email comes from a non Wind River email account!
>>> Do not click links or open attachments unless you recognize the sende=
r
>>> and know the content is safe.
>>>
>>> On 9/26/25 3:24 AM, Varatharajan, Deepesh via lists.openembedded.org
>>> wrote:
>>>> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>>>>
>>>> Updated the Rust build to depend on Clang instead.
>>>>
>>>> *Summary of discussion with the rust upstream about using latest LLV=
M
>>>> instead of Rust maintained LLVM fork.
>>>> https://internals.rust-lang.org/t/can-we-use-proper-clang-instead-of=
-llvm-fork-what-rust-uses/23489
>>>>
>>>>
>>>> *Upstream LLVM is generally compatible:
>>>> - Rust does support building with upstream (vanilla) LLVM, especiall=
y
>>>> the latest
>>>> major release and the one or two preceding ones.
>>>> https://rustc-dev-guide.rust-lang.org/backend/updating-llvm.html#upd=
ating-llvm
>>>>
>>>>
>>>> *Impact on Yocto Rust upgrades:
>>>> - Rust upgrades shall always check for updates on rust forked llvm
>>>> and backport
>>>> the relevant patches to clang's llvm.
>>>>
>>>> *Regarding the rust forked llvm local patches:
>>>> - There are no local patches on rust forked llvm other than the
>>>> backported fixes
>>>> from llvm master.
>>>>
>>>> *We now add these flags "-Clink-arg=3D-lz -Clink-arg=3D-lzstd" becau=
se of
>>>> this following
>>>> diff otherwise we will get errors during link time.
>>>>
>>>> Setup in rust-llvm
>>>> -DLLVM_ENABLE_ZLIB=3DOFF \
>>>> -DLLVM_ENABLE_ZSTD=3DOFF \
>>>> -DLLVM_ENABLE_FFI=3DOFF \
>>>>
>>>> Setup in clang
>>>> -DLLVM_ENABLE_FFI=3DON \
>>>> -DLLVM_ENABLE_ZSTD=3DON \
>>>>
>>>> *When multilibs enabled:
>>>>
>>>> llvm-config expects static libraries to be located in the lib
>>>> directory rather than
>>>> lib64. However, since LLVM is built as a non-multilib component, the
>>>> lib directory
>>>> doesn't contain any library files. To accommodate this without
>>>> breaking multilib
>>>> behavior, we copy the required library files appropriately.
>>>>
>>>> Previously, when we depended on rust-llvm, this worked because we
>>>> specified:
>>>> -DCMAKE_INSTALL_PREFIX:PATH=3D${libdir}/llvm-rust
>>>>
>>>> With this setup, llvm-config was installed inside
>>>> ${libdir}/llvm-rust, which included
>>>> its own bin and lib directories. Thus, llvm-config located in bin
>>>> would correctly find
>>>> the libraries in the adjacent lib directory.
>>>>
>>>> Even when multilib was enabled or not, llvm-config would still look
>>>> for libraries under
>>>> lib in this structure, so everything functioned as expected.
>>>>
>>>> *Changes needs to be done when llvm splits from clang:
>>>> In rust recipe:
>>>> Update the dependency from:
>>>> DEPENDS +=3D "ninja-native clang" to DEPENDS +=3D "ninja-native llvm=
"
>>>>
>>>> In llvm recipe:
>>>> Apply the same changes that were made in the Clang recipe, as those
>>>> configurations have now been moved to the LLVM recipe after the spli=
t.
>>>>
>>>> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.=
com>
>>>> ---
>>>>    meta/recipes-devtools/clang/clang_git.bb     |  4 ++--
>>>>    meta/recipes-devtools/clang/common-clang.inc |  6 +++---
>>>>    meta/recipes-devtools/rust/rust_1.90.0.bb    | 18 ++++++++++++++-=
---
>>>>    3 files changed, 19 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/meta/recipes-devtools/clang/clang_git.bb
>>>> b/meta/recipes-devtools/clang/clang_git.bb
>>>> index 53bca1c24f..3e117b308b 100644
>>>> --- a/meta/recipes-devtools/clang/clang_git.bb
>>>> +++ b/meta/recipes-devtools/clang/clang_git.bb
>>>> @@ -83,7 +83,6 @@ OECMAKE_SOURCEPATH =3D "${S}/llvm"
>>>>    # https://github.com/llvm/llvm-project/blob/main/llvm/CMakeLists.=
txt
>>>>    LLVM_TARGETS_GPU ?=3D "${@bb.utils.contains_any('DISTRO_FEATURES'=
,
>>>> 'opencl opengl vulkan', 'AMDGPU;NVPTX;SPIRV', '', d)}"
>>>>    LLVM_TARGETS_TO_BUILD ?=3D
>>>> "AArch64;ARM;BPF;Mips;PowerPC;RISCV;X86;LoongArch;${LLVM_TARGETS_GPU=
}"
>>>> -LLVM_TARGETS_TO_BUILD:class-target ?=3D "${@get_clang_host_arch(bb,
>>>> d)};BPF;${LLVM_TARGETS_GPU}"
>>> compiler we build is building all architectures once because it then
>>> reuses same compiler for all cross compilers just by creating canonic=
al
>>> symlinks, this change is not going to work.
>> We removed this line because, for the clang class-target build, LLVM w=
as
>> only compiling
>> libraries for the target architecture and GPU targets and kept inside
>> the target
>> sysroot. Since we use the llvm-config built for the class-target durin=
g
>> the Rust target build,
>> it was failing due to the absence of static libraries for other
>> architectures in the target sysroot.
>> Here the target is x86 arch. So, it compiled libraries for x86 arch on=
ly
>> and we can see the error
>> for missing libraries for other archs as below:
>>
>> |   --- stderr
>> |   llvm-config: error: missing:
>> poky/build/tmp/work/x86-64-v3-poky-linux/rust/1.90.0/recipe-sysroot/us=
r/lib/libLLVMAArch64Info.a
>> |   llvm-config: error: missing:
>> poky/build/tmp/work/x86-64-v3-poky-linux/rust/1.90.0/recipe-sysroot/us=
r/lib/libLLVMLoongArchInfo.a
>> |   llvm-config: error: missing:
>> poky/build/tmp/work/x86-64-v3-poky-linux/rust/1.90.0/recipe-sysroot/us=
r/lib/libLLVMLoongArchDisassembler.a
>> |   llvm-config: error: missing:
>> poky/build/tmp/work/x86-64-v3-poky-linux/rust/1.90.0/recipe-sysroot/us=
r/lib/libLLVMMipsInfo.a
>> |   llvm-config: error: missing:
>> poky/build/tmp/work/x86-64-v3-poky-linux/rust/1.90.0/recipe-sysroot/us=
r/lib/libLLVMPowerPCInfo.a
>> |   llvm-config: error: missing:
>> poky/build/tmp/work/x86-64-v3-poky-linux/rust/1.90.0/recipe-sysroot/us=
r/lib/libLLVMRISCVTargetMCA.a
>> .
>> .
>> .
>> |   thread 'main' panicked at compiler/rustc_llvm/build.rs:277:16:
>> |   command did not execute successfully:
>> "poky/build/tmp/work/x86-64-v3-poky-linux/rust/1.90.0/recipe-sysroot/u=
sr/lib/llvm-config"
>>
>> "--link-static" "--libs" "aarch64" "amdgpu" "arm" "asmparser"
>> "bitreader" "bitwriter" "bpf" "coverage" "instrumentation" "ipo" "link=
er"
>> "loongarch" "lto" "mips" "nvptx" "powerpc" "riscv" "x86"
>> |   expected success, got: exit status: 1
>>
>> Maybe instead of removing. Can we change
>> -LLVM_TARGETS_TO_BUILD:class-target ?=3D "${@get_clang_host_arch(bb,
>> d)};BPF;${LLVM_TARGETS_GPU}"
>> to
>> -LLVM_TARGETS_TO_BUILD:class-target ?=3D
>> "AArch64;ARM;BPF;Mips;PowerPC;RISCV;X86;LoongArch;;BPF;${LLVM_TARGETS_=
GPU}"
>> ?
> I think we don't want to build all the general arches for target, only
> the target arch and gpu arches
> is what is needed.  If we build all the backends, that will slow down
> things. But if target rust needs
> to support all the architectures to generate code for, then we don't
> have much choice. Can you see
> if we are ok to just target one architecture ?
The issue doesn't originate from Rust directly, it stems from the=20
following logic
in the Rust recipe, where the natively built llvm-config is copied into=20
the target sysroot:

 =C2=A0 =C2=A0 # Copy the natively built llvm-config into the target so w=
e can run=20
it. Horrible,
 =C2=A0 =C2=A0 # but works!
 =C2=A0 =C2=A0 if [ ${RUST_ALTERNATE_EXE_PATH_NATIVE} !=3D=20
${RUST_ALTERNATE_EXE_PATH} -a ! -f ${RUST_ALTERNATE_EXE_PATH} ]; then
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p `dirname ${RUST_ALTERNATE_EXE_PATH}=
`
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp ${RUST_ALTERNATE_EXE_PATH_NATIVE} ${RUST_=
ALTERNATE_EXE_PATH}
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -e ${STAGING_LIBDIR_NATIVE}/libc++.so.1=
 ]; then
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 patchelf --set-rpath \$ORIGIN/=
../../../../../`basename=20
${STAGING_DIR_NATIVE}`${libdir_native} ${RUST_ALTERNATE_EXE_PATH}
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 patchelf --remove-rpath ${RUST=
_ALTERNATE_EXE_PATH}
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi
 =C2=A0 =C2=A0 fi

Since llvm-config is being copied from ${STAGING_BINDIR_NATIVE} to=20
${STAGING_BINDIR},
and the native Clang was built with the following configuration:
LLVM_TARGETS_TO_BUILD ?=3D=20
"AArch64;ARM;BPF;Mips;PowerPC;RISCV;X86;LoongArch;${LLVM_TARGETS_GPU}"

The copied llvm-config will expect the corresponding target libraries to=20
be present in the ${STAGING_LIBDIR}.

To address this issue, as far as I can see we have three options.

1) Build clang-target also for all mentioned archs for clang-native.
2) Copy all the required libraries from ${STAGING_LIBDIR_NATIVE} to=20
${STAGING_LIBDIR}.
3) Instead of copying llvm-config from ${STAGING_BINDIR_NATIVE} to=20
${STAGING_BINDIR},
 =C2=A0 =C2=A0 =C2=A0directly make rust-target build dependent=20
on=C2=A0=C2=A0${STAGING_BINDIR_NATIVE}/llvm-config.

Are there any better or cleaner alternatives to handle this situation?
Any suggestions would be greatly appreciated.

Regards,
Deepesh

>>>>    LLVM_EXPERIMENTAL_TARGETS_TO_BUILD ?=3D ""
>>>>
>>>> @@ -107,6 +106,7 @@ EXTRA_OECMAKE +=3D "-DLLVM_ENABLE_ASSERTIONS=3DO=
FF \
>>>>                      -DLLVM_ENABLE_PIC=3DON \
>>>>                      -DCLANG_DEFAULT_PIE_ON_LINUX=3DON \
>>>>                      -DLLVM_BINDINGS_LIST=3D'' \
>>>> +               -DLLVM_INSTALL_UTILS=3DON \
>>> tabs vs spaces inconsistenty. Please fix it.
>> Sure.
>>>>                      -DLLVM_ENABLE_FFI=3DON \
>>>>                      -DLLVM_ENABLE_ZSTD=3DON \
>>>>                      -DFFI_INCLUDE_DIR=3D$(pkg-config
>>>> --variable=3Dincludedir libffi) \
>>>> @@ -137,7 +137,7 @@ EXTRA_OECMAKE:append:class-target =3D "\
>>>> -DCMAKE_AR=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ar \
>>>> -DCMAKE_NM=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-nm \
>>>> -DCMAKE_STRIP=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-str=
ip \
>>>> -                  -DLLVM_TARGET_ARCH=3D${HOST_ARCH} \
>>>> + -DLLVM_TARGET_ARCH=3D${@get_clang_target_arch(bb, d)} \
>>> why is this change needed ?
>>>
>> I made this change to ensure that LLVM_TARGET_ARCH is set correctly to
>> the actual target architecture.
>> However, it appears that even without this change, the build completes
>> successfully for the target. I checked
>> and printed the value of HOST_ARCH and realized it was already set
>> correctly my mistake. This change is
>> not required.
> LLVM_TARGET_ARCH is different than the backend architecture which is
> denoted by LLVM_TARGETS_TO_BUILD
>
>>>> -DLLVM_DEFAULT_TARGET_TRIPLE=3D${TARGET_SYS}${HF} \
>>>>                      -DLLVM_HOST_TRIPLE=3D${TARGET_SYS}${HF} \
>>>>                      -DLLVM_LIBDIR_SUFFIX=3D${LLVM_LIBDIR_SUFFIX} \
>>>> diff --git a/meta/recipes-devtools/clang/common-clang.inc
>>>> b/meta/recipes-devtools/clang/common-clang.inc
>>>> index bf3a63914a..c22e3c1b19 100644
>>>> --- a/meta/recipes-devtools/clang/common-clang.inc
>>>> +++ b/meta/recipes-devtools/clang/common-clang.inc
>>>> @@ -30,10 +30,10 @@ def get_clang_arch(bb, d, arch_var):
>>>>        elif re.match('aarch64$', a):                      return
>>>> 'AArch64'
>>>>        elif re.match('aarch64_be$', a):                   return
>>>> 'AArch64'
>>>>        elif re.match('mips(isa|)(32|64|)(r6|)(el|)$', a): return 'Mi=
ps'
>>>> -    elif re.match('riscv32$', a):                      return 'RISC=
V'
>>>> -    elif re.match('riscv64$', a):                      return 'RISC=
V'
>>>> +    elif re.match('riscv32$', a):                      return 'risc=
v32'
>>>> +    elif re.match('riscv64$', a):                      return 'risc=
v64'
>>> This is representing LLVM backend name and not normal arch and clang
>>> uses RISCV for both rv64 and rv32
>>>
>> After this change were made,
>> -                  -DLLVM_TARGET_ARCH=3D${HOST_ARCH} \
>> +                  -DLLVM_TARGET_ARCH=3D${@get_clang_target_arch(bb, d=
)} \
>> do_configure of clang failed
>> with the following error:
>>
>> | CMake Error at cmake/config-ix.cmake:585 (message):
>> |   Unknown architecture riscv
>>
>> Since this change is irrelevant
>> -                  -DLLVM_TARGET_ARCH=3D${HOST_ARCH} \
>> +                  -DLLVM_TARGET_ARCH=3D${@get_clang_target_arch(bb, d=
)} \
>>
>> The below changes are also not needed.
>>    -    elif re.match('riscv32$', a):                      return 'RIS=
CV'
>>    -    elif re.match('riscv64$', a):                      return 'RIS=
CV'
>> +    elif re.match('riscv32$', a):                      return 'riscv3=
2'
>> +    elif re.match('riscv64$', a):                      return 'riscv6=
4'
>> -    elif re.match('loongarch64$', a):                  return 'LoongA=
rch'
>> +    elif re.match('loongarch64$', a):                  return
>> 'loongarch64'
>>>>        elif re.match('p(pc|owerpc)(|64)', a):             return
>>>> 'PowerPC'
>>>> -    elif re.match('loongarch64$', a):                  return
>>>> 'LoongArch'
>>>> +    elif re.match('loongarch64$', a):                  return
>>>> 'loongarch64'
>>> same problem as above here
>>>
>>>>        else:
>>>>            bb.fatal("Unhandled architecture %s" % arch_val)
>>>>            return ""
>>>> diff --git a/meta/recipes-devtools/rust/rust_1.90.0.bb
>>>> b/meta/recipes-devtools/rust/rust_1.90.0.bb
>>>> index 5d804c7398..c2cb8f8829 100644
>>>> --- a/meta/recipes-devtools/rust/rust_1.90.0.bb
>>>> +++ b/meta/recipes-devtools/rust/rust_1.90.0.bb
>>>> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D
>>>> "file://COPYRIGHT;md5=3D11a3899825f4376896e438c8c753f8dc"
>>>>    inherit rust
>>>>    inherit cargo_common
>>>>
>>>> -DEPENDS +=3D "rust-llvm"
>>>> +DEPENDS +=3D "ninja-native clang"
>>> I think using 'llvm' instead of 'clang' here is more appropriate to
>>> represent the dependency, clang provides llvm as well, it also ensure=
s
>>> that when we split llvm out of clang recipe then you do not need to
>>> change it.
>> Sure will do that.
>>>>    # native rust uses cargo/rustc from binary snapshots to bootstrap
>>>>    # but everything else should use our native builds
>>>>    DEPENDS:append:class-target =3D " cargo-native rust-native"
>>>> @@ -28,8 +28,8 @@ PV .=3D "${@bb.utils.contains('RUST_CHANNEL',
>>>> 'stable', '', '-${RUST_CHANNEL}', d)
>>>>
>>>>    export FORCE_CRATE_HASH =3D "${BB_TASKHASH}"
>>>>
>>>> -RUST_ALTERNATE_EXE_PATH ?=3D
>>>> "${STAGING_LIBDIR}/llvm-rust/bin/llvm-config"
>>>> -RUST_ALTERNATE_EXE_PATH_NATIVE =3D
>>>> "${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-config"
>>>> +RUST_ALTERNATE_EXE_PATH ?=3D "${STAGING_BINDIR}/llvm-config"
>>>> +RUST_ALTERNATE_EXE_PATH_NATIVE =3D "${STAGING_BINDIR_NATIVE}/llvm-c=
onfig"
>>>>
>>>>    # We don't want to use bitbakes vendoring because the rust source=
s
>>>> do their
>>>>    # own vendoring.
>>>> @@ -188,6 +188,16 @@ python do_configure() {
>>>>        bb.build.exec_func("setup_cargo_environment", d)
>>>>    }
>>>>
>>>> +#llvm-config expecting static libraries in 'lib' instead of 'lib64'.
>>>> +#Since LLVM is built as a non-multilib component, the 'lib' directo=
ry
>>>> +#doesn't have any library files when multilibs enabled. So, copying
>>>> +#library files without impacting multilib behavior.
>>>> +do_compile:append:class-target() {
>>>> +if [ -d ${STAGING_DIR_TARGET}/usr/lib64 ]; then
>>>> +    cp ${STAGING_DIR_TARGET}/usr/lib64/libLLVM*.a
>>>> ${STAGING_DIR_TARGET}/usr/lib/.
>>>> +fi
>>>> +}
>>>> +
>>>>    rust_runx () {
>>>>        echo "COMPILE ${PN}" "$@"
>>>>
>>>> @@ -199,7 +209,7 @@ rust_runx () {
>>>>        unset CXXFLAGS
>>>>        unset CPPFLAGS
>>>>
>>>> -    export RUSTFLAGS=3D"${RUST_DEBUG_REMAP}"
>>>> +    export RUSTFLAGS=3D"${RUST_DEBUG_REMAP} -Clink-arg=3D-lz
>>>> -Clink-arg=3D-lzstd"
>>>>
>>>>        # Copy the natively built llvm-config into the target so we c=
an
>>>> run it. Horrible,
>>>>        # but works!
>>>>
>>>>
>>>>
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#224075):
>>>> https://lists.openembedded.org/g/openembedded-core/message/224075
>>>> Mute This Topic: https://lists.openembedded.org/mt/115446166/1997914
>>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsu=
b
>>>> [raj.khem@gmail.com]
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>

