Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CC4DC5516D
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 13:55:30 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7026.1785506123617890972
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 06:55:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=vW1M60w7;
 spf=pass (domain: est.tech, ip: 52.101.84.13, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mvOTqBqFmk0M6sl0/pWJhOH+khlXIILQKOnR7OSOMBnpLZA+Doon304qWR6USLYAVlsTVLTo+66rZ5I62M753lRcSSzUuUPs0p6vOj0fFXbmUOkN9ijrLjaJ1ftzLuhPhsbIlukWS6iDbvLn4K9IFJubq6Vdy5jGlUZQIqpv46i2VHP6TawKgVOye3Tn9g517j9Nk2re0UCdRfpLCC7POopXlMikIZ80mpUOtKhtiTn3yVWsXU6+5PJFWM1jzCgkET093M2ysM+6eMrsrWlA7TxrLXr/7jmtjuGFK7eHzs3PfWsGKYcaLG7Q6uTscQJPAzzQwOqXkr5HsuTEi6PBOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QWZUZ87cxFyknIqKyrrZyrlVKZYEVAy0Z3KRhrOuRTE=;
 b=DeLFK4yi7Pc3xhVv/4zH0qbH5gpXmU8Ud/qKhixOdJCYjkuG3L9UBHEPrjKsvqvOT9Lz5Xhr/KXhI+dMiJH/to8X/93/gHsWHq8hfl5Ovezx+ngIoG+tgM7bUiSl7zfoKlnU/e7NktBpcl02CIPtb9MubQSZVySlpasRAWpjyCtLg0HE7WNVNmKInt5ztVWD/C7Yk/RcYhI8A+WaTDEXF6vEu6YednxAuEc3ROzSF2ZaPuEWNPt4xugHmpnKYgekkYrkvzCse2miwH76Sx4fVz/be3Cl7UQg1b7MZ/4eSZPXrdnZUxzHXJ76i21Oewnh6AOkKRZy/Y1T5r8ZM7Kx3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QWZUZ87cxFyknIqKyrrZyrlVKZYEVAy0Z3KRhrOuRTE=;
 b=vW1M60w7aaJ7sM92M4pvAFQms99f2Voz0fMKT+kbLPUmMsMiZqSEm5OOQ4cqYSonwwEeHrRpMnlqvz0PCHTIf1BN81x0lNMcPuxHL4l71/7uxnkuXx5Rh47qi1OfBakIsas2uL/nOF0x81hRZDwubRPMPzPUZjsfk2dIGNCTdkdKUJsCuiP8R5EMG5Rn+SQOilucowEc29t4Xm23pTy5wSsm+QAvmYczHzvA2vSfVm2KDiIqe/mvHswRb4OOGwaucsx15b5UEu1IZcj7G1tydJ6rVlGK0docEhKQcY9J681RyirvZxLvUGHi9u9p00Ey8Mouz4BufbV89jJuv9Mebg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by PAVP189MB2335.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:32c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.10; Fri, 31 Jul
 2026 13:55:19 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95%6]) with mapi id 15.21.0292.010; Fri, 31 Jul 2026
 13:55:19 +0000
From: amaury.couderc@est.tech
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH v4] python3: fix CVE-2026-7210
Date: Fri, 31 Jul 2026 15:54:59 +0200
Message-ID: <20260731135512.40614-1-amaury.couderc@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DB9PR05CA0015.eurprd05.prod.outlook.com
 (2603:10a6:10:1da::20) To AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6ad::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP189MB3196:EE_|PAVP189MB2335:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b78b5b9-0378-4016-78ef-08deef0b5b79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|13003099007|29003799003|6133799003|11063799006|12006099003|25016099003|56012099006|10067099003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info: 
	hXa0xrJIC9JaUkM4AXgpCECD6LtBlvOHXmNTq/bd8BKLnZUZkqQu7kujvAt0rMssNGqKQycBGn5e37buEEswKVsaJG1lrsEhms0cyAXF2ax3C4qTL++SYipIeH+xXFntiemZ0pg6LzltkbgWMEKhh9wfHlVs9nX1xLh7qhxdniw9fF28w/RoPCw8w8pZlHrYjy0MhogBYYx1jrqip1tVzLo3nv/ZOVWUcxqElDJJ0iXRHiSiJidehX6mR7yZ+SkvfX5IpSNm6DpzV0rDczRCzAsUPbtr13B+ri+NqssIhmE8UqcRQNxrL4gp8QIcr0oucMp7njF5axUll29J0MXryqK/+Jngr0o7h3g4ybqARs5kz6j8nuMu9i7l8I4pKymnZ03dV+lo8StVHoSfneCbdyC/YFYbLXqzaZ6ZlMHeJpPgWmoeysRGhzci+IgCUbO0vY6sHMTiQkNadZ8xJbF3SnYgCdLgJhnah6ER8vIOXuQFi4LIxE7oNWjlTh+UEXLbDDYTPUrsNDfS5BNPmDGEvgfZLC94aHzCYeIH72m/I24n8ezA0oZUq1G0R72PjRAMXrqrZXSpOAdplBBl8ZljOvBV0TZ6vuAUarGNJ3PQCbyniKH9BQlsxhGyWSeWkRe5Z1R5r365hhXgBPWWBWJVoq877uLJ59NNH29ezaX7L+k=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(13003099007)(29003799003)(6133799003)(11063799006)(12006099003)(25016099003)(56012099006)(10067099003)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9Ip8Mx2i3H6PXx6TrJkf/5KiIA5r0TlrGR7ZDxhwPAj4b/saNcqosvUgAzSf?=
 =?us-ascii?Q?QTkgvVIwdlAaPQ7QRIJ+5Zs9PYmT+AZ60qhnE3+qjSdcLbMQZXnIetGU3xUZ?=
 =?us-ascii?Q?Ox6uidOdJt0kWNREGsNBlmtUNIrXiWsGgLmyEQxTyff6rRmvxqgMkJmOyrwp?=
 =?us-ascii?Q?FZ4ven+On5BSGCFNxlqi8aVmcwB0LZtuUT88gyE9xQ0BiqC29HLG9sOeZJex?=
 =?us-ascii?Q?DNGvtUnV6DkxbnWe8js+hqxVYLm3VP9bHO6rgBV7MvxmXAFwbk47MSSmfTGQ?=
 =?us-ascii?Q?fGwAo2Xms9Q0UHYlQg/8xfU7XgJTvR/VDrDsNulzZA/XaGmyTJA/kc6m/UvV?=
 =?us-ascii?Q?cv5O6547cQochnEOgC3Bf3rnBWi2UwC/OsBqJtHhO/ORF7MXhG2jgp77K+36?=
 =?us-ascii?Q?SWdorbjIOd9Vf9bggWLaXZOXuH5o+lmTYeY8/IEqu86QoBzDGfbShHJdit8l?=
 =?us-ascii?Q?XqT0cw5bMlHHSft1fxdC151uD8QtNBTC0SPZ4c6kYIM79/THb6lqcRsIsiOv?=
 =?us-ascii?Q?4lyo8lEnEp0TmVcxQZlAtrodSeNyy9fMpgrtMa29rNrO8u+aAZEaLR8jZAsK?=
 =?us-ascii?Q?/z+XhbGk9+MPRv9FIC1D0zgiAuLLMYcyqMIx9UJsmMYyHIZLPlVP/w6Af90C?=
 =?us-ascii?Q?UjbbI+4Xr+c4C6k1y8aG3jJI7snpfwc+5B4hop4QCESi6b7R3KUkS8jpTuM8?=
 =?us-ascii?Q?8lu6aBfUzcT+oPUkok2NLWyOWsZSMC1OyB7yc1ygslkQmUo9V+2JuhagxY9i?=
 =?us-ascii?Q?0C4oAy1yk1s2Zpf20h7OyQdRTp7vKyHRh+ptfP3xdFfdsM3iMNTM2xti/NRc?=
 =?us-ascii?Q?XZMZGeJcF3fqa34x88acr4EwEXp9DdyRTpxVSrAruM94DZgzhEBqYg+iTJoM?=
 =?us-ascii?Q?QM/qm+Vo07u1hdn1KJPJSfc0I8R64Y+TZvV1x/sD4Ue7vY20KueMCBKgnWSK?=
 =?us-ascii?Q?4ky5hojX/N2UIF5RObqZZpShFnn1Efb3SfriIwqCrIX4ZhnAShQUg2RNYQlr?=
 =?us-ascii?Q?C69FH2I2uQi7DdVYHDTj3obal5/tgIbL1QE6Yd84tFXwfsueO6uUCQtUdbt8?=
 =?us-ascii?Q?WetFtpXAo2FmqHiBQNcvMpLoRxxs4aq/DcSJwK9HHCdsoNzqgrL+YuTQD/WO?=
 =?us-ascii?Q?pg5Omu+g5scMtCSAzj2bONWYiEJ6jMCSn5S9zNimTeLEj1FsRT6XnL9ImQnu?=
 =?us-ascii?Q?EfND7Dy30jDW66kyj+QH556AL0ujUvMUTwgWbuaczOW1HxULJy+xIVYEwhEB?=
 =?us-ascii?Q?qC8mW/Gg7NT1G8wrJ1LBy1ca9GnRiCZUb0Imn+I4Ek1JvnaGs67rveh6291C?=
 =?us-ascii?Q?IXH3ikWUnpPPdYuYWtW+v9hsZFvtrB5xIxfQ1eE9dCGMCbMGwIalkJyk8Vup?=
 =?us-ascii?Q?fOjX8uIecdSM/UTt3QvosVQuNVGkDYu91FawtTS93PlrWNKifpmo1zf9trnU?=
 =?us-ascii?Q?bHK0FEmwoTQzUb+Ah3pcIHZXD56fGy1yPHt2Teqb9c6RT+zkF1bcCyUzvAOg?=
 =?us-ascii?Q?oEypsrDKGmd82hvbB6sjiRczz03GNQThpAbqkdYTXt09vcINrMYv7S3rw8Sk?=
 =?us-ascii?Q?4LgAnFWAe1Jz6LbvWQUrD6jLEg0CPf4vr5jrcUc6dWTB5Y+lbotmFr6DvagZ?=
 =?us-ascii?Q?7yWPG1+peKdHiPRiSdMflG+ZDVHuutiD8ZfyOx+9erc/g5FDgiKRr1Dy8bT4?=
 =?us-ascii?Q?Y3bFR3WFrpcrgmk1DoL0OYGUx0tBl04WMU6ElDuy+aSqOjW8Rr00uiWxn99P?=
 =?us-ascii?Q?BM8GtI121Q=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b78b5b9-0378-4016-78ef-08deef0b5b79
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 13:55:19.2133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ZHjwMm263xjM1a18rGN1kuAkiz6ha3qKhD1TBLwn+8E4T3XF2OogGa24kpjeGKcsNAe16jpdioUBriH4b5asA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVP189MB2335
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 13:55:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242445

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

-- Changes from Upstream --

Replace compile-time version checks with runtime detection of the
XML_SetHashSalt16Bytes function using #pragma weak. This allows using
backported security fixes from expat even when version macros haven't
been bumped (in thus case expat 2.6.4 with CVE-2026-41080).

- Add weak symbol declaration for XML_SetHashSalt16Bytes
- Convert newxmlparseobject() version check to runtime NULL check
- Convert pyexpat_exec() CAPI export check to runtime NULL check

Tested with ptest:
  Before: PASSED: 40019, FAILED: 0, SKIPPED: 1882
  After: PASSED: 40020, FAILED: 0, SKIPPED: 1882

CVE: CVE-2026-7210

Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
---

Changes v3 -> v4:
  - Replace compile-time #if XML_COMBINED_VERSION >=3D 20800 guards with
    runtime detection using #pragma weak XML_SetHashSalt16Bytes.
    Our backported expat 2.6.4 (with CVE-2026-41080 patches) exports
    XML_SetHashSalt16Bytes but does not bump XML_COMBINED_VERSION to
    20800, so the v3 version-based check left the 16-byte path as
    dead code. The weak symbol approach resolves the function at link
    time when available, activating full 16-byte entropy protection.
  - Add [yocto: ...] note in the inner patch header documenting the
    deviation from upstream.

---
 .../python/python3/CVE-2026-7210.patch        | 148 ++++++++++++++++++
 .../python/python3_3.12.13.bb                 |   1 +
 2 files changed, 149 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-7210.patc=
h

diff --git a/meta/recipes-devtools/python/python3/CVE-2026-7210.patch b/met=
a/recipes-devtools/python/python3/CVE-2026-7210.patch
new file mode 100644
index 0000000000..029eb713e4
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2026-7210.patch
@@ -0,0 +1,148 @@
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
+[yocto: Use weak symbol detection for XML_SetHashSalt16Bytes instead of
+XML_COMBINED_VERSION >=3D 20800, since our backported expat 2.6.4 provides
+the function but does not bump the version macros.]
+
+Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
+---
+ Include/pyexpat.h                             |  3 +++
+ Include/pyhash.h                              |  8 +++++---
+ .../2026-04-26-19-30-45.gh-issue-149018.a9SqWb.rst |  3 +++
+ Modules/_elementtree.c                        |  8 ++++++--
+ Modules/pyexpat.c                             | 22 ++++++++++++++++------
+ 5 files changed, 33 insertions(+), 11 deletions(-)
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
+index 79492ca5c4f..47e3a1b2c00 100644
+--- a/Modules/pyexpat.c
++++ b/Modules/pyexpat.c
+@@ -14,6 +14,11 @@
+=20
+ #include "pyexpat.h"
+=20
++/* Use weak symbol to detect XML_SetHashSalt16Bytes at link time.
++   This allows using the backported function from expat even when the
++   version macros have not been bumped (e.g. expat 2.6.4 + CVE-2026-41080=
). */
++#pragma weak XML_SetHashSalt16Bytes
++
+ /* Do not emit Clinic output to a file as that wreaks havoc with conditio=
nally
+    included methods. */
+ /*[clinic input]
+@@ -1388,10 +1393,16 @@ newxmlparseobject(pyexpat_state *state, const char=
 *encoding,
+         Py_DECREF(self);
+         return NULL;
+     }
+-#if XML_COMBINED_VERSION >=3D 20100
+-    /* This feature was added upstream in libexpat 2.1.0. */
+-    XML_SetHashSalt(self->itself,
+-                    (unsigned long)_Py_HashSecret.expat.hashsalt);
++    /* Prefer 16-byte entropy (expat >=3D 2.8.0 or backported). */
++    if (XML_SetHashSalt16Bytes !=3D NULL) {
++        XML_SetHashSalt16Bytes(self->itself, _Py_HashSecret.expat.hashsal=
t16);
++    }
++#if XML_COMBINED_VERSION >=3D 20100
++    else {
++        /* This feature was added upstream in libexpat 2.1.0. */
++        XML_SetHashSalt(self->itself,
++                        (unsigned long)_Py_HashSecret.expat.hashsalt);
++    }
+ #endif
+     XML_SetUserData(self->itself, (void *)self);
+     XML_SetUnknownEncodingHandler(self->itself,
+@@ -2257,6 +2267,12 @@ pyexpat_exec(PyObject *mod)
+ #else
+     capi->SetHashSalt =3D NULL;
+ #endif
++    /* Detect at runtime via weak symbol */
++    if (XML_SetHashSalt16Bytes !=3D NULL) {
++        capi->SetHashSalt16Bytes =3D XML_SetHashSalt16Bytes;
++    } else {
++        capi->SetHashSalt16Bytes =3D NULL;
++    }
+ #if XML_COMBINED_VERSION >=3D 20600
+     capi->SetReparseDeferralEnabled =3D XML_SetReparseDeferralEnabled;
+ #else
diff --git a/meta/recipes-devtools/python/python3_3.12.13.bb b/meta/recipes=
-devtools/python/python3_3.12.13.bb
index de174f7bfd..b6ceb0c634 100644
--- a/meta/recipes-devtools/python/python3_3.12.13.bb
+++ b/meta/recipes-devtools/python/python3_3.12.13.bb
@@ -47,6 +47,7 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Pytho=
n-${PV}.tar.xz \
            file://CVE-2026-11940.patch \
            file://CVE-2026-11972.patch \
            file://CVE-2026-9669.patch \
+           file://CVE-2026-7210.patch \
            "
=20
 SRC_URI:append:class-native =3D " \
--=20
2.34.1


