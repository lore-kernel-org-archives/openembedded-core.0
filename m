Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51847C433F5
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 10:59:18 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web08.9950.1639047557134362324
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 02:59:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=yNDDDI1b;
 spf=pass (domain: burtonini.com, ip: 209.85.128.45,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f45.google.com with SMTP id
 az34-20020a05600c602200b0033bf8662572so3788698wmb.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 02:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/zpjXV/L3R+Iyo40UZ5IaJe9HccuquSMjZ1k70XKWVs=;
        b=yNDDDI1bkMJVDzzjLxtLg2SDC2CW8vcJ6PbE8ql5kIATpAVUr+ItI+e34hJn0hhMEp
         eEXPN84S8gDwka9eJG4K8WF7R+3qI/0dfNozKx4KIy4xDRIMgEifaiwM2drBiPKc61E2
         dQZUUSBfYlVsKg54b6qgnJeYy5BW0Lz/mDCW6OT6w9MQFNLdzHAreduXJnt25H2TaenN
         1rKX+RN6GhTKG0fcetRbo0GzOLoGCR6PtXS/e+Mi9hvjqaSwvUZMY7x8edtkFsljYfFs
         COWYF0yJGI2wlp9Q8IxKN1OW/Ua2LTs7qV562QGgTkfrtt8vVmCocKaJkzbME6ytRyuf
         4h4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/zpjXV/L3R+Iyo40UZ5IaJe9HccuquSMjZ1k70XKWVs=;
        b=3JjjrZP688rXnRTz/WmfI5KDDQ18i9WqcJ2sBFob994oSP3UENZlHU+BBu4JMdH06s
         WcshST5N1ALDLJbz0wU4vkJXdmbqa7NI3Zw+UpN1HjPmblMgMFqmconrHfxm5TskeN/H
         47U90KpyVI4cq+RVV+0NxAekQ1fB+GNxslZz0pAf3suU/6cmVOsEtjyRUNtyzfTNmGjC
         C8KiKixWeb6O+JfDgifMP8TFXEJh9JjbZ5rXUfZOpqemEuqEyx5uzGko+KnjN/crVBJ/
         7hI96iyjLoX1u2lVoD6ADcuZMDu6qngJt5zjM2+miKF9ooLuOVqsFJMyHaXKtoMV5D9p
         va2g==
X-Gm-Message-State: AOAM533zep6j/czBiI8XQdw65IWarVYLBnAb0E2xGrWou/TnKVipGUEh
	31+Z6RlAFBy7kF6rviWpHvJPjKHoqdXZqTwjFjJyig==
X-Google-Smtp-Source: 
 ABdhPJyFqYNha+af9SMuoq5aZBdSuqzmBNl06OvxtTgi9CUrQ39bIfoFVX32rEbqusfb2dB0KDfbOXiA5ehykXHntzU=
X-Received: by 2002:a1c:7e41:: with SMTP id z62mr6470388wmc.62.1639047555494;
 Thu, 09 Dec 2021 02:59:15 -0800 (PST)
MIME-Version: 1.0
References: <cover.1637301667.git.uvv.mail@gmail.com>
 <83e41a0b7b5e1dc41fa89ffb4d3a8105299f7b1c.1637301667.git.uvv.mail@gmail.com>
In-Reply-To: 
 <83e41a0b7b5e1dc41fa89ffb4d3a8105299f7b1c.1637301667.git.uvv.mail@gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Thu, 9 Dec 2021 10:59:04 +0000
Message-ID: 
 <CAAnfSTttdJWnK=15xJbUgwze6spQ4q+VTsnYVX2-jQ1oD0-Xnw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/6] overlayfs-etc: mount etc as overlayfs
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 10:59:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159444

On Fri, 19 Nov 2021 at 06:15, Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:
> +# Class for setting up /etc in overlayfs
> +#
> +# In order to have /etc directory in overlayfs a special handling at early boot stage is required
> +# The idea is to supply a custom init script that mounts /etc before launching actual init program,
> +# because the latter already requires /etc to be mounted

Can you elaborate on the exact scenario that is being supported here?
Is it read-only / with /etc (and potentially more) in an overlayfs?

> +OVERLAYFS_ETC_MOUNT_POINT ?= "/data"
> +OVERLAYFS_ETC_FSTYPE ?= "ext4"
> +OVERLAYFS_ETC_DEVICE ?= "/dev/mmcblk0p2"

I'm guessing these are not universal defaults, but the values that you use.

If you can't provide default values which will actually work out of
the box, just set them to "" and the class can abort if they're not
set.

Ross

