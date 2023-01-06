Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4F2EC3DA7A
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 10:58:49 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.11287.1673002721584728731
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jan 2023 02:58:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pl6UzJHh;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id bu8so1487276lfb.4
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 02:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Bcw40SSSvRHlYUZR/vTVq547NFoq96Oe20EDpJ3XT0Y=;
        b=pl6UzJHhODAKbTmAx4rPPt51AFbiwZT5Y3f6lhhvGRg8B/24Syezk4XZxJNb/VVdRc
         RKk9siNCpxWH9eg1H5BUVN7wd/d7dRTABCqCPMx0RdL/Uzk+aJgkA8OsA/ikH59G/GNT
         u5nVygBPUGhv6LxEcPDPWzGyw0hA8dFZvy1FuJtDmipjuzmOOSGzImWsl8K8/nJ6hbVv
         Q0KJGiubz6TfM3PR3YHvs0bywa1PlNRP4hAPEOki5L8GUSc4ghNRiTv9Z1mugRDh6qEt
         ldhNR8ytMqG8xJ436eYN61T1lvaRJGhX3AE2iatNprGkVr3OaHvCKKWARtPrtVW39sDF
         z9aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bcw40SSSvRHlYUZR/vTVq547NFoq96Oe20EDpJ3XT0Y=;
        b=I62xnXX+8bhKgLDic8WeIg7Zdb6lwWtgBHpncmkmr5uMm3tQoO3RGc+TjrhAr0FmDb
         KOxtzAT+Y0/7OnJ5GxjYnOqRgYPvgGuuAeP2pKNpi0zRjSd9erDtXTP4jOAYMMKtTHx9
         IQ4blsIU1/ub2huAHzjIgtdPu8dVRSK46NVESBWXv4AMcL6ci7LIBTb/uBL+rUPGmTZZ
         3onhE+j77I4ZcbWDc3xB9282LQbLAc2896nS2oiqTEtMq2gBuDUW8HoRZ19Yg3ETE8iv
         Gy3pS79UDursK6RziL9f7JwuzKbz5WQ4mEDoZa+UubadpUU8/n/BB4mpvGxkn9mIhPf6
         2fQA==
X-Gm-Message-State: AFqh2kpcJRUctddR0wwE8vAT8dtCwXgaJ/2Lwa05zgpBLo67Cdo2qBcO
	1cFyLXEpJhEPq1uiwSW20O3CVQTXmmDzF72cI/0=
X-Google-Smtp-Source: AMrXdXuXrX42KqHJtjA7hxZ9XNQwZZkWRbf7q6zEa8BIjJKF8iXyYvqFpo0xtkZNwNZk83vtR64797lCw8Wy9vDzKs8=
X-Received: by 2002:a05:6512:261f:b0:4ca:fd2a:d984 with SMTP id
 bt31-20020a056512261f00b004cafd2ad984mr1929899lfb.445.1673002719583; Fri, 06
 Jan 2023 02:58:39 -0800 (PST)
MIME-Version: 1.0
References: <20221223093229.823322-1-mingli.yu@eng.windriver.com>
 <CANNYZj-iY82hN76qV6DZSfMHobF30hM7rKRXkVwFUYGDV1AkJw@mail.gmail.com>
 <CO1PR11MB50090C2DFF0949D0B90ED483F1FA9@CO1PR11MB5009.namprd11.prod.outlook.com>
 <CANNYZj9GAPNapBr3PyxAmj-JaiGRV=EnR1YqZnPXA5Yuf+_02A@mail.gmail.com>
 <CO1PR11MB5009A23CA03A78D7FB67DA2EF1FB9@CO1PR11MB5009.namprd11.prod.outlook.com>
 <CANNYZj-BCH5XkMMcYMQSAdKSk-YGYLf5xk-pBbt6ekC6qPaa3Q@mail.gmail.com>
 <de6ea321f2dbd0eb5b7d1fd867af7327f0bdb1a2.camel@linuxfoundation.org> <CA+chaQdcQvYMVd3f5TSGprmGNMZdTRFRnk1QchaFnVpbCJZjmA@mail.gmail.com>
In-Reply-To: <CA+chaQdcQvYMVd3f5TSGprmGNMZdTRFRnk1QchaFnVpbCJZjmA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 6 Jan 2023 11:58:28 +0100
Message-ID: <CANNYZj8Tq60ynB-xVZEnN60NDW+MmDk3fPR5HaC4VLGNgU=yow@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcr: add opengl to REQUIRED_DISTRO_FEATURES
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"Yu, Mingli" <Mingli.Yu@windriver.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 10:58:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175574

On Fri, 6 Jan 2023 at 11:47, Martin Jansa <martin.jansa@gmail.com> wrote:
>> For example, imagine the dependency is "virtual/libc" and somehow you
>> break the providers of it, i.e. break the glibc recipe. All of a sudden
>> "bitbake world" would return success even though it built nothing since
>> anything depending on virtual/libc was magically removed (which is
>> nearly everything at some point).
>>
>> The conclusion I came too last time I thought about this was they we
>> really did want to mark up the cases where things have a specific
>> requirement, even if at times that is painful.
>
>
> FWIW: here is the earlier (2014) discussion about this:
> https://lore.kernel.org/all/1414675717.7649.56.camel@ted/

Then there's a more specific question: should we treat opengl as an
optional distro feature at all?

We don't treat 'posix api' as a distro feature, even though
theoretically we could, and in 2023 opengl is pretty much on the same
level. What is being gained by ability to block it out on the distro
level?

Alex

