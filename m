Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3760CC61D97
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 17:17:51 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.42])
 by mx.groups.io with SMTP id smtpd.web10.25504.1700673467337668184
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 09:17:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=e+8XbfoV;
 spf=pass (domain: axis.com, ip: 40.107.249.42, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mcdb5Tv9OiuPX85oIjOsARw4SqqEnb3IVA+sd20HX1ePd1D52BJk8lIMS+2QnpGbztALkE/1FzCBDvIDh+MZ3gLErQJ98h+LAg294MwF4FodBiDH6jW5/gNaNmjH/hvqo7mD/pWB+EWNsmSc2UrnhUsOVQ4gglC+E81vKa6tC1xdJGTH3T1AZjA2EqME5El8YU/q1oLw2kO2SpbkMt42NaYPbrCSeLwKIQL8w6AXCCd9ZVZ8244HZ8wvcU//bno6erR3/MQf61ks3DXm1PDq9JYWRujIZCiw+dGOsnjvdBkqLLfzvQJ9kHlw4xjJmkXz6iJWDxaJv/nZrPu7xf/14Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j4BeirT/DhuChjfZ4yhtZ08liOwJ+QoZeYR6CYfWSAo=;
 b=GRcCefx9A8aPOTVXTV8FSTqFlirrPunrymuYwLlMGRp3CP4pTiLUeyJnn4un2a+LQff/rYsiG7vUvEYJabTw4gGWaQI4KxcnqRENxMzFpYhJQtFMRjmif+h0FNtobbagW/lHjHYUzZdaGqDytNn80bbOgVXORhqZnzSPRHHwcxjHHbdEzCVI9lqIkL40iR4OEqED0IHryY8AZknW2BPOFobTzKt1oMDSFamIbdRJ6imtJiaY9zwDqKAiKVf9f/IIK31zHmFnRgy9e5BF3Qcq3vhhuD/4ARwnFE1bXSot84murVeQJ5I/486pkFILZwyEqdqQy9NeEIGcHT4bnspBog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j4BeirT/DhuChjfZ4yhtZ08liOwJ+QoZeYR6CYfWSAo=;
 b=e+8XbfoV+O7TRBHITmPIgcH10IXj6A6stO9WA6av2CiBOCOObyOd91dbTDJShMduYah7sReM09yVTEGNUsIJgCpUt0rKr+JNoWindNVDJcA3JBSPHFgr65ZtMbc/e66Q/uoyxTSjF8+bzU3jBQB08336QZkrJTrl/cGEGzKFVbE=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by PAVPR02MB10012.eurprd02.prod.outlook.com (2603:10a6:102:31f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28; Wed, 22 Nov
 2023 17:17:42 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::6bf2:231b:b0b7:205e]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::6bf2:231b:b0b7:205e%5]) with mapi id 15.20.7002.028; Wed, 22 Nov 2023
 17:17:42 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Martin Jansa <martin.jansa@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 02/21] create-spdx-2.2.bbclass: use hardlink as
 well
Thread-Topic: [OE-core] [PATCH 02/21] create-spdx-2.2.bbclass: use hardlink as
 well
Thread-Index: AQHaHUHSQOTMmsurzEKTryTgfbtPl7CGlA4Q
Date: Wed, 22 Nov 2023 17:17:42 +0000
Message-ID: 
 <DB5PR02MB10213FC90E4921EEB090543D4EFBAA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <cover.1700600804.git.martin.jansa@gmail.com>
 <b3a6626a8d7a5b20bcb78093cfe4d64ed7c7b30c.1700600804.git.martin.jansa@gmail.com>
In-Reply-To: 
 <b3a6626a8d7a5b20bcb78093cfe4d64ed7c7b30c.1700600804.git.martin.jansa@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PAVPR02MB10012:EE_
x-ms-office365-filtering-correlation-id: 3f4c9496-9823-459e-b078-08dbeb7ef009
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ua+ILm+pXYGbG5RUxVZk7nr3LerWNJkBab6V5RcemYM3Ih2hsBv5oBMQsQdDQZ6gpESfmaEF+kYUblBvcOi1qi+DdX/WXNQbTqUv008pJkc0ivw0zPsZd18zQ5BS97GXKmNTeNC6+ngK8tg5YkMrpjqnoSgAw47KBCYIysTZD1gaU5SowmRGLMoG8yQx0M85UdAIAyWakmrrvkWzRExZNFyahtIyvrMcSs2AreoOd6uGqvoJ7+hW8mHE8iaJGwaUFQyl0eJxcz/a5sVWgLZN9TDPvm9GQPUfKu4IvfBB7GR2qi5hbPz4qUMYnd9cDGvKFD1PQaCc+lMWOr5jWzascCXThdzxvS0N014CtH6Gl5XR2c6cjora9dfdSicW2y8HqvghuTNR619qC5FeYW7ln01CrkHtLMn2DhdoQFFFSoGAXhWoW0QZateqMdZyVfvIF12ZEl5dBVnFZPagSbgvqSLKv+iNdWezEF8oiKHVYrU6uzA0xyB2z6AhtUyPDlP5FShr+2h2y0n7zOM6U+cNrUlJLZlJnIYDY1Duw8JQpQZqhsmaod3kGzgrQjukL5H552MuQZz+gDmblg7/+h2vikKElf5s2gUls0fbOJUXFRDcSrFcoiuRj7XS4kqW1D6L
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(346002)(396003)(366004)(39860400002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(71200400001)(83380400001)(9686003)(7696005)(6506007)(478600001)(38070700009)(66446008)(66556008)(66476007)(38100700002)(316002)(6916009)(122000001)(4326008)(8676002)(8936002)(66946007)(64756008)(53546011)(26005)(76116006)(55016003)(44832011)(33656002)(5660300002)(86362001)(41300700001)(52536014)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?fWiPftiKsxTQAjGPVDxroHb5m+hyUpqej3pm30zVPvnvmS2P6XOglDVAjLgt?=
 =?us-ascii?Q?3l57NdXOmR2hpgWLxQUaxu/qIounkI6HSPyeQOlptICbOVxOLFvvCiOCanQs?=
 =?us-ascii?Q?C0vCQ5t82ZF1LXhAQtbbqEawYDrYVoVnqZsNP/uagFDC9dZgYRO5VE1CaMqM?=
 =?us-ascii?Q?Y/zHbEjWqw+v5XjRcZSMtofm9nvyChnr3xJfFP80UlrPm4xc3BCPtr17EBww?=
 =?us-ascii?Q?rb3Qno5PO4phHkX94wxV1YroaCQgMLgTchgm3iPYVguqFesg0IKzxaAIjF/7?=
 =?us-ascii?Q?fH/IFGX0HS/TelZoelSO5agND14+A73CuV9EPpx7Fw0CM0HrAJ1tp2u9qfTO?=
 =?us-ascii?Q?jrS7rA0brm5Azvv4RlFq4XBi6geYm48Ea8/CNoPpc0rVZ2fhkwyJcuPRCXUF?=
 =?us-ascii?Q?BN+ams2aSgzv+HLPCJz/dehzDBHhqw4p+ZsjwfDTBOi5Em8n4JfIAbwX/jw4?=
 =?us-ascii?Q?NChHCdPpQk6YmVeKi8ninPP8nvpVI9hGzeY9VVu3bDT5UoAO/maqtiw+/aX2?=
 =?us-ascii?Q?4QaRDCzpRMacTMPihHFamDVu0SakwxSeccE4h0Onx6GQ7Xor1kmTG3TNF5w1?=
 =?us-ascii?Q?7eSe4EC4gFVPKuRF+NmqHXYXqHxxNRz3BgQfYThbmKxcFWj2e5G9ogFtkpDv?=
 =?us-ascii?Q?LweXeT/TkG8CZEfAZRQxPzwnJwi34v/Ut7tw+EJDd7U/MnK3fU3Lv5ngLhiF?=
 =?us-ascii?Q?E7NJUoJY+a3FMgimpl3pVRPru3K75Z5i2yS5cO8YL+35/N/ieqpk+iMi8O9P?=
 =?us-ascii?Q?KAyZGuJ7eWFoH7waw2kqV/A2zfpJQUNxmR1zAlAd06N2DMMlDiEJDYudokBc?=
 =?us-ascii?Q?we2yFFm4ItWXQizXrTcWh+0dGc5alvxTRaIHqXJScNwldzR8CGZgL4DRkIYs?=
 =?us-ascii?Q?Ch4jD483PN8A73arucAMGd3WczghX0hJlxUGJfHOoVQES9byyGKWRZlq81Q6?=
 =?us-ascii?Q?e/hChnMHZHokC8C7Hsj7MOfCGjBXurlF9X9mK6TMhloHv4MoCIB6RaLq7mLi?=
 =?us-ascii?Q?yoTb0bvzBxIpq+IeLtyROCca9hQGrSan5hj9qU1qLh9vaRmX4MPPCd7ItOJZ?=
 =?us-ascii?Q?C/U1MoHs8AIWFu2IEKoreWsXx43ppZim2he9/6kehPZPRYBp9XtKYTzJwhO+?=
 =?us-ascii?Q?yY9hY6/l+B9VBtVKxmxX4/4bb2kTF6vc3VeJ1wUyuh94yO2Bc39dN7MwBfw8?=
 =?us-ascii?Q?8OEAmcQOMBVHw/10b+SEb3tGm7cPyN0CHKrPF20OfsG8GpwaXVXj7HGY6Fg/?=
 =?us-ascii?Q?5uDHPAcaSro2+Pt/O2Qwu5BRSQtv+aSiCiqtsdevojzLjMd9s0U7J4X9Sk6R?=
 =?us-ascii?Q?BNDJp0+/Tb4XKoyFjT0+zLOdu9HS4MgEEI7dpKUH3yFSipwfR+WbwCgtaKyy?=
 =?us-ascii?Q?F6tGChYPhFdZljrikl5oDf/AsUgp6SAxglezz4CcE+C0ygIm71WVRmtC4MSb?=
 =?us-ascii?Q?/pBqKHDYNPJvoY5tg/hPM03wr3uPJyWhtSdG3rXBoH9gYiaN1d3yyPT7NyAx?=
 =?us-ascii?Q?Pdzypi1+JO89JZl6S9YARZvpE1K/uojF0AU0SIKrjJ37px/TI0n+EAJzI43T?=
 =?us-ascii?Q?Cksi5Z1MRmGALNnfRDA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f4c9496-9823-459e-b078-08dbeb7ef009
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2023 17:17:42.8093
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hjuT4eknzRh7P+DIWF7jTuRCKmOsk9iY8szLU3mdQjYZU/G3ZDr2oxyw82F4b0XQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR02MB10012
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 17:17:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191123

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Martin Jansa
> Sent: den 22 november 2023 13:45
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 02/21] create-spdx-2.2.bbclass: use hardlink as=
 well

This commit message does not make much sense, unless you also read the=20
one for the preceding commit, which you won't do if you run something=20
like `git log meta/classes/create-spdx-2.2.bbclass`.

//Peter

>=20
> [YOCTO #12937]
>=20
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  meta/classes/create-spdx-2.2.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-
> spdx-2.2.bbclass
> index b0aef80db1..8c77f6b886 100644
> --- a/meta/classes/create-spdx-2.2.bbclass
> +++ b/meta/classes/create-spdx-2.2.bbclass
> @@ -967,7 +967,7 @@ python image_combine_spdx() {
>          if image_link_name:
>              link =3D imgdeploydir / (image_link_name + suffix)
>              if link !=3D target_path:
> -                link.symlink_to(os.path.relpath(target_path,
> link.parent))
> +                os.link(target_path, link)
>=20
>      spdx_tar_path =3D imgdeploydir / (image_name + ".spdx.tar.zst")
>      make_image_link(spdx_tar_path, ".spdx.tar.zst")
> --
> 2.43.0


