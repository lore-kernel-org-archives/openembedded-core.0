Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA452CD98D2
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 23:37:41 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4127.1781653055599607442
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 16:37:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=hDiu8EZB;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490be29c1c5so54885975e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 16:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781653054; x=1782257854; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4fxoDhKW9P1YHmE37oCTB5UW5gqMoxOTIJWdnniwIqY=;
        b=hDiu8EZBR6wwV4IN60lRdJ0ylwT+HqBY5TgALtMYV/SRWm+0/uUsvvyJ6YFFUALAE/
         PgGdqaDyjoq21lFiilFwANjLqsc9HfF4zsmcEUUDtyEcHC0Ysd/V3Wc8LYzjOIOsQvgd
         sPXfmRHgvRU++CmT5uCvb9+uQhhjmoExHeIJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781653054; x=1782257854;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4fxoDhKW9P1YHmE37oCTB5UW5gqMoxOTIJWdnniwIqY=;
        b=EvHV6UuVne7fgnXir/P9P7XJzBpoFWs+Ukvyi6xERoCQMeoIhmo+rWGBDgVmbPDunm
         DBXmGuEFZHdySxe9iX2lBMJRGPdcAqypgF7s3gdAZSKDS3kjkf/X8YxJ288GWlfY5E+F
         n6aRpD+MS6vNrGB21bGlp6uGX2GpS4/7UdywY94/P+UHiGQINWq7hEZbqH0R90hJUIcm
         n/8ng2SBMAVPHeWqlZZ6UnrG0uf8BokrfEjUX8JWsQsKwbke+VYGRM4X2TFtmwngoocJ
         +WP11kIBorLdEUoiFv8U9Kw1IrK9755hC+TaH+/ufiQF3qT0QXohw2SPSlbm26hb9w0V
         HAng==
X-Forwarded-Encrypted: i=1; AFNElJ+0OECYPbev8KOmvz63XuQxntFpoxfVC8R9yCJc8x1mPJTkGwZgTd0Caxd+LsoEjGHv+C4MDwY/BBiR9i7dTE2j8g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzF7LAt4+NJPwj+2AQMClRPjTDgpQ1DChd5tTyaBXmij2vn1g7G
	acF3/7nw2j5b4wkD4kPaW/erN050boeoD4rSlasgu9/vfLxIadh8GhcLd2qUWVA+KO8=
X-Gm-Gg: Acq92OHcdqy7K8rOIOJaFQsbx9Gx8Zi1x7fS2uD42yFdSsH9HYjEAEy3KOYjnvqkbJH
	6XWQkxXkf3qLONtWp5y4/zFX4QyheZ5K/jUxld+X0M98cx+eCkkuSZCC5FYOaSy0c9E1mnjs+VH
	VUBZGQOnDVrHi1bMyF8QvyKyFyhI4DNeUakOfeSUxY3iCZQ5F61FXI3BYaipoD9Xj+yHzY4pYVy
	uOo85h7O/INDh6x/WhW+t0f5OFkzJhRLsZbRY/mfPmVFnx0MbXqr6p1sNJUZgrpHXtvC46tlphE
	FwFgXgy5OFZf3xEiSgqePNGwX8AEbsXbbHzyi1KL8HCgaLMpShlxSgCIa26smtkTo0lgDzUZ7sc
	rQ3TWPInVfZvwqtjXELaiMS/UgRANoD1a2A0HGUdTq17Af1FRLa4ZAerZM1zkcO5fVjk8zxAyoK
	3I43oA/YLoJ5Y1EQYUn0fK1bPagPW+cGq8wtnIo2H7hFUA1z4Ez5K8nFJh07nMq3A1waabsIIlb
	Df8qUqqCfWCAkpgEM8PkUKX5aU=
X-Received: by 2002:a05:600c:c08b:b0:48e:6db3:ff3a with SMTP id 5b1f17b1804b1-492333c019cmr20834585e9.16.1781653053751;
        Tue, 16 Jun 2026 16:37:33 -0700 (PDT)
Received: from localhost (2a01cb001331aa00fdf7edbba0bd5f9d.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fdf7:edbb:a0bd:5f9d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49233bebc57sm11478615e9.2.2026.06.16.16.37.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 16:37:33 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Jun 2026 01:37:32 +0200
Message-Id: <DJAVAP82IHN7.ZUBCLSIJUS0O@smile.fr>
Subject: Re: [PATCH v2 2/2][OE-core][scarthgap] python3: fix CVE-2026-7210
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <amaury.couderc@est.tech>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260615063640.25128-1-amaury.couderc@est.tech>
In-Reply-To: <20260615063640.25128-1-amaury.couderc@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 23:37:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238967

On Mon Jun 15, 2026 at 8:36 AM CEST, Amaury Couderc via lists.openembedded.=
org wrote:
> From: Amaury Couderc <amaury.couderc@est.tech>
>
> Backport patch to fix CVE-2026-7210.
>   https://nvd.nist.gov/vuln/detail/CVE-2026-7210
>
> In order to mitigate CVE-2026-7210 this patch should come alongside=20
> the associated expat one which backports to expat 2.6.4 the fixes=20
> introduced in expat 2.8.0.
>
> Upstream fixes:
>   https://github.com/python/cpython/pull/149023/commits/03794ce9a58b1f337=
51c88d7d876dfbf27645c56
>   https://github.com/python/cpython/pull/149023/commits/ccb8d2f7df9534e49=
a43554193d7f5f4d993189c

Hello,

If I'm not mistaken those fixes are in 3.14.6 or the future 3.15 and
neither are in wrynose nor master. Can you please send a fix for those
branches (either backport or upgrade), and, then, ping back here?

Thanks!

>
>
> Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
> ---
>  .../python/python3/CVE-2026-7210-1.patch      | 90 +++++++++++++++++++
>  .../python/python3/CVE-2026-7210-2.patch      | 74 +++++++++++++++
>  .../python/python3_3.12.13.bb                 |  2 +
>  3 files changed, 166 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-7210-1.=
patch
>  create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-7210-2.=
patch
>
> diff --git a/meta/recipes-devtools/python/python3/CVE-2026-7210-1.patch b=
/meta/recipes-devtools/python/python3/CVE-2026-7210-1.patch
> new file mode 100644
> index 0000000000..63aac320af
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/CVE-2026-7210-1.patch
> @@ -0,0 +1,90 @@
> +From 03794ce9a58b1f33751c88d7d876dfbf27645c56 Mon Sep 17 00:00:00 2001
> +From: Stan Ulbrych <stan@python.org>
> +Date: Sun, 26 Apr 2026 19:31:25 +0100
> +Subject: [PATCH] Use `XML_SetHashSalt16Bytes` from libExpat when possibl=
e
> +
> +CVE: CVE-2026-7210
> +Upstream-Status: Backport [https://github.com/python/cpython/pull/149023=
/commits/03794ce9a58b1f33751c88d7d876dfbf27645c56] with downstream extensio=
n for XML_BACKPORT_SET_HASH_SALT_16_BYTES detection
> +
> +Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
> +---
> + Include/pyexpat.h                                     |  3 +++
> + .../2026-04-26-19-30-45.gh-issue-149018.a9SqWb.rst   |  3 +++
> + Modules/_elementtree.c                                |  8 ++++++--
> + Modules/pyexpat.c                                     | 11 ++++++++++-
> + 4 files changed, 22 insertions(+), 3 deletions(-)
> + create mode 100644 Misc/NEWS.d/next/Security/2026-04-26-19-30-45.gh-iss=
ue-149018.a9SqWb.rst
> +
> +diff --git a/Include/pyexpat.h b/Include/pyexpat.h
> +index f523f8bb273983a..a676e16a7a457ea 100644
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
> +index 000000000000000..d1b5b368684e6a5
> +--- /dev/null
> ++++ b/Misc/NEWS.d/next/Security/2026-04-26-19-30-45.gh-issue-149018.a9Sq=
Wb.rst
> +@@ -0,0 +1,3 @@
> ++Improved protection against XML hash-flooding attacks in
> ++:mod:`xml.parsers.expat` and :mod:`xml.etree.ElementTree` when Python i=
s
> ++compiled with libExpat 2.8.0 or later.
> +diff --git a/Modules/_elementtree.c b/Modules/_elementtree.c
> +index cbd1e026df27227..b2d4b982602c583 100644
> +--- a/Modules/_elementtree.c
> ++++ b/Modules/_elementtree.c
> +@@ -3657,8 +3657,12 @@ _elementtree_XMLParser___init___impl(XMLParserObj=
ect *self, PyObject *target,
> +         PyErr_NoMemory();
> +         return -1;
> +     }
> +-    /* expat < 2.1.0 has no XML_SetHashSalt() */
> +-    if (EXPAT(st, SetHashSalt) !=3D NULL) {
> ++    // Prefer 16-byte entropy, only expat >=3D 2.8.0. See gh-149018
> ++    if (EXPAT(st, SetHashSalt16Bytes) !=3D NULL) {
> ++        EXPAT(st, SetHashSalt16Bytes)(self->parser,
> ++                                      (const uint8_t *)_Py_HashSecret.u=
c);
> ++    }
> ++    else if (EXPAT(st, SetHashSalt) !=3D NULL) {
> +         EXPAT(st, SetHashSalt)(self->parser,
> +                            (unsigned long)_Py_HashSecret.expat.hashsalt=
);
> +     }
> +diff --git a/Modules/pyexpat.c b/Modules/pyexpat.c
> +index 0f0afe17513ef1c..1df433e64bc096f 100644
> +--- a/Modules/pyexpat.c
> ++++ b/Modules/pyexpat.c
> +@@ -1388,7 +1388,12 @@ newxmlparseobject(pyexpat_state *state, const cha=
r *encoding,
> +         Py_DECREF(self);
> +         return NULL;
> +     }
> +-#if XML_COMBINED_VERSION >=3D 20100
> ++#if defined(XML_BACKPORT_SET_HASH_SALT_16_BYTES) \
> ++    || XML_COMBINED_VERSION >=3D 20800
> ++    /* This feature was added upstream in libexpat 2.8.0. */
> ++    XML_SetHashSalt16Bytes(self->itself,
> ++                           (const uint8_t *)_Py_HashSecret.uc);
> ++#elif XML_COMBINED_VERSION >=3D 20100
> +     /* This feature was added upstream in libexpat 2.1.0. */
> +     XML_SetHashSalt(self->itself,
> +                     (unsigned long)_Py_HashSecret.expat.hashsalt);
> +@@ -2257,6 +2262,12 @@ pyexpat_exec(PyObject *mod)
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
> diff --git a/meta/recipes-devtools/python/python3/CVE-2026-7210-2.patch b=
/meta/recipes-devtools/python/python3/CVE-2026-7210-2.patch
> new file mode 100644
> index 0000000000..e9a10d3705
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/CVE-2026-7210-2.patch
> @@ -0,0 +1,74 @@
> +From ccb8d2f7df9534e49a43554193d7f5f4d993189c Mon Sep 17 00:00:00 2001
> +From: Stan Ulbrych <stan@python.org>
> +Date: Sun, 26 Apr 2026 19:42:01 +0100
> +Subject: [PATCH] Add `_Py_HashSecret_t.expat.hashsalt16` instead
> +
> +CVE: CVE-2026-7210
> +Upstream-Status: Backport [https://github.com/python/cpython/pull/149023=
/commits/ccb8d2f7df9534e49a43554193d7f5f4d993189c]
> +
> +Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
> +---
> + Include/pyhash.h       | 8 +++++---
> + Modules/_elementtree.c | 2 +-
> + Modules/pyexpat.c      | 3 +--
> + 3 files changed, 7 insertions(+), 6 deletions(-)
> +
> +diff --git a/Include/pyhash.h b/Include/pyhash.h
> +index 84cb72fa6fd1b26..3056dc44cc0f1b1 100644
> +--- a/Include/pyhash.h
> ++++ b/Include/pyhash.h
> +@@ -39,14 +39,14 @@
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
> +@@ -71,7 +71,9 @@ typedef union {
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
> +diff --git a/Modules/_elementtree.c b/Modules/_elementtree.c
> +index b2d4b982602c583..9e794be5c109ba5 100644
> +--- a/Modules/_elementtree.c
> ++++ b/Modules/_elementtree.c
> +@@ -3660,7 +3660,7 @@ _elementtree_XMLParser___init___impl(XMLParserObje=
ct *self, PyObject *target,
> +     // Prefer 16-byte entropy, only expat >=3D 2.8.0. See gh-149018
> +     if (EXPAT(st, SetHashSalt16Bytes) !=3D NULL) {
> +         EXPAT(st, SetHashSalt16Bytes)(self->parser,
> +-                                      (const uint8_t *)_Py_HashSecret.u=
c);
> ++                                      _Py_HashSecret.expat.hashsalt16);
> +     }
> +     else if (EXPAT(st, SetHashSalt) !=3D NULL) {
> +         EXPAT(st, SetHashSalt)(self->parser,
> +diff --git a/Modules/pyexpat.c b/Modules/pyexpat.c
> +index 1df433e64bc096f..78efbef679024f3 100644
> +--- a/Modules/pyexpat.c
> ++++ b/Modules/pyexpat.c
> +@@ -1391,8 +1391,7 @@ newxmlparseobject(pyexpat_state *state, const char=
 *encoding,
> + #if defined(XML_BACKPORT_SET_HASH_SALT_16_BYTES) \
> +     || XML_COMBINED_VERSION >=3D 20800
> +     /* This feature was added upstream in libexpat 2.8.0. */
> +-    XML_SetHashSalt16Bytes(self->itself,
> +-                           (const uint8_t *)_Py_HashSecret.uc);
> ++    XML_SetHashSalt16Bytes(self->itself, _Py_HashSecret.expat.hashsalt1=
6);
> + #elif XML_COMBINED_VERSION >=3D 20100
> +     /* This feature was added upstream in libexpat 2.1.0. */
> +     XML_SetHashSalt(self->itself,
> diff --git a/meta/recipes-devtools/python/python3_3.12.13.bb b/meta/recip=
es-devtools/python/python3_3.12.13.bb
> index 5fa25235fe..3e5575d396 100644
> --- a/meta/recipes-devtools/python/python3_3.12.13.bb
> +++ b/meta/recipes-devtools/python/python3_3.12.13.bb
> @@ -34,6 +34,8 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Pyt=
hon-${PV}.tar.xz \
>  	   file://0001-test_deadlock-skip-problematic-test.patch \
>  	   file://0001-test_active_children-skip-problematic-test.patch \
>             file://0001-test_readline-skip-limited-history-test.patch \
> +           file://CVE-2026-7210-1.patch=C2=A0\
> +           file://CVE-2026-7210-2.patch=C2=A0\
>             "
> =20
>  SRC_URI:append:class-native =3D " \


--=20
Yoann Congal
Smile ECS


