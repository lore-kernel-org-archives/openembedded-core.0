Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD70CCF9F8
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 17:45:50 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.1509.1761932744913432089
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Oct 2025 10:45:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g1/8fV9F;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-33be037cf73so2877351a91.2
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 10:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761932744; x=1762537544; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GWKx+B4IfzO1lVP8gp31EqBuWEEgYqaFRRJfWocERu4=;
        b=g1/8fV9F5XsEJXcNo5JHe1ikUQWDwvRSaezpcYVrFap5E1joqNnUuZqa/zoCYEOjJq
         gEgYD0dMTqh2JHjw9ODdXpfJwgY7aWFE3XqI6QSjpFhi9zo07YRe3qFnZemaw+9v4JAL
         qnZOiycreSta5HhpRa/zOxaI4li7P9/upcSXyHyo2vpgXUzC+31BaD3McUj+2e3qXJeR
         /00NVqrZ3TmKtPlQmCrEs3Mdos6uSpmLiLIH57cZtoU6xzCrsqbPjUYSQp5o/892fWN3
         EfUKnvaoAQhHz2ilJpZu8nytaRgDwXNCyvS21S+XkHCFvdQ6sHU8U58QlAO0o+N1h2HS
         YmVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761932744; x=1762537544;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GWKx+B4IfzO1lVP8gp31EqBuWEEgYqaFRRJfWocERu4=;
        b=vCsUVpXFLY+o+C36yOKsUXo/BovmNUJmeO+bUIElyQ/sS02NHiA2kyPwvbnXxpoGZQ
         yprkAWTRMR7QwE2QCJ4ZASLN774BftThP/EAgvgOxGwYl91synFyar16AW86gtJ/XbTv
         rmLyP1C+Uke1tu4RFqHDHPVm7B36ZPeeoRLxCvSIpPsq0V/GDtC8avFLc8upczYH43Ab
         YuypgUA/VDYk3UFxsXHz8HjQYppg55WuoDrIFMPqZzAZfny/1U7Jb3+8VN74wVth/xJV
         NbSF/qc5cN8Xk8rawZal/jsclhBEgpNDevF1MIJz8nrnKu+TKQGapBNoPCx4hLBwV9mI
         qxFA==
X-Gm-Message-State: AOJu0YxdivCUQc5FEWWUG26Ic6UnGfZodbkC6h07FdA37xfo9Ceg9gFA
	y0/aF/95WbWOEiPpe+ydMAJzgdXB7DWaFV7825uoOhZ2fibzZOlTHFAvlA5EqLSbAyRLBoxRuFt
	m0ooudwCJRB0McWBjZBswB8ZJw4oD1ic=
X-Gm-Gg: ASbGncs0u1T6iAQsCHWKrsQYrmePPsYTXow6rMxNv7wT7An0jEtOsEqieApkqZIT/hg
	5lA3RQ7q8LSOUuBh3bgcu3DhTiGALpN2+u1g0kHayP6zdvwhMOvQoHkJcqleao4y1apR8MKUFZp
	eCnH38zwHK8xuHWeQtI8H6mV0NKN8CVLyefBhR488+gal2ylt1r239JoaP8xARBim2i8vOQohTi
	CPYZJFushhbOc1+DebgiClY4i1qsml41AP7Jyx8MZlvBUy2MMl5z7O+fyI2+sWuEQ8HhRoL
X-Google-Smtp-Source: AGHT+IFHj/sBANxgn/DxYzBnF1wXMzqhz5WYKYDZW4BgLSdgBY6/ExBjiKAdm3T7qSH5wvhSoUwQVa4F6slH77aYaYI=
X-Received: by 2002:a17:90b:2681:b0:32d:e780:e9d5 with SMTP id
 98e67ed59e1d1-34083055d2bmr4870097a91.22.1761932744125; Fri, 31 Oct 2025
 10:45:44 -0700 (PDT)
MIME-Version: 1.0
References: <20251031173559.1916806-1-johannes.schneider@leica-geosystems.com>
In-Reply-To: <20251031173559.1916806-1-johannes.schneider@leica-geosystems.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 31 Oct 2025 13:45:32 -0400
X-Gm-Features: AWmQ_bnqbCkt9GShunCUZQcc0UZx5UmzdAMyS2v69b20HeUYjIm-lifYmGE-Baw
Message-ID: <CADkTA4MqjYaf_3TbpqT53AkCcznuHfxbZ_S1eLDyRqozxKcPNg@mail.gmail.com>
Subject: Re: [scarthgap][PATCH v2] perf: add Kbuild file for unistd.h
To: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000054ee82064277efd9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 17:45:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225556

--00000000000054ee82064277efd9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2025 at 1:36=E2=80=AFPM Johannes Schneider <
johannes.schneider@leica-geosystems.com> wrote:

> Building 'perf' with/against newer kernels (>=3D6.14) would fail because
> of a missing 'Kbuild' in the folder created when manually installing
> the 'unistd.h' header from libc.
>
> Add a oneliner that creates the missing file, with the relevant
> content taken from the kernels Kbuild file.
>
> Tested with kernel version: 6.16.4
>

I wasn't clear.

You also need to test this with the older kernel versions and let us know
that it worked.

Not just "it should work", we can't let the infrastructure pick up any
failures, it needs to be tested before submission.

But thanks for not just saying you tested it (if you haven't). if you have
done those tests and I'm just misunderstanding, a quick v3 with
confirmation would be great.

Cheers,

Bruce



>
> Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.co=
m
> >
> ---
>  meta/recipes-kernel/perf/perf.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/
> perf.bb
> index 11fa917649..7db5fe6d1c 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -368,6 +368,7 @@ do_configure:prepend () {
>      # so we copy it from the sysroot unistd.h to the perf unistd.h
>      install -D -m0644 ${STAGING_INCDIR}/asm-generic/unistd.h
> ${S}/tools/include/uapi/asm-generic/unistd.h
>      install -D -m0644 ${STAGING_INCDIR}/asm-generic/unistd.h
> ${S}/include/uapi/asm-generic/unistd.h
> +    echo "mandatory-y +=3D unistd.h" > ${S}/include/uapi/asm-generic/Kbu=
ild
>
>      # the fetcher is inhibited by the 'inherit kernelsrc', so we do a
> quick check and
>      # copy for a helper script we need
>
> base-commit: 649147913e89cd8f7390cb17cd0be94c9710ffa6
> --
> 2.43.0
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000054ee82064277efd9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 31, 2025 at 1:36=
=E2=80=AFPM Johannes Schneider &lt;<a href=3D"mailto:johannes.schneider@lei=
ca-geosystems.com">johannes.schneider@leica-geosystems.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">Building &#39;per=
f&#39; with/against newer kernels (&gt;=3D6.14) would fail because<br>
of a missing &#39;Kbuild&#39; in the folder created when manually installin=
g<br>
the &#39;unistd.h&#39; header from libc.<br>
<br>
Add a oneliner that creates the missing file, with the relevant<br>
content taken from the kernels Kbuild file.<br>
<br>
Tested with kernel version: 6.16.4<br></blockquote><div><br></div><div><div=
 class=3D"gmail_default" style=3D"font-size:small">I wasn&#39;t clear.</div=
><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div clas=
s=3D"gmail_default" style=3D"font-size:small">You also need to test this wi=
th the older kernel versions and let us know that it worked.</div><div clas=
s=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail=
_default" style=3D"font-size:small">Not just=C2=A0&quot;it should work&quot=
;, we can&#39;t let the infrastructure pick up any failures, it needs to be=
 tested before submission.</div><div class=3D"gmail_default" style=3D"font-=
size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small=
">But thanks for not just saying you tested it (if you haven&#39;t). if you=
 have done those tests and I&#39;m just misunderstanding, a quick v3 with c=
onfirmation would be great.</div><div class=3D"gmail_default" style=3D"font=
-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:smal=
l">Cheers,</div><div class=3D"gmail_default" style=3D"font-size:small"><br>=
</div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br=
></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Johannes Schneider &lt;<a href=3D"mailto:johannes.schneider@=
leica-geosystems.com" target=3D"_blank">johannes.schneider@leica-geosystems=
.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"nor=
eferrer" target=3D"_blank">perf.bb</a> b/meta/recipes-kernel/perf/<a href=
=3D"http://perf.bb" rel=3D"noreferrer" target=3D"_blank">perf.bb</a><br>
index 11fa917649..7db5fe6d1c 100644<br>
--- a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a><br>
+++ b/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a><br>
@@ -368,6 +368,7 @@ do_configure:prepend () {<br>
=C2=A0 =C2=A0 =C2=A0# so we copy it from the sysroot unistd.h to the perf u=
nistd.h<br>
=C2=A0 =C2=A0 =C2=A0install -D -m0644 ${STAGING_INCDIR}/asm-generic/unistd.=
h ${S}/tools/include/uapi/asm-generic/unistd.h<br>
=C2=A0 =C2=A0 =C2=A0install -D -m0644 ${STAGING_INCDIR}/asm-generic/unistd.=
h ${S}/include/uapi/asm-generic/unistd.h<br>
+=C2=A0 =C2=A0 echo &quot;mandatory-y +=3D unistd.h&quot; &gt; ${S}/include=
/uapi/asm-generic/Kbuild<br>
<br>
=C2=A0 =C2=A0 =C2=A0# the fetcher is inhibited by the &#39;inherit kernelsr=
c&#39;, so we do a quick check and<br>
=C2=A0 =C2=A0 =C2=A0# copy for a helper script we need<br>
<br>
base-commit: 649147913e89cd8f7390cb17cd0be94c9710ffa6<br>
-- <br>
2.43.0<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--00000000000054ee82064277efd9--

