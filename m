Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B54AD13588
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 10:05:40 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.48335.1730109936895148097
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Oct 2024 03:05:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=li661z1K;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: liu.ming50@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-71e5a62031aso2919346b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 03:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730109936; x=1730714736; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BWSNu5OMxvuke0WNf/UWM24MlQsQ0Jv95mZAnQSIsHM=;
        b=li661z1KKU4g8DU5TjK+qV5Ua1HjM6Li2NkX28UKELzDZ1OL49JMG4LyI3EisgNXdv
         HUyn3g2eK+VZCNOkKAbRDeu0OzpO3/lTs/04mZGjm9yFKY7O+SbCiD0H3Ua1W7V/o6oo
         JkH71RfbUXiC072nU0/M3nu400BZ+bN6Z1xyy9zOFl5cvfmexKiuxupLCmciqdq4JgMh
         M/BbMCozH4ZFT0g4qRaN7hfADtV6sIXtIxSA1ZwMuH9ANFH+3hkA7RQsL03EPuvW4Xc5
         nDpyGaKWdHp0UXXRagwHLa/j+X6kfp5+bGF6uJuw8TiehSXxcMUl49H7pbuOpI7jVyn0
         z9LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730109936; x=1730714736;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BWSNu5OMxvuke0WNf/UWM24MlQsQ0Jv95mZAnQSIsHM=;
        b=kJkSCvwRY3J1plj2FxnKm9oyMQQkv4dEIGF4ygG40IdqXHbso/qgnTZeWTv6EeRNpY
         EWgc3XjfWFV5lpSivvMwKeLDXFwNMayWjIL2ATE7ZIeId0bziwcJH7ejs+eOOXEHWAOX
         LXW3XBGQ50d5OY6sDHmHmU/Sbctb0+2B+mkCIukDQkdrEvQ1pNGecY8fgTV+IeZ2ftar
         1Bd5mG44TEQ6CWkKupWUDIDcflMLltBHRDhVZt/LFQ7vSfDFyPnsCgZYrisf/3vA3+7V
         YcXHAnmVImwRyoh5hj75pWHtUjK8HxCiiCyNT2mEycXtIrD+tMYIFbZB1BCh3dgjCVck
         AY/g==
X-Gm-Message-State: AOJu0YyZM7auKeGICIFP9cFIDMfojciAStS80zva3bhKGaNAm55lO9ck
	S59/Qj1EupgBEOfaXpcIKxCzxrsKELs8WfDNHK9xArcz8oh0K/jhHYDlPB6hbHVtQqrdtyr+dRw
	+6A3PWDBoKvh2qLKUV7dLQOXrqRE=
X-Google-Smtp-Source: AGHT+IH7avmmgqUpoZpmgOxSX4mt+cF7APZuxx3amQqa88qB+j1iEYq2iolK9jLCv9jJJYRY5HTXi4GrFdnckkTzBaA=
X-Received: by 2002:a05:6a21:1798:b0:1d9:18b7:496 with SMTP id
 adf61e73a8af0-1d9a851e099mr10966410637.45.1730109936105; Mon, 28 Oct 2024
 03:05:36 -0700 (PDT)
MIME-Version: 1.0
References: <20241023111541.3437331-1-liu.ming50@gmail.com>
 <CALatG=5hxMtchf5wXdJZ3aBmkGouaHk3WstD=NgnCtbLaPN8JQ@mail.gmail.com> <c0d35e13f7e30151176f4230706a5ceda2f7dfcb.camel@linuxfoundation.org>
In-Reply-To: <c0d35e13f7e30151176f4230706a5ceda2f7dfcb.camel@linuxfoundation.org>
From: Ming Liu <liu.ming50@gmail.com>
Date: Mon, 28 Oct 2024 11:05:24 +0100
Message-ID: <CALatG=4=bxgkprvotpji+v5r0Zki4_hmxgdMQhFK+N8kF35aGQ@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone] [PATCH] nativesdk-intercept: Fix bad
 intercept chgrp/chown logic
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Steve Sakoman <steve@sakoman.com>, =?UTF-8?B?RWlsw61zICdwaWRnZScgTsOtIEZobGFubmFnw6Fpbg==?= <pidge@baylibre.com>
Content-Type: multipart/alternative; boundary="0000000000002a010b0625869c49"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 10:05:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206440

--0000000000002a010b0625869c49
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Richard:

Thanks for the info, will add maintainer of the LTS branches to the mail
list next time.

the best,
thank you

Richard Purdie <richard.purdie@linuxfoundation.org> =E6=96=BC 2024=E5=B9=B4=
10=E6=9C=8828=E6=97=A5 =E9=80=B1=E4=B8=80
=E4=B8=8A=E5=8D=8810:44=E5=AF=AB=E9=81=93=EF=BC=9A

> On Mon, 2024-10-28 at 09:09 +0100, Ming Liu wrote:
> > Hi, maintainers:
> >
> > Would you please cherry pick this to kirkstone, otherwise the SDK
> > build on kirkstone is broken.
>
> Firstly, you need to copy the maintainer for kirkstone. I've added him
> to the address list.
>
> Secondly, the patch is also already in his test queue:
>
>
> https://git.yoctoproject.org/poky-contrib/commit/?h=3Dstable/kirkstone-nu=
t&id=3D145886736d92a55df1e822aa75044028627587ec
>
> Thirdly, you gave us two business days to handle this before following
> up :/.
>
> Cheers,
>
> Richard
>
>
> > Ming Liu <liu.ming50@gmail.com> =E6=96=BC 2024=E5=B9=B410=E6=9C=8823=E6=
=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=881:15=E5=AF=AB=E9=81=93=EF=BC=9A
> > > From: Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=A1in <pidge@baylibre.com=
>
> > >
> > > Running either of these ends up corrupting the os.execv args.
> > >
> > > If we run:
> > > ./scripts/nativesdk-intercept/chown -R foo:foo bar
> > >
> > > The loop here ends up missing the conversion of foo:foo to
> > > root:root because
> > > it sees sys.argv[0] and assumes that it's the user:group argument
> > > and that we
> > > should convert that. We end up a os.execv(path, args) that have the
> > > following
> > > args:
> > >
> > > ['root:root', '-R', 'foo:foo', 'bar']
> > >
> > > As os.execv ignores args[0], we can just populate it with
> > > sys.argv[0] and then
> > > loop through sys.argv[1:]. As both chgrp and chown would have
> > > either flags and
> > > USER[:GROUP] next, this fixes the issue.
> > >
> > > (Backported from OE-Core rev:
> > > 2a75f647ec7696d353f4b09099d777ba53f34d36)
> > >
> > > Signed-off-by: Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=A1in <pidge@bay=
libre.com>
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > ---
> > >  scripts/nativesdk-intercept/chgrp | 5 ++++-
> > >  scripts/nativesdk-intercept/chown | 5 ++++-
> > >  2 files changed, 8 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/scripts/nativesdk-intercept/chgrp b/scripts/nativesdk-
> > > intercept/chgrp
> > > index 30cc417d3a..f8ae84b8b3 100755
> > > --- a/scripts/nativesdk-intercept/chgrp
> > > +++ b/scripts/nativesdk-intercept/chgrp
> > > @@ -14,7 +14,10 @@ real_chgrp =3D shutil.which('chgrp', path=3Dpath)
> > >  args =3D list()
> > >
> > >  found =3D False
> > > -for i in sys.argv:
> > > +
> > > +args.append(real_chgrp)
> > > +
> > > +for i in sys.argv[1:]:
> > >      if i.startswith("-"):
> > >          args.append(i)
> > >          continue
> > > diff --git a/scripts/nativesdk-intercept/chown b/scripts/nativesdk-
> > > intercept/chown
> > > index 3914b3e384..0805ceb70a 100755
> > > --- a/scripts/nativesdk-intercept/chown
> > > +++ b/scripts/nativesdk-intercept/chown
> > > @@ -14,7 +14,10 @@ real_chown =3D shutil.which('chown', path=3Dpath)
> > >  args =3D list()
> > >
> > >  found =3D False
> > > -for i in sys.argv:
> > > +
> > > +args.append(real_chown)
> > > +
> > > +for i in sys.argv[1:]:
> > >      if i.startswith("-"):
> > >          args.append(i)
> > >          continue
>
>

--0000000000002a010b0625869c49
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Richard:<div><br></div><div>Thanks for the info, will =
add maintainer of the LTS branches to the mail list next time.</div><div><b=
r></div><div>the best,</div><div>thank you</div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; =E6=96=BC 2024=E5=B9=B410=E6=9C=8828=E6=97=A5 =E9=80=B1=E4=
=B8=80 =E4=B8=8A=E5=8D=8810:44=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">On Mon, 2024-10-28 at 09:09 +0100=
, Ming Liu wrote:<br>
&gt; Hi, maintainers:<br>
&gt; <br>
&gt; Would you please cherry pick this to kirkstone, otherwise the SDK<br>
&gt; build on kirkstone is broken.<br>
<br>
Firstly, you need to copy the maintainer for kirkstone. I&#39;ve added him<=
br>
to the address list.<br>
<br>
Secondly, the patch is also already in his test queue:<br>
<br>
<a href=3D"https://git.yoctoproject.org/poky-contrib/commit/?h=3Dstable/kir=
kstone-nut&amp;id=3D145886736d92a55df1e822aa75044028627587ec" rel=3D"norefe=
rrer" target=3D"_blank">https://git.yoctoproject.org/poky-contrib/commit/?h=
=3Dstable/kirkstone-nut&amp;id=3D145886736d92a55df1e822aa75044028627587ec</=
a><br>
<br>
Thirdly, you gave us two business days to handle this before following<br>
up :/.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
&gt; Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" target=3D"_blank"=
>liu.ming50@gmail.com</a>&gt; =E6=96=BC 2024=E5=B9=B410=E6=9C=8823=E6=97=A5=
 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=881:15=E5=AF=AB=E9=81=93=EF=BC=9A<br>
&gt; &gt; From: Eil=C3=ADs &#39;pidge&#39; N=C3=AD Fhlannag=C3=A1in &lt;<a =
href=3D"mailto:pidge@baylibre.com" target=3D"_blank">pidge@baylibre.com</a>=
&gt;<br>
&gt; &gt; <br>
&gt; &gt; Running either of these ends up corrupting the os.execv args.<br>
&gt; &gt; <br>
&gt; &gt; If we run:<br>
&gt; &gt; ./scripts/nativesdk-intercept/chown -R foo:foo bar<br>
&gt; &gt; <br>
&gt; &gt; The loop here ends up missing the conversion of foo:foo to<br>
&gt; &gt; root:root because<br>
&gt; &gt; it sees sys.argv[0] and assumes that it&#39;s the user:group argu=
ment<br>
&gt; &gt; and that we<br>
&gt; &gt; should convert that. We end up a os.execv(path, args) that have t=
he<br>
&gt; &gt; following<br>
&gt; &gt; args:<br>
&gt; &gt; <br>
&gt; &gt; [&#39;root:root&#39;, &#39;-R&#39;, &#39;foo:foo&#39;, &#39;bar&#=
39;]<br>
&gt; &gt; <br>
&gt; &gt; As os.execv ignores args[0], we can just populate it with<br>
&gt; &gt; sys.argv[0] and then<br>
&gt; &gt; loop through sys.argv[1:]. As both chgrp and chown would have<br>
&gt; &gt; either flags and<br>
&gt; &gt; USER[:GROUP] next, this fixes the issue.<br>
&gt; &gt; <br>
&gt; &gt; (Backported from OE-Core rev:<br>
&gt; &gt; 2a75f647ec7696d353f4b09099d777ba53f34d36)<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Eil=C3=ADs &#39;pidge&#39; N=C3=AD Fhlannag=C3=A1i=
n &lt;<a href=3D"mailto:pidge@baylibre.com" target=3D"_blank">pidge@baylibr=
e.com</a>&gt;<br>
&gt; &gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdi=
e@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org=
</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; =C2=A0scripts/nativesdk-intercept/chgrp | 5 ++++-<br>
&gt; &gt; =C2=A0scripts/nativesdk-intercept/chown | 5 ++++-<br>
&gt; &gt; =C2=A02 files changed, 8 insertions(+), 2 deletions(-)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/scripts/nativesdk-intercept/chgrp b/scripts/nativesd=
k-<br>
&gt; &gt; intercept/chgrp<br>
&gt; &gt; index 30cc417d3a..f8ae84b8b3 100755<br>
&gt; &gt; --- a/scripts/nativesdk-intercept/chgrp<br>
&gt; &gt; +++ b/scripts/nativesdk-intercept/chgrp<br>
&gt; &gt; @@ -14,7 +14,10 @@ real_chgrp =3D shutil.which(&#39;chgrp&#39;, p=
ath=3Dpath)<br>
&gt; &gt; =C2=A0args =3D list()<br>
&gt; &gt; <br>
&gt; &gt; =C2=A0found =3D False<br>
&gt; &gt; -for i in sys.argv:<br>
&gt; &gt; +<br>
&gt; &gt; +args.append(real_chgrp)<br>
&gt; &gt; +<br>
&gt; &gt; +for i in sys.argv[1:]:<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0if i.startswith(&quot;-&quot;):<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args.append(i)<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue<br>
&gt; &gt; diff --git a/scripts/nativesdk-intercept/chown b/scripts/nativesd=
k-<br>
&gt; &gt; intercept/chown<br>
&gt; &gt; index 3914b3e384..0805ceb70a 100755<br>
&gt; &gt; --- a/scripts/nativesdk-intercept/chown<br>
&gt; &gt; +++ b/scripts/nativesdk-intercept/chown<br>
&gt; &gt; @@ -14,7 +14,10 @@ real_chown =3D shutil.which(&#39;chown&#39;, p=
ath=3Dpath)<br>
&gt; &gt; =C2=A0args =3D list()<br>
&gt; &gt; <br>
&gt; &gt; =C2=A0found =3D False<br>
&gt; &gt; -for i in sys.argv:<br>
&gt; &gt; +<br>
&gt; &gt; +args.append(real_chown)<br>
&gt; &gt; +<br>
&gt; &gt; +for i in sys.argv[1:]:<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0if i.startswith(&quot;-&quot;):<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args.append(i)<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue<br>
<br>
</blockquote></div>

--0000000000002a010b0625869c49--

