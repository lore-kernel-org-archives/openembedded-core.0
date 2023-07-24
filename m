Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AF80C41513
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 20:47:09 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.59])
 by mx.groups.io with SMTP id smtpd.web11.5608.1690231619658110944
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jul 2023 13:47:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=spY/lQgA;
 spf=pass (domain: welotec.com, ip: 40.107.21.59, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lpFzU9o+rJ0vSbQ1orPjS/xAxG5uP0ixt3xNdywSaYsOgOWXijPZkGRyVvnlRjU+qi1LVZeNHPFEwm4AeVP9xd0yuMaLT4xPcrwYhI5c2JrQKVt2q3WgNUZWVYI/bauDR4Vvs1mY1kCrWOTOOVumNHXXpPlaO2I6MeDdXJkMZa3u/8jPDyuQAZvN8bzmiDFnlefP2k4svOwLMMjR1TkIY3Wyc/UacGiRyicGf4oRZokFs/YpOwO9HkaRdsLKQD3fIZ0+taw8S5058Q8imFQycnMboh7l4uBaA7YQGZvEG3q8kRjvZ04beEcS+E6YgQeeqmkE27xecVzJu12Fh8dQVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yZ/fPcbzQ6QG0+G9IytQ8AGxZCoraw1G+uzAP5dTIiw=;
 b=V+xmndHdUahov4dHRgdr2oZDoibKVQKZjKNvxRfJWAG0RyXtuIuuqqUj0FFyJVKljrVbClqUgMqtivrphk98baymKcu2e/nwHVxjmh0YsJIhPm/M0lEwvSgCPdrIfn5xg7+j8ZbpBPVaKKmotoKEsvvZnl/EZ0YO76HUk0gZP2nzOuuI5jEgMhHupbIvhfOYomT0F49VU2iC6rveid9erxEDFoL9zOXeqdPJKAET/brWtxiQe+tX4dWzGNmSvEKgGwGaRpaEFz9Hd7W+M5bjzBjujX2cuF+xU6PJL2mE/Kew+jova340vjWAsr6pRtOFyITLUOR7h1wNanZQ3raBnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yZ/fPcbzQ6QG0+G9IytQ8AGxZCoraw1G+uzAP5dTIiw=;
 b=spY/lQgA4bgNZEPAI5LJRxz+P/hZKmdC6whiQ4EU4PW4rpgEC9kquYyH6/e6vOLh5kY1ccvvyyOeb2pl9znrMa9hgDPmF95jycQnvUogvL6lbLWM4x02B1OsQKJMIrLtCg6aFn/iSFQPMOlovNt0WgN479w/0qt5L1FB0aHTnuM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AS1PR04MB9262.eurprd04.prod.outlook.com (2603:10a6:20b:4c6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 20:46:58 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 20:46:58 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v10][master-next 5/5] opkg: set locale from system environment variables
Date: Mon, 24 Jul 2023 22:46:39 +0200
Message-ID: <20230724204639.353571-5-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230724204639.353571-1-p.lobacz@welotec.com>
References: <20230724204639.353571-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0167.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::13) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AS1PR04MB9262:EE_
X-MS-Office365-Filtering-Correlation-Id: 2720873a-95d1-4f25-4cff-08db8c871fc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rN9xxwlHKeRvAqVtOB4kB2DdQmNqPFuj1aqBH2rtzhbFTwfsHXjgGLePitxqpMq8hH2clDsAxmrLlM5CDP2u7B7n4REDN8qp0uxscllFcNh5Y2kIJMDm0dWLHQXpJxdNnTtsJQ9xv2fhEw06/73QUXp8SLi9znZYtlxCi2+Qzf7afb66+1xO9F3B6/PfivPRSr1KYhhXHWRAGsxmedf6j/AgrpIvd7tJV+j+f0MMKxiruUM91UwCe/5JiTIrjJG5xxclS6sE9ed+w9j/xqtH6LThKe8rYWpA5iwb4ryNZZQpd89Ak+Z1mP7/F+aJx3A7Yvy7FOEuh4JvEhIs/jial5DyDnjCV+1u0Q4XuGP1F6mFOoS2F1XzSm6mfKFFv7ZW+mAgBp2bw8eVo6oiZZC6tg/Vr3LXcBkVyNxuGr7vzRmwtILHRwTlnYnxjLIIS0ekZKYmXNrEUM4sAIwasE5WxKtX3Y4fNRjZiyN1YEuvQRi4588y1jikVHXiqmW8FAt7TdSnn1mOYwha8jp5vpGEH9pJXAVFesSqWykcUZVpWo87Tc5n6Xp8bnUusd97q1/Cq4n1x6l19P3KHc5hzAi6m0oRiepkZ6HS4fHjt9OPa8E=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(366004)(39840400004)(346002)(396003)(451199021)(186003)(26005)(1076003)(6506007)(5660300002)(36756003)(8676002)(8936002)(2906002)(2616005)(66574015)(86362001)(107886003)(38350700002)(38100700002)(52116002)(83380400001)(6486002)(966005)(6512007)(6666004)(316002)(66556008)(6916009)(4326008)(66946007)(66476007)(478600001)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8pNYAJgVd2IA5jUwGXiky6ES4x7ZoT3o+zdCGYtMTo5uGiguEZxGpNJl4HDb?=
 =?us-ascii?Q?D70fxtm6iZjdH80FO8KPWKNStFyKR+7tuxpGUnVZxYbERqnRIbc334cTMu6L?=
 =?us-ascii?Q?9VtZ54VyjE/yhTrnwlTDiE8MtBWoPTh19CNDcdXaJ8PcuWKBmSZBOnu9carC?=
 =?us-ascii?Q?ilkC6EQKEgxruDoRbGwkpViUOzOtMrzUFgdKfLww0E3qGHh4AvEUD9emTLTR?=
 =?us-ascii?Q?KgVRy+JgeEGCKF9DgF8PQA0zxsFEByVHKZCkxX21JUMUAtBXKKc67ZMQpyjj?=
 =?us-ascii?Q?ABXlnwQyH5b8KB70l65Qrfso6VavHTuZblLRrdDVh6TT7FNC4lUOYSTMtR3F?=
 =?us-ascii?Q?/CzUWFPaJKy+dSrD8u61aYXr8C0KVCmEVeMPBU1JI5X4Wflq0oe2d9U8fcmQ?=
 =?us-ascii?Q?iltMewFsqOA9KgXnc2elC2tsw6hqILvDy0Me2QE0Bi1a7M0+SXbIhWGS3TX2?=
 =?us-ascii?Q?XPbLIk0wYJV343D2xb6hjfF5RPfirdNb/C9RUPpthOpk57XBC4tL9CZk0gN9?=
 =?us-ascii?Q?gHnoZbMOyKK1sFTyQ3WgujG9fR3eEUZpV1kmZyqP4aIEABZhKPzsjGv4/GRq?=
 =?us-ascii?Q?vnf89uNxzCWeSdegpCGo6n6wKcty52e7+HWnuX+GNO2hoWPkKYD5ToFdPqMd?=
 =?us-ascii?Q?TKrP+tWOHozhl3lYtayRrH4o0HiSQNYy/ZI3mEI1Fx5/Q4fEzVu+kWYSQKRB?=
 =?us-ascii?Q?AyeA84zTBaz8sTZ15x+OWiRm0sPQ2VIyMbHUWH7exZBNIqyytA+0ceKQnYcm?=
 =?us-ascii?Q?ITonYXkRVN/hoLy7cQymtOckvki1e2H8sfZkL9zQZ/PvYP66z0cEdx3wlEjg?=
 =?us-ascii?Q?ambFsqebyMw/ygIcBYCpDRjeT9KYit8ZE1CZzFUkW4QBGLZKryb4X8YsPhWi?=
 =?us-ascii?Q?KW9hqa34pfup4lgKDUkY7Gmv775dIrJ6MubVW9fAjMFniVsoK9E48hNWj3zM?=
 =?us-ascii?Q?PP65bikkughi9vKkezT3SC3OWsdqDUwIhYMV0+qF97FDz9o4sVNq4MCpgJY1?=
 =?us-ascii?Q?6dU2iU+9N4r+bzR5mV77yCvt9gfOULw2DMgG47W2YlQllpKxJ0kG4+9xNWe2?=
 =?us-ascii?Q?68PGi4HeLalfdf8J9FlsdiyEaJ7SGpU6vxFKhp6sFW0GXaZxRRjuWW19deRj?=
 =?us-ascii?Q?Sryod1rc2f4ccH8kjIbRTjTUr52/S3DtPrLfoTsL1gxxbum8HddSfFd2xn1x?=
 =?us-ascii?Q?PmDZtqmfnO70+ptJu6rngNBsf/epQtNgzA2NEdYsANpDrYxbI5Caf1AjkUPJ?=
 =?us-ascii?Q?qkqqalGH5Xxxy2Isx1PmBnvh6uWFMR7E3NBLhkQ9AR9b7NB8H5634NI9Qrd9?=
 =?us-ascii?Q?7Q8JBJ+dllWE0irdvryCvJmxCQ2BVOsBn96AOTdkuNYRdopwh4tNsy+dyRIF?=
 =?us-ascii?Q?6LadQRFkwLk9YRTZrfUryqQqg9U6pZoCtKq9iHn9euamrbT5Jnl9hE82bvHh?=
 =?us-ascii?Q?Mpd9AhYAU9V5DEuoWQtUQAqmnU4NHULelgef4q/M5R0loCd9WLsV9Js6jQzx?=
 =?us-ascii?Q?g7+mGgkzyNdr9akPWPczDA/tIMVfj2qJQQ3TYvPDEm8UnKZs8lg+0kvHL8gG?=
 =?us-ascii?Q?H4GD0vUyoZM5k4KslSYGoxUa+XeWRCI1rRO8Lo9Z?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2720873a-95d1-4f25-4cff-08db8c871fc9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 20:46:58.6740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ynrpSmX5fZFoOLtIkj8dIMAUZCCPd5+qoMu6t6vkTnUhYdeMVSuFVcGsdMFEzTQO+k2eU3/ZFBiwacDQ6NN+kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9262
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 20:47:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184817

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


