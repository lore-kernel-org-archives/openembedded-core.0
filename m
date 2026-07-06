Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A61CFC43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 12:52:28 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.150262.1783342336302619250
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 05:52:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=gh3p4lZ0;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47dc6e04367so298151f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 05:52:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783342334; cv=none;
        d=google.com; s=arc-20260327;
        b=l81PZd2jbw2I1LIm2Hu1rnB/fJKxqlAWvgP6b9FD8ffbmI40rtm8VIJtHN2STsJDa0
         CpNnTCv24jMdDkVizv/XMImO3i1tpoOSuXZXP2+/03DM/zJT5mi/Mq6dcVguRMAG3rDq
         l7tSN1D6X3TuGRyOkCPrQxhW7d6tsEx/5J7PcAKOWepjRU4HWF3zpvF4duoZACLqf80V
         V3SOr8BpVPT0bXBK4bjijyP6xZlDxT8/cpNsDLEbolgdas+ZYVu1p/v6QizJhVQ21E2z
         4nadBcfZ9mDvBfJp2LeG+ITitKmMLoQ3yUi9JuwKVybXcbc1RjNCjgGUFKa4pidCluzl
         X16A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=z/Map8/TipMLzbSp1Bn3dvmWSgBxpoPt/DCmHMgMktc=;
        fh=50PaEABjrFrnv+WlfvsL2njjIYeaoLDb7tzOFo0/0AE=;
        b=liojoH2BL4slgRQlcldQxGAQG6LWouB5xc2UAvK1lsdE95K/qXt0hGpbuyrzacxdmG
         iDpBndU2akm1W/4jx34r01w8BIH5uyZc/+Icr0rxL6PM6JVutMHOyRSPkFHI/OtDRPWE
         n7hIFgJEmqW4rE20VhNK/SLhPHUTFo0aZX9Gi4eZvajjt3PVcBYebcs1SKuUFjJ1J6uK
         eGdIXArWk+yM3IsDQ1aIQMmVgeQWwLwkkRtQVrHVISu1mxwOtiq44msliy/Drfc9za82
         pmpagIUxotdYO//72YcE5HPPCguwuTXInNH8DhhuD9FEsUjvS522kqyIhv+AXbfNdu+f
         TsVA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783342334; x=1783947134; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z/Map8/TipMLzbSp1Bn3dvmWSgBxpoPt/DCmHMgMktc=;
        b=gh3p4lZ0S0KOJW+/keoAtEFoNfZNNqPZZAk3WawVxTBqDhWUbGa3vQ6R9+AW3Iuzlv
         rB3ZFP0vi05f3S1Dj5uEMuDesthJ7prWKxCRTua+R7/WrH0uxVltSKXYGXwNtUjRvtg3
         ll7q4xMkZe4F88QA/abD1qieW4+K5b1GWflks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783342334; x=1783947134;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/Map8/TipMLzbSp1Bn3dvmWSgBxpoPt/DCmHMgMktc=;
        b=r+27Lnq1MNRg0/WbTuHh+lZFCMgIet0yDCOuXGD1lZIEmNXdUrGpMiWXdmVyTbtAZr
         y19Qc9bTiy2SVj4HM/svo4dwaw7N+rxaeJisBdAEBAXeeuCGxPKmngaEtrz3iRx97c9n
         UcwPXsYk/iablfA2oWEnJjLBJxh3qZCParuX4/tiNoaGqzvjndkgmXhuJXAjP+P38Rkv
         d+X5hvZX3v2/Hu9P3IKKeDpkXP8IUlhpZltXag/gIIfht2VRIt4fkWVGt6v5vrGLd8sV
         u9RgqCEPLp1OU9cDFgLBeaDZbXFm0bx3B/WwqO4RUndFk7AUUMc8wej/znTh0tqXEmIl
         5ueg==
X-Gm-Message-State: AOJu0YxbFiwoXDZgPjJnbZaRQBgaWgfscNtuFzIuqegoWBpxgNZV0Nbu
	TIZuH0Ggvf4PfgREKj74khApMQ+SxOjCpgrkXQB3Gx1eBEHDpegGwIcGDFLXVXQq80WaIlwuBlc
	8e823FKoh/+07XUAJ3x+39JbB/oLGBTrvXNi6Zy8jpg==
X-Gm-Gg: AfdE7cnenSLA8ZqYr+z0Yjh318Cd+QZ+29tTOq/ImNINeAlpKMi9nzrZKTuBOolX2ye
	RhlC7MqNcWCdRNHqCyeHHXeLR8kVirVWd4jiVXBvPWl9PerSqR0XkE5/keKtOmoP1OKqF9m1Wwz
	MS+OWx377fKmqS6cNcEd6sT9GMHOR4N3HQEujedsnDi8IwdAfDhT/6eqvnskggSBWTEU2k56v+Q
	/4x/j5MUHTfNDTEn2+wH385oa33l+zww/+rU3/8Opi6eIrQ71uLvMhy7NP8FOm852njTGHqBiWG
	3Y7QOY3ekjFngpdMZBtRWok15TAQRg==
X-Received: by 2002:a5d:648f:0:b0:47d:e01c:c28 with SMTP id
 ffacd0b85a97d-47de66a2fd5mr18811f8f.36.1783342333910; Mon, 06 Jul 2026
 05:52:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260615063640.25128-1-amaury.couderc@est.tech>
 <DJAVAP82IHN7.ZUBCLSIJUS0O@smile.fr> <AMBP189MB31965402490609FB034B7DCDF8F12@AMBP189MB3196.EURP189.PROD.OUTLOOK.COM>
In-Reply-To: <AMBP189MB31965402490609FB034B7DCDF8F12@AMBP189MB3196.EURP189.PROD.OUTLOOK.COM>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Mon, 6 Jul 2026 14:51:47 +0200
X-Gm-Features: AVVi8CcR85qtgWzDvzD-CTbES6LbM0bwILkGDjE8W3KaPmHnrRHJE0IHaD0kUsc
Message-ID: <CAMSfU+49rELGwdjk3fDq-xpsy6iPkpyxEwdZ-46SDirvw3rYXw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2][OE-core][scarthgap] python3: fix CVE-2026-7210
To: Amaury Couderc <amaury.couderc@est.tech>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005382d00655f0bec1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 12:52:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240267

--0000000000005382d00655f0bec1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 6 juil. 2026 =C3=A0 14:31, Amaury Couderc <amaury.couderc@est.tech>=
 a
=C3=A9crit :

> ------------------------------
> Hello Yoann,
> I've submitted patches for CVE-2026-7210 and CVE-2026-41080 to the wrynos=
e
> branch. The master branch requires neither backports nor updates.
> However, the patch for CVE-2026-7210 requires the patch for CVE-2026-4108=
0
> for full mitigation, which I've seen was already submitted to the scarthg=
ap
> branch (see
> https://lists.openembedded.org/g/openembedded-core/message/237838?p=3D%2C=
%2C%2C20%2C0%2C0%2C0%3A%3Acreated%2C%2CCVE-2026-41080%2C20%2C2%2C0%2C119168=
855),
> but I'm uncertain whether it has been merged yet.
> Given this dependency, do you think it's still worth submitting my
> backport for CVE-2026-7210 to scarthgap?
>
Yes please.

I'll take the patch for CVE-2026-41080: (see
https://lore.kernel.org/all/2030b4435c8bc81bb4452637c0517ac33ab94d20.camel@=
pbarker.dev/
)
Note in you patch comment (below the "---") that the patch for
CVE-2026-41080 needs to go first.

Thanks!


> Kind Regards,
> Amaury
> ------------------------------
> *From:* Yoann Congal <yoann.congal@smile.fr>
> *Sent:* Wednesday, 17 June 2026 01:37
> *To:* Amaury Couderc <amaury.couderc@est.tech>;
> openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org>
> *Subject:* Re: [PATCH v2 2/2][OE-core][scarthgap] python3: fix
> CVE-2026-7210
>
> On Mon Jun 15, 2026 at 8:36 AM CEST, Amaury Couderc via
> lists.openembedded.org wrote:
> > From: Amaury Couderc <amaury.couderc@est.tech>
> >
> > Backport patch to fix CVE-2026-7210.
> >   https://nvd.nist.gov/vuln/detail/CVE-2026-7210
> >
> > In order to mitigate CVE-2026-7210 this patch should come alongside
> > the associated expat one which backports to expat 2.6.4 the fixes
> > introduced in expat 2.8.0.
> >
> > Upstream fixes:
> >
> https://github.com/python/cpython/pull/149023/commits/03794ce9a58b1f33751=
c88d7d876dfbf27645c56
> >
> https://github.com/python/cpython/pull/149023/commits/ccb8d2f7df9534e49a4=
3554193d7f5f4d993189c
>
> Hello,
>
> If I'm not mistaken those fixes are in 3.14.6 or the future 3.15 and
> neither are in wrynose nor master. Can you please send a fix for those
> branches (either backport or upgrade), and, then, ping back here?
>
> Thanks!
>
> >
> >
> > Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
> > ---
> >  .../python/python3/CVE-2026-7210-1.patch      | 90 +++++++++++++++++++
> >  .../python/python3/CVE-2026-7210-2.patch      | 74 +++++++++++++++
> >  .../python/python3_3.12.13.bb                 |  2 +
> >  3 files changed, 166 insertions(+)
> >  create mode 100644
> meta/recipes-devtools/python/python3/CVE-2026-7210-1.patch
> >  create mode 100644
> meta/recipes-devtools/python/python3/CVE-2026-7210-2.patch
> >
> > diff --git a/meta/recipes-devtools/python/python3/CVE-2026-7210-1.patch
> b/meta/recipes-devtools/python/python3/CVE-2026-7210-1.patch
> > new file mode 100644
> > index 0000000000..63aac320af
> > --- /dev/null
> > +++ b/meta/recipes-devtools/python/python3/CVE-2026-7210-1.patch
> > @@ -0,0 +1,90 @@
> > +From 03794ce9a58b1f33751c88d7d876dfbf27645c56 Mon Sep 17 00:00:00 2001
> > +From: Stan Ulbrych <stan@python.org>
> > +Date: Sun, 26 Apr 2026 19:31:25 +0100
> > +Subject: [PATCH] Use `XML_SetHashSalt16Bytes` from libExpat when
> possible
> > +
> > +CVE: CVE-2026-7210
> > +Upstream-Status: Backport [
> https://github.com/python/cpython/pull/149023/commits/03794ce9a58b1f33751=
c88d7d876dfbf27645c56]
> with downstream extension for XML_BACKPORT_SET_HASH_SALT_16_BYTES detecti=
on
> > +
> > +Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
> > +---
> > + Include/pyexpat.h                                     |  3 +++
> > + .../2026-04-26-19-30-45.gh-issue-149018.a9SqWb.rst   |  3 +++
> > + Modules/_elementtree.c                                |  8 ++++++--
> > + Modules/pyexpat.c                                     | 11 ++++++++++=
-
> > + 4 files changed, 22 insertions(+), 3 deletions(-)
> > + create mode 100644
> Misc/NEWS.d/next/Security/2026-04-26-19-30-45.gh-issue-149018.a9SqWb.rst
> > +
> > +diff --git a/Include/pyexpat.h b/Include/pyexpat.h
> > +index f523f8bb273983a..a676e16a7a457ea 100644
> > +--- a/Include/pyexpat.h
> > ++++ b/Include/pyexpat.h
> > +@@ -57,6 +57,9 @@ struct PyExpat_CAPI
> > +         XML_Parser parser, unsigned long long
> activationThresholdBytes);
> > +     XML_Bool (*SetAllocTrackerMaximumAmplification)(
> > +         XML_Parser parser, float maxAmplificationFactor);
> > ++    /* might be NULL for expat < 2.8.0 */
> > ++    XML_Bool (*SetHashSalt16Bytes)(
> > ++        XML_Parser parser, const uint8_t entropy[16]);
> > +     /* always add new stuff to the end! */
> > + };
> > +
> > +diff --git
> a/Misc/NEWS.d/next/Security/2026-04-26-19-30-45.gh-issue-149018.a9SqWb.rs=
t
> b/Misc/NEWS.d/next/Security/2026-04-26-19-30-45.gh-issue-149018.a9SqWb.rs=
t
> > +new file mode 100644
> > +index 000000000000000..d1b5b368684e6a5
> > +--- /dev/null
> > ++++
> b/Misc/NEWS.d/next/Security/2026-04-26-19-30-45.gh-issue-149018.a9SqWb.rs=
t
> > +@@ -0,0 +1,3 @@
> > ++Improved protection against XML hash-flooding attacks in
> > ++:mod:`xml.parsers.expat` and :mod:`xml.etree.ElementTree` when Python
> is
> > ++compiled with libExpat 2.8.0 or later.
> > +diff --git a/Modules/_elementtree.c b/Modules/_elementtree.c
> > +index cbd1e026df27227..b2d4b982602c583 100644
> > +--- a/Modules/_elementtree.c
> > ++++ b/Modules/_elementtree.c
> > +@@ -3657,8 +3657,12 @@
> _elementtree_XMLParser___init___impl(XMLParserObject *self, PyObject
> *target,
> > +         PyErr_NoMemory();
> > +         return -1;
> > +     }
> > +-    /* expat < 2.1.0 has no XML_SetHashSalt() */
> > +-    if (EXPAT(st, SetHashSalt) !=3D NULL) {
> > ++    // Prefer 16-byte entropy, only expat >=3D 2.8.0. See gh-149018
> > ++    if (EXPAT(st, SetHashSalt16Bytes) !=3D NULL) {
> > ++        EXPAT(st, SetHashSalt16Bytes)(self->parser,
> > ++                                      (const uint8_t
> *)_Py_HashSecret.uc);
> > ++    }
> > ++    else if (EXPAT(st, SetHashSalt) !=3D NULL) {
> > +         EXPAT(st, SetHashSalt)(self->parser,
> > +                            (unsigned
> long)_Py_HashSecret.expat.hashsalt);
> > +     }
> > +diff --git a/Modules/pyexpat.c b/Modules/pyexpat.c
> > +index 0f0afe17513ef1c..1df433e64bc096f 100644
> > +--- a/Modules/pyexpat.c
> > ++++ b/Modules/pyexpat.c
> > +@@ -1388,7 +1388,12 @@ newxmlparseobject(pyexpat_state *state, const
> char *encoding,
> > +         Py_DECREF(self);
> > +         return NULL;
> > +     }
> > +-#if XML_COMBINED_VERSION >=3D 20100
> > ++#if defined(XML_BACKPORT_SET_HASH_SALT_16_BYTES) \
> > ++    || XML_COMBINED_VERSION >=3D 20800
> > ++    /* This feature was added upstream in libexpat 2.8.0. */
> > ++    XML_SetHashSalt16Bytes(self->itself,
> > ++                           (const uint8_t *)_Py_HashSecret.uc);
> > ++#elif XML_COMBINED_VERSION >=3D 20100
> > +     /* This feature was added upstream in libexpat 2.1.0. */
> > +     XML_SetHashSalt(self->itself,
> > +                     (unsigned long)_Py_HashSecret.expat.hashsalt);
> > +@@ -2257,6 +2262,12 @@ pyexpat_exec(PyObject *mod)
> > + #else
> > +     capi->SetHashSalt =3D NULL;
> > + #endif
> > ++#if defined(XML_BACKPORT_SET_HASH_SALT_16_BYTES) \
> > ++    || XML_COMBINED_VERSION >=3D 20800
> > ++    capi->SetHashSalt16Bytes =3D XML_SetHashSalt16Bytes;
> > ++#else
> > ++    capi->SetHashSalt16Bytes =3D NULL;
> > ++#endif
> > + #if XML_COMBINED_VERSION >=3D 20600
> > +     capi->SetReparseDeferralEnabled =3D XML_SetReparseDeferralEnabled=
;
> > + #else
> > diff --git a/meta/recipes-devtools/python/python3/CVE-2026-7210-2.patch
> b/meta/recipes-devtools/python/python3/CVE-2026-7210-2.patch
> > new file mode 100644
> > index 0000000000..e9a10d3705
> > --- /dev/null
> > +++ b/meta/recipes-devtools/python/python3/CVE-2026-7210-2.patch
> > @@ -0,0 +1,74 @@
> > +From ccb8d2f7df9534e49a43554193d7f5f4d993189c Mon Sep 17 00:00:00 2001
> > +From: Stan Ulbrych <stan@python.org>
> > +Date: Sun, 26 Apr 2026 19:42:01 +0100
> > +Subject: [PATCH] Add `_Py_HashSecret_t.expat.hashsalt16` instead
> > +
> > +CVE: CVE-2026-7210
> > +Upstream-Status: Backport [
> https://github.com/python/cpython/pull/149023/commits/ccb8d2f7df9534e49a4=
3554193d7f5f4d993189c
> ]
> > +
> > +Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
> > +---
> > + Include/pyhash.h       | 8 +++++---
> > + Modules/_elementtree.c | 2 +-
> > + Modules/pyexpat.c      | 3 +--
> > + 3 files changed, 7 insertions(+), 6 deletions(-)
> > +
> > +diff --git a/Include/pyhash.h b/Include/pyhash.h
> > +index 84cb72fa6fd1b26..3056dc44cc0f1b1 100644
> > +--- a/Include/pyhash.h
> > ++++ b/Include/pyhash.h
> > +@@ -39,14 +39,14 @@
> > +  *   pppppppp ssssssss ........  fnv -- two Py_hash_t
> > +  *   k0k0k0k0 k1k1k1k1 ........  siphash -- two uint64_t
> > +  *   ........ ........ ssssssss  djbx33a -- 16 bytes padding + one
> Py_hash_t
> > +- *   ........ ........ eeeeeeee  pyexpat XML hash salt
> > ++ *   eeeeeeee eeeeeeee eeeeeeee  pyexpat XML hash salt
> > +  *
> > +  * memory layout on 32 bit systems
> > +  *   cccccccc cccccccc cccccccc  uc
> > +  *   ppppssss ........ ........  fnv -- two Py_hash_t
> > +  *   k0k0k0k0 k1k1k1k1 ........  siphash -- two uint64_t (*)
> > +  *   ........ ........ ssss....  djbx33a -- 16 bytes padding + one
> Py_hash_t
> > +- *   ........ ........ eeee....  pyexpat XML hash salt
> > ++ *   eeeeeeee eeeeeeee eeee....  pyexpat XML hash salt
> > +  *
> > +  * (*) The siphash member may not be available on 32 bit platforms
> without
> > +  *     an unsigned int64 data type.
> > +@@ -71,7 +71,9 @@ typedef union {
> > +         Py_hash_t suffix;
> > +     } djbx33a;
> > +     struct {
> > +-        unsigned char padding[16];
> > ++        /* 16 bytes for XML_SetHashSalt16Bytes */
> > ++        uint8_t hashsalt16[16];
> > ++        /* 4/8 bytes for legacy XML_SetHashSalt */
> > +         Py_hash_t hashsalt;
> > +     } expat;
> > + } _Py_HashSecret_t;
> > +diff --git a/Modules/_elementtree.c b/Modules/_elementtree.c
> > +index b2d4b982602c583..9e794be5c109ba5 100644
> > +--- a/Modules/_elementtree.c
> > ++++ b/Modules/_elementtree.c
> > +@@ -3660,7 +3660,7 @@
> _elementtree_XMLParser___init___impl(XMLParserObject *self, PyObject
> *target,
> > +     // Prefer 16-byte entropy, only expat >=3D 2.8.0. See gh-149018
> > +     if (EXPAT(st, SetHashSalt16Bytes) !=3D NULL) {
> > +         EXPAT(st, SetHashSalt16Bytes)(self->parser,
> > +-                                      (const uint8_t
> *)_Py_HashSecret.uc);
> > ++                                      _Py_HashSecret.expat.hashsalt16=
);
> > +     }
> > +     else if (EXPAT(st, SetHashSalt) !=3D NULL) {
> > +         EXPAT(st, SetHashSalt)(self->parser,
> > +diff --git a/Modules/pyexpat.c b/Modules/pyexpat.c
> > +index 1df433e64bc096f..78efbef679024f3 100644
> > +--- a/Modules/pyexpat.c
> > ++++ b/Modules/pyexpat.c
> > +@@ -1391,8 +1391,7 @@ newxmlparseobject(pyexpat_state *state, const
> char *encoding,
> > + #if defined(XML_BACKPORT_SET_HASH_SALT_16_BYTES) \
> > +     || XML_COMBINED_VERSION >=3D 20800
> > +     /* This feature was added upstream in libexpat 2.8.0. */
> > +-    XML_SetHashSalt16Bytes(self->itself,
> > +-                           (const uint8_t *)_Py_HashSecret.uc);
> > ++    XML_SetHashSalt16Bytes(self->itself,
> _Py_HashSecret.expat.hashsalt16);
> > + #elif XML_COMBINED_VERSION >=3D 20100
> > +     /* This feature was added upstream in libexpat 2.1.0. */
> > +     XML_SetHashSalt(self->itself,
> > diff --git a/meta/recipes-devtools/python/python3_3.12.13.bb
> b/meta/recipes-devtools/python/python3_3.12.13.bb
> > index 5fa25235fe..3e5575d396 100644
> > --- a/meta/recipes-devtools/python/python3_3.12.13.bb
> > +++ b/meta/recipes-devtools/python/python3_3.12.13.bb
> > @@ -34,6 +34,8 @@ SRC_URI =3D "
> http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
> >           file://0001-test_deadlock-skip-problematic-test.patch \
> >           file://0001-test_active_children-skip-problematic-test.patch =
\
> >             file://0001-test_readline-skip-limited-history-test.patch \
> > +           file://CVE-2026-7210-1.patch \
> > +           file://CVE-2026-7210-2.patch \
> >             "
> >
> >  SRC_URI:append:class-native =3D " \
>
>
> --
> Yoann Congal
> Smile ECS
>
>

--=20
Yoann Congal
Smile ECS

--0000000000005382d00655f0bec1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 6 =
juil. 2026 =C3=A0=C2=A014:31, Amaury Couderc &lt;amaury.couderc@est.tech&gt=
; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><div class=3D"msg-5366290115774986660">




<div dir=3D"ltr">
<hr>
<div style=3D"margin-top:1em;margin-bottom:1em;font-family:Aptos,Aptos_Embe=
ddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;font-size:12pt;co=
lor:rgb(0,0,0)">
Hello Yoann,</div>
<div style=3D"margin-top:1em;margin-bottom:1em;font-family:Aptos,Aptos_Embe=
ddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;font-size:12pt;co=
lor:rgb(0,0,0)">
I&#39;ve submitted patches for CVE-2026-7210 and CVE-2026-41080 to the wryn=
ose branch. The master branch requires neither backports nor updates.</div>
<div style=3D"margin-top:1em;margin-bottom:1em;font-family:Aptos,Aptos_Embe=
ddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;font-size:12pt;co=
lor:rgb(0,0,0)">
However, the patch for CVE-2026-7210 requires the patch for CVE-2026-41080 =
for full mitigation, which I&#39;ve seen was already submitted to the scart=
hgap branch (see
<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/23783=
8?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3Acreated%2C%2CCVE-2026-41080%2C20%2C2%2C0=
%2C119168855" id=3D"m_-5366290115774986660OWA47518045-9bd6-048d-001e-3b2b20=
fb364b" rel=3D"noopener noreferrer" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-core/message/237838?p=3D%2C%2=
C%2C20%2C0%2C0%2C0%3A%3Acreated%2C%2CCVE-2026-41080%2C20%2C2%2C0%2C11916885=
5</a>), but I&#39;m uncertain whether it has been merged yet.</div>
<div style=3D"margin-top:1em;margin-bottom:1em;font-family:Aptos,Aptos_Embe=
ddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;font-size:12pt;co=
lor:rgb(0,0,0)">
Given this dependency, do you think it&#39;s still worth submitting my back=
port for CVE-2026-7210 to scarthgap?</div></div></div></blockquote><div>Yes=
 please.</div><div><br></div><div>I&#39;ll take the patch for=C2=A0CVE-2026=
-41080: (see <a href=3D"https://lore.kernel.org/all/2030b4435c8bc81bb445263=
7c0517ac33ab94d20.camel@pbarker.dev/">https://lore.kernel.org/all/2030b4435=
c8bc81bb4452637c0517ac33ab94d20.camel@pbarker.dev/</a>)</div><div>Note in y=
ou patch comment (below the &quot;---&quot;) that the patch for CVE-2026-41=
080 needs to go first.</div><div><br></div><div>Thanks!</div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"msg-5366=
290115774986660"><div dir=3D"ltr">
<div style=3D"margin-top:1em;margin-bottom:1em;font-family:Aptos,Aptos_Embe=
ddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;font-size:12pt;co=
lor:rgb(0,0,0)">
Kind Regards,</div>
<div style=3D"margin-top:1em;margin-bottom:1em;font-family:Aptos,Aptos_Embe=
ddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;font-size:12pt;co=
lor:rgb(0,0,0)">
Amaury</div>
<div id=3D"m_-5366290115774986660appendonsend"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_-5366290115774986660divRplyFwdMsg" dir=3D"ltr"><font face=3D"C=
alibri, sans-serif" style=3D"font-size:11pt" color=3D"#000000"><b>From:</b>=
 Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" target=3D"_blank=
">yoann.congal@smile.fr</a>&gt;<br>
<b>Sent:</b> Wednesday, 17 June 2026 01:37<br>
<b>To:</b> Amaury Couderc &lt;amaury.couderc@est.tech&gt;; <a href=3D"mailt=
o:openembedded-core@lists.openembedded.org" target=3D"_blank">openembedded-=
core@lists.openembedded.org</a> &lt;<a href=3D"mailto:openembedded-core@lis=
ts.openembedded.org" target=3D"_blank">openembedded-core@lists.openembedded=
.org</a>&gt;<br>
<b>Subject:</b> Re: [PATCH v2 2/2][OE-core][scarthgap] python3: fix CVE-202=
6-7210</font>
<div>=C2=A0</div>
</div>
<div><font size=3D"2"><span style=3D"font-size:11pt">
<div>On Mon Jun 15, 2026 at 8:36 AM CEST, Amaury Couderc via <a href=3D"htt=
p://lists.openembedded.org" target=3D"_blank">lists.openembedded.org</a> wr=
ote:<br>
&gt; From: Amaury Couderc &lt;amaury.couderc@est.tech&gt;<br>
&gt;<br>
&gt; Backport patch to fix CVE-2026-7210.<br>
&gt;=C2=A0=C2=A0 <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-7210"=
 target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2026-7210</a><br>
&gt;<br>
&gt; In order to mitigate CVE-2026-7210 this patch should come alongside <b=
r>
&gt; the associated expat one which backports to expat 2.6.4 the fixes <br>
&gt; introduced in expat 2.8.0.<br>
&gt;<br>
&gt; Upstream fixes:<br>
&gt;=C2=A0=C2=A0 <a href=3D"https://github.com/python/cpython/pull/149023/c=
ommits/03794ce9a58b1f33751c88d7d876dfbf27645c56" target=3D"_blank">
https://github.com/python/cpython/pull/149023/commits/03794ce9a58b1f33751c8=
8d7d876dfbf27645c56</a><br>
&gt;=C2=A0=C2=A0 <a href=3D"https://github.com/python/cpython/pull/149023/c=
ommits/ccb8d2f7df9534e49a43554193d7f5f4d993189c" target=3D"_blank">
https://github.com/python/cpython/pull/149023/commits/ccb8d2f7df9534e49a435=
54193d7f5f4d993189c</a><br>
<br>
Hello,<br>
<br>
If I&#39;m not mistaken those fixes are in 3.14.6 or the future 3.15 and<br=
>
neither are in wrynose nor master. Can you please send a fix for those<br>
branches (either backport or upgrade), and, then, ping back here?<br>
<br>
Thanks!<br>
<br>
&gt;<br>
&gt;<br>
&gt; Signed-off-by: Amaury Couderc &lt;amaury.couderc@est.tech&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../python/python3/CVE-2026-7210-1.patch=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 90 +++++++++++++++++++<br>
&gt;=C2=A0 .../python/python3/CVE-2026-7210-2.patch=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 74 +++++++++++++++<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3_3.12.13.bb" target=3D"_blan=
k">python3_3.12.13.bb</a>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +<br>
&gt;=C2=A0 3 files changed, 166 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026=
-7210-1.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026=
-7210-2.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/python/python3/CVE-2026-7210-1.patc=
h b/meta/recipes-devtools/python/python3/CVE-2026-7210-1.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..63aac320af<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/python/python3/CVE-2026-7210-1.patch<br>
&gt; @@ -0,0 +1,90 @@<br>
&gt; +From 03794ce9a58b1f33751c88d7d876dfbf27645c56 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Stan Ulbrych &lt;<a href=3D"mailto:stan@python.org" target=3D"_=
blank">stan@python.org</a>&gt;<br>
&gt; +Date: Sun, 26 Apr 2026 19:31:25 +0100<br>
&gt; +Subject: [PATCH] Use `XML_SetHashSalt16Bytes` from libExpat when poss=
ible<br>
&gt; +<br>
&gt; +CVE: CVE-2026-7210<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/python/cpyth=
on/pull/149023/commits/03794ce9a58b1f33751c88d7d876dfbf27645c56" target=3D"=
_blank">https://github.com/python/cpython/pull/149023/commits/03794ce9a58b1=
f33751c88d7d876dfbf27645c56</a>] with downstream extension
 for XML_BACKPORT_SET_HASH_SALT_16_BYTES detection<br>
&gt; +<br>
&gt; +Signed-off-by: Amaury Couderc &lt;amaury.couderc@est.tech&gt;<br>
&gt; +---<br>
&gt; + Include/pyexpat.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 3 +++<br>
&gt; + .../2026-04-26-19-30-45.gh-issue-149018.a9SqWb.rst=C2=A0=C2=A0 |=C2=
=A0 3 +++<br>
&gt; + Modules/_elementtree.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
8 ++++++--<br>
&gt; + Modules/pyexpat.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 11 ++++++++++-<br>
&gt; + 4 files changed, 22 insertions(+), 3 deletions(-)<br>
&gt; + create mode 100644 Misc/NEWS.d/next/Security/2026-04-26-19-30-45.gh-=
issue-149018.a9SqWb.rst<br>
&gt; +<br>
&gt; +diff --git a/Include/pyexpat.h b/Include/pyexpat.h<br>
&gt; +index f523f8bb273983a..a676e16a7a457ea 100644<br>
&gt; +--- a/Include/pyexpat.h<br>
&gt; ++++ b/Include/pyexpat.h<br>
&gt; +@@ -57,6 +57,9 @@ struct PyExpat_CAPI<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XML_Parser parser, u=
nsigned long long activationThresholdBytes);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 XML_Bool (*SetAllocTrackerMaximumAmplificati=
on)(<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XML_Parser parser, f=
loat maxAmplificationFactor);<br>
&gt; ++=C2=A0=C2=A0=C2=A0 /* might be NULL for expat &lt; 2.8.0 */<br>
&gt; ++=C2=A0=C2=A0=C2=A0 XML_Bool (*SetHashSalt16Bytes)(<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XML_Parser parser, const =
uint8_t entropy[16]);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 /* always add new stuff to the end! */<br>
&gt; + };<br>
&gt; + <br>
&gt; +diff --git a/Misc/NEWS.d/next/Security/2026-04-26-19-30-45.gh-issue-1=
49018.a9SqWb.rst b/Misc/NEWS.d/next/Security/2026-04-26-19-30-45.gh-issue-1=
49018.a9SqWb.rst<br>
&gt; +new file mode 100644<br>
&gt; +index 000000000000000..d1b5b368684e6a5<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/Misc/NEWS.d/next/Security/2026-04-26-19-30-45.gh-issue-149018.a=
9SqWb.rst<br>
&gt; +@@ -0,0 +1,3 @@<br>
&gt; ++Improved protection against XML hash-flooding attacks in<br>
&gt; ++:mod:`xml.parsers.expat` and :mod:`xml.etree.ElementTree` when Pytho=
n is<br>
&gt; ++compiled with libExpat 2.8.0 or later.<br>
&gt; +diff --git a/Modules/_elementtree.c b/Modules/_elementtree.c<br>
&gt; +index cbd1e026df27227..b2d4b982602c583 100644<br>
&gt; +--- a/Modules/_elementtree.c<br>
&gt; ++++ b/Modules/_elementtree.c<br>
&gt; +@@ -3657,8 +3657,12 @@ _elementtree_XMLParser___init___impl(XMLParser=
Object *self, PyObject *target,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PyErr_NoMemory();<br=
>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -1;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; +-=C2=A0=C2=A0=C2=A0 /* expat &lt; 2.1.0 has no XML_SetHashSalt() */<b=
r>
&gt; +-=C2=A0=C2=A0=C2=A0 if (EXPAT(st, SetHashSalt) !=3D NULL) {<br>
&gt; ++=C2=A0=C2=A0=C2=A0 // Prefer 16-byte entropy, only expat &gt;=3D 2.8=
.0. See gh-149018<br>
&gt; ++=C2=A0=C2=A0=C2=A0 if (EXPAT(st, SetHashSalt16Bytes) !=3D NULL) {<br=
>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EXPAT(st, SetHashSalt16By=
tes)(self-&gt;parser,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 (const uint8_t *)_Py_HashSecret.uc);<br>
&gt; ++=C2=A0=C2=A0=C2=A0 }<br>
&gt; ++=C2=A0=C2=A0=C2=A0 else if (EXPAT(st, SetHashSalt) !=3D NULL) {<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EXPAT(st, SetHashSal=
t)(self-&gt;parser,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 (unsigned long)_Py_HashSecret.expat.hashsalt);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; +diff --git a/Modules/pyexpat.c b/Modules/pyexpat.c<br>
&gt; +index 0f0afe17513ef1c..1df433e64bc096f 100644<br>
&gt; +--- a/Modules/pyexpat.c<br>
&gt; ++++ b/Modules/pyexpat.c<br>
&gt; +@@ -1388,7 +1388,12 @@ newxmlparseobject(pyexpat_state *state, const =
char *encoding,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Py_DECREF(self);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NULL;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; +-#if XML_COMBINED_VERSION &gt;=3D 20100<br>
&gt; ++#if defined(XML_BACKPORT_SET_HASH_SALT_16_BYTES) \<br>
&gt; ++=C2=A0=C2=A0=C2=A0 || XML_COMBINED_VERSION &gt;=3D 20800<br>
&gt; ++=C2=A0=C2=A0=C2=A0 /* This feature was added upstream in libexpat 2.=
8.0. */<br>
&gt; ++=C2=A0=C2=A0=C2=A0 XML_SetHashSalt16Bytes(self-&gt;itself,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 (const uint8_t *)_Py_HashSecret.uc);<br>
&gt; ++#elif XML_COMBINED_VERSION &gt;=3D 20100<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 /* This feature was added upstream in libexp=
at 2.1.0. */<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 XML_SetHashSalt(self-&gt;itself,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (unsigned long)_Py_Hash=
Secret.expat.hashsalt);<br>
&gt; +@@ -2257,6 +2262,12 @@ pyexpat_exec(PyObject *mod)<br>
&gt; + #else<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 capi-&gt;SetHashSalt =3D NULL;<br>
&gt; + #endif<br>
&gt; ++#if defined(XML_BACKPORT_SET_HASH_SALT_16_BYTES) \<br>
&gt; ++=C2=A0=C2=A0=C2=A0 || XML_COMBINED_VERSION &gt;=3D 20800<br>
&gt; ++=C2=A0=C2=A0=C2=A0 capi-&gt;SetHashSalt16Bytes =3D XML_SetHashSalt16=
Bytes;<br>
&gt; ++#else<br>
&gt; ++=C2=A0=C2=A0=C2=A0 capi-&gt;SetHashSalt16Bytes =3D NULL;<br>
&gt; ++#endif<br>
&gt; + #if XML_COMBINED_VERSION &gt;=3D 20600<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 capi-&gt;SetReparseDeferralEnabled =3D XML_S=
etReparseDeferralEnabled;<br>
&gt; + #else<br>
&gt; diff --git a/meta/recipes-devtools/python/python3/CVE-2026-7210-2.patc=
h b/meta/recipes-devtools/python/python3/CVE-2026-7210-2.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..e9a10d3705<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/python/python3/CVE-2026-7210-2.patch<br>
&gt; @@ -0,0 +1,74 @@<br>
&gt; +From ccb8d2f7df9534e49a43554193d7f5f4d993189c Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Stan Ulbrych &lt;<a href=3D"mailto:stan@python.org" target=3D"_=
blank">stan@python.org</a>&gt;<br>
&gt; +Date: Sun, 26 Apr 2026 19:42:01 +0100<br>
&gt; +Subject: [PATCH] Add `_Py_HashSecret_t.expat.hashsalt16` instead<br>
&gt; +<br>
&gt; +CVE: CVE-2026-7210<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/python/cpyth=
on/pull/149023/commits/ccb8d2f7df9534e49a43554193d7f5f4d993189c" target=3D"=
_blank">https://github.com/python/cpython/pull/149023/commits/ccb8d2f7df953=
4e49a43554193d7f5f4d993189c</a>]<br>
&gt; +<br>
&gt; +Signed-off-by: Amaury Couderc &lt;amaury.couderc@est.tech&gt;<br>
&gt; +---<br>
&gt; + Include/pyhash.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 8 +++++---<br=
>
&gt; + Modules/_elementtree.c | 2 +-<br>
&gt; + Modules/pyexpat.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 3 +--<br>
&gt; + 3 files changed, 7 insertions(+), 6 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/Include/pyhash.h b/Include/pyhash.h<br>
&gt; +index 84cb72fa6fd1b26..3056dc44cc0f1b1 100644<br>
&gt; +--- a/Include/pyhash.h<br>
&gt; ++++ b/Include/pyhash.h<br>
&gt; +@@ -39,14 +39,14 @@<br>
&gt; +=C2=A0 *=C2=A0=C2=A0 pppppppp ssssssss ........=C2=A0 fnv -- two Py_h=
ash_t<br>
&gt; +=C2=A0 *=C2=A0=C2=A0 k0k0k0k0 k1k1k1k1 ........=C2=A0 siphash -- two =
uint64_t<br>
&gt; +=C2=A0 *=C2=A0=C2=A0 ........ ........ ssssssss=C2=A0 djbx33a -- 16 b=
ytes padding + one Py_hash_t<br>
&gt; +- *=C2=A0=C2=A0 ........ ........ eeeeeeee=C2=A0 pyexpat XML hash sal=
t<br>
&gt; ++ *=C2=A0=C2=A0 eeeeeeee eeeeeeee eeeeeeee=C2=A0 pyexpat XML hash sal=
t<br>
&gt; +=C2=A0 *<br>
&gt; +=C2=A0 * memory layout on 32 bit systems<br>
&gt; +=C2=A0 *=C2=A0=C2=A0 cccccccc cccccccc cccccccc=C2=A0 uc<br>
&gt; +=C2=A0 *=C2=A0=C2=A0 ppppssss ........ ........=C2=A0 fnv -- two Py_h=
ash_t<br>
&gt; +=C2=A0 *=C2=A0=C2=A0 k0k0k0k0 k1k1k1k1 ........=C2=A0 siphash -- two =
uint64_t (*)<br>
&gt; +=C2=A0 *=C2=A0=C2=A0 ........ ........ ssss....=C2=A0 djbx33a -- 16 b=
ytes padding + one Py_hash_t<br>
&gt; +- *=C2=A0=C2=A0 ........ ........ eeee....=C2=A0 pyexpat XML hash sal=
t<br>
&gt; ++ *=C2=A0=C2=A0 eeeeeeee eeeeeeee eeee....=C2=A0 pyexpat XML hash sal=
t<br>
&gt; +=C2=A0 *<br>
&gt; +=C2=A0 * (*) The siphash member may not be available on 32 bit platfo=
rms without<br>
&gt; +=C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0 an unsigned int64 data type.<br>
&gt; +@@ -71,7 +71,9 @@ typedef union {<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Py_hash_t suffix;<br=
>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 } djbx33a;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 struct {<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned char padding[16]=
;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* 16 bytes for XML_SetHa=
shSalt16Bytes */<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint8_t hashsalt16[16];<b=
r>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* 4/8 bytes for legacy X=
ML_SetHashSalt */<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Py_hash_t hashsalt;<=
br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 } expat;<br>
&gt; + } _Py_HashSecret_t;<br>
&gt; +diff --git a/Modules/_elementtree.c b/Modules/_elementtree.c<br>
&gt; +index b2d4b982602c583..9e794be5c109ba5 100644<br>
&gt; +--- a/Modules/_elementtree.c<br>
&gt; ++++ b/Modules/_elementtree.c<br>
&gt; +@@ -3660,7 +3660,7 @@ _elementtree_XMLParser___init___impl(XMLParserO=
bject *self, PyObject *target,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 // Prefer 16-byte entropy, only expat &gt;=
=3D 2.8.0. See gh-149018<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 if (EXPAT(st, SetHashSalt16Bytes) !=3D NULL)=
 {<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EXPAT(st, SetHashSal=
t16Bytes)(self-&gt;parser,<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 (const uint8_t *)_Py_HashSecret.uc);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 _Py_HashSecret.expat.hashsalt16);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 else if (EXPAT(st, SetHashSalt) !=3D NULL) {=
<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EXPAT(st, SetHashSal=
t)(self-&gt;parser,<br>
&gt; +diff --git a/Modules/pyexpat.c b/Modules/pyexpat.c<br>
&gt; +index 1df433e64bc096f..78efbef679024f3 100644<br>
&gt; +--- a/Modules/pyexpat.c<br>
&gt; ++++ b/Modules/pyexpat.c<br>
&gt; +@@ -1391,8 +1391,7 @@ newxmlparseobject(pyexpat_state *state, const c=
har *encoding,<br>
&gt; + #if defined(XML_BACKPORT_SET_HASH_SALT_16_BYTES) \<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 || XML_COMBINED_VERSION &gt;=3D 20800<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 /* This feature was added upstream in libexp=
at 2.8.0. */<br>
&gt; +-=C2=A0=C2=A0=C2=A0 XML_SetHashSalt16Bytes(self-&gt;itself,<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 (const uint8_t *)_Py_HashSecret.uc);<br>
&gt; ++=C2=A0=C2=A0=C2=A0 XML_SetHashSalt16Bytes(self-&gt;itself, _Py_HashS=
ecret.expat.hashsalt16);<br>
&gt; + #elif XML_COMBINED_VERSION &gt;=3D 20100<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 /* This feature was added upstream in libexp=
at 2.1.0. */<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 XML_SetHashSalt(self-&gt;itself,<br>
&gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3_3.=
12.13.bb" target=3D"_blank">python3_3.12.13.bb</a> b/meta/recipes-devtools/=
python/<a href=3D"http://python3_3.12.13.bb" target=3D"_blank">python3_3.12=
.13.bb</a><br>
&gt; index 5fa25235fe..3e5575d396 100644<br>
&gt; --- a/meta/recipes-devtools/python/<a href=3D"http://python3_3.12.13.b=
b" target=3D"_blank">python3_3.12.13.bb</a><br>
&gt; +++ b/meta/recipes-devtools/python/<a href=3D"http://python3_3.12.13.b=
b" target=3D"_blank">python3_3.12.13.bb</a><br>
&gt; @@ -34,6 +34,8 @@ SRC_URI =3D &quot;<a></a><a href=3D"http://www.pytho=
n.org/ftp/python/$%7BPV%7D/Python-$%7BPV%7D.tar.xz" target=3D"_blank">http:=
//www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz</a> \<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a>file://=
0001-test_deadlock-skip-problematic-test.patch</a> \<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a>
file://0001-test_active_children-skip-problematic-test.patch</a> \<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 <a>
file://0001-test_readline-skip-limited-history-test.patch</a> \<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a>file:=
//CVE-2026-7210-1.patch</a>=C2=A0\<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a>file:=
//CVE-2026-7210-2.patch</a>=C2=A0\<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 &quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 SRC_URI:append:class-native =3D &quot; \<br>
<br>
<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</span></font></div>
</div>

</div></blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gm=
ail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signatu=
re"><div dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><di=
v><font face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--0000000000005382d00655f0bec1--

