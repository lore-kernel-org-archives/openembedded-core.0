Return-Path: <armccurdy@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73C0BC433F5
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 08:56:31 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web09.6457.1637312190155611909
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Nov 2021 00:56:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=c2hoSIXR;
 spf=pass (domain: gmail.com, ip: 209.85.167.52,
 mailfrom: armccurdy@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id bu18so40438844lfb.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Nov 2021 00:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SUeR/SS47w40HeZlTtz/FSiJqqO6eirRDAQJglCqS90=;
        b=c2hoSIXRpDiGl5Czy5pp/uXYHPGQpjrlsZWCHW41wXbBurOFcQcg0jsH7TsSQoNf9v
         2ScJGR4Yg7TiCs37BPiHtNE7wYFs4AieaTxsIC6vGcOxBETCd5lVR6JphEFvdpW9OM5T
         r7U2/gvQeAlYmfZOi1aPH5urbzK4K67la5X7mEAlJK2jlFKKi68s0GIvYvPHuAA9a1qI
         mSGWKQRwCaxEUa5sV+SgzTU4CEwpJURsIfP+23PfvBC53ezYRetwT8itiD1b1+Rp70Vd
         ogwFETkJ6Nb8uatUmDyvBTCz2Ph58CepHtNmxyUX7F5t5Qh37YIEDMRQjlSo++eWue9W
         FNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SUeR/SS47w40HeZlTtz/FSiJqqO6eirRDAQJglCqS90=;
        b=PxhJTIQznTT84L0ASxqSacCAGOhLM1hWaH0wM01tvjPbtsF0qO2TF4T58bbF2BHvrU
         Io1B0Qp2gKFrxobSnEGIGISq/mYktahCuBBZppL4jybbDUo8O7cYdU0Twx0jXlmufUJU
         dl3UWeIlO4+PWq4Zb/Eh8yh/DW5goIzKEE7tusCd3X4aHtYAfvvvbYQGCJwFsXcdgM+v
         sul6+EG2xM+v1x20Z+aKN+VfLrs+A1vFuvSog7xf6GeWYCvENwfzwvTObIAvv9M63Y63
         Y4qU42Mr3q83caVw04p7sJFqFOPQvHfAgD5OxLJ3ZKGQ/uPboxPJowu9/76UVUM7NVIV
         zkPw==
X-Gm-Message-State: AOAM532fFaviW3xyMEszqTcfa5lGxZ9hsK7FGkPlE+bSzk/SQ+2T+Z1L
	g7c4p/uR36/ZXio6jO7U5CHcI8uVXzlMdyZ/PY4=
X-Google-Smtp-Source: 
 ABdhPJxeuuhv4Xmx3q0M/+kDI4tEtMx4GHhPDyxFuF2JcyUaynljss0S8jWe1wuHSdOrWV9DFraoWOIdBPqeeFv0PSg=
X-Received: by 2002:a05:651c:98c:: with SMTP id
 b12mr24611052ljq.481.1637312188199;
 Fri, 19 Nov 2021 00:56:28 -0800 (PST)
MIME-Version: 1.0
References: <20211117153525.257146-1-alex@linutronix.de>
 <20211117153525.257146-34-alex@linutronix.de>
 <CAJ86T=X-uLwWJTf86dJueyeZBdcxhvVWvQbrj+06mrRz6dL-4A@mail.gmail.com>
 <16B874A872BAAE14.8846@lists.openembedded.org>
 <CANNYZj9g5RRyQbU6+=gNZQ0OXbgC2OVtWYtnNbW_bAvRDT4_eg@mail.gmail.com>
 <CAJ86T=XEZ4jqyujLiUoqtw0wODUtxUVvVLCzQ3jDVihwF67nCw@mail.gmail.com>
 <CANNYZj9EwKk810HdJxHSNogBa49a32W4tvmTGbcY0+qwjbwm5A@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9EwKk810HdJxHSNogBa49a32W4tvmTGbcY0+qwjbwm5A@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 19 Nov 2021 00:56:12 -0800
Message-ID: 
 <CAJ86T=XzRk6oCdEtQ9BTqTgF3SMcfkE2t+m4V3afaJmpYdDkRA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 34/36] busybox: drop
 0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>,
	Nathan Phillip Brink <ohnobinki@ohnopublishing.net>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Nov 2021 08:56:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158500

On Fri, Nov 19, 2021 at 12:17 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Fri, 19 Nov 2021 at 00:14, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> > So everything that is supposed to be there is actually present, and the patch is indeed unneeded.
>>
>> Looks good. If you have the full strace logs for both cases then it
>> might still be useful to check which (if any) command lines are
>> changed by removing the patch, but if not then removing the whole
>> patch does seem OK.
>
> There is no tooling to compare strace files, they have process ids, and probably other unrelated files that needs to be stripped out or matched.

I guess looking at the two logs in a graphical tool such as meld would
highlight if command line options completely disappear, even with the
noise of differences in process IDs etc.

> Just to reiterate: this is for the master branch, and I do insist on "if AB is green then it works as intended" - if issues are found later, then the right way to deal with them is to improve the AB tests, not ask maintainers do even more manual work.

Yes, and I'm agreeing with you!

> Can you help me review the remaining 400 "upstream-status: pending" patches?

No. I made the decision some time ago to stop contributing to OE. Not
planning on restarting now.

