Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02173C5AD49
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 18:31:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2738.1748975502048479730
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 11:31:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8249c63dc3=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553BmXSN021780
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Jun 2025 11:31:41 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rsaa5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 11:31:40 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 553IVeT6018871;
	Tue, 3 Jun 2025 11:31:40 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2079.outbound.protection.outlook.com [40.107.94.79])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rsaa4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Jun 2025 11:31:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CeG5qbjvtQXqOl29EhkH87l1o1a3to8ta7UQ+x80AUqyZgmci/4IZc53VmtDJyvvD0vcR4WG2vTAq3ZUT13CRcWmHbrOYxJ+iL0i4MA2BCXzIYie99R77oy7xCz0b+PSfrRPS4eZ+2R3OrcqLKGOBw7wkbRERUV0PjSsMUYIPkAXCZyN1Cjaw01ohlsCZx9X2aFUSe5j0y+uJnH17mqYpalzpo4MyFWqofuWjqspqtlx+0WhCu//i+dM1+QfSznuMSJ/VUki+4xI+r1H81V44NZ1cRYXUSYGg9bG6eeKFvLp3NQ14AAt34MJp13BiDKwCqqyk0n65MDput16zA8vZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o18S8ROmzLTY/rb+jUR+OddSn5iT6GXp2/jQX5/7sFQ=;
 b=YEEHWTnHMeu+x75A3MTzljI9I2ipxktC2IP4A4tg5W+NqeIClPw3+y24Ghq7j5zSO1CInaoWDU1qkIJG3JtN5HiYC6w9WcR5jyVelCPCeGkZtillGLP9MDDfmNIdUqq9Z+rwlu88JjYOHU+/QUmrvyCz0VUrFj7TgZZiG3hvMwYLY5saUAu/hVrWvrHDCFcNzYZ28PtgqaIYl3Hdm5Y9C2rg6Zq0gkG/x2YjRS05zfpw95a8mksLDVdUHPevJnk4nKYZLZVtLSIcedbjPY4odYWEna1hxIYb/4qlu9NSkXL3GZ1MoJlna0625M8n19HsvY8LxzAEgkiB68vh3KOm2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by CH0PR11MB8085.namprd11.prod.outlook.com (2603:10b6:610:183::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 18:31:38 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%5]) with mapi id 15.20.8769.037; Tue, 3 Jun 2025
 18:31:37 +0000
Content-Type: multipart/alternative;
 boundary="------------Km1642fcrWXGnowICzRIQVar"
Message-ID: <105472d8-aa33-4894-b23f-0a4be90367c1@windriver.com>
Date: Tue, 3 Jun 2025 14:31:34 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC] rust: Upgrade 1.85.1->1.86.0
To: Khem Raj <raj.khem@gmail.com>, Randy MacLeod <rwmacleod@gmail.com>
Cc: "Shinde, Yash" <Yash.Shinde@windriver.com>,
        Alexander Kanavin <alex.kanavin@gmail.com>,
        Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
        "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
References: <83e0d268-ec47-4f3a-bf05-2aee4e58e749@windriver.com>
 <CANNYZj-BmEXJVc1rdVPGu5wz87AW1RvbX+WhgicAfEby7kjUhw@mail.gmail.com>
 <47ba1f68-f67b-4c58-b788-63e06fdf4816@windriver.com>
 <CANNYZj-JtVtjk2e+Z=OmVF8RaygO5M1e+6tbQuTZYotbYetQrg@mail.gmail.com>
 <7571c07b-2225-4449-8169-08b044208072@gmail.com>
 <afaa4102-c876-437a-871d-f6f90697d5f4@windriver.com>
 <CANNYZj-Pa_jhraEz7qAHoDXLxfg-7ztH4UhdRPXirw6biZGWEA@mail.gmail.com>
 <36532bcc-c9dd-430a-a932-ec81e9270f19@windriver.com>
 <CAK6=ix4WrPGEbsfRwEsZz56BJP61OnkjqO8xvcB9BYoNJ2A6RQ@mail.gmail.com>
 <CAMKF1spgaYyyYOs633Lr_0EMq=vmixOXLDa4Q2ivb9PJy0BY8A@mail.gmail.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CAMKF1spgaYyyYOs633Lr_0EMq=vmixOXLDa4Q2ivb9PJy0BY8A@mail.gmail.com>
X-ClientProxiedBy: PH8PR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::20) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|CH0PR11MB8085:EE_
X-MS-Office365-Filtering-Correlation-Id: fbf5798a-9791-4a83-bcfc-08dda2cce034
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|4022899009|366016|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?c0hqdGFCN2ZRTmlqdDFEUDBaVHc5bXZiYjdWaWM5bkEzT2VrV0pkK2F6TS9D?=
 =?utf-8?B?TEFkRDdRSFRWd2Nnd2lyTXpZM2M4cW9oNDlNYUtEenljT2U5T2RsL2JGL3hK?=
 =?utf-8?B?aVZaL2tES04vN3Vkd0xFbWNYOFJYcmFKTXhuZHRkYVAvTUw2bjBSN1U3OFpW?=
 =?utf-8?B?TGNRWGVEalNFOXdxR2k3S05YaENTcFhaVUNMSm5xZDA2L1hNS2c4TTBuRFFG?=
 =?utf-8?B?eG5uUTg0WGI5a1VpdlJNOHRHY3NEQjdpUzZZK21IZjdsbnVSaE9LSkNsaGhy?=
 =?utf-8?B?Z2xsRTFMTHZ6UkRINjY3T3JRYVRTSWFERE9KMGRNeEpBM0lRODY5SmozWWpL?=
 =?utf-8?B?YVozTHQ0d0w2cnB1YkVacms2QjVVM0Z5ZEdYend3c1RINDN0Yzlaa2ZMSE9m?=
 =?utf-8?B?RUlUOGFyN1hxdDRHNVptWWZXV1AzLy9EUUZ4dzMrV1RMd2E0bTlmTXE4c21E?=
 =?utf-8?B?WnFJTHNkT0FIUWQ3OUlOLzV3NEpkWnd5YytQajVjWHlldVVMc1NEaFRUOGh0?=
 =?utf-8?B?dWpNL1Q5WlpxazdCUTdHbktCKytjcUNNRkorSjljdStXYjl6UVFWVlRnT0Jh?=
 =?utf-8?B?bm5ZVThyVmtaNEliMFc1U2drUzFMZEpaNHFsODVQcGRoTjdtUlFYQW1ldEZQ?=
 =?utf-8?B?aU9uWTM4em5NZUVLSTFpYWVBbWhsbjg5b2c1bVRoQ2xHb3EvZWJsVy9ueFZn?=
 =?utf-8?B?dlNwN3M4WW9Qa09xZFFuQXdKSCtiTm83R0R0bFlVSTNIckNEYUZqVUFoa3lh?=
 =?utf-8?B?NlBEeDNnN2dIM0ZET3ptVDdTUzM2U0pXb2JnSGQwNExncnpWcFdEanNONmhl?=
 =?utf-8?B?VnZhWnQzTTBNTDZWVjRiTlpQTkFkeU0rVzlmNkJTQ1oybHI1NklHSlRQT2Zm?=
 =?utf-8?B?QTZkdWRBV0dCNWN0Ui9wdVJDSzYyRlUwZHErc25SSFFCaFlMSzV0cjZEVGJN?=
 =?utf-8?B?eGkzbmk4OCtXSWhyTGFCQXh4NjF1MjVuR2JLUXlTcEZiMUFYcmNzVHl0KzVE?=
 =?utf-8?B?TklobEtWSDBUeklhSEUyNzljR3crOWZaNnI1TkpkZ1NKb0hkVzBIY2ZYd1Vw?=
 =?utf-8?B?ekFiRjZEc08xY2VQYlJjeTlBRHpNMXVhVWVoUUYyejk4Z1I5UTJlbHZOZWh2?=
 =?utf-8?B?blg3WjMwbmNQSkNGQTBmSUZQdFV0RWVKTWRIblpzVWloVGQ0Q3JPWlJ4aWsz?=
 =?utf-8?B?OU12NFJMeTl1KzBWa1RiNmlvbURsbkthTnNLeG1qWVd6OWtIQm94YnVDNzFn?=
 =?utf-8?B?cEFPcWR5TmY5ek9mWGFGa0xSVnl0S1lxSDhMSjRPZHlvTTNiZHBRNWRxN0lj?=
 =?utf-8?B?a3VHMUNFOGptbmJrUnRSQlY5bjc5Q3F6NTVTNDVyaFd6Mk1DNkczUVNKVUw2?=
 =?utf-8?B?ZE16Q0ErQVd4ZWpSSGF2K0sxZ25yN1NuNi9uTGdjdjZUMjFDcmozQ0FTZXp3?=
 =?utf-8?B?dHE3ZHZTbVFBU1kyalA1YnMwcmxmWnAydWg0UE5VSXFudXRJdzBWSlpPS3lm?=
 =?utf-8?B?VkFpcUhqZUtVYVV0RjRLUm1IaDdZb1l1M3ZsclV4YmJJOTZqL0xSVE83Q0l1?=
 =?utf-8?B?UC9OM3h3MGYzanQ4QW1FdmFieUF6b1M2ekpia08ydzg1U0tYUnlPYktLK0xw?=
 =?utf-8?B?VUExdEYvcGs3YzdhQmpTRENjcVgrS2hCaHF4QW9xSldVR3B5SFhoNS9UZlVI?=
 =?utf-8?B?clpxZ0pHN1lhT0hybFBsVk1WYmlidk9TZDZHeGQ5SHVCKzgzdHBqeFVYU0pB?=
 =?utf-8?B?d09ST3ZEdGxHNDF4NWh6SGh0L2JrNjZucWNIWGRiSnlZWFE0aUNWWGl5S3Jx?=
 =?utf-8?B?RXhMSW9EQWVtcktkOWFxZkdUR01SM2NsNkFIQzRFNm1NYzIzRTRkL0IrTFQv?=
 =?utf-8?Q?prABKvPtkzn/d?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(4022899009)(366016)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QVZkNEFYSDRzL0ZZZkRmVzhpS2JYTjhMeEVBTjdJbURYTllsTmlEZ3V4YmhS?=
 =?utf-8?B?M3liblFRR2lmSzhTUlZxKy9OUkRDZ0pPNnBIaEp0aFk4L3diNGh2NHFrdEI3?=
 =?utf-8?B?S2RZQ29udXpmMXAyZE1ObnF5VE56VTRLU0dEd1A1c2N6RjB1ZklLVEI3dUxH?=
 =?utf-8?B?aXdGdVN6NU10ckt5Mi96OEp6aDFRVHRweitQeFBPdGducHVuVFF2dktpdTc4?=
 =?utf-8?B?K0FKcnBKL2ZZeGpKb0pyMFc5K05uOUE3eTlJS1hpaExoY1h6UXNhVEZIZk54?=
 =?utf-8?B?NXJISmFGY0tUU1R2d2NtY2FaSTNvRy9NMUFDRElXYUkrWEQ4VDgzSWs1eXR0?=
 =?utf-8?B?YVRINURNa3hpMWJxdGtCZUtJQ1ZBcGJZWk1FamttL0xjR3BLNFZDRFMzdU9P?=
 =?utf-8?B?WTl6ZlBpRWJZaWg3am9SZm1XQnR2UnMrc3dtZlpBTVoreVRjMzZKRmFiaUlE?=
 =?utf-8?B?bXMzYW5ZcGpJRG1UMWFjQ1BZN202emVna3RQYkxmSCtaZ1dwbzlJK2hsdmtL?=
 =?utf-8?B?Z2lhL1JBYXJrZVVKSllzbWtrL2xraElVc1VyM1NuR25NRjd3MGEvRFZFYU5J?=
 =?utf-8?B?dEJVbWVIRTN0T3QwWkhZR2xKeHJFRExzWkJRcVAwcjN2SmpzcDJDdkx6blI4?=
 =?utf-8?B?TUM3T1NaaHYyT0NLc0pSN3dyK2MyckJkeXdEdWZUdGNiRitKeCthL1RQL3Av?=
 =?utf-8?B?ZzZCWGNiOEJwMExDSHRMWEJEN3VyaG1idncvdDhQMVNwWDU0VTR6S1g1Q2Jr?=
 =?utf-8?B?ejhjUmFCS2paaFkxRzBjNHA1UEJmREREcUF2MVc0WkFEUkZtZEl5TGZzTDBk?=
 =?utf-8?B?VWt0MVQvVGdiK3pSdkhQYlBEWjRyZDVNNk9pKzZEZXpUV0tUZFBPNC9DUmI2?=
 =?utf-8?B?U2pWdXFCNFl2TnVWak9jeXl4T08wbVhia1ZCQzgvZEFqVVZaYzdKQnhuZmlu?=
 =?utf-8?B?MnpvT004S1pGK25VN2dQYi85QlFLQkJSK1RzWmc3bitxa2FLRHhpekI5MXhl?=
 =?utf-8?B?V2hGRGtEWG9iVVR2V1hsWHdhcmdvYXlPVWxnZmNoVk5MMitPdklxblVXMWFx?=
 =?utf-8?B?M2oxVE1wSUl1ZURUbzZZRTNRVEQ3ek8rLzJxOEZlUGcwejJIYUdSeHBmRUp6?=
 =?utf-8?B?YU9Zc21aVFZGb3ovTUt6bUhJa0I2M3lsMjgvOTQvclY5M0JkeUo5aWNTdjQ3?=
 =?utf-8?B?a1FDeFhFNVl5aGtXL05VcGRzelRkSnpaUldCZnVaZHhwQmRDQU5vMFlaK0xE?=
 =?utf-8?B?c3YvKzhReGxRTUgvRFkxMjhLcEdKamIxSEFlQm45aVp1cFAvcDUzOFFtNFk5?=
 =?utf-8?B?L2ZsRGJFRERCb2lMS0l1dklLdUJ5YmhQUnA5YUxlU1NrdEkxVmR6cWFXalV0?=
 =?utf-8?B?S1VtUHpnWG1IR1ZUekwzWTdiNzlTclVPY3hvdHMxTitCMmtBTTdKYjdLZlFC?=
 =?utf-8?B?ZVhHTDhEd1NydkVaT1dIZXVMUmZFSnZ3S3d6cFQrTUJhTHNLc0dPM2tlU2lV?=
 =?utf-8?B?cHhYa2pMb0U5SlEzV3pNNUtXV0ZhMTI2N3V5RG5Fc3UvWGY0bHB3MjdPMkFh?=
 =?utf-8?B?M1lDMnYrMElaSlAxVXlXdHFnTXRZbFk4V0Z3Qnh0UHpaMmRzRDNGSEFwUHRk?=
 =?utf-8?B?cHMyQ1NPS0xxa1lyZW1POXM0bW9ZS3NtemI3NllqcG44SSs0NDJHM2Jua3FK?=
 =?utf-8?B?SWRJaHJEMkE4Y1pVZlFFNTZISmJmNkNadW1zRVdxSnJ0UFZrblQ1MzkzY21I?=
 =?utf-8?B?b0RrdU9WUm40MzZXUld3bHY3Zit5NSsrbHY5WmVWUWhnZ1ppZUptUzRIbUl3?=
 =?utf-8?B?RDZ3QXZVMjZhNytwUC8xQ0lyUHpsQ3JieEI3ZmJpYy9lZXRLNXZiWHh1RURI?=
 =?utf-8?B?QXRPTHNzajJhcGowckxKd0Z6aFY5N00wZkhVd2FuV1l5ZUxUUC9pRHhIWFlz?=
 =?utf-8?B?U1lWVlJ3QVk5MzBJd29Ua2xLQmh0dms2NUtjUmJFL2hYM2VLZkdJOTVuMUo4?=
 =?utf-8?B?SFBubysxeFBWVGxkNld0ZEhBVlBFZjR2ZjVhdzg5TGdrNWJxRDY5ZmlIYlN6?=
 =?utf-8?B?TGZyaTRmY25saUtxSXBQZk1BTVhWYkg1QnlnS2xiQ2Y0M0pPOUI5YkZVbGds?=
 =?utf-8?B?Q1EwcGF1am5WVFpVTlNHSUd1SW1uaHJjZ09jRGJIeTk0RzVFRzBQbEVRZTI0?=
 =?utf-8?B?bFE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbf5798a-9791-4a83-bcfc-08dda2cce034
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 18:31:37.7924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hfAhKqKV8OlppTAxtRaht/iBmM9OwAnP7uqWUkKy1Z7+/kdc8aJLXDUxcu+FYxUTcQBn0/GXWxW0lUF0hGVXIoUe/4O751kFb0kjbRIYylI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8085
X-Proofpoint-GUID: 1MWqARoetcBTriYrU8EZL9xJlJw-jQ_A
X-Authority-Analysis: v=2.4 cv=VIHdn8PX c=1 sm=1 tr=0 ts=683f3f8d cx=c_pps a=XXikXukjthQYDL6FPtOYxQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=Q4-j1AaZAAAA:8 a=iGHA9ds3AAAA:8 a=Nz9NidzBAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=61lQDDAYECZt9WeApQAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IU3AcmGtwBV3Png1SDcA:9 a=K706vmSh-GlQKheR:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=LgWPwpNXs9QkyLbNdJUa:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDE2MSBTYWx0ZWRfX1Ip6DpNcuN7d qr0feaj3yuDUB8wCL4HPLKbK77Fu+OnIplSVPaZzI71b7NXk0EavAcs0l/oD3BmyBc5/SOSP3Kz yjjrHmxg8v7gHdMaPLXF9viCBTnBlv3/4uWga23nnkY2ocuVmMz12SEUDVVPIgQtUNUscQ9EPV6
 hwqvywyQ/1hcB6YNSlBQRudyxGLOHxlynHY/+AEniyoUqCqyH3Uq9hDl9GeFU7XEd3gEiWKqP8H 9hihzxrvPmVJlABisQjVnve7nANc9uzqdbO92+dNSoOZF6nDGOqXJ/ac6bStX/VrHYw5Gs/DtsS 6f8pweDgfU3ggH0pE2C95Z3Bi3iSkbJi7BKkeM5R8VXaTXBnaslyRg+EK4zwIkN7+Mcb881jn+A
 SR5UqnCe845NES3l5e5Ry2eIVtmF0RTIb/NNW6AV1dsOjYGpuhc44Jv+3SK3fWCopCev89wU
X-Proofpoint-ORIG-GUID: qo89F4pKzrehH84bGxV3u7zqepEZQPIY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_02,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506030161
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 18:31:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217820

--------------Km1642fcrWXGnowICzRIQVar
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-MIME-Autoconverted: from 8bit to base64 by mx0a-0064b401.pphosted.com id 553BmXSN021780

T24gMjAyNS0wNi0wMiAxOjA5IHAubS4sIEtoZW0gUmFqIHdyb3RlOg0KPg0KPg0KPiBPbiBN
b24sIEp1biAyLCAyMDI1IGF0IDY6MDPigK9BTSBSYW5keSBNYWNMZW9kIDxyd21hY2xlb2RA
Z21haWwuY29tPiB3cm90ZToNCj4NCj4gICAgIEhpIFlhc2gsDQo+DQo+DQo+ICAgICBPbiBN
b24sIEp1biAyLCAyMDI1LCAwNzoxNSBZYXNoIFNoaW5kZSB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZw0KPiAgICAgPGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwOi8vbGlz
dHMub3BlbmVtYmVkZGVkLm9yZ19fOyEhQWp2ZVlkdzhFdlEhZUZiRXJvdXhXZV84c0VFVkkx
a3JZSjhtaHV2LXJJcnJ2TEVrN3JZcDJaZUNCWURwTW1zVnNOeWE4bXl4aU15d2FPRk1NdEJf
XzBZdlk3cnRNaGNwQWckPg0KPiAgICAgPFlhc2guU2hpbmRlPXdpbmRyaXZlci5jb21AbGlz
dHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+DQo+DQo+ICAgICAgICAgT24gMzAtMDUt
MjAyNSAxODo0NSwgQWxleGFuZGVyIEthbmF2aW4gd3JvdGU6DQo+PiAgICAgICAgIE9uIEZy
aSwgMzAgTWF5IDIwMjUgYXQgMTQ6NDIsIFlhc2ggU2hpbmRlPFlhc2guU2hpbmRlQHdpbmRy
aXZlci5jb20+IHdyb3RlOg0KPj4NCj4+PiAgICAgICAgIEFzIEtoZW0gbWVudGlvbmVkLCBz
ZXR0aW5nIGxsZCA9IGZhbHNlIGluIGNvbmZpZy50b21sIGRvZXNuJ3QgYnVpbGQgTExELg0K
Pj4+ICAgICAgICAgRnVydGhlcm1vcmUsIHVzaW5nICJ1c2UtbGxkID0gZmFsc2UiIGVuc3Vy
ZXMgdGhhdCBMTEQgaXMgbm90IHVzZWQgYXMgdGhlDQo+Pj4gICAgICAgICBkZWZhdWx0IGxp
bmtlciwNCj4+PiAgICAgICAgIGNhdXNpbmcgdGhlIGJ1aWxkIHRvIGZhbGwgYmFjayB0byB0
aGUgc3lzdGVtJ3MgZGVmYXVsdCBsaW5rZXIuIFRoaXMNCj4+PiAgICAgICAgIHJlc3RvcmVz
IHRoZSBlYXJsaWVyIGJlaGF2aW9yLg0KPj4+ICAgICAgICAgQWxzbywgdGhlIHBhY2thZ2Ug
UUEgZXJyb3IgZm9yIHJ1c3QtbGxkIGlzIG5vdCBzZWVuIHdpdGggdGhpcy4NCj4+ICAgICAg
ICAgV2hhdCBhYm91dCBidWlsZCB0aW1lcyB0aG91Z2g/IEFyZSB0aGV5IGJhY2sgdG8gd2hh
dCB0aGV5IHdlcmU/DQo+Pg0KPiAgICAgICAgIFRoZSBidWlsZCB0aW1lIGRpZmZlcmVuY2Vz
IG9uIG15IG1hY2hpbmUgYXJlIGFzIGZvbGxvd3M6DQo+DQo+ICAgICAgICAgcnVzdCB2ZXJz
aW9uDQo+ICAgICAgICAgCXJ1c3QgdXBzdHJlYW0gYnVpbGRzDQo+ICAgICAgICAgCXJ1c3Qt
bmF0aXZlICh5b2N0byBidWlsZCkNCj4gICAgICAgICAJcnVzdCB0YXJnZXQgKHlvY3RvIGJ1
aWxkKQ0KPiAgICAgICAgIHYxLjg1LjENCj4gICAgICAgICAJMTAgbWlucw0KPiAgICAgICAg
IAkyMCBtaW5zDQo+ICAgICAgICAgCTMzIG1pbnMNCj4gICAgICAgICB2MS44Ni4wDQo+ICAg
ICAgICAgCTIyIG1pbnMgKHdpdGggImxsZCIgYW5kICJ1c2UtbGxkIiBzZXQgdG8gImZhbHNl
IikNCj4gICAgICAgICAzMCBtaW5zICh3aXRoIGRlZmF1bHQgc2V0dGluZ3MgaS5lIGxsZCA9
IHRydWUpDQo+DQo+ICAgICAgICAgCTMxIG1pbnMgKHdpdGggImxsZCIgYW5kDQo+ICAgICAg
ICAgInVzZS1sbGQiIHNldCB0byAiZmFsc2UiKSAJNDMgbWlucyAod2l0aCAibGxkIiBhbmQN
Cj4gICAgICAgICAidXNlLWxsZCIgc2V0IHRvICJmYWxzZSIpDQo+DQo+ICAgICAgICAgTm90
ZTogVGhlIG1hY2hpbmUgYmVpbmcgdXNlZCBpcyBhIHNoYXJlZCByZXNvdXJjZSBhbmQgZmFp
cmx5DQo+ICAgICAgICAgYnVzeS4gQnVpbGQgdGltZXMgbWF5IGRpZmZlciBkdWUgdG8gb3Ro
ZXIgdXNlcidzIGJ1aWxkcy4NCj4NCj4NCj4gICAgICAgICBUaGUgRlMgdXNhZ2UgaXMgYXMg
Zm9sbG93czoNCj4NCj4gICAgICAgICBSdXN0IHZlcnNpb24NCj4gICAgICAgICAJcnVzdCB1
cHN0cmVhbSBidWlsZHMNCj4gICAgICAgICAJWW9jdG8gcnVzdCBidWlsZHMNCj4gICAgICAg
ICAoYnVpbGQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC9ydXN0LzEuODYuMC9ydXN0
Yy0xLjg2LjAtc3JjL2J1aWxkKQ0KPiAgICAgICAgIHYxLjg1LjENCj4gICAgICAgICAJNC42
IEcNCj4gICAgICAgICAJNi4zIEcNCj4gICAgICAgICB2MS44Ni4wDQo+ICAgICAgICAgCTE1
IEcNCj4gICAgICAgICAJOC44IEcNCj4NCj4gICAgICAgICBUaGUgbGF0ZXN0IHJ1c3QgdjEu
ODYuMCB1cGdyYWRlIGNoYW5nZXMgYXJlIGF2YWlsYWJsZSBhdDoNCj4gICAgICAgICBodHRw
czovL2dpdC55b2N0b3Byb2plY3Qub3JnL3Bva3ktY29udHJpYi9sb2cvP2g9aGFyaXNoL3J1
c3RfMS44Ni4wX3YyDQo+ICAgICAgICAgPGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19o
dHRwczovL2dpdC55b2N0b3Byb2plY3Qub3JnL3Bva3ktY29udHJpYi9sb2cvP2g9aGFyaXNo
KnJ1c3RfMS44Ni4wX3YyX187THchIUFqdmVZZHc4RXZRIWVGYkVyb3V4V2VfOHNFRVZJMWty
WUo4bWh1di1ySXJydkxFazdyWXAyWmVDQllEcE1tc1ZzTnlhOG15eGlNeXdhT0ZNTXRCX18w
WXZZN3FrYWkwZGt3JD4NCj4NCg0KRlMgYmxvYXQgaXMgcGFydGx5IGR1ZSB0bzoNCiDCoMKg
IDEuIHdlIGZvcmdvdCB0byByZW1vdmUgY2FyZ28gZnJvbSBydXN0IHBrZywNCiDCoMKgIDIu
IHJ1c3QtYW5hbHl6ZXIgYWRkZWQgaW4gMS44NiwgLSBkbyB3ZSBuZWVkIGl0Pw0KIMKgwqAg
My4gd2FzbS1jb21wb25lbnQtbGTCoCBidWlsdCAtIGRvIHdlIG5lZWQgaXQ/DQogwqDCoCA0
LiBsbHZtLWJpdGNvZGUtbGlua2VywqDCoMKgwqDCoCBidWlsdCAtIGRvIHdlIG5lZWQgaXQ/
DQoNCkZvciBub3csIGRyb3AgdGhlIHRoaW5ncyB3ZSBkb24ndCBuZWVkIGJ5IGNoYW5naW5n
IGNvbmZpZy50b21sLg0KV2UgY2FuIGNvbnNpZGVyIGFkZGluZyB0aGVtIGFzIGRpc2FibGVk
IGJ5IGRlZmF1bHQgDQpQQUNLQUdFQ09ORklHW2ZlYXR1cmVdIG9wdGlvbnMgbGF0ZXIuDQoN
ClRoaXMgaXMgZnJvbSBsb29raW5nIGF0IHRoZSBwYWNrYWdlcy1zcGxpdCBjb250ZW50cyBh
bmQgYSBmaWx0ZXJlZCANCmxvZy5kb19pbnN0YWxsLg0KRGV0YWlscyBhbmQgbW9yZSBpbmZv
IGJlbG93Lg0KDQouLi9SYW5keQ0KDQoNCg0KSSBleHBlY3QgdGhhdCBydXN0LWFuYWx5emVy
IGlzIGFsc28gdGhlIHByaW1hcnkgcmVhc29uIGZvciB0aGUgYnVpbGQgDQp0aW1lIGluY3Jl
YXNlIGJ1dCBob3BlZnVsbHkgWWFzaCBjYW4gY29uZmlybS4NCg0KSSBkdWcgdGhyb3VnaCB0
aGUgbG9nIGZpbGVzIGEgYml0IHdoaWNoIEkgZG9uJ3QgZG8gb2Z0ZW4gdGhlc2UgZGF5cyBz
byANCm1heWJlIHRoZXJlJ3MgYSBiZXR0ZXIgd2F5IHRvIGdldA0KdGhpcyBpbmZvLg0KDQri
na8gcmfCoCAiXkNPTVBJTEV8XkJ1aWxkaW5nIiAxLjg1LjEvbG9nLmRvX2luc3RhbGwgfCBz
ZWQgJ3MvICguKikkLy8nwqAgPiANCjEuODUuMS9DT01QSUxFLUJ1aWxkaW5nDQrina8gcmfC
oCAiXkNPTVBJTEV8XkJ1aWxkaW5nIiAxLjg2L2xvZy5kb19pbnN0YWxsIHwgc2VkICdzLyAo
LiopJC8vJyA+IA0KMS44Ni9DT01QSUxFLUJ1aWxkaW5nDQoNCg0KRGlmZnMgYmVsb3cgKDEp
Lg0KDQoNCkluaXRpYWxseSBJIHdhcyBsb29raW5nIGF0IGxvZy5kb19pbnN0YWxsIGFuZCBm
aWx0ZXJpbmcgb3V0IG5vaXNlIHVzaW5nIA0KYSBjb21iaW5hdGlvbiBvZiBncmVwLCBzZWQs
IGFuZA0KZW1hY3MgbWFjcm9zIG9mIGFsbCB0aGluZ3MhDQoNCkkgZW5kZWQgdXAgcmVkdWNp
bmcgdGhlIGxvZy5kb19pbnN0YWxsIGZpbGUgbGVuZ3RoIGJ5IGFuIG9yZGVyIG9mIG1hZ25p
dHVkZToNCuKdryB3YyAtbCAqL2xvZy5kb19pbnN0YWxsDQogwqDCoCAxMzM1MSAxLjg1LjEv
bG9nLmRvX2luc3RhbGwNCiDCoMKgIDIyMTQ0IDEuODYvbG9nLmRvX2luc3RhbGwNCg0K4p2v
IHdjIC1sICovbG9nLmRvX2luc3RhbGwuQ29tcGlsaW5nLmZpeC13aXRoLWVtYWNzLkNvbXBp
bGluZy5zZWQtcGF0aA0KIMKgIDEyMTEgMS44NS4xL2xvZy5kb19pbnN0YWxsLkNvbXBpbGlu
Zy5maXgtd2l0aC1lbWFjcy5Db21waWxpbmcuc2VkLXBhdGgNCiDCoCAyMTAzIDEuODYvbG9n
LmRvX2luc3RhbGwuQ29tcGlsaW5nLmZpeC13aXRoLWVtYWNzLkNvbXBpbGluZy5zZWQtcGF0
aA0KDQpEaWZmIGhlcmU6DQpodHRwczovL3d3dy5kaWZmY2hlY2tlci5jb20vaGR1UVlmbXEv
DQoNCmluIGNhc2UgYW55b25lIGlzIGludGVyZXN0ZWQgaW4gdGhlIGxvd2VyIGxldmVsIGJ1
aWxkIHZpZXcuDQoNCg0KDQoxKSBkaWZmIC11IGFuZCBzZGlmZiBvZiBoaWdoIGxldmVsIENP
TVBJTEV8QnVpbGRpbmcNCg0K4pymIOKdryBkaWZmIC11IDEuOCovQ09NUElMRS1CdWlsZGlu
Zw0KLS0tIDEuODUuMS9DT01QSUxFLUJ1aWxkaW5nwqDCoMKgIDIwMjUtMDYtMDMgMTQ6MTE6
MzQuODM4MjEyMTQ2IC0wNDAwDQorKysgMS44Ni9DT01QSUxFLUJ1aWxkaW5nwqDCoMKgIDIw
MjUtMDYtMDMgMTQ6MTE6NDQuOTk3MjA2NjEzIC0wNDAwDQpAQCAtMiwxOCArMiwzNiBAQA0K
IMKgQnVpbGRpbmcgYm9vdHN0cmFwDQogwqBCdWlsZGluZyBzdGFnZTAgbGlicmFyeSBhcnRp
ZmFjdHMNCiDCoEJ1aWxkaW5nIGNvbXBpbGVyIGFydGlmYWN0cw0KK0J1aWxkaW5nIHN0YWdl
MCB0b29sIHdhc20tY29tcG9uZW50LWxkDQorQnVpbGRpbmcgdG9vbCBsbHZtLWJpdGNvZGUt
bGlua2VyDQogwqBCdWlsZGluZyBzdGFnZTEgbGlicmFyeSBhcnRpZmFjdHMNCiDCoEJ1aWxk
aW5nIGNvbXBpbGVyIGFydGlmYWN0cw0KK0J1aWxkaW5nIHN0YWdlMSB0b29sIHdhc20tY29t
cG9uZW50LWxkDQorQnVpbGRpbmcgdG9vbCBsbHZtLWJpdGNvZGUtbGlua2VyDQogwqBCdWls
ZGluZyBzdGFnZTEgbGlicmFyeSBhcnRpZmFjdHMNCiDCoEJ1aWxkaW5nIHN0YWdlMCB0b29s
IHJ1c3QtaW5zdGFsbGVyDQogwqBCdWlsZGluZyBjb21waWxlciBhcnRpZmFjdHMNCitCdWls
ZGluZyBzdGFnZTEgdG9vbCB3YXNtLWNvbXBvbmVudC1sZA0KK0J1aWxkaW5nIHRvb2wgbGx2
bS1iaXRjb2RlLWxpbmtlcg0KIMKgQnVpbGRpbmcgdG9vbCBydXN0ZG9jDQorQnVpbGRpbmcg
dG9vbCBydXN0LWFuYWx5emVyLXByb2MtbWFjcm8tc3J2DQorQnVpbGRpbmcgc3RhZ2UwIHRv
b2wgZ2VuZXJhdGUtY29weXJpZ2h0DQorQnVpbGRpbmcgdG9vbCBjYXJnbw0KK0J1aWxkaW5n
IHRvb2wgcnVzdC1hbmFseXplcg0KK0J1aWxkaW5nIHRvb2wgcnVzdGZtdA0KK0J1aWxkaW5n
IHRvb2wgY2FyZ28tZm10DQorQnVpbGRpbmcgdG9vbCBjbGlwcHktZHJpdmVyDQorQnVpbGRp
bmcgdG9vbCBjYXJnby1jbGlwcHkNCiDCoENPTVBJTEUgcnVzdCBpbnN0YWxsIGNsaXBweQ0K
IMKgQnVpbGRpbmcgYm9vdHN0cmFwDQogwqBCdWlsZGluZyBzdGFnZTAgbGlicmFyeSBhcnRp
ZmFjdHMNCiDCoEJ1aWxkaW5nIGNvbXBpbGVyIGFydGlmYWN0cw0KK0J1aWxkaW5nIHN0YWdl
MCB0b29sIHdhc20tY29tcG9uZW50LWxkDQorQnVpbGRpbmcgdG9vbCBsbHZtLWJpdGNvZGUt
bGlua2VyDQogwqBCdWlsZGluZyBzdGFnZTEgbGlicmFyeSBhcnRpZmFjdHMNCiDCoEJ1aWxk
aW5nIGNvbXBpbGVyIGFydGlmYWN0cw0KK0J1aWxkaW5nIHN0YWdlMSB0b29sIHdhc20tY29t
cG9uZW50LWxkDQorQnVpbGRpbmcgdG9vbCBsbHZtLWJpdGNvZGUtbGlua2VyDQogwqBCdWls
ZGluZyBzdGFnZTEgbGlicmFyeSBhcnRpZmFjdHMNCiDCoEJ1aWxkaW5nIGNvbXBpbGVyIGFy
dGlmYWN0cw0KIMKgQnVpbGRpbmcgdG9vbCBjbGlwcHktZHJpdmVyDQpAQCAtMjMsOCArNDEs
MTIgQEANCiDCoEJ1aWxkaW5nIGJvb3RzdHJhcA0KIMKgQnVpbGRpbmcgc3RhZ2UwIGxpYnJh
cnkgYXJ0aWZhY3RzDQogwqBCdWlsZGluZyBjb21waWxlciBhcnRpZmFjdHMNCitCdWlsZGlu
ZyBzdGFnZTAgdG9vbCB3YXNtLWNvbXBvbmVudC1sZA0KK0J1aWxkaW5nIHRvb2wgbGx2bS1i
aXRjb2RlLWxpbmtlcg0KIMKgQnVpbGRpbmcgc3RhZ2UxIGxpYnJhcnkgYXJ0aWZhY3RzDQog
wqBCdWlsZGluZyBjb21waWxlciBhcnRpZmFjdHMNCitCdWlsZGluZyBzdGFnZTEgdG9vbCB3
YXNtLWNvbXBvbmVudC1sZA0KK0J1aWxkaW5nIHRvb2wgbGx2bS1iaXRjb2RlLWxpbmtlcg0K
IMKgQnVpbGRpbmcgc3RhZ2UxIGxpYnJhcnkgYXJ0aWZhY3RzDQogwqBCdWlsZGluZyBjb21w
aWxlciBhcnRpZmFjdHMNCiDCoEJ1aWxkaW5nIHRvb2wgcnVzdGZtdA0KDQrinKYg4p2vIHNk
aWZmIDEuOCovQ09NUElMRS1CdWlsZGluZw0KQ09NUElMRSBydXN0IGluc3RhbGzCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIENPTVBJTEUgcnVzdCBp
bnN0YWxsDQpCdWlsZGluZyBib290c3RyYXDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIEJ1aWxkaW5nIGJvb3RzdHJhcA0KQnVpbGRpbmcgc3RhZ2Uw
IGxpYnJhcnkgYXJ0aWZhY3RzwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEJ1aWxk
aW5nIHN0YWdlMCBsaWJyYXJ5IA0KYXJ0aWZhY3RzDQpCdWlsZGluZyBjb21waWxlciBhcnRp
ZmFjdHPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBCdWlsZGluZyBj
b21waWxlciBhcnRpZmFjdHMNCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPsKgwqDCoCBCdWlsZGluZyBzdGFn
ZTAgdG9vbCANCndhc20tY29tcG9uZW50LWxkDQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgID7CoMKgwqAgQnVp
bGRpbmcgdG9vbCBsbHZtLWJpdGNvZGUtbGlua2VyDQpCdWlsZGluZyBzdGFnZTEgbGlicmFy
eSBhcnRpZmFjdHPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQnVpbGRpbmcgc3Rh
Z2UxIGxpYnJhcnkgDQphcnRpZmFjdHMNCkJ1aWxkaW5nIGNvbXBpbGVyIGFydGlmYWN0c8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEJ1aWxkaW5nIGNvbXBpbGVy
IGFydGlmYWN0cw0KIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA+wqDCoMKgIEJ1aWxkaW5nIHN0YWdlMSB0b29s
IA0Kd2FzbS1jb21wb25lbnQtbGQNCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPsKgwqDCoCBCdWlsZGluZyB0
b29sIGxsdm0tYml0Y29kZS1saW5rZXINCkJ1aWxkaW5nIHN0YWdlMSBsaWJyYXJ5IGFydGlm
YWN0c8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBCdWlsZGluZyBzdGFnZTEgbGli
cmFyeSANCmFydGlmYWN0cw0KQnVpbGRpbmcgc3RhZ2UwIHRvb2wgcnVzdC1pbnN0YWxsZXLC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQnVpbGRpbmcgc3RhZ2UwIHRvb2wgDQpy
dXN0LWluc3RhbGxlcg0KQnVpbGRpbmcgY29tcGlsZXIgYXJ0aWZhY3RzwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQnVpbGRpbmcgY29tcGlsZXIgYXJ0aWZhY3Rz
DQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgID7CoMKgwqAgQnVpbGRpbmcgc3RhZ2UxIHRvb2wgDQp3YXNtLWNv
bXBvbmVudC1sZA0KIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA+wqDCoMKgIEJ1aWxkaW5nIHRvb2wgbGx2bS1i
aXRjb2RlLWxpbmtlcg0KQnVpbGRpbmcgdG9vbCBydXN0ZG9jwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBCdWlsZGluZyB0b29sIHJ1c3Rkb2MNCiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgPsKgwqDCoCBCdWlsZGluZyB0b29sIA0KcnVzdC1hbmFseXplci1wcm9j
LW1hY3JvLXNydg0KIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA+wqDCoMKgIEJ1aWxkaW5nIHN0YWdlMCB0b29s
IA0KZ2VuZXJhdGUtY29weXJpZ2h0DQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgID7CoMKgwqAgQnVpbGRpbmcg
dG9vbCBjYXJnbw0KIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA+wqDCoMKgIEJ1aWxkaW5nIHRvb2wgcnVzdC1h
bmFseXplcg0KIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA+wqDCoMKgIEJ1aWxkaW5nIHRvb2wgcnVzdGZtdA0K
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCA+wqDCoMKgIEJ1aWxkaW5nIHRvb2wgY2FyZ28tZm10DQogwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgID7CoMKgwqAgQnVpbGRpbmcgdG9vbCBjbGlwcHktZHJpdmVyDQogwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgID7CoMKgwqAgQnVpbGRpbmcgdG9vbCBjYXJnby1jbGlwcHkNCkNPTVBJTEUgcnVzdCBp
bnN0YWxsIGNsaXBwecKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIENP
TVBJTEUgcnVzdCBpbnN0YWxsIGNsaXBweQ0KQnVpbGRpbmcgYm9vdHN0cmFwwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBCdWlsZGluZyBib290c3Ry
YXANCkJ1aWxkaW5nIHN0YWdlMCBsaWJyYXJ5IGFydGlmYWN0c8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBCdWlsZGluZyBzdGFnZTAgbGlicmFyeSANCmFydGlmYWN0cw0KQnVp
bGRpbmcgY29tcGlsZXIgYXJ0aWZhY3RzwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgQnVpbGRpbmcgY29tcGlsZXIgYXJ0aWZhY3RzDQogwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgID7C
oMKgwqAgQnVpbGRpbmcgc3RhZ2UwIHRvb2wgDQp3YXNtLWNvbXBvbmVudC1sZA0KIMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCA+wqDCoMKgIEJ1aWxkaW5nIHRvb2wgbGx2bS1iaXRjb2RlLWxpbmtlcg0KQnVp
bGRpbmcgc3RhZ2UxIGxpYnJhcnkgYXJ0aWZhY3RzwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIEJ1aWxkaW5nIHN0YWdlMSBsaWJyYXJ5IA0KYXJ0aWZhY3RzDQpCdWlsZGluZyBj
b21waWxlciBhcnRpZmFjdHPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBCdWlsZGluZyBjb21waWxlciBhcnRpZmFjdHMNCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPsKgwqDCoCBC
dWlsZGluZyBzdGFnZTEgdG9vbCANCndhc20tY29tcG9uZW50LWxkDQogwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ID7CoMKgwqAgQnVpbGRpbmcgdG9vbCBsbHZtLWJpdGNvZGUtbGlua2VyDQpCdWlsZGluZyBz
dGFnZTEgbGlicmFyeSBhcnRpZmFjdHPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
QnVpbGRpbmcgc3RhZ2UxIGxpYnJhcnkgDQphcnRpZmFjdHMNCkJ1aWxkaW5nIGNvbXBpbGVy
IGFydGlmYWN0c8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEJ1aWxk
aW5nIGNvbXBpbGVyIGFydGlmYWN0cw0KQnVpbGRpbmcgdG9vbCBjbGlwcHktZHJpdmVywqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQnVpbGRpbmcgdG9vbCBjbGlw
cHktZHJpdmVyDQpCdWlsZGluZyB0b29sIGNhcmdvLWNsaXBwecKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIEJ1aWxkaW5nIHRvb2wgY2FyZ28tY2xpcHB5DQpCdWls
ZGluZyBzdGFnZTAgdG9vbCBydXN0LWluc3RhbGxlcsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBCdWlsZGluZyBzdGFnZTAgdG9vbCANCnJ1c3QtaW5zdGFsbGVyDQpDT01QSUxF
IHJ1c3QgaW5zdGFsbCBydXN0Zm10wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgQ09NUElMRSBydXN0IGluc3RhbGwgcnVzdGZtdA0KQnVpbGRpbmcgYm9vdHN0cmFw
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBCdWlsZGlu
ZyBib290c3RyYXANCkJ1aWxkaW5nIHN0YWdlMCBsaWJyYXJ5IGFydGlmYWN0c8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBCdWlsZGluZyBzdGFnZTAgbGlicmFyeSANCmFydGlm
YWN0cw0KQnVpbGRpbmcgY29tcGlsZXIgYXJ0aWZhY3RzwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgQnVpbGRpbmcgY29tcGlsZXIgYXJ0aWZhY3RzDQogwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgID7CoMKgwqAgQnVpbGRpbmcgc3RhZ2UwIHRvb2wgDQp3YXNtLWNvbXBvbmVudC1s
ZA0KIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCA+wqDCoMKgIEJ1aWxkaW5nIHRvb2wgbGx2bS1iaXRjb2RlLWxp
bmtlcg0KQnVpbGRpbmcgc3RhZ2UxIGxpYnJhcnkgYXJ0aWZhY3RzwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIEJ1aWxkaW5nIHN0YWdlMSBsaWJyYXJ5IA0KYXJ0aWZhY3RzDQpC
dWlsZGluZyBjb21waWxlciBhcnRpZmFjdHPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBCdWlsZGluZyBjb21waWxlciBhcnRpZmFjdHMNCiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
PsKgwqDCoCBCdWlsZGluZyBzdGFnZTEgdG9vbCANCndhc20tY29tcG9uZW50LWxkDQogwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgID7CoMKgwqAgQnVpbGRpbmcgdG9vbCBsbHZtLWJpdGNvZGUtbGlua2VyDQpC
dWlsZGluZyBzdGFnZTEgbGlicmFyeSBhcnRpZmFjdHPCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgQnVpbGRpbmcgc3RhZ2UxIGxpYnJhcnkgDQphcnRpZmFjdHMNCkJ1aWxkaW5n
IGNvbXBpbGVyIGFydGlmYWN0c8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIEJ1aWxkaW5nIGNvbXBpbGVyIGFydGlmYWN0cw0KQnVpbGRpbmcgdG9vbCBydXN0Zm10
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBCdWlsZGlu
ZyB0b29sIHJ1c3RmbXQNCkJ1aWxkaW5nIHRvb2wgY2FyZ28tZm10wqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBCdWlsZGluZyB0b29sIGNhcmdvLWZt
dA0KQnVpbGRpbmcgc3RhZ2UwIHRvb2wgcnVzdC1pbnN0YWxsZXLCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgQnVpbGRpbmcgc3RhZ2UwIHRvb2wgDQpydXN0LWluc3RhbGxlcg0K
DQo+DQo+ICAgICAgICAgUmVnYXJkcywNCj4gICAgICAgICBZYXNoDQo+DQo+DQo+ICAgICBI
aSBZYXNoDQo+DQo+DQo+ICAgICBUaGF0J3MgZ29vZCBwcm9ncmVzcy4gV2UnbGwgbmVlZCB0
byB0aGluayBhYm91dCB3aGF0LCBpdCBhbnl0aGluZywNCj4gICAgIHdlJ3JlIG1pc3Npbmcg
Ynkgbm90IGJ1aWxkaW5nIHJ1c3QtbGxkLiBXZSBzaG91bGQgcnVuIHNvbWUgdGVzdHMNCj4g
ICAgIHRvIGNvbXBhcmUgdGhlIGxpbmsgdGltZXMgYnV0IHRoYXQgY2FuIGxpa2VseSB3YWl0
IHVudGlsIGFmdGVyIHdlDQo+ICAgICBnZXQgdGhlIHVwZGF0ZSBtZXJnZWQuDQo+DQo+DQo+
IFRob3VnaCB0aGUgaW50ZXJuZXQgaGFzIHNvbWUgaW5mb3JtYXRpb24gb24gbGxkIGltcHJv
dmVtZW50cyBoYXZpbmcgDQo+IHRoaXMgaW4gT0UgY29udGV4dCB3aWxsIGJlIHZhbHVhYmxl
Lg0KPiBJIGFsc28gdGhpbmsgZGlzYWJsaW5nIGxsZCBpcyBnb2luZyB0byBnaXZlIHVzIHNv
bWUgcmVwcmlldmUuIEFzIG1vcmUgDQo+IHRhcmdldHMgaW4gcnVzdCBzZWVtIHRvIHVzZSBp
dCBieSBkZWZhdWx0IHdlIG5lZWQgdG8gY29uc2lkZXIgdGhhdCB3ZSANCj4gZG8gbm90IHN0
YXJ0IGRpc2FibGluZyBkZWZhdWx0cyBhbmQgd2VhciBvZmYgZnJvbSB1cHN0cmVhbS4NCj4N
Cj4gICAgIFJlbWFpbmluZyBjb25jZXJuczoNCj4NCj4gICAgIDEuIFNpZ25pZmljYW50IGlu
Y3JlYXNlIGluIEZTIHVzYWdlLCBjb21waWxlIHRpbWUuIEhhdmUgeW91IGxvb2tlZA0KPiAg
ICAgaW50byB3aHkgdGhlcmUncyBzdGlsbCBzdWNoIGEgc2lnbmlmaWNhbnQgaW5jcmVhc2U/
DQo+DQo+ICAgICAyLsKgwqAqIEVuYWJsZSBJTkhJQklUX1BBQ0tBR0VfREVCVUdfU1BMSVQv
U1RSSVAgdG8gZml4IFFBIHN0cmlwcGluZw0KPiAgICAgZXJyb3JzLiBGaXhlczogRVJST1I6
IHJ1c3QtMS44Ni4wLXIwIGRvX3BhY2thZ2U6IFFBIElzc3VlOiBGaWxlDQo+ICAgICAnL3Vz
ci9saWIvcnVzdGxpYi94ODZfNjQtcG9reS1saW51eC1nbnUvYmluL3dhc20tY29tcG9uZW50
LWxkJw0KPiAgICAgZnJvbSBydXN0IHdhcyBhbHJlYWR5IHN0cmlwcGVkLCB0aGlzIHdpbGwg
cHJldmVudCBmdXR1cmUNCj4gICAgIGRlYnVnZ2luZyEgW2FscmVhZHktc3RyaXBwZWRdDQo+
DQo+DQo+ICAgICBEbyB3ZSB1c2UgdGhpcyBjb21wb25lbnQ/IElzIGl0IG5ldz8gV2h5IGlz
IGl0IHByb2R1Y2VkIHdpdGhvdXQNCj4gICAgIGRlYnVnIHN5bWJvbHM/DQo+DQo+DQo+ICAg
ICBJJ2xsIHRha2UgYSBtb3JlIGNhcmVmdWwgbG9vayBhdCB0aGUgY29tbWl0IGNvZGUgY2hh
bmdlcyBvbmNlIHdlDQo+ICAgICBoYXZlIGFuc3dlcnMgdG8gdGhlc2UgcXVlc3Rpb25zLg0K
Pg0KPg0KPiAgICAgVGhhbmtzIGZvciB5b3VyIGhhcmQgd29yay4NCj4gICAgIEFsbW9zdCBk
b25lIHRoaXMgdXBncmFkZSBob3BlZnVsbHkuDQo+DQo+ICAgICBSYW5keQ0KPg0KPj4gICAg
ICAgICBBbGV4DQo+DQo+ICAgICAgICAgLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gICAg
ICAgICBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91
cC4NCj4gICAgICAgICBWaWV3L1JlcGx5IE9ubGluZSAoIzIxNzcxNCk6DQo+ICAgICAgICAg
aHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVz
c2FnZS8yMTc3MTQNCj4gICAgICAgICA8aHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0
dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3Nh
Z2UvMjE3NzE0X187ISFBanZlWWR3OEV2USFlRmJFcm91eFdlXzhzRUVWSTFrcllKOG1odXYt
cklycnZMRWs3cllwMlplQ0JZRHBNbXNWc055YThteXhpTXl3YU9GTU10Ql9fMFl2WTdvV0tS
UXpfQSQ+DQo+ICAgICAgICAgTXV0ZSBUaGlzIFRvcGljOg0KPiAgICAgICAgIGh0dHBzOi8v
bGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC8xMTMyNjgwMDkvOTUzMzk5DQo+ICAgICAgICAg
PGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2xpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcvbXQvMTEzMjY4MDA5Lzk1MzM5OV9fOyEhQWp2ZVlkdzhFdlEhZUZiRXJvdXhXZV84
c0VFVkkxa3JZSjhtaHV2LXJJcnJ2TEVrN3JZcDJaZUNCWURwTW1zVnNOeWE4bXl4aU15d2FP
Rk1NdEJfXzBZdlk3cFdSel9zQkEkPg0KPiAgICAgICAgIEdyb3VwIE93bmVyOiBvcGVuZW1i
ZWRkZWQtY29yZStvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ICAgICAgICAgPG1h
aWx0bzpvcGVuZW1iZWRkZWQtY29yZSUyQm93bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
DQo+ICAgICAgICAgVW5zdWJzY3JpYmU6DQo+ICAgICAgICAgaHR0cHM6Ly9saXN0cy5vcGVu
ZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvdW5zdWINCj4gICAgICAgICA8aHR0
cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zy9nL29wZW5lbWJlZGRlZC1jb3JlL3Vuc3ViX187ISFBanZlWWR3OEV2USFlRmJFcm91eFdl
XzhzRUVWSTFrcllKOG1odXYtcklycnZMRWs3cllwMlplQ0JZRHBNbXNWc055YThteXhpTXl3
YU9GTU10Ql9fMFl2WTdyeWVoZUlrZyQ+DQo+ICAgICAgICAgW3J3bWFjbGVvZEBnbWFpbC5j
b21dDQo+ICAgICAgICAgLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4NCg0KLS0gDQojIFJh
bmR5IE1hY0xlb2QNCiMgV2luZCBSaXZlciBMaW51eA0K
--------------Km1642fcrWXGnowICzRIQVar
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 553BmXSN021780

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2025-06-02 1:09 p.m., Khem Raj
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1spgaYyyYOs633Lr_0EMq=3Dvm=
ixOXLDa4Q2ivb9PJy0BY8A@mail.gmail.com">
     =20
      <div dir=3D"ltr">
        <div dir=3D"ltr"><br>
        </div>
        <br>
        <div class=3D"gmail_quote gmail_quote_container">
          <div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 2, 2025 at
            6:03=E2=80=AFAM Randy MacLeod &lt;<a href=3D"mailto:rwmacleod=
@gmail.com" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">rwma=
cleod@gmail.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div dir=3D"auto">
              <div dir=3D"auto">Hi Yash,</div>
              <div dir=3D"auto"><br>
              </div>
              <div dir=3D"auto"><br>
              </div>
              <div class=3D"gmail_quote" dir=3D"auto">
                <div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 2, 2025=
,
                  07:15 Yash Shinde via <a href=3D"https://urldefense.com=
/v3/__http://lists.openembedded.org__;!!AjveYdw8EvQ!eFbErouxWe_8sEEVI1krY=
J8mhuv-rIrrvLEk7rYp2ZeCBYDpMmsVsNya8myxiMywaOFMMtB__0YvY7rtMhcpAg$" targe=
t=3D"_blank" moz-do-not-send=3D"true">lists.openembedded.org</a>
                  &lt;Yash.Shinde=3D<a href=3D"mailto:windriver.com@lists=
.openembedded.org" target=3D"_blank" moz-do-not-send=3D"true" class=3D"mo=
z-txt-link-freetext">windriver.com@lists.openembedded.org</a>&gt;
                  wrote:<br>
                </div>
                <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                  <div>
                    <p><br>
                    </p>
                    <div>On 30-05-2025 18:45, Alexander Kanavin wrote:<br=
>
                    </div>
                    <blockquote type=3D"cite">
                      <pre>
On Fri, 30 May 2025 at 14:42, Yash Shinde <a class=3D"moz-txt-link-rfc239=
6E" href=3D"mailto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.c=
om&gt;</a> wrote:

</pre>
                      <blockquote type=3D"cite">
                        <pre>As Khem mentioned, setting lld =3D false in =
config.toml doesn't build LLD.
Furthermore, using &quot;use-lld =3D false&quot; ensures that LLD is not =
used as the
default linker,
causing the build to fall back to the system's default linker. This
restores the earlier behavior.
Also, the package QA error for rust-lld is not seen with this.
</pre>
                      </blockquote>
                      <pre>What about build times though? Are they back t=
o what they were?

</pre>
                    </blockquote>
                    <p>The build time differences on my machine are as
                      follows:<br>
                    </p>
                    <table cellpadding=3D"2" cellspacing=3D"2" border=3D"=
1" width=3D"877" height=3D"151">
                      <tbody>
                        <tr>
                          <td valign=3D"top">rust version<br>
                          </td>
                          <td valign=3D"top">rust upstream builds<br>
                          </td>
                          <td valign=3D"top">rust-native (yocto build)<br=
>
                          </td>
                          <td valign=3D"top">rust target (yocto build)<br=
>
                          </td>
                        </tr>
                        <tr>
                          <td valign=3D"top">v1.85.1<br>
                          </td>
                          <td valign=3D"top">10 mins<br>
                          </td>
                          <td valign=3D"top">20 mins<br>
                          </td>
                          <td valign=3D"top">33 mins<br>
                          </td>
                        </tr>
                        <tr>
                          <td valign=3D"top">v1.86.0 <br>
                          </td>
                          <td valign=3D"top">22 mins (with &quot;lld&quot=
; and
                            &quot;use-lld&quot; set to &quot;false&quot;)=
<br>
                            30 mins (with default settings i.e lld =3D
                            true)<br>
                            <br>
                          </td>
                          <td valign=3D"top">31 mins (with &quot;lld&quot=
; and<br>
                            &quot;use-lld&quot; set to &quot;false&quot;)=
</td>
                          <td valign=3D"top">43 mins (with &quot;lld&quot=
; and<br>
                            &quot;use-lld&quot; set to &quot;false&quot;)=
</td>
                        </tr>
                      </tbody>
                    </table>
                    <p>Note: The machine being used is a shared resource
                      and fairly busy. Build times may differ due to
                      other user's builds.<br>
                      <br>
                      <br>
                      The FS usage is as follows:<br>
                    </p>
                    <table cellpadding=3D"2" cellspacing=3D"2" border=3D"=
1" width=3D"955" height=3D"91">
                      <tbody>
                        <tr>
                          <td valign=3D"top">Rust version<br>
                          </td>
                          <td valign=3D"top">rust upstream builds<br>
                          </td>
                          <td valign=3D"top">Yocto rust builds
                            (build/tmp/work/core2-64-poky-linux/rust/1.86=
.0/rustc-1.86.0-src/build)<br>
                          </td>
                        </tr>
                        <tr>
                          <td valign=3D"top">v1.85.1<br>
                          </td>
                          <td valign=3D"top">4.6 G<br>
                          </td>
                          <td valign=3D"top">6.3 G<br>
                          </td>
                        </tr>
                        <tr>
                          <td valign=3D"top">v1.86.0<br>
                          </td>
                          <td valign=3D"top">15 G<br>
                          </td>
                          <td valign=3D"top">8.8 G<br>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                    <p>The latest rust v1.86.0 upgrade changes are
                      available at:<br>
                      <a href=3D"https://urldefense.com/v3/__https://git.=
yoctoproject.org/poky-contrib/log/?h=3Dharish*rust_1.86.0_v2__;Lw!!AjveYd=
w8EvQ!eFbErouxWe_8sEEVI1krYJ8mhuv-rIrrvLEk7rYp2ZeCBYDpMmsVsNya8myxiMywaOF=
MMtB__0YvY7qkai0dkw$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-sen=
d=3D"true">https://git.yoctoproject.org/poky-contrib/log/?h=3Dharish/rust=
_1.86.0_v2</a><br>
                    </p>
                  </div>
                </blockquote>
              </div>
            </div>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>FS bloat is partly due to: <br>
      &nbsp;&nbsp; 1. we forgot to remove cargo from rust pkg,<br>
      &nbsp;&nbsp; 2. rust-analyzer added in 1.86, - do we need it?<br>
      &nbsp;&nbsp; 3. wasm-component-ld&nbsp; built - do we need it?<br>
      &nbsp;&nbsp; 4. llvm-bitcode-linker&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b=
uilt - do we need it?<br>
    </p>
    <p>For now, drop the things we don't need by changing config.toml.<br=
>
      We can consider adding them as disabled by default
      PACKAGECONFIG[feature] options later.<br>
      <br>
      This is from looking at the packages-split contents and a filtered
      log.do_install. <br>
      Details and more info below.<br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <p><br>
      I expect that rust-analyzer is also the primary reason for the
      build time increase but hopefully Yash can confirm.<br>
      <br>
    </p>
    <p>I dug through the log files a bit which I don't do often these
      days so maybe there's a better way to get<br>
      this info.</p>
    <p>=E2=9D=AF rg&nbsp; &quot;^COMPILE|^Building&quot; 1.85.1/log.do_in=
stall | sed 's/
      (.*)$//'&nbsp; &gt; 1.85.1/COMPILE-Building<br>
      =E2=9D=AF rg&nbsp; &quot;^COMPILE|^Building&quot; 1.86/log.do_insta=
ll | sed 's/ (.*)$//'&nbsp;
      &gt; 1.86/COMPILE-Building<br>
      <br>
      <br>
      Diffs below (1).<br>
      <br>
      <br>
      Initially I was looking at log.do_install and filtering out noise
      using a combination of grep, sed, and <br>
      emacs macros of all things!<br>
      <br>
      I ended up reducing the log.do_install file length by an order of
      magnitude:<br>
      =E2=9D=AF wc -l */log.do_install<br>
      &nbsp;&nbsp; 13351 1.85.1/log.do_install<br>
      &nbsp;&nbsp; 22144 1.86/log.do_install<br>
    </p>
    <p>=E2=9D=AF wc -l
      */log.do_install.Compiling.fix-with-emacs.Compiling.sed-path<br>
      &nbsp; 1211
      1.85.1/log.do_install.Compiling.fix-with-emacs.Compiling.sed-path<b=
r>
      &nbsp; 2103
      1.86/log.do_install.Compiling.fix-with-emacs.Compiling.sed-path<br>
    </p>
    <p>Diff here:<br>
      <a class=3D"moz-txt-link-freetext" href=3D"https://www.diffchecker.=
com/hduQYfmq/">https://www.diffchecker.com/hduQYfmq/</a></p>
    <p>in case anyone is interested in the lower level build view.<br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <p>1) diff -u and sdiff of high level COMPILE|Building<br>
      <br>
      =E2=9C=A6 =E2=9D=AF diff -u 1.8*/COMPILE-Building <br>
      --- 1.85.1/COMPILE-Building&nbsp;&nbsp;&nbsp; 2025-06-03 14:11:34.8=
38212146 -0400<br>
      +++ 1.86/COMPILE-Building&nbsp;&nbsp;&nbsp; 2025-06-03 14:11:44.997=
206613 -0400<br>
      @@ -2,18 +2,36 @@<br>
      &nbsp;Building bootstrap<br>
      &nbsp;Building stage0 library artifacts<br>
      &nbsp;Building compiler artifacts<br>
      +Building stage0 tool wasm-component-ld<br>
      +Building tool llvm-bitcode-linker<br>
      &nbsp;Building stage1 library artifacts<br>
      &nbsp;Building compiler artifacts<br>
      +Building stage1 tool wasm-component-ld<br>
      +Building tool llvm-bitcode-linker<br>
      &nbsp;Building stage1 library artifacts<br>
      &nbsp;Building stage0 tool rust-installer<br>
      &nbsp;Building compiler artifacts<br>
      +Building stage1 tool wasm-component-ld<br>
      +Building tool llvm-bitcode-linker<br>
      &nbsp;Building tool rustdoc<br>
      +Building tool rust-analyzer-proc-macro-srv<br>
      +Building stage0 tool generate-copyright<br>
      +Building tool cargo<br>
      +Building tool rust-analyzer<br>
      +Building tool rustfmt<br>
      +Building tool cargo-fmt<br>
      +Building tool clippy-driver<br>
      +Building tool cargo-clippy<br>
      &nbsp;COMPILE rust install clippy<br>
      &nbsp;Building bootstrap<br>
      &nbsp;Building stage0 library artifacts<br>
      &nbsp;Building compiler artifacts<br>
      +Building stage0 tool wasm-component-ld<br>
      +Building tool llvm-bitcode-linker<br>
      &nbsp;Building stage1 library artifacts<br>
      &nbsp;Building compiler artifacts<br>
      +Building stage1 tool wasm-component-ld<br>
      +Building tool llvm-bitcode-linker<br>
      &nbsp;Building stage1 library artifacts<br>
      &nbsp;Building compiler artifacts<br>
      &nbsp;Building tool clippy-driver<br>
      @@ -23,8 +41,12 @@<br>
      &nbsp;Building bootstrap<br>
      &nbsp;Building stage0 library artifacts<br>
      &nbsp;Building compiler artifacts<br>
      +Building stage0 tool wasm-component-ld<br>
      +Building tool llvm-bitcode-linker<br>
      &nbsp;Building stage1 library artifacts<br>
      &nbsp;Building compiler artifacts<br>
      +Building stage1 tool wasm-component-ld<br>
      +Building tool llvm-bitcode-linker<br>
      &nbsp;Building stage1 library artifacts<br>
      &nbsp;Building compiler artifacts<br>
      &nbsp;Building tool rustfmt<br>
      <br>
    </p>
    <p><font face=3D"monospace">=E2=9C=A6 =E2=9D=AF sdiff 1.8*/COMPILE-Bu=
ilding<br>
        COMPILE rust install&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; COMPILE rust install<br>
        Building bootstrap&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; Building bootstrap<br>
        Building stage0 library artifacts&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Building stage=
0
        library artifacts<br>
        Building compiler artifacts&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; Building compiler
        artifacts<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp;&n=
bsp;&nbsp; Building stage0 tool
        wasm-component-ld<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp;&n=
bsp;&nbsp; Building tool
        llvm-bitcode-linker<br>
        Building stage1 library artifacts&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Building stage=
1
        library artifacts<br>
        Building compiler artifacts&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; Building compiler
        artifacts<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp;&n=
bsp;&nbsp; Building stage1 tool
        wasm-component-ld<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp;&n=
bsp;&nbsp; Building tool
        llvm-bitcode-linker<br>
        Building stage1 library artifacts&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Building stage=
1
        library artifacts<br>
        Building stage0 tool rust-installer&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Building
        stage0 tool rust-installer<br>
        Building compiler artifacts&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; Building compiler
        artifacts<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp;&n=
bsp;&nbsp; Building stage1 tool
        wasm-component-ld<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp;&n=
bsp;&nbsp; Building tool
        llvm-bitcode-linker<br>
        Building tool rustdoc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; Building tool
        rustdoc<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp;&n=
bsp;&nbsp; Building tool
        rust-analyzer-proc-macro-srv<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp;&n=
bsp;&nbsp; Building stage0 tool
        generate-copyright<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp;&n=
bsp;&nbsp; Building tool cargo<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp;&n=
bsp;&nbsp; Building tool
        rust-analyzer<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp;&n=
bsp;&nbsp; Building tool rustfmt<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp;&n=
bsp;&nbsp; Building tool
        cargo-fmt<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp;&n=
bsp;&nbsp; Building tool
        clippy-driver<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp;&n=
bsp;&nbsp; Building tool
        cargo-clippy<br>
        COMPILE rust install clippy&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; COMPILE rust
        install clippy<br>
        Building bootstrap&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; Building bootstrap<br>
        Building stage0 library artifacts&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Building stage=
0
        library artifacts<br>
        Building compiler artifacts&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; Building compiler
        artifacts<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp;&n=
bsp;&nbsp; Building stage0 tool
        wasm-component-ld<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp;&n=
bsp;&nbsp; Building tool
        llvm-bitcode-linker<br>
        Building stage1 library artifacts&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Building stage=
1
        library artifacts<br>
        Building compiler artifacts&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; Building compiler
        artifacts<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp;&n=
bsp;&nbsp; Building stage1 tool
        wasm-component-ld<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp;&n=
bsp;&nbsp; Building tool
        llvm-bitcode-linker<br>
        Building stage1 library artifacts&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Building stage=
1
        library artifacts<br>
        Building compiler artifacts&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; Building compiler
        artifacts<br>
        Building tool clippy-driver&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; Building tool
        clippy-driver<br>
        Building tool cargo-clippy&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; Building tool
        cargo-clippy<br>
        Building stage0 tool rust-installer&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Building
        stage0 tool rust-installer<br>
        COMPILE rust install rustfmt&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; COMPILE rust
        install rustfmt<br>
        Building bootstrap&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; Building bootstrap<br>
        Building stage0 library artifacts&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Building stage=
0
        library artifacts<br>
        Building compiler artifacts&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; Building compiler
        artifacts<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp;&n=
bsp;&nbsp; Building stage0 tool
        wasm-component-ld<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp;&n=
bsp;&nbsp; Building tool
        llvm-bitcode-linker<br>
        Building stage1 library artifacts&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Building stage=
1
        library artifacts<br>
        Building compiler artifacts&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; Building compiler
        artifacts<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp;&n=
bsp;&nbsp; Building stage1 tool
        wasm-component-ld<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&nbsp;&n=
bsp;&nbsp; Building tool
        llvm-bitcode-linker<br>
        Building stage1 library artifacts&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Building stage=
1
        library artifacts<br>
        Building compiler artifacts&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; Building compiler
        artifacts<br>
        Building tool rustfmt&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; Building tool
        rustfmt<br>
        Building tool cargo-fmt&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; Building tool
        cargo-fmt<br>
        Building stage0 tool rust-installer&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Building
        stage0 tool rust-installer</font><br>
      <br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1spgaYyyYOs633Lr_0EMq=3Dvm=
ixOXLDa4Q2ivb9PJy0BY8A@mail.gmail.com">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote gmail_quote_container">
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div dir=3D"auto">
              <div class=3D"gmail_quote" dir=3D"auto">
                <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                  <div>
                    <p><br>
                      Regards,<br>
                      Yash<br>
                    </p>
                  </div>
                </blockquote>
              </div>
              <div dir=3D"auto"><br>
              </div>
              <div dir=3D"auto">
                <p>Hi Yash&nbsp;</p>
                <p><br>
                </p>
                <p>That's good progress. We'll need to think about what,
                  it anything, we're missing by not building rust-lld.
                  We should run some tests to compare the link times but
                  that can likely wait until after we get the update
                  merged.&nbsp;</p>
                <p><br>
                </p>
              </div>
            </div>
          </blockquote>
          <div>Though the internet has some information on lld
            improvements having this in OE context will be valuable.</div=
>
          <div>I also think disabling lld is going to give us some
            reprieve. As more targets in rust seem to use it by default
            we need to consider that we do not start disabling defaults
            and wear off from upstream.</div>
          <div>&nbsp;</div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div dir=3D"auto">
              <div dir=3D"auto">
                <p>Remaining concerns: </p>
                <p>&nbsp;</p>
                <p>1. Significant increase in FS usage, compile time.
                  Have you looked into why there's still such a
                  significant increase?</p>
                <p>2.&nbsp;&nbsp;* Enable INHIBIT_PACKAGE_DEBUG_SPLIT/STR=
IP to fix
                  QA stripping errors. Fixes: ERROR: rust-1.86.0-r0
                  do_package: QA Issue: File
                  '/usr/lib/rustlib/x86_64-poky-linux-gnu/bin/wasm-compon=
ent-ld'
                  from rust was already stripped, this will prevent
                  future debugging! [already-stripped]&nbsp;</p>
                <p><br>
                </p>
                <p>Do we use this component? Is it new? Why is it
                  produced without debug symbols?&nbsp;</p>
                <p><br>
                </p>
                <p>I'll take a more careful look at the commit code
                  changes once we have answers to these questions.</p>
              </div>
              <div dir=3D"auto"><br>
              </div>
              <div dir=3D"auto">Thanks for your hard work.&nbsp;</div>
              <div dir=3D"auto">Almost done this upgrade hopefully.</div>
              <div dir=3D"auto"><br>
              </div>
              <div dir=3D"auto">Randy</div>
              <div dir=3D"auto"><br>
              </div>
              <div class=3D"gmail_quote" dir=3D"auto">
                <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                  <div>
                    <p> </p>
                    <blockquote type=3D"cite">
                      <pre>Alex
</pre>
                    </blockquote>
                  </div>
                  <br>
                  -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
                  Links: You receive all messages sent to this group.<br>
                  View/Reply Online (#217714): <a href=3D"https://urldefe=
nse.com/v3/__https://lists.openembedded.org/g/openembedded-core/message/2=
17714__;!!AjveYdw8EvQ!eFbErouxWe_8sEEVI1krYJ8mhuv-rIrrvLEk7rYp2ZeCBYDpMms=
VsNya8myxiMywaOFMMtB__0YvY7oWKRQz_A$" rel=3D"noreferrer noreferrer" targe=
t=3D"_blank" moz-do-not-send=3D"true">https://lists.openembedded.org/g/op=
enembedded-core/message/217714</a><br>
                  Mute This Topic: <a href=3D"https://urldefense.com/v3/_=
_https://lists.openembedded.org/mt/113268009/953399__;!!AjveYdw8EvQ!eFbEr=
ouxWe_8sEEVI1krYJ8mhuv-rIrrvLEk7rYp2ZeCBYDpMmsVsNya8myxiMywaOFMMtB__0YvY7=
pWRz_sBA$" rel=3D"noreferrer noreferrer" target=3D"_blank" moz-do-not-sen=
d=3D"true">https://lists.openembedded.org/mt/113268009/953399</a><br>
                  Group Owner: <a href=3D"mailto:openembedded-core%2Bowne=
r@lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank" moz-do-not=
-send=3D"true">openembedded-core+owner@lists.openembedded.org</a><br>
                  Unsubscribe: <a href=3D"https://urldefense.com/v3/__htt=
ps://lists.openembedded.org/g/openembedded-core/unsub__;!!AjveYdw8EvQ!eFb=
ErouxWe_8sEEVI1krYJ8mhuv-rIrrvLEk7rYp2ZeCBYDpMmsVsNya8myxiMywaOFMMtB__0Yv=
Y7ryeheIkg$" rel=3D"noreferrer noreferrer" target=3D"_blank" moz-do-not-s=
end=3D"true">https://lists.openembedded.org/g/openembedded-core/unsub</a>
                  [<a href=3D"mailto:rwmacleod@gmail.com" rel=3D"noreferr=
er" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-free=
text">rwmacleod@gmail.com</a>]<br>
                  -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
                  <br>
                </blockquote>
              </div>
            </div>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------Km1642fcrWXGnowICzRIQVar--

