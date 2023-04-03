Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF5C7C761A6
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 12:24:54 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.56])
 by mx.groups.io with SMTP id smtpd.web10.68544.1680524689265030629
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 05:24:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@welotec.com header.s=selector2 header.b=eabeyHe1;
 spf=pass (domain: welotec.com, ip: 40.107.105.56, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B2V4rk/HB94Z3OXpbLy/rx3A+zdcLBj7Bha01jSasBW/pTEOqiYNblNnESiuJI/FTC+x1rgke4IgQsYz/IfDL1dQ22MwiGwkEwixW9/fX8j1B3F9L0CSrBXh2jC/RuwzZctSnI4pDFr1CrKS16tKp1vvexMwi5YbqwlSXZUsH5CyK2pORpJNNfPeR894VBGKVhfuKGgA3RoXsEIKuEKn7V0QlKMNM7ZzhLeVgVMfMkUZK5k5QntQ4DGoSk8d5df2UJnHMhdlch6teDWU/K0uiioPe2fMNBoaZEu7N8igmmnMCo/214UVwh9dQvEUbaYcUUqbhLJcqhMkGI1tBPkTxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d3QyYTI/nyZ7ty6PhZ4vVslzq6qruwwDmpp5xwDB5HI=;
 b=XqzAARS/6tATK3Ya31zRj4oiP+q28myoSAayy27yw6v+fp/lssZN8d6y8w0m96cONaR3EghQ9IKmb2Jvp+y/wlDdqNVk5FvUSrGsulRwquxXvbll3OyvUPsaCKdAlQJ21UyYiAzN8okyhUO531xdqMReS0YncW6FicmrBi+aTTe21ZPsnQA0XM88FcfDWwFDx/qseU/O6pGrs13hlY2SDSLuNX3ItNXCGid3y/O0a9EKcAzfFVZ7jDoyFuITfWDD4yCz/Sf166X8dG6dkCWTyet4XdBUGFwfpux4Pf5yyaQP7ltvdxyXkg/92WYF//RPLbjMM/dl9lyLE6r30wMGgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d3QyYTI/nyZ7ty6PhZ4vVslzq6qruwwDmpp5xwDB5HI=;
 b=eabeyHe1BBFhFT5HscCfGoovWiKuRMEvN7V9zpdciuDRZ6dzmO2OHSW25YUUch9TJ+c6b/CIzESqehoJ6hQLD0rYOJtEng+YXEd1oDScU6mA7W03CQVvVO03PCJCC8MZ2xsHTDuJmQ2Hp8CmAIIT8vFVOUT93Lnp7CC+8EoONcc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by DU2PR04MB8727.eurprd04.prod.outlook.com (2603:10a6:10:2de::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 12:24:43 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9055:4205:39a4:364c]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9055:4205:39a4:364c%5]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 12:24:43 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-core][kirkstone][PATCH v2 3/4] opkg_archive: support ACLs, extended flags and attributes
Date: Mon,  3 Apr 2023 14:24:08 +0200
Message-ID: <20230403122409.3067997-3-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230403122409.3067997-1-p.lobacz@welotec.com>
References: <20230403122409.3067997-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::20) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|DU2PR04MB8727:EE_
X-MS-Office365-Filtering-Correlation-Id: 94f31caf-907f-411e-2500-08db343e67a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LCchASSfrmh9+uwFGupDawkxGoUt1VUByYw2vxURxBAO6ou0r+bnRSJ+qkRiMyvAFhtB1kh6pDo7J64sMs+yP9mFkl/BdcfyBU3LgkLpRN+R9mM0LRsa2BMqklBkOb92dyAc8nyVBJ+vnnrhVe/dYu7Htj4hOJhaa66uYQsAsclYrg+bbclRSN1mKZxL74Z/1pyypIoYUC30/bp9/zHmqV1HM5Jhh6/1IIMOvKgcsaOWArhmTthLSEPNgHDX9+XgSca+oqp4NHtbIFirs4/nbQ16cHe0YmlahlZvU1UWwAHYXGI/mzEaX2auRKlo1NrtXXKh7vLj7SRu54xV2uQMN9kwFb8o3KKkRe+5e7ZYV7j3FlqY7KgfXE3ct90nIVxxvOn6Z5WKvtyxllCClzuw0zSzgb8AStYGZ+dqEv/rCP0yga4M+Tq9iM9T5g0ZqAFeH6SKUwkPPSEpsnz2JBCk0KWRa7TB1A1973U+7xRyzXCVegIj53Lh0lwrtrwUUK0EFv0R4boJ93M1hyREUSeTctdza8xs1fQ6RkI59LZa4X/OAUM4UaOCpzquuwDYFCMYmOql7z2MOJjlh0rgRc1+SsaWYREI9ahF7u30Z5qwu+c=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39840400004)(346002)(376002)(396003)(136003)(366004)(451199021)(83380400001)(4326008)(6916009)(8676002)(66946007)(66556008)(86362001)(66574015)(66476007)(2906002)(41300700001)(316002)(478600001)(38100700002)(36756003)(52116002)(38350700002)(6486002)(8936002)(2616005)(5660300002)(6512007)(186003)(6666004)(107886003)(26005)(1076003)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2FNR1M6Wbs7stg6oW4oiRen1M2dMZzCvWLPXBuyI6B6BMegOX6vCb2CccW4E?=
 =?us-ascii?Q?PMPg9fB0YyZ/RlNGzPbDv2QLC4w16zqoVYRzD2JLgazX2FGWmQHsGhOG/K2F?=
 =?us-ascii?Q?3A1ayi6hpfx1rNPC5RFYFuSyQ97qG0mEsTvQwoik8fnfGKD01uQhgqI+INxv?=
 =?us-ascii?Q?WtebvWOOhXI9uyeBSdkA1wTTbEf8EhMwQrqTggYt56WyINkS9sgcahC2JEOS?=
 =?us-ascii?Q?CPTDjTN3P8T9+4V7+Zew/UanS+c4cP/EYEHE4yuO18oEQ31tDUTDcC78T9b6?=
 =?us-ascii?Q?pPgcD2vShjetBKisQxkas8j1vk/KZ24iy+m7R1D6/Tg8wX/tKZtYt15UW8+q?=
 =?us-ascii?Q?SmMvkO+mZYCFRSiiOrXoU3zXmnyynxvyaQ1gDbGwgR0smH1Flxo+3IHIVLwp?=
 =?us-ascii?Q?/Sz0UWa6tFv9vLeBjEWCSU7Gy0n8Og0KqpcHawHmOIh70D6M6J9kTKDeP3VK?=
 =?us-ascii?Q?2zpXFiugKw8OORx8G6neDnedwoOlvT/l1prFu3VZB24QMYScTSt85QkILlVd?=
 =?us-ascii?Q?19bLFKcHiwo34Xx/8AmkdPLxRKP2o14tk0KflzfxKlAr50aqhtnuT5dn6PgO?=
 =?us-ascii?Q?aoBjkOR4MxLPCEOzvzs2a2+2InRu2Jv2uyCzAFDjQxQ44aEZN/13ELsUIRBf?=
 =?us-ascii?Q?hF8NmMqOm/7MYygeaa2cgHIHRxPLECn/O88mEelkFm4oku1JqhCC7bltKmQ1?=
 =?us-ascii?Q?Dh2mIB7inzC05KSoK8HzT3ME94KWoil1mgVFf+s4xFo3UQisJZletJTX2/XR?=
 =?us-ascii?Q?WxyoZOogn/lGt8GfJfxfiUQ+Qg/8bgjTHJCRccbnIJvERS+jUIgHFacejHjv?=
 =?us-ascii?Q?aq6OhjCjDE1JIEc3jZDDTJDjWBjYejVSMrjeCwOmZn+VZPW+ghtpjSB77SF3?=
 =?us-ascii?Q?BNOFKQ78FwQx1+fIBdoDz/w/R3f3OuXfFcPo4TYW9yTCvAZbb+fhyUsJfH3w?=
 =?us-ascii?Q?CHA01D48sk/HQmYr9r+Cv9wN7zQp7nuDTJ2BKzfiA98dFhO/l0VG0W0nIxuu?=
 =?us-ascii?Q?ejcSYqQ5Noq2tAGhshLi3Zp5MvELRdDfzWbqykWoDPS4AvWOYmxUJk13CWNQ?=
 =?us-ascii?Q?Vyp+14B2KnAVUiKi5a7oeG4cN3p7rjxD+iL9H2vxcNAdHfeUWr0drfI3OyPI?=
 =?us-ascii?Q?AT2GXrUIzO1CoW/f2vYhsMzM5EsIpFRgZu0MilVYM4WalTxCyMVugvmD4XNR?=
 =?us-ascii?Q?pmFMIH0e+2uPpGlPuD9u9zM4orEjxKMGqUvsFQsz0m6RlchnUGeIlAG41lNU?=
 =?us-ascii?Q?ZO0sEjPHE97HoaMe3JNpwgIyrLE7/i/U4PwXeCS6t3riX0K6WP7HeEdlylds?=
 =?us-ascii?Q?q0YDIA21dKofu+R+VRW3bhz5JDOgkzVahqHb2lbi5nfPiaWy6V3uyd6GcrGE?=
 =?us-ascii?Q?1/qPaUoD/eO92MgBEKjuBL5n0bT+JZhsLUS+4CX2dKouYkWc0+Nwgj5Se4xK?=
 =?us-ascii?Q?W1LmNRFloioTSQoNSEVK2vMTQYXBC5CjiYfKSiEst/xY4xB7miuJXEnFB9Ua?=
 =?us-ascii?Q?Pa5qzU4W+vkXhbfJe5lV046jmdCxLkR7yiWznoOLSz/rKSDJdL/KEsN3eIWL?=
 =?us-ascii?Q?uri2YTuETy2yQkWb0Qv6xbhqckPy98sTbX19tWUt?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94f31caf-907f-411e-2500-08db343e67a6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 12:24:43.5801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ORkqKUVvVyOxTQYIBpA9p9v0RbHBFL2duzZgMqxt0RuYcrXNq3XajpSZ0eZaIBiwbdnua/9dZgiwwZrcSOwc6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8727
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 12:24:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179628

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 ...t-ACLs-extended-flags-and-attributes.patch | 41 +++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_0.5.0.bb      |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg/opkg/0002-opkg_archive-suppo=
rt-ACLs-extended-flags-and-attributes.patch

diff --git a/meta/recipes-devtools/opkg/opkg/0002-opkg_archive-support-ACLs=
-extended-flags-and-attributes.patch b/meta/recipes-devtools/opkg/opkg/0002=
-opkg_archive-support-ACLs-extended-flags-and-attributes.patch
new file mode 100644
index 0000000000..9a90795245
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/0002-opkg_archive-support-ACLs-extend=
ed-flags-and-attributes.patch
@@ -0,0 +1,41 @@
+From 3b433f1df6c80bc380a367b86fdc149eb33e2674 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Piotr=3D20=3DC5=3D81obacz?=3D <p.lobacz@welotec.com>
+Date: Mon, 3 Apr 2023 03:12:17 +0200
+Subject: [PATCH] opkg_archive: support ACLs, extended flags and attributes
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Libarchive is supporting extracting ACLS, extended flags
+and extended attributes, so from now we can turn on this
+extract flags.
+
+Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
+---
+ libopkg/opkg_archive.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/libopkg/opkg_archive.c b/libopkg/opkg_archive.c
+index 03a4afb..632bef8 100644
+--- a/libopkg/opkg_archive.c
++++ b/libopkg/opkg_archive.c
+@@ -905,12 +905,14 @@ struct opkg_ar *ar_open_pkg_data_archive(const char =
*filename)
+=20
+     /** Flags:
+      *
+-     * TODO: Do we want to support ACLs, extended flags and extended
++     * TODO: This should be done with some verification from configure,
++     * if we want to support ACLs, extended flags and extended
+      * attributes? (ARCHIVE_EXTRACT_ACL, ARCHIVE_EXTRACT_FFLAGS,
+      * ARCHIVE_EXTRACT_XATTR).
+      */
+     ar->extract_flags =3D ARCHIVE_EXTRACT_OWNER | ARCHIVE_EXTRACT_PERM |
+-        ARCHIVE_EXTRACT_TIME | ARCHIVE_EXTRACT_UNLINK | ARCHIVE_EXTRACT_N=
O_OVERWRITE;
++        ARCHIVE_EXTRACT_TIME | ARCHIVE_EXTRACT_UNLINK | ARCHIVE_EXTRACT_N=
O_OVERWRITE |
++        ARCHIVE_EXTRACT_ACL | ARCHIVE_EXTRACT_FFLAGS | ARCHIVE_EXTRACT_XA=
TTR;
+=20
+     if (opkg_config->ignore_uid)
+         ar->extract_flags &=3D ~ARCHIVE_EXTRACT_OWNER;
+--=20
+2.34.1
+
diff --git a/meta/recipes-devtools/opkg/opkg_0.5.0.bb b/meta/recipes-devtoo=
ls/opkg/opkg_0.5.0.bb
index 7bddaa3016..8ce2cd7863 100644
--- a/meta/recipes-devtools/opkg/opkg_0.5.0.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.5.0.bb
@@ -15,6 +15,7 @@ PE =3D "1"
 SRC_URI =3D "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV=
}.tar.gz \
            file://opkg.conf \
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-ru=
n.patch \
+           file://0002-opkg_archive-support-ACLs-extended-flags-and-attrib=
utes.patch
            file://run-ptest \
 "
=20
--=20
2.34.1


