Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 387CFC2BA18
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 09:53:04 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.52635.1718617983254411097
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jun 2024 02:53:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YhLBnceR;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2eae5b2ddd8so45926281fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 02:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718617981; x=1719222781; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R90Tugx1me41Rhi5TX3EyRWIGkZyK8Zy33Jg+mvW4+E=;
        b=YhLBnceR71+BzN9zy47e640N4HrJvJDRzrw7XKjZRKbY4Ae9J+K3ym6FkQA5dl8L9n
         3iBq+Q3yGGxn8LGSjHDnttqv2RHLe4n+v2iSERPP/0ipoBEiUsOA7jRQ4USDU9CQegCS
         VxgSp45d5TOYGAzoaEVN7j15Imjo/QOTwuHVgJV4+O5afU4HpprbmoDNEe7t7geQCWbC
         bug0sO4Q7+X6ygFhhBlp/nD5+ftZxKH+I8oWrqc1PeRH3Eyc+iVyP6eFieUL50OOztno
         S3byJdIlCZ/tSG0OIsE6q+POO8RzZuO65dIq0DL6mlTKC4LtCXAmh7eDoK4WY1HDoo7K
         TvxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718617981; x=1719222781;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R90Tugx1me41Rhi5TX3EyRWIGkZyK8Zy33Jg+mvW4+E=;
        b=AFkeDybmGUqc9+/sJxRt3W7LHqhrpUqBHjOmEeUBTD7nnQr/oaAgDEgZmrY2mRApv+
         3+ELmIKJAHEdopRaGCY/7DuZd9r8PN4RHs2R4FaFH6wT9uwRTzkCMdxKxSr/Pp4DAhsO
         4nrAmvu2sMkdaYEeU2NfkhxSe4EFTrkzJHAHW8FE7DIGQtdBVGUSVejBOTN4UclwIGS4
         UarutyJRibviE7WqxYiJ+OUQdvNmA/DCF+Khwh6v+P1amM8BgqskcJL3y4BiTyKMnI7a
         MljuxG/NZUmmXJRZ2rawvA6EbTlEJTtRtDY9DLJ9D7taB1AfLyGnz07Tv4yU5NsvYaJE
         8VZg==
X-Gm-Message-State: AOJu0YyZPydKgVKwjD5o/RBS0g9hjZMmsOo1PoGTrRQwnRL9UaOwQYAt
	3Prci2BgGFKWypdaZSrqIlwTig8Le846cT50eN5ISRE+OHSHO2/iEwaULOWDjcOHnoQoi0iuXl2
	QoOJ6Ltm+uLEQp1j06ueS/mJGh9Q=
X-Google-Smtp-Source: AGHT+IGtbuffmYfvabWLNdSC9jRofqqpWlrY8Zj5o1CXOgfMVBEjZ8sM9RKFqowwHMNFKgBqK37VsdRchsa1cDOLFMQ=
X-Received: by 2002:a05:6512:548:b0:52b:e7ff:92e2 with SMTP id
 2adb3069b0e04-52ca04643a5mr3830937e87.29.1718617981090; Mon, 17 Jun 2024
 02:53:01 -0700 (PDT)
MIME-Version: 1.0
References: <CALT56yPWE=nTn7jAPps+A7YCZ17Aw-U_OpfonSTYD90j5rwOAg@mail.gmail.com>
In-Reply-To: <CALT56yPWE=nTn7jAPps+A7YCZ17Aw-U_OpfonSTYD90j5rwOAg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 17 Jun 2024 11:52:49 +0200
Message-ID: <CANNYZj_okQmP9Lrruik2ekQ9k6B6_fyYmRToSuODC3BRP1apUA@mail.gmail.com>
Subject: Re: [OE-core] QemuPPC64 machine status
To: dbaryshkov@gmail.com
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 09:53:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200801

No. It's not tested on the autobuilder.

Alex

On Mon, 17 Jun 2024 at 11:51, Dmitry Baryshkov via
lists.openembedded.org <dbaryshkov=gmail.com@lists.openembedded.org>
wrote:
>
> Hello,
>
> Is qemuppc64 considered to be supported? We have been running CI over
> a set of machines, it seems that PPC64 kernel build is broken for
> quite some time:
>
> https://storage.tuxsuite.com/public/linaro/dmitry.baryshkov/oebuilds/2hzrcO3QvnkeNPVouoptwe4sFZf/build.log
>
> | /tmp/ccJSLBgE.s: Assembler messages:
> | /tmp/ccJSLBgE.s:765: Error: operand out of domain (18 is not a multiple of 4)
> | /tmp/ccJSLBgE.s:790: Error: operand out of domain (18 is not a multiple of 4)
> | /tmp/ccJSLBgE.s:815: Error: operand out of domain (18 is not a multiple of 4)
> | /tmp/ccJSLBgE.s:2435: Error: operand out of domain (19 is not a multiple of 4)
> | /tmp/ccJSLBgE.s:2461: Error: operand out of domain (19 is not a multiple of 4)
> | /tmp/ccJSLBgE.s:2486: Error: operand out of domain (19 is not a multiple of 4)
> | /tmp/ccJSLBgE.s:3590: Error: operand out of domain (18 is not a multiple of 4)
> | /tmp/ccJSLBgE.s:3616: Error: operand out of domain (18 is not a multiple of 4)
> | /tmp/ccJSLBgE.s:3641: Error: operand out of domain (18 is not a multiple of 4)
> | make[3]: *** [/oe/build/tmp/work-shared/qemuppc64/kernel-source/scripts/Makefile.build:243:
> fs/readdir.o] Error 1
> | make[2]: *** [/oe/build/tmp/work-shared/qemuppc64/kernel-source/scripts/Makefile.build:480:
> fs] Error 2
> | make[2]: *** Waiting for unfinished jobs....
>
>
> --
> With best wishes
> Dmitry
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200800): https://lists.openembedded.org/g/openembedded-core/message/200800
> Mute This Topic: https://lists.openembedded.org/mt/106717814/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

