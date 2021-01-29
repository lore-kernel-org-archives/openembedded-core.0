Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
 by mx.groups.io with SMTP id smtpd.web11.8175.1611920936185983362
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jan 2021 03:48:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=akT1JLNB;
 spf=pass (domain: gmail.com, ip: 209.85.166.175, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-il1-f175.google.com with SMTP id d6so8255538ilo.6
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Jan 2021 03:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VGw8Eu7qpFzTfWsv7DkLQ7OvnY3ZsqptIht7BPdwTf8=;
        b=akT1JLNBX4mF2aXCqytasRw6C2JnTSX6sjChCaw2nY+Lt/IEXBvJK75ZQzW+7+XIyK
         mGD3V4JROmZHy89K/9DDaP7+a/GrDGbEfKIqoVP8VMcIKETFT+6XCvH+O+xyWqEDoaea
         xi4uO2yI242hdEkr74F1xF6B+TSWzLZPVxfRczjBQF0uWDpYHUHPNZm/0tfarP75HvqC
         T5SWca8B40b/V5goa8IEc6m4rZJOMt7WLaZU+wbX2zRBNrara5KGYCt1i0sntm6qhNPk
         OUL7E+hPthRXKKKSgxOqwTF8GTlAsqQTnzNNf4gCkFSOPQKo9ZBKrZIZRX6ZVSOlyZfl
         OUCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VGw8Eu7qpFzTfWsv7DkLQ7OvnY3ZsqptIht7BPdwTf8=;
        b=p/mBhcUmMkqbVajb8o13HbuW2tB2T9qqoRTeQpbBRddEsc57bfFejnLzatGlzi9Iul
         2kuE0lYAMzADO/exypiogclOXrboQ5ZxLt6IX7R56uc9DE84IZv4n35EWeuq6PuBzHUt
         4M4hL11fJfkJyK7+2d46omY7sWy2pe/TkA4N0LGw9nJetbp2T3vsSZ42qPztD6ApB5ay
         G97982yK6yHtUMnuodrH60BR5pXD8t4p1a29bPT0EBrc6Jx05P5G/TPQuHY4GRuXWqm6
         ol2ByTdVs0EQ6QPrti+1V12X/Hb3kS5OWIbLYjel7RJwQSDTpvGb759k9dRcI+M6wNMA
         spyA==
X-Gm-Message-State: AOAM531Feg4nHZb9rJyjK6tk2DTSdMCz10yixnLTjswov8nJL410cK0C
	MkTB6dDiYBUWfD4Bg46gR3laVJ1hdpcvozwZaiWILnTUQc3xgw==
X-Google-Smtp-Source: ABdhPJyPDOl2KJmI4LD+iX7SBTrZUft2yT9w9FjQiHEh4c1PEb3kpzjT/kQvskCYjikT7BOm8N42dPH12JRhUYkTz7k=
X-Received: by 2002:a05:6e02:1032:: with SMTP id o18mr2791910ilj.13.1611920935551;
 Fri, 29 Jan 2021 03:48:55 -0800 (PST)
MIME-Version: 1.0
References: <20210129113808.16982-1-tomasz.dziendzielski@gmail.com> <20210129114144.lvip5kzzoo2slhqr@qschulz>
In-Reply-To: <20210129114144.lvip5kzzoo2slhqr@qschulz>
From: "Tomasz Dziendzielski" <tomasz.dziendzielski@gmail.com>
Date: Fri, 29 Jan 2021 12:50:11 +0100
Message-ID: <CAJkqNs0OcLM8Hau7TuZsN8YAnLv_Y5p8F+EZjScQGfN422r8Sg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] lib/oe/patch.py: Don't return command stderr from runcmd function
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c508c605ba089669"

--000000000000c508c605ba089669
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

As far as I understand subprocess.getstatusoutput is actually doing the
same and also we're using "sh -c" in that command anyway. There is one case
where "PATCHFILE=3D"%s" is passed at the beginning of "cmd" variable so we
would need to modify this file to stop doing that and pass it through env
argument.

Best regards,
Tomasz Dziendzielski

pt., 29 sty 2021 o 12:41 Quentin Schulz <quentin.schulz@streamunlimited.com=
>
napisa=C5=82(a):

> Hi Tomasz,
>
> On Fri, Jan 29, 2021 at 12:38:08PM +0100, Tomasz Dziendzielski wrote:
> > If a function returns any stderr it will be passed to extractPatches an=
d
> > used as path to patch.
> >
> > For example subprocess command output can be:
> > | sh: warning: setlocale: LC_ALL: cannot change locale (en_US.UTF-8)
> > | /tmp/oepatchhuqle8fj/0001-foo.patch
> > | /tmp/oepatchhuqle8fj/0002-bar.patch
> >
> > that will result in:
> > | FileNotFoundError: [Errno 2] No such file or directory: 'sh:'
> >
> > To fix this I separated output, made the function return stdout and
> > print stderr only in case of command error.
> >
> > Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
> > ---
> >  meta/lib/oe/patch.py | 14 +++++++++-----
> >  1 file changed, 9 insertions(+), 5 deletions(-)
> >
> > diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
> > index 40755fbb03..8ad70f53f1 100644
> > --- a/meta/lib/oe/patch.py
> > +++ b/meta/lib/oe/patch.py
> > @@ -38,15 +38,19 @@ def runcmd(args, dir =3D None):
> >          args =3D [ pipes.quote(str(arg)) for arg in args ]
> >          cmd =3D " ".join(args)
> >          # print("cmd: %s" % cmd)
> > -        (exitstatus, output) =3D subprocess.getstatusoutput(cmd)
> > +        proc =3D subprocess.Popen(cmd, stdout=3Dsubprocess.PIPE,
> stderr=3Dsubprocess.PIPE, shell=3DTrue)
>
> I'd rather avoid having shell=3DTrue passed to Popen, read
> https://docs.python.org/3/library/subprocess.html#security-considerations
>
> Can't we just use args directly instead of cmd in Popen to avoid using
> shell=3DTrue?
>
> Cheers,
> Quentin
>

--000000000000c508c605ba089669
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>As far as I understand subprocess.getstatusoutput is =
actually doing the same and also we&#39;re using &quot;sh -c&quot; in that =
command anyway. There is one case where &quot;PATCHFILE=3D&quot;%s&quot; is=
 passed at the beginning of &quot;cmd&quot; variable so we would need to mo=
dify this file to stop doing that and pass it through env argument.</div><d=
iv><br></div><div>Best regards,</div><div>Tomasz Dziendzielski<br></div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">pt.=
, 29 sty 2021 o 12:41=C2=A0Quentin Schulz &lt;<a href=3D"mailto:quentin.sch=
ulz@streamunlimited.com">quentin.schulz@streamunlimited.com</a>&gt; napisa=
=C5=82(a):<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi To=
masz,<br>
<br>
On Fri, Jan 29, 2021 at 12:38:08PM +0100, Tomasz Dziendzielski wrote:<br>
&gt; If a function returns any stderr it will be passed to extractPatches a=
nd<br>
&gt; used as path to patch.<br>
&gt; <br>
&gt; For example subprocess command output can be:<br>
&gt; | sh: warning: setlocale: LC_ALL: cannot change locale (en_US.UTF-8)<b=
r>
&gt; | /tmp/oepatchhuqle8fj/0001-foo.patch<br>
&gt; | /tmp/oepatchhuqle8fj/0002-bar.patch<br>
&gt; <br>
&gt; that will result in:<br>
&gt; | FileNotFoundError: [Errno 2] No such file or directory: &#39;sh:&#39=
;<br>
&gt; <br>
&gt; To fix this I separated output, made the function return stdout and<br=
>
&gt; print stderr only in case of command error.<br>
&gt; <br>
&gt; Signed-off-by: Tomasz Dziendzielski &lt;<a href=3D"mailto:tomasz.dzien=
dzielski@gmail.com" target=3D"_blank">tomasz.dziendzielski@gmail.com</a>&gt=
;<br>
&gt; ---<br>
&gt;=C2=A0 meta/lib/oe/patch.py | 14 +++++++++-----<br>
&gt;=C2=A0 1 file changed, 9 insertions(+), 5 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py<br>
&gt; index 40755fbb03..8ad70f53f1 100644<br>
&gt; --- a/meta/lib/oe/patch.py<br>
&gt; +++ b/meta/lib/oe/patch.py<br>
&gt; @@ -38,15 +38,19 @@ def runcmd(args, dir =3D None):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 args =3D [ pipes.quote(str(arg)) for=
 arg in args ]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &quot; &quot;.join(args)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # print(&quot;cmd: %s&quot; % cmd)<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 (exitstatus, output) =3D subprocess.getst=
atusoutput(cmd)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 proc =3D subprocess.Popen(cmd, stdout=3Ds=
ubprocess.PIPE, stderr=3Dsubprocess.PIPE, shell=3DTrue)<br>
<br>
I&#39;d rather avoid having shell=3DTrue passed to Popen, read<br>
<a href=3D"https://docs.python.org/3/library/subprocess.html#security-consi=
derations" rel=3D"noreferrer" target=3D"_blank">https://docs.python.org/3/l=
ibrary/subprocess.html#security-considerations</a><br>
<br>
Can&#39;t we just use args directly instead of cmd in Popen to avoid using<=
br>
shell=3DTrue?<br>
<br>
Cheers,<br>
Quentin<br>
</blockquote></div>

--000000000000c508c605ba089669--
