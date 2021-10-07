Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 227D9C43217
	for <webhook@archiver.kernel.org>; Thu,  7 Oct 2021 10:14:00 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.78])
 by mx.groups.io with SMTP id smtpd.web08.9630.1633601632378690486
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Oct 2021 03:13:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=m2pi1GMs;
 spf=pass (domain: weidmueller.com, ip: 40.107.8.78,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sq8SJiRR54XXzIrDtcPKK5eCC2GeT5w6CcOBi+Ockc1TK4EGq99hFUvutZHyWvTUPlRrL55uCD5Xpe2H+KIpBjLukUzFCQ5UKVVBBwq0Zfh50SENcKTDfFUpNnkldeTCBapLSwyKzhBY/qbyn3zdZ9+lYefO4sqnNN0Q26bAo3A3LPUfIMSjaeXKPF7nigxzWAGfHqCV9ZWym54p8XAPCD20U48iVMjsSJNemstmdsISUxpuksVVfIQUGtaC7aLr3gRs62LIghKbuo5fGAHOp1ir0sN1DBdSa7Gzpk1TpezKdHp93WFF2CMEDf8sfs3vJGOdbl6ymK1ZEmS3hHaUbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MD2MrAT9RlfXkIka4emEP20yEWBcATNTYy0bqmcx+9E=;
 b=EhiSNlKwUKas5Ra69yUmtNrAv7hwNKX6VKTeYX67qaoJAPHvvaiyYFE/euXqU1X+jKg8tV3JUh+/pRrQAGgPboMivpx3WZHBEGDwnDfZfr3Rm2lqSq51qBxPecd4+tU1j6yjyOPFgm8TWnC8eIUZlP45Fnv3hmZNFq+Jl8LREEK7Xt2/tqalrqKYv8woDd3Lf5YNWey2LM09PQZsNUt74p1O6bk3pwty8A/IqmUxTVVOIaDvxZB1m5xPaKMmWLfD22sPmZTrP5LR4nGJf0mr9Ik2hh511JBu7Ce9OU6OCFQgz/ACC131ZWKmspSYcBMO/2xDwrfXp0DlFpeXO4dcDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MD2MrAT9RlfXkIka4emEP20yEWBcATNTYy0bqmcx+9E=;
 b=m2pi1GMsiEHe95QNr3hbNcPTeOw0mE4C7+VjwKEEExQNPQMzstYilX81R1UCZilt8nHMrbSheeM8EHU39djCAIDN/hVDs+LaL7f64XOX8QqfYqcEwy3/ZVSJ0SInsAr6e6hntlMvsZuymjJwbB+/VRjAKb8oiYinrg0WRTcgItA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PR2PR08MB4649.eurprd08.prod.outlook.com (2603:10a6:101:1f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Thu, 7 Oct
 2021 10:13:50 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0%4]) with mapi id 15.20.4566.022; Thu, 7 Oct 2021
 10:13:50 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH 08/12] recipetool: npm: Do not add package.json files to
 LIC_FILES_CHKSUM
Date: Thu,  7 Oct 2021 12:13:22 +0200
Message-ID: 
 <20211007101326.11075-8-stefan.herbrechtsmeier-oss@weidmueller.com>
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
X-MS-Office365-Filtering-Correlation-Id: 11ca5537-6752-49cb-d6cc-08d9897b28ad
X-MS-TrafficTypeDiagnostic: PR2PR08MB4649:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PR2PR08MB4649E22648F6F039876A79AED7B19@PR2PR08MB4649.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	r7qiA9UFAvQTTzWUVqMN0Cn70VRN5zjlk7YQFJHbkflpzN/VtZPtndk8itiyJhGRrdlkix2ydFvDMvBXE3VJ4auFbIz9Thv+lyf5vhs0t96NQvtNmUwMZ9g5mo7S9YZ1bVGZPzrNKaOnczfiH66luaWTZcuwwmKDBCJYRqP0OM7o2IJ9TgRr/iSO3L89FRWS5FqvAPQ7jBv3TdFbPubqe84o5zWSj26ULo+wYd1+I3gEdKxKAd1EZmKxI5fs7T0KhzxKy+yyqHsC3cVhJyOmf5EVrohIK4NNJr4wKUtBiPeSGgwBpVqXGAkNS/lPjX2lSt5pXPZRtsByFPMsOyV6kx2ritvDKOk0MyyGhdB4Zx8IzZtwOeFP9/cHJnGKD67dvR1br5NIqdThNO4VsAqgf3X8UOsLTxFEAx5eOLMQi9Unqv8GFiaGVllCwhf4ownI3DJsN6ZwzH8hiK0YF1TNhiGiOacYMf0a4FTP0iweFxqTG7jC1klj8tvG4fx9ltXVhXVHprZ4bMasVcSAkJ7qrFwrP6n7GyXWiYqWndigkyA2gZ3zX0jPSRRPRnE+FB+JSRc+IUvZv1BmySPu+3Drh/cpITN29VAoN4irh6OHgmcNrxlrBTWWyRBSYd9n+AH0hnNcMkjCA1t6MduTMcz7iniLH0TQ72782AZQnwPmiVyU5XwB6wp8B82c8rONiWDqDVOc8JtTpZAZ3W5lGFWrHQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(86362001)(6916009)(8936002)(66556008)(508600001)(5660300002)(6486002)(1076003)(52116002)(6666004)(7696005)(2616005)(4326008)(956004)(66476007)(2906002)(186003)(66946007)(8676002)(83380400001)(107886003)(36756003)(38100700002)(38350700002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QTa6o0SPBVRwPlGQR6ASZ/pxrcpzgpIo95Sgbs19yJ6vEvP4ot+ANdG32zku?=
 =?us-ascii?Q?qBNWWXk0gNk2uLDUIn3Po9weFOKpVKHzLpAgmXSrUB7Kwvaa9zvF2sBsRNHP?=
 =?us-ascii?Q?aTNE8CmMaW5FscOYnfU6lZqtE2nn5eMLG/tjgjltdplbREBvm97UsqXlAUpp?=
 =?us-ascii?Q?1iWGa5HfgiS4vygugmSNQMp8KeK6/6YDA3RHVX+NpIjPCbekGpRolDml2wPb?=
 =?us-ascii?Q?sb3HYppVIuMqxHrLsXkvm3MBIfG2gZ5WiwgOLgUablsrl1SmkPhZTCs7poDU?=
 =?us-ascii?Q?7FiEIZQadRxib5+oUC2O84WXGAfzmYVaq9sjojh9nbWYN4SnXr/+UI6mVafD?=
 =?us-ascii?Q?OkINeX2Lk0cbFVjHFAIJ8Zfuc1p0OXWiLHkutMszmAPiIxG0qJhUUFcQaHev?=
 =?us-ascii?Q?qfH+n+p3m77YRJTJ8OVJ8xfj9VSki6XjsFHFVEsxF70ZfdCsj/OnKW/VMd82?=
 =?us-ascii?Q?fN/1a9gJMsKpVD0iMMh7jhclt45CXoLWb4NYuLQFKSBfW23decMUHIOKHad5?=
 =?us-ascii?Q?jbnkTJPLx9/Z1z5meegK5EKpS5VuC7fn2/6Fz10SQiuQBUJ3/y9RT72GOdV/?=
 =?us-ascii?Q?e//bvMYRHVvyVpJOqifRtfg/OeAt84xspVY7wha0iF5bEH6zl9ff0LTbM8Ie?=
 =?us-ascii?Q?R/UIyhBZHHpIDvVNVrMjuJcQ5mglnRU1QQwqxkT1Ds6yJqdjfRoKPth2VJLR?=
 =?us-ascii?Q?5lezMQwxSjWA+jaq+x15uHF2mPyDhfBC9oXLHx1VqltXB36D4U9u0ZCr6uCT?=
 =?us-ascii?Q?2jcP1tD81pqCiOWyBhClZ1O92f8rLhFroGJZWUQ72i2Y+iwubpkiQgCSdIgD?=
 =?us-ascii?Q?kB0hcPyZtuOSuHmbv2fEnFQQOSH9WAbH5rxEldcvz81QfCzIadUbu21ZRXOl?=
 =?us-ascii?Q?Mal+IG0se4U9TGSf2kWwBnB8bLbZFydrxJ1LhEGKiDDSSBHnX+tTeHik9hbH?=
 =?us-ascii?Q?ycMTxca3tqE61isBiobtaciPH7NKC1vIIxxaK5DqeAK2ACDUMfxaYlv3z7Pp?=
 =?us-ascii?Q?MZknLlFbFElRqtzfwk7zRCS8SMlEafcE0iNAdXyiUdrbYdAjqewAomRisn0T?=
 =?us-ascii?Q?S5+9lLdIYlw3z8U6aXEbswl8hQyb+DEDtwkDlRqCYon5wR6676lCqmjRubYH?=
 =?us-ascii?Q?ebl6igLQEPxLiNFSx0QhU9SyrUhVbxaYuCKOQ/BiM2zWv3Ljx9YcTLXyYVby?=
 =?us-ascii?Q?qDuanqgp/ZWiLuE7MYME0+7SSBN9jBicTuvRzYYZn7HDZK+i4x0I2nocWx7k?=
 =?us-ascii?Q?n9oewm9dvY+IF+RGf7+/zyxHd5gHHIxrZZL1n2BkhwaGVZAqC4868m+Wcito?=
 =?us-ascii?Q?kvl8bYY9KVAmwxhKlcznMArC?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 11ca5537-6752-49cb-d6cc-08d9897b28ad
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 10:13:50.7185
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 pA+iQHcsEwwruor5M/PZkMU0eIWi4kgpmscD1Xn50IJ7wxoVQSKvivzVPdDmthqP9vRILPZ00eNwm26MIW/G1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4649
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Oct 2021 10:14:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156715

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

The package.json files doesn't contain any licenses. The name of the
license doesn't comply the license requirements of most liceneses.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 scripts/lib/recipetool/create_npm.py | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/=
create_npm.py
index 2bcae91dfa..c939780931 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -115,17 +115,9 @@ class NpmRecipeHandler(RecipeHandler):
=20
     def _handle_licenses(self, srctree, shrinkwrap_file, dev):
         """Return the extra license files and the list of packages"""
-        licfiles =3D []
         packages =3D {}
=20
-        def _licfiles_append(licfile):
-            """Append 'licfile' to the license files list"""
-            licfilepath =3D os.path.join(srctree, licfile)
-            licmd5 =3D bb.utils.md5_file(licfilepath)
-            licfiles.append("file://%s;md5=3D%s" % (licfile, licmd5))
-
         # Handle the parent package
-        _licfiles_append("package.json")
         packages["${PN}"] =3D ""
=20
         # Handle the dependencies
@@ -133,7 +125,6 @@ class NpmRecipeHandler(RecipeHandler):
             suffix =3D "-".join([self._npm_name(dep) for dep in deptree])
             destdirs =3D [os.path.join("node_modules", dep) for dep in dep=
tree]
             destdir =3D os.path.join(*destdirs)
-            _licfiles_append(os.path.join(destdir, "package.json"))
             packages["${PN}-" + suffix] =3D destdir
=20
         with open(shrinkwrap_file, "r") as f:
@@ -246,7 +237,6 @@ class NpmRecipeHandler(RecipeHandler):
=20
         bb.note("Handling licences ...")
         (licfiles, packages) =3D self._handle_licenses(srctree, shrinkwrap=
_file, dev)
-        extravalues["LIC_FILES_CHKSUM"] =3D licfiles
         split_pkg_licenses(guess_license(srctree, d), packages, lines_afte=
r, [])
=20
         classes.append("npm")
--=20
2.20.1


