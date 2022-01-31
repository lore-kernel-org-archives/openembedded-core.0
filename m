Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D376EC433F5
	for <webhook@archiver.kernel.org>; Mon, 31 Jan 2022 17:51:16 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.84])
 by mx.groups.io with SMTP id smtpd.web10.36470.1643651475648041674
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 09:51:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nxp.com header.s=selector2 header.b=HcDn0QP1;
 spf=pass (domain: nxp.com, ip: 40.107.22.84, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bw6TUGh6jEMSHSMtWy6TJpjlm4b0V8caqeZdswqCXt8OA2qsZ7Eu3Q5eFTJFb5qKA50qdLDxTTzdFd0tEOQRfLUiTQK7ijPLKnF1d/BTbfQcT6+GGcwNxM2m2/vrURea3XiNwDni1p+PEJcL/4bDCG7PKt959eKJXw8grmfonSIJNJFmBw4d9NXCrascffpkbJat/7Wy5Kvjpl6QqqGsSWiczIiPqqX3uZAUqlJ0IjIjVF8KXYUEuWR9E5KzGxMZYwl7G2dbAutjtVelAxCfaoKCzLx+30h1sEHHheAQI7B0re8JpTus/g0mLMkT9m6CM7/4G8+1sSuJgt1f2ceHug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BqTJqN/XqgmFp/LakcX2jyVg/9L3y4RKrrg6lwoTjxk=;
 b=hR08ZCcDsL/NvVqkwiLxqlLHKWwHFrZdKS5cq0KLPrh+Lx8+icMj1Wjbaqu8jyAXmnoalCCfZk7wBJdrLilGZ7tzmqKWJ7LCEbi4jRrlPAEVNQHUMuqo+LL6toqHisGkd/J8xLhP8nL15CMVW0VwaShM3wRXonpf+3oSTUSf4b+E43H5sI2fcL+iPmWGdjM7JaOelTr/fH4bcGXl1th0jnaNdNJQY3+6D+b9gsY/LywKzRw0lHcmo0xjBq2ZEw35aQgXqm53o8x+O4mJZF1v4z5JPI/zdb9buDdkjefNRuw0QEjM3JdV11BZI8OCQVQ3s6x7DqO677iuoniQ+UW4BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BqTJqN/XqgmFp/LakcX2jyVg/9L3y4RKrrg6lwoTjxk=;
 b=HcDn0QP1Kv4BgxK05QnsKb0k/oo4O/B4HjOIzbv7/6+R93K0AOmM/2PK1m7lJ5HKiXdQxXYNVcosloEZEtgfPbIN2N6gJbgx/vHXOSI34H7RNz0yepj8eUYMtEO/B//4ua8bI3Ovkb9DaZ8hNSOE/+I2N8c7eL7WP2tJPFVjbes=
Received: from AS8PR04MB9048.eurprd04.prod.outlook.com (2603:10a6:20b:443::11)
 by PAXPR04MB9121.eurprd04.prod.outlook.com (2603:10a6:102:22b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.21; Mon, 31 Jan
 2022 17:51:12 +0000
Received: from AS8PR04MB9048.eurprd04.prod.outlook.com
 ([fe80::2123:bad5:ff38:df6e]) by AS8PR04MB9048.eurprd04.prod.outlook.com
 ([fe80::2123:bad5:ff38:df6e%3]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 17:51:12 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [PATCH] xwayland: Add xkbcomp runtime dependency
Thread-Topic: [PATCH] xwayland: Add xkbcomp runtime dependency
Thread-Index: AQHYDY8wt2f6xYDmO0q/r9nqR/eI4Kx9ejYg
Date: Mon, 31 Jan 2022 17:51:12 +0000
Message-ID: 
 <AS8PR04MB904851E4D3E0E214A9D52611E2259@AS8PR04MB9048.eurprd04.prod.outlook.com>
References: <20220119234852.22999-1-tom.hochstein@nxp.com>
In-Reply-To: <20220119234852.22999-1-tom.hochstein@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e88975d9-735f-4400-0413-08d9e4e24561
x-ms-traffictypediagnostic: PAXPR04MB9121:EE_
x-microsoft-antispam-prvs: 
 <PAXPR04MB91217F1699E8462E55A79AE8E2259@PAXPR04MB9121.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:494;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 QzGtgDJX73qsO9j0aydDOzmRuFQAGbOrUPisTsCf5NlMV411DPVEhmKTBOyjf8/Uf05L+Y6PXXlM4YpJuK0BjEKchcc2JKIBOiTJaLAHUYr26d5A/c7WMI7DTUiUdLC2wEXLFRFQUTmXQvvZ2h3nkxYG5hBvaKclnX/GnB6Pi23e3rUmz5xv2wnaBkCf8eF6NoXjVSkVbbE6R/GmYQQtOTxvvu3bqNTu99T9E0+mbaYx8Pn12QqL//NbkBxjJTxyEbo3+klJj94tN09ap+mCuAUvsX5DAnYt6iQFXHikDkp77KaVmGMlp3P3RwxFlJnTBFkC8zhMpL0lSTQxFXHHAu9SLE3fphHtixuZTjLnptfEvdQFAKyOpIAwH1mvFgo+k2fmdfqHrgPqdW2k6i/T6JttrS6F/Se1JLZ/okC3pLNFbBeZcLFKOtITasMtBpuRP5pQ2npqIIHo77trkleVKUOPMxgSkFvOW5x/sqlmold29gE+q4BSg8h8DRDJVqXb7sUQXl1TjMiP9zjj1jGQn4pq0njIVlP8JR83f27B+Vj2qk9uG2XQhii1dnRUfCuscQ6fN72+df/mBpg+hIAU1xSa1Su7F9DrTYvRT+YNZc+6w5/Exdo664iG8INzYnMde4oIcNIaE9NLuY1HrTkyO1LXbA5P/vT1Ezu42KJuevJGz48FuKb3x3EkMZuGimHYvjO5bJN6yWP6agIROA+YJ6xduVdf2hXaSZxUC/Z0jmkz20rT9AnIrGabdlk1XmcBWsquC/Rk7mOXsnI32P4Zok+kmMoHBq9J5Qq3d2MU2+k=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9048.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6916009)(53546011)(86362001)(6506007)(55016003)(33656002)(122000001)(71200400001)(5660300002)(26005)(9686003)(186003)(7696005)(38100700002)(2906002)(38070700005)(966005)(83380400001)(44832011)(52536014)(8936002)(66946007)(66476007)(76116006)(66556008)(8676002)(508600001)(316002)(64756008)(66446008)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?TFqc//dpiZp9OqzHWacoLdMhPBZf+ykZT/HJM7e0r/Iv+MRuUInfzNWymIf2?=
 =?us-ascii?Q?dW3tGntWjrT+DIyDXtG1olzIdROXJWtRqZSCyNRq65gTQDK57yNw6GXs2TxI?=
 =?us-ascii?Q?b9Lm0POwzdXZHzeXoNjt4hiJBjhc5RYGb5JotPBUiA5W7FFKV8MKCBDVA1Bo?=
 =?us-ascii?Q?vPkjgObv6z6Gk3CaKdFZjRjLoxdfP2O4DPd+BnrnCz97Ks0YawWjqZy7tksr?=
 =?us-ascii?Q?hrkV/R+MOMnI173W8q/kASKS2BXFh1an5M9OpywS8Bn2CBSKznyIWRb6iKGV?=
 =?us-ascii?Q?Kw5UGiFjXcYQ/zny4x7uNolqM4jrHH5pxHAjfO4RckH99h3rQgXjwKsKAyot?=
 =?us-ascii?Q?vxAt+wUF8Na948anUCH/yVdj8YV2iCS6LGyM/yyUcpcpFI8+ookBXNKbSD4v?=
 =?us-ascii?Q?VFhhoi9ZIx5ujR6F75zxx5Lh/HkRpwVkYPRoqATkMfS15O95YmN4OE1yViT5?=
 =?us-ascii?Q?CME5l+qcO6m3icmMUV77viWytzKAy69R+0vT2sLeK+jwJEmkq0k/yOZ8TPAm?=
 =?us-ascii?Q?fQ0HhkBGAU5wv0xky1QSBUTjn326M8Ktvs/+t+5cOIxeAku1w+3GCqUkLIut?=
 =?us-ascii?Q?g+r2Zm6ihmhAQCxP8oq/JJCLFEcx1OtgluWMhnhY2nSFONtbsdcNDQSSU3Rb?=
 =?us-ascii?Q?vvhtMOQ23Oxp9Tl6paz4HWjOu3vD8Gpb/XX7t+hakUV1LyGwZiJVyV6mLybc?=
 =?us-ascii?Q?pYu37k1+XoIQ/C85g+2jhq5XiOJGQLlgL/Gzf4ws10NvFDnRyNNcUAfu32Jz?=
 =?us-ascii?Q?QfbhmYFcARL4DrDUat6zCf2LfQsVVhm4zqWY7GbrztSHRceZRBYZ43hdLTeb?=
 =?us-ascii?Q?dixAKt9x9xo8tTdnvx2XVeR9oubmhqp987JfEBWVbo0uuXC+VqqanzsjHUQ4?=
 =?us-ascii?Q?9qeJUWFxgiHXKJ5tqgSTYvROlEOndNRGWyGEUkeSBQFpRgKIRgeuNCnxXihQ?=
 =?us-ascii?Q?ZTlj219QmrKiavvcYJ1xkUxYIQMEg4yF/e2ByJaIVKMQmSWzEWbSnwLzosrp?=
 =?us-ascii?Q?b9dpNLh5wNirvnsuQ48jtB1yT8cm61EZ7uZmcI6XJV4K78FvomOevUKF1Rre?=
 =?us-ascii?Q?3nLlD5n49KBXtsAe5GQ2Uh2xDXDQF/nJqYV+3xh18XX59WXhBoF6byojdtBm?=
 =?us-ascii?Q?VR9GTVcK10D76rDYzPV4U7RyQ5uVHvXPFh19JbC7y0V2LOJjOJ3CYwoMyMmJ?=
 =?us-ascii?Q?tzF2+z8a34jaFIuH+2bpni5CRUUEpCcH7EBpcZnLWZeAE3tUN0caN4W0rAjo?=
 =?us-ascii?Q?mG7ZGmI26DniPth5v0IFdeEI943H8YL2AtZEuzDeezB2UZWFv3L9PqV1YA+U?=
 =?us-ascii?Q?LGFf3AyKT+OALaRdLdoB+Pp5ArbBP/hEbzI/FkRP5eyxNq1nNP84yBiyQApR?=
 =?us-ascii?Q?OREwn7OYPjO3NhorlbTF5xvt0BWJu5Arj9U+HbiM5XHzbmwd3Rkr3HOJwBQI?=
 =?us-ascii?Q?YowJCL2Vbti4rE+jMxJFPrYEHFk/f60EII+VHsyVza4jLW+2E/LXWPnE+zTz?=
 =?us-ascii?Q?j8eCJ6SbVUYgmPpYmK1d1rLds8GFtIKq8ImfqvBtNi2Xzvbx0WOzNgwqaRih?=
 =?us-ascii?Q?ZAOEdI+FbZJhbvMsTdM9sqeABIjpluzjTcd6eO6l2ob1j4T9OplLWvs7hq/s?=
 =?us-ascii?Q?AA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9048.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e88975d9-735f-4400-0413-08d9e4e24561
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2022 17:51:12.6426
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 JYgg2bGwx7aAY2QncR84UivlTF7ofVpoDUBIWRx/04hUV5j5xAP35V8AZNda9CPhcS7Y05MYQ3tjkSLXJYixBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9121
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jan 2022 17:51:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161131

Ping.

> -----Original Message-----
> From: Tom Hochstein
> Sent: Wednesday, January 19, 2022 5:49 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Tom Hochstein <tom.hochstein@nxp.com>
> Subject: [PATCH] xwayland: Add xkbcomp runtime dependency
>=20
> Trying to run an xterm fails with the error:
> xterm: Xt error: Can't open display: :0
>=20
> Checking systemctl status weston shows an error:
> Jan 19 21:24:16 imx8mq-evk weston[396]: sh: line 1: /usr/bin/xkbcomp: No =
such
> file or directory
>=20
> Adding xkbcomp to the rootfs fixes these errors. Checking the history one=
 finds
> that the runtime dependency for the old xserver was removed because it wa=
sn't
> in the correct location [1], then restored because it was still needed [2=
].
>=20
> [1] https://github.com/openembedded/openembedded-
> core/commit/bdcc5e8f1286d288baf410458efc39a59b68d751
> [2] https://github.com/openembedded/openembedded-
> core/commit/f2330ebc3071d780cbc6d1ddab5c54bfadf8fffc
>=20
> Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
> ---
>  meta/recipes-graphics/xwayland/xwayland_21.1.3.bb | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-graphics/xwayland/xwayland_21.1.3.bb
> b/meta/recipes-graphics/xwayland/xwayland_21.1.3.bb
> index 5d083e8ada..7ea40d9486 100644
> --- a/meta/recipes-graphics/xwayland/xwayland_21.1.3.bb
> +++ b/meta/recipes-graphics/xwayland/xwayland_21.1.3.bb
> @@ -42,3 +42,4 @@ do_install:append() {
>=20
>  FILES:${PN} +=3D "${libdir}/xorg/protocol.txt"
>=20
> +RDEPENDS:${PN} +=3D "xkbcomp"
> --
> 2.17.1


