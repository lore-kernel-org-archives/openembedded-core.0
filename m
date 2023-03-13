Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AB70C61DA4
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 08:29:43 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.14689.1678696175591459599
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 01:29:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=n5bNxneE;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id h9so11736747ljq.2
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 01:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678696174;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cuNLClCnbVYfww0iqn4hkMPuABPcjjruxER/Z8V8v3g=;
        b=n5bNxneEYJBmC6XC/hBEcwoXkcu7ikubuUnvMbBL7yjg3proEpRAuRPBwm7DejgK4f
         CEL7NMPSrwoGXWfPAnAqfQxHrJnor9ecp2/ctGgvbYaMhQF8HQcLBnGjA3F4JUA25H9a
         8TBW+ZOvEYholPjdLFBZ+6yV+ozIEts122BjpVyR1xwHmUeooylhl7WIPHaAxIrEgGVp
         TuU7rcAPjuALE3ZQkRaYKTYv/waQiYHHibR8cI7axLjbgICIIDX9UHxbYjZ0zfuuAdzr
         QSMuGJkDkTIFTKBtJC2uIDp3rX01vrMqRm6/iJBrYnmIk8/+oaQi2spP5qAyzko9XjvR
         zvDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678696174;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cuNLClCnbVYfww0iqn4hkMPuABPcjjruxER/Z8V8v3g=;
        b=Ihy4t7jzOCq6VhqD8YTjVZp82HGakEOLA2nP4f5sC7KOZDGLdcVmHHurJFgnv1SJq4
         ZjWWc4uxvYAHy7Lu3wxCAR3TmgDnABtMsU+PyW6SgTK08E5FMCnBKIazOD32TkxgfSpB
         AHnmlUB2lmB1uvsPYEdF1kDT3FnIlVGQOIs1TDv+e0G/EjhzVbjiFLBVLB7o/RVgIB8a
         j99bTRzOd96147pqEl5jshoUfTPVdDCET0pbT5x4HPZl66YwriUDrZCutPxXpmgVrpQt
         n1HA4O3BNSTBv/XVklvIfZGcbNfqau/gbzdnTQlGrzyeM4JNRLyT5ZToFoj6aif1GYhJ
         hmbQ==
X-Gm-Message-State: AO0yUKUignWh/pEg98Fu1FbEaDTAIyjRML1xhtJPyOALRFyBrIpLCuHJ
	UIIvqteeCXqVEXEHsJgkziVeufWDWe9q4V5VcCY=
X-Google-Smtp-Source: AK7set8TcqeIlgWKNFpPrUrHv9IIGLySL4k/ZmnXSoe47smuIbw/KgOC7K4uZ9y3qEEk7fk+9wXvn92yZ8b1ax+hR/Y=
X-Received: by 2002:a2e:b521:0:b0:294:6de5:e642 with SMTP id
 z1-20020a2eb521000000b002946de5e642mr10171694ljm.3.1678696173510; Mon, 13 Mar
 2023 01:29:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230312065517.61051-1-frederic.martinsons@gmail.com> <CANNYZj9ah1rO9FH3a_m2ftgrDik_NtcLa_15r6+sqD5iwBXsiw@mail.gmail.com>
In-Reply-To: <CANNYZj9ah1rO9FH3a_m2ftgrDik_NtcLa_15r6+sqD5iwBXsiw@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Mon, 13 Mar 2023 09:29:22 +0100
Message-ID: <CA+cAkeqZjC=L=_v-3K4VDtdWKxc3crDaqfwp_30B9KFAVrfJuw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cargo_common.bbclass: do not use buit-in git to
 fetch crates
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 08:29:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178414

Yes I did do that in a first place (because this is what cargo bitbake
give to me in a first place), but for git dependencies this doesn't
work.
So , to take the example again I had that in SRC_URI (after correcting
malformed url as tracked by
https://github.com/meta-rust/cargo-bitbake/issues/41):

"git://git@myserver:7999/myrepo.git;protocol=ssh;nobranch=1;name=my-crate;destsuffix=my-crate"

And also the SRCREV:
SRCREV_FORMAT .= "_my-crate"
SRCREV_my-crate = "main"
EXTRA_OECARGO_PATHS += "${WORKDIR}/my-crate"

But the compile step tried to git clone anyway and so it failed like I
showed in my first email.

On Sun, 12 Mar 2023 at 08:36, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> Not sure if I understand this fully, but network access in do_compile
> is not allowed. You need to place all crates into SRC_URI.
>
> Alex
>
> On Sun, 12 Mar 2023 at 07:55, Frederic Martinsons
> <frederic.martinsons@gmail.com> wrote:
> >
> > From: Frederic Martinsons <frederic.martinsons@gmail.com>
> >
> > When a project has a dependencies from a git repository and ssh
> > access, this kind of thing in Cargo.toml for example:
> >
> > [dependencies]
> > my-crate = { git = "ssh://git@smyserver:7999/myrepo.git, branch="main" }
> >
> > do_compile step failed with authentication error:
> >
> > |     Updating git repository `ssh://git@myserver:7999/myrepo.git`
> > | error: failed to get `my-crate` as a dependency of package `bscli v0.0.1 (/home/fmartinsons/bscli)`
> > |
> > | Caused by:
> > |   failed to load source for dependency `my-crate`
> > |
> > | Caused by:
> > |   Unable to update ssh://git@myserver:7999/myrepo.git?branch=main
> > |
> > | Caused by:
> > |   failed to fetch into: /home/fmartinsons/TAPOS_build/build-tapos/tmp/work/corei7-64-tapos-linux/bscli/v1.0.0+gitAUTOINC+5b5ba2aa3e-r0/cargo_home/git/db/cra-d8e163876777fda6
> > |
> > | Caused by:
> > |   failed to authenticate when downloading repository
> > |
> > |   * attempted ssh-agent authentication, but no usernames succeeded: `git`
> > |
> > |   if the git CLI succeeds then `net.git-fetch-with-cli` may help here
> > |   https://doc.rust-lang.org/cargo/reference/config.html#netgit-fetch-with-cli
> > |
> > | Caused by:
> > |   error authenticating: no auth sock variable; class=Ssh (23)
> >
> > No problem if I run "cargo build" manually.
> >
> > As the compiler suggested, it is corrected by adding git-fetch-with-cli in
> > cargo config file.
> >
> > Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
> > ---
> >  meta/classes-recipe/cargo_common.bbclass | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbclass
> > index f503a001dd..c16aa4934b 100644
> > --- a/meta/classes-recipe/cargo_common.bbclass
> > +++ b/meta/classes-recipe/cargo_common.bbclass
> > @@ -114,6 +114,12 @@ cargo_common_do_configure () {
> >         progress.when = 'always'
> >         progress.width = 80
> >         EOF
> > +
> > +       cat <<- EOF >> ${CARGO_HOME}/config
> > +
> > +       [net]
> > +       git-fetch-with-cli = true
> > +       EOF
> >  }
> >
> >  oe_cargo_fix_env () {
> > --
> > 2.34.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#178375): https://lists.openembedded.org/g/openembedded-core/message/178375
> > Mute This Topic: https://lists.openembedded.org/mt/97555635/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

