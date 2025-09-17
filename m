Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96348CAC59A
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 14:46:13 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.25349.1758120369599389036
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Sep 2025 07:46:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qdn1t0M8;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-807e414bf03so891343185a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 07:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758120368; x=1758725168; darn=lists.openembedded.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ymlQ/m/sHg6ilWU3hLZt1V+ICcpwWQq4tVs8YKxxGE=;
        b=Qdn1t0M8iKEs480Jl1OPGhDZaS81dSSuXwVQunwvEqrNurcf9tjborRG41b5+o1SW0
         2TjiGbV73LTcJzOF2G4e8d4KGY5PQ/TsdtmoQ58HvWO4q6JvHO0zZtGtNh0bEHzStL2f
         BEc9XBmfxZHp4d7DLwPFTMb65enOXI50f9ZfCgrEH6sh4VJEpxKBBAARfCs6Y+CMqpMv
         cqcuQn8hMY1TEkVAWn1cZZyB/bpik3A9S/pFU/K9uNG+7+9JtBH2VU8wWCQvaldEN1dh
         sWom7TmevRgZ5fNz+h7sD9EcaBg1PI3FtCsc/L4r9UH+Yxwjvz/CZKUB2Rc79uX9Bdo0
         WOIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758120368; x=1758725168;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ymlQ/m/sHg6ilWU3hLZt1V+ICcpwWQq4tVs8YKxxGE=;
        b=jobLaYpM7l6HiIQRt88/3BXHfsPA9qjDM2zlp9v3g0v2w0b2SsA6Kt6nipC/OUY6v7
         /Adq/rF9UQ5u7d1aqxgb4KqdUN6Sq0x08LY+zNTlmue5+f+vO0/lc2HQWKKGM54mQP8H
         X3XI2nCWF1q/PGYRHWnP9Qp0cU0xHL4dJ9zFVkiyvlGPq2OZFxDxhJ0fA6ITXLTJR1QN
         qGytqmkBeokQ68UcrVN3wqig1aoIGRlAC7A12ftnWi9wCV7z1wHfJaneEuPjqUVPVeNq
         lcZjZ2FyueRbiowketq7Z2f8sahaTRzDC25z6s2cLlMw0zX14/USmhpqzcIi/nv+oqDe
         UK2w==
X-Forwarded-Encrypted: i=1; AJvYcCXJEzErC7OUVXwwAA4KZ6j5j5e3gjyfViQxUd+6IjBja3597XUBBdjra541olYVmnoZZkAEaAwGJB7+Srpg7B0wkQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxlPddlpaUSj1/bVDh2/T750wQdrZ3ZHlzncYCRXqy8CdfMNY5R
	uYuACRJ+a0eBeuLTVRP7T+M7vRoPYNTZoE5GOMBRhFT+/e1hWUT0mFbp
X-Gm-Gg: ASbGncsy4cVTrOK+vnkDbKwk2kvziY5f6aUMRlhlJ1IAahkb0jbalVOQ5VdB5KWRFUn
	MNs8RVMK9Qsu4FN4Bl1vKBIu5F/VIqmoP3H2djNOt67e7Z/rKmj17W502Zxkn2c9Do3ZzoQP2k5
	rOQW7TSwhckefDQbwPNGZR4qBUjjsttZ/c8+1xtDd22MiyUqzGPoAjveN9HOgm4VY9bZd30gRX2
	uXJHtVlgTSkak9ZKtJXSq2CAhPrDj0NIY16y6RvjZfKp6dznxVCTtYpl/5jWWYRsmm3WA24GfMo
	mciDDN5+VkDqb2LpXtZrIvIYMCO7AkBYQBaPA+tt1uGn/KQXYl+UffoC47gkSQ06w46hz/mXRon
	kaRCehzK6I9ZlyQ2ZQFy3J+o+tZTm9mgukXqYAaiFflcdAb6RC2RswLWnbkl7
X-Google-Smtp-Source: AGHT+IEYFicU9XBbtcU27wGwLxZcx/9JI3QmOnUMNPNmwkDqV/Ghcr6JdV86AlC67I+k4YwlLTvKiQ==
X-Received: by 2002:a05:620a:4002:b0:828:5f7f:eeb3 with SMTP id af79cd13be357-8310e4a6ef4mr299838385a.50.1758120368332;
        Wed, 17 Sep 2025 07:46:08 -0700 (PDT)
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-820cf8c8b87sm1141953685a.68.2025.09.17.07.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 07:46:07 -0700 (PDT)
Date: Wed, 17 Sep 2025 10:46:04 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: macpaul.lin@mediatek.com
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alexander Kanavin <alex@linutronix.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core@lists.openembedded.org,
	Bear Wang <bear.wang@mediatek.com>,
	Pablo Sun <pablo.sun@mediatek.com>,
	Ramax Lo <ramax.lo@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
	MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [OE-core] [PATCH v3] wic: Add support for variable sector size
 when creating ESP
Message-ID: <20250917144604.GA11844@localhost>
References: <20250915064137.4025945-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250915064137.4025945-1-macpaul.lin@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 14:46:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223610

Hi,

Out of curiosity, are you in a situation where only one partition (your ESP
partition) is using UFS and the rest of your image is using the regular sector
size?

This patch is useful for you and if the oe maintainers are okay with it
there's no technical problem with it. But it is very narrow, it only provides
a variable sector size in the case of the ESP where someone is using the
bootimg_efi source plugin.

In my opinion, the whole variable sector size thing needs a comprehensive
overhaul, not just for specific use-cases at a time. But I understand you
probably need this to un-stick yourself so you can move on with your project
;-)

At work my team has a more comprehensive variable sector size solution that
allows us to build wic an wic.ufs images in parallel, but it assumes each
entire image is one sector size (wic=512, wic.ufs=4096), and it is against
scarthgap. If there are use-cases where different sector sizes are required
per partition within the same image, then the only logical place to support
that is with a partition option on individual lines of the wks file. E.g.:

	part /efi --source bootimg-efi --sourceparams="loader=grub-efi" --ondisk sda --label msdos --active --align 1024 --sector-size 4096
	part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024 --use-uuid
	bootloader --ptable gpt --timeout=5 --append="rootfstype=ext4 console=ttyS0,115200 console=tty0"

On Mon 2025-09-15 @ 02:41:37 PM, Macpaul Lin via lists.openembedded.org wrote:
> Derive sector_size from the WIC_SECTOR_SIZE BitBake variable.
> Recalculate blocks to align with the chosen sector size.
> While the default sector size of mkdosfs is 512 bytes.
> Pass -S <sector_size> to align the setting of WIC_SECTOR_SIZE.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  scripts/lib/wic/plugins/source/bootimg_efi.py | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> Changes for v2:
>  - drop --sector-size, use get_bitbake_var("WIC_SECTOR_SIZE") instead.
>  - drop value filter of sector-size.
>  - drop creating new sub-varible for 'part'.
> 
> Changes for v3:
>  - Add -v option back for mkdosfs.
>  - Round up the value of blocks instead of round dwon.
> 
> diff --git a/scripts/lib/wic/plugins/source/bootimg_efi.py b/scripts/lib/wic/plugins/source/bootimg_efi.py
> index cf16705a285a..288fe6a15a7d 100644
> --- a/scripts/lib/wic/plugins/source/bootimg_efi.py
> +++ b/scripts/lib/wic/plugins/source/bootimg_efi.py
> @@ -415,8 +415,19 @@ class BootimgEFIPlugin(SourcePlugin):
>  
>          label = part.label if part.label else "ESP"
>  
> -        dosfs_cmd = "mkdosfs -v -n %s -i %s -C %s %d" % \
> -                    (label, part.fsuuid, bootimg, blocks)
> +        # define sector size, default is 512 for mkdosfs
> +        sector_size_str = get_bitbake_var('WIC_SECTOR_SIZE')
> +        if sector_size_str is not None and str(sector_size_str).isdigit():
> +            sector_size = int(sector_size_str)
> +        else:
> +            sector_size = 512
> +
> +        size_bytes = blocks * 1024
> +        blocks = (size_bytes + sector_size - 1) // sector_size
> +
> +        dosfs_cmd = "mkdosfs -v -n %s -i %s -C %s %d -S %d" % \
> +                    (label, part.fsuuid, bootimg, blocks, sector_size)
> +
>          exec_native_cmd(dosfs_cmd, native_sysroot)
>          logger.debug("mkdosfs:\n%s" % (str(out)))
>  
> -- 
> 2.45.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223386): https://lists.openembedded.org/g/openembedded-core/message/223386
> Mute This Topic: https://lists.openembedded.org/mt/115249776/900817
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [twoerner@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


