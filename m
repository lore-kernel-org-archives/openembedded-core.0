Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6636DC4167B
	for <webhook@archiver.kernel.org>; Sat,  9 Dec 2023 01:42:11 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.53])
 by mx.groups.io with SMTP id smtpd.web10.1605.1702086128438887485
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 17:42:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=G1evLgIZ;
 spf=pass (domain: axis.com, ip: 40.107.104.53, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VtfHgcosY2cYseluuWfc6SpYBR12Du0wFxfE8bQenCdSd/tisEUZxmF7Ie1qsFpM8KM4J7Mh0wU6+FS8MpanwB0WF+wHnnFif7P7iuRuevh3M5GVnnFxZFyFsdNkUL67HSV/xtq4chwo+zP1mGj8JDRucz30jrX5JYo/rwnPjz2HZXig7Ooo9dscj3jCTtApOWAgG11ZZidENaXMWkz0jbpMfGr8tDfFT+0FDR0g/hueejZhULbStCX/dGR41icFlxJvIE1Np/xJwjy5PWEfi+KzsPqMO06MzYsBFFaVZhQKLYE8BULUYm3TUVQ2MTc2RDSEX7jat4xDuL1s8Aza5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9xwur/gJpBZHbxEmpVF5tV17zYlPlaJu3mQO3dQiHuA=;
 b=gVBj9mIkAgYpj8dTxQcbwqNefXOhK5FzW25eE6L9fZHKpEFEYGBZWLApBcYJ1MSkJxLQOwP5J8w+U1K07a9kmxp9+rm2Hie2LY25HGZc1bsuk1Exz9NYTjuwNFKrl/JmIC5PRX0vRfMwquLL+4Ou/hkFUGNul6HX3y77n+0nuRMSrxYc54XKcSMCd9+MsgvHAF33G2f1bOaCv3poJ7kPvApmTNTPbIlmThP+6nWcwV9Ed6n85eRwolZHCchngSh5U3HLKhoJFKfC/t99qOc/3dgJ7Ncd+X4jnOO0WeozpS+tSMvXbMaAOjIRE89zfsMaeu4E8SwrTUIkGhq54+RmYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xwur/gJpBZHbxEmpVF5tV17zYlPlaJu3mQO3dQiHuA=;
 b=G1evLgIZOEIOi8YYMvOD2oyMcPmvyxxP44Swgc/YXAn9VOnG5/inNYQgR7VWbABEHx10OnMyDGitZBiVGgKkdjqFzvtoOkNV+Jnqne11NZvzBGwM3PPnklrm3YarOSuXbQ6Wxd7P2Ihdzp4tduDRANsWMspIs6PdPrnAt/kwxJc=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AS8PR02MB7381.eurprd02.prod.outlook.com (2603:10a6:20b:3fa::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.29; Sat, 9 Dec
 2023 01:42:05 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::7d13:15f0:2292:6962]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::7d13:15f0:2292:6962%7]) with mapi id 15.20.7068.027; Sat, 9 Dec 2023
 01:42:05 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Tim Orling <ticotimo@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Tim Orling <tim.orling@konsulko.com>
Subject: RE: [OE-core] [PATCH] recipetool: pypi: do not clobber SRC_URI
 checksums
Thread-Topic: [OE-core] [PATCH] recipetool: pypi: do not clobber SRC_URI
 checksums
Thread-Index: AQHaKkBKqhK+eB9N90KXGYDWG1wNTrCgLOmQ
Date: Sat, 9 Dec 2023 01:42:04 +0000
Message-ID: 
 <DB5PR02MB10213DB37BD0F6D9C68427486EF89A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20231209013715.1212333-1-tim.orling@konsulko.com>
In-Reply-To: <20231209013715.1212333-1-tim.orling@konsulko.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AS8PR02MB7381:EE_
x-ms-office365-filtering-correlation-id: 17d587c9-213d-4507-a662-08dbf8580c4b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 zKaRZr+gLyP9DYK/OdgtDMsaMQQQ/24mdfiIf5ibKx7J8IdB0L2IzCgIIJfoq1uSEt38Ugc8do/5hubutV23uw5lIG3cWpwI/YjXyMVajc6GJ//O00dw4sTujbmG4z46U74fmDwOkHcEwJqIu158ngD0hRTdi2U/HbPIcwq8+lMwN/uZFuYynXIVwq8tWhd3EqgPvy7sAggAcOoTXqDW1iDecfkGEq/mHxWMVME2C9tegcOZLvq2gLZFU7mb+N4W6FaBqC8j8gwhg1sDgc+7U6UomAN39IvrZOy0ncyli19djQOJ9RLzi+unYf3/P8GGQXvyiI4gS3PXkXp0fli0JBOz7JrtmRYBsJs8nvf5/Mr3bsM4nYiwC+Bh98n4kv32Jxtgt5PMKx5ejVvvRr8u+26Vb7XRFy7bdubCbysGG/MQqikqyyX+x+Yxn+52lcdY7sFNr76vKCV4giX0jKfIka1+08hAH3+FbA7Ouj77MyuvpCH+x+cN5ncRO2PXxe1E2c+MHis45ingKQLV+anCgQ7OigzAwYZ0V86u62wADDubfFBllU0X/k4QylBNOji9Uk5XEfLDOvOjmRsu0h7hvZHyHndVmEzviyFDW7bVC+ZOYxFk2kRQAfz22JY/1vZ6
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(366004)(376002)(396003)(136003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(122000001)(38100700002)(4326008)(8676002)(8936002)(5660300002)(44832011)(52536014)(38070700009)(9686003)(478600001)(55016003)(26005)(33656002)(53546011)(6506007)(7696005)(71200400001)(2906002)(41300700001)(86362001)(316002)(66476007)(66446008)(66946007)(64756008)(66556008)(83380400001)(76116006)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?RMdK5Dd2nsKYEFHcudK0WT1QsRIwxKCIP+MfQgjq68HcaETGmo34qyWvS8Y6?=
 =?us-ascii?Q?7Lcar5XXlUAaX927cD6EKLrOJ6G7pjeD3+1T+qUwLAdM1T3wKZK7DSHTOBCf?=
 =?us-ascii?Q?R4gzn7arO9zvhJm8ld93AzOc0/h4UDjdgLrbB32fOzQeGXvYcTeIe8aQridN?=
 =?us-ascii?Q?jkDcnGj5D0NP+dWwwECxnmsdZYSp9dAVpKfZ8FYF775p7fwErBZkYVDGOyVZ?=
 =?us-ascii?Q?ki1O4qlH3FKhGTH/iP6EnWNDsGya6SSgTGncqv8MDDjA7mGUJOr7k7MDImqc?=
 =?us-ascii?Q?oUKIEu246CYonMT5tztGlUZbA6YIEMc7e9LIrPa3LUt5PTjiJSEgH7YEr5I2?=
 =?us-ascii?Q?TiCM6FZQs3U2pRmrRCOpsyhPzCEj7pqOtITk0Bx9WtN9n55EBWQpWHrDwtH2?=
 =?us-ascii?Q?Xt+M4F/t40ju2uTY5XvMHFTSuKElp9QT8OAcDEDPU8LMWhYeOEebsMy0DbWR?=
 =?us-ascii?Q?Jn8UQULsQC78OZpnS4ZxijiAueqigUhvLtpvLSqR5FZaKGwgvAxmFUcPGa+8?=
 =?us-ascii?Q?Ls2x5m+Hk7JxtmNtTznpZQyIRxmJdgg/V5jqcT7Jam+rpOM5GxqzdwSxWGMB?=
 =?us-ascii?Q?/1lVGfo1MLALDlq1vKi3nU4xlH3X1zxJCwe7nMFWNWwM9U5fAwK91WThWfTk?=
 =?us-ascii?Q?Q/Hor23HF/xwKck6TfH6WHiHbhDIOO1plUgsRLHW1Zekq4V9jvo+NXacudM0?=
 =?us-ascii?Q?DOXb476odCMscVNwl5azLvWgVVVqp8a4NlJ458YZ+atA9IWYNiJj+KlgLdh4?=
 =?us-ascii?Q?tqveuqO4dx3GBjs6EX/ZEFFKxL4V/LRe0GLoy7CN2pdR0CAAdfsMM4Rq5NJM?=
 =?us-ascii?Q?4tIJrCSmTJ6TiJlrMLSyGOpJGtZofyOlr7MVSdFwJ94bNnlE6JwTWlz9PyAV?=
 =?us-ascii?Q?cjm99BNRFgXI2SJINgdjyaCIeHccqgUuzKLjcq1nI7dKdSwLH+XvSkBRQR6a?=
 =?us-ascii?Q?4WiM74LVLzGNPCnrqbY+7GvFI8Ozf4sA/tTL6O8i/ObmMUzxxtssoPykCb6C?=
 =?us-ascii?Q?wbYr5qoUmPSSzk//t2jlQuxOu2u7mWqqiqWVzTeTe1+Ge4BHzpn8MS9OpGCB?=
 =?us-ascii?Q?Q6Pv7HP3E7hiLJ9SArTNCYUPOH4C2B8FuUGt75UUugAcQdmyD8vZhfL1yxFl?=
 =?us-ascii?Q?5SEjaYJbwE2X5+JhqRAvBfmmPLrVb9ca+p1VvHM6al06cnPer9mD19UShfMc?=
 =?us-ascii?Q?lmMbQcliaCXcB5CKNdGJPG7E8Q+iXLMnIcBaTgUL5CVUx9254WVM5nLtUMVA?=
 =?us-ascii?Q?A55msJTfhHIQ9lNNK5MtO/jalqK/2/okBE45x5w/L3YIymvTSmN++R8+W7fA?=
 =?us-ascii?Q?ZON9O4LEA0IaOVtwyep6oo450FiIAmPXXtuz2/HtjogeM8EMJU80bhiBq5mq?=
 =?us-ascii?Q?rcgY5Z+LjhzrjGuT1FAq6FFK9Gi1wlngg5H07yjAXtT4/NNW1J7Ktyxuky7/?=
 =?us-ascii?Q?i+w3uEDYOlJQM176jo0tAggT0AAIdUuE4+hUXPfwqDsl1HE8VrWRxX20o6b/?=
 =?us-ascii?Q?bsvAcauBXtjfx6uY5FRsdl0vW6g1u2jlSVblPSxMSqYPxhh4Mj1BWURkfazB?=
 =?us-ascii?Q?RXlba2YYkUXNnINQnTw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17d587c9-213d-4507-a662-08dbf8580c4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2023 01:42:05.0040
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ClZj5Zhy1JCAXPnMBb4+d/DfLjGDskQY6zWJzEkzJmT5YyKSNNz5mZZU3y4Kj5W5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB7381
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Dec 2023 01:42:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192095

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Tim Orling
> Sent: den 9 december 2023 02:37
> To: openembedded-core@lists.openembedded.org
> Cc: Tim Orling <tim.orling@konsulko.com>
> Subject: [OE-core] [PATCH] recipetool: pypi: do not clobber SRC_URI check=
sums
>=20
> The pypi change:
> "85a2a6f68af recipetool: create_buildsys_python: add pypi support"
> deleted all the SRC_URI variables, including the SRC_URI checksums.
> These are not generated by the pypi.bbclass (how could they be trusted?)
>=20
> Without the checksum(s), we are vulnerable to a man-in-the-middle attack
> and zero checks on the validity of the downloaded tarball from pypi.org.
>=20
> Fix by only setting S and SRC_URI to None.
>=20
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
>  scripts/lib/recipetool/create_buildsys_python.py | 5 -----
>  1 file changed, 5 deletions(-)
>=20
> diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/l=
ib/recipetool/create_buildsys_python.py
> index 5e07222ece1..66de36ba3e4 100644
> --- a/scripts/lib/recipetool/create_buildsys_python.py
> +++ b/scripts/lib/recipetool/create_buildsys_python.py
> @@ -172,11 +172,6 @@ class PythonRecipeHandler(RecipeHandler):
>              # extravalues['SRC_URI(?:\[.*?\])?'] =3D None

The TODO comment above should also be removed as it should not be done.

>              extravalues['S'] =3D None
>              extravalues['SRC_URI'] =3D None
> -            extravalues['SRC_URI[md5sum]'] =3D None
> -            extravalues['SRC_URI[sha1sum]'] =3D None
> -            extravalues['SRC_URI[sha256sum]'] =3D None
> -            extravalues['SRC_URI[sha384sum]'] =3D None
> -            extravalues['SRC_URI[sha512sum]'] =3D None
>=20
>              classes.append('pypi')
>=20
> --
> 2.34.1

//Peter


