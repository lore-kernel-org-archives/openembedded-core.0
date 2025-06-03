Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2949C5AD49
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 10:33:27 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.8015.1748946795847616849
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 03:33:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=teSPAUyv;
 spf=pass (domain: linaro.org, ip: 209.85.167.48, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54e816aeca6so6788168e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 03:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748946794; x=1749551594; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ui/l52r6A2urMJKN29J9yEHi2vgdjtPAQlih1V9p3+A=;
        b=teSPAUyvEJJCrvoatVsVIItkfD23X8dZGEg1CQugvj+Vw4NkUln6YhkbvxQbH1EHPl
         sDzgqDqEPKVuvjwkcd4S0yqDYLZwRCsCNgI3ODLOCkNIVL8u7mHZvN7mxzjPWbT86vTQ
         mgUEdfSBwAgtlS8xMmzfJTyOyaRLm8Ja8OJEB9pZgvFdAXDh12Tn1tP/BRrSVDcwA7nC
         UOMPSRSV3vzl6EX2zE78nvZsaLYkbOEnjBa5CkRlnwUzE7O2uY6MqcJraoLUoG/e0nRg
         rU8gXrRvI0hOsiid2CakEM8u0iW1hm4PgWGtSAfXRn7ZRQditebfdKrAk2fRK9Dk0UoG
         K36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748946794; x=1749551594;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ui/l52r6A2urMJKN29J9yEHi2vgdjtPAQlih1V9p3+A=;
        b=ipjXx6RlDuGaEm8EOLHQX+S1UsHXCMGLEXYHtySiPbJVNpA0lWOpun4Xh8mnlaA99c
         QWOVUUY3f1YJPW0UmjrvGvEK+uKHBmVop01AqfgFsI3kqBZP5Z0rTPgvvdQP8QWHjwj8
         79oX3KTAiL7uHCtcxvIOazcnDaa5gWqZxdhXeTlwIJ5cbO6zT92K2C7TjL8yfA5zcLcC
         SNXzXOP7dmQgiCi5bux+U58nptcB3z0wgx6R59p3RQd9I9CkfF5GmNxlq9l6D5dfgBnb
         6wCktVrZIYDC0WABc4ORcoQxOBNaR8MYiy8SPbzR9Xwc1zPoZRBm9HBIva60t8XbHQgG
         1FuQ==
X-Gm-Message-State: AOJu0YyhyilgYhKbNqgiwEjLmvNQBXOvzPB355hOLqQOXoy+wwor+uHT
	RWZ8ADhWzDMOERxLK0aYRk3rsvCsO1OG3ITJuiFEgeaRr7M4lCKS81s/szsmlqb5VbI=
X-Gm-Gg: ASbGnctrhh8G7GIiJixXWwI4ZYqUiDR6qNNbxnL9RuWdHhr9FRr7R6T5NReLvoJeEgo
	MXTC+2CFVXzZJevRwvR50y3vXRJuBN+C49Bfv+qObIg3thk+NBc4GaB+YoyCTwLkna1F/NuA1Ok
	8x8YwW7UoxCP+z9bhivEah3YAw4qE/4OAz2ezwrnsv399ldDIZywHPqc9F2ooY/mhrk1pPK1+by
	Nzc+sQrxw9eOfYglq7s1FO1nOMQDTDTilviZzpkoNC1P59qmiSIm5AmT84M+E812F8zu6DLcj1w
	8XDGgHyR44GUSPLVfqwgXTnk9xYaZ0vS4/Qkm0+sr6fT0Bign4vWLI6lSSNLmKcpdu2Pkkcg4rD
	ALucjBVHV
X-Google-Smtp-Source: AGHT+IFNiWEgGOT3V1X019iB2zcQlM8XuqFSIWTidaSqFhxlXme5Qhk3749jCuhbVgQ+5+sm1TWDtw==
X-Received: by 2002:a05:6512:b96:b0:553:2ae4:366 with SMTP id 2adb3069b0e04-5533b9308bbmr4572017e87.39.1748946793856;
        Tue, 03 Jun 2025 03:33:13 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a85b55e11sm17106011fa.57.2025.06.03.03.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 03:33:13 -0700 (PDT)
Date: Tue, 3 Jun 2025 13:33:11 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v5 2/4] qemuarm64.conf: allow overriding
 QB_OPT_APPEND
Message-ID: <aD7PZ8fGwKylsqI_@nuoska>
References: <20250527090758.540188-1-mikko.rapeli@linaro.org>
 <20250527090758.540188-2-mikko.rapeli@linaro.org>
 <233e873f04683cf93055707ce37235bc8d9a2742.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <233e873f04683cf93055707ce37235bc8d9a2742.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 10:33:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217801

Hi,

On Tue, May 27, 2025 at 12:53:20PM +0100, Richard Purdie wrote:
> On Tue, 2025-05-27 at 12:07 +0300, Mikko Rapeli via lists.openembedded.org wrote:
> > It enables qemu USB support which causes a reset
> > loop currently with u-boot.
> > 
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> > �meta/conf/machine/qemuarm64.conf | 2 +-
> > �1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
> > index d310445a34..f086729641 100644
> > --- a/meta/conf/machine/qemuarm64.conf
> > +++ b/meta/conf/machine/qemuarm64.conf
> > @@ -20,7 +20,7 @@ QB_SMP ?= "-smp 4"
> > �QB_CPU_KVM = "-cpu host -machine gic-version=3"
> > �# For graphics to work we need to define the VGA device as well as the necessary USB devices
> > �QB_GRAPHICS = "-device virtio-gpu-pci"
> > -QB_OPT_APPEND = "-device qemu-xhci -device usb-tablet -device usb-kbd"
> > +QB_OPT_APPEND ?= "-device qemu-xhci -device usb-tablet -device usb-kbd"
> > �# Virtio Networking support
> > �QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
> > �QB_NETWORK_DEVICE = "-device virtio-net-pci,netdev=net0,mac=@MAC@"
> 
> I am very worried about merging patches specifically to disable usb
> (here and in the selftest) since that is something we expect to work to
> allow the graphics images to work properly.
> 
> Is there an upstream discussion about why usb causes the hang and/or
> any estimate on when it might get fixed? I'm partly tempted to revert
> the uboot version instead of this.

I've reported this to upstream u-boot list now
https://lists.denx.de/pipermail/u-boot/2025-June/591233.html

The bisection points at enabling USB support for qemu so
the issue seems to have always been there and possibly
quite fundamental.

Would it be acceptable to disable USB support in
qemuarm64/genericarm64 u-boot as a workaround while
keeping USB in qemu?

I tested this and qemu USB devices were still
detected in by Linux kernel and u-boot just ignored them.

So for u-boot aarch64 KVM support under qemu, both
CONFIG_BLOBLIST and CONFIG_USB currently need to be
disabled. Both issues reported to upstream and hopefully
better fixes get developed. We could apply the workarounds
on qemuarm64 and genericarm64 and improve testing to cover
KVM u-boot with qemu. KVM could improve qemu testing times a
lot on aarch64/qemuarm64/genericarm64.

Cheers,

-Mikko

