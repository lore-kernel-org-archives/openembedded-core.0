Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72042C433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 19:30:03 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web12.1100.1646940602282140732
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 11:30:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=tzwcSTou;
 spf=pass (domain: burtonini.com, ip: 209.85.128.42,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f42.google.com with SMTP id
 n33-20020a05600c3ba100b003832caf7f3aso4962155wms.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 11:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y7RBXwvrF66Jwj5K5NSBidPey0N1fSWGVJDcrhAMecQ=;
        b=tzwcSTouFSZmw69NIbQanNk8uUp7UVQ8pugPVi75O3thaLkz/9hRP2gjlCUmuNGLL6
         YOv8W/HW7MXE7zYvsgIOm+I8LZJgYk11+785RUlV4nKu5pgz8ofNfgYOw/sUm9P1YOYl
         dSI0K+vE1ZSK3UuB9NH1P/yh2WiP0RUWp/zOiY6aw+JjTaTIuW4LS3Cwqu6ohTxyPj5t
         UOvJrdsVYbd4VpbLVXM9NENNbJ5tTv6NsSjohT1Ep60QWKjOA+gMAiAP3S7Ornrep8J2
         /HiS7X21193jzS0JRAX4h/Mb2mJA21X4YK7KAoahwY1boL1F03kxqJbyRPRiyEiuzO9B
         +cwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y7RBXwvrF66Jwj5K5NSBidPey0N1fSWGVJDcrhAMecQ=;
        b=mNhXCL05qMBCw1GhtBLHuFa2Sr9JhlcB460/7Y2QteyeEThoVvJ5fWPseCksVm7cB+
         IOuoNbEJ1KsvxTEJal2yraJWjrU0deBjWoW0NONhtPEkyADLlfbBBej/ec3z8VO1P/cB
         pZknvKbkXwk5cZOUn4yS73BhDBfcYUMKSO8l37O7nDUZl3J6b/IuUlXrgRui6i8rTA6w
         Xg3GQ9LfN+QY/NFI25vBSZg/zBARtRLF092VpaiElhCSpwNUT59b8slzXKc/1EXMlBvM
         vJyp1kqO1HSXvTqXvM6TuivITnM/jRJPwEvjabGJYl9/cvmBGQg6e/I3avPGQBiH3x9/
         O3hA==
X-Gm-Message-State: AOAM53296K+YpVRxRABHVpUNMINDBIoe7yi2jt+coXCCvU1lQLOh0IMJ
	wtIXE9evbZo+cY8TTDW4tXAFdgg/ciDS88YNieoIuA==
X-Google-Smtp-Source: 
 ABdhPJxYsLJ7W2VcHBWP7uC8b35y/gqeHYpM5vLQi9L6db9KGssslje2+1b67ussXYDVku8PpQaOBWzRgIuPXJtyWyc=
X-Received: by 2002:a1c:7916:0:b0:389:8d21:caa9 with SMTP id
 l22-20020a1c7916000000b003898d21caa9mr4842545wme.106.1646940600579; Thu, 10
 Mar 2022 11:30:00 -0800 (PST)
MIME-Version: 1.0
References: <20220310171656.3106028-1-ross.burton@arm.com>
 <AM9PR09MB46423A3FDC636B28C16590C6A80B9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CAAnfSTujN-T=7kfEfrmcs3XXdsAB2XL3=p9gtCWCyn__dhT2Pg@mail.gmail.com>
 <AM9PR09MB46420D97FB3AE4F4349E2A4BA80B9@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: 
 <AM9PR09MB46420D97FB3AE4F4349E2A4BA80B9@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: Ross Burton <ross@burtonini.com>
Date: Thu, 10 Mar 2022 19:29:48 +0000
Message-ID: 
 <CAAnfSTsbGq6h=roWB=9HX5xH-Q=b2Yu1faQtxpCp4Un0Kn7aBQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] python3-installer: add installer module
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Mar 2022 19:30:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163039

On Thu, 10 Mar 2022 at 19:03, Konrad Weihmann <kweihmann@outlook.com> wrote:
> > It also does one job and just one job, which is A Very Good Thing.
>
> Still doesn't make it the best choice TBH.
> Just diving into the code makes me wonder about a lot, like

Also referenced on https://github.com/brettcannon/mousebender, by a
prominent Microsoft Python engineer.

> - can this tool run on non arm/aarch64/x86/x86-64 hosts
> (https://github.com/pradyunsg/installer/blob/fad2894a572d5497a3dceec58407c276f21e8c11/src/installer/utils.py#L140)

Line 137 makes that moot, that's all Windows-specific.

> - support of this here https://github.com/pradyunsg/installer/issues/98,
> should be given by a matured tool

That's moot: it installs where the Python sysconfig module says to
install, which is told where to install when we build Python.

The Nix people want to override it per-package because they use
per-package prefixes, but we don't.  The prefix Python is built with
is the prefix we want to install into.

> > I should make it clear that this class is not for installing arbitrary
> > wheels, it installs a wheel we just built and in the future will build
> > the wheel too.
>
> Then that's definitely missing in the commit message, that this should
> be an option and not the default

If you want to install arbitrary packages with pip, then just use pip directly.

Ross

