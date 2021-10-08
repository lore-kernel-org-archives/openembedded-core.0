Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E093C433F5
	for <webhook@archiver.kernel.org>; Fri,  8 Oct 2021 07:48:59 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.89])
 by mx.groups.io with SMTP id smtpd.web11.6161.1633679337460503950
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Oct 2021 00:48:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=EC+yUNVI;
 spf=pass (domain: weidmueller.com, ip: 40.107.3.89,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QEjFMjrRYexCd5VY11aoMtJcp/JA/RkCeSjHfMZcBI9Dlq0oNfvezBWXjTr1+OVRe+ygXYg8M4xeaEpGGryQKoJb1X2Co06dh6k0lrRf9SAiAwWbpCV/VBT35iKJbWU+LBQpXEV+GPMPX7onplg2vv+WsAkoeFMbsjljOpk6NiDTNZibT1c+vDz4WGs2pXGukTU0MPu4WnXS/gtF+fl2Lv8hJwDtBBQhV+RZYXYknmcBjNcGaiuzaMfeTVx5mYOBXC5+/GrIeyHSyUnRPubAzNC8Uhg49WwCyuUX03mgTq/tv29hlaxjhTwHvXPxbMRu/mru4uKNvBUM/WfcSHKM8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cWlBdKj5k3XBeO4ROxR9snx/0JrC5YKj+O7Sem7XJ8k=;
 b=blxEHBEYYp+RdTzJtzAJDaj8Eh4RHiSmRy8Mmurmj78xsV0EeDsQ9RkDVhNjd/ANrqXXBVpC6/DtuFO3giloKabpucr8ZKb/VKkOZvQLmizpauVSsf+26HlPNs/lsW7JZvmtSdnum/FiD/UZR8q7vJNrPyOV/hEwT52UdloKOE9Nx3lj9kc7ZOZimM66nx+W1ZI9H3XvqfU6N+mnItwro6dbRcSGPOZDcQ6D5j4kb/G2RJwqp1TymAdKZzfg3wgYJK3UgLnBM+coYIXEIEhkxaxwjcY5UMK3ayU4fVifw6XxouWfzdPHj9ONPHM5m1gLVLTSukL48LoMw/dylS/7vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cWlBdKj5k3XBeO4ROxR9snx/0JrC5YKj+O7Sem7XJ8k=;
 b=EC+yUNVIN/ySBIaEbwsOUB+SzaVJRXHTTrNlGGwE/Gd2efH4x+H7cMXWLXLGCNnM0Z1ChxRVaktvgE4sO5SI+PQl0wFNIYyapZKrup01gHt63KeQONAWglGDpatJMD/5k5LT2bHmKLqznEDJLoEVdxV2CeuyxbnzHK40nGXMQmg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PAXPR08MB6478.eurprd08.prod.outlook.com (2603:10a6:102:159::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.21; Fri, 8 Oct
 2021 07:48:55 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0%3]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 07:48:55 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH v2 09/12] recipetool: npm: Use README as license fallback
Date: Fri,  8 Oct 2021 09:48:32 +0200
Message-ID: 
 <20211008074835.10320-9-stefan.herbrechtsmeier-oss@weidmueller.com>
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
X-MS-Office365-Filtering-Correlation-Id: c194c2c0-b704-450e-cc02-08d98a30141f
X-MS-TrafficTypeDiagnostic: PAXPR08MB6478:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PAXPR08MB6478F1DE57E95486F25CEBB1D7B29@PAXPR08MB6478.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hQoceEupTv2PAOJIB3q9T6sE5xtsqNBvx6AXNTt16pSF1oH+u21rKpjI7d3joImkOFHVnWBcFw6U3JMjfjhNQ2uUZU2LU0UXmS4NVA5A/lAZew8yzua15Okx5lqvUsoln+0/9lGEpNumdt/WqVTYWqDANoArxkcFCSlC7V4BzGtBykfPPFdyniZhU24aNkTTdTMOuoOI36m2LT8OzLGPSXJYiA8m1n1mrw2VW2uAzsDkG2mNnPXl2siXCbodGBCanNu9dJ5KaZdVfQHeln9Ux2XZ9RQKB3+h6uOqC75LRa6aXVRiRQU7wLnbRsq7xXU4papXOAH8Ubn2hqIvff6Tsjaw8vUpoYpKPZaqQLtLf5UdOAB8A7WX4+Pa0/kY6MXbp5WPnF9aB3wYe4nmq1Fum2B1TCcfw+vD+fswsXyX2dksqaADdt8jmPfy++eCiFQY3Ny/ydnc8lTI8yqGR8PdUXvW/vYjjU6+jNPxBu2ws4mPAP0gQ9ZIRrFjphoEtWIYLJRqvjHSCPkBQIpCdPwtPVE3advQBpIAawvANj9nz0ZvSFVCdx1pOxKdj7ddOmFULLgv1I4OZy3/LLuKn7ti/GZb84H8o/rHpXTfpe24nDbEmPAXqHB7L2yc+2JfijxGqHc9SvOb/LwtxczcY2d8H5w7M3GlQLgXjy4FywrH52+XOjp9AD9KR1onEGuZYttLYPektDKM2DGKBdhAu04DFA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(7696005)(4326008)(86362001)(956004)(508600001)(52116002)(2616005)(2906002)(83380400001)(26005)(107886003)(186003)(5660300002)(6916009)(6666004)(66476007)(66946007)(8676002)(1076003)(8936002)(38100700002)(38350700002)(66556008)(6486002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?y1X1Ytg6vcq4fYgExzarlandu7Ax5YDU/m25jnzErz69D2QKAclzH1Ivxj4c?=
 =?us-ascii?Q?fBTXNTeS0cQWHmoDZoeFIcP9LTxFP3J49pCPMYYHI4MPUTBO3tcCPkWY55QE?=
 =?us-ascii?Q?Lg5bt+EOLsUmAEplCND1gdsBqf2ML440B3wknJN5ECj/v4Vvlw9n158NnvtZ?=
 =?us-ascii?Q?TM3FJhlOu+eSOxbUKAPLl1AbjH5wgeYEJmrgjwdn5F0jfQB+SwcYgQ+ivTy6?=
 =?us-ascii?Q?iBaWf/Vu322BnhEPieVIBlHvEXK9qh8sTvm26gYgxOCzTSVHhGRuXQ0Y9+KQ?=
 =?us-ascii?Q?TKmm519peUF/0gEC76CONifrUsRroucH8oVzmq2/SmeSCS98V4dRJjZ/ZUiP?=
 =?us-ascii?Q?RwvonrsxXnli2nNrPMArh7QEfWxXeWgtN9jCwRzxeLgl7GD8Nzjj9bLI5mh3?=
 =?us-ascii?Q?wOdi9oAIZCRHJ4fI0lmt4byXmi4Xlx2figiYbHGus4qE4mWvjiaQijBad07n?=
 =?us-ascii?Q?Gal63mj8eqa7LlucKXV3WuAPkpRYBEtXpYMv0CA0wCUM7cXA2DAumb47wm7/?=
 =?us-ascii?Q?ODQSe0IqDi3A7nqQDVmMaArep8/uyRXT+69cTkWEMzisVF7QnGKEPftJET4J?=
 =?us-ascii?Q?pVGrqB4lMrNJ/GhRVOgeSOm/jBbFmiAaafrhkzHnY01BbbJ8zU94vcbN2Ykp?=
 =?us-ascii?Q?/v3GYcCsWY/O3DtvhKYU2MpnqOsZwciyiAC/j9pG7qpAqJnGuXCRk+XNecb2?=
 =?us-ascii?Q?45zGmiL4rTpj3HNw1JZkr4eBay/3rNETJ8Ys7SQ83clc51HO2eud6XWj8SCW?=
 =?us-ascii?Q?vOcm4Q2h0KIsY/W7hTDoWAXQLCvgdCI0pMs0OhhVCUHq/carVeNi/2tswT8M?=
 =?us-ascii?Q?Jl/9B35i+kZGgrKst0eFvLnyBa2x+MlAoJFE2HKfOpILmqUJDbihCB+VFrgc?=
 =?us-ascii?Q?PDAVC/40gyBLL9kVvt7lV5YQNBLJill0cGZbQYnujOMoLFZ+g3EDnqjZolpB?=
 =?us-ascii?Q?PIEt7Ij5fjl1y27mlJid6uxp77lLYUh2LbS2WjpqOBNRGiEXvsecTi6YqJWS?=
 =?us-ascii?Q?4KeU/H274orNY0Q+ac8fwuj6Wq4kKlE3ATDFxVflIJ5M/QDMP4kRH7645miz?=
 =?us-ascii?Q?SPP2wgg4PzR8o5xSE1M0uhcv0HvB1Efhn5YD5xikYLoaila4lrnDMgZi7BD8?=
 =?us-ascii?Q?q8dEP5Q+Oms15In92MDLM18t04Y2eD6jn8SWdRZBBBtLLi0knsMqD+EkljgE?=
 =?us-ascii?Q?2L3rNjzzD7UJISfQXgSNeOhyswHQFLtOM9in8kLdyBqB9IfWSUi8Ua1Arhwq?=
 =?us-ascii?Q?ok11jRrXpow6HmuZ1143+L7N6pvf3V0qYfClltsnIVDTWbI6xIkOCZzq2TDc?=
 =?us-ascii?Q?xCAUjyugimIqrzFsVaHh3Krk?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c194c2c0-b704-450e-cc02-08d98a30141f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 07:48:55.1392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 9+S2bjFhUbvNVPhkNvzIiHsLzHDS4GoliDMnbXbMqJFTHacpGGlMBv5mU0XIxS117CZii4mDfhhO04H5e3VGtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6478
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Oct 2021 07:48:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156761

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


