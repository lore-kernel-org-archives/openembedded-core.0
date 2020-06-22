Received: from mail-il1-f195.google.com (mail-il1-f195.google.com [209.85.166.195])
 by mx.groups.io with SMTP id smtpd.web12.1633.1592852014422259421
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 11:53:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uZ1QvHlC;
 spf=pass (domain: gmail.com, ip: 209.85.166.195, mailfrom: alex.kiernan@gmail.com)
Received: by mail-il1-f195.google.com with SMTP id t85so7561737ili.5
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 11:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/byTIXJW7aPICZT+/DVfFas/YcdXYOVQTd4MCz1Ia9E=;
        b=uZ1QvHlCusQWUT/GQ50McQ7DxSUqEqBjGRxFaUX9HT0s2Iq7q1oJc7/tH7NIRUK6BW
         bXeFrhEcYORJRIaSdSq+/9bKGkLNmPN/3pAGBy0HKST+F/18mcC0SA9qLijf0AmgRtto
         yt1S6ATnHOZxZJnGG0057fXVK5uCvoKzUoxMce00KCyhoPtrrRH6VQkqatIim5AJYRbv
         rFxGK1zFA2rT6s8wuiWeDML2PWUJn6YVpWHIaW47XoQq84U3TjDjbIPNtnXLPpoUpaNe
         pb70UwiI0to4jGWL7wB+BNNkM0zqCahLkj7sjBLUgQNtAh0m0yy6UN2dLQBDEog7i4mx
         sfCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/byTIXJW7aPICZT+/DVfFas/YcdXYOVQTd4MCz1Ia9E=;
        b=sDEqeUPjW/mLFK2FnDuR91w+5NigF9xTQmW8IzhuKsU7PoaYKPcy7e6B28TUpuEfeN
         it8qx5U/EQVk4c+AtM16624ttRAvYXolLVSoyb7KVCmxf/xRxy0Js7qFQQ7BNVDZxZ7A
         2w6oelvwsB09g15Htiu4aVPm66UWw0jiV06X1o6Jo6FCGnVSLe9ylmB6/JGUqtjAKKZB
         ibVl8/Pfb/ZChTj7JHzeQ5gKWseA92WfDzXoDu/DwM6JUjtZGruDs+7WDgEk5/HdP3qJ
         0Wn7u3sWPabE+A+H+cJ4Kt0kg4QtWBrN0JEhyI5sPiYbVVHqMfKfmyN51AlQYYZilhQ+
         3f2Q==
X-Gm-Message-State: AOAM533++P17A0gGX8ylGBJxFu+MAixVa0de3SizdgxpneVOg4zXZVfq
	6/lIKFKO7LqBbx+mxq7B4hPOXfbCxiw6solgdls=
X-Google-Smtp-Source: ABdhPJxBHxWga1ad58pUiIIceg7G65VKcHHnULGMPxZ5IF/3ULb3/ft62Q6BOp/RhpJRvMTaNHY/RwdoxV1g4jFofTE=
X-Received: by 2002:a92:d84d:: with SMTP id h13mr7634097ilq.102.1592852013831;
 Mon, 22 Jun 2020 11:53:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200622105717.108062-1-alex.kiernan@gmail.com> <2fd43b04ea22019411e3e01669e879a838781e8f.camel@linuxfoundation.org>
In-Reply-To: <2fd43b04ea22019411e3e01669e879a838781e8f.camel@linuxfoundation.org>
From: "Alex Kiernan" <alex.kiernan@gmail.com>
Date: Mon, 22 Jun 2020 19:53:22 +0100
Message-ID: <CAO5Uq5R-oXNuqoVPpoC288smwDH459tjik6aB=B1+aOsT+dayA@mail.gmail.com>
Subject: Re: [OE-Core][PATCH v2] rootfs-postcommands: Enable rootfs_check_host_user_contaminated
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 22, 2020 at 6:34 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2020-06-22 at 11:57 +0100, Alex Kiernan wrote:
> > Generate output for each contaminated path so it's visible in the main
> > log file, then enable rootfs_check_host_user_contaminated by default.
> >
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > ---
> >
> > Changes in v2:
> > - expose each contaminated path in the main log
> >
> >  meta/classes/rootfs-postcommands.bbclass | 9 ++++-----
> >  1 file changed, 4 insertions(+), 5 deletions(-)
>
> Thanks, this is definitely more helpful. Some warnings in the test
> build:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/2046
>
> step1b: WARNING: core-image-sato-sdk-1.0-r0 do_rootfs: Path in the rootfs is owned by the same user or group as the user running bitbake: /var/lib/nfs/statd
> step1b: WARNING: core-image-sato-sdk-1.0-r0 do_rootfs: Path in the rootfs is owned by the same user or group as the user running bitbake: /var/lib/nfs/statd/sm.bak
> step1b: WARNING: core-image-sato-sdk-1.0-r0 do_rootfs: Path in the rootfs is owned by the same user or group as the user running bitbake: /var/lib/nfs/statd/state
> step1b: WARNING: core-image-sato-sdk-1.0-r0 do_rootfs: Path in the rootfs is owned by the same user or group as the user running bitbake: /var/lib/nfs/statd/sm
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/2073
>
> step3b: WARNING: core-image-sato-1.0-r0 do_rootfs: Path in the rootfs is owned by the same user or group as the user running bitbake: /var/cache/fontconfig/CACHEDIR.TAG
>
> which does raise more questions.
>

I'm having no luck reproducing either of these locally :|

> Its conceivable its even related to the pseudo issue I just sent a patch for...
>


-- 
Alex Kiernan
