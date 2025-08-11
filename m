Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 271B5C87FD2
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 08:48:05 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.43539.1754902080291403618
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Aug 2025 01:48:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Uc6SkAd6;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-709233a8609so43488276d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 01:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754902079; x=1755506879; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b5WxLc1LRwlvwvsAZuhN4ClU8JD8UQpypEhRU1gETtM=;
        b=Uc6SkAd6dSKwlaXDejs41RFPiYMG8fwy+DfwisjXuZiCM4IxjdmGjkhH5RQZ43hklj
         TqxBQn4vAlmZ04SZt7hkWA7w9i0REjjoRU0/vXNidpT30j5PmYWVRWcJ/u95CvpYS+/4
         7QnU4eUh9rhxaIWTlLRtSOzMq993tATjSLgAF6UNnfzLnIHL03H+uJ5l+zmys5GPVtAn
         eBZtxiuC5nFeRArtQVTd4rLzLG9IMDLHd/YjTUvQqwHxymoxVFRGgqCxZlA+foMdvMfb
         C28MlsO5lfse5sG0tx6UvnLJ1PsrNGIFwnRZ8QvDdVLupfe9nziyjw1CC6T/LTWlYJ8k
         4Pog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754902079; x=1755506879;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b5WxLc1LRwlvwvsAZuhN4ClU8JD8UQpypEhRU1gETtM=;
        b=qyJ7fH6Sq6q0yCXNSxmxoEdnlM1vGDT5E8mTz4IwnWPcwr28LeDELIY3X+BB1aKVGa
         xjKgQFc0hb5Lox7PeqIm9VZijggLkokSZBeZwLsDdj945M49EU9k9tdVjHu/iS14LogY
         UJpBMoO3TFRlLDHP0K5t5IUTBbvHLNwDpL+0HdARWbFgAOzFLOKMZy1UsdhsX8j/ysT5
         ffwRpTh6nDBRhIYTf/AvQwLiPL0rkkRgTVApmVjzh2AM2KMVk13uqkjRjbkU859a9aZW
         4qOXl7cE+7dQftvK6Nxbw3Iu+wo734+C1/aqAWTgUmQoEKFJ9XKeJs9QbN2uvaTZ8rBu
         lp0g==
X-Gm-Message-State: AOJu0YxF2t4QmfgeLTpeqE+5c1TyAWDpZKrp756l6ex+K5Jn5WUZwyrA
	pulhKIRIXiKGKiF2EeuOMjBZXEnZen/zug4AS3rdrK1D4zJusH7wxNGkp8aSsosw8shyDIRoTm7
	EccmtQNNIL7+d0cCkXwv0lblkX4H6UOw=
X-Gm-Gg: ASbGncvkBZwRVRyRUs9gQwarHZ15qWIOWc1pnNOF8sEO6A/Ui/o2204WJ/BOygR1qeY
	sFsVsoNUjWozZQD/C0LrRx0UqiRgfAIRNfRiN0BBLd0uMxmsR1HXzS+fQ8xKjU+41br/5vgi4CE
	jnr0WNwj5/qwRDF2lgtgZaWdq8qWXdl0W7TIOFeu3pganp7+gKGaEHXv0rpKyQLQD7OPxUAr2K2
	3tsbSI=
X-Google-Smtp-Source: AGHT+IFca5AWboQ/z5q9diZTKQRrGASrZQITZVRt9k2qn/VQIGVRf2nq4H4P/Fu09kToF/u3enPQ9k4tFdNHTItDTN8=
X-Received: by 2002:a05:6214:1303:b0:707:2220:e077 with SMTP id
 6a1803df08f44-7099a2dd990mr189643276d6.31.1754902079173; Mon, 11 Aug 2025
 01:47:59 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj8_EA6U=o8fR98TA6upx9AzmSh+bf11bKfAuXJhY2G9xQ@mail.gmail.com>
 <14837.1754686511622096879@lists.openembedded.org>
In-Reply-To: <14837.1754686511622096879@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 11 Aug 2025 10:47:47 +0200
X-Gm-Features: Ac12FXyyuTs59EE16ksXPLUmSbPTbsyF5oqE1LXarPma3wE771a1_NeUlrOh9aM
Message-ID: <CANNYZj88MnY2QDEuK6cZtQt1xyBMeCB6LPp2xqLQzd0OgwB4Cg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] go-cross-canadian: fix binaries install and GOARCH
To: osama.abdelkader@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 08:48:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221728

You need to show what you did, and what didn't work. I am unable to
commit time to come up with exact steps that I verified myself. But I
can correct your steps if you show them.

Alex

On Fri, 8 Aug 2025 at 22:55, Osama Abdelkader via
lists.openembedded.org
<osama.abdelkader=gmail.com@lists.openembedded.org> wrote:
>
> setting SDKMACHINE and MACHINE didn't work for me.
> If it did work for you, can you type the exact command(s) to try?
>
> Osama
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#221668): https://lists.openembedded.org/g/openembedded-core/message/221668
> Mute This Topic: https://lists.openembedded.org/mt/114603001/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

