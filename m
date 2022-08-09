Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEFE9C19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 16:23:08 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web09.14013.1660062184715341551
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 09:23:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PUpPg/EB;
 spf=pass (domain: gmail.com, ip: 209.85.167.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id v2so9056562lfi.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 09:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aqK6WLNjGrgZnS7dq7GxKbbnHDcNfDSpAXkUpXBzgYo=;
        b=PUpPg/EBDSUkrzC1zrgO0A+fspFtenALiKo6VWdX88Yd6D92a8qRikIF/TmnZ6KTrV
         ezjtFfz8zKDdelqjBr3f8MAE1h7tAbAmjiPh5Y3LLh7ic3CfmM/eiVAEeBS9inLwU2S0
         lAFORkTZf5Iu37p2dMbsYreJB1l/CAf/BrXSdqhLYOzhsrTlBnaboaubyRvxae+m74BP
         Iqa7E/qLL/7vhFBYg0OQ1lGyaqJUgEJl2hI0V27/5zgwUz4XfNn8pdWQeZY9M0kYnf+W
         VBaQsvBh4+vyQUe+a02C2qZFTQNBuV48W78KMwJXmOsFao2aJcKLMIWDi9wX5NuPmiIo
         Q6QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aqK6WLNjGrgZnS7dq7GxKbbnHDcNfDSpAXkUpXBzgYo=;
        b=QEMvv+fx3BwD3kha3oE0g00mjpkwRtECHGfdy6qsOvJZ3zwsjXwu0ZQBfNAPtx0H3t
         59RkrM45cefHOCGoVoaPaQVRtZrlhKxg+w7MVpsnCyrvMaCtaRjjLk10MniR/NY/YFMH
         0ht/v1CLcIC4+RdTE+OmgtkVPnoBO8gQmiFcI2ljw1H96IsBEvz6icLwL+BGI1F1jr1+
         XsrgYgo012/vGkpHTwxjXfK5LL58EStpH4/ewFifbYKAyOCtLbwjdG8Uog5C5neyBrZV
         8Bw9YkGw/KlW6wXmFp7VG0dcze4KtChgZrsX0XWtNp3I0zLrcMaErxbPj0bT2lYNxyjh
         jRIQ==
X-Gm-Message-State: ACgBeo3LrbNs1xfRfNNlAuT+wvnHr8EvnFzawm2ffBmB/FOqElhKKOhh
	I1RHZnoy2uPOkYXakMcnREaSX9eQnFEeE8F1lfA=
X-Google-Smtp-Source: 
 AA6agR4mEHliP5NwTW2o5nLfA2B2c0zs0ZMB/O75sjX38iUP+QKCOkc1iUJA7ASz9xHNFipQ7BdC5I+nKe8a1z+4NW4=
X-Received: by 2002:ac2:4209:0:b0:48a:7386:978f with SMTP id
 y9-20020ac24209000000b0048a7386978fmr8235240lfh.521.1660062182749; Tue, 09
 Aug 2022 09:23:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220809083527.1221635-1-alban.bedel@aerq.com>
 <42071e5296d8b1df2e55086df95296d1eccbe5bc.camel@linuxfoundation.org>
 <51ea51600d49617d2f6c3b09d7684b205db517e2.camel@aerq.com>
In-Reply-To: <51ea51600d49617d2f6c3b09d7684b205db517e2.camel@aerq.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 9 Aug 2022 18:22:51 +0200
Message-ID: 
 <CANNYZj9gpUC4HWg7pKrfcuBegOFyxWK_++pWHF=pp-hSBh9EMg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sstate: Don't abort if installing a sstate
 package fails
To: alban.bedel@aerq.com
Cc: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Aug 2022 16:23:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169158

On Tue, 9 Aug 2022 at 15:49, Alban Bedel via lists.openembedded.org
<alban.bedel=aerq.com@lists.openembedded.org> wrote:
> > How are you corrupting sstate files? They're moved into place
> > atomically at the end of processing so this should be really hard to
> > do.
>
> We are still hunting for this problem, but as it happen on a shared build
> server with several users it is not trivial to find why this is happening.

Is somebody running 'bitbake -c cleansstate' or otherwise removing
items from sstate while someone else is running a regular build? Don't
do this, bitbake can't handle it.

Alex

