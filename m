Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E61E7CD6E4A
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 13:27:33 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.5])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11541.1780579651117650262
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2026 06:27:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=E69xNBVI;
 spf=pass (domain: est.tech, ip: 40.107.159.5, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y2qbv6bOztosExjD4hiw/oMxBx072lluRE7zi/zDiLb3JBsYHyk8KnzprhnWrgEcXcP4c5zTzXvD2KtBziVRgYV5tE4DGXaaxlS7bCyJicZAAGPutfL+EmZfXb7T/cn1vkrzw++UgsNNObHXN6AO/O5UHhFF1c0/Yp3hUUb3VyAgzpRdQejB/Y9ZCrWyij6gtCrEwWuydOXoNBrn/+Dgw5tRoH4fg316YvWEl5XaQSJpdK5ciV3DsDyLBz4P2MFVcRuUS4BRkq0+9rsNmiBEPU17u59SemiqSvlWqu3pTiRymRefdFr7pd5xNnBv79Zvudtkns4sH1lmtRw0cOtWzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V+imKBxN74X2ugQoUWxfmLLEyJoPhvt988DYzXpcE2g=;
 b=uC+6L0uanY6mnOAGE/5QyIMwz5+W1lhenijt+BMV0ePlNiY1q9sN8IyezfzSBeyCVIbk3Wd1CwEnrzH0JXqrFXH3sm0+aQF/OHGA/6vC279hwVq2BNo7xr9h/XVSPPW650YmHfUpN6CyYc+1qFqg31PKXuCHjmHYWLlwT03HFqzHcPi3w+ANPydxlF2F41Egem5erI497eE2ngdUe2NdRlBNt/RkmCWvDwwz9AzM4t0NBhyIQ8IJroSrdEsiMSHZ4ZZzOHVVa+PSkDHk2EFz0PpKDhSgiZXU6qUCg0nUxqwb3MRRKr9ky/Tm0zQIPp45Yu1lvlWM9RDFMn7VwLtvKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+imKBxN74X2ugQoUWxfmLLEyJoPhvt988DYzXpcE2g=;
 b=E69xNBVIzh5zYM0EnWNAEmbQX/Rk8vcAc8nbqx/qVRPRSBLp0axEKSCOFKTQX+DS06R0pa39+XhEPwEnzBG8sybd3ezoi7MzBFQi36lKFJDmpx0iYf9LIecRqgbUWsBppDvpPjhP5NTRiDGgxena+GtsA/MXaKmt1wyFBQt+FFfSgWBLj+BzF5AdxCGn3E5q1jcjmWo97IWxRTq0IYnDsRNfm+LvydtX7JWKsaBVtiegXclRd7Akf7YRYBDWtW6lE/zHcWriVxayShs2c8SnClivW/PIZ/bE5Rj+8sNFCL+jnYdBvzT0JeeURghIvsQKCatKlnGI5sBMaPZG4EbQ0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by PAWP189MB2830.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:46b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 13:27:25 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95%4]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 13:27:25 +0000
From: amaury.couderc@est.tech
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][OE-core][scarthgap] python3: fix CVE-2026-7210
Date: Thu,  4 Jun 2026 15:27:00 +0200
Message-ID: <20260604132715.50730-1-amaury.couderc@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU6P191CA0006.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:540::8) To AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6ad::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP189MB3196:EE_|PAWP189MB2830:EE_
X-MS-Office365-Filtering-Correlation-Id: 56e4ffcb-c876-4673-60f3-08dec23d0461
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|10070799003|1800799024|366016|13003099007|29003799003|25016099003|6133799003|18002099003|56012099006|11063799006|12006099003;
X-Microsoft-Antispam-Message-Info: 
	ebU6tK9Sx3QsbAbRPfA4B64Uwo4JFhqHjZJWSYw8iaMuUW3AkL05MJzzP4Y18vEoZejOZ60y+uhf1lK4rbK8zCYxJT26IJPCvmH4NH3ThRaV6CaSRaEPl3EYjpYXL2s0fKBxenXFafqEja8G6qy+hF4zBcrNE+oTdHTa6INTdoxguTMNlTswxFwRnAkpU7wYif5Ye78py8Uji6Utc/fcg4+76PRJctqUC+w+Z+6HSmM/0GxEM0zf2YeSK2JtQ7Ok9KONhNYNIsWueGUfk5eCM8COxB2DZCezUOiftIFD9MHNnWvdvfb1vZIYyd64D7CCMA9/F/FMTVS8GWu0rfE6I6TXoybVM7ZmW11NhQCj1I8lhj6SLIPmyp3B2QfrxtIpUd4HqPCBzAnvhlt6HhWR9Ckmy18+T1iVSXOlqk56IdN5YEX/NbBA6/pFxkwnSMrnbDEQ6YZlMXuyp74tOyI+M/7Aw428iecBjrs1agbCPe+KC6MDwBL6KSIOgHlFQjn0ylmjtnBw/kirVpkXU5NgaH03Zt0BxEVN2QVl327zhP1euDmY00pQpanUXqHBC7ipUM1zZuZBQSsCvJBsNX9SKM9eu5H0tJrZL6f9ozjbPgAYJExNn6/tX9bE+G+BxBYDLK0jovBbzFpJY1T+oFfY4WPa74s1OL6beiikANCg1zFOYQZ2vmThkVxXY/nUD1nujPk46cxgItvacxz3lf+W6g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(13003099007)(29003799003)(25016099003)(6133799003)(18002099003)(56012099006)(11063799006)(12006099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JBak1jwLDhrpOe9bq26OJtM83x57lyC2gpC/5slaJHw+K0B6DSKBAW9vrIRB?=
 =?us-ascii?Q?LQ9CzvHaY0xD0nUMMHlIFX79W6ACdr5x//idkr3mpLChSoAJx5UmUNdxevpf?=
 =?us-ascii?Q?NJ/Mr+FYTanM9jat/OJz8ocqcEhBjG/5QDk1n6btNaBUGjlTBZ9VlwGhZTFR?=
 =?us-ascii?Q?9JHzHfBABeMZ/uvj2KNLB4n++U4WMQvu8bZZ0KBZNSmCCMxS/q/+O2xywB7t?=
 =?us-ascii?Q?KYQA5eWvfs/K0X3ySPbQIojraYqRBJXe4kkZaIcuh5j32ZEwkWD9Hw70Ed9q?=
 =?us-ascii?Q?FKakWMfV77AS/znWBUwXrp/ZaceC436A+MK1REZWoBzvtK1f5VWqvmrfUUNw?=
 =?us-ascii?Q?3B7jrlD/QMQ9smTOp5XPIp57fEuTM6mG+TxudJc1x7w+e6jJFJfpuv06m8Zt?=
 =?us-ascii?Q?GTDidobpto1fX+YMzWex4Ax5ADkbcdlLFyMu+VtI93iDbYcrdW0edmyGmwJk?=
 =?us-ascii?Q?FM1k4qU+SOjIVJjp4mYQvJ4l+yPPtSvUufNBEVzFxY/4ZkDyNQa09xzrw5gU?=
 =?us-ascii?Q?fFcSyt+joPqSCsmbxxc34mB8RjeGsSaqHwA20aJ55jJ8sShIL8T6UT2tOoZj?=
 =?us-ascii?Q?xJ2VclAP3BjWWZsmKNO3snRhFQfGq21tZeovWf77xw7TncZ31qLJiKdjaHy2?=
 =?us-ascii?Q?D8PwdD98EQ56o95IqoNmOM4BduE1IZQKRfY8VbiTfuRg30D0Kbdsm+WQU3sw?=
 =?us-ascii?Q?Yfr1epIJzJp1HXqP66UAwkkqRdFWqlKJ5YtqljvfBf7qVAl1eAGjJsjGYUPq?=
 =?us-ascii?Q?tvxy2XDHsFbesKWIgBwgxw65Yrbo6+MHeNjLhKFg7YWzc8ZhRtrSdu0rZrk+?=
 =?us-ascii?Q?+j5x04QUcJ3TNsO7uYG0sWM0mwiVXUxvzKYiRhheN09/8K/ieXovBqsWJjeV?=
 =?us-ascii?Q?W3x6k1bB3MHbcHctVNewUAHAAarQFcm2wTwaivo9cVW5LzjSVF3cM2gK1GS/?=
 =?us-ascii?Q?Bk5qas74iU8a1nmQQyUM4x60Sch5jQakt7QYEuHinPmwLw0wZ/aX9yF5WToS?=
 =?us-ascii?Q?l0vVDSJceIoXB2p8kSBWkPaT4d4lm7lvWviPCDXtydjnDvn5R/w7gqaDuC9h?=
 =?us-ascii?Q?xK2uNQNFAMaq2EUNBvyT1ckpwNheZGXyZuF6cGRCLW5Jh3AqjmnbJeICnfAT?=
 =?us-ascii?Q?4BTx/xd7SOjxUkdSWgWw9Ac9f4TS/4rZXcQ27OyDFtxvKvNiBARhKq/yBGPl?=
 =?us-ascii?Q?oxCs46WU4sbdAm6zFITqThG9YweMi0eeHWFj9rn9PoxZJ52cIWvptwX9YCjW?=
 =?us-ascii?Q?ibzqAsuAD6tztpir/ZURMfNy/EGzlxnVsmtYZYulpvFKX6T93DcfqLPKR4rF?=
 =?us-ascii?Q?S8h4JHlmZNLeUe4B/IsF/ifS7L4mL97eW1FewzZXPvsMtlD6PEDvZIQnx4el?=
 =?us-ascii?Q?Jd2NiMbzwQ+/M+rFFH6ZdwEH4XMZ1w4YFXBtdnjPaa6BMPS/HWKfJ79BQBCR?=
 =?us-ascii?Q?eHeuJjOHIkhEXsQh/oxuYQykaCx2Qzz/8rj7SEjH2GK5om+TjBiHJwbGpPTw?=
 =?us-ascii?Q?HjaC+3fZm43NVGaWurltDUN/ibdvLJDZTdW22+3iyUKufi2HskTIYPO8QI9d?=
 =?us-ascii?Q?f0qiAghIbUQkiWqKRoeF+0sRJhLqE7DUK72mZ3at/mbbpNWrga1jPpVNJVK4?=
 =?us-ascii?Q?7bd7G5fg7HL2FZLRx+frZwlgIljZ2ZyRYK1827YemgNnBw83sC36a0tESn5B?=
 =?us-ascii?Q?2TPds+cb5cCRhVQkMus5DXAyO1TcQUfCWY2hJ8pZDhYRcqNTA8qgqs1r+f5J?=
 =?us-ascii?Q?iiDSzG37NklMs8mFatL9ERFyuCT3wUBr7KuOc39DgpQSQiYNiKMsxDZ4YDTb?=
X-MS-Exchange-AntiSpam-MessageData-1: e45Om7SO2MTyAUBG/ryIkidnFm3V5DSzJhE=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 56e4ffcb-c876-4673-60f3-08dec23d0461
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 13:27:25.6141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f21SpcVUNiUp5Tw9IkfUQLsdIlQz35ClxOJkWadxBo3ych6L6YD6eF8/8hsigYtMf6ldwGM8AA7G5B62Y8guWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP189MB2830
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2026 13:27:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238131

From: Amaury Couderc <amaury.couderc@est.tech>

Backport patch to fix CVE-2026-7210.
  https://nvd.nist.gov/vuln/detail/CVE-2026-7210

Upstream fixes:
  https://github.com/python/cpython/pull/149023/commits/03794ce9a58b1f33751=
c88d7d876dfbf27645c56
  https://github.com/python/cpython/pull/149023/commits/ccb8d2f7df9534e49a4=
3554193d7f5f4d993189c

Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
---
 .../python/python3/CVE-2026-7210-1.patch      | 88 +++++++++++++++++++
 .../python/python3/CVE-2026-7210-2.patch      | 74 ++++++++++++++++
 .../python/python3_3.12.13.bb                 |  2 +
 3 files changed, 164 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-7210-1.pa=
tch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-7210-2.pa=
tch

diff --git a/meta/recipes-devtools/python/python3/CVE-2026-7210-1.patch b/m=
eta/recipes-devtools/python/python3/CVE-2026-7210-1.patch
new file mode 100644
index 0000000000..23d412cc38
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2026-7210-1.patch
@@ -0,0 +1,88 @@
+From 03794ce9a58b1f33751c88d7d876dfbf27645c56 Mon Sep 17 00:00:00 2001
+From: Stan Ulbrych <stan@python.org>
+Date: Sun, 26 Apr 2026 19:31:25 +0100
+Subject: [PATCH] Use `XML_SetHashSalt16Bytes` from libExpat when possible
+
+CVE: CVE-2026-7210
+Upstream-Status: Backport [https://github.com/python/cpython/pull/149023/c=
ommits/03794ce9a58b1f33751c88d7d876dfbf27645c56]
+
+Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
+---
+ Include/pyexpat.h                                     |  3 +++
+ .../2026-04-26-19-30-45.gh-issue-149018.a9SqWb.rst   |  3 +++
+ Modules/_elementtree.c                                |  8 ++++++--
+ Modules/pyexpat.c                                     | 11 ++++++++++-
+ 4 files changed, 22 insertions(+), 3 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2026-04-26-19-30-45.gh-issue=
-149018.a9SqWb.rst
+
+diff --git a/Include/pyexpat.h b/Include/pyexpat.h
+index f523f8bb273983a..a676e16a7a457ea 100644
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
+index 000000000000000..d1b5b368684e6a5
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2026-04-26-19-30-45.gh-issue-149018.a9SqWb=
.rst
+@@ -0,0 +1,3 @@
++Improved protection against XML hash-flooding attacks in
++:mod:`xml.parsers.expat` and :mod:`xml.etree.ElementTree` when Python is
++compiled with libExpat 2.8.0 or later.
+diff --git a/Modules/_elementtree.c b/Modules/_elementtree.c
+index cbd1e026df27227..b2d4b982602c583 100644
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
++                                      (const uint8_t *)_Py_HashSecret.uc)=
;
++    }
++    else if (EXPAT(st, SetHashSalt) !=3D NULL) {
+         EXPAT(st, SetHashSalt)(self->parser,
+                            (unsigned long)_Py_HashSecret.expat.hashsalt);
+     }
+diff --git a/Modules/pyexpat.c b/Modules/pyexpat.c
+index 0f0afe17513ef1c..1df433e64bc096f 100644
+--- a/Modules/pyexpat.c
++++ b/Modules/pyexpat.c
+@@ -1388,7 +1388,11 @@ newxmlparseobject(pyexpat_state *state, const char =
*encoding,
+         Py_DECREF(self);
+         return NULL;
+     }
+-#if XML_COMBINED_VERSION >=3D 20100
++#if XML_COMBINED_VERSION >=3D 20800
++    /* This feature was added upstream in libexpat 2.8.0. */
++    XML_SetHashSalt16Bytes(self->itself,
++                           (const uint8_t *)_Py_HashSecret.uc);
++#elif XML_COMBINED_VERSION >=3D 20100
+     /* This feature was added upstream in libexpat 2.1.0. */
+     XML_SetHashSalt(self->itself,
+                     (unsigned long)_Py_HashSecret.expat.hashsalt);
+@@ -2257,6 +2261,11 @@ pyexpat_exec(PyObject *mod)
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
diff --git a/meta/recipes-devtools/python/python3/CVE-2026-7210-2.patch b/m=
eta/recipes-devtools/python/python3/CVE-2026-7210-2.patch
new file mode 100644
index 0000000000..a0c365cc82
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2026-7210-2.patch
@@ -0,0 +1,74 @@
+From ccb8d2f7df9534e49a43554193d7f5f4d993189c Mon Sep 17 00:00:00 2001
+From: Stan Ulbrych <stan@python.org>
+Date: Sun, 26 Apr 2026 19:42:01 +0100
+Subject: [PATCH] Add `_Py_HashSecret_t.expat.hashsalt16` instead
+
+CVE: CVE-2026-7210
+Upstream-Status: Backport [https://github.com/python/cpython/pull/149023/c=
ommits/ccb8d2f7df9534e49a43554193d7f5f4d993189c]
+
+Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
+---
+ Include/pyhash.h       | 8 +++++---
+ Modules/_elementtree.c | 2 +-
+ Modules/pyexpat.c      | 3 +--
+ 3 files changed, 7 insertions(+), 6 deletions(-)
+
+diff --git a/Include/pyhash.h b/Include/pyhash.h
+index 84cb72fa6fd1b26..3056dc44cc0f1b1 100644
+--- a/Include/pyhash.h
++++ b/Include/pyhash.h
+@@ -39,14 +39,14 @@
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
+diff --git a/Modules/_elementtree.c b/Modules/_elementtree.c
+index b2d4b982602c583..9e794be5c109ba5 100644
+--- a/Modules/_elementtree.c
++++ b/Modules/_elementtree.c
+@@ -3660,7 +3660,7 @@ _elementtree_XMLParser___init___impl(XMLParserObject=
 *self, PyObject *target,
+     // Prefer 16-byte entropy, only expat >=3D 2.8.0. See gh-149018
+     if (EXPAT(st, SetHashSalt16Bytes) !=3D NULL) {
+         EXPAT(st, SetHashSalt16Bytes)(self->parser,
+-                                      (const uint8_t *)_Py_HashSecret.uc)=
;
++                                      _Py_HashSecret.expat.hashsalt16);
+     }
+     else if (EXPAT(st, SetHashSalt) !=3D NULL) {
+         EXPAT(st, SetHashSalt)(self->parser,
+diff --git a/Modules/pyexpat.c b/Modules/pyexpat.c
+index 1df433e64bc096f..78efbef679024f3 100644
+--- a/Modules/pyexpat.c
++++ b/Modules/pyexpat.c
+@@ -1390,8 +1390,7 @@ newxmlparseobject(pyexpat_state *state, const char *=
encoding,
+     }
+ #if XML_COMBINED_VERSION >=3D 20800
+     /* This feature was added upstream in libexpat 2.8.0. */
+-    XML_SetHashSalt16Bytes(self->itself,
+-                           (const uint8_t *)_Py_HashSecret.uc);
++    XML_SetHashSalt16Bytes(self->itself, _Py_HashSecret.expat.hashsalt16)=
;
+ #elif XML_COMBINED_VERSION >=3D 20100
+     /* This feature was added upstream in libexpat 2.1.0. */
+     XML_SetHashSalt(self->itself,
diff --git a/meta/recipes-devtools/python/python3_3.12.13.bb b/meta/recipes=
-devtools/python/python3_3.12.13.bb
index 5fa25235fe..236bffc360 100644
--- a/meta/recipes-devtools/python/python3_3.12.13.bb
+++ b/meta/recipes-devtools/python/python3_3.12.13.bb
@@ -34,6 +34,8 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Pytho=
n-${PV}.tar.xz \
 	   file://0001-test_deadlock-skip-problematic-test.patch \
 	   file://0001-test_active_children-skip-problematic-test.patch \
            file://0001-test_readline-skip-limited-history-test.patch \
+           file://CVE-2026-7210-1.patch \
+           file://CVE-2026-7210-2.patch \
            "
=20
 SRC_URI:append:class-native =3D " \
--=20
2.34.1


