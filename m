Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD2D5C4708C
	for <webhook@archiver.kernel.org>; Tue,  6 Dec 2022 14:58:42 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.49966.1670338717038890790
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Dec 2022 06:58:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AbfM58SK;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id bn5so17537760ljb.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Dec 2022 06:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qfV+EqK3lq4bvN0TRfF1Mf8P3HtW3J7FMwVniqh20ng=;
        b=AbfM58SKxasyOyFpg2umx2NeCfs73o1+B1noQI8AkGf9n4zsJAlYqNgrCICoiSRGap
         +QE3qqKnwMuTXZz99h7zb0UPbuRUz5ED2aguhzHIcw7QJUGiFpWW8e5ItPdVaLS0tBpa
         RFgTttJNDXkIGGgbWdyB/a7OidM5cp9y797O0qKnUqbe6c1J/AwPKiYx3LU0T6m9tp9M
         gi9sIkaSRAYVFhMIfBQaUPqo5+OuIxopeSFhUi0dUGqVvYxvYlVhfXZArB4y4o5rLq2l
         9QHKU9ZAHqR3IdPWB1MNSw+yRWdb/ezGoYKPEIJYOo+LLSQC+wWutbjx7bNoiGEfsObU
         ACcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qfV+EqK3lq4bvN0TRfF1Mf8P3HtW3J7FMwVniqh20ng=;
        b=yysUgp3O/SIttcqTyjiXylEOslO8e3ect6lQT0gkoN+jhKt6qaX1r7NDJOkbeeuE8k
         q6ZCM/MUL06XBcIkzccBxA0vVghbFJnTwTbrsy2XMRJ1YDi1HOVweiLP6I3Hpm1k8xhR
         zl9qGf4dWPBpaQVg3o8+KMxp6Cwgm5qGAiET19X3UtpmdLJPbjRgYw2lULUTPCbg1bz2
         OL4UbJVyO9T/Q1Yuh6iovxmjLGQeHyM6wHGPWtqM27zqdv4zN+98sL23HDSKBcTFHlDj
         YtPcuMpUkWe2VV/LF2yArA93hMGrvqdzUHdFD00SItIUbp34g4waLZsFgfNGErKCzcjf
         N9/g==
X-Gm-Message-State: ANoB5pn0pFOiOKE3n6Dd0A6laOg4jP44BAJUTT8wshQBO+p/J6CeRBDu
	s0F/zVi+SJByfI1IorjOJ8isdzowvpAgKqpK4t4=
X-Google-Smtp-Source: AA0mqf7JtNOR/e5zoak5T1HzMbpOKVBsLeSTnZgaDccOhLY50tofFrEg/YZtr364b6n9tMJHK3GR4OzsBBL//7zvhAk=
X-Received: by 2002:a2e:be8a:0:b0:26f:c081:9aed with SMTP id
 a10-20020a2ebe8a000000b0026fc0819aedmr27097304ljr.222.1670338715209; Tue, 06
 Dec 2022 06:58:35 -0800 (PST)
MIME-Version: 1.0
References: <20221201190248.175753-1-raj.khem@gmail.com> <20221201190248.175753-3-raj.khem@gmail.com>
 <172CC0ECD8B86688.27320@lists.openembedded.org>
In-Reply-To: <172CC0ECD8B86688.27320@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 6 Dec 2022 15:58:23 +0100
Message-ID: <CANNYZj9WLFJ7WvKsutsSc702Of2f6j8fyZvJD11g5Bfkyeb+fA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/6] btrfs-tools: Do not use 64bit functions for
 largefile support
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Dec 2022 14:58:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174322

I want to once again request that the whole set is not merged into
master until every patch has an upstream submission link. It's fine to
test them in master-next, but please do not merge.

Alex

On Thu, 1 Dec 2022 at 20:08, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> On Thu, 1 Dec 2022 at 20:02, Khem Raj <raj.khem@gmail.com> wrote:
> > +Upstream-Status: Pending
>
> Please submit this and all other patches in this set upstream first.
>
> Come on Khem, you should expect this response, and I should not have
> to tell you.
>
> Alex
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174208): https://lists.openembedded.org/g/openembedded-core/message/174208
> Mute This Topic: https://lists.openembedded.org/mt/95389895/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

