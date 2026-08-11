Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDFB7C5CFE7
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 13:56:08 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.40])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.54569.1786456567557867582
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 06:56:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=bMRqFhkK;
 spf=pass (domain: est.tech, ip: 52.101.70.40, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l2oBjUCAr2XD/yO2sLBHBewduJcG8CpsnGjg3YVLfH32MUMm/d2NQyvjdQDw6amSiwB51mwmT7ygnKXtgrP98+MHOoFE8ra1fT1rOugw5QCN2b9ARfh8JA7Wa3gImbt1AjT5ay7B2myoj0WIy+IjS3Rr7X87wy4xhQ3Ha/+f2VvTl+nR7ZGANXPuudleH+rWNz+/tdLq9zQ9QOZ8QnGCQh6PVJIsvrlg8Q9OLV3nNu7v8JVH4foqkiq0gs8bNdG0crru/q79ZByTDkSWrbli5jT/9vUK2ee3zUjreuUtHFs2ZEQL3MgzRfkyti8VcK8QR0CalCWOC4GRM058mFmT7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XM5YQI/lslHiglH9MyBwMrqHkHW+wlBZynVs2tpt0XI=;
 b=Fjq6L5nRM8OBO1wjdk+5BKrjwXb+PB+FIgAS2uBZoSUWkvLxiJ+73Vgl0jD2dBRNDWDaOhvCxavKeJlEDVomTrmqbRN7tCTzXr6OXboy0VOvw5dmloMLTH4WgXcg4tctxRFXjAXt9HZp84pmqicuidya02zQd7MQVu7SIAxRF7iXtSOx+oAKiSgZdfUNZmgRONrC969K4GURpySMLoet1a3GL4BrqQDr71rzqNbqnCRS0eStJInrN+gxiVJeRQFOoO6tn0XhRv0mL2yX83svqHdHdL6X48m04XXyEamIjEVgI4sEL5Z65pXt+6EWsAFXwvrYMKgBZJuJg7bSvL/6eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XM5YQI/lslHiglH9MyBwMrqHkHW+wlBZynVs2tpt0XI=;
 b=bMRqFhkKXTHdF5vfsjnowpmSxqFKSYJY5Pq2mpQ5hHVYAbBOOnBQb+nmgOTTfqf2cAXCy+V0eOMAE9DNicvFws6pBlzI8fLl1LVlEC5Znsiflsx7BNLG5BG+QF8xvxxLjeU/g/QXb3Tb4vv42WsovbMaGI5glBhgPgWU+cWTVkxY1mK2y+RIz0NvqEhTWeUtlaD32JO0jmXp8W2VRD6yH/GgmPq9sgJLoVeNw8ihABGrhyb3ZtZZ7MeyS4Kfh+tOmm8LLIPW4V166oKoHVyeXHk5A5qqPk7dQ8JlUtWZFbTEnAc+A/Wi+zuUHmN+jTecS/C06cQXo4GA8y6A6rlc8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DB8P189MB1142.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:164::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 13:56:00 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0315.008; Tue, 11 Aug 2026
 13:56:00 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH v4 4/4] python3-dtc: fix build with swig 4.5.0
Date: Tue, 11 Aug 2026 15:52:00 +0200
Message-ID: <20260811135200.18942-5-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260811135200.18942-1-jaipaul.cheernam@est.tech>
References: <20260810154520.12466-1-jaipaul.cheernam@est.tech>
 <20260811135200.18942-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0530.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::13) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DB8P189MB1142:EE_
X-MS-Office365-Filtering-Correlation-Id: 625b2111-7537-412c-d21d-08def7b04650
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|6133799003|4143699003|10067099003|11063799006|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	TY2hksmJs9tu/WCKiqdCgAbTiIu1LQndsJBw7P6qHrf8JlNQgbypd2/pnpMsH9EDZFHPdtas2zBuHK3huVfazsw722bWR+a5gATtaYA4uI8PZKuhNDTGBe1t0FvZu0CLePgWCeovJYL3q1zktU4MjA/G2s2k+JNPc5sN5j0Fk5aBAMeUQ+LIdU7KHAUzq5MpbB+p9kJzKlvRsvwq+u0YLB2PjYZShggFL+bwGt+MfoN/MXX4ZTGJqBMdvI/ztvqCsU9L/xDnN+WO4OiRv9DVaeeMWk1J9VZhH5utUwRoPLxPpcBdHQtJsRMck40Pw1TtSxrMkoHhJWuwsR/O6PJxiY1aLkf+88MbXFuZpppotUT+yM673yrVDjKS7tGgOZUBuuANlQzjqzS5A9gktaEJZauxkPUwpicikeFszUdXfte/mph0EJ1jUJKcoLOJPnSxMwWGRGgBOwW7NCPlMswEfvShTFDmvIBvmzbJfJpiXr4oZYIo5IcTN0BqzLB1/VuX3OvqnEHtjMpWAlx0DvVNL5165OdQHJRKqAS7YBtol4Eaeujh36VTVcEv1GtoqAEWz5JbyAbFl7fkMHJLf8torUnmlgYC+4qzYiTYzhjUa/enH6vQw60gUFeEq9vFVlWlzI8ka+K7D8jybHfTSZHpOgxXZ8wVKobJpgcYnBXmtfQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(6133799003)(4143699003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iPOwiT8kwevrdn+6UPLGR5yQadLH+E5aelWXv0E1PBr/hmI9cPkCAS/gLaHs?=
 =?us-ascii?Q?SpeNEcshmJrfmeYR7Wv3rzn/KefzXg+4Z/5fx7Qe9Edeh4JHCiQdyA1F3k43?=
 =?us-ascii?Q?4YbtrrUnzK1qCoXeezJr494w/7Q2f3kYp+/NJVzZBck0I0pEmT1yvMVlcj3W?=
 =?us-ascii?Q?UCqntxywgbsTi8uPwsNMsokCsM+GJTV+BbIrvpp+Q7CDhaWmDXJac4jrKYl6?=
 =?us-ascii?Q?2Gq4NsSJe6PsPkzzssLenKNCXXHhvCbuHCvHS5p3M5KNGXACe3GKHrEWOGQc?=
 =?us-ascii?Q?4zNsqnc6qOvu6JIxMi4kHBoxgGY7lJ4mMldAB0c16Bu0LD3vI/s8Lotlmunc?=
 =?us-ascii?Q?u51dSI8uHt67BD9GXb5fEfR1IP8dqA610eGQsnG36MJ+bjSevhI8wrh+zG++?=
 =?us-ascii?Q?p6JpT4dpWSCsAbJe7OTZ/fdxGuwNW/1m8vuuFBiXHoy1P7UMXiy40UkFgyWU?=
 =?us-ascii?Q?7OdP/7tr+xTcrnJQkWfUntaFQ6hIiKFhvYGsSdxTZoFEzUB6n1vtkWqJYObq?=
 =?us-ascii?Q?o4IFk/Ec7BimDnLURa4MipbDx0Uva2WcUvqt0Ie2J+lb78ogjBzVbIE5bCSP?=
 =?us-ascii?Q?KtQ25DyAUvMgc1mS9ZLerALYuWwAY+ARC0JTpuOmnRLaLoJ5jHbkJcqFWN2U?=
 =?us-ascii?Q?HM+2+U/crguk5LvlQOeGqYtM39YFBnM4NL/pqifMDXdlJUyQyjzcIjT3xCbX?=
 =?us-ascii?Q?d4xGN+7A6Yrry27ebNo71Od3kSFQ379s6Y5U+biPjaeantZPzwPqf2S+bpsH?=
 =?us-ascii?Q?j8AsWILNFZ8uQz3bQNnwtcEdBtgqON3zu4Da+ZQgWJsl/jJ8UZV+NbPlq515?=
 =?us-ascii?Q?3i5wmDYVBcG2NBpnNN6eksvmFZMuOQ/pgRInVsWOWq0BZZikzXkdB1z2w/i1?=
 =?us-ascii?Q?KGEE0IkKcCgVp75PntRL18SJfwnaYCe7qpl3lX1KM1SjM0MZZkjYX2JlHmQm?=
 =?us-ascii?Q?QQEDCfbp3lf/16tvoEb/HZ1aKeq0jEb7aJTe2Bn1fS2njjK5x6mEHzUg6YQp?=
 =?us-ascii?Q?EUKfNK8X/XYiYpfY1IlwqR2s4wJh4zOInfUno5ehFjAejqcbHpGGePBivxaC?=
 =?us-ascii?Q?yaYycWNbsw1+atInJ0+wAUK0XwPvB6g4DqsrPOP9Vkxwn7k8d22tT6rIrNS+?=
 =?us-ascii?Q?032Qz5lWGXqS3/Fqv43ZYmUgZ9oGlWOjKCgV8Q/M6CCDCcR9J7Ixu57TpFO5?=
 =?us-ascii?Q?RflzlYnbm8xkB8SDFGOBk2NsHzt6u8rcT+JEQYLiPir6ZF07tlNmc6R+X1F/?=
 =?us-ascii?Q?20k047wV6JF9Qc0+UKFrGbQesvXn1V9L5i+1Z1JKN75nZuCSyjk0MULpTXzH?=
 =?us-ascii?Q?AxU0whBQVPg8OFp0O57+LX2Ua/3dhboCmsBF9iAkLyhKOt4veNUZcGgteJcX?=
 =?us-ascii?Q?mlJlAP3u6h86hFZWYlSUN0k16aNRVY5NrkyxIkwNAasb4hU+iPBjoMZXuazr?=
 =?us-ascii?Q?sbiICI7Ect89G5C2gpB1peEBJUwGHlAhED1A/dtIYTCikqmNHPJJqilluvbP?=
 =?us-ascii?Q?LBPe6rrxY76dQUPAuNdaD9/mhvyKnnJ20x0HbzbFhZFedywE1IoX/I65p1Wn?=
 =?us-ascii?Q?Zeq6c+kId62WBczhLPrQ86XDBw1+pco0/Ode77Ca0O8a77pN3sRU6ukZPWNd?=
 =?us-ascii?Q?J5DU5T25dn4Y+Fze1/pRm2mA3Oh+fgnMxOl7xs1tUzcvfkcZdWYU/djf+afd?=
 =?us-ascii?Q?AakUQJPvNnUtJs9yrWNxk1hWGYlyA29YfWINthASDw29s0ERap4BUF0xthwO?=
 =?us-ascii?Q?rk1pOWYMTJepFs6QN91ri8hWbwS5+HM=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 625b2111-7537-412c-d21d-08def7b04650
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 13:56:00.0151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0fPfkOPSYVXTjl7IXeEHdX2BZr7/LtlyHUVvzQqkufbXK8jBbgXme1h7sOZUlvd+fr7nQmaKpBm3uPw8PVCg6vVx2Po47EA+tHdUNvtDbPA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB1142
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 13:56:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243204

SWIG 4.5.0 removed Python 2 compatibility macros (PyInt_*, PyString_*)
from its runtime. Backport the upstream fix to replace them with
Python 3 equivalents.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...-removed-SWIG-Python-2-compatibility.patch | 57 +++++++++++++++++++
 .../python/python3-dtc_1.8.1.bb               |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-dtc/0001-pylibfdt-=
Replace-removed-SWIG-Python-2-compatibility.patch

diff --git a/meta/recipes-devtools/python/python3-dtc/0001-pylibfdt-Replace=
-removed-SWIG-Python-2-compatibility.patch b/meta/recipes-devtools/python/p=
ython3-dtc/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch
new file mode 100644
index 0000000000..877aea3a8d
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-dtc/0001-pylibfdt-Replace-remove=
d-SWIG-Python-2-compatibility.patch
@@ -0,0 +1,57 @@
+From 32378d7b4383a79d13da9005035600d8f0c8c29d Mon Sep 17 00:00:00 2001
+From: Jitka Plesnikova <jplesnik@redhat.com>
+Date: Tue, 29 Jul 2026 05:55:56 +0000
+Subject: [PATCH] pylibfdt: Replace removed SWIG Python 2 compatibility mac=
ros
+
+SWIG 4.5.0 removed Python 2 compatibility macros (PyInt_*, PyString_*)
+from its runtime header pyhead.swg (see commit 79f7a2b7cb7d). Replace
+them with their Python 3 C API equivalents:
+
+- PyString_FromString -> PyUnicode_FromString
+- PyString_AsString -> PyBytes_AsString
+- PyInt_AsLong -> PyLong_AsLong
+
+The replacements are safe since the macros were already aliased to
+these exact functions in SWIG's Python 3 code path.
+
+Signed-off-by: Jitka Plesnikova <jplesnik@redhat.com>
+Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
+Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
+(cherry picked from commit 5008d1d6a356b8d0a78060da2e1021507d529cff)
+
+Upstream-Status: Backport [https://github.com/dgibson/dtc/commit/5008d1d6a=
356b8d0a78060da2e1021507d529cff]
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ pylibfdt/libfdt.i | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
+index 1f9c0471..b1cb9873 100644
+--- a/pylibfdt/libfdt.i
++++ b/pylibfdt/libfdt.i
+@@ -1136,7 +1136,7 @@ typedef uint32_t fdt32_t;
+ 	PyObject *buff;
+=20
+ 	if ($1) {
+-		resultobj =3D PyString_FromString(
++		resultobj =3D PyUnicode_FromString(
+ 			fdt_string(fdt1, fdt32_to_cpu($1->nameoff)));
+ 		buff =3D PyByteArray_FromStringAndSize(
+ 			(const char *)($1 + 1), fdt32_to_cpu($1->len));
+@@ -1169,13 +1169,13 @@ typedef uint32_t fdt32_t;
+         }
+         $1 =3D PyBytes_AsString($input);
+     %#else
+-        $1 =3D PyString_AsString($input);   /* char *str */
++        $1 =3D PyBytes_AsString($input);   /* char *str */
+     %#endif
+ }
+=20
+ /* typemaps used for fdt_next_node() */
+ %typemap(in, numinputs=3D1) int *depth (int depth) {
+-   depth =3D (int) PyInt_AsLong($input);
++   depth =3D (int) PyLong_AsLong($input);
+    $1 =3D &depth;
+ }
+=20
diff --git a/meta/recipes-devtools/python/python3-dtc_1.8.1.bb b/meta/recip=
es-devtools/python/python3-dtc_1.8.1.bb
index 51abf3640a..915cd6a730 100644
--- a/meta/recipes-devtools/python/python3-dtc_1.8.1.bb
+++ b/meta/recipes-devtools/python/python3-dtc_1.8.1.bb
@@ -7,6 +7,7 @@ LICENSE =3D "BSD-2-Clause OR GPL-2.0-only"
 DEPENDS =3D "flex-native bison-native swig-native python3-setuptools-scm-n=
ative libyaml dtc"
=20
 SRC_URI =3D "git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=3Dmain;=
protocol=3Dhttps;tag=3Dv${PV} \
+           file://0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibilit=
y.patch \
            "
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"

