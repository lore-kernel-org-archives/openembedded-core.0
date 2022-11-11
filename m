Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C657CC4332F
	for <webhook@archiver.kernel.org>; Fri, 11 Nov 2022 17:32:00 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.127.1668187919101940739
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Nov 2022 09:31:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ayluaObR;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id k19so5267462lji.2
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 09:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3kHfhqGXUh+vwql5TlWKB1m1bqq8OytdKN4/x9cfhiA=;
        b=ayluaObRuN/DpH16n/erVOi919pk4qEwW1eRek7cy4ZW7lr0ykqpMxNKKkfTPJB8ui
         wdF3xxrazW22TPiIJ4i40oZWQn30ZRUtShojReEeT+9B5pYLm0F7O7cT3ap6qU2XquQG
         iiNZb4b+sXeFEgJn5mvrN6hz8XhTHOs2LSo1MQ7ybSd3Ig2qWaVkUkzSHiNg8n7TOmcZ
         yTJ7OLexJUPga9tRF2zU2ZLvllGeFBfvOlOw9AgaRkDbbqItyyQ9OKVMhZr/VCw+mSMj
         57N9TfrtQ+0QRqRmDURGjU28WWs0vUniAT9v3okKD1X4Ond+K+IBKMWeAtVLJgFaRd0d
         /fiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3kHfhqGXUh+vwql5TlWKB1m1bqq8OytdKN4/x9cfhiA=;
        b=KddLX+c6/69lrWcjpO9qyJU8YPixyOjNjJ2lERYRzp8ZyDIqucX9ebcghCVcir6Q7/
         a/VUEtbCYG0XDVaCDddHneE/n8/6Xbg0gWI435oyZrcsuCoa+Na12/y5HV9796MrE4Yw
         onXAbXhh8d2fAkI15tqSwpK9SZKccZ8cYaslY+BGpFgPygFeDTvbkVST5PmD1FKMmJwH
         8hSbAubNnnGrNbPB9kBujF2f1BymbyGReAyiCS2KSXvnJB4QR59cDDdiK6yZHR7EMFY9
         /RejzU9SotPkZNDB/2w1/9YAkc7TqhjRioWbhpvY0dp7jDSyjnliX+KpgYMhwPQmY+PM
         xjyg==
X-Gm-Message-State: ANoB5pnvUB0hbv3ug54AjpUcmCuflPPsrvto9srkevtU0Y7DzcE9mnBI
	IxALZzhwj9KxeVDuFZI7Rthtpk6OrP/BPtuj1tI=
X-Google-Smtp-Source: AA0mqf67ADRa4puCCOef11rujnyzkt5utIVUFtnNH0gGuozq4KYpqDKpqW/uWaTIa1htEO3fbiAz/7Buu9KkOmgyaBI=
X-Received: by 2002:a2e:300c:0:b0:277:524c:f83d with SMTP id
 w12-20020a2e300c000000b00277524cf83dmr1053445ljw.217.1668187917102; Fri, 11
 Nov 2022 09:31:57 -0800 (PST)
MIME-Version: 1.0
References: <20221110204232.12768-1-jorcrous@amazon.com> <20221110204232.12768-4-jorcrous@amazon.com>
 <CANNYZj8Q4yDjr-=-u4VCMYf8khBDUmwu9+c7qKezqKSx-9grZA@mail.gmail.com>
 <20221110213024.ob3bvz4g2hsixmu3@amazon.com> <CANNYZj8v2Ps2GTJv_4hhGr09VjPWO2LwHPOFUcncenX8SfCY8g@mail.gmail.com>
 <20221111152755.ztodymtsd72kbdjo@amazon.com>
In-Reply-To: <20221111152755.ztodymtsd72kbdjo@amazon.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 11 Nov 2022 18:31:45 +0100
Message-ID: <CANNYZj_PcTYyN37oKEDU7+PFSXJSZLHjqmLNS0XugV5DkqNZGA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] vulkan-validation: Add the official Vulkan
 validation layers
To: Jordan Crouse <jorcrous@amazon.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 17:32:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173136

On Fri, 11 Nov 2022 at 16:28, Jordan Crouse <jorcrous@amazon.com> wrote:

> I agree that the existing INSANE_SKIP was the wrong way to go about it -
> perhaps the better option would be to do this:
>
> FILES:${PN} = "${libdir}/*.so ${datadir}/vulkan"
>
> I think ${PN}-dev would nominally be empty anyway - the two
> outputs of this package are .so layers and a .manifest file for the
> loader.

I suppose we can do it that way. You need to send a v2. :)

Alex

