Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F3D7C54E41
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 14:41:00 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.138])
 by mx.groups.io with SMTP id smtpd.web11.21659.1708958455668094328
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Feb 2024 06:40:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=oAbGiIco;
 spf=pass (domain: weidmueller.com, ip: 40.107.22.138, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QEix+jLT67wDvojtF8z4qyjbYCmkcpZh4e23c4Xh5Y4KTnPYTVPQfUlOt1dVoUGcmG7lXQb7wkkMdv38pUjXFKpr4DAJC26EjtK+nsse1T4TuQQCjOOKVh9erc1EdjeWQnck16zHX09sOhy7Yt3YpfzTkTnpzhpRwnZuNqblPMRGYbPYOM7xK3Zr3p9BpPurMLbQZ26mOhK2OUCZ/p+mDrogtYzE8BxDhcMz06caUBZyH4MxVXqcMibZTStkN5jvNIUbdh/sAcAH+S6Ry16xQX2GFkVg0sxTIIFDqorgpLYHSUnCAS5WFgoEnxCyPgvqeEJ4SiB5t6ssXZrkp8XuBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ni9Z40ZvhkEBS2xcNmIbKTnT4g6YBuZxtuIP+NUZYNs=;
 b=XNgGMmA6iOLWvPrRvyJ9nPTYVOilGZxs+NkM317iWI/PJP4j24hO5cDjvkMv0BgPZEB0Z3PYGQcOg+R7kSEJapnmq1ZhOXj92uHbCpwnbzcMrhxyaO3S2cQA9ac1y4zPZ41ZPBJ3UhGdvk/0X9vuPxG2N11DfkNDE2CWz+jjXX+nlWmOPPaV7X8tZfF2yUL1UwX9PLgs2b7928MphZ9MerkVgUK5MAd1y2X5xT2cLN0JSEhy1IzyEjQ/HmDnkgvYWNIwyGEwghBtFFUf3wgvyXYA2TCZv8qQu6amIoiCthtcZjheDxFiQ2cxbt0a1jYjNtjlY8jn6S4s7LFPnJQuzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ni9Z40ZvhkEBS2xcNmIbKTnT4g6YBuZxtuIP+NUZYNs=;
 b=oAbGiIco1XpI4WJxEPwY+EZlDCN6nCIgi0DZ/I6ynI9s3kBWv8RRYhHvVa5p8ztXgoiuuF5umViDLWF3jkOoF/QCsdGiGs1rZYfQ5J3Yqe0Yi5CdVxSdD/rpJee4GquVt23WdDkOZ32CfwUHwS57MxHhPxROyp1qEWathR5HMLc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by PR3PR08MB5626.eurprd08.prod.outlook.com (2603:10a6:102:81::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 14:40:52 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::d003:60c0:6918:8a5]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::d003:60c0:6918:8a5%6]) with mapi id 15.20.7316.034; Mon, 26 Feb 2024
 14:40:52 +0000
From: Lukas Funke <lukas.funke-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Vyacheslav Yurkov <uvv.mail@gmail.com>,
	Lukas Funke <lukas.funke@weidmueller.com>
Subject: [PATCH 4/4] recipetool: go: apply pylint recommendations
Date: Mon, 26 Feb 2024 15:40:40 +0100
Message-ID: <20240226144040.2007482-5-lukas.funke-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240226144040.2007482-1-lukas.funke-oss@weidmueller.com>
References: <20240226144040.2007482-1-lukas.funke-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::13) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|PR3PR08MB5626:EE_
X-MS-Office365-Filtering-Correlation-Id: 69460d8f-5993-40ec-7087-08dc36d8ecf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Z1y+sMjYP2ezNWbrNpRIWIhI7LPWwBRQvVP556yhlXUaDQfXlSmcXAFA2HMhopXAhoJu3oqjv+6UzxqtvcBL9KDEteTMG9XCNO2TrGLpy3Xa+OAdv0W3LtF2MtL7SGyfRmz7J9cClspPTxGndE/ifFiB4kuow9S9EhxWOtmQ9AU64nMrHW2Mv3777/VucluyWNT7bAADyD+y9CLV/oPADBfhLRkagp4N3+sxvycwqWaK0hVl14K5VtBW3DGUbAtj+UOKfD24GPOYrOLH/93EaXdcMGKG9IA8IXyiV41/WJ8SnC0MiEIm8U6KILz1w7GQJ9H7YOOGzCVL3wEXZuEmqfRgq33zer4zd4NsIzdFNNEO3I5rsSNRZYIaRDzABHLKB+w7zUPBuYVNstuVnbOqxV9tDXM3MmUheayfhMLpde5u1rNHdSbDgDJfIGoLPRB8HaiRF+wy4RHJ7RwagspV/Sx5LaqNFAI3dXBuzPYDcDcK/6kichqbItj8bIuOCH+MKVeZHeX9ewMblL5SrpGZhwNNOsiPyF1joewXEnORsQQJjf7uF1sBJfHr4Qghm/yAWc6gOuKn6iRKFgGppBpC1w43tzaxx2TKlDEy8S15xbXkt/oLcWvLUZWZMnIt4Jy5jsSdpZQ8PCeCZPsAWqLo3rm35EHSO6A428M99AisiiKjyRoIS8u8xDTfsi9Byf+kpW+wbxKZ5YYR64+s8K2osQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(230273577357003)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PoCKs74IlWI35Bi8U8MSY89A0SyMkFsPgQAF1vd5rLUXttofPcvwIbL/oL4V?=
 =?us-ascii?Q?uYIYNa2TdcBrrjz3GXVnGYV8CwEGiuBnRjGVUySCZS2PDKGJ+hAco/xi4p8f?=
 =?us-ascii?Q?L7sqPeYAaMW2DdIUgKfHAx5J6LyEGLgptQDek3mkevpJvbZvWb+EldT+6fQC?=
 =?us-ascii?Q?anM6QZl7JUMG8EHeIzQMnn9rDVkfnELhN4MG7k1tNGaMYD94tz0Ki+gWgQwR?=
 =?us-ascii?Q?MvAbsgJSaaFbHpQOcfKq76Q7J2HUwRXLVFJvYjdUGrXnIl2NYvUGSVvVdIj9?=
 =?us-ascii?Q?LrxHzpqhXcpZR89ANIxVew0nwAZAzKU6ZYnG6N19uD4/4WoCxWqVD66dp38h?=
 =?us-ascii?Q?+YS4MM+8EfMQiKKRv8qXnSDS44+EqDc3B3hqz9Xr8mnGeiP7NTDJIzcFIl0t?=
 =?us-ascii?Q?clQy6xKNo7hAw9uySO5pLV5LW0WLK51z07nq4dH6EXepb4NDpx2Q9Z96UNlj?=
 =?us-ascii?Q?WAVVDrCyN8gQzA8tUeu9VL/HYa7QF1xjfgRrIa5QFLdBjSmVqIt1ec1PyR+d?=
 =?us-ascii?Q?Gy+EeACJ1KBVSuQAxfAudI9nwMDxP1GJO2/WeRGdhEEgn1jkzZrqmb4Ux+N8?=
 =?us-ascii?Q?0uAls1Nk7Qt+at2V8EVS+NF+fffjflETwZG8RU3jt8lTgToisWk7FTXxtzs7?=
 =?us-ascii?Q?UoytLiVOicJoDqKRdzHbS8bHHIGJmE1HZhmUdqPZOqfnWRGtAf9Mtk98Ziq9?=
 =?us-ascii?Q?EDM2bH1flaqRfXcAa0R+UC1H6l7ulO8pCnMYSEZJpPbRgNmf1AyxbE17RgaN?=
 =?us-ascii?Q?iW+QXxtrNrlcB6ugdyyoomTHaxyuO4I7X0GRFUqesQB60xXzqHzhdcazQ/Tb?=
 =?us-ascii?Q?5+yhXd+OxO5zqvg4rYI7mx6ZfGJrT3FP2qQ4m/nQ2CJCahN1Ww7mANPxjWf5?=
 =?us-ascii?Q?Vl+GoxPJt1ePRE8PXVqmbVMfsoPg4omvlvB59Xr5CPRU85uDez/zgt8oZDPI?=
 =?us-ascii?Q?ozLIPxRlKqup3AQUJBJVMGk+egFB5/Lar8skYUiTRW9MFyIhy8hvFSaoYR3Y?=
 =?us-ascii?Q?zbVXsjIOnghWfXCvUl3Fl20U9VrcxR1hHkzyectWMPw9HmTpW0F5YJ5Kd64x?=
 =?us-ascii?Q?MmRracTd8I4zc1c1t5ubLz1qVrW8jRLNZApq2eRpu6glmQcoViQHW+YJgTtZ?=
 =?us-ascii?Q?eX2h1bn/NhiHEeYJTX1euxgvBZ9F+ukUbkaREc1y8X/PUp5bQiObY59xk+EX?=
 =?us-ascii?Q?t36Mi3O6Vb+5kpfmB0GJK68zr0y/JuVjkkjzs5mfueB5sxYAe8PfpabIwGaw?=
 =?us-ascii?Q?3JbO/TKtskG/ehBumdKM0rxcHMZ5uFmhGNHF7/HCwmMvLkUEGl9GslHqzZLT?=
 =?us-ascii?Q?1OC761Ec1m9LynK49TWonPx0Q/mVCYUiPwRemhASipydYchWJfnYVJMwCUTe?=
 =?us-ascii?Q?5XXaTV3L8MwQ1kpy2vOx/x2u/giEqx3Z863byocioDhFkTfU3Ubyo6DEKFFq?=
 =?us-ascii?Q?2h3riuo+bf7pK9G1ckoJgNtXFYQpLEzYcsRtYDlXhDiInQiEWpXSjRgdzzHl?=
 =?us-ascii?Q?8t2NKKHz1eMs9o0Gi76cvLD86toE3QDrmFsE/7HQCq71dfD2CKj6AxI/D0PB?=
 =?us-ascii?Q?2obsxbfMV3zxxMyUm/8rxID1zwD4G+FilYtWAbOa/84F37RWY/7G3KTKBT04?=
 =?us-ascii?Q?1g=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69460d8f-5993-40ec-7087-08dc36d8ecf5
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 14:40:49.7036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3h6aeAYZsjD1ziGjYCr7IEOI9bpQL4H/L54xj21OEZiodcZfYT2KUm+ppVxI9m8Copt9VGS7+6Gto7eZdfPQ/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5626
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 14:41:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196211

From: Lukas Funke <lukas.funke@weidmueller.com>

Apply pylint recommendations where reasanable. Not all
recommendations were applied:
 - long regex expressions were not split for a better readability
 - not all (short) variables were renamed in order to be consistent
   with the rest of the framework (e.g. 'd')

Signed-off-by: Lukas Funke <lukas.funke@weidmueller.com>
---
 scripts/lib/recipetool/create_go.py | 357 ++++++++++++++++------------
 1 file changed, 205 insertions(+), 152 deletions(-)

diff --git a/scripts/lib/recipetool/create_go.py b/scripts/lib/recipetool/c=
reate_go.py
index cae7175a33..41161b27f5 100644
--- a/scripts/lib/recipetool/create_go.py
+++ b/scripts/lib/recipetool/create_go.py
@@ -9,16 +9,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
=20
-
-from collections import namedtuple
-from enum import Enum
-from html.parser import HTMLParser
-from recipetool.create import RecipeHandler, handle_license_vars
-from recipetool.create import guess_license, tidy_licenses, fixup_license
-from recipetool.create import determine_from_url
-from urllib.error import URLError
-
-import bb.utils
 import json
 import logging
 import os
@@ -30,6 +20,17 @@ import tempfile
 import urllib.parse
 import urllib.request
=20
+from collections import namedtuple
+from enum import Enum
+from html.parser import HTMLParser
+from urllib.error import URLError
+
+import bb.utils
+
+from recipetool.create import RecipeHandler, handle_license_vars
+from recipetool.create import guess_license, tidy_licenses, fixup_license
+from recipetool.create import determine_from_url
+
=20
 GoImport =3D namedtuple('GoImport', 'root vcs url suffix')
 logger =3D logging.getLogger('recipetool')
@@ -78,12 +79,14 @@ class GoRecipeHandler(RecipeHandler):
=20
             if not os.path.exists(gopath):
                 logger.error(
-                    '%s required to process specified source, but %s did n=
ot seem to populate it' % 'go', recipe)
+                    '%s required to process specified source, '
+                    'but %s did not seem to populate it', 'go', recipe)
                 return None
=20
         return bindir
=20
-    def __resolve_repository_static(self, modulepath):
+    @staticmethod
+    def __resolve_repository_static(modulepath):
         """Resolve the repository in a static manner
=20
             The method is based on the go implementation of
@@ -110,83 +113,84 @@ class GoRecipeHandler(RecipeHandler):
             # contains the subdir and major path. Thus,
             # we ignore this error for now
             logger.debug(
-                1, "Failed to fetch page from [%s]: %s" % (url, str(url_er=
r)))
+                "Failed to fetch page from [%s]: %s", url, str(url_err))
=20
         host, _, _ =3D modulepath.partition('/')
=20
-        class vcs(Enum):
-            pathprefix =3D "pathprefix"
-            regexp =3D "regexp"
-            type =3D "type"
-            repo =3D "repo"
-            check =3D "check"
-            schemelessRepo =3D "schemelessRepo"
+        class Vcs(Enum):
+            """Version control system enum"""
+            PATHPREFIX =3D "pathprefix"
+            REGEXP =3D "regexp"
+            TYPE =3D "type"
+            REPO =3D "repo"
+            CHECK =3D "check"
+            SCHEMELESS_REPO =3D "schemelessRepo"
=20
         # GitHub
         vcsGitHub =3D {}
-        vcsGitHub[vcs.pathprefix] =3D "github.com"
-        vcsGitHub[vcs.regexp] =3D re.compile(
+        vcsGitHub[Vcs.PATHPREFIX] =3D "github.com"
+        vcsGitHub[Vcs.REGEXP] =3D re.compile(
             r'^(?P<root>github\.com/[A-Za-z0-9_.\-]+/[A-Za-z0-9_.\-]+)(/(?=
P<suffix>[A-Za-z0-9_.\-]+))*$')
-        vcsGitHub[vcs.type] =3D "git"
-        vcsGitHub[vcs.repo] =3D "https://\\g<root>"
+        vcsGitHub[Vcs.TYPE] =3D "git"
+        vcsGitHub[Vcs.REPO] =3D "https://\\g<root>"
=20
         # Bitbucket
         vcsBitbucket =3D {}
-        vcsBitbucket[vcs.pathprefix] =3D "bitbucket.org"
-        vcsBitbucket[vcs.regexp] =3D re.compile(
+        vcsBitbucket[Vcs.PATHPREFIX] =3D "bitbucket.org"
+        vcsBitbucket[Vcs.REGEXP] =3D re.compile(
             r'^(?P<root>bitbucket\.org/(?P<bitname>[A-Za-z0-9_.\-]+/[A-Za-=
z0-9_.\-]+))(/(?P<suffix>[A-Za-z0-9_.\-]+))*$')
-        vcsBitbucket[vcs.type] =3D "git"
-        vcsBitbucket[vcs.repo] =3D "https://\\g<root>"
+        vcsBitbucket[Vcs.TYPE] =3D "git"
+        vcsBitbucket[Vcs.REPO] =3D "https://\\g<root>"
=20
         # IBM DevOps Services (JazzHub)
         vcsIBMDevOps =3D {}
-        vcsIBMDevOps[vcs.pathprefix] =3D "hub.jazz.net/git"
-        vcsIBMDevOps[vcs.regexp] =3D re.compile(
+        vcsIBMDevOps[Vcs.PATHPREFIX] =3D "hub.jazz.net/git"
+        vcsIBMDevOps[Vcs.REGEXP] =3D re.compile(
             r'^(?P<root>hub\.jazz\.net/git/[a-z0-9]+/[A-Za-z0-9_.\-]+)(/(?=
P<suffix>[A-Za-z0-9_.\-]+))*$')
-        vcsIBMDevOps[vcs.type] =3D "git"
-        vcsIBMDevOps[vcs.repo] =3D "https://\\g<root>"
+        vcsIBMDevOps[Vcs.TYPE] =3D "git"
+        vcsIBMDevOps[Vcs.REPO] =3D "https://\\g<root>"
=20
         # Git at Apache
         vcsApacheGit =3D {}
-        vcsApacheGit[vcs.pathprefix] =3D "git.apache.org"
-        vcsApacheGit[vcs.regexp] =3D re.compile(
+        vcsApacheGit[Vcs.PATHPREFIX] =3D "git.apache.org"
+        vcsApacheGit[Vcs.REGEXP] =3D re.compile(
             r'^(?P<root>git\.apache\.org/[a-z0-9_.\-]+\.git)(/(?P<suffix>[=
A-Za-z0-9_.\-]+))*$')
-        vcsApacheGit[vcs.type] =3D "git"
-        vcsApacheGit[vcs.repo] =3D "https://\\g<root>"
+        vcsApacheGit[Vcs.TYPE] =3D "git"
+        vcsApacheGit[Vcs.REPO] =3D "https://\\g<root>"
=20
         # Git at OpenStack
         vcsOpenStackGit =3D {}
-        vcsOpenStackGit[vcs.pathprefix] =3D "git.openstack.org"
-        vcsOpenStackGit[vcs.regexp] =3D re.compile(
+        vcsOpenStackGit[Vcs.PATHPREFIX] =3D "git.openstack.org"
+        vcsOpenStackGit[Vcs.REGEXP] =3D re.compile(
             r'^(?P<root>git\.openstack\.org/[A-Za-z0-9_.\-]+/[A-Za-z0-9_.\=
-]+)(\.git)?(/(?P<suffix>[A-Za-z0-9_.\-]+))*$')
-        vcsOpenStackGit[vcs.type] =3D "git"
-        vcsOpenStackGit[vcs.repo] =3D "https://\\g<root>"
+        vcsOpenStackGit[Vcs.TYPE] =3D "git"
+        vcsOpenStackGit[Vcs.REPO] =3D "https://\\g<root>"
=20
         # chiselapp.com for fossil
         vcsChiselapp =3D {}
-        vcsChiselapp[vcs.pathprefix] =3D "chiselapp.com"
-        vcsChiselapp[vcs.regexp] =3D re.compile(
+        vcsChiselapp[Vcs.PATHPREFIX] =3D "chiselapp.com"
+        vcsChiselapp[Vcs.REGEXP] =3D re.compile(
             r'^(?P<root>chiselapp\.com/user/[A-Za-z0-9]+/repository/[A-Za-=
z0-9_.\-]+)$')
-        vcsChiselapp[vcs.type] =3D "fossil"
-        vcsChiselapp[vcs.repo] =3D "https://\\g<root>"
+        vcsChiselapp[Vcs.TYPE] =3D "fossil"
+        vcsChiselapp[Vcs.REPO] =3D "https://\\g<root>"
=20
         # General syntax for any server.
         # Must be last.
         vcsGeneralServer =3D {}
-        vcsGeneralServer[vcs.regexp] =3D re.compile(
+        vcsGeneralServer[Vcs.REGEXP] =3D re.compile(
             "(?P<root>(?P<repo>([a-z0-9.\\-]+\\.)+[a-z0-9.\\-]+(:[0-9]+)?(=
/~?[A-Za-z0-9_.\\-]+)+?)\\.(?P<vcs>bzr|fossil|git|hg|svn))(/~?(?P<suffix>[A=
-Za-z0-9_.\\-]+))*$")
-        vcsGeneralServer[vcs.schemelessRepo] =3D True
+        vcsGeneralServer[Vcs.SCHEMELESS_REPO] =3D True
=20
         vcsPaths =3D [vcsGitHub, vcsBitbucket, vcsIBMDevOps,
                     vcsApacheGit, vcsOpenStackGit, vcsChiselapp,
                     vcsGeneralServer]
=20
         if modulepath.startswith("example.net") or modulepath =3D=3D "rsc.=
io":
-            logger.warning("Suspicious module path %s" % modulepath)
+            logger.warning("Suspicious module path %s", modulepath)
             return None
         if modulepath.startswith("http:") or modulepath.startswith("https:=
"):
-            logger.warning("Import path should not start with %s %s" %
-                           ("http", "https"))
+            logger.warning("Import path should not start with %s %s",
+                           "http", "https")
             return None
=20
         rootpath =3D None
@@ -195,24 +199,25 @@ class GoRecipeHandler(RecipeHandler):
         suffix =3D None
=20
         for srv in vcsPaths:
-            m =3D srv[vcs.regexp].match(modulepath)
-            if vcs.pathprefix in srv:
-                if host =3D=3D srv[vcs.pathprefix]:
+            m =3D srv[Vcs.REGEXP].match(modulepath)
+            if Vcs.PATHPREFIX in srv:
+                if host =3D=3D srv[Vcs.PATHPREFIX]:
                     rootpath =3D m.group('root')
-                    vcstype =3D srv[vcs.type]
-                    repourl =3D m.expand(srv[vcs.repo])
+                    vcstype =3D srv[Vcs.TYPE]
+                    repourl =3D m.expand(srv[Vcs.REPO])
                     suffix =3D m.group('suffix')
                     break
-            elif m and srv[vcs.schemelessRepo]:
+            elif m and srv[Vcs.SCHEMELESS_REPO]:
                 rootpath =3D m.group('root')
-                vcstype =3D m[vcs.type]
-                repourl =3D m[vcs.repo]
+                vcstype =3D m[Vcs.TYPE]
+                repourl =3D m[Vcs.REPO]
                 suffix =3D m.group('suffix')
                 break
=20
         return GoImport(rootpath, vcstype, repourl, suffix)
=20
-    def __resolve_repository_dynamic(self, modulepath):
+    @staticmethod
+    def __resolve_repository_dynamic(modulepath):
         """Resolve the repository root in a dynamic manner.
=20
             The method is based on the go implementation of
@@ -222,6 +227,7 @@ class GoRecipeHandler(RecipeHandler):
         url =3D urllib.parse.urlparse("https://" + modulepath)
=20
         class GoImportHTMLParser(HTMLParser):
+            """HTML parser to handle go-import attribute in meta tags"""
=20
             def __init__(self):
                 super().__init__()
@@ -237,15 +243,30 @@ class GoRecipeHandler(RecipeHandler):
=20
             @property
             def import_prefix(self):
-                return self.__srv[0] if len(self.__srv) else None
+                """Returns the import prefix
+
+                Returns:
+                    string: The import prefix
+                """
+                return self.__srv[0] if len(self.__srv) > 0 else None
=20
             @property
             def vcs(self):
-                return self.__srv[1] if len(self.__srv) else None
+                """Returns the version control system
+
+                Returns:
+                    string: the repositories version control system
+                """
+                return self.__srv[1] if len(self.__srv) > 1 else None
=20
             @property
             def repourl(self):
-                return self.__srv[2] if len(self.__srv) else None
+                """Returns the repository URL
+
+                Returns:
+                    string: the repository URL
+                """
+                return self.__srv[2] if len(self.__srv) > 2 else None
=20
         url =3D url.geturl() + "?go-get=3D1"
         req =3D urllib.request.Request(url)
@@ -303,24 +324,27 @@ class GoRecipeHandler(RecipeHandler):
=20
         return None
=20
-    def __resolve_repository(self, modulepath):
+    @staticmethod
+    def __resolve_repository(modulepath):
         """
         Resolves src uri from go module-path
         """
-        repodata =3D self.__resolve_repository_static(modulepath)
+        repodata =3D GoRecipeHandler.__resolve_repository_static(modulepat=
h)
         if not repodata or not repodata.url:
-            repodata =3D self.__resolve_repository_dynamic(modulepath)
+            repodata =3D GoRecipeHandler.__resolve_repository_dynamic(modu=
lepath)
             if not repodata or not repodata.url:
                 logger.error(
-                    "Could not resolve repository for module path '%s'" % =
modulepath)
+                    "Could not resolve repository for module path '%s'",
+                    modulepath)
                 # There is no way to recover from this
                 sys.exit(14)
         if repodata:
-            logger.debug(1, "Resolved download path for import '%s' =3D> %=
s" % (
-                modulepath, repodata.url))
+            logger.debug("Resolved download path for import '%s' =3D> %s",
+                         modulepath, repodata.url)
         return repodata
=20
-    def __split_path_version(self, path):
+    @staticmethod
+    def __split_path_version(path):
         i =3D len(path)
         dot =3D False
         for j in range(i, 0, -1):
@@ -335,45 +359,49 @@ class GoRecipeHandler(RecipeHandler):
                 path) or path[i - 1] !=3D 'v' or path[i - 2] !=3D '/':
             return path, "", True
=20
-        prefix, pathMajor =3D path[:i - 2], path[i - 2:]
+        prefix, path_major =3D path[:i - 2], path[i - 2:]
         if dot or len(
-                pathMajor) <=3D 2 or pathMajor[2] =3D=3D '0' or pathMajor =
=3D=3D "/v1":
+                path_major) <=3D 2 or path_major[2] =3D=3D '0' or path_maj=
or =3D=3D "/v1":
             return path, "", False
=20
-        return prefix, pathMajor, True
+        return prefix, path_major, True
=20
-    def __get_path_major(self, pathMajor):
-        if not pathMajor:
+    @staticmethod
+    def __get_path_major(path_major):
+        if not path_major:
             return ""
=20
-        if pathMajor[0] !=3D '/' and pathMajor[0] !=3D '.':
-            logger.error(
-                "pathMajor suffix %s passed to PathMajorPrefix lacks separ=
ator", pathMajor)
+        if path_major[0] !=3D '/' and path_major[0] !=3D '.':
+            logger.error("path_major suffix %s passed to PathMajorPrefix"
+                         "lacks separator", path_major)
=20
-        if pathMajor.startswith(".v") and pathMajor.endswith("-unstable"):
-            pathMajor =3D pathMajor[:len("-unstable") - 2]
+        if path_major.startswith(".v") and path_major.endswith("-unstable"=
):
+            path_major =3D path_major[:len("-unstable") - 2]
=20
-        return pathMajor[1:]
+        return path_major[1:]
=20
-    def __build_coderepo(self, repo, path):
+    @staticmethod
+    def __build_coderepo(repo, path):
         codedir =3D ""
-        pathprefix, pathMajor, _ =3D self.__split_path_version(path)
+        pathprefix, path_major, _ =3D GoRecipeHandler.__split_path_version=
(path)
         if repo.root =3D=3D path:
             pathprefix =3D path
         elif path.startswith(repo.root):
             codedir =3D pathprefix[len(repo.root):].strip('/')
=20
-        pseudoMajor =3D self.__get_path_major(pathMajor)
+        pseudo_major =3D GoRecipeHandler.__get_path_major(path_major)
=20
-        logger.debug("root=3D'%s', codedir=3D'%s', prefix=3D'%s', pathMajo=
r=3D'%s', pseudoMajor=3D'%s'",
-                     repo.root, codedir, pathprefix, pathMajor, pseudoMajo=
r)
+        logger.debug("root=3D'%s', codedir=3D'%s', prefix=3D'%s', "
+                     "pathMajor=3D'%s', pseudoMajor=3D'%s'",
+                     repo.root, codedir, pathprefix, path_major, pseudo_ma=
jor)
=20
         return CodeRepo(path, repo.root, codedir,
-                        pathMajor, pathprefix, pseudoMajor)
+                        path_major, pathprefix, pseudo_major)
=20
-    def __resolve_version(self, repo, path, version):
-        hash =3D None
-        coderoot =3D self.__build_coderepo(repo, path)
+    @staticmethod
+    def __resolve_version(repo, path, version):
+        _hash =3D None
+        coderoot =3D GoRecipeHandler.__build_coderepo(repo, path)
=20
         def vcs_fetch_all():
             tmpdir =3D tempfile.mkdtemp()
@@ -401,9 +429,9 @@ class GoRecipeHandler(RecipeHandler):
                     if f[1].startswith(prefix):
                         refs[f[1][len(prefix):]] =3D f[0]
=20
-            for key, hash in refs.items():
+            for key, commithash in refs.items():
                 if key.endswith(r"^{}"):
-                    refs[key.strip(r"^{}")] =3D hash
+                    refs[key.strip(r"^{}")] =3D commithash
=20
             return refs[tag]
=20
@@ -416,31 +444,32 @@ class GoRecipeHandler(RecipeHandler):
                 r =3D l.split(maxsplit=3D1)
                 sha1 =3D r[0] if len(r) else None
                 if not sha1:
-                    logger.error(
-                        "Ups: could not resolve abbref commit for %s" % sh=
ort_commit)
+                    logger.error("Ups: could not resolve abbref commit for=
 %s",
+                                 short_commit)
=20
                 elif sha1.startswith(short_commit):
-                    hash =3D sha1
+                    _hash =3D sha1
                     break
         else:
             m_semver =3D re_semver.match(version)
             if m_semver:
=20
-                def get_sha1_remote(re):
+                def get_sha1_remote(regex):
                     rsha1 =3D None
                     for line in remote_refs:
                         # Split lines of the following format:
-                        # 22e90d9b964610628c10f673ca5f85b8c2a2ca9a  (tag: =
sometag)
+                        # 22e90d9b964610628c10f673ca5f85b8c2a2ca9a  (tag: =
xyz)
                         lineparts =3D line.split(maxsplit=3D1)
                         sha1 =3D lineparts[0] if len(lineparts) else None
                         refstring =3D lineparts[1] if len(
                             lineparts) =3D=3D 2 else None
                         if refstring:
                             # Normalize tag string and split in case of mu=
ltiple
-                            # regs e.g. (tag: speech/v1.10.0, tag: orchest=
ration/v1.5.0 ...)
+                            # regs. Example:
+                            # tag: speech/v1.10.0, tag: orchestration/v1.5=
.0 ..)
                             refs =3D refstring.strip('(), ').split(',')
                             for ref in refs:
-                                if re.match(ref.strip()):
+                                if regex.match(ref.strip()):
                                     rsha1 =3D sha1
                     return rsha1
=20
@@ -455,16 +484,16 @@ class GoRecipeHandler(RecipeHandler):
=20
                 # probe tag using 'ls-remote', which is faster than fetchi=
ng
                 # complete history
-                hash =3D vcs_fetch_remote(tag)
-                if not hash:
+                _hash =3D vcs_fetch_remote(tag)
+                if not _hash:
                     # backup: fetch complete history
                     remote_refs =3D vcs_fetch_all()
-                    hash =3D get_sha1_remote(
+                    _hash =3D get_sha1_remote(
                         re.compile(fr"(tag:|HEAD ->) ({tag})"))
=20
                 logger.debug(
-                    "Resolving commit for tag '%s' -> '%s'", tag, hash)
-        return hash
+                    "Resolving commit for tag '%s' -> '%s'", tag, _hash)
+        return _hash
=20
     def __generate_srcuri_inline_fcn(self, path, version, replaces=3DNone)=
:
         """Generate SRC_URI functions for go imports"""
@@ -505,8 +534,8 @@ class GoRecipeHandler(RecipeHandler):
         return inline_fcn, commit
=20
     def __go_handle_dependencies(self, go_mod, srctree, localfilesdir, ext=
ravalues, d):
+        del d
=20
-        import re
         src_uris =3D []
         src_revs =3D []
=20
@@ -518,10 +547,10 @@ class GoRecipeHandler(RecipeHandler):
             # b) the implementation for the version resolving didn't work
             #    anymore (less bad)
             if not commithash:
-                src_rev +=3D f"#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n"
-                src_rev +=3D f"#!!!   Could not resolve version  !!!\n"
-                src_rev +=3D f"#!!! Possible supply chain attack !!!\n"
-                src_rev +=3D f"#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n"
+                src_rev +=3D "#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n"
+                src_rev +=3D "#!!!   Could not resolve version  !!!\n"
+                src_rev +=3D "#!!! Possible supply chain attack !!!\n"
+                src_rev +=3D "#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n"
             src_rev +=3D f"SRCREV_{path.replace('/', '.')} =3D \"{commitha=
sh}\""
=20
             return src_rev
@@ -537,11 +566,13 @@ class GoRecipeHandler(RecipeHandler):
                     version =3D replacement['New']['Version']
=20
                 if os.path.exists(os.path.join(srctree, path)):
-                    # the module refers to the local path, remove it from =
requirement list
-                    # because it's a local module
-                    go_mod['Require'][:] =3D [v for v in go_mod['Require']=
 if v.get('Path') !=3D oldpath]
+                    # the module refers to the local path, remove it
+                    # from requirement list because it's a local module
+                    go_mod['Require'][:] =3D [v for v in go_mod['Require']=
 \
+                        if v.get('Path') !=3D oldpath]
                 else:
-                    # Replace the path and the version, so we don't iterat=
e replacement list anymore
+                    # Replace the path and the version, so we don't iterat=
e
+                    # replacement list anymore
                     for require in go_mod['Require']:
                         if require['Path'] =3D=3D oldpath:
                             require.update({'Path': path, 'Version': versi=
on})
@@ -574,30 +605,37 @@ class GoRecipeHandler(RecipeHandler):
=20
         extravalues['extrafiles'][go_mods_basename] =3D go_mods_filename
=20
-    def __go_run_cmd(self, cmd, cwd, d):
+    @staticmethod
+    def __go_run_cmd(cmd, cwd, d):
         return bb.process.run(cmd, env=3Ddict(os.environ, PATH=3Dd.getVar(=
'PATH')),
                               shell=3DTrue, cwd=3Dcwd)
=20
-    def __go_native_version(self, d):
-        stdout, _ =3D self.__go_run_cmd("go version", None, d)
-        m =3D re.match(r".*\sgo((\d+).(\d+).(\d+))\s([\w\/]*)", stdout)
-        major =3D int(m.group(2))
-        minor =3D int(m.group(3))
-        patch =3D int(m.group(4))
+    @staticmethod
+    def __go_native_version(d):
+        stdout, _ =3D GoRecipeHandler.__go_run_cmd("go version", None, d)
+        match =3D re.match(r".*\sgo((\d+).(\d+).(\d+))\s([\w\/]*)", stdout=
)
+        major =3D int(match.group(2))
+        minor =3D int(match.group(3))
+        patch =3D int(match.group(4))
=20
         return major, minor, patch
=20
-    def __go_mod_patch(self, srctree, localfilesdir, extravalues, d):
+    @staticmethod
+    def __go_mod_patch(srctree, localfilesdir, extravalues, d):
=20
         patchfilename =3D "go.mod.patch"
-        go_native_version_major, go_native_version_minor, _ =3D self.__go_=
native_version(
-            d)
-        self.__go_run_cmd("go mod tidy -go=3D%d.%d" %
-                          (go_native_version_major, go_native_version_mino=
r), srctree, d)
-        stdout, _ =3D self.__go_run_cmd("go mod edit -json", srctree, d)
+        go_native_version_major, go_native_version_minor, _ =3D \
+            GoRecipeHandler.__go_native_version(d)
+
+        GoRecipeHandler.__go_run_cmd("go mod tidy -go=3D" \
+                                    f"{go_native_version_major}." \
+                                    f"{go_native_version_minor}", srctree,=
 d)
+
+        stdout, _ =3D GoRecipeHandler.__go_run_cmd("go mod edit -json", sr=
ctree, d)
=20
         # Create patch in order to upgrade go version
-        self.__go_run_cmd("git diff go.mod > %s" % (patchfilename), srctre=
e, d)
+        GoRecipeHandler.__go_run_cmd(f"git diff go.mod > {patchfilename}",
+                                     srctree, d)
=20
         go_mod =3D json.loads(stdout)
         tmpfile =3D os.path.join(localfilesdir, patchfilename)
@@ -607,12 +645,13 @@ class GoRecipeHandler(RecipeHandler):
=20
         return go_mod, patchfilename
=20
-    def __go_mod_vendor(self, go_mod, srctree, localfilesdir, extravalues,=
 d):
+    @staticmethod
+    def __go_mod_vendor(go_mod, srctree, localfilesdir, extravalues, d):
         # Perform vendoring to retrieve the correct modules.txt
         tmp_vendor_dir =3D tempfile.mkdtemp()
=20
         # -v causes to go to print modules.txt to stderr
-        _, stderr =3D self.__go_run_cmd(
+        _, stderr =3D GoRecipeHandler.__go_run_cmd(
             "go mod vendor -v -o %s" % (tmp_vendor_dir), srctree, d)
=20
         # ignore miscellaneous go log messages
@@ -621,9 +660,9 @@ class GoRecipeHandler(RecipeHandler):
=20
         modules_txt_basename =3D "modules.txt"
         modules_txt_filename =3D os.path.join(localfilesdir, modules_txt_b=
asename)
-        with open(modules_txt_filename, "w") as f:
-            f.write('\n'.join(vedoring_log))
-            f.write('\n') # don't forget the trailing newline
+        with open(modules_txt_filename, "w") as file:
+            file.write('\n'.join(vedoring_log))
+            file.write('\n') # don't forget the trailing newline
=20
         extravalues['extrafiles'][modules_txt_basename] =3D modules_txt_fi=
lename
=20
@@ -634,13 +673,13 @@ class GoRecipeHandler(RecipeHandler):
=20
         if licvalues:
             for licvalue in licvalues:
-                license =3D licvalue[0]
-                lics =3D tidy_licenses(fixup_license(license))
+                lics =3D tidy_licenses(fixup_license(licvalue[0]))
                 lics =3D [lic for lic in lics if lic not in licenses]
-                if len(lics):
+                if len(lics) > 0:
                     licenses.extend(lics)
                 lic_files_chksum.append(
-                    'file://src/${GO_IMPORT}/vendor/%s;md5=3D%s' % (licval=
ue[1], licvalue[2]))
+                    'file://src/${GO_IMPORT}/vendor/%s;md5=3D%s'
+                    % (licvalue[1], licvalue[2]))
=20
         # strip version part from module URL /vXX
         baseurl =3D re.sub(r'/v(\d+)$', '', go_mod['Module']['Path'])
@@ -648,15 +687,15 @@ class GoRecipeHandler(RecipeHandler):
         licenses_basename =3D "%s-licenses.inc" % pn
=20
         licenses_filename =3D os.path.join(localfilesdir, licenses_basenam=
e)
-        with open(licenses_filename, "w") as f:
-            f.write("GO_MOD_LICENSES =3D \"%s\"\n\n" %
+        with open(licenses_filename, "w") as file:
+            file.write("GO_MOD_LICENSES =3D \"%s\"\n\n" %
                     ' & '.join(sorted(licenses, key=3Dstr.casefold)))
             # We introduce this indirection to make the tests a little eas=
ier
-            f.write("LIC_FILES_CHKSUM  +=3D \"${VENDORED_LIC_FILES_CHKSUM}=
\"\n")
-            f.write("VENDORED_LIC_FILES_CHKSUM =3D \"\\\n")
+            file.write("LIC_FILES_CHKSUM  +=3D \"${VENDORED_LIC_FILES_CHKS=
UM}\"\n")
+            file.write("VENDORED_LIC_FILES_CHKSUM =3D \"\\\n")
             for lic in lic_files_chksum:
-                f.write("    " + lic + " \\\n")
-            f.write("\"\n")
+                file.write("    " + lic + " \\\n")
+            file.write("\"\n")
=20
         extravalues['extrafiles'][licenses_basename] =3D licenses_filename
=20
@@ -682,7 +721,6 @@ class GoRecipeHandler(RecipeHandler):
         stdout, _ =3D self.__go_run_cmd("go mod edit -json", srctree, d)
=20
         go_mod =3D json.loads(stdout)
-        go_import =3D go_mod['Module']['Path']
         go_version_match =3D re.match("([0-9]+).([0-9]+)", go_mod['Go'])
         go_version_major =3D int(go_version_match.group(1))
         go_version_minor =3D int(go_version_match.group(2))
@@ -702,8 +740,10 @@ class GoRecipeHandler(RecipeHandler):
         if go_version_major =3D=3D 1 and go_version_minor < 17:
             logger.warning(
                 "go.mod files generated by Go < 1.17 might have incomplete=
 indirect dependencies.")
-            go_mod, patchfilename =3D self.__go_mod_patch(srctree, localfi=
lesdir,
-                                                        extravalues, d)
+            go_mod, patchfilename =3D GoRecipeHandler.__go_mod_patch(srctr=
ee,
+                                                                   localfi=
lesdir,
+                                                                   extrava=
lues,
+                                                                   d)
             src_uris.append(
                 "file://%s;patchdir=3Dsrc/${GO_IMPORT}" % (patchfilename))
=20
@@ -712,7 +752,10 @@ class GoRecipeHandler(RecipeHandler):
         if not os.path.exists(os.path.join(srctree, "vendor")):
=20
             # Write additional $BPN-modules.inc file
-            self.__go_mod_vendor(go_mod, srctree, localfilesdir, extravalu=
es, d)
+            GoRecipeHandler.__go_mod_vendor(go_mod, srctree,
+                                            localfilesdir,
+                                            extravalues, d)
+
             lines_before.append("LICENSE +=3D \" & ${GO_MOD_LICENSES}\"")
             lines_before.append("require %s-licenses.inc" % (pn))
=20
@@ -728,6 +771,8 @@ class GoRecipeHandler(RecipeHandler):
         lines_before.append("GO_IMPORT =3D \"{}\"".format(baseurl))
         lines_before.append("SRCREV_FORMAT =3D \"${BPN}\"")
=20
+        return True
+
     def __update_lines_before(self, updated, newlines, lines_before):
         if updated:
             del lines_before[:]
@@ -741,21 +786,24 @@ class GoRecipeHandler(RecipeHandler):
     def __rewrite_lic_uri(self, lines_before):
=20
         def varfunc(varname, origvalue, op, newlines):
+            del op, newlines
             if varname =3D=3D 'LIC_FILES_CHKSUM':
                 new_licenses =3D []
                 licenses =3D origvalue.split('\\')
-                for license in licenses:
-                    if not license:
-                        logger.warning("No license file was detected for t=
he main module!")
+                for _license in licenses:
+                    if not _license:
+                        logger.warning("No license file was detected for"
+                                       "the main module!")
                         # the license list of the main recipe must be empt=
y
                         # this can happen for example in case of CLOSED li=
cense
                         # Fall through to complete recipe generation
                         continue
-                    license =3D license.strip()
-                    uri, chksum =3D license.split(';', 1)
+                    uri, chksum =3D _license.strip().split(';', 1)
                     url =3D urllib.parse.urlparse(uri)
-                    new_uri =3D os.path.join(
-                        url.scheme + "://", "src", "${GO_IMPORT}", url.net=
loc + url.path) + ";" + chksum
+                    new_uri =3D os.path.join(url.scheme + "://",
+                                           "src", "${GO_IMPORT}",
+                                           url.netloc + url.path)
+                    new_uri +=3D ";" + chksum
                     new_licenses.append(new_uri)
=20
                 return new_licenses, None, -1, True
@@ -768,8 +816,13 @@ class GoRecipeHandler(RecipeHandler):
     def __rewrite_src_uri(self, lines_before, additional_uris =3D []):
=20
         def varfunc(varname, origvalue, op, newlines):
+            del op, newlines
             if varname =3D=3D 'SRC_URI':
-                src_uri =3D ["git://${GO_IMPORT};destsuffix=3Dgit/src/${GO=
_IMPORT};nobranch=3D1;name=3D${BPN};protocol=3Dhttps"]
+                src_uri =3D [ "git://${GO_IMPORT};"
+                            "destsuffix=3Dgit/src/${GO_IMPORT};"
+                            "nobranch=3D1;name=3D${BPN};"
+                            "protocol=3Dhttps"]
+
                 src_uri.extend(additional_uris)
                 return src_uri, None, -1, True
             return origvalue, None, 0, True
--=20
2.30.2


