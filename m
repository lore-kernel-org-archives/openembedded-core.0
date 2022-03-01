Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52FC3C43219
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 20:15:50 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web08.2117.1646165749076939688
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 12:15:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fVgi3j4+;
 spf=pass (domain: gmail.com, ip: 209.85.218.49,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a23so33774466eju.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 12:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7UDH6kpUASzVmkPq9W775PJpL2ykMqCfCNwmiCtNKzo=;
        b=fVgi3j4+4VftNR5ud5J/GNfSZ7fCKhzxYdgaFYPsHk/OrXlPBu0W4mII52RUv3zXeg
         JkmQ+KBbhtwQn8kIN4Lr9yh8gLNAtzf3HWp4ufrigZ2ZWv/PhziwjR9lah2rnLA/qI/b
         TlT3gcyOmGmWdSm8fmVf96Ra+ZPbcXCfVfTTeC5PYIF4o/c/HpYuKH36O9Ry1A9Mm7DJ
         H8Jh1zNAwtlH9kEZw2+YJ0/Z3vDrlv8Zkp78hJq4Hx+g6l+fVu7MZvLtojF9AVK55Yir
         35O3XCVbh1oz/aGE8z5HoTW7WQDpeOnJBECPrejqpLciD0VrtKGcylZnAId7BxfF4Ejs
         ukCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7UDH6kpUASzVmkPq9W775PJpL2ykMqCfCNwmiCtNKzo=;
        b=DrFR4O2QOwARoF5JFV8xAUAE8IqOpAfjZKHTDRzFiQ6LQ8D/aDvWHAeqCy/o1krzBq
         9JKRhyL2v87JHtFwePydLdggl1A0qfzUb0iitpDCThw4wO6E661Glqq0wm3ud+D4Jerb
         jrQuHzSDDPvQLJZMhuXDldCI4zxkydICxgSFP1YUF4ym6Lnz2fJqi6dRoxxU7oDJcFbi
         jxj2Cenp22/I0zHqfmgNN1UUO5eJv6Zv4zNwSbkickAt8cmCyoPNVQiz1/SU0kHxkKSV
         YihWOhslUq8ChMNS+1dX5srsk4+Le6VmCJQlMKFfQP2DX0iyKf1V8mO4SAZ4HNUlNUXP
         ddJw==
X-Gm-Message-State: AOAM533fMqGK/qqGUCgELcSMyrRPWA+fzAdBTTestNwdWqUeZCcQDBfy
	YrPw859Z4ju/sDuLR30G6AYN9j5WxMisyI+my0s=
X-Google-Smtp-Source: 
 ABdhPJxBzHgqHBBzFAAKuXJ8kYfLjXowJ64tRnfXXWZ1l5QmP4qlnpB3hBy+YGqssjgIouC0mDQ21MgtYT2RTJURi/A=
X-Received: by 2002:a17:906:3e90:b0:6b6:829b:577c with SMTP id
 a16-20020a1709063e9000b006b6829b577cmr21162659ejj.711.1646165747283; Tue, 01
 Mar 2022 12:15:47 -0800 (PST)
MIME-Version: 1.0
References: 
 <CADkTA4N0NaDoS5e5+E92vkNXdQ9AsUxc7zH=Sd+9X=hcq3BPhQ@mail.gmail.com>
 <3986.1646150091898772204@lists.openembedded.org>
In-Reply-To: <3986.1646150091898772204@lists.openembedded.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 1 Mar 2022 15:15:35 -0500
Message-ID: 
 <CADkTA4NKK0OXXnJSrpD7Vg-UQoygUR1ZPXaGOqKtJ9kmyGSukg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] go.bbclass: Allow network in do_compile
To: lukas.funke@weidmueller.com
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 20:15:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162573

On Tue, Mar 1, 2022 at 10:54 AM <lukas.funke@weidmueller.com> wrote:
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
 defined. But for some reason 'go'  fetches the zip-files during compile in=
to it's download-cache AGAIN, even if the source is already unpacked in the=
 go-path. I'll assume this is required to verify the source files integrity=
?! With this approach one have to adapt 'go' to suppress this download beha=
viour.
>

I've been doing offline builds using a constructed vendor/ directory
and generated modules.txt.

The only difference between what I have working and what you are
suggesting (type 1), is that I've gone directly to the sources and
constructed the vendor directory using the OE git fetcher. That allows
all functionality to continue to work that is part of OEcore, and the
build to continue.  Switching out the git fetches for tarballs would
be possible, I just wasn't sure how to use the proxied modules (and I
wanted the history for debug).

I've never had any issues with the modules.txt, as I generate it at
the same time as the git fetch lines for the SRC_URI. I've also not
been using information from the go.mod directly from go.proxy.org, it
is information I've generated from a clone of the project and dumped
via go mod. There's likely improvements I can do there, but with what
I'm doing, I'm going directly to the source of the projects and doing
clones, which keeps everything clear of the go infrastructure.

I have a utility that I'm still cleaning up that generates the SRC_URI
lines, as well as the modules.txt, when I resolve a few nagging
issues, I'll make the WIP scripts available.

Other projects (BSD, etc), have been doing different sorts of
constructed vendor directories, but they are similar in approach.

For the short term (i.e. the upcoming release), that is pretty much
all we can do. There isn't enough time to implement a new go fetcher
backend for bitbake.

In the end, how we fetch and place the dependencies is a transport, so
whether or not we fetch them ourselves, or let go do it, that part is
largely the same.

For now (short term), I favour vendor/, as it is workable, but not
perfect. It isn't exactly efficient or pretty, but at least it seems
to produce correct output, and allows all of the project capabilities
to work. And of course, the approach will continue to work regardless
of development on other go.mod elements.

Cheers,

Bruce

> Please let me know your opinion on these two approaches.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162562): https://lists.openembedded.org/g/openembedde=
d-core/message/162562
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

