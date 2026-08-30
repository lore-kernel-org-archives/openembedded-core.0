Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB2CAC61DB9
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 19:43:27 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14959.1788118998277384122
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 12:43:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SGr2xRk0;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-85a50f6a7f7so30466997b3.2
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 12:43:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788118997; cv=none;
        d=google.com; s=arc-20260327;
        b=liB6InAOKon52YSR1g+qyeVHQiD7tTVEfMaF6wFYt10BDBGp5Jrnd7Xn3kkjHeSL3W
         pogVBd45JqaqXxLC40TLS1pp7bjncPOveAk1zevmByXmOLrgayg3DcBMknhIz+aYlpVU
         GJmVBLpQ13hSF1AF/2rO/UZDVJnoYXwsYO2xBgtDWfSr7gTyDVN5+8QhFvxlGoYchEhC
         n9xzhnBtoBAclk79ZIJzCctmh9iqddaaYnKJzqDX/bGp42JiFHwBu/ZjwjTJMh2Gur3/
         DSegQm6/QEjW0GrFoPZElCiu/+6kywOCBKaWTb+ewfQrPtb4uEiij3GUrJBRWHekRNFa
         Yj8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sms7cyrASvsNQt+MyscJ9T/dJ7nruQ5MSsOHMOJE0Bo=;
        fh=XdtWSdxUWXiIQqTL/jS3pXJKAtdooZTh4SlEz3R75PA=;
        b=BfXNLs4/UA3MAGpCBRvR+uEIilkdKu1dwAQTxo1oGtugB5FdCf4S4qoutIa3fB3AoO
         4WJt33CjZkiLam574tUc6b/1MXzqCsA2gdeQDhUZxTyqqv4yohVxvnw7sS5hdq4c5cD7
         k/1lv07mApAMDCwpa4SQQertx1Qiyf0ynK6GHJVOg5s2+X/apBP05JhzlB/p/0CjTI+u
         Uj2JlNlhKSZQ5LYr5YBuiXHc2hOXROfvbd5jzBXKzsDvWf8tERGK8csmr4ixnfZ3H9cx
         f+EaKBKUZCwxtCgrYZbzjwBD0G4BQ2XBJ4ZVesPbWBrOZv8MKSm6adQLX+l+pzNcMDNu
         /ppw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788118997; x=1788723797; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sms7cyrASvsNQt+MyscJ9T/dJ7nruQ5MSsOHMOJE0Bo=;
        b=SGr2xRk0kxNJN6Nzqz3zeBGfxdEFAIjJLw3QPpO9HGG4dU2GugxgtozHV5oKoguVWo
         wjsEGxFKvReTgm1WNLklHBrii53SpN0BIFWT+b0mINsSz2/xP4YMuH5GEhV40i3CGRxX
         rV9aKY2atEZq5u65baOljeNldveBpRSXr310vnGNd3KkOU+7VagRfHncZEWJIJhcQ57h
         AenLlt090QHf7vvGunFZCpfDBlmfBo2OlX8nYKv7iXjbvQv6kkra9LI1xRY+uO9Gyl1T
         PpRcyT/qEun2u/iiuWRgspzueg0qmvXR61ZAiHW2g1HJvmdQ2Oi8hQxrueT+3K14dnIa
         diNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788118997; x=1788723797;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sms7cyrASvsNQt+MyscJ9T/dJ7nruQ5MSsOHMOJE0Bo=;
        b=OrEUxUmyQpzkv12A3rJsiqErjyko34iRtc8xdAFoVcI9G3KIR1lPK4E5spsQ4IBGjy
         Jib5RJ8stqZLo4Wgm9o2zU5eEHAuY2T4Zp7iKmCVpNrNUwfTzkNDDPbLJC927BEZzcV1
         YfWKeuVia4EIj2wMA9/9A8Q+ZNhbRTu+hHIzfqcbQ/pmoORB2eNR8ov+MeJtpYGPhYNY
         uNxKhqKdXIlF7FeQuUPuIrtBDBxNnK8zUm+pqYRchYd53q+8PCX+gi1hmA7geY78OPtJ
         k67bbO3Wp/irSG7bImXQP7exMg2OnNieWYMvXwKfSKgMvXTZOdzNGxMXR4WpwWFOZg0A
         +Ddw==
X-Gm-Message-State: AFuF++metzGpFFBwMiS+PnUhS6CUM7XhfH43Z1hxtOP4VeFG2JvjScSq
	/FCmvXzGlEj+rwAUmths7nRPDgeDv8fflJF8HyNOIIztP07KwWStLlKDhTdWDAdsneZSAuI3t9K
	LuBOTg5S6SEYAnPMtQO4EcMtlgrq8pHGh5NiKD1c=
X-Gm-Gg: AYBFou1Np5tXYzwwliaqbjXhforNv6793nlwwsIskIxDPpshtgjeNzA4nOjzOq4xqEw
	VXJC4Mi0vR6rJmz0VIQpd/q1vfG8IQHKRBlkPgz0ZMfOc1xzEZxXCLYZAysb4z1P1iU/oBKRBs6
	ZYefabWjcx12ZAop6l7H1bNut66CBl1uV8wFHdSemZvtvT4f2MvX45OvN42CV6D0HiDc3yMeglT
	6mJUGeHTTttZoVSNWAsdmWClB+egR+4dfqnXUR8sUdLzYuwGuBXRztA9N9cImoEE8SnpPgfgUwp
	6/5lJYieVG8Kpb4nwucnOPIEsEYL7qJRJ35G2NVFv48xQq3qv1DyzKWJszSEX0fX4OuXh+N44Zi
	4q3HbqcluDBcYjF9rPiWtuVaZzS6+/JOz7QIIn4mRPIb5pIyLPANH9O0U3/6Ck4YhUzrVNT8bd3
	vur+CUNMHYzu4d7TC1Mtz7xBG/JwcnCaFvuz4009T4AGPaWB1qiIhhkz6N6HHq4hCzWoMvobQZ5
	qtnLsHgMthHqw==
X-Received: by 2002:a05:690c:e1d4:20b0:814:651e:a553 with SMTP id
 00721157ae682-85d6b847fd9mr57826817b3.28.1788118997199; Sun, 30 Aug 2026
 12:43:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260830125853.1139807-1-sunilkumar.dora@windriver.com> <20260830125853.1139807-3-sunilkumar.dora@windriver.com>
In-Reply-To: <20260830125853.1139807-3-sunilkumar.dora@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 30 Aug 2026 12:43:26 -0700
X-Gm-Features: AcwNN1XavdhOG5AnrfTI5WxAGxnPpig2jQW91hCY0j5_wMKiDjaSnnw8FRBc1uY
Message-ID: <CAMKF1sq6+P9XY-hLGVnSe_=-HytN7di0pVKwsssuFTn96ueQmw@mail.gmail.com>
Subject: Re: [PATCH 02/11] spirv-llvm-translator: Upgrade to 23.1.0
To: sunilkumar.dora@windriver.com
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com, 
	sundeep.kokkonda@windriver.com, deepesh.vatharaj@windriver.com
Content-Type: multipart/alternative; boundary="000000000000a4f071065a48e512"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 19:43:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244693

--000000000000a4f071065a48e512
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2026 at 5:59=E2=80=AFAM <sunilkumar.dora@windriver.com> wro=
te:

> From: Sunil Dora <sunilkumar.dora@windriver.com>
>
> Each release branch of the translator only builds against the
> matching LLVM major. Move to the llvm_release_230 branch, pinned
> at the v23.1.0 tag.
>
> Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
> ---
>  ...translator_22.1.5.bb =3D> spirv-llvm-translator_23.1.0.bb} | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-graphics/spir/{spirv-llvm-translator_22.1.5.bb =3D>
> spirv-llvm-translator_23.1.0.bb} (87%)
>
> diff --git a/meta/recipes-graphics/spir/spirv-llvm-translator_22.1.5.bb
> b/meta/recipes-graphics/spir/spirv-llvm-translator_23.1.0.bb
> similarity index 87%
> rename from meta/recipes-graphics/spir/spirv-llvm-translator_22.1.5.bb
> rename to meta/recipes-graphics/spir/spirv-llvm-translator_23.1.0.bb
> index 1f80c6a27f..fd1dd9cfae 100644
> --- a/meta/recipes-graphics/spir/spirv-llvm-translator_22.1.5.bb
> +++ b/meta/recipes-graphics/spir/spirv-llvm-translator_23.1.0.bb
> @@ -5,8 +5,8 @@ LICENSE =3D "NCSA"
>  LIC_FILES_CHKSUM =3D
> "file://LICENSE.TXT;md5=3D47e311aa9caedd1b3abf098bd7814d1d"
>
>  # pattern: llvm_branch_200, currently there are no minor releases, so, n=
o
> llvm_branch_201
>

  the header comment about the branch naming pattern still references the
200-era example and could be refreshed while you're here


> -SPIRV_BRANCH =3D "llvm_release_220"
> -SRCREV =3D "27afcfe385cf542197dfde8c658e1f5ff53fc2fc"
> +SPIRV_BRANCH =3D "llvm_release_230"
> +SRCREV =3D "19a29d4376ab470909ba43ca014ae668fb1156c9"
>  SRC_URI =3D " \
>      git://
> github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=3Dhttps;branch=3D$=
{SPIRV_BRANCH};tag=3Dv${PV}
> <http://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=3Dhttps;br=
anch=3D$%7BSPIRV_BRANCH%7D;tag=3Dv$%7BPV%7D>
> \
>  "
> @@ -18,7 +18,7 @@ DEPENDS =3D "llvm spirv-tools spirv-headers"
>  inherit cmake pkgconfig lib_package
>
>  EXTRA_OECMAKE =3D "\
> -    -DBASE_LLVM_VERSION=3D22.1.0 \
> +    -DBASE_LLVM_VERSION=3D23.1.0 \
>      -DCMAKE_SKIP_BUILD_RPATH=3DON \
>      -DBUILD_SHARED_LIBS=3DON \
>      -DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=3D${STAGING_INCDIR}/.. \
> --
> 2.43.0
>
>

--000000000000a4f071065a48e512
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Aug 30,=
 2026 at 5:59=E2=80=AFAM &lt;<a href=3D"mailto:sunilkumar.dora@windriver.co=
m">sunilkumar.dora@windriver.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">From: Sunil Dora &lt;<a href=3D"mailto:sun=
ilkumar.dora@windriver.com" target=3D"_blank">sunilkumar.dora@windriver.com=
</a>&gt;<br>
<br>
Each release branch of the translator only builds against the<br>
matching LLVM major. Move to the llvm_release_230 branch, pinned<br>
at the v23.1.0 tag.<br>
<br>
Signed-off-by: Sunil Dora &lt;<a href=3D"mailto:sunilkumar.dora@windriver.c=
om" target=3D"_blank">sunilkumar.dora@windriver.com</a>&gt;<br>
---<br>
=C2=A0...<a href=3D"http://translator_22.1.5.bb" rel=3D"noreferrer" target=
=3D"_blank">translator_22.1.5.bb</a> =3D&gt; <a href=3D"http://spirv-llvm-t=
ranslator_23.1.0.bb" rel=3D"noreferrer" target=3D"_blank">spirv-llvm-transl=
ator_23.1.0.bb</a>} | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
=C2=A0rename meta/recipes-graphics/spir/{<a href=3D"http://spirv-llvm-trans=
lator_22.1.5.bb" rel=3D"noreferrer" target=3D"_blank">spirv-llvm-translator=
_22.1.5.bb</a> =3D&gt; <a href=3D"http://spirv-llvm-translator_23.1.0.bb" r=
el=3D"noreferrer" target=3D"_blank">spirv-llvm-translator_23.1.0.bb</a>} (8=
7%)<br>
<br>
diff --git a/meta/recipes-graphics/spir/<a href=3D"http://spirv-llvm-transl=
ator_22.1.5.bb" rel=3D"noreferrer" target=3D"_blank">spirv-llvm-translator_=
22.1.5.bb</a> b/meta/recipes-graphics/spir/<a href=3D"http://spirv-llvm-tra=
nslator_23.1.0.bb" rel=3D"noreferrer" target=3D"_blank">spirv-llvm-translat=
or_23.1.0.bb</a><br>
similarity index 87%<br>
rename from meta/recipes-graphics/spir/<a href=3D"http://spirv-llvm-transla=
tor_22.1.5.bb" rel=3D"noreferrer" target=3D"_blank">spirv-llvm-translator_2=
2.1.5.bb</a><br>
rename to meta/recipes-graphics/spir/<a href=3D"http://spirv-llvm-translato=
r_23.1.0.bb" rel=3D"noreferrer" target=3D"_blank">spirv-llvm-translator_23.=
1.0.bb</a><br>
index 1f80c6a27f..fd1dd9cfae 100644<br>
--- a/meta/recipes-graphics/spir/<a href=3D"http://spirv-llvm-translator_22=
.1.5.bb" rel=3D"noreferrer" target=3D"_blank">spirv-llvm-translator_22.1.5.=
bb</a><br>
+++ b/meta/recipes-graphics/spir/<a href=3D"http://spirv-llvm-translator_23=
.1.0.bb" rel=3D"noreferrer" target=3D"_blank">spirv-llvm-translator_23.1.0.=
bb</a><br>
@@ -5,8 +5,8 @@ LICENSE =3D &quot;NCSA&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE.TXT;md5=3D47e311aa9caedd1b3=
abf098bd7814d1d&quot;<br>
<br>
=C2=A0# pattern: llvm_branch_200, currently there are no minor releases, so=
, no llvm_branch_201<br></blockquote><div><br></div><div>=C2=A0 the header =
comment about the branch naming pattern still references the 200-era exampl=
e and could be refreshed while you&#39;re here=C2=A0=C2=A0</div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
-SPIRV_BRANCH =3D &quot;llvm_release_220&quot;<br>
-SRCREV =3D &quot;27afcfe385cf542197dfde8c658e1f5ff53fc2fc&quot;<br>
+SPIRV_BRANCH =3D &quot;llvm_release_230&quot;<br>
+SRCREV =3D &quot;19a29d4376ab470909ba43ca014ae668fb1156c9&quot;<br>
=C2=A0SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/KhronosGroup/SPIRV-L=
LVM-Translator;protocol=3Dhttps;branch=3D$%7BSPIRV_BRANCH%7D;tag=3Dv$%7BPV%=
7D" rel=3D"noreferrer" target=3D"_blank">github.com/KhronosGroup/SPIRV-LLVM=
-Translator;protocol=3Dhttps;branch=3D${SPIRV_BRANCH};tag=3Dv${PV}</a> \<br=
>
=C2=A0&quot;<br>
@@ -18,7 +18,7 @@ DEPENDS =3D &quot;llvm spirv-tools spirv-headers&quot;<br=
>
=C2=A0inherit cmake pkgconfig lib_package<br>
<br>
=C2=A0EXTRA_OECMAKE =3D &quot;\<br>
-=C2=A0 =C2=A0 -DBASE_LLVM_VERSION=3D22.1.0 \<br>
+=C2=A0 =C2=A0 -DBASE_LLVM_VERSION=3D23.1.0 \<br>
=C2=A0 =C2=A0 =C2=A0-DCMAKE_SKIP_BUILD_RPATH=3DON \<br>
=C2=A0 =C2=A0 =C2=A0-DBUILD_SHARED_LIBS=3DON \<br>
=C2=A0 =C2=A0 =C2=A0-DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=3D${STAGING_IN=
CDIR}/.. \<br>
-- <br>
2.43.0<br>
<br>
</blockquote></div></div>

--000000000000a4f071065a48e512--

