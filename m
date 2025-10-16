Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 017E9CCD183
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 09:50:12 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.69])
 by mx.groups.io with SMTP id smtpd.web10.4153.1760608205019164025
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Oct 2025 02:50:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=Kl4IdDLR;
 spf=pass (domain: axis.com, ip: 52.101.72.69, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mq2E6A0MNaO+tOB2UEXzvBPwsxvsjfa1WoqfAqGDV0AyRYpesD0BxOqzPh9O8ckZpor4Kh+7R5PGktH85DOPKNU9ibNySViNAGwlaZomWDgNPDKUq3TUpPr6vsWRkvd09Jw90NPsDD9DC2mlhsyb8i1IsQMdqgeDHSJnIeBg08E6QXZrh4v/d2AQgC/5mefGT9Mhbi76IhmqOzr+WhxNATSYrY/hrzN5c/zboBLJw2Eb+CSDJ+WvrKfnRZxS4NxV1RsRpBEJzYPWnKRUyK3xPzdzyYvohYulIRk23NeMRILyMJqqZ7eL1DVjxXQ+kTNbOQa9pvvqDrxDmrWZYaPgCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E4xE3Hpt25Q+KmRskCSBZIKfudKh1iLqBgkWF5Vz8qI=;
 b=G2AdX+7z7/sYfB2LnYa19MJ5qpESEjwdC5EJz+ZMGr9yzkedLS9yawWoLpbxU7Q/JUli1wEXJszDgQMcDZiY7/+piEKzs4ErPO0pPZ1ChlIuD2zdcE2zT/YrhQDhFruRO/agY/6lwNHSlULbXIo0hF777x7nMct+VnaM7bIu2npOGLy+fO0TU4VzdU3Et9nQc9gLWVZJSyS6qZ9KapUUQkZrvp302cT4eWB2acVuYjgATQ3pS6SYBORRHQ2XU7z8Xq2I+fjMgJVUS/0fLGue1zHQGy2XRxGDp/KGwZhsjl9dTyNf2R9JoAO3fDg6Tk98PuZIrCJ6JMLA+1TyFd1jAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E4xE3Hpt25Q+KmRskCSBZIKfudKh1iLqBgkWF5Vz8qI=;
 b=Kl4IdDLRt/XvQRNhLEQ64U4XwnR/dbA6zsWC5pPHW/b84jOD6ra0e/BDbMWVSHxhBt6jm7y/qIYLf3Oehpz9RzmnYR0pUswZHCg8Dq8goAwK1O3Ycq6LimBCfpxjgMahKAZSWoJzX6cb7JR79vEbciHBWWT2joac/jDanOc2ii4=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DB4PR02MB8583.eurprd02.prod.outlook.com (2603:10a6:10:385::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 09:50:01 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%7]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 09:49:58 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH V3 1/2] base-passwd: add clock group
Thread-Topic: [OE-core][PATCH V3 1/2] base-passwd: add clock group
Thread-Index: AQHcPnmAdYjh6ccYY0i71Eq0EjWAvLTEhk1w
Date: Thu, 16 Oct 2025 09:49:58 +0000
Message-ID: 
 <DB5PR02MB102130824E86A46D0A830FB03EFE9A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20251016084700.1537381-1-Qi.Chen@windriver.com>
In-Reply-To: <20251016084700.1537381-1-Qi.Chen@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DB4PR02MB8583:EE_
x-ms-office365-filtering-correlation-id: c1e87d88-9b77-493e-bb1a-08de0c995e54
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?eq81aoZOQePGJpJSe0g36WafzE6S2EWTkA+ho3ualAe4D97cwnlJIGX5eJ8D?=
 =?us-ascii?Q?wRSm1r+V2kzdkcMLGqTkFZScaC2/AeHEHclG3xG8uLHwgfhSCKPn3jOM9I6F?=
 =?us-ascii?Q?6aYttVthP9kC0k1c82VyVfqxsv20xzIoY84jE6FOn/MPUQwv4GqIFrzxzNYI?=
 =?us-ascii?Q?3V+if7aBYNFux4lOwHB4IxWokH7t+zBIuHw1a1njy8M0VprUYnfnIPCR6gA4?=
 =?us-ascii?Q?NFkLxgHfvOkPZMJuadqLhve4VSYO1UxW0DQ8SBShzPzPEvwJq+6SPdcUtNYY?=
 =?us-ascii?Q?+QZ08j7bEa2wepQb3fvw2ESQ5inf7GUKkKRPZ5NYAKMhWR18QTNC2O4IkRk0?=
 =?us-ascii?Q?Iz12pP21xyaQ/jK5wwbVU2FC6ySMOddbTi+weGtsKRSlq4/dCRpZWmM839WM?=
 =?us-ascii?Q?IwS2lneCL+T8S8H+3sTz70VKCOgJHIU5k4lXwCEwHQanFgQKWqNZRd+qVAL+?=
 =?us-ascii?Q?yID3dwD56nMWH9G4EPx3p2v+cS/VUBUoTGKOvAo5WsVhoW+iL9zTMnlPukyI?=
 =?us-ascii?Q?gmjW9Txl+T3C5yLC4QmAwnpwuiBRK8j4pMy4OTO7Tq8gKG3kU2Ai5y/xvttv?=
 =?us-ascii?Q?S3O6ZHe8uILOsiDRkAs/Gxt/XbjSkHlUGNZXKCvyM8Y6dk4JcPnpVGzHyG4z?=
 =?us-ascii?Q?b3rNt7p3ZrJIKmDsfQwj4geLTuaXqPANEoKBOSfmnvKZO94XS/dmymfR7fF5?=
 =?us-ascii?Q?trBPIkXfOYu0pIlhEgtc2kkuSti2CEdZ4qkgABFyjSlvS9wuvIdrkYBRaVYy?=
 =?us-ascii?Q?7SsUHiIs0loXBQjlv0KEhvcGCQdJvVqUpRR6Jjq8Z+BTUrM9Wb50yVDQga8A?=
 =?us-ascii?Q?PtH7DALoPjN7/RY8P491AXQz7ZQO8HwDqow3DXXwYyPX1jecYVQ1swWi68Zb?=
 =?us-ascii?Q?gOhWeJwSc4BzbKQYBLpTNADzcgjdJaL2/CqrrjVIvh8zrTolIh2UXPABR2aP?=
 =?us-ascii?Q?yAN8ppQHt68ViC36vEKXWIHvuzWQiHJEcrcCMC1RLKDQbbD/TC4V6WH3rvl4?=
 =?us-ascii?Q?1Ib9IldwZb544F3ZDiLHcsrMvMYqjcT8uytc4r5fMsrqdmOopj2IynDGIwPw?=
 =?us-ascii?Q?02yjY8rAEPW6l3T2eRAyLbdmzHOxFfJ3BtFWId8JzjhePAbbPwE1HA1Re2cW?=
 =?us-ascii?Q?K4HKOexiqLhFoK60j42OAWYhF8Vkw5TBzIp6JAhQigdl5ZX77agiNm8M++jy?=
 =?us-ascii?Q?IMm1TIltfZSSDQD4r34plC40b5KkweZSNnmZMV87JQSbHtUcs/T7zE7BIb8p?=
 =?us-ascii?Q?p4ux2j659eiz8LfEODqDCYRDRnpX2IPLrN3YH5hngOqidxucDQNe1HK8p1Jy?=
 =?us-ascii?Q?GclJbaX/uegXu5AomDiv31dNavMNjh/kbLs9dIZ1dhkSz/yIKjruSl+1maWD?=
 =?us-ascii?Q?CYRkic+Bo0+60gxbC3csbcstSxSUmUknmMul41oALvyGUwb2QhtnIufvGtv7?=
 =?us-ascii?Q?4X2n9wcTMGJjit374QFojEctqiX80e/GL9V6tXJlzdCI6VrB9ycfWw=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?vJfgrj/UPxKE+j+dt5Dyzhas5fi20F8KVeC66fvDMdnBoCQJTxKnToHBsLxS?=
 =?us-ascii?Q?/U5+o/Z1FZ3gPDP+A4OAlj4Bd6MwNMxWKbOPMQajIzLY2y31b+kvPQycTpNu?=
 =?us-ascii?Q?Bp6bxTrMtgXqzCsj96uKBaKjF/lojZr+tNMNMrqhaFngJrYx9uHcacMSy9n0?=
 =?us-ascii?Q?ADnnEjgtMc+WAX6an5jkneOhHpGzzJ+ybrhENNgHCo/UneYUu+ugDQp72nnH?=
 =?us-ascii?Q?z3n3lzZMjHD7MxbuhSmJuEeDhzOcjYJnHKlPNOuZN4T1WrLWi7mqRwHnZMhg?=
 =?us-ascii?Q?UwTlW1CCTatMpy0S6YQIamabaIyEzYAxoicNs5FWVILviPC+ku1mDGTOckEk?=
 =?us-ascii?Q?Ogk7ZHbvTzvVB1ZTax8nb5ZhiGAT/jYxTetQk6Y0rhpijUU6RUsdEPezxw8A?=
 =?us-ascii?Q?P5zR3K3Px/e+GllcecVRz4s6M2JXS9zgoihWSaTJ2yeZauWcpWx6yn+QHSV5?=
 =?us-ascii?Q?5XuPPckMP6Eq0189+i9DYxP6hbS7zFTzd+A8QjP/3NQC4UpJ/zQDB2m6qOa1?=
 =?us-ascii?Q?RkIqX87bwjC/p15c5QkMyIvvtYu5GtP6lukaT0APQuZhBDmPZRk00mrr9AI9?=
 =?us-ascii?Q?3YSPFNkQenbRekbH9Jcz6jXokmUOLvrGxOvIEjlJfbbF2y9DfAWtw/PKdoh7?=
 =?us-ascii?Q?Dpu4H4eOtf55l0hJKG99HeOo/kCmK7oNfrmZmvfQbvOxW78D99SAciA21E8o?=
 =?us-ascii?Q?/CsNkj+yLqaAfhsj+iYhADM5J44Rc0J6WoLTk2Js7vMoB5sK1X+0mMHprjwb?=
 =?us-ascii?Q?Em40/C1j7dvELHlzvsODumr9lnEdrWTE+JL4Wwtxuddl6RJzrGBNq3Htxqxy?=
 =?us-ascii?Q?jSBo00hCwldV32dsOUpE+C46m4zNpxYuZfyBuGAuDmuqxu+DNNwyn8ypehsW?=
 =?us-ascii?Q?jE52mJkOsc7x+hIV19aLj8BZTzFnMwuG/Y8qClxe4uaYBbMxV/aDiiCetSoq?=
 =?us-ascii?Q?3EpfvlkFuUXPN5pAUK5owzkN+9Nun0akicn6xcyIugE/pKqT1y9Cc+vTrLz+?=
 =?us-ascii?Q?cQgWgAMfGvQNr9Qurvfd/9FQwHrgku+0ng51oc2POzHSl++W8Z4vDj8J2bm1?=
 =?us-ascii?Q?B40QVc22uya/uG3ri/QFxGQo2vMAfqStmT+XhIUUPbbMavVLnVH7GFLJFBh7?=
 =?us-ascii?Q?j1B1UuPxofF4h8ETlnQuI0901TySZDl2sZiJauwJfqKl+ALqcTUzs9Lrp+hF?=
 =?us-ascii?Q?x2uvIeYCImji1cl9MHfoayjKZfzGZQ0ddn5mz0XHKFhStPGRWhio3yb59EUD?=
 =?us-ascii?Q?nEta6x7Gupqtj6eXZETdIg8s2kFzQteY/LGc4BVAbTg3xYnhP7v9JUabYLZZ?=
 =?us-ascii?Q?97Qm/6FfBQqrboA/4dZTowuHFsrCBa6mqKiguzAMO3A+7euEHLeJGiBsSPTO?=
 =?us-ascii?Q?GAgjjOKz9tzBSOZf5TMdDEZnyXPTWKW6bL1A6IcuO+Vv5qPZ8ZndI/0BAz9q?=
 =?us-ascii?Q?cAvcb0kNFYq2/QI/wxG3f+FxPZCPvaI0txAuXENzpXEM2dy82Ea7gZ8epui4?=
 =?us-ascii?Q?dNX27z4iVJHSGaogHWIAVEGkQKfEdT6W9rvsr8r2s4vYOPkuZUG7nVRUkQ?=
 =?us-ascii?Q?=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1e87d88-9b77-493e-bb1a-08de0c995e54
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2025 09:49:58.4929
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5Yg6E8WF/QawLwS2ytwsPj9Z6tfuVVTjYuQSHB4q5T8q5BIADNYAnseP250856uq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR02MB8583
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 09:50:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224961

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Chen Qi via lists.openembedded.org
> Sent: den 16 oktober 2025 10:47
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core][PATCH V3 1/2] base-passwd: add clock group
>=20
> From: Chen Qi <Qi.Chen@windriver.com>
>=20
> New systemd version (v258) introduces a new group, clock, to
> "enable applications like linuxptp to open clocks without root
> privileges".[1]
>=20
> This results in warning at do_rootfs time:
> WARNING: Group clock has never been defined
>=20
> Add group clock with gid 81 to fix this issue. The wheel group's
> gid is 80, so 81 is chosen. And as the patch to add wheel group
> was not accepted by upstream, directly mark this one's upstream
> status to be 'Inappropriate'.
>=20
> [1] https://github.com/systemd/systemd/commit/af96ccfc24bc4803078a46b4ef2=
cdeb5decdfbcd
>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../base-passwd/0001-Add-clock-group.patch    | 34 +++++++++++++++++++
>  .../base-passwd/base-passwd_3.6.7.bb          |  1 +
>  2 files changed, 35 insertions(+)
>  create mode 100644 meta/recipes-core/base-passwd/base-passwd/0001-Add-cl=
ock-group.patch
>=20
> diff --git a/meta/recipes-core/base-passwd/base-passwd/0001-Add-clock-gro=
up.patch b/meta/recipes-core/base-passwd/base-passwd/0001-Add-clock-group.p=
atch
> new file mode 100644
> index 0000000000..1cb22a05f7
> --- /dev/null
> +++ b/meta/recipes-core/base-passwd/base-passwd/0001-Add-clock-group.patc=
h
> @@ -0,0 +1,34 @@
> +From 4b3a8f347179d7e2a1062eeed13a6474deb28728 Mon Sep 17 00:00:00 2001
> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Thu, 16 Oct 2025 08:48:49 +0800
> +Subject: [PATCH] Add clock group
> +
> +The clock group is needed to "to enable applications like linuxptp
> +to open clocks without root privileges". See the link below:
> +https://github.com/systemd/systemd/commit/af96ccfc24bc4803078a46b4ef2cde=
b
> 5decdfbcd
> +
> +Note that this group is needed as long as people use udev from
> +systemd because 50-udev-default.rules needs it. See the above
> +commit.
> +
> +Upstream-Status: Inappropriate [enable feature]
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + group.master | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/group.master b/group.master
> +index e54fd1d..6f84539 100644
> +--- a/group.master
> ++++ b/group.master
> +@@ -39,5 +39,6 @@ staff:*:50:
> + games:*:60:
> + shutdown:*:70:
> + wheel:*:80:
> ++clock:*:81:

Why does this have to go here. Why can't you just update the=20
GROUPADD_PARAM:${PN} in the systemd recipe to create the clock group:

GROUPADD_PARAM:${PN} =3D "-r systemd-journal; -r clock;"

That way it is only created if systemd is actually used.

> + users:*:100:
> + nogroup:*:65534:
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb b/meta/re=
cipes-core/base-passwd/base-passwd_3.6.7.bb
> index 177927d674..e4e0890293 100644
> --- a/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb
> +++ b/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb
> @@ -13,6 +13,7 @@ SRC_URI =3D
> "https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar
>             file://0005-Add-kvm-group.patch \
>             file://0007-Add-wheel-group.patch \
>             file://0001-base-passwd-Add-the-sgx-group.patch \
> +           file://0001-Add-clock-group.patch \
>             "
>=20
>  SRC_URI[sha256sum] =3D "cf869870fed7862b57bfa9e99cd5cd6f365e2349705a1b65=
af7fc182629bd1ab"
> --
> 2.34.1

//Peter


