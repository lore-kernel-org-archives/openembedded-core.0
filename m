Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6109DC001DE
	for <webhook@archiver.kernel.org>; Sat, 22 Jul 2023 20:56:20 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.42])
 by mx.groups.io with SMTP id smtpd.web10.13777.1690059370641442747
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Jul 2023 13:56:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=XzfFJWHs;
 spf=pass (domain: welotec.com, ip: 40.107.15.42, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RVWFySXk9b94RRmuDzUt8v4vkEGZIZSl0l9vFjAyPpJVp7uWlS6B6TCaJ8kmINgiG54Ye7GXW+QkfS0FhxFQzY97q/uVnCvCjDmMVfYLVW8KJsZ5gKX2EBmHO2MSiipYLIKMUlMqTKNa6NB8TTu2Kl6jWxDX1DrKGNVhi+lTsuZI6xfKKy/qepbdFguAp6RUo1afh29uUY1zD5NbmthMxuW3PEiZM3SEW95oMG+dXHB3/fRK9hf2UKgkjHCZbo0cV9iGMUAKQPIAm2BeXEGDspHxiQMn0SAcORLz/htICehtLbCQQHr5gxlpxq++sOwm6yF6WxHBBXbCzvyPiNKjEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yZ/fPcbzQ6QG0+G9IytQ8AGxZCoraw1G+uzAP5dTIiw=;
 b=e9JTeFM+kmrvC1I3kY4Oym8HtjPzbn0bsJSuzyPO91X4fEtycHgFxUo2SAyP2vVOs4Q0weEvN3bcfEQvg/aDa7ltiS45RVAHABYC9xluVHsBT5gjgFpDqe34W5sHWsJUZWJA272Lnygu/Wi5hYP5mi+BIowHoekvATaXH4Qxa5yV/CHRoUQ7JYIFVleBqyQPJjTOh3+Ij3YNIHoxsBZHwlCz5XarbTPr0xRwjcmkoWlavU/KjNLG6GfVDA5CQci7gL45gZu1hCA53pirbcILiKtKkbrhwCzEhmWd6Vkz6zNZmJgKgprQrkhCLFf7mL3oL1ICLylUulEfaBSm6MzPUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yZ/fPcbzQ6QG0+G9IytQ8AGxZCoraw1G+uzAP5dTIiw=;
 b=XzfFJWHsA5cyVavRfCMTdXZz/IVCzlQ+wRNHWT0RGwYdwWFeGMOF34Mgr3T6XLDJn+7m30NCX6B4OkwCxj0CoyIuTp8vACsTR5/PwsTrjnt0DFjzD9A2rTfX94pISw6sr52LoUNGR4DhmrkrGZ54uTaUxPbUQrjexXSclYcRBTo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from AM6PR04MB5368.eurprd04.prod.outlook.com (2603:10a6:20b:9c::17)
 by AM7PR04MB6966.eurprd04.prod.outlook.com (2603:10a6:20b:109::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.30; Sat, 22 Jul
 2023 20:56:10 +0000
Received: from AM6PR04MB5368.eurprd04.prod.outlook.com
 ([fe80::6b7b:1852:edb1:9b53]) by AM6PR04MB5368.eurprd04.prod.outlook.com
 ([fe80::6b7b:1852:edb1:9b53%7]) with mapi id 15.20.6609.030; Sat, 22 Jul 2023
 20:56:09 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v8][master-next 5/5] opkg: set locale from system environment variables
Date: Sat, 22 Jul 2023 22:55:55 +0200
Message-ID: <20230722205555.2487992-5-p.lobacz@welotec.com>
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
X-MS-Office365-Filtering-Correlation-Id: dc607231-d87f-421b-ab01-08db8af6133c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sQ/R9coOF86f1lxB1KwPr0q66g37TJxUvOQhpOU7PNvGcD+982twStZ3AoddruomC/hmuIg4uIbkp/iC6Qy9eumLWojX8qah1dGTRTdA/yra8r7yhMAANhrINayA2btL2fHc/dERxZoG8TIqQq76Kq+Zo7o0BYh0IDW09WqlegfTIl4FVCdFiduKIYHA1+ePAvDOyzhOdub0YE6vH+a2oAwqhySYrHIbMDZOtTKGZIDeeigP/nNgwxUugauOLu5p5OSPTvSVqhjKKf9rRguWPpqO9Gg/22d0Wg3UCRHBi3YOVDuw8AMonLSotkVDG5ATZLmG08LRs0IAgK0fg1zgefr/KorXPyJgIqRDZ1yIhWy+t59i9d+a6t43c9tMpOfVPnFM1Xcc4zbOe0f2tFrusiKgIl/sQUht4GpatXgS9zF5MtfmYAM/TIZWlEcdisiBvFUUzMAgji/9ZxszkGXzsIbwrXcyFGpquIg/OTVZdCPYXs5Wh4MzvZoF8Al31aj0yOlHFI3Vfy/btsW+a2wDHavfjb+uNL4HTGdhffLwRutWvT/MzUDly7OJl/O8PSXNo9xpj38rDhepWCsAjeWuid2mXImBzLDopDt+Q99wfOU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5368.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(39830400003)(136003)(366004)(451199021)(6512007)(966005)(6486002)(52116002)(6666004)(478600001)(186003)(2616005)(6506007)(1076003)(26005)(107886003)(2906002)(316002)(41300700001)(66556008)(66476007)(6916009)(4326008)(5660300002)(8676002)(8936002)(66946007)(38350700002)(38100700002)(36756003)(86362001)(66574015)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Cu/jTAuJgxYOcaWyejIqCCShQONHPnbutpXEaMMTOTHO/9NADXTgEF6tMBIO?=
 =?us-ascii?Q?k/lMHuguZaEpAKSmrXorzP5rqGrN6onG4PuRE+Rd01GXvhi/TPSW6jVH3z2i?=
 =?us-ascii?Q?2Ox8Sny0Jn3HTKgq1BzUkIyDWSxrKuM0R3K50HuGBZjEslXxnXA/2V5LkqI5?=
 =?us-ascii?Q?xX6f0ANnvKo/iUVUh1/waFwiAzkr1awre8dgr581yqMwYAlq9mSEgZlhZkR5?=
 =?us-ascii?Q?QdMaTEshfv1Dqe17KVK4RWIGbbQvC6TK99NXSMrJBIEJ+7SgC7ZRC+RgJVRS?=
 =?us-ascii?Q?m4ZP0EsKjt6JUhy3Y//BcrYuCi6Wst8e3HgZ7GMvvKCKi2NOYh9AnY8zMlHA?=
 =?us-ascii?Q?q7v+ShqbgZ1If72KsOFZmv71k5JYvL8KLIzsOnGhg3GC60wxqwen6Gkqmvaq?=
 =?us-ascii?Q?4YlwCumePdoiHlHfRxOnun5Kd+fIszTun5Yer5nbHWx85Pf6oXtwjmc09VW5?=
 =?us-ascii?Q?nw0GRuQiS2D2aOMqjWG1SycZLrZPY6QRikAwmAo6JOjhS0KLcQS35oH6Px+N?=
 =?us-ascii?Q?Vp8Xis+xB1lQlUCUwEOE2mI1w7L9j/LmU0wdQuDuchH5Uk+wbO9wPFlb8iFv?=
 =?us-ascii?Q?O3oWhorULeJc7c6iLwu1gIS+6qiZnH4ZfjFLGXg605BaAJyA4553PM8EXCG1?=
 =?us-ascii?Q?fWSmiPJJ97ylRi2nqCFIJZ7SuSeoe4a3JatxRd4bR+ycbrL+hpOAgSLhfRNv?=
 =?us-ascii?Q?e1GJnZk2O5q8Pubpc5fmH8IrfM3gkDyGN5uAvguWY6CAbk5U4XFEYQI8kcJh?=
 =?us-ascii?Q?XTHL1j9+AfWg5hAFDv0PfjYVmmxAqTXkv9UDNZXPCHhQqo2yGSCKET+xhcy8?=
 =?us-ascii?Q?EWthnugCbLsT88Yvnmyj9mZgCsxaW3OkeupjeBvLEuz2rKI060HvGyZmA+nr?=
 =?us-ascii?Q?QBGe+2IrtXEg8MrVtc05eJGW+TWdFBNOEmbY3b/HcLf2z3B6h5ORhbGOEfou?=
 =?us-ascii?Q?F2pf8dX4FrkMeWTgT2uNFo3HXaRqwDVw2p2qcU5PQelhvMAnaWcPZym0F/5V?=
 =?us-ascii?Q?8baHuqLRJgSJf/rLhClnTob1WXzERy7vh1fpS6PSl2ZijaSMbTjHJisKAa7H?=
 =?us-ascii?Q?ty+c73XhMXIoMPwT/ITmJPcZs6/7HFfcIamC3bu/c0Zwq0MSMTvCRDhvFm24?=
 =?us-ascii?Q?YbEtTp8V/YcXpvnakc0EdJMFW9lFGnJCrBump4Jsv/Ow6J7DmeJ8FofHwRgZ?=
 =?us-ascii?Q?5CJbNI5yBqpiAItlTWImurciLC2P2RwC7pVB9S6j+SY1Jbowr70IT5UO2mMV?=
 =?us-ascii?Q?8rpiHRW0NzO3GXc4AHyVEXyeMt42+e/5bcHDXq43YDKvC7WXNxpbcKFYf4f8?=
 =?us-ascii?Q?or+fWKUf/INhvMQ86fbAJmGZpyzdkvWYIuNGsGwLX2UA9FNKrJ7YImo+NONs?=
 =?us-ascii?Q?ht0sPxS4YbpBRHDQy75qr94O6ccR91LYyuIpFkSlB5f30Re9g2h2cOgOGien?=
 =?us-ascii?Q?U/Zl5vr312Zjvvx0XQrCy20E1MV+jMd6ghQFRkDCTjx/oEGLBNzrJucJLZII?=
 =?us-ascii?Q?SoAZRC9t08TPHK11Yk1Z4i2a0Ul31xA+BJCoUJrcY0/StZLJ0jMH+WiVy7ST?=
 =?us-ascii?Q?N+rIuHh+HnEEWEHf0pdoS+m1MRvC5Eb4721+As5d?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc607231-d87f-421b-ab01-08db8af6133c
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5368.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2023 20:56:09.9696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mcHgXhXvl5MyWfJhFNhZvZ8gsLjqcPHDZw5xe1ml9t9Z2Asbv4Kv5N+Xj6TLSZcTUvGvgqyFtPaILQaeVu+TJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6966
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Jul 2023 20:56:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184739

A C program inherits its locale environment variables when it starts up.
This happens automatically. However, these variables do not automatically
control the locale used by the library functions, because ISO C says that
all programs start by default in the standard =E2=80=98C=E2=80=99 locale.

Fixes warnings:
Warning when reading ar archive header: Pathname can't be converted from UT=
F-8 to current locale. (errno=3D84)

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 ...le-from-system-environment-variables.patch | 48 +++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_0.6.2.bb      |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg/opkg/0003-opkg-set-locale-fr=
om-system-environment-variables.patch

diff --git a/meta/recipes-devtools/opkg/opkg/0003-opkg-set-locale-from-syst=
em-environment-variables.patch b/meta/recipes-devtools/opkg/opkg/0003-opkg-=
set-locale-from-system-environment-variables.patch
new file mode 100644
index 0000000000..71240ec8fd
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/0003-opkg-set-locale-from-system-envi=
ronment-variables.patch
@@ -0,0 +1,48 @@
+From 712895b1914bf63ee4d669863bfd106814329076 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Piotr=3D20=3DC5=3D81obacz?=3D <p.lobacz@welotec.com>
+Date: Wed, 19 Jul 2023 21:26:09 +0200
+Subject: [PATCH] opkg: set locale from system environment variables
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+A C program inherits its locale environment variables when it starts up.
+This happens automatically. However, these variables do not automatically
+control the locale used by the library functions, because ISO C says that
+all programs start by default in the standard =E2=80=98C=E2=80=99 locale.
+
+Fixes warnings:
+Warning when reading ar archive header: Pathname can't be converted from U=
TF-8 to current locale. (errno=3D84)
+
+Upstream-Status: Submitted [https://groups.google.com/g/opkg-devel/c/16kgZ=
fJ26mQ]
+
+[1] https://www.gnu.org/software/libc/manual/html_node/Setting-the-Locale.=
html
+
+Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
+---
+ src/opkg.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/opkg.c b/src/opkg.c
+index 544c58a..0c729ff 100644
+--- a/src/opkg.c
++++ b/src/opkg.c
+@@ -27,6 +27,7 @@
+ #include <stdio.h>
+ #include <getopt.h>
+ #include <stdlib.h>
++#include <locale.h>
+=20
+ #include "opkg_conf.h"
+ #include "opkg_cmd.h"
+@@ -408,6 +409,7 @@ int main(int argc, char *argv[])
+     if (opkg_conf_init())
+         goto err0;
+=20
++    setlocale(LC_ALL, "");
+     opkg_config->verbosity =3D NOTICE;
+=20
+     opts =3D args_parse(argc, argv);
+--=20
+2.34.1
+
diff --git a/meta/recipes-devtools/opkg/opkg_0.6.2.bb b/meta/recipes-devtoo=
ls/opkg/opkg_0.6.2.bb
index d7dc6ab715..3b5d51d74a 100644
--- a/meta/recipes-devtools/opkg/opkg_0.6.2.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.6.2.bb
@@ -16,6 +16,7 @@ SRC_URI =3D "http://downloads.yoctoproject.org/releases/$=
{BPN}/${BPN}-${PV}.tar.gz
            file://opkg.conf \
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-ru=
n.patch \
            file://0002-Add-options-to-enable-support-for-acl-and-xattr.pat=
ch \
+           file://0003-opkg-set-locale-from-system-environment-variables.p=
atch \
            file://run-ptest \
            "
=20
--=20
2.34.1


