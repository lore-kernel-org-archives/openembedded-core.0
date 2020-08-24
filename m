Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web12.1966.1598307975338933052
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2020 15:26:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UeXoOsuB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id b18so7836wrs.7
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2020 15:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=YqeZUAqv/jrHfkF2/ll/b2+I/E2b1uRp8G2ViTyd/Gc=;
        b=UeXoOsuB598IkxZnHdpXJm0qm8F5ccblIMRM2DFysWoGI4J+44Hy6J4eUJ2sJn18O8
         VoTzywFYwPQ1sQboAMrVXStcYE2egC4uFU9eZd0F+8ghIYIol/1vTD61KnVYLyNVN67A
         z3LEXlnIxBDb/8ksNE5Jay2PNNqBq6XA0x/HU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=YqeZUAqv/jrHfkF2/ll/b2+I/E2b1uRp8G2ViTyd/Gc=;
        b=L1R7ydgWYMmlXjhXdQsdn0tJ44bMrts1BBjTTEmtt8Y5Zc18bjW29J71VyrktPs0yp
         50Htzl6Ra+iWg5gBULthntwq+1uVXdZbh60ye2pXcjWddeYAU6GX2SvAuMkX0Z2sNogt
         p0faY1OrI7FCDrmzzSj4WXfHKxmQU+Y50Nx+QiESe5NVaWbPFNEZWAdB4wZJe1weTzs1
         0FlU2xnfNtZKJgO/y/Uy7xZ8PFWprb8r9i4p0QTd8DPM6z/t39/bBhH08YRPkTnDxJug
         nV7pc//W1LTgA2pn+q8ZzEswQC8y5uJgdaX5RLSG2TA5SzLakI3HKjBbALqvv7d2fKXG
         R3Pw==
X-Gm-Message-State: AOAM530R7u/QXsWVZUgH8G0bcri/8NnyUPbWinSgVYxfwCy1YEbKL4zy
	tVnATsq57A90XXdwchZ/8wTn0w==
X-Google-Smtp-Source: ABdhPJwSzefOzwiSFyCQGg9Ydmt3m8+IbG/8u5uNp3f6hUvAMoueM6E6/J5GL0Pf+vp6A1sr/V1vMg==
X-Received: by 2002:a05:6000:152:: with SMTP id r18mr8426534wrx.204.1598307973674;
        Mon, 24 Aug 2020 15:26:13 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.9.b.8.7.0.d.0.8.3.5.0.7.0.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.9.b.8.7.0.d.0.8.3.5.0.7.0.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c407:538:d07:8b9d])
        by smtp.gmail.com with ESMTPSA id w1sm1779316wmc.18.2020.08.24.15.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 15:26:12 -0700 (PDT)
Message-ID: <18639869486242f56549d4cdf82f1b1439c6cc1f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] wic/bootimg-efi: Added feature to exclude IMAGE_BOOT_FILES
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: khairul.rohaizzat.jamaluddin@intel.com, 
	openembedded-core@lists.openembedded.org
Date: Mon, 24 Aug 2020 23:26:12 +0100
In-Reply-To: <1598251182-58358-1-git-send-email-khairul.rohaizzat.jamaluddin@intel.com>
References: 
	<1598251182-58358-1-git-send-email-khairul.rohaizzat.jamaluddin@intel.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-08-24 at 14:39 +0800, khairul.rohaizzat.jamaluddin@intel.com wrote:
> From: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
> 
> Due to recent changes in bootimg-efi to include IMAGE_BOOT_FILES,
> when both bootimg-partition and bootimg-efi occur in a single .wks
> and IMAGE_BOOT_FILES are defined, files listed in IMAGE_BOOT_FILES
> will be duplicated in both partition.
> Since IMAGE_BOOT_FILES are crucial for bootimg-partition, but
> optional for bootimg-efi, hence allow bootimg-efi to have the option
> to ignore it.
> 
> The new variable, excludeibf, in bootimg-efi.py need to be set in
> the .wks file to make use of this feature. Simply remove the
> variable from the the .wks file if not needed.
> Example:
>     part /boot --source bootimg-efi --sourceparams="loader=systemd-boot,
>     excludeibf=y" --ondisk sda --label msdos --active --align 1024 --use-uuid
> 
> [YOCTO #14011]
> 
> Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
> ---
>  scripts/lib/wic/plugins/source/bootimg-efi.py | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

I'm torn between this and instead changing efi to use
IMAGE_EFI_BOOT_FILES instead. Changing the variable would mean more
flexibility in how the image is constructed...

Cheers,

Richard

