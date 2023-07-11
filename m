Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF307C0015E
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 23:20:08 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.71])
 by mx.groups.io with SMTP id smtpd.web10.1232.1689117602187039250
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jul 2023 16:20:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@welotec.com header.s=selector2 header.b=S749SeAj;
 spf=pass (domain: welotec.com, ip: 40.107.7.71, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S3r3yM4yTCUJ2czeJYtdKP2gi0S1dzyw9Y/pjZyIiJcdzykVrHhnJLyELK7jQu9NSZw3Hk3Wn20WO2IGCOsCxNtmtxLnXDT683xB9/AL97JE8lTOlLX15ufkk25jPT9OnzWIcAR/CS3O5lXGvmQaTMGdNcwWBoDZQGSC2s9GEVmQYMWCzZcExHRt+atJJwxLrVg/nSPTHh5N4yxIaA2yk9HoBHzoWDZtboJXdMLZ7e2V22Grqr2iOknhFpthdEdO4AdjWl2IdmSgh9L0UjRzZxYLeKsX7JduT5NMZVVWlYkTZNelzOwpwaf6kH2pPUEmtJr5mT6L1SPtT+Cw/a4hNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CTC5d9cFZLco+vd0/AoIQn43FClyQ9XtBClvXJ8g+Bk=;
 b=XGbSeli8eA0Y3cjS+3cjrpDEy0zNzVZvjyJTiIfWSvJiZDVp0A2RJ3s5Xa7e5mK7RHsVAiJ4AZe5jo6oCIG0/jlvsA9BQoxvXyUmgjKzWTAs0f1VYJhBkEmWmv4AK6ll4Z7NvnouljwLZ2Uz1Q2e4UOdc7Pp+fs5ZF0TavhjzhIZERezXGeJh14e+IG7rf3S6n/u65+yX6FXyoZolVchzsgbL/txaeSNUtW4HFzZDJyLNeMOzrZthRjHitjk58kDMZetYyCv92RRQKsv38qBC2aXgbvgjnkZ4S6nSC2FJ7INTI04+sI9cQLebFa0sRGj+7vfnfjCSFrGhC7L0jspWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CTC5d9cFZLco+vd0/AoIQn43FClyQ9XtBClvXJ8g+Bk=;
 b=S749SeAjltA0I58UcnarEd8gF56nmjghRAX7qNelTXuSCr0y5J6TH7QxKJpuS9WyIa9/O1D6A6RQaPoP/dLA6JeviQK2hbaw9a8z9GSfAuexu41AOWe2CvzzqSszHMrm+q84zPysq0LHEZOCabBw5XCLSXPZCkoGWNGTx+Z/STs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by PAXPR04MB8511.eurprd04.prod.outlook.com (2603:10a6:102:212::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 11 Jul
 2023 23:20:01 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4%6]) with mapi id 15.20.6565.028; Tue, 11 Jul 2023
 23:20:00 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH 2/2] opkg: add options to enable support for acl and xattr
Date: Wed, 12 Jul 2023 01:18:47 +0200
Message-ID: <20230711231847.2211186-2-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230711231847.2211186-1-p.lobacz@welotec.com>
References: <20230711231847.2211186-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0285.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:84::10) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|PAXPR04MB8511:EE_
X-MS-Office365-Filtering-Correlation-Id: cef2b6e3-3579-4864-24e2-08db8265597e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DBC2APuLpmhtdsC/KHCVSz2EBeEuQLlNGZpZ7I/KeGpOkbYfG6TQUt0eK5Oof8S3V8A2y6yonwMjoR1KO66BK3VkDMs/crvbFrwaDQJ4fgLnVDe0ybDnbrlmj75GHOPTKkFCvRCqt2VXxSZ6GW4Ujt8YknN9MMRGlzKN2YCgxi6Ffs+CdNTvWBlUZ/cx3sN1335WpT/q2v7gzVwzpPw4IkuQ2T8iaZPI9weAGYunXyfQWUKpTULi7IrpvlZG1Q1PtkybdFKpxKwlyl3zh5/OtKdMGlXOJtFkVaFeXht0IXCdqtpOSoTIr8olnmK8LUp9HdqKH6bs6dOoPurTYTaxBxRA3apiNxP4od1uDywo1UGVGxRY4neXRKovoRIH2uU+dxkDT+8DHPZ2YH5xIjoGnXtxvl4rGnMcc9Fa3cNPpO1K1F1j1P24QtLtjRn+7QNebyu/6XAGjPinftPt7yXTud1Voy+9Wcm0/72NHPhYWDG2Lrp3Du/1rbXW4ArCQfHkqlDBNs3ftomJDjpWFiKZYIWVRYMREbtBv8DQKWiiMgMfo/fKQmsn55fo/LXRDnSBl01xPaqkY3ZYt7+OBAadnxS64bLkhgQ0Y1/I0bTxylY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(376002)(346002)(39840400004)(136003)(451199021)(36756003)(2906002)(478600001)(6666004)(966005)(86362001)(6486002)(41300700001)(52116002)(26005)(5660300002)(8676002)(8936002)(66946007)(316002)(38100700002)(6506007)(4326008)(66556008)(38350700002)(66476007)(1076003)(6512007)(107886003)(83380400001)(186003)(66574015)(6916009)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ADbCAsBFXjZoqDK+gfViSmcCxiatZswcXt2VXaqjFr4e4TsSmb18SKbCyl/V?=
 =?us-ascii?Q?t8IKWkn8I3rDIlYZylfYtdnqOjHVqOLf1xfPeL1xZLfFQ4An9QULC7AiZeZy?=
 =?us-ascii?Q?BIiKAuw/eDaRtpIgi101rB4dv2gZFkyXymf0WOtWd8AFeszvqNu3N7HMwdbM?=
 =?us-ascii?Q?/6otIPiUWIJW+vy08Fwxyq7vPrQwfvVHUcQoNUpOrtIAWXUInr2XbCpbu+aQ?=
 =?us-ascii?Q?unCCcQgNRKmWbnbq01se8gmnudRWcMnUVvexfF3hPGr819/gB02drKYOCvsW?=
 =?us-ascii?Q?zXTtjDrzVqtPZcqqZ9VFg2hxUBgPmKOvhPYFbwZ5Vzt5Ss8Y2d8fwo6lZ3Jk?=
 =?us-ascii?Q?OcJsiZVKYuw9cpf5JJWPtbOzMM/yKbmUvaXrkPfQvvjN+RstA9Q0rWDeAzYQ?=
 =?us-ascii?Q?3bbbhQv+Fd849DZ8bIFBEXHnNYT1OTXzHTDTPtXAIJeQxnOAsbRK7RMcfnL5?=
 =?us-ascii?Q?8Nt9/Cy08Pu3OA7L9uxwPoQIwUNkAm6xl+bvzbfUZ5dJAx9abadfq+eIqbC1?=
 =?us-ascii?Q?6Gpzh69PTRK/vXfAaVGFm9yrmJU1AlAKPDAW/XYGidHNiWXWbEmtcAr6yxIm?=
 =?us-ascii?Q?Qojep6gGPCPlDXtbNxTw3L/o0bv6XUDtlO23+8Y1HBubH7Y3z48kUi518p6D?=
 =?us-ascii?Q?RncZHX91v/w7eoTAQMnHlphBhhjH5tzTIyflQowLu/RMNCeICrbyD9N67xWv?=
 =?us-ascii?Q?h7ik5ENXehEygQ+wCnC1dElR8dK9Spa0hH9P7C1qolT/sHeDOkJKtvxiXl8P?=
 =?us-ascii?Q?J8w5spRT7EikGCxEPDMp5hE03dGwqKSrgDrcifXYA3gDfs9dN926toyhAJKu?=
 =?us-ascii?Q?jSWZEw2lzbNl8uknVW5vtkxYxnROnxoXtXbtEnjjTKPG727I5Tu0CcG8rYKc?=
 =?us-ascii?Q?9WUSsl8iB9epQYn5fWQsdPUcM87auzFdCCUUhjy2rVW8aROUVUrWUkxuiY0p?=
 =?us-ascii?Q?BeBFLGyYjK5fL+uwb7P8HLXp+r4jwCD37b36LVhR9klEspx8kJ/dhrrGiY/c?=
 =?us-ascii?Q?UyaMuorz2O5Ne4IS9gMhxvb4hF0+iUyk7jUOStKvn8VhWTbQU5N9hjwxZf4H?=
 =?us-ascii?Q?xLr668HseUIUtwRngWY6i0SWg/XL8dszRCIXeCqve79X1OxaHqtEUQr1+8Px?=
 =?us-ascii?Q?mZrVsnjKixegRImtOAjJMahX7K4kQD+V+PiRcBvqAETMCjzPSRXX/mve+6zO?=
 =?us-ascii?Q?qZ5mIiR68HFDLDy7o3gNtz/FV4xFgIRGReDPkUbgMEMOH62OfIuEEhxXrx8P?=
 =?us-ascii?Q?zd+4bB9Ie0VXciWPwKa1eoCGqfSzJUkg5NhC4qkur0azgnCqlzdAUBtqbFfj?=
 =?us-ascii?Q?5wTSsN3x2tjFL0DIy5PMk1qEkx/648GRzbv70M9Py7T3kAV7NgH954wOrbbK?=
 =?us-ascii?Q?D9Csz4Pp3qEEQiSi2i1oV8YaMrGQiNyTvM+lxlS1+wzASmkevCOkgsHsSbur?=
 =?us-ascii?Q?kvEQ+pwMaKISH2uwydT7xRSn+MXQmY5/882iP1QIxQx81SbbnCB2IZ/O81z/?=
 =?us-ascii?Q?SqLC4RBXRxJR4q0/ZmReap6PNR3paKL8S5JqVr9Gjnr527B7t0x2ob2bmV4l?=
 =?us-ascii?Q?7h7P8KLt4X+OOHloHnX6c4GiOzV54PqgjB9xiIq2?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cef2b6e3-3579-4864-24e2-08db8265597e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 23:20:00.9085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4zgI6rDGbCB4nBCFcnLJcTmhLtrSvDKDV4zhxJTH+97fd3obIqjp2ninOA/MXg2qiZted2lKgm4tggFgAuykCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8511
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 23:20:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184157

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


