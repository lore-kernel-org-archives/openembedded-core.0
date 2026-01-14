Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49602D31A13
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 06:48:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4979.1768373304805375818
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 22:48:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=qgupMMgf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5474771f1a=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E4Uwdq1083342
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 22:48:24 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=ss2hr8cyltm5spnjy8zhs7dlJakQLy4GXYzpykUr+q0=; b=qgupMMgfjLrt
	rZtKXlwD9sBee0Blq3D46Ss3OH+tlXIOVkOUbvinfrF2IYqOaZOdyDcOv5/FDaG8
	Im/Q0/ARO6GzXzoQsTT9BvZ/PMx1wNzztHGlh4ANxwOtAktffzInUzMsR4MYPz6I
	d1NHmQWePMnv0wzdweiOXA8AR1nFyEKXaSYkPT49XEGE6Gf0jXcyDq7kOW1JTRSB
	+q2nATYKCxBQK0Rk7WpmTQrKUYio3PjQIN4sDLYjrZRmS00L+RCMlknq7KB5K3Jx
	LQSP4IjIhUv+PYlf4svb/peu/z2q75tcBCa+4IZ0HOxUW1m1sAsQg/5IywyaC5o3
	mnkK2mPCAw==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012042.outbound.protection.outlook.com [40.93.195.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bkq5fuu5e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 13 Jan 2026 22:48:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QuWN7P0QbbLEFLCLSn2EQk1VC05fjExh5GEGyF2hz1mp35lmi/VrQIgQo7Iazu5pGe5O0qhCOzWRU4D9BeGu8Wy+QtZZMdG8r22wxwUh2QAVkS9wkxjyB2Vb5ytOMUxw04O8KqCnKzs40viU4t+VXIYa8jPHYUpnaZ5Ch69adpBw5a1BSeFUEXJ38hsinQsPZgQY94RZrgYiFD+p3Mbbh4PYCCZR2jppRC1jm7J4GWo+mqUQKUk6INRCTPWLAAIqACVfGhxXiIEd1oo1XG1p3rFS/aaYTWlN8ny/MEErDpfvSKv9IouuAHm0rxduxcagXMl7wP9NhY2xgOhBMXjPNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ss2hr8cyltm5spnjy8zhs7dlJakQLy4GXYzpykUr+q0=;
 b=ljgHP9NOhBkhFWxT2sJyHxA2P7qOPuHuVk4Z2+47sAB5VWgbRj6MEuRqb+FHWSMj3H21/i99xaPhHIQEqbO4agx+3RJMC74QrkKelgDtHRQyk4SB+bX54MKkH42ps2o1hfinrFNlbbPnKKsOpqO2SYGktiweSpo5QH96r7i8d2BMlV4xLHJz7unF5bA+uzLvbgKf5PfAbRk8jXE8Opf55McGeqWxjr8Nup+tYzSplwR2BJV1NBU1yUXdTzP+5UG012SiiXePD9pYrDh63K2mzTu6AYTiah1BsmYLhlHQ9iRvhgegnBVcGyRIc3oDEcHcGkDXb527NnQiDa0UVahq3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by SA7PR11MB9541.namprd11.prod.outlook.com (2603:10b6:806:4cf::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 06:48:19 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.9520.003; Wed, 14 Jan 2026
 06:48:19 +0000
Message-ID: <5372edcd-30c6-4d7b-951c-77a1a3c9d778@windriver.com>
Date: Wed, 14 Jan 2026 14:48:13 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V4] go.bbclass: set buildid to empty string to
 improve reproducibility
To: openembedded-core@lists.openembedded.org, bruce.ashfield@gmail.com,
        richard.purdie@linuxfoundation.org, mathieu.dubois-briand@bootlin.com
References: <188A85EB176781B4.2595076@lists.openembedded.org>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <188A85EB176781B4.2595076@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SGBP274CA0020.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::32)
 To DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|SA7PR11MB9541:EE_
X-MS-Office365-Filtering-Correlation-Id: 58a468f3-c3b9-4ef7-84fb-08de5338e711
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|366016|376014|1800799024|7142099003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aktOOW5hYVpkc0xUeUVzWkN5MGtBeGFYZzRGSHB2cFEzZ0ZyVVY5ME5hY3FC?=
 =?utf-8?B?SHcrZ2pEZ2JoMlBpbzhHTUpEQ3ZadzM5aFlBd2tzNHNYNXdyQi9vTEQ2MkNq?=
 =?utf-8?B?b2FNc09aNkVKRndYNEpaMUp0akpvazhrdTAvQVg1VlczTEFESGRwV0dTT0RJ?=
 =?utf-8?B?TjJXeldUN0ZyRUZiL1hzc2JKM1hDa3BPWmZyV3BJYXBQaXZmRC9QMUpLRG1W?=
 =?utf-8?B?YW1zUmJicE1DUkRXUEhwcUI4N1N4aVI4U0ZJQkxxeWlYT1RYV29OY0dOdSt2?=
 =?utf-8?B?VzRYVEJZaFpqT1ZNWU5qeUpkNmtQOTJ0Vkp0TmJROTcrcXgrdG1hS1kzYlNa?=
 =?utf-8?B?dk5GYjhuY3NEcDVka2U1TjZwYmh3S2V1VnNVSnluTzRMNEJvSlhyNGN4MHhH?=
 =?utf-8?B?THhPL2k0WDRHb0RwU0NGMm9HYWF6akFtLytteWtKUDAxN2hYVE5za2dES0Jr?=
 =?utf-8?B?SEVDK1lOMy9ER3dxb01WbGZxSTdxUEpBSUR1OThSZ29MbW52ZGtjbjNiOGdk?=
 =?utf-8?B?czVzNFhadEd5Y0NyUUNiM2xPZVRtMjQ5MWNZZUlHZFlNaFVXOXJpQ0RWRnlm?=
 =?utf-8?B?Vkhvb2ppOVltckJsQnNVTUlIU1J6eFo0SWtPOXdmak4va2twMTZVMmJSeWhR?=
 =?utf-8?B?QVdQMEhXWXAzUTlnamJ0RWNqL1RvNy9taEJQQWJ4Wjl5Q0l0ZHpRR1RWbDlU?=
 =?utf-8?B?MlVMa1lTVE5lUTJjQ1RtYXVlWk1Fa0dKRXJwWnk1b2dwU1MzZ0c0NU1jdTlN?=
 =?utf-8?B?VlN0ZERLdnpqSExXSjkyYkwweUVXMXFvOHhrUHY1cUVPRTFqMGpjMDFqNHNK?=
 =?utf-8?B?VEliU1FaSlVIeEFldXNBWmNlVUo0TjFDSElxRWFBL0U4ckU0bmFBY3JPSmlt?=
 =?utf-8?B?eHkySUZrZXdXaS9JNnY1clE0bmpHdHFxZ241bFp2UjRYVlc3LytzZnBCTFlr?=
 =?utf-8?B?d21yQlBtSjUzOXNpZmRENmZKdXpmZUZmMUMvajhXeVo3bHl0V1dPazVLRktB?=
 =?utf-8?B?REdlVE9qc3ZUSEoySlY1ZWVkZjM0TGJ0YTZKWXJIMWQwTndBRE54U3crcGNw?=
 =?utf-8?B?UVphdXk1Qk5qSjVSTkdERngrNFMrUC9oTFQ3RXFQZXUyK1BKd0VISzdDQ1RX?=
 =?utf-8?B?TVljZ0sxaWFMTncvc3U2eXlPWUhKb0hXYisvRFp3ZHhOa0JGQXRveERHeHdn?=
 =?utf-8?B?MEVWSCtuaG5BM1ZvRStyeWhDUUFIMTRLTHZJeG1pNVdHeDM4aDMxZ1paU2lR?=
 =?utf-8?B?Y1J1UFdGSGEzS3o2QlRGbldyY1FKNHgxYVpCbHhmYW0ybncrUUJwSVdiMnBx?=
 =?utf-8?B?Nnhoc253Z1ZIS01PdWpKeVVQSEkwTGhpYlUrMzZpZ2N5d2MzdUo5eGs5eTUy?=
 =?utf-8?B?U1lSWmdjNDNaWVFKUUgxTFcrbG1hRmo1TW1FTGFtQ1ZWOEpvRFB3TkRhQm1R?=
 =?utf-8?B?OU9QOWowaWRmTm0xUlM2Z1E0WEhpcXRtRjFYQ3FwK0UrUVJDcW1nY0hqa0tk?=
 =?utf-8?B?dnc3NVhUQmVFTTFndmZYWXI4NCt3OEgrbFNyZ0VDK1VpcE9rUlQwY0Fpc2FI?=
 =?utf-8?B?OU55Vi9hVVR3Vm5VUU44akh6SnhpQTBlcmlkYytYWjJqMFlpUnlJMGtxTWhD?=
 =?utf-8?B?QVZST3J4czZsaE5nengxY2MyYVpWRlNEdXE1aUoyQVJxUGd0WXZuOER5WEV4?=
 =?utf-8?B?MGoyaW5hY1g2NUUxdWo3N3Ruby94UWRCZXFLWWhFWXRRTENkaEpqU3JIQjVm?=
 =?utf-8?B?a0FBQzZwTHRPYzkvaGRTRzhTY1p4V3VubUZUVEF2Sk05bWU2WXlkaG91K016?=
 =?utf-8?B?K2tUR2NmdDY2cXBEaS9GeklKUnljRjBwODVyclg5dmp4ekFYSldIT3oyOUky?=
 =?utf-8?B?MC9EMk9WMUtoSkRLU0tvMXVoOUZneVE5M3JodWplV29sNFRNNDc4NGxkVklh?=
 =?utf-8?B?bHJmRnNxTWlsV0xwc0t3SkNUZi96R3RBQ2ROeUJRcFlsdnFPODljYkQ1TTV1?=
 =?utf-8?B?YXZpS3B0YzlnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(376014)(1800799024)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eW5yYmRveEgwcTBVRkdtS3V3a3RlcWFkdE9ZWk83U3NiSzM4UEgreTlZc0Ft?=
 =?utf-8?B?ZWh4VG5xYkhZQWFXaUxISjJ6dlpvWUp5bUZUR1VrSUkxdHZ3dnV5b0tPWDZE?=
 =?utf-8?B?YmVhaG11bHl2Z05lcVlMaGp3bDg4dmh1MXVmWHh5eU1XWTdUaUVQS0Vzb3N6?=
 =?utf-8?B?ait3NDVWS083QXBVQlBiTEpCTHJWdWRCenFlaGdqSUVJSWl6OHh3Z3NRUGNV?=
 =?utf-8?B?aytYUDQ5Ti9ZVHpCQTJhcmlmZXdkMEFIRXNIMGVGSkRHbGpHTjkrbm5WMGlv?=
 =?utf-8?B?NnBXeCtDcThFNEs2N3RFZlhhRnRvNkYwVml5Z1h5Z29uQ3R1ajZKeDFhNFY0?=
 =?utf-8?B?Q3J6bmFhT1hDcXVYYzlNNkFmWld6eWJ5YVNMZmFScytYa254YXlVaFZsTGdU?=
 =?utf-8?B?bmZnUk1LQTQ3YjhkV3FmK3VqM2N0VnNzYU94WWROMmxMVFYwSlB0ZVFXRnFY?=
 =?utf-8?B?QlN6QVhuSHkvUW9GUXJOSFhrYklCYVlXTi9kU2FsY1pEcFdkVXJObHJqRE15?=
 =?utf-8?B?NHhnV0RoWW9WQzlsR0hDVG9ra1ZYRjRxc1AyQVU0Y25BdVNYRlptSDJ2Rzdk?=
 =?utf-8?B?UG1vcU9kaXlrdmdnMHBkS3hydHMyeXFsLzJ5WVF0WCtpOUFQemduQ0svUGNk?=
 =?utf-8?B?NEhoNlJ3UFBob2NrcytRRkpnNnJoNkJ5Zm1LN055V0JPRTVxcnhaZVFYRzVW?=
 =?utf-8?B?YkN1blFxYzcwWFFsNVVINU1WKzZuK25OS050UEJDVjU2K0ZIRlNRd05MbUMr?=
 =?utf-8?B?L1BFMjlwUW9wdVNWTkUzY1VlY2RkczlOYlZlWW83dXAvSDM1TjAzaFd2Z09R?=
 =?utf-8?B?L1owSlVIT2JNQUxCNWN3ZE1UL2xVK3pFc004NVhMZ2pXTUQ4MC84dUIvc3BU?=
 =?utf-8?B?TFdyUFl0cWtxZGVGaWZvbjBQL0RVT3hmdlUrekpKdTJLYkU4VjVnQXR3bjcv?=
 =?utf-8?B?V2grWEQrTnpCRzZzZzRiSkUrMVhVcCtteFpzRGpuN1cxdWdnbFZhcVl6Tmpq?=
 =?utf-8?B?bUtkYmsrTDdSVWVTWHFpWnZ6c1hLOXJzV0V5UXVkSUoyakdiUzlYNUJkSnNx?=
 =?utf-8?B?czg5UlNReFdJSnRmOWhPU20ybGpZU0k1ek52TXhyejlwR2lVS054N1pGY1RO?=
 =?utf-8?B?TXF5UnIrN2xxdzd3UFhQTEgzeC8yT2dLVCs2cWRBb3JxU21IWjRFcDFXRXdH?=
 =?utf-8?B?b08wRWpFRDVLd2l0encwTXNkYmNZMWlNYnJad3ZYT0NyTDdLZlBBbmVHeGVn?=
 =?utf-8?B?cm9yMktKV0hqTFh4U3NJeHE3LytMaUc4WmNwZ0FYcWliZEdGZTFDclRxeTJq?=
 =?utf-8?B?OWRTZGg2eVdvM3FYeGlOR3NWODdLQnBtNmJaZ0UxdDlOVWxXcDVwdUFmSzFO?=
 =?utf-8?B?U2xZR2tha25jVkovUjdhY2ZOWEtrQ0VXODk4cWU5cDdsWTNXMzRlMUpFQ0dH?=
 =?utf-8?B?b3FPRC9sSGl4MWdVaXM2L2tFQzYzZTdTVkVTZkZ5ZkdLUUk4RFc2NkJ5bEI1?=
 =?utf-8?B?NExiN2hSWGxOeWhFWDY0eHZVUEpHLy9mYnYrWWFPbWEva2I5ZzJLaFR0a3pI?=
 =?utf-8?B?dTI4OWkyZEtLSDBCSHB3VytnaU9VQzlJWE1yTmRGMzBnRnZ6bWNFTzgwQzJY?=
 =?utf-8?B?d0JINHpYZzdrNHBYMmZGVDIwN1ZzazhJRmR6OUxVZ01FM0JFcEVIdGhsQkJY?=
 =?utf-8?B?YnlValkrTVlqdUZOS0dlYzdLdWZ4R1M3Vmd1NjNCSDR5VU0xa2JVYnM4YWFP?=
 =?utf-8?B?NzZJWFVyZnNUZDR6ZDRlRnZ2TnhqMVJFS0V6UG1sUFF4d21xeUp3S2JGWVhI?=
 =?utf-8?B?Uzk2WXNlNnZ3ZFREbU1kL0RsYzBBV3cyTDBudXdoa2FFZFZ6UmwyOWRZTFJM?=
 =?utf-8?B?WTRBY0VHOUU3bVpyNkR4NGVocGRxNlhNbk9sVUdQV2FqTE85Q2drU2x1R0xa?=
 =?utf-8?B?MW9QU3hLQWdSamZ0aXlaelorSzBuQWtkZTB5TzhEdmNEUEYvWXF4RXNIdlhZ?=
 =?utf-8?B?L3grODBnb1IvRjZNYjVjRDd5aXRLVlJFbWFHZlk3a3Nrdkh3VVJUOER0ZGFn?=
 =?utf-8?B?TldZYjNUVlFyS3NRdUZqa2NwVjd2LzNmTjFYdUQvTjVVR1hxQnI5Yi9pT0w0?=
 =?utf-8?B?MmRXaXlDZDZFbEo2cXp0Z25FMlNTYk9NMWY3S3U1OEd2bWFIMUpKTndDY2ZJ?=
 =?utf-8?B?Yll5WlNIckROT1dyWGswVGQveldmd1c3M1p2Z1lRUHIwR29KMEZ0K0JuR0Fa?=
 =?utf-8?B?TlBSTE5uRzVqTVN2YjJ2dnJSQ1dTRkpOL1djaHVZeFl3RWpyUmFxNnV6U1pI?=
 =?utf-8?B?MnhwUlhGMlV1dGVTbFcxRkZqVGtaUThKb2xHRkFqdkw1WWVWUVd1RVg0Um5m?=
 =?utf-8?Q?Xn3JMWnUIH2TRcPc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58a468f3-c3b9-4ef7-84fb-08de5338e711
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 06:48:19.5810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zKgRFZgtTMnR+AOYo8dd1nbqXjEJSKMyqApnt9o84VSeNm976964huDb65ferOzopg8th0U+7pEcu14eAaD1QPz2bic3iIy5I/jG46t67FM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA7PR11MB9541
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=d/z4CBjE c=1 sm=1 tr=0 ts=69673c36 cx=c_pps
 a=WIVU+UPliRI2+OFOdf1Qsw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=UGXAvUmdAAAA:20 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=GhIeNcqkb_Disp7bdFEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA1MSBTYWx0ZWRfXwc5pUlKFWPjj
 Saei1O7ckFBaTKYnHr04y4HwfUp72MVkemSbFPh6JOlI58cfTlT8fnIeNedXNSLVxqcdmKbMHXn
 97PJnduyL7+IxNk9rmj2un3G0vS2dr5UxUr1kWKoM72w71aLeToOL2bLP7mVQQcnhNZDZTiCez0
 5tgsmQUWUDzq3WUFKOky9qZKDz3UF1rsx97/xITJ8YPnMrECtuHipDYooKJbj25GVCus8DbTkgJ
 K1BJENFod7LgV8ZUWRqMyK3hjWrVSeK5Zn6VPRbXfFDQZBhCKFfyInWqJIf6vPfGfhm7vcAnuS5
 6ruFMtmhfgSEdLqVT7eVukXVkuwWuvqcHkbAXrjmM4NYOwJsMvzScnXizgLNnm+CaFR0GJ80fO/
 Fxa7dYKT8b/H+0PwdPSYncii6X31JJxevJODGOo9Oa06uCcxu1JUqnGF3wL4PvjOPoZMjq/8V7b
 urCAHBd95aD7UUwk76g==
X-Proofpoint-ORIG-GUID: f7HnjCulMdj0A8Tu5T7JFcbO-4r856gs
X-Proofpoint-GUID: Dg6HYjnl3TaS-UCGqnlat-9-swRZHO1A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140051
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 60E4Uwdq1083342
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 06:48:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229304

Hi, Richard, Mathieu

I noticed V2 of this patch is in master-next,=C2=A0=C2=A0 and this is jus=
t a kind=20
reminder,

The only difference between V4 and V2 is the "commit message"

Regards

Changqing

On 1/14/26 14:44, Changqing Li via lists.openembedded.org wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> Go packages and binaries are stamped with build IDs that record both th=
e
> action ID, which is a hash of the inputs to the action that produced th=
e
> packages or binary, and the content ID, which is a hash of the action
> output, namely the archive or binary itself, Refer [1].
>
> And action ID include hash of modroot, which will include build path,
> so this make go package not reproducible.
> Refer [2], keying off module path instead of module root directory is a=
 TODO.
>
> [snip of log]
> HASH[moduleIndex]: "go1.25.3"
> HASH[moduleIndex]: "modroot /build-a/tmp/work/x86-64-v3-wrs-linux/build=
ah/1.41.5/recipe-sysroot-native/usr/lib/go/src/cmd\n"
> HASH[moduleIndex]: "package go1.25.3 go index v2 /build-a/tmp/work/x86-=
64-v3-wrs-linux/buildah/1.41.5/recipe-sysroot-native/usr/lib/go/src/cmd/b=
uildid\n"
> HASH[moduleIndex]: "file buildid.go 2025-10-13 16:08:43 +0000 UTC 1704\=
n"
> HASH[moduleIndex]: "file doc.go 2025-10-13 16:08:43 +0000 UTC 558\n"
> HASH[moduleIndex]: 007b9fe2edd5b3232f5c98ae6c46e80a435141cb627ba5418c53=
14c0cbf4df7b
>
> Report this issue to upstream, refer [3]
> Workaround the reproducible by setting buildid to empty, refer [4]
>
> Refer:
> [1] https://github.com/golang/go/blob/master/src/cmd/go/internal/work/b=
uildid.go#L26
> [2] https://github.com/golang/go/blob/master/src/cmd/go/internal/modind=
ex/read.go#L70
> [3] https://github.com/golang/go/issues/77086
> [4] https://github.com/golang/go/issues/34186
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   meta/classes-recipe/go.bbclass | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/go.bbclass b/meta/classes-recipe/go.bb=
class
> index b540471ba2..1c43b36fc0 100644
> --- a/meta/classes-recipe/go.bbclass
> +++ b/meta/classes-recipe/go.bbclass
> @@ -51,11 +51,12 @@ GO_RPATH:class-native =3D "${@'-r ${STAGING_LIBDIR_=
NATIVE}/go/pkg/${TARGET_GOTUPLE
>   GO_RPATH_LINK:class-native =3D "${@'-Wl,-rpath-link=3D${STAGING_LIBDI=
R_NATIVE}/go/pkg/${TARGET_GOTUPLE}_dynlink' if d.getVar('GO_DYNLINK') els=
e ''}"
>   GO_EXTLDFLAGS ?=3D "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${GO_RPATH_LI=
NK} ${LDFLAGS}"
>   GO_LINKMODE ?=3D ""
> +GO_BUILDID ?=3D "-buildid=3D"
>   GO_EXTRA_LDFLAGS ?=3D ""
>   GO_LINUXLOADER ?=3D "-I ${@get_linuxloader(d)}"
>   # Use system loader. If uninative is used, the uninative loader will =
be patched automatically
>   GO_LINUXLOADER:class-native =3D ""
> -GO_LDFLAGS ?=3D '-ldflags=3D"${GO_RPATH} ${GO_LINKMODE} ${GO_LINUXLOAD=
ER} ${GO_EXTRA_LDFLAGS} -extldflags '${GO_EXTLDFLAGS}'"'
> +GO_LDFLAGS ?=3D '-ldflags=3D"${GO_RPATH} ${GO_LINKMODE} ${GO_LINUXLOAD=
ER} ${GO_EXTRA_LDFLAGS} ${GO_BUILDID} -extldflags '${GO_EXTLDFLAGS}'"'
>   export GOBUILDFLAGS ?=3D "-v ${GO_LDFLAGS} -trimpath"
>   export GOPATH_OMIT_IN_ACTIONID ?=3D "1"
>   export GOPTESTBUILDFLAGS ?=3D "${GOBUILDFLAGS} -c"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229303): https://lists.openembedded.org/g/openembed=
ded-core/message/229303
> Mute This Topic: https://lists.openembedded.org/mt/117257536/3616873
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
changqing.li@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

