Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 621F8C47087
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:53 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web09.2775.1649877424954588509
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 12:17:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=qCaOwyBG;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.52,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f52.google.com with SMTP id z12so3638634edl.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 12:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rHVFg2YenEDh2p9eolns3nUVLX/GpawymXAgJqg74xA=;
        b=qCaOwyBG7YtUBXZZzKfbXgBpf8BhDZgupAYMcyTwHXrsI/R4gexPESEgi1Qg93P/wP
         oS0aRS3wkQxWGZ6B/hvYWiLEISoVKHPMo39BwycBlVEB3QxsOz3PMdhNI7GqjMrs3sA+
         Nw7h8STZBUtf6F7diwIL7Jkc85q94QkUWytvzXmYxqzq9v0taG60DGM5Ib5TMXa+Hofv
         e9VtkWTQdIS4k+yxSXGwe36OtmIE5TcCQdu74qPAVC9yTemlXGUMcVpmpm8XsaH9jm6B
         T1fYlwwm0nWQ9QUDKqnpoRJARUSRjLt+9p4HymXX5dlanQfaefI6p+ZZRHp9LQnJYuLp
         0Svw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rHVFg2YenEDh2p9eolns3nUVLX/GpawymXAgJqg74xA=;
        b=Wrpr2u6HEKQt8RQtKI4z1FOtJSq7oJ2KlVBXySAEtRzg+shauXe0UeC+tJ2uIiSwcQ
         UdyVA1Bld/U1ml0wJMDuiuhrEsH8PkTYwKVgn9EyhvgetvQm6gCY/Jr0+oyQsQwysZ75
         OHxbhyx0LJznrQbZGsvIdW5O+gpEzGnixzEjfTRnhCeeDn8GuISyHgmCxB4Qal5OgT7T
         KwGk/0AhTAb2KnvSJ8KnqgUU5F6J4YxNxcdRneNPTIFOT4v/g7z9Kcj7WgX/HeyUv3AG
         yofxbR0vNsmJZEOg8cUMt2tKVv6qlCqTT8yyz44JX335Nd3UzWadRbcU/FmM7tMcOkEE
         xYTQ==
X-Gm-Message-State: AOAM533dwV1hy1sgXyBd6WEQdbOUfmkbxvnkMsK/X3y5xhK9e3dW0DOp
	wZmTY7gKTZy3ifxBsiptHXG+DvzYALKEqLcHXHSZ+w==
X-Google-Smtp-Source: 
 ABdhPJz0XWZe52Dy6npRCc7L95BjDVK3TgdXHOt1216DPoRP1ctRBIyj91FK1m+qvJlciSv1vHEr7p813zH8HWRg2N0=
X-Received: by 2002:a05:6402:2945:b0:41d:aad:c824 with SMTP id
 ed5-20020a056402294500b0041d0aadc824mr33217453edb.364.1649877423221; Wed, 13
 Apr 2022 12:17:03 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAOSpxdamJ5KMKxKMQqa1C-qAf4M_0-vq6hSifch0efzEScft8Q@mail.gmail.com>
 <CANp-EDa5OUxL_d301sXr5oV+q_UcmpU=bjd95v7ddyeCVS8w2g@mail.gmail.com>
 <CAOSpxdbuJOH8R9a9XWGcFNL6nvSaMB=au1sQ4AgiYr+b00Op6Q@mail.gmail.com>
 <CANp-EDZ-b6JYx8h1LRkg7YwCX9frZw=s_XiJ1_Ys-nBuyvhvxA@mail.gmail.com>
 <CAOSpxdZb2q7iZF+KCT2H3ajisK2pgQo_8cxbvxYQRgpnQqEKAg@mail.gmail.com>
 <CANp-EDZAM+4gQQ+2LJMRj00qwNGpMaPihtVOjZSk8HbbGzLUUA@mail.gmail.com>
 <CAOSpxdZ17NvKfsWxJkn0qwgNPCSz_WtRT9Ff=C6iiTxc1-bQRg@mail.gmail.com>
 <CANp-EDYtqNSKNMCmZ9tMvQDqv6r-29zSiz99sievky6GEm6q8Q@mail.gmail.com>
 <16E57E79FD292EFA.13992@lists.openembedded.org>
 <CAOSpxdYONLK8BhmNjx9uj9BDb0P=bAiJ-uAKG1edHjBnzvHc9g@mail.gmail.com>
 <Ylb9RoAyRpDHTaqe@mcrowe.com>
 <CAOSpxdbaE-=NOsQVG_+tK1J9oojA9qT8sMoR3c06uEssXJ0mFQ@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdbaE-=NOsQVG_+tK1J9oojA9qT8sMoR3c06uEssXJ0mFQ@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 13 Apr 2022 09:16:52 -1000
Message-ID: 
 <CAOSpxdYyFbSfZ7Jpz61AL_Nt1+Gg4j9eVjLK5+WgUFN_cXX-pg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][dunfell] zlib: backport the fix for
 CVE-2018-25032
To: Mike Crowe <mac@mcrowe.com>
Cc: Ralph Siemsen <ralph.siemsen@linaro.org>,
 Ross Burton <ross@burtonini.com>,
	"Mittal, Anuj" <anuj.mittal@intel.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164360

On Wed, Apr 13, 2022 at 7:37 AM Steve Sakoman <steve@sakoman.com> wrote:
>
> On Wed, Apr 13, 2022 at 6:41 AM Mike Crowe <mac@mcrowe.com> wrote:
> >
> > On Wednesday 13 April 2022 at 06:02:22 -1000, Steve Sakoman wrote:
> > > Both runs completed and I'm still seeing success without the zlib patch:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/5069
> > >
> > > and failure with the patch:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/5070
> >
> > I'm certainly no expert with the autobuilder, but it looks like nothing was
> > actually compiled for both of those builds - everything came from the
> > sstate cache.
> >
> > I believe that Ralph's reproduction of the test failure without the zlib
> > patch was from a complete rebuild without anything coming from the sstate
> > cache.
> >
> > I suspect that if a PR bump or something similar that causes zlib and all
> > its reverse dependencies to be built were tested on top of the commit used
> > for build 5069 then the test failure would occur then as well and
> > exonerate the zlib patch.
>
> A valid point, let's see what happens with a PR bump:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/5072
>
> I see plenty of rebuilds in process . . .

As you predicted, rebuilding zlib (and all dependencies) with a PR
bump did indeed result in the same failure, exonerating the zlib CVE
patch.

So it really does appear that we are chasing a bug in the native
apt-ftparchive command on fedora-35 (and likely alma-8 since I've seen
the error there too)

Steve

