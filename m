Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B01CCD2E9EE
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 13:31:49 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.81])
 by mx.groups.io with SMTP id smtpd.web10.59282.1731331907217997174
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Nov 2024 05:31:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=a1r8RGxf;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=a1r8RGxf;
 spf=pass (domain: arm.com, ip: 40.107.22.81, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=XJN82jNn9mv6KpbfGxaP9bt20c681zV33zo/2wzlL2gpdlFoo8dxyU9cGx+iX0IwXzWhVicKRjt/8ZZNTbLqToJCZurrXkHE+EhCH8zt5LVzzJUOw9TAguD5CxK7YPfJBC0tiyoFgXhBUmSJfXgsxke23Rvy04St3oL1OX7ZexbiglSOuevr6K+ou3fooa5qIzBS+h0rhqJRcEhc98KxMlSWwYR+uXtIqTdjxDFxY6AyI7/nRQoGWU96ZWuNzcfhbBAyRLHKCe+HBHi53GcyNIVEsXE/Wqdd5a7e0dh6CKBxNz5eFzQomP8eWgQOPUrsjk+UTZSVZYhVpWPWKQ6PHA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B9Uu4xmVFOR+sMk1VYllRcetqrgrEcx1rsaak7RfgAo=;
 b=nFfPJglAtN7kq3ruqirZbneO5Vvim9HyltdkWcA/Pda0926Xh9jPJ3pgzNhlH/WpprX94DWlmxEtiDuPdQeG/eMf+v3BI0Vwc/Mkb0mMQHC/vv/MSykBgnIp2z5svPzsfrXe+uXrtepKx4S0o0w+wgQ3k4SnjBNF+ZeHSf4z4Q68TXReuf1nJXjvn0b/iPjMvQX+xFq3LNJqKzFZ0pLNQhfbpvYrpFDha1KooqDr/7ndTZGtl0j6+hssW0lyjsueN/4E17JTds9eJ9AdylonNWwSvgCMka7ln4bf/rc+9k3EA/K2/brY3ATwahEq4vzFJfqNefrsE5Dwu/xFpltDVg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B9Uu4xmVFOR+sMk1VYllRcetqrgrEcx1rsaak7RfgAo=;
 b=a1r8RGxfgomC4SI//KHXEG8QKQu/aBj64CWclwDoVcUNEyHWZD/okWZWL47afJ/IVjBgfVkd8dYwM/zrth/afdVsHwpI0afb3tv21p/uV8c6XnZn4iyJUh2QYlsWUcWZzzMnIeL7rNSZrvxANu8jOvssdx8E37ViJ9VWwz3olx4=
Received: from AS4P189CA0036.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5dd::7)
 by PA4PR08MB5950.eurprd08.prod.outlook.com (2603:10a6:102:e0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 13:31:43 +0000
Received: from AM3PEPF00009B9D.eurprd04.prod.outlook.com
 (2603:10a6:20b:5dd:cafe::f9) by AS4P189CA0036.outlook.office365.com
 (2603:10a6:20b:5dd::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28 via Frontend
 Transport; Mon, 11 Nov 2024 13:31:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF00009B9D.mail.protection.outlook.com (10.167.16.22) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8158.14
 via Frontend Transport; Mon, 11 Nov 2024 13:31:43 +0000
Received: ("Tessian outbound 59ce3b063f98:v490"); Mon, 11 Nov 2024 13:31:43 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e2ca91c0771077ff
X-TessianGatewayMetadata: bP2k/hcAm0hZLwY7//vkogm1savxmn+nKyEoRgXdlPGwz1HEhiHvU2eydu+mb6eZxOyVwUOYoJ0x9v7Crm4nJ6+/c69YQu/6A7fzURUf/XTCeateupg5AOw1tv0ItMS5NBtlBnJJXBx1nw4vdKtneE8UOFKjnA0xDqRMKAtSoM4=
X-CR-MTA-TID: 64aa7808
Received: from L81c9416b0aec.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 1D8CD200-E698-4D4F-B495-5195D7BD84C8.1;
	Mon, 11 Nov 2024 13:31:36 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L81c9416b0aec.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Mon, 11 Nov 2024 13:31:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bXEyFpa+5KysDpd0UahHvgCcyBjswBPtSDXDeUnRyhQkUf26JDQYMpAlyE4ANalIIdVnKCKLQ5q176Nf442frIZG3LgADNQuSMuZZPpVXXgkpoLNlXdKRbeYhnCQ8e4C0HHXTHvWXPEoQEuSfN/nrdynS6rYTSj3DtbxiBGWSK0keKtzL3NJa1zyqHuA5ZKICFKDQr5+Z4inLlvAcN36+TXJFCDIMpRyV0Lkf/8XSIR8OhXfcg6OKTy6lCDJyK9e4KO5see+kFxLyP4r9e3hwdfh8NW/EOrsJ0Vc/KNS8b8U53jRiQoOhUa64CizxQM+VUuiXfzRIjm6XF/cCC9lIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B9Uu4xmVFOR+sMk1VYllRcetqrgrEcx1rsaak7RfgAo=;
 b=E8/fVLBNh+uk8NZs/RJkkaJiDoWOvpTZggETCi7WJBDSG+49Xld6PPcGDIQ43j1FgzLsH14NjPyqsDY1SLCmSQRds8ovwmIC5faeTwl49wfL6dSmsNJTwcqOiynjJ9cI6zz4Zjvz/I6z+4JmzR4qDE3PpaC5wzgaDmaNp2RXBWjU/7gSIXVIiF2Sq0Zll+3QbDCotD2ZrfPKO9+yU1gyertPrQ2gAC6gHS5wk5yP0bvZU9Y/N8agDfxIjlXRmS3ktN+Z/T3FtfmXHxDZuras6Ej064sE2Qk3X9zu5UUw8guFZRPmIqh3rQc5a+2gbY6GTZv5/6QNKZs1SL+cvau86w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B9Uu4xmVFOR+sMk1VYllRcetqrgrEcx1rsaak7RfgAo=;
 b=a1r8RGxfgomC4SI//KHXEG8QKQu/aBj64CWclwDoVcUNEyHWZD/okWZWL47afJ/IVjBgfVkd8dYwM/zrth/afdVsHwpI0afb3tv21p/uV8c6XnZn4iyJUh2QYlsWUcWZzzMnIeL7rNSZrvxANu8jOvssdx8E37ViJ9VWwz3olx4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV2PR08MB8097.eurprd08.prod.outlook.com (2603:10a6:150:75::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 13:31:31 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8137.022; Mon, 11 Nov 2024
 13:31:29 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: Markus Volk <f_l_k@t-online.de>, Alexander Kanavin via
 lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][oe-core][PATCH] systemd: dont allow autoselect for meson
Thread-Topic: [RFC][oe-core][PATCH] systemd: dont allow autoselect for meson
Thread-Index: AQHbM3QvektpZp6HLkmNZDHGdjB7IbKwliAAgAALVNqAABQ/AIABX1+A
Date: Mon, 11 Nov 2024 13:31:29 +0000
Message-ID: <FD0CD04C-EB0D-4DE4-A6C0-ED91DBDBDEBE@arm.com>
References: <20241110132848.2135721-1-f_l_k@t-online.de>
 <CANNYZj8XUkrp6Fc5kB=4S_q7AKiYkN+zZ4Tqd9ZEQK-4JGC5xg@mail.gmail.com>
 <1806A2E5B9CEF1AC.19665@lists.openembedded.org>
 <SQQQMS.OQC2MWOKNELB1@t-online.de>
 <CANNYZj_AK7rWMRkkiincd7TZwWX4+iYziAM=UG5kOmKSC9nvSg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_AK7rWMRkkiincd7TZwWX4+iYziAM=UG5kOmKSC9nvSg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV2PR08MB8097:EE_|AM3PEPF00009B9D:EE_|PA4PR08MB5950:EE_
X-MS-Office365-Filtering-Correlation-Id: 4527d0f9-56f2-438e-5714-08dd02552e9b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?bDJrZmJza010MW5JUmFSZkpla0F0U3RnalZwYTdaeHM3aTNSTm0zS3Z3Y3A1?=
 =?utf-8?B?N2FqTzBnSEVUb1VDdklZR1lRcFRkbFlXdnpRZ1VNNVBKekM1T1BUQlNqU2pO?=
 =?utf-8?B?QXZlRTlHZENrMEtjUlZ4RVpXUm12bmJEZklBUzE4RDBjN3licUw3R3ZCQms0?=
 =?utf-8?B?cmlvUk1EM3pLYlk4VzI5VUd6emlzTjdBMHY2NGVkSFRLQng5UzdlQ2ZFRlVF?=
 =?utf-8?B?VE9nRzVIejc1cFR1MkRHamx4aVZ4OXdXT2RMS0JuWmdXcE1wWS9HMU5hN1B3?=
 =?utf-8?B?ejFSdGhoSUtGRlNqN2ZmQW5PUlFwbXdqTCsxUXZrN2tQRHlab21xTHhSSHFs?=
 =?utf-8?B?eFVhUFdSOEgvZzBjR3AxZXVhWVFrZTJlcWJydGZCU0I4YmZyTVprUWRnalBU?=
 =?utf-8?B?RmF0SkNDTUdKQmVqQ2FNWmRWYmxmZ2FSZzY4MlpoME5zdGVCVEdWRFlzK2Rh?=
 =?utf-8?B?R0lCV1FsMktMRWw2ODR0QXlKK0JXcWxPSlYxZmlOc2hvVW80ZkNSL0ZydjF6?=
 =?utf-8?B?clNPQzFuejZjUWM3MHhPK0YvTHQ5ajJpazNsT2JySDV5QzdqdjlWc2JHa2ha?=
 =?utf-8?B?bUU3OXAzdHI1eWN2UTZhZlNsYzR0UzI5SnAxaEwyeU9KMm1SZEJCdkZoOXRk?=
 =?utf-8?B?eWVNVFlHK2tXaTBMY3FLNmFlQitxVEtKYXNmMXRrOUdiSGtsQnlBaUcwQldB?=
 =?utf-8?B?VGVxNmFwR3NBRXRITEE3T0ZZaWxJbU83aTk0VlVYQ0JFR1J5cERIWklWMVFr?=
 =?utf-8?B?Vzh3R1dWZ0pRcUpjOEZLa2diTWZkbTNISWVWQWZhbXF2YkRUMVlmUTZ2eExh?=
 =?utf-8?B?eWNRTjN0Qit5alhibmVlUkxNdjIyT1FzRzlKWGFyTE1pTjMrdzcybC93VVFz?=
 =?utf-8?B?OFJhWk0ySURXK2FoZ3FXVnQzaVhRTUNHVE4zVGZMcmFpdzB3Y0FTOWlZUDkx?=
 =?utf-8?B?RTJOMy9GYjNseHgxU2FaaXhkMWZrTm0ycWVJdW4vaDFBL1pqYXVZUVBOY2pj?=
 =?utf-8?B?bmtzV3grMjlkREphYW5GSUdqWGdSY0ZQdHhES2t4OU44UURla1E3alR6K1pr?=
 =?utf-8?B?Zi9zOERiL3VzK1JjN0laemt0a29iV1BUTUhwMmhXYS9jdHN4MFgrMlNPcTAx?=
 =?utf-8?B?TGNJbEFyeDg5eGhJQnVWaWlobmhrSlBHZFFQdkJ6QWFhaWNDK2pJSmVNOEk0?=
 =?utf-8?B?VWpxaGI2azBvR2VvWktjbXdaYktIMVFkeWJxY0N6MFdxMlFwanBDNThBeDRh?=
 =?utf-8?B?MVBzRmtTZEdiRGZSZzR5VHF3dVkwelNSbEp5dUtueHFxMkp4cW9vVTY2VFJ5?=
 =?utf-8?B?d2RzNlF4aFVwbnQ3MjNJUEc0VG1TaHZwUWdkZE5kM01RN01RNmFHL2FlYzdF?=
 =?utf-8?B?QjVRdzBkUURKK2srUDdKUFkxN0FDajd4N1VWZGxFRlFiYUlCNzNKTHJMWDIz?=
 =?utf-8?B?NVBreU5NS0xEdVlzQ25qSUE2SU12ZDVSV1hlNEJlZTdZSXhzdElBWGQ0UHph?=
 =?utf-8?B?TnM0aWFKY1NmVit4NEtMZVgzemM1aGxsTHZrcll6R3hLdm5VNGw1Mkw3cG1G?=
 =?utf-8?B?WmxqbWRHODNiaklqaGZ2Z0Vrd2RhNE4zYjF0dlBMdzZvZHJyQUhoVjY5YlZY?=
 =?utf-8?B?Z0x3YkRxTHVsQnFCaGRPbE9qRE5jM2k1My94ZUpkVFNXUWN2RVphbWIzSFJz?=
 =?utf-8?B?R2ViZE1mOG53a2F6SS9rQ1VyVUJUcnZPZXRVdWEzNFZqS1ZjOGwzNWRwU3dO?=
 =?utf-8?Q?KrYhYwz1SQBT54JxLVzgvm4N0ujWTKydQGae7ac?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0ED9934F27CD4244B56E4163B49E9BE6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8097
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF00009B9D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9ba5f0a4-45fd-4830-d44d-08dd02552698
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|14060799003|35042699022|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NWxvTnRWMjlJUTJoamxZRDFUKzlSYWJ1aGo4ZEJkcUlUVk80OGp0QWg5eFBN?=
 =?utf-8?B?aHNtbWJPRjhFc3AyT1ArSGY0ZmZZT21qZURsR2VUVklmb2w5SlZCMitEbFNW?=
 =?utf-8?B?VUxpc0thOHhtMkdPMGFraUFFczFZSFlrcVJpS0NBcGV3RmplV0VtV0Rrbk90?=
 =?utf-8?B?ZjVRWHVlTVhHc24xc0g0MTJibUVYandvWlpVMGhmUFN4NEdLeFdvY1RmeDNF?=
 =?utf-8?B?cUY5RW9CSDJYeVNtTGlKbkRVVVhaRXdEaTJsT3ZiNlVpMVdiYjVlZ1hNR0JP?=
 =?utf-8?B?T2Q1Z2NoN0U0VEJrTzl5R1NwRkdZUWNTREl1S2c2blUyc21EM0pIeG5hQnlZ?=
 =?utf-8?B?YTJaLys0QUNPY2VkZkRuQVpIeHVCYlFWVW1XTGtjbUhUZzEvQ2pFNVdkeVhk?=
 =?utf-8?B?Vk9rN2QzWnpkMXNacWJKa0RGako2YzZmUXVwdndMRE1UZkJxcnQ1QjkySzEw?=
 =?utf-8?B?bTh4VHVkZVZnbSs1SkFMNENaRXArWUFtalF3djZDZHZpaE9lbGt1Yjc2VG9O?=
 =?utf-8?B?dUFQbXhXYmhsOTlIRFE1aDNhQTcvcGs3VXNrZk9qTU53eTNBTlJ2VGduM0Ry?=
 =?utf-8?B?Z0FDd3ZXZDdlNDZvZG1NWGE3aU91b05YOFBKbVNaYUh0TnlIVG5kVGhqS2c3?=
 =?utf-8?B?WU1KWE43cTZrR1I4bkdTckhmbzhxZGRoTzYzT3F3OEZlaFFHbDlBeG9oemtm?=
 =?utf-8?B?V1RaQUlDSmpBbzZjV0VNMUQ3SW13b1pNZ082Skxqd3dtOExIck4ybjhpZGZX?=
 =?utf-8?B?R29IRjc1MWNjRFhvTFFXclBZMmhBcmRrTGsxMnNGOWVaZXJ1WTNxUk5DWVBY?=
 =?utf-8?B?bnVRdjB4V1ZnNkR4NVphNzVId0NEM2crcTVNNEdaamwwaDFHajFLVnJpOEtP?=
 =?utf-8?B?cXJXVnZJanRrbjVPd3lwYUhOWEJzUndUR3FYdWlxTTJKT21TYVI2dEZRSlF2?=
 =?utf-8?B?dVBwMnFacmJuaTF0RE9HYk5ldlNEQ3pYTmg3NE96elRBS3RwR3dNMmdGL3NE?=
 =?utf-8?B?N1dneE5EajN3SkJIWWJsMmpFUy9QM092dkdCcWZLTlpzd2Z5QUhPVWEzaEF6?=
 =?utf-8?B?YTdXZldjWnpMNllyenRjL0hsdDNyemZOM0JYbzVLRS9McnNxREJxVHdXOG9G?=
 =?utf-8?B?SVlDRW5KaGpOYmxFMzhuMUZsNGN0bWxxNlllMmw2NEpwcWkyTzhtT3dURjBC?=
 =?utf-8?B?SEJNOC8vWThMaVd0ZW5ZbDRDQXFOSVh0dmMvcUVMcUFwb1VJbStPY1gvZ2Ux?=
 =?utf-8?B?YUtKVTFCTjBycEIxYTB6VXNObk05Rkkwb0x0WEVqY2l5b1VSRXpxVk9CWnJK?=
 =?utf-8?B?K2tPVTJ4Yi9COU1IS1AycnpuZnkxMXFVbjJYZHg3VjZkVXdVQzN4cHFENXRo?=
 =?utf-8?B?Z1ZzV090RitKdEJ1WGhmVGdXOUJSdHR0VUl3QmJaeC9Qek9EdXVPdUFWLzVI?=
 =?utf-8?B?TXBrZjVTcytOcXFPUkdtMmhPbGpYL3FwT0tIaXd0OFZDbUpiNEF6L2RaaUhr?=
 =?utf-8?B?cTVjZElaMXVLS2t6Yms0enBpU1lNK3hzNmZNb3ZjTk5zZ2VsTjRFZi84SHRP?=
 =?utf-8?B?cEFiTFpKSG9LQUZ1d09ZSTlpN2txaHQxYUJTanJMRE45d3E2aXY4eERyZWw5?=
 =?utf-8?B?M21sY3hZTDQvQ3B0TXh0Z25nd1lEeDVHcGtKelRPNVQ2TWIxb3NoWXNRTkV2?=
 =?utf-8?B?ZGUxb3I4bVhwZmRPZGNBbmRPTjB3UnEwdXdjMm1ibEozaFRCSWJPRldyeS9T?=
 =?utf-8?B?Ly9qdUVlOFJDQWlwVHJ5bDNwdWJzK1ltVG9QSWpMRlRCdFduMFVsbmRWQjhX?=
 =?utf-8?Q?TgYCJVNYDwLEiBU1rP5J5yjV1QRF/yW6GUtug=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(14060799003)(35042699022)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 13:31:43.3105
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4527d0f9-56f2-438e-5714-08dd02552e9b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009B9D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5950
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 13:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206956

DQoNCj4gT24gMTAgTm92IDIwMjQsIGF0IDE2OjMzLCBBbGV4YW5kZXIgS2FuYXZpbiB2aWEgbGlz
dHMub3BlbmVtYmVkZGVkLm9yZyA8YWxleC5rYW5hdmluPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnPiB3cm90ZToNCj4gDQo+IE9uIFN1biwgMTAgTm92IDIwMjQgYXQgMTY6MjEsIE1h
cmt1cyBWb2xrIDxmX2xfa0B0LW9ubGluZS5kZT4gd3JvdGU6DQo+PiANCj4+IEFjY29yZGluZyB0
byBtZXNvbiBkb2N1bWVudGF0aW9uOg0KPj4gDQo+PiAgLS1hdXRvLWZlYXR1cmVzIHtlbmFibGVk
LGRpc2FibGVkLGF1dG99DQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBPdmVycmlkZSB2YWx1ZSBvZiBhbGwgJ2F1dG8nIGZlYXR1cmVzDQo+PiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAoZGVmYXVsdDogYXV0bykuDQo+IA0KPiBTaG91bGRu
J3QgdGhpcyBnbyB0byBtZXNvbi5iYmNsYXNzIHRoZW4/IEl0J3MgdXNlZnVsIGV2ZXJ5d2hlcmUu
DQoNClllcywgSSBiZWxpZXZlIHNvLg0KDQpodHRwczovL2dpdC55b2N0b3Byb2plY3Qub3JnL3Bv
a3ktY29udHJpYi9sb2cvP2g9cm9zcy9tZXNvbm9wdHMgaXMgYSBXSVAgZnJvbSBzb21lIHRpbWUg
YWdvIHdoZXJlIEkgY2hhbmdlZCB0aGUgYXV0by1mZWF0dXJlcyBvcHRpb24gYW5kIHdlbnQgYXJv
dW5kIGZvcmNpbmcgb3B0aW9ucyB3aGVyZSBpdCBjaGFuZ2VkIGJ1aWxkIG9wdGlvbnMuICBUaGVy
ZeKAmXMgYSBmZXcgcGFja2FnZXMgdGhhdCB3ZXJlIHN0aWxsIHRvIGRvIOKAlCBJIGxlZnQgZ3N0
cmVhbWVyIGFzIGF1dG8gZm9yIG5vdyBhcyB0aGUgbGlzdCBvZiBvcHRpb25zIGlzIHF1aXRlIGV4
dGVuc2l2ZSBidXQgdGhhdCBzaG91bGQgcHJvYmFibHkgYmUgZml4ZWQuICBTb21ld2hlcmUgdGhl
cmXigJlzIGEgc2NyaXB0IHRvIHJ1biB0aGUgbWVzb24gY29uZmlndXJhdGlvbiBpbnRvIGEgUEFD
S0FHRUNPTkZJRyBzdGF0ZW1lbnQgdGhhdCBqdXN0IG5lZWRzIHRoZSBERVBFTkRTIGZpbGxlZCBp
buKApg0KDQpSb3Nz

