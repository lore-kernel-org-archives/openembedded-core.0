Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7859C369BD
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 12:55:04 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.49])
 by mx.groups.io with SMTP id smtpd.web11.18469.1744808102042733938
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 05:55:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=p3jw8y7V;
 spf=pass (domain: axis.com, ip: 40.107.22.49, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PQtTkPlwyM/FFiOBzUB+BVSRagIzU30f47CT2nhXvFPS6lKAFc3aFKCee2UoUKW25VpQ83Yq9QIB8AmUatAwshWj79KWylbXkleQw47UMY/d1YW7j/XEX7teK60poNe77sDJnmJ+NAZG0wKXsoEaA0Cz+ZPmEd1HdhbBkf6xQxvE9si6yJknzNvDfoz1y9seNwoWMAYgNQ0GePIJNobYC9jSTvlla3thDXROslZw2KBfTLZo0P7HlgFFTegZW9BT1ZAEqp69EtCGpo7sJcE2+8PDNJC17F45um3Tf9zYsTyaiO2QgQ4njecsUKD8rsazh0l5sYJTfRKp02TATYCFyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pWIek8RFIOlqgGbbB8ZAdKMxcLaHdrXsT868t3Nu5r8=;
 b=GbhfFAIc+Pg9U9xFtdCX+eS7ykaVDG3fobP4+IikXNj8E9UFfTLzDMibE4MCenFEKX5Wr5+c/nx2iINooG7TIJFMCfgqVOt3ub9ML5peMc9z5oDIQxRRaZwMZ9hF8p5XkSowJDG9A3Vc8XaOG44jKs3Ujn+ao3E3QJUpgRnXAsycvhv3rHc9hPLoYNUN0OoR5p6rmstusES2I6wVQ2AqpITqcoIRfU3ns9nQc+GszfncDvMmJgoKdzQB6sSWVY6MSaJO3Wm7XvgGGOG6q7Nn+v/0lcrEcQzmyQtNnjRHv6kPHpi9FJ81HVCp3CCNE7/1xthGMJ1XXanHjOUrf3UsWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pWIek8RFIOlqgGbbB8ZAdKMxcLaHdrXsT868t3Nu5r8=;
 b=p3jw8y7VnaYE7C7uYQcsltWN5subSOLK2Hx41JTImupmSzegiedLp/fRPwH08tvzVOkEQXjWVvOAvDXGoCvyCl9EEc5lwhQSUZJ7JIaE9H+5x+ccbria3JySdjbF4uazbF4ryy2Jd5t5wltxhGqWUNV516DAczVtcu7xhycxJAk=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DB4PR02MB10032.eurprd02.prod.outlook.com (2603:10a6:10:3f0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Wed, 16 Apr
 2025 12:54:58 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%5]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 12:54:58 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
CC: Adrian Freihofer <adrian.freihofer@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "mike.looijmans@topic.nl"
	<mike.looijmans@topic.nl>
Subject: RE: [OE-core] [PATCH v3 01/11] systemd: enable efi support by default
Thread-Topic: [OE-core] [PATCH v3 01/11] systemd: enable efi support by
 default
Thread-Index: 
 AQHbpX7YGulwISLUv0i76npDDFmijbOeL7+AgAAi/YCAAAZsAIAFEEmAgAEjj4CAAGbn4IAA7SWAgABwP4A=
Date: Wed, 16 Apr 2025 12:54:58 +0000
Message-ID: 
 <DB5PR02MB10213EC01FDF19EE9D9A65BD1EFBD2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
 <20250404162932.447699-2-mikko.rapeli@linaro.org>
 <8ae24df9-f1ae-44a9-a4f3-7d8aa273a335@topic.nl> <Z_jy0-3v8qVSyll8@nuoska>
 <960572ae-f816-4d55-b935-8e11e2dad89f@topic.nl>
 <CAB3asfhjnUAm-sB=Q4mk9whXUMdgaBZk0kwiwYKKyPJ0ydnU2w@mail.gmail.com>
 <Z_4sMeEiHjZ8ydfs@nuoska>
 <DB5PR02MB102130E10617CF99E82F6A94FEFB22@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <Z_9JcY4ANLN7SPvJ@nuoska>
In-Reply-To: <Z_9JcY4ANLN7SPvJ@nuoska>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DB4PR02MB10032:EE_
x-ms-office365-filtering-correlation-id: c0c30295-9f2b-4843-4ddd-08dd7ce5e4c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?foQ3+s8nJAKdwG05a4g8LQNQasT2wGb4BJJ6zakcpSSI5OfNh9SgsGNGRPHS?=
 =?us-ascii?Q?6O72+4gNdh2s/9tX6eO18liJmDJuxmQyfYHi26YAZryuhoiHndcQyynTuDIQ?=
 =?us-ascii?Q?OYDBvFpYTXhtB43zCHDdr4n7pY91GBzjVgHJTPCadx+IFucUxN+0pkYQ2Zgz?=
 =?us-ascii?Q?dvwL/vGM+4oizjSBNIu1smy7OptFFM+go8Qkk9889EqddEJN1lD+GGHI73qx?=
 =?us-ascii?Q?rO85s0QZ7SA9ZNEVOKOPvmsvG9g0bG/dlWfCoYvEA4SmYwLDQJ+gi8XFqtPs?=
 =?us-ascii?Q?sAMtB6Cc8nsYBPNwBcTALhGDvjgFOFnU9c6GAwn2iPP8f3wWYU8t20ZIdogY?=
 =?us-ascii?Q?8xYyXW8VZVWdGYYK+mJSu2ONt1EpT6eBQ7ymoNFRDywjnO9654p399kdjB62?=
 =?us-ascii?Q?J8VVtUg9fvobjPr6z9SBzWIDV/MnY7e0Bc7SIC5c5mdB6dHGrvERn2LSgopT?=
 =?us-ascii?Q?0w9o/wOH2Gbx7tnMdW5XuXa61JG4unGG3aj99om12Hwy+wqnNYzY4D/q5Hii?=
 =?us-ascii?Q?F2PFgsyeDKXrCpj0phTq23QVgMw0teo303hW24hGtWRacl2Gt3q4LfvsD1e4?=
 =?us-ascii?Q?Dtu5zW7kYLCeMn8cMJQQLsZFGlV1LKefTPRm5gJa+DB1olSJUzhEtjxZ42bd?=
 =?us-ascii?Q?5EYcrEkX0AapMbK/2gZbHEL0bJ5vbZQBXjpdNQjgJQzMIrJd4IZYAVwIp4YC?=
 =?us-ascii?Q?+bBDqDTwNA1VMzUx8t+484x41j89/WDqN+Sp+ZWm0V2ThuZA36LpKgkjsKHc?=
 =?us-ascii?Q?SufE/9XoECrA8KeapPXoaFG8qJIhwSItH8BjxdgmTVaWwdGf3eHScJyshTdG?=
 =?us-ascii?Q?8HFK7ExiHIt01n+bM0HCCtBvqOMXXj2rb/GDmkAe66dWa+tfHR/+iGnWj1C0?=
 =?us-ascii?Q?N48gpztKOZzpwCVL8LbnbqDTC0gL3GEFpAKEaiRja81SEYml8Eii5yzwfGYJ?=
 =?us-ascii?Q?4fqYnH/s6+J91UwfF5N/yXmek+3dw33rjb3gZy6qeYi/oQqiYpQlUqhy0u2I?=
 =?us-ascii?Q?Ubb3OXHoYiYv4KLELh4WIo4Gts65zg1tPtYUlYSpXuzWqHuI9MhcXVh95K0c?=
 =?us-ascii?Q?yEPhs43xjPLOM5oR5jZk1o6uSY7DBsvC+7WEJyHFnf1LDKL3Vuy4mfvKHK5V?=
 =?us-ascii?Q?Te1OS9nEhAN1QPDou/vLB+YNLsnveFQNkZoQF6T9IHP+cZeWd8ELC/FKSdlm?=
 =?us-ascii?Q?DVIZJ3OLaCuEs9eQSCNGWJfnR79OTFhmXGn8f+xYWNpL0wVUt4Rif6M4mWBW?=
 =?us-ascii?Q?+t7oXPXoQy6anBHHa1rmRBFkNIAk7lXmHPp+TOwvSskjnP2nTexJLzOSxFEE?=
 =?us-ascii?Q?QF2ao61YDV4Sz2h67AHALgxe9fyyNBGWxLOCFHI53r2YnT9kVx4DOBCHyNMy?=
 =?us-ascii?Q?duPD5ivzs38Z5FRfFT/98V6DyICXrcnWy/yhZvvuPLLTOt5JPzhfMGnMlUZU?=
 =?us-ascii?Q?7ztMF5elEpE=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?BjILqHcn9c/fevGXfDz3xeW7PIgr8HRJzgteWX9pWT9nph2srMazK14BW+w8?=
 =?us-ascii?Q?LsGnrUrjBALnTqIkHE8F8HC38ZLT7MNP5JHLXyCf4L7XCQ3Y+eE0ABR6/7+/?=
 =?us-ascii?Q?kyVZgVUmlTCaN0aWUDsLkJcyX2QHFTpPfHhwKBCibDpDvsZjvDCVN//EA/Vh?=
 =?us-ascii?Q?SBsnHDvsJlsY8AY5fyc5EWP3Xne4JqCmtFUm3CEb/8DCjVyGbSxZ7iHjO4W3?=
 =?us-ascii?Q?0n+0cORU/avU2ya6gvX1Jz3c3X10sBpOuog2B7rN06cIHqBeNXHjjK6skeLu?=
 =?us-ascii?Q?wlEhi8aai2zmZIJBj5NR9QFxLerB/hqiWWUYlUk7c3+LKOaLNeD8WkQR5sA2?=
 =?us-ascii?Q?drJRBMQ+D0IBHJb/FBeaQUDiNA4UNXyggTX6TDef97Xqj3d03Q00VpePrzqK?=
 =?us-ascii?Q?k354HwCgCz7ClWqIYiwgTzYWEQYycWIfQVkRJxP0HUw6kbJRXHoNeVP1Jjww?=
 =?us-ascii?Q?kLrhp4tgqzfQUszb2OdZggWh2VbKe3s2SzHCiPXF+6yIogJhy84bMVIMWpG7?=
 =?us-ascii?Q?n0Csz44Hlp0YAq7LZNqcwc8E8xoz57CQT9uqx4QQ/KhyFaNS1Gs00LVcfnr0?=
 =?us-ascii?Q?3FOeYvpwjsnJWc3ydBmxT5+ZT71Z/DZ+zQt4LA8rNlQQs/RDXiCK7EmJp7+9?=
 =?us-ascii?Q?1gIsz1LucYA6kuBTUFfGShian7NSeaJini/NaRbJI7PQ/ekxvfYrDePdYyDi?=
 =?us-ascii?Q?s1og3/F+XLNTX5eUDaGFJ5d/rfie0/N1Fb+yQ6mGqIvS6sVZnvqjfbpdXnPI?=
 =?us-ascii?Q?miAKO7YTZUb0Ub5VQA9UtW74qEcQ3kB/WtUntRT25c6lkFZY55dzmjqp7hA4?=
 =?us-ascii?Q?uhskwhkPb0jigjw4c1AgGJ+8GSmkV39UiHHdGm2FVqVMDgt/3wZmlK6vAic4?=
 =?us-ascii?Q?q1JHUTMcLOe5Mx0zoJ4wqruY/WLYeAP+96HuJUwaiG8qqmSs6JNZjM5DsX8f?=
 =?us-ascii?Q?3SXnH3ydV9GhBULvdnbCzZC3m5p/4KT7BsqoTPlBbEnRCJZbCMnKZ2cI4aMl?=
 =?us-ascii?Q?KtjsrtoRqwyWC6EtHlxFJAsUrVdoCmfn6RKXuAU65SNSTw0Wudn9yPL0J4CC?=
 =?us-ascii?Q?tKn9JBjGY/9RX+p8ZayBQYVehOTW4/EoqtlvUlhCQU2KR1YgXtFZcr5iSHki?=
 =?us-ascii?Q?tEh/IYhHiPMI7agm0Jz/Q6qrYBHc+Q2ibu6QDvIqzuRMoQE7Lq9aq88Wb91P?=
 =?us-ascii?Q?fp+NVA/mFZqMN4o5sxEj5LmMkHQ8jWQ1hTp0gV7mtOLPmzV8m0DEnZ6TjgU4?=
 =?us-ascii?Q?Dt9Uai347ubTTB4r4AIxCaTGi0c5ndavrEFprG/WYoQ3WtQQivL/FVsPHSNY?=
 =?us-ascii?Q?xV/vcXfLJrw7xp2BxPNNabC5W20dFYT3w25zYOYEo7btZHdiFO8hCswnunY0?=
 =?us-ascii?Q?6O1eZlh84ZNfjrw2SEEIEcVtF+Dm5JNlIlByjbSOg2xxB/VzuEBYliond0Yv?=
 =?us-ascii?Q?jHwGurOr7p+IODqaSRt+/GrKeOKpVfk3gm4HnFTQ48r2Y/l9j2RZaDlFsrRL?=
 =?us-ascii?Q?tq2nkR4teXQq7MDhWXqzOC9yOvYF7Adz4ptQu5gPgYSxy8hmNsorOyT8Uljd?=
 =?us-ascii?Q?ZQDtMlstTJB1jKoJ1QA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0c30295-9f2b-4843-4ddd-08dd7ce5e4c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2025 12:54:58.3549
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: edsePiD3x3IVBnyh7XviXEpf/xrlmquvqsG8C3a38fltZLV7s9qAJoXZuZ5w5fwv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR02MB10032
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 12:55:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214988

> -----Original Message-----
> From: Mikko Rapeli <mikko.rapeli@linaro.org>
> Sent: den 16 april 2025 08:09
> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Cc: Adrian Freihofer <adrian.freihofer@gmail.com>; openembedded-core@list=
s.openembedded.org; mike.looijmans@topic.nl
> Subject: Re: [OE-core] [PATCH v3 01/11] systemd: enable efi support by de=
fault
>=20
> Hi,
>=20
> On Tue, Apr 15, 2025 at 04:20:50PM +0000, Peter Kjellerstedt wrote:
> > > -----Original Message-----
> > > From: openembedded-core@lists.openembedded.org <openembedded-core@lis=
ts.openembedded.org> On Behalf Of Mikko Rapeli via lists.openembedded.org
> > > Sent: den 15 april 2025 11:52
> > > To: Adrian Freihofer <adrian.freihofer@gmail.com>
> > > Cc: openembedded-core@lists.openembedded.org; mike.looijmans@topic.nl
> > > Subject: Re: [OE-core] [PATCH v3 01/11] systemd: enable efi support b=
y default
> > >
> > > Hi,
> > >
> > > On Mon, Apr 14, 2025 at 06:28:13PM +0200, Adrian Freihofer wrote:
> > > > Hi Mikko
> > > >
> > > > Would it be possible to provide some numbers on the impact on the s=
ize of
> > > > the binaries and the additional dependencies that could be added to=
 the
> > > > image with or without efi enabled?
> > > > I think the patch would be a very good compromise if the impact is
> > > > negligible, but otherwise the question is probably still valid.
> >
> > I have probably missed something in this very long thread, but what is =
the
> > reason to force EFI support on us rather than relying on the efi distro
> > feature? We do not use EFI in any of our products and thus do not have =
it
> > set in DISTRO_FEATURES. If it is suddenly expected that EFI support sho=
uld
> > be enabled all over the place it just means I will have to go hunting f=
or
> > it to turn it off rather than just relying on the existing distro featu=
re.
>=20
> Is it ok for Richard to enable "efi" in poky/poky-altcfg DISTRO_FEATURES
> by default?

To me, that sounds like a good idea, given that poky-altcfg is the distro=20
that has systemd enabled.

>=20
> It is already enabled in MACHINE_FEATURES for oe-core machines I care
> about.
>=20
> > >
> > > The impact is small:
> > >
> > >  * python3-pyelftools-native is added to build dependencies
> > >
> > >  * At runtime the efivars partition is now automatically mounted read=
-only by
> > >    systemd to /sys/firmware/efi/efivars and can be used to query vari=
ous firmware
> > >    and EFI bootloader (grub, systemd-boot) details
> > >
> > >  * Since "efi" is now default, other layers can stop enabling it:
> > >
> > >    https://git.yoctoproject.org/meta-arm/tree/meta-arm/recipes-core/s=
ystemd/systemd-efi.inc
> > >    https://git.yoctoproject.org/meta-security/tree/meta-tpm/recipes-c=
ore/systemd/systemd_%25.bbappend#n5
> > >    https://github.com/Wind-River/meta-secure-core/blob/master/meta-ef=
i-secure-boot/recipes-core/systemd/systemd-efi-secure-boot.inc
> >
> > But isn't the problem here rather that these layers want to force EFI
> > support instead of using, e.g., REQUIRED_DISTRO_FEATURES =3D "efi"?
>=20
> These layers want to enable EFI support but don't want to change the
> poky/poky-altcfg distro settings.
>=20
> In machine features "efi" is already enabled but it was rejeted here to
> use MACHINE_FEATURES in systemd.
>=20
> So full loop in the discussion...?
>=20
> Enabling systemd "efi" support by default is a tiny thing which would get
> lost all the other changes and IMO would not impact anyone significantly
> at runtime or at build time. Those who optimize systemd for e.g. non-EFI
> systems should be setting PACKAGECONFIG fully to their liking.
>=20
> Cheers,
>=20
> -Mikko
>=20
> > >
> > >  * /usr/lib/systemd/libsystemd-shared-257.so size increases 32 bytes =
from
> > >    4012152 to 4012184 bytes, 0.0008%
> > >
> > >  * systemd package size increase from 9857529 to 10226508, 3.7%, with
> > >    added files:
> > >
> > > +drwxr-xr-x root       root             4096 ./usr/lib/systemd/boot
> > > +drwxr-xr-x root       root             4096 ./usr/lib/systemd/boot/e=
fi
> > > +-rw-r--r-- root       root             6144 ./usr/lib/systemd/boot/e=
fi/addonaa64.efi.stub
> > > +-rw-r--r-- root       root           101376 ./usr/lib/systemd/boot/e=
fi/linuxaa64.efi.stub
> > > +-rw-r--r-- root       root           120832 ./usr/lib/systemd/boot/e=
fi/systemd-bootaa64.efi
> > > +-rwxr-xr-x -          -               67656 ./usr/lib/systemd/system=
d-bless-boot
> > > +-rwxr-xr-x -          -               67456 ./usr/lib/systemd/system=
-generators/systemd-bless-boot-generator
> > > +lrwxrwxrwx -          -                  25 ./usr/lib/systemd/system=
/sockets.target.wants/systemd-bootctl.socket -> ../systemd-bootctl.socket
> > > +lrwxrwxrwx -          -                  35 ./usr/lib/systemd/system=
/sysinit.target.wants/systemd-boot-random-seed.service -> ../systemd-boot-r=
andom-seed.service
> > > +lrwxrwxrwx -          -                  34 ./usr/lib/systemd/system=
/sysinit.target.wants/systemd-hibernate-clear.service -> ../systemd-hiberna=
te-clear.service
> > > +-rw-r--r-- -          -                 690 ./usr/lib/systemd/system=
/systemd-bless-boot.service
> > > +-rw-r--r-- -          -                 532 ./usr/lib/systemd/system=
/systemd-bootctl@.service
> > > +-rw-r--r-- -          -                 596 ./usr/lib/systemd/system=
/systemd-bootctl.socket
> > > +-rw-r--r-- -          -                1029 ./usr/lib/systemd/system=
/systemd-boot-random-seed.service
> > > +-rw-r--r-- -          -                 733 ./usr/lib/systemd/system=
/systemd-boot-update.service
> > > +-rw-r--r-- -          -                 782 ./usr/lib/systemd/system=
/systemd-hibernate-clear.service
> > > +-rw-r--r-- -          -                 779 ./usr/lib/tmpfiles.d/20-=
systemd-stub.conf
> > >
> > >   This shows a bug in the config between systemd and systemd-boot, th=
e EFI binaries are
> > >   provided by both. Sadly systemd-boot doesn't work so well and doesn=
't install all
> > >   the services etc which systemd does with "efi" and bootloader enabl=
ed. Not sure
> > >   if the overlap should be fixed or ignored. Using meson to install s=
ystemd-boot
> > >   binaries does fix deployment of the EFI binaries but does not insta=
ll the
> > >   random-seed etc services. With this workaround to avoid the EFI fil=
e duplication
> > >   in systemd recipe:
> > >
> > > --- a/meta/recipes-core/systemd/systemd_257.5.bb
> > > +++ b/meta/recipes-core/systemd/systemd_257.5.bb
> > > @@ -149,7 +149,7 @@ PACKAGECONFIG[default-compression-lz4] =3D "-Dlz4=
=3Dtrue -Ddefault-compression=3Dlz4,,
> > >  PACKAGECONFIG[default-compression-xz] =3D "-Dxz=3Dtrue -Ddefault-com=
pression=3Dxz,,xz"
> > >  PACKAGECONFIG[default-compression-zstd] =3D "-Dzstd=3Dtrue -Ddefault=
-compression=3Dzstd,,zstd"
> > >  PACKAGECONFIG[dbus] =3D "-Ddbus=3Denabled,-Ddbus=3Ddisabled,dbus"
> > > -PACKAGECONFIG[efi] =3D "-Defi=3Dtrue -Dbootloader=3Denabled,-Defi=3D=
false -Dbootloader=3Ddisabled,python3-pyelftools-native"
> > > +PACKAGECONFIG[efi] =3D "-Defi=3Dtrue -Dbootloader=3Ddisabled,-Defi=
=3Dfalse -Dbootloader=3Ddisabled,python3-pyelftools-native systemd-boot"
> > >
> > >   size without "efi" is 9857529 bytes and with "efi" 9859196, or size=
 increase
> > >   of 0.016% which is tiny. To stay closer to systemd upstream, I don'=
t think
> > >   removing the duplication is worth the effort for now. systemd-boot
> > >   recipe could maybe be replaced by systemd recipe and a systemd-boot=
 binary
> > >   package. Otherwise the configurations don't match. FWIW, it tried f=
ollowing
> > >   changes to systemd-boot:
> > >
> > > --- a/meta/recipes-core/systemd/systemd-boot_257.5.bb
> > > +++ b/meta/recipes-core/systemd/systemd-boot_257.5.bb
> > > @@ -24,6 +24,7 @@ EOF
> > >  MESON_CROSS_FILE:append =3D " --cross-file ${WORKDIR}/meson-${PN}.cr=
oss"
> > >
> > >  MESON_TARGET =3D "systemd-boot"
> > > +MESON_INSTALL_TAGS =3D "systemd-boot"
> > >
> > >  EXTRA_OEMESON +=3D "-Defi=3Dtrue \
> > >                    -Dbootloader=3Dtrue \
> > > @@ -43,7 +44,7 @@ python __anonymous () {
> > >      d.setVar("SYSTEMD_BOOT_IMAGE_PREFIX", prefix)
> > >  }
> > >
> > > -FILES:${PN} =3D "${EFI_FILES_PATH}/${SYSTEMD_BOOT_IMAGE}"
> > > +FILES:${PN} =3D "${EFI_FILES_PATH}/${SYSTEMD_BOOT_IMAGE} ${libdir}"
> > >
> > >  RDEPENDS:${PN} +=3D "virtual-systemd-bootconf"
> > >
> > > @@ -53,6 +54,7 @@ COMPATIBLE_HOST =3D "(aarch64.*|arm.*|x86_64.*|i.86=
.*|riscv.*)-linux"
> > >  COMPATIBLE_HOST:x86-x32 =3D "null"
> > >
> > >  do_install() {
> > > +       meson_do_install
> > >         install -d ${D}${EFI_FILES_PATH}
> > >         install ${B}/src/boot/systemd-boot*.efi ${D}${EFI_FILES_PATH}=
/${SYSTEMD_BOOT_IMAGE}
> > >  }
> > >
> > > Cheers,
> > >
> > > -Mikko
> >
> > //Peter

//Peter


