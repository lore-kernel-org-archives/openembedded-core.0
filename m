Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7315BC4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 21:39:21 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.42])
 by mx.groups.io with SMTP id smtpd.web10.46176.1701898757538397555
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 13:39:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=JUegvVxf;
 spf=pass (domain: axis.com, ip: 40.107.14.42, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JA4xqBBsrB+rCeM7f7dtd0pg5yT1qBm7tPSim0/G69bgywdgxQcLQUskyGThJBIoGroqS7D+jILccIZIGA5eQu4zc/h9Ixbt7lMlThYMXjWslWNOTVIG3QEnZWk6fgbxhExhyPag34ZD+7QGw+sH2DyAo89/Z1kuTFzpzdVBlvDUUlbR2i4KNAahuhYADE7HEmmsu1dE3qQzauQfA+5rnrfZTIgZeQNfWSmT9YXqehP4cCeYOeNkrgW1Jxm3XmGjoLA1EuniiTa+8AVlVHnRVtq6QA8MwI7jzRyOpenOBDu5zuwT2JWzMd7RAbve25khjjZt8e1CL9YQtwnC1kslCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=25wFmsQnXoNVUVRtA5LyxOqtZszcDTf6wyY2po+wJmQ=;
 b=bE5/BSet8+dvvR7/Akkgsu5/Js2ZcHnZU0aAy9jESRgCtrI4AjYBnaSUXyptQQ71keyRq5Jvx04tDUT2x7jer49ENbVKgNw1AD7zIIm1dv/dHrtkEo/hT5uPTTty5bnuwsVoJ9mVR132LgsblQCX+sU81SneBr3w0fCtzUxtbJ8blyzwlPymK0Aac4EJ6xiBBf6qZeHc66hdMjs5gc2r6GvVpzH0cfK+j7HSXxv6NEX3qh9x3uGp3WaQQIfhcCx6VXOUI9nIvouaEVbeVqsaWumdrF07hWr4j9CV5l3Uhm+SDBkhGHFoNyDj+qQTa8QGdCrdAE7AB2kxFnydNB2JNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=25wFmsQnXoNVUVRtA5LyxOqtZszcDTf6wyY2po+wJmQ=;
 b=JUegvVxfNCddyLczgn13twX2j0qWINZe0jzsyT7sK+p2PhG6JNFvzhuwkWcDwBkTXgQQgnTVz3LraOhJbVP98Bpk5DSrv2+AsqUYV58Uupv30Bcr3Pnjco8yr+mmLEguy16yGmX3XUBL4ipiQs5vT6rb40QFWKqhIkPsn3PnQsg=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DU0PR02MB9537.eurprd02.prod.outlook.com (2603:10a6:10:41d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Wed, 6 Dec
 2023 21:39:13 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::7d13:15f0:2292:6962]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::7d13:15f0:2292:6962%6]) with mapi id 15.20.7046.034; Wed, 6 Dec 2023
 21:39:13 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "johannes.pointner@br-automation.com"
	<johannes.pointner@br-automation.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] ldconfig-native: Add usrmerge support
Thread-Topic: [OE-core] [PATCH] ldconfig-native: Add usrmerge support
Thread-Index: AQHaJETO/7V04M7qFkySSkDKxX/g97CcylMw
Date: Wed, 6 Dec 2023 21:39:13 +0000
Message-ID: 
 <DB5PR02MB102132FC8EA7E2155F296DFC3EF84A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20231201105359.409068-1-johannes.pointner@br-automation.com>
In-Reply-To: <20231201105359.409068-1-johannes.pointner@br-automation.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DU0PR02MB9537:EE_
x-ms-office365-filtering-correlation-id: 04af264e-c3f7-4247-a12c-08dbf6a3ca38
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ss1PKYNopyzfdek7hLpQwkcE/HKEamVLcxQzLv7VJ/jX+TVPv/UVK/FGc0Onp53SsvFr5QqqKqnVmJh2B6Pk8DhIUyhozN4ADQGkHNN56KvK5fgMzNjI2tS/bAxGTeQl6nOuQt2vfgN15JNsZKR/FYQee/lEm7VngV1EbfoYLUnB7dzJm42sRc7DPOIa/EdHtOCARkcyZgGVSp/QpUK7b5I242yVcEz3Gcv3/mgon9oa2Tp3+jpPbLH0YBSUMPnsQ8UovTzf4TEdNZoFHGQjhH5Z+1+YBTEXQe9LIIIdEUJ4jRmHRJFOCIjRFqJm/htXpvto/sAqBVPERchxwtlHAdy9TAIan20rfUyKSCITA7eLcBYN5lH9xX6JhgjaTsaiUutMWZCYR5N1HGy/cQwjIViqU7YEwQuZPq7rJA4Enac7xMNyElVkVYrjZ44kw8vLbmjE7TEygsDYTr0CDkvHVhXIsaL2CFqDHN3LYKwwyChnhF9k39lY1F0w/ZPRHdCrpggydEER+MroDK2vjaBBeXQjUabapXihNNd0z9J2rAFuRrZ+JsjmMPCAxvYKYNSEPjqzxV4Hf2Xt4BromZ5Ar9w41avnOSvKtDrVWiqB7CJ4o+SzExswFu0TC/itjUHe
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(366004)(396003)(136003)(346002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(110136005)(83380400001)(316002)(66946007)(26005)(66476007)(66556008)(64756008)(76116006)(66446008)(38070700009)(52536014)(41300700001)(2906002)(38100700002)(122000001)(44832011)(86362001)(33656002)(5660300002)(8936002)(8676002)(55016003)(9686003)(478600001)(7696005)(53546011)(71200400001)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?64dDHawowb0EsNyV10X7MWKZJNRXQgIKQYfIgrof47MD91tqcwiA1LAA40qg?=
 =?us-ascii?Q?yxpeuxVnBMPz9Jg2OL4tHBFa6jRH8hkxyTta9Ddnh0KG7EvUwumb8nvAb77o?=
 =?us-ascii?Q?yDBlB6tooIPF31jgSTjDquCDi3WnbECdtZ9mLhaedZ+nlbheHfKeCwV9mFj1?=
 =?us-ascii?Q?2nl0VsGfUaVblBfM5VLm8s/c5c33+JhhSPtJYeD01Y3yp/AsBbHsYRoTKSlt?=
 =?us-ascii?Q?EIR0+7XnIz4tSm+u9Xpx3xFnBj7QwG5NXwODMHWVnyNwEzuaKgLk5p3ej2Gl?=
 =?us-ascii?Q?w7oMvn+vqlcQzeV2oMBaTNNGpcIY373NuEtdvOfAuE99l9zFG2IquQ/K/V13?=
 =?us-ascii?Q?M26oDc6tR95VMybbXa+L5uqpdqUl8tGGAwTqYb1umKXgoTLC3TUbr+HxJqun?=
 =?us-ascii?Q?TpVlFFsedX08zBvYh6JsajakFzydW33w4M6nTODl2P/MvLzf0ksCuKGH2NUS?=
 =?us-ascii?Q?1+wn9F10cUixJnYktMNb8fDrO9L6DFXzfbp8m+4SpKhLvbAKogC/Oe7gHn6Q?=
 =?us-ascii?Q?qnLCQdahLGNFJJo6LTkBEzNFSkASWuB3pVdhjpofhyGCD1lYyKHasvJd8nEy?=
 =?us-ascii?Q?DoSag2Fy2Ffm+7ql0YdX6sYBk7jfX4PT4hnDhyjPP2Dx/j4uhPVhopFZGOg9?=
 =?us-ascii?Q?DklqPxku62bA4IL/tCwmme7KfdsYQ5Yjz/7rOiB1ilJa+pM7cuqxdNDFVkxF?=
 =?us-ascii?Q?FKZnxyMcG/TDewQ381b9bkWgkB2XC0jkYkC/BfmjtWvE/HhFNxHTXUpB2mB5?=
 =?us-ascii?Q?N/p2/bi8Es2QPQ1wdfze6a/+1E2GbkIJOqQ4vHMn8+xifkO/LqBYDiwzUqcP?=
 =?us-ascii?Q?u/F/wwrRohB46W5CbXCgjN4JhpZm2MLoMr2c1xb74YVdroKRkuX++1nkCVfM?=
 =?us-ascii?Q?JXWLoq7HPY6tlDnVE49KknFMMh2tDn992F/r1/fVCUO5k4iPVaACQj6sr4en?=
 =?us-ascii?Q?26Py/qt27HQWKMRyCJdEBDvTds2Itog1ECx+rQWEFeFQNG6PZhrK5PJD7Fva?=
 =?us-ascii?Q?YoTvsexSQ73t+gL4mQSVH5pEteeJkoj7bxzOyu3b8bP5ZsHPwFtNRFFMBCY2?=
 =?us-ascii?Q?KVtFqwrV0XCsLOLyN9nimJUbiid75E21mnnR0mDDkmCLkZU4D2lpCittfH+i?=
 =?us-ascii?Q?pjvNyv+Yo9XNOoDFn6JEP9UvnVdhDhMWells7+PYK2E44V0qh14FStfKgsgU?=
 =?us-ascii?Q?KYM4Hrx7qSXl6O3f4M5QB8gwYGG3/kskrbh+HvMMD53QqhL8SiAlVn0sl/UI?=
 =?us-ascii?Q?/XMa3xLcTP3H1yyvBP1PDWXWYWjjKm9z6/jBio3GBFql/YBJhk885lrE8tS3?=
 =?us-ascii?Q?W4m8ndNJW/1r8170EsOemU0b774OgIEtEPQuS8luLPnlwL2fjCbj/ejgugAr?=
 =?us-ascii?Q?uEAylezNzMljPLyOsik3+8AD2ZHffyV/o47FZeHUAdZ/1HdzUiRVnuEqrGXQ?=
 =?us-ascii?Q?sXLlblpylSjzRUT7MK5uUvSwFpcWQ2n0KMm6oGYhTH4odjV1HBMYUSpurNUm?=
 =?us-ascii?Q?s2GXiBmL/XnF/ft/62YYeoxrMr6q6jjjyMeMYE6kUEqv8hQ14QAH7RH8uJrj?=
 =?us-ascii?Q?qkZaDXjKfxYD/Sn4U4s=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04af264e-c3f7-4247-a12c-08dbf6a3ca38
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2023 21:39:13.5720
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nOr7B5+TdXENy3WigEKsmTGxD3dpkTwwL0OhLEf6V68kAqvSuwKln8Xt2qHajrxR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB9537
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 21:39:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191934

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Johannes Pointner via lists.openembedded.org
> Sent: den 1 december 2023 11:54
> To: openembedded-core@lists.openembedded.org
> Cc: Johannes Pointner <johannes.pointner@br-automation.com>
> Subject: [OE-core] [PATCH] ldconfig-native: Add usrmerge support
>=20
> If DISTRO_FEATURE usrmerge is enabled, SLIBDIR is just a symlink to LIBDI=
R,
> therefore don't add SLIBDIR for parsing in this case.
>=20
> Signed-off-by: Johannes Pointner <johannes.pointner@br-automation.com>
> ---
>  .../ldconfig-add-usrmerge-support.patch       | 37 +++++++++++++++++++
>  .../glibc/ldconfig-native_2.12.1.bb           |  1 +
>  2 files changed, 38 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/ldconfig-native-2.12.1/ldconf=
ig-add-usrmerge-support.patch
>=20
> diff --git a/meta/recipes-core/glibc/ldconfig-native-2.12.1/ldconfig-add-=
usrmerge-support.patch b/meta/recipes-core/glibc/ldconfig-native-2.12.1/ldc=
onfig-add-usrmerge-support.patch
> new file mode 100644
> index 0000000000..3041d433fd
> --- /dev/null
> +++ b/meta/recipes-core/glibc/ldconfig-native-2.12.1/ldconfig-add-usrmerg=
e-support.patch
> @@ -0,0 +1,37 @@
> +From 6e543f39f6bec6eb2e02eea02029c7f4ec533b66 Mon Sep 17 00:00:00 2001
> +From: Johannes Pointner <johannes.pointner@br-automation.com>
> +Date: Fri, 1 Dec 2023 11:02:39 +0100
> +Subject: [PATCH] ldconfig: add usrmerge support
> +
> +Check whether SLIBDIR is a symlink, which is the case if usrmerge
> +is enabled, and if so, ignore it.
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Signed-off-by: Johannes Pointner <johannes.pointner@br-automation.com>
> +---
> + ldconfig.c | 8 +++++++-
> + 1 file changed, 7 insertions(+), 1 deletion(-)
> +
> +diff --git a/ldconfig.c b/ldconfig.c
> +index e826410..72ac67b 100644
> +--- a/ldconfig.c
> ++++ b/ldconfig.c
> +@@ -1371,10 +1371,16 @@ main (int argc, char **argv)
> +
> +   if (!opt_only_cline)
> +     {
> ++      struct stat buf;
> ++      int ret;
> +       parse_conf (config_file, true);
> +
> +       /* Always add the standard search paths.  */
> +-      add_system_dir (SLIBDIR);
> ++      /* Check whether SLIBDIR is a symlink, which is the case if usrme=
rge
> ++       is enabled, and if so, ignore it. */
> ++      ret =3D lstat(SLIBDIR ,&buf);
> ++      if(ret =3D=3D -1 || !S_ISLNK(buf.st_mode))
> ++        add_system_dir (SLIBDIR);
> +       if (strcmp (SLIBDIR, LIBDIR))
> + 	add_system_dir (LIBDIR);

Rather than blindly assuming that SLIBDIR being a symbolic link=20
means it is a link to LIBDIR, I would recommend to change the=20
strcmp() above to compare the paths after running them through=20
realpath(). E.g., something like:

      add_system_dir (LIBDIR);
      if (strcmp (LIBDIR, SLIBDIR)) {
        const char *libdir =3D realpath (LIBDIR, NULL);
        const char *slibdir =3D realpath (SLIBDIR, NULL);
        if (strcmp(libdir, slibdir))
          add_system_dir (SLIBDIR);
        free (slibdir);
        free (libdir);
      }

This of course assumes LIBDIR is not a symbolic link to SLIBDIR,=20
but I doubt anyone does that...

> +       add_system_dir (SLIBDIR32);
> diff --git a/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb b/meta/rec=
ipes-core/glibc/ldconfig-native_2.12.1.bb
> index 4db67c3ad4..85fc87257d 100644
> --- a/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb
> +++ b/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb
> @@ -16,6 +16,7 @@ SRC_URI =3D "file://ldconfig-native-2.12.1.tar.bz2 \
>             file://add-64-bit-flag-for-ELF64-entries.patch \
>             file://no-aux-cache.patch \
>             file://add-riscv-support.patch \
> +           file://ldconfig-add-usrmerge-support.patch \
>  "
>=20
>=20
> --
> 2.43.0

//Peter


