Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F08ACF649D
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 09:30:10 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.58])
 by mx.groups.io with SMTP id smtpd.web10.50328.1727688603743390125
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Sep 2024 02:30:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=fcD66OYJ;
 spf=pass (domain: cherry.de, ip: 40.107.21.58, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jOujbKF+4y+A8HRra80nt4HQgvflSBMFjlEg71Pq1maXdIS+eyWTKmym/iz0bFCpqBjUPBM9Bu67WPjKwUKvILx+WoAt2DrDjrfDnU5sbNyjNUyEjeuiPGtrkS+XiG9H98ygzhrog9K5dRXrhQoodvhh7YYTOj6eWYgCARD9c/SXJEQAeYjXU5MieSB3yYSD6nLLZ8AaQDXBG60wb9Qq/v0lWjTFguPawVmjnD1E92rT3diKyJlrhyKcZOJKlLuKKdfQhsHJCToFzNYWNDsLXKFfhgDpxRzCJit9C5Jji5qjFJ1PZ7oJdSwobg/WzLnXda20aIekHfXRIkhWdgfhFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aw6M8BSAMoWGGV2CVYVT8YB6Zw68XXNLhsJIo6qsFdk=;
 b=TEb9tPbpjtzf7bPpNCeesZKue3mCtc0RRCwyj3DbeuVcvstcDlX3hVlfyAGFUQd2Zcs0XrQUxMSMmoJA/dtyhMHMh2+UiR5JbbznWF2kx/+xAH9AZKf75Y/5dzPxSchHks2rWUv5lTYexIBJg5JrEgCBUiu/l84dAT3z6TYv9/tv+vkaTQIJxuXHlyjJT0DnUBM7su62hWQLm4lY7VskPxDbOEDZYTK75Jw1Rqev1sW7C/n0GhYG98BEyPU3m7cVP5JCwGKRUkdKq9DGlmXo+c272MgIbekhJjl4srzLPv0ev/f14fgBViCg0CIknEF754W8q385dEiOzQ3HQ3X42w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aw6M8BSAMoWGGV2CVYVT8YB6Zw68XXNLhsJIo6qsFdk=;
 b=fcD66OYJbfwjrP5T5cWFeaOlKSgVQ0WE2ECiCrmYcygVEEkYVZKoxz/DEB0423P4GYtec4b28bZY93zWxFkpmpK1qLwslIbgEsmPtx6prKbEuEN/NQS0At1oR57e8A/xbO2WsvsX1STZtuSaNoVFGy0PM/6lKXdRnHpHuOiEUIg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by PR3PR04MB7468.eurprd04.prod.outlook.com (2603:10a6:102:8d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.20; Mon, 30 Sep
 2024 09:30:00 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%2]) with mapi id 15.20.7918.024; Mon, 30 Sep 2024
 09:30:00 +0000
Message-ID: <d616f905-5ea5-43cc-9c78-13da1d8e93a0@cherry.de>
Date: Mon, 30 Sep 2024 11:29:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [kirkstone][PATCH v2] kmscube: Add patch to fix
 -int-conversion build error
To: purushottam27.kumar@lge.com, openembedded-core@lists.openembedded.org
References: <20240930092336.2400258-1-purushottam27.kumar@lge.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240930092336.2400258-1-purushottam27.kumar@lge.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::20) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|PR3PR04MB7468:EE_
X-MS-Office365-Filtering-Correlation-Id: 900cfeef-9534-45ec-86f5-08dce1327485
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bm9RZytKUEJQWStkV3BXVEtLMWx0eFpHa3lzRlN6TENteDM3RG9rODBTV05E?=
 =?utf-8?B?L3pMRWNMZnVBWFJvVHgxSmh0cTBrTzBSZWtHL29sUURqZVgrSVo2OGMyb0JL?=
 =?utf-8?B?ekpuUEEycEhkSVhqU2VkbmJJd2x0UGdYcm51Q2tRT1prZy93Zkd3UTNET0hj?=
 =?utf-8?B?WTlyVjVBTEtGalFZUUdhRWNldWd6eDdGbVE2b0EvTVN1WDVWTEV1ZjdneGQz?=
 =?utf-8?B?NVRVWWVDZFk5OTdoekNvcElVOXd3M0wxbDBsZTN1bndVWmQrYXRDZnRhZWl3?=
 =?utf-8?B?MmkwbzdtVVZCL0RnZ0I0V3pJYjJkVEZrZ0FpUCtMVWh5SC8weGgycFZwQlNU?=
 =?utf-8?B?d2JReGEwbkVuZW1aZGtURVV5TlNjelpBRmZ5MzNwclhONVVrNjFSOWxqRkZ2?=
 =?utf-8?B?VWt5cFVxUXovMkhTdW01Ujd4cGtDdkNkdGxrb01yQ3NNU2tjRE1rZnlwbUdk?=
 =?utf-8?B?L1BVbCtLa1RrOURNS2NOY292T01RczNQTER5NkdEZUVzMlhkODRvWVRLaUh0?=
 =?utf-8?B?YzhPMTk1L3o1OGwvUVRHaXJaRUNpQ2xLK0htR0UxNXNVZGFFUE1YZTlwRzQ0?=
 =?utf-8?B?aVN2WFdvL1NaWTdBajNMaitXbWduYm5LcjJoWDZYQVdHQ2JJeEo5YTM3NEJk?=
 =?utf-8?B?dDdMSXVNZlc4Nk5qSGt1M1ZMa24xck55TEJ2NkhYNE9NQm1DdGFTN3Z0YWQ1?=
 =?utf-8?B?emNydmRla0MvckV6c1Ewd2tVNDZZVDdlZDl2RnBNcjA2SVJMQ0RFZldtUkJt?=
 =?utf-8?B?a2lNdWl5c29CcGZLVEM1c1hIY00vZGFSR2lrdHJEVTc0Rm1NS1pRb3E0Mjl2?=
 =?utf-8?B?bERQYmN4TXdnMUhRaGF2eDJXMDZoNEd5RHMzdTZWSnpyczR3QVQ0RE10RW9V?=
 =?utf-8?B?Zy9mdGVoRFFsK0VnNVI4NmQ5VjhXRGp2ZldGRWR1Rkp5SmNlTzU2b20rdWZ1?=
 =?utf-8?B?UnpKakhRL2d1bFNlWHRVVG1uQk1UeVd1a0YzdFU3S1BVM25vc0UvZFBVM1cy?=
 =?utf-8?B?eitkKy91b1FZWkZIMWkxV0U0a3JzL2o0dkNLQndqSnJPV0x0UndnWUVlQzAr?=
 =?utf-8?B?aWE3QTFvdDR3WWN0eGRUOHVibzBJSHFzQ3BsbERBVmxCMnRLTm02dExCR3du?=
 =?utf-8?B?WWlWWWF6eW5GVW1ZV2U3akRZRFlOVHQ2ZkZIb09pQm52eFk0akx2QlcyMHV5?=
 =?utf-8?B?d2tCWXFTcWFFVlZVb2loai9oS0VJOGZBdGdUTk9nSTc1YTU4QTJZc1JuYlhs?=
 =?utf-8?B?THczQWFxREpqQkNnUG1DT2J0Ykc4QVNOdDJnVFlleUJxYUFHa3Z0Q25JRXo5?=
 =?utf-8?B?WVd0WUtMRE9mdFZXY3YvUk1pYTNnb2xqeEltaWkzUVc3d2JIRXdaZjgrNXIv?=
 =?utf-8?B?ZnpXbXh3TzhneTM4ckFERXU5SkZVRE94VTdITXRrc20yMDUvZmRUNFhQSkJI?=
 =?utf-8?B?NENWejRyMk40emFUWlJad3h4ZXhaNE50TDZzcjNEakVxUExrQ1diU0VSQ2Fv?=
 =?utf-8?B?SWdRdExsNlE2UmdjVGpPdHBOZnI4azRvR2sxOVpiKy9HdXd5cCtQVEwzK1h3?=
 =?utf-8?B?TWNTWkpsUjRZZ3FTeFJuS1RuMTNrSXFmT0N4dUw2c1plYkFuaE5uWjZ3MGpT?=
 =?utf-8?B?ZVZlYy9uUE9raEh0RUk3dFR1c3NKV216UHcxbUdncStoeXhEWnY0d0RtdG9O?=
 =?utf-8?B?WENoZElXNXg0VTF2Z1kyaWdwakhSQmRNd2Q4RUwyNFlpZ3VWQ3pvZnZRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NzJERmFoWnVRTHU3MmRSbmFxekNDZFgzWVNzSGlIekRoMnpNa1RHTlVSUkF1?=
 =?utf-8?B?RENwb04vQUV4ZDI3RW9lcE1CaXdLQUtyZ0cvZjczSWxuRFlJbjRUWW54V2tu?=
 =?utf-8?B?ZTdRU0VTTml2endXeGFGS3l1emVrQktlZE0xV3ZreXhUdjgwWWxKeG9jbk01?=
 =?utf-8?B?Wk5XSm9hQ0NSR0E0VWlJL1FVZVlUbUZxR215amp0YnhpR1h4T3dma20wdkJm?=
 =?utf-8?B?QzFPcjJueG9tMFlKTkR6WnhyRnNMRDJ0NExENG9sNU4zeXZIU080TTFiVU5n?=
 =?utf-8?B?VEZGVUdiZXk0emxoeStycjEvUmppdkpiMjVkV0ZoTzhlSFEralFEamdmR0Ns?=
 =?utf-8?B?UzlvUUp2RlBGQXhFcHh5NWIzSElwTlFkQW5tUk4xN0RyWHE2eHIrR1IwbEhU?=
 =?utf-8?B?ZHc4WlJBTExBOUd4TUJTZW5RUlY2L0Yyd2hXVVcrdGM4WVNLZFFPVy9nR0hq?=
 =?utf-8?B?Z3ROZU9mMG1BRW9xek43WUViRUp4eGJEajcrT3k0V240ZGJNK0o4R0RNQmkv?=
 =?utf-8?B?Uy94bDhERkNTeUFqVXlTSHZjUWg4WEFUQ2VnbFhBVXZ0Tmo5cGJPSy80M2FI?=
 =?utf-8?B?NmR6SGxVV2hYZ1JwcVBkbE44WU1UcFZRUjFQeCsraHVENEJSSVllVWlqYmo0?=
 =?utf-8?B?VEJTZ2drWjJWM2JIaDk2bjZsb1JyZFZURUJIZ0ovdTZCYWZzNkFYeCtNMzVJ?=
 =?utf-8?B?YlpwMW1XZ3FCMlJXTjk4WWdyT2dIdVNwVnNtZklkbzN1eU9STGh5cTFUUDVM?=
 =?utf-8?B?aCtiYzlFMUhtMGxQS3ZRK1VXNFpnVytYMGxCb1FyS245aTM3cWNXazJVK2lx?=
 =?utf-8?B?UDltNTd1TVBWMGtoclhnamVia1lvVXVpcDVQNGMyVVF3c0VjV0F2U2ZhejJk?=
 =?utf-8?B?SmVWaVcyQWJad2lwN0Zlam5Lcis0c0Z0ZWZCYUp4STcrV0FWZklQM2FTMkxB?=
 =?utf-8?B?cjZlc1VuTmhiUUpUbkNqMFRhTHVuYnlGTUZJa21XblU1K09CVVdmSWk0MkdL?=
 =?utf-8?B?K3JLdnJFTFhZM2d4OGtlem5DRXgxTzJSWDA3emF1QXJ5Z1Uyck11TmVSVThM?=
 =?utf-8?B?NXhhOFNBVlkrN0crOS94QUtzNDgycVcvTmhJQkZaTnFWVlNjMy9JZG1DUDhy?=
 =?utf-8?B?eTRIMHpJNk9QbTdHNVBmc2FDanVKSXl3bktxTFd5ZGVSOFVsQklLQU05alQy?=
 =?utf-8?B?UVV6WmJQS2N0VW5ZUmRSbmdzZjJhVWxYdW95UHFrbGNBN2xLbWZIVEdtdSta?=
 =?utf-8?B?b1ZzWHhrNUZEbnc5M3hNNWY1Q3N1QUkrdEI0cUlEVmhwRGdXZXhQdnZkZGdM?=
 =?utf-8?B?eUMrd3pGWHo0MEVIRXZwVTNaVFBEMmFRMldaMFFBM3pRS1BZRnFwdmcrWU1R?=
 =?utf-8?B?V0E5M3J3c1JSS3RsWWw0TUM1Y1RuWDE5czlPY0xEcjMyeFl1dzFydWJPTTNu?=
 =?utf-8?B?QTZTWnJ6RmJsMzlqRFdoZEhDTHROeTFmN1llSFZMa3pHeDdNc0pscGpuWFZD?=
 =?utf-8?B?T20xcFBrWERyQ2pjbkRIQ1hXNGIyQ0dWaWNHMkErak0reVVVbE5VeGJVUE5Q?=
 =?utf-8?B?MlhHUDVHNktwQ0N5cm5FMmErUkVTc2tzUFFPUC9nOW5xbUdWSWhHeWt3ZS9P?=
 =?utf-8?B?eThRd21NK3FPVXdnaldQWjNBTWwyRVZ3UG9PWm5QbEFqSGsyWDc0dm1vcEph?=
 =?utf-8?B?RSs0L0JjRUVEQ0wxRm9XaHEvRVYvL1U2MUZQbm5FQzFhelN1cGJmNnRENzZn?=
 =?utf-8?B?dmJwL3JyMnB4R0k4amhpRmVMeUdXTzF4czZMbnVtNmhRUGQ1MTRvc1dSWFI5?=
 =?utf-8?B?SzFhU3Y5MTQzcVVMOHNUUUFFT1lYWC9rN3dXQkozV1pFakVGeks5c3M5Tjkr?=
 =?utf-8?B?eTI0dEVta1FJTkZONkVHRWxpMW9KUi81S01rV3BJWmFHRnB3bzVTL21xVlBR?=
 =?utf-8?B?bVJOWGg4ZitVOHl1ZUlLVjJnVjVwTlpaOFpEN3o2T0hMdmhtcnBzY3ZJMXdr?=
 =?utf-8?B?M2sxa1VZRzRPQWJOQW51SmNsamR4b0JTdEFBcGpTRjVFTCtnRk5CaW42VTBV?=
 =?utf-8?B?eEw4UnhyQkVSOGVscklyY3puUUFocW11dXZDeWthSVAxTlJvbDdMVWY0OVRo?=
 =?utf-8?B?eVVqN24zTnBuSGkvVWlMNmFPc0hhc3pxMFJlaXQ2N0I4SW1ZczU5K2JBRkNu?=
 =?utf-8?B?REE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 900cfeef-9534-45ec-86f5-08dce1327485
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 09:30:00.0485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 468nelx5yc31HmRgHS24rf7KrvOUQZASGuQK4MtZX58S122STHrxgIGVf7GqUoqsryhQIhoYu2gFh9S0HF5Z/kBknkLMegakOfQCDglnAIk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7468
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 09:30:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205109

Hi Purushottam,

On 9/30/24 11:23 AM, Purushottam Choudhary via lists.openembedded.org wrote:
> On some platforms, `EGLNativeDisplayType` is an int instead of
> a pointer, in which case the void pointer will raise
> a `-Wint-conversion`.
> 

Please provide an explanation as to why this isn't first contributed to 
master and then backported to kirkstone (the reason we discussed in the 
patch for master branch is enough in my opinion).

Looking good otherwise,
Cheers,
Quentin


