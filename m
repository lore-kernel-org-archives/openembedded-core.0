Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1349EC6FA83
	for <webhook@archiver.kernel.org>; Mon, 12 Sep 2022 21:04:49 +0000 (UTC)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com
 [209.85.217.44])
 by mx.groups.io with SMTP id smtpd.web09.1408.1663016680043016706
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Sep 2022 14:04:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=wxpK840D;
 spf=pass (domain: gmail.com, ip: 209.85.217.44, mailfrom: sakoman@gmail.com)
Received: by mail-vs1-f44.google.com with SMTP id c3so10334908vsc.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Sep 2022 14:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=s8P+XRxzdDgHjbbV9TYUMO6BJ7fTD572xm82vICR9fM=;
        b=wxpK840DO8+5a8KcJr28zOUvI1eDreMKTtJbOT1sBKvudOcO1sIh+cZhDduMF3vtmv
         KXKMbcehRdM13SZ/h7lSn00rON2RNT/89kyZpv7TnWdd1bBasChYeb8r43wegIyYzCY3
         mif1R9jXGeKU8y2JiHc0ONJ0i/Fzfhl1Qn0KMxbBFGNxC0b26QMENbuky0LYyFtb3r0i
         Vmg+rohNuuxXLFTBoY4xA4UM60QUtdpK6cjPZA1IDMYyovgcnfXHZYPuCdFeNW4/dsz2
         kmZnCL7WkWu9gNPjqK/RXPaLL9ALaN3YaqzivpSfyrM6Dj1J1qRqOXYySIUUJFiv8JbK
         cSow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=s8P+XRxzdDgHjbbV9TYUMO6BJ7fTD572xm82vICR9fM=;
        b=0snYpRTXRViORdM/yADHPCC/QavLsa1mTRn2J7mldYaaeGg5+GuXdx4Ygm7jYjgscx
         BfyiK8c0OPm4V/ctznncNwnlpJjqRByOfR5DqUgjqWxSxeUeS+y9nyk6gWyspGF4Gkmz
         IIZCe0p1/APM8Dg8g0OAcaFridjfopK7lTLb4Rco6U4W6NpY+K7s+KLCTo6EJ3eh8h+b
         +SvO4xyysanUzGJa2pSm95jHc3dFSgv8XpfY0PDTj88qWzdNVNAe09mh4kCPB1F7/vhj
         0rGoi4sI6tMVOwNAorpK5IkIxcWbOQT3wOQ1lu5t8fYj3U49Mw9K+QZg3Gg/dMrfDEFd
         fL2w==
X-Gm-Message-State: ACgBeo02+D67RsVUbaLQUogMGAzVivOzYTSynZ1Eedcro/Hu74y+ZWfW
	M6knYxKcYH9Ejzin4IYqSrtf5Uuca/sXh53F/f8=
X-Google-Smtp-Source: 
 AA6agR4kXBpMNEqu9kYhjtuHo45HEIuMhLFfYiSUo+CMoqk3IJtuXHLAePiwK77eT+u0REzXx+2R8m5KyGyVtvN5kWU=
X-Received: by 2002:a05:6102:2f6:b0:398:5094:f748 with SMTP id
 j22-20020a05610202f600b003985094f748mr5253201vsj.50.1663016678981; Mon, 12
 Sep 2022 14:04:38 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAOSpxdY3j8DAsOQGhG9w1BJi+2ao4sO_KLvbkxX70fwbq8BfzQ@mail.gmail.com>
 <CAApg2=RssQ94dKngx=5ph_QbyZsWnqS7LRJ9rg67Q6b6bZbMWw@mail.gmail.com>
 <CA+chaQcks8Dmpp0zgizGfqSsRbp+YxMMvsgmae6YutVP5mar4A@mail.gmail.com>
 <CAOSpxdbSd4RwWPmw3mDq6KBjrbhEqNhUpcH-hNCcKkMTLQQJ9A@mail.gmail.com>
 <CAApg2=TAFnSuPZ6OF6a-+nooqYB7d42VNjKCMFVLJaW4DdbS+A@mail.gmail.com>
In-Reply-To: 
 <CAApg2=TAFnSuPZ6OF6a-+nooqYB7d42VNjKCMFVLJaW4DdbS+A@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 12 Sep 2022 11:04:27 -1000
Message-ID: 
 <CAGDS+n=pfO41_ySPy_6s8dhrjF+8Ax3bFAJbrrEtR33ANstMaw@mail.gmail.com>
Subject: Re: [OE-core] CVE raffle: collision avoidance
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Sep 2022 21:04:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170546

On Mon, Sep 12, 2022 at 10:01 AM Marta Rybczynska <rybczynska@gmail.com> wrote:
>
> On Mon, Sep 12, 2022 at 9:16 PM Steve Sakoman <steve@sakoman.com> wrote:
> >
> > On Mon, Sep 12, 2022 at 8:57 AM Martin Jansa <martin.jansa@gmail.com> wrote:
> > >
> > > You mean this list?
> > > https://lists.yoctoproject.org/g/yocto-security/message/655
> >
> > Yes, I assumed everyone was aware of the weekly CVE list!  Did you
> > have something else in mind?
>
> Sorry for the confusion. I meant that exact list and suggested to use
> it as a reservation list without manually looking into this thread and
> verifying with the three different CVE emails.

This is a dunfell only raffle, so there is only the dunfell CVE mail
to look at :-)

But ... there will be 7 or 8 weekly emails during the raffle period.  So putting
all the reservations in this one thread seemed to make more sense to me.

Steve

