Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EFA6EB64D9
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 11:20:32 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.66])
 by mx.groups.io with SMTP id smtpd.web11.4922.1689160826083579284
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 04:20:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@welotec.com header.s=selector2 header.b=eb7jpA+z;
 spf=pass (domain: welotec.com, ip: 40.107.21.66, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oUW6QMsi1L5gSOV5lHjzaSKD9gk/D58pFk+7VjyDVoFZR1r09Cs/fsRYndiq8yCafWYDFTqJsbpOtakguNEyJH3q3ha53BMX0WyhTPWjx2ODzwj74CiADfCfAUnHtgL2pxPwohP73Zb+c2Tr9DlYGGgv3gymUujxZnzJ1MXquGnPcb4XkGrWAHoaT41GK5ejbLxyb/1oeZAJskUpLcgXMM2cLTIhIwAiEA28kKBx6jljhMFDCCU8cBI5YpRSce9rXxp6Qe+aD6kGE4hbd30GjRtJTPGm0nyI/Ln/QKUyUXJkt/oeJ5YxECmh1bgDRWBTXVUk2KrrDXBVIhcGdsat1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CTC5d9cFZLco+vd0/AoIQn43FClyQ9XtBClvXJ8g+Bk=;
 b=QnEGzCBkwBkT2SqUI4y4bnevcRZBm400DIi9JTEVTVPpHApxucbXkrUcddbUKFz+6UJDzZjVqvw+3qYwDC3LLQAD6WzfyskWTZtqljsyxuWwoXmQ1lvrLG7i71TC4Jc0jLoweOoZ/GjnP5kfgcOILG6G5ev+skRu2+hHUigK4C6GJJmQ1ljuEhZTEEsahhzZQRkstemdBbiOmqiFj/fhwSKXxOUs+uv4cVS31bzmo4Q3eJsChaqW9E+j8F4SzjAFuhL4+nq2JnajVnyNeBdSB1hwDgI88JLufs1wDpd6Rx4UkegOqBvHLo3I11r28kWpY3usfZcalHdaG0odBWUG0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CTC5d9cFZLco+vd0/AoIQn43FClyQ9XtBClvXJ8g+Bk=;
 b=eb7jpA+zWjNKI5CFLwwlp5EBXVqusT5hSF2Z1xrbyx7D6vSSix2LiCryJmMeJ5YAl7rujKwF3fBwk6w3xsRtcmyd+J0SaIw/RwlIyhx7+o+hOxX1MO4TP3Z4LBbqRxZndYlEZmxnLeqzQ7saMtji5gQdbFS5gRWP2zTe5J6jWgc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AM8PR04MB7907.eurprd04.prod.outlook.com (2603:10a6:20b:237::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Wed, 12 Jul
 2023 11:20:21 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4%6]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 11:20:21 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v3 5/5] opkg: add options to enable support for acl and xattr
Date: Wed, 12 Jul 2023 13:20:07 +0200
Message-ID: <20230712112007.705867-5-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230712112007.705867-1-p.lobacz@welotec.com>
References: <20230712112007.705867-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7b::8) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AM8PR04MB7907:EE_
X-MS-Office365-Filtering-Correlation-Id: a19057d3-d7ce-47e6-344a-08db82c9fad0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IfJyfzI+VFduecokd7sYIl4vac+9Pz3hFJER3d1mIClljjlXazKdh3Gakl4DMPcJkp+xzuHdpQzno7jJJ9gZSWE84oq8kVPpgSuhXr3hnQHitTNjxMclw1rxdWYGCnnv6cVkd5ICGujNck/EcOLTY/o+zsJgzRIStEYJm0HCDNsoa7gkHiIAaTVS3q3nKYwlUNALqYlGP5DHJ45DbrIpaazOWxWnkIzChH4RJcoWzuP4w078TX9cIXVVWgvxI8fnOiXnX23NOPYtFWXUZ7OrP5a1gzlJjGfKB5zqAuzE4AbQ5kePPMZGuO1fqTJrSHR3YBCcPrvC4lw5c7LjjxRZkDhyV7hm3RJ/HYbhtCiF/PySKCZPrN+6nzsoWAjfTXsxVwEnAO11cqtLcWy8o4h7BLr+7qL3Si3/G0+oSqt+/iEnMMAxaz209zF0IzPFTmyv1YdUJZcaUJraW88Y9jyjBVMmet99KxhqLNDegJUakuwHZTE4iIywe3eS0GRmLgIsBImeLOjjzTrkPyBRqo3uWDJ1vj1TUwJbp4ewBWOIBvjeDrNRaJgpiQG/veQtNSDZ+bo+PGlYZQ67QxMdwK0iZD9q0amgYSNXezhyht6JW2E=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(396003)(39840400004)(346002)(136003)(451199021)(2906002)(2616005)(83380400001)(66574015)(36756003)(86362001)(38100700002)(38350700002)(41300700001)(52116002)(4326008)(6916009)(6486002)(6512007)(966005)(316002)(107886003)(8676002)(8936002)(478600001)(5660300002)(66946007)(66476007)(66556008)(6666004)(186003)(6506007)(26005)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?E/2KX2K5ktp4FX/Mo0fIeRA3DBkgEmoDWIQ5bVzWaraqFXYrrGRjZfb3kFJz?=
 =?us-ascii?Q?CrfhH2A6OCl3vDLPfOMYBZWDjEsiBS2T+jGmnr5WWyiJsVHU6Eq2xHh2IvF9?=
 =?us-ascii?Q?eSujxDZusf2pmw5jRidz2+O7XcTfpti9LzvHX+dJFlmRAzk6jYPih5opC6Ym?=
 =?us-ascii?Q?6stTnqvxhFDwZq0hLaaWfnBf3WAyEEfieZdZ9u23x5496KHI7lauVerB3ahS?=
 =?us-ascii?Q?v/yWRBg2Y8/btoUutqGUzD22/uVCeflKspDjcbgci63ByZV2l5UEk97ZRNhn?=
 =?us-ascii?Q?Vcu/xKmjFGDAhxUsvf0rt72qKdYDAl3AdUDy/POPbnzWgBBOx0yxyUhjnw2H?=
 =?us-ascii?Q?0T0K08RRHapudw5URI5Uyc1kUma0w+4c5nHyiln2QbG1I9+oyrFoX3hco6X3?=
 =?us-ascii?Q?WDMh75h5HW2k7Bqa76eZa5ZUiuepjt2GWxXdPwTlfySWh2yMODRqEMG2Iz9q?=
 =?us-ascii?Q?1RQj9Cij9LdCuRqA6QVUuCMhBDZRmQlrQ1/bHloqidQN5MPfYk1LRMvvWlsO?=
 =?us-ascii?Q?p1EXAI4avEr3JcehKA++2ehnDmdvWYjxW+YvKqW6mOvds4auyNHnB+FVM2++?=
 =?us-ascii?Q?SRdXHLOHAtWQNepqDncKasAjm9QHsyMLi76jOkRqkRTUQ+8/mdovSB9AkPUu?=
 =?us-ascii?Q?3fCu8Zg7I+jDHnlvag3rAwXaYXiUQNBHzaHguyqqHuD928SuTcF6p0Zkd2n0?=
 =?us-ascii?Q?0ze4nmRM99jb0jT5v341qvyuMIQhnVGC+HoDcOSbtSqaUAAyqbPn9rFW6IFT?=
 =?us-ascii?Q?MACvq1uvQjoZbSY4szNyKjonAzTk9bz63y6E8GbMHS1Wta05fN7kh5Fi4JES?=
 =?us-ascii?Q?hAK7/giCvggMyKXn9D8K/Serq1ZoafGG3Lrc4rEwHmyMa3turV0E7uCQixG4?=
 =?us-ascii?Q?my6b1Mh+8hdEA5a9BhitAMItfgK4/tUL1DQK6q6NYfRVv69MTRzeMC25b55+?=
 =?us-ascii?Q?PmQDiIisfK/oOfX7BRt61538BVtd1I/J+ha3ZEJK3oUFqxIncN648z15xbjJ?=
 =?us-ascii?Q?t6Nugf4we6HZivtpBrxYdxa3FtJNgcuAjFDLAlq0ygBKDY6efB5qm1PKnsA7?=
 =?us-ascii?Q?lvv1kCj0pH4DhrAmEUDKLRqswr2KO3+yQE0rxV1NegofR7CRb3vrZsayZbhK?=
 =?us-ascii?Q?l+u8lD6rsWI+mYaZLdDMK2KGP4EsiM5p11oO/Cv60/ZeKmLF6cbAWzjmeraW?=
 =?us-ascii?Q?4LDcQFFmR42cl1HlC0g2p3uZMpkhjDDbit2SPSWEB6NCzCxP2npQCP2265WL?=
 =?us-ascii?Q?V7CALizHgVSs86dSGC1+SkFowAg+hfEKvJLiJ+jFsZA+M93tGZYVZiD+fG2c?=
 =?us-ascii?Q?gU6ukf3F/VZh+Ym5ENYsegeTgANuR/j3/T/exYJ95zms77ojz/lP8Ibla/G/?=
 =?us-ascii?Q?wKt1uMPZ6MoyFPU2PCko1GXxrgqivXLwIxpstU9IB5Bav8Xpcyl65gWKtg0w?=
 =?us-ascii?Q?ueCvZuw7eTCwUX05gvLaJdHamoaLZ8nJVJLJXby9Ne5eYxOo2tKDaEi+FRkf?=
 =?us-ascii?Q?9xGU2kAL4dh3NnFqlJdQcjdMe8QGtsZQc6Wlb6wSQI5ym0v0g9NrCU1/sL46?=
 =?us-ascii?Q?Xr6moGhBaWuXjLy+2q/42QJfmOyv8aLEtA92ab4M?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a19057d3-d7ce-47e6-344a-08db82c9fad0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 11:20:21.2684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +MVae58kYkcPYZ2+cSDZB+G19KScdfoThYmYPmezaRb8XAIGoaIfQMsiR5WhBSi/vxkn1L+p4Y8vVS1M7/l1NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7907
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 11:20:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184181

The libarchive library, which is being used by opkg, supports ACLs
and xattr already.

More informations can be read at this link:
https://github.com/libarchive/libarchive/pull/691

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 ...-to-enable-support-for-acl-and-xattr.patch | 66 +++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_0.6.1.bb      |  5 +-
 2 files changed, 70 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/opkg/opkg/0002-Add-options-to-ena=
ble-support-for-acl-and-xattr.patch

diff --git a/meta/recipes-devtools/opkg/opkg/0002-Add-options-to-enable-sup=
port-for-acl-and-xattr.patch b/meta/recipes-devtools/opkg/opkg/0002-Add-opt=
ions-to-enable-support-for-acl-and-xattr.patch
new file mode 100644
index 0000000000..30823798fb
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/0002-Add-options-to-enable-support-fo=
r-acl-and-xattr.patch
@@ -0,0 +1,66 @@
+From 32a1926496a670513439cf22c248d18f6b7d087d Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-devtools/opkg/opkg_0.6.1.bb b/meta/recipes-devtoo=
ls/opkg/opkg_0.6.1.bb
index 4c25fe963a..2cac4af644 100644
--- a/meta/recipes-devtools/opkg/opkg_0.6.1.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.6.1.bb
@@ -17,6 +17,7 @@ SRC_URI =3D "http://downloads.yoctoproject.org/releases/$=
{BPN}/${BPN}-${PV}.tar.gz
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-ru=
n.patch \
            file://0002-opkg-key-remove-no-options-flag-from-gpg-calls.patc=
h \
            file://0001-Define-alignof-using-_Alignof-when-using-C11-or-new=
e.patch \
+           file://0002-Add-options-to-enable-support-for-acl-and-xattr.pat=
ch \
            file://run-ptest \
 "
=20
@@ -32,8 +33,10 @@ inherit autotools pkgconfig ptest
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


