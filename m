Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 573FBC0218A
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 02:44:13 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.4776.1738118649054015613
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jan 2025 18:44:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=wYq5BR5H;
 spf=pass (domain: linaro.org, ip: 209.85.167.52, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54298ec925bso7395238e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jan 2025 18:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738118647; x=1738723447; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IVYHGFQKOgBPof98GfAaFdgi1Qa0Lle1CODzTvwW5f0=;
        b=wYq5BR5HVr7OY3SMGw6Bdh7bewdM6pbqsx+w7zkqaUBYikTaztWY8beO7J6LplKhAI
         1B6tz92wI4vjLLQjH/KcsUhtOUAJ7UQJAs2anpu9Is3h6pWL13EIGFaAHJqHrUrBHmcQ
         WAfrX7on4PxE0970wCGR61c8w2fH/uNUnXV5RWBXrckT+Mg9UrDrAAVJENF+f+Qs9O7a
         I3ij4VTTAQ1kx/VT1AcmeonZes7xifP/UfBdWjD3rE62dCWa6c0GUUwz+hWXEKBHbIKM
         JOFcVGnWQq4xahvDcCVSWVAyJzFDVowQArBQIdqKVfzSryQ1fdoZIPwFBZuIcD8TLqeg
         tCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738118647; x=1738723447;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IVYHGFQKOgBPof98GfAaFdgi1Qa0Lle1CODzTvwW5f0=;
        b=VNbWxxhSC3yX+IfOyFqrkqWH+swCIMnB7nEvRvcHoa7twOS60UW3c8PeGzdfqegqVV
         eGsGmx9tneqGE6g8ysMwUs2yzZW41bZFSJEYbHQWBY+98m2bDTAoiGBBe2iv2lMqGgW9
         qPTRRMGdLrHT5HCnkIRT8p76Dpswn/R4Wyc0Ax7cD83Huiqiy6TF/fQJ6SpoDr614GsA
         HubFnqSmTvnXATxJ/uRkuDQGUI6SAWq6INIKpHAp0I7u8mudyfqC6hEJaM99m/FLldHN
         I1m7+pQ0VDS8vDoKIwKVVe38mfWuOI6CwFL8c8nmmvDKDHGBG5cIE8ceLrEZ1IA/Rqt7
         kZCw==
X-Gm-Message-State: AOJu0YwER+fDMSr3eWCnyRNaZerSx/mnFAt9xNfSfJM+cOeV1isnXWTh
	wcP4M7nW7czNApIzNnbRVs3j4zbRf2OBhBw+MoekFAMCpQBQX/larnQphSHJwJQ=
X-Gm-Gg: ASbGnctz1/lQIOeFyEFP8SRCyh0MVNHU/gdsv0Ji90HTYnrqWkfTLFHfMn4YVKJcH/P
	O8T35549W5nhZK1GDe5mxnsbISyPK2N4wqOX5k9MT1vQ2dV6UltqS1QZKLmM6P4AAUICvSBBo4p
	6h1wnnLARjyVVuUqbNaGeWyiaAbgpfj1btTVGDObyGwjSEJmsJPVrqvp1Mk4feVEMoralbUGQlr
	bHqCsdJrv3+Ftyv73F17ShVMP04jOXhJEW337404tjY70bllMbHLxRu9T7eDL8WzE22j1rmfoLr
	tDWALISIaHZm2yIgp/MF8wdXW8634nqUcjaCNMihxvdfqT741ASZdnIUyPda7dJD9Iw0ouc=
X-Google-Smtp-Source: AGHT+IF87T4/1V55ZsrzrslHvS2pz0VUIZD+AGj5yvQ4CjEfJwJ2OdILP/OvdB8XkqNo+x6ppZBsLQ==
X-Received: by 2002:a05:6512:3051:b0:542:28dc:b692 with SMTP id 2adb3069b0e04-543e4be9b8emr384924e87.14.1738118647029;
        Tue, 28 Jan 2025 18:44:07 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c83815a9sm1809827e87.225.2025.01.28.18.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 18:44:05 -0800 (PST)
Date: Wed, 29 Jan 2025 04:44:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: marc.ferland@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Marc Ferland <marc.ferland@sonatest.com>
Subject: Re: [PATCH 2/2] linux-firmware: split qca firmwares in separate
 packages
Message-ID: <hlr4zstoczjrkyhyrhymzycp3fdisrijtnmgh6gvwnwkhaf5zj@x5srehiplk65>
References: <20250127162440.3869759-1-marc.ferland@sonatest.com>
 <20250127162440.3869759-2-marc.ferland@sonatest.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250127162440.3869759-2-marc.ferland@sonatest.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 02:44:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210341

On Mon, Jan 27, 2025 at 11:24:40AM -0500, marc.ferland@gmail.com wrote:
> From: Marc Ferland <marc.ferland@sonatest.com>
> 
> This patch introduces the following packages for firmwares under qca/:
> 
> - linux-firmware-qca-qca61x4
> - linux-firmware-qca-wcn3988
> - linux-firmware-qca-wcn399x
> - linux-firmware-qca-wcn6750
> - linux-firmware-qca-qca2066
> - linux-firmware-qca-wcn7850
> - linux-firmware-qca-misc: catches all firmwares that are not already
>   included in the other -qca- packages (currently empty).

Well, I'd think more about the usb vs serial split too. There is little
point in having the USB-related files together with the HCI aka
serial-related files.

> 
> linux-firmware-qca is now a meta package that depends on all of the
> split-out qca packages.
> 
> Note: Content of the FILES:${PN}-qca* variables taken from WHENCE.
> 
> Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
> ---
>  .../linux-firmware/linux-firmware_20241210.bb | 142 +++++++++++++++++-
>  1 file changed, 136 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20241210.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20241210.bb
> index 78bf13d878..79c273063e 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20241210.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20241210.bb
> @@ -395,6 +395,13 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
>               ${PN}-ath12k-wcn7850 \
>               ${PN}-ath12k-misc \
>               ${PN}-qca \
> +             ${PN}-qca-qca61x4 \
> +             ${PN}-qca-wcn3988 \
> +             ${PN}-qca-wcn399x \
> +             ${PN}-qca-wcn6750 \
> +             ${PN}-qca-qca2066 \
> +             ${PN}-qca-wcn7850 \
> +             ${PN}-qca-misc \
>               \
>               ${PN}-imx-sdma-license ${PN}-imx-sdma-imx6q ${PN}-imx-sdma-imx7d \
>               \
> @@ -580,7 +587,13 @@ LICENSE:${PN}-ath12k = "Firmware-qualcommAthos_ath10k"
>  LICENSE:${PN}-ath12k-qcn9274 = "Firmware-qualcommAthos_ath10k"
>  LICENSE:${PN}-ath12k-wcn7850 = "Firmware-qualcommAthos_ath10k"
>  LICENSE:${PN}-ath12k-misc = "Firmware-qualcommAthos_ath10k"
> -LICENSE:${PN}-qca = "Firmware-qualcommAthos_ath10k"
> +LICENSE:${PN}-qca-qca61x4 = "Firmware-qualcommAthos_ath10k"
> +LICENSE:${PN}-qca-wcn3988 = "Firmware-qcom"
> +LICENSE:${PN}-qca-wcn399x = "Firmware-qualcommAthos_ath10k"
> +LICENSE:${PN}-qca-wcn6750 = "Firmware-qualcommAthos_ath10k"
> +LICENSE:${PN}-qca-qca2066 = "Firmware-qualcommAthos_ath10k"
> +LICENSE:${PN}-qca-wcn7850 = "Firmware-qcom"
> +LICENSE:${PN}-qca-misc = "Firmware-qualcommAthos_ath10k & Firmware-qcom"
>  
>  FILES:${PN}-ar3k-license = "${nonarch_base_libdir}/firmware/LICENSE.QualcommAtheros_ar3k"
>  FILES:${PN}-ar3k = " \
> @@ -628,9 +641,116 @@ ALLOW_EMPTY:${PN}-ath12k = "1"
>  # firmwares that are not already included in other -ath12k- packages.
>  ALLOW_EMPTY:${PN}-ath12k-misc = "1"
>  
> -FILES:${PN}-qca = " \
> -  ${nonarch_base_libdir}/firmware/qca \
> -"
> +FILES:${PN}-qca-qca61x4 = " \
> +  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00000201.bin \
> +  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00000200.bin \
> +  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00000300.bin \
> +  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00000302.bin \
> +  ${nonarch_base_libdir}/firmware/qca/nvm_00130300.bin \
> +  ${nonarch_base_libdir}/firmware/qca/nvm_00130302.bin \
> +  ${nonarch_base_libdir}/firmware/qca/nvm_00230302.bin \
> +  ${nonarch_base_libdir}/firmware/qca/rampatch_usb_00000200.bin \
> +  ${nonarch_base_libdir}/firmware/qca/rampatch_usb_00000201.bin \
> +  ${nonarch_base_libdir}/firmware/qca/rampatch_usb_00000300.bin \
> +  ${nonarch_base_libdir}/firmware/qca/rampatch_usb_00000302.bin \
> +  ${nonarch_base_libdir}/firmware/qca/rampatch_00130300.bin \
> +  ${nonarch_base_libdir}/firmware/qca/rampatch_00130302.bin \
> +  ${nonarch_base_libdir}/firmware/qca/rampatch_00230302.bin \
> +  ${nonarch_base_libdir}/firmware/qca/nvm_00440302.bin \
> +  ${nonarch_base_libdir}/firmware/qca/rampatch_00440302.bin \
> +  ${nonarch_base_libdir}/firmware/qca/nvm_00440302_eu.bin \
> +  ${nonarch_base_libdir}/firmware/qca/nvm_00440302_i2s_eu.bin \
> +  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00000302_eu.bin \
> +  ${nonarch_base_libdir}/firmware/qca/htbtfw20.tlv \
> +  ${nonarch_base_libdir}/firmware/qca/htnv20.bin \

So, I think, the htnv20 and htbtfw20 should be a part of the different
package.

The rest LGTM.

> +  ${nonarch_base_libdir}/firmware/qca/rampatch_usb_00130200.bin \
> +  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130200.bin \
> +  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130200_0104.bin \
> +  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130200_0105.bin \
> +  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130200_0106.bin \
> +  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130200_0107.bin \
> +  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130200_0109.bin \
> +  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130200_0110.bin \
> +  ${nonarch_base_libdir}/firmware/qca/rampatch_usb_00130201.bin \
> +  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130201.bin \
> +  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130201_010a.bin \
> +  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130201_010b.bin \
> +  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130201_0303.bin \
> +  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130201_gf.bin \
> +  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130201_gf_010a.bin \
> +  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130201_gf_010b.bin \
> +  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130201_gf_0303.bin \
> +  ${nonarch_base_libdir}/firmware/qca/rampatch_usb_00190200.bin \
> +  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00190200.bin \
> +  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00190200_010e.bin \
> +  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00190200_0112.bin \
> +"
> +FILES:${PN}-qca-wcn3988 = " \
> +  ${nonarch_base_libdir}/firmware/qca/apbtfw10.tlv \
> +  ${nonarch_base_libdir}/firmware/qca/apbtfw11.tlv \
> +  ${nonarch_base_libdir}/firmware/qca/apnv10.bin \
> +  ${nonarch_base_libdir}/firmware/qca/apnv11.bin \
> +"
> +FILES:${PN}-qca-wcn399x = " \
> +  ${nonarch_base_libdir}/firmware/qca/crbtfw21.tlv \
> +  ${nonarch_base_libdir}/firmware/qca/crnv21.bin \
> +  ${nonarch_base_libdir}/firmware/qca/crbtfw32.tlv \
> +  ${nonarch_base_libdir}/firmware/qca/crnv32.bin \
> +  ${nonarch_base_libdir}/firmware/qca/crnv32u.bin \
> +"
> +FILES:${PN}-qca-wcn6750 = " \
> +  ${nonarch_base_libdir}/firmware/qca/msbtfw11.mbn \
> +  ${nonarch_base_libdir}/firmware/qca/msbtfw11.tlv \
> +  ${nonarch_base_libdir}/firmware/qca/msnv11.bin \
> +  ${nonarch_base_libdir}/firmware/qca/msnv11.b0a \
> +  ${nonarch_base_libdir}/firmware/qca/msnv11.b09 \
> +"
> +FILES:${PN}-qca-qca2066 = " \
> +  ${nonarch_base_libdir}/firmware/qca/hpbtfw21.tlv \
> +  ${nonarch_base_libdir}/firmware/qca/hpnv21.bin \
> +  ${nonarch_base_libdir}/firmware/qca/hpnv21g.bin \
> +  ${nonarch_base_libdir}/firmware/qca/hpnv21.301 \
> +  ${nonarch_base_libdir}/firmware/qca/hpnv21.302 \
> +  ${nonarch_base_libdir}/firmware/qca/hpnv21g.301 \
> +  ${nonarch_base_libdir}/firmware/qca/hpnv21g.302 \
> +  ${nonarch_base_libdir}/firmware/qca/hpnv21.309 \
> +  ${nonarch_base_libdir}/firmware/qca/hpnv21g.309 \
> +  ${nonarch_base_libdir}/firmware/qca/hpnv21.b8c \
> +  ${nonarch_base_libdir}/firmware/qca/hpnv21.b9f \
> +  ${nonarch_base_libdir}/firmware/qca/hpnv21.ba0 \
> +  ${nonarch_base_libdir}/firmware/qca/hpnv21.ba1 \
> +  ${nonarch_base_libdir}/firmware/qca/hpnv21.ba2 \
> +  ${nonarch_base_libdir}/firmware/qca/hpnv21.ba3 \
> +  ${nonarch_base_libdir}/firmware/qca/hpnv21.ba4 \
> +  ${nonarch_base_libdir}/firmware/qca/hpnv21.baa \
> +  ${nonarch_base_libdir}/firmware/qca/hpnv21.bb8 \
> +  ${nonarch_base_libdir}/firmware/qca/hpnv21.b10c \
> +  ${nonarch_base_libdir}/firmware/qca/hpnv21.b111 \
> +  ${nonarch_base_libdir}/firmware/qca/hpnv21g.b8c \
> +  ${nonarch_base_libdir}/firmware/qca/hpnv21g.b9f \
> +  ${nonarch_base_libdir}/firmware/qca/hpnv21g.ba0 \
> +  ${nonarch_base_libdir}/firmware/qca/hpnv21g.ba1 \
> +  ${nonarch_base_libdir}/firmware/qca/hpnv21g.ba2 \
> +  ${nonarch_base_libdir}/firmware/qca/hpnv21g.ba3 \
> +  ${nonarch_base_libdir}/firmware/qca/hpnv21g.ba4 \
> +  ${nonarch_base_libdir}/firmware/qca/hpnv21g.baa \
> +  ${nonarch_base_libdir}/firmware/qca/hpnv21g.bb8 \
> +  ${nonarch_base_libdir}/firmware/qca/hpnv21g.b10c \
> +  ${nonarch_base_libdir}/firmware/qca/hpnv21g.b111 \
> +"
> +FILES:${PN}-qca-wcn7850 = " \
> +  ${nonarch_base_libdir}/firmware/qca/hmtbtfw20.tlv \
> +  ${nonarch_base_libdir}/firmware/qca/hmtnv20.b10f \
> +  ${nonarch_base_libdir}/firmware/qca/hmtnv20.b112 \
> +  ${nonarch_base_libdir}/firmware/qca/hmtnv20.bin \
> +"
> +FILES:${PN}-qca-misc = "${nonarch_base_libdir}/firmware/qca/*"
> +# -qca is a virtual package that depends upon all qca packages.
> +ALLOW_EMPTY:${PN}-qca = "1"
> +# -qca-misc is a catch all package that includes all the qca
> +# firmwares that are not already included in other -qca- packages.
> +ALLOW_EMPTY:${PN}-qca-misc = "1"
> +
>  
>  RDEPENDS:${PN}-ar3k += "${PN}-ar3k-license ${PN}-atheros-license"
>  RDEPENDS:${PN}-ath10k += "${PN}-ath10k-license"
> @@ -658,8 +778,14 @@ RDEPENDS:${PN}-ath12k += "${PN}-ath10k-license"
>  RDEPENDS:${PN}-ath12k-qcn9274 += "${PN}-ath10k-license"
>  RDEPENDS:${PN}-ath12k-wcn7850 += "${PN}-ath10k-license"
>  RDEPENDS:${PN}-ath12k-misc += "${PN}-ath10k-license"
> -RDEPENDS:${PN}-qca += "${PN}-ath10k-license"
> -
> +RDEPENDS:${PN}-qca += "${PN}-ath10k-license ${PN}-qcom-license"
> +RDEPENDS:${PN}-qca-qca61x4 += "${PN}-ath10k-license"
> +RDEPENDS:${PN}-qca-wcn3988 += "${PN}-qcom-license"
> +RDEPENDS:${PN}-qca-wcn399x += "${PN}-ath10k-license"
> +RDEPENDS:${PN}-qca-wcn6750 += "${PN}-ath10k-license"
> +RDEPENDS:${PN}-qca-qca2066 += "${PN}-ath10k-license"
> +RDEPENDS:${PN}-qca-wcn7850 += "${PN}-qcom-license"
> +RDEPENDS:${PN}-qca-misc += "${PN}-ath10k-license ${PN}-qcom-license"
>  # For ralink
>  LICENSE:${PN}-ralink = "Firmware-ralink-firmware"
>  LICENSE:${PN}-ralink-license = "Firmware-ralink-firmware"
> @@ -1909,6 +2035,7 @@ RDEPENDS:${PN} += "${PN}-whence-license"
>  # Make linux-firmware-ath10k depend on all of the split-out ath10k packages.
>  # Make linux-firmware-ath11k depend on all of the split-out ath11k packages.
>  # Make linux-firmware-ath12k depend on all of the split-out ath12k packages.
> +# Make linux-firmware-qca depend on all of the split-out qca packages.
>  # Make linux-firmware-amdgpu depend on all of the split-out amdgpu packages.
>  python populate_packages:prepend () {
>      firmware_pkgs = oe.utils.packages_filter_out_system(d)
> @@ -1929,6 +2056,9 @@ python populate_packages:prepend () {
>      ath12k_pkgs = filter(lambda x: x.find('-ath12k-') != -1, firmware_pkgs)
>      d.appendVar('RRECOMMENDS:linux-firmware-ath12k', ' ' + ' '.join(ath12k_pkgs))
>  
> +    qca_pkgs = filter(lambda x: x.find('-qca-') != -1, firmware_pkgs)
> +    d.appendVar('RRECOMMENDS:linux-firmware-qca', ' ' + ' '.join(qca_pkgs))
> +
>      amdgpu_pkgs = filter(lambda x: x.find('-amdgpu-') != -1, firmware_pkgs)
>      d.appendVar('RRECOMMENDS:linux-firmware-amdgpu', ' ' + ' '.join(amdgpu_pkgs))
>  }
> -- 
> 2.34.1
> 
> 

-- 
With best wishes
Dmitry

