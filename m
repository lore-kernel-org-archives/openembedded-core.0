Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6133DC41513
	for <webhook@archiver.kernel.org>; Sat, 22 Jul 2023 20:56:20 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.42])
 by mx.groups.io with SMTP id smtpd.web10.13777.1690059370641442747
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Jul 2023 13:56:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=VrNaxKhF;
 spf=pass (domain: welotec.com, ip: 40.107.15.42, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KDF1ObqIqkmXlZDk4cy96CoK1WsKEouSbOF8uq2J6e61i/ozGG5tTiy27zInFaJ72TfQOJaAVq2+hmxZNi5wZTmzqFQSXWSfPQW1YbAg2AlWAaZA/9nkbWOsP0gHoy6rztD5yYfRloEBo/theR79TQCBHltOqS6NIdZr1cBQvGkJwDfHSe34zMznL6MDl+SJ3sJgh2mkbWZgAcQxI0VxPIWwaqz3sO9ygjwQiw72TugGsrV3vNVGEjOxx7lBNTIFYsFAVNHWhDErruKtFqFBQVrh1AWC7JU43pPpRTU5BY7mZr9hm/eGzGBg/xoGH6FeM/KCF+4i9INL/5eb6jUBvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hyid7T0tIVnvY/akuiaWIrE2RAe2eeaAbqXaQAkF2iE=;
 b=lWu2VYV/eBaVAn7Vwijgar7LahxcFTtl8BhHHCnh1WJhlWJCpyEMShx9K9/lj54o70+pCXrSj559FnHMONUscpCl7lq7mFf2/I9inCPTimVNL+TTH34moLa+hxGUXdpKpXjyGNXvpnArY9t4WpmJrSWqwugdALfS/didKZeihX9WztzEnvKnt/UG/ON3VqlkZ1L08k12bJHhXZKyxrii7+KTRxmSZLXRiv7X24k/OqrVWsCIYidrQ5g/eToXIZi2Wfnv2QQAEKvM+QP64ar6NtVXzTIodKyWW2Lz8nbCDeZ1jA6jJI4AEVHxReHFed2SNEJk+49UJfAJiHLpP2k5Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hyid7T0tIVnvY/akuiaWIrE2RAe2eeaAbqXaQAkF2iE=;
 b=VrNaxKhFkFJbURS6lIDkTujGtjFEEw5f+voisuhlLE5NThvkoXCxMloVUy99FxHa2paejVH0MGksEfCCtJdWPC6zwLDQ3b1u4pbZZQp2LwWvqXztHdMtzMLG/uJD7VR1puDAKX+RaKwjh4n5cSmoCTOQraMtlXn7iNUfx7HJRlc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from AM6PR04MB5368.eurprd04.prod.outlook.com (2603:10a6:20b:9c::17)
 by AM7PR04MB6966.eurprd04.prod.outlook.com (2603:10a6:20b:109::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.30; Sat, 22 Jul
 2023 20:56:09 +0000
Received: from AM6PR04MB5368.eurprd04.prod.outlook.com
 ([fe80::6b7b:1852:edb1:9b53]) by AM6PR04MB5368.eurprd04.prod.outlook.com
 ([fe80::6b7b:1852:edb1:9b53%7]) with mapi id 15.20.6609.030; Sat, 22 Jul 2023
 20:56:08 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v8][master-next 4/5] opkg: add options to enable support for acl and xattr
Date: Sat, 22 Jul 2023 22:55:54 +0200
Message-ID: <20230722205555.2487992-4-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230722205555.2487992-1-p.lobacz@welotec.com>
References: <20230722205555.2487992-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7c::7) To AM6PR04MB5368.eurprd04.prod.outlook.com
 (2603:10a6:20b:9c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB5368:EE_|AM7PR04MB6966:EE_
X-MS-Office365-Filtering-Correlation-Id: 88ba37b7-3f9a-45a0-af03-08db8af612fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FqOLbP+8uYFutfsvYdzYjZua0WVVZ1EsZiMJqLcKR2jH1hl/uv7DN+tzL/l9VwN+S8lKihIfb5imKa0iT7vAfMv5w6LMcLHyzgbvZDkocRAGsrVu1/Au6CBGX1SI/doYK/71S2PHLE8E8eW2A/0aTKmGsxpxTZoTxE5d66KCsB0ML/iyVpqtfLByR1h4ZaEk3mfV7yb7ftNUkTtEReUX6I0tCcwA4ZVHMVjMONJaasGSmFmlldKvoOoEZ40/wEKx2SVtafTtSn/m5KCdze9i86zFdNOJpQhIRkaDOA8PUe0c31Ab3qJXOHl4sHbf8/OgaCZp5xe6enB0rF9tTnoS++SOSzqLu4UrvGznATHIvEcrTwdIMG3qbQ2dk/HW5d5Zf80bEKQjPfiljFS5QdOCAmTHp9QTZP6lrsd8iNaqqwFREqMLiTHLLd0QHccaXuRAPfwfBEKTSRWj7xDrpJFKkvAUG04IkK1SLYy48FGFc2awuhgGW4Gxq4x4qMs26CT/JrppdmX8mxu9ZMCKTtT2lhQZP+Sv+W+Gvlf+f7VYWKQGZoW73Pxdgh6Parkac0fglZkFb7SoGzbEcHai83B8Asw/h6ql34+C5QFEX7VBkdg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5368.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(39830400003)(136003)(366004)(451199021)(6512007)(966005)(6486002)(52116002)(6666004)(478600001)(186003)(2616005)(6506007)(1076003)(26005)(107886003)(2906002)(316002)(41300700001)(66556008)(66476007)(6916009)(4326008)(5660300002)(8676002)(8936002)(66946007)(38350700002)(38100700002)(36756003)(86362001)(66574015)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eWl2xPOZ76KzkIKOF9MIlAUgp9CZb1jwpZIzF0J/OoaQjpnwrV9kwQh/OXOO?=
 =?us-ascii?Q?14uXyimq9VIbWMF+tQtT+ZhNBdBJmrYX65WEDmcfFs04TWfaLin4/Re+1Eim?=
 =?us-ascii?Q?SkuxRcg1v8//1BwxjAtXmgjtcWj99gblNIcdRSbznwBLGOGslr2pSFj9dpAd?=
 =?us-ascii?Q?ZLqMgPMnlVXLiF1UK6Y8c26LsKokblc50gGGgFaEvYX7W2RkPOu7a8E909VO?=
 =?us-ascii?Q?V9NQn4WZSwgdmPpVw+y8RT+CxzxZql6DwugsBA0+5UvXSvsiW9T9fWesovWi?=
 =?us-ascii?Q?TRk0fNW3qaRkdc+6vyS+yJdiE9HrsDez5q6f0bJNo6V3TMuu5HFTLDeubit6?=
 =?us-ascii?Q?EVyzKowP504H0PV0vikVJqEax/t3syYkkb+fnDC+RjdxzyEuUbMvJ6WqKDXa?=
 =?us-ascii?Q?D9LpNyc00WfqPx34Q7nSEN6ATsmKkROMBG80cSN87c+ydUQGVhXY6jxH3Udp?=
 =?us-ascii?Q?YameBChYKJhTQqDcrAsbdxe7FS5gPw7q61oxSrVdgzS+GHYCtmj8yHUbfAS+?=
 =?us-ascii?Q?pZz9LTs7BfaDvhA12/TlpCjndaKF5e8ylhJ+7sSj2df4p/FZEJb8URHZJfW2?=
 =?us-ascii?Q?DBXmlcH57/+Ixsyr0sK2SjGlDukl/Y6yxlwviOKt0FTFD/IwIf/SXHUJ0bjq?=
 =?us-ascii?Q?on6zNWLLX7tyIXDYGPSXxz5YDh9Xv8cRRQIcvWoYbD8shEXeQNE0RJPA1umV?=
 =?us-ascii?Q?HzY8kAVpqVJoxtVpIV1u80NHE9bjRsUTBZi5W7CJw6memtfg9PglHqoCic0y?=
 =?us-ascii?Q?KW+kB1s3EsKUJZOD20INBEbrP93tklxpPvvPiv7z5giE0pTqFJLyPLaRHtqP?=
 =?us-ascii?Q?aqPQcpRAmjteKbXXMZojnf6wxgk6UwOKgfRBDYQWQmNfVr1AOtIAHqrIEEHz?=
 =?us-ascii?Q?MUOqdAMo2/IhuYXwvzxWQHTiUUKu63p5lxlKFhvi2giYUljQ8NG5bJRLRXf1?=
 =?us-ascii?Q?XOt3xl3tEk3c5POi2z/n8zFcfeUJt7WBldkqztgqJ/5zS78ou8ehz4Y7JTM7?=
 =?us-ascii?Q?IsI+80IKEVWE6/knuOpPzQ04UOvQDQTMPszE0uVJuhdh6ls8CI2auiA9TPlb?=
 =?us-ascii?Q?6AULDoGNm+ZtHLlg3nKkGUyx9WDA6O9JYjFlULAkQK6SYdoAznBRiOV6ZZlR?=
 =?us-ascii?Q?uQVz970yE+3OLyeFb4EsbYKoO4ZJ9VVEBpol5sJ5n/5TKURj+gmZK9CZycmw?=
 =?us-ascii?Q?v+yNBYawxrSR1SLRRSeJ4W4nNijABzutCf+lsAVb/R7tg7Hr98SzjxLoMaHt?=
 =?us-ascii?Q?gq8f1GJiiTJuGJ14bYZr5wWjoFEfcUCcRJ+2eq3rRORGxeDXXwc/2wVu8N6r?=
 =?us-ascii?Q?WwJ6qszdtcam0ZV26LwPuAy9ekpemMvbDmURx99U6eB4O139uQYjBwchE00q?=
 =?us-ascii?Q?pcU5ysIITTh2KoIs97MBg7Bkj0A+5F+XbBfoyemsuDrE8gaRRN9aYbmVPrh3?=
 =?us-ascii?Q?LnNqA7sHq0U343083IJIc+2o+8RbiwRkCgG3oxI1awotSc4kw/RmU7anovTi?=
 =?us-ascii?Q?SJGcDU++/kFE3VXIAX2o7aUIIFNmN3lmhJst1m5dHxejygBa9CsaXnsLEfFU?=
 =?us-ascii?Q?V45uKHv3TTGv+Kgi4MTlrugRGsBMKU8lR4XbJvN6?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88ba37b7-3f9a-45a0-af03-08db8af612fe
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5368.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2023 20:56:08.9526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FaEV5j6F+9IjYVfAkf8rv5w2JaRy1MEHJ7ogKYRSj//EKIJq25cOgMK/YHLWq7cA0L4Djkbv7LLKNL1yuoRubA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6966
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Jul 2023 20:56:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184738

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


