Return-Path: <Mario.Schuknecht@iris-sensing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01741C369A2
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 15:12:51 +0000 (UTC)
Received: from FR5P281CU006.outbound.protection.outlook.com (FR5P281CU006.outbound.protection.outlook.com [40.107.149.128])
 by mx.groups.io with SMTP id smtpd.web10.78380.1744125164139027600
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 08:12:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@iris-sensing.com header.s=selector1 header.b=COWcYkIw;
 spf=pass (domain: iris-sensing.com, ip: 40.107.149.128, mailfrom: mario.schuknecht@iris-sensing.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RIxrkfG7LH8rhRqu6cF9KpbdS37R6V//kKY2Sm341YgvkXtsUQ9A137mirWL/ZDMDIf1vBUN336hCs6sCYAEHI8Ol7MAEzMyYvTPUnLHjGrMqassbhVJYU/AAIaJD5kfBN0vx3YhvkbyBVoPC2YobwLGZGDKCH7DUFu6OEU7iYJd25Jm+qXn+c/FjfW4Mhdh3CvgEkpt0TEx270SZlRm3ElBjv9WpckIJEy16p66E/tYoj1dgYry++ztuuvTFEAkjTkFIXtNXSjpWC5sl/EP5I5JAfXzRwIlNPR1l3KG/q0X2hYrkFCUkVrZCZIb7UNVghPOQVRdVeyo40yeF50pWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZknwGnyskaI8MNJSkDdd64J2WIkL5Oy4ZDRoCSLAxYU=;
 b=Rm3WDKED/XLmqI0pFp+7fmnDDRY3AA9e8pXwLWYf//SmEDzS/Ek8JANxXo5uiH5Wk/PmgfoJ0lwLlIi90a5oQ1KpF91z3uDyWJQNrGRftBXEW1Sa/xORecxMcXZwTRKKYivOaDUGRSlQm5qTI8zsLXcw75kWygTPo/vQvxpffdx2KgAKSRcS+Fvg6FWIKohssWyoyhl+APbVdoX2KK5Is5emslp4i0KzWg3g0MTMHYlXu7vQUVm+imZ7ziIVbymEPMs1TBj4Xste+r9602HBaLOlBcvwWj/Waveto6PZybBcuZBuB6XoMW43Q64eS/wmzvKuxOxjOThPGVX+qdftMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=iris-sensing.com; dmarc=pass action=none
 header.from=iris-sensing.com; dkim=pass header.d=iris-sensing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iris-sensing.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZknwGnyskaI8MNJSkDdd64J2WIkL5Oy4ZDRoCSLAxYU=;
 b=COWcYkIwNvoNwZAk68jioHEKZRTZ1+vb8aLENXsL1nfbBgZGt0JN1D6DZ24Cya/Soi97IfJht8JQ4yB2N+68jXwGGWFM6V6a+psve4FXqbOxYk0KZoHzxocomPOtaXnDiQfYOdqmmdoARl3kvPxMY31mSgPOdmdrUvZfsq9Xz+ebMiSEM5VKtFJbXd+ByqDhv8AB5eWtEkNwZr3P/ibq776lf7fGzAoh5X5Pmpi1XPy6fnUF7uFdSTB6YhHVTIJdxyG9kT8LCoNFg0VvNQmre4PAN7FG/5sGmRCECYodjdXTz7UZdALr88Vfl3tG+QPV5bHY5de0MrmiUiRdob2dlQ==
Received: from FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:34::8) by
 BE1P281MB2307.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:32::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.34; Tue, 8 Apr 2025 15:12:41 +0000
Received: from FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM
 ([fe80::6715:31c1:c53c:270b]) by FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM
 ([fe80::6715:31c1:c53c:270b%5]) with mapi id 15.20.8632.017; Tue, 8 Apr 2025
 15:12:41 +0000
From: Mario Schuknecht <Mario.Schuknecht@iris-sensing.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>, Mathieu Dubois-Briand
	<mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: AW: [OE-core] [meta-core][PATCH v2] libgpg-error: inherit lib_package
Thread-Topic: [OE-core] [meta-core][PATCH v2] libgpg-error: inherit
 lib_package
Thread-Index: 
 AQHbmnPP0QBf95+sukinf7d01CDLErOBAZGAgAEZvy2AAANiAIAABl8AgAFPrpqAAa4K3IAAaysfgAAEiACADhzR3YAAQ/OAgAFHaMuAAumnAIAB1Rfo
Date: Tue, 8 Apr 2025 15:12:40 +0000
Message-ID: 
 <FR3P281MB1917DE5D2A5D3323691E4470B6B52@FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM>
References: <20250321151245.21227-1-mario.schuknecht@iris-sensing.com>
 <D8NTZA6A6JBD.5NEFFO2SQS5Q@bootlin.com>
 <FR3P281MB19170866636FFF96C26464B8B6A42@FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM>
 <CANNYZj8s=w0CY3VFOCRtzn9z=LeH7H+z_TXS2QcvcRJyeUbAXA@mail.gmail.com>
 <5cdce6f6145ff07615ebf8496b21cdca9c75641d.camel@linuxfoundation.org>
 <FR3P281MB1917204FF59FC089654B5FCFB6A72@FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM>
 <18300D8D696CD25C.32743@lists.openembedded.org>
 <CANNYZj8tqi5tnomg7t5k9iGHj_xCszmC6nCYfKmgh=yToiM9aQ@mail.gmail.com>
 <FR3P281MB1917CC7FE52D22DAF61020FAB6A62@FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM>
 <CANNYZj_E+01hDV3hF=9AjPnEZTfmLCAwav203=XS7Y8sZquRuQ@mail.gmail.com>
 <FR3P281MB1917B56C58FEF4BC1FCEC291B6A92@FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM>
 <CANNYZj8hp_OCYz3ZYSHg2GdO8QiE6LAxLVmz6k_U=ZdY8UAkrw@mail.gmail.com>
 <FR3P281MB1917DF6032653CF52115E214B6A82@FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM>
 <CANNYZj8P7qJ0WnsWR=fVKfF8XtuqXV9GYHMEwmKSNLwC=vbMWA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8P7qJ0WnsWR=fVKfF8XtuqXV9GYHMEwmKSNLwC=vbMWA@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iris-sensing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FR3P281MB1917:EE_|BE1P281MB2307:EE_
x-ms-office365-filtering-correlation-id: acd71609-c782-4c1b-1e0e-08dd76afce59
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|31052699007|39142699007|1800799024|38070700018|13003099007|8096899003;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?wJ039k+GCT95J93SMmhJEIlHthj3kqcRoqIOayCf8UHBiNrOcJpJDjVvcA?=
 =?iso-8859-1?Q?xStA7z0EmRG71c07RK7QJ1J6wbNCcSGeK1vRxA30vstza9UtnlKsOz2efS?=
 =?iso-8859-1?Q?NTm7xP1ioxOgSaIa0ZwYKdT12Ms/ATL1WBSj3PTrCQvPWHTYljaQhF+Pgy?=
 =?iso-8859-1?Q?zNhrBMnxyEy/w94pWbcV1JZGGZE58b7xj7xEMJs+u4MuVNnWY1q/CrR7yg?=
 =?iso-8859-1?Q?vvu/lxEcGMitQ2iWeIe0PVrQgzFejVv/mdnVDt7zg4eLmdkamfnSlV7pVh?=
 =?iso-8859-1?Q?6aEM6v8Zl6FT/ZVgKFnBzOsQQxeWlCd/X9W7b7XSenS8G3wRjbrV1TRDqm?=
 =?iso-8859-1?Q?i/mw/ywixD0lLIKa9IY13lMLp2mzvC+FDXrpeBmc4LAd/StRFNYHEn8H6G?=
 =?iso-8859-1?Q?nIqFiQqhPS2vNA8pRbMc10Zp0QI3b4VVxiO9lh60dKRWmsnuLkxlI2wJ0H?=
 =?iso-8859-1?Q?NtHSFup5YUW6j/4kqxlfdRfBh6ijbOLtGDExqHp7YwkpfubouTWOrK2eJI?=
 =?iso-8859-1?Q?ZKT87CGZw7kTmVkLBb2+aXd0hExvg8ese/ng9Kmh5I9OyPEZRfSmCP10Di?=
 =?iso-8859-1?Q?xCP8s7+Apc6Qhqb/1E6oUBLzysVZruIbQzQDPieIhBQKwtq30N2DWt2BTi?=
 =?iso-8859-1?Q?EZadVd4iI5or2lBop2k0vYn4elNuXDgYPn3tPwn8q7C1BLNMNP6CJJsf2y?=
 =?iso-8859-1?Q?opbXYS/7wEc+Pggx+Po5KcGYlKnwQzDs0adPxU5b30CFuKTE2NAQE0qCmP?=
 =?iso-8859-1?Q?mH5wRyB6rANnEQi+egvuWwwaSm5lEVXpDdVtWuoC1j6ofDVky5Fnmauk1W?=
 =?iso-8859-1?Q?TJnTUsKAjjF23HPvncns2dNF0/TmmniatqhoyFXy67cf3WshEjWnLMkTXm?=
 =?iso-8859-1?Q?wuScEVyk5mip5fdncr4tl0lbjf7ZCe6Gj1oQcE5AD1kCby+LMvwW2Ugr0D?=
 =?iso-8859-1?Q?nMlWI21dMFlNg8+4qGWlci5jaDiB4MLsV/NZ1RJ2KcQDCNkiGORqNdLLGd?=
 =?iso-8859-1?Q?tZ6Gs2cP1pv1tJHNpKlf2Juo8XS+BzZzTcq6fhgizQ6nQnE6ksYACsqODk?=
 =?iso-8859-1?Q?Zs9n6MY+6WRx5KqoUd+6S0UrU9jVRF9gXfYmdM2axdS+GuIV96qtEI/Fg7?=
 =?iso-8859-1?Q?YLan7CPxD/p8U2rMBWDPt3zPC2Vb6F/ww6RCwOU/mee1n8DOj48n0jo9Yn?=
 =?iso-8859-1?Q?Uh+fBPm3GD5KRVJSAjcIpncff1kLdviIK+wje8SUCGHnbYtP2tsQn1gVTS?=
 =?iso-8859-1?Q?IgwFivz66tnv2D6KW5RiTlwe1nO0D7Ypy61JwLu8nbjHVaKWNOLv+sNxR4?=
 =?iso-8859-1?Q?jT48V6ohKiLprvefZyzmFzSEPI/ekrZxbu8SaWVKmexerNDwRy1SnbcJwC?=
 =?iso-8859-1?Q?TbE28zw33POjASxK9sAN+YNUnD8qwCNKT0okVKICEsHTuMJrv5HPtz0aHg?=
 =?iso-8859-1?Q?l7cdFv/9JMrArLAy+gZomP13YIGSAoPpxV+WVA05YP4fbQHGvhqHak9zyQ?=
 =?iso-8859-1?Q?M=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(31052699007)(39142699007)(1800799024)(38070700018)(13003099007)(8096899003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?itw6MOztonFleo/8HF2QuKKv+OkeHdAyYURR4iTykvhwtRXrZYGXfBFY2N?=
 =?iso-8859-1?Q?X7ApQ1EN1mwfEzUH/lePUa8OzC2ul7WEBs/bFGcr4d0vjuf8adjZCgdUOM?=
 =?iso-8859-1?Q?E1T1+kuhin1eMQ+WFZ8P7L44u7Kpf5qEvtEupO5AAzgMUxZmXtNAAwMlJe?=
 =?iso-8859-1?Q?3bd4FzqElxidOW/6bD4WbjYPTTn0S03zyd6KqMctAxnw+vSrOIB5uuxtJO?=
 =?iso-8859-1?Q?V8N91ZR9mD0A+lgetPQjOXmzrtshWfUj4fMLPNRp7AMt4TIZaUnNcNP+fN?=
 =?iso-8859-1?Q?EUpS8As2fOXvP4Gl5M06PGJz1R1UM0abff+cXscg38460nRA9Z+LM7+MbA?=
 =?iso-8859-1?Q?hja6dKY72jcDhAlOXe4b/zBs/F+t13/wA0VW+ravTXIBAA8GkJyVIRYXna?=
 =?iso-8859-1?Q?KBj/HDL0t8qlWUYGl9gdXZI9ZBAqk1TK/lybz8xEUaVSuI3Ho5/kHhW9Jl?=
 =?iso-8859-1?Q?ntHgUvQ0J//N3N2ewySKNhym0vD8EgKrzr6alTNM670DMB+PTWWpC9Lp41?=
 =?iso-8859-1?Q?CyroK4B0jkbgibTQF7FyWMzvVIAtupBsg5o0Vhk30hy6tendccQj20J09+?=
 =?iso-8859-1?Q?HMMXwHNInqPLe11NS/WRAstG55jBYFz7wJNRYZ34k776No41iRWU0n0GRK?=
 =?iso-8859-1?Q?Qriu8WA3MkkSMOpZMwsMkCiYfStt56Fzb640Hz+CGktki/cCNVQXK+jRsX?=
 =?iso-8859-1?Q?L2PfhYpR3HlPbtv+iYVdf/WkWjxrWdMLdpJhsgAbBs4biTtkVi2dQL5LBI?=
 =?iso-8859-1?Q?nZ7LDzEVlNCwoDJYyqd3noPfCkDC+3XMk4N+TgqKgTM5JqCaITICLjkK7b?=
 =?iso-8859-1?Q?2lg0xZDBGcvJOT2fgvew4DAzj0DpNHBo+DgmJeu5ikeCS5IFegrKfEq9Ge?=
 =?iso-8859-1?Q?M5jTQk5u9y3QlN6oTCrl8ctu1wnnMRCQ3wuYC6BC4gHWWMPlhFpko4xabt?=
 =?iso-8859-1?Q?ThO5bgmkPhZa5qlQmHLDMBgW+T1nuF192kIERn6gyb8lfaV6JZoBqReyK4?=
 =?iso-8859-1?Q?c8eA3sYBQKcD0Vgbcm/AbQMDmxfz5Hp5/HZp2JJO5ChgXCt+ykCiid04cc?=
 =?iso-8859-1?Q?EYJugl0nxM6oSUgEaNyU2qJdNu63VorOZDxyf81OimO+lrOQjUJBB6I6tD?=
 =?iso-8859-1?Q?f3lwSFKb6V1PVQwbO37GKp9hj34fF4paAP/TbaNRXLPNRJ/mpjWhLDkCWV?=
 =?iso-8859-1?Q?d7lnq+RGYamvZZIRMqWBZLZEm4FJaMe72FCfpNkdFN3L1D6mjOblqKcGFH?=
 =?iso-8859-1?Q?7rfzXk5Q6IeOobEfxIn7SyA0Um9WvMzAhOtuBTES3JhU6OjO/m/90PQ9Zd?=
 =?iso-8859-1?Q?BnzoIWbU37tAe+ciNDKDEINJ68bS6h5J3nhbKtuRjxDRvboW/Yp/1wboRW?=
 =?iso-8859-1?Q?Tr4NK/7pwvWGM75LkGRyRrblKdiv7Rg4r9xOWoegt3iVebjOqkRVlgBVge?=
 =?iso-8859-1?Q?IdmE1Q4BgHmR+qLZ4/zo7MTQsiisHOyYSmxr/ygQ0Mc6O3YxqsDj4UZ1Nk?=
 =?iso-8859-1?Q?L74jiAK7iKWTNGG9MRenMx9USWVQdqc9ai076EicCEcCkUdXVYmdRJSdxX?=
 =?iso-8859-1?Q?s1Mf2JFEIxgqL0GnAtniKe5JgjrX5Ca+Q4E6QZIvzPNdCF09XMj/PYNFPZ?=
 =?iso-8859-1?Q?ybTfvqtxg1TVsGxhTR+l5I3KFL7ZHNrUWMAvM0mnhbsMOm7CGL3zsEpg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_FR3P281MB1917DE5D2A5D3323691E4470B6B52FR3P281MB1917DEUP_"
MIME-Version: 1.0
X-OriginatorOrg: iris-sensing.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: acd71609-c782-4c1b-1e0e-08dd76afce59
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2025 15:12:40.9679
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 963f3913-ffae-43fd-856b-2dfd3f6604e3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T0+//JsN5o5eR6/pTy5JHERVXfwMRjm+qmb9fkohtHGl2XGpMfYN0h1WY3cxwUGn7OnZ6GG7wUMXtjzfSl3WpWVxzkeyP13ljijbWyP+aAi0wbkvzGoi+mSJLet6fm58
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE1P281MB2307
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 15:12:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214543

--_000_FR3P281MB1917DE5D2A5D3323691E4470B6B52FR3P281MB1917DEUP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> 'gnupg:do_package_write_deb' is missing the dependency to 'libgpg-error:d=
o_packagedata'.
>
>
> To stay on the right track, should the code that maps these shared librar=
y dependencies
> to packages that contain them also add this missing task dependency?

I do not think so, I believe apt and metadata in .deb files should be
investigated first. I went and looked into libgpg-error0 .deb control
file, and it does contain the needed Provides, but crucially, the
Provides line itself lacks version info:

Package: libgpg-error0
Version: 1.51-r0
...
Provides: libgpg-error

If you built .rpm, then the Provides does include the version info:

%package -n libgpg-error0
...
Provides: libgpg-error =3D 1.51

So I suspect apt gets confused somehow: either it doesn't pick up this
Provides at all, or it rejects it because the version isn't known, and
gnupg has version constraints:

Depends: gnupg-gpg, libassuan9 (>=3D 3.0.2), libbz2-1 (>=3D 1.0.8), libc6
(>=3D 2.41+git0+0a7c7a3e28), libgcrypt (>=3D 1.11.0), libgnutls30 (>=3D
3.8.9), libgpg-error (>=3D 1.51), libksba8 (>=3D 1.6.7), libnpth0 (>=3D
1.8), libreadline8 (>=3D 8.2.13), libz1 (>=3D 1.3.1)

I'm out of time to look further into this today, but maybe you can
check if we're missing something in .deb generation (compared to rpm),
particularly having version info in Provides as explained here:

https://deu01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.deb=
ian.org%2Fdoc%2Fdebian-policy%2Fch-relationships.html%23virtual-packages-pr=
ovides&data=3D05%7C02%7CMario.Schuknecht%40iris-sensing.com%7C7d331cff1d704=
027549b08dd75c3c5c5%7C963f3913ffae43fd856b2dfd3f6604e3%7C0%7C0%7C6387962058=
73578643%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMC=
IsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DJMn=
%2FbF3dKvmDYXvqXxxywyg09nY%2BQjal9vwRA9SKdIo%3D&reserved=3D0<https://www.de=
bian.org/doc/debian-policy/ch-relationships.html#virtual-packages-provides>

Alex

So far I understand the problem now, the "Provides:" version information
inside the .deb package is missing.

I have checked the rpm and deb class and it seems that the deb class
does not support the "Provides:" version on purpose.

There is the following code comment:
 "drop version information here, not wanted/supported by deb"
http://web.git.yoctoproject.org/poky/tree/meta/classes-global/package_deb.b=
bclass#n223

That comes with this commit:
https://web.git.yoctoproject.org/poky/commit/?h=3D00765258a2fd0627e0b8b15ed=
917e1caeda30b38

Should the deb class be extended by the "Provides:" version or is the probl=
em somewhere else?

Regards,
Mario

--_000_FR3P281MB1917DE5D2A5D3323691E4470B6B52FR3P281MB1917DEUP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&gt; 'gnupg:do_package_write_deb' is missing the dependency to 'libgpg-erro=
r:do_packagedata'.<br>
&gt;<br>
&gt;<br>
&gt; To stay on the right track, should the code that maps these shared lib=
rary dependencies<br>
&gt; to packages that contain them also add this missing task dependency?<b=
r>
<br>
I do not think so, I believe apt and metadata in .deb files should be<br>
investigated first. I went and looked into libgpg-error0 .deb control<br>
file, and it does contain the needed Provides, but crucially, the<br>
Provides line itself lacks version info:<br>
<br>
Package: libgpg-error0<br>
Version: 1.51-r0<br>
...<br>
Provides: libgpg-error<br>
<br>
If you built .rpm, then the Provides does include the version info:<br>
<br>
%package -n libgpg-error0<br>
...<br>
Provides: libgpg-error =3D 1.51<br>
<br>
So I suspect apt gets confused somehow: either it doesn't pick up this<br>
Provides at all, or it rejects it because the version isn't known, and<br>
gnupg has version constraints:<br>
<br>
Depends: gnupg-gpg, libassuan9 (&gt;=3D 3.0.2), libbz2-1 (&gt;=3D 1.0.8), l=
ibc6<br>
(&gt;=3D 2.41+git0+0a7c7a3e28), libgcrypt (&gt;=3D 1.11.0), libgnutls30 (&g=
t;=3D<br>
3.8.9), libgpg-error (&gt;=3D 1.51), libksba8 (&gt;=3D 1.6.7), libnpth0 (&g=
t;=3D<br>
1.8), libreadline8 (&gt;=3D 8.2.13), libz1 (&gt;=3D 1.3.1)<br>
<br>
I'm out of time to look further into this today, but maybe you can<br>
check if we're missing something in .deb generation (compared to rpm),<br>
particularly having version info in Provides as explained here:<br>
<br>
<a href=3D"https://www.debian.org/doc/debian-policy/ch-relationships.html#v=
irtual-packages-provides" id=3D"OWAcdb9aa70-e30d-df57-d71f-a01f5886549d" cl=
ass=3D"OWAAutoLink" data-auth=3D"NotApplicable">https://deu01.safelinks.pro=
tection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.debian.org%2Fdoc%2Fdebian-poli=
cy%2Fch-relationships.html%23virtual-packages-provides&amp;data=3D05%7C02%7=
CMario.Schuknecht%40iris-sensing.com%7C7d331cff1d704027549b08dd75c3c5c5%7C9=
63f3913ffae43fd856b2dfd3f6604e3%7C0%7C0%7C638796205873578643%7CUnknown%7CTW=
FpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOI=
joiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3DJMn%2FbF3dKvmDYXvqXxxy=
wyg09nY%2BQjal9vwRA9SKdIo%3D&amp;reserved=3D0</a><br>
<br>
Alex</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
So far I understand the problem now, the &quot;Provides:&quot; version info=
rmation</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
inside the .deb package is missing.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
I have checked the rpm and deb class and it seems that the deb class</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
does not support the &quot;Provides:&quot; version on purpose.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
There is the following code comment:<br>
&nbsp;&quot;drop version information here, not wanted/supported by deb&quot=
;&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<a href=3D"http://web.git.yoctoproject.org/poky/tree/meta/classes-global/pa=
ckage_deb.bbclass#n223" id=3D"LPlnk436255">http://web.git.yoctoproject.org/=
poky/tree/meta/classes-global/package_deb.bbclass#n223</a></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
That comes with this commit:</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<a href=3D"https://web.git.yoctoproject.org/poky/commit/?h=3D00765258a2fd06=
27e0b8b15ed917e1caeda30b38" id=3D"LPlnk313959">https://web.git.yoctoproject=
.org/poky/commit/?h=3D00765258a2fd0627e0b8b15ed917e1caeda30b38</a></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Should the deb class be extended by the &quot;Provides:&quot; version or is=
 the problem somewhere else?</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Mario</div>
</body>
</html>

--_000_FR3P281MB1917DE5D2A5D3323691E4470B6B52FR3P281MB1917DEUP_--

