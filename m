Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2748C54E58
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 14:25:51 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.64090.1710167143940646448
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Mar 2024 07:25:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VdJ71BkS;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-29a5f100c1aso2383470a91.0
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 07:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710167143; x=1710771943; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iayrB6658Zhlil1jN/MsOGs9rg6q6t972xl3sIhorro=;
        b=VdJ71BkSSw27uO35ykM4yK7nOJxS+CCwuTXSEaHAWWdULCcrPVDcvucMIaIiEYQ1wl
         v1C7SNJAbZD5ng9oPs7cTje5uSglsfiUziFNzgcWnGWd71/pFFn5ZCAjn1UqrAVtscuJ
         Qt+bfqPWYWLdWUJl4HDkAC62/cyiPxsaMIYE9QZXMXquqTYFBG1Uhu0NN00nyWCbEeOq
         W52rDTqrum8F8f8tUCgEexr/1xFJuLxIQcO46S+kWYtv+fxrltHatJUqOnzGKY93snnO
         TB9ghUGybwVQqr6qkT9rtWMR9f1JXhRzfF7yWMrYYnkYxYni4OB1Ns6E6GO+RktLA+AE
         orpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710167143; x=1710771943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iayrB6658Zhlil1jN/MsOGs9rg6q6t972xl3sIhorro=;
        b=rPeXeru7JcMibmuAzPtlb/zah0G5sRpayLD8Ki1EN/42jvY3tj222qbzGysvGQGF6e
         cSV5WadFT0xhEkPn2pJQXeUa7D5T0D10SuLuKVuUgt0OZ3d2DpP5IRkbWgEIHK5fMAjh
         rD0qgZe8G6HR0mVg4raBNMSnQZU6o5GBxBkh2rZDERm2RY0HdGerjhESh5xJed6UYOeF
         MBBDIxPQxGHGQdprhrVE46UYOwxx2Y2JmNmxK7oTDpYtAvT5mMsIATT4Ha4IX6ovRfRV
         e7LCmxpztnYvhOmqgkDf4yMNMvu9lPENg2jDL276FpQP3+0uByP8PEqBFA2yuEOUO1vt
         l6mQ==
X-Gm-Message-State: AOJu0YxcIJS92g7btC+wjkp//HI8HhFBWXfjm0rNWRYmxzzfaW48ayG+
	gI/4lTKabZLNn1JO+aH++swU+GLIMSNJmnPF6BkuNuwK1n/b2bZtRdDiutykj4iYsL94lTJIiXj
	dSUgFKcc7xBxRKKUg3q3ish9snIg=
X-Google-Smtp-Source: AGHT+IEHZc0AC504GDn4ycKgKP6v4BcicI8wzjl5exVfAs6tHwO5oshMujeD3V0/rNdQP5VLmXgfhBrCI7+g6ZvvnZU=
X-Received: by 2002:a17:90a:fa10:b0:29b:976d:b5b2 with SMTP id
 cm16-20020a17090afa1000b0029b976db5b2mr640423pjb.17.1710167143184; Mon, 11
 Mar 2024 07:25:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240311091533.46869-1-christian.taedcke-oss@weidmueller.com>
 <CADkTA4PUzMKk7hJ76Zdz_UTjgCSDFVfpYq6FfHpb_LiRVb4ttw@mail.gmail.com> <6c5e770c-632b-44a7-981d-9d070ef95363@weidmueller.com>
In-Reply-To: <6c5e770c-632b-44a7-981d-9d070ef95363@weidmueller.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 11 Mar 2024 10:25:31 -0400
Message-ID: <CADkTA4M+Rp4mSW7EoePGaQqOOW7scXNBoQk7NTBtPi6=kN0M8g@mail.gmail.com>
Subject: Re: [OE-core][PATCH] kernel-yocto: enable fetching kernel metadata
 using file fetcher
To: "Taedcke, Christian" <christian.taedcke-oss@weidmueller.com>
Cc: openembedded-core@lists.openembedded.org, 
	christian.taedcke@weidmueller.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 14:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196942

On Mon, Mar 11, 2024 at 9:22=E2=80=AFAM Taedcke, Christian
<christian.taedcke-oss@weidmueller.com> wrote:
>
>
>
> On 11.03.2024 13:46, Bruce Ashfield via lists.openembedded.org wrote:
> > On Mon, Mar 11, 2024 at 5:15=E2=80=AFAM Taedcke, Christian
> > <christian.taedcke-oss@weidmueller.com> wrote:
> >>
> >> From: Christian Taedcke <christian.taedcke@weidmueller.com>
> >>
> >> The file fetcher does not support the destsuffix parameter. It does
> >> not rename the supplied folder during the fetch. Therefore the folder
> >> name (i.e. basepath) is added to the kernel-meta search directories.
> >>
> >
> > What's the benefit ? I need to understand what you are trying to
> > do that requires this.
>
> In a BSP layer for a custom machine we use the linux-yocto kernel.
> In the BSP layer the file /recipes-kernel/linux/linux-yocto_6.1.bbappend
> adds a local folder containing kernel metatdata to the SRC_URI:

Definitely a valid use-case!

>
> SRC_URI:append:my-machine =3D "file://my-meta;type=3Dkmeta"
>
> The folder my-meta is a subfolder:
> /recipes-kernel/linux/linux-yocto/my-machine/my-meta
>
> Without this patch we would have to write:
> SRC_URI:append:my-machine =3D " file://my-meta;type=3Dkmeta;destsuffix=3D=
my-meta"
>
> When using a file fetcher for kernel metatdata without this patch the
> destsuffix property would always have to be the same as the folder name
> itself. With this patch we do not need this duplication.

That's the (non-obvious) intentional part of the way that I ended
up implementing the identification of secondary / out of tree
meta-data files or directories that should be treated as feature
directories.

Initially I had more strictly enforced that the destsuffix and
folder name had to match. When it became not as strictly
required, it stayed around to avoid picking up invalid
meta data collections that were unfortunately named in the
SRC_URI. (I'm the one with the unfortunately named
meta-data that wasn't supposed to be pulled in as a kernel
meta directory :))

>
> >
> > Because my first thought is "absolutely not" to changing the way
> > this works.
> >
> > What I see below is possibly going to break out of tree BSP
> > definitions. The combination of kmeta and destsuffix really
> > isn't there to support the git fetcher, it is a keyword combination
> > that I used to indicate a meta-data repository that unfortunately
> > overlaps with the other fetcher parameters.
>
> Ok, that was not clear to me. The comment above the function
> find_kernel_feature_dirs() indicates that the returned value has
> something to do with how/where the fetcher stores the provided metadata:
>
> -> Return the name of the repository as it will be found in WORKDIR

The comments may be out of sync with how it currently works,
there was quite a bit of churn on this during the "early days".

You can see this was also covered recently on the docs mailing
list under: [docs] [PATCH] manuals: kernel-dev: Fix BSP in recipe space

>
> I think there are 2 ways forward:
> 1. Rewrite this patch so it does not affect out of tree BSPs (remove
> exception, still use destsuffix for other fetchers), or

Ideally it needs to still process destsuffix in file mode, but add
a new path that it can work without it being explicitly supplied.

> 2. Drop this patch completely
>
> >
> > The reality is that I won't be able to fully review and test
> > this until after the upcoming release is done, since I need to
> > also see about pulling together some regression tests and
> > submitting them at the same time.
>
> No problem, i am just in the process of upstreaming our in-house
> patches. This is not time-critical. We can continue the discussion after
> the release.

I'll pick this up in a couple of weeks (feel free to ping again), since
I really do need to run quite a few tests and then make them into
some sort of sanity suite .. since I can't really comment that this
might break something, without a way to actually test and show that
it is, or isn't the case.

Bruce

>
> Regards,
> Christian
>
> >
> > Bruce
> >
> >> Signed-off-by: Christian Taedcke <christian.taedcke@weidmueller.com>
> >> ---
> >>   meta/classes-recipe/kernel-yocto.bbclass | 21 ++++++++++++++-------
> >>   1 file changed, 14 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-r=
ecipe/kernel-yocto.bbclass
> >> index 9a86616dad..3cbdf21df8 100644
> >> --- a/meta/classes-recipe/kernel-yocto.bbclass
> >> +++ b/meta/classes-recipe/kernel-yocto.bbclass
> >> @@ -62,8 +62,8 @@ def find_sccs(d):
> >>
> >>       return sources_list
> >>
> >> -# check the SRC_URI for "kmeta" type'd git repositories. Return the n=
ame of
> >> -# the repository as it will be found in WORKDIR
> >> +# check the SRC_URI for "kmeta" type'd git repositories and directori=
es. Return
> >> +# the name of the repository or directory as it will be found in WORK=
DIR
> >>   def find_kernel_feature_dirs(d):
> >>       feature_dirs=3D[]
> >>       fetch =3D bb.fetch2.Fetch([], d)
> >> @@ -71,13 +71,20 @@ def find_kernel_feature_dirs(d):
> >>           urldata =3D fetch.ud[url]
> >>           parm =3D urldata.parm
> >>           type=3D""
> >> +        destdir =3D ""
> >>           if "type" in parm:
> >>               type =3D parm["type"]
> >> -        if "destsuffix" in parm:
> >> -            destdir =3D parm["destsuffix"]
> >> -            if type =3D=3D "kmeta":
> >> -                feature_dirs.append(destdir)
> >> -
> >> +        if type =3D=3D "kmeta":
> >> +            if urldata.type =3D=3D "git":
> >> +                if "destsuffix" in parm:
> >> +                    destdir =3D parm["destsuffix"]
> >> +            elif urldata.type =3D=3D "file":
> >> +                destdir =3D urldata.basepath
> >> +            else:
> >> +                bb.fatal( "unsupported fetcher '%s' used for kernel-m=
etadata" % (urldata.type) )
> >> +        if destdir:
> >> +            feature_dirs.append(destdir)
> >> +
> >>       return feature_dirs
> >>
> >>   # find the master/machine source branch. In the same way that the fe=
tcher proceses
> >> --
> >> 2.34.1
> >>
> >>
> >>
> >>
> >
> >
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196937): https://lists.openembedded.org/g/openembedde=
d-core/message/196937
> Mute This Topic: https://lists.openembedded.org/mt/104859707/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org

> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

