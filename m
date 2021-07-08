Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web09.60.1625766982995947533
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jul 2021 10:56:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id D8BD5E000B;
	Thu,  8 Jul 2021 17:56:19 +0000 (UTC)
Date: Thu, 8 Jul 2021 19:56:19 +0200
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [OE-core] [PATCH] util-linux: Disable chfn-chsh on non-target builds
Message-ID: <YOc8Qzsd/uSFBXci@piout.net>
References: <20210707220530.2494245-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210707220530.2494245-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Khem,

On 07/07/2021 15:05:30-0700, Khem Raj wrote:
> They are also provided by shadow-native e.g. when building native
> recipes and packages where they depend on both shadow-native and
> util-linux-native, this can conflict
> 
> Fixes
> ERROR: systemd-1_248.3-r0 do_prepare_recipe_sysroot: The file /usr/bin/chsh is installed by both util-linux-native and shadow-native, aborting
> 

This breaks poky-tiny and most probably other distros:

https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/3935/steps/12/logs/stdio

configure: error: chfn_chsh selected, but required PAM header file not available


> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-core/util-linux/util-linux_2.37.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/util-linux/util-linux_2.37.bb b/meta/recipes-core/util-linux/util-linux_2.37.bb
> index 399f66d6a0..285e182e0f 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.37.bb
> +++ b/meta/recipes-core/util-linux/util-linux_2.37.bb
> @@ -91,7 +91,7 @@ EXTRA_OECONF_append = " --disable-hwclock-gplv3"
>  # build host versions during development
>  #
>  PACKAGECONFIG ?= "pcre2"
> -PACKAGECONFIG_class-target ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
> +PACKAGECONFIG_class-target ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} chfn-chsh"
>  PACKAGECONFIG[pam] = "--enable-su --enable-runuser,--disable-su --disable-runuser, libpam,"
>  # Respect the systemd feature for uuidd
>  PACKAGECONFIG[systemd] = "--with-systemd --with-systemdsystemunitdir=${systemd_system_unitdir}, --without-systemd --without-systemdsystemunitdir,systemd"
> @@ -102,6 +102,7 @@ PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
>  # PCRE support in hardlink
>  PACKAGECONFIG[pcre2] = ",,libpcre2"
>  PACKAGECONFIG[cryptsetup] = "--with-cryptsetup,--without-cryptsetup,cryptsetup"
> +PACKAGECONFIG[chfn-chsh] = "--enable-chfn-chsh,--disable-chfn-chsh,"
>  
>  EXTRA_OEMAKE = "ARCH=${TARGET_ARCH} CPU= CPUOPT= 'OPT=${CFLAGS}'"
>  
> -- 
> 2.32.0
> 

> 
> 
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
