Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7363EC25B74
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 12:52:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.14972.1716555155604027419
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 May 2024 05:52:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=587415f07d=yash.shinde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44OBPCi5008174
	for <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 05:52:35 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yaa8q0t7k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 05:52:34 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 44OCqYk1028524;
	Fri, 24 May 2024 05:52:34 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yaa8q0t7j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 05:52:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DHK1uxrHc33LSB4RU4a+YzWf+NlzEbbcJM94wHB6hw7a2DTVnTB8gB5iDh24ihn4pW4VSQ7k9iZobwh05QSmo/TqzqTckizyjhWufYeAl20TWzo+adH6LGjSHqoIQ42l0RlSwGuGHbU4g6qprCWZjuiIBDUqJyjPrOwea6skXzOK09W602tRDCeM8kicy9Vjy8QOV+QTwGEcF8AgCwsJKrVNP9N4P/KwtJWGWcBCXHQ1ydinDYU1PwH+J2nEvaNteKQZOLlHguKOE9C8maBgaCJ4yKSlxylqfK29kK7c7wfpZOnQ10BkGqazI4d2RHTPgepd8q1w/DVKI74OioKA1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sMb10V1l6ZwoEO/8lEgxTBbsviVuKIIpI8oWvKG6oaA=;
 b=itBPExgAO1Is4haly9U6GdnLIuvICytE40niZeJzStnFbozgdlc44hVIdKekdKybs4e+8UnRp74Y+QCVWMhJXWIFXwxgvLTimcWDp0eWRJDZkPHXEGQpKeZHBUkObN3LLVMuLEt73lv9T9rwF+ySadss66cqXIuuQ1yZMUfiG2brFfcDafF++j8tKO8LzCL/5CZBHPmYhW5SWyEXROZM11GaLD7aJgzpyMKf4zMz9hj0VTNw7fpxPdlSawQajKXGzQKfbuOLm6nEGERQVS2MTzJ6MIyUESgankQwvOYwlYtDGOWzxMc1bES21y3DA9UhB3T6yOylbfaVq3Ut0nFfsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by CY5PR11MB6161.namprd11.prod.outlook.com (2603:10b6:930:2a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Fri, 24 May
 2024 12:52:31 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%6]) with mapi id 15.20.7611.016; Fri, 24 May 2024
 12:52:31 +0000
Content-Type: multipart/alternative;
 boundary="------------rEgonm0mK7301Ve04K0zcDi9"
Message-ID: <fc3febb8-190a-40b0-9783-594a5c9884a6@windriver.com>
Date: Fri, 24 May 2024 18:22:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Debugging rust oe-selftest failures
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, randy.macleod@windriver.com,
        "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>,
        Steve Sakoman <steve@sakoman.com>, alex.kiernan@gmail.com,
        openembedded-core@lists.openembedded.org
References: <CAO5Uq5Q4f4Q+3yR6JZcxhXOP_mpmyzJ0yYtO5SO1_6ZOwdHEzw@mail.gmail.com>
 <6447.1712221622103634934@lists.openembedded.org>
 <CAO5Uq5Qd63-mJWhQpdP28kXVtHWjk-607c_RK8xm2dshyfHWJw@mail.gmail.com>
 <a5b121fb-b530-4242-a786-1e7b54655ba9@windriver.com>
 <CANNYZj_gjybr8x2zxN5zSWQjoXRxHv43-vZW6ME_E7hhkqJVcg@mail.gmail.com>
 <533e019b57c5acd6ebb35163fb1794cd28166052.camel@rpsys.net>
 <CANNYZj_yRH35hb4UBVXQNeZ0CTteUu5-abGXL=itgF67yjj_VQ@mail.gmail.com>
 <0d334189-293b-4a11-846d-a0ffd96b2624@windriver.com>
 <17CFF314D55865EC.16299@lists.openembedded.org>
 <CANNYZj-SeRHU-JWCQ8wrVt2LCObB4aDmmz4icxSoYrBv=3KyVg@mail.gmail.com>
 <1714f7c2-b7b0-4fe4-8232-247f1df55a8f@windriver.com>
 <CANNYZj_YxWmOVzRYrY9biWkP7kmUsPfLbdVKTp7=njkQwWeckA@mail.gmail.com>
 <310e6d7e-bab4-4907-ae1c-af909de0df3f@windriver.com>
 <CANNYZj8wg42t7vKrtadb7N3ot2Xgo2R594XQRWemRpa3RXm+BQ@mail.gmail.com>
Content-Language: en-US
From: Yash Shinde <Yash.Shinde@windriver.com>
In-Reply-To: <CANNYZj8wg42t7vKrtadb7N3ot2Xgo2R594XQRWemRpa3RXm+BQ@mail.gmail.com>
X-ClientProxiedBy: PN2PR01CA0234.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::6) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|CY5PR11MB6161:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ad4c711-06f6-4b80-faba-08dc7bf05fd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?S0c2SkIrdURrVW5ndlRrMVlaQXJqMjE2dC95YWQrN1VBOG44L1g4cXB4dWlE?=
 =?utf-8?B?VzhUQWVQRXkzY0l3TE1vMVlMV3ZsT3oyb0hHalU3bnhIald3eFpZV0Y0YkZJ?=
 =?utf-8?B?YlU0cEJYS2hVZ09obEJMUG9ZSCs5bHdySmpiZ3pPVWgzZ3AxRERUY2VLU2NW?=
 =?utf-8?B?WjNlSjZzSyt0T2VLY1p6MUZyZ1UwUnRuYkdVbkFZaW9GVjA0cG9HaHJTUjNk?=
 =?utf-8?B?c082YVRYbTJEbWt6VGNRYXltOEZqbjh1STFPZDZBNlQ3eWhzd2lBOXhEajFJ?=
 =?utf-8?B?SlgxYlg2NERqNkQ3bERHdEJzRUo2bnhoRkRKUjR4MWcvNko3V1BRV2Jza050?=
 =?utf-8?B?T0lGZFBwWjZ0WGRhMDFwTjBnZnBZVERnQloyRmNKZXRMZlFqR0Z4TldWMjBB?=
 =?utf-8?B?Ujl5dURzaUlwUzhmREtSWmJFd0ZlQ1JVcWlZd0xOVm5aMUxHd0hRYkZXeHph?=
 =?utf-8?B?TlVscVF3am8yQU1CTFkxa29YQnFCTjh0WmtodEg1STBCS1RoRW1CaXZ4OTZL?=
 =?utf-8?B?NjdiaDNnb0gweDZKR0xmcTlMNkhQaER0THdkUXR3U2lhVGtzcTVRRmQyWTNi?=
 =?utf-8?B?cVF1Z3R2S0VwNVM4dEVUS1ZFaE92bDNCbENJbDFnNUxRd1BBY0NoeWlidnFJ?=
 =?utf-8?B?T1Z0dFJCa0x2WHdWa2V2TXgzMnZUVDZaaFg3L0tTRVB5eTUvcGZkREttbEFG?=
 =?utf-8?B?WEFFemxsOEkwUGNKSjUwQllGM1oxM01iZ0grYVl2ZEFhSFRPb3JrRHVkbkxt?=
 =?utf-8?B?ZnVIV2FKM0E5bndlTEo1RnQydG9mVWlNR2RYc2xEcTFnT25FZFdOT1lrVVkr?=
 =?utf-8?B?SkhIdXZkVFZ5SkJ5TisvdlRJbnBMQ0Q1a1NNcEV1dmNOVVJjTUpzSnR0RlMv?=
 =?utf-8?B?OEVnVzhQYzc1MzgzNytKVzdqem15a0ZqVXlXV0ZLcWdZa3hMMitUbFJmM2h6?=
 =?utf-8?B?QXgvdHI3cjlFRU5WN0F6cWY4L25hUktoSlF3a3ptNXB2VXgxOUtqSzhMSG9R?=
 =?utf-8?B?ZzkvaWdsTkhiVGhCVU1SSk0wZEtBTWlQaEh1Zm41VzF6MnltaklXdWJlV00x?=
 =?utf-8?B?bmtXVGpYODVLemZPanZQY1ZPMUF1Rk1ja2dXbEwxYmtlS0VQKzI5V0ZhWnJR?=
 =?utf-8?B?YWJleFVlS3lGSkFYWUVXdjRYVHdza3ZaUmtOS1hZZWNBZm9YcXpGMmhZcHpW?=
 =?utf-8?B?MXNjMTBxYjkrK0xqalozZ1ZDWk4ySWR5YUhUcXNnS3VmY0ZWUFV0Z25zMkwx?=
 =?utf-8?B?Tk9XcFV0NVBSRVUwT0dEUjFzRStUTjM3TWp2TWVOYmJndmxtMUpDT1FmUXVE?=
 =?utf-8?B?bDF0SmZ5ZWd4U2tLZ0twWVI2OXNIc3BJRVhRdkJHdWdUc1pvcUNmSTNCaVJF?=
 =?utf-8?B?TUliMVMyeFlockxzR2ZHRTU4cjVKWDRMK3ZXWUZQSmtjMkpSbWlMLzlJMHZE?=
 =?utf-8?B?VVBMR1BwQnJJOURoUHVjUThZTDhQczJCUkNWSU9SU1hLV3NhZWlYNnpiMWxC?=
 =?utf-8?B?QUdsalhyb2pIS2ZWbC9ZNEQyenNSWlkwTHpocnltRml5M1p6Qk1mS2ZIaDNh?=
 =?utf-8?B?eHlnWXBneDlXeGFTRlk0NXdXTWZCbE1ud2hZZ1BRNGtPMUZsUE5kRWZwZzFJ?=
 =?utf-8?B?NWF1V3F4dldTZGZmblg1Tlh1WmRaLzNTMi9jVjFXdlliYVAwSjhrNzkvYjRO?=
 =?utf-8?B?S2pnYTZpenBITWUyWlRVMUVKWHZadTVTc285RC92cjZ2OVRESGMrUG1nPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TG1Xc0I4QUtBSjk3RGR2MUc5ZGQ0T2JjRmZZWlhoYWxvY3VNQlQ2R2FGSUFq?=
 =?utf-8?B?N2VBVWN4cWQrZ3FTdUpaL0gvZDVmSGZsTThvajJ6ME0rZ1VHYU5RUFFkRUVh?=
 =?utf-8?B?RlVjeUZmeGVjZmdhRTNOaTNFallBVVdwY3VHNWZPdVlxQlRTSmd3Z1JLZldZ?=
 =?utf-8?B?U2ZnWXBJSlJLRmhzUTlYMWNLaGxRZXplUkZqcnhOUEFzSlFoQTBuNGIxTzJm?=
 =?utf-8?B?VEVuYjBMK2swVkIyeXplYmsxT2FBWmdUWSthWmtOY2VEMDI3RUxkM3E0cTcy?=
 =?utf-8?B?amdxOVByeDlIWk04ZlRYc2luNm1NOE1MMU5QclVSbnZUbEkyQ2U1dVFQSTVF?=
 =?utf-8?B?Zk15RmNKM3FqR01jUk5lVUxaR29mczJJMXZEQUYzVzZxd2NrNzFvSzJUZ3pu?=
 =?utf-8?B?N3ZLOUN0a0pMNEZ2M2ovWk82WFlVK2orN0pPRWZoUHA3UGdXVzNqa0ZudHVV?=
 =?utf-8?B?V0tIaStMUVI2b1o4eDh4bnJaa1ErVjQvdnpDcWZwQXd6bVRBSytPRlBLNVh1?=
 =?utf-8?B?MFE4a0Y3dHZRSlhDUG5xSTF5dEdxY0VJQjRuTFJnaXdDZ2cyaVd2NXRZYW1G?=
 =?utf-8?B?MVZJajl5R2dRVFFnNnViYlhkS2IvL3Jqc3dSZktEd1V1MFZnMUZNdnpYSjJC?=
 =?utf-8?B?WVU2N2Y0WHhnZmU0dEVpWlNNdkdGOTBpcnMvR2xXTDl4RkkyOXhlRFo4WkZp?=
 =?utf-8?B?LzlVVGhCTi94LzUwTFNiamVqdDVvZTE4akticGgvZDNrbXlNeW1yR3hidlIv?=
 =?utf-8?B?bkgxUTZpZGRVak82cmNTWFZCdzN2TzdYdHVzc0d3YTdZRENGSTlIZVcvMTVE?=
 =?utf-8?B?QlMxNnh0QUc0WFNrbmt1enBQend0RzBHQW9RR0hyUWZhdUE5T0xsRFh6TUhW?=
 =?utf-8?B?YWtBMGZCYVEyZlczUXFwbG8zWS84Q01FUmJxMVJjMVRGRFNaYnRIaDdHa0p5?=
 =?utf-8?B?S1RYNUdoMlhoOTBhbVN1VUQ0RFNnS0dJekhGaE5ITVBXeEwwdXdVcWE5K29Y?=
 =?utf-8?B?a1daT1BwZGR4cFk1ekRIZ2FlUW02aGhqcUpPMHdhOXczZFVZdE5PM01ZZjFx?=
 =?utf-8?B?UzdEZkd5Q1BVZkZ3UUtVdlRMQ2h2VS93SFJINjdCM1k5WjAvVlhlS2w5cEdx?=
 =?utf-8?B?ZEc1WnFLcG93OVNEOEJqSjE3eFNuMWpjMTV2L29KdVQ4LzlOZ2kzRFFuRzJK?=
 =?utf-8?B?TUhiRlVyQVErLzlWQXlvMFhXbzkxLytQdlQ1U0RZWW9HcTZUemNtMHRtOGpG?=
 =?utf-8?B?cGtHRWU2Z24zODlza3E2QVA2NmttS3RNYlpjdFNaOU9QeGh1UjRSV29zZllj?=
 =?utf-8?B?ZW5mSUQyRk5abFpNTnBhSUVtc2pLc2lDcG1pMGhrOHBlQytzMEJpeHE0N2dn?=
 =?utf-8?B?K3ZuckdoRFNCdThZK3YyQjJvT0gzRDY3L1huRlBxZjJpZFFIMjV5SGFMUjFH?=
 =?utf-8?B?ZmtJRTg3RThWRGJlRmRyOWhuNnFSNlFpTjZmZm1WNDFWc0JPZjI1em5JMTAz?=
 =?utf-8?B?dFVSMUZvSE1seERjRFhGY0NRT2R3U1BBeWZyQlphSmpvbE9ON2s1VVZmWGdh?=
 =?utf-8?B?cUcvUkMzSW9KZy9vczIvc1dTTm1Ka2hkVHNTUGRkYXM5M09VMFduWU5KYjVs?=
 =?utf-8?B?SFdQT2lNaExNRTg5UUlqUTBuaEMyK1l4ZXRsQW9pQy9xd1FCNk9pKzJ0VjNL?=
 =?utf-8?B?bUdsL1RMVnIvSDI4TGxuZTJBVXZiN0RLU0hxelQrbjJ3Ulh0MGhrQ3lIUzU0?=
 =?utf-8?B?YlorZlBVcjJZcWZRclpyOUg4d25lNzVJZCtLM2E2MmdGQy9VbjlWYkpjR0di?=
 =?utf-8?B?RkpwZHp6dnVaSkVyVnpWRFZ5dkdsVzhmeFQxT0RZSkhFSHdWSnNmWDcxaTgz?=
 =?utf-8?B?MG5qVlY3NDlQUkZrS3BKRy8xNitlRWdKT2IwT2FCZk1WSWk5bkh5Zno0U1NI?=
 =?utf-8?B?SnV3RXdIQ2xWL21RYnlNYklFTStGMkp2cGVvWVBLZkpVUWFnLzNPVVZPVFgv?=
 =?utf-8?B?WkhWREU0dzdZYmg0QnQ5azRYNUhNcUZONVJnVCtNcGJpMGFLNkhhZmZUb3E5?=
 =?utf-8?B?Ty91KzBOR0pGaG5UcUUxMEN3R0Q0RWRjbTcwM041OExNYWhPcjQ4L3gyK2FU?=
 =?utf-8?B?dGNVWnU3a2hwNTRCMWExOFB6TXh1eklrbkZtb2JEQXZNVTFmc3dQMndlM2Uz?=
 =?utf-8?B?T1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ad4c711-06f6-4b80-faba-08dc7bf05fd6
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 12:52:31.3902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IBpH/QPt+NladJvX0U/I5UAD1fQFDAZttfe3Mw1ONFQHku6TZ+X8xAwzbrXlXIkEy8TUxIQ8Fvt/XuDrIJAPKzXA1qGcixdbmKp50HfZK9I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6161
X-Proofpoint-GUID: GXqjAPhvxHEeA1iBjmduEUfpJNkt2Y-n
X-Proofpoint-ORIG-GUID: VOrrPtRuxZ0PxMznPUiFAX9O1cWKLFvW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-24_04,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 spamscore=0 impostorscore=0
 bulkscore=0 phishscore=0 mlxlogscore=999 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2405240088
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 12:52:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199851

--------------rEgonm0mK7301Ve04K0zcDi9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 23-05-2024 19:52, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Thu, 23 May 2024 at 16:16, Yash Shinde<Yash.Shinde@windriver.com>  wrote:
>> I applied the v2 patchset and still the test suite executes successfully.
>> I am not sure what's the difference between our testings.
>>
>> I did the same steps as you mentioned above.
>>
>> Are you changing build configurations or anything else?
>> Please let me know, if any.
> The issue might be intermittent. It did pass for me once, but then
> started failing again. Perhaps we need to see how v2 does on the
> autobuilder as well.
Yes, I guess AB results would make things clearer.
> Do you have a different machine to try on?

I tried few test builds on a fedora machine but it gives build 
issues(configuration issues for oe-selftest)
that are unrelated to your changes.


Regards,
Yash


--------------rEgonm0mK7301Ve04K0zcDi9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 23-05-2024 19:52, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj8wg42t7vKrtadb7N3ot2Xgo2R594XQRWemRpa3RXm+BQ@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Thu, 23 May 2024 at 16:16, Yash Shinde <a class="moz-txt-link-rfc2396E" href="mailto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">I applied the v2 patchset and still the test suite executes successfully.
I am not sure what's the difference between our testings.

I did the same steps as you mentioned above.

Are you changing build configurations or anything else?
Please let me know, if any.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
The issue might be intermittent. It did pass for me once, but then
started failing again. Perhaps we need to see how v2 does on the
autobuilder as well.</pre>
    </blockquote>
    Yes, I guess AB results would make things clearer.<span style="white-space: pre-wrap">
</span><span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:CANNYZj8wg42t7vKrtadb7N3ot2Xgo2R594XQRWemRpa3RXm+BQ@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">Do you have a different machine to try on?
</pre>
    </blockquote>
    <p>I tried few test builds on a fedora machine but it gives build
      issues(configuration issues for oe-selftest)<br>
      that are unrelated to your changes.<br>
      <br>
      <br>
      Regards,<br>
      Yash<br>
    </p>
    <p><br>
    </p>
  </body>
</html>

--------------rEgonm0mK7301Ve04K0zcDi9--

