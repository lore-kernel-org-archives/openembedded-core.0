Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B233CEFC32
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 16:47:53 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.606.1728406066343683170
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Oct 2024 09:47:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mTeO/YCn;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fac3f1287bso64359091fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Oct 2024 09:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728406064; x=1729010864; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Edy7eD0ea9g+CfNZlMbz/e8Jde8O5HISgGMonptUltU=;
        b=mTeO/YCnU1SIyGz4rpVMwWcs2gOibdk2r+aQyntJTdt/UUSvnDrwCbFk6zYO02LAHI
         FD04vzVU9IgE7NCv1NNJasHmNq9W0RLWU5VyiJkRGvDJyiN3C6EKzkFP+5YoyDtSOAQl
         Y2FwW4WRqoyqN6nfQApAPIIMjD+dPBsDca5Az+kNdS6pnIG1nZTpjtjYQXBm6VT0Yzg2
         s8nk278/+FA1YCoF5k2XxIEyf3sNV+sGhtHS3FzK/K3JX0g6YGZIS4mFYN1X6VpAcrMo
         p2erKibC2bo/RWoacWjKLQRaQ7FUSTh+/INx8hStMUXo2iZHPQFKC1gmJ9op9Wakcbs3
         pJOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728406064; x=1729010864;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Edy7eD0ea9g+CfNZlMbz/e8Jde8O5HISgGMonptUltU=;
        b=uagZ6c2eOLYVBKzg2o7DJZM1qRVBYh6MD2g8n7XVS/Ub53+CxDjdSHD+ULmwpujDJC
         zZt0NEpLS1biWEY/cIncxCTBHNh8m+wHEfSmURe5dTeqF8gL6aM7oVr2M2CPf36mrVq7
         uEoxi2MQe1CMpnUaQysr6J/ULw6n9AjSOg02hWl1U9gj/4hNkbETWjmEaR6ueAnt3U+W
         K1PPjH9er/upBupytOYcTe6J9dZngvAFXnTF517HVhKkDD3/CWENsWuf5wlX53tuOCxr
         EKi7B+6CPEvQrf8z3WKSMC27CiiT0ygOi2KVU41zpMOSOfE+1VGTsftcEea4G2zXn763
         0BXA==
X-Gm-Message-State: AOJu0YyD/CdbU7l1bHv07OPv+VKH/uv9gtHc15Gy12WFFkWdoC+NQit+
	iQfChOoCb8qZKu10uPZ1Li60ZdRbNHji007vuzjcg7kbVxiAeDAqZfu8kwzPmSWXsIxKFwBKl0w
	CmUc12pZkK0Y4I6DjID0KUnEYrNxzQzGg
X-Google-Smtp-Source: AGHT+IEZabE1J4gLMDYxpROPQy4B1enELeSCBvZe7VNo046zV3cot4ORY/Uly3zbB0DG3Byz3B9E5r+V886DLhHoe08=
X-Received: by 2002:a2e:f1a:0:b0:2fa:d84a:bda1 with SMTP id
 38308e7fff4ca-2faf3c1439dmr68597351fa.10.1728406064047; Tue, 08 Oct 2024
 09:47:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240813031628.1123492-1-tim.orling@konsulko.com>
 <20240814225104ed116094@mail.local> <CAOyo-85dM7t_uByZ12qPh9haZmOHiKFTRnyfhMmp2u9oCzYoHA@mail.gmail.com>
 <a11cc259b50cbc7edb9daf959ae92e107f363144.camel@linuxfoundation.org>
 <17F87AF6EAFDA641.14701@lists.openembedded.org> <17F8C2E18D10AF69.31778@lists.openembedded.org>
In-Reply-To: <17F8C2E18D10AF69.31778@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 8 Oct 2024 18:47:32 +0200
Message-ID: <CANNYZj-rssV8xRfWvq7i7rZJHPfC7zDQRw-T_vMB8TekCJK8Lg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-cryptography{-vectors}: upgrade 42.0.8
 -> 43.0.0
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, tim.orling@konsulko.com, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Oct 2024 16:47:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205298

On Thu, 26 Sept 2024 at 11:58, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
> > > So the question is what is writing that file and is it doing it based
> > > on something like "ls" output which just lists the order on disk? If
> > > that is true you can thrown a sort in somewhere...
> >
> > Note that neither is sorted. I just built this with the in-progress
> > python 3.13 update, and with that the entries do seem to be sorted, so
> > it seems the problem will disappear with that update.
>
> Sadly this was a premature celebration. This was the case in my local
> build, but on the autobuilder (test python 3.13 build) it again fails
> in the same non-sorted way:
> https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20240925-w8kid2em/packages/diff-html/

I have a fix for this now:
https://git.yoctoproject.org/poky-contrib/tree/meta/recipes-devtools/python/python3-installer/0001-src-installer-utils.py-sort-entries-before-writing-o.patch?h=akanavin/package-version-updates

Python 3.13 upgrade is still in progress, I need to go over these fails:
https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7361

Alex

