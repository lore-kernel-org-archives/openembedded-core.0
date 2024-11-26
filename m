Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54A77D6553A
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 17:57:54 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.78])
 by mx.groups.io with SMTP id smtpd.web11.53035.1732643872476277304
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 09:57:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=NG+CI7Bd;
 spf=pass (domain: axis.com, ip: 40.107.247.78, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=irgjjekoe8UOp7kzM71tDEwoJdjGor+p4P6rc7uv/Q0nBJX6WBvsMK10ze7dEOv7q1hQ8UBoBEUgIL2GI5g6gq4MyT0k4Gottqcgd/ZPPM9ok799EGJdYM6iaZqGHAjL5WxhtIz1Ez9/he9hTHRqcQtlHVVD7ELddNRPh4D/a4fae1Ps0aVOnV+aRMKhXl3AfU5VeY6dFyf8Kh772FKapnk9TIDmWnxE9oz1dxvVbXhBi0pMTgds5Ndlpgrryqon8/BYTGW828PPPtcr8BO49WiXughTxszeF5+k+6AD85Hcq6MDcg4n2RXXq2Dxr4S8Xa/fnBq8J2PysRqGtP+X5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SDh9j4nldgkNpf4kS1lYa0d1cInIiTkb90CdLVz4Vl0=;
 b=hnq4JFIfhFAj5uk8TsNYCQYiCkYX275R9RdV8+3wicVNpIohFBN8mBKwJbVrk4LU2Mn/SYkY5nDecEeAgGYv7NESt+Jj2d5KV7kMxPxtgtgkTtw5daOQL+gBKRrAqcAjPRwvLMaeSKfyGTyjbuOnsc71cOV2zyU/wqJU7kQ9jCtZcxGrBht7X1SyBZ+ZTbCM5C+LcQHgzdaROXChQLqNZeHJgAyjN7EnIewWz/WCeLhSLhWkOY8jCd00bDc+ET5DiVoBAo2jCA2O0SP8d2L1u+NSRE5mXbbgtdPFEW06InlnQyuYIy/AQx4Q0jr+tOYM7802QqDgr8kf1m5a2EBS5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SDh9j4nldgkNpf4kS1lYa0d1cInIiTkb90CdLVz4Vl0=;
 b=NG+CI7Bd+qgbEJQDe0oXJcg1qYWbMuObW+52Q89YKsKJ4ryMrYIJk1/RNKor8HjnMgajxohpgeu9GP2L7tg35XQXyBsfqpbgppUGac80svtK5CMgUXUqS79zBCBD2zozsbJHl7furPKBYf3rZz8WDfBy397HS/HsPvCHGSAM0rk=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AM0PR02MB5745.eurprd02.prod.outlook.com (2603:10a6:208:18b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Tue, 26 Nov
 2024 17:57:49 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%4]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 17:57:48 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "peter.marko@siemens.com" <peter.marko@siemens.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH 2/2] init-manager: define VIRTUAL-RUNTIME_keymaps
 for all init managers
Thread-Topic: [OE-core][PATCH 2/2] init-manager: define
 VIRTUAL-RUNTIME_keymaps for all init managers
Thread-Index: AQHbP2lDeQ5IitGa+kuFV4oZ9VGbnbLJ2Stw
Date: Tue, 26 Nov 2024 17:57:48 +0000
Message-ID: 
 <DB5PR02MB1021365C2D8618C66EC1C2721EF2F2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20241125183636.15293-1-peter.marko@siemens.com>
 <20241125183636.15293-2-peter.marko@siemens.com>
In-Reply-To: <20241125183636.15293-2-peter.marko@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AM0PR02MB5745:EE_
x-ms-office365-filtering-correlation-id: 29a75d3c-afb2-441c-4a58-08dd0e43d704
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?eXRfSYpoCPpMIyZcX7efdleer7F1xoBjId2q5insNN3EEXzmmJ0N11D5e8Xp?=
 =?us-ascii?Q?aEdqnJ4co4lW5RbiRE/XaqFU5nVhpZVjtyLbOeZbPtYj/xpGu4qGiEHK5k4Y?=
 =?us-ascii?Q?dnltQdqNEdFTZWaKbtTEYyAkarsFDW0PxOa/coCJqcazWWcNfTaNqiCofim8?=
 =?us-ascii?Q?Y5EKxo947vF+YhuI6NiF2Ny+dm8EG9gqlVjBh0iUsfW2LJN4AAJshh3fj+Ho?=
 =?us-ascii?Q?p9Zv0pyvuIOo6a01mLf0RtNOozru+zucKwEVnBjltY2UzK4voBACYENh+EZc?=
 =?us-ascii?Q?d5RGeb6ydQ6sdOnN1wq5b4Z5qhveck5bmO9ji4qEjgGEUaK4C1DYjuAbZ5Hi?=
 =?us-ascii?Q?z/dBXr03tMMMCl5+7eohX6Tu+ZanBFRRPzTS0Oc8rX+jr+1zg8Paznir8dAh?=
 =?us-ascii?Q?DUCk+nmLwxJk3YM1fv74lxoo06OPVSBF+4A1jgLUt9uXOS6UOhqtm2fCkrLy?=
 =?us-ascii?Q?dWFSmrDoipGwmoQuehpQi1RGcEoyPmFPLaRsr3u6kTUAAl1k2+31F6RvkvSG?=
 =?us-ascii?Q?NY5i3gx8R3KiffR7F194C7cy/ykctxzqQ3VFs1Q0SBKEn3XdUIWbvOW5FR6D?=
 =?us-ascii?Q?Aqobm9GEA7tUzeZrQwjN31Xhtnrgn8F0+ahEShfNKgVQ1oSBwA0mVcjVabg0?=
 =?us-ascii?Q?t+hgJcoyV5gGu2ZM+HAbB1sEBrtQxgxHc3fcAoDGmbri07s7kepIb8QO6s+v?=
 =?us-ascii?Q?TQgZ7LkFQyMAKOiVMrKaoqs0x8izcvK+gKOAkJKndhL5I+EWEhZSXj/evuJX?=
 =?us-ascii?Q?mxW8Wdd8tXCYUvb2B3glB7Y6fLHQs8CppG7BxzCrqJLtrFWfLfPqoizUXBYW?=
 =?us-ascii?Q?0BT/ORFhwuiGhIntXXC1uGGApTIheb9aDPsV6ikak5Jp5AYLttHHJMogkd2h?=
 =?us-ascii?Q?ETgUz1GuoTZDzIXOvcNMEdIvK4yCtbLJdZ/uRYWUlOWm6fzK+79WbIkTQLND?=
 =?us-ascii?Q?yOK7WzxY3VYt4FfcvmdYfZRf/htU/P7lKdperdBDmnfYTIrqLa/f63olb73G?=
 =?us-ascii?Q?kg1Y4YJt1W8feMaYya2fUVc1tct2q7icW6cr4HUnqjOLs5ihRhCbK9QBkdlZ?=
 =?us-ascii?Q?TZdWqMQJXddQLZHNz4CGg7ciuZfmVzKa90pJY12kUraBXBMaSTwl3tKbKwjO?=
 =?us-ascii?Q?Sxoceijnl/VbmchWCwCFixI4Yd683kTgtzqk0KdHJhjADFtfW9B09PCouZXP?=
 =?us-ascii?Q?YPM/SUkNute+ovxgDyVAS5/GLJaWS1hqKtzu8FZJiekVCvL5EcIMbnv0LVH4?=
 =?us-ascii?Q?qDs3nkrxMaekuYRAC0gnnNyHc5SyhIdUlHIb3diQKQ0zzrFzpUnpz+jxxbSR?=
 =?us-ascii?Q?HdO4PJZyOrHU+XKm2D7OwRrA+cEjYkIEjZk4++Czt0x63XzHJkq23hKECyPj?=
 =?us-ascii?Q?al6tiKCmlX7xaIp3aj5c9D/Gl4QvYwtbDFuW4Oy8j/feuEqMsw=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?LLPQc9i34QBlkNmhDQ+dAdcqJfMrji3NS6+8bhRwGatdYe0Wc1jN5dPDec6D?=
 =?us-ascii?Q?Y1unLzIUQF7Kfqmup5ZIUFbFehrBhJkS0SEulXZaPEBrOEpG+3Dvpi2pSjxM?=
 =?us-ascii?Q?XkyHYn0uPMMQonCqVEFv8bcqokaIQ0BtGwMY09ANdrT64QAsfl3a/p6v0lH0?=
 =?us-ascii?Q?WgSRJ6uKVp9NrF5Rl6LwlaU4/6oAArIx4qG7CBb9sZwgXrMVKsPpKOJi6FMW?=
 =?us-ascii?Q?8gEoZ358rBHRI2NVgBGfrjGOHHqkuMbNMnyX7XSffwytrwn3uTtqdlJ1ijQw?=
 =?us-ascii?Q?cFwE/cYAUnsNlK6KmCJ1OtgcTaTaFJIWGCyi6jyVVtihYcUSYE+cj31T0ufL?=
 =?us-ascii?Q?DA4NwRYDeMELUPSGhI1Yqb+Mr6lFQ9oz2VOUsydZW7hlCq/j8VQWl6+ZL2fX?=
 =?us-ascii?Q?lagVeU9pTPEr0RLJuceUb3E79rQXZiSou0NnsJpqg1rOKghfLGM9x3Plti8+?=
 =?us-ascii?Q?+l/4qpo9xae6caagCKow1gOEEIHClpE9OYZb+F+wsG3T+CeLMl++iwzZRFj8?=
 =?us-ascii?Q?w5vUzUVIDHMog7ETV5rE+MAACdUyLJFAyIXWOPRDuFPDr0JJBnLhYdUgqhPk?=
 =?us-ascii?Q?2M+ZS9QXkTxqA8YSe1ABbc3UD+IHIu9ELQ6jbKjka/HmpLOfKOd3+s3lwI0p?=
 =?us-ascii?Q?45NHezm/Yc0ruCI+L73MJ0AaE6WjdxGraknP7v9/QENIt5+QPx4w5GdsTHOz?=
 =?us-ascii?Q?KB7VAcPYcSPVgY+zTSlHUbXvJNZ74mjkkx/IAAiTfl0dVekrQ5oXzJdbd0g6?=
 =?us-ascii?Q?SD4bD7zgJwpR62RFQt8i70CNXMYly4ZQj6cuu9s5CkxdnDRcQFh8T+VDqEfF?=
 =?us-ascii?Q?zcOiEdJU/Qtu8XxLVQJiKVMBEX1noFytNag4HXw/mvO1w+vLCPGZihVMTYgo?=
 =?us-ascii?Q?NcYjrpF3kNblqXr8+ZzU6nY+5nixu50rNUKrJew+d7DMEa9VjzlW/iX1Wk4J?=
 =?us-ascii?Q?+32X0gS//r5y/AB0zTgwhWV42Aozo3nIRZf06i+6dn/AFiafH3Rwe98kftIr?=
 =?us-ascii?Q?adfemcMoBrKp6Md88Gsxif2vFcVn4iDyLO2m3Oe4jam6hVyzzLUAHN/IxUy1?=
 =?us-ascii?Q?QldL05BhA/J38IHAuOtah/gh3bcuuYjxjZbyOYYFTY+IiNXHK3FC7YCvOxiM?=
 =?us-ascii?Q?Lavai29MUc1nOZ79OJsU5ptepI5yGT6D4L9FLVBatiAcAOiikvfPUQuTilT2?=
 =?us-ascii?Q?dKcRZ03MrFWLLiYs+Br9Yt7WvUvOpq7/mXb+dMrN1X4LA5ttxMljSfl9FFsm?=
 =?us-ascii?Q?69rCUAbJIC/PJWRFqesp/b0jyF+Ve0Bsq0VpGJpgRJBwrztvJ35k4tRW/fKb?=
 =?us-ascii?Q?qbTa1SCxlp3IJHa/8xNK2ufPjwyhWZKVPk72DjY/xkSdXSQqtS0GLn7RdgmN?=
 =?us-ascii?Q?kF3aH8y1+UbrkmuL9EOuLhr5NR3r9Pi5I8oKlrvOYsRQQpQJd62r7pzJngNv?=
 =?us-ascii?Q?1zGM9KPI8XN04T9mkWH5aKZn0QaO66qL1/rIXk/sPUMH0uZKhzVGd0y7N0Xb?=
 =?us-ascii?Q?TWQ1hOoP3JUVDsMgedGd7avvr2AWsTyv6Ra8DnuMJ62uoRH/gt2M+bkGIKma?=
 =?us-ascii?Q?v9tBsSZFZwkos847hho=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29a75d3c-afb2-441c-4a58-08dd0e43d704
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2024 17:57:48.9124
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgSzk2tx7cs82sy8JtoSma+8r2OL7GYo1M0V+KhdK6DmVVZ8wETTPTjrlpL6oChY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB5745
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 17:57:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207877

 -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Peter Marko via
> lists.openembedded.org
> Sent: den 25 november 2024 19:37
> To: openembedded-core@lists.openembedded.org
> Cc: Peter Marko <peter.marko@siemens.com>
> Subject: [OE-core][PATCH 2/2] init-manager: define VIRTUAL-RUNTIME_keymap=
s for all init managers
>=20
> From: Peter Marko <peter.marko@siemens.com>
>=20
> VIRTUAL-RUNTIME_keymaps is defined in some init managers and also in
> some package groups. Defining distro features in recipes is wrong.
> Define it in all init managers instead.

How is keymaps related to whichever init manager is used?
Wouldn't it be better to remove it from init-manager-mdev-busybox.inc=20
and rely on the defaults in the packagegroups that use=20
${VIRTUAL-RUNTIME_keymaps}?

//Peter

>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/conf/distro/include/init-manager-none.inc            | 1 +
>  meta/conf/distro/include/init-manager-systemd.inc         | 1 +
>  meta/conf/distro/include/init-manager-sysvinit.inc        | 1 +
>  meta/recipes-core/packagegroups/packagegroup-base.bb      | 3 ---
>  meta/recipes-core/packagegroups/packagegroup-core-boot.bb | 3 ---
>  5 files changed, 3 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta/conf/distro/include/init-manager-none.inc
> b/meta/conf/distro/include/init-manager-none.inc
> index 6ece5c9906..3972e6d8aa 100644
> --- a/meta/conf/distro/include/init-manager-none.inc
> +++ b/meta/conf/distro/include/init-manager-none.inc
> @@ -2,3 +2,4 @@ VIRTUAL-RUNTIME_init_manager ??=3D "sysvinit"
>  VIRTUAL-RUNTIME_initscripts ??=3D "initscripts"
>  VIRTUAL-RUNTIME_login_manager ??=3D "busybox"
>  VIRTUAL-RUNTIME_dev_manager ??=3D "udev"
> +VIRTUAL-RUNTIME_keymaps ?=3D "keymaps"
> diff --git a/meta/conf/distro/include/init-manager-systemd.inc
> b/meta/conf/distro/include/init-manager-systemd.inc
> index 0a76647459..8132135c25 100644
> --- a/meta/conf/distro/include/init-manager-systemd.inc
> +++ b/meta/conf/distro/include/init-manager-systemd.inc
> @@ -5,5 +5,6 @@ VIRTUAL-RUNTIME_init_manager ??=3D "systemd"
>  VIRTUAL-RUNTIME_initscripts ??=3D "systemd-compat-units"
>  VIRTUAL-RUNTIME_login_manager ??=3D "shadow-base"
>  VIRTUAL-RUNTIME_dev_manager ??=3D "systemd"
> +VIRTUAL-RUNTIME_keymaps ?=3D "keymaps"
>  # systemd hardcodes /root in its source codes, other values are not
> offically supported
>  ROOT_HOME ?=3D "/root"
> diff --git a/meta/conf/distro/include/init-manager-sysvinit.inc
> b/meta/conf/distro/include/init-manager-sysvinit.inc
> index e2d17b358d..cfb3438632 100644
> --- a/meta/conf/distro/include/init-manager-sysvinit.inc
> +++ b/meta/conf/distro/include/init-manager-sysvinit.inc
> @@ -5,3 +5,4 @@ VIRTUAL-RUNTIME_init_manager ??=3D "sysvinit"
>  VIRTUAL-RUNTIME_initscripts ??=3D "initscripts"
>  VIRTUAL-RUNTIME_login_manager ??=3D "busybox"
>  VIRTUAL-RUNTIME_dev_manager ??=3D "udev"
> +VIRTUAL-RUNTIME_keymaps ?=3D "keymaps"
> diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb
> b/meta/recipes-core/packagegroups/packagegroup-base.bb
> index 70a1035003..cb9d1f07af 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-base.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
> @@ -39,9 +39,6 @@ PACKAGES =3D ' \
>              \
>              '
>=20
> -# Override by distro if needed
> -VIRTUAL-RUNTIME_keymaps ?=3D "keymaps"
> -
>  #
>  # packagegroup-base contain stuff needed for base system (machine
> related)
>  #
> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> index fa06092e27..5cdd161811 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> @@ -9,9 +9,6 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>=20
>  inherit packagegroup
>=20
> -# Distro can override the following VIRTUAL-RUNTIME providers:
> -VIRTUAL-RUNTIME_keymaps ?=3D "keymaps"
> -
>  EFI_PROVIDER ??=3D "grub-efi"
>=20
>  SYSVINIT_SCRIPTS =3D "${@bb.utils.contains('MACHINE_FEATURES', 'rtc',
> '${VIRTUAL-RUNTIME_base-utils-hwclock}', '', d)} \
> --
> 2.30.2


