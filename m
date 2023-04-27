Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71C06C77B73
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 07:49:01 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web10.15032.1682581733358860323
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Apr 2023 00:48:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ESpBjM8e;
 spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6a5f21a0604so5983836a34.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 00:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682581732; x=1685173732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6keHTuk2Edl7touT4AkOz6nJb+U9oguZE8LlEzDAdCI=;
        b=ESpBjM8eLvRhZ21wRLOwELwkOlfOnzuRycDGYU5+2YO3P/lJEuBJjYDkXGXZSX0WOm
         lQzGTumL5a27ApUNcZnSHaSP0M9mP4vrIi02ANhGSOIVTfbSKQuIXmzb7xvWYTbDvW+r
         TXqh73kLkzPjF3QIJ9zGfRuz7YwIOUVSDJLQXsKXImZSynAcsYE6VAhs/5IPCl6p1/+H
         4iMrJYVOCrWrJFG7TR0XhvriaxINJyxQJ8tms+w5u2WNdm+9/xsc3cklFsnEhNkyi/ov
         4fPUP/ZBHM08Qc0a1BKznvhJFCx4+bbSJzDexnRQSyofCT9jnTSvQXK69uuIa4jXYqys
         gvYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682581732; x=1685173732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6keHTuk2Edl7touT4AkOz6nJb+U9oguZE8LlEzDAdCI=;
        b=dlgfQLgnqXra7fPhxV6ePM6wDuJXAJYCXQhVIMQPVS0Pu2+wibqGiFgsEOT5kKZU0H
         m4FeWXKD5326l7MHJ4YMTsef2k9vbBSbPEVo4adLKYiFXQt+fHVnY2kmQ9mpnuUD0Za2
         McjTdapNDi3ZlOAsfdpEg2TZcS4unrLP1K/w+5nQdKn4cyQifC9NqDsxnybeaLyQr7gW
         AJmPSntiyVtsBEA76TNGZ4uzKcbRJCih4oFB2LymQezyAZMF0IlF+MFLV3GZ9Qj8mGRv
         6dX43YHFND4FJSmbCl8CFl7Du0RhpUUDcic7Dp+s8OHF+WJivAE4LWK7SbKT8ObT8xxw
         TW0A==
X-Gm-Message-State: AC+VfDzUIam0cbdg7BKb1qapvTFVfd6UuMums1XC8c2Xib9D8A524FSj
	58DsIwoQx0qiUeppwMTm5sotDnNW41FklxInZdY=
X-Google-Smtp-Source: ACHHUZ7aeOagBNXu0DKamsv9JukzFJFWy/NaNZlU6fmq+7GPQwfuAqmB2knl7UEy17kf7nKLXQDxKw1EI1pc0+6HVg4=
X-Received: by 2002:aca:d14:0:b0:38c:9f1:2c88 with SMTP id 20-20020aca0d14000000b0038c09f12c88mr244535oin.32.1682581732371;
 Thu, 27 Apr 2023 00:48:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230426095036.2632847-1-alex@linutronix.de> <20230426095036.2632847-5-alex@linutronix.de>
 <CAMKF1sqsu_F4JS6f+=TfzJmv_Eq7VKpTFDd5OeBXjzRez76P8w@mail.gmail.com> <CANNYZj992xUKdM6pLka6wUGDNyXcc+p5ZaL62E6i_7s_RLPRmw@mail.gmail.com>
In-Reply-To: <CANNYZj992xUKdM6pLka6wUGDNyXcc+p5ZaL62E6i_7s_RLPRmw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Apr 2023 00:48:26 -0700
Message-ID: <CAMKF1soV_hmE+f7ed0r=jo+rQcWyJ4SU1vG3T2YGAqZQsgReWw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/11] bitbake.conf: set minimum required kernel
 to 5.15
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 07:49:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180481

On Thu, Apr 27, 2023 at 12:20=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Thu, 27 Apr 2023 at 09:04, Khem Raj <raj.khem@gmail.com> wrote:
> > While this might be good, does this fix anything specific for enabling
> > 64bit time_t.
>
> Yes; please see the link.
>
> > This change means we are implying that yocto wont work with kernels
> > older than 5.15  and maybe SDK would also need
> > 5.15 on SDK hosts and similar need for build hosts might be imposed
> > too. Perhaps it would be good to do some due diligence before
> > applying this.
>
> I was waiting for someone to say something like this. :)
>
> SDKs are not affected. There's a separate setting for them,
> SDK_OLDEST_KERNEL which stays as it was, at 3.2.0. Kernels versions on
> build hosts don't have a setting or check, and that never causes
> trouble. The focus here is specifically on removing all uses of 32 bit
> time on 32 bit targets, and as a bonus, enabling other optimized paths
> in glibc that are only supported with newer kernels.
>
> The implication is not that yocto won't work with < 5.15, it's that it
> is not tested with such kernels. Which is fair enough, isn't it? If
> someone does need an older kernel (and yes, I'm waiting for the
> 'outdated vendor kernels' squad to come out and lynch me for this
> change), they can reset OLDEST_KERNEL locally, which would confirm
> that they should be doing their own testing.
>

It will break compatibility with older kernels because we are telling glibc=
 that
we have 5.15 at minimum so it will assume system calls which are available
upto and including 5.15 and some of these syscalls may not be
available in older kernels

by next LTS it might be that 5.15 is commonly used but it still
remains a problem for
precompiled binaries and libraries etc. sadly

> Alex

