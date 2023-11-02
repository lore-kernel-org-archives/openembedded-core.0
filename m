Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71A89C4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 11:52:07 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.29083.1698925926063515281
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Nov 2023 04:52:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gxNWZM/n;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2c503dbe50dso12465511fa.1;
        Thu, 02 Nov 2023 04:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698925924; x=1699530724; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=agdLGbFX/O2dTjYG+pTK4K+8PvFnhxepBSEtLHF/QnE=;
        b=gxNWZM/n1xc5rlhABNMDUvvtDhdzPZNuykY5REa19uWYLJiqZbwFt4UCXz3uzgPsNi
         kxLW3XEJUUCKWDaygoDGh7rG6gZeyPvPJ8FgJqtaw9DJ91z8w+v3bmijzP6BChFsHlxp
         mNX+2l0cPMQrgQ9K5WywRJNqoZyIt7+f0V1XWnc3FEq9jkD7hHcR3xiEZtqSSQSgx/Np
         B+d2zdwoQo+YWSzOOCVSEv+2YQRQS3hEJzj7e+bbu28DPRnvDImTV5mcm8Y/bxVIGMwZ
         0VZ0bVRrZ0SaR0AE26eaO0W3xmQ16mgnT0u6BHLdfxK9haQLdi2pvR06NBtSpkEeJ4it
         UXgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698925924; x=1699530724;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=agdLGbFX/O2dTjYG+pTK4K+8PvFnhxepBSEtLHF/QnE=;
        b=PIl8nVOZ28czvUoYQBXQmKqWnswT2YXRnxM6qN6g6Cpq95IthYlV5kgnNZ0hES5b4V
         0mhr+c7oW+A4k1hPsGAMEgahP2AvuIswjp/Cp5KxBa2KcODLeDIMatnSKVc/0EbXj99b
         vh3U5jcotKLT9LRcM3LcJjVhpVRjMI9tz/m34EDI4FjMwevGyfUp0PbJ+oaBxflmtNcS
         +9hYhJYcClOOn9AFEWrryCQdvYvhxK9FByfFiQ2pL3RlO24RluXjWE9LXWGoxnfT5o8E
         nvgevnrTCSkm10smjbXQO0zp5721dqwxUx2eb/5O+JSRjM3Ih0yj7QImNvOlhAYZAKCX
         Kriw==
X-Gm-Message-State: AOJu0YyDU/EaL27DiogE0dMQSQqTURMEAGs9oE2d4dXgawuZ/jzDTx6g
	TpZ/zeAvCKyRro7LW30l3NM1RhbnbU6LofH5Q2Q=
X-Google-Smtp-Source: AGHT+IEmgZXoobJUoxSSrI3AE1EIBhR1soaLmjB65R9Tvc2Pt4odsxvBL0wgiIhhj9RpgK+OsNh9tkwZi7qai5T+shQ=
X-Received: by 2002:a2e:9b88:0:b0:2c6:f711:cea1 with SMTP id
 z8-20020a2e9b88000000b002c6f711cea1mr852687lji.39.1698925923977; Thu, 02 Nov
 2023 04:52:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAK5yBb9gO+WOJrv4TArzXK_1Bxu5AORp2oi=P-v=2nn6PgJE5Q@mail.gmail.com>
 <CANNYZj9QpstUj_A8Vb2RbiaFGZkHkFjHkUfF=E1HR-nDJ_Vk6w@mail.gmail.com>
 <81f4c191fe6dead1feec6bfc0d36aa328af1f7d4.camel@linuxfoundation.org>
 <CANNYZj-JhGnGFRxaF0+Q_5Sqq76kAg1pSBBMka_xefuhMv6-vQ@mail.gmail.com>
 <ea84079102bca429a6ae521d218118952a79f111.camel@linuxfoundation.org>
 <feee5d39bc3e280c76b749f39761936464c4cdff.camel@gmail.com>
 <CANNYZj_4e5XbTgcv_ZdqJArCA+=bTj+kmWYVveHDVXyC3TK+rA@mail.gmail.com>
 <d53017757cc59380fea417cf36cdeea25b9770d8.camel@gmail.com> <1793C2E61248AF31.11290@lists.yoctoproject.org>
In-Reply-To: <1793C2E61248AF31.11290@lists.yoctoproject.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 2 Nov 2023 12:51:51 +0100
Message-ID: <CANNYZj-KY4kOicC1S1yKnnuYktw+7=f7eMbP8_rQCBSjzFjKtQ@mail.gmail.com>
Subject: Re: [yocto] Core workflow: sstate for all, bblock/bbunlock, tools for
 why is sstate not being reused?
To: alex.kanavin@gmail.com
Cc: adrian.freihofer@gmail.com, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-architecture <openembedded-architecture@lists.openembedded.org>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Julien STEPHAN <jstephan@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 11:52:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190077

On Thu, 2 Nov 2023 at 10:02, Alexander Kanavin via
lists.yoctoproject.org <alex.kanavin=gmail.com@lists.yoctoproject.org>
wrote:
> So here's what I'd like to try:
>
> - write a new populate_build_replica task that writes a few things
> under ${WORKDIR}/replica
> -- setup-layers json and script
> (another option is to copy the layer trees themselves like esdk does,
> which is left for maybe later. Completely offline replication is not
> an initial goal, and it's good to get to a minimally viable
> implementation asap.)
> -- meta-build-config layer with the local.conf/bblayer.conf template.
> -- sstate cache needed to fulfil the bitbake target that the task is
> for (this would reuse code from esdk that does the same as much as
> possible)
>
> All of this is then packaged into a self-extracting shell archive that:
> - unpacks itself
> - fetches layers using the json/script from the unpacked tree
> - sets up a build directory using the template from meta-build-config
> in the unpacked tree
> - tweaks site.conf to point to the prepackaged sstate
>
> And voila! (in theory) This should be the same build as the one that
> was produced elsewhere.

I started writing this as a bitbake task, but then quickly hit an
obstacle: bitbake-layers deadlocks when executed in a bitbake task.

At which point it dawned on me: all of the required functions are
available in command-line utility form, and so this should be a script
as well, with as many options as people find useful (as opposed to
bitbake tasks which are more difficult to parametrize).

So:
- bitbake -S lockedsigs to get the list of sstate objects
- gen-lockedsig-cache to populate a newly made sstate cache directory
with them (optional)
- bitbake-layers to save the layer configuration and build configuration

Then either leave all that in an unpacked form, or package it up in a
self-extracting shell archive or plain tarball. It would also contain
a script that would set up a plain bitbake build from what is in the
archive.

This could be poky/scripts/oe-replicate-build ?

Alex

