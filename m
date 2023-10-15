Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7422CDB485
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 14:58:47 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.45])
 by mx.groups.io with SMTP id smtpd.web11.94695.1697381916061748557
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 07:58:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=ZEHsb4gj;
 spf=pass (domain: welotec.com, ip: 40.107.8.45, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aPO3sw1I44QPClpqHuNpILidB4Go5dd4j85/YJYkOVPhjrPfgfWtW+pJ8YefuM9AFksdXdgQgXBTGA1Bqhmae/EU16HulBF4etTykJNfTr/a4xzFgXrs3rxNhuE/SYiob9CCTjrrySD8QilG9PpRtMhu4ovOSdHCjrvRbDj0mAF49D2aGnQicEsPYR3uiDnT3j2bVXV5OEbcbaT8azGoVNuu6PX4kiuzdiR2TDjU5dsr+qvkTU043QXWIAx9s7d3SNjnFRIy2Y1TTcTi8geUAjXEVMLEpIEAzLyecgJ7P9Zm6xbZOhwBR00aiT/UuGcS3jFTx5HIvvAd9E+s1IzX3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N4yzEzAGIfJSEA08tZtSwRV6ZJ4LHjSKlNoa9U3S6bE=;
 b=UBgidzfEylyaXd2eg1Xi3ovNQx64GEfjaCrfi1tarl5BUmfgRbRZO8sWJ3AeRFPp99je9wvtFZitE+Qk7XLqfTZ+HZXRIF7kH+UVuNf3yoB/x6AtUFcxA6Gvax/iSxE7rImConb2rrBuw4HpIJ88mXY3EYlu4AfRSS4WlwGxg3iOjoPndBPA64NhxJlBrTWYg3sPECtCHDKS3BsWXUQgSeZlmVRqx9+lNXagArFiQndJr9Lb2h9CQ/UImE2efSpTtAJENdhtyAckO/XoMxQ3aUNyMeFyyTTV1aRiuaK+KoBkt/2601vRSLRIZgzWthKNZgbSLOxVtKYdhNbZ1TBw3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N4yzEzAGIfJSEA08tZtSwRV6ZJ4LHjSKlNoa9U3S6bE=;
 b=ZEHsb4gjLfFoOtfRigMXjSsDeEU98N9DAvCdvfQTrwFUKsh7i5brU4EfIJPXRDgvegyrailq1NP+G/6rgM7OyuHl0kVUL93a08sE3bP7oKoZmiBYIEOTw87ufSDNJP+Agg6b8Tv7A6U3SNswPFOTSkM4T3+ItrkYwkuBO5k82RIDzttZ4cU4bGd2MWQzs59ahiI4FBsnC8CV7BhvIYqJNhCSFfTiHRDzE2qEQTKTSXQmXXisS7jnBYUrYPVu6ESOhiexzAz6AXR27AqCI3N9Eia9Zfd4wE8RI0EMuGWlNrnUBAFFEiMuaI705X19eFi1651qUay7ianFWGTYHSSyBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by PA4PR04MB7613.eurprd04.prod.outlook.com (2603:10a6:102:eb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.47; Sun, 15 Oct
 2023 14:58:37 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3%6]) with mapi id 15.20.6886.034; Sun, 15 Oct 2023
 14:58:37 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v14 11/11] opkg: set locale from system environment variables
Date: Sun, 15 Oct 2023 16:57:49 +0200
Message-ID: <20231015145749.69995-11-p.lobacz@welotec.com>
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
X-MS-Office365-Filtering-Correlation-Id: f417b367-e84b-4516-c300-08dbcd8f35f9
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	F6ZvaB97uakcbV1le/HaLCuOivL6OW1FMpZy++jvtmAejOwDePCMfNi1HO8qe1l+/SbaZVVxiedrDWcnLkO8T594BI9Iqc6k94qjdrTVo4zAD6JmVKyQxnGJpkQs/lnm5D181VtgTY0qOima2xJ0p4cY6Yer613F6IX3Plwz0Dek8zKSImoKEuD+ZCzMOZ4lWcNPaBlxZ0moklL7bDmJz8NPQlx7/Iv6tivs+6U52TeukGvxyJapl9Lowt1daYV4eaDjSvz3dsWxvPeKGGCOh32xNqwDI4IovP42hxCEVIS2ZlUrIjF/wrGcAlHmmKpgc9gxblCcO5wplgjj6045znQkQalDq+bsl61RYGRzoK0RF1rYJK9B/fGfNcD4Nv4eM7mii3r17it31LVXCY2W+qXvFMjy2FA9Qp9hCsgs3wtWImxwmoKID3+3Q1ebiLLqqcUDRfbXWVc/imVrb/h+DzEyROa9gjzdida7e0vnuqFTdl8ODhsYRPmK3I0OZlh8QpVuhpIGg8am7UzRo35GYHkzqeX8RZ5R5AsL/wf1qXm3SIuc0r83vFb1sbz7rkQ8fxVrdMfsHoClC6Z3oSMdTdhTdczJupoKTBmvOao5Ok0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39830400003)(346002)(366004)(136003)(376002)(396003)(1800799009)(186009)(64100799003)(451199024)(478600001)(41300700001)(6916009)(316002)(66946007)(66556008)(66476007)(6486002)(966005)(4326008)(8676002)(8936002)(38350700005)(5660300002)(6506007)(52116002)(38100700002)(86362001)(6512007)(2616005)(107886003)(26005)(36756003)(83380400001)(6666004)(1076003)(2906002)(66574015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FJLtN6ei2QIdbFwrGoSGR+Aon/hFdP0KfWZOo0sXTrNEvyX8J7qHjtue9NGK?=
 =?us-ascii?Q?XUJ+79iCzA646oeGz68M/nYUkiKkesjDBRqATuX0Fckyye1bWeKfSj/6juW8?=
 =?us-ascii?Q?Shm6hFGhr/rn1nnJpoqyj24VcNGmZTF4WN/0AWjNPEZ8ZjiD80eDXzPm/a5Z?=
 =?us-ascii?Q?mX2qpr75VbpIrQLjm6/peUrCO3s3ObHlosSQ8Y34Hd42sKb6JJxKGyhdkJHV?=
 =?us-ascii?Q?JXEEBYBhONI4WQkrlbCy4t9AgeClZnq9vGeOKAwR+lRFgQjhCNnnptoI4FUN?=
 =?us-ascii?Q?vNk6w0LE8EyxgL+OhBv5OvOyqkRfe5U8sSt7qVfp5Yja2h1HazdBwk80rTW/?=
 =?us-ascii?Q?QWI5g9ud9rq17/ye6TaCOFF6zeUMygsgSl3hoyqvbAuna4/YZPev/Nm4Fdgm?=
 =?us-ascii?Q?NAXsdQ3lkPyyxKUhrpMiT3xVk3Mf0nNRQ8vGdoRWR/AQWYBNSpbcioL2c32a?=
 =?us-ascii?Q?CN37EQus2RFl1QGtNks6QTiexV/F2cK2ywEIcwQ9TpbrgSI+Q7bjt9pr+UWh?=
 =?us-ascii?Q?S9lB6STEOtWXy15sJUxGtF/RJFQiT9Ny0FX+i1W03qTKdgOpt8U0gCYqWXDi?=
 =?us-ascii?Q?g7alO0gHC3O9oNUbnIky3ovHhp+fxbA2SYFQG1sOiyPh69CWtaCgwaCIuoHs?=
 =?us-ascii?Q?XxXGbwhdq0KCrJkpuEX9IMf1q6CZC/dgccb0kTxY6vXsot7/lQ2kxg6kSTD4?=
 =?us-ascii?Q?LmIE0Mpacqpd6yzYlZvWQ4FUoDZziXte0OPY5jnxatYyW38riAdB2RP/zHVN?=
 =?us-ascii?Q?ImMbDQ9D91NjlDUq3mDtCuny4G0CTlyLH/4z5IhJWsP/8ExaoyUdz1NE206N?=
 =?us-ascii?Q?6ctVUdPS72zD05o+9qIINoh+7fjZaMklrx7bP7JsCjA23fxL/edbR6a5lOd4?=
 =?us-ascii?Q?pB4prSvJRKGsQFRG0MISTRDO01sUlN8rjkNOiwM095aCSF/pKpZwHjjt+VBa?=
 =?us-ascii?Q?KsfDXXPUB0CXfCzExJiQA1OrKdHi7pr0Pk7X83Kk5DAF+5380QGCkwPOePkP?=
 =?us-ascii?Q?Bnv7L8VdoFL7dzkTHnM3jN79ywCX2BFE5GOouNPMHelVmYpPIlnkUKUTlaMl?=
 =?us-ascii?Q?L6TPnUlg7Uiv2EOioJbAzVv5xKjMMlM2p+8HELeBugh/2nCl4AiYcF85Kx+m?=
 =?us-ascii?Q?nAUiQcH3BpiuAMJP746utsXnEospKhk1tiTUm0ocZKFGBuja346HbwQJYOOs?=
 =?us-ascii?Q?iC8tQpyDowjoiyc5VJcBloyWZmcj5IN97v5dHSzZdAY7GQ6g1rNJe2nPFJQu?=
 =?us-ascii?Q?w19gKqdrsSbactbp5wYjUod77ajqXlAIz7YdCh0UvcTU3HYNYGvUPAUkcVVb?=
 =?us-ascii?Q?UcA64u/+eIDKQdV+qNWSnQVbYVfPxNqLZeP5K+U0rODmY2ZtQdn2G5Xg5DlY?=
 =?us-ascii?Q?XSYcwElb/2AqQMcMlfqNICtFAEUg61OG/2CzAaJ25E7FDNJ+RqZVO+umwPyN?=
 =?us-ascii?Q?H90FhQFEwEUIQWzntEt7xhqeJ16DqPjTzRNGFcQc6Tki79r19CfHenmDYVRj?=
 =?us-ascii?Q?F2JSesSdOWYCFpc97fAowiPKCu5oShdwNdwP8R+Yyj8gNe+aMj43eh9SDz3y?=
 =?us-ascii?Q?b8j5g3lgD7caWRd3q5OrLDHBEuqNZRjzcbRB8IaG?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f417b367-e84b-4516-c300-08dbcd8f35f9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 14:58:37.4077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ob6AUCCjrqqzB3EiDHH0krTy5Werg1oQQ+0nzgDjxXatq9N+6JBplDDJNG4j66vzwMwBt3yxNzl82ts9A3wQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7613
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 14:58:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189156

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
index 0000000000..7bf191beab
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
+Upstream-Status: Backport [9e62a38a4a52974007e9ea174504c42069da1a02]
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
2.42.0


