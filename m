Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF913CA5FC1
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 09:05:43 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.71])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9293.1790759139873741239
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 02:05:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=Ueqxz6tg;
 spf=pass (domain: est.tech, ip: 52.101.70.71, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=blJ8UtBshPutgL9mdbArqiZjjW53sXJRsbNVbgO2VIW5J0F8zCSw+GDS8NyswYiptRAUjvECCBwI25zOMBjgKw0XZhNVVZ6a7PxLgT1Jr2q2CuGacR6sRwQZMD4o4HXCoGXbE4YYEo4FyFdGhIInBftphWnbZnaTdM4iDIlc17YwMyAUlBPFv6NQ1DuGrMMOCBA5Ng1r3NA+EeI1Pr4GGwIP5i/3UqOfzhLU5utuBEdF544l2Gl7TTP+QLIN1vLDgW2mYpsCIsxgUM1aSm5/qh8XIIRiw4b7zxjEGpz2S/V78QIgxKwh2eTEKJGaVK3j9fO9dHgRYk11/EylAKj4Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WzdDvmJaWl42TDg7drMhvqMs/Nslc2Z35orwn0Q2dxY=;
 b=hMdpj+EQrpZUd4Mf+CILBhIae/z4VKQyszAtb4UwoBeXG+kDxsSbNkyCYzm299M9o4rILjq9VsHN+OlUke5QeViifPtP1PExssZVpThVsq8/mE4XwBF40ZLy7INFCn4qczEisE5KLcxw2/9QNhUSC6Mia3IHTyb/DfeOx+K8Mb1T0CdswKzZlIfstY9K5pVbpqVIMLW8HevCmxLiUxMJWMu4MKOgraPsqjCDnxeT9RMJuZzZEz7pm7tKbSGEQXn7X81dwonEfuQM7xK9os8D+UiB1nXF8BXyeNNXPcUdGuNJPYmB8WfRVOfSp0lYoXCp9CzA01WN/IG+gmpcYnQi5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WzdDvmJaWl42TDg7drMhvqMs/Nslc2Z35orwn0Q2dxY=;
 b=Ueqxz6tgyO7dE+TMxd5Q2D+8Wq3yUHZGLOW8maxL5r9vbLWuz0she4aSPDHNPahMZpCSoJyXGzxUSzzS15v9RLAnDdwV/0EXy3JPH76C/Pl7fh4yBis6k3NHiLYLiQdDhQ2Yt1FSS6eGOuMoqjw5kECZwIfjTdNV8n06a5FRNgnEsj11QiR7AbLPKcuhhUVmN8wwJEmjexqOfqfnwakUlKxpxNCiWePttzsOT1Ao1bPdddDYdxtFB/NYKC0JcQc5N2EFfkc37z38RGb7MW8dhf2H+f0iMOYyffeC1zny4BKHCJ6XdOYDRFphm2ebDeBJUdYXlBjLP/L8GMNcfQJ9NA==
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by AM4P189MB3384.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6cf::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.25; Wed, 30 Sep
 2026 09:05:35 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 09:05:35 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "pratik.farkase@ericsson.com" <pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH v2] libpcap: add ptest support
Thread-Topic: [OE-core][PATCH v2] libpcap: add ptest support
Thread-Index: AQHdT0+fszqjGFuab06p2dX5xS6dFLbllUIAgAFAizE=
Date: Wed, 30 Sep 2026 09:05:34 +0000
Message-ID: 
 <PA3P189MB3239BAA905754959BD44BD20FE8B2@PA3P189MB3239.EURP189.PROD.OUTLOOK.COM>
References: <20260928130950.49433-1-pratik.farkase@est.tech>
 <20260928134522.51765-1-pratik.farkase@est.tech>
 <DLRUMWW7UMVV.2ELAA2KNK0F22@bootlin.com>
In-Reply-To: <DLRUMWW7UMVV.2ELAA2KNK0F22@bootlin.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3P189MB3239:EE_|AM4P189MB3384:EE_
x-ms-office365-filtering-correlation-id: 12ffb66e-0d8a-4542-d224-08df1ed1fced
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|38070700021|4143699003|10067099003|3023799007|11063799006|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info: 
 8lfJRXjKwTx/tvl284UIzZomh6AzA85+j2Ii5LUKfH3fWsmdfqgcpqtfgS3JdKbOOxhOXUDsUCDmoN7laLm4ojoOtY10czc2ib1jOEmCsgdeiHbsmezgKM7vnFclxOouKeFgkOXS8ESSn9KOr9lsrSbg7ps7Cb5Iq+x4URYYkw/PhHE1PRbU/RYPAqCT1WVV1KaVqyzYygiToBvrNHrrzQMoCz8jplR7hkj2i6+71UP8pQdq43XkyJqYxugn6v0MlU1oz2m3K8nRHzeW9c1VzY4jY5WSg+8DDN37XUUt1Wp0Nr7ANxVCJjbosD/445+B4dQR0KvC6S5B5xyYk1RR4xZ/m9OMFCcKvc6aSfyBZUPd3HoqBj/hiJf5A//Jporep1bRDB+MF9yosDjQTwMezTeinoV2BAo18ltbCMeyWxatqsvnBWDAmKt23cU6gd/d4pf+db0waEymb3mXOpaW0it+6IFwWLeF+Nk1pIvctPPOvIJ0X1JGbR8rVfAybtbIrqB1wHJTdYj3gUjyXVQlUcVET4qQvpdgxPAWGO6e5G4UvwIsy7Ap9eqdM5ORy8p6vE4ldPITdigC2M91BJNI7KzF+E01NM2xbWyRvyLhqxzsPDlgcSs7mxsc3pc4A5uwZXNlBNRD+wKYfMOJ8OV142lc2qc2yYcJwiJw4sYYcrI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(38070700021)(4143699003)(10067099003)(3023799007)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?dyJTvDzsX3rjWRLV6Bbjvau7sfgXp5A9vCHQbpYmMKM/q+/dDL8THZZEjTHe?=
 =?us-ascii?Q?upUME3w62oNSHLDoofPQ87RcC5cVCRJWevVMLkb5jGCrVVHjdY5ghldNXytS?=
 =?us-ascii?Q?cj6toExON8ONI0islyOSSMdcQZ2Mmc9664K2K8/Y4CYr+ghN86rOHkf9vkGA?=
 =?us-ascii?Q?AEaiVZ0lsSfgXqMI07CX2S/5ofXbKG+vyBnVvV+mKUP4irHqL0zLCkvbSWit?=
 =?us-ascii?Q?9US/DKmTmWZYrFN5AMGnFv6QEYF++UNJz2V6AHN8QZCucl11XoaUAY/rMuwm?=
 =?us-ascii?Q?SCjE5o2e/b7rLZimJSUk6Q8b/LRKOVnASE2F+stESUJA6rPcyNPPES/eonsb?=
 =?us-ascii?Q?zXlXcpCjxG//9OIkbL5K9Bi02X/44O7wT2O5Hw36nYx/YlWinro3rwEkZqZt?=
 =?us-ascii?Q?yUl2Ws1ZC8/8lr+bHjgaUBmzSfMB4U6Hvf5ybiLgqcZohpKgHUdyZTtnWwPe?=
 =?us-ascii?Q?dIPLEtPQkhnBcyHL9WAzZc4pV7QXCYfbbgFhTWM+6NFwY0oAZaukjhhNYHC1?=
 =?us-ascii?Q?qWRycq6KauxXwRI5/Ic0KOtyfHxNhqLF1/kVRTwMdjnYE+RKuzmzA5V1oaJ8?=
 =?us-ascii?Q?BwVSbggLPLqu5hDVrjLpijQFrBiW3mK2VeTNx71St5xQlOG/EVm8YPmooSgL?=
 =?us-ascii?Q?nRcCLysgwszuqEXoHBCBCXX6In6eiMWQ/9uKs/ySPSnuYXk86t9fZ24LQBie?=
 =?us-ascii?Q?Myixtx0R6+VDBCImFZyaNKTQWNlI3npU8Q4FLs0V1q+hvhYh06/tl4wWRq2e?=
 =?us-ascii?Q?dChTRSPB3ScJiP/Sz5+5nryO0owlA6qWDa7JiyhOcdAsWNu5xwN7n56eAuL/?=
 =?us-ascii?Q?+SH7wA4V/AIF4zDs+jPl2lhyUDRJge8+M5Yq1pW+T80E6ACdd8gFS8/kh/NK?=
 =?us-ascii?Q?yMZef1MHyOmO+zihieMk3Oir6qejfBkjagEc3iV0TYmVvvdgvkuuGiSq5rJC?=
 =?us-ascii?Q?8UM3w0ROHKF1wP6vXPiWC/EW0fn82SK+sOG/Mr7jEzhaGcJGOd5EfYHYKbYx?=
 =?us-ascii?Q?YirDOsqTXu4IhCA2TMjMr/grrT+EyfiaVGpjf1Eyv22SSPpPjtfCOcJkKKLM?=
 =?us-ascii?Q?f+t/Xoce90BFxk5eKnJ3ZlMDpx5jwZD3lpL8CO/BbzlLqk1q885lMnDAvHtp?=
 =?us-ascii?Q?W5Br3OStkk7fRgp8qVaFXZ9+0r950hwIKdWtq2nBxoALm8eeslRnf4JeONOR?=
 =?us-ascii?Q?wDI9EFEac53nJGjwMBT0rNOxNqSXVF1AkLdKX9Tasm4U30TkXjkWkiCfnY7x?=
 =?us-ascii?Q?IFzQ44JYVOmJyNuu57PLuXfb+hCWTtyBRSMOyv2Z9dt1gYFPv5cQ/Lw3nAqm?=
 =?us-ascii?Q?LyA6Wyz2m/etKOmiHPdqBkqGeSZ2ZcUlav9iwd/pwHDLhV0uhokCS9fuQWo3?=
 =?us-ascii?Q?3xjdlz80kKcnedLEgtwfnynYIO7hm3cvg77pkmZtidbWlGqjwshqfvmRbxfQ?=
 =?us-ascii?Q?U+voZ5ruItwfWMnfjhVvBjxo3vtWDqUbR8Kkr22zxzaffULvINQqaqdF0qqQ?=
 =?us-ascii?Q?iR60V0Q6o9g2aB5/ozubGIJU3I5BY7W4ONDcodK9f1GyPjyifjvRbsphMO//?=
 =?us-ascii?Q?DtqK6XPIr+6jPFxrW6VZ4I25DhJptfximYBmeNKANw8T+t21oxW9PRbGZ3+y?=
 =?us-ascii?Q?Ln+x5eYYsoWMtsu9sCNKLUEglOXQxiyE+uR9bTJUutheDJ1fYDTuaDbNPMAx?=
 =?us-ascii?Q?CMATg4E6/IOeDSrVqYbPwDLSpJ2HFUcSRFu6H8dL9+ALE3uS?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 12ffb66e-0d8a-4542-d224-08df1ed1fced
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2026 09:05:34.9358
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xit3mEreh6Ehg+C7LeDFTS6I5qipnvql0ufHJapZh9jg4VN1Hj63OeVwvJBtbu50Ue4rZBr1P9/N+iZHkUCrAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4P189MB3384
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 09:05:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246949

Hi Mathieu,

It's been recently observed that many ptests are failing on riscv64 arch wh=
ich is expected to happen to some extent as it's a growing area and has tim=
e to mature, i will send a follow-up patch to disable these tests for this =
arch for the time being.

Best Regards,
Pratik

________________________________________
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Sent: Tuesday, September 29, 2026 3:53 PM
To: Pratik Farkase; openembedded-core@lists.openembedded.org
Cc: pratik.farkase@ericsson.com
Subject: Re: [OE-core][PATCH v2] libpcap: add ptest support

On Mon Sep 28, 2026 at 3:45 PM CEST, Pratik Farkase wrote:
> Build libpcap's upstream testprogs and run the TESTrun harness under
> ptest. The harness drives filtertest, translatetest and enumeratetest to
> compile and translate BPF filter expressions against bundled savefiles an=
d
> compares the results with the embedded expected output. These tests are
> offline and deterministic and need no capture privileges or network.
>
> Tested on qemux86-64 with ptest-runner: 14801 passed, 0 failed.
>
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
> ---

Hi Pratik,

Thanks for adding tests. It looks like this is failing on riscv64,
probably because of the performances of the qemu machine:

AssertionError:
Failed ptests:
{'libpcap': 'START: ptest-runner\n'
            '2026-09-29T12:01\n'
            'Timeout! System state:\n'
            'Collected system state:\n'
            '+ dmesg\n'
            ...
            '\n'
            'ERROR: Exited from signal Killed (9)\n'
            'DURATION: 451\n'}

I did happen on my two runs:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2498
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2501

Can you have a look at it? It might be some timeout we can increase, or
maybe we have to disable this test on riscv.

Thanks,
Mathieu

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


