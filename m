Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0A03C71157
	for <webhook@archiver.kernel.org>; Sat, 21 Jun 2025 13:33:13 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.51])
 by mx.groups.io with SMTP id smtpd.web10.7374.1750512787252680399
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Jun 2025 06:33:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=Jjfy97Zx;
 spf=pass (domain: axis.com, ip: 40.107.130.51, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wwnPzrmrkzTLBB1nlyI/shX6BZNgfKwPnsGwP5PztrKOB4UXuNkh3M4yBRIccIji8oMRZzLI8QaAqC3KelL9cG42xKWh7nLK3BCsRQ8tYnXuIyaFnYlxxzOgpwfGu2GyhoweRmD0zS2FYxq7H+Exibk3N7MhQ36SlLxorLjlnoGY3spoELgL91U7+4NyZRlPl6HlzLxHOtug0piSfLrO73nUf8bPdIbbmBK4q2GOvVn98RpxDmEmF/ankegSmh0yh1SQRdHmyR2xFsX/eQ8KWdbr6nFLaOd1bwE4VYNKbvGbD++UxuApgxKQV02XP1XPIv1o+0ecHR2KbZRPBhwPJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+mUn6qWUi5O1zZ/14YDKf4cq9ktGKMYAG0jqgzqGE+E=;
 b=OflaiJc42aqPcTLvHsQOxOq8IUDDVc+dQ3d7nnY6iJCwk7U3qNVDLs647Mw3hGEUi0gzwiJcMTp3RJsjV5232jQhk30lxBngk1En42eCz+s+DbvS9JYkUBTqvJQWUFyvEekQurZV+FWbjX5Mp0vlYv59CEr07V35E8/bK8RWOsu2LBEzib8MmujCyI5uOcdarGFX8Mag+AjhGDr0OH/HzveRjM9L0de4lwU73SD/sXIyrgOyyV/nQ1clAqSlqzvK6aoPglgi2CzTElVzzCJ4h60g3KlQyKGyM1jAb6Z49uWxUOzVv4cGYr/Xfxc3BAOLzvGrgqQSd5KXjmZ8fWGThg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+mUn6qWUi5O1zZ/14YDKf4cq9ktGKMYAG0jqgzqGE+E=;
 b=Jjfy97ZxjCSrR1NUuM9M51TLe4/c2JK9nreZAO38JywDW0jIJtjwsICF7fO6PpNUEn39fvoZR2t8Et46ZVQs8WOvU27j5mdp+qNcaC4pkVUTZdQozZUo+V7TzxER0Nj1962vTxj8AnPASnJ/87TSCzb2vll0lD7mGzX9Fk+Ii6c=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DU0PR02MB9148.eurprd02.prod.outlook.com (2603:10a6:10:474::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Sat, 21 Jun
 2025 13:33:03 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%5]) with mapi id 15.20.8857.022; Sat, 21 Jun 2025
 13:33:02 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, OE Core mailing list
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] is there a style guide for setting COMPATIBLE_MACHINE?
Thread-Topic: [OE-core] is there a style guide for setting COMPATIBLE_MACHINE?
Thread-Index: AQHb4pyAqQ5wDu+A+kGaG6kvTrvDjrQNkLjA
Date: Sat, 21 Jun 2025 13:33:02 +0000
Message-ID: 
 <DB5PR02MB102136D2C39B9F57170C624A7EF7FA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <6fa83a65-3ed0-3f4f-0227-cd360828fc38@crashcourse.ca>
In-Reply-To: <6fa83a65-3ed0-3f4f-0227-cd360828fc38@crashcourse.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DU0PR02MB9148:EE_
x-ms-office365-filtering-correlation-id: 7cc8d15e-5161-41f4-c173-08ddb0c825a9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?ert2IAT5Cqv1oY5v2AAekRHuh9GGkZSJLmGOnAQab/RCS+gMFPHrCkNmvvE7?=
 =?us-ascii?Q?zEXpZDt3yIR/9X/5/iazVOI2b8UShDNXFJrnAoKAipQZF77Eg5V/B97K1yvk?=
 =?us-ascii?Q?68IKACJZUpd9A+BfxBbtC1c18YgNGaTma+jR4L+SaeCmVWjW16muGcH4Uy5S?=
 =?us-ascii?Q?+RMBk5HlY0TF6CsZtIDRodk613Psj02Uv1pLo5sS7DZ5EW0IuHu3sFp+Svnf?=
 =?us-ascii?Q?M2Hn0VG5l1bolNf//cCcp4F+ja02+RL/+qLhrFDduZtqKgeWSg7iQHqlF9cW?=
 =?us-ascii?Q?2492w7CzPOGcHPTwvsWRIcZVdVOdxJFnXouvhK2jcI75Kgwfw5lMcH+wjIO2?=
 =?us-ascii?Q?dfB7JWPeGOTvgfIoXszej2Qbw2vxvw5XOZaSyI+2Los13n498y6YgxGsnWJi?=
 =?us-ascii?Q?rwrZTMcEVfPFOUsvReJyM3BWwqMCYV4+9Wu/kpfi/cNGQHvoSeIn6ANMr5lu?=
 =?us-ascii?Q?l71cERvZDgH00LQkJce++7F2Cp9wPvsTjuK98uilwr1WAJ0XeddGEphHQrvE?=
 =?us-ascii?Q?O2Z+8lEEKWbQg1/LsL7EZFadfjMNh/A8LcRP4WEMLKf7Sfx0WUntSwZumv3f?=
 =?us-ascii?Q?gH1KR8tFLc1A3At39Lm7pwDBOrejRuNU3cS0/XvtL1SUt8fKbM/ex0jN/5Ur?=
 =?us-ascii?Q?jCc4FCHw+p5reml96YlgvICWq7C+baove4WwRCfxAdWW2aiiChe2xBr7hcNj?=
 =?us-ascii?Q?Des8zaQWsk7IAHdR/9HVQxbO7k65hpiNO/x19gO2WhXEbXR/MFydqV94X4K2?=
 =?us-ascii?Q?tljz11eNIUOxaSK3YLeX/GXNdm05eXM6sAw17BV8Cfae/N4VwQ7pBIT1GsPL?=
 =?us-ascii?Q?H7xZIWkda8NaXYw9nxmHeBYs9cEkiAqz4rsJlE4rUC+R1TgiCUuu1ofORr8k?=
 =?us-ascii?Q?stYNYry9vyW2wp80z3sfd9wqFbSR5OcFnqABM74QXBJPuagblA4H5/9IrBHy?=
 =?us-ascii?Q?S07NByasta82NRN2GrJyeyY3YP+aDl+V+3p97JVvy90JSydHmekoXZYUvDS9?=
 =?us-ascii?Q?b1olCGxfobRK+ZdzRxGGprLSggXecFT80FutJ6N/mpRPm3g+/TTSKo2m3orI?=
 =?us-ascii?Q?EDbHcJxSEO+B8XCARSp4hvTfq0fCuqO/tkRJlGLV26WPwHOXXU5yw5+GmGJC?=
 =?us-ascii?Q?nux85ENtTkTkvttBkx/+508NudD6up/sNgu/ikrV45LwuzaCq8z/J9hRAgcI?=
 =?us-ascii?Q?omJ8Hm32zxgvKLYGYsg15mqiNDyQl+PT5EysQwBbzF/15CfgOZuHQZujd70d?=
 =?us-ascii?Q?ckyqvJpWBoAiszhd7aIHZWPr1hlyKEzis6Oy96z/gQzNuZtas+9QTZPtIG1a?=
 =?us-ascii?Q?SGJtoLeB5r2T9SrMphsJ79QVHjwGUH8v6DJItHXuCf+B5xXCgUwgivpIhHv2?=
 =?us-ascii?Q?Ze0if1OgWNtYILWYa5+7EainkqZtgK4SZlqHjgsdS9rMK6rOoCSgD90kwrZT?=
 =?us-ascii?Q?VwbsmkNovJ6ZckJXrgbAc24N3oHZrXxdvrzeMvyZayV4BPavDzRbY63ICpIN?=
 =?us-ascii?Q?WZgF40QUdGaQ0ls=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?DIJ4YV7/RYHs4J0udb16VU3oBOPA3LXx06pnXM+zDG0LOFfPg0Y04s3oy2dY?=
 =?us-ascii?Q?vsL+SbX/bLlKai1L6cGuX+/lMCt13pUZGyJIP57QnGV+nTGBORyrfnskB5nb?=
 =?us-ascii?Q?Rv9G2MCrzmwJHQQ8mbZli0wL9+6akBf1Annd5poE+zK6irT7RHU3KMkH6y0c?=
 =?us-ascii?Q?UugQO2UKSGyYyigRDxc9Ni8yUr7nSqCNZd4QN78QqsJpWofivdf0SecxlWm5?=
 =?us-ascii?Q?KmFnEymzQL++OHoj7fI50Nqr6xkf2TUN3W4hbt4xU1rxTJTkpxTWu6WTYxPC?=
 =?us-ascii?Q?sff1SEtJ6YG9aK/cSpT0uL+XPZ/ZXp1bBVFFZvd6hrx9vuwbldRtV5lcz7EE?=
 =?us-ascii?Q?dGHR54di2G21T8IORc5fpqMYcLS5ILw1aBKsVGx4hJEArR2dY7K7QngL+OXL?=
 =?us-ascii?Q?MllZbbJmrnkJNR/HF5C6FcPd+kz+VCqBZzXtHQ3QWzFjoweur9fKofOgEzGd?=
 =?us-ascii?Q?PeVarmu7WG3gFuLatakzEcUdoLNqacdYr4KAdjO6ZlIaTNcZtgpUfcHu8l33?=
 =?us-ascii?Q?nmMW4oIjD6dD2DWkh5RjFa6PniNodEUPN7MYgoWYnuwMnnc6+8C1WlucIFxX?=
 =?us-ascii?Q?UpaGLibrJAx7lGi/cbu1vuhCPgSBW8U25fXp5mqqe3qJW3JA+H9F1lrHqqu0?=
 =?us-ascii?Q?ofCUsYPTsoxWYghC0i50G82UGIgbENt7w9jxcVuyyoxfI8BXvNlqWNW7hPn3?=
 =?us-ascii?Q?MCSr2kU3TC2qOBNEyd+Vo2z0V9hiQ32M8fIgyVHmLrsp6SRMM/WAQCz9kuYV?=
 =?us-ascii?Q?pC4Wt8LiiRQicUEA1bed+CJNhNYpqI7bF6SUrQOSqEi+IPWqEd9dkSJs+M7u?=
 =?us-ascii?Q?BdmtsLku+Hmb/pMDTbCrkZK/O62UHQknuQc6jR1TTr/GzFeHFIsfpZ7cAjey?=
 =?us-ascii?Q?ISBgppkxkHvTgxuTYvClOMMZM8jlRK0BVLdGXZdEFSRpa3fB65iMrN4e/if6?=
 =?us-ascii?Q?zs2L06+wlPZZ6Um0hsAiBL1pNr879q7bKdKaxAN38eHBJ4Uc30IdiPP62mCZ?=
 =?us-ascii?Q?66VXMSs7gso/oe2WH2rdfLXjgcp7sG34JjIomYkJYC/xN3/+vfRqlSH0d6lD?=
 =?us-ascii?Q?XKWEDqhlkDRvXOiWvHb8puFNF5h8AcC7YWSogEOJEYFU4KZBOqw/axzTL6lZ?=
 =?us-ascii?Q?ECBvrKoqZYmW/YHCLFCp9Polh81JX9XinyXKPsgZaVGRHg+FL2HCQAeUOo9d?=
 =?us-ascii?Q?Qc57qgfeodR3QKvQp54h4yXvoSLN5pqdV9NrkAUPgVvfnpGxxq7L/CSe8s+4?=
 =?us-ascii?Q?fwool6OXk+dbD++QzF+F1EOswzVoKYw/DRbdBYmQ4QNiHvynq6HGIXpuQfxl?=
 =?us-ascii?Q?XwI2Tb59lv0tGnacbT6d8UEm3fe2uot1qnuWkwT5ejRAKvNqph8EfDcs944D?=
 =?us-ascii?Q?CJccLuQFeMNyySZMpgz3nbIzHMpW3TzQHJgNyxCCJxu/daeI3Y8FMi7ggAqU?=
 =?us-ascii?Q?nAkuluqYKg6/3/Vbmf6hIM2GgLRbx8QF7EOY2G3WwViEptNWJjCXIlrXMOAm?=
 =?us-ascii?Q?MloBTBgHwcpC6ApbO309qNQc0rb3cXXeFD4phr8wWPWtd8VyECyrhvLl2ELU?=
 =?us-ascii?Q?kx2yGo2vxVKOpRC75zQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cc8d15e-5161-41f4-c173-08ddb0c825a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2025 13:33:02.8076
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 76opwr0QxeEkOOR9iZVP028I0nTuUdSOzdGDiRv9XgYatOAFEtgRXJzeIjrkLcLt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB9148
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Jun 2025 13:33:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219156

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Robert P. J. Day
> Sent: den 21 juni 2025 13:06
> To: OE Core mailing list <openembedded-core@lists.openembedded.org>
> Subject: [OE-core] is there a style guide for setting COMPATIBLE_MACHINE?
>=20
>=20
>   i ask since there's quite the variety of styles in oe-core,
> involving parentheses and anchors and so on -- here's just some of
> them:
>=20
> COMPATIBLE_MACHINE =3D "qemuarmv5|qemuarm|qemuarm64|qemuriscv64|qemuriscv=
32|qemux86|qemux86-64"
> COMPATIBLE_MACHINE =3D "^qemu.*$"
> COMPATIBLE_MACHINE =3D "qemuarm|qemuarm64|qemuriscv32|qemuriscv64"
> COMPATIBLE_MACHINE =3D "qemuarm|qemuarm64|qemuriscv32|qemuriscv64"
> COMPATIBLE_MACHINE ?=3D "^$"
> COMPATIBLE_MACHINE =3D "^(qemux86|qemux86-64|qemuarm|qemuarmv5|qemuarm64|=
qemuppc|qemumips)$"
> COMPATIBLE_MACHINE =3D "^(qemux86|qemux86-64|qemuarm64|qemuarm|qemuarmv5)=
$"
> COMPATIBLE_MACHINE =3D "^(qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qem=
uppc64|qemumips|qemumips64|qemux86-64|qemuriscv64|qemuriscv32|qemuloongarch=
64)$"
> COMPATIBLE_MACHINE =3D "^(qemuarmv5|qemuarm|qemuarm64|qemux86|qemuppc|qem=
umips|qemumips64|qemux86-64|qemuriscv32|qemuriscv64|qemuloongarch64)$"
> COMPATIBLE_MACHINE  =3D "^(beaglebone-yocto)$"
>=20
> what's the "proper" style so i can make sure it's documented
> correctly.

Given that COMPATIBLE_MACHINE takes a regular expression, what value you=20
assign to it depends on what you want to achieve. In some cases you want=20
to rely on it being unbound, e.g., "^qemu", which will match anything=20
that starts with "qemu". On the other hand, when you want to exactly match=
=20
specific machines, you should be sure to surround it with ^ and $.

Looking at the examples above, many of them could be simplified by breaking=
=20
out the leading "qemu" part, e.g.:

COMPATIBLE_MACHINE =3D "^qemu(arm|armv5|arm64|x86|ppc|ppc64|mips|mips64|x86=
-64|riscv64|riscv32|loongarch64)$"

On the other hand, some of them are strictly not correct. E.g., with the=20
first one, "qemuarmv5" and "qemuarm64" are not needed as they are covered=20
by "qemuarm", and "qemux86-64" is not needed as it is covered by "qemux86".
This is most likely unintentional, so that regular expression should be=20
corrected to:

COMPATIBLE_MACHINE =3D "^(qemuarmv5|qemuarm|qemuarm64|qemuriscv64|qemuriscv=
32|qemux86|qemux86-64)$"

or as per above:

COMPATIBLE_MACHINE =3D "^qemu(arm|armv5|arm64|riscv32|riscv64|x86|x86-64)$"

//Peter


