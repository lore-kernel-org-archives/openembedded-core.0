Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C991C4332F
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 13:05:30 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web08.2914.1667999123617213979
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Nov 2022 05:05:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ND8/KoSz;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id a15so25652955ljb.7
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 05:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OsMFT5SskoCbvO6h7KkxF7IPuENs0khpyNzJs+dh4tM=;
        b=ND8/KoSzoHpVm2G1ME5K0aN0i7zPSF023HUItp0e9a8AMPRphgEsEsn6nZyKH8lYCO
         2VWCCWX5dqb1Q2VkMhllciBL7ZSwmVv1o32Wbqz2pKl4SQ1YYHD6cCndvlR+Em/qGBws
         +82I9+jQg3vuOue1o1ffdfuaJ9HxrDKTgnrV305W12GUnY6XC7aQ0XVzqog72hs2+wSY
         AxjL0yYZH0h2N1adK8Bss+R+nNwiU4aq1WQCl1PPuhJjoTR6TmHMoe6VLAdUDIEoh6LJ
         vhWxFmUMXp25//TF2eXIl7pJyDz6YuP3BphwwjyyCWaExJ9dpE7vqo55g+gaGO9RPkfr
         F7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OsMFT5SskoCbvO6h7KkxF7IPuENs0khpyNzJs+dh4tM=;
        b=ebshCzsN9tvKw55HTymy2IDMa1HrGQtlZCnJQumZZ8hhKSihL9JAJ0W8K3rKF5S3sG
         QRhFsSl5TLDL5hS8fzXw9NXFADsshzllhScZgcyf3/RhE1mAzNUN+eAJCEuu7qpYiebd
         rABaF/Th2RgKaCT9upwxOkfYKeAskfMR9RWp+Y+2Y7XKs+KUUPPHvVXULj1oWmnxtpdl
         MRTqDU/XTHaq14nhCz/PnoX5GhXzmaq41+WlnKzeZyipyVgHHiFHbf7MFPnKtMsPsnRe
         eGf1pmsKeZKHuNoyxp9t1eDO0hte4yNWebdeOTFno6DtMHjwlfly3AujryhQmZrItEqz
         nPKg==
X-Gm-Message-State: ACrzQf3Tbf9oUWs1Vds/BGQkxVNzbm8spuuVz/bUp94VCwdyGLFQVlaZ
	h/gc0aQIlOGeRFW6dJi+KJ57BPprxoyBfnSHc54=
X-Google-Smtp-Source: AMsMyM7VzWw3voGftLyufaYpxBPU5RA6jIorhjYRjVQNe4n4K4ySHIOphzOxOyMuF18AfSC6Zbyt25a18WEkEmXxFaY=
X-Received: by 2002:a2e:885a:0:b0:277:eba:852 with SMTP id z26-20020a2e885a000000b002770eba0852mr8273482ljj.31.1667999121804;
 Wed, 09 Nov 2022 05:05:21 -0800 (PST)
MIME-Version: 1.0
References: <20221107145508.1051404-1-alex@linutronix.de> <20221107145508.1051404-46-alex@linutronix.de>
 <53c48a9347a894fd991b4faf3bfb415ae3529830.camel@linuxfoundation.org>
In-Reply-To: <53c48a9347a894fd991b4faf3bfb415ae3529830.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 9 Nov 2022 14:05:10 +0100
Message-ID: <CANNYZj-7hT5OAZdZJhBh8iWq4fNshsEzce+J7ZrtLu6gu8YYqA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 46/48] python3: use the standard shell version
 of python3-config
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 13:05:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173017

On Tue, 8 Nov 2022 at 23:59, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> This made me wonder if we shouldn't have a better way of handling this.
> I was wondering if we should have a sysroot_stage_file function (like
> sysroot_stage_dir) and then we could do something like:
>
> sysroot_stage_all:append() {
>         sysroot_stage_file ${D}/${bindir}/python3-config ${SYSROOT_DESTDIR}/${bindir}/python3-config
> }
>
> Note that the sysroot code plays with hardlinks for efficiency, I
> appreciate one file doesn't really matter though.
>
> I was hoping we could have just added to SYSROOT_DIRS but that does
> only handle dirs, not files.

Wouldn't sysroot_stage_file be just syntactic sugar though? I'm fine
with just running 'install' directly in sysroot_stage_all:append(),
especially as it's more self-explanatory that way.

Alex

