Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00778ECAAD5
	for <webhook@archiver.kernel.org>; Tue,  6 Sep 2022 11:24:25 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web08.2840.1662463458974850561
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Sep 2022 04:24:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kxQcoigG;
 spf=pass (domain: gmail.com, ip: 209.85.208.171,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id bx38so11884695ljb.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Sep 2022 04:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=IpMTAdX7ORUjJGpdkVLg1FuBflJ2s1AYEpTcsSRbjjg=;
        b=kxQcoigGQRdQQXOn7WkJv3PNUJmOPNlnRubjSkxbJ7z7ZLeb4oVcZLH5gsK5UxGdlQ
         14EnBOSA9MZhPTHH5/B5Tl+QvKd9Urs1kRDOl3kwhkiPEAbPNoxjI3i/uTys4olP2F2r
         pDZVtVF6osGAhxg9fJOfj5mrBhRxXN/qslH8pFC1pEMuAEOAjVfgibaKE0LOsIL+z9Ds
         2HGp2XiszddiOHeqdoQkuXT42EN0NpSrrjIex4lWVB3Em42TKejZ8qYkomtufhw0+0Ul
         RJ/xrYhTtBFQU9RJ4/+tSIlYs30ZNQkTxSbxn2bodwgFhTUnNcO3qJE6Dof76zKYdVKY
         6Xbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=IpMTAdX7ORUjJGpdkVLg1FuBflJ2s1AYEpTcsSRbjjg=;
        b=O57VwwJjGhm3insBlyTdveCgxST+k+fsYwOFXSfn4z0Kzb3ghlNM5Shli0YRH+99tZ
         2lu7LDSznDN7k5MfWkb9LvUNH16+3U9Vp215BSq/HN8KDminNvPwkBoU855xfLensV1e
         OHrshWrjkMbxNWZfr2geFeLn7HHlr/IZIPpHBzG/VXVYjZ0vuM/+kjJjxGbkqYOt4UVO
         xhjv0QweJR19izi97zq/er+uA3Ou3Wk12NBRZ4005qNzX514NhGGxSO0636M4gyqIEl9
         79XhNDsa8gqQGSeJlzpyifu/rvd+MRGhLYTttX1tMTsCoO2UcpPdA7q89wwvk1GpT2Ew
         XmKA==
X-Gm-Message-State: ACgBeo1CvSqoaGWVensYEJDvGO1yVFAWF8q2kToCZTiTDWsVmsOFPguL
	WUi2aLJchtjqAHqqxE/jTxRZzL6MhXC1+dL9HXg=
X-Google-Smtp-Source: 
 AA6agR7fzPYbfZn8ZXJUoq3aWSjip1C8Uoxk0sM8Ucmb9egbjedkT2lU/EzIH3yMVlj6Ta+BTTbfOgjkAYJhrrFCROU=
X-Received: by 2002:a2e:161d:0:b0:264:87b0:fc7e with SMTP id
 w29-20020a2e161d000000b0026487b0fc7emr13013423ljd.191.1662463456971; Tue, 06
 Sep 2022 04:24:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220905182141.1091053-1-alex@linutronix.de>
 <87leqwztwp.fsf@jogness.linutronix.de>
In-Reply-To: <87leqwztwp.fsf@jogness.linutronix.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 6 Sep 2022 13:24:04 +0200
Message-ID: 
 <CANNYZj-HNknW0MG=2tj2MVzDzR0+s3h5mjvOo3cRosJ60CWTyQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] oe-setup-build: add a tool for discovering config
 templates and setting up builds
To: John Ogness <john.ogness@linutronix.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Sep 2022 11:24:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170347

Thanks for the review, comments below.

On Tue, 6 Sept 2022 at 12:20, John Ogness <john.ogness@linutronix.de> wrote:

> So if your motivation is to change from setting TEMPLATECONF and
> sourcing oe-init-build-env to using an intuitive tool, then that should
> be clearly stated in the commit message. It is not correct to say that
> it cannot be setup without this tool because we've been doing it for
> many years now. :-)

The motivation for the tool is primarily in adding a way to discover
and learn about available
configuration templates which until now has been completely absent.

In fact I'd say that is the primary purpose of the tool. Setting up
builds is secondary, and if someone wants
to continue using '. oe-init-build-env', I am totally fine with that -
the tool merely provides a convenient
shortcut for that with a separate shell session, and reasonable
defaults for choosing where the build dir would be,
unless specified explicitly via -b.

> > After layers have been fetched and placed into their respective locations, one would
> > surely want to proceed to the actual build, and here's how:
> >
> > 1. Without arguments, the tool simply walks the ../.. of its location (which is the parent dir
> > of poky/oe-core), and prints what templates has found. If the following is not enough information,
> > adding '-v' will also print conf-notes.txt for each of the templates:
>
> For me this is not an intuitive interface. Below is a list of changes
> that I would suggest:
>
> 1. The tool should be called "oe-setup-build-env". This matches the
> source file "oe-init-build-env" and makes it clear that only a build
> environment is setup and nothing will be "built".

Sure, I will change that.

> 2. The "-c" argument is required (also in your code), so not specifying
> it should be an error. Upon printing the error message, the tool could
> provide the help. Something like:
>
> $ oe-setup-build-env
> error: no template path specified with `-c'
>
> usage: oe-setup-build-env -c template_path [-h] [--topdir TOPDIR] [-v] [-b build_path] [--no-shell]
>
> A script that discovers available build configuration templates and sets up a build environment based on one of them
>
> optional arguments:
>   -h, --help        show this help message and exit
>   --topdir TOPDIR   Where to look for available build configuration templates (default is ../..).
>   -v                Print a description for each available build configuration template.
>   -c template_path  Use build configuration template in template_path to set up a build (run this script without arguments or with -v to see what is available)
>   -b build_path     Set up a build in build_path (run this script without arguments or with -v to see where it would be by default)
>   --no-shell        Create a build but do not start a shell session with it.
>
> (Or maybe template_path could be a positional argument instead of
> specified with -c? Not sure.)

This is where I have to say no. As stated, the primary purpose is to
find out what is available, and the tool should do something useful in
that aspect when run without any arguments. Which is what it does -
'-c' is not actually required :)

> 3. In the help output I think it is important to always talk about
> build environments instead of builds. For example:
>
>     Use build configuration template in template_path to set up a build environment
>
>     Set up a build environment in build_path
>
>     Create a build environment but do not start a shell session within it

Yes, I will correct the terminology.

> 4. Listing available templates is a nice feature, but this alternate
> mode of operation should have its own argument. Something like
>
>   -l                List available build configuration templates.

See above please.

> 5. Your comments hint that this tool might be a second step for users of
> the new "oe-setup-layers" tool. That tool uses a configuration file that
> has an explicit list of layers that are used. But this tool recursively
> searches for templates in _any_ layer under topdir. If this tool is
> indeed meant as a second step to "oe-setup-layers" then perhaps it
> should also support using the configuration file so that it knows which
> layers it is allowed to list (or maybe even use).
>
>   --jsondata        File containing the layer data in json format
>
> With the json data available, the tool could also report if the layers
> are dirty or are using a different commit, before setting up the build
> environment.

To get the layer descriptions in json accepted and merged, I had to
drop all configuration-related data from it, and keep it strictly
about repos checkout and placement into correct paths. Originally, it
had a list of machines, distros and config templates, per layer, and
the list of layers; now all of it is gone, and only the repos remain
(and repo != layer, as repos can and do contain multiple layers).
There was a lot of resistance against mixing the layer setup with
build setup into the same json and same tools.

We can probably come up with a more tightly controlled template
discovery and buildenv setup if proven necessary, but this one just
works when all checked out layers are in a single top folder just
above poky/oe-core, so why not keep things simple, and do away with
config files altogether?

Please keep in mind the target audience: it is not you or me. This is
intended, first, and foremost, for first-timers, and the expectation
is that distro maintainers set things up for them (layer config, and
build templates), so that nobody has to 'learn yocto' or read
documentation (that includes READMEs in product/company layers too),
or poke around the confusing layer tree to get from a newly created
empty 'my-yocto-stuff' directory to having flashable target artifacts.

Alex

