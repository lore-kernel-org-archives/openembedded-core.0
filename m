Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62680D0BB4E
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 02:16:24 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.83])
 by mx.groups.io with SMTP id smtpd.web10.5408.1729736174400446622
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 19:16:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=WtjGkopJ;
 spf=pass (domain: axis.com, ip: 40.107.22.83, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UYnpysm5E67fIJ9UEqqSPgC+CG97tPv4SmSB7CSg2IS8G9YDbC/VpMleh0IfAb8sVHP0pMzOfTY1dXJ0oQ55KNmbgSNEmigJ2m0Cinx5daCXG/3Ujj2GV0mW0ZeF0wQ513ATCenAtVq3NruXcTTWtKSG2fzOldqJ08MfGcUvUtX3//PXTbapnlwdILoX2tO7iepQJFnhe+1VKdqFUsLg7lkpydXAGGPGd7CFRACnsl6251Oorj/2iqk6KoD3AY67R1YsRLrVVdLP9snUuR3AjUJFRYB9DBbZS2gmx1P4SCPkJ/cL9TZ/aa+BAcVYBVvjfpDvIzkkWINRxyHr9ZUwVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MiN2UWl2eAIZIGlMkBnTMzX6z1E9eKtqSig0lDTSpGs=;
 b=u5/ac5pYUCaLxx7I5ivXsYz+A4+BacbmbtSzX+zd5O8LYJpM0BQNWjU5UVO1GfhhHu2CW4BD7ZSgC+jGrMHPr8CR5+W0Rp+YAg4f5UeYnuUsfK2tMgweys7bGjm9tVJ052oTHu0bYOfp2ibKDPkW0HnBvkDgJwk6uYxOMxPgHoP/Fyg7oaY8Bl4c7SuP54/hQvkeLyPqeMjLiACMunOEwTlUx59IJemSsLo583Bm8QWASN8cbtfrRTeq4TE7O69vjdA9wyDjqvWjMP1SYQIDF27UOYooJ5QoLMSDyMdBc6CCIgzO8IEHErJ5iyL4FexdggT1yr212T4TQlaI4ogPaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MiN2UWl2eAIZIGlMkBnTMzX6z1E9eKtqSig0lDTSpGs=;
 b=WtjGkopJqRp8zYzlK4Mq4jl5YzM+DtA8mClNlyI8ZCZCtzaHli7l83gjkfRVfMEbb47EM7f+wGx90B0VrIH2p5lRpqQTiGdxLgeQF/M9vV03vw2TLPKuO1ZuWRpYCaDOKLnUWBZRzEvoIG2XFh2dIr3qiQbhgGXAPpHzv/ZOzdA=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AS8PR02MB6885.eurprd02.prod.outlook.com (2603:10a6:20b:250::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18; Thu, 24 Oct
 2024 02:16:09 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%4]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 02:16:09 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Joshua Watt
	<JPEWhacker@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH v2 2/4] lib: license: Move package license skip
 to library
Thread-Topic: [OE-core][PATCH v2 2/4] lib: license: Move package license skip
 to library
Thread-Index: AQHbJZF3ja5qgR1WBUKXABoZXdFr3bKU+lPQgAAu+MA=
Date: Thu, 24 Oct 2024 02:16:09 +0000
Message-ID: 
 <DB5PR02MB10213A0C700E098AE20B78577EF4E2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20241018220818.4042304-1-JPEWhacker@gmail.com>
 <20241023212013.995247-1-JPEWhacker@gmail.com>
 <20241023212013.995247-3-JPEWhacker@gmail.com>
 <1801394EB093B1DD.16325@lists.openembedded.org>
In-Reply-To: <1801394EB093B1DD.16325@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AS8PR02MB6885:EE_
x-ms-office365-filtering-correlation-id: 6c546d1b-a076-46de-f874-08dcf3d1d2e7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?SP9+crDyfENp9RKaOLq+oHNzySJahJ+J4+2xTOodpABWhN3t24Cj0ulS9pZ1?=
 =?us-ascii?Q?fMr/1VnpKQq93e6pND2JTBvJniDMUV+vShhul4g9XE5CfdaYXbpPJt4LR/20?=
 =?us-ascii?Q?7eGbJSlZwDbqkib66DEhXp3UUTov9XCVz3U9hfV+aAF6WNNYeX9Ber0zZ/Xg?=
 =?us-ascii?Q?svBJgZZ/JoDihwjWKxDm22aqblvRWQ5mznzNlAsCPihORSF3Pprqnnl2N1IF?=
 =?us-ascii?Q?HbQ9+65Fbn9KQRs/aQJFgDeND0ZakiKbWcKfye/iVq9Bl0tgasB0v4ZoDZ6f?=
 =?us-ascii?Q?akRc4oaQ3SzkckEdvVJG0Fcr3PCYiaccBsSfQoK2drcf/JGcrjZZcVlYQdH0?=
 =?us-ascii?Q?4Dbrd1S61Wfr5+8hcftDCTfj+eRX4dxUJ2yrTRKRLA/wFwAvQ81/Kf5MW3Gb?=
 =?us-ascii?Q?5jB8wbaTzwuE3oTWvydIqLZkTaEZdl+PwM636FvgIipmr7yZETmd4YGkqLv6?=
 =?us-ascii?Q?8tQ9wNIXU3r5E0YT2xp8U2vlszdcGUiwpwF1jGkox51Y8JhMrCTozkphM9Pw?=
 =?us-ascii?Q?g0MEP98chItvYpLJNvAFbhrpOgtg4IElwOQi/DFp39QzUZAJYbmfHnRK4fP4?=
 =?us-ascii?Q?H96S2pmxE8lq7Y87odABKHYzuTV8RQ4zex4nLjIxkq4cCaha83/ABB4LM4oy?=
 =?us-ascii?Q?jE8ofddZq/uwKwy07V33Qk2Wktib7zzorW9NK21UeZ7qnbWwXT4pMWAgDEX9?=
 =?us-ascii?Q?et8kYGGOMbW9/AyFlHTRg6SWYdO4h28sg9SpRngK3yZb55k6Dax9601om8co?=
 =?us-ascii?Q?/VvTncUbboRhdvgNM5wuKhqnd9+AIinP1/IQWJ7qG5pBb9R2ineZJYn3Wh9H?=
 =?us-ascii?Q?n1gSK02e0qLqMewdaaSeiDe2nfJP94E8ysPmYVxolRp+K4Q8TaVyQojRwTUR?=
 =?us-ascii?Q?UxHSU86CdKFc9WPO8O87duPwJo89iZbUWJIkXY9V/I0G6Q+K1BhLk9vziDXs?=
 =?us-ascii?Q?xQsXcqS/KxdQapuri2K8RIRqI83u2xzhramPZD7DKxF9ApI98FpERpJCRcQ9?=
 =?us-ascii?Q?/9gy9CpKKER/gWkQabG0XvnzsvRs4uVoqQ0XL60SO3YK/54xcZNYewbbOGWT?=
 =?us-ascii?Q?AVeJN6RK2Jr2OPBM1Sq7R7UQQVwuw/32PSc1R+noiMenqWoyNwyAUOee/Yol?=
 =?us-ascii?Q?btiz4WuuwwylWLYetV6b1gzhnpAE7AEmO4v+9emzyw43GGOOo2VVWDsvk+3F?=
 =?us-ascii?Q?Q+KkGmbM4NrX25V7qEwe8xugVtpHP+JzYXoE9GTsQyYOWtmdvogjOUxONrG5?=
 =?us-ascii?Q?40Lf7dcRjhPPr6QSs4sMKCC3HJ4WNgFIvZIRzDcB5s4Y4UQUKNDHOs9AiJvT?=
 =?us-ascii?Q?NqufJvHq2ehyx+oO+Nfv0lkIAtKCpDb8tmBdkIVCLbbr2ngyOVHU6NcP3pcn?=
 =?us-ascii?Q?av/KWTw=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?xMXMgteY5+VljggjN9CsIe156gDD/2JYvQeBIz3bCc9eVpeUKBzTBj9ID6Ha?=
 =?us-ascii?Q?GHTpLpXPpoH7MsvZFR97VMY3jUOP5OGDbCsWUmHAeKPK0ScXVzuLujPvOn9N?=
 =?us-ascii?Q?UdbQ5zyJhcDnwD4eU+96yfJ3aYqbMotkujLQIqLP5/Ou6XtKvsMRRHiI/lR5?=
 =?us-ascii?Q?ux/MAt3WdVq461dmI5Myq5wX1J+LLl70Si8OnnMWVsqQgBYVf1qG/+sp8S7p?=
 =?us-ascii?Q?k9tPaHEVbGlCWpXEV1Ob5XyYFoanhPbPPRf7bptCziOiyb5sl9Kw7GWQIJXi?=
 =?us-ascii?Q?Phf8R8pSwPS0uNmTfhHHz/OX4jvlg9Jl/Z72+lnrYT1FP3lCErnU9Bp8ZeZC?=
 =?us-ascii?Q?s3fGcfM2iEaq3nvIvA6HsRocl3sghF4F8muWmkmmpWPyNVwV+y4civpEbOpv?=
 =?us-ascii?Q?ANa8ieZgqrsGMIny99U6x3HhRU7OFOhImb0WT/OGa1l44tuNlAbMPxcWj1k0?=
 =?us-ascii?Q?QrXKsbUWm0OwffukoIMIOH20lg1FZnbloEVlGVb8L2NlkfCz61veewpe5L1p?=
 =?us-ascii?Q?krCiwy7JjhftPqS4PzSWSAxkOPThIWu+p+USbGILgs1fJwTuzpxpbZf4u2ur?=
 =?us-ascii?Q?Am9sl6bk95tytcGUqZY3e/5MqO0mECb77dIuEuMHjAgrCogh93XOOxhBKyKB?=
 =?us-ascii?Q?69avp0713RkFLayKpS1WyrqyFz0LdQ8zMkhio3EGB2xlJl+mr7EwfWH1zwxv?=
 =?us-ascii?Q?PmNO1J3ku4KrDciU8T3aGPE8qQpzCbgdiltpNissfQfGpE4g71easODKp51v?=
 =?us-ascii?Q?4pWdwEP4idsrObeIVY8v7+xIDcJe4V9lq+p8pnF7aPBR8ynTnNGl5frkIAM9?=
 =?us-ascii?Q?C4mRaVEwCKuEyekAHLppXLrNKMMXwTROuqTcmo0rG4/5ben2aGbCgeNxz0Z/?=
 =?us-ascii?Q?5RBjtUw/8yO1er1Syyu9DS86UG4SSFrwj+Z5RNoOrDjIWpVcVYw1fVwZRnVM?=
 =?us-ascii?Q?dMLvHEgK7Bn/bPKTLmWqILA25sRKLqsCUa94R7zcnddkVyVGO+zYunk5qpKi?=
 =?us-ascii?Q?Q7vPfNSzktEtH0ozuqSG9a9uqsCXmtMQdgYpx2lW6HtF/CueJ+CVlLOwfa5c?=
 =?us-ascii?Q?2ehtM0b/3NkL1ukHdx5fd8mH0i5JwX/D9VrWPK6v3zm7bnHZ9IaG80aek9SF?=
 =?us-ascii?Q?JWFNz5whxF/TxWrUSV6IgxY6oAThFq3sOcA1TZsJk8IpDcpqrvLjKE5hEaAS?=
 =?us-ascii?Q?yVblnAV72K3s7Q0k+cGzCxlE3I2lWmYddnh/bWUk+TH8X1NHRNsOlXPOkzFk?=
 =?us-ascii?Q?bwzmHNoLGj3zOWwZyuxPQjIjCPc4sVmESJ6PgWgio4h6hRYRyisPuKqFAxoJ?=
 =?us-ascii?Q?036uTtitk0g4Ko+n9yPy5UgwJG27ww2byX2DA/zal3qyL2Z+E83q872S+393?=
 =?us-ascii?Q?TLuDs/O2fkTpPF6hijGs7r2xmzy/vbdI7VV4F+RVI4jGxIuFDgQwJr3FwBr2?=
 =?us-ascii?Q?wJ/hyz7jiuzhVtQivAfddEFg9BiaCJBOlomrPL35H4n/IMHpGlS6h0RnzpFA?=
 =?us-ascii?Q?eqn8coLRSCf2kw8IPmn8PX1E2iobuz0V0bflyccOF/mloGbODvhh4z1TVYSk?=
 =?us-ascii?Q?+9U3u1Zc2Tq5yPBxd9g=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c546d1b-a076-46de-f874-08dcf3d1d2e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2024 02:16:09.1560
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pBKB/AjWCEGN2p7oXShRpsLmWCGNDVm5rVqMrrNwOENurfEfdo4iYY9j1Q6RYdAt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB6885
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 02:16:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206274

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Peter Kjellerstedt
> Sent: den 24 oktober 2024 01:39
> To: Joshua Watt <JPEWhacker@gmail.com>; openembedded-core@lists.openembed=
ded.org
> Subject: Re: [OE-core][PATCH v2 2/4] lib: license: Move package license
> skip to library
>=20
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-core@lists=
.openembedded.org> On Behalf Of Joshua Watt
> > Sent: den 23 oktober 2024 23:15
> > To: openembedded-core@lists.openembedded.org
> > Cc: Joshua Watt <JPEWhacker@gmail.com>
> > Subject: [OE-core][PATCH v2 2/4] lib: license: Move package license ski=
p to library
> >
> > Moves the code that skips packages with incompatible licenses to the
> > library code so that it can be called in other locations
> >
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> >  meta/classes-global/base.bbclass | 35 ++++------------------------
> >  meta/lib/oe/license.py           | 39 ++++++++++++++++++++++++++++++++
> >  2 files changed, 43 insertions(+), 31 deletions(-)
> >
> > diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/bas=
e.bbclass
> > index 88b932fc3f0..5b8663f454d 100644
> > --- a/meta/classes-global/base.bbclass
> > +++ b/meta/classes-global/base.bbclass
> > @@ -573,37 +573,10 @@ python () {
> >
> >          bad_licenses =3D (d.getVar('INCOMPATIBLE_LICENSE') or "").spli=
t()

Missed this in the first review pass: you can move bad_licenses down to=20
where it is being used.

> >
> > -        check_license =3D False if pn.startswith("nativesdk-") else Tr=
ue
> > -        for t in ["-native", "-cross-${TARGET_ARCH}", "-cross-initial-=
${TARGET_ARCH}",
> > -              "-crosssdk-${SDK_SYS}", "-crosssdk-initial-${SDK_SYS}",
> > -              "-cross-canadian-${TRANSLATED_TARGET_ARCH}"]:
> > -            if pn.endswith(d.expand(t)):
> > -                check_license =3D False
> > -        if pn.startswith("gcc-source-"):
> > -            check_license =3D False
> > -
> > -        if check_license and bad_licenses:
> > -            bad_licenses =3D oe.license.expand_wildcard_licenses(d, ba=
d_licenses)
> > -
> > -            exceptions =3D (d.getVar("INCOMPATIBLE_LICENSE_EXCEPTIONS"=
) or "").split()
> > -
> > -            for lic_exception in exceptions:
> > -                if ":" in lic_exception:
> > -                    lic_exception =3D lic_exception.split(":")[1]
> > -                if lic_exception in oe.license.obsolete_license_list()=
:
> > -                    bb.fatal("Obsolete license %s used in INCOMPATIBLE=
_LICENSE_EXCEPTIONS" % lic_exception)
> > -
> > -            pkgs =3D d.getVar('PACKAGES').split()
> > -            skipped_pkgs =3D {}
> > -            unskipped_pkgs =3D []
> > -            for pkg in pkgs:
> > -                remaining_bad_licenses =3D oe.license.apply_pkg_licens=
e_exception(pkg, bad_licenses, exceptions)
> > -
> > -                incompatible_lic =3D oe.license.incompatible_license(d=
, remaining_bad_licenses, pkg)
> > -                if incompatible_lic:
> > -                    skipped_pkgs[pkg] =3D incompatible_lic
> > -                else:
> > -                    unskipped_pkgs.append(pkg)
> > +        pkgs =3D d.getVar('PACKAGES').split()
> > +        if pkgs:
> > +            skipped_pkgs =3D oe.license.skip_incompatible_package_lice=
nses(d, pkgs)
> > +            unskipped_pkgs =3D [p for p in pkgs if p not in skipped_pk=
gs]
> >
> >              if unskipped_pkgs:
> >                  for pkg in skipped_pkgs:
> > diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
> > index 7739697c401..866a876d7f0 100644
> > --- a/meta/lib/oe/license.py
> > +++ b/meta/lib/oe/license.py
> > @@ -422,3 +422,42 @@ def check_license_format(d):
> >                      '%s: LICENSE value "%s" has an invalid separator "=
%s" that is not ' \
> >                      'in the valid list of separators (%s)' %
> >                      (pn, licenses, element, license_operator_chars), d=
)
> > +
> > +def skip_incompatible_package_licenses(d, pkgs):
> > +    if not pkgs:
> > +        return {}
> > +
> > +    pn =3D d.getVar("PN")
> > +    bad_licenses =3D (d.getVar('INCOMPATIBLE_LICENSE') or "").split()
> > +
> > +    check_license =3D False if pn.startswith("nativesdk-") else True
> > +    for t in ["-native", "-cross-${TARGET_ARCH}", "-cross-initial-${TA=
RGET_ARCH}",
> > +            "-crosssdk-${SDK_SYS}", "-crosssdk-initial-${SDK_SYS}",
> > +            "-cross-canadian-${TRANSLATED_TARGET_ARCH}"]:
> > +        if pn.endswith(d.expand(t)):
> > +            check_license =3D False
> > +    if pn.startswith("gcc-source-"):
> > +        check_license =3D False
> > +
> > +    if not check_license or not bad_licenses:
> > +        return {}
>=20
> For efficiency, it would be better to return early, i.e.:
>=20
>     bad_licenses =3D (d.getVar('INCOMPATIBLE_LICENSE') or "").split()
>     if not bad_licenses:
>         return {}
>=20
>     pn =3D d.getVar("PN")
>     if if pn.startswith("nativesdk-") or pn.startswith("gcc-source-"):
>         return {}
>     for t in ["-native", "-cross-${TARGET_ARCH}", "-cross-initial-${TARGE=
T_ARCH}",
>               "-crosssdk-${SDK_SYS}", "-crosssdk-initial-${SDK_SYS}",
>               "-cross-canadian-${TRANSLATED_TARGET_ARCH}"]:
>         if pn.endswith(d.expand(t)):
>             return {}
>=20
> > +
> > +    bad_licenses =3D expand_wildcard_licenses(d, bad_licenses)
> > +
> > +    exceptions =3D (d.getVar("INCOMPATIBLE_LICENSE_EXCEPTIONS") or "")=
.split()
> > +
> > +    for lic_exception in exceptions:
> > +        if ":" in lic_exception:
> > +            lic_exception =3D lic_exception.split(":")[1]
> > +        if lic_exception in obsolete_license_list():
> > +            bb.fatal("Obsolete license %s used in INCOMPATIBLE_LICENSE=
_EXCEPTIONS" % lic_exception)
> > +
> > +    skipped_pkgs =3D {}
> > +    for pkg in pkgs:
> > +        remaining_bad_licenses =3D apply_pkg_license_exception(pkg, ba=
d_licenses, exceptions)
> > +
> > +        incompatible_lic =3D incompatible_license(d, remaining_bad_lic=
enses, pkg)
> > +        if incompatible_lic:
> > +            skipped_pkgs[pkg] =3D incompatible_lic
> > +
> > +    return skipped_pkgs
> > --
> > 2.46.2
>=20
> //Peter

//Peter

