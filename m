Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8319E92716
	for <webhook@archiver.kernel.org>; Sat, 27 Dec 2025 18:02:59 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11598.1766858575465856459
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Dec 2025 10:02:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Kghvc2QZ;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-88a26ce6619so86517816d6.3
        for <openembedded-core@lists.openembedded.org>; Sat, 27 Dec 2025 10:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766858574; x=1767463374; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0O21/9BEgOebIp9QpQODm1/kZtUXxXRVF32EBcDiLyk=;
        b=Kghvc2QZFXY4Gk3Zb9IgvNzzxKo4vQM3WZkoF39yrdL0+CvI2cjQqe9KdI1LRhqCD+
         ZOW83tpO5/IWEM/n/ymrhwhLHzzIRgMD1UkrsyWRI4lnmK4FEU5+Zprn7A3c50NNgQ97
         AwVoLP1PqsG48rfmfqIwueePlGOyuTcjCyCbeVr6ihPoxCilYM3aJ/639d9LUsxNWmSN
         vVIz1rofIHSamtv/zc6l7FcCVG04uvWImFDLzx2l844nxxU2TuF58w3Yh1DEVOXyYVut
         k9U/mYpPrh15c8Lk8353V8ANkIrvgnbMWnmCMnttcZo/0kCLQX6/Y4WMIt++XJCq5NHi
         w/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766858574; x=1767463374;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0O21/9BEgOebIp9QpQODm1/kZtUXxXRVF32EBcDiLyk=;
        b=bEuUPSJ4I/SBgNL4xLAyfPldzLepUZ15qu1IYBMG7vVlCuKu60LrKHRkNYbg0H1rd6
         Ln+oSzW7w57XOXPTXWf9x77QqslZkXx9FJ75q4AlklgvpARxp9Vbj8p26AfyFNezJ0V6
         DA8FeJ2kMy2g9dbZbgx3Iwc4dVNyCC8RR3Wd/7N5qvHupM2r1qpNHnBXxw/F8KR+/V9I
         4yfZvv+enrbzBGHgcTbccd3TLFMkarzoYkVr0dyAD/bOMv3YmwSWD5nKtCyMB2/qxKEa
         a1kcwNbABS15FsGFxNhMrOSM4ZeA86E9/8yvgZOMjW6J9z5WxzWxxF3EbMsJMYrC/SST
         MSLw==
X-Gm-Message-State: AOJu0YwuIoKvQfppDMR+/AbcNsNIaYP966ZfUEpF1VXA0COPllvIKc3A
	GAN3K8M7p/Y8as3UGjUCiJGzf6ShyDlBGgm2KaBq618gJ97IStjSQovpbeTSSTbhCoKbjfxKgyC
	n33VINPUA3gs0E7hsOxzYeVPF6N1/u5U=
X-Gm-Gg: AY/fxX4L8Q99luhFXWHmM0dgHCiQnfj8xeQz5EHvIzEFCZQFNsy+fcEzqfomCHBG2VX
	V2Il03+4WbjN9n7a0P2nk6gbqKEX5fQYPhkcEFT/vix3+GGiGd0u7dg79BuDW9m5dkaBSkQIrtw
	Wpr38U5mGBGS31FGNGk0SiYPsJlTZYycgH9XZN1S46qZAEeqm4oV9kJhtlC+ZtM43G+9o28+tht
	lYRX2tONzZVRbnTtSrAIf439VU2oCx55A7oQburLCpX6Yz9nvFg1DicIQSrG36EQsmVcw==
X-Google-Smtp-Source: AGHT+IFx5goX597m5561/UE+YkqAJCabmSJkVqeQDZYzhXNVkyzJe+CWW2NF8FhhDioXvZvNO/o/D9hcEaanlWvGOIo=
X-Received: by 2002:a05:6214:53c2:b0:88a:c1a:94a5 with SMTP id
 6a1803df08f44-88d851fdd47mr439057716d6.1.1766858574390; Sat, 27 Dec 2025
 10:02:54 -0800 (PST)
MIME-Version: 1.0
References: <20251224150805.3312684-1-adrian.freihofer@siemens.com>
 <20251224150805.3312684-3-adrian.freihofer@siemens.com> <CANNYZj96VasQFeLuaP+T0m8WErDWw_x-wuPSg5SMX05hCPzJKg@mail.gmail.com>
 <c0d4dee98ac9272be866e31e201559fabd853c16.camel@gmail.com>
In-Reply-To: <c0d4dee98ac9272be866e31e201559fabd853c16.camel@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 27 Dec 2025 19:02:43 +0100
X-Gm-Features: AQt7F2qj9sGF-0TJHGKeoW_jjGwJK6pTsE4BD14GCLbkv_OPP5FoxaOluIbPR_4
Message-ID: <CANNYZj9Sd7D9rtO-7rBWAmDRcE=HQyPbOPeRn_=kZ7QwYLf9sQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] oe-setup-vscode: improve VSCode
 bitbake-setup compatibility
To: adrian.freihofer@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Dec 2025 18:02:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228578

On Sat, 27 Dec 2025 at 13:06, <adrian.freihofer@gmail.com> wrote:
> My goal is to support making bitbake-setup a first-class user
> experience while still preserving the simple, good old way without it.
> My understanding of the old way is:
>
> git clone poky && cd poky
> . oe-init-build-env

Poky is no longer being updated, so this old way is gone and we don't
need to worry about it. What still exists is checking out the separate
repositories it was made of, usually into the same directory, but not
always, together with any additional layers or other repositories
needed in a given build. So you need to know where that top directory
is, and I would rather avoid guessing that from oe-init-build-env, or
oe-setup-vscode, and instead pass it in explicitly as a command line
parameter, which means running oe-setup-vscode from bitbake-setup
directly.

> We (and many others) use a slightly more advanced but still static
> directory structure based on this basic concept. The following example
> is very close to what running bitbake-setup init twice (once for poky-
> master and once for oe-nodistro-master) would create:
>
> build
> poky-master
> conf
> site.conf
> bblayers.conf
> templateconf.cfg
> oe-nodistro-master
> conf
> site.conf
> bblayers.conf
> templateconf.cfg
> bitbake
> meta-foo
> scripts
> oe-setup-vscode
> meta-yocto
> openembedded-core
> scripts
> oe-buildenv-internal
> oe-setup-vscode
> oe-init-build-env
> oe-init-build-env
>
> This can be used like this:
>
> git clone --recurse-submodules foo-project ... && cd foo-project
> . oe-init-build-env build/poky-master
>
> Switching to oe-nodistro-master is as simple as starting a new shell
> and running:
>
> . oe-init-build-env build/oe-nodistro-master
>
> The oe-init-build-env in the top level is a slightly customized copy of
> poky/oe-init-build-env. It can, for example, modify the PATH variable
> to prioritize scripts found in meta-foo/scripts over scripts found in
> openembedded-core/scripts. This allows overriding scripts like we have
> it for all the bitbake-related files in layers.

Sadly the formatting/indentation in the directory list above was lost,
so I can't quite make sense of the above.

> The logic: Set up the build environment with PATH (so bitbake can be
> found), OEROOT, and BUILDDIR, then run further scripts which use these
> variables.
>
> I hope this explains:
>  * How 'seeing multiple layers' worked before (my understanding)
>  * Why I ended up with calling init-build-env (respectively the old oe-
>    init-build-env) rather then calling separate scripts from bitbake-
>    setup:
>     - Keep it independent from bitbake-setup (at least for now)
>     - Benefit from bitbake-setup: It has to run before everything else
>       runs which is the right time for dropping a VSCode configuration.
>     - Support customizing the .vscode/settings.json for project specific
>       layers
>
> I'm not against creating the VSCode configuration directly from
> bitbake-setup. But I think it is more complicated than it looks like. I
> also don't want to be the guy who polluted all the git repositories
> whit editor specific code :-). OE-core is enough for now.

What I am proposing is this:
1. oe-setup-vscode does not try to guess things, or deduce things from
$PATH or other environment variables. It takes everything needed to
create vscode-specific files on its command line, as parameters. That
includes where bitbake is, if vscode has to know that, and where build
environment script is as well (e.g. the full path with a name).
2. How about rewriting oe-setup-vscode in python? Does it have to be shell?
3. bitbake-setup runs oe-setup-vscode directly, passing in all the
needed parameters (it knows all of them)
4. standard oe-init-build-env from oe-core either does not run
oe-setup-vscode at all anymore, or perhaps there could be some
minimally useful setup it could still create, but I can't see how you
would deduce the top dir with all the layers and the build dir easily
and correctly in the general case. What it does now (passing $OEROOT,
e.g. just oe-core location, to oe-setup-vscode and have vscode config
created there) is not really useful (as you have explained), or is it?

Alex

