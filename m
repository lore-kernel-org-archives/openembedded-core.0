Return-Path: <armccurdy@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EDA5C433EF
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 03:09:55 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web09.80504.1656990584609726443
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 20:09:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hfhm/nAu;
 spf=pass (domain: gmail.com, ip: 209.85.218.52,
 mailfrom: armccurdy@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id n4so63137ejz.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 20:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IfTFvXG92BOXSU8Rb2nGsFV3GYRwxzKxXBlxElP1hT0=;
        b=hfhm/nAuURhulNnjx5+ma+VixfQlQofx34MUT7b4fkdyiGHAUdpC1r+kEo4+M4Tx5y
         F0gRfl+dQkAIXC+JvHhar0Hbi4//gA8N+NiX2buXVSHFvgBA2QAoOWM5qcgzsk4h8q5J
         KkfkqmM6JVQ9BsyLLGK6KklY2zQPFdDHIHnS3BDgvtPmBFKUrY8G6gqo/QDcy5umZI6R
         /jAPKA30CWeKes682zvBljvL9ZysQWsuR49ctRlFvHlH2BjBUHlViI3PKQAUj587/Qib
         6X6kaMeHpYBZI+PhpshGnHYqeg94EKLpHoJo5RcAabzF6LYC0IAGcEt36HP7/HqgpObn
         t0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IfTFvXG92BOXSU8Rb2nGsFV3GYRwxzKxXBlxElP1hT0=;
        b=Bn9/N5aqHn0zWyz1tYKs0APAmT0+k/gj9EazCUOgSKB/wV3l9KSlEJP+8fdz+N8xcI
         9LnRyk8iPzMxf3lzbSYfLixWr491aaJvFInk09hfqkv7q6ChdhBs1M39GRtJbJ49jmU2
         9KnyuIzAHY4cazW7JkbOZ08OlsaOGz+K7M3tV9YDiqNpWfq2EV9ocFkEI0jWhffZA8es
         9o3b5tscoikKX6SavoHfxCRF0kldpp4jwydz4v12KmkhQzGPSNGjcqAiUGcG8V5l6J4T
         TEGaUaJ690Sqk/a2IK5TeGOtYbMLhFiObukS4FVUz3wMAJKdRLupIkbTSUWZygFwGCrV
         kuig==
X-Gm-Message-State: AJIora9QfmClJfoSrsSTO90PH0zI8jtmaMnFYWvlrO2YeSHCqrH62lCo
	22425Fk0OaAPOfa4VBuYdnmXt1x4Ztjsne3D1WA=
X-Google-Smtp-Source: 
 AGRyM1uUToSBnIsnVeiq0NoLduOlvxUJD6p9C9eqy5vP/3L8naZKqNPuFEZJrzBEyGn9eIf5akwAwaYSeJR6ImKzFpY=
X-Received: by 2002:a17:907:3f9d:b0:726:31d9:c872 with SMTP id
 hr29-20020a1709073f9d00b0072631d9c872mr31428791ejc.524.1656990582676; Mon, 04
 Jul 2022 20:09:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220701192449.1358325-1-alex@linutronix.de>
 <329d53233a9966693bc19f821f7f3996a187eced.camel@linuxfoundation.org>
In-Reply-To: 
 <329d53233a9966693bc19f821f7f3996a187eced.camel@linuxfoundation.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 4 Jul 2022 20:09:26 -0700
Message-ID: 
 <CAJ86T=XPx1sVqmaJd+C2q81PV-jgjDK9x=cjrEzqRnGjqEghLw@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] bitbake-layers: add layer
 repositories/revisions save and restore tooling (aka 'layer configuration')
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Jul 2022 03:09:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167633

On Sat, Jul 2, 2022 at 4:13 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> I admit I've been putting off this topic for a long time. I actually
> wrote up something about it about 5 years ago. I sent it to four people
> to get some opinions. The six opinions I got back made me despair. i
> have had a while to think about it though.
>
> The challenge is that everyone has a workflow they like today and they
> will tend to dislike anything that looks different. For that reason I
> think we need a high level tool which can work with the different
> approaches. Once we have that, I suspect we'll see some grow stronger
> and some will wither off, which is probably as it should be through
> natural evolution. The approach Alex has taken here does head in that
> direction but I'm not sure it goes quite far enough to get the fraction
> of users we need on board.
>
> I'm not going to comment directly on Alex's proposal at this point, I'd
> like to put some ideas out there and see what people think of them. I
> think you'll see that I'm in agreement with the idea/direction but I
> have a slightly bigger idea of how to do it, which will both be harder
> to implement but also have a better chance of getting more people on
> board.
>
> So, let me go into a proposal of what I think the tool we need looks
> like. I propose we create a new tool, lets call it "oe-setup". It is a
> standalone project in it's own git repo and it's first command would be
> "init" with a command line looking roughly like:
>
> oe-setup init <project-name>
> oe-setup init <project-name> <target-dir>
> oe-setup init <project-name> <config-name> <target-dir>
> oe-setup init <project-name> <config-url> <target-dir>
> oe-setup init <config-url> <target-dir>
>
> The idea being that the repository has some "pre-canned" idea of
> certain project names, e.g. poky, yoe and whatever else we decide to
> support "out the box" (criteria tbd). Those project names have a
> default pre-canned config, or set of configs (e.g. taking branch/series
> names) so I'd want to see these all work:

My proposal would be to try to reuse Linux kconfig. Users know how to
run "make oldconfig", "make menuconfig", etc and I believe all key
distro / machine configuration along with which meta layers should be
enabled, which branch to use, etc can all be captured within a kconfig
.config file. The task at hand would then become writing a tool to
translate from a .config file to a set of distro, machine, local.conf
config files (and an image recipe?) + drive whichever tool will be
used to fetch meta layer git repos.

The "pre-canned" knowledge of poky, yoe, etc then just becomes a set
of alternative defconfig files. Although if we can generate distro
configs on the fly from a defconfig file then separate meta layers to
hold distro configs starts to become redundant...

As a reminder, here's the Buildroot README:

  https://github.com/buildroot/buildroot/blob/master/README

With those first 2 steps a Buildroot user can effectively create their
own custom distro and machine config... all from within the
user-friendly menuconfig environment. The OE equivalent (Yocto Quick
Start) is not only more complex and only tells a user how to build
someone else's preset configurations. Creating a custom distro and
machine config in OE is beyond the quick start and requires a full
knowledge of bitbake syntax etc, etc.

> oe-setup init poky .
> oe-setup init poky dunfell .
> oe-setup init poky ./my-local-config.json .
> oe-setup init poky http://someserver/my-remote-config.json .
>
> We'd also allow something not in the default like of project names to
> be used directly with a url, or maybe added with an "add-project"
> command. This could work against a user local config file, a bit like
> git does with global config and adding remotes to a repo.
>
> You'll note I haven't made any mention of the tooling these use. The
> reason is that we don't actually care. I'd propose we teach the tool
> about a few common standards (kas, submodules, repo) in the form of
> plugins and then hand off to those tools to do the setup. I'd also
> propose we develop a "native" form where they perhaps aren't needed.
> the nice thing is we can have several "native" forms if needed so if
> one approach isn't working or we need to change it, we can.
>
> We may also want to consider an optional "sub-config" parameter which
> gets passed along to the underlying tool.
>
> One of my conclusions after thinking about this for a long time is we
> have a bootstrap problem. If everyone used git and git worked
> everywhere, things would be easier. They don't and it doesn't. My
> evidence? The bitbake fetcher. Much of the ugliness the bitbake fetcher
> deals with applies to layers as well. Some people need proxy support,
> some need mirror tarballs, some need floating revisions, some need
> complete lock down and so on.
>
> We could simplify the problem and just say those users "can manage". If
> we do that, we're giving up at the first hurdle on the idea what we can
> have a (mostly) universal tool. I'm not sure I'm quite ready to do
> that.
>
> Like most more seasoned developers, I dislike code duplication. We do
> have the fetcher code, which knows something about these issues and it
> even has a test suite with decent coverage. Most users already know how
> to configure it too.
>
> Whilst I don't like it particularly, I'd propose we include a chunk of
> bitbake inside oe-setup (maybe just lib/bb?). How needs discussion. I
> nearly wrote combo-layer here but people might think I'm serious :).
> More seriously, git subtree might be a potential option. We could then
> have bitbake master, or a chunk of it, available to the tool. This
> would then allow us to potentially get out of a variety of different
> firewall/mirror situations, if the appropriate backends were right.
> This gives us the option for fix bugs in the fetcher and update oe-
> setup and still use specific versions of bitbake for the different
> releases as needed.
>
> I'd propose oe-setup be a different kind of project to bitbake,
> hopefully something we could make available via pip for example, again
> to try and help the bootstrap issue for people behind firewalls etc.
> although I would want it usable standalone too. It would be designed to
> be a separate standalone tool installed somewhere once by a user rather
> than associated with a particular build/metadata set like bitbake is.
>
> Beyond init, the question is probably updating. There are probably two
> options, one is an update command to oe-setup and the other is
> deferring to the underlying tool and it should be possible to use
> either depending on the underlying tool and the circumstances.
>
> As for configuration of the build, I've wondered if we add a new level
> of config file, basically dedicating a config file "slot" to the setup
> tooling where config from the setup tool would land (i.e. like
> auto.conf but dedicated to this). I need to think about this piece a
> bit more.
>
> The other side of this would be the generation of the config(s). I'm
> less worried about this piece, it would be done by the people who can
> deal with more complexity and I'm sure we could figure it out. I used
> "json" in the config urls above but I'm aware that yaml is going to be
> a discussion there too. From the oe-setup perspective, it may support
> multiple options since once it knows the tool to pass it off to, it
> doesn't really need to know more.
>
> I'm sure there is more I could write on this topic but I'll stop there
> and see what people think.
>
> Cheers,
>
> Richard
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167548): https://lists.openembedded.org/g/openembedded-core/message/167548
> Mute This Topic: https://lists.openembedded.org/mt/92117681/3619030
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [armccurdy@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

