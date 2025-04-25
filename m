Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBADBC369D3
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 17:29:22 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.12099.1745602161238926462
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 10:29:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S9ki/upc;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6f0c30a1cb6so17902286d6.2
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 10:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745602160; x=1746206960; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SmvlY3FVbv7HN2A4bV0oLEHtBshzm9VHwhAv53twThc=;
        b=S9ki/upcG+a+w9kHgfjpk4oHohsw+LCnItfiJiuLTZziy37mkkve0BQLwix/M0qPsV
         4u2I6CYfLzvcwyUc/V7rHejPQJrJzAP8VHnVV5NgHZ4xWGluY2DV89OoizyYM88G/TtI
         r2ZyZHBkXOoyveJdWnGv6gUwZqQg35xt4+0M+J8b1KJm5W73aHQ7NDJgSMAiNVvv1KCf
         L0AVvJWz6qemGqjp3WC1zjE6tcJqTzcrDCHbQh/fzR+G2Jgt3yovCkYdFqL9kFejxEQZ
         nxrEg6jL60m0DUtixrHFaPPsvLuBFtb7iUc1xYgvXdXbIi6H5pCPG30Tl1LCSAxM97hY
         BEog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745602160; x=1746206960;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SmvlY3FVbv7HN2A4bV0oLEHtBshzm9VHwhAv53twThc=;
        b=DwxO6TUe/quSytCWIduHcMu3ae/MUcfRPaMij4tjtO9jCQreTp30aODJ5Pu8+KWzfV
         auM+5Z2fRulOUSogtf0+KxNvVzjwvcavMTSrCJvrkp3+SsrmRaMzk6u9Xomx4ip1nssL
         RYc7AqOend41YNeI7osPLNEyh/VY829EGDYlBh0Bn8QPA7jwiYWZXJQqNBdgQv0dA9gG
         dSZVJXcpPkAf3ITPpV4K9K/VWMY0+NiznsRKpGM424e0g8A9xmd+Mnwk6+IB8w96BHu4
         20I2cs1T8sge8QQxSopRVN4+Vl4llWCszcjvn50JgwqQ4TnHyC6rt2HX35fbJmzNXQtD
         dYVg==
X-Gm-Message-State: AOJu0YyvTaubGomQjaQIIabmk+RcDr5qBzrAp4DLsHfRwf3dk8+UlbXv
	yHMe6lQr5OubMA4N4ZeEi3/p+nJyeuUv7JRLCEjbV9r9P3SUtdFQEGpYydl4Ib9AlqOj4Z+Rbu1
	toje/uE05fiHYyMiw8rwe6UFeVDM=
X-Gm-Gg: ASbGncuI0dIMxJbo3qjYqpegWb8EdYa9zELuQ9Nk8v9AC9a8o0ZBsuoxAM1jkWkA4jF
	ztscih/ibgf5uu/UEBYwPCrMhzpfUg/QjPRYTvtV0SK2gLb6ctrCXjWKRZGCia+hziyVWJRcx1M
	2gOj0/LH1HdGN4yp8szVMabl4OhoUrgOE3WBhrJeykBe+mwkrHjogksn49
X-Google-Smtp-Source: AGHT+IGtwT8oABHmg32RX+f63B5pQysa5bXItEM8DqAISbP5U12KVusFugLX8y38YdGB1Evw4dPPMZhtiNcegfSvwM4=
X-Received: by 2002:a05:6214:f0d:b0:6f4:c237:9709 with SMTP id
 6a1803df08f44-6f4cb9d6fdcmr56707896d6.25.1745602160307; Fri, 25 Apr 2025
 10:29:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250424111014.905507-1-alex.kanavin@gmail.com>
 <cf05b37db043dd939ec540a24ae0343376e5a830.camel@linuxfoundation.org>
 <CANNYZj9hiQ41Boji0OH5ecRbktL-5nH3q3o0=k4+XxRZ=nu2ZQ@mail.gmail.com>
 <18394019E7982924.8448@lists.openembedded.org> <64802f57b85b524ef1bab88b07a116e5af228d5c.camel@linuxfoundation.org>
 <CANNYZj8eA1vnm6hO-AAn=xNEyMxrBGf48GTtiQOzW7w3yCqHKA@mail.gmail.com>
 <655a8640b7d8f528851f187558d19f8285e111e8.camel@linuxfoundation.org>
 <CANNYZj_j9TnJGEsfQ9fuivKQ0KcZgSyCc-OXbyXvzOuy2=S68g@mail.gmail.com>
 <db5f670164880a45133b2133b3957214b3ff0880.camel@linuxfoundation.org>
 <CANNYZj8ooWqS1OXO7M+S4wgX8sVkWG3wTiCb5s-bnZhE9CxZRQ@mail.gmail.com> <a0571f14790862528506c994f349a78517031624.camel@linuxfoundation.org>
In-Reply-To: <a0571f14790862528506c994f349a78517031624.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 25 Apr 2025 19:29:07 +0200
X-Gm-Features: ATxdqUGZ6OkHAoVdMtStW_TTOjQpR3zf80SctN-7zIWwxj-HH14_ORyuKKmKVEU
Message-ID: <CANNYZj-g2t4s86QBTvEYj5W1GPA_z222FeeNz4GUqYmhNMtG0A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/4] devtool: account for sources in UNPACKDIR
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 17:29:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215487

On Fri, 25 Apr 2025 at 11:31, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> > 3. This will also break all the tools that assume the current
> > structure, and another reason this change shouldn't be taken lightly.
>
> Perhaps, or perhaps not. Do we have a lot of tools that wouldn't cope
> with this?

Likely Visual Studio Code support will have to be fixed? Impact of
changes like this is difficult to predict until they're done. Then
everyone comes out complaining their private scripts broke.

Otherwise, I'm slowly getting convinced that this is the right thing :)T

> That 'logic' is effectively what do_unpack is already doing itself to
> maintain 'compatibility'. Perhaps we could use the same logic in both
> places and be consistent!
>
> I'm torn here. I could take your patch, bury my head in the sand and
> pretend everything is fine. We could try and actually improve this and
> set things in a better direction for the future, at the expense of
> breaking things in the short/medium term. I don't know what to do for
> the best here to be honest. Taking the patch is way easier for me I
> doubt we'll ever improvements if I don't push back on things at times
> :/.

Here's something I want to propose, feel free to shoot it down. Should
we start by just dropping support for this legacy compatibility of
sources in workdir, and S = "${WORKDIR}/something"? So S, when set
that way, becomes a hard recipe_qa error, and sources are always in
UNPACKDIR. Yes, there would be a ton of recipes to be fixed, but the
fix would be largely a search-and-replace. Admittedly, I didn't follow
the arguments around UNPACKDIR closely and it may have been talked
about, but why not just do it?

Then this fix for devtool wouldn't add more complexity, it would just
similarly replace workdir with unpackdir - not making things better
but not making them worse either. On the other hand, if we do nothing,
then devtool currently doesn't work for recipes that set S to
unpackdir, negatively impacting AUH rates for one thing (this is why I
got into it in the first place) :-(

Alex

