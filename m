Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97DFBC46CA1
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 14:58:47 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.45])
 by mx.groups.io with SMTP id smtpd.web11.94695.1697381916061748557
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 07:58:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=kkZODkoS;
 spf=pass (domain: welotec.com, ip: 40.107.8.45, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UrPcuJSe/394f/x3TzYoDIcCyClVSpxIo5pG/ReIAwRltiUgbS/Db5hNSlneGqMJMLMxd8ix+5KSPT8KWUD1puZ4VM03oHfvG48zIzsiybvpGFni0LHwR4Gruym85OMNxvsGcZgI7OCuigGSZr7SxtF+1Qv+8WTZ6X+b5mXUqQsqxxHA+KdmdeJNC5ZhX/tZFOSlLE/sE7fPib1NRpe3XWSIeWU0dgib0xWw5MK2C5RNo0BYRki0prEftHEjSr3ubpi8j4BmX7wZgp9HqiTWp4KbwCkvjXCzpQcbIWoQA4hsBBQI8QLW50wq6JpWaWNQxDrCfU9VFPI26IiyvYfdvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aufmz5XXUPx3GT5C7Upri0nkPs2fm01KEawbIS+GMqA=;
 b=SwStS6himnR5Vfasd5MimT8IRWSKMAiUEmzwISM2NeBVXfrr/F9+NM6F4B5Vd+Op1fcCATSb8srksyyLXQWLDweBqHuWiuzXPxkOsx7jMtFOZPSgcq/9cN6Julz0ZBQafQRxkW3wk9p6pRACEvflfqtPyE4rBgrXCUxG3Hn3Gpl5q/80sfhzNIq8MklXijesoWAwRBHktStZuDZ4077izHRBsnzH+M+cbYZJinb3KqOcq/tsMtIlLAU00lbUPRMDxbF+8pUZl+Wxr6BtkFY+eFR4V3HCC7KZuXEM7rHvg9sVRFPkJ4cLcpqzl+zTmCLMHe4w8jvzpyCip7DwfddAAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aufmz5XXUPx3GT5C7Upri0nkPs2fm01KEawbIS+GMqA=;
 b=kkZODkoSR4+3o8NB5F6A+racTYHQn0RttzRvRFrZR9hz+o2mx6CRzaiI11HY964cjreOcyKoXHvRlB5KNjN4EZS1Ed6nglueyHFpfIlLbvAdEr9xTtyCMndISmZdcaRtc21uT5Ql0weDzvPY+aXbkk07Og52WICCrn5PKG/LKwZ7AKGOX62d/ouTUGpIgz76sQ1y01wzRR+NzQ03h/CjoaHyPqsnnGorVuKiA28/yJWCxxt4IMiR68+osK6UmtX6/MzL2Z+2LAlYp3BJAON5Sh8Pg3kVZoNLrx3vIOX/VXXYzievXbV78PNiuEWfeLlHXZl435rdtE3V4YtkCUmaNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by PA4PR04MB7613.eurprd04.prod.outlook.com (2603:10a6:102:eb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.47; Sun, 15 Oct
 2023 14:58:36 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3%6]) with mapi id 15.20.6886.034; Sun, 15 Oct 2023
 14:58:36 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v14 10/11] opkg: add options to enable support for acl and xattr
Date: Sun, 15 Oct 2023 16:57:48 +0200
Message-ID: <20231015145749.69995-10-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231015145749.69995-1-p.lobacz@welotec.com>
References: <20231015145749.69995-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR2P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::12) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|PA4PR04MB7613:EE_
X-MS-Office365-Filtering-Correlation-Id: e9be2148-03f4-4fac-da2a-08dbcd8f35af
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SiSSjFbLxyFRIFMwRbf2EE/EWvUPX2zVb2zP/ERwAiYhzXjTtB5uAxF17faMWeyulku/QGpoI/6FYdmEP0XJIPwTKGCMQPec9Md2+IQz2O8pNvMirZNNQzhQ2okHZltTqVzkpPiFQMlnq46J6F/Ag4YWNE9DMb34mnPv0awMcwkahPgUL79zrG8V/CRy7PGtMPOe7+wNg33J7aNvq9MdsR090oTvcfcI0L0x7bIpuB9+k/X9NPyMaAWHPkl2GMWqe/ARq1jnj6t3XpqXIFrsR4cy3StO1jodNfZqAhxKX8r2E/g1VKgfAdTmEA5LlMxh2VyrCA82qUxAl034gJOx3x1CJtTzx21F+xR0EBjRNLgc1EgU8hx3Y2IRnlDeKk96XDAlgu/uwJiPqa1usRvlzGXj1AEKMnJse8Ccu2xteVVBsqGZ2u1IoKeVh1Z0A5JFmiQgoblkeHjde7NtRqOZC2+zJ1OVjl3080KkdqzL+DMDpNA2pcXYyWnMRSRxc1r68b8E8tRWG7NFuoYRNwRv0MSGrIOqSV2waxH72nQGUKobKdMkn4w6aFDavDRLWiFP5FYtt1mulDN0gLAyTJdafIW9pCsI7RlcgiMrvZ24Gu4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39830400003)(346002)(366004)(136003)(376002)(396003)(1800799009)(186009)(64100799003)(451199024)(478600001)(41300700001)(6916009)(316002)(66946007)(66556008)(66476007)(6486002)(966005)(4326008)(8676002)(8936002)(38350700005)(5660300002)(6506007)(52116002)(38100700002)(86362001)(6512007)(2616005)(107886003)(26005)(36756003)(83380400001)(6666004)(1076003)(2906002)(66574015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?C2bVYyDiO6dS0vOD8rDrIFlw0diFIE3gPwdPB9kqXVoZskaziqcalKCT0qWu?=
 =?us-ascii?Q?Vo9ka1cxcjHly6ptemSVqCOcyr1LI6xf4Qw8Y+gQeCKUculhv6Z/EnrY0IpA?=
 =?us-ascii?Q?kor7RBtWp/H5OxdAtbYMvkL6IaFBf1A/raVEJfdfKd4QYPy99BjEi4MdizyK?=
 =?us-ascii?Q?k30Dc01VB63V4p+Rzm/o8lcgUbGizmXH+2rgvH9zL5wj5h8a+Y6tC+5rG8hk?=
 =?us-ascii?Q?o3cqccdz+mgFtNXN1c+tLq0qHZut6zQkWxD5jP950zYcKx+r0Dk13eh3B/Cn?=
 =?us-ascii?Q?n8G5oMFZtIJjjHqYTP44HgIUU7Y0zcP3QFco5Pr5YrTYYvJwG8xlxw+voF5w?=
 =?us-ascii?Q?ET5bOqYze6+kiSHlSlBTalSJmZ3QOVlCF+Iv6L3DKLqUcjRSelf66eqgOUyx?=
 =?us-ascii?Q?0nYpxV0NXTcx57fUzF8hQvM7DY51MB8F1qw0lI9/1b6GsFBmYEhe90rehcvw?=
 =?us-ascii?Q?1Fways58mCV4r9sEJ2vo4cW2YSAeLyg97pKKFJkWEuUDMoO0Ot1mCtvJ4ViD?=
 =?us-ascii?Q?2A+3uHjrZFbej5EAWw5U8LyN9T0bMDkuy2mcyg0cTJf2Fe7NJSxf7AIOntC5?=
 =?us-ascii?Q?o2CrWHh9Hv5J22aPsy3nCRdMYrdXTGVrtcNPxUL3LJR4NYOistxWbPmVmYZZ?=
 =?us-ascii?Q?YXRiPAtO3FGFRd55443Nv5318AaODhe7yfaOoFMqLBs+rqoxEIEBL+51gT3k?=
 =?us-ascii?Q?y+q6SkxrRqZo7yoV6hRfqX0AAQoy3pNMmpFq+nZF50JoEkyVrBao3GUreQPj?=
 =?us-ascii?Q?9Ft/KdKINcVCuH4mwjWpnARL6dehy2WhLFCN9xFivdhX27H7FnFqd3f8pKDp?=
 =?us-ascii?Q?HR9cKLKjjpnWISF9owRhBKGwq8EMleKlki4atTCHLRyVBFcFAf9F/UQf3FE1?=
 =?us-ascii?Q?DTg7OzJRNgQU+WOzbWi7Lb5IPbhSA3RzPNchpBgAymcMAYWCTYHBDZM+FN2o?=
 =?us-ascii?Q?BXl9xqfCXFpLgGxIw79URKTK+9fTTfCI5WPsBM179XGdvmMPu6gZmJZAtnd2?=
 =?us-ascii?Q?CsSzjmMXx0HyCwnxRCjF/wuFOBXQGL4BTxWgg/P/MVipzRc6+YZGUFm5uJhP?=
 =?us-ascii?Q?yZCGlSaykC1RhCTWGZMdi/kSvkbd9WFJCwJ++DvEbsgG2lZmH5Ofl2bY7eOn?=
 =?us-ascii?Q?+uwNA9b4X24euLMoazvl23sHmfRbHfPX7Db5e3+bNDbrCcCS5O9cQaifNvEr?=
 =?us-ascii?Q?kVienLeDmVgqkD+9g6GerAnuy7OR3Jv9l1iujf5YFhomlzquLadYQb+OEKuU?=
 =?us-ascii?Q?GfzS0/crOGnXpV8si5LtjP9mp/MDtmzeeBcklo21fGNum8CoLK1OFvCP+VtA?=
 =?us-ascii?Q?TeKd7dZ9YSooAI+crhTKiH+riAlx1iZiAmWokbkI8x4uZmXv0e1c5FkZZQ7Y?=
 =?us-ascii?Q?1t+lGKvOtt1frrajZxwexFWj8zs5xdtA/Gg8/CqjEX7X6fStee74POUqNDcf?=
 =?us-ascii?Q?DvrpP6nh9MWpddYlUaceLF460Hdg3kpWRDpFeZu+8nl4C+8IYhi2LdHiVpcQ?=
 =?us-ascii?Q?TLo7VRTiBmYH5eVo+dMJsfjZeC409AiFEOB7PBGX129MbJd5bdjVoIlhD3bT?=
 =?us-ascii?Q?7sJZW9YtVX+bfGWrNSllTx8/yzBMNnU/Taj2zd5i?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9be2148-03f4-4fac-da2a-08dbcd8f35af
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 14:58:36.8926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aJ479OoOoWzVcn4KIabB9Hpw7+jqWkcv4Ymz2T00FlEoXRQG/bMhA7Rgoi8hSYdTsFSUgy3sacmg17vz+PcY7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7613
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 14:58:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189154

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
index 0000000000..26b2a36c42
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
+Upstream-Status: Backport [ef743b75745939df210a9e6a70a44d69181ef05a]
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
2.42.0


