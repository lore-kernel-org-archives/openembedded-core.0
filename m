Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E39BBC433F5
	for <webhook@archiver.kernel.org>; Fri,  8 Oct 2021 07:43:07 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.57])
 by mx.groups.io with SMTP id smtpd.web08.5884.1633678981685181195
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Oct 2021 00:43:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=1Y77riuz;
 spf=pass (domain: weidmueller.com, ip: 40.107.22.57,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WaWLL2kLbWjX+L2SL11/qSutuABIsIwFZc7QeUSPEOvu7CRZ8i8y2wHBuQKq477ijIqhbB6rUmdYbUPFcqSsy+xPskbpQc50xTeu3r8dlK0DX+MnQpZITGsN2avY+PEe27CZ+fbY7kuGKYaIBn/0gRqHgYNfRzEbF7662lNAgnlLyYKo5Pw57vJr+bmcm6Vl56qkcAhObU6fOXjEzsgnC+Kj3oNW5cAn5aMSBDIzHt0SCKpnonyzDH6i294p7Mtlo2/f/pD47lPqBs9WizphxKDrqomqt+ziivMSElKBvEnjz6AO6OItosxZ8e914kf+in677RO4AYR80vmnLjc7DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cNtWbXAOKG2ApLxlLjf/JVvGavfIDaQTa+ytazvEdSg=;
 b=atRoRydDb/S6Etd3D06M1phQaGMx9rTA0DDX1DKFC4VAu/tXeqyTYHFwGFVaYC7ctaZQeFJKtKHds3cGo1PzIf24ikn5G68ukWnqlZmP0xDZiMgoRCaI5wes4AnYj5M4A5IT7o4KhamYRMTFXDxpDwfKSzzcUCx8pvzJTRjYkxooYmw17/ddXkkPQChsUO4IcndjrpeoD5ASxF2B7AcGEyDjtXsbDJU6bWsm5gSIh3vq9v4Fit6k1IH7zj9eaJHHsI5H6W9j4QWsw3t+6ErEByZ7munWap7XS92bVkCkH5Rqrj8/VSZYofQGx/0Ag7qVWv37/gAILAfDIv+5mxjD5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cNtWbXAOKG2ApLxlLjf/JVvGavfIDaQTa+ytazvEdSg=;
 b=1Y77riuzWGsxpErcDUmav4bbGsCTGWU5XtyteFdaG89v8vQbxFxG78nUfOOq0WxZzN6YAcTQQ/3b0NdH/glyI9dtQfsZHZ0Qqt3MJb0q6GGJrX39NNsW6188ffGfTwaGFg40013W7IY6yyovUYKNkZlc6w7VwpRWmWZc4x00KZY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PR3PR08MB5772.eurprd08.prod.outlook.com (2603:10a6:102:8f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Fri, 8 Oct
 2021 07:43:00 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0%3]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 07:43:00 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH 08/12] recipetool: npm: Do not add package.json files to
 LIC_FILES_CHKSUM
Date: Fri,  8 Oct 2021 09:42:24 +0200
Message-ID: <20211008074228.8635-8-stefan.herbrechtsmeier-oss@weidmueller.com>
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
 Transport; Fri, 8 Oct 2021 07:42:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e75dff1-2b92-48cc-35aa-08d98a2f4090
X-MS-TrafficTypeDiagnostic: PR3PR08MB5772:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PR3PR08MB57723CF0BC437B287A1FE95FD7B29@PR3PR08MB5772.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oqk9Mnfzy8m17cqvtQWeAiMLaXIve8mzVh4MxrHDjla/muavrM7lMiHayl4ggiGKCZx2BdTYbJ4HuzjoVQ+nyNB+k6Coe86dg/ZqvVFQLIcFi430wGbbbxnhZA3YQHr4O2PKuGIqckkJNlQYNo7rjaGiUW4pOoPr3TwF1NlalZrRx6D7cE7yI4A+9F0Z6JyrVSbAIWUpa4hAk6ySGxaAKvwY7isvR7W8d66KJ8ecHi/lX6pW3I82SOZysyothpV69g+1jp1dm53r0EkQ6GzbsmEpDUwKlNyjy7tP6v3SI51po1Hs5CsLTC+AZR/dv5AfdXUCZT11WXl+japQcYpTN6vOfcSzQvrFuHnnz0qRLqNiahXHja5KjHhgAQHR16LbrwrIXlXzhWFpwBsfIS6boQWQhgg6KXke1dycXv2RfHeHlNkbpJmMLKIXhZrK2oihzHSGCqnJL+A+Hir2+T6SnnjtMunnXzpcv+Lyw28GpactTE82llh8giIgOzo6t3SGqpUiwhXNrPd8dsHyw1256thZ3ejeJIlEC9rDg4Jb4DLjS9e9clMQ61qRKexMuGKdu1VYmeFKaR6AAcSwYhBOnlz/xCjnpavupB/xdTFF+gMcI2nv5TaRMpWGpNqFyXcz9Wi4Tlnr4pj41l/5ijsllPmgUtTp/JZ1C+tEVfTQ/XH76nF2kT5anjajLR/OozkAhvEKONEab0Qwe6ZcuL9DRw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38350700002)(36756003)(316002)(26005)(83380400001)(6916009)(38100700002)(86362001)(4326008)(6486002)(508600001)(66946007)(2616005)(2906002)(186003)(5660300002)(1076003)(956004)(8676002)(107886003)(8936002)(6666004)(66476007)(66556008)(7696005)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/kxupTgC2Cbt+Up7yN3AU+VUQY/kzjPLKeedb/pMUM3aoWuyov+u/TItmUif?=
 =?us-ascii?Q?BUF1gBNENruAfs4wBmDkyd3x6YtH5lP+Yc3ygNX4q26kocCuTVjHY7MYnApx?=
 =?us-ascii?Q?kxYNf6CJg/hGpJUQmUfm+MYaVfJeMhlWgOSo5Q6VHf6PX+4yIg2Y7j9tljQ1?=
 =?us-ascii?Q?ZhYCRXjteVaiV7k+2ZUQn5e+VKDUCLsBsnUub2Yo3uuoOFj9Fth1hmEB+/gj?=
 =?us-ascii?Q?5xwXokgvmGu636AZw/l4FqwUk+egdb/QARYMi06x58BY0Cq0rOUTZq7r/fHG?=
 =?us-ascii?Q?aSMDQV/otTuUk3abcg8rRK7X/hF/lT0MOP/K1+uZA/IXMf520skaen4aJb07?=
 =?us-ascii?Q?SD6NtO/mzZMJuRtC+6Wf1K2/g95eKxHrwQNj7vXIsiGqsd5T/mV31VgqWgQ1?=
 =?us-ascii?Q?ZJ9PCL8SKkL61kRNF1yGWFnN/TB88DbpgyQVO0OAM27m5GDlAJNES103PSwc?=
 =?us-ascii?Q?pLjni+9VPMZ4myMcYPvNL1/VJR5NEghLDHdgR4GupwYEFa3Z4x4qIyFHIwJL?=
 =?us-ascii?Q?BSYVxp+Wq/W25WUdpM+4YPBsVUz97TD1AhUJMDnHcgpY3qge4WMimo3vJBJm?=
 =?us-ascii?Q?5zifU9BYyTKGOguVLTz7nW5cu8EzqVQOzZBhxeuFdmWyhzYW9brliTle+E7V?=
 =?us-ascii?Q?wqXGrMjPBdLvlMvi2slnFjZ5UDicugcVWOfoauLMffyzsgj2bwMRl9XG+AWq?=
 =?us-ascii?Q?xaV8OPQytW3DofrCodP4Nga7usITtLjlDhQUE1TMYd0sw68+iBij4W3PAULX?=
 =?us-ascii?Q?oGrGWVVVOsEcPc5vypG4Nss+UXQVcvWYaatUFUr8ePqUgYhFPW7CIa0FwY21?=
 =?us-ascii?Q?+XVkCLRLln85oru1NYoSEL8mh5dvPQBd7Jab/pvYqs3BJEaFohw+dIuWXLqm?=
 =?us-ascii?Q?4/SO0qQJu0bBNl8dsne494g9i2axOwrJs+Gsub3X0KY7cdPbM1TMo1Mfes0H?=
 =?us-ascii?Q?dnb4EnWqGDfFTVgjXycy65vyk2HZR/Ly8beFHpyMa3VMpVpYO8MyHJkX04S9?=
 =?us-ascii?Q?mtTfl7QYutcnIKZ3fZu43OR+ErGWWnxwArYlcaCV5kwRiWTDKu0z9DUmd6KW?=
 =?us-ascii?Q?Jp172jozc0sfK/d1OWowCQsNKAXkGsY6tdXXyrknu603o9InqneZnF6kWsRO?=
 =?us-ascii?Q?mrJOhhBPc76eWHwq8PujYFZ4041SjtEfPeUTupdqZWJHMMDcydM1FB/hkEJH?=
 =?us-ascii?Q?OobhEqGssL38gt7/76igPl9QVYQhmbGUPw5vQtoBmb52mMWgE8Vw6QQ3M3mA?=
 =?us-ascii?Q?2EFyLp9t/ep9oF9s+ynwJJTvf6WtarTrbyRT8bpUAj3Z0XN9zWz2v5ECugM/?=
 =?us-ascii?Q?Oaq7dENUldFK2eVnEqpEty8J?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9e75dff1-2b92-48cc-35aa-08d98a2f4090
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 07:43:00.1850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 vZtIQtr8XfqY2Qpk+lSvDu5iUlctMwzzz+9/U3ei/Hg2JzVw6ZPCwsSAJt0YLsVmyq0nvriOUOX6hGPDzmbUjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5772
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Oct 2021 07:43:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156751

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


