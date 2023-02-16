Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40345C61DA4
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 11:08:49 +0000 (UTC)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
 by mx.groups.io with SMTP id smtpd.web10.7440.1676545719991022059
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Feb 2023 03:08:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=apWdW+zE;
 spf=pass (domain: gmail.com, ip: 209.85.217.48, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f48.google.com with SMTP id p14so1582645vsn.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 03:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2XBcW8ODZrjMV9DkL+my5TRkRcqJHCkbgPDVPG39kVg=;
        b=apWdW+zEC6t/rlSNWb0QjXcghRZukyAMofVfxxXjnp9Qp1ZOwkACge0LWRZNgxKzCP
         bOJuOc28r9p4MUMNXT0Umjkd4c2jYPQPPDw0zOuLmXQ0Fs5IUTsBCXaO2lfOTrlVfLUD
         4d7GdDTzzabhjhIYHuZm5Mgps6ztamT3n2FAStfq410gLT1tMRHa+his7iRIdKoTJZyh
         HkY3I+pI+vL+Y2SE2Jiqc5rzZGjMZdsPHCT9+WIr5AbVmVUqr4j1C2KnuXDQYHKeESeQ
         75EYjpC/BstQfG8llVbApWsZRI4oQgKc1TBhA0ngo4zx8XJF8MtCY/Zasb8FS2FhNWl8
         7roQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2XBcW8ODZrjMV9DkL+my5TRkRcqJHCkbgPDVPG39kVg=;
        b=hCIj4qzWW8gDDcAWqoh66jfb9kxMWnTwH/VCS+ZLU+LQHiqnmFUWPEqlQ2korH8hLO
         W69EwUatlEUfagKrBtExqUw7tAacfdm3nT36zXHK37HHEqzG2TvxCre4W/nIFTQqE2CX
         BBsnMErT6alQ5AigwZlnruQKUhfFkn0/PJrNMXP23qjdXgx8NEH4vmH1d55fhq7ZL34m
         mCU1sSZfl01aNlfsUZNpdpMgfUSZNi6Zzmr3l9XAtF2KIZWoOySr+BP9k9xT1ke4Qzc8
         /xoEprSVBzQJBS5I/dxCni9nQvAigdPQErYzbV98PQaYS/jg6m02KUY1G1lsSc4FSvm9
         J1IQ==
X-Gm-Message-State: AO0yUKVp6qjFKVFZA513VSk+gSahLe43axT6va5pCDEMIPSRWTXgLnnr
	V8AKa2b42L9D9V7UFOu7JNedql9tj7svXZiVYzk=
X-Google-Smtp-Source: AK7set/0YWbbUu1J8eayjNt0ipktk80YOJxvAz9wh1UF2a/DvigeQ6cSLYni8V3FOYrkZD2fMtTdsqIT0wsfjcXKiUc=
X-Received: by 2002:a05:6102:11f7:b0:3f0:be66:8037 with SMTP id
 e23-20020a05610211f700b003f0be668037mr1016698vsg.80.1676545719006; Thu, 16
 Feb 2023 03:08:39 -0800 (PST)
MIME-Version: 1.0
References: <20230215130057.1923450-1-jose.quaresma@foundries.io>
 <CAP9ODKrs24T2V1Ks8yeWbT+_6FLWdc4wy8iybKQpjxPhOhctAw@mail.gmail.com>
 <CANPvuRm+Df-HVCi-KDOUPzKeUJz9VvznSKLVu1vWCK9Fx+YOoA@mail.gmail.com> <jwqv8k26mv2.fsf@axis.com>
In-Reply-To: <jwqv8k26mv2.fsf@axis.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 16 Feb 2023 11:08:28 +0000
Message-ID: <CANPvuRmKaCc36+7ra0is3RUk_nKJEpwKWD0BzWWxX3e0iGb0-w@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/2] kernel-module-split: make autoload and
 probeconf distribution specific
To: Ola x Nilsson <ola.x.nilsson@axis.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>, 
	Jose Quaresma <jose.quaresma@foundries.io>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000007fbe705f4cf383e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 11:08:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177283

--00000000000007fbe705f4cf383e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ola x Nilsson <ola.x.nilsson@axis.com> escreveu no dia quinta, 16/02/2023
=C3=A0(s) 08:22:

>
> On Wed, Feb 15 2023, Jose Quaresma wrote:
>
> > Hi Octavio,
> >
> > Otavio Salvador <otavio.salvador@ossystems.com.br<mailto:
> otavio.salvador@ossystems.com.br>> escreveu no dia quarta, 15/02/2023
> =C3=A0(s) 13:25:
> > Em qua., 15 de fev. de 2023 =C3=A0s 10:01, Jose Quaresma
> > <quaresma.jose@gmail.com<mailto:quaresma.jose@gmail.com>> escreveu:
> >>
> >> The modules-load.d [1] - Configure kernel modules to load at boot
> >> should install their configuration files in /usr/lib/modules-load.d.
> >>
> >> The modprobe.d [2] - Configuration directory for modprobe
> >> should install their configuration files in /lib/modprobe.d
> >>
> >> [1]
> https://www.freedesktop.org/software/systemd/man/modules-load.d.html
> >> [2] https://www.man7.org/linux/man-pages//man5/modprobe.d.5.html
> >>
> >> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io<mailto:
> jose.quaresma@foundries.io>>
> >
> >
> > Did you validate this using busybox only? Using sysv and busybox need
> > to be validated as well.
> >
> > Please drop this patch series because it doesn work with busybox.
> >
> > Looks like busybox don't support other path than /etc:
> >
> https://git.busybox.net/busybox/tree/modutils/modprobe.c?id=3D669c40ed8eb=
f480c95ce36135104e474e361a7e6#n658
> >
> > So I need to implement this in another way, maybe relocating the files
> from /etc only when systemd is enabled.
> >
> > Thanks for raising the issue.
> >
> > Jose
> >
>
> Hi,
>
> Please consider https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D12212
> as well.
>
> --
> Ola x Nilsson
>

Hi Ola,

We use usermerge too but I think the weird issue here is we need to have
this distribution specified only for systemd
excluding busybox and sysint as pointed out by Octavio.
The other solution is adding support on busybox and sysint if needed.

My idea is add a prefix variable with path "/etc" by default but
conditioned by systemd DISTRO_FEATURES

Thanks for the bug hint.

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000007fbe705f4cf383e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">Ola x Nilsson &lt;<a href=3D"mailto:ola.x.nilsson@axi=
s.com">ola.x.nilsson@axis.com</a>&gt; escreveu no dia quinta, 16/02/2023 =
=C3=A0(s) 08:22:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><br>
On Wed, Feb 15 2023, Jose Quaresma wrote:<br>
<br>
&gt; Hi Octavio,<br>
&gt;<br>
&gt; Otavio Salvador &lt;<a href=3D"mailto:otavio.salvador@ossystems.com.br=
" target=3D"_blank">otavio.salvador@ossystems.com.br</a>&lt;mailto:<a href=
=3D"mailto:otavio.salvador@ossystems.com.br" target=3D"_blank">otavio.salva=
dor@ossystems.com.br</a>&gt;&gt; escreveu no dia quarta, 15/02/2023 =C3=A0(=
s) 13:25:<br>
&gt; Em qua., 15 de fev. de 2023 =C3=A0s 10:01, Jose Quaresma<br>
&gt; &lt;<a href=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quare=
sma.jose@gmail.com</a>&lt;mailto:<a href=3D"mailto:quaresma.jose@gmail.com"=
 target=3D"_blank">quaresma.jose@gmail.com</a>&gt;&gt; escreveu:<br>
&gt;&gt;<br>
&gt;&gt; The modules-load.d [1] - Configure kernel modules to load at boot<=
br>
&gt;&gt; should install their configuration files in /usr/lib/modules-load.=
d.<br>
&gt;&gt;<br>
&gt;&gt; The modprobe.d [2] - Configuration directory for modprobe<br>
&gt;&gt; should install their configuration files in /lib/modprobe.d<br>
&gt;&gt;<br>
&gt;&gt; [1] <a href=3D"https://www.freedesktop.org/software/systemd/man/mo=
dules-load.d.html" rel=3D"noreferrer" target=3D"_blank">https://www.freedes=
ktop.org/software/systemd/man/modules-load.d.html</a><br>
&gt;&gt; [2] <a href=3D"https://www.man7.org/linux/man-pages//man5/modprobe=
.d.5.html" rel=3D"noreferrer" target=3D"_blank">https://www.man7.org/linux/=
man-pages//man5/modprobe.d.5.html</a><br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@f=
oundries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&lt;mailto:<a =
href=3D"mailto:jose.quaresma@foundries.io" target=3D"_blank">jose.quaresma@=
foundries.io</a>&gt;&gt;<br>
&gt;<br>
&gt;<br>
&gt; Did you validate this using busybox only? Using sysv and busybox need<=
br>
&gt; to be validated as well.<br>
&gt;<br>
&gt; Please drop this patch series because it doesn work with busybox.<br>
&gt;<br>
&gt; Looks like busybox don&#39;t support other path than /etc:<br>
&gt; <a href=3D"https://git.busybox.net/busybox/tree/modutils/modprobe.c?id=
=3D669c40ed8ebf480c95ce36135104e474e361a7e6#n658" rel=3D"noreferrer" target=
=3D"_blank">https://git.busybox.net/busybox/tree/modutils/modprobe.c?id=3D6=
69c40ed8ebf480c95ce36135104e474e361a7e6#n658</a><br>
&gt;<br>
&gt; So I need to implement this in another way, maybe relocating the files=
 from /etc only when systemd is enabled.<br>
&gt;<br>
&gt; Thanks for raising the issue.<br>
&gt;<br>
&gt; Jose<br>
&gt;<br>
<br>
Hi,<br>
<br>
Please consider <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?i=
d=3D12212" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproje=
ct.org/show_bug.cgi?id=3D12212</a><br>
as well.<br>
<br>
-- <br>
Ola x Nilsson<br>
</blockquote></div><br clear=3D"all"><div>Hi Ola,<br><br>We use usermerge t=
oo but I think the weird issue here is we need to have this distribution=C2=
=A0specified only for systemd</div><div>excluding busybox and sysint as poi=
nted out by Octavio.</div><div>The other solution is adding support on busy=
box and sysint if needed.<br><br>My idea is add a prefix variable with path=
 &quot;/etc&quot; by default but conditioned=C2=A0by systemd=C2=A0DISTRO_FE=
ATURES<br><br>Thanks for the bug hint.<br><br class=3D"gmail-Apple-intercha=
nge-newline"></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div d=
ir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></div>

--00000000000007fbe705f4cf383e--

