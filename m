Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEF09C4321E
	for <webhook@archiver.kernel.org>; Fri,  8 Oct 2021 07:43:06 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.48])
 by mx.groups.io with SMTP id smtpd.web11.6111.1633678981107909583
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Oct 2021 00:43:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=EmN++6Rk;
 spf=pass (domain: weidmueller.com, ip: 40.107.7.48,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lJgTRZ5mFs0JUlFTKS7txN1KI+zXemj22bRA82gs7k/pbg2F80/4bBiSFOjjrMUIYcSMGADFnHpgSnFhLLiz+SLlIJnJJfFyl8r9bwznRCJhFluVDtCSQsCJNvOBw9CDO2WANUVrV0SqL/wKcYs5A9qkSx6UPOtKGNREFMvOkGx4QGUlKVkg4T3x9bbwhqbVJcBlNU1aa6fzXI/9WqzU8I4RSIhbfLFpNSDFuGPKn+xKbsAEyXiuVPeE2kQjvJ7iyT9c+K4YOAjzOltsIk79mqrKqH0Cpfzd4FLOzQoeb0GP7yzZp0Icsd9rFmWn9ObLnZA2T8yHCtq9Fj+VoU1a2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oRCh8rDu5ujKwQfdK5eYUdzez6ktY7BlamG1SwsrXV0=;
 b=BRRDY4+TLF8yNPiSFTzNlwNSbfm5slVPnuWNsyOGp9GuGdha/t/UAZ/9I662/KIr5vntQ/6L2EiKpYnmy3uNCJWLgxDBdFHPlmMlNAwEh7AYEj83ns0eaRiNFMNuPNVQWfiivLxYUOjC737rrD8bLI8/uwRFE38fmuMcAB5GdAoFSXCSeX3l9VqIVN8L8YU1lL7D51ChgeTg5CTpWlqM8wGkJmXy0nLru4RLN7dM0aJUruQMT3A+zpvmVb/A2pOlXWZ/qhFmCXHIKhhJsOCnQJS1N/lAbDxhnmPOZt8Or/ZO4baU+SQRKSu1LtAaxlXUaSYPerwpLjcjG0BAsNsqeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oRCh8rDu5ujKwQfdK5eYUdzez6ktY7BlamG1SwsrXV0=;
 b=EmN++6Rk5V31SqViJU85D8Wt/+A5XLVldqifnyqkLd67GArga+sOto+5bnKoScq8j/9u/zmrROsQdd8qMQkN6B8AlZW/3MD8OmplusxHhuveCwXiAo0rOxVToYrNe17hpjrLZFcsYHWv6FGkeBHBRYlvsDonFoqa3alWFMRmExs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PA4PR08MB6207.eurprd08.prod.outlook.com (2603:10a6:102:f2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Fri, 8 Oct
 2021 07:42:58 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0%3]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 07:42:58 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH 02/12] recipetool: Move license md5sums into CSV files
Date: Fri,  8 Oct 2021 09:42:18 +0200
Message-ID: <20211008074228.8635-2-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: 
 <20211008074228.8635-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20211008074228.8635-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM6PR08CA0023.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::35) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (94.134.181.155) by
 AM6PR08CA0023.eurprd08.prod.outlook.com (2603:10a6:20b:b2::35) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Fri, 8 Oct 2021 07:42:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86d0ca53-9383-4a21-9d98-08d98a2f3f34
X-MS-TrafficTypeDiagnostic: PA4PR08MB6207:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PA4PR08MB62074CD5A2224D66E6CF518FD7B29@PA4PR08MB6207.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	55bgkSlv2rDsCALn8aVXHazLdsyqbUCBxiFPMe60zb95HEDp/7AJGmQ5NNVqbXc7Ov8GKpN7TnAHic4s9+SSQNkZCZ1yGC2btLrqndZ9eWMZMb9iLGoVPqCL+xYSlsHoWYrixfpNbFRvWZVR2lo/wmvcaksgWbzA+p2jA7SbRtx/4xutwNATslnw3sPlw1UJ9Yj+cFXLja4k8/iDKFKEboolVsy1iQ+ug35R+SeMFEie3cR+HVPe7lVtQLUP8m9pQqAHebDjv2vdO7onnq0Y10wzPfh6VpRQIXCiKZlgytaHJy/wvB2tUQ7FKBoIlF5VDkSQQ0P0OF4ZN7xKY/Qepx6NGcwhiXu9DCjv6oEOdw5LNCM8UXgM6C4uoBlEkzx2FGvnr4KSi9vTNjstoI28w78ldhN93w5LG90L2YEE8XHRy2DcuUIgcuJQde5Li23jDlHZd3rRBDIvqAPcWiW4utMpEjdhMLiM333c4hnjkKVCDnv+arBV4p+g51TjBAnqRqmiNCSy3qMcMdN987Ji3EBLfkPjveo0UDLL4HqmFToKw+ygp3N7PB5YrDftztp50ooJpjV3WVCGRJbqQZL+PNK2HdcGUIWzdjuMeMJm8MV72YhBl6bhlUiusWyegIQXEvU1sLqVzyIwWoLG+pls9/LZpjyBZG391nktJAJBpkATOnqhBJhwcbHgpYwaVSLfGtkUnRO93X9h/SHZWA4epK+9LpIwp26yinCWyutlZRYOvFyVf11buzCLa0LMUWuZ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(8936002)(38350700002)(5660300002)(316002)(38100700002)(4326008)(186003)(1076003)(6916009)(2616005)(6666004)(956004)(107886003)(66946007)(66556008)(66476007)(2906002)(86362001)(6486002)(8676002)(52116002)(36756003)(508600001)(7696005)(83380400001)(42413004)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QEe2SVqsHQ64cLegnzZyUEOst1GRsDciYOMDFJHfPF04Mlvcp/NPLf9BLneX?=
 =?us-ascii?Q?TURWYOzK+Uz+Vt5GRsxvLnjThBzhgf5/bAExRohXEC5P/N2Mnkc4u/Odf+qC?=
 =?us-ascii?Q?JKR8hha+ZeCYBwlB1UETVv4YUxQlwbOh8F/zmVDZsWuL4uIU36t/vXOe22ev?=
 =?us-ascii?Q?Q1CLY0/vGRbUK+Hghv3AtzvqURIzfxlB8HGp+l3KHbiDLVS7iEiSwQDLYy5g?=
 =?us-ascii?Q?1B/o38MZvht9i0RfzlSJovxgXUKUD8yTJLwvyuor91yAWGjrwKYcr+QdmgUt?=
 =?us-ascii?Q?/00gmF0NFm8LGMVPvJHCOk2sEr1ANzfaEy/dwqoZGnQwk7zOWFa6qy1qP2pm?=
 =?us-ascii?Q?DJyP7HICxEVvAvAjaqJTueF6uYv/JPeMSCTGuDQ3Zrv5YulXYL1xYtssx98H?=
 =?us-ascii?Q?4aISRt+RyDMtbfZLIq7A19nGlO2lMNtiaJ11Ey4Vpqcjf56dpKmouinLubkM?=
 =?us-ascii?Q?sXTV5LhVru5BIvQzLT9xLjcItOVM8TzJxlHoV3qeLPCow4JtP/Xascox+dj7?=
 =?us-ascii?Q?PsUc6bw7TYBds/TrSqdeR5dO6HOPd8/dg2CpDhWzWb9GM4LWWoe/i2IgcUPc?=
 =?us-ascii?Q?aepkk1KaQq0Ks7maLMWBWFKdlv4PMuM5WQggYMnKrsOVivssoHCnDV6WFDlW?=
 =?us-ascii?Q?mY1Eub6Gw0Kct9w6wv7jpTw1hkkOAx6xwPXD35i0AajevmHdMNBJFuh1/O8G?=
 =?us-ascii?Q?MWZ8lNpGO7WN1kZWF1QjmU8Zp1Omsvd247IxkqjFW7sayT9sH315wswhayX6?=
 =?us-ascii?Q?ofP1W8y+tOKjIUOyL7lQRClcT4jxV8W4QeTmuBKc8Qh7yVb6fSakoglK7fnX?=
 =?us-ascii?Q?QV+fFczHpcOSpOlztKbt8KRWgHUxVyelHi2rjBFytdW3BuiALhD/uMz62lZx?=
 =?us-ascii?Q?Jho2AaANmbOk/2VFD7toE5KrJn6vQdmlPFgyy6qoFetjX6WEnwIfOoaRfHUS?=
 =?us-ascii?Q?jYdngN2xyGeNIjjl5TZdgxbpWIHiQHrokaTmpYjhIxZGK0wCU9HiXSiFjf5d?=
 =?us-ascii?Q?2sYY+mNpwkc238QqeLydzJ7g+DacU10naH+JDw5pv964LuLEVNEt6ZlhRJ47?=
 =?us-ascii?Q?bC6BbOTqnnDtvKw/Dvu2DoRn46jjIVJDrwxp5MzaDPPXkvXz9OuGi78yywhm?=
 =?us-ascii?Q?5pjAuxvQrDtqWic4qsFxv4gEFQcNgyS3urkj0DJrP2m/FXy+QTmxTvEFCOok?=
 =?us-ascii?Q?Cok/DIbAvsTPdY4tXozc8XaTrK5IDuCEkZ4Ob4FyVQpf6kpHitftHVleRCn6?=
 =?us-ascii?Q?CiZUWrhUIAA8dlyVIDuLtJpiHWobexO+Yh54q0sYERwVQ9uZ9RQaH4nMT3Vi?=
 =?us-ascii?Q?pmHSh1SIYqESqN3qeCBDefNp?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 86d0ca53-9383-4a21-9d98-08d98a2f3f34
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 07:42:57.9239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 WN3CzHmniig7j7dr50uOCDDJ8xedzNuPC7weMJkX0HrCulaKX6LX6x7lOwK5YihOOLwu9JzGZEsGayQEuZgYZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6207
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Oct 2021 07:43:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156750

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

(no changes since v1)

 scripts/lib/recipetool/create.py    | 52 +++++++++--------------------
 scripts/lib/recipetool/licenses.csv | 37 ++++++++++++++++++++
 2 files changed, 52 insertions(+), 37 deletions(-)
 create mode 100644 scripts/lib/recipetool/licenses.csv

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/crea=
te.py
index 5cd72ea0a7..e88a4253da 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -1004,6 +1004,7 @@ def handle_license_vars(srctree, lines_before, handle=
d, extravalues, d):
=20
 def get_license_md5sums(d, static_only=3DFalse):
     import bb.utils
+    import csv
     md5sums =3D {}
     if not static_only:
         # Gather md5sums of license files in common license dir
@@ -1011,46 +1012,23 @@ def get_license_md5sums(d, static_only=3DFalse):
         for fn in os.listdir(commonlicdir):
             md5value =3D bb.utils.md5_file(os.path.join(commonlicdir, fn))
             md5sums[md5value] =3D fn
+
     # The following were extracted from common values in various recipes
     # (double checking the license against the license file itself, not ju=
st
     # the LICENSE value in the recipe)
-    md5sums['94d55d512a9ba36caa9b7df079bae19f'] =3D 'GPLv2'
-    md5sums['b234ee4d69f5fce4486a80fdaf4a4263'] =3D 'GPLv2'
-    md5sums['59530bdf33659b29e73d4adb9f9f6552'] =3D 'GPLv2'
-    md5sums['0636e73ff0215e8d672dc4c32c317bb3'] =3D 'GPLv2'
-    md5sums['eb723b61539feef013de476e68b5c50a'] =3D 'GPLv2'
-    md5sums['751419260aa954499f7abaabaa882bbe'] =3D 'GPLv2'
-    md5sums['393a5ca445f6965873eca0259a17f833'] =3D 'GPLv2'
-    md5sums['12f884d2ae1ff87c09e5b7ccc2c4ca7e'] =3D 'GPLv2'
-    md5sums['8ca43cbc842c2336e835926c2166c28b'] =3D 'GPLv2'
-    md5sums['ebb5c50ab7cab4baeffba14977030c07'] =3D 'GPLv2'
-    md5sums['c93c0550bd3173f4504b2cbd8991e50b'] =3D 'GPLv2'
-    md5sums['9ac2e7cff1ddaf48b6eab6028f23ef88'] =3D 'GPLv2'
-    md5sums['4325afd396febcb659c36b49533135d4'] =3D 'GPLv2'
-    md5sums['18810669f13b87348459e611d31ab760'] =3D 'GPLv2'
-    md5sums['d7810fab7487fb0aad327b76f1be7cd7'] =3D 'GPLv2' # the Linux ke=
rnel's COPYING file
-    md5sums['bbb461211a33b134d42ed5ee802b37ff'] =3D 'LGPLv2.1'
-    md5sums['7fbc338309ac38fefcd64b04bb903e34'] =3D 'LGPLv2.1'
-    md5sums['4fbd65380cdd255951079008b364516c'] =3D 'LGPLv2.1'
-    md5sums['2d5025d4aa3495befef8f17206a5b0a1'] =3D 'LGPLv2.1'
-    md5sums['fbc093901857fcd118f065f900982c24'] =3D 'LGPLv2.1'
-    md5sums['a6f89e2100d9b6cdffcea4f398e37343'] =3D 'LGPLv2.1'
-    md5sums['d8045f3b8f929c1cb29a1e3fd737b499'] =3D 'LGPLv2.1'
-    md5sums['fad9b3332be894bab9bc501572864b29'] =3D 'LGPLv2.1'
-    md5sums['3bf50002aefd002f49e7bb854063f7e7'] =3D 'LGPLv2'
-    md5sums['9f604d8a4f8e74f4f5140845a21b6674'] =3D 'LGPLv2'
-    md5sums['5f30f0716dfdd0d91eb439ebec522ec2'] =3D 'LGPLv2'
-    md5sums['55ca817ccb7d5b5b66355690e9abc605'] =3D 'LGPLv2'
-    md5sums['252890d9eee26aab7b432e8b8a616475'] =3D 'LGPLv2'
-    md5sums['3214f080875748938ba060314b4f727d'] =3D 'LGPLv2'
-    md5sums['db979804f025cf55aabec7129cb671ed'] =3D 'LGPLv2'
-    md5sums['d32239bcb673463ab874e80d47fae504'] =3D 'GPLv3'
-    md5sums['f27defe1e96c2e1ecd4e0c9be8967949'] =3D 'GPLv3'
-    md5sums['6a6a8e020838b23406c81b19c1d46df6'] =3D 'LGPLv3'
-    md5sums['3b83ef96387f14655fc854ddc3c6bd57'] =3D 'Apache-2.0'
-    md5sums['385c55653886acac3821999a3ccd17b3'] =3D 'Artistic-1.0 | GPL-2.=
0' # some perl modules
-    md5sums['54c7042be62e169199200bc6477f04d1'] =3D 'BSD-3-Clause'
-    md5sums['bfe1f75d606912a4111c90743d6c7325'] =3D 'MPL-1.1'
+
+    # Read license md5sums from csv file
+    scripts_path =3D os.path.dirname(os.path.realpath(__file__))
+    for path in (d.getVar('BBPATH').split(':')
+                + [os.path.join(scripts_path, '..', '..')]):
+        csv_path =3D os.path.join(path, 'lib', 'recipetool', 'licenses.csv=
')
+        if os.path.isfile(csv_path):
+            with open(csv_path, newline=3D'') as csv_file:
+                fieldnames =3D ['md5sum', 'license']
+                reader =3D csv.DictReader(csv_file, delimiter=3D',', field=
names=3Dfieldnames)
+                for row in reader:
+                    md5sums[row['md5sum']] =3D row['license']
+
     return md5sums
=20
 def crunch_license(licfile):
diff --git a/scripts/lib/recipetool/licenses.csv b/scripts/lib/recipetool/l=
icenses.csv
new file mode 100644
index 0000000000..0d3fb0607b
--- /dev/null
+++ b/scripts/lib/recipetool/licenses.csv
@@ -0,0 +1,37 @@
+0636e73ff0215e8d672dc4c32c317bb3,GPLv2
+12f884d2ae1ff87c09e5b7ccc2c4ca7e,GPLv2
+18810669f13b87348459e611d31ab760,GPLv2
+252890d9eee26aab7b432e8b8a616475,LGPLv2
+2d5025d4aa3495befef8f17206a5b0a1,LGPLv2.1
+3214f080875748938ba060314b4f727d,LGPLv2
+385c55653886acac3821999a3ccd17b3,Artistic-1.0 | GPL-2.0
+393a5ca445f6965873eca0259a17f833,GPLv2
+3b83ef96387f14655fc854ddc3c6bd57,Apache-2.0
+3bf50002aefd002f49e7bb854063f7e7,LGPLv2
+4325afd396febcb659c36b49533135d4,GPLv2
+4fbd65380cdd255951079008b364516c,LGPLv2.1
+54c7042be62e169199200bc6477f04d1,BSD-3-Clause
+55ca817ccb7d5b5b66355690e9abc605,LGPLv2
+59530bdf33659b29e73d4adb9f9f6552,GPLv2
+5f30f0716dfdd0d91eb439ebec522ec2,LGPLv2
+6a6a8e020838b23406c81b19c1d46df6,LGPLv3
+751419260aa954499f7abaabaa882bbe,GPLv2
+7fbc338309ac38fefcd64b04bb903e34,LGPLv2.1
+8ca43cbc842c2336e835926c2166c28b,GPLv2
+94d55d512a9ba36caa9b7df079bae19f,GPLv2
+9ac2e7cff1ddaf48b6eab6028f23ef88,GPLv2
+9f604d8a4f8e74f4f5140845a21b6674,LGPLv2
+a6f89e2100d9b6cdffcea4f398e37343,LGPLv2.1
+b234ee4d69f5fce4486a80fdaf4a4263,GPLv2
+bbb461211a33b134d42ed5ee802b37ff,LGPLv2.1
+bfe1f75d606912a4111c90743d6c7325,MPL-1.1
+c93c0550bd3173f4504b2cbd8991e50b,GPLv2
+d32239bcb673463ab874e80d47fae504,GPLv3
+d7810fab7487fb0aad327b76f1be7cd7,GPLv2
+d8045f3b8f929c1cb29a1e3fd737b499,LGPLv2.1
+db979804f025cf55aabec7129cb671ed,LGPLv2
+eb723b61539feef013de476e68b5c50a,GPLv2
+ebb5c50ab7cab4baeffba14977030c07,GPLv2
+f27defe1e96c2e1ecd4e0c9be8967949,GPLv3
+fad9b3332be894bab9bc501572864b29,LGPLv2.1
+fbc093901857fcd118f065f900982c24,LGPLv2.1
--=20
2.20.1


