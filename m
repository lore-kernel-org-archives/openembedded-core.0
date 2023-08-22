Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9162EE4993
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 14:49:38 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.9867.1692715776728867444
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Aug 2023 07:49:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XK9vB/wt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-317716a4622so4134305f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 07:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1692715775; x=1693320575;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Y30VlcoGgevzoSz9fgU/1j9jdDa6dzukTGXjwI9AnmA=;
        b=XK9vB/wtkf8Yxg50DkBGOmgH0PlR/IsZYMkRAfrQpiWfyEE+98y0DoCV/nwtJglpvp
         eOYh6hQI+qmr05ZUsly/nS60OxVf21hq0BGP+VojESgqtk8KfUCptW9yZ5/lgdDlMZ92
         IUrvJ2buVHy0f0purhbO/IwqsDGS5Li76G32s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692715775; x=1693320575;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y30VlcoGgevzoSz9fgU/1j9jdDa6dzukTGXjwI9AnmA=;
        b=hphMZsc1MzJ5xrFljPL0Yo76vC3u0gY+IDZpj6baoGeVZUegNnokZlQwpUqXsfCol0
         xbBOKtKL8ZIfuyK/XjtCtvR/ztamM7uPoGwjNbf0swPC1ktOYTnokCsBbC7FTMuS6Aj/
         byf812iNmtqJWu4r5qgirLC3YK5bxzqaGpEcM/B2tm40jmwFVZRxN5YKAgld/97wmcFe
         AY9+RMjT+MwKckuQ2s6i88itJ0KxlEDM6WLdZAxt4lqO+lVL0EqiEhtBbvYvndsVn9OF
         Dc8YUooV+kUoy11d9d3RHDDRsQJ3Etsog/jsBAgSVgDVKdUY/R7Z2MpEkbDHAY9tCX4T
         p3RA==
X-Gm-Message-State: AOJu0Yx5ZAq0lLm+i2knv9QOouiUoAxBpOE01FOBrbZIKLpzLgGodMpq
	tLJwjlUcFvSEmNAoyTDK/79K1Q==
X-Google-Smtp-Source: AGHT+IFDxfwu62+0CCTifzPAbeGTpiUMO0SI/cgetIPIva7umwk8iV0h0qW6rnACK6sTqRLbYlzBxw==
X-Received: by 2002:a05:6000:505:b0:317:650e:9030 with SMTP id a5-20020a056000050500b00317650e9030mr7915156wrf.57.1692715774807;
        Tue, 22 Aug 2023 07:49:34 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:eb4c:c27c:35e6:14a1? ([2001:8b0:aba:5f3c:eb4c:c27c:35e6:14a1])
        by smtp.gmail.com with ESMTPSA id r15-20020a056000014f00b0031ad5a54bedsm16239288wrx.9.2023.08.22.07.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 07:49:34 -0700 (PDT)
Message-ID: <821cfadd74ab67f97807e0c17e28e67f7b9b3bab.camel@linuxfoundation.org>
Subject: Re: [OE-core] Dilemma on changes - merge or not to merge (e.g. 6.4)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Rasmus Villemoes
	 <rasmus.villemoes@prevas.dk>, openembedded-core
	 <openembedded-core@lists.openembedded.org>, Bruce Ashfield
	 <bruce.ashfield@gmail.com>
Date: Tue, 22 Aug 2023 15:49:33 +0100
In-Reply-To: <177DB4530EBE3FA3.24073@lists.openembedded.org>
References: 
	<1b3bb1c747644f83156f6269de2c502660c18466.camel@linuxfoundation.org>
	 <ZNt45UVb0Ps/kKLM@windriver.com>
	 <15f7e67b-afd7-7504-aa23-41a4c3cb62a1@prevas.dk>
	 <ZN7j425iXGBPbS5i@windriver.com>
	 <177DAAB2E4C3384A.4797@lists.openembedded.org>
	 <177DAFEBFB5EB0D2.24073@lists.openembedded.org>
	 <d7982e9549e8e8042dfdfdaa4f3173684aa726bb.camel@linuxfoundation.org>
	 <ZOSoIXLG7vH/GC1l@nuoska> <177DB4530EBE3FA3.24073@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 14:49:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186510

03b2c470a136a83a9961a2a855cde59498361598=C2=A0shows as broken

deda0761dc6161f03278da4679d96d4727992e91 doesn't seem to break

but this doesn't seem to make any sense as the changes are:

kernel-source$ git diff 03b2c470a136a83a9961a2a855cde59498361598 deda0761dc=
6161f03278da4679d96d4727992e91 | diffstat
 arch/arm/boot/dts/iwg20d-q7-common.dtsi               |    2 +-
 arch/arm/boot/dts/meson8.dtsi                         |    4 ++--
 arch/arm/boot/dts/qcom-apq8074-dragonboard.dts        |    4 ----
 arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi    |    2 +-
 arch/arm/mach-ep93xx/timer-ep93xx.c                   |    3 +--
 arch/arm/mach-omap2/board-generic.c                   |    1 -
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi        |    4 ----
 arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts          |    4 ++--
 arch/arm64/boot/dts/qcom/pm7250b.dtsi                 |    1 -
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi              |    3 ++-
 arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts |   28 +++++++++++++=
+--------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c            |    2 +-
 drivers/infiniband/hw/hfi1/ipoib_tx.c                 |    4 ++--
 drivers/infiniband/hw/hfi1/mmu_rb.c                   |  101 +++++++++++++=
+++++++++++++++++++++++++--------------------------------------------------=
-------------
 drivers/infiniband/hw/hfi1/mmu_rb.h                   |    3 ---
 drivers/infiniband/hw/hfi1/sdma.c                     |   23 +++++--------=
----------
 drivers/infiniband/hw/hfi1/sdma.h                     |   47 +++++++++++++=
++--------------------------------
 drivers/infiniband/hw/hfi1/sdma_txreq.h               |    2 --
 drivers/infiniband/hw/hfi1/user_sdma.c                |  137 +++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++------=
-------------------------------------------------
 drivers/infiniband/hw/hfi1/user_sdma.h                |    1 +
 drivers/infiniband/hw/hfi1/vnic_sdma.c                |    4 ++--
 drivers/infiniband/hw/hns/hns_roce_hem.c              |    7 +++----
 drivers/infiniband/hw/irdma/uk.c                      |   10 ++++------
 drivers/input/misc/pm8941-pwrkey.c                    |   19 ++++---------=
------
 drivers/memory/brcmstb_dpfe.c                         |    4 +---
 drivers/soc/fsl/qe/Kconfig                            |    1 -
 drivers/video/fbdev/omap/lcd_mipid.c                  |    6 +-----
 sound/soc/codecs/es8316.c                             |   23 +++++++++----=
----------
 28 files changed, 191 insertions(+), 259 deletions(-)

03b2c470a136a83a9961a2a855cde59498361598 Input: pm8941-powerkey - fix debou=
nce on gen2+ PMICs
421ce97657a84b81ce2cb915e75037e1a356736a arm64: dts: ti: k3-j7200: Fix phys=
ical address of pin
3b4c21804076e461a6453ee4d09872172336aa1d fbdev: omapfb: lcd_mipid: Fix an e=
rror handling path in mipid_spi_probe()
52b04ac85f5f4b485bf658101e464143225e68f9 drm/msm/dpu: set DSC flush bit cor=
rectly at MDP CTL flush register
6878bdd7571827babc1c4c1ff66ea1affe951020 arm64: dts: renesas: ulcb-kf: Remo=
ve flow control for SCIF1
5d14292dba9554881a137039c048a67ddf321395 ARM: dts: iwg20d-q7-common: Fix ba=
cklight pwm specifier
766e0b6f4c9649f126e59c06f100b8581d0773b8 RDMA/hns: Fix hns_roce_table_get r=
eturn value
b99395ab605fb0570d1e62c9459425ac6fc58d46 IB/hfi1: Fix wrong mmu_node used f=
or user SDMA packet after invalidate
ebec507398e11b1c25ce9fb05fb509878233051c RDMA/irdma: avoid fortify-string w=
arning in irdma_clr_wqes
750f0a302a10dc2327a6656860a22b7da7251cea soc/fsl/qe: fix usb.c build errors
b2194d7dfc95a404990da73ebd394f6f6946a4a0 ARM: dts: meson8: correct uart_B a=
nd uart_C clock references
863054be8d4d2c9b38985371166a37c0e14111e1 ASoC: es8316: Do not set rate cons=
traints for unsupported MCLKs
3b575d93020f20f6a711efd8c69bfed26837d694 ASoC: es8316: Increment max value =
for ALC Capture Target Volume control
c02f27c2950abfed58bd8aa6bf50e79d9cc1fc77 ARM: dts: qcom: apq8074-dragonboar=
d: Set DMA as remotely controlled
9f79e638d45100dad43c56ad9b47eaff1b98fe9a memory: brcmstb_dpfe: fix testing =
array offset after use
09722ac9f1e557ea65098202d0b18336c3f04420 ARM: dts: stm32: Shorten the AV96 =
HDMI sound card name
666be7fef4d39d67c041460e29ddf2b875101133 arm64: dts: mediatek: mt8183: Add =
mediatek,broken-save-restore-fw to kukui
1bdb9751b4c64f5709cb3608fd93a709c4e9b2e1 arm64: dts: qcom: apq8096: fix fix=
ed regulator name property
75c019119ebcc919e717fbce5552c2a0908405cf arm64: dts: qcom: pm7250b: add mis=
sing spmi-vadc include
c63997426da6f24f33ae6caf2423170d5bb80ebb ARM: omap2: fix missing tick_broad=
cast() prototype
e91ffbd6553348cdd3d04b263f8207d919681fac ARM: ep93xx: fix missing-prototype=
 warnings

and I can't see how any of that is compiled into qemuppc. Am I missing some=
thing?

Cheers,

Richard

