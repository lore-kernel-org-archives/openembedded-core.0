Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D7B9D0C5F9
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 09:48:27 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.8507.1729849696701859642
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Oct 2024 02:48:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XElpKoAO;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fc968b3545so18936781fa.2
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 02:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729849694; x=1730454494; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IpUJCup1hTtkJUccSMtpvdZZ3eQ1Lc1AW4lQsCnqUc8=;
        b=XElpKoAO2gNspS8lkemtRc5o8ZGGoKfCrFl+q1qCqTs5LCq8TbENuRNgZogMnOo4TS
         idFGNOaMv2DdUrKhCeJH5Njn4pyQEYcZtvOox6NBxUtdm/rH/mZbPiGcNx/cO2lYY/az
         nVbL8Re41tj37mH5zcITIbl4E3yLO0xoA51kswim3Kj+FoyK1UKxkE1eU4VSFfhbu+d9
         M0DAlb+cWfqSpd+w9i4aXD0mIJptcqm2p7yU/DNoRi/srTOlw27W90SKCrA6eCUA9xkX
         ufxyccpdS0CX2ggK72VobuIC7Zzm9FRl5iw6E4pPNBKi13eOX6drd2OEJpCNiisOkOw2
         HCnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729849694; x=1730454494;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IpUJCup1hTtkJUccSMtpvdZZ3eQ1Lc1AW4lQsCnqUc8=;
        b=wOGSxm9HozrtJnREJPzqQbcxzml4m5A0glm9okzJAlVPG9jUdmSMk4ecDM2+IqOh7Y
         YrLVHjIFS2mXJfQTEPwp2E5xIv1ZTn32un6KSvhsPH/81YyucPfHp8BcvUlqlVdurUUI
         4siEB0kCFPYyuoLEVApcqAAuv84gY95VD9/B4eaOdUXVsNd2pG4mwac9C+/D5Hemf+cp
         fN7Pk392wYMZiw4EhuXiDnRBjO6eDTc6OtOXocRXSwE9CKo4Y0jP5QFSnfztFCWulY9R
         jcCw3gfMcawxP+gI/R7B3kfNYkcs2+N+dS8SJfDMOkCXCILWRS9e2XlL0+rDhJt8K0ya
         wiDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBj3RTZ1DqsvUnBOtWI/u4W7qgeOwpVIjSIn/Da8sJEJ4hRCPj/XIwwNg9DJF/CiWxYMn+y9+ED32wjAxRcCnAeg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxB1mzrNtgdE4h086Z3Z2der59rmshP1knPbNtWyk2Vo7GiyJhr
	qFUG7y+7TCyVsHa7QavQbv5knZaNYXfvDwHKwy86yew891QUR4JZR6zNFEML5WrA7Lu6g8exAWK
	ivYjq2DNz+n2sdi9MQY0xWKO9kGs=
X-Google-Smtp-Source: AGHT+IF8x7mQu05/n00ioB1fCbHsbHf9lLv1RtV+aR/x+v/G2NUu1I+Q23O4Yuz2Sn/QQCwtghvpwG2y7qmKqD9BKkM=
X-Received: by 2002:a2e:851:0:b0:2fb:59ec:4a32 with SMTP id
 38308e7fff4ca-2fc9d342c53mr40639061fa.25.1729849694306; Fri, 25 Oct 2024
 02:48:14 -0700 (PDT)
MIME-Version: 1.0
References: <20241025091614.2034294-1-fathi.boudra@linaro.org>
 <CANNYZj_pSeCcgMhT_d9R6tNvmgeT4HgHnEc4jcnPCn-BD2Osjw@mail.gmail.com>
 <CAGNsrLADeWVjHWOodpJPyRV3iFXdf-poP6SggHLz1gi7MtW+1g@mail.gmail.com> <1801A8A715944A16.12445@lists.openembedded.org>
In-Reply-To: <1801A8A715944A16.12445@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 25 Oct 2024 11:48:02 +0200
Message-ID: <CANNYZj-Phdhfa0ohqGHb2hyvq5hOTprkfRNNYvKR5MhAf6s7Ew@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libksba: add bison (yacc) dependency
To: alex.kanavin@gmail.com
Cc: Fathi Boudra <fathi.boudra@linaro.org>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 09:48:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206348

Basically your build regenerates asn1-parse.c from asn1-parse.y, and
it shouldn't. You should look into why that happens, using poky master
as a reference.

Alex

On Fri, 25 Oct 2024 at 11:39, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> Can you check this with plain poky master? It should build there even without this change.
>
> Alex
>
> On Fri 25. Oct 2024 at 11.36, Fathi Boudra <fathi.boudra@linaro.org> wrote:
>>
>> On Fri, 25 Oct 2024 at 11:20, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>> >
>> > Why is this not a build error?
>>
>> I haven't investigated yet why it isn't  triggered on the YP autobuilder.
>> It's triggered on my Scarthgap based build, and by looking at libksba
>> configure, it needs yacc.
>>
>> Adding the build dependency locally fixed the build issue.
>>
>> We can see in do_configure log we run autoreconf and get:
>>
>> [...]
>> checking for bison... no
>> checking for byacc... no
>> checking if bison is the parser generator... no
>> [...]
>> ***
>> *** Note: The installed yacc version is not GNU Bison.  You need
>> *** to install Bison if you want to change any grammar (.y) file.
>> ***
>> [...]
>>
>> > Alex
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206347): https://lists.openembedded.org/g/openembedded-core/message/206347
> Mute This Topic: https://lists.openembedded.org/mt/109204960/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

