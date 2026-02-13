Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDAF1EDF171
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 14:47:53 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.58])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.72947.1770993155159368996
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 06:32:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Uh8/c6T/;
 spf=pass (domain: est.tech, ip: 52.101.70.58, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sao2iJGeAU/Lt0b3QKArjbrxLVU+CShMn328IBMzMA8nsa4VKEX45rtSunb5JY9E7g5qPCBLXLZm6b54GUGEMTqyvpY4doLG42gBojgQ/h5N7qwtZfSxNjadxEyHhXA+mTuyH3e1hGm2KDjRDSxyj8b4MMXuHjoDmnk101Rc4xs32QUDSCb80pC4hJSyGiOGrm+QkLmUYMuyMR9HbtHOQBVdormY7e4P10XYT982cPHOMFmBnPwWwgXOQCUZl3or5hS0t+rY6BO96O5fpH1sAVMVaFF1M+bcXikA5O7r4fgc2L0DOsi5t4wjPzadp0RuykUN8rcZ5++LnoKEaGPWJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c2LNtbVimA45ctBEBEEABzCz30BGhrvKOK8zE+lf6MQ=;
 b=BRBHRH6yKbSH2nwcdjHjaesH//lfUBVgUc6ORLSzjZg5Om3llOxAbL0M12tO8WO8+z7J2/GUq2tXJX8itt6f1P+Xpv9YJgIjwKUbwFk3LifrJEIo7gzmsK8ZWW5rE55566zSNUOYN8pU+mFVnNa2ao5MgQNzfDn8hGAkaLE2GSVPFUKailAI40glz+cFQardTOKD+8p87S+9M97+0nSlcMfK1Jd3kvIQsa7kBAWGkrD4TUbGOX29VNUeqc2ktVlt5/VRwFH4IMorKfcSfS2H+w4KFvJH0mDr9Nhf3Mewk/mow9BQ47UlTEWZNlxTEVkYIAwtWTyz4eqHE7ObM+vQLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c2LNtbVimA45ctBEBEEABzCz30BGhrvKOK8zE+lf6MQ=;
 b=Uh8/c6T/ZRQZJAN88HcZpU6rAYRc64wE3ZxCjaYQxDNe8sKNMxo4dA6tOGgYg86FlBC01QQB2NiEIHzoifSAFAtVBU+BgZPQ3B8h805nN9dJdhdgisLDyVAWB81QFL1w140I1OURdN5WlPgz+mQG1JCgxUYDf5kdYcPnL0irDF28mstdx9tV0cnJzLt4QV1mpgNOkuykY0baEHcU4BSeYO9KK4vLiv8ax2KsBr+cTHrdNWpcrRQddhz+fEuehZQNBtHRel+7c9VxMw6k3SWe8Kpxz6dq8x4QrRDDMv+LDoqLQSzeXMNS07fLb3iy0LpDpXkPjsUHgYbuttARKuTLMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by VI0P189MB3616.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2d6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 14:32:30 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%5]) with mapi id 15.20.9611.012; Fri, 13 Feb 2026
 14:32:29 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [OE-core][master][PATCH v4] python3-pip: Backport fix CVE-2026-1703
Date: Fri, 13 Feb 2026 15:32:20 +0100
Message-ID: <20260213143222.102757-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: LO3P265CA0010.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::15) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|VI0P189MB3616:EE_
X-MS-Office365-Filtering-Correlation-Id: 709b7088-4323-4d0c-360a-08de6b0cb78d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6kUVEY+3htu3Ck0s6JH1UJrIySrZbY7cjNBstgc6l6EFEh9ZDl6t18TcNlex?=
 =?us-ascii?Q?wihC1rPQUkKqd0WoQPrFjJ4lWU+WM4kE91WMnW48uvO4qlmL1MGaSbeeOwRO?=
 =?us-ascii?Q?1y1TgKQAhodGyhSL6TA7ikaVouuruU6qYTszgXud0Y+j4SJfc9jVqWH9xWPk?=
 =?us-ascii?Q?FxCyDkM03+3cDWiZRTPNrftF7od9Ckm/JXM66YD1uon76tW3NkJCnDPRYegZ?=
 =?us-ascii?Q?iVKgDvT12GS+poaamkd1pW2OEJ6Zf/IXEivhRWM+5KVwhRaSQY1v4YT9QLlL?=
 =?us-ascii?Q?tLka3cL3AuxzQjfBuUW+TJqZFSeX5JF0UvrhyIOLXkNrpKqfgp6mgV4JVYUe?=
 =?us-ascii?Q?hPh1U2+KStakgt8e+4pHHL91B1TNcOKitNKbyPDHNqpeuxYZ8MaHP5x8uw2y?=
 =?us-ascii?Q?TDygHRzNKix9FIboxFMUeCHb4vQs5GnxI76P5B3W46enbYZ+feaeZLJbF5P3?=
 =?us-ascii?Q?thz8r6SyHeB55x4FAm36BmCNEipHcGt7hvaxaJnzeShM9WV2s83wpLllu5+Z?=
 =?us-ascii?Q?zzwXrb9EwRhV883xAIn3H/Zr1Cfnz3nYxbyXSXviZIk+6JojsCr+gxTkBRD+?=
 =?us-ascii?Q?eZinmafgSAViHFzV7NgRJtm3Iy89j/gNVlfecjP6/FQNZ0DVBTIAudVuSTHG?=
 =?us-ascii?Q?T69+hi8Ze3TqAsf6q41LFDzvAB0NtCJ5iQzWyyZqd8ktvDTDjGRG7J7Z9vAh?=
 =?us-ascii?Q?z1XMz/gEAmUY8iNjn0Oy67+Ss2iPalLeBm7TnzeSZNKzGwFzJJTGGGZLaFHT?=
 =?us-ascii?Q?Fk8k1LkyBhsPSlxzjiDaosGVPq7fWtB5A3MGZMR01ZLQMB7EREWW3QLW7JKv?=
 =?us-ascii?Q?Xiq0hUr4d3wRzQaLICxbyFRP6/GV5JC9V8pGmqWXxDkyOiB+w5wSv2zICr9i?=
 =?us-ascii?Q?simm+GX7M+IH/cZOyAZcDuFwVrGkp/E8CcGujZOLr7lAlOiGLW9MvRX1jM0z?=
 =?us-ascii?Q?VBpYFAm6Wn64H4m7bXHztRx8p5AW6veNVTvwPMyEIo+I0NtD6ifdYYV7OH/A?=
 =?us-ascii?Q?y/94Nq2k015VOdmP7pYVwnCF4MUkh4iPJl/SdtgC/fQVjqCSiNNbEoSLi4es?=
 =?us-ascii?Q?42E+LpshKYaotYe47K7+3LfitlWXIhZ3YMJC06UR/U5k280SYe+GIxa50OYz?=
 =?us-ascii?Q?OA6uKE+qN4ZYEKaX1k8qwcAaHJT9mekX0vCeai22UifrBw6a0yuZ/lQIn13D?=
 =?us-ascii?Q?phSeebAle5qm8tm7eka0J2zpOIwlb6S9iLPZp0WX+GeDU1FJ6u1SGftS4ZvE?=
 =?us-ascii?Q?QsQwLm7Alrlyc3OcdI5ZN+Y8kOKbu2DnDjTK89YXoikpRfS+5GlOJWtUzqzg?=
 =?us-ascii?Q?250tLFxcDcDNdeFO4k5VY96kiwvexCVyOIzqTOI4Ys4My1JqJ1oJ/+fV7miC?=
 =?us-ascii?Q?Y+caDKsHOIDVdufuFddwx710kxXQCbsxQL1cuAEkw87Gya/atHw1uk1s74zR?=
 =?us-ascii?Q?JfyO4CIbDPoejTO6JW0UshYs8PYRqGd1/pdZQF5r1CoomT4Ihiph1QdIxp6i?=
 =?us-ascii?Q?lCz+17IMYtZXrzCTau4fHqMh2rkd06M8yXJgUTz/P66+0uOtbVBjGmtXD50I?=
 =?us-ascii?Q?bzG69uuKMDw77EXfRCI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mIbRgiCSaEtfcoluPdqGZaxCUTEc0suuM8VQ8zB6MOV3jOZuDr2jURIbUqwv?=
 =?us-ascii?Q?xoySDmdHWa1TGXrpe/uk1kcH+HBmdJJ7SbnjGxSS6SlSd3EUOZ8pdROlrlWx?=
 =?us-ascii?Q?NdOAhlaRuAmas0K9OCmD7eEL0eDA1WYtm/vrgsuBeYWssyXA3J78uFBisttt?=
 =?us-ascii?Q?aW8zNe7mUNZxhmyLPMBQYIYM8gPzmbSV7VJ0pWIEl9oNgPIT9f/lgbRg4aH9?=
 =?us-ascii?Q?0qUQzKh77RptPrzIfh5TSzgBEOGkS8oyk9cGNzkhDQoLzRrcENoyEATcRey/?=
 =?us-ascii?Q?9naWs4to8uGI8Ag1B3kDkXsmu+u+Wv2fbg5N3eRFn39fG4EsiDrnNhwW8f4g?=
 =?us-ascii?Q?UONcbQuNvcrj10+HKhMWf8u1iwrJ6I9bHML5ilFQ3WuYCbgL9DoDpTJlq8FG?=
 =?us-ascii?Q?/I2LdZ0u+rOvU8uO+fgT+6ilz9p57WCnZJhKajd+Qwd9Cgw30fxSSow8cR4I?=
 =?us-ascii?Q?uZM/RbYOUjh/32PUEaF5z8xLvP9GXr1GdNfTrGHxGUxcbPLODxSEr7UXKFzF?=
 =?us-ascii?Q?2/vikiYZ2mYpuOU/IdJ4qTGUdktxcDjB3OTMjPcREPPe1HLSc8t4028mvN2R?=
 =?us-ascii?Q?BnApJk9o6kK43FlP3mFGrwj4220CO7D6cDPQk8mjJBDGCAZ8lNwhb9x+lwVF?=
 =?us-ascii?Q?af9MItD3R/32UGHarrSLSiS6bWZiooWVVoXLJImgy7q3T9Pw2W3LtnsGb43+?=
 =?us-ascii?Q?cXB0ScJnmRWlwLb2C3+vfpQt0xQ1aBejaPi6BkP8NhH2dn7UKMl+Eicw+7OC?=
 =?us-ascii?Q?EJVIrhsU6aSO0Wo7uF/ZhPmknGHOIVIVcQnWHxYrZ9yJ2g4WgEczVWNyViOx?=
 =?us-ascii?Q?F0VKQxsyTeEnixfgmovMiFeD9IpeUgrM8YCe+Tyo9wd3Hwc9jBKLxUVdqGs8?=
 =?us-ascii?Q?DFOZVG8unhI9g1CCRZWJGbnKUNU4Vb4/VDX+couvkWyRCwTaZMIQK9TdN4Yw?=
 =?us-ascii?Q?OiHCIk+gbPVTO4J2bcb2qZR33CmUoDSFGEq01h6Er1iPVbla9hXI8e4CF82/?=
 =?us-ascii?Q?QkHJkn33GTu2HgN+PMWrq8uQ7nmCSBSnMCLP1fM+LbQhfjb5kY0zgfCf3DXw?=
 =?us-ascii?Q?/Q0otCL5+2qWHIU7zEiSwHgUrW7dZL4eEi0XlxT5RPf60C9hb5PR1A0Vu7o7?=
 =?us-ascii?Q?fs6gFeG+AXcZF2x7D4T6gVMQlf8cj8+kttUxy84m8pw+fcMaXH/eOKXm6liR?=
 =?us-ascii?Q?8N/yBTRAL9DEEdqBx8J7mhhfrN5d0d4637KXRrbIezwAJR9mVkbIIH282lJF?=
 =?us-ascii?Q?P/YHdPAAzIhleRvVcJZetfxkw88At+8/bny/NKJv1/KVxmVcN4IpIghNBIAm?=
 =?us-ascii?Q?Qw5p4mUQJEfu1+J31rRgvNKlxxaUl7M/N7zyUNzNquShLviaGKVwNwBP2Ry7?=
 =?us-ascii?Q?v55ZLnzzAn5eFJ2tu3g9iz7lYNWOmQ9x2WICUql0W0CY65AmRDJrrm5CFM+N?=
 =?us-ascii?Q?JCfItuKrfXRtLMl10XY9OH8xczwyXTuwv2vCPssMagt58hL0VUKqdLglWlWX?=
 =?us-ascii?Q?UkClTsIRbS6qYCd8ECNqRTmFyVpHnndGeZVynnNAmkIyJnlmgNBXREoSBi37?=
 =?us-ascii?Q?G2aatkb8IlQWwXiAm7zfkMO3GImZzIgT3GbS1xqjPeKmnNgdQTr/eFtT0zsI?=
 =?us-ascii?Q?vXN14/d7XE2uBdLCAB2pkViF7lm+reclntf4Fd0j63uD8mcCxUuXC3bcdi+e?=
 =?us-ascii?Q?OGkUhQt+GqpQXYq00IawDSS/bpJPa2PG6oDXdxk/+2O4I4LRTEEtfLzM+Qgy?=
 =?us-ascii?Q?mtZc0MQsxbJW6GHng1oeKs97nD/i8AkA+ESWjidqQAXTGd5+B11Oian1Tn3k?=
X-MS-Exchange-AntiSpam-MessageData-1: bcR0SbrTpf0eQvV9ohX10c/Efj48Q0FoHio=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 709b7088-4323-4d0c-360a-08de6b0cb78d
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 14:32:29.7999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7YsZQ2f0OIijX9OjnRl0k3kQOHyekfua5jUAZO89VWmS7YcEWNfAuqd+TMnuOBqflZdoGJVy7u+/6M6DHeZReuVXh8QiQZU7YsMRpYfeKxY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3616
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 14:47:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231121

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Include the patch linked in the NVD report: https://github.com/pypa/pip/com=
mit/8e227a9be4faa9594e05d02ca05a413a2a4e7735

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../python/python3-pip/CVE-2026-1703.patch    | 55 +++++++++++++++++++
 .../python/python3-pip_25.3.bb                |  4 +-
 2 files changed, 58 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-1703.=
patch

diff --git a/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch b=
/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch
new file mode 100644
index 0000000000..fa3ecfd6d0
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch
@@ -0,0 +1,55 @@
+From f3354dbf1fa59895cd06f310064d57b73f05426a Mon Sep 17 00:00:00 2001
+From: Damian Shaw <damian.peter.shaw@gmail.com>
+Date: Fri, 30 Jan 2026 16:27:57 -0500
+Subject: [PATCH v3] Merge pull request #13777 from sethmlarson/commonpath
+
+Use os.path.commonpath() instead of commonprefix()
+
+CVE: CVE-2026-1703
+
+Upstream-Status: Backport [https://github.com/pypa/pip/commit/8e227a9be4fa=
a9594e05d02ca05a413a2a4e7735]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ news/+1ee322a1.bugfix.rst            | 1 +
+ src/pip/_internal/utils/unpacking.py | 2 +-
+ tests/unit/test_utils_unpacking.py   | 2 ++
+ 3 files changed, 4 insertions(+), 1 deletion(-)
+ create mode 100644 news/+1ee322a1.bugfix.rst
+
+diff --git a/news/+1ee322a1.bugfix.rst b/news/+1ee322a1.bugfix.rst
+new file mode 100644
+index 000000000..edb1b320c
+--- /dev/null
++++ b/news/+1ee322a1.bugfix.rst
+@@ -0,0 +1 @@
++Use a path-segment prefix comparison, not char-by-char.
+diff --git a/src/pip/_internal/utils/unpacking.py b/src/pip/_internal/util=
s/unpacking.py
+index bc950ac93..b3f52e85e 100644
+--- a/src/pip/_internal/utils/unpacking.py
++++ b/src/pip/_internal/utils/unpacking.py
+@@ -83,7 +83,7 @@ def is_within_directory(directory: str, target: str) -> =
bool:
+     abs_directory =3D os.path.abspath(directory)
+     abs_target =3D os.path.abspath(target)
+=20
+-    prefix =3D os.path.commonprefix([abs_directory, abs_target])
++    prefix =3D os.path.commonpath([abs_directory, abs_target])
+     return prefix =3D=3D abs_directory
+=20
+=20
+diff --git a/tests/unit/test_utils_unpacking.py b/tests/unit/test_utils_un=
packing.py
+index 003cce148..582da9722 100644
+--- a/tests/unit/test_utils_unpacking.py
++++ b/tests/unit/test_utils_unpacking.py
+@@ -412,6 +412,8 @@ def test_unpack_tar_unicode(tmpdir: Path) -> None:
+         (("parent/", "parent/sub"), True),
+         # Test target outside parent
+         (("parent/", "parent/../sub"), False),
++        # Test target sub-string of parent
++        (("parent/child", "parent/childfoo"), False),
+     ],
+ )
+ def test_is_within_directory(args: tuple[str, str], expected: bool) -> No=
ne:
+--=20
+2.44.0
+
diff --git a/meta/recipes-devtools/python/python3-pip_25.3.bb b/meta/recipe=
s-devtools/python/python3-pip_25.3.bb
index bbc70e3eae..829a44cc64 100644
--- a/meta/recipes-devtools/python/python3-pip_25.3.bb
+++ b/meta/recipes-devtools/python/python3-pip_25.3.bb
@@ -24,7 +24,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D63ec52baf9=
5163b597008bb46db68030 \
=20
 inherit pypi python_setuptools_build_meta
=20
-SRC_URI +=3D "file://no_shebang_mangling.patch"
+SRC_URI +=3D "file://no_shebang_mangling.patch \
+            file://CVE-2026-1703.patch \
+            "
=20
 SRC_URI[sha256sum] =3D "8d0538dbbd7babbd207f261ed969c65de439f6bc9e5dbd3b3b=
9a77f25d95f343"
=20
--=20
2.34.1


