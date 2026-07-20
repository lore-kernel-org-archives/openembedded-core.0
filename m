Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E95BC4451B
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 06:04:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2946.1784527449513931182
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jul 2026 23:04:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fXnI5Kas;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1661409e31=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K5FPEs3697149
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 06:04:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=uK+GzMbbUhkzzG+Jw+UP+Jjp/xcPs9U3gWsbEzp4s3o=; b=
	fXnI5KasRVHlCvBxazh9sbYVvEup5bvyTNL539AxRVuVAGSFQRTMfRdkRVubpHG0
	ZK7rxBNZ0SrqQsplLKI/wU4x9z1qBibJqNE45rIvJoo9MFEY9MuGlWX66lQxIPWF
	l8ddmvgMun2hCS7c2vQbbWmjUslOdrFXcJjXTAXpTvWFJyycueQ6wb8+r63DeQMw
	2GDgmWrrjBh36MuszHBkn2z8R74S+AC7dA4VVEzjgBbkKW5mEVidbPudjvgHs2cM
	0TOuVVyq+Or0w5CSVQy9E4Q+1OPE/gaTOvGwi0Tebzd8L8chRnNT7zD0j/ZMmPOa
	zfMgetg/BZNIzsq1ApCiSA==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010051.outbound.protection.outlook.com [40.93.198.51])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fga8x1fxc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Jul 2026 06:04:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PMQQUq9P4dlpDmup9m7hZYm3Lixc+uUkLL1cut8Elr28bK0WeazLNOWw6ygepHA8/t9h0yJvO6ZsXZHYBs12Wuj9Wqx0mo3e5B01W3NBeNVXirIEGfFN6ae3g4Z1+0FhR4dJHKOiRLvDyzWhIWH6ULDQ8FhfNFmB09CoUVDJD9gurP18pX9LbKhvOQunc+eDMyUG5Sy+RtoO0s0C9R41+ArVR5+zg8rtVcpkgGPlg9ZjdyBz3OzMqR+kwwCgQburPhog7qFIg2gkBC/QdlOknPgonyWe399GvFU9zggR0luy1eyDRjcs0R9SbcGcNZL/fMoA7PeB6xfxbBUc6WZsIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uK+GzMbbUhkzzG+Jw+UP+Jjp/xcPs9U3gWsbEzp4s3o=;
 b=DDSdO4ZaL+bKVnj40b80eYzSDpiw8ottuPGWFY11B4oAUsdmLddLjPDBNIzO/gKSTn1/WT8YiDGNutN2nPn/eBtyRwc9BbOhb6P9Y9leFrj2vTB50H6muCfr0aPMrinb2rz8O83a0RtFUjuJQBjw729omLhoYWKfuZPrOnefAspOS8wOnZBOMcX7QESeD0EuBrbOa2u5OwHf6yPqIBXwjO/gkXBJZomwwOoWlTmDtUwvjIJJLzl5Us08bo0IFDOT5Xq/heu6063XPwXmXofjVGUh1an3eYviHJqBVAabNqJezjlWQFQYugWRy8Wl1CjO1KESN96SGrc4hw02PbrN9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DM4PR11MB5325.namprd11.prod.outlook.com (2603:10b6:5:390::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.15; Mon, 20 Jul
 2026 06:04:05 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 06:04:05 +0000
Message-ID: <ed5831c1-386c-4463-8ff2-74a660fef088@windriver.com>
Date: Mon, 20 Jul 2026 11:33:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][PATCH] binutils: Add CVE-2025-69646 to
 "CVE:" tag
To: Yoann Congal <yoann.congal@smile.fr>, paul@pbarker.dev,
        openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
References: <20260706090659.2543025-1-Harish.Sadineni@windriver.com>
 <d9b4dfb530a0898fd230ad6da09ee7bf90dd063a.camel@pbarker.dev>
 <DK2FFQBSC7HA.15XI81YMBOZY@smile.fr>
Content-Language: en-US
From: Harish Sadineni <Harish.Sadineni@windriver.com>
In-Reply-To: <DK2FFQBSC7HA.15XI81YMBOZY@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0073.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::6) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DM4PR11MB5325:EE_
X-MS-Office365-Filtering-Correlation-Id: 6109d1b0-4988-4f33-bf78-08dee624b442
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|56012099006|10067099003|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	Z5LRhblaDe1bhsy6mAgb5zXybjpbjfvpWM3dtHSFK2ugvWWvF9vXN8cbKGcBocZVdv0JD3J2T78b7PwY6ymxGNBYJWMJciJki5AawffViiMW8uhv5h8Yqyas6QHupPlselM9F1d5++QQya/tFxtFZqkdJdXN3RKQAIgt1vKSnkwjTb1PNTJgpPWbF4ZcumrJrtMRKW9bt8+fjaTKOL/8T7vld0e/kDuUhYbmX35+8f1dN3EWRHAbl7QZJ5W1nyyAzdEWj3mOmuZBf4MCexMtk0j86huUfemGtQHUqjVgLJlrBKIiXDbHrAQwpfaUxjAp3RwOwSQE7quQ1bgS6tPQfWmeE4gHyyJBA0BWKUmT4OzCCEzwkPx8aikHHyDwR4zxDDvDkqwfm+pHA19Hbr96eiCLMPK9QxbKj6WujLucXChv3isclKFg5ZFrAyB1jRuAGqVG55Z3XARURtzSkoK3+1vXuP2iHJBcNKQlrsdBtP3cGp8Nv/4YymjkH/wHB8nlNdzVOclfZi5vbcEn9vzRvaCJ7akULqDzzAseie4RinUe7/rkBum++hbgd2QPGr+es4Y0Siz8sh//0pW6uwa1Wb0kiQ1qMTEgXDzwgV/kh0I=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SURWTzFnQUpMK0MzaHNDaTcyM2QwRHl2V0k5NkJsVVkwRmZBWjVCSE9XYnh5?=
 =?utf-8?B?cUUwTnVVNVFJYkgxZGo3VXBQRWRYZkJFM2hMWmYxd3BQeWptYktXM3pWdzBt?=
 =?utf-8?B?U1NOYzJzUXZaSUJWMVZ5R1p3TEMvUXhrckpuSHoxVHJkRW1xZ2VvN3RpSXdO?=
 =?utf-8?B?NkZoaFVTWUczdnY1TkxJVUl1RWZVRTg1ajRMMlBsbUdtZ1orWlUxa2FQYlpJ?=
 =?utf-8?B?OW1uR2dUcDQwNHJ3bFNLdkltKytkMEd2bndDbXQwTGJKUy9zbkVkTG1sdmo1?=
 =?utf-8?B?U1dTM2g1dTk1N3Z3YkZrTHZuRGNUQkU2dVBLcjg5NTV6UjFoK0JWZlpBVCtK?=
 =?utf-8?B?Q0hLZ3VlL1RCUHdkZUg3RVVGRVNuMEVXMXBhT0Q0RzMvdXlKT1Y1akVKUU1D?=
 =?utf-8?B?YlhDOGxhamxlamltYVlNN1JCdmVIclg3YXM0N1FTOG9KYUFoU2ZoTzR5LzVT?=
 =?utf-8?B?QnpmditFVFRSSkxvMXo4QllNZ1hScm94OEpJWThRZzA4dEUyamV3bXlabVgx?=
 =?utf-8?B?enRUSjhzNmtuRG5BUndQT2Qyc2hXeTVDUUlWdlFvRGQxZGdTSEJIUkxEZTNS?=
 =?utf-8?B?TFVxZUZrdTRDK016N1RrS0p1L1c3WnB3dUR4TVUyZHhINU5wTUlPUzZVWHhw?=
 =?utf-8?B?blNIYnNTUWhwaG9WV3ZUQTZEbGEwZ25Gbjd1bnIyU1lMUmRTanM5cHdRTytF?=
 =?utf-8?B?d0k3MTdMTWhRR1NpbTVPTEZmR0cxUEJJazdjb0FrK0VUSGQ3OVdLMTM0N21O?=
 =?utf-8?B?YmxJdjhnTXVPVUkvUmJBdTJmTlR3dTFSOHJzQ2Z1eXg3Yng1aUZCNEJaS0Nm?=
 =?utf-8?B?TjNmU1NXNG9QUXZHQ3k1cXh0emVNV2FickhTR2NpZnozcHgzQnMwbFBzYklF?=
 =?utf-8?B?OG1CYkRXSytiK0wxcWRlU2tKRVZDeExpakFSVnR0bEloRFExL2xqdUNyMkhl?=
 =?utf-8?B?VnBzUEtEdHk2MHNCeU9lRTI0WlpFREkwdG1sMW8yd3l6UzlyVlRVaGtuYnhC?=
 =?utf-8?B?d1l6dzhObVpYNFp3eXJxSHk4aVFFZGdEeHRtNmEzQmJYdmVEQkN4bFByRENW?=
 =?utf-8?B?M3Zva1lCakYrTStIL2F2eGRmaytXaHpGMTFkRnk2dlUvcDhwekhjNmhIT0RP?=
 =?utf-8?B?NzUyb2VUcDRINHNab3NoNDI5NHVhVXJxeUFvcjFKME8ydTUxcnRBU0xybzhm?=
 =?utf-8?B?T1JaWU1RUFd4QUxUV3phQ3p3SFFrRWxxMUF1c1JlRjdLelFHSGdzZmpGNzAr?=
 =?utf-8?B?OFhtTnUvcmI1TGNGYlZ5RkJuTGxjN290OVRHRkZkcEZtaC9LNGJrdEgzTXhy?=
 =?utf-8?B?MDd4bEp3U2N4YjlzU3ZIdW45aXJJdFB3VUJlb2RnV3BXZGRoOWRoVlFnN0pk?=
 =?utf-8?B?UW43dC9KY2xpWEQ5OE9nM0NNWkhUV0VTK0JCMU1ZMTZSM3JwS0lKM0txRmF6?=
 =?utf-8?B?YVYrZHFHcExRVDRJbDZXZWg4ZDA3N21MTEhIeG1wYTIwdlZETmt3MU1pV3ZQ?=
 =?utf-8?B?ZmxIK2dlTTJYSVM1Ymw1cStPbmF0elBTUUk3UjUxTUVkSnAzL3lRMFF3U1FG?=
 =?utf-8?B?ZCt1V21TeUR1RHpIM1dmOVZrU2RmZU9iSHlXT2JoQWcvV2pwbncxRXFBNy8v?=
 =?utf-8?B?Y2dIMm1tTGlOVkRpc0U4MkE1Qzd4cEdQemdvVUdNYVQ1UjFTa1Nad09Da1k5?=
 =?utf-8?B?OERzZGRxd2djWGV1MVdNcmN2VHBNUXdLdzFiditJSitOVXZaQ0tpWHREMHZM?=
 =?utf-8?B?MFk4bTY0blVnUmlZa0grQldkeDFpNzRtREQrSkVrWkZnNzF0THJCb1lXVWVs?=
 =?utf-8?B?QW5jMkFRY0g2NDlaOHRZWGphWnBCcEpOZHp3aExoZHpPUVZSOXRGTFJEdWYw?=
 =?utf-8?B?bXY5V1ZyeDFBSFpwS20rU0pFYTZXNHFhSVYzVnhCcHJ1bVp0cnFuV0xlN1Mz?=
 =?utf-8?B?cXJUMFlzRE0wNmExSUZTY0VUTytsZHdtbGM4S0VBQnphZDZrSjIxZlJDREpT?=
 =?utf-8?B?bFU2ckJIMVVXNXpBVEI3WjBoMGM0UmgyQmZaYnpXV2d0clFwVkRLdjBJbzMr?=
 =?utf-8?B?QVU3OEFuVDZZeHhaNyttYnBhM09iK3B1NVV4c0YyY2xhenFKWitOMGtGaVJj?=
 =?utf-8?B?Y0QrUy9PRU9PMXZ2NDVjdzZJdGM5M3lCUEdKamcwRHRseVpSMXJIZ0c0T255?=
 =?utf-8?B?bGFoZkZEZkJoc1hmZ2JXa0pwMlZKM1dqKzVuNjBDUXpJS1Rqd2tub3AzNlJ5?=
 =?utf-8?B?c253L2pCcE9kSEJ0ck01RHhvdHFIVjN1RzE2ODh2VW80NXV1Qk1wNjFLOWl5?=
 =?utf-8?B?VE1kZ0J3UkVKQy91aXZHZ3hMUFVPVEpqQXlrRk1FY0VzUWRZTGhjdVNWQ2Fa?=
 =?utf-8?Q?hvzaFQp0gl7CgWy4=3D?=
X-Exchange-RoutingPolicyChecked: 
	a9yYQFUYqK9xOg6DjiPFoYgpX5NwIEWahQODJSz3Ks4cm0yMxfyn26mxtl1yc8KBizJ9b95s1fTmrc/nFtXkWjCoTSENKQ3iO4LeVKpvn+jr5eQio4dGudUkekjQMFORE/K2MDls77eiq31N/BnoUHmYOHm50fag9E/Rb8E+9wQgsKzi/mU8cFhfOf6c4uuqP5PV87Zs+MjBAisgIHziG0pvLqZspQQejnqoQXA8A0T6YHQFFdmgS2yXabNNIiB5vdSDYoalFenDNipcerPegGXvTBiJ5fwjjH0jh0SK50kxdZ3OGk6rg/k4MkQQAIBqAp6JArlkgQp43Si3vXqNTw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6109d1b0-4988-4f33-bf78-08dee624b442
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 06:04:05.3810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sYCUtuH/jIfZuUrO7f8KoX3XrV1AmgHBL43UUZfiWVXEdua4wUZsOU8BpjYH4uxkIoUMJ6AWXWqKQvvrM00QVeUcKeAnXehEQlO7PUZUm9I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5325
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA2NSBTYWx0ZWRfX96G2PL6mxvYQ
 TUsDryV7ENDKLIhT1HF2wdEcm1tercPEhcio+DBUlFHWlhjcLDzw4OStvd6um6LKMizQoSHC5Oc
 v8RkE0+oo2vF/tvksXHQPHNmka42pBseHm4KR2wel5fNJHa0a3qw
X-Proofpoint-GUID: DLHN66v4pssrOzOf5xlirchiX30rEedQ
X-Proofpoint-ORIG-GUID: u4XllI2ECJMEwlg5FXXqpVH13EeiKwpN
X-Authority-Analysis: v=2.4 cv=XdO5Co55 c=1 sm=1 tr=0 ts=6a5dba58 cx=c_pps
 a=PojWdYBvulneKNx6glcDcw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=PYnjg3YJAAAA:8 a=CCpqsmhAAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=rhwfdOtkBrv107JmM3MA:9 a=QEXdDO2ut3YA:10 a=ul9cdbp4aOFLsgKbc677:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA2NSBTYWx0ZWRfX4STKZLQIAGIL
 9gMfy6L+CvyLPLfDIYPzyXZECBPjszmjcy6muMzCMQMbXr8oz+lzMeEW13cwpk30SZ1pnpmk2HW
 yaS5iO+EaBh1zHVNcFBbDHx52MsDMxAF3f1Vn/erXnjjB4u03XHvu09tVnM2ZBt1/VyYC9B1DIv
 ccKkSnybgxduHPWBYpZ5ZMrENul7vksxmVVAuE9azKvbyg5LsCQFNhVAOIsBYSH3FttFDiP2RlP
 I/uyUsM+VNCQ+x4GgVAm6CNSr8844lgKGUDGZcWT+IeLlLcVxawXG4MR/5vvb3RMRn7QZaGP6KO
 xTrRd6wJ01ipqF3VJCgCD2EhJlzfSwknkQue7Rj3YCepPwewBsNLMZIf1BbEIkf0vNinl/D4i8n
 kcda2fODsawuqzoZRlsBc2Cyp7jiiaw9ZGTS1pWC3JXc9/YpVMiXGLtfl3oK3pJSFQvSn0X75Gu
 /McLIIRFvLQeW+CJv0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200065
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 06:04:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241324

On 19-07-2026 02:36 pm, Yoann Congal wrote:

> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Tue Jul 14, 2026 at 2:53 PM CEST, Paul Barker via lists.openembedded.org wrote:
>> On Mon, 2026-07-06 at 02:06 -0700, Harish.Sadineni@windriver.com wrote:
>>> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>>>
>>> CVE-2025-69648 was marked as a duplicate of CVE-2025-69646. The
>>> existing patch already fixes the issue associated with both CVEs.
>> Hi Harish,
>>
>> Where was this marked as a duplicate? We need a link to some evidence of
>> this, or at least a more thorough explanation.
> Hello,
>
> FYI, when reviewing this I took the fact that both NVD entries[0][1] point to the
> same patch[2] as proof of duplication (albeit weak).
>
> [0]: https://nvd.nist.gov/vuln/detail/CVE-2025-69648
> [1]: https://nvd.nist.gov/vuln/detail/CVE-2025-69646
> [2]: https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=598704a00cbac5e85c2bedd363357b5bf6fcee33
Hi Paul, Yoann,

Here's more concrete evidence of the duplication:

Bugzilla bug 33641 (assigned CVE-2025-69648) has been resolved as a 
duplicate of bug 33638 (assigned CVE-2025-69646):

https://sourceware.org/bugzilla/show_bug.cgi?id=33641

Do you want me to send a v2 with this info added to the commit message, 
or is this sufficient as-is?

Thanks,
Harish
>
> Regards,
> --
> Yoann Congal
> Smile ECS
>

