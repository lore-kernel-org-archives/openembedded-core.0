Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05021C4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 22:35:52 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.70])
 by mx.groups.io with SMTP id smtpd.web10.114569.1701124542217539247
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 14:35:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=AjZxvGi5;
 spf=pass (domain: axis.com, ip: 40.107.14.70, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NiYKRq3m2f8L6YADWLzx982WWnTlOu0pZtpLZFQka1YS3/Y6JKCZEB+zhKbIIWm85dspNA/fesFXstvsRKF2pjQwVGFjOTtCpZoWZGBnTWcQcEvt32LRDHUu1n6TJRn0OmjZqoj94SvHV9JF8JHq1Y3brL0Qk5kaSAmDFT/N92U6NVclxpeW2b/AFvr3BQEZyv10m5Yi5bTqxqV2zf2yyjGh/KtaB1YhVmsYFeiJ/u3kBWSHZ4QQe3nSlVHT9K1QKWGB+9ZwkEmixgRJ07up6P5eAihha5eGe72lVlWCy/EHHMsGAYYZ6W/12kbFlqLSaI6oS7PfbbWdry5pWbIs/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yr7CxpS2kYAQ3IM0XkoeYyBO1kgZBueWw+NqaWMfUL0=;
 b=BWntcvvL6dV7k5mINBcL4Y+OJauhZOdponmGDfSxQ4WfvzwUk0lNkgJWnfCOlWg5aFbLq7sbTsaBHkdSeFWQyAGM+CBqEAzfFi4LX31e9oj7zFIMDFVLZ/cB/izYcHgB9kHG88gFPepL8ohOWOb5shaqYbhonIx+B0QVc04qesGlVInhaWIdC+mVzhPa+ugKSeMqDsjWNgt81h3E0SYAsJBnRAa6y6JdGEA4ckXHYqgVTU6fzO7iMnU1kmDV+QobVmb6ANPbvwnYmbcn5fVTIhp4C4W4KxuTl5NVqoiK0rkgUkj3g9Y6BpKgE1FC8gJeuVOLI6KJNTeI98Y+f8hb4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yr7CxpS2kYAQ3IM0XkoeYyBO1kgZBueWw+NqaWMfUL0=;
 b=AjZxvGi5mLh4jI+T/1gqYJneIoICBfMTYX1pFlxXjeTBOnw45UW3Kw8IqkSziFeeea4OLFwbKp31cBWUOymVe3vIfE9fXKQALE3iCy2VekPMJ9SZ7TZoSIPSTi/v/fLMCABrpIrUm+xl3M9/bq44H3P27owMc6Mvt1M8FZBrqNw=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by PAWPR02MB9831.eurprd02.prod.outlook.com (2603:10a6:102:2e0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Mon, 27 Nov
 2023 22:35:38 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::6bf2:231b:b0b7:205e]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::6bf2:231b:b0b7:205e%5]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 22:35:37 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Markus Volk <f_l_k@t-online.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [oe-core][PATCHv2] default-providers.inc: add PREFERRED_PROVIDER
 variables for llvm
Thread-Topic: [oe-core][PATCHv2] default-providers.inc: add PREFERRED_PROVIDER
 variables for llvm
Thread-Index: AQHaIRv9cFIL7AeZg02E0bJT2Oh64bCOwIOw
Date: Mon, 27 Nov 2023 22:35:37 +0000
Message-ID: 
 <DB5PR02MB10213D245CEB0C6D63AB066A9EFBDA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20231127102449.521512-1-f_l_k@t-online.de>
In-Reply-To: <20231127102449.521512-1-f_l_k@t-online.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PAWPR02MB9831:EE_
x-ms-office365-filtering-correlation-id: 0caf8a88-77f3-48b7-716c-08dbef992d8b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 xRlExa7FeN+jQYFqBVDkQ0TdrrbmdXe9WhGmW0Y2XZjP50QgzmeD5ZcRk5pQsIFvSBG7bJ0zLZQQ3xcK7Fh01Z4b406GT6dWx6KP0lXr/PCsGblLjj980iVACqGVtc+sz99M3kjuPVPmnZxh9qXfckfFjBO0DisVnd1hR9ehbRDVivQEi/sFCu1ZXX78lQXWpMiEdINAdhsPUfK3m1dxheU1f7G+P8DpjI5SWl2qW0ZZkWRARip3CvTa9H3wqQ57j5azO2VfRnA85nf713BgMQkQnny/PQ+dVmy9q7lGXSHZyWlSNcCx5jyaIgQaNZMr3BF0f4MEDgKrRy7mjzLQOJMQOU9/0NxHfw2O7RkVKHg4LK3+KI6bV4PAG1ibKHX7eL7n+POHhV9fbibI+hQ7sLC3BHIo31DePOOBCTFcGW0BF7En7ZK9N+HrSWXxq85Wjnm8kPYWwV0BctkJ7pG0CkVyRLquP6Zf8hoCuJjqAtbJQgSNSECNb5qe1EogHc+6HnOoBt0lMFGK+8cNQ38jH0984T8Q3oudGCc1TJGRT/q679cD48HlmroMwGQ4P8qilQrTIFQGW0QMuqXUMzYyGWMlXqI4nwUvTrJcRrcqhzJV+NV6QuLKOJB3G94QH5Nr
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(346002)(366004)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(26005)(71200400001)(6506007)(8676002)(9686003)(53546011)(55016003)(8936002)(44832011)(86362001)(5660300002)(52536014)(478600001)(64756008)(316002)(66446008)(66946007)(110136005)(66476007)(66556008)(76116006)(38100700002)(83380400001)(122000001)(7696005)(38070700009)(33656002)(2906002)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?D+y3dyfZVcmfl193qgPD2TNHNNEFVFisw3nKubR8Ldsw9cxczWU8+Aq24mBD?=
 =?us-ascii?Q?7B8SFjzjnqNloaWOQltgPm2RkyOjVCu2keNkF4l490i+ok+YnzNzVnLlBMqF?=
 =?us-ascii?Q?Z7sD6H2f/+WW1g27rFhZFhjuaIRcNcGvDcn/vOHzrQIyNY8tfmwyCFYEvUhY?=
 =?us-ascii?Q?+k/elnuv+O4BL63rLRFrqX6DOUVQF1g3d+bMUIgwu+pd/isW9EJoyGHyOfQB?=
 =?us-ascii?Q?y8JRhP6XxAVuRiPQGI2ciXYZrl2dTcRciehnqnkGu+k/1Ez9JvPmDk0e2qT9?=
 =?us-ascii?Q?6QWO4J9uZSYoScwDccFesp9poHqtIV//f7Z1s4wc9XyZOccB3pfIWxdH/UNC?=
 =?us-ascii?Q?NJaeczl3HrvEwcDIuRpjZoGxNe3isxsI/k6focyuePaf7vUgLTxLkgdotH34?=
 =?us-ascii?Q?3bXIg0QSLXOkklGsV6MkY9+EGMen+S4+JesmC60GKi2tACRxX5Jab3ozFhI6?=
 =?us-ascii?Q?WuGNw41SgU9kt46jX3shG3EI/AzGSWN+g2z+iacOBQGBEHt1HOahJlaWwiSr?=
 =?us-ascii?Q?tFbWUxyOMF1r9bp+nRvfhh+nBetWvLg5+Kylgr+44wb8n4ihVrpNycdEJ1xE?=
 =?us-ascii?Q?gpIuFLM+OZhjIraktXvRBNd2R8cFah+/VwPQx89LAxr7uBKIDAUOlFDtZFVC?=
 =?us-ascii?Q?qQsYc71nlrcxbO0zEiQRk7srMy58m5VXcxs9xGyW8ikuX4kejNkiq22JU9Fh?=
 =?us-ascii?Q?GXiOnFp6tGtckY8xKSNJLyPl5Z+JMJftVfxwSf3oA2ZcvlY0KHD1WAyVS+fs?=
 =?us-ascii?Q?FhnmkFbleLZN0S4wNtZU4jQ9KD/tVOAFdHegkeetrfVDUmgNExVs//wJAjtj?=
 =?us-ascii?Q?W3Qsi0yble2NvxsxThfHMBnPDaYA/GFOwl9BKTV4jFIS7iZJIKF7wrK4i4ed?=
 =?us-ascii?Q?YQbLpumsuhmzHo0+i7GgCh+GU3d6ZcgQgtOzCxH8MaI8YZcR8aHj0IwfvCHx?=
 =?us-ascii?Q?X19L1bGHQCqANgM5BFmgb5Vz4QfHSH/yTbm45bKfBWm5KwJ2HkNwbuSe7Wno?=
 =?us-ascii?Q?afXzrt8KGohBrc1wThZg6+hmaMC9BccpptlxdjTHdy/18Rs5WVK9aQqltW/H?=
 =?us-ascii?Q?JlL5UWjFOpDl92KV1g6JxfBSe82bdUg1AF5FsyvjZEXRc/Kuc0d7oc2GGa0a?=
 =?us-ascii?Q?aMLLzTdLRLjWiLWfDQGh3Ry6qV95LeiySo3dSJDuu6dfzJpECNjgMJe8L16I?=
 =?us-ascii?Q?TpKeEJnDYhiIHg+4588O7DB17nkRh4uL7SIfvm+9T1EjKu08RJXtjiInZyYm?=
 =?us-ascii?Q?sAMVhzz1AXalhI0hM98MYpMmXZLUcmq3axavps3FnszmHpiobuI+FMPDKHS5?=
 =?us-ascii?Q?gNKzQhEW6HUjjb5zICajbtXU/w5inYDAHvSXhNIwqKKa08MvFCsOtcVI7k3A?=
 =?us-ascii?Q?J29Mf9mHigNq1wpzUUAD5ab5Za7KLFQ5fYA/kpz1N++fbbFvkA3iOvGOOfJa?=
 =?us-ascii?Q?yT9hxn6dXTSbFPjNtaeDIluTI8o/kaRSlDS7T6wMHafE79QXTrKKXbLHCuUF?=
 =?us-ascii?Q?T9mEoXSlHXQvxr3yItmQV+oYnxlyObsLPJ3ROUW8t8JOi8n4wwKmf3dpnpOM?=
 =?us-ascii?Q?p5jxyIDN+IHOM+EStA0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0caf8a88-77f3-48b7-716c-08dbef992d8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2023 22:35:37.5619
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +ZjaaXyR2FNpwS6dAdtkOrszaHrOZCCLR7uFct68QuM6kMIaI4aMltwKZyv2fgIu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR02MB9831
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 22:35:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191328

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Markus Volk
> Sent: den 27 november 2023 11:25
> To: openembedded-core@lists.openembedded.org
> Subject: [oe-core][PATCHv2] default-providers.inc: add PREFERRED_PROVIDER=
 variables for llvm
>=20
> gallium-llvm needs to be built with clang if you, for example
> want to have support for opencl or want to build the intel-clc compiler.
> meta-clang recommends to set
>=20
> PREFERRED_PROVIDER_llvm =3D "clang"
> PREFERRED_PROVIDER_llvm-native =3D "clang-native"
>=20
> The current problem is that this is not taken into account in mesa and th=
erefore
> both llvm and clang are included. This leads to files that are provided b=
y both
> packages and would also unnecessarily increase the build time.
>=20
> Add PREFERRED_PROVIDER_llvm and PREFERRED_PROVIDER_llvm-native and make
> sure that the mesa recipe takes these variables into account.
>=20
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/conf/distro/include/default-providers.inc | 2 ++
>  meta/recipes-graphics/mesa/mesa.inc            | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/d=
istro/include/default-providers.inc
> index d18173c744..819d71628b 100644
> --- a/meta/conf/distro/include/default-providers.inc
> +++ b/meta/conf/distro/include/default-providers.inc
> @@ -37,6 +37,8 @@ PREFERRED_PROVIDER_dbus-glib ?=3D "dbus-glib"
>  PREFERRED_PROVIDER_dbus-glib-native ?=3D "dbus-glib-native"
>  PREFERRED_PROVIDER_gdk-pixbuf ?=3D "gdk-pixbuf"
>  PREFERRED_PROVIDER_libgcc ?=3D "libgcc"
> +PREFERRED_PROVIDER_llvm ?=3D "llvm"
> +PREFERRED_PROVIDER_llvm-native ?=3D "llvm-native"

Don't insert them between PREFERRED_PROVIDER_libgcc and=20
PREFERRED_PROVIDER_nativesdk-libgcc. They belong together.

>  PREFERRED_PROVIDER_nativesdk-libgcc ?=3D "nativesdk-libgcc"
>  PREFERRED_PROVIDER_linux-libc-headers ?=3D "linux-libc-headers"
>  PREFERRED_PROVIDER_nativesdk-linux-libc-headers ?=3D "nativesdk-linux-li=
bc-headers"
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
> index e5c405a972..1a971242c9 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -183,7 +183,7 @@ GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACK=
AGECONFIG', 'r600', ',r600',
>  GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'virgl'=
, ',virgl', '', d)}"
>=20
>  PACKAGECONFIG[gallium] =3D "-Dgallium-drivers=3D${@strip_comma('${GALLIU=
MDRIVERS}')}, -Dgallium-drivers=3D'', libdrm"
> -PACKAGECONFIG[gallium-llvm] =3D "-Dllvm=3Denabled -Dshared-llvm=3Denable=
d, -Dllvm=3Ddisabled, llvm llvm-native elfutils"
> +PACKAGECONFIG[gallium-llvm] =3D "-Dllvm=3Denabled -Dshared-llvm=3Denable=
d, -Dllvm=3Ddisabled, ${PREFERRED_PROVIDER_llvm} ${PREFERRED_PROVIDER_llvm-=
native} elfutils"

This should not be needed. When PREFERRED_PROVIDER_llvm and=20
PREFERRED_PROVIDER_llvm-native are set, bitbake should automatically=20
take care of depending on the correct recipes.

>  PACKAGECONFIG[xa]  =3D "-Dgallium-xa=3Denabled, -Dgallium-xa=3Ddisabled"
>  PACKAGECONFIG[va] =3D "-Dgallium-va=3Denabled,-Dgallium-va=3Ddisabled,li=
bva-initial"
>  PACKAGECONFIG[vdpau] =3D "-Dgallium-vdpau=3Denabled,-Dgallium-vdpau=3Ddi=
sabled,libvdpau"
> --
> 2.42.1

//Peter


