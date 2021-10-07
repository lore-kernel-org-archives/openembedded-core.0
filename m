Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3710FC4332F
	for <webhook@archiver.kernel.org>; Thu,  7 Oct 2021 10:14:01 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.78])
 by mx.groups.io with SMTP id smtpd.web08.9630.1633601632378690486
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Oct 2021 03:14:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=Ry7Gl39W;
 spf=pass (domain: weidmueller.com, ip: 40.107.8.78,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tr3xE8VL63PtMZ8kFHvBHS9R9/1UbopjCB7/6FcqDIG5roK1BceovqxDHxCMb84Wd41UfK845yq3J9Ui9b5i7Z967cDnxoFxKON4nFRcvxp+o/OPnTfwN/czKNPYnAyqgeCQNyxrifQ78VYx0ggOO/cdCsI+g5t9zW2PWUKdWVlGTfkzP3cGxLtp8QIcjVNPmNLJOG5GQ2fyOBLrIJjZjBWNG5p89lLqLeBJjdVyOLg2TMN+7hRoPvKAzl+atlBX/UD6qQjymF+M7asI7uSLJIWmMCVW6IjExfpCy4jDn10DEoApZORsrBvSluaWiewqHbbgWcnQarLhRStLpj0jLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nvSlAsNFJm+1KF81qfuuuFBbxZZpNOFBoXbBnCgdCXo=;
 b=lsN4STw5pFof3yKg42UoD4/y1/6pe7vR7xwU9qZaGavHKmty9s7QSDjgtQj5qCcBZ+9ebWTRihMOt2RscnZIdtGX0SMtL/r6NA7m+4ezmZ+vvWG0kXtGedubvIAAMHFYal8cvzRm9PvOSgzdJVWYybH2mJW+21tnPphkp3PQbhVMCjpAh+pXKxhsmarlSQLsuVsZ8Me2J9S/SYSOVYkQFRkDKYdSG2jrYs12an036+AWFurMAJLPNoEf5eWsG7xZ3WxJAawwwi8AsBridpTxwd0dhsjDxaNX6ahvtkVumWdo/XsMkoAx0UD6m9dlN/T8NeGzPzKk1QnM4/8XKGvEKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nvSlAsNFJm+1KF81qfuuuFBbxZZpNOFBoXbBnCgdCXo=;
 b=Ry7Gl39WdAbbc6xXfj0DV1rKUcaxLQ8EYHslkGX4HbJFpqOy3TR6FeoG2nnMQw9OWUNFD0/JdvDtYW0eunBY3FTLu5/IqjTNNiqzr82q3d0uWEQGFgILfpidKrYoHAc3FR2wzhR6semALV9FtX9b/gZ311DVGJFGmd6eSUnX880=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PR2PR08MB4649.eurprd08.prod.outlook.com (2603:10a6:101:1f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Thu, 7 Oct
 2021 10:13:51 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0%4]) with mapi id 15.20.4566.022; Thu, 7 Oct 2021
 10:13:51 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH 09/12] recipetool: npm: Pass README as fallback to
 guess_license if a license is missing
Date: Thu,  7 Oct 2021 12:13:23 +0200
Message-ID: 
 <20211007101326.11075-9-stefan.herbrechtsmeier-oss@weidmueller.com>
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
 Transport; Thu, 7 Oct 2021 10:13:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ca48e9c-b91d-4b17-82db-08d9897b290a
X-MS-TrafficTypeDiagnostic: PR2PR08MB4649:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PR2PR08MB46497AC5F240860291A57091D7B19@PR2PR08MB4649.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nDFie4zwZSF0BksPlCEDbDJDjV3rwowahNrLmMhErsx/p6RMtvaXE1Q2tR1ocHw+/IQ4wnbBkELNiReRVCjwOfqdEwCvpc//eEuH5XhhBvbvbXwGZkHVKM4ZH4knaNEggcoAIRBOzNO7aAi7yIkvMc0u/XjxIaI3m3Vhs6hw2x1gIgm3zN2hhtW8WzFoSaRkxIVwiooKaWsT1wjZAPvX9yQw+fANQSpZFs22jGHfwVLzKy1tHU2FLPI25NGxJckU8Xowz/noMDca3F4Z0xiW/Z22SwsWw4j1o+xEfUG35mWNmZ7nOmeMdtvpfgtZYPPqUxbviN2aKohZmeKoOlcMdNtvgbFN345QbToicPrHOlPIzOYu3nre7NAX5q21Is7kI+v8tLogS5d8LLpUZqNdKceUuMRh1JQZn6JkrPPfCDTZzvx9jPb6YdF4HNG6cLkd8qLZn0fBHWVsyMVFVBNB1X1Jg7pwCI4uooPrT8xe//1ouOn8bhzAq2c192gdKn64k976an0rI9f3Io4G5WTkGv5aPj4K57zUpFm8/MRB3rGjc9OkVdcZD61WgauF68AqWKkPaITMLNDWxs0a2HvIQiJ2Skdk9KGAOT8ni1wFl0GZ9NDjkC9jeySPBD+0FqOqQkyLHa/MjUg8ohg2gXO2hyLTANjNkIaSthIv07R9tBLDfOQHqf1HCfh3nricG54HkXJOlc0eTKbGsnk73yg9Lw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(86362001)(6916009)(8936002)(66556008)(508600001)(5660300002)(6486002)(1076003)(52116002)(6666004)(7696005)(2616005)(4326008)(956004)(66476007)(2906002)(186003)(66946007)(8676002)(83380400001)(107886003)(36756003)(38100700002)(38350700002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SrQNTWkwbjAO4d21p2sGXpjO/Fd/i5GN1B0fUy/Gw4vLFobbTpWgcbQaCnOI?=
 =?us-ascii?Q?3xpF0XZz+N2cDFURZBcP3iohAFgxTpSxA4NEbqC9cPl0fZQyYF1cdZwTpDYR?=
 =?us-ascii?Q?UYaNV6N9n9eTzkZb7ICup4GgOwZeSzKZ8TFt13k0ddpTx4kACXzVfZLF0p8H?=
 =?us-ascii?Q?KXh4fGbvFgjtAfuH+VoMTanrXNT0jGvwPh3VZqK2F5+4WxtRc1vpSh09nVCU?=
 =?us-ascii?Q?U3HaOC3uFa7Xc3NVrh7ykhQqMUCZcHYYbw7eTAmKnnMGQNWijxILO4O67NqY?=
 =?us-ascii?Q?4Q6figJKuTdawyHnL1PpD922DK7a1suHoaonKziN64huvrmU31rE2aA/7Li5?=
 =?us-ascii?Q?NIAASm1KzzWhIPGJ0jG7JY+b0P1OQVBKCQ29FMMbya1qBeyLemlkdfPqyrfD?=
 =?us-ascii?Q?+XFGavf99uq38uya68pLz04VHwR1IyVhis/qazBBWxl31viY/ugVGrgQAmFp?=
 =?us-ascii?Q?ZEqn3+FbCeqw8/MHzSzqqnceL/T/IzlzKgSEV8utUkv0BSqUNae9lv3dLgQu?=
 =?us-ascii?Q?mc5kdcbotH+6pzsSetfjgmlwwN4obNQ5T4+hRxn8QO4k876x5J3vWfkKIlBo?=
 =?us-ascii?Q?YdIWYJ2N3K3Im9XfU7c7YnNVPbkd2Dsl11Cc8Jqq26KxRLq/vor40gUQ2Gil?=
 =?us-ascii?Q?MHJfb6YfelqHcTL45foqJX3SFYzipkl2+TKSuljdVoJw+5lz6SupgBIrN9h8?=
 =?us-ascii?Q?I+aBfrkm6530YHaDCe0mfxwBDkge1SGKvvKINjOcG4F8AGR5QMgggl0rSEnT?=
 =?us-ascii?Q?cLpGURCMUftbBx3pg+YTF94+cGmYPEYYtccoiZsFf1hKU5w/hoxVi7VlA4/J?=
 =?us-ascii?Q?f2pembwzGv3btm9612M6d3erTMEEsnaZvUDpyjXdravVIu5Zha5nv0SZSGhk?=
 =?us-ascii?Q?vVDolB3qbay0jBAH4f+m3NBxk9Zx4NmVxuqj/I4khUCR4gOocJpBYdrnYZcw?=
 =?us-ascii?Q?K7LXME2FUsvfqX2KWMnCcJQEdyL6S/oxqF5nwDuKs42WzZEonuWV/4cbo9OX?=
 =?us-ascii?Q?hf3y9PXYjdRxo/IbeaBBtDFq7dCPM06kvg9LdLIOnM7DN7Hde+AMpInymEz4?=
 =?us-ascii?Q?IqiCYO3LSN3hlBv00u5tI4WhC7Vx6j7ruBeaaoYJn8E8TZV8rDj8cPtbp976?=
 =?us-ascii?Q?B1kzedTNWa2OsZl3rHGxKBSL2RMx5Cx79RRRCHwR67WaeFKGl/BHLv5dUYa6?=
 =?us-ascii?Q?uFm64Jn+M2kfJ56YRZAaRtT3Vn8zSBVzSrc8GfAcbz6KZhezz3o8tZwQCZuI?=
 =?us-ascii?Q?QpyGxwzqyNB/eLItBadvMFlX9Y1XDtAaMYHFPdCy9AJwb7oQwVibwjcJdPKf?=
 =?us-ascii?Q?oCsOQ4Ax+1U51YAXmcUZOmXk?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7ca48e9c-b91d-4b17-82db-08d9897b290a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 10:13:51.4284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 8/CgowjyWEfT+MCcW5m7cmEEytrNyKY25R6m2Ol9lqeRHTnkkc5lYoKp/wp9/NBsZrbMbF2IQqhFZ7JZeqlirA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4649
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Oct 2021 10:14:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156717

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 scripts/lib/recipetool/create_npm.py | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/=
create_npm.py
index c939780931..27db6036fc 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -115,17 +115,36 @@ class NpmRecipeHandler(RecipeHandler):
=20
     def _handle_licenses(self, srctree, shrinkwrap_file, dev):
         """Return the extra license files and the list of packages"""
+        licfiles =3D []
         packages =3D {}
=20
         # Handle the parent package
         packages["${PN}"] =3D ""
=20
+        def _licfiles_append_fallback_readme_files(destdir):
+            """Append README files as fallback to license files if a licen=
se files is missing"""
+
+            fallback =3D True
+            readmes =3D []
+            basedir =3D os.path.join(srctree, destdir)
+            for fn in os.listdir(basedir):
+                upper =3D fn.upper()
+                if upper.startswith("README"):
+                    fullpath =3D os.path.join(basedir, fn)
+                    readmes.append(fullpath)
+                if upper.startswith("COPYING") or "LICENCE" in upper or "L=
ICENSE" in upper:
+                    fallback =3D False
+            if fallback:
+                for readme in readmes:
+                    licfiles.append(readme)
+
         # Handle the dependencies
         def _handle_dependency(name, params, deptree):
             suffix =3D "-".join([self._npm_name(dep) for dep in deptree])
             destdirs =3D [os.path.join("node_modules", dep) for dep in dep=
tree]
             destdir =3D os.path.join(*destdirs)
             packages["${PN}-" + suffix] =3D destdir
+            _licfiles_append_fallback_readme_files(destdir)
=20
         with open(shrinkwrap_file, "r") as f:
             shrinkwrap =3D json.load(f)
@@ -237,7 +256,7 @@ class NpmRecipeHandler(RecipeHandler):
=20
         bb.note("Handling licences ...")
         (licfiles, packages) =3D self._handle_licenses(srctree, shrinkwrap=
_file, dev)
-        split_pkg_licenses(guess_license(srctree, d), packages, lines_afte=
r, [])
+        split_pkg_licenses(guess_license(srctree, d, licfiles), packages, =
lines_after)
=20
         classes.append("npm")
         handled.append("buildsystem")
--=20
2.20.1


