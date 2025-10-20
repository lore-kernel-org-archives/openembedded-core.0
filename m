Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEFE6CCD199
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 05:14:53 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.11534.1760937290839083496
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Oct 2025 22:14:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=KjFBVopy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=238810fc8b=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59K40mRJ1122758
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 05:14:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=2fDEmFTROPi2BqYV6umPBHhQiwyAAWY/bIxnj0xp8xE=; b=
	KjFBVopy4/djbJAjUZsrjLXaYJL8kvtYbccCesycE6BFcWWJbA4cpaFowqNsU8WG
	Hkh5E70dI41ml4/QBmNcLJ9OQyysYK7UM1tuA8Tp5wOAnymqv8kYrwR+fnxq2nWK
	yfsPCJNREd/wjxIkSz24JV0hHw6G4NFrS5FRA31OSWSZ5Cbo9vH/KoYLwryhxETr
	Z+va973BXt63YkgRnuDoWGbVAsYCzxL61RYtPLjcTvWTQh6YS86TPsd2upJ1HNK3
	dD5Kdx8f7uKV8bQ5jBh1//BLUrgg+btc1Jow3yg9fRoriXvGmrll5sCKN+m7ZIOo
	EqJtugB1CafS0qtWlryq+Q==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012022.outbound.protection.outlook.com [40.107.209.22])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49v1v59f1y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Oct 2025 05:14:49 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ohGZQbSvaXSCWtU25D1sf3mULmYai+Wb573GFMoZXkQH9kGfVWFlSQV5C4PxXUm0RngL47A9uP+fUW9BgOjnHQhthgWwbqrqs30jgMKRZcJ9xQ8uH4STOH2fsXm9oZYhVtYgOArZJgXyOjkg2e9Iu58Y2Zwxfp0Vd9/gDFSDuwYyak4EYS+u/94ZVREUjI9MmCwAGb6DxUq3xdZbTOn+5I2pkB637bw5qJ4PEXCsWQisrE9+A4ggVD+kWD7ekFpAPj6BahFTnotm0uhWK38I1HL4Fk3Ecd2yze5+HbUDIXbm6a+cckxwSS03zNVweY71rmdqJ3/Kk1yCwv3ceBPONw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2fDEmFTROPi2BqYV6umPBHhQiwyAAWY/bIxnj0xp8xE=;
 b=Qj93QzNf/XGoSNl0VqLbOZezMHPURDCe1mBFpO/MJAjarTILjR3UYcAIOmDZr2+fSZCzGeTA25XZsiWVo3bewtUo0Bhg4YIkgrilYpH85IBogU+hEi9zCLwUT8DUn1Ilxrz6VhyZE77OfUQAvJNYYk7eondHF2azshWjcWJS/hmjurMCYOeih+62DzuwK0BvECU+X9Rp+xDLihu4QCUT2biEA1PdZKz2JHjqR+tYBRqilSsjImuoqleJ4xkRoRh0VVMr9eXT7DZbzyjwadyYixF9eAG+7wUDVzv8Wk7i1Ow15qmBh26+fHzOEk7d369+p2Ln7Xswlk0ap3ZU5dGZbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by CY8PR11MB6842.namprd11.prod.outlook.com (2603:10b6:930:61::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 05:14:46 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%7]) with mapi id 15.20.9228.009; Mon, 20 Oct 2025
 05:14:46 +0000
Message-ID: <6d4ae9fd-b708-4b22-a170-68af462a7b39@windriver.com>
Date: Mon, 20 Oct 2025 13:14:41 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH V3 1/2] base-passwd: add clock group
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20251016084700.1537381-1-Qi.Chen@windriver.com>
 <DB5PR02MB102130824E86A46D0A830FB03EFE9A@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <a7d6a359-5a4d-4314-939f-3fa97627bdc2@windriver.com>
 <CANNYZj8i4ksk_8kmDjswjA_pvQw-cCg_jOOCh47PYDu3TXw6Bw@mail.gmail.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <CANNYZj8i4ksk_8kmDjswjA_pvQw-cCg_jOOCh47PYDu3TXw6Bw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP301CA0039.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::16) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|CY8PR11MB6842:EE_
X-MS-Office365-Filtering-Correlation-Id: 895a460d-6bbe-43ee-c122-08de0f9795fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SVE1ZTR5WTRlWUdwTDVVWWliSEdIWFhGUUZzUVVxYytMS29CYkdUcDdIWUh4?=
 =?utf-8?B?M1ppKzV3TWdIUHZFR0J2RWFOL1hFYnNaVTZNU2NEaW5NN0ZsUm1TTnRpV3Bs?=
 =?utf-8?B?QitHdzlwZzhZUFA2L2VsYjFQN0RxaWhqbHZTUm0xQXJaYnpjMzFYMy80MU1D?=
 =?utf-8?B?YiszeHJrdWlwVWozbzYzelh3Y1FtZWs3aENWKzlVUktmQVAvOWZTelRnM1Z1?=
 =?utf-8?B?MGFQZThzQVFyb3VETVRxbXlVODlTQmk1Qm1rYjF2Zy94UC95N3RlN0F5aGFj?=
 =?utf-8?B?MFFlcXViblE3djZadU91OVNRMy9xK1FLeXNVdXl3NndnU05CVmlqZ1Rka0Qz?=
 =?utf-8?B?KzJscXNZemlXNWtUdFhEeG1hVGJOYXZISitqKzQ1U3MzR3dzVjdTNG05UkxB?=
 =?utf-8?B?blJDelJyOFZyYXlpcTN6cEZDak40YzExNlFrbmY2VW5rbU01bEczK1VBb1N1?=
 =?utf-8?B?WFZmczc3dDNUTit0cEI1alZaWXNNQjd2d0pJL3VUTldHcStxeUgrNjJMV0RV?=
 =?utf-8?B?UHNvNWFqQTh2UTQrWndWWUZyOWZEc0M4RENMS0ttRXo4Tm0zMHlnRG9GTGo1?=
 =?utf-8?B?RkNqd21zYk5JYU11RkcxS2VCMm9lWE1iTUtVa3RGdUtKVHNLcFIxM09rTXVm?=
 =?utf-8?B?VDI0ZTdESWcvbmxsUmNMclNCVDZzK21YS1pUbERrU1drN29CbndCUFQyVnA2?=
 =?utf-8?B?dGJRNFQ2ajRnbWhpZTB2eHN6Q1R6Y1ByWVpZUkxEeC9SQWlFVlNKSEY5d1Vw?=
 =?utf-8?B?YlRyOHI3bWtPdFlXM1pVeG1GTjU0cktQQzdndEpwRG81TGxwT3BZTDN0RnZl?=
 =?utf-8?B?ellUYTNhRjN0bXEybnQrM1hzUGtyVkEvTlpQbko1ZENkMXo4dHdINXR3eUg4?=
 =?utf-8?B?S2xsQ0M3QjUwZnFKN3FxSzlTL1JpdEFLUFJ1WHhmeTFjbWNuenh3cXJJMW1n?=
 =?utf-8?B?NzM5VkZZQnFEQ0lHRURqWnpJdXJzaEdHaWh4S1JZSFlHanlWcG9xelFERzBu?=
 =?utf-8?B?U0RlYU1JRm96UjZTSlg5bzhsZFY3MVkzdzh3QTZBZGlWUWtKL21Vc1VQTjNh?=
 =?utf-8?B?VGZXU1RMTWlKTHNQNkxjdGxyOExZQ1NpRUpZTkh1ZTlqZjgwOHhWeXZWcWZB?=
 =?utf-8?B?M0dpN2kraGp5U2k5a3JPZ3pleEFhYU1IL3FLNUZtTzQ1Ujg5MDI4ZVpSSi9T?=
 =?utf-8?B?U3lXUnFqRllxUVpNdk1LMllGQ2wvVlhSaS9zakRGaW9xbGd5aXVIb0FTTXdj?=
 =?utf-8?B?SlpOb0laOHNzT0xGTTAxMFY2NmV3SVhkQXFoakFnR1k5Vzh6aDVmUjdQL016?=
 =?utf-8?B?SjkwYWlyVkZRamRibDZacys0Umw1VkZFZVd3WkoxbWtreVkxSUFLTFJXM2ta?=
 =?utf-8?B?clpZRzVQTTR1bVFiQzdOODM0Rjh3Z3NNTUYvV1E5cjgxTERNWjdFd2FuSHIz?=
 =?utf-8?B?cWE1ZDk3aGZRQW9DY2h5RE0zTHUzOCtFSjU5a2ZTZzNnVU1kSFFOQjZ5dnR2?=
 =?utf-8?B?LzlzRWpYSkNuanJCQjFMd3dHMWQrRDl5QVJhWFY1MDYxc3N0emJRbGVmVjMr?=
 =?utf-8?B?allDQ0dWSTAvWmlFQjJZWTV4Y281QWxzenVJUC9Jd24rb3d3d240UHdnS3B6?=
 =?utf-8?B?TG1oYndBaVJBcjRKRXpUVUdqeDN6MVJGbjlrblc3SlVpRVExemJSVno5VHdh?=
 =?utf-8?B?cGtkQVJ4UDBZODQvTU82TkwxK1poMEpQUC80YjBRL1lnODIyOHd6SnprUUZu?=
 =?utf-8?B?aVhZZzZJQm1VTjE5OVcvNFdkQWR0ZUEvK2ZaanZKcnpXQTRCaEFQOHhVdk5o?=
 =?utf-8?B?cU9RYkxod1JDUGZSdXNMV3Y1QUZRM3lvcmhpajd3OVhqc2poSHVKZ2k3VmUw?=
 =?utf-8?B?NkJpWjFCTUU3T3lMekgxaEE4SVZPdHNWSGpBbDRTdVNYTjloMGFlV2ZPMGVX?=
 =?utf-8?B?ZDBtZUJjUi9uODFSQ1pibnh2eUkzVzRwNzNRa1BaUTVhRDhkcmgxamhsUld5?=
 =?utf-8?B?SEpjYlFqNzBRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WHlUOFk2RUQzb0RRLzRPby9CL09TUU5qMzJDUE1WRzIxQ2JyalhFTDYwRGJ6?=
 =?utf-8?B?eVE2dmxFTExDTFhpbW10bUtvZE8zQ1lER1AwVXI4eVBnQlNrSndFTkEreDlp?=
 =?utf-8?B?clhMbmo1ZmtwVExhQjR2THNnTEVPeks2cmZ6VG45RFl4a24vTXRmdG8yY28r?=
 =?utf-8?B?UXZTRXREY2JNdDE1Q0FVeC81UHRHWFZOWXl3N3JqVmlhZUYzclpxT3ZGZm9s?=
 =?utf-8?B?dTRTYTJCYWplT1lOamhzNjE5ZGl1QldpTG1XV3Z3c3BLMEVkKzEya2paRGR6?=
 =?utf-8?B?NU9acjZicEJsQm9QTnlyR3Yzb0dnMFZic3AxdjNkTUl1WU9kWkE0S05iTzJ4?=
 =?utf-8?B?U08rSUdtNUlxUk9lNkxBSE1nelFUUXhLVlJ0cTZXK3grbVptbmZ1NzZIRDVW?=
 =?utf-8?B?cXhhaVlnRUtsb3hZWEg0djlTSDRaaU5keUx2Z0hLblBkVEhHQTFvQ3haMTJ4?=
 =?utf-8?B?Vnc3ajlkVU9xaUtuVDNkbjNFTStKTTFtS0tLdHFsN2dyYTNBcy9HcWFDRDRu?=
 =?utf-8?B?MDVxK3E3QWpZWWFmcmdGY3JFL2pBeUc3T0dBQ2ZaU1JwTWovT2xhWWwvbXJl?=
 =?utf-8?B?MVVtL0dtOFJ5RjRzUWhQTW5NODRSZFVtWGZ6N2c5RnE2OC9ZNWE3MTJYLzVr?=
 =?utf-8?B?YS9LcG10MVRWZ1J4TFZLMER1b1p0ZllkYktOUzZRdDlNWGJ1TU1UZVNDWFBE?=
 =?utf-8?B?L2t1NUM4MEhqZVlBcVVwZGw0SmRaQU5tRGRSa3dmQ3FyNlI1QVFHTFp2THVC?=
 =?utf-8?B?bHBZL3Y5azdrdndMUjBFeDZSSHZyUmRnRW53a1M1OUlSUFhIcWl6NmwwdGtS?=
 =?utf-8?B?N2tKZjI1eGlGN1JiYndjNUl1TytXQUZ3R1FSUGM2V3ZVNnJMSG9qVEx3MjZC?=
 =?utf-8?B?Yjc3UUtYbmxseG5IQm94UkxDemNnVVM0YkJyWG0vb2ZBY2hTT05qMnMzQ1ZX?=
 =?utf-8?B?aExxWncvQ1NiZEIyeFA3WEJ5d1R6RXZYK1FXWnIzR01EOTVLV0tPWXI0Z3Nl?=
 =?utf-8?B?a25KbFdZUjVKRE1TTWpYRDRaYURWaUtKNEI3Z2xVMU9iREg2TW5FcnVDV1hK?=
 =?utf-8?B?OTZuNXlJaDRzVXd0bDlMbXBxUlFRUEd2cXpXTGoyRUcvR0twYWhNbElITjJ2?=
 =?utf-8?B?YzQ0RGxLSUs2Z0c1c2hNZ05ReUVKYVIrcVdLNU1MbmhobkExNkRnY1I5dGZn?=
 =?utf-8?B?d2QvaXNKMEp6NFBrTWRwR0FrL0xXN1liY1pvR1ozdUlSdFQ0MmMxQnNIYlAv?=
 =?utf-8?B?RDlaVXVOUE03ZStDYndVME0vY0wwQmoxS0FTa0lVT3I5MUxUMFBka2FQdElV?=
 =?utf-8?B?TG5mSWI1VjB1S0lQRmRhOHFnOTBISXc5MHZlMkVvKzczc1kvbSswRm9VYzF2?=
 =?utf-8?B?Y0N2a3MzZmxHYjhuM0liWXo1MjBoN3VBS1lXeGhrS1BlVE11d3pCdWNtVnE5?=
 =?utf-8?B?K2NpdUYxSk1FeDVXM1NtaVprZExaMUh2b3ZLZnYxYS9sRG9BcEEzSkVWaWhw?=
 =?utf-8?B?MC9STVByUGxoUWovMjNXekc2SWg1Ylp0NzVLcHk5c24yQ3pUOWYvUk41MjZr?=
 =?utf-8?B?WUxEMmhFU05TRUJub1RjcFRORVhucGVNVjZoamp3YmYwTEpYTmlvQ25rNFdl?=
 =?utf-8?B?YzkxWWJiNFlIRnlKamt2M3llVUNpSGRsTU1yTEpWSVM3OHlYTkh1UDVqUk1s?=
 =?utf-8?B?ZW1yUC9wVjdjNTdYVk9SK0RuVTQyaTBJdzRQYXVpM3BTc2o5WmNBMHZLUVNs?=
 =?utf-8?B?cUc5d3ZtenE5SktsT3A1SWVTUjFEQk5ya29GS1U5QUhaaGE4WVl5K0FTZkFD?=
 =?utf-8?B?SzdLSkFnWFJtWjNMaDhqcXlSeEc0STU0TXNuMnlxS3dQZ3hzWnVSazdDT24v?=
 =?utf-8?B?Z01tWXU5N1lqMUJRN2Z4NmEzSU95Z2hKQ0FQcVNWb2F5T21Yd0l4Z1gyRUxX?=
 =?utf-8?B?Umh5UHgxVG8rM2pUNytTYXhpS1oxR1B5aGVmTzhOc2VBY0FxWmFRMkJuOGtF?=
 =?utf-8?B?aFAzOGMzMG9HdFdtK0RRWUxmRUJDN0h5QmNRR0IranpGaDA4enVXbDBCRGx2?=
 =?utf-8?B?U0dHelAvT0x4VmJPdDdQYzNqcVJKQWk5TklPY2FNdzZDNEcwUjZCM0V2VTk2?=
 =?utf-8?Q?KVu/Dyh/78R3jcuQQ5Mp2EDYf?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 895a460d-6bbe-43ee-c122-08de0f9795fa
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 05:14:46.5847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lyCyMkPJkTur3RbeH7x5QmoB+dAQDdit5RKs7fZUtyFIYh4bSiZ9rf6OzCl00riAI+98TBRTgnxiY5nqZYBF9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6842
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDAzOSBTYWx0ZWRfX5JvGc7cW8Sps
 ws29u9iv+X6uB4xC+ZWA5VWTDRpODLk5mFsaQG+aLA46AxnZ+KsDYUKs85quB2Epmj82+oRjuO5
 uQ0jMkRTsBRRu2K/aN9Af2oo9s+sQPECSv1WKjb4GpAMCzYmsO0Tbva6WQUeZx9p0EXq+ktda16
 gP8YLjUAoTwwvQmVXxGwdmIhwcH3gsmLw96W9XGQ+8flQhKn0zsIR86cvM2s5xB02T3oN/WmcpI
 Xee2xwPI7iA+j+72S7pV9OZVVwIUSo3Yr9088AQibpnvDNy7LwS/4DNsgjhZQrrwGxykUJroI5o
 vi2VjSCjHV3XX0TBkVMU/qHsxr8IjKqO9oQkuLQu60f+X1b3m19xS1cRU7qTfHs9ocLrs3npCB9
 nGPaRA6wrTF38fD06WFrinfMxPAWGA==
X-Proofpoint-GUID: k9spQABYwh_QQI7vXeHN0CFNfehHAhLv
X-Proofpoint-ORIG-GUID: lbjCUE31VEpBL0KFMIh3O2wL7q1pZm7B
X-Authority-Analysis: v=2.4 cv=ANdmIO46 c=1 sm=1 tr=0 ts=68f5c549 cx=c_pps
 a=LdSsacNKwWtvIYfRw5AjOg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=xNf9USuDAAAA:8 a=Q4-j1AaZAAAA:8
 a=i2glHo3qQSThGW8-TGYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510200039
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 59K40mRJ1122758
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 05:14:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225095

On 10/18/25 02:22, Alexander Kanavin wrote:
> On Fri, 17 Oct 2025 at 04:56, Chen Qi via lists.openembedded.org
> <Qi.Chen=3Dwindriver.com@lists.openembedded.org> wrote:
>>> Why does this have to go here. Why can't you just update the
>>> GROUPADD_PARAM:${PN} in the systemd recipe to create the clock group:
>>>
>>> GROUPADD_PARAM:${PN} =3D "-r systemd-journal; -r clock;"
>>>
>>> That way it is only created if systemd is actually used.
>> I consider this clock similar to the 'wheel' and 'kvm' groups. 'wheel'
>> and 'kvm' groups are added here, so I put 'clock' group here.
>>
>>   From my understanding, such groups are likely to be used by other
>> applications (recipes). You can see this from the original commit:
>> https://github.com/systemd/systemd/commit/af96ccfc24bc4803078a46b4ef2c=
deb
>>
>> It's possible that applications such as linuxptp will use this clock
>> group. What systemd (udev) does is to change the device's group to
>> 'clock'. This means applications using those devices could be put in
>> 'clock' group to be granted access.
> But how do classic binary distributions handle this? Can you research
> where e.g. Fedora or Debian create this group? We could probably
> follow that, and avoid having to carry an Inappropriate patch. Maybe
> base-passwd upstream already has a fix?
>
> Alex

Hi Alex,

I just checked the fedora:latest container. It also puts 'clock' group=20
in a basic setup package, which, according to its description, is=20
basically 'base-passwd + base-files' in Yocto.

See commands and results below:
"""
[root@607fbfbf12bb /]# grep clock /etc/group
clock:x:103:
[root@607fbfbf12bb /]# rpm -qf /etc/group
setup-2.15.0-13.fc42.noarch
[root@607fbfbf12bb /]# rpm -qi setup | grep -A 4 Summary
Summary=C2=A0=C2=A0=C2=A0=C2=A0 : A set of system configuration and setup=
 files
Description :
The setup package contains a set of important system configuration and
setup files, such as passwd, group, and profile.
"""

I also checked base-passwd upstream and debian:latest container.=20
base-passwd upstream does not have clock group:=20
https://salsa.debian.org/debian/base-passwd/-/blob/master/group.master?re=
f_type=3Dheads.=20
And debian:latest is using systemd 257.8 so it does not have this=20
'clock' group issue now.

I'll use gid 103 in patch V4 to sync with fedora (though not necessary).

Regards,
Qi


