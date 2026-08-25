Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD5F7C61DBD
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 18:33:23 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.58])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28932.1787682796787293302
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 11:33:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=Q2KDAbnk;
 spf=pass (domain: axis.com, ip: 52.101.72.58, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xmZypCk0FYpiiA81DWR57y0dKydBpZ8ax0NNhIcICvOuEv91rXAfbmckynGBnMtHELFDP+RCJ2irCMkLZFTBqeCHX1xasckMzSBLP6DC4JJQFrmJ6bsYT5W6OUzUZg0IQ0DlTY6DSG+H202gi8WH6iaa3o9bnS+jMskp4uLnUx5WqVWhZPJTCLMazsxWR1tW19hPpGs6Zkc8drNRPXzI7n49oUqtynGxsxbsd7kJ2FkhzqFHz7rO0o3y7mSwG2rEDUPy9bhSrg1/DwD6U+F/R83OLvKLRVtzZmYY5D1gmOsRdH7uRcIazaqiWzgQO45q32aVPf+f/GrA3w5Z+834YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Spx7BYdSfmLYbFySUTh+7JH7AFLk96+Jbfn/8q5OtJQ=;
 b=HrXkbjD+/nQEus4c1e3zwznXzrKPFnis7EIobyuw93N2jL+z/LdQizFnN9Lyei/TUMlH3X+cqTSwtgMGM1prUV4cpQKofI8cO6BfCnY47jjbcOkHlrExl5oH0fP2d0CxJFISiKGzMXpFAr/NL/u2QjDTo4rTnTtMYE04A+py9mXJFYpFoXB3kwQ4bnZ74s8NR/eKYZaq0aRxeDqRzSYWDacAN24D7aqOTE1PkMg4JwRR2UqwC2ZkUSh07T9iE8vzRgf0v6k/utXLUk/D6n1Aif/fw1Imuushyaa0n+/mz3gpl5/kVlKoZofY+ot5WCjmOzhgzyEyduOIJt6BN8Xkzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Spx7BYdSfmLYbFySUTh+7JH7AFLk96+Jbfn/8q5OtJQ=;
 b=Q2KDAbnk5dOTZ6lzOb1ikrYxGimXhCBDyn+t+V5JEcPLAiia8mHDaOG47EFv3D7GYoTCVTZel9BXe2T3iBSpBz/cpifpK4tlZPnLPPXanofkMesPfuRTNGLeFeZW0MERf0APJYq+PDka5PnWNn4rM15jvcyEXt3OGwQz+tioKWY=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DU4PR02MB11213.eurprd02.prod.outlook.com (2603:10a6:10:5ef::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Tue, 25 Aug
 2026 18:33:13 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd%4]) with mapi id 15.21.0360.006; Tue, 25 Aug 2026
 18:33:12 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "anis.bougrine10@gmail.com" <anis.bougrine10@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "antonin.godard@bootlin.com" <antonin.godard@bootlin.com>,
	"bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>,
	"jose.quaresma@oss.qualcomm.com" <jose.quaresma@oss.qualcomm.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Subject: RE: [OE-core][PATCH v4 0/4] Make signed kernel modules stripped
Thread-Topic: [OE-core][PATCH v4 0/4] Make signed kernel modules stripped
Thread-Index: AQHdMc0QM12w7FGHXEKjMUZ3lBvuibavGcUA
Date: Tue, 25 Aug 2026 18:33:12 +0000
Message-ID: 
 <DB5PR02MB10213BB4092FEDCA3EC3093FAEFAF2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20260822002601.90667-1-anis.bougrine10@gmail.com>
In-Reply-To: <20260822002601.90667-1-anis.bougrine10@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DU4PR02MB11213:EE_
x-ms-office365-filtering-correlation-id: 86285786-d246-4915-eb28-08df02d75221
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10067099003|22082099003|18002099003|11063799006|56012099006|38070700021;
x-microsoft-antispam-message-info: 
 Cntnsd3RU7Vat8Bu1UhP724WtAOSzqOHyzNCPnGqtTwLujdzykQjmMeRiJT/GGeoLJ0Pfy11BYjFXhR12sJEC9vaFNIMp2uQTiF53XNfy2yE7XTnhtonCH8nI3WjCZqnHVG7riEpnNxXwmfsgBj3Hx53HUHSYZOMSEa3OhSthu1k/SETGoOpG8kR/KhP0UnmHh9tF0wBt1AVAVZKgybzxWioXYqkhQPIqiHSiM3BCWSnhvdgguucb5Hgj3FIsizHPtXa+aKS6ibGdTiNZ4dH5S0khXZRbUkMsFHw3fDsmuYtsjebbASxAakKAHzC9Nhsn//2bopGoX6n6vMLoujdG4TBWluQ8dE9cNFx33eN8WOdCy9wG47p1kyksYcrL+moc6ONBv691HcL3dEYKM2XVHkFftTtBsdUCHGjyVfu56o6/k2XKvJPBk9Wu5jA+rDiN0xgxLxWTvwd3wyXsSWnh8QJNTWe6Ib5zxAiJjVTjqCTlUtC2dr4qGBUO2PprUw9fEfw2hVGIFkUmpfNoSvpeJvCIZxBNA186hWFkF0Etq2om/qO8n3LoY+rc+PiqQWopxBh/bMhuQw26I0BHV2tT08KyqgIGqfpe6qXqoos6PJeV71F8+gwsOVnT9X2RnuETdek1vUGUrRMAl3DmUeTcNzA9bn2OciLgfuCPM/9PaQHOOQNV1sNTuzEtzy+wz7t3gPKHeBmFNLIKdOzhZ78TLtz9xSR5CSMtWG4CltzuYE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(22082099003)(18002099003)(11063799006)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?T5Sn6xQ4q1TIz+l/VjS2geKV92vsmztGw64t1Hz19ASn0vK6q7O0n12NLxPT?=
 =?us-ascii?Q?WZL+TCKbsnGZRU7ct4qHDWX+RAIyUaxMwExHprf8ESh6Wg1VFHfzWRWUFMeS?=
 =?us-ascii?Q?6qS9hnjNU43wAJwfW8AHVzD07/BbAjGwzFRX+kkrFR8iH9VHD9ISucMsm29X?=
 =?us-ascii?Q?EeLeOZX3tMT97JEwt0NjoQ1lRK3AknvRIzaWAJPz/m1NAQ1TEMf7/FEJw6Gp?=
 =?us-ascii?Q?AscCdmpi7sB08wj9qWeVfU/CQ/X2kzbwob/BGE/BxAyOoDu0Lruls406BlTX?=
 =?us-ascii?Q?a7TD37/1+aT3IWM31iuNNECyGAlzisp0OStB0jpUWxg9fUaDhrVUDMD+eh5e?=
 =?us-ascii?Q?GxRp2mdIZmYJSzD9S5MKh+J+M+1VraRlJyWpa39T9kafvl0yCciJuJJ0yXOh?=
 =?us-ascii?Q?SPia6v4HPrm8D2xspCsIJUEThUo+dRVF6zcJw87IPn7UYBv6NFuhYx7TCW8/?=
 =?us-ascii?Q?P2jBkzICWLyObT+rVv2KVM8WwUkup0cj+ghYRX4iM+K23OFhbRZvYwJTO8Nb?=
 =?us-ascii?Q?PykR0dnUBO5U7g1ONAuHJdCOBW8G8WXSAkU+xk7uzLrivyXG4+hw1wbOt3P0?=
 =?us-ascii?Q?+Wi+okuojsHKc501XsiuJcCC7hgoO4OiSsK8CaTgaCj2tc5eC24ypZw5FUfC?=
 =?us-ascii?Q?H2JScbE+iasDvGZbJhu8FG6Zz2KU+E3OOV74FfoVh3o2YXSO6X9zme4+56YS?=
 =?us-ascii?Q?vZjtSP/M6g47oFZIk6cVh2N8HtsDLVFcchCeqDoHAQAWtmWBX+3f6qLk5ZDM?=
 =?us-ascii?Q?5tR4vKfeM6l/NVZYOeaMZvUTmoczA5y6C9VVJp1dn51MlnFHCu2wHXPM/lhx?=
 =?us-ascii?Q?BhYNnpuCXsW+aml61HvhOoD3aenhkXgczRE08GNkT467oMIvWQLQBqzCXs6u?=
 =?us-ascii?Q?oYyK+d/VjDWJ1i6oBGWV8hWmh8aXedsqozuYsd45bwIsuOysuGiw9A8AjB7t?=
 =?us-ascii?Q?Z8Am5uaGJxqnTULGwAXGku8SrZTI/tRa9GJyHykW25kESPbAvISZ1xhqD6Vy?=
 =?us-ascii?Q?U3l6GFKr1VYb4waq/3/qdEcGGjdy0TP/kGMUUUVfl1EnYfFvR5UJymv/UvSM?=
 =?us-ascii?Q?AmeoLKTbUqwBza/jFcSS5Nw0jlrVNH6MrvjJjaxjX2f+YdkrcyS9fHBwkITV?=
 =?us-ascii?Q?uUCK7z8w3GTLj8d3JqOgWeZ4wsq5yCz9aAct1HTgzU/TQfM/4jQ8GCe4nZ1S?=
 =?us-ascii?Q?2fh35neyZJQOBR2M2k7xdBrTzG+iA1/2wWkMo1MixoWZgEBVsrh3+qTXdg7i?=
 =?us-ascii?Q?Vi1Gs0BQj0shbta3mAe9vvw7ysAjhJQHVgiD1A0VqOV3W5aFWuJBbemJfhDq?=
 =?us-ascii?Q?3ghRPleDSIbuAgMbvv9c3OsCkM2Ht20xi8KwU1aRh9JZf7lALvSN0IqHDOMA?=
 =?us-ascii?Q?Fav0mAq7UAcfE9ZuA0St0mC9CnLCpD38cq9fGeQNfVRD1NnQWU9eUaDa3VpE?=
 =?us-ascii?Q?3FQDnWmblK8mO2U4GfSGysCnSYImAPBBDhVL7qLJwIo5CZ4gHQ6dGK9/1Fxt?=
 =?us-ascii?Q?ulpZ0mrhJbeX9AaE0pgDRWCKM+1towo+Q44tkxeZka4hcmsD42GzOqT+TIOz?=
 =?us-ascii?Q?O+L+USj1Y2Bb7fH1sRtsJeEB1znOXAYBSltaH32kHXV7WuWuurlElNbbXJXL?=
 =?us-ascii?Q?MIe6fxu36RoVlNkJ0z8P5DCdp9QpRmbXpDyNKpzBUpjUQsrTD4vQHXm1KQf1?=
 =?us-ascii?Q?bC/eB4GmLm3QZMbaCu+yFhgthYE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86285786-d246-4915-eb28-08df02d75221
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2026 18:33:12.7894
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qMkGL83sVPqNjnc7dKXDQPjhIamCNYi+4haBQw8Zq3s+2StvcBdkUIh2mqmH4BZD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR02MB11213
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 18:33:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244255

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Anis Bougrine via lists.openembedded.org
> Sent: den 22 augusti 2026 02:26
> To: openembedded-core@lists.openembedded.org
> Cc: antonin.godard@bootlin.com; bruce.ashfield@gmail.com; jose.quaresma@o=
ss.qualcomm.com; richard.purdie@linuxfoundation.org; Anis Bougrine <anis.bo=
ugrine10@gmail.com>
> Subject: [OE-core][PATCH v4 0/4] Make signed kernel modules stripped
>=20
> - Re-sign modules after the package stripping process.
> - Remove the package-stripping skip for signed modules from package.py.
> - Add MOD_INSTALL_PREFIX variable

Other module related variables in kernel-module-split.bbclass=20
are prefixed with KERNEL_MODULE_ so I think it would be more=20
consistent to name the variable KERNEL_MODULE_INSTALL_PREFIX.

>=20
> Note that this v4 patch drops v3 patch and its relative which have been m=
erged to master-next:
> 3e34657 kernel.bbclass: add strip process for signed kernel modules
> ffc6d51 package: extract debug sources from signed kernel modules
>=20
> Anis Bougrine (4):
>   kernel.bbclass: re-sign kernel modules after package stripping process
>   package.py: remove stripping and splitting skip for signed kernel
>     modules
>   kernel: centralize kernel module installation path in one variable
>   documentation.conf: add documentation for MOD_INSTALL_PREFIX variable
>=20
>  .../kernel-module-split.bbclass               | 23 ++++++++++++++++
>  meta/classes-recipe/kernel.bbclass            | 13 +++++-----
>  meta/conf/documentation.conf                  |  1 +
>  meta/lib/oe/package.py                        | 26 +++----------------
>  4 files changed, 34 insertions(+), 29 deletions(-)
>=20
> --
> 2.50.1 (Apple Git-155)

//Peter



