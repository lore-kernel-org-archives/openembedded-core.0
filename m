Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA04FC001DC
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 12:07:49 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.42])
 by mx.groups.io with SMTP id smtpd.web10.5650.1689941259106516710
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jul 2023 05:07:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=sM4MDd3w;
 spf=pass (domain: welotec.com, ip: 40.107.20.42, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dDnW5dqb2WSAd0zuGPyAGyA9TfGm2qNRR2VgZSoQYSPHIHC8e1Zq8AdGv0eqxkC4D1xiYeJ+2yECdii7LxdC0m584DaFsFPjaZSUNJ7/Q02gVO2rNZ58M98jCct2R9OSmU113NPNMW3XiUB6v3JqSXPYpVa+eBBa3xHnqrpR45l653IsOtj4I7g4RJ4RL4AC221VGBZwBglxE21IsUFP6vjgZvKmC8wUxEG+27i0WSUsNQFm1Nu+b4u/XTJVZoxyn/Z85HtGhkrK31IdwIzuPg2PXIWQGXswVcW3F2CEoyT7CXjfHcIBaoMgOgGvYa6vIDSzFZDIw7rrVGv0MRfDyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hyid7T0tIVnvY/akuiaWIrE2RAe2eeaAbqXaQAkF2iE=;
 b=NswuqWAw8qBbJDEimCj3CZ8MZrkLNI9esbnEk+MQLPn1ISdC9eQjj/QCn3CkGcE+Mb/uFtoEosAHa6bmy8ro8B2S4oDpaAZIaYovUQGrMH6FztocGW6fvmZj/bNkx270BtjG7A4UCWfvB4OjdnZqI34BK9I3RD9/9WYhCDE7zMWkZEzwJjgWe2YI1KXZw1s9mZl6AsvnQ4yEfSxoo9+rgWZgzoewfJZRrohnHGCF6qXoFP/c6fbAsZBti+4kOyMdaWmcU7fD4yp8GdXgNtd/yGNh2WuUd/i6xCDV2FsrIGW2a31itt/j5n02EUA8Lqm/XUAblQveD3C0MkmIGL45ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hyid7T0tIVnvY/akuiaWIrE2RAe2eeaAbqXaQAkF2iE=;
 b=sM4MDd3wHka5IJICeQwhGOu6FbavmBRgm+LE5nFBWCV0lEVC8cn5HkWG9fTtLVNgq/ddmFZMC9nTY+LNUDfUOJFXnOUx0Yqg17jc5wg32q2NofxSKwIySSEWikAwn+FewU0X7MN14DCPq2TGAdheRwjlymsiGazrm6P7PheZMdo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by DB9PR04MB9578.eurprd04.prod.outlook.com (2603:10a6:10:305::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Fri, 21 Jul
 2023 12:07:37 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 12:07:37 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v7][master-next 4/5] opkg: add options to enable support for acl and xattr
Date: Fri, 21 Jul 2023 14:07:22 +0200
Message-ID: <20230721120723.4006443-4-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230721120723.4006443-1-p.lobacz@welotec.com>
References: <20230721120723.4006443-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0124.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::13) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|DB9PR04MB9578:EE_
X-MS-Office365-Filtering-Correlation-Id: 2630c4ba-6223-467d-edca-08db89e3129f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MbuGl197FTD6a8k5VSttFfaB4Cb0tQ0FQWi/84q96WimpjCq6sXdNo8icpAGmazgHIARF8N58pyD3qsNpbW4fWzfw1r5oEawSXRqqjSYMsA2PBfWLvqRiMtwdDLZZarKuvY+njY0j3eD/k/MVKwUCRGsx8h8QGBa+HKuf5kUds/rWh9JdyaE7rRrw5DtHxEkCstRrTNrOPsw27GrOx1SDpv90X0+hMrSw+KlvDMrwDJURITEjiINoSdyiOyQsc40gaU5ejTm95hh/FxJ9QPMjeYhb7iU4gXpjc2llL7S9k2nzPx1eMcF1vm9lkdGGCydUS1bEdq2zKEW3V6YVHDwMq3NFfDyBNSb+L3sfYpvmMapIEy8JxeFXfZn0qzEe8TCWhRsNRo6NO0mnJKhU6t6DjRz8k+gMSmEiokuXmT2TgJoY/J4G6A2dHA2m6L4y7FRs6b/LA5LbqwA6VXcCIztb9x/kEKe7VjpVOPBXZ9uaF69Zl9O/Nw7XxubSZu/esniqSJM6FP3fhmpYHVsYwDNPX3kDruMuGGYqOfzOr2sZZu3fTX5FlfVp3Z1HB+y/P688JHFjppl5SNTw96RqwDj52CGnYdAk4TKRi6OFK1YGCc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(396003)(376002)(39840400004)(451199021)(41300700001)(1076003)(6506007)(26005)(186003)(107886003)(478600001)(8676002)(6916009)(66556008)(316002)(66946007)(66476007)(4326008)(8936002)(5660300002)(6486002)(966005)(6666004)(6512007)(52116002)(2616005)(66574015)(2906002)(83380400001)(38350700002)(38100700002)(36756003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GFA8AMSJoG22jIiNvdmgWCAT9oYd4MSK6sUYpizqGLB9k89tMO31Xj6Qb5iX?=
 =?us-ascii?Q?TDKWp4uDBRnWtwpACXL6Lw9BMs5kn0r6OH1wOurjdGaY2fKQCqWxOaTFx6oZ?=
 =?us-ascii?Q?61QdP4kMzeQaDfHHg6aqKjyjob82mqHxzJFhnora/Tte9ujLmUSZ/eFoiKeF?=
 =?us-ascii?Q?R9ANgsQG8vCJW5aMA2hkWViOiNXebgUtaCtCWvSGJfR2nSbLuZkJG+zjrKRw?=
 =?us-ascii?Q?fVRuyiAiryGl11NQLpKerunIanI7Z4u9ZAVf6kw9UX0oDi3jtBiONW+vRr8V?=
 =?us-ascii?Q?RJ2nIs6iWFUL/XZ3sdpHkbkWU5CI8innfXGnGeTxQNQFyYjhY9RpbWqkEAvy?=
 =?us-ascii?Q?tF30EWz36MS36uM+1PbFSHoSc58PkCjigxnTXQWPt2R+0+DwwTGRC00LVObk?=
 =?us-ascii?Q?h8PEf2mK3oJtzpTCwwyYUaumO56GRIf5SuQ6+3a4cwWmQnDPBzhf56rhhUAS?=
 =?us-ascii?Q?t+ojFWHEPl1kf5hAob3tZ6KyChYg94ztCEaFln6vNzsOVJWvnHrRiK4sO15e?=
 =?us-ascii?Q?W19h38fYUQppOqEAB+6/XIVnSuvFZsZIqJXVElxZdvhLyaMP1OoLrlnMSXDc?=
 =?us-ascii?Q?JWFf4kiYnDJ8IvdoTeFJ1JxuG3O6zAvcq+DYvlfmRrUwBl1nmxxej5ozR4Lp?=
 =?us-ascii?Q?vkbKExkioIGEGnjsCyjQRtNOLGuBWxl/0USzTYDENPiXugUws7XfUxdTWNKo?=
 =?us-ascii?Q?X4NUJmO8wZz70F4bVhI6ckXnR+1Z+y1A9AHbeCqeAJN+/D8EEyyoVhVxzbOg?=
 =?us-ascii?Q?N+Y2HhLuWIkRuVUJBsFuuYjL8qPPt+5l1NzXHsq+IOzGbbcUKkIQ6AhkGDVS?=
 =?us-ascii?Q?4eEtOcd07X1fPVvqjoeKADluDXnd1MR1CFcoJ/HxEdhjQPFKZi/iBA4TyPRc?=
 =?us-ascii?Q?wB/RenDDom7WJgMW7YSKI4xSqchWE39i9C1P7DxILJJqy4bkkB5CAe5NKSVz?=
 =?us-ascii?Q?uMqztuTZk8hIL6Jpv3sEwo1ezU7W5zIGXDQMStRaxbhjYY/iKNnHSQ6OgBnZ?=
 =?us-ascii?Q?j6HWU26dH8P2O58nQahrujQk5EvuL9Wq2MFgsqKJz20C2ck5LumMtItqUlnw?=
 =?us-ascii?Q?69/WSMjchzOu4dBMBgtSg/iGjhsrrzQIPEZQxhrZbB+ztpIHr0TWuTyHzu7/?=
 =?us-ascii?Q?eJ+hpj0z0xM87ejrd1sPdLv5J7LReNKSDk7cH4yR/Bl4nePiJ1CA9e/yzn8p?=
 =?us-ascii?Q?x7wF8WRAu5700uQTYvGmFhMIKmKzfP/zeDD2tKXMLnFRet7FwPNj8qJsrlIc?=
 =?us-ascii?Q?GtEI+XnjL2vJvI7cY3Njf4BLcESI1fKtraYqQ1QqO1AxE5xiVrvYUH+r+rcK?=
 =?us-ascii?Q?F/7Yuxrf92iqmh1tufAFEdIqeXgBMISq3efiKnqvGhEE/HMWKCsabPEryZZx?=
 =?us-ascii?Q?5t+ljrrK3vrR+V85bJlBPj6GN8Q83CuHUovi9XQFLSnF5DJzBTgXIHoT4Fje?=
 =?us-ascii?Q?BzsHCW10YRYNR3DCxLXT9+uYmx+F+kP9gRkmabcVK6ZGIXaV1zAx0ii48mwq?=
 =?us-ascii?Q?7E/BrsOVYgPIzrPJBKlFLoYxwI62Ncdt6EEoPRSTcYtTUAtwbMBTv2w2E/FG?=
 =?us-ascii?Q?q5LdbLf1/ks+WxphqLZpaA3I8luqcMZTVnvvGGmv?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2630c4ba-6223-467d-edca-08db89e3129f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 12:07:36.8086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bbiXqF7ZZ5x6I9vKxYIv7WnqI8bRWAejZRDqRUqoWLPSgDVdFXHLuoNQzOEZQ7Dmm2jgYWK480gEvbcxXP6Qow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9578
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 12:07:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184691

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


