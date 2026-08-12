Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79059C5AD5A
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 12:06:25 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6358.1786536377331362207
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 05:06:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=UR1usfmz;
 spf=pass (domain: est.tech, ip: 52.101.84.64, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nee1gm/U92NLQkYL5/t/AuSTQVlaABAqs0cGGjKY3bybRVJeq+6dv9XM/UTL8z1CC1BdGmCySoWvVG1cGPjMbK43QMyGDgqxW8W7H1LGLgfM1WffcbJ/q+mt2y6UbxJl5Yzw56GtZQ15UNQ+r6ljdwOKPZ/+XLYc+crsS6ibkfP9GJ35B9wWWcEZ7/muf+XLdZzXqlr7oVQlCAgP9UGr2QqumySXqUQMnc+IKHFHz4wWcgq29+P/KIwcdQ+nyEPORhsotxTR9fO2jH1WnRAcNeiNz7j/r6BXb267FglhEm+1/j+Uc6dwKEd/AE0XrtFeuB+/M+7417dJUw/LBWlhpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XM5YQI/lslHiglH9MyBwMrqHkHW+wlBZynVs2tpt0XI=;
 b=aAKsOz02VBhjDr3ARu2jPyYM70tBCgU/DfIDePKxajhqwsTWcODC6w1LUSQXyaGeQDy/kk27096T5e9Ec9l2sjxZKiaTHZWONPlyv+8ue+mxfHc6j2FiU2fwQ5QZas9gaMHzkC4dMonJ0zdf94EFhxsu6OgRjNXqW6h1a94v+QGonY+hueyPR3r81c0dK+U+QFnGTJ3IyYQdKMdtWedgH4RdHQJ7OItvMVRyi5NQjY+5JHOVe5mfB/t3BJngyEzLkLReHNtw3v5G6eCFfxXJyrxJcig2xtve+rh6ovaxTuIKlansICufDihscVUuNe+WbIrvVyK76H2woGlEKDOr9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XM5YQI/lslHiglH9MyBwMrqHkHW+wlBZynVs2tpt0XI=;
 b=UR1usfmzbJKLaxfZN3A3ot5k3Mmh94Vl6PFLeYUp10t1+9fLEBefsKv3lI+Ezzo5U6J+241YT3+muQPqVNMfBpOSqmRKKV1WxyZUOx5TO0aUwGFHUiz6uigaQs4mOrK6IRzeq13+Of0z0m6LpYenN3EM3pD3tzhrDgG2tNe0nyxr1nJ/9vogXo/bxPBZtOUo8LPtZ5vBaD9BouQTffkHRD9wAOnBjQiMXfHz0Qm1798E09hl6D74CK7lKD3OGDTLtp3G1YJRDRjGku62+U7+7GZ4d6IcI9yVK8qElZ8qDQQeWacfyV6gq0GQpc85eUt7EriLiWWyuLRyLaiHO/7x5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DU0P189MB3354.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:59a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 12 Aug
 2026 12:06:15 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 12:06:15 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH v5 4/4] python3-dtc: fix build with swig 4.5.0
Date: Wed, 12 Aug 2026 14:05:58 +0200
Message-ID: <20260812120558.24897-5-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260812120558.24897-1-jaipaul.cheernam@est.tech>
References: <20260810154520.12466-1-jaipaul.cheernam@est.tech>
 <20260812120558.24897-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0294.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::11) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DU0P189MB3354:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f2193df-ccf3-4642-b0c3-08def86a1c1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|6133799003|10067099003|56012099006|11063799006|4143699003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	AHmsGFG7oJGf28G1GlgHBe4Y2BAqbkwvbf8IBDBAOq0FeQe+ENErKGRqxbdoc1/RGO4B+PQaxb/7vAK/jyaTa/6cDXxh5ES2xCjC3rpqq8LKpEiabcSpguthqDgsaonxkZzxYDAYU7J1O09LJPikP+mLRJK5Wihfdvmk2n+Lk6Ho5Jw1XYlJ/oNtR98pLPdYlVaWSoiUMbiNO67QTQc9LN/dOXF5XbSYjHdA5PVYeyQ4IqURM0m1Lup2J06WXLi+aZ+r/QfflsRthmp4EJ5s4dQcd5787//GFcfM9+SwuHNzq4EKqyNt2G1CNhADdqv01RanuRMWG8GAfHt1XQXzvUn/DclTTyYLZJVNOtkWjyEVkxOtjqOysznrislrH6uJxy9vVlmi6U54ZyFqd7PnSmOm9/Nb3crbKZ0yL1ArJaknG2Ew3DkZM/AAUINc7hzNDq3bpiubcgk1+ilYCQiDjMlYsdF7iNfuzNtPgDg9CQdBe8Ta6D+K3QhHSxFii6Z7/DwG8UCX6/buisTLP6gVQAuuOKWGX98vs5zn1RO9wMHQnRIKUoxnJgaNPU0/s1FIq7jxJDMaahZEEYgbvqXAVyiY6eTJqnspVCd5vWJizGLQ3vjS/lO2GzQ3q78znff28MdRT+LV1l1CCcavVgOusOJgILddKRfYQoUZTnTncpE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(6133799003)(10067099003)(56012099006)(11063799006)(4143699003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BHj+IU3zQnP5DHFsHe7GjVl0UrU0qJk8udML1PTkdqt2Qtx7uutqn+TBH++d?=
 =?us-ascii?Q?MDsI3TrSXsSWQ76DBM3V0yUN8lzTHQf0PqXwDD4UlBkhwdz+Z2j5AuqJQI2I?=
 =?us-ascii?Q?MzCl+CMHcy0W3ctyjKCGypRm2T+54lZEZAxGPbIpD1HV86WIClirzcyum09I?=
 =?us-ascii?Q?tYKcwKTaDbK3SVZ5Agp3RTaQzWJ3hAL493+Fxa2+UDaHh+IwTwWRZUUStxCW?=
 =?us-ascii?Q?DZfsZF4L4dR6edHg6+cAhXRmAIAyBiBN+j2OnqRPAt+yB/13O04nzjM5sJgk?=
 =?us-ascii?Q?ItRPb23mWA7OCejBTLAGyQ46ENpG3GDgPbeq0ynD5JIxXDQxIi0LKAABfkKJ?=
 =?us-ascii?Q?SBTRyA/UKuNxqW7aclx3XDgomg0zsRHNy5OLtmUD1kpNZASTuqZ8Mcc1ZtYB?=
 =?us-ascii?Q?qmsdgbqduY1qKPrsw8iw6LZHirSqlQn+K8cGSNBZFFfx5E7Usip4Nq7bXIGc?=
 =?us-ascii?Q?ecdYlyk72L+WCx8wHFQbS7Fvzs1xQ7YiQo646VwIheGxW8ZI70bXBj9wX8P8?=
 =?us-ascii?Q?lmbWHQBeNRxGMDcXUXtyhk8T//zKF/Ysb4vXNn6WfBzF/30l/iOafzXpdOkc?=
 =?us-ascii?Q?hjvDAHqXoV6zQFlDsKVI0krm9bYb1ZDVW7uWDDlDsBVDFuCIPUykiySl0PWn?=
 =?us-ascii?Q?wpftULytukXrgMTx+SRFNPn0t8RRn3wFNRaiMpgEGm3LLHr7XUS7m7PajTmM?=
 =?us-ascii?Q?4L71W93HR63qLU7e4AAOm0c+c3uP5K6fLIwSeG9De8zjzVJ7wSjeid7fGzO+?=
 =?us-ascii?Q?vz98h2Zgxue/2ODbOwV0OmpNyn1qcjgQCgsr4J8LCPs4HZJDt811viGX8moc?=
 =?us-ascii?Q?KIZZnJ1gRKIj10hFsj4EkLKyGbIJ3bw5nUFesWoHzdjwZpgft85I5DrMUgQb?=
 =?us-ascii?Q?mjKrCYcPa/vLv6+GfuK3DozJ2PZBMVeNfCQixPkbSC5j2fWwo7KAkd7FHDXF?=
 =?us-ascii?Q?bE5QjRALjVfTFp7cq7HzdyK0Ackv/fiALNSq0rgElCp8QlRgGulXphL77PZF?=
 =?us-ascii?Q?NfwImb/5b87SkwfZpoiUs9UCqc5CY4SxPilLQCJUuX7mhBJwX8R7W5pL5zB/?=
 =?us-ascii?Q?uK/xh4yyNQ8EBt9vpSLDus4gVu9fkqfol8O9D3u+l8tKKxhkSADhx4uGwZXo?=
 =?us-ascii?Q?A5ZX9e4CnNxAL7r+j9L+7RboKh/DNFW7b7ntcXZ1xDSOWIJeWwDPa+LAsvnq?=
 =?us-ascii?Q?ASUeMciBjokGnGtUg6XwoaTRyJFwd3I8NKeNoroZCW2KcLGxA/SqtLVhDCb0?=
 =?us-ascii?Q?AF/WrNC1rsRFn7qVCVegcXIRDpXcWV/SlkA7kebzRqDflCYlJZIiFfH+A2oS?=
 =?us-ascii?Q?GTatJpM2YUXgTnuoTpPsbQ/YsRXth784NUhmnKw4n7yWj9FKKc8LwYfDwNGC?=
 =?us-ascii?Q?9kPcobm7Zou8FRAsx8Vd/DycDhr37ZvqVOhaL0/4saL6ws/3+jZiZOE9Kx9N?=
 =?us-ascii?Q?/UmpybRdGgkmZobHo262adOrtdO9q8lpSCVXeGb8M3yYqd9BrdagEvGzR8V/?=
 =?us-ascii?Q?pH6JJIXHzOw+Cjexkv3lJ3zlsdJ5i0hXPZX+XqDCgaYpSyMLb1m8nRv8au+T?=
 =?us-ascii?Q?KOcZD8nntXB8vrUD3OP3lwHgtfXKkJfKkxt5i3x6OwjB607VwSmp2+JkG70k?=
 =?us-ascii?Q?/28lC529Fi5mg57bAbg/aiCy7BM8aePgMQPY8Xf0WHBvdPFMgbNVghhvd/jA?=
 =?us-ascii?Q?p4sDYhgGHT/uS5OU7SN3taunwprQ8hSJQgv5DkRQlxLOfPjT/amKgXu5IPxr?=
 =?us-ascii?Q?gKBaFkWu8r15VJIB5d4fXRCGQXtE/HM=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f2193df-ccf3-4642-b0c3-08def86a1c1c
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 12:06:15.6331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ejomUgXsCKJyGvxslAqNBucYYjOn4qoMhg5r+/CKpGcV4R7PMOmjNDaCf4tUQwaEz1JTk5564OaW2pNFifg+qM9SwSiv1xtBHXbr4yVKko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB3354
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 12:06:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243282

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

