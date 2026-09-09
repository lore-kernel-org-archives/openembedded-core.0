Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 599E7C79FB7
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 18:43:40 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20142.1788979410564817213
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 11:43:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ejkLGuRK;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4869b6f8629so260954f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 11:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788979409; x=1789584209; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=szhFCiXkO2aMFMpIqoDZBd01g+FNBvjSprFWZ09QwSY=;
        b=ejkLGuRKCh+TvXC6yjfQM8mAN2mhfZD54gCHze9kBYSuW+rHkvUtkQDgvqaTQ91MCF
         gPlO7YoEot+RcMFPcU21+L2ggqMxtb5hBt92xg7G7rkU51PvuPWoGDb/6CvWKACafCbg
         ub/KgPAIdC5kDAD4tiFjwS4KR4Zx4biRDfPlM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788979409; x=1789584209;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=szhFCiXkO2aMFMpIqoDZBd01g+FNBvjSprFWZ09QwSY=;
        b=Bv557ma/VOTDv6ylFHg1niXMCVSlt9h7i5UOkGT7U+NvgUw0pKG3LWhBp02PwcMkPa
         n3MCXPBrbpDOv6lxxM42N6EH0JBPL3bH9uT26jBmopc5CrULifSkkMpYLqyZsmrlZDsL
         5vU4CbgXydGjO7cj22ikdaii31KHGKakvJB1y4/26ELdw+fr4+gpfdlzMmCjsenBzuLc
         Ph44B2xHJILxUn+vo9GPRD47fUj3pX4JBgcgJvS1JW2mvNq3Z5OfCMxA7fRrimxuJFZZ
         eYZ3TfidJI5TXvNrbRHtsNunroImkTD3fUPQmlPA7CXCa8SnQLPq4kscjCplcAJFpYfo
         /K7g==
X-Forwarded-Encrypted: i=1; AKwUvBy4SHUO7uEKS4OGeIaSxgCrcEVVGygVrzbA6T1cLjQZf5SOWoPv1E5pK5+QFAuksu0mReUgB8XN4MOqw5dmvecavQ==@lists.openembedded.org
X-Gm-Message-State: AFuF++nlZ0zlMsOqmJU1qoh7xUcGuNh5/nEddHtSM1IGE0hintTCS4P8
	hBXeZle2zcE2AeHFwTSGI+MvZy0C+S9/y8MCaj4C9q987mb65mcaCfMjuwpuPzy3nqs=
X-Gm-Gg: AYBFou2t3YfmDYZRtN5HXmGbgV+b4dpXrumV12OWvwdfHEMoLp1SN/T+zm/q2gthS32
	7TWGdIyLRdQgxsLWch3TOnnLMQbptjhJDg3DZ3lA/Q7TXOj4K3PjIXuob3WACm4FOuDHt1HBgZR
	+xESqgAtFRH+zG9uC3vBOCccFnqN4V7FZQ8Pm9awRJrC5MzpqDOnjcqeRQ45jPof91fliwqtmap
	8iYDVucp7AIbWMh5YJpSTCuKptpsK3x5kHNp/llou3W1kBj0J9rZl0VbHJbG1KEOAU8G4sqcu1/
	zvNKXcGS+mMxTQqzKR3xAX3uyKVOlt8Dtri/W/+qfKGaJk2RhrFb63ZNeJV3P4MRpD3qevyFgrC
	oujtxewk5a0CRfgfotLh8IqY1/ZSeLE/8uwTt3ImicMTtDX7lObtECFaxZ9mlOtenkQUhvQX0yX
	0K2lR/L0/RqCvvgH8eNf52DcV84DmE6/NgQ1QgjH/annKdqX7SbuUmDruvEor4uZ0HjfZaCLmNQ
	Srm1g+rDVh2tfT8aB/8p+cgAf8WnIci5oDvRlNUYvfuV/O1JL4TPUfvBjaUiXk=
X-Received: by 2002:a5d:64e5:0:b0:485:8c16:a351 with SMTP id ffacd0b85a97d-4858c16a7a7mr40223688f8f.41.1788979408564;
        Wed, 09 Sep 2026 11:43:28 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885b7bfasm45917578f8f.29.2026.09.09.11.43.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 11:43:28 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Sep 2026 20:43:27 +0200
Message-Id: <DLB09U6CYNI4.19B84RYR1UD62@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <xe-linux-external@cisco.com>
To: <hthakar@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH 1/5] apr-util: Fix CVE-2025-49506
X-Mailer: aerc 0.20.0
References: <20260826053627.1798620-1-hthakar@cisco.com>
In-Reply-To: <20260826053627.1798620-1-hthakar@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 18:43:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245486

On Wed Aug 26, 2026 at 7:36 AM CEST, Hetvi Thakar -X (hthakar - E INFOCHIPS=
 PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Hetvi Thakar <hthakar@cisco.com>
>
> Backport the upstream timing-safe comparison fix [1] and its XLC
> compatibility follow-up [2]. APR-util 1.6.4 identifies this issue as
> fixed [3].
>
> [1] https://github.com/apache/apr-util/commit/f77a20761cb15686f8d4de5b5ea=
fc534ae24b19e
> [2] https://github.com/apache/apr-util/commit/e35eee2ea9e1f77bdec26c3bfdb=
5caca457acd66
> [3] https://nvd.nist.gov/vuln/detail/CVE-2025-49506
>
> Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
> ---
>  .../apr/apr-util/CVE-2025-49506_p1.patch      | 310 ++++++++++++++++++
>  .../apr/apr-util/CVE-2025-49506_p2.patch      |  42 +++
>  meta/recipes-support/apr/apr-util_1.6.3.bb    |   2 +
>  3 files changed, 354 insertions(+)
>  create mode 100644 meta/recipes-support/apr/apr-util/CVE-2025-49506_p1.p=
atch
>  create mode 100644 meta/recipes-support/apr/apr-util/CVE-2025-49506_p2.p=
atch
>
> diff --git a/meta/recipes-support/apr/apr-util/CVE-2025-49506_p1.patch b/=
meta/recipes-support/apr/apr-util/CVE-2025-49506_p1.patch
> new file mode 100644
> index 0000000000..0ab5cf0648
> --- /dev/null
> +++ b/meta/recipes-support/apr/apr-util/CVE-2025-49506_p1.patch
> @@ -0,0 +1,310 @@
> +From f77a20761cb15686f8d4de5b5eafc534ae24b19e Mon Sep 17 00:00:00 2001
> +From: Eric Covener <covener@apache.org>
> +Date: Mon, 3 Aug 2026 12:10:13 +0000
> +Subject: [PATCH] Merge r1936804 from aprutil 1.7.x:
> +
> +use timing safe comparison
> +
> +Submitted By: ylavic
> +Reviewed By: ylavic, rpluem, covener
> +
> +
> +
> +
> +git-svn-id: https://svn.apache.org/repos/asf/apr/apr-util/branches/1.6.x=
@1936805 13f79535-47bb-0310-9956-ffa450edef68
> +
> +CVE: CVE-2025-49506
> +Upstream-Status: Backport [https://github.com/apache/apr-util/commit/f77=
a20761cb15686f8d4de5b5eafc534ae24b19e]
> +
> +(cherry picked from commit f77a20761cb15686f8d4de5b5eafc534ae24b19e)
> +Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
> +---
> + crypto/apr_crypto.c |  60 +++++++++++++++++---
> + crypto/apr_passwd.c | 135 ++++++++++++++++++++++++++++++++++++++++----
> + 2 files changed, 176 insertions(+), 19 deletions(-)
> +
> +diff --git a/crypto/apr_crypto.c b/crypto/apr_crypto.c
> +index 9ba190ef..ca3f0887 100644
> +--- a/crypto/apr_crypto.c
> ++++ b/crypto/apr_crypto.c
> +@@ -21,6 +21,7 @@
> + #include "apu.h"
> + #include "apr_pools.h"
> + #include "apr_dso.h"
> ++#include "apr_version.h"
> + #include "apr_strings.h"
> + #include "apr_hash.h"
> + #include "apr_thread_mutex.h"
> +@@ -173,19 +174,64 @@ APU_DECLARE(apr_status_t) apr_crypto_memzero(void =
*buffer, apr_size_t size)
> +     return APR_SUCCESS;
> + }
> +=20
> ++/* Borrow this from APR-1.8 if not available */
> ++#if !APR_VERSION_AT_LEAST(1,8,0)
> ++
> ++/* A volatile variable which is always zero but allows to block the com=
piler
> ++ * from optimizing or eliding code using it. Volatile forces the compil=
er to
> ++ * emit a memory load for which no value can be assumed, so for instanc=
e an
> ++ * add/sub/xor/or with "optblocker" is a noop that will hide the result=
 to
> ++ * the optimizer.
> ++ */
> ++static volatile const apr_uint32_t optblocker;
> ++
> ++/* Return whether x is not zero, with no branching controlled by x.
> ++ *
> ++ * Taken from the cryptoint library (public domain) by D. J. Bernstein,
> ++ * which provides timing attacks safe integer operations/primitives.
> ++ * Code:
> ++ *   https://lib.mceliece.org/libmceliece-20250507/cryptoint/crypto_uin=
t32.h
> ++ * Paper:
> ++ *   https://cr.yp.to/papers/cryptoint-20250424.pdf
> ++ */
> ++#if __has_attribute(always_inline)
> ++__attribute__((always_inline))
> ++#endif
> ++static APR_INLINE int test_nonzero_timingsafe(apr_uint32_t x)
> ++{
> ++    x |=3D -x; /* sets the most significant bit unless x =3D=3D 0 */
> ++
> ++    /* shift bit 31 (MSB) to bit 0 */
> ++    x >>=3D 32-6;      /* keep 6 bits */
> ++    x +=3D optblocker; /* lose the optimizer */
> ++    x >>=3D 5;         /* keep the (original) MSB only */
> ++
> ++    /* x is now 0 or 1 */
> ++    return x & INT_MAX;
> ++}
> ++
> ++#endif /* !APR_VERSION_AT_LEAST(1,8,0) */
> ++
> + APU_DECLARE(int) apr_crypto_equals(const void *buf1, const void *buf2,
> +                                    apr_size_t size)
> + {
> +-    const unsigned char *p1 =3D buf1;
> +-    const unsigned char *p2 =3D buf2;
> +-    unsigned char diff =3D 0;
> +-    apr_size_t i;
> ++#if APR_VERSION_AT_LEAST(1,8,0)
> ++    return apr_memeq_timingsafe(buf1, buf2, size);
> ++#else
> ++    apr_uint32_t diff =3D 0;
> ++    volatile apr_size_t count =3D size; /* prevent loop unrolling */
> ++    apr_size_t i =3D 0;
> +=20
> +-    for (i =3D 0; i < size; ++i) {
> +-        diff |=3D p1[i] ^ p2[i];
> ++    for (; i < count; ++i) {
> ++        const unsigned char c1 =3D ((volatile const unsigned char *)buf=
1)[i];
> ++        const unsigned char c2 =3D ((volatile const unsigned char *)buf=
2)[i];
> ++
> ++        diff |=3D c1 ^ c2; /* sets diff to non-zero whenever c1 !=3D c2=
 */
> +     }
> +=20
> +-    return 1 & ((diff - 1) >> 8);
> ++    /* (diff =3D=3D 0) <=3D> (diff !=3D 0) ^ 1 */
> ++    return test_nonzero_timingsafe(diff) ^ 1;
> ++#endif
> + }
> +=20
> + APU_DECLARE(apr_status_t) apr_crypto_get_driver(
> +diff --git a/crypto/apr_passwd.c b/crypto/apr_passwd.c
> +index c961de2b..74b5fc17 100644
> +--- a/crypto/apr_passwd.c
> ++++ b/crypto/apr_passwd.c
> +@@ -14,6 +14,7 @@
> +  * limitations under the License.
> +  */
> +=20
> ++#include "apr_version.h"
> + #include "apr_strings.h"
> + #include "apr_md5.h"
> + #include "apr_lib.h"
> +@@ -39,6 +40,111 @@
> +=20
> + static const char * const apr1_id =3D "$apr1$";
> +=20
> ++#if APR_VERSION_AT_LEAST(1,8,0)
> ++
> ++#define streq_timingsafe    apr_streq_timingsafe
> ++#define strneq_timingsafe   apr_strneq_timingsafe
> ++
> ++#else /* borrow code from APR-1.8 if not available */
> ++
> ++/* A volatile variable which is always zero but allows to block the com=
piler
> ++ * from optimizing or eliding code using it. Volatile forces the compil=
er to
> ++ * emit a memory load for which no value can be assumed, so for instanc=
e an
> ++ * add/sub/xor/or with "optblocker" is a noop that will hide the result=
 to
> ++ * the optimizer.
> ++ */
> ++static volatile const apr_uint32_t optblocker;
> ++
> ++/* Return whether x is not zero, with no branching controlled by x.
> ++ *
> ++ * Taken from the cryptoint library (public domain) by D. J. Bernstein,
> ++ * which provides timing attacks safe integer operations/primitives.
> ++ * Code:
> ++ *   https://lib.mceliece.org/libmceliece-20250507/cryptoint/crypto_uin=
t32.h
> ++ * Paper:
> ++ *   https://cr.yp.to/papers/cryptoint-20250424.pdf
> ++ */
> ++#if __has_attribute(always_inline)
> ++__attribute__((always_inline))
> ++#endif
> ++static APR_INLINE int test_nonzero_timingsafe(apr_uint32_t x)
> ++{
> ++    x |=3D -x; /* sets the most significant bit unless x =3D=3D 0 */
> ++
> ++    /* shift bit 31 (MSB) to bit 0 */
> ++    x >>=3D 32-6;      /* keep 6 bits */
> ++    x +=3D optblocker; /* lose the optimizer */
> ++    x >>=3D 5;         /* keep the (original) MSB only */
> ++
> ++    /* x is now 0 or 1 */
> ++    return x & INT_MAX;
> ++}
> ++
> ++static int streq_timingsafe(const char *sec1, const char *str2)
> ++{
> ++    apr_uint32_t diff =3D 0;
> ++    apr_size_t i1 =3D 0, i2 =3D 0;
> ++
> ++    for (;; ++i2) {
> ++        const unsigned char c1 =3D ((volatile const unsigned char *)sec=
1)[i1];
> ++        const unsigned char c2 =3D ((volatile const unsigned char *)str=
2)[i2];
> ++
> ++        diff |=3D c1 ^ c2; /* sets diff to non-zero whenever c1 !=3D c2=
 */
> ++
> ++        /* Not a shortest/longest match because an attacker would usual=
ly know
> ++         * one of the strings and could then determine the length of th=
e other.
> ++         * So assume only sec1 and its length are secret and stop the l=
oop at
> ++         * the end of str2. If sec1 is shorter than str2 the loop will =
continue
> ++         * by comparing the rest of str2 with the trailing NUL byte of =
sec1.
> ++         * In any case since the diff above is computed up to and inclu=
ding a
> ++         * NUL byte, only the same content and length will raise match.
> ++         */
> ++        if (!c2) {
> ++            break;
> ++        }
> ++
> ++        /* Don't go above sec1's NUL byte */
> ++        i1 +=3D test_nonzero_timingsafe(c1);
> ++    }
> ++
> ++    /* (diff =3D=3D 0) <=3D> (diff !=3D 0) ^ 1 */
> ++    return test_nonzero_timingsafe(diff) ^ 1;
> ++}
> ++
> ++static int strneq_timingsafe(const char *sec1, const char *str2, apr_si=
ze_t n)
> ++{
> ++    apr_uint32_t diff =3D 0;
> ++    volatile apr_size_t count =3D n; /* prevent loop unrolling */
> ++    apr_size_t i1 =3D 0, i2 =3D 0;
> ++
> ++    for (; i2 < count; ++i2) {
> ++        const unsigned char c1 =3D ((volatile const unsigned char *)sec=
1)[i1];
> ++        const unsigned char c2 =3D ((volatile const unsigned char *)str=
2)[i2];
> ++
> ++        diff |=3D c1 ^ c2; /* sets diff to non-zero whenever c1 !=3D c2=
 */
> ++
> ++        /* Not a shortest/longest match because an attacker would usual=
ly know
> ++         * one of the strings and could then determine the length of th=
e other.
> ++         * So assume only sec1 and its length are secret and stop the l=
oop at
> ++         * the end of str2. If sec1 is shorter than str2 the loop will =
continue
> ++         * by comparing the rest of str2 with the trailing NUL byte of =
sec1.
> ++         * In any case since the diff above is computed up to and inclu=
ding a
> ++         * NUL byte, only the same content and length will raise match.
> ++         */
> ++        if (!c2) {
> ++            break;
> ++        }
> ++
> ++        /* Don't go above sec1's NUL byte */
> ++        i1 +=3D test_nonzero_timingsafe(c1);
> ++    }
> ++
> ++    /* (diff =3D=3D 0) <=3D> (diff !=3D 0) ^ 1 */
> ++    return test_nonzero_timingsafe(diff) ^ 1;
> ++}
> ++
> ++#endif /* APR_VERSION_AT_LEAST(1,8,0) */
> ++
> + #if !defined(WIN32) && !defined(BEOS) && !defined(NETWARE)
> + #if defined(APU_CRYPT_THREADSAFE) || !APR_HAS_THREADS || \
> +     defined(CRYPT_R_CRYPTD) || defined(CRYPT_R_STRUCT_CRYPT_DATA)
> +@@ -86,28 +192,33 @@ APU_DECLARE(apr_status_t) apr_password_validate(con=
st char *passwd,
> + #if !CRYPT_MISSING
> +     char *crypt_pw;
> + #endif
> +-    if (hash[0] =3D=3D '$'
> +-        && hash[1] =3D=3D '2'
> +-        && (hash[2] =3D=3D 'a' || hash[2] =3D=3D 'y')
> +-        && hash[3] =3D=3D '$') {
> ++
> ++    if ((strneq_timingsafe(hash, "$2a$", 4) | /* test both */
> ++         strneq_timingsafe(hash, "$2y$", 4))) {
> ++        /*
> ++         * The hash was created using [apr_]bcrypt encoding.
> ++         */
> +         if (_crypt_blowfish_rn(passwd, hash, sample, sizeof(sample)) =
=3D=3D NULL)
> +             return APR_FROM_OS_ERROR(errno);
> +     }
> +-    else if (!strncmp(hash, apr1_id, strlen(apr1_id))) {
> ++    else if (strneq_timingsafe(hash, apr1_id, strlen(apr1_id))) {
> +         /*
> +          * The hash was created using our custom algorithm.
> +          */
> +         apr_md5_encode(passwd, hash, sample, sizeof(sample));
> +     }
> +-    else if (!strncmp(hash, APR_SHA1PW_ID, APR_SHA1PW_IDLEN)) {
> +-         apr_sha1_base64(passwd, (int)strlen(passwd), sample);
> ++    else if (strneq_timingsafe(hash, APR_SHA1PW_ID, APR_SHA1PW_IDLEN)) =
{
> ++        /*
> ++         * The hash is a (naked) SHA1.
> ++         */
> ++        apr_sha1_base64(passwd, (int)strlen(passwd), sample);
> +     }
> +     else {
> +         /*
> +          * It's not our algorithm, so feed it to crypt() if possible.
> +          */
> + #if CRYPT_MISSING
> +-        return (strcmp(passwd, hash) =3D=3D 0) ? APR_SUCCESS : APR_EMIS=
MATCH;
> ++        return streq_timingsafe(hash, passwd) ? APR_SUCCESS : APR_EMISM=
ATCH;
> + #elif defined(CRYPT_R_CRYPTD)
> +         apr_status_t rv;
> +         CRYPTD *buffer =3D malloc(sizeof(*buffer));
> +@@ -118,7 +229,7 @@ APU_DECLARE(apr_status_t) apr_password_validate(cons=
t char *passwd,
> +         if (!crypt_pw)
> +             rv =3D APR_EMISMATCH;
> +         else
> +-            rv =3D (strcmp(crypt_pw, hash) =3D=3D 0) ? APR_SUCCESS : AP=
R_EMISMATCH;
> ++            rv =3D streq_timingsafe(hash, crypt_pw) ? APR_SUCCESS : APR=
_EMISMATCH;
> +         free(buffer);
> +         return rv;
> + #elif defined(CRYPT_R_STRUCT_CRYPT_DATA)
> +@@ -149,7 +260,7 @@ APU_DECLARE(apr_status_t) apr_password_validate(cons=
t char *passwd,
> +         if (!crypt_pw)
> +             rv =3D APR_EMISMATCH;
> +         else
> +-            rv =3D (strcmp(crypt_pw, hash) =3D=3D 0) ? APR_SUCCESS : AP=
R_EMISMATCH;
> ++            rv =3D streq_timingsafe(hash, crypt_pw) ? APR_SUCCESS : APR=
_EMISMATCH;
> +         free(buffer);
> +         return rv;
> + #else
> +@@ -173,14 +284,14 @@ APU_DECLARE(apr_status_t) apr_password_validate(co=
nst char *passwd,
> +                 rv =3D APR_EMISMATCH;
> +             }
> +             else {
> +-                rv =3D (strcmp(crypt_pw, hash) =3D=3D 0) ? APR_SUCCESS =
: APR_EMISMATCH;
> ++                rv =3D streq_timingsafe(hash, crypt_pw) ? APR_SUCCESS :=
 APR_EMISMATCH;
> +             }
> +             crypt_mutex_unlock();
> +             return rv;
> +         }
> + #endif
> +     }
> +-    return (strcmp(sample, hash) =3D=3D 0) ? APR_SUCCESS : APR_EMISMATC=
H;
> ++    return streq_timingsafe(hash, sample) ? APR_SUCCESS : APR_EMISMATCH=
;
> + }
> +=20
> + static const char * const bcrypt_id =3D "$2y$";
> diff --git a/meta/recipes-support/apr/apr-util/CVE-2025-49506_p2.patch b/=
meta/recipes-support/apr/apr-util/CVE-2025-49506_p2.patch
> new file mode 100644
> index 0000000000..b2acaf52d4
> --- /dev/null
> +++ b/meta/recipes-support/apr/apr-util/CVE-2025-49506_p2.patch
> @@ -0,0 +1,42 @@
> +From e35eee2ea9e1f77bdec26c3bfdb5caca457acd66 Mon Sep 17 00:00:00 2001
> +From: Eric Covener <covener@apache.org>
> +Date: Mon, 3 Aug 2026 13:45:25 +0000
> +Subject: [PATCH] Merge r1936827 from aprutil 1.7.x:
> +
> +hide __has_attribute on traditional xlc platforms
> +
> +The backport of 1917748 omitted this in apr.h on purpose,
> +but this is a new/narrow usage and not in a header
> +where it would taint anyones use of __has_attribute.
> +
> +
> +
> +
> +git-svn-id: https://svn.apache.org/repos/asf/apr/apr-util/branches/1.6.x=
@1936828 13f79535-47bb-0310-9956-ffa450edef68
> +
> +CVE: CVE-2025-49506
> +Upstream-Status: Backport [https://github.com/apache/apr-util/commit/e35=
eee2ea9e1f77bdec26c3bfdb5caca457acd66]
> +
> +(cherry picked from commit e35eee2ea9e1f77bdec26c3bfdb5caca457acd66)
> +Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
> +---
> + crypto/apr_passwd.c | 6 ++++++
> + 1 file changed, 6 insertions(+)
> +
> +diff --git a/crypto/apr_passwd.c b/crypto/apr_passwd.c
> +index 74b5fc17..9231d312 100644
> +--- a/crypto/apr_passwd.c
> ++++ b/crypto/apr_passwd.c
> +@@ -64,6 +64,12 @@ static volatile const apr_uint32_t optblocker;
> +  * Paper:
> +  *   https://cr.yp.to/papers/cryptoint-20250424.pdf
> +  */
> ++#if (defined(__xlc__) && !defined(__GNUC__))
> ++#ifndef __has_attribute
> ++#define __has_attribute(__x)    0
> ++#endif
> ++#endif

Hello,

What is "xlc"?  Does this case happens for Yocto/OE-Core users?
I do not want to carry code that can't be reached.

Regards,
--=20
Yoann Congal
Smile ECS


