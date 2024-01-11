Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A4C3C47077
	for <webhook@archiver.kernel.org>; Thu, 11 Jan 2024 11:15:00 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.9246.1704971690138621777
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jan 2024 03:14:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=e6aRTdev;
 spf=pass (domain: linaro.org, ip: 209.85.208.169, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2cd0d05838fso59254411fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 03:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704971688; x=1705576488; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dDoglCe1gh9poGmx8YhdWDbu5lbFDa4hf9CDs2dWGyE=;
        b=e6aRTdevUQJBgve/f5TQCRQT4Tsm/jpJUQREWyuCeK4CziDXxcQLWY8cMXKjhJrpVI
         573869d7wzqZ3Xv+2KBhFbFVnabYaeXA3q/B8Rc+YQKtfwsJvPnNqf67nEuR+6LY2ekj
         /c4Y/4ucF9WLB4Xq/OQdm6WU41gGCUyEK4gBkFjHcD7/pzp3aLgtwVGVwWRsVF/YSPS0
         x3I1AOUcX5eF9NnFbM0SpFLG1EgaWsWJHMN+FBE++sMqhQALFRkgrWwfZ6xv4P6FWi7V
         0Jcejt7TYlHZnbcEV7o3SxWQNuVK/Q+VhGZ9RSvp+EGZv5INy6lwtE8nDa15YzdmagTm
         TG9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704971688; x=1705576488;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dDoglCe1gh9poGmx8YhdWDbu5lbFDa4hf9CDs2dWGyE=;
        b=WGvYFqUqrzVXyJF9bJw+DuhWrHIQCc+Us7rMz+1Q4iu5jT0eGQK53+4aKbOUdFryq8
         QDEIc5vXR6A7NZaP+IFjTYUBHVvya0syoTXsH5tX0kWVY0ulepTEoZEJ7cV+MzY0Yyho
         Veg8ABmbH2k9LLaVxsp/pCgr1ESSugWzZF/DRvg1kERNHKG2umIRttpzxdFMjQSoztEI
         NV5vZodUBR8LOhCS447gySH+kTIzGJYINPSOlywwrh7jQX0kneIg2blThS4vZCaPmc61
         +SAlP1nob9N2Srixjn5qcQ0zccgvO2k+HsFaCklHOgLD2y0C3yRiB6zV2EDCuKks2cXj
         LAHA==
X-Gm-Message-State: AOJu0Yzk+/bot5L5Vyj7DfIo8L8+aBRzpygimwnnFejeGPgnqcbTURF8
	w/gIglA1hEz5jonQe9JC2ZZC2ppsNkfq6w==
X-Google-Smtp-Source: AGHT+IFAnAxMqJoUEcPq9IJXnrim/RlJHfanHb4nhH6cfb35uigP5V9luSFUAMK/O7Qape5dkh7olQ==
X-Received: by 2002:a05:6512:3b8b:b0:50e:70b1:9544 with SMTP id g11-20020a0565123b8b00b0050e70b19544mr685010lfv.111.1704971688003;
        Thu, 11 Jan 2024 03:14:48 -0800 (PST)
Received: from nuoska (drtyq0yyyyyyyyyyyyhbt-3.rev.dnainternet.fi. [2001:14ba:7400:df00::183])
        by smtp.gmail.com with ESMTPSA id m14-20020a056512358e00b0050eb3b20b3dsm160544lfr.35.2024.01.11.03.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 03:14:47 -0800 (PST)
Date: Thu, 11 Jan 2024 13:14:45 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Sean Nyekjaer <sean@geanix.com>,
	openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	martin.jansa@gmail.com
Subject: Re: [OE-core] runqemu: ahci option
Message-ID: <ZZ_NpSCvzbInt8hy@nuoska>
References: <06A8365A-FC0D-43FC-A3A3-D3BC54B1E72B@geanix.com>
 <CANNYZj8DSe-qb+U2CniuBEM3hahJz3+7W3MBVro3fs=O0mNFoQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj8DSe-qb+U2CniuBEM3hahJz3+7W3MBVro3fs=O0mNFoQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 11:15:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193540

Hi,

On Thu, Jan 11, 2024 at 11:42:58AM +0100, Alexander Kanavin wrote:
> Generally runqemu is inteded for  (and tested with) specifically
> qemux86_64 MACHINE (or any other qemu* machine). So if testing your
> particular target bootloader with qemu isn't actually important, you
> can rebuild the image for qemux86_64, and in that configuration there
> is no bootloader: qemu boots the kernel directly.

True, yocto has a lot of history with the assumption that every board even with
common and compatible SoC's needs a specific machine configuration.

I think this is a bit too old fashioned and would like to move towards generic and
compatible builds where a single binary build works on a large number of instruction
set compatible SoCs and boards.

Thus I'd be happy to have qemu testing part of this and the hard coded assumptions of
qemu configs to be removed or made optional so that they can be overwritten
if needed. So patches welcome :)

Cheers,

-Mikko

