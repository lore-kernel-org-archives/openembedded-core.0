Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C645CCDB484
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 13:27:08 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.69])
 by mx.groups.io with SMTP id smtpd.web11.214674.1697549217556090878
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Oct 2023 06:27:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=GDCcALIa;
 spf=pass (domain: weidmueller.com, ip: 40.107.105.69, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LXzPzVXxEQ9gLbfX3q3ZppmpVz+u5ne8iFaIP6hXgSrbCszHnCLvscYDicBKnJcnB3nf+wjy514xXya6XWxSBIJWT578G9IEXsVv0Y/AY7PqkJAV71OC6XFwKzuy22TSjAMc5SfGlE0FsftoiFKNBxXTeRxjUic/gIOIzo79/AlUkp6U/QL6mpxi3lH150W+a/RYnOtfPaazSJmJWQxVboFIrSuiPPlKrQ4UdoF0jUka9QIQ4rQrl8CdYx5lBsFSD6C2WJJk69C1lrbKAPO5YW09A5iTrPY46v1uZHH9Tk7Db+kbus3SuLDFrxsbV+ORPrD5/0he31QJyMSwtQihVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XvYwj/9wjHVQDzFJul+girjPYLfIDIzr89+dZIrt+2I=;
 b=mB5QbyCMOtE4K8vfkjHgzywoWyV5+WVKh3Vdta4bAaNLaatjt9WtEeWGxdM66vzYdUs5/7fePbKFw/HsyC4SnD5JC4sm01poLIquBmxW/PrRq3W/EIP2qkRnObo0IYD/Pezq9hVsFS5Zb46ll5eWSRdH/Pp7Y0bVff49shLwPipIdKAOW3+6Cw8nUGGr8t//xiV6I2cZYDYAP12P1xRNUj1uiCIziwhrMl15MRTN27//dMA+UK0D3vqjeut9q4fCaLFOSO3izk+FmHLaVOxIeweg0qy5AUH3zAwQuPOmfdSbN50/OsYtwnWcRcjrwGX7GCni56RxEVxjNeU8IBWqtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XvYwj/9wjHVQDzFJul+girjPYLfIDIzr89+dZIrt+2I=;
 b=GDCcALIaNYarimDH/80ZugnrcLzUEOUX38MTQ78qF/AS+NFMfWY7HsMJRLbXrJWYE3OphC6ZJv3ckF+RNDqSMvPhmnrRinpwtyG3Te2EUlA3nG1ycUDDxVA6A8oJzMxomOE+GPbvRmTiQe0csUvW5j+wWRRbVNlTn92HdLDQS1c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by AS4PR08MB7556.eurprd08.prod.outlook.com (2603:10a6:20b:4fe::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Tue, 17 Oct
 2023 13:26:54 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::4d2c:55ba:282e:9a62]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::4d2c:55ba:282e:9a62%5]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 13:26:54 +0000
From: lukas.funke-oss@weidmueller.com
To: openembedded-core@lists.openembedded.org
CC: Bruce Ashfield <bruce.ashfield@gmail.com>,
	Vyacheslav Yurkov <uvv.mail@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>,
	Lukas Funke <lukas.funke@weidmueller.com>
Subject: [OE-Core][PATCH v2 4/4] recipetool: Add handler to create go recipes
Date: Tue, 17 Oct 2023 15:26:47 +0200
Message-ID: <20231017132647.352938-5-lukas.funke-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231017132647.352938-1-lukas.funke-oss@weidmueller.com>
References: <20231017132647.352938-1-lukas.funke-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0158.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::11) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|AS4PR08MB7556:EE_
X-MS-Office365-Filtering-Correlation-Id: bb2b1628-d401-47f7-35c8-08dbcf14baf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1vAiJh+9WTC+t6uLaLmPrQBvp3YoA7XLUgDcR1V5jT2C3UtqXgHnwIDbpxm6uQsIisNSp2VbIO1q4YPBRZmZCsLhWB1OgTH5g0gvz3yu2hU1FsxUcQleq2uoGaGEaBbqHjwx1AbSeWOA5/XcL+rZe2lDr5+1VK5JnriNw8HzvIphCTTfewjuJFtoDkdqW8pwzyS6S+j0gqf/d7/q8qngrL8pXWWknDfsmq7nJt8oK9KdzVjTjCz9IaKg38Ltf0ce82OTxV8v4Oufamv1x3r9HSsxC/MBjd6ryl3+4ulrIJebHrDi8UQqj7tUsw07Zca3P9mpExDRb464l2eDL/J4MWDISVFITR7uvOa97KAcgClKnc8JONIKc2pGQjNsu2hlLkdqvYXZPyiSZVkCpTLFxcd07Q79BFhHmGHsugRm3r9ittQhxC/xo+VLpg+yapud4olTy/R1kvNwJ0Y04ZxFp7K2fFH9ZUk4C9ZNnm7TC5/SM0ymWEYUhBeD/XtDEYG3fvpnDlV7nUzmmZqiY0jdqnKCan0RswSbCRbcbvZI2ZFe6l7wdsfGoDeee2iXIcy0Dt14J84mzZCzRawxkmIoeKYU9Ed6TUTrx9XD+aveOwM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(346002)(366004)(376002)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(26005)(6512007)(107886003)(6666004)(2616005)(6506007)(1076003)(9686003)(83380400001)(30864003)(52116002)(54906003)(41300700001)(5660300002)(478600001)(8676002)(966005)(8936002)(6916009)(66476007)(2906002)(6486002)(4326008)(316002)(66556008)(86362001)(66946007)(38100700002)(36756003)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ilZUNMjw+MfBAfC9MFdg6rlLkVHhG9XcAJeXaaV1+lBbCvVFeOfXRBY08A2r?=
 =?us-ascii?Q?QeWYysNSTxmmGvuQs1PyZUA0VocG0zsLI2Do92Zrj5aSGgMLkw71XM2GzkqP?=
 =?us-ascii?Q?Vopm3TWeleXYzv6HERv3wzmaxpb7+5VdteWorNreQIuyRnJQW/T+V1jaG/VF?=
 =?us-ascii?Q?bZWZ9ncgFpWMM2lhTlX0r9NlZEhmy2Mxe96AbHTADR4YxBQua1TDkM6yOnNE?=
 =?us-ascii?Q?tynG8c7LmpkMu/JZJGCWqPQNmtPLvV34GUuX765NTxrIpmiG9V5EXefkF9fv?=
 =?us-ascii?Q?byR6Z3s5ZFD4+rmGXpsF4KX1pFXU8vRXcBYWbRYJWKiElfPL3mMjtxQNxjfG?=
 =?us-ascii?Q?+DPmnYv3EHLMuCgjKn6CkQ/v3DReDyV6n/YNcs6TBIIp8X5nwFVwMRLSmaD+?=
 =?us-ascii?Q?539Uro/reLyFUP2tqY6TNwaZULoQuA2rXqDJd8/HEG/ukn6VGkGnnr7mYyy3?=
 =?us-ascii?Q?/qZsBWPjgCz55JYix1iI3SD4a0vKSR7bLS9GsDGqfLWO3JuJphhRyzZCcaWH?=
 =?us-ascii?Q?r6D/PWrXJLUVuhM2XRMRUL1IF6jKLThwbj9xf1Or7hF74OI7BT3u7DPyipgp?=
 =?us-ascii?Q?GAakjLHtX+fyS91po2D2XkhPNH3f4cm5fGfqLlekixzD2vQg8wGB/3ZsiNkq?=
 =?us-ascii?Q?c99wkyV572Fah5ctQEntM71V12mH7l7o9r0j/HrbaaZjf4i/FcB9oh2fboNI?=
 =?us-ascii?Q?l+nGPX/4jYSq9CWPOz5DnU6vYzSs0MOehd+JnsGk5RAs+VeIUus/pqPOLZ5Y?=
 =?us-ascii?Q?VrRYXL2bV+RN41IreomZ0n99pEuemNn6LqPCxZpnKI6V81Y0soEKX6N0CmHe?=
 =?us-ascii?Q?/sZyRbgqU7IVrQjdgQA+/ixj2k00VSs5uTLy96H63oiViosGpzMr5pGYf3EN?=
 =?us-ascii?Q?RnypmMUgCfKpRW4pkRx9O0omFysPutmAlf8xoYSF2Ty+Ht4TihRCZ+LQ7Vb4?=
 =?us-ascii?Q?sxDnUOH3zCIU/Lae2qG2KBR7VrajAAmLM3JwvkmrTgOogjRJCMKit0EoGDqm?=
 =?us-ascii?Q?jauuQ5uIlRMfmdkjyYPZdjwqDevXI5fiSW1YBltyVKw1RR7nVWs0CRQHrYK4?=
 =?us-ascii?Q?gjbMDqv1tSDrd+A6gk7S0JsPBqxg4olSR72xXaVQyZkeRyDP+Ryw5ljvvNfQ?=
 =?us-ascii?Q?GGFbnCfcFupyCcpBYJSF3NEp9JA0qV9W+XQJkM+y71aP9Hl03Vh4DXQBFg/o?=
 =?us-ascii?Q?6NPKSqk2ZYxikxOzCnYWDc9xnE0a3Foilc0Vt1BQItFW71X2n5QdiuH+yfWT?=
 =?us-ascii?Q?ebQaLhzIfo21ZlgPRIue6nwAgVCzz+wCdghVeqhaXt8k9EfiZiL/NDZxAY5/?=
 =?us-ascii?Q?uFT/C4DIJaCaydjKn/wrozHvop8ZNqHScYOTDI0oqB3ZvGx91re7rdTpAOma?=
 =?us-ascii?Q?xYqDbBiyKUlAKiwd/HD1/ZnCHYcNiMSsLeRykRRBolxoliE7xnKRnUqUPjMB?=
 =?us-ascii?Q?OfKf76Wy/tdfOh76l/GfQnYwrI4vD9Q7vzk3xgv50cOZuzXCNnuiAJfgIKyZ?=
 =?us-ascii?Q?rY1RjIvdydIrug5U+YRvs1wBj0VoE4WXsYcvOpDtn5tG2sUGhs9YzQ3/fTWp?=
 =?us-ascii?Q?85OkVjvCvS+oQj134BB0xLrRJ9SVBR4sn2WsOydbZADhFFYwyZ9sQxgEI3sC?=
 =?us-ascii?Q?Ag=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb2b1628-d401-47f7-35c8-08dbcf14baf1
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 13:26:54.7032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QA1uCBjTHIyMZQ6RiJeL+arRyXY5mr71o9epT1PTCZWBrV8bpLoNLE0xL3wdMENjYmXdWApOaaBbT5p8oDWPrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7556
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 13:27:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189330

From: Lukas Funke <lukas.funke@weidmueller.com>

Signed-off-by: Lukas Funke <lukas.funke@weidmueller.com>
---
 scripts/lib/recipetool/create_go.py | 730 ++++++++++++++++++++++++++++
 1 file changed, 730 insertions(+)
 create mode 100644 scripts/lib/recipetool/create_go.py

diff --git a/scripts/lib/recipetool/create_go.py b/scripts/lib/recipetool/c=
reate_go.py
new file mode 100644
index 0000000000..e0254f111b
--- /dev/null
+++ b/scripts/lib/recipetool/create_go.py
@@ -0,0 +1,730 @@
+# Recipe creation tool - go support plugin
+#
+# Copyright (C) 2023 Weidmueller GmbH & Co KG
+# Author: Lukas Funke <lukas.funke@weidmueller.com>
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Copyright (c) 2009 The Go Authors. All rights reserved.
+#
+#  SPDX-License-Identifier: BSD-3-Clause
+#
+
+
+from collections import namedtuple
+from enum import Enum
+from html.parser import HTMLParser
+from recipetool.create import RecipeHandler, handle_license_vars
+from recipetool.create import guess_license, tidy_licenses, fixup_license
+from urllib.error import URLError
+
+import bb.utils
+import json
+import logging
+import os
+import re
+import subprocess
+import sys
+import shutil
+import tempfile
+import urllib.parse
+import urllib.request
+
+
+GoImport =3D namedtuple('GoImport', 'root vcs url suffix')
+logger =3D logging.getLogger('recipetool')
+CodeRepo =3D namedtuple(
+    'CodeRepo', 'path codeRoot codeDir pathMajor pathPrefix pseudoMajor')
+
+tinfoil =3D None
+
+# Regular expression to parse pseudo semantic version
+# see https://go.dev/ref/mod#pseudo-versions
+re_pseudo_semver =3D re.compile(
+    r"^v[0-9]+\.(0\.0-|\d+\.\d+-([^+]*\.)?0\.)(?P<utc>\d{14})-(?P<commitha=
sh>[A-Za-z0-9]+)(\+[0-9A-Za-z-]+(\.[0-9A-Za-z-]+)*)?$")
+# Regular expression to parse semantic version
+re_semver =3D re.compile(
+    r"^v(?P<major>0|[1-9]\d*)\.(?P<minor>0|[1-9]\d*)\.(?P<patch>0|[1-9]\d*=
)(?:-(?P<prerelease>(?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*)(?:\.(?:0|[1-9]=
\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*))*))?(?:\+(?P<buildmetadata>[0-9a-zA-Z-]+(?:\=
.[0-9a-zA-Z-]+)*))?$")
+
+
+def tinfoil_init(instance):
+    global tinfoil
+    tinfoil =3D instance
+
+
+class GoRecipeHandler(RecipeHandler):
+    """Class to handle the go recipe creation"""
+
+    @staticmethod
+    def __ensure_go():
+        """Check if the 'go' command is available in the recipes"""
+        recipe =3D "go-native"
+        if not tinfoil.recipes_parsed:
+            tinfoil.parse_recipes()
+        try:
+            rd =3D tinfoil.parse_recipe(recipe)
+        except bb.providers.NoProvider:
+            bb.error(
+                "Nothing provides '%s' which is required for the build" % =
(recipe))
+            bb.note(
+                "You will likely need to add a layer that provides '%s'" %=
 (recipe))
+            return None
+
+        bindir =3D rd.getVar('STAGING_BINDIR_NATIVE')
+        gopath =3D os.path.join(bindir, 'go')
+
+        if not os.path.exists(gopath):
+            tinfoil.build_targets(recipe, 'addto_recipe_sysroot')
+
+            if not os.path.exists(gopath):
+                logger.error(
+                    '%s required to process specified source, but %s did n=
ot seem to populate it' % 'go', recipe)
+                return None
+
+        return bindir
+
+    def __resolve_repository_static(self, modulepath):
+        """Resolve the repository in a static manner
+
+            The method is based on the go implementation of
+            `repoRootFromVCSPaths` in
+            https://github.com/golang/go/blob/master/src/cmd/go/internal/v=
cs/vcs.go
+        """
+
+        url =3D urllib.parse.urlparse("https://" + modulepath)
+        req =3D urllib.request.Request(url.geturl())
+
+        try:
+            resp =3D urllib.request.urlopen(req)
+            # Some modulepath are just redirects to github (or some other =
vcs
+            # hoster). Therefore, we check if this modulepath redirects to
+            # somewhere else
+            if resp.geturl() !=3D url.geturl():
+                bb.debug(1, "%s is redirectred to %s" %
+                         (url.geturl(), resp.geturl()))
+                url =3D urllib.parse.urlparse(resp.geturl())
+                modulepath =3D url.netloc + url.path
+
+        except URLError as url_err:
+            # This is probably because the module path
+            # contains the subdir and major path. Thus,
+            # we ignore this error for now
+            logger.debug(
+                1, "Failed to fetch page from [%s]: %s" % (url, str(url_er=
r)))
+
+        host, _, _ =3D modulepath.partition('/')
+
+        class vcs(Enum):
+            pathprefix =3D "pathprefix"
+            regexp =3D "regexp"
+            type =3D "type"
+            repo =3D "repo"
+            check =3D "check"
+            schemelessRepo =3D "schemelessRepo"
+
+        # GitHub
+        vcsGitHub =3D {}
+        vcsGitHub[vcs.pathprefix] =3D "github.com"
+        vcsGitHub[vcs.regexp] =3D re.compile(
+            r'^(?P<root>github\.com/[A-Za-z0-9_.\-]+/[A-Za-z0-9_.\-]+)(/(?=
P<suffix>[A-Za-z0-9_.\-]+))*$')
+        vcsGitHub[vcs.type] =3D "git"
+        vcsGitHub[vcs.repo] =3D "https://\\g<root>"
+
+        # Bitbucket
+        vcsBitbucket =3D {}
+        vcsBitbucket[vcs.pathprefix] =3D "bitbucket.org"
+        vcsBitbucket[vcs.regexp] =3D re.compile(
+            r'^(?P<root>bitbucket\.org/(?P<bitname>[A-Za-z0-9_.\-]+/[A-Za-=
z0-9_.\-]+))(/(?P<suffix>[A-Za-z0-9_.\-]+))*$')
+        vcsBitbucket[vcs.type] =3D "git"
+        vcsBitbucket[vcs.repo] =3D "https://\\g<root>"
+
+        # IBM DevOps Services (JazzHub)
+        vcsIBMDevOps =3D {}
+        vcsIBMDevOps[vcs.pathprefix] =3D "hub.jazz.net/git"
+        vcsIBMDevOps[vcs.regexp] =3D re.compile(
+            r'^(?P<root>hub\.jazz\.net/git/[a-z0-9]+/[A-Za-z0-9_.\-]+)(/(?=
P<suffix>[A-Za-z0-9_.\-]+))*$')
+        vcsIBMDevOps[vcs.type] =3D "git"
+        vcsIBMDevOps[vcs.repo] =3D "https://\\g<root>"
+
+        # Git at Apache
+        vcsApacheGit =3D {}
+        vcsApacheGit[vcs.pathprefix] =3D "git.apache.org"
+        vcsApacheGit[vcs.regexp] =3D re.compile(
+            r'^(?P<root>git\.apache\.org/[a-z0-9_.\-]+\.git)(/(?P<suffix>[=
A-Za-z0-9_.\-]+))*$')
+        vcsApacheGit[vcs.type] =3D "git"
+        vcsApacheGit[vcs.repo] =3D "https://\\g<root>"
+
+        # Git at OpenStack
+        vcsOpenStackGit =3D {}
+        vcsOpenStackGit[vcs.pathprefix] =3D "git.openstack.org"
+        vcsOpenStackGit[vcs.regexp] =3D re.compile(
+            r'^(?P<root>git\.openstack\.org/[A-Za-z0-9_.\-]+/[A-Za-z0-9_.\=
-]+)(\.git)?(/(?P<suffix>[A-Za-z0-9_.\-]+))*$')
+        vcsOpenStackGit[vcs.type] =3D "git"
+        vcsOpenStackGit[vcs.repo] =3D "https://\\g<root>"
+
+        # chiselapp.com for fossil
+        vcsChiselapp =3D {}
+        vcsChiselapp[vcs.pathprefix] =3D "chiselapp.com"
+        vcsChiselapp[vcs.regexp] =3D re.compile(
+            r'^(?P<root>chiselapp\.com/user/[A-Za-z0-9]+/repository/[A-Za-=
z0-9_.\-]+)$')
+        vcsChiselapp[vcs.type] =3D "fossil"
+        vcsChiselapp[vcs.repo] =3D "https://\\g<root>"
+
+        # General syntax for any server.
+        # Must be last.
+        vcsGeneralServer =3D {}
+        vcsGeneralServer[vcs.regexp] =3D re.compile(
+            "(?P<root>(?P<repo>([a-z0-9.\\-]+\\.)+[a-z0-9.\\-]+(:[0-9]+)?(=
/~?[A-Za-z0-9_.\\-]+)+?)\\.(?P<vcs>bzr|fossil|git|hg|svn))(/~?(?P<suffix>[A=
-Za-z0-9_.\\-]+))*$")
+        vcsGeneralServer[vcs.schemelessRepo] =3D True
+
+        vcsPaths =3D [vcsGitHub, vcsBitbucket, vcsIBMDevOps,
+                    vcsApacheGit, vcsOpenStackGit, vcsChiselapp,
+                    vcsGeneralServer]
+
+        if modulepath.startswith("example.net") or modulepath =3D=3D "rsc.=
io":
+            logger.warning("Suspicious module path %s" % modulepath)
+            return None
+        if modulepath.startswith("http:") or modulepath.startswith("https:=
"):
+            logger.warning("Import path should not start with %s %s" %
+                           ("http", "https"))
+            return None
+
+        rootpath =3D None
+        vcstype =3D None
+        repourl =3D None
+        suffix =3D None
+
+        for srv in vcsPaths:
+            m =3D srv[vcs.regexp].match(modulepath)
+            if vcs.pathprefix in srv:
+                if host =3D=3D srv[vcs.pathprefix]:
+                    rootpath =3D m.group('root')
+                    vcstype =3D srv[vcs.type]
+                    repourl =3D m.expand(srv[vcs.repo])
+                    suffix =3D m.group('suffix')
+                    break
+            elif m and srv[vcs.schemelessRepo]:
+                rootpath =3D m.group('root')
+                vcstype =3D m[vcs.type]
+                repourl =3D m[vcs.repo]
+                suffix =3D m.group('suffix')
+                break
+
+        return GoImport(rootpath, vcstype, repourl, suffix)
+
+    def __resolve_repository_dynamic(self, modulepath):
+        """Resolve the repository root in a dynamic manner.
+
+            The method is based on the go implementation of
+            `repoRootForImportDynamic` in
+            https://github.com/golang/go/blob/master/src/cmd/go/internal/v=
cs/vcs.go
+        """
+        url =3D urllib.parse.urlparse("https://" + modulepath)
+
+        class GoImportHTMLParser(HTMLParser):
+
+            def __init__(self):
+                super().__init__()
+                self.__srv =3D []
+
+            def handle_starttag(self, tag, attrs):
+                if tag =3D=3D 'meta' and list(
+                        filter(lambda a: (a[0] =3D=3D 'name' and a[1] =3D=
=3D 'go-import'), attrs)):
+                    content =3D list(
+                        filter(lambda a: (a[0] =3D=3D 'content'), attrs))
+                    if content:
+                        self.__srv =3D content[0][1].split()
+
+            @property
+            def import_prefix(self):
+                return self.__srv[0] if len(self.__srv) else None
+
+            @property
+            def vcs(self):
+                return self.__srv[1] if len(self.__srv) else None
+
+            @property
+            def repourl(self):
+                return self.__srv[2] if len(self.__srv) else None
+
+        url =3D url.geturl() + "?go-get=3D1"
+        req =3D urllib.request.Request(url)
+
+        try:
+            resp =3D urllib.request.urlopen(req)
+
+        except URLError as url_err:
+            logger.warning(
+                "Failed to fetch page from [%s]: %s", url, str(url_err))
+            return None
+
+        parser =3D GoImportHTMLParser()
+        parser.feed(resp.read().decode('utf-8'))
+        parser.close()
+
+        return GoImport(parser.import_prefix, parser.vcs, parser.repourl, =
None)
+
+    def __resolve_from_golang_proxy(self, modulepath, version):
+        """
+        Resolves repository data from golang proxy
+        """
+        url =3D urllib.parse.urlparse("https://proxy.golang.org/"
+                                    + modulepath
+                                    + "/@v/"
+                                    + version
+                                    + ".info")
+
+        # Transform url to lower case, golang proxy doesn't like mixed cas=
e
+        req =3D urllib.request.Request(url.geturl().lower())
+
+        try:
+            resp =3D urllib.request.urlopen(req)
+        except URLError as url_err:
+            logger.warning(
+                "Failed to fetch page from [%s]: %s", url, str(url_err))
+            return None
+
+        golang_proxy_res =3D resp.read().decode('utf-8')
+        modinfo =3D json.loads(golang_proxy_res)
+
+        if modinfo and 'Origin' in modinfo:
+            origin =3D modinfo['Origin']
+            _root_url =3D urllib.parse.urlparse(origin['URL'])
+
+            # We normalize the repo URL since we don't want the scheme in =
it
+            _subdir =3D origin['Subdir'] if 'Subdir' in origin else None
+            _root, _, _ =3D self.__split_path_version(modulepath)
+            if _subdir:
+                _root =3D _root[:-len(_subdir)].strip('/')
+
+            _commit =3D origin['Hash']
+            _vcs =3D origin['VCS']
+            return (GoImport(_root, _vcs, _root_url.geturl(), None), _comm=
it)
+
+        return None
+
+    def __resolve_repository(self, modulepath):
+        """
+        Resolves src uri from go module-path
+        """
+        repodata =3D self.__resolve_repository_static(modulepath)
+        if not repodata or not repodata.url:
+            repodata =3D self.__resolve_repository_dynamic(modulepath)
+            if not repodata or not repodata.url:
+                logger.error(
+                    "Could not resolve repository for module path '%s'" % =
modulepath)
+                # There is no way to recover from this
+                sys.exit(14)
+        if repodata:
+            logger.debug(1, "Resolved download path for import '%s' =3D> %=
s" % (
+                modulepath, repodata.url))
+        return repodata
+
+    def __split_path_version(self, path):
+        i =3D len(path)
+        dot =3D False
+        for j in range(i, 0, -1):
+            if path[j - 1] < '0' or path[j - 1] > '9':
+                break
+            if path[j - 1] =3D=3D '.':
+                dot =3D True
+                break
+            i =3D j - 1
+
+        if i <=3D 1 or i =3D=3D len(
+                path) or path[i - 1] !=3D 'v' or path[i - 2] !=3D '/':
+            return path, "", True
+
+        prefix, pathMajor =3D path[:i - 2], path[i - 2:]
+        if dot or len(
+                pathMajor) <=3D 2 or pathMajor[2] =3D=3D '0' or pathMajor =
=3D=3D "/v1":
+            return path, "", False
+
+        return prefix, pathMajor, True
+
+    def __get_path_major(self, pathMajor):
+        if not pathMajor:
+            return ""
+
+        if pathMajor[0] !=3D '/' and pathMajor[0] !=3D '.':
+            logger.error(
+                "pathMajor suffix %s passed to PathMajorPrefix lacks separ=
ator", pathMajor)
+
+        if pathMajor.startswith(".v") and pathMajor.endswith("-unstable"):
+            pathMajor =3D pathMajor[:len("-unstable") - 2]
+
+        return pathMajor[1:]
+
+    def __build_coderepo(self, repo, path):
+        codedir =3D ""
+        pathprefix, pathMajor, _ =3D self.__split_path_version(path)
+        if repo.root =3D=3D path:
+            pathprefix =3D path
+        elif path.startswith(repo.root):
+            codedir =3D pathprefix[len(repo.root):].strip('/')
+
+        pseudoMajor =3D self.__get_path_major(pathMajor)
+
+        logger.debug("root=3D'%s', codedir=3D'%s', prefix=3D'%s', pathMajo=
r=3D'%s', pseudoMajor=3D'%s'",
+                     repo.root, codedir, pathprefix, pathMajor, pseudoMajo=
r)
+
+        return CodeRepo(path, repo.root, codedir,
+                        pathMajor, pathprefix, pseudoMajor)
+
+    def __resolve_version(self, repo, path, version):
+        hash =3D None
+        coderoot =3D self.__build_coderepo(repo, path)
+
+        def vcs_fetch_all():
+            tmpdir =3D tempfile.mkdtemp()
+            clone_cmd =3D "%s clone --bare %s %s" % ('git', repo.url, tmpd=
ir)
+            bb.process.run(clone_cmd)
+            log_cmd =3D "git log --all --pretty=3D'%H %d' --decorate=3Dsho=
rt"
+            output, _ =3D bb.process.run(
+                log_cmd, shell=3DTrue, stderr=3Dsubprocess.PIPE, cwd=3Dtmp=
dir)
+            bb.utils.prunedir(tmpdir)
+            return output.strip().split('\n')
+
+        def vcs_fetch_remote(tag):
+            # add * to grab ^{}
+            refs =3D {}
+            ls_remote_cmd =3D "git ls-remote -q --tags {} {}*".format(
+                repo.url, tag)
+            output, _ =3D bb.process.run(ls_remote_cmd)
+            output =3D output.strip().split('\n')
+            for line in output:
+                f =3D line.split(maxsplit=3D1)
+                if len(f) !=3D 2:
+                    continue
+
+                for prefix in ["HEAD", "refs/heads/", "refs/tags/"]:
+                    if f[1].startswith(prefix):
+                        refs[f[1].removeprefix(prefix)] =3D f[0]
+
+            for key, hash in refs.items():
+                if key.endswith(r"^{}"):
+                    refs[key.strip(r"^{}")] =3D hash
+
+            return refs[tag]
+
+        m_pseudo_semver =3D re_pseudo_semver.match(version)
+
+        if m_pseudo_semver:
+            remote_refs =3D vcs_fetch_all()
+            short_commit =3D m_pseudo_semver.group('commithash')
+            for l in remote_refs:
+                r =3D l.split(maxsplit=3D1)
+                sha1 =3D r[0] if len(r) else None
+                if not sha1:
+                    logger.error(
+                        "Ups: could not resolve abbref commit for %s" % sh=
ort_commit)
+
+                elif sha1.startswith(short_commit):
+                    hash =3D sha1
+                    break
+        else:
+            m_semver =3D re_semver.match(version)
+            if m_semver:
+
+                def get_sha1_remote(re):
+                    rsha1 =3D None
+                    for line in remote_refs:
+                        # Split lines of the following format:
+                        # 22e90d9b964610628c10f673ca5f85b8c2a2ca9a  (tag: =
sometag)
+                        lineparts =3D line.split(maxsplit=3D1)
+                        sha1 =3D lineparts[0] if len(lineparts) else None
+                        refstring =3D lineparts[1] if len(
+                            lineparts) =3D=3D 2 else None
+                        if refstring:
+                            # Normalize tag string and split in case of mu=
ltiple
+                            # regs e.g. (tag: speech/v1.10.0, tag: orchest=
ration/v1.5.0 ...)
+                            refs =3D refstring.strip('(), ').split(',')
+                            for ref in refs:
+                                if re.match(ref.strip()):
+                                    rsha1 =3D sha1
+                    return rsha1
+
+                semver =3D "v" + m_semver.group('major') + "."\
+                             + m_semver.group('minor') + "."\
+                             + m_semver.group('patch') \
+                             + (("-" + m_semver.group('prerelease'))
+                                if m_semver.group('prerelease') else "")
+
+                tag =3D os.path.join(
+                    coderoot.codeDir, semver) if coderoot.codeDir else sem=
ver
+
+                # probe tag using 'ls-remote', which is faster than fetchi=
ng
+                # complete history
+                hash =3D vcs_fetch_remote(tag)
+                if not hash:
+                    # backup: fetch complete history
+                    remote_refs =3D vcs_fetch_all()
+                    hash =3D get_sha1_remote(
+                        re.compile(fr"(tag:|HEAD ->) ({tag})"))
+
+                logger.debug(
+                    "Resolving commit for tag '%s' -> '%s'", tag, hash)
+        return hash
+
+    def __generate_srcuri_inline_fcn(self, path, version, replaces=3DNone)=
:
+        """Generate SRC_URI functions for go imports"""
+
+        logger.info("Resolving repository for module %s", path)
+        # First try to resolve repo and commit from golang proxy
+        # Most info is already there and we don't have to go through the
+        # repository or even perform the version resolve magic
+        golang_proxy_info =3D self.__resolve_from_golang_proxy(path, versi=
on)
+        if golang_proxy_info:
+            repo =3D golang_proxy_info[0]
+            commit =3D golang_proxy_info[1]
+        else:
+            # Fallback
+            # Resolve repository by 'hand'
+            repo =3D self.__resolve_repository(path)
+            commit =3D self.__resolve_version(repo, path, version)
+
+        url =3D urllib.parse.urlparse(repo.url)
+        repo_url =3D url.netloc + url.path
+
+        coderoot =3D self.__build_coderepo(repo, path)
+
+        inline_fcn =3D "${@go_src_uri("
+        inline_fcn +=3D f"'{repo_url}','{version}'"
+        if repo_url !=3D path:
+            inline_fcn +=3D f",path=3D'{path}'"
+        if coderoot.codeDir:
+            inline_fcn +=3D f",subdir=3D'{coderoot.codeDir}'"
+        if repo.vcs !=3D 'git':
+            inline_fcn +=3D f",vcs=3D'{repo.vcs}'"
+        if replaces:
+            inline_fcn +=3D f",replaces=3D'{replaces}'"
+        if coderoot.pathMajor:
+            inline_fcn +=3D f",pathmajor=3D'{coderoot.pathMajor}'"
+        inline_fcn +=3D ")}"
+
+        return inline_fcn, commit
+
+    def __handle_dependencies(self, go_mod):
+
+        src_uris =3D []
+        src_revs =3D []
+
+        def generate_src_rev(path, version, commithash):
+            src_rev =3D f"# {path}@{version} =3D> {commithash}\n"
+            # Ups...maybe someone manipulated the source repository and th=
e
+            # version or commit could not be resolved. This is a sign of
+            # a) the supply chain was manipulated (bad)
+            # b) the implementation for the version resolving didn't work
+            #    anymore (less bad)
+            if not commithash:
+                src_rev +=3D f"#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n"
+                src_rev +=3D f"#!!!   Could not resolve version  !!!\n"
+                src_rev +=3D f"#!!! Possible supply chain attack !!!\n"
+                src_rev +=3D f"#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n"
+            src_rev +=3D f"SRCREV_{path.replace('/', '.')} =3D \"{commitha=
sh}\""
+
+            return src_rev
+
+        for require in go_mod['Require']:
+            path =3D require['Path']
+            version =3D require['Version']
+
+            inline_fcn, commithash =3D self.__generate_srcuri_inline_fcn(
+                path, version)
+            src_uris.append(inline_fcn)
+            src_revs.append(generate_src_rev(path, version, commithash))
+
+        if go_mod['Replace']:
+            for replacement in go_mod['Replace']:
+                oldpath =3D replacement['Old']['Path']
+                path =3D replacement['New']['Path']
+                version =3D replacement['New']['Version']
+
+                inline_fcn, commithash =3D self.__generate_srcuri_inline_f=
cn(
+                    path, version, oldpath)
+                src_uris.append(inline_fcn)
+                src_revs.append(generate_src_rev(path, version, commithash=
))
+
+        return src_uris, src_revs
+
+    def __go_run_cmd(self, cmd, cwd, d):
+        return bb.process.run(cmd, env=3Ddict(os.environ, PATH=3Dd.getVar(=
'PATH')),
+                              shell=3DTrue, cwd=3Dcwd)
+
+    def __go_native_version(self, d):
+        stdout, _ =3D self.__go_run_cmd("go version", None, d)
+        m =3D re.match(r".*\sgo((\d+).(\d+).(\d+))\s([\w\/]*)", stdout)
+        major =3D int(m.group(2))
+        minor =3D int(m.group(3))
+        patch =3D int(m.group(4))
+
+        return major, minor, patch
+
+    def __go_mod_patch(self, srctree, localfilesdir, extravalues, d):
+
+        patchfilename =3D "go.mod.patch"
+        go_native_version_major, go_native_version_minor, _ =3D self.__go_=
native_version(
+            d)
+        self.__go_run_cmd("go mod tidy -go=3D%d.%d" %
+                          (go_native_version_major, go_native_version_mino=
r), srctree, d)
+        stdout, _ =3D self.__go_run_cmd("go mod edit -json", srctree, d)
+
+        # Create patch in order to upgrade go version
+        self.__go_run_cmd("git diff go.mod > %s" % (patchfilename), srctre=
e, d)
+        # Restore original state
+        self.__go_run_cmd("git checkout HEAD go.mod go.sum", srctree, d)
+
+        go_mod =3D json.loads(stdout)
+        tmpfile =3D os.path.join(localfilesdir, patchfilename)
+        shutil.move(os.path.join(srctree, patchfilename), tmpfile)
+
+        extravalues['extrafiles'][patchfilename] =3D tmpfile
+
+        return go_mod, patchfilename
+
+    def __go_mod_vendor(self, srctree, localfilesdir, extravalues, d):
+        # Perform vendoring to retrieve the correct modules.txt
+        tmp_vendor_dir =3D tempfile.mkdtemp()
+
+        # -v causes to go to print modules.txt to stderr
+        _, stderr =3D self.__go_run_cmd(
+            "go mod vendor -v -o %s" % (tmp_vendor_dir), srctree, d)
+
+        modules_txt_filename =3D os.path.join(localfilesdir, "modules.txt"=
)
+        with open(modules_txt_filename, "w") as f:
+            f.write(stderr)
+
+        extravalues['extrafiles']["modules.txt"] =3D modules_txt_filename
+
+        licenses =3D []
+        lic_files_chksum =3D []
+        licvalues =3D guess_license(tmp_vendor_dir, d)
+
+        if licvalues:
+            for licvalue in licvalues:
+                license =3D licvalue[0]
+                lics =3D tidy_licenses(fixup_license(license))
+                lics =3D [lic for lic in lics if lic not in licenses]
+                if len(lics):
+                    licenses.extend(lics)
+                lic_files_chksum.append(
+                    'file://vendor/%s;md5=3D%s' % (licvalue[1], licvalue[2=
]))
+
+        extravalues['LICENSE'] =3D licenses
+        extravalues['LIC_FILES_CHKSUM'] =3D lic_files_chksum
+
+        shutil.rmtree(tmp_vendor_dir)
+
+        return licenses
+
+    def process(self, srctree, classes, lines_before,
+                lines_after, handled, extravalues):
+
+        if 'buildsystem' in handled:
+            return False
+
+        files =3D RecipeHandler.checkfiles(srctree, ['go.mod'])
+        if not files:
+            return False
+
+        d =3D bb.data.createCopy(tinfoil.config_data)
+        go_bindir =3D self.__ensure_go()
+        if not go_bindir:
+            sys.exit(14)
+
+        d.prependVar('PATH', '%s:' % go_bindir)
+        handled.append('buildsystem')
+        classes.append("go-vendor")
+
+        stdout, _ =3D self.__go_run_cmd("go mod edit -json", srctree, d)
+
+        go_mod =3D json.loads(stdout)
+        go_import =3D go_mod['Module']['Path']
+        go_version_match =3D re.match("([0-9]+).([0-9]+)", go_mod['Go'])
+        go_version_major =3D int(go_version_match.group(1))
+        go_version_minor =3D int(go_version_match.group(2))
+        src_uris =3D []
+
+        localfilesdir =3D tempfile.mkdtemp(prefix=3D'recipetool-go-')
+        extravalues.setdefault('extrafiles', {})
+        # go.mod files with version < 1.17 may not include all indirect
+        # dependencies. Thus, we have to upgrade the go version.
+        if go_version_major =3D=3D 1 and go_version_minor < 17:
+            logger.warning(
+                "go.mod files generated by Go < 1.17 might have incomplete=
 indirect dependencies.")
+            go_mod, patchfilename =3D self.__go_mod_patch(srctree, localfi=
lesdir,
+                                                        extravalues, d)
+            src_uris.append(
+                "file://%s;patchdir=3Dsrc/${GO_IMPORT}" % (patchfilename))
+
+        # Check whether the module is vendored. If so, we have nothing to =
do.
+        # Otherwise we gather all dependencies and add them to the recipe
+        if not os.path.exists(os.path.join(srctree, "vendor")):
+
+            self.__go_mod_vendor(srctree, localfilesdir, extravalues, d)
+            src_uris.append("file://modules.txt")
+
+            dep_src_uris, src_revs =3D self.__handle_dependencies(go_mod)
+            src_uris.extend(dep_src_uris)
+
+            for src_rev in src_revs:
+                lines_after.append(src_rev)
+
+        self.__rewrite_src_uri(src_uris, lines_before)
+
+        # Do generic license handling
+        handle_license_vars(srctree, lines_before, handled, extravalues, d=
)
+        self.__rewrite_lic_uri(lines_before)
+
+        lines_before.append("GO_IMPORT =3D \"{}\"".format(go_import))
+        lines_before.append("SRCREV_FORMAT =3D \"${BPN}\"")
+
+    def __update_lines_before(self, updated, newlines, lines_before):
+        if updated:
+            del lines_before[:]
+            for line in newlines:
+                # Hack to avoid newlines that edit_metadata inserts
+                if line.endswith('\n'):
+                    line =3D line[:-1]
+                lines_before.append(line)
+        return updated
+
+    def __rewrite_lic_uri(self, lines_before):
+
+        def varfunc(varname, origvalue, op, newlines):
+            if varname =3D=3D 'LIC_FILES_CHKSUM':
+                new_licenses =3D []
+                licenses =3D origvalue.split('\\')
+                for license in licenses:
+                    license =3D license.strip()
+                    uri, chksum =3D license.split(';', 1)
+                    url =3D urllib.parse.urlparse(uri)
+                    new_uri =3D os.path.join(
+                        url.scheme + "://", "src", "${GO_IMPORT}", url.net=
loc + url.path) + ";" + chksum
+                    new_licenses.append(new_uri)
+
+                return new_licenses, None, -1, True
+            return origvalue, None, 0, True
+
+        updated, newlines =3D bb.utils.edit_metadata(
+            lines_before, ['LIC_FILES_CHKSUM'], varfunc)
+        return self.__update_lines_before(updated, newlines, lines_before)
+
+    def __rewrite_src_uri(self, src_uris_deps, lines_before):
+
+        def varfunc(varname, origvalue, op, newlines):
+            if varname =3D=3D 'SRC_URI':
+                src_uri =3D []
+                src_uri.append(
+                    "git://${GO_IMPORT};destsuffix=3Dgit/src/${GO_IMPORT};=
nobranch=3D1;name=3D${BPN};protocol=3Dhttps")
+                src_uri.extend(src_uris_deps)
+                return src_uri, None, -1, True
+            return origvalue, None, 0, True
+
+        updated, newlines =3D bb.utils.edit_metadata(
+            lines_before, ['SRC_URI'], varfunc)
+        return self.__update_lines_before(updated, newlines, lines_before)
+
+
+def register_recipe_handlers(handlers):
+    handlers.append((GoRecipeHandler(), 60))
--=20
2.30.2


