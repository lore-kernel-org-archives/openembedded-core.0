Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35B08C433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 19:59:42 +0000 (UTC)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com
 [209.85.217.50])
 by mx.groups.io with SMTP id smtpd.web09.1745.1645127981225759838
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 11:59:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ezbEeKRx;
 spf=pass (domain: gmail.com, ip: 209.85.217.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f50.google.com with SMTP id i27so7536280vsr.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 11:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xNoXGskugnTGuC9vM7N1CVdxKfQfoe1vuxUlHCxXko4=;
        b=ezbEeKRxVNuzLs4na4dYTbGUDE0yjm3+LNsQTEdkdjjwCMi/9CTK++sOio/0tnnR69
         sex4j+btynOz7ItfI5OLt5XPB6TJK/dgFKbekzakZjNJEy0MJOtVq/qGzDSolh7VNlUd
         LMCTE2fpKzONX6nnTgiX0QIErT/EW6jimkfXVsKgvK55zWI8zDx+s1Uy639UXtx1hm/v
         2fQZ+vmwfurwhA7Basxzecw4iQaPz/Spf6gP1odWFNE06gWpxqT2/BH8Ws5PJ9VOj/ui
         bxsaL7rX3D3piOHBq6WDkcqS5mLr/UqtST10R2oH1UAfHtVREtbYBtAh2uxLsSFeZPEy
         mcyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xNoXGskugnTGuC9vM7N1CVdxKfQfoe1vuxUlHCxXko4=;
        b=P/Z/CztBJYdgWPCBi5BYtWpxeSdNRSavZy/J1AfnGRnm9gMtELikRGmE7u30VnqDyQ
         +Fwj6x3Tca0veFoMB7qnRH188ldWD1Rx/KDgRhV/lpkBfA2tAlo75kSB1a16mGrUyFJu
         a1ohR7wXgzINmQsmngOX0YsIhiqe3AfogwBN9o7JaX1EkxQIIe7r+fSy6G51YytakwnP
         0fmgcuiHCPj/AjjSVKNpULKw0CG5M33qxthQAR6/GDjgWCWeCOKA4eIFXApoHeYo5d+c
         KeyH61lQoTa1GqPZrmBozxISYsFNWId+ELu0MD0pJLtDHcSZ008eX9UoAbLBO3jTX4L/
         ss1Q==
X-Gm-Message-State: AOAM5318apcWaxHDX2tDucPVHkTNhZs0dSi6qmTvaAGz0v0EjNFl4suz
	0MAtmhwmC2CZDT5hL3CnsPHTXMgxxIwfy8CiFCY=
X-Google-Smtp-Source: 
 ABdhPJwUrKh0I1flByNqRHwn6MVf2b8bP8ALHSS588TsCLtvBoN7t2veT+xT1fb5yGbQ9BtyJqFEXqO1KE7V7g+WrWY=
X-Received: by 2002:a67:e113:0:b0:30e:303d:d1d6 with SMTP id
 d19-20020a67e113000000b0030e303dd1d6mr2160862vsl.38.1645127980368; Thu, 17
 Feb 2022 11:59:40 -0800 (PST)
MIME-Version: 1.0
References: <20220217160939.1424397-1-alex@linutronix.de>
 <20220217160939.1424397-2-alex@linutronix.de>
 <0d022bb4-9fe0-effa-d6b9-50812f060cdc@gmail.com>
 <16D4AB147C5087DA.27018@lists.openembedded.org>
In-Reply-To: <16D4AB147C5087DA.27018@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 17 Feb 2022 20:59:29 +0100
Message-ID: 
 <CANNYZj8gG9vxKmU=5AU_7RV51Zji1b=mOT8fcdDqvvo-N9-Z-g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/28] weston-init: replace deprecated/disabled
 fbdev with drm backend
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>,
 OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 19:59:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161856

On Thu, 17 Feb 2022 at 20:57, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
> Yes, I ran a-full with this change on top of my transition-to-weston
> branch (where image-sato is swapped for image-weston), and it passed
> with flying colours. Without kvm performance may not be great, but we
> can tweak that with --use-pixman later :)

Ah, one exception was x86-x32 (seatd doesn't build there, and swrast
historically segfaulted with X11), but that target should be changed
to cmdline only testing, or removed altogether. Intel invented it to
look better in benchmarks :)

Alex

