Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0D78C43219
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 22:22:38 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.2599.1668378157150517366
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Nov 2022 14:22:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kxlg/obJ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id BA825E0003;
	Sun, 13 Nov 2022 22:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668378155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CXsZDblGPuW4RVwIDmj8DlPg1i3ZWfN1TCHCzpxrGWc=;
	b=kxlg/obJi3OsGs3DV6wM4j2LnZ1Nxo429a6n135cNbKyWAaa5EjtCloiQgXNkug4qTebl2
	vZRzBt2mk+I0EQhzKS+TCoF4sDUemFWLzz//YQL54zBRpWIvYude31mv57w2qPZHArl5u6
	WGbc0bIBaPrEwC3rKeYupuzPKMMgg5YArs4wtf+ZN1OI6msw1O7D7drODag2cI5Ix4jDW/
	yXHMOSaz9l+A3TgvvNIoR2aHUVWUaySeRjT8gMihtoweNRn5wmwtyy0cIpoC09JZAIginS
	+pH0DAdU5/CqGncA1kKI5ZLX7UdVyv2Lenyw6vapb5pAegq/wnfcLxxPBuq8Rw==
Date: Sun, 13 Nov 2022 23:22:34 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: jorcrous@amazon.com
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: Re: [OE-core] [PATCH v2 3/3] vulkan-validation: Add the official
 Vulkan validation layers
Message-ID: <Y3FuKrS1+t7pYcFb@mail.local>
References: <20221111214714.9939-1-jorcrous@amazon.com>
 <20221111214714.9939-4-jorcrous@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111214714.9939-4-jorcrous@amazon.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 22:22:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173213

Hello,

This was actually the version I tested and that failed on the
autobuilders.

On 11/11/2022 21:47:14+0000, Jordan Crouse via lists.openembedded.org wrote:
> Add a recipe to build the Khronos official Vulkan validation layers that can
> assist developers in verifying that their applications correctly use the
> Vulkan APIs.
> 
> USE_ROBIN_HOOD_HASHING=OFF disables a third party dependency on [1] which
> is a performant reimplementation of std::unordered_map and
> std::unordered_set that gives better performance when using validation for
> extremely heavy workloads on a desktop. There isn't much benefit to
> enabling it on most embedded systems so force it off for now but no bias
> against making it optional if robin-hood-hashing is made available in the
> metadata.
> 
> [1] https://github.com/martinus/robin-hood-hashing
> 
> Signed-off-by: Jordan Crouse <jorcrous@amazon.com>
> ---
> 
> Changes in v2:
> - Put DEPENDS all on one line
> - Remove unused OEMAKE flags
> - Force /usr/lib/*.so into ${PN} and remove INSANE_SKIP
> 
>  meta/conf/distro/include/maintainers.inc      |  1 +
>  .../vulkan/vulkan-validation_1.3.231.1.bb     | 39 +++++++++++++++++++
>  2 files changed, 40 insertions(+)
>  create mode 100644 meta/recipes-graphics/vulkan/vulkan-validation_1.3.231.1.bb
> 
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index 5b7ce77c3c..8f319c63a7 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -810,6 +810,7 @@ RECIPE_MAINTAINER:pn-vulkan-headers = "Anuj Mittal <anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER:pn-vulkan-loader = "Anuj Mittal <anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER:pn-vulkan-samples = "Ross Burton <ross.burton@arm.com>"
>  RECIPE_MAINTAINER:pn-vulkan-tools = "Anuj Mittal <anuj.mittal@intel.com>"
> +RECIPE_MAINTAINER:pn-vulkan-validation = "Jordan Crouse <jorcrous@amazon.com>"
>  RECIPE_MAINTAINER:pn-waffle = "Ross Burton <ross.burton@arm.com>"
>  RECIPE_MAINTAINER:pn-watchdog = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER:pn-watchdog-config = "Alexander Kanavin <alex.kanavin@gmail.com>"
> diff --git a/meta/recipes-graphics/vulkan/vulkan-validation_1.3.231.1.bb b/meta/recipes-graphics/vulkan/vulkan-validation_1.3.231.1.bb
> new file mode 100644
> index 0000000000..37becb1d16
> --- /dev/null
> +++ b/meta/recipes-graphics/vulkan/vulkan-validation_1.3.231.1.bb
> @@ -0,0 +1,39 @@
> +SUMMARY = "Vulkan Validation layers"
> +DESCRIPTION = "Khronos official Vulkan validation layers to assist developers \
> +in verifying that their applications correctly use the Vulkan API"
> +HOMEPAGE = "https://www.khronos.org/vulkan/"
> +BUGTRACKER = "https://github.com/KhronosGroup/Vulkan-ValidationLayers"
> +SECTION = "libs"
> +
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8df9e8826734226d08cb412babfa599c"
> +SRC_URI = "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=sdk-1.3.231;protocol=https"
> +
> +SRCREV="f489610de566df6a5c20de1a3e54776e0ad852e1"
> +
> +S = "${WORKDIR}/git"
> +
> +REQUIRED_DISTRO_FEATURES = "vulkan"
> +
> +inherit cmake features_check pkgconfig
> +
> +DEPENDS += "vulkan-headers spirv-headers spirv-tools vulkan-loader glslang"
> +
> +EXTRA_OECMAKE = "\
> +                 -DBUILD_TESTS=OFF \
> +                 -DPYTHON_EXECUTABLE=${HOSTTOOLS_DIR}/python3 \
> +                 -DVULKAN_HEADERS_INSTALL_DIR=${STAGING_EXECPREFIXDIR} \
> +                 -DGLSLANG_INSTALL_DIR=${STAGING_DATADIR} \
> +                 -DSPIRV_HEADERS_INSTALL_DIR=${STAGING_EXECPREFIXDIR} \
> +                 -DUSE_ROBIN_HOOD_HASHING=OFF \
> +                 "
> +
> +PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d)}"
> +
> +PACKAGECONFIG[x11] = "-DBUILD_WSI_XLIB_SUPPORT=ON -DBUILD_WSI_XCB_SUPPORT=ON, -DBUILD_WSI_XLIB_SUPPORT=OFF -DBUILD_WSI_XCB_SUPPORT=OFF, libxcb libx11 libxrandr"
> +PACKAGECONFIG[wayland] = "-DBUILD_WSI_WAYLAND_SUPPORT=ON, -DBUILD_WSI_WAYLAND_SUPPORT=OFF, wayland"
> +
> +FILES:${PN} = "${libdir}/*.so ${datadir}/vulkan"
> +FILES:${PN}-dev = ""
> +
> +UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
> -- 
> 2.37.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173144): https://lists.openembedded.org/g/openembedded-core/message/173144
> Mute This Topic: https://lists.openembedded.org/mt/94969329/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

