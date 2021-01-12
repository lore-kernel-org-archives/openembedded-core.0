Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.6740.1610443268424247279
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jan 2021 01:21:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XZCMZJ7K;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id a12so1657301wrv.8
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Jan 2021 01:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=SUfue66k9YPZ63GMn0tvFt90G8qNa/kRThf27Ys57RQ=;
        b=XZCMZJ7KiZpzdBPiuWX+XjYiMifDIjif8IMgCWZ6HrlF5TwvdyiR4Ozu+sZMD1jwxJ
         H+HcF3v9XzwluNxwGyxmuRtH2HA55rWoJGvU/O8ERMxlIo0zmNa5H01q9VPanN9l6JPC
         3rgmGJXfSZt8N3uWJQn/3OioquvhKffUEFzt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=SUfue66k9YPZ63GMn0tvFt90G8qNa/kRThf27Ys57RQ=;
        b=YfDV6S0PxFOu0dzvyrtmiJdw7i01lvwoRWmhyON31hFvmbMdo2aXMGIU1WtOgoV9rc
         EcIhT6UD5jFqb2Whu/2tcI8rVerYTCXW/WetEto+KmgEOk95D9IwY7Yo6tlllalrdPAS
         XC0Xjs9pVbhyc3A1inwx0lkdEjwxxQhEqS+OnC9BPf3SHSUzF2A8h1sJi0jJbCZhCPoS
         nTHhF2UIOL4dqGhv/U2ufD6LGAgLBjIqlm4TdVceOG6z25MGJa1pnooicgPslOWCB80i
         Ji8Xw0JihSIlKJvjoJtzqlZ33aAfgo6qiOReZO3jHigylrtpHnXT0EoSt9madHx8UZcq
         H7/g==
X-Gm-Message-State: AOAM532jcuZkeAJ8sVzF+VMXxxq/rrBUW+j32y8dVj4BhAvAd8r1ejF7
	uH4MBNWBVEO5dQRopnZgdXUbxA==
X-Google-Smtp-Source: ABdhPJwwdnd1BtM+4mPj7doCg5sf60AuGANFTmdvcVriCXLkjY1/WC0y5PhK6DO6Ky7v9FUj2nd0cQ==
X-Received: by 2002:adf:9b93:: with SMTP id d19mr3187527wrc.21.1610443266873;
        Tue, 12 Jan 2021 01:21:06 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:281a:af36:8e71:af21? ([2001:8b0:aba:5f3c:281a:af36:8e71:af21])
        by smtp.gmail.com with ESMTPSA id 94sm4093470wrq.22.2021.01.12.01.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 01:21:06 -0800 (PST)
Message-ID: <0badccec72779f05f2480c4320902c5b73b4d156.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] rootfs_ipk: allow do_populate_sdk in parallel to do_rootfs
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Michael Ho <Michael.Ho@bmw.de>,
 openembedded-core@lists.openembedded.org,  Paul Barker
 <pbarker@konsulko.com>
Date: Tue, 12 Jan 2021 09:21:04 +0000
In-Reply-To: <1610369123-220800-1-git-send-email-michael.ho@bmw.de>
References: <1610369123-220800-1-git-send-email-michael.ho@bmw.de>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-01-11 at 13:45 +0100, Michael Ho wrote:
> From: Michael Ho <Michael.Ho@bmw.de>
> 
> Switch do_populate_sdk for the ipk package manager to use a separate target
> opkg config file and separate the lockfiles restricting do_rootfs and
> do_populate_sdk from running in parallel.
> 
> This way if an image recipe includes a dependency to do_populate_sdk by
> default then it will run in parallel to do_rootfs saving time compared to the
> sequential execution.
> 
> Signed-off-by: Michael Ho <Michael.Ho@bmw.de>
> ---
>  meta/classes/package_ipk.bbclass       | 1 +
>  meta/classes/rootfs_ipk.bbclass        | 4 ++--
>  meta/lib/oe/package_manager/ipk/sdk.py | 6 ++++++
>  3 files changed, 9 insertions(+), 2 deletions(-)

I have to admit I'm very nervous about this change. The races we've
seen betweem rootfs and sdk can be quite unusual.

I did put this in for testing and we saw:

https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/2938

which in the pseudo.log shows:

path mismatch [2 links]: ino 372706913 db '/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/beaglebone_yocto-poky-linux-gnueabi/core-image-sato/1.0-r0/tmp-wic' req '/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/beaglebone_yocto-poky-linux-gnueabi/core-image-sato/1.0-r0/sdk/image/opt/poky/3.2+snapshot/sysroots/cortexa8hf-neon-poky-linux-gnueabi/usr/src/debug/puzzles'.
path mismatch [2 links]: ino 372706913 db '/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/beaglebone_yocto-poky-linux-gnueabi/core-image-sato/1.0-r0/tmp-wic' req '/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/beaglebone_yocto-poky-linux-gnueabi/core-image-sato/1.0-r0/sdk/image/opt/poky/3.2+snapshot/sysroots/cortexa8hf-neon-poky-linux-gnueabi/usr/src/debug/puzzles'.

its hard to know if this is due to this patch or possibly Paul's wic
changes as both were in this test series. I suspect it won't reproduce
every time since its a race.

Cheers,

Richard

