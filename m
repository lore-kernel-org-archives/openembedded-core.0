Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6830AC433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 22:14:34 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.298.1668032069517435450
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Nov 2022 14:14:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GRyZL6VY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id o4so27969812wrq.6
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 14:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OKWulViYdAj4bjnKG/EiFX9YjRmB735I48L0YTO+GCs=;
        b=GRyZL6VYFOSQ8+sL8zRPxVTFXsq5BddXdE5kULqlzU6oDacgko87dtX5rLJlozfqy6
         T2UZa3PiUlV0194dUF84eOynhT6h1v2OCGUKNByNmidY8HkhZS+01iS13B6t7BwsiskJ
         b8y3w38xTSmHXyaUROiPam0TvV8YObi5Xxwpo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OKWulViYdAj4bjnKG/EiFX9YjRmB735I48L0YTO+GCs=;
        b=wyV34hRyia5Ztr8pEvWuy4kmTQ8Ha+x4GJzqFIIslcJB/ct9QsHsnAu8YXZNrcSowP
         qkWon+ceP5H5w5ejw3gvp4VT4L2ezn23Kym761y5OLgxybCUu5OWb7cAfgnQJQ9eURyj
         1N5ZbzlFuuGjYoLW7bC/3rK8NyQRYqe72kEWIpu0wYQEurOojePdznwICwS6gbpgrmcA
         ea2CDKXdF+L8BXVikKQrHY+7bhru/mkfyKmEcRwAyXk7904fIXYlrQz0KNCn9wAXK6m1
         Dhmfm49hvb3h38TPLGxkbDmqXk4GDKR17IeCpgVQMFbrIwmk7GxqF/n1OXW7+vylaqnr
         2fsA==
X-Gm-Message-State: ACrzQf0oy6EGXfNf28FDmR4ZIzT5+qqpu7WikEBsGDPtDyizjoAvvHTQ
	nfgS0O6C5VVqhoFKbXqFsU7nSQ==
X-Google-Smtp-Source: AMsMyM4mqwilESeinEi1ezG/Du+bdN/7G8X/QOstFwJVBP5A/At+RnVb1gMoTA40+YkuKGYIdsADXA==
X-Received: by 2002:a5d:6a08:0:b0:236:e06b:ec19 with SMTP id m8-20020a5d6a08000000b00236e06bec19mr30621843wru.150.1668032067752;
        Wed, 09 Nov 2022 14:14:27 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:17d7:2b2a:fa9:1005? ([2001:8b0:aba:5f3c:17d7:2b2a:fa9:1005])
        by smtp.gmail.com with ESMTPSA id h8-20020a05600c314800b003b3365b38f9sm3263048wmo.10.2022.11.09.14.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 14:14:26 -0800 (PST)
Message-ID: <7a3e2fb0a5f0e71581fa4c2da529454bd2eb27ad.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC] [PATCH] Allow fitimage + initramfs rebuild to
 be accelerated
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.microsoft.com>, 
	openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 09 Nov 2022 22:14:24 +0000
In-Reply-To: <1667435031-7224-1-git-send-email-paul.eggleton@linux.microsoft.com>
References: 
	<1667435031-7224-1-git-send-email-paul.eggleton@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 22:14:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173061

On Wed, 2022-11-02 at 17:23 -0700, Paul Eggleton wrote:
> From: Paul Eggleton <paul.eggleton@microsoft.com>
>=20
> We have a usecase where our initramfs changes on every build (since it
> contains a version number which is based on the date), and we're
> incorporating that into a fitImage. Most of the time our builds are done
> from shared state and we want them to be as efficient as possible.
> Currently, when the initramfs signature is different this setup requires
> the kernel to be recompiled on every build, which is not ideal. I've
> come up with the following rough patch to address this, which does the
> following:
>=20
> * Avoid the dependency of do_bundle_initramfs on ${INITRAMFS_IMAGE} if
>   we are going to be building that for the fit image later anyway
> * Add a do_preserve_kernel_build task to preserve the files needed to
>   re-run do_assemble_fitimage_initramfs in a separate location from
>   ${B}, which can be saved to sstate
> * Add a do_deploy_fitimage task to deploy just the files written out by
>   do_assemble_fitimage_initramfs to ${DEPLOY_DIR_IMAGE}; this allows us
>   to preserve less in sstate than we would have to if we allowed
>   do_deploy to rerun. Of course the downside is we then need to add a
>   dependency from the image's do_build on the kernel's
>   do_deploy_fitimage, and I had to introduce a variable to control that
>   which is a bit awkward.
>=20
> This patch is quite rough and I'd like to take suggestions on how to
> improve it. One of my challenges is I don't have a complete grasp of all
> the usage modes supported by this code so I'd appreciate folks who do
> taking a look.

I don't have good answers unfortunately.

We have tried really hard to avoid putting all of the kernel build
output into sstate. The main reason for that was that recompiling the
kernel from source took around the same amount of time as compressing
it and moving it around in sstate, it was huge.

If we're going to start putting all the kernel bits into sstate, we
would probably rethink kernel-devsrc and a few other pieces too. I'm
not sure we should do that but they're all connected. Perhaps we do
give in and do that but I doubt people will like the build times or
sstate size increases :(.

I'd also observe that we don't have good tests for a lot of these
different use cases. The code has slowly been turning into an if/else
labyrinth and it is very unclear which usecases are being used by
people. We have seen a rise in test cases and I have pushed for them
where I can but the situation isn't great and is a big worry whenever
we make changes in here.

Adding in yet further if/else paths with magic variables to control
them isn't filling me with confidence.

The recent work Sean Anderson did on fitimage with u-boot looked like a
promising de-cluttering of some of the maze.

I added Bruce to Cc:.

Cheers,

Richard




