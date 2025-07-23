Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5C08C83F1A
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 15:57:27 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.16])
 by mx.groups.io with SMTP id smtpd.web10.18419.1753286238658121213
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Jul 2025 08:57:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=GFpBZAte;
 spf=pass (domain: siemens.com, ip: 52.101.66.16, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CCfqtz1IjqkXG5h9yCpHCrZlmbf76MICsopTPHEcRERRVHeFrS+3RGqV8cUIYR+Gq0lkzrhXYhOary1O8ik2HDZt4GGST9Zph8SlTWF5fNWmtPi80cCFAEnls23yaAjU0Ma+1x9+jHcPMk/6xXMxpCgPgdOWFAVk+Ez+CwYqXH4Xp5f6A7os69EyoIiGuNo9WmxmCIZLIwNqbcGoKaa1+6NqJbwg88aEmRco6ldvyherMJVkirBx5gGQlIoecJhAsAIeKBrD3sYdr7YWKPVqhM/zyIsn8Db73Y7Ml4W4xWKX3ATBfQecq55b6Eqd2JQDEhNNaEERxjUVdaehR24PYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XzLdfx/z6abHg00M6Ctfw7vjUpBEKaCQWfXP+vRpIOE=;
 b=H3u4HYfJ3StvT4W4bUpE2XkD/U3eXy33rziBLZZICbBVU8utP+0psrqxBmJ+cQGclke/ymLUVJm1c999o38zrEK2J7mnowhTk7HImKHoXsX895UHaYJoj1KDBvqpSjmE2+wsOHwKgVElP5agugUoqntN3b8SDS4ntCbciOUVp1V85doIUO2GNVW8/qEAV16Ai+k1XlN76CNys9JLU5UkPOtpuClplpXE0QYJfhKPpc8IzfDMbtFZBMQwNuL90cHf5lXkhcN2zYm33ZSGMTNUfkPGvt0QuNCCz2qmdDVPqCSw/bpWC5h4GvsYuNjIh878FCpsmq3UXGBrPv7Z57IGZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XzLdfx/z6abHg00M6Ctfw7vjUpBEKaCQWfXP+vRpIOE=;
 b=GFpBZAteB6+NmY7sLt3mFXd43nsUfesQqRNxvJm6cbBmRemGf757BClleWNY2Ym0y8iyFTLgtpQGU7hIHbAaXKAfCv6iBN8nUQpOWyqub2NYwQotaEpnMCpTmGRudyPNnP1mQczTbf8HTKADZNECKw/+YpELk8yIMug/nfRbY8nYbUZJbz+yd4RkumYgp3XRyBYq694QHmJqjPlsB74Kj8O3kRyI29Vs/7bsQB7HSYnRKD8iyJYOoLODo1CF5GMI4NHbWM3CFskZlp9C1nG9nmyCt8IbI2tqnBFQuYPXJvspLsgqY72aOW9dt9fpUJriCvJd225vOiFUijq8awVVJA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS1PR10MB5531.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:476::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 15:57:15 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%7]) with mapi id 15.20.8943.028; Wed, 23 Jul 2025
 15:57:15 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"deepesh.varatharajan@windriver.com" <deepesh.varatharajan@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "Sundeep.Kokkonda@windriver.com" <Sundeep.Kokkonda@windriver.com>
Subject: RE: [OE-core] [PATCH] rust: set CVE_STATUS for CVE-2025-5791
Thread-Topic: [OE-core] [PATCH] rust: set CVE_STATUS for CVE-2025-5791
Thread-Index: AQHb+7+EOnfh2HrlPk2MS0vghMfkTrQ/1y8AgAAFFPA=
Date: Wed, 23 Jul 2025 15:57:15 +0000
Message-ID: 
 <AS1PR10MB56974F5434B447CCE9CFF00EFD5FA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250723104923.1204089-1-Deepesh.Varatharajan@windriver.com>
 <4acc3f53298c69ae7f7fa9b9302a565d9a799af6.camel@linuxfoundation.org>
In-Reply-To: 
 <4acc3f53298c69ae7f7fa9b9302a565d9a799af6.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=cd1c87fc-22ca-4423-8317-2aad839885c6;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-07-23T15:53:06Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS1PR10MB5531:EE_
x-ms-office365-filtering-correlation-id: 41ea0ca5-d04e-41a7-0328-08ddca019834
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?Y1dBYjJlcHJnVFd2bHBQVHMwdXN3Z0N3YUt5MVZ2dldoa085WDNMMVR5Y3lT?=
 =?utf-8?B?MjJSNHMwUHJIWnlYcndENHh0WDVBUXZBWHRYd2RNeUtDQ1BERU5LZm9rSzRT?=
 =?utf-8?B?Z2JUVlVsYkhyZXMwYldxdGhNQ3VoUmxHVnRiNndVY2x4UHFwYUExOFpoUUpG?=
 =?utf-8?B?YThyVkgvTjZLUmRDQkc4N0V2dDZ1ZWs2a2FZMVJCbWZlOXYrQWFTQm9ZREo5?=
 =?utf-8?B?aVJtVEhnVVd6Y2FLMWNHdWk1Rk9WK2pFYjU1Y0tFQ3c2OTNvbWFBMG9zaXJh?=
 =?utf-8?B?Q0FNOEdtMGJuTmJUZ3pDaTRNUHZkN1FoeWZkMFhUa2x6L2VKc0RHdzBRcnRo?=
 =?utf-8?B?Z0VnNG9ybkpQZWZxbEZ5V2dPWUFaNFpMMExnMmtCdHl5M3YvRVgvaEJEQTVI?=
 =?utf-8?B?T281ZzlKbi92TUlaNk5aMFNGeUhPRlJRUmViWXB2UmRVK0hrL3g4KzB6TVZ4?=
 =?utf-8?B?Rnd0YjZ2dHVsSlhQVVU2L1MyblBXeFMzZ056dXVod3BVdlFGWXdUc0JDMGFT?=
 =?utf-8?B?b3ZuOWdab2hZZEJpUmcwbnY5STdVaFJCckErVnN1Mk5yNXZXSUJqaGRJYkxo?=
 =?utf-8?B?V296bmVuQUxKalZ0eHY1RndZK2xxbnBWS1h3K1hwejBjMC9kUTJBMm1iT3B3?=
 =?utf-8?B?WUV3WWlhMW5zYlBiaGU3Z2o4M3RDTXpDNnYwMXRDM0RnbjZDR1RRNGpNMERI?=
 =?utf-8?B?VFUyM3kwUGJadzZoL2ZMdk5UZjZtS0hGNWF6NkpGaGRvWHZiKytIUjBzci9s?=
 =?utf-8?B?d0lWc3FxUnJKRkFWTDJGMzlsaEdBdU9Fa0hvUnZkL3JlemVRSzVMRHhzdFNN?=
 =?utf-8?B?cW5PcFAraGwvQ2RWRnJCdWtNUnZmakozYmc3cnBvaU14S29OQWVWMDY1MXpi?=
 =?utf-8?B?R25UVk1XeU9IVVJJNnlNbGE0ZEF2WFd2NGJwWTdkRTZvN0JyMzk4YzB0REk4?=
 =?utf-8?B?RUltYjNmdncvRmpld1NrdHRCWUxCQ3I5a0xZTU15MFA5dHJTREREQS9VVVd0?=
 =?utf-8?B?WE1NNGRFR2ZCQlB0dGNESGVaK1FDcWM2eWFJcWN4OVA1NGxPSDlVZGtNK3lF?=
 =?utf-8?B?VERjaWRaby8vLzdBZWFwRUM3Yi9DZmd4NUl2aTRiSTg2ZUd0dnozMlRrZEc1?=
 =?utf-8?B?eFk4TVc1OHlxVWEzWTJadjM2ZFRUNXNhUW1sVE5rZ3BOZjhid3JzZFFaNERh?=
 =?utf-8?B?cUlVMjYwS2p6OUpxWTViUlVEcmJ3VGFpTTFDVGJmaXRjeWlzQXVrWENKSEdz?=
 =?utf-8?B?NG9kY3hGUitodEdUd0JZWXF3TEp3YnhoSVQzQWNqU0xaY2JGOW9aS1Q2YTRM?=
 =?utf-8?B?V3MyMXFRUnZ1ajR2aC81Nm5Mbjg5bTNmM2tXd0VUc1pKV3hPUVNkckpPUTFz?=
 =?utf-8?B?RitpNHhoa1RCdGxmTGlCb0V1bExMQWxLZ2N5V0xYL1dCcXdsMlZ4TzJ5Qmp6?=
 =?utf-8?B?cXY2UmJLUFdla0cxMjUreTdmMFN5VWVIQ0RZWmdFUXFqbm9QcFZQbTFjWEUw?=
 =?utf-8?B?YjJueVhkQkNRSngzcURuY3lJTjBDNmhzREFFdEpLVFRvbVhKWmN6dm5NMnZF?=
 =?utf-8?B?WlpBOG5lNWQ4VkNwa2dvTkV6Z052bWh5ZXVhOENmZ0d0VHppbkxNZEh1MkM5?=
 =?utf-8?B?Z0x2VkVRTVVueFJwYWF5VkxnYVlkWU5wUjRJTzR0c3Z4TmpQdHJBUG14cVh6?=
 =?utf-8?B?MVFLZ0JsaThzQXZYVjJ2SU1NYWVhZmdzeVR5a0s2NUplVm5uVkIxU0VLelRI?=
 =?utf-8?B?dGwzSFVUNHFMK2hXV3Q2azFzYW1RalZENmczK2swY2hJUmtaUnFXc3k3WUFY?=
 =?utf-8?B?MEwzSExBM2lEempGcDhBc1NEa2dLelB1QWoxWGFHMk5LQ1pkazlIdUcza2Fy?=
 =?utf-8?B?elNlaGpFQlFoSzMwcFhubGdSeVhKNmswSFlRVE9wMWdrejFtbFo0blFIeTgw?=
 =?utf-8?Q?Uk0W/trm9DI=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cWZIUzB2RU52UmVRTWJwUkUyb0l5WGJ2WWtGMGk3ekcwUGxkRGtaZ3MrUEpN?=
 =?utf-8?B?cFk5RXh6WkdTdC8ycVBibVNjTGVseHdDS1I1RzE4U00wV3hEUlVMOW1paXZC?=
 =?utf-8?B?Q3RlMUVaK2hncmR5S2R6QzJLT2xXbXV1N0ZGR3ZXNHk3L0tGZlhOVUZsb1A4?=
 =?utf-8?B?T2t2N3grU1B4RmZFUmVqM25JNGhRYk1BOCt4OVBtNElqemtFdlhGSHRHSlA1?=
 =?utf-8?B?dUU5MzgwWEd5V3NBNElNRHlKbExwd1JtdnBJMW9Ib2JRekt3cGE5YlR5TlNX?=
 =?utf-8?B?NU1JelowQmVNdVdIL2NveFRZTjZHaFVCS3NzOERPQTBQSVdxdVk0djRjNDdi?=
 =?utf-8?B?U1UzZ0tuOWFLZ1FWRGJMTkFMWXV1MEJYZTYwZUlERTloOHhjVXM5L3dOLzg3?=
 =?utf-8?B?NytGczN6UHdzOU5DRVltd282WTJCL1g1eGdPdmNEUGNkazR5U0JSMXV1L1Bi?=
 =?utf-8?B?aDJGY21jOHB6dkw0K3laQXloaDNsZDdLRytnOUszbDJwRXRnLzZBLzZBRjdY?=
 =?utf-8?B?dW1sTHh4aGZIQ1R1bFM1aDlIYUNUMVUwWnFUcjVGbE9aMWgyd1FBcmtoeERm?=
 =?utf-8?B?RlJ6bzQ5SjAvaGhzeHNwd1dleFZJS3VjT0N2SDJTSHB2S0hqTkNudk9rZC9r?=
 =?utf-8?B?d3E4dldkeFJYZDl4TUhxN3JOQWZHSVBWYUx3RXB4VllzL0FYaEZMcE9HcE1U?=
 =?utf-8?B?UWJmSklNS0ltV1lsTnVuZHBMekVCc3hJNE9GNEo4cG5DR3Faa1NHbFBrUXht?=
 =?utf-8?B?S3RjWUdBL3hBTDJlaXRZempxNHd5UEZIMVN2VjlwZGZTbXNKZ3I5MUkzNHBY?=
 =?utf-8?B?d2NlUTF5Z0lsOFRTVXYzNms1VWlhWURxdVFrQXN4ZGhldm1RbENlYmJ6S1ZY?=
 =?utf-8?B?czV0VXhIYVpVck9lQ0tuaVp1ODFYMXhRaTl4bkhwSVR2Qlk4dlNtUUFmOTc2?=
 =?utf-8?B?bmdOangwTTJPTjFSSjNHYzd2OUt3UTlNR09YbU5PNEpZTDdMM3JZMXlLRXJM?=
 =?utf-8?B?T202bTVrcERrM0R2aFZtUFNxd1JtMjQyYURqU0J2YVQ2Zkg0WEpCMVJvSFEw?=
 =?utf-8?B?aU1sOU1JSnpwM1BCTU5kRWVnL0ZiUFRhaHE3WDNmTlNHUS9MQUJpVmFtdDFN?=
 =?utf-8?B?RmdYcUFWUm5OeWM4SjNGY2VJVDNLN0JJeDRlOW9JMHFhdjQydEIya3AveUNs?=
 =?utf-8?B?RUpsNWpody95ZjV3TWNKN2psNU9LSDlaRDBXODZmK3pMOHgvcmZjaWxiRHA0?=
 =?utf-8?B?eXprWVc5UEZ3dmU3b29FUVhPSGNPNzhWU2RpalREcXE1ZWdCU1cvNEl0ZjJy?=
 =?utf-8?B?WXhpUjhmTHl0dDFScWdhdHFrOFN3RUY1NEZaZ3VEdTFsamRtRGgybUNYdFdW?=
 =?utf-8?B?QUlyL2pKVEl3ZGFIckh1WC94NXJ1OXY4TkZYcHdndGIzdWJVTmpSYkR6ZTZx?=
 =?utf-8?B?VTlMak9SQlZiRTAwcDdBa1A0Tm5BYklaWFd6YlBNOWFtcURiUXpFOGprcFRM?=
 =?utf-8?B?VUVGOW9MbFJ0RTJBdkZjZ2svdEdoeG80ckU1RHJ6S2pLZVNoUzVFMzFMY0Qw?=
 =?utf-8?B?Y3M2RE4zVnp5TGlIb2M4dGJtOGFYOFlsT1pWNS9xckNEd1VzZHM5NzZwaGRB?=
 =?utf-8?B?Z0l0V0xncjVnVjFYUlZTVDFXbjJwWWVxTWpuc25IRXIzS0ZpRUNtTHNMclVN?=
 =?utf-8?B?SDZpdzNpNU9WQ2dGbVVwNnJPT2VxcWJpZWJGeW5VVmdOdVczZG01SFRDM2dp?=
 =?utf-8?B?NU85QlNGQXJqTXdXYlNmbXhRaWxFMG9BRXVNd0pwaFJFRE91Njh6UmJrOG85?=
 =?utf-8?B?UWxUS2wxUGRTdkJWWUpqejkrRTRyOEdqd2x4eXRBVzA4b09WWFo4TkNLbWZF?=
 =?utf-8?B?VEJTaXlOckdRbGMyTmFEWVJWaStuaUljOFRQQU9rYk5BZC9nMjV1WExrdDdh?=
 =?utf-8?B?ajFJRU4rSU10T0Z1K2tOamt5Y2pGOUNYekFtWlpNNElhTG93Ni9WekVWVWx4?=
 =?utf-8?B?bkdLb3ZELzhjems2OFhUc0JQMTh1NEswRTNpTkM1aC9vWFc1YXU5WUVVdVh6?=
 =?utf-8?B?S05qamRSOTFqQUJyWFRtV3pmYUJCNE1TbWRrWi93VFdwTUVBRE1wMkhCTWJu?=
 =?utf-8?Q?Sth8x0GriEogKvQplpJQFIHT9?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 41ea0ca5-d04e-41a7-0328-08ddca019834
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2025 15:57:15.3753
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VvsOga9obSIhHdSXXpC0hGWBX2tsrSAh2zVxjKeAKfBrUtQnvuQo6o63b9ysiipM8s9AmD2qCUTKsfj4SPrrQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5531
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 15:57:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220810

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBSaWNoYXJkIFB1cmRpZSB2aWENCj4gbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZw0KPiBTZW50OiBXZWRuZXNkYXksIEp1bHkgMjMsIDIwMjUgMTc6MzUN
Cj4gVG86IGRlZXBlc2gudmFyYXRoYXJhamFuQHdpbmRyaXZlci5jb207IG9wZW5lbWJlZGRlZC0N
Cj4gY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IENjOiBTdW5kZWVwLktva2tvbmRhQHdp
bmRyaXZlci5jb20NCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0hdIHJ1c3Q6IHNldCBD
VkVfU1RBVFVTIGZvciBDVkUtMjAyNS01NzkxDQo+IA0KPiBPbiBXZWQsIDIwMjUtMDctMjMgYXQg
MDM6NDkgLTA3MDAsIFZhcmF0aGFyYWphbiwgRGVlcGVzaCB2aWENCj4gbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyB3cm90ZToNCj4gPiBGcm9tOiBEZWVwZXNoIFZhcmF0aGFyYWphbiA8RGVlcGVzaC5W
YXJhdGhhcmFqYW5Ad2luZHJpdmVyLmNvbT4NCj4gPg0KPiA+IEFzIHBlciBOVkQsIHRoaXMgQ1ZF
IG9ubHkgYWZmZWN0cyB1c2VycyBjcmF0ZQ0KPiA+IGh0dHBzOi8vbnZkLm5pc3QuZ292L3Z1bG4v
ZGV0YWlsL0NWRS0yMDI1LTU3OTENCj4gPg0KPiA+IFRoZSBDVkUtMjAyNS01NzkxIGFmZmVjdHMg
dGhlIHVzZXJzIGNyYXRlLCB3aGljaCBpcyBub3QgdXNlZA0KPiA+IGluIFBva3kgYnVpbGQuIElu
c3RlYWQsIHdlIHJlbHkgb24gdGhlIHN5c2luZm8gY3JhdGUsIHdoaWNoDQo+ID4gcHJvdmlkZXMg
c2ltaWxhciBmdW5jdGlvbmFsaXR5LiBBcyBjb25maXJtZWQgaW4gUmVkIEhhdCBCdWd6aWxsYQ0K
PiA+IGh0dHBzOi8vYnVnemlsbGEucmVkaGF0LmNvbS9zaG93X2J1Zy5jZ2k/aWQ9MjM3MDAwMSNj
MA0KPiA+DQo+ID4gVGhlIHVwc3RyZWFtIFJ1c3QgYWxzbyBkb2VzIG5vdCBkZXBlbmQgb24gdGhl
IHZ1bG5lcmFibGUgY3JhdGUNCj4gPiBpbnN0ZWFkIHRoZXkgYWxzbyBkZXBlbmRlbnQgb24gc3lz
aW5mbyBjcmF0ZS4gVGhlcmVmb3JlLA0KPiA+IHRoaXMgQ1ZFIGlzIG5vdCBhcHBsaWNhYmxlIHRv
IG91ciBwb2t5IHNvdXJjZXMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBEZWVwZXNoIFZhcmF0
aGFyYWphbiA8RGVlcGVzaC5WYXJhdGhhcmFqYW5Ad2luZHJpdmVyLmNvbT4NCj4gPiAtLS0NCj4g
PiDCoG1ldGEvcmVjaXBlcy1kZXZ0b29scy9ydXN0L3J1c3Qtc291cmNlLmluYyB8IDEgKw0KPiA+
IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1c3QvcnVzdC1zb3VyY2UuaW5jIGIvbWV0YS9yZWNpcGVz
LQ0KPiBkZXZ0b29scy9ydXN0L3J1c3Qtc291cmNlLmluYw0KPiA+IGluZGV4IGVkMTVkOWM3NjMu
LjdlMTAwYjczZDkgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1c3Qv
cnVzdC1zb3VyY2UuaW5jDQo+ID4gKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1c3QvcnVz
dC1zb3VyY2UuaW5jDQo+ID4gQEAgLTIwLDMgKzIwLDQgQEAgVVBTVFJFQU1fQ0hFQ0tfUkVHRVgg
PSAicnVzdGMtDQo+ICg/UDxwdmVyPlxkKyhcLlxkKykrKS1zcmMiDQo+ID4NCj4gPiDCoENWRV9T
VEFUVVNbQ1ZFLTIwMjQtMjQ1NzZdID0gIm5vdC1hcHBsaWNhYmxlLXBsYXRmb3JtOiBJc3N1ZSBv
bmx5IGFwcGxpZXMNCj4gb24gV2luZG93cyINCj4gPiDCoENWRV9TVEFUVVNbQ1ZFLTIwMjQtNDM0
MDJdID0gIm5vdC1hcHBsaWNhYmxlLXBsYXRmb3JtOiBJc3N1ZSBvbmx5IGFwcGxpZXMNCj4gb24g
V2luZG93cyINCj4gPiArQ1ZFX1NUQVRVU1tDVkUtMjAyNS01NzkxXcKgID0gIm5vdC1hcHBsaWNh
YmxlOiBJc3N1ZSBhZmZlY3RzIG9ubHkgdXNlcnMNCj4gY3JhdGUgKFdlIGFyZSBub3QgdXNpbmcg
dXNlcnMgY3JhdGUgaW5zdGVhZCB3ZSB1c2Ugc3lzaW5mbyBjcmF0ZSkiDQo+ID4NCj4gDQo+IA0K
PiBUaGlzIHRocmV3IGEgbG90IG9mIHdhcm5pbmdzIG9uIHRoZSBhdXRvYnVpbGRlciwgZS5nLjoN
Cj4gDQo+IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy92YWxreXJpZS8jL2J1
aWxkZXJzLzQzL2J1aWxkcy8yMDk4DQoNCkNvcnJlY3Qgd291bGQgcHJvYmFibHkgYmUgImNwZS1p
bmNvcnJlY3QiIGZvciB0aGlzIGNhc2UuDQpIb3dldmVyIHNpbmNlIGNwZXMgZm9yIHRoaXMgQ1ZF
IGRvIG5vdCBpbmNsdWRlIHJ1c3QsIHRoaXMgd291bGQgYWxzbyBiZSB3cm9uZy4NCmh0dHBzOi8v
Z2l0aHViLmNvbS9DVkVQcm9qZWN0L2N2ZWxpc3RWNS9ibG9iL21haW4vY3Zlcy8yMDI1LzV4eHgv
Q1ZFLTIwMjUtNTc5MS5qc29uDQpTbyBzZXR0aW5nIENWRV9TVEFUVVMgZm9yIHRoaXMgQ1ZFIGRv
ZXMgbm90IG1ha2Ugc2Vuc2UuDQoNClBldGVyDQoNCj4gDQo+IENoZWVycywNCj4gDQo+IFJpY2hh
cmQNCg==

