Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A22FFCD37AC
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 10:13:59 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46663.1778494436648471440
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 03:13:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=cIrR+Hj6;
 spf=pass (domain: cherry.de, ip: 52.101.69.52, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AZX5av/FIZsiBANrSoOa/ABb65RgD3xLHoKreKZ1OMfxJaAR+fKx1UF8/cLdweQAg0lxAafOajM8RDGbtz3AMEJa/PzBCHCjQt7pi71QTr8s8E5TzyU/+q/ELPeLgmDysb7i8vS83bzgMP4FmBM8QSnnxGlttSAcEGKgO9WbbjcOEfAKWbPoqPTUxoYnldII+9ZlxoGUBeQvVnT2zXviTjVyH3eUUNssP+W/OQ5UQAeVmrA9S1uE/9FSsFv64fWqXzY0rdMsUXxshnHy+WXs/cXCP1VHLuJpFxXkT3XZ2yNzTEr6DXmLUN7ObEAXQOOqr8vV+Xmh9zsJx+2Bko+rzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=atm3tfe80RUTAaTkyhOWqvwPSXSgpYLUH4XwkMWoD9U=;
 b=kO6bIkvXZ8RttE9fdt4sDrfLY2LKG924Dd/s+krQIi6D+MlrNpVbyP3LreVS5FKOf3CiZ58FLLewNUqR78kKwmUpcAmh4MKhy5pvFJAcK6TePD9cWfxKnZbTUA/b2hus4f22gta4i8V0HbJ5tHFhJlsKfporJzHvP9z40rem0Cv7bWxiO4el2MD3+Fyf9KnrcZYIw8SBnkVBi92Hv+sPYzTylhirV+nH/aGKfLixs2PdB+pOzI/+mTtfOdvVnJzKcAk9J4nDMK1XStBTsnOjGCA1KSJvUP0JWugaooq1FbVuqDlK+4EKKXB5/NPE2qVCrvCFdgamSeVRUhf7mVDzXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=atm3tfe80RUTAaTkyhOWqvwPSXSgpYLUH4XwkMWoD9U=;
 b=cIrR+Hj6FS2F2bXgmj7kQCx+PfoqycK3SkrpIud+I27N8J9DoVGTvW1MQqTix/jyI4nZ3sdHF3jKiHo9AqN7X4NrsqdRed5ZKaSS5qNtgp5zfE6c82AIzAaasg0TUhPDuYM4ECx/Up83n6PFuhhlfZN48w3X2VKoz43N4tRrHZ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by PA1PR04MB10843.eurprd04.prod.outlook.com (2603:10a6:102:480::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 10:13:53 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%3]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 10:13:53 +0000
Message-ID: <0b224214-9916-4ffc-b65e-7387f38ef8f0@cherry.de>
Date: Mon, 11 May 2026 12:13:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V3] gstreamer1.0-plugins-bad: disble vulkan when
 x11/wayland not enabled
To: changqing.li@windriver.com, openembedded-core@lists.openembedded.org
References: <18AD75DB6F7ED930.2939242@lists.openembedded.org>
 <20260509050129.269720-1-changqing.li@windriver.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260509050129.269720-1-changqing.li@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI4PEPF000001C4.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::845) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|PA1PR04MB10843:EE_
X-MS-Office365-Filtering-Correlation-Id: ade7a35d-3b00-4c20-909e-08deaf4600bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	/4PUSXwT7rVomYGrGdTnRYaZy41s1oCA1piJYW33qpBSndr+RtpTIsB6P1Lro4nBTEVEhetw+VU6o48Y5gRelvQu15pR+yF/LcrmVF9CFzQJI73hnZPGl5HXHvA5qF3DZ4kG55uLKO9cfBJk81qUwrRfJDl5bNsMGdP7D9jpToGL3pvk4dQweWrJKRg0ifP7+SZg2mtzwRL5QgiFmS7ctcgZ9k+S40BdktmnRra6T6fI0wHiSapO/CQ3LFaW/a1LFj1txoziAjT3mSDqvMKtqqASc2RV+9w25xDSw+53dk9z1Tzx2k4shrmcxeHZs9MRT+9AJZ5Z/NEoiaXl2u3E+sLTvu2/ggtCskBjH2LULFrrHx0EPJj6NumyR2wKQEZ7ZwE/LvyGpDGu41/h0Qqe9jDBXJ4ijMGgGnXRYE1wccy9b9fni76YVVnHAepvzb64v3gT4hnm3PvqrUcE4op0pryx/tZeRA+2291v8RhICgO6ayyceJO2kqYPz0jKT37k6tYFgQ6DgzV10134243pdrf+lW4k9c+CkBBZ2NZfvK7C7w9NWzIJq65teIz6e+mgCFPgttkrAG3optBquCPMOfZnhQ8F3jHOYiFZ0r8lSXliIFYpcsax44yEkYqMd2bCyhc7Xa4ZXAPoHPjb/rxfax+7itddeGsabgZ/FK1nyu12DtE5JV5UJOv8wqes5DE2
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bytDQUEyeXNLaDNZemRXeGt6blMraFlzSmNsWm93blBsbEdOblI3aUVvcVJs?=
 =?utf-8?B?WTFCNzBKM0xpVGUrOXdCcW02dUlxY0R6YWFlczQ4NFpHWFBiWHVXZFlOQy9F?=
 =?utf-8?B?blF3L0h0WUd4R29WTzJ4NGNheWE2bmZyRGtya0E1d0tCT2kya2oyMDhPdEZp?=
 =?utf-8?B?d2k4N0RFVCtSSlp3SzlZQjV3NFlaNHY1YWE1Q2xsR1o0a1VVb1l4b1lBL3R2?=
 =?utf-8?B?VDRndE5Jb2lwUDhyc0ZRUzljbWZreHNUR1RRcmRiY1JZRFpydUdSTG91SnZ4?=
 =?utf-8?B?elNlTW1FaXlzK0N5Z0VjSzh3a3oyY2tNTWlKMVM2V0ZjZHBpamhkaHJHMito?=
 =?utf-8?B?bGx1VVQ5SWIvUmlHb29BSjJNUlZGZVEyOVVraENqTUlCQzBzQmNNSzE4bG5t?=
 =?utf-8?B?WXUxMXVBS214bm1HYTIxZGZhckdTSjM0ZGpGVzdnOVRRc2FQUlJCRnN2S09v?=
 =?utf-8?B?bFJ4M01jcVBYWllZMWdubnhvbWY3a3FlVWpsZUFWeUZTRElid1pQRFFQSjNh?=
 =?utf-8?B?cnN4b3NQbklBRHJPK2FIa1FPRjJkcy9GWVo5bnFMVW1rbU5Wbi82R0ovYVRQ?=
 =?utf-8?B?SnNhVURXUzFUbHFRYU9YZ0dDVElBOVBlUk5TYTdhNDJnNFNKRzlwaC85Q2dY?=
 =?utf-8?B?OXZ0cjhDL1dyYXBma1FJdm1xSmRXOFhkc0hJWFNiWHBYc1c3akhqOHgyc2ZG?=
 =?utf-8?B?SEx1QVphb0UzaUFVYjFmUFFxL3hZTFJHZnB2cWNEN2xpcUVxU0N4WkNRUFpE?=
 =?utf-8?B?djdpd2VVZnBUSWVmTUZEam5Ebm5vMGROOXNtRXQrSnd3V1dpSkJ1RlJmc3Ri?=
 =?utf-8?B?WHI0bVNyU1lKYnBlZDJocW1JL1dEQlJsMlh1V3ZpeGN1U1dXUFRyNVplZ0F5?=
 =?utf-8?B?NS9wRWhKQXJoZ0V0aFhPVU5QUnBwZ3dqNktyU2F3ckhwUWgvNm9JWlhNdTk2?=
 =?utf-8?B?cXh6Y1krMW5rdGxzeStRdzY2U3lQK085eXFZcHJhMzcwZ1NMeHNIb0NoN3Fu?=
 =?utf-8?B?SDU3THRhcHVBak1DUE1hb21Pb0cvVGJoSjl3MTNFWkR5NjJIM1lkeXg0aTJX?=
 =?utf-8?B?UStaRi9KYlpGRnRDdVFpMU1mdFoxL2VyZmI3TytONVNOV3V4REZaelRBTzBW?=
 =?utf-8?B?cVVKTUN2bWF6WTl3WGpheWR5RTAvbURYdlZEN1BXUVVJaWNnbDFETHB6alJC?=
 =?utf-8?B?b3hCeVlsRitmRDNzVnVJaWpic0RMcmxBcDdPejVDQjMwSlhuZm8xVVROK3Jn?=
 =?utf-8?B?eUxoVHFTR2xEbDE1WUlySkhSZjArRnRaNmI5UzlTME9tWnUyOUdlZldsQXA2?=
 =?utf-8?B?UWtRS3M3OUp0VkcvZ0tEdGVOSTJwSHYvMUFmYUdkNzd5Z1FtMThnVCticDd2?=
 =?utf-8?B?eEsrUE8wNEd1S0ljUzQ2VHhyTURyWThXQk9VTEVHUldDU0VGVjZzRStHUjBl?=
 =?utf-8?B?R0hvakNCVUNUUGJpWWIrenVsOVUxcjZGcVpuNjg0WDFXQXdIWkVjOVd1WWlW?=
 =?utf-8?B?UFJuNXJZaEJnMTRpQ281TzhwSzZ2ZDZ5Ykp1ZUtiNGhTUDQ1TXFySVRxUzZj?=
 =?utf-8?B?cTF1MnJ4c1BvOFVKMUNzdXZZSHQ4ZXdQckJ6OHhiWGI3YzVxRjZoUk4xalYy?=
 =?utf-8?B?V0dkRTQvdG9rUjhNYU53WUtnRldiZFY5ai9Lb3F6K21aSTJNZXdtSC9ETi9I?=
 =?utf-8?B?aFhLYW03Nk85NmQ4a0JldWhpaXpjV1RIUGVhRTlKNVZuM3RMR0hxNjdlTUpy?=
 =?utf-8?B?TzVyMUF2cVM2cTdBbkxDbHVNZk0vMVdmNnFDY3hGWHFKWkVyeEg4Z0lMUW5R?=
 =?utf-8?B?Q3JVK3VKL0syWm9yRXVwUm1KWlFLbURZem1FS2dxNnltNDh2VEhROGJ0dDdV?=
 =?utf-8?B?MHkrdkVvNjZmbTJnb0xZanFvOTg5ZDJmSzdXMkNJT25wamtGRitRQ2ttUkxr?=
 =?utf-8?B?OXAvNHVMaFdrTkExYXlNc0dhais3bjd0TnQ3bzgxTVBNU256eE9FOHBjRlhU?=
 =?utf-8?B?UmZScEFQRTR0eWNIVURMNVUzWHdvQmlmVmdYZzEzVGR3NEVkZ0xuZXlmT3E4?=
 =?utf-8?B?SnJNT2xtMXNocEU2WXBoY04rVzJLcnhMdzZRSDdNbi9BbExwRDVOaVhZTHo3?=
 =?utf-8?B?RjR3aGFMYWdtNk1XbExtNmxQTUN1Q0Q1SnBtcVYxU1k2TzJMSWZHMFhXRGU2?=
 =?utf-8?B?d0t2YTdhTTNab2F3eGFWdE1DWENVTXBhRzVnNkFIWFY1VDhhbXcwODlCOFVE?=
 =?utf-8?B?V2RiTExBT2V5d0Q5Y3dCRXBKOXUza2Jsb1Zibk14Ump0STNYT0N3YVBwTlBB?=
 =?utf-8?B?UHFyVlh0b0duVjJiQXlTZGc5NGtNajZhbjVSK2tiU0ZYRzBIVmRTZz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ade7a35d-3b00-4c20-909e-08deaf4600bd
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 10:13:53.0122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uNDbw+GpU/yZLP0LiiNIcTd6PZPvkFNPsY5zQ7i1nO3J2dHfc4rjVhXO7LkovIuUUw9MkaYULA9Em3fuyBXTYw8VHF/SlEVfWU7sIQsE4HM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10843
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 10:13:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236802

Hi Changqing,

On 5/9/26 7:01 AM, Changqing Li via lists.openembedded.org wrote:
> When vulkan is enabled in DISTRO_FEATURES without x11 or wayland,
> do_configure will failed with error:
> gst-libs/gst/vulkan/meson.build:311:4: ERROR: Problem encountered: No Windowing system found. vulkansink will not work
> 
> disable vulkan from PACKAGECONFIG when x11 and wayland is not enabled
> 

Acked-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

