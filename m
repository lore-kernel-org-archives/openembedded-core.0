Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 383A5CD13CF
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 13:15:29 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.38296.1725282927239096960
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 06:15:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=nU15oio2;
 spf=pass (domain: linaro.org, ip: 209.85.167.53, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5343e75c642so5483052e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 06:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725282925; x=1725887725; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZEjYeSbaDQpviMDqo/LU8gpT1OU4M/PZJ8/uXa1qOPQ=;
        b=nU15oio234Jht4+KO5mCA+N5vTdSVdnVwAkwYE1v2jhP6q2IXYxHlGJrdukUb/PlDf
         bxG04BBaP4lNQ46461O7ZOJos3YvHqX8mz7SyBi9YFcreToZ4x1mx+h8aDAwc5HFFunc
         h78hQ048KjlVtBtOgKPdq6Pdc7CMaz8lBCoPHoiB+Z5OEIDkWvk7DpWzxIuWROucoEWB
         AdKpSzo9sKW5ZoETAmuzMdjRoG0E/WrAS4l3rehJqvM08/MSG5OjTWoPwxniRhUyV5kT
         GMxuEcTf2dKlWDDQAZUwZU6msS2PouA6ObzgfQIpSFXkV/ZIZAEUupZbZSOIfPZZ+uAA
         /bNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725282925; x=1725887725;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZEjYeSbaDQpviMDqo/LU8gpT1OU4M/PZJ8/uXa1qOPQ=;
        b=o0FFtPQmxEm1IqCFBIFHGc7uUL3v9fN5jk/tpa5KIoB0pWCLGjAZmmGthupChaJA0E
         tzZtne+yepVF3MtaWroumXmITKjzMzCPccYrPZwTxYpgEnjYp5Zjm+4tXFGo2IONeltF
         N5K9Pyqb1Faf8iQIY0bW4Zy76TcCH/VMOMFCJm27PgnOtktV43DIexKJ9oeNbLID4GyG
         zE0HDjZhKg7SSajl7n+o4V/P8ku8W1c5t9Mw5aO2W47z5slS3yzwtm3od5GphIxCT8/r
         knFi0zy2ckRCgMF4EKiKY8WeWylSWiNoGIeeaoRj4ZYzu0UW0SpGwA8mz/Awmb/zTTzU
         HI6Q==
X-Gm-Message-State: AOJu0YwlHW/DyuZGCo5jEDKPq8VtkrFsJAnOafc/fKPyGz7VAg5QjAxN
	XtXfe0hrYILdE5bu92KGg59qKY77KzJo4UiMDseRjw370aM2S0KKvNz7Uasvlo0=
X-Google-Smtp-Source: AGHT+IFKhQLnOND7n5d/hXGB0qykYeUrXTksbDrzThex6YOCYKvt6pL+8I3aMIkqC3iTK+6G2hrkSg==
X-Received: by 2002:a05:6512:3f11:b0:533:4652:983a with SMTP id 2adb3069b0e04-53546b49f56mr8259599e87.35.1725282924730;
        Mon, 02 Sep 2024 06:15:24 -0700 (PDT)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53540827a29sm1624003e87.161.2024.09.02.06.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 06:15:23 -0700 (PDT)
Date: Mon, 2 Sep 2024 16:15:21 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Michelle Lin <michelle.linto91@gmail.com>,
	Erik Schilling <erik.schilling@linaro.org>
Subject: Re: [OE-core] [PATCH 2/2] uki.bbclass: add class for building
 Unified Kernel Images (UKI)
Message-ID: <ZtW6abFD67IrL28X@nuoska>
References: <20240902105825.40177-1-mikko.rapeli@linaro.org>
 <20240902105825.40177-3-mikko.rapeli@linaro.org>
 <CANNYZj-cgTaKagNxx2mxTkPsp4U-JNNGrruUDUSPbn_cFz6+nw@mail.gmail.com>
 <ZtWgPF0JN4uyjU1u@nuoska>
 <CANNYZj9ke4yEQh0hAxk4fUazaEzQMP7JUKv6LYRv16CTwXpqFQ@mail.gmail.com>
 <ZtWuxNNd9KNxT4T3@nuoska>
 <CANNYZj-uXEDm2CuqtorwdZNABaZNPm4UtOFZvw4wMXdjhh+0ig@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj-uXEDm2CuqtorwdZNABaZNPm4UtOFZvw4wMXdjhh+0ig@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 13:15:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204102

Hi,

On Mon, Sep 02, 2024 at 03:03:45PM +0200, Alexander Kanavin wrote:
> On Mon, 2 Sept 2024 at 14:25, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
> > I've checked and I have not found matching examples. We have everything working
> > for UEFI secure boot for multiple ARM64 boards and qemu, including oeqa runtime tests.
> > Currently the qemu side changes to support UEFI secure boot are queued to meta-arm[1].
> > They could in theory be proposed to poky as well but there is no
> > matching machine config for that. meta-arm provides u-boot and many other
> > firmware SW components, including fTPM. ovmf seems to be only for x86,
> > same for the meta-secure-core side examples for UEFI secure boot.
> >
> > systemd uki support is really generic and not at all specific to arm
> > architectures. That's why I think it belongs to poky. Yes, the tests
> > need to be somewhere else currently unless test target HW already
> > has UEFI compatible firmware, but even with that the deployment of
> > signing keys/certs needs to be done separately.
> >
> > [1] https://lists.yoctoproject.org/g/meta-arm/topic/patch_v4_00_13/108164747
> 
> I've checked now. There is support for UKI in
> scripts/lib/wic/plugins/source/bootimg-efi.py
> 
> and there's a test for it in
> 
> meta/lib/oeqa/selftest/cases/wic.py (see
> test_efi_plugin_unified_kernel_image_qemu)
> meta-selftest/wic/test_efi_plugin.wks
> 
> Which begs the question: why add the class at all? Does it do
> something that can't be done by extending wic code? Can you adapt your
> work to use the wic plugin using the above as example?

Well, I wasn't aware of those implementations nor do I know how to use them.

I can try to figure out.

Cheers,

-Mikko

