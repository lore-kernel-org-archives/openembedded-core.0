Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4020DCD5BBF
	for <webhook@archiver.kernel.org>; Sat, 23 May 2026 01:30:31 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1036.1779499821291706717
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2026 18:30:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jUl9sm2Q;
 spf=pass (domain: gmail.com, ip: 74.125.224.48, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-65c7efdb7d8so8432871d50.3
        for <openembedded-core@lists.openembedded.org>; Fri, 22 May 2026 18:30:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779499820; cv=none;
        d=google.com; s=arc-20240605;
        b=Fdowq5f+YC1j0x9oMeHrlOJZgUYr+bH7hIOhaZvzZWVuWnw+M5oLylt/CWHKkozEUF
         rxwOMFf6vQhyVxT0zWIkkQlikVJlV30tZmT9Cb5g5MNppJBmJ88+CWMGLbjfVqjJ0eqb
         kHrUDUQkD5pBqFeoI4X1kCkY0SnFrb264pxz0DP8K2UpcRZU4kCWSnRUIYoY+MHgaNNp
         O989v5jgZerPXGyp3EZwm4AMYRpgqNXVSSRYk9RUvHJO1Q0cvx6yjEs2Yt7A5FWURbDb
         CYTZqgf1foYPlZGxauPI0nVLKtxtJ1J+XQBi62A6LaZTJsCiNhFJkGgSqKuWs6h/HJHR
         8U0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JUce224ZQS34jCt5GO2DDn4mLslSZ7no5BFQrBrL4y8=;
        fh=LF7ElVRlXKDPLPNPaC2ukmFxcz+X7tJiIlC9OM0P330=;
        b=j5xLUniNVe/01VlqXWPjAOXY5q4/tMPFlOCUbmg4RfjWGa4zDqdNnZSDQkuXmP42Qi
         TmAUsJhBrxkIP4h+oNb1KAVtyCsh+eEbHvlr+f4NhQe9r+0/2wJSiMI/phD3/NqCHpxG
         DFkoExnYjy0XUg4MLk+VclVVL9+1nYXX5qDlcRJ3m07sLjT+sfDCtdGigr0E1LYP2r+l
         EpL02xGBF8vKXxb96gGy68ku0VoFkF7xv1wSD3Btq15AY1YEi3B4/OipSTZeCfDgDE/V
         up8rc/zd+10koyKqrngeCkntQLIQZyYeIGJlDd2Fmv5YjYAOlTZqEHLyLY1fPus56osE
         21BA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779499820; x=1780104620; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JUce224ZQS34jCt5GO2DDn4mLslSZ7no5BFQrBrL4y8=;
        b=jUl9sm2QIg/XwA1jkx+QUHq9yTLstKs6WPpYFjhwioEgTG9R08Lah56PKg8Fh7rI/P
         t3usTHmWN+uVhJ6K3x2G3Y4zmJZZl7siDzjLoVP3oTxwK+BpDKMkRnzfEB88bLISNmMJ
         qqJ0XQ87pJbuQy+rZY2wpq11xmmJ29IxWi6ayhn+2nNFdFOv2stivbkbkCKptU8mUFaJ
         rYh4yLcCQtN3ixjvLu5H+nPm2RDb5/bAitJDaD0ojtenHQsH+Tw3cJxEM88Q616GtauD
         sIOj+V9/mQB+WGqEPQWmlf0gB976X46UNIz9kB3GgN5LaN8MANiwVV7mfErGvgRD6ORV
         ycow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779499820; x=1780104620;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JUce224ZQS34jCt5GO2DDn4mLslSZ7no5BFQrBrL4y8=;
        b=s3rAkc9ZKHz23mYweRuONuNIdpWnqbadIqNw6TGGvcEkgVEhPikY7BvQLMLuO/J7Kq
         HpBwpvkemgaIvNzz5/Q0xAIFeLeJUOLUTAy6MNWI/L98kvELzyW8nI8Eby4FVwoKv+G4
         umlWPRpCBxqM9vXUEhn9QSrJiTjmnCihzojJKHDXpxugVuED7gIQ/DEe/XSRRgvHNZtY
         4bkkHW7X856Sl89laPLCtk5Mr3AP9KFKYGvcR9M/6vbdJT4Fw7CTWH8KHa0EgcH0fdDd
         osDCyeO6EFxtUqK/sJHRvE/qoRKVE49BcCpYm0tO7ZnqWaDw9u779LDsmZYY6O6sCYU1
         RLkg==
X-Gm-Message-State: AOJu0Yy+reFBUGHikAwgd6+Yn2s/euasOkkR+090ikhpvdnErUqAWNcx
	D8JPHbJPl9kwc3smU1xrlaR2PSkm0Ye8q0PRmrihk4kRcpCVpcEBsNMUWNpoehSC+zIELcH/aW8
	/lFM2sETgj8b0lahMY+1Tz1BMM0mPciM=
X-Gm-Gg: Acq92OGiP6wbStCuHZTHrviFEnPQSYDer4hHLipB9T0PwQeu0ve00dXnPvXRzVU32lV
	83uY+1JEsb642oywdjcu5g3M1AadRVNAosWKMv9xPuqC0RHzNkIJ6du2bIhN8GBEfiipt9cgfU8
	5BzAnSFEBF7GNoyyQf0UMdNbvaEXuFd8sNeOWo+gJPqd2JuiDaYK+BxzVIoUpTZk45K8piirxUl
	6rkm2B7h3SiZnQoN5ZqBKfLkZdNNIJ29mLwymPnO334dHnlSoq/+Pl2n76QnLeaPLh2YZ8A/MKA
	QnxO8ImzqrgW9lk6iKmZ5/w/ILbdMHv0prKE6iJAoemvphyG11qXJVSZODDcMUhZ7kD5JBnV7e6
	ifJ1msaq4shuT6mgpTlr8SOIodzVuzbolM60V4os3oW4jRE4PjRJCGapq0Il63v7CavE+LjPgWb
	yDxVrn
X-Received: by 2002:a05:690e:4393:b0:654:2882:42b8 with SMTP id
 956f58d0204a3-65ec98f0723mr4172163d50.35.1779499820257; Fri, 22 May 2026
 18:30:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260522082259.1610223-1-martin.jansa@gmail.com>
In-Reply-To: <20260522082259.1610223-1-martin.jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 May 2026 18:29:53 -0700
X-Gm-Features: AVHnY4LnTLR9QtTjGZAsdSWgjuYfFRy9hfbei7USnAe-F-xgaSKgVhXH6uO1ElM
Message-ID: <CAMKF1sr1CcsgAwwef94_N4L7bT7aHjsa2xGh6e9TS-+bpXinng@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] clang/llvm: Upgrade to 22.1.6 release
To: martin.jansa@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000aa1897065272166d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 May 2026 01:30:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237557

--000000000000aa1897065272166d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

lgtm

On Fri, May 22, 2026 at 1:23=E2=80=AFAM Martin Jansa via lists.openembedded=
.org
<martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:

> From: Martin Jansa <martin.jansa@gmail.com>
>
> https://discourse.llvm.org/t/llvm-22-1-6-released/90838
>
> Brings following fixes:
>
> fc4aad7b5db3 [Clang][Coroutines] Don't emit fake uses for coroutine
> parameters (#194690)
> 5fb52fc3fda6 [Coverage] Fix assertion failure when a -isystem header
> invokes a user macro (#195427)
> fd10d8f31077 [DAGTypeLegalizer] Add missing BR_CC handler for
> soft-promoted half operands (#196214)
> c0262e742787 [SystemZ] Fix internal error with single-element vector type=
s
> (#196127)
> cbb1eb533ded [lldb-dap] Fix crash in source request handler (#195847)
> 897d3e2b2a63 [lldb][windows] fix cross DLL file descriptor lookup crash
> (#195855)
> 60e3203b2e90 Bump version to 22.1.6
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
> Depends on
> https://lists.openembedded.org/g/openembedded-core/message/237462
> unfortunately doesn't fix clang's ICE when building ffmpeg with
> -march=3Dnehalem
> (builds fine with -march=3Dx86-64-v3 used by qemux86-64 by default nowada=
s).
>
>  meta/conf/distro/include/maintainers.inc     | 2 +-
>  meta/recipes-devtools/clang/common-clang.inc | 2 +-
>  meta/recipes-devtools/clang/common.inc       | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> index 981a3c4fcc..af4ea1b14f 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -482,7 +482,7 @@ RECIPE_MAINTAINER:pn-linux-yocto-tiny =3D "Bruce
> Ashfield <bruce.ashfield@gmail.co
>  RECIPE_MAINTAINER:pn-lld =3D "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-lldb =3D "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-llvm =3D "Khem Raj <raj.khem@gmail.com>"
> -RECIPE_MAINTAINER:pn-llvm-project-source-22.1.5 =3D "Khem Raj <
> raj.khem@gmail.com>"
> +RECIPE_MAINTAINER:pn-llvm-project-source-22.1.6 =3D "Khem Raj <
> raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-llvm-tblgen-native =3D "Khem Raj <raj.khem@gmail.co=
m>"
>  RECIPE_MAINTAINER:pn-log4cplus =3D "Unassigned <unassigned@yoctoproject.=
org
> >"
>  RECIPE_MAINTAINER:pn-logrotate =3D "Yi Zhao <yi.zhao@windriver.com>"
> diff --git a/meta/recipes-devtools/clang/common-clang.inc
> b/meta/recipes-devtools/clang/common-clang.inc
> index d6ad546c59..a7934951e0 100644
> --- a/meta/recipes-devtools/clang/common-clang.inc
> +++ b/meta/recipes-devtools/clang/common-clang.inc
> @@ -5,7 +5,7 @@ LLVM_HTTP ?=3D "https://github.com/llvm"
>
>  MAJOR_VER =3D "22"
>  MINOR_VER =3D "1"
> -PATCH_VER =3D "5"
> +PATCH_VER =3D "6"
>  # could be 'rcX' or 'git' or empty ( for release )
>  VER_SUFFIX =3D ""
>
> diff --git a/meta/recipes-devtools/clang/common.inc
> b/meta/recipes-devtools/clang/common.inc
> index 30bd7e18af..0252d77a7e 100644
> --- a/meta/recipes-devtools/clang/common.inc
> +++ b/meta/recipes-devtools/clang/common.inc
> @@ -17,7 +17,7 @@ BASEURI ?=3D
> "${LLVM_HTTP}/llvm-project/releases/download/llvmorg-${PV}${VER_SUFFI
>  UPSTREAM_CHECK_URI =3D "${LLVM_HTTP}/llvm-project/releases/"
>  UPSTREAM_CHECK_REGEX =3D "releases/tag/llvmorg-?(?P<pver>\d+(\.\d+)+)"
>  SOURCEDIR ?=3D "llvm-project-${PV}${VER_SUFFIX}.src"
> -SRC_URI[sha256sum] =3D
> "7972b87b705a003ce70ab55f9f0fb495d156887cba0eb296d284731139118e2c"
> +SRC_URI[sha256sum] =3D
> "6e0b376a1f6d9873e7dfb09ae6e04b9c7024400f01733fa4c29be69d5c138bc2"
>
>  SRC_URI =3D "\
>      ${BASEURI} \
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#237533):
> https://lists.openembedded.org/g/openembedded-core/message/237533
> Mute This Topic: https://lists.openembedded.org/mt/119438056/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000aa1897065272166d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">lgtm</div><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 22, 2026 at 1:23=E2=
=80=AFAM Martin Jansa via <a href=3D"http://lists.openembedded.org">lists.o=
penembedded.org</a> &lt;martin.jansa=3D<a href=3D"mailto:gmail.com@lists.op=
enembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">From: Martin Jansa &lt;<a h=
ref=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.=
com</a>&gt;<br>
<br>
<a href=3D"https://discourse.llvm.org/t/llvm-22-1-6-released/90838" rel=3D"=
noreferrer" target=3D"_blank">https://discourse.llvm.org/t/llvm-22-1-6-rele=
ased/90838</a><br>
<br>
Brings following fixes:<br>
<br>
fc4aad7b5db3 [Clang][Coroutines] Don&#39;t emit fake uses for coroutine par=
ameters (#194690)<br>
5fb52fc3fda6 [Coverage] Fix assertion failure when a -isystem header invoke=
s a user macro (#195427)<br>
fd10d8f31077 [DAGTypeLegalizer] Add missing BR_CC handler for soft-promoted=
 half operands (#196214)<br>
c0262e742787 [SystemZ] Fix internal error with single-element vector types =
(#196127)<br>
cbb1eb533ded [lldb-dap] Fix crash in source request handler (#195847)<br>
897d3e2b2a63 [lldb][windows] fix cross DLL file descriptor lookup crash (#1=
95855)<br>
60e3203b2e90 Bump version to 22.1.6<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" t=
arget=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
---<br>
Depends on <a href=3D"https://lists.openembedded.org/g/openembedded-core/me=
ssage/237462" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedd=
ed.org/g/openembedded-core/message/237462</a><br>
unfortunately doesn&#39;t fix clang&#39;s ICE when building ffmpeg with -ma=
rch=3Dnehalem<br>
(builds fine with -march=3Dx86-64-v3 used by qemux86-64 by default nowadas)=
.<br>
<br>
=C2=A0meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0| 2 +-<br=
>
=C2=A0meta/recipes-devtools/clang/common-clang.inc | 2 +-<br>
=C2=A0meta/recipes-devtools/clang/common.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 =
+-<br>
=C2=A03 files changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc<br>
index 981a3c4fcc..af4ea1b14f 100644<br>
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
-RECIPE_MAINTAINER:pn-llvm-project-source-22.1.5 =3D &quot;Khem Raj &lt;<a =
href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>=
&gt;&quot;<br>
+RECIPE_MAINTAINER:pn-llvm-project-source-22.1.6 =3D &quot;Khem Raj &lt;<a =
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
index d6ad546c59..a7934951e0 100644<br>
--- a/meta/recipes-devtools/clang/common-clang.inc<br>
+++ b/meta/recipes-devtools/clang/common-clang.inc<br>
@@ -5,7 +5,7 @@ LLVM_HTTP ?=3D &quot;<a href=3D"https://github.com/llvm" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/llvm</a>&quot;<br>
<br>
=C2=A0MAJOR_VER =3D &quot;22&quot;<br>
=C2=A0MINOR_VER =3D &quot;1&quot;<br>
-PATCH_VER =3D &quot;5&quot;<br>
+PATCH_VER =3D &quot;6&quot;<br>
=C2=A0# could be &#39;rcX&#39; or &#39;git&#39; or empty ( for release )<br=
>
=C2=A0VER_SUFFIX =3D &quot;&quot;<br>
<br>
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools=
/clang/common.inc<br>
index 30bd7e18af..0252d77a7e 100644<br>
--- a/meta/recipes-devtools/clang/common.inc<br>
+++ b/meta/recipes-devtools/clang/common.inc<br>
@@ -17,7 +17,7 @@ BASEURI ?=3D &quot;${LLVM_HTTP}/llvm-project/releases/dow=
nload/llvmorg-${PV}${VER_SUFFI<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;${LLVM_HTTP}/llvm-project/releases/&quot=
;<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;releases/tag/llvmorg-?(?P&lt;pver&gt;\=
d+(\.\d+)+)&quot;<br>
=C2=A0SOURCEDIR ?=3D &quot;llvm-project-${PV}${VER_SUFFIX}.src&quot;<br>
-SRC_URI[sha256sum] =3D &quot;7972b87b705a003ce70ab55f9f0fb495d156887cba0eb=
296d284731139118e2c&quot;<br>
+SRC_URI[sha256sum] =3D &quot;6e0b376a1f6d9873e7dfb09ae6e04b9c7024400f01733=
fa4c29be69d5c138bc2&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${BASEURI} \<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#237533): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/237533" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/237533</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119438056/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119438056/1997914</a><br>
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

--000000000000aa1897065272166d--

