Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CCD6C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 12:05:28 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.58])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.148523.1783339517948815253
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 05:05:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Mhx375GB;
 spf=pass (domain: est.tech, ip: 52.101.69.58, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l4dSsPEkilUD+C0sLvXYIZW4jO2ORrYaTlHGlw1nE0KN4NSSDcynft/e2fcJxYUYEmC3wepwngVFk8tzLhJmTNWd4x96BIlptL+ZrfskQchWK2uYcm8RffMw3FOXa5oO03du1bOeBAktfX8IH/cgo/e/BM8ypes3t8kHMJTNd3JZ2JTh/OKggji/gQjlNOkT62pYiqOMR+xRfsa3a+nUctPkY9e2aOEXbbrW8ySNFoL9QMWghe9Jog0btBOkpRZ+3IDtqLHY/CPykSoI4Y8rEd5p4Ujs4+X+bmvOB9O25AhIS9Z8Bk3K6n3fGEQPt7cB18kgyB6g6i/nJ9XG87nJMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gloNKkFynzRfhxd2yzTa1kJ9V9oRNraaEHxj2l3JK2Y=;
 b=Jo8/3rjfbaA2bjgciseXy3muYReVuyf7JaVVyelxg6Yc3ct3VGEpQvPwe/2IfWde2EHRc4OXSBBrTumfnbScLq+nH0LPC7SoUu1P3Ze6VL+MFghb91KXK3QEQZg/Dlq1nt2bFBnrKGR8426mxyvy10ksfKnGUz79BzFEmwBnITleP+Aj26UDGAEPYalrlbraaHxTZpelnoQiwgQBaDcf43QEWFbAgQ5/EkwJsKLegrdqKObu39j0maWQ+eBQ1zLi9F0kWcMv6bjDXupGXqF1P0Aj+ig6Bbm6gN3zFP+BOOo6jp31x9OrehRxDSENbQ7vOOP28vp+f7BXYlxX0QSeng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gloNKkFynzRfhxd2yzTa1kJ9V9oRNraaEHxj2l3JK2Y=;
 b=Mhx375GBPyuqieKiV1nXemQgcBnjUr+tTi/1sYYwLAGk0/my3mSfiNatCUnmRXEGMsGK8HzO9BpDyp6Yg2kSIkYdPTDXxoQ3xcx9QRohliug4hYitkuAKM8DL/Qo2TMJiHhG9nTyjthyOiSIokcbnwSd5b1rKHshGR9oh6l1ZDMgzA4mRQHuJ1JPrDUR9TZHfIHZ3GAwSMtLkg+YAZ6oH/bcrcH1HCNQzRM4nnwXX+tZPO5k6hMzvWVfXz3IR/8DT7ATTDC0YZlHow2O8gRDQz6pqkF/YxHNmVa9tSi4cNei+zsq74xvz5HTJpWiDaV1PfWivP26gIq959RX65B2gA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by GV2P189MB2453.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:d3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Mon, 6 Jul
 2026 12:05:14 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95%4]) with mapi id 15.21.0181.008; Mon, 6 Jul 2026
 12:05:14 +0000
From: amaury.couderc@est.tech
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2][wrynose] python3: fix CVE-2026-7210
Date: Mon,  6 Jul 2026 14:04:54 +0200
Message-ID: <20260706120508.37474-1-amaury.couderc@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0099.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::14) To AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6ad::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP189MB3196:EE_|GV2P189MB2453:EE_
X-MS-Office365-Filtering-Correlation-Id: c5fd181d-9a5b-447a-a62a-08dedb56d648
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|18002099003|56012099006|11063799006|29003799003|12006099003|6133799003|25016099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	xG1BtLvQLqlb5p11WW178p5oMFCLFoILl7w9X7zSG3crmblYiMpQ2nIzuelzvguGMMRjZBcSZEyRhKYeeQ8acyLSTJqwSqMO0rPxoLYfBu+2mUJWNjACCPIopGA8q2mMq1wodzgIjiAg9L9HOxc1zVEwYpnpCWVT9ZbcFSVnZcOor0wXq8e64pPFi70/uv+TYo6+nvAP3EAQPRJI//G+H0X0+Z8un513qTfSqQ0O5jq3P1nmzkyaR+d4yatgHV0ajQ+gkGV8UT4D1RsjrJEjy9yUUA9ULzH8F0kiHphkP/Q8LM8FTuShfIQCR3u88VW0SlV2Uq8W4qzxLRaLo3HdVqzxIvJ7JwJcLekZGsqbZiv3s2ktXKkeHzVf7rTIGs1lht9D0y9BPELgM8AmT3I/2CtmJiLPDWFOEaFHPS0/6oEO6d41WXKBs3WTBN99M3+MOMI3MCbFiC/ksz067u2hk97PHXHOEHF4hc3PvdYkezPeNhhBtJY+H9/Qh0uC/YcG+BpGZEW+mtO1BUAfvCeirAlXcCIE3xLRMwnLfUDa6SVB0bpWRUzzFx/QCnDLhAl198WOFwkxipne0KhTPObCt32Jm0zQzgxZXfX0o/JgIhrwOTFFpxEP22EdOTsIe1Ji4usvihccZDiI1Zu9bOs/lBqn0S3alumIMmmhqweI9/U=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(18002099003)(56012099006)(11063799006)(29003799003)(12006099003)(6133799003)(25016099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YRhunaWjnXxhs9jaPHbkUOqASvyh+qV0Zkn+uKrhpN/x9MusErq2VphoyFb3?=
 =?us-ascii?Q?DGJgUXpWn/0P1lwNKFOdlUO9uLXefCWEQRF/bdpyDvLd0YWkJl65gNTodcgN?=
 =?us-ascii?Q?vJXRcfjtikNBgryk/rr6Ik/FsVW8C9SGn5FmV6dZZAZTwu+MbxzZuhnBx5gp?=
 =?us-ascii?Q?sksX7FyVWsaeBOhuHKr+WffKxYZ4T/FUNfU8hwbbNI/NoXcpbZGiv5hnD3Gz?=
 =?us-ascii?Q?dAh9/BcxNh/kSohuq3pxofb1nR3w1ADOmbN/YWVufLyW2fj7iSgxlzr5gxcJ?=
 =?us-ascii?Q?CUwG+djm+1BPj6WbXS5YP2XKqMK09egvZxwV/Bx/lZQGQziy0ryJ3h/Bo38Y?=
 =?us-ascii?Q?rLPGpVEX4AyThx0CBII90xdZSkQEWC9h3xdZYQimV6XoLF0iDAcz6+fB5RZC?=
 =?us-ascii?Q?AJj0/l0XhhWd0c3hm8Y9bTFDmCxajLgg/By8ePVCalle/KO6ETVdD2DrJp/e?=
 =?us-ascii?Q?3zEK2+vMpN45FQ/C7uWZux4vXfNSsoZE4l+QpJS4i8bHiDsN0rMaknlIY2HD?=
 =?us-ascii?Q?AurSqy+mwfR+Qk9tSDg9c1wyVwNIfMpUknGnqxg7Kw1ncurCAj2M8v2C4Ewx?=
 =?us-ascii?Q?nPGZoY0n8gUT4qsMa6vNUWTDxxsNMOjxkF8T1dxNfsBaa7VwenGfKsMEOkdC?=
 =?us-ascii?Q?I1WNsr3nMp9D0jHQlW+HAgczBMaNUMp6AsPCCfrsWQeN5CXPuocJ4XvFq7kh?=
 =?us-ascii?Q?l2sQ/JE0zemCxy6a47uJGUgi1YIOYyePBSoKERMR3tjoo3im0fW3K7vxkymZ?=
 =?us-ascii?Q?YItNJK8r7RpeQx8vRfDcW1FS2FZv9gjZdYIRFE65gt+18z4RbD4SEaAmbomJ?=
 =?us-ascii?Q?THIgRQBxRMaMSZsxV7BIwg0WpvAUcKklyKxCOovMGHUG9AIX4ApI3NXjbsGM?=
 =?us-ascii?Q?YmD3xQbEjJyKL4Ek0X4CbmCeumfOu8mD9+3t9EnKVlbwRYRjuEBGZElFSl4+?=
 =?us-ascii?Q?fmM0gaXpOvvi/zE1kPvx9GUPyREhn1Wcg83Az1V4UbGophSnsrKwvzlugrSF?=
 =?us-ascii?Q?Wn9kGhpVXCY83Hboh/RQEVJ71uyD6/p+a7bi3bs0JtPiiSZk/bILrEUbQ0+x?=
 =?us-ascii?Q?3EvWmr6MLLJNn2btQBdDr3zf6O13BLXJ6Jjm3l4/4KszQvSkge+NDnzkatJk?=
 =?us-ascii?Q?J3o5BFAgPrDroECbV9+fxE89KoondaByPs3Gv+DQohvXh0INT/XSU11wWTcS?=
 =?us-ascii?Q?/Kd08g01DaL7/oGCUvrf39+FGUjni07n/Z/zpQyHG7HC3Vs/ft3lF6B2N+D1?=
 =?us-ascii?Q?wr/N7g3/Dlvn2jnTX41Pl5MEH4M3zo8qvS1qwjMOB0UxjzsuvXl3LOXVLaE8?=
 =?us-ascii?Q?Bui6jKN45B6amhruqSFJktO/k31UL2myS0EwLEiYoABrowusmCUHCjwRvVGB?=
 =?us-ascii?Q?HQotpxGb8tDIm/tD+dJpCZK3/P607Tbk/H7O6A1mnxRhE/8QU1uOKH64AouA?=
 =?us-ascii?Q?pIfFHKIx8xLmSPvCnu6mtk897YufvlFGLEx0iI3dy1ax5mWGqvwyid9Md/W/?=
 =?us-ascii?Q?gZIjTs0QraJib8kRyWVHXrv/NumZuS30MX3XSJaHBxaqRUUHNRtWhmVW9OM4?=
 =?us-ascii?Q?042S2/qe51O2cJaMyp3o07qcn2/J1Yv2GogDAVwsyfdpLNk9XtFeokMGO+7K?=
 =?us-ascii?Q?eGvxShZQGmFVn4ZmRrx7N0n35YmxADo3gtTi2yYjnI+0cnFmpNSd9keNzcRC?=
 =?us-ascii?Q?pkxOfX/VhOc/rjZbviGg1+gtJxrV9zlvcFPJ6IZ/GLJBKS9VoVm0CJhvqbBX?=
 =?us-ascii?Q?JcYUmF1bSw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: c5fd181d-9a5b-447a-a62a-08dedb56d648
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 12:05:14.2638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RTsME0lGeXCXAYBy4cVbzGvFya8FRnpBDU6XsyeXUe7hx+tlYTKczhLjSokjyXv2LOMw/o+Y03emJQGU1kesGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P189MB2453
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 12:05:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240262

From: Amaury Couderc <amaury.couderc@est.tech>

CVE-2026-7210 is a hash-flooding denial-of-service vulnerability in
Python's XML parsing modules (xml.parsers.expat, xml.etree.ElementTree).
An attacker can craft XML input that forces O(n=C2=B2) hash collisions in
libexpat's internal name dictionary, causing excessive CPU consumption.

The previous mitigation seeded libexpat's hash function with only 4
bytes of entropy, which is insufficient against a determined attacker.
This patch upgrades to XML_SetHashSalt16Bytes (libexpat >=3D 2.8.0),
providing a full 16-byte secret. Older expat versions fall back
gracefully to the legacy XML_SetHashSalt via a runtime NULL check.

NOTE: CVE-2026-7210 full mitigation requires the companion
    expat CVE-2026-41080 patch (raises expat to >=3D 2.8.0 API)

Backport patch to fix CVE-2026-7210.
https://nvd.nist.gov/vuln/detail/CVE-2026-7210

Upstream fix:
https://github.com/python/cpython/commit/24b8f12544468e4cedf5bfbe25442fcd49=
5391e4

Tested with ptest:
Before: PASSED: 43903, FAILED: 0, SKIPPED: 2471
After: PASSED: 43903, FAILED: 0, SKIPPED: 2471

CVE: CVE-2026-7210

Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
---
 .../python/python3/CVE-2026-7210.patch        | 136 ++++++++++++++++++
 .../recipes-devtools/python/python3_3.14.5.bb |   1 +
 2 files changed, 137 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-7210.patc=
h

diff --git a/meta/recipes-devtools/python/python3/CVE-2026-7210.patch b/met=
a/recipes-devtools/python/python3/CVE-2026-7210.patch
new file mode 100644
index 0000000000..337130d9b7
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2026-7210.patch
@@ -0,0 +1,136 @@
+From a7fafeebaf33995556a37e9eec4f6a6bcfce2e67 Mon Sep 17 00:00:00 2001
+From: Stan Ulbrych <stan@python.org>
+Date: Sun, 10 May 2026 18:36:26 +0100
+Subject: [PATCH] gh-149018: Use `XML_SetHashSalt16Bytes` in `pyexpat`/`_el=
ementtree` when possible (#149023)
+
+CVE-2026-7210 is a hash-flooding denial-of-service vulnerability in
+Python's XML parsing modules (xml.parsers.expat, xml.etree.ElementTree).
+An attacker can craft XML input that forces O(n=C2=B2) hash collisions in
+libexpat's internal name dictionary, causing excessive CPU consumption.
+
+The previous mitigation seeded libexpat's hash function with only 4
+bytes of entropy, which is insufficient against a determined attacker.
+This patch upgrades to XML_SetHashSalt16Bytes (libexpat >=3D 2.8.0),
+providing a full 16-byte secret. Older expat versions fall back
+gracefully to the legacy XML_SetHashSalt via a runtime NULL check.
+
+NOTE: CVE-2026-7210 full mitigation requires the companion
+    expat CVE-2026-41080 patch (raises expat to >=3D 2.8.0 API)
+
+CVE: CVE-2026-7210
+Upstream-Status: Backport [https://github.com/python/cpython/commit/24b8f1=
2544468e4cedf5bfbe25442fcd495391e4]
+
+Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
+---
+ Include/internal/pycore_pyhash.h                       |  8 +++++---
+ Include/pyexpat.h                                      |  3 +++
+ .../2026-04-26-19-30-45.gh-issue-149018.a9SqWb.rst     |  3 +++
+ Modules/_elementtree.c                                 |  8 ++++++--
+ Modules/pyexpat.c                                      | 10 +++++++++-
+ 5 files changed, 26 insertions(+), 6 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2026-04-26-19-30-45.gh-issue=
-149018.a9SqWb.rst
+
+diff --git a/Include/internal/pycore_pyhash.h b/Include/internal/pycore_py=
hash.h
+index 84cb72fa6fd..3056dc44cc0 100644
+--- a/Include/internal/pycore_pyhash.h
++++ b/Include/internal/pycore_pyhash.h
+@@ -27,14 +27,14 @@ _Py_HashPointerRaw(const void *ptr)
+  *   pppppppp ssssssss ........  fnv -- two Py_hash_t
+  *   k0k0k0k0 k1k1k1k1 ........  siphash -- two uint64_t
+  *   ........ ........ ssssssss  djbx33a -- 16 bytes padding + one Py_has=
h_t
+- *   ........ ........ eeeeeeee  pyexpat XML hash salt
++ *   eeeeeeee eeeeeeee eeeeeeee  pyexpat XML hash salt
+  *
+  * memory layout on 32 bit systems
+  *   cccccccc cccccccc cccccccc  uc
+  *   ppppssss ........ ........  fnv -- two Py_hash_t
+  *   k0k0k0k0 k1k1k1k1 ........  siphash -- two uint64_t (*)
+  *   ........ ........ ssss....  djbx33a -- 16 bytes padding + one Py_has=
h_t
+- *   ........ ........ eeee....  pyexpat XML hash salt
++ *   eeeeeeee eeeeeeee eeee....  pyexpat XML hash salt
+  *
+  * (*) The siphash member may not be available on 32 bit platforms withou=
t
+  *     an unsigned int64 data type.
+@@ -58,7 +58,9 @@ typedef union {
+         Py_hash_t suffix;
+     } djbx33a;
+     struct {
+-        unsigned char padding[16];
++        /* 16 bytes for XML_SetHashSalt16Bytes */
++        uint8_t hashsalt16[16];
++        /* 4/8 bytes for legacy XML_SetHashSalt */
+         Py_hash_t hashsalt;
+     } expat;
+ } _Py_HashSecret_t;
+diff --git a/Include/pyexpat.h b/Include/pyexpat.h
+index 04548b7684a..d28d6828975 100644
+--- a/Include/pyexpat.h
++++ b/Include/pyexpat.h
+@@ -57,6 +57,9 @@ struct PyExpat_CAPI
+         XML_Parser parser, unsigned long long activationThresholdBytes);
+     XML_Bool (*SetAllocTrackerMaximumAmplification)(
+         XML_Parser parser, float maxAmplificationFactor);
++    /* might be NULL for expat < 2.8.0 */
++    XML_Bool (*SetHashSalt16Bytes)(
++        XML_Parser parser, const uint8_t entropy[16]);
+     /* always add new stuff to the end! */
+ };
+=20
+diff --git a/Misc/NEWS.d/next/Security/2026-04-26-19-30-45.gh-issue-149018=
.a9SqWb.rst b/Misc/NEWS.d/next/Security/2026-04-26-19-30-45.gh-issue-149018=
.a9SqWb.rst
+new file mode 100644
+index 00000000000..d1b5b368684
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2026-04-26-19-30-45.gh-issue-149018.a9SqWb=
.rst
+@@ -0,0 +1,3 @@
++Improved protection against XML hash-flooding attacks in
++:mod:`xml.parsers.expat` and :mod:`xml.etree.ElementTree` when Python is
++compiled with libExpat 2.8.0 or later.
+diff --git a/Modules/_elementtree.c b/Modules/_elementtree.c
+index 7ca03f1561b..44d59fcb806 100644
+--- a/Modules/_elementtree.c
++++ b/Modules/_elementtree.c
+@@ -3724,8 +3724,12 @@ _elementtree_XMLParser___init___impl(XMLParserObjec=
t *self, PyObject *target,
+         PyErr_NoMemory();
+         return -1;
+     }
+-    /* expat < 2.1.0 has no XML_SetHashSalt() */
+-    if (EXPAT(st, SetHashSalt) !=3D NULL) {
++    // Prefer 16-byte entropy, only expat >=3D 2.8.0. See gh-149018
++    if (EXPAT(st, SetHashSalt16Bytes) !=3D NULL) {
++        EXPAT(st, SetHashSalt16Bytes)(self->parser,
++                                      _Py_HashSecret.expat.hashsalt16);
++    }
++    else if (EXPAT(st, SetHashSalt) !=3D NULL) {
+         EXPAT(st, SetHashSalt)(self->parser,
+                            (unsigned long)_Py_HashSecret.expat.hashsalt);
+     }
+diff --git a/Modules/pyexpat.c b/Modules/pyexpat.c
+index f82f8456e48..437fd5fb61a 100644
+--- a/Modules/pyexpat.c
++++ b/Modules/pyexpat.c
+@@ -1416,7 +1416,11 @@ newxmlparseobject(pyexpat_state *state, const char =
*encoding,
+         Py_DECREF(self);
+         return NULL;
+     }
+-#if XML_COMBINED_VERSION >=3D 20100
++#if defined(XML_BACKPORT_SET_HASH_SALT_16_BYTES) \
++    || XML_COMBINED_VERSION >=3D 20800
++    /* This feature was added upstream in libexpat 2.8.0. */
++    XML_SetHashSalt16Bytes(self->itself, _Py_HashSecret.expat.hashsalt16)=
;
++#elif XML_COMBINED_VERSION >=3D 20100
+     /* This feature was added upstream in libexpat 2.1.0. */
+     XML_SetHashSalt(self->itself,
+                     (unsigned long)_Py_HashSecret.expat.hashsalt);
+@@ -2310,6 +2313,12 @@ pyexpat_exec(PyObject *mod)
+ #else
+     capi->SetHashSalt =3D NULL;
+ #endif
++#if defined(XML_BACKPORT_SET_HASH_SALT_16_BYTES) \
++    || XML_COMBINED_VERSION >=3D 20800
++    capi->SetHashSalt16Bytes =3D XML_SetHashSalt16Bytes;
++#else
++    capi->SetHashSalt16Bytes =3D NULL;
++#endif
+ #if XML_COMBINED_VERSION >=3D 20600
+     capi->SetReparseDeferralEnabled =3D XML_SetReparseDeferralEnabled;
+ #else
diff --git a/meta/recipes-devtools/python/python3_3.14.5.bb b/meta/recipes-=
devtools/python/python3_3.14.5.bb
index ed413dc1fe..83f6bf426c 100644
--- a/meta/recipes-devtools/python/python3_3.14.5.bb
+++ b/meta/recipes-devtools/python/python3_3.14.5.bb
@@ -36,6 +36,7 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Pytho=
n-${PV}.tar.xz \
            file://0001-test_only_active_thread-skip-problematic-test.patch=
 \
            file://0001-prefer-valid-entrypoints.patch \
            file://0001-Fix-ThreadingMock-call-count-race-condition.patch \
+           file://CVE-2026-7210.patch \
            "
 SRC_URI:append:class-native =3D " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-config=
u.patch \
--=20
2.34.1


