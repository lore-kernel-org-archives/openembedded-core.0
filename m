Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E8B9D30CF5
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 00:21:36 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.73669.1768350094103635066
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 16:21:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XqbF8mCg;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7926d5dbdf7so38038347b3.2
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 16:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768350093; x=1768954893; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jo5DWRFngCtyg/p5Upi0nicaVQ8D7eCETIcQBycpAnE=;
        b=XqbF8mCgvx0NQNXDIwSnR5OzRropdUVYFdwSF+LaO3bxo9k6P9FOl1ihvTc8EldF5m
         9TxlCwcjngZp0wjMUWEJ7v3Wsmo9OyzXOhRymTSAydtpDUHNO1WBuyhY/yl4275LFL+p
         JA5mYXvrH1qKYedIfJGYP/0VmYpueIXbVoZMydD0nu5VdQy2qPLuvaniy/81D3wBwjYA
         UVec2//5M25OxCx+OHwwJPviBo8UUP9XqfGc3DtulH/LzodrfLBgo+eeyIxck4JE5RrH
         WyoKHNir5NqB5MPqvGXsNIaVg4LG9cGaskLy1wv19WXVDUkEfYZbZpFeG57lQZwL9GOb
         2wRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768350093; x=1768954893;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jo5DWRFngCtyg/p5Upi0nicaVQ8D7eCETIcQBycpAnE=;
        b=nn5oJiAkVG8kPXXg+ezpLjPrysbEVnspE1zBUFFsV3bMwU7y0erdxBl8j8YCCpSh4A
         Bx8nPSDQtnSHuYOaz11kJYM/kd8ofTVl4kaWfy6wloGDrDVO8D2oiUbowuGVz89pmLqT
         paXvKnBbIfuw8D5AGBbBXxEGVDIAb0FNU/YQFwT/HFQI1VOs93jCzpeJmjzrO4Lue+75
         eGiEzE1o7f2vV5ZCu1Q+HQ3b5RXwoxCyNivFNtDSz59gzOgq/zvqOPZGAedCEK0lOJ14
         /KIq08BWM2JSqmDei8FT1N+nydHcjC8ZIR1+/Grv9MoMFtuME+ZRhenQ3wpjKSrQfAd3
         NdJw==
X-Gm-Message-State: AOJu0YyAYg8lXUtlvDRAAHbkFX0zcipCNwZyYOyK5Esj+IjoFcbDX41p
	uYgltGT0lWMGIQ028XxwtlId9O/F5v7cNL89MXKp1sNVa6GZWuMI/o7O0AtHno+mgIcltsFdgMe
	0bQL9C0qep1d3vVBxIY4rzyk17D8JhDk=
X-Gm-Gg: AY/fxX5qh23CpFJFSgSTd3SZCm9qV/Lw8JgZo9UQD/pXioaPHi6IOybztK4fg3tqTzJ
	/58kEYlrSfncoWisZrfdvF5cryUhcuTA7PkU/Hh2SKoOdERFjXmD/7r+A1C3cdtrwYIRspqkGI4
	zJU+do9iwXME/yNouc9/brfXyeD/PBqkljPYLLFB9PMv30bZJUIGiKiPje6n9oSnsnE+AGQdU7n
	UMMN/xjF3jMVBq1Aj2Qj0YWNg1KIzetMnrSCCeyrtF8Ub+4Ahr/PCYL9uPyPXnyCQtfdTicsvA0
	yj33DPRo2hr62CnW4POllASIX0IFoFXfgY4OazzNnS8t0Hz15X06VReLfSL3AhlRlPIxRprAIXl
	LqD7GHei1aD66sosbPk7SuK3muEg/aQzDj9OIJl+90RLt
X-Received: by 2002:a05:690e:4148:b0:644:7afd:f484 with SMTP id
 956f58d0204a3-64901ac0622mr889332d50.40.1768350093083; Tue, 13 Jan 2026
 16:21:33 -0800 (PST)
MIME-Version: 1.0
References: <20260113225424.1208879-1-mark.yang@lge.com>
In-Reply-To: <20260113225424.1208879-1-mark.yang@lge.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 13 Jan 2026 16:21:07 -0800
X-Gm-Features: AZwV_QiNrINIvY8QK70DM44gXzuipC--0EnHpqF2feMSsSSX2AGXVSG0KOy_M30
Message-ID: <CAMKF1sp5eBr8Y-VtEWO60tb-VpY4GZZwfbDrXRsDSVgpKg10XQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] llvm: enable LLVMgold.so build by adding
 binutils dependency
To: mark.yang@lge.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000023097306484e1735"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 00:21:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229298

--00000000000023097306484e1735
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is a good fix, I was seeing the same problems.

On Tue, Jan 13, 2026 at 2:54=E2=80=AFPM mark.yang via lists.openembedded.or=
g
<mark.yang=3Dlge.com@lists.openembedded.org> wrote:

> From: "mark.yang" <mark.yang@lge.com>
>
> Currently, LLVMgold.so is not built because the binutils headers
> are missing during the build process.
>
> This allows LLVM to find the necessary headers and build the LLVMgold.so,
> which is required for Link Time Optimization (LTO) support properly.
>
> Signed-off-by: mark.yang <mark.yang@lge.com>
> ---
>  meta/recipes-devtools/clang/llvm_git.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/clang/llvm_git.bb
> b/meta/recipes-devtools/clang/llvm_git.bb
> index 96ea383731..bed9988c1a 100644
> --- a/meta/recipes-devtools/clang/llvm_git.bb
> +++ b/meta/recipes-devtools/clang/llvm_git.bb
> @@ -11,7 +11,7 @@ require common-source.inc
>
>  LIC_FILES_CHKSUM =3D
> "file://LICENSE.TXT;md5=3D8a15a0759ef07f2682d2ba4b893c9afe"
>
> -DEPENDS =3D "llvm-tblgen-native libffi libxml2 zlib zstd"
> +DEPENDS =3D "llvm-tblgen-native libffi libxml2 zlib zstd binutils"
>
>  inherit cmake pkgconfig lib_package multilib_header
>
> @@ -50,6 +50,7 @@ EXTRA_OECMAKE +=3D "-DCMAKE_BUILD_TYPE=3DMinSizeRel \
>                    -DLLVM_TOOL_YAML2OBJ_BUILD=3DOFF \
>                    -DLLVM_NATIVE_TOOL_DIR=3D${STAGING_BINDIR_NATIVE} \
>                    -DLLVM_TABLEGEN=3D${STAGING_BINDIR_NATIVE}/llvm-tblgen=
 \
> +                  -DLLVM_BINUTILS_INCDIR=3D${STAGING_INCDIR} \
>
>  -DCROSS_TOOLCHAIN_FLAGS_NATIVE=3D'-DCMAKE_TOOLCHAIN_FILE=3D${WORKDIR}/to=
olchain-native.cmake'
> \
>                   "
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229292):
> https://lists.openembedded.org/g/openembedded-core/message/229292
> Mute This Topic: https://lists.openembedded.org/mt/117252728/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000023097306484e1735
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is a good fix, I was seeing the same problems.=C2=A0<=
/div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Jan 13, 2026 at 2:54=E2=80=AFPM mark.yang via =
<a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;ma=
rk.yang=3D<a href=3D"mailto:lge.com@lists.openembedded.org">lge.com@lists.o=
penembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">From: &quot;mark.yang&quot; &lt;<a href=3D"mailto:mark.yang@=
lge.com" target=3D"_blank">mark.yang@lge.com</a>&gt;<br>
<br>
Currently, LLVMgold.so is not built because the binutils headers<br>
are missing during the build process.<br>
<br>
This allows LLVM to find the necessary headers and build the LLVMgold.so,<b=
r>
which is required for Link Time Optimization (LTO) support properly.<br>
<br>
Signed-off-by: mark.yang &lt;<a href=3D"mailto:mark.yang@lge.com" target=3D=
"_blank">mark.yang@lge.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/clang/<a href=3D"http://llvm_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">llvm_git.bb</a> | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-devtools/clang/<a href=3D"http://llvm_git.bb" rel=
=3D"noreferrer" target=3D"_blank">llvm_git.bb</a> b/meta/recipes-devtools/c=
lang/<a href=3D"http://llvm_git.bb" rel=3D"noreferrer" target=3D"_blank">ll=
vm_git.bb</a><br>
index 96ea383731..bed9988c1a 100644<br>
--- a/meta/recipes-devtools/clang/<a href=3D"http://llvm_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">llvm_git.bb</a><br>
+++ b/meta/recipes-devtools/clang/<a href=3D"http://llvm_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">llvm_git.bb</a><br>
@@ -11,7 +11,7 @@ require common-source.inc<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE.TXT;md5=3D8a15a0759ef07f268=
2d2ba4b893c9afe&quot;<br>
<br>
-DEPENDS =3D &quot;llvm-tblgen-native libffi libxml2 zlib zstd&quot;<br>
+DEPENDS =3D &quot;llvm-tblgen-native libffi libxml2 zlib zstd binutils&quo=
t;<br>
<br>
=C2=A0inherit cmake pkgconfig lib_package multilib_header<br>
<br>
@@ -50,6 +50,7 @@ EXTRA_OECMAKE +=3D &quot;-DCMAKE_BUILD_TYPE=3DMinSizeRel =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DLLVM=
_TOOL_YAML2OBJ_BUILD=3DOFF \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DLLVM=
_NATIVE_TOOL_DIR=3D${STAGING_BINDIR_NATIVE} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DLLVM=
_TABLEGEN=3D${STAGING_BINDIR_NATIVE}/llvm-tblgen \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DLLVM_BINU=
TILS_INCDIR=3D${STAGING_INCDIR} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DCROS=
S_TOOLCHAIN_FLAGS_NATIVE=3D&#39;-DCMAKE_TOOLCHAIN_FILE=3D${WORKDIR}/toolcha=
in-native.cmake&#39; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#229292): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/229292" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/229292</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117252728/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117252728/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000023097306484e1735--

