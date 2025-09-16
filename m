Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9D30CAC592
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 00:25:49 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.0])
 by mx.groups.io with SMTP id smtpd.web10.7952.1757982343830966055
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 17:25:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=ZR160BTV;
 spf=pass (domain: axis.com, ip: 52.101.84.0, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K3xtmryEWeYFt/D4hZmNVBdccLE598GX7wIxW30iVAvY3ElO0Cwvv2f2DzU8kT7TeN9YklADnPCXtnyJrNPB5GfXkiYt1II+g+ibnPMWP2EpZoxbicl9Pn8Nki7xdCoibn6Wk87fL1uJqrL6lSHxKv/J4DOc9Qfrf7UteQAONeyU+bZXLN2gGIGs3Akuqi+VP6rA+WEAYRTbnNulDZvF0jGz7yFtNJ3iKX5w26iEuQuiqRD1EF8dGxhFRKjTJBgYQWBg1QOqQDiMszwLU8U3jaRy4D2A+7exr/3XW05E+jedLaT4EOa9gE7CKM8VSoBWpdaoW4yteePwKKp+CTcX4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6AxeIqOnT8wiTJAI41eGehWkrEGscy+nH9KV4BCoxzE=;
 b=iBtlfUGb1LVKZ0YRPedTNffhTCffSh/djJo2kCKVMXz2j1HYmTsKwUxlT94oFI2ym3ExCfUrQkU05i6jiNEjQG/YHap2tdpPSeqnDL2IH5WhxEzn9Rn4Hbi/VSPbIKGQoTKdw3lx1eAftu6PiwIaZzPwzx92/GYjjaf8JRb0MmHNNB4d/c2c0a3mvXQNjcWwZMXHqSd6P7FGwitnKz7VO6rklIPa+rx9JCpkvT5YbbehMS/CY14Bg0jPkLaTKvjy6L96Fie75NsVR5SaDT45GWvBUS64TcWMfbedFN8QvApaMk9vlzr+Euyes83KmUsaMR2kq8cxeHkWZqFXIPxOAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6AxeIqOnT8wiTJAI41eGehWkrEGscy+nH9KV4BCoxzE=;
 b=ZR160BTVxOu9j4AP6jpN/0gjS75CjF8CncjGetWj9PG1Hh6/JAx/LW9LsMVSAFemXnItnt55gkk60I3TG7FISD0FrR6XzJQOV6CFH8jXd1NOtAnpv8b/56OGHZ9kVGc68aSAVVOGxm+W9gnf4bzLMLMD9HcKRPuH6WEfv5e6jOg=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by GV1PR02MB8403.eurprd02.prod.outlook.com (2603:10a6:150:5a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 00:25:41 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%7]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 00:25:41 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "hongxu.jia@eng.windriver.com" <hongxu.jia@eng.windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "randy.macleod@windriver.com" <randy.macleod@windriver.com>
Subject: RE: [OE-core] [PATCH 8/8] debug_build.inc: override BUILD_MODE and
 BUILD_DIR for meson.bbclass
Thread-Topic: [OE-core] [PATCH 8/8] debug_build.inc: override BUILD_MODE and
 BUILD_DIR for meson.bbclass
Thread-Index: AQHcJghrq6TNK9g3OkOrzgIPcynbJLSU9MuA
Date: Tue, 16 Sep 2025 00:25:41 +0000
Message-ID: 
 <DB5PR02MB10213AF12B4F1EC0C66F3D78EEF14A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20250915061743.313230-1-hongxu.jia@windriver.com>
 <20250915061743.313230-8-hongxu.jia@windriver.com>
In-Reply-To: <20250915061743.313230-8-hongxu.jia@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|GV1PR02MB8403:EE_
x-ms-office365-filtering-correlation-id: bd20b45f-29c7-46bd-0904-08ddf4b79191
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?SOD/sNfDJEciFNDGBdCANNhQ7MGe8ohJ74k9Rg0mPopE/H9YeRZ9n5dMetW4?=
 =?us-ascii?Q?0vEX4c+TqaD9tSAaOMbYsXxttTYWaZZG5nUfIXJbiHVRudWcbYLc13DR1FM5?=
 =?us-ascii?Q?A3naptoiFwdALbXeWPgpS+30GAMylc8y62G6EgkjLjrU78Em//pmRCRojPqf?=
 =?us-ascii?Q?mOqZ92niD8vHCM+HwDnN3FUVx3Q6KNZ33ykxvgRpihlCQXS4RFcXfbxLUCqP?=
 =?us-ascii?Q?S64wcg5lK2I4gLESFBq77pXP4OhRTgxIbKkdHmxX2gbnBxmUaULrd4wLs+Lq?=
 =?us-ascii?Q?QuRikQ2/FQ4aAyHug5Z1T2DFOkNnEd2mCjtl+VPVDE4BAFG3dsuiPJjiYeQv?=
 =?us-ascii?Q?DYaMjfd7BB8+82N8wzsDTvklNqYg+sGd3u9BzWvefMnhB3Bh2jI3Sx9tJjkA?=
 =?us-ascii?Q?CjNJaQ51Vc/OMKw+ONic3Pq9DpxZLZtyy2p7tgiAO0D2VARWHZhQbeoMjP9Z?=
 =?us-ascii?Q?Ky8UpSaZ+Ye5F7W+bxuRFT+c2ryW71b3JS9yW4g6pxwohX9/Ulb6akcxDZcQ?=
 =?us-ascii?Q?mhfdUqyi4aKtPjGnnT7pqvS8+RB9JkIFyyVx+5m/HTP75CeqzkeIGnOdbLqB?=
 =?us-ascii?Q?Qm8N8OeVGAJXo9IJFCoz3f51Yt7/hqWCVFxfM42n2kCSDqMkTWrsKFOm0+az?=
 =?us-ascii?Q?CgBiD9fyZWP7BqJQwkPNBqc632mkMRsBXbKqOGTxyts7psSrnuprs35CJiil?=
 =?us-ascii?Q?yH0RRpZb1vQOtUJKwNkxzyIFd1vmOdPESuI10vVLAjTZ4TWEJLKRbg6n4VQq?=
 =?us-ascii?Q?O8A46EKfNr4wWXSktZcZmqfhLgMrhoRV1CA4suAnJrbEGUrpKrrGQ6nwNYy8?=
 =?us-ascii?Q?i36yCm4kQWxS+S+tVI33q7KkIye+0Ib9PULQ8jOXIcAsI7cYDMeS7r5gCMmo?=
 =?us-ascii?Q?f5gUXrZkBxDDR/BvfrzkI6aeTfr+MLo4jsHUZBGmV3l7QrrkM/RBzK/Jzcju?=
 =?us-ascii?Q?HJaIoqjzmO2OHzd3BlCNHjSDAfB3WL+BFdRcodsyO4XRKepyTdxmDr4W179z?=
 =?us-ascii?Q?FQRW7//giBzt8cBFzGLsMMybTS03RnENeXIn/IzlQ5JC2vsLHM58iQPtyAxP?=
 =?us-ascii?Q?E7w7DrhTaC0Is/d9bFpSfbJZ4mwW4StiXUGqg06AA1kK/XWMp3xE+0nRQrqg?=
 =?us-ascii?Q?/oC7JLVB+k1+Ma0+UtKaVJbMzbFNq+WKrrlUgNGvyjHtrgbOSux6TVN/bUXp?=
 =?us-ascii?Q?p3okRCn9CqxqsfUIIftLNSQfb0UtoxLgRGebvnRC7mJxsbnZZPDtdYYw9Xy4?=
 =?us-ascii?Q?h3BpE3VkTzRIGcaxdNZoA22yPswxV2Ydcr1Wn9ekCZa2bFcNMEGnPOJTnpAh?=
 =?us-ascii?Q?mFAXaasuMpUDMtSPzgOROVId6epj+G7DZ+kQ6OCMBEBnN22JKSNZK1pox7ym?=
 =?us-ascii?Q?IsmI6P32cxEv0/iRbWd+gKMQ49aaFItbUCOooKPDXW5zSNxhZBQWfu1u/f0e?=
 =?us-ascii?Q?zdG4NomjgnCBL2rmyqsTQMN67Pi9HUXhhw4ovO1Fn4ck5t9pjXpZiA=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Yjao54038kWxbzNnTg56U/xmLvKtX4oDL7UJyUETnJqqOFZLO/6QpC76kVjh?=
 =?us-ascii?Q?JgDlTejZnOJ0wC3nc596aofSYK/AhFmo7oy4gerYfYsVJU91BuQ7jF6DsxmJ?=
 =?us-ascii?Q?6Givz0AWiV4Y4eQ4XlfMq7fBLzpXo4VfIpm1cP9ML2a9YabXBFJsVaYbMFHA?=
 =?us-ascii?Q?hOCIfqbjYR6Es7PKomXdIP8Ds9TO1GLuUaR49wO65l4CF2UhFvUUP1E9mq4E?=
 =?us-ascii?Q?llH+9q99LLAaY2AWSWbvEidT/vkI2ZJGcbWUSooh9eP//0RZvx/r4pz88mOM?=
 =?us-ascii?Q?dq9jn453IhuYzgWecj5/tJ7qvAA6lQHSzExkfBrBL+091Rt9s6PRmqzpTLKv?=
 =?us-ascii?Q?IQnrSMcMljhxzmH81Y5iWjQ+NNJU6/gEiPgQumekMYQuFNBVkUXygX/J1SbE?=
 =?us-ascii?Q?Ng8dS/UN7PPgjQ7Zes5aDrmYXJc3j1vx838MsNCey4TPf4nZdsxoCBKWgBFu?=
 =?us-ascii?Q?iyE3qPELUPkquoGe8oyd31R39kxwVt8tTB3shL9+HgEveioxwLcf+T2m132/?=
 =?us-ascii?Q?IyXWC8VDEE+oylKJ9wGy5usJl7TuAfqWsB0JXWD2ySEZAl7slIEiD38aZ3fz?=
 =?us-ascii?Q?hOG8rQH4iWE9kWnM4hxlKzoJwY0EAs6gKR70E8yWlOYvOW1dL9YfacAIzEqE?=
 =?us-ascii?Q?apoVQQPmtqBI8iqFzzXR+mbT+Ss8mEiiK1o/80jToqsB9u+IyT21zafovVFG?=
 =?us-ascii?Q?hiNpytVMAPCMx3ggRCmQb957SlTlWM1xpFHSXmigygetv+KerB2ZBKjXrYR+?=
 =?us-ascii?Q?xcrAjYaZc5Ao6lpzxFGqJdNY6BceE5KPFPF14RTeSO8jJdKo2iZOLnRaQ8ga?=
 =?us-ascii?Q?a93XsT6powVaxB5axa9DOPfpPMI3msN2S75fzCTEYlItl9Tuqe1gtKwYRkjl?=
 =?us-ascii?Q?fRJHWe0o/2aShcjYYh3rkTNxdDXFC99rKEWg0fLXyuzIQACeUJmjvb2P4lBs?=
 =?us-ascii?Q?JfpoF57Em60toZZIxSPS3aHfGtUxylP0XKbXmiPlsur7MAx0QdA8hq7a/PM7?=
 =?us-ascii?Q?W3Doqkks+3H6ZBIvtAwGWFLKrS7HTCMqCvQyg9HXInUXYZjuqGKoq/Dyqymo?=
 =?us-ascii?Q?2GhTtQHzWpwyAWnbdETK5Sp7IlPLN0YNF9HbNq7/jEV9AcwzkM8vjen+iM7f?=
 =?us-ascii?Q?cD1eaYazerUyY5r4MH+qcG2JEv8o2ywR34eKzAXu1fwuUqGFGg7wkCTAW7HM?=
 =?us-ascii?Q?ksFGs4+dtxvtbHZQXb8MBlItItQOC0UEyP3IxRr4Cf8dsqpVre7jxcD5wwW9?=
 =?us-ascii?Q?5rTQ6a/ngZx5QuqLPbdkI6cTKflXR+Uxlu1Tl2m+uqdEKX79TCf8+tByNdGQ?=
 =?us-ascii?Q?GNA1S8hHKnmB0y1G+AAy0VHlKHO2bpJM8zcgC0NTuVEQ1pqV1aI0iNHNRFz6?=
 =?us-ascii?Q?L1TQbEyjOoJqECctCr3YOTJaZDrvVdffsxrRAX1BoGnLt105BpSuWEnotckI?=
 =?us-ascii?Q?NmSWOPPgaKUJaHnbHs0VrM6gzoWKT7hmh/x96wjrIs25Pz3wFWnz4iAfU+ZE?=
 =?us-ascii?Q?o+qv9nOu1oXk7JtKKAUuDXaWyiR0TcyevQ+8J+xWztdn2dicn8RMXzEBeQ?=
 =?us-ascii?Q?=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd20b45f-29c7-46bd-0904-08ddf4b79191
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2025 00:25:41.4723
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hqCpSZ1/ONAn+QqszIAt0iH5aPQ3q0oURi9Tngl1Lsnx98uaBop0C1gEG4j3TrSm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB8403
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 00:25:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223513

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of hongxu via lists.openembedded.org
> Sent: den 15 september 2025 08:17
> To: openembedded-core@lists.openembedded.org
> Cc: randy.macleod@windriver.com; Peter Kjellerstedt <peter.kjellerstedt@a=
xis.com>
> Subject: [OE-core] [PATCH 8/8] debug_build.inc: override BUILD_MODE and B=
UILD_DIR for meson.bbclass

Correct "meson.bbclass" to "cargo.bbclass".

>=20
> The debug_build.inc is used to collect debug build configuration,
> override BUILD_MODE and BUILD_DIR for cargo.bbclass when DEBUG_BUILD is
> enabled
>=20
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/classes-recipe/cargo.bbclass        | 4 ++--
>  meta/conf/distro/include/debug_build.inc | 4 ++++
>  2 files changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes-recipe/cargo.bbclass b/meta/classes-recipe/carg=
o.bbclass
> index 2dd28e95d33..c90b8c18f0d 100644
> --- a/meta/classes-recipe/cargo.bbclass
> +++ b/meta/classes-recipe/cargo.bbclass
> @@ -31,7 +31,7 @@ B =3D "${WORKDIR}/build"
>  export RUST_BACKTRACE =3D "1"
>=20
>  RUSTFLAGS ??=3D ""
> -BUILD_MODE =3D "${@['--release', ''][d.getVar('DEBUG_BUILD') =3D=3D '1']=
}"
> +BUILD_MODE ??=3D "--release"
>  # --frozen flag will prevent network access (which is required since onl=
y
>  # the do_fetch step is authorized to access network)
>  # and will require an up to date Cargo.lock file.
> @@ -41,7 +41,7 @@ CARGO_BUILD_FLAGS =3D "-v --frozen --target ${RUST_HOST=
_SYS} ${BUILD_MODE} --manif
>=20
>  # This is based on the content of CARGO_BUILD_FLAGS and generally will n=
eed to
>  # change if CARGO_BUILD_FLAGS changes.
> -BUILD_DIR =3D "${@['release', 'debug'][d.getVar('DEBUG_BUILD') =3D=3D '1=
']}"
> +BUILD_DIR ??=3D "release"
>  CARGO_TARGET_SUBDIR =3D "${RUST_HOST_SYS}/${BUILD_DIR}"
>  oe_cargo_build () {
>  	export RUSTFLAGS=3D"${RUSTFLAGS}"
> diff --git a/meta/conf/distro/include/debug_build.inc b/meta/conf/distro/=
include/debug_build.inc
> index e446a71dd3f..e6f94504945 100644
> --- a/meta/conf/distro/include/debug_build.inc
> +++ b/meta/conf/distro/include/debug_build.inc
> @@ -51,5 +51,9 @@ INHIBIT_SYSROOT_STRIP:class-native ?=3D "1"
>  # For meson.bbclass
>  MESON_BUILDTYPE ?=3D "debug"
>=20
> +# For cargo.bbclass
> +BUILD_MODE ?=3D ""
> +BUILD_DIR ?=3D "debug"
> +
>  # Allow other layers to add their own debug build configurations
>  include_all conf/include/debug_build.inc
> --
> 2.34.1

//Peter


