Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A910C83F22
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 13:30:26 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.22400.1752672623363201719
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 06:30:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C2k5v4Gq;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3122368d7cfso5366899a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 06:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752672623; x=1753277423; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ut5R86aLY+C9kAnTXog/OSNJhR1pWb6R4pr+ph+pCg0=;
        b=C2k5v4GqznfQHLSiX0qzccUWCLtw2gpQaIVMgunJUFO5VEZFpFOKib9odpeqD7Wwe7
         AXBOzh30Get5+j7mwJR/0xy1H59Px3FkN8VjrnVnZzyDEucpgu6m94YkMMO8QugRA5w4
         UgbLSyoD0KYXw1Ls4xPiozT1kJFMI7ZQJSStmMS0KixYaVLcvqN6NzCtyq+XTfbQFStA
         qPxOOOZIkwPrkUm8IkEfFqvcY+MHOP3SKpDvSGUZJmj5XrB5v2ckmpvh/pwNRXBySKqZ
         DE3stsbj6XdB3nxWTva4Neox0M3EJ0YPasZEFpKFE2cNh479bz2mu6KadasSpwTjUL9U
         tWJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752672623; x=1753277423;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ut5R86aLY+C9kAnTXog/OSNJhR1pWb6R4pr+ph+pCg0=;
        b=jvby7XliHBv8Sf/iXy9uQIIK6K72FYJYj6lduK6U9rNXaymekL01GnWQWbhSzJlik7
         DNuBDWagvx3BKT2D2+xumq276c4eiUL7Msxx/uJaJLOVgnFSfMiAWnpdsvsCUMgc2Kws
         qwgyZqyswSwK1uYQKkdChCVrAVrwQx8lpg+j2dJP6Pdplf77sULmeFiS3QtCNq6v6Qir
         Z6k1PltVwvg6GY4DZk745l47ITma8FFT40sGBzcb/nzkIgZsKQ96ov8cKrJJIATlJus6
         5nwP21bu9j4wJXf40bQuSt8wlkL4fuGbfdyHMV14fcqCeSUa2fL6kBd7oK/DvH/+6ZLT
         IVAg==
X-Forwarded-Encrypted: i=1; AJvYcCU4T5SsKrWyW3cKxzGl+vlBjLLNVVpx9UsoOjPJZCjwANqniuez/4jIHl3dnLbgXxA4d95NCIZZdPGj1mV0/uaE+g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzA5xYGnjB6OgXGFNq7v6yOTqG4IaMrqyOy8pZa6bTmiMjrmzxV
	sAPiWPqXw1pWoyq1XqNjQ9ol9BE7y7agn96xOZ4nfiIuDMp3veP31wZof9D6A3IsMf6S+UoKllr
	V6dRYSPO3paiOnjE94RmW9CxBuw2aODY=
X-Gm-Gg: ASbGncs/8krvdAdO2pylSVrqyf+1+2kao3gHDTSmai8WXrSToOiiiWzKEa9TTN87JND
	gapILRqrFO09SnBuZKAIar36x1AdosGJw2lYMhkvR/lLoF5moEY9+FZdb6bgngmV+2A//1+lKHe
	IDCEHChTricAn8RAewvSewvhnl3S69NfXI0rlNQV5o1ClA4Vt95frRtCXaMww6R/tiVcEwV/weA
	Ym8zsxQo6MQtzAGRLk=
X-Google-Smtp-Source: AGHT+IEKyhOfKYbOLqtsHGcYg9PcpNlCk5ZNptuNIXxUHQ0rlQLRyLdeWbA1kDfs357++hAIk44EvzvJxpJpv3uV294=
X-Received: by 2002:a17:90b:5385:b0:31a:ab75:6e45 with SMTP id
 98e67ed59e1d1-31c9e76c178mr4806832a91.28.1752672620741; Wed, 16 Jul 2025
 06:30:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250716090517.481832-1-kamel.bouhara@bootlin.com>
 <20250716090517.481832-2-kamel.bouhara@bootlin.com> <aHdwpmxe3-5x1P1e@nuoska> <20250716113437.GA491407@tpx1.home>
In-Reply-To: <20250716113437.GA491407@tpx1.home>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 16 Jul 2025 09:30:11 -0400
X-Gm-Features: Ac12FXwRR4h6kJpL7Uoti4amyvAqZwuYrGlP2PxfkUB9Dx0r0Ienxl3gC_ynm1E
Message-ID: <CADkTA4PYcTMOeYyRpDRt8wefnkQEcQkXqustRrS-gczfnig7MQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] spdx3: Add optional kernel configuration
 export to build_parameter for virtual/kernel
To: kamel.bouhara@bootlin.com
Cc: mikko.rapeli@linaro.org, openembedded-core@lists.openembedded.org, 
	JPEWhacker@gmail.com, thomas.petazzoni@bootlin.com, 
	mathieu.dubois-briand@bootlin.com, antonin.godard@bootlin.com
Content-Type: multipart/alternative; boundary="000000000000f7899f063a0be4cd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 13:30:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220454

--000000000000f7899f063a0be4cd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2025 at 7:34=E2=80=AFAM Kamel Bouhara via lists.openembedde=
d.org
<kamel.bouhara=3Dbootlin.com@lists.openembedded.org> wrote:

> On Wed, Jul 16, 2025 at 12:28:06PM +0300, Mikko Rapeli via
> lists.openembedded.org wrote:
> > Hi,
> >
>
> Hi Mikko,
>
> > On Wed, Jul 16, 2025 at 11:05:17AM +0200, Kamel Bouhara via
> lists.openembedded.org wrote:
> > > Enhances SPDX Document by extracting kernel build-time configuration
> settings from '${B}/.config'.
> > >
> > > Each CONFIG_* line is parsed and exported as a DictionaryEntry in the
> build_Build.build_parameter
> > > section of the SPDX document. This provides better visibility into
> kernel build behavior and
> > > configuration, in alignment with the SPDX3 metadata model.
> > >
> > > The feature is gated by a new tunable variable:
> > >
> > >     SPDX_INCLUDE_KERNEL_CONFIG (default: "1")
> > >
> > > Setting this to "0" disables exporting the kernel configuration, whic=
h
> may be useful to improve
> > > performance or reduce the size of generated SPDX documents.
> > >
> > > Example:
> > >
> > >     CONFIG_FOO=3Dy  =E2=86=92  { key: "CONFIG_FOO", value: "y" }
> > >
> > > This complements existing metadata export features and enables a more
> complete audit trail of how
> > > the kernel is built within a given build.
> >
> > Why is the kernel so special? All other SW components have build time
> configs too.
> >
> > For information harvesting, a lot of data can be extracted from the
> build system
> > but to me it's important that the build system and tools benefit the
> users
> > who actually do maintenance and development work. They need to be able
> to see
> > what patches get applied, what they fix, what configs are used etc.
> Extracting
> > all possible info into some IT management tooling which never directly
> feeds
> > back to the build system or developers to actually improve the CVE patc=
h
> status,
> > enable security features and updates and fixes for real bugs, is not
> very useful.
> >
>
> You're absolutely right to question the special handling of the kernel.
> In this case, the choice was intentional: the kernel=E2=80=99s .config is
> well-structured,
> easy to locate, and critical to the system's security and behavior.
> It's also a central component of the BSP, making it a strong candidate fo=
r
> initial
> integration when experimenting with build-time metadata capture in SPDX.
>
> That said, I fully agree, many other software components also have
> meaningful
> build-time configuration (e.g., PACKAGECONFIG, EXTRA_OECONF, cmake flags)=
,
> and the
> longer-term goal is to extend support to those as well.
>
> Starting with the kernel gives us a good foundation to validate the
> approach.
>
> Importantly, the patch makes this metadata inclusion optional and
> configurable.
> It introduces a variable to let users control the granularity of what get=
s
> included in the SPDX document. That means teams can choose to include or
> exclude
> details like kernel configuration based on their policy, use case, or
> audit needs.
>
> About usefulness to developers, I agree this info only brings value if it
> integrates back into yocto developers workflows. That=E2=80=99s exactly t=
he
> direction
> I=E2=80=99m aiming for, for example, we=E2=80=99ve added support in our S=
BOM diff tool to
> compare
> kernel configuration between builds by parsing CONFIG_* entries.
> This mostly lets teams audit config changes over time and detect if a
> some security-hardening option was unintentionally disabled.
>

I have the same concerns and opinion on this as Mikko

As long as this doesn't add overhead, or becomes mandatory, my objections
can
be ignored.

But generally speaking, I'm opposed to jamming everything into SPDX and
using
it as a tool for what you are describing above. There are already existing
tools that
are focused and better at comparing configurations of packages (and the
kernel).

Turning SPDX into some kind of one-stop-shop and everything-in-one place
tool
is something I'd object strongly to.  (I do realize you are talking about
using some
sort of other tool reading the SPDX data, but my objection is just the same
if it
becomes an absolutely massive monolithic data source).

Bruce



>
> > If some information is in the build system, then developers can read it
> from there
> > also when doing reviews and audits. For kernel, the -dev binary package
> has the
> > effective config after build has completed.
> >
>
> I believe, SPDX provides a more structured, standardized, and portable
> format that makes
> it easy to expose and reuse this data in CI pipelines, and when publishin=
g
> SBOMs
> externally. It becomes a central source that avoids custom parsing or
> packaging
> assumptions and integrates well with tooling for compliance, vulnerabilit=
y
> tracking
> and auditing.
>
> Thanks again for the feedback.
>
> --
> Kamel Bouhara, Bootlin
> Embedded Linux and kernel engineering
> https://bootlin.com
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220447):
> https://lists.openembedded.org/g/openembedded-core/message/220447
> Mute This Topic: https://lists.openembedded.org/mt/114181881/1050810
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

--000000000000f7899f063a0be4cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 16, 2025 at 7:34=
=E2=80=AFAM Kamel Bouhara via <a href=3D"http://lists.openembedded.org">lis=
ts.openembedded.org</a> &lt;kamel.bouhara=3D<a href=3D"mailto:bootlin.com@l=
ists.openembedded.org">bootlin.com@lists.openembedded.org</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Jul 16, 20=
25 at 12:28:06PM +0300, Mikko Rapeli via <a href=3D"http://lists.openembedd=
ed.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wro=
te:<br>
&gt; Hi,<br>
&gt;<br>
<br>
Hi Mikko,<br>
<br>
&gt; On Wed, Jul 16, 2025 at 11:05:17AM +0200, Kamel Bouhara via <a href=3D=
"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.=
openembedded.org</a> wrote:<br>
&gt; &gt; Enhances SPDX Document by extracting kernel build-time configurat=
ion settings from &#39;${B}/.config&#39;.<br>
&gt; &gt;<br>
&gt; &gt; Each CONFIG_* line is parsed and exported as a DictionaryEntry in=
 the build_Build.build_parameter<br>
&gt; &gt; section of the SPDX document. This provides better visibility int=
o kernel build behavior and<br>
&gt; &gt; configuration, in alignment with the SPDX3 metadata model.<br>
&gt; &gt;<br>
&gt; &gt; The feature is gated by a new tunable variable:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0SPDX_INCLUDE_KERNEL_CONFIG (default: &quot;1&q=
uot;)<br>
&gt; &gt;<br>
&gt; &gt; Setting this to &quot;0&quot; disables exporting the kernel confi=
guration, which may be useful to improve<br>
&gt; &gt; performance or reduce the size of generated SPDX documents.<br>
&gt; &gt;<br>
&gt; &gt; Example:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0CONFIG_FOO=3Dy=C2=A0 =E2=86=92=C2=A0 { key: &q=
uot;CONFIG_FOO&quot;, value: &quot;y&quot; }<br>
&gt; &gt;<br>
&gt; &gt; This complements existing metadata export features and enables a =
more complete audit trail of how<br>
&gt; &gt; the kernel is built within a given build.<br>
&gt;<br>
&gt; Why is the kernel so special? All other SW components have build time =
configs too.<br>
&gt;<br>
&gt; For information harvesting, a lot of data can be extracted from the bu=
ild system<br>
&gt; but to me it&#39;s important that the build system and tools benefit t=
he users<br>
&gt; who actually do maintenance and development work. They need to be able=
 to see<br>
&gt; what patches get applied, what they fix, what configs are used etc. Ex=
tracting<br>
&gt; all possible info into some IT management tooling which never directly=
 feeds<br>
&gt; back to the build system or developers to actually improve the CVE pat=
ch status,<br>
&gt; enable security features and updates and fixes for real bugs, is not v=
ery useful.<br>
&gt;<br>
<br>
You&#39;re absolutely right to question the special handling of the kernel.=
<br>
In this case, the choice was intentional: the kernel=E2=80=99s .config is w=
ell-structured,<br>
easy to locate, and critical to the system&#39;s security and behavior.<br>
It&#39;s also a central component of the BSP, making it a strong candidate =
for initial<br>
integration when experimenting with build-time metadata capture in SPDX.<br=
>
<br>
That said, I fully agree, many other software components also have meaningf=
ul<br>
build-time configuration (e.g., PACKAGECONFIG, EXTRA_OECONF, cmake flags), =
and the<br>
longer-term goal is to extend support to those as well.<br>
<br>
Starting with the kernel gives us a good foundation to validate the approac=
h.<br>
<br>
Importantly, the patch makes this metadata inclusion optional and configura=
ble.<br>
It introduces a variable to let users control the granularity of what gets<=
br>
included in the SPDX document. That means teams can choose to include or ex=
clude<br>
details like kernel configuration based on their policy, use case, or audit=
 needs.<br>
<br>
About usefulness to developers, I agree this info only brings value if it<b=
r>
integrates back into yocto developers workflows. That=E2=80=99s exactly the=
 direction<br>
I=E2=80=99m aiming for, for example, we=E2=80=99ve added support in our SBO=
M diff tool to compare<br>
kernel configuration between builds by parsing CONFIG_* entries.<br>
This mostly lets teams audit config changes over time and detect if a<br>
some security-hardening option was unintentionally disabled.<br></blockquot=
e><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small=
">I have the same concerns and opinion on this as Mikko</div><br></div><div=
><div class=3D"gmail_default" style=3D"font-size:small">As long as this doe=
sn&#39;t add overhead, or becomes mandatory, my objections can</div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">be ignored.</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">But generally speaking, I&#39;m opposed =
to jamming everything into SPDX and using</div><div class=3D"gmail_default"=
 style=3D"font-size:small">it as a tool for what you are describing above. =
There are already existing tools that</div><div class=3D"gmail_default" sty=
le=3D"font-size:small">are focused and better at comparing configurations o=
f packages (and the kernel).</div><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">Turning SPDX into some kind of one-stop-shop and everything-in-one plac=
e tool</div><div class=3D"gmail_default" style=3D"font-size:small">is somet=
hing I&#39;d object strongly to.=C2=A0 (I do realize you are talking about =
using some</div><div class=3D"gmail_default" style=3D"font-size:small">sort=
 of other tool reading the SPDX data, but my objection is just the same if =
it</div><div class=3D"gmail_default" style=3D"font-size:small">becomes an a=
bsolutely massive=C2=A0monolithic=C2=A0data source).</div><div class=3D"gma=
il_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default=
" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; If some information is in the build system, then developers can read i=
t from there<br>
&gt; also when doing reviews and audits. For kernel, the -dev binary packag=
e has the<br>
&gt; effective config after build has completed.<br>
&gt;<br>
<br>
I believe, SPDX provides a more structured, standardized, and portable form=
at that makes<br>
it easy to expose and reuse this data in CI pipelines, and when publishing =
SBOMs<br>
externally. It becomes a central source that avoids custom parsing or packa=
ging<br>
assumptions and integrates well with tooling for compliance, vulnerability =
tracking<br>
and auditing.<br>
<br>
Thanks again for the feedback.<br>
<br>
--<br>
Kamel Bouhara, Bootlin<br>
Embedded Linux and kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#220447): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/220447" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/220447</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/114181881/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/114181881/1050810</a><br>
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

--000000000000f7899f063a0be4cd--

