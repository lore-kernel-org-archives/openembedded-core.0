Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2FC6C5CFCF
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 13:56:08 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.32])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.54564.1786456560011933770
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 06:56:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=h+HgIzGs;
 spf=pass (domain: est.tech, ip: 40.107.130.32, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oPTIpcbXjNPdhXE+Uv4Q2siRUsSK7mHRvKQf/l9yoZhCkSnGpPYTNbS8dKIzaaODdtKKBYmSBFDfir/qkqjrtMigjK6HrlcyS0ibQjI97MExLRcbMT353hWUnOu/HhiokA1qMItAWqd6ReK5Cmw3L6Xi/0PtyVH6gXR7jA4/lkhyZ8pam4pruE02ix2UgZXrFtVr6B4iLY2P4uImrBBXqaVwyWD86tALcWD+y7tLtoetVPXf6HAppGBWIxWdJblXNGScwXONockfsHOrUuQQJvTU5+ccZJkPVQnu8KY2pCx3FZuM0ppCPraCF69D83fTTVyXu1GYZEKmahWWY4B6qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zX+ZLrgvirMAlexh0lAUvEz3J6HKN8lQHMIYvuUBnVw=;
 b=wHn9xDduRLhm4YLFQlqI2zC8BDoj8ib3ungElbI+0brYxC5mtK1r3keH6yq5kZ8UO+jtm1k/onsKwYW7nzot5OkUFc6Gth8+S5nEY6auy2/hKuDX3r+RT/Cp7KEY7zvsz/MUvfCcAvLKcQz5S1XJokoiXlTZfXEOpMPLXJ2sTz/mngwcnRyYGy7uqqn0xOZGMGTLc7DSjlZ3S/dzA2TeFOsZYTy305/IpmEusEwBna6HEycw5i01OWrjdzYVsaUMWzpFziASxqwE3MzrBFJ4SnnzllxTImagdv+92azu2fY8PK6BCGyG2x0ewacJB6ySWkR6Ce77V7Mfde9B8zJgTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zX+ZLrgvirMAlexh0lAUvEz3J6HKN8lQHMIYvuUBnVw=;
 b=h+HgIzGs9nGWoOdFUETeQAK3ctpQFzblr/NPvNE/WsQBPE8+jajT4OG6Bg/C2FJBMzRfrE0/voIh7TU88imMKMZqvOQGTf4ZsT4ac+Fyl/bIOLvnlF1yjyqGA66WRTGKaKo7FyQR8SK7+Un01HU1ORMjyTUHk6yzS3ZTChrFnk4QkZoQ/ADF3idB9YQKvB4ycrRMQNK3QtV+0DqvGIzIpeL8hev7fzaI6CE7Cw9xiam4r8hTNv4Rf7a41949uJf/z2Y0b1jWLY6ifd243UdaW1ZUWmDiEuzXm+bPi7DofykJLYQAVrOuJkftbefrxtbI73NqZpkoO/p7nBs9ViiVew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DB9P189MB3526.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5f6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Tue, 11 Aug
 2026 13:55:58 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0315.008; Tue, 11 Aug 2026
 13:55:58 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH v4 3/4] u-boot-tools: fix pylibfdt build with swig 4.5.0
Date: Tue, 11 Aug 2026 15:51:59 +0200
Message-ID: <20260811135200.18942-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260811135200.18942-1-jaipaul.cheernam@est.tech>
References: <20260810154520.12466-1-jaipaul.cheernam@est.tech>
 <20260811135200.18942-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0046.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::20) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DB9P189MB3526:EE_
X-MS-Office365-Filtering-Correlation-Id: e48ef382-c576-4b2c-a70b-08def7b04591
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|22082099003|18002099003|4143699003|11063799006|6133799003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	64GQrV4UR3y/HwodYNBzTq3EQc2iIdFiUImhhUn0bDCtQNxJtFXPC2nPdERMsgRkEveuIjiNJ2fLPsnufF1MXTza318b3FzMB8WBb5Cg3eoDroRlkc1IvQwdd83cqW2iFWyHZUPiJm1Mo5i9QM1nBOwPtqpR4+7GEQ/XxZHK6qL3FBoH1SRwSy7bc9pckFceBi8POH0qZRFPO1gHXg6uBSyfCwIgdnPPKqLnZkKDH2QiqHBvz2LEcMkHJoGnJgg/+cUDs9i1579IPTHCLwVoU55Q6Yf7BRuhLJV8cnGY76j/nTdwEWzl1NKP/gNkHJ2TF1+FaLg5s+93zLdGeGoEo6eQMyxP5XEmAY4R/h2fsTQxbi2XjsQbAkeuL2JQqqGASzem5ueib3mHM8WC+gJEvEu8fXv/lp8/UnwIrlq6D7g8BMPFX1d3p4o7rUyIwc9WrTTIUPnbHRB21LixyZHYsZpr/yfGW8XdYEtb2Vt11tX7qte30MfbSioYFDpbT6ZvlA0roOU9y+J6qnqBaaE29zFOdWtbhKO3yWdCAkHh+jdS9Xp4n80X6FGaEebq9XvD9qoHlm5zbRkH7tM5KU8jWqW5GDQiJ9VyzdUtLqiT0fgL9aaLj574+YRPbr130X2nJtOGX7CiS5Vm55MJVjWsQCXbPcr3kUzcwA8UeJGUKJU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(22082099003)(18002099003)(4143699003)(11063799006)(6133799003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Q/sdDHaIgjRYPeqOVKQQFvchEcdRcpzHqHaWYN/i6GSZhZ4XDMqBBfIvssKV?=
 =?us-ascii?Q?H7BIvSYRK+TzWylhzg/02XYmkMSCw116memJISCEDJokOqVX+V3olkxMIorQ?=
 =?us-ascii?Q?rG9zN9F2jPK/MLqre9gp/nMiVNpdw87ZenJNnY8kT4HMj2ktAdgUWHdo2qPk?=
 =?us-ascii?Q?JTHF5WYlEUZPIwjolTLeGMUEbECdAuSrONvrMBOoD+v5npmtkrZq5dVhJyV7?=
 =?us-ascii?Q?ckZTZaL0BIAneGQT/L+Na/2/a+1rZqxKpZ5K8IYwuXLyBOamxUquYawv8yU/?=
 =?us-ascii?Q?MzwZ85PQSr4INsV7SIwS7N/fFA5dmNEX4hhPRgyf4nWCGoqW+9GIY68FH6r9?=
 =?us-ascii?Q?DOKdfa2JvDy5ROjXmb2vMimG4/TB3DIASH6lb/nsKisyoFER89yQTuEbiEAb?=
 =?us-ascii?Q?VoEr5GUYa9aJptx5sG3IPhQXhbU/4OztAPmI3gPJZ3I6qcrAg/28g0W9iSKj?=
 =?us-ascii?Q?DOOWEDRiE0PoGBVlr3DuKjc/9jNGmuwsr2IpUenogeeLlD+9Yw+IRlr2Bb6X?=
 =?us-ascii?Q?iZW1R5lR/xwpd0dgXmr4sbQ8oWg0r3z66QcOa7z6awZ9c3VvOyzdBMgSJVes?=
 =?us-ascii?Q?wwe6TRzyGP3dvffcX9R9w8JTAFnjUrU/1p3DihwScCtaXT+uOj71gmwWVWaX?=
 =?us-ascii?Q?U6ut0vJsEJ/5d7lPCmRiUTvhzU61yHSJIX91OBB+gmtzVIf2bXwF3aIXeRGU?=
 =?us-ascii?Q?VMnbNzQtH5V4BnvgBlD47iQRVaqv/HDA6xttcQPvL2ZjZ8NI9NEIOIj7JP+l?=
 =?us-ascii?Q?AQGqEboq5hTruRp10sETnpwHkf4LISUNYrMan7Jijt40FrU0Lyhxoc3GwwYP?=
 =?us-ascii?Q?7L+0yqduylbikW5mHajBeKAbY7PBKGlwzDP0j0Gl7JDOVhbQ9VV/IuQpRU0D?=
 =?us-ascii?Q?+Xf2uDbM3lnkWBiqFw+sEBkPi2BpGBzE2Xu0LHiaoOdOt9z3OSyOatM2iQ9Z?=
 =?us-ascii?Q?L3jfLo4tDBSnmGhtm8D8vTfMbsZJBWnfb8Gd0/5yZG1Gaifi0AEza7Z+AhIq?=
 =?us-ascii?Q?gpYc6UxxdAaTFHzoqvrYIdHFePMccRBQdQ0cDTNmoGuPexQlPqGGFzdOTyjH?=
 =?us-ascii?Q?I467fRBxvcBsYWgpdpq8Jm9lJ03ZL8qyrcS3wErtYGNncSjMcjum+yuAm4Q9?=
 =?us-ascii?Q?B7yy25QknH8aMh0vjc4ot8IbENtukPUs+H1g5qyZInE12J7hFb7o+rLQqvhG?=
 =?us-ascii?Q?Ypnj4NByCfoWO19oaRPtKwk3qP3SiSYRO8IEI+ZOzgsY9aubM2Lf7033wPBv?=
 =?us-ascii?Q?rk166hS84gWprmge4fWNSuuJOx1DJypAxBo7D3TXMJ+EaZeQ/ZFmZPRyq65O?=
 =?us-ascii?Q?6FrUBGmB0Im5GBKVg6g5Ro6G6OI+hMLx+lCGkFqa5C4U3U37RWnMofOErNzT?=
 =?us-ascii?Q?U1s3JU6kr/Ay3JKIvUypL9jJSnhT+lVr09lBWi95zE0OEVYQsn8nBsHYca20?=
 =?us-ascii?Q?qvG09VRjYmCwMvxfgD9ASmuFoi9DIVrd7eq6CnVRIBidD01skuagZGpovtc+?=
 =?us-ascii?Q?AAWBktqmCcx0HEbV1j62uNfpw5Z7gaU2sPlw66wNCMXd9sPMtwaTOVA3Sx2W?=
 =?us-ascii?Q?KgjWUIhY9EFzTIRJWOLNW1Z1T8XY+YWv8g5m5oxq8zfMg1BQ5Diwf8dxeOBQ?=
 =?us-ascii?Q?sJ7sBS+l3OSqX3yxW1DLNXoB9zy6qdizYTuGNbTFkT6K5TuTWZu8oJVQgbp3?=
 =?us-ascii?Q?BnUqfkqHD0ILK7dDP2bKuGXKcuD3EGzhxf7u9/x0ugqYGLd1F7x0HrzDhe05?=
 =?us-ascii?Q?QR0AcfpNKZwDjCzjh/k0h13jiOKXfX0=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: e48ef382-c576-4b2c-a70b-08def7b04591
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 13:55:58.7459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HhC8STyC46cF2YdwDoHqOKabml8usEE3H5d/MZFolhrpZtpjBFe2aYJ1hxiu2CBrs7GzdIUzec78yzVZ/LU5yr4qeeDx/0WEZbfdBB0bzs4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB3526
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 13:56:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243202

SWIG 4.5.0 removed Python 2 compatibility macros (PyInt_*, PyString_*)
from its runtime. Backport the dtc upstream fix to u-boot's bundled
pylibfdt/libfdt.i to replace them with Python 3 equivalents.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...-removed-SWIG-Python-2-compatibility.patch | 55 +++++++++++++++++++
 .../u-boot/u-boot-tools_2026.07.bb            |  4 +-
 2 files changed, 58 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-pylibfdt-Replace-rem=
oved-SWIG-Python-2-compatibility.patch

diff --git a/meta/recipes-bsp/u-boot/files/0001-pylibfdt-Replace-removed-SW=
IG-Python-2-compatibility.patch b/meta/recipes-bsp/u-boot/files/0001-pylibf=
dt-Replace-removed-SWIG-Python-2-compatibility.patch
new file mode 100644
index 0000000000..c1d0204e32
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/0001-pylibfdt-Replace-removed-SWIG-Pyth=
on-2-compatibility.patch
@@ -0,0 +1,55 @@
+From 886616d03b6afcc5ce8b34e7af91f7ccfbb0a5c Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Tue, 11 Aug 2026 13:21:01 +0000
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
+This is a backport of dtc commit 5008d1d6a356 ("pylibfdt: Replace
+removed SWIG Python 2 compatibility macros").
+
+Upstream-Status: Submitted [https://patchwork.ozlabs.org/patch/2283713/]
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ scripts/dtc/pylibfdt/libfdt.i_shipped | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/scripts/dtc/pylibfdt/libfdt.i_shipped b/scripts/dtc/pylibfdt/=
libfdt.i_shipped
+index e4659489..326a15c7 100644
+--- a/scripts/dtc/pylibfdt/libfdt.i_shipped
++++ b/scripts/dtc/pylibfdt/libfdt.i_shipped
+@@ -1033,7 +1033,7 @@ typedef uint32_t fdt32_t;
+ 	PyObject *buff;
+=20
+ 	if ($1) {
+-		resultobj =3D PyString_FromString(
++		resultobj =3D PyUnicode_FromString(
+ 			fdt_string(fdt1, fdt32_to_cpu($1->nameoff)));
+ 		buff =3D PyByteArray_FromStringAndSize(
+ 			(const char *)($1 + 1), fdt32_to_cpu($1->len));
+@@ -1064,13 +1064,13 @@ typedef uint32_t fdt32_t;
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
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2026.07.bb b/meta/recipes=
-bsp/u-boot/u-boot-tools_2026.07.bb
index 9e7a178310..ea90b726c5 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2026.07.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2026.07.bb
@@ -1,4 +1,6 @@
 require u-boot-common.inc
 require u-boot-tools.inc
=20
-SRC_URI +=3D "file://0001-tools-mkeficapsule-Detect-GnuTLS-PKCS-11-support=
.patch"
+SRC_URI +=3D "file://0001-tools-mkeficapsule-Detect-GnuTLS-PKCS-11-support=
.patch \
+            file://0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibili=
ty.patch \
+            "

