Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DCD6CD128A
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 18:19:01 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.8885.1712773131974453722
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Apr 2024 11:18:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GOc7CRkW;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d858501412so89682091fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 11:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712773130; x=1713377930; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4IpWAhW9PJro2TYEffMHwg0m4NpVfMa77PQs3vh158M=;
        b=GOc7CRkW05h6Fanao46PJqMtbr+sQUutL6bBGU3WONpp7QRnY6Pr1n7wVme6H5okRF
         H0Kivpa+zzVmj0RQOje++TbLpBR/3AOwbzpRF7qId1ubZkhMALcjkgpzQiuHdouVJh/3
         +OE8sbnh3aJRRGkjntXjb3L2w6oNEis6PISos2NShc98yD+X5dC2JkQmqt0J9xhLbQG7
         jv4i+z1tb6tDCFk9hTXIagmIlfSPwvHrdfJ4xs/Jgj7DPQqpOV11YDBdz99ROJAq7jJG
         NHATkNPYrx3lYKYOpy6bRI6crJpdNtDtiygqGsMW949GMHWdqmRrHTlAD/45Ol+KT50z
         Qk4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712773130; x=1713377930;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4IpWAhW9PJro2TYEffMHwg0m4NpVfMa77PQs3vh158M=;
        b=S4okRRhgqB4RRxGczmS2/lGODSJdffo0sJlxKrjEPA1KJjuYdt2dKGFSetDqKYFphI
         U3LaV1vaOab6W7JEkfA0kiBqkXZXW5RECOO+pAirRpgqLY6KXdSHKNQNfjy8+rMNxq+Q
         NvOMPRarN5i5uPRAC3jv6rSzxhXksqc749CsjDhVTCEaWJbB4Oaw8rh5xwyxKknTOKJh
         SbmG2HRElr6QPc4dbRh9Mq4D5/aIgBfeAPP4QBteWjRxKUSZc+hpHH3dlIixovGiJ2sc
         bw6utD+rGP+FZdBs4woy78scKov1qtkZAeTyrI+YzYAR61ME1TjAN8Dt1wPz8IloSJom
         80zg==
X-Forwarded-Encrypted: i=1; AJvYcCUu4ogGxeOO9zLuVC6dhUhW1JrT/xZW2Cu2AdJWF35wODPQ1Zg4F4padt9T2EpxoGRJdfNMCvg/+CCxDlHxnbWm0pxogZtKOMiaEPYAWZRsRVEVPAGcze+Z
X-Gm-Message-State: AOJu0Yx1xmvy02iQ9uscojv+3CFJdnJoo37cIk+19UoHdtn6kuC4qPPI
	AXedUUciJoTeKscjv5J1Lpsc65/RzYXrbp7xT7bwyi6pOvImDGlN6FyR25krzw3nPQ5AcmJKJCG
	+xaGBAibg3tnEgq/N0QEIKzR1zWI=
X-Google-Smtp-Source: AGHT+IHuD10d4zEgP15olDRTK1Vr6uUyparhpNZqpKKN+4D7JRSFdrPK+NGTNWWz5QKlWJlaRuXeMhLpKlImDeJDKPw=
X-Received: by 2002:a2e:730a:0:b0:2d8:658e:7e9f with SMTP id
 o10-20020a2e730a000000b002d8658e7e9fmr2404079ljc.39.1712773129772; Wed, 10
 Apr 2024 11:18:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240110211016.1470053-1-joe.slater@windriver.com>
 <629B6710-F394-41B8-AEB0-6C8A6A594EAE@arm.com> <7e0175bab97db273ce3abb44f19e985a89f33773.camel@linuxfoundation.org>
In-Reply-To: <7e0175bab97db273ce3abb44f19e985a89f33773.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 10 Apr 2024 20:18:38 +0200
Message-ID: <CANNYZj9HrNJ5YG8ogxsCMfce6=Oj3wWWMdhTQU5PzkCjvoOyfw@mail.gmail.com>
Subject: Re: [oe-core][PATCH 1/1] init-ifupdown: add predictable interface names
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@arm.com>, 
	"joe.slater@windriver.com" <joe.slater@windriver.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"randy.macleod@windriver.com" <randy.macleod@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 18:19:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198106

On Wed, 10 Apr 2024 at 19:29, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> I'd like to see a patch proposal on what we should do. Time is short as
> testing changes takes time and we're now a bit behind already :/.
>
> So specific proposals welcome.

If no one comes out with a better proposal, I'd suggest reverting the
top five commts, all of them:
https://git.yoctoproject.org/poky/log/?qt=author&q=slater

Alex

