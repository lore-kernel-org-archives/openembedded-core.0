Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A8F8D79765
	for <webhook@archiver.kernel.org>; Sat, 31 Jan 2026 09:01:37 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5622.1769850089669331317
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Jan 2026 01:01:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=LmaU52pe;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-432d2670932so2696501f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Jan 2026 01:01:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769850088; cv=none;
        d=google.com; s=arc-20240605;
        b=jjaqGS7I+9xCPU/X9aJxzOGho6yIrFvWZ8HSwTsu4nMT8b4mVZoz+i7WwXYNo1poeh
         2WqnyxoPwuFC4BEPnx8oBVq3mh/0DpubDyQkH8GcPkn4pYHOX/ImsNBltQEw9g9A4QQw
         /dtMOi9bvPeMgWvQJ1ue/gbOI3c1uFYuvReUd6SauuL3kB1GiAbg+dqxrnB6oAW4qphk
         WcXuESp9B/09eLCZBARyfgIqNdV6QLjRekvXzKUb12F4VVFaWxYCpYvnlYz8EGqezhm9
         /GJ7JbvBp+4LM2sg1hiRJo6kqSGkyalvFDpXMi3nFp5EIdyqB8Wi1nWgzpwSQGzUzD+5
         RQvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OMAfeh7widmKT4j3HlgsTrjC5UTAjiLZ5omVbq46xeA=;
        fh=pW7DkiKdJowwinuLl8m7+Zy8GLN8iupENRp5yyrC7eI=;
        b=kFZiKLeKC/QWyOXseQOvB6guR5kaPzoWItYgxBbrpZDqAvO2CN7+6aibLn1vBUEr6c
         tWvY5d/2aYDxFe6a26iijKGpDCQiqWidQUmfBnXMgwJ0va6x9rvq4K1ci+SbOQt3Th7k
         L+lmdlkushq/46TU2M1svY8VhlDeZAp/UUYQ4mqiCqcktvGHd1Oy9dxZ283Wj8/r9OnE
         mE1LHcieW9iOYNDri7xZDEaZob6KQaRKHK66eonxM8MBkmazrYLmjRXQM34JXweYcfz5
         F+o5PDtiywXow7GnuDsfVox571seNTEoIfEeiG2rRf9ms/yK6PjYqzsH5EzKTG+qT8ku
         StUw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1769850088; x=1770454888; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OMAfeh7widmKT4j3HlgsTrjC5UTAjiLZ5omVbq46xeA=;
        b=LmaU52peXmtxecXDXlPOU+Q2O8V5nM3QgOWh5kBg20W+xODKNvXnvqSibHHawMsaWz
         Q0se7xN6MKSFgXEpmlCVQUwRlqt2mMAs4zrn7WZMJDqnS9/Y/Kf77dj6Qfhq4pWbTyXc
         zanpQWh/jrIBY1KKfwqNaGbJCMZpf7RCTdlNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769850088; x=1770454888;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OMAfeh7widmKT4j3HlgsTrjC5UTAjiLZ5omVbq46xeA=;
        b=ibiioaCRoq1s+ePpHXXzsWfjAJVl9k4z0wTHsDyExajbOEf9VZs56iHyK2l23wFNFO
         wPRRMCWpSuFpubkBw5r3/x6PP5Rt1fW7YRX5Lw/skwwAWW/oX41Hq3gTfP+wnAdOWh9d
         fhNiIv57VHhnauZrInDvi9uj1wRDtL+9DnX8JwGm9IF+Y03x/H19n/eP2hyr7Jyz3QtE
         fkF/BlSxdslQK/Oa6dZ93FcLUYcwCEWsI6Pzt4C9nXcftpGqrWgK1biPzOSB/hZduvxb
         /emTHZsNp1I8cpXGUOapKepGCF0HOrm1z7gMpsWxTsuZNykzU2WuFCGTKAO7OPfoU4Ie
         CK3w==
X-Gm-Message-State: AOJu0YxenrN+5ZvaB5y7rSxrR7PA3N1htV6Nk6CTZj1o5ZDIUD2+7CDU
	EEzOt6naaItL+otXgWOs8Q8Iwm86Bzb0nL3zr+4RCYixNoGRv2ordLQpduRHWm/tmcv2Mg4K456
	vvm6DgxwGDRUyJfpDBd4lyMDHqaPQvKTLueowK5Cr9jHkgpS+/kaOB/I=
X-Gm-Gg: AZuq6aIfTWMlXiJqx5LbcgE7BzX7DVAI4D2UF3X0OodTioD0BVMtcWDiPcnqT631LsW
	p8WKdBb1EI2HgNaZLE3cherWW560wLBTLUON13MvtgK0ATUkK24lz8RSJD6rjz/qHeOB1x04hfw
	+5le12k8gDqhiUpJFsdYd/fu8Wn852m0Q7SzZo46jMbE75RJ0JU5YLMO+FeP0P+RKAtsM0spbqo
	z4t0PY//E9jtWSLZziCIo5nlSXef5oPylv2pY4t47+LfiiO+QEVTpawlkGjbwjgF/bqjujAhfYm
	lOIuFh1abRcChDm5zFOztsAtJOJnhxPrtucpk/E=
X-Received: by 2002:a05:6000:24c3:b0:435:95fb:a0f2 with SMTP id
 ffacd0b85a97d-435f3aaf7a1mr7864518f8f.46.1769850087467; Sat, 31 Jan 2026
 01:01:27 -0800 (PST)
MIME-Version: 1.0
References: <cover.1769845858.git.yoann.congal@smile.fr> <0b4dabed3345944da878326baed133dab8c8af5b.1769845858.git.yoann.congal@smile.fr>
In-Reply-To: <0b4dabed3345944da878326baed133dab8c8af5b.1769845858.git.yoann.congal@smile.fr>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Sat, 31 Jan 2026 10:01:01 +0100
X-Gm-Features: AZwV_QiCVSBGo3UyC_ZvDIqw3B7s7wPXpxvcbp9PERLvx5ZXDaxqrXapeU3pZGY
Message-ID: <CAMSfU+7e+LGbkSoRVDe9A4_zbLd8EF3WdS3NvYVmSySbLOr-HQ@mail.gmail.com>
Subject: Re: [OE-core][whinlatter 05/22] mesa: fix build error with llvmpipe
 gallium driver
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?Q?Jo=C3=A3o_Marcos_Costa?= <joaomarcos.costa@bootlin.com>
Content-Type: multipart/alternative; boundary="000000000000c503150649ab55ac"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 31 Jan 2026 09:01:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230233

--000000000000c503150649ab55ac
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le sam. 31 janv. 2026 =C3=A0 08:56, Yoann Congal <yoann.congal@smile.fr> a
=C3=A9crit :

> From: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
>
> For RISC-V, and if the PACKAGECONFIG 'gallium-llvm' is enabled, mesa's
> do_compile fails due to a change in setObjectLinkingLayerCreator's
> signature. This change was first included in LLVM v21.
>
> This issue is further described below:
> https://gitlab.freedesktop.org/mesa/mesa/-/issues/13852
>
> Backport the fix - from upstream - to Whinlatter.
>
> Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  .../files/0001-gallivm-support-LLVM-21.patch  | 56 +++++++++++++++++++
>  meta/recipes-graphics/mesa/mesa.inc           |  1 +
>  2 files changed, 57 insertions(+)
>  create mode 100644
> meta/recipes-graphics/mesa/files/0001-gallivm-support-LLVM-21.patch
>
> diff --git
> a/meta/recipes-graphics/mesa/files/0001-gallivm-support-LLVM-21.patch
> b/meta/recipes-graphics/mesa/files/0001-gallivm-support-LLVM-21.patch
> new file mode 100644
> index 00000000000..cf3bdd36cf9
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/files/0001-gallivm-support-LLVM-21.patch
> @@ -0,0 +1,56 @@
> +From cd129dbf8af2d16b1243f2ce287ff69c6a5dc557 Mon Sep 17 00:00:00 2001
> +From: no92 <no92.mail@gmail.com>
> +Date: Wed, 27 Aug 2025 16:02:31 +0200
> +Subject: gallivm: support LLVM 21
> +
> +LLVM PR#146819 changed the signature of `setObjectLinkingLayerCreator`,
> +dropping the Triple argument. The PR was first included in the LLVM 21
> +series, and the new signature is gated behind a version check for that.
> +
> +`LLVMOrcThreadSafeContextGetContext` was removed in LLVM commit b18e5b6,
> +and the ORC examples in the LLVM tree seem to just create a context
> +instead, which we replicate here.
> +
> +With this commit, mesa successfully builds the llvmpipe gallium driver
> +on riscv64 with LLVM 21.1.0.
> +
> +Closes: https://gitlab.freedesktop.org/mesa/mesa/-/issues/13785
> +Closes: https://gitlab.freedesktop.org/mesa/mesa/-/issues/13852
> +
> +Reviewed-by: David Heidelberg <david@ixit.cz>
> +Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/3702=
7
> >
> +
> +Upstream-Status: Backport [
> https://cgit.freedesktop.org/mesa/mesa/commit/?id=3Dcd129dbf8af2d16b1243f=
2ce287ff69c6a5dc557
> ]
>

Jo=C3=A3o, patchtest is right, this patch is missing your signed-off-by.
(Patchtest must have been down when you first sent this)
Can you send a v2 with it?

Thanks!


> +---
> + src/gallium/auxiliary/gallivm/lp_bld_init_orc.cpp | 7 ++++++-
> + 1 file changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/gallium/auxiliary/gallivm/lp_bld_init_orc.cpp
> b/src/gallium/auxiliary/gallivm/lp_bld_init_orc.cpp
> +index 6651ea439da..e5d8e461dd6 100644
> +--- a/src/gallium/auxiliary/gallivm/lp_bld_init_orc.cpp
> ++++ b/src/gallium/auxiliary/gallivm/lp_bld_init_orc.cpp
> +@@ -339,7 +339,12 @@ LPJit::LPJit() :jit_dylib_count(0) {
> +          .setJITTargetMachineBuilder(std::move(JTMB))
> + #ifdef USE_JITLINK
> +          .setObjectLinkingLayerCreator(
> ++#if LLVM_VERSION_MAJOR >=3D 21
> ++            /* LLVM 21 removed the Triple argument */
> ++            [&](ExecutionSession &ES) {
> ++#else
> +             [&](ExecutionSession &ES, const llvm::Triple &TT) {
> ++#endif
> +                return std::make_unique<ObjectLinkingLayer>(
> +                   ES,
> ExitOnErr(llvm::jitlink::InProcessMemoryManager::Create()));
> +             })
> +@@ -551,7 +556,7 @@ init_gallivm_state(struct gallivm_state *gallivm,
> const char *name,
> +    gallivm->cache =3D cache;
> +
> +    gallivm->_ts_context =3D context->ref;
> +-   gallivm->context =3D LLVMOrcThreadSafeContextGetContext(context->ref=
);
> ++   gallivm->context =3D LLVMContextCreate();
> +
> +    gallivm->module_name =3D LPJit::get_unique_name(name);
> +    gallivm->module =3D
> LLVMModuleCreateWithNameInContext(gallivm->module_name,
> +--
> +cgit v1.2.3
> +
> diff --git a/meta/recipes-graphics/mesa/mesa.inc
> b/meta/recipes-graphics/mesa/mesa.inc
> index cf2c2a57a07..d880673f273 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -17,6 +17,7 @@ PE =3D "2"
>  SRC_URI =3D "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
>             file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patc=
h
> \
>
> file://0001-freedreno-don-t-encode-build-path-into-binaries.patch \
> +           file://0001-gallivm-support-LLVM-21.patch \
>  "
>
>  SRC_URI[sha256sum] =3D
> "097842f3e49d996868b38688db87b006f7d4541e93ce86d2f341d8b3e7be7c93"
>


--=20
Yoann Congal
Smile ECS

--000000000000c503150649ab55ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0sam. 31=
 janv. 2026 =C3=A0=C2=A008:56, Yoann Congal &lt;<a href=3D"mailto:yoann.con=
gal@smile.fr">yoann.congal@smile.fr</a>&gt; a =C3=A9crit=C2=A0:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">From: Jo=C3=A3o Marcos Cost=
a &lt;<a href=3D"mailto:joaomarcos.costa@bootlin.com" target=3D"_blank">joa=
omarcos.costa@bootlin.com</a>&gt;<br>
<br>
For RISC-V, and if the PACKAGECONFIG &#39;gallium-llvm&#39; is enabled, mes=
a&#39;s<br>
do_compile fails due to a change in setObjectLinkingLayerCreator&#39;s<br>
signature. This change was first included in LLVM v21.<br>
<br>
This issue is further described below:<br>
<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/issues/13852" rel=3D"=
noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/mesa/mesa/-/is=
sues/13852</a><br>
<br>
Backport the fix - from upstream - to Whinlatter.<br>
<br>
Signed-off-by: Jo=C3=A3o Marcos Costa &lt;<a href=3D"mailto:joaomarcos.cost=
a@bootlin.com" target=3D"_blank">joaomarcos.costa@bootlin.com</a>&gt;<br>
Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" ta=
rget=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
---<br>
=C2=A0.../files/0001-gallivm-support-LLVM-21.patch=C2=A0 | 56 +++++++++++++=
++++++<br>
=C2=A0meta/recipes-graphics/mesa/mesa.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 1 +<br>
=C2=A02 files changed, 57 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-graphics/mesa/files/0001-gallivm-supp=
ort-LLVM-21.patch<br>
<br>
diff --git a/meta/recipes-graphics/mesa/files/0001-gallivm-support-LLVM-21.=
patch b/meta/recipes-graphics/mesa/files/0001-gallivm-support-LLVM-21.patch=
<br>
new file mode 100644<br>
index 00000000000..cf3bdd36cf9<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/mesa/files/0001-gallivm-support-LLVM-21.patch<b=
r>
@@ -0,0 +1,56 @@<br>
+From cd129dbf8af2d16b1243f2ce287ff69c6a5dc557 Mon Sep 17 00:00:00 2001<br>
+From: no92 &lt;<a href=3D"mailto:no92.mail@gmail.com" target=3D"_blank">no=
92.mail@gmail.com</a>&gt;<br>
+Date: Wed, 27 Aug 2025 16:02:31 +0200<br>
+Subject: gallivm: support LLVM 21<br>
+<br>
+LLVM PR#146819 changed the signature of `setObjectLinkingLayerCreator`,<br=
>
+dropping the Triple argument. The PR was first included in the LLVM 21<br>
+series, and the new signature is gated behind a version check for that.<br=
>
+<br>
+`LLVMOrcThreadSafeContextGetContext` was removed in LLVM commit b18e5b6,<b=
r>
+and the ORC examples in the LLVM tree seem to just create a context<br>
+instead, which we replicate here.<br>
+<br>
+With this commit, mesa successfully builds the llvmpipe gallium driver<br>
+on riscv64 with LLVM 21.1.0.<br>
+<br>
+Closes: <a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/issues/13785=
" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/mesa/=
mesa/-/issues/13785</a><br>
+Closes: <a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/issues/13852=
" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/mesa/=
mesa/-/issues/13852</a><br>
+<br>
+Reviewed-by: David Heidelberg &lt;<a href=3D"mailto:david@ixit.cz" target=
=3D"_blank">david@ixit.cz</a>&gt;<br>
+Part-of: &lt;<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/merge_r=
equests/37027" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesk=
top.org/mesa/mesa/-/merge_requests/37027</a>&gt;<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://cgit.freedesktop.org/mesa/me=
sa/commit/?id=3Dcd129dbf8af2d16b1243f2ce287ff69c6a5dc557" rel=3D"noreferrer=
" target=3D"_blank">https://cgit.freedesktop.org/mesa/mesa/commit/?id=3Dcd1=
29dbf8af2d16b1243f2ce287ff69c6a5dc557</a>]<br></blockquote><div><br></div><=
div>Jo=C3=A3o, patchtest=C2=A0is right, this patch is missing your signed-o=
ff-by.</div><div>(Patchtest must have been down when you first sent this)</=
div><div>Can you send a v2 with it?</div><div><br></div><div>Thanks!</div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+---<br>
+ src/gallium/auxiliary/gallivm/lp_bld_init_orc.cpp | 7 ++++++-<br>
+ 1 file changed, 6 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/src/gallium/auxiliary/gallivm/lp_bld_init_orc.cpp b/src/galli=
um/auxiliary/gallivm/lp_bld_init_orc.cpp<br>
+index 6651ea439da..e5d8e461dd6 100644<br>
+--- a/src/gallium/auxiliary/gallivm/lp_bld_init_orc.cpp<br>
++++ b/src/gallium/auxiliary/gallivm/lp_bld_init_orc.cpp<br>
+@@ -339,7 +339,12 @@ LPJit::LPJit() :jit_dylib_count(0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .setJITTargetMachineBuilder(std::move(J=
TMB))<br>
+ #ifdef USE_JITLINK<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .setObjectLinkingLayerCreator(<br>
++#if LLVM_VERSION_MAJOR &gt;=3D 21<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* LLVM 21 removed the Triple a=
rgument */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [&amp;](ExecutionSession &amp;E=
S) {<br>
++#else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[&amp;](ExecutionSession &=
amp;ES, const llvm::Triple &amp;TT) {<br>
++#endif<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return std::make_u=
nique&lt;ObjectLinkingLayer&gt;(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ES, E=
xitOnErr(llvm::jitlink::InProcessMemoryManager::Create()));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0})<br>
+@@ -551,7 +556,7 @@ init_gallivm_state(struct gallivm_state *gallivm, cons=
t char *name,<br>
+=C2=A0 =C2=A0 gallivm-&gt;cache =3D cache;<br>
+ <br>
+=C2=A0 =C2=A0 gallivm-&gt;_ts_context =3D context-&gt;ref;<br>
+-=C2=A0 =C2=A0gallivm-&gt;context =3D LLVMOrcThreadSafeContextGetContext(c=
ontext-&gt;ref);<br>
++=C2=A0 =C2=A0gallivm-&gt;context =3D LLVMContextCreate();<br>
+ <br>
+=C2=A0 =C2=A0 gallivm-&gt;module_name =3D LPJit::get_unique_name(name);<br=
>
+=C2=A0 =C2=A0 gallivm-&gt;module =3D LLVMModuleCreateWithNameInContext(gal=
livm-&gt;module_name,<br>
+-- <br>
+cgit v1.2.3<br>
+<br>
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/me=
sa/mesa.inc<br>
index cf2c2a57a07..d880673f273 100644<br>
--- a/meta/recipes-graphics/mesa/mesa.inc<br>
+++ b/meta/recipes-graphics/mesa/mesa.inc<br>
@@ -17,6 +17,7 @@ PE =3D &quot;2&quot;<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://archive.mesa3d.org/mesa-$%7BPV%7=
D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://archive.mesa3d.org/m=
esa-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-meson-misdetects-64bi=
t-atomics-on-mips-clang.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-freedreno-don-t-encod=
e-build-path-into-binaries.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-gallivm-support-LLVM-=
21.patch \<br>
=C2=A0&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;097842f3e49d996868b38688db87b006f7d4541e=
93ce86d2f341d8b3e7be7c93&quot;<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000c503150649ab55ac--

