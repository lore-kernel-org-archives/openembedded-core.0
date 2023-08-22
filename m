Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0A29EE49A5
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 22:01:46 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.9026.1692741698619336467
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Aug 2023 15:01:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=R64DKrg6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-31969580797so4435009f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 15:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1692741697; x=1693346497;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Cf6VWLfQB+aYbj6r55hujqk0iRnfewwFo5CH2EODXTU=;
        b=R64DKrg6NdsO4mTXQv8EatAskqEOJF6fGZ6OQqGpCiOEMq1dpNlMnmnnrHcV1UhrcH
         3HX6YWteuwkTYlIgRBMiOo1MdomEF5dbO5EjQItIlfw0xAcFifwUU6N2YjY70spEkxjz
         UMtUD4cxP0i3qdWxKEcG2Zu/U8pGUICuZXc7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692741697; x=1693346497;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cf6VWLfQB+aYbj6r55hujqk0iRnfewwFo5CH2EODXTU=;
        b=SiizPXkXUeM5cxUMf5Dwz6Tz1LhCqnenAppHdGcTCfOMnS1wa3u7c3YH+f5fYCdFVR
         Rc0HW6FLi4HqKXty4ScQGlsK4Aof/hWH+SU675HGCYfLtcJ6u+h3c90ntsb50/KEBotJ
         CYiD3CptGuuEpiBNAPrPsgNc6OHW9o3hNSEK+wi4OksfRA6ss+yb+LP9eRWntuCo7+E/
         0RpduhRMIi5TVTZd9nhNiGRsbRbkyn0L14Z0Vw2P3wOBGJmJoEoRKO+fQW5dicAKTGMS
         H1DuaKRb+ERGwEpDgHu0TWYVyuZXW+zR2o3o0X5C98Uo2SSIyGmDKky5853RUD+wk7Ub
         R7Xw==
X-Gm-Message-State: AOJu0YxmQSkjjp5a/nmuMALDPYd3c3cIb3J9lUYitqZwuwUuCR6zoDW7
	w4vu3IYqu2YtjrKGFqdsAVrBkg==
X-Google-Smtp-Source: AGHT+IEocSuPCI6yAWuFRuhyjd89uyc/hMdUcA7bUWekgeX4DHm70nWTX0V/Arl8HXGjECGLtycG0A==
X-Received: by 2002:a5d:68ca:0:b0:319:6ae0:cae5 with SMTP id p10-20020a5d68ca000000b003196ae0cae5mr6848543wrw.70.1692741697056;
        Tue, 22 Aug 2023 15:01:37 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ccd5:afa9:3ef0:b0af? ([2001:8b0:aba:5f3c:ccd5:afa9:3ef0:b0af])
        by smtp.gmail.com with ESMTPSA id r15-20020a056000014f00b0031ad5a54bedsm17120185wrx.9.2023.08.22.15.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 15:01:36 -0700 (PDT)
Message-ID: <0628d485be443572a56e5a402007ce0691edd66f.camel@linuxfoundation.org>
Subject: Re: [OE-core] Dilemma on changes - merge or not to merge (e.g. 6.4)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Rasmus Villemoes
	 <rasmus.villemoes@prevas.dk>, openembedded-core
	 <openembedded-core@lists.openembedded.org>, Bruce Ashfield
	 <bruce.ashfield@gmail.com>
Date: Tue, 22 Aug 2023 23:01:35 +0100
In-Reply-To: <177DD0B30D8FEDF8.27837@lists.openembedded.org>
References: 
	<1b3bb1c747644f83156f6269de2c502660c18466.camel@linuxfoundation.org>
	 <ZNt45UVb0Ps/kKLM@windriver.com>
	 <15f7e67b-afd7-7504-aa23-41a4c3cb62a1@prevas.dk>
	 <ZN7j425iXGBPbS5i@windriver.com>
	 <177DAAB2E4C3384A.4797@lists.openembedded.org>
	 <177DAFEBFB5EB0D2.24073@lists.openembedded.org>
	 <d7982e9549e8e8042dfdfdaa4f3173684aa726bb.camel@linuxfoundation.org>
	 <ZOSoIXLG7vH/GC1l@nuoska> <177DB4530EBE3FA3.24073@lists.openembedded.org>
	 <177DBC07E94591CC.4797@lists.openembedded.org>
	 <177DD0B30D8FEDF8.27837@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 22:01:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186540

On Tue, 2023-08-22 at 22:08 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Tue, 2023-08-22 at 15:49 +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > 03b2c470a136a83a9961a2a855cde59498361598=C2=A0shows as broken
> >=20
> > deda0761dc6161f03278da4679d96d4727992e91 doesn't seem to break
> >=20
> > but this doesn't seem to make any sense as the changes are:
> >=20
> > kernel-source$ git diff 03b2c470a136a83a9961a2a855cde59498361598 deda07=
61dc6161f03278da4679d96d4727992e91 | diffstat
> >  arch/arm/boot/dts/iwg20d-q7-common.dtsi               |    2 +-
> >  arch/arm/boot/dts/meson8.dtsi                         |    4 ++--
> >  arch/arm/boot/dts/qcom-apq8074-dragonboard.dts        |    4 ----
> >  arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi    |    2 +-
> >  arch/arm/mach-ep93xx/timer-ep93xx.c                   |    3 +--
> >  arch/arm/mach-omap2/board-generic.c                   |    1 -
> >  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi        |    4 ----
> >  arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts          |    4 ++--
> >  arch/arm64/boot/dts/qcom/pm7250b.dtsi                 |    1 -
> >  arch/arm64/boot/dts/renesas/ulcb-kf.dtsi              |    3 ++-
> >  arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts |   28 +++++++++=
+++++--------------
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c            |    2 +-
> >  drivers/infiniband/hw/hfi1/ipoib_tx.c                 |    4 ++--
> >  drivers/infiniband/hw/hfi1/mmu_rb.c                   |  101 +++++++++=
+++++++++++++++++++++++++++++----------------------------------------------=
-----------------
> >  drivers/infiniband/hw/hfi1/mmu_rb.h                   |    3 ---
> >  drivers/infiniband/hw/hfi1/sdma.c                     |   23 +++++----=
--------------
> >  drivers/infiniband/hw/hfi1/sdma.h                     |   47 +++++++++=
++++++--------------------------------
> >  drivers/infiniband/hw/hfi1/sdma_txreq.h               |    2 --
> >  drivers/infiniband/hw/hfi1/user_sdma.c                |  137 +++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--=
-----------------------------------------------------
> >  drivers/infiniband/hw/hfi1/user_sdma.h                |    1 +
> >  drivers/infiniband/hw/hfi1/vnic_sdma.c                |    4 ++--
> >  drivers/infiniband/hw/hns/hns_roce_hem.c              |    7 +++----
> >  drivers/infiniband/hw/irdma/uk.c                      |   10 ++++-----=
-
> >  drivers/input/misc/pm8941-pwrkey.c                    |   19 ++++-----=
----------
> >  drivers/memory/brcmstb_dpfe.c                         |    4 +---
> >  drivers/soc/fsl/qe/Kconfig                            |    1 -
> >  drivers/video/fbdev/omap/lcd_mipid.c                  |    6 +-----
> >  sound/soc/codecs/es8316.c                             |   23 +++++++++=
--------------
> >  28 files changed, 191 insertions(+), 259 deletions(-)
> >=20
> > 03b2c470a136a83a9961a2a855cde59498361598 Input: pm8941-powerkey - fix d=
ebounce on gen2+ PMICs
> > 421ce97657a84b81ce2cb915e75037e1a356736a arm64: dts: ti: k3-j7200: Fix =
physical address of pin
> > 3b4c21804076e461a6453ee4d09872172336aa1d fbdev: omapfb: lcd_mipid: Fix =
an error handling path in mipid_spi_probe()
> > 52b04ac85f5f4b485bf658101e464143225e68f9 drm/msm/dpu: set DSC flush bit=
 correctly at MDP CTL flush register
> > 6878bdd7571827babc1c4c1ff66ea1affe951020 arm64: dts: renesas: ulcb-kf: =
Remove flow control for SCIF1
> > 5d14292dba9554881a137039c048a67ddf321395 ARM: dts: iwg20d-q7-common: Fi=
x backlight pwm specifier
> > 766e0b6f4c9649f126e59c06f100b8581d0773b8 RDMA/hns: Fix hns_roce_table_g=
et return value
> > b99395ab605fb0570d1e62c9459425ac6fc58d46 IB/hfi1: Fix wrong mmu_node us=
ed for user SDMA packet after invalidate
> > ebec507398e11b1c25ce9fb05fb509878233051c RDMA/irdma: avoid fortify-stri=
ng warning in irdma_clr_wqes
> > 750f0a302a10dc2327a6656860a22b7da7251cea soc/fsl/qe: fix usb.c build er=
rors
> > b2194d7dfc95a404990da73ebd394f6f6946a4a0 ARM: dts: meson8: correct uart=
_B and uart_C clock references
> >=20
> > 863054be8d4d2c9b38985371166a37c0e14111e1 ASoC: es8316: Do not set rate =
constraints for unsupported MCLKs
> > 3b575d93020f20f6a711efd8c69bfed26837d694 ASoC: es8316: Increment max va=
lue for ALC Capture Target Volume control
> > c02f27c2950abfed58bd8aa6bf50e79d9cc1fc77 ARM: dts: qcom: apq8074-dragon=
board: Set DMA as remotely controlled
> > 9f79e638d45100dad43c56ad9b47eaff1b98fe9a memory: brcmstb_dpfe: fix test=
ing array offset after use
> > 09722ac9f1e557ea65098202d0b18336c3f04420 ARM: dts: stm32: Shorten the A=
V96 HDMI sound card name
> > 666be7fef4d39d67c041460e29ddf2b875101133 arm64: dts: mediatek: mt8183: =
Add mediatek,broken-save-restore-fw to kukui
> > 1bdb9751b4c64f5709cb3608fd93a709c4e9b2e1 arm64: dts: qcom: apq8096: fix=
 fixed regulator name property
> > 75c019119ebcc919e717fbce5552c2a0908405cf arm64: dts: qcom: pm7250b: add=
 missing spmi-vadc include
> > c63997426da6f24f33ae6caf2423170d5bb80ebb ARM: omap2: fix missing tick_b=
roadcast() prototype
> > e91ffbd6553348cdd3d04b263f8207d919681fac ARM: ep93xx: fix missing-proto=
type warnings
> >=20
> > and I can't see how any of that is compiled into qemuppc. Am I missing =
something?
>=20
> After banging my head against this for hours, I'm not really any
> further forward. With commits prior to
> deda0761dc6161f03278da4679d96d4727992e91 I can't seem to trigger rcu
> stalls. I have seen them on 863054be8d4d2c9b38985371166a37c0e14111e1
> which "isolates" it to the 10 commits above. They're arm or sound or
> memory devices we don't build afaict.
>=20
> I did cut kernel-devsrc,=C2=A0lttng-tools, perf and similar from the imag=
e
> to reduce rebuild times a bit and the rcu stalls appear with them
> missing. I also cut the systemd, dnf and dnf_runtime tests.
>=20
> I have a suspicion that the rcu stalls are "always" there and the
> emulation speed is marginal so some code patterns trigger it, some
> don't. On a loaded autobuilder, it tips the balance to more stalls. The
> more the rcu stalls trigger, the more likely an OOM situation is and
> perhaps we just get unlucky on some loads?
>=20
> Whilst I can see the rcu stalls locally, I've not had the patience/time
> to see any hung QA test. I have let a few run through to completion but
> not all, I've been assuming if configure passes, we wouldn't see
> anything interesting later.

I've gone back to the logs of recent failures and it is always a 255
exit code from ssh, not a timeout, e.g.:

core-image-sato/log.do_testimage.20329.20230822154435:DEBUG: [Command retur=
ned '255' after 235.73 seconds]
core-image-sato/log.do_testimage.20329.20230822154435-DEBUG: Command: dnf -=
-repofrompath=3Doe-testimage-repo-qemuppc,http://192.168.7.1:39265/qemuppc =
--repofrompath=3Doe-testimage-repo-noarch,http://192.168.7.1:39265/noarch -=
-repofrompath=3Doe-testimage-repo-ppc7400,http://192.168.7.1:39265/ppc7400 =
--nogpgcheck install --installroot=3D/home/root/chroot/test -v -y --rpmverb=
osity=3Ddebug busybox
core-image-sato/log.do_testimage.20329.20230822154435-Status: 255 Output:  =
DNF version: 4.16.1
core-image-sato/log.do_testimage.20329.20230822154435-cachedir: /home/root/=
chroot/test/var/cache/dnf
core-image-sato/log.do_testimage.20329.20230822154435-Added oe-testimage-re=
po-qemuppc repo from http://192.168.7.1:39265/qemuppc
core-image-sato/log.do_testimage.20329.20230822154435-Added oe-testimage-re=
po-noarch repo from http://192.168.7.1:39265/noarch



core-image-sato-sdk/log.do_testimage.20325.20230822154435-checking for unis=
td.h... yes
core-image-sato-sdk/log.do_testimage.20325.20230822154435-checking minix/co=
nfig.h usability... no
core-image-sato-sdk/log.do_testimage.20325.20230822154435-checking minix/co=
nfig.h presence... no
core-image-sato-sdk/log.do_testimage.20325.20230822154435-checking for mini=
x/config.h... no
core-image-sato-sdk/log.do_testimage.20325.20230822154435-checking whether =
it is safe to define __EXTENSIONS__...
core-image-sato-sdk/log.do_testimage.20325.20230822154435:DEBUG: [Command r=
eturned '255' after 312.18 seconds]
core-image-sato-sdk/log.do_testimage.20325.20230822154435-DEBUG: Command: c=
d ~/buildtest/cpio-2.13; gnu-configize;  ./configure --disable-maintainer-m=
ode
core-image-sato-sdk/log.do_testimage.20325.20230822154435-Status: 255 Outpu=
t:  aclocal.m4:17: warning: this file was generated for autoconf 2.69.

so the commands are stopping mid flow for unknown reasons or the ssh
connection fails. I can't tell if this coincides with an rcu stall or
not. Both logs do have rcu stalls in.

After these failures the system does continue to otherwise work
normally and subsequent tests pass.

I wonder if the slow emulation might be causing the networking to
glitch and break the ssh connection.

I'm at a bit of a loss on where from here.=20

Cheers,

Richard




