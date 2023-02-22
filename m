Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BD3AC636D6
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 19:46:08 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web10.3076.1677095166087235033
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Feb 2023 11:46:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lf4qORgp;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-1724d65d002so4508504fac.4
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Feb 2023 11:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s8+cW18lkKtb8PGHjHgUpfwPX91RiVJmjD7wdNR0Rt4=;
        b=lf4qORgpzBUnjQmd8hvDiA1az6qi4BHZ2DFulDSC/pn0hs1/YQ1UqvuXi4/de0u8jP
         PBHzSlvSqx14DXmkWbMXsWdeH71mhPv2RxGT8FX6UOm/L5MWlA8j3GhcnwFpwLOSqgN7
         yYf25BZdLWx9WQyvxOFterq7BKeVnG0I0o1HLybCv8ot2yfxmMbuoaiv/tCA5QRUxF0j
         /lBwtt/BDlDTgu2sodGTFnpBjjF6ltQAJ54QMLORPsAW4h+8nTAYWf6XfwO73tZLnKVY
         6jMPrXaq+gFkkRJgvPVpFJ4k8ssshvYczrZjURw9LG43R0jNymPI0iJcVFMKSelQEt2v
         Dmaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s8+cW18lkKtb8PGHjHgUpfwPX91RiVJmjD7wdNR0Rt4=;
        b=qqgK6bZemaOZ0hxZnTmghBuIb4ynNnd8u/qQm4q7FYWfscpc6MoV8KlGnhTqGIwN7S
         s+uBVMluMo6SM9mtkZt86BdJOaRT9eMbRHN2Nc23l3uUMyPaSxTYdqi1tFGr0QS/lTk0
         ybd/knpcrB6clx+aIiojFwtZ71iuULNYCGZ8XnZOnP2cHESMcURiAYjjqW3E2waBv8oC
         rtjzwOgSJaQ0sNVrOxrZXeWFYRIzWAmfNcb+eHGigXV5bZW1oGuU9cevf4g/Q7I/R5ms
         551m6OOLA0J4sJjvkcPNketCotgMYGyjAqQLMc4pNfV8Snd1Ec3+r+FfqYFIKBl/FHOT
         sE0Q==
X-Gm-Message-State: AO0yUKVo508XP8gohGxlj446/D1sstWId5WBk/dxKATI2TzZHz/SpMe9
	sMUkEEYtkSJ0fFiiGMu3r5MU+rUmhXmnlBvNdaY=
X-Google-Smtp-Source: AK7set+ZcV7+7Kn6RIKAiG1T+Ou0Y5ipFnqPpgzGmCFr2EFWqllX54o7LeQtStrQAYwpCaV4pea5JlwRYjynKxazxiM=
X-Received: by 2002:a05:6870:d188:b0:163:b85e:f1ca with SMTP id
 a8-20020a056870d18800b00163b85ef1camr1334914oac.262.1677095165251; Wed, 22
 Feb 2023 11:46:05 -0800 (PST)
MIME-Version: 1.0
References: <CANNYZj8T1Ex=5ti2ENWjcjcHSCMBubqu18rnenLQWcJdr_QQ=Q@mail.gmail.com>
 <24955.1677038318936477992@lists.openembedded.org> <CANNYZj8g2ybosu2VQ+G+LfpdF6J-2fFCQV1wr89BR1jsjjfk=g@mail.gmail.com>
In-Reply-To: <CANNYZj8g2ybosu2VQ+G+LfpdF6J-2fFCQV1wr89BR1jsjjfk=g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Feb 2023 11:45:39 -0800
Message-ID: <CAMKF1sp8fQHaZw=eyXD6C4qnQhLjNjZ6_upxfauEZ8jBT9egbw@mail.gmail.com>
Subject: Re: [OE-core] Yocto reproducibilty issue :: rust-llvm binary differences
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Feb 2023 19:46:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177582

On Wed, Feb 22, 2023 at 3:10 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> I took a look at libRemarks.so and libLTO.so. If you run 'objdump -s'
> on them, you'll see that they differ only in 'gnu.build-id' property,
> and are otherwise identical. So you need to look into why the id is
> different, I don't remember right now how it is created. Probably the
> compile log can give a clue.
>
> You can also confirm that it is indeed these two files that cause
> divergence in target rust by for example copying them from the A build
> into the B build just prior to building rust.

gnu.build-id in output means its using --build-id option during link so it will
be good to find out how this option is being constructed during link, usually
its SHA1 hash on parts of the output contents, so if these contents are
same then it should always come out to be same but it could be something
is changing in two cases perhaps some paths etc.

>
> Alex
>
> On Wed, 22 Feb 2023 at 04:58, Sundeep KOKKONDA
> <sundeep.kokkonda@windriver.com> wrote:
> >
> > Hello Alex,
> >
> > files are here... https://we.tl/t-ijJJZnBvKh
> >
> >
> >
> > Thanks,
> > Sundeep K.
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177565): https://lists.openembedded.org/g/openembedded-core/message/177565
> Mute This Topic: https://lists.openembedded.org/mt/97113152/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

