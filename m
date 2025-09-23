Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 985D7CAC5AC
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 19:07:03 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.66.1758654414535483396
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 12:06:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XESEMA2n;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-77f2a62e44dso4029442b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 12:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758654414; x=1759259214; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t0Mhf5iH+VtomoJSVjF8oTvylSw70aB5L8gjZUlp7Cc=;
        b=XESEMA2n9rbav+F6WZp5C4xrsAXpfQOEHbzTZ0/5EXJ0ErTTpBBGKfgG2O5s8Lu+wW
         a53es01DR8oRanl5QiamKjiG4HGq571tA6VyEphu8tsAGPFB91VlIISc32WdB+EPHXCF
         eo50M6IUFW/by1TNKWN+YSvPP8scsQF3pt8FaTpl1qxlBPqFISjWFwVXyTKrnmWjWqFX
         CcBMgenBw2cHERjTCdUhUhpuea/hX1fqXdFlMp/F3sjyA0ihG1Dqdn7FieQMfRQbjhlt
         uFChLLa5+8xX8Few0UlQNj31okAVUKRC2otCkT/nUcjsH98rqxzNwwSxb6LHquySWYAi
         eW8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758654414; x=1759259214;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t0Mhf5iH+VtomoJSVjF8oTvylSw70aB5L8gjZUlp7Cc=;
        b=akFldytQCo4QkxVg1q1wEsGpv/hE4iiaj0wQigGx2lKdHjk2UIjwwZOIQBDfnR0EhY
         rPyAhazrNR2KzbNsc7pzlajtL1wRDo4yy5U7rktnyqPgUEYYUclgxW0zloYDTsWLpwJG
         1hRex4STzt0rk9b8stzS64NNRD4Zp19kmLHk/hUgOQgotVfVVdyChXRtYbD/Jukus8p7
         LHO2SAymAf+EtHFPWtMy+2W8zO6qpbBrcBOrirBQBo5f7w3IivYtgaK+JIPjhDrtELDM
         +GH5meVI751042UtxdXtkAmJtZqMLmhjEEjyaRwhGI3dpKtWeA3ZLbGyNJ58Vsyac2gk
         jHmA==
X-Gm-Message-State: AOJu0Yzardkg5w/9/5Q+rDlqiFEsR5P9Lyrc0Dw/qMKkpE14vaFKEn0B
	7ejR8yP6T2hg9R1/15YEyjICeXY3hoe5kThnHAtyWRsORV/zVsxEQ8crwhmuYy12DwVQk6JpqVA
	RPhKs6zlLN32Ob/tHbYy2VPJfG7Oq4KjQZpPGImM=
X-Gm-Gg: ASbGncu7dnh69jF8JQT09dqurviGfLkiZmymIsivcQv5NAIuseONjD+TB42aD02CuV7
	CpoK8esJvCA54smoPUKfJhbWgo5QfQs3liiix3LIyXG3BaZnx49Cy2ReBSUmnFZqFQZhz9KFWbh
	d2CWSux1w6RkFcEj7mnE1njtWkcMTvnYsgV4e+VuGeNMITNuzMYExcHYfp0+t7efMF13LVI2N6/
	jLOtei668o+nzKGX/nkhT14g/LC3nmjkPyv4dKc
X-Google-Smtp-Source: AGHT+IGmJxTXnGhfzYnxsK4xtv/zR4MddZGRyXizMV6JzqLU+ZN1X6dtveb5O2NY0r6bOcjTP+StFwKtv3EJLQH8tD8=
X-Received: by 2002:a05:6a20:7d9d:b0:249:d3d:a4d4 with SMTP id
 adf61e73a8af0-2d00813e4b7mr5423849637.26.1758654413811; Tue, 23 Sep 2025
 12:06:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1758654194.git.bruce.ashfield@gmail.com> <b6882b7b2be25789af7b2acd8259d85dc851b68b.1758654194.git.bruce.ashfield@gmail.com>
In-Reply-To: <b6882b7b2be25789af7b2acd8259d85dc851b68b.1758654194.git.bruce.ashfield@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 23 Sep 2025 15:06:41 -0400
X-Gm-Features: AS18NWCYVk9YMKe4w8bgScioEfPCB9U3bf9uLlCL76Hlismf6wcVlS3ROiPRAgo
Message-ID: <CADkTA4MVGO9iwLwQ_1nqXGnRagOXr=gWEpy4rHpEnVW3GJ1tmg@mail.gmail.com>
Subject: Re: [PATCH 5/5] linux-yocto/6.16: genericarm64 refactoring, extension
 and clean-up
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009e31ad063f7ca3d2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 19:07:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223919

--0000000000009e31ad063f7ca3d2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2025 at 3:05=E2=80=AFPM <bruce.ashfield@gmail.com> wrote:

> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Integrating the following commit(s) to linux-yocto/.:
>
> no ids found, dumping:
>

urk. this wasn't supposed to be in the commit log, I was debugging my
script.

I'll send a quick v2 to clean that up.

Bruce



>     58666126 genericarm64.scc: enable OP-TEE support
>     90e118e5 features optee.cfg: enable RPMB support
>     1d4363c2 genericarm64.cfg: add MTD support for Hyperbus
>     a6091c0a genericarm64.cfg: improve pmdomain support
>     fb4ff102 genericarm64.cfg: add MTD SPI NAND support
>     ce35b9dd genericarm64.cfg: enable Altera and Broadcom PCIe drivers
>     7701e479 genericarm64-arch.cfg: add new archs
>     20574dcf genericarm64.cfg: improve SPI support
>     6575e9c2 genericarm64.cfg: extend sound support via
> genericarm64-sound.cfg
>     7af0fff7 genericarm64.cfg: add more thermal drivers
>     5baf746c genericarm64.cfg: add more ADC support
>     82b8b2f2 genericarm64.cfg: add more mailbox support
>     6bcc928b genericarm64-arch.cfg: add Rockchip IO domain and DTPM suppo=
rt
>     4bd654f3 genericarm64.cfg: enable more Arm extensions
>     2e7a98fb genericarm64.cfg: add more PHY support
>     93405670 genericarm64.cfg: add Freescale and Rockchip NAND support
>     206f0249 genericarm64.cfg: enable more graphics DRM support
>     e475a5ba genericarm64.cfg: enable more CRYPTO_DEV drivers
>     65ca974e genericarm64.cfg: add Renesas STM memory controller drivers
>     20592693 genericarm64.cfg: enable DEVFREQ governors and drivers
>     c23b00f6 genericarm64.cfg: add CONFIG_ROCKCHIP_PM_DOMAINS=3Dy
>     900c4d7c genericarm64.scc: enable SRAM support
>     952ea4f7 zynq: use sram.scc for SRAM support
>     93fdb4a1 sram: add feature with .scc and .cfg
>     d75a77bc genericarm64.cfg: enable Qualcomm RTC and DSP drivers
>     34a37d36 genericarm64.scc: enable nvme support
>     a50d70a8 intel-x86: use nvme.scc
>     0e4311da intel amd-x86-64: use nvme.scc
>     8df9e176 marvell-cn96xx.scc: use nvme.scc
>     c975d9dc bcm-2xxx-rpi.cfg: use nvme.scc
>     64047a98 nvme.scc: add feature for NVMe support
>     8e0c5d1e genericarm64.cfg: enable Tegra firmware drivers
>     1badd0c5 genericarm64.cfg: enable Qualcomm security firmware interfac=
es
>     a4393b2a genericarm64.cfg: add Google and MediaTek firmware drivers
>     93cf7834 genericarm64.cfg: enable CONFIG_MHI_BUS_PCI_GENERIC=3Dm
>     413c8ca8 genericarm64.scc: enable firmware driver support
>     8d812d85 firmware.cfg: enable CONFIG_FW_LOADER_PAGED_BUF=3Dy and
> CONFIG_FW_LOADER_SYSFS=3Dy
>     624046ca genericarm64.cfg: enable more PCI/PCIe support
>     8fb9f378 genericarm64.scc: enable more Bluetooth HW drivers
>     bedb9b8a bluetooth-hw.scc: add config for Bluetooth HW drivers
>     35baf131 bluetooth-usb.cfg: enable more drivers
>     47061600 genericarm64.scc: add bluetooth-usb support
>     5b21b9d9 bluetooth.cfg: enable LED events
>     9cc05195 genericarm64.cfg: enable Qualcomm IPC drivers
>     52932f92 genericarm64.cfg: enable CONFIG_NET_SWITCHDEV=3Dy
>     2bc84172 genericarm64.scc: enable kubernetes support
>     6b383a08 qemu-kvm-arm64.cfg: enable KSM with KVM
>     b58e205f genericarm64.scc: enable KVM support
>     715986a3 genericarm64.cfg: enable ACPI memory hotplug and error
> reporting
>     f362ed14 features: add memory/failure.scc
>     ec58a666 genericarm64.cfg: enable CONFIG_BLK_DEV_INTEGRITY=3Dy
>     85984f29 features: add block/integrity.scc
>     3a49bdb6 genericarm64.cfg: enable CONFIG_JUMP_LABEL=3Dy
>     19800309 genericarm64-arch.cfg: extend Tegra support
>     ffcf3235 genericarm64.cfg: enable CONFIG_CPU_FREQ_STAT=3Dy
>     c594a800 features: add power/cpu_freq_stat.scc
>     000bfa8a genericarm64-arch.cfg: enable CONFIG_ARCH_AIROHA=3Dy
>     e64dea75 genericarm64.cfg: enable CONFIG_SCHED_AUTOGROUP=3Dy
>     270015f9 features: add sched/sched-desktop.scc
>     e711e072 genericarm64.cfg: add CONFIG_SCHED_HW_PRESSURE=3Dy
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb   | 2 +-
>  meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb | 2 +-
>  meta/recipes-kernel/linux/linux-yocto_6.16.bb      | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
> b/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
> index e3cc651f76..ddd97d02fd 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
> @@ -15,7 +15,7 @@ python () {
>  }
>
>  SRCREV_machine ?=3D "d9ac79e651b849ad8b16bc3f96af4cc54c30148e"
> -SRCREV_meta ?=3D "abd3e56cdb1c200bac4e2496005649e3261cb9c3"
> +SRCREV_meta ?=3D "58666126fdb734568fed6166d39940208a35d53f"
>
>  SRC_URI =3D "git://
> git.yoctoproject.org/linux-yocto.git;branch=3D${KBRANCH};name=3Dmachine;p=
rotocol=3Dhttps
> <http://git.yoctoproject.org/linux-yocto.git;branch=3D$%7BKBRANCH%7D;name=
=3Dmachine;protocol=3Dhttps>
> \
>             git://
> git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=
=3Dyocto-6.16;destsuffix=3D${KMETA};protocol=3Dhttps
> <http://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;=
branch=3Dyocto-6.16;destsuffix=3D$%7BKMETA%7D;protocol=3Dhttps>
> "
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
> b/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
> index a63d7a198b..e9e8019a63 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
> @@ -18,7 +18,7 @@ KMETA =3D "kernel-meta"
>  KCONF_BSP_AUDIT_LEVEL =3D "2"
>
>  SRCREV_machine ?=3D "ff2318af3a2513c944b2598ab3df356dd7f15f34"
> -SRCREV_meta ?=3D "abd3e56cdb1c200bac4e2496005649e3261cb9c3"
> +SRCREV_meta ?=3D "58666126fdb734568fed6166d39940208a35d53f"
>
>  PV =3D "${LINUX_VERSION}+git"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_6.16.bb
> b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
> index 580df960ae..0d9306cd8f 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_6.16.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
> @@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?=3D
> "ff2318af3a2513c944b2598ab3df356dd7f15f34"
>  SRCREV_machine:qemux86-64 ?=3D "ff2318af3a2513c944b2598ab3df356dd7f15f34=
"
>  SRCREV_machine:qemumips64 ?=3D "e6f7e24a7b76c6d1b3eaa3716fa1c4185de94aa5=
"
>  SRCREV_machine ?=3D "ff2318af3a2513c944b2598ab3df356dd7f15f34"
> -SRCREV_meta ?=3D "abd3e56cdb1c200bac4e2496005649e3261cb9c3"
> +SRCREV_meta ?=3D "58666126fdb734568fed6166d39940208a35d53f"
>
>  # set your preferred provider of linux-yocto to 'linux-yocto-upstream',
> and you'll
>  # get the <version>/base branch, which is pure upstream -stable, and the
> same
> --
> 2.39.2
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000009e31ad063f7ca3d2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 23, 2025 at 3:05=
=E2=80=AFPM &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@=
gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.=
com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
<br>
Integrating the following commit(s) to linux-yocto/.:<br>
<br>
no ids found, dumping:<br></blockquote><div><br></div><div><div class=3D"gm=
ail_default" style=3D"font-size:small">urk. this wasn&#39;t supposed to be =
in the commit log, I was debugging my script.</div><div class=3D"gmail_defa=
ult" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">I&#39;ll send a quick v2 to clean that up.</div><div c=
lass=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gm=
ail_default" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 58666126 genericarm64.scc: enable OP-TEE support<br>
=C2=A0 =C2=A0 90e118e5 features optee.cfg: enable RPMB support<br>
=C2=A0 =C2=A0 1d4363c2 genericarm64.cfg: add MTD support for Hyperbus<br>
=C2=A0 =C2=A0 a6091c0a genericarm64.cfg: improve pmdomain support<br>
=C2=A0 =C2=A0 fb4ff102 genericarm64.cfg: add MTD SPI NAND support<br>
=C2=A0 =C2=A0 ce35b9dd genericarm64.cfg: enable Altera and Broadcom PCIe dr=
ivers<br>
=C2=A0 =C2=A0 7701e479 genericarm64-arch.cfg: add new archs<br>
=C2=A0 =C2=A0 20574dcf genericarm64.cfg: improve SPI support<br>
=C2=A0 =C2=A0 6575e9c2 genericarm64.cfg: extend sound support via genericar=
m64-sound.cfg<br>
=C2=A0 =C2=A0 7af0fff7 genericarm64.cfg: add more thermal drivers<br>
=C2=A0 =C2=A0 5baf746c genericarm64.cfg: add more ADC support<br>
=C2=A0 =C2=A0 82b8b2f2 genericarm64.cfg: add more mailbox support<br>
=C2=A0 =C2=A0 6bcc928b genericarm64-arch.cfg: add Rockchip IO domain and DT=
PM support<br>
=C2=A0 =C2=A0 4bd654f3 genericarm64.cfg: enable more Arm extensions<br>
=C2=A0 =C2=A0 2e7a98fb genericarm64.cfg: add more PHY support<br>
=C2=A0 =C2=A0 93405670 genericarm64.cfg: add Freescale and Rockchip NAND su=
pport<br>
=C2=A0 =C2=A0 206f0249 genericarm64.cfg: enable more graphics DRM support<b=
r>
=C2=A0 =C2=A0 e475a5ba genericarm64.cfg: enable more CRYPTO_DEV drivers<br>
=C2=A0 =C2=A0 65ca974e genericarm64.cfg: add Renesas STM memory controller =
drivers<br>
=C2=A0 =C2=A0 20592693 genericarm64.cfg: enable DEVFREQ governors and drive=
rs<br>
=C2=A0 =C2=A0 c23b00f6 genericarm64.cfg: add CONFIG_ROCKCHIP_PM_DOMAINS=3Dy=
<br>
=C2=A0 =C2=A0 900c4d7c genericarm64.scc: enable SRAM support<br>
=C2=A0 =C2=A0 952ea4f7 zynq: use sram.scc for SRAM support<br>
=C2=A0 =C2=A0 93fdb4a1 sram: add feature with .scc and .cfg<br>
=C2=A0 =C2=A0 d75a77bc genericarm64.cfg: enable Qualcomm RTC and DSP driver=
s<br>
=C2=A0 =C2=A0 34a37d36 genericarm64.scc: enable nvme support<br>
=C2=A0 =C2=A0 a50d70a8 intel-x86: use nvme.scc<br>
=C2=A0 =C2=A0 0e4311da intel amd-x86-64: use nvme.scc<br>
=C2=A0 =C2=A0 8df9e176 marvell-cn96xx.scc: use nvme.scc<br>
=C2=A0 =C2=A0 c975d9dc bcm-2xxx-rpi.cfg: use nvme.scc<br>
=C2=A0 =C2=A0 64047a98 nvme.scc: add feature for NVMe support<br>
=C2=A0 =C2=A0 8e0c5d1e genericarm64.cfg: enable Tegra firmware drivers<br>
=C2=A0 =C2=A0 1badd0c5 genericarm64.cfg: enable Qualcomm security firmware =
interfaces<br>
=C2=A0 =C2=A0 a4393b2a genericarm64.cfg: add Google and MediaTek firmware d=
rivers<br>
=C2=A0 =C2=A0 93cf7834 genericarm64.cfg: enable CONFIG_MHI_BUS_PCI_GENERIC=
=3Dm<br>
=C2=A0 =C2=A0 413c8ca8 genericarm64.scc: enable firmware driver support<br>
=C2=A0 =C2=A0 8d812d85 firmware.cfg: enable CONFIG_FW_LOADER_PAGED_BUF=3Dy =
and CONFIG_FW_LOADER_SYSFS=3Dy<br>
=C2=A0 =C2=A0 624046ca genericarm64.cfg: enable more PCI/PCIe support<br>
=C2=A0 =C2=A0 8fb9f378 genericarm64.scc: enable more Bluetooth HW drivers<b=
r>
=C2=A0 =C2=A0 bedb9b8a bluetooth-hw.scc: add config for Bluetooth HW driver=
s<br>
=C2=A0 =C2=A0 35baf131 bluetooth-usb.cfg: enable more drivers<br>
=C2=A0 =C2=A0 47061600 genericarm64.scc: add bluetooth-usb support<br>
=C2=A0 =C2=A0 5b21b9d9 bluetooth.cfg: enable LED events<br>
=C2=A0 =C2=A0 9cc05195 genericarm64.cfg: enable Qualcomm IPC drivers<br>
=C2=A0 =C2=A0 52932f92 genericarm64.cfg: enable CONFIG_NET_SWITCHDEV=3Dy<br=
>
=C2=A0 =C2=A0 2bc84172 genericarm64.scc: enable kubernetes support<br>
=C2=A0 =C2=A0 6b383a08 qemu-kvm-arm64.cfg: enable KSM with KVM<br>
=C2=A0 =C2=A0 b58e205f genericarm64.scc: enable KVM support<br>
=C2=A0 =C2=A0 715986a3 genericarm64.cfg: enable ACPI memory hotplug and err=
or reporting<br>
=C2=A0 =C2=A0 f362ed14 features: add memory/failure.scc<br>
=C2=A0 =C2=A0 ec58a666 genericarm64.cfg: enable CONFIG_BLK_DEV_INTEGRITY=3D=
y<br>
=C2=A0 =C2=A0 85984f29 features: add block/integrity.scc<br>
=C2=A0 =C2=A0 3a49bdb6 genericarm64.cfg: enable CONFIG_JUMP_LABEL=3Dy<br>
=C2=A0 =C2=A0 19800309 genericarm64-arch.cfg: extend Tegra support<br>
=C2=A0 =C2=A0 ffcf3235 genericarm64.cfg: enable CONFIG_CPU_FREQ_STAT=3Dy<br=
>
=C2=A0 =C2=A0 c594a800 features: add power/cpu_freq_stat.scc<br>
=C2=A0 =C2=A0 000bfa8a genericarm64-arch.cfg: enable CONFIG_ARCH_AIROHA=3Dy=
<br>
=C2=A0 =C2=A0 e64dea75 genericarm64.cfg: enable CONFIG_SCHED_AUTOGROUP=3Dy<=
br>
=C2=A0 =C2=A0 270015f9 features: add sched/sched-desktop.scc<br>
=C2=A0 =C2=A0 e711e072 genericarm64.cfg: add CONFIG_SCHED_HW_PRESSURE=3Dy<b=
r>
<br>
Signed-off-by: Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@linaro.org" =
target=3D"_blank">mikko.rapeli@linaro.org</a>&gt;<br>
Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.co=
m" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_6.16.bb" r=
el=3D"noreferrer" target=3D"_blank">linux-yocto-rt_6.16.bb</a>=C2=A0 =C2=A0=
| 2 +-<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_6.16.bb"=
 rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.16.bb</a> | 2 +-<b=
r>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.16.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_6.16.bb</a>=C2=A0 =C2=A0 =C2=
=A0 | 2 +-<br>
=C2=A03 files changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_6.1=
6.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-rt_6.16.bb</a> b/met=
a/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_6.16.bb" rel=3D"nor=
eferrer" target=3D"_blank">linux-yocto-rt_6.16.bb</a><br>
index e3cc651f76..ddd97d02fd 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_6.16.bb" r=
el=3D"noreferrer" target=3D"_blank">linux-yocto-rt_6.16.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_6.16.bb" r=
el=3D"noreferrer" target=3D"_blank">linux-yocto-rt_6.16.bb</a><br>
@@ -15,7 +15,7 @@ python () {<br>
=C2=A0}<br>
<br>
=C2=A0SRCREV_machine ?=3D &quot;d9ac79e651b849ad8b16bc3f96af4cc54c30148e&qu=
ot;<br>
-SRCREV_meta ?=3D &quot;abd3e56cdb1c200bac4e2496005649e3261cb9c3&quot;<br>
+SRCREV_meta ?=3D &quot;58666126fdb734568fed6166d39940208a35d53f&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/linux-=
yocto.git;branch=3D$%7BKBRANCH%7D;name=3Dmachine;protocol=3Dhttps" rel=3D"n=
oreferrer" target=3D"_blank">git.yoctoproject.org/linux-yocto.git;branch=3D=
${KBRANCH};name=3Dmachine;protocol=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://git.yocto=
project.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-6.16=
;destsuffix=3D$%7BKMETA%7D;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_=
blank">git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;bra=
nch=3Dyocto-6.16;destsuffix=3D${KMETA};protocol=3Dhttps</a>&quot;<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_6=
.16.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.16.bb</a> b=
/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_6.16.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.16.bb</a><br>
index a63d7a198b..e9e8019a63 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_6.16.bb"=
 rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.16.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_6.16.bb"=
 rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.16.bb</a><br>
@@ -18,7 +18,7 @@ KMETA =3D &quot;kernel-meta&quot;<br>
=C2=A0KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
<br>
=C2=A0SRCREV_machine ?=3D &quot;ff2318af3a2513c944b2598ab3df356dd7f15f34&qu=
ot;<br>
-SRCREV_meta ?=3D &quot;abd3e56cdb1c200bac4e2496005649e3261cb9c3&quot;<br>
+SRCREV_meta ?=3D &quot;58666126fdb734568fed6166d39940208a35d53f&quot;<br>
<br>
=C2=A0PV =3D &quot;${LINUX_VERSION}+git&quot;<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.16.b=
b" rel=3D"noreferrer" target=3D"_blank">linux-yocto_6.16.bb</a> b/meta/reci=
pes-kernel/linux/<a href=3D"http://linux-yocto_6.16.bb" rel=3D"noreferrer" =
target=3D"_blank">linux-yocto_6.16.bb</a><br>
index 580df960ae..0d9306cd8f 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.16.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_6.16.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.16.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_6.16.bb</a><br>
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?=3D &quot;ff2318af3a2513c944b2598=
ab3df356dd7f15f34&quot;<br>
=C2=A0SRCREV_machine:qemux86-64 ?=3D &quot;ff2318af3a2513c944b2598ab3df356d=
d7f15f34&quot;<br>
=C2=A0SRCREV_machine:qemumips64 ?=3D &quot;e6f7e24a7b76c6d1b3eaa3716fa1c418=
5de94aa5&quot;<br>
=C2=A0SRCREV_machine ?=3D &quot;ff2318af3a2513c944b2598ab3df356dd7f15f34&qu=
ot;<br>
-SRCREV_meta ?=3D &quot;abd3e56cdb1c200bac4e2496005649e3261cb9c3&quot;<br>
+SRCREV_meta ?=3D &quot;58666126fdb734568fed6166d39940208a35d53f&quot;<br>
<br>
=C2=A0# set your preferred provider of linux-yocto to &#39;linux-yocto-upst=
ream&#39;, and you&#39;ll<br>
=C2=A0# get the &lt;version&gt;/base branch, which is pure upstream -stable=
, and the same<br>
-- <br>
2.39.2<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--0000000000009e31ad063f7ca3d2--

