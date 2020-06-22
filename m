Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web10.2271.1592847270636871636
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 10:34:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Xg3w2Dwn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id l17so375524wmj.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 10:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=1M52ge/Rwz6HLki3GO5ojyeKLY3SW09OU+mWKmIJ+p8=;
        b=Xg3w2Dwnz7nAva1g6diLZ9J2fVu6ncYM00mtNoVzjSKekGlCP8YOjn+GpoglTP+2Yr
         X7Sd2Xu4U5u4zSmQPBdakD8ZCHoGMqfYpPB2K6LZx3LK704xUiGwjD69A0DcXnVf2MI0
         h0jYlmRlNyttbjXQ6UjMZ0ntk4Kd1uUvVJaz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=1M52ge/Rwz6HLki3GO5ojyeKLY3SW09OU+mWKmIJ+p8=;
        b=XTHrtvdUAEf8P34aII9cHgQdJWqhFQU/34mn+xTZ/71mfjxtkAg89mMaue9yitekCg
         uL7gNEpBzErAqIHC1qCNgA/gjXr0OKvkJ1+DN8wqSf8yBZ9BjNG/TA6x6a70DYqBg8/y
         c/1ZQdTmYnpuWZaT2a1TDoOMClNr6QNLkaRHg8O8Xub0Jm7FvyomDIiCCuWgNpxlv7tZ
         3pk96CYb1VABp2jphvGpjdiM+o1MQ2q6qqSHb5UmNoV+us7LLZKpTCij5Od3TdVG5jip
         07nyguD195Qd7p38LVyG6IybYgwuaFu7qDaDDtR1ohxNi2nTOcXq/iN0rrnY3AJkGjUm
         LQsw==
X-Gm-Message-State: AOAM531rmKJxZAUP4BDjcxm4CtTDib2HfEu3UYGzm304HwhUJeTnWZIw
	YspxZjRUWR2GjpPo2y+6va0gJQ==
X-Google-Smtp-Source: ABdhPJzs10JeiY6b8fKcISYPfxPnPvTP9stbGJkxxQx9IFghG2T0g6augI/yfp2Fiunx7qXZYt2fYQ==
X-Received: by 2002:a05:600c:2202:: with SMTP id z2mr20555891wml.13.1592847269126;
        Mon, 22 Jun 2020 10:34:29 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id 2sm250425wmo.44.2020.06.22.10.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 10:34:28 -0700 (PDT)
Message-ID: <2fd43b04ea22019411e3e01669e879a838781e8f.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH v2] rootfs-postcommands: Enable rootfs_check_host_user_contaminated
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alex Kiernan <alex.kiernan@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 22 Jun 2020 18:34:27 +0100
In-Reply-To: <20200622105717.108062-1-alex.kiernan@gmail.com>
References: <20200622105717.108062-1-alex.kiernan@gmail.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-06-22 at 11:57 +0100, Alex Kiernan wrote:
> Generate output for each contaminated path so it's visible in the main
> log file, then enable rootfs_check_host_user_contaminated by default.
> 
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
> 
> Changes in v2:
> - expose each contaminated path in the main log
> 
>  meta/classes/rootfs-postcommands.bbclass | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)

Thanks, this is definitely more helpful. Some warnings in the test
build:

https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/2046

step1b: WARNING: core-image-sato-sdk-1.0-r0 do_rootfs: Path in the rootfs is owned by the same user or group as the user running bitbake: /var/lib/nfs/statd
step1b: WARNING: core-image-sato-sdk-1.0-r0 do_rootfs: Path in the rootfs is owned by the same user or group as the user running bitbake: /var/lib/nfs/statd/sm.bak
step1b: WARNING: core-image-sato-sdk-1.0-r0 do_rootfs: Path in the rootfs is owned by the same user or group as the user running bitbake: /var/lib/nfs/statd/state
step1b: WARNING: core-image-sato-sdk-1.0-r0 do_rootfs: Path in the rootfs is owned by the same user or group as the user running bitbake: /var/lib/nfs/statd/sm

https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/2073

step3b: WARNING: core-image-sato-1.0-r0 do_rootfs: Path in the rootfs is owned by the same user or group as the user running bitbake: /var/cache/fontconfig/CACHEDIR.TAG

which does raise more questions.

Its conceivable its even related to the pseudo issue I just sent a patch for...

Cheers,

Richard

