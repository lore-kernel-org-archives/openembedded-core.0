Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28836C369BD
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 14:49:05 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.21062.1744814943861354815
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 07:49:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=OWOS9/ze;
 spf=pass (domain: linaro.org, ip: 209.85.167.47, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54d3ee30af1so6762693e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 07:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744814942; x=1745419742; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KWugdzflSWPAlDXrc6g5kXw5GoE9nyHRWzdh0V46+zQ=;
        b=OWOS9/zeMgxdp9VzNXhB5/aDbnBEfzJGFKbMBBTNibSFj7hQgyrcO1BA22gBOPiC5k
         6nFPWFlnIONOBS8BzV+BM9DCDrhrQYNrexyhXnn9XERzRySls2vGEeoQeaGgLjb8SQz4
         m1Mn5JUeCY5wTlCgk5OnjzweUamu0hjp1jgN1By+pmnqPoXxkO6oMtLloi6gHGNbIqqT
         DRlAtmE8ojg8/0MBs7XHk3qfJg//3ftTAwO6UtuNpLZtNzFivxuoCAt6DaWGwWT4jOmt
         F9r2GZa+0XO/Qt2lUGJFNlsUv9g+Q/oVgIWuzbQcrIjAA5pf3blPuLtCQHYtkRpxh14U
         e3BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744814942; x=1745419742;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWugdzflSWPAlDXrc6g5kXw5GoE9nyHRWzdh0V46+zQ=;
        b=SrEehIAUvvIg5avc5txd8uiq6NnZMRRehjIKtNcoP5C4PU0X4Lw1BMjwnE0LcW/Q7x
         cxhfCtWZ9utT/j2+OpEnEK3IYjSZlnsNt19IQkb5VoSA+E63iogwf3pKDpYpOYfgcRlW
         MuDsUqq8nyt2WvS9kpuh5dI4GWNjPxtAwCgJA1HQgLYQT5Xw9ire3KszduaUVqRT7no5
         7oGNUcEPeFXAOYBg8F2Zf6karSMcFrEVMc0IgVlzNsgIFiK78AiCZs5vNxqx2l0OLwAV
         4bm5eFR0l0z1VEuiH0OGTjdKcMiHj+Vpp9dOvmebFmkc84ATQeZLR5LVNSY1zPyXpb7L
         7smg==
X-Gm-Message-State: AOJu0YzKGNf8FNpjznmSb5f/Zuv8RHY5DqQR7VSL/nVFCigDegfzYUEr
	fXHhobJseHS9X9bok3Ugd7T0+32UD/0aRehq9DOH/Xr/yzhz2Pn9sjXsMOGEr1c=
X-Gm-Gg: ASbGncs8Kl+TCqNbQwoBfljG8+INTra3ZAhX+Kzj92Sl+gWcJfT/zOdE5XxlWJXyEew
	56hh0XGdeczoIDNcG6mMcObqLm4w8MLZWiUTR+ucavFQbvzSO1NMUetv6+cpwDaIu04gkYK1FMN
	22OA7mPZD5fc8XNwsDo5nnFk6KWfbFG7Mj8vFZEat9pO7VXRwf8rQzEm5w7lFBL6NCc40QAv1qs
	ao2Mk/+9OkMeSiAEXB4rHsyen9LBHv5PfZ7UF6ArjiG1HTE4EbRYQVIfkBfQr5qvKCe6HY5c6q2
	IPRb3Qf/TCAwPHX9P2W/LQGdmJfJFBW4P2VbtXUmihpdWlZY8BHyZTyRQa15uccWSveyoum65S4
	nvk8=
X-Google-Smtp-Source: AGHT+IFL7eAwDUqABTY+XeSm2Pum2OG4KeaoKtkuQ2pnq0hj+Gww0d20PiNXu+a3u+rMGY+Slp3Kbg==
X-Received: by 2002:a05:6512:138a:b0:549:7c64:3bc0 with SMTP id 2adb3069b0e04-54d64aab1ecmr700621e87.29.1744814941669;
        Wed, 16 Apr 2025 07:49:01 -0700 (PDT)
Received: from nuoska (85-76-51-64-nat.elisa-mobile.fi. [85.76.51.64])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d5026f6sm1690651e87.153.2025.04.16.07.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 07:49:01 -0700 (PDT)
Date: Wed, 16 Apr 2025 17:48:59 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: L.Anderweit@phytec.de
Cc: openembedded-core@lists.openembedded.org, upstream@lists.phytec.de
Subject: Re: [OE-core] [PATCH] meta: classes-recipe: uki: Make initramfs
 optional
Message-ID: <Z__DW-Vchk7l1MQ9@nuoska>
References: <20250416-master-v1-1-be5e7309c5a8@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416-master-v1-1-be5e7309c5a8@phytec.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 14:49:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214994

Hi,

On Wed, Apr 16, 2025 at 03:36:24PM +0200, Leonard Anderweit via lists.openembedded.org wrote:
> Make it possible to build an uki without initramfs. The initramfs is now
> optional and will only be included if INITRAMFS_IMAGE is set.

I had considered this but decided not since to me UKI without initrd
isn't very useful compared to booting just a kernel EFI binary
directly.

Can you disclose your usecase a bit more?

> Additionally, remove do_image_complete dependency on
> INITRAMFS_IMAGE:do_image_complete since do_uki already depends on that
> and is executed first.

I remember hitting race conditions without this, but you may be right.

Cheers,

-Mikko

> Signed-off-by: Leonard Anderweit <l.anderweit@phytec.de>
> ---
>  meta/classes-recipe/uki.bbclass | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uki.bbclass
> index d9a7fb0e6fe0..4db5f614b96f 100644
> --- a/meta/classes-recipe/uki.bbclass
> +++ b/meta/classes-recipe/uki.bbclass
> @@ -75,8 +75,6 @@ INITRAMFS_IMAGE ?= "core-image-minimal-initramfs"
>  
>  INITRD_ARCHIVE ?= "${INITRAMFS_IMAGE}-${MACHINE}.${INITRAMFS_FSTYPES}"
>  
> -do_image_complete[depends] += "${INITRAMFS_IMAGE}:do_image_complete"
> -
>  UKIFY_CMD ?= "ukify build"
>  UKI_CONFIG_FILE ?= "${UNPACKDIR}/uki.conf"
>  UKI_FILENAME ?= "uki.efi"
> @@ -127,8 +125,9 @@ python do_uki() {
>      ukify_cmd += " --stub %s" % (stub)
>  
>      # initrd
> -    initramfs_image = "%s" % (d.getVar('INITRD_ARCHIVE'))
> -    ukify_cmd += " --initrd=%s" % (os.path.join(deploy_dir_image, initramfs_image))
> +    if d.getVar('INITRAMFS_IMAGE'):
> +        initramfs_image = "%s" % (d.getVar('INITRD_ARCHIVE'))
> +        ukify_cmd += " --initrd=%s" % (os.path.join(deploy_dir_image, initramfs_image))
>  
>      # kernel
>      kernel_filename = d.getVar('UKI_KERNEL_FILENAME') or None
> 
> ---
> base-commit: 183e043de423fd3f7833366ca524a6f7d17e6d14
> change-id: 20250416-master-5da9e74b8fc2
> 
> Best regards,
> -- 
> Leonard Anderweit <l.anderweit@phytec.de>
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214990): https://lists.openembedded.org/g/openembedded-core/message/214990
> Mute This Topic: https://lists.openembedded.org/mt/112294799/7159507
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mikko.rapeli@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


