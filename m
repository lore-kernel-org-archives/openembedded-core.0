Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web12.1075.1608317227214313543
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Dec 2020 10:47:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=T13AvDJw;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id z11so2931750qkj.7
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Dec 2020 10:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1Lqxs0tqZD7gbQstUYlmVqiD/z/7lLGICRPcZVWnuAM=;
        b=T13AvDJwM9Oy33FRPqs3kgBWtGaa7OvDcmRDls1yHkrI8lgA2r5E6Tlc2gv8zf+M2e
         6+elUCG99tedWr2tNhoUeqd5W67mlSYAlgedqCMXG563JpmaxgZV/86AQV74/Vw/+Pmc
         JQKe/kk1IFx4pOAGA2MHDyMvjqDpoP5eO9lAYn4Oq92pLq2URSc+ZihhnyfRYWuZe6gq
         MasyEaNDvIWHCD08+QONAwwgtPF1Fnj6cnNWqFeo/z210OznYGy07iELKpeSZYP7aMyw
         eW2VTbZWbcjCPAdJVmWVdgWzuw3gqjggxoLNHkkpEpVO7UhNlqKvB6vjzXB1BTOGCFqP
         4dMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1Lqxs0tqZD7gbQstUYlmVqiD/z/7lLGICRPcZVWnuAM=;
        b=CY67osOZJcuTuKdbrQ2pAYp/K/0P4yDj41ZGZ9IqJvbHgl+2VG1v7cNYGAtSR3t9Vb
         IR66T7nHu0T8p7lzMYjo8LwJR4WV+/d54pK3NlteQisEKrHu68CO9BLkjFdAJq/w5d1R
         YuV70peEjFLPSdAgfAe+fUTkSL/441sShCWHzxq6BOOI75pA/hSkG2owq8D5Zdua46Bj
         baGRp0ZD2J7LiptKH5U04v7RY4OSXltJDIP+k/pGTStKmRUu3YCYzqJJviWTFkiTdZV8
         /9qLuRGCDjixfhlcpq6LZ3eWQNUDHGQD+V+aqu2BzYtxmFatM3rSsTQSscY2xNqP6+DP
         VbhQ==
X-Gm-Message-State: AOAM530bP0/v5287t4gGDkS2Z+T3XH1goYMLsVBndxMguhcomtSplfv4
	o6KlVDpaTNAG4oiImGuAEC0YPPhXREwmQ9nKNRU=
X-Google-Smtp-Source: ABdhPJxuntarWQa+isuDwtXN4pU18IoUH7VwCjXpGTjn7daqa9wLp3U3EswZA/La93DAc7lsw7NqGYtYl6CmTX169ro=
X-Received: by 2002:a37:b182:: with SMTP id a124mr6287812qkf.9.1608317226341;
 Fri, 18 Dec 2020 10:47:06 -0800 (PST)
MIME-Version: 1.0
References: <20201217225440.2633474-1-raj.khem@gmail.com> <20201217225440.2633474-4-raj.khem@gmail.com>
 <f888a821-9dd9-fd5c-5372-2e7e777adcb7@kernel.org>
In-Reply-To: <f888a821-9dd9-fd5c-5372-2e7e777adcb7@kernel.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 18 Dec 2020 10:46:55 -0800
Message-ID: <CAMKF1sqyB+ow5uNd5LDLZt=rNZc_PqdkCkYASHxZyPkHJ0qZgw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/4] initscripts: Use initctl on sysvinit only
To: Sinan Kaya <okaya@kernel.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f65caa05b6c188a5"

--000000000000f65caa05b6c188a5
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 18, 2020 at 10:29 AM Sinan Kaya <okaya@kernel.org> wrote:

> On 12/17/2020 5:54 PM, Khem Raj wrote:
> > +if [ ! -p "$INITCTL" ] && [ "$(readlink -- "/sbin/init")" =
> "/sbin/init.sysvinit" ]; then
>
> Can this be done at build time for targets using sysvinit only?
>

Yes however It will be lot more obscure
Hard to read and harder to maintain

>
> > +    # Create new control channel
> > +             rm -f "$INITCTL"
> > +             mknod -m 600 "$INITCTL" p
> > +
> > +             # Reopen control channel.
> > +             PID="$(pidof -s /sbin/init || echo 1)"
> > +             [ -n "$PID" ] && kill -s USR1 "$PID"
> >  fi
> > -kill -USR1 1
>
>

--000000000000f65caa05b6c188a5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Dec 18, 2020 at 10:29 AM Sinan Kaya &lt;<a href=3D"=
mailto:okaya@kernel.org">okaya@kernel.org</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">On 12/17/2020 5:54 PM, Khem Raj wrote:<br>
&gt; +if [ ! -p &quot;$INITCTL&quot; ] &amp;&amp; [ &quot;$(readlink -- &qu=
ot;/sbin/init&quot;)&quot; =3D &quot;/sbin/init.sysvinit&quot; ]; then<br>
<br>
Can this be done at build time for targets using sysvinit only?<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Yes however It w=
ill be lot more obscure=C2=A0</div><div dir=3D"auto">Hard to read and harde=
r to maintain=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
&gt; +=C2=A0 =C2=A0 # Create new control channel<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f &quot;$INITCTL&=
quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mknod -m 600 &quot;$I=
NITCTL&quot; p<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Reopen control chan=
nel.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PID=3D&quot;$(pidof -=
s /sbin/init || echo 1)&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[ -n &quot;$PID&quot;=
 ] &amp;&amp; kill -s USR1 &quot;$PID&quot;<br>
&gt;=C2=A0 fi<br>
&gt; -kill -USR1 1<br>
<br>
</blockquote></div></div>

--000000000000f65caa05b6c188a5--
