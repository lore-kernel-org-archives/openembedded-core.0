Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBF95C433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 16:46:53 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.13113.1646326012585328008
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 08:46:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CbCH4N9s;
 spf=pass (domain: gmail.com, ip: 209.85.208.51,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id x5so7362772edd.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 08:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=C0iDXXDL53zPybZsUKM0V3E3hs0trC1JtvWrkzCh4z4=;
        b=CbCH4N9s4fNpEZEyWnTSvKamnogI0OmF80BjzxelK7g9+7Kp+2WW4/XmjKeFYJ35cL
         zZJEaN170DJgTxGVgiLtF6aUiy5HsrfFGdqmO2whXJsxIsdAt/PGfNCRSgVlViQvwJhp
         dIl4FUhXtr7zMiorzcrqvOZAcLeDbkdgRLN4iLPgUSpuTUxDUM9Fir5e2T54HKkNAtms
         MZW741kQnLpENKOK7ft8RZENvxGU1ebIakbPQN/xGhd4c2xvqoER6DWTEnQJfakqZDYU
         2q1xIc/zTlHfdsSF7fvdFxSqm42mk7WXk1jhpcBEBXLHO+QJ993+XO+frVCkZcKKue58
         4lBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=C0iDXXDL53zPybZsUKM0V3E3hs0trC1JtvWrkzCh4z4=;
        b=wiAvnSEBb2dSUEwH2zDjhX6yefMGcsKWOZQvynT7gaVhC3rEnlhR5Ela0RqMYQ5YEA
         RPrnLgEjqPvmLzH+AW7hy+Wb8gB6DU/iDm5RcA2pkmoAjIAXrJKsLzbXcwIxXPvSL4dA
         CC4Lv9zPxbG/YfImq/jjphe3nMpLuAFa+4BhXoUmhyFo0UhA6fYDLBcpcI2LmHodV98/
         +1hu1Ppe/Kuzfx4YFMo+K5BRFQpBUTXUFA1AXj08i2bhjqweZx43tb8Tj43m2VD1kEKa
         Mi7DPcSB5mQrom6ACZALZlafpIKHjMJR/DAeKulm7dhTmOcNZObHlsPJJeQOXUBAf4ao
         PGhA==
X-Gm-Message-State: AOAM531rcqyYeDm8wBMHUgDosrbkKw3TQi51pzYftfoOcGrFLaPozmj7
	J/GJDB2NArpkduzQWixegAwACb/FykSDWLGd144=
X-Google-Smtp-Source: 
 ABdhPJy9LYNiQAyW1xng+L5XvzA7K0ySi36qBz0K1OOvaZoNzhRXbyr/VN3PLYXrKvmbsVW7+4hCeelaI7/j+tzTRik=
X-Received: by 2002:a05:6402:1385:b0:413:2bc6:4400 with SMTP id
 b5-20020a056402138500b004132bc64400mr35396616edv.94.1646326010747; Thu, 03
 Mar 2022 08:46:50 -0800 (PST)
MIME-Version: 1.0
References: 
 <CADkTA4Ph0hfZTGBj0cTPLCSUUYZLX-RO1dcvjpJi1uuzGDpkGA@mail.gmail.com>
 <24532.1646320397183558195@lists.openembedded.org>
In-Reply-To: <24532.1646320397183558195@lists.openembedded.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 3 Mar 2022 11:46:39 -0500
Message-ID: 
 <CADkTA4MVEuGLjzk0vgbeMm+DgWCLk+RA9RTfEkn=YG+-kAwh1g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] go.bbclass: Allow network in do_compile
To: lukas.funke@weidmueller.com
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 16:46:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162665

On Thu, Mar 3, 2022 at 10:13 AM <lukas.funke@weidmueller.com> wrote:
>
> On Thu, Mar 3, 2022 at 04:34 AM, Bruce Ashfield wrote:
>
> On Wed, Mar 2, 2022 at 4:57 PM Andrei Gherzan <andrei@gherzan.com> wrote:
>
>
> Mar 1, 2022 20:15:52 Bruce Ashfield <bruce.ashfield@gmail.com>:
>
> On Tue, Mar 1, 2022 at 10:54 AM <lukas.funke@weidmueller.com> wrote:
>
> On Tue, Mar 1, 2022 at 02:14 PM, Bruce Ashfield wrote:
>
> On Tue, Mar 1, 2022 at 6:42 AM Andrei Gherzan <andrei@gherzan.com> wrote:
>
>
> On Tue, 1 Mar 2022, at 01:55, Bruce Ashfield wrote:
>
> On Mon, Feb 28, 2022 at 8:17 PM Bruce Ashfield via
> lists.openembedded.org
> <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>
>
> On Mon, Feb 28, 2022 at 6:54 PM Andrei Gherzan <andrei@gherzan.com> wrote=
:
>
>
> From: Andrei Gherzan <andrei.gherzan@huawei.com>
>
> Compile pulls in the go.mod list requiring network. Without this, do
> compile would fail with a similar error to the following:
>
> dial tcp: lookup proxy.golang.org: Temporary failure in name resolution
>
> This is something that needs to be carried in your own layers, IMHO it
> isn't appropriate for core.
>
> It isn't about the fetching, it is the entire gap in functionality
> that we are missing if go starts fetching dependencies during compile.
>
> A further thought is that if this is for go.mod issues, there is the
> go-mod.bbclass.
>
> Perhaps enabling it in that class and doing a bbwarn about go fetching
> dependencies would be appropriate ?
>
> Otherwise, someone may not know that this is happening and that a no
> network configuration has no chance of working.
>
> I reckon that is reasonable. I'll personally go down the recipe level to =
workaround this change but understanding and agreeing with the reasoning be=
hind this change, I want to invest a bit into trying to find a proper solut=
ion in the core. Bruce, I know you invested a fair amount of time into this=
 already. Would you be willing to sync up and see how we can work together =
in tackling this?
>
> Definitely, more ideas are good. In fact, I think there are probably
> several approaches that can co-exist, depending on what a
> recipe/developer needs.
>
> I'm in the Eastern time zone here, and will try and grab folks on IRC
> to have a level set
>
> Bruce
>
> Added Zyga to CC as he is also interested in this as part of his go devel=
opment activities.
>
> Thanks,
> Andrei
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> The problem in allowing downloads during compile (e.g. by go) is, that it=
 leads to non-reproducable builds. I'm currently facing the same issue and =
would like to have a reproducable go *offline* build.
> I would like to propose two ideas to workaround the go-compile fetching i=
ssue:
>
> First:
> - Fetch go-dependencies using go.mod file from 'proxy.golang.org' (e.g. b=
y writing a seperate go fetcher or a wget-fetcher) and unpack the dependenc=
ies into go projects 'vendor' folder. This forces go to compile offline. Ho=
wever, one have to generate the 'modules.txt' file in the vendor folder 'ma=
nually' during unpack. This is error prone, as there is no official documen=
tation how this format should look like. Anyway, I've tried this approach a=
nd it works for me.
>
> Second:
> - Fetch go-dependencies using go.mod file from 'proxy.golang.org' (e.g. b=
y writing a seperate go fetcher) and unpack the dependencies into a local (=
workdir) go-path. This seemed a good solution for me as the go-path is well=
 defined. But for some reason 'go' fetches the zip-files during compile int=
o it's download-cache AGAIN, even if the source is already unpacked in the =
go-path. I'll assume this is required to verify the source files integrity?=
! With this approach one have to adapt 'go' to suppress this download behav=
iour.
>
> I've been doing offline builds using a constructed vendor/ directory
> and generated modules.txt.
>
> The only difference between what I have working and what you are
> suggesting (type 1), is that I've gone directly to the sources and
> constructed the vendor directory using the OE git fetcher. That allows
> all functionality to continue to work that is part of OEcore, and the
> build to continue. Switching out the git fetches for tarballs would
> be possible, I just wasn't sure how to use the proxied modules (and I
> wanted the history for debug).
>
> I've never had any issues with the modules.txt, as I generate it at
> the same time as the git fetch lines for the SRC_URI. I've also not
> been using information from the go.mod directly from go.proxy.org, it
> is information I've generated from a clone of the project and dumped
> via go mod. There's likely improvements I can do there, but with what
> I'm doing, I'm going directly to the source of the projects and doing
> clones, which keeps everything clear of the go infrastructure.
>
> I have a utility that I'm still cleaning up that generates the SRC_URI
> lines, as well as the modules.txt, when I resolve a few nagging
> issues, I'll make the WIP scripts available.
>
> Other projects (BSD, etc), have been doing different sorts of
> constructed vendor directories, but they are similar in approach.
>
> For the short term (i.e. the upcoming release), that is pretty much
> all we can do. There isn't enough time to implement a new go fetcher
> backend for bitbake.
>
> In the end, how we fetch and place the dependencies is a transport, so
> whether or not we fetch them ourselves, or let go do it, that part is
> largely the same.
>
> For now (short term), I favour vendor/, as it is workable, but not
> perfect. It isn't exactly efficient or pretty, but at least it seems
> to produce correct output, and allows all of the project capabilities
> to work. And of course, the approach will continue to work regardless
> of development on other go.mod elements.
>
> After reflecting on this for a while I reckon this is the fastest way for=
ward while addressing the reproducibility issue. I'm wondering what we can =
do in terms of compliance? Maybe we can turn the script you were talking ab=
out into a recipe generator that also deals with this by querying the licen=
ses of all the dependencies (direct and indirect).
>
> That was my rough plan, generate a recipe or have it generate an
> include that recipes pull in, there are some repeating patterns go
> modules, so there is some re-use to be found.
>
> I roughed out a process for it to work with k3s, and have a working
> updated recipe that creates a vendor/ directory and doesn't touch the
> network during the actual build.
>
> There's definitely efficiencies to be found, as the first fetch is
> quite long, and there's some i/o required as the fetches secondarily
> shuffled into place that go expects in a vendor directory.
>
> I'm trying to complete a second recipe with the generated SRC_URI
> entries now (nerdctl) and I ran into an issue with the script where
> some repeated fetches were breaking the vendor directory creation. I
> need to spend time with that on Thursday, but after I sort that out,
> I can remove the curse words from the script and do a bit of cleanup.
> There's plenty of bugs, and alternate ways things can operate (maybe
> some of the packaged go modules versus git, etc, etc), but since those
> choices don't required bitbake/fetcher or other core changes, we have
> a bit of time to iterate on a workable approach.
>
> Bruce
>
> Bruce, I'm looking forward to review your approach. My biggest concern in=
 fetching the imports from source via git is, that an 'import' my not neces=
sarily relate to a git repository. 'go' supports multiple backends (e.g. hg=
, svn, etc.). That said, an import-path cannot be transformed to a git SRC_=
URI in a 1:1 manner. That's why I ended up downloading the modules from gol=
ang-proxy.
>

I just used git as an example. Any supported OE fetcher can be used. I
haven't run into any source bases that can't be resolved to git so
far, but the generation of other SRC_URI entries is relatively
trivial. Since this is static information and part of the recipe, it
can all be sorted out ahead after the original generation of the
source locations.

Experience with supporting some of the larger go applications has
shown me that the source has made it easier for hot fixes to address
CVE issues. We can easily bump an individual SRCREV or bring in a
patch. It's solvable no matter what the approach, that's just how
we've solved it with the source repos.

I was browsing around the proxy docs, and the API to get modules was
clear to me, do you have a link to an example or a document that
describes it ?

Bruce

> Lukas
>
>
> That being said, how can I help? It seems that there is an existing WIP s=
tate on this. Can I take something from it? Maybe help with cleaning up the=
 script?
> --
> Andrei Gherzan
> gpg: rsa4096/D4D94F67AD0E9640
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162658): https://lists.openembedded.org/g/openembedde=
d-core/message/162658
> Mute This Topic: https://lists.openembedded.org/mt/89464905/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

