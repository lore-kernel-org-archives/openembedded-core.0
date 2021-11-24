Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 265E6C433F5
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 14:48:09 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.88])
 by mx.groups.io with SMTP id smtpd.web08.6874.1637765286114657847
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 06:48:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=a/f3p1Rb;
 spf=pass (domain: weidmueller.com, ip: 40.107.7.88,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D3RKGKx0TfYbqbX0dsu05upTz4g5rLpCpyAXLUOD5X/ud2B8DV4HVkRw0U4AFF1Dem5L4+BLABVKwG3dsHPYSE0gioekCs216XoO27awjmwiNUI5gU78FsLxhTMuBlDedmwMRgqK/JaT36ejBciDnanKXoYwlgnW4y+uGj0AA1IygbCUgxfuGbH1g9b2u4DrH8VlBO8yzOJ1Mw0besSn7NHlcoNjUNot5K/u1h+FOMzw+nmaSaZORIMnrkuAJkIZttjSgFSLTH/BWpFSmCCvmXggdztYcrBjtvpUfzlGnjTJfZVUH2PP/90MNjmJcB9FcvsFqQlUZSrJ9GaSDNyqkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f9im8AJNzsMTu8/3FGhShtkYp6fG3JLjwwL2evpB+Jw=;
 b=dp+SigLal95f1Dv561cMD/5K+JedT6GpPlUIEEN6+FhFF0QbLiR9RJNtz1JJOqp9sI79KtOb7tJ3nhRwqE/JLUdRWOdXVCRz+/omVTqMOakBN3lb5PmvpnCv+pL89KR92Fe0claPWeRnzWHGgR55nMM/7RPtNkNfup8E6eaPrqrr2ZRL4IeeVaxq9i6Cs3y2WpZPpVwSC9ZywMbIFbKzZ5c0f9RQX5Qrjg4yjFCAyk37CSqd+5AlYdPtNGO5VxDHFRTGW6QAlGXGEouPK9j+tRJa+gk+9glJA0qSmnzhG129K1/fhJRhdx2SVfjuyN+/FZlb3tkcXy49KuCuC2C/kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9im8AJNzsMTu8/3FGhShtkYp6fG3JLjwwL2evpB+Jw=;
 b=a/f3p1RblICBMxohmLQKZvpbKsiWjb8+2hpxKVR82A4Gf6f6dHvByiJnAhxGg2PxHE4+KOHuAniFU3zJWUMuGrJeRGb+cPOCZ22+s3y4z7K/UXDDEW62NPILAtn5/uRXZ1BZisIQymr6z5smqUEI3bSlflhtmfEnxtB0VkHHesA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PAXPR08MB6447.eurprd08.prod.outlook.com (2603:10a6:102:de::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Wed, 24 Nov
 2021 14:48:03 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010%7]) with mapi id 15.20.4713.026; Wed, 24 Nov 2021
 14:48:02 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>,
	Konrad Weihmann <kweihmann@outlook.com>,
	Martin Koppehel <martin@mko.dev>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [RFC PATCH 00/15] Rework npm support
Date: Wed, 24 Nov 2021 15:47:24 +0100
Message-ID: <20211124144739.2250-1-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM5PR0701CA0015.eurprd07.prod.outlook.com
 (2603:10a6:203:51::25) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (94.134.181.208) by
 AM5PR0701CA0015.eurprd07.prod.outlook.com (2603:10a6:203:51::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.21 via Frontend
 Transport; Wed, 24 Nov 2021 14:48:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd484a2f-d91e-492f-c703-08d9af596aa3
X-MS-TrafficTypeDiagnostic: PAXPR08MB6447:
X-Microsoft-Antispam-PRVS: 
	<PAXPR08MB6447134F8CF4BD61F59E1E08D7619@PAXPR08MB6447.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1uyjiUEZHtpkrnPNKv03b3Q0cjchCxZ5VnzFi+quOaX62uhGmokuc10pmxjipkfolA8uyD1elds7k/0WfhwEEE5qvcqNZy9TD2mg9FSA761bCkdu88JBnDLMLdHA7F+ZqcyEsX9FZ7ZzIfaat5szS0KCGzduh8Jgap1JBcZ9zJAn9HVrw0iarJRPT+Q9T7NOJQWq2PybrGC8MNZPHm4C4YAwpA90vwcf4NlqN6gZTUQmcIUCt7bJ7ogGCj4yCnF9KvD8pQf8ya9mHVj9NvoR8JKBKlNCj1lvrTVhZTSZ5ZM6+yka7Pt3zmOCu+46/SvEVNxIu1QxOFFeooXE3/oW7quF+XR4rd+viJXWlZbkEY5ojeXh9f3Pc82iCSYW+xTiym2xIEO3FFM3Be4HbELoQEB7uU/A8lyNlRPrDc0nv9nyPRcWTdWa0h3lEb1Jgp1OzNCztFYtGZBgHitDTjqzJYwD/JfFyXWQQU5KHRyXx9gVYLkvwcgvZDwc2Zi+fj7fd3+moMTRrDjBKqHtLk3k5d3OgtqNGk3spUYrQ5LkJHtyQRpdUjaCU4fLS7LDO4DUyajFimpydjEWWrcApr89oiWptVwN87PTzXH30jxAToDKl77eNZGU6ctebptacKX06a/q8HHgHJhWSYBqG25FF6Ug7EGQ0VDRottDj6tIL9Hv5d7r1nWkbWyk9a4i5C9VJiM3Oa6dK+/oBpPwKm9nDg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(7696005)(38100700002)(38350700002)(52116002)(110136005)(2616005)(956004)(66476007)(66556008)(4326008)(66946007)(66574015)(36756003)(83380400001)(186003)(26005)(316002)(8676002)(8936002)(86362001)(5660300002)(107886003)(2906002)(6486002)(1076003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IkYRG5cY6n3QxPF7EysA1isEYbjHAZdDWQvv494Mb2SFlWjgeWwk7FeGCDcU?=
 =?us-ascii?Q?dJJIpoO2aRuxs/p35GEZIH1Ko7YRwd0jt4ThBhwZApuoilBmRg082p6hM8FD?=
 =?us-ascii?Q?E2CKG6tz40Yq5x1W0wEeXWbbO1+OW6ivTz1z6ZEbzNWCxUPOsTjd3Uza+3at?=
 =?us-ascii?Q?07Rgu2jZm2l5M5Gjl63yEiE/Pfr9UXkmFnS3ukg8QBl9mSLnpWrIHjqk1b0O?=
 =?us-ascii?Q?cJTNN/Z5sTRg4PfhWDwPlTeBayrcyPjw/fLANr0Vxh1BmQNXHir3AjDeCoQc?=
 =?us-ascii?Q?XoOC/TG9G8wXpjzSUccen7z0dVuldcLQDUu4EdwhQZ+HlH9oDe3vqJp3e8K1?=
 =?us-ascii?Q?m0mNeQOhy98FizuRtje2uNAUeOiYbH4Gh6ErtjPzm1GvAvC4jPqS593XmyVN?=
 =?us-ascii?Q?Z3UIiSDynVQeBkzkKArL4IM43EJgNqCkQe+UbA/sTPmGW1DZwPLdn13qkqW3?=
 =?us-ascii?Q?6gaOwM1KwkzVDeUbxBoRwl3Q9musu66ORdKqKezYyxq6TW+axRT0AxgMPMMI?=
 =?us-ascii?Q?8vtK90DZkwZucqPYwarvFPPrrn79jkWAKm6Cb5cmpsBFK+TUdEodyCzQsPUV?=
 =?us-ascii?Q?mA2CE5kzBgNyJNMCoBaAPCxiJNw3zHa3oHaXsoJf/rj2z3w9WYAov9bLpB0j?=
 =?us-ascii?Q?PVm7WRSRdEDzwmxIFrwF+U8nBW5menWrtY1P/x7z9wa/hx9qHXnppfrR+fG/?=
 =?us-ascii?Q?2qhG7p/Qb1DUij0DhdrWT9OGY+ca7YxBvke0Yrw3JEH1GhkHvTGmb7GPWSwL?=
 =?us-ascii?Q?/B8Wp8U3Jk6v0gPPXLkLWPOol6Os/cpsAODiAkMf+fjQKzCURc3bhPMOmcpY?=
 =?us-ascii?Q?A4Mw3eAJayLlpDfZo8TFVliQg8hjUe8g8QJxEiq7yEG0/EBmXB3s6dbuQYcW?=
 =?us-ascii?Q?y1R+92QlYdmAq60quu2wReivmujjzmoWjNjTK535nmGY/l+PO3pU44f+dLp0?=
 =?us-ascii?Q?v96kcqXFEaepflLwllM4U0kFUcBy2PHvTkpJtPmcjthxfk3GGQEEQrWFOxmi?=
 =?us-ascii?Q?OrV93nLcic5AhmSo7HGTQ7FILig8yuhQxjKzpcqxjAa757pBRStJJfZCOJ71?=
 =?us-ascii?Q?XpK/bMWP2BHC1bHvzsorIIwd+bz3rvqMyM5Jll7C4eRqWDZ9E9oE5at5LPqb?=
 =?us-ascii?Q?teupj2vLUsV7sWMJpxCLuYGFDm7eapHUxOKJC0G/VBUDWgIPUhU1PafFcP++?=
 =?us-ascii?Q?M1XAZLzN24lSflnNv337sdVaUlgaM3t2Jx+hWLgTfK5TNLGBWYwN7Qkh+CAe?=
 =?us-ascii?Q?hKLO09CpbCsfyV67YN7cgX56I0MbLCwTPy9h9mf7BXwAXvZdeQQQM0V34fT/?=
 =?us-ascii?Q?XKCgEHpJI8onRIVVvxusYpLtJfEm38tccZVYPyvUzrPaV96+BrKRs3Ri7PvE?=
 =?us-ascii?Q?Nckk62+DS8s6inIEW+mMMNbJp+rqPL+/jGgCgN/W8Vgf8rHGG0ug1zP7bj12?=
 =?us-ascii?Q?7ni14gtEVB1pzEj3kgeH1X4TeK+0ejuFwA5wlnc7H4Yskij6DLUhGhDCKlSY?=
 =?us-ascii?Q?28OKaGvI6Y/wsEd7cmNSolLwwalDj/WWYqJLn2xdxI05QLzZBSv+I/BawQHr?=
 =?us-ascii?Q?Mt3O0AMSolN7zUvIxpblEIFPOd8UxxWjiTEGx7ckqBfvBiIr9froLHFmYlY0?=
 =?us-ascii?Q?KJWYt/l4DJG/Tv2bWh816dY=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bd484a2f-d91e-492f-c703-08d9af596aa3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 14:48:02.9308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 fz0rm+8/0dg3IBcq6s6cBwVAOnGciMgT1SygP/CN3ZTxaY9wlER6KXsVjLe1UCq/jms7DR0wLWGtO/yr3E+hpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6447
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 14:48:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158695

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>


This patch series rework the npm support. It contains bitbake patches
and sample recipes to simplify the discussion. The series is a work in
progress.

Changes:
* Remove the npm-shrinkwrap.json from the npm recipes and replace it
  with direct download urls to simplify the manipulation and update of
  dependencies.
* Remove the npm cache and instead rebuild the fetched npm packages
* Replace python do_* functions with shell functions
* Add support to build packages from source
* Add support to build web applications
* Add support to test packages on the host
* Add support to build angular application
* Add support to test web application via karma and a preinstalled
  chrome browser

ToDos:
* Replace the npm URLs with a python function (ex. pypi.bbclass) or a
  new npm fetcher (ex. crate.py).
* Add support for existing npm-shrinkwrap.json to recipetool
* Add support to reuse existing npm recipes of dependencies to
  recipetool


Stefan Herbrechtsmeier (15):
  openssh: Extend to provide native recipe
  recipetool: Skip hbs extension in guess license
  externalsrc: Remove subsequent slash from B
  bitbake: fetch2: Add striplevel support to unpack
  bitbake: fetch2: Support archives with missing search directory mode
  npm: Rework to use plain npm commands and avoid npm cache
  npm_build: add class to build and install an npm package and its
    dependencies
  npm_build_dist: add class to build npm package and install its dist
    folder
  npm_test: add class to test an npm package
  karma: add class to execute JavaScript code in real browsers
  angular: Add support for angular projects
  recipetool: npm: Add dependencies to SRC_URI and auto select classes
  npm_build: Enable OpenSSL 3.0 legacy provider
  node-red: Add version 2.1.3
  node-red: Add git version

 bitbake/lib/bb/fetch2/__init__.py             |    4 +
 meta/classes/angular.bbclass                  |   30 +
 meta/classes/externalsrc.bbclass              |    2 +-
 meta/classes/karma.bbclass                    |   18 +
 meta/classes/npm.bbclass                      |  340 +-
 meta/classes/npm_build.bbclass                |   81 +
 meta/classes/npm_build_dist.bbclass           |   31 +
 meta/classes/npm_test.bbclass                 |   29 +
 .../openssh/openssh_8.8p1.bb                  |    2 +-
 .../node-red/node-red-src_git.bb              | 2855 +++++++++++++++++
 .../node-red/node-red_2.1.3.bb                |  908 ++++++
 scripts/lib/devtool/standard.py               |    6 +-
 scripts/lib/recipetool/create.py              |    2 +-
 scripts/lib/recipetool/create_npm.py          |  243 +-
 14 files changed, 4300 insertions(+), 251 deletions(-)
 create mode 100644 meta/classes/angular.bbclass
 create mode 100644 meta/classes/karma.bbclass
 create mode 100644 meta/classes/npm_build.bbclass
 create mode 100644 meta/classes/npm_build_dist.bbclass
 create mode 100644 meta/classes/npm_test.bbclass
 create mode 100644 meta/recipes-devtools/node-red/node-red-src_git.bb
 create mode 100644 meta/recipes-devtools/node-red/node-red_2.1.3.bb

--=20
2.20.1


