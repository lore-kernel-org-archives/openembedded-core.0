Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AE7FC5DF66
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 01:03:12 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3999.1786669382897666585
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 18:03:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cXGBMfHt;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: raj.khem@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a0a4aa99bdso642247a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 18:03:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786669381; cv=none;
        d=google.com; s=arc-20260327;
        b=B3hQlybClOCqoEsT4DoniJjSWLh+XO22t2toQsQ6KzpBOlyv+DDW2aZoGxoFlRuBqJ
         tBeUC1x5EDWA5QtSFK/Ou+Hgc5FcT2NPn92YA+PdZDqfZmPodLbTBO0ySMP+cGw/9nxi
         +fzGwfWY8K/SeiMVsKQqi7XSjS3sL5oK8TK3uefo1xtapTHPbKPvjBjAT1oJ2J5A/Xoy
         StSeFoPtpImCrl7fA1jUW3h8WP7DcxRSwiph3bU2uEaRp68S461VFed/8iDQvBON4xGb
         hFQuI1p8wqu5OaGbVstmvZxd7bUauGdXiQ/6Ird/VQsI+jjTKCr9R2KOUvB7z676VuYR
         7cNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kLKW7F8YpvXPK892dO43H/bhoy9e3MWsWADTU+ljUVk=;
        fh=Bc7VRjYxp1iBuEwP+uYYgAFRnFFVP3c8EW7fySjCzvc=;
        b=epmKNhcEa6XynBIpSwf4LkFoTmAIxcly1VknT8Zrry+gDFDX8we5aatox4eF6V9Btr
         L5ciFMNeQ5E75mIoiqvwf75leMMKKV3eZ/MwgMy02oHt2YsZRPgJDLSYvSvJyONsIlwu
         S99UKN5PSoOZHjhOQQv4QxkTN5ZP6XzoMqREr8v4fxMiqbfReik3XavxFVNRB1Pb02y2
         gTrclOqmV2XQip8nbxZA+sAF8JJ2RehUeicNHmjGg8NHh49ifmZHB3E2TyJxWN24Yft3
         BAE26Lhh7VQ3tlU4Y0PeLSVCf+Nkfoc1vavxuL+tVRHpZsa0twDyrsjsnu4rg+bJu3pn
         kIdA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786669381; x=1787274181; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kLKW7F8YpvXPK892dO43H/bhoy9e3MWsWADTU+ljUVk=;
        b=cXGBMfHteediC6KmZam2bFEy/o1TOF13lwHw95epoCRoBaUMc34qln1NVUcn29rwpY
         x8Bqa7+EAC7BQJRAFxsVVZ4FwFfTSZg7B0iUNuyvy+ech0XHMJE1QT4nuyoEPAHvV0cR
         2ccZOXELJdfcU3eQ5iVaKMkP6GmKNwVJZ/OT1nmRF8BBUXiPcCwIXhWOstPoBKC+S2EA
         3jlVV9gMP9hJM7jbBbPn61r/gfDq3qvIqMeXnPPRgUeOinyVtsUUmvgb8K/A1Idacei+
         H28lFCXnu9XDC4Vova690E7DiHh1gqs2XDz+188igF6iIaOYHD/NASXhS340SCCA3BRR
         wNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786669381; x=1787274181;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kLKW7F8YpvXPK892dO43H/bhoy9e3MWsWADTU+ljUVk=;
        b=rGqlDtDhf68FmIgUtClnm/8FSNHavTEFOYPAa4C3k5X9v1oFlkbqXjDbIv8SeB7SS9
         NE/2zBGjBpG/XJ45+zhOyEZXd9SwZp49iFQcuHEZ8Wy2oJ7aKQoupYunjhX9u2fByp1Q
         bAdabvxqVcQvCNWktEZ+VAy/kZ+N7766c1jroW2L+PMZie1FmwJVGhElwrWXxQ0vdiXF
         htfgtpcCU/TJBbL54LgULYXtQl7ni4Es/ELDYGI9Ex4hX7zpZmfS4UUbLr60f6dxbefq
         lw0rLy+9rTA55bmHhNLozALyc5gujOdqsfOjDzzohIfs9mLvdu06j2tXecv/rvpke7Fg
         STHw==
X-Gm-Message-State: AOJu0Yx6AhDV5m2awZQam8SRygtBVRzG2SF/Hx7PmG3FQzSGVaQYzu1l
	MWcG9GdlNNPm8wMiczS/Zq/+b2n04JoJDPkVWshQsr1TuLRFXzQNxWBBwdSq8rhNyqA58Pe82aQ
	wackUUKSIRFpleIjk/q4kKSXqpf+1WwY=
X-Gm-Gg: AR+sD13aRFsI5CilLWN8wLfo+sBe8awmAst0a07+YNBpn6KLyXOfjxEgN8GdMb+b4VI
	v3i5d/mWT+BQtqGQAzIrc9Fjgchdgi2Rz+VGlbxyNk2L7WEHl4yxgPKb4hxtZ+nIOUgdH4WMtYR
	g7NXOUmD96YjWrkR1cfmtPxtSMR0B56HUsXpDCllI8Pqh35+wGpSwy8Bm3tOV5kDQTXIdpJsbQj
	mSgbWySZ08hxlrNrYiU3UY+v/obrKhaYrJSAus+O5+w1H2PBBS3wOAeempT3Obh71d1gj9dBF5t
	UAAv6I1PjE8lmsfCUD4c7Nm904VE1eX1ZuPLTUsK826OZqkZXYDWJMy7s46OTV+ug19R00YLiTr
	L3XTgKEBwFcFm6wUWsNk7P05wCftVVa0Eg9ObZFsI+O8IkiiMySNJ3r+KhtMdfDiY/EbOz+kZME
	P08QaKaeG1ZzuMym+LrysnZnSzcxme6ywGQ7zmUpsWA8De2n28907Yx4laNiQ7uxW+tAMdaIfQc
	aRyMVs/C3NozQ==
X-Received: by 2002:a05:6402:2111:b0:6a0:dd2a:a7b8 with SMTP id
 4fb4d7f45d1cf-6a38a9bac9dmr973496a12.21.1786669380927; Thu, 13 Aug 2026
 18:03:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260812161341.822689-1-f_l_k@t-online.de> <20260812161341.822689-2-f_l_k@t-online.de>
In-Reply-To: <20260812161341.822689-2-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Aug 2026 18:02:32 -0700
X-Gm-Features: AUfX_mxGPCOdTnCpOa0IYZY8gUg8WsAJ5b9_IMd2sRlyo3uIvwLKoIL6ZD7jauc
Message-ID: <CAMKF1spJ66aBORv02hW-gGRm4X1q0mBG1q4V6eHMhCWGOXmE_Q@mail.gmail.com>
Subject: Re: [oe-core][PATCH 2/2] clang: auto-derive CLANG_EXTRA_OE_DISTRO
 from DISTRO
To: f_l_k@t-online.de
Cc: openembedded-core@lists.openembedded.org, Claude <noreply@anthropic.com>
Content-Type: multipart/alternative; boundary="000000000000c808330658f761b7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 01:03:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243392

--000000000000c808330658f761b7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am seeing a libcxx-native failure on debian13/arm64 host building for
'yoe' distro. See

https://errors.yoctoproject.org/Errors/Details/962419/

On Wed, Aug 12, 2026 at 9:13=E2=80=AFAM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:

> CLANG_EXTRA_OE_VENDORS already auto-derives from TARGET_VENDOR and
> SDK_VENDOR, recognizing a self-hosted OE build host without manual
> configuration. CLANG_EXTRA_OE_DISTRO has no equivalent -- it ships
> only 'poky:poky', so a self-hosted host running a custom DISTRO must
> be manually registered before Distro::IsOpenEmbedded() recognizes it
> via /etc/os-release.
>
> This is easy to get wrong by hand, since the registered id must
> exactly match the raw ID=3D value in /etc/os-release, including any
> hyphens, which must NOT be converted to underscores (unlike the
> generated C++ enumerator name, which requires the conversion). A
> single typo silently disables the OE-specific GCC-install candidate
> with no error, causing native clang-toolchain builds to fail to find
> crtbeginS.o/libgcc despite running on a genuinely OE-built host.
>
> Auto-derive an entry for the current DISTRO the same way
> CLANG_EXTRA_OE_VENDORS already does, so self-hosted OE build hosts
> are recognized out of the box with no configuration and no
> hyphen/underscore typo risk. 'poky' is skipped since it is already
> the shipped default.
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> Co-authored-by: Claude <noreply@anthropic.com>
> ---
>  meta/recipes-devtools/clang/llvm-project-source.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/clang/llvm-project-source.inc
> b/meta/recipes-devtools/clang/llvm-project-source.inc
> index 5cd08d4085..5a07080d55 100644
> --- a/meta/recipes-devtools/clang/llvm-project-source.inc
> +++ b/meta/recipes-devtools/clang/llvm-project-source.inc
> @@ -28,6 +28,7 @@ CLANG_EXTRA_OE_VENDORS ?=3D "${TARGET_VENDOR}
> ${SDK_VENDOR}"
>  # ":" separated the ID in "/etc/os-release" and the triple for finding
> gcc on this OE DISTRO.
>  # eg: "poky:poky wrlinux:wrs"
>  CLANG_EXTRA_OE_DISTRO ?=3D "poky:poky"
> +CLANG_EXTRA_OE_DISTRO:append =3D "${@ ' ' + d.getVar('DISTRO') + ':oe' i=
f
> d.getVar('DISTRO') not in ['poky', ''] else ''}"
>  # Match with MULTILIB_GLOBAL_VARIANTS
>  ML_VARIANTS =3D "lib32 lib64 libx32"
>
> --
> 2.55.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#243297):
> https://lists.openembedded.org/g/openembedded-core/message/243297
> Mute This Topic: https://lists.openembedded.org/mt/120720285/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000c808330658f761b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I am seeing a libcxx-native failure on debian13/arm64 host=
 building for &#39;yoe&#39; distro. See<div><br></div><div><a href=3D"https=
://errors.yoctoproject.org/Errors/Details/962419/">https://errors.yoctoproj=
ect.org/Errors/Details/962419/</a></div></div><br><div class=3D"gmail_quote=
 gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 1=
2, 2026 at 9:13=E2=80=AFAM Markus Volk via <a href=3D"http://lists.openembe=
dded.org">lists.openembedded.org</a> &lt;f_l_k=3D<a href=3D"mailto:t-online=
.de@lists.openembedded.org">t-online.de@lists.openembedded.org</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">CLANG_EXTRA_O=
E_VENDORS already auto-derives from TARGET_VENDOR and<br>
SDK_VENDOR, recognizing a self-hosted OE build host without manual<br>
configuration. CLANG_EXTRA_OE_DISTRO has no equivalent -- it ships<br>
only &#39;poky:poky&#39;, so a self-hosted host running a custom DISTRO mus=
t<br>
be manually registered before Distro::IsOpenEmbedded() recognizes it<br>
via /etc/os-release.<br>
<br>
This is easy to get wrong by hand, since the registered id must<br>
exactly match the raw ID=3D value in /etc/os-release, including any<br>
hyphens, which must NOT be converted to underscores (unlike the<br>
generated C++ enumerator name, which requires the conversion). A<br>
single typo silently disables the OE-specific GCC-install candidate<br>
with no error, causing native clang-toolchain builds to fail to find<br>
crtbeginS.o/libgcc despite running on a genuinely OE-built host.<br>
<br>
Auto-derive an entry for the current DISTRO the same way<br>
CLANG_EXTRA_OE_VENDORS already does, so self-hosted OE build hosts<br>
are recognized out of the box with no configuration and no<br>
hyphen/underscore typo risk. &#39;poky&#39; is skipped since it is already<=
br>
the shipped default.<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
Co-authored-by: Claude &lt;<a href=3D"mailto:noreply@anthropic.com" target=
=3D"_blank">noreply@anthropic.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/clang/llvm-project-source.inc | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-devtools/clang/llvm-project-source.inc b/meta/rec=
ipes-devtools/clang/llvm-project-source.inc<br>
index 5cd08d4085..5a07080d55 100644<br>
--- a/meta/recipes-devtools/clang/llvm-project-source.inc<br>
+++ b/meta/recipes-devtools/clang/llvm-project-source.inc<br>
@@ -28,6 +28,7 @@ CLANG_EXTRA_OE_VENDORS ?=3D &quot;${TARGET_VENDOR} ${SDK_=
VENDOR}&quot;<br>
=C2=A0# &quot;:&quot; separated the ID in &quot;/etc/os-release&quot; and t=
he triple for finding gcc on this OE DISTRO.<br>
=C2=A0# eg: &quot;poky:poky wrlinux:wrs&quot;<br>
=C2=A0CLANG_EXTRA_OE_DISTRO ?=3D &quot;poky:poky&quot;<br>
+CLANG_EXTRA_OE_DISTRO:append =3D &quot;${@ &#39; &#39; + d.getVar(&#39;DIS=
TRO&#39;) + &#39;:oe&#39; if d.getVar(&#39;DISTRO&#39;) not in [&#39;poky&#=
39;, &#39;&#39;] else &#39;&#39;}&quot;<br>
=C2=A0# Match with MULTILIB_GLOBAL_VARIANTS<br>
=C2=A0ML_VARIANTS =3D &quot;lib32 lib64 libx32&quot;<br>
<br>
-- <br>
2.55.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#243297): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/243297" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/243297</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120720285/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120720285/1997914</a><br>
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

--000000000000c808330658f761b7--

