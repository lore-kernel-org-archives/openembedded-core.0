Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4925CC001E0
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:26:57 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.21965.1691684813376514446
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 09:26:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=zTCZcaNo;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.51, mailfrom: steve@sakoman.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-4fe4f5290daso1645915e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 09:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691684811; x=1692289611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7L6oe3BmEaUzpcsX7f15ApT4wzndFmRwikJPjrExGo=;
        b=zTCZcaNo23e5yYdsuQ3whzDwxJ30uahKAiWHXFaQYL0HhITzKVc8vQF7eufWRsT22x
         WpMI4ceIWrZjk8EkukcKpqgGtDt8MATjinsGT2eVs+ODmuyFWOuTdDolrhH6Xn+7CwA2
         wEIWQGQf9Yn3nC2b4QqbFmIs+LR0MGXWXvLyq01+9TMUt6qwFUaW/W/z3BDMWBTe6NBU
         wLog/WEIfYY7W5rAgGlR0tVjF+2fYWxM97wDKNZYiAURlhsnP6Q968N2CkLDONikE1tL
         w80miQt7fVw3kdG3VgFV+CYvphEV2SGSm2Baj43OR0dFekSr5oPCjFCqYWXobPbc4sk4
         whNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691684811; x=1692289611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p7L6oe3BmEaUzpcsX7f15ApT4wzndFmRwikJPjrExGo=;
        b=Ldt8L4YgV+wZuzEJWtfzHRdWvQDLBo9GFcNpCPuU9YtQQ8kSXMW3KmgN1dfaH9W3LW
         xZxOsYJH0Hbwf5VPuWkflaWmaMugFJFi2MEJ5APoOhZf9bHli5vOm76wMTk9EqHypRUN
         K4mqrLds6x/A4FOjP+YyMv096GexxdCS2+GAVxjM5/601UKx7KBQsJfxOwY0RrZvqMad
         L7QNxonZrkjoAa4Hr/6EDMda3TC8zuuyKDso+rTa+lmuCVggQAAVyiK2BZB7/Oopg2GK
         iBHKnGzCU1JZvgsqaSr/JVZMUM5kE0CJcYgdWOZARjeaCsfIMaTfJb1kXLjAxlJROkVw
         w7Gw==
X-Gm-Message-State: AOJu0YwVCE+IRYJklTBU/a6gFOSda66LfZHtW1DJVQuLzhTsBq6rIRms
	C9iKzXh0gxHE2IAM8DVoRawMiIM49nUK6D6855hcsQ==
X-Google-Smtp-Source: AGHT+IEfdEftz39+goOUNptNElKT+dKnZIqUTAWrwAFtXNoNWv6XQF9tu6O94AG64ADRRCuKZzPD6WyptzwbFFpR4mE=
X-Received: by 2002:a05:6512:3b99:b0:4f8:7055:6f7e with SMTP id
 g25-20020a0565123b9900b004f870556f7emr2781477lfv.44.1691684811421; Thu, 10
 Aug 2023 09:26:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1691683295.git.steve@sakoman.com> <115b6810-6f0c-9682-d8aa-bd6a1fcd93f3@bootlin.com>
In-Reply-To: <115b6810-6f0c-9682-d8aa-bd6a1fcd93f3@bootlin.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 10 Aug 2023 06:26:40 -1000
Message-ID: <CAOSpxdaytxu7xmJgza_gPg4AG6x5B=q88fBotba+81=uM_MKFg@mail.gmail.com>
Subject: Re: [OE-core][mickledore 00/37] Patch review
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 16:26:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185811

On Thu, Aug 10, 2023 at 6:18=E2=80=AFAM Michael Opdenacker
<michael.opdenacker@bootlin.com> wrote:
>
> Hi Steve,
>
> On 10.08.23 at 18:03, Steve Sakoman wrote:
> > Please review this set of changes and have comments back by
> > end of day Monday, August 14.
> >
> > Passed a-full on autobuilder:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5711
> >
> > The following changes since commit dc4099307100de817110958c9426ced4189f=
d0ac:
> >
> >    util-linux: add alternative links for ipcs,ipcrm (2023-07-27 04:32:0=
6 -1000)
> >
> > are available in the Git repository at:
> >
> >    https://git.openembedded.org/openembedded-core-contrib stable/mickle=
dore-nut
> >    http://cgit.openembedded.org/openembedded-core-contrib/log/?h=3Dstab=
le/mickledore-nut
>
>
> To update supported distributions in the Mickledore documentation, I'd
> also need to have this patch merged in the "mickledore" branch of
> "meta-yocto":
>     - [poky] [PATCH] [mickledore] poky.conf: update
> SANITY_TESTED_DISTROS to match autobuilder
>       https://lists.yoctoproject.org/g/poky/message/13118
>
> Could you take care of it too?

Yes.  This particular review request is for oe-core.

I'll take your meta-yocto patches for all of the stable branches later
today if there are no objections on the list.

BTW, ideally the tag should be [meta-yocto], not [poky], since my
searches are typically for meta-yocto and the branch name.

Steve
>
> FYI information I also have the same changes for Kirkstone and Dunfell:
>     - [poky] [PATCH] [kirkstone] poky.conf: update SANITY_TESTED_DISTROS
> to match autobuilder
>       https://lists.yoctoproject.org/g/poky/message/13119
>     - [poky] [PATCH] [dunfell] poky.conf: update SANITY_TESTED_DISTROS
> to match autobuilder
>       https://lists.yoctoproject.org/g/poky/message/13120
>
> Thanks in advance
> Cheers
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

