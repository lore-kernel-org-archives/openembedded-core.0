Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8BDDD49227
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 14:20:48 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.41570.1731939640960644627
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 06:20:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=UJPmknIz;
 spf=pass (domain: linaro.org, ip: 209.85.167.45, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53d9ff92b14so4395683e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 06:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731939639; x=1732544439; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lWlR7eYhtRpzZUKoAJkq6YCM2lmryP5fubqitTPrYNk=;
        b=UJPmknIzook2/+Q20ygVJ+b8ApzGY+PrpVc6bMdVVzKSQH2IYJJMxHYVRJGe7yZAxG
         70Ao71HnjKyR10sRa/vxBda4I2arpDyPVZQ8zIFr1NCoFiHQFlz/QFgO/xEDKo8nHXGn
         8kL5ylRHJZwAIuXvOUzOQpArenh1WN0yd/RcghEyljO7xIf0wkYGl4Qux+SfmqBt503J
         8olBrkSZVfYtgzZMKCmM0Fubbud75HkBeKo3SzAEc5UOgWM03ygUaYPaskBsUDyPwVLs
         ndOPJxuOvlqTis2uDWx9WrTAcNnXugh5QMkslYmv3Zpnl1jirOZy2fQkVANb7Lsr+n9Z
         sIlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731939639; x=1732544439;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lWlR7eYhtRpzZUKoAJkq6YCM2lmryP5fubqitTPrYNk=;
        b=c1VrD7sTox2jbZrgpNxVZY7umHiC+Tbwg/81ySHG3ZAKw+Hj9H9AxEGhOQb4Z0zq+A
         fqBD6/paLlzkPa/1XPNjGxduNgzNEphdJvUIwZrqKYAJ5j0ZpvCrt38Y7u4CiCzhjCLE
         SH81W0smr1oofWbp2WkoBxWa9ZyTTK2p1X9pQN+YuJq+7HvmEDupzwfOJfYja+be6cDa
         mwZkza/LgPPorTxRrIX1Cqh7YypH60OfTviTfnPVW9kKuMjAfcqLUBXlgBK+AvDo1noK
         f+5ep+QOgHRuoAOeS4Ee6yBveRHjX+27G/6bLDfua2mk+AnhVpwqyRleZN7lPm/6uOin
         LrHw==
X-Gm-Message-State: AOJu0YyetqQeptAEz9tR7VpTJ9uMdSMliurba2A2UdcSc/g1zrYpzFOH
	3w6VKfTJf+Shw4tSHpzPGtffW7Vypnci+tZQnAt/Wia343B8NoCjE2Zc4bl11Lk=
X-Google-Smtp-Source: AGHT+IGRbO5FcKmtLmHAQyXTc1aKn0Yxap3mU81XkhACseQ62G9M5Tgdw7y5fSQgfayLpEn+CgvBmQ==
X-Received: by 2002:a05:6512:b08:b0:53d:ab04:6b28 with SMTP id 2adb3069b0e04-53dab3b9efamr5071425e87.53.1731939639027;
        Mon, 18 Nov 2024 06:20:39 -0800 (PST)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53da64f2a49sm1604703e87.19.2024.11.18.06.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 06:20:37 -0800 (PST)
Date: Mon, 18 Nov 2024 16:20:34 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] wic builds an empty rootfs on second image build with
 rm_work enabled
Message-ID: <ZztNMmHa7s21MJXI@nuoska>
References: <Zyjj-0oflBsZfj1C@nuoska>
 <553b223a0d437044e587b0ddaf0519803ff57f2f.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <553b223a0d437044e587b0ddaf0519803ff57f2f.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 14:20:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207216

Hi,

On Tue, Nov 05, 2024 at 03:53:49PM +0000, Richard Purdie wrote:
> On Mon, 2024-11-04 at 17:10 +0200, Mikko Rapeli via lists.openembedded.org wrote:
> > Hi,
> > 
> > After image build completes, rootfs directory is wiped by rm_work_rootfs.
> > 
> > If the image recipe is built again without clean, for example when
> > TESTIMAGE_AUTO is enabled to run tests, then rootfs task will not
> > run and thus wic uses an empty rootfs directory to populate the rootfs which
> > of course then fails at runtime.
> > 
> > How to fix this?
> > 
> > I know RP doesn't like rm_work, but I really need it. I can't leave all
> > builds laying around and bitbake IPC setup fails if a lot of IO is wiping
> > build/tpm's while recipe parsing is happening (the famous 30 second timeout).
> > 
> > wic image related tasks could possible depend on do_rootfs instead of
> > do_image_complete but seems to break the whole do_image_complete design.
> > 
> > Should rm_work_rootfs be moved from after do_image_complete to after do_image_wic
> > if wic images are used?
> > 
> > Or should users just remember to "bitbake -c clean image && bitbake image" if things
> > fail?
> > 
> > There are some other issues with testimage.bbclass and leaking cooker processes
> > which confused me for a long time but I'll try to send patches for those.
> 
> Does changing:
> 
> image_types_wic.bbclass:
>         bb.build.addtask('do_image_wic', 'do_image_complete', None, d)
> to
>         bb.build.addtask('do_image_wic', 'do_image_complete', 'do_rootfs', d)
> 
> help?

This did not help. I need to dig deeper. Some of my changes may be
triggering this. I'm seeing this now on aarch64 and x86_64 build machines.

Cheers,

-Mikko

