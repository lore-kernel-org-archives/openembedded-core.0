Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB0D4CF34BF
	for <webhook@archiver.kernel.org>; Thu,  3 Oct 2024 18:21:18 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.45])
 by mx.groups.io with SMTP id smtpd.web11.3661.1727979669433054130
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Oct 2024 11:21:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=Km9MZ/Wh;
 spf=pass (domain: axis.com, ip: 40.107.103.45, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T62babzb+AWAJ3MiEt38wfkPNsiFMohfMiBQ/vzfxWj0vwI3Fddy3aUoyF5sZAkBG0hVQZqw42o7dvPA4Xkx+SpRaP3Hupu+66OusjdmWMBbVnn7dzYwzzZRkfXUdz9BuNsDR/4JBTQ7Cm+aBLAKdiIFS9sPFoW58s4LIjq/Fhnb2WAXqLeTAJA1O1MI+lft08z3sY1g2Fq7g2totFB2hoBvWvDfbgAyfbibhGV2XZkKba7Ic0PhtH/CgzID5SzreGVPtWPmSuXqYyDZzvewat4rlQUDBS0m4kRk/UbzQnhaVw3W4SsRTMZgcCFKf1AOFNXgCoDw6WYMWgq9NBVqxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kg4up5fDAOmXfEgioXniwoG452TFNM6Xn8DoINlCze4=;
 b=x9xbgNezDZQ0zQRxoGtHisDUMP1BtQpN4eZB6GtugHpsLxsPbUj5AjG7qHCBcrP3jhem8yMjsZYiApeJE4GZf1e/FfD6mRyDFuTrFKorwoo9qkTWRbIF0hLn+HzY0Nsb0RPqyzVdBt7hn8lYyHWerv8kA6U3pbBFRkRDMrLZC/gcksPdHilLYcLU+0cdcDQHdfPu19qpOGUgzVUbEVT+DaX42OviIgmZn1IPnidq6r9Ni25iWrSyDjEkYsFyXNTOx8rGOT4HlFtpjp8mQtACD160de3Ky/nIRlIJEJqmSdjvBz/BBxwSEEfNLqzSTE4UNXBg7XlGUNwYtbSkKysTuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kg4up5fDAOmXfEgioXniwoG452TFNM6Xn8DoINlCze4=;
 b=Km9MZ/WhJN2J8KOsfNHJSqbZI/wcHfVwVK28vsKLhXTPpq3urByrPPdVdag07l7O1oct0RN7bIX5Iih/dGhtR/Sp5Q/4tlQS5wA/aO71SulSRfQcyVe7Lnb71inoCCH9LWOnQAsxag3/6W3d4IhLIJkr+xvBpoibz5im5QLCc/k=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DBAPR02MB5976.eurprd02.prod.outlook.com (2603:10a6:10:187::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Thu, 3 Oct
 2024 18:21:05 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%4]) with mapi id 15.20.8026.016; Thu, 3 Oct 2024
 18:21:05 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Ross Burton <ross.burton@arm.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] strace: download release tarballs from GitHub
Thread-Topic: [OE-core] [PATCH] strace: download release tarballs from GitHub
Thread-Index: AQHbFamvKfsdPmffek21PVWHbQWy1rJ1VgOQ
Date: Thu, 3 Oct 2024 18:21:05 +0000
Message-ID: 
 <DB5PR02MB10213D52FEAD6AF7EEBDC46E8EF712@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20241003153344.3089615-1-ross.burton@arm.com>
In-Reply-To: <20241003153344.3089615-1-ross.burton@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DBAPR02MB5976:EE_
x-ms-office365-filtering-correlation-id: c2ea8264-c625-4c72-ac81-08dce3d82508
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?nNRhACdCEpWAV+zQ8EEc0fKOcnIfzqsNs1Owm4oJv1B5ZcAwJp+mFXvdo80E?=
 =?us-ascii?Q?Y8CGuneXfC14/XsTIilCQ1C4t6EwijABEMFHSkKzkBeGfe5S4Z3vKe6CMGNh?=
 =?us-ascii?Q?GouE809FLa2F7jUyS4WACkO7J5+WH6CRSBcb7pz1l5t0eFcudo+6hcXIzPyG?=
 =?us-ascii?Q?sp7alGVZu6BBuBAzFcbrK0Er4+0TV+7lGxSCPzd2YTAhB+HdzFqyhday8PTZ?=
 =?us-ascii?Q?ZKDxhInYSpl4euKOPY2l8HQ0hev9y1oWH4rdeeNwC4srWpGlL3wN+dAazh1A?=
 =?us-ascii?Q?L//kjCUsIvzUCiUzf1A4iGHCracGiTig8pyXJf9EbSAjXi6LMslgKdD9fnMC?=
 =?us-ascii?Q?kxJQjJFVGmCdsYy2FS4yiSIPkeSFaXF9z71+eCkEf0OUPQY//a6R/pFjEBlQ?=
 =?us-ascii?Q?cdHT1GNsfEA1bdRyLOulrwN4mA+/S/Re0p5ajreuWoda0dKbSqxgBLb1NIwI?=
 =?us-ascii?Q?5o9yYSmyxpI0tyB4cX/FfF7QCF4YAeJ2jHSZgXPqjsdGewhOcKpwEk++Z5qI?=
 =?us-ascii?Q?uHaXeu6U1d59N2jIYEG9pUq93PaYoh7utMuiv8w8IZ6tbooraUJfnWqHeZVs?=
 =?us-ascii?Q?AYF4WpGvfRktwsFnpk5flLNpMxIp8UKCuFQAhEGVqQzC29B8EqxmCd/kn1Zl?=
 =?us-ascii?Q?suAX7rVtXtXjtaPNm5S1FOLP4ebQdr8rHUcC6nSikQU3nIwz0YxD7f34XR56?=
 =?us-ascii?Q?YV6XZIXMvnkPC69kF/uHPMnTFr3MrIKNLNJF9yDrCH1OO7+zL1J1hCASz+Xt?=
 =?us-ascii?Q?ZtDIcIDsAbsY3FMAJirwD5HBJEgYBEMEvgpM3vFeTuMOlmj2kOP4fL5j6sjp?=
 =?us-ascii?Q?ardlgV9KKber2L9/bLBOWGqvuImPclZl0668H2Mnx7no4Bl0n316VgOO0prd?=
 =?us-ascii?Q?9Et8L60vycT269SQH2p6Hk0WBlVoYGyTcqOfq6ZH0ZBkeMlVHYmnTtrrLGlk?=
 =?us-ascii?Q?dlzLHTLqFeAjTZOesUoeatNFFLkrQEW557e6+3vMYjtRx4w2HweYjygQHV/I?=
 =?us-ascii?Q?vED1YmLDlR7C+lNQ+n6vqhhP6oU3OrDLw5NtOs3AN1jcfy07FAB/bvp2euRh?=
 =?us-ascii?Q?il+y4O3nsY+f93z8aAqw5izRrn7t2KPy1K5QTJbBAjNBXo4gJr0qZOrUXaDo?=
 =?us-ascii?Q?VploebQpZOFl9KKRyew/iQnKI9DFDIllV14dpzcazel14Z4xHJS2RvLHdYtC?=
 =?us-ascii?Q?5lsUmV+H/jn+cA35YnGtbt5cvmT7wSz/uexBpSHRTUGcAp2U0EMtfOnlrTbU?=
 =?us-ascii?Q?xG28c4yahy7piIUIPfBKMJdLaa9wi0ItN4ky7ujZjg=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?noV0mIBSCFABGE3C/A2TLckjGNnoJ2FeBRoR/eE72154eAS/8+e6OQNhotZn?=
 =?us-ascii?Q?KyqPKblm9FSWPqEa/Z9BHBbNntKz2iC9PENmHPbikMtQPIgGW2b2TztX5CXg?=
 =?us-ascii?Q?hsA9V+kwBwk0G49/9+X+2UPjRjZmLdEQ0RGGzK5kCci/M82wdapPe9AG20+y?=
 =?us-ascii?Q?Y4/Bsm8LuvZ4Hh/4qLRfw9/l1UDNpjKiSQ1J2pvQc7+XDgqBKJVAdZQHdQiT?=
 =?us-ascii?Q?24RCgX3Fj+4248m7QWEBmZ4bFmmmZAX3Q5Y5e2twXcEKlwQyRUzuf6asResD?=
 =?us-ascii?Q?x4Y9LzTq0+Jd/sr9VENpiV/F1yoPUXxQeVjM0KCvckdmHYYPHt90jfoX1juP?=
 =?us-ascii?Q?6XUg8FWEsuM4g4SCRS6+wLj2HzwednJknDsekOUBlaOUz7nJJ1DuRFiWuLsT?=
 =?us-ascii?Q?CO+DlG3GpjcSxi8lcq8lz2UuQZtCBg7Ae9Wx7P2sCp/Clujyw0YeEcZXZ8EJ?=
 =?us-ascii?Q?2wKDF3Z7yC2CcymII+cZHW2A6miIKKShNl+scL4UHfxTjENcdwwHAdSFNZZV?=
 =?us-ascii?Q?mWgsrkG3Dee17HpHGieZtlDYlfusAcPIdTE2JloqPnO2ZDTJFvxAbRzwvMtw?=
 =?us-ascii?Q?UzLZoKg6qGWRZit/Pc3SSmoDSPes6GP/+nwlw3UjDKxnAwxira/0VkFjskzn?=
 =?us-ascii?Q?Y16d7eaeVLnQyJc7bLy4UQ7rGXoXK0EMd7rhSfR1VmAqp7qoLlszJhknIQo9?=
 =?us-ascii?Q?QQlcRzs/Xn2Z3UG1EjTZWQnQFPceG5QtI7EgFSQn34rVcNooJlwaYHqLIX67?=
 =?us-ascii?Q?TyXlH1EPc6pPO2RmpJaEV6UURxGsp7jmDV25CRBpuT1SZTTLyz4YZKzGd76E?=
 =?us-ascii?Q?9qn99kKeACtGWj6SBNdrkaQMUJ0Mh7W3FPrStg4e716o5U5n2bMeO8mjbb3I?=
 =?us-ascii?Q?lMmepQuTY7bwSQhs3lJ/j7j63mnA1G4DO5bluW0Zy+aozAzrBuUo7+ndywJC?=
 =?us-ascii?Q?b6gL+Jkiig/ure1aVJrZldSbLFKJTKEQuKMMJxQEXcwOunp1bnH9tyCpLC+d?=
 =?us-ascii?Q?Ib9mShxQm8U+EvA/JDe6gwCOoAy9FfXcglWWyWWo7z+5brGxzgjmxq80jgq4?=
 =?us-ascii?Q?lCTq+IsF6Ct+WvxNQyQAjV+4HJ6JqVPZHbpRzmvHD4d2R57bq1pFdu27ZQ6h?=
 =?us-ascii?Q?gc4Gq6+ipJ6To6WkOrBCd2yC5eoWVQDE/ZVEQMahz30snTnu40DkjxdXN8mG?=
 =?us-ascii?Q?dyWqbNXnMi6BIgbNA/ic2MR8GG92D4ANfAYNrn5folLbfvJr5y7kc65MbVYt?=
 =?us-ascii?Q?usr5OcmIjbPG4L68ST6aNqyR/GY23TtnBgXxna6kgS4lnns4nF8jQsYHYt+u?=
 =?us-ascii?Q?4WcW2sBslOhOzzPti+/SH5J6bVvQB/cydOSuVM75CWNTFCP2HA4egOJFLtXk?=
 =?us-ascii?Q?R8Nre4B402J1r5CyB6pYU4d/wWSoBaZ7+LLLWvrkykVs3QECU8ooaoASV83a?=
 =?us-ascii?Q?1mhdC7uLcgD5SSvXPr0YXzCKYko/aCjCtFRyNWhrv2n9BBPEs3OQyaqJphNF?=
 =?us-ascii?Q?T93K6DIu0HFYcqaIAZvBSmGb0K5t7X4JAp11jyTn7Ga+N/fe/q/OufFZpTL8?=
 =?us-ascii?Q?OPA1BxClVFDcHSpwDGc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2ea8264-c625-4c72-ac81-08dce3d82508
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2024 18:21:05.3170
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Epz25LDZzmsrRNtx2C9T95N5K/xQ03GcJnFnKnai6aSYobYUAT85t6pqPpxM5bZA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR02MB5976
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Oct 2024 18:21:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205211

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Ross Burton
> Sent: den 3 oktober 2024 17:34
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] strace: download release tarballs from GitHub
>=20
> Switch to downloading the release tarballs from GitHub.  Their CDN is
> rock solid, and strace.io is hosted inside Russia which some networks
> are blocking.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
>=20
> diff --git a/meta/recipes-devtools/strace/strace_6.11.bb b/meta/recipes-d=
evtools/strace/strace_6.11.bb
> index d98b5fdec9a..a8f11ea8093 100644
> --- a/meta/recipes-devtools/strace/strace_6.11.bb
> +++ b/meta/recipes-devtools/strace/strace_6.11.bb
> @@ -5,7 +5,7 @@ SECTION =3D "console/utils"
>  LICENSE =3D "LGPL-2.1-or-later & GPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2433d82e1432a76dc3eadd9002bfe=
304"
>=20
> -SRC_URI =3D "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
> +SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/strace-${PV}.tar.xz \
>             file://update-gawk-paths.patch \
>             file://Makefile-ptest.patch \
>             file://run-ptest \
> @@ -17,7 +17,7 @@ SRC_URI =3D "https://strace.io/files/${PV}/strace-${PV}=
.tar.xz \
>             "
>  SRC_URI[sha256sum] =3D "83262583a3529f02c3501aa8b8ac772b4cbc03dc934e98ba=
b6e4883626e283a5"
>=20
> -inherit autotools ptest
> +inherit autotools github-releases ptest
>=20
>  # Not yet ported to rv32
>  COMPATIBLE_HOST:riscv32 =3D "null"
> ---

Not sure how you did it, but I assume you did not intent to include=20
the patch in the commit message (above)...

>  meta/recipes-devtools/strace/strace_6.11.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/strace/strace_6.11.bb b/meta/recipes-d=
evtools/strace/strace_6.11.bb
> index d98b5fdec9a..a8f11ea8093 100644
> --- a/meta/recipes-devtools/strace/strace_6.11.bb
> +++ b/meta/recipes-devtools/strace/strace_6.11.bb
> @@ -5,7 +5,7 @@ SECTION =3D "console/utils"
>  LICENSE =3D "LGPL-2.1-or-later & GPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2433d82e1432a76dc3eadd9002bfe=
304"
>=20
> -SRC_URI =3D "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
> +SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/strace-${PV}.tar.xz \
>             file://update-gawk-paths.patch \
>             file://Makefile-ptest.patch \
>             file://run-ptest \
> @@ -17,7 +17,7 @@ SRC_URI =3D "https://strace.io/files/${PV}/strace-${PV}=
.tar.xz \
>             "
>  SRC_URI[sha256sum] =3D "83262583a3529f02c3501aa8b8ac772b4cbc03dc934e98ba=
b6e4883626e283a5"
>=20
> -inherit autotools ptest
> +inherit autotools github-releases ptest
>=20
>  # Not yet ported to rv32
>  COMPATIBLE_HOST:riscv32 =3D "null"
> --
> 2.34.1

//Peter


