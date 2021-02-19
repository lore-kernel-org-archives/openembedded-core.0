Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web12.6892.1613732143136758071
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Feb 2021 02:55:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ais5/4id;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id r21so7649984wrr.9
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Feb 2021 02:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=hDGLW5Mie1T6kBWys9VTBgZfwu0o/ttHCgkPt264Hp0=;
        b=ais5/4idoCE2Rmrt1zngVGGTblYjEOsQR+qQs7lIO2e9pB/U06pGf3B5pagVZG4/1f
         x64k0SZsRFI1Ap0eusYQOIm7YrIXGh3N0Ng1mRhJvRGknAmVtgA719HpXVpH+yBdDSqj
         OSZsHRIW/MvQHsj5kwoGQ42MMqsA38G2drysY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=hDGLW5Mie1T6kBWys9VTBgZfwu0o/ttHCgkPt264Hp0=;
        b=M9l53J7HBQdraZVozq4ZVI1e2xo/sbPMrhw8MoSYwI/zLti0JLWvx9EjgpDrzcit2p
         kabD+ieLPZvrxWqSiXF3pap/4FYSGKZbpn6k5e8OY83Rn24B1kO9A3elI188wjczqAvX
         h+Lfw0KdidMYrJaFarmIryK3x/kiC7IJGhvo31PsxlYHvx7KWY5eRDDdubobm0gEC/M3
         L7yW2MALr+L4BdBlMtgk00uhBv3z+XGU5w+dhq2Z9/oaKJ18w3YG7YpQV1r+LcR8zGrA
         rG9KYl/fkVcZnYVaoua5Qn1BxEuR7iLP9k0hGrCZ4nDEGRQTrOTiPzdll+Gi9tkPjTAt
         r+Uw==
X-Gm-Message-State: AOAM530JqvbbU8KoXP+/xYG0KUHkN64R/aNAZ8wBicwZnIPd6kVeaiDv
	2ZzrFqbrLbWtYl4TGMOvLNG1LQ==
X-Google-Smtp-Source: ABdhPJwTSkFvbZn2syxGFVm5lDmGdmvLWKkWF2EhdCFefJc7IdnCbrSZq5a5E0mvfsEehDfrRI7UEA==
X-Received: by 2002:a05:6000:10c5:: with SMTP id b5mr8635925wrx.284.1613732141679;
        Fri, 19 Feb 2021 02:55:41 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:569e:86b4:55e2:a2e9? ([2001:8b0:aba:5f3c:569e:86b4:55e2:a2e9])
        by smtp.gmail.com with ESMTPSA id d23sm11811682wmd.11.2021.02.19.02.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Feb 2021 02:55:41 -0800 (PST)
Message-ID: <6e28620fe97ac6c3363ef47c12d7333b2c4b1511.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH 0/1] wic: warn on usage of Y2038 affected file systems
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "florian.bezdeka@siemens.com" <florian.bezdeka@siemens.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Feb 2021 10:55:40 +0000
In-Reply-To: <20210218130559.43404-1-florian.bezdeka@siemens.com>
References: <20210218130559.43404-1-florian.bezdeka@siemens.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-02-18 at 13:06 +0000, florian.bezdeka@siemens.com wrote:
> From: Florian Bezdeka <florian.bezdeka@siemens.com>
> 
> The following patch is the summary of a nice journey through the file 
> system jungle regarding Y2038 problem. It all began with a warning which 
> is reported by kernels >= 5.4:
> 
> ext4 filesystem being mounted at (mountpoint) supports timestamps until
> 2038 (0x7fffffff)
> 
> When reading this warning I was surprised. Shouldn't a modern file
> system like ext4 be Y2038-safe? As it turned out it depends on the
> inode size if an ext4 file system is safe or not. So why was the
> inode size not sufficient in my case?
> 
> The inode size is chosen during file system generation and depends on
> the size of the file system that is going to be created. For details
> let's have a look at `man mke2fs`:
> 
> -T usage-type[,...]
>     Specify how the filesystem is going to be used, so that mke2fs can
>     choose optimal filesystem parameters for that use. The usage types
>     that are supported are defined in the configuration file
>     /etc/mke2fs.conf. The user may specify one or more usage types
>     using a comma separated list.
> 
>     If this option is is not specified, mke2fs will pick a single
>     default usage type based on the size of the filesystem to be
>     created. If the filesystem size is less than 3 megabytes, mke2fs
>     will use the filesystem type floppy. If the filesystem size is
>     greater than or equal to 3 but less than 512 megabytes, mke2fs(8)
>     will use the filesystem type small.
> 
> The relevant parts from /etc/mke2fs.conf:
> [fs_types]
> ...
>         small = {
>                 blocksize = 1024
>                 inode_size = 128
>                 inode_ratio = 4096
>         }
> ...
> 
> So whenever you create an ext4 file system with less than 512MB in
> size you will end up with 128 byte inodes and your file system is
> not Y2038-safe.
> 
> Some words to the other filesystems supported by wic:
>  - ext2 and ext3 will overflow in 2038, 
>    The user will be warned as well
>  - squashfs will overflow in 2106
>  - btrfs uses u64 for time representations, so Y2038 safe


Thanks, this is probably something we need to do. I did apply it in the 
test builds and they do show a few warnings:

https://autobuilder.yoctoproject.org/typhoon/#/builders/58/builds/3052

Before we could merge it, we really need to fix this. Are there parameters
we should add to our default ext4 to make it Y2038 safe and avoid the 
warnings?

Cheers,

Richard


