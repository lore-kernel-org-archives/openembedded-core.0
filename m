Received: from bsmtp2.bon.at (bsmtp2.bon.at [213.33.87.16])
 by mx.groups.io with SMTP id smtpd.web12.10001.1603100703793391989
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2020 02:45:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.16, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 4CFBgc2KhLz5tlH;
	Mon, 19 Oct 2020 11:45:00 +0200 (CEST)
Date: Mon, 19 Oct 2020 11:44:59 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: Re: [OE-core] [PATCH 2/2] linux-firmware: package nvidia firmware
Message-ID: <20201019094459.hx2v3qjf2fwhig7n@qschulz>
References: <20201019093801.55488-1-max.krummenacher@toradex.com>
 <20201019093801.55488-2-max.krummenacher@toradex.com>
MIME-Version: 1.0
In-Reply-To: <20201019093801.55488-2-max.krummenacher@toradex.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Max,

On Mon, Oct 19, 2020 at 11:38:01AM +0200, Max Krummenacher wrote:
> Add packages for the firmware required by the Nvidia chipsets.
> Split it in Tegra K1, all other Tegras and desktop GPU packages.
> 
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> ---
>  .../linux-firmware/linux-firmware_20200817.bb | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20200817.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20200817.bb
> index 3d6644e504..5bb27c51c7 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200817.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200817.bb
> @@ -288,6 +288,9 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
>               ${PN}-adsp-sst-license ${PN}-adsp-sst \
>               ${PN}-bnx2-mips \
>               ${PN}-liquidio \
> +             ${PN}-nvidia-license \
> +             ${PN}-nvidia-tegra-k1 ${PN}-nvidia-tegra \
> +             ${PN}-nvidia-gpu \
>               ${PN}-netronome-license ${PN}-netronome \
>               ${PN}-qat ${PN}-qat-license \
>               ${PN}-qcom-license \
> @@ -478,6 +481,27 @@ FILES_${PN}-netronome = " \
>  
>  RDEPENDS_${PN}-netronome += "${PN}-netronome-license"
>  
> +# For Nvidia
> +LICENSE_${PN}-nvidia-gpu = "Firmware-nvidia"
> +LICENSE_${PN}-nvidia-tegra = "Firmware-nvidia"
> +LICENSE_${PN}-nvidia-tegra-k1 = "Firmware-nvidia"
> +LICENSE_${PN}-nvidia-license = "Firmware-nvidia"
> +
> +FILES_${PN}-nvidia-gpu = "/lib/firmware/nvidia"
                             ^^^^ nonarch_base_libdir instead?
> +FILES_${PN}-nvidia-tegra = " \
> +  ${nonarch_base_libdir}/firmware/nvidia/tegra* \
> +  ${nonarch_base_libdir}/firmware/nvidia/gm20b \
> +  ${nonarch_base_libdir}/firmware/nvidia/gp10b \
> +"
> +FILES_${PN}-nvidia-tegra-k1 = " \
> +  ${nonarch_base_libdir}/firmware/nvidia/tegra124 \
> +  ${nonarch_base_libdir}/firmware/nvidia/gk20a \
> +"
> +FILES_${PN}-nvidia-license = "/lib/firmware/LICENCE.nvidia"
                                 ^^^^ nonarch_base_libdir instead?

Thanks,
Quentin
