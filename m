Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E9BEE7719C
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 12:18:29 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.54])
 by mx.groups.io with SMTP id smtpd.web11.17159.1736511502221070427
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jan 2025 04:18:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ebFTTFyi;
 spf=pass (domain: arm.com, ip: 40.107.20.54, mailfrom: ross.burton@arm.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q09vBlG5LoxEk7VjRDMdmuMTDMo7en503TNa1Pxbe1MvvIl0DA4g0mO8jWJEreH2PJWIYKAd9mKefZUDOc4r0y6kQFFsIhy8ZrdrQSKT45Z7QFvEYAa+o10F/z0Qiw7V9WsEv/aZmd5Hipk1hmbWyB+pR17gCi7Ze2jTcJDcYmxE3RsptWVIQYNo2/OTbsBortMlcPCWWC9qVyDnH+quyNwKWfFd8IqGvrKUV1HzL5rGrvtaLEeibolxKgPPkkQgXl7rmHcz7ClB+xSaGWxO/oU+qFY7aQN8pUcVjyS12dFL59wpi0hbexM4h5icOEqwwsxfAlR9ewf8OMQoDkyfsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AjvGb0cTE4j5DJX6bYf7pU0XEJykc7GBrWsZ85xZEOQ=;
 b=OdPC93K5Wv5ABXTF7z79y94OAxQ2EtmrLwkb8OVVeW8NAAQ+/FGSwFoM+uQq3rkk9Qxt99BsmWoRkNGfUxWsK37BQIj69wEwU0SWA9zI8tBeP4bZoWtlidEuYPZ18W19Ktb2JSXwONJDamcqokJ7KXaMw+a9prBCeKQwyaOTaecU7qbj/lqy9VFJsjqQdJyeelu69BhMWWDzHJe3ugcb6XMvZ0frG8IiSlv3nyRAvZLAYyf/EH83Kz6YNz0EBNJGbDsQzn79Go6jVFHbeREqFYuwTW4TD2AcIvETImfyShJNdemarTu8G7/VljMjTa6xkCv2yuHz3j7YyzuvLyh0jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AjvGb0cTE4j5DJX6bYf7pU0XEJykc7GBrWsZ85xZEOQ=;
 b=ebFTTFyit7D7XdvZq6F6AZ9fGKA1xMQ9GZa0tWSGoiqeNGzeqxLp7PGaVQE//AUNVsx9OQ6I/sSXmhXuE/OyGmONSdmO67BcM5QdXweO2+mKAT3k2Yq5aSpsqqhcXf2xliXyx4RLKpPJInSH9L4Un44rsucl4HaxzsUzq/1kvlc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB9146.eurprd08.prod.outlook.com (2603:10a6:20b:57d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Fri, 10 Jan
 2025 12:18:17 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 12:18:17 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/4] rsync: clean up configure/configure.sh
 fiddling
Thread-Topic: [OE-core] [PATCH 1/4] rsync: clean up configure/configure.sh
 fiddling
Thread-Index: AQHbYeSYwYlOlVUAYUi5hWsVofcLQ7MP0YwAgAAeE4A=
Date: Fri, 10 Jan 2025 12:18:17 +0000
Message-ID: <0C7DDCC9-98ED-4268-B74C-5B96CD823D43@arm.com>
References: <20250108154636.1431857-1-ross.burton@arm.com>
 <b370315d6569875756feb0f98babeae2fbbc59f3.camel@linuxfoundation.org>
In-Reply-To: 
 <b370315d6569875756feb0f98babeae2fbbc59f3.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.200.121)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR08MB7411:EE_|AS8PR08MB9146:EE_
x-ms-office365-filtering-correlation-id: 2357fd92-3e6b-4d95-89b9-08dd3170dd60
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?LjYe+SyhE0xR6wgOR4hezaCD5LAwdH2jCCP3JmyehpL+z0ML+Eqw+aCD6i1o?=
 =?us-ascii?Q?dPursP+pGvVj7sWb57/vH/EbESbcimqvSstYfrUHdz/pIdZCOk/5vmOZ3eCV?=
 =?us-ascii?Q?0Oup1c0LJ/FGx+PJm3mWKoKtOUelhMSfKxHV7WVc5IYYgtcenHlLM5TgJtjA?=
 =?us-ascii?Q?NZQy1hWNpc+kxgvwj6oRVkkrrup7vWrhYIXWpQQBfHmzvRUZSxZQ/3mIj1UV?=
 =?us-ascii?Q?RLXg4a03vPcRH43ClhOZd4+ph8xjujPPe9ISHA7gqnVFDpHBX5NG9GlHdfN9?=
 =?us-ascii?Q?/3DlmwnKXTUTKCnbQoyYaWcJGZqmg6rmpqaPV5tj0d2i+2IzcAwECa9pD2gP?=
 =?us-ascii?Q?XTzcv5e/cnhePZBAJCjElmnTAM/tZDAYPaPuMyD7+/ZJi5mTlCnT7wHpKIOw?=
 =?us-ascii?Q?L73jLFc611kqHsqV4vCvWxuY0dsDcabBafLUNs/s+kwV9shUMmDNmGfWy8lK?=
 =?us-ascii?Q?cLhqZ3CSdRY3ZPrWNa9oy1vUXID8VzwcuMBNfxpbiJBRU5gBedHpfaiv7K/C?=
 =?us-ascii?Q?Tn3icBjc73DKBEqUwZTCY8kk+wehqQFsKJ+P/HcL2i/rgbTGjAbdDvsvnZ0x?=
 =?us-ascii?Q?VegQ+W5p+zFYiXXrQ3n7qvZiDFkYIGKuOvq2UKN7Jc7e/yhhevVHZQ7eyAXf?=
 =?us-ascii?Q?rr394/4s9B+MeYXpzlgl7crgmEAoZi4AsrZDuTL9Kx7j6C4YKhGROk9CZXZy?=
 =?us-ascii?Q?US3IaA+z3CX3jfy+eSeZT7cJyE3DMVSafPjIpxjgIjBeTQnyoflxxsbwJO9x?=
 =?us-ascii?Q?Ero0IuUPh4Ry21aYfJLutxKY7a+wtT0mjNVMS7s2aHzuRK4gHpH8Ku3zfQ4Y?=
 =?us-ascii?Q?aguDH4kttrMfk8N5HAYTsHR1A4BI5se6nQBU7fUhjpM6mIZubTLYp+yhoRB0?=
 =?us-ascii?Q?rlpoDB/d4yLCL3x9t5lB3MAHXRrwXr5bXTj52+uoZ68x+FWPZsaUvYetOMK5?=
 =?us-ascii?Q?pNoGxTubPI/B5y14ozeEVAzhHoI1bSj5WgSSrxstWEK2scyKfo9U0Cw38aEj?=
 =?us-ascii?Q?nsTAjSQWDAIE2h27H1FBhPlCxQSNZSMagn690xBVat2qAKT04SR5E6Du/H++?=
 =?us-ascii?Q?n38CPJjtpzSc3eyhPLFMkVN3ONYt5WB8xekZ5M0XIhDWgCDXMzbOQJ9G/tHs?=
 =?us-ascii?Q?orDFJg6aaOPwtgCHXLt8OH/JyPDzj/QBHTua5P2s95YyOmvlyfpz8K7KhtHG?=
 =?us-ascii?Q?ldeH0XSKtWMbP5izrme7xbPLIs8GATSkXjw9Dqzx/Z5FaWJOJoSxnoUpm0Lb?=
 =?us-ascii?Q?u8d/YzWK1AOkYDXxKqvwUnja5EIVPjwrrskc+FrKdh+j9mlYdDOJ3kEvCnMj?=
 =?us-ascii?Q?cPwW+mCf7+0dQNdp0a1uPBoQqd2I+41WViOFdl5fmsEHen/qBg7Tj1+Kd/Uf?=
 =?us-ascii?Q?FlAu/j2S3EouVTJeyMo61iUTIP7N8utFVpofFO+qp+PiYTxqiU1FMUeyup6u?=
 =?us-ascii?Q?7ok7aZ8RfEU=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?iy3vIjJ/7J8xalRewzEOsdRGMsxmhTJk6ZnXi92iJ+q/IPmk3q36x8lKT1Av?=
 =?us-ascii?Q?ilKqbwtCjCH+yo8VSJczPsG5hO89Sa9mDewWYQTto69IWng/mfp8U7QEGnO8?=
 =?us-ascii?Q?8YikiSFDfwnM32aBkleWNqMH0k7T1Ctjq98WGbRDs6RFVjdXOtCUHY5s+UO1?=
 =?us-ascii?Q?PRX+hC/ZMWnoCazfHMHmGF/aQzPJfDQBQP46KHGnWesfLhvMe8gWtU2Ms7RI?=
 =?us-ascii?Q?zEuCDEOsU1VCjYcoFY/nxrwYgQ3Gq3iqmlQNnaVNEuVNqszHe1tacUvHKX2K?=
 =?us-ascii?Q?twbVuS0UvgyUoDQ1jm3/rE1eWdMuX4gMaWmF7QWC0QpnaRnaw9w+wZkXqsKu?=
 =?us-ascii?Q?62uNmooEPtCSaJ4TTaGT2V2Ea3wgbN6WvBxUrp0MeBKouhcm8UeiRR8wKUpd?=
 =?us-ascii?Q?DdWwOb4uzWRLHN7NbuSWOkRPbdKEnPMZvP4a+Mx3OaM8jX9X9Zt0qK+uJbJL?=
 =?us-ascii?Q?f0vao3aT/7RmB2fBkWtQ87aO5lD56QFGGVYtw72bgO2QZHzukZ9GS3z1Z7bf?=
 =?us-ascii?Q?gnZhjsZ9mhF53GOTdUvLDolKr2aEMb30Q8Mxhqx84BOv8BAAg+/IzBYOE/hL?=
 =?us-ascii?Q?R3h9eGTo0ALRh615TVaeIRpSw53UXs0Hg2oGGqMnjeBUq6gwmXvj5Pme06AM?=
 =?us-ascii?Q?ShjoQhO0cNYduTIzxi+787MH6RhMxQiFinydXhfo5P4hIhIBnpQSyj6/3z8w?=
 =?us-ascii?Q?RwT7DVjGlG+zGB/YiiBlOKEFuW2dOniLdSuXiMZe1EL2cDtGQ84vcN876Muf?=
 =?us-ascii?Q?ZbtH6hpVHhSW++kBxPyqnOHPMCRvfjoxnQ31xUchSGl7qINVoeU4XclhLcQM?=
 =?us-ascii?Q?gPSsGCq8YhXMoTTnweoMSGuiYoblFBT/Adgss617WjfRjILyM0VOOtodfg1L?=
 =?us-ascii?Q?PoyBFJQK51A7jP+0t9Jv/hwZYx+dXas0C6chgb5RPYYuCiby1VjFG/Oxskrq?=
 =?us-ascii?Q?0QZ90xvjui6uQQillFSG1+3dpaKSg+mDomS2dbduPnLnoPY5oPuGLXQ/nmTl?=
 =?us-ascii?Q?3wlSBbYB9XkvC2oQqVlGWQFB6M2Lq1L3ct6JWRan1aO4wqGe6exf8Q9L1wBA?=
 =?us-ascii?Q?IgA02AHqVu9+cGfW8RgX6+XS5FEG9rqtc4cSFaqTrpCIv1l03PyhWj0rnCAn?=
 =?us-ascii?Q?sZEk2cD2FPNrU17opfrZFTGCoOlbQHiFjO1+TVe+etf+RpZru6Dr+QmkoC7Z?=
 =?us-ascii?Q?qmUIG7oPqw6Eyulvj0ns14W0Z2t0rZnKtsNejyWmurj1DwDG4XtSFDlnalIB?=
 =?us-ascii?Q?G40BpZ5ofsHgQpE3m1l855+d2g6bWzvDtFhKcsUTidGKEe27QKKz9XYGpOVP?=
 =?us-ascii?Q?loUEbrDFAnsC8ZUvO5CPpCLmIwpMKtlxxiIuaEUi7C2QvQJeF/n0RkmmTzND?=
 =?us-ascii?Q?Y69en1gRyGGe3xDPu9VcuFb49lefmM2M7rV4Ust4YQwC3j2BzDJ2N0Os0Jw4?=
 =?us-ascii?Q?Mkefqy2PeoQRvvpe60EZPrw+6NJzyqG6ZdO4IYVYpDviqnLaCvaqOPoYA1Fz?=
 =?us-ascii?Q?PbLjmfjtqpuJGLRUe8YvQJXFbGo9MUP2BK+rQ2bbwk1rSqQJBMWaL6UNhCLO?=
 =?us-ascii?Q?GWZV6JYZl4cmhrNxkei4x+xaArBgsGpbRUQQqJWM?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E4C7178D55A6244C96A05C3D0244AE9C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2357fd92-3e6b-4d95-89b9-08dd3170dd60
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2025 12:18:17.6131
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: syN2wkKJ3l5x8GszpRLZLpjoBNnohKclx4qS+sJtTyQk/TQM6iyTNhm07knA6NYW3mnB8LoetEg8xwVu47Bi1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9146
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jan 2025 12:18:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209643

On 10 Jan 2025, at 10:30, Richard Purdie <richard.purdie@linuxfoundation.or=
g> wrote:
>=20
> On Wed, 2025-01-08 at 15:46 +0000, Ross Burton via lists.openembedded.org=
 wrote:
>> The upstream Makefiles tell autoconf to write the generated script to
>> configure.sh instead of the idiomatic configure.  We now remove all of
>> the Makefile rules that refer to configure.sh (makefile-no-rebuild.patch=
)
>> but some pieces remained, so remove them too=20
>=20
> "so remove them too" - was there a piece of this patch missing?

No, I just failed to express myself clearly.  Embarrassingly I rewrote this=
 message three times already!

What I meant is that I removed the configure/configure.sh workarounds, spec=
ifically:

-       rm -f ${S}/configure ${S}/configure.sh
-       cp -f ${S}/configure ${S}/configure.sh

Ross=

