Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AEE2C433F5
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 15:09:57 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.83])
 by mx.groups.io with SMTP id smtpd.web08.8412.1639148995233017305
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 07:09:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=dUBZ4QJP;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.20.83,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cJNQRrh04phjCJSyZWa+QxfrEC4CGOnlcWS5aXEGzapY57B0YPebu/umPm6sZjkf5L8WpqhkW6RrIno3Wqit9wpkq89UMF8621i+LgHhMgWM8qA9UOhnV71RXIIeKDokCHWVGekafUg+Sol3c8K42xQmwP5MO42FYrFETh2i9cSmM2ZKtSqgAZ8vQTU5SibfWH218Q8xPPezuiN7cMpKzXKDMMeQWlQy2IsUoUGFjP3bexV+G9I3Xst7osSgFjm7TPRhppuGjJIF9Yy/zETInDfR5DRGPCGX1q8rOtDfKo3AKhmmiMVMZGx45qmxbh5jap6ZbviPOn4WPuSMjoi18A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8P+zvysvkrMM2FCQVdJ5VU2Am3l1CQTlTZm/7iWLOfI=;
 b=BSLvf75F9RJQW5lFMmlCnJ7Kgf0JBgfmWltGLhqlX4WgLhOJD0XV+Cg75ryJRuzke7R/MwsxBrIU6bTMhj9+Hn2r5jgwPnZEKIO/RabMp1vZHZFU/7LFLTrc7eskjH4mhzzZKEtSlhKBbLADo8KKBI6pWyXpT813FcsSnamOifbscJ40AzhqUppjxP07kSuPxq1owiofC38le9GN08CwftQSHt5c/Q6UIS1vnwtmAEGt78c+HwgLiWO03SDjlnED4x01Ce5AEKgP9OE8SBZl7zu6lFU/OcAjdthzAMV2yYdEQhvC29oCF3dts9AQXQtXkpgCLXlKFGqJusL0RAIh0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8P+zvysvkrMM2FCQVdJ5VU2Am3l1CQTlTZm/7iWLOfI=;
 b=dUBZ4QJPDEvtJu45ANWCrGkFJsZ7xgoUfGg46yMSIC48+PS8ZZvohRrjR/PtQpwu1Lkq4OSV7odsGDbv/g3PKvJgv0J4175P3GS1Fj+N++UOqsKPvstrZo/vbQDz1ODeXq0DQnmxtyWY9SZCVuv+9aUMXEeJodxzLZyusm5RNPQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB6452.eurprd04.prod.outlook.com
 (2603:10a6:208:16d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Fri, 10 Dec
 2021 15:09:51 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a%5]) with mapi id 15.20.4755.024; Fri, 10 Dec 2021
 15:09:51 +0000
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: openembedded-core@lists.openembedded.org
CC: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH 1/3] kmscube: fix build on OpenGL ES 3 dependencies not
 providing GLES3/gl3ext.h
Date: Fri, 10 Dec 2021 16:09:28 +0100
Message-ID: <20211210150930.326134-1-quentin.schulz@theobroma-systems.com>
X-Mailer: git-send-email 2.33.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0239.eurprd06.prod.outlook.com
 (2603:10a6:20b:45e::35) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
MIME-Version: 1.0
Received: from localhost.localdomain (92.42.140.82) by
 AS9PR06CA0239.eurprd06.prod.outlook.com (2603:10a6:20b:45e::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.25 via Frontend
 Transport; Fri, 10 Dec 2021 15:09:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36e82cfd-ab25-4a21-a3eb-08d9bbef1d42
X-MS-TrafficTypeDiagnostic: AM0PR04MB6452:EE_
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB64526F70FE2C334C8B6ADD82C2719@AM0PR04MB6452.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aHSHhbQnPYMvetlulie6vG1FVIEgu4fw4iAxvytuFvSUdC+nbgtuhdqDiRB4Jhmyzj3jfI1hhLa31j6xCeV4j9cZblERuYP3HiSwlDWNd4NmwO6gHdapVUuC3J9hm/4nMm4kyFI0APdr45a2GNZLpPMjirQQ5D/8tgYoXAnQzq1PKqYEXbJLWhaiJ2usTpY9BYMkDknuu/se3yXeP/m0+0l0X0jQ8Yp1azLFalT2hRXYfuGZNtF3ch5fYYaYo3/xCTEWSYH+5zHcP6qEvBSREB25aBvikvubKzHnuriOcPJHVQJo1muOF1F3CyO5Mmxr0A6F48IODuDbwpbpZg/7b7OIs7tPc3WdVmgMBX2dIZvmhYyh432DYB60/kgxEyVVrz4g87FkPb0IHW2fSi0XXEZlbBAwBxXKLv2U0Q7qjtVrrvNab6ARVNTy8YqSSXeuNwsvYDzRutKrojSDMCrKpP2kw0GiRudwmTNNvwD19icHujSj+hbbJjYR6sADrDa4Fzyzj7OAAKxfHZ8GN2CR3LI/ZC+WZKXS/6JN8PkmeYY+32rQR5a77CVt0msSu4rAmsLI20XDcKjVUJbQionNaX9dwL605iCM9PdqFyUJuyeu04viZYqYuO6Qqb5Ai4kpNWO/lMC3Q2ir4FaUs6XDLaUyyWHhd2JA8B15Cp8Zh3V8CqOyfmB/NK2WL6Gr+ixXSvRyldeSxJ+A1LFmsoxQW5IKg2j0fbMpceDdBS+YJy0mQveKqxXqp6H3ku8GpbW+JbU/qM2KtOHMrcb9yM6tosnMD3VGdp28UU2XoQg1CUI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(52116002)(54906003)(316002)(6916009)(186003)(4326008)(8676002)(26005)(38350700002)(966005)(508600001)(6506007)(8936002)(36756003)(956004)(6512007)(44832011)(2616005)(83380400001)(16799955002)(86362001)(6486002)(66476007)(66556008)(1076003)(5660300002)(66946007)(6666004)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?41Sss+DeSDItMq1KEZbovOXZaY2nWuxxd2EcjipDNBwzhDQIb73L/5QOxwWq?=
 =?us-ascii?Q?JTNYU6kPfcSnO37lCG/uSd4UiczqkMKgEa3kPNtS2fjlAw9+5M1PlekBoq0F?=
 =?us-ascii?Q?/E8LTbuQfEmTZhdvIYxLgLU/GL+ux5QtGrNPrTMK/FtWh6w48XsHEFe8z+CZ?=
 =?us-ascii?Q?tYV5XqD4zYjJIhhcXsEE9uba1oU2NAcO+q5auJFf2TlhxSmgy2kighkvSb6v?=
 =?us-ascii?Q?N4ckXK98eNnaWzEd+UejGtNpR7BVJqV429PN6X63fAtrdQNsm8vkL4ksQ/YF?=
 =?us-ascii?Q?2TKEV5j3EMaO2ihzee96bnvQg7+ZBYros39u6OjvLB7ZbF7zl0Wuii7wVD1F?=
 =?us-ascii?Q?+YvThiAdGVyUUTCB5wXpddkBtVWJAUrvVzvQVq5SaUQQoyf/YwA2LvUYISZD?=
 =?us-ascii?Q?6Dy3roSRfQME658WXd+R6PDlbTWRSCck+9iMZdTs4mfm7zsADyxMNo+3K4Mo?=
 =?us-ascii?Q?O61+3i3jg3noYam7KFhqUoIrhotULknRPGlfJBmHfShXWd0qLnPxBIv+D/qQ?=
 =?us-ascii?Q?ILNbY6GhR3QA6t6/ImoxqXeFuWYY2RJtD8KGzdxfFN1YTfa05Mx0UBWt2IBt?=
 =?us-ascii?Q?Wed07a4doDM1G2iJEJh2O9ZfKJO7/4sWXyqnpurwx3iqSxDpIIu+PKDgobeX?=
 =?us-ascii?Q?3gZOoJyTGTwxiylU7D44X+bx/N4cYEB3iiebFvXPddIcfoiKFeS6p5Qy5zRB?=
 =?us-ascii?Q?mhAM/YDzONAhhlybaVBmcgFHPr6P0C5p3rBFWZquPrTuqv8cef0YP2w1f7Sg?=
 =?us-ascii?Q?WHd0P7gq8pKVvDsk5Aobbnh+UEs4iFj4qjokO2oHTfCHCWT1vdvxX2jjQs+s?=
 =?us-ascii?Q?tOWLpeZgh7b4C5BmsMIUHMM8YiANqJFT9qpKONbtmHryKqc83cPZRJ1QCSGg?=
 =?us-ascii?Q?QTWnwrlp7vIOfjONuEXFAxkWOrM0CP1g7KgylvDUHRmS2LsRkejDYl23hjeA?=
 =?us-ascii?Q?Iz2g13/tzkTZk3oZJhMb5sBjKkfHvdzoNLfctVUASthxuazHvPUB589LG9/S?=
 =?us-ascii?Q?s5uJM56NMn1ouKZXj8oC5VsGo3TnmpczCjhZg5r8hj/Ae+jZY6TD5Fv2juiH?=
 =?us-ascii?Q?1tWz6tSOZS2wU8y819YhpxponBzt6JY2pbz3OUhEph09tgOGZX0WKZBBlOor?=
 =?us-ascii?Q?Gv7/D0Nb04XC9GNgTmx0GvoqYJ/h3ZlMCZJoWa97buU4TKY+eOAGP0T1U2Xg?=
 =?us-ascii?Q?5JzuDJqVuP6sAmwY5sXMr4/60u6VS56sUMvqCowFw6ISRyiDgdvGdJ466HU5?=
 =?us-ascii?Q?kJyA/1JzAi8T6B0Thmay67z96NcovUOtazYp5e/KOTNxggxMA3bgPBlpsU+t?=
 =?us-ascii?Q?fu8SznxqKRiQLsEJiJ1JZb1n27XQEDaT3/9h7F9lDkLja9BJXOraDrBjgSV/?=
 =?us-ascii?Q?Cs+pg62MZ7puna7ZT6Iqzw53sKmdvlJd/aD8BOOus6Rgh/2dF+t9oQ5Ylrkf?=
 =?us-ascii?Q?cLfNRAYuenFv4PSqNT/P9MFIaQjghkq1RsJEvpUoaK68oXGHijehQ/G2Zt90?=
 =?us-ascii?Q?NlS+s1nOtwtSGMimy8zY8hHTqxbIKuQBmoqrHXjeBeIGhE5OFY9+R2q9dzds?=
 =?us-ascii?Q?8qsK7cXr9whVTbNu2v9PsjzCu31WuXhn4vjnxWKzvMqaBFzyhg19HBroI8LU?=
 =?us-ascii?Q?OrDj9BFTqSLMQ1AwSr8shRbhNoJkrYE5yU9l8Apn68YuXIY48Fq//bm1G7Bt?=
 =?us-ascii?Q?OQPjBcTxTPRB9MX9WtDDtcHWRVE5TVPZ9pI+x4kibSXxHHKyMVjw+IYHLB3d?=
 =?us-ascii?Q?w4Kv91Lndg=3D=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 36e82cfd-ab25-4a21-a3eb-08d9bbef1d42
X-MS-Exchange-CrossTenant-AuthSource: 
 AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 15:09:51.3219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 CHgzHBBZTYhMH5hjFirj671fVPTe44y465AMKYxFoMHN2c1MtoJkYXbqPGRQzKTteqXp4ZuOZ9u3pkCpkuG7Bj3fh3aVtPVxJegjfJCo8rWcQQ0Zu9YDd8/2A0kw6vW5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6452
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 15:09:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159541

According to Khronos documentation[1], gl2ext.h can be used for OpenGL
ES 3. Some vendor implementation of OpenGL ES 3, such as
Rockchip's libmali[2], do not have a gl3ext.h but only a gl2ext.h while
being OpenGL ES 3 compliant.

This fixes the header files to be included from gl3ext.h to gl2ext.h to
be compatible with (hopefully) all OpenGL ES 3 implementations.

[1] https://www.khronos.org/registry/OpenGL/index_es.php#headers
[2] https://github.com/rockchip-linux/libmali

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 ...ator-Use-correct-GL-extension-header.patch | 33 +++++++++++++++++++
 meta/recipes-graphics/kmscube/kmscube_git.bb  |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-graphics/kmscube/0001-texturator-Use-corre=
ct-GL-extension-header.patch

diff --git a/meta/recipes-graphics/kmscube/0001-texturator-Use-correct-GL-e=
xtension-header.patch b/meta/recipes-graphics/kmscube/0001-texturator-Use-c=
orrect-GL-extension-header.patch
new file mode 100644
index 0000000000..5965782de7
--- /dev/null
+++ b/meta/recipes-graphics/kmscube/0001-texturator-Use-correct-GL-extensio=
n-header.patch
@@ -0,0 +1,33 @@
+From 2b74e0e32235f6ab2e3e42d53dea985a7ba6227f Mon Sep 17 00:00:00 2001
+From: Damian Hobson-Garcia <dhobsong@igel.co.jp>
+Date: Wed, 16 Dec 2020 11:08:25 +0900
+Subject: [PATCH] texturator: Use correct GL extension header
+
+gl2ext.h is the extenstion header for OpenGL ES 2.0 and all later
+versions according to the Khronos documentation [1].  gl3ext.h is either
+an empty stub, or may not even exist on some platforms.
+
+[1]: https://www.khronos.org/registry/OpenGL/index_es.php#headers
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/kmscube/-/=
merge_requests/26]
+Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
+---
+ texturator.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/texturator.c b/texturator.c
+index d9335d7..6d97856 100644
+--- a/texturator.c
++++ b/texturator.c
+@@ -30,7 +30,7 @@
+ #include <math.h>
+=20
+ #include <GLES3/gl3.h>
+-#include <GLES3/gl3ext.h>
++#include <GLES2/gl2ext.h>
+=20
+ #ifdef HAVE_LIBPNG
+ #include <png.h>
+--=20
+2.33.1
+
diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-gr=
aphics/kmscube/kmscube_git.bb
index f4e6cd41e7..efaa962704 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM =3D "file://kmscube.c;beginline=3D1;endl=
ine=3D23;md5=3D8b309d4ee67b7315
=20
 SRCREV =3D "9f63f359fab1b5d8e862508e4e51c9dfe339ccb0"
 SRC_URI =3D "git://gitlab.freedesktop.org/mesa/kmscube;branch=3Dmaster;pro=
tocol=3Dhttps"
+SRC_URI +=3D "file://0001-texturator-Use-correct-GL-extension-header.patch=
"
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
 S =3D "${WORKDIR}/git"
--=20
2.33.1


