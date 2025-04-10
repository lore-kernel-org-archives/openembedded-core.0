Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6135EC3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 15:27:14 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.1236.1744298825710644269
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 08:27:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=G8u+60Cn;
 spf=pass (domain: linaro.org, ip: 209.85.167.44, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5497590ffbbso946454e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 08:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744298824; x=1744903624; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oSIeoe+8W4TLcOdozN95+uB2dPeMzytdeLtUvCmq+88=;
        b=G8u+60CnnGNmWWBplrNnG87PaAa888L+WnH6Z6CQZbaTstc3BLe0CqVtUCd6h0mIn5
         xaJOej1BMQ9GAQQX1L1Ttz+EwyoCd2azjjT/aX1eSuwTYr36Z2EYJOmiuOHkrmAZk4AF
         oSVHfDlBENAziGqkDMqFiF/nZJ7PIYfCizAOkmd2YgI4MO5Vk+khvXc7Nv/ihlDf6VfU
         EvgsUOd4ysIQPguri/SOueUtckUS8ibR1aLMQW1b9N1R5ecXu6zYQABQkrR61sq87CTK
         ektSS32Do/UH5GEDGkkwhKcJE43rkoT7n/Y4201GrTlOrsq9TbUpKER4o4k3L3Se7S2v
         T1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744298824; x=1744903624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oSIeoe+8W4TLcOdozN95+uB2dPeMzytdeLtUvCmq+88=;
        b=nzHDR26jB+mPa50PcCBTKR5wXlqljrs4bUntZ1r5Ke43XgQ+4uSZDwyuN3bYb+wTVe
         9JkzUM2fgAx3LxeyEP7W4Jq8xDGGgv1e4V9ki+HyzMrlTVYbxStlq2xRdtseSO56n3a9
         rhqr8hMqkahzcGMvpfawugOoZ1654LMP7jalcoP6NUFqQegrma9EIueAmxgTshKIMkNB
         cm4XaIOrFkAtnCGA0/1YHxrpEJMv7L5QfusqoQL+bQ8efPYKuvChemwCuFJiXMpz0Wnb
         +LxZo9/4RyoJc9rNx++eprJcyzHu8/59cNwI6mF8CoTsj5qR5cvQ69D00GPz7uZAv2/g
         QQsg==
X-Forwarded-Encrypted: i=1; AJvYcCUyV9XHnnnD4YWtT+pio3Y1Vz5Zf45uTm/rArJPR6R1ROYcg8bABWBCnjbJ2ToAe0aUzwbR31PUD/DPfP35KcTF9A==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyyecvt1nPzCLFvVje/IVXYriN1msRmX8AQf7c1mfoTFP0aWysD
	9wZ7VXnkcU7dxPRjVpac/kFzhQQ3ERQqrtfuZtMYff7JLDBkhbnL2OQ+zfFY8lk=
X-Gm-Gg: ASbGncsvFi+2qyXQpVnmeMwgoUOpwiP9PiO4A4SW184ncTEVDDaF7ajQ850MoM7watQ
	MY8cFJX99o9Y5W53EhFdH9/gp2DbXbeeWfNRekF8Z+hN5NBfI/mOkTHTiEgJ9bryfk/MwKmzJBq
	pCtAENT8SlLDy9PqtPnY4CjLW3QAkcvAJv0geLV7V87BLwQnr1ETznqFr4ClcAG4UVyG/8W3alQ
	fpyGdCBLtN6t9M6r1mEOFeIcTwFrAyKQsegJCr3GDX+y3VYolRPpEhWcOjaONH26BU/aL8XLcqj
	pYdVusP4KIecC1r+nUvdYJDom9bCQjzxzl7J5Fp/vwezRKUm0t/buhdKw0d9DK/Hp5trrZI0HZ8
	cp/Imacof
X-Google-Smtp-Source: AGHT+IEJz+4jyAJAGUWx2+7SBjOZh9SBrikQci0SCGK1tzsFcMHG3A3CWylp/Q/xG4WKI/whUbRiuA==
X-Received: by 2002:a05:6512:3d8a:b0:54b:ed9:2cf9 with SMTP id 2adb3069b0e04-54d3c59e830mr1085634e87.4.1744298823762;
        Thu, 10 Apr 2025 08:27:03 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d511564sm182028e87.209.2025.04.10.08.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 08:27:03 -0700 (PDT)
Date: Thu, 10 Apr 2025 18:27:02 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Adrian Freihofer <adrian.freihofer@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3 01/11] systemd: enable efi support by default
Message-ID: <Z_fjRoOGro758Lwv@nuoska>
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
 <20250404162932.447699-2-mikko.rapeli@linaro.org>
 <f84af1a6585338787539ee5be5826adbe434e8a9.camel@gmail.com>
 <CAC_iWjKTmSEOe6HUcPFUZLaBuA2+6ZwOYaYiqK0_R8KGNPU1Ug@mail.gmail.com>
 <CANNYZj_eA4k+pRLG=8-V4WEmsthkh_o75fZKOcoTf+00QW2x2A@mail.gmail.com>
 <CAC_iWj+80LnSOJ=ZeMos4psFwQ4zqt8fo-e13+8sPuBtsmp5Dw@mail.gmail.com>
 <CANNYZj8rsSWX7GL_mqQz3h==31wKsA_myVAHbGXdUDv+O7YsXA@mail.gmail.com>
 <CAC_iWj+vw=wUJYb4MDWJ3KoPrECwzr4wNbrJNpDvC=o=QWFJqg@mail.gmail.com>
 <CANNYZj9dJyOavS3ag-jbfyTd8q252RFU3smmFtFpKa_yEkKsqw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj9dJyOavS3ag-jbfyTd8q252RFU3smmFtFpKa_yEkKsqw@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 15:27:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214679

Hi,

First, Sorry for the email address mixup with Adrian, mutt
bounce did unexpected things.

On Thu, Apr 10, 2025 at 04:51:51PM +0200, Alexander Kanavin wrote:
> On Thu, 10 Apr 2025 at 16:39, Ilias Apalodimas
> <ilias.apalodimas@linaro.org> wrote:
> > I am going to assume that by 'boards' we mostly target embedded ones right?
> > The majority of those work with U-Boot which has a pretty capable EFI
> > implementation nowadays and supports a variety of filesystems.
> >
> > P.S: I am pretty sure that EDK2 and servers support more filesystems
> > than just FAT, but I can double check.
> 
> We're talking about UEFI firmware, right? The thing that reads the
> bootloader from ESP/ on storage and runs it. Is u-boot or ovmf used to
> implement that? It's that firmware that I have scepticism about, not
> the bootloaders.

There are multiple levels of bootloaders. From HW to first ones in
CPU SW/firmware, multiple levels inside and implementing UEFI and then
ones using UEFI interfaces to load operating systems.

We're talking about the ones which implement UEFI and edk2 and u-boot are the
most popular ones. ovmf is based on edk2, as are many SoC vendor firmware
implementations. Default qemu builds of u-boot also implement UEFI which we use
in oe-core to boot wic images with an ESP partition which then hosts
grub or systemd-boot OS loaders, config files, kernel, initramfs and/or
UKI binaries.

Hope this helps,

-Mikko

