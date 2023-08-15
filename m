Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63986C0015E
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 23:11:25 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.148500.1692141076818889421
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 16:11:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=aoVMZ1Gx;
 dkim=pass header.i=@axis365.onmicrosoft.com header.s=selector2-axis365-onmicrosoft-com header.b=RnN8nwZj;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1692141077;
  x=1723677077;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=g0jbyYgzaTzxznmOszacpXygSm8xd2fveJZsDc1K3Wo=;
  b=aoVMZ1Gx7Dr9PLDj5pdbDiSmKUJM9LGlr7mclFRv9fnb863mw+Q3OwOD
   oiq3nLq6AiwAa9TeL4YeLgss6TyG7xz2JKZ9L4p+72uYkjdodlf+MvXpO
   aFBOpxp5OvsP8RysXPC0faV3ZUzUD2SjKQoBYQOoYG9bRT7phUT5yRyJT
   HE/0vyFv7kUONGKSR9TiC76iKNqq1WbzG+rFJ7LmkFbnsBR8TeUZhHcMf
   bA7SzbqAYVc0Zz+aunAzTc6VrT5KxkO76WvyjahVF3vKQPZC1IKw6x0rf
   awkN7OHDP/D4xeykf/2oImD33bqZ4c65M/QJ+b2fS3daUGTDeT5q+tALD
   Q==;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LTtZiv1CcQXG1+9k9aqOIHx6BWH3ueXeqxzyOr6JAJh9x4Eqyef64p91LiT2086cn47gAmAtVi3hw4/B5hc0HCiibqRdDlLf+rfujy6HZnZkCF7BoUo8oH58NWZyFU7s35AnoRwIcx2uae25CE1EH2hz2er9Rb5dV5QexxzoPHV9Odw5MOmzJE4yFBG0QTZsn3stezPYivUSStHHdn9usjVIkl5lBwny21Kb0MQW910K8vOJmT4Z2hzOqIeQfyg4lGvSRWafp3r/zKgEPCQw6TfUGyditazCbHCh/NnJf9q8tb4OF2H8jHgLbLpeWk4KEY6eVzq1ElxOJe2ghNPnUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g0jbyYgzaTzxznmOszacpXygSm8xd2fveJZsDc1K3Wo=;
 b=CBHDhUT8+lyg7mKLhkFNXkklPH9AHSsexm8e+SYmWE7+YViJA6voWqz9F/loRhY7v23/jaURe5g1/1/xoDgfS+vj0XBh92Gsu3EQm6RkOjY5l/C6uj4GDT66bkibKyZHDAxcywncv2UK6y8KJ38KNK1zbjjUThFFemZ1oP0UrsMkPWcd3x0F/yjm6kV8tSIwX6dcUyBXIBiY3GNgrvw2y932zsKTfyjDJLL+9uXmZ+yLYOTbOw3cdu/5LHTsOoMu6ow/Vur34plyIZgi/K38x+DGYPQqrBA/KPVQCleFhqk3HRdmd4E9kU9nDNe4buybHIHTTCt/+hTEVvUIAsNkqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis365.onmicrosoft.com; s=selector2-axis365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g0jbyYgzaTzxznmOszacpXygSm8xd2fveJZsDc1K3Wo=;
 b=RnN8nwZjp3yWUEyKR7eTJ52nWb7vT0WvjC8qNi071PHVyBg2X+FXmbxST1GiZ0d5EJImbHMNm57JeL0CRMHOSPgvD5BHMxasxPGn+Yh2+rn4Eujd0ohAnW+WzfmyePHjO6Axu0ZzOpiFEALZKTbmuAhzsKSSC6Pje6uHkKDycvM=
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Frederic Martinsons <frederic.martinsons@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATHCH V3 2/4] classes-recipe: add cargo_c.bbclass
Thread-Topic: [OE-core] [PATHCH V3 2/4] classes-recipe: add cargo_c.bbclass
Thread-Index: AQHZz44/eFkItZNM6U6WAELBEPOa4q/r+20g
Date: Tue, 15 Aug 2023 23:11:08 +0000
Message-ID: <DB5PR02MB10213E9034981C1D4121CD485EF14A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <cover.1692099121.git.frederic.martinsons@gmail.com>
 <fde568774cf2bd9174d1ecb4d9378a362a254f29.1692099121.git.frederic.martinsons@gmail.com>
In-Reply-To: <fde568774cf2bd9174d1ecb4d9378a362a254f29.1692099121.git.frederic.martinsons@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|GV2PR02MB9592:EE_
x-ms-office365-filtering-correlation-id: 1444cda3-8428-4e75-5d6c-08db9de4e8e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: peEmckaNABaXpzYhnvQfCwgoa2A7L0T36NI5hJg2konqQ3YfRofJb6VSgANhax97FX6gq71xZhtaHjKquAWx2feTQ0f84HkvKnDGF+/rZ4CtIeoBIq1qRxt+DQELOX4pWocjacm6VZuxvwnlq2ZGo3M1hXrDkGOpfJbrUN5SCI5hHtYf0+2TBACccLBPwiFrmZWoyAEOOhCq5f60V39YYQggLVQThddHWQpvOQKLyo/m7n+RXbkEGjpiGAWuGIbE0AXwvQW7mLUiysVoMzVekpKnyzaFO+4ZgBgSNiDpU0qjzReX+H1H7CiqmgD8gRTZVQ/NtpD9KGKeSE+if+tD7aBg5ROkAsiidtiKEhQDiqggFOV0h5LUcCXGpXsKL1PdhIDE2Aq5bcA/CTnCZuHDWK1qawyNb4BaXytvyAsXanRrWIhEqnXcuCUc607rvKV1HEZl5YQzGA3mBYmgnMj2r40qVxBfIo24Pbxi9UTCUQ84sZyPwQpwE1SGl0cqUkJ/buUGugHQTN7jMyCb7gDX/nukAyN8mDiRW+6hn452Qvc6S2csuAiiPf6z/k8bU0OpB1mQnVD8HG7rpAyOVF4TN2XqUJXmmZ/YCCpVdsZnst4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(396003)(136003)(366004)(376002)(186009)(451199024)(1800799009)(38100700002)(86362001)(38070700005)(6506007)(66476007)(41300700001)(122000001)(44832011)(26005)(316002)(52536014)(55016003)(8676002)(66446008)(66556008)(83380400001)(9686003)(7696005)(53546011)(71200400001)(2906002)(478600001)(110136005)(5660300002)(66946007)(33656002)(8936002)(64756008)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BhnnH4FKdRgp8Jer25INApVLDTmCNprS4kOHsANBXBbDQVdmklOO/0oIuyqJ?=
 =?us-ascii?Q?MoVkwa76OXpLuSRI/e/fnn40csVoQbfG5DQlUu/cGr5EVgNJeBNU+hT50Js6?=
 =?us-ascii?Q?pkQyD2ZTpPwbtMF+Jpt47KbEew8E/PQj+hetLxOPprCUmBX0d8qWZCWPkRVO?=
 =?us-ascii?Q?8lqZPUz3qCeJfluCv8bzo7Ut2wrTuNTqFoft65MCPT46pkTmvZhbAHx252ft?=
 =?us-ascii?Q?M8Ek2FxoLFfB0mrXcyIOII14jtX+UYp9gwxr/9aHvp+ibO1siguxEi2fyp/9?=
 =?us-ascii?Q?hkMl7M7VlSlP8jg74uRDw5H5GzFB83gTARAK7xr0zkDk4TwBGejTxbmLkapa?=
 =?us-ascii?Q?EyrWmIPm6NBfq5YlfZeC/CyNbHAsUHeqt+UCRs07DYx4gp+9BNlzU2xTvZjt?=
 =?us-ascii?Q?JPyN64gVnW18KDw6LeQGmKiSYH8NV/cTeNSgG1JDHsLq7E12fH+EMAHaZ0rx?=
 =?us-ascii?Q?xXabl4T1QVXsnRWZ2gZIIvSiMIJ4TKoyCM9VEvjAlgOL+o3e+vS4Gwc3qBWq?=
 =?us-ascii?Q?O0YFkgxth04EWu2+Q4oN+pRQ70YPHG8q8pHCXDMX5UWn47Lai4M2RpH8lbCb?=
 =?us-ascii?Q?Cgti/IxKAfTMr6ezx3duB75HUfXGPTfWe1qhhsGHNLktkKSXcHNnuiBkHz1H?=
 =?us-ascii?Q?5FULgqOH2+z0oyd28c7Hb7zmn2rnQzIe6IPkeY13ez2fr8gRu/DTw2antnPI?=
 =?us-ascii?Q?53yxYSJEBvWgCOddDQUfb/hzOTXtRtBh99+VQyPf6h+2hCJjYsMv36d1CQG1?=
 =?us-ascii?Q?OIBaVy3Cz/otlLnxD59gqv6Xo+aXe1aTqVin+DM7DA3TkyBBjv7ZyJrCMNRo?=
 =?us-ascii?Q?z7jYI8KyFj8DWRDiEq6ayRC+RG4mskA9jDekYSYd7ttZTP1K071wfQtBMqxt?=
 =?us-ascii?Q?wPzuoawkxlfsYL4YPLTSMvVDz1hWehOhCZmMLpsgSmIehZlb4LGNoMdH5nID?=
 =?us-ascii?Q?eT+P3IX397R7wvcFpyNnHDuOaL2nrwOcgv1F7QPjgw2bBNm6saVZCYoErF6V?=
 =?us-ascii?Q?4/Y+48Raso3m+iP7kLpGYvX88JZMiDA7v2itmWPwT+USIdtgV9GDF89nRLK1?=
 =?us-ascii?Q?QMPY9bCl+OzW8rH+l5qTqk7Ah3dwQ9Qco2xwK9CyINI+faTi4b+H1zRsWuZY?=
 =?us-ascii?Q?xzEZtL/u6gnY59eofJoXiAOgGeq2kPOL6rIcJ84WGDkNCigJA3xCDucKMCVy?=
 =?us-ascii?Q?HYLiG9ApfaTgEOkvA2bx5ggmrGbyx+YpTU7RVUhWCtMSGSOLEjZCcKUDsGvA?=
 =?us-ascii?Q?xybMLXu2/h/2/5nWEj6Sf+AlMQHkX+/73hvDgPBsZXXf+dldjD3SslZBx6Es?=
 =?us-ascii?Q?GGNT6CJNVjwSOe2HdOWR/NnmPx2YRPn8tlOyDBdkzxZgEALNxT2kx2YpooOQ?=
 =?us-ascii?Q?q3mIDN8NPH8kIAXUmbbKMOCTnlURT7xLMQCemvDolZ9LOjSg+7JmjZYSHaox?=
 =?us-ascii?Q?UOxg6NP8HyHc/zr7JOWJyUhUnfnXcfa4BE/r+a3g5WkifjPtwrcTrppAbyDA?=
 =?us-ascii?Q?GEl0Bv7VNp9NRU2cKACdP65J4Y9k/j5vkeppYs9uUEesVRN6hNsj3mM1L8kB?=
 =?us-ascii?Q?2s+p93Zu2Xo7+qJ0zA8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1444cda3-8428-4e75-5d6c-08db9de4e8e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2023 23:11:08.7792
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O6od/IAE8DUl6qmZc2FrGMZR5T2Ww2kohTNMekWFAILkFps3lVRS1F7Pk9G/zQfL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR02MB9592
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 23:11:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186104

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Frederic Martinsons
> Sent: den 15 augusti 2023 17:36
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATHCH V3 2/4] classes-recipe: add cargo_c.bbclass
>=20
> From: Frederic Martinsons <frederic.martinsons@gmail.com>
>=20
> This class can be used inside rust recipe to generate
> a rust library that can be called by C/C++ code.
>=20
> The rust recipe which uses this class has to only replace
> "inherit cargo" by "inherit cargo-c".

Typo: cargo-c -> cargo_c

>=20
> Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
> ---
>  meta/classes-recipe/cargo_c.bbclass | 41 +++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 meta/classes-recipe/cargo_c.bbclass
>=20
> diff --git a/meta/classes-recipe/cargo_c.bbclass b/meta/classes-recipe/ca=
rgo_c.bbclass
> new file mode 100644
> index 0000000000..c083f69c08
> --- /dev/null
> +++ b/meta/classes-recipe/cargo_c.bbclass
> @@ -0,0 +1,41 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +##
> +## Purpose:
> +## This class is used by any recipes that want to compile a C ABI compat=
ible
> +## library with header and pkg config file
> +
> +inherit cargo pkgconfig
> +
> +# the binaries we will use
> +CARGO_C_BUILD =3D "cargo-cbuild"
> +CARGO_C_INSTALL =3D "cargo-cinstall"
> +
> +# We need cargo-c to compile for the target
> +BASEDEPENDS:append =3D " cargo-c-native"
> +
> +do_compile[progress] =3D "outof:\s+(\d+)/(\d+)"
> +cargo_c_do_compile() {
> +    oe_cargo_fix_env
> +    export RUSTFLAGS=3D"${RUSTFLAGS}"
> +    bbnote "Using rust targets from ${RUST_TARGET_PATH}"
> +    bbnote "cargo-cbuild =3D $(which ${CARGO_C_BUILD})"
> +    bbnote "${CARGO_C_BUILD} cbuild ${CARGO_BUILD_FLAGS}"
> +    "${CARGO_C_BUILD}" cbuild ${CARGO_BUILD_FLAGS}
> +}
> +
> +cargo_c_do_install() {
> +    oe_cargo_fix_env
> +    export RUSTFLAGS=3D"${RUSTFLAGS}"
> +    bbnote "cargo-cinstall =3D $(which ${CARGO_C_INSTALL})"
> +    "${CARGO_C_INSTALL}" cinstall ${CARGO_BUILD_FLAGS} \
> +        --destdir ${D} \
> +        --prefix /usr \

Shouldn't that be "${prefix}" rather than "/usr"?

> +        --library-type cdylib
> +}
> +
> +EXPORT_FUNCTIONS do_compile do_install
> --
> 2.34.1

//Peter

