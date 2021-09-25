Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E57FDC433F5
	for <webhook@archiver.kernel.org>; Sat, 25 Sep 2021 18:01:58 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web08.9722.1632592917868739882
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Sep 2021 11:01:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eOjKb9OW;
 spf=pass (domain: gmail.com, ip: 209.85.222.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id i132so32254173qke.1
        for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Sep 2021 11:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ybh9iqbRSS0auwRsO9DXphm5QueVoRMxzTCjUqvRH88=;
        b=eOjKb9OWSN32HMHWjv+xzaWjAQcJa8lztqenUHZF15mrAyhKjvGKW0BwntzQzXVaEO
         EB4d2UxGXeOZ+IepSeLkQHmI6FYpbVQk+waFfftdB3qz2vj3fgUpp6nSWQfZ53JAL6x7
         cQsYMNZ+ZghmYZ0duskVSDDW26GGjL7I+P1SVRGwHQkI1Y/9B5Ns3IcTBZBACg/baq3B
         36Er9zkuxmrWiUcl3//5RzPzJVbfLAnGOU7wbiNuuVv4KWnXPhBB0C6/mfzZf8f4h2WR
         uTjXhUA+NvHxTgCInRS6KvCjcSCIeN7PXfWRiRYSNzEGlOoJI6lkNIdXJBURWz675vF4
         29oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ybh9iqbRSS0auwRsO9DXphm5QueVoRMxzTCjUqvRH88=;
        b=2C50p0ISnDyYD7M9LBgKNzYoOc9oOS+paGOMmvJI9SrczjEf0S6lFXpSNxJ44mTakX
         sK7wP9kpJYXpMmb0hfx2DeWfyF6UW2JMb6CxYJNeRG0eLHW8/h6xZWkCxSypOCCTDnxS
         DNIV6TajG8DoDNrZvwT7nIZsDaup0hiijvvyG+lpn5+TD58R8SLXfR5GzH2oY+AFSdDv
         7YV+KScfGZG56rOBzHhS0qRdkIUCiaxtjKtdFnWS1gjWz1UiqD4e4mlh1lyPpSeEpaKR
         S+Xk32fkNu+wvoQqDF7D31t3GFkYI0W70hFuIle9bphcASWHGFzJ9wLraK9DsApc6JDh
         7xEA==
X-Gm-Message-State: AOAM531uRw8s8KvdMqojrcV88GzSnQ1fEW0VRZ+vXnsLKM4MFhDd4dLI
	bsVdsh5vpLAxBk1wOqTwo4HCR+MbL5p+5Bbw8GY=
X-Google-Smtp-Source: 
 ABdhPJxwHfx5Mrp5NOc2/8O4ly4pOv66/7hpAA+E9yjZQceVon9FcGb5ee453dnm5m9/Zn5GcB/WKN2UzKvq027q+QQ=
X-Received: by 2002:a37:48f:: with SMTP id 137mr16657738qke.105.1632592916526;
 Sat, 25 Sep 2021 11:01:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210925170952.144140-1-f_l_k@t-online.de>
In-Reply-To: <20210925170952.144140-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 25 Sep 2021 11:01:30 -0700
Message-ID: 
 <CAMKF1soDrSW8SPC4XwFX+63WEfR=AyN7oXehuVxj++r80NG+PA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] wic:direct.py: ignore invalid mountpoints during
 fstab update
To: Markus Volk <f_l_k@t-online.de>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Sep 2021 18:01:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156353

On Sat, Sep 25, 2021 at 10:10 AM Markus Volk <f_l_k@t-online.de> wrote:
>
> wic fstab-update creates invalid entries for partitons that are not supposed to
> be mounted from userspace e.g u-boot partitions.
>
> The following lines were added to fstab on a rock-pi-4:
> /dev/mmcblk1p1 loader1 vfat defaults 0 0
> /dev/mmcblk1p2 reserved1 vfat defaults 0 0
> /dev/mmcblk1p3 reserved2 vfat defaults 0 0
> /dev/mmcblk1p4 loader2 vfat defaults 0 0
> /dev/mmcblk1p5 atf vfat defaults 0 0
> /dev/mmcblk1p6 /boot vfat defaults 0 0
>
> With this patch only valid entries should be added
> /dev/mmcblk1p6 /boot vfat defaults 0 0
>
> Signed-off-by: MarkusVolk <f_l_k@t-online.de>
> ---
>  scripts/lib/wic/plugins/imager/direct.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
> index 9d10ec01d0..15fa47356f 100644
> --- a/scripts/lib/wic/plugins/imager/direct.py
> +++ b/scripts/lib/wic/plugins/imager/direct.py
> @@ -117,7 +117,7 @@ class DirectPlugin(ImagerPlugin):
>          updated = False
>          for part in self.parts:
>              if not part.realnum or not part.mountpoint \
> -               or part.mountpoint == "/":
> +               or part.mountpoint == "/" or not part.mountpoint.startswith('/'): \

Looks good.

>                  continue
>
>              if part.use_uuid:
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156350): https://lists.openembedded.org/g/openembedded-core/message/156350
> Mute This Topic: https://lists.openembedded.org/mt/85864315/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

