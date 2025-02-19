Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5461AC021AA
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 17:50:05 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.51])
 by mx.groups.io with SMTP id smtpd.web10.29101.1739987397186545965
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Feb 2025 09:49:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=T77uiXO/;
 spf=pass (domain: siemens.com, ip: 52.101.65.51, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VEe9n2OLhKyFmxB1f1hNImsGhZELThGin4eY/ekugNhj0v96y/uZtHGW1jOvVDLL2Yq4Bf7RqrsxNapBv7Yddvf/jgUmDCSGPTnaV3WqH400oEYJBEvE4ryXi3UdqnImBcJK1kFtw5FFnFIUEOiKwCAMzXGmf/ILuwxpRze4H/ewhEOSn9GhDUGOKbAP9n2q0w/DmF+is+K56GReVpW51flmJ4dEtEunxAIG1KlVNQkEi0PNh9t78L8ncaDvFrYFQYjCKPKeCiY+EqA1gGjtzZXy5LuGQv5enJYf9hM4/I1k2/xC2m7TYqXC9Q4rgTmtypn8AKIwNjeeCsxI/9DzjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=06nYcuuDlhXtN03/yYwAxS0o06ssYFj4iWaIOJqlFH0=;
 b=XIY/aR9T6jVIU3ywcifL6ovxFPAim/ckwnWd9Y7WhxYoLJoe0X356XxHtJ1vWYkS/Yf+328qQD1vb/+47HQo2a+ZbKWh5BlQOdt6WdTQWoPZJbut+lihMjfhx2acax81xFtHg5JRagbHHJRoVDtv31KIaEyYRyct0tLoKjzmzcc/f1hyHBXWEOiRB+BI90D8B9aGPuQMYBVDWMrmSfQaE7E5TZH/1z4WZl5gfg1GDh4YMUyw1UtNMFlN1RQca7D1KYzYoqTPwHYDedCrNApipVPtG1Vz3cJjMlKm5d7/0pQds7t/gWAl7FuKdTeymGZFqUQB34VLQVM6dYb8gDdSiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=06nYcuuDlhXtN03/yYwAxS0o06ssYFj4iWaIOJqlFH0=;
 b=T77uiXO/uZJHrRMgVQo5TzY2UX6fkc3Gk1vfjSTurhgZAF6e8G9CXEeJ2GUuxBeCSXxE+eD2iWvl9O84/NPTBRRw7yrFIVihi357GLgc7Mkq7afPiV2V5cY54mWwYMhZck2gzTaIKQlQj0Pecr4Jxe1pF3IXOn44PL/JubKWyOiaCxJs9MU0RgWX6z5g9IYSfemWDraY59tYIU9pMNZZeAY23wC2+XpFLqLcK6wlVnE/fIigMqh4y2NdKvMNZDxWjcs96JD+J7rduDjKr5JaUQ40Wd7/mAZKq5Er9leCviTDblJD9rVviYfB4+1WeIMy9fb69qQJhyvXEa91schemw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GV1PR10MB9110.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1cc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.12; Wed, 19 Feb
 2025 17:49:54 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%3]) with mapi id 15.20.8466.009; Wed, 19 Feb 2025
 17:49:54 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [meta-oe][PATCH] sassc,libsass: move recipes to oe-core
Thread-Topic: [meta-oe][PATCH] sassc,libsass: move recipes to oe-core
Thread-Index: AQHbgvaA+GxbVXqXY0yAZDhpvGtLjLNO52CA
Date: Wed, 19 Feb 2025 17:49:53 +0000
Message-ID: 
 <AS1PR10MB5697E0050B5C6B7A6857DE18FDC52@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250219174745.3487602-1-peter.marko@siemens.com>
In-Reply-To: <20250219174745.3487602-1-peter.marko@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=30b31f32-cf03-44c9-bbaf-d41e64fc9287;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-02-19T17:49:41Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GV1PR10MB9110:EE_
x-ms-office365-filtering-correlation-id: 793c2246-4041-46fd-0015-08dd510dd106
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|7053199007|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?cof2fEr8YQ9cUhxTz0SWd8Z/qwXqmAeNerCXnK4zlPgpLlUdU7gGZ2WmudRv?=
 =?us-ascii?Q?jfpqucj3o96xesKKWekPQb3TshkHVZcIW0zyMqvOmDL7vBAGd7K/SC2IUhLA?=
 =?us-ascii?Q?Ev69p5yAdaySI0x2wi/ILTWP8d/2HpZvHXGGKYNt2C5Th+oLQwoL71vQ5CYo?=
 =?us-ascii?Q?zQu4vHBkSHiO6FbXdlBMSaXr9+6ymcx+Smo0rMIEO4/t0Xl/Y/myYmFtXOUm?=
 =?us-ascii?Q?FzofZR+2VQbRYkf8UXC6Ovs7tVUbkdyaZMu08r/mnIc4p0kt/0PpcTrrgDf9?=
 =?us-ascii?Q?2TJvaQZlra98a2yETPbtcMiKeGwTtOMrg5f7jdpnEenwvylKdeDdfJZCCdmy?=
 =?us-ascii?Q?T3Zw0sciMLNvWlFlx760KrSX5F0JFiTgNq4BI0o8bUz6+11UOP9JB7TqnNti?=
 =?us-ascii?Q?AyWyulhvEtZp7NcsOrKM9/dA8bxQ6WeaNtm/gFlS6ZKUFzdB4etCowd1mhEP?=
 =?us-ascii?Q?ciRgTvADJpVQKNMgHSm0Wu8cPtLXaex1/WU3c5/Aph/KJke5CZph/JOhI5lt?=
 =?us-ascii?Q?G0G2Qyq0NXlZ47VLCPXfymJCp8JirQvx2B5nsGjH/smfH5BxvtmA3muDhDxS?=
 =?us-ascii?Q?pU3wCt9/EjosXkx8Y24hALk+N0IOX3tyo4RQhRQft6Q8uCfUCHTxr0jUbzqy?=
 =?us-ascii?Q?u0nF2tPAmP6Qovz0nnFAJXlrPXTZmhpILXuNfPKUkkMCsNGukgn4uidB9X8i?=
 =?us-ascii?Q?4o2HEfjiPPLeuavr/rV+EzmipzDPTtIiohT+xNFkuyFIYgc3iDLqbnAVlgxv?=
 =?us-ascii?Q?jpUZonxVwFEQxbveiGwdKqTeH5s6s3PVk70HyjQ+Y89nZ/VAw0vZWyJRiamP?=
 =?us-ascii?Q?7grcR2dSScC3XHSDv2erWphL92YQEUvkZa2Yiru16hecY8WmA61uD+hn0RkC?=
 =?us-ascii?Q?thcJwAQDjT2TMskpX6FhBs3qGhj4Fr6FRONPKpq2GOTFn5KUFt4YCvYVKNbb?=
 =?us-ascii?Q?fiKW5+xQZ/kTMQa8o1p2Kn1hqJF/kSOGKHkb+O4rmsBNMtc9KTOE4Y+t06bK?=
 =?us-ascii?Q?Lkn2yeu36neHA+mpcF3CrPVW+aJFbVbV+A0cYLwP6FYRohKenAVx1Dfboltk?=
 =?us-ascii?Q?/BLahREAS2Xe1FH1kSs79ErEdAm28hcmR1uNR9+ubszL5hRBEVZyYec1qj7Q?=
 =?us-ascii?Q?Y/Kt/nrFxCwguepMAMjPkujIkrqjhGb51pEAW4vk/H6PZQTn/bvvVvAfwFYj?=
 =?us-ascii?Q?uqorGF38w3O12uv6W1vly/JzqkUXzLgJTvq2aMJmJs3jBjuHSpIOiRSriqRO?=
 =?us-ascii?Q?+VxwvR4Ob9jtt9RW0I0VaJaM2CXGWLVKawzOM+k/20sJ2NBSuKV9lB5SGBa+?=
 =?us-ascii?Q?M73tsDWs2uZsTKRgNbpw/wTX5uzlE+3ZUw/KY/c78GwwoO0VAbWvP66vVced?=
 =?us-ascii?Q?OCyqytqfAL6KZhW3GaIyJyV41QRC?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?OcNalCkDDw0MVLdrRi+q1oHjK6kl2sYIV5CzuU1W+pNpbaJMKDZvmhuRPhIb?=
 =?us-ascii?Q?wbrUAGxvFFlqvMkiaGPoVcfY1GtXc11BLQmjMw42uXwNkCawJE6J0XDR5dpC?=
 =?us-ascii?Q?mHKPKs3FlDdm2f9zC/xFWrv+Rz0Ms+ThrsGqA362GQ4DHxiTjnsghkVTmRqY?=
 =?us-ascii?Q?wcn+QcTrV9KcDS50kLd4g0Q43z8dbScqNaA9gPDruVbPc6EMJuBT+vCP1fTT?=
 =?us-ascii?Q?2ADr8Bj53VRvoYhHbsHKQa0EEZEUBQzHfsWp70SjhxJCndP2gnwEQPKS5sn6?=
 =?us-ascii?Q?9gefk4jPDtwB3J+B++z3IgYJ9YWYuE3sci0h1zjhZ8oUWtnIy3LsA+TlLaR0?=
 =?us-ascii?Q?4ZU377mmgHz+WPrPqhiB6iClpXWMvHtA44+IE1bgHhUUeG4shmZPHpOR/zgV?=
 =?us-ascii?Q?KCkjgib+pxCPo88+hLyrSzZWda6gqeFyZQ1fWOfuqmcvjR74SQ9fykyRCJEu?=
 =?us-ascii?Q?zC/9eBjf3imXRUpqkTSm2CKz0TjKohF7LhIVqcV8ETDT7r+IEDK4vVGxZ6Mt?=
 =?us-ascii?Q?qe9eCpy+yz21Yk8psdxODEMbJBkFcYErIsWIaNvxC5bRfMvIkzgmWRlsi8KQ?=
 =?us-ascii?Q?ftGUF3v1SIKoVW5vh0wqSwn7lyJFShNal2c9eo65bgpXMyLjfF0Y649Qbrnt?=
 =?us-ascii?Q?RzxQUQsvRFkndOIo0/MXrKqrLUG3AktigHSMBFtyTuj73iLM1CB0yoZOheYy?=
 =?us-ascii?Q?IgtW+ZZTcfHVlolBLqDzVE+y6Zz2ZBRu/DNMZExGu+4CGW1TTHIMn9Zf+mFw?=
 =?us-ascii?Q?ENfEtNQixeoAbjKHgLuXq4GtWrOJ7rKhoFs0KZRvA9Nb58QYa4hL9l+O7ytc?=
 =?us-ascii?Q?MxPnHkHqVUoJks9h13X+3s4vRiwNfhcI8RP8bxZGMU+B/k0UTmwxYBZy8eHI?=
 =?us-ascii?Q?4cR685XEmJOqsG5Rpfgj0sAcahmY7BpY4hu2McF/dhC8W0aZsbB6Nud/Rsyn?=
 =?us-ascii?Q?3KqbPp1JW1ucIxYSPpPjPrsXmWcyKPsM8021rWq9X+l/WKrrA/dbcC5UW1oG?=
 =?us-ascii?Q?xrqGduVBI62Ni25f0lMPyfsL7LnUhfLSDWnwl5vjaFFTJErZOv0FiNMw1l9o?=
 =?us-ascii?Q?+gHP+JNPhamWZSbdRtGjudEY8rv1/yl9Y2d8ZkaVEtdcTtDK6wlvEgvVKpmR?=
 =?us-ascii?Q?uPpLoQubEvWa2WmsZhxGUlJL7RMITlgs1SrOqxWEM1HuHMip6xz7zb5DUKzA?=
 =?us-ascii?Q?at9TrzhEtpSC02EjTdkm0cP4yui4QOWPtcf7h/gVOuMJaPBez60NJjmXqRG8?=
 =?us-ascii?Q?sV+1PoEe8K4TCXR5eXL9zX8dRQY/JSefY/S7Fx36gwHLLgMfa2KZgBnyJELh?=
 =?us-ascii?Q?2HZaN/kctOCvzC1lCopxyQtg2gOb6uCNhx9RFTbiKwhnHx/U7sHkx4WOZTZo?=
 =?us-ascii?Q?WZjKT3vGnBGA9bAWnQEywUgNZ+0J2LIXETRnpWW0a9KUoI83iRPOFPRBd4IW?=
 =?us-ascii?Q?9W3iKZQj+IVj8ZljoUH6T9qYFF/NAdhWABZE9YmiHEFLV7WDqXD7qfaY1YTS?=
 =?us-ascii?Q?+wb0KgpYV0CsHTYZhtNPQQ5QTTsuIIW23CxV6ArDBwP4Md7Bs9FGuqj2z36O?=
 =?us-ascii?Q?Yty7IabFFhZ73qx2g89UNj+U8ch6ARQepVl2k4m8?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 793c2246-4041-46fd-0015-08dd510dd106
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2025 17:49:53.9680
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VVwZZY13ulVzMeF9U+MgPf0m1ZPXV5GwWZguo32SSpf5YoSrYE/P+EWdWHV1vPLUURdb7o1OBlhI51+J+hQ1bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB9110
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 17:50:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211724

Wrong mailing list, please ignore

> -----Original Message-----
> From: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Sent: Wednesday, February 19, 2025 18:48
> To: openembedded-core@lists.openembedded.org
> Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Subject: [meta-oe][PATCH] sassc,libsass: move recipes to oe-core
>=20
> From: Peter Marko <peter.marko@siemens.com>
>=20
> These recipes are now part of oe-core:
> https://git.openembedded.org/openembedded-
> core/commit/?id=3D0a1d3607da7bb7c586c69cefadf8ade52c7b1987
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta-oe/recipes-support/sass/libsass_git.bb | 14 --------------
>  meta-oe/recipes-support/sass/sassc_git.bb   | 16 ----------------
>  2 files changed, 30 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/sass/libsass_git.bb
>  delete mode 100644 meta-oe/recipes-support/sass/sassc_git.bb
>=20
> diff --git a/meta-oe/recipes-support/sass/libsass_git.bb b/meta-oe/recipe=
s-
> support/sass/libsass_git.bb
> deleted file mode 100644
> index f0824944b9..0000000000
> --- a/meta-oe/recipes-support/sass/libsass_git.bb
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -SUMMARY =3D "C/C++ port of the Sass CSS precompiler"
> -HOMEPAGE =3D "http://sass-lang.com/libsass"
> -LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D8f34396ca205f5e119ee77aae91fa27d"
> -
> -inherit autotools
> -
> -SRC_URI =3D "git://github.com/sass/libsass.git;branch=3Dmaster;protocol=
=3Dhttps"
> -SRCREV =3D "7037f03fabeb2b18b5efa84403f5a6d7a990f460"
> -PV =3D "3.6.6"
> -
> -S =3D "${WORKDIR}/git"
> -
> -BBCLASSEXTEND =3D "native"
> diff --git a/meta-oe/recipes-support/sass/sassc_git.bb b/meta-oe/recipes-
> support/sass/sassc_git.bb
> deleted file mode 100644
> index 94d69642a7..0000000000
> --- a/meta-oe/recipes-support/sass/sassc_git.bb
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -SUMMARY =3D "libsass command line driver "
> -LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D2f8a76980411a3f1f1480b141ce06744"
> -
> -DEPENDS =3D "libsass"
> -
> -inherit autotools pkgconfig
> -
> -SRC_URI =3D "git://github.com/sass/sassc.git;branch=3Dmaster;protocol=3D=
https"
> -SRCREV =3D "66f0ef37e7f0ad3a65d2f481eff09d09408f42d0"
> -S =3D "${WORKDIR}/git"
> -PV =3D "3.6.2"
> -
> -CVE_STATUS[CVE-2022-43357] =3D "cpe-incorrect: this is CVE for libsass, =
not
> sassc wrapper"
> -
> -BBCLASSEXTEND =3D "native"

