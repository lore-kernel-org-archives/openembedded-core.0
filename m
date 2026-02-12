Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D33F0EE368C
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 14:22:04 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.60])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46369.1770906048295355918
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 06:20:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=j/414Xt5;
 spf=pass (domain: est.tech, ip: 40.107.159.60, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BXBtmeV/ZTsu2beQxH/Bve7YPvOlAb6Zx71pLIqFmv6CglqJu+XB5+YS/uRqvQs68QevHIaA/OpylUjv8yzk3ubiAda1kkViaFHeBFF0nkTFCYndhVEDG51MD4GYmJi4Yu/tXpwfUHGQVnlPQbDy+8GpLoGRwsgswzp9jU3qTpxMPeObo0DSwXkw9VL3XxF6EjSXhKv6pEeKur5nCOBqmd33mWQ9KgY/+/D1knlo4Dbu1ruwUt7mI3dV3KKyg153qdmovOx7lGMJVw1Ag4tJ2eLrCzkQlu2l24NdNIGaAcKoGc8F1jCUb2epSMTmYTLvy8iRh3QvdZg1GHHGIhtxQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5cLRr4xfp+Lk1922UBnzvS3weCrRRCAjmDYAd+pW73k=;
 b=LzDft9DF82vCyavk9pUcZlZanphnGmJ1nI3/Z7VfclK/fSYlbBM95ItiMiXH5ZJEisga8XhI3J9jaQn6qYVq752joIdBPhwNMFHlhRvhCirogdYyu9/xoScxM9waWT0IkEjh9lfa+NvHec5rjZg+nUOPcec+4TwKFmcNkxP4YdvCqyC5iopqaHBfaaX4D1AsBsbOBHFoTdL5LV+lYzJBWyRaq9eSdtqpUjjt5fu43qe1z8/08g+Xz2Du1sPYsA+W3dmZtjHUigOQtOTbLxLCW6Lxc5j2hjbW3n8uItkPQ6AlpVouYLKqF8UnYsc9VUq2xRcq0Uj9wMEZiX7JFQrJCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5cLRr4xfp+Lk1922UBnzvS3weCrRRCAjmDYAd+pW73k=;
 b=j/414Xt5pYS+7XKcyY/S15IoezsWPGVkkKKbjy49SHQelv5nBx1e6TmwjsG+vGAZblBHm9mfhNL7W/xMbaRTwPJ2ECZy9nTX3oeXg/X810KU6BFT74koEmnJeSkwmAriUmP9/NIpd5wSMlvNTk8VCQzFahP4ucdJgxXu7TGpbHbBpK52fnCEb+y8OqB352v5ZadDFdWUQvEPvJEHuGCu5Xhs+MfPwk6J4/N0ZTdDgnzWE4OdjaQEhEwB54bVBMrtsvWtuMukKLcw0O1O977yjNQRUSFzPg5jVbC5boBbQbcll3Dh5UuPjvMfmJmlothu14l9K+y/DLlyg4lVYycdDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by DU2PPFBEB675582.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::aa3) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Thu, 12 Feb
 2026 14:20:44 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%5]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 14:20:44 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [OE-core][master][PATCH v3] python3-pip: Backport fix CVE-2026-1703
Date: Thu, 12 Feb 2026 15:20:26 +0100
Message-ID: <20260212142039.81511-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: LO4P123CA0597.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::14) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|DU2PPFBEB675582:EE_
X-MS-Office365-Filtering-Correlation-Id: ff99b5d4-fb69-436f-4dcc-08de6a41e876
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?4wCdjIhDaMXrJrvjpzwLu4BL7mhkLSTw0Rbt7zK609KWhxo2GoVv54iHAmIK?=
 =?us-ascii?Q?Q3Zcjl9kKcra+ekriqPnRpz64GE3g2mElX2TnhJC08QLpCQ708TsDltkXCkk?=
 =?us-ascii?Q?3XV9uCrTXmSTjK7iAbFVkI9NDSdBPUbn0yHvPCcX+qcc36BwL2U+GsM56eeg?=
 =?us-ascii?Q?08n/MNhmDBMGDXY+RaF+v/atBvDEk61TOufLULbpP1dMtmHFMOV+MoFo+bbm?=
 =?us-ascii?Q?+j/XitHRQtn0ZJko8AD2N4nWSKoKBKs2aA1cS4YC4qkrUh7j3N+ObeeagSlI?=
 =?us-ascii?Q?Dmja1vb/EeyAn6p0dCQIwKNb6yxnnN7ARsTKDFSwC+zvIqx6IEhIqRdoNnMS?=
 =?us-ascii?Q?pBglB2LTlIQLqP4G7FuMSV2r/0x+ebG8fnuk0sVh0MntanuY8i02dM9uDVH4?=
 =?us-ascii?Q?1tVygijbPtQhNwdR4+JtAkwePlhXzns/TlhzMMeDkL8x3t1eD+X57l+92YCF?=
 =?us-ascii?Q?8zOMnolxIqtafwEiuYRaz1vw5eptUC1rOQfuw3NTNNb0NfJUsrRcX887RhFE?=
 =?us-ascii?Q?lOcvy4WnYPNg/JIKAqYEXdpA1c8FZqJEJSJHUZOpxZhI3pKT0Tq4q5kLPIUM?=
 =?us-ascii?Q?AgOGr+A2JYU9aXxJSXIrOSQtoKBMf5+mbzS2QwP6Fvfx+LW/lNLvlJpe3u2u?=
 =?us-ascii?Q?T4w74v3DpB+ttDgV233LNnJ9w8Hs0K6g7zClgWJX5zmEGLsV2wiSb9vG+iVG?=
 =?us-ascii?Q?d9lf1pi6kQIbOtFzYu73fTMS66gw+JHf3YJlj6WmCxzoSlUnGjmRDCtrVRVP?=
 =?us-ascii?Q?tmIMQdacelfouHoKvOWjMy7Rmeh7Go8RWI+0QKXSTNtKwwh7lgGQXKxUNWrJ?=
 =?us-ascii?Q?drIJ7bWRW/BXuyTA+xv5oC5lhZvNchTb7gvSEek5rOpTyfQ5r858qySq3yPv?=
 =?us-ascii?Q?AXeAd7JFSmvrOSt09VptB8ARTogBgZRMYzHNC2f58HpBvtHZ6AcrsNTpT6OP?=
 =?us-ascii?Q?TFxB77T062P4UP7YhG7Ta41cQJJqUXGj158E0R+Yfc/qZD7GutQrq6DlOd2a?=
 =?us-ascii?Q?PokC8h9nCNu4DqJxeJnkXN7OVsgGmUNruFO7I9CFss9bveEFmJpt5O8NwG5H?=
 =?us-ascii?Q?hNJ2OhFLAtyLwAbV+OIi8UyPlHVlNXH1HDJtqgq3kdmF6cFXqKjjNcai0WWc?=
 =?us-ascii?Q?pe/UXlo3StUPnEtTisuFtHMoUPb5S6Jzf6Qw+5do/zZmDAtjbn3wUmtID6i2?=
 =?us-ascii?Q?tnnMg6+sd21BmL7ufa+fsIeWyxpTZfNpgM8vffDeCAyHflHL3Q/SkfidmYBG?=
 =?us-ascii?Q?OyiaiizAuODesyqDqE7iAw9pDJt61wok6dIxIBI+T18GDrCDRKHqg75x6dk9?=
 =?us-ascii?Q?BfCpuzoVGxRkPUEfrMYOetLmZXb4ScanzVpvA/C+v7U022adZadZPISPFU/U?=
 =?us-ascii?Q?d86F9viHbY2v1OmJ0+cpz/9/kL8dnK9wlZQS6IZR1Y2IxeHnoTWRKcbtsjVr?=
 =?us-ascii?Q?7OqCYGUqfwlilms8Gd/YGb/bBP/AMPsKNkk647QurylhzsaO3wPFvKdkBhUA?=
 =?us-ascii?Q?qTkHZ46nIVjOj70Q2q0xZWmzDUTIezcFsqhRG93LPDU8AQm90TravMqOkJsI?=
 =?us-ascii?Q?rNEPkncd6YHJgsyPEC8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3HYzFjnOyfurLfjUSiyyajnmM33TJa5gTgA73PqScn+AYmrCV2BL9e+07KlK?=
 =?us-ascii?Q?OXRg5LMYFMZ1v3S61Ngp8sfzgEsfocj6mz04JmNUogZbpY9gb7a8XBy+5J3/?=
 =?us-ascii?Q?svp+g0VNJon8eX7277CcZgTR7/sJFvjBkB2320Eg+9128Vlkc9MfJWkm+7Rr?=
 =?us-ascii?Q?f/8nOBG1aH/qdC9XTCHhBQFheYCy6xviOkzitbc1XAfSqBaoxMjGx6+HiHfo?=
 =?us-ascii?Q?PBa4RTOWWbUCOSBYHAlXlyDKb/U8uOmt8zEBDIkwVLhna3j36jQjtmL5J3sL?=
 =?us-ascii?Q?6H16scQxHsl3lt+Jv4GlvUIPzsFImLITS8bKfW4i7IUhQjz+z86cRssWRJUV?=
 =?us-ascii?Q?oni8PAn0eeRozAKG4vUH3qc5TXdVoA7xKJFQWwVYOTnMvZ06oK1wxJOXdgk8?=
 =?us-ascii?Q?RfglCPua0x3lxuKHq5SMRa8qlCXigsaj4eprzE9SjjQMMrU3FBMZ7fEt1N9o?=
 =?us-ascii?Q?zs1YfpyK1kWETOXm9HYwQe6Kv7Wq58JcLKjnhObZH99L7lQCDyg4iteBvuRc?=
 =?us-ascii?Q?K4XGJp+P5vXCoq8PZ3LFCorfA9MFmN/WAeFwvU5kbwG9GP1CFhEOKspAPuyM?=
 =?us-ascii?Q?Gm8By/n+ud04WMqSUGJg49WJmhmUjzhJSeaE5lToCz8w8YcW6vJqtE8jFmL5?=
 =?us-ascii?Q?mVop5fwJB1IGW9ivklkcpN8JxF2/Tey2Mxet6LZCx29+XTxdivYVM30kTRqo?=
 =?us-ascii?Q?/8g+9N61ZnB+G2MFd6X9JtgVZooLYUiRojuXMc8uFXt0YIw9jz3U5RT6pGRp?=
 =?us-ascii?Q?cMTMfNF66tWTs6i/EwTrM4JYZJz8ZR+iultnvPxHicJHjQENhYI71YbBK+hB?=
 =?us-ascii?Q?GZvpjp6AqeoWPgzF0gG+m66O5+hw6dEYIrkWAtaM0eiHN6ORsh26oFuGCA16?=
 =?us-ascii?Q?7Ur1C5A77DAm5/tBqTTm92tbZP7qKy5i/T1K5KVNoxchErswDvg9nDpZmAfW?=
 =?us-ascii?Q?RIQJ4elQC4tzZX8TxYTRuLiRDZuEVOC3riJnnZjUOLIIejxcrsuE4jnm9C9/?=
 =?us-ascii?Q?7EEm70i89ovUhEUH2PUxZ0r2ylP8rj4QUCA9bwbaQDTvFClMKLuUA1kvB15W?=
 =?us-ascii?Q?76q79+gs9Kc2MYV4tNWJGesyliUAJW9uOCP3+OMGT4q6RBZFP6XtWUy7jMuB?=
 =?us-ascii?Q?GjRvpgg13IoAzfMkJWGMG/9vjPwVoO3ZO4gO3jo2XTMPW1gpTzp4j+dSQq6a?=
 =?us-ascii?Q?DW6UXo3NnaLKpRdioDC9QJw7pEAXeJCXD7RMyhMJ7qfwXi894yQTetzcLlMW?=
 =?us-ascii?Q?/npzdZDTwDUHjZMm5USyEIih87hL68chpDaFhwT9rlZ+uk3plfuZgp8KV4s8?=
 =?us-ascii?Q?J1C4pNr5duxuxUZmAACbPdeTYHmmrjphh8vnGljF/kzoWfeE1N8qlupH87Qo?=
 =?us-ascii?Q?SM5reazUnsJLrhRTQ6DVe62Xt3ty4BBCpCiGrQBPkUOdfot6R21jabofzEvx?=
 =?us-ascii?Q?0I6dMNbY+JZ5HN3Mv5pl/K13AYuYRN2LYKmkEotNsyEF0/yx1VjdZri/Q5oS?=
 =?us-ascii?Q?hBYwcrwNM/e5rbO9l7khQ+/wlM1mDyhl1EHV9bpxdImzxaFVnuyrLvEnqXMg?=
 =?us-ascii?Q?JEUYoECGdF+yzTEY9Px6kE8vtHgaAE/iAs1xTXMVEbFcNKMxTMnv+m05/IJa?=
 =?us-ascii?Q?zyKmFl3HDp/GTOUKghSTqguYXy52e/1o3ojdcqCG2r+lmUcWpmio27xxOcZk?=
 =?us-ascii?Q?iDIXJNI9bAW80may7gPj8cH0gesaMttFa/h0Tg0Ns20cBOaHRbYkDxRH3JQT?=
 =?us-ascii?Q?E+7c9Qg2Xnz+rbMGrd9x2HfUW0nZr+M=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: ff99b5d4-fb69-436f-4dcc-08de6a41e876
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 14:20:43.9969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ScyZ6elvoJrzUl9TAS1Cpv2pZuGv++7v4IHktYgmQkkGGN6WH67+kG7LQ175io6maIqeXg76Qh93R+wmiHiT4/R0S2Q1kwucJqSMt1MM7ec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PPFBEB675582
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 14:22:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231032

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
index bbc70e3eae..5a50722d6d 100644
--- a/meta/recipes-devtools/python/python3-pip_25.3.bb
+++ b/meta/recipes-devtools/python/python3-pip_25.3.bb
@@ -24,7 +24,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D63ec52baf9=
5163b597008bb46db68030 \
=20
 inherit pypi python_setuptools_build_meta
=20
-SRC_URI +=3D "file://no_shebang_mangling.patch"
+SRC_URI +=3D "file://no_shebang_mangling.patch \
+            file://CVE-2026-1703 \
+            "
=20
 SRC_URI[sha256sum] =3D "8d0538dbbd7babbd207f261ed969c65de439f6bc9e5dbd3b3b=
9a77f25d95f343"
=20
--=20
2.34.1


