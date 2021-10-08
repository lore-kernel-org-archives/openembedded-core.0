Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D7F4C4321E
	for <webhook@archiver.kernel.org>; Fri,  8 Oct 2021 07:49:01 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.63])
 by mx.groups.io with SMTP id smtpd.web12.6087.1633679334680079990
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Oct 2021 00:49:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=R02KpkQl;
 spf=pass (domain: weidmueller.com, ip: 40.107.6.63,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gb+5YNGwqMfwR+Ql+iie/hZYMsc+0+6Wj5nLr0k2CPS2kTZVITnpoumxKY4HOtXKwZYlLSHlv+8+lOOXN4JzK/v3SblH9ncIJ94iDvIX+RK8W9cEsVlu5JRpmQEttmQk6iHgWJcZux1w2UrO9E87LMSpcjCmhLuw7LRDmV3ATOaINudve2lM2U/IwOIynFfJNflF/5SsqAo2PoaxKmQC0RRna011kX9/auGZhRO1NPMfXu7CSgfJO0bb24WAP+V1hliUoTjhvpNbnYbptyJt009r/3/IbR1eLg/xDRLeZ13lshaIew5y+Lv+zzJE50vg8M/d12SIoyBSneKqBYMjog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cNtWbXAOKG2ApLxlLjf/JVvGavfIDaQTa+ytazvEdSg=;
 b=Qvl1HGGg/uQV8nHYTOQepgprAvmNsnstpfg4sbjafqDR1K40j7hPPYEh0EENypai4w8AL3NcDVhnScRvSRKKJvqoqf1bPNaLwt6rzCkEOKyXlWxxZ8LpexLpeQJFYaLPRUoxaP1iS+Dr1lOymo4uxhuOCGK5zs2ykGx8jZsK5m8TFG92srHvKBSoU+Faa454BW1noChK1RFOz5h8iY0KjE9BPPjXV7MeRcs31Yb6vm9knh4SjSG449zwFZ0GYR3/eoBEE4FXaj/JR81wG1ePEc+Wj3CNcSkUsley2rp2Ov/z0yowGRTEMuG+iONnoreu/ocbF9JTQkCgUGGT90KOlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cNtWbXAOKG2ApLxlLjf/JVvGavfIDaQTa+ytazvEdSg=;
 b=R02KpkQlQawx0Cuz9yLIv6WEBcT5dAQhM6s8SEIU1RJeLHVSmA8pqqxzq/6KUbfxY7F34X1xuPAJSZfxXP40qNtzZwWTJSDEAKfx5c1flajjxOml+QtKF23p5gARyFJfi+gEivkZHlLHrJM0S25AcunWOKQJAKmQs8riKTcdWSo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PA4PR08MB6127.eurprd08.prod.outlook.com (2603:10a6:102:f3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Fri, 8 Oct
 2021 07:48:54 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0%3]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 07:48:54 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH v2 08/12] recipetool: npm: Do not add package.json files to
 LIC_FILES_CHKSUM
Date: Fri,  8 Oct 2021 09:48:31 +0200
Message-ID: 
 <20211008074835.10320-8-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: 
 <20211008074835.10320-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: 
 <20211008074835.10320-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::9) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (94.134.181.155) by
 FR3P281CA0051.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::9) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.4 via Frontend
 Transport; Fri, 8 Oct 2021 07:48:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd87420a-85ae-45e9-cd3e-08d98a3013f4
X-MS-TrafficTypeDiagnostic: PA4PR08MB6127:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PA4PR08MB6127906AF9D988298D522A43D7B29@PA4PR08MB6127.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ORVcRmFEmwv1hjLSnUtE0GUNIyDPjtns5dIdzcmqNzPpqir5FoNqn+P4j0vRDLZtI9M1pema2MK+ro6v/Q1EKSUqIj5XEYrolanBj6AKT6twEJpe6HiwD4CLq2WjricmfL4hzxEEm4BsS1uEqk9c3yxp2bp7W041Cf9VXg8EpAuXHsTwT6wli/DCbX4xhbTKiqETzMtPq1zbYePk/hqwazX2JrPzKxELbxf/j4lIqfU6D9QQ+Ut3Jf3osx9vrIuVe+9qs3Brmmq+RE7cJ6YuBb4vxH/DKOay0pxP3GdDPsKvRaOxWyDpFsqORGycWRki/dePGrbtyaMHK0rEtUXwtnvGeKfv6NQMNdJCO+oziBV8Zop0FI+ulcpu1S0roaFkzV9RsVEM1w/vcRyWCweMEtaOzt1TzCyJhihvsKKUiWNql0oPA5eoOxc4R2s1bXZVdbIHpex8/aaqP+USvbJ+M18kyYwbS/o0GXAHfPH/8MX9FHV+TjY/BaUOziTypVjY8zlaAQSR3ex+WCPYb1+B+x3H8PV86AlMu8gyE5vBm7hMM8FhtgKLmtlzH7pvcNbvcKJcBWgZ5hIM+F8+ZhAEjvhX8eX7XeRa5BpHzX/vR0cRXns1KIw84zc3JvZi7Pr5Q2k9S5BQN69cdb8r/S4JqXQmEbuJSi7Vlxn3Br80ABTlL3L0iUP6SjenwNgzwa6TAuoQqqyZ9GxUTHop8JFrqQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52116002)(186003)(7696005)(5660300002)(26005)(316002)(8936002)(107886003)(86362001)(8676002)(508600001)(66946007)(6486002)(4326008)(83380400001)(36756003)(66556008)(1076003)(66476007)(2616005)(2906002)(6666004)(956004)(38100700002)(38350700002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7gLiErEp5I8viOl6iccI7VQy3kY5HmpuJuYlhZLmwl14LramtNr31jKQvOfq?=
 =?us-ascii?Q?AtlcnG72mmNOXT15ld1K9TVBEFDyC/39TdwsfZDhCyEuR6WC9Lj1KUDiOW/+?=
 =?us-ascii?Q?3uHb0SwgbBARn/J6F4c8y5ZhrUV0vIkRKd1QCOUg3mYAY/RplaxBGXEf/bFL?=
 =?us-ascii?Q?LATLig8ARWRbXv5QlYocINNLteBpRnwHnqDxE5utmAMF+c1Mnoh5c48t2vsT?=
 =?us-ascii?Q?hOgaD3XrP/PCUwQa7JVIitOAKnbG2V9bAhpdQ/Y7QR+U0X7nOYTBwZYMYrSg?=
 =?us-ascii?Q?LUt39eH6QZC6E69ACsswc8ZH2rBMUK5XxwqE0VTTyz7tceoGVV0i/7U++rYo?=
 =?us-ascii?Q?KmOku7DVWshkDizMm64NvLxMOBSJT95mjf5GNDkNPDBK53Fg3emQklW4QsQw?=
 =?us-ascii?Q?Uqk8Xhp5O2hnx0Spf7zD076E28jSQKr9frArD6yi9G+ffNCq2PU+qDnTvXm3?=
 =?us-ascii?Q?FoeTyDNWH78UCJdV2TAS50vBeDODRXUAzlnlbJ545qLJGkaNiHgYm0QklxfV?=
 =?us-ascii?Q?x9TGq+lx/EtW2nFdT1dYyjv0pKcZl4Q96J0TS+ocrOTAHGluHU7ctuRqfT1V?=
 =?us-ascii?Q?E3RFDbek8ipr6sb2lG3JpXIPUvKRjreThmVm746IEqT9/5hbVVnrnjm0IKxN?=
 =?us-ascii?Q?r0l5m19QVbhhQVZBLHrU6SXOU90FBDicEFj9jPwtmiWVbh1cdu75cXdyXCr6?=
 =?us-ascii?Q?ysT22JaJ32RME3Czhk8clUuqUIAkGAaVFWTrQ0IC3kKKPVVG0i37kJrSNDrt?=
 =?us-ascii?Q?/unJQuKoKQoXyK9pPTs5WjPhM3ajKXr5lhgxRIZxv0aM3TFUFvoOzCs8xjmd?=
 =?us-ascii?Q?jW0Ll0K+74EzaGsOkDwY7pv30wVIU9gh8+8p6t798kOrASAjrXXZhNzCrq9/?=
 =?us-ascii?Q?xi4PXv7vlWcXWK6FpEUx1Oh9bpdcPEU/Ftea7MNTlmz9ZR4mvDwirBYR2I4U?=
 =?us-ascii?Q?YKOegFgbw2vXHo/kjJ2a0ai2SlhQMVjZvn6/OuX3TVMn6GaFBKXDaecaY4mD?=
 =?us-ascii?Q?jtxFABNwmFciUk+HakqxZtt/9taLefyF2OCFbHPIUly1T5cSw9Wir9lr5FoV?=
 =?us-ascii?Q?0bRiz5NGNVEJimdsbwlBbj/BgPb0rq58LYxXvlNqdZNLzFuNTbhZuvSHMMLv?=
 =?us-ascii?Q?sH8i5DpBrL8BYMJQnvA+b4QIfAJpZl64n+/1ggFv6HhxnrfWtebFc3MvrwlV?=
 =?us-ascii?Q?d+l3ACGYwbmWezV/6dRLrscwouRQhtAzy0zsBrgt/hVrk9Pk0eseV4CoggHS?=
 =?us-ascii?Q?tJI5PKTw9Pzy2bn5voK+ZLXgiGnx6ZxPkurvbL9rP9qGka20j4mOJU/K1dmB?=
 =?us-ascii?Q?Uer1q213ScWg6tOmsU8fgQL5?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bd87420a-85ae-45e9-cd3e-08d98a3013f4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 07:48:54.8196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Gj7wIe1zov4IHiEcqnqVNRmzQf+C9rlVUD5lSjWtwPrjdXMcwJLb5vvGtHPbiHgZvXTylLfrUuBCLIAbmzFfdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6127
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Oct 2021 07:49:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156768

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

The package.json files doesn't contain any licenses. The name of the
license doesn't comply the license requirements of most liceneses.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

(no changes since v1)

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


