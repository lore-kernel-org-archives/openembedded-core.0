Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D2B1CCFA00
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 17:08:10 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.643.1761930484032325878
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Oct 2025 10:08:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JdEluh2t;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7a27053843bso3716919b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 10:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761930483; x=1762535283; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tIkGEY6W3pGr8ys368mPfedfApUblbHAiY0a7XV2Les=;
        b=JdEluh2tAESM/3GHcDGrbuSYerNmvmQ5pfF5dJM3OoDAqBe2N3kX48VeKAfe28pvsy
         tihZMLXDpKq8zQKGkRYNXljI3EUsnnWHFRx5wZcLS4ENXZZy1tm0ykzxYqLzlCg5GQX6
         YKtFnDQ/yb+e+jK9UDwwFFd0oeg8B4XcwwVJ4PY+fqsunp0SgI8G02x5JADzDZUR5kiP
         lWPfZHGZHXWlcrYlHC41Cug7IBsrxSNdoE6uw3m9kGUuUDSULeXNzyvWDcotkEekH2n6
         GgoyfNWy9jyywr81Qs2zvIHdkiZpcgc2Pi5CtydHRaPhEnVSRYJ1AMAfuU1hA0TRATUT
         Q4vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761930483; x=1762535283;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tIkGEY6W3pGr8ys368mPfedfApUblbHAiY0a7XV2Les=;
        b=KtKTNE5MRnjNg+i3x+oZgyBLNjcL3SEQsktnbct96IMTUzlk0tHGQMFkgsQeh/fa/T
         oWe9YrwuL4Lo/MxxICPcMJYKUUGAnIpBRTDzqAy2l8AY0Owd4olhUekJH2oIfm3GlPss
         zoN8LWL7I2rDcWyVQxLN4rrwSYQzMiHHuvi7mjqa2OzEbyJiodxJIMLZVzBh8Bk8bY0m
         J3m4lTpCctJuwYkFJ/42MFglE+M3nWq6vwl/mfP+yHjgph0SiFsW69aIer0TcKe8a2t3
         wIrNB6xC4AhNxuleaayXn+OhVWvlfIQyo4Ad16f8Vdpa7qy1Vp5DIv60reXOIMqbZ+OL
         s+xQ==
X-Gm-Message-State: AOJu0Yzd3HFvou9aoBxdk1o2lLPX/BWpb9aPjAt9sl1OD+NopDwbo4z4
	wrY1hdJ/eHpimeUlFOXO4uMl/ULSvdJvlCU6TQWx5TYHuTMxJMiyp7kp5xFL5UIAdiVINLk75XB
	hEMJAAHIYPMfR0yET59ZYMOnJPFsSksQ=
X-Gm-Gg: ASbGncs68CTQ1zuR/X3R38YPDSMq9l0KqFW/rHHpMcU0vkI8K77lumDqvyXR7y9RTUo
	/sGrUnVdfman9+S1VAPDaDNKNlweerMMbsVHR2bL6yo0K+a/xkO/vDwv0+CoKlL16Vm6ozxsbvb
	k0fkWfPaRrg69wDmYOswunlKvHE/t8RA40VeOtgZGXAblS4edQAJ0ixjJOmU3mJjQsPCtHWJ23/
	m2wVpiagBYvHGLqIAJ5jw6o9ZMY6aC0yLTDSVtxxIe6Eymn4ALLBwwblr2ulA==
X-Google-Smtp-Source: AGHT+IEnH6DzGak1lg3vzyv6nKrujh2qyaqBs69qFfrpjuJlKvsuO0hz3mmW4wklLickdy8hYr3dOY9y2A2UpCPpIrU=
X-Received: by 2002:a05:6a20:918b:b0:334:8002:740f with SMTP id
 adf61e73a8af0-348cc8e6643mr6028814637.41.1761930483103; Fri, 31 Oct 2025
 10:08:03 -0700 (PDT)
MIME-Version: 1.0
References: <20251031161551.1405597-1-johannes.schneider@leica-geosystems.com>
In-Reply-To: <20251031161551.1405597-1-johannes.schneider@leica-geosystems.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 31 Oct 2025 13:07:51 -0400
X-Gm-Features: AWmQ_bm7rH8a3IbuNMD_WuPfUxV50lIxlmqNgFiiZAvYKJ--ejBFCuuT0dprIu4
Message-ID: <CADkTA4NOMxSoVmMBws+gYzZ86MU6fexv_aBRBT3yf4ypU-D9Fw@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH v1] perf: add Kbuild file for unistd.h
To: johannes.schneider@leica-geosystems.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000907d4a0642776833"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 17:08:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225552

--000000000000907d4a0642776833
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2025 at 12:15=E2=80=AFPM Johannes Schneider via
lists.openembedded.org <johannes.schneider=3D
leica-geosystems.com@lists.openembedded.org> wrote:

> Building 'perf' with/against newer kernels (>=3D6.14) would fail because
> of a missing 'Kbuild' in the folder created when manually installing
> the 'unistd.h' header from libc.
>
> Add a oneliner that creates the missing file, with the relevant
> content taken from the kernels Kbuild file.
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

What happens with older kernels that haven't previously needed this ?

Bruce



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
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225547):
> https://lists.openembedded.org/g/openembedded-core/message/225547
> Mute This Topic: https://lists.openembedded.org/mt/116050956/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000907d4a0642776833
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 31, 2025 at 12:15=
=E2=80=AFPM Johannes Schneider via <a href=3D"http://lists.openembedded.org=
">lists.openembedded.org</a> &lt;johannes.schneider=3D<a href=3D"mailto:lei=
ca-geosystems.com@lists.openembedded.org">leica-geosystems.com@lists.openem=
bedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Building &#39;perf&#39; with/against newer kernels (&gt;=3D6.14)=
 would fail because<br>
of a missing &#39;Kbuild&#39; in the folder created when manually installin=
g<br>
the &#39;unistd.h&#39; header from libc.<br>
<br>
Add a oneliner that creates the missing file, with the relevant<br>
content taken from the kernels Kbuild file.<br>
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
/uapi/asm-generic/Kbuild<br></blockquote><div><br></div><div><div class=3D"=
gmail_default" style=3D"font-size:small">What happens with older kernels th=
at haven&#39;t previously needed this ?</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<br>
=C2=A0 =C2=A0 =C2=A0# the fetcher is inhibited by the &#39;inherit kernelsr=
c&#39;, so we do a quick check and<br>
=C2=A0 =C2=A0 =C2=A0# copy for a helper script we need<br>
<br>
base-commit: 649147913e89cd8f7390cb17cd0be94c9710ffa6<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#225547): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/225547" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/225547</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116050956/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116050956/1050810</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.com" =
target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000907d4a0642776833--

