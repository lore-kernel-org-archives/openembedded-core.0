Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45076C282EC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 22:47:16 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.69])
 by mx.groups.io with SMTP id smtpd.web11.4504.1742251634709205341
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 15:47:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=RS6Plli9;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=RS6Plli9;
 spf=pass (domain: arm.com, ip: 40.107.241.69, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=VwTZcCFaa/tgRWG0vnr8VePbWLeIBAO9PjFPFgLb5NXmoJcLx17eKcjXvBMzlszuQIJzTKEwempcHKxqCjQpUxUK6F+Nv6LWGZPU9fyr00I7Dyiso4I8apka2oWgfzXpY97shg7YvfvKoDWJJROSAqrc66dMrhMLUNh4U3GOokiCxL9MTwxhMmooSrFQfkZwsL9t8aXa+MGM043uBLyifzxX09KcJexZ1TXR0eNH1ORoJRnGGV/+pEV+SsGHb2gs0T9DPG7m6HcybJY1Uw+pXbfNdU/FHVO11CpqS85Hz5eqH2v7T8nEd3+xNE8U/OvrfdhqG1vkzJPUFdnqYE7/8w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I3Q/NexNwQ8keXYR1IcF9UpabONmpnb+Pe9BWElfL+w=;
 b=XpI1azZHWvYdC7pXs2uehGujYTsq/PtZAh9LhKLAUadGm10R5SaZ6oWWcp3ONDDmBaGUDWoSWBfQVU44FdgYWopwRY3HLesaEsyQ2kwpDOoZSKxY3s0uvoqkm7AiVK0/0KNfaDWbKV+VEnocYQeUIJYaZvmL6R5iIF4v9qV92ze2bzOoBt9u9247Hgio6ubggKJ+2RUOg/5AHWBU4wl59pUwnxEe1vGRuLAmyIm4WhJnvOCLE5bKQ5i0UdUD9uouplGGuGNWSGyVb6dmQ2KPIUQSwetFn0mIOthxrG16HQkh0Qyb0io7Dv8E6N3a/6US3hIZA73PfnIxxAadomAk0A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I3Q/NexNwQ8keXYR1IcF9UpabONmpnb+Pe9BWElfL+w=;
 b=RS6Plli9MBGsDFOxyOjkmWsT7oo84TwEmckxc71rjKvX+OhRvIVrEBSEzCQ9IV0qVB/2xC/BFwVn1Q3B7u7rM1X1VbJqdfnNrj6YIlKjGG5PHTqKI9PuoyG83a533iJYKCGWYE0GnB1NSxIa6D5gbDDunG53FQQ9nT83O6EHPGs=
Received: from AS4P195CA0042.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:65a::16)
 by VI0PR08MB10446.eurprd08.prod.outlook.com (2603:10a6:800:206::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 22:47:08 +0000
Received: from AMS0EPF00000193.eurprd05.prod.outlook.com
 (2603:10a6:20b:65a:cafe::d7) by AS4P195CA0042.outlook.office365.com
 (2603:10a6:20b:65a::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.33 via Frontend Transport; Mon,
 17 Mar 2025 22:47:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000193.mail.protection.outlook.com (10.167.16.212) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Mon, 17 Mar 2025 22:47:08 +0000
Received: ("Tessian outbound 0a641a8499f5:v594"); Mon, 17 Mar 2025 22:47:08 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6c9366951a3a407c
X-TessianGatewayMetadata: hWX5IR8S5UIEIyDesJ7Lx1QlMrBv8Lq5Ab3o6S/nQEgRkU944i6ylEf7HhGg8SEJStwqiluWSB+Nq4zVdMVS8ZhF0NzZ1vAyJ2McEzJ6MZ+Q4JQHb2/ZCaswU4R5WSAr2D5DDto0Ej4XZJntYFat+wPh/PuCZvZq6MnQA73LM5o=
X-CR-MTA-TID: 64aa7808
Received: from Lcbe0d0253602.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 7F337E79-B353-434F-B438-062D0E17E515.1;
	Mon, 17 Mar 2025 22:47:01 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lcbe0d0253602.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Mon, 17 Mar 2025 22:47:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sGijCfBEdYcWbrRfBIBpcCzy7cAQ0BvLqiRVq1Bt10XhYq+3p+eBFpiFPd3zlN8sEz6DoOsu2lRYqsQ/9md8n8YPihYj5lLPl9OUEcvLsST2Ddex6ir6e2+L31ILt99mxuj9Gh45nul/HF5CzW/ElW3ifqHPMZD6/0gs52DWAgQDrim95pZoqw66eMPj6v1XZPXDB6vRqZczvDobChFyOpS3MuTDIesNyoMtXfnlCQkA+Wq/F2yANHqk5r0LjYPhLCwKEP3SgLzlARJXdw6zj3pmumyjkQiJlDQCmIAo32z0qncMMHOpX8zZ6ATF8ogoVN2Z1u4aAMGMzGlAVepHew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I3Q/NexNwQ8keXYR1IcF9UpabONmpnb+Pe9BWElfL+w=;
 b=tx07TLtOUNjK/UIH42yzsOfJongiotexZy+i38skkjUjGQzeehAnjqewW/tq8glGxFC/znQdVSHZ+RDxzNoy+KCl7EcVMEl7fB096kSyPh74V8ZjlJ642qdIQOUgQIuAZv8KCBgQjOwdWzZ56p63/6gsqrGvvGMaGl6buhAsfm2OubOgE74FXjN2oR+XdnKuTn8ZXTmdO5YnsXZDj8swlxqaDKZsIpZUttYugsruNGqtBWThTMIrxKnJGcqoTzO3BIgqSyOgkIpCJyTVztdCfIM9xeUawjWf8YgUqRUDVPJgnGDe0Oh3op6ThT79qnBheZQeNKUXiU72XMsp4WH2Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I3Q/NexNwQ8keXYR1IcF9UpabONmpnb+Pe9BWElfL+w=;
 b=RS6Plli9MBGsDFOxyOjkmWsT7oo84TwEmckxc71rjKvX+OhRvIVrEBSEzCQ9IV0qVB/2xC/BFwVn1Q3B7u7rM1X1VbJqdfnNrj6YIlKjGG5PHTqKI9PuoyG83a533iJYKCGWYE0GnB1NSxIa6D5gbDDunG53FQQ9nT83O6EHPGs=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB10110.eurprd08.prod.outlook.com (2603:10a6:20b:62e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 22:47:00 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 22:46:59 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/3] mdadm: don't inherit autotools
Thread-Topic: [OE-core] [PATCH 1/3] mdadm: don't inherit autotools
Thread-Index: AQHbl0B082Gt+tKyL0KjdhWqOKObcrN3rJUAgABB2YA=
Date: Mon, 17 Mar 2025 22:46:59 +0000
Message-ID: <8370627B-7869-42B6-B8C9-87516E157F2D@arm.com>
References: <20250317132749.1778185-1-ross.burton@arm.com>
 <CAMKF1sqxXdP502kkhpki4-xxVR3c7z18+bTAPDmrpsm_5t-d_A@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqxXdP502kkhpki4-xxVR3c7z18+bTAPDmrpsm_5t-d_A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB10110:EE_|AMS0EPF00000193:EE_|VI0PR08MB10446:EE_
X-MS-Office365-Filtering-Correlation-Id: 49672ccd-0c07-4f7c-33be-08dd65a5a600
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?rpZV7Ax1lzm3Hq4nciDrrAtUjRnfagtCF1XRwZYaBe3FoLd8Ox5pC/7mDunh?=
 =?us-ascii?Q?0xbLbbmCM0qC/HmCdEQBm+rfzkElR7UdhuC4RmrFiE/i7bnnOwxaOx+za4A9?=
 =?us-ascii?Q?L7hdGnw7nA9Igo3qjRDVWR9Sv77dfW9+I0E89NPHmQFoT84nm4HNgN6ZCTGM?=
 =?us-ascii?Q?bHzokuDilmnTk6oiJ4IZqvctfR0GaUosG55tAcOGAg98aDm7Wdfp67imLd3+?=
 =?us-ascii?Q?a3C43hdYna9zZN8eb+em0TvJ1umSNgzGDZO+RuQwhtWsIRhgfyJtcpuvCdPi?=
 =?us-ascii?Q?qD28rbgnRrCu/ip4kWgA5NZUEqcqJkZeCZZbcSqPipTvZ7zqzvyvGB9BykTG?=
 =?us-ascii?Q?VPH4v0RQBmlXaMQBlp9vgka618N9u2rybfxGXuK6bqgsSnsfyaqd5fOoGeem?=
 =?us-ascii?Q?+x53YAIShHzaqEewCIls6V2yMPpNOE9DIblOs1s7zL0n3At4JcggaQwTtfNg?=
 =?us-ascii?Q?cksJpE67LNoRXeYwbmS7lS8lc6GMskXtX7ODdJQJVJEVWYcxR4kfVRe05FMd?=
 =?us-ascii?Q?G3S5D8sjxwKOy1A1rZw83gyHcLVcPuIh3A+qGQC2sdtqVX/fijqF7yHVK6qm?=
 =?us-ascii?Q?GMBwzDVcjTpQCNzIsgAURsMDTtOzyOGFT9UcyCE+CPfMYs+M8tkXJBG5Ofik?=
 =?us-ascii?Q?3u1SKIsR5iS8+OUi4YfM1p5cLV32d6zd3GY6HQRyuwCXRFVo8f0mbGMqSDKD?=
 =?us-ascii?Q?5pGbWvN0/byR0xV06/yGR1h5KpLRr7t78w0aUbQ3QXyJmFNIjdv8iG5Z1PfD?=
 =?us-ascii?Q?3223kAP8Xq08kx1fS/Thcxi1lXcP0OlpUu0XBMEyc1zErgDBGkZ76nNwX7rb?=
 =?us-ascii?Q?oSoYNz0xQu174L11axarhe8FHzR10PntufmRaYZjJRIhVPlXkCBHt3gviQFQ?=
 =?us-ascii?Q?oq5B2Mh4ZbxpEPngmkzQeYMQswOzgTJ2fROnnPe9nshOHc/SizPgY0k2kVGt?=
 =?us-ascii?Q?VGfd5CP5NJ7G0jWt3IreRDPy+14jzDVt4GzfL90ooHzZrvr3pwUJfSxy31By?=
 =?us-ascii?Q?0fuqMgVQf3gGpek5rNA0gr9RZ20i4oYUNxYb2k+MKI5EIqyWpgECPhwgPsP9?=
 =?us-ascii?Q?TreG+cHvp9WifpxnnRV3glbzBA36cjo+gRmF1SV/ckhrNPsKoX1MgysSbnDo?=
 =?us-ascii?Q?4eGhk81kLtnqib+l/ABH3lv2Wf10X6+rl5Cjw9GXeoTCL7AsrCCzqOUbj1pW?=
 =?us-ascii?Q?sFLB5+Jm48t41O8J1F7Qxu0KT9XYqfsnDAenAETfhB/i+7CKH2G+qL1jUoOA?=
 =?us-ascii?Q?zSOrf7Prb9nS5PU1Ow9of5tXuEgUw1ljSHzoqAVnEu4LXlsLsLBPg2ecxmUH?=
 =?us-ascii?Q?dR+INH9P6FbUuG1m0bxIy1NDHQSCsNepnCIzAZaMXCuoj9JxDpby6KLZTN68?=
 =?us-ascii?Q?8MbLu98B3gZCFYZSERxa1tBCWH7qpX31vp8gC5SrfV4BgCciarnIckDgv/Di?=
 =?us-ascii?Q?+/7hVG3dQwkNVtGbJy2Lq6OKom0HNtZO?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1B0674D80068C9409E2CDA2268AC9355@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10110
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF00000193.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	48202b0f-f01f-4cd2-fca2-08dd65a5a0b7
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|82310400026|1800799024|14060799003|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3pkywJkyPgWjR2Z9LFS2kEedGE3C+N/MPwp0aXHFnWc0kPaQVCAk2bd+Avij?=
 =?us-ascii?Q?6R4Ytzzqmx3Ln9STj3GTkL4b61k9s7+ZMZBv4L/VQmSwvzv4PalL/U79+rNP?=
 =?us-ascii?Q?xgq+/TUVNWmNPqnEAGCAGm5KKURsVoQW8QMn8ctqBm1kjvlfo78gKA+zvMaw?=
 =?us-ascii?Q?HLBuZtne7TUuBPB8VfliI/G2Svjm81Adfys+Q0Cr8GOIw4pIrKprz4leLDxU?=
 =?us-ascii?Q?/nSfi565/v/9oyNilqtjisADxfxIXUGmEgu//aBcSeuWvLQ40LPfad5g0tud?=
 =?us-ascii?Q?/EyHTKGfKS/Al/4RVnWDk8DR8RLE9YqquNfvByfOZEY1ObY0ozM5hQGso5IX?=
 =?us-ascii?Q?D3Pz9KUiRSBWwlWTxY7WmsSchT2aFkfrCAsdd8Y9hlswTk4qJFwgWxVBna/6?=
 =?us-ascii?Q?Q2qOBaoHQl6Atu5iMfoyRyriycyiYzbUsQgmXAVCTW90nO9yvufDpt2fmDTl?=
 =?us-ascii?Q?OvKi/Lfr5WrRKtNyI0sxxK4yemz873wEoWE7X3oTxnsM3zyLx1/OgxoQnLo8?=
 =?us-ascii?Q?eoM4w0RI4iMM02YhXNRCOVhHC6ahkhkTap6QME3xbmX/psWbxM82c9g6UPjc?=
 =?us-ascii?Q?xlGSFxXe+LOS+y7EIbm0/nZD2rLiZ/3JSDSa3+3IyOkD1bUhcHYLN6wFYlH0?=
 =?us-ascii?Q?0sCcZ/fAfIkrsFqaE5qxzxvfYuE9z/nG988DCP/bRU1f4xF3V21YKRrflUT1?=
 =?us-ascii?Q?kLeuAENjyz4f/QEPDxpY0mBsr1DvMPlhBGhLf/uVMxClxxDvKHR/jlOczjYt?=
 =?us-ascii?Q?EecbRzV7Y2Gp6m7NZEQa+Nu4Ux3pBydZjQtpi4xoFtkwQ01ZcWRQc5SEfIFE?=
 =?us-ascii?Q?hss7gGTqS9pM4wK5lBZmwcNIq3dJsnE+rTqqczt1Ks/1oHxFUEgtt14aNfOW?=
 =?us-ascii?Q?lSkQB6bVe300xWB5W7lfzEh5XOfgYRhceqAQ8khKpIPExa/ekrp1v3oe9tgX?=
 =?us-ascii?Q?3NWtl7C43Sq6vQ+zumGlBnaal4yh0mxMDGap5QoL7D/xzFs7caFZvPXEaGi4?=
 =?us-ascii?Q?pNavge1fm3YOxt8X0WKd5R+a2PUCHnhinBqeWS0eXg9rZdkSOoerkv6war2L?=
 =?us-ascii?Q?DQR903NcKqQ/TJx0WZOCiugCl5Q0n4BY71xqmJEd24YDOy5fuhUPFqyJDjiH?=
 =?us-ascii?Q?pi4GNGwS2znodW2LexPneANZjynx4maa6R/o1zsFhM4yoQeIlEqb2ilvSrOG?=
 =?us-ascii?Q?Kxq6TK48zj+JSqV4yQbqSgi/5UvQi6yUiEI2klK3rTX7eneDUKjB2+JYEUWt?=
 =?us-ascii?Q?1kQo3oQp3pEWhUyADw/KC5Vy4yvKur8EJ8RfWpcvgNDKqZOULRwqFFza3cMT?=
 =?us-ascii?Q?t6vNyRDJ4xFLm5kojH3qYwIvj8hC4gpubyUiSJ6NTJl4ipfq8MxVaqOxOIYm?=
 =?us-ascii?Q?/2+YxhQqn9fHcbevk5LfO4iIdgutT62Yx2aIqlt2eATyTrab5AzdNcfL39r3?=
 =?us-ascii?Q?GZnjXCXjTZgiVv7US6V2yq3kIF0QhlqAhoFhPBQCek+ILKYb00gwig=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(1800799024)(14060799003)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 22:47:08.5049
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49672ccd-0c07-4f7c-33be-08dd65a5a600
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000193.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10446
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 22:47:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213128

On 17 Mar 2025, at 18:51, Khem Raj via lists.openembedded.org <raj.khem=3Dg=
mail.com@lists.openembedded.org> wrote:
>> EXTRA_OEMAKE =3D 'CHECK_RUN_DIR=3D0 CXFLAGS=3D"${CFLAGS}" SYSTEMD_DIR=3D=
${systemd_system_unitdir} \
>> -                BINDIR=3D"${base_sbindir}" UDEVDIR=3D"${nonarch_base_li=
bdir}/udev" LDFLAGS=3D"${LDFLAGS}"'
>> +                BINDIR=3D"${base_sbindir}" UDEVDIR=3D"${nonarch_base_li=
bdir}/udev" LDFLAGS=3D"${LDFLAGS}" \
>> +                SYSROOT=3D"${STAGING_DIR_TARGET}" STRIP=3D'
>=20
> STRIP here is not pointing to tool called strip here right ? perhaps
> some install -s mumbo jumbo

I was just moving a line to disable stripping so we get debug symbols, but =
I just checked and the default is unset so this could be removed.

Ross=

