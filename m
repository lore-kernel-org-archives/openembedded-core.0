Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26A51C2FC14
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 12:47:19 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.87])
 by mx.groups.io with SMTP id smtpd.web10.186322.1692276429984904713
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 05:47:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=tZthrLHG;
 spf=pass (domain: welotec.com, ip: 40.107.247.87, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hVYtl2nILj010Tpq4K1ZJbuSVZxVJ48umthv6/lLWu+HO1ozGJObmjX9jdLOu7ZSBI5rp/Yl9KQTLakjCj0b78vQfyLxAEu7ae8mxcoTAntEvPADy0TDPLli+eukdrVtI6j3cnrmTZKLNQeC2uBfhZesq/qvx9JJw+LIx9jM0sFkN+Z0ytu2It/SDr0p9f15H9eMGWFa9m5lLLe0J+jCkU5ruzYB+HQeLebVRWKzgK7FdntHWIW1w36F0VgHHyzT/mtPq95uom8wQx3jV+SVNOBGrlETii01b0dnqX4F2JXpVc/9lqu7i0kiFs9hVQihWi0y5ZlMqiWYQg+uhY6w4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LEze/FgzTW1Mmmg+g5LHC81jOo5JJOMofTvX1FnQGAQ=;
 b=ZDAZTc2SqW4QCizoTYKJwbeCdslv09QIatp5c5irnQpEP93oz7NW2ybuh9yeg6NKD1btqDFqMxGoY65Xe/yGW+W5EmsEHIIdM7VhrTDUvgNJS+QeiLrFEx6IhEP2oo7Pxf5RSibYcNuDdPtEe4qj28mRKcJtxoTwubS/UKWZXLFDAGWzcF2yz23Qapq6nzS9iUnn/s1kO6naZEFSu8wmk686UDq0NDx47iWn6Ly/1/H++KUOP0bEhsppH31QynC7KU5TXByMeAIOEDmra+vnKjfjei/13KA2Kskh3kU4vy7K9mijoX4cCG7U6gtnELnDAT36IgaYTlsJ01W6Nji7Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LEze/FgzTW1Mmmg+g5LHC81jOo5JJOMofTvX1FnQGAQ=;
 b=tZthrLHGCDAs9dbRgn8gb8UO6gebAAQSa4mLZgO8q+XW29+Fv4AdkYWAUZYT8VgiBjNxhRGkCPJCfEbuLdNLqd65xgVZs55abS9eysoKNy760yRW22Ut9DrQTYWrSna1uEiT/qKqcgV9JlDDSxfJxN9G3BXsjX1mplvISuW1yCxiDB1bcpbS8XPeZNJY717lksWky+pJnPvu5nopMisWfdQ+E4/NIlKrza+ReqwoqwFvWKNOZUqIbdLTJxD5cwAlUxHgspwoOX91//hze0AV0ugV5Mta3v6M3Ibpbdfr5Xd1SjoTl/de2w/ttZZzNmKtW9QxVxeVa16Jk9RVsPwNAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by PA4PR04MB7808.eurprd04.prod.outlook.com (2603:10a6:102:c8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.30; Thu, 17 Aug
 2023 12:47:04 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::b693:eb1b:b0e6:9a06]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::b693:eb1b:b0e6:9a06%4]) with mapi id 15.20.6678.025; Thu, 17 Aug 2023
 12:47:04 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v13 8/8] opkg: set locale from system environment variables
Date: Thu, 17 Aug 2023 14:46:12 +0200
Message-ID: <20230817124612.1043464-8-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817124612.1043464-1-p.lobacz@welotec.com>
References: <20230817124612.1043464-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0249.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8b::11) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|PA4PR04MB7808:EE_
X-MS-Office365-Filtering-Correlation-Id: 362f0b57-b2ff-49cc-011f-08db9f200f2b
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Qe6U3TF4Eac/mNPbYM2ws1co1yp2A2Gh/GRQpIYCfjDX/SjytEwQLt7uBmkllUbkBeIMv3g3b5g7VwbxsLr+wx79v8ZoK/+UtEHXP/n3DZ8uq1vHMzhefsB2PhiLNFVhZIjeZ2kiapSiV4yTpV87ozgtsZijsMkFj8CL1dkt76GVM1VOsbr+9o2rPBH2+FCjNxd48UGpEvSZmuLCA5y1P84iAc0xcTTDVERCVOPcWiT8RR0NUAxRgOv6833/UvEuCTnK1mtnfL50k1U2jsD8Fhdzjp94D55O7hghJHhtEd70pBS/ephXldAuZd/6ltjE9sVX7Mpdjchabywh1U47y+7w3AoY6/WQIx7St99LSPtIRrBm/4SVApQBEdT6K8UlxW6+871sFc7mSRWsJTdwcm1BhpnaPMF1AHe4EsPN5wEGN0t+GFW4ZI35gVosd1jyVXN4C0ro62uqm/fNQWE/DmCGqhONth3uykqgSwT7MIskAEAA7GU7NXrs0012sc8B9s9QUc8ObyN4xmFwqB4wg9YTWBfqMK5JCfxYz7lNMlezmxx3tIlfUw+4C5UdvLFjOIKPNyDln7MiDCsEhIkRAzxIn5sAoEktWL1hs9R5MtY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(346002)(136003)(39830400003)(376002)(186009)(1800799009)(451199024)(8676002)(8936002)(4326008)(86362001)(5660300002)(2906002)(36756003)(26005)(1076003)(2616005)(107886003)(83380400001)(6666004)(6506007)(6486002)(478600001)(966005)(52116002)(6512007)(316002)(6916009)(66946007)(66476007)(66556008)(41300700001)(38350700002)(38100700002)(66574015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VbltCbm6TMWaa3Kp2bV9QNXYmJuHNTfjf754dkgzz/71whINrf10yU3s7SrV?=
 =?us-ascii?Q?HhmJxJN/JPIjZVc9C8azhPZUV54a8tWQwzfD71uHA838g/1xhlntaaBdoNoE?=
 =?us-ascii?Q?4Huuu4Rz91L8T5DuEzP/093toz5NGGPl2aP69D9kj9bSeMg7GoJknvmmLjek?=
 =?us-ascii?Q?FCJ/9o7nv6YQ1ndA3077oRR98bdOYuLVIbNd+vLbF0RtGwwRaJe64dZzLjl8?=
 =?us-ascii?Q?Dz4Wara3+dCdzwBPL12ZFutg7Uqc+o/sBMiHp0HzMxdaQFRki7IadWGesR7d?=
 =?us-ascii?Q?ncrJ1ZXOFlyoqRifdIeF48XVGLy99AIiZKptr1uFimKVrD4ZyipL9U2LV2k+?=
 =?us-ascii?Q?/gIU7GJS/vHkDeNfS47N4L8SqqMD6Ob8TSz/f4JdObEhkMjOnwHi0o/6Q4Ha?=
 =?us-ascii?Q?2xslRUSlqUplh676GPq6a+1h3+P45cvt2IRJhWNQxClfZLGhyatNI0gq0BMS?=
 =?us-ascii?Q?8kNunSwk162tQ3nsTinsBn4HuNUG8FRuP/n5wtAJCRx448UqLNdwjWsawgQS?=
 =?us-ascii?Q?C0RgYL57LnT0eveVJ87teywhg/q6UKGaWH1qKDokkWKZGOLotxZ/eXpwe26v?=
 =?us-ascii?Q?Ba9cTGCnJZztPzMnW5ZK2D9F0zdpEvNDdUG81oEEBOg+ek69ZsAABFAJncao?=
 =?us-ascii?Q?wjXFasqRtdJPV/fiN+or4jOaPyhaNZrFbaOQoF0l2gCJVsJZrjsXvxYfRfK3?=
 =?us-ascii?Q?c1WrmQxlE47xXKNJOird6+jGDjBAuS4C9xSAPCw7HpMxJ6Re+CrEOy1ujriu?=
 =?us-ascii?Q?ggjiyF7UiGsILQTf2W+s5WkpttZ1yAcaFc8v2R5pqONw1qdvxuTTmD1JvIlT?=
 =?us-ascii?Q?rtYc4DMGTmGZgLdQKGflVJFHkkyhdmgjrqC+1d5Oo51lc61/OBc3tV/3SAw3?=
 =?us-ascii?Q?vhYvF0VAuO9mvDwnXvHJeAteFNEMtZ2BX/JXAGR5SwjrH4wb0QuC83sHc5Ts?=
 =?us-ascii?Q?WBwOQeYv/OkoxfEzQ+y92QmLBp8qPSG2LiWBkPCleU1rTOXYTFhpgMkRw9W5?=
 =?us-ascii?Q?nsw14yRCHDmzyIalHO1POHAexdvYggwGbcLlgoWqF41/5oz+slY1dnsTbfo1?=
 =?us-ascii?Q?DWgSoZ/hTN/34Z5AOdedb5R4uw1ibLzyyGvz7qZ+w/XnadELddbKGM5h5U9z?=
 =?us-ascii?Q?gkrVTVldnXK4InlzlAi8WrkZgqBknIxVTUUNXmPQHqIu9qTuR5pEHSN1JvT7?=
 =?us-ascii?Q?kisxTjT7yTr2nqNBJpostPYYBIWl58FJkeOBBYKpK2ncjQxRCkLJDQHRJPJy?=
 =?us-ascii?Q?Er7lKChCd5toKy5ql7AtrX8kkF+LG+HloEaKDQid3RFRIX5E/RvFhQSddSG1?=
 =?us-ascii?Q?mAz4vyrM3KiWRHhTdvvGb+fdDK9ne0wjfSs9Gp29H5qN5NoQe3UN5Eh2O9xD?=
 =?us-ascii?Q?zESJlbEEmczbninD8pON7UApWBBd6wCYcOcrTH+gJFJTvkpBBOuxFdJSVFod?=
 =?us-ascii?Q?3V5lydT2ErlwNOzgTCm1DwAuuppCIwA09hSFsSQyeYZB9iguZhwruV8SUUiL?=
 =?us-ascii?Q?hYskRM6hV19xp2VOeoBkeQ4QOgWN5R86Dv2v5rAn1tBKv88MIRx6ELPdrBIr?=
 =?us-ascii?Q?tet9tvHrbzh5TLHf1ZCsWXQVnRKktsvTDM+PLYGM?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 362f0b57-b2ff-49cc-011f-08db9f200f2b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 12:47:04.6818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 79/I8wIrL4Qql5Bn1k32F5vXqsF0rMrZ42UWCjMgPBuikTc2OaMTIT0OYFsIjtjgEfqPaaOpLgikxg26g4/7ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7808
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 12:47:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186313

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
index 0000000000..32a375e4de
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
+Upstream-Status: Accepted [https://git.yoctoproject.org/opkg/commit/?id=3D=
9e62a38a4a52974007e9ea174504c42069da1a02]
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


