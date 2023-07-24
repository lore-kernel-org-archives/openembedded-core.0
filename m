Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 649C6C001B0
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 16:20:32 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.45])
 by mx.groups.io with SMTP id smtpd.web10.52153.1690215623694029530
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jul 2023 09:20:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=gYZbJwOu;
 spf=pass (domain: welotec.com, ip: 40.107.6.45, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cppjam7OkAZ0F7folsgbbAlAm13H2qNF8Pn5c6GB8Ys3bzSrnbC+s9pRsVQUrfeFKAbrw6HqbjL73SfF0CSBN3w6/kd2I8/6BlDOwXH8ZuvqqtN5tpnIoih5yp0/9VTyin6sKnGcbz+xyfkIzlkTk0VqFhK5e7jZXJ/FBDGBwVbQcf6Vv52B1SY3LsBYFqKGypYzZF54k+bvZzoFsThTZyd6YiZkB9EDasZZElnFDS97klcv8J915UtYflFnU85PRomsN+fmcS3SjxpkW3z28ZtwaVbRDEOuqn/vIti+cHpepVIbHouiAg8ld33cZ5WedyFsX10hXUdokvrGIX5AGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yZ/fPcbzQ6QG0+G9IytQ8AGxZCoraw1G+uzAP5dTIiw=;
 b=lKQPsRkAyaeg6G2s4xiyUvpBaSNO/S1+PQuOyCjOfAU/LiTQLW55efbuBWl/2FZdmrZktAoPODL8tqctT58M1JV6nEK0yTckKxN5AX7LB7UaUrdUxzr5X6vFNAnGURcFzk9DIY0/H2mZk0EErS+p6V510Fc3Br9PnjVXxrjbHIDsERG4m7IIdcC+zb+wMp4sjpmmpdZCe8b5M7/XC1CgJ94j8jlbxMmdStCrVOmYix5vysg67JbbJ55r86v0UkPBX/Ts0jKve3oEgQCkCE61lUjTT9jNPRT3Mtk97C9yMZP+5EIh26SaA3DPuS4V1EMKU8nhH4DCL8kWEwryqe4lGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yZ/fPcbzQ6QG0+G9IytQ8AGxZCoraw1G+uzAP5dTIiw=;
 b=gYZbJwOuFNJ1YzmKzi3agGKHXl5vdyC69nkKfe+161hUWE2fs0bV0C0p1rdYaDRV0iTq75is+Tz8pM8Y6j0YZK4uRzJNbzTgFfcgodRJw6h9nTblR8i/DKmwAgI1LuaHjU/tg3fUI+aG6I+cyVCrH5HqQVIkFp7gb685DUe3vJE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by VE1PR04MB7390.eurprd04.prod.outlook.com (2603:10a6:800:1aa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31; Mon, 24 Jul
 2023 16:20:18 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 16:20:18 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v9][master-next 5/5] opkg: set locale from system environment variables
Date: Mon, 24 Jul 2023 18:20:07 +0200
Message-ID: <20230724162007.3701193-5-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230724162007.3701193-1-p.lobacz@welotec.com>
References: <20230724162007.3701193-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0464.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7f::28) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|VE1PR04MB7390:EE_
X-MS-Office365-Filtering-Correlation-Id: 65fe333f-ac23-44a1-b7c4-08db8c61deb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	X4OwY8f5pJJZoZvqurdi8HyS5nCBwzWkLQZE0egrXjj4Ei3qYjj6eALyrCVWorLnXYfjgfIGqdWV6ZUFhgj71DETnTDbnE0SUjLKuuP2uj043K9VHn8Q1Ka8Af3NZMvhr8wxlHmf6FGrIyit3F9PXj3c/GNw5OrKgwtb0xBVsrzSrip7Zj6MM57iiJ5nSW6vn3NYy/FJjWIBLY/lBdycEAv6puS0k/PzLQeq+t5aGJloTPy6g7+Qcaj08biJ9u82hJswc+VlFzymRf7s3F/v6D+LOcLyInDxuXOBgQpzF0zuvaGMwrsPILI35zwuJuylTcsiC+52/xGNmRE1vAOUeGjOrDJTeP2I9s/GxynwQ/4RA+3QY4o2VR3ZoLxlrR6XCdY8CO1n8NZdBRezhAaldaYlbjRl7bcGmi7h4CPpXuudj+o5yp0OW8N6T3HwvnUw9ANSzNMIZnxuqUFJJjsLNF1gilZ3fkXaUHr6GNW1Yl7F2TFnBwb+7jVPDtmJo8OXlyY+TTIJHdHOOVHuXg5dMq916UgcpClJmgJDHP+NMGTsrIMp/0Obt5v8FRtDs+Oi9zLrhABbPxx/H6+U/incC6Krjk1Og67RLFEssiTOZbo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39830400003)(396003)(376002)(346002)(136003)(366004)(451199021)(966005)(6512007)(6486002)(52116002)(6666004)(478600001)(186003)(2616005)(1076003)(6506007)(26005)(107886003)(2906002)(41300700001)(66556008)(4326008)(5660300002)(316002)(8936002)(8676002)(66946007)(6916009)(66476007)(38350700002)(38100700002)(36756003)(86362001)(66574015)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pFo21Ryhq5pAntk0/G2zQzUzFl4jqKpj100hEWF/N0kIsvyOGD5gngCMa2Vv?=
 =?us-ascii?Q?Xo5RKsOL4WQ/9HK7RlO0tXZltBulm3Zspz9kHeon7uCgNy/C7agGOW4mlAuq?=
 =?us-ascii?Q?apqYj5ObCTPsosuGiWtuv9zsBt4E5hvhl64PBOK066JvxzAOBYv18NMkXa+1?=
 =?us-ascii?Q?BX5RZEmXgAQq8HaqtARiJ/Dtvi4kEu3oKw7ns7u6ZL0gUQf9n/CfdrEjbML1?=
 =?us-ascii?Q?0IqYASflhugnIDIJTWHEY6f43BiDDhYl2gephhnBykGrLyKwgpmrr/2Vj3ww?=
 =?us-ascii?Q?vRk52MGcblsgOy8wYxd0VM3WoPhO+HNQ48BY9UN507XRLFHH2yTNa1CieexM?=
 =?us-ascii?Q?7xR9RbDrrrHjA7gMR58Akowon0GtDTybNfMiV8qt81YOp0y4w/+181Y+XTf8?=
 =?us-ascii?Q?IRgJbL1bzs2/1T5aZDOoi3AXu+MS9j4QprFg8TIFhG8hZwTddWqnZtE3xF5n?=
 =?us-ascii?Q?auijmo0/Ve8f3B1Rv9vhb1oQjqIeoLyRdOmRnVh4PdeBgqb1DCuRNHfWwSJo?=
 =?us-ascii?Q?OUJTZ5AO+mhPLr3E0WEh7lcBS5P891vcsz4TKzX6uwRVnbRKfrU9K9ugvk9e?=
 =?us-ascii?Q?ka0L36S5ddGfPKZIiYPfvB6fxqBFLvk9imR1fY5W7N+iqOBHAYEx5GafGrl+?=
 =?us-ascii?Q?xz8AV9PBv4Lig+owPU1d09r4Vrt/RsPED0VHy0VxgSN7p59Tltp/+ExtIIi4?=
 =?us-ascii?Q?D5/H9MuWtGBM2FhbQhuNGO5Ig6SKNt+m6IDkp3aeAQlxhyHkzobg5IyURBIq?=
 =?us-ascii?Q?e+Bm8Y1KGZvoZvuvP7lHbFZYI+TLDz0oBuDsITKyWto8mVeaAjzJCgfxIR7A?=
 =?us-ascii?Q?N48TG+WgZNj5f4lyUBAS/vQjUYmSz+6DvYtHaZ51hVCc0eY95GznAQmyo71x?=
 =?us-ascii?Q?QK5NBc8o5ZT/Yn5LUxk4ywCOYfiJU90fXVxX+OUUO0tn9d5x+8epqeGYOxGb?=
 =?us-ascii?Q?zlo294iLS29R/ODbadJaqISpw4EvlIzjyJXD5vOq1FK0HPZNJXuaNfar0sSx?=
 =?us-ascii?Q?Q1RkAJMtRoc31XWAxttY53VtW998xNS/hPRzyQ9pTsxAU9dpxrSE+fM5bu0i?=
 =?us-ascii?Q?/Eeb+7hOjI9argbD1cgCRL9asLlqBbWIpOSjYE0P4RdUsG8Ua+yY98Tlx+P/?=
 =?us-ascii?Q?cFKBz708qeUeQ4vKJxRkGrmvCEIUkVkLR4D5mcOMCEzYsREiq61O8K5ba6Ow?=
 =?us-ascii?Q?0N7soP/2EIDH/GePZzcqzKAvL3dGj+NjADJ1vQcDbL6JEA+MP6Kv2xQp7EoJ?=
 =?us-ascii?Q?8lZsUUbtUHb82FO65Ut1PUFT26tP/uJzAMmu3mzU554A8NYATD+phnfaa7Ls?=
 =?us-ascii?Q?7hU668U60wBn1ke1suxQFJEkLZv3iNevW0qU0uQJtlu+Enhzyn7eyCHKDoSr?=
 =?us-ascii?Q?Ph4n8D5ufFVS02PdtgCT/miiVQ0TliJn7sGdxG6bCNs6vgKcv/XCxiFEzH44?=
 =?us-ascii?Q?oHooPLqJWFGXr8IlGfpL6xsl+9IHNMxdIrDR7Ml0pVlCN4ek01pxLobFZRXf?=
 =?us-ascii?Q?CJjiSRyM6mKxRJHKAE6JdXAJiFuavEfgqAC/JZ/hX+Js0TQK+mgD4pFu7Z4E?=
 =?us-ascii?Q?H3iH1fpfFiPR3/Xd4U/jTx0Y738LUQY26BysUzW9?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65fe333f-ac23-44a1-b7c4-08db8c61deb8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 16:20:18.0588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5fJSlk3l21Q50N25wctgRZXdmjVvtoeHFvpwYeD623kNTsE85FB6HAbVYHrgJTC0t/QJg/GO1fGXVzrrgHtAQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7390
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 16:20:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184801

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


