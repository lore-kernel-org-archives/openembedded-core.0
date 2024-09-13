Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6114FA373A
	for <webhook@archiver.kernel.org>; Fri, 13 Sep 2024 10:01:19 +0000 (UTC)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
 by mx.groups.io with SMTP id smtpd.web10.70088.1726221677715830209
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Sep 2024 03:01:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YImPkwrh;
 spf=pass (domain: gmail.com, ip: 209.85.217.47, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-49bcf6b9b64so242635137.1
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Sep 2024 03:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726221677; x=1726826477; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OmB7YqpMuSDBSNy5Xkcwu703stY2Q52F7kOMz0LRyMw=;
        b=YImPkwrhqu6J0f3BjwyNChx8ftCjEzTJIT/zB0fvDYBoZBqIVLimbP8O/ConxuoqaH
         co78L+uk3foeSFZv4KV/HaKeKM0kj2G+51xumKJN/TnB0VeE+OdZ683Wd7RFVaaWGOQR
         16E+3dNXcnnKfFz+3m/gSrdERbpnEVYro8jX2dbLRuymTo+Gy5DljDQITOMegPmH3m2F
         zAR+K8RnUbAD8uIBPk4OR4+gUcwQudEQnRzDbnr/TolXtv8C7yL2rJlXIqBi9//wXC9x
         lqmMPCl+JAeLF79SQ88gof4k7yvson3xup3l5VOqQdgIyT4UXH8XTmBxUGviw5EsUjKs
         kYSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726221677; x=1726826477;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OmB7YqpMuSDBSNy5Xkcwu703stY2Q52F7kOMz0LRyMw=;
        b=I9D6ixS5j9e9xMZUgZ1VKMFNYjxicBzS/wIlYniyAdMZHXlvUltRFDx1/qEh6fKE5q
         KRe7ptabrjcYv9FCkH1Sb2xAwKThUAA29v/Y28bksqwzheDYGMYD30G18b678fwNURyJ
         ffazt741or9iuw0kNvB6Qqa/swMR8qT3pM0/umjnIrVXf685rpvZ7fTIB2mPFgPNbzN7
         G9wFQByvojyi413vOPATSg1eWedrDjp5gFIE1dmoAtDiXM00Hk9odVWF5LrPUvszWCPt
         YMPOh+FrcoXTd4JW/hkIYq35c/5+XmbROJwyX1mmKjg4cgGsmqX5jbjDghX6BwME7T9r
         vFaw==
X-Forwarded-Encrypted: i=1; AJvYcCVLhfSjmxouzyOUQF3lL9+asFduK6dt1ghmxcfwOKcbVVCW6SmNHiMyrSZTv/kVDCzXw8Hx/p/g5gWB7SjB/UHang==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyoGjidVRsaEYobWfcv1zAb/NicKQKrwLOYn6JwAqXmAvJOO7B8
	to6tUmzPeGImHFfLwy46IS8AI3ZazynEzlqaYcTpK7B6y2kcvlNDGNl17v3SpmoxSPRuLw+xgd5
	cdWlYytiyc8A1Lwbxfjrf0uyWMZU=
X-Google-Smtp-Source: AGHT+IEmQHFzSYmUIGK22/Z0DLNNHn2Di80SAi7zGFioyb6PANzglEjaYX+Udah7+hXzchddfa2drGdlDMCt5QPpUGM=
X-Received: by 2002:a05:6102:3591:b0:493:d325:4d71 with SMTP id
 ada2fe7eead31-49d4f5eaed9mr1375953137.9.1726221676489; Fri, 13 Sep 2024
 03:01:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240912165736.1531460-1-ross.burton@arm.com> <CANPvuRki7+qYDDvYP96PdSBSFMSE3AKKKNei_q9RNhpdb5F-bA@mail.gmail.com>
 <1a200c1f80a7f227a6280317ab5492e9f5d7d22e.camel@linuxfoundation.org>
In-Reply-To: <1a200c1f80a7f227a6280317ab5492e9f5d7d22e.camel@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 13 Sep 2024 11:01:04 +0100
Message-ID: <CANPvuRmh-TDY==2oQBNDYjh5D77b3fdOzcuH+P0DAz+Fari0nw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sanity: check for working user namespaces
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: ross.burton@arm.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d4b76a0621fd4d24"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Sep 2024 10:01:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204476

--000000000000d4b76a0621fd4d24
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu (quinta,
12/09/2024 =C3=A0(s) 21:37):

> On Thu, 2024-09-12 at 18:29 +0100, Jose Quaresma via
> lists.openembedded.org wrote:
> >
> >
> > Ross Burton via lists.openembedded.org
> > <ross.burton=3Darm.com@lists.openembedded.org> escreveu (quinta,
> > 12/09/2024 =C3=A0(s) 17:57):
> > > If user namespaces are not available (typically because AppArmor is
> > > blocking them), alert the user.
> > >
> > > We consider network isolation sufficiently important that this is a
> > > fatal
> > > error, and the user will need to configure AppArmor to allow
> > > bitbake to
> > > create a user namespace.
> > >
> > > [ YOCTO #15592 ]
> > >
> > > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > > ---
> > >  meta/classes-global/sanity.bbclass | 24 ++++++++++++++++++++++++
> > >  1 file changed, 24 insertions(+)
> > >
> > > diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-
> > > global/sanity.bbclass
> > > index 1d242f0f0a0..72dab0fea2b 100644
> > > --- a/meta/classes-global/sanity.bbclass
> > > +++ b/meta/classes-global/sanity.bbclass
> > > @@ -475,6 +475,29 @@ def check_wsl(d):
> > >              bb.warn("You are running bitbake under WSLv2, this
> > > works properly but you should optimize your VHDX file eventually to
> > > avoid running out of storage space")
> > >      return None
> > >
> > > +def check_userns():
> > > +    """
> > > +    Check that user namespaces are functional, as they're used for
> > > network isolation.
> > > +    """
> > > +
> > > +    # There is a known failure case with AppAmrmor where the
> > > unshare() call
> > > +    # succeeds (at which point the uid is nobody) but writing to
> > > the uid_map
> > > +    # fails (so the uid isn't reset back to the user's uid). We
> > > can detect this.
> > > +    parentuid =3D os.getuid()
> > > +    pid =3D os.fork()
> > > +    if not pid:
> > > +        try:
> > > +            bb.utils.disable_network()
> > > +        except:
> > > +            pass
> > > +        os._exit(parentuid !=3D os.getuid())
> > > +
> > > +    ret =3D os.waitpid(pid, 0)[1]
> > > +    if ret:
> > > +        bb.fatal("User namespaces are not usable by BitBake,
> > > possibly due to AppArmor.\n"
> > > +                 "See
> > >
> https://discourse.ubuntu.com/t/ubuntu-24-04-lts-noble-numbat-release-note=
s/39890#unprivileged-user-namespace-restrictions
> > >  for more information.")
> > >
> >
> >
> > The error message could be better imo.
> > It will also happen inside a docker container that runs without the
> > NET_ADMIN capability, which is the default.
> >
> https://docs.docker.com/engine/containers/run/#runtime-privilege-and-linu=
x-capabilities
>
> Did you actually observe that?
>

No, I have not tested the patch.


>
> If the unshare() fails, the uids will still match and I don't think the
> error message will trigger but I could be wrong.


> What we want to detect is where the unshare() works but the uid mapping
> then fails which is the annoying apparmor corner case.
>

Right, when I first read it I thought the error would be when it failed to
create the
network namespace and not for things related to the user namespace.
So probably what I said doesn't make sense, however it is still impossible
to create the network namespace under the conditions I mentioned.

I Understand now and will play a bit with the patch to check.

Thanks for the clarification.

Jose


> Cheers,
>
> Richard
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000d4b76a0621fd4d24
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt; escreveu (quinta, 12/09/2024 =C3=A0(s) 21:37):<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">On Thu, 2024-09-12 at 18:29 +0100, Jose =
Quaresma via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> wrote:<br>
&gt; <br>
&gt; <br>
&gt; Ross Burton via <a href=3D"http://lists.openembedded.org" rel=3D"noref=
errer" target=3D"_blank">lists.openembedded.org</a><br>
&gt; &lt;ross.burton=3D<a href=3D"mailto:arm.com@lists.openembedded.org" ta=
rget=3D"_blank">arm.com@lists.openembedded.org</a>&gt; escreveu (quinta,<br=
>
&gt; 12/09/2024 =C3=A0(s) 17:57):<br>
&gt; &gt; If user namespaces are not available (typically because AppArmor =
is<br>
&gt; &gt; blocking them), alert the user.<br>
&gt; &gt; <br>
&gt; &gt; We consider network isolation sufficiently important that this is=
 a<br>
&gt; &gt; fatal<br>
&gt; &gt; error, and the user will need to configure AppArmor to allow<br>
&gt; &gt; bitbake to<br>
&gt; &gt; create a user namespace.<br>
&gt; &gt; <br>
&gt; &gt; [ YOCTO #15592 ]<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.=
com" target=3D"_blank">ross.burton@arm.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; =C2=A0meta/classes-global/sanity.bbclass | 24 +++++++++++++++++++=
+++++<br>
&gt; &gt; =C2=A01 file changed, 24 insertions(+)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-<b=
r>
&gt; &gt; global/sanity.bbclass<br>
&gt; &gt; index 1d242f0f0a0..72dab0fea2b 100644<br>
&gt; &gt; --- a/meta/classes-global/sanity.bbclass<br>
&gt; &gt; +++ b/meta/classes-global/sanity.bbclass<br>
&gt; &gt; @@ -475,6 +475,29 @@ def check_wsl(d):<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.warn(&quot;You=
 are running bitbake under WSLv2, this<br>
&gt; &gt; works properly but you should optimize your VHDX file eventually =
to<br>
&gt; &gt; avoid running out of storage space&quot;)<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0return None<br>
&gt; &gt; <br>
&gt; &gt; +def check_userns():<br>
&gt; &gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 Check that user namespaces are functional, as they=
&#39;re used for<br>
&gt; &gt; network isolation.<br>
&gt; &gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 # There is a known failure case with AppAmrmor whe=
re the<br>
&gt; &gt; unshare() call<br>
&gt; &gt; +=C2=A0 =C2=A0 # succeeds (at which point the uid is nobody) but =
writing to<br>
&gt; &gt; the uid_map<br>
&gt; &gt; +=C2=A0 =C2=A0 # fails (so the uid isn&#39;t reset back to the us=
er&#39;s uid). We<br>
&gt; &gt; can detect this.<br>
&gt; &gt; +=C2=A0 =C2=A0 parentuid =3D os.getuid()<br>
&gt; &gt; +=C2=A0 =C2=A0 pid =3D os.fork()<br>
&gt; &gt; +=C2=A0 =C2=A0 if not pid:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.utils.disable_netwo=
rk()<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 except:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 os._exit(parentuid !=3D os.getuid())=
<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 ret =3D os.waitpid(pid, 0)[1]<br>
&gt; &gt; +=C2=A0 =C2=A0 if ret:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal(&quot;User namespaces are n=
ot usable by BitBake,<br>
&gt; &gt; possibly due to AppArmor.\n&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&q=
uot;See<br>
&gt; &gt; <a href=3D"https://discourse.ubuntu.com/t/ubuntu-24-04-lts-noble-=
numbat-release-notes/39890#unprivileged-user-namespace-restrictions" rel=3D=
"noreferrer" target=3D"_blank">https://discourse.ubuntu.com/t/ubuntu-24-04-=
lts-noble-numbat-release-notes/39890#unprivileged-user-namespace-restrictio=
ns</a><br>
&gt; &gt;=C2=A0 for more information.&quot;)<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; The error message could be better imo.<br>
&gt; It will also happen inside a docker container that runs without the<br=
>
&gt; NET_ADMIN capability, which is the default.<br>
&gt; <a href=3D"https://docs.docker.com/engine/containers/run/#runtime-priv=
ilege-and-linux-capabilities" rel=3D"noreferrer" target=3D"_blank">https://=
docs.docker.com/engine/containers/run/#runtime-privilege-and-linux-capabili=
ties</a><br>
<br>
Did you actually observe that?<br></blockquote><div><br></div><div>No, I ha=
ve not tested the patch.</div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
<br>
If the unshare() fails, the uids will still match and I don&#39;t think the=
<br>
error message will trigger but I could be wrong.</blockquote><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
<br>
What we want to detect is where the unshare() works but the uid mapping<br>
then fails which is the annoying apparmor corner case.<br></blockquote><div=
><br><div>Right, when I first read it I thought the error would be when it =
failed to create the</div><div>network namespace and not for things related=
=C2=A0to the user namespace.<br>So probably what I said doesn&#39;t make se=
nse, however it is still impossible</div><div>to create the network namespa=
ce under the conditions I mentioned.<br><br></div>I Understand now and will=
 play a bit with the patch to check.<br><br>Thanks for the clarification.<b=
r><br>Jose</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000d4b76a0621fd4d24--

