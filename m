Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4B2AC021A1
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 15:01:03 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.76])
 by mx.groups.io with SMTP id smtpd.web11.1128.1739286052946746079
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 07:00:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.com header.s=selector2 header.b=Bb/wcaUp;
 spf=pass (domain: weidmueller.com, ip: 52.101.66.76, mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ono+Nx69zGdHM9XvBcgzy+XI85cVD4o43/jqXdCBT1vDMYvhBrHlWrARAbzCHl4WEEw2AXXinq1GtPA+gf77+eyNLPu2fJgqlT0y3qW8S+dJ9cHzpcVblszSn2EBLFfo2IJNhRbTbYylY1cSf07iXbmQSt1RjE22KeNtzLaY9F91U/+V/ULiFmJ0O8uXnCtM8zkESAX9TpFwqAmJRYhWCzklqFmFzkQnnzIqDzSmSTZgIeN1Sjp0OhV2hrMYjWod1Ue7NHjGumtn3bgDDXYx+vBpy65XbFbuk3HBiRT8EcXCoz9cmj16YdF0bpfTVpcYWtVYRCAupIjugdFKUC16Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+5h3JWV+ae2nn7/nMCy3JMtIyhDaPyNErOqFSv13jPo=;
 b=Fe4wGGCYVOWAwQDmFUg6nKID2OqT2VKq8APJRJq83FWW7od5EhR2YM4pHrklcg2jfAu33KUA1axB5rErpGYq761oSBzH0xDrZ8WQkNHfwyF3Z0qN6gJ2KsE6a6GE7MQKkXS20HU2bb3ooDaE5/odaOhbU3W/TOMlgrvEl6aAlILAMSiZP5IciTYNKIj7HAa+2uWwCcJlCIHmg9Gw6rq6IHcl2aGXo4CVW18ghQ5gGG7uF76L/ShX+ePYlSv1NEBI66pl9osdR+ziIsaxw6Z0VyBzWKS17K5K/I4MN5TkyZcn3aQNK+g+VftLlojhJOo22JMbpHStw/1ZfK+w4lfgnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weidmueller.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+5h3JWV+ae2nn7/nMCy3JMtIyhDaPyNErOqFSv13jPo=;
 b=Bb/wcaUplFBxhjQVjwwHnuv0RbusvFuHUjQyZkHa5Uu4U6eZq+2MX7hpmv8pZ4jtg2DFFwCpbOhwYTLs75/tRzMmfozubRjocBM8AYJpIi+mioFQyU42F41q7r01SLpEllRDjOVm8wzMokndx8SPNT9Z9dpFd/K+RSADbuSEvr8bfaqRl91PTTNuxWu00/U7ivo+wSgXclZIAT0AfrQ7vL5zQa7FpxW5Sq8L7Gq7QHY+n+LGOpCM5fomePUEKbtKRKlnCbZtSZs6e8tUXeUHl1PWaORPbW9gc1r19krB3R3Hb3nACKTd1ZqLqe/iJchlUBBL2KnJH6yEeH44tB8saw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com (2603:10a6:150:8a::17)
 by DU0PR08MB9396.eurprd08.prod.outlook.com (2603:10a6:10:423::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.20; Tue, 11 Feb
 2025 15:00:51 +0000
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013]) by GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013%7]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 15:00:51 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [RFC PATCH 05/30] lib: oe: add vendor module
Date: Tue, 11 Feb 2025 16:00:09 +0100
Message-ID: <20250211150034.18696-6-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::16) To GV1PR08MB8426.eurprd08.prod.outlook.com
 (2603:10a6:150:8a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8426:EE_|DU0PR08MB9396:EE_
X-MS-Office365-Filtering-Correlation-Id: bf345438-558b-44a8-796a-08dd4aacde5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?YHMg3SMpT1HZeLxKfcDDqxXjVI8Eiml9o0T56MUmgrVtrZptlo4u1W8SaEuX?=
 =?us-ascii?Q?z8URSCjQ0jTzfiHqIwMLVfM+RKsmXc7NvUClyN8hUByscSYTrjHFFoVEbHNb?=
 =?us-ascii?Q?4tAOSQ+rQ7VzM/ujwC4H7zbqB9FXPAsfQMC4+cStjBYRi5yEMN7wN4MAVohr?=
 =?us-ascii?Q?6f0V/l9eCkMR0I/MmCgVBQQpsJgFtVoE9DOcenT22FjRDdDfxaMyuQMn5cVV?=
 =?us-ascii?Q?Sk+cLzXLel78h1+tuTzJz9U8BbKbqiYG5fXjnmwrMuuE3rpGCEtWoMMY9VfK?=
 =?us-ascii?Q?BsVrZcsfh3A+zKOX1Y/cbMpRd1zr1qJ1nb3B1I8kDwp0eMOZnM8Qc6sRc85P?=
 =?us-ascii?Q?wEcfrwI6PwWyYHBUxvmf/9Ps8ZqZ/qIJNzJ7QFSwYAofiq/seS7XcdtYLQgl?=
 =?us-ascii?Q?hS0QBEJXAkqq9gRCnjrLl50f43yqxuDHqI6EqOMQQp5wgM/tpPyYVtICPKzv?=
 =?us-ascii?Q?SOJxcur52RByeJPfdqfGS/3LthP2ZznlITYn64oBfYjuL0jAkG/yDFRbwnvR?=
 =?us-ascii?Q?6nGpi/6sEuDK89oPOf7N6iHtpStusoHCt8lMMutZAdpkGtENO/nKf8S7l4Jh?=
 =?us-ascii?Q?3ZruLavSCdFhDzi5U36F5DCvmezP8DOMLaV6oI2JGS4xmBfh1J1q0tGGNApq?=
 =?us-ascii?Q?kCdQANAz9wCMnfFTItcz877avZ6FRA6Exi/MAw28nRwtaZSnb/IgFrgJZK9h?=
 =?us-ascii?Q?ucGOcxhw/kX2v84S7USDw/rMpXkV3J6mYSm9ZGty0dtCHD9UxlBiU4tgsa/x?=
 =?us-ascii?Q?sHzi9HlZ5pW3wyxdAgX7rYaYuH4X4K7kbhWsxdqNWlXkqREcWiRPaorU1hqd?=
 =?us-ascii?Q?Dp+DNuPov37KLlrtvDpoXXqBFhRjzrzrA/2dzJOY5vNUg93W6oxNnpEl8CXq?=
 =?us-ascii?Q?6lkFflON1BSNALIzgS+MJk/tcqzF8La71ZrCixuhCcoJ60aagysJipqnfW2m?=
 =?us-ascii?Q?eyng+DUTAV8HMg7shGB2/a1BiFqRcJ5oTtIEUCtiQCt1KVY5tboJ+bewigl7?=
 =?us-ascii?Q?Frc8QaQWC1NJA/97zovkMSD70NIOHtRYsj6LX8FT6C9Ds2pgezwNrtGjrGOu?=
 =?us-ascii?Q?xmF9Ob8vWCkiQ0JJBqYzT9JOH/nDApYsPxA7fmB8LC9tgC+HWmL1dKNGgrGD?=
 =?us-ascii?Q?41gODhoakUyGfllAaKNT2qqyEmq7ayztzk8MgevF2zYpBi3YJ7KfV3vTDRUJ?=
 =?us-ascii?Q?qRl+C4iM1oYqE1iNMuKV3maMxjvIrz/w92TFGnpES3Qt7tJGF70m4hh1x8AP?=
 =?us-ascii?Q?UHzyFClKxkilWECmfSq1MVKtZj1twWeADrzyG8y6QB8vsLl2/6m/PQIbXc2Y?=
 =?us-ascii?Q?IwClV+milzfhPHgqZ81HW6xtlr3qGVJdWjSmt+eB1JAWeqsubfArfLHhZONT?=
 =?us-ascii?Q?xol9HZHdKjTlCneazNjoaKQR7qT+sSPAop4T0w3X/ANoj6RFFLNTUKviCsMM?=
 =?us-ascii?Q?GtVgoqguFnZbtMTfIDfTqDELH4N83bri?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB8426.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hxGXxKXXwuOZSCZXqdW/QHdywXhTs7chq0zSEyk0+e8fr6QvquczgDp6A6SF?=
 =?us-ascii?Q?IxHRZwz/X2vQig+j0eOu9uYx0PSV8yOVE4PUE7ShX+IWeqExDSZqPcdWrKT2?=
 =?us-ascii?Q?ZPoHTixT8wHvFMIbpozR+Qih5GFq5ulzKmcgz9X29e6b5CkYNYt86DwRsm2S?=
 =?us-ascii?Q?QFk6LmnIgNVG5/+oaOPleFGoeK0Z8vWfZuCiTpY2WG2e5IRewShyito5xJZs?=
 =?us-ascii?Q?Xpsgfj5OjZgNo6mfXEdN8ZNGIEIt0HohthhDVd4+tLOalNnD1LgNnPdfVUzv?=
 =?us-ascii?Q?FzQ5+9CUNKzyMp1vFmUjm46YQMX9Hdrbdq/ou6I05Z3MwnpvnZXLQ+ZYtAAV?=
 =?us-ascii?Q?oa5VkA85K8GG+XxI2yriDZVyDnxj/egKKhV1pieUUjPLiw8V6A2S7x4c7Fzr?=
 =?us-ascii?Q?O95ec9IK1hT+fFG9iQmbQ78xzng/sy5i4WfaSGLlyFsviV+F1BQhUbWO+iNQ?=
 =?us-ascii?Q?jyOj9kjNzP6Wyi62BSwMXpemN2fIEKySA48bEQouEZQL0zDTdyOc/qMLwbL9?=
 =?us-ascii?Q?lvkbk3NKMQvAweMQHamVgeyv9JxnydrFvORXZXBwoGo3wU2veF1iIgN07jrU?=
 =?us-ascii?Q?7fH/1oCD0rpNVpFlX1LjssV5GJiREEB6bv9GYAvSuzPhma4UUIfQyLCynTAI?=
 =?us-ascii?Q?sUJohWo3lHNyH9fGOlcgG/iGG8FUrTJGCucWUXzJqLeLwq75PZLJ5h1m38TL?=
 =?us-ascii?Q?qhZnw3jBE1Askp2L6FRI0j/iDYmUywDUQiv2Xs0isjvQYmxSldwb+Hmgfvnj?=
 =?us-ascii?Q?xyHsQC2z/h5a8v0myJZwebRktuJMYmCO+d1rhxUZVgi0CGtsJKmVVIwfRLKi?=
 =?us-ascii?Q?7afrl80xs4WlZVLyzJzSWBkNOqs6T4r6M9Pm1lst/qS9jCWW/9bNT5obT+jM?=
 =?us-ascii?Q?BfqSOyCOJ1MoxuudxmWtu3oYktD5TBnY0rK2v9D5pqzrB20sn54zwFxeo9Oh?=
 =?us-ascii?Q?wFZwe9y7vx03FjNAdXCgU4RgyqZPAzFwZcK8W+rky9ybOWVWV7FTrYQvN6UT?=
 =?us-ascii?Q?98zTMOKmHYdJJtC9ToKeTlsRDhOKVaIJJDxZs5hVmEnd2T+EMnOn9Xj3FnX6?=
 =?us-ascii?Q?+TRKYlfSPXH/PcLN+1QJa5wRMR9x2XedMOjHC1PZGMG3EloMelw8E5I51WmV?=
 =?us-ascii?Q?wIxf5L9QIy70Boq48/vZcS9OWI3Djd9gqvwSt6ywMmD0QRiE0JKVwYvaYTbs?=
 =?us-ascii?Q?2PB1NdyRMWgHgjXmJqTGYXOST89WVHtMrEEfnW0R3LLUjaJFnLUeBqQ+5h+e?=
 =?us-ascii?Q?ZBnx+gOQjmOf85deSmWDOGjzBtWCPT6nsxPd8+GmfdKpiMdZrRQ7TkNmOPPI?=
 =?us-ascii?Q?EQ7sa2fF46HipeZDjXQ70SBa+F2nCfAKsCg7uvfuyx2/H1nN0J3t8NIUMBUN?=
 =?us-ascii?Q?WI9BkoSoVIyzfTgHC1qwESxJTFBNIEiunqRl0GfjxHUFk9md2tI+e2FDOS+U?=
 =?us-ascii?Q?vnD8kOdqheZQPji1Ssh4/bcOJ3Nu3ASpe9mUR2+GJ6l038FptUbR8NUMQqML?=
 =?us-ascii?Q?Wj1TgTr6mTrn4xm5HUY7L8GTWYQrqwKLKNqev69TR/LODEr16auBmTJac4sS?=
 =?us-ascii?Q?gNmPxs0DkzHienqU4BdzWTJUnc2vcDRacu3N29giQEptaa4AAqRt9tjhu7UR?=
 =?us-ascii?Q?NA=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf345438-558b-44a8-796a-08dd4aacde5b
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 15:00:48.3570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RMdvZnFwTYoPSJd7ZgKgs8J93wCPxce4jnxnHm3d1ROsCN1s1scoG12JFc6yi8y2IR+Km9y5W4Y/h6rekXhFFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9396
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 15:01:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211129

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Add a vendor package as base for package manager specific
implementations to resolve dependencies and populate vendor directories.
Add common dump and load function for SRC_URI files.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 meta/lib/oe/vendor/__init__.py | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta/lib/oe/vendor/__init__.py

diff --git a/meta/lib/oe/vendor/__init__.py b/meta/lib/oe/vendor/__init__.p=
y
new file mode 100644
index 0000000000..d9a22a91ca
--- /dev/null
+++ b/meta/lib/oe/vendor/__init__.py
@@ -0,0 +1,28 @@
+from dataclasses import dataclass
+from typing import List
+
+class VendorError(Exception):
+    def __init__(self, message):
+        self.msg =3D message
+        super().__init__(message)
+
+    def __str__(self):
+        return self.msg
+
+class ResolveError(VendorError):
+    def __init__(self, message, localpath):
+        msg =3D "Resolve dependency failure for file: '%s'. %s" % (localpa=
th, message)
+        self.localpath =3D localpath
+        super().__init__(msg)
+        self.args =3D (message, localpath)
+
+def dump(fp, uris):
+    for uri in uris:
+        fp.write(uri)
+        fp.write("\n")
+
+def load(fp):
+    return [line.rstrip() for line in fp]
+
+def determine_downloadfilename(type, filename):
+    return f"{type}/{filename}"
--=20
2.39.5


