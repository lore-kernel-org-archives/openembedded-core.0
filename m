Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 556A5C3DA40
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 12:26:22 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.50])
 by mx.groups.io with SMTP id smtpd.web10.5969.1689164770219531763
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 05:26:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@welotec.com header.s=selector2 header.b=O+2CNs+S;
 spf=pass (domain: welotec.com, ip: 40.107.6.50, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gPEmmOSYPeoOb+IZ8XZyCW2kqLpmiAVdgRw/D43RH7IuYvESLnToqsfeQ0qzJSfBaa8C7wtYBclz5bLDw61/fDYcc9jCA+sA6NVScxXnrA+Vo1tul2qkrhbuOY4/pwn4bidpzH5R3LIBTavVWCdLrKDmWDsV7yS2yEgIAabI3wcrC6TNly3C2h2uJU+xc16mATlBRp11hwBccof2OyfJhE/JPgLtricg7g2yjLcfnwf7wDhiNf5I9aPvAsyhheXZy5hQgMiKjAEF1SONe4KxQcvalS/zc77Su7SVnW6AZmo4jixM3uDl/d3Spx9OT+/G7RiwaayhgPNarYle+0msQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O+kMQsllH0+GDrHbPuSQu7y9qGr4ZmAXuSDpMXc+7wU=;
 b=NpcRgH4VlxjbhNjMMwp1WCKdKyYULcult5hHN1Qqpw4zDqH18RJmpn9Svku7hymWfzaZnwpFNif8aqXpxr7W2JEd8iwX5eA/CVdcLYK1U0dtVstPh5FUWjeaXKtf/FZjcTkcqa16n8Oxtww0MK0q0rrTMBx16Vn0DDyinYXa7rs0MneXbBcYZOKcMqQz2jc8LGUPRHhVN2GCvnlWrSi0BEBtbEc4jwLCDAQsUCyGMn8iYTrVl0Kka/m3DYp2A/KnzisZr0JtDeIRn1GXt+8Uv9aiwinWY6XMQIQB8wxy7hPl7FxuoGPzdo1JfxQerGx0gO8wY4iWB3Sl2+ag3U/YUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O+kMQsllH0+GDrHbPuSQu7y9qGr4ZmAXuSDpMXc+7wU=;
 b=O+2CNs+Srww15A5ykAYzGSVD/fRA2Fb9iPhDnUIM1FHZfmgXXJhIIvy5BxoJIaui0ACfdgeN3A9YwkoUrdiSH4UAfNhDG4csmy06hJww22AgU9LocWxvvfFpocfHUZsBi49e6wu/zVqINnO/Vh9lPkhmyC5m8h7kmOnBXtWudYI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by PAXPR04MB9204.eurprd04.prod.outlook.com (2603:10a6:102:227::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 12:26:09 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4%6]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 12:26:09 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v4 5/5] opkg: add options to enable support for acl and xattr
Date: Wed, 12 Jul 2023 14:25:58 +0200
Message-ID: <20230712122558.711029-5-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230712122558.711029-1-p.lobacz@welotec.com>
References: <20230712122558.711029-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR2P281CA0114.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::6) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|PAXPR04MB9204:EE_
X-MS-Office365-Filtering-Correlation-Id: 47a1b1aa-abc6-4ba6-9b04-08db82d32c08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SmyNUzxk2ZpPDg4qwaXz5202uKLi7YHJ7waKGaGJ5DL9FYIHfhwkOdMoV1VeCvz/iLcYr5mmwV9zOuxAtrw3WmiDYY5RnSq5TjpmB73TWhibOih1tT+0o0PL7es4ipwGm3vbAK7420QdDiWUgnKW9kptael+7DEzmyw0K/l7x7+KEDsrCIm/besqZdjsnhwXGETlrGpmZm1AGQlRWjpeb7QBYOQOzo2pLCNUS5MO5eN/T2jNJWaDyiJGogWNT3VAQOQUcODqC+O6Ntur82gTvJIYUtulZuAxaz65IhkWXBCSLazMgU+ZNYwsGodJXFQirlBQI08Jg8R4NF81BvzSUnY7xGCZOh/Z3YqENLUet7i7Qtio7PAUsLZxNDHV8f2z5UjjG3w5MXOudNPTl/IpGBwFLFoguYPmqz8dbU5ZQ9tqWKExGJfujYuxguz6C5cZDqOEIOc6+QVSGFbkMd/GXxJ7EXUkp5f7w0RFFvFlSGhCrJjsRVShWCLGBBjhN/5qw5Iorl3D5ktefvVMCfpWPB8TkIECprNxm643DemYNGWNTNgi+2/AWFdojIX5BiNIt2fyS1FIAWeUCo9HWuhqyHxvkbfflBB3lY15/ddUuZQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(396003)(39840400004)(376002)(451199021)(6666004)(6486002)(478600001)(52116002)(83380400001)(86362001)(6512007)(107886003)(966005)(4326008)(66946007)(66556008)(66476007)(6506007)(26005)(1076003)(186003)(38350700002)(38100700002)(6916009)(66574015)(2616005)(5660300002)(316002)(8676002)(8936002)(2906002)(41300700001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OWVEaKtyVDo2zirneSd3kAsULnBbuGQ3T/EE4jI4GRnhsLUyeCSN+5s0ZyoA?=
 =?us-ascii?Q?lWOqK1nvJS+u68AEv0EhkeZHfNJ7sDGu8uRD9F+U0bz7Ua9VMwSD0aIydx0X?=
 =?us-ascii?Q?3o/pmXKRHZziozSN+PYNsLvsdCk1jov6xoJYx5xIqHRbKAv3kcPJfEaQoRzI?=
 =?us-ascii?Q?h7akgmxiNw3p7Z18sQ5ZZspDlYIOEc4F0VSootkawwInKAR8uOn+W/AKfatm?=
 =?us-ascii?Q?Ba+YtcelMAa8qkoQrMNX/iatsjFlv1SwVFVfr9g7lF44OdnDbKEypTdvZCEe?=
 =?us-ascii?Q?QYIMgFqmvJ1opPOitkWjV4UjZQnSIQLF8qCJLJ5rDQ7TvH7L9gcDRJ6qYojE?=
 =?us-ascii?Q?uN3TAQEEGZaACZMGsVi1z8GUbCrwumqYUTqjLnATy8u92MKupDtZoXmhcS6c?=
 =?us-ascii?Q?zXXAeO2laCa57sQ/UgHXd0fmR84ps8f7s6dXqFvSyQGy2AKwLjW7XGt20WYC?=
 =?us-ascii?Q?IxE8AhGFnmqWjfLlQwX7PRD9pAvZy5w4tfSWj/4OjzPjLMHGoDuzz90nqskl?=
 =?us-ascii?Q?jEAiCTGJOP8VSL1gHgR98ZpYlNeG9inevL0FetjOYK+Mta4wtxHbJ5ruKn8I?=
 =?us-ascii?Q?sZGnjHpluqsdqEGLBXJwt2OyF3qisr11iVeO1TeH2BqoEkZzeS/pgV33oGuj?=
 =?us-ascii?Q?qSkPF8dWGkFsAHuRkrKn9+u18ahWv6Yi/L3RJw8guK4C3VD6Zzh80+xtmVWi?=
 =?us-ascii?Q?LZBSFhA4M02lrTN6oihY+h/4Ok9cSFSC+MFrdQu00kJKqaj0Rt303WFlreHn?=
 =?us-ascii?Q?nvey791p6AsZrWPbUMRWwBUd49L7H1gdXtHwONuvD3X7rmoJ5q7sigpFOuU7?=
 =?us-ascii?Q?ulxEWf+fYlc2Hw3IX2gLl7O7PCVJBYaVKLi59Iqnfrmp60DOC3T7E2x4ovsg?=
 =?us-ascii?Q?3wIPnE+DTp9YJWswEnt99+eg1rU1PZLKscqi8jophotnCvtKYkJmj2J3SxWj?=
 =?us-ascii?Q?JIs9hg7KJ36c9pZLrjyQnbbf+pKCTk9wPvuRlV/K75uS6xM2E9OU5hkXd6q3?=
 =?us-ascii?Q?qSDVw0pMCDia+DjfF/eAWgtC7xDQgj5FRIz1+EZZuNbVrstmdGKX51wPQnzH?=
 =?us-ascii?Q?1WzSYNWvBHTkFqdEnX5RXYsxj8/TOBHDZ0y39DdS34+tsoA2RSlJ80ugG55D?=
 =?us-ascii?Q?RLEPJ8PLNJUZu/dhLmEggHv5BX8w9us6wsLWOrg04PyYLv8YYCv19v4zwYvW?=
 =?us-ascii?Q?2+pIodRdckqB3i+Z8abKfCaJaEY5vMXRAaUgM+lofRVxfuQKCt1D1Z4x1ETA?=
 =?us-ascii?Q?o4PhFlztLOAAjKgji/j/vl9s+UeEZNse2x9XnBqCzrrafT75Rf6pe4UhjxFY?=
 =?us-ascii?Q?wP44I72SqMLOKndOkISA4OiwnkxKk9NRmdZznrglyuMjDu7b/BJWREfOuoHV?=
 =?us-ascii?Q?KmvGWgnSKcUO4q5k+mbZfimXSfb9J4+kihKuojmmR2NJki0+3/ghNFPp33A8?=
 =?us-ascii?Q?nTgm2jcmZroQou3M0/Th0hQ6B3ULPXZhjmKgk0pc5v3V1AnKBnik1MwEKX/5?=
 =?us-ascii?Q?jjoC4DpTcJQ7PPyX4+dAjyD2Mtix86a0Kn1jHvdXflOB4Q+Mc09GdjdRBWTy?=
 =?us-ascii?Q?+EaGNBlQNccc1JvmC1nyWyBvOsGG3aQac/D+ZetU?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47a1b1aa-abc6-4ba6-9b04-08db82d32c08
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 12:26:09.3061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZSaieSXCkbeET4bVeE9/5huXOe29mRhzvdGZ1wN004hlGvwZj5RPjsUZDfN3eXIRyVpedWE4IJYJQxFKLVJdMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9204
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 12:26:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184193

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


