Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C318C001DE
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 17:38:03 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.1616.1690825080664581905
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 10:38:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=T+Ld8xYU;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-4fe0eb0ca75so7624328e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 10:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690825078; x=1691429878;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IQa1rQvo5znqcB0afmoBC861lVKrpQZ0NvIsjSQdx90=;
        b=T+Ld8xYUiyXT93ZD1S8vViP8IvIPa0xaSjUnjpg/ZzFl27zG9haaEp/mxdAkZ45Ahb
         UHjh6DzPGnbEJeMK/zGUkOtHsh1eq8TGM/MuzKMx2eEj2Niziez75RnA2OltKHvIUZ6O
         k+KP4JbVQ8Eb93Bm4p1qOQWOdN7SB9MiW/8NnhFGaVoRj5tzXRQG4v8sVjr3US9RtNiW
         +FADZCLOzro2XiWoHMsEQPcXNrfDfW/bIF9b+nli+JDjfY6tYfcTJO8bxrDQHUPnJKxq
         XtyBLVOq9gn+yRufJvVHh6LL6rdwXJtzS01MXvjhbEzryJz7AoInMO+lyw20lNbjfOQ7
         /NXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690825078; x=1691429878;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IQa1rQvo5znqcB0afmoBC861lVKrpQZ0NvIsjSQdx90=;
        b=K/uDqbU6O1tp7cyYSxK9I3IAOxGCssPVYLy3xZmZEYB1H1pmv/tBDgzgMkJDIpOcLr
         i+fiMw03ghLnhhk8PpygzV2GtQmYi+CRSF9+iIMIr/81vRLXkK0rKccuzBCSQoZyW6YZ
         er5JGzQVB9yPmnTsPmpOR6WU9Z3N+HapqQo2JytLQNPAmMmCeAVT3AoePpYtBQnnnFdt
         Z3m5dPFBqln6vBvu4et+gR+AUQ3CWrZj7pnLe/DbYKT19OHpqErIwlal8aR7uRmGKwvc
         /Q5rlQMvg9cr7Hn8Lik1vtb2FfhWSFIhzbVRVlZQYdwlTIJUtVal8GvF9emyI0OasFBJ
         KDkw==
X-Gm-Message-State: ABy/qLaiWJ7YkgDsZveYDJV9mi5oON47O3dKMCttnsyQp4/76TQDsqsI
	hWHV1iHLpnoAScXB5Dwq3jjieMhscKDLOq6oCMQ=
X-Google-Smtp-Source: APBJJlEVbxb68jcgmIef/vIN4vYnsPCl5huSNOBrbEr/LadGcZGItzn7ttkvY+E0y5S4fU4GCMe62UsA94lmWWHjAWo=
X-Received: by 2002:a19:644e:0:b0:4fe:ecd:494f with SMTP id
 b14-20020a19644e000000b004fe0ecd494fmr344150lfj.33.1690825078232; Mon, 31 Jul
 2023 10:37:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230728204418.4044524-1-luca.boccassi@gmail.com>
 <20230731112736.1238510-1-luca.boccassi@gmail.com> <20230731164010faa31974@mail.local>
 <CAMw=ZnR3L05DSaBGSijuA5-vNXPkriCjdbi02LJsUFmVo-FbHA@mail.gmail.com>
 <202307311713165bd45fd1@mail.local> <CAMw=ZnTCOt1aq-iQLRsgjv5sJL_GYXWW3dNup300B1dbNYnLZw@mail.gmail.com>
 <1777043202ABE7FB.4565@lists.openembedded.org>
In-Reply-To: <1777043202ABE7FB.4565@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 31 Jul 2023 19:37:46 +0200
Message-ID: <CANNYZj_9PaJtAhi1XTMzO8oY9GgxUh6hO+00f0Ph2MUndzBVbA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4] systemd: update to v254
To: alex.kanavin@gmail.com
Cc: Luca Boccassi <luca.boccassi@gmail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 17:38:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185155

A better option: fix the libpam recipe to say:

ANY_OF_DISTRO_FEATURES = "pam systemd"
instead of  current
REQUIRED_DISTRO_FEATURES = "pam"


This should avoid having to fix the tests.

Alex

On Mon, 31 Jul 2023 at 19:33, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> Please do not rapid-send new patches before I get a chance to look
> into what went wrong.
>
> I suppose we have to add pam to REQUIRED_DISTRO_FEATURES in the
> systemd recipe, then fix all the spots where systemd is enabled, but
> pam is not. For example the above is from
> ../meta/lib/oeqa/selftest/cases/overlayfs.py.
>
> Yes, it's also possible to suppress the runtime message through log
> checker exception list, but this would sweep the issue under the
> carpet. Soft failure is still a failure.
>
> Alex
>
> On Mon, 31 Jul 2023 at 19:22, Luca Boccassi <luca.boccassi@gmail.com> wrote:
> >
> > On Mon, 31 Jul 2023 at 18:13, Alexandre Belloni
> > <alexandre.belloni@bootlin.com> wrote:
> > >
> > > On 31/07/2023 17:56:05+0100, Luca Bocassi wrote:
> > > > On Mon, 31 Jul 2023 at 17:40, Alexandre Belloni
> > > > <alexandre.belloni@bootlin.com> wrote:
> > > > >
> > > > > Hello,
> > > > >
> > > > > This causes the following failure:
> > > > >
> > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/5570/steps/14/logs/stdio
> > > > >
> > > > > 2023-07-30 21:25:44,944 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
> > > > >   File "/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/lib/oeqa/selftest/cases/overlayfs.py", line 297, in test_all_required_variables_set
> > > > >     self.assertTrue(line, msg=res.output)
> > > > >   File "/usr/lib/python3.10/unittest/case.py", line 687, in assertTrue
> > > > >     raise self.failureException(msg)
> > > > > AssertionError: None is not true : NOTE: Reconnecting to bitbake server...
> > > > > Loading cache...done.
> > > > > Loaded 0 entries from dependency cache.
> > > > > Parsing recipes...done.
> > > > > Parsing of 954 .bb files complete (0 cached, 954 parsed). 1878 targets, 53 skipped, 0 masked, 0 errors.
> > > > > NOTE: Resolving any missing task queue dependencies
> > > > > ERROR: Nothing RPROVIDES 'pam-plugin-umask' (but /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/recipes-core/systemd/systemd_254.bb RDEPENDS on or otherwise requires it)
> > > > > NOTE: Runtime target 'pam-plugin-umask' is unbuildable, removing...
> > > > > Missing or unbuildable dependency chain was: ['pam-plugin-umask']
> > > > > NOTE: Runtime target 'udev' is unbuildable, removing...
> > > > > Missing or unbuildable dependency chain was: ['udev', 'pam-plugin-umask']
> > > > > NOTE: Runtime target 'packagegroup-core-boot' is unbuildable, removing...
> > > > > Missing or unbuildable dependency chain was: ['packagegroup-core-boot', 'udev', 'pam-plugin-umask']
> > > > > ERROR: Required build target 'core-image-minimal' has no buildable providers.
> > > > > Missing or unbuildable dependency chain was: ['core-image-minimal', 'packagegroup-core-boot', 'udev', 'pam-plugin-umask']
> > > > > Summary: There were 2 ERROR messages, returning a non-zero exit code.
> > > > >
> > > > > It repeats for other runtime tests.
> > > >
> > > > I added that on Alex's request. So it's either that failure, or the
> > > > ignorable log message? I'll send a v5 without the recommends then.
> > >
> > > In any case, you are going to have to fix the tests
> >
> > Which test? There was a warning if the optional pam module is not
> > installed, just ignore it, it's harmless.
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185154): https://lists.openembedded.org/g/openembedded-core/message/185154
> Mute This Topic: https://lists.openembedded.org/mt/100459438/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

