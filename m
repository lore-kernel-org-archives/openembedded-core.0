Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 419A6C001DC
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 09:22:49 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.78])
 by mx.groups.io with SMTP id smtpd.web10.7252.1690363361353950502
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jul 2023 02:22:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=aqU2HlRq;
 spf=pass (domain: welotec.com, ip: 40.107.104.78, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dj/TTlS6igiyKrOTKTkKK5g5gXlvZVOmNTb4MycV+WgHxV66ss3pfeE0foEPLsRwskQzheb98H3rky3rLKAQ0SO8TqwH+sM/n6FXvaVmsqKIs1k8UmKLz2kPumTtsI5xflxQL8kEAhARDiL9168KaXS/Z1+fWyk8B6854Skql+m5SyHZ+SoQJFq/aMVI62O/AMc9MdvW/I/aLnkqWci/SC83janCoLyrOECqIjplKhiIkM9oSSt2BwABXvin0YDRRleobf93wBzeczRol9XeoMgwsYDLe3CEtBlUcbH8fAxxZzj28yLNQUdxCSQmPIK1p0KWNM8Scs14ZaatvD7s2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hyid7T0tIVnvY/akuiaWIrE2RAe2eeaAbqXaQAkF2iE=;
 b=Z/PDUkbRFRqu2mwGK7/joxrxa2K2wdiWm1jEvU7gfF6QKy2uCf4CYXcF2PIxSjpqQd7NQ9GGiYKp3a72cDl8/gc0XyEk2cPPotVyiunDnK9Yh2KVRpxqqtSZ8IX7Ofpcj8cvEEWV2AB0oj7+ep8+tlcTg1+H8gKHXSYaA3VR4kuVG0z2bcVbqpU5a83L9WxYsibd/mn/udot2zJvcvKRXSHlz3anQ46VfP9OItOONnXeC/XlBVJw6g4zAJeUecvoBK8m1CGJPITzNoweDvQRQvXs1prMBko9Y+5gcdROcfQOSpPsFJQkgvDvp6hcS/9yFHyksuxxDqZmwB+xLB9b6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hyid7T0tIVnvY/akuiaWIrE2RAe2eeaAbqXaQAkF2iE=;
 b=aqU2HlRqHF2dHloEAKxqQuiG4apFbN9DZSjYHJRfBCLSomTZqke3rSNCKzuZH3pZfVQHCzmQHJuE7Nx+DHMfusquMTIRkRauHJxyNkt69WPeNXEFmAjZItv/YJZJivq57IrxQhsJsEt3QrM5xD+tMKRkeJqVdwMI+nbrMoVyGWQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AS8PR04MB7830.eurprd04.prod.outlook.com (2603:10a6:20b:2ac::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 09:22:38 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 09:22:38 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v11][master-next 4/5] opkg: add options to enable support for acl and xattr
Date: Wed, 26 Jul 2023 11:22:27 +0200
Message-ID: <20230726092228.1005306-4-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726092228.1005306-1-p.lobacz@welotec.com>
References: <20230726092228.1005306-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::23) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AS8PR04MB7830:EE_
X-MS-Office365-Filtering-Correlation-Id: a0ee1b32-ab18-4db4-21d5-08db8db9db1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WvtM1q3/XkGfI227tdD1JP2YtpJgfAiE+1nt9yCxFSmgsOaLMQG2/ihcCysD6BTaH91spK6H3Ds9iZFGq+xDhqCKnSRVL1mywfGB2UoGRqTFg5BsM2ZJ9ClWhlRnOuHIDGJ8d1UMs7cpxhvDWM0+jZoCAypGZ4pojBTqJDIay6IMaoCN0uguOf9qy+0Dp4qu/h3wxqgolUaR4L5HDzvlGxFxuZ83m9Be4B0b3oDv6CKOGybMxti56KmYmHSwBLw7/MtiQxG4+ivx/X4sBk1wM6L25m/+p+c7OJvfAD6bbYD7uG0MDNPwZ85psE9BSvBcIl2ZW9fsgSrwLBp3yPmvd74CO5bISvTVEBHH9QLkEYT2I27n2wjGAtpSDgywj50MhFwjcdcWQo8IBJyGZkCN29yfPqNNrD+AJ6XlAw4kZqzJjZ8UjS+zgdN8XCTlfsy4djWS3PQPvHusDPYb941OYc2V7hwqFmSv7Q80JqUlwn3KhrKzC3jbYa1oywmpv4ZmMnbETKFEp5fzKC6dmtZ5N91csDYQ9BeBZze3xAw0a5vcf8UN1XvLZIB4vUEogD+xwxG/NStcHP/8VzTMIJ0P5jyZ1E8OATbaRM1rBIKtABw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39840400004)(396003)(136003)(346002)(376002)(366004)(451199021)(316002)(41300700001)(66476007)(66946007)(66556008)(6916009)(5660300002)(8936002)(4326008)(8676002)(2906002)(478600001)(36756003)(6486002)(966005)(52116002)(6512007)(6666004)(86362001)(107886003)(6506007)(1076003)(26005)(186003)(66574015)(38350700002)(38100700002)(2616005)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JfDp+W+HklPeDIsqtc/PlVSbX33JHZJwHhgkZDLxTfD4Zm3rIBEaF5O9v/0i?=
 =?us-ascii?Q?n2YMlRyFOFsKcd/PTvVzYLvPxmO+r51e+Cx9ORHmucJqODoiGaQU+b+pXg6I?=
 =?us-ascii?Q?DCFvlB+jDQYzY7vfYYsLQjeoiToWAyc6IEfmnVdPLV3hb7WLKrjcVg+tfUM0?=
 =?us-ascii?Q?pztBqMQ3ic7WrRPR2eKECKOYN4Bf9Ik+UQfEF1z5uL1dbaD6MVGr6248eEAn?=
 =?us-ascii?Q?a8OPlKBXY3Y2ySr0Hm5SI0iCWmo9toFL4Mp8ESGps9yHpM/VG3/2Op9MI8NR?=
 =?us-ascii?Q?zC5HTnjBCWOkHUQCr4n9MdPo4HE7tPCxWqleTHsSPeFGkiDYgm5EBawzfVZw?=
 =?us-ascii?Q?X64sZ86/gSZKCDi2XA6F17X4qxtXiu5e4SREBMh+cIYozzDrc9bni01Z3DNM?=
 =?us-ascii?Q?FgCtT0/3cnOkwwshjOc66ow7deB1UNdHwuPngDqYhqRpbSgiqm5VEOZ6qqpY?=
 =?us-ascii?Q?fDXEGYz7s1c8rST9Bi/ZPKXxpHqD8pHngs5LUmmNjUyABQTKTsdPgJY4NfVB?=
 =?us-ascii?Q?ZMcqT1cJx3TrfZ/XCokaS9Q7leJfqz64E9Yxh+sgNGbbv2dgQkjJiJ+EcrMz?=
 =?us-ascii?Q?u/9pX4gplAn2sLzv8KXKghavs9g/kM0urbPkOKgXmRAmtjYso0dBriuRTL2q?=
 =?us-ascii?Q?gWMfLmwsBPVAAr1w8Y76fpLi7nF93TFYY7SFEqu9bzJ0SIuz3RIsOU07u0Xk?=
 =?us-ascii?Q?wy99KZSAETIrM3S8m3+VVDHD40Nn+7yVYAObLUPOKiIpzXPo/VNXrHytu8eY?=
 =?us-ascii?Q?IEGsobql1lJV4KB/PfsosJczDRHnd3u6SsoFPu7/SKYkHw0FVJPfiKlQWuz1?=
 =?us-ascii?Q?e9GQ6xTXo3T1XIm5xHrMlEWdWBho8hJBikF2IrFOGC7PgI/87uQ/9PtUy/Vc?=
 =?us-ascii?Q?cFeJRNKfepZeBOd+FJxvBzDXGbgN69JqEIEOVaUiJvRW0Y3PAXOVl53ykqxH?=
 =?us-ascii?Q?BGNUt7KQqBvi0PlutUt3NlTA+eOr4tuyMgATq/OMZhhGJ31rFnMXKhPhaPIL?=
 =?us-ascii?Q?vq4FlEQoVeA3d6lUA63tqMhaVL2brPoXFx6JkAjuvOQ5GT0qxC4FrC2gXWHz?=
 =?us-ascii?Q?kWiTWbsBL1RO+l93LjnVpVYVDMHspzDsjiVUGdYFaCcQYl6zP6IrZ+OYEVAi?=
 =?us-ascii?Q?L1/hHX7C9w0qjiN/B/hcWzzkys0Uf/gTPuLNZUuSQz8QdABg0Vdbk90SCmWX?=
 =?us-ascii?Q?EUbKQGHYTQdzIQeLeEF6MjL+aKxjTxbZyeozwWiOvpQ9ftf7ZksarPIrnGrM?=
 =?us-ascii?Q?Oa35AIocr0J+VdtadnN1FpnM3h3GtPDcpJAL3KGSQK7P4bFxwRlkCLzw/XE7?=
 =?us-ascii?Q?S7SEZyEvD7UY52EDo4oYdV/mqtxQT94usnfwUoP6TsjoJJRqJWMYFk95iiix?=
 =?us-ascii?Q?ZpbWOrdzYgerBUQmN+lD1Cg08TBDqgCVD7u45MO0HU20363RSFRYuQ7mbK8b?=
 =?us-ascii?Q?Td9IJHc3JolIUl9FgRAxq+bWsxGNQhPm3igzukwUy+nSqr5gdYbBfRPVGfwv?=
 =?us-ascii?Q?XZjTLi52OZJ+YQL1OfT/g9lrqhpE4tqcT8tgQmN0JiLFy4A3SZy+yGQ4LFnV?=
 =?us-ascii?Q?s842y36zuUsAnmYfQoYoNmGE3PrFkfedgntKfNM3?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0ee1b32-ab18-4db4-21d5-08db8db9db1e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 09:22:38.9174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ut3oY7JZMQ0xScksOnHADCPLRBJOQZYqruOKz/5Gb8CS6Sx+OeG1sKruiVvD7VZYJYvl6fOw1UATP/1CsBjWmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7830
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 09:22:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184873

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


