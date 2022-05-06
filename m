Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CFB4C433FE
	for <webhook@archiver.kernel.org>; Fri,  6 May 2022 07:00:45 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.85])
 by mx.groups.io with SMTP id smtpd.web10.6635.1651820433030208227
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 May 2022 00:00:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=fgY94SIB;
 spf=pass (domain: weidmueller.com, ip: 40.107.13.85,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X2Idl+HXWxuNQnzziSrEKcyNpdFgvkLybRsCKBWy/QX5axzG5F9DdA6dk8e5HclwX2XWHZ6tXu95ZSb0oEnRRBi2g6upCMpYL0GFc4g+oAzc2P9Phrt8PXRB2GfuB5MreDvAT+z+X9xlPWqnvCloq4L2S8K6+gr2/ghGgCrKhPJTdl0fdBAajT/miVXP7szp3CqMGNm83TyxnQUeLJxyEnNBKbYYwBnlBRRasSfMfwEBL6ai2dLxL01UwinMSZ2ganLWfLJojPi8LTzNFiapLhfNguQpiaGaIgRnEBYFfB8HFoP3m3mxA/2SikqKp39ril4jfk4qL0J0DDe3lLaMPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/SGsAeiPKSnFJR/i2ZKDGpBpJ7i4DMmFZJGt5+EuINI=;
 b=VtmR4f5mdwKXCDYnGgTGGgBrokkchunPoCysdAESgfLYZKKiqZjrFRNnNCRYDo8+MnUBXrHJ6/9YNRY36PAfzJw98SzoaYz23rx6qUYqD9uPqutbjfah3JXk1n1FY0ATbOtqlNbqVJ3j0v6qYVEvesntWEBCvmt8+A3E/RtQIPuprrvYooIfvUFnVQIl3lsgmBlW8VXzshRJh4uJK+FP+fvph9UjvUANJeV5nJhBmqsQcM9G9jRTmRg64uDDru5JU5MkpKwhCxIAYy1FR/wJhCrxI4CRPu7eVaQw8UXSxK+Ie0zcfAuXa1vbQSMb4TPnneeyhETmCJAYOwujBZj0JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/SGsAeiPKSnFJR/i2ZKDGpBpJ7i4DMmFZJGt5+EuINI=;
 b=fgY94SIBJTkIuotPUsvcqB7k0dpsmlM0Ca0kR8k/EmuHVG/gEn6M/QtSBDXBW/R8KYi5VbzGghJTqcHASXqqx+k2OALDIyFBG/+Qb5j7brdGocCjhD38aE92ja2dhMMg6vK5JdQYhghoFfRW1tBNOztzWC7IcplF4vqKt6X/k/U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by HE1PR0801MB1881.eurprd08.prod.outlook.com (2603:10a6:3:55::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12; Fri, 6 May
 2022 07:00:29 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f938:78d7:da4b:8d23]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f938:78d7:da4b:8d23%8]) with mapi id 15.20.5206.027; Fri, 6 May 2022
 07:00:29 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Lukas Funke <lukas.funke@weidmueller.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH 4/5] recipetool: add go recipe generator
Date: Fri,  6 May 2022 08:59:16 +0200
Message-ID: <20220506065917.1375-4-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: 
 <20220506065917.1375-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20220506065917.1375-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0090.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::7) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8bad08ab-104e-45f3-a5c8-08da2f2e1aa3
X-MS-TrafficTypeDiagnostic: HE1PR0801MB1881:EE_
X-Microsoft-Antispam-PRVS: 
	<HE1PR0801MB18812AEB96312553AA8BBDA5D7C59@HE1PR0801MB1881.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	383fGF5Mtwz3knxyrf2FIWoaXBOOBzylhINYmRBcJVOIFvqkBfY5M30h9cI+k45MLvHMDp7uMy+fkggJwHXK2tdF6eRJMVG/aGmln6MLHQg6IUa88u9GOMQU7xd8ccGt50dwJMIqpW2JB37nttD+86H71E3z2U69antD/llO5Bi3BNPSxs44FJoWyHMf0Bp0IVlqttRayeP1PPlBN3uGk3WSTZU0WS3EpiLU2PAs+tkCI2ml4eiLG0C8UjiMs7L3zTuGiyIlAtvNdJRoW+tHL+tetpyoRfkfYxSe6WSxI0wIVGJaTsmEdr+PrlxBdQCQworptvr3d9WK580C0yxHf2eX//wfOXM79hXPbS5HfvU2WbNC4sF9UR/w72D9s/xafs9g047R8hWlVZSQPeCzUSvs95gfm/JpFn6MrmFh5VVKnVsT2EC/fPyk9Q7QIw5W5eGi99z+5K2+l3F+Z4aHrhAxZ27BY7it1vXTQJGOKHFnoHRVSrWPRRzthWMMtpluvDZ8zdfwK7vNpw9zXwPIue798xqHxaK2Ndt8c/ZYPolXDx4fFdstECJgNojgrubZuS0Rge7c2NejiHuJccBAS/2EnzeswgnyrV5kQLAVKA9CF3c2wBVV0v4o2zhxygCspO13QJ5k6vTGs4Ghlu8ta8+GmpEEAkV7glBvIxUdu377xlO6eQAXNYBROR0ejvqAMoANLope0HwCTaUiKHgwPw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(6486002)(30864003)(5660300002)(316002)(38100700002)(38350700002)(2906002)(6666004)(83380400001)(8936002)(508600001)(52116002)(36756003)(1076003)(2616005)(86362001)(6512007)(186003)(26005)(54906003)(6916009)(4326008)(66556008)(66476007)(66946007)(8676002)(107886003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?r433aR1Rau3iMRm1T2Wa1G3rdZRQZOsqJ92ta6y5mwqEzpFeynlwFylsv5Br?=
 =?us-ascii?Q?89i4ZhpCJgxXUpFXdQEK5+QE6gyv50390xH3c2czf6pHTWNS6Eh+xzcDZ7rk?=
 =?us-ascii?Q?mw+Gz1ytpanEPUHt3pWO8otlGvarfdNy0ZSHDNsH1g2UPjeFrv+4jEIYvhLp?=
 =?us-ascii?Q?QRtlDk02Wj27URghQv3bXY7+OYGNaqFMpGcfkm6FVP9ZtaNZ+XCmZdHl7Rk0?=
 =?us-ascii?Q?GCwiYy48bMxeWhojzc01ztzV150vOLBYt8yoEA8saGO/n7qBbUCUMBd5IvWB?=
 =?us-ascii?Q?KbA4g5ZZpUCxC9ZAovqvgHrTOpl4Xm/WzrCusBSiKTjbw5uozMwJEgKhEGGF?=
 =?us-ascii?Q?x2H5I1iqfJssR3Zs+RK8ThstEegKvlFB5F6wv7Y/5Edwk4gp2xVuNyanV5on?=
 =?us-ascii?Q?4llX1mdQVeRQ5/bdmRO4csMtJvg9ORMCxsuuNIvptZj/bZhUHL2UHvxo3J+m?=
 =?us-ascii?Q?o2yEsHxzyWayP2acJDBYFam0OzL7yQ/HQXFSRbRkoKpDiiWbVTQnf1uhD4mF?=
 =?us-ascii?Q?jRbspOztAE3+jtotxwLSeHhBUBq7a/glvWRauhRsnDZlA2grRsWvLBSOmBe+?=
 =?us-ascii?Q?4mzacZ8TsZT+1uvxcdlZDupSq8Z/3MyQ1nSKEa4x6qc8hfq7yTkxMAq0Typg?=
 =?us-ascii?Q?iMpviBxTS8a0YrCw7vzn4YtLCz4j5NAtrrUVM3H7I+M6VIlBOZEuZ24yq+Bb?=
 =?us-ascii?Q?BxinJOy8jpVGlT27WHG5KKdUG3QhI5ao/G3LBffLvjCmBBKQHK/bNlKdj8VW?=
 =?us-ascii?Q?RiEjK1p+dyeeHhwVa2HyIHiYjFlwt4CCxXOg8Ri3zD90hCaNqc4kYYDpYu1o?=
 =?us-ascii?Q?oCZeOzuODbfnOL1ypzIlICMBtZpOJBEeNImPXAU+wLaP5gcDhx2K5EpCE/le?=
 =?us-ascii?Q?Hlv2y4buRNxzPaHz1RADYejCY8mxX/z+lh6DX/GMBS715TtRXCVI0vPRww6C?=
 =?us-ascii?Q?GFMeWXsURcW3pVkiariNQcNQnsuOcFp0NCFg1DmBcghF/N6xnr0If9rMpNN2?=
 =?us-ascii?Q?foLFrYR0vJkb9chpqEK9ikYu7t06pv15PaScTyPOu3j626lxnuqZT4R3PWcc?=
 =?us-ascii?Q?zqHSXj5/WVkoA1sIXL8Vv7qhuDO/bf7dpAOEefQaExBVAA/B3+3vYhXBh+ab?=
 =?us-ascii?Q?8dJ27tKRQ55p+jH8Ud4lRTChneqzS6T6xUo/VS3Nl0sbYtsvrVw+POe0AEuS?=
 =?us-ascii?Q?v9kpyfkWYhoPrjsaEgorJCMDuK1n9FjfszphbTzDpBmGNrmthHKfw92J8Jku?=
 =?us-ascii?Q?PhuG/+6J1ERGf3BXoukbGES7egxoZ0B3xXUDDvOVDmmLVa9quUq62qPONPHw?=
 =?us-ascii?Q?q+FE4aye5JzzW+Y6VNrfAi2zGWkexh3w2Znf/M6VgARDU7EA/z8ugb9ddyp7?=
 =?us-ascii?Q?h2y6f3gt2PyO5qCD4hoB8vtYAHIdM71ZYRDsPkRHjojrxt1N/RdEgivntrRC?=
 =?us-ascii?Q?ppOfzezbUqThLrGSl9FJISdzIEV7MN1z0KjNCKP480dL/EorMzCmI9jTSXPD?=
 =?us-ascii?Q?zIScEsw3WbnRnnWBeykbl6+io9IsWC/B+Gaw2EYfyz/Ls8XCmDIXN68NOpJ3?=
 =?us-ascii?Q?KcxZLgiwuedL9aJzhO2iz0YRKXX7no2BRtshnI+jrOB8SkuBRnapdo/kLyf0?=
 =?us-ascii?Q?QhBSf9ysQIlS0IgwiQhrBvbLb9RZ1/evgITaXpYE3DAPzWZttRgyzP2z6cwf?=
 =?us-ascii?Q?MKY/SgF+DAO3BJf+AyEHuDRWqeFAtEFd0AEtp8+I8r/Pd4otxwgR2SbnY74o?=
 =?us-ascii?Q?aBi1R3tkkQ3B1N/Kve6K24ZqzjlNEJQ=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8bad08ab-104e-45f3-a5c8-08da2f2e1aa3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 07:00:29.0168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 nQfDHxvA1rsKM8wPjV5iei2/Gdop0lt+TpctwtY4b0u8cyYKhLsrTzGcGm6mBlzRkMAztreZGsz2eUH/8uuTpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1881
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 May 2022 07:00:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165326

From: Lukas Funke <lukas.funke@weidmueller.com>

Signed-off-by: Lukas Funke <lukas.funke@weidmueller.com>
Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 scripts/lib/recipetool/create_go.py | 394 ++++++++++++++++++++++++++++
 1 file changed, 394 insertions(+)
 create mode 100644 scripts/lib/recipetool/create_go.py

diff --git a/scripts/lib/recipetool/create_go.py b/scripts/lib/recipetool/c=
reate_go.py
new file mode 100644
index 0000000000..4552e9b470
--- /dev/null
+++ b/scripts/lib/recipetool/create_go.py
@@ -0,0 +1,394 @@
+# Recipe creation tool - go support plugin
+#
+# Copyright (C) 2022 Weidmueller GmbH & Co KG
+# Author: Lukas Funke <lukas.funke@weidmueller.com>
+#
+# Copyright (c) 2009 The Go Authors. All rights reserved.
+#
+#  SPDX-License-Identifier: BSD-3-Clause AND GPL-2.0-only
+#
+import bb.utils
+from collections import namedtuple
+from enum import Enum
+from html.parser import HTMLParser
+import json
+import logging
+import os
+import re
+import subprocess
+import sys
+import tempfile
+import shutil
+from urllib.error import URLError, HTTPError
+import urllib.parse
+import urllib.request
+
+from recipetool.create import RecipeHandler, handle_license_vars, ensure_n=
ative_cmd
+
+GoImport =3D namedtuple('GoImport', 'reporoot vcs repourl suffix')
+logger =3D logging.getLogger('recipetool')
+
+tinfoil =3D None
+
+re_pseudo_semver =3D re.compile(r"v([0-9]+)\.([0-9]+).([0-9]+|\([0-9]+\+1\=
))-(pre\.[0-9]+\.)?([0-9]+\.)?(?P<utc>[0-9]+)-(?P<sha1_abbrev>[0-9Aa-zA-Z]+=
)")
+re_semver =3D re.compile(r"^v(?P<major>0|[1-9]\d*)\.(?P<minor>0|[1-9]\d*)\=
.(?P<patch>0|[1-9]\d*)(?:-(?P<prerelease>(?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA=
-Z-]*)(?:\.(?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*))*))?(?:\+(?P<buildmetad=
ata>[0-9a-zA-Z-]+(?:\.[0-9a-zA-Z-]+)*))?$")
+
+def tinfoil_init(instance):
+    global tinfoil
+    tinfoil =3D instance
+
+class GoRecipeHandler(RecipeHandler):
+
+    def _resolve_repository_static(self, modulepath):
+        _rootpath =3D None
+        _vcs =3D None
+        _repourl =3D None
+        _suffix =3D None
+
+        host, _, path =3D modulepath.partition('/')
+
+        class vcs(Enum):
+            pathprefix =3D "pathprefix"
+            regexp =3D "regexp"
+            vcs =3D "vcs"
+            repo =3D "repo"
+            check =3D "check"
+            schemelessRepo =3D "schemelessRepo"
+
+        # GitHub
+        vcsGitHub =3D {}
+        vcsGitHub[vcs.pathprefix] =3D "github.com"
+        vcsGitHub[vcs.regexp] =3D re.compile(r'^(?P<root>github\.com/[A-Za=
-z0-9_.\-]+/[A-Za-z0-9_.\-]+)(/(?P<suffix>[A-Za-z0-9_.\-]+))*$')
+        vcsGitHub[vcs.vcs] =3D "git"
+        vcsGitHub[vcs.repo] =3D "https://\g<root>"
+
+        # Bitbucket
+        vcsBitbucket =3D {}
+        vcsBitbucket[vcs.pathprefix] =3D "bitbucket.org"
+        vcsBitbucket[vcs.regexp] =3D re.compile(r'^(?P<root>bitbucket\.org=
/(?P<bitname>[A-Za-z0-9_.\-]+/[A-Za-z0-9_.\-]+))(/(?P<suffix>[A-Za-z0-9_.\-=
]+))*$')
+        vcsBitbucket[vcs.vcs] =3D "git"
+        vcsBitbucket[vcs.repo] =3D "https://\g<root>"
+
+        # IBM DevOps Services (JazzHub)
+        vcsIBMDevOps =3D {}
+        vcsIBMDevOps[vcs.pathprefix] =3D "hub.jazz.net/git"
+        vcsIBMDevOps[vcs.regexp] =3D re.compile(r'^(?P<root>hub\.jazz\.net=
/git/[a-z0-9]+/[A-Za-z0-9_.\-]+)(/(?P<suffix>[A-Za-z0-9_.\-]+))*$')
+        vcsIBMDevOps[vcs.vcs] =3D "git"
+        vcsIBMDevOps[vcs.repo] =3D "https://\g<root>"
+
+        # Git at Apache
+        vcsApacheGit =3D {}
+        vcsApacheGit[vcs.pathprefix] =3D "git.apache.org"
+        vcsApacheGit[vcs.regexp] =3D re.compile(r'^(?P<root>git\.apache\.o=
rg/[a-z0-9_.\-]+\.git)(/(?P<suffix>[A-Za-z0-9_.\-]+))*$')
+        vcsApacheGit[vcs.vcs] =3D "git"
+        vcsApacheGit[vcs.repo] =3D "https://\g<root>"
+
+        # Git at OpenStack
+        vcsOpenStackGit =3D {}
+        vcsOpenStackGit[vcs.pathprefix] =3D "git.openstack.org"
+        vcsOpenStackGit[vcs.regexp] =3D re.compile(r'^(?P<root>git\.openst=
ack\.org/[A-Za-z0-9_.\-]+/[A-Za-z0-9_.\-]+)(\.git)?(/(?P<suffix>[A-Za-z0-9_=
.\-]+))*$')
+        vcsOpenStackGit[vcs.vcs] =3D "git"
+        vcsOpenStackGit[vcs.repo] =3D "https://\g<root>"
+
+        # chiselapp.com for fossil
+        vcsChiselapp =3D {}
+        vcsChiselapp[vcs.pathprefix] =3D "chiselapp.com"
+        vcsChiselapp[vcs.regexp] =3D re.compile(r'^(?P<root>chiselapp\.com=
/user/[A-Za-z0-9]+/repository/[A-Za-z0-9_.\-]+)$')
+        vcsChiselapp[vcs.vcs] =3D "fossil"
+        vcsChiselapp[vcs.repo] =3D "https://\g<root>"
+
+        # General syntax for any server.
+        # Must be last.
+        vcsGeneralServer =3D {}
+        vcsGeneralServer[vcs.regexp] =3D re.compile("(?P<root>(?P<repo>([a=
-z0-9.\-]+\.)+[a-z0-9.\-]+(:[0-9]+)?(/~?[A-Za-z0-9_.\-]+)+?)\.(?P<vcs>bzr|f=
ossil|git|hg|svn))(/~?(?P<suffix>[A-Za-z0-9_.\-]+))*$")
+        vcsGeneralServer[vcs.schemelessRepo] =3D True
+
+        vcsPaths =3D [vcsGitHub, vcsBitbucket, vcsIBMDevOps, vcsApacheGit,=
 vcsOpenStackGit, vcsChiselapp, vcsGeneralServer]
+
+        if modulepath.startswith("example.net") or modulepath =3D=3D "rsc.=
io":
+            logger.warning("Suspicious module path %s" % modulepath)
+            return None
+        if modulepath.startswith("http:") or modulepath.startswith("https:=
"):
+            logger.warning("Import path should not start with %s %s" % ("h=
ttp", "https"))
+            return None
+
+        for srv in vcsPaths:
+            m =3D srv[vcs.regexp].match(modulepath)
+            if vcs.pathprefix in srv:
+                if host =3D=3D srv[vcs.pathprefix]:
+                    _rootpath =3D m.group('root')
+                    _vcs =3D srv[vcs.vcs]
+                    _repourl =3D m.expand(srv[vcs.repo])
+                    _suffix =3D m.group('suffix')
+                    break
+            elif m and srv[vcs.schemelessRepo]:
+                _rootpath =3D m.group('root')
+                _vcs =3D m[vcs.vcs]
+                _repourl =3D m[vcs.repo]
+                _suffix =3D m.group('suffix')
+                break
+
+        return GoImport(_rootpath, _vcs, _repourl, _suffix)
+
+    def _resolve_repository_dynamic(self, modulepath):
+
+        url =3D urllib.parse.urlparse("https://" + modulepath)
+
+        class GoImportHTMLParser(HTMLParser):
+
+            def __init__(self):
+                super().__init__()
+                self.__srv =3D []
+
+            def handle_starttag(self, tag, attrs):
+                if tag =3D=3D 'meta' and list(filter(lambda a: (a[0] =3D=
=3D 'name' and a[1] =3D=3D 'go-import'), attrs)):
+                    content =3D list(filter(lambda a: (a[0] =3D=3D 'conten=
t'), attrs))
+                    if content:
+                        self.__srv =3D content[0][1].split()
+
+            @property
+            def rootpath(self):
+                return self.__srv[0]
+
+            @property
+            def vcs(self):
+                return self.__srv[1]
+
+            @property
+            def repourl(self):
+                return self.__srv[2]
+
+        req =3D urllib.request.Request(url.geturl() + "?go-get=3D1")
+
+        try:
+            resp =3D urllib.request.urlopen(req)
+        except URLError as url_err:
+            logger.error("Error while fetching redirect page: %s", str(url=
_err))
+            return None
+        except HTTPError as http_err:
+            logger.error("Error while fetching redirect page: %s", str(htt=
p_err))
+            return None
+
+        parser =3D GoImportHTMLParser()
+        parser.feed(resp.read().decode('utf-8'))
+        parser.close()
+
+        return GoImport(parser.rootpath, parser.vcs, parser.repourl, None)
+
+    def _resolve_repository(self, modulepath):
+        """
+        Resolves src uri from go module-path
+        """
+        repodata =3D self._resolve_repository_static(modulepath)
+        if not repodata.repourl:
+            repodata =3D self._resolve_repository_dynamic(modulepath)
+
+        if repodata:
+            logger.info("Resolved download path for import '%s' =3D> %s", =
modulepath, repodata.repourl)
+
+        return repodata
+
+    def _resolve_pseudo_semver(self, d, repo, module_version):
+        hash =3D None
+
+        def vcs_fetch_all():
+            tmpdir =3D tempfile.mkdtemp()
+            clone_cmd =3D "%s clone --bare %s %s" % ('git', repo, tmpdir)
+            bb.process.run(clone_cmd)
+            log_cmd =3D "git log --all --pretty=3D'%H %d' --decorate=3Dsho=
rt"
+            output, errors =3D bb.process.run(log_cmd, shell=3DTrue, stder=
r=3Dsubprocess.PIPE, cwd=3Dtmpdir)
+            bb.utils.prunedir(tmpdir)
+            return output.strip().split('\n')
+
+        def vcs_fetch_remote(search=3D""):
+            ls_remote_cmd =3D "git ls-remote --tags {} {}".format(repo, se=
arch)
+            output, errors =3D bb.process.run(ls_remote_cmd)
+            return output.strip().split('\n')
+
+        m_pseudo_semver =3D re_pseudo_semver.match(module_version)
+        if m_pseudo_semver:
+            remote_refs =3D vcs_fetch_all()
+            short_commit =3D m_pseudo_semver.group('sha1_abbrev')
+            for l in remote_refs:
+                r =3D l.split(maxsplit=3D1)
+                sha1 =3D r[0] if len(r) else None
+                if not sha1:
+                    logger.error("Ups: could not resolve abbref commit for=
 %s" % short_commit)
+
+                elif sha1.startswith(short_commit):
+                    hash =3D sha1
+                    break
+        else:
+            m_semver =3D re_semver.match(module_version)
+            if m_semver:
+
+                def get_sha1_remote(re, groupId):
+                    for l in remote_refs:
+                        r =3D l.split(maxsplit=3D1)
+                        sha1 =3D r[0] if len(r) else None
+                        ref =3D r[1] if len(r) =3D=3D 2 else None
+                        if ref:
+                            m =3D re.match(ref)
+                            if m and semver_tag in m.group(groupId).split(=
','):
+                                return sha1
+                    return None
+
+                re_tags_remote =3D re.compile(r"refs/tags/(?P<tag>[0-9A-Za=
-z-_\.]+)")
+                re_tags_all =3D re.compile(r"\((HEAD -> (.*), )?tag: *((?:=
([0-9A-Za-z-_\.]+),? *)+)\)")
+                semver_tag =3D "v" + m_semver.group('major') + "."\
+                                +m_semver.group('minor') + "."\
+                                +m_semver.group('patch') \
+                                +(("-" + m_semver.group('prerelease')) if =
m_semver.group('prerelease') else "")
+                remote_refs =3D vcs_fetch_remote(semver_tag)
+                # probe tag using 'ls-remote', which is faster than fetchi=
ng complete history
+                sha1 =3D get_sha1_remote(re_tags_remote, 'tag')
+                if sha1:
+                    hash =3D sha1
+                else:
+                    # backup: fetch complete history
+                    remote_refs =3D vcs_fetch_all()
+                    hash =3D get_sha1_remote(re_tags_all, 3)
+        return hash
+
+    def _handle_dependencies(self, d, srctree, go_mod):
+        runenv =3D dict(os.environ, PATH=3Dd.getVar('PATH'))
+        src_uris =3D []
+        src_revs =3D []
+        for require in go_mod['Require']:
+            module_path =3D require['Path']
+            module_version =3D require['Version']
+
+            repodata =3D self._resolve_repository(module_path)
+            commit_id =3D self._resolve_pseudo_semver(d, repodata.repourl,=
 module_version)
+            url =3D urllib.parse.urlparse(repodata.repourl)
+            repo_url =3D url.netloc + url.path
+            inline_fcn =3D "${@go_src_uri("
+            inline_fcn +=3D "'{}'".format(repo_url)
+            if repo_url !=3D module_path:
+                inline_fcn +=3D ",path=3D'{}'".format(module_path)
+            if repodata.suffix and not re.match("v[0-9]+", repodata.suffix=
):
+                inline_fcn +=3D ",subdir=3D'{}'".format(repodata.suffix)
+            if repodata.vcs !=3D 'git':
+                inline_fcn +=3D ",vcs=3D'{}'".format(repodata.vcs)
+            inline_fcn +=3D ")}"
+
+            src_uris.append(inline_fcn)
+            flat_module_path =3D module_path.replace('/', '.')
+            src_rev =3D "# %s@%s =3D> %s\n" % (module_path, module_version=
, commit_id)
+            src_rev +=3D "SRCREV_%s =3D \"%s\"\n" % (flat_module_path, com=
mit_id)
+            src_rev +=3D "GO_MODULE_PATH[%s] =3D \"%s\"\n" % (flat_module_=
path, module_path)
+            src_rev +=3D "GO_MODULE_VERSION[%s] =3D \"%s\"" % (flat_module=
_path, module_version)
+            src_revs.append(src_rev)
+
+        return src_uris, src_revs
+
+    def _go_mod_patch(self, patchfile, go_import, srctree, localfilesdir, =
extravalues, d):
+        runenv =3D dict(os.environ, PATH=3Dd.getVar('PATH'))
+        # first remove go.mod and go.sum, otherwise 'go mod init' will fai=
l
+        bb.utils.remove(os.path.join(srctree, "go.mod"))
+        bb.utils.remove(os.path.join(srctree, "go.sum"))
+        bb.process.run("go mod init %s" % go_import, stderr=3Dsubprocess.S=
TDOUT, env=3Drunenv, shell=3DTrue, cwd=3Dsrctree)
+        bb.process.run("go mod tidy", stderr=3Dsubprocess.STDOUT, env=3Dru=
nenv, shell=3DTrue, cwd=3Dsrctree)
+        output, _ =3D bb.process.run("go mod edit -json", stderr=3Dsubproc=
ess.STDOUT, env=3Drunenv, shell=3DTrue, cwd=3Dsrctree)
+        bb.process.run("git diff go.mod > %s" % (patchfile), stderr=3Dsubp=
rocess.STDOUT, env=3Drunenv, shell=3DTrue, cwd=3Dsrctree)
+        bb.process.run("git checkout HEAD go.mod go.sum;", stderr=3Dsubpro=
cess.STDOUT, env=3Drunenv, shell=3DTrue, cwd=3Dsrctree)
+        go_mod =3D json.loads(output)
+        tmpfile =3D os.path.join(localfilesdir, patchfile)
+        shutil.move(os.path.join(srctree, patchfile), tmpfile)
+        extravalues.setdefault('extrafiles', {})
+        extravalues['extrafiles'][patchfile] =3D tmpfile
+
+        return go_mod
+
+    def process(self, srctree, classes, lines_before, lines_after, handled=
, extravalues):
+
+        if 'buildsystem' in handled:
+            return False
+
+        files =3D RecipeHandler.checkfiles(srctree, ['go.mod'])
+        if not files:
+            return False
+
+        go_bindir =3D ensure_native_cmd(tinfoil, "go")
+
+        d =3D bb.data.createCopy(tinfoil.config_data)
+        d.prependVar('PATH', '%s:' % go_bindir)
+        handled.append('buildsystem')
+        classes.append("go-vendor")
+
+        runenv =3D dict(os.environ, PATH=3Dd.getVar('PATH'))
+        output, _ =3D bb.process.run("go mod edit -json", stderr=3Dsubproc=
ess.STDOUT, env=3Drunenv, shell=3DTrue, cwd=3Dsrctree)
+        go_mod =3D json.loads(output)
+
+        go_import =3D go_mod['Module']['Path']
+        go_version_match =3D re.match("([0-9]+).([0-9]+)", go_mod['Go'])
+        go_version_major =3D int(go_version_match.group(1))
+        go_version_minor =3D int(go_version_match.group(2))
+        src_uris =3D []
+        if go_version_major =3D=3D 1 and go_version_minor < 17:
+            logger.warning("go.mod files generated by Go < 1.17 might have=
 incomplete indirect dependencies.")
+            patchfile =3D "go.mod.patch"
+            localfilesdir =3D tempfile.mkdtemp(prefix=3D'recipetool-go-')
+            go_mod =3D self._go_mod_patch(patchfile, go_import, srctree, l=
ocalfilesdir, extravalues, d)
+            src_uris.append("file://%s;patchdir=3Dsrc/${GO_IMPORT}" % (pat=
chfile))
+
+        if not os.path.exists(os.path.join(srctree, "vendor")):
+            dep_src_uris, src_revs =3D self._handle_dependencies(d, srctre=
e, go_mod)
+            src_uris.extend(dep_src_uris)
+            lines_after.append("#TODO: Subdirectories are heuristically de=
rived from " \
+                              "the import path and might be incorrect.")
+            for src_rev in src_revs:
+                lines_after.append(src_rev)
+
+        self._rewrite_src_uri(src_uris, lines_before)
+
+        handle_license_vars(srctree, lines_before, handled, extravalues, d=
)
+        self._rewrite_lic_uri(lines_before)
+
+        lines_before.append("GO_IMPORT =3D \"{}\"".format(go_import))
+        lines_before.append("SRCREV_FORMAT =3D \"${PN}\"")
+
+    def _update_lines_before(self, updated, newlines, lines_before):
+        if updated:
+            del lines_before[:]
+            for line in newlines:
+                # Hack to avoid newlines that edit_metadata inserts
+                if line.endswith('\n'):
+                    line =3D line[:-1]
+                lines_before.append(line)
+        return updated
+
+    def _rewrite_lic_uri(self, lines_before):
+
+        def varfunc(varname, origvalue, op, newlines):
+            if varname =3D=3D 'LIC_FILES_CHKSUM':
+                new_licenses =3D []
+                licenses =3D origvalue.split()
+
+                for license in licenses:
+                    uri, chksum =3D license.split(';', 1)
+                    url =3D urllib.parse.urlparse(uri)
+                    new_uri =3D os.path.join(url.scheme + "://", "src", "$=
{GO_IMPORT}", url.netloc + url.path) + ";" + chksum
+                    new_licenses.append(new_uri)
+
+                return new_licenses, None, -1, True
+            return origvalue, None, 0, True
+
+        updated, newlines =3D bb.utils.edit_metadata(lines_before, ['LIC_F=
ILES_CHKSUM'], varfunc)
+        return self._update_lines_before(updated, newlines, lines_before)
+
+    def _rewrite_src_uri(self, src_uris_deps, lines_before):
+
+        def varfunc(varname, origvalue, op, newlines):
+            if varname =3D=3D 'SRC_URI':
+                src_uri =3D []
+                src_uri.append("git://${GO_IMPORT};nobranch=3D1;name=3D${P=
N};protocol=3Dhttps")
+                src_uri.extend(src_uris_deps)
+                return src_uri, None, -1, True
+            return origvalue, None, 0, True
+
+        updated, newlines =3D bb.utils.edit_metadata(lines_before, ['SRC_U=
RI'], varfunc)
+        return self._update_lines_before(updated, newlines, lines_before)
+
+def register_recipe_handlers(handlers):
+    handlers.append((GoRecipeHandler(), 60))
--=20
2.30.2


