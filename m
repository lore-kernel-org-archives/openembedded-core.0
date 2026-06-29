Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92BC0C43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 14:33:19 +0000 (UTC)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.93500.1782743590626956375
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 07:33:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=skZEy8Ux;
 spf=pass (domain: gmail.com, ip: 74.125.224.47, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-664b3831a20so2665942d50.3
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 07:33:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782743590; cv=none;
        d=google.com; s=arc-20260327;
        b=IBFTqfEA4xQ8w0xX5BibVRsujkk/gQVb4B2N5lm55UC8Zp/ya9Yp1h2O8NLvDR22ro
         wKnAEvAPvz1ilpxs9wL9fZGi9WR6pY3tia6PYdwJuDfF9I47uv0KHDlf23pHgOrgAuFc
         xgpCvYRXUXwaYHE6ZETLkqdpGwWif9OD1Zsrm5wDbe1DO9g1UFVTuCz7yBuxSHtbw//s
         Uk7cNLGqMWqnK9fuLw+QycK4NBhyJLKxgR0dXghZCJOLzKYBDsRoagNQS3sLCEff1sXz
         I4mi3yEx7V3YC4AF5AU8ccUXTu3uQQRZQ96YfzJpU9uRIt/6w/+UrNQ2+rHNjJ/H15/+
         lgCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xGFTwxQWNLsTnzcr+6Cpt31E4PCzIfNBLBMaPrMHTFE=;
        fh=iLKbi4EtRTLXj0PDlEuSSUEfvrkxWxR6BFalA3Tc2xg=;
        b=tDwVQRv76BPlh+L/QIF4DjmvAHd4vZAb7TAYe9wmZY/WhwTdw8Lcvg/QQyZLdC/iN2
         xIRSMAiyaiVHzRlXHoAjwcbh2i/XeCYF/4AK3McfMjH+l8jgWitR9zntOmBoAxZX2bbE
         QP6P9C2sWMJz0+RXO/B6Zm8SGPrz5hLTkCG8HArH/mFbZHouwgZjFw+tNJKjkiuupI9R
         17eOhMgU8YsWi/EOg8Zwxola0ub27zdTc8YhqtJ/n45sSqkJlT6Vfajo3OEtl9vQQB0z
         XxEfDcfYSf8zE5oGLU5oRlxtdxC1W4S1JDJKBhFMKPF1yRE5rCeTNr/5ejOCwIe6UHhA
         HHvA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782743590; x=1783348390; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xGFTwxQWNLsTnzcr+6Cpt31E4PCzIfNBLBMaPrMHTFE=;
        b=skZEy8UxR/UB6hL32NPzpNerkMGDAlrSn+CwQXo+zD0ty1yqOYzyQdYnH37uJrveY2
         YjB08XVM8P6S/3QhCTKUD52kzp6XOyxHeK+xqKJf9v5wxcqvM5lOnHQvze3zhlmkNlOp
         MWggetRz9EAO5Ef4CwvpIe/MnAcU3seHUGBtujQ6m6Du2ulQtlP75Prmj5xYeX1XHWyg
         qINWKp6q7qInoKaSfRMID7SYG+Zd2JI+PSL8d3uWe9/yhL9rSHiv3WMAalks2fhp2k6o
         87N9xYzvyXDqBVsWLCgRCBZKmeN5fPQSl0V/PimqjoZoxH4c8130pkYqAHFjzsSPLTHC
         uyRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782743590; x=1783348390;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xGFTwxQWNLsTnzcr+6Cpt31E4PCzIfNBLBMaPrMHTFE=;
        b=pLojrG65Dt9TjiJ5LL+ZkK4h0s79lG2UvQWgOHUtWfF31OqIYiCWeOgvgB/jzLUkIe
         IJMVuMWrPmrbFQ+hgnYR4V+oaoXRea55IIky9mQAkdyMwPLwg7f1hmltK/r2Lgyn32r6
         gLs7ehxpkXbxp49xOr7HYv0LPEKOwzy4uOmYMHJgQvIn9Atcl+Si1+cS/JVkzL0TLAh+
         GeleyO2EncRG6j+ZxsMi8G5DoF+vlYx6OSuXFz8BH8HXGXpUS/Y6FROKgzLDoUzyVHEh
         yY7tbqJzxkHdbVk3KgHCd/uAPvbyjxvGBhi9WfwwzKXimOrF0pNHSxTtOUH153C95Szn
         /i3g==
X-Gm-Message-State: AOJu0YyDKekU0xSwAc+tFB+HzZTXTQPCyrQcdRQGfdju30ojOpYFNKox
	+JqutgKu5g66pRML+Bui7em5t0YWBbIlmK05Af+GWmQica2yal/OCGjZTgNdNocBdnAZ28vXZyN
	JC3ucObFTAvSZq8o6b+uCluSfLdwFsvQ=
X-Gm-Gg: AfdE7cl6hEKzQZ4Qk05wpfgczEJIYOql4v1sQRJn73JuVO+AHzEhwJj0NpY4KJH8qwW
	nMDdGEyYfEmaiUjulDrf552zvjZmr8l7BrrvpwRVUYcCNGdHGJxYVbQpcyuDabwrhxVQocDkBhR
	Zi96/5t26egEvY1d/5svYAYkqvk1xrvnJ1aA/if9+/eabnnXi9kogvYJRtnmjkS2orB2fzFpeEH
	Qa/I80W7p4ODiMltnjPt94VO6025JtxRai7M67SH5uzrMuvCNLTZfNXE6DqviZuKnZ/0YQ44Gbg
	7a+FF+70kFw1v4jkSH5fri1r90arD0oxIcxeKYfYFM0HYbZ2OQ8VbG4E3L2/0/ZiUxdn6aP9VrX
	quoRT6sCQ8khF8j9JIcc/mIClboR31EYhss8Qp3YjtdCvfxGBxZN/i5KBN5aidd9YWfB8Hw==
X-Received: by 2002:a05:690e:12c4:b0:664:c67e:45d with SMTP id
 956f58d0204a3-664f61df724mr515021d50.49.1782743589479; Mon, 29 Jun 2026
 07:33:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260629141559.1305873-1-ross.burton@arm.com>
In-Reply-To: <20260629141559.1305873-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Jun 2026 07:32:58 -0700
X-Gm-Features: AVVi8CdNN6eaOkrtLEynTxOpVFqluAYDFXaN_3bUV-8PYRNoFOyy1I12-TwWoLg
Message-ID: <CAMKF1spi6u8p2GN1cOgRhwifTtH5ZX14Y8OnByn2fGjU+AtoYQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] classes/meson: use ninja explicitly when compiling
To: Ross Burton <ross.burton@arm.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000606d0b06556556cd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 14:33:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239808

--000000000000606d0b06556556cd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2026, 7:16=E2=80=AFAM Ross Burton via lists.openembedded.or=
g
<ross.burton=3Darm.com@lists.openembedded.org> wrote:

> "meson compile" is essentially a glorified wrapper around calling ninja
> that doesn't support all of the options that ninja does, so calling it
> directly means builds are fractionally faster and we get direct control
> over the flags that ninja is passed.
>
> A longer rationale can be found in the Gentoo change by Eli Schwartz
> that caused this patch, who is both a Gentoo and Meson developer:
>
>
> https://github.com/gentoo/gentoo/commit/66011abd663671947fe07835f0d9cc360=
f5de317
>
> The only change is that the compile target doesn't support the optional
> convenience target type, but this is rarely used.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/classes-recipe/meson.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/meson.bbclass
> b/meta/classes-recipe/meson.bbclass
> index 9bed293603c..a4643591103 100644
> --- a/meta/classes-recipe/meson.bbclass
> +++ b/meta/classes-recipe/meson.bbclass
> @@ -180,7 +180,7 @@ meson_do_configure() {
>
>  do_compile[progress] =3D "outof:^\[(\d+)/(\d+)\]\s+"
>  meson_do_compile() {
> -    meson compile -v ${PARALLEL_MAKE} ${MESON_TARGET}
> +    ninja --verbose ${PARALLEL_MAKE}


Like cmake verbose could be a configurable knob since its being added by
this patch

${MESON_TARGET}
>  }
>
>  meson_do_install() {
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#239785):
> https://lists.openembedded.org/g/openembedded-core/message/239785
> Mute This Topic: https://lists.openembedded.org/mt/120030899/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000606d0b06556556cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 29, 2026, 7:16=E2=80=
=AFAM Ross Burton via <a href=3D"http://lists.openembedded.org">lists.opene=
mbedded.org</a> &lt;ross.burton=3D<a href=3D"mailto:arm.com@lists.openembed=
ded.org">arm.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">&quot;meson compile&quot; is essenti=
ally a glorified wrapper around calling ninja<br>
that doesn&#39;t support all of the options that ninja does, so calling it<=
br>
directly means builds are fractionally faster and we get direct control<br>
over the flags that ninja is passed.<br>
<br>
A longer rationale can be found in the Gentoo change by Eli Schwartz<br>
that caused this patch, who is both a Gentoo and Meson developer:<br>
<br>
<a href=3D"https://github.com/gentoo/gentoo/commit/66011abd663671947fe07835=
f0d9cc360f5de317" rel=3D"noreferrer noreferrer" target=3D"_blank">https://g=
ithub.com/gentoo/gentoo/commit/66011abd663671947fe07835f0d9cc360f5de317</a>=
<br>
<br>
The only change is that the compile target doesn&#39;t support the optional=
<br>
convenience target type, but this is rarely used.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank" rel=3D"noreferrer">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/meson.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meson.=
bbclass<br>
index 9bed293603c..a4643591103 100644<br>
--- a/meta/classes-recipe/meson.bbclass<br>
+++ b/meta/classes-recipe/meson.bbclass<br>
@@ -180,7 +180,7 @@ meson_do_configure() {<br>
<br>
=C2=A0do_compile[progress] =3D &quot;outof:^\[(\d+)/(\d+)\]\s+&quot;<br>
=C2=A0meson_do_compile() {<br>
-=C2=A0 =C2=A0 meson compile -v ${PARALLEL_MAKE} ${MESON_TARGET}<br>
+=C2=A0 =C2=A0 ninja --verbose ${PARALLEL_MAKE}</blockquote></div></div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Like cmake verbose could be a co=
nfigurable knob since its being added by this patch</div><div dir=3D"auto">=
<br></div><div dir=3D"auto"><div class=3D"gmail_quote gmail_quote_container=
"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"> ${MESON_TARGET}<br>
=C2=A0}<br>
<br>
=C2=A0meson_do_install() {<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#239785): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/239785" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/239785</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120030899/199=
7914" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/120030899/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.=
com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>

--000000000000606d0b06556556cd--

