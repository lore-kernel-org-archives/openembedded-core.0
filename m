Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.11287.1598444885177569365
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2020 05:28:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=f/8ISgiT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id h15so1594717wrt.12
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2020 05:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=qNt/h5q1RX+KFJdTTo5vJK6U3VnsiRc4fbzx6+6f/Yc=;
        b=f/8ISgiTHwuI92uSWBdaG/XFdAIn6pwfQbFEEEKDB96knhUkKQpgY34OEhyvvSnZye
         JsJwKW82swcKnV4NG09KLNRqIsObvaYZGpunG8kkmY78MBSi+IVGXKtaFafoBKn35P8n
         57NLAsqxDLjX36k5DR+xPpCxPEv5yNrwKqxi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=qNt/h5q1RX+KFJdTTo5vJK6U3VnsiRc4fbzx6+6f/Yc=;
        b=dcyvMgBQpIp4EdOhTmR4vugW1ipNHLugmtn/bW72FCUL5lixgg9MQ2HZM76aiBINHZ
         mvmUwfBJRLBREv/ArYWieSd5qTeH66NDiHIhAsBv0WZnkGjVlrEjAS5UXucmuxfBn3IB
         Wa3T80PmWDpWAvV+GRlZ65MLv4ScNVae8DO7Ymuog4UbmHRDUwsCmlICw80XnEltdDkL
         9bLbj88n2D+0QJZ1fHFUqCDAk8gVwVLB/xfuMhWiTbZcbDUmdZAi9WRK1vgWth1/r65k
         whdeC7nPd3QAtziRpQS2d6H+E+T7IZ0hTLXpQ+qmoZGQP1M5w+CZHu3Sja8bMr52Nyeq
         CvAg==
X-Gm-Message-State: AOAM531r021+Ct5Cp6ngW9Wuw3sG9hGc3OWKvlsZAB99+YUFTys/XLVA
	ehLOa0pJeBPjKP+nx7pzr+BoBg==
X-Google-Smtp-Source: ABdhPJx3dRnZKZEf+rGe69p1/+8Ays1NUrVuXytv6z/ASd2/8Ps96wR2PnWEqk5FElE5rZaONdwR0w==
X-Received: by 2002:adf:b18d:: with SMTP id q13mr15136305wra.256.1598444883549;
        Wed, 26 Aug 2020 05:28:03 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.9.b.8.7.0.d.0.8.3.5.0.7.0.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.9.b.8.7.0.d.0.8.3.5.0.7.0.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c407:538:d07:8b9d])
        by smtp.gmail.com with ESMTPSA id j8sm6161574wrs.22.2020.08.26.05.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2020 05:28:02 -0700 (PDT)
Message-ID: <fa0af5b0faf2194dc3932321e42004bbb1f3d7bb.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] wic/bootimg-efi: IMAGE_EFI_BOOT_FILES added to separate bootimg-efi and bootimg-partition
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Jamaluddin, Khairul Rohaizzat"
 <khairul.rohaizzat.jamaluddin@intel.com>, 
 openembedded-core@lists.openembedded.org
Cc: randy.e.witt@linux.intel.com
Date: Wed, 26 Aug 2020 13:28:01 +0100
In-Reply-To: <1598429593-16162-1-git-send-email-khairul.rohaizzat.jamaluddin@intel.com>
References: 
	<1598429593-16162-1-git-send-email-khairul.rohaizzat.jamaluddin@intel.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-08-26 at 16:13 +0800, Jamaluddin, Khairul Rohaizzat wrote:
> From: Khairul Rohaizzat Jamaluddin <
> khairul.rohaizzat.jamaluddin@intel.com>
> 
> Due to recent changes in bootimg-efi to include IMAGE_BOOT_FILES,
> when both bootimg-partition and bootimg-efi occur in a single .wks
> and IMAGE_BOOT_FILES are defined, files listed in IMAGE_BOOT_FILES
> will be duplicated in both partition.
> Since IMAGE_BOOT_FILES are crucial for bootimg-partition, but
> optional for bootimg-efi, hence allowing bootimg-efi to have the
> option
> to ignore it.
> 
> Added a new variable, IMAGE_EFI_BOOT_FILES, to handle this
> issue. Its basic usage is the same as IMAGE_BOOT_FILES.
> Usage example:
>         IMAGE_EFI_BOOT_FILES = "u-boot.img uImage;kernel"
>         IMAGE_EFI_BOOT_FILES = "u-boot.${UBOOT_SUFFIX}
> ${KERNEL_IMAGETYPE}"
> 
> This commit is also squashed with the updated testcase to cover for
> this change.
> 
> [YOCTO #14011]
> 
> Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>

This looks like the right idea but it fails in testing:

https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/1280

Cheers,

Richard

