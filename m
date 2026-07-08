Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F02EC43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 15:44:42 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11518.1783525481395034549
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 08:44:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qQ435zkB;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47defd0c1c5so472836f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 08:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783525480; x=1784130280; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AvNgTy4G/P5M2UKhZ4p2iDVToW4xeel3FcDb9dgQrGE=;
        b=qQ435zkB6v2B4wgvAVM+7QjkyGFqPP3dhwryZoctDx2iHcEUUtjLjftgDZinWTI6pe
         Hq82QOjZ5iuluo5JxN5YSqfdnkfE9/o0LxPwP2NTzwDKpt2lGwBwyihceOBF6n4W9KWi
         DnveWMJSc8pMWzY6G4krmW9KPli/UteAt5ee8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783525480; x=1784130280;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AvNgTy4G/P5M2UKhZ4p2iDVToW4xeel3FcDb9dgQrGE=;
        b=WZ8C7T51kZ1+6PUT3PArm5bq0BDVeVKZeeYnetQILEx0NpBgjbAC5UqBLNTlLgDRTj
         Is/ToYVwajdO79dFbPGrm2O3JEBVzeTE1o0BZIy71h0/CQoitQxVHAcj8SrusVEiVSwB
         VI0fWGd/C3ag2PkxpUXGuRwUuzi0eQCo3cZNVlajvUs70gTTeXEJiAgwVPsQJApT8Bjr
         wEVYt4cSZf0VtWGauPIT5bJEszwGnaEwC6C0eOZCdXxAnkP6sytT3A67m+2yzg+c4hnq
         DVkhkvEiB7emu0XG/xspozLyZuBXKwITLcuRmOSOTCNdr3d09AQjzlO+fps9f5gsJMTV
         Mtnw==
X-Forwarded-Encrypted: i=1; AHgh+RrePqNNN0SXy+YVwqxxoYqneZw1+rsylti2xFjPdDx5HsdvXZXMsf2hViRB9PC+Br79X9y/xk+2TScoYOlNapbAoA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxjCR+NUimqdzfUAoZmkus7UDXvAHwdu6c1xE39vhp0mZsP/4LQ
	sZpLLAor8FBN/xvxkytBcdP9A2Fg5FUzOqmreR+4owwLM5eUGCf5U+OYniPH7H/py2s=
X-Gm-Gg: AfdE7cmR9TqMqt/Xp5kkzHDXFYobRqyFmbe7CS3IxO7DlzRLg7eF0JPYxGyML8HlhMu
	wd2QWTZ+vTe9BWqeckHrO9kE+Vu7fEvWz0AU7yae0cW+aHJGnqoDirdAE7gu3muv4TTcA++GQfa
	th/UFnNks2i9kisc58tlNiDutEXiIO7HP2JOoNZrWP10oq5esy+55MXjGa/D1tS3JRWIqpitsv3
	OoLRosKE4b/SWP81ljMat0S2mzUozqvejp/K/E8fdkaNrjzxmJwsKnTlpd7wgDNxRZMlQ2s4PJc
	NZBEGliNx107ulkqpsyswxDtloMcNRe69DARKt9nuxxR1QSdn6ty8yydTDoUcSjqxDupibenmpg
	BDOtCA3iOQFcbbBL9Jqto/gk0dq/pjc7D6veuCVxYBZhw6vqOPLnydUKle8b5kP/1PRiiwtJkbP
	EElAzx6ec/Y4mJ0SEOrlwLgUlODH7UIWlU4go/Jyduy4RqjRIFX2S5GQiqceaxKFflyZQ/jBXg
X-Received: by 2002:a05:6000:1a8b:b0:470:2fb1:3dca with SMTP id ffacd0b85a97d-47df07ec8d2mr4228225f8f.30.1783525479446;
        Wed, 08 Jul 2026 08:44:39 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f21543sm40932247f8f.35.2026.07.08.08.44.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 08:44:38 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Jul 2026 17:44:38 +0200
Message-Id: <DJTB0LT9F8I8.1UDJMRRJP6O1C@smile.fr>
To: <amaury.couderc@est.tech>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/2][wrynose] python3: fix CVE-2026-7210
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260706120508.37474-1-amaury.couderc@est.tech>
In-Reply-To: <20260706120508.37474-1-amaury.couderc@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 15:44:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240497

On Mon Jul 6, 2026 at 2:04 PM CEST, Amaury Couderc via lists.openembedded.o=
rg wrote:
> From: Amaury Couderc <amaury.couderc@est.tech>
>
> CVE-2026-7210 is a hash-flooding denial-of-service vulnerability in
> Python's XML parsing modules (xml.parsers.expat, xml.etree.ElementTree).
> An attacker can craft XML input that forces O(n=C2=B2) hash collisions in
> libexpat's internal name dictionary, causing excessive CPU consumption.
>
> The previous mitigation seeded libexpat's hash function with only 4
> bytes of entropy, which is insufficient against a determined attacker.
> This patch upgrades to XML_SetHashSalt16Bytes (libexpat >=3D 2.8.0),
> providing a full 16-byte secret. Older expat versions fall back
> gracefully to the legacy XML_SetHashSalt via a runtime NULL check.
>
> NOTE: CVE-2026-7210 full mitigation requires the companion
>     expat CVE-2026-41080 patch (raises expat to >=3D 2.8.0 API)
>
> Backport patch to fix CVE-2026-7210.
> https://nvd.nist.gov/vuln/detail/CVE-2026-7210
>
> Upstream fix:
> https://github.com/python/cpython/commit/24b8f12544468e4cedf5bfbe25442fcd=
495391e4
>
> Tested with ptest:
> Before: PASSED: 43903, FAILED: 0, SKIPPED: 2471
> After: PASSED: 43903, FAILED: 0, SKIPPED: 2471
>
> CVE: CVE-2026-7210
>
> Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>

Hello,

This CVE patch is included in the python upgrade received here:
"python3: upgrade 3.14.5 -> 3.14.6"
https://lore.kernel.org/all/20260706-fix-cves-python-wrynose-v1-1-b53e09c2b=
62a@bootlin.com/
I'll drop this and proceed with the upgrade.

Thanks!

> ---
>  .../python/python3/CVE-2026-7210.patch        | 136 ++++++++++++++++++
>  .../recipes-devtools/python/python3_3.14.5.bb |   1 +
>  2 files changed, 137 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-7210.pa=
tch
>
> diff --git a/meta/recipes-devtools/python/python3/CVE-2026-7210.patch b/m=
eta/recipes-devtools/python/python3/CVE-2026-7210.patch
> new file mode 100644
> index 0000000000..337130d9b7
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/CVE-2026-7210.patch
> @@ -0,0 +1,136 @@
> +From a7fafeebaf33995556a37e9eec4f6a6bcfce2e67 Mon Sep 17 00:00:00 2001
> +From: Stan Ulbrych <stan@python.org>
> +Date: Sun, 10 May 2026 18:36:26 +0100
> +Subject: [PATCH] gh-149018: Use `XML_SetHashSalt16Bytes` in `pyexpat`/`_=
elementtree` when possible (#149023)
> +
> +CVE-2026-7210 is a hash-flooding denial-of-service vulnerability in
> +Python's XML parsing modules (xml.parsers.expat, xml.etree.ElementTree).
> +An attacker can craft XML input that forces O(n=C2=B2) hash collisions i=
n
> +libexpat's internal name dictionary, causing excessive CPU consumption.
> +
> +The previous mitigation seeded libexpat's hash function with only 4
> +bytes of entropy, which is insufficient against a determined attacker.
> +This patch upgrades to XML_SetHashSalt16Bytes (libexpat >=3D 2.8.0),
> +providing a full 16-byte secret. Older expat versions fall back
> +gracefully to the legacy XML_SetHashSalt via a runtime NULL check.
> +
> +NOTE: CVE-2026-7210 full mitigation requires the companion
> +    expat CVE-2026-41080 patch (raises expat to >=3D 2.8.0 API)
> +
> +CVE: CVE-2026-7210
> +Upstream-Status: Backport [https://github.com/python/cpython/commit/24b8=
f12544468e4cedf5bfbe25442fcd495391e4]
> +
> +Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
> +---
> + Include/internal/pycore_pyhash.h                       |  8 +++++---
> + Include/pyexpat.h                                      |  3 +++
> + .../2026-04-26-19-30-45.gh-issue-149018.a9SqWb.rst     |  3 +++
> + Modules/_elementtree.c                                 |  8 ++++++--
> + Modules/pyexpat.c                                      | 10 +++++++++-
> + 5 files changed, 26 insertions(+), 6 deletions(-)
> + create mode 100644 Misc/NEWS.d/next/Security/2026-04-26-19-30-45.gh-iss=
ue-149018.a9SqWb.rst
> +
> +diff --git a/Include/internal/pycore_pyhash.h b/Include/internal/pycore_=
pyhash.h
> +index 84cb72fa6fd..3056dc44cc0 100644
> +--- a/Include/internal/pycore_pyhash.h
> ++++ b/Include/internal/pycore_pyhash.h
> +@@ -27,14 +27,14 @@ _Py_HashPointerRaw(const void *ptr)
> +  *   pppppppp ssssssss ........  fnv -- two Py_hash_t
> +  *   k0k0k0k0 k1k1k1k1 ........  siphash -- two uint64_t
> +  *   ........ ........ ssssssss  djbx33a -- 16 bytes padding + one Py_h=
ash_t
> +- *   ........ ........ eeeeeeee  pyexpat XML hash salt
> ++ *   eeeeeeee eeeeeeee eeeeeeee  pyexpat XML hash salt
> +  *
> +  * memory layout on 32 bit systems
> +  *   cccccccc cccccccc cccccccc  uc
> +  *   ppppssss ........ ........  fnv -- two Py_hash_t
> +  *   k0k0k0k0 k1k1k1k1 ........  siphash -- two uint64_t (*)
> +  *   ........ ........ ssss....  djbx33a -- 16 bytes padding + one Py_h=
ash_t
> +- *   ........ ........ eeee....  pyexpat XML hash salt
> ++ *   eeeeeeee eeeeeeee eeee....  pyexpat XML hash salt
> +  *
> +  * (*) The siphash member may not be available on 32 bit platforms with=
out
> +  *     an unsigned int64 data type.
> +@@ -58,7 +58,9 @@ typedef union {
> +         Py_hash_t suffix;
> +     } djbx33a;
> +     struct {
> +-        unsigned char padding[16];
> ++        /* 16 bytes for XML_SetHashSalt16Bytes */
> ++        uint8_t hashsalt16[16];
> ++        /* 4/8 bytes for legacy XML_SetHashSalt */
> +         Py_hash_t hashsalt;
> +     } expat;
> + } _Py_HashSecret_t;
> +diff --git a/Include/pyexpat.h b/Include/pyexpat.h
> +index 04548b7684a..d28d6828975 100644
> +--- a/Include/pyexpat.h
> ++++ b/Include/pyexpat.h
> +@@ -57,6 +57,9 @@ struct PyExpat_CAPI
> +         XML_Parser parser, unsigned long long activationThresholdBytes)=
;
> +     XML_Bool (*SetAllocTrackerMaximumAmplification)(
> +         XML_Parser parser, float maxAmplificationFactor);
> ++    /* might be NULL for expat < 2.8.0 */
> ++    XML_Bool (*SetHashSalt16Bytes)(
> ++        XML_Parser parser, const uint8_t entropy[16]);
> +     /* always add new stuff to the end! */
> + };
> +=20
> +diff --git a/Misc/NEWS.d/next/Security/2026-04-26-19-30-45.gh-issue-1490=
18.a9SqWb.rst b/Misc/NEWS.d/next/Security/2026-04-26-19-30-45.gh-issue-1490=
18.a9SqWb.rst
> +new file mode 100644
> +index 00000000000..d1b5b368684
> +--- /dev/null
> ++++ b/Misc/NEWS.d/next/Security/2026-04-26-19-30-45.gh-issue-149018.a9Sq=
Wb.rst
> +@@ -0,0 +1,3 @@
> ++Improved protection against XML hash-flooding attacks in
> ++:mod:`xml.parsers.expat` and :mod:`xml.etree.ElementTree` when Python i=
s
> ++compiled with libExpat 2.8.0 or later.
> +diff --git a/Modules/_elementtree.c b/Modules/_elementtree.c
> +index 7ca03f1561b..44d59fcb806 100644
> +--- a/Modules/_elementtree.c
> ++++ b/Modules/_elementtree.c
> +@@ -3724,8 +3724,12 @@ _elementtree_XMLParser___init___impl(XMLParserObj=
ect *self, PyObject *target,
> +         PyErr_NoMemory();
> +         return -1;
> +     }
> +-    /* expat < 2.1.0 has no XML_SetHashSalt() */
> +-    if (EXPAT(st, SetHashSalt) !=3D NULL) {
> ++    // Prefer 16-byte entropy, only expat >=3D 2.8.0. See gh-149018
> ++    if (EXPAT(st, SetHashSalt16Bytes) !=3D NULL) {
> ++        EXPAT(st, SetHashSalt16Bytes)(self->parser,
> ++                                      _Py_HashSecret.expat.hashsalt16);
> ++    }
> ++    else if (EXPAT(st, SetHashSalt) !=3D NULL) {
> +         EXPAT(st, SetHashSalt)(self->parser,
> +                            (unsigned long)_Py_HashSecret.expat.hashsalt=
);
> +     }
> +diff --git a/Modules/pyexpat.c b/Modules/pyexpat.c
> +index f82f8456e48..437fd5fb61a 100644
> +--- a/Modules/pyexpat.c
> ++++ b/Modules/pyexpat.c
> +@@ -1416,7 +1416,11 @@ newxmlparseobject(pyexpat_state *state, const cha=
r *encoding,
> +         Py_DECREF(self);
> +         return NULL;
> +     }
> +-#if XML_COMBINED_VERSION >=3D 20100
> ++#if defined(XML_BACKPORT_SET_HASH_SALT_16_BYTES) \
> ++    || XML_COMBINED_VERSION >=3D 20800
> ++    /* This feature was added upstream in libexpat 2.8.0. */
> ++    XML_SetHashSalt16Bytes(self->itself, _Py_HashSecret.expat.hashsalt1=
6);
> ++#elif XML_COMBINED_VERSION >=3D 20100
> +     /* This feature was added upstream in libexpat 2.1.0. */
> +     XML_SetHashSalt(self->itself,
> +                     (unsigned long)_Py_HashSecret.expat.hashsalt);
> +@@ -2310,6 +2313,12 @@ pyexpat_exec(PyObject *mod)
> + #else
> +     capi->SetHashSalt =3D NULL;
> + #endif
> ++#if defined(XML_BACKPORT_SET_HASH_SALT_16_BYTES) \
> ++    || XML_COMBINED_VERSION >=3D 20800
> ++    capi->SetHashSalt16Bytes =3D XML_SetHashSalt16Bytes;
> ++#else
> ++    capi->SetHashSalt16Bytes =3D NULL;
> ++#endif
> + #if XML_COMBINED_VERSION >=3D 20600
> +     capi->SetReparseDeferralEnabled =3D XML_SetReparseDeferralEnabled;
> + #else
> diff --git a/meta/recipes-devtools/python/python3_3.14.5.bb b/meta/recipe=
s-devtools/python/python3_3.14.5.bb
> index ed413dc1fe..83f6bf426c 100644
> --- a/meta/recipes-devtools/python/python3_3.14.5.bb
> +++ b/meta/recipes-devtools/python/python3_3.14.5.bb
> @@ -36,6 +36,7 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Pyt=
hon-${PV}.tar.xz \
>             file://0001-test_only_active_thread-skip-problematic-test.pat=
ch \
>             file://0001-prefer-valid-entrypoints.patch \
>             file://0001-Fix-ThreadingMock-call-count-race-condition.patch=
 \
> +           file://CVE-2026-7210.patch \
>             "
>  SRC_URI:append:class-native =3D " \
>             file://0001-Lib-sysconfig.py-use-prefix-value-from-build-conf=
igu.patch \


--=20
Yoann Congal
Smile ECS


