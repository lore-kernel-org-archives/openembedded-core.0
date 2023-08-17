Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D807C2FC1A
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 12:47:19 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.87])
 by mx.groups.io with SMTP id smtpd.web10.186322.1692276429984904713
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 05:47:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=IhZnieRc;
 spf=pass (domain: welotec.com, ip: 40.107.247.87, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NOJASJDjINGVU7VPoqrvdOKMzSeq7ZXOKTtmjHAcj4JsmooceoAJtoY21XFuM2WtdQiNVRyOk65YE19Bto6fWB4YUYEhRdU7rMf4Ay9Gr9zUaW9AdIGBOjemJM23b/xE/HPUN/PlSx0Bgr03MG+qQ6ZqYcp5AdB4gvEXXZJujdABUTNfD/fRswOWKPcat/Oju5pmM9Y3dME6mRbPmElR1sx/LjG93olYVmL6/L+iJgS+E824O9KNSvcewyEWAB2pSDLMMfmlkOVlB36d+XYkoF5WErQjfvuZ+rXSjavWnv+1Ma9VwGfq/5TR50IXi1qTUp/wKwZc1WnMHHqVKJ/BvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hyid7T0tIVnvY/akuiaWIrE2RAe2eeaAbqXaQAkF2iE=;
 b=nbQZ9GK8scURVs58uHDF6ehjXXOqSP0eWTE0nq3LdFwG/40vln5i53EKiiAHIjirwglFFNRui9z5Rg28qId3tgIYzQKlUp+Q0tcDSVc4Hj4+JK/I0MESu9d5CX571jfXCVUsZEBNp3sqpI7Xr/bslA/TJ7w0gX4p5EDZeToy0gkd32Rt1CvbTmE/OVBJPeuDaQBi2P5DJVyHU03cvKFSw7X8Cr6rSBYSjn0zK68o30Hrlg2IxjiquutQGUSmGKAlkTJ6F5LVRbi9n7eMeNOkQ9m54IRxLV5VfixFGI/CV7nJB6ftXDAjfmMzNy6sDKBLbcGoie4Sg3N+xcqIPuIZaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hyid7T0tIVnvY/akuiaWIrE2RAe2eeaAbqXaQAkF2iE=;
 b=IhZnieRc+dK5YnagfWl44X0AXG2wKnafFSEvJJlZUtM5iVjtkKCCWXfkNgSALsxHcUEyu30RlJNK2qo96mLU2t4KEoi47Q+cKwCFKkChQQa9JbiHWXLKzPsGW93zCk2086EgCLjpIFuS9GoLwmfcpufeM6iLspRZSmgXlI6GvodUhiKDTgH/sPcsLHD7M9C0W6d524/sdpi1dhhxur0AgOhZOeJwNz17zgOyVpo9FJGxvMlt7iKiPGOb4nLdUfdYO2BCHo3EJ1tDK7R4SogML2pBQ/LXH5K/DK/IEjyYhHvQv2uBGwpZOTK6L85XIc5X+lUcDLvYgjAFyXp0iZ+NaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by PA4PR04MB7808.eurprd04.prod.outlook.com (2603:10a6:102:c8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.30; Thu, 17 Aug
 2023 12:47:04 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::b693:eb1b:b0e6:9a06]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::b693:eb1b:b0e6:9a06%4]) with mapi id 15.20.6678.025; Thu, 17 Aug 2023
 12:47:03 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v13 7/8] opkg: add options to enable support for acl and xattr
Date: Thu, 17 Aug 2023 14:46:11 +0200
Message-ID: <20230817124612.1043464-7-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817124612.1043464-1-p.lobacz@welotec.com>
References: <20230817124612.1043464-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0249.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8b::11) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|PA4PR04MB7808:EE_
X-MS-Office365-Filtering-Correlation-Id: 91903e0f-451f-4b46-7fd0-08db9f200ea5
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PxajnBg7bXzs5PoDlV7R03GUQCmFFwIm8E57Lb8GM4JcJSSIeL/wLqp3QaG4QVU5oIKB+iona5tRitwf03oA+cfvoiXVUJk9cq3vLOBdHRr/2kZDkd9Fk50rzVjyedBLD0yY501cjiF1/FBQZNMrsnGdbGXzVysxwm3syegZAVewk2xGoa4ifg4fLJKAKdvJmzzbxpA6vppEaluHT8qbjZPebYiT3DDwVRojfpV37f4woxQy123huAAy9vlcIqcqgBO3MN8Pa07/fZSj+eEJxMSRw3CPNyex8g7lw7BKncnvX0//3lT4/bjClbEWpRKj8oeOpTjIEgbNP2mI/Ik+EW7O2hx7aq/Xj3tbFI4I8QcX27CrI+NqVeuRdxLZi8NTCP1Mmgh9EcMoKXN6cdSz2bc8CB38PhUD3w4EMLp3rjjarchWiMevWESfEeIfXjPSp6ulWz3qwWqP7O7WreP4Wf5dVxStd2dYSfvOxM3dVAav154y2Eb6d6H6exExjLNMSnWMtsjivTV6s6eeOHT/oKbfrbFYmNrqbX/mfAQYZCg0+gaH1KWsI4r/jge0U6Z76Ni2xGwjp3dufGK9gelz9dQNLdBxV+pBRLmBtgeP+kU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(346002)(136003)(39830400003)(376002)(186009)(1800799009)(451199024)(8676002)(8936002)(4326008)(86362001)(5660300002)(2906002)(36756003)(26005)(1076003)(2616005)(107886003)(83380400001)(6666004)(6506007)(6486002)(478600001)(966005)(52116002)(6512007)(316002)(6916009)(66946007)(66476007)(66556008)(41300700001)(38350700002)(38100700002)(66574015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BQvqCQB+hKnONpeCKwH31Y4exgyOESdtCFPgEDrPZtodZj1HDcTOrsMrIWFZ?=
 =?us-ascii?Q?F3gYzttnKUHlbdGHn5x4SkvPFeaOWDgy7FK/e8199HCsRJG+Fbof99+5HRoJ?=
 =?us-ascii?Q?dXxwS2okCKbuvzT0QYbtmTYHKuVM1t5SC+39gyRBSbUvwsHiDy+FLQysphzp?=
 =?us-ascii?Q?5IgfGoar4bpopGxnuW/szGINF/4Q8pvupTgSL/inoBtdemcj1hSAhcoGm6Ly?=
 =?us-ascii?Q?nXcjjlk0MTXE7RMxoKeDOQXaE9Pf4nyNw8H7dCZsbPbwLG4RXfIntMhGFOpU?=
 =?us-ascii?Q?cs2rt4Dyjh7ABok6DlIbHaF7Kft0yZqkP+lKxIJ7LL7R9Jb7KgnwqgnhIsdO?=
 =?us-ascii?Q?unJ/Lq15LqAfcAro21iX0W6r+9ug4/eBgDhsExthbrHSL6hDl37yjvNi+m+d?=
 =?us-ascii?Q?IQKTqp5860sXot1tNS0yY36dgdxFJhFmwRUlScsiUtQOkBsJ6PaZTGNhgMz8?=
 =?us-ascii?Q?eYfltBlU/Zhu6z7/Yzicr4DcnXosTpX2b3sTDhtdweb+1dMY+/KToy1Z+JU7?=
 =?us-ascii?Q?Iy2usAxiDTgcTKJGTWd/MIyJqpbJs2XynaDrUPWMxU6xE3wx+Kn1/hzLWqSf?=
 =?us-ascii?Q?axX8Yi+H0AMRyGGDKX5BDW+/YYXQNfbjOCOg/dt5u0PIkxGS36exfarWhgex?=
 =?us-ascii?Q?aigqw1onzz2Kp1onnlocq6ml3dm/g2y1k+HpGGBfxXRRypxcj6Cip+uY6Bmm?=
 =?us-ascii?Q?wS7zU+QYt9sP90J/trPUWMkeRe+IUEKvvdlA8U9idJV4MgNVkaK6GFU+MuCI?=
 =?us-ascii?Q?pBsoGPcsdkIvG07RXszdxZTgfqkUMh3NeNbhpl8lSKuFsz65EGP/UbTc2T+Q?=
 =?us-ascii?Q?RwcfYN8LOY7+BsePtKVtzRIsOS4BUQdDLOauTZn1JLFfQOsDCh0AnjI+sEPl?=
 =?us-ascii?Q?nxFh9Kw9ULmNiRscjUUE+3UXoU4LTBv1zvorHwKslaLNqVH1IBpLDWelMLXv?=
 =?us-ascii?Q?FXkBBMHkIzmazLAb1toF/nhxWCXM6wgk1YZ8/aU5SvoCkh8b7/yuCLV/6Cg1?=
 =?us-ascii?Q?6oHIRjE3FRSHsb05xozLCKBDvkfBwln24u76aGrKT14bDUA/cpn2xWA769eM?=
 =?us-ascii?Q?QCg4XnD9ScYO3vHIuv471Q98R5VLqFqB7AjgUc2m14DU+u5maM33w2Jcrh00?=
 =?us-ascii?Q?dG75q5x3XllCs6NN9fIzQLGO1KUfh4QS6S4PzLxROtJi7KxHop38RtsgL+zH?=
 =?us-ascii?Q?2gm5wYsCgLdBVmMHw8TndmjkcHlE90zFkIgYGEWxD451EyAFYa/EgwVIzg/z?=
 =?us-ascii?Q?9LE1xVvZ5QYV2XHT9+pUoLynpsFB4Sm1R5GHc0z0A1H2Ogghsx32k+64FtjR?=
 =?us-ascii?Q?0nPqr0jFMUh1QLRK470JzMT2LGc+HtsygSF4/wZ0mEakqUmKZEYJPD0zFlfW?=
 =?us-ascii?Q?b1ldb6b5xwuTwPmEBvghGaL40mF3NPYgGLS7EOcaiveBs6tMZ3g87aoGmh/4?=
 =?us-ascii?Q?EcMcv5GH3xC/AMPRUBQccBMebOBaODUrwFK7W+AAYHKIKUlv1pO9u6qjROk4?=
 =?us-ascii?Q?yb67a1rYVdGgir4ZNh7pHtz7bkZnqTDWD+7CLkKIXF/ZbL3LAaTaa95bUkZT?=
 =?us-ascii?Q?PeuJ+EM0QeJFuxFK6sG5kgJbMU/xA63W6BxnngEK?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91903e0f-451f-4b46-7fd0-08db9f200ea5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 12:47:03.9704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GBZ7K1qDwYG1VxDhB4mnewnNKTwXAEtH1LkXCCSAs/kniIMpb7+1eDCny7DQ40E1TXknLZR6ApDBaQHPlshjbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7808
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 12:47:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186314

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


