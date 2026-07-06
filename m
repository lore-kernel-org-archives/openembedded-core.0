Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F05D6C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 13:27:38 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.151023.1783344446077514243
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 06:27:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=G7NlT3+S;
 spf=pass (domain: est.tech, ip: 52.101.72.67, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IYHT+yKEhrHGGBPJdE+ZTBZ/GcOGIKqWAr1DDgESuc/4H3y/K4lob+51tEleZO0EGhbF02KwAgjQ3QtAmoIvJZ2BdUt8yYAmjE4pCIYLH9qAsqItZ5tGymeyOcCD4Jrtj9YMN/b9Y/mbbDwcFXZgLwn6HPynmLbU2kb8BEMnYqx7CmgnHMrwcoas4440yblbN7XeB+nb1ejfEKqtr2MdOMOFt0SVtHiREY350FBO0JeCZ7ORs79YHnIOSerE835AWb3EbL8ykqPFhzxzJy7J1TtM3rrLPWWffjve/+/x33CO8bEnV219mf9YFnvVmpiHIXnTkC9e054Sa/xYG1CqZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2gN2THP2g0eR0EG7/Ztqqz7qgO4x7UemYeaMFpF7XjU=;
 b=u/Z3ZMdqLsJ8SPKvxFQsg7D6M/zdzqrl+WlTuy7kE2jj0zOsH4yLTZNI5o00eGPiZJCZzM+9jp0H6dgVTweX/5H0nZKkkDzCnMcDF66DdVRvTgeKMOr9+XfbirJMjpHkuIEuDM3n7SVg4VoXAU81jnKXBYf5jSrZqoybxiqo6ZjcCASx/ZF+I537ZM/N3t9JFf4t33P+f0b3M/itNNC9cPwQRsXN0sg+dny5ap4UERqUAdJWajbKqoGrJAwEW8t3MGSo/rpUDtawvjXSz4PxH58xE2gaH4XdZvAAHAv+umPqRVOC0KvtG1UdZqycyfqCxPJN9/yuiEqN4TrHdT9Y6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2gN2THP2g0eR0EG7/Ztqqz7qgO4x7UemYeaMFpF7XjU=;
 b=G7NlT3+Se/rF6ItsSoLtNDFblgfmPzvwgGnfFCc+rmKG/ByJqYUDpn+1GLaP1HP9sPX9frBqBP35lLHH+7cUmUqb3Ni7dgCUxK11gFX7DRf51bBUajCgy69JwTd4gwwnRxNn0nQxjsfw52QSz/mbTHEqzyB7rdE4IqiOYwFHJvGTq68Bbx1ueSsG+aFYAJ4lvlWOAfaSuVDL6aYezCxjq4Mcg3axOsBG1MPNjJSBOkfpi0xV8wYtEjNmz1AB46Kymv12F709IBu0F58sWVmqUNUQRSnrKfj93JTWHSPx3qG/470Zd5meIDoKObamwbQstcWcJeZJQVE5QjPTEDBnzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by GV1P189MB2785.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:1ee::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Mon, 6 Jul
 2026 13:27:20 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95%4]) with mapi id 15.21.0181.008; Mon, 6 Jul 2026
 13:27:19 +0000
From: amaury.couderc@est.tech
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3][scarthgap] python3: fix CVE-2026-7210
Date: Mon,  6 Jul 2026 15:26:57 +0200
Message-ID: <20260706132712.51931-1-amaury.couderc@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P265CA0081.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::9) To AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6ad::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP189MB3196:EE_|GV1P189MB2785:EE_
X-MS-Office365-Filtering-Correlation-Id: 781e98b6-f93a-4a0d-0209-08dedb624e29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|18002099003|11063799006|25016099003|12006099003|6133799003|56012099006|29003799003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	a9mqwtdbYDp5aq1WzwfWSqPkuCqU7BusGxiOlJ/kiDe58rUHQaM8Y208aZwccI7A2MXb3TlVVnA1fqFdQ+H3iRg6JU59pzKqhXOJxT80h32MRtT8hB8c8zE6ct2EGvNqXMPtsBWouk6+6YXfrnEkQ67Oyl+0U7pBMGCBVYRMXDLU885wgQAST0BEL9G06sOF16VWIagA0OSdfHlrrh6h4yDS40taLZSwlDoomgPQ59TtS1qLt9z3CwX1KxbaFQJdvP7hdKtRSqblQDmwYdh3hh/XeGJD4H/EwdokqGzfbkSaig9PUmujNN6IO3XkDureuBvXS5FnV825RTZaPPx21iabIBm9OE1D9LZRVOeJrQCEhHvu/oLZgK+MZddZREsgsNInGwsHiQbFMtfdGLxyb8cOd2Ulq8qqvye+o9xaNvDyDLO/7kV+IQ1jbFABalS95R9vquPfgbij89keFeVUWdyFiJYSMfs5EmylyGUAkDPOI6BMC0UE/aI03DfliIztl1HaWs9YglnzsGureZQTU4c//SET6jvE1hLcqPrlbntAHn39Xkv/ce0fBIiikhQFtwYPByRAMSkWax5owRkcl2IliqbaeMyj3uNHrKYEkVY4z5bQhmHB7GPq7Di24bf/xQb9/u6LqYmKH1EIKK34bHAm5O2xmEDBA5yB3/rvGTs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(18002099003)(11063799006)(25016099003)(12006099003)(6133799003)(56012099006)(29003799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ak2Ko5tki92OO9W4m45YBNAHI4eAIIzWTyXyjwQJsw+eWCGmpi55K0sPxREj?=
 =?us-ascii?Q?vtHJ8ET8/bHinXF6HRh+Vgj4bqlFVMxq3elZa7ICvARB1QJKEmMiUR0fZxb0?=
 =?us-ascii?Q?xs7FFzgk4OQWQQ8txYdCVToTEpvN8lnsG36XAlbFFn2twuQLp5RcWGDrskOC?=
 =?us-ascii?Q?TJUrFlQDDN0+lJWk+QDhcealDz0f4j5pD8q2OL1KaCrr9TntkES1AW4vqkIy?=
 =?us-ascii?Q?rv6TkKqzVDDmX4idShSQtIMuECQsStZJjCs85ao9bQZJw3Dyz7HvyorUHhHW?=
 =?us-ascii?Q?yp7BlUq2a+/KZx39OJBb0QkXHutTiKU60ZIfQF+I/eJQbjNZ63iilumpxu1x?=
 =?us-ascii?Q?Tjg2weygw3L0B58aZ3O8fLj1J2+zANmvfCu0aO18+tIPJ1KMaVRqD+DRRf7M?=
 =?us-ascii?Q?0rm87kCYzFuJGyfiBJ6F1GD6ukNzeA5/5yBIrKVzW3GC6HtnMm5buVapzZqu?=
 =?us-ascii?Q?mDDk9/+SGcz0ydw7xMUiTBzy8JWvcy1EGN9/RqUfuUp4Ox+QwRg5oUX1t4Rv?=
 =?us-ascii?Q?E+l/NXMYkJ3Q2lYUoaaLtewQMdbAxYmutsmv8nIY+9q1eoeaeJ2EfYNrrPp2?=
 =?us-ascii?Q?vicEcyU3QMfxhUJqD9VcLgMq4LDeVbIPZD7uvZ+79EP2KTGbiTYtj17Z2U8R?=
 =?us-ascii?Q?do3ZVgZr79bf5ZDpDw2U7/KRXxCW5yH4fLWexH5VavHEa6AMkcA2obdjSzLp?=
 =?us-ascii?Q?O+AxT4S1G3YUaOzK+rP+vz13qbowai2P5Fz/K7ig1gY/4Iaj+qRRGRijUMf3?=
 =?us-ascii?Q?EBcqanzy1PaGIuAoHl0czoemq8Rd6oHjRAYADdnculGJpK60C0wu7pv9xUD+?=
 =?us-ascii?Q?nboSTQXmBUSfqei/hZDEnLgzXS9pkhE6NLmaz1h/8PmHBIDnDxH2Kq4XlM7U?=
 =?us-ascii?Q?KwYADIAIlwTkObfmCBhs9ysf/lWaZq0ohFCQ0znvhh6Wo0t75ch19H3sMoQo?=
 =?us-ascii?Q?iM3193Rjyicl6GZ91Y9rYMJl/uJP2tFsyiHQ2dZ0RCgJhDNfyVoSfc5gC4Kk?=
 =?us-ascii?Q?HxjRjx/xwB2cde9JkQPPI6vm3BlG9KP0qLgDlgrFEgwdEosKDGBnnU8KFdBv?=
 =?us-ascii?Q?NU+qUPWPsQM2jDCR72wcribOuXA9pdFUPqOk+sdhCL0tuoyN345BLg+KTAkB?=
 =?us-ascii?Q?2yxjXu65f2uuH0vEOumvWxlTPEAUtL9qned1Tf1t1wBNzlRwDr1b7LPj8VUC?=
 =?us-ascii?Q?R8nPkIf/J8CmI0DQoVaaF9Js4phMMTjm66E4SZ7lMXzy2EjYY2+bW6Orf92i?=
 =?us-ascii?Q?+mlQ37GXPvZoBamuSBePr5YkCgduMJekt7EzmhhQXdj1h6FDuSlYI/lAd30E?=
 =?us-ascii?Q?sykOwAMr0oSedGnFuLvaCrbhUoympIQbG84Us2R1NQIRcPgcT1WYsnsSQulC?=
 =?us-ascii?Q?vMlqFyn+HQF/31vEctDURwza1z5ZxjEKbstktpoIbs9zCf+00KilfBLfBwAi?=
 =?us-ascii?Q?fWBc9PkoWdD6B0kdeFnj3VBJGC9fyitBnnCfAVQrXVnbHB3aadoZVJLJ3IHi?=
 =?us-ascii?Q?yma5KwPuvg7Se7btFpw4Q9RcLC5LN9mmhqMGr51Qe4z9pAqV5kJA1l01Sgx+?=
 =?us-ascii?Q?h7rp/4cDw2UYxtKGbokyly9EEzi+S8NZidNQ1LdqytgNQ/+vIcFP5pOVWQPI?=
 =?us-ascii?Q?6htUa4iZ6I10BdIew5uyenVmaEqHOoPkXAvIsI0Be3gk1i8MZvpOGh095FmU?=
 =?us-ascii?Q?wJRBJ8Iy+P/XaAuc6YlwQ1mUs6HQCiUs8S/7uQfidCr93B2XuSPtFMNDxQvj?=
 =?us-ascii?Q?PUYX/ac9eg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 781e98b6-f93a-4a0d-0209-08dedb624e29
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 13:27:19.8697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jQVkouD3X/zhvROeaT/erIR8LgaIhKd/z8dKfQALi/f/6e+wiKljXLIxz/IODTrGdrjvklC5He8ByI6g9xCO5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2785
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 13:27:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240269

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

Backport patch to fix CVE-2026-7210.
https://nvd.nist.gov/vuln/detail/CVE-2026-7210

Upstream fix:
  https://github.com/python/cpython/commit/24b8f12544468e4cedf5bfbe25442fcd=
495391e4

Tested with ptest:
Before: PASSED: 40019, FAILED: 0, SKIPPED: 1882
After: PASSED: 40020, FAILED: 0, SKIPPED: 1882

CVE: CVE-2026-7210

Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
---

NOTE: CVE-2026-7210 full mitigation requires the companion
    expat CVE-2026-41080 patch (raises expat to >=3D 2.8.0 API)

.../python/python3/CVE-2026-7210.patch        | 122 ++++++++++++++++++
 .../python/python3_3.12.13.bb                 |   1 +
 2 files changed, 123 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-7210.patc=
h

diff --git a/meta/recipes-devtools/python/python3/CVE-2026-7210.patch b/met=
a/recipes-devtools/python/python3/CVE-2026-7210.patch
new file mode 100644
index 0000000000..8acf174a0a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2026-7210.patch
@@ -0,0 +1,122 @@
+From 2ed6138dea0bc94c726f879501e4525712e885d1 Mon Sep 17 00:00:00 2001
+From: Stan Ulbrych <stan@python.org>
+Date: Sun, 10 May 2026 18:36:26 +0100
+Subject: [PATCH] gh-149018: Use `XML_SetHashSalt16Bytes` in
+ `pyexpat`/`_elementtree` when possible (#149023)
+
+
+CVE: CVE-2026-7210
+Upstream-Status: Backport [https://github.com/python/cpython/commit/24b8f1=
2544468e4cedf5bfbe25442fcd495391e4]
+
+Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
+---
+ Include/pyexpat.h                                      |  3 +++
+ Include/pyhash.h                                       |  8 +++++---
+ .../2026-04-26-19-30-45.gh-issue-149018.a9SqWb.rst     |  3 +++
+ Modules/_elementtree.c                                 |  8 ++++++--
+ Modules/pyexpat.c                                      | 10 +++++++++-
+ 5 files changed, 26 insertions(+), 6 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2026-04-26-19-30-45.gh-issue=
-149018.a9SqWb.rst
+
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
+diff --git a/Include/pyhash.h b/Include/pyhash.h
+index 182d223fab1..ec359bd2f35 100644
+--- a/Include/pyhash.h
++++ b/Include/pyhash.h
+@@ -39,14 +39,14 @@ PyAPI_FUNC(Py_hash_t) _Py_HashBytes(const void*, Py_ss=
ize_t);
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
+@@ -71,7 +71,9 @@ typedef union {
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
+index 56d1508af13..941376613b0 100644
+--- a/Modules/_elementtree.c
++++ b/Modules/_elementtree.c
+@@ -3657,8 +3657,12 @@ _elementtree_XMLParser___init___impl(XMLParserObjec=
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
+index 79492ca5c4f..388473d3855 100644
+--- a/Modules/pyexpat.c
++++ b/Modules/pyexpat.c
+@@ -1388,7 +1388,10 @@ newxmlparseobject(pyexpat_state *state, const char =
*encoding,
+         Py_DECREF(self);
+         return NULL;
+     }
+-#if XML_COMBINED_VERSION >=3D 20100
++#if XML_COMBINED_VERSION >=3D 20800
++    /* This feature was added upstream in libexpat 2.8.0. */
++    XML_SetHashSalt16Bytes(self->itself, _Py_HashSecret.expat.hashsalt16)=
;
++#elif XML_COMBINED_VERSION >=3D 20100
+     /* This feature was added upstream in libexpat 2.1.0. */
+     XML_SetHashSalt(self->itself,
+                     (unsigned long)_Py_HashSecret.expat.hashsalt);
+@@ -2257,6 +2260,11 @@ pyexpat_exec(PyObject *mod)
+ #else
+     capi->SetHashSalt =3D NULL;
+ #endif
++#if XML_COMBINED_VERSION >=3D 20800
++    capi->SetHashSalt16Bytes =3D XML_SetHashSalt16Bytes;
++#else
++    capi->SetHashSalt16Bytes =3D NULL;
++#endif
+ #if XML_COMBINED_VERSION >=3D 20600
+     capi->SetReparseDeferralEnabled =3D XML_SetReparseDeferralEnabled;
+ #else
diff --git a/meta/recipes-devtools/python/python3_3.12.13.bb b/meta/recipes=
-devtools/python/python3_3.12.13.bb
index bf0e1702d5..1c0de11a93 100644
--- a/meta/recipes-devtools/python/python3_3.12.13.bb
+++ b/meta/recipes-devtools/python/python3_3.12.13.bb
@@ -43,6 +43,7 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Pytho=
n-${PV}.tar.xz \
            file://CVE-2026-6019_p1.patch \
            file://CVE-2026-6019_p2.patch \
            file://CVE-2025-13462.patch \
+           file://CVE-2026-7210.patch \
            "
=20
 SRC_URI:append:class-native =3D " \
--=20
2.34.1

