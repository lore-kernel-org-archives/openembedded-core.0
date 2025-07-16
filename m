Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE223C83F27
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 14:51:26 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.24349.1752677484375506634
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 07:51:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WyhaeQkR;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-31329098ae8so1635a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 07:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752677484; x=1753282284; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O6MmCi7jjHJtESvnDiYRmfKtrR3la3zq9erJZ56mlQA=;
        b=WyhaeQkRiIXBM12+9yqsYBAsJsoY/VfOXN7SL3Sd44apUCUnIYVq+NTd50Hw/396Kl
         FHFVpw9EVl3Ba+brPUE1r9vOeKD56+P3GDRLVgKEXBrVX5jWaE42tLDl0ySBoWFltjCG
         UoxCm3kj5HJPMRMeCeapOvqogjzJPMEOF2VXVu8dWaMaX9hzdukyNHoSt1vPA1Tv3jOa
         qVRpMzLBMWHYNDv23zU+k3Dn/nahnmNqwfFyXzA5xT+FF022kpRB+goBKg57/k4cdysE
         8sb4jw3BxKm/F8uG9OJgOD64fECHNanw821jd5cF340mksJ2yiQOOvMKLRd0DcjSzq7a
         Pm8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752677484; x=1753282284;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O6MmCi7jjHJtESvnDiYRmfKtrR3la3zq9erJZ56mlQA=;
        b=dYxdCQH3qgE3/VQOaJFi8A3sIRMEj22ZK5H8bA+U4Rol6mWxpY281MSr6I0QnisWJa
         oXNASdTmwK8PMFjuDlbrXpnQRjevp7OHwBgqddlzqRcEl/8NTEVGX/xHvIRfOMH0+2e0
         M0vq+yQogRGYfbMBZ9F7NK3JMRXVFmQ3nx+P8vV6iatUYqeGEtIQ1S5sBb/DFhp7w5kT
         DdcxZpQxm+rshtJAy5WKnaZv/K4A71C3iOQ+h3am0WL5PpQwWHyyirKulEnNypBx/I/H
         /q7B2xngwEOQNCU10WAbSk9ijdO+15vltSvcnvBCPq1BeBKzM+5irB3A2w0npaYvQTAv
         XmWw==
X-Forwarded-Encrypted: i=1; AJvYcCU0w3isDLIk23pee6bRIzYcdCUjPmGE9J1Y3sOQ1Hgqbe1Roa56ORacg/AcptmyJHqxYU/OMz79LVpNA4pGTVgnZg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzFceVkzYLQo/Ln0bpr2UrQnZyJIkRrEGwJNLrqCIScHzAdgmbo
	Gqjx0B8NF22q1KeKPFDkIcP6f3OQpGFs3jn6+TWXnqbhyeY38eRmj+o8WXPDQlq5DbbOMKRHI2j
	qP/257DgooHtwzx1QCUn47GoDtt7r2NQ=
X-Gm-Gg: ASbGncs39BvBwHhFwaMSABnBAw++b2VsYXiD5Zm5rwdUBff2LO3f4cSUSd9IriCGuTp
	bNvpecGoZHg8xPSV7pmWQrA5GebKmadbDMdIgZX+TEGIDNk7XF/rA21TIGgfjdDT/2KaWa2Pfkj
	vTFaslFu0BS+rGPlm0eZohgfX8A00jKZ0IAD7mxmq8Yjg0GwaM3KZSXHOkozNsgaYkjM578dyTD
	7NpVZmlvAEJY8qbTg==
X-Google-Smtp-Source: AGHT+IEI478vxSjqSUfFKGaxzaPgOTLfyb+zdIh4f+OWGOQ3MkvJjH3398nn+Z9dM3SG/KtC3zsmW4c+TmoDbEyfFTM=
X-Received: by 2002:a17:90a:c90f:b0:30a:9feb:1e15 with SMTP id
 98e67ed59e1d1-31c8f801bddmr10015297a91.8.1752677483419; Wed, 16 Jul 2025
 07:51:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250716090517.481832-1-kamel.bouhara@bootlin.com>
 <20250716090517.481832-2-kamel.bouhara@bootlin.com> <aHdwpmxe3-5x1P1e@nuoska>
 <20250716113437.GA491407@tpx1.home> <CADkTA4PYcTMOeYyRpDRt8wefnkQEcQkXqustRrS-gczfnig7MQ@mail.gmail.com>
 <20250716143024.GA504568@tpx1.home>
In-Reply-To: <20250716143024.GA504568@tpx1.home>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 16 Jul 2025 10:51:09 -0400
X-Gm-Features: Ac12FXw_u40u4gAP0SgedXzIVgmD4H9YHDpycHbTKEhpnicidm7pQUiJdD3ggMU
Message-ID: <CADkTA4PJP5KGKCGwZPkWAW8AkpM_fpPKBCCTmRCsBEncOH3DEw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] spdx3: Add optional kernel configuration
 export to build_parameter for virtual/kernel
To: Kamel Bouhara <kamel.bouhara@bootlin.com>
Cc: mikko.rapeli@linaro.org, openembedded-core@lists.openembedded.org, 
	JPEWhacker@gmail.com, thomas.petazzoni@bootlin.com, 
	mathieu.dubois-briand@bootlin.com, antonin.godard@bootlin.com
Content-Type: multipart/alternative; boundary="000000000000ce1f14063a0d067c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 14:51:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220465

--000000000000ce1f14063a0d067c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2025 at 10:30=E2=80=AFAM Kamel Bouhara <kamel.bouhara@bootl=
in.com>
wrote:

> On Wed, Jul 16, 2025 at 09:30:11AM -0400, Bruce Ashfield via
> lists.openembedded.org wrote:
> >    On Wed, Jul 16, 2025 at 7:34=E2=80=AFAM Kamel Bouhara via
> >    [1]lists.openembedded.org
> >    <kamel.bouhara=3D[2]bootlin.com@lists.openembedded.org> wrote:
> >
> >      On Wed, Jul 16, 2025 at 12:28:06PM +0300, Mikko Rapeli via
> >      [3]lists.openembedded.org wrote:
> >      > Hi,
> >      >
> >      Hi Mikko,
> >      > On Wed, Jul 16, 2025 at 11:05:17AM +0200, Kamel Bouhara via
> >      [4]lists.openembedded.org wrote:
> >      > > Enhances SPDX Document by extracting kernel build-time
> >      configuration settings from '${B}/.config'.
> >      > >
> >      > > Each CONFIG_* line is parsed and exported as a DictionaryEntry
> >      in the build_Build.build_parameter
> >      > > section of the SPDX document. This provides better visibility
> >      into kernel build behavior and
> >      > > configuration, in alignment with the SPDX3 metadata model.
> >      > >
> >      > > The feature is gated by a new tunable variable:
> >      > >
> >      > >     SPDX_INCLUDE_KERNEL_CONFIG (default: "1")
> >      > >
> >      > > Setting this to "0" disables exporting the kernel configuratio=
n,
> >      which may be useful to improve
> >      > > performance or reduce the size of generated SPDX documents.
> >      > >
> >      > > Example:
> >      > >
> >      > >     CONFIG_FOO=3Dy  =E2=86=92  { key: "CONFIG_FOO", value: "y"=
 }
> >      > >
> >      > > This complements existing metadata export features and enables=
 a
> >      more complete audit trail of how
> >      > > the kernel is built within a given build.
> >      >
> >      > Why is the kernel so special? All other SW components have build
> >      time configs too.
> >      >
> >      > For information harvesting, a lot of data can be extracted from
> >      the build system
> >      > but to me it's important that the build system and tools benefit
> >      the users
> >      > who actually do maintenance and development work. They need to b=
e
> >      able to see
> >      > what patches get applied, what they fix, what configs are used
> >      etc. Extracting
> >      > all possible info into some IT management tooling which never
> >      directly feeds
> >      > back to the build system or developers to actually improve the C=
VE
> >      patch status,
> >      > enable security features and updates and fixes for real bugs, is
> >      not very useful.
> >      >
> >      You're absolutely right to question the special handling of the
> >      kernel.
> >      In this case, the choice was intentional: the kernel=E2=80=99s .co=
nfig is
> >      well-structured,
> >      easy to locate, and critical to the system's security and behavior=
.
> >      It's also a central component of the BSP, making it a strong
> >      candidate for initial
> >      integration when experimenting with build-time metadata capture in
> >      SPDX.
> >      That said, I fully agree, many other software components also have
> >      meaningful
> >      build-time configuration (e.g., PACKAGECONFIG, EXTRA_OECONF, cmake
> >      flags), and the
> >      longer-term goal is to extend support to those as well.
> >      Starting with the kernel gives us a good foundation to validate th=
e
> >      approach.
> >      Importantly, the patch makes this metadata inclusion optional and
> >      configurable.
> >      It introduces a variable to let users control the granularity of
> >      what gets
> >      included in the SPDX document. That means teams can choose to
> >      include or exclude
> >      details like kernel configuration based on their policy, use case,
> >      or audit needs.
> >      About usefulness to developers, I agree this info only brings valu=
e
> >      if it
> >      integrates back into yocto developers workflows. That=E2=80=99s ex=
actly the
> >      direction
> >      I=E2=80=99m aiming for, for example, we=E2=80=99ve added support i=
n our SBOM diff
> >      tool to compare
> >      kernel configuration between builds by parsing CONFIG_* entries.
> >      This mostly lets teams audit config changes over time and detect i=
f
> >      a
> >      some security-hardening option was unintentionally disabled.
> >
>
> >    I have the same concerns and opinion on this as Mikko
> >    As long as this doesn't add overhead, or becomes mandatory, my
> >    objections can
> >    be ignored.
> >    But generally speaking, I'm opposed to jamming everything into SPDX
> and
> >    using
> >    it as a tool for what you are describing above. There are already
> >    existing tools that
> >    are focused and better at comparing configurations of packages (and
> the
> >    kernel).
> >    Turning SPDX into some kind of one-stop-shop and everything-in-one
> >    place tool
> >    is something I'd object strongly to.  (I do realize you are talking
> >    about using some
> >    sort of other tool reading the SPDX data, but my objection is just t=
he
> >    same if it
> >    becomes an absolutely massive monolithic data source).
> >    Bruce
> >
>
> Hi Bruce,
>
> Thanks for the feedback.
>
> Just to clarify, the goal here isn't to turn SPDX into a one-stop-shop or
> to
> overload it with every piece of build metadata. The intent is to capture =
a
> minimal
> and focused subset of build-time parameters
>

I wouldn't call capturing the configuration like this patch is doing
"minimal", so
we'll agree to disagree on that point.



> (like kernel .config, PACKAGECONFIG, etc.) where:
>
>     - The structure is already well-defined
>     - The data is relevant for security or compliance
>     - And the cost of extraction is very low
>

And arguably not the best or most efficient format ...


> This is fully gated behind an opt-in variable (and could default to
> disabled).
> The idea is not to replace existing tools but rather to provide a
> structured,
> portable format for key metadata, especially in SBOM-driven environments
> where SPDX
> is already part of the process.


It must default to disabled in my opinion. But I can already hear the
arguments
that will say "it won't be tested if it isn't on by default, etc" ... and
that is where we
will have the conflict about whether it is on, or off, by default.


>
>
> In my use case, this metadata is consumed by a targeted diff tool; not
> treating
> SPDX as the end-goal, but more like a transport format. This approach let=
s
> us
> reuse existing SPDX outputs without interfering with or duplicating the
> role of
> more purpose-built tools.
>
> So I hear you: this shouldn't become bloated, mandatory. The goal is
> simply to make
> sure when people do need to trace how something was built, especially in
> CI or
> audit contexts, they have a consistent hook, and it can be disabled
> entirely if
> not useful.
>

It is something that I can ignore (which is good), so I'll just keep
watching to
ensure that it doesn't become mandatory, or fail configurations on
compliance
and I'll be happy.

I feel that we are moving more and more towards a "pipeline" or "loadbuild"
use
case for OE, and that's also what I guard against.

I'm already not happy how long SPDX adds to developer builds, so at some
point
I need to revisit disabling it completely (it used to fail when I first
tried that).

Cheers,

Bruce



>
> Cheers,
>
> --
> Kamel Bouhara, Bootlin
> Embedded Linux and kernel engineering
> https://bootlin.com
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000ce1f14063a0d067c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 16, 2025 at 10:30=
=E2=80=AFAM Kamel Bouhara &lt;<a href=3D"mailto:kamel.bouhara@bootlin.com">=
kamel.bouhara@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On Wed, Jul 16, 2025 at 09:30:11AM -0400, Bruce As=
hfield via <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" tar=
get=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt;=C2=A0 =C2=A0 On Wed, Jul 16, 2025 at 7:34=E2=80=AFAM Kamel Bouhara via=
<br>
&gt;=C2=A0 =C2=A0 [1]<a href=3D"http://lists.openembedded.org" rel=3D"noref=
errer" target=3D"_blank">lists.openembedded.org</a><br>
&gt;=C2=A0 =C2=A0 &lt;kamel.bouhara=3D[2]<a href=3D"mailto:bootlin.com@list=
s.openembedded.org" target=3D"_blank">bootlin.com@lists.openembedded.org</a=
>&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 On Wed, Jul 16, 2025 at 12:28:06PM +0300, Mikko Ra=
peli via<br>
&gt;=C2=A0 =C2=A0 =C2=A0 [3]<a href=3D"http://lists.openembedded.org" rel=
=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Hi,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Hi Mikko,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; On Wed, Jul 16, 2025 at 11:05:17AM +0200, Kam=
el Bouhara via<br>
&gt;=C2=A0 =C2=A0 =C2=A0 [4]<a href=3D"http://lists.openembedded.org" rel=
=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; Enhances SPDX Document by extracting ker=
nel build-time<br>
&gt;=C2=A0 =C2=A0 =C2=A0 configuration settings from &#39;${B}/.config&#39;=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; Each CONFIG_* line is parsed and exporte=
d as a DictionaryEntry<br>
&gt;=C2=A0 =C2=A0 =C2=A0 in the build_Build.build_parameter<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; section of the SPDX document. This provi=
des better visibility<br>
&gt;=C2=A0 =C2=A0 =C2=A0 into kernel build behavior and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; configuration, in alignment with the SPD=
X3 metadata model.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; The feature is gated by a new tunable va=
riable:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;=C2=A0 =C2=A0 =C2=A0SPDX_INCLUDE_KERNEL_C=
ONFIG (default: &quot;1&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; Setting this to &quot;0&quot; disables e=
xporting the kernel configuration,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 which may be useful to improve<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; performance or reduce the size of genera=
ted SPDX documents.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; Example:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;=C2=A0 =C2=A0 =C2=A0CONFIG_FOO=3Dy=C2=A0 =
=E2=86=92=C2=A0 { key: &quot;CONFIG_FOO&quot;, value: &quot;y&quot; }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; This complements existing metadata expor=
t features and enables a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 more complete audit trail of how<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; the kernel is built within a given build=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Why is the kernel so special? All other SW co=
mponents have build<br>
&gt;=C2=A0 =C2=A0 =C2=A0 time configs too.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; For information harvesting, a lot of data can=
 be extracted from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 the build system<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; but to me it&#39;s important that the build s=
ystem and tools benefit<br>
&gt;=C2=A0 =C2=A0 =C2=A0 the users<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; who actually do maintenance and development w=
ork. They need to be<br>
&gt;=C2=A0 =C2=A0 =C2=A0 able to see<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; what patches get applied, what they fix, what=
 configs are used<br>
&gt;=C2=A0 =C2=A0 =C2=A0 etc. Extracting<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; all possible info into some IT management too=
ling which never<br>
&gt;=C2=A0 =C2=A0 =C2=A0 directly feeds<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; back to the build system or developers to act=
ually improve the CVE<br>
&gt;=C2=A0 =C2=A0 =C2=A0 patch status,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; enable security features and updates and fixe=
s for real bugs, is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 not very useful.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 You&#39;re absolutely right to question the specia=
l handling of the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 kernel.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 In this case, the choice was intentional: the kern=
el=E2=80=99s .config is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 well-structured,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 easy to locate, and critical to the system&#39;s s=
ecurity and behavior.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 It&#39;s also a central component of the BSP, maki=
ng it a strong<br>
&gt;=C2=A0 =C2=A0 =C2=A0 candidate for initial<br>
&gt;=C2=A0 =C2=A0 =C2=A0 integration when experimenting with build-time met=
adata capture in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 SPDX.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 That said, I fully agree, many other software comp=
onents also have<br>
&gt;=C2=A0 =C2=A0 =C2=A0 meaningful<br>
&gt;=C2=A0 =C2=A0 =C2=A0 build-time configuration (e.g., PACKAGECONFIG, EXT=
RA_OECONF, cmake<br>
&gt;=C2=A0 =C2=A0 =C2=A0 flags), and the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 longer-term goal is to extend support to those as =
well.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Starting with the kernel gives us a good foundatio=
n to validate the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 approach.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Importantly, the patch makes this metadata inclusi=
on optional and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 configurable.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 It introduces a variable to let users control the =
granularity of<br>
&gt;=C2=A0 =C2=A0 =C2=A0 what gets<br>
&gt;=C2=A0 =C2=A0 =C2=A0 included in the SPDX document. That means teams ca=
n choose to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 include or exclude<br>
&gt;=C2=A0 =C2=A0 =C2=A0 details like kernel configuration based on their p=
olicy, use case,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 or audit needs.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 About usefulness to developers, I agree this info =
only brings value<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if it<br>
&gt;=C2=A0 =C2=A0 =C2=A0 integrates back into yocto developers workflows. T=
hat=E2=80=99s exactly the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 direction<br>
&gt;=C2=A0 =C2=A0 =C2=A0 I=E2=80=99m aiming for, for example, we=E2=80=99ve=
 added support in our SBOM diff<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tool to compare<br>
&gt;=C2=A0 =C2=A0 =C2=A0 kernel configuration between builds by parsing CON=
FIG_* entries.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 This mostly lets teams audit config changes over t=
ime and detect if<br>
&gt;=C2=A0 =C2=A0 =C2=A0 a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 some security-hardening option was unintentionally=
 disabled.<br>
&gt;<br>
<br>
&gt;=C2=A0 =C2=A0 I have the same concerns and opinion on this as Mikko<br>
&gt;=C2=A0 =C2=A0 As long as this doesn&#39;t add overhead, or becomes mand=
atory, my<br>
&gt;=C2=A0 =C2=A0 objections can<br>
&gt;=C2=A0 =C2=A0 be ignored.<br>
&gt;=C2=A0 =C2=A0 But generally speaking, I&#39;m opposed to jamming everyt=
hing into SPDX and<br>
&gt;=C2=A0 =C2=A0 using<br>
&gt;=C2=A0 =C2=A0 it as a tool for what you are describing above. There are=
 already<br>
&gt;=C2=A0 =C2=A0 existing tools that<br>
&gt;=C2=A0 =C2=A0 are focused and better at comparing configurations of pac=
kages (and the<br>
&gt;=C2=A0 =C2=A0 kernel).<br>
&gt;=C2=A0 =C2=A0 Turning SPDX into some kind of one-stop-shop and everythi=
ng-in-one<br>
&gt;=C2=A0 =C2=A0 place tool<br>
&gt;=C2=A0 =C2=A0 is something I&#39;d object strongly to.=C2=A0 (I do real=
ize you are talking<br>
&gt;=C2=A0 =C2=A0 about using some<br>
&gt;=C2=A0 =C2=A0 sort of other tool reading the SPDX data, but my objectio=
n is just the<br>
&gt;=C2=A0 =C2=A0 same if it<br>
&gt;=C2=A0 =C2=A0 becomes an absolutely massive monolithic data source).<br=
>
&gt;=C2=A0 =C2=A0 Bruce<br>
&gt;<br>
<br>
Hi Bruce,<br>
<br>
Thanks for the feedback.<br>
<br>
Just to clarify, the goal here isn&#39;t to turn SPDX into a one-stop-shop =
or to<br>
overload it with every piece of build metadata. The intent is to capture a =
minimal<br>
and focused subset of build-time parameters<br></blockquote><div><br></div>=
<div><div class=3D"gmail_default" style=3D"font-size:small">I wouldn&#39;t =
call capturing the configuration like this patch is doing &quot;minimal&quo=
t;, so</div><div class=3D"gmail_default" style=3D"font-size:small">we&#39;l=
l agree to disagree on that point.</div><br></div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
(like kernel .config, PACKAGECONFIG, etc.) where:<br>
<br>
=C2=A0 =C2=A0 - The structure is already well-defined<br>
=C2=A0 =C2=A0 - The data is relevant for security or compliance<br>
=C2=A0 =C2=A0 - And the cost of extraction is very low<br></blockquote><div=
><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">And =
arguably not the best or most efficient format ...</div></div><div><br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
This is fully gated behind an opt-in variable (and could default to disable=
d).<br>
The idea is not to replace existing tools but rather to provide a structure=
d,<br>
portable format for key metadata, especially in SBOM-driven environments wh=
ere SPDX<br>
is already part of the process.<span class=3D"gmail_default" style=3D"font-=
size:small"></span></blockquote><div><br></div><div class=3D"gmail_default"=
 style=3D"font-size:small">It must default to disabled in my opinion. But I=
 can already hear the arguments</div><div class=3D"gmail_default" style=3D"=
font-size:small">that will say &quot;it won&#39;t be tested if it isn&#39;t=
 on by default, etc&quot; ... and that is where we</div><div class=3D"gmail=
_default" style=3D"font-size:small">will have the conflict about whether it=
 is on, or off, by default.</div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><br>
<br>
In my use case, this metadata is consumed by a targeted diff tool; not trea=
ting<br>
SPDX as the end-goal, but more like a transport format. This approach lets =
us<br>
reuse existing SPDX outputs without interfering with or duplicating the rol=
e of<br>
more purpose-built tools.<br>
<br>
So I hear you: this shouldn&#39;t become bloated, mandatory. The goal is si=
mply to make<br>
sure when people do need to trace how something was built, especially in CI=
 or<br>
audit contexts, they have a consistent hook, and it can be disabled entirel=
y if<br>
not useful.<br></blockquote><div><br></div><div><div class=3D"gmail_default=
" style=3D"font-size:small">It is something that I can ignore (which is goo=
d), so I&#39;ll just keep watching to</div><div class=3D"gmail_default" sty=
le=3D"font-size:small">ensure that it doesn&#39;t become mandatory, or fail=
 configurations on compliance</div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">and I&#39;ll be happy.</div><div class=3D"gmail_default" sty=
le=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font=
-size:small">I feel that we are moving more and more towards a &quot;pipeli=
ne&quot; or &quot;loadbuild&quot; use</div><div class=3D"gmail_default" sty=
le=3D"font-size:small">case for OE, and that&#39;s also what I guard agains=
t.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><d=
iv class=3D"gmail_default" style=3D"font-size:small">I&#39;m already not ha=
ppy how long SPDX adds to developer builds, so at some point</div><div clas=
s=3D"gmail_default" style=3D"font-size:small">I need to revisit disabling i=
t completely (it used to fail when I first tried that).</div><div class=3D"=
gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">Cheers,</div><div class=3D"gmail_default" st=
yle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fon=
t-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
--<br>
Kamel Bouhara, Bootlin<br>
Embedded Linux and kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000ce1f14063a0d067c--

