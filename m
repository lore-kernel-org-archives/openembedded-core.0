Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 210DCC4332F
	for <webhook@archiver.kernel.org>; Thu,  7 Oct 2021 10:13:58 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.73])
 by mx.groups.io with SMTP id smtpd.web11.9805.1633601634610414841
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Oct 2021 03:13:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=foaRV/0t;
 spf=pass (domain: weidmueller.com, ip: 40.107.6.73,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZhuYaS9DYSf48Z2xnkZlCGbNYTGGwZ/zwfx2P5Z2RDniKC/YtWGb81GJuVp/d77i6zZKf119bb6jFZxINiyX0FX8tVXthRTkhcnCK/CssKGhSHSPyc2kjddFr8+BJxlEXvmL/ntfcIn5sD+hi5vBU6XyWp9OpzL6geLioNxmiYPAeNk+k3G3JeaTx0j9Y3ZqoUhGIIwsCZfqBbIercpUhHXS3wnfi0/+vHcqalJwTSnbiEX3tPpKCX8Ae5/VbM0Dr0PLEJXIDlkeRQ1GmxrYWHqpL7WUVIv7Y4L0n7IMps8ENpqv+UxjnGLZ8J6hKUb2aAKJLtW1hzRYQlEzMysJ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ufMR1t3n6hp3ES4yu6WCsFfiVsh1RMThvhQWrkVSApo=;
 b=CPmF2u/WorlPhwRG/Txlkh1zi1MRWc4wBRxlQmYkkzaxhc0Uf4hn10Zpe6T/0XNCyRMhL0oSRoQOqLPkU9m0ZJW4SlrZSN9bB66UCG5HiqySPgYzW6AsXqQC8i/CSx+DlR0JfjhvYprxuYrfNW77NpdPZmQtoCrxLTgGyi9/OMRn28dChnFGu88ztIQwxhaeTUThlbl8UKbl8nFODrJzZSQ0NU0DuFt7HT7ASYPPfZK1woKROQXlu79K0cIEQnWS5j2jZQsDRwGKGTjF3NKkIvQBcca7OVWCc27X8OocMXd9Hhg/jUEcciOIyV7qZhX1I47p/OM0y9BmUnh7iVKR1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ufMR1t3n6hp3ES4yu6WCsFfiVsh1RMThvhQWrkVSApo=;
 b=foaRV/0tw5eVuwS4jMKMv20KNSJGfUBGuVMj28KMLUNDdLZl1WEo3rneQsl6sKIv1K/8GtjjSigMAOPoggoUQztoyKwaMF/gvhZXqbHCQiTlZcbwVtHRJiW3kRcJ+vapqxXw/Ton/Ajhz1sgcpBfHaeaHEmpP8+OjrmK7q/uV2I=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PAXPR08MB6367.eurprd08.prod.outlook.com (2603:10a6:102:df::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Thu, 7 Oct
 2021 10:13:48 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0%4]) with mapi id 15.20.4566.022; Thu, 7 Oct 2021
 10:13:48 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH 02/12] recipetool: Move license md5sums into CSV files
Date: Thu,  7 Oct 2021 12:13:16 +0200
Message-ID: 
 <20211007101326.11075-2-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: 
 <20211007101326.11075-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: 
 <20211007101326.11075-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0062.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::12) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (94.134.103.254) by
 AS9PR06CA0062.eurprd06.prod.outlook.com (2603:10a6:20b:464::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Thu, 7 Oct 2021 10:13:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb1eb076-e61a-4f74-d1ea-08d9897b2730
X-MS-TrafficTypeDiagnostic: PAXPR08MB6367:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PAXPR08MB636790DC2FF66B239C5F4905D7B19@PAXPR08MB6367.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sZv/re0FFhW1Re2DGfLwUh90Q7UPqV72XMQEcdIsbx8U2L4BhKu0HhdPBSvUAVnq5X9wSflNY9r24VsZP6HVt4QpIRoyUMIwKxxSWj488duuVVZ5UoYULZRrMP8pvNQC6y1Oz+Z/Z6WBSIMjW0UOJS4ueNh9P5N6HCMvdddDSj4UKJ8Ee1EkF6p+5ThIk1QkOgkNoPAsmaZWCHBpsQk2sjTc7bNWsrRuCpv8Dv1VJRzW0El8sQZzz2+sfcSuzaV3ZMgjdcaqvZU4UJx2SUyMmr97wAfVPAcu/b2Q/pAhcisIQey8HcL4E/+ziMxFCVV03NFWcM3ovWcE1L3i8IjHjdDu4vbgpQ8OrE8sVjbE4jfRXN/aTeqkxrZY6yeOe1SjVYYxQM1HeoGDRtaxi1mD8xFqiA6xyBMqMQQmwEm65EOYCPtAYTR3jYbedITz+SktY1KuGiygIDIdctYSoEVyVGnyZ2EKDa+EgLLxuZEViZozD6IbVWYoN0qDpiHWFdg4an5vhMGcv2J+gU8B3FlGT2RmTD/yTU6CJ/8E/YMa/CwuV9+4ZXDcYQxPYFu7RpCfTZ6qph0aN8PvqGeVIarp04yfEg2EY7eHZncVvRaHCNexcLe3R6Gm1G+geJVRZuIX3ay0SuvpuYWiOK0Lplhod0rw3kGCQfhV76JDlxbETNi1IYP+Aj2T8HvqFmmE0cFTTyIx+Ml9jQwMEboC6/msYSmo4DSFH/hJumYGZ2K9qoQDqmene2CrvxGaMC/1Yec6
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(186003)(508600001)(6666004)(316002)(1076003)(66476007)(107886003)(5660300002)(86362001)(6486002)(6916009)(52116002)(36756003)(8676002)(66946007)(8936002)(66556008)(2616005)(956004)(83380400001)(26005)(4326008)(38350700002)(38100700002)(7696005)(42413004)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JmyLg86RgU7vSnJwF6wmqtm7XfJr+KVkAPvTF5UEda6EG6BW7mmOAj9HkYY1?=
 =?us-ascii?Q?jLnIn+4bXTJdDh70PSIvbGMOv1mAJc/ldDMbMnBlEAUz1rYnNeBrl1J/pYq2?=
 =?us-ascii?Q?n/icwXPJ2qub9DHQBVGkmaAmR85tQJuv3rOfWCZiqrZwyK8LbQWeKQkJptmr?=
 =?us-ascii?Q?DtFGTcfQ0eNkwkA0M7kdJG2NMS/QKjXzoC491TXs1Y7VTGBOz2Au5fIdhKPC?=
 =?us-ascii?Q?9pWaJJQYDmGOX8rEY+q8ZzxJhjnouXs5Obdx3lpGSwMcBDeCg5tjlplCFjEy?=
 =?us-ascii?Q?kzKd88vtKKUoHNMS4q2YAEMbgFTU3VdT/YG/9HTSMoCeX1/ZEKn32f4SPZfh?=
 =?us-ascii?Q?8dXLjBUVlWkNReBdAY1MZrqHdhIMuhhJIxGIbPUj3IlYcfq5jQ/5WK3DsGjr?=
 =?us-ascii?Q?yj/skZuraYpc+TgbVy+ysDnGdPY+IXClIVBMHHzKM9Xc4LoXfBgOo1kUbxQJ?=
 =?us-ascii?Q?GGrFDfK2azITyRKZCCQoO7D1QXJecHwL5ZayzIZYYKSD+iBLBGVLuXnK0wi/?=
 =?us-ascii?Q?ZJMqMop9ghkwxx4TUBSYJ8kORFkzVEzVgOVIG81OF0sOYkK0DmGAAePS2NV9?=
 =?us-ascii?Q?R5rNH8akQJoGzo9A1exzQjFCAazVD7i7q1T+KM4OptQwulgFrDbUu4a/F5sf?=
 =?us-ascii?Q?smzrsarIho6AN/BP5eOFoh6xbV8Ihzhhs4Y0d8uhDBurASNHoo/Idk1D30B1?=
 =?us-ascii?Q?4fMq27t2UhXJGYOVpeum3i6wE9iFaurgQGu10H776QrXBUHcMSbPnybyfeww?=
 =?us-ascii?Q?Pi9v7dLnCEVeyEnnpt4ltIdGlPEsyw+lGYm9o+TgVTJJqg2ZOFlf3g63JNCE?=
 =?us-ascii?Q?sY5EADi/D8YfzBlXRG5Ak7zD4vAYTwVdxbS0ge8TJxJqr+SB+vxXX20rEOLV?=
 =?us-ascii?Q?wFdCqARIXb37npcneNqSOvK05lCWrJRRf/GmyIKMLJUtk1zlpsmORy16Hhjv?=
 =?us-ascii?Q?suUGoFK4EXyM59aMmnJ9fBtrZ4Ipa86bMJg0Awz1SEIX+/BcetVBCzCJ3XRI?=
 =?us-ascii?Q?4uk8qSNzDgpWD7XtNWR7P4t0Ez+TVF9iS3HS4jhv20w/Kk1zzp6wMyCq7/kE?=
 =?us-ascii?Q?Uk4v3Kp+a6vfbyp1w4GxTmEGP8q4zfl+Eiy2hYi9XHWlPjZB9I3uyvsFzM7e?=
 =?us-ascii?Q?257QTPhuLPcifOmUelwuSwbhkNTBjxqzp4OuUAjcd9T1WwmSNM6LhfUJK6SG?=
 =?us-ascii?Q?Me3fgLFR6Tvys3FRPWFX8ch+aAJetIQtcK39arj//VTC0fDJBQu8/4BZ8Stl?=
 =?us-ascii?Q?Ghthw3kAL3bmfGP0ij5iHmRUDHgeOc6M7Lu53cySCkkFr+71nyL7HM0VU/aD?=
 =?us-ascii?Q?xOHEaVhLJity0YsLq0WDAhqM?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bb1eb076-e61a-4f74-d1ea-08d9897b2730
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 10:13:48.2553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Yy9OWv9cj0SvXJUNkvOSmcChetGWSZc4gGv2Ukayn+bNrvAGpdmvs6201oRs5NfXUvG++SFvz3KzzjLcixU2BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6367
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Oct 2021 10:13:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156714

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

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


