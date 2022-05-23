Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A782C433F5
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 23:18:23 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web09.3065.1653347893908420028
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 16:18:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=U5HJmHzO;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.50,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f50.google.com with SMTP id ee42so327002edb.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 16:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HK2BVfjudACxqi4Bc9aEbUxuxoRAmd1FMBeOIEeE7y4=;
        b=U5HJmHzOAurkiIT1H3o2iMQHbwTptV/ZN1eYtUUy9M/ecaVvo8+sfhBNNOEs9aR56E
         y/XZDW6El8ews9Isg/WpCvlZKCcfMa8sRAxFawYDU5IW2kEw1AM2F9BAt1LqcDSXFbig
         tjkmI5XLHPRY+0dQtGasby9aOkNzkDYoYws99Y6cLn0AC0h+6m1T3qDGfIr8siq6SXuq
         J8mmsInRVpbKfQ5JUwcDQl9NcV5YkatEyA59KisOJEyVHgtSv3hvuKBLTbsDsSpRsoLo
         Nn+I77hr4CeSEXW0WlFGST0Cnw9TVgOXoxTMD0IQ1IUIESfiD88Bra4GrjHuHoB+bbAi
         1THg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HK2BVfjudACxqi4Bc9aEbUxuxoRAmd1FMBeOIEeE7y4=;
        b=s+1gtUVhcoDmja/0oUol5iEPKPcxroMJNToHv1YnohcJWq55xsOAv84o1h+IPLZ/HA
         5DhRelpeJhlOHGDlVabEswOHqZLZ/8QB7gkIj5h6/VkYcUEaoL3YwITFyV6Y+bjxi4og
         beWIkW/BIka8Cj9txtY7P/do/5wb3fumYjI/iU7QAy4j+hNH7hT4TdZuujBkFBPAFo01
         P6hVwqBRpBizO3XqNqJPybtCH0byfEqT1I/DAENfnM70+cZDguW2GccgnKbws8+SnxGT
         MJ+ubId5fJVuVCoLIhCx6OoCpzrnfdeJe/r0tlC4LMkSYcU5sDKHJIBgqTO6H6kP2DEz
         m6bQ==
X-Gm-Message-State: AOAM533deHJ0OnSevqrGJ0mK8o0NbsSVxzsrzCtsXk06aY2R/wN2sfzZ
	ai9cv4flCM6Y8z1w2V/Pb/NLjJkY2G2GzHtcxbPYwA==
X-Google-Smtp-Source: 
 ABdhPJzbmaZM7HilQQCGbny6nuubX+AUs1haZM4Te/XJ1g09QNKfG2tYSwDvsfT9l6pX+2pSh853d5GWgeBZ9SrG6js=
X-Received: by 2002:a05:6402:d5f:b0:42a:bf12:c42d with SMTP id
 ec31-20020a0564020d5f00b0042abf12c42dmr26652209edb.316.1653347892173; Mon, 23
 May 2022 16:18:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220421211146.19368-1-pkj@axis.com>
 <CAGDS+nke8qEOh8XX5x9Jej7x57DjDuW5s=hyd8U099-Ez6A3Yg@mail.gmail.com>
 <16EA4FAF914EDF73.11702@lists.openembedded.org>
 <9323e409d22b4c56a8e8a0456cc1e27f@axis.com>
In-Reply-To: <9323e409d22b4c56a8e8a0456cc1e27f@axis.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 23 May 2022 13:18:00 -1000
Message-ID: 
 <CAOSpxdaBtgA6YLwkR3V2PtXmN-1N0QdGRkZh6epkhNSFu-ZV+A@mail.gmail.com>
Subject: Re: [OE-core] [master][kirkstone][PATCH] license_image.bbclass: Make
 QA errors fail the build
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 May 2022 23:18:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166042

On Mon, May 23, 2022 at 11:57 AM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> > Sent: den 29 april 2022 10:10
> > To: Steve Sakoman <steve@sakoman.com>
> > Cc: Patches and discussions about the oe-core layer <openembedded-
> > core@lists.openembedded.org>
> > Subject: Re: [OE-core] [master][kirkstone][PATCH] license_image.bbclass:
> > Make QA errors fail the build
> >
> > > -----Original Message-----
> > > From: Steve Sakoman <steve@sakoman.com>
> > > Sent: den 28 april 2022 19:36
> > > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > > Cc: Patches and discussions about the oe-core layer <openembedded-
> > > core@lists.openembedded.org>
> > > Subject: Re: [OE-core] [master][kirkstone][PATCH] license_image.bbclass:
> > > Make QA errors fail the build
> > >
> > > I haven't seen this patch hit master or master-next yet.  Were there
> > > issues with it?
> > >
> > > Just want to make sure I don't miss anything requested for kirkstone.
> > >
> > > Steve
> >
> > It is in master-next now so I assume it will make it to master soon.
> >
> > //Peter
>
> I guess you missed it since it didn't make 4.0.1... ;)

I've got it now!  Thanks for the reminder.

Steve

