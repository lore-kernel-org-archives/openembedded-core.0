Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web12.957.1611591923493610968
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 08:25:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=e3pMTgQ3;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.44, mailfrom: steve@sakoman.com)
Received: by mail-wm1-f44.google.com with SMTP id m2so11535463wmm.1
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 08:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EoQudndS8ZoFZ/leR03TLsmzYP5aNQUqy2mQzMK7mWM=;
        b=e3pMTgQ3++uT+vlKQLmaGSoBSIjAOKX6wRsNcpOy89mSCk5q9NwuGVv/Z0+02KfHF4
         jdLcH9dyS81JaGy8sOcNpxL5NNjuyv8U+cVSD9iOPRJ5dQDlVZlSXctaVvEJy1BTnAlm
         +VmkMfs1NR8KXHCtOZtCDrZRfy9jCn7qoDckXcFSC36dWA+QXntU7nDqrRz0tcs8nmjX
         tmd7v4c9WVVTUrmoRJ6AxmtasDDETZO+lj8z+Ip7jhGKUDfohdGNOXbTSJJuBcmeI89b
         eC4JiL9Vzi+HK697mubShpP7liuGQLGpV0WScpk83QVZvcvBdqjaMcfUn9Y9YtpElUJE
         xvyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EoQudndS8ZoFZ/leR03TLsmzYP5aNQUqy2mQzMK7mWM=;
        b=srlBiEj2EeMA0arApPr7MBHN8+GAYPo5wsNlhjkD1wM4PFT5OS5/fej9GqnS37yBaM
         DcVW1bQnlqSpa4fcd8ww97MQH19y0uKd/xnUKYJ1KrPLskVcundpjWdFq+PXHzQRIgx1
         6lBoOVoxl/VdPBhTo2NP3EfbNKKERkkaPIQBvd+9uMhuNFbDY5KmVWjBtv9dTe+oKBrm
         nEpqk087tllza/fLhzx74sO/4j3PwPTLqS2vmrRfTn2qnNQSsaBBqtU1NLQ2upwWAITf
         SrqCaZwCM1uv8lprbhWTLLL1QlzQYcx2NghQ3d0I96CP+Dj93leSeBNCd3QPhzdTBf3q
         kyOQ==
X-Gm-Message-State: AOAM5318mEXBeou/YzXy9rzMlDaaO9P0drUuGrkNH1l3+Lj0Mybo2C+c
	WsjaN0Gj11GNokIYU6/OkEyoBrP64ijKX7gt+LSFmQ==
X-Google-Smtp-Source: ABdhPJxwdWLIi+bIE/9brhKPXjtvl1tDyJbPlX9Xh2UsFOjJ+0UyTLmcQ4SmkP1wS6yt3d9Q+5YnZUwsrES/ZoSh/6U=
X-Received: by 2002:a7b:c246:: with SMTP id b6mr895030wmj.118.1611591921939;
 Mon, 25 Jan 2021 08:25:21 -0800 (PST)
MIME-Version: 1.0
References: <cover.1611585425.git.steve@sakoman.com> <CAM9ZRVsw+VO=L6Fc4iYCtOpB1mJnqmVrt8ADfG1q4q53mt0AuA@mail.gmail.com>
In-Reply-To: <CAM9ZRVsw+VO=L6Fc4iYCtOpB1mJnqmVrt8ADfG1q4q53mt0AuA@mail.gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Mon, 25 Jan 2021 06:25:11 -1000
Message-ID: <CAOSpxdYS1zHhr43BrP970cRXKdJTY+LUDVdV7jHt=Em5qOs+DQ@mail.gmail.com>
Subject: Re: [OE-core][dunfell 00/47] Patch review - pseudo file mode corruption fix V2
To: Paul Barker <pbarker@konsulko.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 25, 2021 at 5:42 AM Paul Barker <pbarker@konsulko.com> wrote:
>
> On Mon, 25 Jan 2021 at 14:51, Steve Sakoman <steve@sakoman.com> wrote:
> >
> > Issues with undetected file mode corruption in pseudo have been identified.
> >
> > Fixes have been merged into master and gatesgarth over the past several months and
> > things seem to have stabilized enough that we can consider backporting these fixes
> > to dunfell.
> >
> > This is a somewhat more invasive change than normal. Specifically the user will
> > be required to clean TMPDIR after this merge. It may also expose issues with
> > other layers, though master and gategarth have probably helped to pave the way for
> > this change.
> >
> > Personally I think that this fixes a serious enough issue that we should consider
> > this series for dunfell.
> >
> > This second version includes the wic patches which have been the gating item for
> > merging this series.
> >
> > Note also that there is an associated bitbake patch for stable/1.46:
> >
> > lib/bb/utils.py: Do not preserve TERM in the environment
> >
> > This is due to taking:
> >
> > bitbake.conf: Remove TERM from default BB_HASHBASE_WHITELIST
> >
> > which was needed to do clean cherry-picks of the pseudo changes.
>
> If this is just brought in to allow clean cherry-picks I think it
> would be better left out and instead do the small bit of rebasing
> required in the patches. We don't know what downstream users are doing
> with TERM so minimising unnecessary changes in the stable branch is
> preferable.

OK, will do.

> Everything else looks good to me at a glance.

Thanks for reviewing.  I'll wait for more feedback and send a v3.
This is one series we really want to get right!

Steve
