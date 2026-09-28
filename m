Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2BC9C9833E
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 06:55:40 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.52759.1790578539580679134
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 23:55:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Zd16Qbd1;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=12424; q=dns/txt;
  s=iport01; t=1790578539; x=1791788139;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=oqIa8aBrh6Fm0v4PE8mNC9NnMHckPlVXzDKBa2sMrO0=;
  b=Zd16Qbd1dR9ju7e8j1jYoSERygbsYMottdDb/MJZ+WbRsWhnOYX3KEc1
   4blvXIh0qYqiw+A+5qVsnhBV7GRjopDstQ7sWYLfHQIMnRdanKBWimBcM
   GFah5EwNwafR3DdlWbVwJNhdgxwd2EpdJ60wA5WSdBbN7stVrCUvYET7q
   KTkKrrLjIylwmBw0sj7dE4b1i81GqnOtXwkDjyAAqBOWJHuX0Z+Ezciya
   C4gXYtXhWfHyw2Xob9PZUdS6B62PhzzZS8m5wka0s9cO+1809Ex/hfFJd
   kYJmU2AJHW2jVgsa9X3k4TICfsID9xw4ELllfj/KBsrgTSXDmxTTzvAFx
   w==;
X-CSE-ConnectionGUID: GWc+BKuBSxK6xPcE9VrfXw==
X-CSE-MsgGUID: fPC2xZ9TT3K2zzKGlnhjQA==
X-IPAS-Result: =?us-ascii?q?A0BFAgD9Drpq/4//Ja1aglmCV3VhQkmWSp4dgX4PAQEBD?=
 =?us-ascii?q?0QNBAEBhQWOCwImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGTw2QEgECAQE0ARgBLSwDAQJaIyGDAgGCdAIBEQa/GYIsgQGDKQExBwcCQ?=
 =?us-ascii?q?1DbMgELFAEFgTOFQIgjXRgBg12BHycbG4FygRWDaYEFgVwBAQGIJASCInoSg?=
 =?us-ascii?q?VoeMoEWkVpIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQcbBgWBHYEgg?=
 =?us-ascii?q?hkjGTZ6gQlegSspYAEQF4EHggcCglSCAQIBSUMOB0VTCSVBChJHJiIIEgkBE?=
 =?us-ascii?q?xowC4EhOEEJKAsYDUgRLDcVGQQ+bgeQKh6CRRkHASxhAQcMGCAuSgUmQRApp?=
 =?us-ascii?q?WWhDwoog3aMIpU6GjOpWIEXC5h9jgqVaGiEaYFoPIEoHwsHcBVIAYJZCUoZD?=
 =?us-ascii?q?44tAQsLg2CBf4MUgkHEZSQ1AgEIMgEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:RElmeK3rJmzuCt81oPbD5YVwkn2cJEfYwER7XKvMYLTBsI5bpzwGy
 GRLXWHXPf+JNDehL9snaIy/9U4HvsDSzNVrHAI+3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ej9atANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7g28uYjpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGI349fqc758xMEUIQ5
 cQTBWEzdB6zmLfjqF67YrEEasULNsLnOsYb/3pn1zycVahgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUibC/FMEg9/5JYWnPuoj3r2aRVTqUmeouw85G27IAlZjeK9b4GMI4PVLSlTtkigj
 TjWzTXFPko5bs6N6hWB9HKuv8aayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu1jfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:STWn8qHvghqpIWi0pLqExMeALOsnbusQ8zAXPo5KJiC9Ffbo8v
 xG88576faZslsssRIb6LK90de7IU80nKQdieJ6AV7IZmfbUQWTQL2KxLGSpwEIYxeOldJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3l5xBQYzlvg5QpcYAUdAH0ztE
X-Talos-CUID: 9a23:pKh/S2BZ8HL6MYv6EwZY/w0+Od0PSW3+kmfoKGLpN3xneKLAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3AoVHmJgyk7pd+IA9BftjuTRr4UHmaqKqWIxodo8Q?=
 =?us-ascii?q?6h5Knbz5iGBiZijS1e6Zyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,128,1787011200"; 
   d="scan'208";a="528731177"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 28 Sep 2026 06:55:38 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id 6BE95180000B5;
	Mon, 28 Sep 2026 06:55:38 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id 144CACC1292; Sun, 27 Sep 2026 23:55:38 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH v2] apr-util: Fix CVE-2025-49506
Date: Sun, 27 Sep 2026 23:55:38 -0700
Message-Id: <20260928065538.1123598-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 06:55:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246730

From: Hetvi Thakar <hthakar@cisco.com>

Backport the upstream timing-safe comparison fix [1].
APR-util 1.6.4 identifies this issue as fixed [2].

[1] https://github.com/apache/apr-util/commit/f77a20761cb15686f8d4de5b5eafc534ae24b19e

[2] https://nvd.nist.gov/vuln/detail/CVE-2025-49506

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
Changes in v2:
- Drop the XLC-specific compatibility follow-up patch,
as it is not required by OE-Core's GCC/Clang toolchains.
---
 .../apr/apr-util/CVE-2025-49506.patch         | 310 ++++++++++++++++++
 meta/recipes-support/apr/apr-util_1.6.3.bb    |   6 +
 2 files changed, 316 insertions(+)
 create mode 100644 meta/recipes-support/apr/apr-util/CVE-2025-49506.patch

diff --git a/meta/recipes-support/apr/apr-util/CVE-2025-49506.patch b/meta/recipes-support/apr/apr-util/CVE-2025-49506.patch
new file mode 100644
index 0000000000..0ab5cf0648
--- /dev/null
+++ b/meta/recipes-support/apr/apr-util/CVE-2025-49506.patch
@@ -0,0 +1,310 @@
+From f77a20761cb15686f8d4de5b5eafc534ae24b19e Mon Sep 17 00:00:00 2001
+From: Eric Covener <covener@apache.org>
+Date: Mon, 3 Aug 2026 12:10:13 +0000
+Subject: [PATCH] Merge r1936804 from aprutil 1.7.x:
+
+use timing safe comparison
+
+Submitted By: ylavic
+Reviewed By: ylavic, rpluem, covener
+
+
+
+
+git-svn-id: https://svn.apache.org/repos/asf/apr/apr-util/branches/1.6.x@1936805 13f79535-47bb-0310-9956-ffa450edef68
+
+CVE: CVE-2025-49506
+Upstream-Status: Backport [https://github.com/apache/apr-util/commit/f77a20761cb15686f8d4de5b5eafc534ae24b19e]
+
+(cherry picked from commit f77a20761cb15686f8d4de5b5eafc534ae24b19e)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ crypto/apr_crypto.c |  60 +++++++++++++++++---
+ crypto/apr_passwd.c | 135 ++++++++++++++++++++++++++++++++++++++++----
+ 2 files changed, 176 insertions(+), 19 deletions(-)
+
+diff --git a/crypto/apr_crypto.c b/crypto/apr_crypto.c
+index 9ba190ef..ca3f0887 100644
+--- a/crypto/apr_crypto.c
++++ b/crypto/apr_crypto.c
+@@ -21,6 +21,7 @@
+ #include "apu.h"
+ #include "apr_pools.h"
+ #include "apr_dso.h"
++#include "apr_version.h"
+ #include "apr_strings.h"
+ #include "apr_hash.h"
+ #include "apr_thread_mutex.h"
+@@ -173,19 +174,64 @@ APU_DECLARE(apr_status_t) apr_crypto_memzero(void *buffer, apr_size_t size)
+     return APR_SUCCESS;
+ }
+ 
++/* Borrow this from APR-1.8 if not available */
++#if !APR_VERSION_AT_LEAST(1,8,0)
++
++/* A volatile variable which is always zero but allows to block the compiler
++ * from optimizing or eliding code using it. Volatile forces the compiler to
++ * emit a memory load for which no value can be assumed, so for instance an
++ * add/sub/xor/or with "optblocker" is a noop that will hide the result to
++ * the optimizer.
++ */
++static volatile const apr_uint32_t optblocker;
++
++/* Return whether x is not zero, with no branching controlled by x.
++ *
++ * Taken from the cryptoint library (public domain) by D. J. Bernstein,
++ * which provides timing attacks safe integer operations/primitives.
++ * Code:
++ *   https://lib.mceliece.org/libmceliece-20250507/cryptoint/crypto_uint32.h
++ * Paper:
++ *   https://cr.yp.to/papers/cryptoint-20250424.pdf
++ */
++#if __has_attribute(always_inline)
++__attribute__((always_inline))
++#endif
++static APR_INLINE int test_nonzero_timingsafe(apr_uint32_t x)
++{
++    x |= -x; /* sets the most significant bit unless x == 0 */
++
++    /* shift bit 31 (MSB) to bit 0 */
++    x >>= 32-6;      /* keep 6 bits */
++    x += optblocker; /* lose the optimizer */
++    x >>= 5;         /* keep the (original) MSB only */
++
++    /* x is now 0 or 1 */
++    return x & INT_MAX;
++}
++
++#endif /* !APR_VERSION_AT_LEAST(1,8,0) */
++
+ APU_DECLARE(int) apr_crypto_equals(const void *buf1, const void *buf2,
+                                    apr_size_t size)
+ {
+-    const unsigned char *p1 = buf1;
+-    const unsigned char *p2 = buf2;
+-    unsigned char diff = 0;
+-    apr_size_t i;
++#if APR_VERSION_AT_LEAST(1,8,0)
++    return apr_memeq_timingsafe(buf1, buf2, size);
++#else
++    apr_uint32_t diff = 0;
++    volatile apr_size_t count = size; /* prevent loop unrolling */
++    apr_size_t i = 0;
+ 
+-    for (i = 0; i < size; ++i) {
+-        diff |= p1[i] ^ p2[i];
++    for (; i < count; ++i) {
++        const unsigned char c1 = ((volatile const unsigned char *)buf1)[i];
++        const unsigned char c2 = ((volatile const unsigned char *)buf2)[i];
++
++        diff |= c1 ^ c2; /* sets diff to non-zero whenever c1 != c2 */
+     }
+ 
+-    return 1 & ((diff - 1) >> 8);
++    /* (diff == 0) <=> (diff != 0) ^ 1 */
++    return test_nonzero_timingsafe(diff) ^ 1;
++#endif
+ }
+ 
+ APU_DECLARE(apr_status_t) apr_crypto_get_driver(
+diff --git a/crypto/apr_passwd.c b/crypto/apr_passwd.c
+index c961de2b..74b5fc17 100644
+--- a/crypto/apr_passwd.c
++++ b/crypto/apr_passwd.c
+@@ -14,6 +14,7 @@
+  * limitations under the License.
+  */
+ 
++#include "apr_version.h"
+ #include "apr_strings.h"
+ #include "apr_md5.h"
+ #include "apr_lib.h"
+@@ -39,6 +40,111 @@
+ 
+ static const char * const apr1_id = "$apr1$";
+ 
++#if APR_VERSION_AT_LEAST(1,8,0)
++
++#define streq_timingsafe    apr_streq_timingsafe
++#define strneq_timingsafe   apr_strneq_timingsafe
++
++#else /* borrow code from APR-1.8 if not available */
++
++/* A volatile variable which is always zero but allows to block the compiler
++ * from optimizing or eliding code using it. Volatile forces the compiler to
++ * emit a memory load for which no value can be assumed, so for instance an
++ * add/sub/xor/or with "optblocker" is a noop that will hide the result to
++ * the optimizer.
++ */
++static volatile const apr_uint32_t optblocker;
++
++/* Return whether x is not zero, with no branching controlled by x.
++ *
++ * Taken from the cryptoint library (public domain) by D. J. Bernstein,
++ * which provides timing attacks safe integer operations/primitives.
++ * Code:
++ *   https://lib.mceliece.org/libmceliece-20250507/cryptoint/crypto_uint32.h
++ * Paper:
++ *   https://cr.yp.to/papers/cryptoint-20250424.pdf
++ */
++#if __has_attribute(always_inline)
++__attribute__((always_inline))
++#endif
++static APR_INLINE int test_nonzero_timingsafe(apr_uint32_t x)
++{
++    x |= -x; /* sets the most significant bit unless x == 0 */
++
++    /* shift bit 31 (MSB) to bit 0 */
++    x >>= 32-6;      /* keep 6 bits */
++    x += optblocker; /* lose the optimizer */
++    x >>= 5;         /* keep the (original) MSB only */
++
++    /* x is now 0 or 1 */
++    return x & INT_MAX;
++}
++
++static int streq_timingsafe(const char *sec1, const char *str2)
++{
++    apr_uint32_t diff = 0;
++    apr_size_t i1 = 0, i2 = 0;
++
++    for (;; ++i2) {
++        const unsigned char c1 = ((volatile const unsigned char *)sec1)[i1];
++        const unsigned char c2 = ((volatile const unsigned char *)str2)[i2];
++
++        diff |= c1 ^ c2; /* sets diff to non-zero whenever c1 != c2 */
++
++        /* Not a shortest/longest match because an attacker would usually know
++         * one of the strings and could then determine the length of the other.
++         * So assume only sec1 and its length are secret and stop the loop at
++         * the end of str2. If sec1 is shorter than str2 the loop will continue
++         * by comparing the rest of str2 with the trailing NUL byte of sec1.
++         * In any case since the diff above is computed up to and including a
++         * NUL byte, only the same content and length will raise match.
++         */
++        if (!c2) {
++            break;
++        }
++
++        /* Don't go above sec1's NUL byte */
++        i1 += test_nonzero_timingsafe(c1);
++    }
++
++    /* (diff == 0) <=> (diff != 0) ^ 1 */
++    return test_nonzero_timingsafe(diff) ^ 1;
++}
++
++static int strneq_timingsafe(const char *sec1, const char *str2, apr_size_t n)
++{
++    apr_uint32_t diff = 0;
++    volatile apr_size_t count = n; /* prevent loop unrolling */
++    apr_size_t i1 = 0, i2 = 0;
++
++    for (; i2 < count; ++i2) {
++        const unsigned char c1 = ((volatile const unsigned char *)sec1)[i1];
++        const unsigned char c2 = ((volatile const unsigned char *)str2)[i2];
++
++        diff |= c1 ^ c2; /* sets diff to non-zero whenever c1 != c2 */
++
++        /* Not a shortest/longest match because an attacker would usually know
++         * one of the strings and could then determine the length of the other.
++         * So assume only sec1 and its length are secret and stop the loop at
++         * the end of str2. If sec1 is shorter than str2 the loop will continue
++         * by comparing the rest of str2 with the trailing NUL byte of sec1.
++         * In any case since the diff above is computed up to and including a
++         * NUL byte, only the same content and length will raise match.
++         */
++        if (!c2) {
++            break;
++        }
++
++        /* Don't go above sec1's NUL byte */
++        i1 += test_nonzero_timingsafe(c1);
++    }
++
++    /* (diff == 0) <=> (diff != 0) ^ 1 */
++    return test_nonzero_timingsafe(diff) ^ 1;
++}
++
++#endif /* APR_VERSION_AT_LEAST(1,8,0) */
++
+ #if !defined(WIN32) && !defined(BEOS) && !defined(NETWARE)
+ #if defined(APU_CRYPT_THREADSAFE) || !APR_HAS_THREADS || \
+     defined(CRYPT_R_CRYPTD) || defined(CRYPT_R_STRUCT_CRYPT_DATA)
+@@ -86,28 +192,33 @@ APU_DECLARE(apr_status_t) apr_password_validate(const char *passwd,
+ #if !CRYPT_MISSING
+     char *crypt_pw;
+ #endif
+-    if (hash[0] == '$'
+-        && hash[1] == '2'
+-        && (hash[2] == 'a' || hash[2] == 'y')
+-        && hash[3] == '$') {
++
++    if ((strneq_timingsafe(hash, "$2a$", 4) | /* test both */
++         strneq_timingsafe(hash, "$2y$", 4))) {
++        /*
++         * The hash was created using [apr_]bcrypt encoding.
++         */
+         if (_crypt_blowfish_rn(passwd, hash, sample, sizeof(sample)) == NULL)
+             return APR_FROM_OS_ERROR(errno);
+     }
+-    else if (!strncmp(hash, apr1_id, strlen(apr1_id))) {
++    else if (strneq_timingsafe(hash, apr1_id, strlen(apr1_id))) {
+         /*
+          * The hash was created using our custom algorithm.
+          */
+         apr_md5_encode(passwd, hash, sample, sizeof(sample));
+     }
+-    else if (!strncmp(hash, APR_SHA1PW_ID, APR_SHA1PW_IDLEN)) {
+-         apr_sha1_base64(passwd, (int)strlen(passwd), sample);
++    else if (strneq_timingsafe(hash, APR_SHA1PW_ID, APR_SHA1PW_IDLEN)) {
++        /*
++         * The hash is a (naked) SHA1.
++         */
++        apr_sha1_base64(passwd, (int)strlen(passwd), sample);
+     }
+     else {
+         /*
+          * It's not our algorithm, so feed it to crypt() if possible.
+          */
+ #if CRYPT_MISSING
+-        return (strcmp(passwd, hash) == 0) ? APR_SUCCESS : APR_EMISMATCH;
++        return streq_timingsafe(hash, passwd) ? APR_SUCCESS : APR_EMISMATCH;
+ #elif defined(CRYPT_R_CRYPTD)
+         apr_status_t rv;
+         CRYPTD *buffer = malloc(sizeof(*buffer));
+@@ -118,7 +229,7 @@ APU_DECLARE(apr_status_t) apr_password_validate(const char *passwd,
+         if (!crypt_pw)
+             rv = APR_EMISMATCH;
+         else
+-            rv = (strcmp(crypt_pw, hash) == 0) ? APR_SUCCESS : APR_EMISMATCH;
++            rv = streq_timingsafe(hash, crypt_pw) ? APR_SUCCESS : APR_EMISMATCH;
+         free(buffer);
+         return rv;
+ #elif defined(CRYPT_R_STRUCT_CRYPT_DATA)
+@@ -149,7 +260,7 @@ APU_DECLARE(apr_status_t) apr_password_validate(const char *passwd,
+         if (!crypt_pw)
+             rv = APR_EMISMATCH;
+         else
+-            rv = (strcmp(crypt_pw, hash) == 0) ? APR_SUCCESS : APR_EMISMATCH;
++            rv = streq_timingsafe(hash, crypt_pw) ? APR_SUCCESS : APR_EMISMATCH;
+         free(buffer);
+         return rv;
+ #else
+@@ -173,14 +284,14 @@ APU_DECLARE(apr_status_t) apr_password_validate(const char *passwd,
+                 rv = APR_EMISMATCH;
+             }
+             else {
+-                rv = (strcmp(crypt_pw, hash) == 0) ? APR_SUCCESS : APR_EMISMATCH;
++                rv = streq_timingsafe(hash, crypt_pw) ? APR_SUCCESS : APR_EMISMATCH;
+             }
+             crypt_mutex_unlock();
+             return rv;
+         }
+ #endif
+     }
+-    return (strcmp(sample, hash) == 0) ? APR_SUCCESS : APR_EMISMATCH;
++    return streq_timingsafe(hash, sample) ? APR_SUCCESS : APR_EMISMATCH;
+ }
+ 
+ static const char * const bcrypt_id = "$2y$";
diff --git a/meta/recipes-support/apr/apr-util_1.6.3.bb b/meta/recipes-support/apr/apr-util_1.6.3.bb
index 3a5f52d250..19f8e59ca5 100644
--- a/meta/recipes-support/apr/apr-util_1.6.3.bb
+++ b/meta/recipes-support/apr/apr-util_1.6.3.bb
@@ -13,6 +13,12 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.gz \
            file://configfix.patch \
            file://configure_fixes.patch \
 	   file://0001-test_transformation-Check-if-transform-is-supported-.patch \
+           file://CVE-2025-49506.patch \
+           file://CVE-2026-32327-dependent.patch \
+           file://CVE-2026-32327.patch \
+           file://CVE-2026-34501.patch \
+           file://CVE-2026-34502_p1.patch \
+           file://CVE-2026-34502_p2.patch \
            file://run-ptest \
            "
 
-- 
2.35.6


