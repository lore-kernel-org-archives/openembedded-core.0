Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 971E8EB64DD
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 20:47:09 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.59])
 by mx.groups.io with SMTP id smtpd.web11.5608.1690231619658110944
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jul 2023 13:47:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=UTm97GFp;
 spf=pass (domain: welotec.com, ip: 40.107.21.59, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lvhsBt6QsnY+6jde+82MvHeAEgmJ/Fjnuy2UhEF72D8raYD4HcgJR8Bmdb5/NGATlVaRwlqRGV4K/fBGK/+bZ9yWrfO/yPdumYsxemS4w67PsSrC5ZjUbvGD5RAzNqiDkQkeD9g6O6KQGPtwn52cs2SZpAmrW33GQyDxjF2JlOWI6ZrzA9KjS5bN7dL2vqz+JS5KtuBYHbOr1wwMSx3a1F4KQbKsMcLPl3wL4aJYFr2PSvzQoi+6piuTlF4k/jVxoPJ5heaTQyfxwHgTIaab47j75Nm9gnqFnGNlbj3BoCCN7R8WBnV9AVkwotnCJ7KEtCHXnnlibEwQ+y6dMYWlcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hyid7T0tIVnvY/akuiaWIrE2RAe2eeaAbqXaQAkF2iE=;
 b=lnwsrZqJmQyLlw+BP5f16miDfjGnlqhv17gGJDMekYC/AupyjPnPNtXMvE2Kdasdw5Qn+grf7h0fcen0yrQKk9HLb/voOACjBdCA6o4IwNCZswOsQMkx6gMeArwVtps7Bfc0VJToRvVuhJKvG0zeQdLj5VvlfDG9YWUAoLxV0BasRzo2XAnoYuhsaUO0yh3yv1AZVxt+T0VUiS20ET6JVEot7UK8Wvnzwy6n+MGKR2W9fM7hjF6vbb9tfXWu2H0gEzJRur41x4oTVKFwiWaPxa+EkDV2T+A/OENgHa/pPVl4Iy5aUGKWpk0ZT/NaYbmBzBYynNhqaS66vgytRQ9w+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hyid7T0tIVnvY/akuiaWIrE2RAe2eeaAbqXaQAkF2iE=;
 b=UTm97GFpbT0bYMr9QVe2yfudy3K1xaHvIjTv32CO5H2g8k/3kScJuijY7ojFvyLiX3ryZ7LD073yMZkdY7M5WNDIL1Lukgf3d89iVuOB1oYAqZKWBOMAd5ypmXcwYp+lP8odsOSYUwMGDSoPT80dx7hkBo9A18dAgLxiQsN9KJM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AS1PR04MB9262.eurprd04.prod.outlook.com (2603:10a6:20b:4c6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 20:46:58 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 20:46:58 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v10][master-next 4/5] opkg: add options to enable support for acl and xattr
Date: Mon, 24 Jul 2023 22:46:38 +0200
Message-ID: <20230724204639.353571-4-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230724204639.353571-1-p.lobacz@welotec.com>
References: <20230724204639.353571-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0167.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::13) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AS1PR04MB9262:EE_
X-MS-Office365-Filtering-Correlation-Id: 99ba162d-e73d-437b-dc39-08db8c871f75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eADwzQ/+Bhgfo1LZHLsrb3s0uhYj1aJ+QGIQE/+ksDTEU2frHqdvqO6PCy7akW9tfFRh+jzntx9St+0Ofia/VOzXKJjo12qGNwTVVl6pWC1BBXs4kjyuifu8kVlCiwKeHm/+2doTIM3bTtK2ZCWCmUVNX0B7ye1frlZhxLi57QiSjyyzYl0O8INY9XldPgdixA8M4+V+VzISze01ZvqILYJii86n5YjhUiY+360SB3NOdGl9fmbsJiY/tWRaUlacx73CmHXUQO89LkjbnzfPaWNT4c724IZEFTtdFrh5/91guBkNHo9g7MvS1XpTy9YsG4ul6pu/JzPv+715/A0IVJZRJNMWxGTDtKJMfh/PrfSvjwd84dijxsBfBq9g90V2vMkP9MAfej6557ItUXVOKUjvpnXGcc/763VUepSrU++WKR2GvgJYridYE5S+x6I5uySwKk/tUb5HMlt2gyX2uOS4Gx2gSylOivB6KgTFWQaq6LWxBalmZGe5Tp8XCmsNANN3DFP3axf8BMjjZlh6JjZ/9h/lSVdClcqyFLoOJBq1IAXgLEJqJc6zr7qFdaQ2YAy0rMTSHXScuWgnZJ98iDsIvG0AuAlLPXkgfoANQDM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(366004)(39840400004)(346002)(396003)(451199021)(186003)(26005)(1076003)(6506007)(5660300002)(36756003)(8676002)(8936002)(2906002)(2616005)(66574015)(86362001)(107886003)(38350700002)(38100700002)(52116002)(83380400001)(6486002)(966005)(6512007)(6666004)(316002)(66556008)(6916009)(4326008)(66946007)(66476007)(478600001)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1vFC79JHJQVW3SZ/BGdi/K8ChMoaLOJ41KGQWCd/23/gN8AluxeHFLjHxx61?=
 =?us-ascii?Q?xeU0gdJJ5XdoYpc2JMpVtadIu/aNBlRIhLaOEKTPNRU5inj+GcdYn73EQgm9?=
 =?us-ascii?Q?VsX4xAhWtwuGnbkRYmgf1R+Dqw6p2bFJHctjROKv8TvbYjtwh73xn/ABmjR0?=
 =?us-ascii?Q?//f/C/CcOtRWBOBZHyiileQbcA2s0MkMAU4JBRCWbeWKh1nF3Ubmqk6SoEOy?=
 =?us-ascii?Q?etXSPPtp9h7h2TmtyMmhiLixSDNiuaTQ0FY1+FnPWqXaW7ecd7bWv8pei4U8?=
 =?us-ascii?Q?Q+72LppZHrxr57okMf6art6npxLu60AAyb6UxB9tCSoBmxsImEmN4gzTcBZQ?=
 =?us-ascii?Q?z6zpF8FWtrTugH3fD3tA4pNp5NCgy1vFpswKYBFQuAmztTFoDEEoYdFRPO2i?=
 =?us-ascii?Q?AzdvqiaIVyPqNtNKs370UvGywGu06e1ZJAk6u814YG4Vb3YvF8r245CZ3Sf8?=
 =?us-ascii?Q?9xsPO3nW55AIw2fqcrK1Yyjfugm1V4iNNfNOi/y1WLDHpkoqdcqZPDcfmH6z?=
 =?us-ascii?Q?7gi3AE2gQVLYPWIFQcpBZouf3pYFxis5d2FcppHwHzYEJVmByiS6NHxW6tVR?=
 =?us-ascii?Q?FXgjF+QmtZFbuJQp4k5H9mrvG1cKWMrybMsJzi7n6qwIodejoBOjZnxEb6X9?=
 =?us-ascii?Q?NkBCHauJDgBrcX/URqYgeBDnFpomYHO7MwxoVKwL5imYxMaSZYoD3y1UaXT+?=
 =?us-ascii?Q?R+fpLdQunPi3vgW6DC9wes312XWM+FRf3epaf5FOYAIOUoExa2Jb9EavkbGB?=
 =?us-ascii?Q?J3wAoe575Mg1QAIi1Zs26QCZrXyD6MSE/MXoYfHqdRsi3OKHlVkpX2g4tO3o?=
 =?us-ascii?Q?EM6WrZcyTdA1y3U3Wa4kYYrm+JmuNL5xPUE0FtVE6ALwxNSPKJQlt3zHtDhX?=
 =?us-ascii?Q?SavGaasVeBKjjp1C/mkfJqjH6xekY8DFXXtBwr0XvcfXvtb0OIxUm7j4ag59?=
 =?us-ascii?Q?MLOHhTugUS2jicL7JN7Ln/FIXsl9xuENIn1iU1ceLl1zYygJG0FnNCoqcvAS?=
 =?us-ascii?Q?hCZHw2RyMf9Kqk7abRgMOdejqlfcd7rhrx4Bo2G2IiwqtPjlYa4UI6GVsyH3?=
 =?us-ascii?Q?uN4sg9SPfe+wwgCEi/0NEmb2bm4y01T2vuMjrc9rQSiTcAwaDHm+xTN6Wz+e?=
 =?us-ascii?Q?W5rfnlKo+3puYmLmjjeoDkm9XokTwQHVaDuFY3IYMJLmERce4cNsR3pEgfGt?=
 =?us-ascii?Q?eKMQ5J4daiwbOTI7P7KfPi8dpOWhf4Mfuze5fhsarmxsDYaczmEiAEaj/4ii?=
 =?us-ascii?Q?6KZ8TSLzjRvH2LmvBWdrNLN9FIkn6fw2MBedgRVuPLquh78ZhtMbUH+VMlF5?=
 =?us-ascii?Q?mPt6gIxyFSZ1gJsYtVpb6Tp2xe3wpNjWdejSGFoh2f/nfWmX8hN56N9gcJhv?=
 =?us-ascii?Q?qhbPoVnNcdzfQwMgsfmD2scR4ARTjU3DOTigt6Q4Op39krDSqqFPNVLBpG+W?=
 =?us-ascii?Q?97WcodanZ205X6MgQ/RUQft5fk9rLr2N0XJVy+nYLa4q9i6ejSvnmZSdtjqT?=
 =?us-ascii?Q?b+ihSOYQwuzA2jlL8X9cU+lFgnIlYZRFVOudv7jDVxWjEEkBvcRD1EB6kOVh?=
 =?us-ascii?Q?IAnz78W/FvDg2SpUH6knKIzaAgwSpQQWUdX28nks?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99ba162d-e73d-437b-dc39-08db8c871f75
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 20:46:58.1475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aZRZC6uRcV8V2KvNpgCJy2nYS6Vv+ZB28x1TeEBeDsiLR6CsxvQvb8ng4oUbk3Tk3MZnmRL9r5E5ha+QzjYfrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9262
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 20:47:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184816

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


