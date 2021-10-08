Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC0D8C4167D
	for <webhook@archiver.kernel.org>; Fri,  8 Oct 2021 07:43:08 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.57])
 by mx.groups.io with SMTP id smtpd.web08.5884.1633678981685181195
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Oct 2021 00:43:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=lUKOII6w;
 spf=pass (domain: weidmueller.com, ip: 40.107.22.57,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hz96u8T4JYHg2oPNAwQSaWv4NPVn6leYlCQWVWKhspHS/elWdB6p0cASTxJxnLNJuoLKh+Wg4lGaf554lqLiwT27nFrxOQbuzyZbJhDDGvIfXFQV7FKPrQ+xFbTXj2zLrgRZMQa8enM0bqG2WLaMdOAcaPGeCbozvmYZrWvVEtolKxKuZa/lb/oMEAYTm+hqVwrt2ZCAwIZcmEGDyBx8wtB8ez+e0X4Ng60ngo9eSSE+1eT8cTU+9pwrD99U3FTjm6kYI2yeN+yzAKWoCnCDyLGneAbK6fLWqH5Dx/HDmECdqtfe2f1b6e7h7fjG5zpj8sjP5VSYVZ5YqYir1XKrTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cWlBdKj5k3XBeO4ROxR9snx/0JrC5YKj+O7Sem7XJ8k=;
 b=m5kJBsMhtgp+DcDitf5XpfZPCtg+ZyM/y4juxYKMewWtA/SYjvtUj8b4P2bQfuUdgA2k8Rgams7lrQZe35Q0QcZhAeo4a6M9ozcM5qRTnq+oXtbDcYjWjydyEoUBVT5gK1ErLJdPfLEKSDbJkZTZZR2by7Z22b/4BkVRij1hXOLxZNfm8txT9E/hHFFEtfWZzGXo4tW+M3gZyAmYxZkC/qyiB4wOCrzBy5tXI3mgR/J69P995QPIn7Jjp0P5DtJgNekftAdeIL6uzCQRqtY0UDtofoS7E7JVAjrF2Hq1zJ1vlT5cFDiYW33Lum3tIz89MfhZ1nsFOIG61BZZDQbcCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cWlBdKj5k3XBeO4ROxR9snx/0JrC5YKj+O7Sem7XJ8k=;
 b=lUKOII6wiPUTHUY4A3Dp+CsAVDscgpjRF1jw0qhzGXj2v1QaTw9oCTy3GgzL6fqzKIiv7AQwqxvH2tsNMaA4+r7lktqlJlt2cJUb0WS7X5GfQBjHQxNuFriiCeE2mKey9xYZUAx/jjvaMvpsHQSMcmey5XB6N3MLL4A4931hf90=
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
Subject: [PATCH 09/12] recipetool: npm: Use README as license fallback
Date: Fri,  8 Oct 2021 09:42:25 +0200
Message-ID: <20211008074228.8635-9-stefan.herbrechtsmeier-oss@weidmueller.com>
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
 Transport; Fri, 8 Oct 2021 07:43:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31c0868c-2367-40c0-6b92-08d98a2f40c8
X-MS-TrafficTypeDiagnostic: PR3PR08MB5772:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PR3PR08MB57727CAE343796806ED230F5D7B29@PR3PR08MB5772.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+5te3xUv7OYSCSlhXh6vgIOHUeEIMacdOsiE67cDPR+CNfT0uTugVZiP8dVivN7VPoh1XpNinshxQFk3/VGvNXnLJALGCm1CsimKjJdAc4Wl2kZgsA8PTVgTTIxyY+Ak3LOS47CO5wrhaGjT6QzA93fNwsFv/s9+ZFqVK6XKUpErc7hX9wZQ2m/4+L7oL/sUi34HfPbFDduJM+LaHFcvxMe8GFLVuPX9tX31gmBXUq9AH5LR6vrQkmUi9wmMnnsB6i+cClyffd+ji7z8UqYEz+g3btRDqsUmJVAKlGEhhaevl3FFXbhFUsg2muiF0ZldOl3pPpCu3IvJXVj4OjItzdudgH7NPoZzaZBjMoDWdlrolKITZuKAGed2dMIGhRNsiETDoRvapiPMmeE/L61ZbutLT2mg0Y8rCe4YBcLJzTkDCadMwdyBWWtRwx5G5VFHOKPxeLf9vMAnqNtgEgnAuWBWqtFd0ciNYq6tWyn43hQDchXcOUpb46qtuf9lIXkVuuW9D2ErSAVg35p9eM3bTLVgPoQSHVdvMqTuy3ZDYQEsS53UPVy4rfPrW6++TgeboBh1zH3b7MbZXL6scPuS+rSry7k0ipAwoeyvf3cUZOD8wGYpVO7OMt/4plE7FOq+7tCAXpls8QyC6eq8e+qba9028YkxmOtGjf7AHT6EdE97bqcrr2GQXTRHDP6HyxuCVLlv25CrQnhGdKkClSJpsw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38350700002)(36756003)(316002)(26005)(83380400001)(6916009)(38100700002)(86362001)(4326008)(6486002)(508600001)(66946007)(2616005)(2906002)(186003)(5660300002)(1076003)(956004)(8676002)(107886003)(8936002)(6666004)(66476007)(66556008)(7696005)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?d3mAQQz7wMyS0PgzPAEvWQH2fLahfwMeqC6xWF8qLdnUibh2PN581T/hAtgT?=
 =?us-ascii?Q?xuNF1nNHUlO/cxUjZjtpjMEHdJ1ujRqTcQ7NTCzpuhXdiHDB+HEMx9Pcmhyq?=
 =?us-ascii?Q?G0UKWNengBXIUyH/ltK0nxxl4YpIAUIntPVZ3L5Q+/F0Ndp5GgpDcJq2W3YW?=
 =?us-ascii?Q?qunM1DIwjEwn9YHgSRGsddHwaWGQ8LNeoYq8W+PLSDyXXXiHa49O48h9lU8q?=
 =?us-ascii?Q?HU/UWGZnsZ/SLF1w1mCZTswYboNvCjXzuuJqPXpUcKMDIO3nHvnFNJ4T+mKy?=
 =?us-ascii?Q?9uIYZ9fyu0xHa5p7BQSYdQdIFVcwytkZ1g0r+QmiXZhDLZMkKYcwRCvbnydN?=
 =?us-ascii?Q?4ypj60x4m5AND9KosaM3wxoZ1D9BDT+FYrL+Uy3zf0Sx30XWEn8vHFMeUJBu?=
 =?us-ascii?Q?T9acNXoglD5aFGX6SO2ebksT3VSclKNqD8yEFX3MrcGnGSBX7gKlJtBXg+DK?=
 =?us-ascii?Q?vVXCZYNgAolHiZEnGMMwr7Gmxx+19m6q2reAUkr+p5h9iZRaBZJ2ek2i24C8?=
 =?us-ascii?Q?qbiqAJ2PfYB+nXZ9UaGtFn/5RNc42z35COrALwAUr7PMlfhqLoNM2Gg727e6?=
 =?us-ascii?Q?QFB8fnZQVWwPDLWq5WH6cdE9alYjtllxkJ5DLkiYSwYNx2OUq/EJ+Os0Dw06?=
 =?us-ascii?Q?SMrzbLjI348EpTJTFBIXel5uA1sIKgGbUHld7KZ297/GxQ9j5SAmIsaAkMxT?=
 =?us-ascii?Q?rGQWMnZ0SM6qOjOw+uDKTWeED4D9AUbtVCPLEA4UNwocZI7Ufpqd7p2te0hX?=
 =?us-ascii?Q?tbWcTbq1JJsnQl9HDtd0Tm0TRQcgzEysk4c4WkjvDoEi/5JF0KfY826u71rQ?=
 =?us-ascii?Q?zggPB7i+XvGZAxVbHy7y4J7bOye9g6o6yIwnMBxaGNQcDKGQm1ZqGSOvSUqj?=
 =?us-ascii?Q?HvCT24PrZavMDEUSHkme9nx5y/FuFMMSIoYBMi5yxun8uj47cTYfNQZr5lQE?=
 =?us-ascii?Q?8280lyw7pYmIsoe+zXPLlV/JlKSUBpOWz/XOgFTUxdfe9oROoM4O9kkoh932?=
 =?us-ascii?Q?TuKERQUGou4920Cv5wRl0+p8Oy273RzfuureXlyPjGr8JUhH5cRiYgsLr8gq?=
 =?us-ascii?Q?I2eg953vByy+YWX1QYBbtr6pfhf6/JYA9/kMNOU/LYl3C3ORRSiT+IegHjs1?=
 =?us-ascii?Q?PP8zJFVmI7ZQk8/vyoDUnePkMUn3n0YGJx+u9nKpFF3HJ/Tdy+4XM1Iqc7XS?=
 =?us-ascii?Q?w1umapwDm0bPAly5aIK11m46Q/C6uknA12bvgoYwYFzH6tCuh9AVzY1+7Zmq?=
 =?us-ascii?Q?NMRqLAOV8gaWWurnO/kpeV0nctrPXz4LSacHxKSmpnPI3+i1jMuGSpVgeo+7?=
 =?us-ascii?Q?adOQNXBHFYi0KYdSTmv2TzWg?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 31c0868c-2367-40c0-6b92-08d98a2f40c8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 07:43:00.5892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 xahQ1n9NI/teXTQX+rxHWw3WzVO3XJEEsWyogrjNjR6wMWPeuChoy0BcJ8wvMEggP4IfO4dUSC7rMMs7etmRmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5772
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Oct 2021 07:43:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156754

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Use the README as license fallback if a license file is missing. Use the
linenumbers parameter of get_license_md5sums function to determine the
license text inside the README.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>

---

Changes in v2:
- Rework to add licenses to package LICENSE:${PN} and LIC_FILES_CHKSUM

 scripts/lib/recipetool/create_npm.py | 52 +++++++++++++++++++++++++++-
 1 file changed, 51 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/=
create_npm.py
index c939780931..3394a89970 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -6,6 +6,7 @@
 """Recipe creation tool - npm module support plugin"""
=20
 import json
+import logging
 import os
 import re
 import sys
@@ -14,8 +15,10 @@ import bb
 from bb.fetch2.npm import NpmEnvironment
 from bb.fetch2.npmsw import foreach_dependencies
 from recipetool.create import RecipeHandler
+from recipetool.create import get_license_md5sums
 from recipetool.create import guess_license
 from recipetool.create import split_pkg_licenses
+logger =3D logging.getLogger('recipetool')
=20
 TINFOIL =3D None
=20
@@ -115,17 +118,36 @@ class NpmRecipeHandler(RecipeHandler):
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
+                    licfiles.append(os.path.relpath(readme, srctree))
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
@@ -237,7 +259,35 @@ class NpmRecipeHandler(RecipeHandler):
=20
         bb.note("Handling licences ...")
         (licfiles, packages) =3D self._handle_licenses(srctree, shrinkwrap=
_file, dev)
-        split_pkg_licenses(guess_license(srctree, d), packages, lines_afte=
r, [])
+
+        def _guess_odd_license(licfiles):
+            import bb
+
+            md5sums =3D get_license_md5sums(d, linenumbers=3DTrue)
+
+            chksums =3D []
+            licenses =3D []
+            for licfile in licfiles:
+                f =3D os.path.join(srctree, licfile)
+                md5value =3D bb.utils.md5_file(f)
+                (license, beginline, endline, md5) =3D md5sums.get(md5valu=
e,
+                    (None, "", "", ""))
+                if not license:
+                    license =3D "Unknown"
+                    logger.info("Please add the following line for '%s' to=
 a "
+                        "'lib/recipetool/licenses.csv' and replace `Unknow=
n`, "
+                        "`X`, `Y` and `MD5` with the license, begin line, =
"
+                        "end line and partial MD5 checksum:\n" \
+                        "%s,Unknown,X,Y,MD5" % (licfile, md5value))
+                chksums.append("file://%s%s%s;md5=3D%s" % (licfile,
+                    ";beginline=3D%s" % (beginline) if beginline else "",
+                    ";endline=3D%s" % (endline) if endline else "",
+                    md5 if md5 else md5value))
+                licenses.append((license, licfile, md5value))
+            return (licenses, chksums)
+
+        (licenses, extravalues["LIC_FILES_CHKSUM"]) =3D _guess_odd_license=
(licfiles)
+        split_pkg_licenses([*licenses, *guess_license(srctree, d)], packag=
es, lines_after)
=20
         classes.append("npm")
         handled.append("buildsystem")
--=20
2.20.1


