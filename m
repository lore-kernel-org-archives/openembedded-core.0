Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E21DCF9C6F
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 14:11:54 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.15079.1727187104808239497
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 07:11:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NJV6JhOL;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7c6b4222fe3so3563345a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 07:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727187104; x=1727791904; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2F9qRoHn1T95ZhahDW04UY6itlFf1bS5hj/8p8TJTE0=;
        b=NJV6JhOLDYaWlvzV31CSh+MAGgq8Yh5GlxYnRgDmgZKkUCJ0gkGHZ96CIXpc+prFlP
         z3ZwFVFqXig1hg4y1cHe901+o32wKiqS/O2wre/5Bwbfq2Q6zO0D5Ob+WCoGPF/URfgV
         O2/+SLWWR9jTQCougn4TZ3taJpuEWmxDYT1XF9emfll3/YSSFbYau2gd55U7Uy239vLc
         ixBNmAQMcth8qyFSuhb0oHwLMrOGXHN4MjUAYNkIwkKtfqt8Yp0KdaW6aOV9avKgeoLv
         WyUi0AugtqzeJXAZLWDlCCvI7apQHz8iXM+qx7f829/78SQeEFev3Qh12l92Q6CE2l+H
         rZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727187104; x=1727791904;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2F9qRoHn1T95ZhahDW04UY6itlFf1bS5hj/8p8TJTE0=;
        b=Ir4SA0/28E2lYuu7kJeu1woFy7zTj2Nbe90pOdMFZtr6SOS/w0qmwAZiLNkDvc9oWX
         IADuytR6yXx2eWqgwzRYsNtV56ZUhK1E928CCefycwtdtgPj6pLhgzmjztppjkCILCZR
         cJ7hTSKIVbb9whHYWCoMxLx/gpkCw6q/fF42d1mE3B+AR5a85EO3NyjIoYVj4S/KYVm8
         rBZUj4u5jcyHL0JiPKTvLbS7zvnBM7NZpD+ZpoHRZ7T8VHehr9LsAz3t2CEXNrNFwf/P
         jqcguC9hTUw12fwEy3AJXx5g3Y4/AJmsCitatGL066d7Z572iZtUMZ8/WpkPxfTaqeZd
         mk9w==
X-Forwarded-Encrypted: i=1; AJvYcCXr2T1ofWtxEaqUqu/H65N8xUHpg4m9hMdtOfT2qC2nnubxnW/zW8zhRUdw5kqY2qgeRSYkBUtBf3/gko34mUXpzg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzvcylxyDlkRNWnHHuMDyu06IitIt8oGc4EzwRrFK2Hlhkgvqko
	5kdrZnWCt4x1lVyGZN2VSGdFGM/3heTQoTYeWJXX005XzvPH2P6wvsS9rXLoQpt3S52XrRYTgod
	iwA/Tjf+DJO5al1ka+oSssDRl2ok=
X-Google-Smtp-Source: AGHT+IFLkA9Prnl+EksYQSh4xL0DXMFevnye70iTfjP9TEDb1N+RY1XJxLmnhNgBSXvrSeBohkU0lqjIKS/uJ1utPZQ=
X-Received: by 2002:a17:90b:1643:b0:2d3:d414:4511 with SMTP id
 98e67ed59e1d1-2dd80c50168mr17810928a91.24.1727187103938; Tue, 24 Sep 2024
 07:11:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1723399246.git.bruce.ashfield@gmail.com>
 <e1eea6c3ea87aebfdaabf5a987a7290d7e9a4485.1723399246.git.bruce.ashfield@gmail.com>
 <4a44e457-b17b-41c6-8e10-18d9fbea4a88@cherry.de>
In-Reply-To: <4a44e457-b17b-41c6-8e10-18d9fbea4a88@cherry.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 24 Sep 2024 10:11:32 -0400
Message-ID: <CADkTA4NqO5uGBJu7Oe79vurUss8cPBUW7wqVF+wRcj25WEf4vQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/5] linux-yocto-dev: bump to v6.11
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ca80fb0622de153f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 14:11:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204864

--000000000000ca80fb0622de153f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 24, 2024 at 9:02=E2=80=AFAM Quentin Schulz <quentin.schulz@cher=
ry.de>
wrote:

> Hi Bruce,
>
> On 8/11/24 8:04 PM, Bruce Ashfield via lists.openembedded.org wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >   meta/recipes-kernel/linux/linux-yocto-dev.bb | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> > index 0097fec7b2..292897ce43 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> > @@ -14,7 +14,7 @@ require recipes-kernel/linux/linux-yocto.inc
> >   # provide this .inc to set specific revisions
> >   include recipes-kernel/linux/linux-yocto-dev-revisions.inc
> >
> > -KBRANCH =3D "v6.10/standard/base"
> > +KBRANCH =3D "v6.11/standard/base"
> >   KMETA =3D "kernel-meta"
> >
> >   SRC_URI =3D "git://
> git.yoctoproject.org/linux-yocto-dev.git;branch=3D${KBRANCH};name=3Dmachi=
ne;protocol=3Dhttps
> <http://git.yoctoproject.org/linux-yocto-dev.git;branch=3D$%7BKBRANCH%7D;=
name=3Dmachine;protocol=3Dhttps>
> \
> > @@ -28,7 +28,7 @@ SRC_URI =3D "git://
> git.yoctoproject.org/linux-yocto-dev.git;branch=3D${KBRANCH};name
> <http://git.yoctoproject.org/linux-yocto-dev.git;branch=3D$%7BKBRANCH%7D;=
name>
> >   SRCREV_machine ?=3D
> '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel",
> "linux-yocto-dev", "${AUTOREV}",
> "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
> >   SRCREV_meta ?=3D
> '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel",
> "linux-yocto-dev", "${AUTOREV}",
> "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
> >
> > -LINUX_VERSION ?=3D "6.10"
> > +LINUX_VERSION ?=3D "6.11"
> >   LINUX_VERSION_EXTENSION ?=3D "-yoctodev-${LINUX_KERNEL_TYPE}"
> >   PV =3D "${LINUX_VERSION}+git"
> >
>
> I haven't tried to compile linux-yocto-dev but I have my own v6.11-rc6
> based kernel recipe.
>
> It failed to build on Scarthgap because I was missing coreutils-native
> (specifically truncate binary) because CONFIG_KALLSYMS was enabled. This
> comes from
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D1472464c6248575bf2d01c7f076b94704bb32c95
>
> It seems there are some config fragments in linux-yocto-cache
> (ktypes/base/base.cfg) with it, so maybe we want to always add the
> dependency (or is there a way to add a build time dependency from an
> .scc file?).
>


Interesting!

I build linux-yocto-dev nightly, so I can confidently say that this isn't
being seen with the reference recipe.

I also do have KALLSYMS in the default .config, so I've worked through the
same new commit and enabling option.

I get truncate in my kernel builds via hosttools, so the dependency
wasn't/isn't needed.

If we do add the dependency, it is best done in the kernel recipes
themselves, as they are versioned and we'll only pull it in when needed.
Eventually, it migrates to a common dependency as all kernels gain the
requirement over time.

That being said, I'd rather not add coreutils as a dependency until I know
it is really required.

If you try building linux-yocto-dev on that same build machine, can you see
if truncate is present in devshell ? I'm not seeing an obvious path through
my host and configuration mods that would have done anything special to
pull it into hosttools.

Bruce


>
> Is there anything I can help with?
>
> Cheers,
> Quentin
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000ca80fb0622de153f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Sep 24, 2024 at 9:02=E2=80=AFAM Quentin Sch=
ulz &lt;<a href=3D"mailto:quentin.schulz@cherry.de" target=3D"_blank">quent=
in.schulz@cherry.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Hi Bruce,<br>
<br>
On 8/11/24 8:04 PM, Bruce Ashfield via <a href=3D"http://lists.openembedded=
.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote=
:<br>
&gt; From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" t=
arget=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt; <br>
&gt; Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gma=
il.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-de=
v.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-dev.bb</a> | 4 ++--<=
br>
&gt;=C2=A0 =C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-d=
ev.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-dev.bb</a> b/meta/r=
ecipes-kernel/linux/<a href=3D"http://linux-yocto-dev.bb" rel=3D"noreferrer=
" target=3D"_blank">linux-yocto-dev.bb</a><br>
&gt; index 0097fec7b2..292897ce43 100644<br>
&gt; --- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-dev.bb" =
rel=3D"noreferrer" target=3D"_blank">linux-yocto-dev.bb</a><br>
&gt; +++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-dev.bb" =
rel=3D"noreferrer" target=3D"_blank">linux-yocto-dev.bb</a><br>
&gt; @@ -14,7 +14,7 @@ require recipes-kernel/linux/linux-yocto.inc<br>
&gt;=C2=A0 =C2=A0# provide this .inc to set specific revisions<br>
&gt;=C2=A0 =C2=A0include recipes-kernel/linux/linux-yocto-dev-revisions.inc=
<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -KBRANCH =3D &quot;v6.10/standard/base&quot;<br>
&gt; +KBRANCH =3D &quot;v6.11/standard/base&quot;<br>
&gt;=C2=A0 =C2=A0KMETA =3D &quot;kernel-meta&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject=
.org/linux-yocto-dev.git;branch=3D$%7BKBRANCH%7D;name=3Dmachine;protocol=3D=
https" rel=3D"noreferrer" target=3D"_blank">git.yoctoproject.org/linux-yoct=
o-dev.git;branch=3D${KBRANCH};name=3Dmachine;protocol=3Dhttps</a> \<br>
&gt; @@ -28,7 +28,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://git.yoctop=
roject.org/linux-yocto-dev.git;branch=3D$%7BKBRANCH%7D;name" rel=3D"norefer=
rer" target=3D"_blank">git.yoctoproject.org/linux-yocto-dev.git;branch=3D${=
KBRANCH};name</a><br>
&gt;=C2=A0 =C2=A0SRCREV_machine ?=3D &#39;${@oe.utils.conditional(&quot;PRE=
FERRED_PROVIDER_virtual/kernel&quot;, &quot;linux-yocto-dev&quot;, &quot;${=
AUTOREV}&quot;, &quot;29594404d7fe73cd80eaa4ee8c43dcc53970c60e&quot;, d)}&#=
39;<br>
&gt;=C2=A0 =C2=A0SRCREV_meta ?=3D &#39;${@oe.utils.conditional(&quot;PREFER=
RED_PROVIDER_virtual/kernel&quot;, &quot;linux-yocto-dev&quot;, &quot;${AUT=
OREV}&quot;, &quot;29594404d7fe73cd80eaa4ee8c43dcc53970c60e&quot;, d)}&#39;=
<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -LINUX_VERSION ?=3D &quot;6.10&quot;<br>
&gt; +LINUX_VERSION ?=3D &quot;6.11&quot;<br>
&gt;=C2=A0 =C2=A0LINUX_VERSION_EXTENSION ?=3D &quot;-yoctodev-${LINUX_KERNE=
L_TYPE}&quot;<br>
&gt;=C2=A0 =C2=A0PV =3D &quot;${LINUX_VERSION}+git&quot;<br>
&gt;=C2=A0 =C2=A0<br>
<br>
I haven&#39;t tried to compile linux-yocto-dev but I have my own v6.11-rc6 =
<br>
based kernel recipe.<br>
<br>
It failed to build on Scarthgap because I was missing coreutils-native <br>
(specifically truncate binary) because CONFIG_KALLSYMS was enabled. This <b=
r>
comes from <br>
<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it/commit/?id=3D1472464c6248575bf2d01c7f076b94704bb32c95" rel=3D"noreferrer=
" target=3D"_blank">https://git.kernel.org/pub/scm/linux/kernel/git/torvald=
s/linux.git/commit/?id=3D1472464c6248575bf2d01c7f076b94704bb32c95</a><br>
<br>
It seems there are some config fragments in linux-yocto-cache <br>
(ktypes/base/base.cfg) with it, so maybe we want to always add the <br>
dependency (or is there a way to add a build time dependency from an <br>
.scc file?).<br></blockquote><div><br></div><div><br></div><div><div class=
=3D"gmail_default" style=3D"font-size:small">Interesting!</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">I build linux-yocto-dev nightly, so I ca=
n confidently say that this isn&#39;t being seen with the reference recipe.=
</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div=
 class=3D"gmail_default" style=3D"font-size:small">I also do have KALLSYMS =
in the default .config, so I&#39;ve worked through the same new commit and =
enabling option.</div><div class=3D"gmail_default" style=3D"font-size:small=
"><br></div><div class=3D"gmail_default" style=3D"font-size:small">I get tr=
uncate in my kernel builds via hosttools, so the dependency wasn&#39;t/isn&=
#39;t needed.</div><div class=3D"gmail_default" style=3D"font-size:small"><=
br></div></div><div class=3D"gmail_default" style=3D"font-size:small">If we=
 do add the dependency, it is best done in the kernel recipes themselves, a=
s they are versioned and we&#39;ll only pull it in when needed. Eventually,=
 it migrates to a common dependency as all kernels gain the requirement ove=
r time.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></d=
iv><div class=3D"gmail_default" style=3D"font-size:small">That being said, =
I&#39;d rather not add coreutils as a dependency until I know it is really =
required.</div><div class=3D"gmail_default" style=3D"font-size:small"><br><=
/div><div class=3D"gmail_default" style=3D"font-size:small">If you try buil=
ding linux-yocto-dev on that same build machine, can you see if truncate is=
 present in devshell ? I&#39;m not seeing an obvious path through my host a=
nd configuration mods that would have done anything special to pull it into=
 hosttools.</div><div class=3D"gmail_default" style=3D"font-size:small"><br=
></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div><d=
iv class=3D"gmail_default" style=3D"font-size:small">=C2=A0<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
<br>
Is there anything I can help with?<br>
<br>
Cheers,<br>
Quentin<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div></div>

--000000000000ca80fb0622de153f--

