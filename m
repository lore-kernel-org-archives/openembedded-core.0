Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
 by mx.groups.io with SMTP id smtpd.web09.28507.1629974728329633124
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Aug 2021 03:45:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AlxOj+9s;
 spf=pass (domain: gmail.com, ip: 209.85.217.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f53.google.com with SMTP id m19so1679104vsj.10
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Aug 2021 03:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=25OyN84aGufgLPSsXZaV+JX4xnOcQshYwpR/BbJXDx8=;
        b=AlxOj+9sLfhCDnv5IyvIO6Jdn47Keo98NMrht8k0E/eYoGfestQK5UBaKL+XBk6MAH
         XZIycJygiuCmqXTOy+CAl8MLKno/pGeuZbgjccZwDqbeusj4iVvNPvi7Ai06Q/i2mX/a
         wnckHQehAQARdtw2/MKdeZxuJ0XnqnODF8AEterxtyqX3t9sxzMVCUpxb/KuDoM9Nx8m
         1NNRxetxJx1yRk2hpA0RtgMbWiFo6qp2kvOdvTcmaco+D/6MXnwCFHMNz6+VXhbir2Fu
         bag/2GhZxiZ9TZSst/dEnXQx1Z7SnMCWQyrMuUV6lomRUhAlMVvYT5FFLFKd8m4XOFAB
         wQUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=25OyN84aGufgLPSsXZaV+JX4xnOcQshYwpR/BbJXDx8=;
        b=uJJsc1peiShrCmmcHmS4/gvJG5fAg+hKSQsig+IepUpJIvLWvFW0U0kvlp9S+oXnw+
         P7EznF2KZnV7X+BCkAm0FmGb60Ox8N8oc/0YKj0FKMkvodX99mViS6Z0/J63jNmuoiAZ
         bcmNDToSecGELndsh47MM6Xn4B7SFYkwYMS4ZCGTE53RC0rYlFTKvrHa8D9zTSG1mfTi
         WwbvTrIeDsCe4/VqYisEFLHIESp5WS7PD0lld3f5DL1Ch0+RYnBVVjWVGenp+QLrqQLu
         36vGoMNhhw6sWd1u1kWTb1GYkbAjOCKcAiOOYlKCc9ocDAO1MhGAbLbpWzU1e2y9gsB1
         Dr3Q==
X-Gm-Message-State: AOAM530r+o6gl52bLgsG0VpHJ8SLzk5K8dZ4u3GhpoKcYbFEO8umZ20m
	xaqJ9H6sTrG3VVpf7vnmM717Sd8xmwwy098b+ng=
X-Google-Smtp-Source: ABdhPJyTJbrYmJmSGkL4LuGDTEhryraLdAWUz66q56uyXrnuIvz4g12JavJRm0u+94n/aHCyGyFi1s2OdMeuRTlaHy4=
X-Received: by 2002:a67:844:: with SMTP id 65mr1505981vsi.20.1629974727315;
 Thu, 26 Aug 2021 03:45:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210825223552.802130-1-alex.kanavin@gmail.com> <8a31a69ce20c28685294a1e3c6b289f6f5c38629.camel@linuxfoundation.org>
In-Reply-To: <8a31a69ce20c28685294a1e3c6b289f6f5c38629.camel@linuxfoundation.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 26 Aug 2021 12:45:15 +0200
Message-ID: <CANNYZj8SadPjAYW=tUNwsA-TV3vyJNGcD+2WoiXu_vGTKn-G1A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] qemurunner.py: print output from runqemu/qemu-system in stop()
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009d559b05ca74109d"

--0000000000009d559b05ca74109d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It=E2=80=99s not a real warning, just that the print itself is issued as a =
warning.
I think it just needs to be issued as info instead.

Alex

On Thu 26. Aug 2021 at 11.42, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2021-08-26 at 00:35 +0200, Alexander Kanavin wrote:
> > This is done when starting up qemu has failed, but is not done
> > when qemu started ok, but fails later in QMP communication.
> >
> > Output from runqemu does contain valuable information to find out
> > why, so rather than fix all the QMP fails to include it, let's just
> > print it in stop().
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  meta/lib/oeqa/utils/qemurunner.py | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta/lib/oeqa/utils/qemurunner.py
> b/meta/lib/oeqa/utils/qemurunner.py
> > index 5c9d2b24a3..e099c6e2a7 100644
> > --- a/meta/lib/oeqa/utils/qemurunner.py
> > +++ b/meta/lib/oeqa/utils/qemurunner.py
> > @@ -535,6 +535,8 @@ class QemuRunner:
> >              if self.runqemu.poll() is None:
> >                  self.logger.debug("Sending SIGKILL to runqemu")
> >                  os.killpg(os.getpgid(self.runqemu.pid), signal.SIGKILL=
)
> > +            if not self.runqemu.stdout.closed:
> > +                self.logger.warning("Output from runqemu:\n%s" %
> self.getOutput(self.runqemu.stdout))
> >              self.runqemu.stdin.close()
> >              self.runqemu.stdout.close()
> >              self.runqemu_exited =3D True
>
> I like the idea of this but it is showing warnings on the autobuilder:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/61/builds/3877
>
> So we may need to fix the issue it is exposing?
>
> Cheers,
>
> Richard
>
>

--0000000000009d559b05ca74109d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">It=E2=80=99s not a real warning, just that the print itse=
lf is issued as a warning. I think it just needs to be issued as info inste=
ad.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu 26. =
Aug 2021 at 11.42, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linu=
xfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:=
rgb(204,204,204)">On Thu, 2021-08-26 at 00:35 +0200, Alexander Kanavin wrot=
e:<br>
&gt; This is done when starting up qemu has failed, but is not done<br>
&gt; when qemu started ok, but fails later in QMP communication.<br>
&gt; <br>
&gt; Output from runqemu does contain valuable information to find out<br>
&gt; why, so rather than fix all the QMP fails to include it, let&#39;s jus=
t<br>
&gt; print it in stop().<br>
&gt; <br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/lib/oeqa/utils/qemurunner.py | 2 ++<br>
&gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/q=
emurunner.py<br>
&gt; index 5c9d2b24a3..e099c6e2a7 100644<br>
&gt; --- a/meta/lib/oeqa/utils/qemurunner.py<br>
&gt; +++ b/meta/lib/oeqa/utils/qemurunner.py<br>
&gt; @@ -535,6 +535,8 @@ class QemuRunner:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.runqemu.poll()=
 is None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.log=
ger.debug(&quot;Sending SIGKILL to runqemu&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.killp=
g(os.getpgid(self.runqemu.pid), signal.SIGKILL)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not self.runqemu.stdout.=
closed:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.logger.w=
arning(&quot;Output from runqemu:\n%s&quot; % self.getOutput(self.runqemu.s=
tdout))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.runqemu.stdin.clo=
se()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.runqemu.stdout.cl=
ose()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.runqemu_exited =
=3D True<br>
<br>
I like the idea of this but it is showing warnings on the autobuilder:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/61/build=
s/3877" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/61/builds/3877</a><br>
<br>
So we may need to fix the issue it is exposing?<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div>

--0000000000009d559b05ca74109d--
