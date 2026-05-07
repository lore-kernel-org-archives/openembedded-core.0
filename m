Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBADBCD343F
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 10:49:37 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8795.1778150973677135334
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 03:49:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=eWM3WJxO;
 spf=pass (domain: axis.com, ip: 52.101.72.57, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JlhZcBh9f27/rCABvQOPAo639fLf7LrPNEWNkrwEPUodON7MoBsEZR/rZaznNH9dMGvPhplZ4Xntfl024dNxS1/Z36aAEQR4177CzXQ0RKf+loeW3X90CTV3mY8bo6yNceDacMnVRD/Ad8S5Ia+1jmOJ6cEGJVhz0ty6wSJpxbb4PkweHHY34p//BpyBuMXaIo5ukb+Nmllj2gAlVMRmSu6dasLuTNWZVgRhKyEghCYz53YzRv4FVSXq3NUAUl9xF+zEeqJK1ZT66wWpde5YFdyid2CkDnJY2dKyrke/ehg4huw7e9kgrSu8JYsD+JXnHWoFH1ulPILJEd4+9DaMWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wPoJlu1KoDfFxUCwsNDqSDDEY2xlIbvT7Bp/9oUNZYA=;
 b=zTK3tCrnhLosb+vC7VGjULR8cfIbAihf3a8cp3lDFEKe4oUrxkgjxs9qu6PkY7j64CROLqTEzIZoSk/E0unZpA/BC5ihYaVtyXBvtiJtmFzCBtoOwACxo3a/Jqb6tp6vQWpKap5Ri+vzRsmSYowXfhHU/IiGkpdgl59uPK7J7i7UE0ieMrbgEaTnIpd29PGEgQ+uRB9BBLhIdRcSZh4z6YZJBy8JORaz0YBIwbchMkMrycOz0p2wZQFIECqe98mHM2IPAx1y+Fx0K1/QSuwQuts7TnV4oXFWhG9U5jWkUUiW0PX8ubQmQCpA79cno0YpcZu4nFkUck94/V3D9rnHGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wPoJlu1KoDfFxUCwsNDqSDDEY2xlIbvT7Bp/9oUNZYA=;
 b=eWM3WJxORlS8BiIjOHTDl3Tc17G22j2xkk4qaNegjfJOq+SObKlnoFb1RLRs/pnkehnkfCCBW1KVabmYnYRvdnZEhE+FP1V8EaMlrDDPRdW0jX6p0uqWIkDQZZxIfj4a028m8qhTeerU5L6dFWNZku4CJhHyN66nJXjHA4xyQlY=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by VI1PR02MB6432.eurprd02.prod.outlook.com (2603:10a6:800:197::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 10:49:28 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd%5]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 10:49:28 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "ross.burton@arm.com" <ross.burton@arm.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 2/4] p11-kit: add PACKAGECONFIG for trust and
 systemd
Thread-Topic: [OE-core] [PATCH 2/4] p11-kit: add PACKAGECONFIG for trust and
 systemd
Thread-Index: AQHc1ob/amyA7dP/4UiUGRb6eEma2LYCagUA
Date: Thu, 7 May 2026 10:49:28 +0000
Message-ID: 
 <DB5PR02MB10213DD6BCC6FCBA3C2A9C566EF3C2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20260427204640.2003231-1-ross.burton@arm.com>
 <20260427204640.2003231-2-ross.burton@arm.com>
In-Reply-To: <20260427204640.2003231-2-ross.burton@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|VI1PR02MB6432:EE_
x-ms-office365-filtering-correlation-id: a44145f0-438e-4a86-2e5d-08deac264fcf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|3023799003|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: 
 XSx7UsuEHAhW2Ehs00HPDF2aOQ6hmxjH7+PiNZUfi8WRMlxry6D5tVljDEe0XuvFxEaT5/pP86GKsm4hhpoykhaCNfI8ZP8/hLvGBCean9ZBFeAIUjtHBGZNyrX03mB4yIWt4/0Z8HYcEqgHaRzbQIfh8u95wXrtzDbJ2EkfXwG2226fcA6gBWu+wEEXcRSKiPDioX8lyx4KL3nTcJqIPx2gfGjNoue7xyjTLsDy6XOGwysTqrxzrmDvw6B5waNM+AzEQiZAAbagVD9yMDfv3ZBT3xqlQwxw/mvMtWM93tp6OB2qI3Om2NjJ3ce251sQgpvRKH+xYqBB9ChhTa+9moEXXI5pkuc186++0rcQ+4NTllttZh+Wj4y/nMDjc2MMSAzps5HAUzYcRcQzkkQ+0w7kNZO+6EB7OyF/l0Ru1AGCtRZdZcsLj0V/jNWGK2+pM6VLcuQxH9ENq+jT1duDH2AIeVORMC0mfTRzmFZ9Uf+w+HMhf4SsXuQv7ZpZIDKtPYS5n8CB6RaaCovYtLGgrwbpWashidJEElMTEy8rDkWcyf0jFyxAY8X3GKzVvP/utUxk6tPq6xPsseM45I3HuVgWXSCbghQgj9x7mHYuu0zaO+L598bU/pWDX2RozP9qX1al5xk4bncU1Z0eSFgJAXmbpVUpgyXfYnJpPrGMI7QkemIKAXZoHXnacsgcEY/abIoeOWk0A0JyCyko/difkVOyhMNQw73jKvcVGG8RneP5RhwJ4xBKyQKFr5m8AHCc
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(3023799003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?1W4OXZNUtD4riLmwVEPmZNbwiYhW+hrhe4Do6/cygatSKx9be/4TykDs7YTi?=
 =?us-ascii?Q?L1ut17Wm94t3xjb2UsT9ZICvwomSSV/5E2iODT01Ntad1dDC/yBbWeeOu2Dx?=
 =?us-ascii?Q?QGXD86dUwVX6+rP+8+Oh7Hca4fcKohx0YV2saH/NCmyt5WSNclGUzJgapvGi?=
 =?us-ascii?Q?ruLfbgZWFFGMsy6BtJPdMN+hmDJ7KrGTEN4Z8pr8UuXDdF75A6oYSzcl59HY?=
 =?us-ascii?Q?SpkkCEIAwopHloVdlO0vhtEiIlhVjLqjamRNpTnvq7qaRvwlZeYD9jOypAXH?=
 =?us-ascii?Q?fhflIDmA0i953hRCPddmY1GLKVYJ0c3nqmg02ogPPEO9b6C66Cc1SpCO7AGz?=
 =?us-ascii?Q?HFV8ZxxQASV3J86IsxoAFH7SFkjHPVVY42bnEsrIRufHTzOfBJn/QFZu5BFp?=
 =?us-ascii?Q?4vrq5nQgCimr0Qiw4OTn8NQV2jMPX1GVcj5aiGmJ4JtAwHaR59koFyj+SMsd?=
 =?us-ascii?Q?Go5sM6lWy2LoKT6DzkVYnjCFKHA8d65D0sMBe21ID4D50XlkCVA3u0Ua5HyX?=
 =?us-ascii?Q?4zPEWtN5t5oDuqZMfBu5h2/NPICR7PXd52bu2S4CQiLUUBjakWigLJEnekL8?=
 =?us-ascii?Q?w7qCexmZULL8gfCH6IH0N+dHgokJgpqLXy7Ogo7/0QYkLHDzv8UMYA53bYW0?=
 =?us-ascii?Q?5xeDLynIQ1mvsAt1wPqCMMRW5SyECwYUJSWGffcg012jpQnobsdqeLwxGInN?=
 =?us-ascii?Q?wS5lx4Lb886UnxE4m8nlD3wy/QlMX7UkPBHf0L+l/hkmlhwrF1Jt8eDGjdpR?=
 =?us-ascii?Q?eeKLl5ahcJBBXF0Hai32loX4eRbxSXHJNSlu6Ge6Q6FFEe3C+VAvGPU0qJka?=
 =?us-ascii?Q?9cRtDDlXHKUY3rjVlBD1Ql0vNtONDgYswtAKBPz9mgtU0RSK2J4Cb+5ksMRN?=
 =?us-ascii?Q?/7F9DbxIwzSgqiD35cysS9PsK99+2QKQymDpBz3B9leLyEyJ3p+Luwn7Ltu3?=
 =?us-ascii?Q?HCv2c7FRAHD767uTZS/03NE5e4yBtlizq4ZkiVVz42Hfpy8lkjk3mXaLsPbO?=
 =?us-ascii?Q?Ky8zZ6g32tHn6Qe58z2mgupcLPfdhlIWCnbFbBXlGmqXWEF3X9FHLCj8nl7d?=
 =?us-ascii?Q?bErTu5F2A3MqUS3XRJhVXlCJEXurj1dCPf8as5o3P5b1/oWaBE3/5nU4+JeF?=
 =?us-ascii?Q?5a1aF5wZ4AO7q237H0XKmz9O2itBWUQ/Xe4SWcDT371uUyLpu6FsValq36AO?=
 =?us-ascii?Q?C6dnu4M5Q4uYRU8CpTvRVWvE9FO/ds5mCmCndkd4/HHdXBal5tKqMSdbeupC?=
 =?us-ascii?Q?EnjNJUqzLdbd65iSEXLj9hRHusoeZzUHecws7la2FCA7UCoWJLrXNtWRzK8w?=
 =?us-ascii?Q?9J/5MPeW29DWBTonywyB9FcKCFSrem0M18W8G1PHfluvM0pHCa1uRVENau9O?=
 =?us-ascii?Q?0lL+emppgCB8JqgnxziVpIZ3b5oU5QMVCSnenGuqAsNPev0o9bxVARiGlQbP?=
 =?us-ascii?Q?Gi2Rv6zvO7qldQuDhRX2dxBREGcEQr/RlKV8nZJEx1pQW9IpGW+leKPYKHxT?=
 =?us-ascii?Q?8sUdppNa9xQNrqqhdxGF5moHMd0ZwKPha8WV8oULyPxefEv9gegcJHf3PidI?=
 =?us-ascii?Q?EV1qu64UP1WfZo79Zu+RB6lVp9T1mAecKaI1UCamBTJB1ZNplAVVLvF41j68?=
 =?us-ascii?Q?XMt6ZeGKthcxTiMmw0Z3MmVW+sY9rYrQ5BRRbfbhWYu8JMmSMUk+9fApzooa?=
 =?us-ascii?Q?ZbD0oR7EtB0INUYpVa0qkJzRzDw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a44145f0-438e-4a86-2e5d-08deac264fcf
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2026 10:49:28.0811
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r6hH/31ZTrgmhu0r3Uk4b+oNJB9oAyiWPfbgWNhZYF1V0xQ39qUpjyrj0toWPPG8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB6432
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 10:49:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236574

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Ross Burton via lists.openembedded.org
> Sent: den 27 april 2026 22:47
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 2/4] p11-kit: add PACKAGECONFIG for trust and s=
ystemd
>=20
> libtasn dependencies are specific to the trust module, add a PACKAGECONFI=
G
> for that and move the dependencies. This is currently enabled by default
> to preserve behaviour.
>=20
> p11-kit has optional systemd user units for the remote server, add a
> PACKAGECONFIG for that that respects the systemd DISTRO_FEATURE.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-support/p11-kit/p11-kit_0.26.2.bb | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb b/meta/recipe=
s-support/p11-kit/p11-kit_0.26.2.bb
> index aa8b28e0e71..a0e2e17d026 100644
> --- a/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb
> +++ b/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb
> @@ -6,16 +6,17 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D02933887f609=
807fbb57aa4237d14a50"
>=20
>  inherit meson gettext pkgconfig gtk-doc bash-completion manpages
>=20
> -DEPENDS =3D "libtasn1 libtasn1-native libffi"
> +DEPENDS =3D "libffi"
>=20
>  DEPENDS:append =3D "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') =3D=3D =
'True' else ''}"
>=20
> -SRC_URI =3D "gitsm://github.com/p11-glue/p11-kit;branch=3Dmaster;protoco=
l=3Dhttps;tag=3D${PV} \
> -           "
> +SRC_URI =3D "gitsm://github.com/p11-glue/p11-kit;branch=3Dmaster;protoco=
l=3Dhttps;tag=3D${PV}"
>  SRCREV =3D "8e6e4e6d64d9fe91c62b0052c105b2b72d4c24ef"
>=20
> -PACKAGECONFIG ??=3D ""
> +PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)=
} trust"
> +PACKAGECONFIG[systemd] =3D "-Dsystemd=3Denabled,-Dsystemd=3Ddisabled,sys=
temd"

If one has the p11-kit PACKAGECONFIG enabled in gnutls, then this will resu=
lt in=20
a circular dependency: systemd -> libmicrohttpd -> gnutls -> p11-kit -> sys=
temd

I also noticed that systemd has a p11-kit PACKAGECONFIG, which I expect=20
will result in another circular dependency now if it is enabled...

Maybe it would be better to not enable the systemd PACKAGECONFIG here by=20
default? Or better, add a patch that allows bitbake to specify the path=20
for systemduserunitdir using a Meson option so that p11-kit does not have=20
to depend on systemd just to find that path.

We often use something like this in our Meson files to be able to avoid the=
=20
dependency on systemd:

  systemdsystemunitdir =3D get_option('systemdsystemunitdir')
  if systemdsystemunitdir =3D=3D ''
    systemd =3D dependency('systemd')
    systemdsystemunitdir =3D systemd.get_variable(pkgconfig: 'systemdsystem=
unitdir')
  endif

>  PACKAGECONFIG[manpages] =3D "-Dman=3Dtrue,-Dman=3Dfalse,libxslt-native"
> +PACKAGECONFIG[trust] =3D "-Dtrust_module=3Denabled,-Dtrust_module=3Ddisa=
bled,libtasn1-native libtasn1"
>  PACKAGECONFIG[trust-paths] =3D "-Dtrust_paths=3D/etc/ssl/certs/ca-certif=
icates.crt,,,ca-certificates"
>=20
>  EXTRA_OEMESON:append =3D " -Dnls=3D${@'false' if d.getVar('USE_NLS') =3D=
=3D 'no' else 'true'}"
> --
> 2.43.0

//Peter


