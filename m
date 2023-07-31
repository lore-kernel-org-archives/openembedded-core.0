Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EAB1C00528
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 17:33:23 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.1475.1690824797507200185
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 10:33:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=h/1xrMcY;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-4fe0fe622c3so7360852e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 10:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690824796; x=1691429596;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ki0c2g44/ECjAU/RHBhBivF5HSN5maubUU6zVArZveQ=;
        b=h/1xrMcYkO+GWfQabuCSnIg8anwN6DQWEU2K9RzsNVupdFEvBgkjbrhftIEhfFZhU0
         cd0kgTuaT7pUyh6IzGHct5+4dYoKwWFl0OMF8P1Gti8/QH2MEloIFxeXEAgQb70VoRbn
         Cd7CfIQJgHdRTssPojqMKofn4CSa3327z0Jj1z6USd8nXvOwgAX8OH9ZuRJ6KDhrMzCX
         b3arLDC+GIRLyoY+yQjO4ReZPuEDOMtFHF3p1/Tcca2oZRwYbViKZI43zlS+U50QmxCY
         9oIBvZQV2WGW2sLGYzSxdD9qAt8XU03/ytpAn5VvgSyb9kQHEQCO7qOJT7tGJ5bUS0TQ
         zr1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690824796; x=1691429596;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ki0c2g44/ECjAU/RHBhBivF5HSN5maubUU6zVArZveQ=;
        b=DJw8Qnam1keCWakCCFcup9dBpd93AFo6S6sDdNh5yWYGyiLhA8BMEvpfUhXkQRm18M
         k0su+hZGF6QBsINDlBpciEhQkSxCw102K9BK9/k7j8lc4kHOX4DmaDXPCBlV3l26IPs1
         eHeUvAsLSlNv7pwdvLklIiGlhcy2yXR2b7muCF7wx9oUMTGfg5f9i6IWgGGL7GPnuP69
         yKqE4sc62PgI94U59jdT+r8zAk5MY4PllDgLzSwtmUOZxF/+NQ6WnQCFuBSlFarzhppl
         /Sv4eVwTEFLzv7bX+7BAiXHnKRWONdqlcBSDFnH+wExAMjomH/yXzfJVymjnxjsmUOJ5
         Aoag==
X-Gm-Message-State: ABy/qLby7mSGIJVPhbeEpp04Niwv0EPTeqmWilAXYGvC+5vISzea17ZH
	L7SHMdOzf6cAjY/Lf5CSMFXWvGhknVStGzozCvA=
X-Google-Smtp-Source: APBJJlGUJeomVqsZi/NFJeZ4uylAGH2CcwBNNLZfY8uE72wyTnwkuUXgaKjUh6cvmA2AsnWPP3MwNwhvJekoOfebs5I=
X-Received: by 2002:ac2:5e34:0:b0:4fd:d92e:31ca with SMTP id
 o20-20020ac25e34000000b004fdd92e31camr354976lfg.36.1690824795332; Mon, 31 Jul
 2023 10:33:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230728204418.4044524-1-luca.boccassi@gmail.com>
 <20230731112736.1238510-1-luca.boccassi@gmail.com> <20230731164010faa31974@mail.local>
 <CAMw=ZnR3L05DSaBGSijuA5-vNXPkriCjdbi02LJsUFmVo-FbHA@mail.gmail.com>
 <202307311713165bd45fd1@mail.local> <CAMw=ZnTCOt1aq-iQLRsgjv5sJL_GYXWW3dNup300B1dbNYnLZw@mail.gmail.com>
In-Reply-To: <CAMw=ZnTCOt1aq-iQLRsgjv5sJL_GYXWW3dNup300B1dbNYnLZw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 31 Jul 2023 19:33:03 +0200
Message-ID: <CANNYZj-BvdPCWDw+XAHRHmRgDQ+m5V2n16fCgLZhunGXs50N8g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4] systemd: update to v254
To: Luca Boccassi <luca.boccassi@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 17:33:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185154

Please do not rapid-send new patches before I get a chance to look
into what went wrong.

I suppose we have to add pam to REQUIRED_DISTRO_FEATURES in the
systemd recipe, then fix all the spots where systemd is enabled, but
pam is not. For example the above is from
../meta/lib/oeqa/selftest/cases/overlayfs.py.

Yes, it's also possible to suppress the runtime message through log
checker exception list, but this would sweep the issue under the
carpet. Soft failure is still a failure.

Alex

On Mon, 31 Jul 2023 at 19:22, Luca Boccassi <luca.boccassi@gmail.com> wrote:
>
> On Mon, 31 Jul 2023 at 18:13, Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> >
> > On 31/07/2023 17:56:05+0100, Luca Bocassi wrote:
> > > On Mon, 31 Jul 2023 at 17:40, Alexandre Belloni
> > > <alexandre.belloni@bootlin.com> wrote:
> > > >
> > > > Hello,
> > > >
> > > > This causes the following failure:
> > > >
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/5570/steps/14/logs/stdio
> > > >
> > > > 2023-07-30 21:25:44,944 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
> > > >   File "/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/lib/oeqa/selftest/cases/overlayfs.py", line 297, in test_all_required_variables_set
> > > >     self.assertTrue(line, msg=res.output)
> > > >   File "/usr/lib/python3.10/unittest/case.py", line 687, in assertTrue
> > > >     raise self.failureException(msg)
> > > > AssertionError: None is not true : NOTE: Reconnecting to bitbake server...
> > > > Loading cache...done.
> > > > Loaded 0 entries from dependency cache.
> > > > Parsing recipes...done.
> > > > Parsing of 954 .bb files complete (0 cached, 954 parsed). 1878 targets, 53 skipped, 0 masked, 0 errors.
> > > > NOTE: Resolving any missing task queue dependencies
> > > > ERROR: Nothing RPROVIDES 'pam-plugin-umask' (but /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/recipes-core/systemd/systemd_254.bb RDEPENDS on or otherwise requires it)
> > > > NOTE: Runtime target 'pam-plugin-umask' is unbuildable, removing...
> > > > Missing or unbuildable dependency chain was: ['pam-plugin-umask']
> > > > NOTE: Runtime target 'udev' is unbuildable, removing...
> > > > Missing or unbuildable dependency chain was: ['udev', 'pam-plugin-umask']
> > > > NOTE: Runtime target 'packagegroup-core-boot' is unbuildable, removing...
> > > > Missing or unbuildable dependency chain was: ['packagegroup-core-boot', 'udev', 'pam-plugin-umask']
> > > > ERROR: Required build target 'core-image-minimal' has no buildable providers.
> > > > Missing or unbuildable dependency chain was: ['core-image-minimal', 'packagegroup-core-boot', 'udev', 'pam-plugin-umask']
> > > > Summary: There were 2 ERROR messages, returning a non-zero exit code.
> > > >
> > > > It repeats for other runtime tests.
> > >
> > > I added that on Alex's request. So it's either that failure, or the
> > > ignorable log message? I'll send a v5 without the recommends then.
> >
> > In any case, you are going to have to fix the tests
>
> Which test? There was a warning if the optional pam module is not
> installed, just ignore it, it's harmless.

