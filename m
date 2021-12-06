Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EEF4C433F5
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 08:04:42 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.70])
 by mx.groups.io with SMTP id smtpd.web12.48792.1638777876910521006
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 00:04:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=E4g2iYM5;
 spf=pass (domain: weidmueller.com, ip: 40.107.14.70,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XFWibS7TFRpJtSvMnvVvH3LYzheNvXpRguCXzKVRHvgGdwZjpIpzh33dqbTk/wwPq208zeOeIO8kSHlnODbF4ORNZI0khpECaqp/i4FUqTqZxi0MI5fF/Zh8l9zupM734HvXTI8pqej7JhRqtTFW5/mf/6L5R6UZsl2eonpDcFYoY25GdBAdJql3+lX2ceH+1fET85YfmzS28bB76aDSO9LqhgIkcpWazeVfOqD+EiQmxs2RYuZ4agq3zVtZBu1v9gcZotCgnSx1bdw1mcfPiclg7Vwxz56lmc6Jwtwl4tIMV6pIBm11R4dCmghqb9I2ae15Aw5bNBzgxZ2Hrq3xPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N99ZbHTD3gEB+c1li97WFgRzBfKDxp1w7k6lSS+XVDY=;
 b=CGL/yS72o+Fx3nV7j1H3WJ5JGfEWslv8kExABzg49NY2GLv+8WQGYI7L1ZEDGODhTleqcALT54ctf1AVeFQ19wG87n+MRO7Srfsg8SaqdV+gWfOGhX1INfTfZhqWoEo/xlhtDMlFb9tY/JweSokPG280xeXwOnBHe4hhhIIqI4mI+EcsxYMK7OWbZjYKU+joiXR2KN1gEmmVgeLBCugZBqNXCfOexiQS+0Dp5l7gFiAUW75M2Q861IkqHAo13gVeYIWSX65iObINiPZ1cZkivMvLsOW3sS1jg5f9LmQ6Ey0OivEHn0dYd850E+GIlL/ZVs4CDBAwDEnIIqi0RHOlVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N99ZbHTD3gEB+c1li97WFgRzBfKDxp1w7k6lSS+XVDY=;
 b=E4g2iYM5pJpFKuE4YkEbUpQWcfQlBnokobPuiLnTaW8Y+Wh//kjHnPjhtqvSNeHy8m7BHjQOd3lkHrswRZIjofAYOsW/1fYgDJk3EAWI0Gm9QlqG7hsJ0Bui4nqdFfW8B4j7KJEmHKsZ0ou6v9VZCl4M/pacBox5Ky9pfd2QgAI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PR2PR08MB4729.eurprd08.prod.outlook.com (2603:10a6:101:17::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Mon, 6 Dec
 2021 08:04:35 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010%8]) with mapi id 15.20.4734.024; Mon, 6 Dec 2021
 08:04:34 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH 2/4] selftest/recipetool: Split tests into separate test
 classes
Date: Mon,  6 Dec 2021 09:04:03 +0100
Message-ID: <20211206080406.3249-2-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: 
 <20211206080406.3249-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20211206080406.3249-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS8PR07CA0040.eurprd07.prod.outlook.com
 (2603:10a6:20b:459::11) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (94.134.181.244) by
 AS8PR07CA0040.eurprd07.prod.outlook.com (2603:10a6:20b:459::11) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Mon, 6 Dec 2021 08:04:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89b95394-7e7b-4c71-376d-08d9b88f09b1
X-MS-TrafficTypeDiagnostic: PR2PR08MB4729:EE_
X-Microsoft-Antispam-PRVS: 
	<PR2PR08MB47295CA33B133A1FD1CAEC1ED76D9@PR2PR08MB4729.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:663;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KXX5WeMblHdqteAqD70cWTEgc4nwHM40KbB6gUk8nI9ZLtORx2OOBcFSVLfnsKD9y1Al986vfqLKfuCmrN9p1uiH88poAiz8NBrbapIt2z/yipkxSsdMI4yGqDD8nTBn2e7omi8erhANc/H0b4hRVI3EOTizynf/C5aX9Atnl6D98/PtjM/B7eJGXO7uwDwj/YHi4LCxNf9MEjccrHeHYmFErZAt+IwZ7oqXsxfEmg4r5VRdDJY++zI7y5iYEVg/dwkJcNWnm/dhXmgTXTzauTTbf7w4Xrfrkwxg0L3isTByvsxQT2yZ9VDjNp6huxDdzaDUU5+K9EJpR68wWNnOL+eP6fV1KbpnppvWAqn6O8fjpWBAG8YcmsBR5oE/PXDBd/sppXaR6FNwKhbx+88P9CcKhqfbmge7IrK++mT0+FYb/A9R6t4/wYwaBbuBnxL5abQHBsl0Ea4zVy6+kaCKNvFCkLsuIgH3Gp4Pa5zmuyMjn02wKDlWMR7TtI0qP/tYmq21afuceoaR9iZYSxVxle0Jcw1QJRPVO2oTdQ5XB3ISfMKsH82jesf2dmRRSRYFpYM4pZ5IgRlw1gNpk6vLYX27NRtSIaRTc8W5S0SXNFs/QAHAXHKAIgpBs3ecBSHdV/SxYTfl4x2XdJVV7kOzWX0oEOIZ5IxzdcuDRUTqRjwQgll1KsgYUDyiiUbapo+50BgjCpugIayBV3AdUsyHIA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(5660300002)(83380400001)(508600001)(316002)(6916009)(956004)(4326008)(66556008)(2906002)(36756003)(186003)(38350700002)(7696005)(8936002)(86362001)(107886003)(26005)(8676002)(52116002)(2616005)(66946007)(66476007)(1076003)(6666004)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?P0tS6LbwTljnOum6YT2qHb09p1YytaVJo3/I9q1B06n6c39OpIs0E6KzlzSa?=
 =?us-ascii?Q?nVDeKWgEV7dbDPUsuU8hIPt9Vk+bg1mxBpu3oRqZGudFFiIw/tRayd2cocnD?=
 =?us-ascii?Q?OmtJ8DyNIMROi/TBfKgEcuizFUi3MDjCzWhN7bbLp93LL7vJB46gYlql3AEv?=
 =?us-ascii?Q?5REtXiQHrFNMwmBHOF03z2TpFGb80WMoAlRMkPHB3MJ9vd7sFw6On7rb/pi3?=
 =?us-ascii?Q?rLkuMnNjbftBbFhsqInxyDR0OsAvn8LqwxjrkSAt8Kn3MeNv6pjguT6BzppT?=
 =?us-ascii?Q?ZE5nUQaY47IoyYX2rk4H9VA7ICMSv1uBmLvGlHODffms2UUvSezCAt8ws2Ek?=
 =?us-ascii?Q?MB/hhOJNHyPphO8tWipijZdE/EyUqcYEIBa8b64QVkQyMF6CL9/vB+9hWuqp?=
 =?us-ascii?Q?8jaEm8ctU9WKhLJraEdaqtu8uXQLCwT6d53fhEgzdrk55egjE/M33R2+0viW?=
 =?us-ascii?Q?pwaW7QGoB0sbJJ46CPVPh/iNtG77D/kzZOj9ccSF1xiP7aCJ7zSLWxthuFw/?=
 =?us-ascii?Q?EdJNx4cTRGtic0kX3+PT3H/aj09tHz/so79DfPIUGXUYHPr6FD0LXceCc3hN?=
 =?us-ascii?Q?w3M8qkwwfHhV7zdkU+GVBqxDKJxNWHOVuNIdZWwDxts31wxrexcCcC+TbTXt?=
 =?us-ascii?Q?eF1CI5yDw/hVTqd3AKBUUqYLSv57IQauKSlsgB5IG8kYdUyoyB1irslm33ES?=
 =?us-ascii?Q?rGAEkqnLSwHfg6O7LYJBgUCx64AYp9lBhbHjUTnieSJTFIAEg+e4vO6+62TZ?=
 =?us-ascii?Q?N7o1EMVJGHonur0IYH4KPU1qVhLgbvz0iXVEOo37IOtJhSxMTJ8SyoSMnxkE?=
 =?us-ascii?Q?vEdAQzs+vixguRgcsgDkh3E3Y80VhLhFSiLrUzA7KAwKRrXiDIxF2FyzJ+0L?=
 =?us-ascii?Q?hKcjxLPyM/ZoYw9msb6VxUR/Di/mY9w7uBeTkDds9xi5XCLD282iPlsQbZEa?=
 =?us-ascii?Q?LQ+CFrhAFwucXHlvzVNh8pnh6QMWjiRBySb8u6dciGVhXBs9umUXl8Nhg6vm?=
 =?us-ascii?Q?NHZ/H8fDADcivb3LRScJ0JegO/RL6c7K1bxniAcXBvQTUY/WT4tQjlnSwoaj?=
 =?us-ascii?Q?9U2Vgu+gH4m5dPcvovesKBIjUCszqvKYbrIAG3IVin9SWR5u1ZjS8OANoYf6?=
 =?us-ascii?Q?+tdD56KZg1zlX2Dl5yhuAorgwTSkBPRAvZRxexGLnvf3Ks2yHKl25AD1asYB?=
 =?us-ascii?Q?QjdWlItH/gMn2pAxIyWepx021YWwnDUgRJZaTywUw6+mVUQTHje0T84ysuio?=
 =?us-ascii?Q?DJyJ5qdpizttqSnsRdmhdeWhQ5DxEJkB9nPbHgwFC8KuxDqaMAiSnVXgHmIi?=
 =?us-ascii?Q?GNFQaqMKzSBwTPnvLRh0swpZfil05rMrOtWC1ORGN7ScOT6wJ6ntd4bTP2/0?=
 =?us-ascii?Q?F53YH+TgrycYeJFjc2I2QybLpx8RJR2ExiHgl6gGLjMPtC1Q1qMj4v79Vfp0?=
 =?us-ascii?Q?nGa7m7xJRuvCQSm2sin1Pjf6IniD5lOprYFPZtKAr0IjH66Kz0Hi77gyoWjI?=
 =?us-ascii?Q?Fnl4a5rFZaUTHhn2eoUHEmsg6XNE+vEVTEmpKapsXn3+GUyhpblg88lZOZKj?=
 =?us-ascii?Q?gArD1ykGJ73D8V1tOM5qD//7ar2A5HjppxAOZaYyFlsIy/JNNFtIZMgIYlXS?=
 =?us-ascii?Q?u9GUCOfD+5soOzW7wmLXWGU=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 89b95394-7e7b-4c71-376d-08d9b88f09b1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 08:04:34.8347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 3coSJ397eRgQ1YHlCPoVVfiLjbyRQEPKF6Bxo/ylOaJnW9uQTIR89KMKu4fy9S55N3cFbVmOn0vQ8Se7bT0E9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4729
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 08:04:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159209

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Split tests into separate test classes to speed up individual test runs
by reducing the test setup to a minimum.

The pkgdata generation is only needed for the append tests and slow down
the other tests.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 meta/lib/oeqa/selftest/cases/recipetool.py | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/sel=
ftest/cases/recipetool.py
index 8dc00ac10e..1aedc02b99 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -68,7 +68,7 @@ class RecipetoolBase(devtool.DevtoolBase):
         return bbappendfile, result.output
=20
=20
-class RecipetoolTests(RecipetoolBase):
+class RecipetoolAppendTests(RecipetoolBase):
=20
     @classmethod
     def setUpClass(cls):
@@ -76,9 +76,8 @@ class RecipetoolTests(RecipetoolBase):
         # Ensure we have the right data in shlibs/pkgdata
         cls.logger.info('Running bitbake to generate pkgdata')
         bitbake('-c packagedata base-files coreutils busybox selftest-reci=
petool-appendfile')
-        bb_vars =3D get_bb_vars(['COREBASE', 'BBPATH'])
+        bb_vars =3D get_bb_vars(['COREBASE'])
         cls.corebase =3D bb_vars['COREBASE']
-        cls.bbpath =3D bb_vars['BBPATH']
=20
     def _try_recipetool_appendfile(self, testrecipe, destfile, newfile, op=
tions, expectedlines, expectedfiles):
         cmd =3D 'recipetool appendfile %s %s %s %s' % (self.templayerdir, =
destfile, newfile, options)
@@ -332,6 +331,9 @@ class RecipetoolTests(RecipetoolBase):
         filename =3D try_appendfile_wc('-w')
         self.assertEqual(filename, recipefn.split('_')[0] + '_%.bbappend')
=20
+
+class RecipetoolCreateTests(RecipetoolBase):
+
     def test_recipetool_create(self):
         # Try adding a recipe
         tempsrc =3D os.path.join(self.tempdir, 'srctree')
@@ -518,6 +520,15 @@ class RecipetoolTests(RecipetoolBase):
         inherits =3D ['pkgconfig', 'autotools']
         self._test_recipe_contents(recipefile, checkvars, inherits)
=20
+
+class RecipetoolTests(RecipetoolBase):
+
+    @classmethod
+    def setUpClass(cls):
+        super(RecipetoolTests, cls).setUpClass()
+        bb_vars =3D get_bb_vars(['BBPATH'])
+        cls.bbpath =3D bb_vars['BBPATH']
+
     def _copy_file_with_cleanup(self, srcfile, basedstdir, *paths):
         dstdir =3D basedstdir
         self.assertTrue(os.path.exists(dstdir))
--=20
2.20.1


