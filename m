Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F40FFC4345F
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 12:19:03 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web10.45393.1712924338812584978
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Apr 2024 05:18:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=tqRi0Vxb;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.180, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-618769020bcso8418207b3.3
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Apr 2024 05:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1712924338; x=1713529138; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DaEIVsi6N7A/NTEL7b1c1Uk9DbeB86tefcvOVx6SThA=;
        b=tqRi0VxbKXXKDRF53Cj+xvPiYSnSbq9ug6MUqu/s9vpBlSfNeOlT04bUPLMSB92XOC
         Xb7L6IuDFUGjB42R1STyjP+ehrK+YwCUqWJ2gMdBmrhP+PRXzqSI84oV3LNyLxQ3TXsN
         WccU7v4GDctuqjQfPL/nBu8XHRYMkm1wuAKt5nKNGywf8Vwulnu6vo8rdudWhXjCP/lQ
         P0eYp6FPtCUvrCRo6a3T0io1VXSkT20osRX4jxqyUfOjEew7OeSA4KJttllLURP8FxVP
         +mVAqPEGRDEZmzFky0TUeavp8O0+GWBzUJFMKcncczMl7WJKf//+SiXWqoRX+tSX+PB0
         qiYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712924338; x=1713529138;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DaEIVsi6N7A/NTEL7b1c1Uk9DbeB86tefcvOVx6SThA=;
        b=VG0ppFGdbcocR6uQ6xKEX0rhyibWFf2Mq9CSJUL3TljHS2oHn9kUBAk8OPzkjEhaX+
         1rGyzbZqLBdmpMj13YSxmKxdp2T7AyjUT0RK9ArV3n5tQGGDrAjTSyYfTor265/XXtGA
         bsEzXmggN5kMxvZI7p5s/jDVJFO0dwt8LWLS2Idgj7pyV+/gByI3o0RUy3pobcxqFgZU
         GjpZosnvrVRMjAcalwPgKkO9Osw5D91liacN4LgXI6XFRTXOv6AF3yAEfUpALsHNSOWW
         AQs6XurB2GkUQjeZgEWKwoo80W08cqGClJ1BN7ncuu5ZBvDd4MbrSbU5EYPF97zwAcfp
         a8Jg==
X-Gm-Message-State: AOJu0YwfC2SMEMTuGlpLTbmug3HLXx42IkmWE/Ss13OKQO9ySu0/umeg
	1iRtHJhz+BDQ3dENwsIzUdtcJ0BKAzznIXwXkeFy2cI7KEwsuCyapVlTyJuXlJC+2VvX9xylnSG
	aWGBPpnNnFBr/6l20qigUooNTfzmB634qQ69DPvzKFYNwEhjit5U=
X-Google-Smtp-Source: AGHT+IFJYX0rffnfav4DjdY9VtG5Fa3v7PrV5EuIcs9TYv1pLCbquKz5pFOZOGnGOqi0MGOuVsE72t89A9LUOyicgOM=
X-Received: by 2002:a0d:db47:0:b0:615:79f1:8297 with SMTP id
 d68-20020a0ddb47000000b0061579f18297mr2363378ywe.0.1712924337805; Fri, 12 Apr
 2024 05:18:57 -0700 (PDT)
MIME-Version: 1.0
References: <a357002eff78472d58c5864cd6f258eb67450fea.camel@ew.tq-group.com> <28425.1712915571508713687@lists.openembedded.org>
In-Reply-To: <28425.1712915571508713687@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 12 Apr 2024 05:18:46 -0700
Message-ID: <CAOSpxdYNy1HDvh_T5kPX_O2Epk=VvfvTLMtz8DM12j3gM=nk7A@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] kernel.bbclass: check, if directory
 exists before removing empty module directory
To: Heiko <heiko.thole@entwicklung.eq-3.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Apr 2024 12:19:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198165

On Fri, Apr 12, 2024 at 2:52=E2=80=AFAM Heiko <heiko.thole@entwicklung.eq-3=
.de> wrote:
>
> I used "git send-email". I don`t know, why the tabs were replaced.
>
> I have attached the patch with tabs. (Or do I have to create a new post?)

You should send a new patch targeted for the master branch since we
need to fix this there first before I can backport it to kirkstone.

Thanks!

Steve

