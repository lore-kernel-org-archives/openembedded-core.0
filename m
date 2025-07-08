Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E35BEC83F09
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 17:04:37 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.1615.1751994269614975500
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jul 2025 10:04:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DutSkZJS;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: festevam@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-557e20222c3so3199200e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 10:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751994268; x=1752599068; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=namxWRtTo/skMVgknibmxVxxcpnXH0lwGPHwgwQclPk=;
        b=DutSkZJS2cXqD3jnlx1g6urtmUNLC1Buj8mC2ascwkKyf+EAlfjaNd6msRfqhiXhYt
         /aa2YM/wgjsSsVzreGPGQo0Ntp0guI3GkuXFN6vRn4MOMc+BNzg3bzJQW9vGUaXEzPxf
         qbotVvmweOpTrwCxy2kckSpCe+gIqohgvsdWgs9olQOfhP1Jci4ngtcSpjpuzr0lSYT5
         VFwwdIyZzbpSzajoIGflRAUiJHU0UZLE0SLgwUhlOQvBj3Jyap6IZeLbMQ8yc0wxXThl
         6thpQbsfktF5eoFy8q0QR336/MmbyaHVlqreI18L/jtAkkN+c5dgT0yfvVUkH0jzXGAt
         MU6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751994268; x=1752599068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=namxWRtTo/skMVgknibmxVxxcpnXH0lwGPHwgwQclPk=;
        b=HC+FqqeQtsoMQEZE4pDkxuZ4yp3o4VZiPLF1y1SoVArxedZ2CntCF/P8Ug/PR0yQ+E
         QbCZUSv8BLNeqsNYxnUACv5pOtWJ3mrhZDwE+R/TLuRVEk1maGNyQTxNHzMIpYfUWh8Z
         MpdU/DWVpagpR6vcu1+/sOq7QD+LpqqdtUKd8vziPrMldeJtEzmobLihrp/P7rA8+BKu
         ZiHjD4AED0osmnLPaQMuchApbODurJQZZxMpqm/VjV68F2gHo57rlli5y4LkPwGrrDZy
         NvqZpNhkI38+kmrLX3zDZVzUI4Y/dwkQGc6YAoh6Y3zEUmT3Yj9xhV1OcMXQgdtyFhuP
         QMiQ==
X-Gm-Message-State: AOJu0YwcRtQDN0ztmNRqs4uvoxPtVkNB31uLftxwk8OvGrTB6EBDHx/j
	rfH8j+MWfcXsFwChimrohJmVn9Xawr1KIBIH4sm56Fy5swtnD9TUiqyRKZnb3DGDDoBy7uCLO9Y
	ottihq3I37FJFEa1ODLidsvhdhFZjYMk=
X-Gm-Gg: ASbGncv/cv2WSS9J2K4704XCzkDaCgbWud7LYR6mQP7d1tb20XKg1WMgq+NIDLmBx7V
	TJBn8tO7apPhm/93QoJYWsapw0gCVr865N4bbLEm4dxux8b3n5vRBYTFQjMWfSZVb/0qegqHQlY
	bz8tbOQbCLyRHloaC04h9NLfeOeutWJQgXdMsgxwcBX6lJ+rgHL9uW1ogk2bfNYC+Val8kGeYYF
	2c=
X-Google-Smtp-Source: AGHT+IF/G3TMztc06uqq25YdJoPVBxBsgRXxPZtbvT92vAGTmx5rRUmwDGXjjVzBS411pvqyBfpu2B0IF3bi0z38jg8=
X-Received: by 2002:a05:6512:39c8:b0:553:20f2:2e79 with SMTP id
 2adb3069b0e04-558f7a5895cmr189010e87.13.1751994266682; Tue, 08 Jul 2025
 10:04:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250708012959.77522-1-festevam@gmail.com> <DB6OGLNWBEVN.2V2F24LHIZ4C4@bootlin.com>
In-Reply-To: <DB6OGLNWBEVN.2V2F24LHIZ4C4@bootlin.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 8 Jul 2025 14:04:15 -0300
X-Gm-Features: Ac12FXy3mtqD1y6uRUMeWPN5dkmCNluzoSDXxpbO3m660kjksxareWzfGGDHGwQ
Message-ID: <CAOMZO5BJBc0E0EfejEPmVdGBZiQrrvRWsHhy0Bxgi+jx6WiYRQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] u-boot: upgrade 2025.04 -> 2025.07
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Quentin Schulz <quentin.schulz@cherry.de>, Tom Rini <trini@konsulko.com>, 
	adrian.freihofer@siemens.com, Marek Vasut <marek.vasut@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 17:04:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220051

Hi Mathieu,

On Tue, Jul 8, 2025 at 9:37=E2=80=AFAM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> On Tue Jul 8, 2025 at 3:29 AM CEST, Fabio Estevam via lists.openembedded.=
org wrote:
> > Upgrade to U-Boot 2025.07.
> >
> > Signed-off-by: Fabio Estevam <festevam@gmail.com>
> > ---
>
> Hi Fabio,
>
> Thanks for your patch.
>
> It looks like this is breaking selftests on the autobuilder:
>
> 2025-07-08 07:43:52,116 - oe-selftest - INFO - fitimage.UBootFitImageTest=
s.test_sign_cascaded_uboot_fit_image (subunit.RemotedTestCase)
> 2025-07-08 07:43:52,118 - oe-selftest - INFO -  ... FAIL
> ...
> ERROR: u-boot-1_2025.07-r0 do_compile: oe_runmake failed
> ...
> | arm-poky-linux-gnueabi-ld.bfd: cannot find arch/arm/lib/lib.a: No such =
file or directory
>
>
> Both on debian and armhost:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/1923
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/2077
>
> Can you have a look at these failures please?

Thanks for the report.

I am adding some folks on CC in case they have some ideas.

