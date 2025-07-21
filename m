Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D701BC83F1A
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 13:42:03 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.41171.1753105320366422860
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jul 2025 06:42:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=N7KJ4FBo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so30305615e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 06:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1753105319; x=1753710119; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5FdDZpWe5aOH1zGEYXq2fuWT8CQQi4bXggvZjXq7Z/0=;
        b=N7KJ4FBoZHjYikHGqs4ZgYZizbVnfsHbR12uhtMk12IP+pVLOc/U4tnvOzE8VrBuFB
         jJpOkD59nlTGQkdtutxAksgqTZO58ySzRMMSdgUs5oDvt8b0H9KZlpuNUVpVyvQ88GmV
         8/xQxzxq/ZgXFQgzmUhfjnodT3RXBzd9ZMBNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753105319; x=1753710119;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5FdDZpWe5aOH1zGEYXq2fuWT8CQQi4bXggvZjXq7Z/0=;
        b=ssYWdM7NzWryFscmdELtOdL7wDEoWe3AFxPtC3afakDEJ72LRf7/mth3wpzYolyMPV
         KzJlqlkRaZ4vkR+fmqHFO97NhjMXMGQ0qGK26NoBjNaXoJ6iawZxy2aD2XzUDnkbBIS6
         ZISfxVl3rn15PYJtJyevf0WujPwlTG7haNvuOKrsha2QDWIUBGwsXmnOWgVCqQhPsynx
         bwn1JbFO9SJd9XbR9EOEIfvtFkelCtKj+NWCQntn2075PCPSDuc14GsIaiHxtFTySjdj
         lJRMNXd5vTLUzfSLgDxZQUZ6fOiNbnDtidGVKpFGphN2TNKMFv5xFLXhzeaHfnWqEWyE
         fvWA==
X-Forwarded-Encrypted: i=1; AJvYcCWDOnjuAhcXX8u/tLTHB5Ufh81h+k2TvP4ntlYkWrXMpouauqfzlwxYmRrRQnbQRlJ8MhmiBNpLwo5KwYi42N5/ag==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywn9LXkekvYfGsEt56OAvt2uDKetwM00UXLcv1j6Qi/eYXjM5rj
	PRS3ldyVqtaYaea9YCYa4Ky7h+GsRDFDTN12fIP+RU6bI0iaMr37kC7uTon1DVO3qis=
X-Gm-Gg: ASbGnct/kNxU6IgSHxZlx8zCB+M4qTijCWdt5N2I0Zz2SabyTAJQ3PKeGRf0EC4G6Zi
	5KZpmXQlpWj6sdk2t7wR/Wltt/GdsIsnfMDZUVXgivDtw7cBMYdPnJSnEQwKNCFAQxTv/dmdDev
	f8Ar2JPUT7n/b42UOvhxQXowdxa66aRHKqgQtcskNScPOTS04tjr2ZLTFJG3aDh+FfdhtMZBHvi
	Cfjb4wm2oBeVTG+B4ehmkdi9eCZyuIKcfsteTtgm3dxOv9Jy4zv7NWZZv/37DbZX0ERsSCEX9O0
	xZ12Vf+AoxAOe17VYJsrVb20o0XMyf5yEW6I9amID14ReUcpJUlxfkE6nOWvMEtOye3YYnULpf5
	OiE2xneWD8uCfMnVR9Lfoq/s9gxuRTBFIkIYoT8oN4xWhE5jTcFD6TDrO4u9+P5PdO2GmJymp9M
	vPEQcYYv9W/rM=
X-Google-Smtp-Source: AGHT+IHbpZnqssEb2PPPnFHOIkmC7dP1SaPi2LUO5za99SU5x/hX14Nnn/EH0FNbOoYBYa4QD9lz2A==
X-Received: by 2002:a05:600c:5289:b0:456:1904:27f3 with SMTP id 5b1f17b1804b1-45633d0d082mr159113655e9.18.1753105318291;
        Mon, 21 Jul 2025 06:41:58 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3115:2e86:f442:218d? ([2001:8b0:aba:5f3c:3115:2e86:f442:218d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e7f2d4fsm165377925e9.4.2025.07.21.06.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 06:41:57 -0700 (PDT)
Message-ID: <a37d9f86a948a4b5b63146ddbaf1ac62f3754b69.camel@linuxfoundation.org>
Subject: Re: [OE-core] Yocto Project Status 1 July. 2025 (WW26)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
 ",openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Jul 2025 14:41:56 +0100
In-Reply-To: <CANNYZj8r4KOxDO6Z6cCN50ADRiAzBhSx=8rVZfY7ZvWPHdz4EQ@mail.gmail.com>
References: 
	<CAK5yBb_mX+D24LjOozpm=m_Y=5AhHSX=5OtNdbNHWg99mcuFNw@mail.gmail.com>
	 <CANNYZj9R79Um9BvKmZmOrCZLnVaDk3cfO1KHM8bu54mu3F-68Q@mail.gmail.com>
	 <c5c7b6cb0ede0893d9c760ebeaaef042c248fcc1.camel@linuxfoundation.org>
	 <CANNYZj8r4KOxDO6Z6cCN50ADRiAzBhSx=8rVZfY7ZvWPHdz4EQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 13:42:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220694

On Mon, 2025-07-21 at 15:09 +0200, Alexander Kanavin wrote:
> On Mon, 21 Jul 2025 at 12:27, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > > Before that can happen, the tool still needs additional
> > > functionality:
> > >=20
> > > - nested bitbake configurations, that would be an equivalent of
> > > 'templates' in autobuilder's config.json. E.g. a top level base
> > > config
> > > that sets autobuilder-specific fragments for all builds, then an
> > > intemediate config that sets what images and other targets get
> > > build,
> > > then final configs that set target machines.
> >=20
> > I've been looking into this a bit more. I don't think we need to
> > replace the template functionality in the autobuilder, at least not
> > at
> > this time. What we need to do is just switch over to using bitbake-
> > setup to setup poky instead of needing the combo-layer derived
> > repo.
>=20
> That's fine and reduces the time pressure; I somehow thought you
> expect a full end-to-end autobuilder demo of bitbake-setup handling
> both the layer checkout and the build configuration.
>=20
> I'll still implement nested bitbake configurations, they will help
> reduce repetition and clutter e.g. here:
> https://github.com/kanavin/bitbake-setup-configurations/blob/main/yocto-m=
aster.conf.json#L49
>=20
> This will look much neater and readable as a tree where nested
> configurations add details to the parent (e.g. adding a BSP layer and
> picking a particular machine from it). I think that's a rather common
> use case.

It can be summarised a bit more succinctly i.e.:

distro: ['distro/poky', 'distro/poky-altcfg', 'distro/poky-tiny']
machine: ['machine/qemux86-64', 'machine/qemuarm64', 'machine/qemuriscv64']

which is why I'm thinking we should perhaps work with this in terms of
fragments/config selection.

> > > - ability to override git repo locations/revisions from the
> > > command
> > > line. E.g. the config file sets master branches for all repos,
> > > but one
> > > wants to build master-next.
> >=20
> > There are two pieces to this. One is being able to select/override
> > the
> > repo/branch/revision as you mention. Another key piece is being
> > able to
> > point at a local cache of repositories. The tool may handle the
> > latter,
> > I'm just struggling to page in the context.
>=20
> I guess you're looking for 'bitbake-setup change-setting default
> dl-dir /path/to/dl-dir' ?
>=20
> (I know the tool currently offers no help in discovering its own
> settings).

No, I mean something different.

In order to speed up builds and reduce network usage, the autobuilder
has a cache of commonly used git repos such as poky, bitbake and some
other metadata layers. When cloning, it will first use those cached
repos, then just do a final pull from upstream, just to ensure
everything is up to date.

Those cache directories are updated by a cron job. I'd like a way of
telling bitbake-setup to use such a cache to speed up checkouts and
reduce network usage.

This feature doesn't need to be that user visible, just available for
the CI setups to configure. The code for this is in yocto-autobuilder-
helper.


> > > - ability to select a subset of bitbake configurations for
> > > initialization/update. An autobuilder config would specify dozens
> > > of
> > > configurations, but any particular worker machine would only work
> > > on
> > > one of them. There is no need to initialize every bitbake config,
> > > and
> > > it would only add delays and clutter.
> >=20
> > When I did try the tool, I was a bit surprised to see the multiple
> > build directories being created. This also won't scale well.
> >=20
> > I suspect the more user friendly workflow is going to be to create
> > a
> > single build directory and then point the user at the
> > configurations
> > available, i.e. the features (which include the machine/distro
> > selection).
> >=20
> > This is going to be the part of the workflow which is going to make
> > or
> > break the tool and it isn't quite right yet. We have all the
> > underlying
> > pieces now, we just need to expose it to the user in the right way.
> > As
> > it stands, it isn't feeling quite right yet.
>=20
> I agree; initializing everything was simply the easiest way to
> produce the working proof of concept. I didn't want to have to
> 'decide' upfront how this should work.
>=20
> Here's the proposal:
>=20
> - 'bitbake-setup init' will not initialize every bitbake config that
> the json specifies; rather it will print a list of them (if len > 1)
> and ask the user to choose (trivial in python and does not require
> curses or other ui libraries; oe-setup-build already does this with
> templates);
>=20
> - it can also take an optional second parameter to setup a particular
> bitbake configuration non-interactively;
>=20
> - it can also take --all to set up everything like it does now.

I'm not convinced anyone will ever really want to configure "all", it
isn't what users generally want to do.

I suspect what we need is a single base default configuration and a
prompt saying "run XXX" to configure fragments X or Y.

We then allow init to take a list of fragments to configure? That would
mean:

bitbake-setup init poky "machine/qemux86-64 distro/poky-tiny"

would work and we have a way to add new things to the commandline
relatively easily.



>=20
> > > Once all of this in place, config.json could be gradually
> > > transitioned
> > > to defer to bitbake-setup:
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "qemux86-64" : {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "B=
BSETUP" : "qemux86-64",
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
> > >=20
> > > and the code would run that with appropriate build-specific
> > > parameters.
> >=20
> > Or perhaps this just becomes a list of features...
>=20
> The goal for me is allowing easy replication of autobuilder failures
> by anyone who submits patches, so they never have to find the right
> bits to copy-paste in config.json or other obscure places. One idea
> is to have a step that is clearly marked on the buildbot UI: 'look
> here if you want to replicate this build'. When expanded, there are
> clear instructions that require typing as few and as short commands
> as possible - ideally just a single bitbake-setup invocation followed
> by applying the patches-under-test, and then it's also using CDN
> sstate to hopefully get to the fail as quickly as possible.

Currently the autobuilder dumps the local.conf settings in one of the
steps and it is quite clear about which commands it runs, if you know
where to look. I agree it would be nice to simplify that and go a step
or two further and make it clearer.

Keep in mind that many of the builder targets are series of commands,
not just a single command.

Cheers,

Richard

