Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3938C433EF
	for <webhook@archiver.kernel.org>; Wed, 29 Sep 2021 16:07:50 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.11139.1632931669961869072
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Sep 2021 09:07:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nqsShK2B;
 spf=pass (domain: gmail.com, ip: 209.85.208.49,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id v10so10733279edj.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Sep 2021 09:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+lwJH6sTAA47RXk2XiC939FJzHP4d11SPl0U07rN+5Y=;
        b=nqsShK2BoAGqE12OlxLgenU0YFWIhWsSfyAY/cjIR+t/s/IA+ntbvwErMWGAHJxztN
         b0Upj5b7BC1IlgHFPEHsQz9IKQQVHXR0hxU+uQK+FybaOQxZa/o60vsCd4plIOJgR6H8
         OnoS+5T41EgYnpRpvAzoqLM7IiFqDQ8O4DwwKWQE58EFp1GOFjaXCkPdEeaLtd297xsE
         U59+UsAX/UUQtaNOnVIgeIt5rtYwP45J7lhMqhyk9jluZgNOQh/DYFUZzgjog+OvZlxJ
         POleThFEXhimeLoQCYauMFEKDvsMmFbTCtIutItHjdg3mOmjZ7gJWl1vFREYlYrXtkoB
         SLGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+lwJH6sTAA47RXk2XiC939FJzHP4d11SPl0U07rN+5Y=;
        b=Rw8qiOepdUoEy5mBQBaMURDdsOAMvLBwBkvbvDAMAQh5AXwnlEdFa6qbYa6lCgLO6E
         o1eR22XcxzQ2nZMYdLgcdGDOLtHVXQQs0spdgt1z6xp60GvHFjlXf9Y/vLGHt/ZxZcHo
         37GKne27zl9VTzu5wgjwjI2m7IpULxVe4B1t+4wjG9bxgGv0cVfTHC5ffKmvjhgMlu/t
         Uc6jFsgUPWly3gA/eTjJIs/Q2uKpUJIjfWtQNCL3o0UPweDWJCYH63YgbtAHwn4jXEA5
         tOs1lKn8owotankAOt7NmHNyL3CDP689yrYqCyoK93ITY7E137K7rUzm/JGa5koeyK1J
         lvsw==
X-Gm-Message-State: AOAM531gMHrXYq/phiwvKU2LY+/7o+NlCoq+yVcHW9XFKdfbkYl3ETyI
	XiKeX/ZsJWWh8xI7yqZVrclFzSvqAsteCGsM0VU=
X-Google-Smtp-Source: 
 ABdhPJyBir7lxnOjSEjns0lv8xn8znCukUK8Le8PG//3wrdmdHleoI3pSB8L9pAoKRt8uo/nkSxB27+/OmRwms1c+YE=
X-Received: by 2002:a17:906:d541:: with SMTP id
 cr1mr609316ejc.81.1632931631058;
 Wed, 29 Sep 2021 09:07:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210929053353.600644-1-zboszor@pr.hu>
In-Reply-To: <20210929053353.600644-1-zboszor@pr.hu>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 29 Sep 2021 12:06:59 -0400
Message-ID: 
 <CADkTA4MZJJtyGjSwL80g9RNxg7xjwdj8Q1k0Od+gsWG4ee9F=w@mail.gmail.com>
Subject: Re: RFC [v2]: Make kernel upgrades via dnf work like on Red Hat
To: =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@pr.hu>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	=?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
 Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Sep 2021 16:07:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156469

On Wed, Sep 29, 2021 at 1:34 AM Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zbo=
szor@pr.hu> wrote:
>
> I have observed two issues when upgrading to kernel versions
> successively.
>
> One is that when installonly_limit is reached in dnf, only the
> main kernel package was removed. Patch 1 fixes this by adding
> extra RDEPENDS to the kernel subpackages on the main kernel package.
> This circular dependency helps dnf to remove all subpackages.
>
> dnf.conf settings "installonlypkgs", "installonly_limit" and
> others are documented at https://dnf.readthedocs.io/en/latest/conf_ref.ht=
ml
>
> The second issue is that when the oldest kernel version is
> removed by dnf, the /boot/bzImage symlink is also gone.
>
> Fix this by using update-alternatives instead of hardcoded ln -s
> and rm -f. This is configurable via a new variable.

I'll comment on patch 2/2 directly, but I have a few things here as well.

>
> This is only an RFC at this point, because
> 1) The first fix is only applied in the KERNEL_SPLIT_MODULES=3D0 case,
>    it may need its own knob or applied unconditionally.

What is the outcome of the circular dependency you mention in patch
1/1 ? Does DNF warn, or something else ? What do the other package
managers do when the circular dependency is detected ?

But yes, I agree that we really don't want any more conditional code
in the kernel packaging, since it isn't going to get tested. So
whatever we do needs to work on all package managers and with or
without kernel module splitting.

>
> 2) There's an extra issue I found while implementing the second patch:
>    instead of using KERNEL_VERSION, I had to resort to using PV
>    because the former is dynamically set via a python function
>    and it changes its value at some point between build phases.
>    AFAIK, there are kernel recipes out there using only the major
>    version with two numbers in PV instead of the full version triplet.
>    I can live with this as my kernel recipe uses the version triplet.
>
> 3) The new knob name for patch #2 is KERNEL_IMAGEDEST_USE_UPDATE_ALTERNAT=
IVES.
>    It is admittedly too chatty, it can be renamed if someone suggests
>    a better name.

I'll ponder this as well, but nothing is immediately coming to mind.

Bruce

>
> Please advise how to fix and make it final so these fixes can be
> accepted into openembedded-core.
>
> Best regards,
> Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi
>
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

