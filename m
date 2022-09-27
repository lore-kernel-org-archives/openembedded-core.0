Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C5D7C07E9D
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 20:04:46 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web10.15826.1664309082161621804
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 13:04:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=E7qBX4Wj;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id
 z18-20020a9d65d2000000b0065c3705f7beso2764615oth.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 13:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=3V2IW3GjAtuMwZSJjQ/A5IOmDs0fJc1BI7UeD7+jwN4=;
        b=E7qBX4Wj8dIM4vDJatLAQi417Uapt4mNKF4oDGEiIiInIlKO5aKbWsfsUIYqnje/aU
         9hr6gtUf4w1Ae5y1qbTcyAKoqxA0BDzZC6tzMy9z0Mxgi5AFnCKdZB3mOLQPNTmufG88
         A/9NFmnRgeHhPchrd21M/vPyajWRciUgWjE1/H2MCo8Z8cp7FxKHEhf3zWCXZyEivXCY
         vWBZ/VH7uxx+WYVNWAy2LnDQWkxwbGpvTpXsrv7v1XmVFWejoc7IZ1Wa55zOydIFZ931
         Um6+xTrY/3T1SjF9fylgLObc0kKcHRKaXBMcyUkXPpYvDasNsFaNqLgT97jNPLXpQnmR
         3MKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=3V2IW3GjAtuMwZSJjQ/A5IOmDs0fJc1BI7UeD7+jwN4=;
        b=riXEsJi3iIVeCmcRYsvYXwk0glIbWPtONOyYAViS8Y+/fxb4/odW9LQU/41FvH9jT0
         19qcS+8uMA8CGMx2HC015D6kh86Lt6Xi4a4hSd+G59F5VIuAKAaq3G1hJGCbiTJgDvJF
         QnA+VGOirTEZqXRAxHHRUu0l07qBIBT3iMK+n47UlYf74HhMO/0LcZDwnq4bQZ0Hh5Qn
         Y2VhKq9686Z+Z5ms7I+NBee/aMppmPQEyDejBsIONegTAJNowNNxFUTpW9JDgVdwrqXK
         hRVYtBsQLTWz9AlU4t9IgL6RMQ2fHdVQn55ZdoQRV5sIjZVHk36pzbvDxehgLODYG+SD
         sdow==
X-Gm-Message-State: ACrzQf2CMzzphtixhk6Ji0KYvFTwAaJ1cGcSM1dctfEeBmN4hGPlCRV6
	7zmUwryOgMnL1EBaYY4076J6XzxhTp4v+awi3BQ=
X-Google-Smtp-Source: 
 AMsMyM7Pv5Np+Q+6fxrXNwEztbv6S7DUe5Qw9BoBPL8hn/t40ZcRTtiPqSerW6iHoJgx1ORqVpkKFid7cJSheFvckGc=
X-Received: by 2002:a05:6830:3901:b0:658:fff4:51b8 with SMTP id
 br1-20020a056830390100b00658fff451b8mr12632106otb.55.1664309081171; Tue, 27
 Sep 2022 13:04:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220927190553.7313-1-bruce.ashfield@gmail.com>
 <CAMKF1so9ByR=p1N=RW+TFkF0O6A8rR-JkpSQYNq41NGZFy+W6A@mail.gmail.com>
 <CADkTA4M=1Cem8aikAi2ui6C-RkEkGOy+2HX+b89D71NmCuo3eQ@mail.gmail.com>
In-Reply-To: 
 <CADkTA4M=1Cem8aikAi2ui6C-RkEkGOy+2HX+b89D71NmCuo3eQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 27 Sep 2022 13:04:30 -0700
Message-ID: 
 <CAMKF1srGmtSaYX+eqE5cZQw5h5=0SZTDzzcaEwbggPM=GhOemw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-yocto/5.19: fix gcc-11 warning
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Content-Type: multipart/alternative; boundary="000000000000946b2105e9ae2762"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Sep 2022 20:04:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171131

--000000000000946b2105e9ae2762
Content-Type: text/plain; charset="UTF-8"

Ok, thanks.

On Tue, Sep 27, 2022 at 12:24 PM Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> 11. The full upstream commit is:
>
> Author: Florian Fainelli <f.fainelli@gmail.com>
> Date:   Sun Jul 31 19:51:09 2022 -0700
>     libbpf: Initialize err in probe_map_create
>
>    GCC-11 warns about the possibly unitialized err variable in
>     probe_map_create:
>
>
>     libbpf_probes.c: In function 'probe_map_create':
>     libbpf_probes.c:361:38: error: 'err' may be used uninitialized in
> this function [-Werror=maybe-uninitialized]
>       361 |                 return fd < 0 && err == exp_err ? 1 : 0;
>           |                                  ~~~~^~~~~~~~~~
>
>     Fixes: 878d8def0603 ("libbpf: Rework feature-probing APIs")
>     Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>
> Bruce
>
> On Tue, Sep 27, 2022 at 3:14 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > gcc11 or 12 ?
> >
> > On Tue, Sep 27, 2022 at 12:05 PM Bruce Ashfield
> > <bruce.ashfield@gmail.com> wrote:
> > >
> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > >
> > > Integrating the following commit(s) to linux-yocto/5.19:
> > >
> > >     65a9a22786a6 libbpf: Initialize err in probe_map_create
> > >
> > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > ---
> > >
> > > Ross identified this change as worth backporting to fix some
> > > gcc-11 warnings. I've been soaking it for a bit, and haven't
> > > seen any issues.
> > >
> > > Bruce
> > >
> > >  .../linux/linux-yocto-rt_5.19.bb              |  2 +-
> > >  .../linux/linux-yocto-tiny_5.19.bb            |  2 +-
> > >  meta/recipes-kernel/linux/linux-yocto_5.19.bb | 20
> +++++++++----------
> > >  3 files changed, 12 insertions(+), 12 deletions(-)
> > >
> > > diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
> b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
> > > index 17ae94066c..b3e9fbae62 100644
> > > --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
> > > +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
> > > @@ -11,7 +11,7 @@ python () {
> > >          raise bb.parse.SkipRecipe("Set
> PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
> > >  }
> > >
> > > -SRCREV_machine ?= "3596666292dcf3fc078090666dc327d233695310"
> > > +SRCREV_machine ?= "bc8af638c00f28a46e77e34056079087638f6e65"
> > >  SRCREV_meta ?= "350b544d077955b599b54ab364f6227d96a90455"
> > >
> > >  SRC_URI = "git://
> git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine
> <http://git.yoctoproject.org/linux-yocto.git;branch=$%7BKBRANCH%7D;name=machine>
> \
> > > diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
> b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
> > > index c18278ad79..466b7063b4 100644
> > > --- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
> > > +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
> > > @@ -14,7 +14,7 @@ DEPENDS += "openssl-native util-linux-native"
> > >  KMETA = "kernel-meta"
> > >  KCONF_BSP_AUDIT_LEVEL = "2"
> > >
> > > -SRCREV_machine ?= "44a446e91acea4f2f0d35896763224c3b52a3ed5"
> > > +SRCREV_machine ?= "65a9a22786a6710fc7b4edb7cfae80dd83f591f1"
> > >  SRCREV_meta ?= "350b544d077955b599b54ab364f6227d96a90455"
> > >
> > >  PV = "${LINUX_VERSION}+git${SRCPV}"
> > > diff --git a/meta/recipes-kernel/linux/linux-yocto_5.19.bb
> b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
> > > index 4fc1ae9245..f882972e35 100644
> > > --- a/meta/recipes-kernel/linux/linux-yocto_5.19.bb
> > > +++ b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
> > > @@ -13,16 +13,16 @@ KBRANCH:qemux86  ?= "v5.19/standard/base"
> > >  KBRANCH:qemux86-64 ?= "v5.19/standard/base"
> > >  KBRANCH:qemumips64 ?= "v5.19/standard/mti-malta64"
> > >
> > > -SRCREV_machine:qemuarm ?= "9111e441d26961e67bef7866919c51b27e794bac"
> > > -SRCREV_machine:qemuarm64 ?= "44a446e91acea4f2f0d35896763224c3b52a3ed5"
> > > -SRCREV_machine:qemumips ?= "5f89b6548b6665f3ebec11266f2c7db2793129da"
> > > -SRCREV_machine:qemuppc ?= "44a446e91acea4f2f0d35896763224c3b52a3ed5"
> > > -SRCREV_machine:qemuriscv64 ?=
> "44a446e91acea4f2f0d35896763224c3b52a3ed5"
> > > -SRCREV_machine:qemuriscv32 ?=
> "44a446e91acea4f2f0d35896763224c3b52a3ed5"
> > > -SRCREV_machine:qemux86 ?= "44a446e91acea4f2f0d35896763224c3b52a3ed5"
> > > -SRCREV_machine:qemux86-64 ?=
> "44a446e91acea4f2f0d35896763224c3b52a3ed5"
> > > -SRCREV_machine:qemumips64 ?=
> "99613988297ac45653cc81319e63b2821645a3ba"
> > > -SRCREV_machine ?= "44a446e91acea4f2f0d35896763224c3b52a3ed5"
> > > +SRCREV_machine:qemuarm ?= "446661f6a3b07535304497c1a51d9cab95f48f0b"
> > > +SRCREV_machine:qemuarm64 ?= "65a9a22786a6710fc7b4edb7cfae80dd83f591f1"
> > > +SRCREV_machine:qemumips ?= "98da147618fca3da29cf1c6ab9c53f24de2c587c"
> > > +SRCREV_machine:qemuppc ?= "65a9a22786a6710fc7b4edb7cfae80dd83f591f1"
> > > +SRCREV_machine:qemuriscv64 ?=
> "65a9a22786a6710fc7b4edb7cfae80dd83f591f1"
> > > +SRCREV_machine:qemuriscv32 ?=
> "65a9a22786a6710fc7b4edb7cfae80dd83f591f1"
> > > +SRCREV_machine:qemux86 ?= "65a9a22786a6710fc7b4edb7cfae80dd83f591f1"
> > > +SRCREV_machine:qemux86-64 ?=
> "65a9a22786a6710fc7b4edb7cfae80dd83f591f1"
> > > +SRCREV_machine:qemumips64 ?=
> "53842054198d851b5deb5810afaf126156efbb54"
> > > +SRCREV_machine ?= "65a9a22786a6710fc7b4edb7cfae80dd83f591f1"
> > >  SRCREV_meta ?= "350b544d077955b599b54ab364f6227d96a90455"
> > >
> > >  # set your preferred provider of linux-yocto to
> 'linux-yocto-upstream', and you'll
> > > --
> > > 2.19.1
> > >
> > >
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#171124):
> https://lists.openembedded.org/g/openembedded-core/message/171124
> > > Mute This Topic: https://lists.openembedded.org/mt/93957254/1997914
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> [raj.khem@gmail.com]
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > >
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>

--000000000000946b2105e9ae2762
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Ok, thanks.</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Sep 27, 2022 at 12:24 PM Bruce Ashfield &lt;<a=
 href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">11. The full upstream commit=
 is:<br>
<br>
Author: Florian Fainelli &lt;<a href=3D"mailto:f.fainelli@gmail.com" target=
=3D"_blank">f.fainelli@gmail.com</a>&gt;<br>
Date:=C2=A0 =C2=A0Sun Jul 31 19:51:09 2022 -0700<br>
=C2=A0 =C2=A0 libbpf: Initialize err in probe_map_create<br>
<br>
=C2=A0 =C2=A0GCC-11 warns about the possibly unitialized err variable in<br=
>
=C2=A0 =C2=A0 probe_map_create:<br>
<br>
<br>
=C2=A0 =C2=A0 libbpf_probes.c: In function &#39;probe_map_create&#39;:<br>
=C2=A0 =C2=A0 libbpf_probes.c:361:38: error: &#39;err&#39; may be used unin=
itialized in<br>
this function [-Werror=3Dmaybe-uninitialized]<br>
=C2=A0 =C2=A0 =C2=A0 361 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return fd &lt; 0 &amp;&amp; err =3D=3D exp_err ? 1 : 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ~~~~^~~~~~~~~~<br>
<br>
=C2=A0 =C2=A0 Fixes: 878d8def0603 (&quot;libbpf: Rework feature-probing API=
s&quot;)<br>
=C2=A0 =C2=A0 Signed-off-by: Florian Fainelli &lt;<a href=3D"mailto:f.faine=
lli@gmail.com" target=3D"_blank">f.fainelli@gmail.com</a>&gt;<br>
<br>
Bruce<br>
<br>
On Tue, Sep 27, 2022 at 3:14 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gma=
il.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; gcc11 or 12 ?<br>
&gt;<br>
&gt; On Tue, Sep 27, 2022 at 12:05 PM Bruce Ashfield<br>
&gt; &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruc=
e.ashfield@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; Integrating the following commit(s) to linux-yocto/5.19:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A065a9a22786a6 libbpf: Initialize err in probe_m=
ap_create<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfiel=
d@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;<br>
&gt; &gt; Ross identified this change as worth backporting to fix some<br>
&gt; &gt; gcc-11 warnings. I&#39;ve been soaking it for a bit, and haven&#3=
9;t<br>
&gt; &gt; seen any issues.<br>
&gt; &gt;<br>
&gt; &gt; Bruce<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 .../linux/<a href=3D"http://linux-yocto-rt_5.19.bb" rel=3D"=
noreferrer" target=3D"_blank">linux-yocto-rt_5.19.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; &gt;=C2=A0 .../linux/<a href=3D"http://linux-yocto-tiny_5.19.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_5.19.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; &gt;=C2=A0 meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.1=
9.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto_5.19.bb</a> | 20 +++=
++++++----------<br>
&gt; &gt;=C2=A0 3 files changed, 12 insertions(+), 12 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yo=
cto-rt_5.19.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-rt_5.19.bb=
</a> b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_5.19.bb" =
rel=3D"noreferrer" target=3D"_blank">linux-yocto-rt_5.19.bb</a><br>
&gt; &gt; index 17ae94066c..b3e9fbae62 100644<br>
&gt; &gt; --- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_=
5.19.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-rt_5.19.bb</a><br=
>
&gt; &gt; +++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_=
5.19.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-rt_5.19.bb</a><br=
>
&gt; &gt; @@ -11,7 +11,7 @@ python () {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.parse.SkipRecipe(&quot=
;Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it&quot;=
)<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt; -SRCREV_machine ?=3D &quot;3596666292dcf3fc078090666dc327d2336953=
10&quot;<br>
&gt; &gt; +SRCREV_machine ?=3D &quot;bc8af638c00f28a46e77e34056079087638f6e=
65&quot;<br>
&gt; &gt;=C2=A0 SRCREV_meta ?=3D &quot;350b544d077955b599b54ab364f6227d96a9=
0455&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.=
org/linux-yocto.git;branch=3D$%7BKBRANCH%7D;name=3Dmachine" rel=3D"noreferr=
er" target=3D"_blank">git.yoctoproject.org/linux-yocto.git;branch=3D${KBRAN=
CH};name=3Dmachine</a> \<br>
&gt; &gt; diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yo=
cto-tiny_5.19.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_5.1=
9.bb</a> b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_5.1=
9.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_5.19.bb</a><br>
&gt; &gt; index c18278ad79..466b7063b4 100644<br>
&gt; &gt; --- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tin=
y_5.19.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_5.19.bb</a=
><br>
&gt; &gt; +++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tin=
y_5.19.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_5.19.bb</a=
><br>
&gt; &gt; @@ -14,7 +14,7 @@ DEPENDS +=3D &quot;openssl-native util-linux-na=
tive&quot;<br>
&gt; &gt;=C2=A0 KMETA =3D &quot;kernel-meta&quot;<br>
&gt; &gt;=C2=A0 KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
&gt; &gt;<br>
&gt; &gt; -SRCREV_machine ?=3D &quot;44a446e91acea4f2f0d35896763224c3b52a3e=
d5&quot;<br>
&gt; &gt; +SRCREV_machine ?=3D &quot;65a9a22786a6710fc7b4edb7cfae80dd83f591=
f1&quot;<br>
&gt; &gt;=C2=A0 SRCREV_meta ?=3D &quot;350b544d077955b599b54ab364f6227d96a9=
0455&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
&gt; &gt; diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yo=
cto_5.19.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto_5.19.bb</a> b=
/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.19.bb" rel=3D"no=
referrer" target=3D"_blank">linux-yocto_5.19.bb</a><br>
&gt; &gt; index 4fc1ae9245..f882972e35 100644<br>
&gt; &gt; --- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.1=
9.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto_5.19.bb</a><br>
&gt; &gt; +++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.1=
9.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto_5.19.bb</a><br>
&gt; &gt; @@ -13,16 +13,16 @@ KBRANCH:qemux86=C2=A0 ?=3D &quot;v5.19/standa=
rd/base&quot;<br>
&gt; &gt;=C2=A0 KBRANCH:qemux86-64 ?=3D &quot;v5.19/standard/base&quot;<br>
&gt; &gt;=C2=A0 KBRANCH:qemumips64 ?=3D &quot;v5.19/standard/mti-malta64&qu=
ot;<br>
&gt; &gt;<br>
&gt; &gt; -SRCREV_machine:qemuarm ?=3D &quot;9111e441d26961e67bef7866919c51=
b27e794bac&quot;<br>
&gt; &gt; -SRCREV_machine:qemuarm64 ?=3D &quot;44a446e91acea4f2f0d358967632=
24c3b52a3ed5&quot;<br>
&gt; &gt; -SRCREV_machine:qemumips ?=3D &quot;5f89b6548b6665f3ebec11266f2c7=
db2793129da&quot;<br>
&gt; &gt; -SRCREV_machine:qemuppc ?=3D &quot;44a446e91acea4f2f0d35896763224=
c3b52a3ed5&quot;<br>
&gt; &gt; -SRCREV_machine:qemuriscv64 ?=3D &quot;44a446e91acea4f2f0d3589676=
3224c3b52a3ed5&quot;<br>
&gt; &gt; -SRCREV_machine:qemuriscv32 ?=3D &quot;44a446e91acea4f2f0d3589676=
3224c3b52a3ed5&quot;<br>
&gt; &gt; -SRCREV_machine:qemux86 ?=3D &quot;44a446e91acea4f2f0d35896763224=
c3b52a3ed5&quot;<br>
&gt; &gt; -SRCREV_machine:qemux86-64 ?=3D &quot;44a446e91acea4f2f0d35896763=
224c3b52a3ed5&quot;<br>
&gt; &gt; -SRCREV_machine:qemumips64 ?=3D &quot;99613988297ac45653cc81319e6=
3b2821645a3ba&quot;<br>
&gt; &gt; -SRCREV_machine ?=3D &quot;44a446e91acea4f2f0d35896763224c3b52a3e=
d5&quot;<br>
&gt; &gt; +SRCREV_machine:qemuarm ?=3D &quot;446661f6a3b07535304497c1a51d9c=
ab95f48f0b&quot;<br>
&gt; &gt; +SRCREV_machine:qemuarm64 ?=3D &quot;65a9a22786a6710fc7b4edb7cfae=
80dd83f591f1&quot;<br>
&gt; &gt; +SRCREV_machine:qemumips ?=3D &quot;98da147618fca3da29cf1c6ab9c53=
f24de2c587c&quot;<br>
&gt; &gt; +SRCREV_machine:qemuppc ?=3D &quot;65a9a22786a6710fc7b4edb7cfae80=
dd83f591f1&quot;<br>
&gt; &gt; +SRCREV_machine:qemuriscv64 ?=3D &quot;65a9a22786a6710fc7b4edb7cf=
ae80dd83f591f1&quot;<br>
&gt; &gt; +SRCREV_machine:qemuriscv32 ?=3D &quot;65a9a22786a6710fc7b4edb7cf=
ae80dd83f591f1&quot;<br>
&gt; &gt; +SRCREV_machine:qemux86 ?=3D &quot;65a9a22786a6710fc7b4edb7cfae80=
dd83f591f1&quot;<br>
&gt; &gt; +SRCREV_machine:qemux86-64 ?=3D &quot;65a9a22786a6710fc7b4edb7cfa=
e80dd83f591f1&quot;<br>
&gt; &gt; +SRCREV_machine:qemumips64 ?=3D &quot;53842054198d851b5deb5810afa=
f126156efbb54&quot;<br>
&gt; &gt; +SRCREV_machine ?=3D &quot;65a9a22786a6710fc7b4edb7cfae80dd83f591=
f1&quot;<br>
&gt; &gt;=C2=A0 SRCREV_meta ?=3D &quot;350b544d077955b599b54ab364f6227d96a9=
0455&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 # set your preferred provider of linux-yocto to &#39;linux-=
yocto-upstream&#39;, and you&#39;ll<br>
&gt; &gt; --<br>
&gt; &gt; 2.19.1<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; View/Reply Online (#171124): <a href=3D"https://lists.openembedde=
d.org/g/openembedded-core/message/171124" rel=3D"noreferrer" target=3D"_bla=
nk">https://lists.openembedded.org/g/openembedded-core/message/171124</a><b=
r>
&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/939=
57254/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembed=
ded.org/mt/93957254/1997914</a><br>
&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.op=
enembedded.org" target=3D"_blank">openembedded-core+owner@lists.openembedde=
d.org</a><br>
&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembe=
dded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.c=
om" target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;<br>
<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div></div>

--000000000000946b2105e9ae2762--

