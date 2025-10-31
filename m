Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 396E7CCF9F8
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 17:28:50 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.1129.1761931726428949149
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Oct 2025 10:28:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PqT7vYyC;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-26a0a694ea8so19816645ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 10:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761931726; x=1762536526; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aGCKuBZux5n8GPOAYAfmNUJcv3v3wVu5h3Tg4zF0hgo=;
        b=PqT7vYyC/qfcEFxz5e4LA70iN6fRRSL+FJHzESphwp8Sia0z3+DfNf4PM0sAg/3RWe
         GuXewEG0fjfzdlFFgeIfWVM3cZQFZqEd34MVrgQZ0YlEOp5lbPZ2ZsIW0p1ZbKK9hsKX
         2L1CcYRhMXnxkCz3YbUPvlCHlLoUgNc7/cnRk/9crn9rJyYcpdIQ688M9oEzby5Vb0pV
         woWuQJ+21+dYkSDAePHbEY1Y3ORH+p084RkqxJ5nAAeNG1RxbbPFoyaPHZVDkHhLQwXX
         5rodLW3g0rcF+yxFjcPrh+qLC3Ed0HJsMSj9bnDqvtqxbf9Gm4PXRh+dcpx03/Eogaiu
         dsqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761931726; x=1762536526;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aGCKuBZux5n8GPOAYAfmNUJcv3v3wVu5h3Tg4zF0hgo=;
        b=JkSufnaC0O6kJ5ZUjvrRVHiurwcMfYlgvbw+a2XEfHh1/bQakkpeBlRFXiV8vSfCwd
         pfb78lKTWzMOiLbGQku3dxiowmIKHswZBYEI556fEvBVZR0uxDFR7npz3lb7Fn6oeSWl
         9BzjLXtXgbPJxbLzPJMZzz4d9pGD+3yRlxLQCvPtRYH/XZ6cjZ65CjX5tFEczFaGf5yl
         bWdn0RnoYqWuwU0I7IT9h6wonPVg/DJodOmo7BCYogh4r9Cp8RvhwQT7P4RGyUK2mTQ/
         DhO+seb98j17rdLVqk7kSM5waW4qYXBYKorAUOLjOn+afjEJr56J/6SO7XNWxAsLTEL/
         j05w==
X-Gm-Message-State: AOJu0YxZtSrIO7cXPEWhuYr7XnAA9XutEj0mKFC870UoEuk54CbiXtbY
	rl0nU20vm74BjtSP/teDBTI93Xk6D2v27ozbnMAbpFPfLBXiudCGW9EvmV+K3npthAXcR0ReYko
	d6ekGBiWeMmohT8wL8O4CDAITVl1cYys=
X-Gm-Gg: ASbGncudyQnEjvcBlcPYuASV2MlCegbAIu9neyqw2LaMaxHDbpnhr5FtTHM5ws5FB9r
	7CjFwXhB6yiXg2wgt+FTNa7ergV/I0S+tfbb83zGNs94/0PEjwgCCDUMleiegZyyjKELStE01jJ
	bo0Ym297fpwf/xGGBqrUPx5K2B7n+YjaArFDgo1snqTb9k0gSlKiBx3xd9MyaAPX7MVd9B+kOVx
	wWsu7pq90HfYll079gCVhroSwXGC8INtYVxuZ82PDCIS+MhUoimXC08f486yTe2x14+6mXR
X-Google-Smtp-Source: AGHT+IFF+GdlEAuyGXBUIG1PmKYec7ArX4VMccO59vbF7Ps713i0pt7J3MuCm3mEtsW8DPH533qP9oD4+InE5xcTL20=
X-Received: by 2002:a17:902:7c8d:b0:290:91b0:def4 with SMTP id
 d9443c01a7336-2951a45984dmr43154375ad.29.1761931725702; Fri, 31 Oct 2025
 10:28:45 -0700 (PDT)
MIME-Version: 1.0
References: <20251031161551.1405597-1-johannes.schneider@leica-geosystems.com>
 <CADkTA4NOMxSoVmMBws+gYzZ86MU6fexv_aBRBT3yf4ypU-D9Fw@mail.gmail.com> <AM6PR0602MB3830B96F3C636FFB1AA7E3C9BCF8A@AM6PR0602MB3830.eurprd06.prod.outlook.com>
In-Reply-To: <AM6PR0602MB3830B96F3C636FFB1AA7E3C9BCF8A@AM6PR0602MB3830.eurprd06.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 31 Oct 2025 13:28:33 -0400
X-Gm-Features: AWmQ_blMAdwVSc8sMNaOpkeMrCUjqCATrJToFwq145ZY5On7WKftc-1gbxfU_Io
Message-ID: <CADkTA4MR1UPpLPSEvJTRHn4m_jD0JLc6fNhKvexzdRoqO5Vqhw@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH v1] perf: add Kbuild file for unistd.h
To: SCHNEIDER Johannes <johannes.schneider@leica-geosystems.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a10bd9064277b2f6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 17:28:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225554

--000000000000a10bd9064277b2f6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2025 at 1:26=E2=80=AFPM SCHNEIDER Johannes <
johannes.schneider@leica-geosystems.com> wrote:

> Hoi Bruce,
>
> >
> > On Fri, Oct 31, 2025 at 12:15=E2=80=AFPM Johannes Schneider via
> lists.openembedded.org<http://lists.openembedded.org/>
> <johannes.schneider=3Dleica-geosystems.com@lists.openembedded.org<mailto:
> leica-geosystems.com@lists.openembedded.org>> wrote:
> > Building 'perf' with/against newer kernels (>=3D6.14) would fail becaus=
e
> > of a missing 'Kbuild' in the folder created when manually installing
> > the 'unistd.h' header from libc.
> >
> > Add a oneliner that creates the missing file, with the relevant
> > content taken from the kernels Kbuild file.
> >
> > Signed-off-by: Johannes Schneider <
> johannes.schneider@leica-geosystems.com<mailto:
> johannes.schneider@leica-geosystems.com>>
> > ---
> >  meta/recipes-kernel/perf/perf.bb<http://perf.bb/> | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/recipes-kernel/perf/perf.bb<http://perf.bb/>
> b/meta/recipes-kernel/perf/perf.bb<http://perf.bb/>
> > index 11fa917649..7db5fe6d1c 100644
> > --- a/meta/recipes-kernel/perf/perf.bb<http://perf.bb/>
> > +++ b/meta/recipes-kernel/perf/perf.bb<http://perf.bb/>
> > @@ -368,6 +368,7 @@ do_configure:prepend () {
> >      # so we copy it from the sysroot unistd.h to the perf unistd.h
> >      install -D -m0644 ${STAGING_INCDIR}/asm-generic/unistd.h
> ${S}/tools/include/uapi/asm-generic/unistd.h
> >      install -D -m0644 ${STAGING_INCDIR}/asm-generic/unistd.h
> ${S}/include/uapi/asm-generic/unistd.h
> > +    echo "mandatory-y +=3D unistd.h" >
> ${S}/include/uapi/asm-generic/Kbuild
> >
> > What happens with older kernels that haven't previously needed this ?
> >
> > Bruce
> >
>
> Since there perf seemingly builds fine, i'd expect the Kbuild is neither
> needed nor used.
>
> I ask, because you need to put that in the commit log.

Test with kernel versions <x>, <y>.

Otherwise, how are we supposed to know if it will cause breakage or not ?

Bruce



>
> gru=C3=9F
> Johannes
>
> >
> >
> >      # the fetcher is inhibited by the 'inherit kernelsrc', so we do a
> quick check and
> >      # copy for a helper script we need
> >
> > base-commit: 649147913e89cd8f7390cb17cd0be94c9710ffa6
> > --
> > 2.43.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000a10bd9064277b2f6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 31, 2025 at 1:26=
=E2=80=AFPM SCHNEIDER Johannes &lt;<a href=3D"mailto:johannes.schneider@lei=
ca-geosystems.com">johannes.schneider@leica-geosystems.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hoi Bruce,<br>
<br>
&gt;<br>
&gt; On Fri, Oct 31, 2025 at 12:15=E2=80=AFPM Johannes Schneider via <a hre=
f=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">li=
sts.openembedded.org</a>&lt;<a href=3D"http://lists.openembedded.org/" rel=
=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/</a>&gt; &l=
t;johannes.schneider=3D<a href=3D"mailto:leica-geosystems.com@lists.openemb=
edded.org" target=3D"_blank">leica-geosystems.com@lists.openembedded.org</a=
>&lt;mailto:<a href=3D"mailto:leica-geosystems.com@lists.openembedded.org" =
target=3D"_blank">leica-geosystems.com@lists.openembedded.org</a>&gt;&gt; w=
rote:<br>
&gt; Building &#39;perf&#39; with/against newer kernels (&gt;=3D6.14) would=
 fail because<br>
&gt; of a missing &#39;Kbuild&#39; in the folder created when manually inst=
alling<br>
&gt; the &#39;unistd.h&#39; header from libc.<br>
&gt;<br>
&gt; Add a oneliner that creates the missing file, with the relevant<br>
&gt; content taken from the kernels Kbuild file.<br>
&gt;<br>
&gt; Signed-off-by: Johannes Schneider &lt;<a href=3D"mailto:johannes.schne=
ider@leica-geosystems.com" target=3D"_blank">johannes.schneider@leica-geosy=
stems.com</a>&lt;mailto:<a href=3D"mailto:johannes.schneider@leica-geosyste=
ms.com" target=3D"_blank">johannes.schneider@leica-geosystems.com</a>&gt;&g=
t;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noref=
errer" target=3D"_blank">perf.bb</a>&lt;<a href=3D"http://perf.bb/" rel=3D"=
noreferrer" target=3D"_blank">http://perf.bb/</a>&gt; | 1 +<br>
&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=
=3D"noreferrer" target=3D"_blank">perf.bb</a>&lt;<a href=3D"http://perf.bb/=
" rel=3D"noreferrer" target=3D"_blank">http://perf.bb/</a>&gt; b/meta/recip=
es-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer" target=3D"_bla=
nk">perf.bb</a>&lt;<a href=3D"http://perf.bb/" rel=3D"noreferrer" target=3D=
"_blank">http://perf.bb/</a>&gt;<br>
&gt; index 11fa917649..7db5fe6d1c 100644<br>
&gt; --- a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noref=
errer" target=3D"_blank">perf.bb</a>&lt;<a href=3D"http://perf.bb/" rel=3D"=
noreferrer" target=3D"_blank">http://perf.bb/</a>&gt;<br>
&gt; +++ b/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noref=
errer" target=3D"_blank">perf.bb</a>&lt;<a href=3D"http://perf.bb/" rel=3D"=
noreferrer" target=3D"_blank">http://perf.bb/</a>&gt;<br>
&gt; @@ -368,6 +368,7 @@ do_configure:prepend () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # so we copy it from the sysroot unistd.h to the p=
erf unistd.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0 install -D -m0644 ${STAGING_INCDIR}/asm-generic/un=
istd.h ${S}/tools/include/uapi/asm-generic/unistd.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0 install -D -m0644 ${STAGING_INCDIR}/asm-generic/un=
istd.h ${S}/include/uapi/asm-generic/unistd.h<br>
&gt; +=C2=A0 =C2=A0 echo &quot;mandatory-y +=3D unistd.h&quot; &gt; ${S}/in=
clude/uapi/asm-generic/Kbuild<br>
&gt;<br>
&gt; What happens with older kernels that haven&#39;t previously needed thi=
s ?<br>
&gt;<br>
&gt; Bruce<br>
&gt;<br>
<br>
Since there perf seemingly builds fine, i&#39;d expect the Kbuild is neithe=
r needed nor used.<br>
<br></blockquote><div><div class=3D"gmail_default" style=3D"font-size:small=
"></div><div class=3D"gmail_default" style=3D"font-size:small">I ask, becau=
se you need to put that in the commit log.</div><div class=3D"gmail_default=
" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D=
"font-size:small">Test with kernel versions &lt;x&gt;, &lt;y&gt;.</div><div=
 class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"=
gmail_default" style=3D"font-size:small">Otherwise, how are we supposed to =
know if it will cause breakage or not ?</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<br>
gru=C3=9F<br>
Johannes<br>
<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # the fetcher is inhibited by the &#39;inherit ker=
nelsrc&#39;, so we do a quick check and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # copy for a helper script we need<br>
&gt;<br>
&gt; base-commit: 649147913e89cd8f7390cb17cd0be94c9710ffa6<br>
&gt; --<br>
&gt; 2.43.0<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; - Thou shalt not follow the NULL pointer, for chaos and madness await =
thee at its end<br>
&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
&gt;<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000a10bd9064277b2f6--

