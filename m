Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4E51CD3427
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 11:52:19 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.6])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9767.1778154734987660705
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 04:52:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=EBsKUGOS;
 spf=pass (domain: axis.com, ip: 40.107.159.6, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kEqhrZN571VGjmmwf2qyEDP9qpNoce6uYxanJ1U88jZjWg+2uFaS79UfxcBXIY5JtJydJeryDQEYJjW79dDpe4U+HLtwJRgNp5on5w2WJGSrQdSJNv0B/OKACBKwp7Ewnel9XcK1roKF0G03VKIYtN6j5DK9um3QxdNuZzEbLLrmeb05Q8i/ZchBt5idhrxMWs04Yg+ak5OttEx/VApSeX69HbSO/qAE8JsMqKfvhHVcWa51Pdqd73+LSLh76H54CxaTBuMFNWDkYBgV/a5D7qX3OkZV0mkYMXvhS9dcCKb4FyVViM01a5Aon1Wrx3mdCA+XONUsglAbaBiH0M8BEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QU8sc77GOd9xuZbJRKMDWDNYf08dW8CaDilFfP91A54=;
 b=YvhMELFQCT1pO8HBzxMsm4UPUZ8fpjYb5AqXqIEhjP5n6nBzLawssKD4nugKpUoyPQnXrq+9uRk5rQRmOUPXlYY/g3xQJF7fR1LGNbP/PWQ2J5q7B9xgGVwmmviMHrfRpVfr0gsozCgPxI3KsAPDe1fBcWmIM0SRlZ7Wb2qjrj10NfYKAuAEpuDLy7HXLnI7WoiYpEqauetis7d6EGGBXQ6NGtbg3OL/jPq93lSZ5Xjn1voDlYmM40N49x+EkcEFIfR7rTdlikgAMVb3qv4QzR+LbshkznDgczt9VbjKWuNHXk26tpWsCcZU3ZuVUvRo622KHwgHVD7Atpz7xU9fkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QU8sc77GOd9xuZbJRKMDWDNYf08dW8CaDilFfP91A54=;
 b=EBsKUGOSe3WO92AGLsk2xiaLgN/Oa7V/gRvZ+jb4Rh3aGgqjZq4xd9AEue4THT+IGzbXqBxiNNhGKupXSZIhbE2AWqDEcbn9qbecPEp9Cx6TWPoYAWqdmLiXftm8EtPz9qidOW3WUymJtJtEV3q7xuOKk5csH8pGoRS/N7sjY68=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DU4PR02MB11806.eurprd02.prod.outlook.com (2603:10a6:10:63c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 11:52:11 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd%5]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 11:52:11 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "j-sahu@ti.com" <j-sahu@ti.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH][master] useradd: use --root for groupmems which
 lacks --prefix support
Thread-Topic: [OE-core] [PATCH][master] useradd: use --root for groupmems
 which lacks --prefix support
Thread-Index: AQHc3hZoMQIypkxEEE24K4F0uAn+5LYCcs1Q
Date: Thu, 7 May 2026 11:52:11 +0000
Message-ID: 
 <DB5PR02MB102135CB5842941FAF9B1271FEF3C2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20260507114043.481583-1-j-sahu@ti.com>
In-Reply-To: <20260507114043.481583-1-j-sahu@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DU4PR02MB11806:EE_
x-ms-office365-filtering-correlation-id: 470efd36-bb02-4391-b49c-08deac2f12d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info: 
 rEn4YT95NnLWaYa3DvvuRd1t8Oh1nFLxO03rUdMxiIbxupOZd8MCW9VgJgWzUKYJ2YcekUE/pOlOkeVFFlKe5lFs2ExTN9VzPUG8VZkNf/cGkCJR55noFpS42o0hY+H4aGTTrUqeRZWb/9vPDG0AbKeTIxq8iC/clfpxSC0+isE8t+afKsGdof5LqzFsXKGN7pNWz6rj5wbf/5OFujrpTL7SDIrdX5Nd5qcy66h6Gh5gzsDfUibb8u5661wpR8R5cCrNmp5zupZq5gtJZslYfNuV2c4693VQ+mCFEg4M85vHD1Mu3ULFxAKj22JP7VvQ37MJHquH9lIQgskmJ/lEy77Gn1bw++rbyDygVKFRPQ9HHURYkZ1cLDYUqt1QxoWJdEo3weKjqBSg3QV38siyavwBEBo0Lqs6YK2PQGPLWamw3RDBvfsEINwjgEmfzDW1DsLHxKcnNpNpWy4xawBipIm98TaP/VqG2UywbPjGP29JSv1VDW9vqXa1V8X5uPxMDlJdN0kImM+qpe9OGGkkKCJg1Tjr0TCGCer0Dj6IVAwkxWS0ZIszp/5LSg4rFVwJvzRT7tflGmBWU83v4KCGqELMnCJCQhiZuX6zKsiqN3z4qldiyLUqSMdMvsG8kV7pdHGJv1fzP26WKbbAiXsB39GwSF8Ga4R8wccG1CcMP2BeZrZyG+EWr4hv6FlKTntYo2aPR3dJKYwmPrTskMX9Dg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?XXfLXfvxepXmgv1JgSFU2b3BM91TzDxkZKWLp0ESsbIJaAZwMM7uZX9BwZhx?=
 =?us-ascii?Q?REIvKNOaT2lwoidWf8WCD5/9psGa0nXvUyC+y4wmPGrI/sI8xq8+Zaw/NhQR?=
 =?us-ascii?Q?ZB3mzqqGXca3O2TxYyS9zNZgW8R1s73TwrCtGbAxLZ0jJtKue/QS9LfPyEyb?=
 =?us-ascii?Q?WCfgwzfdKeLqIA3HVaaJ2RlUnUkY2xTWUDRzCoKdq5kjta0srWoFauWicmiA?=
 =?us-ascii?Q?/UuEJqEF9hl8Qv4U5jSs06KXqIfz6tUu+US/wVR7okKwnTiZo3Ww3RW3CTXu?=
 =?us-ascii?Q?mSxJjm4InfMOi4Z3uDvZRaq3H+ozCv+R4uUXpKm/GeCU4UGYy6EzQheoDMI0?=
 =?us-ascii?Q?HLcYQKmnTA+gGwr0s3aaNbeDGW16DaTKCVKZFS09PJyEwLFptDsvqo18HBTd?=
 =?us-ascii?Q?o2kyO67Mbu24jg5GSYa6O1Qzd7Gjre276VdvbnrggSooUSntlr/AnFCdGg2z?=
 =?us-ascii?Q?rS4Uea47OC/P/b/JCv1FXPeBpc2QUYJPotcu+nrll53dL/oiQMudZpzKjZc+?=
 =?us-ascii?Q?/Eq3fdwLgI2ys0JwR0m5pIZHk3VogqW7bK2AdOToKaczvu/MNGxkRUQXIOQX?=
 =?us-ascii?Q?UB184UQR5XeUixpFylmknJ8PU9xFX5tP1v7auZZcw9uv5EAXf8jWaai7hrcY?=
 =?us-ascii?Q?JpsBrgn8uqA8J5cmh82EoxpKoYqASSUqdJyfpzYsyn7QllPN4gV2ZfM9aDYn?=
 =?us-ascii?Q?DG8dM1y2DAe3iST9A3O4yobhpCPHVnCPefKiKfJ25OS2otJ+Z499M6qY/Oe8?=
 =?us-ascii?Q?xsZ8bvhrHv0OxNm+TUyz3uEs3bS6kNf9Sj+bAIzSz56VyuoNWs1t9NXPGCZ2?=
 =?us-ascii?Q?Z8cSy4o1jzf6uLU0gVckDuXpcWrnNriejSBalHjBrDTXyF63tozJ0pK8KOi8?=
 =?us-ascii?Q?TQTqQ3GnRo2VZ6yEdp4U7FbL4oa3Y72BSHOHoMJMjM3yycRlmsCZI2mo0Hca?=
 =?us-ascii?Q?UlvxpTjkwapVI2oThEFhYmUzj84H9hYQiufJgCDw36ZQwib/3GTZ4YrADac0?=
 =?us-ascii?Q?wFXn2vFSSf0j2P2qFzWX+SD8ItGmpRXjT0GqzGJ2eDvpSsrPuEql3NHRNQbJ?=
 =?us-ascii?Q?DCgRTFyGfK0vFcOatyCNCFvWcgvSEC6M/cM2DuRlpkWh2GdqY2UgknwQceX3?=
 =?us-ascii?Q?89XO5V/M5w10mO3zbml+DA9Z8yvvXmLd2UjLMvPWWro0R2gP4OyXwMl+X4kY?=
 =?us-ascii?Q?uEa9SmNSa/ExBL/M23J8KR1TJW4wYlzn+RT5FC2mR29GXRJdQxWIMcuv7z+h?=
 =?us-ascii?Q?GA6WMJ7B5zwg87F+O8RpT0jNBYRtzZ6jMQjFonwVtqEflrJoH+ogqL6af8YA?=
 =?us-ascii?Q?1yQsmo960YI92AixyOqaPtLQbmNBcmgvbCXFVeALs3HWwiC4NoGqgR4saiKc?=
 =?us-ascii?Q?EuSHo1A+ddsVR1BzyLelmARhdnFWT1mYfohNG3A4pX+8p46J0xKT5/AjLWDv?=
 =?us-ascii?Q?qswHmXeWpkY4gq7QEAjUPXYDceeyAkz0a0CaxPjMI8CpK8h8P7WelXOmB44g?=
 =?us-ascii?Q?ENcSElFjt2cprDwGeIBVp7v+D8I3hsBo9YsFDhINMdxsOCeyJOlqH9f7hUH+?=
 =?us-ascii?Q?jTOSGK53/J+Nm6lRynguZ6DZ5klE+6iu9g9uPzF/r4RcyIddody3k65OZE0G?=
 =?us-ascii?Q?KI5Ji8mE6LAyt493UrMgdogFF2z6weP1RCo5EAuHANIXqaFw1DdqJDMBQHyH?=
 =?us-ascii?Q?D2RSk9l4eF4H+iUgzH+u+conKfo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 470efd36-bb02-4391-b49c-08deac2f12d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2026 11:52:11.2222
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gHoVHGzESWVE03jbGBMbacJOL6NJI+qUFuuf9B1nRYgbjm+QfVPYQUdEXecd+AOJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR02MB11806
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 11:52:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236584

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Jeevan via lists.openembedded.org
> Sent: den 7 maj 2026 13:41
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH][master] useradd: use --root for groupmems whic=
h lacks --prefix support
>=20
> groupmems in shadow does not support --prefix (unlike useradd, groupadd,
> usermod). Only -R/--root is recognized. Recent commit [0] switched the
> global OPT to --prefix, breaking any recipe using GROUPMEMS_PARAM with
> "unrecognized option '--prefix'" at do_prepare_recipe_sysroot.
>=20
> Introduce GROUPMEMS_OPT=3D"--root $D" used exclusively in the groupmems
> loop, keeping OPT=3D"--prefix $D" unchanged for all other shadow ops.
>=20
> [0]: https://git.openembedded.org/openembedded-core/commit/?id=3Da7b846ba=
7d6d63a5e59939d75d9c5fe3e4cbb0e9
>=20
> Signed-off-by: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
> ---
>  meta/classes/useradd.bbclass | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
> index d7ed6cb931..6738ad12f4 100644
> --- a/meta/classes/useradd.bbclass
> +++ b/meta/classes/useradd.bbclass
> @@ -22,11 +22,15 @@ PACKAGE_WRITE_DEPS +=3D "shadow-native"
>  useradd_preinst () {
>  OPT=3D""
>  SYSROOT=3D""
> +GROUPMEMS_OPT=3D""
>=20
>  if test "x$D" !=3D "x"; then
>  	# Installing into a sysroot
>  	SYSROOT=3D"$D"
>  	OPT=3D"--prefix $D"
> +	# groupmems does not support --prefix (unlike useradd/groupadd/usermod)=
,
> +	# only -R/--root is recognized. Use --root specifically for groupmems.
> +	GROUPMEMS_OPT=3D"--root $D"
>=20
>  	# Make sure login.defs is there, this is to make debian package backend=
 work
>  	# correctly while doing rootfs.
> @@ -92,7 +96,7 @@ if test "x`echo $GROUPMEMS_PARAM | tr -d '[:space:]'`" =
!=3D "x"; then
>  	opts=3D`echo "$GROUPMEMS_PARAM" | cut -d ';' -f 1 | sed -e 's#[ \t]*$##=
'`
>  	remaining=3D`echo "$GROUPMEMS_PARAM" | cut -d ';' -f 2- | sed -e 's#[ \=
t]*$##'`
>  	while test "x$opts" !=3D "x"; do
> -		perform_groupmems "$SYSROOT" "$OPT $opts"
> +		perform_groupmems "$SYSROOT" "$GROUPMEMS_OPT $opts"
>  		if test "x$opts" =3D "x$remaining"; then
>  			break
>  		fi
> --
> 2.34.1

There is a Bugzilla issue for this: https://bugzilla.yoctoproject.org/show_=
bug.cgi?id=3D16277

Since the groupmems command has actually been removed in newer versions=20
of shadow, the proper solution is actually to switch to using the usermod=20
command instead. I am working on it...

//Peter


