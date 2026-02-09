Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC8D5E9461B
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 22:30:19 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.38])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5559.1770672240625689687
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 13:24:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Z3JsuZWf;
 spf=pass (domain: est.tech, ip: 52.101.69.38, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qTosKB/lfp45qcUjc8GrMyEKGAqLtCDSHevGwaNjdlgRqvzvPDb3rzUJosaHgywNAhucGdrTStH37xFpNPOj/MCjpmy9uwUDE/2ONTZKobdElavgmMhhWTGS1fczfT7cRzdV9E6lUI+ZA/LhEUEU4gmop6LwY4YwGl/5imm3fYuUSl50SzVuAl8FKENzeZCa0LWA37GeOQp5f0b/PlaW8NOpci57sRRWElBTgCZPBKfPJOp4rqFH+WEUXzdiIzSzLlL0RqaghDFn2O98bEauYVUKUzlEr0mPJsG68PDOVfTr9qKjplWpson3W5Kh2SejqV6vJkgTaCEHlZttbzb+Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wQLpJapQDU9GSNRh8fE/kGYNTwvex7GVr4jrk4dO5A4=;
 b=w0Vk6AI8vx+AM8gkQcKFZ8EP1cvk6zRe9wKvDg8pfDo24dBZYATgH0QeyOppNLz7q4vqHeQBAClkjjhzZhHBbJljixULGzxM0Lx0BaS0iXz9F3VxEll270HXG73ThC0erNakh8MY15NKQBhi/bcpWdXEoKW1vjfZS0uHMoZCknGrbbmpEVnkrktFBObyA3x1y7xjs6hEgiXy+I3H6U7+k3mLjgcL64mUpGLiEluO/loTTB80+B7sdIQv/M1gPJMF3xhkLBGoTYuJsCTU2WYchfE6cQCQwKRy42RsezeNFDGC5qVKHPk9O8Odg2w1NmTfINlqV1WKGCawXdf0wQaKMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wQLpJapQDU9GSNRh8fE/kGYNTwvex7GVr4jrk4dO5A4=;
 b=Z3JsuZWf5UhF0IAVmW+bLStW3/IabjEaWh/207eBhLHQEPxgFxc5yainUfvkLd7VMG/WTgkd/29p4x/Q62ukVXo+oyEdxG1DA6AYUTlkpdLzJ6QpHr+gguiBsP9SPwNCMAA1ihoOIphQWlCqAwDTrHQgiU0xyx03+X1/SjK0QAitO8p0OA5aFkRvfyg8FhXqF3UJcTEla/hZFnD8jqvknOxquMt+D0TpVJC6La3CSDssbf08owaJRcHZZjKg3QSDQvFM4/t8gIUuMVjcMIPpzssddR+mHTYIIeuGDirEjN3eiGl4bqDAzOO6RQU0RvOX/YLrB5SvfHeOLSAIV2JI4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by DB8P189MB0778.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:122::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.17; Mon, 9 Feb
 2026 21:23:56 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%5]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 21:23:56 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [OE-core][whinlatter][PATCH] python3-pip: Backport fix CVE-2026-1703
Date: Mon,  9 Feb 2026 22:23:12 +0100
Message-ID: <20260209212346.51254-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: LO4P123CA0318.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::17) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|DB8P189MB0778:EE_
X-MS-Office365-Filtering-Correlation-Id: 50609f58-55d3-43b6-2e53-08de6821883f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|10070799003|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ywIs+m8FG7NqIGgcdcSuYZYTu8ryp5HePAR0dQwc827CXFLVk7yQ+CK+PhfI?=
 =?us-ascii?Q?sV+NSkdvsFylUev5vdRH3YsJiajiV5QSXfXpw38bVo7A0JUxqRabl5Sd9sxd?=
 =?us-ascii?Q?9dsWfl16wfvumHicvl4a6ihIesJD3O1Ars66kvDmOjhpEpdB53NIg2q82SFO?=
 =?us-ascii?Q?pi0kNKVM4E7mHIqsA0mILW0wOXZRMp6IDONynFKqGRL6fRl/XlERCz7stZmb?=
 =?us-ascii?Q?fDDAZHbBI+9Y1dfP3m1zkr9FNvyLWiaVGKQ00hEvlbvnsZeWXcZ1CAREdIpk?=
 =?us-ascii?Q?m7rARgIDAy4H1332y0KiwvcJhSmqSAGK0CvPLl3Y5YF7PIVm6iugSmirDHc2?=
 =?us-ascii?Q?Capj9EPHwYaF/52GAzpoXc4tv1+eUvqWo+PC4yimSjBVd+595fNQeQ7hDtQr?=
 =?us-ascii?Q?o/BmGHUYUAzFsmerS3o6xFZYRRGrspRQs/FNcPgQg9q6OWy4ipMI5ZBMIQ08?=
 =?us-ascii?Q?SZuZ00LlxCrerqtTnWAvNFgAG6zU2B/cC76WA7lj6LbRWu2z7DRlU6Mt/N/S?=
 =?us-ascii?Q?oNuAwxlwk/IhSSD5pTSbgcV0xsRYplOKT424ZIlKmd75Mmr/EvBSqOFhZWTm?=
 =?us-ascii?Q?DFzTGiWtGGJQ76Y4wuKkUSMbEL4orLJKBtMR6DgP+ebrtIucKLDsJxxftHCe?=
 =?us-ascii?Q?Am+0oYe6aya8u3QTj35RxMj0AXktB5VrubznHYSD2SB8n2A7E3x6gP3Gat5P?=
 =?us-ascii?Q?CHZVF5hTHc3Xet6BqfUMDbjfE3dKQATipwSQL83ZdyUydd2/jHWJwJ9SyRpq?=
 =?us-ascii?Q?zgIb9TpW6J9ho3kMH+SfVN5BOVnBH5Dkvpzp/VpNZpGIEXMC3EUhHVuR2bz7?=
 =?us-ascii?Q?rnWSEOaBdEnphFrvI1CTXiHBi12WQF11Z6JC2AVQLGxPWcQZAX646TG7xZ3A?=
 =?us-ascii?Q?aPswQ3AePCM1PLTC9etDto/3Yj0tzmC85uuuH9tRYPutK828eb8A0vNbMofC?=
 =?us-ascii?Q?JkiwP+A35IIMmtN1O3IbAO36/GQ/gROa/0OOBLCntjrd5pBVRAGXzW0lVmfZ?=
 =?us-ascii?Q?KiZ+mBjMmadIFE/neHOPyy54cg9uUdCJT0kXs37qltY20z/TU02IlaQ9gDS5?=
 =?us-ascii?Q?TY05akeVuAVTtsG35NrbK3C1VTi3jVx0hqfS03BXpngYbTQK6+3jvwjGYP4D?=
 =?us-ascii?Q?58XyJR2Z4oYe1DlLanSCi+F4rfFzKZz2B6me/3X0d2XlbfDYZUNfq64kZ3QG?=
 =?us-ascii?Q?+MOsNcdGbKkUHIEzq12ZE88EHrdg1ndYheHL2bPaFALp03O9B1m+XpuTm2lx?=
 =?us-ascii?Q?4cGYOdiIyDqUO3ZkhYm3iqgyedLLlOH9dP08lK9K5DrEwc6u9AW5mkpQwHCt?=
 =?us-ascii?Q?mjKcrpbex4ujH5vO+FYxtaEfcln9eJmzUcetoJR8IofCGr08gC1WlEJHT14h?=
 =?us-ascii?Q?VU1stUazvTcI6N5RrWj9uzuAUTzbvMrAbFfyJsNWNFLIiDF5kd67W07s+zvo?=
 =?us-ascii?Q?Z2NU4GEtFMXmgAt7KM0c081Mapf8HL1JCJ1ynKw+2+eVQ0/UPOQ2mXz9Q8F3?=
 =?us-ascii?Q?CfBbR+YUUcXU4Z5QCmh6fEg2uLKIcXMdAJhD?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tCZ2gZu/hxPYAs4EA4pivGVyN5UMS0wgDokD0zE0FtgRcayNcbJ7MY7KK16E?=
 =?us-ascii?Q?OkO8UC33XpzjoZwZSLovIRmYp1H9GWGIicvMo7mCUI9mLZXmFOi4quCXXPco?=
 =?us-ascii?Q?5zRzcbO8NAjf6+FQpuOT5MJ6bE/hGP5plQi+I1yv6rCUhaA1ik3STUTn/JKk?=
 =?us-ascii?Q?60hQeryZk/5Olp514uvDOJK9mJIrkDZSRvkkvov2PvTHhny2F3CjT85isPq5?=
 =?us-ascii?Q?yG0oj107HNRqw92vTBnzmIVWrM4t0giuMzUjlHts61hxnNzsy6GCxM3yOq+q?=
 =?us-ascii?Q?vuybL6CdCWhaTDrCoITNuBnNAXojDjEMHuDMYf8G0HI8Hn286lKpdDSis9FS?=
 =?us-ascii?Q?cTfvmj9mSoEPgFbgJeB5cv5jxQIFTjyMIF6CCKkEOwaEp/QMUFBz7C2zn8br?=
 =?us-ascii?Q?th9KLifsC/zlqw8ymxi/D3v4czWo5k8AKJMdA1EjmLzKQhMM6/9qb3jv7Oda?=
 =?us-ascii?Q?6kTVPG59vNRqlnUit8tPPb9rcpyHf0SpXe51JnK7SB+4Zs8ZrmNF891ZhB3+?=
 =?us-ascii?Q?jSSILq88J/2HgJXQZ3FPkiTP2xUMnhpXPcKSGz9+wPCnEH4f4kG1iWTVoJB8?=
 =?us-ascii?Q?zyfbIlVAS0ocP9p6A2xnOQZ5KIhqAMOn+q/D2uz91E6UdPjdJFrJAzwA5dd2?=
 =?us-ascii?Q?97qHeIlTZ1oinWH8kHWlIrXOu3wFCHJkDRSK+VkRAxy9Jq1kpzxjMs7CMluR?=
 =?us-ascii?Q?IpufgqreMtBM5+8HpEeMv7uByWER1fhvtPxtnmrVFyS1gfyXRl1OyXvCeRZa?=
 =?us-ascii?Q?J+q9EpdA4DP+dtcCbBk04pO3g9kroRQmbTAx6QNJdSZf+928PcMNVMgpGsFO?=
 =?us-ascii?Q?y+owUsz2LlW+6v/u5V6csfrfYOQLdY2eHQWaRXooFbz7FjOMwPLhwbw1ubxb?=
 =?us-ascii?Q?fGChCrZDZfMQWkN1l8AeasvAYEyM3T4u1Wi3T2MEtMRmc5l06XEZTbSruEHW?=
 =?us-ascii?Q?zPxlszUE8MdzQivOSTov3nPhCAPwhuPDd+2XYraX9XeotcA7RAIZ44iZxhl6?=
 =?us-ascii?Q?Ta5w6twO4Ap92TxFah8U+kIIXii59Zv0F0XayPcCE00pZaFScZ0OBHk4cE1H?=
 =?us-ascii?Q?dUp1DDvOx9EjYxX0RRRX1UvVaf10203cZD7QKsU7vRxsRmQlvbMf6O6lQ8Ue?=
 =?us-ascii?Q?7MQw/9eG4BOZew1rAozFNhPcjZzHpcx43MT++KGnFSXSBsoRNdq6gk3UPZZU?=
 =?us-ascii?Q?kcPjHlLNDl4EuymBA7iwcmL11hTuU2acHtHNedbIPV5mTkehML1qOZqXVNPG?=
 =?us-ascii?Q?bXSqar9+aZ9B6WQTEP5TNRCxWBjQNUuJMIqbnfHOKhgx3fDQWwK13++mrL5w?=
 =?us-ascii?Q?ePw3DxkzBOvbwka7yiLLVDhkKzGfRl8l/8GSxiQYZeE6AVm19SucU/QdrMzR?=
 =?us-ascii?Q?DtWoquN9PGufAFas53vjAkYBpgKKalKseaDyPHFiLZwc15m2mIrNwI+HBn1b?=
 =?us-ascii?Q?qVCNWTHi+uV1RmfktzrOp0D3/7oX4Fo7NKeQ9iis3sTt6I/7AqUt+AHYuVU7?=
 =?us-ascii?Q?egqK/UKkM/Guxoyy6xxqE8TRBHBBzjDgjy412bF3tV/yGEpUI8P740M2oh98?=
 =?us-ascii?Q?CS1fkuXZpPPgagZ6TgsYkDywSqwv5jJsWFo65bMaIbMvHgbNv6i5cylSmMLT?=
 =?us-ascii?Q?C7oALBJwxJcfdNhF2lic34XwMyhC8QJr1gMYDlRqD6Tdughsv7/aGf0zN1hk?=
 =?us-ascii?Q?Vv2UXa1Vdl3TTAo+zgmrQZseCMGoteZ0IKQ3x1Of13RVOvnNunSL4FN4NziD?=
 =?us-ascii?Q?Nhdh/tlB2WEFIRpNwd7g21yy4idWIxnmPoWAMN1x/lD4w14mAmKfW1Tk9NDr?=
X-MS-Exchange-AntiSpam-MessageData-1: EJkc5eX8gERI5PBx1GQIfdn2v8Ni3u+6WX8=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 50609f58-55d3-43b6-2e53-08de6821883f
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 21:23:56.3555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: woq4ALNT+D/DKFWXJELDY+0rvssrT9yeqYpy0/2HShC60fYa0VaoJ+HP6/mls7geoKAppWlFCQe5YSm2P2uMb06arvFqhpyYWZ3Up2jSYh8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0778
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 22:30:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230815

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


