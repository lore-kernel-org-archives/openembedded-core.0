Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAECAC43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 16:22:32 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12698.1783527749225184743
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 09:22:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xtMtAKtS;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-470174001a0so570908f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 09:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783527747; x=1784132547; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WXENXGIwNq7Jf2EkJCVCO9Lj8e3+m/831Q+1VQ9pHpk=;
        b=xtMtAKtSVd0gsONXPA9lqx8ffov5VWl7wiAlfzTK2kEWPTGCU8jMRz0ctApx+c4nqK
         jyjbv0CcX0idgu282dq5zeZpdSqRHY3RqevYDAST1Mx+AOKmM3l2Jp+XmaMmUDY7y2vD
         CsQv0pbyQUuuJ8hUnhul6N5CdMUA4fNQPGXdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783527747; x=1784132547;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WXENXGIwNq7Jf2EkJCVCO9Lj8e3+m/831Q+1VQ9pHpk=;
        b=Q+ipxkGZi323Mcsz2P8+/L28zFsCpqovlbr6O61ZOBePUb+U5ozKzuhM6uF0OWOCpo
         oKDkjrXadVhu27cRxghEyPJkVzUM3lUQwb0LJ3yLrZ14qMsDJSElh7mLnc6ixEbcdX/w
         WOca96E8I/PC9I+zgIAS3U7ZD0+ygnEzmudGRnM2UP6Yyqd1/KNM7BBQE3E4uATr15e5
         yybnpCoLqnU5E9uyNOKWCyC3+lsNdXMHpX+CWHDFivuBeE2z5nUUB7L3gLhFeWhvYsvz
         bR1yfnnbpbrmg7ZVXrQzYFp4fwhR45vuGd/1k5V79IGtA4PDhtJShA97mpyTSQ6Mg13R
         sCAQ==
X-Forwarded-Encrypted: i=1; AHgh+RpGbCxUpbZA9AoPjB/KH09d+fxy4E2p8m1Rg4WmZ9Djh+pRst7ljgQF7APhwxrKK92GeW4pf/mWtF4sELZTqBSaSA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxBRxcPOzhuZPMHjx+1Fu80QVGuC6M1gT4BucaTvKVWgCLZBJz8
	RyM/7sElXqA5hgPIuTi0dd1vaH/xKX/hJCMeX+YunhYx5tG5UNkCddKQtbfObnrULtPfi8YMo+q
	a5NkP95w=
X-Gm-Gg: AfdE7cl0oYGvbq7ZA/X3FdZkBCg7L2gH8bb6Q7RfEicmvt9cdX7DyNTyJ8icMI2dQtv
	CwQIJGLARyGv+vXvnU+XlY2PKQvBhsl7QjjWvz10rJSfZUR//GAz6kt4a2Ul8hgt8y9eSPPuF40
	+4M0LG0xXvNI8ndsqBPhbr8bP5urQ9eo1rRQxFy4FhFH5qJJnCAORBKjc319QCLn7wxawAZdXux
	YocUbBvAcNK0xoMt2/diDleTdBR97g/YSX1YCzgyXiV1WvHsJbUunoLO2rtHPAtrnFbhtOoUVSB
	NofBaM7DDzF9IRZy4NgfuxCAJOZpxI4FPm4Akcvrp/cP4RJsYXqJ/ba1zyJclYW+s81UZcps2Sz
	cZLm7C+vktaadOYzyWDDtKyXIAIhgswcIKewGsxk50p7eL2bLDcX1wFmm5eM0VIQq7Nq2bohYBf
	r+ElqijZKlrdDKpRfnLjrokhZgg1sH7uwRdpHG/paeywj12J1kEa3/FhOZI5gFKBPXo3KKxwnG
X-Received: by 2002:a05:6000:200c:b0:474:6a5b:860b with SMTP id ffacd0b85a97d-47df07f0039mr3342592f8f.37.1783527747080;
        Wed, 08 Jul 2026 09:22:27 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f213e8sm41817848f8f.34.2026.07.08.09.22.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 09:22:25 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Jul 2026 18:22:24 +0200
Message-Id: <DJTBTIVJM80J.1MHCSDMFBGO91@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <amaury.couderc@est.tech>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2][wrynose] expat: fix CVE-2026-41080
X-Mailer: aerc 0.20.0
References: <20260706120430.37403-1-amaury.couderc@est.tech>
In-Reply-To: <20260706120430.37403-1-amaury.couderc@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 16:22:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240499

On Mon Jul 6, 2026 at 2:04 PM CEST, Amaury Couderc via lists.openembedded.o=
rg wrote:
> From: Amaury Couderc <amaury.couderc@est.tech>
>
> The existing hash flooding protection (based on SipHash) only used 4 to 8
> bytes of entropy for a salt, when 16 bytes of salt are supported by the
> implementation of SipHash used by Expat. Now full 16 bytes of entropy are
> used to improve protection against hash flooding attacks.
>
> Introduces new API function XML_SetHashSalt16Bytes and deprecates the
> legacy XML_SetHashSalt which is limited to 4-8 bytes.
>
> The fix is split into 3 patches for reviewability:
>   1. Core entropy changes: migrates hash salt storage to struct sipkey,
>      extracts 16 bytes of entropy, and introduces m_hash_secret_salt_set.
>   2. New API: adds XML_SetHashSalt16Bytes, deprecates XML_SetHashSalt,
>      updates documentation, symbol exports, and tests.
>   3. Windows/cmake: adds the missing .def export for the new symbol.
>
> Backport patch to fix CVE-2026-41080
> https://nvd.nist.gov/vuln/detail/CVE-2026-41080
>
> Upstream fix:
> https://github.com/libexpat/libexpat/pull/1183
>
> CVE: CVE-2026-41080
>
> Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
> ---
>  .../expat/expat/CVE-2026-41080-1.patch        | 251 ++++++++++++++
>  .../expat/expat/CVE-2026-41080-2.patch        | 310 ++++++++++++++++++
>  .../expat/expat/CVE-2026-41080-3.patch        |  32 ++
>  meta/recipes-core/expat/expat_2.7.5.bb        |   3 +
>  4 files changed, 596 insertions(+)
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-41080-1.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-41080-2.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-41080-3.patch
>
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-41080-1.patch b/meta/=
recipes-core/expat/expat/CVE-2026-41080-1.patch
> new file mode 100644
> index 0000000000..d2a957a5e8
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-41080-1.patch
> @@ -0,0 +1,251 @@
> +From 944f825b0119257fee3aed0841e44a6d1c674f80 Mon Sep 17 00:00:00 2001
> +From: Amaury Couderc <amaury.couderc@est.tech>
> +Date: Thu, 2 Jul 2026 09:10:07 +0000
> +Subject: [PATCH 1/3] expat: fix CVE-2026-41080 use 16 bytes of entropy f=
or hash salt
> +
> +The existing hash flooding protection in libexpat (based on SipHash)
> +only used 4 to 8 bytes of entropy for a salt, when 16 bytes are
> +supported by the SipHash implementation. This allows attackers to more
> +feasibly guess the hash salt and craft inputs that cause hash
> +collisions, leading to denial of service.
> +
> +Backport upstream changes that:
> +- Drop unused parameter from generate_hash_secret_salt
> +- Migrate hash salt storage to larger struct sipkey (128-bit)
> +- Drop unneeded void * casts in generate_hash_secret_salt
> +- Extract 16 bytes of entropy for hash flooding protection
> +- Introduce internal flag m_hash_secret_salt_set
> +- Update get_hash_secret_salt to return from the new 128-bit struct
> +
> +Squashed backport of upstream commits 909201a8, bc193afc, 08697a9b,
> +f5eacefb, and fa1ebd60.
Hello,

Please don't squash commits. It makes it harder for me to review and the
Upstream-Status below is not really true...

Look at what Peter did for scarthgap for inspiration:
https://lore.kernel.org/all/20260505205229.2139449-1-peter.marko@siemens.co=
m/

Regards,

> +
> +Based on upstream PR: https://github.com/libexpat/libexpat/pull/1183
> +
> +CVE: CVE-2026-41080
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/118=
3/commits/fa1ebd60bfcc6d32f329803e5e837251e2387ed1]
> +
> +Signed-off-by: Sebastian Pipping <sebastian@pipping.org>
> +Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
> +---
> + lib/internal.h |  2 ++
> + lib/xmlparse.c | 80 +++++++++++++++++++++++++++++++-------------------
> + 2 files changed, 52 insertions(+), 30 deletions(-)
> +
> +diff --git a/lib/internal.h b/lib/internal.h
> +index 61266ebb..1995c17b 100644
> +--- a/lib/internal.h
> ++++ b/lib/internal.h
> +@@ -113,6 +113,7 @@
> + #if defined(_WIN32)                                                    =
        \
> +     && (! defined(__USE_MINGW_ANSI_STDIO)                              =
        \
> +         || (1 - __USE_MINGW_ANSI_STDIO - 1 =3D=3D 0))
> ++#  define EXPAT_FMT_LLX(midpart) "%" midpart "I64x"
> + #  define EXPAT_FMT_ULL(midpart) "%" midpart "I64u"
> + #  if defined(_WIN64) // Note: modifiers "td" and "zu" do not work for =
MinGW
> + #    define EXPAT_FMT_PTRDIFF_T(midpart) "%" midpart "I64d"
> +@@ -122,6 +123,7 @@
> + #    define EXPAT_FMT_SIZE_T(midpart) "%" midpart "u"
> + #  endif
> + #else
> ++#  define EXPAT_FMT_LLX(midpart) "%" midpart "llx"
> + #  define EXPAT_FMT_ULL(midpart) "%" midpart "llu"
> + #  if ! defined(ULONG_MAX)
> + #    error Compiler did not define ULONG_MAX for us
> +diff --git a/lib/xmlparse.c b/lib/xmlparse.c
> +index 0248b665..59235c85 100644
> +--- a/lib/xmlparse.c
> ++++ b/lib/xmlparse.c
> +@@ -604,7 +604,7 @@ static ELEMENT_TYPE *getElementType(XML_Parser parse=
r, const ENCODING *enc,
> +=20
> + static XML_Char *copyString(const XML_Char *s, XML_Parser parser);
> +=20
> +-static unsigned long generate_hash_secret_salt(XML_Parser parser);
> ++static struct sipkey generate_hash_secret_salt(void);
> + static XML_Bool startParsing(XML_Parser parser);
> +=20
> + static XML_Parser parserCreate(const XML_Char *encodingName,
> +@@ -777,7 +777,8 @@ struct XML_ParserStruct {
> +   XML_Bool m_useForeignDTD;
> +   enum XML_ParamEntityParsing m_paramEntityParsing;
> + #endif
> +-  unsigned long m_hash_secret_salt;
> ++  struct sipkey m_hash_secret_salt_128;
> ++  XML_Bool m_hash_secret_salt_set;
> + #if XML_GE =3D=3D 1
> +   ACCOUNTING m_accounting;
> +   MALLOC_TRACKER m_alloc_tracker;
> +@@ -1192,57 +1193,61 @@ gather_time_entropy(void) {
> +=20
> + #endif /* ! defined(HAVE_ARC4RANDOM_BUF) && ! defined(HAVE_ARC4RANDOM) =
*/
> +=20
> +-static unsigned long
> +-ENTROPY_DEBUG(const char *label, unsigned long entropy) {
> ++static struct sipkey
> ++ENTROPY_DEBUG(const char *label, struct sipkey entropy_128) {
> +   if (getDebugLevel("EXPAT_ENTROPY_DEBUG", 0) >=3D 1u) {
> +-    fprintf(stderr, "expat: Entropy: %s --> 0x%0*lx (%lu bytes)\n", lab=
el,
> +-            (int)sizeof(entropy) * 2, entropy, (unsigned long)sizeof(en=
tropy));
> ++    fprintf(stderr,
> ++            "expat: Entropy: %s --> [0x" EXPAT_FMT_LLX(
> ++                "016") ", 0x" EXPAT_FMT_LLX("016") "] (16 bytes)\n",
> ++            label, (unsigned long long)entropy_128.k[0],
> ++            (unsigned long long)entropy_128.k[1]);
> +   }
> +-  return entropy;
> ++  return entropy_128;
> + }
> +=20
> +-static unsigned long
> +-generate_hash_secret_salt(XML_Parser parser) {
> +-  unsigned long entropy;
> +-  (void)parser;
> ++static struct sipkey
> ++generate_hash_secret_salt(void) {
> ++  struct sipkey entropy;
> +=20
> +   /* "Failproof" high quality providers: */
> + #if defined(HAVE_ARC4RANDOM_BUF)
> +   arc4random_buf(&entropy, sizeof(entropy));
> +   return ENTROPY_DEBUG("arc4random_buf", entropy);
> + #elif defined(HAVE_ARC4RANDOM)
> +-  writeRandomBytes_arc4random((void *)&entropy, sizeof(entropy));
> ++  writeRandomBytes_arc4random(&entropy, sizeof(entropy));
> +   return ENTROPY_DEBUG("arc4random", entropy);
> + #else
> +   /* Try high quality providers first .. */
> + #  ifdef _WIN32
> +-  if (writeRandomBytes_rand_s((void *)&entropy, sizeof(entropy))) {
> ++  if (writeRandomBytes_rand_s(&entropy, sizeof(entropy))) {
> +     return ENTROPY_DEBUG("rand_s", entropy);
> +   }
> + #  elif defined(HAVE_GETRANDOM) || defined(HAVE_SYSCALL_GETRANDOM)
> +-  if (writeRandomBytes_getrandom_nonblock((void *)&entropy, sizeof(entr=
opy))) {
> ++  if (writeRandomBytes_getrandom_nonblock(&entropy, sizeof(entropy))) {
> +     return ENTROPY_DEBUG("getrandom", entropy);
> +   }
> + #  endif
> + #  if ! defined(_WIN32) && defined(XML_DEV_URANDOM)
> +-  if (writeRandomBytes_dev_urandom((void *)&entropy, sizeof(entropy))) =
{
> ++  if (writeRandomBytes_dev_urandom(&entropy, sizeof(entropy))) {
> +     return ENTROPY_DEBUG("/dev/urandom", entropy);
> +   }
> + #  endif /* ! defined(_WIN32) && defined(XML_DEV_URANDOM) */
> +   /* .. and self-made low quality for backup: */
> +=20
> +-  entropy =3D gather_time_entropy();
> ++  entropy.k[0] =3D 0;
> ++  entropy.k[1] =3D gather_time_entropy();
> + #  if ! defined(__wasi__)
> +   /* Process ID is 0 bits entropy if attacker has local access */
> +-  entropy ^=3D getpid();
> ++  entropy.k[1] ^=3D getpid();
> + #  endif
> +=20
> +   /* Factors are 2^31-1 and 2^61-1 (Mersenne primes M31 and M61) */
> +   if (sizeof(unsigned long) =3D=3D 4) {
> +-    return ENTROPY_DEBUG("fallback(4)", entropy * 2147483647);
> ++    entropy.k[1] *=3D 2147483647;
> ++    return ENTROPY_DEBUG("fallback(4)", entropy);
> +   } else {
> +-    return ENTROPY_DEBUG("fallback(8)",
> +-                         entropy * (unsigned long)2305843009213693951UL=
L);
> ++    entropy.k[1] *=3D 2305843009213693951ULL;
> ++    return ENTROPY_DEBUG("fallback(8)", entropy);
> +   }
> + #endif
> + }
> +@@ -1252,7 +1257,7 @@ get_hash_secret_salt(XML_Parser parser) {
> +   const XML_Parser rootParser =3D getRootParserOf(parser, NULL);
> +   assert(! rootParser->m_parentParser);
> +=20
> +-  return rootParser->m_hash_secret_salt;
> ++  return rootParser->m_hash_secret_salt_128.k[1];
> + }
> +=20
> + static enum XML_Error
> +@@ -1323,8 +1328,10 @@ callProcessor(XML_Parser parser, const char *star=
t, const char *end,
> + static XML_Bool /* only valid for root parser */
> + startParsing(XML_Parser parser) {
> +   /* hash functions must be initialized before setContext() is called *=
/
> +-  if (parser->m_hash_secret_salt =3D=3D 0)
> +-    parser->m_hash_secret_salt =3D generate_hash_secret_salt(parser);
> ++  if (parser->m_hash_secret_salt_set !=3D XML_TRUE) {
> ++    parser->m_hash_secret_salt_128 =3D generate_hash_secret_salt();
> ++    parser->m_hash_secret_salt_set =3D XML_TRUE;
> ++  }
> +   if (parser->m_ns) {
> +     /* implicit context only set for root parser, since child
> +        parsers (i.e. external entity parsers) will inherit it
> +@@ -1612,7 +1619,9 @@ parserInit(XML_Parser parser, const XML_Char *enco=
dingName) {
> +   parser->m_useForeignDTD =3D XML_FALSE;
> +   parser->m_paramEntityParsing =3D XML_PARAM_ENTITY_PARSING_NEVER;
> + #endif
> +-  parser->m_hash_secret_salt =3D 0;
> ++  parser->m_hash_secret_salt_128.k[0] =3D 0;
> ++  parser->m_hash_secret_salt_128.k[1] =3D 0;
> ++  parser->m_hash_secret_salt_set =3D XML_FALSE;
> +=20
> + #if XML_GE =3D=3D 1
> +   memset(&parser->m_accounting, 0, sizeof(ACCOUNTING));
> +@@ -1779,7 +1788,8 @@ XML_ExternalEntityParserCreate(XML_Parser oldParse=
r, const XML_Char *context,
> +      from hash tables associated with either parser without us having
> +      to worry which hash secrets each table has.
> +   */
> +-  unsigned long oldhash_secret_salt;
> ++  struct sipkey oldhash_secret_salt_128;
> ++  XML_Bool oldhash_secret_salt_set;
> +   XML_Bool oldReparseDeferralEnabled;
> +=20
> +   /* Validate the oldParser parameter before we pull everything out of =
it */
> +@@ -1825,7 +1835,8 @@ XML_ExternalEntityParserCreate(XML_Parser oldParse=
r, const XML_Char *context,
> +      from hash tables associated with either parser without us having
> +      to worry which hash secrets each table has.
> +   */
> +-  oldhash_secret_salt =3D parser->m_hash_secret_salt;
> ++  oldhash_secret_salt_128 =3D parser->m_hash_secret_salt_128;
> ++  oldhash_secret_salt_set =3D parser->m_hash_secret_salt_set;
> +   oldReparseDeferralEnabled =3D parser->m_reparseDeferralEnabled;
> +=20
> + #ifdef XML_DTD
> +@@ -1880,7 +1891,8 @@ XML_ExternalEntityParserCreate(XML_Parser oldParse=
r, const XML_Char *context,
> +     parser->m_externalEntityRefHandlerArg =3D oldExternalEntityRefHandl=
erArg;
> +   parser->m_defaultExpandInternalEntities =3D oldDefaultExpandInternalE=
ntities;
> +   parser->m_ns_triplets =3D oldns_triplets;
> +-  parser->m_hash_secret_salt =3D oldhash_secret_salt;
> ++  parser->m_hash_secret_salt_128 =3D oldhash_secret_salt_128;
> ++  parser->m_hash_secret_salt_set =3D oldhash_secret_salt_set;
> +   parser->m_reparseDeferralEnabled =3D oldReparseDeferralEnabled;
> +   parser->m_parentParser =3D oldParser;
> + #ifdef XML_DTD
> +@@ -2335,7 +2347,13 @@ XML_SetHashSalt(XML_Parser parser, unsigned long =
hash_salt) {
> +   /* block after XML_Parse()/XML_ParseBuffer() has been called */
> +   if (parserBusy(rootParser))
> +     return 0;
> +-  rootParser->m_hash_secret_salt =3D hash_salt;
> ++
> ++  rootParser->m_hash_secret_salt_128.k[0] =3D 0;
> ++  rootParser->m_hash_secret_salt_128.k[1] =3D hash_salt;
> ++
> ++  if (hash_salt !=3D 0) // to remain backwards compatible
> ++    rootParser->m_hash_secret_salt_set =3D XML_TRUE;
> ++
> +   return 1;
> + }
> +=20
> +@@ -7842,8 +7860,10 @@ keylen(KEY s) {
> +=20
> + static void
> + copy_salt_to_sipkey(XML_Parser parser, struct sipkey *key) {
> +-  key->k[0] =3D 0;
> +-  key->k[1] =3D get_hash_secret_salt(parser);
> ++  const XML_Parser rootParser =3D getRootParserOf(parser, NULL);
> ++  assert(! rootParser->m_parentParser);
> ++
> ++  *key =3D rootParser->m_hash_secret_salt_128;
> + }
> +=20
> + static unsigned long FASTCALL
> +--=20
> +2.34.1
> +
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-41080-2.patch b/meta/=
recipes-core/expat/expat/CVE-2026-41080-2.patch
> new file mode 100644
> index 0000000000..a52d61e611
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-41080-2.patch
> @@ -0,0 +1,310 @@
> +From 969472a6d33e994c234ab2ed34f1a01348351b28 Mon Sep 17 00:00:00 2001
> +From: Amaury Couderc <amaury.couderc@est.tech>
> +Date: Thu, 2 Jul 2026 09:23:00 +0000
> +Subject: [PATCH 2/3] expat: add XML_SetHashSalt16Bytes API for CVE-2026-=
41080
> +
> +Add the new XML_SetHashSalt16Bytes API function which accepts a full
> +16 bytes of entropy for the hash salt, matching the capacity of the
> +SipHash implementation used by Expat. The existing XML_SetHashSalt
> +function is marked as deprecated since it only provides 4 to 8 bytes
> +of entropy depending on the size of unsigned long.
> +
> +Changes include:
> +- Add XML_SetHashSalt16Bytes to public API (expat.h)
> +- Add symbol export in libexpat.map.in (LIBEXPAT_2.7.6)
> +- Mark XML_SetHashSalt as deprecated
> +- Document that XML_SetHashSalt needs a non-NULL parser
> +- Include XML_SetHashSalt* with entropy debugging
> +- Add test_hash_salt_setter unit test
> +- Update documentation and Changes file
> +
> +Squashed backport of upstream commits f76124e7, e3349d85, c8c5caf4,
> +592d5fa3, 8ad3ef57, ec9fcd2e, and 8017e11e.
> +
> +CVE: CVE-2026-41080
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/118=
3/commits/4ba09dc471b39a78d77e5179d0243186c0c4ff7a]
> +
> +Signed-off-by: Sebastian Pipping <sebastian@pipping.org>
> +Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
> +---
> + Changes             | 17 ++++++++++++++
> + doc/reference.html  | 55 ++++++++++++++++++++++++++++++++++++++++-----
> + lib/expat.h         | 15 +++++++++++++++
> + lib/libexpat.map.in |  5 +++++
> + lib/xmlparse.c      | 33 ++++++++++++++++++++++++++-
> + tests/basic_tests.c | 25 +++++++++++++++++++++
> + 6 files changed, 144 insertions(+), 6 deletions(-)
> +
> +diff --git a/Changes b/Changes
> +index 2b3704a6..1d8227ec 100644
> +--- a/Changes
> ++++ b/Changes
> +@@ -29,6 +29,23 @@
> + !! THANK YOU!                        Sebastian Pipping -- Berlin, 2026-=
03-17 !!
> + !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!=
!!!!!!!!
> +=20
> ++Patches
> ++        Security fixes:
> ++       #47 #1183  CVE-2026-41080 -- The existing hash flooding protecti=
on
> ++                    (based on SipHash) only used 4 to 8 bytes of entrop=
y for
> ++                    a salt, when 16 bytes of salt are supported by the
> ++                    implementation of SipHash used by Expat. Now full 1=
6 bytes
> ++                    of entropy are used to improve protection against h=
ash
> ++                    flooding attacks.
> ++                      Existing API function XML_SetHashSalt is now depr=
ecated
> ++                    because of its limitations, and its use should be
> ++                    considered a vulnerability. Please either use the n=
ew API
> ++                    function XML_SetHashSalt16Bytes (with known-high-qu=
ality
> ++                    entropy input only!) instead, or leave the derivati=
on of
> ++                    a 16-bytes hash salt from high quality entropy to E=
xpat's
> ++                    internal machinery (by *not* calling either of the =
two
> ++                    XML_SetHashSalt* functions).
> ++
> + Release 2.7.5 Tue March 17 2026
> +         Security fixes:
> +            #1158  CVE-2026-32776 -- Fix NULL function pointer dereferen=
ce for
> +diff --git a/doc/reference.html b/doc/reference.html
> +index 5faa8d65..64b9fd67 100644
> +--- a/doc/reference.html
> ++++ b/doc/reference.html
> +@@ -404,7 +404,11 @@
> +                 </li>
> +=20
> +                 <li>
> +-                  <a href=3D"#XML_SetHashSalt">XML_SetHashSalt</a>
> ++                  <a href=3D"#XML_SetHashSalt">XML_SetHashSalt</a> (dep=
recated)
> ++                </li>
> ++
> ++                <li>
> ++                  <a href=3D"#XML_SetHashSalt16Bytes">XML_SetHashSalt16=
Bytes</a>
> +                 </li>
> +=20
> +                 <li>
> +@@ -3449,22 +3453,35 @@ XML_SetParamEntityParsing(XML_Parser p,
> +       </div>
> +=20
> +       <h4 id=3D"XML_SetHashSalt">
> +-        XML_SetHashSalt
> ++        XML_SetHashSalt (deprecated)
> +       </h4>
> +=20
> +       <pre class=3D"fcndec">
> + int XMLCALL
> +-XML_SetHashSalt(XML_Parser p,
> ++XML_SetHashSalt(XML_Parser parser,
> +                 unsigned long hash_salt);
> + </pre>
> +       <div class=3D"fcndef">
> +         Sets the hash salt to use for internal hash calculations. Helps=
 in preventing DoS
> +         attacks based on predicting hash function behavior. In order to=
 have an effect
> +         this must be called before parsing has started. Returns 1 if su=
ccessful, 0 when
> +-        called after <code>XML_Parse</code> or <code>XML_ParseBuffer</c=
ode>.
> ++        called after <code>XML_Parse</code> or <code>XML_ParseBuffer</c=
ode> or when
> ++        <code>parser</code> is <code>NULL</code>.
> ++        <p>
> ++          <b>Note:</b> Function <code>XML_SetHashSalt</code> is
> ++          <strong>deprecated</strong>. Please use function <code><a hre=
f=3D
> ++          "#XML_SetHashSalt16Bytes">XML_SetHashSalt16Bytes</a></code> i=
nstead for better
> ++          security. <code>XML_SetHashSalt</code> only provides 4 to 8 b=
ytes of entropy
> ++          (depending on the size of type <code>unsigned long</code>) wh=
ile the SipHash
> ++          implementation used by Expat can leverage up to 16 bytes of e=
ntropy =E2=80=94 at least
> ++          twice as much. Function <code><a href=3D
> ++          "#XML_SetHashSalt16Bytes">XML_SetHashSalt16Bytes</a></code> o=
f Expat &gt;=3D2.7.6
> ++          (and where backported) matches the amount of entropy supporte=
d by SipHash.
> ++        </p>
> ++
> +         <p>
> +           <b>Note:</b> This call is optional, as the parser will auto-g=
enerate a new
> +-          random salt value if no value has been set at the start of pa=
rsing.
> ++          random salt value internally if no value has been set by the =
start of parsing.
> +         </p>
> +=20
> +         <p>
> +@@ -3475,6 +3492,34 @@ XML_SetHashSalt(XML_Parser p,
> +         </p>
> +       </div>
> +=20
> ++      <h4 id=3D"XML_SetHashSalt16Bytes">
> ++        XML_SetHashSalt16Bytes
> ++      </h4>
> ++
> ++      <pre class=3D"fcndec">
> ++/* Added in Expat 2.7.6. */
> ++XML_Bool XMLCALL
> ++XML_SetHashSalt16Bytes(XML_Parser parser,
> ++                       const uint8_t entropy[16]);
> ++</pre>
> ++      <div class=3D"fcndef">
> ++        Sets the hash salt to use for internal hash calculations. Helps=
 in preventing DoS
> ++        attacks based on predicting hash function behavior. In order to=
 have an effect
> ++        this must be called before parsing has started. Returns <code>X=
ML_TRUE</code> if
> ++        successful, <code>XML_FALSE</code> when called after <code>XML_=
Parse</code> or
> ++        <code>XML_ParseBuffer</code> or when <code>parser</code> is <co=
de>NULL</code>.
> ++        <p>
> ++          <b>Note:</b> Setting a salt that is <em>not</em> from a sourc=
e of high quality
> ++          entropy (like <code>getentropy(3)</code>) will make the parse=
r vulnerable to
> ++          hash flooding attacks.
> ++        </p>
> ++
> ++        <p>
> ++          <b>Note:</b> This call is optional, as the parser will auto-g=
enerate a new
> ++          random salt value internally if no value has been set by the =
start of parsing.
> ++        </p>
> ++      </div>
> ++
> +       <h4 id=3D"XML_UseForeignDTD">
> +         XML_UseForeignDTD
> +       </h4>
> +diff --git a/lib/expat.h b/lib/expat.h
> +index 18dbaebd..7693f62c 100644
> +--- a/lib/expat.h
> ++++ b/lib/expat.h
> +@@ -45,6 +45,7 @@
> + #ifndef Expat_INCLUDED
> + #  define Expat_INCLUDED 1
> +=20
> ++#  include <stdint.h> // for uint8_t
> + #  include <stdlib.h>
> + #  include "expat_external.h"
> +=20
> +@@ -917,10 +918,25 @@ XML_SetParamEntityParsing(XML_Parser parser,
> +    function behavior. This must be called before parsing is started.
> +    Returns 1 if successful, 0 when called after parsing has started.
> +    Note: If parser =3D=3D NULL, the function will do nothing and return=
 0.
> ++   DEPRECATED since Expat 2.7.6.
> + */
> + XMLPARSEAPI(int)
> + XML_SetHashSalt(XML_Parser parser, unsigned long hash_salt);
> +=20
> ++/* Sets the hash salt to use for internal hash calculations.
> ++   Helps in preventing DoS attacks based on predicting hash function be=
havior.
> ++   This must be called before parsing is started.
> ++   Returns XML_TRUE if successful, XML_FALSE when called after parsing =
has
> ++   started or when parser is NULL.
> ++   Added in Expat 2.7.6.
> ++*/
> ++XMLPARSEAPI(XML_Bool)
> ++XML_SetHashSalt16Bytes(XML_Parser parser, const uint8_t entropy[16]);
> ++
> ++/* Backport feature macro: signals that XML_SetHashSalt16Bytes is avail=
able
> ++   even though XML_COMBINED_VERSION < 20800. */
> ++#  define XML_BACKPORT_SET_HASH_SALT_16_BYTES 1
> ++
> + /* If XML_Parse or XML_ParseBuffer have returned XML_STATUS_ERROR, then
> +    XML_GetErrorCode returns information about the error.
> + */
> +diff --git a/lib/libexpat.map.in b/lib/libexpat.map.in
> +index 52e59ed3..8527eb54 100644
> +--- a/lib/libexpat.map.in
> ++++ b/lib/libexpat.map.in
> +@@ -117,3 +117,8 @@ LIBEXPAT_2.7.2 {
> + @_EXPAT_COMMENT_DTD_OR_GE@ XML_SetAllocTrackerActivationThreshold;
> + @_EXPAT_COMMENT_DTD_OR_GE@ XML_SetAllocTrackerMaximumAmplification;
> + } LIBEXPAT_2.6.0;
> ++
> ++LIBEXPAT_2.7.6 {
> ++ global:
> ++  XML_SetHashSalt16Bytes;
> ++} LIBEXPAT_2.7.2;
> +diff --git a/lib/xmlparse.c b/lib/xmlparse.c
> +index 59235c85..09ae4f92 100644
> +--- a/lib/xmlparse.c
> ++++ b/lib/xmlparse.c
> +@@ -2336,6 +2336,7 @@ XML_SetParamEntityParsing(XML_Parser parser,
> + #endif
> + }
> +=20
> ++// DEPRECATED since Expat 2.7.6.
> + int XMLCALL
> + XML_SetHashSalt(XML_Parser parser, unsigned long hash_salt) {
> +   if (parser =3D=3D NULL)
> +@@ -2351,12 +2352,42 @@ XML_SetHashSalt(XML_Parser parser, unsigned long=
 hash_salt) {
> +   rootParser->m_hash_secret_salt_128.k[0] =3D 0;
> +   rootParser->m_hash_secret_salt_128.k[1] =3D hash_salt;
> +=20
> +-  if (hash_salt !=3D 0) // to remain backwards compatible
> ++  if (hash_salt !=3D 0) { // to remain backwards compatible
> +     rootParser->m_hash_secret_salt_set =3D XML_TRUE;
> +=20
> ++    if (sizeof(unsigned long) =3D=3D 4)
> ++      ENTROPY_DEBUG("explicit(4)", rootParser->m_hash_secret_salt_128);
> ++    else
> ++      ENTROPY_DEBUG("explicit(8)", rootParser->m_hash_secret_salt_128);
> ++  }
> ++
> +   return 1;
> + }
> +=20
> ++XML_Bool XMLCALL
> ++XML_SetHashSalt16Bytes(XML_Parser parser, const uint8_t entropy[16]) {
> ++  if (parser =3D=3D NULL)
> ++    return XML_FALSE;
> ++
> ++  if (entropy =3D=3D NULL)
> ++    return XML_FALSE;
> ++
> ++  const XML_Parser rootParser =3D getRootParserOf(parser, NULL);
> ++  assert(! rootParser->m_parentParser);
> ++
> ++  /* block after XML_Parse()/XML_ParseBuffer() has been called */
> ++  if (parserBusy(rootParser))
> ++    return XML_FALSE;
> ++
> ++  sip_tokey(&(rootParser->m_hash_secret_salt_128), entropy);
> ++
> ++  rootParser->m_hash_secret_salt_set =3D XML_TRUE;
> ++
> ++  ENTROPY_DEBUG("explicit(16)", rootParser->m_hash_secret_salt_128);
> ++
> ++  return XML_TRUE;
> ++}
> ++
> + enum XML_Status XMLCALL
> + XML_Parse(XML_Parser parser, const char *s, int len, int isFinal) {
> +   if ((parser =3D=3D NULL) || (len < 0) || ((s =3D=3D NULL) && (len !=
=3D 0))) {
> +diff --git a/tests/basic_tests.c b/tests/basic_tests.c
> +index 02d1d5fd..26662fee 100644
> +--- a/tests/basic_tests.c
> ++++ b/tests/basic_tests.c
> +@@ -204,6 +204,30 @@ START_TEST(test_hash_collision) {
> + END_TEST
> + #undef COLLIDING_HASH_SALT
> +=20
> ++START_TEST(test_hash_salt_setter) {
> ++  const uint8_t entropy[16] =3D {'0', '1', '2', '3', '4', '5', '6', '7'=
,
> ++                               '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};
> ++  XML_Parser parser =3D XML_ParserCreate(NULL);
> ++
> ++  // NULL parser should be rejected
> ++  assert_true(XML_SetHashSalt16Bytes(NULL, entropy) =3D=3D XML_FALSE);
> ++
> ++  // NULL entropy should be rejected
> ++  assert_true(XML_SetHashSalt16Bytes(parser, NULL) =3D=3D XML_FALSE);
> ++
> ++  // Setting should be allowed more than once
> ++  assert_true(XML_SetHashSalt16Bytes(parser, entropy) =3D=3D XML_TRUE);
> ++  assert_true(XML_SetHashSalt16Bytes(parser, entropy) =3D=3D XML_TRUE);
> ++
> ++  // But not after parsing has started
> ++  assert_true(XML_Parse(parser, "", 0, XML_FALSE /* isFinal */)
> ++              =3D=3D XML_STATUS_OK);
> ++  assert_true(XML_SetHashSalt16Bytes(parser, entropy) =3D=3D XML_FALSE)=
;
> ++
> ++  XML_ParserFree(parser);
> ++}
> ++END_TEST
> ++
> + /* Regression test for SF bug #491986. */
> + START_TEST(test_danish_latin1) {
> +   const char *text =3D "<?xml version=3D'1.0' encoding=3D'iso-8859-1'?>=
\n"
> +@@ -6292,6 +6316,7 @@ make_basic_test_case(Suite *s) {
> +   tcase_add_test(tc_basic, test_bom_utf16_le);
> +   tcase_add_test(tc_basic, test_nobom_utf16_le);
> +   tcase_add_test(tc_basic, test_hash_collision);
> ++  tcase_add_test(tc_basic, test_hash_salt_setter);
> +   tcase_add_test(tc_basic, test_illegal_utf8);
> +   tcase_add_test(tc_basic, test_utf8_auto_align);
> +   tcase_add_test(tc_basic, test_utf16);
> +--=20
> +2.34.1
> +
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-41080-3.patch b/meta/=
recipes-core/expat/expat/CVE-2026-41080-3.patch
> new file mode 100644
> index 0000000000..69a1c99fcc
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-41080-3.patch
> @@ -0,0 +1,32 @@
> +From cfc4475518cd38890071b280e8619e74dd9e8722 Mon Sep 17 00:00:00 2001
> +From: Christoph Reiter <reiter.christoph@gmail.com>
> +Date: Wed, 10 Jun 2026 21:27:51 +0200
> +Subject: [PATCH 3/3] cmake|windows: add missing export for new XML_SetHa=
shSalt16Bytes
> +
> +A new XML_SetHashSalt16Bytes symbol was added in #1183, but it
> +wasn't added to the def file, so the export is missing when building
> +libexpat on Windows with cmake.
> +
> +Add the new symbol to the .def template.
> +
> +CVE: CVE-2026-41080
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/127=
0/commits/3cdd1df2644388aff25dd0ed7128c7bb1de1a7d8]
> +
> +Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
> +---
> + lib/libexpat.def.cmake | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/lib/libexpat.def.cmake b/lib/libexpat.def.cmake
> +index 9b9e22cb..948135a5 100644
> +--- a/lib/libexpat.def.cmake
> ++++ b/lib/libexpat.def.cmake
> +@@ -83,3 +83,5 @@ EXPORTS
> + ; added with version 2.7.2
> + @_EXPAT_COMMENT_DTD_OR_GE@ XML_SetAllocTrackerMaximumAmplification @72
> + @_EXPAT_COMMENT_DTD_OR_GE@ XML_SetAllocTrackerActivationThreshold @73
> ++; added with version 2.7.6
> ++  XML_SetHashSalt16Bytes @74
> +--=20
> +2.34.1
> +
> diff --git a/meta/recipes-core/expat/expat_2.7.5.bb b/meta/recipes-core/e=
xpat/expat_2.7.5.bb
> index 4f2578292d..1191d9a943 100644
> --- a/meta/recipes-core/expat/expat_2.7.5.bb
> +++ b/meta/recipes-core/expat/expat_2.7.5.bb
> @@ -10,6 +10,9 @@ VERSION_TAG =3D "${@d.getVar('PV').replace('.', '_')}"
> =20
>  SRC_URI =3D "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.ta=
r.bz2  \
>             file://run-ptest \
> +           file://CVE-2026-41080-1.patch \
> +           file://CVE-2026-41080-2.patch \
> +           file://CVE-2026-41080-3.patch \
>             "
> =20
>  GITHUB_BASE_URI =3D "https://github.com/libexpat/libexpat/releases/"


--=20
Yoann Congal
Smile ECS


