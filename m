Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC234C04E69
	for <webhook@archiver.kernel.org>; Fri,  4 Aug 2023 08:45:17 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.47])
 by mx.groups.io with SMTP id smtpd.web11.7188.1691138712218312327
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Aug 2023 01:45:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=cVqsN/yu;
 spf=pass (domain: welotec.com, ip: 40.107.8.47, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JYJE+kUs2tpUGJE2UdtkNsMnC9N45nSg3+E9Rm/YF8nHE7ptcKcprMD0fEAw0FZND2JFW9Y8zxXkj/ZUNzLE1CYn13dOHQXB3miHfn9ku3Qch5m9OpNnHMPtazz3W86+CqNsVZXpiPahHZyBPaXnj3yGYWjC3nQFSY247Od/9JrnwMMl0mdOWLt/59rVRZLJwWXiE6Ay40m2E2pIa8Txgdvpd9dsK2ABiXP1ch00rT42cZenOGfebXRyGHyJxdVBshkbfD+NFLJuxOqckYTrzCbcgK6bDaGBE2/a/9XVYIcUM+P69nA7OK4lE+9is/AuuoBy5zaD2Orxipg8DKYsJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hyid7T0tIVnvY/akuiaWIrE2RAe2eeaAbqXaQAkF2iE=;
 b=ma5F2vxsfbK4tsM5gDkcZ+rm1nTxAaEyGsLhlEk3WApFTCfDVHFwsAtC7fqKL7wHpM9O7vsVva5NDCn75LgMTsPD/pnq8CKvSXulS47on0Zcm1Gd1EACB0hpYQEOtPoUZiUz293gF5zWm0g91M9HNV4b6n9cO38lE8AvKtVBoShFB7Zi29YPdQOQ6JQgZeBRVOs0xaZJTki5KA9POK1+lkc3HFZX4jIbqDQ2tbQgldhlrXbmQhafhZZEHv7FY4Gl7wYlBfhAJed/oTSkMXUd93AhRarGKa2I6lE19SGi6vFLXqi3mU+olNTGqAnTNUSrpz+x6xhgoXoL08cQjQdAKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hyid7T0tIVnvY/akuiaWIrE2RAe2eeaAbqXaQAkF2iE=;
 b=cVqsN/yudcFielwMCi2BgmjkEFKXLH2iGwNrnOxEOmiWQz5QAhngTX4bjTY/UTCEIit2KeNmqecFA/Wu7wImixe4d9yYPWfagqEHv0rf8WD8mD7chMGnMuHjAdXGsVNExt5OM1bIBGOZKVJg0UFkMHVSkvNIA+Ls9l+I4Up2nUI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Fri, 4 Aug
 2023 08:45:11 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::b693:eb1b:b0e6:9a06]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::b693:eb1b:b0e6:9a06%4]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 08:45:11 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v12 6/7] opkg: add options to enable support for acl and xattr
Date: Fri,  4 Aug 2023 10:43:14 +0200
Message-ID: <20230804084315.55768-6-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230804084315.55768-1-p.lobacz@welotec.com>
References: <20230804084315.55768-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:79::17) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|PA4PR04MB7743:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f2438aa-c5e2-4330-4910-08db94c71cba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0GOeK/FCN8wxLSaV8fihX04s5mHgD6IFiH2i3RzZpytgPwpAskDJVbdz+tVMHWPISqT2rfh8VBOeMTQFnyAXRlmjwMFd8dNuyLTJJgDcFlIW6x1GxfEw+Gsc5EKNTKHl6rlaV/DXfdzDdmXEIYWnHE2ashevAkjy4LmsHMHHFaPeJHZJqqy5uJUsLBw+x+oSDRXOyW02+Nq9lP/un4AffszS5MMl0j+eBWKykWsG9lZiwVzAitx/A3uPVfFT5ZhOmf5vtz4W/xjL7Nl4tnDXQ5Fg9Bwa4eIbcF8NQOK8f+olqHEdjL1sc6BT2TSLK83tSXZJuuQf+uiSvgSWdewvSf/6kVtgBa8NdlG1QTUMUmpPklektToOJKyZW7dGPKlHYqiXcKWMr5je8GUGHLF+OavDlQS9vGlODuK1fNPez8nvn6KimN9n+TTQOe4W42eMTFhTlSCFJZWHQvIvksZryQzJZ566+MtJ3d3fhYkmuyY6tk7AAswO/glX1CVF2HOnwbkU6wOiRwIOeMAptSESJj1ClmZQRgeCUxdwq4E0L+kaarsYIDG784m32AwH05CIn/IcpjfUeGVuaAi+/qyUJJCGQ661XGXDUW9F0RaldWc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(346002)(136003)(39840400004)(396003)(451199021)(1800799003)(186006)(38100700002)(8936002)(478600001)(38350700002)(52116002)(966005)(6486002)(8676002)(5660300002)(66556008)(316002)(41300700001)(4326008)(6916009)(66946007)(83380400001)(107886003)(6512007)(6506007)(66476007)(2616005)(66574015)(26005)(1076003)(2906002)(36756003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jkEK4Sf3sig/pLFTJvux0g30T29yrwg2/Q8wTpD3qvsyVlEkyXxCaFS9p+fF?=
 =?us-ascii?Q?OpbjeUGOqH3TVjwhPtpCOfmQeFbwkh4tOZFKG019qdojnxdbSd1m/32PhVgb?=
 =?us-ascii?Q?OZgQJLwv9CiN7VbZCj5x+TjUeLVD1TS8G9gUbKioHbTHB9f96ton7xgu97/F?=
 =?us-ascii?Q?hWq+bBa/gnlG1c+C4x9TFG+Gb7TfzvwA+KzsuDPYziUjvCw01Lr++EwLe0i7?=
 =?us-ascii?Q?Ioify2JmvcV6oCE/Ao6bO733PA3hygAOkQDnnxuya1ZQ7den3WJGRDAXvPTQ?=
 =?us-ascii?Q?Z+uHkKijYFe2/CQLjSBeM2btYu78PR3+XAIaWrL6xAv/hJ8434mqBdecIwOQ?=
 =?us-ascii?Q?0QXhLRNboLxRgMMbtBifeo1w8tpEE/8qnrPpARAxlMIh4jm1q1IVbw6v1RWo?=
 =?us-ascii?Q?OLJ9Dr0XYjQYVi/rGy/Kh2KzY6U9bqelYA6kHuDkcDW8nHuyuDa1/vEfcEkx?=
 =?us-ascii?Q?1XKc+p/pa4im/LDnFLodsavXGm4MNbCityTGkK6IBGrBfsEMAkUmjblwWfeW?=
 =?us-ascii?Q?a9txRPEGWEZN5TzRWHzsDLCdJx+4EuW/4YIJDszIP6+vCBe8ntZWrQc+oqPK?=
 =?us-ascii?Q?GKkZQkO4vb8zIe/NFtnMM1zGmhUf11t6jz9TNN69FbdNfnblH2NDg7mPrcRp?=
 =?us-ascii?Q?PxP2ONf06lFWhLTbWEsEHr3qMAPisySe4VMx/qjr7UZfsOqWiQquNEVWvs0n?=
 =?us-ascii?Q?AmXCONWBHNeS0Kevku5clITSkoO1njHaIMhCDs2/lE55f+fa7XjSsRS0OkRh?=
 =?us-ascii?Q?QYeFO3772FcljLk/9VRlqRa/PZpNuUrf6RH7WR9chFpfMlR1Autj9Ent3acr?=
 =?us-ascii?Q?Eu7IwOlzkRPQmioYgCBsfkTQ49yqxz4FIhVPWm05nOjKGLLXWEOOWF9cJYC6?=
 =?us-ascii?Q?1MWcSGrHJPYvSejo6rtZWSXMIi+6eOzJpBg1dQfaByrN+YCqqkMxTGX3zB3Y?=
 =?us-ascii?Q?xGvrgsPm+KqyqSn2tH4CyFkAn2N44TSJYJ1gdoSM8378o3keNwWZHFCvwnsQ?=
 =?us-ascii?Q?uy6IhZIFZnynQTOgsHtGok9JwzJVKHuXVkijKHPTxIxBaU7w7PPmMahGmzWf?=
 =?us-ascii?Q?jB9mDTqY+K4xD8Ek3tl3FAJVD7g58lO+03gzmm7BhTscTAd7q2qobButRKXp?=
 =?us-ascii?Q?U1RX3UEZioP82qhxSskQYYQ6ALhvYwIrRNt8zX7EiEpoXd55G5RjfGBDxTzc?=
 =?us-ascii?Q?t6AjE7uZ7R6kqYWaRM9KjaN50P8diB4FLcsqqcbccKJ0kB9hZHt2xO94AXds?=
 =?us-ascii?Q?nuBRXyk3LriG7N05sxblRrP1kbBR5eHV2YEI7oFyiaOi0o8qZj8tW8ZESMFt?=
 =?us-ascii?Q?T0qLs5G5BskzY8EwVyA15LP2XggDwB4DUK5iAnEjJSKWmkYKSrLCtG88Gvus?=
 =?us-ascii?Q?5u5yCfF9rmlZV4/6iSA/No9uhXwrWVK+23WCMxxslX0AUXzPYi6jSAdWPEhr?=
 =?us-ascii?Q?Q4XR4ReOA6CrCo+8w81wW5qkYANgIMqkuBfMggmN5Cj7rHxi3UV+ljE62KY0?=
 =?us-ascii?Q?w0kdhXZU96EsE+NWNIL+v26yj2bmUcg1JwuNOG0xIzHdVmQgARFo99TDlHj9?=
 =?us-ascii?Q?GRwoUwiGe561pgUlvFUYW8SZxAkB3zGp6pFMdd1y?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f2438aa-c5e2-4330-4910-08db94c71cba
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 08:45:10.5678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rvtOGRrLGD6ySUT6VUXbecbCubTFK+BNUON91inaMilXASbIIMbLaWY59tlBPr14/kLQENQxEJEdaOWCiSftww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7743
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 08:45:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185516

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


