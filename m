Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AAFDCD98F0
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 04:10:56 +0000 (UTC)
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13614.1782187854278027728
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2026 21:10:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=tBHo5GWS;
 spf=pass (domain: gmail.com, ip: 74.125.224.52, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6607048fa62so5153088d50.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 21:10:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782187853; cv=none;
        d=google.com; s=arc-20240605;
        b=JgnJmHIMhjlbWqfvLUiVOnFM7DJE+3cbaYXrGb9kXF7xldAzjfIsFop/AayRi+Ctyh
         lxQallmBeckDu8nAJKtrRBZmM59VoH64yjm/IpxriCRue/yVfiuHA6P47O8l2nPvjnOr
         eiBKGtAw/OM9aOy2T/9EX0wh90Vskr72DeCFx7bWZGDgVMheQmoskkJQuYweUcZXrT5T
         NmkOhPGZdyjH52Tt3nPdrgaAIx5gTt2VtjlR5C5n7Lo8MuhnBLJ/NoWDtWwedhwUzLXQ
         7urIl0+cjZ9e8Q6za/9PULBnAaed8A3GR6nDS2AXrlYZBt4EFKPI17MdPjIfXtlW8mX/
         ZwSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=N+2uCB9fBKQ7DGBuRoJF6YfTYJQOj5OSCS9qpcEt2Cs=;
        fh=Shyw4Ssou6l0RJ8Hg3PTolXkk/msdJJnlaELzE9n7QE=;
        b=VeqYjraY9XlqbQZ5lB4v71ZWJJgX8pfOmqyhvmMXRDv/pLzGFkNHO+8zRX/hMTDRsy
         49i3dlrdMx5AhL67cOu0VAKiEp1ctXrfbEc/+viMf/luRpcRCvwJPHShK/jvcY0u3E4+
         X1SX0TGeFJ4tbxl/Rayr6TateW3272LZoDrMT0CipI2E80inEDsNaQ68I89fvbJX3JmG
         sdj0jeeyn+tyce6bugv2L48npiczlIAhciNw13e+ntNCKZXfTqzfBZXAz/Vk68K9BxoU
         VlfRGveOqNPEUAl4uuNhpudkQJWv7agzoQ2iAWaPD0RD3Mp3xYbp8VK/RWP0IWu8kLaf
         Ndxw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782187853; x=1782792653; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N+2uCB9fBKQ7DGBuRoJF6YfTYJQOj5OSCS9qpcEt2Cs=;
        b=tBHo5GWSu7iq3upTFF9p2rJh/JCWEusMmDs7W7eWla+rTdctS4CbjQMvsa9oO7XDPu
         /HVhpbRFHuRgr2FIin0mUtV7jbogY3bavweMpDCkZ/MBt0jKR5ZcuF4OnxNpRH/er1ZF
         xyevuTXFpxMevI95XJDMiYmi+i+Ukk7VtqHeUITxrO+WX1OMdm36w4l1hCx/m2SbmPD2
         OogDHzlwFd6XnFW23g6NcjRT98SaSR6bfdZ494/odYTW9LUAnWGD9ZedfzmdtoXriYK7
         arRwMObc3897VDbPslLOuirLs1cZX2eN61gTcv7RBGZdus4CRo+YaF6x1/8+if7s92Tw
         9iHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782187853; x=1782792653;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+2uCB9fBKQ7DGBuRoJF6YfTYJQOj5OSCS9qpcEt2Cs=;
        b=gZxXN4Lpid4kr5da7W2+D5H/Lcx2OS0ksS178DReqzWIoiO1+PpcFAl6O26P50eEoV
         GHNENW5ebvgH7Q7tWdqTjvnVVNGpg/rxrO+MaylaTH29PdWoRLhJ51dVm4MjfhRPELSa
         r6r5cK3h5eZPXWsof9pxRzFCc4JICf1WBC8fufeannuXlj4bQWMs1/hUbrMZO/5K9B3k
         9iFCottbre9afGX5oj0Yb+kpGIKNqnDKNSAnlvBBbXIvoGafHqVcum+h27/A63PUMo4g
         vGLJnV742ruaFk2loHtVfxnlEaS7PmvL9KNFPnllS7URJb7oN6sFvMMEnjEzqbIKw9KY
         6FZA==
X-Gm-Message-State: AOJu0Yzh30euGzDjf3aaakxC7x8koXjx40yessVGhtJGCmzipsYwUQ4Q
	sPNvTyTVkzbNk4wrNziLQOpbfeV5xmwxilkbueMImrYx8O0jHLyaI57uWcWug6ONFuKwQmGLoeS
	PTfC6XVA5utL0PihgI21ux5f9SIa+1XMsscMBbpjVGw==
X-Gm-Gg: AfdE7cmXF2v7DLVksE9l5rUyw1eCZ1jCQhqsMBdmV0MG6BXfdIriLCbXIlgjKQ/83lg
	ODTRpVsWfYZNOVKK5bkrTmRifT/YPMpF6vCan3DMJXTXVswShT4ajv+xiKYtCQ0wZx7Xmdsyc2U
	VvO723OyaznzDkrbVEJEf6X1qSmr0GKlkLHp5IqZaAo5CHsFfLkXpvAhHqH64Gw/qpQEw8XRnL2
	4fpPxrYKVWXHZwfUGx2Dsz6iZ5PQ6Wy6mcs/+MrVpEPP2wOwX/vb2XX+n56mcEMK6qHOeY0/XYk
	XhudmTSlHAsnsf/xmhbkEzDB+GoOLTagQlJ6qN3i0SMccIjJcQnUDfOqUwxxNxZnV2w269F+KfZ
	iq9YsfaNoW4wfvQBuOP5/l08IUmsVIBpIWi3TyfkplZ5K3iKUueRPMwZrkLZl/0n38LkoJQ==
X-Received: by 2002:a05:690e:11c3:b0:663:271f:6d7f with SMTP id
 956f58d0204a3-663271f870bmr9112927d50.61.1782187853103; Mon, 22 Jun 2026
 21:10:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260622132021.37598-1-joaomarcos.costa@bootlin.com> <20260622132021.37598-4-joaomarcos.costa@bootlin.com>
In-Reply-To: <20260622132021.37598-4-joaomarcos.costa@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 22 Jun 2026 21:10:26 -0700
X-Gm-Features: AVVi8CcawbFOCs4GoPkQvBGo62MkO9AZQEBRfW5BWFMKg-xs_rkz6iRLVZ5pbf4
Message-ID: <CAMKF1sr1DOhKrYY1=3DrMA8-iVNn75=mTT0D29ShqVLmCjWyRw@mail.gmail.com>
Subject: Re: [PATCH 3/4] clang/llvm: add missing instance of Distro class in Linux.cpp
To: =?UTF-8?Q?Jo=C3=A3o_Marcos_Costa?= <joaomarcos.costa@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, thomas.petazzoni@bootlin.com
Content-Type: multipart/alternative; boundary="000000000000e8488b0654e3f127"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 04:10:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239325

--000000000000e8488b0654e3f127
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I wonder if this patch should be squashed
into 0016-llvm-clang-Insert-anchor-for-adding-OE-distro-vendor.patch since
that patch is causing to need this change.

On Mon, Jun 22, 2026 at 6:21=E2=80=AFAM Jo=C3=A3o Marcos Costa <
joaomarcos.costa@bootlin.com> wrote:

> As in the own patch's message:
>
> This instance will be used to perform the checks added by do_preconfigure
> task, such as "Distro.IsOpenEmbedded()", or "Distro.IsPOKY()".
>
> Without such instance, the compiler raises an "expected unqualified-id"
> error.
>
> Something similar is performed by another patch, by the way:
>
> 0009-clang-Define-releative-gcc-installation-dir.patch:+  Distro
> Distro(D.getVFS(), TargetTriple);
> 0009-clang-Define-releative-gcc-installation-dir.patch:+
>  Distro.IsOpenEmbedded()},
>
> Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
> ---
>  ...istro-instance-to-getMultiarchTriple.patch | 35 +++++++++++++++++++
>  meta/recipes-devtools/clang/common.inc        |  1 +
>  2 files changed, 36 insertions(+)
>  create mode 100644
> meta/recipes-devtools/clang/clang/0001-llvm-clang-Add-Distro-instance-to-=
getMultiarchTriple.patch
>
> diff --git
> a/meta/recipes-devtools/clang/clang/0001-llvm-clang-Add-Distro-instance-t=
o-getMultiarchTriple.patch
> b/meta/recipes-devtools/clang/clang/0001-llvm-clang-Add-Distro-instance-t=
o-getMultiarchTriple.patch
> new file mode 100644
> index 0000000000..90dd51865b
> --- /dev/null
> +++
> b/meta/recipes-devtools/clang/clang/0001-llvm-clang-Add-Distro-instance-t=
o-getMultiarchTriple.patch
> @@ -0,0 +1,35 @@
> +From ef7b8a5409c9a1789c6e6679a7e67e8cebe7ab6f Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Jo=3DC3=3DA3o=3D20Marcos=3D20Costa?=3D <
> joaomarcos.costa@bootlin.com>
> +Date: Sun, 21 Jun 2026 17:33:10 +0000
> +Subject: [PATCH] llvm/clang: Add Distro instance to getMultiarchTriple()
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +This instance will be used to perform the checks added by do_preconfigur=
e
> +task, such as "Distro.IsOpenEmbedded()", or "Distro.IsPOKY()".
> +
> +Without such instance, the compiler raises an "expected unqualified-id"
> error.
> +
> +Upstream-Status: Inappropriate [oe-core specific]
> +
> +Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
> +---
> + clang/lib/Driver/ToolChains/Linux.cpp | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/clang/lib/Driver/ToolChains/Linux.cpp
> b/clang/lib/Driver/ToolChains/Linux.cpp
> +index c6d6e20db..52c27f559 100644
> +--- a/clang/lib/Driver/ToolChains/Linux.cpp
> ++++ b/clang/lib/Driver/ToolChains/Linux.cpp
> +@@ -45,6 +45,7 @@ std::string Linux::getMultiarchTriple(const Driver &D,
> +   bool IsAndroid =3D TargetTriple.isAndroid();
> +   bool IsMipsR6 =3D TargetTriple.getSubArch() =3D=3D
> llvm::Triple::MipsSubArch_r6;
> +   bool IsMipsN32Abi =3D TargetTriple.getEnvironment() =3D=3D
> llvm::Triple::GNUABIN32;
> ++  Distro Distro(D.getVFS(), TargetTriple);
> +
> +   // For most architectures, just use whatever we have rather than
> trying to be
> +   // clever.
> +--
> +2.39.5
> +
> diff --git a/meta/recipes-devtools/clang/common.inc
> b/meta/recipes-devtools/clang/common.inc
> index 441ea099a9..19b43d6613 100644
> --- a/meta/recipes-devtools/clang/common.inc
> +++ b/meta/recipes-devtools/clang/common.inc
> @@ -60,6 +60,7 @@ SRC_URI =3D "\
>
>  file://0039-Rename-UNUSED-and-UNKNOWN-elements-of-OffloadArch-enum.patch=
 \
>
>  file://0040-libcxxabi-declare-__gnu_unwind_frame-in-cxa_personal.patch \
>
>  file://0041-Consolidate-and-fix-sysroot-based-compiler-rt-search.patch \
> +
> file://0001-llvm-clang-Add-Distro-instance-to-getMultiarchTriple.patch \
>  "
>  # Fallback to no-PIE if not set
>  GCCPIE ??=3D ""
> --
> 2.47.0
>
>

--000000000000e8488b0654e3f127
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I wonder if this patch should be squashed into=C2=A00016-l=
lvm-clang-Insert-anchor-for-adding-OE-distro-vendor.patch since that patch =
is causing to need this change.</div><br><div class=3D"gmail_quote gmail_qu=
ote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 22, 2026 a=
t 6:21=E2=80=AFAM Jo=C3=A3o Marcos Costa &lt;<a href=3D"mailto:joaomarcos.c=
osta@bootlin.com">joaomarcos.costa@bootlin.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">As in the own patch&#39;s mes=
sage:<br>
<br>
This instance will be used to perform the checks added by do_preconfigure<b=
r>
task, such as &quot;Distro.IsOpenEmbedded()&quot;, or &quot;Distro.IsPOKY()=
&quot;.<br>
<br>
Without such instance, the compiler raises an &quot;expected unqualified-id=
&quot; error.<br>
<br>
Something similar is performed by another patch, by the way:<br>
<br>
0009-clang-Define-releative-gcc-installation-dir.patch:+=C2=A0 Distro Distr=
o(D.getVFS(), TargetTriple);<br>
0009-clang-Define-releative-gcc-installation-dir.patch:+=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0Distro.IsOpenEmbedded()},<br>
<br>
Signed-off-by: Jo=C3=A3o Marcos Costa &lt;<a href=3D"mailto:joaomarcos.cost=
a@bootlin.com" target=3D"_blank">joaomarcos.costa@bootlin.com</a>&gt;<br>
---<br>
=C2=A0...istro-instance-to-getMultiarchTriple.patch | 35 ++++++++++++++++++=
+<br>
=C2=A0meta/recipes-devtools/clang/common.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 1 +<br>
=C2=A02 files changed, 36 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/clang/clang/0001-llvm-clang-=
Add-Distro-instance-to-getMultiarchTriple.patch<br>
<br>
diff --git a/meta/recipes-devtools/clang/clang/0001-llvm-clang-Add-Distro-i=
nstance-to-getMultiarchTriple.patch b/meta/recipes-devtools/clang/clang/000=
1-llvm-clang-Add-Distro-instance-to-getMultiarchTriple.patch<br>
new file mode 100644<br>
index 0000000000..90dd51865b<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/clang/clang/0001-llvm-clang-Add-Distro-instance=
-to-getMultiarchTriple.patch<br>
@@ -0,0 +1,35 @@<br>
+From ef7b8a5409c9a1789c6e6679a7e67e8cebe7ab6f Mon Sep 17 00:00:00 2001<br>
+From: =3D?UTF-8?q?Jo=3DC3=3DA3o=3D20Marcos=3D20Costa?=3D &lt;<a href=3D"ma=
ilto:joaomarcos.costa@bootlin.com" target=3D"_blank">joaomarcos.costa@bootl=
in.com</a>&gt;<br>
+Date: Sun, 21 Jun 2026 17:33:10 +0000<br>
+Subject: [PATCH] llvm/clang: Add Distro instance to getMultiarchTriple()<b=
r>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+This instance will be used to perform the checks added by do_preconfigure<=
br>
+task, such as &quot;Distro.IsOpenEmbedded()&quot;, or &quot;Distro.IsPOKY(=
)&quot;.<br>
+<br>
+Without such instance, the compiler raises an &quot;expected unqualified-i=
d&quot; error.<br>
+<br>
+Upstream-Status: Inappropriate [oe-core specific]<br>
+<br>
+Signed-off-by: Jo=C3=A3o Marcos Costa &lt;<a href=3D"mailto:joaomarcos.cos=
ta@bootlin.com" target=3D"_blank">joaomarcos.costa@bootlin.com</a>&gt;<br>
+---<br>
+ clang/lib/Driver/ToolChains/Linux.cpp | 1 +<br>
+ 1 file changed, 1 insertion(+)<br>
+<br>
+diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver/Tool=
Chains/Linux.cpp<br>
+index c6d6e20db..52c27f559 100644<br>
+--- a/clang/lib/Driver/ToolChains/Linux.cpp<br>
++++ b/clang/lib/Driver/ToolChains/Linux.cpp<br>
+@@ -45,6 +45,7 @@ std::string Linux::getMultiarchTriple(const Driver &amp;=
D,<br>
+=C2=A0 =C2=A0bool IsAndroid =3D TargetTriple.isAndroid();<br>
+=C2=A0 =C2=A0bool IsMipsR6 =3D TargetTriple.getSubArch() =3D=3D llvm::Trip=
le::MipsSubArch_r6;<br>
+=C2=A0 =C2=A0bool IsMipsN32Abi =3D TargetTriple.getEnvironment() =3D=3D ll=
vm::Triple::GNUABIN32;<br>
++=C2=A0 Distro Distro(D.getVFS(), TargetTriple);<br>
+ <br>
+=C2=A0 =C2=A0// For most architectures, just use whatever we have rather t=
han trying to be<br>
+=C2=A0 =C2=A0// clever.<br>
+-- <br>
+2.39.5<br>
+<br>
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools=
/clang/common.inc<br>
index 441ea099a9..19b43d6613 100644<br>
--- a/meta/recipes-devtools/clang/common.inc<br>
+++ b/meta/recipes-devtools/clang/common.inc<br>
@@ -60,6 +60,7 @@ SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0file://0039-Rename-UNUSED-and-UNKNOWN-elements-of-Offlo=
adArch-enum.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0040-libcxxabi-declare-__gnu_unwind_frame-in-cxa=
_personal.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0041-Consolidate-and-fix-sysroot-based-compiler-=
rt-search.patch \<br>
+=C2=A0 =C2=A0 file://0001-llvm-clang-Add-Distro-instance-to-getMultiarchTr=
iple.patch \<br>
=C2=A0&quot;<br>
=C2=A0# Fallback to no-PIE if not set<br>
=C2=A0GCCPIE ??=3D &quot;&quot;<br>
-- <br>
2.47.0<br>
<br>
</blockquote></div>

--000000000000e8488b0654e3f127--

