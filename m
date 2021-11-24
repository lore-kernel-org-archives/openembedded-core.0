Return-Path: <sakoman@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC5CCC433F5
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 14:41:21 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web09.6955.1637764880594807409
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 06:41:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Kv4VoTlN;
 spf=pass (domain: gmail.com, ip: 209.85.219.181, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f181.google.com with SMTP id j2so7893496ybg.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 06:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9pevESi9ZmPHMqXpT4yN06vhfZPkiDTHuWAbL0wvah0=;
        b=Kv4VoTlNL3bKQbemajbvkNbklB1dIIlpBHvbbMTbLqr5/UEeaJpPaB01FOKd48eXbR
         1ca9gA79umW2xaCSFdwYc5pZno3fIZHnFd8+HMNNUGqDgChoJ1u5G34nIa/3GuURejgM
         nAxUx5HQz5UdLJi0PW57u4FvHPJRilu56PcCGwECY4ULBiREPXp1Q4qxAxYh+xOmC4Qd
         w31suVPgFhDw/kWC6FSgYTqGrZKQwQEdD+GOmxlFck0HX5cOWoXoUy1zZfNMYwascD1u
         pXaWvlo7gV7nk19Ry5HbbQ8uMti0REafM9SWBNAPPoXXGPqAd4T5hkQhZiuOz27JOE/7
         Etdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9pevESi9ZmPHMqXpT4yN06vhfZPkiDTHuWAbL0wvah0=;
        b=vFffDeOz/YHPHpmuJKY27+zUVYeUiaK7DaqgEE2zrxF+wP8soRLsHZncrgcjSr1W3a
         vKgWDHV7wPIpi3xo0rxlZAlupAGiWw1jEv6pgDDoMm9ktjJ4rwfpFzVaGgS31I3RIC5b
         nt9aAVXtkFF5fAP8u1Mgdy20fWhUqKxafhzdEkrdR67lUrXA2gB/D681M5ewWsUytdj6
         Q7Pef/IXdWUF4brzO5sLJ4AkEVmLTkHdQ4ZbQadO3TVcOEtBSkC+gjjFfjC1VT9s4kgf
         7MKs8RhWjwhl0amoi65NtD/eImZq+6QL9zSWrh3quVRvBixSDAbf0OHO8sZpoHtOglWf
         QtqA==
X-Gm-Message-State: AOAM533/MK+FDCTt9IJ8GBGf7mCVmlmuxT2muOMp59yz3mINdslZ4EbV
	CCb6CkWcwhB64iqYF0ljfeWdh6yIrCjxfNX9JXM=
X-Google-Smtp-Source: 
 ABdhPJyDvqEFO/NoRN0l+BBINli/vhsNqYgk00Ou8h2vOugv842oO6+NAa8sFzdBqqbS0mcrudugiY//SUdsLya5bY0=
X-Received: by 2002:a25:f414:: with SMTP id q20mr2666400ybd.206.1637764879510;
 Wed, 24 Nov 2021 06:41:19 -0800 (PST)
MIME-Version: 1.0
References: <20211124031423.76384-1-jatedev@gmail.com>
 <22784.1637724029635268629@lists.openembedded.org>
In-Reply-To: <22784.1637724029635268629@lists.openembedded.org>
From: Steve Sakoman <sakoman@gmail.com>
Date: Wed, 24 Nov 2021 04:41:08 -1000
Message-ID: 
 <CAGDS+n=GAynfwqtXR4TD+GBu-NRkmRdBdXQoeccPaJ=DcEek5w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] libdnf: Backport bugfix for upgrade calc
To: Jate Sujjavanich <jatedev@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 14:41:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158693

On Tue, Nov 23, 2021 at 5:20 PM Jate Sujjavanich <jatedev@gmail.com> wrote:
>
> Meant to add a [dunfell] to the subject.

Got it!  Thanks.

Steve
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158652): https://lists.openembedded.org/g/openembedded-core/message/158652
> Mute This Topic: https://lists.openembedded.org/mt/87274565/3617601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [sakoman@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

