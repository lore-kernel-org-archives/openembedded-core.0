Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CF56CAC5AC
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 18:34:02 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.56])
 by mx.groups.io with SMTP id smtpd.web11.5133.1758652437019247035
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 11:33:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=AZ0bIQJb;
 spf=pass (domain: axis.com, ip: 52.101.65.56, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QT4OVdtBBN9dDaM1E5q7ismQwfVAeeDZoiNJKKJRbHgqelWacNsbrtesw9uM4C7ZVub48oM0PW34I4gBiTR2t2ESt36In3kBYcnXbLh3WZeN0fTH8SjRXCTQyja1Ks4D1a4HHiWlu/Y1WFM5XwxDoP1h3pWEq8D+R4CkrRl87G2i/3o/bWzLrbLZtxn16xtpDJuuyILkhF0r50IB7YKogTw7CQaln2ybimpyPUCVvhEYHe2TaKS63d0KgPI5Vbr1a11ILcS7QZ/WjTiT4DTmQhLopfZGqW55CUSN1/Bjkr6EUpkD072j2caXGfrAHFizV36dwmbnT0/nMROEZHJG+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6c/zlcvcb2ZU6TwuKlJt0MnMp54hCZJW4vcuZjR8FQ=;
 b=x6RLuKsksq/9JNkE3I6kZ3iP5G5dvOEp2P4XkDCa3vnWz2ynLpEgU52V2W677DTRDMaWf/HPnwlEqtIS8WYN/6qdG4lwHSIiApgj872hnAyHc2H3HlBDUSZHLA2HwB3CCWr6aHIzQrdIr994uan5Dai/57mn2UGfpsKoA5ZZMULSyL/e46GjQxPZblRzZUr/l7UgoMXd6CecigNExOK8YyMDet306XBQFZMyBpnGMaSWsOQjUnobFsEUmFNVjLg15z3Yzt3NxuScHuhRfpH2jXeU24JMyZKEH5mKGgmc4UggixXXdDamd8hR/FWIGxfTnYSe65l95/z5p4DJIR8aBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6c/zlcvcb2ZU6TwuKlJt0MnMp54hCZJW4vcuZjR8FQ=;
 b=AZ0bIQJbTkTOlUScD9HW7G+sQ1p/69RorCnKSuFqP4pCbNF0Kt6WolYNnvz2HFNDCBA+2keuaXzH0e1XgzjDMjGcTBSq5VeryoAOu0s7TomcBXApDS99J/r1vFPuKaC3gUO8miG+/eakhJ8zmYe1Emj2gT01IB5HVgcwFrfP5AM=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AM7PR02MB6097.eurprd02.prod.outlook.com (2603:10a6:20b:1a5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 18:33:53 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%7]) with mapi id 15.20.9160.008; Tue, 23 Sep 2025
 18:33:53 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "peter.marko@siemens.com" <peter.marko@siemens.com>, Steve Sakoman
	<steve@sakoman.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][walnascar][PATCH] sqlite3: patch CVE-2025-6965
Thread-Topic: [OE-core][walnascar][PATCH] sqlite3: patch CVE-2025-6965
Thread-Index: AQHcBV6+ejSPKa/IPU+3ee2SfhwvI7ShZMFw
Date: Tue, 23 Sep 2025 18:33:53 +0000
Message-ID: 
 <DB5PR02MB102136F23FE32048C946C6102EF1DA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20250804164100.9355-1-peter.marko@siemens.com>
In-Reply-To: <20250804164100.9355-1-peter.marko@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AM7PR02MB6097:EE_
x-ms-office365-filtering-correlation-id: 190e8292-0610-4885-7c00-08ddfacfbfb2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?XBk6DoEsjvFAM5H0PRpAMc3TvEMRUC/mV3jRGana3qU5jzPKGwZ6nzQFCdXB?=
 =?us-ascii?Q?fgoq9ap6pN6bopO40sJcCypH7I1a17b2gH66XZ6jGYP4Nz0zhvoaeJDI7cCI?=
 =?us-ascii?Q?5JZzdU5mdW5YviMtROTjH1/2rgqUTuE70P77nj+3Dvvz8Mz2FUDeaaimXhWH?=
 =?us-ascii?Q?8F4xCUwpVOaR5AZL4iKE9bT8QohW0KaiBej5psw40jEnA+lG5pjkEIVcnySo?=
 =?us-ascii?Q?uLB9NgoARxtrrI1iqvB2FegWTlya3KmaeEg0Kk10lps3stic3R1JzE3qzMEp?=
 =?us-ascii?Q?uO9UweI8YJq5M2t/el5Szu3ROq1JOHChFseqLxMl6U9zz5VI4gLNJUPpxmGI?=
 =?us-ascii?Q?aChcOm5vmLkuDVkMrfhn1G+AOY/6uHa2cAoYlbvMGIsQL0RFht0PRDPgq+e7?=
 =?us-ascii?Q?wMuHHDMbeGx1ixpgX09hMTLaKp80r7ThyBpe8Goq00WoqgCyLV7Freewd/nP?=
 =?us-ascii?Q?IvintP68T0vcCW1ZDTwSvRWMvi+TAXLr/JYKTlMIXBsSib8c4hA83OQb+0Gb?=
 =?us-ascii?Q?MctJ6ySdutsXRjThf2mZ0v+hOA7J2xYWY0jU7OLP+XRhzIpmQAIKbL8b3A/j?=
 =?us-ascii?Q?WBlaTAXCWnnA00KNnAGWZbKuMbZHG9LCziQtWLRrMi2RcLvGq0RW7R9DiFQO?=
 =?us-ascii?Q?dEunvSYWAfgyfIU0cQn/Q9jekNzjNsJI0XAdfoyUMokZ3zAUrNwa5wEinr97?=
 =?us-ascii?Q?9s60MXOpUYd67FUSxFnGzujhl/7HIG4WYHaEB8UNhlpHKG/YKlnkZ78XHNql?=
 =?us-ascii?Q?aVSaej2KzxQZbCKpNlP9wAkYNWpgIp7l1VybdIRiVmbJyQmRKAwzOEitpRfU?=
 =?us-ascii?Q?tRJWp6XnCRAogENyHXPXhit/91fo+z9EKQYfYAP+c2s+7kont/qkl+MaTmMl?=
 =?us-ascii?Q?CgtPa5JpS50fXzi5BhjR3TtB52ykwY6uVMU3TKbNBpwFKeW5GWjCzJkWEyUr?=
 =?us-ascii?Q?VBPEazd1Bhr1dADyvcOdhqNRocXNkiJxwKb9lsQrALCA2Ts0gP0BUUKGGPQf?=
 =?us-ascii?Q?gq1WRSIpXheJ6SQbYBDoLO2B2+SRkfRs8Q7wOwuToD/TEAp1oXOVLY3TF7hD?=
 =?us-ascii?Q?Typ34ZA0O7wDOsiBT9rJAFlNrRf6+MjsHcUT8zzAjsIfI1Z2fVyl8F0MDelZ?=
 =?us-ascii?Q?6F0NH2cnIkBiVrhSttq/CrgELQKHy4DmkZSRsfJiCrah8o5hmi2VBoD6jNLr?=
 =?us-ascii?Q?3UuvOmS8gY3HgQ0DKT6cjP40VkLIkmiEg8MIhpbLkeROTa1Z/8eQEE5FIqe0?=
 =?us-ascii?Q?612iBp3k+eXynyki/R8fGGEWzoro11RHt0AICSOGqMR3hGyD45rJnsaV1G8J?=
 =?us-ascii?Q?c1Sjgf45SK+Uk3ulPVL5y7H1QlJotYEH3OINp0JoIV4a0MI68nBc/5VXnpnp?=
 =?us-ascii?Q?EFKBnQnJvVBzE7ywOqN1MKM1McbQh9JKF44OzeAnV8lRrUTeY0rcMW7c7xgo?=
 =?us-ascii?Q?9WiknxgN368=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?vtWeBqRc+HGXpFCu+CBbZzfDTBW8yfYr0OZJolNMQGrjWciVw1njfF4jKCwx?=
 =?us-ascii?Q?Poe9vXR6QwQxMUo5pudw65gcsaTTy6Uo7axppWnmvwc+YaHfX8yRyWAW/05C?=
 =?us-ascii?Q?B74X1kq3ZxGim5bHKqx0zebo519hCYFWwEWtP6bisXLurCnyKP+XjbSE3gJn?=
 =?us-ascii?Q?FqyzLlLk9AnxrWNmPtocMnXc8rdZScWZpkD2K2E2RewjgxuO8gTiXwKsUbL+?=
 =?us-ascii?Q?vef0Grk22X8BOdoCqIFZ061HtRMMhuoRy8cCf80HdBk6b7n6dnD1D5EGzhZ5?=
 =?us-ascii?Q?7Go2nrnCvBwr8HDBWW3IpcuiXDIAgDseRlTWld7IYeRHmvqNCcKnappz6vv7?=
 =?us-ascii?Q?Swh6DyuSyV8T/D4ygBZfT7gGep9xJYVNXhMxSWRiBUPuS9Jfh1KQxz6NgNaq?=
 =?us-ascii?Q?0zgMlaKOMjWhM2GA4eKzOuFMxIDQNyak9Z+Av3LtHfZBO34vucD8uqDiqDXb?=
 =?us-ascii?Q?kCBwz3/Dx5eXypsn63qDdXgzl88gqiyevWjb0SiyXPv3u2C5bon8E43ckS6m?=
 =?us-ascii?Q?JdrTfVy6Tce4bz6tlCqEdMRPHzUXSeQ0/y3cGxLUmHkGWieJ6p/C0j+b+tQ0?=
 =?us-ascii?Q?qQ5/sMoBZ8Au7h7mS8jifvS3+orsIvH4sEXQ/lu7Tx7FxIwIrMlS2NdRR2H8?=
 =?us-ascii?Q?JB4dQaf6qDC5mkwJU22dM/6n+vYHrzZEnJQihtW6pzKwydXVTm0qcs0mcPQY?=
 =?us-ascii?Q?ksWBOmJKEoW3MBVMJLSMX1NrShRvDF08IxpuXuXOz9KmNagerAay0X7kGzmP?=
 =?us-ascii?Q?HOWoR4J/lyd/v+PmV6lyp1b11ms4W2cy2LwI2EAOyFER/wdqEQa0p074ahia?=
 =?us-ascii?Q?/6/8NC7GTSx18xwXpxfMdEFUfSc5qM+M790PDZiJ521N9bbisjWd/J1eXdA8?=
 =?us-ascii?Q?MYFwkMOIeuJUJqhbsKeF35/fFfjJL/jV9/6FcJdMXt1XfMFhIXkvVrWOSeRD?=
 =?us-ascii?Q?EPFXoDnDZPTz7W5mz4n/iC6iZ3ryUOVCBlJQwoFHIIDTO6QE6l+nCk8wrZ9o?=
 =?us-ascii?Q?BxCwBZ7x6Bbm50LuIHpr+sW0YY0XbKSRvKlCsewDtkgdwVGDiiWIwytJ2zd0?=
 =?us-ascii?Q?ogcC+BfGLD2zk3agrzsWtxa9L4IjUJWI+0ObWYJnEkZyEbmonCfi08+Pz8BU?=
 =?us-ascii?Q?cE9Xu+Ky6NilVGtywe6vFdXipiWOb7LG1O9bIaibMoAU2Ho/YtmtFdB8PvQM?=
 =?us-ascii?Q?oIR9qp/iv63WwvI//gQXFiFDPRP+oNeQqZZaAAmQv9LEIupTCU1TWGwzF4Zj?=
 =?us-ascii?Q?lhd42kkX4B8dW4V0WJiOHDhE0zIXl84q8VWyJmVrTWDNzFi3/5+K/QMhx5mP?=
 =?us-ascii?Q?cibgoveZ1TucP4nFV1cvmzoptBd+PXx5PDdYquD9Gs8kvjQuMf+LeMZcdCd8?=
 =?us-ascii?Q?2ErKaYNYVv+KJr2ZOxrKPZC9krqZIWPE1DI3GNMQrlyiZ7Q8pTyt6tWZ4AW4?=
 =?us-ascii?Q?iajcyy9Q7tBuQRTtKhtoYIDGfk5kqxFxO1PAy+0LicJsX5w9u1b4naNl6y91?=
 =?us-ascii?Q?2y0AheNTL/Avt3niO9RsY4HlyyQbFGEOsiwGsmEr1DXQEaMDiUoc4gWl8Q?=
 =?us-ascii?Q?=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 190e8292-0610-4885-7c00-08ddfacfbfb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2025 18:33:53.7405
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F2vCQkq+iFVJ/U0IS0K8f+m4otSkalFgzDLn6XpVWrvqKtPLezjG9qhYPexebGlz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB6097
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 18:34:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223909

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Peter Marko via lists.openembedded.org
> Sent: den 4 augusti 2025 18:41
> To: openembedded-core@lists.openembedded.org
> Cc: Peter Marko <peter.marko@siemens.com>
> Subject: [OE-core][walnascar][PATCH] sqlite3: patch CVE-2025-6965
>=20
> From: Peter Marko <peter.marko@siemens.com>
>=20
> Pick patch [1] mentioned in NVD report [2] from github mirror [3].
>=20
> [1] https://www.sqlite.org/src/info/5508b56fd24016c13981ec280ecdd833007c9=
d8dd595edb295b984c2b487b5c8
> [2] https://nvd.nist.gov/vuln/detail/CVE-2025-6965
> [3] https://github.com/sqlite/sqlite/commit/c52e9d97d485a3eb168e3f8f3674a=
7bc4b419703
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  .../sqlite/sqlite3/CVE-2025-6965.patch        | 112 ++++++++++++++++++
>  meta/recipes-support/sqlite/sqlite3_3.48.0.bb |   1 +
>  2 files changed, 113 insertions(+)
>  create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2025-6965.pat=
ch
>=20

[cut]

> diff --git a/meta/recipes-support/sqlite/sqlite3_3.48.0.bb b/meta/recipes=
-
> support/sqlite/sqlite3_3.48.0.bb
> index 11f103dddc..6c9f1ed5d9 100644
> --- a/meta/recipes-support/sqlite/sqlite3_3.48.0.bb
> +++ b/meta/recipes-support/sqlite/sqlite3_3.48.0.bb
> @@ -6,6 +6,7 @@ LIC_FILES_CHKSUM =3D
> "file://sqlite3.h;endline=3D11;md5=3D786d3dc581eff03f4fd9e4a77ed0
>  SRC_URI =3D "http://www.sqlite.org/2025/sqlite-autoconf-${SQLITE_PV}.tar=
.gz \
>      file://CVE-2025-3277.patch \
>      file://CVE-2025-29088.patch \
> +    file://CVE-2025-6965.patch \
>  "
>  SRC_URI[sha256sum] =3D "ac992f7fca3989de7ed1fe99c16363f848794c8c32a158da=
fd4eb927a2e02fd5"
>=20

Why aren't these three patches on master? It still uses the same version=20
of sqlite3 as Walnascar so they should be needed on master as well.

//Peter


