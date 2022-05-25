Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4C85C433F5
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 21:31:08 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web12.12440.1653514259798852977
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 14:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Mcmc8cmA;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.45,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f45.google.com with SMTP id q15so5457748edb.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 14:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DzteOyJaHD2m8i/8FBLOmyBAE74A48l7vyPfykETFoE=;
        b=Mcmc8cmAK9D8nOo2oKVWUJDvzgb9jpCdl7HtyZFHwJMtU7OmMib8F1q77TlzLgg28t
         U7KFS9iyzl8zD+DOPCNDk/rAtwlqSNX+Df2cVkyNRExJLnDihLDAyyW7QCm0OL5KPZ0n
         6nXVChDZNDpJBxB4o+XvxkIDvbz3fvqJOB2yQ/7W63Lr4R/GJV5f4Za3HgAukCyAe8l3
         2WkBPMmRQ3vIfObdosVm8DU9m1LoJlU2BFkK/o9sDsif48CLOfdDMkCt0Skk6Jribi81
         gq+NjshHZmFl8DZSJBfc72T6J9WY8N9NtEQSnyFUHjmkcUrcXCVcZ5v1k+8LjAgf8zB2
         oavw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DzteOyJaHD2m8i/8FBLOmyBAE74A48l7vyPfykETFoE=;
        b=Z2z6r5SUr3pEWpzxOXfVQax8i93DMlHs0KKUjnrYOE1axB3uqZjjKd5iBCGMe+HLD9
         sSKve/zNscDWqXXDPWS/HMsnrtxvDBilSxCQZDe9OGwhBUXNiUMe0IT2TzuP18IwfID7
         +ekNig1U2bsG4MjBe3oHiAUPAs3wYZXsof9fF2oSiq/b5mFkKWSNfsQy6kYdPEfsIn/W
         l+dyAhWCxJ1jzIvVHkE06D9cGWJCprr5SjzFsZhgvhZxQvtupRAuGRxEChhbyHCgLJCV
         uscAHwMMJzdItl9/YEKkXTtnqIKxwg+JWsnVews7mrhKxVBbOwVSeGB3K7BLh8y8c05q
         2N7A==
X-Gm-Message-State: AOAM531jfKCOD6TIjo9g55Ac1t/mLpLSu6V1/lcelYwfzSNTtSLsB4y1
	GRd78flXL6b8PW5P2zIRzL0QCuQr7vVKJciWpiAlEw==
X-Google-Smtp-Source: 
 ABdhPJysAnLEaCYA8IE2IXQo1y//+BuXHoltEEIjKBc/B1AXe3/esv2Gh28BmR6qzDT9zzQ85ImxMK32E5U2I9Svhgg=
X-Received: by 2002:aa7:da42:0:b0:42b:cb0b:b0c1 with SMTP id
 w2-20020aa7da42000000b0042bcb0bb0c1mr4732667eds.316.1653514258265; Wed, 25
 May 2022 14:30:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220525184852.3999906-1-Martin.Jansa@gmail.com>
 <20220525184852.3999906-2-Martin.Jansa@gmail.com>
 <CAMKF1soDveFJZnqf2jBXT4YJGED=KuB_HrFFgVGDdWGGxrFgVw@mail.gmail.com>
 <CA+chaQepaRi-yHG=WSo7kpNHReg9Max64_33iikv4=TAbJNWrg@mail.gmail.com>
In-Reply-To: 
 <CA+chaQepaRi-yHG=WSo7kpNHReg9Max64_33iikv4=TAbJNWrg@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 25 May 2022 11:30:46 -1000
Message-ID: 
 <CAOSpxda9DChdqJDTqvcuF=xzBox2Db9ZpS4wzdCpaY1+BjBSOA@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH 2/2] gcc: backport fix for PR96204
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 21:31:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166174

On Wed, May 25, 2022 at 11:10 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> On Wed, May 25, 2022 at 9:43 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Can you also ask gcc bugzilla for gcc-11 backport ? so we get it into 11.4
>
>
> Done, in bigger build I came across similar build failure in chromium now, will double check if it's actually caused by this change and if the 2nd commit linked to the same gcc PR fixes it.
>
> Steve: please ignore this one for now.

OK, will do.

Steve

