Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67170C19F32
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 21:32:46 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.63])
 by mx.groups.io with SMTP id smtpd.web10.5382.1741210359691565386
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 13:32:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=LkBGF5Cn;
 spf=pass (domain: axis.com, ip: 40.107.20.63, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G0j+MvAonfwauBNHP6UJsZHEnrlHC7bceao4Z5aKiXNnq4wCDSblwXiLNCj1Dxrt5w4TiBoqEAPsQLxpSxGl3yVtHpdkg9Umbi5j7vIIuVPz7Yl3U/UNiHgmhuL9eg+FZw00Ykch32TyDyaVh7PL1WiSzQZbyKVFTiJVxKtFmZW88Bl/zHEeQDQ5gqZv0tS6cEZSCVHTlwPhwuG8iBq1ekT6QM9i+eIXrOhNfvvW+UNmBC1JeC/JvZaFeIEuAS4NSC5JtfqM7JzljTqMF1J4E4Bfos6Vt8jCkcgrDqs/gMn57RR5EdFTCF6PQ8uou2n8OX2gXMd3WErqy/IHwoQRhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y5vWGG/izpk0r6eSaOB14+S7uaQsMbkyiaykl2BGacU=;
 b=UIprM+roCFgAaDnhV4pILNqj1XwG1ds4FUkLWg8JGAyou8GfH4YbT/gwkMiSwvJ8aefm/h/sM565T6eO3dAVItEpWnuaf7bX9s0T5pQZdvJ2wJDq5nm3SOdOFiEJYKm0XC7GxqhuMM1sq2J+Pwr+iDlbDe1fUhVXVuALFDNtj5edGz6IJ/fS5sIX7U1bdosDm0a4TqnNAs5kyQu+nC/1W59Xt37nTLMWMcZ4RJ/MK+s6u7oB4S0TNGhFhbr3ecYAOqU7mK41SlvqNoISdmclinOMWYGMfo70tpqrRdq4nWcSFBXPCwXTNR46s1Jhpk1QWZGcp4cq6ZCRs9Po9Ji+YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y5vWGG/izpk0r6eSaOB14+S7uaQsMbkyiaykl2BGacU=;
 b=LkBGF5CnVp6NnNnispMQOlAWtyBqt9ZSGoNHy2lLCKxBJ5E/wRZq/su0wc2hy/Nzitybmd0mOiLfE+sM1PyMFrqnFqdKvW2JcA3ZCSZBWT3hJCZ7a9pAjB/HdwUU0KJ53deTZEdpX5TLZkdb3KiYKAXRhFvqZVC/GJwRZEy9CZo=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by PR3PR02MB6284.eurprd02.prod.outlook.com (2603:10a6:102:7f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.18; Wed, 5 Mar
 2025 21:32:36 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%7]) with mapi id 15.20.8511.017; Wed, 5 Mar 2025
 21:32:36 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "ross.burton@arm.com" <ross.burton@arm.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 1/2] weston-init: improve XDG_RUNTIME_DIR
 fallback creation
Thread-Topic: [OE-core] [PATCH 1/2] weston-init: improve XDG_RUNTIME_DIR
 fallback creation
Thread-Index: AQHbjPZcomAs3QpQCUGDyhTJXc31GrNlDc+g
Date: Wed, 5 Mar 2025 21:32:36 +0000
Message-ID: 
 <DB5PR02MB1021330A7564E987F7F2B4947EFCB2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20250304111233.4038622-1-ross.burton@arm.com>
In-Reply-To: <20250304111233.4038622-1-ross.burton@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PR3PR02MB6284:EE_
x-ms-office365-filtering-correlation-id: 0f56cf9f-125e-4864-5150-08dd5c2d3f8f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?0Ww+DDzmTVkY3dyfIDjTAHaZqKTv5yeL+py+4oheOrYDbc9v+G9qP0V5AvVj?=
 =?us-ascii?Q?htfNPKsEIRPE90GsVOY9WeY5yXWSK6V3IrJsFl4DtOHmKFQXbrA9wJMZFUiZ?=
 =?us-ascii?Q?bwa8X2uWaRkq19+ffiweXPE98DDV6Xe1jpJUvX3m2uCS5FanxGZXY0e2bVOl?=
 =?us-ascii?Q?5wnbf7k7XajQA6XhHAO/w1jGiyNW2o8Va++2MQpv/taVn5lxh/rg+XiDddLz?=
 =?us-ascii?Q?pe3G0BzidUvqV8e4WoL4ZsK+bdJgjidfrYWs4KYI1PxZjL55H+kX28f14rTd?=
 =?us-ascii?Q?zicrgim8pGGEMBICeSXLdBO2M7qYcA+IrreQ7RYj1TMtJN0/+MgLmMXfTWPV?=
 =?us-ascii?Q?dbRsGuRAAvB7Aa4oVCKaLGDgr4f6OstDUaGfbbfoaYlSPkcjklP7hN6ay4EM?=
 =?us-ascii?Q?pwYMLbkL/3GGWizFB8fymzskgCIaBJ+WtcQg315jA/LDIuZku1BJR3r5rHiB?=
 =?us-ascii?Q?QUxPkk3KkrL4rdqQGpc4vUE/2CxDJwtDoc43a9eaH7YDSPWDVafCJ3LK/O1O?=
 =?us-ascii?Q?RWH14kybFLkjTHmdSUb0IawSl1X9BgeuTZiQgBspkF+XawBQvx0HAjR3i68F?=
 =?us-ascii?Q?dWcOGbD8iNLm2y4WmBb9ehIyKQ3wq37BtQZwUH9ALMC45pyIgTuzdFl8xZdd?=
 =?us-ascii?Q?KMJxPRNkXLWZaIv+pfj/ES2A7cE0/UHnU1tQ92TBDeAyiJPICJtKje8kxSX2?=
 =?us-ascii?Q?/oqyNtSIjjslihn9d0/gDdhaZg+Y0VWMRp9UFe4jQcWdROMEuLlGbNJ80O5R?=
 =?us-ascii?Q?CDsCrS3eFSof/0TCjLmCoiSGeZXsTi3cYadttF5k02+kvGWjfJxs7Y4Ww1w+?=
 =?us-ascii?Q?vwVY4JXQ4mmuQoJG3Y7QX+cOEt1QH9TPnW1n4YzjT9kBMl5J1TQdh+dUWQzK?=
 =?us-ascii?Q?KoxS9smmHSGwVyv9Adu6w+zjcCPFK2Lznbof3y5eg+uPcWBHuf/03KD+dutC?=
 =?us-ascii?Q?9B1K/qZ0fDgUY34eO34ZZYoi38QPojAzHqh2NQ4MwnHBKbopuVJqj2DlfyL4?=
 =?us-ascii?Q?u0ftVwYVxPvkStD7pZYUUJdrg8EUOs+lVMzR9McEGB2vuZ5+T/9F5gG2/By/?=
 =?us-ascii?Q?SkNFdFa1FeGWar2QH8psHv0m2yYub2qizCcKlrmgcPm0GM2MIEZTCIJNqDV3?=
 =?us-ascii?Q?Bzp4oVI/gk2kh+kOxNPX+pFbqqwsaak60GTTwPNuDZhsXG4p8RLwyFarAhJ+?=
 =?us-ascii?Q?5Xp3RudHbH3say6qKggIXq4IW3m4tr9D0umios73u7sXAa/FUdec6EGSUWNa?=
 =?us-ascii?Q?PqJQ31woYuZOTtN+Fou4S86CZdxS3K7NI32Dwa78eN/8UWCTRbiA7YVWgpVq?=
 =?us-ascii?Q?RbjYtUpnW7T6B71pMGNhuwLpuWBX1B4WtK1YxEmsm+vPHWA9dYtJ1GU3Rhdj?=
 =?us-ascii?Q?VJepP1Cmnr9ULHNtVnnSHMCyi6rCXKG2Ju9eV7qzV+11+lf89ZQVoi90KFFx?=
 =?us-ascii?Q?we4ZOG1xHPU=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?LQ48dSsdULIC/WOUlAsgkYSZwkI/knHiEG47v4J3/m2OR6WlRkIsQZmUS4+8?=
 =?us-ascii?Q?GpRpeqE8pP4pbikdi3R/C5XYZgNaw35YWQ8lp1aq/FIG2AIo1dM1KfD99Ffa?=
 =?us-ascii?Q?k3wrQQoTTRIhChDzihsx5rI3vIVpK5UB5CTb8/iH6I99eweY7WHTNBiHojxN?=
 =?us-ascii?Q?fIk1urKOobcHCB6HQk59Kz8QUCvCwDTYQA9R7KCCTpIOzZ0cuiULDzF/UJin?=
 =?us-ascii?Q?ZKww2JUU9jJkWYjgf0cjUEzBMl2lEf+1OxYR8NrMnrQAbPVrNmyTaE+FBpwp?=
 =?us-ascii?Q?SqE1IJG4EXfVAb62wVe5q+RVNlUHnCbakGgQNSJXrbR3LkPZDAnqFHpRyMhm?=
 =?us-ascii?Q?VA4p1JgFqE7dXK2iLl4/xm3pIH5AhrZmcFST3BCFjrJG1HoK8mkU65x2hgDc?=
 =?us-ascii?Q?ZtgAAaFAIngXgfabBOdKkZOQnKIoaZEMIXO+gfqALYeGfw7x3qxmN4OLtEAo?=
 =?us-ascii?Q?hUxMVv1rpFyphj76Cq0u+kWrlcU56h7OUu2tSett8OwPJZKmdUJQTKNjWF5n?=
 =?us-ascii?Q?JsK52t7DmZsKcvM6+C88HMBlxIEW/BXuznnoeUWwlR3mVuw2MODguj156fkC?=
 =?us-ascii?Q?jyawiI3b8C9g5PqXFxfdgIddC2rLJD6pa+UjeLwvou3sNlPZzsJesBVrWjbi?=
 =?us-ascii?Q?OdqSV2FeptPMQdfUEg5jnv0zAyLncbtfIZohI1o5o7tzqKlNesEpwReuPDBX?=
 =?us-ascii?Q?wqXRMJAh9sFvx4TJRkRb+3oIZk7V/+hrUJNZDHZdRLW4X6Uq3R7SmS55+7dY?=
 =?us-ascii?Q?X2zWpcLJ73AlYDR0ni/x9PLuyFcJh7cQjZaBhOOE0xWjKGNt0mvm/mwYzBTK?=
 =?us-ascii?Q?tJpwIIj8ZxfrT5h44TxwNwRsN0Ue57uCGPyjYcsuj83Q5IEUfA4+FTd1Lytu?=
 =?us-ascii?Q?QHBwunvLP+doaV9wg8eLD5IYBgv5Qk5wNiGXlODmvAOWbtijzJXMMAedTqp2?=
 =?us-ascii?Q?DcciVZBxPGcp9jzYrYxcrHMy/S10Qxi/fB4UKbBzEePqu3W/OxePoH8R7LOC?=
 =?us-ascii?Q?9czDhawItL6dHuHkLWqCJe38fq6AKhK6XloEz+oy8UkKt8/+wmlgxehbttnc?=
 =?us-ascii?Q?AArJ5K76T9/Fc1xf024NFj8F5tV3vIlAskmm3eENlnW4pwOY6KEcDRfRP/P5?=
 =?us-ascii?Q?E7sTBuC4+68KvWbomFA0Igoni3vS0uZsczhmrbqb9Qgo+aT1lPc8BJTi8MV0?=
 =?us-ascii?Q?hY/brLfHI/3xMgMp1KbB+buOxznxT5D4IsicqaVzbnCOzMeRu1/PXelhwMoJ?=
 =?us-ascii?Q?r3vb/Kzu8KElAjoxuXlOZzwU+ECuE5sNTt44LgLC4fY/2F6djVsu4rcF97RB?=
 =?us-ascii?Q?qGhMISNTQV7jkJObY4EpgTOosfVuxsDusQRbZFViCN0QSlA2hUdeZ2AtnD2O?=
 =?us-ascii?Q?GdY3Rm1fMOs2MVqHjVyqpOaRrlxB/koCVf987GSmcujiIEiS+2PhvzLRzkmc?=
 =?us-ascii?Q?OfvHVBp1VPEBuvVN7wgdYRuAuPyxxAwJTrfATi8e+PpeNn4IQduIV7USSgBk?=
 =?us-ascii?Q?yLCBrED6iavvF8/247XmJ7CLLja/3jJMA5L/2xQLqWORQtxDcvFjRNNJkWZd?=
 =?us-ascii?Q?UjOVDGY2QTd6pj4WCKI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f56cf9f-125e-4864-5150-08dd5c2d3f8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2025 21:32:36.5618
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YDJAiFzO2mKwaRXeFwTgyiIMYY3FE8YAlElWcuRJAd3b6TOMUB4H47ASyNyIzgfa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR02MB6284
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 21:32:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212349

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Ross Burton via lists.openembedded.org
> Sent: den 4 mars 2025 12:13
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 1/2] weston-init: improve XDG_RUNTIME_DIR fallb=
ack creation
>=20
> Sanity-check the permissions of the directory already exists, and clean
> up the creation code.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../wayland/weston-init/weston-start          | 21 ++++++++++++-------
>  1 file changed, 13 insertions(+), 8 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/wayland/weston-init/weston-start b/met=
a/recipes-graphics/wayland/weston-init/weston-start
> index 01670cd4f51..3b13a0047a9 100755
> --- a/meta/recipes-graphics/wayland/weston-init/weston-start
> +++ b/meta/recipes-graphics/wayland/weston-init/weston-start
> @@ -58,14 +58,19 @@ fi
>=20
>  if test -z "$XDG_RUNTIME_DIR"; then

For consistency, change to:

if [ -z "$XDG_RUNTIME_DIR" ]; then

>  	export XDG_RUNTIME_DIR=3D/run/user/`id -u ${WESTON_USER}`

For consistency, use $(...) instead of `...`:

	export XDG_RUNTIME_DIR=3D/run/user/$(id -u ${WESTON_USER})

> -	if ! test -d "$XDG_RUNTIME_DIR"; then
> -		mkdir --parents $XDG_RUNTIME_DIR
> -		chmod 0700 $XDG_RUNTIME_DIR
> -	fi
> -	if [ -n "$WESTON_USER" ]
> -	then
> -		chown $WESTON_USER:$WESTON_GROUP $XDG_RUNTIME_DIR
> +	if test -d "$XDG_RUNTIME_DIR"; then

For consistency, change to:

	if [ -d "$XDG_RUNTIME_DIR" ]; then

> +	    # Check permissions on existing directory
> +	    if [ "$(stat -c %u-%a "$XDG_RUNTIME_DIR")" !=3D "$(id -u ${WESTON_U=
SER})-700" ]; then

Inconsistent indentation (spaces instead of tabs).

> +			echo "ERROR: $XDG_RUNTIME_DIR has incorrect permissions"
> +			exit 1
> +		fi
> +	else
> +		mkdir --mode 0700 --parents $XDG_RUNTIME_DIR
> +		if [ -n "$WESTON_USER" ]
> +		then

For consistency, change to:

		if [ -n "$WESTON_USER" ]; then

> +			chown $WESTON_USER:$WESTON_GROUP $XDG_RUNTIME_DIR
> +		fi
>  	fi=09
>  fi
>=20
> -su -c "XDG_RUNTIME_DIR=3D/run/user/`id -u ${WESTON_USER}` weston $weston=
_args --log=3D/tmp/weston.log" $WESTON_USER
> +su -c "XDG_RUNTIME_DIR=3D$XDG_RUNTIME_DIR weston $weston_args --log=3D/t=
mp/weston.log" $WESTON_USER
> --
> 2.43.0

//Peter


