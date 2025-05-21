Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9A64C54E71
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 15:04:02 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.1332.1747839834540861369
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 08:03:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=tKK39T33;
 spf=pass (domain: linaro.org, ip: 209.85.208.175, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3290ae9b011so42120891fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 08:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747839833; x=1748444633; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YmXgCHCSYatHU3vE45pav0TY+s6X6xN1+39nlrr95hk=;
        b=tKK39T33sEz3/2n22l4PSS4oU8V4lnBYIt9rI+N8AVo63ATgI0armHjfMrm8BfiN4T
         QRd2Q0G0H8guaEzp+ZvePb2MNKpDh1669Ju48cvaOLL2TEcrrk7x5YE7bcWl67CCpw2y
         BLfZlpNg6KEJXxQQJMSFS2d/nHZY1//wXi/LrJ0wC3iQNE9twuHwOt/2+c72oDexN8b+
         IKIhQrOlSTGb51kwxBh/WikqAiy28ctBM3FDl64iudIqN9mgb0bxFIdAjeVP5wHv8AOT
         +5sibxzmatTKjqn3izrqbYxu0crBAfFp/MCiHpUkyADVMkcgF4vRQo76QcSIdLQN05LE
         zTyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747839833; x=1748444633;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YmXgCHCSYatHU3vE45pav0TY+s6X6xN1+39nlrr95hk=;
        b=p42GYY8f6Thc/0NlPnPOPllAi4A7GqaEIlzihPX7k9FVfsBikVUePDiW793vQEno2i
         akWD8wlizirPn1cwMRInHrkFZZgW7bUtNfT44OnKQg49w2o5sLcyCJOB6sn2ImD52pYw
         DtpREbqy4IqpB4nChhdTXjJHibz1oVtRkOrjPAOg9S7fteZbJBCQV1LmNSnAHB22DMWw
         PpZ6Tc15sQDsJG3H8bQ0kxAbkGBkb4U9RgVIsVXAIMalSi5aYArD+U/oftcIZwXUFk8M
         uIif6Veq8lhTLSwXe//TSUZtWTlxVJFw/GN3d620iFg21JtNjl+DzCvj8D8zxhCorasI
         6jxw==
X-Gm-Message-State: AOJu0Yy2zVs9mqr6BrLO9n8WfgsHJvArtW1TfKw7YJZbbta/Vh3GH3Pz
	+6DAzW6bqE9feX0yLffNGs7n8APErYOztx3RIUbg+rx+lFCTlL0bKZcaGTLm0Up4GpY=
X-Gm-Gg: ASbGncuVHFqHegp2PMEf/upgK+pxMNi3ktEKK7TiJ/sPEM7WMzROAW00VJztll2iTJB
	loz+pnyqhCCp8Ok3GVWKggrqJgCDacebPu6SHp8ElUGk0kE4HU9aoab2iJwuPw5f+HujsJf9iol
	eQKGAjZJUliiMbFVHkwcEgjc+MsL3lWieFxWc6Zo1t+LvOzwsDC4/4FvsrAQ+qlFTOJ5xLvSFlC
	EzcEVz/PZ7E/J8zOPk01kjSSjPBPyHuHK54N/PL8qffhgYoISpG1ST9axQxyXsDEjXTH97NrJfS
	FXa/9oNIYSyIwqok3FnX9sfDSi5hIV+PPb5YzLA7w5idZv3wWSD3lvmZHoIBMBDdfeZKzrtPCwh
	Upf8=
X-Google-Smtp-Source: AGHT+IEa04DC/cYzvEvbKAVykGBtZPziVnrBIV1QpS7QRTJocmRcZgyhJ+JTT/NlJing+SoKh85Kmg==
X-Received: by 2002:a2e:be1a:0:b0:326:d4e5:5bcc with SMTP id 38308e7fff4ca-3280977fdb6mr94281431fa.33.1747839832519;
        Wed, 21 May 2025 08:03:52 -0700 (PDT)
Received: from nuoska (85-76-8-228-nat.elisa-mobile.fi. [85.76.8.228])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085b8c24sm28718951fa.82.2025.05.21.08.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 08:03:52 -0700 (PDT)
Date: Wed, 21 May 2025 16:03:47 +0100
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: openembedded-core@lists.openembedded.org,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: Re: [OE-core] [PATCH] u-boot: disable CONFIG_BLOBLIST on aarch64
Message-ID: <aC3rU-ZISnOgfrOB@nuoska>
References: <20250521135136.166390-1-mikko.rapeli@linaro.org>
 <b85c6a6c-250c-4b87-b9cc-92ed5fd51d19@cherry.de>
 <aC3ovAPrRnwhogik@nuoska>
 <fae0ed00-df42-4abe-bb28-8722595825fd@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fae0ed00-df42-4abe-bb28-8722595825fd@cherry.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 15:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217045

Hi,

On Wed, May 21, 2025 at 04:58:16PM +0200, Quentin Schulz wrote:
> On 5/21/25 4:52 PM, Mikko Rapeli wrote:
> > On Wed, May 21, 2025 at 04:14:04PM +0200, Quentin Schulz wrote:
> > > On 5/21/25 3:51 PM, Mikko Rapeli via lists.openembedded.org wrote:
> > > > Booting on qemu with kvm is currently hanging on aarch64.
> > > > Root cause is in u-boot and CONFIG_BLOBLIST can be disabled
> > > > as a workaround.
> > > > 
> > > > To reproduce, build on kvm enabled host where "kvm-ok"
> > > > succeeds. For example genericarm64 machine and core-image-base
> > > > should then boot with:
> > > > 
> > > > $ runqemu slirp nographic novga snapshot kvm
> > > > 
> > > > Without this config workaround, the boot hangs without
> > > > any messages in qemu output but ctrl-a-c to qemu console
> > > > can shutdown the emulated machine.
> > > > 
> > > > This seems to have regressed after u-boot 2025.04 update.
> > > > KVM boot can be detected from speed, for example genericarm64
> > > > boots in 550 ms with KVM and without in over 5 seconds.
> > > > 
> > > > Fixes: [YOCTO #15872]
> > > > 
> > > > Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> > > > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > > ---
> > > >    meta/recipes-bsp/u-boot/files/disable-CONFIG_BLOBLIST.cfg | 1 +
> > > >    meta/recipes-bsp/u-boot/u-boot-common.inc                 | 3 +++
> > > >    2 files changed, 4 insertions(+)
> > > >    create mode 100644 meta/recipes-bsp/u-boot/files/disable-CONFIG_BLOBLIST.cfg
> > > > 
> > > > diff --git a/meta/recipes-bsp/u-boot/files/disable-CONFIG_BLOBLIST.cfg b/meta/recipes-bsp/u-boot/files/disable-CONFIG_BLOBLIST.cfg
> > > > new file mode 100644
> > > > index 0000000000..d01d3d12d8
> > > > --- /dev/null
> > > > +++ b/meta/recipes-bsp/u-boot/files/disable-CONFIG_BLOBLIST.cfg
> > > > @@ -0,0 +1 @@
> > > > +# CONFIG_BLOBLIST is not set
> > > > diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
> > > > index fd1eab5cdd..d8c70da782 100644
> > > > --- a/meta/recipes-bsp/u-boot/u-boot-common.inc
> > > > +++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
> > > > @@ -16,6 +16,9 @@ SRCREV = "34820924edbc4ec7803eb89d9852f4b870fa760a"
> > > >    SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master;tag=v${PV}"
> > > > +# workaround for aarch64 kvm qemu boot regression
> > > > +SRC_URI:append:aarch64 = " file://disable-CONFIG_BLOBLIST.cfg"
> > > > +
> > > 
> > > Can you make this qemu specific? I don't think we want every aarch64 board
> > > to have bloblist disabled?
> > 
> > True, at least qemu and genericarm64 need this. Or should this be tied
> > to some machine/distro feature or something else?
> > 
> > I guess KVM support is not a machine feature atm.
> > 
> 
> I assume this is about running U-Boot from within KVM? Not sure there are
> many machines operating within that scenario?

Yes, for testing several aspects of target machine, booting under qemu
is used and then the 10x performance boost on aarch64 host machines with KVM
support is quite important. But overall a minor thing, I guess.

> Also, I assume this is going to be a short-lived work-around with a proper
> fix in U-Boot? I'm not sure we need to go through the hassle of adding a
> machine feature (and documenting it and all) if it's unused "soon". But I
> also understand that short-lived work-arounds also sometimes stay for a very
> long time :)

Yes, exactly :)

The use case is such simple one. Hope we can figure out how to add a
test for this. And run many of the selftests on native aarch64 hosts
with kvm enabled to get the perf boost.

Cheers,

-Mikko

