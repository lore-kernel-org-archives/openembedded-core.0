Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93E97C001DB
	for <webhook@archiver.kernel.org>; Fri,  4 Aug 2023 08:45:27 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.47])
 by mx.groups.io with SMTP id smtpd.web11.7188.1691138712218312327
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Aug 2023 01:45:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=HrtEsfo8;
 spf=pass (domain: welotec.com, ip: 40.107.8.47, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QwQPqe394CarBXug0H/nbur6liMZmUhngG5E0HepnMPnV1BI6cmJ4PCNoVru1HLlPyW/MA31BszAgN/FCwkdws7MM8cZDqnJLrRyr/lyPMTdcrH3ZZ7nE8qebU9aE4bj6sh68EuP3ILsF5pkBMn5g409Blf52SUx+0iu7WRT6j2DTtr/GuRP5Fjpxqy+dXw1HcrUW53RstKEWcTNhInbRiuhBZOmHQWJF3JIfsxv8D4h2/XMMJqnwGcTTgaDwar+7ZFs5VbzvVFaQWHKz+8l5fffOZg5mnmxC+nV76vqAFiXYpXb68+Xcz7MzPiVAyt10JPtmXZ0TnYpE0R7DX5hYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yZ/fPcbzQ6QG0+G9IytQ8AGxZCoraw1G+uzAP5dTIiw=;
 b=crDkKupaIPHe3g/0SUh5zfOETLxbZvM85kuLxne4xDGnqDX9DU1qiInOq5hPgx8+63SZ8AQj7EnNdI2wHyN0T96PlGyUtAAUPuv5uRFWFxs0T4jZeEAMSzcgsTsoVCM91bUSwBBtwJiOtlYoNFUKKONiR04MOG3U2Iv6z+fFgXvVkF45MQF/sMtY7Z4HF41a6dDT5D3JSQ0DxuQloqcgSeit+B6CnqEDDHEROWwqxdzCPm9hRPAVsj0y50pX7zES7lA9hZi3FLFECKBdPQtoCnVNjotZH3MVxhvcupCjArz9Ri0enThZHVc8nkDVw74C38hIFQ4yhCZc+DNXG+zowA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yZ/fPcbzQ6QG0+G9IytQ8AGxZCoraw1G+uzAP5dTIiw=;
 b=HrtEsfo8hIu6kb2jA8YKHHXac3fx61DONbcrqmKINKcY8PibMKBxFF1cBKA05IO3FG2yBDdWyt1H8yVLs8+odEFlze4MT3GQ7/9cr3fDfcOLE5YDHAelDDeShg4XMLIIytnRCTEo0F5afKl6N6LwElk7v0v3bcir/Quduj8id3w=
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
Subject: [OE-Core][PATCH v12 7/7] opkg: set locale from system environment variables
Date: Fri,  4 Aug 2023 10:43:15 +0200
Message-ID: <20230804084315.55768-7-p.lobacz@welotec.com>
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
X-MS-Office365-Filtering-Correlation-Id: 116ed314-9a7a-4157-6c04-08db94c71cff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	c38RQ7Yl/5hVH6yKz5+ln1FiXk832ZlnYobTKShq9Nx2PThmHIS4mcLmQl98d/jet8a6H6DOr1Yjip2wHBBIs+yrWG5bM84qQOX9VlmSV1gru6A2r4VCuiroNQNgMWhwOZYucguxfsLiRDHnauwzgA8gGEB/waNnkOGvK0t2yT63h8wjYx1UEtRcDp643VbVwZgprIFe2ndtpk2hb97dn5w3mE9khYXYAi6HQfVbk9gPH9T9RGlFpffYx2lUsrE/6dhPdvYkXVtevWOlMjXEvjR9gOk6D4jFKUdiqHUjr+2ejp4ionSn/nCDaHSx6atWNhfI6y5VWJjwXrLHxZqN++RArjOcA2lbziUl9yN4zzY+ykPlVnkEgHBqIvubZrzuKX9M/zm19G2MA3/cmgFwEU6WHebX7U069Sm7P4IVdJXMCN7FahR9AEAY7YFA1Izw1a0G7RgFs7v0rfyVwo7H3XY+TeniJ/t+w5H9UMZeQV1IciTDbJ4ogluaRTK9XwzLtt7oZzK+4KunLn+r1OE7oYIJmJBESafvNjMSRe3ai0g40kSiJWLNDSSHs9ZkjgaEgG8qnOanV/zOFMvBKErioucT5TLBr0USipwh85EBie8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(346002)(136003)(39840400004)(396003)(451199021)(1800799003)(186006)(38100700002)(8936002)(478600001)(38350700002)(52116002)(966005)(6486002)(8676002)(5660300002)(66556008)(316002)(41300700001)(4326008)(6916009)(66946007)(83380400001)(107886003)(6512007)(6506007)(66476007)(2616005)(66574015)(26005)(1076003)(2906002)(36756003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?q0IeRP1+qfLGb1Gl7KVBU7rOucSsUSq4CC81/4znCdAZuSN3U9cgg9mUapMv?=
 =?us-ascii?Q?5WBDrybgbUSsp8rqLOV9HlqCD4hpcvLJYMPm2Sh2bdnvR/iuE3kqbFCTzlj5?=
 =?us-ascii?Q?ftcf/0v4KDWu7/l/CnbcENVQgyZIcS4z3r3f+/tvOucyOtzfL3nWjfbmK/6G?=
 =?us-ascii?Q?ypHKHlQPrW7j94FP3EmVhp1/zyumyqrqfJQK9dJhxt7RY1G5N3baJfyC5mql?=
 =?us-ascii?Q?wsGkFxbX3r3BKlXr/s6FODnpXC0VbHcTpl98IQy1Ijq8J2kumgTxsZiUH+a0?=
 =?us-ascii?Q?aovy5y/oP8qMkRGTyZzZ7xXQFBjHH+B7VBbSmY0GtAbgg3ta++wnUU/33DK8?=
 =?us-ascii?Q?5M0EzIR+UYVgZdrT/s8YM9nGvGJ3R7mB0LWaWX5Ntu8bO7BUagpq4QsdzxfX?=
 =?us-ascii?Q?iVk7GgtCSZp7Fp17BpRmRMsWaJ7fl1HxknE4Y9NZHbcd1bynVqHplYXnI02i?=
 =?us-ascii?Q?hisWnqX+wfh28fUTC+2utDECo/I6KD6rH7cUb1I0r2ARM8IEsBqAw12B0sOZ?=
 =?us-ascii?Q?RY9qfn2laDyuqVrYgIVhNpqhY6WUTZfGYe0J8njJ9QC+w+KBaipOMwi58Ktw?=
 =?us-ascii?Q?HRinsNm+QMO3fwxBs6UQPabQDz+l4c2znhgSyT87z5/G/fdSrUmwoUG9Ev7w?=
 =?us-ascii?Q?SlxIoEuvxCuHxZrSOFiHdMJh0drAYpGKtOnutZqXCt0alSwex0MDoxHhWKoa?=
 =?us-ascii?Q?BHu0InncvQKGHuuAe4MQarum/GZWKegV1GG/s8Aur5/S9JJXFWnJaqZqDpoT?=
 =?us-ascii?Q?mvxuwGNczEhpzq7CFD4f+7fXWJ+I9evdN9O6b0vZNuOg8f6jltiKqn8I0Fzu?=
 =?us-ascii?Q?jvAqZcqGMWQ+/X3LyxH9qlnzinCrgYLrp3Co7oM+IE+xvIYgDdVwsQTxtxkW?=
 =?us-ascii?Q?MiaWcIsfnIzdPora34lMheP18o8lonunVG/4cTN+UhKnrYh0I+iOUhVuPmas?=
 =?us-ascii?Q?bQaQ5/F2cqDyihxqo1t0Sd9ksXbzTNusJSlctPMCEzH9HHbd1cgJaridIJeC?=
 =?us-ascii?Q?T7jdzUcAGxyU/mFO4/51R6gPhshEOKIfpwAkW2w/DojWdPEvnqk+CF+STbNm?=
 =?us-ascii?Q?mR3S8kAL7JMPghlrZTeuDCszzgGlTjnqI1I2cGmpZRi9rzEgSt9AgglFHPcA?=
 =?us-ascii?Q?hgsNG3Pu2P1vgPp/GOOeBR1lDQvh8dAG35uJ7wLr3XkCPDJPKFAbaYNYfTeV?=
 =?us-ascii?Q?uNDhbZMXofLgrLm/oDqdz81Tk3YWE0Bc3UtSCfb6raqh9ot8G4TJi1vP/2Qx?=
 =?us-ascii?Q?FrfAHtk5547d2TMMCjDoElIIwBcat7u+PFPnqzDa6Kkp48uClVhVKu1Y0zhw?=
 =?us-ascii?Q?xO6YGsTC28NV0f9mzS8TwTyTgy+jegJjTYLYw63aGIHiRIBasPK5BW11/sfo?=
 =?us-ascii?Q?Q9xRtf8JQiBDAXf4eN9DRMen/cXtRX6J7StTjkPaOD/wq55swciG1TvXoH4+?=
 =?us-ascii?Q?d0Nq3mvGNpKbxYDj8GpZ+aJ+lVyotTwbvNdxXsKoQk3cFtD2qxsI0+Kna1ug?=
 =?us-ascii?Q?LZ6W0cX8MbP7LZmXBKEIaKhhmE82sWPwwvXNiSiAiwxIGcf5j98wOuWEJ0yz?=
 =?us-ascii?Q?RQFJj5hnPOShyqZ/tADeFoSeHxpQr17AE2IZvVPB?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 116ed314-9a7a-4157-6c04-08db94c71cff
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 08:45:11.0559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G+yYzjU+xm6SXboz+mS3qzVjhnlIAqQGfPtnUoR21vFwcppG2OFlb41xENjb89sKpZ519hygNFszQNKV5CKu1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7743
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 08:45:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185517

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


