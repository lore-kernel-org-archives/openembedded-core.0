Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 068F6CA0EFF
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 10:24:38 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.9895.1725013474787421632
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Aug 2024 03:24:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=QwUSLav9;
 spf=pass (domain: linaro.org, ip: 209.85.167.52, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-533488ffaebso1963317e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Aug 2024 03:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725013473; x=1725618273; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N5FpuRSBCBYIkwN7UJdwcUnfmlg5Q3xzi59iTJUrHcM=;
        b=QwUSLav95e7mvLD1MdwIp3KM7tr8OzIbytpRnDSdw3Pxpy/0eAX3Xsu8KAPeFUDZfv
         Ulpk4icxq9sNS0zIA1GMxZOAznFKzVGxh/JalLtvftUE8ls0BrMMkqbySWIi/ngyAy0o
         RiV4eMA91vbNAxSsM/9/3F4YjpVS6zpgzBvYIz+gZz+hIzaQ9LOkAhQonbAOT6pmPOLF
         Jq0koXFkEJhegDewNEeR5c09sPFAp/6jS06T/BmNMJ/LIGX+dUHN3YiNXIDF3c04mTai
         4PgNcUGV0VloIfrZKGEe4jiIRehhZocoDTtIB0Y0xjQGlskxpR6xE8YT5W39Smu6e6Q6
         SLyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725013473; x=1725618273;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N5FpuRSBCBYIkwN7UJdwcUnfmlg5Q3xzi59iTJUrHcM=;
        b=NvP6trzVqM2+LL1vxaVHoPPry6UFCzgxiX31bDdaP8lhO7TZbhl79glI6cwmzEucrg
         YM0DoRwuoitRMf1PKw06D1sXVMvP8J1QIFs+HGmt8Vzn6zHSjLYwHiHQtWg1WyXu58AA
         2VhwFdP3j63sNeTPVWKnZdRmROYXl24IDeiYAD9TnXC9Db85jT5Vb8H8otTwHj3VAvSU
         4T4+cCeODoDSSI7rvkuIM9PNdHlvtG7BkavupyoZBWXd4x+ndff62umwXIadfH8H6PMU
         HpFCTwgJHJVi0oZ67SDXXN9/2sfDYtAPT9LlvcQwnCJskiK+97aDuR1XXjxpYdbcOOQa
         8tJA==
X-Gm-Message-State: AOJu0Yw/twQGDOoTgkYLspHlaBblB7zOxvXHkhLmcvQ0MTz+PZ0O+PeU
	GRGM3saslC3EBHCkYbBfhHze0uYf3UHcWABXtm+4jzAcv1UiQ26s87d4VPcpozU=
X-Google-Smtp-Source: AGHT+IFEt+s/zlqMVvn/CXSH1gDdggiVBw8CJeGz/gCXn4uWP8S34b3JpVPLGr5dryN2dasSYGkrBw==
X-Received: by 2002:ac2:4c4e:0:b0:52c:9f9e:d8e3 with SMTP id 2adb3069b0e04-53546b40c79mr1171857e87.31.1725013472262;
        Fri, 30 Aug 2024 03:24:32 -0700 (PDT)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-535408275c6sm535981e87.166.2024.08.30.03.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 03:24:31 -0700 (PDT)
Date: Fri, 30 Aug 2024 13:24:29 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: jdmason@kudzu.us
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2] default-distrovars: Have KERNEL_CONSOLE
 reference SERIAL_CONSOLES
Message-ID: <ZtGd3Wb7E4ocBXb_@nuoska>
References: <20240829214144.2947418-1-jdmason@kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829214144.2947418-1-jdmason@kudzu.us>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Aug 2024 10:24:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203956

Hi,

On Thu, Aug 29, 2024 at 05:41:44PM -0400, Jon Mason via lists.openembedded.org wrote:
> Currently, KERNEL_CONSOLE has a default value of "ttyS0".  However, Arm
> machines and those using virtio serial prefer to use "ttyAMA0" or "hvc0"
> (or something else).  These are usually defined by the machine config
> file as SERIAL_CONSOLES, which has one or more entries.  Take the first
> one of those instead of ttyS0, but default back to ttyS0 if nothing is
> set.
> 
> Also, use this variable in the efi wic file instead of "ttyS0".

What kind of issues prompted this patch?

I ran into possibly similar issues recently where a machine config
and image is meant for multiple arm64 machines and serial console
login stopped working on some of them. The kernel console messages
were on the correct serial port on all machines but systemd-serialgetty recipe
setup was not. I switched from the yocto specific systemd-serialgetty
to upstream systemd which fixed all issues and serial getty is
now on all needed serial ports (based on our test setup):

systemd_%.bbappend:

PACKAGECONFIG:append = " serial-getty-generator"

In our setup we also can't set the default console via kernel command line
since that changes between machines.

Cheers,

-Mikko

> Signed-off-by: Jon Mason <jdmason@kudzu.us>
> ---
>  meta/conf/distro/include/default-distrovars.inc | 3 ++-
>  scripts/lib/wic/canned-wks/mkefidisk.wks        | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
> index 7554081e8b1a..976ff4adc526 100644
> --- a/meta/conf/distro/include/default-distrovars.inc
> +++ b/meta/conf/distro/include/default-distrovars.inc
> @@ -1,7 +1,8 @@
>  QA_LOGFILE = "${TMPDIR}/qa.log"
>  
>  OEINCLUDELOGS ?= "yes"
> -KERNEL_CONSOLE ?= "ttyS0"
> +# if SERIAL_CONSOLES is set, take the first device entry.  Otherwise use ttyS0 as the default
> +KERNEL_CONSOLE ?= "${@d.getVar('SERIAL_CONSOLES').split(' ')[0].split(';')[1]},${@d.getVar('SERIAL_CONSOLES').split(' ')[0].split(';')[0] or 'ttyS0'}"
>  KEEPUIMAGE ??= "yes"
>  
>  DEFAULT_IMAGE_LINGUAS = "en-us en-gb"
> diff --git a/scripts/lib/wic/canned-wks/mkefidisk.wks b/scripts/lib/wic/canned-wks/mkefidisk.wks
> index 9f534fe18471..5fa6682a9e10 100644
> --- a/scripts/lib/wic/canned-wks/mkefidisk.wks
> +++ b/scripts/lib/wic/canned-wks/mkefidisk.wks
> @@ -8,4 +8,4 @@ part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024
>  
>  part swap --ondisk sda --size 44 --label swap1 --fstype=swap
>  
> -bootloader --ptable gpt --timeout=5 --append="rootfstype=ext4 console=ttyS0,115200 console=tty0"
> +bootloader --ptable gpt --timeout=5 --append="rootfstype=ext4 console=${KERNEL_CONSOLE} console=tty0"
> -- 
> 2.39.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203948): https://lists.openembedded.org/g/openembedded-core/message/203948
> Mute This Topic: https://lists.openembedded.org/mt/108169885/7159507
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mikko.rapeli@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


