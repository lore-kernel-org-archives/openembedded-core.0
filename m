Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C35AC001DF
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 16:20:22 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.74])
 by mx.groups.io with SMTP id smtpd.web10.52151.1690215618541641239
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jul 2023 09:20:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=jCs6ojwQ;
 spf=pass (domain: welotec.com, ip: 40.107.6.74, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A2wCwp/oDPXkzDEx6qmqfCP33mQb3EQFO+lC3TglqbjZYNPu/Zwz31h7yl2xn4DenuGTZQwOsc7oQqVGzcNXjKFiCKpEC5nUGkeQv0+FY/+uupEMUaXd27e3yHxiHo7Wrvkpw1T4x+hyUH7g8SGmfP57bWid4fUU1rpJZalpqgItwoh+5RgZZj0vAfKLN0GwcQmJjG3lyYIhLK6pQ+fMvgq3skXYq3w6dd8QWM+5otZByVXa28AuNGH4VM3tf4g9PXm5eTtVUc9tdnOc9//E3UgSHPFe/E7bO8CPk5GlKZ0N0BXqYbrCp7Hve5T9k//HpRO1ZJHtuIstoe6Bf7Q6Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hyid7T0tIVnvY/akuiaWIrE2RAe2eeaAbqXaQAkF2iE=;
 b=d5zOSHK5f+7rTGt/c2Dt3W7Pji8sl9B/WwxE6UuqlZQwgppRiob0aTfeINufcPKgVA0fgLbczO8/ZwjoOgwIks0qGciELaXkLGvmtG5a3yC3RFNtKwSzQuhxuQPaDm/VIFoPgQnATYR/+3wSQxDkJJs6O29kNBvrdnMIgNSRHkZ+pcGslRD+lKpaGq6ncaE0MS90Fxo271qVhBAEPpY/WAytzp+a2IEJpSooQnc45328f9q6YlNOLsbPb/vSzwN28RyGawnfJGG3dFjI6sIgfZxX86hqmCNWQpgP8lJZ2f1JFB0D9wMT81NFp6fUZ/VaXMHH1+tTSPA9QuBRPD4Xbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hyid7T0tIVnvY/akuiaWIrE2RAe2eeaAbqXaQAkF2iE=;
 b=jCs6ojwQweMA7CaDrc+8Q6B72Vk7RAmhwv0NtRGwzOPxDiwIoU/xXft6x+9xbbBS5RWeU0hg5y1s7ZZ33+EwwrZojvEANO4LErEDPkuXtbzkiY7b0FCUWPcg0t8lxjekHadZiAoRWBzhCqEOIG5GNWqaie8QXKXZOLzMvTKtZUw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AM9PR04MB8084.eurprd04.prod.outlook.com (2603:10a6:20b:3ec::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 16:20:17 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 16:20:17 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v9][master-next 4/5] opkg: add options to enable support for acl and xattr
Date: Mon, 24 Jul 2023 18:20:06 +0200
Message-ID: <20230724162007.3701193-4-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230724162007.3701193-1-p.lobacz@welotec.com>
References: <20230724162007.3701193-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0464.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7f::28) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AM9PR04MB8084:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bdf8b55-cce6-4916-2210-08db8c61de3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IdEfJQp3JtJJqoE0Hyj/Wq6AaukqeOXbRDgPf3L12W2nbMorkNePyF+cdQlpnFGHQm7vxl3yY4yrfGxu5aCZ0De07J8NmPCaUd6CpZ7/rccRBky8B96lSlDSLiXh/2jJxKJ+vWojCT0eNvt94zn93pLD5AUu3Lpv7xGcs7jhu7qYgqrhoPTRdMJAgO0Iq4chlLI49FmOLqDIunADA493JgpLL0iX1CinDYPYrAnY1JlFScuP+p+XuxqGtsZHHd+Mo5/7PNWiTNW29DNbB3nL1X5wLufCSwSQLqH5mvTO6wdwY0VrzDmoXcZiVggii5lN+OF386C8bZf98dGfhznSn2aLtFxTaOKcgekirZlPqIibhVDxFPbeEZf9vd3eNIS/ZOFL72zNeYzLOk7HQKTupZLUPDSvuEoHNB9zi5M8ZRKIWpdxa6lTIv+RRQW6SeC62xVr2EyHazwPYJ+gSvpk+9t91qaN9Cf3gJhDqI2H1ZkvFmEq1pb+wGx+cbHBByNQ3pcA8rSgkb6aPEfnkb+uLpHu9OdPHM9xXDif4/Baz7SWytuah/twNc3jzGtVOD0TjKuwOFZD9r6/6vQ2JpSC8tVgsQbjHvLTEjGlT4aS63U=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(366004)(39830400003)(136003)(346002)(451199021)(6666004)(966005)(6512007)(52116002)(6486002)(478600001)(186003)(2616005)(1076003)(26005)(6506007)(107886003)(2906002)(316002)(41300700001)(6916009)(4326008)(66476007)(66556008)(66946007)(5660300002)(8676002)(8936002)(38100700002)(38350700002)(36756003)(86362001)(66574015)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mKPXeSMUriwRqf3DTgAvl2Z+GLMGhEW901z7IiIlg9FEXR8j+xDL9J5D5yml?=
 =?us-ascii?Q?8xHfsOV7LrobMscDkapDtPWlK+Zzi4ls/AHnSV/kVsmGGBDdGICThe673qOH?=
 =?us-ascii?Q?p5C46KkbFPCy0JLANvFX2Buk/1mpcWrqoelWmIKQcAQXZ6bHRUlYwNAMUa2L?=
 =?us-ascii?Q?oBMGentfjmcQr+IplZBFs90lAdCYrfFtDHoxD6fh17gbJR4ueQknH1NxFwFM?=
 =?us-ascii?Q?NJ8jciaOqOwWZUiHsE5gcrharkgbx3/nMQd/Ovunu1d1nroXXxMkNchWj0PU?=
 =?us-ascii?Q?3xChKxFBqNWOJPw2vdzxu+Ae8/Uduut4nESSdfCzgF3xAizoICifKoA95K1r?=
 =?us-ascii?Q?KnECayM0yXG4GAv7lcahk1AHPhCcSDXVleiOCOTofIkSRzxhyvzmBEQC5iaq?=
 =?us-ascii?Q?Sgh3p8/UGdhCYyQBz+JtDphbyA//mpfJkU2CR8oS/XCWnQo4YRk8+YlDxbrn?=
 =?us-ascii?Q?MIR8cXMvo5oQ1gUNDD3NE72Me1qLmpjBCq98TN1lZNiGrXWGABm7E6o6DgGA?=
 =?us-ascii?Q?9d5G/nx12UUTBmeypQZWOJ9h2rnsKx9st/W7RdPol6nUwfzklIlLgj8svQyl?=
 =?us-ascii?Q?Z7bE0fZ5bzntytZMrSqJBzw8afbDSmyWBUTPamAQzaNq15qlPfQr/kla+xCz?=
 =?us-ascii?Q?PqVg1qBCw2p4ns6lDFzXjLQiT+hnIzwplHHgElJd1df1YcaWzZCLQiCPGLQT?=
 =?us-ascii?Q?y5doc3Yg1gMFkax3SxuwuMn53GGLAJgCjykRReJ5NVUIQ8xSPUeZeR+6O1kV?=
 =?us-ascii?Q?MuMwH+iYtuKz0pDoSFjsjb3/GWxe3vsiO8eU0lUi5v8qlUVlzi0v5hsUgrwF?=
 =?us-ascii?Q?yBqsH2i0np8eGN0TLx/XtYi9lkHm2XI0e/D8Q6NHU9Kb5qEfCyaVovbxG5gh?=
 =?us-ascii?Q?/ptfo1GMyuEz4UDCgA25NpKvZuZc3daPQDIGPBrKqCE7r+FYoQdItnH7dBKm?=
 =?us-ascii?Q?oT/EAEh5qb/1qcIJhCVzvXrXgBWv0XB1JXvZm79Mc/8oOmQ7/NeAhWDdNy4d?=
 =?us-ascii?Q?YzXiDJy0A2idqPj57Jq6Sz9fN9GPeljT/EMdInoyjz2A0mCIvb4YYWWgYsHT?=
 =?us-ascii?Q?YS64399a4sZrjILADrzyufX8IYhcafyiyH2idKk5IJ+KU11UbIowJJsKBZN8?=
 =?us-ascii?Q?+U0/1F5YNoHgmy0zQwhV69v2oQU9bat267+aea7vc+UVvqlcUnEMgapPmNCM?=
 =?us-ascii?Q?1pth1w5DwhD9vs9oApMI2Vt7A4k0/trd+ZcSJuWCY3qOQjUbFdwdzo3YPMbY?=
 =?us-ascii?Q?zA7/4zljqgXVlEd0/oETm22c+EcTnl8IxXha1z0muANamoAZaWtwK9KyytaY?=
 =?us-ascii?Q?S0YJD72n8v6qtuOqxestSmgPJ7E19Muu5Gz1l2W1fn46LoJRGNeVfhz2EfdI?=
 =?us-ascii?Q?jQLTPVn2a1wXFA1xz6xSKJ9pn5EqfiV/gx2ao2AFRysFQrkLjmGHBpfuiavk?=
 =?us-ascii?Q?kmmzEIjh+M58TFK8X8fVXlOAVwVn1ECz6Hdp5eT+EKKOUQOjUm2yts+fLwqR?=
 =?us-ascii?Q?8vnNiJjhC+zICRsVRLlyHijrjN9WAdiJLksttD7Y0sBqgPAK82RqWSqHWTK8?=
 =?us-ascii?Q?FkgGPxRxAfcCY7RiubsvNl6rXMkOmWLa55vzdKPV?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bdf8b55-cce6-4916-2210-08db8c61de3f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 16:20:17.2670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z7RpSTnMzmvQmv9iUzqCWLcYnbeP5ZxKoIikkBzvoG6OJ43BK5GZBpDYhw+UECCOaqsDQ5OALuYS3Egf1sMqXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 16:20:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184800

The libarchive library, which is being used by opkg, supports ACLs
and xattr already.

More informations can be read at this link:
https://github.com/libarchive/libarchive/pull/691

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 ...-to-enable-support-for-acl-and-xattr.patch | 70 +++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_0.6.2.bb      |  5 +-
 2 files changed, 74 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/opkg/opkg/0002-Add-options-to-ena=
ble-support-for-acl-and-xattr.patch

diff --git a/meta/recipes-devtools/opkg/opkg/0002-Add-options-to-enable-sup=
port-for-acl-and-xattr.patch b/meta/recipes-devtools/opkg/opkg/0002-Add-opt=
ions-to-enable-support-for-acl-and-xattr.patch
new file mode 100644
index 0000000000..d6cb1d79fb
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/0002-Add-options-to-enable-support-fo=
r-acl-and-xattr.patch
@@ -0,0 +1,70 @@
+From 1c935e994bd572d9fff436f660ac1a060a434df0 Mon Sep 17 00:00:00 2001
+From: Maciej Liszewski <m.liszewski@welotec.com>
+Date: Tue, 4 Jul 2023 22:01:58 +0200
+Subject: [PATCH] Add options to enable support for acl and xattr
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+The libarchive library, which is being used by opkg, supports ACLs
+and xattr already.
+
+More informations can be read at this link:
+https://github.com/libarchive/libarchive/pull/691
+
+Upstream-Status: Accepted [https://groups.google.com/g/opkg-devel/c/aEGL7X=
RXfaA]
+
+[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15097
+
+Signed-off-by: Maciej Liszewski <m.liszewski@welotec.com>
+Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
+---
+ configure.ac           | 12 ++++++++++++
+ libopkg/opkg_archive.c |  8 ++++++++
+ 2 files changed, 20 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 389a818..46949cd 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -158,6 +158,18 @@ return OPENSSL_VERSION_NUMBER; ],
+   AC_SUBST(OPENSSL_LIBS)
+ fi
+=20
++# check for ACL support
++AC_ARG_WITH([acl], [AS_HELP_STRING([--with-acl], [Enable ACL support])])
++if test "x$with_acl" =3D "xyes"; then
++  AC_DEFINE([ENABLE_ACL], [1], [Enable ACL support])
++fi
++
++# check for xattr support
++AC_ARG_WITH([xattr], [AS_HELP_STRING([--with-xattr], [Enable xattr suppor=
t])])
++if test "x$with_xattr" =3D "xyes"; then
++  AC_DEFINE([ENABLE_XATTR], [1], [Enable xattr support])
++fi
++
+ # check for libsolv solver
+ AC_ARG_WITH(libsolv, AC_HELP_STRING([--with-libsolv], [Use libsolv solver=
 support.
+   ]), [], [with_libsolv=3D"no"])
+diff --git a/libopkg/opkg_archive.c b/libopkg/opkg_archive.c
+index 03a4afb..8dd902d 100644
+--- a/libopkg/opkg_archive.c
++++ b/libopkg/opkg_archive.c
+@@ -912,6 +912,14 @@ struct opkg_ar *ar_open_pkg_data_archive(const char *=
filename)
+     ar->extract_flags =3D ARCHIVE_EXTRACT_OWNER | ARCHIVE_EXTRACT_PERM |
+         ARCHIVE_EXTRACT_TIME | ARCHIVE_EXTRACT_UNLINK | ARCHIVE_EXTRACT_N=
O_OVERWRITE;
+=20
++#ifdef ENABLE_ACL
++    ar->extract_flags |=3D ARCHIVE_EXTRACT_ACL;
++#endif
++
++#ifdef ENABLE_XATTR
++    ar->extract_flags |=3D ARCHIVE_EXTRACT_FFLAGS | ARCHIVE_EXTRACT_XATTR=
;
++#endif
++
+     if (opkg_config->ignore_uid)
+         ar->extract_flags &=3D ~ARCHIVE_EXTRACT_OWNER;
+=20
+--=20
+2.34.1
+
diff --git a/meta/recipes-devtools/opkg/opkg_0.6.2.bb b/meta/recipes-devtoo=
ls/opkg/opkg_0.6.2.bb
index 46be137354..d7dc6ab715 100644
--- a/meta/recipes-devtools/opkg/opkg_0.6.2.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.6.2.bb
@@ -15,6 +15,7 @@ PE =3D "1"
 SRC_URI =3D "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV=
}.tar.gz \
            file://opkg.conf \
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-ru=
n.patch \
+           file://0002-Add-options-to-enable-support-for-acl-and-xattr.pat=
ch \
            file://run-ptest \
            "
=20
@@ -30,8 +31,10 @@ inherit autotools pkgconfig ptest
 target_localstatedir :=3D "${localstatedir}"
 OPKGLIBDIR ??=3D "${target_localstatedir}/lib"
=20
-PACKAGECONFIG ??=3D "libsolv"
+PACKAGECONFIG ??=3D "libsolv ${@bb.utils.filter('DISTRO_FEATURES', 'acl xa=
ttr', d)}"
=20
+PACKAGECONFIG[acl] =3D "--with-acl,--without-acl"
+PACKAGECONFIG[xattr] =3D "--with-xattr,--without-xattr"
 PACKAGECONFIG[gpg] =3D "--enable-gpg,--disable-gpg,\
     gnupg gpgme libgpg-error,\
     ${@ "gnupg" if ("native" in d.getVar("PN")) else "gnupg-gpg"}\
--=20
2.34.1


