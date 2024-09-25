Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 409EFCF9C6B
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 14:23:58 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.17401.1727274228547591197
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Sep 2024 07:23:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FXgZIVO8;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2e06fade5eeso526392a91.2
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 07:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727274228; x=1727879028; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nGtXuwDCnWRVZEbtGktZwP2I943UADsx8N102sKgSxM=;
        b=FXgZIVO82FUa4UfTlJlQnWN9SzBUfOAqz8KzaXNIsrNwoK5gRQ7oTv+fO6DFU22gLi
         aqm9Hl6uuXtKJNRD2MPcF3IO7gmHHQXaTSE451TS3F84lRoRa5+SiZjK98QliM846cbx
         OVC2xmzxN1tRbo7wgqflyVhRTkiDFsj6vFnVDn+PyVLyqdUUH9C95feDIhVbDfL5RlHj
         3QYOIeyZsDUWXDl+S3LYAcTlhwJTu9PeaGGjXj8i/oKIPMteH1zTAPKtiLS03FXq6vEU
         vHq8hP7lCvprkGAAav/BcdRFqNMWg6lz5CJ5Nbie41Z46G6CU/HL+BwAed7LBflU9T29
         +rbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727274228; x=1727879028;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nGtXuwDCnWRVZEbtGktZwP2I943UADsx8N102sKgSxM=;
        b=Rt1t0pubuPvWVIWqtbdW3aqRIFivyO/iIkp+0LufcsxFhUBys64lvr9PvQSpEkMTIP
         C+N5sja25ksRstLF4sywvtMLtl0tvknmGMrMxwy1lt07BF0gNtDGytVuJrcmPMBn0ixh
         pttOTws1udX38UCl7qL9YidMsD2jmPFE4p/8tlIlkJ0HlnVggJwoYVzmIbRwWx+q9LaB
         AtIG5CtbQ5/2TG9c0thyR7XekcaDISC+qv5or9cpHKY03fVPC1LL1rcCd5b7W2i+UNRL
         jlLp6hpxTXtCcZe357CrINo0pdd56aLU7baVGK7LcskJmW+Prt+glWjLLmJAYVmesjD7
         mYyw==
X-Forwarded-Encrypted: i=1; AJvYcCVRQHE/4VLYvWvz/m75u66jvxuLrmxW/A7J18GHciJKIHIQVDjxFhZosrVxJLlnERGRxPJL+HCCkTQkQMGQ8oHRJg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyCjFf6Rq+2LOUam5HuJMO76DM/+OHyFzfeXR2uAqBdsv2lLEYF
	P1UnxTeSqSXX2B70zwshwNvsJZsqPrgEMKsCvOPl5+d88W2zliuz3Cit0D8V34qmQ2LCmnSaeeg
	iqwcTtUpahHIMJp3etFkOsyZrats=
X-Google-Smtp-Source: AGHT+IFiNy5ws5fFq3oJXj/xHV3wkriaJ0EBpRJPfegjE+fBCpStzYi+XxXH5MNaUDRuPETniFqESliTHgknKp3QMIM=
X-Received: by 2002:a17:90b:1e53:b0:2c8:5cb7:54e5 with SMTP id
 98e67ed59e1d1-2e06afb8db3mr3707502a91.32.1727274227836; Wed, 25 Sep 2024
 07:23:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1723399246.git.bruce.ashfield@gmail.com>
 <e1eea6c3ea87aebfdaabf5a987a7290d7e9a4485.1723399246.git.bruce.ashfield@gmail.com>
 <4a44e457-b17b-41c6-8e10-18d9fbea4a88@cherry.de> <CADkTA4NqO5uGBJu7Oe79vurUss8cPBUW7wqVF+wRcj25WEf4vQ@mail.gmail.com>
 <bd0c9228-ac33-4334-ba40-5d739951b14d@cherry.de> <CADkTA4Mk8wCpLGTEeYZXOp2OFEM2FObwU28bKK3gN=huD_6a+w@mail.gmail.com>
 <7422f5a8-b872-4f89-ba10-1bdc642993c2@cherry.de>
In-Reply-To: <7422f5a8-b872-4f89-ba10-1bdc642993c2@cherry.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 25 Sep 2024 10:23:36 -0400
Message-ID: <CADkTA4O=fOj3QCzV6VzcSxBg49g8b5nVu=DY6zcbT1Z689EwPg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/5] linux-yocto-dev: bump to v6.11
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c7af390622f25ed6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 14:23:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204960

--000000000000c7af390622f25ed6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 10:07=E2=80=AFAM Quentin Schulz <quentin.schulz@che=
rry.de>
wrote:

> Hi Bruce,
>
> On 9/25/24 3:57 PM, Bruce Ashfield wrote:
> > On Wed, Sep 25, 2024 at 9:37=E2=80=AFAM Quentin Schulz <quentin.schulz@=
cherry.de
> >
> > wrote:
> >
> >> Hi Bruce,
> >>
> >> On 9/24/24 4:11 PM, Bruce Ashfield wrote:
> >>> On Tue, Sep 24, 2024 at 9:02=E2=80=AFAM Quentin Schulz <
> quentin.schulz@cherry.de
> >>>
> >>> wrote:
> >>>
> >>>> Hi Bruce,
> >>>>
> >>>> On 8/11/24 8:04 PM, Bruce Ashfield via lists.openembedded.org wrote:
> >>>>> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >>>>>
> >>>>> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> >>>>> ---
> >>>>>     meta/recipes-kernel/linux/linux-yocto-dev.bb | 4 ++--
> >>>>>     1 file changed, 2 insertions(+), 2 deletions(-)
> >>>>>
> >>>>> diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> >>>> b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> >>>>> index 0097fec7b2..292897ce43 100644
> >>>>> --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> >>>>> +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> >>>>> @@ -14,7 +14,7 @@ require recipes-kernel/linux/linux-yocto.inc
> >>>>>     # provide this .inc to set specific revisions
> >>>>>     include recipes-kernel/linux/linux-yocto-dev-revisions.inc
> >>>>>
> >>>>> -KBRANCH =3D "v6.10/standard/base"
> >>>>> +KBRANCH =3D "v6.11/standard/base"
> >>>>>     KMETA =3D "kernel-meta"
> >>>>>
> >>>>>     SRC_URI =3D "git://
> >>>>
> >>
> git.yoctoproject.org/linux-yocto-dev.git;branch=3D${KBRANCH};name=3Dmachi=
ne;protocol=3Dhttps
> <http://git.yoctoproject.org/linux-yocto-dev.git;branch=3D$%7BKBRANCH%7D;=
name=3Dmachine;protocol=3Dhttps>
> >> <
> http://git.yoctoproject.org/linux-yocto-dev.git;branch=3D$%7BKBRANCH%7D;n=
ame=3Dmachine;protocol=3Dhttps
> >
> >>>> <
> >>
> http://git.yoctoproject.org/linux-yocto-dev.git;branch=3D$%7BKBRANCH%7D;n=
ame=3Dmachine;protocol=3Dhttps
> >>>
> >>>> \
> >>>>> @@ -28,7 +28,7 @@ SRC_URI =3D "git://
> >>>> git.yoctoproject.org/linux-yocto-dev.git;branch=3D${KBRANCH};name
> <http://git.yoctoproject.org/linux-yocto-dev.git;branch=3D$%7BKBRANCH%7D;=
name>
> >> <
> http://git.yoctoproject.org/linux-yocto-dev.git;branch=3D$%7BKBRANCH%7D;n=
ame
> >
> >>>> <
> >>
> http://git.yoctoproject.org/linux-yocto-dev.git;branch=3D$%7BKBRANCH%7D;n=
ame
> >>>
> >>>>>     SRCREV_machine ?=3D
> >>>> '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel",
> >>>> "linux-yocto-dev", "${AUTOREV}",
> >>>> "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
> >>>>>     SRCREV_meta ?=3D
> >>>> '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel",
> >>>> "linux-yocto-dev", "${AUTOREV}",
> >>>> "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
> >>>>>
> >>>>> -LINUX_VERSION ?=3D "6.10"
> >>>>> +LINUX_VERSION ?=3D "6.11"
> >>>>>     LINUX_VERSION_EXTENSION ?=3D "-yoctodev-${LINUX_KERNEL_TYPE}"
> >>>>>     PV =3D "${LINUX_VERSION}+git"
> >>>>>
> >>>>
> >>>> I haven't tried to compile linux-yocto-dev but I have my own v6.11-r=
c6
> >>>> based kernel recipe.
> >>>>
> >>>> It failed to build on Scarthgap because I was missing coreutils-nati=
ve
> >>>> (specifically truncate binary) because CONFIG_KALLSYMS was enabled.
> This
> >>>> comes from
> >>>>
> >>>>
> >>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D1472464c6248575bf2d01c7f076b94704bb32c95
> >>>>
> >>>> It seems there are some config fragments in linux-yocto-cache
> >>>> (ktypes/base/base.cfg) with it, so maybe we want to always add the
> >>>> dependency (or is there a way to add a build time dependency from an
> >>>> .scc file?).
> >>>>
> >>>
> >>>
> >>> Interesting!
> >>>
> >>> I build linux-yocto-dev nightly, so I can confidently say that this
> isn't
> >>> being seen with the reference recipe.
> >>>
> >>> I also do have KALLSYMS in the default .config, so I've worked throug=
h
> >> the
> >>> same new commit and enabling option.
> >>>
> >>> I get truncate in my kernel builds via hosttools, so the dependency
> >>> wasn't/isn't needed.
> >>>
> >>
> >> truncate isn't in HOSTTOOLS in any release yet, just master.
> >>
> >> c.f.
> >>
> >>
> https://git.openembedded.org/openembedded-core/commit/?id=3D522000ce5c4f0=
201cbe42d7826b6a8489ed10117
> >>
> >> This means people won't be able to build 6.11 and later with
> >> CONFIG_KALLSYMS enabled in Scarthgap and earlier releases...
> >>
> >> ... unless we backport this patch to still supported releases?
> >>
> >> BTW, I could reproduce on Scarthgap by checking out poky in its
> >> scarthgap branch, then running `git checkout origin/master --
> >> meta/recipes-kernel/linux/linux-yocto-dev.bb`, then adding
> >> `PREFERRED_PROVIDER_virtual/kernel=3D"linux-yocto-dev"` to conf/local.=
conf
> >> and then running `MACHINE=3Dqemuarm64 bitbake linux-yocto-dev` from ei=
ther
> >> a kas-container (4.3.2) or Debian Bullseye.
> >>
> >
> > Right. I only target linux-yocto-dev at the latest master where we do a=
ll
> > our testing. The support matrix of ever newer kernels against the older
> > releases can get complicated, but we can at least say a given release
> > supports the reference kernels + the reference -dev kernel version.
> >
> > Anything more we do on a case by case basis.
> >
>
> Oh for sure! I wasn't implying we aren't testing appropriately or that
> we need to increase the number of kernels to support per release. Just
> that **some** people (likely me.... :) ) may want to support 6.12 on
> Scarthgap whenever it's out and that will be an issue. The answer to
> that issue could very well be "upstream isn't interested in supporting
> this for already-released versions, just handle this in your layer".
>
> I assume one could simply add HOSTTOOLS +=3D "truncate" in the kernel
> recipe and be done with it? I would be worried to add it globally as it
> could then break/change other stuff since the host's tool would be used
> instead of the one in recipe-sysroot-native (is that even true?)?
>

That would mess with the configuration space from a recipe, and won't
work. It's already gone into use long before the kernel starts to be
parsed and built.


>
> > I'd go with that simple host tool addition, rather than adding
> > coreutils-native
> > as a dependency.
> >
> > I have a patch locally that can test hosttools and if truncate is missi=
ng
> > conditionally add the dependency. That balances the speed vs supporting
> > non-default host configuration.
> >
>
> I'm not planning on using linux-yocto for our products so was hoping for
> a generic solution maybe? If there's one :)
>

I really push back on polluting kernel.bbclass with any version specific
dependencies and changes. It is best handled in the versioned recipes
until it is no longer version specific.


>
> I guess adding truncate to HOSTTOOLS in conf/bitbake.conf in an
> already-released version is just not something we want?
>
>
I personally have no issue with it, the tool is tiny and I'd be shocked if
it wasn't on all the supported hosts for the release(s) in question.

It is far preferable to doing kernel version specific tests and dependencie=
s
and/or adding coreutils-native unconditionally.



> Just looking for guidance so I know which direction to go in 3/4 months
> from now when I'll be supporting 6.12 :)
>

I'd append to HOSTTOOLS in your layer ! Or just copy into your
kernel recipe what I'm about to add to linux-yocto-dev :)

Bruce



>
> Cheers,
> Quentin
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000c7af390622f25ed6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Sep 25, 2024 at 10:07=E2=80=AFAM Quentin Sc=
hulz &lt;<a href=3D"mailto:quentin.schulz@cherry.de">quentin.schulz@cherry.=
de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Hi Bruce,<br>
<br>
On 9/25/24 3:57 PM, Bruce Ashfield wrote:<br>
&gt; On Wed, Sep 25, 2024 at 9:37=E2=80=AFAM Quentin Schulz &lt;<a href=3D"=
mailto:quentin.schulz@cherry.de" target=3D"_blank">quentin.schulz@cherry.de=
</a>&gt;<br>
&gt; wrote:<br>
&gt; <br>
&gt;&gt; Hi Bruce,<br>
&gt;&gt;<br>
&gt;&gt; On 9/24/24 4:11 PM, Bruce Ashfield wrote:<br>
&gt;&gt;&gt; On Tue, Sep 24, 2024 at 9:02=E2=80=AFAM Quentin Schulz &lt;<a =
href=3D"mailto:quentin.schulz@cherry.de" target=3D"_blank">quentin.schulz@c=
herry.de</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Hi Bruce,<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; On 8/11/24 8:04 PM, Bruce Ashfield via <a href=3D"http://l=
ists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembed=
ded.org</a> wrote:<br>
&gt;&gt;&gt;&gt;&gt; From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfi=
eld@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:br=
uce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<=
br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-kernel/linux/<a href=
=3D"http://linux-yocto-dev.bb" rel=3D"noreferrer" target=3D"_blank">linux-y=
octo-dev.bb</a> | 4 ++--<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A01 file changed, 2 insertions(+), 2 =
deletions(-)<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; diff --git a/meta/recipes-kernel/linux/<a href=3D"http=
://linux-yocto-dev.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-dev=
.bb</a><br>
&gt;&gt;&gt;&gt; b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-=
dev.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-dev.bb</a><br>
&gt;&gt;&gt;&gt;&gt; index 0097fec7b2..292897ce43 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/meta/recipes-kernel/linux/<a href=3D"http://linu=
x-yocto-dev.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-dev.bb</a>=
<br>
&gt;&gt;&gt;&gt;&gt; +++ b/meta/recipes-kernel/linux/<a href=3D"http://linu=
x-yocto-dev.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-dev.bb</a>=
<br>
&gt;&gt;&gt;&gt;&gt; @@ -14,7 +14,7 @@ require recipes-kernel/linux/linux-y=
octo.inc<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0# provide this .inc to set specific=
 revisions<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0include recipes-kernel/linux/linux-=
yocto-dev-revisions.inc<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; -KBRANCH =3D &quot;v6.10/standard/base&quot;<br>
&gt;&gt;&gt;&gt;&gt; +KBRANCH =3D &quot;v6.11/standard/base&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0KMETA =3D &quot;kernel-meta&quot;<b=
r>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0SRC_URI =3D &quot;git://<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt; <a href=3D"http://git.yoctoproject.org/linux-yocto-dev.git;branch=
=3D$%7BKBRANCH%7D;name=3Dmachine;protocol=3Dhttps" rel=3D"noreferrer" targe=
t=3D"_blank">git.yoctoproject.org/linux-yocto-dev.git;branch=3D${KBRANCH};n=
ame=3Dmachine;protocol=3Dhttps</a><br>
&gt;&gt; &lt;<a href=3D"http://git.yoctoproject.org/linux-yocto-dev.git;bra=
nch=3D$%7BKBRANCH%7D;name=3Dmachine;protocol=3Dhttps" rel=3D"noreferrer" ta=
rget=3D"_blank">http://git.yoctoproject.org/linux-yocto-dev.git;branch=3D$%=
7BKBRANCH%7D;name=3Dmachine;protocol=3Dhttps</a>&gt;<br>
&gt;&gt;&gt;&gt; &lt;<br>
&gt;&gt; <a href=3D"http://git.yoctoproject.org/linux-yocto-dev.git;branch=
=3D$%7BKBRANCH%7D;name=3Dmachine;protocol=3Dhttps" rel=3D"noreferrer" targe=
t=3D"_blank">http://git.yoctoproject.org/linux-yocto-dev.git;branch=3D$%7BK=
BRANCH%7D;name=3Dmachine;protocol=3Dhttps</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; \<br>
&gt;&gt;&gt;&gt;&gt; @@ -28,7 +28,7 @@ SRC_URI =3D &quot;git://<br>
&gt;&gt;&gt;&gt; <a href=3D"http://git.yoctoproject.org/linux-yocto-dev.git=
;branch=3D$%7BKBRANCH%7D;name" rel=3D"noreferrer" target=3D"_blank">git.yoc=
toproject.org/linux-yocto-dev.git;branch=3D${KBRANCH};name</a><br>
&gt;&gt; &lt;<a href=3D"http://git.yoctoproject.org/linux-yocto-dev.git;bra=
nch=3D$%7BKBRANCH%7D;name" rel=3D"noreferrer" target=3D"_blank">http://git.=
yoctoproject.org/linux-yocto-dev.git;branch=3D$%7BKBRANCH%7D;name</a>&gt;<b=
r>
&gt;&gt;&gt;&gt; &lt;<br>
&gt;&gt; <a href=3D"http://git.yoctoproject.org/linux-yocto-dev.git;branch=
=3D$%7BKBRANCH%7D;name" rel=3D"noreferrer" target=3D"_blank">http://git.yoc=
toproject.org/linux-yocto-dev.git;branch=3D$%7BKBRANCH%7D;name</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0SRCREV_machine ?=3D<br>
&gt;&gt;&gt;&gt; &#39;${@oe.utils.conditional(&quot;PREFERRED_PROVIDER_virt=
ual/kernel&quot;,<br>
&gt;&gt;&gt;&gt; &quot;linux-yocto-dev&quot;, &quot;${AUTOREV}&quot;,<br>
&gt;&gt;&gt;&gt; &quot;29594404d7fe73cd80eaa4ee8c43dcc53970c60e&quot;, d)}&=
#39;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0SRCREV_meta ?=3D<br>
&gt;&gt;&gt;&gt; &#39;${@oe.utils.conditional(&quot;PREFERRED_PROVIDER_virt=
ual/kernel&quot;,<br>
&gt;&gt;&gt;&gt; &quot;linux-yocto-dev&quot;, &quot;${AUTOREV}&quot;,<br>
&gt;&gt;&gt;&gt; &quot;29594404d7fe73cd80eaa4ee8c43dcc53970c60e&quot;, d)}&=
#39;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; -LINUX_VERSION ?=3D &quot;6.10&quot;<br>
&gt;&gt;&gt;&gt;&gt; +LINUX_VERSION ?=3D &quot;6.11&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0LINUX_VERSION_EXTENSION ?=3D &quot;=
-yoctodev-${LINUX_KERNEL_TYPE}&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0PV =3D &quot;${LINUX_VERSION}+git&q=
uot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; I haven&#39;t tried to compile linux-yocto-dev but I have =
my own v6.11-rc6<br>
&gt;&gt;&gt;&gt; based kernel recipe.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; It failed to build on Scarthgap because I was missing core=
utils-native<br>
&gt;&gt;&gt;&gt; (specifically truncate binary) because CONFIG_KALLSYMS was=
 enabled. This<br>
&gt;&gt;&gt;&gt; comes from<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt; <a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torvald=
s/linux.git/commit/?id=3D1472464c6248575bf2d01c7f076b94704bb32c95" rel=3D"n=
oreferrer" target=3D"_blank">https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git/commit/?id=3D1472464c6248575bf2d01c7f076b94704bb32c95<=
/a><br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; It seems there are some config fragments in linux-yocto-ca=
che<br>
&gt;&gt;&gt;&gt; (ktypes/base/base.cfg) with it, so maybe we want to always=
 add the<br>
&gt;&gt;&gt;&gt; dependency (or is there a way to add a build time dependen=
cy from an<br>
&gt;&gt;&gt;&gt; .scc file?).<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Interesting!<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I build linux-yocto-dev nightly, so I can confidently say that=
 this isn&#39;t<br>
&gt;&gt;&gt; being seen with the reference recipe.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I also do have KALLSYMS in the default .config, so I&#39;ve wo=
rked through<br>
&gt;&gt; the<br>
&gt;&gt;&gt; same new commit and enabling option.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I get truncate in my kernel builds via hosttools, so the depen=
dency<br>
&gt;&gt;&gt; wasn&#39;t/isn&#39;t needed.<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; truncate isn&#39;t in HOSTTOOLS in any release yet, just master.<b=
r>
&gt;&gt;<br>
&gt;&gt; c.f.<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"https://git.openembedded.org/openembedded-core/commit/?=
id=3D522000ce5c4f0201cbe42d7826b6a8489ed10117" rel=3D"noreferrer" target=3D=
"_blank">https://git.openembedded.org/openembedded-core/commit/?id=3D522000=
ce5c4f0201cbe42d7826b6a8489ed10117</a><br>
&gt;&gt;<br>
&gt;&gt; This means people won&#39;t be able to build 6.11 and later with<b=
r>
&gt;&gt; CONFIG_KALLSYMS enabled in Scarthgap and earlier releases...<br>
&gt;&gt;<br>
&gt;&gt; ... unless we backport this patch to still supported releases?<br>
&gt;&gt;<br>
&gt;&gt; BTW, I could reproduce on Scarthgap by checking out poky in its<br=
>
&gt;&gt; scarthgap branch, then running `git checkout origin/master --<br>
&gt;&gt; meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-dev.bb" re=
l=3D"noreferrer" target=3D"_blank">linux-yocto-dev.bb</a>`, then adding<br>
&gt;&gt; `PREFERRED_PROVIDER_virtual/kernel=3D&quot;linux-yocto-dev&quot;` =
to conf/local.conf<br>
&gt;&gt; and then running `MACHINE=3Dqemuarm64 bitbake linux-yocto-dev` fro=
m either<br>
&gt;&gt; a kas-container (4.3.2) or Debian Bullseye.<br>
&gt;&gt;<br>
&gt; <br>
&gt; Right. I only target linux-yocto-dev at the latest master where we do =
all<br>
&gt; our testing. The support matrix of ever newer kernels against the olde=
r<br>
&gt; releases can get complicated, but we can at least say a given release<=
br>
&gt; supports the reference kernels + the reference -dev kernel version.<br=
>
&gt; <br>
&gt; Anything more we do on a case by case basis.<br>
&gt; <br>
<br>
Oh for sure! I wasn&#39;t implying we aren&#39;t testing appropriately or t=
hat <br>
we need to increase the number of kernels to support per release. Just <br>
that **some** people (likely me.... :) ) may want to support 6.12 on <br>
Scarthgap whenever it&#39;s out and that will be an issue. The answer to <b=
r>
that issue could very well be &quot;upstream isn&#39;t interested in suppor=
ting <br>
this for already-released versions, just handle this in your layer&quot;.<b=
r>
<br>
I assume one could simply add HOSTTOOLS +=3D &quot;truncate&quot; in the ke=
rnel <br>
recipe and be done with it? I would be worried to add it globally as it <br=
>
could then break/change other stuff since the host&#39;s tool would be used=
 <br>
instead of the one in recipe-sysroot-native (is that even true?)?<br></bloc=
kquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:=
small">That would mess with the configuration space from a recipe, and won&=
#39;t</div><div class=3D"gmail_default" style=3D"font-size:small">work. It&=
#39;s already gone into use long before the kernel starts to be</div></div>=
<div class=3D"gmail_default" style=3D"font-size:small">parsed and built.</d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; I&#39;d go with that simple host tool addition, rather than adding<br>
&gt; coreutils-native<br>
&gt; as a dependency.<br>
&gt; <br>
&gt; I have a patch locally that can test hosttools and if truncate is miss=
ing<br>
&gt; conditionally add the dependency. That balances the speed vs supportin=
g<br>
&gt; non-default host configuration.<br>
&gt; <br>
<br>
I&#39;m not planning on using linux-yocto for our products so was hoping fo=
r <br>
a generic solution maybe? If there&#39;s one :)<br></blockquote><div><br></=
div><div><div class=3D"gmail_default" style=3D"font-size:small">I really pu=
sh back on polluting kernel.bbclass with any version specific</div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">dependencies and changes. It=
 is best handled in the versioned recipes</div></div><div class=3D"gmail_de=
fault" style=3D"font-size:small">until it is no longer version specific.</d=
iv><div class=3D"gmail_default" style=3D"font-size:small">=C2=A0<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I guess adding truncate to HOSTTOOLS in conf/bitbake.conf in an <br>
already-released version is just not something we want?<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">I personally have no issue with it, the tool is tiny and I=
&#39;d be shocked if</div><div class=3D"gmail_default" style=3D"font-size:s=
mall">it wasn&#39;t on all the supported hosts for the release(s) in questi=
on.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">It is far preferable =
to doing kernel version specific tests and dependencies</div><div class=3D"=
gmail_default" style=3D"font-size:small">and/or adding coreutils-native unc=
onditionally.</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
Just looking for guidance so I know which direction to go in 3/4 months <br=
>
from now when I&#39;ll be supporting 6.12 :)<br></blockquote><div><br></div=
><div><div class=3D"gmail_default" style=3D"font-size:small">I&#39;d append=
 to HOSTTOOLS in your layer ! Or just copy into your</div><div class=3D"gma=
il_default" style=3D"font-size:small">kernel recipe what I&#39;m about to a=
dd to linux-yocto-dev :)</div><div class=3D"gmail_default" style=3D"font-si=
ze:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">=
Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
<br>
Cheers,<br>
Quentin<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div></div>

--000000000000c7af390622f25ed6--

