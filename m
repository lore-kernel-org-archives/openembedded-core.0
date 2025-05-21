Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEC6DC54E71
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 14:53:02 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.784.1747839172427771240
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 07:52:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=tD/1xREf;
 spf=pass (domain: linaro.org, ip: 209.85.208.176, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30bf7d0c15eso65157171fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 07:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747839170; x=1748443970; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s3jhb+2gT6ppmci2PviwXy+3rwJ/Ode234C0gsueCHY=;
        b=tD/1xREfUryzdARAeZpUISnm4a3A6y/dIRCaP6R1cLM3Lua6DoRbwL247xFbOYyB+J
         0vhE7tWwdw7wwg7jsY9LVbxbpT9AJVTaNvla4LVh32wn5XMrW1toLNvP/mfTMj+jSrPT
         7ybgLxfze2amCdl2gVPBG1zJTKHKhXOW0HtIr8Vl57rVt2lCTug5YQy8oxm8Sf+L2Pqf
         5DL9HsXoJwBFpv72f+XSwNoCckILI/TtjkILmQduRPYWg2t3VaD4JydyLnaqbkqorzJd
         zN+CogbGdhHvlIEQurNgRzk+WKcTmXXWZPilboG/kaDwTmCFnEzaJ+MJeeTjSWl2tG6R
         JJtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747839170; x=1748443970;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s3jhb+2gT6ppmci2PviwXy+3rwJ/Ode234C0gsueCHY=;
        b=f6NfCRge8KPZJnMYERxUBp91nPUQl33MPKnNBpNMpyubVvJlVjj6fjteM+vJ4fhESB
         d5rgzy3dhUDPtK/aPRLnqKw5e6KFSR1xM+cvJztxxfG3qdNlrioCnvIkz2Pq9dnR6wBO
         US20c0mRPvvZXhjUYfVpjj0K8G5Yx0uHDi9Su+ua4ExYlzY0aloFxOSUCKn1/smdc0lw
         GyCElPtfs9m+S0nKIiMdbZKiUev+5bgZe5lfmUF1JTCTblS/uF19obVbw58jHGiZY0S/
         aEF5rNVODBbUi2zwdwy5FaMJyW0uzyUPDR/2p16CLODg9T4DdpgNwFVTt/AujZvwaCXC
         pP4w==
X-Gm-Message-State: AOJu0YwM91w1B+GyIAFrRkoqY4T3xplsE852B4XdjTHPR3zDYKKT2ihd
	yASfFbezJZmL4EVi39cCm4WFM+iMCv0BEcCMRG0+Wpwe2FrshOrTc6hNuj700XB3+uA=
X-Gm-Gg: ASbGnct0D2ar+Jno1SFnFThI0n047H+9/aEReimAUJ19bm180hwpGvWmDA0k/NnoXT+
	Fke6WcCrrtAhpcxjvIUpOWobwui7T2pjodlKZr3o5kmLOmBcDDaLsPyPWvmbxRu5G6Qbr7o3Sxa
	eLADVL72Ck56aHomPP73VsACdnh/YTC+TRPC5Icaz/kKUCuWVmUw3H47d9aNuLQnOxH5Z3/GWUr
	GtHsMDO30wPLLjbqxKDR1qN4TwWXGAn0V/p9zV3AokldKSOHBu89OAxgTrVgXvlJ8JAk1pthwn0
	IUXmI0MfiuB5gPr0Yu/ICglU43hQdCWEtR8Sl44DRpxWGq7wDLt30tw1ykRAyyF9tJp8WP0nnw7
	O2hvtPs1PeGA1Jg==
X-Google-Smtp-Source: AGHT+IG05qliZyBzrGJDkPawF69wVXh2WA+gwz5MDmhqzDGdAbMBwR3CG5kZWnDMxX58cVHuvhRyeQ==
X-Received: by 2002:a05:651c:40ce:b0:328:12e1:5528 with SMTP id 38308e7fff4ca-32812e155cfmr32984901fa.27.1747839169121;
        Wed, 21 May 2025 07:52:49 -0700 (PDT)
Received: from nuoska (85-76-8-228-nat.elisa-mobile.fi. [85.76.8.228])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084b53e7sm28845651fa.22.2025.05.21.07.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 07:52:48 -0700 (PDT)
Date: Wed, 21 May 2025 15:52:44 +0100
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: openembedded-core@lists.openembedded.org,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: Re: [OE-core] [PATCH] u-boot: disable CONFIG_BLOBLIST on aarch64
Message-ID: <aC3ovAPrRnwhogik@nuoska>
References: <20250521135136.166390-1-mikko.rapeli@linaro.org>
 <b85c6a6c-250c-4b87-b9cc-92ed5fd51d19@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b85c6a6c-250c-4b87-b9cc-92ed5fd51d19@cherry.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 14:53:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217034

Hi,

On Wed, May 21, 2025 at 04:14:04PM +0200, Quentin Schulz wrote:
> Hi Mikko,
> 
> On 5/21/25 3:51 PM, Mikko Rapeli via lists.openembedded.org wrote:
> > Booting on qemu with kvm is currently hanging on aarch64.
> > Root cause is in u-boot and CONFIG_BLOBLIST can be disabled
> > as a workaround.
> > 
> > To reproduce, build on kvm enabled host where "kvm-ok"
> > succeeds. For example genericarm64 machine and core-image-base
> > should then boot with:
> > 
> > $ runqemu slirp nographic novga snapshot kvm
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
> > Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> >   meta/recipes-bsp/u-boot/files/disable-CONFIG_BLOBLIST.cfg | 1 +
> >   meta/recipes-bsp/u-boot/u-boot-common.inc                 | 3 +++
> >   2 files changed, 4 insertions(+)
> >   create mode 100644 meta/recipes-bsp/u-boot/files/disable-CONFIG_BLOBLIST.cfg
> > 
> > diff --git a/meta/recipes-bsp/u-boot/files/disable-CONFIG_BLOBLIST.cfg b/meta/recipes-bsp/u-boot/files/disable-CONFIG_BLOBLIST.cfg
> > new file mode 100644
> > index 0000000000..d01d3d12d8
> > --- /dev/null
> > +++ b/meta/recipes-bsp/u-boot/files/disable-CONFIG_BLOBLIST.cfg
> > @@ -0,0 +1 @@
> > +# CONFIG_BLOBLIST is not set
> > diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
> > index fd1eab5cdd..d8c70da782 100644
> > --- a/meta/recipes-bsp/u-boot/u-boot-common.inc
> > +++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
> > @@ -16,6 +16,9 @@ SRCREV = "34820924edbc4ec7803eb89d9852f4b870fa760a"
> >   SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master;tag=v${PV}"
> > +# workaround for aarch64 kvm qemu boot regression
> > +SRC_URI:append:aarch64 = " file://disable-CONFIG_BLOBLIST.cfg"
> > +
> 
> Can you make this qemu specific? I don't think we want every aarch64 board
> to have bloblist disabled?

True, at least qemu and genericarm64 need this. Or should this be tied
to some machine/distro feature or something else?

I guess KVM support is not a machine feature atm.

Cheers,

-Mikko

