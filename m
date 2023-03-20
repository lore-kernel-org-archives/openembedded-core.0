Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFE56C6FD1D
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 07:10:11 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.8234.1679296204678341167
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Mar 2023 00:10:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TQaADCBs;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id br6so13613578lfb.11
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Mar 2023 00:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679296203;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ALcfp8ojLzggmdeAjdgev+oIndvtyZBMMZS/r+oz3Eg=;
        b=TQaADCBsSOcwQ0l2t3loy7qj9JLadrE9UWxM4sk2rsrMCr8UEzAj/DmbiEShT3i62z
         iQ0OQNkh/Rzaw4XOLA8FlshzVnjqdfuWEGxG30Q7sWvlmdVFy4Vps7f5MHZUBZYUrKed
         NfJC1qqj3t5EXgw4kycr3CNjFiViNFwLUe+KnSGHzt3oGEy2QJ7J/dWk8eqYKgcy7WRj
         CwOrPcHPjOdbDBcGN8+B7UdUkL0aWCRp1Ykj/UcluGofHsG6K/bmiTOqD2JYs/Kj5Rlp
         3mHU5qeVVoB8MGm1/fowxvLECiAraZlC9r8EzT1bPP4XwGb3XdnVU2+g5ohyHzcbp+cz
         id7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679296203;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ALcfp8ojLzggmdeAjdgev+oIndvtyZBMMZS/r+oz3Eg=;
        b=MCDA202c0FAeaWWab5e2vaLLB0v+I92HPDpbGFLbIFMdofZniTu2fSCqT6jLUKsmq0
         3sJDW1Pl2fhcdJyqtwIifT/NFTwIqEvB6/UOIU0KFugPZ/UjHlWi3iQh2uVASPlnlZs1
         2ByUlLmt8cxakaBQL3WB23PjLJD4baJgScf2GB+7CX0ZXv2ma+9nM+uE1rpybsHWceqh
         gYw3f4rz0UId9d0o9bR8fcsaETp8i6mc9ddUrTLaOkM0RQQE3tyD/Y/ihqC0pP1kPDEf
         fuCA3NzNmrCTzSlCrVyPNmkiqvU6bPD6CXM4tQg9pZh9tLtL4h21msIAbdKF6Ef2Lavr
         NW4g==
X-Gm-Message-State: AO0yUKUcpMZOS0Q6Ca3MmmRgdlMci7peuLPAfGZ8vDJ4+KzE2aFkaFuL
	CAfwWhckAuNZtecYcFe7p9K6iTWz7dLhM/16r6a6f1MJ
X-Google-Smtp-Source: AK7set+QQWrWfdLwACY8HLHkJHEHc4FooSFLEXiqiX4pi49qesTaqpkuBj2EB1VO8syutp+9taXa35RM7VKeGEEwrls=
X-Received: by 2002:ac2:5f0e:0:b0:4dd:a9e5:aa09 with SMTP id
 14-20020ac25f0e000000b004dda9e5aa09mr6374843lfq.11.1679296202816; Mon, 20 Mar
 2023 00:10:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230316094102.2628727-1-alex@linutronix.de> <20230316094102.2628727-6-alex@linutronix.de>
 <CAMKF1sqhwupoW0kV7ao94DvdbxTH4B5i3HfMwOnp6M+g0g85Sg@mail.gmail.com>
 <CANNYZj9rnnKP_wGaqqg8ozVz1Q5ikbqccQCADshnFpuozG3MyQ@mail.gmail.com> <CAMKF1spQmR-yy3nvjDs6aDMKd-NB3yBMPTTCvp8XNptfYRPjPQ@mail.gmail.com>
In-Reply-To: <CAMKF1spQmR-yy3nvjDs6aDMKd-NB3yBMPTTCvp8XNptfYRPjPQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 20 Mar 2023 08:09:51 +0100
Message-ID: <CANNYZj8w3QZ5H4L76ZD=qY3YmLYDP31nrJQWxh+BS+Ub7dc=ww@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 6/6] mesa: update 22.3.5 -> 23.0.0
To: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex@linutronix.de>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Mar 2023 07:10:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178801

On Sat, 18 Mar 2023 at 19:38, Khem Raj <raj.khem@gmail.com> wrote:
> Perhaps in the next cycle yes and definitely for the next LTS it
> should be dropped.
>
> Its stll supported via Extended Security Maintenance (ESM)  and users
> maybe still be using it.

The question is: are ubuntu 18.04 workers going to be maintained after
18.04 transitions to ESM next month? In all likelihood they won't be,
as it is a commercial subscription, and then we can't continue to test
with it.


Alex

