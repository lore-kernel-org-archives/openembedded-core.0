Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 24E0065E94
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 07:29:34 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id et14so1437327pad.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 00:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=C3ksyiRtsWHSh+ocmUm6ezc6bq5UxUVTXZWP3g3EPJo=;
	b=Nq8YpMV0M+y49bJkWfiznJ482LJXda3I2I0c1PkEyTiBH7dSMRw/ujQV9pS6mi6kUB
	8kt1NIpqp5+Xam+FbmCGm+HeOzuCMaQV08UwC3jlHRCDRk1dMuv/WglvJAtbZH595Cxx
	rTXAbBRjUX9eBZM2elxQPe2gmiBmQwYDK3zs8ig98pjCb3/YyCMwGZsvIWLTzAgvDqxU
	uLR1lKxO7e+ZYQDR0V2JwSCuzZhRkBABSs14G0o8bXCAeENkIr29Hj9WwP/fiYBc75Y7
	VsS5Mmdvs6RFmRvnBdNyr58kqdKPsVOb+tILY5RZzIuCLZPGq7gMqTNj4XGfak4qj8+4
	kHjg==
X-Received: by 10.70.96.142 with SMTP id ds14mr2944608pdb.45.1409210975997;
	Thu, 28 Aug 2014 00:29:35 -0700 (PDT)
Received: from haswell ([2601:9:3580:7a5:baca:3aff:fe80:aa8f])
	by mx.google.com with ESMTPSA id qn7sm2664121pbc.14.2014.08.28.00.29.35
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Aug 2014 00:29:35 -0700 (PDT)
Date: Thu, 28 Aug 2014 00:33:15 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <20140828073315.GF13139@haswell>
References: <53FDB8B5.8030802@windriver.com>
MIME-Version: 1.0
In-Reply-To: <53FDB8B5.8030802@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: Question about aarch64 target
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Aug 2014 07:29:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On 14-08-27 18:53:41, Kang Kai wrote:
> Hi Saul,
> 
> I am working on Bug 6487 - Add Aarch64 qemu target. I take tune and config
> files from linaro then succeeds to build core-image-minimal and
> core-image-sato.
> 
> And I have 2 question about it now:
> 1 What should the new qemu aarch64 bsp looks like at the end? Do the files
> in the patch attached are enough? And what more test should we do except to
> build images such as core-image-sato, core-image-sato even build world?
> 

may be eventually support linux-yocto, and linux-linaro both, it should
be tested at same level as other QEMU BSPs

> 2 There 2 aarch64 configure files from linaro. First one is little endian
> and it is as default, and the other one is big endian. I take the little
> endian one as qemuarm64.conf as linaro does. Do we need add the other one as
> qemuarm64_be.conf or something like that?

Name them same as meta-linaro please, so eventually linaro layer can
drop it and take up the maintenance of them in OE-Core

> 
> -- 
> Regards,
> Neil | Kai Kang
> 

> From e20a3e1252d895c2098fc99d7a0b8ff42ec2c439 Mon Sep 17 00:00:00 2001
> From: Kai Kang <kai.kang@windriver.com>
> Date: Fri, 22 Aug 2014 10:46:10 +0800
> Subject: [PATCH] add qemu aarch64
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/conf/machine/genericarmv8.conf          | 37 ++++++++++++++++++++++++++
>  meta/conf/machine/genericarmv8b.conf         |  8 ++++++
>  meta/conf/machine/include/arm/arch-armv8.inc | 20 ++++++++++++++
>  meta/conf/machine/qemuarm64.conf             | 39 ++++++++++++++++++++++++++++
>  4 files changed, 104 insertions(+)
>  create mode 100644 meta/conf/machine/genericarmv8.conf
>  create mode 100644 meta/conf/machine/genericarmv8b.conf
>  create mode 100644 meta/conf/machine/include/arm/arch-armv8.inc
>  create mode 100644 meta/conf/machine/qemuarm64.conf
> 
> diff --git a/meta/conf/machine/genericarmv8.conf b/meta/conf/machine/genericarmv8.conf
> new file mode 100644
> index 0000000..1d05238
> --- /dev/null
> +++ b/meta/conf/machine/genericarmv8.conf
> @@ -0,0 +1,37 @@
> +#@TYPE: Machine
> +#@NAME: generic armv8 machine
> +#@DESCRIPTION: generic machine to be used by linaro-media-create
> +
> +require conf/machine/include/arm64/arch-armv8.inc
> +
> +PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
> +
> +XSERVER ?= "xserver-xorg \
> +            mesa-driver-swrast \
> +            xf86-input-evdev \
> +            xf86-input-mouse \
> +            xf86-video-fbdev \
> +            xf86-input-keyboard"
> +
> +MACHINE_FEATURES = ""
> +
> +# Don't include kernels in standard images
> +RDEPENDS_kernel-base = ""
> +
> +PREFERRED_PROVIDER_virtual/kernel ?= "linux-linaro"
> +
> +KERNEL_IMAGETYPE = "Image"
> +
> +# We have to disable SERIAL_CONSOLE due to auto-serial-console
> +#SERIAL_CONSOLE = "115200 ttyAMA0"
> +
> +# Force auto-serial-console to be used by all image types
> +# Ideally this would be part of core oe or as a bbclassappend,
> +# but as we don't have an easy way to append a class, defining
> +# it here
> +EXTRA_IMAGE_FEATURES += "autoserial"
> +FEATURE_PACKAGES_autoserial = "auto-serial-console"
> +
> +# we do not want to have getty running on tty1 as we run
> +# auto-serial-console there
> +USE_VT = "0"
> diff --git a/meta/conf/machine/genericarmv8b.conf b/meta/conf/machine/genericarmv8b.conf
> new file mode 100644
> index 0000000..e70de08
> --- /dev/null
> +++ b/meta/conf/machine/genericarmv8b.conf
> @@ -0,0 +1,8 @@
> +#@TYPE: Machine
> +#@NAME: generic armv8 big endian machine
> +#@DESCRIPTION: generic machine to be used by linaro-media-create
> +DEFAULTTUNE = "aarch64_be"
> +
> +PREFERRED_PROVIDER_virtual/kernel ?= "linux-dummy"
> +
> +require conf/machine/genericarmv8.conf
> diff --git a/meta/conf/machine/include/arm/arch-armv8.inc b/meta/conf/machine/include/arm/arch-armv8.inc
> new file mode 100644
> index 0000000..c86142a
> --- /dev/null
> +++ b/meta/conf/machine/include/arm/arch-armv8.inc
> @@ -0,0 +1,20 @@
> +DEFAULTTUNE ?= "aarch64"
> +
> +ARMPKGARCH ?= "aarch64"
> +
> +TUNEVALID[aarch64] = "Enable instructions for aarch64"
> +TUNEVALID[bigendian] = "Enable big-endian mode."
> +TUNECONFLICTS[aarch64] = ""
> +MACHINEOVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "aarch64", ":aarch64", "" ,d)}"
> +
> +# Little Endian base configs
> +AVAILTUNES += "aarch64 aarch64_be"
> +TUNE_FEATURES_tune-aarch64 ?= "aarch64"
> +TUNE_FEATURES_tune-aarch64_be ?= "${TUNE_FEATURES_tune-aarch64} bigendian"
> +
> +ARMPKGSFX_ENDIAN = "${@bb.utils.contains("TUNE_FEATURES", "bigendian", "_be", "", d)}"
> +
> +TUNE_ARCH = "aarch64${ARMPKGSFX_ENDIAN}"
> +TUNE_PKGARCH = "aarch64${ARMPKGSFX_ENDIAN}"
> +
> +PACKAGE_EXTRA_ARCHS = "aarch64${ARMPKGSFX_ENDIAN}"
> diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
> new file mode 100644
> index 0000000..eca99f7
> --- /dev/null
> +++ b/meta/conf/machine/qemuarm64.conf
> @@ -0,0 +1,39 @@
> +#@TYPE: Machine
> +#@NAME: generic armv8 machine
> +#@DESCRIPTION: generic machine to be used by linaro-media-create
> +
> +require conf/machine/include/arm/arch-armv8.inc
> +
> +PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
> +
> +XSERVER ?= "xserver-xorg \
> +            mesa-driver-swrast \
> +            xf86-input-evdev \
> +            xf86-input-mouse \
> +            xf86-video-fbdev \
> +            xf86-input-keyboard"
> +
> +MACHINE_FEATURES = ""
> +
> +# Don't include kernels in standard images
> +RDEPENDS_kernel-base = ""
> +
> +PREFERRED_PROVIDER_virtual/kernel ?= "linux-linaro"
> +
> +KERNEL_IMAGETYPE = "Image"
> +
> +# We have to disable SERIAL_CONSOLE due to auto-serial-console
> +#SERIAL_CONSOLE = "115200 ttyAMA0"
> +
> +# Force auto-serial-console to be used by all image types
> +# Ideally this would be part of core oe or as a bbclassappend,
> +# but as we don't have an easy way to append a class, defining
> +# it here
> +#EXTRA_IMAGE_FEATURES += "autoserial"
> +#FEATURE_PACKAGES_autoserial = "auto-serial-console"
> +
> +# we do not want to have getty running on tty1 as we run
> +# auto-serial-console there
> +USE_VT = "0"
> +
> +baselib="lib64"
> -- 
> 1.9.1
> 

> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


