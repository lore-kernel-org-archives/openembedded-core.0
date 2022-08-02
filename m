Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADD9FC3F6B0
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 17:02:13 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web08.8852.1659459724122620373
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Aug 2022 10:02:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=HMkqENuC;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.48,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f48.google.com with SMTP id k26so11333860ejx.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Aug 2022 10:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E3zAuD26hcX7dgZReSIM3n8LOwIDVS1aZmwG7aXDreo=;
        b=HMkqENuCB+S/3A+TGeNB7XADmszX6lHTmF3LljkZEJ4nV1J/VZrqiFdapAmfrEJNgd
         wb3EgJj4YBbM62Kez5uQzuVoU/yG4CDtK4nQlkfvWrZJEWShaPbF3o5cGLfPdHMgXCWV
         UzDhcCP6YZF46Tvf9QgxUWgJAREuva8Mw+g0UEnP0rHE3ZnBKfIQomw0zTsEPO7W9Kgt
         R7LLJl6wvTABtaEQ9VGLrbAyHfXpltJbfQLVPiLnNa9XxLuz53lolwBZyhGKGz6qcSp/
         DjFx3pb6bRlTSbEHdWLw6i/cUbLZYbD98Regwqenpr/ilayTOJfKa/P0/elKPJaPkvut
         AVig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E3zAuD26hcX7dgZReSIM3n8LOwIDVS1aZmwG7aXDreo=;
        b=BmVeNbgN+MITJRhaufQVf/HqmHHc1vnHgrDAeoH/sTsc+CHBRZhMZoFqt06MpGE26u
         yxthsxb48OPaQxmB/iCCyBldN8m4S+FlO69c4d/VRUSAqfUK5dcdGdSbmwMj+j3aW1AV
         kXqSpD0zySsIJoxlLyFlvEKrRwGSy6PgUhpMSG5pce20FAfXC1k9NoVTj/mk6dMpA/kI
         YCEuU8ZT4dMzbLT/cBO2myKMxsfb3dgz71zZEgSZl+r2iB2n/Hsg+EocQtOdzE+Qtv+H
         W1t5aWZCpPNOYptYljY9aXoOGa5MHg06cfZd3VIjbedCNO4XuHB2E74BFlo0qp7Zya0o
         zjHQ==
X-Gm-Message-State: ACgBeo0GfHI0HMhC/O6/TIDGH2mPgwumnxIeIR8ILF8uyNlA0FwqG9N7
	ZH2YmeQrCucRZAvZWyFeqvzGdaO6kAZSi5lIWN4UPQ==
X-Google-Smtp-Source: 
 AA6agR6/MpXB1FF8eItk312qFhpUwkYVGEpHM57joLp10Bl5MiGn20PahREhcafJyDIkbOAjslf83Kb3/Qyj+gD21NY=
X-Received: by 2002:a17:907:9619:b0:730:8ebb:9e45 with SMTP id
 gb25-20020a170907961900b007308ebb9e45mr7110340ejc.628.1659459722386; Tue, 02
 Aug 2022 10:02:02 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAODMxsLgFeENYpTGMJO=Y7QQUF_2Vg11STnY+cmeJXvHrdAtzA@mail.gmail.com>
 <CAApg2=RJQ8W3hVs6S1HuUg9uM_LcNvwupMQxi_far8JD54S26g@mail.gmail.com>
In-Reply-To: 
 <CAApg2=RJQ8W3hVs6S1HuUg9uM_LcNvwupMQxi_far8JD54S26g@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 2 Aug 2022 07:01:51 -1000
Message-ID: 
 <CAOSpxdb9HUnNopugjW9k0wqqvn0pGusg8dgHesx4nKYGc2iENw@mail.gmail.com>
Subject: Re: [OE-core] Yocto Project Status 02 August 2022 (WW31)
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: Neal Caidin <ncaidin@linuxfoundation.org>, yocto@lists.yoctoproject.org,
	openembedded-core@lists.openembedded.org,
	Stephen Jolley <sjolley.yp.pm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Aug 2022 17:02:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168796

On Tue, Aug 2, 2022 at 6:30 AM Marta Rybczynska <rybczynska@gmail.com> wrote:
>
> On Tue, Aug 2, 2022 at 4:49 PM Neal Caidin <ncaidin@linuxfoundation.org> wrote:
> >
> > Current Dev Position: YP 4.1 M3
> >
> > Next Deadline: 22nd August 2022 YP 4.1 M3 Build
> >
> >
> > Next Team Meetings:
> >
> > Bug Triage meeting Thursday August 4th 7:30 am PDT (https://zoom.us/j/454367603?pwd=ZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09)
> >
> > Weekly Project Engineering Sync Tuesday August  2nd  at 8 am PDT (https://zoom.us/j/990892712?pwd=cHU1MjhoM2x6ck81bkcrYjRrcmJsUT09)
> >
> > Twitch -  See https://www.twitch.tv/theyoctojester
> >
> >
> > Key Status/Updates:
> >
> > YP 4.1 M2 was released
> >
> > YP 3.1.18 passed QA and is due to be released
> >
> > The debug file mapping issues have moved slightly further forward thanks to some help from Ross but are stalling due to insufficient developer time available to resolve the issues.
> >
> > Some rust toolchain improvements did merge, including an automated rust toolchain test. The bulk of the rework is stalled on a handful of remaining issues, particularly a couple of reproducibility problems but also a mips n32 toolchain issue.
> >
> > We have one open CVE on master against qemu, help to backport that fix would be very welcome to keep the numbers down. CVEs in kirkstone (LTS) significantly reduced.
>
> Do you mean CVE-2022-35414?

Yes!  We have a patch under review for kirkstone:
https://lists.openembedded.org/g/openembedded-core/message/168636

I think Richard is hoping someone will see if that also will work on
master and if so send a patch.

Steve

