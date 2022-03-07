Return-Path: <ardeleanalex@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B650C433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 13:07:24 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.25833.1646658443412433380
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 05:07:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eKKePmB1;
 spf=pass (domain: gmail.com, ip: 209.85.210.181,
 mailfrom: ardeleanalex@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id a5so2130990pfv.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 05:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vXerZ101ExHs0loCkW4YgY44TJ5WiwV34GkGwdo9yfk=;
        b=eKKePmB1H2HhJbJASO+/batshSFT1rApUoqGpLCvLYxTIYBLQ2tEGdMHhOZa15NkRj
         IRrqvVHH4E8XRrz3Y26sdgtadYb7gJ9N6r+VgW53YtltWDlCqO3EEertBTroJ4usw5Ju
         D+/dJugl2cgm7jjglgF8cINSsFA2+DFJcKGzEPF4VfFLpEQIKBwgQzVVT8gfoRhpdJ6+
         Ggucf66cvp/b8qATdsIHm30AxCLchT+KsqWeszaywMEILnRYueYp5ps+NN3eBry+7Bgv
         mjCQUq2op/HoJNaRTOM5lmhnFNR2ZgmWHzrEnJg/h7hk8H+VRejra+PFhlANUoHi/bQA
         ANig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vXerZ101ExHs0loCkW4YgY44TJ5WiwV34GkGwdo9yfk=;
        b=sjxPf8f44KvtbPLsmn/trVq1BDC1H7O902Hpxp0B0C6D/cg7uoJRI96Ob2lzEs48rd
         6acbo1W4n/yDNvI9PdTfnTuGQtBu2MsArDxtjskrka8IEdeL3vtBWFyaUyJDxgA4Sr/L
         pf9EAlv+EOmzIB8eLzqApl9weOd+PPWQbWNWD4jgduD6PTjEn5A4sztLvyW2Kdkw0Cc7
         BsPolaiNGHaGVSCBqhN6altDzkirq4GB5E/tJI7BBvOZucTdnfDv4HdsniACPW8iVhjf
         CaYByvbcF8mkFvR+buTcJu75WFRF6eSRtPqqzbiOCUY1YZBKOSjSlXI0R8r/d1Cnl7m9
         aLtw==
X-Gm-Message-State: AOAM533N0tp0RYOYCTfzOfTznV+GK2yiE663ZbWQyx0r0T0SrVTA9qxB
	AR8nj/GPpGpIv0qKssXvD1CZiyk0J7PxP45Clgo=
X-Google-Smtp-Source: 
 ABdhPJwX3WQK4YrlkmkltuPATswpTL7rmxkXV6CvE6OSxMpYRQhOhQ67WjNH0Vtjj1lWB04eZXvfBrDz/BiIquAYCQg=
X-Received: by 2002:a05:6a00:1307:b0:4b0:b1c:6fd9 with SMTP id
 j7-20020a056a00130700b004b00b1c6fd9mr12732285pfu.27.1646658442873; Mon, 07
 Mar 2022 05:07:22 -0800 (PST)
MIME-Version: 1.0
References: <20220224153034.5140-1-ardeleanalex@gmail.com>
 <CA+U=DsrLoHsQKqVb06hqnL3UvHJotM5yxBYnvN7y7KM9Ec2tdQ@mail.gmail.com>
 <12d5c909469e4ced0ab136d0ca5f00cbe45567c7.camel@linuxfoundation.org>
 <CA+U=DsrXewjnaWp2DQM8u=V9AS49vGKcdt17b5kyZ8eth_8LOQ@mail.gmail.com>
 <49dbf7f4492322649e7876c110e94de4f82bcf77.camel@linuxfoundation.org>
 <CA+U=Dsr74n=NT7w-TrrpQwv0_9iHQYnGNCU8BobebjKQ5sbJXg@mail.gmail.com>
 <eda53a5cb864d7dfec2f8e7d180f4e291419a921.camel@linuxfoundation.org>
In-Reply-To: 
 <eda53a5cb864d7dfec2f8e7d180f4e291419a921.camel@linuxfoundation.org>
From: Alexandru Ardelean <ardeleanalex@gmail.com>
Date: Mon, 7 Mar 2022 15:07:10 +0200
Message-ID: 
 <CA+U=DsqOD-1iyykdDB0srZrQiw5Z-u0vWRTBr-9oO=9g3Swhsg@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH v2] libsndfile1: bump to version 1.0.31
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 13:07:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162817

On Thu, Mar 3, 2022 at 1:23 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2022-03-03 at 12:54 +0200, Alexandru Ardelean wrote:
> > It didn't look [to me] like it would be too bad to me either.
> > I wasn't sure what the decision would have been (from OE), to
> > [1]patch-out libopus? or to [2]add libopus? or [3]revert?
> > But your patch suggests [1] is preferred for now.
>
> My reasoning is that:
>
> * libopus is in meta-openembedded, I'm not sure we have a strong case for moving
> it to core.
> * I was happy to see us move to a recent more up to date version with the CVE
> patches dropped so reverting seemed like a less attractive option too.
>
> I just wasn't sure if patching out libopus would be possible or not. I therefore
> had a look at a patch to do it and that shows it does seem to be reasonable.
>
> > Did you get a chance to test it?
> > I can run a test on my system with it.
> > But it may take me 1-2 days.
>
> I've turned it into a proper patch and will test it on the autobuilder.
>
> > In the meantime, I was a bit busy with this:
> > https://github.com/libsndfile/libsndfile/pull/812
> >
> > It kind of seems that libsndfile people are talking about maybe
> > splitting up their configuration.
> > Let's see. That will be in a future release anyway.
>
> Thanks for discussing it with them. If upstream were willing to accept a patch
> to enable/disable opus, that would be our much preferred way to handle this!

Tested your patch no-opus patch.
It works for me.
I have a running system and I'm also able to convert the OGG Vorbis
files to WAV.

Regarding libsndfile, things are a bit on hold.
I may bother them next week.
Reference: https://github.com/libsndfile/libsndfile/pull/812#issuecomment-1059762147

It looks like there was a proposal (3 years ago) to split the
configuration, but it was NACK'ed by the main maintainer/author of
libsndfile.
Reference: https://github.com/libsndfile/libsndfile/pull/400

Now, with (me) opening the discussion PR 812, it looks like this is
being re-evaluated again.

Good news is: there is already work done for this (splitting
configuration per Xiph-codec), it just needs to be pulled back into
the present.

Thanks again
Alex

>
> Cheers,
>
> Richard
>
>
>

