Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A521EC4332F
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 08:53:01 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web08.5304.1665651172328793596
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Oct 2022 01:52:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZBuUtHuI;
 spf=pass (domain: gmail.com, ip: 209.85.166.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-io1-f54.google.com with SMTP id d142so795246iof.7
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 01:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sMrO6E3ELoRpQK++3OdrXKf0HIzCXYj10JoQcQtJZxU=;
        b=ZBuUtHuI8e10/P9ZjQ98L8XORu0CJf0wsic5hlSE7hSV08YIZLinzRHZKqvH+imF0Q
         KSthobZwSUFCB4PdkjqTZ7YEqb+GXLp5Q6OvYDXgqHKHgTiAwbYoqpAu1pZNs/WpVi9C
         PttQKeniWlMEFZ8nm+mu3DFUvfP1DYsHGEbXWlL1Z4tXF/rbJawpZP3+zo7fgidwVMYh
         UC7X+HYiKrlYtjI8XmeL7Guu5pKY4Gsko/Z1Dj3WBN1+yUgP1RpQ0wv9TSO3tKBGMfL1
         NNFc09yDP49X4HtV1SWj/RXOjhtFM1zG+K5YCkuruXDMFmNlGQk6lt5jHJUnjfH2z5mF
         LrTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sMrO6E3ELoRpQK++3OdrXKf0HIzCXYj10JoQcQtJZxU=;
        b=0ODo9PBlF0I1VuSrOjxYqKLwcqEhA83C7ZdZzG4IGe7qzxQqyHKe32NrIwSlAIb7hw
         QxrXcQCIROCRKdwQPAs6pJfY/EqTr/T3MIwfZq/LJL0zXn6eLhj+NAFITcAEEeftWhI1
         09nTkSMPyhwPgE1QN/no9pnRbw6VMLawnzC8mQ4T2uUUdSJDSl5O2WX9qX0qp2lMXp5T
         tFdcD5l1EjqUBo/X0PDYDbMic83JciC+MfRgQO3XcMQLC67pXJqTX0GiNgKPkVoSI24k
         OghtvWcIqHEOeZRpIwV1fTbXx0iNZJvTTM6C/n3hDI/OZOY0FG/eLYPmUImlRGbBvLS4
         chMQ==
X-Gm-Message-State: ACrzQf3uDz0Piz1e7xdW7mBXJWFRZ1UiG/LMjiv7EbnnEqU44mxE101T
	dWU2ThbzD0jygMcx49OLuNXLMBArJ5cbVR2MWFc=
X-Google-Smtp-Source: AMsMyM6hS5PBLJNi1dYM+Qoxh9pcooq5LTkTJCRlXmqcdtZc2e5kLvkxV+IAE2sKF2DZM0s7+c/IOMbCcn84moZu4Lc=
X-Received: by 2002:a05:6602:14c1:b0:689:34d0:a0ef with SMTP id
 b1-20020a05660214c100b0068934d0a0efmr15443706iow.69.1665651171681; Thu, 13
 Oct 2022 01:52:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220622103312.1098389-1-alex@linutronix.de> <CAMjhiJjWasCMS5G2JyjQrES5SwSQA17zYp2g5VfpaoLvN=L6Yg@mail.gmail.com>
In-Reply-To: <CAMjhiJjWasCMS5G2JyjQrES5SwSQA17zYp2g5VfpaoLvN=L6Yg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 13 Oct 2022 10:52:40 +0200
Message-ID: <CANNYZj9BBoVRpb3SYiyjXi=usA3bc0ORHzKZjzB8PfqycrE=Mw@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 0/6] (e)SDK workflow directly in a Yocto build
To: Leon Woestenberg <leon@sidebranch.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 08:53:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171693

Cheers - try the new layer setup and config management tools too :-)

Alex

On Thu, 13 Oct 2022 at 10:44, Leon Woestenberg <leon@sidebranch.com> wrote:
>
> Hello Alexander,
>
> On Wed, Jun 22, 2022 at 12:33 PM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > There's been a recent discussion about how we can make the Yocto SDK
> > experience better [1]. One of the ideas was to eliminate the SDK
> > as a separate artefact altogether and simply provide everything
> > that the SDK and eSDKs do directly in a yocto build.
> >
> > So without further ado, here's how you get a 'SDK' with this set of patches:
> >
> Thanks for this work!  I like this approach.
>
> Regards,
>
> Leon.

