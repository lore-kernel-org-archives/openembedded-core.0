Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3348C0502A
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 16:20:23 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web08.50636.1661617213662957703
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 09:20:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kX/sxxvq;
 spf=pass (domain: gmail.com, ip: 209.85.208.169,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id k22so4227696ljg.2
        for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 09:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=Btaoy3nq1fxB3cvAat86ZEBRIvi0AC/P21WvTYkZPDI=;
        b=kX/sxxvq+Nu4pWy3KgNqCrM0INSm9zC/7nCz7TYBbZv36VspQjf3K2HBcMdruciXa/
         gvbX4Hvh3IQhPUH5WjmaDKK6mYioJSh0hDcGMo5bvhmz+LNDgk/KLwpHtmYej8Zw3wxt
         iKHUa9EK+4UOxJE46m/BAW9Ys+IjYRrsMiU8cVoiKVJZJf+1ooP0QwA4KVj8tbNIbb0j
         VxqpHiKDo1YY8vKNGTFxRezfaI7b0/6h+z7gvziw6BNQIzvyO/VEFg6p2njzIAAhxx5f
         VAiTdjZql9GlB8RVgf7cWLw2gnI1S8LN6aZSZSc4RBC/xo4/GLmdEpkspnl1xP94qh0M
         A+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Btaoy3nq1fxB3cvAat86ZEBRIvi0AC/P21WvTYkZPDI=;
        b=HoDVwxUG56JOh6VUdASzuJ48mRK0MDesmb3V24j/dFK5XguL+PCFt/j/Cxx5DBbXG1
         qoVnfVg79OZaZJKXrYRsbohLxsdMmFRUEpMf02uX2Da7Q2cQYhaRA4ALhG1MP8PJYCd7
         B0iBsz8XaV/hpmn4lF134SpgcqVPq5UUJMZ16Iud34Ndu1EG2r79hxBS0sxdjRQtYtd6
         QqhnVUeHqeZPR6abqEIyOM9vivViDz2X2kdToaGsbS0th8f70/lbJsB2LnbPzHhqunQo
         lutNB2whI7ZUbk0TJgIIg0jZ6uabYnz91LVDqqRfszm6cnaWQmx/x7JTkVjNOmHxiv+Y
         IM/A==
X-Gm-Message-State: ACgBeo04MPBlC2KO8G8fwZ5fspYNmnN9UxLwOiBaIoUlbOni/xmvA2on
	tg9zsn2+RkweQd07Np90NiMwx49O0qXczbdjaz0=
X-Google-Smtp-Source: 
 AA6agR6whOXKiUjwtM1FyYkCZWsZyvq/qdbiE7dB5wP95yt3vXCnAWrE/QfHHNwk2nDeZjVgngRAzNV2KxJzFmvTu84=
X-Received: by 2002:a2e:9e50:0:b0:261:e3fd:cdc5 with SMTP id
 g16-20020a2e9e50000000b00261e3fdcdc5mr3632214ljk.56.1661617211490; Sat, 27
 Aug 2022 09:20:11 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CABF_=yi9-vQ4b-4qnOz+W5bbJmjRmk72YOog+GvDVBVyQ160+Q@mail.gmail.com>
 <CANNYZj-c97JgQnN-W3Ae3YzpWRGOO9hwO_xF0WDuoMsCaOwyKg@mail.gmail.com>
 <CABF_=yhQmn4Odw1wabzdS+_+D3tqpE0S6r6aCsuP9PbsudF9ow@mail.gmail.com>
 <CANNYZj8M+RfFmhPdM7caohuOtThORatkDZKuxL68xodDd_=v8w@mail.gmail.com>
 <CABF_=yhbfxZG7tPnRX3iw3nmY8DE9MQHr3vV15okerxompoH1w@mail.gmail.com>
In-Reply-To: 
 <CABF_=yhbfxZG7tPnRX3iw3nmY8DE9MQHr3vV15okerxompoH1w@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 27 Aug 2022 18:19:59 +0200
Message-ID: 
 <CANNYZj_mnJ+4YmGfjKd2xDMEoKNjO5L-_B+y0CFGJ=e8KL3Kwg@mail.gmail.com>
Subject: Re: [OE-core] makeself
To: jan vermaete <jan.vermaete@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Aug 2022 16:20:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169929

On Sat, 27 Aug 2022 at 10:29, jan vermaete <jan.vermaete@gmail.com> wrote:
> The recipe is currently in  master-next.
> https://patchwork.yoctoproject.org/project/oe/patch/20220826195403.893639-1-jan.vermaete@gmail.com/
>
> Could you review?

I think Khem's review covers what I wanted to say.

> What I don't know is how to prove the executables used in the script of makeself are those of yocto and not those of the host system.
> E.g. zstd is used by the script as 'zstd' (https://github.com/megastep/makeself/blob/master/makeself.sh#L535).
> But zstd itself is set in the HOSTTOOLS of Yocto

In either case zstd will be in PATH, so it should simply work.
HOSTTOOLS will also refuse to proceed if anything in the list is not
yet installed on the host. But didn't you test the recipe?

Alex

