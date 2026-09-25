Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CE42C98321
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 17:38:29 +0000 (UTC)
Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3825.1790357904381970486
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2026 10:38:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RwW3o9jB;
 spf=pass (domain: gmail.com, ip: 74.125.224.171, mailfrom: raj.khem@gmail.com)
Received: by mail-yx2-f43.google.com with SMTP id 00721157ae682-85d43ac608dso10841847b3.3
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2026 10:38:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790357903; cv=none;
        d=google.com; s=arc-20260327;
        b=bHfLd86aiZNsKXFwNlw8fLQ7lAuJz845FruchnTeaua9lTRwEnSWsYePEXWm/jIJoL
         58cbrcJrIeYs5ZoI0C/7rrw5+jjwI0yB2by123DfxaYiWdzYrno5w2ki5GPDfFuOAOm8
         ep8SrhWQ/N/isoejZ1tdmw9qCk8ccRj/w4sdrTQz0MEtboP5PY49fT8Zf0Zhcgh7W5ef
         zT+xs/8AZ8eMgT2saesXDz03uuC7aq74I025a1x6R5jiHwRhjGV0HrJIvewdMDjGYkiL
         pVSA9IZdxO2i625VeCAJe3jEgB7WvBrOs7tx39SBuvIYRovOoK1smbRVm7LAPzqjEOYG
         Crzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1yv+7yS/RjLwAlhVUmUST6+wwN9KXlkvhND+daQzLA0=;
        fh=7dhZMgdyDUGcK+sV1m/gDtiRoESe4a3xl8M1MOy967E=;
        b=hRE+zaJ5xbbpmySpFBR1F3fwDIPcBBzkLq05JJE5Ve4Vkjhuw35CfOODFXv9Io0RqF
         cHqCqRNLn0xU3W/MD4YQNYiO3cKakE/9p2q3dOFqK3bewNoeQfIPBLnf3FYchI5fAfPC
         ssFav5cxHoVbSimfikGu2Lyl+IqbVUs6JfjTaWEy4GdwSRyKL6S/Pd8w0wopWbN0ecXz
         X2RbGmb2hdagR0KhcwaL4ljMyIFryv9SzJezLFxlQWxBrJiA9neCIELqPv6lM5u5TBWK
         ehQUdpOMb7J3ZTz0Gq0vIfCYd0c7n4dytEc63jJAlxeoeH/TumEMVzGGYKGBgFNOHrzc
         Wqig==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790357903; x=1790962703; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1yv+7yS/RjLwAlhVUmUST6+wwN9KXlkvhND+daQzLA0=;
        b=RwW3o9jBiXqWLbLaSh9eY5Zw04YPCZ0PowAQJ6hjOtP8qqn3jqslgD+YxLTtqQZypD
         xeZNxWpU8oYpHVCNA53sg4FJOappssTWe6SAAWWGZwSIndjZ6oWHmrqqpZUMFwDn4D9G
         VpNvdhOXlPEIz9+WSQlxEzplh4S70WIXRhPk3a78Pwt6AMqNjoAVxqCh2s08zG0muTEV
         NxnZrZlLtNI6mLdaBaZFrKcvLAZoO9XsRgDwCYCH/1nGP/046WkYC+1QEvRezjTCbbmt
         N6GweQyVtfaQGJmpofNwX940w2mvjc/Fg3sfMzq1fZD9Y/Z934p21OfzpA5bOMa6FTAO
         Ydlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790357903; x=1790962703;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1yv+7yS/RjLwAlhVUmUST6+wwN9KXlkvhND+daQzLA0=;
        b=vl4rxhnDPtjk250PzM/0YFT5GrEmGgSEs8SnIryCtoGm7KUOrc9Dq36GKAm7ZPtZc/
         GbzWUGV9Lpzko0pINcywVEpqsUI2nOxl6GgP7u4LmAkEvxsKuV1v03HZH5C/NWcr2/i+
         rz0+bE+8EK5qHDA8GFi01P8+PpcDW0qqlKn0k3nvyK9c1bzdg4607LjApZzZha32bOiL
         6d3TR9apBtQRIM7Gb2i1daXawfXDQAItTPtj5nx38VZmDyEqyhrf4NJHwyTMdlJxTr7x
         bnVEAQKMU5fTwAFuF5E83Q/TDnZVyNVE1jK36JiqPYfDrLGyVjQRbaImCWtv12g6VRXl
         +x/g==
X-Gm-Message-State: AFuF++kfqGSqhq5egpaKOwNA2mK46AEefxG3QsuWlZWvohMnIbh5pceM
	gcsID3dxp/0EBOsyTatrfnpPvjMuIHirAXugMdY6R6u1n2W3MjcR/L0rU8HqwjfuLSvOYMKKWEH
	MDR/wDUPbsQctl+4ZxWDKC6854jyrNZo=
X-Gm-Gg: AYBFou3Bshc+P0x1KM/ScOREqmbEp3fFkqRS95auvOPnmBGVxJFOMap+QYeSLhF7FmZ
	S4pfdYM8/x8oI57YsTBS172zrPdJDrVf9YDOY00J2qC76u4H8tQNKSjJZNGZBd0PPjX7LbnypQR
	dquQzLjiEG0G+kUO9rWbuGHXfBEWpxho+eX01B7a7xq4cbJUK3usyUecQA6SD4fav6zW4jSMB39
	fqk8zw1bO5Om47hGwiU4UUH2SrRXw0TbU9vJHxtFm2eAMN35vw5QevIi9dDswlTFoxKHuP4wO+w
	oV/gWkjVFmBb5A/94kYhJpYEUyTRupba9Us21mO9aEdTwxJROEB6RgcjO0gChPa856W4EhjVim2
	hJoV/fUmb59paQMKebrJtvcBjZIXcC7mA5ksm9VAtxM2FJO8raOgvqYKl6sskZ/x7YeQ58uPCig
	y4lg8yoxe91TiMO37mOYSiIxDLdyVeoYWU/OjnF8nEOKbP3+pyM4I12qS3rcQAqT53sG+ZN7txT
	/XEN4o9gIfihHjhhl7RfbUj2SwuroY1MnafODOYuAjJZY5UV+dvnRmWyunWykr/CmNc/hGtAaTd
	OxY+yogPVDJBjAxyFQ==
X-Received: by 2002:a05:690e:b45:b0:674:1352:1d76 with SMTP id
 956f58d0204a3-67413522053mr968701d50.37.1790357903383; Fri, 25 Sep 2026
 10:38:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260925142820.853791-1-jst@mbs-solutions.de>
In-Reply-To: <20260925142820.853791-1-jst@mbs-solutions.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Sep 2026 10:37:57 -0700
X-Gm-Features: AclHuK8BkuGKZb8pcP-vb_CVEgYY2x816Feb1IRpSxfY_51tZLhJDnOF75r6H6A
Message-ID: <CAMKF1spj3M8Qwc+HAcyFxwNYhPG58hhar=6J-En7iRt2QJHkNw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] compiler-rt: Use specific arm architecture
 instead of 'arm'
To: jst@mbs-solutions.de
Cc: openembedded-core@lists.openembedded.org, 
	Ross Burton <Ross.Burton@arm.com>
Content-Type: multipart/alternative; boundary="000000000000da2374065c522e63"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2026 17:38:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246626

--000000000000da2374065c522e63
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 7:29=E2=80=AFAM Jan Strater-B=C3=BCddefeld via
lists.openembedded.org <jst=3Dmbs-solutions.de@lists.openembedded.org> wrot=
e:

> Fixes [YOCTO #16424]
>
> The build system of compiler-rt can auto-detect some architectures like
> 'armv6m' via the `-march` compiler flag.
> For other targets, the arch type to build for must be set via the target
> triple `CMAKE_C_COMPILER_TARGET`.
> Before this commit, the arch type was simply 'arm'.
>
> This commit also removes setting the variable
> `COMPILER_RT_DEFAULT_TARGET_ARCH` because it is overridden anyway.
>
> AI-Generated: Uses GitHub Copilot
>
> Signed-off-by: Jan Strater-B=C3=BCddefeld <jst@mbs-solutions.de>
> Cc: Ross Burton <Ross.Burton@arm.com>
> ---
>  .../recipes-devtools/clang/compiler-rt_git.bb | 22 +++++++++++--------
>  1 file changed, 13 insertions(+), 9 deletions(-)
>
> diff --git a/meta/recipes-devtools/clang/compiler-rt_git.bb
> b/meta/recipes-devtools/clang/compiler-rt_git.bb
> index a265c2aa93..d6c06302c2 100644
> --- a/meta/recipes-devtools/clang/compiler-rt_git.bb
> +++ b/meta/recipes-devtools/clang/compiler-rt_git.bb
> @@ -49,13 +49,18 @@ TOOLCHAIN =3D "clang"
>  TOOLCHAIN_NATIVE =3D "clang"
>
>  def get_compiler_rt_arch(bb, d):
> -    if bb.utils.contains('TUNE_FEATURES', 'armv5 thumb dsp', True, False=
,
> d):
> -        return 'armv5te'
> -    elif bb.utils.contains('TUNE_FEATURES', 'armv4 thumb', True, False,
> d):
> -        return 'armv4t'
> -    elif bb.utils.contains('TUNE_FEATURES', 'arm vfp
> callconvention-hard', True, False, d):
> -        return 'armhf'
> -    return d.getVar('HOST_ARCH')
> +    import re
> +
> +    tune_args =3D d.getVar('TUNE_CCARGS_MARCH') or ''
>

new dependency on TUNE_CCARGS_MARCH causes the do_configure basehash
mismatch for native variant.


> +
> +    match =3D re.search(r'-march=3D(\S+)', tune_args)
> +    arch =3D match.group(1) if match else d.getVar('HOST_ARCH')
> +
> +    return arch
> +
> +def get_compiler_rt_target(bb, d):
> +    host_sys =3D d.getVar('HOST_SYS')
> +    return get_compiler_rt_arch(bb, d) + '-' + host_sys.split('-', 1)[1]
>

 It does target the right bug, but it causes a build regression and a
native/nativesdk sstate signature regression
Pre-Thumb-2 ARM tunes (armv4t, armv5te, armv6) fail to build compiler-rt.
because CMAKE_C_COMPILER_TARGET=3Darm..
makes compiler-rt pick the Thumb-2 optimized FP assembly which
needs armv6t2 at minimum, problem is diagnosed
rightly, but the fix is too broad.

also check if -march values are valid triple arch components and regex also
doesn't limit itself to 32-bit ARM
I think the this will cause library name to change and has to match what
the clang driver looks up.

The TC_CXX_RUNTIME=3Dllvm crtbegin/crtend symlinks use
get_compiler_rt_arch(), which now returns names like armv7-a or armv8-a
that compiler-rt never produces.


>  INSTALL_VER ?=3D "${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}${VER_SUFFIX}"
>  INSTALL_VER:class-native =3D "${@oe.utils.trim_version("${PV}", 1)}"
> @@ -78,7 +83,6 @@ EXTRA_OECMAKE +=3D "-DCMAKE_BUILD_TYPE=3DRelWithDebInfo=
 \
>                    -DCOMPILER_RT_BUILD_SANITIZERS=3DOFF \
>                    -DCOMPILER_RT_BUILD_MEMPROF=3DOFF \
>                    -DCOMPILER_RT_BUILD_LIBFUZZER=3DOFF \
> -
> -DCOMPILER_RT_DEFAULT_TARGET_ARCH=3D${@get_compiler_rt_arch(bb, d)} \
>                    -DLLVM_ENABLE_RUNTIMES=3D${RUNTIMES} \
>                    -DLLVM_LIBDIR_SUFFIX=3D${LLVM_LIBDIR_SUFFIX} \
>                    -DLLVM_APPEND_VC_REV=3DOFF \
> @@ -86,7 +90,7 @@ EXTRA_OECMAKE +=3D "-DCMAKE_BUILD_TYPE=3DRelWithDebInfo=
 \
>                    -DCOMPILER_RT_DEFAULT_TARGET_ONLY=3DON \
>                    -DLLVM_ENABLE_PER_TARGET_RUNTIME_DIR=3DOFF \
>                    -DCMAKE_POSITION_INDEPENDENT_CODE=3DON \
> -                  -DCMAKE_C_COMPILER_TARGET=3D${HOST_SYS} \
> +                  -DCMAKE_C_COMPILER_TARGET=3D${@get_compiler_rt_target(=
bb,
> d)} \
>
>  -DCOMPILER_RT_INSTALL_PATH=3D${nonarch_libdir}/clang/${INSTALL_VER} \
>                    ${@bb.utils.contains("TC_CXX_RUNTIME", "llvm",
> "${LLVMLIBGCCOPTS}", "", d)} \
>  "
> --
> 2.55.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#246621):
> https://lists.openembedded.org/g/openembedded-core/message/246621
> Mute This Topic: https://lists.openembedded.org/mt/121427261/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000da2374065c522e63
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 25,=
 2026 at 7:29=E2=80=AFAM Jan Strater-B=C3=BCddefeld via <a href=3D"http://l=
ists.openembedded.org">lists.openembedded.org</a> &lt;jst=3D<a href=3D"mail=
to:mbs-solutions.de@lists.openembedded.org">mbs-solutions.de@lists.openembe=
dded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">Fixes [YOCTO #16424]<br>
<br>
The build system of compiler-rt can auto-detect some architectures like<br>
&#39;armv6m&#39; via the `-march` compiler flag.<br>
For other targets, the arch type to build for must be set via the target<br=
>
triple `CMAKE_C_COMPILER_TARGET`.<br>
Before this commit, the arch type was simply &#39;arm&#39;.<br>
<br>
This commit also removes setting the variable<br>
`COMPILER_RT_DEFAULT_TARGET_ARCH` because it is overridden anyway.<br>
<br>
AI-Generated: Uses GitHub Copilot<br>
<br>
Signed-off-by: Jan Strater-B=C3=BCddefeld &lt;<a href=3D"mailto:jst@mbs-sol=
utions.de" target=3D"_blank">jst@mbs-solutions.de</a>&gt;<br>
Cc: Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.com" target=3D"_blank=
">Ross.Burton@arm.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-devtools/clang/<a href=3D"http://compiler-rt_git.bb" rel=
=3D"noreferrer" target=3D"_blank">compiler-rt_git.bb</a> | 22 +++++++++++--=
------<br>
=C2=A01 file changed, 13 insertions(+), 9 deletions(-)<br>
<br>
diff --git a/meta/recipes-devtools/clang/<a href=3D"http://compiler-rt_git.=
bb" rel=3D"noreferrer" target=3D"_blank">compiler-rt_git.bb</a> b/meta/reci=
pes-devtools/clang/<a href=3D"http://compiler-rt_git.bb" rel=3D"noreferrer"=
 target=3D"_blank">compiler-rt_git.bb</a><br>
index a265c2aa93..d6c06302c2 100644<br>
--- a/meta/recipes-devtools/clang/<a href=3D"http://compiler-rt_git.bb" rel=
=3D"noreferrer" target=3D"_blank">compiler-rt_git.bb</a><br>
+++ b/meta/recipes-devtools/clang/<a href=3D"http://compiler-rt_git.bb" rel=
=3D"noreferrer" target=3D"_blank">compiler-rt_git.bb</a><br>
@@ -49,13 +49,18 @@ TOOLCHAIN =3D &quot;clang&quot;<br>
=C2=A0TOOLCHAIN_NATIVE =3D &quot;clang&quot;<br>
<br>
=C2=A0def get_compiler_rt_arch(bb, d):<br>
-=C2=A0 =C2=A0 if bb.utils.contains(&#39;TUNE_FEATURES&#39;, &#39;armv5 thu=
mb dsp&#39;, True, False, d):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;armv5te&#39;<br>
-=C2=A0 =C2=A0 elif bb.utils.contains(&#39;TUNE_FEATURES&#39;, &#39;armv4 t=
humb&#39;, True, False, d):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;armv4t&#39;<br>
-=C2=A0 =C2=A0 elif bb.utils.contains(&#39;TUNE_FEATURES&#39;, &#39;arm vfp=
 callconvention-hard&#39;, True, False, d):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;armhf&#39;<br>
-=C2=A0 =C2=A0 return d.getVar(&#39;HOST_ARCH&#39;)<br>
+=C2=A0 =C2=A0 import re<br>
+=C2=A0 =C2=A0 <br>
+=C2=A0 =C2=A0 tune_args =3D d.getVar(&#39;TUNE_CCARGS_MARCH&#39;) or &#39;=
&#39;<br></blockquote><div><br></div><div><div>new dependency on TUNE_CCARG=
S_MARCH causes the do_configure basehash mismatch for native variant.</div>=
<div></div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
+<br>
+=C2=A0 =C2=A0 match =3D re.search(r&#39;-march=3D(\S+)&#39;, tune_args)<br=
>
+=C2=A0 =C2=A0 arch =3D match.group(1) if match else d.getVar(&#39;HOST_ARC=
H&#39;)<br>
+<br>
+=C2=A0 =C2=A0 return arch<br>
+<br>
+def get_compiler_rt_target(bb, d):<br>
+=C2=A0 =C2=A0 host_sys =3D d.getVar(&#39;HOST_SYS&#39;)<br>
+=C2=A0 =C2=A0 return get_compiler_rt_arch(bb, d) + &#39;-&#39; + host_sys.=
split(&#39;-&#39;, 1)[1]<br></blockquote><div><br></div><div>=C2=A0It does =
target the right bug, but it causes a build regression and a native/natives=
dk sstate signature regression</div><div>Pre-Thumb-2 ARM tunes (armv4t, arm=
v5te, armv6) fail to build compiler-rt. because CMAKE_C_COMPILER_TARGET=3Da=
rm..</div><div>makes compiler-rt pick the Thumb-2 optimized FP assembly whi=
ch needs=C2=A0armv6t2 at minimum, problem is diagnosed</div><div>rightly, b=
ut the fix is too broad.</div><div><br></div><div>also check if=C2=A0-march=
 values are valid triple arch components and regex also doesn&#39;t limit i=
tself to 32-bit ARM</div><div>I think the=C2=A0this will cause library name=
 to change and has to match what the clang driver looks up.</div><div><br><=
/div><div>The TC_CXX_RUNTIME=3Dllvm crtbegin/crtend symlinks use get_compil=
er_rt_arch(), which now returns names like armv7-a or armv8-a that compiler=
-rt never produces.</div><div><br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
<br>
=C2=A0INSTALL_VER ?=3D &quot;${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}${VER_SU=
FFIX}&quot;<br>
=C2=A0INSTALL_VER:class-native =3D &quot;${@oe.utils.trim_version(&quot;${P=
V}&quot;, 1)}&quot;<br>
@@ -78,7 +83,6 @@ EXTRA_OECMAKE +=3D &quot;-DCMAKE_BUILD_TYPE=3DRelWithDebI=
nfo \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DCOMP=
ILER_RT_BUILD_SANITIZERS=3DOFF \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DCOMP=
ILER_RT_BUILD_MEMPROF=3DOFF \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DCOMP=
ILER_RT_BUILD_LIBFUZZER=3DOFF \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DCOMPILER_=
RT_DEFAULT_TARGET_ARCH=3D${@get_compiler_rt_arch(bb, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DLLVM=
_ENABLE_RUNTIMES=3D${RUNTIMES} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DLLVM=
_LIBDIR_SUFFIX=3D${LLVM_LIBDIR_SUFFIX} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DLLVM=
_APPEND_VC_REV=3DOFF \<br>
@@ -86,7 +90,7 @@ EXTRA_OECMAKE +=3D &quot;-DCMAKE_BUILD_TYPE=3DRelWithDebI=
nfo \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DCOMP=
ILER_RT_DEFAULT_TARGET_ONLY=3DON \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DLLVM=
_ENABLE_PER_TARGET_RUNTIME_DIR=3DOFF \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DCMAK=
E_POSITION_INDEPENDENT_CODE=3DON \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DCMAKE_C_C=
OMPILER_TARGET=3D${HOST_SYS} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DCMAKE_C_C=
OMPILER_TARGET=3D${@get_compiler_rt_target(bb, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DCOMP=
ILER_RT_INSTALL_PATH=3D${nonarch_libdir}/clang/${INSTALL_VER} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.=
utils.contains(&quot;TC_CXX_RUNTIME&quot;, &quot;llvm&quot;, &quot;${LLVMLI=
BGCCOPTS}&quot;, &quot;&quot;, d)} \<br>
=C2=A0&quot;<br>
-- <br>
2.55.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#246621): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/246621" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/246621</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121427261/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121427261/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000da2374065c522e63--

