Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96088CD6E5D
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 21:30:07 +0000 (UTC)
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6226.1780435802253454396
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 14:30:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gndBvaWd;
 spf=pass (domain: gmail.com, ip: 74.125.224.46, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-660512d80b4so24824d50.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 14:30:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780435801; cv=none;
        d=google.com; s=arc-20240605;
        b=kQBHV934rOPlBmsfd8KjtZIRmcpGeaq5xefrS9eKSbpOXah3/mKBXrPYW+VQ7Cz5ao
         SeaQn/6exe8X1As58Es7GNF+qUjlfP90T9dj1s2aERzVZf5GtimbXNDyA68mOcgRU7d4
         sEXQqngvlqfF2I5AKg7PuJWEpO1Zv/bTvScp4Ivt/Vj+uDkm2wcpbiOBS+0LQeGytU1q
         z1oLlu1p6BhO7txc4ODK99K9EoghvWzdRHjH2943K8BzmMyfIOEoC2sxB952njpQV85q
         h/x+PQIUzDLJm1Ud4X3OZo8ZLmD7oaqaHv8bofJM2bG530iT5jMMqspjMOXD+YJzn2Z5
         2kHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zisA5nBWUyujNGjSEmUY3OuOjZCB4jL8SEQDRmhIRsI=;
        fh=lub5HoYDtF7o1gzGCIn2GPuoDT06oDuVN7PMarQzVco=;
        b=lrkKUKr+xFG053DOAoph7u/tduwwwrIXxoGLmr32jtZr1b0kJ9B/F06R0ycHMCxV+F
         php2FLPY050gheka7Nf0wZrfwVX5OVgOwFKPKfhXruyH/Gzk0FNNRob0WNQtp6apUIqw
         nMMpMn0JNHB7rfHrdVCVUoVdEvC7Jt32SEOV/39nu12Tivs/E9aPbyE7PvDfp/ECcqj1
         tO5URgAXPGzMtPlTiwg+6Zi7W2dNyYIIp1UN/DEv6UEzX2G1wkP4GieFa6vgbhZ9mDhK
         GjRFCrbfcwwQW8td4vnoWzA7C1malSZzRvGpkSIwtun7LLqnvl03Ve5BSlK1XfWUQvqq
         7O8w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780435801; x=1781040601; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zisA5nBWUyujNGjSEmUY3OuOjZCB4jL8SEQDRmhIRsI=;
        b=gndBvaWdjrNKekYufk5f2wtgfE/aaG/+56YpsBuk1h9TxQfP9+jTl2YSxU57w5uvYS
         9q92UcZdKgwHP9uXGnUTXN5P+er+YQT/LOnZX/xxFJtBMbVJ6KJxAp2kt1uPqH2DUvzN
         uWCaCVYJZ/X2irqiI9Ao+NLp9iQObWE7uf2q/ENimlKZ/3juA7VX0BPNC1D0XL/gGQMZ
         8xsLA/ABYsUIuLB3vovwc5bk5aMcVTTFefc4fqpUdWVPRdVjB0VA1oGijorfff/ZMmui
         sMTUoyy3MXlzNjwmLOQTXebsrPymxLmXixl3UUT7QYyevN0rOlymn/GmQERcylqbdkGx
         ngEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780435801; x=1781040601;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zisA5nBWUyujNGjSEmUY3OuOjZCB4jL8SEQDRmhIRsI=;
        b=BFKlXJpzbms6f/P1IAsfdPW9STLWjYT1IWCLM8re9q2ut6sdYgSh/GjaZxtKqCGEOh
         a+m2CYYnbqgpNXaYlebRY/dCh1KfAOI5RPxMG9RNQPc8lbXw4+Lw7f1hPVqQhg42iZF0
         biPwNRl1kE09aqa5lDLeP8a6TFP46yov0JWZTXHx5tWXjsuBTm3wgEdNOHjWU1nBNNTB
         HBYUOW3lP2LeZAalU681eOXnmX9SceZV/gMN/ulUKQ8Qrn47JhQxgWx/2GjeSoEQEEqW
         lVbeQz80+5urDQBzYcdSiFYIRDsf3GVVevFgg2L3Xfq7pSn5/CKexp3QfqL97/dGL7rK
         MVLw==
X-Gm-Message-State: AOJu0YxjAx9MjE0ZDMnB2rd1hCAxOhm+gJu5+E+WDm1iSuMsRaU6NQ0c
	gx+f/fsS5/wIldVALMX1MDPnQtiJrvF6B/Nz3I8L5QnCCKg4YYD0BdQmmGRI3HLlwN0m3A/Oiay
	0eAhxfnpyJ17cJIdmcTbvEwwVJJQcsEM=
X-Gm-Gg: Acq92OE0knri+sus2CYCYBzlzj2Q1Gr6ozR70+2rzlVP2Gim2SnrRnp49V8ZTigaBtT
	mJNv1u/akw4SpzoP3xHa7fbRhSjZu580CjF/PNGLrPUco9gg0gtZwepVvFVAS148z1xL4hHTB9Q
	RC8QypFhg1HWzgXhxzy6Fd8aylobE5YEg7SAahiozioqQEOQUkYmXVSbV8T5+vc4U3qVBFxhMPI
	Mpqqhgp97pNxhEqmjuijew8YeNOc4OaYDabmEFTgQWVD891y5z0QQ69ph2y68wy7DdEE02g/Ef6
	UyLAato336xgfzzRaqVpKWIErl/REPeb3A8PR6JW/wjwqV6iGQYQ6ywYMrAtLIqXYWFNb8IMzfs
	h3fTgTWqXLNKmCbJnvTad7J/3/Exwo6AXtqwhUR7uZ58eFntBDR9DK+IVKO7OGdFmZyW/e7CmAp
	4/qxhpzLq1+pUev2Z1
X-Received: by 2002:a05:690e:1501:b0:660:71e9:d46e with SMTP id
 956f58d0204a3-660dc8349a1mr336882d50.5.1780435801034; Tue, 02 Jun 2026
 14:30:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260602164136.508127-1-sunilkumar.dora@windriver.com>
In-Reply-To: <20260602164136.508127-1-sunilkumar.dora@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 2 Jun 2026 23:29:33 +0200
X-Gm-Features: AVHnY4JLS2Zur9MP0BlP-Ew2I1tlnL6hmUwTuoi3NKuzzL4cRYxh-MZVrbLB5sk
Message-ID: <CAMKF1sqsk623P55hb-9i0VSuC_yU18g5fUaP4BBvQGQ+_ZwUcw@mail.gmail.com>
Subject: Re: [PATCH] clang/llvm: Upgrade to 22.1.7 release
To: sunilkumar.dora@windriver.com
Cc: openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org, martin.jansa@gmail.com, 
	Sundeep.Kokkonda@windriver.com
Content-Type: multipart/alternative; boundary="00000000000077559806534c0314"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 21:30:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238073

--00000000000077559806534c0314
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

lgtm

On Tue, Jun 2, 2026 at 6:41=E2=80=AFPM <sunilkumar.dora@windriver.com> wrot=
e:

> From: Sunil Dora <sunilkumar.dora@windriver.com>
>
> https://discourse.llvm.org/t/llvm-22-1-7-released/90961
>
> Brings following fixes:
> a255c1ed36a1 [WebAssembly] Avoid crash in LateEHPrepare with empty cleanu=
p
> pads (#200322)
> a2b779045093 [SystemZ] Fix off-by-one error in backend (#200141)
> 2615295c15ba [libc++] Fix multi{map,set}::extract not returning the first
> matching element (#199703)
> a760d7c07024 [LLD] [COFF] Fix handling of immediates in
> ARM64_SECREL_HIGH12A (#200060)
> 294ae8d1e62a [PowerPC] Drop invalid range metadata when lowering i64 load
> to fp in INT_TO_FP (#198705)
> 6db0725886bb [X86] lowerV64I8Shuffle - avoid
> lowerShuffleAsRepeatedMaskAndLanePermute call on VBMI targets (#183109)
> c43c9b426055 [X86] lowerV64I8Shuffle - prefer VPERMV3 byte shuffles to
> OR(PSHUFB,PSHUFB) on VBMI targets (#182852)
> 6ac68778a76e [X86] Add test coverage for #137422 (#182832)
> ad9524f38657 [PowerPC] Fix i128 vcmpequb optimization for loads with rang=
e
> metadata and small constants (#196801)
> 48967cc1a0d4 build: adjust LLDB and clang library naming on Windows
> (#185084)
> 8798085803f1 [libc] Demote compiler check error to a warning (#198033)
> 6e5effc4990b [LoongArch] Revert "Add patterns to support vector type
> average instructions generation" (#198306)
> 4d5dffb59420 [ELF] Initialize Symbol fields in the constructor instead of
> via memset (#198129)
> 823afe046164 Reland [C++20] [Modules] Don't profiling the callee of
> CXXFoldExpr (#190732) (#195983)
> e624f1204282 [CoroSplit] Never collect allocas used by catchpad into fram=
e
> (#186728)
> 81c69e140401 Bump version to 22.1.7
>
> Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
> ---
>  meta/conf/distro/include/maintainers.inc     | 2 +-
>  meta/recipes-devtools/clang/common-clang.inc | 2 +-
>  meta/recipes-devtools/clang/common.inc       | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> index af4ea1b14f..66902616f5 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -482,7 +482,7 @@ RECIPE_MAINTAINER:pn-linux-yocto-tiny =3D "Bruce
> Ashfield <bruce.ashfield@gmail.co
>  RECIPE_MAINTAINER:pn-lld =3D "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-lldb =3D "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-llvm =3D "Khem Raj <raj.khem@gmail.com>"
> -RECIPE_MAINTAINER:pn-llvm-project-source-22.1.6 =3D "Khem Raj <
> raj.khem@gmail.com>"
> +RECIPE_MAINTAINER:pn-llvm-project-source-22.1.7 =3D "Khem Raj <
> raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-llvm-tblgen-native =3D "Khem Raj <raj.khem@gmail.co=
m>"
>  RECIPE_MAINTAINER:pn-log4cplus =3D "Unassigned <unassigned@yoctoproject.=
org
> >"
>  RECIPE_MAINTAINER:pn-logrotate =3D "Yi Zhao <yi.zhao@windriver.com>"
> diff --git a/meta/recipes-devtools/clang/common-clang.inc
> b/meta/recipes-devtools/clang/common-clang.inc
> index a7934951e0..1dd7903f32 100644
> --- a/meta/recipes-devtools/clang/common-clang.inc
> +++ b/meta/recipes-devtools/clang/common-clang.inc
> @@ -5,7 +5,7 @@ LLVM_HTTP ?=3D "https://github.com/llvm"
>
>  MAJOR_VER =3D "22"
>  MINOR_VER =3D "1"
> -PATCH_VER =3D "6"
> +PATCH_VER =3D "7"
>  # could be 'rcX' or 'git' or empty ( for release )
>  VER_SUFFIX =3D ""
>
> diff --git a/meta/recipes-devtools/clang/common.inc
> b/meta/recipes-devtools/clang/common.inc
> index c77c39d47d..3e171624e1 100644
> --- a/meta/recipes-devtools/clang/common.inc
> +++ b/meta/recipes-devtools/clang/common.inc
> @@ -17,7 +17,7 @@ BASEURI ?=3D
> "${LLVM_HTTP}/llvm-project/releases/download/llvmorg-${PV}${VER_SUFFI
>  UPSTREAM_CHECK_URI =3D "${LLVM_HTTP}/llvm-project/releases/"
>  UPSTREAM_CHECK_REGEX =3D "releases/tag/llvmorg-?(?P<pver>\d+(\.\d+)+)"
>  SOURCEDIR ?=3D "llvm-project-${PV}${VER_SUFFIX}.src"
> -SRC_URI[sha256sum] =3D
> "6e0b376a1f6d9873e7dfb09ae6e04b9c7024400f01733fa4c29be69d5c138bc2"
> +SRC_URI[sha256sum] =3D
> "5cc4a3f12bba50b6bdfb4b61bdc852117a0ff2517807c3902fc13267fb93562e"
>
>  SRC_URI =3D "\
>      ${BASEURI} \
> --
> 2.49.0
>
>

--00000000000077559806534c0314
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">lgtm</div><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 2, 2026 at 6:41=E2=
=80=AFPM &lt;<a href=3D"mailto:sunilkumar.dora@windriver.com">sunilkumar.do=
ra@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">From: Sunil Dora &lt;<a href=3D"mailto:sunilkumar.dora@wind=
river.com" target=3D"_blank">sunilkumar.dora@windriver.com</a>&gt;<br>
<br>
<a href=3D"https://discourse.llvm.org/t/llvm-22-1-7-released/90961" rel=3D"=
noreferrer" target=3D"_blank">https://discourse.llvm.org/t/llvm-22-1-7-rele=
ased/90961</a><br>
<br>
Brings following fixes:<br>
a255c1ed36a1 [WebAssembly] Avoid crash in LateEHPrepare with empty cleanup =
pads (#200322)<br>
a2b779045093 [SystemZ] Fix off-by-one error in backend (#200141)<br>
2615295c15ba [libc++] Fix multi{map,set}::extract not returning the first m=
atching element (#199703)<br>
a760d7c07024 [LLD] [COFF] Fix handling of immediates in ARM64_SECREL_HIGH12=
A (#200060)<br>
294ae8d1e62a [PowerPC] Drop invalid range metadata when lowering i64 load t=
o fp in INT_TO_FP (#198705)<br>
6db0725886bb [X86] lowerV64I8Shuffle - avoid lowerShuffleAsRepeatedMaskAndL=
anePermute call on VBMI targets (#183109)<br>
c43c9b426055 [X86] lowerV64I8Shuffle - prefer VPERMV3 byte shuffles to OR(P=
SHUFB,PSHUFB) on VBMI targets (#182852)<br>
6ac68778a76e [X86] Add test coverage for #137422 (#182832)<br>
ad9524f38657 [PowerPC] Fix i128 vcmpequb optimization for loads with range =
metadata and small constants (#196801)<br>
48967cc1a0d4 build: adjust LLDB and clang library naming on Windows (#18508=
4)<br>
8798085803f1 [libc] Demote compiler check error to a warning (#198033)<br>
6e5effc4990b [LoongArch] Revert &quot;Add patterns to support vector type a=
verage instructions generation&quot; (#198306)<br>
4d5dffb59420 [ELF] Initialize Symbol fields in the constructor instead of v=
ia memset (#198129)<br>
823afe046164 Reland [C++20] [Modules] Don&#39;t profiling the callee of CXX=
FoldExpr (#190732) (#195983)<br>
e624f1204282 [CoroSplit] Never collect allocas used by catchpad into frame =
(#186728)<br>
81c69e140401 Bump version to 22.1.7<br>
<br>
Signed-off-by: Sunil Dora &lt;<a href=3D"mailto:sunilkumar.dora@windriver.c=
om" target=3D"_blank">sunilkumar.dora@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0| 2 +-<br=
>
=C2=A0meta/recipes-devtools/clang/common-clang.inc | 2 +-<br>
=C2=A0meta/recipes-devtools/clang/common.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 =
+-<br>
=C2=A03 files changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc<br>
index af4ea1b14f..66902616f5 100644<br>
--- a/meta/conf/distro/include/maintainers.inc<br>
+++ b/meta/conf/distro/include/maintainers.inc<br>
@@ -482,7 +482,7 @@ RECIPE_MAINTAINER:pn-linux-yocto-tiny =3D &quot;Bruce A=
shfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.co" target=3D"_blank">br=
uce.ashfield@gmail.co</a><br>
=C2=A0RECIPE_MAINTAINER:pn-lld =3D &quot;Khem Raj &lt;<a href=3D"mailto:raj=
.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-lldb =3D &quot;Khem Raj &lt;<a href=3D"mailto:ra=
j.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-llvm =3D &quot;Khem Raj &lt;<a href=3D"mailto:ra=
j.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;&quot;<br>
-RECIPE_MAINTAINER:pn-llvm-project-source-22.1.6 =3D &quot;Khem Raj &lt;<a =
href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>=
&gt;&quot;<br>
+RECIPE_MAINTAINER:pn-llvm-project-source-22.1.7 =3D &quot;Khem Raj &lt;<a =
href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>=
&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-llvm-tblgen-native =3D &quot;Khem Raj &lt;<a hre=
f=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt=
;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-log4cplus =3D &quot;Unassigned &lt;<a href=3D"ma=
ilto:unassigned@yoctoproject.org" target=3D"_blank">unassigned@yoctoproject=
.org</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-logrotate =3D &quot;Yi Zhao &lt;<a href=3D"mailt=
o:yi.zhao@windriver.com" target=3D"_blank">yi.zhao@windriver.com</a>&gt;&qu=
ot;<br>
diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-de=
vtools/clang/common-clang.inc<br>
index a7934951e0..1dd7903f32 100644<br>
--- a/meta/recipes-devtools/clang/common-clang.inc<br>
+++ b/meta/recipes-devtools/clang/common-clang.inc<br>
@@ -5,7 +5,7 @@ LLVM_HTTP ?=3D &quot;<a href=3D"https://github.com/llvm" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/llvm</a>&quot;<br>
<br>
=C2=A0MAJOR_VER =3D &quot;22&quot;<br>
=C2=A0MINOR_VER =3D &quot;1&quot;<br>
-PATCH_VER =3D &quot;6&quot;<br>
+PATCH_VER =3D &quot;7&quot;<br>
=C2=A0# could be &#39;rcX&#39; or &#39;git&#39; or empty ( for release )<br=
>
=C2=A0VER_SUFFIX =3D &quot;&quot;<br>
<br>
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools=
/clang/common.inc<br>
index c77c39d47d..3e171624e1 100644<br>
--- a/meta/recipes-devtools/clang/common.inc<br>
+++ b/meta/recipes-devtools/clang/common.inc<br>
@@ -17,7 +17,7 @@ BASEURI ?=3D &quot;${LLVM_HTTP}/llvm-project/releases/dow=
nload/llvmorg-${PV}${VER_SUFFI<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;${LLVM_HTTP}/llvm-project/releases/&quot=
;<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;releases/tag/llvmorg-?(?P&lt;pver&gt;\=
d+(\.\d+)+)&quot;<br>
=C2=A0SOURCEDIR ?=3D &quot;llvm-project-${PV}${VER_SUFFIX}.src&quot;<br>
-SRC_URI[sha256sum] =3D &quot;6e0b376a1f6d9873e7dfb09ae6e04b9c7024400f01733=
fa4c29be69d5c138bc2&quot;<br>
+SRC_URI[sha256sum] =3D &quot;5cc4a3f12bba50b6bdfb4b61bdc852117a0ff2517807c=
3902fc13267fb93562e&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${BASEURI} \<br>
-- <br>
2.49.0<br>
<br>
</blockquote></div>

--00000000000077559806534c0314--

