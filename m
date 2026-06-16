Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE237CD98E1
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 19:18:40 +0000 (UTC)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5793.1781637512109288866
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 12:18:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GXe7QrfI;
 spf=pass (domain: gmail.com, ip: 74.125.224.47, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-66077c46c5cso4767092d50.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 12:18:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781637511; cv=none;
        d=google.com; s=arc-20240605;
        b=Vmg2S2SAIb9oUC9lUdxAby//73e2lATwjJxYnbv5NM63czuj3+ZBPBvZyjANDlHIuy
         5sOskmxc0HZuHlFrggPVqWxzcSve9OC+8vZAcXnFETfqgzvDn0kybI2XSYwEQdWUN/hg
         gUOqUopDEfQ37FQ7V+o7AfNZNVzO5sfZcIfx/vsNm9CdJoIJqYmb0Ugftm3ZwyDDmO2N
         P/qZofnX0sFkI3RGboSk0nu5pw5ofFtB1b5DRYMPAT0eXaaxryhov2qITwLM6JdvSOvW
         3JRhpgTK4XS+HHAVQriTyZlR0V3wpNUfuwWaEzfxVxQzkrqyT2PTGOOzZfU5BDMIR/1a
         okgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZqSto713TlTX67Ys4BP6G4vmNhwLFcnAJqZxnBfaXkE=;
        fh=W/I3gxW48jXP1SLag7c7jaelclpeUDSsPkIzKXKDUzc=;
        b=QZYJbK/ieRkxVT3dYorTlXKn43gC47pvjztyW6EkiU9Eg+fr1oGnIsJcWPaX1P29iI
         8+leQydfAx7Zmp6puzxa4lLni5RJz3ZoxgYUsPCtarEuP8G7pXx8MVpsjNOxokXtK1oQ
         5gg4fl/M9X8t7WVOFnzaPGT+UurRYqt8pj+DcllN9vMo8BTbEzrVAh+5MbGqukMKHsmW
         GgmvX5WNFA9r4+/45O8VSM3P2DxIZJhLEE/EH13pitwFg2lCaOdceL+94R/mDYGg0lZX
         gHYMps+wYJOkU1O+FIPvJ16bZMSLKFPN7gmYehobtGlLbcoCby0GbN8TxpyAXtZV6fng
         s4/A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781637511; x=1782242311; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZqSto713TlTX67Ys4BP6G4vmNhwLFcnAJqZxnBfaXkE=;
        b=GXe7QrfIEfl5LfDpxHqbLhg96CZXF+gurPjRwkikWOPEdOKNRAVWbPJa+akXSmxgdm
         QnW3wDSM2mCrhwqSRHmYFsb94xmbUbm/0Oa9cl++vnVf3/NWz0kQmdczcVSa7Pr+2lZs
         UkSKs5d0K2Y4VcYygIF+/TcG2fySWvAK7jj6aX10ZzGjR3ahvAZmOYjd1ES/UhIbsS2N
         cxbWoREkrq5rwRkVpMZbUB4IonL6KSi3tmL64F97cROAWbny5CJqy5rCx7afkKmxeKNQ
         T5wCz8817eV39UCeD/UGhYSTYMBmIc8+jlsJP47o0faDjMjm29HaOjjAmtogbeveb9mN
         OdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781637511; x=1782242311;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZqSto713TlTX67Ys4BP6G4vmNhwLFcnAJqZxnBfaXkE=;
        b=rxwcw88w497S5/xnFMeXAwneBVneNK5pArkrvshf+9PwiXCKwq6RTL4U/IYNOW7K4x
         wyWpEQHk9iLyLUrJG206g/1mEEIrIXWyp+EdKTaXhw9V/gLSQdFW7PIyoTRbLHHxQ88m
         YxWmkTqWp+k+LhaRsFplqz4nOwVefFHe4I7Fc+BrrBT5BR5fsN36q6LOdbAWts+4P0ka
         YN9N7ap5+fQo2QgZURPuGbM2kFE/wO2+th5SpsxnLZOBNcKSEhV7Ua8eamW3oOwWCPKI
         Uzb5RyfijJn7ykbM2+F3vs8XS3ZmVls+LMO8igBW0h5reroQ28DXyT8WAFRQ3Fy0o5P7
         jHjA==
X-Gm-Message-State: AOJu0Yz5GouVUpQqjZhH5aIgn5WhLAOkqHoiewxPLAHevn7UfwxaxGeC
	tTVMBYxkZ0LlknMVXDqh0ZhMUXd/qVv0AOfRgqF4XAQGkRBjcB6dB/B6efdzsh8U8QQhHgM+qnr
	/g4yfHxqIEh609i32kK/hMHASxPX9/1A=
X-Gm-Gg: AfdE7cnJt2q+awdGYg0rWV9UEXkihhiXKk2LbJCbMKpaZ2DDMUcOrbRqf9jrjPaSxMs
	Lkp1dUL/b+U7tzZRziJb1EjpvD3CT0vdLHu2aN02wMvk3tc0tuh/tSQ2x4uTRWgfhxaj5+YwuSY
	S8a6DwkYpWvmaJg5R0p9X8pbDYN/+hVCVnb63n+mywj2Ys0bVupOS81q2gR/X7Y2VbxH/DhrFlJ
	3cpck9tOnFtjuUyC+BESO8O3RRRL6SJb6/bhuse4Rx6EhNuYXvDg9dZPeJwSCRifX/iqqW75DLl
	3z7KODz/jpoGV2reWKycsx0DA1Lh/v44nEKlAQLKuL/zakBSOPzGOJdLjIGFc+CNnFqCGSki3Bd
	C9CVHK3tUhmQbyKAwd4as3Z6s1lm1cOBwKxxW9bF9OeG9LEu1XMZCGqSI3RpZyDO2bYC2gO/moT
	TDP/NgkNCSPsM+J+B+8o2umqBPj7zkfVrpuj9TjLk=
X-Received: by 2002:a05:690e:eda:b0:658:d26:d8cf with SMTP id
 956f58d0204a3-662cb92a1d5mr543905d50.23.1781637510956; Tue, 16 Jun 2026
 12:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260616184900.4173394-1-sunilkumar.dora@windriver.com>
In-Reply-To: <20260616184900.4173394-1-sunilkumar.dora@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Jun 2026 12:18:18 -0700
X-Gm-Features: AVVi8CckWXZ4uQFtUROuaeVLPBxSYn02r3ndPY6wNJiWiayKWJ-do_F1GZShu3w
Message-ID: <CAMKF1sqLGBZvL7+BegZXThtJekpc5vS+UOB+b0gDBwAAFR0Dfw@mail.gmail.com>
Subject: Re: [PATCH] clang/llvm: Upgrade to 22.1.8 release
To: "Dora, Sunil Kumar" <sunilkumar.dora@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Sundeep Kokkonda <sundeep.kokkonda@windriver.com>
Content-Type: multipart/alternative; boundary="000000000000f58a04065463ce13"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 19:18:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238956

--000000000000f58a04065463ce13
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Lgtm

On Tue, Jun 16, 2026, 11:49=E2=80=AFAM <sunilkumar.dora@windriver.com> wrot=
e:

> From: Sunil Dora <sunilkumar.dora@windriver.com>
>
> https://discourse.llvm.org/t/llvm-22-1-8-released/91084
>
> Brings following fixes:
> ca7933e47d3a [libc++] Disable mistakenly enabled `optional<T&>`
> constructors for `optional<T>` (#194446)
> 208ef916cf20 [WebAssembly] narrow instructions use signed saturation
> (#201798)
> e80beda6e255 [VPlan] Account for any-of costs in legacy cost model
> 3397c37d5d31 Inline stack probes immediately after `allocateStack` in
> `eliminateCallFramePseudoInstr` (#195456)
> 1f5aee55a3fc [DAG] Narrow vselect mask to vXi1 in foldToMaskedStore
> (#201609)
> 070e505ce21d [LLD][ELF] Add missing initialization of Symbol `used` membe=
r.
> 761b9134dd9b [BPF] treat compiler fence as codegen no-op (#196734)
> 724301d98c6e Fix "Cannot select" crash on bitcast between f64 and int
> vector types (#201509)
> 60c18c6aeaed [CMake][Release] Use llvm-bitcode-strip on Darwin for build
> with -ffat-lto-objects (#200764)
> b65aa9b5ea8d [Clang] Profile the NNS of UnresolvedUsingType and
> CXXThisType correctly in concept hashing (#199617)
> b4fe3880d09b Bump version to 22.1.8
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
> index 86048e791c..1458af3681 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -482,7 +482,7 @@ RECIPE_MAINTAINER:pn-linux-yocto-tiny =3D "Bruce
> Ashfield <bruce.ashfield@gmail.co
>  RECIPE_MAINTAINER:pn-lld =3D "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-lldb =3D "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-llvm =3D "Khem Raj <raj.khem@gmail.com>"
> -RECIPE_MAINTAINER:pn-llvm-project-source-22.1.7 =3D "Khem Raj <
> raj.khem@gmail.com>"
> +RECIPE_MAINTAINER:pn-llvm-project-source-22.1.8 =3D "Khem Raj <
> raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-llvm-tblgen-native =3D "Khem Raj <raj.khem@gmail.co=
m>"
>  RECIPE_MAINTAINER:pn-log4cplus =3D "Unassigned <unassigned@yoctoproject.=
org
> >"
>  RECIPE_MAINTAINER:pn-logrotate =3D "Yi Zhao <yi.zhao@windriver.com>"
> diff --git a/meta/recipes-devtools/clang/common-clang.inc
> b/meta/recipes-devtools/clang/common-clang.inc
> index 1dd7903f32..ed628008e0 100644
> --- a/meta/recipes-devtools/clang/common-clang.inc
> +++ b/meta/recipes-devtools/clang/common-clang.inc
> @@ -5,7 +5,7 @@ LLVM_HTTP ?=3D "https://github.com/llvm"
>
>  MAJOR_VER =3D "22"
>  MINOR_VER =3D "1"
> -PATCH_VER =3D "7"
> +PATCH_VER =3D "8"
>  # could be 'rcX' or 'git' or empty ( for release )
>  VER_SUFFIX =3D ""
>
> diff --git a/meta/recipes-devtools/clang/common.inc
> b/meta/recipes-devtools/clang/common.inc
> index 3e171624e1..441ea099a9 100644
> --- a/meta/recipes-devtools/clang/common.inc
> +++ b/meta/recipes-devtools/clang/common.inc
> @@ -17,7 +17,7 @@ BASEURI ?=3D
> "${LLVM_HTTP}/llvm-project/releases/download/llvmorg-${PV}${VER_SUFFI
>  UPSTREAM_CHECK_URI =3D "${LLVM_HTTP}/llvm-project/releases/"
>  UPSTREAM_CHECK_REGEX =3D "releases/tag/llvmorg-?(?P<pver>\d+(\.\d+)+)"
>  SOURCEDIR ?=3D "llvm-project-${PV}${VER_SUFFIX}.src"
> -SRC_URI[sha256sum] =3D
> "5cc4a3f12bba50b6bdfb4b61bdc852117a0ff2517807c3902fc13267fb93562e"
> +SRC_URI[sha256sum] =3D
> "922f1817a0df7b1489272d18134ee0087a8b068828f87ac63b9861b1a9965888"
>
>  SRC_URI =3D "\
>      ${BASEURI} \
> --
> 2.49.0
>
>

--000000000000f58a04065463ce13
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Lgtm</div><br><div class=3D"gmail_quote gmail_quote_conta=
iner"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 16, 2026, 11:49=E2=
=80=AFAM  &lt;<a href=3D"mailto:sunilkumar.dora@windriver.com">sunilkumar.d=
ora@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">From: Sunil Dora &lt;<a href=3D"mailto:sunilkumar.dora@win=
driver.com" target=3D"_blank" rel=3D"noreferrer">sunilkumar.dora@windriver.=
com</a>&gt;<br>
<br>
<a href=3D"https://discourse.llvm.org/t/llvm-22-1-8-released/91084" rel=3D"=
noreferrer noreferrer" target=3D"_blank">https://discourse.llvm.org/t/llvm-=
22-1-8-released/91084</a><br>
<br>
Brings following fixes:<br>
ca7933e47d3a [libc++] Disable mistakenly enabled `optional&lt;T&amp;&gt;` c=
onstructors for `optional&lt;T&gt;` (#194446)<br>
208ef916cf20 [WebAssembly] narrow instructions use signed saturation (#2017=
98)<br>
e80beda6e255 [VPlan] Account for any-of costs in legacy cost model<br>
3397c37d5d31 Inline stack probes immediately after `allocateStack` in `elim=
inateCallFramePseudoInstr` (#195456)<br>
1f5aee55a3fc [DAG] Narrow vselect mask to vXi1 in foldToMaskedStore (#20160=
9)<br>
070e505ce21d [LLD][ELF] Add missing initialization of Symbol `used` member.=
<br>
761b9134dd9b [BPF] treat compiler fence as codegen no-op (#196734)<br>
724301d98c6e Fix &quot;Cannot select&quot; crash on bitcast between f64 and=
 int vector types (#201509)<br>
60c18c6aeaed [CMake][Release] Use llvm-bitcode-strip on Darwin for build wi=
th -ffat-lto-objects (#200764)<br>
b65aa9b5ea8d [Clang] Profile the NNS of UnresolvedUsingType and CXXThisType=
 correctly in concept hashing (#199617)<br>
b4fe3880d09b Bump version to 22.1.8<br>
<br>
Signed-off-by: Sunil Dora &lt;<a href=3D"mailto:sunilkumar.dora@windriver.c=
om" target=3D"_blank" rel=3D"noreferrer">sunilkumar.dora@windriver.com</a>&=
gt;<br>
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
index 86048e791c..1458af3681 100644<br>
--- a/meta/conf/distro/include/maintainers.inc<br>
+++ b/meta/conf/distro/include/maintainers.inc<br>
@@ -482,7 +482,7 @@ RECIPE_MAINTAINER:pn-linux-yocto-tiny =3D &quot;Bruce A=
shfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.co" target=3D"_blank" re=
l=3D"noreferrer">bruce.ashfield@gmail.co</a><br>
=C2=A0RECIPE_MAINTAINER:pn-lld =3D &quot;Khem Raj &lt;<a href=3D"mailto:raj=
.khem@gmail.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a=
>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-lldb =3D &quot;Khem Raj &lt;<a href=3D"mailto:ra=
j.khem@gmail.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</=
a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-llvm =3D &quot;Khem Raj &lt;<a href=3D"mailto:ra=
j.khem@gmail.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</=
a>&gt;&quot;<br>
-RECIPE_MAINTAINER:pn-llvm-project-source-22.1.7 =3D &quot;Khem Raj &lt;<a =
href=3D"mailto:raj.khem@gmail.com" target=3D"_blank" rel=3D"noreferrer">raj=
.khem@gmail.com</a>&gt;&quot;<br>
+RECIPE_MAINTAINER:pn-llvm-project-source-22.1.8 =3D &quot;Khem Raj &lt;<a =
href=3D"mailto:raj.khem@gmail.com" target=3D"_blank" rel=3D"noreferrer">raj=
.khem@gmail.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-llvm-tblgen-native =3D &quot;Khem Raj &lt;<a hre=
f=3D"mailto:raj.khem@gmail.com" target=3D"_blank" rel=3D"noreferrer">raj.kh=
em@gmail.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-log4cplus =3D &quot;Unassigned &lt;<a href=3D"ma=
ilto:unassigned@yoctoproject.org" target=3D"_blank" rel=3D"noreferrer">unas=
signed@yoctoproject.org</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-logrotate =3D &quot;Yi Zhao &lt;<a href=3D"mailt=
o:yi.zhao@windriver.com" target=3D"_blank" rel=3D"noreferrer">yi.zhao@windr=
iver.com</a>&gt;&quot;<br>
diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-de=
vtools/clang/common-clang.inc<br>
index 1dd7903f32..ed628008e0 100644<br>
--- a/meta/recipes-devtools/clang/common-clang.inc<br>
+++ b/meta/recipes-devtools/clang/common-clang.inc<br>
@@ -5,7 +5,7 @@ LLVM_HTTP ?=3D &quot;<a href=3D"https://github.com/llvm" re=
l=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/llvm</a>&q=
uot;<br>
<br>
=C2=A0MAJOR_VER =3D &quot;22&quot;<br>
=C2=A0MINOR_VER =3D &quot;1&quot;<br>
-PATCH_VER =3D &quot;7&quot;<br>
+PATCH_VER =3D &quot;8&quot;<br>
=C2=A0# could be &#39;rcX&#39; or &#39;git&#39; or empty ( for release )<br=
>
=C2=A0VER_SUFFIX =3D &quot;&quot;<br>
<br>
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools=
/clang/common.inc<br>
index 3e171624e1..441ea099a9 100644<br>
--- a/meta/recipes-devtools/clang/common.inc<br>
+++ b/meta/recipes-devtools/clang/common.inc<br>
@@ -17,7 +17,7 @@ BASEURI ?=3D &quot;${LLVM_HTTP}/llvm-project/releases/dow=
nload/llvmorg-${PV}${VER_SUFFI<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;${LLVM_HTTP}/llvm-project/releases/&quot=
;<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;releases/tag/llvmorg-?(?P&lt;pver&gt;\=
d+(\.\d+)+)&quot;<br>
=C2=A0SOURCEDIR ?=3D &quot;llvm-project-${PV}${VER_SUFFIX}.src&quot;<br>
-SRC_URI[sha256sum] =3D &quot;5cc4a3f12bba50b6bdfb4b61bdc852117a0ff2517807c=
3902fc13267fb93562e&quot;<br>
+SRC_URI[sha256sum] =3D &quot;922f1817a0df7b1489272d18134ee0087a8b068828f87=
ac63b9861b1a9965888&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${BASEURI} \<br>
-- <br>
2.49.0<br>
<br>
</blockquote></div>

--000000000000f58a04065463ce13--

