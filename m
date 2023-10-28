Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B98CC0032E
	for <webhook@archiver.kernel.org>; Sat, 28 Oct 2023 12:33:17 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web11.16926.1698496387800735694
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Oct 2023 05:33:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P/Z0yxkv;
 spf=pass (domain: gmail.com, ip: 209.85.166.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-7a94a3b0a49so89709039f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Oct 2023 05:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698496387; x=1699101187; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6q+KFKGyvH2m9V1bAqNTT3u9a6WwsLpz41MAN0fw4s=;
        b=P/Z0yxkvidt+QhJhx3FCUjhQhqq37XfhA2zLLh/Wao9vCxnp+DIvU9TYjxOUXWiEsr
         LZ8BvFKtVp188kaoE3TclI/Dfv7ke0fNmUmnnH4QKGSHFcllPKfsxt24MUQ9RMO6xUNZ
         TJ4rSVOdKuFIOdTbBgB+bKWbTv5Nax6wJgfTNy5WL9/9CGZpDeFu0XHeB7pDmBPCDBGA
         CHEOow0s4yU+en2vin6jVWmB5QxpnaBgntKl5gJl97OXvGgQM4K8AdLSdYA4Q4QrcMCV
         WGANyKYAViZt2tHGx73wbKcP32dhrWChYSMCEU/svJQgeCUH1P6GrKuCjx3iV1MUSq3u
         XLhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698496387; x=1699101187;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K6q+KFKGyvH2m9V1bAqNTT3u9a6WwsLpz41MAN0fw4s=;
        b=oP0LTb7ND9Bm3ojcdfI7rsmWQ9tmz/9G/9inR4PIdFZXhoHgzGESCuextBz2R4nM+r
         urFATBjyGO3rknTNwzN93QqN5eFFdpJmRmEKK+spGDjHfxovZt9RIm9JoEiWd1kxJGU8
         BKyiv5CAhICJ+pmZ29FMQTBatXLDN/OkyxMTImB8EpDUX+JQ3iRX/V12/k/zARVfkSN+
         8M66OeHRecfrXtYUofSgCOVcIUZvZMwa3Rvb8ijlRvqSwLl6p7Z9R48vTzhI0Gghq13L
         1sDtUqXSxah0dSPO0u+bPlo7pSe13gter6pE9SQfvyUBHXzYZ1wmBv4RDMiwMHkumlWw
         Zo0g==
X-Gm-Message-State: AOJu0YynxcjWDYUDuE498Q4SzANKuqUxbdmwoLT/akBOU6NGw+kMAQml
	4B4+cyVTs0s3BMn2RyEnCxMlMoaGVgAXJ9jydTQ=
X-Google-Smtp-Source: AGHT+IHjhF8QcKwi5zvzE6tAr80IUrlYSecbnGCd8EG537Za84fmC80kQA5Z2d6WymiCzwv0DLNC9CluhpeQmHR/+KI=
X-Received: by 2002:a05:6602:15c4:b0:7a6:b272:fd78 with SMTP id
 f4-20020a05660215c400b007a6b272fd78mr7629595iow.10.1698496386729; Sat, 28 Oct
 2023 05:33:06 -0700 (PDT)
MIME-Version: 1.0
References: <20231025223710.93502-1-wak@google.com> <CADkTA4OucgUogtX6tQ21oD6i1qQ+6qq1uJQG3S8NsChATTr3Ww@mail.gmail.com>
 <CAPnigK=VcgCH_gWUy2j3nXSngNXdc32y8FRKRiPSRU-bh57M5w@mail.gmail.com>
 <CADkTA4M90k1pt1Jc6SDLFYQyNgYqDoj_poC33t9byssx=HRP3g@mail.gmail.com> <DB5PR02MB10213AA31EED673AFF57264C8EFDCA@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB10213AA31EED673AFF57264C8EFDCA@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 28 Oct 2023 08:32:55 -0400
Message-ID: <CADkTA4OZ009SOpv90Y5PSUvdCJXcoXuhO21KL2=PYTZCLkghNw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel: Commit without running hooks
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: William Kennington <wak@google.com>, Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Oct 2023 12:33:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189761

On Fri, Oct 27, 2023 at 7:27=E2=80=AFPM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Bruce Ashfield
> > Sent: den 26 oktober 2023 16:26
> > To: William Kennington <wak@google.com>; Richard Purdie
> > <richard.purdie@linuxfoundation.org>
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH] kernel: Commit without running hooks
> >
> > On Thu, Oct 26, 2023 at 6:38=E2=80=AFAM William Kennington <wak@google.=
com> wrote:
> > >
> > > On Wed, Oct 25, 2023 at 7:08=E2=80=AFPM Bruce Ashfield
> > <bruce.ashfield@gmail.com> wrote:
> > > >
> > > > On Wed, Oct 25, 2023 at 6:37=E2=80=AFPM William A. Kennington III v=
ia
> > > > lists.openembedded.org <wak=3Dgoogle.com@lists.openembedded.org> wr=
ote:
> > > > >
> > > > > The hooks are pulled from the impure environment and are often
> > broken in
> > > > > our environments. There is no reason to add extra metadata or ver=
ify
> > the
> > > > > commit message as its arbitrary to turn the tarball into a git re=
po.
> > > >
> > > > But what about the other uses of git ? If the hooks are broken duri=
ng
> > > > the creation step, other uses of git should also be broken.
> > >
> > > The only time hooks are run is for `git commit`. AFAIK our build
> > > process has no other invocations of `git commit`. All other git
> > > operations work fine.
> >
> > Right. There are a few others that you just aren't hitting. There's
> > the git option for patching (for any recipe), and also some use in the
> > kern-tools that you wouldn't see unless you are also patching or
> > doing merges as part of the kernel patch phase.
> >
> > It would be nice to fix them all at the same time.
> >
> > >
> > > >
> > > > We've had the ability to check the git config for quite some time, =
we
> > > > could take it further an inhibit the use of the host config if we a=
re
> > > > worried about breakage like this.
> > >
> > > Maybe this would be the best idea overall for our git support inside
> > > the build system, avoiding the build user global git config. That
> > > probably solves the issue we generally have. I'm okay either way.
> > >
> >
> > Agreed.
> >
> > There's some complexity with git versions and the variables that
> > are available to inhibit local/host/system configuration, but really,
> > if we want to have isolated and reproducible builds, we should
> > provide our own configuration.
> >
> > Richard: Does that sound reasonable to you ? If you want to fix
> > this immediate problem, i don't see any harm in the patch, but it
> > may just mask things and ensure we don't ever fix it fully.
> >
> > William: could you raise a bugzilla (and assign it to me) about
> > git configuration from the user/system influencing our build ? That
> > would ensure we don't forget it completely :)
> >
> > Bruce
>
> I would argue that it can be a bad idea to ignore the user's Git
> configuration. It may, e.g., contain insteadOf settings, which if
> ignored, prevents the build from fetching from the correct sources.
> There may be proxy settings that are needed. There may be hooks
> that are needed. And the list goes on. Trying to avoid problems
> by completely ignoring the user's configuration is likely to open
> up another can of problems.
>

I'd argue that anything critical to the build should be explicitly
configured and part of our environment. We don't really want our
fetchers to pull sources using locally configured values, why would
we let git ?

Relying on a builder or an organization putting these settings
in a git configuration that is part of the host is error prone as
well.

I'd much rather flush out dependencies like this and have
error reports, than to keep them hidden. I'll definitely be
continuing to work on inhibiting the host environment and see
what pops up.

> That said, specifically ignoring the pre-commit and commit-msg
> hooks by specifying -n (or --no-verify as I prefer) to git commit
> is probably a good idea. At least if others are like us and have
> global Git hooks that verify that the commit message follows our
> rules...
>

I only see this as a fallback solution.

Bruce

> //Peter
>
> > > >
> > > > Bruce
> > > >
> > > > >
> > > > > Signed-off-by: William A. Kennington III <wak@google.com>
> > > > > ---
> > > > >  meta/classes-recipe/kernel-yocto.bbclass | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/clas=
ses-recipe/kernel-yocto.bbclass
> > > > > index 4ac977b122..cb9cd26b09 100644
> > > > > --- a/meta/classes-recipe/kernel-yocto.bbclass
> > > > > +++ b/meta/classes-recipe/kernel-yocto.bbclass
> > > > > @@ -408,7 +408,7 @@ do_kernel_checkout() {
> > > > >                 git init
> > > > >                 check_git_config
> > > > >                 git add .
> > > > > -               git commit -q -m "baseline commit: creating repo =
for ${PN}-${PV}"
> > > > > +               git commit -q -n -m "baseline commit: creating re=
po for ${PN}-${PV}"
> > > > >                 git clean -d -f
> > > > >         fi
> > > > >
> > > > > --
> > > > > 2.42.0.820.g83a721a137-goog
> > > >
> > > > --
> > > > - Thou shalt not follow the NULL pointer, for chaos and madness awa=
it thee at its end
> > > > - "Use the force Harry" - Gandalf, Star Trek II
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

