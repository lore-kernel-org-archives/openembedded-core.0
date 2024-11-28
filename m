Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA8EED69109
	for <webhook@archiver.kernel.org>; Thu, 28 Nov 2024 13:21:47 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.41])
 by mx.groups.io with SMTP id smtpd.web11.94704.1732800101159268727
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Nov 2024 05:21:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=TuwIwMkr;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=TuwIwMkr;
 spf=pass (domain: arm.com, ip: 40.107.247.41, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=UmyiYWZjeyG4wKdBmhxiZsaTjM9/PMc8kyaITo4UsRfnKRpQliiqACLIwTlYzf8K6xwpKwsE5YLIxgrFmnaz0QBjTs5Fj5kLN23/hCm56yzjZ55cu/M4zBpcESsM5bO4MAc8pWoomAztRXe9PS8ZYeYS/KOL2kocsIKx7XdPAn38/qA+MCd/J5+44Rgrfh4rx/CUCDCARhT3ocK1r7kQIreXdA+z7TWffbainff8OYRovT07PZyXbPYeZLrL8S0bUOh076AZIX2ZHeilfzSy76pxPcYv27NAi7P+bOPQ6oLF/dyoEpQW5ck8ck8XtGNpxMuezUZ6k9xr5+uEPZaMaA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ptr0+/hyAADPF9GNeIAWzzQBXNzCDmjdvSz+rKOl9LU=;
 b=J5MNXlmCAUAElLtRGP3joKNoU4R2Hlswi6oJzcgnMHoUGPkTYCd4Eee4FQuA+0NyU3i63fwDYqHn0CZeNtLxWAhYfGefGlE9qNaGHQzPj2zlH2DPW+0/e1X25O/tJF5sNN2M4y1O9o3oApvZHGi+9acIzyrs0e6+tWxZ3SDVTyYknFHLJPJwS91rPyWvVBRC7qXvWnae/MLAIXMmwLQj7jbLPw0VTrL8GNLrj3LbB0IKFhg1bs0NPSwpiPb4hFqZWouWielsCDHN1kGoRmlaBbKXG/ChnCMLCPHAaH8dbonKACtuq+jnIbyC8Db9Ao16W42L3lJRhlGdF4LTEkZNNQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ptr0+/hyAADPF9GNeIAWzzQBXNzCDmjdvSz+rKOl9LU=;
 b=TuwIwMkrZ3zBkYwiS4oPUtqvN2Mbdw3hYeqsLcEJph6pZjGv+61yu7/jLeiFCH2ojlJHdCZeL6wMgnGPMyb1OuWQv9HcrzppQhaN72S/GudX69vvRCcaG/NDvMZ1oAOGRiYKDjFjisMgOg5GymGAEl3+NG9pLl8B4M3/b63Wn90=
Received: from DUZP191CA0012.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::6) by
 GVXPR08MB10939.eurprd08.prod.outlook.com (2603:10a6:150:1fd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Thu, 28 Nov
 2024 13:21:36 +0000
Received: from DB1PEPF00039233.eurprd03.prod.outlook.com
 (2603:10a6:10:4f9:cafe::3b) by DUZP191CA0012.outlook.office365.com
 (2603:10a6:10:4f9::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.13 via Frontend Transport; Thu,
 28 Nov 2024 13:21:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF00039233.mail.protection.outlook.com (10.167.8.106) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.12
 via Frontend Transport; Thu, 28 Nov 2024 13:21:35 +0000
Received: ("Tessian outbound 206fab1c37e0:v514"); Thu, 28 Nov 2024 13:21:35 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 798f183c360ee0b6
X-TessianGatewayMetadata: mlHz020BT1sTy+UpU9FeqWkGJpKXBTDtUzJZuvetzT6/5Cs1HSIWIQ8YLyyN0CiqUblHYnqGPp0A9kPSWyGmizEw13bGd8pOJ8RW8Z/J0NlwXE87urLJJLO42w41GKThqvsy2CG9H1byZDaXggzZWsL5atZccPEyb5445Fxymew=
X-CR-MTA-TID: 64aa7808
Received: from L93c0bf0b6f91.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 686A9386-18D2-43D3-87A4-58A5D7C32FAF.1;
	Thu, 28 Nov 2024 13:21:28 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L93c0bf0b6f91.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Thu, 28 Nov 2024 13:21:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vDUMwhOOxqBntXa8jMxtPUoiyRECU9uGFhAarpoPb0HTB1w6q8enbVVI0JVYgCR4E5cqohRGpldEoK2gH/t4VwrUgjJmeaz51d5MPU9FMhgkx9NYXpDmk0E4jKtQxbo7le5sXvKXVqCEZlbUPlYffjGsIM6nnsWez1Qq1zdSeHZ4KHu0hxySCA0hNAkgBRYSk4ar046AMycp+m/K+i0FEQR8zVXztq3ZvQbx4An2GFdST2rBBWjYRus+Aq5qB52h/vJ/YnZV3JfN9vNDNf3pox2jCO7yDSZFGvgWKXHiammZ0sGgU0p7RQDNPqB/6U5GW5KTmZebX5hCk0Xkto9YKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ptr0+/hyAADPF9GNeIAWzzQBXNzCDmjdvSz+rKOl9LU=;
 b=pJTBAzpwLPVCvGpGRDXj+WkxvOR24NH0MF6V+L10btKHPpXZyQrOwcXmW84KGn6AUSujITy0k72ypiQUIOjMOcOazNBbkfoOJCHJj4fzLBBjVHidsplDKxtlDKxbWc9cQNgxIPSBa0oZnz9c3ZhMPavR1SdpUzgAzoxGQXa+Txy/IKBEABXvV+mKXybCrvHnp+TJvRUkDAcbJUWRF7VyKhrPwYS8olaoGc4Hd0xUxUQO3OSmFwcLtTc5S8y8XgjeLSOlFf+0qJq25fRwL1NT0Iozoweq/xQ3hp3ZUhYzerSbYoOllK6U0jKAhaRv9zppq3X8p0bTYRPeKWErqpV8cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ptr0+/hyAADPF9GNeIAWzzQBXNzCDmjdvSz+rKOl9LU=;
 b=TuwIwMkrZ3zBkYwiS4oPUtqvN2Mbdw3hYeqsLcEJph6pZjGv+61yu7/jLeiFCH2ojlJHdCZeL6wMgnGPMyb1OuWQv9HcrzppQhaN72S/GudX69vvRCcaG/NDvMZ1oAOGRiYKDjFjisMgOg5GymGAEl3+NG9pLl8B4M3/b63Wn90=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB5910.eurprd08.prod.outlook.com (2603:10a6:20b:296::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.14; Thu, 28 Nov
 2024 13:21:26 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8207.010; Thu, 28 Nov 2024
 13:21:26 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "f_l_k@t-online.de" <f_l_k@t-online.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCHv3] libsecret: add pam support depending on
 DISTRO_FEATURE
Thread-Topic: [oe-core][PATCHv3] libsecret: add pam support depending on
 DISTRO_FEATURE
Thread-Index: AQHbPNPXKLPU8whXakWlzMmDRtPHqrLMtyWA
Date: Thu, 28 Nov 2024 13:21:26 +0000
Message-ID: <C69CF570-92DB-4E06-835E-5C5745D07DE3@arm.com>
References: <20241122114338.2890-1-f_l_k@t-online.de>
In-Reply-To: <20241122114338.2890-1-f_l_k@t-online.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB5910:EE_|DB1PEPF00039233:EE_|GVXPR08MB10939:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f3f4771-d740-4683-ec9f-08dd0faf9532
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?oOON2wKLCeZj+bHkeQYuHXwjlJb5pvOQFhR+0LOAZ60oDJrl8rEMegbeTwpi?=
 =?us-ascii?Q?1nHbw7WJa/B/zDSzXhvREhMkMERZZm+2Ez6RlD3Vq6LwavJwIu6Hjj53m3ny?=
 =?us-ascii?Q?z7hrVRnKzkkq2pu9sPDmB8pnK+L0WoHSfjXrwCT/+Mm7czWQIFNwhfNPvA4M?=
 =?us-ascii?Q?bUty/npPFgTnsgKPFkZBTi0UNvrh1VmPE2jlcZn6gVopz2rziC3NO1OP0qzx?=
 =?us-ascii?Q?Ia/k9p7JMp/TnGiO9bdOTmK9+9CFo+S2AX1abLIpZ8KiubSj0nb0NMiD7aCA?=
 =?us-ascii?Q?lwcu8bKPUTXtqGW1PA457So18nMzQJ6Wq8+P90OC3lL5SX+NSjzSAmmj6Z+z?=
 =?us-ascii?Q?zcRf1j5iu2z0Ybjf02j16t6UMwV2A5pc7cr1+PoV4m9kqAZ4pBeOUA7nKHi5?=
 =?us-ascii?Q?sMrdSmRZp8/FlgVtplcOWnMtRzJW/hb5l5j4WI11BCkGLADxXKaaQfgjD9DY?=
 =?us-ascii?Q?GbPleVaOxU7n/QLWxSsD9hEtqMSMtUmMCNmQcFDKgp10+DtckVo5dZPkMu7E?=
 =?us-ascii?Q?LaHtJo+f8NJMWXz3y7GtwzCEk5ET+HG7uoJTSQlgc3rvaC6BBpOoCkzqkNGh?=
 =?us-ascii?Q?78oz6UnnMpwDwQMRUjB8FpwQzEH3pIewX18itmAbJDZHx12mJiZhmlLyt6/X?=
 =?us-ascii?Q?ZhYAxqr6fPxR4G94dO5KSa7AKk5dd3Dzdnf8r0SiRoiJPPuwZ73aJwv5aucK?=
 =?us-ascii?Q?o9GkKyDobQma52vC8cKK1lzvxZlfuSvrbM/8+vKb+b+v2hTt/j8Tfc0fIEjS?=
 =?us-ascii?Q?ft7hwft0/6pmKcd7onOHJvCO6Vg+hy8yc/4ucMUJIQVhf3KP/GYtS++krRqz?=
 =?us-ascii?Q?6nC2JKprlIQ2PJeBI89ck/IWJ8lYrsD4nSJv6mAJZrj3njNksaYU3D7b6rRn?=
 =?us-ascii?Q?aEPeCr6V4VlFihYe3G1V6Qk62xrYERDnLfu8+VT/EssgSB9tjxJwTh/FU/Y+?=
 =?us-ascii?Q?hZ6FYJzIXjh9BKKNsxE9CWvFrGK+rNcz46/okb3E7/OhCFem/8SU4LpsL8YF?=
 =?us-ascii?Q?9ygcewn+FsTRehzqIDbZVSsAVInWycvEXD3V+oxqCoJE9shsccvg32emv2vL?=
 =?us-ascii?Q?zXoNu/LUPcR0L31KLblLdA7j4rMYw33qREsDPEgJ3mR1G+tRzrkfObIon7ZW?=
 =?us-ascii?Q?p+CokrPbt1irWIM4QTbxoplMyw8PzpYMsmlhfdgp3CqWv4Wl3jkRRdN0scFX?=
 =?us-ascii?Q?1T6lZGoznk9J2AcdHc7TNDLekdT6EDm1mWP402GcZqhz0T/lxrW2PxidxIVY?=
 =?us-ascii?Q?SvlQ5m3vwctXJgKVnPNrvnab/bLfmgOY3Gw7JhESJ2maoPGwqGymF2PpWRAM?=
 =?us-ascii?Q?XVh71nZ8VacwmVhZfrxjma1rzEN6pHtdLqTNFR/rQFFZhj/hM20ZZWVS2FDb?=
 =?us-ascii?Q?q7foCrw6O2J7zsTZY2hIY/IIfGf0g56znEon04cc7qgIJnU0+g=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C893C586517EC94B9862CFC056AA2633@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5910
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF00039233.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	81f10e4a-4441-4ac2-38e2-08dd0faf8fc1
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|35042699022|36860700013|376014|14060799003;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?MX81cw2B6ake4PBTYlivIVyTU4RZmBAaSGn90b3y49otFeAdX4JJXl4nuUAz?=
 =?us-ascii?Q?uNC2Sp4oxcJYcOfPZOAyV1nVDFg2gfDa4rYhvMZwVzMYByoIyKYlPkgGf2Aw?=
 =?us-ascii?Q?zVbQkcict6cLMuFndAya4T3qto5Qw8Skb5LOVhVpWPl8mRoEOUQGXjN6JXKq?=
 =?us-ascii?Q?ba3B4cqNTf9rHW2Rq4E3dQJ44JxS0wnQ4+XTvIbMI6y5iu49t/c+on493Jv5?=
 =?us-ascii?Q?h9HC+vDxAVEuHMil5pIbweGgJCeUfaJcwQL5rZzEfyFpjdnKEBzdoXonpSf/?=
 =?us-ascii?Q?L4Em0XaoajDGR61pWvfYrgIo5n85VZTxbBMDfQF+llyKuGCW/Y9s2M2wiYpW?=
 =?us-ascii?Q?AvnXaesNqLTuzKCsf4JRQub8TWvE7pT/4/IUruvd6+RP9HzaOYGUXsPAmxPK?=
 =?us-ascii?Q?oCvw2ZG3FHMrm4l/GfFXvAtrLmfKvRw5779hYVBwzUFV7t2fHfjNxi6Z6HMk?=
 =?us-ascii?Q?b+zbT44Mnj+zM3a2LJ3tWuoiucQMXbWQmmLAZdTf4AFj6XkIBjwxygZV0/qy?=
 =?us-ascii?Q?fowAQB1PzXd5yTQA5LyVmMU6TKwOJzxkD2taDslA6baMsTllHHObfRZUuApb?=
 =?us-ascii?Q?OqB21f1yeYBH7VvtUYmrmlPkXALphVrskJawPx1tH1CPkkXjVYXegfIZbgBl?=
 =?us-ascii?Q?GBhdAzNgC0e+CsBhs+b+PhRXporXtPaZ43sSTfHZBjK9wm1SD4T09swv4g3P?=
 =?us-ascii?Q?Yf4j+dpacYvZ7AddRWtyGCeUh7M8iLjr8faJ+Ky1tsW9lzVx95qv7WbmXSA1?=
 =?us-ascii?Q?1g7EMm3OJRKU6ZDgAUG4Imonb24SFEXgQT6u5eEp8WSlYNZyIdpf6p7smIBH?=
 =?us-ascii?Q?u3FrL8hhKb5xl33tJdEhwGyqXbgaHsGV0ZjsEcA6VtPXUamKoqwf6AvfDIb5?=
 =?us-ascii?Q?QivKTFcK2//jjMj8E+ykfuedhbCxE30REGKHu4gy/TOT/eCWbwf/vEaX/p1t?=
 =?us-ascii?Q?kqDPjz5sSyQk2MCcTWAHMBxc6B/Tt9HKcf74obZnyTKejcZIvO9Vb05wYliF?=
 =?us-ascii?Q?UgsMvg2Vl0oiCGOwM6zIQTcd1ZvCSJppCRDHmJfRdin1m+6+mKcE9BT2tTAZ?=
 =?us-ascii?Q?MT+AS3WcFHg1m9C7jzLAEn5oVSOmkZ7KadBSkdVFO2WU7BGCpRyKRRuAN2bh?=
 =?us-ascii?Q?y8HRhCzHgGou59fqtfbcDc1x1Vkqd/4Od578GRG7PTk5cQaYtZZIYk87QtXp?=
 =?us-ascii?Q?snIVGm+MsehVGsXafn2/lIo3parSaRtBiqsEOJYs6wC3xgu3itAWi9o7YYIe?=
 =?us-ascii?Q?1ijno6i+HnFiEaX3ljkcgKhE5EugsKkEsDJccIMJJtcG7hY0+lFwm+Q6rNJw?=
 =?us-ascii?Q?TBfIK32kqtR3hOPqV1IrrusxYUrjJk2RGb0qqaaAZYPsDiiKfM7jEDXMCllq?=
 =?us-ascii?Q?QfwVlu8PK0XW2mjxSixqEdGQMLfgFe70sPiYq3rjze21nzZ49BQ5Z7ac56qs?=
 =?us-ascii?Q?G6J/ixG6okwHNtMFG3pwtfk1qbYtSsyC?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(35042699022)(36860700013)(376014)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2024 13:21:35.3002
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f3f4771-d740-4683-ec9f-08dd0faf9532
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF00039233.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10939
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Nov 2024 13:21:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207989

On 22 Nov 2024, at 11:43, Markus Volk via lists.openembedded.org <f_l_k=3Dt=
-online.de@lists.openembedded.org> wrote:
> Add a patch that disables the pam test, because it would require
> pam_wrapper recipe

Can you upstream a patch to add a meson option for the tests, instead of us=
 having to maintain a patch to disable the tests?

Ross


