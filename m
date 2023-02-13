Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABE61C636CC
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 11:39:37 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.12469.1676288368348947474
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Feb 2023 03:39:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gzSMWIbK;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id g28so5867115lfv.0
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 03:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OqnPMm7x7pWbEkPi7wSJsjY+myHRF4XTMVvX9IivbS0=;
        b=gzSMWIbK/zbzudgJHO52gHmjedgWvUgdpfD1/a9Hg7WOoAXQEBTwx5syn//8lwuYO9
         GlYjDVD/4mUB2ZnQQOXDnpWRVWZgynVMJX1dodmSZsAxoW4WBcjI0B50ras/b/vEVgla
         2hH6uKI2JIZWUOyOFdLJTDlINZdXbHXDMVF1sI3ZnjOvjpuJ4r+ignCB66u+tYi9r3hp
         gO/kk/MsbHY66o5QblAeExXfpXRxXf7FeeOccrtDudgnUzmpouueGbYD6C+OuTSxhqcF
         QfhoNFL2f4sPQRR7KKBgyOuSKJcpMKUQk9RNnwcM9VKbsgykI3PJ09ezhpXBIcIOcEFO
         pV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OqnPMm7x7pWbEkPi7wSJsjY+myHRF4XTMVvX9IivbS0=;
        b=srMsZAZvBlzrYPkbOK3xGYrB82Mt58JgkvmLo72fX6/bn9gF6UoXykSvOXNmfaU46l
         o5n5yccvs3vWj58HRX2t7Kp01z+HBKRQFPy5NHKzg2JpeI1A2ixp28swW1OTt4LI+1qZ
         cHvrVvUbeV7qyUsWzipwMrlgqX6koBRgk5khUbzLPTREuSgDYBcp2WbYmCXNYzcaWDrd
         bgE/a3d+kJOJmLWhyqFuuvQKvEAHkjfd6/q5RZWy8iVptwEXWNulF0BF7EaAbGubwqXF
         kFbA6UurIWhr3N2hNsHUJttmWli1krhejHr9Tchu8sWtBQ1HNKhpdqxlDFoYXmEbwrFG
         azqw==
X-Gm-Message-State: AO0yUKXdJI3aLvMSCx4+j3YXmaJnG5J0wVVAtZehkWpNFQ+g8vZsLvp2
	oKJaWnNP8MJqswnVmbU9P1PiihyKNDpHXvXaLc8=
X-Google-Smtp-Source: AK7set+W1Oz2yKz6+MnI2ZEbwf97n7D5AGVX3g4N4sw1/RwOvYrfufVbYw06GAcazOSROvy4M/rFm4olXcMC8ofLngo=
X-Received: by 2002:ac2:43af:0:b0:4da:f3a6:63b5 with SMTP id
 t15-20020ac243af000000b004daf3a663b5mr3674846lfl.243.1676288366466; Mon, 13
 Feb 2023 03:39:26 -0800 (PST)
MIME-Version: 1.0
References: <20230213104228.1067057-1-f_l_k@t-online.de> <CANNYZj8KiZfFD6-BvTNv5oSQ5pNg_KX7_qF1hfNpip8WLM=G-g@mail.gmail.com>
 <17435D409BDFDC2E.12482@lists.openembedded.org> <RPN0QR.78GW1EDG5GW2@t-online.de>
 <CANNYZj-r5n+s6P8TyOuSdniATzPZnvGsxLSMb33rQF+FfBTUWQ@mail.gmail.com> <K9O0QR.HDTIOZR7P56X@t-online.de>
In-Reply-To: <K9O0QR.HDTIOZR7P56X@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 13 Feb 2023 12:39:15 +0100
Message-ID: <CANNYZj-zx6p+6aGzxx1hSqyCH=6X2L37dGGCyGba6fb5-F6+hQ@mail.gmail.com>
Subject: Re: [oe-core][PATCHv3] graphene: add a PACKAGECONFIG for arm_neon
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 11:39:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177101

This seems best. There are numerous places in core where something
similar is used.

Alex

On Mon, 13 Feb 2023 at 12:37, Markus Volk <f_l_k@t-online.de> wrote:
>
> Am Mo, 13. Feb 2023 um 12:30:42 +0100 schrieb Alexander Kanavin <alex.kanavin@gmail.com>:
>
> Does enabling neon break the build on non-aarch64?
>
>
> As far as I know it breaks runtime for some armv7 tunes and will probably also break build for older arm platforms that do not support neon at all.
>
> That would also work:
> PACKAGECONFIG ?= "introspection ${@bb.utils.contains('TUNE_FEATURES', 'aarch64', 'neon', '', d)}"

