Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 456D4C5CFCF
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 11:11:47 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.51815.1786446704258916405
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 04:11:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=v14rGeE8;
 spf=pass (domain: est.tech, ip: 40.107.130.51, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bak7ulKieGi9kuhJVqNvYeKZCJc3bzoo/q/MkPZt4SiO0hirjRWvK26GJYfozVvovAYliET/Tqgtej0L1HqUYq6mLlt1mSB2jW+DZw/GOO8ZnbXWljlLuhy70JkTSt1NZWq3GG2ype/+ey9l2dQ59hOMhjQIE7ZueqoxsHMnwcye2dTyGt1+N2zB/rZHWmmVM13/uBKYNqd79jmIdCdVH2lAHkLakETpPCLuuB5p2I6CLyA3inSevTGMVE+J+WlAFRRycfa4VCbDRQIFB7c+o7Mtt5HhxrRPh5OGo8ZRWFmyxzCGdrzeWQYdPX/4SNQ+iZPSMsiyax56Khyh3OEY6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XM5YQI/lslHiglH9MyBwMrqHkHW+wlBZynVs2tpt0XI=;
 b=BCTzVHHaX9ovofJxe6qeE+rOHLxMUgAo8SEFiNRs7DJvIfrEJ7taUVOUYPuXJsqG9x5Zv+9crZGye2zci9Bxd2RyqRF70LQznZt5bRnjRXNLEDavHkqp4+zKb7dlA8sHmzI4lF4/OmDDA5n0CxKO3B/h+A8yvjXxYrO/MW1lKz+HmeixwthEiH6uATAzRK6jqaA74qJHQC1VGWnbDOLz1/txnRmhKAmI+dZeWQ4AE6MUpqUP/Hof0FeG7VE6DLt+Mrkcn5eXY72dHyFS42aHhvqBUgGG/UVZZkiWRD57HBE20SddaauptGOGZEPtw2nWtLkAIoVdv6VfScRb1FEvOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XM5YQI/lslHiglH9MyBwMrqHkHW+wlBZynVs2tpt0XI=;
 b=v14rGeE86zLLgHVgWaedHjxYyIWZHYibmHKMR0zmOmATMdYKoKa6n+vh9vXwdBvybvXAMbB3mAq/L77S26uylJCuck5pHjUixVfKtLQwvOM9i620qIKLEv161ZEAMHsCyaP7eBtX/rZFNnzx3clZ72mKhiLROzRUZMV9O6740RbefTP4FHG7lU3bdNNJr/jL7q9eraQAyKOJhMEkNMt8Qd2mWFtsVZr8ACLaVUHagJMQmMY/RjpEU4stUnqF8h7iaGaWY9TRZrm4i/FZqtyfwRHyyyUtgh6OSZ15N4Vqz1A7mjAoVIFnD2JkkffPHxn13GOHCRrW4TbOTvl0zk0yDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by VE1P189MB1135.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:148::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 11:11:37 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0315.008; Tue, 11 Aug 2026
 11:11:37 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH v3 4/4] python3-dtc: fix build with swig 4.5.0
Date: Tue, 11 Aug 2026 13:11:20 +0200
Message-ID: <20260811111120.17612-5-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260811111120.17612-1-jaipaul.cheernam@est.tech>
References: <20260810154520.12466-1-jaipaul.cheernam@est.tech>
 <20260811111120.17612-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0028.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::7) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|VE1P189MB1135:EE_
X-MS-Office365-Filtering-Correlation-Id: 57110213-e3d8-4073-557c-08def7994fc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|6133799003|11063799006|4143699003|56012099006|3023799007|10067099003;
X-Microsoft-Antispam-Message-Info: 
	wT9hOtMP01k9G40O/rbRYVQmagQfrYu3BDm4iJXSuBnzsDeQY6ttRB4iAoO9lizshcBn/KGJX/R8CIOefa86yIPD8wDKT/vu0NKIRDZi0QLf/4XH2sml3B20TUDJTx6eymK4Ws+pYsekqLduSuM/r4ZS7pvbipNlSqymVZA5gRd/xupwckyirZIZCmB1yhOTrDCJitjX5mhQSdrdNbkOhGBqLJnhaJoX7K/UC9ZnrnXlG31eqeTbqsYxrMuQS2KnRD01mw7I7rSyxblFBXONXNzi7pFPQibKLxik6sAXYsxZqPnkDz+tyxmZ7jcscd/GTV3kdwvQtvaIAPo6oRDj8cXQt8nDLka6MhbeaAMBMuIvrqBQnjNF5G6IVLR5cUZDLwh/HuDCQqhXiHj2s/EuEFVqwzp4quDeXeMQ115KeaKE3xU16syYm9R5u+p80u/gT7W09q0xttuz52Ja/K7j/VRNtxFPoB7s8AtL6gokWGP0BHvbjfMLwKF/8sRKUGH5k4UPeD2vljs0v6G2OxZNdATMjYow8NFpunDM/FiLm7tZmTqeMJ1j16gi8QjAWHSeafn8SN0fNwWkmqWWAWnxnm+OJMaNQkmeXSDhtHMPwpeLm/EynT2795qRvTdKTyKZLRj0oHZ4Bfbh5mYTjYqvOdCkRSmjxwTweZ834nl1StE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(6133799003)(11063799006)(4143699003)(56012099006)(3023799007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DWngt8qJ1oMr7IMFUziyfJXx66n4pFJiWkmPK5VwxPybjzr9Gofteh2JLvFn?=
 =?us-ascii?Q?s/EsHkKb2Ic++YqgnpQbpPwHyWYM2Ysk5SQOoz97Tt6HcOWJK/UWNknsKsCF?=
 =?us-ascii?Q?yi5+xs/8K2LhzIsiMEsuJ/yRLNrRtgxKyMJt3GsH0OT8MNITy0ljtSJT+NfW?=
 =?us-ascii?Q?/0eAv+MDCSEGjcsJLNG2yH+e51346wRHcSeIwMmoPkGqf1P9x20GLwLYkFbU?=
 =?us-ascii?Q?cglTeJTrjuEOR18l1QHtvHX+hCt4ODsj5T16MoJqPlUnDfuBvbJiwDwGIbi+?=
 =?us-ascii?Q?AdWl+Ws/Dlad1qNAjLPCUWO3NGVFhlE5ZwyQtmdIlf1GZvDPiw4OEsnBt3vj?=
 =?us-ascii?Q?0WlPRyeYwsZtVWXJ4c7+NUqB0/86gOqn2Adcm7/NowxkcfX3YGBqMz59BMks?=
 =?us-ascii?Q?rINyZbZ2qXwn+W4QLwlmaqaevkwJL9ETdYKwx1Tsav0BPYkqLUqMryDVRigY?=
 =?us-ascii?Q?u5F5yxsaUjEuK4WQEQcB8FvzDgcg/hs4zYgRTkBZDPIApmNhEgEIs0c8Hz1T?=
 =?us-ascii?Q?rKDJXMRdNQgt26L/ErXgBiSrGQKI/lxz7sI6dU8RP/w+kHRIxh8o38xWPX+a?=
 =?us-ascii?Q?fQ5WgrOgAJ96CVlCoMwmguoc72X9EyTyajGrmELOcGn5ciVnYXvQxLgyBypq?=
 =?us-ascii?Q?JZvDrYMJUe80ABl1kZ6zgBEgn5NjTLLLg4a7dkX+3TLPBxNfpX2bTbmpmqUD?=
 =?us-ascii?Q?rao+4xDFDsGnFMw5hKpRUVi/n9KEnGxgzSqibxOd+FpnFQofztz1cr7IEHpI?=
 =?us-ascii?Q?wYr6DtRqW3z4qnY1URUoUifysAPG3hYx/keYNqVUw+jBD38pbmOKV9I4uzsq?=
 =?us-ascii?Q?enH8/BuRkDR6Ry0999HfuaQ+1LC/M3veRC3U7GwjvgSJe3qR8QpvDU9+MnDN?=
 =?us-ascii?Q?PDiacUJdIpBVxskPDLfs0yjWj8v0BsBypnCYWHyxzaDgKRqaeVjMqvbJti+3?=
 =?us-ascii?Q?RmO/WrRnVVIcXt0GGl1g5OZfiea2dojd5TegMiKfVVILX33srzMgMxqSyHBf?=
 =?us-ascii?Q?5TVyc3ezj0LDlTi7xU7R9GDSbUclj1UGo1xnFlDDzDRZKbCDl+BtA9pGDxWy?=
 =?us-ascii?Q?vxDIzdSpecnfgiFKOBdBl+lUnc0PsLyjJAnDy0hLkUOZ8jpqnEpqZxi8frSv?=
 =?us-ascii?Q?hUWhv+rpIwEZafW+8fMwBe1heTC/U3UuQmIzM/NIV0tNVKoc2+fFarIr+Zxx?=
 =?us-ascii?Q?QJn6GpbsCmiPLo8wl7T32kmKNWY9r7vevLfJxYPOvAJs3iB6ZlvkaCnAmvlf?=
 =?us-ascii?Q?LxfjMEDPD8GxlGi4NCwZfOIKJbN9WAlxFu11V1IR2FTGXFTw9x8WOyno+gsX?=
 =?us-ascii?Q?xtMtVvc3je78VHydtgmRCoR51/4ujzQVl+4Iq61okkzzEOy0m+9Gek2Qqw8n?=
 =?us-ascii?Q?I5Ty7VJQoGOpcL/GFKQObQqtyRr67rKQsV2f3W4xSS498KnZ79GBQHxV2tJn?=
 =?us-ascii?Q?Zd+b5DrmCLR37dtK0SQHHijAyO0ey+UHyQ6TraQnUT2Y2KBFEx4qayZaGypE?=
 =?us-ascii?Q?Z1ZkUJdy7H5IrDO8Juo8OW4VW9U8M2KHi6FP9dcDlbMGpxvJ0h1An4ayDJzg?=
 =?us-ascii?Q?YK2oJtI7ihV114wApx9wUVOpkLC23eAnupNjaIinntx2XC5XdJwBO4EY3m3D?=
 =?us-ascii?Q?U/8Xh/nwz6qgSEPK8Ak2Uc+fqkiuAvryH/JinrbwTZoYRnHwZp4kU5+kVgFn?=
 =?us-ascii?Q?JQHAVyvIuvWp8VQGcjJ62XIzb/QlrodFoFMwXgATpAnAo7hJ3OzX8Kdurze8?=
 =?us-ascii?Q?KGHnilbAyfv5dRs06NckfDz07icuGq0=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 57110213-e3d8-4073-557c-08def7994fc8
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 11:11:37.4865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8AqdNzJH3IOjYoHj9ibfKTdEt2UR6OuykHoD6RhAGyAIcf3OE4238uHTcvNPwQQieCHaLda8p2cvyh0Kl7pXixPhue3tmKaUAsuoskHWIvE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1P189MB1135
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 11:11:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243191

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

