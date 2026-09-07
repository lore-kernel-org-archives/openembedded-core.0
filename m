Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35BF9C79FA0
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 18:18:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2073.1788805083760506030
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 11:18:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=DSv3SYiJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3710c32c3f=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687HOGUD425605
	for <openembedded-core@lists.openembedded.org>; Mon, 7 Sep 2026 11:18:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=W/MKEMKN1cumNPH2mrkO01bA+Lf/Vu3QAH83reFptIc=; b=
	DSv3SYiJB+jk8Tk40OOsL8KWnhEW27LPA7iZBYKukIw2kCTlwQnND7GKiWh/ez83
	pjKqGeaN8UGriwsbppJBNr6RIqqep5IPQw6sV8NHyY/qTc/L8tXieS5C8yQrEC0J
	9zJwxKDEIMV14VPnFitISnCfESwy764wGANWl/Ds8mdvI5D+LHX7mtJKGkUg9Nz/
	ik9HFJ4YxfMGBFK3kWMYU2l3IFBJK5vMjeoOp7dwz2l3jrmqJTa5hJfk9RimoCM3
	tbCfeg3dbrwfVFv4VeDICAGFaICVd8shbVvwHmdw4DUHABgObHpt8goENj/UbcR8
	1dYA9ZscnmpwfNcthOjTfA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021077.outbound.protection.outlook.com [52.101.57.77])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ggec0tsu6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 07 Sep 2026 11:18:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bkO5e6xnpzBARb+7bp81OoJzuMEr0Ijce2WJj8vxSE92wrXmNYi36dwNp5cHUGVboCXI5u3a02hhcQ4wflAO1qc+J2IrIgClz8UIDWub+4ZMCyXZUKNV+bX61MXNYYR5i5EExNWwYCoXBQ+mGeMYdlvMsoDc3A/anTspeaVA28JnoA6olBv52XQu/OmKUO4Tp3H5G58YjSo8MckNNTKXTsLaWJIUk1BNQkk9c40BO7/udZO2NHIfmyDxjOWiobVX3nIjUx6WW3TpoZM1m8r98SS7f0HGEQrQ8+zATwr3lRnZKCeH5AQdUFZ3/6u18Mp3A2mp7BKmGpq/le5MXrxUJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W/MKEMKN1cumNPH2mrkO01bA+Lf/Vu3QAH83reFptIc=;
 b=LlwHdO7hojgP2caw0QTysEc2JmuydNW9B+vDQ847ZSBbVMGMK0Lu2tYQfeV+s3ELFjkTYSB4Fq3ikxiwAc2fZQZEosdRswF2NLQHfckNR3cSQQDxB0jeHHvaU5Q5zoJ/r+SosWgkoMKqXRldMFkHfpsEob1CFqELYP1oV0BDbmE8poQep4R5mf4HlqPy+wK7gbOOcbtLCm/0yzU5Lk/r1AVEePQUi61RNwBqdkuOXt4TQHPhYhjcK3b/Fxvbor3z1n04Pqp2isIpKMlJncw2hkdJFImfwkrvMkcD1UArIcrj5esxYTANiMtFXlP3gwqOudKwp1selrQUwz09hQu2XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by CHAPR11MB9653.namprd11.prod.outlook.com (2603:10b6:610:301::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Mon, 7 Sep
 2026 18:17:58 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%3]) with mapi id 15.21.0382.012; Mon, 7 Sep 2026
 18:17:58 +0000
Message-ID: <fafbd39b-6914-478a-af3a-7c5a2b7022bc@windriver.com>
Date: Mon, 7 Sep 2026 23:47:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 1/3] rust-cross-canadian: install
 target-specific env scripts and fix rustlib lookup
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
References: <20260807093116.3680514-1-Harish.Sadineni@windriver.com>
 <d489c96976fb770d0499ef325cedf7e085dcc775.camel@linuxfoundation.org>
 <ff0f740c-91b2-4ab1-93ff-223c3546c2b9@windriver.com>
 <661986274bd867b38fcd20ea5e99bab704fbc1bc.camel@linuxfoundation.org>
Content-Language: en-US
From: Harish Sadineni <Harish.Sadineni@windriver.com>
In-Reply-To: <661986274bd867b38fcd20ea5e99bab704fbc1bc.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: MA5P287CA0143.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::10) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|CHAPR11MB9653:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a20dad8-83cd-4e5c-4c97-08df0d0c57e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|10070799003|23010399003|366016|6133799003|3023799007|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	jkB1L3b32zgeBxXotmJsrj1FXXJeziyorKN6SnofDN1oRR/JSDGFWYOFYrDubS5CjqYbOhcSjmLSFn7h7nrhFtKC6zFnt1/WK4XlKSy/P7TXZmYKYbLJeCR2KPNngq72YUohrcx0m+u4BeqVqsxINgqB85NKzk0vUiZfLppJ7JUOz4FzyDZAWBoqM2BHN+v5z6RVeC52oGlxLKSDiHWWMRVuwVx8L61ilDVdZLoA/Do4lPcrT2fanRE7ktveEygvDenjrYJ4dKcLpNsUV9WvthKFDD99bd+UitIN3khC3V7zsv2qSlb25VnzUJKTH5CgiLmxhIAvM1gCga7ozGPli6Z70/o/I0HhAR9lqLCEgugrrd5KqNRxPmXEHROeEGRXvPIeqncy4g+aMzYAuIeYGKbCWMH9phhYtRbudCTr3rLhH6ISmW4/kDMz43qHohygF+wtPT2j7aEDFyM9OAuT5MI+fCuKPqCNPp/O8Zwd97YchzipUV0fvGpGNoq9ylc09XjRhtMroI0ZhnN5dRqnRyp0OQ9E2/LMiy/GIOSq0DERfXHTL+YKwtIKfROUSZitT/z1uMWjMH3QNDEXeG+buuedBKP6RcgBgh2HXDcZ3rkiPMvYR0AK4f1+VHaO5YM9
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(23010399003)(366016)(6133799003)(3023799007)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?T1JHbnk0NmlzZytiUnZDUDFieXhiZTF2RUJCdmg4NkNNZWphNmdtNVJObnZ0?=
 =?utf-8?B?ZTNUSmthVW5FNTdaZENzNkpqeHZteElzUWpWUUJ3N1hBZlErVjZUYlNjSVMw?=
 =?utf-8?B?VHdZMEFPckJ1SGZzczMrZlpyMXdJZ0hoQ0JIWHQ5dmVUME9WTEZRenNmT3Ru?=
 =?utf-8?B?Q2M5VlE2MXJOYnpINnFwQ1VLNVZVczk5bEVvdmpHdTk4ak5oa21xYnBBT0hQ?=
 =?utf-8?B?dHJIQlVoRjcrdytWWktGNGg3d0JYaDlWT21vMjgzY2c3WDRkcDdOMVUwZUdV?=
 =?utf-8?B?K1NLZUlZUDRxOVdyL3RkU3NYdkJqMkhUYU1QRGZrN1B4Nkg1NjBDTG5SUDh0?=
 =?utf-8?B?eDE1NjVQR2VUcW1tL2RhYzBtZEF2TWFGbWdiL2dyanZXUXZjSUxrZHpRQUpE?=
 =?utf-8?B?d0hTeXpUdmdGaW9JZXFnWjdnVzZuY04zQUsrWHU1MW9mazBZTXBTR0tXZTVZ?=
 =?utf-8?B?MCtMWGVCTUNDU0pibFFyWDNFbHZ2TWRpWDBEOVpWSEg4S0RzTFFRVDlyRkw1?=
 =?utf-8?B?c1kyREd0enlZVy9pQUN4Vk4xMDZNd2VZOVltMDQyaUx1eUcyRlc3MjN5ZW84?=
 =?utf-8?B?U25lSGRuQ0Q1dnhZZm1ORGROZTBDT0lYenkvK0FqTzg4aUdjbWZLTGFncENj?=
 =?utf-8?B?MURNZVJqSGRiZUVEcGhhdzNoVDVlYUY0R3JvbVRGdGFzMU1TczlGb1krMytp?=
 =?utf-8?B?cU1aR3JpeThoOW5oQ3J3TTBEeS9YZTZsRGIwYUhYNEJLRW5kNzZZa256VFVs?=
 =?utf-8?B?ZUVrMUFBL2hIOUxKNHBaTE53NmNlSXh1czVZQlJPT0wyZnRMNTNjUktNeUVU?=
 =?utf-8?B?UEUza3FheTRlTFRBOHYvbkNGR3JRbmRvcUZvNGhTejlRUFBKaWM1cUYzdjkr?=
 =?utf-8?B?U0JtMG1TWUhiMFpuZS9GUDRTTWZnNlBnNFpzeXlUcUNSeGE1T1pNNWpmRnBw?=
 =?utf-8?B?QnBrU0c0MlIrUnZIVEFBUHFiTUNaTDN2akYrNXJNTkNyQk9lSklobncydE1m?=
 =?utf-8?B?REhvZWwzNVdYdlVKTE9OODRzdjRJK2pnY1NzbUFVOG5pL0ZMTU13QXYvMmVJ?=
 =?utf-8?B?QjU5STFKZmhKeG1qNmxUbW8rcXNvM1ZWUXJUS09GVkdKU3dGVTFhN1QybGh1?=
 =?utf-8?B?QTRUU1U0OC9pbiszTlZXTlRndjN5MURXbjRGdnFjWldwYllBTVJZbmgzc2xw?=
 =?utf-8?B?Z1F2alRSUnBjaEJLSDV4L0dHK0Q3ZWZTYjJ4NEJCR2ZRUm9IdVdPUzJoWWUz?=
 =?utf-8?B?WmZhQUUzVEcwK0VJQ1dwUks3OTk1V283aGxEWWs2c00yUkxVdnorM2w1WDBz?=
 =?utf-8?B?QTYyVXRSWS9XelUzSnZUUG9YeDFrbC8rOFo5L1J0SE4wZmtQNC9TN0kwSVRF?=
 =?utf-8?B?UndJN0k1MlpwZEtRVHk1aFJQZXZ3UzAyMGpibVlVUVREWHJmUmQ3cnozdnh4?=
 =?utf-8?B?YWVyUlNiTmFGSVRIaTAxMXRGT3NtR3k4b3p3d0tNRTFaMVk2R2k0UEwzYitK?=
 =?utf-8?B?enc1V2NseFhLeTR6SEpTWlpQcjJ4MS9pR0pzNkp4di9VaG5waTBGNkJpNGNa?=
 =?utf-8?B?SmZub2xSbTFCQmJCVS9DVFp1OTZEU1hsZ1crSTJZU2g2UHA3U2FBMEQ1WWFk?=
 =?utf-8?B?M2I5YzFGSlcxbTBLUWhVNUMySWNvSnc4Z3NsYjY4RTVkc3VvaWQ2RTVPVWVa?=
 =?utf-8?B?c1lYaHlDUHh5dy9GV3BQbmhGbXI4OUNDZUFIMTZSYlhRaW1RTk5aSlFWNjVu?=
 =?utf-8?B?NnZaNDIvSm9NNmRnbThJUUlYTjVabmNVaStxVmFMTnhNbkpsYjBwN05Ma0tT?=
 =?utf-8?B?b3lpWXNuZUNCNGdheGtIa2REL1BuSVdNVmRBR3Ywa0poUzliRmZXeXN6d0FM?=
 =?utf-8?B?d3NHSzc2SDZuLy9xSnVtODdSbEI2NXh1cnVKUk56Yk4zMVdoZEcwNlRuQTl2?=
 =?utf-8?B?WGZqS3lDQ2V0ZGk2YjZRL2RsS21tVVZkN1pGcG5JWU44MTZ5bXBPbTBaYjRl?=
 =?utf-8?B?UEdNMnpsY2l0THJCajJVWmptUkhuWERELytZQWg1UUxBVUNGeHRyY3QzN2xR?=
 =?utf-8?B?d0t4QmlLZGp5Zy9iQzFMbi9DS0ZyMmlvVmNZSi9FTzZHNUxTa2xZMFE3QTBV?=
 =?utf-8?B?cllobThZQTlqT2JRVC9zWk95SHF6cWo2eC8xVkJzR20yOXNPRXRsZ3Z6bXZZ?=
 =?utf-8?B?OWRkVjhFaWpQdVdTQzN2cFhEQytuWFRNNk5ycEtKci94S0RWUGltaWpaRHZV?=
 =?utf-8?B?cUI2U2Vpd0dKVFZIYU51YmFxbFBMdmQwMkgrMDVvQ2NVekJRK1VBdTZnZXVt?=
 =?utf-8?B?SC9zbWpEZGhGYXZGV1BmRUZ1YzFNUm9aT2x0NzRUNEdMdGJ5VUgxM21WcWFk?=
 =?utf-8?Q?nk3V12ifNq7/s3wb7oLYNFEatcgn/938y1PbVjvOcj+Nj?=
X-MS-Exchange-AntiSpam-MessageData-1: hneCl7Q8PZJCFuP2dzprK5VlWpWlz8nTo/Q=
X-Exchange-RoutingPolicyChecked: 
	uBd/WH1Q3ICLk/3tRZ1C0sfPJgCtmff63YYx2YAucCVyZaB26bVtRiJ1cc9Hy9wNGi/wLg+0OYImbWAB1Irt5y2BP6jsmNdgccZ21ShHfJyLKoJu3p1O5sC5hXlnEMynnEG/2MaLKgp8PI9HIKkfAkYsuip5ndgFX4gIrl2RpeFpqM6qZE/6JMTPszT/HgXnJYPTYGUC9bMk9+9LSO87GDsoKDSiIfwlDlc3jpEGcu+QT0SQ4ndUXASdO0ZFsrNto1yGMLCUPLmWJC0sYH0oFEn1xTttkGhIY6dGvxQCVEKlpyKToNOuvZcjVrKwnyhz6NOtPA7fabgLaMaS37Miuw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a20dad8-83cd-4e5c-4c97-08df0d0c57e8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 18:17:58.1018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oBYENJPV5XGJ5gC6RnfhbZAY6tsmYD39yma9nsDiUCzOTFuY9IeHXfNdB3Zg9OpidgCKY6HkF8DF0w1jPOSkHuDo3o2cp4VEkkT0myQUX6U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHAPR11MB9653
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=E+v9Y6dl c=1 sm=1 tr=0 ts=6a9effdb cx=c_pps
 a=BLvYkjn5u0YClySNKAgoiw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=Q4-j1AaZAAAA:8 a=F6eiEn81Q8WjbQRv4JkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: PIYiYfKMLzKko0J1JWlOogUZERgmdqGb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDIwMyBTYWx0ZWRfX/gU+VP4gq0N1
 5rWvBHpKteJDgyF/a4gz83l49dESlNuowLwqq2oeLWpfS2+aUtaKEvZWsFFbaIXgiLv1TvCrXVz
 RQ3L3s53cw8AFdZ96di/wsExQLEmMebOJDIvWhZnVDRZBQqkGIvM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDIwMyBTYWx0ZWRfX+W1Lejg7gvM4
 D0uAY+DD9e4Ff9zN3oIbWko6Dh4rax/U3Ln9SMXe1YmiEYl81P5BR9l+tkjmSkCr5ntAj5VqVkS
 K5o7JympDxNJiOikwBzv2yxFG4qWqAlNa8WThgZUJJ6t63Y/yksdshvxNRML26P5kL3hnhYvjvO
 RokqwBZZuTaOLVb2/OWO5B+2eH+tfPn+829LYaWnb1pCHeJDKDymVahLvGrp64B3Wl3ZSsUuFGN
 6BAtI4xILGvygymJYEZLKPQnV4WEG6LqHCRo9rtmHHpFCsV/+N+LXyUJoxEOJVLwsWvu6Rh84Xj
 LCagQOcJswnBwSJzLB6ZQLjiO60KSWeuitCLZqgVjnNPPVJHGjY6VEqCqnMOa9fkmIVOik8QPJD
 bpRC0HBvY9tIc/xzuabM2ZCK9IN6fjAnRWK9ZtWB9Ul8BY6lG7szJqtDdtxPZfZ+FXkpYIvzb9j
 dlzrR2jTFqk8o5HfpYw==
X-Proofpoint-GUID: Sy5OH9bm8VM9AKkMhxWnsWZYRINO0gDY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_05,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070203
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 687HOGUD425605
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 18:18:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245303


On 27-08-2026 11:01 pm, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Fri, 2026-08-21 at 14:25 +0530, Sadineni, Harish via lists.openembed=
ded.org wrote:
>> Even though the script filename includes ${RUST_TARGET_SYS}, for
>> multilib SDKs both the 32-bit and 64-bit scripts end up in the same
>> environment-setup  directory.
>>
>> The SDK's environment-sourcing logic sources every '*.sh' file in
>> that directory, so both scripts get sourced regardless of which
>> target you're building for. Since 'CARGO_TARGET_<TRIPLE>_RUSTFLAGS'
>> and 'CARGO_BUILD_TARGET' are set unconditionally in each script,
>> whichever one is sourced last wins and that can silently override the
>> 32-bit settings with the 64-bit ones (or vice versa). That's what
>> causes the 32-bit Cargo build to fail.
> Ok, can you point me to which "environment-sourcing logic" we're taking
> about? Is this in the test code or within the SDK itself. I suspect we
> should be fixing that issue...

Hi Richard,

toolchain-scripts.bbclass is responsible for generating the=20
environment-setup-* files for the SDK, and
the generated script includes logic (in toolchain_shared_env_script())=20
that sources every .sh file in the
environment-setup.d/ directory (both under $OECORE_TARGET_SYSROOT and=20
$OECORE_NATIVE_SYSROOT).


https://git.openembedded.org/openembedded-core/tree/meta/classes-recipe/t=
oolchain-scripts.bbclass#n164

>> Putting each script in a target-specific subdirectory (environment-
>> setup.d/${TARGET_SYS}/) ensures only the script matching the selected
>> target gets sourced, so the two configurations no longer clobber each
>> other.
>>
> Perhaps. I'd like to avoid the complexity if we can so I'd like to
> understand more about where this is happening.

This is happening with multilib enabled, do_testsdk & In sdk 32-bit=20
cargo build fails because of this issue.

I've got another implementation this can be fixed with a if condition=20
based on target arch instead of a subdirectory.
New approach is below with this we can also drop "[PATCH v2 2/3]=20
toolchain-scripts: source target-specific environment setup scripts"

--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -58,9 +58,13 @@ do_install () {
 =C2=A0 =C2=A0 =C2=A0RUST_TARGET_TRIPLE=3D`echo ${RUST_TARGET_SYS} | tr '=
[:lower:]'=20
'[:upper:]' | sed 's/-/_/g'`
 =C2=A0 =C2=A0 =C2=A0cat <<- EOF > "${RUST_ENV_SETUP_SH}"
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export=20
CARGO_TARGET_${RUST_TARGET_TRIPLE}_RUSTFLAGS=3D"--sysroot=3D\$OECORE_TARG=
ET_SYSROOT/usr=20
-C link-arg=3D--sysroot=3D\$OECORE_TARGET_SYSROOT"
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export CARGO_BUILD_TARGET=3D"${RUST_TARGET_SY=
S}"
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export=20
RUST_TARGET_PATH=3D"\$OECORE_NATIVE_SYSROOT/usr/lib/${TARGET_SYS}/rustlib=
"
+=20
LIB_PATH=3D"\$OECORE_TARGET_SYSROOT/usr/${baselib}/rustlib/${RUST_TARGET_=
SYS}/lib"
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export=20
CARGO_TARGET_${RUST_TARGET_TRIPLE}_RUSTFLAGS=3D"--sysroot=3D\$OECORE_TARG=
ET_SYSROOT/usr=20
-C link-arg=3D--sysroot=3D\$OECORE_TARGET_SYSROOT -L \$LIB_PATH"
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ "\$OECORE_TARGET_ARCH" =3D "${TARGET_ARC=
H}" ]; then
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0export RUST_TARGET_SYS_VALUE=3D=
"${RUST_TARGET_SYS}"
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0export CARGO_BUILD_TARGET=3D"${=
RUST_TARGET_SYS}"
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0export=20
RUST_TARGET_PATH=3D"\$OECORE_NATIVE_SYSROOT/usr/lib/${TARGET_SYS}/rustlib=
"
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 EOF

 =C2=A0 =C2=A0 =C2=A0chown -R root.root ${D}

If this fine?, i will send a v3.

Thanks,
Harish

>
> Cheers,
>
> Richard

