Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19915CF9C6C
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 13:57:38 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.16800.1727272652468787737
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Sep 2024 06:57:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VfHVq8CW;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2d87176316eso730734a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727272652; x=1727877452; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G8oCFpGwhPqgVUiQuvSbTQE3jlz4RTmvgVFIAZW/TBk=;
        b=VfHVq8CW1sfzSc+Cl94+WR2o5IRD2YQ2nvFOWbICYIWeRXT7chLaB9S6IggY7n8sEt
         e7+OxC/FcFwvusat2HT9x0yEOG7Zo5d4+uFwNgH6MPqGA2JLxVxiSjTqS75iDU5ny+WY
         iEOYsJ9yvbh/Fb+wv55fmHTvVX+gljogsofhvQWYAK8mLsmaAHkG2onol+SlrjPY+HwW
         kE+/gywV89Qs9isqfTT/Yqw81akY3A/tUv0fDfvXHjb6YsR9JctI/uP0fBkFPvEcBHSj
         hcgKDD+V3zPb5O2aFsJ+mhlM6cZIrO7Xnt20KbWnZHSHRZrAn2FmIydh0zmQCrzZZLGg
         Azqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727272652; x=1727877452;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G8oCFpGwhPqgVUiQuvSbTQE3jlz4RTmvgVFIAZW/TBk=;
        b=giIMwLTNe6tR3mb9A+ixEglcmfpBQQTFhU9i4qyNEihcvhsTJTuaIp5HJICWjl/UU1
         7L3IUUE40111ForXD1xX/PS+9XctwJm7cIDCSbSAVb0PSbMS7UVovbecRLBnJH1IUgx1
         CPxPXvdbFuylXDCyN5KegxpmAreQbDVhHZ4c05x1blZOrAiVw//kDBWdJn1XZHKn9Zwq
         xgCnTJhb3PodyBg8M3K9MCmRTWOhdCXy6aa/jlMslNJab832eq5LXHlwgK6Ke59B5apL
         8WRnRermTKELRlnw9KRQHqo/yoxfZeKPEaB8UjaYiKY6SIrN7vrePXgGY3MncFsew/TY
         tRIg==
X-Forwarded-Encrypted: i=1; AJvYcCUa65FZ70n5I53MUGY55+Rqwz4rMGk72SsU/cBmVItKhAQKBllRuWd1NlqpHh1jdl304ZYOMG1iKcqiDmR81NPW7A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxNfRdZ+ObJKo+tz7iXgT6khLMmOEPD/aNeUoJ4OcmpOPQdh3tF
	3m26Cr1X6M7piPTyYBkhRHwtbXodejdoKqOEf3SRO777Vc/Zi2IKU2+fzeouCHVt6HJiLDDIZ9m
	WHn5aR84Wo4kb34/peKlOL0r026w=
X-Google-Smtp-Source: AGHT+IEwxWRXt+2kU9pU6rAZk96l6y8cXc9K8wviz8gj74A1BdnLjcAMKHS8FP7FRw2UMmr66kgprO8/o5TezGyVGgU=
X-Received: by 2002:a17:90b:4ace:b0:2d8:85fc:464c with SMTP id
 98e67ed59e1d1-2e05682f720mr10772501a91.11.1727272651527; Wed, 25 Sep 2024
 06:57:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1723399246.git.bruce.ashfield@gmail.com>
 <e1eea6c3ea87aebfdaabf5a987a7290d7e9a4485.1723399246.git.bruce.ashfield@gmail.com>
 <4a44e457-b17b-41c6-8e10-18d9fbea4a88@cherry.de> <CADkTA4NqO5uGBJu7Oe79vurUss8cPBUW7wqVF+wRcj25WEf4vQ@mail.gmail.com>
 <bd0c9228-ac33-4334-ba40-5d739951b14d@cherry.de>
In-Reply-To: <bd0c9228-ac33-4334-ba40-5d739951b14d@cherry.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 25 Sep 2024 09:57:17 -0400
Message-ID: <CADkTA4Mk8wCpLGTEeYZXOp2OFEM2FObwU28bKK3gN=huD_6a+w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/5] linux-yocto-dev: bump to v6.11
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d320880622f200e8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 13:57:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204958

--000000000000d320880622f200e8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 9:37=E2=80=AFAM Quentin Schulz <quentin.schulz@cher=
ry.de>
wrote:

> Hi Bruce,
>
> On 9/24/24 4:11 PM, Bruce Ashfield wrote:
> > On Tue, Sep 24, 2024 at 9:02=E2=80=AFAM Quentin Schulz <quentin.schulz@=
cherry.de
> >
> > wrote:
> >
> >> Hi Bruce,
> >>
> >> On 8/11/24 8:04 PM, Bruce Ashfield via lists.openembedded.org wrote:
> >>> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >>>
> >>> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> >>> ---
> >>>    meta/recipes-kernel/linux/linux-yocto-dev.bb | 4 ++--
> >>>    1 file changed, 2 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> >> b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> >>> index 0097fec7b2..292897ce43 100644
> >>> --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> >>> +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> >>> @@ -14,7 +14,7 @@ require recipes-kernel/linux/linux-yocto.inc
> >>>    # provide this .inc to set specific revisions
> >>>    include recipes-kernel/linux/linux-yocto-dev-revisions.inc
> >>>
> >>> -KBRANCH =3D "v6.10/standard/base"
> >>> +KBRANCH =3D "v6.11/standard/base"
> >>>    KMETA =3D "kernel-meta"
> >>>
> >>>    SRC_URI =3D "git://
> >>
> git.yoctoproject.org/linux-yocto-dev.git;branch=3D${KBRANCH};name=3Dmachi=
ne;protocol=3Dhttps
> <http://git.yoctoproject.org/linux-yocto-dev.git;branch=3D$%7BKBRANCH%7D;=
name=3Dmachine;protocol=3Dhttps>
> >> <
> http://git.yoctoproject.org/linux-yocto-dev.git;branch=3D$%7BKBRANCH%7D;n=
ame=3Dmachine;protocol=3Dhttps
> >
> >> \
> >>> @@ -28,7 +28,7 @@ SRC_URI =3D "git://
> >> git.yoctoproject.org/linux-yocto-dev.git;branch=3D${KBRANCH};name
> <http://git.yoctoproject.org/linux-yocto-dev.git;branch=3D$%7BKBRANCH%7D;=
name>
> >> <
> http://git.yoctoproject.org/linux-yocto-dev.git;branch=3D$%7BKBRANCH%7D;n=
ame
> >
> >>>    SRCREV_machine ?=3D
> >> '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel",
> >> "linux-yocto-dev", "${AUTOREV}",
> >> "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
> >>>    SRCREV_meta ?=3D
> >> '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel",
> >> "linux-yocto-dev", "${AUTOREV}",
> >> "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
> >>>
> >>> -LINUX_VERSION ?=3D "6.10"
> >>> +LINUX_VERSION ?=3D "6.11"
> >>>    LINUX_VERSION_EXTENSION ?=3D "-yoctodev-${LINUX_KERNEL_TYPE}"
> >>>    PV =3D "${LINUX_VERSION}+git"
> >>>
> >>
> >> I haven't tried to compile linux-yocto-dev but I have my own v6.11-rc6
> >> based kernel recipe.
> >>
> >> It failed to build on Scarthgap because I was missing coreutils-native
> >> (specifically truncate binary) because CONFIG_KALLSYMS was enabled. Th=
is
> >> comes from
> >>
> >>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D1472464c6248575bf2d01c7f076b94704bb32c95
> >>
> >> It seems there are some config fragments in linux-yocto-cache
> >> (ktypes/base/base.cfg) with it, so maybe we want to always add the
> >> dependency (or is there a way to add a build time dependency from an
> >> .scc file?).
> >>
> >
> >
> > Interesting!
> >
> > I build linux-yocto-dev nightly, so I can confidently say that this isn=
't
> > being seen with the reference recipe.
> >
> > I also do have KALLSYMS in the default .config, so I've worked through
> the
> > same new commit and enabling option.
> >
> > I get truncate in my kernel builds via hosttools, so the dependency
> > wasn't/isn't needed.
> >
>
> truncate isn't in HOSTTOOLS in any release yet, just master.
>
> c.f.
>
> https://git.openembedded.org/openembedded-core/commit/?id=3D522000ce5c4f0=
201cbe42d7826b6a8489ed10117
>
> This means people won't be able to build 6.11 and later with
> CONFIG_KALLSYMS enabled in Scarthgap and earlier releases...
>
> ... unless we backport this patch to still supported releases?
>
> BTW, I could reproduce on Scarthgap by checking out poky in its
> scarthgap branch, then running `git checkout origin/master --
> meta/recipes-kernel/linux/linux-yocto-dev.bb`, then adding
> `PREFERRED_PROVIDER_virtual/kernel=3D"linux-yocto-dev"` to conf/local.con=
f
> and then running `MACHINE=3Dqemuarm64 bitbake linux-yocto-dev` from eithe=
r
> a kas-container (4.3.2) or Debian Bullseye.
>

Right. I only target linux-yocto-dev at the latest master where we do all
our testing. The support matrix of ever newer kernels against the older
releases can get complicated, but we can at least say a given release
supports the reference kernels + the reference -dev kernel version.

Anything more we do on a case by case basis.

I'd go with that simple host tool addition, rather than adding
coreutils-native
as a dependency.

I have a patch locally that can test hosttools and if truncate is missing
conditionally add the dependency. That balances the speed vs supporting
non-default host configuration.

Bruce


>
> > If we do add the dependency, it is best done in the kernel recipes
> > themselves, as they are versioned and we'll only pull it in when needed=
.
> > Eventually, it migrates to a common dependency as all kernels gain the
> > requirement over time.
> >
> > That being said, I'd rather not add coreutils as a dependency until I
> know
> > it is really required.
> >
> > If you try building linux-yocto-dev on that same build machine, can you
> see
> > if truncate is present in devshell ? I'm not seeing an obvious path
> through
>
> Sadly, kas-container doesn't allow me to run -c devshell :/ (well it
> does, but then does nothing :) ).
>
> truncate is available within the container though.
>
> Cheers,
> Quentin
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000d320880622f200e8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Sep 25, 2024 at 9:37=E2=80=AFAM Quentin Sch=
ulz &lt;<a href=3D"mailto:quentin.schulz@cherry.de">quentin.schulz@cherry.d=
e</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Hi Bruce,<br>
<br>
On 9/24/24 4:11 PM, Bruce Ashfield wrote:<br>
&gt; On Tue, Sep 24, 2024 at 9:02=E2=80=AFAM Quentin Schulz &lt;<a href=3D"=
mailto:quentin.schulz@cherry.de" target=3D"_blank">quentin.schulz@cherry.de=
</a>&gt;<br>
&gt; wrote:<br>
&gt; <br>
&gt;&gt; Hi Bruce,<br>
&gt;&gt;<br>
&gt;&gt; On 8/11/24 8:04 PM, Bruce Ashfield via <a href=3D"http://lists.ope=
nembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org<=
/a> wrote:<br>
&gt;&gt;&gt; From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmai=
l.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashf=
ield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 meta/recipes-kernel/linux/<a href=3D"http://linux=
-yocto-dev.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-dev.bb</a> =
| 4 ++--<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<b=
r>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux=
-yocto-dev.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-dev.bb</a><=
br>
&gt;&gt; b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-dev.bb" =
rel=3D"noreferrer" target=3D"_blank">linux-yocto-dev.bb</a><br>
&gt;&gt;&gt; index 0097fec7b2..292897ce43 100644<br>
&gt;&gt;&gt; --- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-=
dev.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-dev.bb</a><br>
&gt;&gt;&gt; +++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-=
dev.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-dev.bb</a><br>
&gt;&gt;&gt; @@ -14,7 +14,7 @@ require recipes-kernel/linux/linux-yocto.inc=
<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 # provide this .inc to set specific revisions<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 include recipes-kernel/linux/linux-yocto-dev-revi=
sions.inc<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; -KBRANCH =3D &quot;v6.10/standard/base&quot;<br>
&gt;&gt;&gt; +KBRANCH =3D &quot;v6.11/standard/base&quot;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 KMETA =3D &quot;kernel-meta&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 SRC_URI =3D &quot;git://<br>
&gt;&gt; <a href=3D"http://git.yoctoproject.org/linux-yocto-dev.git;branch=
=3D$%7BKBRANCH%7D;name=3Dmachine;protocol=3Dhttps" rel=3D"noreferrer" targe=
t=3D"_blank">git.yoctoproject.org/linux-yocto-dev.git;branch=3D${KBRANCH};n=
ame=3Dmachine;protocol=3Dhttps</a><br>
&gt;&gt; &lt;<a href=3D"http://git.yoctoproject.org/linux-yocto-dev.git;bra=
nch=3D$%7BKBRANCH%7D;name=3Dmachine;protocol=3Dhttps" rel=3D"noreferrer" ta=
rget=3D"_blank">http://git.yoctoproject.org/linux-yocto-dev.git;branch=3D$%=
7BKBRANCH%7D;name=3Dmachine;protocol=3Dhttps</a>&gt;<br>
&gt;&gt; \<br>
&gt;&gt;&gt; @@ -28,7 +28,7 @@ SRC_URI =3D &quot;git://<br>
&gt;&gt; <a href=3D"http://git.yoctoproject.org/linux-yocto-dev.git;branch=
=3D$%7BKBRANCH%7D;name" rel=3D"noreferrer" target=3D"_blank">git.yoctoproje=
ct.org/linux-yocto-dev.git;branch=3D${KBRANCH};name</a><br>
&gt;&gt; &lt;<a href=3D"http://git.yoctoproject.org/linux-yocto-dev.git;bra=
nch=3D$%7BKBRANCH%7D;name" rel=3D"noreferrer" target=3D"_blank">http://git.=
yoctoproject.org/linux-yocto-dev.git;branch=3D$%7BKBRANCH%7D;name</a>&gt;<b=
r>
&gt;&gt;&gt;=C2=A0 =C2=A0 SRCREV_machine ?=3D<br>
&gt;&gt; &#39;${@oe.utils.conditional(&quot;PREFERRED_PROVIDER_virtual/kern=
el&quot;,<br>
&gt;&gt; &quot;linux-yocto-dev&quot;, &quot;${AUTOREV}&quot;,<br>
&gt;&gt; &quot;29594404d7fe73cd80eaa4ee8c43dcc53970c60e&quot;, d)}&#39;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 SRCREV_meta ?=3D<br>
&gt;&gt; &#39;${@oe.utils.conditional(&quot;PREFERRED_PROVIDER_virtual/kern=
el&quot;,<br>
&gt;&gt; &quot;linux-yocto-dev&quot;, &quot;${AUTOREV}&quot;,<br>
&gt;&gt; &quot;29594404d7fe73cd80eaa4ee8c43dcc53970c60e&quot;, d)}&#39;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; -LINUX_VERSION ?=3D &quot;6.10&quot;<br>
&gt;&gt;&gt; +LINUX_VERSION ?=3D &quot;6.11&quot;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 LINUX_VERSION_EXTENSION ?=3D &quot;-yoctodev-${LI=
NUX_KERNEL_TYPE}&quot;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 PV =3D &quot;${LINUX_VERSION}+git&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; I haven&#39;t tried to compile linux-yocto-dev but I have my own v=
6.11-rc6<br>
&gt;&gt; based kernel recipe.<br>
&gt;&gt;<br>
&gt;&gt; It failed to build on Scarthgap because I was missing coreutils-na=
tive<br>
&gt;&gt; (specifically truncate binary) because CONFIG_KALLSYMS was enabled=
. This<br>
&gt;&gt; comes from<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torvald=
s/linux.git/commit/?id=3D1472464c6248575bf2d01c7f076b94704bb32c95" rel=3D"n=
oreferrer" target=3D"_blank">https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git/commit/?id=3D1472464c6248575bf2d01c7f076b94704bb32c95<=
/a><br>
&gt;&gt;<br>
&gt;&gt; It seems there are some config fragments in linux-yocto-cache<br>
&gt;&gt; (ktypes/base/base.cfg) with it, so maybe we want to always add the=
<br>
&gt;&gt; dependency (or is there a way to add a build time dependency from =
an<br>
&gt;&gt; .scc file?).<br>
&gt;&gt;<br>
&gt; <br>
&gt; <br>
&gt; Interesting!<br>
&gt; <br>
&gt; I build linux-yocto-dev nightly, so I can confidently say that this is=
n&#39;t<br>
&gt; being seen with the reference recipe.<br>
&gt; <br>
&gt; I also do have KALLSYMS in the default .config, so I&#39;ve worked thr=
ough the<br>
&gt; same new commit and enabling option.<br>
&gt; <br>
&gt; I get truncate in my kernel builds via hosttools, so the dependency<br=
>
&gt; wasn&#39;t/isn&#39;t needed.<br>
&gt; <br>
<br>
truncate isn&#39;t in HOSTTOOLS in any release yet, just master.<br>
<br>
c.f. <br>
<a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=3D5220=
00ce5c4f0201cbe42d7826b6a8489ed10117" rel=3D"noreferrer" target=3D"_blank">=
https://git.openembedded.org/openembedded-core/commit/?id=3D522000ce5c4f020=
1cbe42d7826b6a8489ed10117</a><br>
<br>
This means people won&#39;t be able to build 6.11 and later with <br>
CONFIG_KALLSYMS enabled in Scarthgap and earlier releases...<br>
<br>
... unless we backport this patch to still supported releases?<br>
<br>
BTW, I could reproduce on Scarthgap by checking out poky in its <br>
scarthgap branch, then running `git checkout origin/master -- <br>
meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-dev.bb" rel=3D"nore=
ferrer" target=3D"_blank">linux-yocto-dev.bb</a>`, then adding <br>
`PREFERRED_PROVIDER_virtual/kernel=3D&quot;linux-yocto-dev&quot;` to conf/l=
ocal.conf <br>
and then running `MACHINE=3Dqemuarm64 bitbake linux-yocto-dev` from either =
<br>
a kas-container (4.3.2) or Debian Bullseye.<br></blockquote><div><br></div>=
<div><div class=3D"gmail_default" style=3D"font-size:small">Right. I only t=
arget linux-yocto-dev at the latest master where we do all</div><div class=
=3D"gmail_default" style=3D"font-size:small">our testing. The support matri=
x of ever newer kernels against the older</div><div class=3D"gmail_default"=
 style=3D"font-size:small">releases can get complicated, but we can at leas=
t say a given release</div><div class=3D"gmail_default" style=3D"font-size:=
small">supports the reference kernels=C2=A0+ the reference -dev kernel vers=
ion.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div>=
<div class=3D"gmail_default" style=3D"font-size:small">Anything more we do =
on a case by case basis.</div><div class=3D"gmail_default" style=3D"font-si=
ze:small"><br></div></div><div class=3D"gmail_default" style=3D"font-size:s=
mall">I&#39;d go with that simple host tool addition, rather than adding co=
reutils-native</div><div class=3D"gmail_default" style=3D"font-size:small">=
as a dependency.</div><div class=3D"gmail_default" style=3D"font-size:small=
"><br></div><div class=3D"gmail_default" style=3D"font-size:small">I have a=
 patch locally that can test hosttools and if truncate is missing</div><div=
 class=3D"gmail_default" style=3D"font-size:small">conditionally add the de=
pendency. That balances the speed vs supporting</div><div class=3D"gmail_de=
fault" style=3D"font-size:small">non-default host configuration.</div><div =
class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"g=
mail_default" style=3D"font-size:small">Bruce</div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; If we do add the dependency, it is best done in the kernel recipes<br>
&gt; themselves, as they are versioned and we&#39;ll only pull it in when n=
eeded.<br>
&gt; Eventually, it migrates to a common dependency as all kernels gain the=
<br>
&gt; requirement over time.<br>
&gt; <br>
&gt; That being said, I&#39;d rather not add coreutils as a dependency unti=
l I know<br>
&gt; it is really required.<br>
&gt; <br>
&gt; If you try building linux-yocto-dev on that same build machine, can yo=
u see<br>
&gt; if truncate is present in devshell ? I&#39;m not seeing an obvious pat=
h through<br>
<br>
Sadly, kas-container doesn&#39;t allow me to run -c devshell :/ (well it <b=
r>
does, but then does nothing :) ).<br>
<br>
truncate is available within the container though.<br>
<br>
Cheers,<br>
Quentin<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div></div>

--000000000000d320880622f200e8--

