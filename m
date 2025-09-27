Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32848CAC5B9
	for <webhook@archiver.kernel.org>; Sat, 27 Sep 2025 06:27:36 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.14])
 by mx.groups.io with SMTP id smtpd.web11.6839.1758954448162026880
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Sep 2025 23:27:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=LV/cJtk6;
 spf=pass (domain: axis.com, ip: 52.101.69.14, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AX9fsNJQxOUC/kOPRNwei9snl1NRUNtXBojULzNw8gwV4nXRkrcmdeCjomF0CziHhnnJrkERf9yMHxCiIcn42p44x/20ZTQR2JTkUdz0tE3Wk2rWJnJc07bug9z4mLB8rXJOwQ22WxIwWvxzWuE+zKTQAGEPbYiLQCFMltz7cGI9oXPEkzuOpqSe91zuZ0furu09AOJMpxAs7X4TiqcCzoa7vMCZakTa0gxjC6PavODRUSIqvykv6A9Eor5ZBEvzoIr/NCRBUGo0EYe7cLplBvyd/O2XJlzXOeTjeT6bRP8JVwYDc9IMDoL4pzPXkmNPYxwee6kSB0Q35SuCl1ryfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uiFUe0txC2MAdcur+ZKrBF+GWqhXGftMWcAto8ZZ7ng=;
 b=tFus8x/wE/ZeQJwt1AEBlG5eT6tH5cG3t2AlRpjgkk5Kv6cVG/CjUU/DxhtGh9u/3HEgVCn6Tmt6CGiySnWPc8OtH5+93ik/Uk+l7V/vC0yYjBmAvaOKZE2B0QJMLOEUBSo9ZGRdz2Z0/H3sQZNv/Ddi812KgoKP73W6i4bZ59klagodr/pwlCvR7eDfWwmFqwuLHx2jvwEFvAsNixZzEy0vRyONHi1TXvEE9nE22WCWn5xGObvC+fuFnVbPiuxP4Bc/gwowkVI8RpjKzGikYLu6sN8wxpqtVp9Gfj+PJ9tQQb/YhOzOapcpLocESsP7yn51ZSUDWPxxpgzkZ7WMZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uiFUe0txC2MAdcur+ZKrBF+GWqhXGftMWcAto8ZZ7ng=;
 b=LV/cJtk6NEsrlwqC61El/+WeoTg98INX5NTrh3DA7ZEE5d4byFTuyQq8tp6VrkhL37qOZsmU2crC9P6/3p/5pDqzH8OofFLbB9gdYwzt+prEFqDcTnep8N/VFHn7w+HxIVWROKVMU0A0cTxAUINhSZMv+ZfJBKy7hOjUC0b1Fcg=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DB9PR02MB7129.eurprd02.prod.outlook.com (2603:10a6:10:1fe::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.11; Sat, 27 Sep
 2025 06:27:25 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%7]) with mapi id 15.20.9160.014; Sat, 27 Sep 2025
 06:27:24 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] gn: Add recipe
Thread-Topic: [OE-core] [PATCH] gn: Add recipe
Thread-Index: AQHcL3KA0CKJ3VqxU0Kk1+OMV7+po7SmjvXw
Date: Sat, 27 Sep 2025 06:27:24 +0000
Message-ID: 
 <DB5PR02MB10213CF539A71A72A1AFA39AFEF19A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20250927054916.363249-1-raj.khem@gmail.com>
In-Reply-To: <20250927054916.363249-1-raj.khem@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DB9PR02MB7129:EE_
x-ms-office365-filtering-correlation-id: f228a624-6925-4faf-b3d1-08ddfd8eec58
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?eqIa71Bi42AV/atfVyRTmXl+IHt3dnbSLeWQR3mIhGzfCAlqZajeKKqyDtks?=
 =?us-ascii?Q?s/vgzAWaaZuTeJKK6VJLn8ZDqT58V+Q05ZNTj6bFTchbN2GFGAbywznJpjgY?=
 =?us-ascii?Q?DL2gPMM2tBJi8NQ9apkDgRK7/Nwxs9QordaJSQOnUfyYALmw0PDwA59K5Uie?=
 =?us-ascii?Q?Jxig5R9tk7lK2VC08xYy8saKYqaTNtmiAYsZaWLUtg7o129FZq1TgPPBJjf0?=
 =?us-ascii?Q?E9/MbJ6YfImrRC0rWCfafLv3WpKvKdQKktYE77ILNvzMFlrP8+E5mIS6rFLE?=
 =?us-ascii?Q?GzObCn3J5nWY4p9xRnD8yQalBMzqJd3l/C8xVgzHyHm4NQnRQgr5p5VaT1dr?=
 =?us-ascii?Q?33KGZw38MvAjEudpHbqiG7ILrzl5NPL8NTQ0mFQ6wWViS0Za5z0681574nV1?=
 =?us-ascii?Q?cxUA68YkHNUGJ/R7321xl7+moqy8OLhmCvj5y95h/rcGDUdO5kiDI8gIrlbp?=
 =?us-ascii?Q?wtyWeuz0Ta9ByCkE+VNnHseW5ANT0AHPlardo5XvUryGfUbWhSftm7V/qx0u?=
 =?us-ascii?Q?11vylNDrcay7nv72p/3wJhI76c6MzjXyFH4F0C9H+QCyOZkaA8X4/WfaKm34?=
 =?us-ascii?Q?89cll4MiEez6XRtLOaLz7BQTONOTMBVrQZDt9o/J5GgfOduS0i30Y5tMwS7e?=
 =?us-ascii?Q?eoestumhqz9w7UtP21oLuAoUhHCoald9eaqpjb6C9tQ6o26zL++OiMNYBLjR?=
 =?us-ascii?Q?pEC7hX2TC741HJ+3jaoPJro2TMPzl7MJTPIjbnAssxUZKVorjd6ne9BqEutF?=
 =?us-ascii?Q?/c/vRqD53T+K0MtOvZ1qcy+qb4YJZjEpTI0+A3BLPIYbRvEtZulJYhNIOGaT?=
 =?us-ascii?Q?NoMBDo1IT5RBtIZRipaVfMsEMqYqqO29AjCGnfq+xQ1j9Ag6MdEGYbfO/ePb?=
 =?us-ascii?Q?e0o/5MoGuR+hRQNH5T6jgvMdkGchmyDT+HK/Gv0c1fr6v7BhSr0dbnoaRYoE?=
 =?us-ascii?Q?7b8LqX/hI5eRj0UYycuCGGUqdyhvjFuDeY4+UDDABakRsHG33coVQCVVc5kH?=
 =?us-ascii?Q?WOfjn5CGJF1WQykxaAJctw+loqOsKBgbAmYrTxMKJsaGbxOLYEKIjjotjwmT?=
 =?us-ascii?Q?X5bM4Dkz+1PJ0MGwqYotZYEzV6CExus77Pr8+HE3SX8c6364qRFvoLJz/rSt?=
 =?us-ascii?Q?E3MCVn4OUBhOPXzp6Ckxs/EVFIsdAQaJcV8Z2DUb6cXxTky6mqqtao5Tta1O?=
 =?us-ascii?Q?PuXEkR3q9M7fwekkekH7K1CF0/d7NSGUWoUuQLVmmK/SLYY6Ts7F4c9ixfhc?=
 =?us-ascii?Q?5aWm4PK0+tDvJax2b/8YoMWr3pPTWQFJSNvtquZYEcsKVyhLvP3QYbecixLm?=
 =?us-ascii?Q?OJo9RDGxPwvcng9mn6OLNBv6JDjkS1U11KSyxhYVOa2jX7DqazYEWHOOOCoT?=
 =?us-ascii?Q?aAD7CYdikrHHYNxhSUtH4eCzrziivumpt4bFMh4EjV29qwACZQumKMEhFJ84?=
 =?us-ascii?Q?hCj0STf4FtF56GprsYBwu8/bn9BgDM3bLlv1EyXGyey238CT1b8Ds+D7HICS?=
 =?us-ascii?Q?/rjPulVv7VESLhkaTzJBuJitM7b7ll/jOS+f?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?ohVbT8RBl0u0ywwP/pwiSmN9C0uNE2kJBzNCoMIJ2FqQbq5GXkiCmSOWK+qy?=
 =?us-ascii?Q?VHwI8Ebg7Z49Xlm1oNsivywp42sQG/EEZZi2XJEqAbS6qR0OGKcW6xinNVxe?=
 =?us-ascii?Q?O+6G/hVG97NKCAtpAHTaYgQACyEPQsTiPMvS0jG0OVRP7JfxBXFF7ZiGBz40?=
 =?us-ascii?Q?Txy7GbqY2cemtfFNIWds8fsCY0KJmjaAZMjADf2ZpWn38S0pc3M7TlP0ADSR?=
 =?us-ascii?Q?w46ZIdyrjI7bFQeZAKO4XBztXcT3ABKR4bjYbg0f3Yz3uAqLHMcFKF/XoSC5?=
 =?us-ascii?Q?tR9v3WwyddqJfeJFJSM7UxugGYFz34wSvEwYTpkLEjp/Kiuk3GQPe3PoV69S?=
 =?us-ascii?Q?Zvi7yHqV37z99qfld/9vChSOqFaT6kMb5Evuh7Ogu/P2zMGcezXQcH9REVJ4?=
 =?us-ascii?Q?SRpSm9KasyYvo3yuy3+7JvwStCT3bkp66PtOZUzK9ouhwn11a8I93goVnrkM?=
 =?us-ascii?Q?GlUs6hpsAgaJ21bvqa211/5E9+OiW84JnYbTTAy3awUY/07hnIokQomISVGU?=
 =?us-ascii?Q?xs+jM3FB3+LXx5UR/MkG6saI8XwtUctX0w9WyVNYkRk1nEwxnRidPN6dIxpg?=
 =?us-ascii?Q?LFsL4tztyv+tYiTTM+RDWEPwSTRUvk3fTUgtPkdXMDH8S6OH1YFsxnwEoKrd?=
 =?us-ascii?Q?tntzQy3iwDPBtYklPe1oqDKMBwDpzgdLkvdw3OdPMqWvCQ5JNPGR3bnzhMJo?=
 =?us-ascii?Q?rhmXBJ8sIrIxT4Oyy5x8JlQWA481H4+ujBOxxHjLDYEIkvMfT7/xlp0gt+4V?=
 =?us-ascii?Q?FvGuxAP3e8fseQ0vfj6PibbWr1hHNpzSDLWGiNkTMVPxWct6oV+5gaMRKYSt?=
 =?us-ascii?Q?32YoJrqiPMNUzW+km+nLU1RsToEStTL13n3deUsuf1nFV/iA6ZUppi8ymQX9?=
 =?us-ascii?Q?WJygbt940WymipTxl3yt7zHF+iMhBBgBKwdyXXSRxQV8u+aY/MoiEn5XrtSa?=
 =?us-ascii?Q?q3w+tstPQo8PA91HPUg1lo5Wvi74OykGPhLT/ghmeoDUAn3Td6yWPaIeYzBL?=
 =?us-ascii?Q?IvPQUUXy+poJYHimZ4e1czOEnM8DIlf/uYTyBpt9B8Zq2fZS9aPLPDwQ0mbr?=
 =?us-ascii?Q?/F9uW7HHzbFB4fBYBXbkbLT5+UCXP4EmlwQi1JVMUvlusjbzgh/P/PFDpeZl?=
 =?us-ascii?Q?tZG/xKnAtLH6ugJIgUVzvaFoF/5VFgjZCU2OWtKQ3GbVv8UY5/S9cFn8lijc?=
 =?us-ascii?Q?8pJbnfuUG7VgZ1dvsjRM0S7FJL7GDPSVTY4zCiTdgXX5r+ILHpA7bs51tgIS?=
 =?us-ascii?Q?Ugg0Zm3sWb99tN2EIK+cuZ/ZYNqStMndmTH+36/EzRuynyta0XGIpp3JFxwH?=
 =?us-ascii?Q?HPovKDuOmavTsvTktvDO/PNNKw29JSuuT+Q+/LEpH6pRAHFDPbadUF9VSuXu?=
 =?us-ascii?Q?D54yRiEeCUP1rpFcggItACwrz6/j4egjycu2SDX7DwZXaJMMQuZ80tYhF0IF?=
 =?us-ascii?Q?BldAht5qx6PUhOlGUw7xWIhO9+Lqehop6X0mwZYDv9xPqWnqEvBIHpEuGC6U?=
 =?us-ascii?Q?SLJFDi30dRUQsY3CysqrcswM7I7g8thNcmHF3KPHdnBbv6PgxCvLTHYr2Q?=
 =?us-ascii?Q?=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f228a624-6925-4faf-b3d1-08ddfd8eec58
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2025 06:27:24.8739
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CzK+tqRK5gAP1AudwKdba/NDE86JO6tvA/qbiQAjuQXYldsMZCs19OVPeIVaao5I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB7129
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Sep 2025 06:27:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224094

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Khem Raj via lists.openembedded.org
> Sent: den 27 september 2025 07:49
> To: openembedded-core@lists.openembedded.org
> Cc: Khem Raj <raj.khem@gmail.com>
> Subject: [OE-core] [PATCH] gn: Add recipe
>=20
> gn is a commonly used build tool to generate ninja files, used
> in a lot of recipes e.g. chromium, qtwebengine, perfetto, hafnium etc.
> these recipes come from different layers e.g. meta-qt6/meta-arm/meta-oe
>=20
> since not all layers depend on meta-oe ( meta-arm does not ), its not
> a possible option.
>=20
> Given the usecases, putting it in core will benefit the ecosystem
> and reduce some duplication. This recipe is taken from meta-arm
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/conf/distro/include/maintainers.inc |  1 +
>  meta/recipes-devtools/gn/gn_git.bb       | 46 ++++++++++++++++++++++++
>  2 files changed, 47 insertions(+)
>  create mode 100644 meta/recipes-devtools/gn/gn_git.bb
>=20
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
> index 0988bf50a72..85a9914469b 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -224,6 +224,7 @@ RECIPE_MAINTAINER:pn-glibc-scripts =3D "Khem Raj <raj=
.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-glibc-testsuite =3D "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-gmp =3D "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-glslang =3D "Jose Quaresma <quaresma.jose@gmail.com=
>"
> +RECIPE_MAINTAINER:pn-gn =3D "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-gnome-desktop-testing =3D "Ross Burton <ross.burton=
@arm.com>"
>  RECIPE_MAINTAINER:pn-gnu-config =3D "Robert Yang <liezhi.yang@windriver.=
com>"
>  RECIPE_MAINTAINER:pn-gnu-efi =3D "Yi Zhao <yi.zhao@windriver.com>"
> diff --git a/meta/recipes-devtools/gn/gn_git.bb b/meta/recipes-devtools/g=
n/gn_git.bb
> new file mode 100644
> index 00000000000..abc81a9549f
> --- /dev/null
> +++ b/meta/recipes-devtools/gn/gn_git.bb
> @@ -0,0 +1,46 @@
> +SUMMARY =3D "GN is a meta-build system that generates build files for Ni=
nja"
> +DEPENDS +=3D "ninja-native"
> +
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0fca02217a5d49a14dfe2d11837bb=
34d"
> +
> +UPSTREAM_CHECK_COMMITS =3D "1"
> +
> +SRC_URI =3D "git://gn.googlesource.com/gn;protocol=3Dhttps;branch=3Dmain=
"
> +SRCREV =3D "4ce861fc06ec87ff74eb6a17ebbd55e4755ebdeb"
> +PV =3D "0+git"
> +
> +B =3D "${WORKDIR}/build"
> +
> +# Map from our _OS strings to the GN's platform values.
> +def gn_platform(variable, d):
> +    os =3D d.getVar(variable)
> +    if "linux" in os:
> +        return "linux"
> +    elif "mingw" in os:
> +        return "mingw"
> +    else:
> +        return os
> +
> +do_configure[cleandirs] +=3D "${B}"
> +do_configure() {
> +    python3 ${S}/build/gen.py \
> +        --platform=3D${@gn_platform("TARGET_OS", d)} \
> +        --out-path=3D${B} \
> +        --no-static-libstdc++ \
> +        --no-strip
> +}
> +

Add do_compile[progress] to catch the progress info from ninja:

do_compile[progress] =3D "outof:^\[(\d+)/(\d+)\]\s+"
> +do_compile() {
> +    ninja -C ${B} --verbose
> +}
> +
> +do_install() {
> +    install -d ${D}${bindir}
> +    install ${B}/gn ${D}${bindir}
> +}
> +
> +BBCLASSEXTEND =3D "native"
> +
> +COMPATIBLE_HOST =3D "^(?!riscv32).*"
> +CFLAGS +=3D "-Wno-error=3Dmaybe-uninitialized"

//Peter


