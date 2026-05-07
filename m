Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12AB5CD37AA
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 22:36:02 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1278.1778193353601795367
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 15:35:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=cEx3erpn;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so20298145e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 15:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778193352; x=1778798152; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WAgLAjNWxw8mQyKAO1BS6Xvb08Z0rFGoZ98k66bstu0=;
        b=cEx3erpnns4r8RyYCGuu9wpmy9W7+3/2PCcuIynyX3rdwAB9/JY2xrwFmhXL+thoJa
         3+DNRRBKRPdsEJgbT+8QqX1Fcn9/+/VqAakH1Q6m+wTzjPUGggEiJ5XW96R4kqbNV7KP
         rxokd33eZwxfLQnR4yYb1Qjom9q2TCyN+zAvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778193352; x=1778798152;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WAgLAjNWxw8mQyKAO1BS6Xvb08Z0rFGoZ98k66bstu0=;
        b=Em/0htw2hfQK4XAhiFNpzrREfBi94PoSWuRm/an7/TwBQRzObeX/7LISwap/FhV64D
         kFBWH657Y9xR344aWcqZyoIeU1rOZ0Z9nok8tpqT1mFFPz8uWDwunq0qd1yEyztwWVyW
         wrIprvCkrEG7/g5iHLpTpafhsaxyz1CAJ3HAbA2zxHBznnc3Dqb9aEsf/Z+OR2BQCo6O
         NwchQDSMCSnOpjy5jx6JJvaz39mJRu9tb592/9Yibm/k8K9A5iVhXsLZhe5gQeSm1wW/
         76gVK5vzke6HdPSaG5dA2bnEna3cZ6jYjcU6zjR9W2vaNUDdWUYHkMdytMrdaOj9BlnY
         hb8g==
X-Forwarded-Encrypted: i=1; AFNElJ84ugLucLoV4e811sBsYRXMiJONGX30ILFBLr5xkwcckSO11s5HzDIZU4uFjfq8e1Beuxr81xvw3Zo8ZvVWvatUVw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwNf7vrmYTRQGp6HqDzy3nHLOXjc75Lg9TFPuXUhU+Cv8xBL8g3
	jv3NwuB9VA9EdwYZ9MelJ39bTj3TS5/U9mhTkl29wwprm3ye3ZvWGVf1SypDbxQoRT8=
X-Gm-Gg: AeBDies3QQmJxyi+Z0/USBu+soy0mrcvsCO/ot/y/bGHIn/9PsZcFMPwHurW1C6nWBY
	2w26+85G8qEFZBRBt3qt1NEP5BRNFqnnXZyNl+SleLjO1+KDisaIdJuDPfJqtW1H7WiJVaW1f8l
	sg6WvKx3271yXs8ds6etcGVVNAq/mBO3Jj22q+h5n7Nuu/PTpVrkl6fcHwq+z3wUI7GwISIBP6F
	/WC6Vkv2siblu4G3ABa/bdbrYcW0UaZsHAhkS80d0uHTnBM4Q75CcFanFSZlLOhMppqu/eePsNA
	vCB3nMht4fsSLt+GNrl5y7teToJw/wt4Vw1yp+IWLjBLrgnExwEHBxpPNDlluodThyfBoNBrMFz
	zHPtwT59+hrTCbEeFBQm9cydy0ZgWeTKgKVrx3rzw6yJQhF6arZhbb+pxo08LoJJncby+1mQn8g
	jmU4LayBtuRLgZsa+nUGSCMm5M/y6jmNusRXRKTLloSyfjXi28eOiSN5iiqAxxcIc96CUF61SE8
	PFs9NC4WoVS4Co=
X-Received: by 2002:a05:600c:12d4:b0:488:9439:881a with SMTP id 5b1f17b1804b1-48e51e0bba9mr97802965e9.2.1778193351342;
        Thu, 07 May 2026 15:35:51 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45412de445csm1962166f8f.14.2026.05.07.15.35.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 15:35:50 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 08 May 2026 00:35:50 +0200
Message-Id: <DICSXNQ2NP29.1E7XEREU8QKR7@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] expat: patch CVE-2026-41080
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <peter.marko@siemens.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260505205229.2139449-1-peter.marko@siemens.com>
In-Reply-To: <20260505205229.2139449-1-peter.marko@siemens.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 22:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236625

On Tue May 5, 2026 at 10:52 PM CEST, Peter Marko via lists.openembedded.org=
 wrote:
> From: Peter Marko <peter.marko@siemens.com>
>
> Pick github PR [1] mentioned in [2].
> * 969af8f4654ce50d837bb9199a73d1d02d2c7e16..4ba09dc471b39a78d77e5179d0243=
186c0c4ff7a
> * dropped code which doesn't exist in 2.6.4 yet (github actions, map
>   file)
> * resolved minor conflicts (formatting)
> * picked 2 additional commits to apply the code cleanly
>
> [1] https://github.com/libexpat/libexpat/pull/1183
> [2] https://security-tracker.debian.org/tracker/CVE-2026-41080
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  .../expat/expat/CVE-2026-41080-01.patch       |  50 ++
>  .../expat/expat/CVE-2026-41080-02.patch       |  29 ++
>  .../expat/expat/CVE-2026-41080-03.patch       | 467 ++++++++++++++++++
>  meta/recipes-core/expat/expat_2.6.4.bb        |   3 +
>  4 files changed, 549 insertions(+)
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-41080-01.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-41080-02.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-41080-03.patch
>
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-41080-01.patch b/meta=
/recipes-core/expat/expat/CVE-2026-41080-01.patch
> new file mode 100644
> index 00000000000..0c6af75a5de
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-41080-01.patch
> @@ -0,0 +1,50 @@
> +From fe04a7f0ff8afe57ba33d919f368b1ba23bcda92 Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Sun, 30 Mar 2025 19:26:55 +0200
> +Subject: [PATCH 1/3] lib/xmlparse.c: Address clang-tidy warning
> + misc-no-recursion
> +
> +CVE: CVE-2026-41080
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/f=
e04a7f0ff8afe57ba33d919f368b1ba23bcda92]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + lib/xmlparse.c | 17 ++++++++++-------
> + 1 file changed, 10 insertions(+), 7 deletions(-)
> +
> +diff --git a/lib/xmlparse.c b/lib/xmlparse.c
> +index 9bc67f38..cb25c37b 100644
> +--- a/lib/xmlparse.c
> ++++ b/lib/xmlparse.c
> +@@ -1243,9 +1243,10 @@ generate_hash_secret_salt(XML_Parser parser) {
> +=20
> + static unsigned long
> + get_hash_secret_salt(XML_Parser parser) {
> +-  if (parser->m_parentParser !=3D NULL)
> +-    return get_hash_secret_salt(parser->m_parentParser);
> +-  return parser->m_hash_secret_salt;
> ++  const XML_Parser rootParser =3D getRootParserOf(parser, NULL);
> ++  assert(! rootParser->m_parentParser);
> ++
> ++  return rootParser->m_hash_secret_salt;
> + }
> +=20
> + static enum XML_Error
> +@@ -2321,12 +2322,14 @@ int XMLCALL
> + XML_SetHashSalt(XML_Parser parser, unsigned long hash_salt) {
> +   if (parser =3D=3D NULL)
> +     return 0;
> +-  if (parser->m_parentParser)
> +-    return XML_SetHashSalt(parser->m_parentParser, hash_salt);
> ++
> ++  const XML_Parser rootParser =3D getRootParserOf(parser, NULL);
> ++  assert(! rootParser->m_parentParser);
> ++
> +   /* block after XML_Parse()/XML_ParseBuffer() has been called */
> +-  if (parserBusy(parser))
> ++  if (parserBusy(rootParser))
> +     return 0;
> +-  parser->m_hash_secret_salt =3D hash_salt;
> ++  rootParser->m_hash_secret_salt =3D hash_salt;
> +   return 1;
> + }
> +=20
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-41080-02.patch b/meta=
/recipes-core/expat/expat/CVE-2026-41080-02.patch
> new file mode 100644
> index 00000000000..953f93c68a9
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-41080-02.patch
> @@ -0,0 +1,29 @@
> +From 7fb2c7a454edc9e2880073a27f899c31d9b078ce Mon Sep 17 00:00:00 2001
> +From: Atrem Borovik <polzovatellllk@gmail.com>
> +Date: Sat, 20 Dec 2025 13:22:16 +0300
> +Subject: [PATCH 2/3] WASI: remove getpid
> +
> +CVE: CVE-2026-41080
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/7=
fb2c7a454edc9e2880073a27f899c31d9b078ce]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + lib/xmlparse.c | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/lib/xmlparse.c b/lib/xmlparse.c
> +index cb25c37b..1bafb948 100644
> +--- a/lib/xmlparse.c
> ++++ b/lib/xmlparse.c
> +@@ -1228,8 +1228,11 @@ generate_hash_secret_salt(XML_Parser parser) {
> + #  endif /* ! defined(_WIN32) && defined(XML_DEV_URANDOM) */
> +   /* .. and self-made low quality for backup: */
> +=20
> ++  entropy =3D gather_time_entropy();
> ++#  if ! defined(__wasi__)
> +   /* Process ID is 0 bits entropy if attacker has local access */
> +-  entropy =3D gather_time_entropy() ^ getpid();
> ++  entropy ^=3D getpid();
> ++#  endif
> +=20
> +   /* Factors are 2^31-1 and 2^61-1 (Mersenne primes M31 and M61) */
> +   if (sizeof(unsigned long) =3D=3D 4) {
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-41080-03.patch b/meta=
/recipes-core/expat/expat/CVE-2026-41080-03.patch
> new file mode 100644
> index 00000000000..4d17f1a0b0e
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-41080-03.patch
> @@ -0,0 +1,467 @@
> +From b77ab600e1893fdcfc3868d0a46efcc87c87943d Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Wed, 8 Apr 2026 15:41:54 +0200
> +Subject: [PATCH 3/3] [CVE-2026-41080] Improve protection against hash fl=
ooding
> + (fixes #47)
> +
> +Fixes #47
> +
> +CVE: CVE-2026-41080
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/118=
3]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + Changes             |  16 ++++++
> + doc/reference.html  |  51 ++++++++++++++--
> + lib/expat.h         |  12 ++++
> + lib/internal.h      |   2 +
> + lib/xmlparse.c      | 118 ++++++++++++++++++++++++++------------
> + tests/basic_tests.c |  25 ++++++++
> + 6 files changed, 181 insertions(+), 43 deletions(-)
> +
> +diff --git a/Changes b/Changes
> +index 4265d608..1d87d6a0 100644
> +--- a/Changes
> ++++ b/Changes
> +@@ -30,6 +30,22 @@
> + !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!=
!!!!!!!!
> +=20
> + Patches:
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

Hello Peter,

I don't know if we can consider CVE-2026-41080 "fixed" with this. A code
calling the existing XML_SetHashSalt function will keep be vulnerable
even with this patch...

Maybe we can apply this but leave the CVE applicable to let downstream
users review their expat calls?

This might be one of the rare case to use
CVE_STATUS[CVE-2026-41080] =3D "vulnerable-investigating: ..."
to grab attention of users?

Thanks!

> +         Security fixes:
> +      #1018 #1034  CVE-2025-59375 -- Disallow use of disproportional amo=
unts of
> +                     dynamic memory from within an Expat parser (e.g. pr=
eviously
> +diff --git a/doc/reference.html b/doc/reference.html
> +index 8f14b011..7f374f84 100644
> +--- a/doc/reference.html
> ++++ b/doc/reference.html
> +@@ -174,7 +174,8 @@ interface.</p>
> +       <li><a href=3D"#XML_GetAttributeInfo">XML_GetAttributeInfo</a></l=
i>
> +       <li><a href=3D"#XML_SetEncoding">XML_SetEncoding</a></li>
> +       <li><a href=3D"#XML_SetParamEntityParsing">XML_SetParamEntityPars=
ing</a></li>
> +-      <li><a href=3D"#XML_SetHashSalt">XML_SetHashSalt</a></li>
> ++      <li><a href=3D"#XML_SetHashSalt">XML_SetHashSalt</a> (deprecated)=
</li>
> ++      <li><a href=3D"#XML_SetHashSalt16Bytes">XML_SetHashSalt16Bytes</a=
></li>
> +       <li><a href=3D"#XML_UseForeignDTD">XML_UseForeignDTD</a></li>
> +       <li><a href=3D"#XML_SetReturnNSTriplet">XML_SetReturnNSTriplet</a=
></li>
> +       <li><a href=3D"#XML_DefaultCurrent">XML_DefaultCurrent</a></li>
> +@@ -2553,10 +2554,10 @@ The choices for <code>code</code> are:
> + no effect and will always return 0.
> + </div>
> +=20
> +-<h4 id=3D"XML_SetHashSalt">XML_SetHashSalt</h4>
> ++<h4 id=3D"XML_SetHashSalt">XML_SetHashSalt (deprecated)</h4>
> + <pre class=3D"fcndec">
> + int XMLCALL
> +-XML_SetHashSalt(XML_Parser p,
> ++XML_SetHashSalt(XML_Parser parser,
> +                 unsigned long hash_salt);
> + </pre>
> + <div class=3D"fcndef">
> +@@ -2564,15 +2565,55 @@ Sets the hash salt to use for internal hash calc=
ulations.
> + Helps in preventing DoS attacks based on predicting hash
> + function behavior. In order to have an effect this must be called
> + before parsing has started. Returns 1 if successful, 0 when called
> +-after <code>XML_Parse</code> or <code>XML_ParseBuffer</code>.
> ++after <code>XML_Parse</code> or <code>XML_ParseBuffer</code> or when
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
> ++        </p>.
> + <p><b>Note:</b> This call is optional, as the parser will auto-generate
> +-a new random salt value if no value has been set at the start of parsin=
g.</p>
> ++a new random salt value internally if no value has been set by the star=
t of parsing.</p>
> + <p><b>Note:</b> One should not call <code>XML_SetHashSalt</code> with a
> + hash salt value of 0, as this value is used as sentinel value to indica=
te
> + that <code>XML_SetHashSalt</code> has <b>not</b> been called. Consequen=
tly
> + such a call will have no effect, even if it returns 1.</p>
> + </div>
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
> + <h4 id=3D"XML_UseForeignDTD">XML_UseForeignDTD</h4>
> + <pre class=3D"fcndec">
> + enum XML_Error XMLCALL
> +diff --git a/lib/expat.h b/lib/expat.h
> +index df207e9e..b356e002 100644
> +--- a/lib/expat.h
> ++++ b/lib/expat.h
> +@@ -44,6 +44,7 @@
> + #ifndef Expat_INCLUDED
> + #define Expat_INCLUDED 1
> +=20
> ++#  include <stdint.h> // for uint8_t
> + #include <stdlib.h>
> + #include "expat_external.h"
> +=20
> +@@ -916,10 +917,21 @@ XML_SetParamEntityParsing(XML_Parser parser,
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
> + /* If XML_Parse or XML_ParseBuffer have returned XML_STATUS_ERROR, then
> +    XML_GetErrorCode returns information about the error.
> + */
> +diff --git a/lib/internal.h b/lib/internal.h
> +index 32faaa05..617d6454 100644
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
> +index 1bafb948..75a7e5d0 100644
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
> +@@ -1189,69 +1190,65 @@ gather_time_entropy(void) {
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
> +=20
> +-static unsigned long
> +-get_hash_secret_salt(XML_Parser parser) {
> +-  const XML_Parser rootParser =3D getRootParserOf(parser, NULL);
> +-  assert(! rootParser->m_parentParser);
> +-
> +-  return rootParser->m_hash_secret_salt;
> +-}
> +-
> + static enum XML_Error
> + callProcessor(XML_Parser parser, const char *start, const char *end,
> +               const char **endPtr) {
> +@@ -1320,8 +1316,10 @@ callProcessor(XML_Parser parser, const char *star=
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
> +@@ -1609,7 +1607,9 @@ parserInit(XML_Parser parser, const XML_Char *enco=
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
> +@@ -1776,7 +1776,8 @@ XML_ExternalEntityParserCreate(XML_Parser oldParse=
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
> +@@ -1822,7 +1823,8 @@ XML_ExternalEntityParserCreate(XML_Parser oldParse=
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
> +@@ -1877,7 +1879,8 @@ XML_ExternalEntityParserCreate(XML_Parser oldParse=
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
> +@@ -2321,6 +2324,7 @@ XML_SetParamEntityParsing(XML_Parser parser,
> + #endif
> + }
> +=20
> ++// DEPRECATED since Expat 2.7.6.
> + int XMLCALL
> + XML_SetHashSalt(XML_Parser parser, unsigned long hash_salt) {
> +   if (parser =3D=3D NULL)
> +@@ -2332,10 +2336,46 @@ XML_SetHashSalt(XML_Parser parser, unsigned long=
 hash_salt) {
> +   /* block after XML_Parse()/XML_ParseBuffer() has been called */
> +   if (parserBusy(rootParser))
> +     return 0;
> +-  rootParser->m_hash_secret_salt =3D hash_salt;
> ++
> ++  rootParser->m_hash_secret_salt_128.k[0] =3D 0;
> ++  rootParser->m_hash_secret_salt_128.k[1] =3D hash_salt;
> ++
> ++  if (hash_salt !=3D 0) { // to remain backwards compatible
> ++    rootParser->m_hash_secret_salt_set =3D XML_TRUE;
> ++
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
> +@@ -7837,8 +7877,10 @@ keylen(KEY s) {
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
> +diff --git a/tests/basic_tests.c b/tests/basic_tests.c
> +index 023d9ce4..380caf19 100644
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
> +@@ -6244,6 +6268,7 @@ make_basic_test_case(Suite *s) {
> +   tcase_add_test(tc_basic, test_bom_utf16_le);
> +   tcase_add_test(tc_basic, test_nobom_utf16_le);
> +   tcase_add_test(tc_basic, test_hash_collision);
> ++  tcase_add_test(tc_basic, test_hash_salt_setter);
> +   tcase_add_test(tc_basic, test_illegal_utf8);
> +   tcase_add_test(tc_basic, test_utf8_auto_align);
> +   tcase_add_test(tc_basic, test_utf16);
> diff --git a/meta/recipes-core/expat/expat_2.6.4.bb b/meta/recipes-core/e=
xpat/expat_2.6.4.bb
> index 151720a9e3c..f5c3e3fdd2f 100644
> --- a/meta/recipes-core/expat/expat_2.6.4.bb
> +++ b/meta/recipes-core/expat/expat_2.6.4.bb
> @@ -51,6 +51,9 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/R_${VERSION_TA=
G}/expat-${PV}.tar.bz2  \
>             file://CVE-2026-32777-02.patch \
>             file://CVE-2026-32778-01.patch \
>             file://CVE-2026-32778-02.patch \
> +           file://CVE-2026-41080-01.patch \
> +           file://CVE-2026-41080-02.patch \
> +           file://CVE-2026-41080-03.patch \
>             "
> =20
>  GITHUB_BASE_URI =3D "https://github.com/libexpat/libexpat/releases/"


--=20
Yoann Congal
Smile ECS


