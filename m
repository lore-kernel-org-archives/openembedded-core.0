Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 781D4C83F25
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 09:03:32 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.16])
 by mx.groups.io with SMTP id smtpd.web10.7886.1753175007781890020
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 02:03:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=lK1c4M8h;
 spf=pass (domain: cherry.de, ip: 52.101.83.16, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vyNKrC30SrruhiJpSRqAowkTBt3A6nCMnz6/0XKz1t+p+ehuJwkx9f84pqmr272SlpIuV1z5P02asCQRNcaYDmY/LrMLSLePuu6SVHynyogQSl0h3B3E/eT+3OGXze54BFpbzeW1LYIOOXWg4ky0Dkb1c2AghC1lAohbgD47pnWkGnvFeWGKaH6goIc45j3HpjA4LiMPUy2pp90GNRiGxekqlDA0NJqQLtEvxkiTdFl8S6nxtkBAdC9KOdTSKFMhSMUG4SiTFfN3jTVby4dnaUCBxItLGd5hSjnc6JAiZTmjrSVV4k8rX018MtH0G0xcb8mIL+BNMMJXxW4QHsqIbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RDNDmpzBrbi6LUt3P1wcxjxqLsP/hTS+hMDtcBugiSo=;
 b=pgUOO6hCaKodmPDNTKTaVOPXHUD2hTDVschY6Vb0a9WaGGvy2fvM9M83vUTHk+HRcsufCCGs0XaHVkNQcEQ4Tlhn9CjgKBotgY2iUClcES2SiyvbNfk0XAGs9CRU6zBKXQWJJgm+jnTauCvKFWI5uUdTbFeyki9nWkC3cLt1QfCPMyFGNxdp+KuAidKfAi84v/Tp4YNubAZxiZTHXyiR9QTD7h/Lxkl1isMl91XlDoqNtX67WyTXEHBXFTu5BNZ+LaUtRvpg93XuM0qeMwI8R0nUflEjqe5PbRSfpVGEbsgiettjh+PHfVbMIv2O8WBWBZ6SY2sQClMjM1ajtfisPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RDNDmpzBrbi6LUt3P1wcxjxqLsP/hTS+hMDtcBugiSo=;
 b=lK1c4M8hAbMvosCqf+jOH4sVjHQ04nn6I+PQCOCp+tOucNluyanGb9MYRNSv+WAmV6B7ceSqQ23jmtxcIesEOJzF6WvFJqKp16/vVpPuVdKUzLtXQHTTlHS2dHVUBopgW/2XCYWw1qNhBgj73no+b+tvAeSsYP8Jmx02P886yoc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DB8PR04MB6986.eurprd04.prod.outlook.com (2603:10a6:10:116::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 09:03:22 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%4]) with mapi id 15.20.8943.029; Tue, 22 Jul 2025
 09:03:22 +0000
Message-ID: <c8adee80-e7b1-47e7-b0c9-11b256dda694@cherry.de>
Date: Tue, 22 Jul 2025 11:03:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 4/6] mesa: add asahi to TOOLS when selected in
 PACKAGECONFIG
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Quentin Schulz <foss+yocto@0leil.net>
Cc: openembedded-core@lists.openembedded.org, Markus Volk
 <f_l_k@t-online.de>, Trevor Woerner <twoerner@gmail.com>,
 Ross Burton <ross.burton@arm.com>,
 Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <20250721-mesa-libclc-panfrost-v2-0-f713d0858949@cherry.de>
 <20250721-mesa-libclc-panfrost-v2-4-f713d0858949@cherry.de>
 <7hqzlznxd357u24pob6g7hlriqrniu5v5mjnxd5odouw2udkpr@vww6agvbn7tp>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <7hqzlznxd357u24pob6g7hlriqrniu5v5mjnxd5odouw2udkpr@vww6agvbn7tp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0005.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::28) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DB8PR04MB6986:EE_
X-MS-Office365-Filtering-Correlation-Id: 79bf6673-1788-42f7-49eb-08ddc8fe9bdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RGd0UFAySzZyQzBOV0lhYUt6UTZPdENpb29yWGpRckQraGFLR2pZZk1hQUpE?=
 =?utf-8?B?UEdlWDBjcEhYSFJPTEh6aHhFY0paKzZaaTVDcVJvL2ZpbUZQVVZxdmFTbzZ2?=
 =?utf-8?B?UGk2SUR5Z0xHRy9XYmNoZW5EUG5paHJwRGtha21mQk9sQ1U1cHBzWk1sR21J?=
 =?utf-8?B?L0lKbVhtMXpXSzNCZE5CdXAwNFg3bFMrUDFlSWpMM0JrWXRGUFQzQkwxc203?=
 =?utf-8?B?dW1Xejh3dWhtMExmK3ZiV1Q0QWlhbVNpdjdwZmoyaDdHdkM1THVDZ2NHblJ4?=
 =?utf-8?B?alhmWnpOQVRXSlJxb0NpWk4wa09qbTdsU0QwZklyUk9SaWovUktLbnRrcmVU?=
 =?utf-8?B?WXdjdmMvY0tUaUFYQlVZbTlqZTl2QVZoUUZDZXVhRmNYS2JnNUdRRG5vM3dT?=
 =?utf-8?B?K1djVjRobC8vWG1xb0RqMENhQ2VoNjhwbU5Yalp3MXpsMnlUcEE1WjFQSnEz?=
 =?utf-8?B?cmxxSm4zdGdSNFhxdEVpMCtqRVd2dlV2OCtIdzVjenI1VXNSUTl6c05oN0NV?=
 =?utf-8?B?WUFlUWpQVVcwcmNYTThqN1lGcE1PNTk0RUVPbHRFcm5ybTl4cGZ2c3ExWVRB?=
 =?utf-8?B?MkR1MmpsTVFFYVV5Wmcwd2ZyQWdFOGYxaDhuQmVhby9tTFZHcHp6cFZaZ0pk?=
 =?utf-8?B?Z1puVzUxdkhKQVVUUzVndGozVEYwdFQ3VFpnQ2NzOFBqMi9kUEJEbWFaN2JS?=
 =?utf-8?B?LzUyV0JxZlFBSFRkUXRIQ1RVMytOOE1oZzgrT0tZcVFBeEQxMWI2c2hzZFd2?=
 =?utf-8?B?emRVRUlFVlM4ZUZXTGRYOWowUXF6SGpiRStUWFlvcUdKNFA4aE8rUStUTVdh?=
 =?utf-8?B?ZjQvTlplSEptZGdCdUhIaEEvUXdNcFl6d2dqNWpKemhyQ0QrWkdvMVA3b005?=
 =?utf-8?B?S2FNcHRRUkdHSlQvcXI0bDUzUFphZkhsc25pZzdYMTE1YllsMnkza0VmdVhl?=
 =?utf-8?B?THViaGFKM0wrWTNUM1RYdFdCR1B2eDJYYTFCSWJFaTRKQzNFaEpkNVlRUlBC?=
 =?utf-8?B?Rms2dXR2KzJJbDRsdFFKaUdDU1VhejNyNHZyYVYxbFNlakFzQ0RpbWRmTzZa?=
 =?utf-8?B?enRleEJLOXFnaHRIb3JmRjJpT2hkQi9PN21jUVNNeUFITWMrVVhmZGFmWjM3?=
 =?utf-8?B?RmFJNnpKejJkN2N0WWNKa1JCaTNOK3pacGxHK2JtL3JYT3YrQUxXWkhybHBX?=
 =?utf-8?B?cTVDK2JNTXR5SmJ3WXhxRC9aUys4dEtDUk8wT3VkZUlyOUVjVGZTNXEvMVVB?=
 =?utf-8?B?VU05ZkladjU1ZmtEdm85UGErZUJZN1EwY2ozMGZDS3F0VGpXUGtQSEFkK3pZ?=
 =?utf-8?B?OEJpaU1XaUVrZGFhWmd3eXArd2JzdzhObGI0eHNBRXZWdDJWMFEwY1AxdEJy?=
 =?utf-8?B?RSs5WkF6NkdQVXFRUE8xNmE1Q0pDN2FUT1hlRkFuVVNLOFFySDRVbThqT1kx?=
 =?utf-8?B?b3M3VlFoNnIrQ2pjU1hNME50ZkxVcC9SY2xiUFNiUXN5QUhrMGFCT3FkSEJR?=
 =?utf-8?B?ck53VEFkSEp5Nm83KzhFTEhqbzJrSjdPbjRiR1BOOTJMQzNvVWtDMEFUcUdY?=
 =?utf-8?B?ZTNaK0hTdzdManVLR29uSVV4ZXh2OTBYTkpvdXI0TjZlOE5OWlVhYXpDY1dP?=
 =?utf-8?B?QnJsQmJmanBvd3lETkM5QklhSUsrakZhL1JyTlVybnlqTFcyWVA2VjVoQ2Zj?=
 =?utf-8?B?OGhDTHVubDNUQ1ZmOVZFN2tldWxWN3dhc1lxbFE1R3VVRDdNOURvSHB1Nys3?=
 =?utf-8?B?MWg2R2xPTlhBdU5BRFV1NGliazc5UHpyTy9kaU13c04zbzFXZDlWRGdGVnFG?=
 =?utf-8?Q?aMVJ9bHVT+CFUTg3p70NPXnWnDxxSC1inJv3o=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RkFBRmx4b3ROSGt3WHk1WUpjdHhRUFJNbzUzbm02Q25ScTNhc2FjK2ptMjB1?=
 =?utf-8?B?QU9UTnd4VVVIWFRUSXF4QXo4enhrdjd2R2IrVDZoVXp3REZjZ1hsdnlUV3ky?=
 =?utf-8?B?NVltUlV3QWFkYlA3UlpVTE9ZZHM0RENYeUliUFRkaUE4dklXbTdibEZRaUY1?=
 =?utf-8?B?Q1U5UFJiMUVwZmdYREdDTjVZSFloM1U1T0RVNHRQQXJrOG91YzNZN0VJSzc5?=
 =?utf-8?B?aVdWbW5GMHRwN1FRUkdKWmQ5QlBDZGxDQ1JKeTJHdTVoVUZDRXQrWEhJNWRL?=
 =?utf-8?B?YjFRYk5keVZmQy9KeThtS2dFbHpjYkF4M0d3M1FwTjBXeXZoYi85S2JIMnNx?=
 =?utf-8?B?UWZsMXhCbVlpajdlQ0c4Vnc5U3Y4N0RCQ0FpaUp2YjhJTXYyS0FrN2czSko5?=
 =?utf-8?B?TG40d2FuNFZ2aHM5SnBSSUVJblc4OWt2TjVLdnZJQ2RnSFVLRHhDdXRzMDZN?=
 =?utf-8?B?QVRCMUkyT0JEN2txQWwzeTQwL1pWYXZPU0thUXo0WjUrRXNvVVpDOURJZHhV?=
 =?utf-8?B?NWMyQmxWd3A1a2M0Q1lYU3FJaEF3Z3NKK2l2Z3VEQytiUC9idlVFQ21EQVpl?=
 =?utf-8?B?Q0tHVDlIaDFMMk50U3dhdG9qNWVjSGU1MFpQanV5RjBNM3REZzVia3VVaEdR?=
 =?utf-8?B?RnlGUDBPYTFrcXl2OEpCcEhwRXRYNmdZTnNSTElpbExRcUpUQVA3cXdDR2V1?=
 =?utf-8?B?ckxKSE9wMVg4YXdHNXhReEcyRk80akF0RXp1cjVtWjFlS2xsOGJ5NDdSc0pn?=
 =?utf-8?B?Tm1yNEZQT1VsUWFiRU0yd1p1YmF3dGwrcXgwalA5SFpLUUI5QUVTOEtDM1JY?=
 =?utf-8?B?R01IR3ZXNDhTMGNJSjk0dytjTVlRak95cEcvL3NjVGFLRW5FQ0dDV1BNWlVB?=
 =?utf-8?B?TTJIK2Erc3htZDJnT3NVamNQaVdTdHRMRkRxTHFDNUVHQ0xjajZrcUEwUzFD?=
 =?utf-8?B?QXQzSi9OaDE4bCt2dFU5Y3F4bjJZV2RZMUlQazU1QTQwK1N0bjcyOXhicFVs?=
 =?utf-8?B?MVNQL0pGck1LTHJiRXVPTGt1eGoxSytHWjExd2p6ZFFYdDBFbHVPdEdFdFd0?=
 =?utf-8?B?dzczNlcvYlhVWHFGLytaa2Jac0FHWXBDUXJZcTZyYWJSNm1LYWx0SXdmVHR5?=
 =?utf-8?B?RGZ6YmZwbnpuZmsreDBFTDY5TVRxR0FDdFA0TlZYT2ZGRys0N3pMUTVEcFJF?=
 =?utf-8?B?YzgvY0U0RUc4aExkUTVMRGgzUUEyc1p1eTBtS3JiRnlpRzEwMnZsbjBFRG5C?=
 =?utf-8?B?RGtGczNFT1JJUVhwYlpma0JEaGl6aVFrZVBvUEZVdmNuU2lvVHlibDAyRHhu?=
 =?utf-8?B?NnBLWVpmdFc4cG9oNFRLMjNMVTh2d1NCYUdCLzBHTm8xdENBcUxEWmwxZ0tU?=
 =?utf-8?B?YmdGSmVxNnRmbXFGd2xBNUIrUFFaYVViSWg4QzBPOC9XN2dYK3BhSGVPcXFX?=
 =?utf-8?B?dGU3ZmF4SEtuMWhQamEwZEdXcGJJTGx6dEZ2SExLTmdIWUphZTFDYk8rZTlZ?=
 =?utf-8?B?am5EY2s4WFJIVkNNRERMcllDSlVHUlRhZE45Z0JMbnlZRUcvbTFDV3hYTFVG?=
 =?utf-8?B?MmlwcnN0V1BnZGJFdW4vRFJ6VXJaQmpuRVB4blRoeEZqNENjLzJWNUFlMXQ5?=
 =?utf-8?B?RXNSZXd0dTJuK2NJVHNSTndDM1JZTE5tSjVkOG9HMjVjc2d0MWpOSG0xRzhX?=
 =?utf-8?B?Mi92Q0J2UzA3Wm1HYVYwOWtDcWJUditwOXQ4d0ErNTM3MVlJRUh2L0ZBTVR5?=
 =?utf-8?B?Z3pCM3BFaTRvc0ZnSkY0c1luTXZOSHNpaG84SUFna2laZG1JYWxZWnpDTzIz?=
 =?utf-8?B?NVZoV3hXZ3Y3V3BxV0M4VDBkbVZBWjY5UlZwZHNmbzNXZGpRY1pSVTJOY0hF?=
 =?utf-8?B?WllNZW5NelFwaDJ6Y1lGTWhuWHRzY1NVaklWeSsyNVJadWhaMFFNUHgzenN6?=
 =?utf-8?B?ZlY4b1NsWmdONVdwT0NERFdseVo3U1kvRkszMXdtcGRXTTYzcmtEMGN1U0ov?=
 =?utf-8?B?Qk9RbURtLzRYTEZ6Q1hZaVcvS0hFK1BuSmtNbzlTb3AvRU54YTJvWEhrcW5G?=
 =?utf-8?B?c1c5SVZZQ2lTd0xqMlh0M3Jaa1NlNStlcXlsTmwwVjZzSWlpSmZsOXN5dk5N?=
 =?utf-8?B?eEZBdjRxL21iZ2hQcDJEbE1ydnVBMlAzREZoUXpLdHBkdGV2dEFVWHN2VVJP?=
 =?utf-8?B?Wmc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 79bf6673-1788-42f7-49eb-08ddc8fe9bdf
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 09:03:22.1218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k/DcwZWXoWhDBPV/cId1DOu3VUWoraye0zQuwinSOWhd674P1Hd1l8TknUtovwBWa4ihIL2otqXTBjJvVVEFGhlpPGEqRfpP759YJ+QNUoE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6986
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 09:03:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220729

Hi Dmitry,

On 7/22/25 8:57 AM, Dmitry Baryshkov wrote:
> On Mon, Jul 21, 2025 at 12:33:41PM +0200, Quentin Schulz wrote:
>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>
>> Similarly to panfrost and other PACKAGECONFIG, mesa has tools for asahi.
>> So let's build the tools whenever asked.
>>
>> This will be useful for building asahi_clc precomp-compiler in native
>> mesa for example.
> 
> How? I think asahi_clc isn't controlled by -Dtools=asahi.
> 

asahi_clc is only built if:
- you enable the asahi gallium driver, or
- you enable the asahi vulkan driver, or
- you build the asahi tools,

c.f. 
https://gitlab.freedesktop.org/mesa/mesa/-/blob/mesa-25.1.5/src/asahi/meson.build?ref_type=tags#L12-L17

Cheers,
Quentin

