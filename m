Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5F17EB64DC
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 12:07:49 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.42])
 by mx.groups.io with SMTP id smtpd.web10.5650.1689941259106516710
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jul 2023 05:07:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=Od5OWQgI;
 spf=pass (domain: welotec.com, ip: 40.107.20.42, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GM20rZZwRd+22jRwQivx9TFE2sD25jjtVtooSObjLt5qC1G/LS8EcuzO6xqFxSmHW3ligFr3jf1v1mxshbsL+v2VgjKabe2ZFoQYt5/CBvHXs4hJaA/PPI/glcq9j4+ujQjnQdZtKGgKd492jVY9LmLqfluqOfg8k7QcCDba/bbPcRYXrWpFxgbxsCgkLSkZLqyaLQoocCAdw8zBzt5LkBuhEXch+AMQXxykENCloo7w+1Nc5bvbflfMmBdD2f3wYZNEE2Dhvf9k5Ul2kFxIqoUzS1Rhvh44V1RFKTgWdXtR2Wr4agRdNPdjjGvoOFsLcZ/Rq+0Vj5e2hFM65ovFxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yZ/fPcbzQ6QG0+G9IytQ8AGxZCoraw1G+uzAP5dTIiw=;
 b=Mb5jsvQx3USScg37+k1wy2admM7qOyzsLStIZ64MJ6G5MgH1a/UwuAYSWsuEGYi9tYeh0/ixeo7FOuOuxxMeEJw6HiAOpmW3ZOp4C83zx1TGzmPZOxkykpESewDB1bNhdzNORXbdApb8wvoaRC000Lok61kqJG3YmRj29tlfTbVWNXnsplqF+5nTvaObNWi4X217DfaiDOnk5epFEilgANWtmDTdkTOpScaLI8LXLz2fetw2rOvtAJ5W04bkd0UvcHezYs7ZYbjRwt0lMg6hPYbtnubY7SLAXTV5icp2SqL83bhzxBKaAOBleD6lCsqTqgvB5Y4hv9mV00gAykDVHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yZ/fPcbzQ6QG0+G9IytQ8AGxZCoraw1G+uzAP5dTIiw=;
 b=Od5OWQgIopC/kmHkxU2aNtvp+uWtqae6XnYGZBu76ki18/yzqnVvi3mrtSqK+8/IGWW0tTI7gENDpn95JWOE4ZKAq4vtTaw8VE0a4klI90SZj01evNYPBkjKCoT7cmVRMF4cWGq/8irhfEK5xOQ8CpCzemqR61cMU9PcSm0sUoc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by DB9PR04MB9578.eurprd04.prod.outlook.com (2603:10a6:10:305::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Fri, 21 Jul
 2023 12:07:37 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 12:07:37 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v7][master-next 5/5] opkg: set locale from system environment variables
Date: Fri, 21 Jul 2023 14:07:23 +0200
Message-ID: <20230721120723.4006443-5-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230721120723.4006443-1-p.lobacz@welotec.com>
References: <20230721120723.4006443-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0124.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::13) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|DB9PR04MB9578:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bb7e7c6-df1e-4518-0eba-08db89e31304
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	u9643of9fMcx+wElDxPaMnGDTo/TqNo4Rz7HlWMbLDmDIu2QAcqpNQQqkdAOWPfSdwjtXseUtHLfI1oy7Q+Kyex1PdTBw44pSz1txCNjR8gOTE9ncfI+hjpvLqsZVHuS/Rd0ADiB0Owol5ZBtCMkiTeoI+81x2A8hCyWwaSmf54Um7TCKefw8ri/rku5DtbzM1cx/izwiYtIWF4BcA8uMzpOW8EJ11iihOtgCSlaxnEu34ej+tsRaciAyqoY2qMxY8laNY6VGonNv5Mdpbodjf5CxJ2bC7fPHRcoMZAwbCeXViuR1l1wyNJZ75vq2g2Kd+jh2eXVJ7sxg8uSYDv6ydBk4MhDRnCUsfi5qpB1rKf5PL6j7aZEF2z/rux26jZ8N+RCNgExMyEssgzqVOVWBuRO/wauHDWb/O0HyqxHYcuyAyiuSxlW0QnmWKn9WVAxmtTHuPNP3foBVrwzyg4h5wJY6bzCH33x8DPL6CfcQXWBqerkAF1V6L1/vg1655hMMqVyJV55hY4DjONC79XHcPJH9eviy8iHOCsGGE2/tQMphZpMDndaRf/XilofLR8Ygxo2c9397sUGDExXrbj+uDr21CPxtsGZViCHoG2xE+o=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(396003)(376002)(39840400004)(451199021)(41300700001)(1076003)(6506007)(26005)(186003)(107886003)(478600001)(8676002)(6916009)(66556008)(316002)(66946007)(66476007)(4326008)(8936002)(5660300002)(6486002)(966005)(6666004)(6512007)(52116002)(2616005)(66574015)(2906002)(83380400001)(38350700002)(38100700002)(36756003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UHlv+3pf7Y7CCa6715cXhomwLJEuyHDobjK5ijrX1QnabEaM/JN/KjGzqgZ5?=
 =?us-ascii?Q?N2Grtwo8skAYNm6g+hYUuQ8m+l4kkPzpTq66ORtKP/MGPMXy1vJ9405pgwB/?=
 =?us-ascii?Q?ia8pxrhCHVqhF22bpwiNt3yJQXVbMDaAD+IojMfcJwqmcW1zkrpwAgGAlGxG?=
 =?us-ascii?Q?5Xn7Dx3yMhK412t2Biem3/NSSQghO6V7VxAuYJ2AtrUkjDDNStu71Aloeknw?=
 =?us-ascii?Q?6DrivPzqtHRNi2Woin3NX5nWOPLFJ+GJYTEiuh6JPQvW6iU0fthxfGYoHNp6?=
 =?us-ascii?Q?9udKtphfS8SHRiMuNN+rtVeQBgM+tqUu/wJY78+Ja7IfeOzKedh0HL76UyNx?=
 =?us-ascii?Q?6rZTaiczRLjtd3M4/YOcx738OhGCqL9gY6cE1mIWhOjO0NJdOfJRhhbgEVd6?=
 =?us-ascii?Q?COJ9w485sxYrzsH6mE0CzzcMfY2nE6pzLQmRHP3BqeIhYWQwUvfeTac6uPnj?=
 =?us-ascii?Q?bKCUmt3A2nqsXjL7liwzlKYrgwcnqCtIAzhusQNU6fz2iIXNh2ib5WEN1iY4?=
 =?us-ascii?Q?Xk8EmGA99lO7zoRGlRXjV4nsR4r7svkk4VtSgycQvNYFzr5mvQ26WVYhEDk8?=
 =?us-ascii?Q?UxMrxzgi88wzD+ufkgwm+PC/yDyX4JXwO7BSFgImOd/WloJYOky6pgftpTNS?=
 =?us-ascii?Q?FgsFf4cfyvb63LPl4pDbqtLmhILykSVgxmADF5EqBkWBw1dT1/igvKu1vXT5?=
 =?us-ascii?Q?+J7QfwN/zvV1X3+NK7avtI1zdmjZy7W6LqPHWb4sM9cq9H7nHhOERjNTXsLv?=
 =?us-ascii?Q?n5pZKrH0V50l98WRAc/JAIptUAgtm+6E9RV/f58S6xLBL0Kwl4RmR1q4sxMd?=
 =?us-ascii?Q?Z6lRbYzZVtYQAOksRoRyScOHZNztGbBiOwKfeLlBNillMagZnABoTReGVG9D?=
 =?us-ascii?Q?P4DAp283GuvkU5TOtY4iWRnUzTG67WP67Whnh9d2+R2qD7rBHUtFI4F1GGYQ?=
 =?us-ascii?Q?n/hWBk0PKP19uZ5VJSlUh0+YKt9hi/gttKMtA4s28ubTfmvgbH3uuVV8qYUr?=
 =?us-ascii?Q?Oa9n0hQR8hDveUlPefX7MQ5/OTzX54lAKeT0fecLD75aN/YHW+YxWnDn774K?=
 =?us-ascii?Q?l5xM9EEoDg+xsWM+KFgS2Ce4WgNLmms53N3yX592bOqgcoZkaHnt4G2jL/7s?=
 =?us-ascii?Q?LQu1/hthUrfDTfXo5j1Dp4aCgd9kODVyvWz2vxhPvRSXuSZ6romxLZDF7Ye/?=
 =?us-ascii?Q?wnnZuAMrzJYrW9d1dCKudGS53JUFBjFLU5xILLTSqXMZgEgWMpfTq+EjUFyj?=
 =?us-ascii?Q?EEECyRAtU+CpzXvg8w23OBbP487FsU2xsIDOi6q/0Cehd9Ay2z4jOpoqnlGO?=
 =?us-ascii?Q?QVAzvzvSKvWvWXdKLwnOLB9a06/UNoYD6ekl8ND6bsOcB1T+SI5t3Jd6b8Fp?=
 =?us-ascii?Q?Z1fLDz59GzzMSWmOiXR5xksUkuMH+ZOa5EE/dztTf1eabANKwi+zwcP/PMr8?=
 =?us-ascii?Q?0a4DggPKXCdfnPc5V1VpqiXA03EFIGwBifXzjxwyiaUpyF8gKaD419pVQpYp?=
 =?us-ascii?Q?mOV6MpCe20pJxht12CNu3ka13gxsWIGGjWANYMOQReabpTZShZDLbkce6ehV?=
 =?us-ascii?Q?EDr/pj148LYxJi6tz0xlVePJSafQ9yqwBt3InVI5?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bb7e7c6-df1e-4518-0eba-08db89e31304
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 12:07:37.4333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vxhyt9CnPxo+nKAq1YPrvREdmochUnPb1vTgXznSbG9ZTvgEoNtcG2dSkNlUz5UHqFpzd1ziQnlJeBiX0mcYlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9578
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 12:07:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184692

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


