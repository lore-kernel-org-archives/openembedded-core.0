Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.4241.1611013463006667713
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 15:44:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=WEIx7O8+;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.43, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f43.google.com with SMTP id gx5so6751141ejb.7
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Jan 2021 15:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j5BLxAvGx8DTE765deH2BkcamyRZXILABm0KMW26faY=;
        b=WEIx7O8+yOYomqk8gPd6ub+d4jMtS1XmD49jQBuEGByq+WfAU2PLQgxWnIMtp/9Ni6
         g2gNZEVIZHQUW4+kTWHFWWTcCrv7nGEWE/Jthaef+OS1hWFdpfGKHuoj90lPk6vIsVSv
         yNUYsQi8WKD+NQ80Vd3vEtpbzjeUZXWAXg7Rnb6tcdfsGETQrezdV5vG2RPUjPMGPWCT
         fl+t588Rcd+Vw6bXSMKzC3mDm0qd5Dd1ZpAfEshSqrppxRaGkPYBudAdK9EpTBi01cz9
         FOwBgRWCzhX6BYHaYFUtB4Dj69+FnGw3L3c2Dco499G0qtEDmGJbwndW1b5ATI9RsQyl
         M+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j5BLxAvGx8DTE765deH2BkcamyRZXILABm0KMW26faY=;
        b=NPtYOwctUkmUdwF3mwK3T2OQMJWngJUB2Y7j8s2ojdHM04V1DVIGIiiCk6vBJj+aGq
         rr8go5xq38itveBm6AgYwccHpsLjbzGhlvaej7+KPBAGG6SN6U5uRAwailc0QMi974iB
         cgcKJmAVmE7471nZBC09cFUHd1YmzygsnIqpWpy9r+G/EgevcapwAIQ4xD7JHSwtpNXt
         iJ5kmOes1y7tEOPlWAYwpdqZcc9otI94NZ9GseL/NJV08kQ0X1UupCFxzZdybSCNsNB3
         hl1fcfGF8RlWLrmt0OrqPhu/C2uSLu5JGIBU87YuAEIHl6fbDc+Gd2vXJnt7daf8BcPh
         ZoJA==
X-Gm-Message-State: AOAM531h0rDFmn7p5EHGtqkM71ZsAASG+RKvRc/Vyi3siOnfRQSYIElw
	XC52nMmsDypymSGnqM6vzZk9E7Hogro+NG6DUxgV8A==
X-Google-Smtp-Source: ABdhPJyy4Od3MKpY/Y3hROIvI4yGSeyT46bw3hTUKMVYRWVRBtzbpD30rXAZopisht4+NvV45154EPaw3zvqGFsaJgc=
X-Received: by 2002:a17:907:948d:: with SMTP id dm13mr1184209ejc.545.1611013461396;
 Mon, 18 Jan 2021 15:44:21 -0800 (PST)
MIME-Version: 1.0
References: <cover.1611009050.git.steve@sakoman.com> <d01d149f6cb6fb86b8fafd1424bd37682aa9e76b.1611009050.git.steve@sakoman.com>
 <1ad7a514c13dacf9169e27e18f309b78ca5c3621.camel@linuxfoundation.org>
In-Reply-To: <1ad7a514c13dacf9169e27e18f309b78ca5c3621.camel@linuxfoundation.org>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Mon, 18 Jan 2021 13:44:09 -1000
Message-ID: <CAOSpxdbn4P7Otj6xKL=Hw12Fswb-hmgZOT1+9igTLm_n+87++A@mail.gmail.com>
Subject: Re: [OE-core][dunfell 08/19] buildstats.bbclass: add functionality to collect build system stats
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 18, 2021 at 1:34 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2021-01-18 at 12:36 -1000, Steve Sakoman wrote:
> > From: Sakib Sajal <sakib.sajal@windriver.com>
> >
> > There are a number of timeout and hang defects where
> > it would be useful to collect statistics about what
> > is running on a build host when that condition occurs.
> >
> > This adds functionality to collect build system stats
> > on a regular interval and/or on task failure. Both
> > features are disabled by default.
> >
> > To enable logging on a regular interval, set:
> > BB_HEARTBEAT_EVENT = "<interval>"
> > BB_LOG_HOST_STAT_ON_INTERVAL = <boolean>
> > Logs are stored in ${BUILDSTATS_BASE}/<build_name>/host_stats
> >
> > To enable logging on a task failure, set:
> > BB_LOG_HOST_STAT_ON_FAILURE = "<boolean>"
> > Logs are stored in ${BUILDSTATS_BASE}/<build_name>/build_stats
> >
> > The list of commands, along with the desired options, need
> > to be specified in the BB_LOG_HOST_STAT_CMDS variable
> > delimited by ; as such:
> > BB_LOG_HOST_STAT_CMDS = "command1 ; command2 ;... ;"
> >
> > Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > (cherry picked from commit edb7098e9e0a8978568a45057c1c3ad2c6cacd67)
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >  meta/classes/buildstats.bbclass | 40 ++++++++++++++++++++++++++++++---
> >  1 file changed, 37 insertions(+), 3 deletions(-)
>
> Not sure this is backport material. We should probably see how it goes
> in master and try using it there first?

OK, I thought it was safe since the features are disabled by default.
Seemed like something good to have if needed, but I'll remove this
from the pull request and revisit later.

Steve
