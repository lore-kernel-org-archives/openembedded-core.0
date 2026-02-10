Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57235EA8109
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 12:20:54 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18368.1770726039149600524
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 04:20:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=TBsZkE+3;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=TBsZkE+3;
 spf=pass (domain: arm.com, ip: 52.101.70.51, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Ua2KhQIy+vh8aKsBQYq0hNj/CyRdepzSXVg2DnVfy4L+bO8cv2z2qAfNGSFIbvF9chhMERKXwzJao20Js9B+wBAGEDEZzTXsd6y1dY9fHkkq/txzTjdBSXdJ1G/Ez7zRgKaLfkWJgxAv/NSz27fjnXoL7y9z+PhOVgiyFogmtioMucWSExWo4u/1X8hs7bfsVy6dBHmbaNZdQv2ZWh7tc7FqmcrHetqzmZkMKhtjO3ZMxg7rdF1GPyJpGuWJ7lwX/8cr7IAzgcbUp2MaLV+Q5eJiHWd8feJ7y+pTyzGvZxwk7lpi8BoYeeybeGV/WV6FumXSX8l5tUew+P1EC/iAxw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fQUwhRJZZmogmJ0NUrfs3NhyAHFyXHj/dusdH3RuB+I=;
 b=hknWXqjNk39ch8o5eIPiLG+gSnW7qaVDAtzqmW+i/TR/8cl28YIi/prnYaDyMw6qkN/kkHXM/GyCneSfQPguh+XkW+DLfTkSQR9ZyTQUk0vT+vbMCLRw2HjbJXIhSEgqNXbfX8MhDfkcJFeWXe7XoywsXiwyeIDAmNl25WRfb72tyXFPb/VxDZgjlXPaieOtNSfXrjAOPleRV1Vz/eyNfb2CQk6qnUIn8YV4tea6B0b1MenEuvdcgGCHOJpLg3AIkAOaQddCKZqkGWPhQOdFwDtMEjiIrpqa2qGfDBpLZllG3azuYTnwZlFF/hNfv99iIdJ0hhz4steIcXG43p+i/g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fQUwhRJZZmogmJ0NUrfs3NhyAHFyXHj/dusdH3RuB+I=;
 b=TBsZkE+3wPAbWH9ieyKBBsYs9Y0G/QmTy61uH1+Aqdttz6gbsbVPiQh0DbkccyHiKnSmV7qZkBIVgLWJBodGNkSUhFmJXqvSIuUCxCM6dNDJvIKVRfPzArfLWsbS3Wp/4v5jczcTlVfNbnyRWQZj7wWiVTS8wTwQBnphGC+1iu8=
Received: from DU7PR01CA0017.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::19) by AS2PR08MB10156.eurprd08.prod.outlook.com
 (2603:10a6:20b:64e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 12:20:32 +0000
Received: from DU2PEPF00028D0F.eurprd03.prod.outlook.com
 (2603:10a6:10:50f:cafe::8d) by DU7PR01CA0017.outlook.office365.com
 (2603:10a6:10:50f::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.20 via Frontend Transport; Tue,
 10 Feb 2026 12:20:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D0F.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Tue, 10 Feb 2026 12:20:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UCN4mw70XRY/YqNsPR7p0hUK3TqmzvRhEe74Z6eZNaP74km6ZwNH/LNuDiFnGf9Q8dmBrJfQ0BUvbnzGKRURM/S4RP87beK2meKsrLYYU0wM54K4FfSw+xZ6z0Vxlc8oNoM2A5mp8lGGtsIWsZ9PyehZAjHlu0WAc9oyDzIWq9ekqxVzBw0ollpdgzLDAuO1+aj6/xMbdNEq5krhZ8306/GHRuJyizHiyFPWNv4G7yUB1VnzCXmxoK4NwUI3f8YEJsrCvNJl6kgGP/hhkqpsbTUHUsdqvFFOS4rEMCmXEEk7rJlBV7PYpLYXLR85Yn7fDKNk7HT/XNHM8LJgvB+kJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fQUwhRJZZmogmJ0NUrfs3NhyAHFyXHj/dusdH3RuB+I=;
 b=hGrpAvl/XTiRG8ylW1VRyttxK366b6SMLe5pGI4RpKpfYYlSZXJnXAfE7Y2JGYpRO86x8lEzwbjduyy2oGc29xHEhwGpFrrWJ1ELXezRGQst2Eoc3tLdtCIzWdor/i2ffSo7giSegg4fMzhYDpsiBZK31bIbZhDPov+JPRk6A1HpS3zhRBnNYP9uTqoOxYHp7Jp1bWYKInMZsythgRbIntSud03uut9tgG3Wced9yuFHt9pUpylxoYDq7e+62s1Ta4hy9pZWITQbO6eqdRNF05eBy1ne9h1e9YCBqQbhr04817YAaDpap+IXfpqLMtorIPtvUDjJcOiPex5HCMppdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fQUwhRJZZmogmJ0NUrfs3NhyAHFyXHj/dusdH3RuB+I=;
 b=TBsZkE+3wPAbWH9ieyKBBsYs9Y0G/QmTy61uH1+Aqdttz6gbsbVPiQh0DbkccyHiKnSmV7qZkBIVgLWJBodGNkSUhFmJXqvSIuUCxCM6dNDJvIKVRfPzArfLWsbS3Wp/4v5jczcTlVfNbnyRWQZj7wWiVTS8wTwQBnphGC+1iu8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB10289.eurprd08.prod.outlook.com (2603:10a6:20b:636::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Tue, 10 Feb
 2026 12:19:29 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 12:19:28 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "stondo@gmail.com" <stondo@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "stefano.tondo.ext@siemens.com"
	<stefano.tondo.ext@siemens.com>, "peter.marko@siemens.com"
	<peter.marko@siemens.com>, "adrian.freihofer@siemens.com"
	<adrian.freihofer@siemens.com>, Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [OE-core] [PATCH v4] spdx30_tasks: Add concluded license support
 with SPDX_CONCLUDED_LICENSE
Thread-Topic: [OE-core] [PATCH v4] spdx30_tasks: Add concluded license support
 with SPDX_CONCLUDED_LICENSE
Thread-Index: AQHcgAGtrFd/o8sTPkyrQ7DRTjTn/7V8DvEA
Date: Tue, 10 Feb 2026 12:19:28 +0000
Message-ID: <96B2C029-D85F-4114-8C01-4BCCD7B999E1@arm.com>
References: <20260106112557.53709-1-stondo@gmail.com>
 <20260107181541.141957-1-stondo@gmail.com>
In-Reply-To: <20260107181541.141957-1-stondo@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB10289:EE_|DU2PEPF00028D0F:EE_|AS2PR08MB10156:EE_
X-MS-Office365-Filtering-Correlation-Id: 138ddf58-485d-4e0d-b452-08de689ec93d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?b3hIWTRkL2xmRUFUZnN6TlFMbEVUUXFGY3NlY0RXTjAwYzNCT1VPMklQOVVv?=
 =?utf-8?B?Uk40S01kOVFFbHZZejZCbUhObTBrZDNwaHd5OGJJTnJ6TjZ6NmtXNEtZL0Fs?=
 =?utf-8?B?WUZmWnpaU1VVbmVlSlpqWEFoT0U3M0J2VVN0T25FSjJTODNYTWZVMGNhOWZQ?=
 =?utf-8?B?L2hOWUMySHh6KzJSblB0TVc5WFNCdUNPSVBYT21Ra3FQaExua2cyTS9WTGtx?=
 =?utf-8?B?WXR3SUh2cUZ3Nlo0TExMS0JYclkyU21DNmUwMVEvbU5RNmEzbmptM2xlWWxY?=
 =?utf-8?B?cmZjM05OcEs3REVmb3dLUm1aSVIxcFFNNzVsTTQzQ08xUFEyNFFzcTF2UGxm?=
 =?utf-8?B?VGlLNHpRaDdKRTJMb0VBNlJPWmV1MHY4MHI1bHJkWTg1Qll4YlBZeVdsTmZy?=
 =?utf-8?B?Vm0weGwrQ05jd0V0cHRnYmVtcURIdmJFczRwMGdod2xIaHdGZU9mN2JBQmVl?=
 =?utf-8?B?clNickJ6NnVpL2R2UHAvSDlucENOS0dRQjU0c0ZBNVZVMTN4emJHeXFSWlNi?=
 =?utf-8?B?Sm44LzN4b05rOFA3TStYdmNjME93dlNoRkR6T3UyOWg0bll2TEpycFNlUVQv?=
 =?utf-8?B?YnVPdnlnd082VU9rMkJLdjJGK3JDYW9kTzg4bnF0TXVJQTFMUDVaUTk4UEha?=
 =?utf-8?B?d21udXh5YWQwbzZQL0pSVWt0OWJuWjQreCs4cWNzV1RHNmU2U3F6MXJDb1A5?=
 =?utf-8?B?OE1qT3lKcE5wMTR1ZzdYRlZMV0hyOXlsa0t0TXd3L296VzI0dXJQaStrR2Z2?=
 =?utf-8?B?RUVMRHg1c3Zic09kSmpiRjBXTmcvQjRYUU01aUJXSktHNHpibjRQS3hFcWpo?=
 =?utf-8?B?MWZjcGthaDkxT2djLzhBSmUxZU9rcDNWZW5WRko5eFRCdW4xSmZ6U3Jwcmtz?=
 =?utf-8?B?TCtpMEQvc2tnS2VLUzFZY1FqMzNMSit2SVM4VkwrdFE2SEY0VE8rdEpqQ1A4?=
 =?utf-8?B?Rkg3ZkhQVG5LcFZPNkNNUllBNDFhR3lqWUdkVDNwV1c2OFhKdjJZMVd2M2ph?=
 =?utf-8?B?RllIMVpBWEc1WE9EQ3pxd2JCWVNoY2IzVVcwdC9BOEZxcUVaT2wvT3RzRTFO?=
 =?utf-8?B?bmZpcUpDK1hwYWdqNDBMNkdFV1dnUnhZQjVzNEszYytBQkE1a2RQV1JHQlVU?=
 =?utf-8?B?ZzFGajgralZlU1FUNUM4UWdsRnhtcG5UTnE2L1ZXVEdGRTZINWtITm5QdkY1?=
 =?utf-8?B?NU43dllnK1ZhYVdEZnRobXFOVWVxSVRRbFJDSS9kV1Q2UGduS3ZMeks0eHhv?=
 =?utf-8?B?MGNBa0U3QXVLRVdmU3hhTTVQS29EUmE5K3ZEQWJSZXVhZWd0TjFNNElmUXcx?=
 =?utf-8?B?dTQ4UitRQndZcjh0NklhNlZ2NVFQVjY5aTZKWHptYzZiVmxUSWtBZFFoemhY?=
 =?utf-8?B?ekwrVTRvbUlvV1VCTFd4Ni85dEYrSVVra0RhWjFpeUFnQWZiTHVDb0hhYmQ2?=
 =?utf-8?B?N3A4eFNPUUZVaXNZa2ZXVDhadUZnRXhEUk5HeHlMNFZKRFRIOEZ6NVlja3JV?=
 =?utf-8?B?OXNhdHI5RWl4emZDTHNTdVNiN3JxR0ZJVHdKYWY0aU1FS0E5ZC9ZMTJUU29D?=
 =?utf-8?B?a1JUVXkrZWpXSy8rQXN3dEdGOU5PeWhHZ2pHdXFTVzV3VjErT05pd2xEMDNn?=
 =?utf-8?B?bjh6WE9MSXA5bGczY21oWGE4SkRQMUdIT3l3WlkvZzBjSlFCY29YMjB6QTVi?=
 =?utf-8?B?Q2pUcW5wcVhJRXRjQjNnQVoxU1VTMmZpdWt1dVdwM1ZYa3lVMHA1K2FBbS82?=
 =?utf-8?B?WkRSMW8xZVAzVTliYngzMFZsS1E0UkNicDlnbGdPbXVZWmJRQy9INTNQRXBx?=
 =?utf-8?B?YnBtRjlZVnQ3dldVS1Y1aFVnRGliazlIRU93YjhGYmovRC9GelFyQXpuNzVM?=
 =?utf-8?B?MVhUcXZmVkJndk9kNXpSOEVMRU5VQXZSYlRZdXE3NS9OS2o5bTRwWHIrVkpt?=
 =?utf-8?B?QlhlMzZrZ2d3VFl2UUZHTG1IeVA1bEl0dzJwNzlRNm5Kbzh0UTMrS1hOUGVy?=
 =?utf-8?B?OEhnbkxkY211K1ZDMmxXQWE1Q3NJSXJ6clQ4TERwZjVUMCt3MHJJQVhKV0pP?=
 =?utf-8?B?YUExUXZPWjFvZnordGNudm8yNjBuS29tZFgvTXZvc0ZGeHcxdVJ0VFhSRzFR?=
 =?utf-8?B?b3NUVmJydDBIbVU1VTRKMGZrTEZHSWt3MW83VkZpbWFrSG9ESEpkbnFmL2lp?=
 =?utf-8?Q?uJPJbYMEQZknz1307/Wy7qo=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5F5423B6E7EB2840A8F0101B9B3B5B2A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10289
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D0F.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	397f9193-faa5-4999-73cd-08de689ea36c
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|35042699022|82310400026|376014|14060799003|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VTNVTkEzb08wUVJQc21kVU5ia2pPT2duQnVaUVNkVzZuWjYxb00wWW9CTG1i?=
 =?utf-8?B?RnNXRHRISmZUVFBQYmFyRWFLbmtyeHcwRy9xS2pRWUFiQWR0QzM4ejNxWXV1?=
 =?utf-8?B?aklNdUJ1Z3d0MTM5K2JBOUpwcW1kajVtK1RCL1NaZTVlVW9qVDFhSkozR04z?=
 =?utf-8?B?SUQ3YnBqWGV0U0EzUFROWWNuZHFuUUVCeVJFSC9adkc0Mit5YnluWUh4eVRX?=
 =?utf-8?B?SDFpdUxDWjRMczN6QkVrTkFhNW0ycWxBbEpHZHhia1JNbHJZQkJuaFpKRW9l?=
 =?utf-8?B?TVhrWTRxSmp4Qmo5bGpRc055NDJhckQwREhaNkpjOFhEbmlDUGpEZWFuTXpz?=
 =?utf-8?B?RTloSXJhR2ZBOU91YjEzR2JobmhiSlBKQ2lPZGVNenp3RVpucFhnbVBmLzJm?=
 =?utf-8?B?T2kycEFaWDFidUorUzlKazJUTXBobi9pVTgvSDFLc1I0R3Z3em9NOEg2WFVC?=
 =?utf-8?B?QXdKbTNTTno1cHRmVlpkZXpnZlVsczRXdWtNZ3RicWVzR0FZQU9ydWRUc3RB?=
 =?utf-8?B?LzUyVkRZaSt1eE5EbUduV3c5Q2MzSnRqUEVxb0dSbzliY0VFeEFRWXR4Wmw2?=
 =?utf-8?B?WDFqcHBxamt3dm9tWE5nczUrOS9GWkpyV3VBaXYvT2FKSlpmaVFXTHBXV1Rk?=
 =?utf-8?B?N0kzMzhEeVhXdXBlMU9FY3hIQVJuT0dEMWUzcHpnTDZWL2FlWTNCNVdZQ2VK?=
 =?utf-8?B?eVVCekprSFdrZmRhQU9oc2M3NmFLT1BXR0kyYzI3cnNDRWQ1VVp5MGcyTlNh?=
 =?utf-8?B?a2szRUZEVUxXYmkrQWk2Vnk4djIxaDIwNzFrRitqYUphSmVLR3dwL0pMQ2lh?=
 =?utf-8?B?ZHJLdTh5T2xoRnVwZnJEOWg1Y0JKT1NjVW5rTmRtRWk4UUg0RXFxc0o3d292?=
 =?utf-8?B?MTRBb1AzcGhrMGZXR0tZby9zemxxQnFQeFFuOURxUU8zeXBYTXdHVmtxbE1y?=
 =?utf-8?B?Q1JqSjNnNmtVR0lvRHl4bFJOSnVYODg5MGhRWGo3NWw3SjMyRVdYaEVVQWFV?=
 =?utf-8?B?VURXVnFVV1NlNzIvZ3kwT0JtQU5BNFBITzRTamh2MU1WLzRUOXR5R1hNd0E3?=
 =?utf-8?B?T2d3TS9EVXVCcjJ3Z3Yva1ZLUS8wNktKVEFrdjMyc2RnZmRjb29vSDlnZHFC?=
 =?utf-8?B?aTROVVhsTU8yb0N5anpQZlgyWW1nbzlqdUdCc2gyeTA2Sm8vL1ZpZXpGbFkx?=
 =?utf-8?B?UW11Y05xa0ZmdnR6M1AvOHpodXJhWVhOck5xcDVCbHFRaGJ3NldaeFJQSnU1?=
 =?utf-8?B?OWRYSUtsM3BuaGFYZlJ2QkNqbWtDSzFocnZmTExXY2lmZHJjeDJaM2ZhRlJz?=
 =?utf-8?B?WjU2ZVNtUk54czZ2MTV5eSt6Yk1XejBBUUNLRDExK1lwaFVDZm5YL0xJWWRJ?=
 =?utf-8?B?SVN6Z3VYQ3U0ZVpEd3RhcndYNjNraUczNVFzaFE5ZDQvUk5ZcEl6MThZd0RY?=
 =?utf-8?B?WlNFUTJpZzBPMG9LUFlldFVDWmUyQmVIVzJZUk42NzhJREw0YkZybldMYktJ?=
 =?utf-8?B?Zk1aVlVSdGVWK3h6NjlwYWlpNVQxSHVvQk5KbTRLalZBWlZvYi9pSWVxbmZ4?=
 =?utf-8?B?SzB5WWhRK2tscG55NWhBZ0ZZZm5jcXhlVnVRRGdDL0w2bVlDWG9Dem00ME9W?=
 =?utf-8?B?aG1DTUZmZHczbitUcVZZV1dUSncyeGlkR0d4ZDd0bXIzbW9vV2Rzb1kvRkN0?=
 =?utf-8?B?bEdWN2hwa2Z3Ly9wbWRKTDgyL1VoeUVGZVRqclJ6RDY4QnFSVG1HV1BOaUJB?=
 =?utf-8?B?ZDZtbWlPTDkra2RmNTA5ZTVwNnkvdS9HVGp6VDYrQ0FXRXNsdS9DaiswWTE3?=
 =?utf-8?B?RlJBNWliSkMvUE9pd0pYVzhDUlM5L2hDWURnTzR4VTZpLzgzdkUyTEJNVVVj?=
 =?utf-8?B?cjl3ZWJ1dFpZVzVad1hvYkp1R0xyMXAwQy9UUlEyTWRsV0Q5cXVzMXg1czVv?=
 =?utf-8?B?TUgweHQzU0UwSHJxeE9qemZEWGhKVWRBVHJ3MkN6QXI1dGpKM2tNVkY0WTR3?=
 =?utf-8?B?bnpSeWpqUlUvZnRXMElrU3V1TFVjZXVPWjE5Qysyay85elErTldsWXVRSlcz?=
 =?utf-8?B?NHEyOXd3aGRnQklpL3RXTm9nQmRoSUxJdjlaUjVaT2wyOWJpd1BkV2JyL2F5?=
 =?utf-8?B?VEdxaU54NzNNU0Y3ZzE3dFpISXZrdkJsOHJhUzdqZG9KbS95Q1lmczVKamRq?=
 =?utf-8?B?RFhQd3RZaTlXMWpVTlJkY2VMWDVQSVpiTHpoTVVYSHpHSHJrc0lMY0k4ODFu?=
 =?utf-8?B?cy9VbGgzcWlzY25wbXdGOVJvZXRnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(82310400026)(376014)(14060799003)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	HhCg4WEYZ3umzEk9uCs1FPoBN6oqtVljGp4xWRR76kulFzxjdsqSvSrMVggNqWChaWoD3ycUZ2E+Svusvr+flp58aGx6VuAQ5NqlK22mljjd1xmY2BZYX79vO3PkI7Knf1WCFLCfMyZG/5TK7so6KDfhIeUOYYpGYh22C5L3sf2nPoSWrCArFVeHs57RT44N3sYvQoSP2mPeobW/8mBO0TtuachVheEUYQ+fq0xKL56udb9GzyTsapHkZCYxxw6AzTBXAtT6gK5TJddR3LqGiqcTlF9ajkNm8tmmNOYjduIbFOhLUHMYlJunLY429nkrYnxcZjv0ZGzhzbMRfBwOEH8K6dQt+PEIcrAf7w3rNQp1orrdfOwbsRpQqJjSkliL0I2HkHg+EQTmpPWOpOMo8TO4aOwC+5ZgYwlKOZ7yWaRvMtZC3gJcvfIYemWWNQXV
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 12:20:32.2529
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 138ddf58-485d-4e0d-b452-08de689ec93d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D0F.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10156
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 12:20:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230892

SGkgU3RlZmFubywNCg0KPiBPbiA3IEphbiAyMDI2LCBhdCAxODoxNSwgU3RlZmFubyBUb25kbyB2
aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8c3RvbmRvPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnPiB3cm90ZToNCj4gQWRkIGhhc0NvbmNsdWRlZExpY2Vuc2UgcmVsYXRpb25zaGlw
IHRvIFNCT00gcGFja2FnZXMgd2l0aCBzdXBwb3J0IGZvcg0KPiBtYW51YWwgbGljZW5zZSBjb25j
bHVzaW9uIG92ZXJyaWRlIHZpYSBTUERYX0NPTkNMVURFRF9MSUNFTlNFIHZhcmlhYmxlLg0KPiAN
Cj4gVGhlIGNvbmNsdWRlZCBsaWNlbnNlIHJlcHJlc2VudHMgdGhlIGxpY2Vuc2UgZGV0ZXJtaW5h
dGlvbiBhZnRlciBtYW51YWwNCj4gb3IgZXh0ZXJuYWwgbGljZW5zZSBhbmFseXNpcy4gVGhpcyBz
aG91bGQgYmUgc2V0IG1hbnVhbGx5IGluIHJlY2lwZXMgb3INCj4gbGF5ZXJzIHdoZW46DQo+IA0K
PiAxLiBNYW51YWwgbGljZW5zZSByZXZpZXcgaWRlbnRpZmllcyBkaWZmZXJlbmNlcyBmcm9tIHRo
ZSBkZWNsYXJlZCBMSUNFTlNFDQo+IDIuIEV4dGVybmFsIGxpY2Vuc2Ugc2Nhbm5pbmcgdG9vbHMg
ZGV0ZWN0IGFkZGl0aW9uYWwgbGljZW5zZSBpbmZvcm1hdGlvbg0KPiAzLiBMZWdhbCByZXZpZXcg
Y29uY2x1ZGVzIGEgZGlmZmVyZW50IGxpY2Vuc2UgYXBwbGllcw0KPiANCj4gVGhlIGhhc0NvbmNs
dWRlZExpY2Vuc2UgcmVsYXRpb25zaGlwIGlzIE9OTFkgYWRkZWQgdG8gdGhlIFNCT00gd2hlbg0K
PiBTUERYX0NPTkNMVURFRF9MSUNFTlNFIGlzIGV4cGxpY2l0bHkgc2V0LiBXaGVuIHVuc2V0IG9y
IGVtcHR5LCBubw0KPiBjb25jbHVkZWQgbGljZW5zZSBpcyBpbmNsdWRlZCBpbiB0aGUgU0JPTSwg
Y29ycmVjdGx5IGluZGljYXRpbmcgdGhhdA0KPiBubyBsaWNlbnNlIGFuYWx5c2lzIHdhcyBwZXJm
b3JtZWQgKHBlciBTUERYIHNlbWFudGljcykuDQoNCkNvdWxkIHlvdSBhZGQgYSB0ZXN0IGNhc2Ug
dG8gb2VxYSB0byB0aGlzLCBzbyB0aGF0IHdlIGtub3cgdGhlIGNvbmRpdGlvbmFsIGJlaGF2aW91
ciBkb2VzbuKAmXQgY2hhbmdlIG9yIGJyZWFrPw0KDQpUaGFua3MNClJvc3M=

