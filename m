Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C933DC4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 14:46:46 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.134])
 by mx.groups.io with SMTP id smtpd.web11.53820.1699022794524489882
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Nov 2023 07:46:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=PYCEIzfG;
 spf=pass (domain: prevas.dk, ip: 40.107.14.134, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RWiO75YMxlSLcVs5rAqzFjcONbArr4gaicHqUHuUg9Nuh/WR5c5pVYEap9wT3NXITOMDyY+AChyMuD3F6cKGTkb2MmLQXW/few3ukfNBrkFxUe57zMfeSHnLryT/fZnZ+iR10SeTG2OBIfL+6mqEp6sIKOQE+WkXkOqTLX7cpfjl8FIMQQE5ncz1T4wgXMXgXZcv8cV2m4U9nsguOLIAPxgzRM/wJfrW/GkRphiryQDCnC23KcO5F8OLGHKVOcAFmSSOqxIGlnGxzWu3pYDQ8+tNp1IUP33aLSqHn1xHYyA78DGOJUCIw4xPH7AnK32bI4jxFLvSB0nKrA7DjRs6Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3HriZveoBEy1uQEqAxxbhjNJMhJ2XlapryOjE99/QWg=;
 b=FhAO1Yq+IOYvt/lP6W5GJHBvK/AhSDHmhG1e0Vaunu1srMe3bD4vCaaNBcaE39/GzJFSxvPVsGwZacJA+dYe5e71itidxLVvAzRzAynWX0YmMJ65HhF/shKUOrPj0JGmyetUzkipZ7NCe79yDWIGBrh6BCiZ5sAtWXUtGjQ8wmlpumN3I+zecyqnFNEnM3Vgm9DaSjNExN4OW0CCSjTpX3bpXyH6WNdxfaY6e3119lDY1iKkHtDYV8CQnPLMhRCgs0VQB2uqQfqNdOTeEJrPcMn9CdiMfWD5p4nYL3/m1YnjN+VqnCRrbzPS94KlQpuZd2l5bXexxswIZSgZFbB+8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3HriZveoBEy1uQEqAxxbhjNJMhJ2XlapryOjE99/QWg=;
 b=PYCEIzfG/EGOcANDDNkJIiR5Mprl3mu7Bv3yz03BIub7kGQxop8By89YtTfDWBWfC/XjPkAyMmyzymt9ONXsUtrB8qHTbsEVDpDQfjOVwz66RWoB1JMHoaWmX/RJefT67+UIOuVW7JuWwwX76IuAC6XyDxqWv31ZInr3SdKtzFM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45a::14)
 by VI1PR10MB8253.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:119::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Fri, 3 Nov
 2023 14:46:26 +0000
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d76:c11a:5c3f:3245]) by DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d76:c11a:5c3f:3245%5]) with mapi id 15.20.6954.020; Fri, 3 Nov 2023
 14:46:26 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Alexander Kanavin <alex.kanavin@gmail.com>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [PATCH] valgrind: split helper scripts to separate packages, update dependencies
Date: Fri,  3 Nov 2023 15:46:18 +0100
Message-ID: <20231103144618.3304111-1-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.40.1.1.g1c60b9335d
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0047.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::28) To DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:45a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB7100:EE_|VI1PR10MB8253:EE_
X-MS-Office365-Filtering-Correlation-Id: b5fd952a-f3dc-4705-a787-08dbdc7ba852
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Y1FCJ2ixYs9q1zo+WVGjM7N0hxPZuUPWcSKZOao6uWyiyoIGSpf8IshyvdqHDHop0RMkE7FhhG225NdoWSZDEkQ95XTZAudGvZGvuRN0CXVa/idKcVsuWXXPNnvzHqFQYMVz9V17dZhODU8Uvo6qnhAevTgfXSFcSRvbqo1gj73Xp7irfdDeASLSXodRXEiVXvObhRgV6ZZPKsW7dl8NAU+hua3Ypv/GbmLHqtDlh29N3vV0T3K4VrHHtS9rSwu9Vs+Fu844Dl2HO4YmbB4UvJ2vTxw6EjBGzhbUV/8P5nLsegZm13n2b/SLQoYXEYC979GV8VUC3IFXjBpkNHqV5a0qXgbWncnIhIQpoUVL1/alyOTzzU2BcvcZtDB+O6NPx0QtptejryHHb92LE7Vbmc61TmgoiX1KdhmDT92BhIsNyHEZZ6RSLj2fejqg8Vw7PZaX2KBYoOuxZaSqH/FaFXxKoQnzKpCsyWfo0Cfj9SP4VVHI3CEnhszljG+ieHa9UrUrldJHckxto1EwW3OuT2mMHPKfz/Or6HTB3/40VGUrPC6+tElPg45Cf5kuVDN9PKy/nzSMQoqNUwcuxBPH4V9bbvbLM2LBJHfrstSLo0FUzkWFc/fL++g9TWBYUes5
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(346002)(396003)(376002)(39840400004)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(52116002)(6506007)(478600001)(26005)(54906003)(6486002)(6666004)(2906002)(38350700005)(66946007)(66556008)(66476007)(1076003)(107886003)(2616005)(36756003)(6512007)(38100700002)(41300700001)(316002)(44832011)(5660300002)(6916009)(83380400001)(86362001)(4326008)(8976002)(8676002)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?S5XJdlog8AkBmD3NHVHD8a8pE73wMHPq35D6oNf4+kIdEet3nPzbIUfLYzDp?=
 =?us-ascii?Q?GpL3l0XeyCaxdhNfHOREQ7WMOKfOJ44fs9NAHk37GVs1TIBIlL/9nBheNqKq?=
 =?us-ascii?Q?7p+L7oCfn1UZ5qDSHrpP4qsRDfmViEKZ6SVQCEeRr6ITfrPLDzXupHK1zKdZ?=
 =?us-ascii?Q?3YexQaIedgIC5uLBTvu0//0D0qTSB4hYTJroQghux5/+Fl0SPTFKHw8iicGl?=
 =?us-ascii?Q?BWguo6L6+0kLaR1exLVemkuzfHbM5Sv8sqLjVOSeRcOPjTCzjOjCRKH95Sh3?=
 =?us-ascii?Q?+U3bApdsqFr10Dkf0pwc1K9VcoAttf9narRvpZScrD9kF2LepywekGr7aClK?=
 =?us-ascii?Q?xQt0EmjO096jqUG89lw3oX+FAidiZwo55CWAhRjS8ZSdcV9fD1gJXFzEmdXJ?=
 =?us-ascii?Q?XXS93YY1X1qZltZf7N1hMZ0wpoomTGRftn+oHbWm+yGYIJOKzO/0zrCSdU9i?=
 =?us-ascii?Q?lQz+ip0zFa4Li8hmaIfF4yUdsOXMbmO8hSqW8Za7zO9ceu6/2+UC0TyHkZ/+?=
 =?us-ascii?Q?Vc8ZHLHyMGq1ugpevMqXejZtQa0pSOjWjQHw6vfI4+Cu2jjlw2Tve4kw3WT5?=
 =?us-ascii?Q?PcFDEGjPzjOSl6iqj9LRYCu3HX2gMFQc65B3M6R4Mve0FNlmOXH1hF9IkHKn?=
 =?us-ascii?Q?hsnBBTRbDGxgum0jWeK7p1rcJM0foMAiO0DZEIZkn5Ip8jdxq59qukmPU0st?=
 =?us-ascii?Q?RklQLu6IwbEyVxOJm2z853xxbtb8Dc52ymM2y1nb8/6smC24oO3607MB3Jkb?=
 =?us-ascii?Q?T37CyrZsbVlmw3+Z9jacy2vZmvegN43h+4Vh0IN0BWEJlmblJMXcaOHduuYZ?=
 =?us-ascii?Q?H1f3rh8h1rq0M8rWFJfHiIrogVprzh6okBweNtHVsfdQo/rSNmaUAhPIO19T?=
 =?us-ascii?Q?hAevF8uIA4m6SD2u4Oitb/OBpjte2IM6jKxb9iSqJYF4aJv2RUB8K39VpGfq?=
 =?us-ascii?Q?j3jXO03zbKuqmonFdGcEjbBBqlmuDlBtroje2JsJ/CQ27PkFb9s6ZyoRvvIY?=
 =?us-ascii?Q?KP4mkIWehWjl8aDU/VKlY12J+GzPuthOZL3XKzN+YW2QiYFTke7HDnm4Iy9v?=
 =?us-ascii?Q?ej9BCyc//Jc0chw3EbrGC2hKDBwmF59hK6snFEAb28fVnf1mwFCvcucTkrMT?=
 =?us-ascii?Q?547kUlWcnk129AYuoWG5upNm1PseY39S5HqUapiTsGfYIJNcKNSslO3jMvnT?=
 =?us-ascii?Q?fm3IKrs2aXS53PvqxpfqvaSTySjttcKwjSERxO56GaGMAH6j6Wx1eE6U4O+d?=
 =?us-ascii?Q?dyWc8Z/4K4zBiKSEelExU5nO5H6EJdaQUqI3ZV/+lk2Yrhb+LdpFYxF/ugW/?=
 =?us-ascii?Q?etPNVsa1uuVzbdiySrc2oda9gvDXXRoJdRet08kwwd8RaNoT75IjqpoHdAXn?=
 =?us-ascii?Q?qmOfpmtO31DHznxGTC5xRMKjT7pbgpVA8nGRkDZF03wGVH068t1E5m11/QzA?=
 =?us-ascii?Q?JRvkPjaes6Y8w5geNgG9m/iEeBTwK3zRxB/DKs905fCZn+2sR8sJvri7axUo?=
 =?us-ascii?Q?ZJ08U3LjR9GS09qwe7CCaEmZ/WIKUXp1xIznIRnt/2OUi5+68xVDddRxG6Mf?=
 =?us-ascii?Q?zNeUmY/WcZ/j8vsyOi7MDZoIozVJzlvBuPgPXTYxtshmLrJ1l70drcm6+3CF?=
 =?us-ascii?Q?0w=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: b5fd952a-f3dc-4705-a787-08dbdc7ba852
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2023 14:46:26.7423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1+srJy9jq6GR2vq0hlokKZRebbIRyq+3lq+jC31fWxSUZ+1q2c4qtBAYD9xwgpvCDVRh11PLa2lJpSqrxeeHKKHe2fSBcZ1t4STOrSx1qDA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB8253
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 14:46:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190163

From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>

The cachegrind scripts have been rewritten in python3, so the RDEPENDS
on perl is no longer sufficient. This is unfortunately not caught by
QA checks since the scripts use

  #! /usr/bin/env python3

as shebang line.

Since the valgrind binary by itself can be quite useful on target,
allow including that in the rootfs without also having to pull in the
whole perl and python interpreters and stdlibs.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
 meta/recipes-devtools/valgrind/valgrind_3.21.0.bb | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.21.0.bb b/meta/recip=
es-devtools/valgrind/valgrind_3.21.0.bb
index 717d82830e..68ab319a1b 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.21.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.21.0.bb
@@ -92,6 +92,18 @@ CACHED_CONFIGUREVARS +=3D "ac_cv_path_PERL=3D'/usr/bin/e=
nv perl'"
 # which fixes build path issue in DWARF.
 SELECTED_OPTIMIZATION =3D "${DEBUG_FLAGS}"
=20
+# Split out various helper scripts to separate packages to avoid the
+# main package depending on perl and python.
+PACKAGES =3D+ "${PN}-cachegrind ${PN}-massif ${PN}-callgrind"
+
+FILES:${PN}-cachegrind =3D "${bindir}/cg_*"
+FILES:${PN}-massif =3D "${bindir}/ms_*"
+FILES:${PN}-callgrind =3D "${bindir}/callgrind_*"
+
+RDEPENDS:${PN}-cachegrind =3D "${PN} python3-core"
+RDEPENDS:${PN}-massif =3D "${PN} perl"
+RDEPENDS:${PN}-callgrind =3D "${PN} perl"
+
 do_configure:prepend () {
     rm -rf ${S}/config.h
     sed -i -e 's:$(abs_top_builddir):$(pkglibdir)/ptest:g' ${S}/none/tests=
/Makefile.am
@@ -116,8 +128,6 @@ VALGRINDARCH:powerpc64le =3D "ppc64le"
=20
 INHIBIT_PACKAGE_STRIP_FILES =3D "${PKGD}${libexecdir}/valgrind/vgpreload_m=
emcheck-${VALGRINDARCH}-linux.so"
=20
-RDEPENDS:${PN} +=3D "perl"
-
 # valgrind needs debug information for ld.so at runtime in order to
 # redirect functions like strlen.
 RRECOMMENDS:${PN} +=3D "${TCLIBC}-dbg"
--=20
2.40.1.1.g1c60b9335d


