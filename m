Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC348E81BAD
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 12:19:28 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.27])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46250.1770639559212858892
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 04:19:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=s2wpGFFn;
 spf=pass (domain: est.tech, ip: 52.101.69.27, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pyr7hlsJ5+wUXQ6gtmVZmk/U0BFW/Wmv7sSWMXo5Kl8ORhoL5bargOwmznJ8yW3Vp3W+tuRg1EyqLDe1TmA+xwjUsl/RN0+rqy3x67E9O2UHBnHvw99YxWFlF/h5QfVb7QjPMvvUy8bCBvPIAeBaG8JJwxG5WnGWmfw27EJlz9H9F3/RxgOxu4fqB3Nu4k2UYB7Mym1WofufnimV9ph0HqgAbuCDCAgaA6p3BAGY+Dfw5HgMptacHlkdga64z5W27nUyYQQ4mBtr4NxgDbb9uNQBiPD+bVacsGseqrjeFu0sb4FvNdaolIfoYplQJp1OQ2oedEC0dCOXAkHaGFvKhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rxTvZhXEfX65sO6wPJdrD6hGjQkn6ds2EoCGafpmDs4=;
 b=RKSThtIZMZ6Qo22f1cIuIt5/gatLerHn9kmHdYfehBZ5puSjGRbJLnNdkLjwtS7WsaQfMsF5HdsYLoKj2SYSWY8EGh/r/EC4r13oWilWAuAUGBdVeJC2OQj/Zg0HkyMveMziysnwmPVT+mK9PVCm5UZc3koPKnV9yhtqUxDKZuJehShs6l1bs+mdqxJatU2+Zn7J+QnNgKQ8kNS1/fFR1UTHIaBSRdlIs1RVlgGaJUPKP/MtbUTc5lQvuV/kLBNB4q3IoMOQriksscaJQ0Cl44q5Li2K6CFqxLiLtg4RcIDqLCjafwv+cjJnZ3D4u/jEPaisjycmJZeLd6VQ23V1uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rxTvZhXEfX65sO6wPJdrD6hGjQkn6ds2EoCGafpmDs4=;
 b=s2wpGFFnsOo/yr2kdJlSW/Yhde2Z+aFKzo3sN4k1DkP8LJAkJxa2H8/R5sZ8NAmnBGP3b6LZgWQ0QO44CHBdUunL5b3tJkNH/aYpLi6KDO2I36PQktEshqSQs7SUqxMN25oV81tc5dzvfXrtt+yQmZbvLfsZ1LLyKJjr+U/lvE/8Y/iXvqZTZhkKuGUMAd9VaHtCDI58fXuQk6kTHNrUsE8r1q/5HO4uiCRud6R0Nyqi8H7mLX1JOeG9TIqbIrEkbD3fO41P2CFEAAS9vqPnhshklu4zBnsZjKnx0VQVvdwX/moq1kIztV7Zi/CJGqJmUkgDFQMinPXILNyT3hX+xg==
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by FRWP189MB3482.EURP189.PROD.OUTLOOK.COM (2603:10a6:d10:1a3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Mon, 9 Feb
 2026 12:19:14 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9%4]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 12:19:14 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: Paul Barker <paul@pbarker.dev>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "pratik.farkase@ericsson.com" <pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH v1] libevent: merge duplicate inherit statements
Thread-Topic: [OE-core][PATCH v1] libevent: merge duplicate inherit statements
Thread-Index: AQHcmbzctpr85vaOYkC+wzk0TU8UxLV6SFkAgAAArxM=
Date: Mon, 9 Feb 2026 12:19:14 +0000
Message-ID: 
 <GV2P189MB300502E57D487F0D63833728FE65A@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
References: <20260209120848.34882-1-pratik.farkase@est.tech>
 <6511a89ca1a6c70717125a3e4a0a1861228bd401.camel@pbarker.dev>
In-Reply-To: <6511a89ca1a6c70717125a3e4a0a1861228bd401.camel@pbarker.dev>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2P189MB3005:EE_|FRWP189MB3482:EE_
x-ms-office365-filtering-correlation-id: 407b1d81-2681-4804-9cda-08de67d5707c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|8096899003|38070700021;
x-microsoft-antispam-message-info: 
 =?Windows-1252?Q?tk7hsiHrNKaFqgf7Wd0t/VkBeZiZd65Ol4t2vs+VVXBWFKdMNJmBPBc4?=
 =?Windows-1252?Q?6wu+WPkRrhVYjIrUxstvsI0oj5KpC0Zk36IHVmWa863eO5JMFDLXPoyg?=
 =?Windows-1252?Q?/BoojKMTO522PMmylKJX161OoU7bxX6xVexb1dhzddoTZSNZAmQRPQ2i?=
 =?Windows-1252?Q?jPH2xUxvLGtpueyVvZ1cD2U5jJbP9MQmkSMsxYQNmJOp6uVtfZYaGWnK?=
 =?Windows-1252?Q?e4yo7gGNnhoS5SC8DjI/JHo5ab53+4D1HxAbcuANAzlQEw1V6JHPVa2P?=
 =?Windows-1252?Q?sba1k5bfcA14SAhsAuk20l0+yJDXOueOhYAovRXYstonqaNjAPfh+bLH?=
 =?Windows-1252?Q?WQEbZAOdrpwH0BnXmzz8g+OcFTujfzbt8KDA1YAW5QCX4GLY4vbQKluG?=
 =?Windows-1252?Q?ioS5sgtIEyHPlrclAf/5J971Dcj67JMHtOsdFzr45VVTdh2bpgt+aG6L?=
 =?Windows-1252?Q?g2YuffAJZbw/jvJ64prajvIGeZQbj0z3Gysb9kVytuskELvq6qF4EqHT?=
 =?Windows-1252?Q?x3GJonvBKiMFtjt3Bn/bvgjbn7QEbjVY6qPKPvWeyh2kYEqG6aKE4fU0?=
 =?Windows-1252?Q?KzpyfpSVOcLHmj2g1HNL0YKTZa92B9fJ7Gh13CJ5LEMOwnCehgLblL8Y?=
 =?Windows-1252?Q?OgO8gGhINxI/HvXX7i1iecUAPDrbXRA0Y0gjqwatG6IvMzYqpa8POIGw?=
 =?Windows-1252?Q?vs0fvHI2VhxyauoEUgIsf8um0ckwyLXxax3RralNt9Hi9/P3c0o8NFv9?=
 =?Windows-1252?Q?cNhc1Z3xSo6gDYeyzhfHqrMM9o0l9RP/Kky0XdadJTiCrFPJc0EparZs?=
 =?Windows-1252?Q?WXTTVHWA7KIhofU5yfci0nh3VwFP1WcJz1AULD/+ZsgqLgJhU1LFTHOq?=
 =?Windows-1252?Q?IN/5zxrX2VDjp5TGwXpTGt0/OB81bvuTfm9W3zj7sV+AZiZ9a+8WGnz1?=
 =?Windows-1252?Q?u3jz//is4AnWbe+6g4gmx79XJwcQ5Ty5Le76Hk9hMK57SdEr85r+sr5F?=
 =?Windows-1252?Q?RxdhLX1aWjaOLcKyBV7oIWDDMJg7GhfncinAAAIwrmdzJ5uePdalSrVS?=
 =?Windows-1252?Q?5vNcv3Fl6IuQJljW7tYi5D36TRFdSioIfoEkayziMgNmyLIbxNGrDloN?=
 =?Windows-1252?Q?CJbVwVm6teLTQZwfmV75ES2rMU3NUrLFahK0q3toJ3c31gpwIGeKKtIx?=
 =?Windows-1252?Q?Ykl/pdDtKyPXBI80ixTOt4ju7D8eUJSudbbm+wcJG5j3GmV39buY5lv7?=
 =?Windows-1252?Q?TPviTN8sxvS2yK2eZsSOJL8dt3Li072oxQZrE6t8eOCCvXGh15H7iTPk?=
 =?Windows-1252?Q?G6hSbQsQ9CuLcLin/VWg/DOtOHTJYq4ZO2fOL5TrrvnTGaxBKle2Aqj3?=
 =?Windows-1252?Q?dYk25Ty/BC2TYz/xhuHDxH/qpD8lulOkD5MYDjo8oJCnZMXpmgSf9GRA?=
 =?Windows-1252?Q?1rFMv9Hnjjr6uK7OQcof5MWiw8W8YUqRfddPda0Z3bABhvB2WxuPJeKZ?=
 =?Windows-1252?Q?PAn8KgCMuLVuP2O8DqOSFqud0YU6kGR3+tx8ORNZ2fLXBcfecd1TyxVx?=
 =?Windows-1252?Q?PV8oHYw6lg5kOxOGPFZ9QpnCwVmZz7YVHrACzfeA2gxHVQMcrvRUzZhs?=
 =?Windows-1252?Q?khksg6FFNyd0+Dtn2oETQa9BOF13I+hhxKkRHE8VBMgY7LVLm18/LRxP?=
 =?Windows-1252?Q?Iqb9+qUyIG32JacyPWaMItXiSxrTXC7jMM6R3wR887KLvqybAHuZm5pr?=
 =?Windows-1252?Q?0ewMsimkNQuY4z5RjYg=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(8096899003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?8wxVWcgmEturQZTibjMoKj4ptUmsFand+IqWNjvedV4vg9ME8iCPIo0G?=
 =?Windows-1252?Q?VJJo6NRYWUs37mGKcYerJO8p2jZXrj305JXMv5PoM7hrShWk4dgHSdXQ?=
 =?Windows-1252?Q?7lEXt32DHkVCG58GPZrDOAGoCYvQFDubyqWEztSzZ7zs0xi7K6Y2EyHh?=
 =?Windows-1252?Q?/Lnn21LHATZZJ27ukLs7l6kemD2HIPocvQjOvNRaSIW8TgzQ0MX/z/5Y?=
 =?Windows-1252?Q?3HDn70cQzK5CAUoDnKXfe8T/Gd4Ct1njLvbyqnxjFaXOtX07EfXzDeLe?=
 =?Windows-1252?Q?RarU6e3fHN44Q3XFWOgGokfQkwMTBixBrVwxFuV4bTW4ePNz7XbSOrar?=
 =?Windows-1252?Q?vxr/ByDlL8kuBh6uESGcjT6AMZImcg1NWZlLHWSsUA7fK4gSm7pFMAsF?=
 =?Windows-1252?Q?uetVIPu3gEJyLlZ7YHd9TVzaxh6N6A8UFvC1jPTzA/Ti3Z9xGkg5pIuG?=
 =?Windows-1252?Q?T/5NajUyYSrViATTh+9kvcpZr2ImujmdVxUY0hCG2GjvveGn1bT/eArc?=
 =?Windows-1252?Q?cl+sn+sB7DWZKEWnuvFwY1dErZ6dCm3VStjktmU+jftcjp1CWWerM0hM?=
 =?Windows-1252?Q?7ttoNE/U1j/uKk+IAG+wl0xq6McnPmq04pcxMWl/luY71bv3JNeICAAR?=
 =?Windows-1252?Q?/N4SvNHngd7wnnB86xhe7hjlwUWAJkfKdBfFqqMG/x2VkMxrUe2EBuJl?=
 =?Windows-1252?Q?kJe8chHvMSYLbZv8yqymVqwXoyLX4/KROs/+mWpX+3zGFb2f+Fcr3/lT?=
 =?Windows-1252?Q?/oxr68d3wMdcx+ANLaeIMgxnu/UWFpMQsY8hmfmcaixiM1NM1Q/FkMtX?=
 =?Windows-1252?Q?/ZSRes3/RP+ZvWFBdlYaC1k2y33p/5yXDx8gzjoBcNW807CaFXTH1fNy?=
 =?Windows-1252?Q?6M0DlrlVnin4ydYXrkhUVNJH6hjJK1mBJ6gQy1tjQXYaY6GU4kqYSlA+?=
 =?Windows-1252?Q?EodnwFw8bu95YWIIYK21hhy+0g2foYX7jgH7sTcOudEyuu1sRcXrldCF?=
 =?Windows-1252?Q?VKltOr5h0BAIvCjE5Meu1ETSl92bZP5eNe64b/YMmIZgt61lvf29Fpb+?=
 =?Windows-1252?Q?grXUF9lYfN3DSYISc+L4pvVrtq9Mk3+ZP1hnNvESChWMs8iN6zlLWIpN?=
 =?Windows-1252?Q?+TSs/OGyUPD8BLuODUyd/d08YB4eeqpRYst9ujCWPAfvc0RZic8k9OBK?=
 =?Windows-1252?Q?55NFgeo9svSkWEDiG69mvRX15VTewjZbAniGSSWncqG5b3Ln8vCKOuWs?=
 =?Windows-1252?Q?Bsva9vRMiHH1H4FYN9q1unOY+8eqXQCYdFPoVQ8YGkcWY0+UbzF8J/9/?=
 =?Windows-1252?Q?l8dKqw7EyBjKEaCA9Yftc4alrFnPJ2KJ0coOawnOBGZZfQT5HVSnVpTm?=
 =?Windows-1252?Q?0DaR6ltN27kyfyaY7W9BLvg89GI+3VuaC/UGuDP61CFSXaA303P8osDZ?=
 =?Windows-1252?Q?f98LMZaAtnmxPe7Rcs637Kvhu029gOh3NQA/CgVKRdcdYLFtqmDV3von?=
 =?Windows-1252?Q?3L10AmloUzo316A8Ma0WYLNMARbbMjZbLbsu6j0ctOKW5w7AMkzzKDKu?=
 =?Windows-1252?Q?2/N4LJYrtCym/9G85RQ0toCPJQPlnUlgcMG0Zqf++cQpBTHHVMj/idWT?=
 =?Windows-1252?Q?7UaHQ2rLkzagFqE/RzLmu8P8X9rvGmnw0xIT9qq9Lk/hQHmEg5Sm9xhm?=
 =?Windows-1252?Q?OPHqE8mCcgzwVK7TjBY62TtAb1m1in51xfyBZgFZ33/WbCyZPFHff+xF?=
 =?Windows-1252?Q?xmNQrna/L9iz28Qaf9JrkYskt2+UlMhKKwP2lKxt537Bxik1BHTYmePb?=
 =?Windows-1252?Q?4Iv2g76/GldGkaUh8dQLwA1i5HIJ5htFDO0lSrBw7K8Fw9Kt3zZozjwP?=
 =?Windows-1252?Q?ns5nQaofVRX2Qg=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_GV2P189MB300502E57D487F0D63833728FE65AGV2P189MB3005EURP_"
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 407b1d81-2681-4804-9cda-08de67d5707c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2026 12:19:14.5730
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 34FYjFt1AMEJdN4THDstntd59rS3oRJPH991KGr1NuTwKDavBLZRfXGhy5dFZDzsCHDUH0A7wmBIeGWEOxiw7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWP189MB3482
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 12:19:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230785

--_000_GV2P189MB300502E57D487F0D63833728FE65AGV2P189MB3005EURP_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Paul,
Thanks for the clarification. Understood =97 I will make sure to drop inter=
nal Change-Id headers in future upstream submissions.
Best Regards,
Pratik


________________________________
From: Paul Barker
Sent: Monday, February 09, 2026 1:16 PM
To: Pratik Farkase; openembedded-core@lists.openembedded.org
Cc: pratik.farkase@ericsson.com
Subject: Re: [OE-core][PATCH v1] libevent: merge duplicate inherit statemen=
ts

On Mon, 2026-02-09 at 13:08 +0100, Pratik Farkase wrote:
> Merge the separate inherit statements into a single one for
> improved readability and consistency with OE style.
>
> No functional change intended.
>
> Change-Id: I12615c2ba986d5802eac02d768fcfa5dfa1ace5d
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>

Hi Pratik,

Thanks for your patch. Please drop internal Change-Id headers before
submitting patches upstream in future.

Other than that, this looks good to me.

Best regards,

--
Paul Barker


--_000_GV2P189MB300502E57D487F0D63833728FE65AGV2P189MB3005EURP_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Hi Paul,</div>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Thanks for the clarification. Understood =97 I will make sure to drop inter=
nal Change-Id headers in future upstream submissions.</div>
<div class=3D"elementToProof" id=3D"Signature">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Best Regards,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Pratik</div>
</div>
<div><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Paul Barker<br>
<b>Sent:</b>&nbsp;Monday, February 09, 2026 1:16 PM<br>
<b>To:</b>&nbsp;Pratik Farkase; openembedded-core@lists.openembedded.org<br=
>
<b>Cc:</b>&nbsp;pratik.farkase@ericsson.com<br>
<b>Subject:</b>&nbsp;Re: [OE-core][PATCH v1] libevent: merge duplicate inhe=
rit statements
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;">On Mon, 2026-02-09 at 13:08 +0100, Pratik F=
arkase wrote:<br>
&gt; Merge the separate inherit statements into a single one for<br>
&gt; improved readability and consistency with OE style.<br>
&gt;<br>
&gt; No functional change intended.<br>
&gt;<br>
&gt; Change-Id: I12615c2ba986d5802eac02d768fcfa5dfa1ace5d<br>
&gt; Signed-off-by: Pratik Farkase &lt;pratik.farkase@est.tech&gt;<br>
<br>
Hi Pratik,<br>
<br>
Thanks for your patch. Please drop internal Change-Id headers before<br>
submitting patches upstream in future.<br>
<br>
Other than that, this looks good to me.<br>
<br>
Best regards,<br>
<br>
--<br>
Paul Barker<br>
<br>
</div>
</body>
</html>

--_000_GV2P189MB300502E57D487F0D63833728FE65AGV2P189MB3005EURP_--

