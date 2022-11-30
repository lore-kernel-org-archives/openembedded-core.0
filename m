Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87769C4321E
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 21:15:06 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.24866.1669842902757728419
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Nov 2022 13:15:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=k7aFA9SI;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id a19so6593106ljk.0;
        Wed, 30 Nov 2022 13:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V7WkNn5wFDZhGEO1yt3HJuru9xmw3SfTQmVir3OzfIA=;
        b=k7aFA9SIOn/y6n0/ZDZsZxA8Nt+BFLmXdzt0K8OUTJC0nf/ddEDIlYKn9W+jGEfU34
         Rz/oWCUMMVto9tux03Hjx4z/79bgT+JPmRypLmSJ7jB4sY9CNlHHaYjrjt0PYmwKHVOg
         gY1iHh2w/GdU3GQBiK5u+cxKxn1k9xny2FTkvU14ELMbPqh/kWsXBoHArBkcf9ZcFoJW
         ee7saN3p3loAK4ZB8x7E8fAwlGq910oX/SokItGnyQA6Gerkz54RHYv6eQK70sq0fBxx
         UmFjYFOwLes/WOwGY+Je3REoGyN7qII6HBieEkKcOM0giwv0kRPGxcQvYFaS1f8XNyZo
         HBeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V7WkNn5wFDZhGEO1yt3HJuru9xmw3SfTQmVir3OzfIA=;
        b=qXUvFVMSZ82kkuSRc2X397nAr09SZILZu/8DJg7j4L43QrAke3+EjV+PGas7ZJBPxF
         bXHrt1+shwLPENMeXEbBiJHNjybyza5xfABf5/8t9yVBURc3gi8bDAYsAMNOZxL1K0/n
         8KoQl0CBP0Cwq4nqBuWoiu+x+W8ld4WxMwzQ0xvYtyAriX+OfFRtEICzeWeIcLEQGPlD
         DUjPEOwa1SCa1siMlHoF1mIh3MBxlKPlfQEg6Kxxrdzhbq8xcu97dIVeex7G4mx0SepC
         WiENTfwdZKxzEeL8peXa1FDtjFYR30ddhx/imP8GNhqyBtBmTqyjOBVEeB4rOLN9UQfT
         3J1g==
X-Gm-Message-State: ANoB5pm38+INElgQOiGCOwvgdhfpKPXT5AScHM9EjGUmyMOcXy1sMXst
	tx5wk6glilGKnUredw8jW4vyq124YI0DgKnWQ5k=
X-Google-Smtp-Source: AA0mqf7xIzVfQZi3ZRU7l4sqCu/ptfHq80lE6iwMllhq/PZkmEyp66vX2ovEnyoQqKaNA0De4Imr+FLAGA+5GLxZTtg=
X-Received: by 2002:a2e:a174:0:b0:279:75a0:c063 with SMTP id
 u20-20020a2ea174000000b0027975a0c063mr13651139ljl.45.1669842900755; Wed, 30
 Nov 2022 13:15:00 -0800 (PST)
MIME-Version: 1.0
References: <0b6801d90409$885d6860$99183920$@gmail.com> <CANNYZj8Y37+s6Jzo1XvX0uCYNFc=NqOH8PWrFSL9_=TOS2ja7Q@mail.gmail.com>
 <20221130092832.62067104@wsk>
In-Reply-To: <20221130092832.62067104@wsk>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 30 Nov 2022 22:14:48 +0100
Message-ID: <CANNYZj_uy0xpvB2-eSzsZYwPR6gew=RpTZJXiGAVGYhqRn8xkQ@mail.gmail.com>
Subject: Re: [yocto] Y2038 proposal
To: Lukasz Majewski <lukma@denx.de>
Cc: openembedded-architecture <openembedded-architecture@lists.openembedded.org>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Stephen Jolley <sjolley.yp.pm@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 21:15:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174032

On Wed, 30 Nov 2022 at 09:28, Lukasz Majewski <lukma@denx.de> wrote:
> 2. There are ptest available [2] to validate if the Y2038 problem works
> correctly.
>
> 3. Support for running ptests mentioned in point 2. is already
> available in the poky repository [3].

I just ran these tests in (32 bit) qemux86 on top of poky master (e.g.
no magic glibc flags), and they all passed. Do they need to be ran
after setting the date to the 'post-2038 future' to reveal the issues
and produce failures?

Alex

