Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDD61C433F5
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 10:24:29 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web09.49608.1638786268783937881
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 02:24:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=XCa7PNxj;
 spf=pass (domain: burtonini.com, ip: 209.85.221.45,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f45.google.com with SMTP id o13so21264037wrs.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 02:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LQuazSKkTfjD+/QUjkmj43xXoH4vW+eHqIE357XLi6E=;
        b=XCa7PNxjaHN79yUQfHNaFkQlHRabJIAKKb+AcHNYDpu1yPeL/u15T9xk4HtPHVaJmz
         zW+pxdo7wQqIKc7g1/KrCkQnk4gJVCGJPUU50BUH+aB/BwkknikLgoseLlVnIS8ZP6kX
         Drma/ynd0VItJ/HXgv2EL3R9Yjh3hftSsRnNq/BMhS+9SuBixcp6VIrh9m9jyJwRb/CW
         8EDG3ig5UuDf9aMQpHRp+kNOveWlN/xZuacnDFwyHfcGrXQgZKaNV5ZwXiAxNrgJ52xC
         2NOJRPUadJtkMMK2DQJQSoHSPFgQsXzSVsJ9ba/L+D60QZ/dBWJQGvcVkfsJfY1EjgLA
         wqzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LQuazSKkTfjD+/QUjkmj43xXoH4vW+eHqIE357XLi6E=;
        b=1GJCq1+F/cUCz6caP8gqIFb+eyISWzjYTT2vCOTDCW6O5CbMFOwwQg0/rKDOuCUICm
         xBxrW/7XA/W2LuKSugplyzNZ+HyCq3bXB1OfMjR/JFifkx6+3aL8z6Ahs7DeXOWsI49d
         /pTXf0AR2wV+3y8tgrqaig6yHXicncQkL7KGOxgrsrmwYIH52uSfNqp4r9g5oeeis8Xp
         D/SdFGQ+uLgV8mLE7jJAjaYGDnrHKWlhzojNhQOr5DZZLBAfvMGjKLb9R6d9i3SBnb95
         lV0/v+MKXjtY3Wba6dQrssxN3DtlwHl3I9dpxt08Zj+QdvE7rXMS879yo+kd55Ct/M8L
         UcxQ==
X-Gm-Message-State: AOAM5323gTrBF49UeVtfuEglqaysGMyoPf9Xtd+PEmlccj0Te2SKMtNc
	WxKBvqvuOLyv0YnhxSGFMSHzpzCHXwU6W/b9gTI/Yw==
X-Google-Smtp-Source: 
 ABdhPJx7a3j6g3+CFF3q6rm8eVuKDqg0AspzBxyb+GQP2luEWP1e95cu2yvrMmuso5att55v2UcySi2MJZ24YyCu62A=
X-Received: by 2002:a05:6000:186e:: with SMTP id
 d14mr42654086wri.376.1638786267050;
 Mon, 06 Dec 2021 02:24:27 -0800 (PST)
MIME-Version: 1.0
References: <20211206083629.2591982-1-alex@linutronix.de>
In-Reply-To: <20211206083629.2591982-1-alex@linutronix.de>
From: Ross Burton <ross@burtonini.com>
Date: Mon, 6 Dec 2021 10:24:16 +0000
Message-ID: 
 <CAAnfSTuCwTFgkKTSVXUtO3e7nT82yWpMO_h11EWE01Q+PgC9gA@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] insane.bbclass: lock down pending patches
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 10:24:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159214

On Mon, 6 Dec 2021 at 08:36, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> Misuse of 'Pending' patch status has been a problem for a long time;
> let's disallow that in any newly added patches. Please do the upsream
> submission at the same time as you submit the patch to oe-core.

As much as I hate pending patches, and I really do hate patches that
sit in pending, there are situations where you know the problem, can
work around it, but still want to push it upstream at some point
pending further discussion.

"Inappropriate" would mean the patch wouldn't be looked at again,
"Submitted" means an upstreamable solution has been formulated, and
"Pending" is that middle ground.

Yes, we should push back, and if a new patch is added with Pending
status that is clearly good for upstream we should be asking the
submitter to do that.  But I don't think that effectively banning
Pending patches in core is the right way forwards.

Ross

