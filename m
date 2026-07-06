Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 636E8C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 12:04:48 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.149493.1783339484291106105
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 05:04:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=kgx5syMY;
 spf=pass (domain: est.tech, ip: 40.107.130.64, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sBvrvmVzsAO4bCRozB+hIyF3ThjrX29J2JZSe4ZFjekosaIqRSLEey3lyKOQYq5x6DXaQFGtx+86V4/0X+VOrRKUB2aQdsr7qT1i2eoJediThLKBjSVyhKmRo/Xgy3MwYLy/9xGyKI7zayCRGuOHnN7ZKNBvpqJ3unTBBWPhcaYMi8x3pDVk9F0IM0PhNVCk2KxBa/R6eZrY8hmN7gyiW38mHDz07knJmrM1kSkezPKwB9Bpu56KfNsXBENbSjoPNCSU5hcCCwEWpG1HVHFm9Ma80DDEnZ6cHHxkLKLmGM9fjJ5DRr7Y9gtID3b63uYpBshlNaB9kOILNh54B4EMqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qYod/6gpdkEy4Saiy26AkdSX0KC77exdOTOQhuXwH6E=;
 b=AvPb1/0sqUF8jXolh9fxLvHAzfqIQwygPgnt3B4gruNJhfIAkMnqD7rz6qjtFtlPi71e9iBKmTemw809myEbyuUraHjHyt7Mf/0wnzmu6B7A2ap2YT/yh1qxUV8MCzvPlRfKhnwEooX9EO++iYeawtN7FmYUW1P7ablOm5AOG6g/KX1qlW4NRwNxcUjKQvwJT12i35AMWkXjimRaVsE2BGmNKdH7Q1/M5HNNqcgNFYY5zjGZGfs9MhMigJpRtjWZ3tNLlxLO5PMBMkgFjrVrgJo0YowujQ13NaJAxX17fTHsVBDLNUcwasl4+3gpwxv0snLmGRieT2aOkiy+xF4YfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qYod/6gpdkEy4Saiy26AkdSX0KC77exdOTOQhuXwH6E=;
 b=kgx5syMYzT5R0lZHrx+opJ7M2aVHyGoUoP5+QY/iszBvL0lY/+LB85i6NfHd8aPakSVTz55hoKupjfMi6i0olEGN1/yAvFPnFlByElAVaHJGKHpDVyE5NZYs8FCihfipPCQc3bhM43H1fowIKMeFS5nkNpy/sWhQ8CmW0EYl1vrc12RmUro7sT0LMVi8UzWyxTx6HgMe558gKgtuiZRZjT0X9VZdYsJaNEcIyiGAObSdwkHH8LlzkkeLlGKvHxpZ6yx9VahM0I+fnlvMvtmkCAsIRoMGloLmY/USPsi+kknC5Oy8xOmGgT/cmK2C6tp3MHusi6FPKQFt2emHszqrTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by GV2P189MB2453.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:d3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Mon, 6 Jul
 2026 12:04:38 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95%4]) with mapi id 15.21.0181.008; Mon, 6 Jul 2026
 12:04:38 +0000
From: amaury.couderc@est.tech
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2][wrynose] expat: fix CVE-2026-41080
Date: Mon,  6 Jul 2026 14:04:12 +0200
Message-ID: <20260706120430.37403-1-amaury.couderc@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU2P250CA0020.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:231::25) To AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6ad::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP189MB3196:EE_|GV2P189MB2453:EE_
X-MS-Office365-Filtering-Correlation-Id: eca2f79a-6672-45b1-74b1-08dedb56c095
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|18002099003|56012099006|11063799006|5023799004|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	DmXiZ/M6vTjI67j2Ruhbx3+wXlnjdfRJACkO7Zo8djrQ48L3pSyUP8xgAZdhEE3mgMz9OBNNupeQP2WvqePE2d0YCUhTVQ8jOmG+xC2izqoJWggbNVrwsYU68xl8n0C2vewBRr9UUCNtP11XgFiElaR029mMMfsJQMsltvjUFXwrDoABQ4/rzsVZG9hJl6EZjlIgsiEFTdCwGLXfz320tEgmRHf6nuafRjDQzpKKDi/gTEq1rgLG4dRpvJEO+6rCPv6u2u3oHg/2edAm+cOFzJthad1Q02f8tLq4YPjFE+oP8PHZ2DmQGiXpnNzTO8rR8QKKL5az3qwj9LjLf9YxBD/2v6MCu4G8xwpSEV56mwatdCKLlihMXwKgrHFgUYWaKccs92dgHuA8Dzhuc1k8EK5y4NpiHeyBQv/4LG2vKg08hxgjzEU9K/fGrt/hCuGf0U7woIBJ/Jph1SvomI+gBnZtX818mNj0tRNS7OIxyKpNj4IY4ZFs76fIs5f54Wun4/cBs6r9ENW7BFbjkvyiahCkIVT4djy4mq1PLffYoZNFUB4tg5hMUYHTLY8rsZg7mHhQ+7mYexyG1VJ1ZjUoaBKUeGWqK0mvJc27X9v5U1gB+VLWVV7c6mesP0Fkh/E+gC+lDg5uYorxqMHsFL43jHt4XnMJmWL6TXsxn3MIhII=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(18002099003)(56012099006)(11063799006)(5023799004)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?102hq1HNPiXMHmWrQmHLQg/GkYITbdRMnGUFXlV2oxrlb1NuAEf1rpV9MeVi?=
 =?us-ascii?Q?hkOIcpLZnPATQaC8gTEvGYkhX8VKnAiN0mw6Ru76glkCTPgCxQ4Sh7gm11+j?=
 =?us-ascii?Q?xG4zJj90utsaTGqMO+WDWA5E/HnlUcPxgR6Ncs02x4uIpNv9/WvA29oFzIJy?=
 =?us-ascii?Q?lbejC7RoivO3c5AXm4Buh9LeWC561Xknhqkh8j+40RoFLjdxVO3QIWwsXSoy?=
 =?us-ascii?Q?/Y4eR9VbT2qpqjEi/1nlUqdoAtGGr9qI3lYiCcLSAW4G8vCnm4f5QkIMSZ8X?=
 =?us-ascii?Q?+GbBumvhi5zuFT/A6diApaTFKAos/x8rxZBTZfArtBIQEbg4+9RkG2YEd+8s?=
 =?us-ascii?Q?J549ypW0EmcHYAKl4dBQ81BwJum4tRu2E+HC2GVw0eJVM+hTA+E1YkU/ojgi?=
 =?us-ascii?Q?VWiIcQrGxWoOghZSbqXCmhr4XYPdFQv3otzjox3Wa5Wyg0Fa5p+z1PdO3j/c?=
 =?us-ascii?Q?7XMcdbrYwaC1vPADgIjVT6/mUUd2dEPny2k2FmJ0+hhfTuIH3MAVoxTv71RK?=
 =?us-ascii?Q?9VuEsUk3r3aV81qERLs7LoUoJ/g+/HhDzRyRUmIMQRh67DYQAzVhaf4mcyt4?=
 =?us-ascii?Q?OrWBLBhBzrhMhmF0u5iSc6b94FwAKnUxlLdhMqbXhcPW+eYtxASC9NU03zPh?=
 =?us-ascii?Q?tI0rkW7stUbu09VFKBoSj+6kVLbCsDth0w/NyM+Z9aLQyLT8iUOYfXKLUs5J?=
 =?us-ascii?Q?OR2n1yaLyy+MFmv4QJKoa+pM2IMo6xslFOKag5Uc2SAR3GgnHcRZNhbAorNh?=
 =?us-ascii?Q?vy32zhZmmIyKLW3hz8YMdKrZkI92mqM1s+DHaX3ZfKPyXLHktNselOXeac7l?=
 =?us-ascii?Q?t7xHEfCsTYbSoEi2oOumJcSgBH18GeJoc+nu1aZFnQGcalukgvVXMUXQkLUz?=
 =?us-ascii?Q?RomY806Iwd1g+/HE7aksvPJVq5vq8ragms2NAcB4+S/YwWRiw9iwkFOGGxVM?=
 =?us-ascii?Q?7D9TGl42ttz4euMQDmGfnahUhRY6MabZmadq1PpMNjD7XSnQZexPiXKxFrM5?=
 =?us-ascii?Q?GhyNWwnIi4gvKjG1L00PU0XgHSWJJ8tkEshbSt8OC4BKrbLMwxeAohU2JJrp?=
 =?us-ascii?Q?74zNNSwuPxHbl2YIvwOvay2GqVpcfUehvsxHAe82eHOzWw9+2Xq29rT5WlU6?=
 =?us-ascii?Q?Yts1NK8oE6Sx8XBT/o/8AskyvBPkb5lJ8Bu6igi2AU1hxtxv6fQ9+6qowllu?=
 =?us-ascii?Q?1DVG7WOE1DIrU+R2GyIHG7fzR4PcVUYedD/eZ6hG/rIEfhwd+alHFvkruuGK?=
 =?us-ascii?Q?aPgj/E9oCheHlt6MtkDCe7f2vPuz6nHAOiKvK1Q3Qkl2TwfiO7Iz50jHnYCK?=
 =?us-ascii?Q?5ICzYvfsSZ94QpkWTKK2KKBU88fwkp0P2id2UED4sGwe/WAX3yB6X7OdS7nC?=
 =?us-ascii?Q?TZPZZseX39QTC95SNKLj6hnbbiSh03opEuarV3cAFaCytMJJIcGVKpBRlC7l?=
 =?us-ascii?Q?ndjyGR92Z59Awf8gpA/xBsaUbg1aauxJtDPnMKU4YqN3geMNzUYB4XtBtgPh?=
 =?us-ascii?Q?LClAke5Ee4qufzxC0/W2iok31jWROyeNd0MWBvIjIsLS0vpYGcGxjzZZpQxN?=
 =?us-ascii?Q?nHxxuw4zqVP0ZMOyoj+0DCeODuogJxTnNQxMzeiyVYvIEjYXgyBdlJviPylo?=
 =?us-ascii?Q?B5c2YJofnxSabNSRq2cUH+7bmRaZL0wkikXXLBCEYeLjXyeTiHrXAh+JPTkD?=
 =?us-ascii?Q?9+TwSqBVtf8Uxq6yCWDzT3+TQHPSZ5aAHG7D/exU0B8yg5vnQh5QO/AhbiX7?=
 =?us-ascii?Q?czcNPYEO1A=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: eca2f79a-6672-45b1-74b1-08dedb56c095
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 12:04:37.9583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tjTbyDZk7migq5m76sKqaKGIr+9W1MWK/DmGqIzgxL1NpO7IeaTPJSOz+Fn/9Fd4b8wG94QHZLuu1m3v3c3tHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P189MB2453
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 12:04:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240261

From: Amaury Couderc <amaury.couderc@est.tech>

The existing hash flooding protection (based on SipHash) only used 4 to 8
bytes of entropy for a salt, when 16 bytes of salt are supported by the
implementation of SipHash used by Expat. Now full 16 bytes of entropy are
used to improve protection against hash flooding attacks.

Introduces new API function XML_SetHashSalt16Bytes and deprecates the
legacy XML_SetHashSalt which is limited to 4-8 bytes.

The fix is split into 3 patches for reviewability:
  1. Core entropy changes: migrates hash salt storage to struct sipkey,
     extracts 16 bytes of entropy, and introduces m_hash_secret_salt_set.
  2. New API: adds XML_SetHashSalt16Bytes, deprecates XML_SetHashSalt,
     updates documentation, symbol exports, and tests.
  3. Windows/cmake: adds the missing .def export for the new symbol.

Backport patch to fix CVE-2026-41080
https://nvd.nist.gov/vuln/detail/CVE-2026-41080

Upstream fix:
https://github.com/libexpat/libexpat/pull/1183

CVE: CVE-2026-41080

Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
---
 .../expat/expat/CVE-2026-41080-1.patch        | 251 ++++++++++++++
 .../expat/expat/CVE-2026-41080-2.patch        | 310 ++++++++++++++++++
 .../expat/expat/CVE-2026-41080-3.patch        |  32 ++
 meta/recipes-core/expat/expat_2.7.5.bb        |   3 +
 4 files changed, 596 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-41080-1.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-41080-2.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-41080-3.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-41080-1.patch b/meta/re=
cipes-core/expat/expat/CVE-2026-41080-1.patch
new file mode 100644
index 0000000000..d2a957a5e8
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-41080-1.patch
@@ -0,0 +1,251 @@
+From 944f825b0119257fee3aed0841e44a6d1c674f80 Mon Sep 17 00:00:00 2001
+From: Amaury Couderc <amaury.couderc@est.tech>
+Date: Thu, 2 Jul 2026 09:10:07 +0000
+Subject: [PATCH 1/3] expat: fix CVE-2026-41080 use 16 bytes of entropy for=
 hash salt
+
+The existing hash flooding protection in libexpat (based on SipHash)
+only used 4 to 8 bytes of entropy for a salt, when 16 bytes are
+supported by the SipHash implementation. This allows attackers to more
+feasibly guess the hash salt and craft inputs that cause hash
+collisions, leading to denial of service.
+
+Backport upstream changes that:
+- Drop unused parameter from generate_hash_secret_salt
+- Migrate hash salt storage to larger struct sipkey (128-bit)
+- Drop unneeded void * casts in generate_hash_secret_salt
+- Extract 16 bytes of entropy for hash flooding protection
+- Introduce internal flag m_hash_secret_salt_set
+- Update get_hash_secret_salt to return from the new 128-bit struct
+
+Squashed backport of upstream commits 909201a8, bc193afc, 08697a9b,
+f5eacefb, and fa1ebd60.
+
+Based on upstream PR: https://github.com/libexpat/libexpat/pull/1183
+
+CVE: CVE-2026-41080
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1183/=
commits/fa1ebd60bfcc6d32f329803e5e837251e2387ed1]
+
+Signed-off-by: Sebastian Pipping <sebastian@pipping.org>
+Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
+---
+ lib/internal.h |  2 ++
+ lib/xmlparse.c | 80 +++++++++++++++++++++++++++++++-------------------
+ 2 files changed, 52 insertions(+), 30 deletions(-)
+
+diff --git a/lib/internal.h b/lib/internal.h
+index 61266ebb..1995c17b 100644
+--- a/lib/internal.h
++++ b/lib/internal.h
+@@ -113,6 +113,7 @@
+ #if defined(_WIN32)                                                      =
      \
+     && (! defined(__USE_MINGW_ANSI_STDIO)                                =
      \
+         || (1 - __USE_MINGW_ANSI_STDIO - 1 =3D=3D 0))
++#  define EXPAT_FMT_LLX(midpart) "%" midpart "I64x"
+ #  define EXPAT_FMT_ULL(midpart) "%" midpart "I64u"
+ #  if defined(_WIN64) // Note: modifiers "td" and "zu" do not work for Mi=
nGW
+ #    define EXPAT_FMT_PTRDIFF_T(midpart) "%" midpart "I64d"
+@@ -122,6 +123,7 @@
+ #    define EXPAT_FMT_SIZE_T(midpart) "%" midpart "u"
+ #  endif
+ #else
++#  define EXPAT_FMT_LLX(midpart) "%" midpart "llx"
+ #  define EXPAT_FMT_ULL(midpart) "%" midpart "llu"
+ #  if ! defined(ULONG_MAX)
+ #    error Compiler did not define ULONG_MAX for us
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 0248b665..59235c85 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -604,7 +604,7 @@ static ELEMENT_TYPE *getElementType(XML_Parser parser,=
 const ENCODING *enc,
+=20
+ static XML_Char *copyString(const XML_Char *s, XML_Parser parser);
+=20
+-static unsigned long generate_hash_secret_salt(XML_Parser parser);
++static struct sipkey generate_hash_secret_salt(void);
+ static XML_Bool startParsing(XML_Parser parser);
+=20
+ static XML_Parser parserCreate(const XML_Char *encodingName,
+@@ -777,7 +777,8 @@ struct XML_ParserStruct {
+   XML_Bool m_useForeignDTD;
+   enum XML_ParamEntityParsing m_paramEntityParsing;
+ #endif
+-  unsigned long m_hash_secret_salt;
++  struct sipkey m_hash_secret_salt_128;
++  XML_Bool m_hash_secret_salt_set;
+ #if XML_GE =3D=3D 1
+   ACCOUNTING m_accounting;
+   MALLOC_TRACKER m_alloc_tracker;
+@@ -1192,57 +1193,61 @@ gather_time_entropy(void) {
+=20
+ #endif /* ! defined(HAVE_ARC4RANDOM_BUF) && ! defined(HAVE_ARC4RANDOM) */
+=20
+-static unsigned long
+-ENTROPY_DEBUG(const char *label, unsigned long entropy) {
++static struct sipkey
++ENTROPY_DEBUG(const char *label, struct sipkey entropy_128) {
+   if (getDebugLevel("EXPAT_ENTROPY_DEBUG", 0) >=3D 1u) {
+-    fprintf(stderr, "expat: Entropy: %s --> 0x%0*lx (%lu bytes)\n", label=
,
+-            (int)sizeof(entropy) * 2, entropy, (unsigned long)sizeof(entr=
opy));
++    fprintf(stderr,
++            "expat: Entropy: %s --> [0x" EXPAT_FMT_LLX(
++                "016") ", 0x" EXPAT_FMT_LLX("016") "] (16 bytes)\n",
++            label, (unsigned long long)entropy_128.k[0],
++            (unsigned long long)entropy_128.k[1]);
+   }
+-  return entropy;
++  return entropy_128;
+ }
+=20
+-static unsigned long
+-generate_hash_secret_salt(XML_Parser parser) {
+-  unsigned long entropy;
+-  (void)parser;
++static struct sipkey
++generate_hash_secret_salt(void) {
++  struct sipkey entropy;
+=20
+   /* "Failproof" high quality providers: */
+ #if defined(HAVE_ARC4RANDOM_BUF)
+   arc4random_buf(&entropy, sizeof(entropy));
+   return ENTROPY_DEBUG("arc4random_buf", entropy);
+ #elif defined(HAVE_ARC4RANDOM)
+-  writeRandomBytes_arc4random((void *)&entropy, sizeof(entropy));
++  writeRandomBytes_arc4random(&entropy, sizeof(entropy));
+   return ENTROPY_DEBUG("arc4random", entropy);
+ #else
+   /* Try high quality providers first .. */
+ #  ifdef _WIN32
+-  if (writeRandomBytes_rand_s((void *)&entropy, sizeof(entropy))) {
++  if (writeRandomBytes_rand_s(&entropy, sizeof(entropy))) {
+     return ENTROPY_DEBUG("rand_s", entropy);
+   }
+ #  elif defined(HAVE_GETRANDOM) || defined(HAVE_SYSCALL_GETRANDOM)
+-  if (writeRandomBytes_getrandom_nonblock((void *)&entropy, sizeof(entrop=
y))) {
++  if (writeRandomBytes_getrandom_nonblock(&entropy, sizeof(entropy))) {
+     return ENTROPY_DEBUG("getrandom", entropy);
+   }
+ #  endif
+ #  if ! defined(_WIN32) && defined(XML_DEV_URANDOM)
+-  if (writeRandomBytes_dev_urandom((void *)&entropy, sizeof(entropy))) {
++  if (writeRandomBytes_dev_urandom(&entropy, sizeof(entropy))) {
+     return ENTROPY_DEBUG("/dev/urandom", entropy);
+   }
+ #  endif /* ! defined(_WIN32) && defined(XML_DEV_URANDOM) */
+   /* .. and self-made low quality for backup: */
+=20
+-  entropy =3D gather_time_entropy();
++  entropy.k[0] =3D 0;
++  entropy.k[1] =3D gather_time_entropy();
+ #  if ! defined(__wasi__)
+   /* Process ID is 0 bits entropy if attacker has local access */
+-  entropy ^=3D getpid();
++  entropy.k[1] ^=3D getpid();
+ #  endif
+=20
+   /* Factors are 2^31-1 and 2^61-1 (Mersenne primes M31 and M61) */
+   if (sizeof(unsigned long) =3D=3D 4) {
+-    return ENTROPY_DEBUG("fallback(4)", entropy * 2147483647);
++    entropy.k[1] *=3D 2147483647;
++    return ENTROPY_DEBUG("fallback(4)", entropy);
+   } else {
+-    return ENTROPY_DEBUG("fallback(8)",
+-                         entropy * (unsigned long)2305843009213693951ULL)=
;
++    entropy.k[1] *=3D 2305843009213693951ULL;
++    return ENTROPY_DEBUG("fallback(8)", entropy);
+   }
+ #endif
+ }
+@@ -1252,7 +1257,7 @@ get_hash_secret_salt(XML_Parser parser) {
+   const XML_Parser rootParser =3D getRootParserOf(parser, NULL);
+   assert(! rootParser->m_parentParser);
+=20
+-  return rootParser->m_hash_secret_salt;
++  return rootParser->m_hash_secret_salt_128.k[1];
+ }
+=20
+ static enum XML_Error
+@@ -1323,8 +1328,10 @@ callProcessor(XML_Parser parser, const char *start,=
 const char *end,
+ static XML_Bool /* only valid for root parser */
+ startParsing(XML_Parser parser) {
+   /* hash functions must be initialized before setContext() is called */
+-  if (parser->m_hash_secret_salt =3D=3D 0)
+-    parser->m_hash_secret_salt =3D generate_hash_secret_salt(parser);
++  if (parser->m_hash_secret_salt_set !=3D XML_TRUE) {
++    parser->m_hash_secret_salt_128 =3D generate_hash_secret_salt();
++    parser->m_hash_secret_salt_set =3D XML_TRUE;
++  }
+   if (parser->m_ns) {
+     /* implicit context only set for root parser, since child
+        parsers (i.e. external entity parsers) will inherit it
+@@ -1612,7 +1619,9 @@ parserInit(XML_Parser parser, const XML_Char *encodi=
ngName) {
+   parser->m_useForeignDTD =3D XML_FALSE;
+   parser->m_paramEntityParsing =3D XML_PARAM_ENTITY_PARSING_NEVER;
+ #endif
+-  parser->m_hash_secret_salt =3D 0;
++  parser->m_hash_secret_salt_128.k[0] =3D 0;
++  parser->m_hash_secret_salt_128.k[1] =3D 0;
++  parser->m_hash_secret_salt_set =3D XML_FALSE;
+=20
+ #if XML_GE =3D=3D 1
+   memset(&parser->m_accounting, 0, sizeof(ACCOUNTING));
+@@ -1779,7 +1788,8 @@ XML_ExternalEntityParserCreate(XML_Parser oldParser,=
 const XML_Char *context,
+      from hash tables associated with either parser without us having
+      to worry which hash secrets each table has.
+   */
+-  unsigned long oldhash_secret_salt;
++  struct sipkey oldhash_secret_salt_128;
++  XML_Bool oldhash_secret_salt_set;
+   XML_Bool oldReparseDeferralEnabled;
+=20
+   /* Validate the oldParser parameter before we pull everything out of it=
 */
+@@ -1825,7 +1835,8 @@ XML_ExternalEntityParserCreate(XML_Parser oldParser,=
 const XML_Char *context,
+      from hash tables associated with either parser without us having
+      to worry which hash secrets each table has.
+   */
+-  oldhash_secret_salt =3D parser->m_hash_secret_salt;
++  oldhash_secret_salt_128 =3D parser->m_hash_secret_salt_128;
++  oldhash_secret_salt_set =3D parser->m_hash_secret_salt_set;
+   oldReparseDeferralEnabled =3D parser->m_reparseDeferralEnabled;
+=20
+ #ifdef XML_DTD
+@@ -1880,7 +1891,8 @@ XML_ExternalEntityParserCreate(XML_Parser oldParser,=
 const XML_Char *context,
+     parser->m_externalEntityRefHandlerArg =3D oldExternalEntityRefHandler=
Arg;
+   parser->m_defaultExpandInternalEntities =3D oldDefaultExpandInternalEnt=
ities;
+   parser->m_ns_triplets =3D oldns_triplets;
+-  parser->m_hash_secret_salt =3D oldhash_secret_salt;
++  parser->m_hash_secret_salt_128 =3D oldhash_secret_salt_128;
++  parser->m_hash_secret_salt_set =3D oldhash_secret_salt_set;
+   parser->m_reparseDeferralEnabled =3D oldReparseDeferralEnabled;
+   parser->m_parentParser =3D oldParser;
+ #ifdef XML_DTD
+@@ -2335,7 +2347,13 @@ XML_SetHashSalt(XML_Parser parser, unsigned long ha=
sh_salt) {
+   /* block after XML_Parse()/XML_ParseBuffer() has been called */
+   if (parserBusy(rootParser))
+     return 0;
+-  rootParser->m_hash_secret_salt =3D hash_salt;
++
++  rootParser->m_hash_secret_salt_128.k[0] =3D 0;
++  rootParser->m_hash_secret_salt_128.k[1] =3D hash_salt;
++
++  if (hash_salt !=3D 0) // to remain backwards compatible
++    rootParser->m_hash_secret_salt_set =3D XML_TRUE;
++
+   return 1;
+ }
+=20
+@@ -7842,8 +7860,10 @@ keylen(KEY s) {
+=20
+ static void
+ copy_salt_to_sipkey(XML_Parser parser, struct sipkey *key) {
+-  key->k[0] =3D 0;
+-  key->k[1] =3D get_hash_secret_salt(parser);
++  const XML_Parser rootParser =3D getRootParserOf(parser, NULL);
++  assert(! rootParser->m_parentParser);
++
++  *key =3D rootParser->m_hash_secret_salt_128;
+ }
+=20
+ static unsigned long FASTCALL
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-41080-2.patch b/meta/re=
cipes-core/expat/expat/CVE-2026-41080-2.patch
new file mode 100644
index 0000000000..a52d61e611
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-41080-2.patch
@@ -0,0 +1,310 @@
+From 969472a6d33e994c234ab2ed34f1a01348351b28 Mon Sep 17 00:00:00 2001
+From: Amaury Couderc <amaury.couderc@est.tech>
+Date: Thu, 2 Jul 2026 09:23:00 +0000
+Subject: [PATCH 2/3] expat: add XML_SetHashSalt16Bytes API for CVE-2026-41=
080
+
+Add the new XML_SetHashSalt16Bytes API function which accepts a full
+16 bytes of entropy for the hash salt, matching the capacity of the
+SipHash implementation used by Expat. The existing XML_SetHashSalt
+function is marked as deprecated since it only provides 4 to 8 bytes
+of entropy depending on the size of unsigned long.
+
+Changes include:
+- Add XML_SetHashSalt16Bytes to public API (expat.h)
+- Add symbol export in libexpat.map.in (LIBEXPAT_2.7.6)
+- Mark XML_SetHashSalt as deprecated
+- Document that XML_SetHashSalt needs a non-NULL parser
+- Include XML_SetHashSalt* with entropy debugging
+- Add test_hash_salt_setter unit test
+- Update documentation and Changes file
+
+Squashed backport of upstream commits f76124e7, e3349d85, c8c5caf4,
+592d5fa3, 8ad3ef57, ec9fcd2e, and 8017e11e.
+
+CVE: CVE-2026-41080
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1183/=
commits/4ba09dc471b39a78d77e5179d0243186c0c4ff7a]
+
+Signed-off-by: Sebastian Pipping <sebastian@pipping.org>
+Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
+---
+ Changes             | 17 ++++++++++++++
+ doc/reference.html  | 55 ++++++++++++++++++++++++++++++++++++++++-----
+ lib/expat.h         | 15 +++++++++++++++
+ lib/libexpat.map.in |  5 +++++
+ lib/xmlparse.c      | 33 ++++++++++++++++++++++++++-
+ tests/basic_tests.c | 25 +++++++++++++++++++++
+ 6 files changed, 144 insertions(+), 6 deletions(-)
+
+diff --git a/Changes b/Changes
+index 2b3704a6..1d8227ec 100644
+--- a/Changes
++++ b/Changes
+@@ -29,6 +29,23 @@
+ !! THANK YOU!                        Sebastian Pipping -- Berlin, 2026-03=
-17 !!
+ !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!=
!!!!!!
+=20
++Patches
++        Security fixes:
++       #47 #1183  CVE-2026-41080 -- The existing hash flooding protection
++                    (based on SipHash) only used 4 to 8 bytes of entropy =
for
++                    a salt, when 16 bytes of salt are supported by the
++                    implementation of SipHash used by Expat. Now full 16 =
bytes
++                    of entropy are used to improve protection against has=
h
++                    flooding attacks.
++                      Existing API function XML_SetHashSalt is now deprec=
ated
++                    because of its limitations, and its use should be
++                    considered a vulnerability. Please either use the new=
 API
++                    function XML_SetHashSalt16Bytes (with known-high-qual=
ity
++                    entropy input only!) instead, or leave the derivation=
 of
++                    a 16-bytes hash salt from high quality entropy to Exp=
at's
++                    internal machinery (by *not* calling either of the tw=
o
++                    XML_SetHashSalt* functions).
++
+ Release 2.7.5 Tue March 17 2026
+         Security fixes:
+            #1158  CVE-2026-32776 -- Fix NULL function pointer dereference=
 for
+diff --git a/doc/reference.html b/doc/reference.html
+index 5faa8d65..64b9fd67 100644
+--- a/doc/reference.html
++++ b/doc/reference.html
+@@ -404,7 +404,11 @@
+                 </li>
+=20
+                 <li>
+-                  <a href=3D"#XML_SetHashSalt">XML_SetHashSalt</a>
++                  <a href=3D"#XML_SetHashSalt">XML_SetHashSalt</a> (depre=
cated)
++                </li>
++
++                <li>
++                  <a href=3D"#XML_SetHashSalt16Bytes">XML_SetHashSalt16By=
tes</a>
+                 </li>
+=20
+                 <li>
+@@ -3449,22 +3453,35 @@ XML_SetParamEntityParsing(XML_Parser p,
+       </div>
+=20
+       <h4 id=3D"XML_SetHashSalt">
+-        XML_SetHashSalt
++        XML_SetHashSalt (deprecated)
+       </h4>
+=20
+       <pre class=3D"fcndec">
+ int XMLCALL
+-XML_SetHashSalt(XML_Parser p,
++XML_SetHashSalt(XML_Parser parser,
+                 unsigned long hash_salt);
+ </pre>
+       <div class=3D"fcndef">
+         Sets the hash salt to use for internal hash calculations. Helps i=
n preventing DoS
+         attacks based on predicting hash function behavior. In order to h=
ave an effect
+         this must be called before parsing has started. Returns 1 if succ=
essful, 0 when
+-        called after <code>XML_Parse</code> or <code>XML_ParseBuffer</cod=
e>.
++        called after <code>XML_Parse</code> or <code>XML_ParseBuffer</cod=
e> or when
++        <code>parser</code> is <code>NULL</code>.
++        <p>
++          <b>Note:</b> Function <code>XML_SetHashSalt</code> is
++          <strong>deprecated</strong>. Please use function <code><a href=
=3D
++          "#XML_SetHashSalt16Bytes">XML_SetHashSalt16Bytes</a></code> ins=
tead for better
++          security. <code>XML_SetHashSalt</code> only provides 4 to 8 byt=
es of entropy
++          (depending on the size of type <code>unsigned long</code>) whil=
e the SipHash
++          implementation used by Expat can leverage up to 16 bytes of ent=
ropy =E2=80=94 at least
++          twice as much. Function <code><a href=3D
++          "#XML_SetHashSalt16Bytes">XML_SetHashSalt16Bytes</a></code> of =
Expat &gt;=3D2.7.6
++          (and where backported) matches the amount of entropy supported =
by SipHash.
++        </p>
++
+         <p>
+           <b>Note:</b> This call is optional, as the parser will auto-gen=
erate a new
+-          random salt value if no value has been set at the start of pars=
ing.
++          random salt value internally if no value has been set by the st=
art of parsing.
+         </p>
+=20
+         <p>
+@@ -3475,6 +3492,34 @@ XML_SetHashSalt(XML_Parser p,
+         </p>
+       </div>
+=20
++      <h4 id=3D"XML_SetHashSalt16Bytes">
++        XML_SetHashSalt16Bytes
++      </h4>
++
++      <pre class=3D"fcndec">
++/* Added in Expat 2.7.6. */
++XML_Bool XMLCALL
++XML_SetHashSalt16Bytes(XML_Parser parser,
++                       const uint8_t entropy[16]);
++</pre>
++      <div class=3D"fcndef">
++        Sets the hash salt to use for internal hash calculations. Helps i=
n preventing DoS
++        attacks based on predicting hash function behavior. In order to h=
ave an effect
++        this must be called before parsing has started. Returns <code>XML=
_TRUE</code> if
++        successful, <code>XML_FALSE</code> when called after <code>XML_Pa=
rse</code> or
++        <code>XML_ParseBuffer</code> or when <code>parser</code> is <code=
>NULL</code>.
++        <p>
++          <b>Note:</b> Setting a salt that is <em>not</em> from a source =
of high quality
++          entropy (like <code>getentropy(3)</code>) will make the parser =
vulnerable to
++          hash flooding attacks.
++        </p>
++
++        <p>
++          <b>Note:</b> This call is optional, as the parser will auto-gen=
erate a new
++          random salt value internally if no value has been set by the st=
art of parsing.
++        </p>
++      </div>
++
+       <h4 id=3D"XML_UseForeignDTD">
+         XML_UseForeignDTD
+       </h4>
+diff --git a/lib/expat.h b/lib/expat.h
+index 18dbaebd..7693f62c 100644
+--- a/lib/expat.h
++++ b/lib/expat.h
+@@ -45,6 +45,7 @@
+ #ifndef Expat_INCLUDED
+ #  define Expat_INCLUDED 1
+=20
++#  include <stdint.h> // for uint8_t
+ #  include <stdlib.h>
+ #  include "expat_external.h"
+=20
+@@ -917,10 +918,25 @@ XML_SetParamEntityParsing(XML_Parser parser,
+    function behavior. This must be called before parsing is started.
+    Returns 1 if successful, 0 when called after parsing has started.
+    Note: If parser =3D=3D NULL, the function will do nothing and return 0=
.
++   DEPRECATED since Expat 2.7.6.
+ */
+ XMLPARSEAPI(int)
+ XML_SetHashSalt(XML_Parser parser, unsigned long hash_salt);
+=20
++/* Sets the hash salt to use for internal hash calculations.
++   Helps in preventing DoS attacks based on predicting hash function beha=
vior.
++   This must be called before parsing is started.
++   Returns XML_TRUE if successful, XML_FALSE when called after parsing ha=
s
++   started or when parser is NULL.
++   Added in Expat 2.7.6.
++*/
++XMLPARSEAPI(XML_Bool)
++XML_SetHashSalt16Bytes(XML_Parser parser, const uint8_t entropy[16]);
++
++/* Backport feature macro: signals that XML_SetHashSalt16Bytes is availab=
le
++   even though XML_COMBINED_VERSION < 20800. */
++#  define XML_BACKPORT_SET_HASH_SALT_16_BYTES 1
++
+ /* If XML_Parse or XML_ParseBuffer have returned XML_STATUS_ERROR, then
+    XML_GetErrorCode returns information about the error.
+ */
+diff --git a/lib/libexpat.map.in b/lib/libexpat.map.in
+index 52e59ed3..8527eb54 100644
+--- a/lib/libexpat.map.in
++++ b/lib/libexpat.map.in
+@@ -117,3 +117,8 @@ LIBEXPAT_2.7.2 {
+ @_EXPAT_COMMENT_DTD_OR_GE@ XML_SetAllocTrackerActivationThreshold;
+ @_EXPAT_COMMENT_DTD_OR_GE@ XML_SetAllocTrackerMaximumAmplification;
+ } LIBEXPAT_2.6.0;
++
++LIBEXPAT_2.7.6 {
++ global:
++  XML_SetHashSalt16Bytes;
++} LIBEXPAT_2.7.2;
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 59235c85..09ae4f92 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -2336,6 +2336,7 @@ XML_SetParamEntityParsing(XML_Parser parser,
+ #endif
+ }
+=20
++// DEPRECATED since Expat 2.7.6.
+ int XMLCALL
+ XML_SetHashSalt(XML_Parser parser, unsigned long hash_salt) {
+   if (parser =3D=3D NULL)
+@@ -2351,12 +2352,42 @@ XML_SetHashSalt(XML_Parser parser, unsigned long h=
ash_salt) {
+   rootParser->m_hash_secret_salt_128.k[0] =3D 0;
+   rootParser->m_hash_secret_salt_128.k[1] =3D hash_salt;
+=20
+-  if (hash_salt !=3D 0) // to remain backwards compatible
++  if (hash_salt !=3D 0) { // to remain backwards compatible
+     rootParser->m_hash_secret_salt_set =3D XML_TRUE;
+=20
++    if (sizeof(unsigned long) =3D=3D 4)
++      ENTROPY_DEBUG("explicit(4)", rootParser->m_hash_secret_salt_128);
++    else
++      ENTROPY_DEBUG("explicit(8)", rootParser->m_hash_secret_salt_128);
++  }
++
+   return 1;
+ }
+=20
++XML_Bool XMLCALL
++XML_SetHashSalt16Bytes(XML_Parser parser, const uint8_t entropy[16]) {
++  if (parser =3D=3D NULL)
++    return XML_FALSE;
++
++  if (entropy =3D=3D NULL)
++    return XML_FALSE;
++
++  const XML_Parser rootParser =3D getRootParserOf(parser, NULL);
++  assert(! rootParser->m_parentParser);
++
++  /* block after XML_Parse()/XML_ParseBuffer() has been called */
++  if (parserBusy(rootParser))
++    return XML_FALSE;
++
++  sip_tokey(&(rootParser->m_hash_secret_salt_128), entropy);
++
++  rootParser->m_hash_secret_salt_set =3D XML_TRUE;
++
++  ENTROPY_DEBUG("explicit(16)", rootParser->m_hash_secret_salt_128);
++
++  return XML_TRUE;
++}
++
+ enum XML_Status XMLCALL
+ XML_Parse(XML_Parser parser, const char *s, int len, int isFinal) {
+   if ((parser =3D=3D NULL) || (len < 0) || ((s =3D=3D NULL) && (len !=3D =
0))) {
+diff --git a/tests/basic_tests.c b/tests/basic_tests.c
+index 02d1d5fd..26662fee 100644
+--- a/tests/basic_tests.c
++++ b/tests/basic_tests.c
+@@ -204,6 +204,30 @@ START_TEST(test_hash_collision) {
+ END_TEST
+ #undef COLLIDING_HASH_SALT
+=20
++START_TEST(test_hash_salt_setter) {
++  const uint8_t entropy[16] =3D {'0', '1', '2', '3', '4', '5', '6', '7',
++                               '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};
++  XML_Parser parser =3D XML_ParserCreate(NULL);
++
++  // NULL parser should be rejected
++  assert_true(XML_SetHashSalt16Bytes(NULL, entropy) =3D=3D XML_FALSE);
++
++  // NULL entropy should be rejected
++  assert_true(XML_SetHashSalt16Bytes(parser, NULL) =3D=3D XML_FALSE);
++
++  // Setting should be allowed more than once
++  assert_true(XML_SetHashSalt16Bytes(parser, entropy) =3D=3D XML_TRUE);
++  assert_true(XML_SetHashSalt16Bytes(parser, entropy) =3D=3D XML_TRUE);
++
++  // But not after parsing has started
++  assert_true(XML_Parse(parser, "", 0, XML_FALSE /* isFinal */)
++              =3D=3D XML_STATUS_OK);
++  assert_true(XML_SetHashSalt16Bytes(parser, entropy) =3D=3D XML_FALSE);
++
++  XML_ParserFree(parser);
++}
++END_TEST
++
+ /* Regression test for SF bug #491986. */
+ START_TEST(test_danish_latin1) {
+   const char *text =3D "<?xml version=3D'1.0' encoding=3D'iso-8859-1'?>\n=
"
+@@ -6292,6 +6316,7 @@ make_basic_test_case(Suite *s) {
+   tcase_add_test(tc_basic, test_bom_utf16_le);
+   tcase_add_test(tc_basic, test_nobom_utf16_le);
+   tcase_add_test(tc_basic, test_hash_collision);
++  tcase_add_test(tc_basic, test_hash_salt_setter);
+   tcase_add_test(tc_basic, test_illegal_utf8);
+   tcase_add_test(tc_basic, test_utf8_auto_align);
+   tcase_add_test(tc_basic, test_utf16);
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-41080-3.patch b/meta/re=
cipes-core/expat/expat/CVE-2026-41080-3.patch
new file mode 100644
index 0000000000..69a1c99fcc
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-41080-3.patch
@@ -0,0 +1,32 @@
+From cfc4475518cd38890071b280e8619e74dd9e8722 Mon Sep 17 00:00:00 2001
+From: Christoph Reiter <reiter.christoph@gmail.com>
+Date: Wed, 10 Jun 2026 21:27:51 +0200
+Subject: [PATCH 3/3] cmake|windows: add missing export for new XML_SetHash=
Salt16Bytes
+
+A new XML_SetHashSalt16Bytes symbol was added in #1183, but it
+wasn't added to the def file, so the export is missing when building
+libexpat on Windows with cmake.
+
+Add the new symbol to the .def template.
+
+CVE: CVE-2026-41080
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1270/=
commits/3cdd1df2644388aff25dd0ed7128c7bb1de1a7d8]
+
+Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
+---
+ lib/libexpat.def.cmake | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/libexpat.def.cmake b/lib/libexpat.def.cmake
+index 9b9e22cb..948135a5 100644
+--- a/lib/libexpat.def.cmake
++++ b/lib/libexpat.def.cmake
+@@ -83,3 +83,5 @@ EXPORTS
+ ; added with version 2.7.2
+ @_EXPAT_COMMENT_DTD_OR_GE@ XML_SetAllocTrackerMaximumAmplification @72
+ @_EXPAT_COMMENT_DTD_OR_GE@ XML_SetAllocTrackerActivationThreshold @73
++; added with version 2.7.6
++  XML_SetHashSalt16Bytes @74
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/expat/expat_2.7.5.bb b/meta/recipes-core/exp=
at/expat_2.7.5.bb
index 4f2578292d..1191d9a943 100644
--- a/meta/recipes-core/expat/expat_2.7.5.bb
+++ b/meta/recipes-core/expat/expat_2.7.5.bb
@@ -10,6 +10,9 @@ VERSION_TAG =3D "${@d.getVar('PV').replace('.', '_')}"
=20
 SRC_URI =3D "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.=
bz2  \
            file://run-ptest \
+           file://CVE-2026-41080-1.patch \
+           file://CVE-2026-41080-2.patch \
+           file://CVE-2026-41080-3.patch \
            "
=20
 GITHUB_BASE_URI =3D "https://github.com/libexpat/libexpat/releases/"
--=20
2.34.1


