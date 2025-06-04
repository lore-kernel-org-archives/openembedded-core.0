Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76EABC5B552
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 09:14:10 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com (AS8PR03CU001.outbound.protection.outlook.com [52.101.71.56])
 by mx.groups.io with SMTP id smtpd.web11.12237.1749028444771511557
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 02:14:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=KVNrgTyK;
 spf=pass (domain: axis.com, ip: 52.101.71.56, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KudbqAXUqZDlKgxvCV/NadG7qhafAHTwFl++KPDTAZYBQKAGuvtN6FQDKE6dde2mYD2A0A7c++X3JimtlvhGHp5JUb2SRbHdZzoJd9uAvDkpvNaj/Nk5YNL3YmtKaI4kncg/QASnUugFsQ1PEPRmwSG2WWYxHoSNkTiaqZ5g/eaCWQNLiNlJhdJ0cA8Ng3dNLnMlovL3DoDunc8+5xQ5pGTkIlLtpvft1uZLESL6C41fKU5CyRwLtn025FMj250uNy02lKS8NjxiZ8gp7C2W1yc3EWUyrkuTfUTyatnp8q3LPC7AMIxWVhaH2WgtF8vKomBCA7XD2uz2I8EKUoy8wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/UxXKqv80+TzpUd8ypCXDrxE7HekjXTSKuIYos02LVo=;
 b=Ly1MU7WyulahQ8LyGHBQ5aanezjgaYscxxBacc5hjyFkx7I9DIPly0HapCf2YJ/wLbZXHfKGY+TlqEjBnkCr72sTuWxA+8WQEh8SBVWQdqqC0vOK+nNbcQSpS6Vhdu69RS/88p3Etxkh2uHFiDXE0OLpIeY6Ap9YuBvlKMY/WXDAblztmMqEzpQsXbSakiji7eApU4mDie+UB2ssuUa7hstN8nTfm9fpn2qux3nrJkAeML/BbSLMaMswO1j/F3DmxATTM/d5P0e2+wFMjzCmPssZi8Oigx0iOdoLoUWbj3sQEFyME4mUKNYgZvJdDwi8I7AT9mjEedUyqWOrXsUhTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/UxXKqv80+TzpUd8ypCXDrxE7HekjXTSKuIYos02LVo=;
 b=KVNrgTyKSQENSMBz0RuVquApgR3Fh3pLvN1j9+JcdtZ1MgEFEPzbmgnqUIc2RKBQDEqrqEEFjHmOJPJmofo26z3EyhUzliFmXg0NuebIqx/kAfUD9vxf4pv/K7KYtjghMuOIbE6GXAmJkICoX082EkCGSM84tA9Ej50ElkCPVtc=
Received: from AS8PR02MB10201.eurprd02.prod.outlook.com (2603:10a6:20b:63d::6)
 by AM7PR02MB5925.eurprd02.prod.outlook.com (2603:10a6:20b:102::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Wed, 4 Jun
 2025 09:14:01 +0000
Received: from AS8PR02MB10201.eurprd02.prod.outlook.com
 ([fe80::90d0:ca74:2479:bbdb]) by AS8PR02MB10201.eurprd02.prod.outlook.com
 ([fe80::90d0:ca74:2479:bbdb%2]) with mapi id 15.20.8813.016; Wed, 4 Jun 2025
 09:14:01 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "yoann.congal@smile.fr" <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
Subject: RE: [OE-core] [PATCH] reproducible: allow each layer to define its
 known non-repro packages
Thread-Topic: [OE-core] [PATCH] reproducible: allow each layer to define its
 known non-repro packages
Thread-Index: AQHb1NNGf4BCBDKeXUuLeutZ7v5PPLPys6tA
Date: Wed, 4 Jun 2025 09:14:01 +0000
Message-ID: 
 <AS8PR02MB10201A85472191F69B7F5800DEF6CA@AS8PR02MB10201.eurprd02.prod.outlook.com>
References: <20250603215916.2429422-1-yoann.congal@smile.fr>
In-Reply-To: <20250603215916.2429422-1-yoann.congal@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR02MB10201:EE_|AM7PR02MB5925:EE_
x-ms-office365-filtering-correlation-id: 3f403df4-4351-4bf3-4ee1-08dda3482520
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?h22v7rG/NhpyIubr4xYfVYSSLm9DQhKmpqVF1VKXw4cfGScZ9TswglEGl0hf?=
 =?us-ascii?Q?zdHq988LMvgecKFN0aWhdM5XvbY9o0alTZvx6Hh9KJpWNua2wd2zToodI2WH?=
 =?us-ascii?Q?HADTiraUUcWRWykxbCkV0OnQ9xA+0yn6PNwY8MJQDIb1/ldT698a/9+CExrS?=
 =?us-ascii?Q?LIwBhiVeq49ImAmkXmS75WeoaV62i3Ne2IuWoYgipGAFsE84j+FGO02PEUxX?=
 =?us-ascii?Q?ipmqyqwYFaMJ+qB/jvs4w+GMKhKhRRzsrbXzJEY1sXtlcoZV/V+P3auAipJt?=
 =?us-ascii?Q?TNdqK+tOtNTxVoIY7xTLjUtmshbav76tBg2+HfpZ6PYaU46IcUUeav54Qteb?=
 =?us-ascii?Q?F6RJzGsIsVYxatnq7fvYag1zWFJi9Arxpd+WwoxToRxFr8yNxhpnair4n4zM?=
 =?us-ascii?Q?h+zbQrJHOObEpS8Mu5YlUK1cX5VVlPxiBDVkntq1TW22k3aU6BoFLyFv9RS7?=
 =?us-ascii?Q?fF3tvMbKOxtxFaG2kZ4dnkfLAALs2IQuQBn4yFdqj2RDLfqVOFuv91IGy+76?=
 =?us-ascii?Q?tpH4HwfxXS3mYFLuN7bBnPqGq9m2pjVoMFRLHgGvB6iOJ3uErecDJGpVnGru?=
 =?us-ascii?Q?zD6CoEUv5R0ANWVy2o9X2fFnO8RKeEB5k9ZbeOufEPFIoftm+FDdQ0KoXDog?=
 =?us-ascii?Q?bvp32mfjB47Z96FsX89aK9nDhsBleFOvGnM0AYqQRk5OGxiWE1jwNIztOjD7?=
 =?us-ascii?Q?B8gB6pb+McdrO/i023S2iYN2TwEy0W3/iwD/pRlbGjfY88cAtzT4kpU9sQTd?=
 =?us-ascii?Q?y9qa02hqX0EwGazHHUP0Ysd9mvt49U8Sz11fOIx9brtv4dK5QkRAHW+/T8zI?=
 =?us-ascii?Q?GLgnF6yINg6a04ntKLS/1OWr8GXUCWQYgVdGSR7Z6yoOcNiFfDfPowaL1Rrw?=
 =?us-ascii?Q?IY7Ee1H1ZYQKk/87rSja82VipJ04vbTX2Cnln72Tg8SEvpXC0NvMDBJ2e3DY?=
 =?us-ascii?Q?U1OPQgTvJ3r98akAtRbA8fD+P4kXcTCsb5w7oZCWoLmzhzU0f/7f3mJ2cPGq?=
 =?us-ascii?Q?W5hTxv/+p1+l0n9rF4P+4q8l7wAJQoCYhrW0KqUvv4FSq78/3wnl7l/qR0Ky?=
 =?us-ascii?Q?i+lXJyaJ0iVXbQpcUK45YqShn9O9CtWxUjnD/Fs6fZcgCdnTjL7SZ9u/f+WW?=
 =?us-ascii?Q?pcKAUUi7O+YG/wU2vaFLZW5aCEJ/Dncm5m1QTzfLnA8ibOnt51nZKfArk/2U?=
 =?us-ascii?Q?8U7REMCUNy1yTQ97/8T+3c4o/XF1spY2nBjqg/fNlN1OgTTRxZCUJEU1dQE7?=
 =?us-ascii?Q?5mdYn3bmiB3X549eonH1jy2YOe86d77B7hNjgfonWYfg3PM3IjbW3RCfrTKR?=
 =?us-ascii?Q?7f8w79Mx1YFJtzgbZxSiF07SRh5R2dUmvx/SaXyf5nGeefRVJsc3Xfk/tCyO?=
 =?us-ascii?Q?ET5NmAaTIpO4UY61oEoW+EXVzNROjbOEaYFm1p+etHfUSlavAW51oHAYERqw?=
 =?us-ascii?Q?iVsh5j/FJp8=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB10201.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?hvYr2jG7YZpeof5ewaDeFflG53ufWV2j5V6gY6zi6OnfVpgTEWpFL/65QOrn?=
 =?us-ascii?Q?8yfm85+nhTUSqCpLIBn+oBjT6fqLqriBd64IG2Re8/x8Ks8Osa6C61lK56AH?=
 =?us-ascii?Q?U5AxhrGyRhGd7SWa2Xn1KSsbFw/iygHtwz/KA6rMK9q5xx7ZzKXjGJ+VucWG?=
 =?us-ascii?Q?70+bCj9sMiWfDcPcc3u+q2V0QRcAEj5e6mUgKn3txkROGyILequcazSoC0u5?=
 =?us-ascii?Q?Abyz2E+QjlTv1dGqcQaWDfwWIfWgev/3IFtPet7BXKbMD6/h+8edG//Tml+F?=
 =?us-ascii?Q?rHbKt8c9KIYQHzkx1nAj+E3tn9fnlyVz7mjM5hJYL6kNZKppoYxtIiSl3Wgk?=
 =?us-ascii?Q?J4g7hvSO5lOId2PkmprPW56166sLEvrHo+79ZHhPtMTryuTKlen86sPPjfeE?=
 =?us-ascii?Q?HCg6RdbtwmPixYmYZtteBeTgzCP3ESg3vg3kT1nXUFvXrHa7QYwiwExCTyVE?=
 =?us-ascii?Q?g6jguj34WGSGYEYHPlfOa3LiJitqRNCi4SRARo0UxbMGVEjbMssXdHzD8ji8?=
 =?us-ascii?Q?J7fHJvrxMD+/PkhLvC4xdMCncMdvDd+1BSZkdVfLJrgIVQlXi4/d+75zMttj?=
 =?us-ascii?Q?CvO0eolTbxAAfmN3U6daNjk3oH9U9G/wxINhqJN+dXtwAT/zqcwUdSCfWKY6?=
 =?us-ascii?Q?TdN6N+OknETsG9EUTikefZqrSq0cZLGLjEYBUQuDcVZ6bxvvwDK7GY4oLJBA?=
 =?us-ascii?Q?1c0xFalVXj6Ryl+uk/tEasSJU8QUXj364JWL9rE+2P9ha5Fa+QYu1JHxAb1w?=
 =?us-ascii?Q?EODPERNLh0uVhyrTB118TOa1znnbDJYdy4AkfOHYGgzd8Jmlxkbj+Tnzzusf?=
 =?us-ascii?Q?UjW9H5fu+JupsZARwQLYLsKwI3lEfh16HlJ/STXVkTm0zqoo8STwOAd3VS6M?=
 =?us-ascii?Q?e54eENvM4lWlpjFl9uG1svGalESYLirvuRrmb5fkqvfw0qKKT4mOFRI5WrSm?=
 =?us-ascii?Q?MR4BFsY0/nJrM+xJ8hNi5xfY/LzPMZsK4ZOpk0GRPo4aqQRaF/rlU62aY6cY?=
 =?us-ascii?Q?WjjfOlpdemPJbY/H5XZOH9p8CrFXFfNY06GnoCElxJV1PRzWEIwb/IjoYhDz?=
 =?us-ascii?Q?rVYzNZ7FZQEU+kaZIM9WGi+NcmhHbZ4+RLgLTxU4dJXd+J6PHOLDHnoK7fKp?=
 =?us-ascii?Q?D/44XXL7ZEx3r/Wz2Y1NJT7Dy8UxF7Sde9jVnTPA0xdZg9GZQ3pcun7S8SEz?=
 =?us-ascii?Q?ERr5ugJBR+OFwCt3xNAnS92OcrVJxtHrF9Y1x8isDa13OCjO+4VAOb9GrGM5?=
 =?us-ascii?Q?S5eEw9aLB/blHV7h1WuSSrpOR0W0rKgaJdXTZ9zKiAyaN/tTJtIBZWyULAsV?=
 =?us-ascii?Q?aa6Hen5GpIx3g6OHxcAGcgPsqigcVXWu9Vuxnv1KFVNZApGoHDza8UdAMdAZ?=
 =?us-ascii?Q?H2soK2IvlJ+qse38+H5d/v5yrzlstHjZ2A49FHLZn6xsTHqkfDcDQ8hgMTFx?=
 =?us-ascii?Q?NfUOn3kfuFcsVw7R65JrrNxvzC2BUmri58+97AfqxVneKSkWvysbjCNlJW2p?=
 =?us-ascii?Q?dxfDvRZlDeaCOlY+NPBCotJN0uGEtET39hixAO0rMv+3mGZTN6mBEA6h/xpO?=
 =?us-ascii?Q?K6Dq2sCp2t+CmlwzqsI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB10201.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f403df4-4351-4bf3-4ee1-08dda3482520
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2025 09:14:01.1850
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oYm/oPOMvX/wW5K+n02rw0x/8osc6en98gExU61U8gLHCcIiIvIgkPGmH2c2LL9O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB5925
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 09:14:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217894

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Yoann Congal via lists.openembedded.org
> Sent: den 3 juni 2025 23:59
> To: openembedded-core@lists.openembedded.org
> Cc: Yoann Congal <yoann.congal@smile.fr>; Guillaume Swaenepoel <guillaume=
.swaenepoel@smile.fr>
> Subject: [OE-core] [PATCH] reproducible: allow each layer to define its k=
nown non-repro packages
>=20
> From: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
>=20
> With this change, layers can use a conf/include/known_non_repro.inc file
> to extend the KNOWN_NON_REPRO_PACKAGES_LIST variable with its own known
> non-reproducible packages to make them automatically excluded from the
> reproducible test.
>=20
> Example of usage, in conf/include/known_non_repro.inc:
>   KNOWN_NON_REPRO_PACKAGES_LIST +=3D " \
>         this-package-is-not-reproducible \
>   "
>=20
> This uses the new "include_all" in the reproducible test and will move
> the maintenance burden from AB config[0] to the layers themselves.
>=20
> Fixes [YOCTO #15699]
>=20
> [0]: https://git.yoctoproject.org/yocto-autobuilder-helper/tree/config.js=
on#n343
>=20
> Co-Developed-by: Yoann Congal <yoann.congal@smile.fr>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> Signed-off-by: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
> ---
>  meta/lib/oeqa/selftest/cases/reproducible.py | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa=
/selftest/cases/reproducible.py
> index f06027cb03..e2c3a10f06 100644
> --- a/meta/lib/oeqa/selftest/cases/reproducible.py
> +++ b/meta/lib/oeqa/selftest/cases/reproducible.py
> @@ -14,6 +14,7 @@ import shutil
>  import stat
>  import os
>  import datetime
> +import oeqa.utils.ftools as ftools
>=20
>  exclude_packages =3D [
>  	]
> @@ -158,6 +159,12 @@ class ReproducibleTests(OESelftestTestCase):
>      # reproducible, disable this in your derived test class
>      build_from_sstate =3D True
>=20
> +    @classmethod
> +    def setUpClass(cls):
> +        super().setUpClass()
> +        ftools.append_file(os.path.join(cls.builddir, "conf/local.conf")=
, \
> +             "\ninclude_all conf/include/known_non_repro.inc\n")
> +
>      def setUpLocal(self):
>          super().setUpLocal()
>          needed_vars =3D [
> @@ -170,6 +177,7 @@ class ReproducibleTests(OESelftestTestCase):
>              'OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS',
>              'OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES',
>              'OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS',
> +            'KNOWN_NON_REPRO_PACKAGES_LIST',

Why do you need a new variable? Isn't this what=20
OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES is used for?

>          ]
>          bb_vars =3D get_bb_vars(needed_vars)
>          for v in needed_vars:
> @@ -189,6 +197,10 @@ class ReproducibleTests(OESelftestTestCase):
>              for leaf_recipe in bb_vars['OEQA_REPRODUCIBLE_TEST_LEAF_TARG=
ETS'].split():
>                  self.sstate_targets.extend(get_bb_var('DEPENDS', leaf_re=
cipe).split())
>=20
> +        # Apply exclusion from layers (conf/include/known_non_repro.inc =
files)
> +        if bb_vars['KNOWN_NON_REPRO_PACKAGES_LIST']:
> +            self.oeqa_reproducible_excluded_packages =3D (self.oeqa_repr=
oducible_excluded_packages or "") + bb_vars['KNOWN_NON_REPRO_PACKAGES_LIST'=
]
> +
>          self.extraresults =3D {}
>          self.extraresults.setdefault('reproducible', {}).setdefault('fil=
es', {})
>=20

//Peter


