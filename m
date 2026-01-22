Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48377D3EE9D
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 17:19:51 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42813.1769102385568879348
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jan 2026 09:19:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=arCi+7z8;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-79414ab1497so12132767b3.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 09:19:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769102385; cv=none;
        d=google.com; s=arc-20240605;
        b=hzPc6yMF5/+xqxaYAnJPUyEdyeDts5SZGIadmfg1yak2B6mZt+2NS9QUTP8KA8ipeO
         XbpTqS4chwMrWI4huEirBLqgQL0VkdkyB56W8IGJIb0N3Jvv4Z6hB2bnNnH+zF9L2n+M
         lthZuRvpmWaWcB6Md2Z2Xp9H2BaD7ayNyxQ9kMIfKlYFWb6e4mXtVoA/xu3w8dMJVJoC
         GcC9OO9mAJvEr0IbQ7MS7tAUlasTut3BdUWLpkFkOAipc47SGMPvG6qJboIX1GzUPGaO
         5XMe2DmxtS4HQDvHVrImVK6KKiMEYuOytYAnSnfhrVARvYShboVt0vqEsIlJ4iQgMC5c
         dkdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EQ3Dl0bYVlfxPMf1fDYqIpuVx+ulHPz7tdNWtxkObi8=;
        fh=qoYv191RENe7+aBHJb2FgjNGrkVEmdAiGQiwISUlUek=;
        b=M4xSoETB5i5pSyFjGW5RcI6X3yVNT7QBdBgV/uE7g403qLY7MElFZUHe+AUwbSadtW
         9ft2SFpW/8X+eAa1SbSET0lnlSGJSYVy7mj2jiyfw1ORBOgniw9+Oi+IieXuZ2bZwf1u
         sdSOg15KWzKnxcxtxhArEYRMzA+aVcU/K8DRu/Otm2L56py5cmOEI3K/1ukMtybVW6rs
         87hqnLDZeVs611VgkzSRyFVKzWNij2Ko/7ShIv+Z51EecHEmuS/oFG7d5HlaBhQfWiye
         CPJClguA9mf44axzCjqECQE8sqkAb+3RkhjLArYYQgUZpLjQetvkF1vqaDwiy6PcD93H
         csvw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769102385; x=1769707185; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EQ3Dl0bYVlfxPMf1fDYqIpuVx+ulHPz7tdNWtxkObi8=;
        b=arCi+7z8ntc4qkW4l8pfEDrq7qyqTjFTZ9nyK/uRCKnKr8yRxTtNx9Sm/heEunjEF0
         pT2ZzTPVEY4ICETmWTXozJLn0Kl5748IXZJyMyQAA5H3MYFBGylbsPmbW9j3Kfrp1RsC
         rHingvRVFtd5uqa/zZXP/9tg+jbhaOjibdvmkuvgD6wcmFQokm2BbHC/0d5X+NQ5SUam
         kgMb8l+qTQGhgq7711KJOS3oAIRGzZ6UtuTEWDbv+hfmUAZfXy5U8K2mOcUrq39PGEcO
         YwXsh3FWObGrI5ntNriaHFryHqTAsWMDrWuW85bwK5cxgKAqwELQYbzT3ashbs+aKJ9X
         nGBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769102385; x=1769707185;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EQ3Dl0bYVlfxPMf1fDYqIpuVx+ulHPz7tdNWtxkObi8=;
        b=NFH76h1KSebPnp9VeuTe9yfBAShaj2w1IKEdcStKdrA5Jyh9fmgzXeX55/l21RHQt4
         9Kl2O2EK9PUqO+7gPd768PlecA8kZ9zSBPeN36ZC2D5vkRnJLbVX5oPBYNdB6tzETAVJ
         fqgyZg+GPc8Ws9324aNUXGqeW8styB79AYsz9wkOvcMKw4vkk9SiK1xK39uy/KrTBwRl
         ++Xa5dVWax5D7jjRL7ZC4j0ub9hRPrkCjmLB4SmESLKa5FDpnICFLRv2UZOS7ZomFM6c
         tYtsZTPTnQIsPvjaWcDn1Huxhs7T1XHI0yTUa0tkVilOKgkhbzXfBwRdA8yN0YBOpx8W
         GEaA==
X-Gm-Message-State: AOJu0YybpaQqHstt4OxZi32DxKJtnqjE0VBmHWpMYTL+rUXUjQU1WVlv
	BjpIR6nc0AAYvuLnFe1fXHMAHJmZh5WSYpmVVxlXzWFF2zFMqMigEQ9y7iY7MxDR6ZSzBoP6+Xp
	49rgZRObMDhJCVATEtgUeLfsebYVF1l/BdrO1
X-Gm-Gg: AZuq6aKeRm6/91WBMjS0NWd7OwEQzw9dH09ghEBxvGQgQk0I3AHd9ZtxriK9X6cAa1M
	6zLcfogMJo885S3pSe48cE2KV3WFzy/ICGV2Q7V/fe/SSRD9bApGogh0Sxg6CyxO/k5/YompZ5/
	6AUuD++hJ88DH2CRHcysI9Hxz4s6/sepqvuo0JwE8jTmD2R85Rqqol+qmrD4RwNuhEE+0PrVkUg
	oQMznyD0NptheMu1EgAZAlbXApxahPsOY6m42EgnGlgvexg6QD+BmZcoG0Yxzj6zM3tW2IWApow
	aGoNl1k9hRKJ+ijqRvtNuu++jwHUhDHemMAcB0f3ZXxrjtbP/qn5PKUlcbF2IlwtKtM9gZ3TSzV
	oShFC/KAEL0FTBF4qV3o/aojdEdrP9p3gKa2YjLQ6zW7+jg==
X-Received: by 2002:a05:690c:e3c8:b0:78c:2f46:1e1c with SMTP id
 00721157ae682-79439903663mr2852617b3.28.1769102384334; Thu, 22 Jan 2026
 09:19:44 -0800 (PST)
MIME-Version: 1.0
References: <20260122153050.341395-1-thomas.perrot@bootlin.com>
In-Reply-To: <20260122153050.341395-1-thomas.perrot@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 Jan 2026 09:19:18 -0800
X-Gm-Features: AZwV_QhhEEEHEzJNmkttuvdV6Z7WlzpacujVZA2_NVXKVRhBSUgiesGMEx83Eik
Message-ID: <CAMKF1sqD8T-5g8S2nhDEivcg84U0Kw3GjnAs_0qDqKqy13_Q1A@mail.gmail.com>
Subject: Re: [OE-core][PATCH] opensbi: force gcc toolchain
To: thomas.perrot@bootlin.com
Cc: openembedded-core@lists.openembedded.org, thomas.petazzoni@bootlin.com
Content-Type: multipart/alternative; boundary="000000000000308ddd0648fd3f56"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 17:19:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229853

--000000000000308ddd0648fd3f56
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 22, 2026 at 7:31=E2=80=AFAM Thomas Perrot via lists.openembedde=
d.org
<thomas.perrot=3Dbootlin.com@lists.openembedded.org> wrote:

> From: Thomas Perrot <thomas.perrot@bootlin.com>
>
> OpenSBI requires the gcc toolchain to build correctly. Set TOOLCHAIN
> explicitly to prevent build failures when using alternative
> toolchains.
>

I am assuming you are having issues compiling it with clang, it would be
good to document whats going wrong.
Since it's a bug to address, openSBI does not intend to use a particular
compiler.


>
> Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> ---
>  meta/recipes-bsp/opensbi/opensbi_1.8.1.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb
> b/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb
> index 0a9652c2831e..52d7b38ff2ba 100644
> --- a/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb
> +++ b/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb
> @@ -15,6 +15,8 @@ TARGET_DBGSRC_DIR =3D "/share/opensbi/*/generic/firmwar=
e/"
>
>  TARGET_CC_ARCH +=3D "${LDFLAGS}"
>
> +TOOLCHAIN =3D "gcc"
> +
>  RISCV_SBI_FW_TEXT_START ??=3D "0x80000000"
>  EXTRA_OEMAKE +=3D "REPRODUCIBLE=3Dy CROSS_COMPILE=3D${HOST_PREFIX}
> ELFFLAGS=3D"${LDFLAGS}" PLATFORM=3D${RISCV_SBI_PLAT} I=3D${D}
> FW_TEXT_START=3D${RISCV_SBI_FW_TEXT_START}"
>  EXTRA_OEMAKE:append:toolchain-clang =3D " LLVM=3Dy"
> --
> 2.52.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229847):
> https://lists.openembedded.org/g/openembedded-core/message/229847
> Mute This Topic: https://lists.openembedded.org/mt/117401535/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000308ddd0648fd3f56
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 22,=
 2026 at 7:31=E2=80=AFAM Thomas Perrot via <a href=3D"http://lists.openembe=
dded.org">lists.openembedded.org</a> &lt;thomas.perrot=3D<a href=3D"mailto:=
bootlin.com@lists.openembedded.org">bootlin.com@lists.openembedded.org</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From:=
 Thomas Perrot &lt;<a href=3D"mailto:thomas.perrot@bootlin.com" target=3D"_=
blank">thomas.perrot@bootlin.com</a>&gt;<br>
<br>
OpenSBI requires the gcc toolchain to build correctly. Set TOOLCHAIN<br>
explicitly to prevent build failures when using alternative<br>
toolchains.<br></blockquote><div><br></div><div>I am assuming you are havin=
g issues compiling it with clang, it would be good to document whats=C2=A0g=
oing wrong.</div><div>Since it&#39;s a bug to address, openSBI does not int=
end to use a particular compiler.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Thomas Perrot &lt;<a href=3D"mailto:thomas.perrot@bootlin.co=
m" target=3D"_blank">thomas.perrot@bootlin.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-bsp/opensbi/<a href=3D"http://opensbi_1.8.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">opensbi_1.8.1.bb</a> | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/recipes-bsp/opensbi/<a href=3D"http://opensbi_1.8.1.bb" r=
el=3D"noreferrer" target=3D"_blank">opensbi_1.8.1.bb</a> b/meta/recipes-bsp=
/opensbi/<a href=3D"http://opensbi_1.8.1.bb" rel=3D"noreferrer" target=3D"_=
blank">opensbi_1.8.1.bb</a><br>
index 0a9652c2831e..52d7b38ff2ba 100644<br>
--- a/meta/recipes-bsp/opensbi/<a href=3D"http://opensbi_1.8.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">opensbi_1.8.1.bb</a><br>
+++ b/meta/recipes-bsp/opensbi/<a href=3D"http://opensbi_1.8.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">opensbi_1.8.1.bb</a><br>
@@ -15,6 +15,8 @@ TARGET_DBGSRC_DIR =3D &quot;/share/opensbi/*/generic/firm=
ware/&quot;<br>
<br>
=C2=A0TARGET_CC_ARCH +=3D &quot;${LDFLAGS}&quot;<br>
<br>
+TOOLCHAIN =3D &quot;gcc&quot;<br>
+<br>
=C2=A0RISCV_SBI_FW_TEXT_START ??=3D &quot;0x80000000&quot;<br>
=C2=A0EXTRA_OEMAKE +=3D &quot;REPRODUCIBLE=3Dy CROSS_COMPILE=3D${HOST_PREFI=
X} ELFFLAGS=3D&quot;${LDFLAGS}&quot; PLATFORM=3D${RISCV_SBI_PLAT} I=3D${D} =
FW_TEXT_START=3D${RISCV_SBI_FW_TEXT_START}&quot;<br>
=C2=A0EXTRA_OEMAKE:append:toolchain-clang =3D &quot; LLVM=3Dy&quot;<br>
-- <br>
2.52.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#229847): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/229847" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/229847</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117401535/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117401535/1997914</a><br>
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

--000000000000308ddd0648fd3f56--

