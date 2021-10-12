Return-Path: <fede@evolware.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F1CEC433EF
	for <webhook@archiver.kernel.org>; Tue, 12 Oct 2021 03:00:12 +0000 (UTC)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
 [209.85.222.50])
 by mx.groups.io with SMTP id smtpd.web11.8506.1634007610928291667
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 20:00:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: gmail.com, ip: 209.85.222.50, mailfrom: fede.evol@gmail.com)
Received: by mail-ua1-f50.google.com with SMTP id i22so301926ual.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 20:00:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OmL527CmddVCFsrP5vd0luflnfZSNzGz/MgUr5dYWo4=;
        b=Do94j3pd9n9fC/PrdPcZNr4SLrilWFOkb2R2DISj2YNJPPJ1P4RV8Uq9X+Tl83oVWs
         E4ufHbZ2snN3v4qAG+LTfoSx+fAzT04rXVV7Lw3w+74XRCUOM6LaFpSANbGH6h/isw8X
         DP9o2C1pgV+O4iCfcTbTFWjoeQQYVpll8ovoL8c/fjBwJdUrqfKkN5+Ykq6kO/lAxZ5S
         lcS46sNkHtc1qtHWYF2ublA+/bgBQhiEqj4KWIpXNjzDmzE5/Z0nloclohe0kQAasduy
         nY3Pxrh+kzpcqSeYSg7oOv8w3+fW5DcSFFyYYc5cPowD4co9EY8UWPFqCeAOqQJZeauU
         ErSw==
X-Gm-Message-State: AOAM532JcrmwU92glHpBS6Zg1ZEtxvmpAwJ7siMyC9pBWfxlm5U5S9MM
	FXleZTdxldJniKHLtxH9kerxf3Co3VEDnyCyhMg=
X-Google-Smtp-Source: 
 ABdhPJyD2N7qsPfsd7TbqoOam0ZnvvTvdWy6yLLsReNqaIWmxLB8zsU2TsnKfsMEDqcHu0d+u/h1/05tLwg0castfj4=
X-Received: by 2002:ab0:36b8:: with SMTP id
 v24mr11977032uat.112.1634007609857;
 Mon, 11 Oct 2021 20:00:09 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAA=hcWSfqgxOX8UjwW35tD4VMC8c0SHWVo=_=z38NH7+rq6dAg@mail.gmail.com>
 <CAM6O0Zg3qNqZbtkKjTXQdSwD9LAjrKOaumshWk9Swvb7OMT8VA@mail.gmail.com>
 <CAA=hcWQvwDbg0106agTerDfq78yh2kvin1k4Xydi3Z6buEBK_g@mail.gmail.com>
In-Reply-To: 
 <CAA=hcWQvwDbg0106agTerDfq78yh2kvin1k4Xydi3Z6buEBK_g@mail.gmail.com>
From: Federico Pellegrin <fede@evolware.org>
Date: Tue, 12 Oct 2021 04:59:58 +0200
Message-ID: 
 <CAM6O0Zg3cq6=S933RNBo9Ffu_nEoX3==Y746LkxezMR6uSr-iw@mail.gmail.com>
Subject: Re: [OE-core] How to trigger Yocto Linux /etc/profile or shell
 scripts in /etc/profile.d without shell logging in?
To: Jupiter <jupiter.hce@gmail.com>
Cc: yocto <yocto@lists.yoctoproject.org>,
	OE <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002559a205ce1f0b02"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Oct 2021 03:00:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156859

--0000000000002559a205ce1f0b02
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jupiter,
To centralize, agreed that you are using systemd, one way I could see is
setting the variables in systemd-system.conf using the DefaultEnvironment
directive, see:
https://freedesktop.org/software/systemd/man/systemd-system.conf.html

This states:

----
DefaultEnvironment=3D=C2=B6
<https://freedesktop.org/software/systemd/man/systemd-system.conf.html#Defa=
ultEnvironment=3D>

Configures environment variables passed to all executed processes. Takes a
space-separated list of variable assignments. See environ(7)
<http://man7.org/linux/man-pages/man7/environ.7.html> for details about
environment variables.

Simple "%"-specifier expansion is supported, see below for a list of
supported specifiers.

Example:

DefaultEnvironment=3D"VAR1=3Dword1 word2" VAR2=3Dword3 "VAR3=3Dword 5 6"

Sets three variables "VAR1", "VAR2", "VAR3".
----

This should have you variables management in each. Otherwise as you mention
one can put in each script with either Environment to have them explicitly
enumerated or with EnvironmentFile to read from a file, which may also fit
your centralization hopes (but still require one line per startup script at
least) and could be further sourced by non-systemd components as well if
needed. (https://www.freedesktop.org/software/systemd/man/systemd.exec.html
under Environment section)

HTH,
Federico


Il giorno lun 11 ott 2021 alle ore 11:05 Jupiter <jupiter.hce@gmail.com> ha
scritto:

> Hi Federico,
>
> Thanks for your response.
>
> > /etc/profile and similar are interactive shell (/bash) concepts, not
> really
> > system startup ones. So indeed: just on a login (be it local, ssh and s=
o
> > on) they are executed.
>
> Understood, here is what I try to figure out. I use several systemd
> services to start my tasks, each task is not just a system process, I
> found it also has a system environment similar in user login from
> /etcprofile, /home/user/.profile, my question is where is a system
> environment file that each systemd service runs from?
>
> I also thought that /etc/profile.d files should be automatically
> invoked for each user login, but a systemd service does not run
> /etc/profile.d files.
>
> > If you want to execute something else without the need for logging it,
> you
> > should look elsewhere, depending on your system manager: if systemd you
> > should create a service and enable it, if sysvinit a init.d script.
>
> Understood, that was what I did originally, I have to run the setup
> system environment in each service ExecStart script, that is why I am
> looking for a global environment setup file to avoid duplication of
> putting my environment scripts in each ExecStart execution file.
>
> Thank you.
>
> Kind regards,
>
> - jupiter
>
> > HTH,
> > Federico
> >
> >
> > Il giorno lun 11 ott 2021 alle ore 06:30 JH <jupiter.hce@gmail.com> ha
> > scritto:
> >
> >> Hi,
> >>
> >> The Yocto uses /etc/profile for root login, but there is no root
> >> physical login in an embedded device so the /etc/profile is never
> >> called, I added a shell script to /etc/profile.d, it was not called
> >> either. Both /etc/profile and scripts in /etc/profile.d can only be
> >> invoked when I physically log into the debug console, that is
> >> impractical. Appreciate your advice, how do you resolve that kind of
> >> problem?
> >>
> >> Thank you.
> >>
> >> Kind regards,
> >>
> >> - jupiter
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#156808):
> >> https://lists.openembedded.org/g/openembedded-core/message/156808
> >> Mute This Topic: https://lists.openembedded.org/mt/86229953/5117409
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[
> >> fede@evolware.org]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
> >>
> >
>
>
> --
> "A man can fail many times, but he isn't a failure until he begins to
> blame somebody else."
> -- John Burroughs
>

--0000000000002559a205ce1f0b02
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><br></div><div>Hi Jupiter,</div><div=
>To centralize, agreed that you are using systemd, one way I could see is s=
etting the variables in systemd-system.conf using the DefaultEnvironment di=
rective, see: <a href=3D"https://freedesktop.org/software/systemd/man/syste=
md-system.conf.html">https://freedesktop.org/software/systemd/man/systemd-s=
ystem.conf.html</a> <br></div><div><br></div><div>This states:</div><div><b=
r></div><div>----<br></div><div><dt id=3D"gmail-DefaultEnvironment=3D"><spa=
n class=3D"gmail-term"><code class=3D"gmail-varname">DefaultEnvironment=3D<=
/code></span><a class=3D"gmail-headerlink" title=3D"Permalink to this term"=
 href=3D"https://freedesktop.org/software/systemd/man/systemd-system.conf.h=
tml#DefaultEnvironment=3D">=C2=B6</a></dt><dd><p>Configures environment var=
iables passed to all executed processes. Takes a
        space-separated list of variable assignments. See <a href=3D"http:/=
/man7.org/linux/man-pages/man7/environ.7.html"><span class=3D"gmail-citeref=
entry"><span class=3D"gmail-refentrytitle">environ</span>(7)</span></a> for
        details about environment variables.</p><p>Simple &quot;<code class=
=3D"gmail-literal">%</code>&quot;-specifier expansion is supported, see bel=
ow for a list of supported
        specifiers.</p><p>Example:

        </p><pre class=3D"gmail-programlisting">DefaultEnvironment=3D&quot;=
VAR1=3Dword1 word2&quot; VAR2=3Dword3 &quot;VAR3=3Dword 5 6&quot;</pre><p>

        Sets three variables
        &quot;<code class=3D"gmail-literal">VAR1</code>&quot;,
        &quot;<code class=3D"gmail-literal">VAR2</code>&quot;,
        &quot;<code class=3D"gmail-literal">VAR3</code>&quot;.</p></dd></di=
v></div><div>----</div><div><br></div><div>This should have you variables m=
anagement in each. Otherwise as you mention one can put in each script with=
 either Environment to have them explicitly enumerated or with EnvironmentF=
ile to read from a file, which may also fit your centralization hopes (but =
still require one line per startup script at least) and could be further so=
urced by non-systemd components as well if needed. (<a href=3D"https://www.=
freedesktop.org/software/systemd/man/systemd.exec.html">https://www.freedes=
ktop.org/software/systemd/man/systemd.exec.html</a> under Environment secti=
on)<br></div><div><br></div><div>HTH,</div><div>Federico</div><div><br></di=
v><div><br></div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">Il giorno lun 11 ott 2021 alle ore 11:05 Jupiter &lt;<a href=3D"mail=
to:jupiter.hce@gmail.com">jupiter.hce@gmail.com</a>&gt; ha scritto:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Federico,<br>
<br>
Thanks for your response.<br>
<br>
&gt; /etc/profile and similar are interactive shell (/bash) concepts, not r=
eally<br>
&gt; system startup ones. So indeed: just on a login (be it local, ssh and =
so<br>
&gt; on) they are executed.<br>
<br>
Understood, here is what I try to figure out. I use several systemd<br>
services to start my tasks, each task is not just a system process, I<br>
found it also has a system environment similar in user login from<br>
/etcprofile, /home/user/.profile, my question is where is a system<br>
environment file that each systemd service runs from?<br>
<br>
I also thought that /etc/profile.d files should be automatically<br>
invoked for each user login, but a systemd service does not run<br>
/etc/profile.d files.<br>
<br>
&gt; If you want to execute something else without the need for logging it,=
 you<br>
&gt; should look elsewhere, depending on your system manager: if systemd yo=
u<br>
&gt; should create a service and enable it, if sysvinit a init.d script.<br=
>
<br>
Understood, that was what I did originally, I have to run the setup<br>
system environment in each service ExecStart script, that is why I am<br>
looking for a global environment setup file to avoid duplication of<br>
putting my environment scripts in each ExecStart execution file.<br>
<br>
Thank you.<br>
<br>
Kind regards,<br>
<br>
- jupiter<br>
<br>
&gt; HTH,<br>
&gt; Federico<br>
&gt;<br>
&gt;<br>
&gt; Il giorno lun 11 ott 2021 alle ore 06:30 JH &lt;<a href=3D"mailto:jupi=
ter.hce@gmail.com" target=3D"_blank">jupiter.hce@gmail.com</a>&gt; ha<br>
&gt; scritto:<br>
&gt;<br>
&gt;&gt; Hi,<br>
&gt;&gt;<br>
&gt;&gt; The Yocto uses /etc/profile for root login, but there is no root<b=
r>
&gt;&gt; physical login in an embedded device so the /etc/profile is never<=
br>
&gt;&gt; called, I added a shell script to /etc/profile.d, it was not calle=
d<br>
&gt;&gt; either. Both /etc/profile and scripts in /etc/profile.d can only b=
e<br>
&gt;&gt; invoked when I physically log into the debug console, that is<br>
&gt;&gt; impractical. Appreciate your advice, how do you resolve that kind =
of<br>
&gt;&gt; problem?<br>
&gt;&gt;<br>
&gt;&gt; Thank you.<br>
&gt;&gt;<br>
&gt;&gt; Kind regards,<br>
&gt;&gt;<br>
&gt;&gt; - jupiter<br>
&gt;&gt;<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; View/Reply Online (#156808):<br>
&gt;&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-core/mess=
age/156808" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/message/156808</a><br>
&gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/8622=
9953/5117409" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedd=
ed.org/mt/86229953/5117409</a><br>
&gt;&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.ope=
nembedded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded=
.org</a><br>
&gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembed=
ded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/g/openembedded-core/unsub</a> [<br>
&gt;&gt; <a href=3D"mailto:fede@evolware.org" target=3D"_blank">fede@evolwa=
re.org</a>]<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;<br>
<br>
<br>
--<br>
&quot;A man can fail many times, but he isn&#39;t a failure until he begins=
 to<br>
blame somebody else.&quot;<br>
-- John Burroughs<br>
</blockquote></div></div>

--0000000000002559a205ce1f0b02--

