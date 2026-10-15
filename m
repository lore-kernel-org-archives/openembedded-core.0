Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07E12CC6B34
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 12:27:29 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38408.1792067247112314969
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 05:27:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=htc8SKhT;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=12425; q=dns/txt;
  s=iport01; t=1792067247; x=1793276847;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PK8iuHmNtbeIyhIQgJglbtOk7PE883Lh1cHUKWzjDQk=;
  b=htc8SKhTdlAczjxKLjzU5tHsDKkkRE201wWkbuSJpYEU1p8zlcmtGPRB
   ks3XVACVgqIUBNXS94aeDvzCNOaaMsGzSSgBwGeoSpBPtXnL10CY1QoY6
   jpaZbI3tNkSeUidaAZDB/BqczAaa6VZVu2yrLuW1kFH4Cz+BFN5TOSVeV
   gtkyyDv2N3KosafWLnMiafhIrrMRzdYITMoWf/SDnxMunwr1YxjoaCfWn
   JHMmpe+BisXnemhA546g6BuuukkU9yXj0wrcdSY6iEkHT3ccLqqm0M1vg
   HGAZuvBdpqwA4h8yrDjLFzJe3a15YfRhahwdGFbu4BmtvXE/ZGpfRTVJi
   w==;
X-CSE-ConnectionGUID: AXZAXBLBSmGtblkbQN1UoA==
X-CSE-MsgGUID: WYcicwHcTzO0Q+mCLNndrQ==
X-IPAS-Result: =?us-ascii?q?A0BFAgBfxtBq/5L/Ja1aglmCV3VhQkmWSp4fgX4PAQEBD?=
 =?us-ascii?q?0QNBAEBhQWOFgImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGTw2QEgECAQE0ARgBLSwDAQJaIyGDAgGCdAIBEQa7YIIsgQGDKQExBwcCQ?=
 =?us-ascii?q?1DbMgELFAEFgTOFQIgjXRgBg12BHycbG4FygRWDaYEFgVwBAQGIJASCInoSg?=
 =?us-ascii?q?VoeMoEWk0pIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBHYEgg?=
 =?us-ascii?q?hYjGTZ6gQlegSspYAEQF4EJggcCglSCAAIBSUEOB0VTCSVDEkcmIggSCQETG?=
 =?us-ascii?q?jALgRs4PAkoQRcMcwwdBXIIAg0JDRgNSBEsNxUZBD5uB5F8HoJFGQcBLGEBB?=
 =?us-ascii?q?wwYIC5KBSZBECmlZKEPCiiDdowilToaM6lYgRcLmH2OCpVnaIRpgWg8gSgfC?=
 =?us-ascii?q?wdwFUgBglkJShkPji0BCwuDYIF/gxSCQccGJDUCAQgyAQEHAgcOAwuBaJF+A?=
 =?us-ascii?q?QE?=
IronPort-Data: A9a23:F+QRJ6xo8nbolZO7nx16t+dhxyrEfRIJ4+MujC+fZmUNrF6WrkUFz
 DEWWG6AP6vYN2X9f41xYIu3/EIHscTWn9cwGgdqqlhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHyYuCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWcsaz9MsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJGgGD6Qo0MJdOmRh6
 fYcKzo0SEm+gMvjldpXSsE07igiBNPgMIVavjRryivUSK53B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cPXWjOX9PYH46tOe0hnD8eidwo1OOrq1x6G/WpOB0+OW2bIuKIYLQGq25mG6nl
 2nH9HvZCS0IE4Smij+u1lSqivX2yHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7IQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSj1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:X4HKRKMSmVN8AsBcTu2jsMiBIKoaSvp037Dk7S9MoHtuA6mlfq
 +V/cjzuSWYtN9zYgBDpTn/Asm9qBrnnPYfi7X5Vo3NYOCJggeVxahZnO/fKkXbak7D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb66GGTCv5am85+rJjsaDZ1d0w==
X-Talos-CUID: 9a23:SJ6Q3WFJd/oFAC4FqmJOxHw9KuoBWEbY42vaJ0yyMEAwdbq8HAo=
X-Talos-MUID: =?us-ascii?q?9a23=3APIK0Cgzv/knmFBGn9cCVIdI6apSaqJufA0EGjrU?=
 =?us-ascii?q?Nh9ujbRUzPhy5qjK7WLZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,159,1787011200"; 
   d="scan'208";a="534973627"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Oct 2026 12:27:26 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id E800E1800048E;
	Thu, 15 Oct 2026 12:27:25 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id 8F34ACC1292; Thu, 15 Oct 2026 05:27:25 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][scarthgap][PATCH v3 1/5] apr-util: Fix CVE-2025-49506
Date: Thu, 15 Oct 2026 05:27:17 -0700
Message-Id: <20261015122721.2278428-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 12:27:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247877

From: Hetvi Thakar <hthakar@cisco.com>

Backport the upstream timing-safe comparison fix [1].
APR-util 1.6.4 identifies this issue as fixed [2].

[1] https://github.com/apache/apr-util/commit/f77a20761cb15686f8d4de5b5eafc534ae24b19e

[2] https://nvd.nist.gov/vuln/detail/CVE-2025-49506

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
Changes in v3:
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


