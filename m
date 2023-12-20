Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C4D5C46CCD
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 07:47:55 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.17302.1703058465480714775
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 23:47:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=DbQWOJnn;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E7C2A40002;
	Wed, 20 Dec 2023 07:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1703058463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FFk7G+BhX/2A8EmIAOnD1tinE4Ef6s0RqnIxieNaIY8=;
	b=DbQWOJnnDlwPoUqHZhCpBz1OvJ0Gb9C185V0W4T/PChfCLktagjtos9lON3x94ZKbBXUVS
	k11iWhCjG3z4cqktjA2pveODpgkXxnhQKfSTygvlieZTmm2sxdZxEeySqIEm8sQfw+m10e
	CsAJksbGoj6Q/QvQqofUIk/zddND5Xz6L1Wnpuv540OU0ubnVEjE0twrJRHe29Bgj/U1Rw
	oO86gdx9WNUZ/GEL9ArCYly68X02wo3QCg5FPOioD69irBe9O3MftcNYzH6baipwAlMBgV
	kXULHbhWVtccj+HRWGzS/jHnbUr6gCSnKBrohrv5ryzbhBOSsbraVEZu68emtQ==
Date: Wed, 20 Dec 2023 08:47:42 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH v2] ipk: Switch to using zstd compression
Message-ID: <20231220074742b34faff8@mail.local>
References: <20231215205140.2948964-1-JPEWhacker@gmail.com>
 <20231218153700.3897302-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231218153700.3897302-1-JPEWhacker@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 07:47:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192778

Hi Josh,

This still causes reproducibility issues:

https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/4113/steps/13/logs/stdio
https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20231219-mrw5vs1g/packages/diff-html/

On 18/12/2023 08:37:00-0700, Joshua Watt wrote:
> Converts IPK package generation to use zstd instead of xz. zstd has a
> much larger compression/speed tradeoff range allowing users to choose
> what suits them best, and fast decompression speeds. It also continues
> to support parallel compression as xz did.
> 
> A new variable called ZSTD_DEFAULTS is provided to set the defaults for
> places that want to use zstd for compression; the zst image conversion
> command is also modified to use this.
> 
> Finally, in order for this to function properly, opkg must include zstd
> support, so it is enabled all the time with no PACKAGECONFIG to turn it
> off.
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/classes-global/package_ipk.bbclass     | 2 +-
>  meta/classes-recipe/image_types.bbclass     | 4 +---
>  meta/conf/bitbake.conf                      | 4 ++++
>  meta/lib/oe/package_manager/ipk/__init__.py | 4 ++--
>  meta/recipes-devtools/opkg/opkg_0.6.2.bb    | 6 +++---
>  5 files changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/meta/classes-global/package_ipk.bbclass b/meta/classes-global/package_ipk.bbclass
> index 71ffdd522ac..025dba49313 100644
> --- a/meta/classes-global/package_ipk.bbclass
> +++ b/meta/classes-global/package_ipk.bbclass
> @@ -15,7 +15,7 @@ IPKGCONF_SDK_TARGET = "${WORKDIR}/opkg-sdk-target.conf"
>  PKGWRITEDIRIPK = "${WORKDIR}/deploy-ipks"
>  
>  # Program to be used to build opkg packages
> -OPKGBUILDCMD ??= 'opkg-build -Z xz -a "${XZ_DEFAULTS}"'
> +OPKGBUILDCMD ??= 'opkg-build -Z zstd -a "${ZSTD_DEFAULTS}"'
>  
>  OPKG_ARGS += "--force_postinstall --prefer-arch-to-version"
>  OPKG_ARGS += "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMENDATIONS") == "1"]}"
> diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/image_types.bbclass
> index d615b41ed1e..3733bdfc20c 100644
> --- a/meta/classes-recipe/image_types.bbclass
> +++ b/meta/classes-recipe/image_types.bbclass
> @@ -63,8 +63,6 @@ ZIP_COMPRESSION_LEVEL ?= "-9"
>  7ZIP_COMPRESSION_METHOD ?= "BZip2"
>  7ZIP_EXTENSION ?= "7z"
>  
> -ZSTD_COMPRESSION_LEVEL ?= "-3"
> -
>  JFFS2_SUM_EXTRA_ARGS ?= ""
>  IMAGE_CMD:jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime --output=${IMGDEPLOYDIR}/${IMAGE_NAME}.jffs2 ${EXTRA_IMAGECMD}"
>  
> @@ -337,7 +335,7 @@ CONVERSION_CMD:lz4 = "lz4 -9 -z -l ${IMAGE_NAME}.${type} ${IMAGE_NAME}.${type}.l
>  CONVERSION_CMD:lzo = "lzop -9 ${IMAGE_NAME}.${type}"
>  CONVERSION_CMD:zip = "zip ${ZIP_COMPRESSION_LEVEL} ${IMAGE_NAME}.${type}.zip ${IMAGE_NAME}.${type}"
>  CONVERSION_CMD:7zip = "7za a -mx=${7ZIP_COMPRESSION_LEVEL} -mm=${7ZIP_COMPRESSION_METHOD} ${IMAGE_NAME}.${type}.${7ZIP_EXTENSION} ${IMAGE_NAME}.${type}"
> -CONVERSION_CMD:zst = "zstd -f -k -T0 -c ${ZSTD_COMPRESSION_LEVEL} ${IMAGE_NAME}.${type} > ${IMAGE_NAME}.${type}.zst"
> +CONVERSION_CMD:zst = "zstd -f -k -c ${ZSTD_DEFAULTS} ${IMAGE_NAME}.${type} > ${IMAGE_NAME}.${type}.zst"
>  CONVERSION_CMD:sum = "sumtool -i ${IMAGE_NAME}.${type} -o ${IMAGE_NAME}.${type}.sum ${JFFS2_SUM_EXTRA_ARGS}"
>  CONVERSION_CMD:md5sum = "md5sum ${IMAGE_NAME}.${type} > ${IMAGE_NAME}.${type}.md5sum"
>  CONVERSION_CMD:sha1sum = "sha1sum ${IMAGE_NAME}.${type} > ${IMAGE_NAME}.${type}.sha1sum"
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 83b12cbc158..b3f1f18a0d7 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -878,6 +878,10 @@ XZ_DEFAULTS[vardepsexclude] += "XZ_MEMLIMIT XZ_THREADS"
>  ZSTD_THREADS ?= "${@oe.utils.cpu_count(at_least=2)}"
>  ZSTD_THREADS[vardepvalue] = "1"
>  
> +ZSTD_COMPRESSION_LEVEL ?= "-3"
> +ZSTD_DEFAULTS ?= "--threads=${ZSTD_THREADS} ${ZSTD_COMPRESSION_LEVEL}"
> +ZSTD_DEFAULTS[vardepsexclude] = "ZSTD_THREADS"
> +
>  # Limit the number of threads that OpenMP libraries will use. Otherwise they
>  # may fallback to using all CPUs
>  export OMP_NUM_THREADS = "${BB_NUMBER_THREADS}"
> diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/package_manager/ipk/__init__.py
> index e6f9c08e2b6..8fcbad56aab 100644
> --- a/meta/lib/oe/package_manager/ipk/__init__.py
> +++ b/meta/lib/oe/package_manager/ipk/__init__.py
> @@ -133,7 +133,7 @@ class OpkgDpkgPM(PackageManager):
>          tmp_dir = tempfile.mkdtemp()
>          current_dir = os.getcwd()
>          os.chdir(tmp_dir)
> -        data_tar = 'data.tar.xz'
> +        data_tar = 'data.tar.zst'
>  
>          try:
>              cmd = [ar_cmd, 'x', pkg_path]
> @@ -505,6 +505,6 @@ class OpkgPM(OpkgDpkgPM):
>                       "trying to extract the package."  % pkg)
>  
>          tmp_dir = super(OpkgPM, self).extract(pkg, pkg_info)
> -        bb.utils.remove(os.path.join(tmp_dir, "data.tar.xz"))
> +        bb.utils.remove(os.path.join(tmp_dir, "data.tar.zst"))
>  
>          return tmp_dir
> diff --git a/meta/recipes-devtools/opkg/opkg_0.6.2.bb b/meta/recipes-devtools/opkg/opkg_0.6.2.bb
> index b2e675ae48b..71c0b44aed0 100644
> --- a/meta/recipes-devtools/opkg/opkg_0.6.2.bb
> +++ b/meta/recipes-devtools/opkg/opkg_0.6.2.bb
> @@ -8,7 +8,7 @@ LICENSE = "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
>                      file://src/opkg.c;beginline=4;endline=18;md5=d6200b0f2b41dee278aa5fad333eecae"
>  
> -DEPENDS = "libarchive"
> +DEPENDS = "libarchive zstd"
>  
>  PE = "1"
>  
> @@ -40,10 +40,10 @@ PACKAGECONFIG[gpg] = "--enable-gpg,--disable-gpg,\
>  PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl"
>  PACKAGECONFIG[ssl-curl] = "--enable-ssl-curl,--disable-ssl-curl,curl openssl"
>  PACKAGECONFIG[sha256] = "--enable-sha256,--disable-sha256"
> -PACKAGECONFIG[zstd] = "--enable-zstd,--disable-zstd,zstd"
>  PACKAGECONFIG[libsolv] = "--with-libsolv,--without-libsolv,libsolv"
>  
> -EXTRA_OECONF:class-native = "--localstatedir=/${@os.path.relpath('${localstatedir}', '${STAGING_DIR_NATIVE}')} --sysconfdir=/${@os.path.relpath('${sysconfdir}', '${STAGING_DIR_NATIVE}')}"
> +EXTRA_OECONF = "--enable-zstd"
> +EXTRA_OECONF:append:class-native = " --localstatedir=/${@os.path.relpath('${localstatedir}', '${STAGING_DIR_NATIVE}')} --sysconfdir=/${@os.path.relpath('${sysconfdir}', '${STAGING_DIR_NATIVE}')}"
>  
>  do_install:append () {
>  	install -d ${D}${sysconfdir}/opkg
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192657): https://lists.openembedded.org/g/openembedded-core/message/192657
> Mute This Topic: https://lists.openembedded.org/mt/103244564/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

