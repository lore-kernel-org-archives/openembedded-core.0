Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5D01CD98C5
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 06:37:12 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.123820.1781505422221099726
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 23:37:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=ogZJDVAd;
 spf=pass (domain: est.tech, ip: 52.101.65.66, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pNzaqseCUUvjWjcgId3Fy9YngmKv5LcglMF1fhRaVkSD+RQxntdENVqsJvxg+e9IyRPWDP0BIV3yuPg1eQwQzohXZ+yFQ7r9p2oViOi1WJkPSJpxbPA98uK6psO+MvlIFRETlGBSFEWwTK92weovtvc52x8DMVRS0tKXDvnkFLvbQixWwIUln0+59ImnRJgY+dTiQJk+8q4P1NdEff7zS80UC1yBM27/dgTUIK3ZOkVHgIqTBnWhSr92YSa1VkwsUeAzbuAVPoTGIHyc7Abvm2whaddP+y5akbSrrybb9BElC4/0lJNlmK0ytcYMxNKfPjSgUJT6JD5lnoVTmJxRyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PLuT4+EpAWo2YozTNxmMfBuC7R/oXbT/tkyiWr+mcNQ=;
 b=X9ah5CHiKIa6zggt2yektgiyck/u2HrAS4hLrRAq+fqt90iYCJ/y8lmM7t2vT9+LDni269JwgV3ED9TOktnjmRrIMQOrLeR+OyEXq7uNDzkFp/tPU/lCwPZukgTEJ4zPxiN8ACaHf20qgw862oIntNTBrDuxC4MHufxlwBo0eDR33BItsSO86pL4ilHKJG1lefQLIInFvYTG2GhlT+bFtXjrthRMTb/XfTwa9mPHtcrBRtgECCAac3X+EBjehvjP5OQPfMUl/BgT9pq+9tanEoEaecMXVDUN0wCkBeMgdycFHVENrjc/EdchsAkFwcM2stOh/F6HRBpm5lIjWaK5jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PLuT4+EpAWo2YozTNxmMfBuC7R/oXbT/tkyiWr+mcNQ=;
 b=ogZJDVAdXhY4LKPi65djY/2VVXPIIrlgcpRJer0qdmk1LW4XvchWjtLeQ9H7EgsibYuXuYJ75r+MaSo0NVOqf6PgDHQOrWg4B2EUKl/V7PvUs/MpX3HuGSknM2t0xuuT9q3njkkQ925T0sh/wg8igKS9va458Wya8beownj73/2dDd0/3Cm2BGewWawRv/qrKVJtb/CydZzpTozFJsApGkuZmxQhkdzTgLlB01mJ6qsZcDuqtUR37diuEolYIqcu1FcnT8qyO89s+05jWaK6DjaOVDl9hyQ4UsHRKlGVBy1ks+cSM6ZGzPFBqKCgnQYlCQK7dZD69Xe02SZCt4Xehw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by BESP189MB3284.EURP189.PROD.OUTLOOK.COM (2603:10a6:b10:e7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 06:36:59 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95%4]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 06:36:59 +0000
From: amaury.couderc@est.tech
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/2][OE-core][scarthgap] python3: fix CVE-2026-7210
Date: Mon, 15 Jun 2026 08:36:23 +0200
Message-ID: <20260615063640.25128-1-amaury.couderc@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU7P191CA0026.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:54e::6) To AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6ad::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP189MB3196:EE_|BESP189MB3284:EE_
X-MS-Office365-Filtering-Correlation-Id: 90d585e4-ae50-40c7-fa94-08decaa88082
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|18002099003|13003099007|56012099006|11063799006|25016099003|12006099003|6133799003|29003799003;
X-Microsoft-Antispam-Message-Info: 
	0S7LnSbnUdAE7sJR1mohvL7z9J1Vo8rrUZzKh1M+ECyE4UmjmS+ZLuvVvDeRCNNzMmdJ/H/ypKVf4yPW6PooAh0fLZcy/tBsaiNixYU8gQV8jKDZ0gsdoUyN0leoU8KkB2fJ1RAANlL/t/TwlknrD2nbhFMOiTejLU6bWayng+1BRmvNSs9cau8hJ6xVk+pK577nY93b2hE7YjpEkJq1ndGUUre1HY/RouLnLw4HDAaRGOUgt8wL1pAhH/8RtEhoqkte58bzEKk/eFEy1Vi3C6PStJM+4p6qTi6LeSwzmhGtYzht7uFPhtj5i3bZtnY1a8GmA7G+FbCq98o1vEEo8nDXwlEyVWOIyaT50KNaDJaIeCIMrHZQklhBcJGRUAKKMPP2zXB9LkYTAABPSgNMm6TCDw3j3P7k6j9sytJum8ij5YiEQI0zhQARDXJYA00FLmTeDqxzhN89mZc0OQ6tfUVzols0+v5+AfJ0CYCYKH2cO98OK+tJcZmkVF6pJe7jLI/iMY0s7m8sFCLh2s6JRsCE/z22lLyAapT0dXWFZQhKYXyayJprKZbC97m7CdG7/N5Gkulv0P9JbceFlMHu3+GxJg7Ngbp639rpxcsh49hAoMWiKwndv/7WVJBc2ErTZ1rZ2vYmFwVFeliw+4vE6S90tFfyukGrVwirU8l8NP8gn2igi3Np8VUYoOzSl1uOP6UD/62cJ9W6DXJEb6kMzw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18002099003)(13003099007)(56012099006)(11063799006)(25016099003)(12006099003)(6133799003)(29003799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jbo9FrrH5EXlRoOml5DnNd90ojwhDLpcRsWjgLe7mC06n+18zwsBqyX+LdEk?=
 =?us-ascii?Q?Za16dpEmvf2fT+gjHBVX5jg7GH/Eh7jWUFUsw4uQW9A2dCPruiVGihccRg4X?=
 =?us-ascii?Q?XubuaXqRGc/ICn3osE5OIglRcut5bGCgx/EaMKVNL3sqnsthhyWYQH4AwY3k?=
 =?us-ascii?Q?GUMoQPgSa7Pa/Yfhvrzp3uibVLj9G0ShK+3NNLNnA7aWQJpeDJgSKH3rXPa2?=
 =?us-ascii?Q?cihmJqMcFIKVz26zK5lODuNGWxwaqOdMA8ySlfuFjXCO5fRenVSzoNskVE0w?=
 =?us-ascii?Q?3BElX+eRxxcY69walqU2mYqTFxFzTVDuSzujVzcBVUlXRQYVgPwdtwK0a8pj?=
 =?us-ascii?Q?TGDpSFoqVqO8jq3r/HILKHgDeIZCf2pr6M5DQaKmG2X2MhCOcUx/juax2dKB?=
 =?us-ascii?Q?BcVrSrcFuyyJdifMMvSaRCoaDgdtkZnTb3GyuPfDwIo+iLaT9hbsTSfHD59X?=
 =?us-ascii?Q?phg1izauTmHNSqR5+Mgft7XoUIrlcnxHz6sYROtbMUZNK01MsC/G2DNs24qJ?=
 =?us-ascii?Q?X+4oPZwA1zdGg5zj9cTtDBgl3q1dMwxDfnR2xbSkshmzHJ6ObKe7dPONE+GE?=
 =?us-ascii?Q?/q1J0bE26fINCSAcIGe6l5AyT8vONOvNtDGvF22yJBX+yhEuzj9FcJ8yW4Ou?=
 =?us-ascii?Q?S67K9BWK08o56bRK8OCEA8NSvQPb4ZEtD8biU+n2F3LrXdXH1UEs5rdvKgHi?=
 =?us-ascii?Q?I9XlWlUyxZFxodUbWR5pwLJILzjy0xqNP8OpOuqZJUxUfktY5GtUyHSLjYH6?=
 =?us-ascii?Q?tRVCYCvO0oVtMayVU4J7KcOqY7CQLz5/iWlmmIEmxRoGEqJqpwy9ejcpibo/?=
 =?us-ascii?Q?JpD5wGovfsUOP0sHN3Wtus37x6l5Uv/hsSRzZzdh//y/pgzAg7xXM4nQWueM?=
 =?us-ascii?Q?dS5foPPGn/MSJ5PgWBk0K2wQmDPcP7PGekl2q64fhJse1/fLVu4FPB4hN1yT?=
 =?us-ascii?Q?MvbaCsZNSV8DLCOa9jtpH8JRBDToSMnvOfafH88G3JjDNrmTitPs1l7wd/MM?=
 =?us-ascii?Q?+I7BrRm213XL9EnuGSRkPMypKi8A8WrkV3z9CPybT/w5EPN4yGXoJY+ULpHS?=
 =?us-ascii?Q?J69n36uuwBy/fDGWgXsttS5WheVKNFO45yfPcOuvVGzFRoMHhqqxc+FVizk3?=
 =?us-ascii?Q?+3hc8Hdvfd96sWhrPd0rR63/6l0AQPOEUJ3DboHjQPtoDyyLNHHY0y49Ow4+?=
 =?us-ascii?Q?u+9ZvmGX56N6guV4pHGHRZicVhwp7OEUfM6MMKWlajZCaB9xiS9qKNbZMkyv?=
 =?us-ascii?Q?TlrhUbzs6Lqm8/MmBNEL4ADexNlDRwfwe1XRIXa90ITgwrWiPxv9mV8g8Aq1?=
 =?us-ascii?Q?cZ1Ti+65+H+IJ+TEyqWslLh2r/+VkZo5s4XA5NOVu77ajGRuLjJ8irFI2ZDl?=
 =?us-ascii?Q?xd2x9mNOsY5onzKajPUI8N96qTnnayqcKRFVCLwndh/oNcUCWyvLa2ROWNrZ?=
 =?us-ascii?Q?6fnP35AfliGCK4QzW9MrQS48+BKBYeV69tdIAtCKb97vedSVGq4LTANmuA+t?=
 =?us-ascii?Q?D2/f6l3JlCq1yVCQW0tb5JQqvoMt+WqQOlEc1NRAjcOakPIUlUNR6/7DT4hi?=
 =?us-ascii?Q?hCC4vwmVgXRmnvf9tph8glxSqAHNXCbMQxvvQgCjkfZ/UJzKRIGoGZ8EWSwQ?=
 =?us-ascii?Q?G+fpONnxStv+AXaOLcLfzbv8N/HXTZKlW/4afnX2VdO8QFBDHOgLnE/9PQOb?=
 =?us-ascii?Q?09r6gGY/AhVWBJTTAsMWIl9p29DLdYZFgr8j39ddXYkFXrkR3p9lr8QKuSuS?=
 =?us-ascii?Q?IDVa5oLALQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 90d585e4-ae50-40c7-fa94-08decaa88082
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 06:36:59.3228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wh21kCg90T1x3loZMZiCLLla2/KaNf/cI6pH2LQoRm+nfIugQF6vW9uD/SUQtbIm+sKcw5BtU1tbYDqUubzg0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESP189MB3284
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 06:37:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238815

From: Amaury Couderc <amaury.couderc@est.tech>

Backport patch to fix CVE-2026-7210.
  https://nvd.nist.gov/vuln/detail/CVE-2026-7210

In order to mitigate CVE-2026-7210 this patch should come alongside=20
the associated expat one which backports to expat 2.6.4 the fixes=20
introduced in expat 2.8.0.

Upstream fixes:
  https://github.com/python/cpython/pull/149023/commits/03794ce9a58b1f33751=
c88d7d876dfbf27645c56
  https://github.com/python/cpython/pull/149023/commits/ccb8d2f7df9534e49a4=
3554193d7f5f4d993189c


Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
---
 .../python/python3/CVE-2026-7210-1.patch      | 90 +++++++++++++++++++
 .../python/python3/CVE-2026-7210-2.patch      | 74 +++++++++++++++
 .../python/python3_3.12.13.bb                 |  2 +
 3 files changed, 166 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-7210-1.pa=
tch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-7210-2.pa=
tch

diff --git a/meta/recipes-devtools/python/python3/CVE-2026-7210-1.patch b/m=
eta/recipes-devtools/python/python3/CVE-2026-7210-1.patch
new file mode 100644
index 0000000000..63aac320af
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2026-7210-1.patch
@@ -0,0 +1,90 @@
+From 03794ce9a58b1f33751c88d7d876dfbf27645c56 Mon Sep 17 00:00:00 2001
+From: Stan Ulbrych <stan@python.org>
+Date: Sun, 26 Apr 2026 19:31:25 +0100
+Subject: [PATCH] Use `XML_SetHashSalt16Bytes` from libExpat when possible
+
+CVE: CVE-2026-7210
+Upstream-Status: Backport [https://github.com/python/cpython/pull/149023/c=
ommits/03794ce9a58b1f33751c88d7d876dfbf27645c56] with downstream extension =
for XML_BACKPORT_SET_HASH_SALT_16_BYTES detection
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
+@@ -1388,7 +1388,12 @@ newxmlparseobject(pyexpat_state *state, const char =
*encoding,
+         Py_DECREF(self);
+         return NULL;
+     }
+-#if XML_COMBINED_VERSION >=3D 20100
++#if defined(XML_BACKPORT_SET_HASH_SALT_16_BYTES) \
++    || XML_COMBINED_VERSION >=3D 20800
++    /* This feature was added upstream in libexpat 2.8.0. */
++    XML_SetHashSalt16Bytes(self->itself,
++                           (const uint8_t *)_Py_HashSecret.uc);
++#elif XML_COMBINED_VERSION >=3D 20100
+     /* This feature was added upstream in libexpat 2.1.0. */
+     XML_SetHashSalt(self->itself,
+                     (unsigned long)_Py_HashSecret.expat.hashsalt);
+@@ -2257,6 +2262,12 @@ pyexpat_exec(PyObject *mod)
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
diff --git a/meta/recipes-devtools/python/python3/CVE-2026-7210-2.patch b/m=
eta/recipes-devtools/python/python3/CVE-2026-7210-2.patch
new file mode 100644
index 0000000000..e9a10d3705
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
+@@ -1391,8 +1391,7 @@ newxmlparseobject(pyexpat_state *state, const char *=
encoding,
+ #if defined(XML_BACKPORT_SET_HASH_SALT_16_BYTES) \
+     || XML_COMBINED_VERSION >=3D 20800
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
index 5fa25235fe..3e5575d396 100644
--- a/meta/recipes-devtools/python/python3_3.12.13.bb
+++ b/meta/recipes-devtools/python/python3_3.12.13.bb
@@ -34,6 +34,8 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Pytho=
n-${PV}.tar.xz \
 	   file://0001-test_deadlock-skip-problematic-test.patch \
 	   file://0001-test_active_children-skip-problematic-test.patch \
            file://0001-test_readline-skip-limited-history-test.patch \
+           file://CVE-2026-7210-1.patch=C2=A0\
+           file://CVE-2026-7210-2.patch=C2=A0\
            "
=20
 SRC_URI:append:class-native =3D " \
--=20
2.34.1


