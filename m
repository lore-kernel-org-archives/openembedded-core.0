Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CD8FC83F26
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 18:38:55 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.49205.1753123125748079720
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jul 2025 11:38:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YQrbVkmS;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6fac7147cb8so69024316d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 11:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753123125; x=1753727925; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XGBEDv/KqDVmxv/d8UNVhpeCemXpiBRQ+9Lk5w0FORY=;
        b=YQrbVkmSJ9hbdjptZjSWk1g1wE6b9vqndOLMGNLmy97NCzMxE9W+K72GftN2qgZtUY
         IDYg7XAKteHaYouo+6mKZyKvKbGbFALVH9Zi5q+UCzB1V5ijXMxMq8xh88tSSO8QTHe2
         5tZOB8XF6AZlRYxsaZTApjwW28S0pXUrQqh8C4VGtimkk87wgAxTqW805NmftpMCaqpU
         CvyvFAq6nqvNuM9QmYtVm2Li373NJHaw9axcvhCkyWVNqOElu+7lfnsAIHSnscaNfSsF
         YVKSmBPTOsuClzUZRaE41Jb6ReFiTHBFZ+jY6rimFHZ57RmODZ+Y99wyKPo9SYccKZjB
         nnIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753123125; x=1753727925;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XGBEDv/KqDVmxv/d8UNVhpeCemXpiBRQ+9Lk5w0FORY=;
        b=oms5gPE6z0U5LAhuJEAS2W+onmPw5Azv6EVMfROhIYFOR+YDXwj77+lRdebBvNOfza
         7fzhRF4byGJHN7Vz4UefRjeIXcqx7PwN3NZRgLkJInqO+f6icbqon3PQ2aLzHheNtnP9
         qDJ3CEzxaNCyV9hRYaJSN3gsiGQAH0vDMrI9IAB1+RXVQy2tTE7BJlUeKcVNSNEpwbE+
         NRStKQjHK8n5EJS9cPRTMl52NgShuwq+zfVeK2bc32ay/NpXHEgMrUZvZgJz3U4Sc8hW
         kn7ziSIkEWQvjIM3BGQOE+CpUN4WVbDLb9T9iXKxRLFCJXx4EdUXasiX2M5g9OlvJPwK
         bHng==
X-Forwarded-Encrypted: i=1; AJvYcCVgk1fzgdalxZe7W9k6h+TxyARicPPkwDyIXZjUVfl9P7ZCHYLFEXbvfyGQbjvs6uatOZ5oRwGP6y0dw811lW032Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzk+mDWrSQmeEGwMbrqlN+cIGkpU6HxCuuzrgQSs4poh2kL7hAa
	69yXYIDYzFAZxcNnKQV5G1STMRjjHT9o1XcwhkebjLiUQLg4U08xOrSCF+Zf27ApTh3IbnmRv3Y
	mZmgg8bmGe1Q3myb+mGe5uZiQp77Lu8g=
X-Gm-Gg: ASbGnctsersOFBJY2SvABCTAm2YU7XIOcfLCmDThGseUX9nDHTKbB7w3lGWWlGJJhgE
	4akqlNd0brxU7odUx4N7apT5tTDQd5OxTEBqCcAWAzXJ7j96T+hZMH3tOKQDmyvxSL4vTsFn9Uz
	Co4UTFRPQHFZ+FRUmciUSk6I4n7t9r6HLKgqQV8EKxgWdlHk4BLi/cmxJXQBELz4Cyu7On1jw1g
	gapHA==
X-Google-Smtp-Source: AGHT+IF9KzU96H9B2I2nBijSpxrQzeZAzqS4S8yYmmvS80ifieOQgiqmYmvsp3MxBJ9KYh68Tv2e60uipTF78TZQVWU=
X-Received: by 2002:a05:6214:411e:b0:6fa:ce21:cad with SMTP id
 6a1803df08f44-7051a043b75mr190446936d6.18.1753123124514; Mon, 21 Jul 2025
 11:38:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAK5yBb_mX+D24LjOozpm=m_Y=5AhHSX=5OtNdbNHWg99mcuFNw@mail.gmail.com>
 <CANNYZj9R79Um9BvKmZmOrCZLnVaDk3cfO1KHM8bu54mu3F-68Q@mail.gmail.com>
 <c5c7b6cb0ede0893d9c760ebeaaef042c248fcc1.camel@linuxfoundation.org>
 <CANNYZj8r4KOxDO6Z6cCN50ADRiAzBhSx=8rVZfY7ZvWPHdz4EQ@mail.gmail.com> <a37d9f86a948a4b5b63146ddbaf1ac62f3754b69.camel@linuxfoundation.org>
In-Reply-To: <a37d9f86a948a4b5b63146ddbaf1ac62f3754b69.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 21 Jul 2025 20:38:32 +0200
X-Gm-Features: Ac12FXzGf22zbLvvU_mELQjwj4mwKdwyMnWgyvGWX0ChMte-HAR6gzs2QrjhSiE
Message-ID: <CANNYZj9hOzn+P2dEN_yAxKOdru711idpb74kVGWndhSf7gBi0Q@mail.gmail.com>
Subject: Re: [OE-core] Yocto Project Status 1 July. 2025 (WW26)
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 18:38:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220710

On Mon, 21 Jul 2025 at 15:41, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> > This will look much neater and readable as a tree where nested
> > configurations add details to the parent (e.g. adding a BSP layer and
> > picking a particular machine from it). I think that's a rather common
> > use case.
>
> It can be summarised a bit more succinctly i.e.:
>
> distro: ['distro/poky', 'distro/poky-altcfg', 'distro/poky-tiny']
> machine: ['machine/qemux86-64', 'machine/qemuarm64', 'machine/qemuriscv64']
>
> which is why I'm thinking we should perhaps work with this in terms of
> fragments/config selection.

So the above would create a kind of 'config generator' that would
allow any combination of the entries from the two lists?

I'm ok with that, but I would generalize the keyword for such lists to
something like 'fragments-choose-one-of', as the values are just
fragment names and do not require special treatment. It would then
also easily extend to other choose-one-of things like toolchain/clang,
init/systemd, or libc/musl.

> > (I know the tool currently offers no help in discovering its own
> > settings).
>
> No, I mean something different.
>
> In order to speed up builds and reduce network usage, the autobuilder
> has a cache of commonly used git repos such as poky, bitbake and some
> other metadata layers. When cloning, it will first use those cached
> repos, then just do a final pull from upstream, just to ensure
> everything is up to date.
>
> Those cache directories are updated by a cron job. I'd like a way of
> telling bitbake-setup to use such a cache to speed up checkouts and
> reduce network usage.
>
> This feature doesn't need to be that user visible, just available for
> the CI setups to configure. The code for this is in yocto-autobuilder-
> helper.

But bitbake-setup is using bitbake fetcher for network operations,
e.g. fetching and unpacking layers. And as far as I see the bitbake
fetcher provides exactly same download cache function as this custom
mechanism. So you could configure bitbake-setup (with the command I
mentioned in the previous email) to use DL_DIR that is shared via nfs
between all workers and bitbake-setup instances (or even is the same
as autobuilder's global DL_DIR for recipe fetching), and then it will
not touch the network at all if the needed revision is already in
cache, or do a quick incremental git fetch if it isn't (or revision is
floating like master-next or other branch name).

> I'm not convinced anyone will ever really want to configure "all", it
> isn't what users generally want to do.

I'd want to use it if I need to locally run builds for all products of
some company, and there aren't many specified in the config. It's an
option, no one is forced into it.

> I suspect what we need is a single base default configuration and a
> prompt saying "run XXX" to configure fragments X or Y.
>
> We then allow init to take a list of fragments to configure? That would
> mean:
>
> bitbake-setup init poky "machine/qemux86-64 distro/poky-tiny"
>
> would work and we have a way to add new things to the commandline
> relatively easily.

Yes, this should work, as long as the fragments on command line are
all from the choose-one-of lists in the config file.

bitbake-setup should then make a record of what fragments came from
the base config, and what were hand-picked (this probably matters in
status/update operations, and in general should be preserved).

Cheers,
Alex

