Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2E66C61DD3
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 07:55:38 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.38])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2535.1788422130333925616
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2026 00:55:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector2 header.b=jzYKKPC/;
 spf=pass (domain: ericsson.com, ip: 52.101.72.38, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jHsjXOJw0Af/Fr52+bwsKwyw0nMAt4W/ymDne6cD4XBhibyOYzdwK5pIM9O1/AyjhyPg23M+V/oQVExMzMGMnB1QL0mJYC02A34kk7uzRtNgID+7CdDGBhlTLfYJxfItkYqqNaWc3nm4YWM6zbS7VKtByNuBH/6lciPTsKl2isvHG4o2ZHhDOFn0PakcWVX/AcNXvk+0le4TlrzP+41KktjgNWFnsnY+VCcRQ8lYNXTSRhqW7oAUz1a6fRQ1XMxd80bnSgDS6mwh7yyQ2Z3zTdgnT/0I2skA3Cbv9JpuKrEDDeIyXBFiGZS2Czc87msfk/7U4j9ycE1VKdqY5q1wSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ko48BqbZ+tsBqZJ3bi1fu4E8XIvTxHCVUEFncmfcN3M=;
 b=EznkT+LtA9QUxMgk1t3nfVkWOCxnXhhccpWGz3qWtHeWgU6KJnuSRnYS0kgdfF0AxMsaxrvzofF7pSjb1yEFP5b2jJtLiZdx2xuS3awyEQ9X6PNewliT2jkFp2Kx215sr+GcWvSk9AF6KtUJpvRNLx7B76rpu9CgR38dW+AHmbYMYfdKMUeYbNG0j1GBONqd1u4IpQmsjKIxPxps6SunrpoANo1JOHnYYQzMLQWx0VtfyFzvgI9oPVDNiktkn9A3zcAb5EzN2yZep7uNjn53sFUZ+QB/x8c40WQyenkb5AwtZY8MNi3mDCqvz4maEzNXZPxTPL8QwyzxyEsF7e2I1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ko48BqbZ+tsBqZJ3bi1fu4E8XIvTxHCVUEFncmfcN3M=;
 b=jzYKKPC/+FLMf+BXirTNZPDc2GkQkHeaD/t8kCWNNvzIzld/qYMMiW6nCpF8B/m5ZBBdYtDU70qHhYzM80VijD6IFiw9S907JuBW8K2b/t48amIcbHs91JoPU54kVlqbAs+aZjFaaaKVGIyey5tUvn07fRuUjNcvELKnxa5oXKw45TFdxi0OR5fZqZ2DqLDgVhfrslVo/SvAv3hDBJgSQbZwi5t3AFHcXixfkSK11gX6/3tuyuQU8EtgkMlsA0C2cvGyLobhR7D6QTXHxUxKrW1ILy0GNVcJyUCCRQpNsJszl5A9N4KxTz1mCGX54zmJF5ksl93JrffFbefXfZQh8A==
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com (2603:10a6:102:4af::6)
 by DB9PR07MB9271.eurprd07.prod.outlook.com (2603:10a6:10:453::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 07:55:26 +0000
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7]) by PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7%2]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 07:55:26 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
CC: Ross Burton <ross.burton@arm.com>, Mathieu Dubois-Briand
	<mathieu.dubois-briand@bootlin.com>
Subject: Re: A walkthrough of some of the challenges with auto generated
 changelogs
Thread-Topic: A walkthrough of some of the challenges with auto generated
 changelogs
Thread-Index: AQHdOtDZX08hEwAdqkOY5wYM/E7ZO7a8fVGP
Date: Thu, 3 Sep 2026 07:55:25 +0000
Message-ID: 
 <PA3PR07MB107211B0D283D9025D46DDED68AB62@PA3PR07MB10721.eurprd07.prod.outlook.com>
References: 
 <e13a77790d4c9bb55bd61aa59ff433c703b6f3d8.camel@linuxfoundation.org>
In-Reply-To: 
 <e13a77790d4c9bb55bd61aa59ff433c703b6f3d8.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3PR07MB10721:EE_|DB9PR07MB9271:EE_
x-ms-office365-filtering-correlation-id: 371ff54b-fae4-41e3-1b16-08df0990b6fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|38070700021|6133799003|3023799007|10067099003|11063799006|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info: 
 tVGENkBqNGR5i0rTtlEIK2BfcmuXRvlgWX2m/++QUA1jIEK9Jsjr6/dEBB8/EAj+bR1J2MW2xFyB6MAEw250aYM2UV0cTLHj2qhHvQGRkP16NKpcEqDrj/9a+HHBYcUUyOgt9zrSmTb4kslWviDr1vk/+GEe2H1QkDw9J9iXvutJ0OBX3/Cp/Qzy5OKFfeMExZyeVYiXwPmEq5+0jMuuHhFsGJB3uFXSGSlTNZjZ3A+b3Blyqecs9GjKqbRbNx4LW6RjGOU36UNUTrcPblt6wDXEfoMqsf9RSJ0zlgg2thqwzChcaJg+gAevCtNTtQudv4vWJjEn65itMAAA+v6uGwfY4ihoJdwBJEWW0RTUv2KtxrNW0MW1lmT6GZqzbNtZdEnuswRds4i5xTd7RBzj7koZ4TH4rbrmAidc6YLqnQY+zr+H5mHiXh+L19hSRBQLWntPyoQZ6NoeKidpSihzJy9afgXR3SX/97Ka3j+dMsdi7+hL7P8Fulo0E24oq14bJLAzETkNjIgPvOA8XNj1uDPB8HrUR+FuiuBcbKiGLq5HLzoOzpgK5/Wf3ZyWs86x6eT7NKivOCwKEM7okSBjBvL3HlUZ2ZZ75Y3nfO/3fUx2+7wYXBoi8ljaCBwg2dvPuF4mhtuFTijmFp7rqPQfDlZr3htume50hsPLrI07/zuHi8tgRRV/mbSXPcQ8jsrmxhyuaTsoRhgGPBHonSFpItuuWe0JXGHqVElgfvLqxBU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR07MB10721.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(38070700021)(6133799003)(3023799007)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?Xaabms0zWq0iETsdmHd62q6cByrveA6b0POy+ySHOkdtW1rKRWLmDjBiVI?=
 =?iso-8859-1?Q?AjIMq+dcpf5EC2ajhPkkNk7rv0xGMkB96AoFAGknqYoJPyx2X3tlyyRyQM?=
 =?iso-8859-1?Q?+oRvF6AA4Xt3s8RFAyb/dO9YhJOiMfJceE+48d9G4u44Z8T5RtOOHQNK2r?=
 =?iso-8859-1?Q?IHZoezbJ0TOqeYS16utfiT3VIGfalH93pPQnuHnESAhcPekzXQVno+tjhY?=
 =?iso-8859-1?Q?DMfNiTePppqJLwsfwgdkKbSLM78GUg2lvLNX+LdjtPS9sXfWX8soOjbR4C?=
 =?iso-8859-1?Q?FpQT/usQPtyMmZzkjOLT9HzClpfLJP0l0Vp/ntOI7WdTiuXtZKz0zl1Qh0?=
 =?iso-8859-1?Q?INimeWIce88Sv6Udw/eDelg/5G6KGZ7u/Vf7BV2al+GTIB8o7NIWhs0gue?=
 =?iso-8859-1?Q?ZEhPZVYtY38AIlklLyiT9wvbXsub0qGa4K/eQmuJihW6kVMBPKT36LRQtQ?=
 =?iso-8859-1?Q?LP1X4vT8ksgRBjw43vN3rP2j+ZpGzOSNG3ZwI6QaL7/dJ0mXixbzV+l0Ef?=
 =?iso-8859-1?Q?oEJ8LCPFrtpt4CUvGYERliinqGjexuUjSgsWirO2T+kU0HaLCRhUBx5EAA?=
 =?iso-8859-1?Q?ff/J84MlvJ1MNInEfeOFeGx0n2dvo2jepD9ArSrbqoZJYMKGdwcjsLxRTR?=
 =?iso-8859-1?Q?IPF1R0/oiLJZBvAEWhSMKjymW90wSkterweUJD+la9BnDNsI5waGVz5kFF?=
 =?iso-8859-1?Q?BQxIbPj1a6ESzjaAcTaSQbcdnw1jy3GLnMSQ/ENbQToQZk+XM5nLnPNswH?=
 =?iso-8859-1?Q?B7GrV1JzB7I2EmH4/gB8T7aFDy//inq3YuHwdMrRaecaS7KsWJuMUTgXD0?=
 =?iso-8859-1?Q?H1xRPJoL9E90iTchlFCMUzSUxXdmuFJ4M+xwUYZ/QOZqNqdsExfRdVLbUd?=
 =?iso-8859-1?Q?M8L/fCEafXOceiRlTFko9Ew+R3L6cuyA+2MUUj14JfZL7iUovdaWt0REij?=
 =?iso-8859-1?Q?GTnfemWiawOo1RTnaQHgmKpV/O0jDglH02R2BpL960SUartJpcznI8IEwb?=
 =?iso-8859-1?Q?IokMzDlEV+kysEr0klqzOwMrZJowbtN2rV5UC4bHpKoYxm/Lk4yL+D/k7K?=
 =?iso-8859-1?Q?YXwgYBFJsHyHxavkZo2AAm5Rcc2BbZ2l1tR5wope7AsvUK12Usow16QnKO?=
 =?iso-8859-1?Q?AauFvt5TzTl/LBODgDei9HvtIWQwlUkd2pRrRwPJnmoqrRu5vcYlUNkPX1?=
 =?iso-8859-1?Q?ExLK7pf3pwrEV5kfTF0EOJf9RpTOQAgxUo2aUlGMlgg+CfBmVXqRFU3sgX?=
 =?iso-8859-1?Q?ThblUbCxTNlAvVWkyNbQRFYGetITnCUtLMmBLvOkbbSmZYPg1EAlIR4E6S?=
 =?iso-8859-1?Q?E0KfOK6pJSys296V6oRMSaMF5wTVHP8nQbqbJyfZVS+Er1GrAJto4AuVV/?=
 =?iso-8859-1?Q?vMEapy48t/Go/Ggj5V/oLJZchxhNh4kR7TzWLEdjSrn0x4jc1A1hbrwcCN?=
 =?iso-8859-1?Q?O1bSlVMihK7ubg075ccG3DXahRcnKg7/B7k97oFVZBk6x09t1Pb2225l13?=
 =?iso-8859-1?Q?oeO9rnnymBw2P9BtDdKmWLWHhOGI2NZL/h6cA5DQoLOF7WvM8p/83YhKzM?=
 =?iso-8859-1?Q?/Su/FuX7PDPGLN4zTud/cAXjF2ekJiPvaBE0EH26ahKvE74pBSmpgP3/Yr?=
 =?iso-8859-1?Q?Hpnq+dhFP9z0WwdU6rEtVxV3bMBRlJ2llgQUveCFBeZUzBqRW3QEnW6uvI?=
 =?iso-8859-1?Q?G/baPH/7IaRxbUQ84LcywZOliO9FjAZ38oXquiYNMHJRVn0Jx5eL76E3Jb?=
 =?iso-8859-1?Q?LLHxw5G1/5kn6+5fpI/OD3k2ZxFylU7XoUJWqHw5VbG3UNn8zxdds+5I8h?=
 =?iso-8859-1?Q?8AWifjyasQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3PR07MB10721.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 371ff54b-fae4-41e3-1b16-08df0990b6fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2026 07:55:25.9488
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DUFz+3fJ3+koWJBNn8/NNUQIpMPw62a5RhlexiJES1P2BCE8wIufI3cohU0fnYiiIL3bkMxELplQMCusUMC7GroCx8sqFP3pXHY973Ka2lw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR07MB9271
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 07:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245015

Hi,=0A=
=0A=
Thanks for the input.=0A=
=0A=
On Wed, 2026-09-02 at 12:47 +0100, Richard Purdie wrote:=0A=
> Everyone keeps telling me how great these auto generated change logs=0A=
> are and yes, they can be helpful but they are also piling pressure on=0A=
> me as everyone has their own preferences and personal "triggers" for=0A=
> issues. I keep getting told how XXX shouldn't have merged without YYY=0A=
> being tweaked but the tweaks/triggers vary per person. I also get told=0A=
> a changelog is better than none and that we shouldn't be spending time=0A=
> on it. I can't win.=0A=
=0A=
Maybe I should write a proposal on what to include in the commit messages=
=0A=
regarding the changelog changes?=0A=
=0A=
My opinion is also the latter. A changelog is better than none and that we=
=0A=
shouldn't be spending time on it. There is always the original changelog if=
=0A=
people is interested in all changes.=0A=
=0A=
The original intent was for the stable releases, where is more important to=
 know=0A=
what has changed.=0A=
=0A=
>=0A=
> I'm feeling bad that I haven't written down the things that are causing=
=0A=
> issues so I'm now trying to do that here.=0A=
>=0A=
> One general issue is that we can often delete the "Source: ZZZ" lines.=0A=
> They're good to explain where the data came from, we don't need to keep=
=0A=
> them in the final commit message in most cases (unless they're urls?).=0A=
=0A=
I'll create a patch for it for the AUH to truncate it, so we have both. Tha=
t=0A=
should be simpler.=0A=
=0A=
>=0A=
> Taking some recent examples of other tweaks that need to be made:=0A=
>=0A=
> "appstream: upgrade 1.1.6 -> 1.2.0"=0A=
>=0A=
> This one has a truncated log. We added a test to patchtest to warn=0A=
> about that, patchtest warned but it is still queued. At least one=0A=
> manual review missed it too. We may want to up the auto-truncate limit=0A=
> slightly.=0A=
>=0A=
> "python3-pdm: upgrade 2.28.2 -> 2.29.0"=0A=
>=0A=
> This as a github changelog. These are more readable/shorter if you=0A=
> strip out all the github PR links. We really don't need them. It also=0A=
> needs linewrapping. If someone doesn't linewrap it manually, I get=0A=
> complaints.=0A=
>=0A=
> "libksba: upgrade 1.8.0 -> 1.8.1"=0A=
>=0A=
> This has a lot of noise in it and isn't well formatted. The commits=0A=
> hashes, dates and people can be stripped down. It can be reduced to one=
=0A=
> or two lines.=0A=
>=0A=
> "re2c: upgrade 4.5.1 -> 4.6"=0A=
>=0A=
> github pull request link can be dropped=0A=
>=0A=
> "librepo: upgrade 1.20.0 -> 1.21.0"=0A=
>=0A=
> Are the prefixes with the commit hashes useful? Should those prefixes=0A=
> be stripped?=0A=
>=0A=
> There are probably other issues but those are probably the most common=0A=
> tweaks I've been making.=0A=
>=0A=
>=0A=
> So in summary:=0A=
>  - could/should the Source: be after the scissors if non-url?=0A=
>  - can we strip out the github urls for pull requests?=0A=
>  - can we linewrap the data better?=0A=
>  - can we drop commit hash refrerences?=0A=
>  - should the truncation limit be slightly higher?=0A=
=0A=
The last one should be easy. It is a configuration parameter in the AUH. Fo=
r the=0A=
rest, I will look at all the issues that you listed next week, together wit=
h=0A=
what Ross reported a few days ago. I hope I can come up with small patches=
=0A=
getting it better. I will probably need to add some heuristics to distingui=
sh=0A=
between the different cases and hope not break things.=0A=
=0A=
If more people has feedback, please send it to me.=0A=
=0A=
The original intent was to be a help when doing recipe updates and not a bu=
rden=0A=
for you.=0A=
=0A=
Cheers,=0A=
Daniel=

