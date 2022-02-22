Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FC5BC433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 14:23:57 +0000 (UTC)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com
 [209.85.221.181])
 by mx.groups.io with SMTP id smtpd.web09.13339.1645539836463166188
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 06:23:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AY6l+s/d;
 spf=pass (domain: gmail.com, ip: 209.85.221.181,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f181.google.com with SMTP id j17so10131167vkd.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 06:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dcKVMpVv01GboR8xHhybI+H1tQ9bTI/4ytugQo1QyLc=;
        b=AY6l+s/d5LcqnxkP55AMdLBqXH9G7bPv5F+fRuu52yVVEwWKY0SA/PaSTEMzV5Ur2e
         t7HxZ4j17Cjd7fZYeWp2QfTkJMY/aEO4hy+rzHiZp7UQHueVd8NczWK/UZENHeRDoZ+2
         Da0EKaNTV5LQha9ox3eV+LE5IxlQfUFyw54TRDe9I+wHhpjC+1jh/oGBgFWApu7SbUiT
         FC+x+Va8VK3CSQVkZWfaVMaVQ59PVFS8e4eRq99lIZnE/Z9erIcPbZbeX9h9pSZ4m1yh
         qPQDog+1yDJPuX4r2nFyVqof57Tfdwb8xaF91pICaAQi+4SkMHyq0gqOQgedDSfNuDs7
         JYMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dcKVMpVv01GboR8xHhybI+H1tQ9bTI/4ytugQo1QyLc=;
        b=jAEmvrAfyIS2IeVPglt9QV3d8D0t5e4eFJHfzhXU1vOmBhgNY2XLEXiGzSebMpUrJW
         yhfdw35pqG92dED8g+JqdgAaExtpiBQbJlg9W3FHYlW/7/O7g9rANH32dizSkyocnoRs
         7aeJLCBVO7Rk1E0lBmBTRgdaukMDIJ+gmIizpeFVW9wxKaWVVa1GOx3IjAkV/yvzo2Xf
         67/7rYKrZaKN6LQFNLaLbVwMPmRnqqVYjaOBloovEIsBYlTa1vaDgyQ9dRiEysxBMfho
         MAtlimTN8kJ7+ZRCawPtYioT5l7xkX6m9H0p2ltwJeAQFiGcOgtpI1yvtKnUT6xcXq3g
         +qsA==
X-Gm-Message-State: AOAM532xKXp1uoOs8b4AR+wsn5K47iB2BrXj6VHtoENmM1xgjLiE39MF
	eIGAtX00FLPNZkCs1Oy3VKLxInt7nskwBXCnvXQ=
X-Google-Smtp-Source: 
 ABdhPJzW63nuupui5ys2d7c+byogIqOk0jjBCTgmsywaozxnonNTEue2J+XiFXAeYkHMDI7cCZETcWZX+8MkbbVj3Y4=
X-Received: by 2002:a05:6122:511:b0:331:13b8:b2c5 with SMTP id
 x17-20020a056122051100b0033113b8b2c5mr10308071vko.4.1645539835545; Tue, 22
 Feb 2022 06:23:55 -0800 (PST)
MIME-Version: 1.0
References: <20220222035234.463162-1-andrew@aj.id.au>
 <20220222035234.463162-8-andrew@aj.id.au>
 <CANNYZj_3sRMqa-F_GvR2fCi2vNtafyNOvyHB_WhS99EhpoVK_w@mail.gmail.com>
 <48dc371d839b004db347823b5867f4c338e94443.camel@linuxfoundation.org>
In-Reply-To: 
 <48dc371d839b004db347823b5867f4c338e94443.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 22 Feb 2022 15:23:44 +0100
Message-ID: 
 <CANNYZj_G4Y0=sO7j7VaPeLc8gF6EFGwnuHTKcXhouTKmzODoog@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 7/8] rust: Add snapshot checksums for
 powerpc64le
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 14:23:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162134

On Tue, 22 Feb 2022 at 13:28, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2022-02-22 at 10:59 +0100, Alexander Kanavin wrote:
> > I have to note that YP does not support ppc systems as build hosts;
> > can this be kept in a bbappend?
>
> It isn't official but there are obviously people using it. I think we should try
> and do something in core but there is a question of how we maintain this given
> our infrastructure/tests don't cover it :(

Worse yet, there is no way to test this locally either.  If the ppc64
binary tarball checksums are added to the core rust recipe, presumably
I'd be expected to update them together with x86 and arm64 binary
checksums on version updates, but I'd have to do this completely
blindly with no testing of any kind :( That's why I am asking to keep
them in an external bbappend.

Andrew, how hard is it to obtain a shell on ppc64 machines nowadays?
Is it something specific to your employer?

Alex

