Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6141DC4450A
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 01:38:24 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4691.1784252283598949201
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 18:38:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Mvz2DPfr;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-81e86df8987so15197407b3.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 18:38:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784252283; cv=none;
        d=google.com; s=arc-20260327;
        b=PQtbIUAahRKIJT2uEy8XHFgp6E2ghbpaoOgUYvAK2ZRYcuHGGDdor+ubGa6zQ1jGV9
         kLq1XvK2N7DkuKHoy2IwqbdwMI5et239RGPc974a/uQF77eFVLwzKZ02U8hiu/F2VoGS
         QMoe3XZs7wIr2z8uzb24LRjwQFAx6rVAnB6d6J9RLqpf+TeKpuHYyGqZ9T5k5fsAhWEo
         MkyEHEB+l17ZkraHATnXqRDqKE09V1t/47gjZc7ZLCPmW0dVglhOi5hRW6GqrxiH9V0Q
         U+mG/9BDiEK/kqS1ZrbBxPQCYLUFLTuBbe28xHFskMdyA9H0V95f5P1oarJ4fUW37Vqw
         YZ6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Dt9rD1JxGef6CCvhBF2T55a/W4JGhHlqy8N7XNsUG1M=;
        fh=7/CO4mOdzNKFp2HvPCCS878A2fj1MW1vh6R/iOgmXNU=;
        b=im+2dh5516q38WwLSqv1yz+CtE7SMBXKIalf2bhfvAUyEMc7Bae8BfG6HEh5wVc/QF
         446/FIQKIYTMEwSDz5QSwKUmwgjHDcHocKeSJOH5NMSA1HF6mL/xrmq960snEg/Ne8Cu
         n0lhdlNKLePgUHfO/b2v0symQVh0tgaXIdqVoxKASlG5m/QYijm51Q5vBqwC9dezYJN1
         P3rJb3sqzfz2pVP6tz2U+rs9VsYE6jxKRy2SiGBcNYg62wL63Hq5z89ZqqU6TrWZ0CAK
         Z8p+uBri2TF4ESo4WwEMpdZfZTB4az/mCg+Vd9zFQBTQI9qQBvtSZu/ANQQ5isFyJ3d3
         u3Qg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784252282; x=1784857082; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dt9rD1JxGef6CCvhBF2T55a/W4JGhHlqy8N7XNsUG1M=;
        b=Mvz2DPfrRDa45yHhVSl0ll+nFAtPzTiKCOjjI8BIa+0NofA9scF/zuwdws5i+9J0iU
         OV9EagLxLMG185p2EG100p1OjK7cuhJY1Ap+wEWVaQjFkH8ql2FN1nmAtwHA+YVB44Rc
         TlKA+qn3Ee+Pd2Dy2WH4uDdAJOx7diyJwjbCLR6Fxitmu8bCNdjfcj585htBzZvRc6DI
         tAJbQeuVknm/U8oP5ctQZIn/Hqm2mis6ZRDCpDUCwQ2rVMen2QXk4a/uxig1Od2B+/SH
         MfWIYh89c8dyyKGy0nBl+y9oGJQ3hX9pi3zyy0rH/5++MtY5rch/JqxekeueMuOBGC/x
         KNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784252282; x=1784857082;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Dt9rD1JxGef6CCvhBF2T55a/W4JGhHlqy8N7XNsUG1M=;
        b=rUITBwEMC8JawnSCsjZuE2kW9xfgptXxCXGbO/J6xH8aVvtH6I23Ud0XJn+zdd0pS8
         LW9AEeDUGR7pP4koTApL0Rgy5kA3tGFw3Fj8C8Q/QRUmU+g6LV4leXgVxgCfuOODMXld
         R58asMQx7JY7dZeziL8jKd2t1wyvjWrJq+saIRsiAPvQ2ha59Qxcg7FsLTo0uTFnRncV
         qbRzDOe4gUklLH3mOUqaosX6x3m0fv8tJ0QKClEXD3SihUt1AJUNgZDG5yJ50pBRID8f
         Zu2FXkaXXeky4+kPUnw96CUH71/j+Xylg8m9L3H9TJwxQQSFlwgeDn7Y+WVVB6sqAGdl
         kVOQ==
X-Gm-Message-State: AOJu0YxbjmGSLUmjYk9CuCbPHVAz6r4mJ5rS+GTTuJnqLqdeQbSkvcAJ
	AwB7yU0gbRzUWftYatjiPAhbo56b9J70olSjLEVyFWS1xVgLAndWiH+8IW06OSqS7rX0G7DFX0E
	Ovg2F0w6yqQ0scj0Uvo+j09mQWRXaBVo=
X-Gm-Gg: AfdE7clSqEfblz7igY6aZ1kOBeUq5e/ctjc04n5YRGWIBp9NCG2463gF+IkFijh4YeB
	Z6eUQIj+O5qHEcB05XUG6s/EcogXmJWYEC8FBAByoIIcz7nkeire0mo5Yj88ccj2sxwjxQ+F6J8
	r9xtExBo9y2iZh3qiQOjt3AohFSN9VLkFRhPMm18nSjvuQbbEZ5h1JieV5/yLkl0yheLRyT15rD
	HbOU825FmgvPZ3q5R1tSc96fJhy54KM7nbv1HBA3+/VadikXitgKnQu5mAc0oOWKG2WyNx6/Qsz
	94ugJYNCOJEFDhwM8zfsHpQKEupLfit4Mfg7BxYOs+g8g8zvvkyZO7HGA8z6ePcRt/ijs6dSLa3
	0dK2Tb0NB8ZQyGFBnvBObMuEtTZjqL6Vl/nQoCB2kRm1t502XY937Hxb0aw==
X-Received: by 2002:a05:690c:3613:b0:80c:85e5:875e with SMTP id
 00721157ae682-81ef28dd35amr573017b3.71.1784252282485; Thu, 16 Jul 2026
 18:38:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260714190405.3328796-1-JPEWhacker@gmail.com>
 <20260715164739.364323-1-JPEWhacker@gmail.com> <20260715164739.364323-10-JPEWhacker@gmail.com>
In-Reply-To: <20260715164739.364323-10-JPEWhacker@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 16 Jul 2026 18:36:54 -0700
X-Gm-Features: AUfX_mwGYvmRVlj0HpgCkcN2LKQi42wMH_nS-Ac4RL9YHUMpuG1Uuq8Ao8GeBHY
Message-ID: <CAMKF1spoYgnQxcOefG7z_-RcZjWuKB1essRZAnmF+8Pe=_Qanw@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2 09/25] gcc: Update license
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000007cc0e20656c49b35"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 01:38:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241112

--0000000000007cc0e20656c49b35
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

One thing worth considering

The new expression carries only "GPL-3.0-or-later WITH GCC-exception-3.1"
for the GPLv3 part, i.e. the standalone GPL-3.0 term is gone. The gcc
compiler binaries themselves are GPL-3.0-or-later *without* the runtime
exception -- the exception only extends to the target runtime object
code -- and this .inc feeds gcc/gcc-cross/gcc-source, not just the
runtime. So a strict reading wants a bare GPL-3.0-or-later term
alongside the WITH form, e.g.

    LICENSE =3D "GPL-2.0-or-later AND LGPL-2.1-or-later AND \
               GPL-3.0-or-later AND \
               GPL-3.0-or-later WITH GCC-exception-3.1 AND \
               LGPL-3.0-or-later"

It's a minor point since COPYING3 is already covered file-wise and the
runtime recipes carry their own precise licenses, but it is a real
semantic change (also -only -> -or-later) that could use a line in the
commit message.

Thanks,
Khem

On Wed, Jul 15, 2026, 9:47=E2=80=AFAM Joshua Watt via lists.openembedded.or=
g
<JPEWhacker=3Dgmail.com@lists.openembedded.org> wrote:

> GPL-3.0-with-GCC-exception is a deprecated license ID, so replace it
> with "GPL-3.0-or-later WITH GCC-exception-3.1".
>
> Also, the LICENSE expression in gcc.inc appears to be incomplete,
> missing GPL-2.0-or-later, LGPL-2.1-or-later, and LGPL-3.0-or-later, even
> though the checksums for their corresponding license files are clearly
> checked in LIC_FILES_CHKSUM.
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/recipes-devtools/gcc/gcc-16.1.inc       | 2 +-
>  meta/recipes-devtools/gcc/gcc-runtime.inc    | 4 ++--
>  meta/recipes-devtools/gcc/libgcc-initial.inc | 2 +-
>  meta/recipes-devtools/gcc/libgcc.inc         | 8 ++++----
>  meta/recipes-devtools/gcc/libgfortran.inc    | 6 +++---
>  5 files changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-16.1.inc
> b/meta/recipes-devtools/gcc/gcc-16.1.inc
> index 4598aff045..a82e993f08 100644
> --- a/meta/recipes-devtools/gcc/gcc-16.1.inc
> +++ b/meta/recipes-devtools/gcc/gcc-16.1.inc
> @@ -16,7 +16,7 @@ TOOLCHAIN_NATIVE =3D "gcc"
>  DEPENDS =3D+ "mpfr gmp libmpc zlib zstd flex-native"
>  NATIVEDEPS =3D "mpfr-native gmp-native libmpc-native zlib-native
> flex-native zstd-native"
>
> -LICENSE =3D "GPL-3.0-with-GCC-exception & GPL-3.0-only"
> +LICENSE =3D "GPL-2.0-or-later AND LGPL-2.1-or-later AND GPL-3.0-or-later
> WITH GCC-exception-3.1 AND LGPL-3.0-or-later"
>
>  LIC_FILES_CHKSUM =3D "\
>      file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6552 \
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc
> b/meta/recipes-devtools/gcc/gcc-runtime.inc
> index e305180c64..cb62fab489 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> @@ -4,11 +4,11 @@ SUMMARY =3D "Runtime libraries from GCC"
>
>  # Over-ride the LICENSE set by gcc-${PV}.inc to remove "& GPLv3"
>  # All gcc-runtime packages are now covered by the runtime exception.
> -LICENSE =3D "GPL-3.0-with-GCC-exception"
> +LICENSE =3D "GPL-3.0-or-later WITH GCC-exception-3.1"
>
>  CXXFLAGS:remove =3D "-fvisibility-inlines-hidden"
>  CFLAGS:append =3D " -Wno-error=3Ddiscarded-qualifiers"
> -
> +
>  EXTRA_OECONF_PATHS =3D "\
>      --with-gxx-include-dir=3D${includedir}/c++/${BINV} \
>      --with-sysroot=3D/not/exist \
> diff --git a/meta/recipes-devtools/gcc/libgcc-initial.inc
> b/meta/recipes-devtools/gcc/libgcc-initial.inc
> index ce100d7ddc..d067f7eb00 100644
> --- a/meta/recipes-devtools/gcc/libgcc-initial.inc
> +++ b/meta/recipes-devtools/gcc/libgcc-initial.inc
> @@ -31,7 +31,7 @@ require libgcc-common.inc
>
>  DEPENDS =3D "virtual/cross-cc"
>
> -LICENSE =3D "GPL-3.0-with-GCC-exception"
> +LICENSE =3D "GPL-3.0-or-later WITH GCC-exception-3.1"
>
>  PACKAGES =3D ""
>
> diff --git a/meta/recipes-devtools/gcc/libgcc.inc
> b/meta/recipes-devtools/gcc/libgcc.inc
> index 74e8746b42..e92dadf021 100644
> --- a/meta/recipes-devtools/gcc/libgcc.inc
> +++ b/meta/recipes-devtools/gcc/libgcc.inc
> @@ -32,10 +32,10 @@ PACKAGES =3D "\
>
>  # All libgcc source is marked with the exception.
>  #
> -LICENSE:${PN} =3D "GPL-3.0-with-GCC-exception"
> -LICENSE:${PN}-dev =3D "GPL-3.0-with-GCC-exception"
> -LICENSE:${PN}-dbg =3D "GPL-3.0-with-GCC-exception"
> -LICENSE:${PN}-src =3D "GPL-3.0-with-GCC-exception"
> +LICENSE:${PN} =3D "GPL-3.0-or-later WITH GCC-exception-3.1"
> +LICENSE:${PN}-dev =3D "GPL-3.0-or-later WITH GCC-exception-3.1"
> +LICENSE:${PN}-dbg =3D "GPL-3.0-or-later WITH GCC-exception-3.1"
> +LICENSE:${PN}-src =3D "GPL-3.0-or-later WITH GCC-exception-3.1"
>
>  FILES:${PN}-dev =3D "\
>      ${base_libdir}/libgcc*.so \
> diff --git a/meta/recipes-devtools/gcc/libgfortran.inc
> b/meta/recipes-devtools/gcc/libgfortran.inc
> index fa6aecaaa3..1726b40c6a 100644
> --- a/meta/recipes-devtools/gcc/libgfortran.inc
> +++ b/meta/recipes-devtools/gcc/libgfortran.inc
> @@ -60,9 +60,9 @@ PACKAGES =3D "\
>      libgfortran-staticdev \
>  "
>
> -LICENSE:${PN} =3D "GPL-3.0-with-GCC-exception"
> -LICENSE:${PN}-dev =3D "GPL-3.0-with-GCC-exception"
> -LICENSE:${PN}-dbg =3D "GPL-3.0-with-GCC-exception"
> +LICENSE:${PN} =3D "GPL-3.0-or-later WITH GCC-exception-3.1"
> +LICENSE:${PN}-dev =3D "GPL-3.0-or-later WITH GCC-exception-3.1"
> +LICENSE:${PN}-dbg =3D "GPL-3.0-or-later WITH GCC-exception-3.1"
>
>  FILES:${PN} =3D "${libdir}/libgfortran.so.*"
>  FILES:${PN}-dev =3D "\
> --
> 2.54.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#241002):
> https://lists.openembedded.org/g/openembedded-core/message/241002
> Mute This Topic: https://lists.openembedded.org/mt/120285157/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000007cc0e20656c49b35
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto"><br></div><div dir=3D"auto">One thing w=
orth considering</div><div dir=3D"auto"><br></div><div dir=3D"auto">The new=
 expression carries only &quot;GPL-3.0-or-later WITH GCC-exception-3.1&quot=
;</div><div dir=3D"auto">for the GPLv3 part, i.e. the standalone GPL-3.0 te=
rm is gone. The gcc</div><div dir=3D"auto">compiler binaries themselves are=
 GPL-3.0-or-later *without* the runtime</div><div dir=3D"auto">exception --=
 the exception only extends to the target runtime object</div><div dir=3D"a=
uto">code -- and this .inc feeds gcc/gcc-cross/gcc-source, not just the</di=
v><div dir=3D"auto">runtime. So a strict reading wants a bare GPL-3.0-or-la=
ter term</div><div dir=3D"auto">alongside the WITH form, e.g.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">=C2=A0 =C2=A0 LICENSE =3D &quot;GPL-2=
.0-or-later AND LGPL-2.1-or-later AND \</div><div dir=3D"auto">=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GPL-3.0-or-later AND \</div><d=
iv dir=3D"auto">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GPL-=
3.0-or-later WITH GCC-exception-3.1 AND \</div><div dir=3D"auto">=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LGPL-3.0-or-later&quot;</div><=
div dir=3D"auto"><br></div><div dir=3D"auto">It&#39;s a minor point since C=
OPYING3 is already covered file-wise and the</div><div dir=3D"auto">runtime=
 recipes carry their own precise licenses, but it is a real</div><div dir=
=3D"auto">semantic change (also -only -&gt; -or-later) that could use a lin=
e in the</div><div dir=3D"auto">commit message.</div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">Thanks,</div><div dir=3D"auto">Khem</div></div><br>=
<div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"=
gmail_attr">On Wed, Jul 15, 2026, 9:47=E2=80=AFAM Joshua Watt via <a href=
=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;JPEWhacke=
r=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.ope=
nembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">GPL-3.0-with-GCC-exception is a deprecated license ID, so repl=
ace it<br>
with &quot;GPL-3.0-or-later WITH GCC-exception-3.1&quot;.<br>
<br>
Also, the LICENSE expression in gcc.inc appears to be incomplete,<br>
missing GPL-2.0-or-later, LGPL-2.1-or-later, and LGPL-3.0-or-later, even<br=
>
though the checksums for their corresponding license files are clearly<br>
checked in LIC_FILES_CHKSUM.<br>
<br>
Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com" targ=
et=3D"_blank" rel=3D"noreferrer">JPEWhacker@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/gcc/gcc-16.1.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 =
+-<br>
=C2=A0meta/recipes-devtools/gcc/gcc-runtime.inc=C2=A0 =C2=A0 | 4 ++--<br>
=C2=A0meta/recipes-devtools/gcc/libgcc-initial.inc | 2 +-<br>
=C2=A0meta/recipes-devtools/gcc/libgcc.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 8 ++++----<br>
=C2=A0meta/recipes-devtools/gcc/libgfortran.inc=C2=A0 =C2=A0 | 6 +++---<br>
=C2=A05 files changed, 11 insertions(+), 11 deletions(-)<br>
<br>
diff --git a/meta/recipes-devtools/gcc/gcc-16.1.inc b/meta/recipes-devtools=
/gcc/gcc-16.1.inc<br>
index 4598aff045..a82e993f08 100644<br>
--- a/meta/recipes-devtools/gcc/gcc-16.1.inc<br>
+++ b/meta/recipes-devtools/gcc/gcc-16.1.inc<br>
@@ -16,7 +16,7 @@ TOOLCHAIN_NATIVE =3D &quot;gcc&quot;<br>
=C2=A0DEPENDS =3D+ &quot;mpfr gmp libmpc zlib zstd flex-native&quot;<br>
=C2=A0NATIVEDEPS =3D &quot;mpfr-native gmp-native libmpc-native zlib-native=
 flex-native zstd-native&quot;<br>
<br>
-LICENSE =3D &quot;GPL-3.0-with-GCC-exception &amp; GPL-3.0-only&quot;<br>
+LICENSE =3D &quot;GPL-2.0-or-later AND LGPL-2.1-or-later AND GPL-3.0-or-la=
ter WITH GCC-exception-3.1 AND LGPL-3.0-or-later&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6552 \=
<br>
diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devto=
ols/gcc/gcc-runtime.inc<br>
index e305180c64..cb62fab489 100644<br>
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc<br>
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc<br>
@@ -4,11 +4,11 @@ SUMMARY =3D &quot;Runtime libraries from GCC&quot;<br>
<br>
=C2=A0# Over-ride the LICENSE set by gcc-${PV}.inc to remove &quot;&amp; GP=
Lv3&quot;<br>
=C2=A0# All gcc-runtime packages are now covered by the runtime exception.<=
br>
-LICENSE =3D &quot;GPL-3.0-with-GCC-exception&quot;<br>
+LICENSE =3D &quot;GPL-3.0-or-later WITH GCC-exception-3.1&quot;<br>
<br>
=C2=A0CXXFLAGS:remove =3D &quot;-fvisibility-inlines-hidden&quot;<br>
=C2=A0CFLAGS:append =3D &quot; -Wno-error=3Ddiscarded-qualifiers&quot;<br>
- <br>
+<br>
=C2=A0EXTRA_OECONF_PATHS =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0--with-gxx-include-dir=3D${includedir}/c++/${BINV} \<br=
>
=C2=A0 =C2=A0 =C2=A0--with-sysroot=3D/not/exist \<br>
diff --git a/meta/recipes-devtools/gcc/libgcc-initial.inc b/meta/recipes-de=
vtools/gcc/libgcc-initial.inc<br>
index ce100d7ddc..d067f7eb00 100644<br>
--- a/meta/recipes-devtools/gcc/libgcc-initial.inc<br>
+++ b/meta/recipes-devtools/gcc/libgcc-initial.inc<br>
@@ -31,7 +31,7 @@ require libgcc-common.inc<br>
<br>
=C2=A0DEPENDS =3D &quot;virtual/cross-cc&quot;<br>
<br>
-LICENSE =3D &quot;GPL-3.0-with-GCC-exception&quot;<br>
+LICENSE =3D &quot;GPL-3.0-or-later WITH GCC-exception-3.1&quot;<br>
<br>
=C2=A0PACKAGES =3D &quot;&quot;<br>
<br>
diff --git a/meta/recipes-devtools/gcc/libgcc.inc b/meta/recipes-devtools/g=
cc/libgcc.inc<br>
index 74e8746b42..e92dadf021 100644<br>
--- a/meta/recipes-devtools/gcc/libgcc.inc<br>
+++ b/meta/recipes-devtools/gcc/libgcc.inc<br>
@@ -32,10 +32,10 @@ PACKAGES =3D &quot;\<br>
<br>
=C2=A0# All libgcc source is marked with the exception.<br>
=C2=A0#<br>
-LICENSE:${PN} =3D &quot;GPL-3.0-with-GCC-exception&quot;<br>
-LICENSE:${PN}-dev =3D &quot;GPL-3.0-with-GCC-exception&quot;<br>
-LICENSE:${PN}-dbg =3D &quot;GPL-3.0-with-GCC-exception&quot;<br>
-LICENSE:${PN}-src =3D &quot;GPL-3.0-with-GCC-exception&quot;<br>
+LICENSE:${PN} =3D &quot;GPL-3.0-or-later WITH GCC-exception-3.1&quot;<br>
+LICENSE:${PN}-dev =3D &quot;GPL-3.0-or-later WITH GCC-exception-3.1&quot;<=
br>
+LICENSE:${PN}-dbg =3D &quot;GPL-3.0-or-later WITH GCC-exception-3.1&quot;<=
br>
+LICENSE:${PN}-src =3D &quot;GPL-3.0-or-later WITH GCC-exception-3.1&quot;<=
br>
<br>
=C2=A0FILES:${PN}-dev =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${base_libdir}/libgcc*.so \<br>
diff --git a/meta/recipes-devtools/gcc/libgfortran.inc b/meta/recipes-devto=
ols/gcc/libgfortran.inc<br>
index fa6aecaaa3..1726b40c6a 100644<br>
--- a/meta/recipes-devtools/gcc/libgfortran.inc<br>
+++ b/meta/recipes-devtools/gcc/libgfortran.inc<br>
@@ -60,9 +60,9 @@ PACKAGES =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0libgfortran-staticdev \<br>
=C2=A0&quot;<br>
<br>
-LICENSE:${PN} =3D &quot;GPL-3.0-with-GCC-exception&quot;<br>
-LICENSE:${PN}-dev =3D &quot;GPL-3.0-with-GCC-exception&quot;<br>
-LICENSE:${PN}-dbg =3D &quot;GPL-3.0-with-GCC-exception&quot;<br>
+LICENSE:${PN} =3D &quot;GPL-3.0-or-later WITH GCC-exception-3.1&quot;<br>
+LICENSE:${PN}-dev =3D &quot;GPL-3.0-or-later WITH GCC-exception-3.1&quot;<=
br>
+LICENSE:${PN}-dbg =3D &quot;GPL-3.0-or-later WITH GCC-exception-3.1&quot;<=
br>
<br>
=C2=A0FILES:${PN} =3D &quot;${libdir}/libgfortran.so.*&quot;<br>
=C2=A0FILES:${PN}-dev =3D &quot;\<br>
-- <br>
2.54.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#241002): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/241002" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/241002</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120285157/199=
7914" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/120285157/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.=
com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000007cc0e20656c49b35--

