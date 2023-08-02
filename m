Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 124D1C001E0
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 13:41:39 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.15280.1690983695159907296
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 06:41:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KdUo4eXq;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 366E82000C;
	Wed,  2 Aug 2023 13:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690983693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FCBZeZLwLBojlwd8CQIKl+tv4FiRKcVSaHNWG83SwpA=;
	b=KdUo4eXq20UyhcSbGoKeg4k83b6UMj58EPLB89BAHVZSr6s51YaBLt9nEeEezSAqr/mzrg
	EjM2h7v9UM97vG+yQiH25x/1zM9eaX4IbjDY+EPgSecUQfyY3hvMvfhv2fA27Bpy/iv7b0
	XGhTsyHXFfJTLVegbktdThN6tIsoeryRRQng64kZqHbhE8sivTSkmOujc1DmtHpUiwt7B0
	UfXo48NfUlyfVxU9Ae//zUmyvSEvXkLUGsh8y+4pZ8/hdd91SLXhiivhsJZXdk2AMiivGy
	HknKyVu9JYQhuav4378S5Ddftq7HknDU5jJqdvStkwPnmZCaLwvfi+HyyVsjTA==
Date: Wed, 2 Aug 2023 15:41:31 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Zoltan Boszormenyi <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Ross Burton <Ross.Burton@arm.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v6] rpm: Allow setting platform macro settings
 externally
Message-ID: <20230802134131db3e0b1e@mail.local>
References: <20230801132957.401557-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230801132957.401557-1-zboszor@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 13:41:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185399

Hello,

This causes
sstatetests.SStateHashSameSigs3.test_sstate_sametune_samesigs to fail:

https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/5572/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5538/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5547/steps/15/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/5495/steps/14/logs/stdio

On 01/08/2023 15:29:57+0200, Zoltan Boszormenyi wrote:
> Feed platform settings to installplatform externally. Based on the patch
> submitted under https://github.com/rpm-software-management/rpm/pull/2585
> 
> Patch against INSTALL was backported for rpm 4.18.1
> 
> Signed-off-by: Zolt�n B�sz�rm�nyi <zboszor@gmail.com>
> ---
>  ...atform-macro-settings-externally-258.patch | 119 ++++++++++++++++++
>  meta/recipes-devtools/rpm/rpm_4.18.1.bb       |  20 +++
>  2 files changed, 139 insertions(+)
>  create mode 100644 meta/recipes-devtools/rpm/files/0001-Allow-setting-platform-macro-settings-externally-258.patch
> 
> diff --git a/meta/recipes-devtools/rpm/files/0001-Allow-setting-platform-macro-settings-externally-258.patch b/meta/recipes-devtools/rpm/files/0001-Allow-setting-platform-macro-settings-externally-258.patch
> new file mode 100644
> index 0000000000..a32ce38533
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/files/0001-Allow-setting-platform-macro-settings-externally-258.patch
> @@ -0,0 +1,119 @@
> +From e58c607dcdb303ff3ba1b22fd23eb20e374b6ed3 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?=
> + <zboszor@gmail.com>
> +Date: Fri, 28 Jul 2023 12:16:56 +0200
> +Subject: [PATCH] Allow setting platform macro settings externally (#2585)
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +* Allow setting platform macro settings externally
> +
> +By default, rpm installs a series of default platforms based on
> +the CPU architecture names in subdirectories called
> +
> +    /usr/lib/platform/<arch>-<os>
> +
> +This is enough for regular Linux distributions. However, some
> +distributions may use more specific platform names that refer to
> +particular computer systems, like SBCs or specific CPU tuning when
> +compiling.
> +
> +If the platform subdirectory does not exist in /usr/lib/platform
> +then rpmbuild does not work.
> +
> +Allow creating such custom platform subdirectory with feeding
> +the necessary data using external variables: RPM_CUSTOM_ARCH,
> +RPM_CUSTOM_ISANAME, RPM_CUSTOM_ISABITS, RPM_CUSTOM_CANONARCH
> +and RPM_CUSTOM_CANONCOLOR
> +
> +Signed-off-by: Zolt�n B�sz�rm�nyi <zboszor@gmail.com>
> +Upstream-Status: Backport [https://github.com/rpm-software-management/rpm/commit/fde03ae33d55b160a31a6c54946880dcdf8fd0d6]
> +
> +---------
> +
> +Signed-off-by: Zolt�n B�sz�rm�nyi <zboszor@gmail.com>
> +Co-authored-by: Florian Festi <ffesti@redhat.com>
> +---
> + INSTALL         | 37 +++++++++++++++++++++++++++++++++++++
> + installplatform |  9 ++++++++-
> + 2 files changed, 45 insertions(+), 1 deletion(-)
> +
> +diff --git a/INSTALL b/INSTALL
> +index 13d0d8a83..5e035cf6a 100644
> +--- a/INSTALL
> ++++ b/INSTALL
> +@@ -148,6 +148,43 @@ and then install with:
> + 
> +     make install
> + 
> ++
> ++By default, rpm installs a series of default platforms based on the CPU
> ++architecture names in subdirectories called
> ++
> ++    /usr/lib/platform/<arch>-<os>
> ++
> ++This is enough for many distributions. However, some distributions
> ++may use more specific platform names that refer to particular computer
> ++systems, like SBCs or specific CPU tuning when compiling. Examples of such
> ++platform names are: "genericx86_64", "intel_skylake_64", "raspberrypi_armv7",
> ++"raspberrypi_armv8", etc.
> ++
> ++If the platform name is put into /etc/rpm/platform, then rpmbuild uses it
> ++and the only macros file rpmbuild looks for is
> ++
> ++    /usr/lib/platform/`cat /etc/rpm/platform`-<os>/macros
> ++
> ++If this file does not exist, many rpm macros will not have their expected
> ++values set and e.g. %configure will fail when trying to run rpmbuild.
> ++
> ++To allow creating the macros file for such a custom platform, the shell
> ++variables listed below must be set. If RPM_CUSTOM_ARCH is not set, the rest
> ++is ignored.
> ++
> ++    export RPM_CUSTOM_ARCH=genericx86_64
> ++    export RPM_CUSTOM_ISANAME=x86
> ++    export RPM_CUSTOM_ISABITS=64
> ++    export RPM_CUSTOM_CANONARCH=x86_64
> ++    export RPM_CUSTOM_CANONCOLOR=0 # to use /usr/lib for %_libdir
> ++    export RPM_CUSTOM_CANONCOLOR=3 # to use /usr/lib64 for %_libdir
> ++
> ++    make install 
> ++
> ++This also creates and installs the new platform file e.g.
> ++/usr/lib/platform/genericx86_64-linux/macros
> ++
> ++
> + Rpm comes with an automated self-test suite. The test-suite relies heavily
> + on fakechroot (https://github.com/dex4er/fakechroot/) and cannot be executed
> + without it. Provided that fakechroot was found during configure,
> +diff --git a/installplatform b/installplatform
> +index a5ad7c5b8..59f57697b 100755
> +--- a/installplatform
> ++++ b/installplatform
> +@@ -11,7 +11,7 @@ VENDOR="${4}"
> + OS="${5}"
> + RPMRC_GNU="${6}"
> + 
> +-for ARCH in noarch `grep ^arch_canon $RPMRC | cut -d: -f2`; do
> ++for ARCH in noarch `grep ^arch_canon $RPMRC | cut -d: -f2` ${RPM_CUSTOM_ARCH:+custom}; do
> +   RPMRC_OPTFLAGS="`sed -n 's/^optflags: '$ARCH' //p' $RPMRC`"
> +   RPMRC_OPTFLAGS="`echo $RPMRC_OPTFLAGS | sed -e 's, ,\ ,g'`"
> +   case $RPMRC_OPTFLAGS in
> +@@ -30,6 +30,13 @@ for ARCH in noarch `grep ^arch_canon $RPMRC | cut -d: -f2`; do
> +   CANONCOLOR=
> +   FILTER=cat
> +   case "${ARCH}" in
> ++    custom)
> ++	ARCH=$RPM_CUSTOM_ARCH
> ++	ISANAME=$RPM_CUSTOM_ISANAME
> ++	ISABITS=$RPM_CUSTOM_ISABITS
> ++	CANONARCH=$RPM_CUSTOM_CANONARCH
> ++	CANONCOLOR=$RPM_CUSTOM_CANONCOLOR
> ++    ;;
> +     sparc64*) 
> + 	ISANAME=sparc
> + 	ISABITS=64
> +-- 
> +2.41.0
> +
> diff --git a/meta/recipes-devtools/rpm/rpm_4.18.1.bb b/meta/recipes-devtools/rpm/rpm_4.18.1.bb
> index 95a9e92f96..0b8ebebb51 100644
> --- a/meta/recipes-devtools/rpm/rpm_4.18.1.bb
> +++ b/meta/recipes-devtools/rpm/rpm_4.18.1.bb
> @@ -40,6 +40,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.18.x;protoc
>             file://0001-python-Use-Py_hash_t-instead-of-long-in-hdr_hash.patch \
>             file://fix-declaration.patch \
>             file://ea3187cfcf9cac87e5bc5e7db79b0338da9e355e.patch \
> +           file://0001-Allow-setting-platform-macro-settings-externally-258.patch \
>             "
>  
>  PE = "1"
> @@ -128,10 +129,29 @@ do_install:append:class-nativesdk() {
>  	EOF
>  }
>  
> +def rpm_isaname(d):
> +    import re
> +    arch = d.getVar('TARGET_ARCH')
> +    if re.match("^i.86$", arch) or re.match("^x86.*64$", arch):
> +        return "x86"
> +    # Add more platform tweaks for ISANAME as needed
> +    return arch
> +
> +# Add the custom BSP platform "macros" file
> +do_install:prepend:class-target() {
> +    export RPM_CUSTOM_ARCH="${MACHINE_ARCH}"
> +    export RPM_CUSTOM_ISANAME="${@rpm_isaname(d)}"
> +    export RPM_CUSTOM_ISABITS="${SITEINFO_BITS}"
> +    export RPM_CUSTOM_CANONARCH="${TARGET_ARCH}"
> +    # CANONCOLOR determines whether /usr/lib or /usr/lib64 is used for a 64-bit platform
> +    export RPM_CUSTOM_CANONCOLOR="${@bb.utils.contains('DISTRO_FEATURES', 'multilib', '3', '0', d)}"
> +}
> +
>  # Rpm's make install creates var/tmp which clashes with base-files packaging
>  do_install:append:class-target() {
>      rm -rf ${D}/var
>  }
> +
>  do_install:append:class-nativesdk() {
>      rm -rf ${D}${SDKPATHNATIVE}/var
>      # Ensure find-debuginfo is located correctly inside SDK
> -- 
> 2.41.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185245): https://lists.openembedded.org/g/openembedded-core/message/185245
> Mute This Topic: https://lists.openembedded.org/mt/100483574/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

