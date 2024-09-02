Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2B03CA0ED3
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 11:23:48 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.36406.1725276224863550147
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 04:23:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=hjjX+z5n;
 spf=pass (domain: linaro.org, ip: 209.85.167.51, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5343617fdddso7073809e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 04:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725276223; x=1725881023; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cDH8Zci6lzR/Dqb2DTLa11KrHNn3/p4dsJV0wlc9jW8=;
        b=hjjX+z5nLyQr6s3yB2JYNJmx7O7vrBBFVJRGjVn5HIK1VXVwerHIz0UmJHM7a2FF+f
         t9e3RpQzheyACGijJJZ3bZ9PUL3/UAMNwBZmJisqxL8ZPjjGYj57o8CtaKmInYZP6uC6
         riklBz4ncfO752xSM2rg7m71bDxXMUWic5lAlxFgWlBUmoW4kIKuxIx7/iwTRWZ9rpzJ
         DvI0Qu2bhMfCrSfVhnSFW+Y+O7PforxKLcmsDZm4lz3ePyXpQPcw4x/0dteo/E/n1Obx
         KNlTBgT5Z+2MVlc6TamVoNJLkJLUY1Zptz6ofFj+/nyIaz8imiDHgETapQklWswMIcjh
         aM3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725276223; x=1725881023;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cDH8Zci6lzR/Dqb2DTLa11KrHNn3/p4dsJV0wlc9jW8=;
        b=wxf0+Qcbsg046Za8tzhisJ0R9pP2bEYDeDEEtqM2+BTWouwME0pY2b/EZaqlLhmpB1
         Ys+ZDtOPZqklO1Xw++MYDSnd9O+N2+x8hYigcJCFr2SCNqNilUNDBrTUf4Iv4KXvBDBC
         wHI27yNDl50k8NdZRp6N44LK+zWQownP5Eiy9g5OVXhhJbYi7zujNHkoMsE74An+1Rbd
         lYmLL8kUGxivF/30p87UPUfyZtdEu6gF0t97U5j1ZZFnLG1yRwujvozqIpKhtOfirJZ1
         xJotOXjgyw/atfTdhktG/xkuiZBbzZAdI8C9QXcFQ5e/VZmFoPZneyP7vd5H7470AGSw
         pDWw==
X-Gm-Message-State: AOJu0YxCnbM3bJKKqEOEWeaQpQa5OI2V99Qyhr7iBrWu7Ix4Wm3X6m0w
	oLvmNn/CGvZRL654vJRH4Yai7V0TyKNI50+Ngc3W6N2/4sRtOXGSrZvBDx2eP0E=
X-Google-Smtp-Source: AGHT+IFATL/qrevtQBuniHR4GeHnzBoHvDQgShdorLqE6zDTEjMh2MINvK6P5XmVP8mrNyZiXXG6OA==
X-Received: by 2002:a05:6512:108f:b0:533:4785:82ab with SMTP id 2adb3069b0e04-53546b223d3mr8180729e87.1.1725276222442;
        Mon, 02 Sep 2024 04:23:42 -0700 (PDT)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-535408274f8sm1575780e87.146.2024.09.02.04.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 04:23:42 -0700 (PDT)
Date: Mon, 2 Sep 2024 14:23:40 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Michelle Lin <michelle.linto91@gmail.com>,
	Erik Schilling <erik.schilling@linaro.org>
Subject: Re: [OE-core] [PATCH 2/2] uki.bbclass: add class for building
 Unified Kernel Images (UKI)
Message-ID: <ZtWgPF0JN4uyjU1u@nuoska>
References: <20240902105825.40177-1-mikko.rapeli@linaro.org>
 <20240902105825.40177-3-mikko.rapeli@linaro.org>
 <CANNYZj-cgTaKagNxx2mxTkPsp4U-JNNGrruUDUSPbn_cFz6+nw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj-cgTaKagNxx2mxTkPsp4U-JNNGrruUDUSPbn_cFz6+nw@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 11:23:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204096

Hi,

On Mon, Sep 02, 2024 at 01:11:27PM +0200, Alexander Kanavin wrote:
> Should this also have a wic based selftest or some other way to ensure it
> works?

Yes, but that depends on the UEFI / Arm System Ready compatible firmware.

For qemu, this can be setup using meta-arm and qemuarm64-secureboot machine
config. The patches for UEFI secure boot are currently in review and if approved
I will switch those to boot uki binaries, patches are ready but not submitted
yet.

I don't know if poky alone can provide UEFI firmware to boot with.

Cheers,

-Mikko

