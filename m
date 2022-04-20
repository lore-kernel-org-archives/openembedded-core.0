Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D769C6370E
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:09 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web08.9312.1650468842220630742
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 08:34:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fO+lA4Us;
 spf=pass (domain: gmail.com, ip: 209.85.128.51,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id x3so1451624wmj.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 08:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ni5uPoZDdZcHhq5paPDfrpxAQ9pVUOaMG1MBykMfCkA=;
        b=fO+lA4Us2BO1EdMIaDFjVuY8hBGfRtbI6+IdVVvurWlfbHO4/TpoGbVr3LTjbo081m
         zRH38+6WVM+QE08dHGdMrO7dPWUESJySHUX0sF3GRkNGiYUHTr2OT7j4V9NnzDFA6j6G
         tmMRKq9ZRmCVAAL9vIwTE3/zII0BNO5k8ncRwALMmwylvT4pk/K9XPmh7VenxB1Ewar1
         EGPKGLXafLdAU9KvYekGEIdNlO0oppZ2Pkp66ogZj3D62lMTzgCAdRhCXK/auAThjXDQ
         FRo6/GCO4dJkakE3IYvyKtFkSd3NLu6NR7bNxiuBO3KInH248/W57uKwnxfOqQRTLMzB
         Iikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ni5uPoZDdZcHhq5paPDfrpxAQ9pVUOaMG1MBykMfCkA=;
        b=bD9EQoaQ+GieXYEfhWNWYfnOQ6yUJJsbdq4RRUZNLPIImqubPGAu4/VfhMb1oNS+5f
         shXmxBWXB2deLXqfkqNYjQIqZ45v7rMHGnkT58IqH0psGiBIMi6SYg8N+TBGMgDqktLZ
         bO/cZdTkng061/gXRHBX3htd+pwDAkt3LuB3PRYvDj8gv3USIPy+q/arhbpBs35LRdDj
         5wpd1Y4wL+1Ozqo0H71+WvGufx6640CoQTkAWGW/i1FwQHVE58ai+LoYrMLOj4Icbn52
         uUnEoq+BWLhM0CYiYa45AuHaVnsQvqKWkbavtPvPvUlXByxd/AM4BgqqBngD/lrmsSB6
         os2w==
X-Gm-Message-State: AOAM530JqTQAta0/3tsudvTSbpC9D2ndMD1UzD2lQWwcDWXY4YJCaLj0
	Ya5mUJgq0UyZsjyVhmDXF1K0sXht3MSpe5FRWq8=
X-Google-Smtp-Source: 
 ABdhPJyEulAWAi7ileUWaPN1Z3YEhcCQpKnPlYrJ0QbKGMjjxpbBrcoYlGnjzafBiG/9phUwJ5bB9ISEDQglMMjH23Y=
X-Received: by 2002:a05:600c:6020:b0:38e:c006:f55f with SMTP id
 az32-20020a05600c602000b0038ec006f55fmr4164361wmb.123.1650468840547; Wed, 20
 Apr 2022 08:34:00 -0700 (PDT)
MIME-Version: 1.0
References: <29ddcf5f-5b9f-490b-2ed2-faac7f6985bd@pengutronix.de>
In-Reply-To: <29ddcf5f-5b9f-490b-2ed2-faac7f6985bd@pengutronix.de>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 20 Apr 2022 10:33:49 -0500
Message-ID: 
 <CAJdd5Gavt_eJQ3J2pz-5grj_T+UWK3=SNG6JRxRQ2w2fx=0fWg@mail.gmail.com>
Subject: Re: wic --offset: how to create GPT images with out-of-order
 partitions?
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Enrico Joerns <ejo@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164704

On Wed, Apr 20, 2022 at 9:43 AM Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>
> Hi,
>
> I have existing systems that have the entries of the GPT partition table in a
> different order than the on-disk order of the partitions: e.g. /dev/mmcblk0p7
> is located at an earlier physical offset than /dev/mmcblk0p1.
>
> I have written a genimage config to achieve the same result and am curious
> to see whether this is possible with less dependencies by using a wic kickstart file.
>
> There is an --offset command, which looked relevant, but it doesn't seem
> to allow out-of-order creation:
>
>   ERROR: Could not place sda2 at offset 4194304: next free sector is 262144 (delta: -253952)
>
> Is this unsupported by wic or am I missing something?
> For reference, this can be reproduced with:
>
>   part rootfs-a --offset=64M --fixed-size=64M --fstype=ext4
>   part env-a    --offset=4M  --fixed-size=8K  --source rawcopy --sourceparams="file=uboot-env.bin"
>   bootloader --ptable gpt
>
> If I swap the partitions around, image creation succeeds, but I need
> them ordered the other way round.

RIght, the code creates image partitions linearly from top to bottom,
so a partition lower in the list can't be inserted before an earlier
one; I believe this is mostly to simplify the logic for ensuring that
partitions don't overlap.

If you are using GPT, I'd recommend mounting the disk by label or UUID
instead of position, so the ordering isn't important

>
> Cheers,
> Ahmad
>
> --
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

