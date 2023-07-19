Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2CE9C001DC
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 19:49:16 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.84])
 by mx.groups.io with SMTP id smtpd.web10.4875.1689796146017961249
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jul 2023 12:49:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@welotec.com header.s=selector2 header.b=vZc3qea2;
 spf=pass (domain: welotec.com, ip: 40.107.22.84, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bZXqSudxGJq/dCRJEvgLDlVahGAKoupdK2su4knIx88Px2AXzHYd4B3zoPVolgT6OUXMNzgmpNkDZyepswwfhzKC7eMZY5jdGZA5tbcb6SYVSpx0M+XcHbLGyZ1kH9AfHyAJIpAnEXT+mh9a9320SCQIWODWqkte3rCsuXS2BJJtXm0SyrZnUM53kTnXGiovAmHhRf2a85Ojt9YvqHk2zP/iYy4QnEcxYvM1C9v/yJJr/vrzpbSWrikLqi6iBI+XASsH611C3tBh39+Sl5NC2LCsbriaZg69TOCEcxEoFSyA2kvYCdfxFpWBjIKT6F0aghQa8jmf40qS/AiNTqH4RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O+kMQsllH0+GDrHbPuSQu7y9qGr4ZmAXuSDpMXc+7wU=;
 b=Kq24ZQYutA1yEVNxFtPWIJlSnFFfbQe+JFg8xBJHciLATHkNGMt3Dbf5v4LSoL7y1NfG1Jjs5VFahmNJycnLDimRRsmt40LEeJUB1bb3xNJqabkmRgIdVJlerrWuIC6KvADvLmcR5Y2Z0FqYNKVbrOsZjmCtgOjwKrJIfcCO+iRs6QQCvIIjmpjjj75BrhttHYpfbIU7/nBTCLgLRVwusA/aEVXY+oxs70wqnMuDsGAnuaZEo5sYcFSawP8J12fayxiNFVXMDdQZ8km5ohYvqF0CKU36sXsubc74a0IIqNFOH/edTAS6OwaBebMIKsyKI68cREZNCpCMe3e2TwwdKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O+kMQsllH0+GDrHbPuSQu7y9qGr4ZmAXuSDpMXc+7wU=;
 b=vZc3qea26iflKd+sRwmG5yd/wUSE5YiH6YbDpcelpCsRdPVd6rqdJfji9vmBpoC9j7ooUq474hwasJ6uceAMcEWAM0r4emX+4RZmChm1fPuzFmNJdKGyAmG9QsvoBX1XG/nhZ0g1rdWGC/lWvwX/sXfvu82WNWOC1OmdX70dCfk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by PAXPR04MB9107.eurprd04.prod.outlook.com (2603:10a6:102:229::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Wed, 19 Jul
 2023 19:49:07 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 19:49:07 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v6 5/6] opkg: add options to enable support for acl and xattr
Date: Wed, 19 Jul 2023 21:48:42 +0200
Message-ID: <20230719194843.330741-5-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230719194843.330741-1-p.lobacz@welotec.com>
References: <20230719194843.330741-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::22) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|PAXPR04MB9107:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ff57985-04a5-4095-9ebb-08db88913694
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Pgdbac9PDAF0G0u3OnLtOfv77NR17DfG6zo/fXpU8vDhdFif8ZNhAqDCE5Z+3TMyHLODQWktITDVLiAHqG4a5RHg+ZjaCFCPvXtYXEt4dmpUSur9jB5y83FRdWgBzRDyP/Yh/77OFAAh/9b7joq0gkZ1Q52h/ab1vijw0UdDjmMr9Puchy+14ysA/kROij0ADIfdTg3iokSIFxk1/jo8SYy5/3mvRDmh5GPSvaWhoC4qgKONJdAcmu4s1hqhUfb1cHNzj1cY3A+/kkCzT6u98ZKt4UH7990kPkoizxi5Qwdjexscxlj1/x5sJTHR1Y4BqdL0AzlK8gEqQD1FwExM5kyHVk62sQRMJXAmCp0absbaWl3YI8GwQLIRM7jvYI0hl48rg7IQd92c2JCUEL0LnDFDIxH4UQigVmCVUrwEg0ki7FLzaNWKHT0cHKN+hU7lhS7COO2KgjvKKWYbyPlgrQQS9OPhWC5pWmJyiRIKd/uaSe3+9eD7dq5K6EX95pjHVN7aYy3y5YAy6QsfHWVqfrCmdTOi1Mgt81Y2cqvS4+Tbxzvgcv1cm+5hN3oyliqeAyx9ggYciaS8p++3DEdS1Nv7WzVVO2rLq6qh/ObMEKk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(39840400004)(396003)(376002)(346002)(451199021)(66556008)(5660300002)(66946007)(66476007)(4326008)(6916009)(316002)(8676002)(8936002)(41300700001)(2906002)(6666004)(478600001)(966005)(6486002)(107886003)(52116002)(6506007)(1076003)(26005)(186003)(6512007)(83380400001)(66574015)(36756003)(38100700002)(86362001)(38350700002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zmvUq+j2FbXY0jBkdrobHW72lf4AQbrDsXd7L15zJZCzEutMsiKmv9iq/bau?=
 =?us-ascii?Q?PrmcwSEahhC3exTgTWRHz2brteBmAw7sPfXJQAjv8YjLaJ16qT4mRsgH2074?=
 =?us-ascii?Q?Gf50DQS8jv3dUNpRoAM0ymVcxieeCc8R/CGqHO9ZT9lN1lf7lgMq36kicdMj?=
 =?us-ascii?Q?4WiUJVrDGPGPTTa6kEPinegMB3hRjutMaomIcWOAbTjFoxRreizRgxZrPK8O?=
 =?us-ascii?Q?N6N9U9cEmyZ4Ta80sTKf+q4Q1XuC4aUHzeOd6tMaFbBgTDF3+6SUFbs6yAtn?=
 =?us-ascii?Q?2AUWlC2nfNNE+O7Hjkmj2NpYs9XA/ZOyzwdHSUB4TxeQ3ki1MslMnA87hELO?=
 =?us-ascii?Q?wss1OrVtKhK/pPsjtS+b+YbNjqtWNUs2kMrtwIRigWGAUsRG62g5o9eOdeBO?=
 =?us-ascii?Q?N+OcLiCbFGrzBhfS2yvw98e08ubDV6vzk32H7TtmFEVCNSSwu1OkQVef7wGg?=
 =?us-ascii?Q?XOJbarCGz+tUmK3Wom90GPBodK9s6QeH1BlU+unGUd2gtK9zOZ74v0jFXU6R?=
 =?us-ascii?Q?BjP/1h2qDPvp2o1ONC6HpZ4CGtViWP41fKeta68QqFWSf30ppSij/0Qw9Ky0?=
 =?us-ascii?Q?k4Dx6aKohMIfPhGlFm0O4a8LInRmjXvpXsnbEKxj6dgxNMD07XdBblfoXUQk?=
 =?us-ascii?Q?cJ0iXymkve+p50GFos54BNrpDXk0VhZw6UexL3e7dO+THODQwz4xAx8WJb6g?=
 =?us-ascii?Q?liPrrxtb6uHF5wXE0nJWVAmHfltCEu02LjbmdD1qcQaMyFZd3MCqCDxqtQdP?=
 =?us-ascii?Q?kAtSytGIUsawyibsZ+jBB5O1En1UNe+uQqqPIbjSYDe++EAgfRDgmkkw9pb5?=
 =?us-ascii?Q?SwtiDvNnFTHxEsD3DvZcpOsVPkScAdYVuc9d8ybk+t0i/4gzOJmPDudsFKSU?=
 =?us-ascii?Q?3kXQErbFej5B9zMaR5CRkZy7TstDgdU0Q2yq28GUBs+5ORJZsd6Yb/zjPonR?=
 =?us-ascii?Q?S44HL2kEbtw1SqjoY6KJoanxhE9IWBP6PhZSPhv3FGKajMZ2G8SsPpDMH3Qr?=
 =?us-ascii?Q?IlQWHj211814Lb+2wt24bzILQLmM5t6NwWQHpNg4w+V4Rj5lNhdu8YRJnBxo?=
 =?us-ascii?Q?rfb8L/qWuKQ3hC5JtoRoAdYvHrSaYu3wAyNX4iFWrJw5qJcsPXxRwM42pMyO?=
 =?us-ascii?Q?bm9K4hzFhKomiUliox73OmcslK8Ezg6ZGIyFF+1eTTRTq2/6CmhO++y5NQtR?=
 =?us-ascii?Q?/AmZIDFflB7299b2W0N2JGCe52dxsqQ3xfxwoBA0GFedjhsV6zUabUbYohO9?=
 =?us-ascii?Q?ohATRQEzETqHf9gBaAjGvFLYE11gYnnLpDK2H+1O2yMFEymuMTKjkextA6e8?=
 =?us-ascii?Q?y4YNp49xMSPkbmWRYciTatDdkKl56BoShrBl1vZLEgMGG5uOt2dzrZFbYjYm?=
 =?us-ascii?Q?Drl5Ubo/mPoyGE4aVFyl3y8i58OzdnZyaG6MezTZ/PLW2zdmWNSdJNqFPW0Z?=
 =?us-ascii?Q?MzaZbyTBJQm6MZeqQchkKrNNhB7wF6i1wdZdtgBCHmV7IQUOVHaIgtyGbKaU?=
 =?us-ascii?Q?NlxYtrMy1lPF8hDModsefwn3aYQqBgv+fse4sFVL+oBE/VEzN8/oy0bSvDvm?=
 =?us-ascii?Q?rte7obxgamCh/Pb6mEAN278QzVEngizPjcn8enyt?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ff57985-04a5-4095-9ebb-08db88913694
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 19:49:07.1708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S87RfU61vqnMjf9jEUX58Xd2/SHJshI5vw7sxsc6XKqrfIy/8kVSLCW/8zFsdFj3hS94EkryPblga70ykXt7qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 19:49:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184598

The libarchive library, which is being used by opkg, supports ACLs
and xattr already.

More informations can be read at this link:
https://github.com/libarchive/libarchive/pull/691

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 ...-to-enable-support-for-acl-and-xattr.patch | 70 +++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_0.6.1.bb      |  5 +-
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


