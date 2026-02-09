Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6995E94618
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 22:30:19 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5620.1770672313789120035
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 13:25:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=guqXtGk0;
 spf=pass (domain: est.tech, ip: 40.107.162.66, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tYcn8f4HxCziXgaXVIIY2DtLmnQDaCCOmf2GVNAup8TxOZiHlDhh4qM4OhokOaBUqHuyvA0IYNByyf7nNlWe6cxSNVW4/BVwjklsR/bGrb4Uv5ZcfQv3tdzeu3ToEmjar4pbHstaH+0boXh3Nk4fZf/OnQbNKAG9OF01n/HnLnC/h46Zg4RlMZQwrVnPi5LfK5ncAx0wGek6GBf69/Okjch/Ica9FdU8qp2qVpih6B1mnFLDWyvVMUOZHMVJfcIKgpkHFOBStjm7z+meP+tqnKyciyWfv6uF3wPEjZgvUNzD/Di9WEvrErWIOFjGzgHiQpJ+MQ5yGOqnFs9JwB2WuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wQLpJapQDU9GSNRh8fE/kGYNTwvex7GVr4jrk4dO5A4=;
 b=vu/VKjckcmJYPffmT4a6XyNK/fK5eKlO+u5BKH7K+ymv9F14rzbgKt4ggoA3t3XGwy5SoX4wjLa4TdkrBjeDoby493iSRzr13zO7B5nM3iJJ8T4SSXPGQDU3aU9tHsc9FrI58Opun7hlb0uFFWn1gBGAKZiZB0s6/NYoYIyS5cMaIVk4RBQnVxAVPOoudtjeHRT+U6qfXOydvIClcB9L0chimfXyg5vugTsQAHaPWdIEGqiT+jLJaotEbQ+AJGTAP6/6OpfkabIGJ3tY1oVzubLhFpKD9eZSmCC3hpflUjHQ4oapUKwN5tuvQnthmHuQgw9ADm6arcQhgkaxMFAI/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wQLpJapQDU9GSNRh8fE/kGYNTwvex7GVr4jrk4dO5A4=;
 b=guqXtGk05Ab69x+7yjzxd5IZ14hmgYXH3MB/U3HSSBmLF+GW8ix6E2P98AgIJ1E7ktr1o5B5BskASQ9wOaJ0vb8GzSxzyNAxqQlkiPeKeI/IvwZoPcEQN/F1C51t/iixoCgScl9ZZFgew+MuB6Fj+3aiiVrGtWU9Rmf+UqN6JGhtSZWAHJmMOvYbDgcSRWYISd+RLa55IhmD/Uz3XOnmkghojT7JK46RG+ORmM3Xi4YPO9zU3PfklOrXr8WQJD54MJbAcwpIAst3LJ5jgZn1bmNt4pS8/SuJc0ax9mRM+XcAYLHmXcpSyawhi0IFQaC+BQvM4m5CbzlMbSu4zFWq6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by DB8P189MB0778.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:122::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.17; Mon, 9 Feb
 2026 21:25:10 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%5]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 21:25:10 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [OE-core][master][PATCH] python3-pip: Backport fix CVE-2026-1703
Date: Mon,  9 Feb 2026 22:24:59 +0100
Message-ID: <20260209212506.51439-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: LO4P123CA0131.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::10) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|DB8P189MB0778:EE_
X-MS-Office365-Filtering-Correlation-Id: 30c254b1-4f07-4595-905a-08de6821b410
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|10070799003|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?M5dNEsZZvp+GetP6ulx+x9BPJFQwzG2/RM8dbSii6BOHTa8fi296C+KezB9o?=
 =?us-ascii?Q?JqYOvke8W0MrqV0B763d0mqgNrlFWmh+74iol6BqTtpnltS8bswXCtnzF6qL?=
 =?us-ascii?Q?KW0cP71djXvIhlI33KCyHdsBvByCCJ7mA5w6gmZGum4oDIIdC+SJ9Ff2GlRa?=
 =?us-ascii?Q?oV5ciPAgEZ+cG60X8p25KZELf0l84qD0kZq9odpoa2swfshOGKE46oCKjRI0?=
 =?us-ascii?Q?zvaV67cEqSqMXc3b9jTCWcWtukE2mLEST41J6A8JwuON2HwyYTqRzDU5KgZR?=
 =?us-ascii?Q?YuesRhQp0FiPk0A70oZJZ+e4AFUBe874H3xVlidk2+xMHgMJyUNflnzyaYIp?=
 =?us-ascii?Q?XjSyy6+dQgfVo2PlF5AiluCrJCeb+hcJt4AZB2JOkKUcFHpr2N/8ICBQcDIF?=
 =?us-ascii?Q?/ZTgqTEPv3gHUeLX37Ze7Sbyvnh4FQ3UVPXTD1N6mAD/U5ogFlyRQkV0Ca3w?=
 =?us-ascii?Q?zfaQUsEhNR3dFiRrv9d2UF2m97tAGAgwOHXib57cjWMkZQjHROwld2xKf9Pu?=
 =?us-ascii?Q?7v6l9qU6pNNVQeAPfqI/Do/o1yLT+SkVMFkglp1wCHj3yXtNCWx1aFixmZgk?=
 =?us-ascii?Q?JigaWaIMfZ4t0Y84AlvjZdOZ9tMDwAgVOG/PYf4uzQbgPrC/GG8UY7zMdbbV?=
 =?us-ascii?Q?W1yGiOv+YX8OxBiXS1BVStTuceiy2m9xj/Im+jZeCYumPLLHcHVHvtFiA+Jp?=
 =?us-ascii?Q?vLYXPeEL/L4+yy0tbc9yPPT0zYRJbUU03H/M0H8bNxq/WHFTdbFeeXuCq1Fn?=
 =?us-ascii?Q?nm3CNkCXe04Ebhlavxjg9YLbPKaRI3a6ZlwUkrsrtlcgnkh0rAmhE3IsxMin?=
 =?us-ascii?Q?4T5JN3ER9GtTDL2oZZhf3cg01s/Z7p0J6Fd/VtjRxG4NhL5ohdx4WMR2DpYk?=
 =?us-ascii?Q?qTLebeqIvS2bsQ+4uJ9q/aI90TYsIkVt7mCgyAfPbd7l7IRFDLeGuIqwkBXq?=
 =?us-ascii?Q?BGs0Bz89E5gKJ2oMCEKTf1FF+MtY8BDkHA1seQpHgP+gE+Mp3HOhLoazfjN7?=
 =?us-ascii?Q?pvsQfYpXndByquuYMQttLoM9YGIy3+x6gCeTErcjN+3mC/SWJJD0MHGuL+rR?=
 =?us-ascii?Q?Rf2pWFTMSVnNtckc+tXxhgsBdyvpfAJKaLUcEweHakoMLlpAOpFI+zrpO5fy?=
 =?us-ascii?Q?YRJmg2C7Ai188le/8GuXyxMp2MKCOVsgkhMZqRXYLkSDqw6SVyZBetkoVvl+?=
 =?us-ascii?Q?bvvKSzrZt71MAQBWHHcAjkooeB5h5UvxcQnEXOOwN0Oi5wwQZ8xKlAeLGJkS?=
 =?us-ascii?Q?XV5sYHBIUc0UeTi6rL5CKS6xd3w4AiZSWST32gjA09eKO1akQJViVaIpyT+m?=
 =?us-ascii?Q?2XotmZCrXwbwFIx4BxBA09PMW2OlDIMpOTREY0eTFsqV3MPEZKSaN5zca+h7?=
 =?us-ascii?Q?7MYSOksatozcOs2WWRe5DVwFmnEelwvB5PSnbQjt1mQ2zmXkGkw/xsKx1vVL?=
 =?us-ascii?Q?CLqVySE+BgH25ymUN1MDbpUb5zO9oQTsR2/ouao25kYjQJ2oPWMaqicx4qOR?=
 =?us-ascii?Q?zxgOQee394tsawAOu1gCI692ekNaN39iXies?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?n0iQ+ree4jRKpisBYuiSJYFBhvX2b1EsL0QighT29R64vQ0xfzY2CuOTxZLi?=
 =?us-ascii?Q?ovsYI8NfeDxG1iNM4c15c2afcx2nqB/yU3Ap1XKZnltup2QfuxcfuzqzZgt3?=
 =?us-ascii?Q?iKU38MO/Su5GRCThtkjdlOuLtezHN0Q5avK1Mapytc7xyjTTSpFwnqPzIrbC?=
 =?us-ascii?Q?DUrFMMv8v4m4AnrvHXgMW709bKl3wzv0DE+waTPzWJ8ch30a/vcwWcPxlK1b?=
 =?us-ascii?Q?grNOoaLsH6Y8Egw/kPEf4iX5yiLgyorJCQWQfMKlSLBoRZIcSB6mY9nAxSWH?=
 =?us-ascii?Q?Cmb+Cb4Pr0vJUYOxA0vD3dFQONKkxG5GraEDQegkskrTX0xz3mhyscmeAGpR?=
 =?us-ascii?Q?iOPYMaZOlQNrOkBAN1+vyXEfmtn+jwW65J7JBeZtDZYxfVK23wriw/fvHf7e?=
 =?us-ascii?Q?nANzgaTmXQ+X9O0GtJX8baYkrReOAsM4/6/63u+FIUqVXu5dKnmp9TGIgO5K?=
 =?us-ascii?Q?bkaaAzJjruva/7yuc/npyriu4A3NmMkjju6qD2SWlmdC6fMAhQHl1lzhQbXF?=
 =?us-ascii?Q?c0FirEyH9nQU6HuWU/T8ONUegQLhm+SlFIVmIsEJ06tPuoqIwRJ222SPGH+N?=
 =?us-ascii?Q?bpbKHfw8PAGUYhgIEyYb5cg7F4VS8VEhQz7rwXVNCzAL429/joMU+rJXtxgD?=
 =?us-ascii?Q?mioSCNuNbJDo5THk13XX6VKyVfPqjkpScDguskqyolxQrCrGZWjh7NXFmGEc?=
 =?us-ascii?Q?bt3RwXHH4SY5BjDI6bD+riEVHHhKkDxdjGw/5mrwQMzRx8F4h0UH4v5O8BjB?=
 =?us-ascii?Q?MCIu3kwmN9f8bPcdH95hXB9AWSGxj60hLLFHA+TrlRzU94ek0CeVDWAbrEIO?=
 =?us-ascii?Q?MaSVuRqRjZaa/HKCmIR6ZmasOXYkNPUhi7ASAxQ10nuDjkHDeW/8qSd/DTe/?=
 =?us-ascii?Q?GfCSleyVRFpnJXzrtfCto2fv67IHYxFRbhf5KDQTQmk1oqDTItTl3z3z3rgO?=
 =?us-ascii?Q?DPHlb+slJLcHYd3D/KJz67nRkRvTDWbXJ3/tAkvNWLLleHiRC2wQqe+VHScy?=
 =?us-ascii?Q?7rwTc6vF/wX70Y+HlodOiPCh0yUxX6YKT6nWyKwdj8ZoNbZS8k3ibqUFibuJ?=
 =?us-ascii?Q?fEk6jnRUk3F0cGOBpc7zgCKJd12ihaXbfu+A2JFdJeRxGnFlVigU7CsQpYBw?=
 =?us-ascii?Q?X3pScc8IK9Uy6dJoXZnzwUi+HtdtpDMyVQXWBUWdYSlP67j2zPvuwN8LTsnd?=
 =?us-ascii?Q?eZjQju7yGmTEPoGFYs2HxaLuji5vn8UvNUDtvR/TOS3uReUvdh0B17oczRwS?=
 =?us-ascii?Q?jnzBPxxJXVIdYEHmpMXXse2ROcRo5Doz2PYrN3Tm4t4aP2FhiB6QsfRdvhGg?=
 =?us-ascii?Q?fjZesEkE2wWbv89KvervXbLlvV54ouDkcRZs4UEKkl1yTjUeqWy8ieIi2OPb?=
 =?us-ascii?Q?figeUF98jecVTARr8q1fvrKgtOvB5aDYThEhKnqcvynh9q6aM+etRGVjxzwY?=
 =?us-ascii?Q?D0h1ywjn/EsrK8ISE4gVUy+wZc1gmVjVc3ylc1LCqhYS21X4ChpCOwAd8rD4?=
 =?us-ascii?Q?PkqZlU4Xhb/4nt5VkcguuvFNV2s7NCN/ljggkdWSGrRdZwPjY/fzHHU81abQ?=
 =?us-ascii?Q?+Dw+z5Ee+lZQPNjgra4JxyRiAF+J4m3IFJuFpdfMp47b0gbQsLewi8aHXr+b?=
 =?us-ascii?Q?ZHnw7J9Q67XJnl9FjYQhehCHK8D8dbU7pcUS+o0Pqb28jNjv6WQ0m/MFrg4N?=
 =?us-ascii?Q?7OFKqmSnaK/MKNayfjGBNi9Ac6vi5UMIrOdosUcH7C2x7/GnvVHPq3EL+3Hs?=
 =?us-ascii?Q?n4f0vtNKtOeQI87XZAk0WjygEs9ASg0btBEVZEeuqWfdqXMi5Xb0MIH1latJ?=
X-MS-Exchange-AntiSpam-MessageData-1: 
	5sWn7vJAvrolIa3AmZJ3E7vT+haksw1suXKGO0XLMpTYLbrXSneZn8Ur
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 30c254b1-4f07-4595-905a-08de6821b410
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 21:25:09.9983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zTATYrfq1KE9YSltI/PhmUS7MKRgcIh7+OUKWPVKIkR9hEEzE7qceDzHunBzmm8uvp2S4H/6wvQeNHth0sSkgIZlxGj6EKgyG2M88lvGgNA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0778
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 22:30:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230816

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Include the patch linked in the NVD report: https://github.com/pypa/pip/com=
mit/8e227a9be4faa9594e05d02ca05a413a2a4e7735

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../python/python3-pip/CVE-2026-1703.patch    | 55 +++++++++++++++++++
 .../python/python3-pip_24.0.bb                |  3 +-
 2 files changed, 57 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-1703.=
patch

diff --git a/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch b=
/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch
new file mode 100644
index 0000000000..8d34d2acb4
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch
@@ -0,0 +1,55 @@
+From ed41e052ebe78fcf043c43ea05bf16f73dfbb581 Mon Sep 17 00:00:00 2001
+From: Damian Shaw <damian.peter.shaw@gmail.com>
+Date: Fri, 30 Jan 2026 16:27:57 -0500
+Subject: [PATCH] Merge pull request #13777 from sethmlarson/commonpath
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
+index 78b5c13ce..0b26525fb 100644
+--- a/src/pip/_internal/utils/unpacking.py
++++ b/src/pip/_internal/utils/unpacking.py
+@@ -81,7 +81,7 @@ def is_within_directory(directory: str, target: str) -> =
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
+index 1f0b59dbd..724ca0be8 100644
+--- a/tests/unit/test_utils_unpacking.py
++++ b/tests/unit/test_utils_unpacking.py
+@@ -202,6 +202,8 @@ def test_unpack_tar_unicode(tmpdir: Path) -> None:
+         (("parent/", "parent/sub"), True),
+         # Test target outside parent
+         (("parent/", "parent/../sub"), False),
++        # Test target sub-string of parent
++        (("parent/child", "parent/childfoo"), False),
+     ],
+ )
+ def test_is_within_directory(args: Tuple[str, str], expected: bool) -> No=
ne:
+--=20
+2.44.0
+
diff --git a/meta/recipes-devtools/python/python3-pip_24.0.bb b/meta/recipe=
s-devtools/python/python3-pip_24.0.bb
index be4a29500a..83f8d869ac 100644
--- a/meta/recipes-devtools/python/python3-pip_24.0.bb
+++ b/meta/recipes-devtools/python/python3-pip_24.0.bb
@@ -31,7 +31,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D63ec52baf9=
5163b597008bb46db68030 \
=20
 inherit pypi python_setuptools_build_meta
=20
-SRC_URI +=3D "file://no_shebang_mangling.patch"
+SRC_URI +=3D "file://no_shebang_mangling.patch \
+            file://CVE-2026-1703.patch \"
=20
 SRC_URI[sha256sum] =3D "ea9bd1a847e8c5774a5777bb398c19e80bcd4e2aa16a4b301b=
718fe6f593aba2"
=20
--=20
2.44.0


