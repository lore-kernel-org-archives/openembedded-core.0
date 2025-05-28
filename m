Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8857C3ABB2
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 06:41:05 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.9892.1748414463690884965
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 May 2025 23:41:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=NoGBX/RF;
 spf=pass (domain: linaro.org, ip: 209.85.167.45, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-553245cad29so2819308e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 23:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748414462; x=1749019262; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZKPmSx5lFe5GW0U0QXhZwclsyP8hr76kCgW2hzjCmfo=;
        b=NoGBX/RFGyO/juCzE2RefRHUBqHmIRmunYrqmyos+XGXzDNUWFODxdNKEx7i6BvUpS
         PcUL/PrU5zQPnyQAWgUYekGy947ok2HX73lf99KBWcJRO7v5Js/5Qa8Yj9pZQKfp/WZg
         oXsWQgtZ7AkVRrvtgw5xViNxaBvMKA+P/lqep0dTqpRroNU0fo3PUIDv9yP4HxQyKpHZ
         +EDp0BvkaQrVLFtOM5AehRDKbgkfA0F5KPsyhLfEzgeVbK57XiIPj7wXdzSoceCsTyOF
         5C8yukPUp1IkZcv5uEYlmOX7Eileqb+jq2gs2XgPfrKpvvRrkhSU+EKFnLTogk3PYHgw
         Q/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748414462; x=1749019262;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZKPmSx5lFe5GW0U0QXhZwclsyP8hr76kCgW2hzjCmfo=;
        b=e0j7y2KQSpG34jt5l+Rk/P5k7+G9B6nROyiWlJYA99HWgsKMX7TbFNrIpltHFr3+j6
         92u7BzlegGWHkeXgj1L/Pw8u//9NznFUMYZAESypgGeFmjQimCIlgyQ2yc+kVbixU49J
         7eQYk0lnpI3STaF/b00ljLyKo5agQiAaV5uLWpJMDBqL7uyM7lcVxDNxqqN0HYCmEIGt
         7n5u0LOWrx4Qo4lZoaeKPGmSMDUtcYhrwuB8NWdYtAVO04esL6H0rpXdsMV151mEdBX8
         xwL3N7LEmrsP3cyLem9AwsgVNOtuuAgIjG+6SjJehmDIqKY/ntxqRF0muthYKvTc/7mH
         g5+Q==
X-Gm-Message-State: AOJu0YxffeLDlTr5SYDKHtNt+cOBsf77CJ+zBsTFmmLDJ5cn5AZDBiQV
	0ZHCrR3vMWSiVT1okGZOrH1Fp8ejhL+mPptqPG8Xfj+yVsjghRhQNNAG+OXL46yNOSs=
X-Gm-Gg: ASbGncuM0YzB5dVfSeq4Y+Qxf4noikWprj0J5Fk2ugkzFiI2gEOdhuobZOZDv0X1v41
	eJ7GOS9ciEYeBBWCHIlvlfmBLE7j/oioDyw+WI4m2gLO+mu9l8xwCZ0rhiMAVszClCBy8mB3qf0
	akRTiKvtEwtDphdXi3RN6SDJB3PQmOrRKRURGSvBGKtVsLyt24IJSaGdPm1ec8D2qnLyrQuWU4f
	CSiOZXrbNkj+VtYxEkAPcRixBtwKSzwjbjsVmZLp9QZgWOMMM/tpP24zez+SsAmjRInCSkCHDIL
	fBK4D3+E57nGWSVbT7pO2hQwHP1nRJTXFK/7cgsAToRXKDrVNCPNWG3dieM9p9tHbyAnVOA9E7K
	E/yw3asO8
X-Google-Smtp-Source: AGHT+IHrmA+h+UeZ/ZyyhO/qIL8/EBkOp+CcKJjkSarBrL3C+Ej4xPJV97dFo5jWFMBfiZKk8j0+8A==
X-Received: by 2002:a05:6512:3d0c:b0:553:2d6d:99e5 with SMTP id 2adb3069b0e04-5532d6d9b63mr938351e87.43.1748414461665;
        Tue, 27 May 2025 23:41:01 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f69abebsm138870e87.133.2025.05.27.23.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 23:41:01 -0700 (PDT)
Date: Wed, 28 May 2025 09:40:59 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Tom Rini <trini@konsulko.com>
Cc: openembedded-core@lists.openembedded.org,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: Re: [PATCH v4 1/4] u-boot: disable CONFIG_BLOBLIST on genericarm64
 and qemuarm64
Message-ID: <aDav-wwUJUIGGFVI@nuoska>
References: <20250526083548.413834-1-mikko.rapeli@linaro.org>
 <20250528005133.GP100073@bill-the-cat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528005133.GP100073@bill-the-cat>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 06:41:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217336

Hi,

On Tue, May 27, 2025 at 06:51:33PM -0600, Tom Rini wrote:
> On Mon, May 26, 2025 at 11:35:44AM +0300, Mikko Rapeli wrote:
> 
> > Booting u-boot on qemu with kvm is currently hanging on aarch64
> > build host. Root cause is in u-boot and CONFIG_BLOBLIST can be
> > disabled as a workaround.
> > 
> > To reproduce, build on kvm enabled host where "kvm-ok"
> > succeeds. For example genericarm64 machine and core-image-base
> > should then boot with:
> > 
> > $ runqemu slirp nographic novga snapshot kvm
> > 
> > On qemuarm64, default kvm setup will boot directly to kernel
> > and is not affected by this. If build enables u-boot as bios
> > then the same issue happens.
> > 
> > Without this config workaround, the boot hangs without
> > any messages in qemu output but ctrl-a-c to qemu console
> > can shutdown the emulated machine.
> > 
> > This seems to have regressed after u-boot 2025.04 update.
> > KVM boot can be detected from speed, for example genericarm64
> > boots in 550 ms with KVM and without in over 5 seconds.
> > 
> > Fixes: [YOCTO #15872]
> > 
> > Upstream u-boot discussion:
> > https://lists.denx.de/pipermail/u-boot/2025-May/590101.html
> > 
> > Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> 
> I think it's a tad early to disable this. On the U-Boot side, it's being
> looked in to. In fact, you're saying v2025.04 is working (current
> release) and v2025.07-rcX is failing. At this point in the U-Boot cycle
> I think we'll figure out the problem and fix it. If we can't figure out
> how to keep all the use cases working for v2025.07 then disabling
> BLOBLIST here in OE can be thought on, I would expect. Thanks.

2025.04 is affected by this. My wording for this is not accurate enough, sorry.

We have a workaround for qemuarm64 and generiarm64 for testing use cases
with disabling BLOBLIST so we might as well use it since there does
not seem to be any downsides to it in testing.

Cheers,

-Mikko

