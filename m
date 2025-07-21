Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DC54C83F25
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 12:34:33 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.39124.1753101264461361456
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jul 2025 05:34:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CabgEvwp;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: festevam@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5551a770828so4701384e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 05:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753101262; x=1753706062; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDtxBRnM4/p58/K8ZzK1YLbo3KN7S3A7LqMKQzS8gu4=;
        b=CabgEvwppPuswtW2HorzRAYpZyzTK1r2wjVzugi73I2oFH/1fwu8nJjKhSK1RmXYCC
         8VbERcUmaT4bcjKRIdRUwy+OpgyxbYbQbWXNMXNZbkU5+P3RxoqtmG6fGG3efgKEQS3R
         8zZCe+ghoKTQCvLtYQ408TP8s2eRbJJgh9oDubnrfO9n15fGTW66myWP/UJFF78Labuc
         JmFIN1Q3kvsdKW8Hdfl8hDQlXkZ7LVEzGtKFUCHRsyDTK4CKl6LKE/ikpPEqv4wZQ6nr
         R/oSGZfZXAvY/QZjmJS9u0XXaM+FSQyPdN3Yp1lZUC5abbm9j88IH4/9BKqluXKGoGAt
         mVqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753101262; x=1753706062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KDtxBRnM4/p58/K8ZzK1YLbo3KN7S3A7LqMKQzS8gu4=;
        b=tglsr2Qud+5ovWjaYlsZ5ybJ5J47ASuBZ5r6FYDI31Wbg4WNHpZrSHMi+TMmQ1kz1V
         rIXZdi8dYmJsuS5xGnq0SUon6Hj/PmTvv3I2DDWsVq8khxUQu4weLG9jKUo2q8Wi/Uuv
         4grUfTfe2WjddJaJn9fLSIBeHU4sOxXUyjBPmsZBgF92GNQISQy63Y6onZvyxFGTxbeB
         ofyRM7kwth6CpGDQ/ZWVkuY+bL7Tp57F4sLe2bR9+E6pPxhIK7emb+R1bTv7HPQDIIoQ
         jGssPP5V2EcXUQqvuctLuNZR53aCw1CybZksJrqCCpmwd0z7p4P8n+C7l4wceR0H3Q3Y
         BMIA==
X-Forwarded-Encrypted: i=1; AJvYcCXeICLaeira5AosPvdHNmdvmhI+w8eQcEhZYQjWqEw4qHkVOB5ImCMEfRxdorF51wdpuSaeph94lJnrN3xkgfgSwg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwfTIETBYND66oqNT0/gUlf8+YMqI7gPlm3DEIsrehKvstA003r
	0FUvd0qIhFULmHlAwRT1AgUD2QRdAWB2yTnToNSdbk6LSnr6E0l6ts04mi8GDZkpXyEgEpWbvqW
	0JS1rQStEb6ryF104rRrfPOAI3oBG1oA=
X-Gm-Gg: ASbGncsP41YOfxUo3YNabQMWfvJzrY6XAnFdpXDupACVN+4tAfY7fRYClL3x/TFOYiN
	EVzfxwOYkfDxGyvz9Puqem5WfsaP7/g0I+4mdiLAj6eYXhffKNh2mA+xUblxrj5LFSq07hSznCL
	KdDz29N94oJpCPl/tuCS/Fk2nRILzK72IKKZkXxUyS4XqqFnsANKDwfS6AbkeIQxK5QbZYo0goI
	ngnzTavilw5ScY18e30mSt+S/cr2ZYp/oVw3rE=
X-Google-Smtp-Source: AGHT+IFItS0Xpdzl8Lz9SBYWb57A0cbEHDP68ben55pxPlvo7XbRfqTWPBcfhLEBk0WnX/g9X+3kMxck1dkauTm+pWQ=
X-Received: by 2002:a05:6512:3e14:b0:54f:bdfe:ece5 with SMTP id
 2adb3069b0e04-55a23315c0bmr6954287e87.14.1753101262093; Mon, 21 Jul 2025
 05:34:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250718090123.420399-1-mikko.rapeli@linaro.org> <DBFTMMJ8WHKL.362BOXS9ZHA6Z@bootlin.com>
In-Reply-To: <DBFTMMJ8WHKL.362BOXS9ZHA6Z@bootlin.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 21 Jul 2025 09:34:10 -0300
X-Gm-Features: Ac12FXxQem9cz1SLFE7hTOrpx0VP-giRbzJPd3Bs_mC_VKiycBjg9_4MQlkT8qM
Message-ID: <CAOMZO5CaSgkYjTVk2WcQCoWvRNNGkXRV2bp9BdAU=mkQR8Rg+w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] u-boot: upgrade 2025.04 -> 2025.07
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Tom Rini <trini@konsulko.com>
Cc: mikko.rapeli@linaro.org, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 12:34:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220684

Adding Tom.

On Sat, Jul 19, 2025 at 3:34=E2=80=AFAM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> On Fri Jul 18, 2025 at 11:01 AM CEST, Mikko Rapeli via lists.openembedded=
.org wrote:
> > From: Fabio Estevam <festevam@gmail.com>
> >
> > Upgrade to U-Boot 2025.07. Added patches for build race conditions.
> > Removed qemu KVM USB workaround since issue is fixed upstream.
> >
> > Signed-off-by: Fabio Estevam <festevam@gmail.com>
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
>
> Hi Mikko,
>
> Much better, but we have another test failure now, specifically on ARM
> host:
>
> QEMU 10.0.2 monitor - type 'help' for more information
> ...
> Loading Environment from Flash... *** Warning - bad CRC, using default en=
vironment
>
> In:    serial,usbkbd
> Out:   serial,vidconsole
> Err:   serial,vidconsole
> Register 8001040 NbrPorts 8
> Starting the controller
> "Synchronous Abort" handler, esr 0x96000010, far 0x10088040
> elr: 000000000005a360 lr : 000000000005a344 (reloc)
> elr: 000000004f6fc360 lr : 000000004f6fc344
> x0 : 0000000010088040 x1 : 0000000000000001
> x2 : 0000000000000000 x3 : 0000000000003e80
> x4 : 0000000000000038 x5 : 000000004e6708e2
> x6 : 0000000000000000 x7 : 0000000000000000
> x8 : 0000000000000000 x9 : 000000000001869f
> x10: 000000000000000d x11: 0000000000000006
> x12: 000000004e561af8 x13: 000000004e561dd0
> x14: 0000000000000002 x15: 0000000000000000
> x16: 000000004f6ee774 x17: 0000000000000000
> x18: 000000004e661dd0 x19: 000000004e670e40
> x20: 0000000000000000 x21: 0000000010088040
> x22: 0000000010088000 x23: 0000000000000000
> x24: 0000000000000000 x25: 0000000000000000
> x26: 0000000000000000 x27: 0000000000000000
> x28: 00000000
> ...
> 2025-07-18 23:17:34,434 - oe-selftest - INFO - ERROR: uboot.UBootTest.tes=
t_boot_uboot_kvm_to_full_target (subunit.RemotedTestCase)
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/2140
>
> Can you look into that error?
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

