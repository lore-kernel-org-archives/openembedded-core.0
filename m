Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16085C761A6
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 14:04:49 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.55448.1680271484381313949
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Mar 2023 07:04:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VR7sv5P/;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id h9so23144548ljq.2
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 07:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680271482;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Hwge78YkW+s0m/xOn8dQum1bLh51zmAMrgOIhWOIxkg=;
        b=VR7sv5P/T1F2hLUkvYA58h815aNf+0LAKfsYnxAL31I+yYIYZiTTiFkIxb72QCQ0ru
         c7tcXFFcvMzas/lxEbiA9xTzzddnGyKxU8P9ds0+DgXtSxU694jDKIVjI9u8DDHd2F2h
         eRp5wCSEMRVE19Ll6IJl/iX/EiUeo1uSi9nSzTfxfVM5GDeYzBrAT/PXB5VYZ0BRtJUZ
         dRSCEgiR3BBOAT5vSNrIYSDCenpi4cErE0i1YBttiFg3chTUwRuG7Fu4g62cl/a76Moy
         Ju1Ld43WrpB00Kkp6P41rd0gHUUhVWHg50YBWr8Lje09QUF+zwdq39m8Pc5r0VXbx+MO
         4k/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680271482;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hwge78YkW+s0m/xOn8dQum1bLh51zmAMrgOIhWOIxkg=;
        b=XWt+IUTOqwlIBPEmwDiguFVlKGWE0MwLO6vXAoDsbR2nS3t9l1tXOvbln+ESLwnFDQ
         6l3Ojhd+xTOKjg3++mJuLk9O4nkmqFlwiprYTocC/AEluB/ofzL9ldIB3e/X/3OmWAQ2
         nyk8x2eCAqAs62EEtLzVu2QxZ4DmM8FlxzVqq4+ws4pBBMD36CorO2hfp7FJqUsoQWxK
         w8t98DcBtnMJupFFiECXhAM1zMXwSO1Hx0MkUPIHQH03jMDRONOeN69iyiw4RLxCkxpQ
         wcNCaJGTdrKLRBKEAmTqfcR9dRIBOrkJsAoi7gd8ekBWN03mg4VDQ1O4oAK8PkUPuC/8
         OQ9w==
X-Gm-Message-State: AAQBX9eP8jLLj6YlBWzNXpMMHhhAlzZMCKdnMcWmXB6igVW2sB9VNwsh
	rtX65vW4Z22IeXuZRAHUY4KM3mPXpg7d/rGJMUBJrgcq
X-Google-Smtp-Source: AKy350bY3IXTFDxPbyc2ZUfU+uYSU2UAbfZEqVDIVolj0Msq3x56hr+djx0I53YnYOxhKt+lxwuHfpLpYk4b7yBGcqg=
X-Received: by 2002:a2e:9586:0:b0:2a4:eb14:249b with SMTP id
 w6-20020a2e9586000000b002a4eb14249bmr7097752ljh.7.1680271482507; Fri, 31 Mar
 2023 07:04:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230331104025.1478393-1-ejo@pengutronix.de> <20230331104025.1478393-4-ejo@pengutronix.de>
In-Reply-To: <20230331104025.1478393-4-ejo@pengutronix.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 31 Mar 2023 16:04:31 +0200
Message-ID: <CANNYZj8qDFMKa5HhnK=k7+Le=h_rhmV2Mm_WreLwjfbYWxiUcA@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] barebox: set default BAREBOX_CONFIG for qemu machines
To: Enrico Jorns <ejo@pengutronix.de>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, alexandre.belloni@bootlin.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 14:04:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179446

On Fri, 31 Mar 2023 at 12:40, Enrico Jorns <ejo@pengutronix.de> wrote:
> +# set defaults for oe-core MACHINEs to allow building barebox
> +BAREBOX_CONFIG:qemuarm = "vexpress_defconfig"
> +BAREBOX_CONFIG:qemuarm64 = "qemu_virt64_defconfig"
> +BAREBOX_CONFIG:qemux86-64 = "efi_defconfig"

As all three are different perhaps there could be commentary in the
recipe explaining why that and how they differ? Note that there's also
a qemuall override if there's a single configuration that works for
all qemu targets.

Alex

