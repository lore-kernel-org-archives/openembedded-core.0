Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3B31CD98C5
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 06:36:22 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.123879.1781505374158587164
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 23:36:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=PeN+nvFF;
 spf=pass (domain: est.tech, ip: 40.107.162.21, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m5c9mFMcn4yQH0u+Dt6H0qZ+jcgVYHe2R9lFg3cJVY+TCvgq5HeIdanbZ5WlJkQG6Pa18+TFpNGyKnTsNp7/0MxHTt1/HswBfi7PKBVvCza5i2JAMzXNzJOKIXLoVPr+O/2Im9FWQF8lAIgktvRE3iLWHQgnE8y7Gp+SgM9Yg91iQM1lWeQDJYtYuB3eQcdPsHzbzAGjd/ICYJvEU12FybALnEjGtlFkhQTQOm7/yuaUFjZPaF+GcPsM0Vs0ES4HeDO7+6MeYzQcDAD4pCTkUQmY4+S28Ap+7UxA6viSo1J2G/eCOqs+vvbivzaRRhvRTqnBJ5SSSFHGuUWuRkhXqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u0SO57v/RF6hxJUlbzIW0heYARQW4H2YVU48A++DrlU=;
 b=rjFgEcf0A+nxR5mbFL+pOHWC2Fk5zeQidTJaXQPs+N9kxl+2Pbu2Ex0r3j3wR61Z+Rb+pBtNvtoQaBFMYkZVhS6beq2wEomT2UFIwfMFiE8swDlY3dJ5LJPD/LUGKin8SO5YVj+tI/bXUImgGbrh4B1c7COAuC9IdRw1HsBisgKJA+QkT5kK+pKQdT3yPqS4gGERlGcK5Zfyzf19xyetpU+PAWU8sQG2ibGWe7Ac7F1UHheyzUFQ6bOfQaF1Uj2dbu9NnS2Addw0C0kxpRa2wOt21vCkMoyrSKgYHHYlTYPOia8ozSI4FvtUOzewC7Bf5apjKVbKttOQMGr9mekwvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u0SO57v/RF6hxJUlbzIW0heYARQW4H2YVU48A++DrlU=;
 b=PeN+nvFFLvSiw+2NdNxWEs0zdQplsc53zE9BnEeHgdsBiiI7LNqJgTUhT7bRIG8kdeTZpCEQI9cKztdaZUY+WL+/y7bTVmcQBFwmEcnzkf4XCxTINvBcrYclHka+4hBUf/eEIg1QxkeWdCUFTk+tCC6riSeI55YFplyR5spQKmLmCwADxVKya9RyLT7l3TxSFpvAiEdqpQzidKWsRE6ML3iJs0knw84LXxG3N8GC9qUmGokwXJ91rRB1/1jT5l0M+O+CMvIIr/4Ob32+K0rA9qE4ttPatW00i9RxwUuiDfYQETzQ3xg2XAuyIjmmdinof935+qNvuKQkBcqIP9Yt3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by BESP189MB3284.EURP189.PROD.OUTLOOK.COM (2603:10a6:b10:e7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 06:36:09 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95%4]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 06:36:09 +0000
From: amaury.couderc@est.tech
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/2][OE-core][scarthgap] expat: fix CVE-2026-7210
Date: Mon, 15 Jun 2026 08:35:35 +0200
Message-ID: <20260615063600.25055-1-amaury.couderc@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0255.eurprd04.prod.outlook.com
 (2603:10a6:10:28e::20) To AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6ad::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP189MB3196:EE_|BESP189MB3284:EE_
X-MS-Office365-Filtering-Correlation-Id: 44ddb275-811d-4010-9071-08decaa862b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|18002099003|13003099007|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	vOqYIiDVhuU4Rw8tPWd6zaao3Uop/zyIlEDbpQvfO6HE1rUgqXw/8+M6Bx+Erv3XbOgglOQPJfCxjsPQSFKWFjO454SCQ3cG6ynA0nVxSsLy6iN0nKSIzlx768Os9ZajLrmx5n+8tIJZPrhWD3B4biwvQPKQpvRBfZVzVQsXOHr9W6G1EU9FhJvcVHhkxcMjmWJL9lWcRgfFvX6s0d+lEt+hxFgwC/aJ3+Gs6jVx2igDN5J/zYN/cj3MHzf1Gi/7s1JhaoYfkaCIpmANc4MwdBHZ/gTBZB6Bys6Vp5b5Q8LacEpJXMp3bczTUZ23av1/9YFnfd8ULthUFBLa/XgEliiTuaGeLnL01oI5tsrh8bci4GxvUnMZOjG9/qdCYBddAZUG/bylwVsn3qWFJbd2wOyeagx1oBpjxGWKureRvaq9yj3ZDjD0+YjI+n302XePuesEO4g9221V7AYWIh21AlVqDSiHROffwIc6aHOKw4iJ3yRG1MOGvMUE6uLrihjuIRZzw5l6GkfA0zh/yo0xxvE5rZg/K1pgwW4JnMsjG3iFCZ/ME9TJftKElkbfs6TOiXx/afirw6lNk8c4lmDom+8Qu1UwolsjEg41ZQWw45droy6lyAj4LtIwjiTDMLlej2BxzdBpp1PqqzbRbv3z6Djv2aKxL60gQzs6ZjC2XejPEPaj5ftqxtTS+Sccj8iV
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18002099003)(13003099007)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EeM4ZpRCgPZRf6NMneZ4WRX+dxLExwI7+/DhlOu2E24GiCC2gvqjTg62MOYl?=
 =?us-ascii?Q?XZrv6PBYlVMmP6rNPOuyWJV0GsDHLFMJ8jL3q0fKdmch2/3bGmjaapraSfH3?=
 =?us-ascii?Q?2527SMeHvstkppEY1H30GoNv4c1UhtFHuZ8fkR8s7KF6MKz+vqfSskCs8EcE?=
 =?us-ascii?Q?rwJYIN7IlUcyIER6opueoCp0Cq610n3Y5hDWaUZ1k6Ch11hH49lf0Rt2RdBu?=
 =?us-ascii?Q?/aCO48A9Tk7KhS7xic1LQJc2k1MSussBUoovsAsyNc27u3M3hQEnhCjYXp+M?=
 =?us-ascii?Q?fbmSE6rmb4V1rq8dLI5P5GYqS30aP8tMV//gk0udsEnxkMXhbFQmVB2BOlqj?=
 =?us-ascii?Q?N83uGuFl7mLDD2iLxCzFlxSZ80Deu/1c2T57ZICOxiuDQiB/ohQS40bzJrPJ?=
 =?us-ascii?Q?0XihnEmDE6qBn/C0sotloAx7kbr44ThFlheCUKrQZV3z9s809MMOq5bgARDF?=
 =?us-ascii?Q?JzJb9ZkhhG/HwcGL+yqytpiA9w2RBlMA7CodnoQjH17J7SDk6Iw34n9DFovH?=
 =?us-ascii?Q?2+nJb8hWwFbYZI5jOjvNRIWC5Ufr0JhOwdZ5kO32NgKtjg9lnZ0JY1cMA4Gs?=
 =?us-ascii?Q?jAbHztLScVp7S2+047bU/28+f9sb4cxQDTgklkE77AG2PgHAZtx9GoR5XRyc?=
 =?us-ascii?Q?tPILzEKSQP5ufJWfQfjZTmyD7D5p1AViR2XTlh6hupZP+FCkeyZxdfpRZGsZ?=
 =?us-ascii?Q?8aarFpnQSf3cRlkD/Z/hBQNr0Eq4VsZl56lBayD/UeBEFKyDagmtQ9zESx7w?=
 =?us-ascii?Q?AAbVoIE0+5xLUICODfu959n2vhtCSzk9CZ8MKxMSzvnKrK9DiN2ablArmpyt?=
 =?us-ascii?Q?lglMW2XdFZP2o2gQOaMmijPAEGL1K1k403Gq5ou1HN+CgwVM3HW1LJ5lN8N2?=
 =?us-ascii?Q?HpFSqxQ+m8h3WVDDd1OwYEWjjFxyx3jTxz+s2yZxA6yLohN/ixKhmQz+pFKW?=
 =?us-ascii?Q?8IpuZp9WzCxmkMOidX2h9pE4tiTav6/Cdm2+ItWedGAngM7pq68Z292lTco+?=
 =?us-ascii?Q?smrW3V3oBIe5yKhTgGg382f9wbFIn2KqTR94NSIanGYSEcz4JGbZrCLCCkZA?=
 =?us-ascii?Q?6HyMMM35UTODLaIckd3Qdvn/mKIdBSs0vhpylQSVpY52axU5OrNYMGc1yO+P?=
 =?us-ascii?Q?WGk0LBM+elxVgsuNlYAbGSnPFHKH3NlUNNpdzcaBV0g2I1QkK1bE9t45YtlQ?=
 =?us-ascii?Q?k/mFHBnjyiMZSKC7AdXfEPij+GAnzoc0sDSGUevF8V9XxRAb8xtgceEBP9+l?=
 =?us-ascii?Q?uaT98lf2UD+085Og31VGNRoI0DLALYGbGlVzU8MKnLSAy2p+qTlZTR3ihQ1h?=
 =?us-ascii?Q?erhK+y37o08WzdstFzB55JvaIdrPe7eVeeV6BY2LsDvDviR0xTcqWO0AJo4d?=
 =?us-ascii?Q?9B+0wcT3euUs3FvoK4C6sndtd/xC6uYPZoP59zqZ7WCVHab+INx7teGNornU?=
 =?us-ascii?Q?EAa1UKDq5Mcp2QggNdxETfnwRpX0maelAGXlweSIgexUYQ8k6qcVO/B+ufEH?=
 =?us-ascii?Q?PQLcFHbhg6sNJr7vYK9Mn7BhHsRRG+LeSST2kH6kovRyHrjV5vsWbGtu5D6X?=
 =?us-ascii?Q?2Yz7pSBJRIf1QSLhk0/r/f+07CAq9Q2sZ55eJjoJiiWU9CB1XDGMX9wusTnA?=
 =?us-ascii?Q?AL2E1tzuhgLm2uB6WWlNySYtGWPE97TvKUmAEqLRF1FML1dAaS5n0bYohQXj?=
 =?us-ascii?Q?OlEts+sfNNjwRMsvW+/k6rad4DhMNDTsxT0mXoL+SJv2PhYVdW9p4i1P782M?=
 =?us-ascii?Q?FCma4aM2zRNb9IvJBpeoL/LDAAHDMLA=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 44ddb275-811d-4010-9071-08decaa862b0
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 06:36:09.3411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vUQ9oWtUogJptQ+XH+1ufvhKi+YlYXfrOLuUGxlMQ0iS7cO87jUKibBIpGEF6r9qM0lm8V+6IILxT+zYxBQnRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESP189MB3284
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 06:36:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238814

From: Amaury Couderc <amaury.couderc@est.tech>

Backport patch to fix CVE-2026-7210.
  https://nvd.nist.gov/vuln/detail/CVE-2026-7210

Upstream fixe:
  https://github.com/libexpat/libexpat/commit/1ac23e49a46afe040788c8a538afc=
89e5c4ac8cf

Backport the 128-bit hash salt API (XML_SetHashSalt16Bytes) from Expat
2.8.0. The prior hash randomization used only an unsigned long (4 or 8
bytes depending on architecture) as the SipHash key, leaving k[0] as
zero. This makes the parser vulnerable to hash-flooding DoS attacks
due to insufficient entropy.

This backport:
- Adds struct sipkey m_hash_secret_salt_128 and XML_Bool
  m_hash_secret_salt_set to the parser structure
- Adds XML_SetHashSalt16Bytes() public API function
- Modifies copy_salt_to_sipkey() to use full 128-bit key when set
- Modifies startParsing() to auto-generate 128 bits of entropy
- Adds XML_BACKPORT_SET_HASH_SALT_16_BYTES capability macro for
  downstream consumers (e.g. CPython) to detect this backport
- Adds basic test coverage for the new API


abidiff between the unpatch and unpatched version of expat 2.6.4 :

abidiff abidiff-unpatched/libexpat.so.1.10.0 abidiff-patched/libexpat.so.1.=
10.0

  Functions changes summary: 0 Removed, 1 Changed (65 filtered out), 1 Adde=
d functions
  Variables changes summary: 0 Removed, 0 Changed, 0 Added variable

  1 Added function:

    [A] 'function XML_Bool XML_SetHashSalt16Bytes(XML_Parser, const uint8_t=
*)'    {XML_SetHashSalt16Bytes}

  1 function with some indirect sub-type change:

    [C] 'function void XML_DefaultCurrent(XML_Parser)' at xmlparse.c:2899:1=
 has some indirect sub-type changes:
      parameter 1 of type 'typedef XML_Parser' has sub-type changes:
        underlying type 'XML_ParserStruct*' changed:
          in pointed to type 'struct XML_ParserStruct' at xmlparse.c:665:1:
            type size changed from 8704 to 8896 (in bits)
            2 data member insertions:
              'sipkey m_hash_secret_salt_128', at offset 7808 (in bits) at =
xmlparse.c:781:1
              'XML_Bool m_hash_secret_salt_set', at offset 7936 (in bits) a=
t xmlparse.c:782:1
            4 data member changes (7 filtered):
              'ACCOUNTING m_accounting' offset changed from 7808 to 8000 (i=
n bits) (by +192 bits)
              'MALLOC_TRACKER m_alloc_tracker' offset changed from 8128 to =
8320 (in bits) (by +192 bits)
              'ENTITY_STATS m_entity_stats' offset changed from 8448 to 864=
0 (in bits) (by +192 bits)
              'XML_Bool m_reenter' offset changed from 8640 to 8832 (in bit=
s) (by +192 bits)

This patch does not break ABI compatibility: XML_ParserStruct is
opaque so its internal layout change is invisible to consumers,=20
and XML_SetHashSalt16Bytes is a purely additive API that doesn't
affect existing callers.
meta-binaryaudit (https://github.com/Nordix/meta-binaryaudit/).

Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
---
 .../expat/expat/CVE-2026-7210.patch           | 219 ++++++++++++++++++
 meta/recipes-core/expat/expat_2.6.4.bb        |   1 +
 2 files changed, 220 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-7210.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-7210.patch b/meta/recip=
es-core/expat/expat/CVE-2026-7210.patch
new file mode 100644
index 0000000000..27813a871c
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-7210.patch
@@ -0,0 +1,219 @@
+From d8607abf00cf94316d8c657df1e852087e141538 Mon Sep 17 00:00:00 2001
+From: Amaury Couderc <amaury.couderc@savoirfairelinux.com>
+Date: Wed, 10 Jun 2026 12:44:35 +0000
+Subject: [PATCH] lib: Backport XML_SetHashSalt16Bytes from Expat 2.8.0
+
+Backport the 128-bit hash salt API (XML_SetHashSalt16Bytes) from Expat
+2.8.0. The prior hash randomization used only an unsigned long (4 or 8
+bytes depending on architecture) as the SipHash key, leaving k[0] as
+zero. This makes the parser vulnerable to hash-flooding DoS attacks
+due to insufficient entropy.
+
+This backport:
+- Adds struct sipkey m_hash_secret_salt_128 and XML_Bool
+  m_hash_secret_salt_set to the parser structure
+- Adds XML_SetHashSalt16Bytes() public API function
+- Modifies copy_salt_to_sipkey() to use full 128-bit key when set
+- Modifies startParsing() to auto-generate 128 bits of entropy
+- Adds XML_BACKPORT_SET_HASH_SALT_16_BYTES capability macro for
+  downstream consumers (e.g. CPython) to detect this backport
+- Adds basic test coverage for the new API
+
+CVE: CVE-2026-7210
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/1ac=
23e49a46afe040788c8a538afc89e5c4ac8cf]
+Signed-off-by: Amaury Couderc <amaury.couderc@savoirfairelinux.com>
+---
+ lib/expat.h         | 18 +++++++++++++
+ lib/xmlparse.c      | 65 ++++++++++++++++++++++++++++++++++++++++++---
+ tests/basic_tests.c | 25 +++++++++++++++++
+ 3 files changed, 104 insertions(+), 4 deletions(-)
+
+diff --git a/lib/expat.h b/lib/expat.h
+index df207e9..cdb8e08 100644
+--- a/lib/expat.h
++++ b/lib/expat.h
+@@ -44,9 +44,15 @@
+ #ifndef Expat_INCLUDED
+ #define Expat_INCLUDED 1
+=20
++#include <stdint.h>
+ #include <stdlib.h>
+ #include "expat_external.h"
+=20
++/* Backport capability macro: 128-bit hash salt API is available.
++   Downstream consumers should test for this rather than relying on
++   XML_COMBINED_VERSION >=3D 20800 when linked against a backported libra=
ry. */
++#define XML_BACKPORT_SET_HASH_SALT_16_BYTES 1
++
+ #ifdef __cplusplus
+ extern "C" {
+ #endif
+@@ -920,6 +926,18 @@ XML_SetParamEntityParsing(XML_Parser parser,
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
++   Note: Setting a salt that is not from a source of high quality entropy
++   will make the parser vulnerable to hash flooding attacks.
++   Backported from Expat 2.8.0.
++*/
++XMLPARSEAPI(XML_Bool)
++XML_SetHashSalt16Bytes(XML_Parser parser, const uint8_t entropy[16]);
++
+ /* If XML_Parse or XML_ParseBuffer have returned XML_STATUS_ERROR, then
+    XML_GetErrorCode returns information about the error.
+ */
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 9bc67f3..cc5ec3f 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -778,6 +778,8 @@ struct XML_ParserStruct {
+   enum XML_ParamEntityParsing m_paramEntityParsing;
+ #endif
+   unsigned long m_hash_secret_salt;
++  struct sipkey m_hash_secret_salt_128;
++  XML_Bool m_hash_secret_salt_set;
+ #if XML_GE =3D=3D 1
+   ACCOUNTING m_accounting;
+   MALLOC_TRACKER m_alloc_tracker;
+@@ -1316,8 +1318,28 @@ callProcessor(XML_Parser parser, const char *start,=
 const char *end,
+ static XML_Bool /* only valid for root parser */
+ startParsing(XML_Parser parser) {
+   /* hash functions must be initialized before setContext() is called */
+-  if (parser->m_hash_secret_salt =3D=3D 0)
+-    parser->m_hash_secret_salt =3D generate_hash_secret_salt(parser);
++  if (! parser->m_hash_secret_salt_set) {
++    if (parser->m_hash_secret_salt =3D=3D 0)
++      parser->m_hash_secret_salt =3D generate_hash_secret_salt(parser);
++    /* Generate full 128-bit key for SipHash */
++    unsigned long salt_parts[2];
++    salt_parts[0] =3D generate_hash_secret_salt(parser);
++    salt_parts[1] =3D parser->m_hash_secret_salt;
++    unsigned char entropy_buf[16];
++    memset(entropy_buf, 0, sizeof(entropy_buf));
++    memcpy(entropy_buf, &salt_parts[0], sizeof(salt_parts[0]));
++    memcpy(entropy_buf + sizeof(salt_parts[0]), &salt_parts[1],
++           sizeof(salt_parts[1]));
++    /* On 32-bit, fill remaining 8 bytes with more entropy */
++    if (sizeof(unsigned long) < 8) {
++      unsigned long extra1 =3D generate_hash_secret_salt(parser);
++      unsigned long extra2 =3D generate_hash_secret_salt(parser);
++      memcpy(entropy_buf + 8, &extra1, sizeof(extra1));
++      memcpy(entropy_buf + 12, &extra2, sizeof(extra2));
++    }
++    sip_tokey(&parser->m_hash_secret_salt_128, entropy_buf);
++    parser->m_hash_secret_salt_set =3D XML_TRUE;
++  }
+   if (parser->m_ns) {
+     /* implicit context only set for root parser, since child
+        parsers (i.e. external entity parsers) will inherit it
+@@ -1606,6 +1628,9 @@ parserInit(XML_Parser parser, const XML_Char *encodi=
ngName) {
+   parser->m_paramEntityParsing =3D XML_PARAM_ENTITY_PARSING_NEVER;
+ #endif
+   parser->m_hash_secret_salt =3D 0;
++  memset(&parser->m_hash_secret_salt_128, 0,
++         sizeof(parser->m_hash_secret_salt_128));
++  parser->m_hash_secret_salt_set =3D XML_FALSE;
+=20
+ #if XML_GE =3D=3D 1
+   memset(&parser->m_accounting, 0, sizeof(ACCOUNTING));
+@@ -2330,6 +2355,30 @@ XML_SetHashSalt(XML_Parser parser, unsigned long ha=
sh_salt) {
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
++  /* Walk up to root parser */
++  XML_Parser rootParser =3D parser;
++  while (rootParser->m_parentParser)
++    rootParser =3D rootParser->m_parentParser;
++
++  /* block after XML_Parse()/XML_ParseBuffer() has been called */
++  if (parserBusy(rootParser))
++    return XML_FALSE;
++
++  sip_tokey(&(rootParser->m_hash_secret_salt_128), entropy);
++
++  rootParser->m_hash_secret_salt_set =3D XML_TRUE;
++
++  return XML_TRUE;
++}
++
+ enum XML_Status XMLCALL
+ XML_Parse(XML_Parser parser, const char *s, int len, int isFinal) {
+   if ((parser =3D=3D NULL) || (len < 0) || ((s =3D=3D NULL) && (len !=3D =
0))) {
+@@ -7831,8 +7880,16 @@ keylen(KEY s) {
+=20
+ static void
+ copy_salt_to_sipkey(XML_Parser parser, struct sipkey *key) {
+-  key->k[0] =3D 0;
+-  key->k[1] =3D get_hash_secret_salt(parser);
++  /* Walk up to root parser to access the 128-bit salt */
++  XML_Parser rootParser =3D parser;
++  while (rootParser->m_parentParser)
++    rootParser =3D rootParser->m_parentParser;
++  if (rootParser->m_hash_secret_salt_set) {
++    *key =3D rootParser->m_hash_secret_salt_128;
++  } else {
++    key->k[0] =3D 0;
++    key->k[1] =3D get_hash_secret_salt(parser);
++  }
+ }
+=20
+ static unsigned long FASTCALL
+diff --git a/tests/basic_tests.c b/tests/basic_tests.c
+index 023d9ce..40254e5 100644
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
++  /* NULL parser should be rejected */
++  assert_true(XML_SetHashSalt16Bytes(NULL, entropy) =3D=3D XML_FALSE);
++
++  /* NULL entropy should be rejected */
++  assert_true(XML_SetHashSalt16Bytes(parser, NULL) =3D=3D XML_FALSE);
++
++  /* Setting should be allowed more than once */
++  assert_true(XML_SetHashSalt16Bytes(parser, entropy) =3D=3D XML_TRUE);
++  assert_true(XML_SetHashSalt16Bytes(parser, entropy) =3D=3D XML_TRUE);
++
++  /* But not after parsing has started */
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
+@@ -6244,6 +6268,7 @@ make_basic_test_case(Suite *s) {
+   tcase_add_test(tc_basic, test_bom_utf16_le);
+   tcase_add_test(tc_basic, test_nobom_utf16_le);
+   tcase_add_test(tc_basic, test_hash_collision);
++  tcase_add_test(tc_basic, test_hash_salt_setter);
+   tcase_add_test(tc_basic, test_illegal_utf8);
+   tcase_add_test(tc_basic, test_utf8_auto_align);
+   tcase_add_test(tc_basic, test_utf16);
+--=20
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat_2.6.4.bb b/meta/recipes-core/exp=
at/expat_2.6.4.bb
index 151720a9e3..eda0ff9808 100644
--- a/meta/recipes-core/expat/expat_2.6.4.bb
+++ b/meta/recipes-core/expat/expat_2.6.4.bb
@@ -51,6 +51,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}=
/expat-${PV}.tar.bz2  \
            file://CVE-2026-32777-02.patch \
            file://CVE-2026-32778-01.patch \
            file://CVE-2026-32778-02.patch \
+           file://CVE-2026-7210.patch \
            "
=20
 GITHUB_BASE_URI =3D "https://github.com/libexpat/libexpat/releases/"
--=20
2.34.1


