Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46B5FCCA470
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 16:01:15 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.22680.1759852868334869406
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Oct 2025 09:01:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OOlAbQmO;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-796d68804a0so78326646d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 09:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759852867; x=1760457667; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6LpiWqUp4iNF3TvNL3kFT7DLvLxzOLjRT/QZRDP3ty4=;
        b=OOlAbQmOvz1BuDn8RM9cNvXj3ESng7iYzGljfMuOrGak9RIPRHNkTakCsLJc+g6aqm
         9koryN+olsGjtTNgc2S+w/6Ok8wsk2RRYPkrqtXui93kOtbgAOuG0LyJlEyAjWDkKj7a
         jXFWAfFQN7ltL9JGfJYnigKiriK7YaH3BkEIAvuirLoF6zT+Xm5fNTTWcGDwWY2aL1uT
         jrka5UNcD7GxNlw+NaJCTVLV5EkzlP7vrrEBVioQ+3mDWwx7G//3RrUyzzLuBzZQL02H
         pLzCC0bViUHiirfcyR9vM/yibGDXfY6cFCAvSGGGoRF6RtXBppj4jGJHXQRXiYhJwLJZ
         fWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759852867; x=1760457667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6LpiWqUp4iNF3TvNL3kFT7DLvLxzOLjRT/QZRDP3ty4=;
        b=Ywn5QvOwVKi9tLzGZ5cGU9spePRqm5m8JPLu8XQv4GAWF3GT1xJftWiaakVQrwZn1I
         nleCOpLtYVJkwUvqGhRuiqN3hwIJWupZS8yz10pS8NBSYLQ2JlF8M2e8hnLij8bamsS7
         RW4XDBtYnKNi6LGOrx32UySXEwMx+Veuf6tFgnipc8PR0wcu2ernFqy7IveVt83IxAAg
         HQIi5eP3Ipmzk5HjnzOPO96uYHEgkOWDBdVse2xgVnURvxH3WfggB5B2aLN/7M7wNMuv
         2zzlWZ5sOPClSaM2AOl9Bwx27O+gmprTPZWrjcn2ulofbNS73VdvMMt5yfBTY2eUzxnr
         rEWQ==
X-Gm-Message-State: AOJu0YyWKgXskl93Fjt/vw6BKfP5n1ncXcRDGtIal7edV2muogEbrBlv
	BgmdOfNXO1jbSLNoJA5G8OyEWpOz1KWmzC3HxS0JNCB1DJpE07izoUMANIcYfRLlFcELRRf17+6
	OpWlxxhtl12wMNVbXKo15fvX0f4FjsMGeRQ==
X-Gm-Gg: ASbGncsxdPCtMT7EBTAzxY1cTikelM3ysPJWsD8XtnXgU5wAlSBbFsmQ8rRF1ma6LX4
	ts6u87/f4JwCQL6K0sK46Gk7A4wUFTeivTYrXCIHeQC2YQ3xem7YoRDN4lA9bu9lS7B3xWrwebq
	SyYHBhVHWlT8sm6dYejDFrmJD2v4Ul7V/r3UGzlFMYpf4fAJbbNcnXu4H4tPByal15ewn6U0zv4
	R8CahuBXzCDjtspCsokV804vL94XxNrM1Rl829hPsYM6MVTEVyHiK5DN93uyhy/7Rl+9SLbgCZD
	Ig6dj7/2+etabPko3+phsfvZTI4IOE5NqvOz9rlGTkG8lVND3h/mwzo1TWprPu1Q
X-Google-Smtp-Source: AGHT+IFv2WwEeVlVowm7p87dO1irbBsQZg6+oDhsgRo19h5g02H7C8GmLQYYOPscb+SL34ZDbmMCjcK54gvkzJ2GJ7Q=
X-Received: by 2002:a05:6214:1d03:b0:807:3dcd:bec5 with SMTP id
 6a1803df08f44-879dc86a958mr259978026d6.61.1759852855431; Tue, 07 Oct 2025
 09:00:55 -0700 (PDT)
MIME-Version: 1.0
References: <20251007154620.21284-1-reatmon@ti.com>
In-Reply-To: <20251007154620.21284-1-reatmon@ti.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 7 Oct 2025 18:00:44 +0200
X-Gm-Features: AS18NWAkpNQp3gsGA2d_AZBttt4hdG4MXWJAf4hE-uPQ7aDGd77BHd4rl-A0VuA
Message-ID: <CANNYZj_J-PHFGCOhj=5v10cS_=h6Kuzyt7_VzbsHhicAmbixwA@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] linux-firmware: Move all firmware into sub-packages
To: reatmon@ti.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 16:01:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224541

Does this make the main linux-firmware package empty? Should we
somehow enforce that, so that any version upgrades won't again regress
that?

Alex

On Tue, 7 Oct 2025 at 17:46, Ryan Eatmon via lists.openembedded.org
<reatmon=3Dti.com@lists.openembedded.org> wrote:
>
> A lot of the firmware has already been broken out into sub-packages, but
> a good number were still lingering in the base linux-firmware package.
>
> This patch does two things:
>
> 1) Move all of the remaining firmware into sub-packages based on the
> driver name in the WHENCE file or into existing sub-packages where a
> file or two were missed.
>
> 2) Create a new REMOVE_UNLICENSED variable and do_install() logic to
> allow for marking certain firmware files as something to remove and not
> package up.  The intention is that in the WHENCE file, a number of
> firmware files have no license information or very questionable
> declarations as to what the license is for the firmware.
>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
> v2: - Package up sa8775p/LEMANS-EVK-tplg.bin introduced by another recent=
 patch.
>     - Fix dash vs bash error in new do_install() code.
>
>  .../linux-firmware/linux-firmware_20250917.bb | 1038 ++++++++++++++++-
>  1 file changed, 1021 insertions(+), 17 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250917.b=
b b/meta/recipes-kernel/linux-firmware/linux-firmware_20250917.bb
> index f8d8decfe5..34dc1cc0d3 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250917.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250917.bb
> @@ -5,9 +5,61 @@ that contains firmware binary blobs necessary for partia=
l or full functionality
>  of certain hardware devices."
>  SECTION =3D "kernel"
>
> +REMOVE_UNLICENSED =3D ""
> +
> +# For acenic - Alteon AceNIC Gigabit Ethernet card
> +REMOVE_UNLICENSED +=3D "acenic/tg1.bin acenic/tg2.bin"
> +
> +# For emi62 - EMI 6|2m USB Audio interface
> +REMOVE_UNLICENSED +=3D "emi62/bitstream.fw emi62/loader.fw emi62/midi.fw=
 emi62/spdif.fw"
> +
> +# For snd-maestro3 - ESS Allegro Maestro3 audio device
> +REMOVE_UNLICENSED +=3D "ess/maestro3_assp_kernel.fw ess/maestro3_assp_mi=
nisrc.fw"
> +
> +# For s2255drv
> +REMOVE_UNLICENSED +=3D "f2255usb.bin"
> +
> +# For snd-korg1212 - Korg 1212 IO audio device
> +REMOVE_UNLICENSED +=3D "korg/k1212.dsp"
> +
> +# For lgs8gxx - Legend Silicon GB20600 demodulator driver
> +REMOVE_UNLICENSED +=3D "lgs8g75.fw"
> +
> +# For ti_usb_3410_5052 - Multi-Tech USB cell modems
> +REMOVE_UNLICENSED +=3D "mts_cdma.fw mts_gsm.fw mts_edge.fw mts_mt9234mu.=
fw mts_mt9234zba.fw"
> +
> +# For myri_sbus - MyriCOM Gigabit Ethernet
> +REMOVE_UNLICENSED +=3D "myricom/lanai.bin"
> +
> +# For qlogicpti - PTI Qlogic, ISP Driver
> +REMOVE_UNLICENSED +=3D "qlogic/isp1000.bin"
> +
> +# For cassini - Sun Cassini
> +REMOVE_UNLICENSED +=3D "sun/cassini.bin"
> +
> +# For dvb-ttusb-budget - Technotrend/Hauppauge Nova-USB devices
> +REMOVE_UNLICENSED +=3D "ttusb-budget/dspbootcode.bin"
> +
> +# For ueagle-atm - Driver for USB ADSL Modems based on Eagle I,II,III
> +REMOVE_UNLICENSED +=3D "ueagle-atm/930-fpga.bin ueagle-atm/CMVeiWO.bin u=
eagle-atm/CMVepFR10.bin ueagle-atm/DSP9p.bin ueagle-atm/eagleIII.fw ueagle-=
atm/adi930.fw ueagle-atm/CMVep.bin ueagle-atm/CMVepFR.bin ueagle-atm/DSPei.=
bin ueagle-atm/CMV9i.bin ueagle-atm/CMVepES03.bin ueagle-atm/CMVepIT.bin ue=
agle-atm/DSPep.bin ueagle-atm/CMV9p.bin ueagle-atm/CMVepES.bin ueagle-atm/C=
MVepWO.bin ueagle-atm/eagleI.fw ueagle-atm/CMVei.bin ueagle-atm/CMVepFR04.b=
in ueagle-atm/DSP9i.bin ueagle-atm/eagleII.fw"
> +
> +# For vicam - USB 3com HomeConnect (aka vicam)
> +REMOVE_UNLICENSED +=3D "vicam/firmware.fw"
> +
> +# For yam - YAM driver for AX.25
> +REMOVE_UNLICENSED +=3D "yam/1200.bin yam/9600.bin"
> +
> +# For snd-wavefront - ISA WaveFront sound card
> +REMOVE_UNLICENSED +=3D "yamaha/yss225_registers.bin"
> +
> +# For snd-ymfpci - Yamaha YMF724/740/744/754 audio devices
> +REMOVE_UNLICENSED +=3D "yamaha/ds1_ctrl.fw yamaha/ds1_dsp.fw yamaha/ds1e=
_ctrl.fw"
> +
> +
>  LICENSE =3D "\
>      Firmware-Abilis \
>      & Firmware-adsp_sst \
> +    & Firmware-advansys \
>      & Firmware-aeonsemi \
>      & Firmware-agere \
>      & Firmware-airoha \
> @@ -29,6 +81,7 @@ LICENSE =3D "\
>      & Firmware-bnx2x \
>      & Firmware-broadcom_bcm43xx \
>      & Firmware-ca0132 \
> +    & Firmware-cadence \
>      & Firmware-cavium \
>      & Firmware-chelsio_firmware \
>      & Firmware-cirrus \
> @@ -64,6 +117,7 @@ LICENSE =3D "\
>      & Firmware-IntcSST2 \
>      & Firmware-kaweth \
>      & Firmware-keyspan \
> +    & Firmware-lenovo \
>      & Firmware-linaro \
>      & Firmware-Lontium \
>      & Firmware-mali_csffw \
> @@ -122,11 +176,18 @@ LICENSE =3D "\
>      & Firmware-xc5000c \
>      & Firmware-xe \
>      & WHENCE \
> +    & GPL-1.0-only \
>      & GPL-2.0-or-later \
> +    & GPL-2.0-only \
> +    & GPL-3.0-only \
> +    & MPL-1.1 \
> +    & Apache-2.0 \
> +    & MIT \
>  "
>
>  LIC_FILES_CHKSUM =3D "file://LICENCE.Abilis;md5=3Db5ee3f410780e56711ad48=
eadc22b8bc \
>                      file://LICENCE.adsp_sst;md5=3D615c45b91a5a4a9fe046d6=
ab9a2df728 \
> +                    file://LICENCE.advansys;md5=3Dbca735476602a7bcb187c7=
f8bf4a31d5 \
>                      file://LICENSE.aeonsemi;md5=3D521c00bae0077c90d6ffb9=
ccf66905ae \
>                      file://LICENCE.agere;md5=3Daf0133de6b4a9b2522defd5f1=
88afd31 \
>                      file://LICENSE.airoha;md5=3Dfa3dedb960e2673aea51aa50=
9f7b537d \
> @@ -184,6 +245,7 @@ LIC_FILES_CHKSUM =3D "file://LICENCE.Abilis;md5=3Db5e=
e3f410780e56711ad48eadc22b8bc \
>                      file://LICENSE.ixp4xx;md5=3Dddc5cd6cbc6745343926fe7e=
cc2cdeb2 \
>                      file://LICENCE.kaweth;md5=3Db1d876e562f4b3b8d391ad83=
95dfe03f \
>                      file://LICENCE.keyspan;md5=3D676af26017c45772c972ce4=
a75d467d9 \
> +                    file://LICENCE.lenovo;md5=3D7f25420b5c27211f7bf33beb=
b3042ce4 \
>                      file://LICENCE.linaro;md5=3D936d91e71cf9cd30e733db4b=
f11661cc \
>                      file://LICENSE.Lontium;md5=3D4ec8dc582ff7295f39e2ca6=
a7b0be2b6 \
>                      file://LICENCE.mali_csffw;md5=3De064aaec4d21ef856e1b=
76a6f5dc435f \
> @@ -252,6 +314,7 @@ WHENCE_CHKSUM  =3D "a12ddaaab7162785af9d79b76132d185"
>  # so that the license files will be copied from fetched source
>  NO_GENERIC_LICENSE[Firmware-Abilis] =3D "LICENCE.Abilis"
>  NO_GENERIC_LICENSE[Firmware-adsp_sst] =3D "LICENCE.adsp_sst"
> +NO_GENERIC_LICENSE[Firmware-advansys] =3D "LICENCE.advansys"
>  NO_GENERIC_LICENSE[Firmware-aeonsemi] =3D "LICENSE.aeonsemi"
>  NO_GENERIC_LICENSE[Firmware-agere] =3D "LICENCE.agere"
>  NO_GENERIC_LICENSE[Firmware-airoha] =3D "LICENSE.airoha"
> @@ -309,6 +372,7 @@ NO_GENERIC_LICENSE[Firmware-iwlwifi_firmware] =3D "LI=
CENCE.iwlwifi_firmware"
>  NO_GENERIC_LICENSE[Firmware-ixp4xx] =3D "LICENSE.ixp4xx"
>  NO_GENERIC_LICENSE[Firmware-kaweth] =3D "LICENCE.kaweth"
>  NO_GENERIC_LICENSE[Firmware-keyspan] =3D "LICENCE.keyspan"
> +NO_GENERIC_LICENSE[Firmware-lenovo] =3D "LICENCE.lenovo"
>  NO_GENERIC_LICENSE[Firmware-linaro] =3D "LICENCE.linaro"
>  NO_GENERIC_LICENSE[Firmware-Lontium] =3D "LICENSE.Lontium"
>  NO_GENERIC_LICENSE[Firmware-mali_csffw] =3D "LICENCE.mali_csffw"
> @@ -416,6 +480,21 @@ do_install() {
>          fi
>          cp LICEN[CS]E.* WHENCE ${D}${nonarch_base_libdir}/firmware/
>          cp wfx/LICEN[CS]E.* ${D}${nonarch_base_libdir}/firmware/wfx/
> +
> +        # Remove all unlicensed firmware
> +        for file in ${REMOVE_UNLICENSED}; do
> +                echo "Remove unlicensed firmware: $file"
> +                rm ${D}${nonarch_base_libdir}/firmware/$file
> +                path_to_file=3D$(dirname $file)
> +                while [ "${path_to_file}" !=3D "." ]; do
> +                        num_files=3D$(ls -A1 ${D}${nonarch_base_libdir}/=
firmware/$path_to_file | wc -l)
> +                        if [ "$num_files" =3D "0" ]; then
> +                                echo "Remove empty dir: $path_to_file"
> +                                rm -rf ${D}${nonarch_base_libdir}/firmwa=
re/$path_to_file
> +                        fi
> +                        path_to_file=3D$(dirname $path_to_file)
> +                done
> +        done
>  }
>
>  PACKAGES =3D+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
> @@ -456,18 +535,28 @@ PACKAGES =3D+ "${PN}-amphion-vpu-license ${PN}-amph=
ion-vpu \
>               ${PN}-moxa-license ${PN}-moxa \
>               ${PN}-sd8686 ${PN}-sd8688 ${PN}-sd8787 ${PN}-sd8797 ${PN}-s=
d8801 \
>               ${PN}-sd8887 ${PN}-sd8897 ${PN}-sd8997 ${PN}-usb8997 \
> +             ${PN}-cf8381 ${PN}-cf8385 ${PN}-gspi8682 ${PN}-gspi8686 ${P=
N}-gspi8688 ${PN}-sd8385 ${PN}-sd8682 \
> +             ${PN}-usb8388 ${PN}-usb8682 ${PN}-sd8977 ${PN}-usb8766 ${PN=
}-usb8797 ${PN}-usb8801 ${PN}-usb8897 ${PN}-rvu-cptpf \
> +             ${PN}-mwl8k ${PN}-mwlwifi\
>               ${PN}-ti-connectivity-license ${PN}-wl1251-license ${PN}-wl=
common ${PN}-wl1251 ${PN}-wl12xx ${PN}-wl18xx ${PN}-cc33xx \
>               ${PN}-ti-keystone-license ${PN}-ti-keystone \
> +             ${PN}-ti-tspa-license ${PN}-ti-tas2563 ${PN}-ti-tas2781 ${P=
N}-ti-vpe \
> +             ${PN}-ti-usb-3410-5052 \
>               ${PN}-vt6656-license ${PN}-vt6656 \
> -             ${PN}-rs9113 ${PN}-rs9116 \
> +             ${PN}-rs9113 ${PN}-rs9116 ${PN}-rsi-91x \
>               ${PN}-rtl-license ${PN}-rtl8188 ${PN}-rtl8192cu ${PN}-rtl81=
92ce ${PN}-rtl8192su ${PN}-rtl8723 ${PN}-rtl8821 \
>               ${PN}-rtl8761 \
>               ${PN}-rtl8168 \
>               ${PN}-rtl8822 \
> +             ${PN}-rtl8192 ${PN}-rtl8710 ${PN}-rtl8812 \
> +             ${PN}-rtl8851 ${PN}-rtl8852 ${PN}-rtl8922 \
> +             ${PN}-rtl8703 ${PN}-rtl8814 \
>               ${PN}-rtl-nic \
>               ${PN}-cypress-license \
>               ${PN}-broadcom-license \
>               ${PN}-bcm-0bb4-0306 \
> +             ${PN}-bcm-0a5c-6410 \
> +             ${PN}-bcm43012 \
>               ${PN}-bcm43143 \
>               ${PN}-bcm43236b \
>               ${PN}-bcm43241b0 \
> @@ -500,6 +589,7 @@ PACKAGES =3D+ "${PN}-amphion-vpu-license ${PN}-amphio=
n-vpu \
>               ${PN}-bcm4373 \
>               ${PN}-bcm43xx \
>               ${PN}-bcm43xx-hdr \
> +             ${PN}-bcm54591 \
>               ${PN}-cirrus-license ${PN}-cirrus \
>               ${PN}-cnm-license ${PN}-cnm \
>               ${PN}-atheros-license ${PN}-ar5523 ${PN}-ar9170 ${PN}-ath6k=
 ${PN}-ath9k ${PN}-ath3k \
> @@ -570,12 +660,12 @@ PACKAGES =3D+ "${PN}-amphion-vpu-license ${PN}-amph=
ion-vpu \
>               ${PN}-i915-license ${PN}-i915 \
>               ${PN}-ice-license ${PN}-ice \
>               ${PN}-ice-enhanced-license ${PN}-ice-enhanced \
> -             ${PN}-adsp-sst-license ${PN}-adsp-sst \
> +             ${PN}-adsp-sst-license ${PN}-adsp-sst ${PN}-snd-soc-avs \
>               ${PN}-bnx2 \
>               ${PN}-bnx2x \
>               ${PN}-liquidio \
>               ${PN}-linaro-license \
> -             ${PN}-mali-csffw-arch108 ${PN}-mali-csffw-license \
> +             ${PN}-mali-csffw-arch108 ${PN}-mali-csffw-arch1010 ${PN}-ma=
li-csffw-arch1012 ${PN}-mali-csffw-arch118 ${PN}-mali-csffw-arch128 ${PN}-m=
ali-csffw-arch138 ${PN}-mali-csffw-license \
>               ${PN}-mellanox \
>               ${PN}-nvidia-license \
>               ${PN}-nvidia-tegra-k1 ${PN}-nvidia-tegra \
> @@ -590,6 +680,7 @@ PACKAGES =3D+ "${PN}-amphion-vpu-license ${PN}-amphio=
n-vpu \
>               ${PN}-nxp9098-sdio \
>               ${PN}-nxpiw416-sdio \
>               ${PN}-nxpiw612-sdio \
> +             ${PN}-nxp-sr1xx \
>               ${PN}-nxp-mc-license ${PN}-nxp-mc \
>               ${PN}-netronome-license ${PN}-netronome \
>               ${PN}-olpc-license ${PN}-olpc \
> @@ -647,6 +738,82 @@ PACKAGES =3D+ "${PN}-amphion-vpu-license ${PN}-amphi=
on-vpu \
>               ${PN}-xc4000-license ${PN}-xc4000 \
>               ${PN}-xc5000-license ${PN}-xc5000 \
>               ${PN}-xc5000c-license ${PN}-xc5000c \
> +             ${PN}-typhoon-license ${PN}-typhoon \
> +             ${PN}-intel-license ${PN}-ish-lnlm \
> +             ${PN}-lenovo-license ${PN}-ish-lnlm-53c4ffad-2a17559f \
> +             ${PN}-advansys-license ${PN}-advansys \
> +             ${PN}-aeonsemi-license ${PN}-as21xxx \
> +             ${PN}-agere-license ${PN}-orinoco \
> +             ${PN}-airoha-license ${PN}-en8811h ${PN}-airoha-npu \
> +             ${PN}-amd-sev-license ${PN}-ccp \
> +             ${PN}-amdnpu-license ${PN}-amdxdna \
> +             ${PN}-amd-pmf-license ${PN}-amd-pmf \
> +             ${PN}-amd-ucode-license ${PN}-microcode-amd \
> +             ${PN}-amlogic-license ${PN}-amlogic \
> +             ${PN}-abilis-license ${PN}-as102 \
> +             ${PN}-starfire \
> +             ${PN}-atmel-license ${PN}-wilc1000 ${PN}-wilc3000 \
> +             ${PN}-atusb \
> +             ${PN}-dvb-ttpci \
> +             ${PN}-bmi260-license ${PN}-bmi260 \
> +             ${PN}-cadence-license ${PN}-mhdp8546 \
> +             ${PN}-cavium-license ${PN}-cnn55xx \
> +             ${PN}-bfa-license ${PN}-cbfw ${PN}-ctfw ${PN}-ct2fw \
> +             ${PN}-pcnet-cs ${PN}-3c589-cs ${PN}-3c574-cs ${PN}-serial-c=
s \
> +             ${PN}-sw-serial \
> +             ${PN}-siano-license ${PN}-smsmdtv \
> +             ${PN}-cpia2 \
> +             ${PN}-ca0132-license ${PN}-ca0132 \
> +             ${PN}-cxgb3-license ${PN}-cxgb3 \
> +             ${PN}-chelsio-firmware-license ${PN}-cxgb4 \
> +             ${PN}-dabusb-license ${PN}-dabusb \
> +             ${PN}-dsp56k \
> +             ${PN}-dib0700-license ${PN}-dib0700 \
> +             ${PN}-it913x-license ${PN}-it9135 \
> +             ${PN}-drxk-license ${PN}-drxk \
> +             ${PN}-e100-license ${PN}-e100 \
> +             ${PN}-io-ti ${PN}-io-edgeport \
> +             ${PN}-emi26-license ${PN}-emi26 \
> +             ${PN}-ene-firmware-license ${PN}-ene-ub6250 \
> +             ${PN}-snd-maestro3 \
> +             ${PN}-go7007-s2250-license ${PN}-go7007-s2250 \
> +             ${PN}-go7007-license ${PN}-go7007 \
> +             ${PN}-hfi1-license ${PN}-hfi1 \
> +             ${PN}-inside-secure-license ${PN}-inside-secure \
> +             ${PN}-intcsst2-license ${PN}-snd-soc-catpt \
> +             ${PN}-fw-sst-0f28-license ${PN}-snd-intel-sst-core \
> +             ${PN}-ivsc-license ${PN}-atomisp ${PN}-intel-ipu6-isys ${PN=
}-mei-vsc-hw \
> +             ${PN}-ipu3-firmware-license ${PN}-ipu3-imgu \
> +             ${PN}-intel-ipu7-isys \
> +             ${PN}-intel-vpu-license ${PN}-intel-vpu \
> +             ${PN}-isci \
> +             ${PN}-ixp4xx-license ${PN}-ixp4xx-npe \
> +             ${PN}-kaweth-license ${PN}-kaweth \
> +             ${PN}-keyspan-license ${PN}-keyspan \
> +             ${PN}-keyspan-pda \
> +             ${PN}-mga-license ${PN}-mga \
> +             ${PN}-myri10ge-firmware-license ${PN}-myri10ge \
> +             ${PN}-smc91c92-cs \
> +             ${PN}-qla1280-license ${PN}-qla1280 \
> +             ${PN}-ib-qib-license ${PN}-ib-qib \
> +             ${PN}-r8a779x-usb3-license ${PN}-xhci-rcar \
> +             ${PN}-r128 \
> +             ${PN}-rt1320-license ${PN}-rt1320 \
> +             ${PN}-rp2-license ${PN}-rp2 \
> +             ${PN}-s5p-mfc-license ${PN}-s5p-mfc \
> +             ${PN}-snd-sb16-csp \
> +             ${PN}-alacritech-license ${PN}-slicoss ${PN}-sxg \
> +             ${PN}-tehuti-license ${PN}-tehuti \
> +             ${PN}-tigon-license ${PN}-tg3 \
> +             ${PN}-tlg2300-license ${PN}-tlg2300 \
> +             ${PN}-montage-license ${PN}-mont-tsse \
> +             ${PN}-ueagle-atm4-firmware-license ${PN}-ueagle-atm \
> +             ${PN}-usbdux \
> +             ${PN}-conexant-license ${PN}-cx231xx ${PN}-cx23418 ${PN}-cx=
23885 ${PN}-cx23840 \
> +             ${PN}-vxge-license ${PN}-vxge \
> +             ${PN}-whiteheat \
> +             ${PN}-qualcommatheros-ath10k-license ${PN}-wil6210 \
> +             ${PN}-xe-license ${PN}-xe \
>               ${PN}-license \
>               "
>
> @@ -664,7 +831,10 @@ RDEPENDS:${PN}-amphion-vpu +=3D "${PN}-amphion-vpu-l=
icense"
>  LICENSE:${PN}-cw1200 =3D "Firmware-cw1200"
>  LICENSE:${PN}-cw1200-license =3D "Firmware-cw1200"
>
> -FILES:${PN}-cw1200 =3D "${nonarch_base_libdir}/firmware/wsm_22.bin*"
> +FILES:${PN}-cw1200 =3D " \
> +    ${nonarch_base_libdir}/firmware/sdd_sagrad_1091_1098.bin* \
> +    ${nonarch_base_libdir}/firmware/wsm_22.bin* \
> +"
>  FILES:${PN}-cw1200-license =3D "${nonarch_base_libdir}/firmware/LICENCE.=
cw1200"
>
>  RDEPENDS:${PN}-cw1200 +=3D "${PN}-cw1200-license"
> @@ -1136,12 +1306,32 @@ FILES:${PN}-lontium-license =3D "${nonarch_base_l=
ibdir}/firmware/LICENSE.Lontium"
>  FILES:${PN}-lt9611uxc =3D "${nonarch_base_libdir}/firmware/lt9611uxc_fw.=
bin*"
>
>  # For Arm Mali
> -LICENSE:${PN}-mali-csffw-arch108 =3D "Firmware-mali_csffw"
>  FILES:${PN}-mali-csffw-license =3D "${nonarch_base_libdir}/firmware/LICE=
NCE.mali_csffw"
> -FILES:${PN}-mali-csffw-arch108 =3D "${nonarch_base_libdir}/firmware/arm/=
mali/arch10.8/mali_csffw.bin*"
>
> +LICENSE:${PN}-mali-csffw-arch108 =3D "Firmware-mali_csffw"
> +FILES:${PN}-mali-csffw-arch108 =3D "${nonarch_base_libdir}/firmware/arm/=
mali/arch10.8/mali_csffw.bin*"
>  RDEPENDS:${PN}-mali-csffw-arch108 +=3D "${PN}-mali-csffw-license"
>
> +LICENSE:${PN}-mali-csffw-arch1010 =3D "Firmware-mali_csffw"
> +FILES:${PN}-mali-csffw-arch1010 =3D "${nonarch_base_libdir}/firmware/arm=
/mali/arch10.10/mali_csffw.bin*"
> +RDEPENDS:${PN}-mali-csffw-arch1010 +=3D "${PN}-mali-csffw-license"
> +
> +LICENSE:${PN}-mali-csffw-arch1012 =3D "Firmware-mali_csffw"
> +FILES:${PN}-mali-csffw-arch1012 =3D "${nonarch_base_libdir}/firmware/arm=
/mali/arch10.12/mali_csffw.bin*"
> +RDEPENDS:${PN}-mali-csffw-arch1012 +=3D "${PN}-mali-csffw-license"
> +
> +LICENSE:${PN}-mali-csffw-arch118 =3D "Firmware-mali_csffw"
> +FILES:${PN}-mali-csffw-arch118 =3D "${nonarch_base_libdir}/firmware/arm/=
mali/arch11.8/mali_csffw.bin*"
> +RDEPENDS:${PN}-mali-csffw-arch118 +=3D "${PN}-mali-csffw-license"
> +
> +LICENSE:${PN}-mali-csffw-arch128 =3D "Firmware-mali_csffw"
> +FILES:${PN}-mali-csffw-arch128 =3D "${nonarch_base_libdir}/firmware/arm/=
mali/arch12.8/mali_csffw.bin*"
> +RDEPENDS:${PN}-mali-csffw-arch128 +=3D "${PN}-mali-csffw-license"
> +
> +LICENSE:${PN}-mali-csffw-arch138 =3D "Firmware-mali_csffw"
> +FILES:${PN}-mali-csffw-arch138 =3D "${nonarch_base_libdir}/firmware/arm/=
mali/arch13.8/mali_csffw.bin*"
> +RDEPENDS:${PN}-mali-csffw-arch138 +=3D "${PN}-mali-csffw-license"
> +
>  # For marvell
>  LICENSE:${PN}-pcie8897 =3D "Firmware-Marvell"
>  LICENSE:${PN}-pcie8997 =3D "Firmware-Marvell"
> @@ -1154,6 +1344,23 @@ LICENSE:${PN}-sd8887 =3D "Firmware-Marvell"
>  LICENSE:${PN}-sd8897 =3D "Firmware-Marvell"
>  LICENSE:${PN}-sd8997 =3D "Firmware-Marvell"
>  LICENSE:${PN}-usb8997 =3D "Firmware-Marvell"
> +LICENSE:${PN}-cf8381 =3D "Firmware-Marvell"
> +LICENSE:${PN}-cf8385 =3D "Firmware-Marvell"
> +LICENSE:${PN}-gspi8682 =3D "Firmware-Marvell"
> +LICENSE:${PN}-gspi8686 =3D "Firmware-Marvell"
> +LICENSE:${PN}-gspi8688 =3D "Firmware-Marvell"
> +LICENSE:${PN}-sd8385 =3D "Firmware-Marvell"
> +LICENSE:${PN}-sd8682 =3D "Firmware-Marvell"
> +LICENSE:${PN}-usb8388 =3D "Firmware-Marvell"
> +LICENSE:${PN}-usb8682 =3D "Firmware-Marvell"
> +LICENSE:${PN}-sd8977 =3D "Firmware-Marvell"
> +LICENSE:${PN}-usb8766 =3D "Firmware-Marvell"
> +LICENSE:${PN}-usb8797 =3D "Firmware-Marvell"
> +LICENSE:${PN}-usb8801 =3D "Firmware-Marvell"
> +LICENSE:${PN}-usb8897 =3D "Firmware-Marvell"
> +LICENSE:${PN}-rvu-cptpf =3D "Firmware-Marvell"
> +LICENSE:${PN}-mwl8k =3D "Firmware-Marvell"
> +LICENSE:${PN}-mwlwifi =3D "Firmware-Marvell"
>  LICENSE:${PN}-marvell-license =3D "Firmware-Marvell"
>
>  FILES:${PN}-marvell-license =3D "${nonarch_base_libdir}/firmware/LICENCE=
.Marvell"
> @@ -1166,8 +1373,7 @@ FILES:${PN}-pcie8997 =3D " \
>    ${nonarch_base_libdir}/firmware/mrvl/pcieusb8997_combo_v4.bin* \
>  "
>  FILES:${PN}-sd8686 =3D " \
> -  ${nonarch_base_libdir}/firmware/libertas/sd8686_v9* \
> -  ${nonarch_base_libdir}/firmware/sd8686* \
> +  ${nonarch_base_libdir}/firmware/libertas/sd8686* \
>  "
>  FILES:${PN}-sd8688 =3D " \
>    ${nonarch_base_libdir}/firmware/libertas/sd8688* \
> @@ -1204,6 +1410,23 @@ FILES:${PN}-sd8997 =3D " \
>  FILES:${PN}-usb8997 =3D " \
>    ${nonarch_base_libdir}/firmware/mrvl/usbusb8997_combo_v4.bin* \
>  "
> +FILES:${PN}-cf8381 =3D "${nonarch_base_libdir}/firmware/libertas/cf8381*=
"
> +FILES:${PN}-cf8385 =3D "${nonarch_base_libdir}/firmware/libertas/cf8385*=
"
> +FILES:${PN}-gspi8682 =3D "${nonarch_base_libdir}/firmware/libertas/gspi8=
682*"
> +FILES:${PN}-gspi8686 =3D "${nonarch_base_libdir}/firmware/libertas/gspi8=
686*"
> +FILES:${PN}-gspi8688 =3D "${nonarch_base_libdir}/firmware/libertas/gspi8=
688*"
> +FILES:${PN}-sd8385 =3D "${nonarch_base_libdir}/firmware/libertas/sd8385*=
"
> +FILES:${PN}-sd8682 =3D "${nonarch_base_libdir}/firmware/libertas/sd8682*=
"
> +FILES:${PN}-usb8388 =3D "${nonarch_base_libdir}/firmware/libertas/usb838=
8*"
> +FILES:${PN}-usb8682 =3D "${nonarch_base_libdir}/firmware/libertas/usb868=
2*"
> +FILES:${PN}-sd8977 =3D "${nonarch_base_libdir}/firmware/mrvl/sdsd8977*"
> +FILES:${PN}-usb8766 =3D "${nonarch_base_libdir}/firmware/mrvl/usb8766*"
> +FILES:${PN}-usb8797 =3D "${nonarch_base_libdir}/firmware/mrvl/usb8797*"
> +FILES:${PN}-usb8801 =3D "${nonarch_base_libdir}/firmware/mrvl/usb8801*"
> +FILES:${PN}-usb8897 =3D "${nonarch_base_libdir}/firmware/mrvl/usb8897*"
> +FILES:${PN}-rvu-cptpf =3D "${nonarch_base_libdir}/firmware/mrvl/cpt0*"
> +FILES:${PN}-mwl8k =3D "${nonarch_base_libdir}/firmware/mwl8k/*"
> +FILES:${PN}-mwlwifi =3D "${nonarch_base_libdir}/firmware/mwlwifi/*"
>
>  RDEPENDS:${PN}-sd8686 +=3D "${PN}-marvell-license"
>  RDEPENDS:${PN}-sd8688 +=3D "${PN}-marvell-license"
> @@ -1214,6 +1437,23 @@ RDEPENDS:${PN}-sd8887 +=3D "${PN}-marvell-license"
>  RDEPENDS:${PN}-sd8897 +=3D "${PN}-marvell-license"
>  RDEPENDS:${PN}-sd8997 +=3D "${PN}-marvell-license"
>  RDEPENDS:${PN}-usb8997 +=3D "${PN}-marvell-license"
> +RDEPENDS:${PN}-cf8381 +=3D "${PN}-marvell-license"
> +RDEPENDS:${PN}-cf8385 +=3D "${PN}-marvell-license"
> +RDEPENDS:${PN}-gspi8682 +=3D "${PN}-marvell-license"
> +RDEPENDS:${PN}-gspi8686 +=3D "${PN}-marvell-license"
> +RDEPENDS:${PN}-gspi8688 +=3D "${PN}-marvell-license"
> +RDEPENDS:${PN}-sd8385 +=3D "${PN}-marvell-license"
> +RDEPENDS:${PN}-sd8682 +=3D "${PN}-marvell-license"
> +RDEPENDS:${PN}-usb8388 +=3D "${PN}-marvell-license"
> +RDEPENDS:${PN}-usb8682 +=3D "${PN}-marvell-license"
> +RDEPENDS:${PN}-sd8977 +=3D "${PN}-marvell-license"
> +RDEPENDS:${PN}-usb8766 +=3D "${PN}-marvell-license"
> +RDEPENDS:${PN}-usb8797 +=3D "${PN}-marvell-license"
> +RDEPENDS:${PN}-usb8801 +=3D "${PN}-marvell-license"
> +RDEPENDS:${PN}-usb8897 +=3D "${PN}-marvell-license"
> +RDEPENDS:${PN}-rvu-cptpf +=3D "${PN}-marvell-license"
> +RDEPENDS:${PN}-mwl8k +=3D "${PN}-marvell-license"
> +RDEPENDS:${PN}-mwlwifi +=3D "${PN}-marvell-license"
>
>  # For netronome
>  LICENSE:${PN}-netronome =3D "Firmware-netronome"
> @@ -1247,6 +1487,7 @@ LICENSE:${PN}-nxp9098-pcie =3D "Firmware-nxp"
>  LICENSE:${PN}-nxp9098-sdio =3D "Firmware-nxp"
>  LICENSE:${PN}-nxpiw416-sdio =3D "Firmware-nxp"
>  LICENSE:${PN}-nxpiw612-sdio =3D "Firmware-nxp"
> +LICENSE:${PN}-nxp-sr1xx =3D "Firmware-nxp"
>  LICENSE:${PN}-nxp-license =3D "Firmware-nxp"
>
>  FILES:${PN}-nxp8987-sdio =3D "${nonarch_base_libdir}/firmware/nxp/*8987*=
"
> @@ -1261,6 +1502,7 @@ ALLOW_EMPTY:${PN}-nxp9098-pcie =3D "1"
>  ALLOW_EMPTY:${PN}-nxp9098-sdio =3D "1"
>  FILES:${PN}-nxpiw416-sdio =3D "${nonarch_base_libdir}/firmware/nxp/*iw41=
6*"
>  FILES:${PN}-nxpiw612-sdio =3D "${nonarch_base_libdir}/firmware/nxp/uarts=
pi_n61x_v1.bin.se*"
> +FILES:${PN}-nxp-sr1xx =3D "${nonarch_base_libdir}/firmware/nxp/sr150_fw.=
bin"
>  FILES:${PN}-nxp-license =3D "${nonarch_base_libdir}/firmware/LICENSE.nxp=
"
>
>  RDEPENDS:${PN}-nxp8987-sdio +=3D "${PN}-nxp-license"
> @@ -1272,6 +1514,7 @@ RDEPENDS:${PN}-nxp9098-pcie +=3D "${PN}-nxp9098-com=
mon"
>  RDEPENDS:${PN}-nxp9098-sdio +=3D "${PN}-nxp9098-common"
>  RDEPENDS:${PN}-nxpiw416-sdio +=3D "${PN}-nxp-license"
>  RDEPENDS:${PN}-nxpiw612-sdio +=3D "${PN}-nxp-license"
> +RDEPENDS:${PN}-nxp-sr1xx +=3D "${PN}-nxp-license"
>
>  # For nxp-mc
>  LICENSE:${PN}-nxp-mc =3D "Firmware-nxp_mc_firmware"
> @@ -1348,12 +1591,15 @@ RDEPENDS:${PN}-qla2xxx +=3D "${PN}-qla2xxx-licens=
e"
>  # For RSI RS911x WiFi
>  LICENSE:${PN}-rs9113 =3D "WHENCE"
>  LICENSE:${PN}-rs9116 =3D "WHENCE"
> +LICENSE:${PN}-rsi-91x =3D "WHENCE"
>
>  FILES:${PN}-rs9113 =3D " ${nonarch_base_libdir}/firmware/rsi/rs9113*.rps=
* "
>  FILES:${PN}-rs9116 =3D " ${nonarch_base_libdir}/firmware/rsi/rs9116*.rps=
* "
> +FILES:${PN}-rsi-91x =3D " ${nonarch_base_libdir}/firmware/rsi_91x.fw "
>
>  RDEPENDS:${PN}-rs9113 +=3D "${PN}-whence-license"
>  RDEPENDS:${PN}-rs9116 +=3D "${PN}-whence-license"
> +RDEPENDS:${PN}-rsi-91x +=3D "${PN}-whence-license"
>
>  # For rtl
>  LICENSE:${PN}-rtl8188 =3D "Firmware-rtlwifi_firmware"
> @@ -1364,6 +1610,14 @@ LICENSE:${PN}-rtl8723 =3D "Firmware-rtlwifi_firmwa=
re"
>  LICENSE:${PN}-rtl8761 =3D "Firmware-rtlwifi_firmware"
>  LICENSE:${PN}-rtl8821 =3D "Firmware-rtlwifi_firmware"
>  LICENSE:${PN}-rtl8822 =3D "Firmware-rtlwifi_firmware"
> +LICENSE:${PN}-rtl8192 =3D "Firmware-rtlwifi_firmware"
> +LICENSE:${PN}-rtl8710 =3D "Firmware-rtlwifi_firmware"
> +LICENSE:${PN}-rtl8812 =3D "Firmware-rtlwifi_firmware"
> +LICENSE:${PN}-rtl8851 =3D "Firmware-rtlwifi_firmware"
> +LICENSE:${PN}-rtl8852 =3D "Firmware-rtlwifi_firmware"
> +LICENSE:${PN}-rtl8922 =3D "Firmware-rtlwifi_firmware"
> +LICENSE:${PN}-rtl8703 =3D "Firmware-rtlwifi_firmware"
> +LICENSE:${PN}-rtl8814 =3D "Firmware-rtlwifi_firmware"
>  LICENSE:${PN}-rtl-license =3D "Firmware-rtlwifi_firmware"
>  LICENSE:${PN}-rtl-nic =3D "WHENCE"
>  LICENSE:${PN}-rtl8168 =3D "WHENCE"
> @@ -1390,6 +1644,7 @@ FILES:${PN}-rtl8723 =3D " \
>  "
>  FILES:${PN}-rtl8821 =3D " \
>    ${nonarch_base_libdir}/firmware/rtlwifi/rtl8821*.bin* \
> +  ${nonarch_base_libdir}/firmware/rtw88/README \
>    ${nonarch_base_libdir}/firmware/rtw88/rtw8821*.bin* \
>    ${nonarch_base_libdir}/firmware/rtl_bt/rtl8821*.bin \
>  "
> @@ -1407,6 +1662,30 @@ FILES:${PN}-rtl8822 =3D " \
>  FILES:${PN}-rtl-nic =3D " \
>    ${nonarch_base_libdir}/firmware/rtl_nic/*.fw* \
>  "
> +FILES:${PN}-rtl8192 =3D " \
> +    ${nonarch_base_libdir}/firmware/rtlwifi/rtl8192* \
> +    ${nonarch_base_libdir}/firmware/rtl_bt/rtl8192* \
> +"
> +FILES:${PN}-rtl8710 =3D "${nonarch_base_libdir}/firmware/rtlwifi/rtl8710=
*"
> +FILES:${PN}-rtl8812 =3D " \
> +    ${nonarch_base_libdir}/firmware/rtlwifi/rtl8812* \
> +    ${nonarch_base_libdir}/firmware/rtl_bt/rtl8812* \
> +    ${nonarch_base_libdir}/firmware/rtw88/rtw8812* \
> +"
> +FILES:${PN}-rtl8851 =3D " \
> +    ${nonarch_base_libdir}/firmware/rtl_bt/rtl8851* \
> +    ${nonarch_base_libdir}/firmware/rtw89/rtw8851* \
> +"
> +FILES:${PN}-rtl8852 =3D " \
> +    ${nonarch_base_libdir}/firmware/rtl_bt/rtl8852* \
> +    ${nonarch_base_libdir}/firmware/rtw89/rtw8852* \
> +"
> +FILES:${PN}-rtl8922 =3D " \
> +    ${nonarch_base_libdir}/firmware/rtl_bt/rtl8922* \
> +    ${nonarch_base_libdir}/firmware/rtw89/rtw8922* \
> +"
> +FILES:${PN}-rtl8703 =3D "${nonarch_base_libdir}/firmware/rtw88/rtw8703*"
> +FILES:${PN}-rtl8814 =3D "${nonarch_base_libdir}/firmware/rtw88/rtw8814*"
>
>  RDEPENDS:${PN}-rtl8188 +=3D "${PN}-rtl-license"
>  RDEPENDS:${PN}-rtl8192ce +=3D "${PN}-rtl-license"
> @@ -1416,6 +1695,14 @@ RDEPENDS:${PN}-rtl8723 +=3D "${PN}-rtl-license"
>  RDEPENDS:${PN}-rtl8821 +=3D "${PN}-rtl-license"
>  RDEPENDS:${PN}-rtl8761 +=3D "${PN}-rtl-license"
>  RDEPENDS:${PN}-rtl8822 +=3D "${PN}-rtl-license"
> +RDEPENDS:${PN}-rtl8192 +=3D "${PN}-rtl-license"
> +RDEPENDS:${PN}-rtl8710 +=3D "${PN}-rtl-license"
> +RDEPENDS:${PN}-rtl8812 +=3D "${PN}-rtl-license"
> +RDEPENDS:${PN}-rtl8851 +=3D "${PN}-rtl-license"
> +RDEPENDS:${PN}-rtl8852 +=3D "${PN}-rtl-license"
> +RDEPENDS:${PN}-rtl8922 +=3D "${PN}-rtl-license"
> +RDEPENDS:${PN}-rtl8703 +=3D "${PN}-rtl-license"
> +RDEPENDS:${PN}-rtl8814 +=3D "${PN}-rtl-license"
>  RDEPENDS:${PN}-rtl8168 +=3D "${PN}-whence-license"
>  RDEPENDS:${PN}-rtl-nic +=3D "${PN}-whence-license"
>
> @@ -1488,6 +1775,41 @@ FILES:${PN}-ti-keystone-license =3D " \
>  "
>  RDEPENDS:${PN}-ti-keystone +=3D "${PN}-ti-keystone-license"
>
> +# For ti-tspa-license
> +LICENSE:${PN}-ti-tspa-license =3D "Firmware-ti-tspa"
> +FILES:${PN}-ti-tspa-license =3D "${nonarch_base_libdir}/firmware/LICENCE=
.ti-tspa"
> +
> +# For ti-tas2563 - tas2563 firmware
> +LICENSE:${PN}-ti-tas2563 =3D "Firmware-ti-tspa"
> +FILES:${PN}-ti-tas2563 =3D "\
> +    ${nonarch_base_libdir}/firmware/INT8866RCA2.bin \
> +    ${nonarch_base_libdir}/firmware/TAS2XXX3870.bin \
> +    ${nonarch_base_libdir}/firmware/ti/tas2563/* \
> +"
> +RDEPENDS:${PN}-ti-tas2563 =3D "${PN}-ti-tspa-license"
> +
> +# For ti-tas2781 - tas2781 firmware
> +LICENSE:${PN}-ti-tas2781 =3D "Firmware-ti-tspa"
> +FILES:${PN}-ti-tas2781 =3D "\
> +    ${nonarch_base_libdir}/firmware/TAS2XXX*.bin \
> +    ${nonarch_base_libdir}/firmware/TIAS2781*.bin \
> +    ${nonarch_base_libdir}/firmware/TXNW2781*.bin \
> +    ${nonarch_base_libdir}/firmware/ti/tas2781/* \
> +"
> +RDEPENDS:${PN}-ti-tas2781 =3D "${PN}-ti-tspa-license"
> +
> +# For ti-vpe - Texas Instruments V4L2 driver for Video Processing Engine
> +LICENSE:${PN}-ti-vpe =3D "Firmware-ti-tspa"
> +FILES:${PN}-ti-vpe =3D "${nonarch_base_libdir}/firmware/ti/vpdma-1b8.bin=
"
> +RDEPENDS:${PN}-ti-vpe =3D "${PN}-ti-tspa-license"
> +
> +# For ti_usb_3410_5052 - USB TI 3410/5052 serial device
> +LICENSE:${PN}-ti-usb-3410-5052 =3D "GPL-2.0-or-later"
> +FILES:${PN}-ti-usb-3410-5052 =3D "\
> +    ${nonarch_base_libdir}/firmware/ti_3410.fw \
> +    ${nonarch_base_libdir}/firmware/ti_5052.fw \
> +"
> +
>  # For vt6656
>  LICENSE:${PN}-vt6656 =3D "Firmware-via_vt6656"
>  LICENSE:${PN}-vt6656-license =3D "Firmware-via_vt6656"
> @@ -1549,9 +1871,12 @@ FILES:${PN}-bcm4339 =3D "${nonarch_base_libdir}/fi=
rmware/brcm/brcmfmac4339-sdio.bi
>    ${nonarch_base_libdir}/firmware/cypress/cyfmac4339-sdio.bin* \
>  "
>  FILES:${PN}-bcm43241b0 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfma=
c43241b0-sdio.bin*"
> -FILES:${PN}-bcm43241b4 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfma=
c43241b4-sdio.bin*"
> +FILES:${PN}-bcm43241b4 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfma=
c43241b4-sdio.*"
>  FILES:${PN}-bcm43241b5 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfma=
c43241b5-sdio.bin*"
>  FILES:${PN}-bcm43242a =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac=
43242a.bin*"
> +FILES:${PN}-bcm43012 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac4=
3012-sdio.* \
> +  ${nonarch_base_libdir}/firmware/cypress/cyfmac43012-sdio.* \
> +"
>  FILES:${PN}-bcm43143 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac4=
3143.bin* \
>    ${nonarch_base_libdir}/firmware/brcm/brcmfmac43143-sdio.bin* \
>  "
> @@ -1565,8 +1890,8 @@ FILES:${PN}-bcm4356 =3D "${nonarch_base_libdir}/fir=
mware/brcm/brcmfmac4356-sdio.*
>    ${nonarch_base_libdir}/firmware/cypress/cyfmac4356-sdio.* \
>  "
>  FILES:${PN}-bcm43569 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac4=
3569.bin*"
> -FILES:${PN}-bcm43570 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac4=
3570-pcie.bin* \
> -  ${nonarch_base_libdir}/firmware/cypress/cyfmac43570-pcie.bin* \
> +FILES:${PN}-bcm43570 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac4=
3570-pcie.* \
> +  ${nonarch_base_libdir}/firmware/cypress/cyfmac43570-pcie.* \
>  "
>  FILES:${PN}-bcm4358 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac43=
58-pcie.bin*"
>  FILES:${PN}-bcm43602 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac4=
3602-pcie.bin* \
> @@ -1576,6 +1901,10 @@ FILES:${PN}-bcm4366b =3D "${nonarch_base_libdir}/f=
irmware/brcm/brcmfmac4366b-pcie.
>  FILES:${PN}-bcm4366c =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac4=
366c-pcie.bin*"
>  FILES:${PN}-bcm4371 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac43=
71-pcie.bin*"
>
> +FILES:${PN}-bcm54591 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac5=
4591-pcie.* \
> +  ${nonarch_base_libdir}/firmware/cypress/cyfmac54591-pcie.* \
> +"
> +
>  # for i in `grep brcm WHENCE  | grep ^File | sed 's/File: brcm.//g'`; do=
 pkg=3D`echo $i | sed 's/-[sp40].*//g; s/\.bin//g; s/brcmfmac/bcm/g; s/_hdr=
/-hdr/g; s/BCM/bcm-0bb4-0306/g'`; echo -e "LICENSE:\${PN}-$pkg =3D \"Firmwa=
re-broadcom_bcm43xx\"\nRDEPENDS_\${PN}-$pkg +=3D \"\${PN}-broadcom-license\=
""; done
>  # Currently 1st one and last 6 have cypress LICENSE
>
> @@ -1605,6 +1934,8 @@ LICENSE:${PN}-bcm43241b5 =3D "Firmware-broadcom_bcm=
43xx"
>  RDEPENDS:${PN}-bcm43241b5 +=3D "${PN}-broadcom-license"
>  LICENSE:${PN}-bcm43242a =3D "Firmware-broadcom_bcm43xx"
>  RDEPENDS:${PN}-bcm43242a +=3D "${PN}-broadcom-license"
> +LICENSE:${PN}-bcm43012 =3D "Firmware-broadcom_bcm43xx"
> +RDEPENDS:${PN}-bcm43012 +=3D "${PN}-broadcom-license"
>  LICENSE:${PN}-bcm43143 =3D "Firmware-broadcom_bcm43xx"
>  RDEPENDS:${PN}-bcm43143 +=3D "${PN}-broadcom-license"
>  LICENSE:${PN}-bcm43430a0 =3D "Firmware-broadcom_bcm43xx"
> @@ -1631,6 +1962,8 @@ LICENSE:${PN}-bcm4366c =3D "Firmware-broadcom_bcm43=
xx"
>  RDEPENDS:${PN}-bcm4366c +=3D "${PN}-broadcom-license"
>  LICENSE:${PN}-bcm4371 =3D "Firmware-broadcom_bcm43xx"
>  RDEPENDS:${PN}-bcm4371 +=3D "${PN}-broadcom-license"
> +LICENSE:${PN}-bcm54591 =3D "Firmware-broadcom_bcm43xx"
> +RDEPENDS:${PN}-bcm54591 +=3D "${PN}-broadcom-license"
>
>  # For broadcom cypress
>
> @@ -1638,14 +1971,15 @@ LICENSE:${PN}-cypress-license =3D "Firmware-cypre=
ss"
>  FILES:${PN}-cypress-license =3D "${nonarch_base_libdir}/firmware/LICENCE=
.cypress"
>
>  FILES:${PN}-bcm-0bb4-0306 =3D "${nonarch_base_libdir}/firmware/brcm/BCM-=
0bb4-0306.hcd*"
> +FILES:${PN}-bcm-0a5c-6410 =3D "${nonarch_base_libdir}/firmware/brcm/BCM-=
0a5c-6410.hcd*"
>  FILES:${PN}-bcm43340 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac4=
3340-sdio.* \
>    ${nonarch_base_libdir}/firmware/cypress/cyfmac43340-sdio.*"
>  FILES:${PN}-bcm43362 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac4=
3362-sdio.* \
>    ${nonarch_base_libdir}/firmware/cypress/cyfmac43362-sdio.*"
>  FILES:${PN}-bcm43430 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac4=
3430-sdio.* \
>    ${nonarch_base_libdir}/firmware/cypress/cyfmac43430-sdio.*"
> -FILES:${PN}-bcm4354 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac43=
54-sdio.bin* \
> -  ${nonarch_base_libdir}/firmware/cypress/cyfmac4354-sdio.bin* \
> +FILES:${PN}-bcm4354 =3D "${nonarch_base_libdir}/firmware/brcm/brcmfmac43=
54-sdio.* \
> +  ${nonarch_base_libdir}/firmware/cypress/cyfmac4354-sdio.* \
>  "
>  FILES:${PN}-bcm4356-pcie =3D "${nonarch_base_libdir}/firmware/brcm/brcmf=
mac4356-pcie.* \
>    ${nonarch_base_libdir}/firmware/cypress/cyfmac4356-pcie.* \
> @@ -1659,6 +1993,8 @@ FILES:${PN}-bcm4373 =3D "${nonarch_base_libdir}/fir=
mware/brcm/brcmfmac4373-sdio.bi
>
>  LICENSE:${PN}-bcm-0bb4-0306 =3D "Firmware-cypress"
>  RDEPENDS:${PN}-bcm-0bb4-0306 +=3D "${PN}-cypress-license"
> +LICENSE:${PN}-bcm-0a5c-6410 =3D "Firmware-cypress"
> +RDEPENDS:${PN}-bcm-0a5c-6410 +=3D "${PN}-bcm-0bb4-0306"
>  LICENSE:${PN}-bcm43340 =3D "Firmware-cypress"
>  RDEPENDS:${PN}-bcm43340 +=3D "${PN}-cypress-license"
>  LICENSE:${PN}-bcm43362 =3D "Firmware-cypress"
> @@ -1699,7 +2035,10 @@ RDEPENDS:${PN}-bnx2x +=3D "${PN}-whence-license"
>  LICENSE:${PN}-cirrus =3D "Firmware-cirrus"
>  LICENSE:${PN}-cirrus-license =3D "Firmware-cirrus"
>
> -FILES:${PN}-cirrus =3D "${nonarch_base_libdir}/firmware/cirrus/*"
> +FILES:${PN}-cirrus =3D " \
> +    ${nonarch_base_libdir}/firmware/cs42l43.bin \
> +    ${nonarch_base_libdir}/firmware/cirrus/* \
> +"
>  FILES:${PN}-cirrus-license =3D "${nonarch_base_libdir}/firmware/LICENSE.=
cirrus"
>
>  RDEPENDS:${PN}-cirrus +=3D "${PN}-cirrus-license"
> @@ -1708,7 +2047,7 @@ RDEPENDS:${PN}-cirrus +=3D "${PN}-cirrus-license"
>  LICENSE:${PN}-cnm =3D "Firmware-cnm"
>  LICENSE:${PN}-cnm-license =3D "Firmware-cnm"
>
> -FILES:${PN}-cnm =3D "${nonarch_base_libdir}/firmware/cnm/wave521c_k3_cod=
ec_fw.bin*"
> +FILES:${PN}-cnm =3D "${nonarch_base_libdir}/firmware/cnm/*"
>  FILES:${PN}-cnm-license =3D "${nonarch_base_libdir}/firmware/LICENCE.cnm=
"
>
>  RDEPENDS:${PN}-cnm +=3D "${PN}-cnm-license"
> @@ -1897,9 +2236,14 @@ LICENSE:${PN}-adsp-sst-license    =3D "Firmware-ad=
sp_sst"
>  FILES:${PN}-adsp-sst              =3D "\
>      ${nonarch_base_libdir}/firmware/intel/dsp_fw* \
>      ${nonarch_base_libdir}/firmware/intel/avs/*/dsp_basefw.bin \
> +    ${nonarch_base_libdir}/firmware/intel/avs/skl/dsp_mod_7CAD0808-AB10-=
CD23-EF45-12AB34CD56EF.bin \
>  "
>  RDEPENDS:${PN}-adsp-sst           =3D "${PN}-adsp-sst-license"
>
> +# For snd_soc_avs - Intel AudioDSP driver for cAVS platforms
> +LICENSE:${PN}-snd-soc-avs =3D "Apache-2.0"
> +FILES:${PN}-snd-soc-avs =3D "${nonarch_base_libdir}/firmware/intel/avs/*=
"
> +
>  # For QAT
>  LICENSE:${PN}-qat         =3D "Firmware-qat"
>  LICENSE:${PN}-qat-license =3D "Firmware-qat"
> @@ -2061,7 +2405,11 @@ FILES:${PN}-qcom-qrb4210-compute =3D "${nonarch_ba=
se_libdir}/firmware/qcom/qrb4210
>  FILES:${PN}-qcom-qrb4210-modem =3D "${nonarch_base_libdir}/firmware/qcom=
/qrb4210/modem*.*"
>  FILES:${PN}-qcom-qrb4210-wifi =3D "${nonarch_base_libdir}/firmware/qcom/=
qrb4210/wlanmdsp.mbn* ${nonarch_base_libdir}/firmware/ath10k/WCN3990/hw1.0/=
qrb4210/*"
>  FILES:${PN}-qcom-sa8775p-adreno =3D "${nonarch_base_libdir}/firmware/qco=
m/sa8775p/a663_zap.mbn*"
> -FILES:${PN}-qcom-sa8775p-audio =3D "${nonarch_base_libdir}/firmware/qcom=
/sa8775p/adsp*.* ${nonarch_base_libdir}/firmware/qcom/qcs9100/LEMANS-EVK-tp=
lg.bin*"
> +FILES:${PN}-qcom-sa8775p-audio =3D "\
> +    ${nonarch_base_libdir}/firmware/qcom/sa8775p/adsp*.* \
> +    ${nonarch_base_libdir}/firmware/qcom/sa8775p/LEMANS-EVK-tplg.bin \
> +    ${nonarch_base_libdir}/firmware/qcom/qcs9100/LEMANS-EVK-tplg.bin \
> +"
>  FILES:${PN}-qcom-sa8775p-compute =3D "${nonarch_base_libdir}/firmware/qc=
om/sa8775p/cdsp*.*"
>  FILES:${PN}-qcom-sa8775p-generalpurpose =3D "${nonarch_base_libdir}/firm=
ware/qcom/sa8775p/gpdsp*.*"
>  FILES:${PN}-qcom-sa8775p-qupv3fw =3D "${nonarch_base_libdir}/firmware/qc=
om/sa8775p/qupv3fw.elf*"
> @@ -2217,6 +2565,656 @@ FILES:${PN}-amlogic-vdec-license =3D "${nonarch_b=
ase_libdir}/firmware/LICENSE.amlo
>  FILES:${PN}-amlogic-vdec =3D "${nonarch_base_libdir}/firmware/meson/vdec=
/*"
>  RDEPENDS:${PN}-amlogic-vdec =3D "${PN}-amlogic-vdec-license"
>
> +# For 3com typhoon
> +LICENSE:${PN}-typhoon-license =3D "Firmware-typhoon"
> +LICENSE:${PN}-typhoon =3D "Firmware-typhoon"
> +FILES:${PN}-typhoon-license =3D "${nonarch_base_libdir}/firmware/LICENCE=
.typhoon"
> +FILES:${PN}-typhoon =3D "${nonarch_base_libdir}/firmware/3com/typhoon.bi=
n"
> +RDEPENDS:${PN}-typhoon =3D "${PN}-typhoon-license"
> +
> +# For ish - Intel Integrated Sensor Hub
> +LICENSE:${PN}-intel-license =3D "Firmware-intel"
> +FILES:${PN}-intel-license =3D "${nonarch_base_libdir}/firmware/LICENSE.i=
ntel"
> +
> +LICENSE:${PN}-ish-lnlm =3D "Firmware-intel"
> +FILES:${PN}-ish-lnlm =3D "${nonarch_base_libdir}/firmware/intel/ish/ish_=
lnlm.bin"
> +RDEPENDS:${PN}-ish-lnlm =3D "${PN}-intel-license"
> +
> +# For LENOVO ish - Intel Integrated Sensor Hub
> +LICENSE:${PN}-lenovo-license =3D "Firmware-lenovo"
> +FILES:${PN}-lenovo-license =3D "${nonarch_base_libdir}/firmware/LICENCE.=
lenovo"
> +
> +LICENSE:${PN}-ish-lnlm-53c4ffad-2a17559f =3D "Firmware-lenovo"
> +FILES:${PN}-ish-lnlm-53c4ffad-2a17559f =3D "\
> +    ${nonarch_base_libdir}/firmware/LENOVO/ish/ish_lnlm_53c4ffad_2a17559=
f.bin \
> +    ${nonarch_base_libdir}/firmware/intel/ish/ish_lnlm_53c4ffad_2a17559f=
.bin \
> +"
> +RDEPENDS:${PN}-ish-lnlm-53c4ffad-2a17559f =3D "${PN}-lenovo-license"
> +
> +# For advansys - AdvanSys SCSI
> +LICENSE:${PN}-advansys-license =3D "Firmware-advansys"
> +FILES:${PN}-advansys-license =3D "${nonarch_base_libdir}/firmware/LICENC=
E.advansys"
> +
> +LICENSE:${PN}-advansys =3D "Firmware-advansys"
> +FILES:${PN}-advansys =3D "${nonarch_base_libdir}/firmware/advansys/*"
> +RDEPENDS:${PN}-advansys =3D "${PN}-advansys-license"
> +
> +# For as21xxx
> +LICENSE:${PN}-aeonsemi-license =3D "Firmware-aeonsemi"
> +FILES:${PN}-aeonsemi-license =3D "${nonarch_base_libdir}/firmware/LICENS=
E.aeonsemi"
> +
> +LICENSE:${PN}-as21xxx =3D "Firmware-aeonsemi"
> +FILES:${PN}-as21xxx =3D "${nonarch_base_libdir}/firmware/aeonsemi/*"
> +RDEPENDS:${PN}-as21xxx =3D "${PN}-aeonsemi-license"
> +
> +# For orinoco - Agere/Prism/Symbol Orinoco support
> +LICENSE:${PN}-agere-license =3D "Firmware-agere"
> +FILES:${PN}-agere-license =3D "${nonarch_base_libdir}/firmware/LICENCE.a=
gere"
> +
> +LICENSE:${PN}-orinoco =3D "Firmware-agere"
> +FILES:${PN}-orinoco =3D "${nonarch_base_libdir}/firmware/agere_*"
> +RDEPENDS:${PN}-orinoco =3D "${PN}-agere-license"
> +
> +# For en8811h - Airoha 2.5G Ethernet Phy
> +LICENSE:${PN}-airoha-license =3D "Firmware-airoha"
> +FILES:${PN}-airoha-license =3D "${nonarch_base_libdir}/firmware/LICENSE.=
airoha"
> +
> +LICENSE:${PN}-en8811h =3D "Firmware-airoha"
> +FILES:${PN}-en8811h =3D "${nonarch_base_libdir}/firmware/airoha/EthMD32*=
"
> +RDEPENDS:${PN}-en8811h =3D "${PN}-airoha-license"
> +
> +# For airoha-npu - Airoha Network Processor Unit driver
> +LICENSE:${PN}-airoha-npu =3D "Firmware-airoha"
> +FILES:${PN}-airoha-npu =3D "${nonarch_base_libdir}/firmware/airoha/en758=
1_npu*"
> +RDEPENDS:${PN}-airoha-npu =3D "${PN}-airoha-license"
> +
> +# For ccp - Platform Security Processor (PSP) device
> +LICENSE:${PN}-amd-sev-license =3D "Firmware-amd-sev"
> +FILES:${PN}-amd-sev-license =3D "${nonarch_base_libdir}/firmware/LICENSE=
.amd-sev"
> +
> +LICENSE:${PN}-ccp =3D "Firmware-amd-sev"
> +FILES:${PN}-ccp =3D "${nonarch_base_libdir}/firmware/amd/amd_sev*"
> +RDEPENDS:${PN}-ccp =3D "${PN}-amd-sev-license"
> +
> +# For amdxdna - AMD Inference processor
> +LICENSE:${PN}-amdnpu-license =3D "Firmware-amdnpu"
> +FILES:${PN}-amdnpu-license =3D "${nonarch_base_libdir}/firmware/LICENSE.=
amdnpu"
> +
> +LICENSE:${PN}-amdxdna =3D "Firmware-amdnpu"
> +FILES:${PN}-amdxdna =3D "${nonarch_base_libdir}/firmware/amdnpu/*"
> +RDEPENDS:${PN}-amdxdna =3D "${PN}-amdnpu-license"
> +
> +# For amd_pmf - AMD Platform Management Framework TA
> +LICENSE:${PN}-amd-pmf-license =3D "Firmware-amd_pmf"
> +FILES:${PN}-amd-pmf-license =3D "${nonarch_base_libdir}/firmware/LICENSE=
.amd_pmf"
> +
> +LICENSE:${PN}-amd-pmf =3D "Firmware-amd_pmf"
> +FILES:${PN}-amd-pmf =3D "${nonarch_base_libdir}/firmware/amdtee/*"
> +RDEPENDS:${PN}-amd-pmf =3D "${PN}-amd-pmf-license"
> +
> +# For microcode_amd - AMD CPU Microcode Update Driver for Linux
> +LICENSE:${PN}-amd-ucode-license =3D "Firmware-amd-ucode"
> +FILES:${PN}-amd-ucode-license =3D "${nonarch_base_libdir}/firmware/LICEN=
SE.amd-ucode"
> +
> +LICENSE:${PN}-microcode-amd =3D "Firmware-amd-ucode"
> +FILES:${PN}-microcode-amd =3D "${nonarch_base_libdir}/firmware/amd-ucode=
/*"
> +RDEPENDS:${PN}-microcode-amd =3D "${PN}-amd-ucode-license"
> +
> +# For amlogic - Amlogic SoC Firmware
> +LICENSE:${PN}-amlogic-license =3D "Firmware-amlogic"
> +FILES:${PN}-amlogic-license =3D "${nonarch_base_libdir}/firmware/LICENSE=
.amlogic"
> +
> +LICENSE:${PN}-amlogic =3D "Firmware-amlogic"
> +FILES:${PN}-amlogic =3D "${nonarch_base_libdir}/firmware/amlogic/aml_*"
> +RDEPENDS:${PN}-amlogic =3D "${PN}-amlogic-license"
> +
> +# For starfire - Adaptec Starfire/DuraLAN support
> +LICENSE:${PN}-starfire =3D "GPL-2.0-only"
> +FILES:${PN}-starfire =3D "${nonarch_base_libdir}/firmware/adaptec/starfi=
re*"
> +
> +# For as102 - Abilis Systems Single DVB-T Receiver
> +LICENSE:${PN}-abilis-license =3D "Firmware-Abilis"
> +FILES:${PN}-abilis-license =3D "${nonarch_base_libdir}/firmware/LICENCE.=
Abilis"
> +
> +LICENSE:${PN}-as102 =3D "Firmware-Abilis"
> +FILES:${PN}-as102 =3D "${nonarch_base_libdir}/firmware/as102_data*_st.he=
x"
> +RDEPENDS:${PN}-as102 =3D "${PN}-abilis-license"
> +
> +# For wilc1000 - Atmel 802.11n WLAN driver for WILC1000 & WILC3000
> +LICENSE:${PN}-atmel-license =3D "Firmware-atmel"
> +FILES:${PN}-atmel-license =3D "${nonarch_base_libdir}/firmware/LICENSE.a=
tmel"
> +
> +LICENSE:${PN}-wilc1000 =3D "Firmware-atmel"
> +FILES:${PN}-wilc1000 =3D "${nonarch_base_libdir}/firmware/atmel/wilc1000=
*"
> +RDEPENDS:${PN}-wilc1000 =3D "${PN}-atmel-license"
> +
> +LICENSE:${PN}-wilc3000 =3D "Firmware-atmel"
> +FILES:${PN}-wilc3000 =3D "${nonarch_base_libdir}/firmware/atmel/wilc3000=
*"
> +RDEPENDS:${PN}-wilc3000 =3D "${PN}-atmel-license"
> +
> +# For atusb - ATUSB IEEE 802.15.4 transceiver driver
> +FILES:${PN}-atusb =3D "${nonarch_base_libdir}/firmware/atusb/*"
> +LICENSE:${PN}-atusb =3D "GPL-2.0-or-later"
> +
> +# For dvb-ttpci - AV7110 cards
> +FILES:${PN}-dvb-ttpci =3D "${nonarch_base_libdir}/firmware/av7110/*"
> +LICENSE:${PN}-dvb-ttpci =3D "GPL-2.0-or-later"
> +
> +# For bmi260 - Bosch BMI260 IMU configuration data
> +LICENSE:${PN}-bmi260-license =3D "Firmware-bmi260"
> +FILES:${PN}-bmi260-license =3D "${nonarch_base_libdir}/firmware/LICENSE.=
bmi260"
> +
> +LICENSE:${PN}-bmi260 =3D "Firmware-bmi260"
> +FILES:${PN}-bmi260 =3D "${nonarch_base_libdir}/firmware/bmi260-init-data=
.fw"
> +RDEPENDS:${PN}-bmi260 =3D "${PN}-bmi260-license"
> +
> +# For cdns-mhdp - Cadence MHDP8546 DP bridge
> +LICENSE:${PN}-cadence-license =3D "Firmware-cadence"
> +FILES:${PN}-cadence-license =3D "${nonarch_base_libdir}/firmware/LICENCE=
.cadence"
> +
> +LICENSE:${PN}-mhdp8546 =3D "Firmware-cadence"
> +FILES:${PN}-mhdp8546 =3D "${nonarch_base_libdir}/firmware/cadence/mhdp85=
46.bin"
> +RDEPENDS:${PN}-mhdp8546 =3D "${PN}-cadence-license"
> +
> +# For nitrox - Cavium CNN55XX crypto driver
> +LICENSE:${PN}-cavium-license =3D "Firmware-cavium"
> +FILES:${PN}-cavium-license =3D "${nonarch_base_libdir}/firmware/LICENCE.=
cavium"
> +
> +LICENSE:${PN}-cnn55xx =3D "Firmware-cavium"
> +FILES:${PN}-cnn55xx =3D "${nonarch_base_libdir}/firmware/cavium/cnn55xx*=
"
> +RDEPENDS:${PN}-cnn55xx =3D "${PN}-cavium-license"
> +
> +# For BFA/BNA - QLogic BR-series Adapter FC/FCOE drivers
> +LICENSE:${PN}-bfa-license =3D "Firmware-bfa"
> +FILES:${PN}-bfa-license =3D "${nonarch_base_libdir}/firmware/LICENSE.bfa=
"
> +
> +LICENSE:${PN}-cbfw =3D "Firmware-bfa"
> +FILES:${PN}-cbfw =3D "${nonarch_base_libdir}/firmware/cbfw-3.2.5.1.bin"
> +RDEPENDS:${PN}-cbfw =3D "${PN}-bfa-license"
> +
> +LICENSE:${PN}-ctfw =3D "Firmware-bfa"
> +FILES:${PN}-ctfw =3D "${nonarch_base_libdir}/firmware/ctfw-3.2.5.1.bin"
> +RDEPENDS:${PN}-ctfw =3D "${PN}-bfa-license"
> +
> +LICENSE:${PN}-ct2fw =3D "Firmware-bfa"
> +FILES:${PN}-ct2fw =3D "${nonarch_base_libdir}/firmware/ct2fw-3.2.5.1.bin=
"
> +RDEPENDS:${PN}-ct2fw =3D "${PN}-bfa-license"
> +
> +# For pcnet_cs - NE2000 compatible PCMCIA adapter
> +FILES:${PN}-pcnet-cs =3D " \
> +    ${nonarch_base_libdir}/firmware/cis/LA-PCM.cis \
> +    ${nonarch_base_libdir}/firmware/cis/PCMLM28.cis \
> +    ${nonarch_base_libdir}/firmware/cis/DP83903.cis \
> +    ${nonarch_base_libdir}/firmware/cis/NE2K.cis \
> +    ${nonarch_base_libdir}/firmware/cis/tamarack.cis \
> +    ${nonarch_base_libdir}/firmware/cis/PE-200.cis \
> +    ${nonarch_base_libdir}/firmware/cis/PE520.cis \
> +"
> +LICENSE:${PN}-pcnet-cs =3D "GPL-2.0-only & MPL-1.1"
> +
> +# For 3c589_cs - 3Com PCMCIA adapter
> +FILES:${PN}-3c589-cs =3D "${nonarch_base_libdir}/firmware/cis/3CXEM556.c=
is"
> +LICENSE:${PN}-3c589-cs =3D "GPL-2.0-only & MPL-1.1"
> +
> +# For 3c574-cs - 3Com PCMCIA adapter
> +FILES:${PN}-3c574-cs =3D "${nonarch_base_libdir}/firmware/cis/3CCFEM556.=
cis"
> +LICENSE:${PN}-3c574-cs =3D "GPL-2.0-only & MPL-1.1"
> +
> +# For serial_cs - Serial PCMCIA adapter (pcmcia-cs project)
> +FILES:${PN}-serial-cs =3D " \
> +    ${nonarch_base_libdir}/firmware/cis/MT5634ZLX.cis \
> +    ${nonarch_base_libdir}/firmware/cis/RS-COM-2P.cis \
> +    ${nonarch_base_libdir}/firmware/cis/COMpad2.cis \
> +    ${nonarch_base_libdir}/firmware/cis/COMpad4.cis \
> +"
> +LICENSE:${PN}-serial-cs =3D "GPL-2.0-only & MPL-1.1"
> +
> +# For Sierra Wireless serial_cs - Serial PCMCIA adapter
> +FILES:${PN}-sw-serial =3D " \
> +    ${nonarch_base_libdir}/firmware/cis/SW_555_SER.cis \
> +    ${nonarch_base_libdir}/firmware/cis/SW_7xx_SER.cis \
> +    ${nonarch_base_libdir}/firmware/cis/SW_8xx_SER.cis \
> +"
> +LICENSE:${PN}-sw-serial =3D "GPL-3.0-only"
> +
> +# For smsmdtv - Siano MDTV Core module
> +LICENSE:${PN}-siano-license =3D "Firmware-siano"
> +FILES:${PN}-siano-license =3D "${nonarch_base_libdir}/firmware/LICENCE.s=
iano"
> +
> +LICENSE:${PN}-smsmdtv =3D "Firmware-siano"
> +FILES:${PN}-smsmdtv =3D " \
> +    ${nonarch_base_libdir}/firmware/cmmb_vega_12mhz.inp \
> +    ${nonarch_base_libdir}/firmware/cmmb_venice_12mhz.inp \
> +    ${nonarch_base_libdir}/firmware/dvb_nova_12mhz.inp \
> +    ${nonarch_base_libdir}/firmware/dvb_nova_12mhz_b0.inp \
> +    ${nonarch_base_libdir}/firmware/isdbt_nova_12mhz.inp \
> +    ${nonarch_base_libdir}/firmware/isdbt_nova_12mhz_b0.inp \
> +    ${nonarch_base_libdir}/firmware/isdbt_rio.inp \
> +    ${nonarch_base_libdir}/firmware/sms1xxx-hcw-55xxx-dvbt-02.fw \
> +    ${nonarch_base_libdir}/firmware/sms1xxx-hcw-55xxx-isdbt-02.fw \
> +    ${nonarch_base_libdir}/firmware/sms1xxx-nova-a-dvbt-01.fw \
> +    ${nonarch_base_libdir}/firmware/sms1xxx-nova-b-dvbt-01.fw \
> +    ${nonarch_base_libdir}/firmware/sms1xxx-stellar-dvbt-01.fw \
> +    ${nonarch_base_libdir}/firmware/tdmb_nova_12mhz.inp \
> +"
> +RDEPENDS:${PN}-smsmdtv =3D "${PN}-siano-license"
> +
> +# For cpia2 - cameras based on Vision's CPiA2
> +FILES:${PN}-cpia2 =3D "${nonarch_base_libdir}/firmware/cpia2/*"
> +LICENSE:${PN}-cpia2 =3D "GPL-2.0-or-later"
> +
> +# For snd-hda-codec-ca0132 - Creative Sound Core3D codec
> +LICENSE:${PN}-ca0132-license =3D "Firmware-ca0132"
> +FILES:${PN}-ca0132-license =3D "${nonarch_base_libdir}/firmware/LICENCE.=
ca0132"
> +
> +LICENSE:${PN}-ca0132 =3D "Firmware-ca0132"
> +FILES:${PN}-ca0132 =3D " \
> +    ${nonarch_base_libdir}/firmware/ctefx.bin \
> +    ${nonarch_base_libdir}/firmware/ctspeq.bin \
> +"
> +RDEPENDS:${PN}-ca0132 =3D "${PN}-ca0132-license"
> +
> +# For cxgb3 - Chelsio Terminator 3 1G/10G Ethernet adapter
> +LICENSE:${PN}-cxgb3-license =3D "Firmware-cxgb3"
> +FILES:${PN}-cxgb3-license =3D "${nonarch_base_libdir}/firmware/LICENCE.c=
xgb3"
> +
> +LICENSE:${PN}-cxgb3 =3D "Firmware-cxgb3 & GPL-2.0-only"
> +FILES:${PN}-cxgb3 =3D "${nonarch_base_libdir}/firmware/cxgb3/*"
> +RDEPENDS:${PN}-cxgb3 =3D "${PN}-cxgb3-license"
> +
> +# For cxgb4 - Chelsio Terminator 4/5/6 1/10/25/40/100G Ethernet adapter
> +LICENSE:${PN}-chelsio-firmware-license =3D "Firmware-chelsio_firmware"
> +FILES:${PN}-chelsio-firmware-license =3D "${nonarch_base_libdir}/firmwar=
e/LICENCE.chelsio_firmware"
> +
> +LICENSE:${PN}-cxgb4 =3D "Firmware-chelsio_firmware"
> +FILES:${PN}-cxgb4 =3D "${nonarch_base_libdir}/firmware/cxgb4/*"
> +RDEPENDS:${PN}-cxgb4 =3D "${PN}-chelsio-firmware-license"
> +
> +# For dabusb - Digital Audio Broadcasting (DAB) Receiver for USB and Lin=
ux
> +LICENSE:${PN}-dabusb-license =3D "Firmware-dabusb"
> +FILES:${PN}-dabusb-license =3D "${nonarch_base_libdir}/firmware/LICENCE.=
dabusb"
> +
> +LICENSE:${PN}-dabusb =3D "Firmware-dabusb"
> +FILES:${PN}-dabusb =3D "${nonarch_base_libdir}/firmware/dabusb/*"
> +RDEPENDS:${PN}-dabusb =3D "${PN}-dabusb-license"
> +
> +# For dsp56k - Atari DSP56k support
> +LICENSE:${PN}-dsp56k =3D "GPL-2.0-or-later"
> +FILES:${PN}-dsp56k =3D "${nonarch_base_libdir}/firmware/dsp56k/*"
> +
> +# For dib0700 - DiBcom dib0700 USB DVB bridge driver
> +LICENSE:${PN}-dib0700-license =3D "Firmware-dib0700"
> +FILES:${PN}-dib0700-license =3D "${nonarch_base_libdir}/firmware/LICENSE=
.dib0700"
> +
> +LICENSE:${PN}-dib0700 =3D "Firmware-dib0700"
> +FILES:${PN}-dib0700 =3D "${nonarch_base_libdir}/firmware/dvb-usb-dib0700=
-1.20.fw"
> +RDEPENDS:${PN}-dib0700 =3D "${PN}-dib0700-license"
> +
> +# For it9135 - ITEtech IT913x DVB-T USB driver
> +LICENSE:${PN}-it913x-license =3D "Firmware-it913x"
> +FILES:${PN}-it913x-license =3D "${nonarch_base_libdir}/firmware/LICENCE.=
it913x"
> +
> +LICENSE:${PN}-it9135 =3D "Firmware-it913x"
> +FILES:${PN}-it9135 =3D "${nonarch_base_libdir}/firmware/dvb-usb-it9135*"
> +RDEPENDS:${PN}-it9135 =3D "${PN}-it913x-license"
> +
> +# For drxk - Micronas DRX-K demodulator driver
> +LICENSE:${PN}-drxk-license =3D "Firmware-drxk"
> +FILES:${PN}-drxk-license =3D "${nonarch_base_libdir}/firmware/LICENSE.dr=
xk"
> +
> +LICENSE:${PN}-drxk =3D "Firmware-drxk"
> +FILES:${PN}-drxk =3D "${nonarch_base_libdir}/firmware/dvb-usb-terratec-h=
5-drxk.fw"
> +RDEPENDS:${PN}-drxk =3D "${PN}-drxk-license"
> +
> +# For e100 - Intel PRO/100 Ethernet NIC
> +LICENSE:${PN}-e100-license =3D "Firmware-e100"
> +FILES:${PN}-e100-license =3D "${nonarch_base_libdir}/firmware/LICENCE.e1=
00"
> +
> +LICENSE:${PN}-e100 =3D "Firmware-e100"
> +FILES:${PN}-e100 =3D "${nonarch_base_libdir}/firmware/e100/*"
> +RDEPENDS:${PN}-e100 =3D "${PN}-e100-license"
> +
> +# For io_ti - USB Inside Out Edgeport Serial Driver (TI Devices)
> +LICENSE:${PN}-io-ti =3D "GPL-2.0-or-later"
> +FILES:${PN}-io-ti =3D "${nonarch_base_libdir}/firmware/edgeport/down3.bi=
n"
> +
> +# For io_edgeport - USB Inside Out Edgeport Serial Driver
> +LICENSE:${PN}-io-edgeport =3D "GPL-2.0-or-later"
> +FILES:${PN}-io-edgeport =3D "${nonarch_base_libdir}/firmware/edgeport/*"
> +
> +# For emi26 - EMI 2|6 USB Audio interface
> +LICENSE:${PN}-emi26-license =3D "Firmware-emi26"
> +FILES:${PN}-emi26-license =3D "${nonarch_base_libdir}/firmware/LICENCE.e=
mi26"
> +
> +LICENSE:${PN}-emi26 =3D "Firmware-emi26"
> +FILES:${PN}-emi26 =3D "${nonarch_base_libdir}/firmware/emi26/*"
> +RDEPENDS:${PN}-emi26 =3D "${PN}-drxk-license"
> +
> +# For ene-ub6250 - ENE UB6250 SD card reader driver
> +LICENSE:${PN}-ene-firmware-license =3D "Firmware-ene_firmware"
> +FILES:${PN}-ene-firmware-license =3D "${nonarch_base_libdir}/firmware/LI=
CENCE.ene_firmware"
> +
> +LICENSE:${PN}-ene-ub6250 =3D "Firmware-ene_firmware"
> +FILES:${PN}-ene-ub6250 =3D "${nonarch_base_libdir}/firmware/ene-ub6250/*=
"
> +RDEPENDS:${PN}-ene-ub6250 =3D "${PN}-ene-firmware-license"
> +
> +# For go7007-s2250
> +LICENSE:${PN}-go7007-s2250-license =3D "Firmware-go7007-s2250"
> +FILES:${PN}-go7007-s2250-license =3D "${nonarch_base_libdir}/firmware/LI=
CENCE.go7007-s2250"
> +
> +LICENSE:${PN}-go7007-s2250 =3D "Firmware-go7007-s2250"
> +FILES:${PN}-go7007-s2250 =3D " \
> +    ${nonarch_base_libdir}/firmware/go7007/s2250* \
> +    ${nonarch_base_libdir}/firmware/s2250* \
> +"
> +RDEPENDS:${PN}-go7007-s2250 =3D "${PN}-go7007-s2250-license"
> +
> +# For go7007
> +LICENSE:${PN}-go7007-license =3D "Firmware-go7007"
> +FILES:${PN}-go7007-license =3D "${nonarch_base_libdir}/firmware/LICENCE.=
go7007"
> +
> +LICENSE:${PN}-go7007 =3D "Firmware-go7007"
> +FILES:${PN}-go7007 =3D "${nonarch_base_libdir}/firmware/go7007/*"
> +RDEPENDS:${PN}-go7007 =3D "${PN}-go7007-license"
> +
> +# For hfi1 - Intel OPA Gen 1 adapter
> +LICENSE:${PN}-hfi1-license =3D "Firmware-hfi1_firmware"
> +FILES:${PN}-hfi1-license =3D "${nonarch_base_libdir}/firmware/LICENSE.hf=
i1_firmware"
> +
> +LICENSE:${PN}-hfi1 =3D "Firmware-hfi1_firmware"
> +FILES:${PN}-hfi1 =3D "${nonarch_base_libdir}/firmware/hfi1_*"
> +RDEPENDS:${PN}-hfi1 =3D "${PN}-hfi1-license"
> +
> +# For inside-secure - Inside Secure EIP197 crypto driver
> +LICENSE:${PN}-inside-secure-license =3D "Firmware-inside-secure"
> +FILES:${PN}-inside-secure-license =3D "${nonarch_base_libdir}/firmware/L=
ICENCE.inside-secure"
> +
> +LICENSE:${PN}-inside-secure =3D "Firmware-inside-secure"
> +FILES:${PN}-inside-secure =3D "${nonarch_base_libdir}/firmware/inside-se=
cure/*"
> +RDEPENDS:${PN}-inside-secure =3D "${PN}-inside-secure-license"
> +
> +# For snd_soc_catpt - Intel AudioDSP driver for HSW/BDW platforms
> +LICENSE:${PN}-intcsst2-license =3D "Firmware-IntcSST2"
> +FILES:${PN}-intcsst2-license =3D "${nonarch_base_libdir}/firmware/LICENC=
E.IntcSST2"
> +
> +LICENSE:${PN}-snd-soc-catpt =3D "Firmware-IntcSST2"
> +FILES:${PN}-snd-soc-catpt =3D " \
> +    ${nonarch_base_libdir}/firmware/intel/catpt/bdw/dsp_basefw.bin \
> +    ${nonarch_base_libdir}/firmware/intel/IntcSST2.bin \
> +"
> +RDEPENDS:${PN}-snd-soc-catpt =3D "${PN}-intcsst2-license"
> +
> +# For snd_intel_sst_core
> +LICENSE:${PN}-fw-sst-0f28-license =3D "Firmware-fw_sst_0f28"
> +FILES:${PN}-fw-sst-0f28-license =3D "${nonarch_base_libdir}/firmware/LIC=
ENCE.fw_sst_0f28"
> +
> +LICENSE:${PN}-snd-intel-sst-core =3D "Firmware-fw_sst_0f28"
> +FILES:${PN}-snd-intel-sst-core =3D "${nonarch_base_libdir}/firmware/inte=
l/fw_sst_*"
> +RDEPENDS:${PN}-snd-intel-sst-core =3D "${PN}-fw-sst-0f28-license"
> +
> +# For atomisp - Intel IPU2 (Image Processing Unit 2) driver
> +LICENSE:${PN}-ivsc-license =3D "Firmware-ivsc"
> +FILES:${PN}-ivsc-license =3D "${nonarch_base_libdir}/firmware/LICENSE.iv=
sc"
> +
> +LICENSE:${PN}-atomisp =3D "Firmware-ivsc"
> +FILES:${PN}-atomisp =3D "${nonarch_base_libdir}/firmware/intel/ipu/shisp=
_240*"
> +RDEPENDS:${PN}-atomisp =3D "${PN}-ivsc-license"
> +
> +# For intel-ipu6-isys - Intel IPU6 (Image Processing Unit 6) driver
> +LICENSE:${PN}-intel-ipu6-isys =3D "Firmware-ivsc"
> +FILES:${PN}-intel-ipu6-isys =3D "${nonarch_base_libdir}/firmware/intel/i=
pu/ipu6*"
> +RDEPENDS:${PN}-intel-ipu6-isys =3D "${PN}-ivsc-license"
> +
> +# For mei-vsc-hw - Intel Visual Sensing Controller
> +LICENSE:${PN}-mei-vsc-hw =3D "Firmware-ivsc"
> +FILES:${PN}-mei-vsc-hw =3D "${nonarch_base_libdir}/firmware/intel/vsc/*"
> +RDEPENDS:${PN}-mei-vsc-hw =3D "${PN}-ivsc-license"
> +
> +# For ipu3-imgu - Intel IPU3 (3rd Gen Image Processing Unit) driver
> +LICENSE:${PN}-ipu3-firmware-license =3D "Firmware-ipu3_firmware"
> +FILES:${PN}-ipu3-firmware-license =3D "${nonarch_base_libdir}/firmware/L=
ICENSE.ipu3_firmware"
> +
> +LICENSE:${PN}-ipu3-imgu =3D "Firmware-ipu3_firmware"
> +FILES:${PN}-ipu3-imgu =3D " \
> +    ${nonarch_base_libdir}/firmware/intel/ipu/irci_irci_ecr-master_20161=
208_0213_20170112_1500.bin \
> +    ${nonarch_base_libdir}/firmware/intel/ipu3-fw.bin \
> +    ${nonarch_base_libdir}/firmware/intel/irci_irci_ecr-master_20161208_=
0213_20170112_1500.bin \
> +"
> +RDEPENDS:${PN}-ipu3-imgu =3D "${PN}-ipu3-firmware-license"
> +
> +# For intel-ipu7-isys - Intel IPU7 (Image Processing Unit 7) driver
> +LICENSE:${PN}-intel-ipu7-isys =3D "Firmware-intel"
> +FILES:${PN}-intel-ipu7-isys =3D "${nonarch_base_libdir}/firmware/intel/i=
pu/ipu7*"
> +RDEPENDS:${PN}-intel-ipu7-isys =3D "${PN}-intel-license"
> +
> +# For intel_vpu - Intel NPU driver
> +LICENSE:${PN}-intel-vpu-license =3D "Firmware-intel_vpu"
> +FILES:${PN}-intel-vpu-license =3D "${nonarch_base_libdir}/firmware/LICEN=
SE.intel_vpu"
> +
> +LICENSE:${PN}-intel-vpu =3D "Firmware-intel_vpu"
> +FILES:${PN}-intel-vpu =3D "${nonarch_base_libdir}/firmware/intel/vpu/*"
> +RDEPENDS:${PN}-intel-vpu =3D "${PN}-intel-vpu-license"
> +
> +# For isci - Intel C600 SAS controller driver
> +LICENSE:${PN}-isci =3D "GPL-2.0-only"
> +FILES:${PN}-isci =3D "${nonarch_base_libdir}/firmware/isci/*"
> +
> +# For ixp4xx-npe - Intel IXP4xx XScale Network Processing Engine (NPE) F=
irmware
> +LICENSE:${PN}-ixp4xx-license =3D "Firmware-ixp4xx"
> +FILES:${PN}-ixp4xx-license =3D "${nonarch_base_libdir}/firmware/LICENSE.=
ixp4xx"
> +
> +LICENSE:${PN}-ixp4xx-npe =3D "Firmware-ixp4xx"
> +FILES:${PN}-ixp4xx-npe =3D "${nonarch_base_libdir}/firmware/ixp4xx/*"
> +RDEPENDS:${PN}-ixp4xx-npe =3D "${PN}-ixp4xx-license"
> +
> +# For kaweth - USB KLSI KL5USB101-based Ethernet device
> +LICENSE:${PN}-kaweth-license =3D "Firmware-kaweth"
> +FILES:${PN}-kaweth-license =3D "${nonarch_base_libdir}/firmware/LICENCE.=
kaweth"
> +
> +LICENSE:${PN}-kaweth =3D "Firmware-kaweth"
> +FILES:${PN}-kaweth =3D "${nonarch_base_libdir}/firmware/kaweth/*"
> +RDEPENDS:${PN}-kaweth =3D "${PN}-kaweth-license"
> +
> +# For keyspan - USB Keyspan USA-xxx serial device
> +LICENSE:${PN}-keyspan-license =3D "Firmware-keyspan"
> +FILES:${PN}-keyspan-license =3D "${nonarch_base_libdir}/firmware/LICENCE=
.keyspan"
> +
> +LICENSE:${PN}-keyspan =3D "Firmware-keyspan"
> +FILES:${PN}-keyspan =3D "${nonarch_base_libdir}/firmware/keyspan/*"
> +RDEPENDS:${PN}-keyspan =3D "${PN}-keyspan-license"
> +
> +# For keyspan_pda - USB Keyspan PDA single-port serial device
> +LICENSE:${PN}-keyspan-pda =3D "GPL-2.0-or-later"
> +FILES:${PN}-keyspan-pda =3D "${nonarch_base_libdir}/firmware/keyspan_pda=
/*"
> +
> +# For mga - Matrox G200/G400/G550
> +LICENSE:${PN}-mga-license =3D "Firmware-mga"
> +FILES:${PN}-mga-license =3D "${nonarch_base_libdir}/firmware/LICENSE.mga=
"
> +
> +LICENSE:${PN}-mga =3D "Firmware-mga"
> +FILES:${PN}-mga =3D "${nonarch_base_libdir}/firmware/matrox/*"
> +RDEPENDS:${PN}-mga =3D "${PN}-mga-license"
> +
> +# For myri10ge - Myri10GE 10GbE NIC driver
> +LICENSE:${PN}-myri10ge-firmware-license =3D "Firmware-myri10ge_firmware"
> +FILES:${PN}-myri10ge-firmware-license =3D "${nonarch_base_libdir}/firmwa=
re/LICENCE.myri10ge_firmware"
> +
> +LICENSE:${PN}-myri10ge =3D "Firmware-myri10ge_firmware"
> +FILES:${PN}-myri10ge =3D "${nonarch_base_libdir}/firmware/myri10ge_*"
> +RDEPENDS:${PN}-myri10ge =3D "${PN}-myri10ge-firmware-license"
> +
> +# For smc91c92_cs - SMC 91Cxx PCMCIA
> +LICENSE:${PN}-smc91c92-cs =3D "GPL-1.0-only"
> +FILES:${PN}-smc91c92-cs =3D "${nonarch_base_libdir}/firmware/ositech/Xil=
inx7OD.bin"
> +
> +# For qla1280 - Qlogic QLA 1240/1x80/1x160 SCSI support
> +LICENSE:${PN}-qla1280-license =3D "Firmware-qla1280"
> +FILES:${PN}-qla1280-license =3D "${nonarch_base_libdir}/firmware/LICENCE=
.qla1280"
> +
> +LICENSE:${PN}-qla1280 =3D "Firmware-qla1280"
> +FILES:${PN}-qla1280 =3D " \
> +    ${nonarch_base_libdir}/firmware/qlogic/1040.bin \
> +    ${nonarch_base_libdir}/firmware/qlogic/1280.bin \
> +    ${nonarch_base_libdir}/firmware/qlogic/12160.bin \
> +"
> +RDEPENDS:${PN}-qla1280 =3D "${PN}-qla1280-license"
> +
> +# For ib_qib - QLogic Infiniband
> +LICENSE:${PN}-ib-qib-license =3D "Firmware-ib_qib"
> +FILES:${PN}-ib-qib-license =3D "${nonarch_base_libdir}/firmware/LICENSE.=
ib_qib"
> +
> +LICENSE:${PN}-ib-qib =3D "Firmware-ib_qib"
> +FILES:${PN}-ib-qib =3D "${nonarch_base_libdir}/firmware/qlogic/sd7220.fw=
"
> +RDEPENDS:${PN}-ib-qib =3D "${PN}-ib-qib-license"
> +
> +# For xhci-rcar - Renesas R-Car Gen2/3 USB 3.0 host controller driver
> +LICENSE:${PN}-r8a779x-usb3-license =3D "Firmware-r8a779x_usb3"
> +FILES:${PN}-r8a779x-usb3-license =3D "${nonarch_base_libdir}/firmware/LI=
CENCE.r8a779x_usb3"
> +
> +LICENSE:${PN}-xhci-rcar =3D "Firmware-r8a779x_usb3"
> +FILES:${PN}-xhci-rcar =3D "${nonarch_base_libdir}/firmware/r8a779x_usb3_=
*"
> +RDEPENDS:${PN}-xhci-rcar =3D "${PN}-r8a779x-usb3-license"
> +
> +# For r128 - ATI Rage 128
> +LICENSE:${PN}-r128 =3D "MIT"
> +FILES:${PN}-r128 =3D "${nonarch_base_libdir}/firmware/r128/*"
> +
> +# For rt1320 - Realtek rt1320 ASoC audio driver.
> +LICENSE:${PN}-rt1320-license =3D "Firmware-rt1320"
> +FILES:${PN}-rt1320-license =3D "${nonarch_base_libdir}/firmware/LICENSE.=
rt1320"
> +
> +LICENSE:${PN}-rt1320 =3D "Firmware-rt1320"
> +FILES:${PN}-rt1320 =3D "${nonarch_base_libdir}/firmware/realtek/rt1320/*=
"
> +RDEPENDS:${PN}-rt1320 =3D "${PN}-rt1320-license"
> +
> +# For rp2 - Comtrol RocketPort 2 serial driver
> +LICENSE:${PN}-rp2-license =3D "Firmware-rp2"
> +FILES:${PN}-rp2-license =3D "${nonarch_base_libdir}/firmware/LICENSE.rp2=
"
> +
> +LICENSE:${PN}-rp2 =3D "Firmware-rp2"
> +FILES:${PN}-rp2 =3D "${nonarch_base_libdir}/firmware/rp2.fw"
> +RDEPENDS:${PN}-rp2 =3D "${PN}-rp2-license"
> +
> +# For s5p-mfc - Samsung MFC video encoder/decoder driver
> +LICENSE:${PN}-s5p-mfc-license =3D "Firmware-s5p-mfc"
> +FILES:${PN}-s5p-mfc-license =3D "${nonarch_base_libdir}/firmware/LICENSE=
.s5p-mfc"
> +
> +LICENSE:${PN}-s5p-mfc =3D "Firmware-s5p-mfc"
> +FILES:${PN}-s5p-mfc =3D "${nonarch_base_libdir}/firmware/s5p-mfc*"
> +RDEPENDS:${PN}-s5p-mfc =3D "${PN}-s5p-mfc-license"
> +
> +# For snd-sb16-csp - Sound Blaster 16/AWE CSP support
> +LICENSE:${PN}-snd-sb16-csp =3D "GPL-2.0-or-later"
> +FILES:${PN}-snd-sb16-csp =3D "${nonarch_base_libdir}/firmware/sb16/*"
> +
> +# For slicoss - Alacritech IS-NIC products
> +LICENSE:${PN}-alacritech-license =3D "Firmware-alacritech"
> +FILES:${PN}-alacritech-license =3D "${nonarch_base_libdir}/firmware/LICE=
NCE.alacritech"
> +
> +LICENSE:${PN}-slicoss =3D "Firmware-alacritech"
> +FILES:${PN}-slicoss =3D "${nonarch_base_libdir}/firmware/slicoss/*"
> +RDEPENDS:${PN}-slicoss =3D "${PN}-alacritech-license"
> +
> +LICENSE:${PN}-sxg =3D "Firmware-alacritech"
> +FILES:${PN}-sxg =3D "${nonarch_base_libdir}/firmware/sxg/*"
> +RDEPENDS:${PN}-sxg =3D "${PN}-alacritech-license"
> +
> +# For tehuti - Tehuti Networks 10G Ethernet
> +LICENSE:${PN}-tehuti-license =3D "Firmware-tehuti"
> +FILES:${PN}-tehuti-license =3D "${nonarch_base_libdir}/firmware/LICENSE.=
tehuti"
> +
> +LICENSE:${PN}-tehuti =3D "Firmware-tehuti"
> +FILES:${PN}-tehuti =3D "${nonarch_base_libdir}/firmware/tehuti/*"
> +RDEPENDS:${PN}-tehuti =3D "${PN}-tehuti-license"
> +
> +# For tg3 - Broadcom Tigon3 based gigabit Ethernet cards
> +LICENSE:${PN}-tigon-license =3D "Firmware-tigon"
> +FILES:${PN}-tigon-license =3D "${nonarch_base_libdir}/firmware/LICENCE.t=
igon"
> +
> +LICENSE:${PN}-tg3 =3D "Firmware-tigon"
> +FILES:${PN}-tg3 =3D "${nonarch_base_libdir}/firmware/tigon/*"
> +RDEPENDS:${PN}-tg3 =3D "${PN}-tigon-license"
> +
> +# For tlg2300 - Telgent 2300 V4L/DVB driver.
> +LICENSE:${PN}-tlg2300-license =3D "Firmware-tlg2300"
> +FILES:${PN}-tlg2300-license =3D "${nonarch_base_libdir}/firmware/LICENSE=
.tlg2300"
> +
> +LICENSE:${PN}-tlg2300 =3D "Firmware-tlg2300"
> +FILES:${PN}-tlg2300 =3D "${nonarch_base_libdir}/firmware/tlg2300*"
> +RDEPENDS:${PN}-tlg2300 =3D "${PN}-tlg2300-license"
> +
> +# For Mont-TSSE - Mont-TSSE(TM) Crypto Algorithm Accelerator Driver
> +LICENSE:${PN}-montage-license =3D "Firmware-montage"
> +FILES:${PN}-montage-license =3D "${nonarch_base_libdir}/firmware/LICENSE=
.montage"
> +
> +LICENSE:${PN}-mont-tsse =3D "Firmware-montage"
> +FILES:${PN}-mont-tsse =3D "${nonarch_base_libdir}/firmware/tsse_firmware=
.bin"
> +RDEPENDS:${PN}-mont-tsse =3D "${PN}-montage-license"
> +
> +# For ueagle-atm - Driver for USB ADSL Modems based on Eagle IV Chipset
> +LICENSE:${PN}-ueagle-atm4-firmware-license =3D "Firmware-ueagle-atm4-fir=
mware"
> +FILES:${PN}-ueagle-atm4-firmware-license =3D "${nonarch_base_libdir}/fir=
mware/LICENCE.ueagle-atm4-firmware"
> +
> +LICENSE:${PN}-ueagle-atm =3D "Firmware-ueagle-atm4-firmware"
> +FILES:${PN}-ueagle-atm =3D " \
> +    ${nonarch_base_libdir}/firmware/ueagle-atm/CMV4p.bin.v2 \
> +    ${nonarch_base_libdir}/firmware/ueagle-atm/DSP4p.bin \
> +    ${nonarch_base_libdir}/firmware/ueagle-atm/eagleIV.fw \
> +"
> +RDEPENDS:${PN}-ueagle-atm =3D "${PN}-ueagle-atm4-firmware-license"
> +
> +# For usbdux/usbduxfast/usbduxsigma - usbdux data acquisition cards
> +LICENSE:${PN}-usbdux =3D "GPL-2.0-or-later"
> +FILES:${PN}-usbdux =3D "${nonarch_base_libdir}/firmware/usbdux*"
> +
> +# For cx231xx - Conexant Cx23100/101/102 USB broadcast A/V decoder
> +LICENSE:${PN}-conexant-license =3D "Firmware-conexant"
> +FILES:${PN}-conexant-license =3D "${nonarch_base_libdir}/firmware/LICENS=
E.conexant"
> +
> +LICENSE:${PN}-cx231xx =3D "Firmware-conexant"
> +FILES:${PN}-cx231xx =3D "${nonarch_base_libdir}/firmware/v4l-cx231xx*"
> +RDEPENDS:${PN}-cx231xx =3D "${PN}-conexant-license"
> +
> +LICENSE:${PN}-cx23418 =3D "Firmware-conexant"
> +FILES:${PN}-cx23418 =3D "${nonarch_base_libdir}/firmware/v4l-cx23418*"
> +RDEPENDS:${PN}-cx23418 =3D "${PN}-conexant-license"
> +
> +LICENSE:${PN}-cx23885 =3D "Firmware-conexant"
> +FILES:${PN}-cx23885 =3D "${nonarch_base_libdir}/firmware/v4l-cx23885*"
> +RDEPENDS:${PN}-cx23885 =3D "${PN}-conexant-license"
> +
> +LICENSE:${PN}-cx23840 =3D "Firmware-conexant"
> +FILES:${PN}-cx23840 =3D "${nonarch_base_libdir}/firmware/v4l-cx25840*"
> +RDEPENDS:${PN}-cx23840 =3D "${PN}-conexant-license"
> +
> +# For vxge - Exar X3100 Series 10GbE PCIe I/O Virtualized Server Adapter
> +LICENSE:${PN}-vxge-license =3D "Firmware-vxge"
> +FILES:${PN}-vxge-license =3D "${nonarch_base_libdir}/firmware/LICENSE.vx=
ge"
> +
> +LICENSE:${PN}-vxge =3D "Firmware-vxge"
> +FILES:${PN}-vxge =3D "${nonarch_base_libdir}/firmware/vxge/*"
> +RDEPENDS:${PN}-vxge =3D "${PN}-vxge-license"
> +
> +# For whiteheat - USB ConnectTech WhiteHEAT serial device
> +LICENSE:${PN}-whiteheat =3D "GPL-2.0-only"
> +FILES:${PN}-whiteheat =3D "${nonarch_base_libdir}/firmware/whiteheat*"
> +
> +# For wil6210 - Qualcomm Atheros support for 11ad family of chips
> +LICENSE:${PN}-qualcommatheros-ath10k-license =3D "Firmware-qualcommAthos=
_ath10k"
> +FILES:${PN}-qualcommatheros-ath10k-license =3D "${nonarch_base_libdir}/f=
irmware/LICENSE.QualcommAtheros_ath10k"
> +
> +LICENSE:${PN}-wil6210 =3D "Firmware-qualcommAthos_ath10k"
> +FILES:${PN}-wil6210 =3D "${nonarch_base_libdir}/firmware/wil6210*"
> +RDEPENDS:${PN}-wil6210 =3D "${PN}-qualcommatheros-ath10k-license"
> +
> +# For xe - Intel Graphics driver
> +LICENSE:${PN}-xe-license =3D "Firmware-xe"
> +FILES:${PN}-xe-license =3D "${nonarch_base_libdir}/firmware/LICENSE.xe"
> +
> +LICENSE:${PN}-xe =3D "Firmware-xe"
> +FILES:${PN}-xe =3D "${nonarch_base_libdir}/firmware/xe/*"
> +RDEPENDS:${PN}-xe =3D "${PN}-xe-license"
> +
>  # For other firmwares
>  # Maybe split out to separate packages when needed.
>  LICENSE:${PN} =3D "\
> @@ -2269,6 +3267,7 @@ LICENSE:${PN} =3D "\
>      & Firmware-IntcSST2 \
>      & Firmware-kaweth \
>      & Firmware-keyspan \
> +    & Firmware-lenovo \
>      & Firmware-mellanox \
>      & Firmware-mga \
>      & Firmware-montage \
> @@ -2312,8 +3311,13 @@ LICENSE:${PN} =3D "\
>      & WHENCE \
>  "
>
> +# The goal for this recipe is to creata bunch of breakout packages for t=
he
> +# firmware so that you can choose which files to include and not have to=
 pull
> +# them all in.  To that end, we do want any files to be part of the
> +# linux-firmware package.  So set it to "".  Do not change this.
> +FILES:${PN} =3D ""
> +
>  FILES:${PN}-license +=3D "${nonarch_base_libdir}/firmware/LICEN*"
> -FILES:${PN} +=3D "${nonarch_base_libdir}/firmware/*"
>  RDEPENDS:${PN} +=3D "${PN}-license"
>  RDEPENDS:${PN} +=3D "${PN}-whence-license"
>
> --
> 2.17.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224540): https://lists.openembedded.org/g/openembedde=
d-core/message/224540
> Mute This Topic: https://lists.openembedded.org/mt/115638344/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

