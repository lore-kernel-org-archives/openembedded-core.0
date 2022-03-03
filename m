Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 713BFC433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 03:34:22 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.7048.1646278461462657608
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Mar 2022 19:34:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KMaZT+/i;
 spf=pass (domain: gmail.com, ip: 209.85.208.45,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id y11so4369599eda.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Mar 2022 19:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CwivF3rXQZUlBVwjdABOsh6fTV7IETt689jxhaThD+g=;
        b=KMaZT+/i7YZ4lBiV0fW3GcrDFyzKP5nhZUzzJUG14bdkFaVGqzDqKljEWcDrvI5QRZ
         D4ITJpG6WiPxxZhaxgHm/ikGomZA1MycR9j5vR/XdvgJ5hTbIeDcLjqe1a7EheiDfhvi
         6j6Bjif5YNQenC/BJROh1lWPIlcaSqJuy8xWDVweq7P5wVa6ca+YUDGDpSGqofnVnhqC
         laUJZYf55jVQ7D9XKFA1CWYdCjB/vvdXmeQYUclf1Oc+GQC1sMZNcyhjz057lBma0adI
         Jcs9UXKq3H+ldLrjtTkULP/me8EsSXApBhiOeB50xv5J/a/DvuVCpllruP07Z/FkJTJC
         3aZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CwivF3rXQZUlBVwjdABOsh6fTV7IETt689jxhaThD+g=;
        b=cdjAqeuDdWQVBqQn622UqqWLsF/AjTBHaM6BUoZ0TYO5JpdXEUG3aUAvBKPUD0QOPY
         KJfnG09lt/otl+K37VoC9Np2q6oqqhQqwXajvpkxnRrjgiIKxnMBB7YfFd7bSlbkSHi1
         3ecIHGZGYc9yNdtnoPWZp9FG2VCJRUaXRY9jq+EINYVxNAEQefERu3QYgwCuwaOMoTuY
         WNfDgUsAjGU1YbvYtA1AZAs8VYxVmD4SvAQ0i07dHkcxnZj08ae6CcXA8uOPyvTFB4oG
         i8L6QyrdYFJ6dazYWlTd6sCah+7/63LW9nbkCipZYI3+y+N6E4w6c11ra3ywRPWUbQig
         e5cw==
X-Gm-Message-State: AOAM531COpF5sUnGWzz/PT83iOx1tK+On8DHt6uen/e6np1YSCS9NmSB
	d1E7HvcZFvrSRbZuowLEiv3KIJysKcmFI8ynOZY=
X-Google-Smtp-Source: 
 ABdhPJwOD9N8bKgUv403Z8hwwV2BMZ+ww193ZTrFnBvN7g9BDBTSvFRJRiu2hBHuUfySlFOAS48iyBQfCT0+4lV3aRw=
X-Received: by 2002:a05:6402:50ca:b0:413:2a27:6b63 with SMTP id
 h10-20020a05640250ca00b004132a276b63mr32193152edb.349.1646278459320; Wed, 02
 Mar 2022 19:34:19 -0800 (PST)
MIME-Version: 1.0
References: 
 <CADkTA4N0NaDoS5e5+E92vkNXdQ9AsUxc7zH=Sd+9X=hcq3BPhQ@mail.gmail.com>
 <3986.1646150091898772204@lists.openembedded.org>
 <CADkTA4NKK0OXXnJSrpD7Vg-UQoygUR1ZPXaGOqKtJ9kmyGSukg@mail.gmail.com>
 <9a15b064-6962-4f12-aa41-890f9890d64b@gherzan.com>
In-Reply-To: <9a15b064-6962-4f12-aa41-890f9890d64b@gherzan.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 2 Mar 2022 22:34:07 -0500
Message-ID: 
 <CADkTA4Ph0hfZTGBj0cTPLCSUUYZLX-RO1dcvjpJi1uuzGDpkGA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] go.bbclass: Allow network in do_compile
To: Andrei Gherzan <andrei@gherzan.com>
Cc: lukas.funke@weidmueller.com,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 03:34:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162633

On Wed, Mar 2, 2022 at 4:57 PM Andrei Gherzan <andrei@gherzan.com> wrote:
>
>
> Mar 1, 2022 20:15:52 Bruce Ashfield <bruce.ashfield@gmail.com>:
>
> > On Tue, Mar 1, 2022 at 10:54 AM <lukas.funke@weidmueller.com> wrote:
> >>
> >> On Tue, Mar 1, 2022 at 02:14 PM, Bruce Ashfield wrote:
> >>
> >> On Tue, Mar 1, 2022 at 6:42 AM Andrei Gherzan <andrei@gherzan.com> wro=
te:
> >>
> >>
> >> On Tue, 1 Mar 2022, at 01:55, Bruce Ashfield wrote:
> >>
> >> On Mon, Feb 28, 2022 at 8:17 PM Bruce Ashfield via
> >> lists.openembedded.org
> >> <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
> >>
> >>
> >> On Mon, Feb 28, 2022 at 6:54 PM Andrei Gherzan <andrei@gherzan.com> wr=
ote:
> >>
> >>
> >> From: Andrei Gherzan <andrei.gherzan@huawei.com>
> >>
> >> Compile pulls in the go.mod list requiring network. Without this, do
> >> compile would fail with a similar error to the following:
> >>
> >> dial tcp: lookup proxy.golang.org: Temporary failure in name resolutio=
n
> >>
> >> This is something that needs to be carried in your own layers, IMHO it
> >> isn't appropriate for core.
> >>
> >> It isn't about the fetching, it is the entire gap in functionality
> >> that we are missing if go starts fetching dependencies during compile.
> >>
> >> A further thought is that if this is for go.mod issues, there is the
> >> go-mod.bbclass.
> >>
> >> Perhaps enabling it in that class and doing a bbwarn about go fetching
> >> dependencies would be appropriate ?
> >>
> >> Otherwise, someone may not know that this is happening and that a no
> >> network configuration has no chance of working.
> >>
> >> I reckon that is reasonable. I'll personally go down the recipe level =
to workaround this change but understanding and agreeing with the reasoning=
 behind this change, I want to invest a bit into trying to find a proper so=
lution in the core. Bruce, I know you invested a fair amount of time into t=
his already. Would you be willing to sync up and see how we can work togeth=
er in tackling this?
> >>
> >> Definitely, more ideas are good. In fact, I think there are probably
> >> several approaches that can co-exist, depending on what a
> >> recipe/developer needs.
> >>
> >> I'm in the Eastern time zone here, and will try and grab folks on IRC
> >> to have a level set
> >>
> >> Bruce
> >>
> >> Added Zyga to CC as he is also interested in this as part of his go de=
velopment activities.
> >>
> >> Thanks,
> >> Andrei
> >>
> >>
> >>
> >> --
> >> - Thou shalt not follow the NULL pointer, for chaos and madness await
> >> thee at its end
> >> - "Use the force Harry" - Gandalf, Star Trek II
> >>
> >> The problem in allowing downloads during compile (e.g. by go) is, that=
 it leads to non-reproducable builds. I'm currently facing the same issue a=
nd would like to have a reproducable go *offline* build.
> >> I would like to propose two ideas to workaround the go-compile fetchin=
g issue:
> >>
> >> First:
> >> - Fetch go-dependencies using go.mod file from 'proxy.golang.org' (e.g=
. by writing a seperate go fetcher or a wget-fetcher) and unpack the depend=
encies into go projects 'vendor' folder. This forces go to compile offline.=
 However, one have to generate the 'modules.txt' file in the vendor folder =
'manually' during unpack. This is error prone, as there is no official docu=
mentation how this format should look like. Anyway, I've tried this approac=
h and it works for me.
> >>
> >> Second:
> >> - Fetch go-dependencies using go.mod file from 'proxy.golang.org' (e.g=
. by writing a seperate go fetcher) and unpack the dependencies into a loca=
l (workdir) go-path. This seemed a good solution for me as the go-path is w=
ell defined. But for some reason 'go'  fetches the zip-files during compile=
 into it's download-cache AGAIN, even if the source is already unpacked in =
the go-path. I'll assume this is required to verify the source files integr=
ity?! With this approach one have to adapt 'go' to suppress this download b=
ehaviour.
> >>
> >
> > I've been doing offline builds using a constructed vendor/ directory
> > and generated modules.txt.
> >
> > The only difference between what I have working and what you are
> > suggesting (type 1), is that I've gone directly to the sources and
> > constructed the vendor directory using the OE git fetcher. That allows
> > all functionality to continue to work that is part of OEcore, and the
> > build to continue.  Switching out the git fetches for tarballs would
> > be possible, I just wasn't sure how to use the proxied modules (and I
> > wanted the history for debug).
> >
> > I've never had any issues with the modules.txt, as I generate it at
> > the same time as the git fetch lines for the SRC_URI. I've also not
> > been using information from the go.mod directly from go.proxy.org, it
> > is information I've generated from a clone of the project and dumped
> > via go mod. There's likely improvements I can do there, but with what
> > I'm doing, I'm going directly to the source of the projects and doing
> > clones, which keeps everything clear of the go infrastructure.
> >
> > I have a utility that I'm still cleaning up that generates the SRC_URI
> > lines, as well as the modules.txt, when I resolve a few nagging
> > issues, I'll make the WIP scripts available.
> >
> > Other projects (BSD, etc), have been doing different sorts of
> > constructed vendor directories, but they are similar in approach.
> >
> > For the short term (i.e. the upcoming release), that is pretty much
> > all we can do. There isn't enough time to implement a new go fetcher
> > backend for bitbake.
> >
> > In the end, how we fetch and place the dependencies is a transport, so
> > whether or not we fetch them ourselves, or let go do it, that part is
> > largely the same.
> >
> > For now (short term), I favour vendor/, as it is workable, but not
> > perfect. It isn't exactly efficient or pretty, but at least it seems
> > to produce correct output, and allows all of the project capabilities
> > to work. And of course, the approach will continue to work regardless
> > of development on other go.mod elements.
>
> After reflecting on this for a while I reckon this is the fastest way for=
ward while addressing the reproducibility issue. I'm wondering what we can =
do in terms of compliance? Maybe we can turn the script you were talking ab=
out into a recipe generator that also deals with this by querying the licen=
ses of all the dependencies (direct and indirect).

That was my rough plan, generate a recipe or have it generate  an
include that recipes pull in, there are some repeating patterns go
modules, so there is some re-use to be found.

I roughed out a process for it to work with k3s, and have a working
updated recipe that creates a vendor/ directory and doesn't touch the
network during the actual build.

There's definitely efficiencies to be found, as the first fetch is
quite long, and there's some i/o required as the fetches secondarily
shuffled into place that go expects in a vendor directory.

I'm trying to complete a second recipe with the generated SRC_URI
entries now (nerdctl) and I ran into an issue with the script where
some repeated fetches were breaking the vendor directory creation. I
need to spend time with that on Thursday, but after I sort that out,
I can remove the curse words from the script and do a bit of cleanup.
There's plenty of bugs, and alternate ways things can operate (maybe
some of the packaged go modules versus git, etc, etc), but since those
choices don't required bitbake/fetcher or other core changes, we have
a bit of time to iterate on a workable approach.

Bruce

>
> That being said, how can I help? It seems that there is an existing WIP s=
tate on this. Can I take something from it? Maybe help with cleaning up the=
 script?
> --
> Andrei Gherzan
> gpg: rsa4096/D4D94F67AD0E9640



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

