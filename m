Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3F8EEB64D7
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 08:51:33 +0000 (UTC)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
 by mx.groups.io with SMTP id smtpd.web10.37882.1687510291185733671
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jun 2023 01:51:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ae8HyAHq;
 spf=pass (domain: gmail.com, ip: 209.85.222.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-78f1dd09289so110519241.2
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 01:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687510290; x=1690102290;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=54Hil7FM6KnRjBLpp8YT3N4J3Z3NBakWBO0ksJmH6Dc=;
        b=ae8HyAHq/qNM4KrckCvdIyp2llfqcpA1JEQASrBmtUbm6tqb1maJzIR6UhKdPoi4Od
         QjIoYrLYUC2F1JGcgLyfF5YBx1oi+uGc8CpL+G26ZiU8Ev548JJSWFrD19dMEo7Mw8JB
         9vQyEhhlQFqHIt6seI+a//3EGZ1jcSuCTotHLwCmTF0VqOUiURZEc7sSSrrF9LTSKbao
         2sQbYGHOsyaMd+G1+tIvWNJj2MV8dS+cG01VkyqeIs0kW0cJzqu7Ea1KK5vVXEVmq7Pq
         0/J0NhCJz1UL7P/b0ng6JuZX3LH5jsVd5BHaRYOaVY/pl2jAwdDoYZwtxvNxeO3g1jOw
         hnmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687510290; x=1690102290;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=54Hil7FM6KnRjBLpp8YT3N4J3Z3NBakWBO0ksJmH6Dc=;
        b=YWSRQ1DaaM6B1+OWcxYxCRi1yjWSlErblCJjYOu+4t2fzlmJcNoYFBtaKaqkM/S2DC
         pkmnGivatXSxZ55osNjJMV3sDyQE2zvSKjP99O4vd1SmqRsOHkEThC4tXPppwMDhLJzj
         7s8G1VbwpKqr92805CndKxqYMZ1LdA8UQsIxHR4ohzIPmofyQt6vjlmSvSAiur5rKy25
         o/qpY/Qc6jReXb2BX+yvnpvBh1grKfQJ3jPfQL/6K/+/rjy/OEq4HlxgN8nq5QZ3keX5
         Wrp/0WEes6y/yK8q8sjPMMfLVWQi6gObIdkvg4jb7EVkX8te4g1NxHvk2te0G7gU7424
         kImA==
X-Gm-Message-State: AC+VfDyWKxynCTtq8sw5nFz5AAkCKnXtLSQGqVcqkbwyNowhKHrGZA7R
	Uvq2kWTEgFBAYeK5LvlLW5ay+6etHZOfS7EfbQk=
X-Google-Smtp-Source: ACHHUZ6pa7CFcKWYgDspOSNVn+ZD16Zu4hUB/vL8zZtozdT4mQeNtv5lyQW54XnGw/mr8+sCsd2ieKA362qHiMW5cNA=
X-Received: by 2002:a05:6102:3176:b0:440:c366:3378 with SMTP id
 l22-20020a056102317600b00440c3663378mr6203092vsm.17.1687510289963; Fri, 23
 Jun 2023 01:51:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230622084452.2026849-1-jose.quaresma@foundries.io> <20230622183625.1d1dc9e6@booty>
In-Reply-To: <20230622183625.1d1dc9e6@booty>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 23 Jun 2023 09:51:19 +0100
Message-ID: <CANPvuRnm2j0zDavOPLx2uBbGmHgcY7ie8tDGs-iD1o2QQRWcfw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V4 1/3] kernel-module-split: make autoload and
 probeconf distribution specific
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>, Ola x Nilsson <Ola.x.Nilsson@axis.com>, 
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Content-Type: multipart/alternative; boundary="0000000000006361f205fec81bf4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 08:51:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183311

--0000000000006361f205fec81bf4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Luca,

Luca Ceresoli <luca.ceresoli@bootlin.com> escreveu no dia quinta,
22/06/2023 =C3=A0(s) 17:36:

> Hi Jose,
>
> On Thu, 22 Jun 2023 08:44:51 +0000
> "Jose Quaresma" <quaresma.jose@gmail.com> wrote:
>
> > Also take the oportunity to only add configuration files to FILES
> > and CONFFILES when they exist and are used.
> >
> > The modules-load.d [1] - Configure kernel modules to load at boot
> > should install their configuration files in /usr/lib/modules-load.d.
> >
> > The modprobe.d [2] - Configuration directory for modprobe
> > should install their configuration files in /lib/modprobe.d
> >
> > [1] https://www.freedesktop.org/software/systemd/man/modules-load.d.htm=
l
> > [2] https://www.man7.org/linux/man-pages//man5/modprobe.d.5.html
> >
> > [YOCTO #12212] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1221=
2
> >
> > CC: Ola x Nilsson <Ola.x.Nilsson@axis.com>
> > CC: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
>
> This has now turned to:
>
> ERROR: linux-yocto-6.1.33+gitAUTOINC+db25e51e20_947f660bde-r0 do_package:
> QA Issue: linux-yocto: Files/directories were installed but not shipped i=
n
> any package:
>   /usr/lib
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/5410/st=
eps/14/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5383/st=
eps/15/logs/stdio


I have another patch where we only create the directories when needed (if
we have mod config files)
and with that we do not need to remove them at the end.
However this one changes the logic a bit, so I'd like to send this one
separately
but I can see that it won't work so I'll have to insert it on V5.

Once again thanks for testing.

Jose


>
> Luca
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000006361f205fec81bf4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Luca,</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Luca Ceresoli &lt;<a href=3D"mailto:luca.cere=
soli@bootlin.com">luca.ceresoli@bootlin.com</a>&gt; escreveu no dia quinta,=
 22/06/2023 =C3=A0(s) 17:36:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Hi Jose,<br>
<br>
On Thu, 22 Jun 2023 08:44:51 +0000<br>
&quot;Jose Quaresma&quot; &lt;<a href=3D"mailto:quaresma.jose@gmail.com" ta=
rget=3D"_blank">quaresma.jose@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Also take the oportunity to only add configuration files to FILES<br>
&gt; and CONFFILES when they exist and are used.<br>
&gt; <br>
&gt; The modules-load.d [1] - Configure kernel modules to load at boot<br>
&gt; should install their configuration files in /usr/lib/modules-load.d.<b=
r>
&gt; <br>
&gt; The modprobe.d [2] - Configuration directory for modprobe<br>
&gt; should install their configuration files in /lib/modprobe.d<br>
&gt; <br>
&gt; [1] <a href=3D"https://www.freedesktop.org/software/systemd/man/module=
s-load.d.html" rel=3D"noreferrer" target=3D"_blank">https://www.freedesktop=
.org/software/systemd/man/modules-load.d.html</a><br>
&gt; [2] <a href=3D"https://www.man7.org/linux/man-pages//man5/modprobe.d.5=
.html" rel=3D"noreferrer" target=3D"_blank">https://www.man7.org/linux/man-=
pages//man5/modprobe.d.5.html</a><br>
&gt; <br>
&gt; [YOCTO #12212] <a href=3D"https://bugzilla.yoctoproject.org/show_bug.c=
gi?id=3D12212" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctop=
roject.org/show_bug.cgi?id=3D12212</a><br>
&gt; <br>
&gt; CC: Ola x Nilsson &lt;<a href=3D"mailto:Ola.x.Nilsson@axis.com" target=
=3D"_blank">Ola.x.Nilsson@axis.com</a>&gt;<br>
&gt; CC: Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis.c=
om" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
<br>
This has now turned to:<br>
<br>
ERROR: linux-yocto-6.1.33+gitAUTOINC+db25e51e20_947f660bde-r0 do_package: Q=
A Issue: linux-yocto: Files/directories were installed but not shipped in a=
ny package:<br>
=C2=A0 /usr/lib<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/87/build=
s/5410/steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/87/builds/5410/steps/14/logs/=
stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/79/build=
s/5383/steps/15/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5383/steps/15/logs/=
stdio</a></blockquote><div><br><span style=3D"color:rgb(0,0,0)">I have anot=
her patch where we only create the directories=C2=A0</span><span style=3D"c=
olor:rgb(0,0,0)">when needed (if we have mod config files)</span></div><div=
><span style=3D"color:rgb(0,0,0)">and with that=C2=A0we do not need to remo=
ve them at the end.</span></div><div>However this one changes the logic a b=
it, so I&#39;d like to send this one separately</div><div>but I can see tha=
t it won&#39;t work so I&#39;ll have to insert it on V5.</div><div><br>Once=
 again thanks for testing.<br>=C2=A0<br>Jose</div><div><br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><br>
<br>
Luca<br>
<br>
-- <br>
Luca Ceresoli, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--0000000000006361f205fec81bf4--

