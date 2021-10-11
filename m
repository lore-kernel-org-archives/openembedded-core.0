Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E74CC433F5
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 17:23:09 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web08.1602.1633972988779300520
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 10:23:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hXZVH97N;
 spf=pass (domain: gmail.com, ip: 209.85.160.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id r16so17045346qtw.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 10:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3uchpn55n1dU8qbQ972i3euaxQPoSPDBRVGT2IaVNOY=;
        b=hXZVH97N/bsXQquthqDd79wUY9GIvcBUaExn4fO0Wg9hIYfqPtIXSA92sfJV9ipRYv
         clsSxxvw2oZSMhbj55xd0//QU92g2vRtisPEnspmnNyFGdZaMZTvO6Y4Re9jUxQLzPg6
         bchRxv3Ac53dIh1Epc5SjYKI+oFjffzOpv+VbPqZEDgWLVPU7PoAjkvyROechGcfGKeR
         v80PbgW7JhD6mSOlnjOSxwIHL0Lq/l/rfzwVcTboSHff1ymSX0Ohs3LQ+DiOO2MiiqB7
         xR9POV7TkwYgvw/8kxbTm4ae2gIs35kCTKKfeSeaWuztgG28xGtdSmpeMTTXWgUea7Kh
         SBbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3uchpn55n1dU8qbQ972i3euaxQPoSPDBRVGT2IaVNOY=;
        b=PCiRvf0HUcL8ZPWrisiauJedLQXPrmsjeIX6FTrPlpekTS1G2YKTqP/QWJpS7uFaNB
         yd7+AyvlSMEcBJyVRCU3odxTa4hmCcBlW7CcWVTTBO1d76yTluMy8TpkGvr+8YwE2xHq
         wOUZzkCooLLUhCRwSCtBplCE+yFA/WilpCmAoTUACaSNfTdsf4bUJz05JVm3aBmGIDfK
         DzjY0Kv1eAuLdvOxeOxfEmCXifzAPr7Cf4Abwox7mPZfZz0f34EaK8EtkKk4Mcn99Aac
         bNCUhzEkSYe8onj60NQYJM/blhIWmMEH1p+gzRr/WH4+KjOXvDPsXHM6ay4Gnt6AFjvp
         X4gA==
X-Gm-Message-State: AOAM533gQV4ZqWdcOpYm7MFiMMbRUroGC6CxLare5iW8H2gZY1ehk9+E
	xQdSVWKTTY2qaiTINMDvhDe80M89f9pCTaYXbiA=
X-Google-Smtp-Source: 
 ABdhPJzTOoXLM7VjsASA21Vs6ljR4deT037FyMRiWPMO/UCp0PhnWFqgSzx/zfqWcRGDbFMFdbdSq9YeyAG3pbc4BhM=
X-Received: by 2002:a05:622a:13cc:: with SMTP id
 p12mr8049326qtk.227.1633972987883;
 Mon, 11 Oct 2021 10:23:07 -0700 (PDT)
MIME-Version: 1.0
References: <20211010191008.4122049-1-alex@linutronix.de>
 <20211010191008.4122049-13-alex@linutronix.de>
 <CAMKF1spWkdXuSBcc1Dkb6dkfiKxpKmkB6=2SsuaOyWhuu0NMkg@mail.gmail.com>
 <CANNYZj9WzJCXmZPC6PYQzBnrAGoynjCppXfN21mDoy79vaxs5Q@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9WzJCXmZPC6PYQzBnrAGoynjCppXfN21mDoy79vaxs5Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 11 Oct 2021 10:22:41 -0700
Message-ID: 
 <CAMKF1srYvBE7HFFwWDoe=q0TJpshi0pbvRZDuFGF7K546a1UgA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 13/13] rust: generate target definitions from
 (arch, abi), not just arch
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Oct 2021 17:23:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156847

On Mon, Oct 11, 2021 at 10:15 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Mon, 11 Oct 2021 at 19:03, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>> It missed the powerpc eabispe, If we are going to use ABI extensions
>
>
> The AB gave a pass though. If someone needs it on powerpc, they now have an easy way to adjust it.

its fine, least its forgotten add it as a comment somewhere since its
a regression, these issues take long to decipher

>
> Alex

