Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BA16C001B0
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 19:04:55 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.77])
 by mx.groups.io with SMTP id smtpd.web10.4464.1689188688089454094
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 12:04:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@welotec.com header.s=selector2 header.b=QoXXfE+Q;
 spf=pass (domain: welotec.com, ip: 40.107.103.77, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cz6vr2DdUMUTfAA2dwZsfu7Pzdxufkk8Hi8EY5ptrkzt4ogec1yACVBagg4zxuXatQh85as6zdZ43sGJ47LvgbUCLYcEP0Yxql2d/Uehnzk15i8vP/ErOnjmx01XTbQYWFNuyDAwhjsC9X+A32xzT4kTuROTqht3hSkLQWJEJrUfjgK1W5U4shJ6jVsHowhb7uQC0aAczXFy+dia5p49s/bbyHeUeOcmVQbP8cwtOgO+gnHPF9tuOmc0pfMkTrsNulmX0Jmq3fZd2KvYRW9UEv/JX4a+Pe+DvpMdlVe/lERxnhBuSVV2dRPBa3QL9vs7EXT939Rmt8AjE9Of6htItg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O+kMQsllH0+GDrHbPuSQu7y9qGr4ZmAXuSDpMXc+7wU=;
 b=QMXHNmEYb2nAQB39lnhU7lZ/x1W7fel4fAFcTKHYtCdFJuUM6M73x7rdNSqp7S+9OW+fJ6NBHc6U8C3P0fur1HnQKm/ZX9dirxOO9EACT0HY+o7T9BgoU9du1gD6YuriDKR5NnPk3Qs43lwaYk79IiVfgFj01Ezfg8HEoO+tJLs2Oh0ej6eZxZ5kmtUaPJ2gXRvRrFkYUZTEwvWEzDtpZiQqshVo33+Na/kdelAlPIColRChYgwm5Vzdcgju5zytd6yhXcQpwC5ptwWLctXG6scRuuwrxtJwkb/Z+15lDTBg6QRMAcOhRUpwL7CXih/znmqFhizebjiq7/qcpXBxJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O+kMQsllH0+GDrHbPuSQu7y9qGr4ZmAXuSDpMXc+7wU=;
 b=QoXXfE+Qb7ZvXnNN/P+INnmB1KM2m5wb0sVPmZGNehALwZx1K9JMVpqaxhFGUUqG8q6u+9Wxr+TrgvfWatGp6/LjsBiH9I0zGGXFP9AhE3Jh0Lg0vlD7G4eL6RzWPpUBMHIuBShcmjRepoyNIxB6fu2dpO9El2FKMIOahkRfIuk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by DB8PR04MB7051.eurprd04.prod.outlook.com (2603:10a6:10:fd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 19:04:42 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4%6]) with mapi id 15.20.6588.022; Wed, 12 Jul 2023
 19:04:42 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v5 5/5] opkg: add options to enable support for acl and xattr
Date: Wed, 12 Jul 2023 21:04:28 +0200
Message-ID: <20230712190428.379909-5-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230712190428.379909-1-p.lobacz@welotec.com>
References: <20230712190428.379909-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0200.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:89::16) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|DB8PR04MB7051:EE_
X-MS-Office365-Filtering-Correlation-Id: e51d5a89-21f9-43b0-4eef-08db830ad8d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QpDH4IyLlQ9tjFNka2kQ6DDRh2Lf2AP3Cs8dVMhsZwToNssEp+Gvb6CYOAtLbuh7bAnQihf3L3oGJ+QCCMqYefTsobr92DY02yJB33Ed18TrAeTiyz2XGdNb4KhvTp6jP6BdNbg4qdhR0uIJP+09V6W6tXFARhdp+m36cYEyt9vW2pgyWYYIGDEZmjkQkgdfcFV1nAmPYGoNktW+ioYVE0JfcavCjj2dteRGiqCOcH9FBDghHdZUOmS/MeOh1dV5wZvDshM5AS8SdffI5apaug+VtOxkl0XGocuUiZl3+6OhgMv2AAnTkg/Ma3AKcdDhPgxIL9owqELa2A3Gg0lXYSs3mZku5rzLq0AgXd1nEkESR1AOVzinJKOdv5I2PEFpobvJBjMV/tbFOoP49ev3+PMVgVa5S9gK566VNpRes+HqhzTO4lx+MT1TS9HooBsMzg0/YwNuRAmwnylWP9BbiDA4nlsabz7Q69w5UCjKAsaf1Iw5G89Wg4ByzKE+NZvaXLDB3ZKgmiUieLLPr1RbQERiiWEXsJp0CZcnub4USJQ7fj2BtQAYY2KWvhVF0MM1XbPRyuwgMMFOiVnzotrVh1/IMn/xmO9KxMnme8rt1lc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(366004)(136003)(346002)(39830400003)(451199021)(8936002)(8676002)(38100700002)(38350700002)(66574015)(2616005)(41300700001)(2906002)(316002)(5660300002)(4326008)(66476007)(6916009)(66556008)(66946007)(6486002)(6666004)(6512007)(52116002)(966005)(83380400001)(36756003)(478600001)(6506007)(107886003)(1076003)(186003)(26005)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?C01kFeSUphcwKpoqr9aM5PghS0VviWYqWSIkjlrfaLshh/o94hpSjmSSplmc?=
 =?us-ascii?Q?eRZLKmIKxKBZF/AoQP0MOfu76EBT5PoGlq2t0AG5/ea4fGUUzrU0G5+unRpj?=
 =?us-ascii?Q?K6vLMVlU4aaPQu5GgrQX31p3nzt5Qlzaeu2Apy9Lw5kXej42pjXCOdsWHTXk?=
 =?us-ascii?Q?UxM+U/fAuv1XWw+kGWSmayGWM32I/O1T9oIccJ4LsT8WiFzT2RKTQZSXGR7P?=
 =?us-ascii?Q?sDHbrIdMpOjrCevzqkts9BLV5dnHZ4JWO1eTYW/lcfMKj/UcZj+uCFp9P+Vn?=
 =?us-ascii?Q?AcgpNGr2ZWueWbTne4Hs21IbGY/5Zw3fGOGnvpJGAPtQp+huJOWangWmoNmo?=
 =?us-ascii?Q?7n2QsbGHNOlJcOKi1gI8zPDh1SVoMzzIhVD7dGe1GWlGi+MHkBp98MDJ752G?=
 =?us-ascii?Q?KzxJpxNrFXD0ecFP27OKZFTXA0jTisUxXDycNljH3vStASLghxbzVKTP2K5H?=
 =?us-ascii?Q?ckkhtNXew0eu8UWjb7uzuS3JdodYNhtTy5vxOEs3B9iuxmhVJ83DF+aytmlX?=
 =?us-ascii?Q?8Q7BEAc8d1ni7SkxxHUsGOm3kANeDycarbhwovvsrMcnNujG1W1S04V22/q1?=
 =?us-ascii?Q?NWykl3hpnc9ppI9Byk84JBKJoDtNh6sJRY186UqZPLfVlYZr4lEBwI2xwqLU?=
 =?us-ascii?Q?ZhLk9C+Mn/vBpkW77SHFdokI5paVsC9v2F6Z0uYTJauONJGtj0iYldk5KZmb?=
 =?us-ascii?Q?ajdRntl8sOjaozz1J3LDIw1ceCE4FdawxLNIsuSCKKrm6poQOVK/2ikMMopB?=
 =?us-ascii?Q?ppyXKLHnuxey+IMB+6XpKbie7gLP8dsVdwKPmv9xL3Use+dDSMMc47EVN8hQ?=
 =?us-ascii?Q?5ZaCGDgK1mYtNovWpcMeAv+3Vg5ITj+jzmDYDNB20fX55Nb/rIp+Sm/fP7R3?=
 =?us-ascii?Q?UEQi99EOeIAeV+v5eO+FpO66lUq1kSCcx9g3Jbdy7PcugmlLxL+xda82LaeP?=
 =?us-ascii?Q?r8I/oWQM/H7WsR8T0sT9Mb+LConnzZNPPf4wYSYsXpaDetnycjiXJmzZdN7c?=
 =?us-ascii?Q?IBUHcKO3WVQK6WGnCtMProfMhoG+BANGJDo9dCnGMjA8vYWz11BsiNJ175GR?=
 =?us-ascii?Q?9kOaFR93MAcUCHvISueubMdpYD1Ir07Md78CgIkL3LsLIP9WH/5b2KwmYeHN?=
 =?us-ascii?Q?Ca6PdhRo3HJ64gXwqye8upWF6eanwSuW6R/B0dURLknUWTj0K9e5L28XR/cA?=
 =?us-ascii?Q?KcomZqlmfsyud7brasqyzgzfuEOhfmO7JaUaKiGqWQYVdBfTN1gzaIQTtbvU?=
 =?us-ascii?Q?PrXWLhszI2S5iuTCscPClKsJRYNGWDCs44GVOoX4nWG2Zgj3kC3p2Vmuj24/?=
 =?us-ascii?Q?PXSrbpOUREh6maf5BoW3oVsSz/EC6HeKUUnRhF3iV/kG9Hjh5Q9+yGzGZvDO?=
 =?us-ascii?Q?XfF9J6yp3SSZSNMc2ZedS69ThBO/P21NUBnJL8fgzSiA03DgFtqp+jifsPzr?=
 =?us-ascii?Q?M+zsGKs3fLXWbKV0TxkdZ2r5XWkp2Pvbz4jJ8wFrnOYSuqeQGZuc6wJjn4qf?=
 =?us-ascii?Q?VqtRSfrW9bSTlLmquepIfqVbZqm1xe98rmXUirobAy60nSDHbueK9FC1ktif?=
 =?us-ascii?Q?CjZwC6dLWZ9ffwEFnxZNlNq8KTWuZvgV0zywzVRm?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e51d5a89-21f9-43b0-4eef-08db830ad8d6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 19:04:41.6631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z2iuf/uYMvSnYw0JgOqXLh0Px8YJuaaOYTRjY4W3qNAI3Lcx4F7enOmLTtaa+KjnoIc71Kd0SV9r/xxWTkQlRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7051
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 19:04:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184217

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


